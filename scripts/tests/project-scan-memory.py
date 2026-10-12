#!/usr/bin/env python3
"""Source the program never imports costs nothing to keep.

1. A project build's pre-build syntax scan reads only the project, and lets go.
   Before a project `build`, Coil parses every source the manifest owns to look
   for obsolete syntax. It once scanned a workspace root's default `src` and
   `tests` instead of its members (building one example parsed the whole
   compiler first), and parsed into the driver's allocator, so all of it stayed
   resident for the whole compile. A trivial entry is built alone, then as the
   member of a workspace whose root `src` is this checkout's src tree; the
   second may exceed the first by no more than 32 MiB. Obsolete syntax outside
   the members is not reported.

2. Namespace discovery retains no source text from unimported files and no paths
   from irrelevant directory entries. Modules whose declaration follows a long
   comment, many long-named files and many empty directories are added beside an
   entry, and the frontend's live load arena may grow only by a bounded amount.

Usage: project-scan-memory.py [COMPILER] [--full]
  COMPILER defaults to $COIL. The default sizes the index check at about 2,000
  directory entries (FAST); --full uses 16,000 files and 8,000 directories.
"""
from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402

ALLOWANCE = 32 * 1024 * 1024
ENTRY = '(module scan.main)\n(defn main [] (-> i64) (println "hello") 0)\n'
MiB = 1024 * 1024


def peak_rss(compiler: str, args: list, cwd: Path) -> int:
    flag = "-l" if sys.platform == "darwin" else "-v"
    result = subprocess.run(["/usr/bin/time", flag, compiler, *map(str, args)], cwd=cwd,
                            text=True, capture_output=True)
    if result.returncode != 0:
        raise SystemExit(f"FAIL {args}: exit {result.returncode}\n{result.stdout}{result.stderr}")
    pattern = (r"(\d+)\s+maximum resident set size" if sys.platform == "darwin"
               else r"Maximum resident set size \(kbytes\):\s*(\d+)")
    match = re.search(pattern, result.stderr)
    if not match:
        raise SystemExit(f"FAIL no resident-set line:\n{result.stderr}")
    return int(match[1]) * (1 if sys.platform == "darwin" else 1024)


def project_scan(compiler: str, work: Path) -> None:
    workspace = work / "workspace"
    member = workspace / "app"
    member.mkdir(parents=True)
    (workspace / "Coil.toml").write_text('[workspace]\nname = "ws"\nmembers = ["app"]\n')
    (member / "Coil.toml").write_text('[package]\nname = "app"\nentry = "main.coil"\n')
    (member / "main.coil").write_text(ENTRY.replace("scan.main", "ws.app.main"))
    # Not a member: this checkout's own src tree (compiler, standard library,
    # examples), linked rather than copied.
    (workspace / "src").symlink_to(ROOT / "src", target_is_directory=True)
    alone = work / "alone"
    alone.mkdir()
    (alone / "main.coil").write_text(ENTRY)

    standalone = peak_rss(compiler, ["build", "main.coil", "-o", work / "alone.out"], alone)
    in_project = peak_rss(compiler, ["build", "app/main.coil", "-o", work / "project.out"], workspace)
    growth = in_project - standalone
    print(f"standalone {standalone} B; as a workspace member {in_project} B; growth {growth} B")
    if growth >= ALLOWANCE:
        raise SystemExit("FAIL the pre-build scan read non-member source and kept it resident")

    stray = work / "stray-workspace"
    (stray / "app").mkdir(parents=True)
    (stray / "src").mkdir()
    (stray / "Coil.toml").write_text('[workspace]\nname = "ws"\nmembers = ["app"]\n')
    (stray / "app" / "Coil.toml").write_text('[package]\nname = "app"\nentry = "main.coil"\n')
    (stray / "app" / "main.coil").write_text(ENTRY.replace("scan.main", "ws.app.main"))
    (stray / "src" / "old.coil").write_text('(module stray.old)\n(defn f [] (-> i64) (alloc-stack i64) 0)\n')
    result = subprocess.run([compiler, "build", "app/main.coil", "-o", str(work / "stray.out")],
                            cwd=stray, text=True, capture_output=True)
    if result.returncode != 0:
        raise SystemExit(f"FAIL stray workspace build:\n{result.stdout}{result.stderr}")
    if "obsolete" in result.stderr:
        raise SystemExit(f"FAIL the scan reported a directory that is not a member:\n{result.stderr}")
    print("ok   the pre-build scan reads only the members and lets go")


