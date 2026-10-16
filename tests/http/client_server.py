import socketserver
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer


class LoopbackServer(ThreadingHTTPServer):
    """HTTPServer.server_bind names the server with socket.getfqdn, a reverse DNS
    lookup of the bound address; on a CI runner that lookup took 35 s. A loopback
    test server is named by its address."""

    def server_bind(self):
        socketserver.TCPServer.server_bind(self)
        self.server_name, self.server_port = self.server_address[:2]


class Handler(BaseHTTPRequestHandler):
    def do_POST(self):
        body = self.rfile.read(int(self.headers.get("Content-Length", "0")))
        self.send_response(418)
        self.send_header("X-Repeat", "first")
        self.send_header("X-Repeat", "second")
        self.send_header("Content-Type", "application/octet-stream")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, format, *args):
        pass


LoopbackServer(("127.0.0.1", 38473), Handler).serve_forever()
