#!/usr/bin/env bash
# Staged metacompilation (docs/design/STAGED_METACOMPILATION.md): a before-expand
# transform may emit `(stage MARKER FORM...)` declarations -- compiled as an
# isolated, CUMULATIVE phase program whose declared [Code...] -> Code entries
# install additively into the metaprogram engine -- and rewrite guest syntax into
# `(MARKER ENTRY ARG...)` requests expanded natively during the fixpoint, their
# results re-entering the transform rounds (language resumption).
#
# What this pins, each under the native engine, COIL_META_INTERP=1, and
# COIL_META_ARENA=poison:
#   * staged_pick   -- generated + isolated: the entry exists in no source file,
#                      expands a request to 42, and never enters the runtime
#                      binary (checked via strings);
#   * staged_chain  -- multiround + cumulative + resumption: increment 1's native
#                      result is guest syntax that resumes through the dialect,
#                      and increment 2's entry calls increment 1's helper;
#   * staged_xmod   -- cross-module routing: a request in one module resolves an
#                      entry declared from another module's transform output;
#   * staged_dup    -- redefinition across increments is a hard located error,
#                      never a silent shadowing.
#
# Usage: scripts/compiler/oracle/gate-staged-meta.sh <coil-binary>
set -uo pipefail
cd "$(dirname "$0")/../../.."
BIN=${1:?usage: gate-staged-meta.sh <coil-binary>}
[ -x "$BIN" ] || { echo "GATE FAIL: binary not executable: $BIN"; exit 2; }

D=tests/metaprogramming/compile-and-run
WORK=$(mktemp -d); trap 'rm -rf "$WORK"' EXIT
fail=0

for mode in native interp poison; do
  case "$mode" in
    native) env=() ;;
    interp) env=(COIL_META_INTERP=1) ;;
    poison) env=(COIL_META_ARENA=poison) ;;
  esac
  for t in staged_pick staged_chain staged_xmod; do
    env "${env[@]}" "$BIN" run "$D/${t}_test.coil" >/dev/null 2>"$WORK/err"
    rc=$?
    [ "$rc" = 42 ] || { echo "GATE FAIL: $t ($mode) exited $rc, want 42 ($(head -1 "$WORK/err"))"; fail=1; }
  done
  env "${env[@]}" "$BIN" run "$D/staged_dup_test.coil" >/dev/null 2>"$WORK/dup.err"
  rc=$?
  [ "$rc" = 1 ] || { echo "GATE FAIL: staged_dup ($mode) exited $rc, want 1"; fail=1; }
  grep -q "introduced more than once" "$WORK/dup.err" \
    || { echo "GATE FAIL: staged_dup ($mode) missing redefinition diagnostic"; fail=1; }
done

# Isolation is a property of the BUILT artifact: the staged entry's name must
# not appear anywhere in the runtime binary.
"$BIN" build "$D/staged_pick_test.coil" -o "$WORK/pick" >/dev/null 2>&1 \
  || { echo "GATE FAIL: staged_pick build failed"; fail=1; }
if [ -x "$WORK/pick" ]; then
  n=$(strings -a "$WORK/pick" | grep -c "staged-pick" || true)
  [ "$n" = 0 ] || { echo "GATE FAIL: staged entry leaked into the runtime binary ($n occurrences)"; fail=1; }
  "$WORK/pick"; rc=$?
  [ "$rc" = 42 ] || { echo "GATE FAIL: built staged_pick binary exited $rc, want 42"; fail=1; }
fi

if [ "$fail" = 0 ]; then echo "gate-staged-meta: OK"; else echo "gate-staged-meta: FAILED"; exit 1; fi
