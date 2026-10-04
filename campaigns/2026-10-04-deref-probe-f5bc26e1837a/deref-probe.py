#!/usr/bin/env python3
"""Dereferenceable metadata probe (CIR -> LLVM IR -> PTX -> SASS).

Control A: shipped merge pipeline (cloning + pointer-facts noalias), unchanged.
Treatment B: identical, plus `llvm.dereferenceable = N : i64` on the kernel
pointer params the pointer-facts pass proved, N = cudaMalloc size constant
resolved from host CIR (min across launch sites).

Per benchmark and kernel, reports whether the metadata changes
 1) LLVM IR (pre-opt bodies and post-O3 bodies),
 2) PTX (llc),
 3) SASS (ptxas + cuobjdump), plus register counts.
"""
import json
import re
import subprocess
import sys
from pathlib import Path

H = Path.home()
BIN = H / 'llvm-project/build/bin'
CORPUS = H / 'aa-cloning-f5bc26e1837a-20261004/corpus'
ROOT = H / 'aa-deref-20261004'
TARGETS = 'host-x86_64-unknown-linux-gnu,cuda-nvptx64-nvidia-cuda--sm_86'
DEV = 'nvptx64-nvidia-cuda'
EMIT = [str(BIN / 'clang++'), '-std=c++17', '-O3', '-DNO_CPU_REF', '-fclangir',
        '-S', '-Xclang', '-emit-cir', '--cuda-path=/usr/local/cuda',
        '--cuda-gpu-arch=sm_86', '--gcc-install-dir=/usr/lib/gcc/x86_64-linux-gnu/12',
        '-I' + str(CORPUS / 'common')]

STRIP = re.compile(r'llvm\.dereferenceable = \d+ : i64,?\s*')
DEREF = re.compile(r'dereferenceable\((\d+)\)')


def find_libdevice():
    for c in ('/usr/lib/nvidia-cuda-toolkit/libdevice/libdevice.10.bc',
              '/usr/local/cuda/nvvm/libdevice/libdevice.10.bc',
              '/usr/lib/cuda/nvvm/libdevice/libdevice.10.bc'):
        if Path(c).is_file():
            return Path(c)
    hits = sorted(p for p in Path('/usr').glob('**/libdevice.10.bc'))
    return hits[0] if hits else None


LIBDEVICE = find_libdevice()


def run(cmd, folder, stage, timeout=900):
    p = subprocess.run([str(c) for c in cmd], capture_output=True, text=True,
                       timeout=timeout, cwd=str(folder))
    (folder / (stage + '.cmd')).write_text(' '.join(str(c) for c in cmd) + '\n')
    (folder / (stage + '.stdout')).write_text(p.stdout)
    (folder / (stage + '.stderr')).write_text(p.stderr)
    with (ROOT / 'commands.jsonl').open('a') as f:
        f.write(json.dumps({'stage': stage, 'cmd': [str(c) for c in cmd],
                            'exit': p.returncode}) + '\n')
    if p.returncode:
        raise RuntimeError(f'{stage} exit {p.returncode}: {p.stderr[-1200:]}')
    return p.stdout, p.stderr


# ---------------------------------------------------------------- CIR parsing

CONST = re.compile(r'%([A-Za-z0-9_.]+) = cir\.const #cir\.int<(\d+)>')
ARITH = re.compile(r'%([A-Za-z0-9_.]+) = cir\.(mul|add|sub|shl)(?: nsw| nuw)? %([A-Za-z0-9_.]+), %([A-Za-z0-9_.]+)')
CAST = re.compile(r'%([A-Za-z0-9_.]+) = cir\.cast (\S+) %([A-Za-z0-9_.]+)')
LOAD = re.compile(r'%([A-Za-z0-9_.]+) = cir\.load(?: align\(\d+\))? %([A-Za-z0-9_.]+)')
ALLOCA = re.compile(r'%([A-Za-z0-9_.]+) = cir\.alloca')
MALLOC = re.compile(r'%([A-Za-z0-9_.]+) = cir\.call @(?:_ZL10cudaMallocIfE9cudaErrorPPT_m|cudaMalloc)\(%([A-Za-z0-9_.]+), %([A-Za-z0-9_.]+)\)')
LAUNCH = re.compile(r'cir\.call @([A-Za-z0-9_.]+)\(([^()]*(?:\([^()]*\)[^()]*)*)\) \{cu\.kernel_name = #cir\.cu\.kernel_name<"([^"]+)">')


