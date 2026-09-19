import json
import os
import socket
from http.server import BaseHTTPRequestHandler, HTTPServer


class RequestHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        if self.path == "/":
            response = {
                "app": os.environ.get("APP_NAME", "demo"),
                "version": os.environ.get("VERSION", "0.1.0"),
                "pod": socket.gethostname(),
            }
            self.send_json(200, response)

        elif self.path == "/healthz":
            self.send_json(200, {"status": "healthy"})

        else:
            self.send_json(404, {"error": "not found"})

    def send_json(self, status_code, data):
        body = json.dumps(data).encode("utf-8")

        self.send_response(status_code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)


if __name__ == "__main__":
    server = HTTPServer(("0.0.0.0", 8080), RequestHandler)
    print("Server running on port 8080")
    server.serve_forever()