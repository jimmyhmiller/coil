#!/usr/bin/env bash
# Rebuild + verify the self-host compiler(s), then UPDATE the committed seed(s).
#
# Refreshes the full and LLVM-free seeds for the current supported host
# (macOS/arm64 or Linux/x86-64).
#
# Run this whenever you change src/compiler in a way that touches the language the
# COMPILER ITSELF is written in (new syntax/semantics the current seed wouldn't parse),
# so the seeds can always compile the next revision. Keeping the seeds in step with
# source is the one discipline that keeps the Rust-free bootstrap working forever.
#
# Each seed is only updated if its rebootstrap fully verifies, so you can never commit
# a broken seed. Pass a seed name to refresh just one: `refresh-seed.sh nollvm` / `full`.
#
# Usage: scripts/compiler/refresh-seed.sh [full|nollvm|both]     (default: both)
set -uo pipefail
cd "$(dirname "$0")/../.."
WHICH="${1:-both}"
mkdir -p bootstrap/seeds/native
updated=()

case "$(uname -s)-$(uname -m)" in
  Linux-x86_64)
    full_script=./scripts/compiler/rebootstrap-linux.sh
    nollvm_script=./scripts/compiler/rebootstrap-nollvm-linux.sh
    full_seed=bootstrap/seeds/native/coil-seed-linux-x86_64
    nollvm_seed=bootstrap/seeds/native/coil-seed-nollvm-linux-x86_64
    full_stamp=bootstrap/seeds/native/SEED_VERSION_LINUX
    nollvm_stamp=bootstrap/seeds/native/SEED_VERSION_NOLLVM_LINUX
    full_source=src/compiler/main.coil
    nollvm_source=src/compiler/main_x64.coil
    full_proof="LLVM fixpoint + Linux verification gates"
    nollvm_proof="no-libLLVM + x64 fixpoint + x64 gate-run"
    ;;
  Darwin-arm64)
    full_script=./scripts/compiler/rebootstrap.sh
    nollvm_script=./scripts/compiler/rebootstrap-nollvm.sh
    full_seed=bootstrap/seeds/native/coil-seed
    nollvm_seed=bootstrap/seeds/native/coil-seed-nollvm
    full_stamp=bootstrap/seeds/native/SEED_VERSION
    nollvm_stamp=bootstrap/seeds/native/SEED_VERSION_NOLLVM
    full_source=src/compiler/main.coil
    nollvm_source=src/compiler/main_a64.coil
    full_proof="arm64 fixpoint + verification gates"
    nollvm_proof="no-libLLVM + arm64 fixpoint + arm64 gate-run"
    ;;
  *)
    echo "unsupported seed-refresh host: $(uname -s)-$(uname -m)" >&2
    exit 2
    ;;
esac

# What the seed was actually built FROM. A seed is built from the working tree, not
# from a commit, so recording a bare `git rev-parse HEAD` is a claim the file cannot
# back up: refreshed with uncommitted changes it names a commit that does not contain
# the source the binary was derived from, and the next reader has no way to tell.
# Say so instead. Refresh AFTER committing the source and this reduces to the hash.
# The seed artifacts are excluded from the dirty check on purpose: this function runs
# AFTER the new binary has been copied into bootstrap/seeds/, so they are always dirty
# here. The question is only whether the SOURCE the binary came from is committed.
seed_source_stamp() {
  local head; head=$(git rev-parse HEAD)
  if [ -n "$(git status --porcelain -- ':!bootstrap/seeds')" ]; then
    echo "commit: $head + UNCOMMITTED working-tree changes (re-run after committing)"
  else
    echo "commit: $head"
  fi
}

if [ "$WHICH" = both ] || [ "$WHICH" = full ]; then
  echo "=== [full] verifying before touching the seed ==="
  "$full_script" /tmp/coil-newseed || { echo "[full] VERIFY FAILED — seed NOT updated"; exit 1; }
  cp /tmp/coil-newseed "$full_seed"
  chmod +x "$full_seed"
  {
    seed_source_stamp
    echo "built:  $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "source: $full_source"
    echo "proof:  $full_proof"
  } > "$full_stamp"
  updated+=("$full_seed" "$full_stamp")
fi

if [ "$WHICH" = both ] || [ "$WHICH" = nollvm ]; then
  echo "=== [nollvm] verifying before touching the seed ==="
  "$nollvm_script" /tmp/coil-newseed-nollvm || { echo "[nollvm] VERIFY FAILED — seed NOT updated"; exit 1; }
  cp /tmp/coil-newseed-nollvm "$nollvm_seed"
  chmod +x "$nollvm_seed"
  {
    seed_source_stamp
    echo "built:  $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "source: $nollvm_source"
    echo "proof:  $nollvm_proof"
  } > "$nollvm_stamp"
  updated+=("$nollvm_seed" "$nollvm_stamp")
fi

echo
echo "seed(s) updated:"
for f in "${updated[@]}"; do
  case "$f" in *coil-seed*) echo "  $f  ($(du -h "$f" | cut -f1))";; *) echo "  $f";; esac
done
echo "review and commit:"
echo "  git add ${updated[*]} && git commit -m 'refresh self-host seed(s)'"
