#!/usr/bin/env bash
# THE EASY BOOTSTRAP, Linux x86-64 edition — rebuild and VERIFY the self-host Coil
# compiler on an ELF host. Mirrors rebootstrap.sh's shape with two differences:
#
#   * every stage uses the DEFAULT (LLVM) backend — the native arm64 backend emits
#     Mach-O and never runs here, so the fixpoint is the LLVM-backend one
#     (stage2.o == stage3.o, byte-identical; the LLVM emission is deterministic).
#   * the gates are the Linux oracle: gate-full (IR byte-exact vs the Linux
#     snapshot in tests/compiler/oracle/linux/full-reference), gate-run (stdout+exit vs
#     the shared behavioral snapshot), and gate-cli.
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
COIL_STRICT_BUNDLE=0 "$STAGE0" build "$SRC" -o /tmp/coil-lrb1 ${STAGE0_BUILD_FLAGS[@]+"${STAGE0_BUILD_FLAGS[@]}"} "${LF[@]}" || { echo "stage1 FAILED"; exit 1; }
echo "=== stage2: stage1 rebuilds it ==="
/tmp/coil-lrb1   build "$SRC" -o /tmp/coil-lrb2 "${LF[@]}" || { echo "stage2 FAILED"; exit 1; }
echo "=== stage3: stage2 rebuilds it ==="
/tmp/coil-lrb2   build "$SRC" -o /tmp/coil-lrb3 "${LF[@]}" || { echo "stage3 FAILED"; exit 1; }

echo "=== FIXPOINT: stage2.o vs stage3.o ==="
cmp /tmp/coil-lrb2.o /tmp/coil-lrb3.o || { echo "FIXPOINT FAIL — objects differ (nondeterminism)"; exit 2; }
echo "  ok — byte-identical, the compiler reproduces itself"

echo "=== GATES ==="
python3 scripts/oracle.py linux-ir gate --compiler /tmp/coil-lrb2 >/dev/null || { echo "linux IR gate FAIL"; exit 1; }
echo "  linux gate-full: PASS (IR byte-exact vs the Linux snapshot)"
python3 scripts/oracle.py runtime gate linux --compiler /tmp/coil-lrb2 >/dev/null  || { echo "linux runtime gate FAIL"; exit 1; }
echo "  linux gate-run:  PASS (programs run identically)"
# Keep a direct checker assertion in the bootstrap gate in addition to the
# host-aware bounded modernize gate. This asks one question and has one failure
# mode: lint --fix must actually rewrite source.
python3 scripts/tests/lint_fires.py --coil /tmp/coil-lrb2 >/dev/null   || { echo "gate-lint-fires FAIL — lint --fix does nothing"; exit 1; }
echo "  gate-lint-fires: PASS (checkers fire; lint --fix rewrites)"

# `coil.lint.unused` is the one bundled rule that DELETES source, so both of its
# failure directions need a gate: deleting too little is noise, deleting too much
# destroys work that the --fix loop's compile check cannot always catch.
python3 scripts/tests/unused_lint.py --coil /tmp/coil-lrb2 >/dev/null   || { echo "gate-unused-lint FAIL — dead-code deletion is wrong in one direction or the other"; exit 1; }
echo "  gate-unused-lint: PASS (deletes exactly the unreachable set)"

# `--no-fork` has to reach the REUSE phase, not just generation. While a saved
# counterexample exists the reuse phase is the only one that runs, so a flag that
# gated generation alone was inert exactly when someone reached for it — and read
# as bugs in --seed and in the debugger story instead of as its own.
python3 scripts/tests/prop_nofork.py --coil /tmp/coil-lrb2 >/dev/null   || { echo "gate-prop-nofork FAIL — --no-fork does not reach the property reuse phase"; exit 1; }
echo "  gate-prop-nofork: PASS (--no-fork governs replay as well as generation)"

# A property inside a test binary that has THREADS. `coil test` gives each test its
# own process and a `defprop` runs its cases in a process again; while that inner
# one was a fork, a linked threaded runtime (a Go c-archive, CoreFoundation) left
# the child holding locks whose owner threads did not exist — so the watchdog
# reported `TIMED OUT on case 0` against a property that is true, and `--no-fork`
# "fixed" it. This links a tiny threaded C runtime and asserts both directions:
# a true property passes, and a crashing one still minimizes.
python3 scripts/tests/prop_spawn.py --coil /tmp/coil-lrb2 >/dev/null   || { echo "gate-prop-spawn FAIL — property isolation forks instead of spawning; a threaded test binary deadlocks"; exit 1; }
echo "  gate-prop-spawn: PASS (property workers survive a threaded test binary)"

