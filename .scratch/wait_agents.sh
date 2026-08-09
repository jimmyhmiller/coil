#!/bin/sh
# Block until at least $1 build/verify agents have reported into the workflow journal.
J=/Users/jimmyhmiller/.claude/projects/-Users-jimmyhmiller-Documents-Code-projects-coil--claude-worktrees-property-testing/37eccc5b-d0f3-4c26-bf3b-5c1f2feefe0f/subagents/workflows/wf_383203fc-3d9/journal.jsonl
WANT=${1:-6}
while true; do
  N=$(grep -c '"type":"result"' "$J" 2>/dev/null || echo 0)
  if [ "$N" -ge "$WANT" ]; then
    echo "results=$N"
    exit 0
  fi
  sleep 30
done
