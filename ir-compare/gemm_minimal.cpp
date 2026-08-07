// Self-contained PolyBench/GPU GEMM-shaped kernel for CIR-vs-OG IR analysis.
// It deliberately avoids CUDA and ROCm headers/device libraries. The kernel
// body matches PolyBench GEMM's indexing and memory-access pattern.

// CUDA and HIP headers normally provide these convenience spellings.
#define __device__ __attribute__((device))
#define __global__ __attribute__((global))

#if defined(__HIP__)
extern "C" __device__ unsigned __ockl_get_group_id(unsigned);
extern "C" __device__ unsigned __ockl_get_local_id(unsigned);
extern "C" __device__ unsigned __ockl_get_local_size(unsigned);

static __device__ unsigned block_id(unsigned dimension) {
  return __ockl_get_group_id(dimension);
}

static __device__ unsigned thread_id(unsigned dimension) {
  return __ockl_get_local_id(dimension);
}

static __device__ unsigned block_size(unsigned dimension) {
  return __ockl_get_local_size(dimension);
}
#else
static __device__ unsigned block_id(unsigned dimension) {
  return dimension == 0 ? __nvvm_read_ptx_sreg_ctaid_x()
                        : __nvvm_read_ptx_sreg_ctaid_y();
}

static __device__ unsigned thread_id(unsigned dimension) {
  return dimension == 0 ? __nvvm_read_ptx_sreg_tid_x()
                        : __nvvm_read_ptx_sreg_tid_y();
}

static __device__ unsigned block_size(unsigned dimension) {
  return dimension == 0 ? __nvvm_read_ptx_sreg_ntid_x()
                        : __nvvm_read_ptx_sreg_ntid_y();
}
#endif

extern "C" __global__ void gemm_kernel(int ni, int nj, int nk, float alpha,
                                        float beta, float *a, float *b,
                                        float *c) {
  const int j = block_id(0) * block_size(0) + thread_id(0);
  const int i = block_id(1) * block_size(1) + thread_id(1);
  if (i >= ni || j >= nj)
    return;

  const int c_index = i * nj + j;
  c[c_index] *= beta;
  for (int k = 0; k < nk; ++k)
    c[c_index] += alpha * a[i * nk + k] * b[k * nj + j];
}
