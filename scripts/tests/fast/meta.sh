#!/usr/bin/env bash
# FAST: metaprograms end to end. Fixtures live in tests/meta/.
#
#   * `coil run` on a Code -> Code program: a transform file as the program over
#     stdin, two Code parameters read from two files, a generator whose output
#     compiles, a semantic checker whose error is located in the loaded file, and
#     the diagnostics for a wrong input count or a target that does not exist;
#   * hygiene in both directions: identifiers that must connect (quote, a shared
#     fresh identifier, an alias-qualified template name, a semantic transform's
#     own binder) and ones that must not (three captures reported in one run),
#     plus a checker suggestion whose replacement must not capture once it is
#     flattened into source text;
#   * staged metacompilation: a staged entry whose native result resumes into a
#     second increment, none of which reaches the runtime binary;
#   * transforms and checkers: macros inside macro bodies, a transform that adds
#     a definition running beside the identity transform, the same code run at
#     compile time and at run time, and a checker keyed on binding identity.
#
# Usage: scripts/tests/fast/meta.sh        (compiler from $COIL, else `coil`)
set -uo pipefail
cd "$(dirname "$0")/../../.."
COIL=${COIL:-$(command -v coil)}
[ -x "$COIL" ] || { echo "FAIL meta: no compiler (set COIL)"; exit 2; }
WORK=$(mktemp -d "${COIL_TEST_SCRATCH:-${TMPDIR:-/tmp}}/meta.XXXXXX") || exit 2
trap 'rm -rf "$WORK"' EXIT
M=tests/meta
fail=0

ok()  { echo "ok   $1"; }
bad() { echo "FAIL $1"; printf '%s\n' "$2" | head -40 | sed 's/^/     /'; fail=1; }
with_stdin() { local input=$1; shift; printf '%s\n' "$input" | "$@"; }

# expect NAME RC NEEDLE CMD...: CMD exits RC and its combined output contains NEEDLE.
expect() {
  local name=$1 want=$2 needle=$3; shift 3
  local out rc
  out=$("$@" 2>&1); rc=$?
  if [ "$rc" != "$want" ]; then bad "$name" "exit $rc, want $want: $out"; return; fi
  case "$out" in
    *"$needle"*) ok "$name" ;;
    *) bad "$name" "output lacks [$needle]: $out" ;;
  esac
}

# expect_stdout NAME WANT CMD...: CMD exits 0 and prints exactly WANT on stdout.
expect_stdout() {
  local name=$1 want=$2; shift 2
  local out rc
  out=$("$@" 2>"$WORK/stderr"); rc=$?
  if [ "$rc" != 0 ]; then bad "$name" "exit $rc: $(head -5 "$WORK/stderr")"; return; fi
  [ "$out" = "$want" ] && ok "$name" || bad "$name" "stdout [$out], want [$want]"
}

# ---- coil run on a Code -> Code program --------------------------------------
expect_stdout "run: a transform file is the program" "$(printf '(module stdin)\n(primitive/iadd 41 1)')" \
  with_stdin '(inc 41)' "$COIL" run $M/safe_dialect.coil

printf '(a) (b)\n' > "$WORK/in1.coil"
printf '(c)\n' > "$WORK/in2.coil"
expect_stdout "run: two Code parameters read two files" '(first-had 2 second-had 1)' \
  "$COIL" run $M/run_code_main_two.coil "$WORK/in1.coil" "$WORK/in2.coil"
expect "run: a wrong input count is a diagnostic" 1 'expects 2 Code inputs, got 1' \
  "$COIL" run $M/run_code_main_two.coil "$WORK/in1.coil"

if "$COIL" run $M/run_code_main_gen.coil >"$WORK/generated.coil" 2>"$WORK/gen.err"; then
  expect "run: a generator's output compiles and runs" 42 '' "$COIL" run "$WORK/generated.coil"
else
  bad "run: a generator's output compiles and runs" "$(cat "$WORK/gen.err")"
fi

out=$("$COIL" run $M/run_code_main_sem.coil $M/run_code_main_float.coil 2>"$WORK/sem.err"); rc=$?
sem_err=$(cat "$WORK/sem.err")
case "$rc|$out|$sem_err" in
  "1||"*"floating-point values are banned"*"run_code_main_float.coil:"*)
    ok "run: a semantic checker fails the run, located in the loaded file" ;;
  *) bad "run: a semantic checker fails the run, located in the loaded file" "exit $rc, stdout [$out], stderr: $sem_err" ;;
