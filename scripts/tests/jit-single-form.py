"""Prove single-form compilation and static definitions through the real REPL."""
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
(defn proof-old [] (-> i64) 15)
(proof-new)
:type (proof-old)
(defn proof-bad [] (-> i64) true)
(proof-new)
:quit
"""
run = subprocess.run([str(compiler), "repl"], input=source, cwd=ROOT,
                     env=dict(os.environ, COIL_JIT_TRACE="1"),
                     capture_output=True, text=True, timeout=120)
assert run.returncode == 0, (run.returncode, run.stdout, run.stderr)
# The REPL has no policy for replacing live code: the second proof-old is
# refused, and proof-new keeps calling the one it was compiled against.
assert run.stdout.count("coil> 8\n") == 3, run.stdout
assert "coil> 16\n" not in run.stdout, run.stdout
assert "coil> i64\n" in run.stdout, run.stdout
assert "static definition 'replsession.proof-old' already exists" in run.stderr, run.stderr

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
assert active is None and len(submissions) == 9, (active, len(submissions))
assert [status for status, _ in submissions] == [
    "accepted", "accepted", "accepted", "accepted", "rejected", "accepted",
    "aborted", "rejected", "accepted"]

old_name = "replsession.proof-old"
old_parse = "proof-old"
assert ("emit", old_name) in submissions[1][1], submissions[1][1]
assert ("parse", old_parse) in submissions[1][1]
assert ("check", old_name) in submissions[1][1]

emitted_before = {name for stage, name in submissions[1][1]
                  if stage == "emit" and not name.startswith("replsession.__coil_jit_entry_")}
print("Submission                         old parsed  old checked  old emitted")
for index, label in enumerate(("define caller", "evaluate caller", "reject redefinition",
                               "evaluate after rejection", "query type", "reject body",
                               "evaluate after rejection"), 2):
    events = submissions[index][1]
    # The retained event enumerates only the compact Program overlay. Older
    # accepted functions can live solely in the persistent checked index, so
    # absence from that trace is not a recompile or a loss of availability.
    counts = Counter(events)
    old_counts = [counts["emit", old_name], counts["check", old_name]]
    assert old_counts == [0, 0], (label, old_counts)
    # Every previously accepted function remains metadata only, including the
    # caller. Check actual compiler work.
    retained = {name for stage, name in events if stage == "retained"}
    for stage, name in events:
        if stage in ("check", "emit"):
            assert name not in retained, (label, stage, name)
        if stage == "parse":
            assert "replsession." + name not in retained, (label, stage, name)
    emitted = [name for stage, name in events if stage == "emit"]
    implementations = [name for name in emitted if name.startswith("replsession.proof-")]
    assert implementations == (["replsession.proof-new"] if index == 2 else []), (label, implementations)
    native = {name for name in emitted
              if not name.startswith("replsession.__coil_jit_entry_")}
    assert not native.intersection(emitted_before), (label, native.intersection(emitted_before))
    emitted_before.update(native)
    print(f"{label:34} {counts['parse', old_parse]:10} {old_counts[1]:12} {old_counts[0]:12}")

for file in ("src/compiler/driver.coil", "src/compiler/jit_api.coil", "src/compiler/jit.coil"):
    text = (ROOT / file).read_text()
    for removed in ("repl-def-source", "repl-session-submit!", "repl-session-replace!",
                    "repl-session-prepare-replace", "repl-refresh-abi-declarations",
                    "repl-infer-type-unscoped", "jit-submit!", "jit-replace-source!",
                    "jit-prepare-replace", "set-legacy-reload!", "jit-syms-lookup-unique-leaf"):
        assert removed not in text, (file, removed)
print("PASS: a refused redefinition leaves old callers alone, and accepted bodies are never recompiled")

# Explicit static functions and ordinary runtime bindings remain available.
dynamic = """(import "coil.var" :use [var-static])
(defn* double [(x i64)] (-> i64) (* x 2))
(defn* triple [(x i64)] (-> i64) (* x 3))
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

# Retained nominal types, batches, recursion, namespaces, and reset.
source = """(defn f [] (-> i64) 15)
(f)
(defstruct Box [(x i64)])
(defn val [(x Box)] (-> i64) (.x x))
(val (Box :x 17))
(defn val1 [(x Box)] (-> i64) (+ (.x x) 1))
(val1 (Box :x 17))
(defstruct Pair [T] [(x T)])
(defn pairval [(x (Pair i64))] (-> i64) (.x x))
(pairval (Pair :x 42))
:compile (defn once [] (-> i64) 1) (defn twice [] (-> i64) (+ (once) 1))
(twice)
(defn fact [(n i64)] (-> i64) (if (= n 0) 1 (* n (fact (- n 1)))))
(fact 5)
(module other)
(defn f [] (-> i64) 3)
(f)
(module replsession)
(f)
:reset
(defn f [] (-> i64) 4)
(f)
:quit
"""
run = subprocess.run([str(compiler), "repl"], input=source, cwd=ROOT,
                     capture_output=True, text=True, timeout=120)
assert run.returncode == 0 and "error:" not in run.stderr, (run.stdout, run.stderr)
for value in (15, 17, 18, 42, 2, 120, 3, 4):
    assert f"coil> {value}\n" in run.stdout, (value, run.stdout)
print("PASS: retained types, batches, recursion, namespaces, and reset")
