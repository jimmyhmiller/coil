#!/bin/zsh
# Run time of the Coil compiler as built by this backend against the one LLVM
# built (the candidate, LLVM at -O3): each checks the compiler's own source. Instructions and cycles are
# what to compare; wall time moves too much.
#   scripts/declarative/runtime.sh            (after scripts/declarative/selfcheck.sh, which builds coil-self)
#   scripts/declarative/runtime.sh profile    also: time by function in each, largest differences first
set -uo pipefail
tree=$(cd "$(dirname $0)/../.." && pwd)
cd "$tree"
# The least of several runs, the two compilers taking turns: other work on the
# machine only ever adds, and should add to both alike.
one() { /usr/bin/time -l "$@" 2>&1 >/dev/null | awk '/instructions retired/{i=$1} /cycles elapsed/{c=$1} / real /{r=$1} END{print r, i/1e9, c/1e9}'; }
least() { awk 'NR==1||$1<r{r=$1} NR==1||$2<i{i=$2} NR==1||$3<c{c=$3} END{print r, i, c}' $1; }
if [[ "${1:-}" != profile-only ]]; then
  : > build/runtime-ours.txt; : > build/runtime-llvm.txt
  for run in $(seq 1 ${RUNS:-4}); do
    one build/bin/coil-self check src/compiler/main.coil >> build/runtime-ours.txt
    one build/bin/coil-candidate check src/compiler/main.coil >> build/runtime-llvm.txt
  done
  least build/runtime-ours.txt | awk '{printf "declarative: %.2f s  %.1f G instructions  %.1f G cycles\n", $1, $2, $3}'
  least build/runtime-llvm.txt | awk '{printf "llvm:        %.2f s  %.1f G instructions  %.1f G cycles\n", $1, $2, $3}'
  paste <(least build/runtime-ours.txt) <(least build/runtime-llvm.txt) | awk '{printf "against LLVM (goal 1.10): %.2fx cycles, %.2fx instructions\n", $3/$6, $2/$5}'
fi
size build/bin/coil-self build/bin/coil-candidate | awk 'NR>1{print "text", $1, $NF}'
if [[ "${1:-}" == profile* ]]; then
  out=$tree/build/runtime-profile; mkdir -p $out
  for which in coil-self coil-candidate; do
    build/bin/$which check src/compiler/main.coil >/dev/null 2>&1 &
    pid=$!
    sleep 0.3
    sample $pid 60 1 -file $out/$which.sample >/dev/null 2>&1
    wait $pid
  done
  python3 - $out/coil-self.sample $out/coil-candidate.sample <<'PY'
import re, sys
def top(path):
    counts, on = {}, False
    for line in open(path, errors="ignore"):
        if line.startswith("Sort by top of stack"): on = True; continue
        if on:
            m = re.match(r"\s+(.*?)\s+\(in (\S+)\)\s+(\d+)\s*$", line)
            if m: counts[m.group(1)] = counts.get(m.group(1), 0) + int(m.group(3))
            elif line.strip() == "" and counts: break
    return counts
ours, theirs = top(sys.argv[1]), top(sys.argv[2])
print(f"samples (ms): declarative {sum(ours.values())}, llvm {sum(theirs.values())}")
rows = sorted(((ours.get(k, 0) - theirs.get(k, 0), ours.get(k, 0), theirs.get(k, 0), k) for k in set(ours) | set(theirs)), reverse=True)
print(f"{'more':>6} {'ours':>6} {'llvm':>6}  function")
for d, a, b, k in rows[:45]: print(f"{d:6} {a:6} {b:6}  {k}")
print("  ...")
for d, a, b, k in rows[-8:]: print(f"{d:6} {a:6} {b:6}  {k}")
PY
fi
