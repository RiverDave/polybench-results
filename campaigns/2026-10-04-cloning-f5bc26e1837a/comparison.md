# Cloning-enabled pointer-facts: accurate A/B

Compiler: `f5bc26e1837a893954e06c75ddfb12222dd35fe9`. External-linkage corpus `2a64b439206537f70278a227103943046d7ba059`; 2MM, 3MM, GEMM, LU.

A=merge with pointer facts/cloning disabled; B=merge with pointer facts/cloning enabled. Other merge stages are held identical. The CIR merge function inliner is absent from this branch schedule; LLVM backend inlining is unchanged.

3 warmups, 8 samples, serialized -j1, all 16 arm/pipeline validation records passed. Confidence intervals: 20,000 independent within-arm bootstrap resamples of the arithmetic-mean GPU-region time ratio (A/B).

| Benchmark | A control (ms) | B cloning (ms) | Speedup A/B | 95% CI | Clones with changed SASS |
|---|---:|---:|---:|---:|---:|
| 2MM | 5.413125 | 2.400625 | 2.255x | [2.253, 2.257] | 2/2 |
| 3MM | 1.381250 | 0.634625 | 2.176x | [2.166, 2.186] | 3/3 |
| GEMM | 0.458375 | 0.253875 | 1.806x | [1.785, 1.824] | 1/1 |
| LU | 49.882625 | 50.043625 | 0.997x | [0.991, 1.003] | 0/2 |

Four-case subset geomean (including LU negative control): **1.724x**, 95% CI [1.718, 1.729]. This is not a whole-PolyBench geomean.

## Controls

- 2MM no-merge free control: A/B=1.0008, CI [0.9994, 1.0023].
- 3MM no-merge free control: A/B=1.0024, CI [0.9984, 1.0072].
- GEMM no-merge free control: A/B=0.9951, CI [0.9903, 1.0003].
- LU no-merge free control: A/B=1.0007, CI [0.9966, 1.0046].

All no-merge control CIs cross 1: True. LU unchanged-SASS control CI crosses 1: True.

Eight original external kernels are retained unchanged; eight new clones carry 20 pointer facts and redirect the proven host launches. Six clone bodies have changed SASS; LU's two do not. The benefit is noalias optimization enabled by cloning, not copying a kernel in itself.

## Publication

- A-control: `nvidia/2026-10-04T10-02Z-cloning-A-control`
- B-cloning: `nvidia/2026-10-04T10-03Z-cloning-B-cloning`

Raw per-run samples, compiler/corpus provenance, exact wrapper/argv, validation results and effect artifacts are preserved. Small-subset, single-session evidence; no generalization to all suites or all GPUs. GPU remains running.
