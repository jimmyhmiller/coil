#!/usr/bin/env python3
"""Stage the web playground into web/dist/.

Produces the two payloads the page fetches -- the wasm compiler and a pack of the
Coil sources it reads at runtime -- laid out exactly like an installed toolchain,
because that is what the compiler's stdlib discovery walks (scripts/dev.py::install_library):

    /coil/bin/coil                  argv[0]; never read, only realpath'd
    /coil/lib/coil/prelude.coil
    /coil/lib/coil/stdlib/*.coil

Everything is also written precompressed (.br/.gz) so a static host can serve it with
Content-Encoding and never compress 3.4 MB on the fly.
"""
import argparse
import gzip
import json
import shutil
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
WEB = ROOT / "web"
MAGIC = b"COILFS1\0"

# Where the compiler lives inside the virtual filesystem. Must match web/vfs.js.
VFS_LIB = "/coil/lib/coil"


def pack(files: dict[str, bytes]) -> bytes:
    header, blob, offset = [], bytearray(), 0
    for path in sorted(files):
        data = files[path]
        header.append([path, offset, len(data)])
        blob += data
        offset += len(data)
    encoded = json.dumps(header, separators=(",", ":")).encode()
    return MAGIC + struct.pack("<I", len(encoded)) + encoded + bytes(blob)


def compress(path: Path) -> None:
    """Write path.gz and path.br beside path."""
    data = path.read_bytes()
    path.with_suffix(path.suffix + ".gz").write_bytes(gzip.compress(data, 9))
    if shutil.which("brotli"):
        subprocess.run(["brotli", "-f", "-q", "11", "-o", str(path) + ".br", str(path)], check=True)
    else:
        print(f"  note: brotli not on PATH; skipping {path.name}.br", file=sys.stderr)


def human(n: int) -> str:
    return f"{n / 1024:.0f} KiB" if n < 1024 * 1024 else f"{n / 1024 / 1024:.2f} MiB"


def report(path: Path) -> None:
    raw = path.stat().st_size
    parts = [f"{path.name}: {human(raw)}"]
    for ext in (".gz", ".br"):
        c = path.with_suffix(path.suffix + ext)
        if c.exists():
            parts.append(f"{ext.lstrip('.')} {human(c.stat().st_size)}")
    print("  " + "  ".join(parts))


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--wasm", default=str(ROOT / "bootstrap/seeds/wasm/coilc.wasm"),
                    help="the wasm64-hosted compiler to ship")
    ap.add_argument("--out", default=str(WEB / "dist"))
    args = ap.parse_args()

    wasm = Path(args.wasm).resolve()
    if not wasm.is_file():
        print(f"error: no such compiler: {wasm}", file=sys.stderr)
        return 1

    out = Path(args.out).resolve()
    shutil.rmtree(out, ignore_errors=True)
    out.mkdir(parents=True)

    files: dict[str, bytes] = {}
    stdlib = ROOT / "src/stdlib"
    for source in sorted(stdlib.rglob("*.coil")):
        files[f"{VFS_LIB}/stdlib/{source.relative_to(stdlib).as_posix()}"] = source.read_bytes()
    files[f"{VFS_LIB}/prelude.coil"] = (ROOT / "src/compiler/prelude.coil").read_bytes()
    if not files:
        print("error: no stdlib sources found", file=sys.stderr)
        return 1

    (out / "coilc.wasm").write_bytes(wasm.read_bytes())
    (out / "coil-fs.bin").write_bytes(pack(files))
    for name in ("index.html", "coil-worker.js", "vfs.js"):
        shutil.copy2(WEB / name, out / name)

    for name in ("coilc.wasm", "coil-fs.bin", "coil-worker.js", "vfs.js", "index.html"):
        compress(out / name)

    print(f"staged {len(files)} Coil sources into {out}")
    for name in ("coilc.wasm", "coil-fs.bin", "index.html", "coil-worker.js", "vfs.js"):
        report(out / name)

    total_br = sum((out / n).with_suffix(Path(n).suffix + ".br").stat().st_size
                   for n in ("coilc.wasm", "coil-fs.bin", "index.html", "coil-worker.js", "vfs.js")
                   if (out / n).with_suffix(Path(n).suffix + ".br").exists())
    if total_br:
        print(f"  total over the wire (brotli): {human(total_br)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
