#!/bin/sh
set -eu

repo=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
jolt_dir=${JOLT_DIR:-"$repo/.coil/jolt-coil/jolt"}
count=${1:-1}
seed="$jolt_dir/host/chez/seed/prelude.ss"

case "$count" in
  ''|*[!0-9]*) echo "usage: $0 [POSITIVE-FORM-COUNT]" >&2; exit 2 ;;
esac
if [ "$count" -lt 1 ]; then
  echo "usage: $0 [POSITIVE-FORM-COUNT]" >&2
  exit 2
fi

chez=${JOLT_CHEZ:-}
if [ -z "$chez" ]; then
  if command -v chezscheme >/dev/null 2>&1; then chez=chezscheme
  elif command -v scheme >/dev/null 2>&1; then chez=scheme
  else echo "jolt-coil: Chez Scheme is required to adapt the seed" >&2; exit 1
  fi
fi

mkdir -p "$repo/.coil/jolt-coil/generated"
generated=$(mktemp "$repo/.coil/jolt-coil/generated/seed-prefix.XXXXXX.scm")
if [ "${COIL_KEEP_GENERATED:-0}" = "1" ]; then
  echo "jolt-coil: keeping generated seed module at $generated" >&2
else
  trap 'rm -f "$generated"' EXIT HUP INT TERM
fi

{
  printf '%s\n' '(module jolt-coil-seed-prefix)'
  printf '%s\n' '(import "coil.scheme" :use *)'
  printf '%s\n' '(import "jolt.coil.expression-runtime" :use *)'
  printf '%s\n' '(import "jolt.coil.core-runtime" :use *)'
  printf '%s\n' '(import "coil.scheme.stdproc" :as stdproc)'
  printf '%s\n' '(import "coil.primitive" :as primitive)'
  (cd "$jolt_dir" && "$chez" --script \
    "$repo/experiments/jolt-coil/emit-coil-expression.ss" \
    --seed-prefix "$seed" "$count")
  printf '%s\n' '(display (jolt-invoke1 (var-deref "clojure.core" "zero?") 0))'
  printf '%s\n' '(newline)'
  if [ "$count" -ge 18 ]; then
    printf '%s\n' '(display (jolt-count (jolt-invoke1 (var-deref "clojure.core" "destructure") (jolt-vector0))))'
    printf '%s\n' '(newline)'
  fi
  if [ "$count" -ge 22 ]; then
    printf '%s\n' '(display (jolt-first (jolt-invoke3 (var-deref "clojure.core" "defn") (jolt-symbol #f "twice") (jolt-vector1 (jolt-symbol #f "x")) (jolt-symbol #f "x"))))'
    printf '%s\n' '(newline)'
  fi
  if [ "$count" -ge 40 ]; then
    printf '%s\n' '(display (jolt-count (jolt-invoke3 (var-deref "clojure.core" "subvec") (jolt-vector3 10 20 30) 1 3)))'
    printf '%s\n' '(newline)'
  fi
  if [ "$count" -ge 70 ]; then
    printf '%s\n' '(display (jolt-invoke4 (var-deref "clojure.core" "max-key") (lambda (x) x) 2 9 4))'
    printf '%s\n' '(newline)'
  fi
  if [ "$count" -ge 78 ]; then
    printf '%s\n' '(let ((parts (jolt-invoke2 (var-deref "clojure.core" "split-at") 2 (jolt-vector4 1 2 3 4)))) (display (jolt-count (vector-ref parts 0))) (newline) (display (jolt-count (vector-ref parts 1))) (newline))'
  fi
  if [ "$count" -ge 97 ]; then
    printf '%s\n' '(display (jolt-invoke3 (var-deref "clojure.core" "distinct?") 1 2 3))'
    printf '%s\n' '(newline)'
  fi
  if [ "$count" -ge 222 ]; then
    printf '%s\n' '(let ((merged (jolt-invoke2 (var-deref "clojure.core" "merge") (jolt-hash-map4 (keyword #f "a") 1 (keyword #f "b") 2) (jolt-hash-map4 (keyword #f "b") 7 (keyword #f "c") 3)))) (display (jolt-count merged)) (newline) (display (jolt-get merged (keyword #f "b"))) (newline))'
    printf '%s\n' '(let ((merged (jolt-invoke3 (var-deref "clojure.core" "merge-with") (lambda (a b) (+ a b)) (jolt-hash-map2 (keyword #f "x") 4) (jolt-hash-map2 (keyword #f "x") 5)))) (display (jolt-get merged (keyword #f "x"))) (newline))'
  fi
  if [ "$count" -ge 383 ]; then
    printf '%s\n' '(let ((groups (jolt-invoke1 (var-deref "clojure.core" "group-by-head") (jolt-vector5 (jolt-symbol #f "a") 1 2 (jolt-symbol #f "b") 3)))) (display (jolt-count groups)) (newline) (display (jolt-count (jolt-nth groups 1))) (newline))'
  fi
} > "$generated"

coil run "$generated"
