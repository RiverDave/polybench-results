HeCBench compile-phase timing: CIR vs OG.

- ClangIR commit: `be46daffea1e`
- Scripts commit: `5d63178`
- arch: `sm_86`
- HeCBench root: `/home/ubuntu/hecbench`
- Logs: `temp/hecbench-compile-cuda-sm_86-j30`
- Flags: `-O3 host+device -ftime-report -mllvm -time-passes`
- Warmup runs per benchmark: 1
- Timed samples per benchmark: 1
- CIR compiled OK: `101/162`
- OG compiled OK: `157/162`

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
- timestamp utc: `2026-08-15T06:46:16+00:00`

## Per-benchmark wall time (seconds)

### arch: `sm_86`

| Benchmark | CIR | CIR σ | OG | OG σ | OG/CIR |
|---|---:|---:|---:|---:|---:|
| accuracy | 6.208 | 0.000 | 6.071 | 0.000 | — |
| ace | 2.071 | 0.000 | 1.861 | 0.000 | 0.898 |
| adam | 2.147 | 0.000 | 2.060 | 0.000 | 0.960 |
| adv | 2.465 | 0.000 | 2.381 | 0.000 | 0.966 |
| aidw | 1.705 | 0.000 | 1.807 | 0.000 | — |
| all-pairs-distance | 6.002 | 0.000 | 5.853 | 0.000 | — |
| aobench | 1.764 | 0.000 | 1.642 | 0.000 | 0.931 |
| aop | 1.306 | 0.000 | 2.571 | 0.000 | — |
| asmooth | 0.799 | 0.000 | 1.591 | 0.000 | — |
| assert | 1.523 | 0.000 | 1.456 | 0.000 | 0.957 |
| asta | 1.756 | 0.000 | 1.686 | 0.000 | 0.960 |
| atomicAggregate | 1.591 | 0.000 | 1.472 | 0.000 | 0.926 |
| atomicCAS | 0.773 | 0.000 | — | — | — |
| atomicCost | 0.753 | 0.000 | 1.543 | 0.000 | — |
| atomicPerf | 0.831 | 0.000 | 1.791 | 0.000 | — |
| atomicReduction | 2.189 | 0.000 | 2.088 | 0.000 | 0.954 |
| attention | 3.271 | 0.000 | 6.985 | 0.000 | — |
| axhelm | 2.350 | 0.000 | 3.213 | 0.000 | 1.367 |
| background-subtract | 2.150 | 0.000 | 2.045 | 0.000 | 0.951 |
| backprop | 1.751 | 0.000 | 1.668 | 0.000 | 0.953 |
| bezier-surface | 2.240 | 0.000 | 2.134 | 0.000 | 0.953 |
| bh | 1.006 | 0.000 | 1.799 | 0.000 | — |
| bilateral | 1.769 | 0.000 | 2.792 | 0.000 | 1.579 |
| binomial | 1.491 | 0.000 | 1.543 | 0.000 | 1.035 |
| bitonic-sort | 1.991 | 0.000 | 2.041 | 0.000 | — |
| bitpacking | 2.046 | 0.000 | 2.073 | 0.000 | — |
| black-scholes | 1.972 | 0.000 | 1.842 | 0.000 | 0.934 |
| bn | 3.032 | 0.000 | 2.741 | 0.000 | 0.904 |
| bonds | 3.780 | 0.000 | 3.441 | 0.000 | 0.910 |
| boxfilter | 2.326 | 0.000 | 2.255 | 0.000 | 0.970 |
| bsearch | 2.010 | 0.000 | 2.066 | 0.000 | — |
| bspline-vgh | 1.752 | 0.000 | 1.654 | 0.000 | 0.944 |
| burger | 1.671 | 0.000 | 1.603 | 0.000 | 0.959 |
| bwt | 2.100 | 0.000 | 2.160 | 0.000 | — |
| cbsfil | 2.325 | 0.000 | 2.263 | 0.000 | 0.974 |
| ccsd-trpdrv | 1.503 | 0.000 | 1.513 | 0.000 | 1.007 |
| channelShuffle | 0.782 | 0.000 | 1.576 | 0.000 | — |
| channelSum | 2.869 | 0.000 | 5.937 | 0.000 | — |
| chemv | 1.565 | 0.000 | 1.459 | 0.000 | 0.932 |
| chi2 | 2.353 | 0.000 | 2.313 | 0.000 | 0.983 |
| clenergy | 1.375 | 0.000 | 1.392 | 0.000 | 1.012 |
| clink | 2.340 | 0.000 | 2.210 | 0.000 | 0.944 |
| cmp | 2.378 | 0.000 | 2.591 | 0.000 | — |
| cobahh | 1.683 | 0.000 | 1.559 | 0.000 | 0.927 |
| complex | 1.918 | 0.000 | 1.751 | 0.000 | 0.913 |
| compute-score | 2.194 | 0.000 | 2.316 | 0.000 | — |
| concat | 1.591 | 0.000 | 1.484 | 0.000 | 0.933 |
| concurrentKernels | 1.550 | 0.000 | 1.532 | 0.000 | 0.988 |
| convolution3D | 2.370 | 0.000 | 2.219 | 0.000 | 0.936 |
| convolutionSeparable | 1.464 | 0.000 | 1.456 | 0.000 | 0.995 |
| cooling | 1.733 | 0.000 | 1.708 | 0.000 | 0.985 |
| cross | 2.219 | 0.000 | 2.110 | 0.000 | 0.951 |
| crossEntropy | 2.659 | 0.000 | 3.609 | 0.000 | — |
| crs | 2.519 | 0.000 | 2.206 | 0.000 | 0.876 |
| damage | 6.029 | 0.000 | 5.879 | 0.000 | — |
| dct8x8 | 1.471 | 0.000 | 1.468 | 0.000 | 0.998 |
| degrid | 1.197 | 0.000 | 2.060 | 0.000 | — |
| dense-embedding | 2.127 | 0.000 | 2.040 | 0.000 | 0.959 |
| dp | 3.063 | 0.000 | 6.454 | 0.000 | — |
| dwconv | 1.769 | 0.000 | 1.705 | 0.000 | 0.964 |
| dxtc2 | 1.787 | 0.000 | — | — | — |
| ecdh | 1.830 | 0.000 | 1.695 | 0.000 | 0.926 |
| eigenvalue | 2.118 | 0.000 | 2.223 | 0.000 | — |
| entropy | 1.652 | 0.000 | 1.620 | 0.000 | 0.981 |
| epistasis | 2.357 | 0.000 | 2.284 | 0.000 | 0.969 |
| ert | 3.299 | 0.000 | 2.404 | 0.000 | 0.729 |
| expdist | 1.109 | 0.000 | 2.218 | 0.000 | — |
| extend2 | 1.596 | 0.000 | 1.588 | 0.000 | 0.995 |
| f16sp | 3.166 | 0.000 | 6.595 | 0.000 | — |
| fdtd3d | 2.361 | 0.000 | 2.273 | 0.000 | 0.963 |
| fft | 2.723 | 0.000 | 2.413 | 0.000 | 0.886 |
| filter | 1.857 | 0.000 | 4.152 | 0.000 | — |
| flip | 1.686 | 0.000 | 1.882 | 0.000 | — |
| floydwarshall | 1.550 | 0.000 | 1.522 | 0.000 | 0.982 |
| fpc | 1.611 | 0.000 | 1.540 | 0.000 | 0.955 |
| fsm | 0.947 | 0.000 | 1.614 | 0.000 | — |
| fwt | 1.523 | 0.000 | 1.500 | 0.000 | 0.985 |
| gabor | 1.573 | 0.000 | 1.549 | 0.000 | 0.985 |
| gamma-correction | 2.386 | 0.000 | 2.413 | 0.000 | — |
| gaussian | 2.285 | 0.000 | 2.209 | 0.000 | 0.967 |
| gd | 2.863 | 0.000 | 6.115 | 0.000 | — |
| gelu | 1.992 | 0.000 | 1.935 | 0.000 | 0.972 |
| geodesic | 2.188 | 0.000 | 2.063 | 0.000 | 0.943 |
| glu | 2.035 | 0.000 | 2.184 | 0.000 | — |
| goulash | 1.626 | 0.000 | 1.511 | 0.000 | 0.930 |
| gpp | 1.101 | 0.000 | — | — | — |
| haccmk | 1.591 | 0.000 | 1.501 | 0.000 | 0.944 |
| hausdorff | 0.753 | 0.000 | — | — | — |
| heat | 2.227 | 0.000 | 2.142 | 0.000 | 0.962 |
| heat2d | 1.548 | 0.000 | 1.536 | 0.000 | 0.992 |
| histogram | 2.817 | 0.000 | 3.289 | 0.000 | — |
| hmm | 1.413 | 0.000 | 1.372 | 0.000 | 0.971 |
| hotspot3D | 1.571 | 0.000 | 1.491 | 0.000 | 0.949 |
| hwt1d | 2.010 | 0.000 | 1.939 | 0.000 | 0.964 |
| hybridsort | 1.565 | 0.000 | 1.502 | 0.000 | 0.960 |
| inversek2j | 2.202 | 0.000 | 2.127 | 0.000 | 0.966 |
| ising | 2.311 | 0.000 | 2.143 | 0.000 | 0.927 |
| iso2dfd | 2.079 | 0.000 | 2.221 | 0.000 | — |
| jacobi | 1.128 | 0.000 | 2.114 | 0.000 | — |
| jenkins-hash | 1.595 | 0.000 | 1.527 | 0.000 | 0.957 |
| knn | 1.690 | 0.000 | 1.576 | 0.000 | 0.932 |
| laplace | 6.275 | 0.000 | 6.430 | 0.000 | — |
| laplace3d | 1.686 | 0.000 | 1.655 | 0.000 | 0.982 |
| lavaMD | 1.601 | 0.000 | 1.541 | 0.000 | 0.962 |
| layout | 2.051 | 0.000 | 1.983 | 0.000 | 0.967 |
| libor | 1.934 | 0.000 | 1.843 | 0.000 | 0.953 |
| lid-driven-cavity | 1.936 | 0.000 | 5.382 | 0.000 | 2.780 |
| lif | 1.900 | 0.000 | 1.758 | 0.000 | 0.925 |
| linearprobing | 2.431 | 0.000 | 2.597 | 0.000 | — |
| logprob | 2.490 | 0.000 | 2.384 | 0.000 | 0.957 |
| lombscargle | 1.597 | 0.000 | 1.528 | 0.000 | 0.957 |
| lr | 1.480 | 0.000 | 1.480 | 0.000 | 1.000 |
| mandelbrot | 2.125 | 0.000 | 2.206 | 0.000 | — |
| mask | 1.815 | 0.000 | 1.695 | 0.000 | 0.934 |
| matrix-rotate | 1.532 | 0.000 | 1.504 | 0.000 | 0.982 |
| maxpool3d | 1.562 | 0.000 | 1.500 | 0.000 | 0.961 |
| mcpr | 2.546 | 0.000 | 2.377 | 0.000 | 0.934 |
| md | 2.091 | 0.000 | 2.222 | 0.000 | — |
| meanshift | 2.678 | 0.000 | 2.883 | 0.000 | — |
| medianfilter | 1.554 | 0.000 | 1.540 | 0.000 | 0.991 |
| merge | 2.848 | 0.000 | 3.279 | 0.000 | — |
| merkle | 1.986 | 0.000 | 1.999 | 0.000 | 1.006 |
| minimod | 1.523 | 0.000 | 1.441 | 0.000 | 0.946 |
| minisweep | 1.084 | 0.000 | 2.359 | 0.000 | — |
| minkowski | 2.077 | 0.000 | 2.019 | 0.000 | 0.972 |
| mnist | 1.036 | 0.000 | 2.219 | 0.000 | — |
| mr | 1.838 | 0.000 | 1.777 | 0.000 | 0.967 |
| mrc | 2.109 | 0.000 | 2.037 | 0.000 | 0.966 |
| multinomial | 6.099 | 0.000 | 5.972 | 0.000 | — |
| murmurhash3 | 1.675 | 0.000 | 1.564 | 0.000 | 0.934 |
| nbnxm | 1.162 | 0.000 | 2.370 | 0.000 | — |
| nbody | 2.363 | 0.000 | 2.467 | 0.000 | — |
| nlll | 3.271 | 0.000 | 3.001 | 0.000 | 0.917 |
| overlap | 1.530 | 0.000 | 1.493 | 0.000 | 0.976 |
| overlay | 1.572 | 0.000 | 1.488 | 0.000 | 0.947 |
| p4 | 1.597 | 0.000 | 1.634 | 0.000 | — |
| pad | 2.296 | 0.000 | 2.366 | 0.000 | — |
| page-rank | 1.662 | 0.000 | 1.629 | 0.000 | 0.980 |
| particle-diffusion | 2.101 | 0.000 | 2.193 | 0.000 | — |
| particlefilter | 2.103 | 0.000 | 1.882 | 0.000 | 0.895 |
| pathfinder | 2.017 | 0.000 | 1.951 | 0.000 | 0.967 |
| permute | 1.079 | 0.000 | — | — | — |
| perplexity | 1.625 | 0.000 | 1.704 | 0.000 | — |
| pns | 0.835 | 0.000 | 1.822 | 0.000 | — |
| pointwise | 1.739 | 0.000 | 1.665 | 0.000 | 0.957 |
| projectile | 2.258 | 0.000 | 2.170 | 0.000 | 0.961 |
| rsc | 2.240 | 0.000 | 2.350 | 0.000 | — |
| s3d | 2.147 | 0.000 | 2.181 | 0.000 | — |
| sc | 2.237 | 0.000 | 2.327 | 0.000 | — |
| sheath | 0.919 | 0.000 | 1.900 | 0.000 | — |
| simplemoc | 1.781 | 0.000 | 1.675 | 0.000 | 0.941 |
| softmax | 1.858 | 0.000 | 3.651 | 0.000 | — |
| stddev | 0.737 | 0.000 | 1.487 | 0.000 | — |
| su3 | 2.095 | 0.000 | 2.205 | 0.000 | — |
| tissue | 1.535 | 0.000 | 1.496 | 0.000 | 0.974 |
| tqs | 2.019 | 0.000 | 1.984 | 0.000 | 0.982 |
| tridiagonal | 2.176 | 0.000 | 2.001 | 0.000 | 0.919 |
| vanGenuchten | 1.519 | 0.000 | 1.496 | 0.000 | 0.984 |
| vol2col | 1.717 | 0.000 | 1.688 | 0.000 | 0.983 |
| winograd | 1.463 | 0.000 | 1.430 | 0.000 | 0.977 |
| zerocopy | 1.422 | 0.000 | 1.387 | 0.000 | 0.976 |
| zeropoint | 1.955 | 0.000 | 1.946 | 0.000 | 0.996 |

