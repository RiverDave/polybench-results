PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `1dd0f8aae237`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_86-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `146-235-204-187`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git d8acab4bec216ddc3414880670f5506d69647ccd)`
- timestamp utc: `2026-09-28T06:25:19+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | OG wall | OG GPU | OG host | GPU OG/CIR | CIR size | OG size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5694 | 0.0004 | 0.5690 | 0.5694 | 0.0004 | 0.5691 | 0.999 | 26.2 KiB | 26.4 KiB |
| 2mm | CUDA | 0.2222 | 0.0054 | 0.2167 | 0.2205 | 0.0054 | 0.2151 | 0.998 | 38.3 KiB | 38.5 KiB |
| convolution-3d | CUDA | 0.3199 | 0.0010 | 0.3189 | 0.3201 | 0.0010 | 0.3191 | 0.995 | 26.2 KiB | 26.4 KiB |
| 3mm | CUDA | 0.2073 | 0.0014 | 0.2059 | 0.2089 | 0.0014 | 0.2076 | 0.998 | 46.4 KiB | 42.5 KiB |
| adi | CUDA | 0.2326 | 0.0167 | 0.2159 | 0.2317 | 0.0163 | 0.2154 | 0.979 | 58.5 KiB | 58.6 KiB |
| atax | CUDA | 0.2401 | 0.0030 | 0.2370 | 0.2398 | 0.0030 | 0.2368 | 0.995 | 34.3 KiB | 34.4 KiB |
| bicg | CUDA | 0.2400 | 0.0024 | 0.2376 | 0.2400 | 0.0024 | 0.2376 | 0.995 | 34.3 KiB | 34.4 KiB |
| correlation | CUDA | 1.9237 | 1.6921 | 0.2317 | 1.9169 | 1.6844 | 0.2325 | 0.995 | 50.5 KiB | 50.6 KiB |
| covariance | CUDA | 1.9240 | 1.6924 | 0.2315 | 1.9194 | 1.6865 | 0.2329 | 0.997 | 38.4 KiB | 38.5 KiB |
| doitgen | CUDA | 0.2248 | 0.0049 | 0.2200 | 0.2250 | 0.0048 | 0.2202 | 0.989 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4259 | 0.1787 | 0.2472 | 0.4251 | 0.1788 | 0.2464 | 1.000 | 34.3 KiB | 34.5 KiB |
| gemm | CUDA | 0.2038 | 0.0005 | 0.2033 | 0.2027 | 0.0005 | 0.2023 | 1.002 | 30.2 KiB | 30.3 KiB |
| gemver | CUDA | 0.2411 | 0.0027 | 0.2384 | 0.2411 | 0.0027 | 0.2384 | 0.995 | 38.4 KiB | 38.5 KiB |
| gesummv | CUDA | 0.3224 | 0.0018 | 0.3206 | 0.3229 | 0.0018 | 0.3211 | 0.999 | 30.1 KiB | 30.3 KiB |
| gramschmidt | CUDA | 2.7135 | 2.4700 | 0.2435 | 2.7230 | 2.4794 | 0.2437 | 1.004 | 46.4 KiB | 42.5 KiB |
| jacobi-1d-imper | CUDA | 0.3301 | 0.1287 | 0.2014 | 0.3305 | 0.1298 | 0.2007 | 1.008 | 26.1 KiB | 26.2 KiB |
| jacobi-2d-imper | CUDA | 0.2125 | 0.0010 | 0.2115 | 0.2100 | 0.0010 | 0.2090 | 0.998 | 26.1 KiB | 26.2 KiB |
| lu | CUDA | 0.2771 | 0.0502 | 0.2269 | 0.2760 | 0.0502 | 0.2258 | 0.999 | 30.2 KiB | 30.4 KiB |
| mvt | CUDA | 0.2397 | 0.0030 | 0.2367 | 0.2390 | 0.0030 | 0.2360 | 0.996 | 34.2 KiB | 34.4 KiB |
| syr2k | CUDA | 0.2328 | 0.0193 | 0.2135 | 0.2333 | 0.0193 | 0.2140 | 1.000 | 26.2 KiB | 26.3 KiB |
| syrk | CUDA | 0.2188 | 0.0099 | 0.2088 | 0.2195 | 0.0099 | 0.2096 | 1.000 | 30.2 KiB | 30.3 KiB |

**Total GPU OG/CIR (geomean):** `0.9973`

- Validation: `41/42` passed

## Validation failures

- [OG] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
