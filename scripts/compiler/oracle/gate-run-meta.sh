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

# The source inventory is part of the hygiene contract: every explicit syntax
# producer must remain classified, and reviewed locations may not drift.
python3 scripts/hygiene-audit.py --check || fail=1

expect_out() { # name command... : compare stdout to $EXPECT exactly
  local name=$1; shift
  local got
  got=$("$@" 2>"$WORK/err") || { echo "GATE FAIL: $name: exit $? ($(head -1 "$WORK/err"))"; fail=1; return; }
  if [ "$got" != "$EXPECT" ]; then
    echo "GATE FAIL: $name"; echo "  expected: $EXPECT"; echo "  got:      $got"; fail=1
  fi
}

# ---- per-call macro arenas start small --------------------------------------
# Assert backing capacity through mtrace, not RSS: malloc may recycle released
# segments and hide an oversized per-invocation reservation on some platforms.
{
  printf '(module macro_arena.repro)\n'
  printf '(defn passthrough [(x Code)] (-> Code) x)\n'
  awk 'BEGIN { for (i = 0; i < 100; i++) printf "(defn f%d [] (-> i64) (passthrough %d))\\n", i, i }'
} > "$WORK/macro-arena.coil"
COIL_MTRACE=mem "$BIN" expand "$WORK/macro-arena.coil" >/dev/null 2>"$WORK/macro-arena.err"
rc=$?
[ "$rc" = 0 ] || { echo "GATE FAIL: macro arena capacity fixture exited $rc"; fail=1; }
arena_total=$(awk -F ' \\| ' '/macro_arena\.repro\.passthrough$/ { print $4 }' "$WORK/macro-arena.err")
[ -n "$arena_total" ] || { echo "GATE FAIL: macro arena reservation metric missing"; fail=1; }
[ "$arena_total" -le 1048576 ] 2>/dev/null \
  || { echo "GATE FAIL: 100 trivial macros requested $arena_total backing bytes, want <= 1048576"; fail=1; }

# Nested macros transport an already-owned argument tree through each result.
# Promotion must copy the invocation-owned shell, not recursively duplicate the
# persistent argument at every level; the checker must likewise visit shared,
# context-identical expression nodes once. Poison mode proves shared children do
# not retain aliases into the recycled invocation arena.
awk 'BEGIN {
  x = "0"
  for (i = 0; i < 1500; i++) x = "(wrap " x ")"
  print "(module macro_arena.nested)"
  print "(defn wrap [(x Code)] (-> Code) `(cast i64 ~x))"
  print "(defn main [] (-> i64) " x ")"
}' > "$WORK/macro-arena-nested.coil"
COIL_META_ARENA=poison "$BIN" expand "$WORK/macro-arena-nested.coil" >/dev/null 2>"$WORK/macro-arena-nested.err"
rc=$?
[ "$rc" = 0 ] \
  || { echo "GATE FAIL: nested macro ownership fixture exited $rc ($(head -1 "$WORK/macro-arena-nested.err"))"; fail=1; }

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
grep -q 'run_code_main_target_a.coil:14' "$WORK/warn.err" || { echo "GATE FAIL: loaded warn not located in the target file"; fail=1; }

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

# ---- syntax identity across independently evaluated templates --------------
# Equal display spelling is not a binding relationship. The implicit generator
# and reader-provider cases must fail; explicitly reusing one gensym must work.
"$BIN" check tests/compiler/hygiene/implicit_cross_template_capture.coil >"$WORK/hyg-implicit.out" 2>"$WORK/hyg-implicit.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: implicit cross-template capture exited $rc, want 1"; fail=1; }
grep -q "unbound variable 'state'" "$WORK/hyg-implicit.err" \
  || { echo "GATE FAIL: implicit cross-template capture diagnostic missing"; fail=1; }

"$BIN" run tests/compiler/hygiene/explicit_cross_template_identity.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: explicit cross-template identity exited $rc, want 42"; fail=1; }

"$BIN" run tests/compiler/hygiene/identity_transport.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: syntax identity transport exited $rc, want 42"; fail=1; }

"$BIN" run tests/compiler/features/code_collections.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 0 ] || { echo "GATE FAIL: Code collection traits exited $rc, want 0"; fail=1; }

