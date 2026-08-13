PolyBench compile-phase timing: CIR vs CIR-merge.

- ClangIR commit: `e982c588c2d2`
- Scripts commit: `b941eee`
- arch: `cuda:sm_86`
- PolyBench root: `/home/ubuntu/polybenchGpu`
- Logs: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge`
- Flags: `-O3 host+device -ftime-report -mllvm -time-passes`; merge arm adds `--clangir-offload-merge`
- Warmup runs per benchmark: 3
- Timed samples per benchmark: 8
- CIR compiled OK: `0/21`
- CIR-merge compiled OK: `0/21`

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
- timestamp utc: `2026-08-13T18:07:31+00:00`

## Phase averages (wall seconds, over successful compilations)

| Phase | CIR avg | CIR-merge avg | delta |
|---|---:|---:|---:|

## Per-benchmark breakdown

### arch: `sm_86`

- CIR compiled OK: `0/21`
- CIR-merge compiled OK: `0/21`

| Phase | CIR avg | CIR-merge avg | delta |
|---|---:|---:|---:|

| Benchmark | Source set | CIR total | CIR σ | CIR med | CIR-merge total | CIR-merge σ | CIR-merge med | CIR-merge/CIR |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| convolution-2d | CUDA | — | — | — | — | — | — | — |
| 2mm | CUDA | — | — | — | — | — | — | — |
| convolution-3d | CUDA | — | — | — | — | — | — | — |
| 3mm | CUDA | — | — | — | — | — | — | — |
| adi | CUDA | — | — | — | — | — | — | — |
| atax | CUDA | — | — | — | — | — | — | — |
| bicg | CUDA | — | — | — | — | — | — | — |
| correlation | CUDA | — | — | — | — | — | — | — |
| covariance | CUDA | — | — | — | — | — | — | — |
| doitgen | CUDA | — | — | — | — | — | — | — |
| fdtd-2d | CUDA | — | — | — | — | — | — | — |
| gemm | CUDA | — | — | — | — | — | — | — |
| gemver | CUDA | — | — | — | — | — | — | — |
| gesummv | CUDA | — | — | — | — | — | — | — |
| gramschmidt | CUDA | — | — | — | — | — | — | — |
| jacobi-1d-imper | CUDA | — | — | — | — | — | — | — |
| jacobi-2d-imper | CUDA | — | — | — | — | — | — | — |
| lu | CUDA | — | — | — | — | — | — | — |
| mvt | CUDA | — | — | — | — | — | — | — |
| syr2k | CUDA | — | — | — | — | — | — | — |
| syrk | CUDA | — | — | — | — | — | — | — |

## Failures

- [CIR] `/home/ubuntu/polybenchGpu/CUDA/2DCONV/2DConvolution.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_2DCONV_2DConvolution.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/2DCONV/2DConvolution.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_2DCONV_2DConvolution.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/2MM/2mm.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_2MM_2mm.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/2MM/2mm.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_2MM_2mm.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/3DCONV/3DConvolution.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_3DCONV_3DConvolution.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/3DCONV/3DConvolution.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_3DCONV_3DConvolution.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/3MM/3mm.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_3MM_3mm.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/3MM/3mm.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_3MM_3mm.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_ADI_adi.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_ADI_adi.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/ATAX/atax.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_ATAX_atax.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/ATAX/atax.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_ATAX_atax.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/BICG/bicg.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_BICG_bicg.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/BICG/bicg.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_BICG_bicg.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/CORR/correlation.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_CORR_correlation.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/CORR/correlation.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_CORR_correlation.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/COVAR/covariance.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_COVAR_covariance.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/COVAR/covariance.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_COVAR_covariance.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/DOITGEN/doitgen.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_DOITGEN_doitgen.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/DOITGEN/doitgen.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_DOITGEN_doitgen.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/FDTD-2D/fdtd2d.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_FDTD-2D_fdtd2d.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/FDTD-2D/fdtd2d.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_FDTD-2D_fdtd2d.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/GEMM/gemm.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_GEMM_gemm.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/GEMM/gemm.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_GEMM_gemm.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/GEMVER/gemver.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_GEMVER_gemver.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/GEMVER/gemver.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_GEMVER_gemver.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/GESUMMV/gesummv.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_GESUMMV_gesummv.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/GESUMMV/gesummv.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_GESUMMV_gesummv.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_GRAMSCHM_gramschmidt.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_GRAMSCHM_gramschmidt.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/JACOBI1D/jacobi1D.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_JACOBI1D_jacobi1D.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/JACOBI1D/jacobi1D.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_JACOBI1D_jacobi1D.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/JACOBI2D/jacobi2D.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_JACOBI2D_jacobi2D.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/JACOBI2D/jacobi2D.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_JACOBI2D_jacobi2D.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/LU/lu.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_LU_lu.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/LU/lu.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_LU_lu.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/MVT/mvt.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_MVT_mvt.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/MVT/mvt.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_MVT_mvt.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/SYR2K/syr2k.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_SYR2K_syr2k.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/SYR2K/syr2k.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_SYR2K_syr2k.cu.cir-merge.sm_86.log`
- [CIR] `/home/ubuntu/polybenchGpu/CUDA/SYRK/syrk.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_SYRK_syrk.cu.cir.sm_86.log`
- [CIR-merge] `/home/ubuntu/polybenchGpu/CUDA/SYRK/syrk.cu`
  - error: `see log`
  - log: `/home/ubuntu/polybench-gpu-audit/temp/compile-cuda-sm_86-j1-merge/CUDA_SYRK_syrk.cu.cir-merge.sm_86.log`
