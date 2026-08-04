PolyBench compile-phase timing: CIR vs OG.

- ClangIR commit: `8b56d41fd`
- Scripts commit: `ba00042`
- arch: `hip:gfx906,gfx908,gfx90a,gfx942`
- PolyBench root: `/root/polybenchGpu`
- Logs: `/root/polybench-gpu-audit/temp/smoke/multiarch-hip-multi-j4`
- Flags: `-O3 device-only -ftime-report -mllvm -time-passes` (CIR adds `--mlir-pass-statistics`)
- Warmup runs per benchmark: 1
- Timed samples per benchmark: 2
- CIR compiled OK: `8/8`
- OG compiled OK: `8/8`

## Environment

- hostname: `rocm-7-14-software-gpu-mi300x1-192gb-devcloud-atl1`
- cpu: `INTEL(R) XEON(R) PLATINUM 8568Y+`
- cpu count: `20`
- gpu: `AMD Instinct MI300X VF`
- kernel: `6.8.0-134-generic`
- rocm version: `7.0.2`
- timestamp utc: `2026-08-04T23:32:02+00:00`

## Phase averages (wall seconds, over successful compilations)
_(averaged across all architectures)_

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.546 | 0.544 | +0.002 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.029 | 0.025 | +0.005 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.609** | **0.609** | **+0.000** |

## Per-arch breakdown

### arch: `gfx906`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.548 | 0.544 | +0.004 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.028 | 0.024 | +0.004 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.612** | **0.611** | **+0.001** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR RegAlloc | OG RegAlloc | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.539 | 0.527 | 0.001 | 0.001 | 0.002 | 0.002 | 0.018 | 0.014 | 0.000 | 0.000 | 0.602 | 0.001 | 0.602 | 0.597 | 0.004 | 0.597 | 1.009 |
| 2mm | HIP | 0.556 | 0.560 | 0.003 | 0.002 | 0.003 | 0.002 | 0.039 | 0.034 | 0.000 | 0.000 | 0.622 | 0.001 | 0.622 | 0.624 | 0.001 | 0.624 | 0.996 |

### arch: `gfx908`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.546 | 0.543 | +0.003 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.029 | 0.024 | +0.004 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.606** | **0.609** | **-0.003** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR RegAlloc | OG RegAlloc | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.532 | 0.527 | 0.001 | 0.001 | 0.002 | 0.002 | 0.018 | 0.015 | 0.000 | 0.000 | 0.592 | 0.005 | 0.592 | 0.596 | 0.004 | 0.596 | 0.993 |
| 2mm | HIP | 0.559 | 0.558 | 0.003 | 0.002 | 0.003 | 0.002 | 0.040 | 0.034 | 0.000 | 0.000 | 0.621 | 0.002 | 0.621 | 0.622 | 0.012 | 0.622 | 0.998 |

### arch: `gfx90a`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.544 | 0.550 | -0.006 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.030 | 0.026 | +0.005 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.609** | **0.612** | **-0.004** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR RegAlloc | OG RegAlloc | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.531 | 0.540 | 0.001 | 0.001 | 0.002 | 0.002 | 0.020 | 0.017 | 0.000 | 0.000 | 0.598 | 0.002 | 0.598 | 0.602 | 0.016 | 0.602 | 0.993 |
| 2mm | HIP | 0.556 | 0.560 | 0.003 | 0.002 | 0.003 | 0.002 | 0.041 | 0.034 | 0.000 | 0.000 | 0.620 | 0.003 | 0.620 | 0.623 | 0.011 | 0.623 | 0.995 |

### arch: `gfx942`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.548 | 0.542 | +0.007 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.030 | 0.025 | +0.005 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.610** | **0.604** | **+0.006** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR RegAlloc | OG RegAlloc | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.532 | 0.530 | 0.001 | 0.001 | 0.002 | 0.002 | 0.020 | 0.016 | 0.000 | 0.000 | 0.597 | 0.003 | 0.597 | 0.594 | 0.001 | 0.594 | 1.005 |
| 2mm | HIP | 0.565 | 0.553 | 0.003 | 0.002 | 0.002 | 0.002 | 0.040 | 0.034 | 0.000 | 0.000 | 0.624 | 0.002 | 0.624 | 0.615 | 0.007 | 0.615 | 1.014 |

