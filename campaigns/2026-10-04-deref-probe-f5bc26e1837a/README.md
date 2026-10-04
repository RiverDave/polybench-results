# Dereferenceable-metadata probe — PolyBench CUDA (LLVM IR / PTX / SASS)

2026-10-04 · compiler `f5bc26e1837a893954e06c75ddfb12222dd35fe9` (`gsoc/aa-kernel-cloning`)
· corpus `2a64b439206537f70278a227103943046d7ba059` · CUDA 12.8.93 · `sm_86` / PTX 8.0 · Lambda A10

**Verdict: adding `llvm.dereferenceable = N : i64` to kernel pointer parameters
changes nothing at any layer on this corpus.** Post-O3 LLVM bodies identical,
PTX byte-identical, cubins byte-identical, register counts identical.

## Design

- **Control A** — shipped merge pipeline (kernel cloning + pointer-facts
  `noalias`), unchanged.
- **Treatment B** — identical, plus `llvm.dereferenceable = N : i64` injected
  into the raw device CIR on the kernel pointer parameters that the
  pointer-facts pass proved. `N` = min `cudaMalloc` size constant across launch
  sites, resolved by constant-folding the allocation size expression in the
  host CIR (attribute reaches the kernel through combine, cloning and split).

Down-chain, both arms (exact commands in `commands.jsonl`, 336 entries):

```
clang++ -fclangir -S -Xclang -emit-cir --cuda-{host,device}-only   (emit)
cir-offload-merge -combine -input=host -input=device -targets=…    (A/B combined CIR)
cir-offload-merge -split                                           (split-back)
clang -cc1 -x cir -fclangir -emit-llvm -disable-llvm-passes -O3    (cir→LLVM)
opt  -passes=default<O3> -verify-each                              (LLVM O3)
llc  -march=nvptx64 -mcpu=sm_86 -mattr=+ptx80 -O3                  (PTX)
ptxas -arch=sm_86 -v · cuobjdump -sass                             (SASS)
```

## Coverage

21/21 benchmarks completed every layer. 94 kernel definitions (47 kernels +
47 `__noalias` clones). 131/131 selected parameters injected, 0 unresolved.
Sizes spot-verified against source constants: CORR/COVAR mean = 8 KiB / data,
symmat = 16 MiB; ADI = 4 MiB ×3; FDTD-2D `_fict_` = 2 000 B, fields = 16 MiB;
2MM = 1024²·4; DOITGEN = 128³·4 + 64 KiB; LU = 2048²·4; …

## Results per layer

| Layer | Result |
|---|---|
| Combined CIR | B differs from A only by the injected attribute (strip-identity residual 0/21) |
| Raw LLVM (pre-opt) | bodies identical; only parameter attributes differ (residual 0/21) |
| LLVM after `-O3` | **0 changed kernel bodies**; attribute present in B opt.ll (2× injected count — original + clone defs), 0 in A |
| PTX (`llc -O3`) | **byte-identical (md5) for all 21 benchmarks** |
| SASS (`ptxas`) | **cubins byte-identical (md5); register counts identical** |
| Compile time (opt / llc / ptxas, median of 5) | within noise (2MM: 29.3/28.9/36.6 vs 29.1/28.7/36.5 ms; 3MM: 40.3/38.6/49.6 vs 40.3/39.1/49.4 ms) |

Per-benchmark table: see `layer-check.json` (`benchmarks` object) and below.

| Benchmark | Kernel defs | Injected params | deref attrs in B opt.ll | cubin = | PTX = | O3 bodies changed |
|---|---:|---:|---:|---|---|---:|
| 2DCONV | 2 | 2 | 4 | yes | yes | 0 |
| 2MM | 4 | 6 | 12 | yes | yes | 0 |
| 3DCONV | 2 | 2 | 4 | yes | yes | 0 |
| 3MM | 6 | 9 | 18 | yes | yes | 0 |
| ADI | 12 | 18 | 36 | yes | yes | 0 |
| ATAX | 4 | 6 | 12 | yes | yes | 0 |
| BICG | 4 | 6 | 12 | yes | yes | 0 |
| CORR | 8 | 10 | 20 | yes | yes | 0 |
| COVAR | 6 | 6 | 12 | yes | yes | 0 |
| DOITGEN | 4 | 6 | 12 | yes | yes | 0 |
| FDTD-2D | 6 | 10 | 20 | yes | yes | 0 |
| GEMM | 2 | 3 | 6 | yes | yes | 0 |
| GEMVER | 6 | 12 | 24 | yes | yes | 0 |
| GESUMMV | 2 | 5 | 10 | yes | yes | 0 |
| GRAMSCHM | 6 | 9 | 18 | yes | yes | 0 |
| JACOBI1D | 4 | 4 | 8 | yes | yes | 0 |
| JACOBI2D | 4 | 4 | 8 | yes | yes | 0 |
| LU | 4 | 2 | 4 | yes | yes | 0 |
| MVT | 4 | 6 | 12 | yes | yes | 0 |
| SYR2K | 2 | 3 | 6 | yes | yes | 0 |
| SYRK | 2 | 2 | 4 | yes | yes | 0 |

## Toy controls (the toolchain does consume the attribute)

Same `opt -passes=default<O3>` build, hand-written IR (`toy-*.ll`):

| Case | Result |
|---|---|
| guarded load, **with** `dereferenceable(4)` | branch removed → `select` (load speculated) |
| guarded load, no `dereferenceable` | branch kept |
| guarded load + store, with `dereferenceable(4)` | branch kept (stores are not speculatable) |

So the null result is corpus-specific, not a broken probe: PolyBench kernels
guard *load+store* bodies behind early-exit conditions, and none of the 131
facts opens a new O3 transformation at this pipeline stage.

## Provenance / reproducibility

- `deref-probe.py` — the probe (emit → inject → combine → split → lower → opt →
  llc → ptxas → cuobjdump; writes per-arm subdirs under `runs/`).
- `deref-layer-check.py` — cross-layer equality table → `layer-check.json`.
- `deref-verify.py` — toy controls, strip-identity across all 21, compile-time
  medians → `verify-output.txt`.
- `results.jsonl` — per-benchmark: selected/resolved/injected params, noalias
  counts, strip-identity flags, changed-body lists, SASS instruction counts,
  register counts. `commands.jsonl` — every command + exit code.
- `runs/<bench>/{A,B}/` — all intermediates: `host.cir`, `device.cir`,
  `raw.device.ll`, `opt.ll`, `kernel.ptx`, `kernel.cubin`, `.cmd/.stdout/.stderr`
  per stage; top-level `A.combined.cir` / `B.combined.cir` / `device.deref.cir`.
- `superseded-v1/` — first pass before the SSA-def-resolution fix (whole-function
  defs vs line-by-line; CIR reuses names across cleanup scopes). It changed
  resolutions for ADI (6→18), CORR (0→10), COVAR and FDTD-2D; **both passes
  show zero codegen delta**, v1 kept only for audit. `deref-fix-test.py` is the
  local regression that diffed v1 vs fixed resolution from the archived inputs.

Boundary: codegen-layer evidence only (no runtime runs), bootstrapped CIR
(built fork's own emitter), no compiler- or benchmark-source changes — the
attribute was injected as text between pipeline stages.
