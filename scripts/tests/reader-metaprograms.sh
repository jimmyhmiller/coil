#!/usr/bin/env bash
set -uo pipefail

cd "$(dirname "$0")/../.."
COIL="${1:-build/bin/coil}"
COIL="$(cd "$(dirname "$COIL")" && pwd)/$(basename "$COIL")"
FIX="$PWD/tests/compiler/reader_metaprograms"
T=$(mktemp -d)
trap 'rm -rf "$T"' EXIT

fail() { echo "reader metaprograms: FAIL — $1"; exit 1; }

"$COIL" check "$FIX/raw.answer" --use reader.fixture.raw || fail "raw fixture check"
"$COIL" build "$FIX/raw.answer" --use reader.fixture.raw -o "$T/raw" >/dev/null || fail "raw fixture build"
"$T/raw"; [ $? = 42 ] || fail "raw fixture run"
"$COIL" run "$FIX/config.sexpr" --use reader.fixture.config >/dev/null
[ $? = 42 ] || fail "configured s-expression run"

ambiguous=$("$COIL" check "$FIX/raw.answer" \
  --use reader.fixture.raw --use reader.fixture.second 2>&1)
ambiguous_rc=$?
[ "$ambiguous_rc" = 1 ] || fail "ambiguous providers exit status"
case "$ambiguous" in
  *"more than one --use module declares a reader provider"*) ;;
  *) fail "ambiguous providers diagnostic" ;;
esac

type_error=$("$COIL" check "$FIX/raw.answer" --use reader.fixture.type-error 2>&1)
[ $? = 1 ] || fail "provider type error exit status"
case "$type_error" in
  *"Code"*) ;;
  *) fail "provider type error diagnostic" ;;
esac

runtime_error=$("$COIL" check "$FIX/raw.answer" --use reader.fixture.runtime-error 2>&1)
[ $? = 1 ] || fail "provider execution error exit status"
case "$runtime_error" in
  *"reader fixture execution failed"*) ;;
  *) fail "provider execution diagnostic" ;;
esac

"$COIL" check tests/compiler/features/named_call_source_order.coil \
  || fail "ordinary Coil check parity"

mkdir -p "$T/prefix/bin" "$T/prefix/lib/coil" "$T/out"
cp "$COIL" "$T/prefix/bin/coil"
cp -R src/stdlib "$T/prefix/lib/coil/stdlib"
cp -R src/compiler "$T/prefix/lib/coil/compiler"
cp src/compiler/prelude.coil "$T/prefix/lib/coil/prelude.coil"
cp "$FIX/raw_provider.coil" "$T/out/provider.coil"
cp "$FIX/raw.answer" "$T/out/program.answer"
(cd "$T/out" && COIL_STRICT_BUNDLE=1 "$T/prefix/bin/coil" check program.answer --use reader.fixture.raw) \
  || fail "strict installed bundle from outside the repository"

echo "reader metaprograms: PASS"
