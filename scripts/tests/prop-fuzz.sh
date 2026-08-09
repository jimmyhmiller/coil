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

# Everything in coil.prop.cov, plus the allocator underneath it: instrumenting
# either one puts an instrumented call inside the coverage callback's own path.
cat > "$IGNORE" <<'EOF'
[trace-pc-guard]
fun:coil.prop.cov.*
EOF

printf 'emitting IR    ... '
COIL_STDLIB_DIR=. $COIL emit-ir "$SRC" > "$IR"
printf '%s (%s lines)\n' "$IR" "$(wc -l < "$IR" | tr -d ' ')"

printf 'instrumenting  ... '
"$CLANG" -fsanitize-coverage=trace-pc-guard \
         -fsanitize-coverage-ignorelist="$IGNORE" \
         -O1 -Wno-override-module \
         "$IR" -o "$BIN"
printf '%s\n' "$BIN"

printf 'fuzzing        ... %s iterations\n\n' "$ITERS"
COIL_PBT_FUZZ="$ITERS" COIL_PBT_VERBOSE="${COIL_PBT_VERBOSE:-1}" "$BIN"
