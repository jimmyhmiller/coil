#!/usr/bin/env python3
"""A newly registered stage fixture must fail the snapshot audit."""
import contextlib
import importlib.util
import io
from pathlib import Path
import subprocess
import tempfile
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location("oracle", ROOT / "scripts/oracle.py")
oracle = importlib.util.module_from_spec(spec)
spec.loader.exec_module(oracle)

with tempfile.TemporaryDirectory() as directory:
    base = Path(directory)
    (base / "ir/reference").mkdir(parents=True)
    (base / "ir/corpus.txt").write_text("old.coil\n")
    (base / "ir/reference" / (oracle.mangle("old.coil") + ".dump")).write_bytes(b"output\n")
    result = subprocess.CompletedProcess([], 0, b"output\n", b"")
    with patch.object(oracle, "ORACLE", base), patch.object(oracle, "run", return_value=result):
        with patch.dict(oracle.STAGE_INPUTS, {"ir": ["old.coil"]}):
            assert oracle.gate(Path("candidate"), "ir", False) == 0
        with patch.dict(oracle.STAGE_INPUTS, {"ir": ["old.coil", "new.coil"]}):
            output = io.StringIO()
            with contextlib.redirect_stdout(output):
                assert oracle.gate(Path("candidate"), "ir", False) == 1
            assert "declared input missing from snapshot corpus: new.coil" in output.getvalue()

print("oracle corpus: newly registered stage input cannot silently pass")
