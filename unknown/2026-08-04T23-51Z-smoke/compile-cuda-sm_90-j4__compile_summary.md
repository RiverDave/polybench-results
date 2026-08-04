PolyBench compile-phase timing: CIR vs OG.

- ClangIR commit: `cd459f246`
- Scripts commit: `7aa9bb6`
- arch: `cuda:sm_90`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/smoke/compile-cuda-sm_90-j4`
- Flags: `-O3 device-only -ftime-report -mllvm -time-passes` (CIR adds `--mlir-pass-statistics`)
- Warmup runs per benchmark: 1
- Timed samples per benchmark: 2
- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

## Environment

- hostname: `68-209-74-37`
- cpu: `Intel(R) Xeon(R) Platinum 8480+`
- cpu count: `26`
- gpu: `NVIDIA H100 80GB HBM3`
- kernel: `6.8.0-1046-nvidia`
- cuda version: `12.8`
- timestamp utc: `2026-08-04T23:51:36+00:00`

## Phase averages (wall seconds, over successful compilations)

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.411 | 0.408 | +0.003 |
| ISel | 0.001 | 0.001 | +0.000 |
| LLVM-analysis | 0.000 | 0.000 | +0.000 |
| LLVM-passes | 0.012 | 0.011 | +0.000 |
| **Total (wall)** | **0.447** | **0.447** | **+0.000** |

## Per-benchmark breakdown

### arch: `sm_90`

- CIR compiled OK: `2/2`
- OG compiled OK: `2/2`

| Phase | CIR avg | OG avg | delta |
|---|---:|---:|---:|
| Frontend+IRGen | 0.411 | 0.408 | +0.003 |
| ISel | 0.001 | 0.001 | +0.000 |
| LLVM-analysis | 0.000 | 0.000 | +0.000 |
| LLVM-passes | 0.012 | 0.011 | +0.000 |
| **Total (wall)** | **0.447** | **0.447** | **+0.000** |

| Benchmark | Source set | CIR Frontend+IRGen | OG Frontend+IRGen | CIR ISel | OG ISel | CIR LLVM-analysis | OG LLVM-analysis | CIR LLVM-passes | OG LLVM-passes | CIR total | CIR σ | CIR med | OG total | OG σ | OG med | CIR/OG |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.406 | 0.403 | 0.001 | 0.001 | 0.000 | 0.000 | 0.007 | 0.006 | 0.435 | 0.001 | 0.435 | 0.435 | 0.002 | 0.435 | 0.998 |
| 2mm | CUDA | 0.417 | 0.414 | 0.001 | 0.001 | 0.001 | 0.001 | 0.017 | 0.017 | 0.460 | 0.001 | 0.460 | 0.458 | 0.001 | 0.458 | 1.003 |

