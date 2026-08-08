PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `de5bda2`
- arch: `sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/smoke/runtime-cuda-sm_90-j1`
- Runs: 2 timed + 1 warmup
- Compiled OK: `4/4`
- Ran OK: `4/4`

## Environment

- hostname: `209-20-156-202`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 PCIe`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-08T07:50:49+00:00`

## Results (wall seconds, polybench timer)

| Benchmark | Source set | CIR mean | CIR σ | CIR med | OG mean | OG σ | OG med | CIR/OG | CIR size | OG size | size ratio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.0002 | 0.0000 | 0.0002 | 0.0002 | 0.0000 | 0.0002 | 0.979 | 26.1 KiB | 26.3 KiB | 0.995 |
| 2mm | CUDA | 0.0030 | 0.0000 | 0.0030 | 0.0030 | 0.0001 | 0.0030 | 1.002 | 38.2 KiB | 38.4 KiB | 0.996 |
