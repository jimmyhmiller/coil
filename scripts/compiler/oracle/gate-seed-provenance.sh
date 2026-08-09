#!/usr/bin/env bash
# Every committed bootstrap seed must say, verifiably, what it was built FROM.
#
# A seed is an opaque binary. The ONLY thing that makes it auditable is the commit
# recorded beside it, so a stamp that cannot be resolved makes the seed unauditable:
# you cannot date it, cannot reproduce it, and cannot tell whether it predates a
# change that matters. That is not hypothetical. `SEED_VERSION_LINUX` shipped for
# months naming a commit that does not exist in this repository:
#
#     $ git cat-file -t 9d6c8ef17fce230d133d3bcc11a2c53a58cf0878
#     fatal: git cat-file: could not get object info
#
# Nobody noticed, because nothing ever read the stamp. Meanwhile the binary it
# described could not compile the tree it shipped with, and a clean checkout could
# not bootstrap on Linux at all. This gate reads the stamps.
#
# It checks provenance, NOT freshness. A seed always predates the commit that ships
# it -- that is the normal relationship and not a defect. What must hold is that the
# commit is real, is in this history, and was not a dirty tree.
#
# Usage: scripts/compiler/oracle/gate-seed-provenance.sh
set -uo pipefail
cd "$(dirname "$0")/../../.."

fail=0
ok()  { echo "  ok   — $1"; }
bad() { echo "  FAIL — $1: $2"; fail=$((fail+1)); }

shopt -s nullglob
stamps=(bootstrap/seeds/native/SEED_VERSION*)
if [ ${#stamps[@]} = 0 ]; then
  echo "GATE FAIL: no SEED_VERSION* files found — did the seed directory move?"
  exit 2
fi

echo "== committed seeds name a resolvable commit in this history =="
for stamp in "${stamps[@]}"; do
  name=$(basename "$stamp")

  # `commit:` may carry a trailing marker (refresh-seed.sh appends one when the
  # working tree was dirty). Take the first field and judge the rest separately.
  line=$(grep -m1 '^commit:' "$stamp" 2>/dev/null)
  if [ -z "$line" ]; then
    bad "$name records a commit" "no 'commit:' line in $stamp"
    continue
  fi
  sha=$(printf '%s' "$line" | awk '{print $2}')

  case "$line" in
    *UNCOMMITTED*)
      # The stamp is honest, but a seed blessed from a dirty tree describes source
      # nobody else can obtain. Re-bless after committing.
      bad "$name was blessed from a committed tree" \
          "stamp says UNCOMMITTED working-tree changes; re-bless after committing" ;;
  esac

  if ! git cat-file -e "${sha}^{commit}" 2>/dev/null; then
    bad "$name names a commit that exists" \
        "$sha is not an object in this repository — the seed is unauditable"
    continue
  fi
  ok "$name names a commit that exists ($sha)"

  # In this history, not merely somewhere. A stamp pointing at a branch that was
  # rebased away resolves nowhere afterwards, which is how the case above happened.
  if git merge-base --is-ancestor "$sha" HEAD 2>/dev/null; then
    ok "$name's commit is an ancestor of HEAD"
  else
    bad "$name's commit is an ancestor of HEAD" \
        "$sha is not in HEAD's history — blessed on a branch? re-bless from main"
  fi
done

echo
if [ "$fail" = 0 ]; then
  echo "gate-seed-provenance: PASS"
  exit 0
else
  echo "gate-seed-provenance: $fail check(s) FAILED"
  exit 1
fi
