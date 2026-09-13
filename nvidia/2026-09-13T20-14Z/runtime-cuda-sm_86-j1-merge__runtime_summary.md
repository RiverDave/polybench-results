PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `7a94fd56356d`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-s4-timing/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`

## Environment

- hostname: `150-136-116-133`
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
- timestamp utc: `2026-09-13T20:14:11+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 6.2378 | 0.0044 | 6.2334 | 6.2399 | 0.0044 | 6.2355 | 0.998 | 26.2 KiB | 21.7 KiB |
| 2mm | CUDA | 0.8927 | 0.4770 | 0.4157 | 0.6124 | 0.1923 | 0.4201 | 0.403 | 38.3 KiB | 33.7 KiB |
| convolution-3d | CUDA | 7.5066 | 0.0366 | 7.4700 | 7.5033 | 0.0366 | 7.4667 | 1.000 | 26.2 KiB | 21.6 KiB |
| 3mm | CUDA | 0.3509 | 0.0851 | 0.2658 | 0.2961 | 0.0281 | 0.2681 | 0.330 | 42.4 KiB | 37.7 KiB |
| adi | CUDA | 0.4630 | 0.0651 | 0.3979 | 0.4648 | 0.0647 | 0.4001 | 0.994 | 58.5 KiB | 49.9 KiB |
| atax | CUDA | 0.7414 | 0.0343 | 0.7071 | 0.7314 | 0.0238 | 0.7076 | 0.695 | 34.3 KiB | 25.7 KiB |
| bicg | CUDA | 0.7189 | 0.0126 | 0.7063 | 0.7193 | 0.0056 | 0.7137 | 0.443 | 34.3 KiB | 25.7 KiB |
| correlation | CUDA | 30.7683 | 30.1311 | 0.6372 | 7.1814 | 6.5619 | 0.6195 | 0.218 | 50.5 KiB | 49.8 KiB |
| covariance | CUDA | 30.9084 | 30.2705 | 0.6379 | 7.1414 | 6.5263 | 0.6151 | 0.216 | 38.4 KiB | 33.7 KiB |
| doitgen | CUDA | 0.2226 | 0.0047 | 0.2179 | 0.2199 | 0.0024 | 0.2175 | 0.496 | 30.5 KiB | 34.1 KiB |
| fdtd-2d | CUDA | 3.5593 | 2.7100 | 0.8493 | 3.5604 | 2.7097 | 0.8507 | 1.000 | 34.3 KiB | 29.8 KiB |
| gemm | CUDA | 0.2714 | 0.0286 | 0.2428 | 0.2537 | 0.0097 | 0.2439 | 0.340 | 30.2 KiB | 21.6 KiB |
| gemver | CUDA | 0.7303 | 0.0170 | 0.7132 | 0.7196 | 0.0100 | 0.7096 | 0.586 | 38.4 KiB | 33.8 KiB |
| gesummv | CUDA | 1.3276 | 0.0127 | 1.3149 | 1.3482 | 0.0125 | 1.3357 | 0.983 | 30.1 KiB | 25.6 KiB |
| gramschmidt | CUDA | 49.5333 | 48.7077 | 0.8257 | 24.5232 | 23.6819 | 0.8413 | 0.486 | 42.4 KiB | 37.8 KiB |
| jacobi-1d-imper | CUDA | 0.3295 | 0.1280 | 0.2015 | 0.3287 | 0.1287 | 0.2000 | 1.006 | 26.1 KiB | 21.6 KiB |
| jacobi-2d-imper | CUDA | 0.2193 | 0.0010 | 0.2183 | 0.2108 | 0.0010 | 0.2098 | 1.006 | 26.1 KiB | 21.6 KiB |
| lu | CUDA | 2.3394 | 1.7660 | 0.5734 | 2.3435 | 1.7660 | 0.5775 | 1.000 | 30.2 KiB | 25.7 KiB |
| mvt | CUDA | 0.7602 | 0.0343 | 0.7259 | 0.7377 | 0.0238 | 0.7139 | 0.695 | 34.2 KiB | 25.7 KiB |
| syr2k | CUDA | 15.3152 | 14.9390 | 0.3762 | 7.5572 | 7.1686 | 0.3886 | 0.480 | 26.2 KiB | 21.6 KiB |
| syrk | CUDA | 1.0480 | 0.7178 | 0.3302 | 0.9344 | 0.6043 | 0.3302 | 0.842 | 30.2 KiB | 21.6 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.6044`

