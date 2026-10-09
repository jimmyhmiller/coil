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
# Folding a header's macros is one or two clang runs, not one per macro: it used
# to take ~45 s and 1.4 GB for <unistd.h>. 20 s is a regression ceiling that
# stays clear of a loaded CI host.
start=$(date +%s)
"$compiler" cimport unistd.h -o "$tmp/unistd.coil"
elapsed=$(( $(date +%s) - start ))
[ "$elapsed" -lt 20 ] || { echo "cimport unistd.h took ${elapsed}s" >&2; exit 1; }
grep -qF '(extern access ' "$tmp/unistd.coil"

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
ReproSize repro_size_value(int width, int height);
typedef ReproSize ReproSizeAlias;
ReproSizeAlias repro_size_alias(void);
EOF
"$compiler" cimport "$tmp/anon.h" -o "$tmp/anon.coil"
grep -qF '(defstruct ReproSize [(width i32) (height i32)])' "$tmp/anon.coil"
grep -qF '(extern repro_size_value :cc c [i32 i32] (-> ReproSize))' "$tmp/anon.coil"
grep -qF '(extern repro_size_alias :cc c [] (-> ReproSize))' "$tmp/anon.coil"
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

# `:use` can select an enumerator of an enum, anonymous or named, without
# pulling in the enum's other enumerators.
cat >"$tmp/enums.h" <<'EOF'
enum { COIL_POLL_IN = 1, COIL_POLL_OUT = 4 };
enum coil_color { COIL_RED, COIL_BLUE = 7 };
EOF
cat >"$tmp/enums.coil" <<EOF
(module selected_enums)
(cimport "$tmp/enums.h" :use [COIL_POLL_IN COIL_BLUE])
(defn main [] (-> i64) (+ (cast i64 COIL_POLL_IN) (cast i64 COIL_BLUE)))
EOF
set +e
"$compiler" run "$tmp/enums.coil"
rc=$?
set -e
[ "$rc" = 8 ] || { echo "selected enumerators program exited $rc, want 8" >&2; exit 1; }
"$compiler" dump-load "$tmp/enums.coil" >"$tmp/enums.full"
if grep -qF 'COIL_POLL_OUT' "$tmp/enums.full"; then
  echo 'selective cimport exposed an unselected enumerator' >&2
  exit 1
fi

# A clang step that fails is an error, not a quietly smaller binding: with a
# clang whose macro dump fails, cimport used to exit 0 with no #defines.
mkdir -p "$tmp/failing-clang"
real_clang=$(command -v clang)
cat >"$tmp/failing-clang/clang" <<EOF
#!/bin/sh
case "\$*" in *-dM*) echo "simulated macro-dump failure" >&2; exit 1;; esac
exec "$real_clang" "\$@"
EOF
chmod +x "$tmp/failing-clang/clang"
set +e
fail_out=$(PATH="$tmp/failing-clang:$PATH" "$compiler" cimport "$tmp/enums.h" -o "$tmp/failed.coil" 2>&1)
fail_rc=$?
set -e
[ "$fail_rc" != 0 ] || { echo 'cimport succeeded although clang failed' >&2; exit 1; }
case "$fail_out" in
  *"simulated macro-dump failure"*) ;;
  *) echo "cimport did not report clang's failure: $fail_out" >&2; exit 1 ;;
esac

# Clang runs are counted, not timed: a counting clang logs each run.
mkdir -p "$tmp/counting-clang"
cat >"$tmp/counting-clang/clang" <<EOF
#!/bin/sh
printf '%s\n' "\$*" >>"$tmp/clang-runs.log"
exec "$real_clang" "\$@"
EOF
chmod +x "$tmp/counting-clang/clang"
clang_runs() { : >"$tmp/clang-runs.log"; PATH="$tmp/counting-clang:$PATH" "$@"; }
count_runs() { grep -c -e "$1" "$tmp/clang-runs.log" || true; }