def split_scopes(text):
    """[(name, body_text)] — CIR function scopes, so SSA names resolve per function."""
    lines = text.splitlines()
    scopes = []
    cur = None
    depth = 0
    for l in lines:
        if cur is None:
            if 'cir.func' in l:
                net = l.count('{') - l.count('}')
                nm = re.search(r'@([^\s(]+)\(', l)
                cur = [nm.group(1) if nm else '?', [l]]
                depth = net
                if depth <= 0:
                    scopes.append((cur[0], '\n'.join(cur[1])))
                    cur = None
                    depth = 0
            continue
        cur[1].append(l)
        depth += l.count('{') - l.count('}')
        if depth <= 0:
            scopes.append((cur[0], '\n'.join(cur[1])))
            cur = None
            depth = 0
    if cur:
        scopes.append((cur[0], '\n'.join(cur[1])))
    return scopes


def build_defs(text):
    defs = {}
    for l in text.splitlines():
        m = CONST.search(l)
        if m:
            defs[m.group(1)] = ('const', int(m.group(2)))
            continue
        m = ARITH.search(l)
        if m:
            defs[m.group(1)] = (m.group(2), m.group(3), m.group(4))
            continue
        m = CAST.search(l)
        if m:
            defs[m.group(1)] = ('cast', m.group(2), m.group(3))
            continue
        m = LOAD.search(l)
        if m:
            defs[m.group(1)] = ('load', m.group(2))
            continue
        m = ALLOCA.search(l)
        if m:
            defs[m.group(1)] = ('alloca',)
    return defs


def int_of(val, defs):
    val = val.lstrip('%')
    seen = 0
    while seen < 60:
        seen += 1
        d = defs.get(val)
        if not d:
            return None
        if d[0] == 'const':
            return d[1]
        if d[0] in ('mul', 'add', 'sub', 'shl'):
            a = int_of(d[1], defs)
            b = int_of(d[2], defs)
            if a is None or b is None:
                return None
            return {'mul': a * b, 'add': a + b, 'sub': a - b, 'shl': a << b}[d[0]]
        if d[0] == 'cast':
            val = d[2]
            continue
        return None
    return None


def root_slot(val, defs):
    val = val.lstrip('%')
    seen = 0
    while seen < 60:
        seen += 1
        d = defs.get(val)
        if not d:
            return None
        if d[0] == 'alloca':
            return val
        if d[0] == 'cast':
            val = d[2].lstrip('%')
            continue
        if d[0] == 'load':
            val = d[1].lstrip('%')
            continue
        return None
    return None


def split_args(argstr):
    return re.split(r',\s*(?=%arg\d+:)', argstr)


def ptx_kernel_funcs(text):
    out = []
    for l in text.splitlines():
        if 'cc(ptx_kernel)' not in l or 'cir.func' not in l:
            continue
        m = re.match(r'\s*cir\.func[^\n]*?@([^\s(]+)\((.*)\)\s*cc\(ptx_kernel\)', l)
        if not m:
            continue
        out.append((m.group(1), split_args(m.group(2))))
    return out


