#!/usr/bin/env python3
"""Run the portable Scheme Lox interpreter over a pinned upstream corpus slice.

The repository already vendors the 246 Crafting Interpreters clox fixtures under
``src/apps/clox/tests/lox``.  This bounded gate selects every test whose contract
is successful stdout (plus the three intentionally empty programs), builds one
CLI, and compares every output line with its ``// expect:`` annotation.
Diagnostic cases require every portable semantic error in source order, its
phase, output before failure, and Lox's standard 65 (compile) or 70 (runtime)
process status. C-only and Java-only cascade annotations are intentionally not
contracts for the portable Scheme tree walker.
"""

from __future__ import annotations

import argparse
import hashlib
import re
import subprocess
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CORPUS = ROOT / "src/apps/clox/tests/lox"
CLI_SOURCE = ROOT / "tests/scheme/apps/lox_cli.coil"
PINNED_FILES = 246
PINNED_SHA256 = "f0d729be38736bf44e9442c928275bc5c65f06323ef72b70fdfe88f9c54bd31b"

EXPECT = re.compile(r"// expect: ?(.*)")
EXPECT_RUNTIME = re.compile(r"// expect runtime error: (.+)")
EXPECT_ERROR = re.compile(r"// (Error.*)")
EXPECT_ERROR_LINE = re.compile(r"// \[((?:java|c) )?line (\d+)\] (Error.*)")
ERROR_CONTRACT = re.compile(r"// (?:expect runtime error:|Error|\[(?:c |java )?line \d+\] Error)")
NONTEST = re.compile(r"// nontest")
ACTUAL_DIAGNOSTIC = re.compile(r"\[([^]]+)\] (.*)")

ZERO_OUTPUT_CASES = {
    "empty_file.lox",
    "comments/only_line_comment.lox",
    "comments/only_line_comment_and_line.lox",
}

# These are successful-output tests, but their behavior is intentionally beyond
# portable R5RS rather than an unnoticed interpreter failure.
DEFERRED = {
    "function/print.lox": "requires the host `clock` native function",
    "number/nan_equality.lox": "requires IEEE-754 NaN-producing zero division",
    "limit/loop_too_large.lox": "bytecode loop-offset limit does not apply to a tree walker",
    "limit/no_reuse_constants.lox": "bytecode constant-table limit does not apply to a tree walker",
    "limit/stack_overflow.lox": "requires an explicit Lox recursion-depth guard",
    "limit/too_many_constants.lox": "bytecode constant-table limit does not apply to a tree walker",
    "limit/too_many_locals.lox": "bytecode local-slot limit does not apply to a tree walker",
    "limit/too_many_upvalues.lox": "bytecode upvalue-slot limit does not apply to a tree walker",
}

RESOLVER_MESSAGES = {
    "A class can't inherit from itself.",
    "Can't return a value from an initializer.",
    "Can't return from top-level code.",
    "Can't use 'super' in a class with no superclass.",
    "Can't use 'super' outside of a class.",
    "Can't use 'this' outside of a class.",
    "Already a variable with this name in this scope.",
    "Can't read local variable in its own initializer.",
}


def corpus_digest(files: list[Path]) -> str:
    digest = hashlib.sha256()
    for path in files:
        digest.update(str(path.relative_to(CORPUS)).encode())
        digest.update(b"\0")
        digest.update(path.read_bytes())
        digest.update(b"\0")
    return digest.hexdigest()


def selected_cases(files: list[Path]) -> list[tuple[Path, list[str]]]:
    selected: list[tuple[Path, list[str]]] = []
    for path in files:
        rel = str(path.relative_to(CORPUS))
        source = path.read_text()
        if rel in DEFERRED or NONTEST.search(source) or ERROR_CONTRACT.search(source):
            continue
        expected = EXPECT.findall(source)
        if expected or rel in ZERO_OUTPUT_CASES:
            selected.append((path, expected))
    return selected


def normalize_error(message: str, runtime: bool) -> tuple[str, str]:
    if runtime:
        if message.startswith("Undefined variable '"):
            message = "Undefined variable."
        elif message.startswith("Undefined property '"):
            message = "Undefined property."
        elif re.fullmatch(r"Expected \d+ arguments but got \d+\.", message):
            message = "Wrong number of arguments."
        return "runtime", message

    body = message.split(": ", 1)[1] if ": " in message else message.removeprefix("Error: ")
    if body in {"Unexpected character.", "Unterminated string."}:
        phase = "scan"
    elif body in RESOLVER_MESSAGES:
        phase = "resolve"
    else:
        phase = "parse"
    return phase, body