# Does the compiler still BUILD for wasm? This battery had no wasm line at all,
# which is how two independent wasm regressions reached main: a `musttail` that
# needs the unenabled `+tail-call` feature (fails here, at build), and externs
# that become required host imports (fails on macOS, at instantiate). Each was
# invisible to the platform the other failed on.
#
# Deliberately only a BUILD, not validate/instantiate: those need wasm-tools and
# node, and `dev.py test wasm` already SKIPs silently without them — a skip that
# reads like a pass is the failure mode this whole merge kept turning up. A build
# needs nothing extra and cannot skip, so it is a gate rather than a maybe.
/tmp/coil-lrb2 build src/compiler/main_wasm.coil --target wasm64-unknown-unknown \
  -o /tmp/gate-wasm-linux.wasm >/dev/null 2>&1 \
  || { echo "  gate-wasm-build FAIL — the compiler no longer builds for wasm"
       /tmp/coil-lrb2 build src/compiler/main_wasm.coil --target wasm64-unknown-unknown \
         -o /tmp/gate-wasm-linux.wasm 2>&1 | tail -3; exit 1; }
echo "  gate-wasm-build: PASS (compiler builds for wasm64)"
# Output is captured rather than discarded so a FAILURE is readable. Sent to
# /dev/null, a Linux-only gate-cli break reported four words and a Python
# traceback from dev.py, and the one machine that reproduces it is the CI runner
# -- so the log has to carry the reason or nobody can act on it.
./scripts/compiler/oracle/gate-cli.sh /tmp/coil-lrb2 >/tmp/coil-gate-cli.log 2>&1 \
  || { echo "gate-cli FAIL"; sed -n '/GATE FAIL\|FAIL /,$p' /tmp/coil-gate-cli.log | head -40; \
       echo "--- tail ---"; tail -25 /tmp/coil-gate-cli.log; exit 1; }
echo "  gate-cli:        PASS (argv, exit codes, fmt)"
./scripts/compiler/oracle/gate-target-os.sh /tmp/coil-lrb2 >/dev/null 2>&1 || { echo "gate-target-os FAIL"; exit 1; }
echo "  gate-target-os:  PASS ((target-os) follows --target, consts fold per target)"
python3 scripts/dev.py test scheme --compiler /tmp/coil-lrb2 >/dev/null || { echo "gate-scheme FAIL"; exit 1; }
echo "  gate-scheme:     PASS (R5RS surface, oracles, negatives, applications)"

# The PER-STAGE gates. These are target-INDEPENDENT (they compare frontend stage
# output, not machine code), so the same references serve both platforms — but only
# rebootstrap.sh ran them, which meant work done on a Linux box could leave them red
# with nothing here to notice. It did: src/stdlib/fs.coil changed with its load and expand
# references re-blessed but the parser reference left stale, and gate.sh sat red
# until the next macOS bootstrap. A gate only one platform runs is half a gate.
#
# gate-ir and gate-diag are deliberately NOT in this list: both are genuinely
# host-specific. gate-ir's corpus includes src/apps/chip8/objc.coil (Objective-C, macOS
# only) and gate-diag asserts linker error text, which GNU ld words differently from
# macOS ld. They stay macOS-only until they have Linux references of their own.
for stage in read ast load resolved checked expand mono x86; do
  python3 scripts/oracle.py gate "$stage" --compiler /tmp/coil-lrb2 >/dev/null 2>&1 \
    || { echo "  $stage gate FAIL — output drifted from its snapshot."
         echo "  Re-bless with: python3 scripts/oracle.py snapshot $stage --compiler <verified-coil>"; exit 1; }
done
echo "  stage gates:     PASS (read/ast/load/resolve/check/expand/mono/x86 byte-exact)"

# Cheap, compiler-free, and identical on both platforms: every shared-corpus entry
# must be blessed for macOS AND Linux. This is what would have caught fs_lib.coil
# being added to the corpus with only a Linux reference, which killed macOS
# gate-full while every Linux gate stayed green.
python3 scripts/oracle.py coverage >/dev/null \
  || { echo "snapshot coverage FAIL"; python3 scripts/oracle.py coverage; exit 1; }
echo "  corpus coverage: PASS (every corpus entry blessed on both platforms)"

stage_lib_cleanup

DEST="${1:-build/bin/coil}"
mkdir -p "$(dirname "$DEST")"
cp /tmp/coil-lrb2 "$DEST"
echo "=== VERIFIED self-host compiler installed -> $DEST ==="
python3 scripts/dev.py install --source "$DEST" \
  || { echo "global install FAILED"; exit 1; }
echo "=== VERIFIED self-host compiler installed globally ==="
