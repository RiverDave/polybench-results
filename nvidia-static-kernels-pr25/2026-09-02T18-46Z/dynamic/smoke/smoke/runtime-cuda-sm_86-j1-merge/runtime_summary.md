PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `bb385fee62f2`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu-dynamic`
- Logs: `/home/ubuntu/logs/dynamic/smoke/smoke/runtime-cuda-sm_86-j1-merge`
- Runs: 2 timed + 1 warmup
- Compiled OK: `4/4`
- Ran OK: `4/4`
- **Validation: correctness check enabled**


## Environment

- hostname: `141-148-75-73`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (https://github.com/RiverDave/llvm-project.git bb385fee62f23fdb0acb719a88fe8186167f42a5)`
- timestamp utc: `2026-09-02T18:20:27+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.5708 | 0.0004 | 0.5705 | 0.5705 | 0.0004 | 0.5702 | 1.015 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 0.2214 | 0.0054 | 0.2160 | 0.2208 | 0.0054 | 0.2153 | 1.003 | 38.3 KiB | 38.3 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0093`

- Validation: `4/4` passed
