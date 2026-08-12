#!/usr/bin/env python3
"""Fast, repeatable progress gate for the native R5RS dialect.

The default loop stays bounded: implementation unit tests plus the real dialect
surface.  Add ``--bench`` after semantic changes, and ``--all`` before handing a
slice off; neither mode rebuilds the self-hosted compiler.
"""

from __future__ import annotations

import argparse
import subprocess
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SCHEME = ROOT / "src/apps/scheme"
DIALECT_CASES = {
    "case01.coil": "01-core-eval.txt",
    "case05.coil": "05-derived-forms.txt",
    "case06.coil": "06-quasiquote.txt",
    "case07.coil": "07-syntax-rules.txt",
    "case09.coil": "09-lists-strings.txt",
    "casefold_modules.coil": "casefold-modules.txt",
    "character_strings.coil": "character-strings.txt",
    "complex_numbers.coil": "complex-numbers.txt",
    "cond_quoted_symbol.coil": "cond-quoted-symbol.txt",
    "cxr_family.coil": "cxr-family.txt",
    "eval_environment.coil": "eval-environment.txt",
    "identifier_case.coil": "identifier-case.txt",
    "lambda.coil": "lambda.txt",
    "lexical_shadowing.coil": "lexical-shadowing.txt",
    "mutable_sequences.coil": "mutable-sequences.txt",
    "numeric_flonum.coil": "numeric-flonum.txt",
    "numeric_fixnum.coil": "numeric-fixnum.txt",
    "primitive_values.coil": "primitive-values.txt",
    "quoted_lambda.coil": "quoted-lambda.txt",
    "reader_identifiers.coil": "reader-identifiers.txt",
    "tail_calls.coil": "tail-calls.txt",
    "tail_closure.coil": "tail-closure.txt",
}

# Untouched Scheme entry files: no Coil module/import/main wrapper. These pin
# the public invocation contract `coil build FILE.scm --use coil.scheme`.
PLAIN_ENTRY_CASES = {
    "cases/01-core-eval.scm": "01-core-eval.txt",
    "cases/05-derived-forms.scm": "plain-05-derived-forms.txt",
    "cases/06-quasiquote.scm": "plain-06-quasiquote.txt",
    "cases/07-syntax-rules.scm": "plain-07-syntax-rules.txt",
    "cases/08-numbers.scm": "plain-08-numbers.txt",
    "cases/09-lists-strings.scm": "09-lists-strings.txt",
    "dialect/auto_closure_probe.scm": "auto-closure.txt",
    "dialect/plain_existing_main.scm": "plain-existing-main.txt",
}

APPLICATION_CASES = {
    "evalcore.coil": "evalcore.txt",
    "lox_acceptance.coil": "lox.txt",
}

CONTINUATION_CASES = {
    "03-callcc.scm": "42\n3\n2\n3\n4\n(reentered 3)\n",
    "04-dynamic-wind.scm":
        "(before during after)\n(in out)\n(enter body exit enter exit)\n",
}

NEGATIVE_CASES = {
    "private_import_rejected.coil": "unbound variable 'hidden-proc'",
    "comparison_arity.coil": "comparison expects at least two arguments",
    "max_arity.coil": "max expects at least one argument",
    "malformed_syntax_rule.coil": "syntax-rules: each rule must be (nonempty-pattern template)",
    "duplicate_syntax_pattern.coil": "syntax-rules: pattern variable appears more than once",
    "unbound_template_ellipsis.coil": "syntax-rules: template ellipsis has no repeated pattern variable",
}

