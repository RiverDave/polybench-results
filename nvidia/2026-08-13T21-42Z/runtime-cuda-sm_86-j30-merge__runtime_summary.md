PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `fb724e2f8515`
- Scripts commit: `7d815b0`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_86-j30-merge`
- Runs: 5 timed + 2 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`
- **Validation: correctness check enabled**


## Environment

- hostname: `150-136-119-175`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git fb724e2f8515caec84b563f777de67aaa191b85c)`
- timestamp utc: `2026-08-13T21:42:12+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 7.1510 | 0.0120 | 7.1390 | 7.0327 | 0.0100 | 7.0227 | 0.837 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 7.1163 | 0.0455 | 7.0708 | 7.0943 | 0.0316 | 7.0628 | 0.694 | 38.3 KiB | 38.3 KiB |
| convolution-3d | CUDA | 7.1210 | 0.0080 | 7.1131 | 7.0327 | 0.0110 | 7.0218 | 1.375 | 26.2 KiB | 26.2 KiB |
| 3mm | CUDA | 6.9969 | 0.0223 | 6.9746 | 6.9861 | 0.0182 | 6.9679 | 0.814 | 42.4 KiB | 46.4 KiB |
| adi | CUDA | 12.9950 | 9.7771 | 3.2179 | 13.2369 | 10.1278 | 3.1091 | 1.036 | 58.5 KiB | 58.5 KiB |
| atax | CUDA | 6.9062 | 0.0207 | 6.8854 | 6.5613 | 0.0179 | 6.5433 | 0.866 | 34.3 KiB | 34.3 KiB |
| bicg | CUDA | 6.6730 | 0.0186 | 6.6543 | 7.1297 | 0.0197 | 7.1100 | 1.056 | 34.3 KiB | 34.3 KiB |
| correlation | CUDA | 10.8292 | 7.0524 | 3.7768 | 11.9235 | 8.2929 | 3.6306 | 1.176 | 50.5 KiB | 50.5 KiB |
| covariance | CUDA | 11.9750 | 8.3091 | 3.6659 | 11.8620 | 8.1572 | 3.7048 | 0.982 | 38.4 KiB | 38.4 KiB |
| doitgen | CUDA | 8.0381 | 1.7358 | 6.3023 | 8.0012 | 1.7887 | 6.2125 | 1.030 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 12.4465 | 9.0237 | 3.4228 | 12.5192 | 9.0321 | 3.4871 | 1.001 | 34.3 KiB | 34.3 KiB |
| gemm | CUDA | 6.6943 | 0.0076 | 6.6867 | 7.1729 | 0.0090 | 7.1639 | 1.175 | 30.2 KiB | 30.2 KiB |
| gemver | CUDA | 6.9030 | 0.0281 | 6.8749 | 7.0478 | 0.0230 | 7.0247 | 0.820 | 38.4 KiB | 38.3 KiB |
| gesummv | CUDA | 6.9498 | 0.0123 | 6.9375 | 6.2607 | 0.0139 | 6.2468 | 1.134 | 30.1 KiB | 30.1 KiB |
| gramschmidt | CUDA | 16.3782 | 13.8852 | 2.4930 | 15.6861 | 14.3362 | 1.3498 | 1.032 | 42.4 KiB | 46.4 KiB |
| jacobi-1d-imper | CUDA | 6.2463 | 5.8801 | 0.3662 | 3.0218 | 2.6709 | 0.3509 | 0.454 | 26.1 KiB | 26.0 KiB |
| jacobi-2d-imper | CUDA | 3.1795 | 0.4372 | 2.7423 | 3.1649 | 0.3934 | 2.7715 | 0.900 | 26.1 KiB | 26.1 KiB |
| lu | CUDA | 5.6739 | 5.0702 | 0.6036 | 5.6663 | 5.0677 | 0.5986 | 1.000 | 30.2 KiB | 30.2 KiB |
| mvt | CUDA | 2.9021 | 0.0406 | 2.8615 | 2.8424 | 0.0351 | 2.8073 | 0.866 | 34.2 KiB | 34.2 KiB |
| syr2k | CUDA | 2.8651 | 0.1692 | 2.6960 | 2.8951 | 0.1306 | 2.7645 | 0.772 | 26.2 KiB | 26.2 KiB |
| syrk | CUDA | 2.9517 | 0.0776 | 2.8741 | 2.7716 | 0.0711 | 2.7004 | 0.917 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `0.9278`

- Validation: `41/42` passed

## Validation failures

- [CIR] `adi` — 1 mismatches / `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
