#!/bin/zsh
# build-matrix.sh ROOT CANDIDATE OUTBASE CONFIGS [JOBS]: one host per "name policy" line.
R=$1; C=$2; O=$3; F=$4; J=${5:-3}
T=${0:a:h}
while read name policy; do
  [ -z "$name" ] && continue
  while [ $(jobs -r | wc -l) -ge $J ]; do sleep 1; done
  ( out=$(zsh $T/mkhost-policy.sh $R $C $O/$name "$policy" 2>&1); echo "$name: $(echo $out | tr '\n' ' ')" ) &
done < $F
wait
