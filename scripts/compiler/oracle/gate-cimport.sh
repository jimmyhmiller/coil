#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../../.."

compiler=${1:?usage: gate-cimport.sh COMPILER}
tmp=$(mktemp -d "${TMPDIR:-/tmp}/coil-cimport-gate.XXXXXX")
trap 'rm -rf "$tmp"' EXIT

"$compiler" cimport tests/compiler/cimport/expressions.h -o "$tmp/expressions.coil"
"$compiler" check "$tmp/expressions.coil"
grep -qF '(const COIL_OR_OPTION 260)' "$tmp/expressions.coil"
grep -qF '(const COIL_CAST_OPTION 512)' "$tmp/expressions.coil"
grep -qF '(array u8 37)' "$tmp/expressions.coil"
grep -qF '(defstruct coil_uninspectable :layout explicit' "$tmp/expressions.coil"

"$compiler" dump-load tests/compiler/cimport/selective.coil >"$tmp/selective.full"
grep -Eq '"extern".*"coil_selected_call".*"i32".*"\.\.\."' "$tmp/selective.full"
grep -Eq '"const".*"COIL_SELECTED_VALUE".* 41' "$tmp/selective.full"
if grep -qF 'coil_unselected_call' "$tmp/selective.full"; then
  echo 'selective cimport exposed an unselected function' >&2
  exit 1
fi
if grep -qF 'COIL_UNSELECTED_VALUE' "$tmp/selective.full"; then
  echo 'selective cimport exposed an unselected macro' >&2
  exit 1
fi

cat >"$tmp/extern-lint.coil" <<'EOF'
(module extern_lint)
(extern coil_selected_call :cc c [i32 i64] (-> i32)
        :header "tests/compiler/cimport/selective.h")
(defn main [] (-> i64) 0)
EOF
if "$compiler" lint "$tmp/extern-lint.coil" >"$tmp/lint.out" 2>"$tmp/lint.err"; then
  echo 'header-backed handwritten extern was not linted' >&2
  exit 1
fi
grep -qF 'handwritten extern duplicates a C header declaration' "$tmp/lint.err"
"$compiler" lint "$tmp/extern-lint.coil" --fix
grep -qF '(cimport "tests/compiler/cimport/selective.h" :use [coil_selected_call])' "$tmp/extern-lint.coil"
"$compiler" dump-load "$tmp/extern-lint.coil" >"$tmp/extern-lint.full"
grep -Eq '"extern".*"coil_selected_call".*"i32".*"\.\.\."' "$tmp/extern-lint.full"

if [[ $(uname -s) == Darwin ]]; then
  cat >"$tmp/ioctl-lint.coil" <<'EOF'
(module ioctl_lint)
(defstruct TerminalWindowSize
  [(rows u16) (columns u16) (x-pixels u16) (y-pixels u16)])
(extern ioctl :cc c [i32 u64 (ptr TerminalWindowSize)] (-> i32)
        :header "sys/ioctl.h")
(defn main [] (-> i64) 0)
EOF
  "$compiler" lint "$tmp/ioctl-lint.coil" --fix
  grep -qF '(cimport "sys/ioctl.h" :use [ioctl])' "$tmp/ioctl-lint.coil"
  "$compiler" dump-load "$tmp/ioctl-lint.coil" >"$tmp/ioctl-lint.full"
  grep -Eq '"extern".*"ioctl".*"i32".*"u64".*"\.\.\."' "$tmp/ioctl-lint.full"

  "$compiler" cimport pthread.h -o "$tmp/pthread.coil"
  "$compiler" check "$tmp/pthread.coil"
  grep -qF '_opaque_pthread_mutex_t' "$tmp/pthread.coil"
  grep -qF 'extern pthread_mutex_lock' "$tmp/pthread.coil"

  "$compiler" cimport sys/socket.h -o "$tmp/socket.coil"
  "$compiler" check "$tmp/socket.coil"
  grep -qF '(const SO_REUSEADDR ' "$tmp/socket.coil"
  grep -qF '(defstruct sockaddr ' "$tmp/socket.coil"
  grep -qF '(extern accept ' "$tmp/socket.coil"
fi

echo 'cimport gate: PASS'
