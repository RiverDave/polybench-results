#!/usr/bin/env python3
"""Standalone verification for the dereferenceable probe run.

(a) toy control pair: does this toolchain exploit dereferenceable at O3?
(b) raw.device.ll strip-identity across all 21 benchmarks
(c) compile-time medians A vs B (opt, llc, ptxas) for 2MM & 3MM
(e) resolved sizes/injections from results.jsonl
"""
import json
import re
import subprocess
import time
import statistics
import shutil
import difflib
from pathlib import Path

home = Path.home(); R = home/'aa-deref-20261004'; BIN = home/'llvm-project/build/bin'
rows = [json.loads(l) for l in (R/'results.jsonl').read_text().splitlines()]

# --- a) toy control pair: WITH vs WITHOUT dereferenceable, plus load+store ---
T = 'define float @probe(ptr noalias align 4{A} %p, i1 %c) {\n' \
    'entry:\n  br i1 %c, label %read, label %exit\n' \
    'read:\n  %v = load float, ptr %p, align 4\n  br label %exit\n' \
    'exit:\n  %r = phi float [ 0.0, %entry ], [ %v, %read ]\n  ret float %r\n}\n'
for nm, attr in (('WITH', ' dereferenceable(4)'), ('WITHOUT', '')):
    t = home/f'toy-{nm}.ll'; t.write_text(T.replace('{A}', attr))
    r = subprocess.run([str(BIN/'opt'), '-mtriple=nvptx64-nvidia-cuda', '-S', '-passes=default<O3>', str(t)], capture_output=True, text=True)
    print('TOY', nm, '->', 'SELECT (branch removed)' if 'select' in r.stdout else 'BRANCH KEPT')
S = 'define void @probe(ptr noalias align 4 dereferenceable(4) %p, ptr noalias align 4 dereferenceable(4) %q, i1 %c) {\n' \
    'entry:\n  br i1 %c, label %write, label %exit\n' \
    'write:\n  %v = load float, ptr %p, align 4\n  store float %v, ptr %q, align 4\n  br label %exit\n' \
    'exit:\n  ret void\n}\n'
t = home/'toy-store.ll'; t.write_text(S)
r = subprocess.run([str(BIN/'opt'), '-mtriple=nvptx64-nvidia-cuda', '-S', '-passes=default<O3>', str(t)], capture_output=True, text=True)
print('TOY load+store (deref) ->', 'BRANCH REMOVED' if 'br i1' not in r.stdout.split('attributes')[0] else 'BRANCH KEPT')

# --- b) raw.device.ll strip identity across all benchmarks ---
STRIP = re.compile(r'dereferenceable\(\d+\) ?')
res = []
for r2 in rows:
    b = r2['benchmark']; d = R/'runs'/b
    a = STRIP.sub('', (d/'A'/'raw.device.ll').read_text())
    bb = STRIP.sub('', (d/'B'/'raw.device.ll').read_text())
    delta = [x for x in difflib.unified_diff(a.splitlines(), bb.splitlines(), lineterm='')
             if x.startswith(('+', '-')) and not x.startswith(('+++', '---'))]
    res.append((b, len(delta)))
print('RAW strip-identity residual:', res)
print('  nonzero:', [t for t in res if t[1] > 0])

# --- c) compile-time A/B on 2MM & 3MM ---
ptxas = shutil.which('ptxas') or '/usr/local/cuda/bin/ptxas'
def run(cmd):
    subprocess.run(cmd, capture_output=True)
for bench in ('2MM', '3MM'):
    d = R/'runs'/bench
    for arm in ('A', 'B'):
        times = {'opt': [], 'llc': [], 'ptxas': []}
        for _ in range(5):
            t0 = time.monotonic(); run([str(BIN/'opt'), '-S', '-mtriple=nvptx64-nvidia-cuda', '-mcpu=sm_86', '-mattr=+ptx80', '-passes=default<O3>', '-verify-each', str(d/arm/'raw.device.ll'), '-o', str(home/'tmp.opt.ll')]); times['opt'].append(time.monotonic()-t0)
            t0 = time.monotonic(); run([str(BIN/'llc'), '-march=nvptx64', '-mcpu=sm_86', '-mattr=+ptx80', '-O3', str(home/'tmp.opt.ll'), '-o', str(home/'tmp.ptx')]); times['llc'].append(time.monotonic()-t0)
            t0 = time.monotonic(); run([ptxas, '-arch=sm_86', '-v', str(home/'tmp.ptx'), '-o', str(home/'tmp.cubin')]); times['ptxas'].append(time.monotonic()-t0)
        print('TIME', bench, arm, {k: round(statistics.median(v)*1000, 1) for k, v in times.items()}, 'ms median x5')

# --- e) resolved sizes sanity ---
for r2 in rows:
    print('RES', r2['benchmark'], 'injected', r2.get('injected'), 'resolved', json.dumps(r2.get('resolved_sizes')))
print('VERIFY-DONE')
