HeCBench compile-phase timing: CIR vs OG.

- ClangIR commit: `be46daffea1e`
- Scripts commit: `4aa3c75`
- arch: `sm_86`
- HeCBench root: `/home/ubuntu/hecbench`
- Logs: `temp/hecbench-compile-cuda-sm_86-j30`
- Flags: `-O3 host+device -ftime-report -mllvm -time-passes`
- Warmup runs per benchmark: 1
- Timed samples per benchmark: 1
- CIR compiled OK: `95/162`
- OG compiled OK: `151/162`

## Environment

- hostname: `193-122-144-249`
- cpu: `Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz`
- cpu count: `30`
- gpu: `NVIDIA A10`
- kernel: `6.8.0-60-generic`
- cuda version: `12.8`
- driver version: `570.148.08`
- ptxas version: `ptxas: NVIDIA (R) Ptx optimizing assembler`
- os release: `Ubuntu 22.04.5 LTS`
- compiler version: `clang version 24.0.0git (git@github.com:RiverDave/llvm-project.git be46daffea1ef7060cb95058ececa51419ddb235)`
- timestamp utc: `2026-08-15T06:35:45+00:00`

## Per-benchmark wall time (seconds)

### arch: `sm_86`

| Benchmark | CIR | CIR σ | OG | OG σ | OG/CIR |
|---|---:|---:|---:|---:|---:|
| accuracy | 6.258 | 0.000 | 6.059 | 0.000 | — |
| ace | 2.064 | 0.000 | 1.839 | 0.000 | 0.891 |
| adam | 2.118 | 0.000 | 2.056 | 0.000 | 0.971 |
| adv | 2.532 | 0.000 | 2.421 | 0.000 | 0.956 |
| aidw | 1.692 | 0.000 | 1.820 | 0.000 | — |
| all-pairs-distance | 5.984 | 0.000 | 5.841 | 0.000 | — |
| aobench | 1.715 | 0.000 | 1.626 | 0.000 | 0.948 |
| aop | 1.270 | 0.000 | 2.581 | 0.000 | — |
| asmooth | 0.791 | 0.000 | 1.584 | 0.000 | — |
| assert | 1.524 | 0.000 | 1.431 | 0.000 | 0.939 |
| asta | 1.744 | 0.000 | 1.708 | 0.000 | 0.980 |
| atomicAggregate | 1.528 | 0.000 | 1.481 | 0.000 | 0.969 |
| atomicCAS | 0.762 | 0.000 | — | — | — |
| atomicCost | 0.744 | 0.000 | 1.554 | 0.000 | — |
| atomicPerf | 0.880 | 0.000 | 1.788 | 0.000 | — |
| atomicReduction | 2.161 | 0.000 | 2.071 | 0.000 | 0.958 |
| attention | 3.124 | 0.000 | 6.838 | 0.000 | — |
| axhelm | 0.953 | 0.000 | — | — | — |
| background-subtract | 2.146 | 0.000 | 2.080 | 0.000 | 0.969 |
| backprop | 1.710 | 0.000 | 1.655 | 0.000 | 0.968 |
| bezier-surface | 2.237 | 0.000 | 2.116 | 0.000 | 0.946 |
| bh | 0.985 | 0.000 | 1.798 | 0.000 | — |
| bilateral | 1.754 | 0.000 | 2.816 | 0.000 | 1.605 |
| binomial | 1.469 | 0.000 | 1.457 | 0.000 | 0.992 |
| bitonic-sort | 1.968 | 0.000 | 2.029 | 0.000 | — |
| bitpacking | 2.001 | 0.000 | 2.071 | 0.000 | — |
| black-scholes | 2.004 | 0.000 | 1.835 | 0.000 | 0.915 |
| bn | 3.103 | 0.000 | 2.740 | 0.000 | 0.883 |
| bonds | 3.838 | 0.000 | 3.400 | 0.000 | 0.886 |
| boxfilter | 1.001 | 0.000 | — | — | — |
| bsearch | 2.022 | 0.000 | 2.056 | 0.000 | — |
| bspline-vgh | 1.763 | 0.000 | 1.635 | 0.000 | 0.928 |
| burger | 1.679 | 0.000 | 1.603 | 0.000 | 0.955 |
| bwt | 2.090 | 0.000 | 2.126 | 0.000 | — |
| cbsfil | 2.301 | 0.000 | 2.249 | 0.000 | 0.977 |
| ccsd-trpdrv | 1.490 | 0.000 | 1.482 | 0.000 | 0.995 |
| channelShuffle | 0.771 | 0.000 | 1.571 | 0.000 | — |
| channelSum | 2.879 | 0.000 | 6.060 | 0.000 | — |
| chemv | 1.511 | 0.000 | 1.466 | 0.000 | 0.970 |
| chi2 | 2.374 | 0.000 | 2.271 | 0.000 | 0.957 |
| clenergy | 1.388 | 0.000 | 1.357 | 0.000 | 0.978 |
| clink | 2.294 | 0.000 | 2.221 | 0.000 | 0.968 |
| cmp | 2.365 | 0.000 | 2.585 | 0.000 | — |
| cobahh | 1.664 | 0.000 | 1.579 | 0.000 | 0.948 |
| complex | 1.954 | 0.000 | 1.738 | 0.000 | 0.889 |
| compute-score | 2.179 | 0.000 | 2.297 | 0.000 | — |
| concat | 1.495 | 0.000 | 1.481 | 0.000 | 0.990 |
| concurrentKernels | 1.517 | 0.000 | 1.531 | 0.000 | 1.009 |
| convolution3D | 2.299 | 0.000 | 2.205 | 0.000 | 0.959 |
| convolutionSeparable | 1.475 | 0.000 | 1.454 | 0.000 | 0.986 |
| cooling | 1.767 | 0.000 | 1.685 | 0.000 | 0.953 |
| cross | 2.219 | 0.000 | 2.073 | 0.000 | 0.935 |
| crossEntropy | 2.690 | 0.000 | 3.658 | 0.000 | — |
| crs | 2.508 | 0.000 | 2.248 | 0.000 | 0.896 |
| damage | 6.042 | 0.000 | 5.838 | 0.000 | — |
| dct8x8 | 1.460 | 0.000 | 1.456 | 0.000 | 0.997 |
| degrid | 1.190 | 0.000 | 2.084 | 0.000 | — |
| dense-embedding | 2.119 | 0.000 | 2.034 | 0.000 | 0.960 |
| dp | 3.082 | 0.000 | 6.499 | 0.000 | — |
| dwconv | 0.685 | 0.000 | — | — | — |
| dxtc2 | 1.661 | 0.000 | — | — | — |
| ecdh | 1.728 | 0.000 | 1.688 | 0.000 | 0.977 |
| eigenvalue | 2.127 | 0.000 | 2.191 | 0.000 | — |
| entropy | 1.659 | 0.000 | 1.607 | 0.000 | 0.969 |
| epistasis | 2.398 | 0.000 | 2.309 | 0.000 | 0.963 |
| ert | 3.349 | 0.000 | 2.344 | 0.000 | 0.700 |
| expdist | 1.031 | 0.000 | 2.205 | 0.000 | — |
| extend2 | 0.724 | 0.000 | — | — | — |
| f16sp | 3.153 | 0.000 | 6.589 | 0.000 | — |
| fdtd3d | 2.333 | 0.000 | 2.295 | 0.000 | 0.984 |
| fft | 2.705 | 0.000 | 2.413 | 0.000 | 0.892 |
| filter | 1.877 | 0.000 | 4.169 | 0.000 | — |
| flip | 1.697 | 0.000 | 1.867 | 0.000 | — |
| floydwarshall | 1.574 | 0.000 | 1.516 | 0.000 | 0.963 |
| fpc | 1.605 | 0.000 | 1.548 | 0.000 | 0.965 |
| fsm | 0.927 | 0.000 | 1.633 | 0.000 | — |
| fwt | 1.587 | 0.000 | 1.494 | 0.000 | 0.941 |
| gabor | 1.593 | 0.000 | 1.532 | 0.000 | 0.962 |
| gamma-correction | 2.293 | 0.000 | 2.398 | 0.000 | — |
| gaussian | 2.326 | 0.000 | 2.224 | 0.000 | 0.956 |
| gd | 2.839 | 0.000 | 6.121 | 0.000 | — |
| gelu | 2.094 | 0.000 | 1.915 | 0.000 | 0.914 |
| geodesic | 2.140 | 0.000 | 2.090 | 0.000 | 0.977 |
| glu | 2.015 | 0.000 | 2.138 | 0.000 | — |
| goulash | 1.538 | 0.000 | 1.484 | 0.000 | 0.965 |
| gpp | 1.110 | 0.000 | — | — | — |
| haccmk | 1.562 | 0.000 | 1.479 | 0.000 | 0.947 |
| hausdorff | 0.751 | 0.000 | — | — | — |
| heat | 2.202 | 0.000 | 2.142 | 0.000 | 0.973 |
| heat2d | 1.564 | 0.000 | 1.497 | 0.000 | 0.957 |
| histogram | 2.751 | 0.000 | 3.320 | 0.000 | — |
| hmm | 1.393 | 0.000 | 1.373 | 0.000 | 0.986 |
| hotspot3D | 1.543 | 0.000 | 1.491 | 0.000 | 0.967 |
| hwt1d | 1.957 | 0.000 | 1.965 | 0.000 | 1.004 |
| hybridsort | 1.576 | 0.000 | 1.502 | 0.000 | 0.953 |
| inversek2j | 2.274 | 0.000 | 2.122 | 0.000 | 0.933 |
| ising | 2.223 | 0.000 | 2.161 | 0.000 | 0.972 |
| iso2dfd | 2.040 | 0.000 | 2.218 | 0.000 | — |
| jacobi | 1.064 | 0.000 | 2.132 | 0.000 | — |
| jenkins-hash | 1.643 | 0.000 | 1.520 | 0.000 | 0.926 |
| knn | 1.690 | 0.000 | 1.566 | 0.000 | 0.927 |
| laplace | 6.175 | 0.000 | 6.435 | 0.000 | — |
| laplace3d | 1.686 | 0.000 | 1.681 | 0.000 | 0.997 |
| lavaMD | 1.615 | 0.000 | 1.550 | 0.000 | 0.960 |
| layout | 2.076 | 0.000 | 2.000 | 0.000 | 0.963 |
| libor | 1.856 | 0.000 | 1.771 | 0.000 | 0.954 |
| lid-driven-cavity | 1.898 | 0.000 | 5.374 | 0.000 | 2.831 |
| lif | 1.841 | 0.000 | 1.745 | 0.000 | 0.948 |
| linearprobing | 2.453 | 0.000 | 2.585 | 0.000 | — |
| logprob | 2.455 | 0.000 | 2.372 | 0.000 | 0.966 |
| lombscargle | 1.588 | 0.000 | 1.522 | 0.000 | 0.958 |
| lr | 0.669 | 0.000 | — | — | — |
| mandelbrot | 2.094 | 0.000 | 2.180 | 0.000 | — |
| mask | 1.807 | 0.000 | 1.675 | 0.000 | 0.927 |
| matrix-rotate | 1.556 | 0.000 | 1.518 | 0.000 | 0.976 |
| maxpool3d | 1.562 | 0.000 | 1.490 | 0.000 | 0.954 |
| mcpr | 2.476 | 0.000 | 2.371 | 0.000 | 0.958 |
| md | 2.134 | 0.000 | 2.186 | 0.000 | — |
| meanshift | 2.722 | 0.000 | 2.836 | 0.000 | — |
| medianfilter | 0.685 | 0.000 | — | — | — |
| merge | 2.743 | 0.000 | 3.263 | 0.000 | — |
| merkle | 1.984 | 0.000 | 1.991 | 0.000 | 1.003 |
| minimod | 1.544 | 0.000 | 1.456 | 0.000 | 0.943 |
| minisweep | 1.096 | 0.000 | 2.353 | 0.000 | — |
| minkowski | 2.058 | 0.000 | 2.047 | 0.000 | 0.994 |
| mnist | 1.046 | 0.000 | 2.238 | 0.000 | — |
| mr | 1.854 | 0.000 | 1.827 | 0.000 | 0.986 |
| mrc | 2.076 | 0.000 | 2.021 | 0.000 | 0.973 |
| multinomial | 6.054 | 0.000 | 5.963 | 0.000 | — |
| murmurhash3 | 1.602 | 0.000 | 1.565 | 0.000 | 0.977 |
| nbnxm | 1.117 | 0.000 | 2.331 | 0.000 | — |
| nbody | 2.394 | 0.000 | 2.445 | 0.000 | — |
| nlll | 3.304 | 0.000 | 2.988 | 0.000 | 0.905 |
| overlap | 1.548 | 0.000 | 1.493 | 0.000 | 0.964 |
| overlay | 1.541 | 0.000 | 1.525 | 0.000 | 0.989 |
| p4 | 1.625 | 0.000 | 1.638 | 0.000 | — |
| pad | 2.261 | 0.000 | 2.349 | 0.000 | — |
| page-rank | 1.640 | 0.000 | 1.582 | 0.000 | 0.965 |
| particle-diffusion | 2.151 | 0.000 | 2.269 | 0.000 | — |
| particlefilter | 2.039 | 0.000 | 1.878 | 0.000 | 0.921 |
| pathfinder | 2.038 | 0.000 | 1.972 | 0.000 | 0.967 |
| permute | 0.645 | 0.000 | — | — | — |
| perplexity | 1.650 | 0.000 | 1.662 | 0.000 | — |
| pns | 0.847 | 0.000 | 1.832 | 0.000 | — |
| pointwise | 1.819 | 0.000 | 1.655 | 0.000 | 0.910 |
| projectile | 2.233 | 0.000 | 2.138 | 0.000 | 0.958 |
| rsc | 2.178 | 0.000 | 2.305 | 0.000 | — |
| s3d | 2.104 | 0.000 | 2.176 | 0.000 | — |
| sc | 2.263 | 0.000 | 2.299 | 0.000 | — |
| sheath | 0.917 | 0.000 | 1.891 | 0.000 | — |
| simplemoc | 1.765 | 0.000 | 1.670 | 0.000 | 0.946 |
| softmax | 1.853 | 0.000 | 3.640 | 0.000 | — |
| stddev | 0.762 | 0.000 | 1.489 | 0.000 | — |
| su3 | 2.081 | 0.000 | 2.176 | 0.000 | — |
| tissue | 1.536 | 0.000 | 1.527 | 0.000 | 0.994 |
| tqs | 2.007 | 0.000 | 1.990 | 0.000 | 0.992 |
| tridiagonal | 2.174 | 0.000 | 1.983 | 0.000 | 0.912 |
| vanGenuchten | 1.538 | 0.000 | 1.490 | 0.000 | 0.969 |
| vol2col | 1.729 | 0.000 | 1.654 | 0.000 | 0.957 |
| winograd | 1.458 | 0.000 | 1.415 | 0.000 | 0.971 |
| zerocopy | 1.407 | 0.000 | 1.395 | 0.000 | 0.992 |
| zeropoint | 1.976 | 0.000 | 1.941 | 0.000 | 0.983 |

