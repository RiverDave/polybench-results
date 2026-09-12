PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `fbda065af219`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `150-136-153-114`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `f5613c4`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git fbda065af219571d11b1fce76f52d8ab3bcd0882)`
- timestamp utc: `2026-09-12T07:56:47+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.6027 | 0.0004 | 0.6024 | 0.6034 | 0.0004 | 0.6030 | 0.976 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 0.2319 | 0.0054 | 0.2265 | 0.2245 | 0.0054 | 0.2190 | 1.000 | 38.3 KiB | 38.3 KiB |
| convolution-3d | CUDA | 0.3491 | 0.0010 | 0.3481 | 0.3214 | 0.0010 | 0.3205 | 0.990 | 26.2 KiB | 26.2 KiB |
| 3mm | CUDA | 0.2214 | 0.0014 | 0.2200 | 0.2155 | 0.0014 | 0.2141 | 1.012 | 42.4 KiB | 46.4 KiB |
| adi | CUDA | 0.2548 | 0.0166 | 0.2382 | 0.2352 | 0.0165 | 0.2187 | 0.996 | 58.5 KiB | 58.5 KiB |
| atax | CUDA | 0.2626 | 0.0030 | 0.2596 | 0.2452 | 0.0031 | 0.2422 | 1.003 | 34.3 KiB | 34.3 KiB |
| bicg | CUDA | 0.2559 | 0.0024 | 0.2535 | 0.2670 | 0.0024 | 0.2645 | 1.005 | 34.3 KiB | 34.3 KiB |
| correlation | CUDA | 1.9224 | 1.6849 | 0.2374 | 1.9411 | 1.6926 | 0.2485 | 1.005 | 50.5 KiB | 50.5 KiB |
| covariance | CUDA | 1.9302 | 1.6865 | 0.2437 | 1.9633 | 1.6927 | 0.2706 | 1.004 | 38.4 KiB | 38.4 KiB |
| doitgen | CUDA | 0.2476 | 0.0049 | 0.2427 | 0.2409 | 0.0049 | 0.2360 | 0.991 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4592 | 0.1791 | 0.2801 | 0.4607 | 0.1789 | 0.2818 | 0.999 | 34.3 KiB | 34.3 KiB |
| gemm | CUDA | 0.2349 | 0.0005 | 0.2345 | 0.2328 | 0.0005 | 0.2323 | 0.989 | 30.2 KiB | 30.2 KiB |
| gemver | CUDA | 0.2774 | 0.0027 | 0.2747 | 0.2440 | 0.0027 | 0.2413 | 1.005 | 38.4 KiB | 38.3 KiB |
| gesummv | CUDA | 0.3219 | 0.0018 | 0.3202 | 0.3337 | 0.0018 | 0.3319 | 1.014 | 30.1 KiB | 30.1 KiB |
| gramschmidt | CUDA | 2.7365 | 2.4811 | 0.2554 | 2.7390 | 2.4714 | 0.2677 | 0.996 | 42.4 KiB | 46.4 KiB |
| jacobi-1d-imper | CUDA | 0.3459 | 0.1296 | 0.2163 | 0.3415 | 0.1299 | 0.2116 | 1.002 | 26.1 KiB | 26.1 KiB |
| jacobi-2d-imper | CUDA | 0.2352 | 0.0010 | 0.2342 | 0.2192 | 0.0010 | 0.2182 | 0.996 | 26.1 KiB | 26.1 KiB |
| lu | CUDA | 0.3038 | 0.0505 | 0.2532 | 0.2937 | 0.0504 | 0.2432 | 0.998 | 30.2 KiB | 30.2 KiB |
| mvt | CUDA | 0.2448 | 0.0030 | 0.2418 | 0.2617 | 0.0030 | 0.2586 | 1.005 | 34.2 KiB | 34.2 KiB |
| syr2k | CUDA | 0.2560 | 0.0193 | 0.2367 | 0.2375 | 0.0193 | 0.2182 | 1.000 | 26.2 KiB | 26.2 KiB |
| syrk | CUDA | 0.2313 | 0.0099 | 0.2213 | 0.2360 | 0.0099 | 0.2261 | 1.000 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.9992`

- Validation: `41/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
