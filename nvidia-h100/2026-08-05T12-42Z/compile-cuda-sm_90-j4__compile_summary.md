PolyBench compile-phase timing: CIR vs OG.

- ClangIR commit: `b5b34ff37`
- Scripts commit: `b849634`
- arch: `cuda:sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_90-j4`
- Flags: `-O3 device-only -ftime-report -mllvm -time-passes` (CIR adds `--mlir-pass-statistics`)
- Warmup runs per benchmark: 2
- Timed samples per benchmark: 5
- CIR compiled OK: `1/1`
- OG compiled OK: `1/1`

## Environment

- hostname: `68-209-73-39`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 80GB HBM3`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-05T12:42:37+00:00`

## Phase averages (wall seconds, over successful compilations)

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.408 | 0.405 | +0.003 |
| ISel | 0.001 | 0.001 | +0.000 |
| LLVM-analysis | 0.000 | 0.000 | -0.000 |
| LLVM-passes | 0.007 | 0.006 | +0.000 |
| **Total (wall)** | **0.440** | **0.440** | **+0.000** |

## Per-benchmark breakdown

### arch: `sm_90`

- CIR compiled OK: `1/1`
- OG compiled OK: `1/1`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.408 | 0.405 | +0.003 |
| ISel | 0.001 | 0.001 | +0.000 |
| LLVM-analysis | 0.000 | 0.000 | -0.000 |
| LLVM-passes | 0.007 | 0.006 | +0.000 |
| **Total (wall)** | **0.440** | **0.440** | **+0.000** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.408 | 0.405 | 0.001 | 0.001 | 0.000 | 0.000 | 0.007 | 0.006 | 0.440 | 0.004 | 0.440 | 0.440 | 0.007 | 0.436 | 1.001 |

