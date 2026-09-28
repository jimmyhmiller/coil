#!/usr/bin/env python3
"""`dev.py install` pairs a compiler only with the library it was built from."""
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts" / "compiler"))
import toolchain_stamp  # noqa: E402

COMPILER = Path(sys.argv[1]).resolve()


def install(source: Path, dest: Path) -> subprocess.CompletedProcess:
    # The pairing check is about the compiler and library; warming the coil.jit
    # unit is an -O3 build of the whole compiler that it never looks at.
    return subprocess.run([sys.executable, str(ROOT / "scripts/dev.py"), "install",
                           "--source", str(source), "--dest", str(dest), "--no-warm-unit"],
                          cwd=ROOT, text=True, capture_output=True, timeout=600)


with tempfile.TemporaryDirectory(prefix="coil-install-pairing-") as raw:
    work = Path(raw)
    source = work / "coil"
    shutil.copy2(COMPILER, source)
    dest = work / "prefix" / "bin" / "coil"

    missing = install(source, dest)
    assert missing.returncode != 0 and "no coil.toolchain" in missing.stderr, missing
    assert not dest.exists(), "an unstamped compiler was installed"

    toolchain_stamp.stamp_path(source).write_text("0" * 64 + "\n")
    stale = install(source, dest)
    assert stale.returncode != 0 and "different library sources" in stale.stderr, stale
    assert not (dest.parent.parent / "lib").exists(), "a stale pairing touched the library"

    toolchain_stamp.stamp_path(source).write_text(toolchain_stamp.digest() + "\n")
    matched = install(source, dest)
    assert matched.returncode == 0, matched
    assert toolchain_stamp.stamp_digest(toolchain_stamp.stamp_path(dest).read_text()) == toolchain_stamp.digest()

    # A build from an ancestor of the installed commit is a downgrade.
    head = subprocess.run(["git", "-C", str(ROOT), "rev-parse", "HEAD"], text=True,
                          capture_output=True, check=True).stdout.strip()
    parent = subprocess.run(["git", "-C", str(ROOT), "rev-parse", "HEAD~1"], text=True,
                            capture_output=True, check=True).stdout.strip()
    toolchain_stamp.stamp_path(dest).write_text(f"{toolchain_stamp.digest()}\ncommit {head}\n")
    toolchain_stamp.stamp_path(source).write_text(f"{toolchain_stamp.digest()}\ncommit {parent}\n")
    older = install(source, dest)
    assert older.returncode != 0 and "refusing to downgrade" in older.stderr, older
    allowed = subprocess.run([sys.executable, str(ROOT / "scripts/dev.py"), "install", "--allow-downgrade",
                              "--source", str(source), "--dest", str(dest)],
                             cwd=ROOT, text=True, capture_output=True, timeout=600)
    assert allowed.returncode == 0, allowed
print("install pairing: PASS")
