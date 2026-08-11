PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `de5bda2`
- arch: `sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_90-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`

## Environment

- hostname: `209-20-156-202`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 PCIe`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-08T09:16:11+00:00`

## Results (wall seconds, polybench timer)

| Benchmark | Source set | CIR mean | CIR σ | CIR med | OG mean | OG σ | OG med | CIR/OG | CIR size | OG size | size ratio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.0002 | 0.0000 | 0.0002 | 0.0002 | 0.0000 | 0.0002 | 0.983 | 26.1 KiB | 26.3 KiB | 0.995 |
| 2mm | CUDA | 0.0030 | 0.0000 | 0.0030 | 0.0030 | 0.0000 | 0.0030 | 1.009 | 38.2 KiB | 38.4 KiB | 0.996 |
| convolution-3d | CUDA | 0.0011 | 0.0001 | 0.0011 | 0.0011 | 0.0000 | 0.0011 | 1.001 | 26.1 KiB | 26.3 KiB | 0.994 |
| 3mm | CUDA | 0.0009 | 0.0000 | 0.0009 | 0.0009 | 0.0000 | 0.0009 | 1.020 | 46.3 KiB | 46.4 KiB | 0.997 |
| adi | CUDA | 0.0218 | 0.0002 | 0.0218 | 0.0214 | 0.0011 | 0.0220 | 1.019 | 58.4 KiB | 58.5 KiB | 0.997 |
| atax | CUDA | 0.0032 | 0.0000 | 0.0032 | 0.0032 | 0.0000 | 0.0032 | 0.998 | 34.2 KiB | 34.3 KiB | 0.996 |
| bicg | CUDA | 0.0026 | 0.0000 | 0.0026 | 0.0026 | 0.0000 | 0.0026 | 1.003 | 34.2 KiB | 34.4 KiB | 0.996 |
| correlation | CUDA | 1.2414 | 0.0003 | 1.2414 | 1.2415 | 0.0003 | 1.2414 | 1.000 | 54.4 KiB | 54.5 KiB | 0.997 |
| covariance | CUDA | 1.2418 | 0.0004 | 1.2419 | 1.2421 | 0.0004 | 1.2421 | 1.000 | 42.3 KiB | 42.4 KiB | 0.997 |
| doitgen | CUDA | 0.0058 | 0.0001 | 0.0057 | 0.0058 | 0.0001 | 0.0058 | 0.990 | 34.5 KiB | 34.5 KiB | 0.999 |
| fdtd-2d | CUDA | 0.0574 | 0.0006 | 0.0576 | 0.0575 | 0.0006 | 0.0576 | 0.998 | 34.2 KiB | 34.4 KiB | 0.996 |
| gemm | CUDA | 0.0004 | 0.0000 | 0.0004 | 0.0004 | 0.0000 | 0.0004 | 1.019 | 30.1 KiB | 30.2 KiB | 0.995 |
| gemver | CUDA | 0.0028 | 0.0000 | 0.0028 | 0.0028 | 0.0000 | 0.0028 | 0.995 | 42.3 KiB | 42.4 KiB | 0.997 |
| gesummv | CUDA | 0.0018 | 0.0000 | 0.0018 | 0.0018 | 0.0000 | 0.0018 | 0.995 | 30.1 KiB | 30.2 KiB | 0.995 |
| gramschmidt | CUDA | 1.7750 | 0.0036 | 1.7732 | 1.7770 | 0.0038 | 1.7792 | 0.999 | 46.3 KiB | 50.5 KiB | 0.918 |
| jacobi-1d-imper | CUDA | 0.1817 | 0.0028 | 0.1823 | 0.1832 | 0.0015 | 0.1831 | 0.991 | 26.0 KiB | 26.1 KiB | 0.994 |
| jacobi-2d-imper | CUDA | 0.0007 | 0.0000 | 0.0007 | 0.0007 | 0.0000 | 0.0007 | 0.998 | 26.0 KiB | 30.2 KiB | 0.862 |
| lu | CUDA | 0.0449 | 0.0006 | 0.0447 | 0.0447 | 0.0018 | 0.0454 | 1.004 | 30.2 KiB | 30.3 KiB | 0.995 |
| mvt | CUDA | 0.0032 | 0.0000 | 0.0032 | 0.0032 | 0.0000 | 0.0032 | 1.001 | 34.2 KiB | 34.3 KiB | 0.996 |
| syr2k | CUDA | 0.0118 | 0.0000 | 0.0118 | 0.0118 | 0.0000 | 0.0118 | 1.000 | 26.1 KiB | 26.2 KiB | 0.994 |
| syrk | CUDA | 0.0062 | 0.0000 | 0.0062 | 0.0062 | 0.0000 | 0.0062 | 1.000 | 30.1 KiB | 30.2 KiB | 0.995 |
