#!/usr/bin/env bash
# Build the demo twice from identical source — untapped and tapped — and run it.
#
#   src/experiments/httptap/scripts/demo.sh
#
# Nothing to set up: the demo talks to example.com. Pass a base URL to point it
# somewhere else.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
root="$(cd "$here/../../.." && pwd)"
out="${TMPDIR:-/tmp}/httptap-demo"
base="${1:-http://example.com}"
mkdir -p "$out"
cd "$root"

echo "== building WITHOUT the tap"
coil build "$here/demo.coil" -O0 -o "$out/demo-plain"
echo "== building WITH the tap (same source, one extra flag)"
coil build "$here/demo.coil" -O0 -o "$out/demo" --use httptap

echo
echo "== untapped run — nothing is recorded"
"$out/demo-plain" "$base"

echo
echo "== tapped run -> $out/http.jsonl"
COIL_HTTP_TAP="file://$out/http.jsonl" "$out/demo" "$base"

echo
echo "-- where each request came from (baked in at compile time):"
grep -o '"site":{[^}]*}' "$out/http.jsonl" | sed 's/^/   /'
echo
echo "-- one whole record:"
head -1 "$out/http.jsonl" | cut -c1-400 | sed 's/^/   /'
echo "   ..."

echo
echo "== tapped run -> $out/demo.har"
COIL_HTTP_TAP="har://$out/demo.har" "$out/demo" "$base" >/dev/null
echo "   open Chrome ▸ DevTools ▸ Network and drag in $out/demo.har"

echo
echo "== live Chrome DevTools, if you want it:"
echo "   COIL_HTTP_TAP=cdp://127.0.0.1:9229 COIL_HTTP_TAP_WAIT=1 $out/demo"
echo "   then open devtools://devtools/bundled/inspector.html?ws=127.0.0.1:9229/httptap"
