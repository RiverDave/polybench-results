PolyBench compile-phase timing: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `de5bda2`
- arch: `cuda:sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/smoke/compile-cuda-sm_90-j1`
- Flags: `-O3 device-only -ftime-report -mllvm -time-passes` (CIR adds `--mlir-pass-statistics`)
- Warmup runs per benchmark: 1
- Timed samples per benchmark: 2
- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

## Environment

- hostname: `209-20-156-202`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 PCIe`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-08T07:49:25+00:00`

## Phase averages (wall seconds, over successful compilations)

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.723 | 0.804 | -0.080 |
| ISel | 0.002 | 0.002 | -0.000 |
| LLVM-analysis | 0.001 | 0.001 | -0.000 |
| LLVM-passes | 0.020 | 0.021 | -0.001 |
| **Total (wall)** | **0.837** | **0.924** | **-0.088** |

## Per-benchmark breakdown

### arch: `sm_90`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.723 | 0.804 | -0.080 |
| ISel | 0.002 | 0.002 | -0.000 |
| LLVM-analysis | 0.001 | 0.001 | -0.000 |
| LLVM-passes | 0.020 | 0.021 | -0.001 |
| **Total (wall)** | **0.837** | **0.924** | **-0.088** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.643 | 0.795 | 0.001 | 0.001 | 0.000 | 0.001 | 0.009 | 0.011 | 0.732 | 0.243 | 0.732 | 0.887 | 0.026 | 0.887 | 0.826 |
| 2mm | CUDA | 0.803 | 0.812 | 0.002 | 0.002 | 0.001 | 0.001 | 0.031 | 0.031 | 0.941 | 0.024 | 0.941 | 0.962 | 0.002 | 0.962 | 0.978 |

