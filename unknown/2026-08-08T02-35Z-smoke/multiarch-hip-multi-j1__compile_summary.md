PolyBench compile-phase timing: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `de5bda2`
- arch: `hip:gfx906,gfx908,gfx90a,gfx942`
- PolyBench root: `/root/polybenchGpu`
- Logs: `/root/polybench-gpu-audit/temp/smoke/multiarch-hip-multi-j1`
- Flags: `-O3 device-only -ftime-report -mllvm -time-passes` (CIR adds `--mlir-pass-statistics`)
- Warmup runs per benchmark: 1
- Timed samples per benchmark: 2
- CIR compiled OK: `8/8`
- OG compiled OK: `8/8`

## Environment

- hostname: `7`
- cpu: `INTEL(R) XEON(R) PLATINUM 8568Y+`
- cpu count: `20`
- gpu: `AMD Instinct MI300X VF`
- kernel: `6.8.0-134-generic`
- rocm version: `7.0.2`
- timestamp utc: `2026-08-08T02:35:56+00:00`

## Phase averages (wall seconds, over successful compilations)
_(averaged across all architectures)_

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.578 | 0.568 | +0.011 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.029 | 0.027 | +0.002 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.605** | **0.600** | **+0.005** |

## Per-arch breakdown

### arch: `gfx906`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.585 | 0.576 | +0.008 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.001 |
| LLVM-passes | 0.028 | 0.025 | +0.003 |
| RegAlloc | 0.000 | 0.000 | -0.000 |
| **Total (wall)** | **0.612** | **0.607** | **+0.006** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR RegAlloc | OG RegAlloc | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.570 | 0.577 | 0.001 | 0.001 | 0.002 | 0.002 | 0.017 | 0.015 | 0.000 | 0.000 | 0.599 | 0.001 | 0.599 | 0.606 | 0.039 | 0.606 | 0.988 |
| 2mm | HIP | 0.599 | 0.575 | 0.003 | 0.003 | 0.002 | 0.002 | 0.040 | 0.036 | 0.000 | 0.000 | 0.626 | 0.005 | 0.626 | 0.608 | 0.006 | 0.608 | 1.030 |

### arch: `gfx908`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.580 | 0.553 | +0.027 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.001 |
| LLVM-passes | 0.029 | 0.027 | +0.002 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.607** | **0.585** | **+0.021** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR RegAlloc | OG RegAlloc | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.550 | 0.520 | 0.001 | 0.001 | 0.002 | 0.002 | 0.018 | 0.014 | 0.000 | 0.000 | 0.576 | 0.005 | 0.576 | 0.549 | 0.002 | 0.549 | 1.050 |
| 2mm | HIP | 0.611 | 0.586 | 0.003 | 0.003 | 0.003 | 0.002 | 0.041 | 0.041 | 0.000 | 0.000 | 0.637 | 0.046 | 0.637 | 0.622 | 0.019 | 0.622 | 1.025 |

### arch: `gfx90a`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.568 | 0.553 | +0.015 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.029 | 0.027 | +0.002 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.593** | **0.586** | **+0.008** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR RegAlloc | OG RegAlloc | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.543 | 0.514 | 0.001 | 0.001 | 0.002 | 0.002 | 0.018 | 0.015 | 0.000 | 0.000 | 0.568 | 0.001 | 0.568 | 0.541 | 0.001 | 0.541 | 1.049 |
| 2mm | HIP | 0.593 | 0.593 | 0.003 | 0.003 | 0.002 | 0.002 | 0.041 | 0.040 | 0.000 | 0.000 | 0.619 | 0.000 | 0.619 | 0.630 | 0.003 | 0.630 | 0.983 |

### arch: `gfx942`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.581 | 0.588 | -0.007 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.029 | 0.028 | +0.001 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.607** | **0.621** | **-0.014** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR RegAlloc | OG RegAlloc | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.550 | 0.539 | 0.001 | 0.001 | 0.002 | 0.002 | 0.018 | 0.016 | 0.000 | 0.000 | 0.575 | 0.008 | 0.575 | 0.569 | 0.002 | 0.569 | 1.011 |
| 2mm | HIP | 0.611 | 0.637 | 0.003 | 0.003 | 0.003 | 0.002 | 0.041 | 0.040 | 0.000 | 0.000 | 0.640 | 0.019 | 0.640 | 0.674 | 0.039 | 0.674 | 0.949 |

