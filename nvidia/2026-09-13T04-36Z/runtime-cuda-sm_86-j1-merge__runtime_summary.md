PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `7a94fd56356d`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-s1-armB/runtime-cuda-sm_86-j1-merge`
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
- timestamp utc: `2026-09-13T04:36:02+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5672 | 0.0004 | 0.5669 | 0.5660 | 0.0004 | 0.5657 | 1.005 | 26.2 KiB | 21.7 KiB |
| 2mm | CUDA | 0.2196 | 0.0054 | 0.2142 | 0.2201 | 0.0054 | 0.2147 | 1.000 | 38.3 KiB | 33.7 KiB |
| convolution-3d | CUDA | 0.3175 | 0.0010 | 0.3165 | 0.3154 | 0.0010 | 0.3144 | 0.999 | 26.2 KiB | 21.6 KiB |
| 3mm | CUDA | 0.2076 | 0.0014 | 0.2062 | 0.2056 | 0.0014 | 0.2042 | 0.998 | 42.4 KiB | 37.7 KiB |
| adi | CUDA | 0.2295 | 0.0162 | 0.2133 | 0.2301 | 0.0162 | 0.2138 | 1.000 | 58.5 KiB | 53.9 KiB |
| atax | CUDA | 0.2376 | 0.0030 | 0.2346 | 0.2402 | 0.0030 | 0.2372 | 0.999 | 34.3 KiB | 29.7 KiB |
| bicg | CUDA | 0.2397 | 0.0024 | 0.2373 | 0.2395 | 0.0024 | 0.2371 | 1.002 | 34.3 KiB | 29.7 KiB |
| correlation | CUDA | 1.9185 | 1.6852 | 0.2333 | 1.9127 | 1.6839 | 0.2289 | 0.999 | 50.5 KiB | 49.8 KiB |
| covariance | CUDA | 1.9148 | 1.6849 | 0.2299 | 1.9157 | 1.6854 | 0.2303 | 1.000 | 38.4 KiB | 33.7 KiB |
| doitgen | CUDA | 0.2228 | 0.0048 | 0.2180 | 0.2231 | 0.0048 | 0.2184 | 1.001 | 30.5 KiB | 30.1 KiB |
| fdtd-2d | CUDA | 0.4243 | 0.1787 | 0.2456 | 0.4272 | 0.1787 | 0.2485 | 1.000 | 34.3 KiB | 29.8 KiB |
| gemm | CUDA | 0.2039 | 0.0005 | 0.2034 | 0.2026 | 0.0005 | 0.2022 | 0.988 | 30.2 KiB | 25.6 KiB |
| gemver | CUDA | 0.2402 | 0.0027 | 0.2375 | 0.2398 | 0.0027 | 0.2371 | 1.001 | 38.4 KiB | 37.8 KiB |
| gesummv | CUDA | 0.2854 | 0.0018 | 0.2837 | 0.3144 | 0.0018 | 0.3127 | 1.010 | 30.1 KiB | 25.6 KiB |
| gramschmidt | CUDA | 2.7206 | 2.4800 | 0.2406 | 2.7210 | 2.4800 | 0.2410 | 1.000 | 42.4 KiB | 41.8 KiB |
| jacobi-1d-imper | CUDA | 0.3303 | 0.1296 | 0.2007 | 0.3297 | 0.1292 | 0.2005 | 0.997 | 26.1 KiB | 21.6 KiB |
| jacobi-2d-imper | CUDA | 0.2119 | 0.0010 | 0.2109 | 0.2107 | 0.0010 | 0.2097 | 0.999 | 26.1 KiB | 21.6 KiB |
| lu | CUDA | 0.2774 | 0.0505 | 0.2270 | 0.2752 | 0.0503 | 0.2250 | 0.996 | 30.2 KiB | 25.7 KiB |
| mvt | CUDA | 0.2400 | 0.0030 | 0.2370 | 0.2398 | 0.0030 | 0.2367 | 1.000 | 34.2 KiB | 29.7 KiB |
| syr2k | CUDA | 0.2311 | 0.0193 | 0.2118 | 0.2311 | 0.0193 | 0.2118 | 1.000 | 26.2 KiB | 21.6 KiB |
| syrk | CUDA | 0.2205 | 0.0099 | 0.2106 | 0.2195 | 0.0099 | 0.2096 | 1.000 | 30.2 KiB | 25.6 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.9997`

- Validation: `40/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
