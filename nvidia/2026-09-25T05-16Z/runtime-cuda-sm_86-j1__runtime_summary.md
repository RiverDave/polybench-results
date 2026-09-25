PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `138694b6d46c`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-ffma/runtime-cuda-sm_86-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `132-145-130-91`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git 138694b6d46c732c5d891545df7b8be1b832fe23)`
- timestamp utc: `2026-09-25T05:16:58+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | OG wall | OG GPU | OG host | GPU OG/CIR | CIR size | OG size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5786 | 0.0004 | 0.5782 | 0.5693 | 0.0004 | 0.5690 | 1.002 | 26.2 KiB | 26.4 KiB |
| 2mm | CUDA | 0.2204 | 0.0054 | 0.2150 | 0.2213 | 0.0054 | 0.2159 | 1.001 | 38.3 KiB | 38.5 KiB |
| convolution-3d | CUDA | 0.3200 | 0.0010 | 0.3190 | 0.3203 | 0.0010 | 0.3194 | 1.008 | 26.2 KiB | 26.4 KiB |
| 3mm | CUDA | 0.2076 | 0.0014 | 0.2062 | 0.2070 | 0.0014 | 0.2056 | 0.995 | 42.4 KiB | 42.5 KiB |
| adi | CUDA | 0.2304 | 0.0162 | 0.2142 | 0.2321 | 0.0162 | 0.2159 | 1.000 | 58.5 KiB | 58.6 KiB |
| atax | CUDA | 0.2403 | 0.0030 | 0.2373 | 0.2390 | 0.0030 | 0.2360 | 1.000 | 34.3 KiB | 34.4 KiB |
| bicg | CUDA | 0.2401 | 0.0024 | 0.2377 | 0.2401 | 0.0024 | 0.2378 | 1.001 | 34.3 KiB | 34.4 KiB |
| correlation | CUDA | 1.9171 | 1.6847 | 0.2324 | 1.9189 | 1.6843 | 0.2346 | 1.000 | 50.5 KiB | 50.6 KiB |
| covariance | CUDA | 1.9245 | 1.6854 | 0.2391 | 1.9172 | 1.6847 | 0.2325 | 1.000 | 38.4 KiB | 38.5 KiB |
| doitgen | CUDA | 0.2243 | 0.0048 | 0.2195 | 0.2242 | 0.0048 | 0.2194 | 0.994 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4243 | 0.1786 | 0.2456 | 0.4241 | 0.1786 | 0.2455 | 1.000 | 34.3 KiB | 34.5 KiB |
| gemm | CUDA | 0.2055 | 0.0005 | 0.2051 | 0.2056 | 0.0005 | 0.2051 | 1.008 | 30.2 KiB | 30.3 KiB |
| gemver | CUDA | 0.2402 | 0.0027 | 0.2375 | 0.2399 | 0.0027 | 0.2372 | 1.001 | 38.4 KiB | 38.5 KiB |
| gesummv | CUDA | 0.3050 | 0.0018 | 0.3032 | 0.3009 | 0.0018 | 0.2992 | 0.997 | 30.1 KiB | 30.3 KiB |
| gramschmidt | CUDA | 2.7292 | 2.4792 | 0.2500 | 2.7231 | 2.4792 | 0.2439 | 1.000 | 42.4 KiB | 42.5 KiB |
| jacobi-1d-imper | CUDA | 0.3306 | 0.1284 | 0.2022 | 0.3317 | 0.1281 | 0.2036 | 0.998 | 26.1 KiB | 26.2 KiB |
| jacobi-2d-imper | CUDA | 0.2126 | 0.0010 | 0.2116 | 0.2135 | 0.0010 | 0.2125 | 1.011 | 26.1 KiB | 26.2 KiB |
| lu | CUDA | 0.2771 | 0.0501 | 0.2271 | 0.2795 | 0.0502 | 0.2294 | 1.002 | 30.2 KiB | 30.4 KiB |
| mvt | CUDA | 0.2410 | 0.0030 | 0.2379 | 0.2475 | 0.0030 | 0.2445 | 1.001 | 34.2 KiB | 34.4 KiB |
| syr2k | CUDA | 0.2325 | 0.0193 | 0.2132 | 0.2325 | 0.0193 | 0.2132 | 1.000 | 26.2 KiB | 26.3 KiB |
| syrk | CUDA | 0.2197 | 0.0099 | 0.2097 | 0.2200 | 0.0099 | 0.2101 | 1.000 | 30.2 KiB | 30.3 KiB |

**Total GPU OG/CIR (geomean):** `1.0008`

- Validation: `40/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [OG] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
