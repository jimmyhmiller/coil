#!/bin/zsh
# bbhost.sh NAME : build a block-counting compiler from this worktree into build/NAME, build its host with the
# cheap option set, run the host on the fixed workload, and write host/{coil.dis,counts.bin} plus the census.
set -e
W=/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-idioms
RP=/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/inline-policy/docs/benchmarks/runtime-profile
R=/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-branch-fusion
SEED=/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-static-entry-allocations/build/bin/coil-candidate
D=$W/build/$1; O=$D/host
[ -e $D ] && { echo "$D exists"; exit 1; }
CL=$(env | grep ^COIL_ | sed 's/=.*//;s/^/-u /')
python3 $RP/prepare.py $W $D > /dev/null
cd $D
cc -dynamiclib $RP/counters.c -o counters.dylib
env ${=CL} COIL_LIBRARY_STATE=0 python3 scripts/compiler/stage0.py $SEED build $D/src/compiler/main.coil -o $D/build/bin/coil-candidate --link-flag -L/opt/homebrew/Cellar/llvm/23.1.4/lib --link-flag -lLLVM --link-flag -lm > build.log 2>&1 || { tail -5 build.log; exit 1; }
mkdir -p $O/bin $O/lib/coil
cd $R
env ${=CL} COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 COIL_STOGIR_BBCOUNT=1 COIL_STOGIR_LOOP_EVICT=1 COIL_STOGIR_LOOP_RELOAD=1 COIL_STOGIR_PREDICT=1 COIL_STOGIR_PRUNE_DEFAULT=1 DYLD_INSERT_LIBRARIES=$D/counters.dylib BBCOUNT_OUT=$O/gen-counts.bin $D/build/bin/coil-candidate emit-obj src/compiler/main.coil --backend stogir -O3 --no-debug -o $O/host.o > $O/emit.out 2> $O/emit.err || { tail -5 $O/emit.err; exit 1; }
for l in stdlib:src/stdlib compiler:src/compiler prelude.coil:src/compiler/prelude.coil; do ln -sf $R/${l#*:} $O/lib/coil/${l%%:*}; done
ln -sf $R/build/bin/native $O/bin/native
A=$R/build/bin/native/curl/arm64-macos
cc $O/host.o -L$(llvm-config --libdir) -lLLVM -lm $A/libcurl.a $A/libmbedtls.a $A/libmbedx509.a $A/libmbedcrypto.a -framework CoreFoundation -framework SystemConfiguration -lz -Wl,-dead_strip -o $O/bin/coil
cp $W/build/bin/coil-candidate.toolchain $O/bin/coil.toolchain
env ${=CL} COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 DYLD_INSERT_LIBRARIES=$D/counters.dylib BBCOUNT_OUT=$O/counts.bin $O/bin/coil emit-obj src/compiler/main.coil --backend stogir -O3 --no-debug -o $O/self.o
shasum -a 256 $O/self.o | cut -c1-16
objdump -d --no-show-raw-insn $O/bin/coil > $O/coil.dis
python3 $W/docs/benchmarks/idioms/tools/census.py $O/coil.dis $O/counts.bin > $O/census.txt
