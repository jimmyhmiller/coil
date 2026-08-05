#!/bin/sh
# Streaming HTTP client acceptance tests. Starts the fragment-flushing test server, runs
# the Coil integration binary, and reports its exit code (0 = all checks passed; every
# other value names one check — see tests/http_client_stream_integration.coil).
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
coil=${1:-"$repo_dir/build/bin/coil"}

python3 "$repo_dir/tests/http_client_stream_server.py" &
server_pid=$!
trap 'kill "$server_pid" 2>/dev/null || true; wait "$server_pid" 2>/dev/null || true' EXIT HUP INT TERM
sleep 1

# COIL_STDLIB_DIR so an in-tree stdlib edit is what gets tested, not the copy embedded in
# whatever compiler binary happens to be on hand.
COIL_STDLIB_DIR="$repo_dir" "$coil" build \
  "$repo_dir/tests/http_client_stream_integration.coil" \
  -o /tmp/coil-http-stream-test

if /tmp/coil-http-stream-test; then
  echo "http streaming gate: PASS"
else
  echo "http streaming gate: FAIL (check code $?)"
  exit 1
fi
