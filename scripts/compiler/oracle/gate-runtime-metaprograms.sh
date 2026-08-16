#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd "$(dirname "$0")/../../.." && pwd)
COIL=${1:-$ROOT/build/bin/coil}

run_one() {
  local file=$1
  local entry=$2
  local arg=$3
  local want=$4
  local output
  output=$($COIL run "$ROOT/$file" --meta "$entry" -- "$arg")
  if [ "$output" != "$want" ]; then
    echo "metaprogram run gate: unexpected output from $entry" >&2
    echo "want: $want" >&2
    echo " got: $output" >&2
    exit 1
  fi
}

run_one tests/metaprogramming/run_meta_identity.coil \
  run_meta_identity.identity '(hello 42)' '(hello 42)'
run_one tests/metaprogramming/run_meta_identity.coil \
  run_meta_identity.dotted-code-shape 'ignored' \
  '((proper-list no) (pair yes) (tail-symbol yes))'
run_one tests/metaprogramming/run_meta_identity.coil \
  run_meta_identity.code-shape '(head tail)' \
  '((proper-list yes) (pair yes))'

# Both mutable Code operations preserve the consumed root while replacing its
# child. The fixture's static assertions fail compilation if either edit is not
# visible through the ordinary macro path.
$COIL check "$ROOT/tests/metaprogramming/destructive_code_edit.coil"

program_count=$($COIL run "$ROOT/tests/metaprogramming/run_meta_program_target.coil" \
  --meta run_meta_identity.loaded-module-count --program)
case "$program_count" in
  ''|*[!0-9]*)
    echo "metaprogram run gate: --program did not return a module count" >&2
    echo " got: $program_count" >&2
    exit 1
    ;;
esac
if [ "$program_count" -lt 1 ]; then
  echo "metaprogram run gate: --program loaded no modules" >&2
  exit 1
fi
run_one tests/metaprogramming/safe_dialect.coil \
  safedialect.desugar-inc '((inc 41))' '(do (primitive/iadd 41 1))'
run_one tests/metaprogramming/always_test.coil \
  always.always-ok '(anything)' '0'
run_one src/examples/sprout.coil \
  sprout.sprout-desugar \
  '((define (square x) (* x x)) (print (square (inc (+ 2 4)))))' \
  '((define (square x) (* x x)) (print (square (+ (+ 2 4) 1))))'
run_one src/examples/sprout.coil \
  sprout.sprout-fold \
  '((define (square x) (* x x)) (print (square (+ (+ 2 4) 1))))' \
  '((define (square x) (* x x)) (print (square 7)))'

sprout_output=$($COIL run "$ROOT/tests/metaprogramming/sprout_lowered.coil")
if [ "$sprout_output" != 49 ]; then
  echo "metaprogram run gate: lowered Sprout program did not print 49" >&2
  exit 1
fi

staged_sprout_output=$($COIL run "$ROOT/src/examples/sprout_staged_test.coil")
if [ "$staged_sprout_output" != 49 ]; then
  echo 'metaprogram run gate: (stage MARKER ...) Sprout pipeline did not print 49' >&2
  exit 1
fi

alloc_trace=$($COIL run "$ROOT/tests/metaprogramming/alloc_trace_test.coil" \
  --use coil.alloc_trace.instrument 2>&1)
case "$alloc_trace" in
  *$'8\t1\t0\t0\t[i64]\t'*'tests/metaprogramming/alloc_trace_test.coil'$'\t8\t29'*) ;;
  *)
    echo "metaprogram run gate: typed allocation attribution regressed" >&2
    echo "$alloc_trace" >&2
    exit 1
    ;;
esac

if missing=$($COIL run "$ROOT/tests/metaprogramming/run_meta_identity.coil" \
    --meta run_meta_identity.identity 2>&1); then
  echo "metaprogram run gate: missing argument unexpectedly succeeded" >&2
  exit 1
fi
case "$missing" in
  *"expects 1 Code arguments, got 0"*) ;;
  *)
    echo "metaprogram run gate: missing-argument diagnostic regressed" >&2
    echo "$missing" >&2
    exit 1
    ;;
esac

echo "metaprogram run gate: ok"
