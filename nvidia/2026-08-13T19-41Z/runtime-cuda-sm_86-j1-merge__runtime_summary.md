PolyBench runtime performance: CIR vs CIR-merge.

- ClangIR commit: `fb724e2f8515`
- Scripts commit: `5058ec1`
- arch: `sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/runtime-cuda-sm_86-j1-merge`
- Runs: 8 timed + 3 warmup
- Compiled OK: `42/42`
- Ran OK: `42/42`

## Environment

- hostname: `129-153-183-102`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- polybench commit: `2a64b43`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git 673938ffd9acc83568955bb70c37b965c803fb2b)`
- timestamp utc: `2026-08-13T19:41:30+00:00`

## Results (wall + GPU split, seconds)

| Benchmark | Source set | CIR wall | CIR GPU | CIR host | CIR-merge wall | CIR-merge GPU | CIR-merge host | GPU CIR-merge/CIR | CIR size | CIR-merge size |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | 0.6350 | 0.0004 | 0.6346 | 0.6356 | 0.0004 | 0.6352 | 0.976 | 26.2 KiB | 26.2 KiB |
| 2mm | CUDA | 0.2503 | 0.0054 | 0.2449 | 0.2793 | 0.0054 | 0.2739 | 1.004 | 38.3 KiB | 38.3 KiB |
| convolution-3d | CUDA | 0.3579 | 0.0010 | 0.3570 | 0.3508 | 0.0010 | 0.3498 | 1.003 | 26.2 KiB | 26.2 KiB |
| 3mm | CUDA | 0.2503 | 0.0014 | 0.2489 | 0.2479 | 0.0014 | 0.2465 | 1.008 | 42.4 KiB | 46.4 KiB |
| adi | CUDA | 0.2604 | 0.0163 | 0.2440 | 0.2790 | 0.0164 | 0.2625 | 1.005 | 58.5 KiB | 58.5 KiB |
| atax | CUDA | 0.2962 | 0.0030 | 0.2931 | 0.2973 | 0.0031 | 0.2943 | 1.004 | 34.3 KiB | 34.3 KiB |
| bicg | CUDA | 0.2978 | 0.0024 | 0.2954 | 0.2989 | 0.0024 | 0.2965 | 1.005 | 34.3 KiB | 34.3 KiB |
| correlation | CUDA | 1.9710 | 1.6850 | 0.2860 | 1.9788 | 1.6926 | 0.2862 | 1.004 | 50.5 KiB | 50.5 KiB |
| covariance | CUDA | 1.9745 | 1.6860 | 0.2885 | 1.9728 | 1.6919 | 0.2809 | 1.004 | 38.4 KiB | 38.4 KiB |
| doitgen | CUDA | 0.2787 | 0.0048 | 0.2739 | 0.2808 | 0.0049 | 0.2759 | 1.022 | 30.5 KiB | 30.5 KiB |
| fdtd-2d | CUDA | 0.4803 | 0.1786 | 0.3017 | 0.4812 | 0.1786 | 0.3026 | 1.000 | 34.3 KiB | 34.3 KiB |
| gemm | CUDA | 0.2527 | 0.0005 | 0.2523 | 0.2591 | 0.0005 | 0.2586 | 0.994 | 30.2 KiB | 30.2 KiB |
| gemver | CUDA | 0.2898 | 0.0027 | 0.2871 | 0.2966 | 0.0029 | 0.2937 | 1.079 | 38.4 KiB | 38.3 KiB |
| gesummv | CUDA | 0.3294 | 0.0018 | 0.3276 | 0.3284 | 0.0018 | 0.3266 | 1.001 | 30.1 KiB | 30.1 KiB |
| gramschmidt | CUDA | 2.7790 | 2.4793 | 0.2997 | 2.7638 | 2.4697 | 0.2941 | 0.996 | 42.4 KiB | 46.4 KiB |
| jacobi-1d-imper | CUDA | 0.3723 | 0.1292 | 0.2431 | 0.3781 | 0.1290 | 0.2491 | 0.998 | 26.1 KiB | 26.0 KiB |
| jacobi-2d-imper | CUDA | 0.2600 | 0.0010 | 0.2590 | 0.2698 | 0.0012 | 0.2686 | 1.149 | 26.1 KiB | 26.1 KiB |
| lu | CUDA | 0.3327 | 0.0504 | 0.2823 | 0.3303 | 0.0505 | 0.2798 | 1.002 | 30.2 KiB | 30.2 KiB |
| mvt | CUDA | 0.2894 | 0.0030 | 0.2864 | 0.3003 | 0.0030 | 0.2973 | 1.003 | 34.2 KiB | 34.2 KiB |
| syr2k | CUDA | 0.2798 | 0.0193 | 0.2605 | 0.2811 | 0.0193 | 0.2618 | 1.000 | 26.2 KiB | 26.2 KiB |
| syrk | CUDA | 0.2756 | 0.0100 | 0.2656 | 0.2647 | 0.0100 | 0.2547 | 1.000 | 30.2 KiB | 30.2 KiB |

**Total GPU CIR-merge/CIR (geomean):** `1.0117`