# Every record cimport keeps opaque is folded by ONE clang run that dumps only the
# probe enum. Each used to be folded alone, by a full AST dump of the header: for
# the Mach headers that was 82 dumps of 25 MB of JSON per cimport.
clang_runs "$compiler" cimport tests/compiler/cimport/opaque_records.h -o "$tmp/opaque_records.coil"
"$compiler" check "$tmp/opaque_records.coil"
opaque_records=$(cat "$tmp/opaque_records.coil")
for record in "0 16" "7 16" "8 24" "23 32"; do
  set -- $record
  case "$opaque_records" in
    *"(defstruct coil_opaque_record_$1 :layout explicit :size $2 :align 8 [])"*) ;;
    *) echo "opaque record $1 was not laid out as $2 bytes" >&2; exit 1 ;;
  esac
done
dumps=$(count_runs '-ast-dump=json')
filtered=$(count_runs '-ast-dump-filter=__coilprobes')
[ "$((dumps - filtered))" = 1 ] || { echo "cimport parsed the whole header $((dumps - filtered)) times, want 1" >&2; exit 1; }
[ "$filtered" -le 2 ] || { echo "cimport folded 24 opaque records in $filtered clang runs, want at most 2" >&2; exit 1; }

# One process loads a program many times (lint --fix: once per round, once per
# salvage trial, once to report); its cimports run clang once. The fix below takes
# two rounds, so three analyses, and must cost the clang runs of one check.
cat >"$tmp/fix-cimport.coil" <<EOF
(module fix_cimport)
(import "coil.primitive" :as primitive)
(cimport "$PWD/tests/compiler/cimport/selective.h" :use [coil_selected_call COIL_SELECTED_VALUE])
(defn main [] (-> i64) (primitive/iadd COIL_SELECTED_VALUE 1))
EOF
cp "$tmp/fix-cimport.coil" "$tmp/fix-cimport.orig"
clang_runs "$compiler" check "$tmp/fix-cimport.coil"
check_runs=$(count_runs '')
clang_runs "$compiler" lint "$tmp/fix-cimport.coil" --fix 2>"$tmp/fix-cimport.err"
fix_runs=$(count_runs '')
grep -qF '(+ COIL_SELECTED_VALUE 1)' "$tmp/fix-cimport.coil"
[ "$fix_runs" = "$check_runs" ] || { echo "lint --fix ran clang $fix_runs times, one load runs it $check_runs times" >&2; exit 1; }

# Each analysis releases what it acquired: the unit holds as many resources after
# the third analysis as after the first. Expansion arenas used to stay registered
# until the command ended, one set per --fix round.
cp "$tmp/fix-cimport.orig" "$tmp/fix-cimport.coil"
COIL_TRACE=1 "$compiler" lint "$tmp/fix-cimport.coil" --fix >/dev/null 2>"$tmp/fix-cimport.trace"
resource_lines=$(grep 'coil-trace count lint.unit-resources ' "$tmp/fix-cimport.trace" || true)
resource_counts=$(printf '%s\n' "$resource_lines" | awk 'NF {print $NF}' | sort -u)
analyses=$(printf '%s\n' "$resource_lines" | grep -c . || true)
[ "$analyses" -ge 3 ] || { echo "lint --fix ran $analyses analyses, want at least 3" >&2; exit 1; }
[ "$(printf '%s\n' "$resource_counts" | wc -l | tr -d ' ')" = 1 ] || { echo "unit resources grew across lint analyses: $resource_counts" >&2; exit 1; }

# Lint's source facts copy the resolver's declaration inventory once per resolve,
# not once per qualified form: that was 8,380 copies, 2.7 GB, for one analysis of
# a 40k-line project. A program of many forms shows the difference.
{
  echo '(module many_forms)'
  echo '(defn f0 [] (-> i64) 0)'
  for i in $(seq 1 60); do echo "(defn f$i [] (-> i64) (+ (f$((i - 1))) 1))"; done
  echo '(defn main [] (-> i64) (f60))'
} >"$tmp/many-forms.coil"
COIL_TRACE=1 "$compiler" lint "$tmp/many-forms.coil" >/dev/null 2>"$tmp/many-forms.trace"
captures=$(grep -c 'coil-trace count source-facts.declaration-capture ' "$tmp/many-forms.trace" || true)
resolves=$(grep -c 'coil-trace end frontend.resolve.qualify ' "$tmp/many-forms.trace" || true)
[ "$captures" -ge 1 ] || { echo 'lint recorded no declaration inventory' >&2; exit 1; }
[ "$captures" -le "$resolves" ] || { echo "lint copied the declaration inventory $captures times in $resolves resolves" >&2; exit 1; }

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
