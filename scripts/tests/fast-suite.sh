#!/usr/bin/env bash
# The fast suite: everything worth knowing on every push that does NOT need its
# own build.
#
# It runs against a compiler that has ALREADY been built and verified -- the
# bootstrap job hands it the stage2 it just proved a fixpoint for -- so this costs
# only the tests themselves. Roughly 80 seconds. That is the whole design
# constraint: anything that needs to compile the compiler again belongs in a
# bootstrap job, not here.
#
# Why these seven. Each is fast, has one failure mode, and covers something no
# other job does now that the Linux bootstrap runs no gates:
#
#   coverage        every shared-corpus entry blessed on BOTH platforms. Cheap,
#                   compiler-free, and the exact check that once let a Linux-only
#                   blessing kill macOS gate-full.
#   hygiene-audit   every explicit syntax producer still classified; a new
#                   unannotated datum->syntax fails closed.
#   snapshots       all eleven oracle stages, read through full, byte-exact.
#   gate-run-meta   the metaprogram + hygiene matrix, both capture directions.
#   reader          reader providers, code-read, and the Brainfuck acceptance
#                   probe.
#   lint-fires      `lint --fix` actually rewrites source rather than silently
#                   succeeding.
#   target-os       (target-os) follows --target instead of baking in the host.
#
# Usage: scripts/tests/fast-suite.sh [compiler]      (default: build/bin/coil)
set -uo pipefail
cd "$(dirname "$0")/../.."
COIL="${1:-build/bin/coil}"
[ -x "$COIL" ] || { echo "fast-suite: not executable: $COIL"; exit 2; }

fail=0
start=$(date +%s)

step() { # step <label> <command...>
  local label=$1; shift
  local t0 t1
  t0=$(date +%s)
  if "$@" >/tmp/fast-suite.log 2>&1; then
    t1=$(date +%s)
    printf '  %-22s PASS  %ss\n' "$label" "$((t1 - t0))"
  else
    t1=$(date +%s)
    printf '  %-22s FAIL  %ss\n' "$label" "$((t1 - t0))"
    # The log is the point: a fast gate that fails without saying why just moves
    # the work to whoever reruns it locally.
    tail -25 /tmp/fast-suite.log
    fail=1
  fi
}

step "oracle coverage"   python3 scripts/oracle.py coverage
step "hygiene audit"     python3 scripts/hygiene-audit.py --check
step "oracle snapshots"  python3 scripts/dev.py test snapshots --compiler "$COIL"
step "metaprogram+hygiene" scripts/compiler/oracle/gate-run-meta.sh "$COIL"
step "reader metaprograms" scripts/tests/reader-metaprograms.sh "$COIL"
step "lint fires"        python3 scripts/tests/lint_fires.py --coil "$COIL"
step "target-os folding" scripts/compiler/oracle/gate-target-os.sh "$COIL"

echo "  ---- fast suite: $(( $(date +%s) - start ))s ----"
if [ "$fail" = 0 ]; then echo "fast-suite: PASS"; else echo "fast-suite: FAILED"; exit 1; fi
