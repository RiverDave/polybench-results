PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `7a94fd56356d`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-armB/runtime-cuda-sm_86-j1-merge`
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
- timestamp utc: `2026-09-12T23:34:13+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5701 | 0.0004 | 0.5697 | 0.5823 | 0.0004 | 0.5820 | 0.994 | 26.2 KiB | 21.7 KiB |
| 2mm | CUDA | 0.2204 | 0.0054 | 0.2150 | 0.2214 | 0.0054 | 0.2159 | 1.000 | 38.3 KiB | 33.7 KiB |
| convolution-3d | CUDA | 0.3184 | 0.0010 | 0.3175 | 0.3184 | 0.0009 | 0.3175 | 0.991 | 26.2 KiB | 21.6 KiB |
| 3mm | CUDA | 0.2163 | 0.0014 | 0.2150 | 0.2065 | 0.0014 | 0.2051 | 1.001 | 42.4 KiB | 37.7 KiB |
| adi | CUDA | 0.2312 | 0.0162 | 0.2150 | 0.2332 | 0.0163 | 0.2169 | 1.003 | 58.5 KiB | 49.9 KiB |
| atax | CUDA | 0.2397 | 0.0030 | 0.2367 | 0.2397 | 0.0030 | 0.2366 | 0.998 | 34.3 KiB | 25.7 KiB |
| bicg | CUDA | 0.2410 | 0.0024 | 0.2386 | 0.2426 | 0.0024 | 0.2403 | 0.996 | 34.3 KiB | 25.7 KiB |
| correlation | CUDA | 1.9188 | 1.6847 | 0.2342 | 1.9138 | 1.6815 | 0.2323 | 0.998 | 50.5 KiB | 45.8 KiB |
| covariance | CUDA | 1.9193 | 1.6851 | 0.2342 | 1.9245 | 1.6874 | 0.2371 | 1.001 | 38.4 KiB | 29.7 KiB |
| doitgen | CUDA | 0.2244 | 0.0048 | 0.2196 | 0.2260 | 0.0048 | 0.2211 | 1.009 | 30.5 KiB | 30.1 KiB |
| fdtd-2d | CUDA | 0.4316 | 0.1786 | 0.2530 | 0.4252 | 0.1786 | 0.2466 | 1.000 | 34.3 KiB | 29.8 KiB |
| gemm | CUDA | 0.2045 | 0.0005 | 0.2040 | 0.2039 | 0.0005 | 0.2034 | 0.999 | 30.2 KiB | 25.6 KiB |
| gemver | CUDA | 0.2405 | 0.0027 | 0.2378 | 0.2398 | 0.0027 | 0.2372 | 0.995 | 38.4 KiB | 29.8 KiB |
| gesummv | CUDA | 0.3237 | 0.0018 | 0.3220 | 0.3102 | 0.0017 | 0.3085 | 0.969 | 30.1 KiB | 21.6 KiB |
| gramschmidt | CUDA | 2.7340 | 2.4790 | 0.2550 | 2.8167 | 2.5590 | 0.2577 | 1.032 | 42.4 KiB | 33.8 KiB |
| jacobi-1d-imper | CUDA | 0.3753 | 0.1389 | 0.2364 | 0.3553 | 0.1366 | 0.2188 | 0.983 | 26.1 KiB | 21.6 KiB |
| jacobi-2d-imper | CUDA | 0.2471 | 0.0010 | 0.2460 | 0.2289 | 0.0010 | 0.2279 | 0.989 | 26.1 KiB | 21.6 KiB |
| lu | CUDA | 0.3065 | 0.0529 | 0.2536 | 0.3013 | 0.0523 | 0.2490 | 0.989 | 30.2 KiB | 25.7 KiB |
| mvt | CUDA | 0.2925 | 0.0030 | 0.2895 | 0.2951 | 0.0030 | 0.2921 | 0.996 | 34.2 KiB | 25.7 KiB |
| syr2k | CUDA | 0.2532 | 0.0193 | 0.2339 | 0.2663 | 0.0193 | 0.2470 | 1.000 | 26.2 KiB | 21.6 KiB |
| syrk | CUDA | 0.2405 | 0.0100 | 0.2306 | 0.2193 | 0.0099 | 0.2093 | 0.999 | 30.2 KiB | 21.6 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.9973`

- Validation: `40/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