RUNTIME_NEGATIVE_CASES = {
    "call_non_procedure.coil": "attempted to call a non-procedure",
    "read_invalid_token.coil": "read: invalid R5RS identifier or number",
    "read_invalid_plus_identifier.coil": "read: invalid R5RS identifier or number",
    "read_invalid_minus_identifier.coil": "read: invalid R5RS identifier or number",
    "read_invalid_dot_identifier.coil": "read: invalid R5RS identifier or number",
    "read_bare_dot.coil": "read: dot outside list",
    "read_dotted_vector.coil": "read: vector cannot contain dotted tail",
    "read_incomplete_quote.coil": "read: datum abbreviation missing datum",
    "eval_no_matching_syntax.coil": "syntax-rules: no matching rule",
    "eval_duplicate_syntax_pattern.coil": "syntax-rules: pattern variable appears more than once",
    "eval_unbound_template_ellipsis.coil": "syntax-rules: template ellipsis has no repeated pattern variable",
    "division_by_zero.coil": "/: division by zero",
    "integer_division_by_zero.coil": "integer division by zero",
    "first_class_comparison_arity.coil": "comparison expects at least two arguments",
    "first_class_max_arity.coil": "max expects at least one argument",
}

# Feed these directly to one generated `(read)` executable. This keeps broad
# lexical/structural diagnostic coverage cheap: adding a malformed datum costs
# another process invocation, not another source module and compiler build.
MALFORMED_DATUM_CASES = {
    "unexpected-close": (")", "read: unexpected closing parenthesis"),
    "unterminated-list": ("(1 2", "read: unterminated list"),
    "dot-before-element": ("(. 1)", "read: dot before list element"),
    "dot-as-tail-datum": ("(1 . .)", "read: dot cannot be a dotted-list datum"),
    "extra-after-dotted-tail": ("(1 . 2 3)", "read: dotted list needs closing parenthesis"),
    "unterminated-string": ('"abc', "read: unterminated string"),
    "unterminated-string-escape": ('"abc\\', "read: unterminated string escape"),
    "unknown-string-escape": ('"a\\q"', "read: unknown string escape"),
    "incomplete-character": ("#\\", "read: incomplete character literal"),
    "unknown-character-name": ("#\\spaces", "read: unknown character name"),
    "incomplete-sharp": ("#", "read: incomplete # syntax"),
    "boolean-without-delimiter": ("#true", "read: boolean must end at delimiter"),
    "malformed-prefixed-number": ("#xg", "read: malformed prefixed number"),
    "unrepresentable-exact-polar": ("#e1@1", "read: malformed prefixed number"),
    "duplicate-exactness-prefix": ("#e#i1", "read: malformed prefixed number"),
    "unsupported-sharp": ("#z", "read: unsupported # syntax"),
    "incomplete-quasiquote": ("`", "read: datum abbreviation missing datum"),
    "incomplete-unquote-splicing": (",@", "read: datum abbreviation missing datum"),
}

# R5RS section 6 procedure inventory. Keeping this executable catches both a
# missing export and a procedure that works only in direct-call position.
R5RS_PROCEDURES = tuple("""
eqv? eq? equal? number? complex? real? rational? integer? exact? inexact?
= < > <= >= zero? positive? negative? odd? even? max min + * - / abs quotient
remainder modulo gcd lcm numerator denominator floor ceiling truncate round
rationalize exp log sin cos tan asin acos atan sqrt expt make-rectangular
make-polar real-part imag-part magnitude angle exact->inexact inexact->exact
number->string string->number not boolean? pair? cons car cdr set-car! set-cdr!
caar cadr cdar cddr caaar caadr cadar caddr cdaar cdadr cddar cdddr caaaar
caaadr caadar caaddr cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr
cddaar cddadr cdddar cddddr null? list? list length append reverse list-tail
list-ref memq memv member assq assv assoc symbol? symbol->string string->symbol
char? char=? char<? char>? char<=? char>=? char-ci=? char-ci<? char-ci>?
char-ci<=? char-ci>=? char-alphabetic? char-numeric? char-whitespace?
char-upper-case? char-lower-case? char->integer integer->char char-upcase
char-downcase string? make-string string string-length string-ref string-set!
string=? string<? string>? string<=? string>=? string-ci=? string-ci<?
string-ci>? string-ci<=? string-ci>=? substring string-append string->list
list->string string-copy string-fill! vector? make-vector vector vector-length
vector-ref vector-set! vector->list list->vector vector-fill! procedure? apply
map for-each force values call-with-values eval scheme-report-environment
null-environment interaction-environment input-port? output-port?
current-input-port current-output-port call-with-input-file call-with-output-file
with-input-from-file with-output-to-file open-input-file open-output-file
close-input-port close-output-port read read-char peek-char eof-object?
char-ready? write display newline write-char load transcript-on transcript-off
""".split())
R5RS_DEFERRED_PROCEDURES = {
    "call-with-current-continuation", "call/cc", "dynamic-wind",
}
R5RS_TODO_PROCEDURES: set[str] = set()


