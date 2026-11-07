#!/bin/zsh
# mkhost.sh ROOT CANDIDATE OUTDIR : emit ROOT's compiler with CANDIDATE (stogir O3) and link a host; prints generation seconds
set -e
R=$1; C=$2; O=$3
mkdir -p $O/bin $O/lib/coil
cd $R
env $(env | grep ^COIL_ | sed 's/=.*//' | sed 's/^/-u /') COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 COIL_CODEGEN_TIMINGS=1 $C emit-obj src/compiler/main.coil --backend stogir -O3 --no-debug -o $O/host.o > $O/emit.out 2> $O/emit.err
echo "generation $(awk -F'\t' '$1=="coil-codegen" {s+=$4} END {printf "%.3f", s/1e9}' $O/emit.err) s"
for l in stdlib:src/stdlib compiler:src/compiler prelude.coil:src/compiler/prelude.coil; do [ -e $O/lib/coil/${l%%:*} ] || ln -s $R/${l#*:} $O/lib/coil/${l%%:*}; done
[ -e $O/bin/native ] || ln -s $R/build/bin/native $O/bin/native
A=$R/build/bin/native/curl/arm64-macos
cc $O/host.o -L$(llvm-config --libdir) -lLLVM -lm $A/libcurl.a $A/libmbedtls.a $A/libmbedx509.a $A/libmbedcrypto.a -framework CoreFoundation -framework SystemConfiguration -lz -Wl,-dead_strip -o $O/bin/coil
cp $C.toolchain $O/bin/coil.toolchain
echo built $O/bin/coil
