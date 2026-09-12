PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `fbda065af219`
- Scripts commit: `81d3b96`
- arch: `sm_86`
- PolyBench root: `/tmp/zoomroot`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_86-j1-merge`
- Runs: 23 timed + 3 warmup
- Compiled OK: `10/10`
- Ran OK: `10/10`
- **Validation: correctness check enabled**


## Environment

- hostname: `150-136-153-114`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `unknown`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git fbda065af219571d11b1fce76f52d8ab3bcd0882)`
- timestamp utc: `2026-09-12T08:46:26+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 2mm | CUDA | 0.2388 | 0.0054 | 0.2334 | 0.2200 | 0.0024 | 0.2176 | 0.438 | 38.3 KiB | 38.3 KiB |
| correlation | CUDA | 1.9319 | 1.6844 | 0.2475 | 0.4785 | 0.2360 | 0.2425 | 0.140 | 50.5 KiB | 46.5 KiB |
| covariance | CUDA | 1.9280 | 1.6853 | 0.2427 | 0.4856 | 0.2391 | 0.2465 | 0.142 | 38.4 KiB | 38.4 KiB |
| gramschmidt | CUDA | 2.7439 | 2.4804 | 0.2635 | 1.3582 | 1.1030 | 0.2552 | 0.445 | 42.4 KiB | 42.4 KiB |
| lu | CUDA | 0.2893 | 0.0504 | 0.2389 | 0.2900 | 0.0508 | 0.2392 | 1.007 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.3298`

- Validation: `10/10` passed
