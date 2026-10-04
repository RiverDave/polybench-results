PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `f5bc26e18`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/aa-cloning-f5bc26e1837a-20261004/corpus`
- Logs: `/home/ubuntu/aa-cloning-f5bc26e1837a-20261004/B-cloning/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `8/8`
- Ran OK: `8/8`
- **Validation: correctness check enabled**


## Environment

- hostname: `158-101-118-28`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (https://github.com/RiverDave/llvm-project.git f5bc26e1837a893954e06c75ddfb12222dd35fe9)`
- timestamp utc: `2026-10-04T10:03:32+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 2mm | CUDA | 0.2219 | 0.0054 | 0.2165 | 0.2197 | 0.0024 | 0.2173 | 0.444 | 38.3 KiB | 50.5 KiB |
| 3mm | CUDA | 0.2091 | 0.0014 | 0.2077 | 0.2065 | 0.0006 | 0.2059 | 0.461 | 42.4 KiB | 58.6 KiB |
| gemm | CUDA | 0.2048 | 0.0005 | 0.2043 | 0.2025 | 0.0003 | 0.2023 | 0.552 | 30.2 KiB | 34.2 KiB |
| lu | CUDA | 0.2794 | 0.0499 | 0.2295 | 0.2775 | 0.0500 | 0.2275 | 1.003 | 30.2 KiB | 34.4 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.5803`

- Validation: `8/8` passed
