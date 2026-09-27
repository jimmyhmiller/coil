#!/usr/bin/env python3
"""A project build's pre-build syntax scan must scan only the project, and let go.

Before a project `build`, Coil reads and parses every source the manifest owns to
look for obsolete syntax. Two faults made that scan expensive:
- at a workspace root it scanned the default `src` and `tests` directories
  instead of the members, so building src/examples/fib.coil from this checkout
  parsed the whole compiler, standard library and test tree first;
- it parsed into the driver's allocator, so everything it read stayed resident
  for the entire compile (520 MB against 290 MB for the same build alone).

The bound is relative, so it does not track the compiler's own working set: a
trivial entry is built alone, then as the member of a workspace whose root `src`
is this checkout's src tree (code the workspace does not own). The
workspace build may exceed the standalone peak by no more than 32 MiB.
"""
from pathlib import Path
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()
COMPILER = Path(sys.argv[1]).resolve()
ALLOWANCE = 32 * 1024 * 1024
ENTRY = '(module scan.main)\n(defn main [] (-> i64) (println "hello") 0)\n'


def peak_rss(args, cwd):
    flag = "-l" if sys.platform == "darwin" else "-v"
    result = subprocess.run(["/usr/bin/time", flag, str(COMPILER), *map(str, args)], cwd=cwd,
                            text=True, capture_output=True)
    assert result.returncode == 0, (args, result.returncode, result.stdout, result.stderr)
    pattern = (r"(\d+)\s+maximum resident set size" if sys.platform == "darwin"
               else r"Maximum resident set size \(kbytes\):\s*(\d+)")
    match = re.search(pattern, result.stderr)
    assert match, ("no resident-set line", result.stderr)
    return int(match[1]) * (1 if sys.platform == "darwin" else 1024)


# Outside the checkout: a directory under ROOT would find the repository's own Coil.toml.
with tempfile.TemporaryDirectory(prefix="coil-project-scan-") as directory:
    work = Path(directory)
    workspace = work / "workspace"
    member = workspace / "app"
    member.mkdir(parents=True)
    (workspace / "Coil.toml").write_text('[workspace]\nname = "ws"\nmembers = ["app"]\n')
    (member / "Coil.toml").write_text('[package]\nname = "app"\nentry = "main.coil"\n')
    (member / "main.coil").write_text(ENTRY.replace("scan.main", "ws.app.main"))
    # Not a member: this checkout's own src tree (compiler, standard library, examples),
    # linked rather than copied. A scan that reads it is scanning code the workspace
    # does not own; the old scan parsed all of it and kept it for the whole compile.
    (workspace / "src").symlink_to(ROOT / "src", target_is_directory=True)
    alone = work / "alone"
    alone.mkdir()
    (alone / "main.coil").write_text(ENTRY)

    standalone = peak_rss(["build", "main.coil", "-o", work / "alone.out"], alone)
    in_project = peak_rss(["build", "app/main.coil", "-o", work / "project.out"], workspace)
    growth = in_project - standalone
    print(f"standalone {standalone} B; as a workspace member {in_project} B; growth {growth} B")
    assert growth < ALLOWANCE, ("the pre-build scan stayed resident", standalone, in_project)

    # Obsolete syntax outside the members is not the workspace's to migrate.
    stray = work / "stray-workspace"
    (stray / "app").mkdir(parents=True)
    (stray / "src").mkdir()
    (stray / "Coil.toml").write_text('[workspace]\nname = "ws"\nmembers = ["app"]\n')
    (stray / "app" / "Coil.toml").write_text('[package]\nname = "app"\nentry = "main.coil"\n')
    (stray / "app" / "main.coil").write_text(ENTRY.replace("scan.main", "ws.app.main"))
    (stray / "src" / "old.coil").write_text('(module stray.old)\n(defn f [] (-> i64) (alloc-stack i64) 0)\n')
    result = subprocess.run([str(COMPILER), "build", "app/main.coil", "-o", str(work / "stray.out")],
                            cwd=stray, text=True, capture_output=True)
    assert result.returncode == 0, (result.stdout, result.stderr)
    assert "obsolete" not in result.stderr, ("scanned a non-member directory", result.stderr)
    print("project scan memory: passed")
