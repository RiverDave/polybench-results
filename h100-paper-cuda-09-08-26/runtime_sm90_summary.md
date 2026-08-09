PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `a82270d`
- arch: `sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_90-j26`
- Runs: 5 timed + 2 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`

## Environment

- hostname: `209-20-158-157`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 PCIe`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-09T02:48:04+00:00`

## Results (wall seconds, polybench timer)

| Benchmark | Source set | CIR mean | CIR σ | CIR med | OG mean | OG σ | OG med | CIR/OG | CIR size | OG size | size ratio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.0006 | 0.0001 | 0.0005 | 0.0009 | 0.0009 | 0.0005 | 0.636 | 26.1 KiB | 26.3 KiB | 0.995 |
| 2mm | CUDA | 0.0100 | 0.0093 | 0.0077 | 0.0103 | 0.0133 | 0.0043 | 0.976 | 38.2 KiB | 38.4 KiB | 0.996 |
| convolution-3d | CUDA | 0.0017 | 0.0001 | 0.0017 | 0.0022 | 0.0007 | 0.0019 | 0.781 | 26.1 KiB | 26.3 KiB | 0.994 |
| 3mm | CUDA | 0.0019 | 0.0011 | 0.0015 | 0.0020 | 0.0009 | 0.0015 | 0.954 | 46.3 KiB | 46.4 KiB | 0.997 |
| adi | CUDA | 0.6682 | 1.3982 | 0.0463 | 0.5661 | 0.8229 | 0.0948 | 1.180 | 58.4 KiB | 58.5 KiB | 0.997 |
| atax | CUDA | 0.0035 | 0.0001 | 0.0035 | 0.0045 | 0.0012 | 0.0047 | 0.766 | 34.2 KiB | 34.3 KiB | 0.996 |
| bicg | CUDA | 0.0032 | 0.0007 | 0.0029 | 0.0029 | 0.0002 | 0.0029 | 1.069 | 34.2 KiB | 34.4 KiB | 0.996 |
| correlation | CUDA | 1.4986 | 0.4549 | 1.2311 | 2.4951 | 0.2288 | 2.5182 | 0.601 | 54.4 KiB | 54.5 KiB | 0.997 |
| covariance | CUDA | 2.4853 | 0.2202 | 2.4997 | 1.4501 | 0.3574 | 1.2316 | 1.714 | 42.3 KiB | 42.4 KiB | 0.997 |
| doitgen | CUDA | 0.0084 | 0.0015 | 0.0076 | 0.0222 | 0.0248 | 0.0105 | 0.378 | 34.5 KiB | 34.5 KiB | 0.999 |
| fdtd-2d | CUDA | 1.8389 | 2.7927 | 1.0094 | 1.8610 | 2.7934 | 1.1027 | 0.988 | 34.2 KiB | 34.4 KiB | 0.996 |
| gemm | CUDA | 0.0007 | 0.0000 | 0.0007 | 0.0008 | 0.0000 | 0.0007 | 0.978 | 30.1 KiB | 30.2 KiB | 0.995 |
| gemver | CUDA | 0.0033 | 0.0005 | 0.0031 | 0.0031 | 0.0001 | 0.0031 | 1.049 | 42.3 KiB | 42.4 KiB | 0.997 |
| gesummv | CUDA | 0.0091 | 0.0114 | 0.0058 | 0.0114 | 0.0126 | 0.0031 | 0.801 | 30.1 KiB | 30.2 KiB | 0.995 |
| gramschmidt | CUDA | 4.2599 | 1.4242 | 3.6503 | 4.4548 | 1.7944 | 3.6548 | 0.956 | 46.3 KiB | 50.5 KiB | 0.918 |
| jacobi-1d-imper | CUDA | 6.4055 | 3.9830 | 7.1571 | 6.4238 | 3.9831 | 7.2035 | 0.997 | 26.0 KiB | 26.1 KiB | 0.994 |
| jacobi-2d-imper | CUDA | 0.1266 | 0.1739 | 0.0208 | 0.1195 | 0.1710 | 0.0280 | 1.060 | 26.0 KiB | 30.2 KiB | 0.862 |
| lu | CUDA | 2.1776 | 0.3036 | 2.2030 | 1.3000 | 1.1481 | 1.8402 | 1.675 | 30.2 KiB | 30.3 KiB | 0.995 |
| mvt | CUDA | 0.0099 | 0.0110 | 0.0054 | 0.0111 | 0.0109 | 0.0071 | 0.887 | 34.2 KiB | 34.3 KiB | 0.996 |
| syr2k | CUDA | 0.0185 | 0.0048 | 0.0192 | 0.0208 | 0.0113 | 0.0163 | 0.886 | 26.1 KiB | 26.2 KiB | 0.994 |
| syrk | CUDA | 0.0109 | 0.0052 | 0.0081 | 0.0125 | 0.0088 | 0.0087 | 0.871 | 30.1 KiB | 30.2 KiB | 0.995 |
