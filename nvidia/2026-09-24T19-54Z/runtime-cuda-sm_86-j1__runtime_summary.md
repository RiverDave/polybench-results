PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `f49e6d1b974c`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-pr225971/runtime-cuda-sm_86-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `150-136-88-168`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git f49e6d1b974caeaa18716ea303c0ab6e549f3fdf)`
- timestamp utc: `2026-09-24T19:54:06+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | OG wall | OG GPU | OG host | GPU OG/CIR | CIR size | OG size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5642 | 0.0003 | 0.5639 | 0.5638 | 0.0003 | 0.5634 | 1.006 | 26.2 KiB | 26.4 KiB |
| 2mm | CUDA | 0.2192 | 0.0054 | 0.2138 | 0.2201 | 0.0054 | 0.2147 | 1.000 | 38.3 KiB | 38.5 KiB |
| convolution-3d | CUDA | 0.3150 | 0.0009 | 0.3142 | 0.3163 | 0.0009 | 0.3155 | 1.005 | 26.2 KiB | 26.4 KiB |
| 3mm | CUDA | 0.2065 | 0.0014 | 0.2051 | 0.2051 | 0.0014 | 0.2037 | 0.998 | 46.4 KiB | 42.5 KiB |
| adi | CUDA | 0.2266 | 0.0148 | 0.2118 | 0.2282 | 0.0148 | 0.2135 | 1.000 | 58.5 KiB | 58.6 KiB |
| atax | CUDA | 0.2387 | 0.0030 | 0.2357 | 0.2459 | 0.0030 | 0.2429 | 0.997 | 34.3 KiB | 34.4 KiB |
| bicg | CUDA | 0.2400 | 0.0024 | 0.2376 | 0.2437 | 0.0024 | 0.2414 | 0.994 | 34.3 KiB | 34.4 KiB |
| correlation | CUDA | 1.9041 | 1.6752 | 0.2289 | 1.8994 | 1.6669 | 0.2325 | 0.995 | 50.5 KiB | 50.6 KiB |
| covariance | CUDA | 1.9191 | 1.6752 | 0.2439 | 1.8986 | 1.6689 | 0.2296 | 0.996 | 38.4 KiB | 38.5 KiB |
| doitgen | CUDA | 0.2224 | 0.0046 | 0.2178 | 0.2506 | 0.0046 | 0.2461 | 0.992 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4382 | 0.1589 | 0.2792 | 0.4392 | 0.1591 | 0.2801 | 1.001 | 34.3 KiB | 34.5 KiB |
| gemm | CUDA | 0.2456 | 0.0005 | 0.2452 | 0.2476 | 0.0005 | 0.2471 | 1.004 | 30.2 KiB | 30.3 KiB |
| gemver | CUDA | 0.2848 | 0.0027 | 0.2821 | 0.2757 | 0.0027 | 0.2730 | 0.995 | 38.4 KiB | 38.5 KiB |
| gesummv | CUDA | 0.3264 | 0.0018 | 0.3246 | 0.3250 | 0.0018 | 0.3233 | 0.995 | 30.1 KiB | 30.3 KiB |
| gramschmidt | CUDA | 2.7037 | 2.4256 | 0.2781 | 2.6791 | 2.4374 | 0.2418 | 1.005 | 46.4 KiB | 42.5 KiB |
| jacobi-1d-imper | CUDA | 0.3142 | 0.1138 | 0.2005 | 0.3221 | 0.1138 | 0.2084 | 1.000 | 26.1 KiB | 26.2 KiB |
| jacobi-2d-imper | CUDA | 0.2195 | 0.0009 | 0.2186 | 0.2102 | 0.0009 | 0.2093 | 1.001 | 26.1 KiB | 26.2 KiB |
| lu | CUDA | 0.2711 | 0.0451 | 0.2260 | 0.2699 | 0.0450 | 0.2248 | 0.999 | 30.2 KiB | 30.4 KiB |
| mvt | CUDA | 0.2392 | 0.0030 | 0.2362 | 0.2396 | 0.0030 | 0.2366 | 0.997 | 34.2 KiB | 34.4 KiB |
| syr2k | CUDA | 0.2326 | 0.0193 | 0.2133 | 0.2301 | 0.0193 | 0.2108 | 1.000 | 26.2 KiB | 26.3 KiB |
| syrk | CUDA | 0.2198 | 0.0100 | 0.2098 | 0.2244 | 0.0100 | 0.2144 | 1.000 | 30.2 KiB | 30.3 KiB |

**Total GPU OG/CIR (geomean):** `0.9990`

- Validation: `41/42` passed

## Validation failures

- [OG] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
