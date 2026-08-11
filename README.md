# polybench-results

Benchmark results for the ClangIR CUDA/HIP paper: CIR vs Classic CodeGen on
PolyBench/GPU (21 benchmarks). Raw samples for the paper's figures and tables.

## Canonical paper data (what the paper's numbers come from)

- `nvidia-h100/2026-08-10T00-06Z/` — Lambda, NVIDIA H100 80GB HBM3 (sm_90),
  CUDA 12.8, driver 580.105.08. Host: Intel Xeon Platinum 8480+.
- `amd-mi300x/2026-08-10T01-19Z/` — AMD Developer Cloud, AMD Instinct
  MI300X VF (gfx942), ROCm 7.0.2. Host: Intel Xeon Platinum 8568Y+.

Both: LLVM commit `c45e6b9e4d95`, audit scripts commit `acc8640`, 8 samples
after 3 warmup runs, jobs=1. These reproduce the paper's Table 1, Figure 4
compile-time deltas (+32.1 ms CUDA / +48.7 ms HIP frontend+IRGen), the
runtime geomeans (0.998x H100 / 1.008x MI300X), and the executable-size
ratios (0.985x CUDA / 0.888x HIP).

The AMD run additionally carries per-benchmark `artifacts/` (device/host IR,
CIR/OG compile logs, and a `-fno-offload-uniform-block` comparison run).

## Other runs (not the paper)

The `2026-08-08T*` dirs are an earlier capture at the same LLVM commit but
older audit scripts (`de5bda2`) on different nodes: `nvidia-h100/...09-42Z`
is an H100 **PCIe** (hostname 209-20-156-202), `amd-mi300x/...04-11Z` a
different MI300X node (hostname `7`). They are noisier (e.g. MI300X runtime
has syr2k +13.9% and convolution-2d -12.5% outliers absent from the paper
run) and are kept for reference only.

The `2026-08-05T*` dirs predate the AMD launch-offset fix and reproduce a
~6 ms per-launch penalty on HIP; the AMD ones are not usable for comparison.

## Layout

```
<machine>/<ISO-timestamp>[-paper]/<run-type>-<arch>-<jobs>__<kind>_{results,summary}.{json,md}
```

- `compile-*__compile_*` — end-to-end compile timing (elapsed_samples) + phase
  breakdown (Frontend+IRGen / LLVM passes / Backend).
- `multiarch-*-multi-*__compile_*` — same compile, built for sm_80/86/89/90
  (CUDA) and gfx906/908/90a/942 (HIP). Only the native arch was executed.
- `runtime-*__runtime_*` — per-benchmark GPU runtimes (8 samples, PolyBench
  timer, CPU reference excluded) + binary sizes.
- `provenance.json` — machine identity (hostname, CPU, GPU, driver, OS).
