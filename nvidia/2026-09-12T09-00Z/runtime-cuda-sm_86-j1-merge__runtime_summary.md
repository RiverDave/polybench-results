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
- timestamp utc: `2026-09-12T09:00:08+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 2mm | CUDA | 0.2335 | 0.0054 | 0.2281 | 0.2233 | 0.0054 | 0.2179 | 1.000 | 38.3 KiB | 38.3 KiB |
| correlation | CUDA | 1.9255 | 1.6842 | 0.2413 | 1.9451 | 1.6912 | 0.2539 | 1.004 | 50.5 KiB | 50.5 KiB |
| covariance | CUDA | 1.9446 | 1.6851 | 0.2595 | 1.9349 | 1.6912 | 0.2437 | 1.004 | 38.4 KiB | 38.4 KiB |
| gramschmidt | CUDA | 2.7425 | 2.4812 | 0.2612 | 2.7444 | 2.4717 | 0.2727 | 0.996 | 42.4 KiB | 46.4 KiB |
| lu | CUDA | 0.2983 | 0.0507 | 0.2475 | 0.2915 | 0.0511 | 0.2404 | 1.006 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0021`

- Validation: `10/10` passed
