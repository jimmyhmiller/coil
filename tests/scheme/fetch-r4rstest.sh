#!/usr/bin/env bash
# Fetch Aubrey Jaffer's r4rstest.scm — the classic portable R5RS conformance
# suite (~677 assertions), used here as the north-star suite once the core is up.
#
# NOT vendored: it is GPL-licensed FSF code, and this repo is not GPL. Fetch it
# into an ignored path instead of committing it.
#
# ⚠ Run it from its own directory: the suite's I/O section opens "r4rstest.scm"
# by relative path, so it only passes with that file in the working directory.
#
#   tests/scheme/fetch-r4rstest.sh
#   (cd /tmp/r4rs && scheme --script r4rs-run.scm)
set -euo pipefail
DEST="${1:-/tmp/r4rs}"
mkdir -p "$DEST"
curl -sL -o "$DEST/r4rstest.scm" \
  "https://groups.csail.mit.edu/mac/ftpdir/scm/r4rstest.scm"

# R5RS folds character names, so `#\Space` is legal R5RS but rejected by the
# case-sensitive readers every modern implementation actually ships. Normalizing
# it is the documented divergence, not a fix to the suite's intent.
sed 's/#\\Space/#\\space/g; s/#\\Newline/#\\newline/g' \
    "$DEST/r4rstest.scm" > "$DEST/r4rs-run.scm"
printf '\n(test-cont)\n(test-sc4)\n(test-delay)\n(report-errs)\n' >> "$DEST/r4rs-run.scm"
echo "wrote $DEST/r4rs-run.scm"
