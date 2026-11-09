#!/bin/zsh
# integrate.sh NAME : vendor the library idioms worktree, rebuild the candidate, build host build/h/NAME
# with the cheap option set, run it once on the fixed workload; print generation s, instructions, cycles, seed prefix.
set -e
L=/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/idioms
W=/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-idioms
R=/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-branch-fusion
cd $W
rsync -a --delete $L/src/stogir/ src/compiler/stogir/stogir/
env $(env | grep ^COIL_ | sed 's/=.*//;s/^/-u /') PATH="$PWD/build/seed-bin:$PATH" COIL_LIBRARY_STATE=0 python3 scripts/dev.py build candidate > build/cand.log 2>&1 || { tail -30 build/cand.log; exit 1; }
zsh docs/benchmarks/idioms/tools/mkhost-env.sh $R $PWD/build/bin/coil-candidate $PWD/build/h/$1 COIL_STOGIR_LOOP_EVICT=1 COIL_STOGIR_LOOP_RELOAD=1 COIL_STOGIR_PREDICT=1 COIL_STOGIR_PRUNE_DEFAULT=1 | head -1
(cd $R; env $(env | grep ^COIL_ | sed 's/=.*//;s/^/-u /') COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 /usr/bin/time -l $W/build/h/$1/bin/coil emit-obj src/compiler/main.coil --backend stogir -O3 --no-debug -o $W/build/h/$1/out.o 2>&1 | grep -E "instructions retired|cycles elapsed")
shasum -a 256 build/h/$1/out.o | cut -c1-16