def run(argv: list[str]) -> None:
    print("+", " ".join(argv), flush=True)
    subprocess.run(argv, cwd=ROOT, check=True)


def run_dialect_cases(compiler: str) -> None:
    """Build native Scheme programs and compare them to oracle-blessed output."""
    with tempfile.TemporaryDirectory(prefix="coil-scheme-progress-") as tmp:
        for source_name, expected_name in DIALECT_CASES.items():
            source = ROOT / "tests/scheme/dialect" / source_name
            binary = Path(tmp) / source.stem
            run([compiler, "build", str(source), "-o", str(binary), "--quiet"])
            proc = subprocess.run([str(binary)], cwd=ROOT, capture_output=True,
                                  text=True, check=False)
            if proc.returncode != 0:
                raise subprocess.CalledProcessError(proc.returncode, [str(binary)],
                                                    output=proc.stdout,
                                                    stderr=proc.stderr)
            expected = (ROOT / "tests/scheme/expected" / expected_name).read_text()
            if proc.stdout != expected:
                raise RuntimeError(
                    f"{source_name}: output differs from {expected_name}\n"
                    f"expected:\n{expected}\ngot:\n{proc.stdout}"
                )
            print(f"PASS {source_name} == {expected_name}", flush=True)

        for source_name, expected_name in PLAIN_ENTRY_CASES.items():
            source = ROOT / "tests/scheme" / source_name
            binary = Path(tmp) / ("plain-" + source.stem)
            run([compiler, "build", str(source), "-o", str(binary),
                 "--use", "coil.scheme", "--quiet"])
            proc = subprocess.run([str(binary)], cwd=ROOT, capture_output=True,
                                  text=True, check=False)
            if proc.returncode != 0:
                raise subprocess.CalledProcessError(proc.returncode, [str(binary)],
                                                    output=proc.stdout,
                                                    stderr=proc.stderr)
            expected = (ROOT / "tests/scheme/expected" / expected_name).read_text()
            if proc.stdout != expected:
                raise RuntimeError(
                    f"plain entry {source_name}: output differs from {expected_name}\n"
                    f"expected:\n{expected}got:\n{proc.stdout}"
                )
            print(f"PASS plain {source_name} == {expected_name}", flush=True)

        for source_name, expected in CONTINUATION_CASES.items():
            source = ROOT / "tests/scheme/continuations" / source_name
            binary = Path(tmp) / ("continuations-" + source.stem)
            run([compiler, "build", str(source), "-o", str(binary),
                 "--use", "coil.scheme.continuations", "--quiet"])
            proc = subprocess.run([str(binary)], cwd=ROOT, capture_output=True,
                                  text=True, check=False)
            if proc.returncode != 0:
                raise subprocess.CalledProcessError(proc.returncode, [str(binary)],
                                                    output=proc.stdout,
                                                    stderr=proc.stderr)
            if proc.stdout != expected:
                raise RuntimeError(
                    f"{source_name}: continuation output differs\n"
                    f"expected:\n{expected}got:\n{proc.stdout}"
                )
            print(f"PASS {source_name} (optional continuations)", flush=True)


def run_application_cases(compiler: str) -> None:
    """Build larger portable-Scheme integration programs."""
    with tempfile.TemporaryDirectory(prefix="coil-scheme-apps-") as tmp:
        for source_name, expected_name in APPLICATION_CASES.items():
            source = ROOT / "tests/scheme/apps" / source_name
            binary = Path(tmp) / source.stem
            run([compiler, "build", str(source), "-o", str(binary), "--quiet"])
            proc = subprocess.run([str(binary)], cwd=ROOT, capture_output=True,
                                  text=True, check=False)
            if proc.returncode != 0:
                raise subprocess.CalledProcessError(proc.returncode, [str(binary)],
                                                    output=proc.stdout,
                                                    stderr=proc.stderr)
            expected = (ROOT / "tests/scheme/expected" / expected_name).read_text()
            if proc.stdout != expected:
                raise RuntimeError(
                    f"application {source_name}: output differs from {expected_name}\n"
                    f"expected:\n{expected}\ngot:\n{proc.stdout}"
                )
            print(f"PASS application {source_name} == {expected_name}", flush=True)


