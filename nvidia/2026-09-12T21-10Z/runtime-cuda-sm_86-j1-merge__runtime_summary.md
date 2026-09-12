PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `b21a0cb9ddee`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-armC/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `193-122-151-66`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `f5613c4`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git b21a0cb9ddee63493082df34764d1f0ce8922c28)`
- timestamp utc: `2026-09-12T21:10:44+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5704 | 0.0004 | 0.5700 | 0.5924 | 0.0004 | 0.5920 | 0.998 | 26.2 KiB | 21.7 KiB |
| 2mm | CUDA | 0.2203 | 0.0054 | 0.2148 | 0.2232 | 0.0024 | 0.2209 | 0.437 | 38.3 KiB | 33.7 KiB |
| convolution-3d | CUDA | 0.3193 | 0.0010 | 0.3183 | 0.3197 | 0.0010 | 0.3188 | 1.001 | 26.2 KiB | 21.6 KiB |
| 3mm | CUDA | 0.2209 | 0.0014 | 0.2195 | 0.2054 | 0.0006 | 0.2048 | 0.430 | 42.4 KiB | 37.7 KiB |
| adi | CUDA | 0.2455 | 0.0163 | 0.2292 | 0.2309 | 0.0159 | 0.2149 | 0.978 | 58.5 KiB | 49.9 KiB |
| atax | CUDA | 0.2615 | 0.0030 | 0.2584 | 0.2462 | 0.0017 | 0.2445 | 0.547 | 34.3 KiB | 25.7 KiB |
| bicg | CUDA | 0.2585 | 0.0024 | 0.2561 | 0.2398 | 0.0010 | 0.2389 | 0.405 | 34.3 KiB | 25.7 KiB |
| correlation | CUDA | 1.9344 | 1.6820 | 0.2524 | 0.5995 | 0.3653 | 0.2342 | 0.217 | 50.5 KiB | 49.8 KiB |
| covariance | CUDA | 1.9176 | 1.6842 | 0.2334 | 0.6269 | 0.3960 | 0.2309 | 0.235 | 38.4 KiB | 29.7 KiB |
| doitgen | CUDA | 0.2223 | 0.0047 | 0.2176 | 0.2267 | 0.0024 | 0.2243 | 0.497 | 30.5 KiB | 30.1 KiB |
| fdtd-2d | CUDA | 0.4437 | 0.1785 | 0.2652 | 0.4379 | 0.1784 | 0.2594 | 1.000 | 34.3 KiB | 29.8 KiB |
| gemm | CUDA | 0.2244 | 0.0005 | 0.2239 | 0.2046 | 0.0002 | 0.2043 | 0.514 | 30.2 KiB | 25.6 KiB |
| gemver | CUDA | 0.2468 | 0.0027 | 0.2441 | 0.2395 | 0.0013 | 0.2382 | 0.477 | 38.4 KiB | 29.8 KiB |
| gesummv | CUDA | 0.3229 | 0.0018 | 0.3212 | 0.3248 | 0.0014 | 0.3234 | 0.778 | 30.1 KiB | 21.6 KiB |
| gramschmidt | CUDA | 2.7312 | 2.4751 | 0.2561 | 1.4258 | 1.1639 | 0.2619 | 0.470 | 42.4 KiB | 33.8 KiB |
| jacobi-1d-imper | CUDA | 0.3550 | 0.1280 | 0.2270 | 0.3363 | 0.1283 | 0.2080 | 1.002 | 26.1 KiB | 21.6 KiB |
| jacobi-2d-imper | CUDA | 0.2125 | 0.0010 | 0.2115 | 0.2131 | 0.0010 | 0.2121 | 1.000 | 26.1 KiB | 21.6 KiB |
| lu | CUDA | 0.2798 | 0.0499 | 0.2299 | 0.2775 | 0.0504 | 0.2271 | 1.010 | 30.2 KiB | 25.7 KiB |
| mvt | CUDA | 0.2545 | 0.0030 | 0.2515 | 0.2529 | 0.0016 | 0.2513 | 0.546 | 34.2 KiB | 25.7 KiB |
| syr2k | CUDA | 0.2571 | 0.0193 | 0.2378 | 0.2385 | 0.0187 | 0.2198 | 0.969 | 26.2 KiB | 21.6 KiB |
| syrk | CUDA | 0.2258 | 0.0100 | 0.2159 | 0.2263 | 0.0093 | 0.2170 | 0.937 | 30.2 KiB | 21.6 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.6218`

- Validation: `41/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
