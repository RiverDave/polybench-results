PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `7a94fd56356d`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-s2-armA/runtime-cuda-sm_86-j1-merge`
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
- timestamp utc: `2026-09-13T05:57:15+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 1.6449 | 0.0012 | 1.6437 | 1.6550 | 0.0012 | 1.6538 | 0.999 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 0.3125 | 0.0573 | 0.2552 | 0.3201 | 0.0573 | 0.2628 | 1.000 | 38.3 KiB | 38.3 KiB |
| convolution-3d | CUDA | 1.0907 | 0.0042 | 1.0865 | 1.0966 | 0.0042 | 1.0924 | 0.998 | 26.2 KiB | 26.2 KiB |
| 3mm | CUDA | 0.2268 | 0.0081 | 0.2187 | 0.2275 | 0.0081 | 0.2195 | 1.000 | 42.4 KiB | 42.4 KiB |
| adi | CUDA | 0.2867 | 0.0328 | 0.2539 | 0.2867 | 0.0329 | 0.2538 | 1.002 | 58.5 KiB | 58.5 KiB |
| atax | CUDA | 0.3422 | 0.0089 | 0.3333 | 0.3390 | 0.0089 | 0.3301 | 1.000 | 34.3 KiB | 34.3 KiB |
| bicg | CUDA | 0.3343 | 0.0050 | 0.3293 | 0.3375 | 0.0050 | 0.3324 | 1.000 | 34.3 KiB | 34.3 KiB |
| correlation | CUDA | 7.5482 | 7.2299 | 0.3183 | 7.5411 | 7.2285 | 0.3126 | 1.000 | 50.5 KiB | 50.5 KiB |
| covariance | CUDA | 7.5481 | 7.2363 | 0.3118 | 7.5478 | 7.2357 | 0.3121 | 1.000 | 38.4 KiB | 38.4 KiB |
| doitgen | CUDA | 0.2232 | 0.0048 | 0.2184 | 0.2221 | 0.0048 | 0.2173 | 1.000 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 1.0480 | 0.6863 | 0.3617 | 1.0503 | 0.6863 | 0.3640 | 1.000 | 34.3 KiB | 34.3 KiB |
| gemm | CUDA | 0.2147 | 0.0027 | 0.2120 | 0.2145 | 0.0027 | 0.2118 | 0.999 | 30.2 KiB | 30.2 KiB |
| gemver | CUDA | 0.3402 | 0.0061 | 0.3341 | 0.3336 | 0.0061 | 0.3275 | 1.000 | 38.4 KiB | 38.3 KiB |
| gesummv | CUDA | 0.4954 | 0.0038 | 0.4916 | 0.5058 | 0.0038 | 0.5020 | 1.005 | 30.1 KiB | 30.1 KiB |
| gramschmidt | CUDA | 11.8762 | 11.5239 | 0.3523 | 11.8792 | 11.5242 | 0.3550 | 1.000 | 42.4 KiB | 42.4 KiB |
| jacobi-1d-imper | CUDA | 0.3324 | 0.1308 | 0.2016 | 0.3295 | 0.1295 | 0.2000 | 0.990 | 26.1 KiB | 26.1 KiB |
| jacobi-2d-imper | CUDA | 0.2122 | 0.0010 | 0.2112 | 0.2103 | 0.0010 | 0.2093 | 0.997 | 26.1 KiB | 26.1 KiB |
| lu | CUDA | 0.5628 | 0.2610 | 0.3018 | 0.5548 | 0.2612 | 0.2936 | 1.001 | 30.2 KiB | 30.2 KiB |
| mvt | CUDA | 0.3409 | 0.0089 | 0.3320 | 0.3413 | 0.0089 | 0.3324 | 1.000 | 34.2 KiB | 34.2 KiB |
| syr2k | CUDA | 0.4005 | 0.1593 | 0.2412 | 0.4052 | 0.1618 | 0.2434 | 1.016 | 26.2 KiB | 26.2 KiB |
| syrk | CUDA | 0.3198 | 0.0812 | 0.2386 | 0.3197 | 0.0812 | 0.2385 | 1.000 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0003`

- Validation: `38/42` passed

## Validation failures

- [CIR] `adi` — 11 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 11 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR] `gramschmidt` — execution failed / `/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu`
- [CIR-merge] `gramschmidt` — execution failed / `/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu`
