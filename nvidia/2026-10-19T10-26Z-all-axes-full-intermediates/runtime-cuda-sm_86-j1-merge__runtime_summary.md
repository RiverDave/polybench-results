PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `d8b4f7ed0725`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/aa-kernel-cloning-d8b4f7/polybenchGpu`
- Logs: `/home/ubuntu/aa-kernel-cloning-d8b4f7/all-axes-full-intermediates/measured/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `157-151-182-78`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (https://github.com/RiverDave/llvm-project.git d8b4f7ed0725fecae93d90afb7ef58af1d4ee481)`
- timestamp utc: `2026-10-19T09:03:02+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5696 | 0.0004 | 0.5692 | 0.5714 | 0.0004 | 0.5711 | 1.030 | 26.2 KiB | 30.3 KiB |
| 2mm | CUDA | 0.2208 | 0.0054 | 0.2153 | 0.2177 | 0.0017 | 0.2160 | 0.304 | 38.3 KiB | 46.5 KiB |
| convolution-3d | CUDA | 0.3195 | 0.0010 | 0.3186 | 0.3263 | 0.0010 | 0.3253 | 1.016 | 26.2 KiB | 30.3 KiB |
| 3mm | CUDA | 0.2073 | 0.0014 | 0.2060 | 0.2075 | 0.0005 | 0.2070 | 0.349 | 42.4 KiB | 58.6 KiB |
| adi | CUDA | 0.2301 | 0.0162 | 0.2138 | 0.2318 | 0.0159 | 0.2158 | 0.979 | 58.5 KiB | 86.9 KiB |
| atax | CUDA | 0.2407 | 0.0030 | 0.2377 | 0.2899 | 0.0008 | 0.2891 | 0.254 | 34.3 KiB | 42.4 KiB |
| bicg | CUDA | 0.2704 | 0.0024 | 0.2680 | 0.2622 | 0.0007 | 0.2616 | 0.284 | 34.3 KiB | 42.4 KiB |
| correlation | CUDA | 1.9387 | 1.6769 | 0.2617 | 0.4957 | 0.2385 | 0.2572 | 0.142 | 50.5 KiB | 82.7 KiB |
| covariance | CUDA | 1.9342 | 1.6786 | 0.2556 | 0.4906 | 0.2345 | 0.2562 | 0.140 | 38.4 KiB | 54.6 KiB |
| doitgen | CUDA | 0.2593 | 0.0048 | 0.2546 | 0.2793 | 0.0024 | 0.2769 | 0.504 | 30.5 KiB | 46.6 KiB |
| fdtd-2d | CUDA | 0.4868 | 0.1797 | 0.3071 | 0.4917 | 0.1811 | 0.3105 | 1.008 | 34.3 KiB | 42.6 KiB |
| gemm | CUDA | 0.2115 | 0.0005 | 0.2111 | 0.2056 | 0.0002 | 0.2054 | 0.454 | 30.2 KiB | 34.2 KiB |
| gemver | CUDA | 0.2394 | 0.0027 | 0.2367 | 0.2402 | 0.0012 | 0.2390 | 0.458 | 38.4 KiB | 54.6 KiB |
| gesummv | CUDA | 0.3218 | 0.0018 | 0.3200 | 0.3799 | 0.0011 | 0.3788 | 0.633 | 30.1 KiB | 34.2 KiB |
| gramschmidt | CUDA | 2.7035 | 2.4481 | 0.2554 | 1.3345 | 1.0909 | 0.2436 | 0.446 | 42.4 KiB | 66.6 KiB |
| jacobi-1d-imper | CUDA | 0.3317 | 0.1302 | 0.2015 | 0.3297 | 0.1290 | 0.2007 | 0.991 | 26.1 KiB | 30.2 KiB |
| jacobi-2d-imper | CUDA | 0.2124 | 0.0010 | 0.2114 | 0.2121 | 0.0010 | 0.2110 | 1.025 | 26.1 KiB | 30.2 KiB |
| lu | CUDA | 0.2775 | 0.0502 | 0.2273 | 0.2800 | 0.0504 | 0.2297 | 1.003 | 30.2 KiB | 34.4 KiB |
| mvt | CUDA | 0.2405 | 0.0030 | 0.2375 | 0.2397 | 0.0007 | 0.2390 | 0.247 | 34.2 KiB | 42.4 KiB |
| syr2k | CUDA | 0.2314 | 0.0193 | 0.2121 | 0.2204 | 0.0096 | 0.2108 | 0.496 | 26.2 KiB | 30.2 KiB |
| syrk | CUDA | 0.2192 | 0.0100 | 0.2092 | 0.2122 | 0.0027 | 0.2095 | 0.267 | 30.2 KiB | 34.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.4741`

- Validation: `40/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/aa-kernel-cloning-d8b4f7/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 1 mismatches / `/home/ubuntu/aa-kernel-cloning-d8b4f7/polybenchGpu/CUDA/ADI/adi.cu`
