#include <cuda.h>

static __global__ void direct_kernel(int n, float scale, int *out) {
  int i = blockIdx.x * blockDim.x + threadIdx.x;
  if (i < n)
    out[i] = (int)scale;
}

static void launch_direct(int *out) {
  dim3 block(256, 1, 1);
  dim3 grid(1, 1, 1);
  direct_kernel<<<grid, block>>>(256, 2.0f, out);
}

int main() {
  int *out = nullptr;
  launch_direct(out);
  return 0;
}
