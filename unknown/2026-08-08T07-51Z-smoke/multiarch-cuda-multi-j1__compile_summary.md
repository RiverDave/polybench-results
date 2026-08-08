PolyBench compile-phase timing: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `de5bda2`
- arch: `cuda:sm_80,sm_86,sm_89,sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/smoke/multiarch-cuda-multi-j1`
- Flags: `-O3 device-only -ftime-report -mllvm -time-passes` (CIR adds `--mlir-pass-statistics`)
- Warmup runs per benchmark: 1
- Timed samples per benchmark: 2
- CIR compiled OK: `8/8`
- OG compiled OK: `8/8`

## Environment

- hostname: `209-20-156-202`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 PCIe`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-08T07:51:33+00:00`

## Phase averages (wall seconds, over successful compilations)
_(averaged across all architectures)_

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.782 | 0.793 | -0.010 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.001 | 0.001 | -0.000 |
| LLVM-passes | 0.021 | 0.021 | +0.000 |
| **Total (wall)** | **0.892** | **0.900** | **-0.008** |

## Per-arch breakdown

### arch: `sm_80`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.796 | 0.790 | +0.006 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.001 | 0.001 | -0.000 |
| LLVM-passes | 0.022 | 0.021 | +0.001 |
| **Total (wall)** | **0.898** | **0.892** | **+0.006** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.794 | 0.769 | 0.001 | 0.001 | 0.001 | 0.001 | 0.012 | 0.011 | 0.884 | 0.006 | 0.884 | 0.840 | 0.039 | 0.840 | 1.053 |
| 2mm | CUDA | 0.798 | 0.810 | 0.002 | 0.002 | 0.001 | 0.001 | 0.031 | 0.031 | 0.913 | 0.043 | 0.913 | 0.945 | 0.010 | 0.945 | 0.966 |

### arch: `sm_86`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.728 | 0.789 | -0.062 |
| ISel | 0.002 | 0.002 | -0.000 |
| LLVM-analysis | 0.001 | 0.001 | -0.000 |
| LLVM-passes | 0.021 | 0.021 | -0.001 |
| **Total (wall)** | **0.828** | **0.901** | **-0.073** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.639 | 0.771 | 0.001 | 0.001 | 0.000 | 0.001 | 0.009 | 0.011 | 0.727 | 0.230 | 0.727 | 0.852 | 0.051 | 0.852 | 0.854 |
| 2mm | CUDA | 0.816 | 0.808 | 0.002 | 0.002 | 0.001 | 0.001 | 0.032 | 0.031 | 0.928 | 0.028 | 0.928 | 0.950 | 0.008 | 0.950 | 0.977 |

### arch: `sm_89`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.809 | 0.796 | +0.014 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.001 | 0.001 | -0.000 |
| LLVM-passes | 0.022 | 0.021 | +0.000 |
| **Total (wall)** | **0.922** | **0.899** | **+0.023** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.797 | 0.771 | 0.001 | 0.001 | 0.000 | 0.001 | 0.012 | 0.011 | 0.887 | 0.004 | 0.887 | 0.845 | 0.050 | 0.845 | 1.049 |
| 2mm | CUDA | 0.821 | 0.820 | 0.002 | 0.002 | 0.001 | 0.001 | 0.032 | 0.031 | 0.958 | 0.003 | 0.958 | 0.954 | 0.017 | 0.954 | 1.005 |

### arch: `sm_90`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.797 | 0.796 | +0.001 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.001 | 0.001 | -0.000 |
| LLVM-passes | 0.022 | 0.021 | +0.000 |
| **Total (wall)** | **0.919** | **0.906** | **+0.012** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.796 | 0.768 | 0.001 | 0.001 | 0.001 | 0.001 | 0.012 | 0.011 | 0.899 | 0.005 | 0.899 | 0.860 | 0.026 | 0.860 | 1.045 |
| 2mm | CUDA | 0.798 | 0.824 | 0.002 | 0.002 | 0.001 | 0.001 | 0.031 | 0.031 | 0.938 | 0.031 | 0.938 | 0.953 | 0.024 | 0.953 | 0.985 |

