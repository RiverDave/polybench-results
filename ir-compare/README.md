# LLVM IR comparison workflow

This checks the two hypotheses raised in the discussion:

1. CIR and OG may not run identical target-specific `-O3` pipelines.
2. CIR may lower kernels differently before optimization, including not coercing
   pointer kernel arguments into the target global address space.

## 1. Capture on the GPU runner

Use the exact ClangIR binary and compile flags used by the audit harness. The
only intended difference between the two invocations is the flag in
`CIR_FLAGS`. `dump_ir.sh` saves an `-O0` IR dump (frontend/lowering output), an
`-O3` IR dump (after the LLVM middle end), `-Xclang -fdebug-pass-manager` logs, and
`-###` driver jobs for both pipelines.

```bash
CLANG=/path/to/clang++ \
POLYBENCH_ROOT=/root/polybenchGpu \
PLATFORM=hip ARCH=gfx942 \
CIR_FLAGS='-fclangir' \
EXTRA_FLAGS='COPY THE AUDIT HARNESS FLAGS HERE' \
bash dump_ir.sh ir-gfx942
```

For CUDA, use `PLATFORM=cuda ARCH=sm_90`. If the audit harness enables CIR with
a different driver spelling, replace `CIR_FLAGS`; do not guess. If its source
tree is not named `CUDA` or `HIP`, set `SOURCE_DIR`.

First compare `ir-gfx942/driver/og.txt` and `ir-gfx942/driver/cir.txt`. Apart
from the CIR enable flag and expected CIR frontend options, their device cc1
jobs must be equivalent. Otherwise, stop there: later IR comparisons would not
be controlled.

## 2. Analyze locally

Copy `ir-gfx942` back to this repository, then run:

```bash
python3 ir-compare/analyze_ir.py ir-gfx942 --output ir-gfx942/report.md
```

The report contains:

- total instruction counts and opcode deltas at `-O0` and `-O3`;
- all shared function signatures whose arguments differ, with pointer address
  spaces listed in declaration order (`0` means generic);
- named metadata and attribute groups present in just one pipeline;
- passes seen only in OG or CIR through `-fdebug-pass-manager`.

## How to interpret it

- **Signature differences already at `-O0`** identify frontend/CIR lowering
  differences. Look first for `ptr` versus `ptr addrspace(1)` in AMDGPU kernel
  arguments, then compare their parameter attributes (`noalias`, `readonly`,
  `nocapture`, alignment, and `byval`).
- **Equal `-O0` but unequal `-O3` IR** points to a middle-end pipeline or
  analysis/attribute inference difference. The pass-manager section directly
  tests whether AMDGPU/NVPTX target callbacks are missing.
- **Equal device IR but different runtime** points away from device codegen.
  The approximately fixed 6–7 ms HIP offset should then be investigated in the
  host launch path, timing scope, synchronization, or runtime API trace.
- **A constant binary-size delta** is often an ELF/code-object metadata or
  wrapper-section difference. Do not claim smaller generated code until the IR
  instruction mix and object sections agree on that conclusion.

## Offline minimal GEMM control

`gemm_minimal.cpp` is a header- and device-library-free kernel with the same
three-pointer GEMM access pattern as PolyBench/GPU. It can be compiled using
only a Clang build with AMDGPU and NVPTX enabled:

```bash
CLANG=/path/to/llvm-upstream/build/bin/clang++
$CLANG -x hip --offload-device-only --offload-arch=gfx942 -nogpuinc -nogpulib \
  -O3 -S -emit-llvm gemm_minimal.cpp -o hip.og.ll
$CLANG -x hip --offload-device-only --offload-arch=gfx942 -nogpuinc -nogpulib \
  -fclangir -O3 -S -emit-llvm gemm_minimal.cpp -o hip.cir.ll
```

This is useful for isolating frontend and backend differences, but it is not a
substitute for the full benchmark: real HIP builds additionally link OCKL/OCML
device libraries and use the exact runtime headers and launch path.

## ROCm runtime root-cause playbook

`rocm-playbook.md` is a self-contained handoff for an agent on a ROCm machine.
It uses `rocm_probe.hip` (launch-overhead timing probe), `rocm_probe.sh`
(build/run wrapper for OG and CIR), and `ablate_attr.py` (attribute injection
for the metadata-ablation experiment) to localize the constant ~6–7 ms HIP
runtime overhead and quantify the proportional long-kernel regressions.