def launch_sites(text):
    """kernel mangled name -> list of per-arg (slot, size) resolved in the
    host function scope that contains the launch.

    Defs are accumulated line-by-line, not for the whole function: CIR reuses
    SSA names across scopes/cleanup regions within one function, so a
    whole-function map resolves uses against later redefinitions.
    """
    sites = {}
    for fname, body in split_scopes(text):
        if 'cc(ptx_kernel)' in body.splitlines()[0]:
            continue
        defs = {}
        malloc_by_slot = {}
        for line in body.splitlines():
            mm = MALLOC.search(line)
            if mm:
                slot = root_slot(mm.group(2), defs)
                size = int_of(mm.group(3), defs)
                if slot is not None:
                    malloc_by_slot.setdefault(slot, size)
            m = LAUNCH.search(line)
            if m:
                args = [a.strip() for a in m.group(2).split(',') if a.strip()]
                resolved = []
                for a in args:
                    slot = root_slot(a, defs)
                    size = malloc_by_slot.get(slot) if slot is not None else None
                    resolved.append((slot, size))
                sites.setdefault(m.group(3), []).append(resolved)
            for rx, kind in ((CONST, 'const'), (ARITH, 'arith'), (CAST, 'cast'),
                             (LOAD, 'load'), (ALLOCA, 'alloca')):
                g = rx.search(line)
                if not g:
                    continue
                if kind == 'const':
                    defs[g.group(1)] = ('const', int(g.group(2)))
                elif kind == 'arith':
                    defs[g.group(1)] = (g.group(2), g.group(3), g.group(4))
                elif kind == 'cast':
                    defs[g.group(1)] = ('cast', g.group(2), g.group(3))
                elif kind == 'load':
                    defs[g.group(1)] = ('load', g.group(2))
                else:
                    defs[g.group(1)] = ('alloca',)
                break
    return sites


def device_kernel_index(a):
    m = re.match(r'%arg(\d+):', a)
    return int(m.group(1)) if m else None


# ---------------------------------------------------------------- injection

def inject(text, kernel, sizes):
    total = 0
    hit = 0
    out_lines = []
    for l in text.splitlines(True):
        if hit == 0 and 'cc(ptx_kernel)' in l and ('@' + kernel + '(') in l:
            m = re.match(r'(.*?@' + re.escape(kernel) + r'\((.*)\)\s*cc\(ptx_kernel\).*)', l)
            if m:
                argstr = m.group(2)
                args = split_args(argstr)
                n = 0
                for idx, size in sizes.items():
                    if idx >= len(args):
                        continue
                    chunk = args[idx]
                    if '{' not in chunk:
                        continue
                    args[idx] = chunk.replace('{', '{llvm.dereferenceable = %d : i64, ' % size, 1)
                    n += 1
                if n:
                    new_argstr = ', '.join(args)
                    out_lines.append(m.group(1).replace(argstr, new_argstr, 1) + '\n')
                    total += n
                    hit = 1
                    continue
        out_lines.append(l)
    return ''.join(out_lines), total


# ---------------------------------------------------------------- artifact parsing

def llvm_bodies(text):
    return {m.group(1): m.group(2) for m in re.finditer(
        r'^define[^\n]*?@([^\s(]+)\([^\n]*\{\n(.*?)^\}', text, re.M | re.S)}


def llvm_instructions(body):
    rows = []
    for line in body.splitlines():
        line = line.split(';', 1)[0].strip()
        if not line or line.endswith(':'):
            continue
        rows.append(re.sub(r'^%[^=]+ = ', '', line))
    return rows


def ptx_bodies(text):
    out = {}
    current = None
    depth = 0
    lines = []
    for line in text.splitlines():
        clean = line.split('//', 1)[0].strip()
        if current is None:
            m = re.search(r'\.(?:entry|func)\s+([^\s(]+)', clean)
            if m:
                current = m.group(1)
                lines = []
                depth = 0
            continue
        if depth == 0 and '{' not in clean:
            continue
        depth += clean.count('{') - clean.count('}')
        if clean:
            lines.append(clean)
        if depth == 0 and lines:
            out[current] = '\n'.join(lines)
            current = None
    return out


def sass_bodies(text):
    out = {}
    current = None
    for line in text.splitlines():
        m = re.search(r'Function\s*:\s*(\S+)', line)
        if m:
            current = m.group(1)
            out[current] = []
            continue
        if current is None:
            continue
        if re.search(r'/\*[0-9a-fA-F]{4,}\*/', line):
            ins = re.sub(r'/\*.*?\*/', '', line).strip()
            if ins:
                out[current].append(ins)
    return {k: '\n'.join(v) for k, v in out.items()}


