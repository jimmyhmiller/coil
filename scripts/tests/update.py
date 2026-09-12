#!/usr/bin/env python3
"""End-to-end test for authenticated, atomic `coil update`."""

from __future__ import annotations

import hashlib
import http.server
import json
import os
import platform
import ssl
import subprocess
import sys
import tarfile
import tempfile
import threading
from pathlib import Path


def archive(root: Path, label: str) -> tuple[bytes, str]:
    tree = root / label
    (tree / "bin").mkdir(parents=True)
    binary = tree / "bin" / "coil"
    binary.write_text(f"#!/bin/sh\necho {label}\n")
    binary.chmod(0o755)
    path = root / f"{label}.tar.gz"
    with tarfile.open(path, "w:gz") as output:
        output.add(binary, "bin/coil")
    data = path.read_bytes()
    return data, hashlib.sha256(data).hexdigest()


def main() -> None:
    compiler = Path(sys.argv[1]).resolve()
    host = (sys.platform, platform.machine().lower())
    if host == ("darwin", "arm64"):
        target = "aarch64-apple-darwin"
    elif host[0] == "linux" and host[1] in {"x86_64", "amd64"}:
        target = "x86_64-unknown-linux-gnu"
    else:
        raise SystemExit(f"unsupported updater test host: {host[0]}/{host[1]}")
    with tempfile.TemporaryDirectory(prefix="coil-update-test-") as raw:
        root = Path(raw)
        cert, key = root / "cert.pem", root / "key.pem"
        config = root / "openssl.cnf"
        config.write_text("[req]\ndistinguished_name=dn\nx509_extensions=v3\nprompt=no\n[dn]\nCN=localhost\n[v3]\nsubjectAltName=DNS:localhost\n")
        subprocess.run(["openssl", "req", "-x509", "-newkey", "rsa:2048", "-nodes",
                        "-days", "1", "-keyout", key, "-out", cert, "-config", config],
                       check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        artifacts = {}
        for index in (1, 2):
            data, digest = archive(root, f"release-{index}")
            commit = str(index) * 40
            artifacts[commit] = data
            (root / f"manifest-{index}.json").write_text(json.dumps({
                "schema": 1, "channel": "nightly", "release": f"test-{index}",
                "commit": commit, "sequence": index, "published_at": "2026-09-12T00:00:00Z",
                "targets": {target: {
                    "artifact": f"../builds/{commit}/coil-{target}.tar.gz",
                    "sha256": digest, "size": len(data)}}}))

        class Handler(http.server.BaseHTTPRequestHandler):
            def do_GET(self) -> None:
                if self.headers.get("Authorization") != "Bearer private-test-token":
                    self.send_error(401)
                    return
                if self.path.startswith("/coil/v1/channels/"):
                    data = (root / self.path.rsplit("/", 1)[1]).read_bytes()
                else:
                    commit = self.path.split("/")[4]
                    data = artifacts[commit]
                self.send_response(200)
                self.send_header("Content-Type", "application/json")
                self.send_header("Content-Length", str(len(data)))
                self.end_headers()
                self.wfile.write(data)

            def log_message(self, *_: object) -> None:
                pass

        server = http.server.ThreadingHTTPServer(("127.0.0.1", 0), Handler)
        context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
        context.load_cert_chain(cert, key)
        server.socket = context.wrap_socket(server.socket, server_side=True)
        thread = threading.Thread(target=server.serve_forever, daemon=True)
        thread.start()
        try:
            environment = os.environ.copy()
            environment.update({"HOME": str(root / "home"), "COIL_UPDATE_CA_FILE": str(cert),
                                "COIL_UPDATE_HEADERS": "Authorization: Bearer private-test-token"})
            for index in (1, 2):
                environment["COIL_UPDATE_URL"] = f"https://localhost:{server.server_port}/coil/v1/channels/manifest-{index}.json"
                subprocess.run([compiler, "update"], env=environment, check=True)
                current = root / "home/.local/bin/coil"
                assert subprocess.check_output([current], text=True).strip() == f"release-{index}"
            subprocess.run([compiler, "update", "--rollback"], env=environment, check=True)
            assert subprocess.check_output([root / "home/.local/bin/coil"], text=True).strip() == "release-1"
            bad = environment | {"COIL_UPDATE_HEADERS": "Host: attacker.invalid"}
            result = subprocess.run([compiler, "update"], env=bad, capture_output=True, text=True)
            assert result.returncode == 1 and "reserved" in result.stderr
            assert "private-test-token" not in result.stdout + result.stderr
        finally:
            server.shutdown()
            thread.join()
    print("coil update integration: PASS")


if __name__ == "__main__":
    main()
