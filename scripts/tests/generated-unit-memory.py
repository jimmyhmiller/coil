#!/usr/bin/env python3
"""Bound retained state across actual sequential generated-unit pipelines."""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("compiler")
    parser.add_argument("--units", type=int, default=64)
    args = parser.parse_args()
    compiler = str(Path(args.compiler).resolve())
    with tempfile.TemporaryDirectory(prefix=".coil-unit-memory-", dir=ROOT) as raw:
        directory = Path(raw)
        source = directory / "source.input"
        source.write_text("generated memory regression\n")
        facade = "(module generated.memory.facade) (defn main [] (-> i64) 0)"
        (directory / "provider.coil").write_text(
            '(module generated.memory.reader) (import "coil.meta" :as meta) '
            '(import "coil.str" :use *) (import "coil.slice" :use *) (import "coil.alloc" :use *) '
            '(import "coil.primitive" :as p) '
            '(defn sconcat [(a (dyn Allocator)) (x (slice u8)) (y (slice u8))] (-> (slice u8)) '
            '(match (str-concat a x y) (Some [v] v) (None [] (p/error "out of memory")))) '
            '(defn sconcat3 [(a (dyn Allocator)) (x (slice u8)) (y (slice u8)) (z (slice u8))] (-> (slice u8)) '
            '(sconcat a x (sconcat a y z))) '
            '(defn read-source [(context Code)] (-> Code) '
            f'(let [a (meta/expansion-allocator)] (for [i 0 {args.units}] '
            '(let [index (p/int->str i) name (sconcat a "generated.memory.unit" index) '
            'symbol (sconcat a "value" index) declaration (sconcat3 a "(module " name ") ") '
            'interface (sconcat a declaration (sconcat3 a "(extern " symbol " :cc c [] (-> i64)) ")) '
            'exported (sconcat a interface (sconcat3 a "(export " symbol ")")) '
            'body (sconcat a declaration (sconcat a (sconcat3 a "(defn " symbol " [] (-> i64) ") (sconcat a index ")")))] '
            '(meta/generated-unit! name exported body)) 0)) '
            + f" (p/code-read {json.dumps(facade)} context)) "
            + '(reader-provider "generated.memory.reader" read-source)')
        env = dict(os.environ, COIL_NAMESPACE_ROOTS=str(directory))
        command = ["/usr/bin/time", "-l" if sys.platform == "darwin" else "-v", compiler, "build", str(source), "--use", "generated.memory.reader",
                   "--backend", "llvm", "-O0", "-o", str(directory / "program")]
        result = subprocess.run(command, cwd=ROOT, env=env, text=True, capture_output=True)
        if result.returncode:
            raise AssertionError(result.stdout + result.stderr)
        for line in result.stderr.splitlines():
            if "generated.unit.arena-" in line:
                print(line, flush=True)
        pattern = (r"(\d+)\s+maximum resident set size" if sys.platform == "darwin"
                   else r"Maximum resident set size \(kbytes\):\s*(\d+)")
        match = re.search(pattern, result.stderr)
        assert match, "time did not report peak RSS"
        peak = int(match.group(1)) * (1 if sys.platform == "darwin" else 1024)
        print(json.dumps({"units": args.units, "peak_rss_bytes": peak}), flush=True)
        # Facade teardown leaves the peak around 370 MB on this host. Retaining
        # it across owners costs ~643 MB; leaking stage-3 arenas costs ~1.3 GB.
        assert peak < 512 * 1024 * 1024, "completed facade or unit compiler state was retained"
        subprocess.run([str(directory / "program")], check=True)


if __name__ == "__main__":
    main()