def ptxas_regs(stderr):
    regs = {}
    for m in re.finditer(r'Function properties for ([^\s]+)', stderr):
        tail = stderr[m.end():m.end() + 800]
        r = re.search(r'Used (\d+) registers', tail)
        if r:
            regs[m.group(1)] = int(r.group(1))
    return regs


def opcount(body):
    counts = {}
    for line in body.splitlines():
        m = re.match(r'(?:@!?%?\w+\s+)?([A-Za-z][\w.]*)', line)
        if m:
            counts[m.group(1)] = counts.get(m.group(1), 0) + 1
    return counts


def save_diff(path, a, b):
    import difflib
    diff = ''.join(difflib.unified_diff(list(a), list(b), 'A-control',
                                        'B-dereferenceable', lineterm=''))
    path.write_text(diff + '\n')


# ---------------------------------------------------------------- per-bench

def bench(source, row):
    name = source.parent.name
    folder = ROOT / 'runs' / name
    folder.mkdir(parents=True, exist_ok=True)
    row['benchmark'] = name
    row['source'] = str(source.relative_to(CORPUS))
    for side in ('host', 'device'):
        run(EMIT + [f'--cuda-{side}-only', str(source), '-o',
                    str(folder / f'{side}.raw.cir')], folder, 'emit-' + side)
    host_text = (folder / 'host.raw.cir').read_text()
    device_text = (folder / 'device.raw.cir').read_text()
    sites = launch_sites(host_text)

    def combine(devfile, outfile, stage):
        run([BIN / 'cir-offload-merge', '-combine',
             '-input=' + str(folder / 'host.raw.cir'), '-input=' + str(devfile),
             '-targets=' + TARGETS, '-output=' + str(outfile)], folder, stage)

    combine(folder / 'device.raw.cir', folder / 'A.combined.cir', 'combine-A')
    combined_a = (folder / 'A.combined.cir').read_text()
    ka = ptx_kernel_funcs(combined_a)
    row['kernels'] = len(ka)
    row['kernel_names'] = sorted(n for n, _ in ka)

    selected = {}
    for kname, args in ka:
        idxs = [device_kernel_index(a) for a in args if 'llvm.noalias' in a]
        idxs = [i for i in idxs if i is not None]
        if not idxs:
            continue
        base = kname[:-len('__noalias')] if kname.endswith('__noalias') else kname
        selected.setdefault(base, set()).update(idxs)
    row['selected_params'] = {k: sorted(v) for k, v in selected.items()}

    sizes = {}
    unresolved = {}
    for base, idxs in selected.items():
        sites_for = sites.get(base, [])
        per_idx = {}
        for i in sorted(idxs):
            vals = []
            ok = bool(sites_for)
            for site in sites_for:
                if i >= len(site) or site[i][1] is None:
                    ok = False
                    break
                vals.append(site[i][1])
            if ok and vals:
                per_idx[i] = min(vals)
            else:
                unresolved.setdefault(base, []).append(i)
        if per_idx:
            sizes[base] = per_idx
    row['resolved_sizes'] = {k: {str(i): v for i, v in d.items()} for k, d in sizes.items()}
    row['unresolved_params'] = unresolved
    row['stamped_params_planned'] = sum(len(v) for v in sizes.values())

    treatment = device_text
    stamped_total = 0
    for base, idxs in sizes.items():
        treatment, n = inject(treatment, base, idxs)
        stamped_total += n
    (folder / 'device.deref.cir').write_text(treatment)
    row['injected'] = stamped_total
    row['inject_strip_identity'] = STRIP.sub('', treatment) == device_text
    assert row['inject_strip_identity'], 'injection not strip-clean'

    combine(folder / 'device.deref.cir', folder / 'B.combined.cir', 'combine-B')
    combined_b = (folder / 'B.combined.cir').read_text()
    # Baseline CIRGen already carries some llvm.dereferenceable (dim3 slots), so
    # compare after stripping the attribute on BOTH arms.
    row['combined_delta_only_deref'] = STRIP.sub('', combined_b) == STRIP.sub('', combined_a)
    row['combined_deref_count'] = len(STRIP.findall(combined_b))
    row['combined_deref_count_a'] = len(STRIP.findall(combined_a))
    row['noalias_a'] = combined_a.count('llvm.noalias')
    row['noalias_b'] = combined_b.count('llvm.noalias')

    # lower both arms to raw LLVM first
    raws = {}
    for arm in ('A', 'B'):
        adir = folder / arm
        adir.mkdir(exist_ok=True)
        run([BIN / 'cir-offload-merge', '-split',
             '-input=' + str(folder / f'{arm}.combined.cir'), '-targets=' + TARGETS,
             '-output=' + str(adir / 'host.cir'), '-output=' + str(adir / 'device.cir')],
            folder, 'split-' + arm)
        run([BIN / 'clang', '-cc1', '-triple', DEV, '-target-cpu', 'sm_86',
             '-target-feature', '+ptx80', '-x', 'cir', '-fclangir', '-emit-llvm',
             '-disable-llvm-passes', '-O3', adir / 'device.cir', '-o', adir / 'raw.device.ll'],
            folder, 'lower-' + arm)
        raws[arm] = (adir / 'raw.device.ll').read_text()

    row['raw_ll_deref_params'] = len(DEREF.findall(
        '\n'.join(l for l in raws['B'].splitlines() if l.startswith('define '))))
    row['raw_ll_deref_params_a'] = len(DEREF.findall(
        '\n'.join(l for l in raws['A'].splitlines() if l.startswith('define '))))
    row['raw_ll_bodies_identical'] = False
    bodies_a = llvm_bodies(raws['A'])
    bodies_b = llvm_bodies(raws['B'])
    if sorted(bodies_a) == sorted(bodies_b):
        row['raw_ll_bodies_identical'] = all(
            llvm_instructions(bodies_a[k]) == llvm_instructions(bodies_b[k])
            for k in bodies_a)

    needs_libdevice = (('__nv_' in raws['A']) or ('__nv_' in raws['B'])) and LIBDEVICE is not None
    row['libdevice_linked'] = bool(needs_libdevice)
    row['libdevice_path'] = str(LIBDEVICE) if LIBDEVICE else ''

    def build_layers(link_libdevice):
        layers = {}
        for arm in ('A', 'B'):
            adir = folder / arm
            if link_libdevice:
                run([BIN / 'llvm-link', str(adir / 'raw.device.ll'), str(LIBDEVICE),
                     '-o', str(adir / 'linked.ll')], folder, 'link-' + arm)
                src = adir / 'linked.ll'
            else:
                src = adir / 'raw.device.ll'
            run([BIN / 'opt', '-S', '-mtriple=' + DEV, '-mcpu=sm_86', '-mattr=+ptx80',
                 '-passes=default<O3>', '-verify-each', src, '-o', adir / 'opt.ll'],
                folder, 'opt-' + arm)
            run([BIN / 'llc', '-march=nvptx64', '-mcpu=sm_86', '-mattr=+ptx80', '-O3',
                 adir / 'opt.ll', '-o', adir / 'kernel.ptx'], folder, 'llc-' + arm)
            _, perr = run(['/usr/bin/ptxas', '-arch=sm_86', '-v', adir / 'kernel.ptx',
                           '-o', adir / 'kernel.cubin'], folder, 'ptxas-' + arm)
            sout, _ = run(['/usr/bin/cuobjdump', '-sass', adir / 'kernel.cubin'],
                          folder, 'sass-' + arm)
            layers[arm] = {'opt_ll': (adir / 'opt.ll').read_text(),
                           'ptx': (adir / 'kernel.ptx').read_text(),
                           'sass': sass_bodies(sout),
                           'regs': ptxas_regs(perr)}
        return layers

    try:
        layers = build_layers(needs_libdevice)
    except RuntimeError:
        if not needs_libdevice and LIBDEVICE is not None:
            needs_libdevice = True
            row['libdevice_linked'] = True
            layers = build_layers(True)
        else:
            raise

    opt_a = llvm_bodies(layers['A']['opt_ll'])
    opt_b = llvm_bodies(layers['B']['opt_ll'])
    common = [k for k in opt_a if k in opt_b]
    row['llvm_opt_changed'] = sorted(
        k for k in common if llvm_instructions(opt_a[k]) != llvm_instructions(opt_b[k]))

    ptx_a = ptx_bodies(layers['A']['ptx'])
    ptx_b = ptx_bodies(layers['B']['ptx'])
    common_p = [k for k in ptx_a if k in ptx_b]
    row['ptx_changed'] = sorted(k for k in common_p if ptx_a[k] != ptx_b[k])
    row['ptx_only_a'] = sorted(set(ptx_a) - set(ptx_b))
    row['ptx_only_b'] = sorted(set(ptx_b) - set(ptx_a))

    sass_a = layers['A']['sass']
    sass_b = layers['B']['sass']
    common_s = [k for k in sass_a if k in sass_b]
    row['sass_changed'] = sorted(k for k in common_s if sass_a[k] != sass_b[k])
    row['sass_only_a'] = sorted(set(sass_a) - set(sass_b))
    row['sass_only_b'] = sorted(set(sass_b) - set(sass_a))
    row['sass_instr'] = {arm: {k: len(v.splitlines()) for k, v in layers[arm]['sass'].items()}
                         for arm in ('A', 'B')}
    row['sass_opcode_delta'] = {}
    for k in row['sass_changed']:
        ca, cb = opcount(sass_a[k]), opcount(sass_b[k])
        delta = {op: cb.get(op, 0) - ca.get(op, 0) for op in set(ca) | set(cb)
                 if cb.get(op, 0) != ca.get(op, 0)}
        if delta:
            row['sass_opcode_delta'][k] = delta
    row['regs'] = {arm: layers[arm]['regs'] for arm in ('A', 'B')}
    row['regs_changed'] = sorted(
        k for k in set(layers['A']['regs']) & set(layers['B']['regs'])
        if layers['A']['regs'][k] != layers['B']['regs'][k])

    for k in row['llvm_opt_changed']:
        save_diff(folder / (k + '.llvm.diff'), llvm_instructions(opt_a[k]),
                  llvm_instructions(opt_b[k]))
    for k in row['ptx_changed']:
        save_diff(folder / (k + '.ptx.diff'), ptx_a[k].splitlines(), ptx_b[k].splitlines())
    for k in row['sass_changed']:
        save_diff(folder / (k + '.sass.diff'), sass_a[k].splitlines(), sass_b[k].splitlines())
    row['status'] = 'ok'
    return row


def main():
    bench_filter = None
    if len(sys.argv) >= 3 and sys.argv[1] == '--bench':
        bench_filter = sys.argv[2]
    sources = sorted((CORPUS / 'CUDA').glob('*/*.cu'))
    if bench_filter:
        sources = [s for s in sources if s.parent.name == bench_filter]
    assert sources, 'no sources for filter'
    rows = []
    for s in sources:
        row = {'benchmark': s.parent.name, 'status': 'failed'}
        try:
            bench(s, row)
        except Exception as e:  # noqa: BLE001
            row['error'] = str(e)
        rows.append(row)
        with (ROOT / 'results.jsonl').open('a') as f:
            f.write(json.dumps(row) + '\n')
        print(json.dumps({k: row.get(k) for k in
                          ('benchmark', 'status', 'kernels', 'stamped_params_planned',
                           'injected', 'raw_ll_deref_params', 'raw_ll_bodies_identical',
                           'llvm_opt_changed', 'ptx_changed', 'sass_changed',
                           'regs_changed', 'error') if k in row}), flush=True)
    ok = sum(r['status'] == 'ok' for r in rows)
    print('DONE', len(rows), 'ok', ok, flush=True)


if __name__ == '__main__':
    main()
