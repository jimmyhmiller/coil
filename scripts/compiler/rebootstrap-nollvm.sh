#!/usr/bin/env bash
# THE LLVM-FREE BOOTSTRAP — rebuild + verify the self-host Coil compiler with NO
# LLVM and NO Rust toolchain. The produced compiler (from src/compiler/main_a64.coil)
# omits the LLVM backend entirely: it links only libSystem and needs only `cc` to
# link native objects. Nothing here touches libLLVM at build or run time.
#
# stage0 is chosen automatically:
#   1. $STAGE0 if set
#   2. bootstrap/seeds/native/coil-seed-nollvm   (the committed LLVM-free self-host compiler)
#   (the Rust reference compiler has been removed; the seed is fully self-sufficient)
# On a fresh checkout only #2 exists — the point: no cargo/rustc/inkwell AND no libLLVM.
#
# The seed is re-verified from source on every run, three independent ways, so a
# stale/tampered seed cannot slip through:
#   * NO-LLVM : otool proves stage2 links no libLLVM
#   * FIXPOINT: stage2.o == stage3.o byte-identical (arm64 backend is deterministic)
#   * GATE    : arm64 gate-run — every corpus program runs identically to the
#               LLVM-reference. (gate-full/emit-ir is N/A: this build has no LLVM IR.)
#
# Requirements: a C compiler (cc). That's the whole toolchain.
#
# Usage: scripts/compiler/rebootstrap-nollvm.sh [install-dest]     (default dest: build/bin/coil-nollvm)
#        STAGE0=/path/to/coil scripts/compiler/rebootstrap-nollvm.sh
set -uo pipefail
cd "$(dirname "$0")/../.."
# Stage compilers land in /tmp; give /tmp the toolchain library they resolve against.
. scripts/compiler/stage-lib.sh
SRC=src/compiler/main_a64.coil
SEED=bootstrap/seeds/native/coil-seed-nollvm
RUN_DIR=$(mktemp -d /tmp/coil-rebootstrap-nollvm.XXXXXX) || exit 1
trap 'stage_lib_cleanup; rm -rf "$RUN_DIR"' EXIT
S1="$RUN_DIR/coil-nl1"; S2="$RUN_DIR/coil-nl2"; S3="$RUN_DIR/coil-nl3"
# Scope the namespace scan: a seed that predates the loader's hidden-directory
# prune would otherwise index stray tree copies (e.g. .claude/worktrees/*) and
# report every namespace as declared twice.
export COIL_NAMESPACE_ROOTS="${COIL_NAMESPACE_ROOTS:-src:tests:scripts}"
# In-repo, an import of a `coil.*` namespace that is missing from the bundled
# stdlib manifest still resolves via the namespace scan above, so the build stays
# green while the shipped compiler cannot serve it (this is how coil.socket,
# coil.sync, coil.region, coil.signals and coil.cancellation went unreachable).
# Strict mode makes that fallback a hard error for the whole build and its gates.
export COIL_STRICT_BUNDLE="${COIL_STRICT_BUNDLE:-1}"

. scripts/compiler/select-stage0.sh
select_stage0 "$SEED" "$SRC" arm64 || exit 1
echo "stage0 = $STAGE0 ($STAGE0_SOURCE)"

# Probe before building: a stage0 too old for this tree otherwise fails deep in
# stage1 with an error that reads like a compiler bug. See stage0-check.sh.
. "$(dirname "$0")/stage0-check.sh"
stage0_check "$STAGE0" "$SEED" "$SRC" || exit 1

echo "=== stage1: stage0 builds the LLVM-free compiler ==="
COIL_STRICT_BUNDLE=0 "$STAGE0" build "$SRC" -o "$S1" ${STAGE0_BUILD_FLAGS[@]+"${STAGE0_BUILD_FLAGS[@]}"} || { echo "stage1 FAILED"; exit 1; }
echo "=== stage2: stage1 rebuilds it with --backend arm64 ==="
"$S1" build "$SRC" -o "$S2" --backend arm64 || { echo "stage2 FAILED"; exit 1; }
echo "=== stage3: stage2 rebuilds it with --backend arm64 ==="
"$S2" build "$SRC" -o "$S3" --backend arm64 || { echo "stage3 FAILED"; exit 1; }

echo "=== NO-LLVM: stage2 must link no libLLVM ==="
if otool -L "$S2" | grep -qi LLVM; then
  echo "  FAIL — libLLVM is linked:"; otool -L "$S2" | grep -i LLVM; exit 3
fi
echo "  ok — links only:$(otool -L "$S2" | tail -n +2 | awk '{printf " %s", $1}')"

echo "=== FIXPOINT: independently emitted stage2 vs stage3 objects ==="
"$S1" emit-obj "$SRC" -o "$RUN_DIR/stage2.o" --backend arm64 || { echo "stage2 object emission FAILED"; exit 1; }
"$S2" emit-obj "$SRC" -o "$RUN_DIR/stage3.o" --backend arm64 || { echo "stage3 object emission FAILED"; exit 1; }
cmp "$RUN_DIR/stage2.o" "$RUN_DIR/stage3.o" || { echo "FIXPOINT FAIL — arm64 objects differ"; exit 2; }
echo "  ok — byte-identical, the compiler reproduces itself"

echo "=== GATE: arm64 behavioral gate-run ==="
python3 scripts/oracle.py runtime gate arm64 --compiler "$S2" --verbose \
  || { echo "arm64 runtime gate FAIL"; exit 1; }
echo "  arm64 gate-run: PASS (programs run identically to the LLVM reference)"

stage_lib_cleanup

DEST="${1:-build/bin/coil-nollvm}"
mkdir -p "$(dirname "$DEST")"
cp "$S2" "$DEST"
echo "=== VERIFIED LLVM-free compiler installed -> $DEST ==="
