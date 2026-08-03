#!/bin/sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
upstream=${1:-}

if [ -z "$upstream" ]; then
  work_dir=$(mktemp -d)
  trap 'rm -rf "$work_dir"' EXIT HUP INT TERM
  archive="$work_dir/llhttp.tar.gz"
  upstream="$work_dir/source"
  mkdir -p "$upstream"
  curl -fsSL https://github.com/nodejs/llhttp/archive/refs/tags/v9.4.3.tar.gz -o "$archive"
  actual=$(shasum -a 256 "$archive" | awk '{print $1}')
  expected=d3897ec6263ba1eed13ecc37d54e9c42d6bb6f04c7852490bc8a7ef5326c53e1
  [ "$actual" = "$expected" ] || {
    echo "regenerate llhttp: upstream archive checksum mismatch" >&2
    exit 1
  }
  tar -xzf "$archive" -C "$upstream" --strip-components=1
  (cd "$upstream" && npm ci)
fi

[ -f "$upstream/package.json" ] || {
  echo "regenerate llhttp: invalid upstream checkout: $upstream" >&2
  exit 1
}

cd "$repo_dir/scripts/llhttp"
npm ci
npm run check
npm run generate -- --upstream "$upstream" --output "$repo_dir/src/stdlib/llhttp_generated.coil"
npx tsx generate-corpus.ts "$upstream" "$repo_dir/tests/llhttp_corpus_generated_test.coil"
"$repo_dir/build/bin/coil" fmt --write \
  "$repo_dir/src/stdlib/llhttp_generated.coil" \
  "$repo_dir/tests/llhttp_corpus_generated_test.coil"
