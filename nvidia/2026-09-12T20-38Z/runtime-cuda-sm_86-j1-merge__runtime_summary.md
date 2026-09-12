PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `b21a0cb9ddee`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-armA/runtime-cuda-sm_86-j1-merge`
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
- timestamp utc: `2026-09-12T20:35:29+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5857 | 0.0004 | 0.5853 | 0.5885 | 0.0004 | 0.5881 | 0.999 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 0.2406 | 0.0054 | 0.2352 | 0.2224 | 0.0054 | 0.2169 | 1.002 | 38.3 KiB | 38.3 KiB |
| convolution-3d | CUDA | 0.3574 | 0.0010 | 0.3564 | 0.3200 | 0.0010 | 0.3190 | 1.007 | 26.2 KiB | 26.2 KiB |
| 3mm | CUDA | 0.2080 | 0.0014 | 0.2066 | 0.2141 | 0.0014 | 0.2127 | 1.009 | 42.4 KiB | 46.4 KiB |
| adi | CUDA | 0.2520 | 0.0162 | 0.2359 | 0.2380 | 0.0162 | 0.2218 | 1.001 | 58.5 KiB | 58.5 KiB |
| atax | CUDA | 0.2534 | 0.0030 | 0.2504 | 0.2468 | 0.0030 | 0.2437 | 1.004 | 34.3 KiB | 34.3 KiB |
| bicg | CUDA | 0.2463 | 0.0024 | 0.2439 | 0.2585 | 0.0024 | 0.2561 | 1.005 | 34.3 KiB | 34.3 KiB |
| correlation | CUDA | 1.9361 | 1.6831 | 0.2530 | 1.9500 | 1.6908 | 0.2592 | 1.005 | 50.5 KiB | 50.5 KiB |
| covariance | CUDA | 1.9366 | 1.6836 | 0.2530 | 1.9417 | 1.6902 | 0.2514 | 1.004 | 38.4 KiB | 38.4 KiB |
| doitgen | CUDA | 0.2428 | 0.0048 | 0.2380 | 0.2307 | 0.0048 | 0.2259 | 1.013 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4419 | 0.1785 | 0.2634 | 0.4361 | 0.1785 | 0.2575 | 1.000 | 34.3 KiB | 34.3 KiB |
| gemm | CUDA | 0.2501 | 0.0005 | 0.2497 | 0.2504 | 0.0005 | 0.2499 | 0.998 | 30.2 KiB | 30.2 KiB |
| gemver | CUDA | 0.2785 | 0.0027 | 0.2758 | 0.2737 | 0.0027 | 0.2710 | 1.004 | 38.4 KiB | 38.3 KiB |
| gesummv | CUDA | 0.3245 | 0.0018 | 0.3227 | 0.3233 | 0.0018 | 0.3215 | 1.003 | 30.1 KiB | 30.1 KiB |
| gramschmidt | CUDA | 2.7366 | 2.4748 | 0.2619 | 2.7157 | 2.4660 | 0.2497 | 0.996 | 42.4 KiB | 46.4 KiB |
| jacobi-1d-imper | CUDA | 0.3363 | 0.1278 | 0.2085 | 0.3304 | 0.1283 | 0.2021 | 1.003 | 26.1 KiB | 26.1 KiB |
| jacobi-2d-imper | CUDA | 0.2172 | 0.0010 | 0.2162 | 0.2178 | 0.0010 | 0.2168 | 0.998 | 26.1 KiB | 26.1 KiB |
| lu | CUDA | 0.2766 | 0.0501 | 0.2265 | 0.2775 | 0.0497 | 0.2278 | 0.993 | 30.2 KiB | 30.2 KiB |
| mvt | CUDA | 0.2401 | 0.0030 | 0.2371 | 0.2407 | 0.0030 | 0.2377 | 1.003 | 34.2 KiB | 34.2 KiB |
| syr2k | CUDA | 0.2397 | 0.0193 | 0.2204 | 0.2455 | 0.0193 | 0.2262 | 1.000 | 26.2 KiB | 26.2 KiB |
| syrk | CUDA | 0.2322 | 0.0099 | 0.2223 | 0.2326 | 0.0100 | 0.2226 | 1.000 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0023`

- Validation: `41/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