**Total compile OG/CIR (geomean):** `0.9705`

## Failures (compile)

- [CIR] `atomicCost` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:53:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_d`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/atomicCost.cuda.cir.sm_86.log`
- [CIR] `atomicCAS` — `/home/ubuntu/hecbench/src/atomicCAS-cuda/kernels.h:6:47: error: use of undeclared identifier '__NV_ATOMIC_RELAXED'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/atomicCAS.cuda.cir.sm_86.log`
- [OG] `atomicCAS` — `/home/ubuntu/hecbench/src/atomicCAS-cuda/kernels.h:6:47: error: use of undeclared identifier '__NV_ATOMIC_RELAXED'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/atomicCAS.cuda.og.sm_86.log`
- [CIR] `asmooth` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/asmooth.cuda.cir.sm_86.log`
- [CIR] `atomicPerf` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:53:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_d`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/atomicPerf.cuda.cir.sm_86.log`
- [CIR] `aop` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:53:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_d`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/aop.cuda.cir.sm_86.log`
- [CIR] `aidw` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algobase.h:1107:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/aidw.cuda.cir.sm_86.log`
- [CIR] `axhelm` — `/home/ubuntu/hecbench/src/axhelm-cuda/meshBasis.hpp:14:27: error: unknown type name 'dfloat'; did you mean 'float'?`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/axhelm.cuda.cir.sm_86.log`
- [OG] `axhelm` — `/home/ubuntu/hecbench/src/axhelm-cuda/meshBasis.hpp:14:27: error: unknown type name 'dfloat'; did you mean 'float'?`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/axhelm.cuda.og.sm_86.log`
- [CIR] `bh` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:359:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_cas_gen_i`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/bh.cuda.cir.sm_86.log`
- [CIR] `boxfilter` — `/home/ubuntu/hecbench/src/boxfilter-cuda/main.cu:16:10: fatal error: 'shrUtils.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/boxfilter.cuda.cir.sm_86.log`
- [CIR] `bitonic-sort` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ext/string_conversions.h:72:4: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::integral_constant<bool, true>" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/bitonic-sort.cuda.cir.sm_86.log`
- [OG] `boxfilter` — `/home/ubuntu/hecbench/src/boxfilter-cuda/main.cu:16:10: fatal error: 'shrUtils.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/boxfilter.cuda.og.sm_86.log`
- [CIR] `bitpacking` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/bitpacking.cuda.cir.sm_86.log`
- [CIR] `attention` — `/usr/include/cooperative_groups.h:91:9: error: ClangIR code gen Not Yet Implemented: NYI CheapUnalignedBitFieldAccess`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/attention.cuda.cir.sm_86.log`
- [CIR] `channelShuffle` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_intrinsics.h:287:58: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_ldg_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/channelShuffle.cuda.cir.sm_86.log`
- [CIR] `bsearch` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/bsearch.cuda.cir.sm_86.log`
- [CIR] `bwt` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/bwt.cuda.cir.sm_86.log`
- [CIR] `all-pairs-distance` — `/usr/include/nvtx3/nvtxDetail/nvtxInit.h:312:5: error: ClangIR code gen Not Yet Implemented: unimplemented X86 builtin call: __sync_val_compare_and_swap_4`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/all-pairs-distance.cuda.cir.sm_86.log`
- [CIR] `accuracy` — `/usr/include/nvtx3/nvtxDetail/nvtxInit.h:312:5: error: ClangIR code gen Not Yet Implemented: unimplemented X86 builtin call: __sync_val_compare_and_swap_4`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/accuracy.cuda.cir.sm_86.log`
- [CIR] `channelSum` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_intrinsics.h:264:54: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_ldg_i`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/channelSum.cuda.cir.sm_86.log`
- [CIR] `cmp` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ext/string_conversions.h:69:4: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::integral_constant<bool, false>" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/cmp.cuda.cir.sm_86.log`
- [CIR] `compute-score` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/compute-score.cuda.cir.sm_86.log`
- [CIR] `dwconv` — `/home/ubuntu/hecbench/src/dwconv-cuda/main.cu:5:10: fatal error: 'tensorAccessor.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/dwconv.cuda.cir.sm_86.log`
- [OG] `dwconv` — `/home/ubuntu/hecbench/src/dwconv-cuda/main.cu:5:10: fatal error: 'tensorAccessor.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/dwconv.cuda.og.sm_86.log`
- [CIR] `degrid` — `ptxas fatal   : Unresolved extern function 'memcpy'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/degrid.cuda.cir.sm_86.log`
- [CIR] `crossEntropy` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/alloc_traits.h:561:7: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<class "std::allocator<float>" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/crossEntropy.cuda.cir.sm_86.log`
- [CIR] `extend2` — `/home/ubuntu/hecbench/src/extend2-cuda/main.cu:30:10: fatal error: 'read_data.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/extend2.cuda.cir.sm_86.log`
- [OG] `extend2` — `/home/ubuntu/hecbench/src/extend2-cuda/main.cu:30:10: fatal error: 'read_data.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/extend2.cuda.og.sm_86.log`
- [CIR] `dxtc2` — `/home/ubuntu/hecbench/src/dxtc2-cuda/main.cu:42:10: fatal error: 'shrUtils.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/dxtc2.cuda.cir.sm_86.log`
- [OG] `dxtc2` — `/home/ubuntu/hecbench/src/dxtc2-cuda/main.cu:42:10: fatal error: 'shrUtils.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/dxtc2.cuda.og.sm_86.log`
- [CIR] `expdist` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/expdist.cuda.cir.sm_86.log`
- [CIR] `eigenvalue` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/eigenvalue.cuda.cir.sm_86.log`
- [CIR] `fsm` — `ptxas fatal   : Unresolved extern function 'memset'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/fsm.cuda.cir.sm_86.log`
- [CIR] `dp` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/dp.cuda.cir.sm_86.log`
- [CIR] `flip` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/alloc_traits.h:561:7: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<class "std::allocator<long>" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/flip.cuda.cir.sm_86.log`
- [CIR] `filter` — `/usr/include/cooperative_groups.h:91:9: error: ClangIR code gen Not Yet Implemented: NYI CheapUnalignedBitFieldAccess`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/filter.cuda.cir.sm_86.log`
- [CIR] `f16sp` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/f16sp.cuda.cir.sm_86.log`
- [CIR] `hausdorff` — `/home/ubuntu/hecbench/src/hausdorff-cuda/main.cu:21:46: error: use of undeclared identifier '__NV_ATOMIC_RELAXED'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/hausdorff.cuda.cir.sm_86.log`
- [OG] `hausdorff` — `/home/ubuntu/hecbench/src/hausdorff-cuda/main.cu:21:46: error: use of undeclared identifier '__NV_ATOMIC_RELAXED'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/hausdorff.cuda.og.sm_86.log`
- [CIR] `gpp` — `/home/ubuntu/hecbench/src/gpp-cuda/kernel.h:27:11: error: no matching function for call to 'CustomComplex_conj'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/gpp.cuda.cir.sm_86.log`
- [OG] `gpp` — `/home/ubuntu/hecbench/src/gpp-cuda/kernel.h:27:11: error: no matching function for call to 'CustomComplex_conj'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/gpp.cuda.og.sm_86.log`
- [CIR] `gamma-correction` — `/home/ubuntu/hecbench/src/gamma-correction-cuda/utils/Img.hpp:66:3: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<class "anon.0" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/gamma-correction.cuda.cir.sm_86.log`
- [CIR] `damage` — `/usr/include/nvtx3/nvtxDetail/nvtxInit.h:312:5: error: ClangIR code gen Not Yet Implemented: unimplemented X86 builtin call: __sync_val_compare_and_swap_4`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/damage.cuda.cir.sm_86.log`
- [CIR] `glu` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/glu.cuda.cir.sm_86.log`
- [CIR] `gd` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/gd.cuda.cir.sm_86.log`
- [CIR] `jacobi` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/jacobi.cuda.cir.sm_86.log`
- [CIR] `histogram` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_heap.h:223:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"__gnu_cxx::__ops::_Iter_comp_iter<less_than_value>" {data !cir.struct<"less_than_value" padded {pad !cir.int<u, 8>}>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/histogram.cuda.cir.sm_86.log`
- [CIR] `iso2dfd` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ext/string_conversions.h:72:4: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::integral_constant<bool, true>" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/iso2dfd.cuda.cir.sm_86.log`
- [CIR] `lr` — `/home/ubuntu/hecbench/src/lr-cuda/linear.h:7:10: fatal error: 'hip/hip_runtime.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/lr.cuda.cir.sm_86.log`
- [OG] `lr` — `/home/ubuntu/hecbench/src/lr-cuda/linear.h:7:10: fatal error: 'hip/hip_runtime.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/lr.cuda.og.sm_86.log`
- [CIR] `medianfilter` — `/home/ubuntu/hecbench/src/medianfilter-cuda/main.cu:10:10: fatal error: 'shrUtils.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/medianfilter.cuda.cir.sm_86.log`
- [OG] `medianfilter` — `/home/ubuntu/hecbench/src/medianfilter-cuda/main.cu:10:10: fatal error: 'shrUtils.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/medianfilter.cuda.og.sm_86.log`
- [CIR] `mandelbrot` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/mandelbrot.cuda.cir.sm_86.log`
- [CIR] `linearprobing` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algobase.h:1107:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/linearprobing.cuda.cir.sm_86.log`
- [CIR] `minisweep` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:53:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_d`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/minisweep.cuda.cir.sm_86.log`
- [CIR] `md` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:166:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::bidirectional_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/md.cuda.cir.sm_86.log`
- [CIR] `mnist` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/mnist.cuda.cir.sm_86.log`
- [CIR] `meanshift` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ext/string_conversions.h:69:4: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::integral_constant<bool, false>" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/meanshift.cuda.cir.sm_86.log`
- [CIR] `nbnxm` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/nbnxm.cuda.cir.sm_86.log`
- [CIR] `merge` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/predefined_ops.h:62:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"__gnu_cxx::__ops::_Iter_less_iter" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/merge.cuda.cir.sm_86.log`
- [CIR] `laplace` — `/usr/include/nvtx3/nvtxDetail/nvtxInit.h:312:5: error: ClangIR code gen Not Yet Implemented: unimplemented X86 builtin call: __sync_val_compare_and_swap_4`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/laplace.cuda.cir.sm_86.log`
- [CIR] `permute` — `/home/ubuntu/hecbench/src/permute-cuda/main.cu:7:10: fatal error: 'common.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/permute.cuda.cir.sm_86.log`
- [OG] `permute` — `/home/ubuntu/hecbench/src/permute-cuda/main.cu:7:10: fatal error: 'common.h' file not found`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/permute.cuda.og.sm_86.log`
- [CIR] `p4` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algo.h:5658:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"__gnu_cxx::__ops::_Iter_less_iter" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/p4.cuda.cir.sm_86.log`
- [CIR] `nbody` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algobase.h:1107:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/nbody.cuda.cir.sm_86.log`
- [CIR] `pns` — `/home/ubuntu/hecbench/src/pns-cuda/petri_kernel.cu:175:4: error: 'cir.cast' op result type address space does not match the address space of the operand`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/pns.cuda.cir.sm_86.log`
- [CIR] `pad` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/invoke.h:59:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::__invoke_other" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/pad.cuda.cir.sm_86.log`
- [CIR] `perplexity` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algobase.h:1107:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/perplexity.cuda.cir.sm_86.log`
- [CIR] `particle-diffusion` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ext/string_conversions.h:72:4: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::integral_constant<bool, true>" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/particle-diffusion.cuda.cir.sm_86.log`
- [CIR] `sheath` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/sheath.cuda.cir.sm_86.log`
- [CIR] `stddev` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/stddev.cuda.cir.sm_86.log`
- [CIR] `rsc` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/invoke.h:59:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::__invoke_other" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/rsc.cuda.cir.sm_86.log`
- [CIR] `s3d` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/s3d.cuda.cir.sm_86.log`
- [CIR] `softmax` — `/usr/include/cooperative_groups.h:91:9: error: ClangIR code gen Not Yet Implemented: NYI CheapUnalignedBitFieldAccess`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/softmax.cuda.cir.sm_86.log`
- [CIR] `sc` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/invoke.h:59:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::__invoke_other" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/sc.cuda.cir.sm_86.log`
- [CIR] `su3` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algobase.h:1107:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/su3.cuda.cir.sm_86.log`
- [CIR] `multinomial` — `/usr/include/nvtx3/nvtxDetail/nvtxInit.h:312:5: error: ClangIR code gen Not Yet Implemented: unimplemented X86 builtin call: __sync_val_compare_and_swap_4`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/multinomial.cuda.cir.sm_86.log`
