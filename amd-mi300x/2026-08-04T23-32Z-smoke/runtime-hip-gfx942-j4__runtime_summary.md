PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `8b56d41fd`
- Scripts commit: `ba00042`
- arch: `gfx942`
- PolyBench root: `/root/polybenchGpu`
- Logs: `/root/polybench-gpu-audit/temp/smoke/runtime-hip-gfx942-j4`
- Runs: 2 timed + 1 warmup
- Compiled OK: `4/4`
- Ran OK: `4/4`

## Environment

- hostname: `rocm-7-14-software-gpu-mi300x1-192gb-devcloud-atl1`
- cpu: `INTEL(R) XEON(R) PLATINUM 8568Y+`
- cpu count: `20`
- gpu: `AMD Instinct MI300X VF`
- kernel: `6.8.0-134-generic`
- rocm version: `7.0.2`
- timestamp utc: `2026-08-04T23:31:55+00:00`

## Results (wall seconds, polybench timer)

| Benchmark | Source set | CIR mean | CIR σ | CIR med | OG mean | OG σ | OG med | CIR/OG | CIR size | OG size | size ratio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.0353 | 0.0028 | 0.0353 | 0.0354 | 0.0030 | 0.0354 | 0.996 | 30.1 KiB | 34.3 KiB | 0.879 |
| 2mm | HIP | 7.7540 | 0.0545 | 7.7540 | 7.7786 | 0.0666 | 7.7786 | 0.997 | 38.3 KiB | 42.4 KiB | 0.902 |