esac

expect "run: a target that is neither a file nor a namespace" 1 'no such file' "$COIL" run hello

# ---- hygiene -------------------------------------------------------------------
expect "hygiene: identifiers that must connect do" 42 '' "$COIL" run $M/hygiene_identity.coil

out=$("$COIL" check $M/hygiene_capture.coil 2>&1); rc=$?
case "$rc|$out" in
  *'$scope'*|*'$datum'*) bad "hygiene: captures report no internal scope key" "$out" ;;
  "1|"*"unbound variable 'total'"*"unbound variable 'state'"*"unbound variable 'hidden'"*"3 errors"*)
    ok "hygiene: three captures, each reported, in one run" ;;
  *) bad "hygiene: three captures, each reported, in one run" "exit $rc: $out" ;;
esac

# A suggestion's replacement is flattened into the author's file, where scope no
# longer exists: the rule's `tmp` must be renamed so it does not capture the
# author's `tmp`. The fixed program still returns 42 (2 if it captured).
cp $M/suggestion_capture_target.coil "$WORK/sug-target.coil"
sed 's/mt.suggestion-capture-rule/mt.suggestion-capture-copy/' $M/suggestion_capture_rule.coil > "$WORK/sug-rule.coil"
cp "$WORK/sug-rule.coil" "$WORK/sug-rule.before"
"$COIL" lint "$WORK/sug-target.coil" --use mt.suggestion-capture-copy --fix >"$WORK/sug.out" 2>&1
fixed=$(cat "$WORK/sug-target.coil")
case "$fixed" in
  *"(let [tmp__1 1]"*"(primitive/imul tmp tmp__1)"*)
    if cmp -s "$WORK/sug-rule.before" "$WORK/sug-rule.coil"; then
      expect "hygiene: lint --fix renames the rule's binder" 42 '' "$COIL" run "$WORK/sug-target.coil"
    else
      bad "hygiene: lint --fix renames the rule's binder" "--fix rewrote the checker module itself"
    fi ;;
  *) bad "hygiene: lint --fix renames the rule's binder" "$(cat "$WORK/sug.out")
$fixed" ;;
esac

# ---- staged metacompilation ---------------------------------------------------
# One build proves both: the expansion runs increment 1 natively, resumes
# through the dialect into increment 2 (which calls increment 1's helper) and
# yields 42, and none of the staged entries reach the runtime binary.
if "$COIL" build $M/staged_chain_test.coil -o "$WORK/chain" >"$WORK/chain.out" 2>&1; then
  symbols="$(nm "$WORK/chain" 2>&1) $(strings -a "$WORK/chain")"
  case "$symbols" in
    *chain-a-entry*|*chain-b-entry*|*chain-second*)
      bad "staged: entries run at expansion time and stay out of the binary" "a staged entry is in the binary" ;;
    *_main*) expect "staged: entries run at expansion time and stay out of the binary" 42 '' "$WORK/chain" ;;
    *) bad "staged: entries run at expansion time and stay out of the binary" "nm/strings printed no _main: $symbols" ;;
  esac
else
  bad "staged: entries run at expansion time and stay out of the binary" "$(cat "$WORK/chain.out")"
fi

# ---- transforms and checkers --------------------------------------------------
expect "transform: macros in macro bodies; one transform adds a definition beside the identity transform" \
  42 '' "$COIL" run $M/transforms_test.coil
expect "metaprogram: the same code at compile time and at run time" 0 'ALL IDENTICAL' \
  "$COIL" run $M/samecode_test.coil
out=$("$COIL" run $M/borrowlike_bad.coil 2>&1); rc=$?
uses=$(printf '%s\n' "$out" | grep -c "use after my-free")
if [ "$rc" != 0 ] && [ "$uses" = 2 ]; then
  ok "checker: binding identity tells a shadowed local from its namesake"
else
  bad "checker: binding identity tells a shadowed local from its namesake" "exit $rc, $uses errors (want 2): $out"
fi

if [ "$fail" = 0 ]; then echo "meta: PASS"; else echo "meta: FAILED"; exit 1; fi
