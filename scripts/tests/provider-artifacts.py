#!/usr/bin/env python3
"""Explicit precompiled syntax-reader build/load and invalidation contract."""
from pathlib import Path
import os
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()


with tempfile.TemporaryDirectory(prefix=".coil-provider-artifact-", dir=ROOT) as raw:
    work = Path(raw)
    output = work / "artifacts"
    output.mkdir()
    provider = work / "provider.coil"
    shutil.copyfile(ROOT / "tests/compiler/features/provider_artifact.coil", provider)
    source = work / "source.input"
    source.write_text("a guest input\n")
    env = os.environ.copy()
    env["COIL_NAMESPACE_ROOTS"] = str(work)
    for name in ["COIL_MODULE_MAP", "COIL_READERS", "COIL_META_INTERP", "COIL_META_ARENA"]:
        env.pop(name, None)
    options = ["-O0", "--meta-opt=2"]

    def run(args, expected=0):
        result = subprocess.run(list(map(str, args)), cwd=ROOT, env=env,
                                capture_output=True, text=True, timeout=120)
        assert result.returncode == expected, (args, result.returncode, result.stdout, result.stderr)
        return result

    built = run([COMPILER, "build-provider", "artifact.fixture.reader", "read-source", "-o", output, *options])
    artifact = Path(built.stdout.strip().splitlines()[-1])
    assert artifact.is_dir(), built
    assert sorted(p.name for p in output.iterdir()) == [artifact.name]
    assert sorted(p.name for p in artifact.iterdir()) == ["image.dylib" if sys.platform == "darwin" else "image.so", "metadata"]
    published = {p.name: (p.read_bytes(), p.stat().st_mtime_ns) for p in artifact.iterdir()}
    repeated = run([COMPILER, "build-provider", "artifact.fixture.reader", "read-source", "-o", output, *options])
    assert Path(repeated.stdout.strip().splitlines()[-1]) == artifact
    assert {p.name: (p.read_bytes(), p.stat().st_mtime_ns) for p in artifact.iterdir()} == published
    binary = work / "program"
    base = [COMPILER, "build", source, "--reader-artifact", artifact, *options, "-o", binary]
    run(base)
    run([binary], 42)
    run([COMPILER, "check", source, "--reader-artifact", artifact, *options])
    run([COMPILER, "emit-obj", source, "--reader-artifact", artifact, *options, "-o", work / "module.o"])
    for replaced in [["--meta-opt=1"], ["--debug-checks", "--meta-opt=2"]]:
        result = run([COMPILER, "check", source, "--reader-artifact", artifact, "-O0", *replaced], 1)
        assert "stale provider artifact" in result.stdout + result.stderr
    original = provider.read_bytes()
    stamp = provider.stat()
    provider.write_bytes(original + b"\n; content change\n")
    os.utime(provider, ns=(stamp.st_atime_ns, stamp.st_mtime_ns))
    result = run(base, 1)
    assert "changed dependency" in result.stdout + result.stderr
    provider.write_bytes(original)
    run(base)
    run([binary], 42)

    image = artifact / ("image.dylib" if sys.platform == "darwin" else "image.so")
    image.write_bytes(published[image.name][0] + b"corrupt")
    result = run(base, 1)
    assert "image digest mismatch" in result.stdout + result.stderr
    result = run([COMPILER, "build-provider", "artifact.fixture.reader", "read-source", "-o", output, *options], 1)
    assert "image digest mismatch" in result.stdout + result.stderr
    assert sorted(p.name for p in output.iterdir()) == [artifact.name]
    image.write_bytes(published[image.name][0])
    metadata = artifact / "metadata"
    metadata.write_bytes(published["metadata"][0][:17])
    run(base, 1)
    metadata.write_bytes(published["metadata"][0])
    run(base)
    run([binary], 42)

    # Imported text is part of the artifact's consumed source closure, including
    # when its timestamp is restored. It is not a module/source-map entry.
    embedded = work / "embedded.txt"
    embedded.write_text("(do (module artifact.output) (defn main [] (-> i64) 42))")
    provider.write_text('''(module artifact.fixture.reader)
(import "coil.primitive" :as p)
(defn read-source [(context Code)] (-> Code)
  (p/code-read (include-str "embedded.txt") context))
(reader-provider "artifact.fixture.reader" read-source)
''')
    built = run([COMPILER, "build-provider", "artifact.fixture.reader", "read-source", "-o", output, *options])
    embedded_artifact = Path(built.stdout.strip().splitlines()[-1])
    embedded_base = [COMPILER, "build", source, "--reader-artifact", embedded_artifact, *options, "-o", binary]
    run(embedded_base)
    run([binary], 42)
    stamp = embedded.stat()
    embedded.write_text(embedded.read_text().replace("42", "41"))
    os.utime(embedded, ns=(stamp.st_atime_ns, stamp.st_mtime_ns))
    result = run(embedded_base, 1)
    assert "changed dependency" in result.stdout + result.stderr

    # Semantic reflection cannot be baked against an unrelated future program.
    # Reject a reachable semantic operation, but do not reject dead SDK helpers.
    before = sorted(output.iterdir())
    provider.write_text('''(module artifact.fixture.reader)
(import "coil.primitive" :as p)
(defn read-source [(context Code)] (-> Code) (p/code-decl context))
(reader-provider "artifact.fixture.reader" read-source)
''')
    result = run([COMPILER, "build-provider", "artifact.fixture.reader", "read-source", "-o", output, *options], 1)
    assert "cannot use semantic reflection" in result.stdout + result.stderr, result
    assert sorted(output.iterdir()) == before, "failed publication left staging artifacts"

    # Configured readers decode imported guest files; the entry remains ordinary
    # Coil. Their --use selects decoding, not a second semantic provider graph.
    provider.write_text('''(module artifact.fixture.reader)
(import "coil.primitive" :as p)
(defn read-source [(context Code)] (-> Code)
  (p/code-read "(do (module artifact.guest) (defn answer [] (-> i64) 42))" context))
(reader-provider "artifact.fixture.reader" read-source)
''')
    env["COIL_READERS"] = ".input=artifact.fixture.reader\n"
    env["COIL_MODULE_MAP"] = "artifact.guest=" + str(source) + "\n"
    configured_options = [*options, "--use", "artifact.fixture.reader"]
    built = run([COMPILER, "build-provider", "artifact.fixture.reader", "read-source", "-o", output, *configured_options])
    configured_artifact = Path(built.stdout.strip().splitlines()[-1])
    main = work / "main.coil"
    main.write_text('(module artifact.main) (import "artifact.guest" :as guest) (defn main [] (-> i64) (guest/answer))')
    run([COMPILER, "build", main, "--reader-artifact", configured_artifact, *configured_options, "-o", binary])
    run([binary], 42)
    run([COMPILER, "check", main, "--reader-artifact", configured_artifact, *configured_options])
    print("PASS: native entry/configured reader artifacts; idempotent publication; command/config reuse; source/include-str invalidation; corrupted image/metadata rejection; reachable reflection rejection; failed publication cleanup; retry")
