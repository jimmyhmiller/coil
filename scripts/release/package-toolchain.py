#!/usr/bin/env python3
"""Create a deterministic Coil toolchain archive and its publication descriptor."""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
import os
import shutil
import stat
import subprocess
import tarfile
import tempfile
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def target_name() -> str:
    import platform

    machine = platform.machine().lower()
    if os.uname().sysname == "Darwin" and machine == "arm64":
        return "aarch64-apple-darwin"
    if os.uname().sysname == "Linux" and machine in {"x86_64", "amd64"}:
        return "x86_64-unknown-linux-gnu"
    raise SystemExit(f"unsupported release host: {os.uname().sysname}/{machine}")


def add_tree(archive: tarfile.TarFile, root: Path, epoch: int) -> None:
    for path in sorted(root.rglob("*"), key=lambda item: item.as_posix()):
        name = path.relative_to(root).as_posix()
        if path.is_symlink():
            raise SystemExit(f"release tree must not contain symlinks: {name}")
        info = archive.gettarinfo(str(path), arcname=name)
        info.uid = info.gid = 0
        info.uname = info.gname = ""
        info.mtime = epoch
        if info.isdir():
            info.mode = 0o755
            archive.addfile(info)
        elif info.isfile():
            info.mode = 0o755 if path.stat().st_mode & stat.S_IXUSR else 0o644
            with path.open("rb") as handle:
                archive.addfile(info, handle)
        else:
            raise SystemExit(f"release tree has unsupported file type: {name}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--compiler", default="build/bin/coil")
    parser.add_argument("--output", required=True)
    parser.add_argument("--commit", required=True)
    parser.add_argument("--sequence", required=True, type=int)
    parser.add_argument("--published-at")
    parser.add_argument("--signing-identity")
    parser.add_argument("--notary-profile")
    args = parser.parse_args()

    commit = args.commit.lower()
    if len(commit) not in {40, 64} or any(c not in "0123456789abcdef" for c in commit):
        raise SystemExit("--commit must be a full lowercase hexadecimal commit ID")
    if args.sequence < 1:
        raise SystemExit("--sequence must be positive")
    published_at = args.published_at or datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
    output = Path(args.output).resolve()
    output.mkdir(parents=True, exist_ok=True)
    target = target_name()
    artifact = output / f"coil-{target}.tar.gz"

    with tempfile.TemporaryDirectory(prefix="coil-release-") as temporary:
        tree = Path(temporary) / "toolchain"
        destination = tree / "bin" / "coil"
        subprocess.run(
            ["python3", str(ROOT / "scripts/dev.py"), "install", "--source", args.compiler,
             "--dest", str(destination)], cwd=ROOT, check=True
        )
        if args.signing_identity:
            if os.uname().sysname != "Darwin":
                raise SystemExit("Developer ID signing is only supported on macOS")
            subprocess.run(["codesign", "--force", "--options", "runtime", "--timestamp",
                            "--sign", args.signing_identity, str(destination)], check=True)
            subprocess.run(["codesign", "--verify", "--strict", "--verbose=2",
                            str(destination)], check=True)
        if args.notary_profile:
            if not args.signing_identity:
                raise SystemExit("--notary-profile requires --signing-identity")
            submission = Path(temporary) / "notarization.zip"
            subprocess.run(["ditto", "-c", "-k", "--keepParent", str(destination),
                            str(submission)], check=True)
            subprocess.run(["xcrun", "notarytool", "submit", str(submission), "--wait",
                            "--keychain-profile", args.notary_profile], check=True)
        # A release archive contains immutable toolchain content, never the developer's
        # warmed cache. Consumers can build that unit locally on first use.
        shutil.rmtree(tree / "lib" / "coil" / "units", ignore_errors=True)
        shutil.rmtree(tree / "lib" / "coil" / "compiler" / "build", ignore_errors=True)
        release_metadata = tree / "share" / "coil" / "release.json"
        release_metadata.parent.mkdir(parents=True)
        release_metadata.write_text(json.dumps({
            "schema": 1,
            "channel": "nightly",
            "commit": commit,
            "sequence": args.sequence,
            "published_at": published_at,
            "target": target,
        }, sort_keys=True) + "\n")
        epoch = int(os.environ.get("SOURCE_DATE_EPOCH", "0"))
        with artifact.open("wb") as raw:
            with gzip.GzipFile(filename="", mode="wb", fileobj=raw, compresslevel=9,
                               mtime=epoch) as compressed:
                with tarfile.open(fileobj=compressed, mode="w|") as archive:
                    add_tree(archive, tree, epoch)

    digest = hashlib.sha256(artifact.read_bytes()).hexdigest()
    descriptor = {
        "target": target,
        "artifact": artifact.name,
        "sha256": digest,
        "size": artifact.stat().st_size,
        "commit": commit,
        "sequence": args.sequence,
        "published_at": published_at,
    }
    (output / f"{target}.json").write_text(json.dumps(descriptor, sort_keys=True) + "\n")
    print(json.dumps(descriptor, sort_keys=True))


if __name__ == "__main__":
    main()
