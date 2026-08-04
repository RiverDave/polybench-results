PolyBench compile-phase timing: CIR vs OG.

- ClangIR commit: `8b56d41fd`
- Scripts commit: `ba00042`
- arch: `hip:gfx942`
- PolyBench root: `/root/polybenchGpu`
- Logs: `/root/polybench-gpu-audit/temp/smoke/compile-hip-gfx942-j4`
- Flags: `-O3 device-only -ftime-report -mllvm -time-passes` (CIR adds `--mlir-pass-statistics`)
- Warmup runs per benchmark: 1
- Timed samples per benchmark: 2
- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

## Environment

- hostname: `rocm-7-14-software-gpu-mi300x1-192gb-devcloud-atl1`
- cpu: `INTEL(R) XEON(R) PLATINUM 8568Y+`
- cpu count: `20`
- gpu: `AMD Instinct MI300X VF`
- kernel: `6.8.0-134-generic`
- rocm version: `7.0.2`
- timestamp utc: `2026-08-04T23:31:28+00:00`

## Phase averages (wall seconds, over successful compilations)

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.555 | 0.542 | +0.013 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.030 | 0.027 | +0.002 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.615** | **0.606** | **+0.009** |

## Per-benchmark breakdown

### arch: `gfx942`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.555 | 0.542 | +0.013 |
| ISel | 0.002 | 0.002 | +0.000 |
| LLVM-analysis | 0.002 | 0.002 | +0.000 |
| LLVM-passes | 0.030 | 0.027 | +0.002 |
| RegAlloc | 0.000 | 0.000 | +0.000 |
| **Total (wall)** | **0.615** | **0.606** | **+0.009** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR RegAlloc | OG RegAlloc | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | HIP | 0.545 | 0.532 | 0.001 | 0.001 | 0.002 | 0.002 | 0.019 | 0.018 | 0.000 | 0.000 | 0.604 | 0.009 | 0.604 | 0.598 | 0.002 | 0.598 | 1.009 |
| 2mm | HIP | 0.565 | 0.552 | 0.003 | 0.003 | 0.003 | 0.002 | 0.040 | 0.037 | 0.000 | 0.000 | 0.626 | 0.005 | 0.626 | 0.614 | 0.011 | 0.614 | 1.020 |

