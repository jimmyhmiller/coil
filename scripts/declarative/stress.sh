#!/bin/zsh
# Coil's corpus and the self-reproduction check under inlining limits far
# above the defaults: bugs that default settings hide have shown up this way.
# Also the corpus through the compiler built so.
#   scripts/declarative/stress.sh             (after python3 scripts/dev.py build candidate)
#   SMALL=… GROWTH=… ONCE=… scripts/declarative/stress.sh
set -uo pipefail
here=$(cd "$(dirname $0)" && pwd)
tree=$(cd "$(dirname $0)/../.." && pwd)
export DECLARATIVE_SMALL=${SMALL:-150} DECLARATIVE_GROWTH=${GROWTH:-6000} DECLARATIVE_ONCE=${ONCE:-3000}
echo "stress: DECLARATIVE_SMALL=$DECLARATIVE_SMALL DECLARATIVE_GROWTH=$DECLARATIVE_GROWTH DECLARATIVE_ONCE=$DECLARATIVE_ONCE"
cd $tree
corpus() { python3 scripts/oracle.py corpus native --compiler $1 2>&1 | grep -E "^FAIL|^corpus" | tee /dev/stderr | grep -q "^corpus native: [0-9]* passed, 0 failed"; }
corpus build/bin/coil-candidate 2>&1 || { echo "stress: the corpus failed through the candidate"; exit 1; }
$here/selfcheck.sh || exit 1
corpus build/bin/coil-self 2>&1 || { echo "stress: the corpus failed through the compiler built so"; exit 1; }
