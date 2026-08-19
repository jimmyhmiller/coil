#!/usr/bin/env bash
# `coil run` on a code->code program (docs/design/RUN_METAPROGRAMS.md): a file
# whose `main` has a Code signature runs as a metaprogram — inputs (files or
# stdin) are read as Code, the invocation is one ordinary expand-macro through
# the standard engine, and the returned Code prints to stdout (a `(do …)`
# result splices to top-level forms, the `(meta …)` generator convention).
#
# What this pins:
#   * identity + a REAL existing metaprogram (safedialect.desugar-inc, called
#     unchanged from a two-line wrapper main) print byte-expected source;
#   * a generator's output is a compilable program (run it, expect exit 42);
#   * multiple Code params map to multiple input files; stdin works via pipes;
#   * a located warn points into the actual input file and exits 0;
#   * an input-count mismatch is a clean diagnostic and exit 1;
#   * a normal (non-Code main) program still runs exactly as before.
#
# Usage: scripts/compiler/oracle/gate-run-meta.sh <coil-binary>
set -uo pipefail
cd "$(dirname "$0")/../../.."
BIN=${1:?usage: gate-run-meta.sh <coil-binary>}
[ -x "$BIN" ] || { echo "GATE FAIL: binary not executable: $BIN"; exit 2; }

WORK=$(mktemp -d); trap 'rm -rf "$WORK"' EXIT
fail=0

expect_out() { # name command... : compare stdout to $EXPECT exactly
  local name=$1; shift
  local got
  got=$("$@" 2>"$WORK/err") || { echo "GATE FAIL: $name: exit $? ($(head -1 "$WORK/err"))"; fail=1; return; }
  if [ "$got" != "$EXPECT" ]; then
    echo "GATE FAIL: $name"; echo "  expected: $EXPECT"; echo "  got:      $got"; fail=1
  fi
}

# ---- identity over stdin ----------------------------------------------------
EXPECT='((hello 42))'
expect_out identity-stdin sh -c "echo '(hello 42)' | '$BIN' run tests/metaprogramming/run_code_main_id.coil"

# ---- an EXISTING metaprogram, unchanged, behind a wrapper main --------------
EXPECT='(primitive/iadd 41 1)'
expect_out existing-desugar sh -c "echo '(inc 41)' | '$BIN' run tests/metaprogramming/run_code_main_inc.coil"

# ---- two Code params = two input files --------------------------------------
printf '(a) (b)\n' > "$WORK/in1.coil"; printf '(c)\n' > "$WORK/in2.coil"
EXPECT='(first-had 2 second-had 1)'
expect_out two-inputs "$BIN" run tests/metaprogramming/run_code_main_two.coil "$WORK/in1.coil" "$WORK/in2.coil"

# ---- a macro (cond) inside main's body --------------------------------------
EXPECT='(many forms)'
expect_out tower-cond sh -c "echo '(x) (y)' | '$BIN' run tests/metaprogramming/run_code_main_tower.coil"

# ---- generator: (do …) splices to a compilable program ----------------------
"$BIN" run tests/metaprogramming/run_code_main_gen.coil > "$WORK/generated.coil" 2>"$WORK/err" \
  || { echo "GATE FAIL: generator run failed"; fail=1; }
"$BIN" run "$WORK/generated.coil" >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: generated program exited $rc, want 42"; fail=1; }

# ---- located warn into a FRAGMENT input (stdin contract); warns exit 0 ------
out=$(printf '(defn f [] (icmp-gt 2 1))\n' | "$BIN" run tests/metaprogramming/run_code_main_lint.coil 2>"$WORK/lint.err")
rc=$?
[ "$rc" = 0 ] || { echo "GATE FAIL: lint run exited $rc, want 0"; fail=1; }
[ "$out" = '(scanned)' ] || { echo "GATE FAIL: lint stdout: $out"; fail=1; }
grep -q 'prefer > over icmp-gt' "$WORK/lint.err" || { echo "GATE FAIL: warn text missing"; fail=1; }
grep -q 'stdin:1:12' "$WORK/lint.err" || { echo "GATE FAIL: warn not located in the input"; fail=1; }

