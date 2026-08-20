#!/usr/bin/env python3
"""Serve web/dist with the headers a wasm playground actually needs.

python's http.server gets two things wrong for this payload: it does not know
`application/wasm`, and it will happily hand over 3.4 MB uncompressed while a `.br`
sits next to it. This serves the precompressed variant whenever the client accepts it,
which is the whole point of building them.

    python3 web/serve.py [--port 8000] [--dir web/dist]
"""
import argparse
import functools
import http.server
import os
from pathlib import Path

ENCODINGS = (("br", ".br"), ("gzip", ".gz"))
TYPES = {
    ".wasm": "application/wasm",
    ".js": "text/javascript; charset=utf-8",
    ".mjs": "text/javascript; charset=utf-8",
    ".html": "text/html; charset=utf-8",
    ".bin": "application/octet-stream",
}


class Handler(http.server.SimpleHTTPRequestHandler):
    def send_head(self):
        path = Path(self.translate_path(self.path))
        if path.is_dir():
            path = path / "index.html"
        if not path.is_file():
            self.send_error(404, "not found")
            return None

        accepted = self.headers.get("Accept-Encoding", "")
        chosen, encoding = path, None
        for name, suffix in ENCODINGS:
            candidate = path.with_suffix(path.suffix + suffix)
            if name in accepted and candidate.is_file():
                chosen, encoding = candidate, name
                break

        ctype = TYPES.get(path.suffix, "application/octet-stream")
        try:
            f = open(chosen, "rb")
        except OSError:
            self.send_error(404, "not found")
            return None

        self.send_response(200)
        self.send_header("Content-Type", ctype)
        self.send_header("Content-Length", str(chosen.stat().st_size))
        if encoding:
            self.send_header("Content-Encoding", encoding)
        self.send_header("Vary", "Accept-Encoding")
        self.send_header("Cache-Control", "no-store")   # a dev server, not a CDN
        self.end_headers()
        return f

    def log_message(self, fmt, *args):
        if os.environ.get("COIL_WEB_QUIET"):
            return
        super().log_message(fmt, *args)


def main() -> int:
    root = Path(__file__).resolve().parent
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=8000)
    ap.add_argument("--dir", default=str(root / "dist"))
    args = ap.parse_args()

    directory = Path(args.dir).resolve()
    if not (directory / "index.html").is_file():
        print(f"error: {directory} has no index.html — run `python3 web/build.py` first")
        return 1

    handler = functools.partial(Handler, directory=str(directory))
    with http.server.ThreadingHTTPServer(("127.0.0.1", args.port), handler) as httpd:
        print(f"serving {directory} at http://127.0.0.1:{args.port}/")
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            pass
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
