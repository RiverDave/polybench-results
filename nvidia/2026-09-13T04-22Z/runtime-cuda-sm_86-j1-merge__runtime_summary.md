PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `7a94fd56356d`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-s1-armA/runtime-cuda-sm_86-j1-merge`
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
- timestamp utc: `2026-09-13T04:22:52+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5662 | 0.0004 | 0.5658 | 0.5667 | 0.0004 | 0.5663 | 1.002 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 0.2195 | 0.0054 | 0.2140 | 0.2197 | 0.0054 | 0.2142 | 1.001 | 38.3 KiB | 38.3 KiB |
| convolution-3d | CUDA | 0.3196 | 0.0010 | 0.3186 | 0.3120 | 0.0010 | 0.3110 | 0.997 | 26.2 KiB | 26.2 KiB |
| 3mm | CUDA | 0.2058 | 0.0014 | 0.2044 | 0.2052 | 0.0014 | 0.2038 | 1.001 | 42.4 KiB | 42.4 KiB |
| adi | CUDA | 0.2317 | 0.0163 | 0.2153 | 0.2312 | 0.0165 | 0.2148 | 1.007 | 58.5 KiB | 58.5 KiB |
| atax | CUDA | 0.2390 | 0.0030 | 0.2360 | 0.2401 | 0.0030 | 0.2370 | 1.001 | 34.3 KiB | 34.3 KiB |
| bicg | CUDA | 0.2400 | 0.0024 | 0.2376 | 0.2397 | 0.0024 | 0.2373 | 1.000 | 34.3 KiB | 34.3 KiB |
| correlation | CUDA | 1.9145 | 1.6839 | 0.2305 | 1.9147 | 1.6850 | 0.2296 | 1.001 | 50.5 KiB | 50.5 KiB |
| covariance | CUDA | 1.9153 | 1.6854 | 0.2299 | 1.9183 | 1.6865 | 0.2318 | 1.001 | 38.4 KiB | 38.4 KiB |
| doitgen | CUDA | 0.2225 | 0.0048 | 0.2177 | 0.2223 | 0.0048 | 0.2175 | 0.997 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4229 | 0.1787 | 0.2442 | 0.4226 | 0.1788 | 0.2439 | 1.000 | 34.3 KiB | 34.3 KiB |
| gemm | CUDA | 0.2032 | 0.0005 | 0.2028 | 0.2026 | 0.0005 | 0.2022 | 1.002 | 30.2 KiB | 30.2 KiB |
| gemver | CUDA | 0.2387 | 0.0027 | 0.2360 | 0.2399 | 0.0027 | 0.2372 | 1.000 | 38.4 KiB | 38.3 KiB |
| gesummv | CUDA | 0.3146 | 0.0018 | 0.3128 | 0.2967 | 0.0018 | 0.2949 | 0.998 | 30.1 KiB | 30.1 KiB |
| gramschmidt | CUDA | 2.7226 | 2.4805 | 0.2421 | 2.7208 | 2.4800 | 0.2408 | 1.000 | 42.4 KiB | 42.4 KiB |
| jacobi-1d-imper | CUDA | 0.3321 | 0.1306 | 0.2014 | 0.3321 | 0.1304 | 0.2016 | 0.999 | 26.1 KiB | 26.1 KiB |
| jacobi-2d-imper | CUDA | 0.2123 | 0.0010 | 0.2113 | 0.2119 | 0.0010 | 0.2109 | 0.997 | 26.1 KiB | 26.1 KiB |
| lu | CUDA | 0.2764 | 0.0506 | 0.2258 | 0.2772 | 0.0505 | 0.2267 | 1.000 | 30.2 KiB | 30.2 KiB |
| mvt | CUDA | 0.2389 | 0.0030 | 0.2359 | 0.2402 | 0.0030 | 0.2372 | 0.999 | 34.2 KiB | 34.2 KiB |
| syr2k | CUDA | 0.2321 | 0.0193 | 0.2128 | 0.2309 | 0.0193 | 0.2116 | 1.000 | 26.2 KiB | 26.2 KiB |
| syrk | CUDA | 0.2201 | 0.0099 | 0.2101 | 0.2202 | 0.0099 | 0.2103 | 1.000 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0001`

- Validation: `40/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
