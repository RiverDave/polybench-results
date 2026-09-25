PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `f49e6d1b974c`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-pr225971-rezip/runtime-cuda-sm_86-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `132-145-166-128`
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
- timestamp utc: `2026-09-25T00:14:53+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | OG wall | OG GPU | OG host | GPU OG/CIR | CIR size | OG size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5666 | 0.0004 | 0.5662 | 0.5655 | 0.0004 | 0.5652 | 0.996 | 26.2 KiB | 26.4 KiB |
| 2mm | CUDA | 0.2202 | 0.0054 | 0.2147 | 0.2208 | 0.0054 | 0.2154 | 0.996 | 38.3 KiB | 38.5 KiB |
| convolution-3d | CUDA | 0.3197 | 0.0010 | 0.3187 | 0.3180 | 0.0010 | 0.3170 | 1.003 | 26.2 KiB | 26.4 KiB |
| 3mm | CUDA | 0.2091 | 0.0014 | 0.2077 | 0.2074 | 0.0014 | 0.2060 | 0.998 | 46.4 KiB | 42.5 KiB |
| adi | CUDA | 0.2302 | 0.0163 | 0.2139 | 0.2305 | 0.0163 | 0.2142 | 0.999 | 58.5 KiB | 58.6 KiB |
| atax | CUDA | 0.2392 | 0.0030 | 0.2361 | 0.2394 | 0.0030 | 0.2364 | 0.995 | 34.3 KiB | 34.4 KiB |
| bicg | CUDA | 0.2400 | 0.0024 | 0.2376 | 0.2400 | 0.0024 | 0.2376 | 0.996 | 34.3 KiB | 34.4 KiB |
| correlation | CUDA | 1.9223 | 1.6915 | 0.2307 | 1.9169 | 1.6842 | 0.2327 | 0.996 | 50.5 KiB | 50.6 KiB |
| covariance | CUDA | 1.9221 | 1.6920 | 0.2301 | 1.9161 | 1.6854 | 0.2307 | 0.996 | 38.4 KiB | 38.5 KiB |
| doitgen | CUDA | 0.2210 | 0.0048 | 0.2162 | 0.2215 | 0.0048 | 0.2167 | 0.994 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4216 | 0.1786 | 0.2429 | 0.4203 | 0.1786 | 0.2417 | 1.000 | 34.3 KiB | 34.5 KiB |
| gemm | CUDA | 0.2105 | 0.0005 | 0.2100 | 0.2052 | 0.0005 | 0.2047 | 1.009 | 30.2 KiB | 30.3 KiB |
| gemver | CUDA | 0.2388 | 0.0027 | 0.2361 | 0.2395 | 0.0027 | 0.2368 | 0.997 | 38.4 KiB | 38.5 KiB |
| gesummv | CUDA | 0.3125 | 0.0018 | 0.3108 | 0.2814 | 0.0018 | 0.2796 | 0.995 | 30.1 KiB | 30.3 KiB |
| gramschmidt | CUDA | 2.7092 | 2.4693 | 0.2398 | 2.7185 | 2.4791 | 0.2394 | 1.004 | 46.4 KiB | 42.5 KiB |
| jacobi-1d-imper | CUDA | 0.3302 | 0.1290 | 0.2012 | 0.3304 | 0.1298 | 0.2006 | 1.006 | 26.1 KiB | 26.2 KiB |
| jacobi-2d-imper | CUDA | 0.2121 | 0.0010 | 0.2111 | 0.2110 | 0.0010 | 0.2100 | 1.000 | 26.1 KiB | 26.2 KiB |
| lu | CUDA | 0.2767 | 0.0503 | 0.2264 | 0.2742 | 0.0500 | 0.2241 | 0.995 | 30.2 KiB | 30.4 KiB |
| mvt | CUDA | 0.2461 | 0.0030 | 0.2430 | 0.2396 | 0.0030 | 0.2366 | 0.995 | 34.2 KiB | 34.4 KiB |
| syr2k | CUDA | 0.2317 | 0.0193 | 0.2124 | 0.2302 | 0.0193 | 0.2109 | 1.000 | 26.2 KiB | 26.3 KiB |
| syrk | CUDA | 0.2193 | 0.0099 | 0.2094 | 0.2199 | 0.0099 | 0.2100 | 1.000 | 30.2 KiB | 30.3 KiB |

**Total GPU OG/CIR (geomean):** `0.9985`

- Validation: `41/42` passed

## Validation failures

- [OG] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
