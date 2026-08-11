#!/usr/bin/env python3
"""Run the pinned successful Mal stage-1 reader/printer corpus on Coil."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import tempfile
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
COMMIT = "2bbfaa54cca4908efc90b4173b1406e260788e8a"
SHA256 = "c2e847a3aef5ee3eedb2e1c3a86e49f141e64d523ef00b37a80bc0cb3cb51270"
URL = f"https://raw.githubusercontent.com/kanaka/mal/{COMMIT}/impls/tests/step1_read_print.mal"


def fetch() -> str:
    with urllib.request.urlopen(URL, timeout=30) as response:
        data = response.read()
    actual = hashlib.sha256(data).hexdigest()
    if actual != SHA256:
        raise RuntimeError(f"Mal stage-1 corpus checksum changed: {actual}")
    return data.decode()


def successful_cases(source: str) -> list[tuple[str, str]]:
    lines = source.splitlines()
    cases: list[tuple[str, str]] = []
    for index, line in enumerate(lines[:-1]):
        expected = lines[index + 1]
        if line.strip() and not line.lstrip().startswith(";") and expected.startswith(";=>"):
            cases.append((line, expected[3:]))
    return cases


def scheme_string(value: str) -> str:
    # JSON's string syntax is compatible with the escapes accepted by Coil's
    # reader for this ASCII upstream corpus.
    return json.dumps(value, ensure_ascii=True)


def generated_suite(cases: list[tuple[str, str]]) -> str:
    out = [
        "(module scheme-mal-upstream-stage1-corpus)",
        '(import "coil.scheme.check" :use *)',
        '(import "scheme-mal-stage1" :use *)',
        '(import "coil.scheme" :use *)',
    ]
    for number, (expression, expected) in enumerate(cases, 1):
        out.extend([
            f"(deftest upstream-mal-stage1-{number}",
            f"  (check (string=? (mal-rep {scheme_string(expression)})",
            f"                   {scheme_string(expected)}) {5000 + number}))",
        ])
    return "\n".join(out) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default=str(ROOT / "build/bin/coil"))
    args = parser.parse_args()
    cases = successful_cases(fetch())
    if len(cases) != 110:
        raise RuntimeError(f"expected 110 pinned successful cases, found {len(cases)}")
    with tempfile.TemporaryDirectory(prefix="coil-mal-stage1-") as tmp:
        suite = Path(tmp) / "mal_stage1_corpus.coil"
        suite.write_text(generated_suite(cases))
        subprocess.run(
            [args.compiler, "test", str(suite), "--no-fork"],
            cwd=ROOT,
            check=True,
        )
    print(f"PASS upstream Mal stage 1: {len(cases)}/{len(cases)} successful cases")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
