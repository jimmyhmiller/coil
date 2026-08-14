#!/usr/bin/env bash
# Reproducible baseline for Coil's zero-copy JSON tape. This intentionally measures
# only validate+index; dynamic and typed paths get separate commands as they land.
set -euo pipefail
cd "$(dirname "$0")/../.."

COIL="${COIL:-build/bin/coil}"
if [ ! -x "$COIL" ] && [ -x ../coil/build/bin/coil ]; then
  COIL=../coil/build/bin/coil
fi
command -v hyperfine >/dev/null || { echo "need hyperfine" >&2; exit 1; }
[ -x "$COIL" ] || { echo "need a Coil compiler (set COIL=...)" >&2; exit 1; }

revision=17b13dd2d7a5e5fdd5594e847077932f955b5e2b
data_dir="${JSON_BENCH_DATA:-/tmp/coil-json-benchmark-data}"
out_dir="${JSON_BENCH_OUT:-/tmp/coil-json-benchmark}"
mkdir -p "$data_dir" "$out_dir"

fetch_fixture() {
  name="$1"
  expected="$2"
  path="$data_dir/$name.json"
  if [ ! -f "$path" ]; then
    curl -fsSL "https://raw.githubusercontent.com/serde-rs/json-benchmark/$revision/data/$name.json" -o "$path"
  fi
  actual=$(shasum -a 256 "$path" | awk '{print $1}')
  [ "$actual" = "$expected" ] || { echo "$name.json checksum mismatch" >&2; exit 1; }
}

fetch_fixture twitter a08b769f32b95f426cbc3abafcec65c1a19d3eb544d4ddf320eae142c99efc5d
fetch_fixture citm_catalog a73e7a883f6ea8de113dff59702975e60119b4b58d451d518a929f31c92e2059
fetch_fixture canada f83b3b354030d5dd58740c68ac4fecef64cb730a0d12a90362a7f23077f50d78

"$COIL" build src/benchmarks/json_tape.coil -o "$out_dir/json_tape"

results=src/benchmarks/JSON_RESULTS.md
{
  echo "# JSON tape benchmark"
  echo
  echo "Fixture revision: \`$revision\`."
  echo
  echo "Host: \`$(uname -msr)\`. Coil: \`$($COIL --version 2>/dev/null || echo unknown)\`."
  echo
  echo "The input file is loaded once per process. Each timed command validates and indexes it 20 times and prints the accumulated token count."
  echo
} > "$results"

for name in twitter citm_catalog canada; do
  fixture="$data_dir/$name.json"
  expected=$("$out_dir/json_tape" "$fixture" 1)
  [ "$expected" -gt 0 ] || { echo "invalid semantic checksum for $name" >&2; exit 1; }
  bytes=$(wc -c < "$fixture" | tr -d ' ')
  hyperfine -N --warmup 3 --runs 10 \
    -n "Coil tape" "$out_dir/json_tape '$fixture' 20" \
    --export-markdown "$out_dir/$name.md"
  {
    echo "## \`$name.json\`"
    echo
    echo "Bytes: \`$bytes\`; tokens per parse: \`$expected\`."
    echo
    cat "$out_dir/$name.md"
    echo
  } >> "$results"
done

echo "wrote $results"
