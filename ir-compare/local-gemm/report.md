# Offline GEMM IR control experiment

This is a controlled CIR-versus-OG comparison using `../gemm_minimal.cpp`, a
header- and device-library-free kernel with the PolyBench GEMM access pattern.
It was built locally with:

```text
/Users/davidfeliperiveraguerra/dev/llvm-upstream/build/bin/clang++
--offload-arch=gfx942 -nogpuinc -nogpulib -O3 -S -emit-llvm
```

The HIP source declares the three OCKL index helpers but does not link ROCm
device libraries. Thus this isolates frontend IR and LLVM backend behavior; it
does not reproduce the benchmark's full HIP runtime/link environment.

## Findings

1. **AMDGPU kernel pointer ABI differs at O0 and remains different at O3.**
   OG declares all three buffer parameters as `ptr addrspace(1)`. CIR declares
   them as generic `ptr`. At O3, `InferAddressSpacesPass` inserts three entry
   `addrspacecast`s in CIR; it does not repair the function ABI or code-object
   metadata.

2. **CIR drops contraction metadata.** OG emits `fmul contract` / `fadd
   contract`; CIR emits plain `fmul` / `fadd`. The AMDGPU assembly consequently
   has fused `v_fmac_f32` operations for OG and separate `v_mul_f32` plus
   `v_add_f32` operations for CIR. The CUDA PTX has the same pattern: OG emits
   `fma.rn.f32`; CIR emits separate `mul.rn.f32` and `add.rn.f32` instructions.

3. **CIR drops memory/provenance information.** CIR's final IR has no `!tbaa`
   on GEMM loads/stores and omits `inbounds` from the relevant GEPs. OG has both.
   These are independent of the pointer address-space issue and can weaken
   middle-end alias, range, and backend optimization.

4. **CIR's OCKL declarations are weaker in this unlinked control.** OG declares
   OCKL helpers `hidden` and `nounwind`; CIR does not. The generated AMDGPU
   assembly therefore resolves CIR helper calls through GOT loads while OG uses
   direct relocations. This must be rechecked in a full build with linked device
   libraries, but it is another concrete IR-level difference.

5. **The target optimization pipeline is not missing.** Parsing
   `-Xclang -fdebug-pass-manager` logs finds identical pass-name sets and counts
   (374 HIP and 315 CUDA invocations in each pipeline). In particular,
   `AMDGPUUseNativeCallsPass`, `AMDGPUSimplifyLibCallsPass`,
   `AMDGPUUniformIntrinsicCombinePass`, `AMDGPUPromoteKernelArgumentsPass`, and
   `AMDGPULowerKernelAttributesPass` all run for CIR and OG.

## AMDGPU backend result

| Metric | OG | CIR | Delta |
|---|---:|---:|---:|
| Kernel `codeLenInByte` | 1,116 B | 1,188 B | +72 B (+6.5%) |
| `.text` section | 2,176 B | 2,240 B | +64 B (+2.9%) |
| SGPR count | 78 | 78 | 0 |
| VGPR count | 46 | 46 | 0 |
| Relocatable object | 6,016 B | 5,544 B | -472 B (-7.8%) |

The smaller CIR object is **not** smaller generated code: its executable text
is larger. The total object shrinks because CIR's AMDGPU metadata note is 120 B
smaller and it omits OG's `.comment`, `.eh_frame`, and relocation sections.

The AMDGPU metadata exposes the ABI discrepancy directly: OG labels `a`, `b`,
and `c` as `address_space: global`; CIR labels the same `global_buffer`
arguments as `address_space: generic`. OG also records
`uniform_work_group_size: 1`; CIR omits it.

## Next validation

Repeat this exact comparison on the full GFX942 PolyBench GEMM IR captured by
`dump_ir.sh`, with the audit harness's exact flags and ROCm device-library
linkage. The current evidence makes the first checks unambiguous: pointer AS,
`contract`, `!tbaa`, `inbounds`, OCKL declaration visibility, AMDGPU metadata,
and final assembly `v_fmac_f32` versus `v_mul_f32` + `v_add_f32`.
