#!/usr/bin/env bash
set -uo pipefail

cd "$(dirname "$0")/../.."
COIL="${1:-build/bin/coil}"
COIL="$(cd "$(dirname "$COIL")" && pwd)/$(basename "$COIL")"
FIX="$PWD/tests/compiler/reader_metaprograms"
T=$(mktemp -d "$PWD/.coil-reader-test.XXXXXX")
trap 'rm -rf "$T"' EXIT

fail() { echo "reader metaprograms: FAIL — $1"; exit 1; }

"$COIL" check "$FIX/raw.answer" --use reader.fixture.raw || fail "raw fixture check"
"$COIL" build "$FIX/raw.answer" --use reader.fixture.raw -o "$T/raw" >/dev/null || fail "raw fixture build"
"$T/raw"; [ $? = 42 ] || fail "raw fixture run"
"$COIL" run "$FIX/config.sexpr" --use reader.fixture.config >/dev/null
[ $? = 42 ] || fail "configured s-expression run"

"$COIL" run "$FIX/raw.answer" --use reader.fixture.code-helper-get >/dev/null
[ $? = 42 ] || fail "reader context remains Code across a typed helper boundary"
"$COIL" run "$FIX/raw.answer" --use reader.fixture.code-helper-return >/dev/null
[ $? = 42 ] || fail "helper-returned Code remains a value in a reader provider"

"$COIL" check "$FIX/phase_closure_provider.coil" \
  || fail "ordinary-signature helper in reader comptime closure is dropped before mono"

"$COIL" check "$FIX/raw.answer" --use reader.fixture.fs \
  || fail "ordinary filesystem read/write from reader"
cmp -s "$FIX/raw.answer" /tmp/coil-reader-fs-provider.txt \
  || fail "reader filesystem write contents"
rm -f /tmp/coil-reader-fs-provider.txt

counter="$T/reader-count"
"$COIL" check "$FIX/raw.answer" --use reader.fixture.once -- "$counter" \
  || fail "single-invocation reader check"
[ "$(cat "$counter")" = x ] || fail "reader was invoked more than once"

"$COIL" run "$FIX/raw.answer" --use reader.fixture.computed >/dev/null
[ $? = 10 ] || fail "computed runtime string passed to code-read"
"$COIL" run "$FIX/raw.answer" "$FIX/config.sexpr" \
  --use reader.fixture.computed -- -I inc -DNAME=7 -include forced.h >/dev/null
[ $? = 25 ] || fail "aggregate reader inputs/arguments"

multi_plain=$("$COIL" check "$FIX/raw.answer" "$FIX/config.sexpr" 2>&1)
[ $? = 1 ] || fail "multiple inputs without a reader provider exit status"
case "$multi_plain" in
  *"multiple input files require exactly one registered read provider"*) ;;
  *) fail "multiple inputs without provider diagnostic: $multi_plain" ;;
esac

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

# A project may associate a suffix with a reader and give a guest file an
# explicit namespace. JSON has no comments, so this deliberately exercises the
# [modules] mapping rather than the optional first-line coil-module directive.
# The same entry imports a .kv module handled by a second provider, proving that
# one project dispatches recursive imports through a heterogeneous reader registry.
(cd "$FIX/json_project" && "$COIL" run >/dev/null)
[ $? = 48 ] || fail "manifest readers: multiple providers, explicit, path-derived, and coil-module imports"

expect_project_failure() {
  project="$1"
  phrase="$2"
  diagnostic=$(cd "$project" && "$COIL" check 2>&1)
  [ $? = 1 ] || fail "manifest reader negative case exited successfully: $phrase"
  case "$diagnostic" in
    *"$phrase"*) ;;
    *) fail "manifest reader diagnostic lacks '$phrase': $diagnostic" ;;
  esac
}

cp -R "$FIX/json_project" "$T/duplicate-reader"
printf '\n[readers]\n".json" = "reader.fixture.kv"\n' >> "$T/duplicate-reader/Coil.toml"
expect_project_failure "$T/duplicate-reader" "duplicate key '.json' in [readers]"

cp -R "$FIX/json_project" "$T/duplicate-module-path"
printf '\n[modules]\n"json-import.people-again" = "src/data/people.json"\n' \
  >> "$T/duplicate-module-path/Coil.toml"
expect_project_failure "$T/duplicate-module-path" "mapped to more than one module"

cp -R "$FIX/json_project" "$T/missing-provider"
perl -pi -e 's/reader\.fixture\.kv/reader.fixture.not-a-provider/' "$T/missing-provider/Coil.toml"
expect_project_failure "$T/missing-provider" "does not declare a reader-provider"

cp -R "$FIX/json_project" "$T/wrong-namespace"
perl -pi -e 's/\(const value 3\)/\(do \(module wrong.namespace\) \(const value 3\)\)/' \
  "$T/wrong-namespace/src/kv_reader.coil"
expect_project_failure "$T/wrong-namespace" "reader output declares namespace 'wrong.namespace'"

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
