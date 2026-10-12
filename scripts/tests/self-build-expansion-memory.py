#!/usr/bin/env python3
"""Bound repeated expansion during AOT self-build (coil-bugs cjpnoy7yjfc).

The report measured roughly 1.1 GB retained by resolve-meta-output's second
whole-program expansion. At 356398e5 the snapshot/subforms/rounds still retain
719 MB. Permit 512 MiB: substantial room for generated forms, but below that
whole-program cost. Measure arena.live, not platform-dependent RSS or timing.
Declaration requalification was already reduced by 4c0b1063; print its current
cost and the authoritative checker/monomorphizer costs without bounding them.
"""
import os
from pathlib import Path
import subprocess
import sys
import tempfile

import cleanup_on_signal

cleanup_on_signal.install()
ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()
PHASES = {
    "frontend.expand.meta-snapshot",
    "frontend.expand.meta-subforms",
    "frontend.expand.stage3-rounds",
}
LIMIT = 512 * 1024 * 1024

(ROOT / "build").mkdir(exist_ok=True)
with tempfile.TemporaryDirectory(prefix="self-build-memory-", dir=ROOT / "build") as directory:
    output = Path(directory) / "coil"
    result = subprocess.run(
        [str(COMPILER), "build", "src/compiler/main.coil", "-O0", "-o", str(output)],
        cwd=ROOT, capture_output=True, text=True, timeout=600,
        env={**os.environ, "COIL_TRACE": "1", "COIL_NAMESPACE_ROOTS": "src:tests:scripts",
             "COIL_STRICT_BUNDLE": "0"},
    )
    assert result.returncode == 0, (result.returncode, result.stdout, result.stderr[-6000:])
    assert output.is_file() and output.stat().st_size > 0, "self-build produced no executable"

    stack = []
    live = None
    pending = None
    repeated = []
    costs = {}
    observed = set()
    for line in result.stderr.splitlines():
        if line.startswith("coil-trace begin "):
            name = line.split()[2]
            in_meta = any(item[0] == "frontend.check.meta-elaboration" for item in stack)
            stack.append((name, live, in_meta))
            observed.add(name)
        elif line.startswith("coil-trace end "):
            name = line.split()[2]
            assert stack and stack[-1][0] == name, ("unbalanced trace", line, stack[-3:])
            pending = stack.pop()
        elif line.startswith("coil-profile\tarena.live\t"):
            _, _, name, value = line.split("\t")
            live = int(value)
            if pending is not None and pending[0] == name:
                _, before, in_meta = pending
                if in_meta and name in PHASES:
                    assert before is not None, ("missing entry arena measurement", name)
                    assert live >= before, ("expansion changed profiling arenas", name, before, live)
                    repeated.append((name, live - before))
                pending = None
        elif line.startswith("coil-profile\tallocated\t"):
            _, _, name, value = line.split("\t")
            if name in {"frontend.resolve.prepare-table", "frontend.check.functions",
                        "frontend.monomorphize"}:
                costs.setdefault(name, []).append(int(value))

    assert not stack, ("incomplete trace", stack)
    required = {"frontend.expand", "frontend.check.meta-elaboration",
                "frontend.check.typecheck", "frontend.monomorphize", "backend.object-emit"}
    assert required <= observed, ("missing self-build phases", required - observed)
    # The bound sums growth in PHASES inside meta elaboration only, so a zero sum
    # proves nothing unless those phases still exist under these names: the
    # initial expansion runs every one of them.
    assert PHASES <= observed, ("measured phases were renamed or are no longer traced",
                                PHASES - observed)
    assert live is not None and all(name in costs for name in
                                   ("frontend.resolve.prepare-table", "frontend.check.functions",
                                    "frontend.monomorphize")), "missing memory measurements"
    total = sum(value for _, value in repeated)
    print(f"repeated meta-output expansion arena.live growth: {total} B (limit {LIMIT} B)", flush=True)
    print(f"repeated expansion phases: {repeated}", flush=True)
    print(f"prepare-table allocations: {costs['frontend.resolve.prepare-table']}", flush=True)
    print(f"largest check.functions allocation: {max(costs['frontend.check.functions'])} B; "
          f"monomorphize allocations: {costs['frontend.monomorphize']}", flush=True)
    assert total <= LIMIT, "meta-output expansion still retains whole-program snapshots and round state"
