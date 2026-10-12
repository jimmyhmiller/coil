#!/usr/bin/env python3
"""A precompiled reader provider: built once, reused, invalidated, never trusted
when damaged.

- `build-provider` publishes one artifact directory (an image and its metadata),
  and publishing again with nothing changed leaves it byte- and time-identical;
- a program builds against the artifact with `--reader-artifact` and runs;
- an edit to the provider's source is noticed even when its mtime is restored, and
  reverting the edit makes the artifact usable again;
- a damaged image is refused, both when used and when publishing over it.

Usage: provider-artifacts.py [COMPILER]     (default: $COIL)
"""
from __future__ import annotations

import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402

IMAGE = "image.dylib" if sys.platform == "darwin" else "image.so"


def main() -> int:
    cleanup_on_signal.install()
    raw = sys.argv[1] if len(sys.argv) > 1 else os.environ.get("COIL")
    if not raw:
        raise SystemExit("usage: provider-artifacts.py COMPILER (or set COIL)")
    compiler = str(Path(raw).resolve()) if os.sep in raw else raw
    with tempfile.TemporaryDirectory(prefix="provider-artifact-",
                                     dir=os.environ.get("COIL_TEST_SCRATCH")) as scratch:
        work = Path(scratch)
        output = work / "artifacts"
        output.mkdir()
        provider = work / "provider.coil"
        shutil.copyfile(ROOT / "tests/readers/provider_artifact.coil", provider)
        source = work / "source.input"
        source.write_text("a guest input\n")
        env = os.environ.copy()
        env["COIL_NAMESPACE_ROOTS"] = str(work)
        for name in ("COIL_MODULE_MAP", "COIL_READERS", "COIL_META_INTERP", "COIL_META_ARENA"):
            env.pop(name, None)
        options = ["-O0", "--meta-opt=2"]
        publish = [compiler, "build-provider", "rd.artifact", "read-source", "-o", str(output), *options]

        def run(args: list[str], expected: int = 0, needle: str | None = None) -> str:
            result = subprocess.run(args, cwd=ROOT, env=env, capture_output=True, text=True, timeout=120)
            text = result.stdout + result.stderr
            if result.returncode != expected:
                raise SystemExit(f"FAIL {' '.join(args)}: exit {result.returncode}, want {expected}\n{text}")
            if needle is not None and needle not in text:
                raise SystemExit(f"FAIL {' '.join(args)}: output lacks {needle!r}\n{text}")
            return result.stdout

        artifact = Path(run(publish).strip().splitlines()[-1])
        if sorted(p.name for p in artifact.iterdir()) != [IMAGE, "metadata"]:
            raise SystemExit(f"FAIL the artifact holds {sorted(p.name for p in artifact.iterdir())}")
        published = {p.name: (p.read_bytes(), p.stat().st_mtime_ns) for p in artifact.iterdir()}
        if Path(run(publish).strip().splitlines()[-1]) != artifact \
                or {p.name: (p.read_bytes(), p.stat().st_mtime_ns) for p in artifact.iterdir()} != published \
                or [p.name for p in output.iterdir()] != [artifact.name]:
            raise SystemExit("FAIL publishing an unchanged provider again changed the artifact")
        print("ok   build-provider publishes one artifact, and again leaves it untouched")

        binary = work / "program"
        build = [compiler, "build", str(source), "--reader-artifact", str(artifact), *options, "-o", str(binary)]
        run(build)
        run([str(binary)], 42)
        print("ok   a program builds against the artifact and runs")

        original = provider.read_bytes()
        stamp = provider.stat()
        provider.write_bytes(original + b"\n; content change\n")
        os.utime(provider, ns=(stamp.st_atime_ns, stamp.st_mtime_ns))
        run(build, 1, "changed dependency")
        provider.write_bytes(original)
        os.utime(provider, ns=(stamp.st_atime_ns, stamp.st_mtime_ns))
        run(build)
        print("ok   an edit to the provider invalidates the artifact even with its mtime restored")

        image = artifact / IMAGE
        image.write_bytes(published[IMAGE][0] + b"corrupt")
        run(build, 1, "image digest mismatch")
        run(publish, 1, "image digest mismatch")
        if [p.name for p in output.iterdir()] != [artifact.name]:
            raise SystemExit("FAIL a refused publication left staging files behind")
        print("ok   a damaged image is refused when used and when publishing over it")
    print("provider artifacts: PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