for fixture in implicit_parameter_capture implicit_match_capture implicit_mut_capture implicit_sequential_initializer_capture; do
  "$BIN" check "tests/compiler/hygiene/$fixture.coil" >"$WORK/hyg-$fixture.out" 2>"$WORK/hyg-$fixture.err"
  rc=$?
  [ "$rc" = 1 ] || { echo "GATE FAIL: $fixture exited $rc, want 1"; fail=1; }
  grep -q "unbound variable" "$WORK/hyg-$fixture.err" \
    || { echo "GATE FAIL: $fixture diagnostic missing"; fail=1; }
done

for fixture in explicit_parameter_identity explicit_match_identity explicit_mut_identity explicit_sequential_initializer_identity explicit_type_parameter_identity; do
  "$BIN" run "tests/compiler/hygiene/$fixture.coil" >/dev/null 2>&1
  rc=$?
  [ "$rc" = 42 ] || { echo "GATE FAIL: $fixture exited $rc, want 42"; fail=1; }
done

"$BIN" check tests/compiler/hygiene/implicit_type_parameter_capture.coil \
  >"$WORK/hyg-type-param.out" 2>"$WORK/hyg-type-param.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: implicit type-parameter capture exited $rc, want 1"; fail=1; }
grep -q "unknown type" "$WORK/hyg-type-param.err" \
  || { echo "GATE FAIL: implicit type-parameter capture diagnostic missing"; fail=1; }

for fixture in identifier_api free_identifier_equality explicit_capture_api; do
  "$BIN" run "tests/compiler/hygiene/$fixture.coil" >/dev/null 2>&1
  rc=$?
  [ "$rc" = 42 ] || { echo "GATE FAIL: $fixture exited $rc, want 42"; fail=1; }
done

"$BIN" check tests/compiler/hygiene/use_site_binder_cannot_capture.coil \
  >"$WORK/hyg-use-site.out" 2>"$WORK/hyg-use-site.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: use-site binder capture exited $rc, want 1"; fail=1; }
grep -q "unbound variable" "$WORK/hyg-use-site.err" \
  || { echo "GATE FAIL: use-site binder capture diagnostic missing"; fail=1; }

"$BIN" check tests/compiler/hygiene/code_symbol_is_not_identifier.coil \
  >"$WORK/hyg-code-symbol.out" 2>"$WORK/hyg-code-symbol.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: code-symbol identifier misuse exited $rc, want 1"; fail=1; }
grep -q "unscoped generated identifier 'temporary'" "$WORK/hyg-code-symbol.err" \
  || { echo "GATE FAIL: code-symbol identifier misuse diagnostic missing"; fail=1; }

# The machine-readable syntax audit runs the authoritative resolver/checker and
# must fail closed too; it may not emit a successful scoped dump for unknown
# provenance in an identifier position.
"$BIN" dump-hygiene tests/compiler/hygiene/code_symbol_is_not_identifier.coil \
  >"$WORK/hyg-dump.out" 2>"$WORK/hyg-dump.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: dump-hygiene unknown provenance exited $rc, want 1"; fail=1; }
grep -q "unscoped generated identifier 'temporary'" "$WORK/hyg-dump.out" \
  || { echo "GATE FAIL: dump-hygiene did not fail closed"; fail=1; }
grep -q '^(forms' "$WORK/hyg-dump.out" \
  && { echo "GATE FAIL: dump-hygiene emitted a successful audit after failure"; fail=1; }

"$BIN" run tests/compiler/hygiene/definition_site_value.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: definition-site value exited $rc, want 42"; fail=1; }

"$BIN" check tests/compiler/hygiene/definition_site_import.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 0 ] || { echo "GATE FAIL: definition-site imported value exited $rc, want 0"; fail=1; }

"$BIN" check tests/compiler/hygiene/moduleless_ambient_definition_site.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 0 ] || { echo "GATE FAIL: module-less ambient definition-site reference exited $rc, want 0"; fail=1; }

"$BIN" run tests/compiler/hygiene/moduleless_local_trait_resolution.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 111 ] || { echo "GATE FAIL: module-less local trait resolution exited $rc, want 111"; fail=1; }

"$BIN" check tests/compiler/hygiene/reader_implicit_capture.coil \
  --use hygiene.reader-implicit-capture >"$WORK/hyg-reader.out" 2>"$WORK/hyg-reader.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: reader implicit capture exited $rc, want 1"; fail=1; }
grep -q "unbound variable 'state'" "$WORK/hyg-reader.err" \
  || { echo "GATE FAIL: reader implicit capture diagnostic missing"; fail=1; }


