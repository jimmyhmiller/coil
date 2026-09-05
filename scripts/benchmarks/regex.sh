#!/bin/sh
set -eu

cd "$(dirname "$0")/../.."
compiler=${COIL_REGEX_COMPILER:-build/bin/coil}
out=${COIL_REGEX_BENCH_OUT:-/tmp/coil-regex-benchmark}
mkdir -p "$out"

"$compiler" build src/benchmarks/regex_literal.coil -o "$out/coil-literal"
"$compiler" build src/benchmarks/regex_nfa.coil -o "$out/coil-nfa"
cargo build --release --manifest-path scripts/benchmarks/regex-rust/Cargo.toml \
  --target-dir "$out/rust-target"
rust="$out/rust-target/release/coil-regex-benchmark-rust"

for executable in "$out/coil-literal" "$out/coil-nfa"; do
  test "$("$executable")" = 0
done
test "$("$rust" literal)" = 0
test "$("$rust" nfa)" = 0

hyperfine --warmup 3 --runs 15 --export-json "$out/literal.json" \
  --command-name coil "$out/coil-literal" \
  --command-name rust-regex "$rust literal"
hyperfine --warmup 3 --runs 15 --export-json "$out/nfa.json" \
  --command-name coil "$out/coil-nfa" \
  --command-name rust-regex "$rust nfa"

echo "raw benchmark JSON: $out/literal.json $out/nfa.json"
