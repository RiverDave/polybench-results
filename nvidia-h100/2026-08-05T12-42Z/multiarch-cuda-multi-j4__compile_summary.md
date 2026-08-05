PolyBench compile-phase timing: CIR vs OG.

- ClangIR commit: `b5b34ff37`
- Scripts commit: `b849634`
- arch: `cuda:sm_80,sm_86,sm_89,sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/multiarch-cuda-multi-j4`
- Flags: `-O3 device-only -ftime-report -mllvm -time-passes` (CIR adds `--mlir-pass-statistics`)
- Warmup runs per benchmark: 2
- Timed samples per benchmark: 5
- CIR compiled OK: `4/4`
- OG compiled OK: `4/4`

## Environment

- hostname: `68-209-73-39`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 80GB HBM3`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-05T12:42:49+00:00`

## Phase averages (wall seconds, over successful compilations)
_(averaged across all architectures)_

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.406 | 0.402 | +0.004 |
| ISel | 0.001 | 0.001 | +0.000 |
| LLVM-analysis | 0.000 | 0.000 | -0.000 |
| LLVM-passes | 0.007 | 0.006 | +0.000 |
| **Total (wall)** | **0.436** | **0.435** | **+0.001** |

## Per-arch breakdown

### arch: `sm_80`

- CIR compiled OK: `1/1`
- OG compiled OK: `1/1`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.405 | 0.402 | +0.003 |
| ISel | 0.001 | 0.001 | +0.000 |
| LLVM-analysis | 0.000 | 0.000 | +0.000 |
| LLVM-passes | 0.007 | 0.006 | +0.001 |
| **Total (wall)** | **0.436** | **0.435** | **+0.001** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.405 | 0.402 | 0.001 | 0.001 | 0.000 | 0.000 | 0.007 | 0.006 | 0.436 | 0.001 | 0.436 | 0.435 | 0.003 | 0.435 | 1.002 |

### arch: `sm_86`

- CIR compiled OK: `1/1`
- OG compiled OK: `1/1`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.405 | 0.404 | +0.002 |
| ISel | 0.001 | 0.001 | +0.000 |
| LLVM-analysis | 0.000 | 0.000 | -0.000 |
| LLVM-passes | 0.007 | 0.006 | +0.000 |
| **Total (wall)** | **0.436** | **0.436** | **+0.001** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.405 | 0.404 | 0.001 | 0.001 | 0.000 | 0.000 | 0.007 | 0.006 | 0.436 | 0.001 | 0.436 | 0.436 | 0.005 | 0.436 | 1.002 |

### arch: `sm_89`

- CIR compiled OK: `1/1`
- OG compiled OK: `1/1`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.407 | 0.402 | +0.005 |
| ISel | 0.001 | 0.001 | +0.000 |
| LLVM-analysis | 0.000 | 0.000 | +0.000 |
| LLVM-passes | 0.007 | 0.006 | +0.000 |
| **Total (wall)** | **0.435** | **0.435** | **+0.000** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.407 | 0.402 | 0.001 | 0.001 | 0.000 | 0.000 | 0.007 | 0.006 | 0.435 | 0.005 | 0.435 | 0.435 | 0.003 | 0.434 | 1.001 |

### arch: `sm_90`

- CIR compiled OK: `1/1`
- OG compiled OK: `1/1`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.407 | 0.401 | +0.005 |
| ISel | 0.001 | 0.001 | -0.000 |
| LLVM-analysis | 0.000 | 0.000 | -0.000 |
| LLVM-passes | 0.006 | 0.006 | +0.000 |
| **Total (wall)** | **0.437** | **0.435** | **+0.002** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.407 | 0.401 | 0.001 | 0.001 | 0.000 | 0.000 | 0.006 | 0.006 | 0.437 | 0.005 | 0.435 | 0.435 | 0.002 | 0.435 | 1.004 |

