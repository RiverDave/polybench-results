PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `bb385fee62f2`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu-dynamic`
- Logs: `/home/ubuntu/logs/dynamic/full/runtime-cuda-sm_86-j1-merge`
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
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (https://github.com/RiverDave/llvm-project.git bb385fee62f23fdb0acb719a88fe8186167f42a5)`
- timestamp utc: `2026-09-02T18:33:11+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5755 | 0.0004 | 0.5751 | 0.5714 | 0.0004 | 0.5711 | 0.988 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 0.2216 | 0.0054 | 0.2162 | 0.2200 | 0.0054 | 0.2146 | 1.003 | 38.3 KiB | 38.3 KiB |
| convolution-3d | CUDA | 0.3187 | 0.0010 | 0.3178 | 0.3197 | 0.0010 | 0.3187 | 1.004 | 26.2 KiB | 26.2 KiB |
| 3mm | CUDA | 0.2081 | 0.0014 | 0.2067 | 0.2066 | 0.0014 | 0.2052 | 1.005 | 42.4 KiB | 46.4 KiB |
| adi | CUDA | 0.2316 | 0.0163 | 0.2153 | 0.2320 | 0.0163 | 0.2157 | 1.000 | 58.5 KiB | 58.5 KiB |
| atax | CUDA | 0.2397 | 0.0030 | 0.2367 | 0.2397 | 0.0030 | 0.2366 | 1.004 | 34.3 KiB | 34.3 KiB |
| bicg | CUDA | 0.2410 | 0.0024 | 0.2386 | 0.2396 | 0.0024 | 0.2372 | 1.003 | 34.3 KiB | 34.3 KiB |
| correlation | CUDA | 1.9125 | 1.6801 | 0.2324 | 1.9184 | 1.6878 | 0.2306 | 1.005 | 50.5 KiB | 50.5 KiB |
| covariance | CUDA | 1.9163 | 1.6811 | 0.2352 | 1.9196 | 1.6876 | 0.2320 | 1.004 | 38.4 KiB | 38.4 KiB |
| doitgen | CUDA | 0.2300 | 0.0048 | 0.2252 | 0.2241 | 0.0048 | 0.2193 | 1.013 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4245 | 0.1787 | 0.2458 | 0.4265 | 0.1787 | 0.2478 | 1.000 | 34.3 KiB | 34.3 KiB |
| gemm | CUDA | 0.2064 | 0.0005 | 0.2059 | 0.2054 | 0.0005 | 0.2049 | 1.002 | 30.2 KiB | 30.2 KiB |
| gemver | CUDA | 0.2422 | 0.0027 | 0.2395 | 0.2407 | 0.0027 | 0.2380 | 1.003 | 38.4 KiB | 38.3 KiB |
| gesummv | CUDA | 0.2912 | 0.0018 | 0.2894 | 0.3117 | 0.0018 | 0.3099 | 1.002 | 30.1 KiB | 30.1 KiB |
| gramschmidt | CUDA | 2.6946 | 2.4511 | 0.2435 | 2.6923 | 2.4410 | 0.2512 | 0.996 | 42.4 KiB | 46.4 KiB |
| jacobi-1d-imper | CUDA | 0.3337 | 0.1295 | 0.2042 | 0.3305 | 0.1285 | 0.2020 | 0.992 | 26.1 KiB | 26.0 KiB |
| jacobi-2d-imper | CUDA | 0.2140 | 0.0010 | 0.2130 | 0.2114 | 0.0010 | 0.2104 | 0.995 | 26.1 KiB | 26.1 KiB |
| lu | CUDA | 0.2771 | 0.0500 | 0.2271 | 0.2798 | 0.0504 | 0.2294 | 1.007 | 30.2 KiB | 30.2 KiB |
| mvt | CUDA | 0.2415 | 0.0030 | 0.2385 | 0.2411 | 0.0030 | 0.2381 | 1.006 | 34.2 KiB | 34.2 KiB |
| syr2k | CUDA | 0.2311 | 0.0193 | 0.2117 | 0.2343 | 0.0193 | 0.2150 | 0.999 | 26.2 KiB | 26.2 KiB |
| syrk | CUDA | 0.2274 | 0.0100 | 0.2174 | 0.2208 | 0.0100 | 0.2108 | 1.001 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0014`

- Validation: `41/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu-dynamic/CUDA/ADI/adi.cu`
