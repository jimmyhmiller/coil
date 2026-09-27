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

"$compiler" cimport tests/compiler/cimport/opaque.h -o "$tmp/opaque.coil"
"$compiler" check "$tmp/opaque.coil"
grep -qF '(defstruct coil_opaque_session [])' "$tmp/opaque.coil"
grep -qF '(extern coil_opaque_session_create :cc c [] (-> (ptr coil_opaque_session)))' "$tmp/opaque.coil"
grep -qF '(extern coil_opaque_session_destroy :cc c [(ptr coil_opaque_session)] (-> void))' "$tmp/opaque.coil"

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

# A system header's API includes the headers it includes: macOS <stdlib.h>
# declares qsort and abs in <_stdlib.h>, and clang spells size_t parameters
# through its predefined __size_t.
"$compiler" cimport stdlib.h -o "$tmp/stdlib.coil"
"$compiler" check "$tmp/stdlib.coil"
stdlib_bindings=$(cat "$tmp/stdlib.coil")
for fn in qsort abs malloc free abort exit; do
  case "$stdlib_bindings" in
    *"(extern $fn "*) ;;
    *) echo "cimport stdlib.h did not emit $fn" >&2; exit 1 ;;
  esac
done

# An anonymous record named by its typedef is emitted under the typedef's name.
cat >"$tmp/anon.h" <<'EOF'
typedef struct { int width; int height; } ReproSize;
void repro_size(ReproSize *size);
EOF
"$compiler" cimport "$tmp/anon.h" -o "$tmp/anon.coil"
grep -qF '(defstruct ReproSize [(width i32) (height i32)])' "$tmp/anon.coil"
"$compiler" check "$tmp/anon.coil"

# A project wrapper keeps its system includes out, unless a name is selected;
# a selected struct brings the records its fields need.
cat >"$tmp/wrapper.h" <<'EOF'
#include <stdlib.h>
#include <sys/stat.h>
int wrapper_own(int);
EOF
"$compiler" cimport "$tmp/wrapper.h" -o "$tmp/wrapper.coil"
wrapper_bindings=$(cat "$tmp/wrapper.coil")
case "$wrapper_bindings" in
  *"(extern qsort "*) echo 'a project wrapper header exposed its system includes' >&2; exit 1 ;;
esac
case "$wrapper_bindings" in
  *"(extern wrapper_own "*) ;;
  *) echo 'a project wrapper header lost its own declaration' >&2; exit 1 ;;
esac
cat >"$tmp/selected.coil" <<EOF
(module selected_system)
(cimport "$tmp/wrapper.h" :use [fstat stat])
(defn main [] (-> i64)
  (let [(mut st) (zeroed stat)]
    (cast i64 (fstat -1 (cast (ptr stat) 0)))))
EOF
"$compiler" check "$tmp/selected.coil"

cat >"$tmp/sort.coil" <<'EOF'
(module system_sort)
(cimport "stdlib.h" :use [qsort abs malloc free])
(defn compare [(a (ptr i8)) (b (ptr i8))] (-> i32)
  (let [x (load (cast (ptr i64) a)) y (load (cast (ptr i64) b))]
    (cond (< x y) -1 (> x y) 1 :else 0)))
(defn main [] (-> i64)
  (let [p (cast (ptr i64) (malloc 24))]
    (store! (index p 0) 30)
    (store! (index p 1) 10)
    (store! (index p 2) 20)
    (qsort (cast (ptr i8) p) 3 8 (fnptr-of compare))
    (let [r (+ (load (index p 0)) (cast i64 (abs -2)))]
      (free (cast (ptr i8) p))
      r)))
EOF
set +e
"$compiler" run "$tmp/sort.coil"
rc=$?
set -e
[ "$rc" = 12 ] || { echo "system-header cimport program exited $rc, want 12" >&2; exit 1; }

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
