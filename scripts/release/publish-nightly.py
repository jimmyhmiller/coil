#!/usr/bin/env python3
"""Publish one GitHub Actions run to Gatekeeper using short-lived OIDC tokens."""

from __future__ import annotations

import argparse
import hashlib
import http.client
import json
import os
import urllib.parse
import urllib.request
from pathlib import Path


def oidc_token(audience: str) -> str:
    request_url = os.environ.get("ACTIONS_ID_TOKEN_REQUEST_URL")
    bearer = os.environ.get("ACTIONS_ID_TOKEN_REQUEST_TOKEN")
    if not request_url or not bearer:
        raise SystemExit("GitHub OIDC environment is unavailable; workflow needs id-token: write")
    separator = "&" if "?" in request_url else "?"
    request = urllib.request.Request(
        request_url + separator + urllib.parse.urlencode({"audience": audience}),
        headers={"Authorization": f"Bearer {bearer}"},
    )
    with urllib.request.urlopen(request, timeout=30) as response:
        return json.load(response)["value"]


def call(base: str, audience: str, method: str, path: str, body: bytes = b"") -> dict:
    url = urllib.parse.urljoin(base.rstrip("/") + "/", path.lstrip("/"))
    request = urllib.request.Request(url, data=body, method=method, headers={
        "Authorization": f"Bearer {oidc_token(audience)}",
        "Content-Type": "application/json",
    })
    with urllib.request.urlopen(request, timeout=60) as response:
        raw = response.read()
        return json.loads(raw) if raw else {}


def upload(base: str, audience: str, path: str, artifact: Path, size: int) -> None:
    parsed = urllib.parse.urlsplit(urllib.parse.urljoin(base.rstrip("/") + "/", path.lstrip("/")))
    if parsed.scheme != "https" or not parsed.hostname:
        raise SystemExit("publication base URL must be HTTPS")
    connection = http.client.HTTPSConnection(parsed.hostname, parsed.port or 443, timeout=1800)
    target = urllib.parse.urlunsplit(("", "", parsed.path, parsed.query, ""))
    connection.putrequest("PUT", target)
    connection.putheader("Authorization", f"Bearer {oidc_token(audience)}")
    connection.putheader("Content-Type", "application/octet-stream")
    connection.putheader("Content-Length", str(size))
    connection.endheaders()
    with artifact.open("rb") as handle:
        while chunk := handle.read(1024 * 1024):
            connection.send(chunk)
    response = connection.getresponse()
    payload = response.read()
    connection.close()
    if not 200 <= response.status < 300:
        raise SystemExit(f"upload failed with HTTP {response.status}: {payload[:500]!r}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-url", required=True)
    parser.add_argument("--audience", required=True)
    parser.add_argument("--input", required=True)
    parser.add_argument("--channel", default="nightly")
    args = parser.parse_args()
    descriptors = [json.loads(path.read_text()) for path in sorted(Path(args.input).glob("*.json"))]
    if not descriptors:
        raise SystemExit("no target descriptors found")
    identity = {(d["commit"], d["sequence"], d["published_at"]) for d in descriptors}
    if len(identity) != 1:
        raise SystemExit("target descriptors do not describe the same release")
    commit, sequence, published_at = identity.pop()
    begin = call(args.base_url, args.audience, "POST", "/coil/v1/publications", json.dumps({
        "schema": 1,
        "channel": args.channel,
        "release": f"0.1.0-nightly.{published_at[:10].replace('-', '')}+g{commit[:12]}",
        "commit": commit,
        "sequence": sequence,
        "published_at": published_at,
        "targets": {d["target"]: {k: d[k] for k in ("sha256", "size")} for d in descriptors},
    }).encode())
    publication = begin["publication"]
    for descriptor in descriptors:
        artifact = Path(args.input) / descriptor["artifact"]
        digest = hashlib.sha256()
        with artifact.open("rb") as handle:
            while chunk := handle.read(1024 * 1024):
                digest.update(chunk)
        if artifact.stat().st_size != descriptor["size"] or digest.hexdigest() != descriptor["sha256"]:
            raise SystemExit(f"artifact changed after packaging: {artifact}")
        upload(args.base_url, args.audience,
               f"/coil/v1/publications/{publication}/{descriptor['target']}",
               artifact, descriptor["size"])
    result = call(args.base_url, args.audience, "POST",
                  f"/coil/v1/publications/{publication}/complete", b"{}")
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
