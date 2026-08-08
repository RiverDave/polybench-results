PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `de5bda2`
- arch: `gfx942`
- PolyBench root: `/root/polybenchGpu`
- Logs: `/root/polybench-gpu-audit/temp/runtime-hip-gfx942-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`

## Environment

- hostname: `7`
- cpu: `INTEL(R) XEON(R) PLATINUM 8568Y+`
- cpu count: `20`
- gpu: `AMD Instinct MI300X VF`
- kernel: `6.8.0-134-generic`
- rocm version: `7.0.2`
- timestamp utc: `2026-08-08T03:52:08+00:00`

## Results (wall seconds, polybench timer)

| Benchmark | Source set | CIR mean | CIR σ | CIR med | OG mean | OG σ | OG med | CIR/OG | CIR size | OG size | size ratio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.0005 | 0.0000 | 0.0004 | 0.0005 | 0.0000 | 0.0005 | 0.875 | 30.1 KiB | 34.3 KiB | 0.879 |
| 2mm | HIP | 0.0017 | 0.0000 | 0.0017 | 0.0017 | 0.0001 | 0.0017 | 1.001 | 38.3 KiB | 42.4 KiB | 0.902 |
| convolution-3d | HIP | 0.0010 | 0.0000 | 0.0010 | 0.0010 | 0.0001 | 0.0010 | 1.003 | 30.1 KiB | 34.3 KiB | 0.878 |
| 3mm | HIP | 0.0011 | 0.0000 | 0.0010 | 0.0011 | 0.0001 | 0.0010 | 0.993 | 42.4 KiB | 46.5 KiB | 0.911 |
| adi | HIP | 0.0271 | 0.0003 | 0.0270 | 0.0272 | 0.0006 | 0.0269 | 0.994 | 46.6 KiB | 50.8 KiB | 0.918 |
| atax | HIP | 0.0023 | 0.0001 | 0.0022 | 0.0022 | 0.0001 | 0.0022 | 1.024 | 34.2 KiB | 38.4 KiB | 0.892 |
| bicg | HIP | 0.0036 | 0.0001 | 0.0036 | 0.0035 | 0.0000 | 0.0035 | 1.012 | 34.2 KiB | 38.4 KiB | 0.892 |
| correlation | HIP | 1.4577 | 0.0145 | 1.4562 | 1.4619 | 0.0133 | 1.4636 | 0.997 | 42.5 KiB | 46.7 KiB | 0.911 |
| covariance | HIP | 1.4565 | 0.0249 | 1.4591 | 1.4594 | 0.0251 | 1.4674 | 0.998 | 34.3 KiB | 42.5 KiB | 0.808 |
| doitgen | HIP | 0.0059 | 0.0000 | 0.0059 | 0.0058 | 0.0000 | 0.0058 | 1.007 | 38.5 KiB | 42.6 KiB | 0.905 |
| fdtd-2d | HIP | 0.0440 | 0.0001 | 0.0441 | 0.0439 | 0.0001 | 0.0439 | 1.003 | 38.3 KiB | 42.5 KiB | 0.902 |
| gemm | HIP | 0.0006 | 0.0000 | 0.0006 | 0.0006 | 0.0001 | 0.0006 | 0.961 | 30.1 KiB | 34.2 KiB | 0.878 |
| gemver | HIP | 0.0032 | 0.0000 | 0.0032 | 0.0032 | 0.0000 | 0.0032 | 0.993 | 42.4 KiB | 42.5 KiB | 0.996 |
| gesummv | HIP | 0.0040 | 0.0001 | 0.0040 | 0.0040 | 0.0001 | 0.0040 | 0.993 | 30.0 KiB | 34.2 KiB | 0.878 |
| gramschmidt | HIP | 2.2987 | 0.0007 | 2.2985 | 2.2161 | 0.0008 | 2.2159 | 1.037 | 42.4 KiB | 46.6 KiB | 0.911 |
| jacobi-1d-imper | HIP | 0.2204 | 0.0032 | 0.2191 | 0.2219 | 0.0051 | 0.2193 | 0.993 | 34.0 KiB | 38.2 KiB | 0.891 |
| jacobi-2d-imper | HIP | 0.0012 | 0.0001 | 0.0012 | 0.0012 | 0.0000 | 0.0012 | 1.016 | 34.1 KiB | 38.2 KiB | 0.891 |
| lu | HIP | 0.0522 | 0.0008 | 0.0521 | 0.0526 | 0.0009 | 0.0523 | 0.992 | 34.2 KiB | 38.3 KiB | 0.892 |
| mvt | HIP | 0.0021 | 0.0001 | 0.0021 | 0.0021 | 0.0000 | 0.0021 | 1.018 | 34.2 KiB | 38.3 KiB | 0.891 |
| syr2k | HIP | 0.0096 | 0.0001 | 0.0095 | 0.0084 | 0.0001 | 0.0084 | 1.139 | 30.1 KiB | 34.2 KiB | 0.879 |
| syrk | HIP | 0.0031 | 0.0001 | 0.0031 | 0.0030 | 0.0001 | 0.0030 | 1.008 | 30.1 KiB | 34.2 KiB | 0.879 |
