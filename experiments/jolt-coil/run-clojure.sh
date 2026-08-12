#!/bin/sh
set -eu

if [ "$#" -ne 1 ]; then
  echo "usage: $0 FILE.clj" >&2
  exit 2
fi

repo=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
jolt_commit=865a79f4ba71abf1954b59cadaed94cb8b56816f
jolt_dir=${JOLT_DIR:-"$repo/.coil/jolt-coil/jolt"}
source_file=$1

if [ ! -f "$source_file" ]; then
  echo "jolt-coil: source file not found: $source_file" >&2
  exit 2
fi

if [ ! -d "$jolt_dir/.git" ]; then
  mkdir -p "$(dirname -- "$jolt_dir")"
  git clone https://github.com/jolt-lang/jolt.git "$jolt_dir"
  git -C "$jolt_dir" checkout --detach "$jolt_commit"
  git -C "$jolt_dir" submodule update --init --recursive
fi

actual_commit=$(git -C "$jolt_dir" rev-parse HEAD)
if [ "$actual_commit" != "$jolt_commit" ]; then
  echo "jolt-coil: expected Jolt $jolt_commit, found $actual_commit" >&2
  exit 1
fi

chez=${JOLT_CHEZ:-}
if [ -z "$chez" ]; then
  if command -v chezscheme >/dev/null 2>&1; then
    chez=chezscheme
  elif command -v scheme >/dev/null 2>&1; then
    chez=scheme
  else
    echo "jolt-coil: Chez Scheme is required to run the Jolt compiler" >&2
    exit 1
  fi
fi

source=$(tr '\n' ' ' < "$source_file")
emitted=$(cd "$jolt_dir" && "$chez" --script \
  "$repo/experiments/jolt-coil/emit-coil-expression.ss" "$source")

mkdir -p "$repo/.coil/jolt-coil/generated"
generated=$(mktemp "$repo/.coil/jolt-coil/generated/program.XXXXXX.scm")
trap 'rm -f "$generated"' EXIT HUP INT TERM

{
  printf '%s\n' '(module jolt-coil-generated)'
  printf '%s\n' '(import "coil.scheme" :use *)'
  printf '%s\n' '(import "jolt.coil.expression-runtime" :use *)'
  printf '%s\n' '(import "jolt.coil.core-runtime" :use *)'
  printf '%s\n' '(import "coil.scheme.stdproc" :as stdproc)'
  printf '%s\n' '(import "coil.primitive" :as primitive)'
  printf '%s\n' '(display'
  printf '  %s)\n' "$emitted"
  printf '%s\n' '(newline)'
} > "$generated"

coil run "$generated"
