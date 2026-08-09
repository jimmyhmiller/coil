#!/bin/sh
# Run a list of coil test files against the edited stdlib, one line of result each.
cd "$(dirname "$0")/.." || exit 1
for f in "$@"; do
  printf '%s: ' "$f"
  COIL_STDLIB_DIR=. coil test "$f" 2>&1 | tail -1
done
