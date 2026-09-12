PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `b21a0cb9ddee`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-armB/runtime-cuda-sm_86-j1-merge`
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
- timestamp utc: `2026-09-12T20:58:11+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5722 | 0.0004 | 0.5719 | 0.6034 | 0.0004 | 0.6031 | 1.011 | 26.2 KiB | 21.7 KiB |
| 2mm | CUDA | 0.2278 | 0.0054 | 0.2224 | 0.2394 | 0.0054 | 0.2340 | 1.001 | 38.3 KiB | 33.7 KiB |
| convolution-3d | CUDA | 0.3319 | 0.0010 | 0.3310 | 0.3300 | 0.0010 | 0.3291 | 0.998 | 26.2 KiB | 21.6 KiB |
| 3mm | CUDA | 0.2256 | 0.0014 | 0.2242 | 0.2250 | 0.0014 | 0.2236 | 1.007 | 42.4 KiB | 41.7 KiB |
| adi | CUDA | 0.2363 | 0.0162 | 0.2201 | 0.2363 | 0.0161 | 0.2202 | 0.995 | 58.5 KiB | 49.9 KiB |
| atax | CUDA | 0.2458 | 0.0030 | 0.2428 | 0.2709 | 0.0030 | 0.2679 | 1.000 | 34.3 KiB | 25.7 KiB |
| bicg | CUDA | 0.2470 | 0.0024 | 0.2446 | 0.2588 | 0.0024 | 0.2565 | 0.999 | 34.3 KiB | 25.7 KiB |
| correlation | CUDA | 1.9162 | 1.6841 | 0.2321 | 1.9214 | 1.6902 | 0.2312 | 1.004 | 50.5 KiB | 45.8 KiB |
| covariance | CUDA | 1.9243 | 1.6846 | 0.2397 | 1.9255 | 1.6937 | 0.2318 | 1.005 | 38.4 KiB | 29.7 KiB |
| doitgen | CUDA | 0.2225 | 0.0048 | 0.2178 | 0.2239 | 0.0048 | 0.2191 | 1.006 | 30.5 KiB | 30.1 KiB |
| fdtd-2d | CUDA | 0.4432 | 0.1785 | 0.2647 | 0.4295 | 0.1784 | 0.2511 | 1.000 | 34.3 KiB | 29.8 KiB |
| gemm | CUDA | 0.2042 | 0.0005 | 0.2037 | 0.2032 | 0.0005 | 0.2028 | 0.995 | 30.2 KiB | 21.6 KiB |
| gemver | CUDA | 0.2536 | 0.0027 | 0.2509 | 0.2474 | 0.0027 | 0.2447 | 1.002 | 38.4 KiB | 33.8 KiB |
| gesummv | CUDA | 0.3192 | 0.0018 | 0.3175 | 0.3169 | 0.0018 | 0.3151 | 0.993 | 30.1 KiB | 21.6 KiB |
| gramschmidt | CUDA | 2.7189 | 2.4756 | 0.2433 | 2.8033 | 2.5409 | 0.2624 | 1.026 | 42.4 KiB | 33.8 KiB |
| jacobi-1d-imper | CUDA | 0.3458 | 0.1299 | 0.2159 | 0.3437 | 0.1282 | 0.2155 | 0.987 | 26.1 KiB | 21.6 KiB |
| jacobi-2d-imper | CUDA | 0.2394 | 0.0010 | 0.2384 | 0.2381 | 0.0010 | 0.2371 | 1.000 | 26.1 KiB | 21.6 KiB |
| lu | CUDA | 0.2791 | 0.0499 | 0.2292 | 0.2802 | 0.0500 | 0.2303 | 1.001 | 30.2 KiB | 25.7 KiB |
| mvt | CUDA | 0.2683 | 0.0030 | 0.2652 | 0.2620 | 0.0030 | 0.2589 | 1.002 | 34.2 KiB | 25.7 KiB |
| syr2k | CUDA | 0.2586 | 0.0193 | 0.2393 | 0.2466 | 0.0193 | 0.2273 | 1.000 | 26.2 KiB | 21.6 KiB |
| syrk | CUDA | 0.2464 | 0.0100 | 0.2364 | 0.2264 | 0.0099 | 0.2164 | 0.999 | 30.2 KiB | 21.6 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0014`

- Validation: `41/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
