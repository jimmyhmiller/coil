#!/bin/sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
machine=$(uname -m)
system=$(uname -s)

case "$system" in
  Darwin) target="$machine-macos" ;;
  Linux) target="$machine-linux" ;;
  *) echo "llhttp differential: $system is not supported" >&2; exit 1 ;;
esac

archive="$repo_dir/build/bin/native/llhttp/$target/libllhttp.a"
[ -f "$archive" ] || "$repo_dir/scripts/native/build-llhttp.sh"

"$repo_dir/build/bin/coil" test "$repo_dir/tests/llhttp_differential_test.coil"
