#!/usr/bin/env python3
"""Public SDK source graph, opaque prebuilt interface, and scope lifetime."""
from pathlib import Path
import os
import shlex
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()

def run(args, cwd, env=None):
    result = subprocess.run(list(map(str, args)), cwd=cwd, env=env,
                            capture_output=True, text=True, timeout=180)
    assert result.returncode == 0, (args, result.returncode, result.stdout, result.stderr)
    return result.stdout

with tempfile.TemporaryDirectory(prefix=".coil-jit-source-graph-", dir=ROOT) as raw:
    work = Path(raw)
    unit = work / "sdk"
    run([COMPILER, "build-unit", ROOT / "src/compiler/jit_api.coil", "-o", unit,
         "--backend", "llvm", "-O3", "--quiet"], ROOT)
    binary = work / "graph-test"
    args = [COMPILER, "build", ROOT / "tests/compiler/features/jit_source_graph.coil",
            "--unit", unit, "--backend", "llvm", "-o", binary]
    if sys.platform.startswith("linux"):
        flags = shlex.split(run([os.environ.get("LLVM_CONFIG", "llvm-config"),
                                 "--ldflags", "--libs", "--system-libs"], ROOT))
        for flag in flags:
            args += ["--link-flag", flag]
    run(args, ROOT)
    project = work / "consumer"
    project.mkdir()
    entry = project / "entry.coil"
    dependency = project / "arbitrary-file-name.coil"
    entry.write_text('(module graph.entry)\n(import "graph.dependency" :as dep)\n'
                     '(defn main [] (-> i64) (dep/value))\n')
    dependency.write_text('(module graph.dependency)\n(defn value [] (-> i64) 42)\n')
    env = dict(os.environ, COIL_NAMESPACE_ROOTS=str(project))
    assert "42" in run([binary, entry], Path("/"), env)
    dependency.write_text('(module graph.dependency)\n(defn value [\n')
    assert "42" in run([binary, entry, "invalid"], Path("/"), env)
    assert "42" in run([binary, project / "missing.coil", "invalid"], Path("/"), env)
    print("PASS: graph discovery follows module identity; prebuilt ABI is opaque; "
          "read failures retain diagnostics; discarded graph does not poison the JIT")
