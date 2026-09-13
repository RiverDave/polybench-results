PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `7a94fd56356d`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-s1-armC/runtime-cuda-sm_86-j1-merge`
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
- timestamp utc: `2026-09-13T04:48:18+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5693 | 0.0004 | 0.5690 | 0.5682 | 0.0004 | 0.5678 | 1.001 | 26.2 KiB | 21.7 KiB |
| 2mm | CUDA | 0.2211 | 0.0054 | 0.2157 | 0.2170 | 0.0024 | 0.2147 | 0.440 | 38.3 KiB | 33.7 KiB |
| convolution-3d | CUDA | 0.3202 | 0.0010 | 0.3192 | 0.3178 | 0.0010 | 0.3168 | 0.996 | 26.2 KiB | 21.6 KiB |
| 3mm | CUDA | 0.2082 | 0.0014 | 0.2069 | 0.2066 | 0.0006 | 0.2060 | 0.433 | 42.4 KiB | 37.7 KiB |
| adi | CUDA | 0.2311 | 0.0164 | 0.2148 | 0.2307 | 0.0161 | 0.2146 | 0.985 | 58.5 KiB | 49.9 KiB |
| atax | CUDA | 0.2396 | 0.0030 | 0.2365 | 0.2400 | 0.0017 | 0.2383 | 0.558 | 34.3 KiB | 25.7 KiB |
| bicg | CUDA | 0.2402 | 0.0024 | 0.2378 | 0.2399 | 0.0010 | 0.2389 | 0.421 | 34.3 KiB | 25.7 KiB |
| correlation | CUDA | 1.9144 | 1.6836 | 0.2308 | 0.4698 | 0.2390 | 0.2307 | 0.142 | 50.5 KiB | 49.8 KiB |
| covariance | CUDA | 1.9198 | 1.6865 | 0.2333 | 0.4666 | 0.2351 | 0.2315 | 0.139 | 38.4 KiB | 33.7 KiB |
| doitgen | CUDA | 0.2237 | 0.0048 | 0.2189 | 0.2197 | 0.0024 | 0.2173 | 0.500 | 30.5 KiB | 34.1 KiB |
| fdtd-2d | CUDA | 0.4238 | 0.1788 | 0.2449 | 0.4253 | 0.1789 | 0.2464 | 1.001 | 34.3 KiB | 29.8 KiB |
| gemm | CUDA | 0.2069 | 0.0005 | 0.2064 | 0.2030 | 0.0002 | 0.2028 | 0.521 | 30.2 KiB | 21.6 KiB |
| gemver | CUDA | 0.2396 | 0.0027 | 0.2369 | 0.2390 | 0.0013 | 0.2376 | 0.489 | 38.4 KiB | 33.8 KiB |
| gesummv | CUDA | 0.2895 | 0.0018 | 0.2877 | 0.3088 | 0.0014 | 0.3074 | 0.795 | 30.1 KiB | 25.6 KiB |
| gramschmidt | CUDA | 2.7226 | 2.4808 | 0.2418 | 1.3383 | 1.0969 | 0.2413 | 0.442 | 42.4 KiB | 37.8 KiB |
| jacobi-1d-imper | CUDA | 0.3336 | 0.1313 | 0.2023 | 0.3323 | 0.1309 | 0.2014 | 0.997 | 26.1 KiB | 21.6 KiB |
| jacobi-2d-imper | CUDA | 0.2142 | 0.0010 | 0.2132 | 0.2125 | 0.0010 | 0.2115 | 1.001 | 26.1 KiB | 21.6 KiB |
| lu | CUDA | 0.2768 | 0.0505 | 0.2263 | 0.2771 | 0.0506 | 0.2264 | 1.003 | 30.2 KiB | 25.7 KiB |
| mvt | CUDA | 0.2397 | 0.0030 | 0.2367 | 0.2388 | 0.0017 | 0.2371 | 0.558 | 34.2 KiB | 25.7 KiB |
| syr2k | CUDA | 0.2310 | 0.0193 | 0.2117 | 0.2307 | 0.0186 | 0.2121 | 0.962 | 26.2 KiB | 21.6 KiB |
| syrk | CUDA | 0.2200 | 0.0100 | 0.2100 | 0.2197 | 0.0093 | 0.2104 | 0.935 | 30.2 KiB | 21.6 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.5967`

- Validation: `40/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
