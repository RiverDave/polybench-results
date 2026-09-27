PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `79ef5eae3af1`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_86-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `147-224-15-43`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git 79ef5eae3af16124f05e10e4a210a41d55bc3d99)`
- timestamp utc: `2026-09-27T21:02:55+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | OG wall | OG GPU | OG host | GPU OG/CIR | CIR size | OG size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5794 | 0.0004 | 0.5790 | 0.5849 | 0.0004 | 0.5845 | 1.004 | 26.2 KiB | 26.4 KiB |
| 2mm | CUDA | 0.2469 | 0.0054 | 0.2415 | 0.2209 | 0.0054 | 0.2155 | 0.996 | 38.3 KiB | 38.5 KiB |
| convolution-3d | CUDA | 0.3197 | 0.0009 | 0.3188 | 0.3408 | 0.0010 | 0.3399 | 1.003 | 26.2 KiB | 26.4 KiB |
| 3mm | CUDA | 0.2065 | 0.0014 | 0.2051 | 0.2195 | 0.0014 | 0.2181 | 0.996 | 46.4 KiB | 42.5 KiB |
| adi | CUDA | 0.2302 | 0.0162 | 0.2140 | 0.2305 | 0.0161 | 0.2144 | 0.995 | 58.5 KiB | 58.6 KiB |
| atax | CUDA | 0.2400 | 0.0030 | 0.2369 | 0.2395 | 0.0030 | 0.2365 | 0.995 | 34.3 KiB | 34.4 KiB |
| bicg | CUDA | 0.2523 | 0.0024 | 0.2500 | 0.2522 | 0.0024 | 0.2498 | 0.996 | 34.3 KiB | 34.4 KiB |
| correlation | CUDA | 1.9192 | 1.6878 | 0.2313 | 1.9106 | 1.6802 | 0.2303 | 0.995 | 50.5 KiB | 50.6 KiB |
| covariance | CUDA | 1.9185 | 1.6872 | 0.2313 | 1.9138 | 1.6807 | 0.2331 | 0.996 | 38.4 KiB | 38.5 KiB |
| doitgen | CUDA | 0.2239 | 0.0048 | 0.2191 | 0.2298 | 0.0047 | 0.2251 | 0.988 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4246 | 0.1785 | 0.2461 | 0.4348 | 0.1784 | 0.2563 | 1.000 | 34.3 KiB | 34.5 KiB |
| gemm | CUDA | 0.2103 | 0.0005 | 0.2099 | 0.2100 | 0.0005 | 0.2096 | 1.002 | 30.2 KiB | 30.3 KiB |
| gemver | CUDA | 0.2393 | 0.0027 | 0.2366 | 0.2407 | 0.0027 | 0.2380 | 0.996 | 38.4 KiB | 38.5 KiB |
| gesummv | CUDA | 0.3244 | 0.0018 | 0.3226 | 0.3242 | 0.0018 | 0.3224 | 0.997 | 30.1 KiB | 30.3 KiB |
| gramschmidt | CUDA | 2.6838 | 2.4407 | 0.2431 | 2.6941 | 2.4507 | 0.2434 | 1.004 | 46.4 KiB | 42.5 KiB |
| jacobi-1d-imper | CUDA | 0.3298 | 0.1272 | 0.2025 | 0.3296 | 0.1277 | 0.2019 | 1.003 | 26.1 KiB | 26.2 KiB |
| jacobi-2d-imper | CUDA | 0.2126 | 0.0010 | 0.2116 | 0.2138 | 0.0010 | 0.2128 | 1.006 | 26.1 KiB | 26.2 KiB |
| lu | CUDA | 0.2757 | 0.0499 | 0.2258 | 0.2748 | 0.0498 | 0.2249 | 1.000 | 30.2 KiB | 30.4 KiB |
| mvt | CUDA | 0.2404 | 0.0030 | 0.2373 | 0.2404 | 0.0030 | 0.2374 | 0.995 | 34.2 KiB | 34.4 KiB |
| syr2k | CUDA | 0.2322 | 0.0193 | 0.2129 | 0.2316 | 0.0193 | 0.2123 | 1.000 | 26.2 KiB | 26.3 KiB |
| syrk | CUDA | 0.2196 | 0.0100 | 0.2096 | 0.2259 | 0.0100 | 0.2159 | 1.000 | 30.2 KiB | 30.3 KiB |

**Total GPU OG/CIR (geomean):** `0.9985`

- Validation: `41/42` passed

## Validation failures

- [OG] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
