#!/usr/bin/env python3
"""Run every pinned upstream Mal output/error regex against final Mal."""

from __future__ import annotations

import argparse
import hashlib
import re
import subprocess
import tempfile
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
COMMIT = "2bbfaa54cca4908efc90b4173b1406e260788e8a"
CORPORA = {
    2: ("step2_eval", "7669a59a38ae9560fd3a378555027274285ecc93d272d6efb9fbeaa8c10eaa61"),
    3: ("step3_env", "3af0c25d16292562af627eb5ac6a918d1641e4cbea72c7921b402113f479902c"),
    4: ("step4_if_fn_do", "d79426a6f6db4f570f11a02025bd57dd247c52c365a09afdab645f30ada9b9f7"),
    6: ("step6_file", "5a94b539df151d62f27a33286b1da8346da7877f27b5290bd338a3cafe24ceae"),
    7: ("step7_quote", "54d410f56f199ae8e2901c36ef8362929544fb5e5945b5e577b398520882a3c3"),
    8: ("step8_macros", "acb2688f28029867cd3c8dcdd0ce997eb2a9ad2ce593bd54eeb01b95b260f37b"),
    9: ("step9_try", "cf2eb7bf9dda59394be46979d659146d69e2830ffe824385e108663e4bd19f88"),
}


def actions(name: str, digest: str) -> list[tuple[str, str | None]]:
    url = f"https://raw.githubusercontent.com/kanaka/mal/{COMMIT}/impls/tests/{name}.mal"
    data = urllib.request.urlopen(url, timeout=30).read()
    if hashlib.sha256(data).hexdigest() != digest:
        raise RuntimeError(f"pinned Mal corpus checksum changed: {name}")
    lines = data.decode().splitlines()
    result: list[tuple[str, str | None]] = []
    for index, line in enumerate(lines[:-1]):
        if not line.strip() or line.lstrip().startswith(";"):
            continue
        if line.startswith("(readline ") or line == '"hello"':
            continue
        pattern = lines[index + 1][2:] if lines[index + 1].startswith(";/") else None
        result.append((line.replace("../tests/", "tests/scheme/third_party/mal/tests/"), pattern))
    return result


def source(stage: int, items: list[tuple[str, str | None]]) -> tuple[str, list[tuple[int, str, str]]]:
    forms = [
        f"(module scheme-mal-upstream-errors-{stage})",
        '(import "coil.scheme" :use *)',
        '(import "scheme-mal-stage5" :use *)',
        '(import "scheme-mal-host" :as host)',
        "(defn main [] (-> i64)",
    ]
    expected: list[tuple[int, str, str]] = []
    case = 0
    for expression, pattern in items:
        escaped = expression.replace("\\", "\\\\").replace('"', '\\"')
        if pattern is None:
            forms.append(f'  (mal5-rep "{escaped}")')
            continue
        case += 1
        begin = f"@@MAL-{stage}-{case}-BEGIN@@"
        end = f"@@MAL-{stage}-{case}-END@@"
        forms.extend([
            f'  (display "{begin}") (newline)',
            f'  (display (mal5-rep "{escaped}")) (newline)',
            f'  (display "{end}") (newline)',
        ])
        expected.append((case, expression, pattern))
    forms.extend(["  (host/exit-success))", ""])
    return "\n".join(forms), expected


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default=str(ROOT / "build/bin/coil"))
    args = parser.parse_args()
    failures: list[str] = []
    total = 0
    with tempfile.TemporaryDirectory(prefix="coil-mal-errors-") as tmp:
        directory = Path(tmp)
        for stage, (name, digest) in CORPORA.items():
            text, expected = source(stage, actions(name, digest))
            program = directory / f"mal_errors_{stage}.coil"
            binary = directory / f"mal-errors-{stage}"
            program.write_text(text)
            subprocess.run([args.compiler, "build", str(program), "-o", str(binary),
                            "--quiet"], cwd=ROOT, check=True, timeout=600)
            proc = subprocess.run([str(binary)], cwd=ROOT, capture_output=True,
                                  text=True, timeout=300, check=True)
            for case, expression, pattern in expected:
                total += 1
                begin = f"@@MAL-{stage}-{case}-BEGIN@@\n"
                end = f"@@MAL-{stage}-{case}-END@@"
                segment = proc.stdout.split(begin, 1)[1].split(end, 1)[0]
                if re.search(pattern, segment, re.MULTILINE | re.DOTALL) is None:
                    failures.append(
                        f"stage {stage} case {case}: {expression}\n"
                        f"  /{pattern}/ did not match {segment!r}")
    if failures:
        raise RuntimeError("\n".join(failures))
    print(f"PASS upstream Mal output/error regex cases: {total}/{total}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
