#!/bin/sh
# COMPREHENSIVE: the HTTP client against local servers (libcurl, bundled).
#
#   scripts/tests/http.sh [compiler]       (default: $COIL, then build/bin/coil)
#
# The buffered client against tests/http/client_server.py, then the streaming
# client against the fragment-flushing tests/http/client_stream_server.py; each
# integration binary exits 0 or with a code naming the check that failed.
set -eu
repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
coil=${1:-${COIL:-"$repo_dir/build/bin/coil"}}
work=$(mktemp -d "${COIL_TEST_SCRATCH:-${TMPDIR:-/tmp}}/coil-http.XXXXXX")
server_pid=
cleanup() {
  [ -n "$server_pid" ] && { kill "$server_pid" 2>/dev/null || true; wait "$server_pid" 2>/dev/null || true; }
  rm -rf "$work"
}
trap cleanup EXIT HUP INT TERM
# Run from the checkout, so the library under test is this tree's.
cd "$repo_dir"

for pair in "client_server.py client_integration.coil buffered" \
            "client_stream_server.py client_stream_integration.coil streaming"; do
  set -- $pair
  "$coil" build "tests/http/$2" -o "$work/$3"
  python3 "tests/http/$1" &
  server_pid=$!
  sleep 1
  if "$work/$3"; then
    echo "ok   the $3 HTTP client passes against its local server"
  else
    echo "FAIL the $3 HTTP client (check code $?)"
    exit 1
  fi
  kill "$server_pid" 2>/dev/null || true
  wait "$server_pid" 2>/dev/null || true
  server_pid=
done
echo "http: PASS"
