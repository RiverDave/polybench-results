PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `7a94fd56356d`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp-armA/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `132-145-169-56`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `f5613c4`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git 7a94fd56356deefa9af714839dc33026acadb0cc)`
- timestamp utc: `2026-09-12T23:20:53+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5697 | 0.0004 | 0.5694 | 0.5687 | 0.0004 | 0.5683 | 1.022 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 0.2221 | 0.0054 | 0.2167 | 0.2220 | 0.0054 | 0.2166 | 1.000 | 38.3 KiB | 38.3 KiB |
| convolution-3d | CUDA | 0.3195 | 0.0010 | 0.3186 | 0.3197 | 0.0010 | 0.3188 | 0.996 | 26.2 KiB | 26.2 KiB |
| 3mm | CUDA | 0.2059 | 0.0014 | 0.2046 | 0.2064 | 0.0014 | 0.2050 | 0.998 | 42.4 KiB | 42.4 KiB |
| adi | CUDA | 0.2307 | 0.0163 | 0.2144 | 0.2311 | 0.0163 | 0.2147 | 1.005 | 58.5 KiB | 58.5 KiB |
| atax | CUDA | 0.2389 | 0.0030 | 0.2359 | 0.2401 | 0.0030 | 0.2370 | 1.000 | 34.3 KiB | 34.3 KiB |
| bicg | CUDA | 0.2395 | 0.0024 | 0.2372 | 0.2396 | 0.0024 | 0.2372 | 1.001 | 34.3 KiB | 34.3 KiB |
| correlation | CUDA | 1.9222 | 1.6854 | 0.2368 | 1.9187 | 1.6846 | 0.2341 | 1.000 | 50.5 KiB | 50.5 KiB |
| covariance | CUDA | 1.9197 | 1.6858 | 0.2339 | 1.9190 | 1.6866 | 0.2324 | 1.000 | 38.4 KiB | 38.4 KiB |
| doitgen | CUDA | 0.2243 | 0.0048 | 0.2195 | 0.2239 | 0.0048 | 0.2191 | 1.000 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4262 | 0.1785 | 0.2477 | 0.4241 | 0.1785 | 0.2456 | 1.000 | 34.3 KiB | 34.3 KiB |
| gemm | CUDA | 0.2132 | 0.0005 | 0.2128 | 0.2026 | 0.0005 | 0.2021 | 0.986 | 30.2 KiB | 30.2 KiB |
| gemver | CUDA | 0.2463 | 0.0027 | 0.2436 | 0.2398 | 0.0027 | 0.2371 | 0.999 | 38.4 KiB | 38.3 KiB |
| gesummv | CUDA | 0.3091 | 0.0018 | 0.3074 | 0.3033 | 0.0018 | 0.3016 | 0.998 | 30.1 KiB | 30.1 KiB |
| gramschmidt | CUDA | 2.7197 | 2.4785 | 0.2412 | 2.7207 | 2.4790 | 0.2417 | 1.000 | 42.4 KiB | 42.4 KiB |
| jacobi-1d-imper | CUDA | 0.3327 | 0.1296 | 0.2031 | 0.3307 | 0.1287 | 0.2020 | 0.993 | 26.1 KiB | 26.1 KiB |
| jacobi-2d-imper | CUDA | 0.2267 | 0.0010 | 0.2257 | 0.2129 | 0.0010 | 0.2119 | 1.015 | 26.1 KiB | 26.1 KiB |
| lu | CUDA | 0.2767 | 0.0497 | 0.2270 | 0.2749 | 0.0498 | 0.2251 | 1.001 | 30.2 KiB | 30.2 KiB |
| mvt | CUDA | 0.2397 | 0.0030 | 0.2367 | 0.2391 | 0.0030 | 0.2361 | 1.000 | 34.2 KiB | 34.2 KiB |
| syr2k | CUDA | 0.2321 | 0.0193 | 0.2128 | 0.2341 | 0.0193 | 0.2148 | 1.000 | 26.2 KiB | 26.2 KiB |
| syrk | CUDA | 0.2191 | 0.0099 | 0.2091 | 0.2197 | 0.0099 | 0.2098 | 1.000 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0006`

- Validation: `40/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
- [CIR-merge] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
