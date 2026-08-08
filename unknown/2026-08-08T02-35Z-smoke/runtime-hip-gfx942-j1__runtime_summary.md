PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `de5bda2`
- arch: `gfx942`
- PolyBench root: `/root/polybenchGpu`
- Logs: `/root/polybench-gpu-audit/temp/smoke/runtime-hip-gfx942-j1`
- Runs: 2 timed + 1 warmup
- Compiled OK: `4/4`
- Ran OK: `4/4`

## Environment

- hostname: `7`
- cpu: `INTEL(R) XEON(R) PLATINUM 8568Y+`
- cpu count: `20`
- gpu: `AMD Instinct MI300X VF`
- kernel: `6.8.0-134-generic`
- rocm version: `7.0.2`
- timestamp utc: `2026-08-08T02:35:27+00:00`

## Results (wall seconds, polybench timer)

| Benchmark | Source set | CIR mean | CIR σ | CIR med | OG mean | OG σ | OG med | CIR/OG | CIR size | OG size | size ratio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.0005 | 0.0000 | 0.0005 | 0.0005 | 0.0000 | 0.0005 | 1.017 | 30.1 KiB | 34.3 KiB | 0.879 |
| 2mm | HIP | 0.0017 | 0.0001 | 0.0017 | 0.0018 | 0.0001 | 0.0018 | 0.985 | 38.3 KiB | 42.4 KiB | 0.902 |
