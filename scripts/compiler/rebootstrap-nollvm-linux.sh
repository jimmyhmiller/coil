#!/usr/bin/env bash
# THE LLVM-FREE BOOTSTRAP, LINUX x86-64 — rebuild + verify the self-host Coil
# compiler with NO LLVM and NO Rust toolchain. The Linux sibling of
# rebootstrap-nollvm.sh (which does the same on macOS/arm64).
#
# The produced compiler (from src/compiler/main_x64.coil) omits the LLVM backend
# entirely: it links only libc/libm and needs only `cc` to link native objects.
# Nothing here touches libLLVM at build or run time.
#
# stage0 is chosen automatically:
#   1. $STAGE0 if set
#   2. bootstrap/seeds/native/coil-seed-nollvm-linux-x86_64  (the committed LLVM-free seed)
#   3. build/bin/coil                                       (the repository launcher)
#
# The result is re-verified from source on every run, three independent ways, so a
# stale/tampered seed cannot slip through:
#   * NO-LLVM : ldd proves stage2 links no libLLVM
#   * FIXPOINT: stage2.o == stage3.o byte-identical (the x64 backend is deterministic)
#   * GATE    : x64 gate-run — every corpus program runs identically to the
#               LLVM-reference. (gate-full/emit-ir is N/A: this build has no LLVM IR.)
#
# Requirements: a C compiler (cc). That's the whole toolchain.
#
# Usage: scripts/compiler/rebootstrap-nollvm-linux.sh [install-dest]  (default: build/bin/coil-nollvm)
#        STAGE0=/path/to/coil scripts/compiler/rebootstrap-nollvm-linux.sh
set -uo pipefail
cd "$(dirname "$0")/../.."
# Stage compilers land in /tmp; give /tmp the toolchain library they resolve against.
. scripts/compiler/stage-lib.sh
SRC=src/compiler/main_x64.coil
SEED=bootstrap/seeds/native/coil-seed-nollvm-linux-x86_64
RUN_DIR=$(mktemp -d /tmp/coil-rebootstrap-nollvm-linux.XXXXXX) || exit 1
trap 'stage_lib_cleanup; rm -rf "$RUN_DIR"' EXIT
S1="$RUN_DIR/coil-nlx1"; S2="$RUN_DIR/coil-nlx2"; S3="$RUN_DIR/coil-nlx3"

. scripts/compiler/select-stage0.sh
select_stage0 "$SEED" "$SRC" x64 || exit 1
echo "stage0 = $STAGE0 ($STAGE0_SOURCE)"

# stage1 may come from the LLVM-backed compiler, whose own `build` defaults to the
# LLVM backend and therefore needs the libLLVM link line. Once stage1 exists it is
# LLVM-free and every later stage links nothing extra.
S1FLAGS=()
if ldd "$STAGE0" 2>/dev/null | grep -qi llvm; then
  libdir="${COIL_LLVM_LIBDIR:-}"
  if [ -z "$libdir" ]; then
    for d in /usr/src/stdlib/llvm-21/lib /usr/src/stdlib/x86_64-linux-gnu; do
      { [ -e "$d/libLLVM.so" ] || [ -e "$d/libLLVM-21.so" ]; } && { libdir="$d"; break; }
    done
  fi
  [ -n "$libdir" ] || {
    echo "stage0 needs libLLVM but none found (set COIL_LLVM_LIBDIR)"
    echo "note: the compiler this script BUILDS is LLVM-free, but the stage0 that"
    echo "      builds it is not — an LLVM-linked coil has to compile main_x64.coil"
    echo "      first. So this is a dependency of stage0, not of the result."
    echo "      e.g. STAGE0=build/bin/coil COIL_LLVM_LIBDIR=/usr/lib/llvm-21/lib $0"
    exit 1; }
  S1FLAGS=(--link-flag "-L$libdir" --link-flag "-Wl,-rpath,$libdir" --link-flag -lLLVM
           --link-flag -lstdc++ --link-flag -lm --link-flag -lpthread --link-flag -ldl)
fi

# Probe before building: a stage0 too old for this tree otherwise fails deep in
# stage1 with an error that reads like a compiler bug. See stage0-check.sh.
. "$(dirname "$0")/stage0-check.sh"
stage0_check "$STAGE0" "$SEED" "$SRC" "${S1FLAGS[@]}" || exit 1

echo "=== stage1: stage0 builds the LLVM-free compiler ==="
stage0_compat_run "$STAGE0" build "$PWD/$SRC" -o "$S1" ${STAGE0_BUILD_FLAGS[@]+"${STAGE0_BUILD_FLAGS[@]}"} "${S1FLAGS[@]}" || { echo "stage1 FAILED"; exit 1; }
echo "=== stage2: stage1 rebuilds it with the x64 backend ==="
"$S1" build "$SRC" -o "$S2" || { echo "stage2 FAILED"; exit 1; }
echo "=== stage3: stage2 rebuilds it with the x64 backend ==="
"$S2" build "$SRC" -o "$S3" || { echo "stage3 FAILED"; exit 1; }

echo "=== NO-LLVM: stage2 must link no libLLVM ==="
DEPS=$(ldd "$S2")
case "$DEPS" in
  *LLVM*|*llvm*) echo "  FAIL — libLLVM is linked:"; echo "$DEPS"; exit 3 ;;
esac
echo "  ok — links only:$(ldd "$S2" | awk '{printf " %s", $1}')"

echo "=== FIXPOINT: independently emitted stage2 vs stage3 objects ==="
"$S1" emit-obj "$SRC" -o "$RUN_DIR/stage2.o" --backend x64 || { echo "stage2 object emission FAILED"; exit 1; }
"$S2" emit-obj "$SRC" -o "$RUN_DIR/stage3.o" --backend x64 || { echo "stage3 object emission FAILED"; exit 1; }
cmp "$RUN_DIR/stage2.o" "$RUN_DIR/stage3.o" || { echo "FIXPOINT FAIL — x64 objects differ"; exit 2; }
echo "  ok — byte-identical, the compiler reproduces itself"

echo "=== GATE: x64 behavioral gate-run ==="
python3 scripts/oracle.py runtime gate x64 --compiler "$S2" >/dev/null 2>&1 \
  || { echo "x64 gate-run FAIL (run it directly to see which programs)"; exit 1; }
echo "  x64 gate-run: PASS (programs run identically to the LLVM reference)"

stage_lib_cleanup

DEST="${1:-build/bin/coil-nollvm}"
mkdir -p "$(dirname "$DEST")"
cp "$S2" "$DEST"
echo "=== VERIFIED LLVM-free compiler installed -> $DEST ==="
