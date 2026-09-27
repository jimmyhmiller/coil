#!/usr/bin/env python3
"""Compile and run the Coil examples embedded in the reference docs.

A ```coil fence is a complete program. One with a `main` is run; one without is
typechecked. If the next fence is ```output, the program's stdout must equal it.
Syntax sketches that are not programs belong in plain ``` or ```text fences.

    python3 scripts/docs/check-guide-examples.py                # the guide + cheatsheet
    python3 scripts/docs/check-guide-examples.py docs/reference/PROJECTS.md
    python3 scripts/docs/check-guide-examples.py --compiler build/bin/coil -v

Local only: run it whenever you edit an example. It is not part of CI.
"""
import argparse
import concurrent.futures
import os
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
DEFAULT_DOCS = ["docs/reference/LANGUAGE_GUIDE.md", "docs/reference/CHEATSHEET.md"]
FENCE = re.compile(r"^```([A-Za-z0-9_-]*)[ \t]*\n(.*?)^```[ \t]*$", re.MULTILINE | re.DOTALL)


class Example:
    def __init__(self, path, line, source, expected):
        self.path = path
        self.line = line
        self.source = source
        self.expected = expected

    def label(self):
        return f"{os.path.relpath(self.path)}:{self.line}"


def examples(path):
    text = open(path).read()
    fences = list(FENCE.finditer(text))
    found = []
    for i, fence in enumerate(fences):
        if fence.group(1) != "coil":
            continue
        expected = None
        if i + 1 < len(fences) and fences[i + 1].group(1) == "output":
            between = text[fence.end():fences[i + 1].start()]
            if between.strip() == "":
                expected = fences[i + 1].group(2)
        line = text.count("\n", 0, fence.start()) + 1
        found.append(Example(path, line, fence.group(2), expected))
    return found


def check(example, compiler, workdir, index):
    source = os.path.join(workdir, f"example_{index}.coil")
    with open(source, "w") as handle:
        handle.write(example.source)
    runs = re.search(r"\(defn\s+main\b", example.source) is not None
    command = [compiler, "run" if runs else "check", source]
    try:
        result = subprocess.run(command, cwd=workdir, capture_output=True, text=True, timeout=300)
    except subprocess.TimeoutExpired:
        return f"timed out: {' '.join(command)}"
    if result.returncode != 0 and not runs:
        return f"`coil check` failed:\n{result.stdout}{result.stderr}"
    if runs and result.returncode != 0 and example.expected is None:
        return f"`coil run` exited {result.returncode}:\n{result.stdout}{result.stderr}"
    if example.expected is not None and result.stdout.strip() != example.expected.strip():
        return ("stdout differs from the ```output block\n"
                f"--- expected\n{example.expected.rstrip()}\n--- actual\n{result.stdout.rstrip()}\n"
                f"{result.stderr}")
    return None


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("docs", nargs="*", help="Markdown files (default: guide and cheatsheet)")
    parser.add_argument("--compiler", default="coil")
    parser.add_argument("--jobs", type=int, default=os.cpu_count() or 4)
    parser.add_argument("-v", "--verbose", action="store_true")
    args = parser.parse_args()
    # Examples run in their own directories, so a relative compiler path must be fixed now.
    compiler = os.path.abspath(args.compiler) if os.sep in args.compiler else shutil.which(args.compiler)
    if compiler is None or not os.access(compiler, os.X_OK):
        print(f"no executable compiler: {args.compiler}", file=sys.stderr)
        return 2

    if args.docs:
        paths = [os.path.abspath(p) for p in args.docs]
    else:
        paths = [os.path.join(ROOT, p) for p in DEFAULT_DOCS]
    todo = [example for path in paths for example in examples(path)]
    if not todo:
        print("no ```coil examples found", file=sys.stderr)
        return 1

    failures = 0
    with tempfile.TemporaryDirectory(prefix="coil-guide-examples-") as workdir:
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
            futures = {}
            for index, example in enumerate(todo):
                # Each example gets its own directory: nothing it builds can collide.
                own = os.path.join(workdir, str(index))
                os.mkdir(own)
                futures[pool.submit(check, example, compiler, own, index)] = example
            for future in concurrent.futures.as_completed(futures):
                example = futures[future]
                problem = future.result()
                if problem:
                    failures += 1
                    print(f"FAIL {example.label()}\n{problem}\n", file=sys.stderr)
                elif args.verbose:
                    print(f"ok   {example.label()}")
    print(f"{len(todo) - failures}/{len(todo)} examples pass")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
