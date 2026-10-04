#!/usr/bin/env python3
"""Cross-arm layer check for the dereferenceable probe (A control vs B +deref).

For each benchmark: are the cubins byte-identical? the PTX? does the LLVM IR
differ only by the injected attribute (and the ModuleID comment)?  Writes
layer-check.json next to results.jsonl and prints a summary.
"""
import hashlib
import json
import re
import difflib
import importlib.util
from pathlib import Path

H = Path.home()
ROOT = H / 'aa-deref-20261004'
spec = importlib.util.spec_from_file_location('dp', str(H / 'deref-probe.py'))
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)

rows = [json.loads(l) for l in (ROOT / 'results.jsonl').read_text().splitlines()]
STRIP = re.compile(r'dereferenceable\(\d+\) ?')
table = {}
for r in rows:
    b = r['benchmark']
    f = ROOT / 'runs' / b
    row = {'injected': r.get('injected', 0),
           'kernels': r.get('kernels'),
           'stamped_params_planned': r.get('stamped_params_planned'),
           'unresolved': bool(r.get('unresolved_params')),
           'raw_ll_deref_params_a': r.get('raw_ll_deref_params_a'),
           'raw_ll_deref_params_b': r.get('raw_ll_deref_params'),
           'combined_delta_only_deref': r.get('combined_delta_only_deref')}
    if (f / 'A' / 'kernel.cubin').exists():
        row['cubin_equal'] = (hashlib.md5((f / 'A' / 'kernel.cubin').read_bytes()).hexdigest()
                              == hashlib.md5((f / 'B' / 'kernel.cubin').read_bytes()).hexdigest())
        row['ptx_equal'] = (hashlib.md5((f / 'A' / 'kernel.ptx').read_bytes()).hexdigest()
                            == hashlib.md5((f / 'B' / 'kernel.ptx').read_bytes()).hexdigest())
        a = STRIP.sub('', (f / 'A' / 'raw.device.ll').read_text())
        bb = STRIP.sub('', (f / 'B' / 'raw.device.ll').read_text())
        d = [x for x in difflib.unified_diff(a.splitlines(), bb.splitlines(), lineterm='')
             if x.startswith(('+', '-')) and not x.startswith(('+++', '---'))]
        row['raw_ll_strip_identical'] = len(d) == 0
        a = STRIP.sub('', (f / 'A' / 'opt.ll').read_text())
        bb = STRIP.sub('', (f / 'B' / 'opt.ll').read_text())
        d = [x for x in difflib.unified_diff(a.splitlines(), bb.splitlines(), lineterm='')
             if x.startswith(('+', '-')) and not x.startswith(('+++', '---'))
             and 'ModuleID' not in x]
        row['opt_ll_strip_residual_lines'] = len(d)
        ka = set(m.llvm_bodies((f / 'A' / 'opt.ll').read_text()))
        kb = set(m.llvm_bodies((f / 'B' / 'opt.ll').read_text()))
        row['kernel_names_equal'] = ka == kb
        row['deref_in_B_optll'] = len(re.findall(r'dereferenceable\(', (f / 'B' / 'opt.ll').read_text()))
        row['deref_in_A_optll'] = len(re.findall(r'dereferenceable\(', (f / 'A' / 'opt.ll').read_text()))
    row['llvm_opt_changed'] = r.get('llvm_opt_changed', [])
    row['ptx_changed'] = r.get('ptx_changed', [])
    row['sass_changed'] = r.get('sass_changed', [])
    row['regs_changed'] = r.get('regs_changed', [])
    table[b] = row

out = {'benchmarks': table,
       'totals': {
           'benches': len(table),
           'injected_params': sum(v['injected'] for v in table.values()),
           'all_cubin_equal': all(v.get('cubin_equal') for v in table.values()),
           'all_ptx_equal': all(v.get('ptx_equal') for v in table.values()),
           'all_raw_ll_strip_identical': all(v.get('raw_ll_strip_identical') for v in table.values()),
           'all_opt_residual_zero': all(v.get('opt_ll_strip_residual_lines', 1) == 0 for v in table.values()),
           'all_kernel_names_equal': all(v.get('kernel_names_equal') for v in table.values()),
           'any_llvm_opt_changed': any(v['llvm_opt_changed'] for v in table.values()),
           'any_ptx_changed': any(v['ptx_changed'] for v in table.values()),
           'any_sass_changed': any(v['sass_changed'] for v in table.values()),
           'any_regs_changed': any(v['regs_changed'] for v in table.values()),
           'any_unresolved': any(v['unresolved'] for v in table.values()),
       }}
(ROOT / 'layer-check.json').write_text(json.dumps(out, indent=2))
print(json.dumps(out['totals'], indent=2))
for b, v in table.items():
    flags = []
    if not v.get('cubin_equal'):
        flags.append('CUBIN_DIFF')
    if not v.get('ptx_equal'):
        flags.append('PTX_DIFF')
    if not v.get('raw_ll_strip_identical'):
        flags.append('RAW_LL_DIFF')
    if v.get('opt_ll_strip_residual_lines', 1):
        flags.append('OPT_LL_RESIDUAL=%d' % v['opt_ll_strip_residual_lines'])
    if v['llvm_opt_changed'] or v['ptx_changed'] or v['sass_changed'] or v['regs_changed']:
        flags.append('BODY_CHANGE')
    print(f"{b:10s} inj={v['injected']:3d} derefB={v.get('deref_in_B_optll')} "
          f"derefA={v.get('deref_in_A_optll')} {' '.join(flags) if flags else 'clean'}")
print('DONE-LAYER-CHECK')
