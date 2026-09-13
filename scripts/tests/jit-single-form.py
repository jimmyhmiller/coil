#!/usr/bin/env python3
"""Prove incremental work through the real terminal, at compiler boundaries."""
from collections import Counter
from pathlib import Path
import os
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
compiler = Path(sys.argv[1]).resolve()
source = """(defn proof-old [] (-> i64) 7)
(defn proof-new [] (-> i64) (+ (proof-old) 1))
(proof-new)
:type (proof-old)
(defn invalid [] (-> i64) true)
(proof-new)
:quit
"""
run = subprocess.run([str(compiler), "repl"], input=source, cwd=ROOT,
                     env=dict(os.environ, COIL_JIT_TRACE="1"),
                     capture_output=True, text=True, timeout=120)
assert run.returncode == 0, (run.returncode, run.stdout, run.stderr)
assert run.stdout.count("coil> 8\n") == 2, run.stdout
assert "coil> i64\n" in run.stdout, run.stdout
assert "invalid" in run.stderr and "error:" in run.stderr, run.stderr

submissions = []
active = None
for line in run.stderr.splitlines():
    if not line.startswith("jit-work "):
        continue
    _, stage, name = line.split(" ", 2)
    if stage == "begin":
        assert active is None, "unterminated submission trace"
        active = []
    elif stage == "end":
        assert active is not None, "end without a submission"
        submissions.append((name, active))
        active = None
    else:
        assert active is not None, (stage, name)
        active.append((stage, name))
assert active is None and len(submissions) == 7, (active, len(submissions))
assert [status for status, _ in submissions] == [
    "accepted", "accepted", "accepted", "accepted", "aborted", "rejected", "accepted"]

# Positive controls: the trace must see actual work when old is first submitted.
old = submissions[1][1]
assert ("parse", "proof-old") in old
assert ("check", "replsession.proof-old") in old
assert ("emit", "replsession.proof-old") in old

print("Submission                         old parsed  old checked  old emitted  new emitted")
for label, index, expected_new in (("define proof-new", 2, 1),
                                   ("evaluate proof-new", 3, 0),
                                   ("query type of proof-old", 4, 0),
                                   ("reject invalid definition", 5, 0),
                                   ("evaluate after rejection", 6, 0)):
    events = submissions[index][1]
    assert ("retained", "replsession.proof-old") in events, (label, events)
    counts = Counter(events)
    old_counts = [sum(n for (stage, name), n in counts.items()
                      if stage == wanted and name.rsplit(".", 1)[-1] == "proof-old")
                  for wanted in ("parse", "check", "emit")]
    assert old_counts == [0, 0, 0], (label, old_counts)
    new_emitted = counts["emit", "replsession.proof-new"]
    assert new_emitted == expected_new, (label, new_emitted)
    # Prove there is no hidden repeat of unrelated compiler/runtime bodies.
    emitted = [name for stage, name in events if stage == "emit"]
    allowed = {"replsession.proof-new"} if expected_new else set()
    unexpected = [name for name in emitted
                  if name not in allowed and not name.startswith("replsession.__coil_jit_entry_")]
    assert not unexpected, (label, unexpected)
    checked = [name for stage, name in events if stage == "check"]
    allowed_checks = {"replsession.proof-new", "replsession.invalid"}
    assert all(name in allowed_checks or name.startswith("replsession.__coil_jit_entry_")
               for name in checked), (label, checked)
    print(f"{label:34} {old_counts[0]:10} {old_counts[1]:12} {old_counts[2]:12} {new_emitted:12}")

# API removal is a structural contract too: no dormant replay implementation or
# alias can silently reintroduce a second compilation route.
for file in ("src/compiler/driver.coil", "src/compiler/jit_api.coil", "src/compiler/jit.coil"):
    text = (ROOT / file).read_text()
    for removed in ("repl-def-source", "repl-session-submit!", "repl-session-replace!",
                    "repl-session-prepare-replace", "repl-refresh-abi-declarations",
                    "repl-infer-type-unscoped", "jit-submit!", "jit-replace-source!",
                    "jit-prepare-replace", "set-legacy-reload!", "jit-syms-lookup-unique-leaf"):
        assert removed not in text, (file, removed)
print("PASS: real REPL submissions do not parse, check, or emit prior function bodies")

# Runtime bindings and opt-in mutation use ordinary language semantics too.
# In particular the terminal must not rewrite `def` into a compile-time const.
dynamic = """(import "coil.var" :use [var-static])
(defn double [(x i64)] (-> i64) (* x 2))
(defn triple [(x i64)] (-> i64) (* x 3))
(def hot (var-static (fnptr c [i64] i64) (primitive/fnptr-of double)))
(hot 10)
(set hot (primitive/fnptr-of triple))
(hot 10)
:quit
"""
run = subprocess.run([str(compiler), "repl"], input=dynamic, cwd=ROOT,
                     capture_output=True, text=True, timeout=120)
assert run.returncode == 0, (run.returncode, run.stdout, run.stderr)
assert "error:" not in run.stderr, run.stderr
assert "coil> 20\n" in run.stdout and "coil> 30\n" in run.stdout, run.stdout
print("PASS: terminal runtime def supports ordinary Var publication and update")