# ---- the remaining metaprogram boundaries -----------------------------------
# Variadic arguments and `~@` splicing, a macro whose expansion expands another
# macro, and both transform phases. Each positive fixture is arranged so that a
# capture in EITHER direction changes the answer, not just fails to compile.
for fixture in explicit_variadic_splice_identity nested_macro_expansion_identity \
               before_expand_transform_identity semantic_transform_identity \
               semantic_transform_primitive after_expand_transform_identity; do
  "$BIN" run "tests/compiler/hygiene/$fixture.coil" >/dev/null 2>&1
  rc=$?
  [ "$rc" = 42 ] || { echo "GATE FAIL: $fixture exited $rc, want 42"; fail=1; }
done

for fixture in implicit_variadic_splice_capture before_expand_transform_capture \
               semantic_transform_capture; do
  "$BIN" check "tests/compiler/hygiene/$fixture.coil" >"$WORK/hyg-$fixture.out" 2>"$WORK/hyg-$fixture.err"
  rc=$?
  [ "$rc" = 1 ] || { echo "GATE FAIL: $fixture exited $rc, want 1"; fail=1; }
  grep -q "unbound variable" "$WORK/hyg-$fixture.err" \
    || { echo "GATE FAIL: $fixture diagnostic missing"; fail=1; }
done

# ---- what spelling a template may use for a definition-site name ------------
# A bare function name in a template already resolved where the template was
# WRITTEN. The other two spellings did not, and the asymmetry is what
# .../experiments/macro-hygiene reported: an alias-qualified name was re-resolved
# against the CALL site (where a file-local nickname means nothing, or worse,
# something else), and a bare TYPE name did not resolve at all.
#
# Both fixtures are adversarial on purpose. The caller binds the same alias to a
# different module that exports the same function, and has a competing `Box` in
# bare scope -- so "it happened to work" and "it resolved correctly" give
# different answers. On the pre-migration compiler the alias case exits 12: it
# silently called the caller's decoy.
"$BIN" run tests/compiler/hygiene/definition_site_alias.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: alias-qualified template reference exited $rc, want 42 (12 = resolved at the call site)"; fail=1; }

"$BIN" run tests/compiler/hygiene/definition_site_type.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: bare type name in a template exited $rc, want 42"; fail=1; }

# The same family, one level further in: a trait named in a generic BOUND. The
# provider does not export it, so nothing but definition-site resolution can find
# it. This one never worked, on either compiler.
"$BIN" run tests/compiler/hygiene/definition_site_bound.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: definition-site trait in a bound exited $rc, want 42"; fail=1; }

# ---- the trait-method hygiene pairs -----------------------------------------
# tests/compiler/hygiene/README.md documents an expected result for each of these
# and nothing ran them, so a regression in one sat in the tree unnoticed: a
# template-generated `deftrait` had become invisible to the `impl` generated
# beside it (user9). They print their answer, so the OUTPUT is what is checked.
check_out() { # name file expected-output
  local got
  got=$("$BIN" run "tests/compiler/hygiene/$2.coil" 2>&1 | tr '\n' ' ' | sed 's/ *$//')
  [ "$got" = "$3" ] || { echo "GATE FAIL: $1 ($2): got [$got], want [$3]"; fail=1; }
}
check_out "trait method captured"          user   "0"
check_out "ordinary fn control"            user2  "42"
check_out "primitive spelling control"     user3  "0"
check_out "two modules declare mine"       user5  "7"
check_out "derived Eq method binder"       user6  "0"
check_out "spliced method binder"          user7  "1"
check_out "library binder + local trait"   user8  "42"
check_out "macro-GENERATED deftrait"       user9  "21"
check_out "user trait named like extern"   user10 "5"
check_out "pattern head vs defn name"      user11 "7 111"
check_out "arity-directed fallback"        user12 "5"
check_out "arith width interaction probe"  arith_widths "3 3 10"

"$BIN" test tests/compiler/hygiene/user4.coil >/dev/null 2>&1
[ $? != 0 ] || { echo "GATE FAIL: user4 must FAIL under coil test"; fail=1; }

"$BIN" check tests/compiler/hygiene/user13.coil >"$WORK/u13.out" 2>"$WORK/u13.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: user13 exited $rc, want 1 (explicit qualification must not fall back)"; fail=1; }

"$BIN" run tests/compiler/hygiene/definition_site_trait_method.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: definition_site_trait_method exited $rc, want 42"; fail=1; }

