PolyBench runtime performance: CIR vs OG.

- ClangIR commit: `b5b34ff37`
- Scripts commit: `b849634`
- arch: `sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_90-j4`
- Runs: 5 timed + 2 warmup
- Compiled OK: `2/2`
- Ran OK: `2/2`

## Environment

- hostname: `68-209-73-39`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 80GB HBM3`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-05T12:42:43+00:00`

## Results (wall seconds, polybench timer)

| Benchmark | Source set | CIR mean | CIR σ | CIR med | OG mean | OG σ | OG med | CIR/OG | CIR size | OG size | size ratio |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.0003 | 0.0000 | 0.0003 | 0.0003 | 0.0000 | 0.0003 | 1.007 | 26.1 KiB | 26.3 KiB | 0.995 |
