"""Authenticated JSON calls to Gatekeeper from a GitHub Actions run.

Every request carries a freshly minted, short-lived GitHub OIDC token, so no
long-lived credential exists anywhere in the workflow.
"""

from __future__ import annotations

import json
import os
import urllib.error
import urllib.parse
import urllib.request


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
    """Make one JSON request, reporting Gatekeeper's own words on a rejection.

    Gatekeeper is the only party that knows which of its rules a request broke,
    and it says so in the response body. Losing that text turns a one-line answer
    into an inference from a Python stack trace.
    """
    url = urllib.parse.urljoin(base.rstrip("/") + "/", path.lstrip("/"))
    request = urllib.request.Request(url, data=body, method=method, headers={
        "Authorization": f"Bearer {oidc_token(audience)}",
        "Content-Type": "application/json",
    })
    try:
        with urllib.request.urlopen(request, timeout=60) as response:
            raw = response.read()
    except urllib.error.HTTPError as error:
        detail = error.read()[:500].decode("utf-8", "replace").strip()
        raise SystemExit(f"{method} {path} failed with HTTP {error.code}: {detail}") from None
    return json.loads(raw) if raw else {}
