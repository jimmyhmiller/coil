#!/usr/bin/env bash
# THE EASY BOOTSTRAP — rebuild and VERIFY the self-host Coil compiler with NO Rust toolchain.
#
# stage0 is chosen automatically (NO Rust in the default path — the self-host
# compiler bootstraps and verifies itself):
#   1. $STAGE0 if you set it explicitly
#   2. bootstrap/seeds/native/coil-seed  (the committed, prebuilt self-host compiler) — DEFAULT
#   (the Rust reference compiler has been removed; the seed is fully self-sufficient)
# You never need cargo/rustc/inkwell; the seed re-derives the whole compiler from source.
#
# The seed is NEVER trusted blindly. Every run re-derives the compiler from source and proves
# the result faithful two independent ways, so a stale or tampered seed cannot slip through:
#   * FIXPOINT : stage2.o == stage3.o byte-identical  (the arm64 backend is fully deterministic)
#   * GATES    : curated stage snapshots + behavioral runtime/CLI corpora
#                arm64 gate-run  (built programs produce identical stdout+exit)
#                gate-meta-engines (compiled-meta == interp-meta: corpus + byte-identical self-build)
#                gate-wasm  (interp-meta running in a single static wasm module; skips w/o node)
#
# Requirements: libLLVM.dylib (brew install llvm) + a C compiler (cc). That's it.
# (The compiler embeds an LLVM backend, so its binary links libLLVM even when the arm64
#  backend does the codegen. Only the Rust *build* toolchain is eliminated, not libLLVM.)
#
# Usage: scripts/compiler/rebootstrap.sh [install-dest]      (default dest: build/bin/coil)
#        STAGE0=/path/to/coil scripts/compiler/rebootstrap.sh
# A successful verification installs both install-dest and the user-level `coil`
# selected by `scripts/dev.py install`. No install occurs until every gate passes.
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
# Strict mode makes that fallback a hard error for the whole build and its gates.
export COIL_STRICT_BUNDLE="${COIL_STRICT_BUNDLE:-1}"
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

if   [ -n "${STAGE0:-}" ];        then :
elif [ -x "$SEED" ];              then STAGE0="$SEED"
else echo "no stage0: need a committed $SEED (or set STAGE0=/path/to/coil)"; exit 1
fi
echo "stage0 = $STAGE0"

# The wasm gate asks its compiler to build the current main_wasm.coil and then
# validates/runs that result; it does not depend on a host self-build stage. It is
# the longest gate, so overlap it with stage1 and the rest of the build DAG.
( python3 scripts/dev.py test wasm --compiler "$STAGE0" \
    >/tmp/coil-bootstrap-wasm.log 2>&1 ) &
WASM_PID=$!
cleanup_background_gate() {
  if [ -n "${WASM_PID:-}" ]; then kill "$WASM_PID" 2>/dev/null || true; fi
}
trap cleanup_background_gate EXIT

