#!/usr/bin/env python3
"""Deterministic repository hygiene inventory.

This is the source-side half of Coil's permanent hygiene audit. The compiler
tracks syntax origin/scope at runtime (`coil dump-hygiene`) and rejects unscoped
datum linkage; this inventory makes every explicit identifier-construction site
reviewable and prevents new legacy/unknown producers from entering unnoticed.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MANIFEST = ROOT / "docs/design/FULL_HYGIENE_MANIFEST.json"
SCAN_ROOTS = ("src", "tests", "scripts")
CALL = re.compile(
    r"\(primitive/(fresh-identifier|datum->syntax|syntax->datum|code-symbol|gensym)\b"
)


def code_lines(text: str) -> list[str]:
    """Mask comments and strings while preserving line/column coordinates."""
    out: list[str] = []
    line: list[str] = []
    in_string = False
    escaped = False
    in_comment = False
    for char in text:
        if char == "\n":
            out.append("".join(line))
            line = []
            in_comment = False
            escaped = False
            continue
        if in_comment:
            line.append(" ")
        elif in_string:
            line.append(" ")
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = False
        elif char == ";":
            line.append(" ")
            in_comment = True
        elif char == '"':
            line.append(" ")
            in_string = True
        else:
            line.append(char)
    if line:
        out.append("".join(line))
    return out


def subsystem(path: str) -> str:
    parts = path.split("/")
    return "/".join(parts[:2]) if len(parts) > 1 else parts[0]


def justification(path: str, op: str, line: str) -> str:
    if op == "fresh-identifier":
        return "fresh lexical identity created once and explicitly reused"
    if op == "datum->syntax":
        return "explicit context introduction at a documented capture/protocol boundary"
    if op == "syntax->datum":
        return "explicit context removal for a stable caller-visible declaration/protocol name"
    # Staged metacompilation fixtures. The gensym is bound to `marker`: an opaque
    # token that keys a `(stage MARKER ...)` declaration against the `(MARKER
    # ENTRY ARG...)` requests the same transform rewrites into the guest. It is
    # matched by identity, never bound and never resolved, so it is data. Keyed on
    # the binding spelling rather than the file alone, so a gensym used any other
    # way in these files still has to be classified.
    if (op == "gensym"
            and path.startswith("tests/metaprogramming/compile-and-run/staged_")
            and "[marker (primitive/gensym)" in line):
        return "staged metacompilation marker: an opaque token keying a (stage MARKER ...) declaration and its request sites; never bound, never resolved"
    if op == "code-symbol":
        if "fresh-identifier" in line:
            return "display spelling input to fresh-identifier; not itself used lexically"
        if "syntax->datum" in line:
            return "display spelling input to explicit context removal"
        if path.endswith("lints/named_constructor.coil"):
            return "keyword datum assembled for named-constructor syntax"
        if path.endswith("lints/field_syntax.coil") or path.endswith("prelude.coil"):
            return "field/qualified selector datum inspected or emitted as syntax data"
        if path.endswith("closure.coil"):
            return "closure capture field selector or named-constructor keyword assembled as syntax data"
        if path.endswith("derive.coil") or path.endswith("generated_named_constructor.coil"):
            return "named-constructor keyword assembled as syntax data"
        if path.endswith("code_symbol_is_not_identifier.coil"):
            return "negative fixture proving unscoped datum cannot establish lexical identity"
        if path.startswith("tests/metaprogramming/compile-and-run/staged_"):
            return "guest syntax datum a stage entry returns, matched structurally by the next transform round rather than resolved"
        if path.endswith("lints/no_star_imports.coil"):
            return "module-name datum read out of an import declaration for comparison and for the rewritten :use list; never a lexical identifier"
    return ""


def classify(path: str, op: str, line: str) -> tuple[str, str, str]:
    why = justification(path, op, line)
    if op == "fresh-identifier":
        return "fresh-local", "binding-or-reference", why
    if op in {"datum->syntax", "syntax->datum"}:
        return "explicit-intentional-capture", "binding-or-reference", why
    if op == "gensym" and why:
        return "non-identifier-data", "data", why
    if op == "code-symbol" and why:
        return "non-identifier-data", "data", why
    return "unclassified", "unknown", why


def records() -> list[dict[str, object]]:
    out: list[dict[str, object]] = []
    for root_name in SCAN_ROOTS:
        root = ROOT / root_name
        for file in sorted(root.rglob("*.coil")):
            if not file.is_file():
                continue
            rel = file.relative_to(ROOT).as_posix()
            source_lines = file.read_text().splitlines()
            lines = code_lines(file.read_text())
            for lineno, line in enumerate(lines, 1):
                for match in CALL.finditer(line):
                    op = match.group(1)
                    nearby = " ".join(source_lines[max(0, lineno - 4) : lineno + 3])
                    state, position, why = classify(rel, op, nearby)
                    annotation = ""
                    for prior in reversed(source_lines[max(0, lineno - 7) : lineno]):
                        marker = re.search(r";\s*hygiene:\s*(.+)$", prior)
                        if marker:
                            annotation = marker.group(1).strip()
                            break
                    if state == "explicit-intentional-capture" and not annotation:
                        state = "unclassified"
                        why = "explicit context operation requires a nearby '; hygiene:' annotation"
                    elif annotation:
                        why = annotation
                    out.append(
                        {
                            "subsystem": subsystem(rel),
                            "file": rel,
                            "line": lineno,
                            "column": match.start() + 1,
                            "producer": f"primitive/{op}",
                            "phase": "metaprogram",
                            "spelling": source_lines[lineno - 1][match.end() :].strip(),
                            "identifier_origin": op,
                            "position": position,
                            "target_binding": "runtime-syntax-object",
                            "explicit_context_operation": op
                            if op in {"datum->syntax", "syntax->datum"}
                            else "",
                            "state": state,
                            "justification": why,
                        }
                    )
    return out


def rendered() -> str:
    return json.dumps(
        {"schema": 1, "records": records()}, indent=2, sort_keys=True
    ) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    text = rendered()
    bad = [r for r in records() if r["state"] == "unclassified"]
    if bad:
        for record in bad:
            print(
                f"{record['file']}:{record['line']}:{record['column']}: "
                f"unclassified hygiene producer {record['producer']}",
                file=sys.stderr,
            )
        return 1
    if args.check:
        if not MANIFEST.exists() or MANIFEST.read_text() != text:
            print(
                "hygiene manifest is stale; regenerate with "
                "python3 scripts/hygiene-audit.py and update it via apply_patch",
                file=sys.stderr,
            )
            return 1
        print(f"hygiene audit: {len(records())} classified, 0 unclassified")
        return 0
    if args.write:
        MANIFEST.write_text(text)
        print(f"wrote {MANIFEST.relative_to(ROOT)} ({len(records())} classified)")
        return 0
    sys.stdout.write(text)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
