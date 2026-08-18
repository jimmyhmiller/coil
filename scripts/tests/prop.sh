#!/bin/sh
# Run the whole property-testing suite against the stdlib IN THIS CHECKOUT.
#
# Run from the checkout root: a compiler resolves the standard library by walking up
# from itself and then from the working directory (loader.coil), so from here the
# library under test is this tree's src/stdlib and an edit to it is what runs.
#
#   scripts/tests/prop.sh              # everything
#   scripts/tests/prop.sh -q           # only the summary lines
#   scripts/tests/prop.sh build/bin/coil   # a specific compiler
#
# A compiler PATH as the first argument selects that compiler; `COIL=` still
# works. This used to accept only `COIL=`, and an argument was silently ignored
# -- so `prop.sh <candidate>` reported on whatever `coil` was installed, which is
# a control that looks valid and is not.
#
# Exit status is the number of failing files (0 = all green).
#
# Deliberate failures live in tests/prop/demos/ and are NOT run here — see that
# directory's README for what each one demonstrates and how to run it.

set -u
cd "$(dirname "$0")/../.." || exit 1
QUIET=0
if [ "${1:-}" = "-q" ]; then
  QUIET=1
elif [ -n "${1:-}" ]; then
  COIL=$1
fi
COIL=${COIL:-coil}

FILES="tests/prop/core_test.coil
tests/prop/shrink_test.coil
tests/prop/derive_test.coil
tests/prop/gen_test.coil
tests/prop/stateful_test.coil
tests/prop/db_test.coil
tests/prop/cov_test.coil
tests/prop/stdlib_props_test.coil
src/examples/property-testing.coil"

failed=0
for f in $FILES; do
  [ -f "$f" ] || { printf '%-40s SKIP (absent)\n' "$f"; continue; }
  out=$($COIL test "$f" 2>&1)
  summary=$(printf '%s\n' "$out" | grep 'test result:' | tail -1)
  case "$summary" in
    *"ok."*) printf '%-40s %s\n' "$f" "$summary" ;;
    *)       printf '%-40s %s\n' "$f" "${summary:-NO RESULT — see output below}"
             failed=$((failed + 1))
             [ "$QUIET" = 1 ] || printf '%s\n' "$out" ;;
  esac
done

printf '\n%d file(s) failing\n' "$failed"
exit "$failed"
