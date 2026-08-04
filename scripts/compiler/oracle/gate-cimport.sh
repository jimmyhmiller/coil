#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../../.."

compiler=${1:?usage: gate-cimport.sh COMPILER}
tmp=$(mktemp -d "${TMPDIR:-/tmp}/coil-cimport-gate.XXXXXX")
trap 'rm -rf "$tmp"' EXIT

"$compiler" cimport tests/compiler/cimport/expressions.h -o "$tmp/expressions.coil"
"$compiler" check "$tmp/expressions.coil"
rg -qF '(const COIL_OR_OPTION 260)' "$tmp/expressions.coil"
rg -qF '(const COIL_CAST_OPTION 512)' "$tmp/expressions.coil"
rg -qF '(array u8 37)' "$tmp/expressions.coil"
rg -qF '(defstruct coil_uninspectable :layout explicit' "$tmp/expressions.coil"

if [[ $(uname -s) == Darwin ]]; then
  "$compiler" cimport pthread.h -o "$tmp/pthread.coil"
  "$compiler" check "$tmp/pthread.coil"
  rg -qF '_opaque_pthread_mutex_t' "$tmp/pthread.coil"
  rg -qF 'extern pthread_mutex_lock' "$tmp/pthread.coil"

  "$compiler" cimport sys/socket.h -o "$tmp/socket.coil"
  "$compiler" check "$tmp/socket.coil"
  rg -qF '(const SO_REUSEADDR ' "$tmp/socket.coil"
  rg -qF '(defstruct sockaddr ' "$tmp/socket.coil"
  rg -qF '(extern accept ' "$tmp/socket.coil"
fi

echo 'cimport gate: PASS'
