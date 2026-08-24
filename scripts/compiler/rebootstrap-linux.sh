#!/usr/bin/env bash
# THE EASY BOOTSTRAP, Linux x86-64 edition — rebuild and VERIFY the self-host Coil
# compiler on an ELF host. Mirrors rebootstrap.sh's shape with two differences:
#
#   * every stage uses the DEFAULT (LLVM) backend — the native arm64 backend emits
#     Mach-O and never runs here, so the fixpoint is the LLVM-backend one
#     (stage2.o == stage3.o, byte-identical; the LLVM emission is deterministic).
#   * it runs NO gates. It builds three stages and compares two objects. The test
#     batteries that used to hang off the end of it are not Linux-specific and
#     made this take 17 minutes; see the note at the fixpoint for what went.
#
# stage0 is chosen automatically:
#   1. $STAGE0 if you set it explicitly
#   2. bootstrap/seeds/native/coil-seed-linux-x86_64  (the committed ELF seed) — DEFAULT
#
# Requirements: cc/clang and libLLVM 21 (Ubuntu: apt.llvm.org llvm-21 packages).
# The libdir is discovered via llvm-config-21/llvm-config; override with
# COIL_LLVM_LIBDIR if yours lives elsewhere. If the committed seed's libLLVM
# doesn't match your system, rebuild a stage0 from the shipped IR instead — see
# bootstrap/seeds/native/linux-ir/NOTES.md.
#
# Usage: scripts/compiler/rebootstrap-linux.sh [install-dest]   (default dest: build/bin/coil)
# A successful verification also installs the artifact as the user-level `coil`
# selected by `scripts/dev.py install`. No install occurs until every gate passes.
set -uo pipefail
cd "$(dirname "$0")/../.."
# Stage compilers land in /tmp; give /tmp the toolchain library they resolve against.
. scripts/compiler/stage-lib.sh
SRC=src/compiler/main.coil
SEED=bootstrap/seeds/native/coil-seed-linux-x86_64
RUN_DIR=$(mktemp -d /tmp/coil-rebootstrap-linux.XXXXXX) || exit 1
trap 'stage_lib_cleanup; rm -rf "$RUN_DIR"' EXIT
S1="$RUN_DIR/coil-lrb1"; S2="$RUN_DIR/coil-lrb2"; S3="$RUN_DIR/coil-lrb3"

libdir="${COIL_LLVM_LIBDIR:-}"
if [ -z "$libdir" ]; then
  for lc in llvm-config-21 /usr/src/stdlib/llvm-21/bin/llvm-config llvm-config; do
    if command -v "$lc" >/dev/null 2>&1; then libdir="$("$lc" --libdir)"; break; fi
  done
fi
if [ -z "$libdir" ] || [ ! -e "$libdir/libLLVM.so" ]; then
  echo "no libLLVM.so found (install LLVM 21 from apt.llvm.org, or set COIL_LLVM_LIBDIR)"; exit 1
fi
LF=(--link-flag "-L$libdir" --link-flag "-Wl,-rpath,$libdir" --link-flag -lLLVM
    --link-flag -lstdc++ --link-flag -lm --link-flag -lpthread --link-flag -ldl)

. scripts/compiler/select-stage0.sh
select_stage0 "$SEED" "$SRC" x64 "${LF[@]}" || exit 1
echo "stage0 = $STAGE0 ($STAGE0_SOURCE; libLLVM: $libdir)"

# Probe before building: a stage0 too old for this tree otherwise fails deep in
# stage1 with an error that reads like a compiler bug. See stage0-check.sh.
. "$(dirname "$0")/stage0-check.sh"
stage0_check "$STAGE0" "$SEED" "$SRC" "${LF[@]}" || exit 1

echo "=== stage1: stage0 builds the self-host compiler ==="
COIL_STRICT_BUNDLE=0 "$STAGE0" build "$SRC" -o "$S1" ${STAGE0_BUILD_FLAGS[@]+"${STAGE0_BUILD_FLAGS[@]}"} "${LF[@]}" || { echo "stage1 FAILED"; exit 1; }
echo "=== stage2: stage1 rebuilds it ==="
"$S1" build "$SRC" -o "$S2" "${LF[@]}" || { echo "stage2 FAILED"; exit 1; }
echo "=== stage3: stage2 rebuilds it ==="
"$S2" build "$SRC" -o "$S3" "${LF[@]}" || { echo "stage3 FAILED"; exit 1; }

echo "=== FIXPOINT: independently emitted stage2 vs stage3 objects ==="
"$S1" emit-obj "$SRC" -o "$RUN_DIR/stage2.o" || { echo "stage2 object emission FAILED"; exit 1; }
"$S2" emit-obj "$SRC" -o "$RUN_DIR/stage3.o" || { echo "stage3 object emission FAILED"; exit 1; }
cmp "$RUN_DIR/stage2.o" "$RUN_DIR/stage3.o" || { echo "FIXPOINT FAIL — objects differ (nondeterminism)"; exit 2; }
echo "  ok — byte-identical, the compiler reproduces itself"

# This script proves ONE thing: the compiler reproduces itself on Linux x86-64.
# It used to run a whole test battery after the fixpoint -- scheme, cli, lint,
# prop, wasm-build, target-os and the per-stage snapshots -- which is why this job
# took 17 minutes while the macOS bootstrap took two. Those suites are not
# Linux-specific and the bootstrap is not the place to discover they are red.
#
# What was dropped, so it can be put back deliberately rather than rediscovered:
#   linux-ir + runtime gates, lint_fires, unused_lint, prop_nofork, prop_spawn,
#   wasm build, gate-cli, gate-target-os, dev.py test scheme, the read/ast/load/
#   resolved/checked/expand/mono/x86 stage snapshots, and oracle coverage.
# They are all still runnable by hand against the compiler this script installs;
# `scripts/oracle.py coverage` and the linux-ir references in particular now have
# nothing running them on a schedule.
#
# The staged-metacompilation branch proposed putting the whole battery back here,
# plus gate-run-meta and gate-staged-meta. The battery stays out -- 58b6e68 took
# it out on purpose and this job proves the fixpoint -- but the two metaprogram
# gates were a real gap, since nothing ran either of them anywhere. They are
# wired into the macOS `full` CI job and `dev.py test staged` instead, which is
# where the already-built compiler is.

stage_lib_cleanup

DEST="${1:-build/bin/coil}"
mkdir -p "$(dirname "$DEST")"
cp "$S2" "$DEST"
echo "=== VERIFIED self-host compiler installed -> $DEST ==="
python3 scripts/dev.py install --source "$DEST" \
  || { echo "global install FAILED"; exit 1; }
echo "=== VERIFIED self-host compiler installed globally ==="
