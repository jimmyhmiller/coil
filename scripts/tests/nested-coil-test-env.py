#!/usr/bin/env python3
"""A coil launched by a test must reload the manifest in the test's cwd."""

from __future__ import annotations

import pathlib
import json
import subprocess
import sys
import tempfile


compiler = pathlib.Path(sys.argv[1]).resolve()
with tempfile.TemporaryDirectory(prefix="coil-nested-test-env-") as tmp:
    root = pathlib.Path(tmp)
    (root / "src").mkdir()
    (root / "tests").mkdir()
    (root / "Coil.toml").write_text(
        '[package]\nname = "nested"\n\n[metaprograms]\nuse = ["nested.rule"]\n'
    )
    (root / "src/rule.coil").write_text("""\
(module nested.rule)
(import "coil.primitive" :as p)
(defn check-rejected [(modules Code)] (-> Code)
  (for [i 0 (p/code-count modules)]
    (let [m (p/code-nth modules i)]
      (when (p/code-eq (p/code-nth m 0) `nested.reject)
        (p/report m "project checker ran") 0)
      0))
  `0)
(checker check-rejected :phase before-expand)
""")
    (root / "src/reject.coil").write_text(
        "(module nested.reject)\n(defn value [] (-> i64) 0)\n"
    )
    (root / "tests/nested_test.coil").write_text(f"""\
(module nested.test)
(import "coil.primitive" :as p)
(import "coil.alloc" :as alloc)
(import "coil.slice" :use [slice-new])
(import "coil.str" :as str)
(import "coil.subprocess" :as sp)
(import "coil.cancellation" :as cancellation)
(import "coil.time" :as time)
(deftest nested-coil-applies-project-checker
  (let [args (p/alloc-stack (array (slice u8) 2))
        result (p/alloc-stack sp/RunResult)]
    (store! (p/index args 0) "check")
    (store! (p/index args 1) "src/reject.coil")
    (match (time/duration-millis 20)
      (Err [_] (assert false))
      (Ok [grace]
        (let [options (sp/run-options {json.dumps(str(compiler))}
                         (slice-new [(slice u8)] (p/cast (ptr (slice u8)) args) 2)
                         "" 1000 1000 (None [time/Instant])
                         (p/cast (ptr cancellation/Cancellation) 0) grace)]
          (match (sp/run (alloc/malloc-allocator) result options)
            (Err [_] (assert false))
            (Ok [_]
              (let [bad (match (load (field result status))
                          (sp/Exited [code] (!= code 0))
                          (sp/Signaled [_] false))
                    diagnostic (match (str/str-find (load (field result stderr))
                                                   "project checker ran")
                                 (Some [_] true)
                                 (None [] false))]
                (sp/run-result-free (alloc/malloc-allocator) result)
                (assert (and bad diagnostic))))))))))
""")

    direct = subprocess.run(
        [compiler, "check", "src/reject.coil"], cwd=root, text=True,
        capture_output=True, timeout=60,
    )
    assert direct.returncode != 0 and "project checker ran" in direct.stderr, direct

    nested = subprocess.run(
        [compiler, "test", "tests/nested_test.coil"], cwd=root, text=True,
        capture_output=True, timeout=120,
    )
    assert nested.returncode == 0, nested.stdout + nested.stderr
    print("PASS nested coil reloads project metaprograms")