# ---- LOADED code base: warn located in the target's own file; exit 0 --------
out=$("$BIN" run tests/metaprogramming/run_code_main_warn.coil tests/metaprogramming/run_code_main_target_a.coil 2>"$WORK/warn.err")
rc=$?
[ "$rc" = 0 ] || { echo "GATE FAIL: loaded warn exited $rc, want 0"; fail=1; }
[ "$out" = '(scanned)' ] || { echo "GATE FAIL: loaded warn stdout: $out"; fail=1; }
grep -q 'target has a main' "$WORK/warn.err" || { echo "GATE FAIL: loaded warn text missing"; fail=1; }
grep -q 'run_code_main_target_a.coil:8' "$WORK/warn.err" || { echo "GATE FAIL: loaded warn not located in the target file"; fail=1; }

# ---- LOADED code base: an EXISTING SEMANTIC checker (nofloat) as a program --
# type-of answers about the target because the base is checked in-pipeline;
# report fails the run exactly as it fails a build.
"$BIN" run tests/metaprogramming/run_code_main_sem.coil tests/metaprogramming/run_code_main_float.coil >"$WORK/sem.out" 2>"$WORK/sem.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: semantic checker exited $rc, want 1"; fail=1; }
grep -q 'floating-point values are banned' "$WORK/sem.err" || { echo "GATE FAIL: semantic report missing"; fail=1; }
grep -q 'run_code_main_float.coil' "$WORK/sem.err" || { echo "GATE FAIL: semantic report not located in the target"; fail=1; }
[ -s "$WORK/sem.out" ] && { echo "GATE FAIL: semantic failure printed to stdout"; fail=1; }

# ---- LOADED code base, clean target: same checker passes; exit 0 ------------
"$BIN" run tests/metaprogramming/run_code_main_sem.coil tests/metaprogramming/run_code_main_id.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 0 ] || { echo "GATE FAIL: semantic checker on clean base exited $rc, want 0"; fail=1; }

# ---- input-count mismatch is a clean diagnostic -----------------------------
"$BIN" run tests/metaprogramming/run_code_main_two.coil "$WORK/in1.coil" 2>"$WORK/arity.err" >/dev/null
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: arity mismatch exited $rc, want 1"; fail=1; }
grep -q 'expects 2 Code inputs, got 1' "$WORK/arity.err" || { echo "GATE FAIL: arity diagnostic missing"; fail=1; }

# ---- pipes compose ----------------------------------------------------------
EXPECT='(((hello 42)))'
expect_out pipe-compose sh -c "echo '(hello 42)' | '$BIN' run tests/metaprogramming/run_code_main_id.coil | '$BIN' run tests/metaprogramming/run_code_main_id.coil"


# ---- registrations ARE the entry: point run at a metaprogram file directly --
# safe_dialect.coil has (transform desugar-inc) and no main; running the FILE
# applies its registered stack to the input, no wrapper. Output is printed as
# a FILE (module records invert loading), so the full loop closes: a program
# that is invalid until transformed goes through the transform-as-a-program,
# and the emitted file compiles and runs.
EXPECT=$(printf '(module stdin)\n(primitive/iadd 41 1)')
expect_out registration-entry sh -c "echo '(inc 41)' | '$BIN' run tests/metaprogramming/safe_dialect.coil"

cat > "$WORK/uses_inc.coil" <<'COILEOF'
(module usesinc)
(import "coil.primitive" :as primitive)
(defn main [] (-> i64) (inc 41))
COILEOF
"$BIN" run tests/metaprogramming/safe_dialect.coil "$WORK/uses_inc.coil" > "$WORK/desugared.coil" 2>"$WORK/rt.err" \
  || { echo "GATE FAIL: registration round-trip transform failed"; fail=1; }
"$BIN" run "$WORK/desugared.coil" >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: desugared program exited $rc, want 42"; fail=1; }

