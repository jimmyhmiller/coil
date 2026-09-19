#!/usr/bin/env python3
"""Decide whether a failed nightly run should be handed to the autofix agent.

Reads the run through the API (never trusting the event payload alone), writes the
failed jobs' logs to --logs-dir, and emits step outputs on $GITHUB_OUTPUT:

  proceed      "true" only if every check passed
  notify       "true" when it stopped because the attempt budget is spent, which
               the maintainer must hear about; other stops are routine
  reason       why not, when proceed is false
  attempt      the autofix attempt this would be (1 for a scheduled failure)
  os           "linux" or "macos": the runner the agent reproduces on
  failed_jobs  comma-separated failed job names
  run_url      the failed run
"""

import argparse
import json
import os
import re
import subprocess
import sys
import urllib.request

NIGHTLY_PATH = ".github/workflows/nightly.yml"
ATTEMPT_RE = re.compile(r"\[autofix (\d+)\]")


def api(path):
    proc = subprocess.run(["gh", "api", path], capture_output=True)
    if proc.returncode != 0:
        sys.exit(f"gh api {path} failed ({proc.returncode}): {proc.stderr.decode(errors='replace').strip()}")
    return json.loads(proc.stdout)


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, *args, **kwargs):
        return None


def job_log(repo, job_id):
    """The job's raw log. Not through `gh api`: newer gh refuses output containing
    terminal escapes, which CI logs are full of. The endpoint answers with a
    redirect to a pre-signed URL that must be fetched without the API token."""
    token = os.environ.get("GH_TOKEN") or subprocess.run(
        ["gh", "auth", "token"], check=True, capture_output=True, text=True).stdout.strip()
    req = urllib.request.Request(
        f"https://api.github.com/repos/{repo}/actions/jobs/{job_id}/logs",
        headers={"Authorization": f"Bearer {token}", "Accept": "application/vnd.github+json"})
    try:
        urllib.request.build_opener(NoRedirect).open(req)
        sys.exit(f"job {job_id} logs: expected a redirect")
    except urllib.error.HTTPError as e:
        if e.code != 302:
            sys.exit(f"job {job_id} logs: HTTP {e.code}")
        location = e.headers["Location"]
    with urllib.request.urlopen(location) as resp:
        return resp.read()


def output(**values):
    with open(os.environ["GITHUB_OUTPUT"], "a") as f:
        for key, value in values.items():
            f.write(f"{key}={value}\n")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--max-attempts", type=int, required=True)
    parser.add_argument("--force", choices=["true", "false"], default="false")
    parser.add_argument("--logs-dir", required=True)
    args = parser.parse_args()

    repo = os.environ["GITHUB_REPOSITORY"]
    run = api(f"repos/{repo}/actions/runs/{args.run_id}")
    run_url = run["html_url"]

    def stop(reason, notify=False):
        print(f"Not attempting a fix: {reason}")
        output(proceed="false", notify=str(notify).lower(), reason=reason, run_url=run_url)
        sys.exit(0)

    if run["path"] != NIGHTLY_PATH:
        stop(f"run {args.run_id} is {run['path']}, not the nightly")
    if run["head_repository"]["full_name"] != repo:
        stop("run came from another repository")
    if run["head_branch"] != "main":
        stop(f"run was on {run['head_branch']}, not main")
    if run["event"] not in ("schedule", "workflow_dispatch"):
        stop(f"run was triggered by {run['event']}")
    if run["conclusion"] != "failure":
        stop(f"run concluded {run['conclusion']}")

    match = ATTEMPT_RE.search(run["display_title"])
    previous = int(match.group(1)) if match else 0
    attempt = previous + 1
    if attempt > args.max_attempts:
        stop(f"{previous} autofix attempt(s) already made; the limit is {args.max_attempts}", notify=True)

    # Someone (or a previous autofix) has already started a newer nightly: that run,
    # not this one, says whether main is still broken.
    newer = [
        r for r in api(f"repos/{repo}/actions/workflows/nightly.yml/runs?branch=main&per_page=20")["workflow_runs"]
        if r["created_at"] > run["created_at"] and r["event"] in ("schedule", "workflow_dispatch")
    ]
    if newer and args.force != "true":
        stop(f"a newer nightly run already exists: {newer[0]['html_url']}")

    jobs = api(f"repos/{repo}/actions/runs/{args.run_id}/jobs?per_page=100")["jobs"]
    failed = [j for j in jobs if j["conclusion"] == "failure"]
    if not failed:
        stop("the run failed but no job reports failure")

    os.makedirs(args.logs_dir, exist_ok=True)
    summary = []
    for job in failed:
        steps = [s["name"] for s in job.get("steps", []) if s["conclusion"] == "failure"]
        summary.append(f"- job `{job['name']}` failed in step(s): {', '.join(steps) or 'unknown'}")
        log = job_log(repo, job["id"])
        with open(os.path.join(args.logs_dir, f"{job['name']}.log"), "wb") as f:
            f.write(log)
    with open(os.path.join(args.logs_dir, "SUMMARY.md"), "w") as f:
        f.write(f"Failed nightly run: {run_url}\nCommit: {run['head_sha']}\n\n" + "\n".join(summary) + "\n")

    names = [j["name"] for j in failed]
    # Linux is the usual failure and the only runner that can reproduce it; a
    # publish-only failure needs no particular host, so it also goes to Linux.
    host = "macos" if "macos" in names and "linux" not in names else "linux"
    output(proceed="true", notify="false", reason="", attempt=attempt, os=host,
           failed_jobs=",".join(names), run_url=run_url)
    print(f"Attempt {attempt}: reproducing {names} on {host}")


if __name__ == "__main__":
    main()
