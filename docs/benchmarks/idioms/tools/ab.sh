#!/bin/zsh
# ab.sh ROUNDS OUTDIR name=host ... : alternate hosts emitting the Coil compiler, print min/median cycles
N=$1; O=$2; shift 2
R=/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-branch-fusion
mkdir -p $O; : > $O/ab.log
for i in $(seq 1 $N); do
  for h in "$@"; do
    name=${h%%=*}; bin=${h#*=}
    (cd $R; env $(env | grep ^COIL_ | sed 's/=.*//' | sed 's/^/-u /') COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 /usr/bin/time -l $bin emit-obj src/compiler/main.coil --backend stogir -O3 --no-debug -o $O/$name.o 2> $O/$name.time > /dev/null)
    echo "$name $i $(grep 'cycles elapsed' $O/$name.time | awk '{print $1}') $(grep 'instructions retired' $O/$name.time | awk '{print $1}') $(grep real $O/$name.time | awk '{print $1}')" >> $O/ab.log
  done
done
python3 - $O/ab.log <<'PY'
import sys, collections, statistics
d = collections.defaultdict(list)
for l in open(sys.argv[1]):
    n, i, c, ins, w = l.split(); d[n].append((int(c), int(ins), float(w)))
base = None
for n, v in d.items():
    cs = sorted(x[0] for x in v); m = cs[0]; med = statistics.median(cs)
    if base is None: base = (m, med)
    print('%-12s min %6.2fB (%+5.1f%%) median %6.2fB (%+5.1f%%) ins %6.2fB' % (n, m / 1e9, 100 * (m / base[0] - 1), med / 1e9, 100 * (med / base[1] - 1), v[0][1] / 1e9))
PY
shasum -a 256 $O/*.o | awk '{print $1}' | sort -u | wc -l | xargs -I{} echo "distinct objects: {}"
