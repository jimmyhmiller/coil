#!/bin/zsh
# memrun.sh HOSTBIN OUT : run host on the fixed workload with the libc-call counter (build it first: cc -O2 -fno-builtin -dynamiclib interpose.c -o interpose.dylib)
P=/Users/jimmyhmiller/Documents/Code/projects; R=$P/coil/.worktrees/stogir-branch-fusion; T=${0:A:h}
cd $R; env $(env | grep ^COIL_ | sed 's/=.*//;s/^/-u /') COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 DYLD_INSERT_LIBRARIES=$T/interpose.dylib MEMCOUNT_OUT=$2 $1 emit-obj src/compiler/main.coil --backend stogir -O3 --no-debug -o $2.o
shasum -a 256 $2.o | cut -c1-16; wc -l $2
