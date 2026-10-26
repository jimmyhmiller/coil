#!/usr/bin/env python3
"""COMPREHENSIVE: the x86-64 Linux half, run on a remote host over ssh.

    scripts/tests/x64-host.py [--host HOST]      (default $COIL_X64_HOST or computer.jimmyhmiller.com)

Copies this working tree's tracked files to the host (and ../coil-tpde's, the
tpde backend's package, beside them), then there: bootstraps the
LLVM Linux compiler from the committed seed (no install), runs the runtime corpus
on it, self-hosts through the native x64 backend (fixpoint, the corpus on
`--backend x64`, the SysV C ABI against gcc, the encoder against llvm-mc), and
checks the ELF output. The host needs LLVM 21, a C compiler, python3 and node.

When the host is unreachable this fails and says so: an x64 run that silently
did nothing would read as a pass. Run `dev.py test comprehensive --no-x64` to
leave it out deliberately.
"""

from __future__ import annotations

import argparse
import os
import shlex
import subprocess
import sys
import uuid
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

REMOTE_SCRIPT = """
set -eu
cd {dir}/coil
echo "== bundled libcurl"; scripts/native/build-curl.sh >/dev/null
echo "== bootstrap the LLVM Linux compiler (no install)"
COIL_SKIP_INSTALL=1 python3 scripts/dev.py build linux
echo "== runtime corpus on Linux, LLVM backend"
python3 scripts/oracle.py corpus llvm --compiler build/bin/coil
echo "== self-host through the x64 backend: fixpoint, corpus, C ABI, encoder"
python3 scripts/dev.py build x64
echo "== ELF output"
scripts/compiler/oracle/x64/gate-elf.sh build/bin/coil-x64
echo "x64 host: PASS"
"""


def ssh(host: str, command: str, **kwargs) -> subprocess.CompletedProcess:
    return subprocess.run(["ssh", "-o", "BatchMode=yes", "-o", "ConnectTimeout=10", host, command], **kwargs)


def copy_tree(host: str, root: Path, dest: str) -> bool:
    files = subprocess.run(["git", "ls-files", "-z", "--cached", "--others", "--exclude-standard"],
                           cwd=root, capture_output=True, check=True).stdout
    present = b"\0".join(f for f in files.split(b"\0") if f and (root / f.decode()).exists())
    print(f"== copying {root} to {host}:~/{dest}", flush=True)
    # macOS tar would also send extended attributes GNU tar on the host warns about.
    tar = subprocess.Popen(["tar", "--no-mac-metadata", "--no-xattrs", "--null", "-T", "-", "-czf", "-"],
                           cwd=root, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                           env={**os.environ, "COPYFILE_DISABLE": "1"})
    untar = subprocess.Popen(["ssh", "-o", "BatchMode=yes", host,
                              f"mkdir -p {dest} && tar -xzf - -C {dest}"], stdin=tar.stdout)
    tar.stdin.write(present)
    tar.stdin.close()
    tar.stdout.close()
    return untar.wait() == 0 and tar.wait() == 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--host", default=os.environ.get("COIL_X64_HOST", "computer.jimmyhmiller.com"))
    parser.add_argument("--keep", action="store_true", help="leave the remote copy for inspection")
    args = parser.parse_args()

    probe = ssh(args.host, "uname -sm", capture_output=True, text=True, timeout=30)
    if probe.returncode != 0 or probe.stdout.split() != ["Linux", "x86_64"]:
        print(f"FAIL the x64 host {args.host} is unreachable or not x86-64 Linux "
              f"({(probe.stdout + probe.stderr).strip()[:300]}); run with --no-x64 to leave it out")
        return 1
    remote = f"coil-comprehensive-x64-{uuid.uuid4().hex[:8]}"
    tpde = (ROOT / "../coil-tpde").resolve()
    if not (tpde / ".git").exists():
        print(f"FAIL no coil-tpde checkout at {tpde} (scripts/native/fetch-tpde.sh)")
        return 1
    for tree, name in ((ROOT, "coil"), (tpde, "coil-tpde")):
        if not copy_tree(args.host, tree, f"{remote}/{name}"):
            print(f"FAIL could not copy {tree} to the x64 host")
            return 1
    try:
        result = ssh(args.host, "bash -c " + shlex.quote(REMOTE_SCRIPT.format(dir=remote)), timeout=1800)
        return 0 if result.returncode == 0 else 1
    finally:
        if not args.keep:
            ssh(args.host, f"rm -rf {remote}", timeout=120)


if __name__ == "__main__":
    raise SystemExit(main())
