PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `d8b4f7ed0725`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/aa-kernel-cloning-d8b4f7/polybenchGpu`
- Logs: `/home/ubuntu/aa-kernel-cloning-d8b4f7/evaluation/runtime-cuda-sm_86-j1-merge`
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
- timestamp utc: `2026-10-19T08:10:37+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.6994 | 0.0004 | 0.6990 | 0.6980 | 0.0004 | 0.6976 | 1.015 | 26.2 KiB | 30.3 KiB |
| 2mm | CUDA | 0.2910 | 0.0054 | 0.2855 | 0.2843 | 0.0017 | 0.2826 | 0.311 | 38.3 KiB | 46.5 KiB |
| convolution-3d | CUDA | 0.4030 | 0.0010 | 0.4020 | 0.4014 | 0.0010 | 0.4003 | 1.017 | 26.2 KiB | 30.3 KiB |
| 3mm | CUDA | 0.2709 | 0.0014 | 0.2695 | 0.2735 | 0.0005 | 0.2730 | 0.373 | 42.4 KiB | 58.6 KiB |
| adi | CUDA | 0.3000 | 0.0174 | 0.2826 | 0.3013 | 0.0173 | 0.2840 | 0.995 | 58.5 KiB | 86.9 KiB |
| atax | CUDA | 0.3126 | 0.0031 | 0.3095 | 0.3060 | 0.0008 | 0.3052 | 0.262 | 34.3 KiB | 42.4 KiB |
| bicg | CUDA | 0.3010 | 0.0024 | 0.2986 | 0.3052 | 0.0007 | 0.3045 | 0.285 | 34.3 KiB | 42.4 KiB |
| correlation | CUDA | 1.9569 | 1.6768 | 0.2802 | 0.5172 | 0.2383 | 0.2789 | 0.142 | 50.5 KiB | 82.7 KiB |
| covariance | CUDA | 1.9544 | 1.6767 | 0.2777 | 0.5055 | 0.2343 | 0.2712 | 0.140 | 38.4 KiB | 54.6 KiB |
| doitgen | CUDA | 0.2546 | 0.0048 | 0.2497 | 0.2525 | 0.0026 | 0.2499 | 0.544 | 30.5 KiB | 46.6 KiB |
| fdtd-2d | CUDA | 0.4626 | 0.1794 | 0.2832 | 0.4483 | 0.1794 | 0.2689 | 1.000 | 34.3 KiB | 42.6 KiB |
| gemm | CUDA | 0.2363 | 0.0005 | 0.2359 | 0.2379 | 0.0002 | 0.2377 | 0.442 | 30.2 KiB | 34.2 KiB |
| gemver | CUDA | 0.2727 | 0.0027 | 0.2699 | 0.2702 | 0.0012 | 0.2689 | 0.457 | 38.4 KiB | 54.6 KiB |
| gesummv | CUDA | 0.3349 | 0.0018 | 0.3331 | 0.3278 | 0.0011 | 0.3268 | 0.595 | 30.1 KiB | 34.2 KiB |
| gramschmidt | CUDA | 2.7465 | 2.4513 | 0.2952 | 1.3661 | 1.0915 | 0.2746 | 0.445 | 42.4 KiB | 66.6 KiB |
| jacobi-1d-imper | CUDA | 0.3591 | 0.1309 | 0.2282 | 0.3409 | 0.1284 | 0.2125 | 0.981 | 26.1 KiB | 30.2 KiB |
| jacobi-2d-imper | CUDA | 0.2384 | 0.0010 | 0.2374 | 0.2445 | 0.0011 | 0.2434 | 1.046 | 26.1 KiB | 30.2 KiB |
| lu | CUDA | 0.2910 | 0.0505 | 0.2405 | 0.2961 | 0.0505 | 0.2457 | 1.000 | 30.2 KiB | 34.4 KiB |
| mvt | CUDA | 0.2495 | 0.0030 | 0.2465 | 0.2660 | 0.0008 | 0.2652 | 0.254 | 34.2 KiB | 42.4 KiB |
| syr2k | CUDA | 0.2496 | 0.0193 | 0.2303 | 0.2312 | 0.0096 | 0.2217 | 0.496 | 26.2 KiB | 30.2 KiB |
| syrk | CUDA | 0.2198 | 0.0100 | 0.2099 | 0.2140 | 0.0027 | 0.2114 | 0.267 | 30.2 KiB | 34.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.4770`

- Validation: `40/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/aa-kernel-cloning-d8b4f7/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 1 mismatches / `/home/ubuntu/aa-kernel-cloning-d8b4f7/polybenchGpu/CUDA/ADI/adi.cu`
