#!/usr/bin/env python3
"""Reject syntax mutation that bypasses TaggedForm revision invalidation."""

from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[3]
ALLOWED = {
    ("loader.coil", "mk-tagged"),
    ("loader.coil", "tagged-rewrite!"),
    ("expander.coil", "tower-snapshot"),
    ("expander.coil", "tower-meta-snapshot"),
    ("expander.coil", "tower-capture-metas!"),
    ("expander.coil", "tower-restore-metas!"),
    ("expander.coil", "do-produced"),
    ("metaengine.coil", "meta-sub-forms"),
    ("resolve.coil", "resolve-program"),
}
DEFN = re.compile(r"^\(defn\s+([^\s\[]+)")
FORM_WRITE = re.compile(r"\((?:store!\s+\(field\s+[^)]*\sform\)|set!\s+\(\.form\s+)")

bad: list[str] = []
for path in sorted((ROOT / "src/compiler").glob("*.coil")):
    current = "<top-level>"
    for line_no, line in enumerate(path.read_text().splitlines(), 1):
        match = DEFN.match(line)
        if match:
            current = match.group(1)
        if FORM_WRITE.search(line) and (path.name, current) not in ALLOWED:
            bad.append(f"{path.relative_to(ROOT)}:{line_no}: {current}: {line.strip()}")

if bad:
    raise SystemExit(
        "TaggedForm syntax writes must use tagged-rewrite! (or be an audited "
        "identity-preserving snapshot/construction site):\n" + "\n".join(bad)
    )

print(f"tagged form revision guard: {len(ALLOWED)} audited mutation/construction sites")
