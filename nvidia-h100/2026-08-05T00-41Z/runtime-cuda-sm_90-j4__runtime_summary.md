PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `cd459f246`
- Scripts commit: `126e8ed`
- arch: `sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_90-j4`
- Runs: 5 timed + 2 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`

## Environment

- hostname: `68-209-74-37`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 80GB HBM3`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-05T00:39:23+00:00`

## Results (wall seconds, polybench timer)

| Benchmark | Source set | CIR mean | CIR σ | CIR med | OG mean | OG σ | OG med | CIR/OG | CIR size | OG size | size ratio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.0325 | 0.0003 | 0.0324 | 0.0328 | 0.0006 | 0.0328 | 0.992 | 26.1 KiB | 26.3 KiB | 0.995 |
| 2mm | CUDA | 10.7347 | 0.0233 | 10.7355 | 10.4899 | 0.0448 | 10.5157 | 1.023 | 38.2 KiB | 38.4 KiB | 0.996 |
| convolution-3d | CUDA | 0.0395 | 0.0004 | 0.0397 | 0.0399 | 0.0006 | 0.0397 | 0.991 | 26.1 KiB | 26.3 KiB | 0.994 |
| 3mm | CUDA | 0.2693 | 0.0165 | 0.2621 | 0.2820 | 0.0190 | 0.2864 | 0.955 | 46.3 KiB | 46.4 KiB | 0.997 |
| adi | CUDA | 0.0072 | 0.0001 | 0.0072 | 0.0073 | 0.0001 | 0.0073 | 0.987 | 58.4 KiB | 58.5 KiB | 0.997 |
| atax | CUDA | 0.0117 | 0.0001 | 0.0117 | 0.0128 | 0.0013 | 0.0127 | 0.914 | 34.2 KiB | 34.3 KiB | 0.996 |
| bicg | CUDA | 0.0362 | 0.0003 | 0.0361 | 0.0359 | 0.0000 | 0.0359 | 1.007 | 34.2 KiB | 34.4 KiB | 0.996 |
| correlation | CUDA | 38.0071 | 0.8725 | 38.1703 | 36.7469 | 0.1857 | 36.6714 | 1.034 | 54.4 KiB | 54.5 KiB | 0.997 |
| covariance | CUDA | 37.7594 | 0.3882 | 37.5879 | 38.4310 | 0.5162 | 38.2100 | 0.983 | 42.3 KiB | 42.4 KiB | 0.997 |
| doitgen | CUDA | 0.0005 | 0.0000 | 0.0005 | 0.0051 | 0.0000 | 0.0051 | 0.096 | 34.5 KiB | 34.5 KiB | 0.999 |
| fdtd-2d | CUDA | 3.1591 | 0.0143 | 3.1593 | 3.2601 | 0.3295 | 3.1879 | 0.969 | 34.2 KiB | 34.4 KiB | 0.996 |
| gemm | CUDA | 0.1010 | 0.0132 | 0.0951 | 0.1074 | 0.0177 | 0.0951 | 0.940 | 30.1 KiB | 30.2 KiB | 0.995 |
| gemver | CUDA | 0.1261 | 0.0041 | 0.1275 | 0.1233 | 0.0015 | 0.1234 | 1.023 | 42.3 KiB | 42.4 KiB | 0.997 |
| gesummv | CUDA | 0.0387 | 0.0000 | 0.0387 | 0.0389 | 0.0003 | 0.0391 | 0.994 | 30.1 KiB | 30.2 KiB | 0.995 |
| gramschmidt | CUDA | 93.3182 | 0.4718 | 93.1920 | 93.5593 | 0.5895 | 93.3773 | 0.997 | 46.3 KiB | 50.5 KiB | 0.918 |
| jacobi-1d-imper | CUDA | 0.0192 | 0.0000 | 0.0192 | 0.0192 | 0.0001 | 0.0192 | 0.997 | 26.0 KiB | 26.1 KiB | 0.994 |
| jacobi-2d-imper | CUDA | 0.0105 | 0.0000 | 0.0105 | 0.0106 | 0.0001 | 0.0106 | 0.989 | 26.0 KiB | 30.2 KiB | 0.862 |
| lu | CUDA | 1.0127 | 0.0016 | 1.0124 | 1.0294 | 0.0080 | 1.0279 | 0.984 | 30.2 KiB | 30.3 KiB | 0.995 |
| mvt | CUDA | 0.1076 | 0.0022 | 0.1061 | 0.1075 | 0.0025 | 0.1080 | 1.001 | 34.2 KiB | 34.3 KiB | 0.996 |
| syr2k | CUDA | 1.1391 | 0.0008 | 1.1391 | 1.1412 | 0.0023 | 1.1414 | 0.998 | 26.1 KiB | 26.2 KiB | 0.994 |
| syrk | CUDA | 0.5598 | 0.0002 | 0.5597 | 0.5607 | 0.0015 | 0.5599 | 0.998 | 30.1 KiB | 30.2 KiB | 0.995 |