**Total compile OG/CIR (geomean):** `0.9734`

## Failures (compile)

- [CIR] `atomicCost` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:53:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_d`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/atomicCost.cuda.cir.sm_86.log`
- [OG] `atomicCAS` — `/home/ubuntu/hecbench/src/atomicCAS-cuda/kernels.h:6:47: error: use of undeclared identifier '__NV_ATOMIC_RELAXED'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/atomicCAS.cuda.og.sm_86.log`
- [CIR] `atomicCAS` — `/home/ubuntu/hecbench/src/atomicCAS-cuda/kernels.h:6:47: error: use of undeclared identifier '__NV_ATOMIC_RELAXED'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/atomicCAS.cuda.cir.sm_86.log`
- [CIR] `asmooth` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/asmooth.cuda.cir.sm_86.log`
- [CIR] `atomicPerf` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:53:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_d`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/atomicPerf.cuda.cir.sm_86.log`
- [CIR] `aop` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:53:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_d`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/aop.cuda.cir.sm_86.log`
- [CIR] `aidw` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algobase.h:1107:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/aidw.cuda.cir.sm_86.log`
- [CIR] `bh` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:359:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_cas_gen_i`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/bh.cuda.cir.sm_86.log`
- [CIR] `bitonic-sort` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ext/string_conversions.h:72:4: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::integral_constant<bool, true>" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/bitonic-sort.cuda.cir.sm_86.log`
- [CIR] `attention` — `/usr/include/cooperative_groups.h:91:9: error: ClangIR code gen Not Yet Implemented: NYI CheapUnalignedBitFieldAccess`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/attention.cuda.cir.sm_86.log`
- [CIR] `bitpacking` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/bitpacking.cuda.cir.sm_86.log`
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
- [CIR] `degrid` — `ptxas fatal   : Unresolved extern function 'memcpy'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/degrid.cuda.cir.sm_86.log`
- [CIR] `crossEntropy` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/alloc_traits.h:561:7: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<class "std::allocator<float>" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/crossEntropy.cuda.cir.sm_86.log`
- [OG] `dxtc2` — `/home/ubuntu/hecbench/src/dxtc2-cuda/main.cu:667:18: error: no matching function for call to 'min'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/dxtc2.cuda.og.sm_86.log`
- [CIR] `dxtc2` — `/usr/include/cooperative_groups.h:91:9: error: ClangIR code gen Not Yet Implemented: NYI CheapUnalignedBitFieldAccess`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/dxtc2.cuda.cir.sm_86.log`
- [CIR] `expdist` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/expdist.cuda.cir.sm_86.log`
- [CIR] `eigenvalue` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/eigenvalue.cuda.cir.sm_86.log`
- [CIR] `dp` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:177:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_f`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/dp.cuda.cir.sm_86.log`
- [CIR] `fsm` — `ptxas fatal   : Unresolved extern function 'memset'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/fsm.cuda.cir.sm_86.log`
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
- [CIR] `gamma-correction` — `/home/ubuntu/hecbench/src/gamma-correction-cuda/utils/Img.hpp:66:3: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<class "anon.0" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/gamma-correction.cuda.cir.sm_86.log`
- [OG] `gpp` — `/home/ubuntu/hecbench/src/gpp-cuda/kernel.h:27:11: error: no matching function for call to 'CustomComplex_conj'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/gpp.cuda.og.sm_86.log`
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
- [CIR] `linearprobing` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algobase.h:1107:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/linearprobing.cuda.cir.sm_86.log`
- [CIR] `mandelbrot` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:97:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/mandelbrot.cuda.cir.sm_86.log`
- [CIR] `md` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_iterator_base_funcs.h:166:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::bidirectional_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/md.cuda.cir.sm_86.log`
- [CIR] `minisweep` — `/home/ubuntu/llvm-project/build/lib/clang/24/include/__clang_cuda_device_functions.h:53:10: error: ClangIR code gen Not Yet Implemented: unimplemented NVPTX builtin call: __nvvm_atom_add_gen_d`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/minisweep.cuda.cir.sm_86.log`
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
- [CIR] `p4` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algo.h:5658:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"__gnu_cxx::__ops::_Iter_less_iter" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/p4.cuda.cir.sm_86.log`
- [CIR] `nbody` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algobase.h:1107:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/nbody.cuda.cir.sm_86.log`
- [CIR] `permute` — `/home/ubuntu/hecbench/src/permute-cuda/../qkv-cuda/common.h:63:13: error: no matching function for call to 'isfinite'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/permute.cuda.cir.sm_86.log`
- [OG] `permute` — `/home/ubuntu/hecbench/src/permute-cuda/../qkv-cuda/common.h:63:13: error: no matching function for call to 'isfinite'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/permute.cuda.og.sm_86.log`
- [CIR] `pns` — `/home/ubuntu/hecbench/src/pns-cuda/petri_kernel.cu:175:4: error: 'cir.cast' op result type address space does not match the address space of the operand`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/pns.cuda.cir.sm_86.log`
- [CIR] `perplexity` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/stl_algobase.h:1107:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::random_access_iterator_tag" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/perplexity.cuda.cir.sm_86.log`
- [CIR] `particle-diffusion` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/ext/string_conversions.h:72:4: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::integral_constant<bool, true>" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/particle-diffusion.cuda.cir.sm_86.log`
- [CIR] `pad` — `/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/invoke.h:59:5: error: 'cir.func' op x86_64 calling-convention lowering not yet implemented for type '!cir.struct<"std::__invoke_other" padded {pad !cir.int<u, 8>}>'`
  - log: `temp/hecbench-compile-cuda-sm_86-j30/pad.cuda.cir.sm_86.log`
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