# ---- plain `quote` is syntax, not a spelling ---------------------------------
# `'name` is metaprogram-authored syntax exactly as a quasiquote literal is. It
# used to alias the AST node in the SOURCE scope, so it bound by spelling: a
# template binding `~'tmp` around caller syntax captured the caller's `tmp`, and
# two independently evaluated `'name`s connected to each other. Neither is
# reachable through the source audit, because `'` is not a producer primitive.
"$BIN" run tests/compiler/hygiene/quote_identity.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: quote_identity exited $rc, want 42 (0 = the template captured the caller)"; fail=1; }

"$BIN" check tests/compiler/hygiene/quote_capture.coil >"$WORK/quote.out" 2>"$WORK/quote.err"
rc=$?
[ "$rc" = 1 ] || { echo "GATE FAIL: quote_capture exited $rc, want 1"; fail=1; }
grep -q "unbound variable 'hidden'" "$WORK/quote.err" \
  || { echo "GATE FAIL: quote_capture diagnostic missing"; fail=1; }

# ---- checker suggestions: the boundary whose output is SOURCE TEXT ----------
# A replacement is flattened into the author's file, where lexical scope no
# longer exists, so the renderer has to disambiguate the rule's identifier from
# the author's. The rule deliberately writes a bare template binder: the fix must
# be correct for the naive rule, not only for one that remembered to call
# `fresh-identifier`. Verified end to end — the rewritten file still returns 42.
cp tests/compiler/hygiene/suggestion_capture_target.coil "$WORK/sug-target.coil"
"$BIN" lint "$WORK/sug-target.coil" --use hygiene.suggestion-capture-rule \
  >"$WORK/sug.out" 2>"$WORK/sug.err"
grep -q "help: try: (let \[tmp__1 1\] (primitive/imul tmp tmp__1))" "$WORK/sug.err" \
  || { echo "GATE FAIL: suggestion did not disambiguate the rule's binder"; \
       grep 'help: try:' "$WORK/sug.err"; fail=1; }
"$BIN" lint "$WORK/sug-target.coil" --use hygiene.suggestion-capture-rule --fix >/dev/null 2>&1
grep -q "tmp__1" "$WORK/sug-target.coil" \
  || { echo "GATE FAIL: --fix did not write the disambiguated binder"; fail=1; }
"$BIN" run "$WORK/sug-target.coil" >/dev/null 2>&1
rc=$?
[ "$rc" = 42 ] || { echo "GATE FAIL: fixed program exited $rc, want 42 (the fix captured)"; fail=1; }

# A semantic transform gives generated syntax a representative user span so
# diagnostics and code-from-user? still work. That span is not editable source:
# modernize may recognize the generated primitive form, but --fix must not replace
# the transform call site with a rewrite of code that was never present there.
cp tests/compiler/features/transform_generated_fix_target.coil "$WORK/generated-fix.coil"
generated_before=$(cat "$WORK/generated-fix.coil")
"$BIN" lint "$WORK/generated-fix.coil" --fix >"$WORK/generated-fix.out" 2>"$WORK/generated-fix.err"
rc=$?
[ "$rc" = 0 ] || { echo "GATE FAIL: generated-provenance lint exited $rc"; cat "$WORK/generated-fix.err"; fail=1; }
generated_after=$(cat "$WORK/generated-fix.coil")
[ "$generated_after" = "$generated_before" ] \
  || { echo "GATE FAIL: --fix edited a transform-generated node's representative source span"; fail=1; }
"$BIN" check "$WORK/generated-fix.coil" >/dev/null 2>&1 \
  || { echo "GATE FAIL: generated-provenance target no longer checks after lint --fix"; fail=1; }

# ---- scoped resolver keys are internal --------------------------------------
# The parser lowers binders/references to `$scope<N>@<module>$<name>` keys. Those
# numbers are compilation-internal and name nothing the author can find, so no
# diagnostic may print one — including embedded in a generated function's name.
for fixture in implicit_parameter_capture implicit_type_parameter_capture \
               implicit_match_capture use_site_binder_cannot_capture; do
  "$BIN" check "tests/compiler/hygiene/$fixture.coil" >"$WORK/key.out" 2>"$WORK/key.err"
  if grep -q '[$]scope\|[$]datum' "$WORK/key.err" "$WORK/key.out"; then
    echo "GATE FAIL: $fixture leaked an internal scope key into a diagnostic"
    grep -o '[^ ]*[$]\(scope\|datum\)[^ ]*' "$WORK/key.err" | sort -u | head -2
    fail=1
  fi
