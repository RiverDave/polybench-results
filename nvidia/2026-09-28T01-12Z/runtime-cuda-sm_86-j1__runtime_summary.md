PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `ddfd541ee890`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_86-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `64-181-226-248`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git ddfd541ee890e0d817bb6f910673f0b3de71716a)`
- timestamp utc: `2026-09-28T01:12:29+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | OG wall | OG GPU | OG host | GPU OG/CIR | CIR size | OG size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5704 | 0.0004 | 0.5700 | 0.5683 | 0.0004 | 0.5680 | 1.000 | 26.2 KiB | 26.4 KiB |
| 2mm | CUDA | 0.2344 | 0.0054 | 0.2290 | 0.2272 | 0.0054 | 0.2218 | 0.998 | 38.3 KiB | 38.5 KiB |
| convolution-3d | CUDA | 0.3194 | 0.0010 | 0.3185 | 0.3261 | 0.0010 | 0.3251 | 1.003 | 26.2 KiB | 26.4 KiB |
| 3mm | CUDA | 0.2082 | 0.0014 | 0.2068 | 0.2066 | 0.0014 | 0.2053 | 0.999 | 46.4 KiB | 42.5 KiB |
| adi | CUDA | 0.2310 | 0.0163 | 0.2147 | 0.2311 | 0.0162 | 0.2148 | 0.998 | 58.5 KiB | 58.6 KiB |
| atax | CUDA | 0.2399 | 0.0030 | 0.2368 | 0.2466 | 0.0030 | 0.2435 | 0.995 | 34.3 KiB | 34.4 KiB |
| bicg | CUDA | 0.2514 | 0.0024 | 0.2490 | 0.2522 | 0.0024 | 0.2498 | 0.997 | 34.3 KiB | 34.4 KiB |
| correlation | CUDA | 1.9492 | 1.6915 | 0.2577 | 1.9303 | 1.6842 | 0.2462 | 0.996 | 50.5 KiB | 50.6 KiB |
| covariance | CUDA | 1.9237 | 1.6910 | 0.2327 | 1.9168 | 1.6846 | 0.2322 | 0.996 | 38.4 KiB | 38.5 KiB |
| doitgen | CUDA | 0.2229 | 0.0048 | 0.2181 | 0.2235 | 0.0048 | 0.2188 | 0.993 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4301 | 0.1786 | 0.2515 | 0.4275 | 0.1785 | 0.2489 | 1.000 | 34.3 KiB | 34.5 KiB |
| gemm | CUDA | 0.2014 | 0.0005 | 0.2009 | 0.2032 | 0.0005 | 0.2028 | 1.004 | 30.2 KiB | 30.3 KiB |
| gemver | CUDA | 0.2535 | 0.0027 | 0.2508 | 0.2394 | 0.0027 | 0.2367 | 0.994 | 38.4 KiB | 38.5 KiB |
| gesummv | CUDA | 0.3114 | 0.0018 | 0.3096 | 0.3249 | 0.0018 | 0.3232 | 0.989 | 30.1 KiB | 30.3 KiB |
| gramschmidt | CUDA | 2.7092 | 2.4666 | 0.2426 | 2.7316 | 2.4758 | 0.2558 | 1.004 | 46.4 KiB | 42.5 KiB |
| jacobi-1d-imper | CUDA | 0.3311 | 0.1293 | 0.2017 | 0.3301 | 0.1288 | 0.2013 | 0.996 | 26.1 KiB | 26.2 KiB |
| jacobi-2d-imper | CUDA | 0.2192 | 0.0010 | 0.2182 | 0.2189 | 0.0010 | 0.2179 | 1.002 | 26.1 KiB | 26.2 KiB |
| lu | CUDA | 0.2748 | 0.0499 | 0.2249 | 0.2853 | 0.0501 | 0.2352 | 1.004 | 30.2 KiB | 30.4 KiB |
| mvt | CUDA | 0.2402 | 0.0030 | 0.2372 | 0.2400 | 0.0030 | 0.2370 | 0.996 | 34.2 KiB | 34.4 KiB |
| syr2k | CUDA | 0.2321 | 0.0193 | 0.2128 | 0.2319 | 0.0193 | 0.2126 | 1.000 | 26.2 KiB | 26.3 KiB |
| syrk | CUDA | 0.2191 | 0.0100 | 0.2092 | 0.2198 | 0.0100 | 0.2099 | 1.001 | 30.2 KiB | 30.3 KiB |

**Total GPU OG/CIR (geomean):** `0.9983`

- Validation: `41/42` passed

## Validation failures

- [OG] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
