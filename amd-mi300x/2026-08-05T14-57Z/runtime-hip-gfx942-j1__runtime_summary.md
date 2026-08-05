PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `5203f106e`
- Scripts commit: `b849634`
- arch: `gfx942`
- PolyBench root: `/root/polybenchGpu`
- Logs: `/root/polybench-gpu-audit/temp/runtime-hip-gfx942-j1`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`

## Environment

- hostname: `rocm-7-14-software-gpu-mi300x1-192gb-devcloud-atl1`
- cpu: `INTEL(R) XEON(R) PLATINUM 8568Y+`
- cpu count: `20`
- gpu: `AMD Instinct MI300X VF`
- kernel: `6.8.0-134-generic`
- rocm version: `7.0.2`
- timestamp utc: `2026-08-05T14:39:43+00:00`

## Results (wall seconds, polybench timer)

| Benchmark | Source set | CIR mean | CIR σ | CIR med | OG mean | OG σ | OG med | CIR/OG | CIR size | OG size | size ratio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.0068 | 0.0001 | 0.0068 | 0.0004 | 0.0000 | 0.0004 | 15.223 | 30.1 KiB | 34.3 KiB | 0.879 |
| 2mm | HIP | 0.0088 | 0.0002 | 0.0088 | 0.0017 | 0.0001 | 0.0017 | 5.184 | 38.3 KiB | 42.4 KiB | 0.902 |
| convolution-3d | HIP | 0.0080 | 0.0004 | 0.0080 | 0.0010 | 0.0001 | 0.0010 | 8.311 | 30.1 KiB | 34.3 KiB | 0.878 |
| 3mm | HIP | 0.0076 | 0.0009 | 0.0074 | 0.0010 | 0.0000 | 0.0009 | 7.902 | 42.4 KiB | 46.5 KiB | 0.911 |
| adi | HIP | 0.0278 | 0.0005 | 0.0277 | 0.0271 | 0.0003 | 0.0271 | 1.024 | 46.6 KiB | 50.8 KiB | 0.918 |
| atax | HIP | 0.0021 | 0.0000 | 0.0021 | 0.0021 | 0.0000 | 0.0021 | 1.008 | 34.2 KiB | 38.4 KiB | 0.892 |
| bicg | HIP | 0.0035 | 0.0000 | 0.0035 | 0.0035 | 0.0001 | 0.0035 | 1.000 | 34.2 KiB | 38.4 KiB | 0.892 |
| correlation | HIP | 1.5033 | 0.0678 | 1.4794 | 1.4755 | 0.0200 | 1.4758 | 1.019 | 42.5 KiB | 46.7 KiB | 0.911 |
| covariance | HIP | 1.5396 | 0.0604 | 1.5520 | 1.4549 | 0.0141 | 1.4535 | 1.058 | 38.3 KiB | 42.5 KiB | 0.902 |
| doitgen | HIP | 0.0117 | 0.0002 | 0.0117 | 0.0058 | 0.0000 | 0.0058 | 2.021 | 38.5 KiB | 42.6 KiB | 0.905 |
| fdtd-2d | HIP | 0.0507 | 0.0009 | 0.0505 | 0.0437 | 0.0001 | 0.0437 | 1.161 | 42.3 KiB | 42.5 KiB | 0.996 |
| gemm | HIP | 0.0066 | 0.0003 | 0.0066 | 0.0006 | 0.0000 | 0.0006 | 11.649 | 30.1 KiB | 34.2 KiB | 0.878 |
| gemver | HIP | 0.0095 | 0.0002 | 0.0095 | 0.0032 | 0.0000 | 0.0031 | 3.021 | 42.4 KiB | 42.5 KiB | 0.996 |
| gesummv | HIP | 0.0039 | 0.0001 | 0.0039 | 0.0039 | 0.0001 | 0.0039 | 1.008 | 30.0 KiB | 34.2 KiB | 0.878 |
| gramschmidt | HIP | 2.2995 | 0.0006 | 2.2996 | 2.2177 | 0.0014 | 2.2178 | 1.037 | 42.4 KiB | 46.6 KiB | 0.911 |
| jacobi-1d-imper | HIP | 0.2283 | 0.0010 | 0.2279 | 0.2203 | 0.0010 | 0.2203 | 1.036 | 34.0 KiB | 38.2 KiB | 0.891 |
| jacobi-2d-imper | HIP | 0.0070 | 0.0001 | 0.0069 | 0.0012 | 0.0000 | 0.0012 | 5.972 | 34.1 KiB | 38.2 KiB | 0.891 |
| lu | HIP | 0.0597 | 0.0017 | 0.0589 | 0.0527 | 0.0010 | 0.0526 | 1.133 | 34.2 KiB | 38.3 KiB | 0.892 |
| mvt | HIP | 0.0022 | 0.0000 | 0.0022 | 0.0021 | 0.0000 | 0.0021 | 1.023 | 34.2 KiB | 38.3 KiB | 0.891 |
| syr2k | HIP | 0.0163 | 0.0002 | 0.0162 | 0.0097 | 0.0001 | 0.0097 | 1.670 | 30.1 KiB | 34.2 KiB | 0.879 |
| syrk | HIP | 0.0091 | 0.0003 | 0.0091 | 0.0030 | 0.0001 | 0.0030 | 3.043 | 30.1 KiB | 34.2 KiB | 0.879 |
