#!/usr/bin/env bash
# Privileged half of nightly-autofix. Runs with contents/actions/issues write and
# never with the Claude credential. It executes nothing from the agent's patch:
# it checks which paths the patch touches, applies it, pushes, reruns the nightly,
# and reports on the tracking issue.
#
# Inputs (env): RESULT_DIR (the fix job's artifact, possibly absent), ATTEMPT,
# MAX_ATTEMPTS, FAILED_RUN_URL, TRIAGE_PROCEED, TRIAGE_REASON, FIX_RESULT,
# AUTOFIX_RUN_URL, GH_TOKEN, GITHUB_REPOSITORY.
set -euo pipefail

LABEL=nightly-autofix
report=$(mktemp)

dispatch_nightly() {
  gh workflow run nightly.yml --ref main -f "autofix_attempt=$ATTEMPT"
  echo "Dispatched the nightly as autofix attempt $ATTEMPT."
}

post_report() {
  local headline=$1
  gh label create "$LABEL" --color D93F0B \
    --description "Reports from the nightly-autofix workflow" 2>/dev/null || true
  local issue
  issue=$(gh issue list --label "$LABEL" --state open --limit 1 --json number --jq '.[0].number // empty')
  if [ -n "$issue" ]; then
    gh issue comment "$issue" --body-file "$report"
  else
    gh issue create --label "$LABEL" --title "Nightly autofix: $headline" --body-file "$report"
  fi
}

{
  echo "Failed nightly: $FAILED_RUN_URL"
  echo "Autofix run: $AUTOFIX_RUN_URL"
  echo
} >"$report"

if [ "$TRIAGE_PROCEED" != "true" ]; then
  # Only reached when triage stopped because the attempt budget is spent.
  { echo "## Gave up: $TRIAGE_REASON"; echo
    echo "The nightly is still failing after the automatic attempts. It needs a human."; } >>"$report"
  post_report "gave up after $MAX_ATTEMPTS attempts"
  exit 0
fi

result="$RESULT_DIR/result.json"
if [ ! -s "$result" ] || ! jq -e '.status and .title and .summary' "$result" >/dev/null 2>&1; then
  { echo "## Autofix did not produce a result (fix job: $FIX_RESULT)"; echo
    echo "The agent job failed before reporting. Common causes: the"
    echo "\`CLAUDE_CODE_OAUTH_TOKEN\` / \`ANTHROPIC_API_KEY\` repository secret is missing"
    echo "or expired, a dependency install failed, or the job timed out. See the autofix run."; } >>"$report"
  post_report "agent job failed"
  exit 1
fi

status=$(jq -r .status "$result")
title=$(jq -r .title "$result" | tr -d '\r\n' | cut -c1-120)
{ echo "## Attempt $ATTEMPT of $MAX_ATTEMPTS — \`$status\`: $title"; echo
  jq -r .summary "$result"; echo; } >>"$report"

case "$status" in
  fixed)
    patch="$RESULT_DIR/fix.patch"
    if [ ! -s "$patch" ]; then
      echo "**Rejected:** the agent reported \`fixed\` but committed nothing." >>"$report"
      post_report "fix reported without a commit"
      exit 1
    fi
    git config user.name "github-actions[bot]"
    git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
    base=$(git rev-parse HEAD)
    if ! git am --3way --keep-non-patch "$patch"; then
      git am --abort || true
      echo "**Not pushed:** the patch no longer applies to \`main\`. It is attached to the autofix run as an artifact." >>"$report"
      post_report "patch did not apply"
      exit 1
    fi
    forbidden=$(git diff --name-only "$base" HEAD | grep -E '^\.github/' || true)
    if [ -n "$forbidden" ]; then
      { echo "**Rejected:** the patch modifies protected paths:"; echo '```'; echo "$forbidden"; echo '```'; } >>"$report"
      post_report "patch touched .github"
      exit 1
    fi
    pushed=false
    for _ in 1 2 3; do
      if git push origin HEAD:main; then pushed=true; break; fi
      git fetch origin main
      git rebase origin/main || { git rebase --abort; break; }
    done
    if [ "$pushed" != true ]; then
      echo "**Not pushed:** \`main\` moved and the fix could not be rebased onto it." >>"$report"
      post_report "push failed"
      exit 1
    fi
    { echo "Pushed to \`main\`:"; echo
      git log --format="- $GITHUB_SERVER_URL/$GITHUB_REPOSITORY/commit/%H %s" "$base..HEAD"; echo; } >>"$report"
    dispatch_nightly
    echo "Reran the nightly as autofix attempt $ATTEMPT: $GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/workflows/nightly.yml" >>"$report"
    post_report "$title"
    ;;
  rerun)
    dispatch_nightly
    echo "No code change. Reran the nightly as autofix attempt $ATTEMPT: $GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/workflows/nightly.yml" >>"$report"
    post_report "$title"
    ;;
  give_up)
    post_report "$title"
    ;;
  *)
    echo "**Unknown status** \`$status\`; nothing was done." >>"$report"
    post_report "unknown agent status"
    exit 1
    ;;
esac
