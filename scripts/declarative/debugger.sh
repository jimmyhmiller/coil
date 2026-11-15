#!/bin/zsh
# What lldb sees in programs built with -g by this backend, against the same
# programs built with -g by LLVM at -O0 (which, like -g here, compiles each
# function alone): at each of the first stops on the program's own functions,
# the function, the line, the backtrace and the arguments' values must agree.
# Addresses on the stack are left out: the two lay their frames out differently.
#   scripts/declarative/debugger.sh [stops]      (after python3 scripts/dev.py build candidate)
#   DEBUGGER_OPT=-O0 scripts/declarative/debugger.sh    ours as the quick compile builds it
# Known: LLVM's -O0 -g build stops on a function's first line before its
# arguments are stored, so lldb reads garbage arguments there and this reports
# those stops as differences (coil-bugs: "LLVM backend at -O0 -g: a breakpoint on
# a function stops before its arguments are stored").
set -uo pipefail
here=$(cd "$(dirname $0)" && pwd)
tree=$(cd "$(dirname $0)/../.." && pwd)
stops=${1:-300}
work=$(mktemp -d)
trap 'rm -rf $work' EXIT
cd $tree
failed=0
for source in tests/corpus/*.coil; do
  stem=${source:t:r}
  module=$(sed -n 's/^(module \([^)]*\)).*/\1/p' $source | head -1)
  build/bin/coil-candidate build $source --backend native ${DEBUGGER_OPT:-} -g -o $work/$stem-ours > $work/build.log 2>&1 || { echo "debugger: $stem did not build"; cat $work/build.log | tail -5; failed=1; continue }
  build/bin/coil-candidate build $source --backend llvm -g -O0 -o $work/$stem-llvm > $work/build.log 2>&1 || { echo "debugger: $stem did not build with LLVM"; failed=1; continue }
  for which in ours llvm; do
    xcrun python3 $here/debugger-trace.py $work/$stem-$which $module $stops 2>&1 | sed -E 's/0x[0-9a-f]{12,16}/ADDR/g' > $work/$stem-$which.txt
  done
  python3 - $work/$stem-ours.txt $work/$stem-llvm.txt $stem <<'PY' || failed=1
import sys
ours = open(sys.argv[1]).read().splitlines()
llvm = open(sys.argv[2]).read().splitlines()
stem = sys.argv[3]
def parts(line):
    head, calls, args = (line.split(" | ") + ["", ""])[:3]
    function, _, place = head.partition(" @ ")
    return function, place, calls.split(" < "), args
def within(ours, theirs):
    # Ours is LLVM's with frames left out: a call in tail position is a tail
    # call at every level, -g too, so its caller's frame is gone. Each trace
    # holds eight frames at most; past the end of LLVM's, ours cannot be checked.
    j = 0
    for f in ours:
        k = theirs.index(f, j) if f in theirs[j:] else -1
        if k < 0:
            return len(theirs) == 8
        j = k + 1
    return True
problems, lines = [], 0
if len(ours) != len(llvm):
    problems.append(f"{len(ours)} stops, LLVM's {len(llvm)}")
for k, (a, b) in enumerate(zip(ours, llvm)):
    fa, pa, ca, aa = parts(a)
    fb, pb, cb, ab = parts(b)
    if fa != fb or aa != ab:
        problems.append(f"stop {k + 1}: {a}\n    LLVM's: {b}")
    elif ca[0] != cb[0] or not within(ca, cb):
        problems.append(f"stop {k + 1}: backtrace {' < '.join(ca)}\n    LLVM's: {' < '.join(cb)}")
    elif pa != pb:
        lines += 1
if problems:
    print(f"debugger: {stem}: differs from LLVM's")
    for p in problems[:6]:
        print("  " + p)
    sys.exit(1)
note = f" ({lines} at another line of the same function)" if lines else ""
print(f"debugger: {stem}: {len(ours)} stops agree{note}")
PY
done
exit $failed
