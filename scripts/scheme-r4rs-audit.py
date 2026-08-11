#!/usr/bin/env python3
"""Run the classic Jaffer R4RS/R5RS corpus through Coil's runtime evaluator.

The GPL corpus is fetched into a temporary directory and is never vendored.
This audit excludes only the suite helper that depends on an unprovided
``list-length`` extension, its nonstandard ``ash`` extension, and its deep
tail-recursive float-printer stress test. The
ordinary inexact, exact-bignum, port, reader, and report-procedure tests remain.
"""

from __future__ import annotations

import argparse
import hashlib
import subprocess
import tempfile
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
URL = "https://groups.csail.mit.edu/mac/ftpdir/scm/r4rstest.scm"
SHA256 = "c033d57b0942657877ede72ee5e4911d84557c2a2d82cba493b6a6374b317668"

PROBE = r'''(module scheme-r4rs-audit)
(import "coil.scheme" :use *)

(define audit-environment (interaction-environment))
(define audited-forms 0)
(define skipped-forms 0)
(define (contains-deferred? datum)
  (if (symbol? datum)
      (eq? datum 'list-length)
      (if (pair? datum)
          (or (contains-deferred? (car datum))
              (contains-deferred? (cdr datum)))
          (if (vector? datum)
              (contains-deferred? (vector->list datum))
              #f))))
(define (audit-port port)
  (let ((datum (read port)))
    (if (eof-object? datum) #t
        (begin
          (set! audited-forms (+ audited-forms 1))
          (if (contains-deferred? datum)
              (set! skipped-forms (+ skipped-forms 1))
              (continuation-eval datum audit-environment))
          (audit-port port)))))

(defn main [] (-> i64)
  (call-with-input-file "r4rstest.scm" audit-port)
  ;; The upstream file deliberately defines these optional/deeper groups but
  ;; leaves invocation to the runner. Exercise the full multi-shot generator,
  ;; promises, and Scheme-4 compatibility groups explicitly.
  (continuation-eval '(test-cont) audit-environment)
  (continuation-eval '(test-delay) audit-environment)
  (continuation-eval '(test-sc4) audit-environment)
  (display "COIL-R4RS-AUDIT forms=") (display audited-forms)
  (display " skipped-extension=") (display skipped-forms) (newline)
  (fixnum-value (mk-fixnum 0)))
'''


def prepare_corpus(source: str) -> str:
    """Remove three explicitly out-of-scope stress/extension calls."""
    replacements = {
        "\t (test-inexact)\n\t (test-inexact-printing)": "\t (test-inexact)",
        "  (test 1 test-ash 1 640)\n": "",
        "  (test -1 test-ash -1 640)\n": "",
        "  (test #xABCD test-ash #xABCD 8 19 1 1 200 -64)\n": "",
    }
    for old, new in replacements.items():
        if old not in source:
            raise RuntimeError(f"upstream corpus shape changed near {old!r}")
        source = source.replace(old, new, 1)
    return source


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default="coil")
    parser.add_argument("--source", type=Path,
                        help="use an already-downloaded pristine r4rstest.scm")
    args = parser.parse_args()

    raw = (args.source.read_bytes() if args.source else
           urllib.request.urlopen(URL, timeout=30).read())
    digest = hashlib.sha256(raw).hexdigest()
    if digest != SHA256:
        raise RuntimeError(
            f"r4rstest.scm SHA-256 changed: expected {SHA256}, got {digest}"
        )

    with tempfile.TemporaryDirectory(prefix="coil-r4rs-audit-") as tmp_name:
        tmp = Path(tmp_name)
        (tmp / "r4rstest.scm").write_text(
            prepare_corpus(raw.decode("utf-8")), encoding="utf-8"
        )
        probe = tmp / "audit.coil"
        binary = tmp / "audit"
        probe.write_text(PROBE, encoding="utf-8")
        subprocess.run(
            [args.compiler, "build", str(probe), "-o", str(binary), "--quiet"],
            cwd=ROOT, check=True,
        )
        proc = subprocess.run(
            [str(binary)], cwd=tmp, capture_output=True, text=True, check=False,
        )
        if proc.returncode != 0:
            raise RuntimeError(
                f"corpus process exited {proc.returncode}\n{proc.stdout}{proc.stderr}"
            )
        if "BUT EXPECTED" in proc.stdout or "errors were:" in proc.stdout:
            raise RuntimeError(f"corpus reported failures\n{proc.stdout}")
        marker = next(
            (line for line in proc.stdout.splitlines()
             if line.startswith("COIL-R4RS-AUDIT ")),
            None,
        )
        if marker is None:
            raise RuntimeError(f"corpus did not reach its audit marker\n{proc.stdout}")
        print(f"PASS classic R4RS/R5RS corpus: {marker.removeprefix('COIL-R4RS-AUDIT ')}")
        print("exclusions: list-length extension; nonstandard ash; deep tail-recursive float printer")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
