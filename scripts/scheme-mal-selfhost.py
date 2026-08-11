#!/usr/bin/env python3
"""Load upstream Mal-in-Mal inside Coil Scheme and run a nested program."""

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
FILES = {
    "stepA_mal.mal": "5c9c318b58a7b57e1f97a22bccd6ee5337d0c31b8ade6751ab71a19c5046c0f6",
    "env.mal": "dbd4501741e93dcc76850d80b2a13d24756a7ba68d35d9b813fb99a547683152",
    "core.mal": "fcdfd64fad3c41a3f5efd342845a8ffad876780d35a27b4327dea2bcbb381f2a",
}


def fetch(name: str, digest: str) -> str:
    url = f"https://raw.githubusercontent.com/kanaka/mal/{COMMIT}/impls/mal/{name}"
    with urllib.request.urlopen(url, timeout=30) as response:
        data = response.read()
    actual = hashlib.sha256(data).hexdigest()
    if actual != digest:
        raise RuntimeError(f"pinned {name} checksum changed: {actual}")
    return data.decode()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default=str(ROOT / "build/bin/coil"))
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix="coil-mal-selfhost-") as tmp:
        directory = Path(tmp)
        paths: dict[str, Path] = {}
        for name, digest in FILES.items():
            path = directory / name
            path.write_text(fetch(name, digest))
            paths[name] = path
        target = directory / "nested-program.mal"
        target.write_text('(println "SELFHOST-OK" (+ 40 2))\n')
        step = paths["stepA_mal.mal"]
        step.write_text(
            step.read_text()
            .replace('../mal/env.mal', str(paths['env.mal']))
            .replace('../mal/core.mal', str(paths['core.mal']))
        )
        suite = directory / "mal_selfhost_test.coil"
        suite.write_text("\n".join([
            "(module scheme-mal-selfhost-test)",
            '(import "coil.scheme" :use *)',
            '(import "scheme-mal-stage5" :use *)',
            "(deftest upstream-mal-self-hosts",
            f"  (mal5-rep {json.dumps('(def! *ARGV* (list ' + json.dumps(str(target)) + '))')})",
            f"  (mal5-rep {json.dumps('(load-file ' + json.dumps(str(step)) + ')')}))",
        ]) + "\n")
        proc = subprocess.run(
            [args.compiler, "test", str(suite), "--no-fork"],
            cwd=ROOT, capture_output=True, text=True, timeout=300,
        )
        output = proc.stdout + proc.stderr
        print(output, end="")
        if proc.returncode != 0:
            return proc.returncode
        if "SELFHOST-OK 42" not in output:
            raise RuntimeError("nested Mal program did not produce its proof output")
    print("PASS upstream Mal self-host: nested interpreter produced SELFHOST-OK 42")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
