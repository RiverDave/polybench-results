PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `b5b34ff37`
- Scripts commit: `b849634`
- arch: `sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_90-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`

## Environment

- hostname: `68-209-73-39`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 80GB HBM3`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-05T14:01:15+00:00`

## Results (wall seconds, polybench timer)

| Benchmark | Source set | CIR mean | CIR σ | CIR med | OG mean | OG σ | OG med | CIR/OG | CIR size | OG size | size ratio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.0002 | 0.0000 | 0.0002 | 0.0002 | 0.0000 | 0.0002 | 0.980 | 26.1 KiB | 26.3 KiB | 0.995 |
| 2mm | CUDA | 0.0026 | 0.0000 | 0.0026 | 0.0026 | 0.0000 | 0.0026 | 1.001 | 38.2 KiB | 38.4 KiB | 0.996 |
| convolution-3d | CUDA | 0.0008 | 0.0000 | 0.0009 | 0.0008 | 0.0000 | 0.0009 | 0.989 | 26.1 KiB | 26.3 KiB | 0.994 |
| 3mm | CUDA | 0.0007 | 0.0000 | 0.0007 | 0.0007 | 0.0000 | 0.0007 | 1.001 | 46.3 KiB | 46.4 KiB | 0.997 |
| adi | CUDA | 0.0191 | 0.0002 | 0.0190 | 0.0190 | 0.0001 | 0.0190 | 1.007 | 58.4 KiB | 58.5 KiB | 0.997 |
| atax | CUDA | 0.0024 | 0.0000 | 0.0024 | 0.0024 | 0.0000 | 0.0024 | 0.997 | 34.2 KiB | 34.3 KiB | 0.996 |
| bicg | CUDA | 0.0023 | 0.0000 | 0.0023 | 0.0023 | 0.0000 | 0.0023 | 1.001 | 34.2 KiB | 34.4 KiB | 0.996 |
| correlation | CUDA | 1.1008 | 0.0023 | 1.1023 | 1.0992 | 0.0021 | 1.0982 | 1.001 | 54.4 KiB | 54.5 KiB | 0.997 |
| covariance | CUDA | 1.0994 | 0.0020 | 1.0984 | 1.0994 | 0.0020 | 1.0983 | 1.000 | 42.3 KiB | 42.4 KiB | 0.997 |
| doitgen | CUDA | 0.0051 | 0.0000 | 0.0051 | 0.0051 | 0.0000 | 0.0051 | 1.000 | 34.5 KiB | 34.5 KiB | 0.999 |
| fdtd-2d | CUDA | 0.0412 | 0.0001 | 0.0413 | 0.0413 | 0.0001 | 0.0412 | 0.999 | 34.2 KiB | 34.4 KiB | 0.996 |
| gemm | CUDA | 0.0003 | 0.0000 | 0.0003 | 0.0003 | 0.0000 | 0.0003 | 1.011 | 30.1 KiB | 30.2 KiB | 0.995 |
| gemver | CUDA | 0.0024 | 0.0000 | 0.0024 | 0.0024 | 0.0000 | 0.0024 | 0.999 | 42.3 KiB | 42.4 KiB | 0.997 |
| gesummv | CUDA | 0.0016 | 0.0000 | 0.0016 | 0.0016 | 0.0000 | 0.0015 | 1.004 | 30.1 KiB | 30.2 KiB | 0.995 |
| gramschmidt | CUDA | 1.4861 | 0.0007 | 1.4859 | 1.4863 | 0.0004 | 1.4864 | 1.000 | 46.3 KiB | 50.5 KiB | 0.918 |
| jacobi-1d-imper | CUDA | 0.1612 | 0.0006 | 0.1615 | 0.1610 | 0.0004 | 0.1609 | 1.001 | 26.0 KiB | 26.1 KiB | 0.994 |
| jacobi-2d-imper | CUDA | 0.0006 | 0.0000 | 0.0006 | 0.0006 | 0.0000 | 0.0006 | 0.999 | 26.0 KiB | 30.2 KiB | 0.862 |
| lu | CUDA | 0.0397 | 0.0003 | 0.0396 | 0.0395 | 0.0002 | 0.0395 | 1.006 | 30.2 KiB | 30.3 KiB | 0.995 |
| mvt | CUDA | 0.0024 | 0.0000 | 0.0024 | 0.0024 | 0.0000 | 0.0024 | 0.998 | 34.2 KiB | 34.3 KiB | 0.996 |
| syr2k | CUDA | 0.0093 | 0.0000 | 0.0093 | 0.0093 | 0.0000 | 0.0093 | 1.000 | 26.1 KiB | 26.2 KiB | 0.994 |
| syrk | CUDA | 0.0048 | 0.0000 | 0.0048 | 0.0048 | 0.0000 | 0.0048 | 1.000 | 30.1 KiB | 30.2 KiB | 0.995 |
