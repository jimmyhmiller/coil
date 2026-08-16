#!/usr/bin/env bash
# THE EASY BOOTSTRAP — reproduce the self-host Coil compiler with NO Rust toolchain.
#
# stage0 is chosen automatically (NO Rust in the default path — the self-host
# compiler reproduces itself):
#   1. $STAGE0 if you set it explicitly
#   2. bootstrap/seeds/native/coil-seed  (the committed, prebuilt self-host compiler) — DEFAULT
#   (the Rust reference compiler has been removed; the seed is fully self-sufficient)
# You never need cargo/rustc/inkwell; the seed re-derives the whole compiler from source.
#
# The seed is not trusted blindly: stage1 rebuilds from source, stage1 builds stage2,
# and stage2 builds stage3. Byte-identical stage2/stage3 objects establish the fixed
# point. Behavioral, backend, CLI, lint, Scheme, snapshot, and Wasm tests are separate
# test commands; they do not belong in the bootstrap dependency chain.
#
# Requirements: libLLVM.dylib (brew install llvm) + a C compiler (cc). That's it.
# (The compiler embeds an LLVM backend, so its binary links libLLVM even when the arm64
#  backend does the codegen. Only the Rust *build* toolchain is eliminated, not libLLVM.)
#
# Usage: scripts/compiler/rebootstrap.sh [install-dest]      (default dest: build/bin/coil)
#        STAGE0=/path/to/coil scripts/compiler/rebootstrap.sh
# A successful fixed-point build installs both install-dest and the user-level `coil`
# selected by `scripts/dev.py install`.
set -uo pipefail
cd "$(dirname "$0")/../.."
SRC=src/compiler/main.coil
SEED=bootstrap/seeds/native/coil-seed
# Scope the namespace scan: a seed that predates the loader's hidden-directory
# prune would otherwise index stray tree copies (e.g. .claude/worktrees/*) and
# report every namespace as declared twice. Roots must be relative to the repo
# root; absent roots are fine (find's nonzero exit is already tolerated).
export COIL_NAMESPACE_ROOTS="${COIL_NAMESPACE_ROOTS:-src:tests:scripts}"
# In-repo, an import of a `coil.*` namespace that is missing from the bundled
# stdlib manifest still resolves via the namespace scan above, so the build stays
# green while the shipped compiler cannot serve it (this is how coil.socket,
# coil.sync, coil.region, coil.signals and coil.cancellation went unreachable).
# Strict mode makes that fallback a hard error during the bootstrap.
export COIL_STRICT_BUNDLE="${COIL_STRICT_BUNDLE:-1}"
# Stage compilers land in /tmp; give /tmp the toolchain library they resolve against.
. scripts/compiler/stage-lib.sh

# Each invocation owns its stage artifacts, so overlapping bootstraps cannot
# replace a compiler while another invocation is executing it.
RUN_DIR=$(mktemp -d /tmp/coil-rebootstrap.XXXXXX) \
  || { echo "cannot create bootstrap stage directory"; exit 1; }
RB1="$RUN_DIR/coil-rb1"
RL2="$RUN_DIR/coil-rl2"
RL3="$RUN_DIR/coil-rl3"
cleanup_run_dir() {
  rm -rf "$RUN_DIR"
}
trap cleanup_run_dir EXIT
# ---- THE THREE BUILDS --------------------------------------------------------
#
#   flavour        script                            LLVM            links
#   -------------  --------------------------------  --------------  -------------------------
#   dynamic-LLVM   rebootstrap.sh                    libLLVM.dylib   + Homebrew libLLVM  ~3.5MB
#   static-LLVM    COIL_LLVM_LINK=static  ditto      linked in       macOS /usr/lib only  ~92MB
#   no-LLVM        rebootstrap-nollvm.sh             none            libSystem only       ~3.2MB
#
# DYNAMIC is the default: it is what the committed seed expects and it is what you
# want while developing. The compiler it produces will NOT run without Homebrew's
# libLLVM.dylib.
#
# STATIC is for shipping a compiler to someone else. rustc and zig both take this
# route — a rustup toolchain has no system libLLVM anywhere, it is statically
# linked into a ~200MB librustc_driver — and the trade is the same one they make:
# ~26x the binary for a compiler that runs on a bare machine.
#
# NO-LLVM is the most self-contained of the three (only libSystem, needs only `cc`)
# and is verified as such by its own gate. Its arm64 backend still has gaps the
# LLVM backend does not — notably `export-c` with a by-value struct parameter — so
# it cannot yet build every program the other two can.
#
# The link line lives in ONE place, scripts/compiler/llvm-link-flags.sh.
LF=($(./scripts/compiler/llvm-link-flags.sh "${COIL_LLVM_LINK:-dynamic}")) \
  || { echo "cannot compute LLVM link flags"; exit 1; }

. scripts/compiler/select-stage0.sh
select_stage0 "$SEED" "$SRC" arm64 "${LF[@]}" || exit 1
echo "stage0 = $STAGE0 ($STAGE0_SOURCE)"

# Probe before building: a stage0 too old for this tree otherwise fails deep in
# stage1 with an error that reads like a compiler bug. See stage0-check.sh.
. "$(dirname "$0")/stage0-check.sh"
stage0_check "$STAGE0" "$SEED" "$SRC" "${LF[@]}" || exit 1

echo "=== stage1: stage0 builds the self-host compiler (default LLVM backend) ==="
COIL_STRICT_BUNDLE=0 "$STAGE0" build "$SRC" -o "$RB1" "${STAGE0_BUILD_FLAGS[@]}" "${LF[@]}" || { echo "stage1 FAILED"; exit 1; }

echo "=== stage2: stage1 rebuilds the compiler ==="
"$RB1" build "$SRC" -o "$RL2" "${LF[@]}" || { echo "stage2 FAILED"; exit 1; }

echo "=== stage3: stage2 rebuilds the compiler ==="
"$RL2" build "$SRC" -o "$RL3" "${LF[@]}" || { echo "stage3 FAILED"; exit 1; }

cmp "$RL2.o" "$RL3.o" \
  || { echo "LLVM FIXPOINT FAIL — LLVM-backend objects differ"; exit 2; }
echo "  LLVM fixed point: PASS"

stage_lib_cleanup

DEST="${1:-build/bin/coil}"
# Install the stage-3 compiler that reproduced stage 2 byte-for-byte.
mkdir -p "$(dirname "$DEST")"
cp "$RL3" "$DEST"
# Re-sign after copy: macOS invalidates a Mach-O's ad-hoc signature on cp, and the
# kernel SIGKILLs a mis-signed binary. Re-sign so the installed compiler runs.
codesign -s - --force "$DEST" >/dev/null 2>&1 || true
echo "=== VERIFIED self-host compiler installed -> $DEST ==="
python3 scripts/dev.py install --source "$DEST" \
  || { echo "global install FAILED"; exit 1; }
echo "=== VERIFIED self-host compiler installed globally ==="
