PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `acc8640`
- arch: `sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/prod/runtime-cuda-sm_90-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `68-209-73-235`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 80GB HBM3`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- driver version: `580.105.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- timestamp utc: `2026-08-09T23:35:53+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | OG wall | OG GPU | OG host | GPU CIR/OG | CIR size | OG size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5986 | 0.0002 | 0.5985 | 0.6004 | 0.0002 | 0.6003 | 0.976 | 26.2 KiB | 26.4 KiB |
| 2mm | CUDA | 0.3070 | 0.0026 | 0.3044 | 0.3044 | 0.0026 | 0.3017 | 1.003 | 38.3 KiB | 38.5 KiB |
| convolution-3d | CUDA | 0.3941 | 0.0008 | 0.3932 | 0.3940 | 0.0008 | 0.3932 | 0.991 | 26.2 KiB | 26.3 KiB |
| 3mm | CUDA | 0.2943 | 0.0007 | 0.2936 | 0.2910 | 0.0007 | 0.2904 | 1.004 | 46.4 KiB | 46.5 KiB |
| adi | CUDA | 0.3189 | 0.0190 | 0.2999 | 0.3194 | 0.0190 | 0.3004 | 0.999 | 58.5 KiB | 58.6 KiB |
| atax | CUDA | 0.3255 | 0.0024 | 0.3231 | 0.3269 | 0.0024 | 0.3245 | 1.000 | 34.3 KiB | 34.4 KiB |
| bicg | CUDA | 0.3270 | 0.0023 | 0.3246 | 0.3254 | 0.0023 | 0.3231 | 0.997 | 34.3 KiB | 34.4 KiB |
| correlation | CUDA | 1.4108 | 1.0986 | 0.3122 | 1.4106 | 1.1002 | 0.3104 | 0.999 | 50.5 KiB | 50.6 KiB |
| covariance | CUDA | 1.4108 | 1.0982 | 0.3127 | 1.4118 | 1.1004 | 0.3114 | 0.998 | 42.4 KiB | 42.5 KiB |
| doitgen | CUDA | 0.3098 | 0.0051 | 0.3047 | 0.3105 | 0.0051 | 0.3053 | 0.997 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.3697 | 0.0411 | 0.3286 | 0.3719 | 0.0412 | 0.3307 | 0.998 | 34.3 KiB | 34.5 KiB |
| gemm | CUDA | 0.3001 | 0.0003 | 0.2998 | 0.2917 | 0.0003 | 0.2915 | 0.995 | 30.2 KiB | 30.3 KiB |
| gemver | CUDA | 0.3287 | 0.0024 | 0.3263 | 0.3306 | 0.0024 | 0.3282 | 1.004 | 38.4 KiB | 38.5 KiB |
| gesummv | CUDA | 0.3625 | 0.0016 | 0.3609 | 0.3602 | 0.0016 | 0.3586 | 1.000 | 30.1 KiB | 30.3 KiB |
| gramschmidt | CUDA | 1.8082 | 1.4862 | 0.3220 | 1.8078 | 1.4860 | 0.3217 | 1.000 | 42.4 KiB | 46.5 KiB |
| jacobi-1d-imper | CUDA | 0.4507 | 0.1609 | 0.2898 | 0.4496 | 0.1607 | 0.2889 | 1.001 | 26.1 KiB | 26.2 KiB |
| jacobi-2d-imper | CUDA | 0.3001 | 0.0006 | 0.2995 | 0.2984 | 0.0006 | 0.2978 | 1.009 | 26.1 KiB | 30.2 KiB |
| lu | CUDA | 0.3502 | 0.0396 | 0.3106 | 0.3486 | 0.0396 | 0.3090 | 0.999 | 30.2 KiB | 30.4 KiB |
| mvt | CUDA | 0.3278 | 0.0024 | 0.3254 | 0.3255 | 0.0024 | 0.3231 | 0.998 | 34.2 KiB | 34.4 KiB |
| syr2k | CUDA | 0.3059 | 0.0093 | 0.2966 | 0.3075 | 0.0093 | 0.2982 | 1.000 | 26.2 KiB | 26.3 KiB |
| syrk | CUDA | 0.3004 | 0.0048 | 0.2956 | 0.3000 | 0.0048 | 0.2951 | 1.000 | 30.2 KiB | 30.3 KiB |

**Total GPU CIR/OG (geomean):** `0.9983`

