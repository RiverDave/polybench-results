PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `7a94fd56356d`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-s2-armB/runtime-cuda-sm_86-j1-merge`
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
- timestamp utc: `2026-09-13T07:06:06+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 1.7008 | 0.0012 | 1.6996 | 1.6928 | 0.0012 | 1.6916 | 1.000 | 26.2 KiB | 21.7 KiB |
| 2mm | CUDA | 0.3111 | 0.0573 | 0.2538 | 0.3119 | 0.0573 | 0.2546 | 1.001 | 38.3 KiB | 33.7 KiB |
| convolution-3d | CUDA | 1.0840 | 0.0042 | 1.0798 | 1.0696 | 0.0042 | 1.0653 | 0.994 | 26.2 KiB | 21.6 KiB |
| 3mm | CUDA | 0.2250 | 0.0081 | 0.2169 | 0.2263 | 0.0081 | 0.2182 | 1.000 | 42.4 KiB | 37.7 KiB |
| adi | CUDA | 0.2858 | 0.0331 | 0.2526 | 0.2864 | 0.0331 | 0.2533 | 1.000 | 58.5 KiB | 53.9 KiB |
| atax | CUDA | 0.3418 | 0.0089 | 0.3329 | 0.3446 | 0.0089 | 0.3357 | 0.999 | 34.3 KiB | 29.7 KiB |
| bicg | CUDA | 0.3392 | 0.0050 | 0.3342 | 0.3325 | 0.0050 | 0.3275 | 1.001 | 34.3 KiB | 29.7 KiB |
| correlation | CUDA | 7.5385 | 7.2309 | 0.3076 | 7.5438 | 7.2313 | 0.3125 | 1.000 | 50.5 KiB | 49.8 KiB |
| covariance | CUDA | 7.5478 | 7.2375 | 0.3103 | 7.5484 | 7.2371 | 0.3113 | 1.000 | 38.4 KiB | 33.7 KiB |
| doitgen | CUDA | 0.2225 | 0.0048 | 0.2178 | 0.2223 | 0.0048 | 0.2175 | 1.002 | 30.5 KiB | 30.1 KiB |
| fdtd-2d | CUDA | 1.0493 | 0.6863 | 0.3630 | 1.0505 | 0.6862 | 0.3643 | 1.000 | 34.3 KiB | 29.8 KiB |
| gemm | CUDA | 0.2129 | 0.0027 | 0.2102 | 0.2158 | 0.0027 | 0.2130 | 1.000 | 30.2 KiB | 25.6 KiB |
| gemver | CUDA | 0.3449 | 0.0061 | 0.3388 | 0.3393 | 0.0061 | 0.3332 | 1.000 | 38.4 KiB | 37.8 KiB |
| gesummv | CUDA | 0.5016 | 0.0038 | 0.4978 | 0.4861 | 0.0038 | 0.4823 | 0.998 | 30.1 KiB | 25.6 KiB |
| gramschmidt | CUDA | 11.8747 | 11.5203 | 0.3544 | 11.8764 | 11.5200 | 0.3565 | 1.000 | 42.4 KiB | 41.8 KiB |
| jacobi-1d-imper | CUDA | 0.3311 | 0.1296 | 0.2015 | 0.3311 | 0.1293 | 0.2018 | 0.998 | 26.1 KiB | 21.6 KiB |
| jacobi-2d-imper | CUDA | 0.2133 | 0.0010 | 0.2123 | 0.2129 | 0.0010 | 0.2119 | 1.009 | 26.1 KiB | 21.6 KiB |
| lu | CUDA | 0.5599 | 0.2610 | 0.2989 | 0.5567 | 0.2609 | 0.2958 | 1.000 | 30.2 KiB | 25.7 KiB |
| mvt | CUDA | 0.3404 | 0.0089 | 0.3315 | 0.3402 | 0.0089 | 0.3313 | 1.000 | 34.2 KiB | 29.7 KiB |
| syr2k | CUDA | 0.4015 | 0.1592 | 0.2422 | 0.4025 | 0.1594 | 0.2430 | 1.001 | 26.2 KiB | 21.6 KiB |
| syrk | CUDA | 0.3175 | 0.0811 | 0.2364 | 0.3175 | 0.0811 | 0.2363 | 1.000 | 30.2 KiB | 25.6 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0002`

- Validation: `38/42` passed

## Validation failures

- [CIR] `adi` — 11 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 11 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR] `gramschmidt` — execution failed / `/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu`
- [CIR-merge] `gramschmidt` — execution failed / `/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu`