def error_contracts(source: str) -> list[tuple[str, str]]:
    contracts: list[tuple[str, str]] = []
    for line in source.splitlines():
        runtime = EXPECT_RUNTIME.search(line)
        if runtime:
            contracts.append(normalize_error(runtime.group(1), True))
            continue
        located = EXPECT_ERROR_LINE.search(line)
        if located:
            language, _line, message = located.groups()
            if not language:
                contracts.append(normalize_error(message, False))
            continue
        compile_error = EXPECT_ERROR.search(line)
        if compile_error:
            contracts.append(normalize_error(compile_error.group(1), False))
    return contracts


def diagnostic_cases(files: list[Path]) -> list[tuple[Path, list[str], list[tuple[str, str]], int]]:
    selected: list[tuple[Path, list[str], list[tuple[str, str]], int]] = []
    for path in files:
        rel = str(path.relative_to(CORPUS))
        source = path.read_text()
        if rel in DEFERRED or NONTEST.search(source):
            continue
        contracts = error_contracts(source)
        if not contracts:
            continue
        selected.append(
            (path, EXPECT.findall(source), contracts,
             70 if any(phase == "runtime" for phase, _ in contracts) else 65)
        )
    return selected


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default="coil")
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args()

    files = sorted(CORPUS.rglob("*.lox"))
    actual_digest = corpus_digest(files)
    if len(files) != PINNED_FILES or actual_digest != PINNED_SHA256:
        raise SystemExit(
            "Lox corpus pin changed; audit the fixture update and refresh "
            f"PINNED_FILES/PINNED_SHA256 (files={len(files)}, sha256={actual_digest})"
        )
    for rel in DEFERRED:
        if not (CORPUS / rel).is_file():
            raise SystemExit(f"deferred Lox corpus fixture is missing: {rel}")

    cases = selected_cases(files)
    diagnostics = diagnostic_cases(files)
    with tempfile.TemporaryDirectory(prefix="coil-scheme-lox-corpus-") as tmp:
        binary = Path(tmp) / "scheme-lox"
        subprocess.run(
            [args.compiler, "build", str(CLI_SOURCE), "-o", str(binary), "--quiet"],
            cwd=ROOT, check=True,
        )
        failures: list[str] = []
        for path, expected in cases:
            rel = str(path.relative_to(CORPUS))
            try:
                proc = subprocess.run(
                    [str(binary), str(path)], cwd=ROOT, capture_output=True,
                    text=True, timeout=10, check=False,
                )
            except subprocess.TimeoutExpired:
                failures.append(f"{rel}: timed out")
                continue
            actual = proc.stdout.splitlines()
            if proc.returncode != 0 or proc.stderr or actual != expected:
                failures.append(
                    f"{rel}: exit={proc.returncode} stderr={proc.stderr!r} "
                    f"expected={expected!r} actual={actual!r}"
                )
            elif args.verbose:
                print(f"PASS {rel}")

        for path, expected_output, expected_diagnostic, expected_status in diagnostics:
            rel = str(path.relative_to(CORPUS))
            try:
                proc = subprocess.run(
                    [str(binary), str(path)], cwd=ROOT, capture_output=True,
                    text=True, timeout=10, check=False,
                )
            except subprocess.TimeoutExpired:
                failures.append(f"{rel}: timed out")
                continue
            lines = proc.stdout.splitlines()
            actual_output = lines[:len(expected_output)]
            actual_diagnostics: list[tuple[str, str]] = []
            malformed_diagnostic = False
            for line in lines[len(expected_output):]:
                match = ACTUAL_DIAGNOSTIC.fullmatch(line)
                if match:
                    actual_diagnostics.append((match.group(1), match.group(2)))
                else:
                    malformed_diagnostic = True
            if (proc.returncode != expected_status or proc.stderr
                    or actual_output != expected_output
                    or malformed_diagnostic
                    or actual_diagnostics != expected_diagnostic):
                failures.append(
                    f"{rel}: exit={proc.returncode}/{expected_status} "
                    f"stderr={proc.stderr!r} output={actual_output!r}/{expected_output!r} "
                    f"diagnostics={actual_diagnostics!r}/{expected_diagnostic!r}"
                )
            elif args.verbose:
                print(f"PASS {rel}")

    if failures:
        print("Scheme Lox corpus failures:")
        for failure in failures:
            print("  " + failure)
        return 1

    classified = len(cases) + len(diagnostics) + len(DEFERRED)
    print(
        f"PASS Scheme Lox corpus: {len(cases)} successful-output cases; "
        f"{len(diagnostics)} diagnostic cases; "
        f"{len(DEFERRED)} explicitly deferred; "
        f"{PINNED_FILES - classified} unclassified cases"
    )
    for rel, reason in sorted(DEFERRED.items()):
        print(f"DEFER {rel}: {reason}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
