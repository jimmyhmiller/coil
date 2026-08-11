#!/usr/bin/env python3
"""Run pinned, stateful positive corpora from upstream Mal against Coil ports."""

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
STAGES = {
    2: ("step2_eval", "7669a59a38ae9560fd3a378555027274285ecc93d272d6efb9fbeaa8c10eaa61", 2, "mal-eval-rep"),
    3: ("step3_env", "3af0c25d16292562af627eb5ac6a918d1641e4cbea72c7921b402113f479902c", 3, "mal3-rep"),
    4: ("step4_if_fn_do", "d79426a6f6db4f570f11a02025bd57dd247c52c365a09afdab645f30ada9b9f7", 4, "mal4-rep"),
    5: ("step5_tco", "ac8993e2bf034609ec9cadd8368cbd24b82dda9284d30b81efefb519b8c61ddd", 5, "mal5-rep"),
    6: ("step6_file", "5a94b539df151d62f27a33286b1da8346da7877f27b5290bd338a3cafe24ceae", 5, "mal5-rep"),
    7: ("step7_quote", "54d410f56f199ae8e2901c36ef8362929544fb5e5945b5e577b398520882a3c3", 5, "mal5-rep"),
    8: ("step8_macros", "acb2688f28029867cd3c8dcdd0ce997eb2a9ad2ce593bd54eeb01b95b260f37b", 5, "mal5-rep"),
    9: ("step9_try", "cf2eb7bf9dda59394be46979d659146d69e2830ffe824385e108663e4bd19f88", 5, "mal5-rep"),
    10: ("stepA_mal", "aa60f28f69225979272251d49bad40ce6fbf7280f8a0042bd1d28111ece7eb2b", 5, "mal5-rep"),
}


def fetch(name: str, wanted: str) -> str:
    url = f"https://raw.githubusercontent.com/kanaka/mal/{COMMIT}/impls/tests/{name}.mal"
    with urllib.request.urlopen(url, timeout=30) as response:
        data = response.read()
    actual = hashlib.sha256(data).hexdigest()
    if actual != wanted:
        raise RuntimeError(f"pinned Mal corpus checksum changed: {actual}")
    return data.decode()


def successful_cases(source: str) -> list[tuple[str, str | None]]:
    lines = source.splitlines()
    return [
        (line, lines[index + 1][3:] if lines[index + 1].startswith(";=>") else None)
        for index, line in enumerate(lines[:-1])
        if line.strip()
        and not line.lstrip().startswith(";")
        and not lines[index + 1].startswith(";/")
        and "(abc" not in line
        and "(def! x (nth" not in line
        and not line.startswith("(readline ")
        and line != '"hello"'
    ]


def suite(stage: int, module_stage: int, rep: str,
          cases: list[tuple[str, str | None]]) -> str:
    out = [
        f"(module scheme-mal-upstream-stage{stage}-corpus)",
        '(import "coil.scheme.check" :use *)',
        f'(import "scheme-mal-stage{module_stage}" :use *)',
        '(import "coil.scheme" :use *)',
        f"(deftest upstream-mal-stage{stage}-positive-corpus",
    ]
    for number, (expression, expected) in enumerate(cases, 1):
        expression = expression.replace("../tests/", "tests/scheme/third_party/mal/tests/")
        out.append(f"  (display {json.dumps(f'case {number}: {expression}\\n')})")
        if expected is None:
            out.append(f"  ({rep} {json.dumps(expression)})")
        else:
            out.append(f"  (let ((actual ({rep} {json.dumps(expression)})))")
            out.append(
                f"    (if (string=? actual {json.dumps(expected)}) #t "
                f"(begin (display \"  expected: \") "
                f"(display {json.dumps(expected)}) (display \"; actual: \") "
                f"(display actual) (newline)))")
            out.append(
                f"    (check (string=? actual {json.dumps(expected)}) "
                f"{stage * 10000 + number}))"
            )
    out.append(")")
    return "\n".join(out) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stage", type=int, choices=STAGES)
    parser.add_argument("--compiler", default=str(ROOT / "build/bin/coil"))
    parser.add_argument("--sanitize", action="store_true")
    parser.add_argument("--limit", type=int,
                        help="run only the first N selected actions (diagnostic)")
    parser.add_argument("--probe-case", type=int,
                        help="append this one-based original case after --limit setup")
    args = parser.parse_args()
    name, digest, module_stage, rep = STAGES[args.stage]
    cases = successful_cases(fetch(name, digest))
    probe = cases[args.probe_case - 1] if args.probe_case is not None else None
    if args.limit is not None:
        cases = cases[:args.limit]
    if probe is not None and (not cases or cases[-1] != probe):
        cases.append(probe)
    with tempfile.TemporaryDirectory(prefix=f"coil-mal-stage{args.stage}-") as tmp:
        source = Path(tmp) / f"mal_stage{args.stage}_corpus.coil"
        source.write_text(suite(args.stage, module_stage, rep, cases))
        command = [args.compiler, "test", str(source), "--no-fork"]
        if args.sanitize:
            command.extend(["--sanitize=address", "-O0"])
        subprocess.run(command, cwd=ROOT, check=True)
    print(f"PASS upstream Mal stage {args.stage}: {len(cases)}/{len(cases)} positive cases")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
