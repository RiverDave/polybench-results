PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `1848f40`
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
- timestamp utc: `2026-08-10T02:46:24+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | OG wall | OG GPU | OG host | GPU CIR/OG | CIR size | OG size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5979 | 0.0002 | 0.5977 | 0.5957 | 0.0002 | 0.5955 | 0.979 | 26.2 KiB | 26.4 KiB |
| 2mm | CUDA | 0.3055 | 0.0026 | 0.3029 | 0.3033 | 0.0026 | 0.3007 | 1.003 | 38.3 KiB | 38.5 KiB |
| convolution-3d | CUDA | 0.3975 | 0.0008 | 0.3966 | 0.3984 | 0.0008 | 0.3975 | 0.993 | 26.2 KiB | 26.3 KiB |
| 3mm | CUDA | 0.2968 | 0.0007 | 0.2961 | 0.2943 | 0.0007 | 0.2936 | 1.003 | 46.4 KiB | 46.5 KiB |
| adi | CUDA | 0.3210 | 0.0191 | 0.3020 | 0.3200 | 0.0191 | 0.3009 | 1.001 | 58.5 KiB | 58.6 KiB |
| atax | CUDA | 0.3254 | 0.0024 | 0.3229 | 0.3255 | 0.0024 | 0.3231 | 0.998 | 34.3 KiB | 34.4 KiB |
| bicg | CUDA | 0.3291 | 0.0023 | 0.3268 | 0.3261 | 0.0023 | 0.3237 | 1.002 | 34.3 KiB | 34.4 KiB |
| correlation | CUDA | 1.4115 | 1.1003 | 0.3112 | 1.4117 | 1.1003 | 0.3114 | 1.000 | 50.5 KiB | 50.6 KiB |
| covariance | CUDA | 1.4115 | 1.1000 | 0.3115 | 1.4126 | 1.1010 | 0.3115 | 0.999 | 42.4 KiB | 42.5 KiB |
| doitgen | CUDA | 0.3088 | 0.0051 | 0.3037 | 0.3093 | 0.0051 | 0.3042 | 0.998 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.3710 | 0.0411 | 0.3299 | 0.3716 | 0.0412 | 0.3304 | 0.998 | 34.3 KiB | 34.5 KiB |
| gemm | CUDA | 0.2986 | 0.0003 | 0.2984 | 0.2921 | 0.0003 | 0.2918 | 0.996 | 30.2 KiB | 30.3 KiB |
| gemver | CUDA | 0.3296 | 0.0024 | 0.3271 | 0.3292 | 0.0024 | 0.3268 | 1.000 | 38.4 KiB | 38.5 KiB |
| gesummv | CUDA | 0.3601 | 0.0016 | 0.3586 | 0.3599 | 0.0016 | 0.3583 | 0.992 | 30.1 KiB | 30.3 KiB |
| gramschmidt | CUDA | 1.8086 | 1.4866 | 0.3220 | 1.8086 | 1.4864 | 0.3222 | 1.000 | 42.4 KiB | 46.5 KiB |
| jacobi-1d-imper | CUDA | 0.4510 | 0.1605 | 0.2905 | 0.4503 | 0.1603 | 0.2900 | 1.001 | 26.1 KiB | 26.2 KiB |
| jacobi-2d-imper | CUDA | 0.3001 | 0.0006 | 0.2995 | 0.3003 | 0.0006 | 0.2997 | 0.997 | 26.1 KiB | 30.2 KiB |
| lu | CUDA | 0.3493 | 0.0395 | 0.3098 | 0.3500 | 0.0395 | 0.3105 | 1.001 | 30.2 KiB | 30.4 KiB |
| mvt | CUDA | 0.3322 | 0.0024 | 0.3298 | 0.3274 | 0.0024 | 0.3250 | 0.999 | 34.2 KiB | 34.4 KiB |
| syr2k | CUDA | 0.3061 | 0.0093 | 0.2968 | 0.3061 | 0.0093 | 0.2968 | 0.999 | 26.2 KiB | 26.3 KiB |
| syrk | CUDA | 0.2998 | 0.0048 | 0.2950 | 0.2995 | 0.0048 | 0.2947 | 1.000 | 30.2 KiB | 30.3 KiB |

**Total GPU CIR/OG (geomean):** `0.9981`

