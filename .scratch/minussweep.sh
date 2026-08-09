#!/bin/zsh
cd /Users/jimmyhmiller/Documents/Code/projects/coil/.claude/worktrees/property-testing
hits=0; total=0
for i in 1 2 3 4 5 6 7 8 9 10 11 12; do
  out=$(COIL_PBT_CASES=200 COIL_PBT_SEED=$i COIL_STDLIB_DIR=. coil test .scratch/verify_alphabet.coil 2>&1)
  r=$(echo "$out" | grep -A1 "test canary-string-is-lone-minus" | grep -o "FAILED after [0-9]* cases")
  total=$((total+1))
  if [[ -n "$r" ]]; then hits=$((hits+1)); echo "seed $i: lone-minus generated ($r)"; else echo "seed $i: lone \"-\" NEVER generated in 200 cases"; fi
done
echo "---> lone \"-\" reached in $hits/$total seeds at the default case count"
