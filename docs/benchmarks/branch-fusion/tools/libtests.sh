#!/bin/zsh
# libtests.sh LIBWORKTREE OUTDIR : run every tests/*.coil (stogir O3, debug checks), 6 parallel
H=${0:A:h}
W=$1; O=${2:A}; mkdir -p $O
cd $W
ls tests/*.coil | xargs -P 6 -n 1 $H/onetest.sh $O
for f in $O/*.rc; do r=$(cat $f); [ "$r" != 0 ] && echo "FAIL $(basename $f .rc) rc=$r"; done
echo "done $(ls $O/*.rc | wc -l) tests"