def run_negative_cases(compiler: str) -> None:
    """Require malformed/forbidden Scheme programs to fail for the right reason."""
    with tempfile.TemporaryDirectory(prefix="coil-scheme-negative-") as tmp:
        for source_name, expected_text in NEGATIVE_CASES.items():
            source = ROOT / "tests/scheme/dialect" / source_name
            binary = Path(tmp) / source.stem
            proc = subprocess.run(
                [compiler, "build", str(source), "-o", str(binary), "--quiet"],
                cwd=ROOT, capture_output=True, text=True, check=False,
            )
            if proc.returncode == 0:
                raise RuntimeError(f"{source_name}: unexpectedly compiled")
            diagnostics = proc.stdout + proc.stderr
            if expected_text not in diagnostics:
                raise RuntimeError(
                    f"{source_name}: wrong diagnostic\n"
                    f"expected substring: {expected_text}\ngot:\n{diagnostics}"
                )
            print(f"PASS negative {source_name} contains {expected_text!r}", flush=True)

        for source_name, expected_text in RUNTIME_NEGATIVE_CASES.items():
            source = ROOT / "tests/scheme/dialect" / source_name
            binary = Path(tmp) / source.stem
            run([compiler, "build", str(source), "-o", str(binary), "--quiet"])
            proc = subprocess.run(
                [str(binary)], cwd=ROOT, capture_output=True, text=True, check=False,
            )
            if proc.returncode == 0:
                raise RuntimeError(f"{source_name}: unexpectedly ran successfully")
            diagnostics = proc.stdout + proc.stderr
            if expected_text not in diagnostics:
                raise RuntimeError(
                    f"{source_name}: wrong runtime diagnostic\n"
                    f"expected substring: {expected_text}\ngot:\n{diagnostics}"
                )
            print(f"PASS runtime negative {source_name} contains {expected_text!r}", flush=True)

        source = Path(tmp) / "malformed_datum.coil"
        binary = Path(tmp) / "malformed_datum"
        source.write_text("""(module malformed-datum)
(import "coil.scheme" :use *)
(defn main [] (-> i64)
  (read)
  (fixnum-value (mk-fixnum 0)))
""")
        run([compiler, "build", str(source), "-o", str(binary), "--quiet"])
        for case_name, (datum, expected_text) in MALFORMED_DATUM_CASES.items():
            proc = subprocess.run(
                [str(binary)], cwd=ROOT, input=datum,
                capture_output=True, text=True, check=False,
            )
            if proc.returncode == 0:
                raise RuntimeError(f"malformed datum {case_name}: unexpectedly succeeded")
            diagnostics = proc.stdout + proc.stderr
            if expected_text not in diagnostics:
                raise RuntimeError(
                    f"malformed datum {case_name}: wrong runtime diagnostic\n"
                    f"input: {datum!r}\nexpected substring: {expected_text}\n"
                    f"got:\n{diagnostics}"
                )
            print(f"PASS malformed datum {case_name} contains {expected_text!r}",
                  flush=True)


