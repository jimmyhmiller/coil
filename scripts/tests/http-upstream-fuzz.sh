#!/bin/sh
set -eu

# Run tests/fuzz/http_upstream_fuzz.coil -- coil.http.parser and coil.http.server
# against upstream C llhttp 9.4.3 -- as a fuzzing campaign. Arguments go to
# `coil fuzz` (e.g. --time 300 --jobs 4 --sanitize=address).
#
# `coil fuzz` takes its link inputs from the Coil.toml in the working directory,
# so the campaign runs in build/fuzz/http-upstream/, whose manifest links the
# oracle archive; its corpus persists there between runs.

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
coil=${COIL:-"$repo_dir/build/bin/coil"}
machine=$(uname -m)
system=$(uname -s)

case "$system" in
  Darwin) target="$machine-macos" ;;
  Linux) target="$machine-linux" ;;
  *) echo "http upstream fuzz: $system is not supported" >&2; exit 1 ;;
esac

archive="$repo_dir/build/bin/native/llhttp/$target/libllhttp.a"
[ -f "$archive" ] || "$repo_dir/scripts/native/build-llhttp.sh"

run_dir="$repo_dir/build/fuzz/http-upstream"
mkdir -p "$run_dir"
cp "$repo_dir/tests/fuzz/http_fuzz.coil" "$repo_dir/tests/fuzz/http_upstream_fuzz.coil" "$run_dir/"
cat > "$run_dir/Coil.toml" <<TOML
[package]
name = "http-upstream-fuzz"
entry = "http_upstream_fuzz.coil"

[link]
objects = ["$archive"]
TOML

cd "$run_dir"
exec "$coil" fuzz http_upstream_fuzz.coil "$@"