done

# ---- the OTHER metaprogram engine ------------------------------------------
# Identity has to be a property of the syntax objects, not of the engine that
# produced them: COIL_META_INTERP=1 runs the same matrix on the bytecode
# interpreter (what a wasm sandbox uses) instead of the native metaprogram image.
for fixture in identity_transport explicit_cross_template_identity identifier_api \
               free_identifier_equality explicit_capture_api quote_identity \
               explicit_variadic_splice_identity nested_macro_expansion_identity \
               before_expand_transform_identity semantic_transform_identity \
               after_expand_transform_identity \
               semantic_transform_primitive; do
  COIL_META_INTERP=1 "$BIN" run "tests/compiler/hygiene/$fixture.coil" >/dev/null 2>&1
  rc=$?
  [ "$rc" = 42 ] || { echo "GATE FAIL: interpreter engine: $fixture exited $rc, want 42"; fail=1; }
done

COIL_META_INTERP=1 "$BIN" run tests/compiler/features/code_collections.coil >/dev/null 2>&1
rc=$?
[ "$rc" = 0 ] || { echo "GATE FAIL: interpreter engine: Code collection traits exited $rc, want 0"; fail=1; }

for fixture in implicit_cross_template_capture implicit_variadic_splice_capture \
               use_site_binder_cannot_capture before_expand_transform_capture \
               semantic_transform_capture quote_capture; do
  COIL_META_INTERP=1 "$BIN" check "tests/compiler/hygiene/$fixture.coil" \
    >"$WORK/interp.out" 2>"$WORK/interp.err"
  rc=$?
  [ "$rc" = 1 ] || { echo "GATE FAIL: interpreter engine: $fixture exited $rc, want 1"; fail=1; }
  grep -q "unbound variable" "$WORK/interp.err" \
    || { echo "GATE FAIL: interpreter engine: $fixture diagnostic missing"; fail=1; }
done

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
# tests/compiler/reader_metaprograms/brainfuck.coil declares only (reader-provider …) and no main;
# running the FILE feeds each input's RAW bytes through the provider (the same
# (read-context PATH SRC entry) contract --use hands it) and prints the
# emitted module, which compiles and runs — the loop closes on foreign syntax.
"$BIN" run tests/compiler/reader_metaprograms/brainfuck.coil tests/read_metaprogram/hello.bf > "$WORK/bf_hello.coil" 2>"$WORK/bf.err" \
  || { echo "GATE FAIL: reader-entry run failed ($(head -1 "$WORK/bf.err"))"; fail=1; }
out=$("$BIN" run "$WORK/bf_hello.coil" 2>/dev/null)
[ "$out" = "Hello World!" ] || { echo "GATE FAIL: reader-entry round trip printed '$out'"; fail=1; }

# ---- a module NAME as the run target (no wrapper, no path) -------------------
got=$("$BIN" run reader.fixture.brainfuck tests/read_metaprogram/hello.bf 2>"$WORK/bfname.err") \
  || { echo "GATE FAIL: module-name target failed ($(head -1 "$WORK/bfname.err"))"; fail=1; }
[ "$got" = "$(cat "$WORK/bf_hello.coil")" ] \
  || { echo "GATE FAIL: module-name target output differs from the file target's"; fail=1; }

# ---- reader entry over stdin; a reader diagnostic fails the run cleanly ------
printf '++++++++[>++++++++<-]>+.' | "$BIN" run reader.fixture.brainfuck > "$WORK/bf_a.coil" 2>/dev/null \
  || { echo "GATE FAIL: reader-entry stdin run failed"; fail=1; }
out=$("$BIN" run "$WORK/bf_a.coil" 2>/dev/null)
[ "$out" = "A" ] || { echo "GATE FAIL: reader-entry stdin round trip printed '$out'"; fail=1; }
printf '+++[+.' | "$BIN" run reader.fixture.brainfuck >"$WORK/bfbad.out" 2>"$WORK/bfbad.err"
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
(import "reader.fixture.brainfuck.reader" :use [read-brainfuck])
(reader-provider "reader.fixture.brainfuck.reader" read-brainfuck)
(reader-provider "reader.fixture.brainfuck.reader" read-brainfuck)
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