JOB_NAMES=()
JOB_PIDS=()
launch() {
  local name=$1; shift
  local log="/tmp/coil-bootstrap-${name}.log"
  ( "$@" >"$log" 2>&1 ) &
  JOB_NAMES+=("$name")
  JOB_PIDS+=("$!")
}
wait_jobs() {
  local failed=0 i
  for ((i=0; i<${#JOB_PIDS[@]}; i++)); do
    if wait "${JOB_PIDS[$i]}"; then
      echo "  ${JOB_NAMES[$i]}: PASS"
    else
      echo "  ${JOB_NAMES[$i]}: FAIL"
      sed -n '1,160p' "/tmp/coil-bootstrap-${JOB_NAMES[$i]}.log"
      failed=1
    fi
  done
  JOB_NAMES=()
  JOB_PIDS=()
  [ "$failed" = 0 ]
}

# Probe before building: a stage0 too old for this tree otherwise fails deep in
# stage1 with an error that reads like a compiler bug. See stage0-check.sh.
. "$(dirname "$0")/stage0-check.sh"
stage0_check "$STAGE0" "$SEED" "$SRC" "${LF[@]}" || exit 1

echo "=== stage1: stage0 builds the self-host compiler (default LLVM backend) ==="
"$STAGE0"     build "$SRC" -o /tmp/coil-rb1                "${LF[@]}" || { echo "stage1 FAILED"; exit 1; }

echo "=== stage2: stage1 rebuilds both backend branches in parallel ==="
launch rb2 /tmp/coil-rb1 build "$SRC" -o /tmp/coil-rb2 --backend arm64 "${LF[@]}"
launch rl2 /tmp/coil-rb1 build "$SRC" -o /tmp/coil-rl2 "${LF[@]}"
wait_jobs || exit 1

echo "=== FIXPOINT BUILDS + GATES (parallel DAG) ==="
# rb2 and rl2 derive from the same stage1 source. Their fixpoint successors and
# independent gates can all run concurrently. The gates use fast rl2 except for
# the arm64 runtime corpus, which intentionally executes the arm64-built rb2.
launch rb3 /tmp/coil-rb2 build "$SRC" -o /tmp/coil-rb3 --backend arm64 "${LF[@]}"
launch rl3 /tmp/coil-rl2 build "$SRC" -o /tmp/coil-rl3 "${LF[@]}"
launch snapshots python3 scripts/oracle.py gate all --compiler /tmp/coil-rl2
launch coverage python3 scripts/oracle.py coverage
launch runtime-arm64 python3 scripts/oracle.py runtime gate arm64 --compiler /tmp/coil-rb2
launch cli ./scripts/compiler/oracle/gate-cli.sh /tmp/coil-rl2
launch cimport ./scripts/compiler/oracle/gate-cimport.sh /tmp/coil-rl2
# rebootstrap-linux.sh was this gate's ONLY caller, so on macOS it never ran at
# all — which is how its fixture went stale for months without failing anything.
launch target-os ./scripts/compiler/oracle/gate-target-os.sh /tmp/coil-rl2
launch meta env COIL_META_SKIP_RUNTIME=1 python3 scripts/dev.py test meta --compiler /tmp/coil-rl2
wait_jobs || exit 1
if wait "$WASM_PID"; then
  echo "  wasm: PASS"
else
  echo "  wasm: FAIL"
  sed -n '1,160p' /tmp/coil-bootstrap-wasm.log
  exit 1
fi
WASM_PID=

cmp /tmp/coil-rb2.o /tmp/coil-rb3.o \
  || { echo "FIXPOINT FAIL — arm64 objects differ (nondeterminism)"; exit 2; }
cmp /tmp/coil-rl2.o /tmp/coil-rl3.o \
  || { echo "LLVM FIXPOINT FAIL — LLVM-backend objects differ"; exit 2; }

# Differential proof: the verified optimized compiler's arm64 output must equal
# the arm64 branch's fixed point. This connects the fast-gated/install branch to
# the independently reproduced native-backend branch.
/tmp/coil-rl3 build "$SRC" -o /tmp/coil-rd3 --backend arm64 "${LF[@]}" >/dev/null \
  || { echo "cross-backend differential build FAIL"; exit 2; }
cmp /tmp/coil-rd3.o /tmp/coil-rb3.o \
  || { echo "cross-backend differential FAIL — arm64 objects differ"; exit 2; }
echo "  fixpoints + cross-backend differential: PASS"

DEST="${1:-build/bin/coil}"
# Install the LLVM-BUILT compiler, not the arm64 one. Both are derived from the same
# source at the same depth — rb1 builds rb2 with the arm64 backend and rl2 with LLVM,
# and each then reproduces itself byte-identically — but the arm64 backend does no
# optimisation, so the compiler it produces runs about 11x slower: 10.2s vs 0.9s to
# compile the compiler, 11.0s vs 1.7s to lint it. Installing rb2 made every build,
# every lint and every gate in this repo pay that, which is why a `coil lint` over the
# tree took minutes. The arm64 build is still produced and still gated above — it is
# what proves that backend faithful — it is just not what anyone runs.
mkdir -p "$(dirname "$DEST")"
cp /tmp/coil-rl3 "$DEST"
# Re-sign after copy: macOS invalidates a Mach-O's ad-hoc signature on cp, and the
# kernel SIGKILLs a mis-signed binary. Re-sign so the installed compiler runs.
codesign -s - --force "$DEST" >/dev/null 2>&1 || true
echo "=== VERIFIED self-host compiler installed -> $DEST ==="
python3 scripts/dev.py install --source "$DEST" \
  || { echo "global install FAILED"; exit 1; }
echo "=== VERIFIED self-host compiler installed globally ==="
