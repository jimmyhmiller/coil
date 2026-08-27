#!/usr/bin/env python3
"""Focused regressions for diagnostic snapshot audit/refresh behavior."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[2]
SPEC = importlib.util.spec_from_file_location("coil_oracle", ROOT / "scripts/oracle.py")
assert SPEC is not None and SPEC.loader is not None
oracle = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(oracle)


class DiagnosticSnapshotRefreshTests(unittest.TestCase):
    def setUp(self) -> None:
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        self.oracle = self.root / "tests/compiler/oracle"
        oracle.ROOT = self.root
        oracle.ORACLE = self.oracle

    def tearDown(self) -> None:
        self.temp.cleanup()

    def write(self, relative: str, text: str = "") -> Path:
        path = self.root / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text)
        return path

    def test_missing_golden_is_a_mismatch_not_an_exception(self) -> None:
        self.write("tests/compiler/oracle/diag/corpus.txt", "feature.coil\n")
        self.write("tests/compiler/oracle/diag/build-corpus.txt")
        self.write("feature.coil", "(module feature)\n")
        self.assertEqual(oracle.gate_diag(Path("/usr/bin/false"), False), 1)

    def test_refresh_preserves_explicit_external_fixture(self) -> None:
        self.write("tests/compiler/oracle/diag/inputs/local.coil", "(module local)\n")
        self.write("tests/compiler/features/external.coil", "(module external)\n")
        self.write(
            "tests/compiler/oracle/diag/corpus.txt",
            "tests/compiler/features/external.coil\n",
        )
        self.assertEqual(oracle.snapshot_diag(Path("/usr/bin/false")), 0)
        corpus = oracle.read_list(self.oracle / "diag/corpus.txt")
        self.assertEqual(
            corpus,
            [
                "tests/compiler/features/external.coil",
                "tests/compiler/oracle/diag/inputs/local.coil",
            ],
        )


if __name__ == "__main__":
    unittest.main()
