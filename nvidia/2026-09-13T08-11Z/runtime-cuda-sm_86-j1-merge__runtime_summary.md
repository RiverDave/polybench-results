PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `7a94fd56356d`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-s2-armC/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `150-136-222-34`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `6a452a3`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git 7a94fd56356deefa9af714839dc33026acadb0cc)`
- timestamp utc: `2026-09-13T08:11:12+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 1.6625 | 0.0012 | 1.6613 | 1.6617 | 0.0012 | 1.6605 | 0.997 | 26.2 KiB | 21.7 KiB |
| 2mm | CUDA | 0.3198 | 0.0573 | 0.2625 | 0.2750 | 0.0193 | 0.2557 | 0.337 | 38.3 KiB | 33.7 KiB |
| convolution-3d | CUDA | 1.0844 | 0.0042 | 1.0802 | 1.0826 | 0.0042 | 1.0784 | 1.003 | 26.2 KiB | 21.6 KiB |
| 3mm | CUDA | 0.2276 | 0.0081 | 0.2195 | 0.2220 | 0.0035 | 0.2184 | 0.437 | 42.4 KiB | 37.7 KiB |
| adi | CUDA | 0.2861 | 0.0330 | 0.2531 | 0.2860 | 0.0325 | 0.2535 | 0.986 | 58.5 KiB | 49.9 KiB |
| atax | CUDA | 0.3406 | 0.0089 | 0.3317 | 0.3340 | 0.0061 | 0.3279 | 0.688 | 34.3 KiB | 25.7 KiB |
| bicg | CUDA | 0.3345 | 0.0050 | 0.3295 | 0.3326 | 0.0021 | 0.3305 | 0.413 | 34.3 KiB | 25.7 KiB |
| correlation | CUDA | 7.5397 | 7.2263 | 0.3134 | 1.4462 | 1.1356 | 0.3106 | 0.157 | 50.5 KiB | 49.8 KiB |
| covariance | CUDA | 7.5428 | 7.2314 | 0.3114 | 1.4411 | 1.1298 | 0.3113 | 0.156 | 38.4 KiB | 33.7 KiB |
| doitgen | CUDA | 0.2232 | 0.0048 | 0.2184 | 0.2199 | 0.0024 | 0.2175 | 0.502 | 30.5 KiB | 34.1 KiB |
| fdtd-2d | CUDA | 1.0633 | 0.6863 | 0.3770 | 1.0454 | 0.6863 | 0.3591 | 1.000 | 34.3 KiB | 29.8 KiB |
| gemm | CUDA | 0.2149 | 0.0027 | 0.2121 | 0.2126 | 0.0012 | 0.2113 | 0.445 | 30.2 KiB | 21.6 KiB |
| gemver | CUDA | 0.3473 | 0.0061 | 0.3412 | 0.3398 | 0.0032 | 0.3366 | 0.517 | 38.4 KiB | 33.8 KiB |
| gesummv | CUDA | 0.5076 | 0.0038 | 0.5038 | 0.5114 | 0.0034 | 0.5080 | 0.901 | 30.1 KiB | 25.6 KiB |
| gramschmidt | CUDA | 11.8822 | 11.5245 | 0.3577 | 5.6550 | 5.2995 | 0.3555 | 0.460 | 42.4 KiB | 37.8 KiB |
| jacobi-1d-imper | CUDA | 0.3332 | 0.1310 | 0.2022 | 0.3314 | 0.1303 | 0.2011 | 0.994 | 26.1 KiB | 21.6 KiB |
| jacobi-2d-imper | CUDA | 0.2117 | 0.0010 | 0.2107 | 0.2124 | 0.0010 | 0.2114 | 0.996 | 26.1 KiB | 21.6 KiB |
| lu | CUDA | 0.5571 | 0.2615 | 0.2956 | 0.5549 | 0.2612 | 0.2938 | 0.999 | 30.2 KiB | 25.7 KiB |
| mvt | CUDA | 0.3441 | 0.0089 | 0.3353 | 0.3412 | 0.0061 | 0.3351 | 0.688 | 34.2 KiB | 25.7 KiB |
| syr2k | CUDA | 0.4042 | 0.1601 | 0.2442 | 0.5973 | 0.3512 | 0.2461 | 2.194 | 26.2 KiB | 21.6 KiB |
| syrk | CUDA | 0.3200 | 0.0815 | 0.2385 | 0.3098 | 0.0740 | 0.2358 | 0.908 | 30.2 KiB | 21.6 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.6321`

- Validation: `38/42` passed

## Validation failures

- [CIR] `adi` — 11 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 11 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR] `gramschmidt` — execution failed / `/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu`
- [CIR-merge] `gramschmidt` — execution failed / `/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu`
