PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `c96255f`
- arch: `gfx942`
- PolyBench root: `/root/polybenchGpu`
- Logs: `/root/polybench-gpu-audit/temp/fnofub/runtime-hip-gfx942-j1`
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
- timestamp utc: `2026-08-10T02:44:47+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | OG wall | OG GPU | OG host | GPU CIR/OG | CIR size | OG size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.5566 | 0.0112 | 0.5454 | 0.5606 | 0.0115 | 0.5491 | 0.977 | 30.2 KiB | 34.4 KiB |
| 2mm | HIP | 0.2602 | 0.0128 | 0.2474 | 0.2600 | 0.0125 | 0.2475 | 1.022 | 38.4 KiB | 42.5 KiB |
| convolution-3d | HIP | 0.3391 | 0.0121 | 0.3270 | 0.3390 | 0.0119 | 0.3271 | 1.019 | 30.2 KiB | 34.3 KiB |
| 3mm | HIP | 0.2451 | 0.0118 | 0.2333 | 0.2477 | 0.0118 | 0.2359 | 0.998 | 42.5 KiB | 46.6 KiB |
| adi | HIP | 0.2661 | 0.0276 | 0.2386 | 0.2648 | 0.0276 | 0.2372 | 0.998 | 46.7 KiB | 50.8 KiB |
| atax | HIP | 0.2537 | 0.0022 | 0.2515 | 0.2546 | 0.0022 | 0.2524 | 1.008 | 34.3 KiB | 38.5 KiB |
| bicg | HIP | 0.2573 | 0.0036 | 0.2537 | 0.2579 | 0.0036 | 0.2543 | 1.002 | 34.3 KiB | 38.5 KiB |
| correlation | HIP | 1.7362 | 1.4738 | 0.2624 | 1.7516 | 1.4883 | 0.2633 | 0.990 | 38.6 KiB | 42.7 KiB |
| covariance | HIP | 1.7500 | 1.4869 | 0.2630 | 1.7755 | 1.5108 | 0.2647 | 0.984 | 38.4 KiB | 42.6 KiB |
| doitgen | HIP | 0.2739 | 0.0164 | 0.2575 | 0.2726 | 0.0166 | 0.2560 | 0.990 | 34.5 KiB | 38.6 KiB |
| fdtd-2d | HIP | 0.3249 | 0.0548 | 0.2701 | 0.3242 | 0.0550 | 0.2692 | 0.997 | 42.4 KiB | 46.6 KiB |
| gemm | HIP | 0.2437 | 0.0114 | 0.2324 | 0.2457 | 0.0116 | 0.2341 | 0.980 | 30.1 KiB | 34.3 KiB |
| gemver | HIP | 0.2811 | 0.0142 | 0.2670 | 0.2783 | 0.0139 | 0.2644 | 1.019 | 38.4 KiB | 42.6 KiB |
| gesummv | HIP | 0.2881 | 0.0040 | 0.2841 | 0.2901 | 0.0039 | 0.2862 | 1.011 | 30.1 KiB | 34.3 KiB |
| gramschmidt | HIP | 2.5595 | 2.2961 | 0.2633 | 2.4809 | 2.2163 | 0.2646 | 1.036 | 38.5 KiB | 42.6 KiB |
| jacobi-1d-imper | HIP | 0.4297 | 0.2293 | 0.2004 | 0.4237 | 0.2264 | 0.1973 | 1.013 | 34.1 KiB | 38.3 KiB |
| jacobi-2d-imper | HIP | 0.2567 | 0.0118 | 0.2449 | 0.2553 | 0.0116 | 0.2437 | 1.024 | 34.1 KiB | 38.3 KiB |
| lu | HIP | 0.3093 | 0.0631 | 0.2462 | 0.3125 | 0.0634 | 0.2491 | 0.997 | 34.3 KiB | 38.4 KiB |
| mvt | HIP | 0.2582 | 0.0022 | 0.2561 | 0.2607 | 0.0022 | 0.2586 | 1.005 | 34.3 KiB | 38.4 KiB |
| syr2k | HIP | 0.2641 | 0.0192 | 0.2449 | 0.2700 | 0.0194 | 0.2506 | 0.992 | 30.2 KiB | 34.3 KiB |
| syrk | HIP | 0.2590 | 0.0137 | 0.2453 | 0.2543 | 0.0139 | 0.2404 | 0.984 | 30.1 KiB | 34.3 KiB |

**Total GPU CIR/OG (geomean):** `1.0021`

