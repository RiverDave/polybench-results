PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `fbda065af219`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `150-136-153-114`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `f5613c4`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git fbda065af219571d11b1fce76f52d8ab3bcd0882)`
- timestamp utc: `2026-09-12T07:42:47+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5999 | 0.0004 | 0.5995 | 0.6070 | 0.0004 | 0.6066 | 1.002 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 0.2240 | 0.0054 | 0.2186 | 0.2277 | 0.0024 | 0.2254 | 0.439 | 38.3 KiB | 38.3 KiB |
| convolution-3d | CUDA | 0.3545 | 0.0010 | 0.3535 | 0.3387 | 0.0010 | 0.3377 | 1.004 | 26.2 KiB | 26.2 KiB |
| 3mm | CUDA | 0.2093 | 0.0014 | 0.2079 | 0.2093 | 0.0006 | 0.2087 | 0.444 | 42.4 KiB | 42.4 KiB |
| adi | CUDA | 0.2334 | 0.0163 | 0.2171 | 0.2334 | 0.0162 | 0.2172 | 0.992 | 58.5 KiB | 54.5 KiB |
| atax | CUDA | 0.2435 | 0.0030 | 0.2405 | 0.2404 | 0.0017 | 0.2387 | 0.560 | 34.3 KiB | 34.3 KiB |
| bicg | CUDA | 0.2717 | 0.0024 | 0.2693 | 0.2406 | 0.0010 | 0.2396 | 0.423 | 34.3 KiB | 34.3 KiB |
| correlation | CUDA | 1.9212 | 1.6848 | 0.2364 | 0.4709 | 0.2361 | 0.2349 | 0.140 | 50.5 KiB | 46.5 KiB |
| covariance | CUDA | 1.9252 | 1.6856 | 0.2396 | 0.4721 | 0.2391 | 0.2330 | 0.142 | 38.4 KiB | 38.4 KiB |
| doitgen | CUDA | 0.2247 | 0.0048 | 0.2199 | 0.2305 | 0.0024 | 0.2281 | 0.499 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4379 | 0.1788 | 0.2591 | 0.4508 | 0.1790 | 0.2718 | 1.001 | 34.3 KiB | 34.3 KiB |
| gemm | CUDA | 0.2088 | 0.0005 | 0.2083 | 0.2055 | 0.0002 | 0.2052 | 0.531 | 30.2 KiB | 30.2 KiB |
| gemver | CUDA | 0.2565 | 0.0027 | 0.2538 | 0.2637 | 0.0013 | 0.2624 | 0.490 | 38.4 KiB | 38.3 KiB |
| gesummv | CUDA | 0.3152 | 0.0018 | 0.3134 | 0.3322 | 0.0014 | 0.3308 | 0.788 | 30.1 KiB | 30.1 KiB |
| gramschmidt | CUDA | 2.7451 | 2.4811 | 0.2640 | 1.3690 | 1.1043 | 0.2647 | 0.445 | 42.4 KiB | 42.4 KiB |
| jacobi-1d-imper | CUDA | 0.3519 | 0.1312 | 0.2208 | 0.3424 | 0.1299 | 0.2124 | 0.991 | 26.1 KiB | 26.1 KiB |
| jacobi-2d-imper | CUDA | 0.2391 | 0.0010 | 0.2381 | 0.2330 | 0.0010 | 0.2320 | 1.015 | 26.1 KiB | 26.1 KiB |
| lu | CUDA | 0.2968 | 0.0509 | 0.2459 | 0.3084 | 0.0509 | 0.2575 | 1.000 | 30.2 KiB | 30.2 KiB |
| mvt | CUDA | 0.2618 | 0.0030 | 0.2588 | 0.2810 | 0.0017 | 0.2793 | 0.563 | 34.2 KiB | 34.2 KiB |
| syr2k | CUDA | 0.2375 | 0.0193 | 0.2182 | 0.2433 | 0.0187 | 0.2245 | 0.969 | 26.2 KiB | 26.2 KiB |
| syrk | CUDA | 0.2306 | 0.0100 | 0.2207 | 0.2218 | 0.0093 | 0.2125 | 0.936 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.5994`

- Validation: `41/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
