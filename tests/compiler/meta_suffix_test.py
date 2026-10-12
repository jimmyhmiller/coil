#!/usr/bin/env python3
"""Check incremental meta output and the changed-macro-context fallback."""
import argparse
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", required=True)
    compiler = Path(parser.parse_args().compiler).resolve()
    with tempfile.TemporaryDirectory(prefix="meta-suffix-", dir=ROOT / "build") as directory:
        for fixture, expected_rounds in (("meta_suffix_expansion", 0),
                                         ("meta_suffix_new_macro", 1),
                                         ("meta_suffix_changed_prefix", 1)):
            output = Path(directory) / fixture
            result = subprocess.run(
                [str(compiler), "build", f"tests/compiler/features/{fixture}.coil",
                 "-O0", "-o", str(output)], cwd=ROOT, capture_output=True, text=True,
                env={**os.environ, "COIL_TRACE": "1",
                     "COIL_NAMESPACE_ROOTS": "src:tests:scripts", "COIL_STRICT_BUNDLE": "0"},
                timeout=120)
            assert result.returncode == 0, (fixture, result.stdout, result.stderr)
            subprocess.run([str(output)], cwd=ROOT, check=True, timeout=30)
            # Backend worker spans are concurrent. Only the frontend has a
            # sequential span stack, and only meta elaboration is under test.
            stack = []
            observed = set()
            rounds = 0
            for line in result.stderr.splitlines():
                if line.startswith("coil-trace begin frontend."):
                    phase = line.split()[2]
                    if (phase == "frontend.expand.stage3-rounds" and
                            "frontend.check.meta-elaboration" in stack):
                        rounds += 1
                    stack.append(phase)
                    observed.add(phase)
                elif line.startswith("coil-trace end frontend."):
                    assert stack and stack.pop() == line.split()[2], line
            assert not stack, stack
            assert {"frontend.expand", "frontend.check.meta-elaboration",
                    "frontend.check.typecheck", "frontend.monomorphize"} <= observed, observed
            assert rounds == expected_rounds, (fixture, rounds, expected_rounds)
            print(f"{fixture}: runtime passed, {rounds} repeated tower invocations")


if __name__ == "__main__":
    main()
