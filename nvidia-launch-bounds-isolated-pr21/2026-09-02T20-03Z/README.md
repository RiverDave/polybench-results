# Isolated PR21 launch-bounds experiment

## Question

Does PR21's inferred `cir.nvvm.maxntid` improve runtime when static CUDA
kernels have compile-time-known block sizes?

## Controlled comparison

Both arms use LLVM PR25 commit
`bb385fee62f23fdb0acb719a88fe8186167f42a5` and the complete CIR offload
merge pipeline. The only compiler-option difference is:

- **LB-off:** `--clangir-offload-merge -fno-cir-infer-launch-bounds`
- **LB-on:** `--clangir-offload-merge -fcir-infer-launch-bounds`

Source: static-kernel PolyBench branch commit
`f5613c400c78734d1e8924b1c8e79f10d3a262b1`.

Hardware: NVIDIA A10, `sm_86`, driver 570.148.08, CUDA 12.8.

Method:

- 21 CUDA benchmarks.
- Five warmups per arm.
- Twenty paired measurements per benchmark.
- LB-on/LB-off order alternated for each pair.
- GPU execution was serialized (`runtime_jobs=1`).
- Timing binaries excluded CPU reference work.
- Separate validation binaries retained CPU reference checks.
- `ptxas -v`, `cuobjdump --dump-resource-usage`, complete SASS dumps, linked
  binaries, compile logs, and every timing sample are retained.
- Per-benchmark confidence intervals bootstrap paired on/off ratios.
- The suite confidence interval bootstraps benchmark-level ratios.

## Result

- **Suite LB-on/LB-off geomean:** `0.9998030697`
- **95% benchmark-bootstrap CI:** `[0.9994371324, 1.0001671530]`
- Apparent change: approximately **0.020% faster**, with the CI crossing parity.
- **Conclusion: no measurable or practical speedup.**

All 42 timing binaries compiled. All 42 validation binaries passed with zero
mismatches.

## Code-generation evidence

Across all 21 benchmarks:

- **21/21 SASS dumps were byte-identical** between LB-off and LB-on.
- **21/21 resource reports were byte-identical**: no register, stack, shared,
  local-memory, spill, or barrier change.
- Linked binary sizes were identical.
- 13/21 linked-binary hashes differed because launch-bound metadata changed.
- 8/21 linked binaries were completely byte-identical, indicating no inferred
  bound affected the output for those programs.

For static 2MM specifically:

- Manual CIR merge adds `cir.nvvm.maxntid = "256"` only in LB-on.
- Each LB-on per-kernel `.nv.info` section grows by 16 bytes (`0xc4` to
  `0xd4`).
- Kernel text sizes remain identical: kernel2 `0x1100`, kernel1 `0x1300`.
- Both kernels use 24 registers in both arms, with no stack/shared/local use.
- Entire SASS output is byte-identical.
- The extracted cubins have equal total size because section alignment absorbs
  the metadata growth.

## Interpretation

PR21 works: it infers the total block-size contract and carries it into NVIDIA
binary metadata. For these 21 PolyBench kernels on A10, however, `ptxas`
generates exactly the same instructions and resource allocation with and
without that contract. The tiny timing differences are measurement noise, not
an optimization effect.

This does not prove inferred launch bounds can never help. It shows that the
ordinary PolyBench kernels are not near a register/occupancy threshold where
`maxntid=256` changes backend allocation. A separate synthetic stress test
would be needed to find such a threshold deliberately; it should not be mixed
into the real-workload PolyBench conclusion.

## Contents

- `launch_bounds_results.json`: full provenance, raw paired samples,
  validation status, binary hashes, and resource output.
- `launch_bounds_summary.md`: generated per-benchmark timing table.
- `launch_bounds_isolated.py`: exact experiment harness.
- `build/`: timing binaries.
- `validation/`: validation binaries and logs.
- `compile-logs/`: exact compiler commands and `ptxas -v` output.
- `resources/`: `cuobjdump --dump-resource-usage` output.
- `sass/`: complete `cuobjdump --dump-sass` output.
- `proof/`: ON/OFF CIR proof and extracted 2MM cubins/section evidence.
