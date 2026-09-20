#!/usr/bin/env python3
"""Decide what this nightly publishes, and whether it has anything to publish.

Two facts, settled before anything is built:

*Identity.* A nightly release is a snapshot of one commit, so its identity is a
pure function of that commit: the committer timestamp supplies both the sequence
and `published_at`. Deriving them from the run instead (`github.run_number`,
`repository.updated_at`) made a re-run mint a *different* release for the same
source, which is what "Re-run failed jobs" quietly did.

*Work.* Gatekeeper owns the rule for what its channel accepts, so it is asked
rather than second-guessed. A `current` verdict means the channel already
publishes this commit and the run has nothing to do; a `conflict` means the
publication could never be accepted, which is a failure and is reported as one.

Prints `key=value` lines for the caller to place, one per line, so the workflow
appends them to `$GITHUB_OUTPUT` without parsing anything.
"""

from __future__ import annotations

import argparse
import subprocess
import urllib.parse
from datetime import datetime, timezone

from gatekeeper import call


def commit_timestamp(commit: str) -> int:
    """The commit's own committer time, in epoch seconds."""
    result = subprocess.run(["git", "show", "-s", "--format=%ct", commit],
                            capture_output=True, text=True)
    if result.returncode != 0:
        raise SystemExit(f"cannot read commit {commit}: {result.stderr.strip()}")
    return int(result.stdout.strip())


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-url", required=True)
    parser.add_argument("--audience", required=True)
    parser.add_argument("--commit", required=True)
    parser.add_argument("--channel", default="nightly")
    args = parser.parse_args()

    sequence = commit_timestamp(args.commit)
    published_at = datetime.fromtimestamp(sequence, timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

    query = urllib.parse.urlencode({
        "channel": args.channel,
        "commit": args.commit,
        "sequence": sequence,
    })
    answer = call(args.base_url, args.audience, "GET",
                  f"/coil/v1/publications/preflight?{query}")
    verdict, reason = answer.get("verdict"), answer.get("reason", "")
    if verdict == "conflict":
        raise SystemExit(f"cannot publish {args.commit} to {args.channel}: {reason}")
    if verdict not in ("publish", "current"):
        raise SystemExit(f"unrecognized preflight verdict {verdict!r}: {reason}")

    print(f"build={'true' if verdict == 'publish' else 'false'}")
    print(f"sequence={sequence}")
    print(f"published_at={published_at}")
    print(f"reason={reason}")


if __name__ == "__main__":
    main()
