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

"$COIL" run "$FIX/hygiene_binder.sexpr" --use reader.fixture.config >/dev/null
[ $? = 42 ] || fail "code-read template binder captured use-site syntax"

code_read_hygiene=$(
  "$COIL" check "$FIX/hygiene_reference.sexpr" --use reader.fixture.config 2>&1
)
[ $? = 1 ] || fail "code-read use-site binder captured template reference"
case "$code_read_hygiene" in
  *"unbound variable 'x'"*) ;;
  *) fail "code-read reference hygiene diagnostic: $code_read_hygiene" ;;
esac

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

BF="$PWD/tests/read_metaprogram"
hello=$("$COIL" run "$BF/hello.bf" --use reader.fixture.brainfuck) \
  || fail "Brainfuck hello run"
[ "$hello" = "Hello World!" ] || fail "Brainfuck hello output: $hello"
echoed=$(printf 'reader metaprogram\n' | "$COIL" run "$BF/echo.bf" --use reader.fixture.brainfuck) \
  || fail "Brainfuck echo run"
[ "$echoed" = "reader metaprogram" ] || fail "Brainfuck echo output: $echoed"
"$COIL" run "$BF/pointer_underflow.bf" --use reader.fixture.brainfuck >/dev/null 2>&1
[ $? = 3 ] || fail "Brainfuck pointer underflow exit status"
"$COIL" run "$BF/pointer_overflow.bf" --use reader.fixture.brainfuck >/dev/null 2>&1
[ $? = 2 ] || fail "Brainfuck pointer overflow exit status"
for side in open close; do
  diag=$("$COIL" check "$BF/unmatched_${side}.bf" --use reader.fixture.brainfuck 2>&1)
  [ $? = 1 ] || fail "Brainfuck unmatched $side exit status"
  case "$diag" in
    *"brainfuck reader: unmatched"*) ;;
    *) fail "Brainfuck unmatched $side diagnostic: $diag" ;;
  esac
done

# ---- the Brainfuck acceptance probe (docs/design/FULL_HYGIENE_MIGRATION.md) --
# "another generated `dp`, `cells`, `cell` … with the same printed spelling
# cannot alter the reader output's binding graph". `reader.fixture.bf-collide`
# injects consts with exactly those spellings into the module the reader emitted.
# The liveness case runs first: if the probe silently stopped injecting, the
# Brainfuck result below would prove nothing.
"$COIL" run "$FIX/bf_collide_live.coil" --use reader.fixture.bf-collide >/dev/null 2>&1
[ $? = 42 ] || fail "collision probe is not injecting — the acceptance check would be vacuous"

collided=$("$COIL" run "$BF/hello.bf" --use reader.fixture.brainfuck --use reader.fixture.bf-collide) \
  || fail "Brainfuck run under colliding spellings"
[ "$collided" = "Hello World!" ] \
  || fail "colliding cells/dp/cell changed the reader's binding graph: $collided"

# Four thousand flat operations is enough to expose the historical quadratic
# quasiquote suffix-splicing implementation while keeping the generated module
# itself reasonable for the focused gate.
"$COIL" check "$BF/flat.bf" --use reader.fixture.brainfuck \
  || fail "large flat Brainfuck source"

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
