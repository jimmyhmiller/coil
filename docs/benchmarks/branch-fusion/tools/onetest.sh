#!/bin/zsh
# onetest.sh OUTDIR TESTFILE
n=$(basename $2 .coil)
T=${STOGIR_TEST_COIL:-/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-allocator-choice-fusion/build/bin/coil-candidate}
COIL_LIBRARY_STATE=0 timeout 900 $T run $2 --backend stogir -O3 --no-debug --debug-checks > $1/$n.log 2>&1
echo $? > $1/$n.rc
