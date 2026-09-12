PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `7a94fd56356d`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-armC/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `132-145-169-56`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `f5613c4`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git 7a94fd56356deefa9af714839dc33026acadb0cc)`
- timestamp utc: `2026-09-12T23:46:41+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5752 | 0.0004 | 0.5748 | 0.5743 | 0.0004 | 0.5739 | 1.003 | 26.2 KiB | 21.7 KiB |
| 2mm | CUDA | 0.2338 | 0.0054 | 0.2283 | 0.2192 | 0.0024 | 0.2169 | 0.435 | 38.3 KiB | 33.7 KiB |
| convolution-3d | CUDA | 0.3257 | 0.0010 | 0.3247 | 0.3384 | 0.0010 | 0.3374 | 1.006 | 26.2 KiB | 21.6 KiB |
| 3mm | CUDA | 0.2165 | 0.0014 | 0.2152 | 0.2077 | 0.0006 | 0.2071 | 0.432 | 42.4 KiB | 37.7 KiB |
| adi | CUDA | 0.2327 | 0.0162 | 0.2165 | 0.2326 | 0.0159 | 0.2166 | 0.986 | 58.5 KiB | 49.9 KiB |
| atax | CUDA | 0.2442 | 0.0030 | 0.2411 | 0.2677 | 0.0017 | 0.2660 | 0.556 | 34.3 KiB | 25.7 KiB |
| bicg | CUDA | 0.2547 | 0.0024 | 0.2523 | 0.2462 | 0.0010 | 0.2453 | 0.407 | 34.3 KiB | 25.7 KiB |
| correlation | CUDA | 1.9190 | 1.6848 | 0.2342 | 0.6200 | 0.3792 | 0.2407 | 0.225 | 50.5 KiB | 45.8 KiB |
| covariance | CUDA | 1.9272 | 1.6861 | 0.2411 | 0.6433 | 0.3953 | 0.2480 | 0.234 | 38.4 KiB | 29.7 KiB |
| doitgen | CUDA | 0.2338 | 0.0048 | 0.2290 | 0.2304 | 0.0024 | 0.2281 | 0.499 | 30.5 KiB | 34.1 KiB |
| fdtd-2d | CUDA | 0.4322 | 0.1786 | 0.2537 | 0.4522 | 0.1785 | 0.2737 | 1.000 | 34.3 KiB | 29.8 KiB |
| gemm | CUDA | 0.2066 | 0.0005 | 0.2061 | 0.2060 | 0.0002 | 0.2058 | 0.516 | 30.2 KiB | 21.6 KiB |
| gemver | CUDA | 0.2426 | 0.0027 | 0.2399 | 0.2471 | 0.0013 | 0.2458 | 0.477 | 38.4 KiB | 33.8 KiB |
| gesummv | CUDA | 0.3243 | 0.0018 | 0.3225 | 0.3200 | 0.0014 | 0.3186 | 0.786 | 30.1 KiB | 21.6 KiB |
| gramschmidt | CUDA | 2.7201 | 2.4788 | 0.2413 | 1.4118 | 1.1617 | 0.2500 | 0.469 | 42.4 KiB | 33.8 KiB |
| jacobi-1d-imper | CUDA | 0.3364 | 0.1284 | 0.2080 | 0.3297 | 0.1279 | 0.2017 | 0.996 | 26.1 KiB | 21.6 KiB |
| jacobi-2d-imper | CUDA | 0.2140 | 0.0010 | 0.2130 | 0.2126 | 0.0010 | 0.2116 | 0.994 | 26.1 KiB | 21.6 KiB |
| lu | CUDA | 0.2878 | 0.0507 | 0.2371 | 0.2798 | 0.0504 | 0.2294 | 0.994 | 30.2 KiB | 25.7 KiB |
| mvt | CUDA | 0.2489 | 0.0030 | 0.2459 | 0.2537 | 0.0017 | 0.2521 | 0.548 | 34.2 KiB | 25.7 KiB |
| syr2k | CUDA | 0.2325 | 0.0193 | 0.2132 | 0.2494 | 0.0186 | 0.2308 | 0.962 | 26.2 KiB | 21.6 KiB |
| syrk | CUDA | 0.2291 | 0.0099 | 0.2192 | 0.2294 | 0.0093 | 0.2201 | 0.938 | 30.2 KiB | 21.6 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.6236`

- Validation: `40/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
