#!/bin/sh
# Build a property-test file with EDGE COVERAGE and fuzz it.
#
#   scripts/tests/prop-fuzz.sh tests/prop/demos/fuzz_demo.coil [iterations]
#
# Why a script and not a compiler flag: `coil` emits its own objects, so
# `--sanitize=...` only reaches the LINK step and instruments nothing. But `coil
# emit-ir` produces complete, linkable IR for the whole program — so
# instrumentation is clang's job, one pipe away, with no change to the compiler.
#
# The two SanitizerCoverage callbacks are ordinary Coil functions in
# `coil.prop.cov`, exported under the names clang expects. That is what lets the
# same source build both ways: an ordinary `coil test` binary defines them and
# never calls them, and this build calls them on every basic block.
#
# ⚠ THE IGNORELIST IS NOT OPTIONAL. Without it clang instruments the coverage
# callbacks themselves, `cov-guard` calls `cov-guard`, and the binary hangs on
# startup instead of failing. (`coil.prop.cov` also carries a re-entrancy flag, so
# a forgotten ignorelist costs coverage rather than the run — but do not rely on
# the belt when the suspenders are one line.)
#
# Two instrumentation kinds. `trace-pc-guard` answers "did this input reach
# somewhere new" — the keep-or-discard signal. `trace-cmp` answers "what value was
# the program looking for" — every integer comparison reports both operands, so a
# failed `byte == 'F'` hands the mutator the 70 it needed instead of making it
# guess. Edge coverage alone climbs a magic value one byte per round; with the
# comparison dictionary the byte is simply known.
#
# -O1, not -O3: at higher optimization more branches collapse into branchless
# selects, and a branch with no basic block of its own has no edge to discover.
# Coverage-guided fuzzing wants the control flow left intact.

set -eu
cd "$(dirname "$0")/../.." || exit 1

SRC=${1:?usage: prop-fuzz.sh FILE.coil [iterations]}
ITERS=${2:-20000}
OUT=${OUT:-.coil/build/fuzz}
COIL=${COIL:-coil}
CLANG=${CLANG:-"$(llvm-config --bindir)/clang"}

mkdir -p "$OUT"
BASE=$(basename "$SRC" .coil)
IR="$OUT/$BASE.ll"
BIN="$OUT/$BASE"
IGNORE="$OUT/sancov-ignore.txt"

# The WHOLE engine is excluded, not just the callbacks.
#
# The callbacks must be, or `cov-guard` calls `cov-guard`. The rest of `coil.prop`
# is excluded for signal: the generators and the runner execute far more branches
# and comparisons than the code under test, so instrumenting them fills the edge
# map with the engine's own control flow and floods the comparison dictionary with
# loop counters. `[*]` rather than a per-kind section so this holds for every
# instrumentation kind, present and future.
cat > "$IGNORE" <<'EOF'
[*]
fun:coil.prop.*
fun:coil.arraylist.*
fun:coil.alloc.*
EOF

printf 'emitting IR    ... '
COIL_STDLIB_DIR=. $COIL emit-ir "$SRC" > "$IR"
printf '%s (%s lines)\n' "$IR" "$(wc -l < "$IR" | tr -d ' ')"

printf 'instrumenting  ... '
"$CLANG" -fsanitize-coverage=trace-pc-guard,trace-cmp \
         -fsanitize-coverage-ignorelist="$IGNORE" \
         -O1 -Wno-override-module \
         "$IR" -o "$BIN"
printf '%s\n' "$BIN"

printf 'fuzzing        ... %s iterations\n\n' "$ITERS"
COIL_PBT_FUZZ="$ITERS" COIL_PBT_VERBOSE="${COIL_PBT_VERBOSE:-1}" "$BIN"
