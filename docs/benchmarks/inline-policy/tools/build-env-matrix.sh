#!/bin/zsh
# build-env-matrix.sh ROOT CANDIDATE OUTBASE CONFIGS [JOBS]: one host per line
# "name [COIL_STOGIR_X=value ...]".
R=$1; C=$2; O=$3; F=$4; J=${5:-3}
T=${0:a:h}
while read name rest; do
  [ -z "$name" ] && continue
  while [ $(jobs -r | wc -l) -ge $J ]; do sleep 1; done
  ( out=$(zsh $T/mkhost-env.sh $R $C $O/$name ${=rest} 2>&1); echo "$name: $(echo $out | tr '\n' ' ')" ) &
done < $F
wait
