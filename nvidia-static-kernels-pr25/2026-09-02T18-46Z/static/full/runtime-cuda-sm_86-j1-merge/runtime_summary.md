PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `bb385fee62f2`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu-static`
- Logs: `/home/ubuntu/logs/static/full/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `141-148-75-73`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `f5613c4`
- compiler version: `clang version 24.0.0git (https://github.com/RiverDave/llvm-project.git bb385fee62f23fdb0acb719a88fe8186167f42a5)`
- timestamp utc: `2026-09-02T18:46:35+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5732 | 0.0004 | 0.5728 | 0.5958 | 0.0004 | 0.5954 | 1.013 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 0.2324 | 0.0054 | 0.2270 | 0.2249 | 0.0054 | 0.2194 | 1.004 | 38.3 KiB | 38.3 KiB |
| convolution-3d | CUDA | 0.3322 | 0.0010 | 0.3312 | 0.3216 | 0.0010 | 0.3206 | 0.995 | 26.2 KiB | 26.2 KiB |
| 3mm | CUDA | 0.2087 | 0.0014 | 0.2073 | 0.2082 | 0.0014 | 0.2068 | 1.003 | 42.4 KiB | 46.4 KiB |
| adi | CUDA | 0.2323 | 0.0164 | 0.2159 | 0.2331 | 0.0164 | 0.2167 | 0.996 | 58.5 KiB | 58.5 KiB |
| atax | CUDA | 0.2489 | 0.0030 | 0.2458 | 0.2420 | 0.0031 | 0.2390 | 1.006 | 34.3 KiB | 34.3 KiB |
| bicg | CUDA | 0.2419 | 0.0024 | 0.2395 | 0.2416 | 0.0024 | 0.2392 | 1.005 | 34.3 KiB | 34.3 KiB |
| correlation | CUDA | 1.9138 | 1.6801 | 0.2337 | 1.9357 | 1.6874 | 0.2483 | 1.004 | 50.5 KiB | 50.5 KiB |
| covariance | CUDA | 1.9212 | 1.6811 | 0.2401 | 1.9276 | 1.6881 | 0.2395 | 1.004 | 38.4 KiB | 38.4 KiB |
| doitgen | CUDA | 0.2245 | 0.0048 | 0.2198 | 0.2413 | 0.0049 | 0.2364 | 1.022 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4496 | 0.1791 | 0.2705 | 0.4333 | 0.1788 | 0.2545 | 0.998 | 34.3 KiB | 34.3 KiB |
| gemm | CUDA | 0.2123 | 0.0005 | 0.2119 | 0.2044 | 0.0005 | 0.2039 | 0.993 | 30.2 KiB | 30.2 KiB |
| gemver | CUDA | 0.2495 | 0.0027 | 0.2468 | 0.2501 | 0.0027 | 0.2474 | 1.004 | 38.4 KiB | 38.3 KiB |
| gesummv | CUDA | 0.3270 | 0.0018 | 0.3252 | 0.3236 | 0.0018 | 0.3218 | 1.005 | 30.1 KiB | 30.1 KiB |
| gramschmidt | CUDA | 2.7103 | 2.4510 | 0.2593 | 2.7005 | 2.4410 | 0.2595 | 0.996 | 42.4 KiB | 46.4 KiB |
| jacobi-1d-imper | CUDA | 0.3343 | 0.1297 | 0.2046 | 0.3429 | 0.1321 | 0.2109 | 1.019 | 26.1 KiB | 26.1 KiB |
| jacobi-2d-imper | CUDA | 0.2227 | 0.0010 | 0.2217 | 0.2225 | 0.0010 | 0.2215 | 1.002 | 26.1 KiB | 26.1 KiB |
| lu | CUDA | 0.2963 | 0.0510 | 0.2452 | 0.2795 | 0.0501 | 0.2294 | 0.982 | 30.2 KiB | 30.2 KiB |
| mvt | CUDA | 0.2499 | 0.0030 | 0.2469 | 0.2518 | 0.0030 | 0.2488 | 1.005 | 34.2 KiB | 34.2 KiB |
| syr2k | CUDA | 0.2348 | 0.0193 | 0.2155 | 0.2484 | 0.0193 | 0.2290 | 1.000 | 26.2 KiB | 26.2 KiB |
| syrk | CUDA | 0.2291 | 0.0100 | 0.2191 | 0.2305 | 0.0100 | 0.2205 | 1.000 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0026`

- Validation: `41/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu-static/CUDA/ADI/adi.cu`
