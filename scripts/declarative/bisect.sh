#!/bin/zsh
# Which function does what is being tried go wrong in? Builds the Coil compiler
# with the trial on for the first N functions only, halving N, and runs the
# command given (which must succeed with the trial off and fail with it on).
#   scripts/declarative/bisect.sh 'build/bin/coil-self check tests/corpus/numerics.coil 2>&1 | grep -q error && exit 1 || exit 0'
set -uo pipefail
tree=$(cd "$(dirname $0)/../.." && pwd)
cd "$tree"
flags=($(scripts/compiler/llvm-link-flags.sh dynamic))
total=$(DECLARATIVE_SHOW='?' build/bin/coil-candidate emit-obj src/compiler/main.coil --backend native -O2 --no-debug -o build/bisect.o | grep -c '^; ')
good=0; bad=$total
while (( bad - good > 1 )); do
  mid=$(( (good + bad) / 2 ))
  DECLARATIVE_TRIAL=$mid build/bin/coil-candidate build src/compiler/main.coil --backend native -O2 --release -o build/bin/coil-self $flags >/dev/null 2>&1
  if zsh -c "$1" >/dev/null 2>&1; then good=$mid; else bad=$mid; fi
  echo "trial on for $mid: $([[ $good == $mid ]] && echo works || echo fails)"
done
echo "the trial goes wrong in function $good:"
DECLARATIVE_SHOW='?' build/bin/coil-candidate emit-obj src/compiler/main.coil --backend native -O2 --no-debug -o build/bisect.o | grep "^; $good "
