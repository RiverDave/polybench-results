#!/usr/bin/env bash
# Dump comparable device LLVM IR for the OG and CIR pipelines.
#
# Run this on the CUDA or HIP machine with the same Clang, include paths, and
# benchmark flags as the timing harness. The resulting directory can be copied
# back to this repository and analyzed with analyze_ir.py.
#
# Example (HIP):
#   CLANG=/path/to/clang++ POLYBENCH_ROOT=/root/polybenchGpu \
#   PLATFORM=hip ARCH=gfx942 CIR_FLAGS='-fclangir' \
#   EXTRA_FLAGS='...' ./dump_ir.sh ir-gfx942
#
# CIR_FLAGS must match the flag used by the audit harness. If the harness uses
# a different spelling (for example, an -Xclang flag), set it accordingly.

set -uo pipefail

: "${CLANG:?Set CLANG to the ClangIR clang++ binary}"
: "${POLYBENCH_ROOT:?Set POLYBENCH_ROOT to the PolyBench/GPU checkout}"
: "${PLATFORM:?Set PLATFORM to cuda or hip}"
: "${ARCH:?Set ARCH, for example sm_90 or gfx942}"

OUT_DIR=${1:?Usage: dump_ir.sh OUTPUT_DIRECTORY}
CIR_FLAGS=${CIR_FLAGS:--fclangir}
EXTRA_FLAGS=${EXTRA_FLAGS:-}
DEVICE_ONLY_FLAG=${DEVICE_ONLY_FLAG:---offload-device-only}
PASS_DEBUG_FLAGS=${PASS_DEBUG_FLAGS:--Xclang -fdebug-pass-manager}

case "$PLATFORM" in
  cuda)
    SOURCE_DIR=${SOURCE_DIR:-CUDA}
    LANGUAGE_FLAGS=(-x cuda)
    ARCH_FLAGS=(--cuda-gpu-arch="$ARCH")
    ;;
  hip)
    SOURCE_DIR=${SOURCE_DIR:-HIP}
    LANGUAGE_FLAGS=(-x hip)
    ARCH_FLAGS=(--offload-arch="$ARCH")
    ;;
  *)
    printf 'Unsupported PLATFORM=%s; expected cuda or hip.\n' "$PLATFORM" >&2
    exit 2
    ;;
esac

if [[ ! -d "$POLYBENCH_ROOT/$SOURCE_DIR" ]]; then
  printf 'Source directory does not exist: %s\n' "$POLYBENCH_ROOT/$SOURCE_DIR" >&2
  exit 2
fi

mkdir -p "$OUT_DIR/device" "$OUT_DIR/logs" "$OUT_DIR/driver"
read -r -a cir_flags <<< "$CIR_FLAGS"
read -r -a extra_flags <<< "$EXTRA_FLAGS"
read -r -a pass_debug_flags <<< "$PASS_DEBUG_FLAGS"

mapfile -t sources < <(
  find "$POLYBENCH_ROOT/$SOURCE_DIR" -type f \( -name '*.cu' -o -name '*.hip' -o -name '*.cpp' \) | sort
)

if [[ ${#sources[@]} -eq 0 ]]; then
  printf 'No CUDA/HIP sources found below %s. Adjust SOURCE_DIR if needed.\n' \
    "$POLYBENCH_ROOT/$SOURCE_DIR" >&2
  exit 2
fi

compile_one() {
  local source=$1 pipeline=$2 opt_level=$3 name=$4
  local -a pipeline_flags=()
  if [[ $pipeline == cir ]]; then
    pipeline_flags=("${cir_flags[@]}")
  fi

  local ir="$OUT_DIR/device/$name.$pipeline.$opt_level.ll"
  local log="$OUT_DIR/logs/$name.$pipeline.$opt_level.log"
  local -a command=(
    "$CLANG" "${LANGUAGE_FLAGS[@]}" "${ARCH_FLAGS[@]}" "$DEVICE_ONLY_FLAG"
    "-I$POLYBENCH_ROOT" "${extra_flags[@]}" "${pipeline_flags[@]}"
    "-$opt_level" -S -emit-llvm "$source" -o "$ir"
  )

  if [[ $opt_level == O3 ]]; then
    command+=("${pass_debug_flags[@]}")
  fi

  printf '%s %s %s\n' "$name" "$pipeline" "$opt_level"
  if ! "${command[@]}" >"$log.stdout" 2>"$log"; then
    printf 'FAILED: %s %s %s; see %s\n' "$name" "$pipeline" "$opt_level" "$log" >&2
    return 1
  fi
}

# Capture the exact driver jobs first. This is the direct check requested by
# Dinos: the IR comparison is only meaningful if these jobs match except for
# the CIR enabling flag.
first_source=${sources[0]}
for pipeline in og cir; do
  pipeline_flags=()
  [[ $pipeline == cir ]] && pipeline_flags=("${cir_flags[@]}")
  "$CLANG" "${LANGUAGE_FLAGS[@]}" "${ARCH_FLAGS[@]}" "$DEVICE_ONLY_FLAG" \
    "-I$POLYBENCH_ROOT" "${extra_flags[@]}" "${pipeline_flags[@]}" -O3 -S -emit-llvm \
    -### "$first_source" >"$OUT_DIR/driver/$pipeline.txt" 2>&1 || true
done

printf 'CLANG=%s\nPLATFORM=%s\nARCH=%s\nCIR_FLAGS=%s\nEXTRA_FLAGS=%s\n' \
  "$CLANG" "$PLATFORM" "$ARCH" "$CIR_FLAGS" "$EXTRA_FLAGS" >"$OUT_DIR/manifest.txt"

failures=0
for source in "${sources[@]}"; do
  relative=${source#"$POLYBENCH_ROOT/$SOURCE_DIR/"}
  name=${relative%.*}
  name=${name//\//_}
  for pipeline in og cir; do
    for opt_level in O0 O3; do
      compile_one "$source" "$pipeline" "$opt_level" "$name" || failures=$((failures + 1))
    done
  done
done

printf 'Finished with %d failed compile(s).\n' "$failures"
exit "$failures"
