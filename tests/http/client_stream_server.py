"""Test server for the streaming client.

Every route here exists to make one streaming property observable. The important one is
/slow: it flushes three fragments with a delay between each, so a client that buffers the
whole body cannot see the first fragment before the last one is sent. That is what
separates real streaming from replaying a buffered body through several callbacks.
"""

import time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

# One fragment per flush, with a gap between them. The gap has to be comfortably longer
# than the client's measurement noise while keeping the suite fast.
SLOW_CHUNKS = [b"alpha", b"bravo", b"charlie"]
SLOW_DELAY = 0.30

# A body whose bytes are deliberately hostile: a NUL, a lone 0xFF (invalid UTF-8), and a
# truncated multi-byte sequence. Nothing in the path may treat the body as text.
BINARY_BODY = bytes([0x00, 0x01, 0xFF, 0xFE, 0x00, 0xC3, 0x28, 0x80, 0x7F])


class Handler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"

    def _chunked_head(self, status=200):
        self.send_response(status)
        self.send_header("Content-Type", "application/octet-stream")
        self.send_header("X-Stream-Test", "yes")
        self.send_header("Transfer-Encoding", "chunked")
        self.end_headers()

    def _chunk(self, payload):
        # A consumer stop closes the connection mid-body on purpose, so a broken pipe
        # here is the /big route working as intended, not a server fault.
        try:
            self.wfile.write(b"%x\r\n%s\r\n" % (len(payload), payload))
            self.wfile.flush()
        except (BrokenPipeError, ConnectionResetError):
            self.close_connection = True
            raise

    def _end_chunks(self):
        self.wfile.write(b"0\r\n\r\n")
        self.wfile.flush()

    def do_GET(self):
        route = self.path

        if route == "/slow":
            # The streaming proof: flush, wait, flush, wait, flush.
            self._chunked_head()
            for i, chunk in enumerate(SLOW_CHUNKS):
                if i:
                    time.sleep(SLOW_DELAY)
                self._chunk(chunk)
            self._end_chunks()

        elif route == "/split":
            # One logical record ("<<<record>>>") deliberately torn across three flushes,
            # so a consumer that assumes chunk == record fails.
            self._chunked_head()
            for piece in (b"<<<re", b"co", b"rd>>>"):
                self._chunk(piece)
                time.sleep(0.05)
            self._end_chunks()

        elif route == "/empty":
            self.send_response(200)
            self.send_header("Content-Length", "0")
            self.end_headers()

        elif route == "/single":
            body = b"one-shot"
            self.send_response(200)
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)

        elif route == "/binary":
            self.send_response(200)
            self.send_header("Content-Type", "application/octet-stream")
            self.send_header("Content-Length", str(len(BINARY_BODY)))
            self.end_headers()
            self.wfile.write(BINARY_BODY)

        elif route == "/teapot":
            # Non-2xx with a real body and headers: status is not transport failure.
            body = b"short and stout"
            self.send_response(418)
            self.send_header("X-Teapot", "yes")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)

        elif route == "/big":
            # Long enough to guarantee several callbacks, for the stop-early case.
            self._chunked_head()
            for _ in range(64):
                self._chunk(b"x" * 1024)
            self._end_chunks()

        elif route == "/hang":
            # Headers, one fragment, then silence — the client's total timeout must fire
            # after partial delivery.
            self._chunked_head()
            self._chunk(b"begin")
            time.sleep(30)

        elif route == "/cut":
            # Headers, one fragment, then drop the connection mid-body.
            self._chunked_head()
            self._chunk(b"begin")
            self.wfile.flush()
            self.close_connection = True
            try:
                self.connection.close()
            except OSError:
                pass

        else:
            self.send_response(404)
            self.send_header("Content-Length", "0")
            self.end_headers()

    def log_message(self, fmt, *args):
        pass

    def handle_one_request(self):
        try:
            super().handle_one_request()
        except (BrokenPipeError, ConnectionResetError):
            self.close_connection = True


if __name__ == "__main__":
    ThreadingHTTPServer(("127.0.0.1", 38474), Handler).serve_forever()