def run_surface_inventory(compiler: str) -> None:
    """Prove every implemented report procedure is exported and first-class."""
    if len(set(R5RS_PROCEDURES)) != len(R5RS_PROCEDURES):
        raise RuntimeError("R5RS procedure inventory contains a duplicate")
    chunks = [R5RS_PROCEDURES[i:i + 20]
              for i in range(0, len(R5RS_PROCEDURES), 20)]
    lines = ["(module r5rs-surface-inventory)",
             '(import "coil.scheme" :use *)',
             "(defn main [] (-> i64)"]
    for chunk in chunks:
        checks = " ".join(
            f"(let ((p {name})) (procedure? p))" for name in chunk
        )
        lines.extend([f"  (write (list {checks}))", "  (newline)"])
    lines.extend(["  (fixnum-value (mk-fixnum 0)))", ""])
    with tempfile.TemporaryDirectory(prefix="coil-scheme-surface-") as tmp:
        source = Path(tmp) / "r5rs_surface_inventory.coil"
        binary = Path(tmp) / "r5rs_surface_inventory"
        source.write_text("\n".join(lines))
        run([compiler, "build", str(source), "-o", str(binary), "--quiet"])
        proc = subprocess.run([str(binary)], cwd=ROOT, capture_output=True,
                              text=True, check=True)
    results = proc.stdout.replace("(", " ").replace(")", " ").split()
    if len(results) != len(R5RS_PROCEDURES) or any(x != "#t" for x in results):
        raise RuntimeError(
            "R5RS surface inventory did not produce one #t per procedure\n"
            f"expected {len(R5RS_PROCEDURES)}, got {len(results)}\n{proc.stdout}"
        )
    print(f"PASS R5RS surface inventory: {len(results)} first-class procedures; "
          f"deferred={sorted(R5RS_DEFERRED_PROCEDURES)}; "
          f"todo={sorted(R5RS_TODO_PROCEDURES)}", flush=True)


def run_derived_expansion_audit(compiler: str) -> None:
    """Prove source letrec/do bypass the legacy shape-specific macros."""
    source = ROOT / "tests/scheme/dialect/case05.coil"
    proc = subprocess.run(
        [compiler, "dump-expand", str(source)], cwd=ROOT,
        capture_output=True, text=True, check=True,
    )
    forbidden = (
        "coil.scheme.derived2.scm-do",
        "coil.scheme.derived2.letrec",
    )
    leaked = [name for name in forbidden if name in proc.stdout]
    if leaked:
        raise RuntimeError(
            "derived syntax unexpectedly reached legacy macros: "
            + ", ".join(leaked)
        )
    print("PASS derived expansion audit: letrec/do use syntax-rules", flush=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default="coil")
    parser.add_argument("--bench", action="store_true")
    parser.add_argument("--lox-bench", action="store_true",
                        help="benchmark the Scheme-hosted Lox interpreter against Chez")
    parser.add_argument("--corpus", action="store_true",
                        help="fetch and run the optional GPL R4RS/R5RS corpus audit")
    parser.add_argument("--lox-corpus", action="store_true",
                        help="run the pinned successful-output Crafting Interpreters slice")
    parser.add_argument("--all", action="store_true",
                        help="also run the compiler's bounded modernize gate")
    args = parser.parse_args()

    suites = sorted(SCHEME.glob("*_test.coil"))
    for suite in suites:
        run([args.compiler, "test", str(suite), "--no-fork"])

    run_dialect_cases(args.compiler)
    run_derived_expansion_audit(args.compiler)
    run_surface_inventory(args.compiler)
    run_negative_cases(args.compiler)
    run_application_cases(args.compiler)

    if args.bench:
        run(["python3", "tests/scheme/bench/run.py", "--compiler", args.compiler])

    if args.lox_bench:
        run(["python3", "tests/scheme/bench/lox_run.py", "--compiler", args.compiler])

    if args.corpus:
        run(["python3", "scripts/scheme-r4rs-audit.py", "--compiler", args.compiler])

    if args.lox_corpus:
        run(["python3", "scripts/scheme-lox-corpus.py", "--compiler", args.compiler])

    if args.all:
        run(["python3", "scripts/dev.py", "test", "modernize-fast",
             "--compiler", args.compiler])

    negative_count = (len(NEGATIVE_CASES) + len(RUNTIME_NEGATIVE_CASES)
                      + len(MALFORMED_DATUM_CASES))
    negative_word = "case" if negative_count == 1 else "cases"
    print(f"scheme progress gate: {len(suites)} suites, "
          f"{len(DIALECT_CASES)} oracle cases, "
          f"{negative_count} negative {negative_word}, and "
          f"{len(APPLICATION_CASES)} application cases passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
