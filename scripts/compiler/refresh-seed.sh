#!/usr/bin/env bash
# Rebuild + verify the self-host compiler(s), then UPDATE the committed seed(s).
#
# Refreshes both native seeds for the current supported host. The portable WASM
# seed is maintained separately and is the automatic recovery path when either
# native seed is absent or stale.
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
# Stage compilers land in /tmp; give /tmp the toolchain library they resolve against.
. scripts/compiler/stage-lib.sh
RUN_DIR=$(mktemp -d /tmp/coil-refresh-seed.XXXXXX) \
  || { echo "cannot create seed-refresh directory"; exit 1; }
NEWSEED="$RUN_DIR/coil-newseed"
NEWSEED_NOLLVM="$RUN_DIR/coil-newseed-nollvm"
cleanup_seed_temps() {
  stage_lib_cleanup
  rm -rf "$RUN_DIR"
}
trap cleanup_seed_temps EXIT
WHICH="${1:-both}"
mkdir -p bootstrap/seeds/native
updated=()

case "$(uname -s):$(uname -m)" in
  Darwin:arm64)
    full_script=./scripts/compiler/rebootstrap.sh
    full_seed=bootstrap/seeds/native/coil-seed
    full_version=bootstrap/seeds/native/SEED_VERSION
    full_source='src/compiler/main.coil (LLVM + arm64)'
    full_proof='arm64 fixpoint (stage2.o==stage3.o) + gate-full + arm64 gate-run'
    nollvm_script=./scripts/compiler/rebootstrap-nollvm.sh
    nollvm_seed=bootstrap/seeds/native/coil-seed-nollvm
    nollvm_version=bootstrap/seeds/native/SEED_VERSION_NOLLVM
    nollvm_source='src/compiler/main_a64.coil (LLVM-free)'
    nollvm_proof='no-libLLVM + arm64 fixpoint (stage2.o==stage3.o) + arm64 gate-run'
    ;;
  Linux:x86_64)
    full_script=./scripts/compiler/rebootstrap-linux.sh
    full_seed=bootstrap/seeds/native/coil-seed-linux-x86_64
    full_version=bootstrap/seeds/native/SEED_VERSION_LINUX
    full_source='src/compiler/main.coil (LLVM + x64)'
    full_proof='x64 fixpoint (stage2.o==stage3.o) + full Linux and stage gates'
    nollvm_script=./scripts/compiler/rebootstrap-nollvm-linux.sh
    nollvm_seed=bootstrap/seeds/native/coil-seed-nollvm-linux-x86_64
    nollvm_version=bootstrap/seeds/native/SEED_VERSION_NOLLVM_LINUX
    nollvm_source='src/compiler/main_x64.coil (LLVM-free)'
    nollvm_proof='no-libLLVM + x64 fixpoint (stage2.o==stage3.o) + x64 gate-run'
    ;;
  *)
    echo "unsupported seed refresh host: $(uname -s) $(uname -m)" >&2
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
  "$full_script" "$NEWSEED" || { echo "[full] VERIFY FAILED — seed NOT updated"; exit 1; }
  cp "$NEWSEED" "$full_seed"
  chmod +x "$full_seed"
  {
    seed_source_stamp
    echo "built:  $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "source: $full_source"
    echo "proof:  $full_proof"
  } > "$full_version"
  updated+=("$full_seed" "$full_version")
fi

if [ "$WHICH" = both ] || [ "$WHICH" = nollvm ]; then
  echo "=== [nollvm] verifying before touching the seed ==="
  "$nollvm_script" "$NEWSEED_NOLLVM" || { echo "[nollvm] VERIFY FAILED — seed NOT updated"; exit 1; }
  cp "$NEWSEED_NOLLVM" "$nollvm_seed"
  chmod +x "$nollvm_seed"
  {
    seed_source_stamp
    echo "built:  $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "source: $nollvm_source"
    echo "proof:  $nollvm_proof"
  } > "$nollvm_version"
  updated+=("$nollvm_seed" "$nollvm_version")
fi

echo
echo "seed(s) updated:"
for f in "${updated[@]}"; do
  case "$f" in *coil-seed*) echo "  $f  ($(du -h "$f" | cut -f1))";; *) echo "  $f";; esac
done
echo "review and commit:"
echo "  git add ${updated[*]} && git commit -m 'refresh self-host seed(s)'"
