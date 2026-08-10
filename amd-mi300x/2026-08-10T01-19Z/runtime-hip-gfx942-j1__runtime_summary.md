PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `acc8640`
- arch: `gfx942`
- PolyBench root: `/root/polybenchGpu`
- Logs: `/root/polybench-gpu-audit/temp/runtime-hip-gfx942-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `rocm-7-14-software-gpu-mi300x1-192gb-devcloud-atl1`
- cpu: `INTEL(R) XEON(R) PLATINUM 8568Y+`
- cpu count: `20`
- gpu: `AMD Instinct MI300X VF`
- kernel: `6.8.0-134-generic`
- rocm version: `7.0.2`
- driver version: `6.19.14.31400000`
- os release: `Ubuntu 24.04.4 LTS`
- timestamp utc: `2026-08-10T00:35:40+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | OG wall | OG GPU | OG host | GPU CIR/OG | CIR size | OG size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.5261 | 0.0005 | 0.5256 | 0.5277 | 0.0005 | 0.5272 | 1.011 | 30.2 KiB | 34.4 KiB |
| 2mm | HIP | 0.2350 | 0.0017 | 0.2333 | 0.2345 | 0.0017 | 0.2327 | 1.001 | 38.4 KiB | 42.5 KiB |
| convolution-3d | HIP | 0.3200 | 0.0010 | 0.3190 | 0.3148 | 0.0010 | 0.3138 | 1.024 | 30.2 KiB | 34.3 KiB |
| 3mm | HIP | 0.2225 | 0.0010 | 0.2214 | 0.2203 | 0.0010 | 0.2193 | 0.991 | 42.5 KiB | 46.6 KiB |
| adi | HIP | 0.2560 | 0.0272 | 0.2288 | 0.2565 | 0.0270 | 0.2295 | 1.008 | 46.7 KiB | 50.8 KiB |
| atax | HIP | 0.2495 | 0.0022 | 0.2473 | 0.2500 | 0.0022 | 0.2479 | 1.012 | 34.3 KiB | 38.5 KiB |
| bicg | HIP | 0.2505 | 0.0035 | 0.2470 | 0.2548 | 0.0036 | 0.2512 | 0.983 | 34.3 KiB | 38.5 KiB |
| correlation | HIP | 1.6940 | 1.4484 | 0.2455 | 1.6960 | 1.4501 | 0.2459 | 0.999 | 38.6 KiB | 42.7 KiB |
| covariance | HIP | 1.7081 | 1.4636 | 0.2445 | 1.6867 | 1.4397 | 0.2471 | 1.017 | 34.4 KiB | 42.6 KiB |
| doitgen | HIP | 0.2368 | 0.0059 | 0.2309 | 0.2394 | 0.0059 | 0.2335 | 1.007 | 34.5 KiB | 38.6 KiB |
| fdtd-2d | HIP | 0.2970 | 0.0441 | 0.2529 | 0.2987 | 0.0440 | 0.2547 | 1.001 | 38.4 KiB | 42.6 KiB |
| gemm | HIP | 0.2321 | 0.0006 | 0.2315 | 0.2204 | 0.0006 | 0.2198 | 1.027 | 30.1 KiB | 34.3 KiB |
| gemver | HIP | 0.2495 | 0.0032 | 0.2463 | 0.2496 | 0.0032 | 0.2464 | 1.009 | 34.4 KiB | 38.6 KiB |
| gesummv | HIP | 0.2829 | 0.0040 | 0.2789 | 0.2818 | 0.0039 | 0.2779 | 1.012 | 30.1 KiB | 34.3 KiB |
| gramschmidt | HIP | 2.5534 | 2.2969 | 0.2565 | 2.4710 | 2.2137 | 0.2572 | 1.038 | 38.5 KiB | 42.6 KiB |
| jacobi-1d-imper | HIP | 0.4146 | 0.2195 | 0.1951 | 0.4145 | 0.2193 | 0.1952 | 1.001 | 34.1 KiB | 38.3 KiB |
| jacobi-2d-imper | HIP | 0.2276 | 0.0012 | 0.2264 | 0.2256 | 0.0012 | 0.2244 | 1.002 | 34.1 KiB | 38.3 KiB |
| lu | HIP | 0.2866 | 0.0519 | 0.2347 | 0.2867 | 0.0518 | 0.2349 | 1.002 | 34.3 KiB | 38.4 KiB |
| mvt | HIP | 0.2496 | 0.0022 | 0.2474 | 0.2505 | 0.0021 | 0.2483 | 1.020 | 34.3 KiB | 38.4 KiB |
| syr2k | HIP | 0.2374 | 0.0096 | 0.2278 | 0.2362 | 0.0096 | 0.2266 | 0.997 | 30.2 KiB | 34.3 KiB |
| syrk | HIP | 0.2245 | 0.0030 | 0.2214 | 0.2250 | 0.0030 | 0.2219 | 1.004 | 30.1 KiB | 34.3 KiB |

**Total GPU CIR/OG (geomean):** `1.0077`

