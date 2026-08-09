#!/bin/zsh
cd /Users/jimmyhmiller/Documents/Code/projects/coil/.claude/worktrees/property-testing
for i in 1 2 3 4 5 6 7 8; do
  out=$(COIL_PBT_CASES=200 COIL_PBT_SEED=$i COIL_STDLIB_DIR=. coil test .scratch/verify_canary.coil 2>&1)
  minres=$(echo "$out" | grep -A1 "test canary-i64-min-drawn" | grep -o "FAILED after [0-9]* cases" || echo "NEVER-FIRED(vacuous)")
  churn=$(echo "$out" | grep -A1 "test canary-churn-n-ge-5" | grep -o "FAILED after [0-9]* cases" || echo "NEVER-FIRED(vacuous)")
  echo "seed $i: i64MIN=[$minres]  churn>=5=[$churn]"
done
