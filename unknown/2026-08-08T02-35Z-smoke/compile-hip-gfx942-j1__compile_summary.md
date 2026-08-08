PolyBench compile-phase timing: CIR vs OG.

- ClangIR commit: `c45e6b9e4d95`
- Scripts commit: `de5bda2`
- arch: `hip:gfx942`
- PolyBench root: `/root/polybenchGpu`
- Logs: `/root/polybench-gpu-audit/temp/smoke/compile-hip-gfx942-j1`
- Flags: `-O3 device-only -ftime-report -mllvm -time-passes` (CIR adds `--mlir-pass-statistics`)
- Warmup runs per benchmark: 1
- Timed samples per benchmark: 2
- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

## Environment

- hostname: `7`
- cpu: `INTEL(R) XEON(R) PLATINUM 8568Y+`
- cpu count: `20`
- gpu: `AMD Instinct MI300X VF`
- kernel: `6.8.0-134-generic`
- rocm version: `7.0.2`
- timestamp utc: `2026-08-08T02:34:30+00:00`

## Phase averages (wall seconds, over successful compilations)

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.585 | 0.581 | +0.005 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.030 | 0.028 | +0.001 |
| RegAlloc | 0.000 | 0.000 | -0.000 |
| **Total (wall)** | **0.613** | **0.612** | **+0.001** |

## Per-benchmark breakdown

### arch: `gfx942`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.585 | 0.581 | +0.005 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.030 | 0.028 | +0.001 |
| RegAlloc | 0.000 | 0.000 | -0.000 |
| **Total (wall)** | **0.613** | **0.612** | **+0.001** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR RegAlloc | OG RegAlloc | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.567 | 0.575 | 0.001 | 0.001 | 0.002 | 0.002 | 0.019 | 0.017 | 0.000 | 0.000 | 0.597 | 0.003 | 0.597 | 0.605 | 0.025 | 0.605 | 0.985 |
| 2mm | HIP | 0.603 | 0.586 | 0.003 | 0.003 | 0.003 | 0.002 | 0.041 | 0.040 | 0.000 | 0.000 | 0.630 | 0.009 | 0.630 | 0.618 | 0.029 | 0.618 | 1.019 |