# ---- a reader-provider registration IS the entry: raw bytes in, code out ----
# src/stdlib/brainfuck.coil declares only (reader-provider …) and no main;
# running the FILE feeds each input's RAW bytes through the provider (the same
# (read-context PATH SRC entry) contract --use hands it) and prints the
# emitted module, which compiles and runs — the loop closes on foreign syntax.
"$BIN" run src/stdlib/brainfuck.coil tests/read_metaprogram/hello.bf > "$WORK/bf_hello.coil" 2>"$WORK/bf.err" \
  || { echo "GATE FAIL: reader-entry run failed ($(head -1 "$WORK/bf.err"))"; fail=1; }
out=$("$BIN" run "$WORK/bf_hello.coil" 2>/dev/null)
[ "$out" = "Hello World!" ] || { echo "GATE FAIL: reader-entry round trip printed '$out'"; fail=1; }

# ---- a module NAME as the run target (no wrapper, no path) -------------------
got=$("$BIN" run coil.brainfuck tests/read_metaprogram/hello.bf 2>"$WORK/bfname.err") \
  || { echo "GATE FAIL: module-name target failed ($(head -1 "$WORK/bfname.err"))"; fail=1; }
[ "$got" = "$(cat "$WORK/bf_hello.coil")" ] \
  || { echo "GATE FAIL: module-name target output differs from the file target's"; fail=1; }

# ---- reader entry over stdin; a reader diagnostic fails the run cleanly ------
printf '++++++++[>++++++++<-]>+.' | "$BIN" run coil.brainfuck > "$WORK/bf_a.coil" 2>/dev/null \
  || { echo "GATE FAIL: reader-entry stdin run failed"; fail=1; }
out=$("$BIN" run "$WORK/bf_a.coil" 2>/dev/null)
[ "$out" = "A" ] || { echo "GATE FAIL: reader-entry stdin round trip printed '$out'"; fail=1; }
printf '+++[+.' | "$BIN" run coil.brainfuck >"$WORK/bfbad.out" 2>"$WORK/bfbad.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: reader diagnostic exited $rc, want 1"; fail=1; }
grep -q "unmatched '\['" "$WORK/bfbad.err" || { echo "GATE FAIL: reader diagnostic text missing"; fail=1; }
[ -s "$WORK/bfbad.out" ] && { echo "GATE FAIL: reader failure printed to stdout"; fail=1; }

# ---- an unresolvable target is a clean diagnostic, never a crash ------------
# A bare name that is neither a readable file nor a resolvable namespace is the
# ordinary typo case (`coil run hello`). It must fail the way a missing path
# fails; resolving the target must not crash on the way there.
for bad in hello nosuchthing coil.nosuch; do
  "$BIN" run "$bad" >"$WORK/bad.out" 2>"$WORK/bad.err"
  rc=$?
  [ "$rc" = 1 ] || { echo "GATE FAIL: 'coil run $bad' exited $rc, want 1"; fail=1; }
  grep -q "no such file" "$WORK/bad.err" || { echo "GATE FAIL: 'coil run $bad' missing the missing-file diagnostic"; fail=1; }
done

# ---- two reader providers in one entry file is an error, not last-wins ------
cat > "$WORK/dup_reader.coil" <<'COILEOF'
(module duprdr)
(import "coil.primitive" :as primitive)
(import "coil.brainfuck.reader" :use [read-brainfuck])
(reader-provider "coil.brainfuck.reader" read-brainfuck)
(reader-provider "coil.brainfuck.reader" read-brainfuck)
COILEOF
printf '+.' | "$BIN" run "$WORK/dup_reader.coil" >"$WORK/dup.out" 2>"$WORK/dup.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: duplicate reader-provider exited $rc, want 1"; fail=1; }
grep -q "more than one reader provider" "$WORK/dup.err" \
  || { echo "GATE FAIL: duplicate reader-provider diagnostic missing"; fail=1; }

# ---- a normal program is untouched ------------------------------------------
EXPECT='n=-42 hex=ff ok=true'
expect_out normal-run "$BIN" run src/examples/fmt.coil

if [ "$fail" = 0 ]; then echo "gate-run-meta: OK"; else echo "gate-run-meta: FAILED"; exit 1; fi
