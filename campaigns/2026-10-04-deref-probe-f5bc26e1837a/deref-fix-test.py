#!/usr/bin/env python3
"""Local regression test for the incremental-defs fix in launch_sites().

Compares NEW resolution (most-recent-def-before-use) against the recorded
results.jsonl from the whole-function-defs run, using the archived inputs.
"""
import json
import importlib.util
from pathlib import Path

ROOT = Path(__file__).resolve().parent
RUNS = ROOT / 'aa-deref-20261004' / 'runs'
spec = importlib.util.spec_from_file_location('dp', str(ROOT / 'deref-probe.py'))
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


def incremental_launch_sites(text):
    """Same contract as launch_sites but defs update line-by-line."""
    sites = {}
    for fname, body in m.split_scopes(text):
        lines = body.splitlines()
        if lines and 'cc(ptx_kernel)' in lines[0]:
            continue
        defs = {}
        malloc_by_slot = {}
        for line in lines:
            mm = m.MALLOC.search(line)
            if mm:
                slot = m.root_slot(mm.group(2), defs)
                size = m.int_of(mm.group(3), defs)
                if slot is not None:
                    malloc_by_slot.setdefault(slot, size)
            lm = m.LAUNCH.search(line)
            if lm:
                args = [a.strip() for a in lm.group(2).split(',') if a.strip()]
                resolved = []
                for a in args:
                    slot = m.root_slot(a, defs)
                    size = malloc_by_slot.get(slot) if slot is not None else None
                    resolved.append((slot, size))
                sites.setdefault(lm.group(3), []).append(resolved)
            # register this line's def LAST: values defined here are visible
            # only to later lines.
            for rx, kind in ((m.CONST, 'const'), (m.ARITH, 'arith'), (m.CAST, 'cast'),
                             (m.LOAD, 'load'), (m.ALLOCA, 'alloca')):
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


old = {r['benchmark']: r for r in
       (json.loads(l) for l in (ROOT / 'aa-deref-20261004' / 'results.jsonl').read_text().splitlines())}

print(f"{'bench':10s} {'old_inj':>7s} {'new_inj':>7s}  new_resolved")
changes = []
for d in sorted(RUNS.iterdir()):
    if not d.is_dir():
        continue
    name = d.name
    host = (d / 'host.raw.cir').read_text()
    comb = (d / 'A.combined.cir').read_text()
    sites = incremental_launch_sites(host)
    ka = m.ptx_kernel_funcs(comb)
    selected = {}
    for kname, args in ka:
        idxs = [m.device_kernel_index(a) for a in args if 'llvm.noalias' in a]
        idxs = [i for i in idxs if i is not None]
        if not idxs:
            continue
        base = kname[:-len('__noalias')] if kname.endswith('__noalias') else kname
        selected.setdefault(base, set()).update(idxs)
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
    new_inj = sum(len(v) for v in sizes.values())
    old_inj = old[name].get('injected', 0)
    flag = '' if old_inj == new_inj and old[name].get('resolved_sizes', {}) == {k: {str(i): v for i, v in dd.items()} for k, dd in sizes.items()} else '  <-- CHANGED'
    print(f'{name:10s} {old_inj:7d} {new_inj:7d}  {json.dumps({k: {str(i): v for i, v in dd.items()} for k, dd in sizes.items()})[:150]}{flag}')
    if flag or old[name].get('unresolved_params', {}) != unresolved:
        changes.append((name, old[name].get('resolved_sizes'), {k: {str(i): v for i, v in dd.items()} for k, dd in sizes.items()},
                        old[name].get('unresolved_params'), unresolved))

print('\nCHANGED benchmarks:', [c[0] for c in changes])
for c in changes:
    print('\n', c[0])
    print('  old_sizes      ', json.dumps(c[1]))
    print('  new_sizes      ', json.dumps(c[2]))
    print('  old_unresolved ', json.dumps(c[3]))
    print('  new_unresolved ', json.dumps(c[4]))