def load_arena_bytes(compiler: str, root: Path, source: Path, output: Path) -> int:
    env = os.environ.copy()
    env.pop("COIL_READERS", None)
    env["COIL_NAMESPACE_ROOTS"] = str(root)
    env["COIL_TRACE"] = "1"
    result = subprocess.run([compiler, "emit-obj", str(source), "-O0", "-o", str(output)],
                            cwd=ROOT, env=env, text=True, capture_output=True)
    if result.returncode != 0:
        raise SystemExit(f"FAIL emit-obj {source}:\n{result.stdout}{result.stderr}")
    prefix = "coil-profile\tarena.live\tfrontend.load\t"
    measurements = [int(line[len(prefix):]) for line in result.stderr.splitlines() if line.startswith(prefix)]
    if len(measurements) != 1:
        raise SystemExit(f"FAIL expected one frontend.load measurement:\n{result.stderr}")
    return measurements[0]


def namespace_index(compiler: str, root: Path, full: bool) -> None:
    # (modules behind a 256 KiB comment, irrelevant files, empty directories)
    modules, files, directories = (128, 16000, 8000) if full else (32, 1500, 500)
    root.mkdir()
    entry = root / "entry.coil"
    entry.write_text("(module index.fixture.entry)\n(defn main [] (-> i64) 0)\n")
    baseline = load_arena_bytes(compiler, root, entry, root / "baseline.o")

    # The module declaration follows a long comment. The indexer must read through
    # it, yet retain only the module name and path. The last module is imported,
    # so discovery must still resolve its header.
    comment = ";" + "x" * (256 * 1024 - 2) + "\n"
    last = modules - 1
    for i in range(modules):
        (root / f"mod{i}.coil").write_text(
            comment + f"(module index.fixture.mod{i})\n"
            + ("(defn answer [] (-> i64) 42)\n" if i == last else ""))
    entry.write_text("(module index.fixture.entry)\n"
                     f'(import "index.fixture.mod{last}" :as late)\n'
                     "(defn main [] (-> i64) (late/answer))\n")
    indexed = load_arena_bytes(compiler, root, entry, root / "indexed.o")
    source_bytes = modules * len(comment)
    increase = indexed - baseline
    # Retaining the text would cost all of it; 12 MiB was the bound for 32 MiB.
    if increase >= source_bytes * 3 // 8:
        raise SystemExit(f"FAIL {source_bytes} B of unimported source retained {increase} B")

    # Long names make a retained joined path observable without a big payload:
    # each costs about 200 B if kept. Allow an eighth of that.
    for i in range(files):
        (root / f"noise-{i:05d}-{'q' * 100}.txt").touch()
    with_noise = load_arena_bytes(compiler, root, entry, root / "with-noise.o")
    path_increase = with_noise - indexed
    if path_increase >= max(64 * 1024, files * 200 // 8):
        raise SystemExit(f"FAIL {files} irrelevant files retained {path_increase} B")

    for i in range(directories):
        (root / f"empty-{i:05d}-{'d' * 180}").mkdir()
    with_directories = load_arena_bytes(compiler, root, entry, root / "with-directories.o")
    directory_increase = with_directories - with_noise
    if directory_increase >= max(64 * 1024, directories * 280 // 8):
        raise SystemExit(f"FAIL {directories} empty directories retained {directory_increase} B")
    print(f"ok   namespace index: {source_bytes} B of unimported source retained {increase} B; "
          f"{files} irrelevant files {path_increase} B; {directories} empty directories {directory_increase} B")


def main() -> int:
    cleanup_on_signal.install()
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("compiler", nargs="?", default=os.environ.get("COIL"))
    parser.add_argument("--full", action="store_true", help="the full-size namespace index check")
    args = parser.parse_args()
    if not args.compiler:
        parser.error("give a compiler or set COIL")
    compiler = str(Path(args.compiler).resolve()) if os.sep in args.compiler else args.compiler
    # Outside the checkout: a directory under ROOT would find the repository's own Coil.toml.
    with tempfile.TemporaryDirectory(prefix="coil-project-scan-",
                                     dir=os.environ.get("COIL_TEST_SCRATCH")) as directory:
        project_scan(compiler, Path(directory))
        namespace_index(compiler, Path(directory) / "index", args.full)
    print("project scan memory: PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
