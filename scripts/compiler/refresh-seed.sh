#!/usr/bin/env bash
# Rebuild + verify the self-host compiler(s), then UPDATE the committed seed(s).
#
# Refreshes both native seeds for the current supported host and, on macOS arm64,
# the portable WASM seed that is the recovery path when a native seed is absent
# or stale. A refresh never installs anything globally.
#
# Run this whenever you change src/compiler in a way that touches the language the
# COMPILER ITSELF is written in (new syntax/semantics the current seed wouldn't parse),
# so the seeds can always compile the next revision. Keeping the seeds in step with
# source is the one discipline that keeps the Rust-free bootstrap working forever.
#
# Each seed is only updated if its rebootstrap fully verifies, so you can never commit
# a broken seed. Pass a seed name to refresh just one: `full`, `nollvm` or `wasm`;
# `both` is the two native seeds, and `all` (the default) adds the WASM seed.
#
# Usage: scripts/compiler/refresh-seed.sh [full|nollvm|wasm|both|all]   (default: all)
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
WHICH="${1:-all}"
case "$WHICH" in
  full|nollvm|wasm|both|all) ;;
  *) echo "usage: $0 [full|nollvm|wasm|both|all]" >&2; exit 2 ;;
esac
native_selected() { [ "$WHICH" = all ] || [ "$WHICH" = both ] || [ "$WHICH" = "$1" ]; }
mkdir -p bootstrap/seeds/native
updated=()

case "$(uname -s):$(uname -m)" in
  Darwin:arm64)
    full_script=./scripts/compiler/rebootstrap.sh
    full_seed=bootstrap/seeds/native/coil-seed
    full_version=bootstrap/seeds/native/SEED_VERSION
    full_source='src/compiler/main.coil (LLVM + arm64)'
    full_proof='LLVM fixed point (stage2.o==stage3.o)'
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
    full_proof='LLVM fixed point (stage2.o==stage3.o)'
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

if native_selected full; then
  echo "=== [full] verifying before touching the seed ==="
  COIL_SKIP_INSTALL=1 "$full_script" "$NEWSEED" || { echo "[full] VERIFY FAILED — seed NOT updated"; exit 1; }
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

if native_selected nollvm; then
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

if [ "$WHICH" = all ] || [ "$WHICH" = wasm ]; then
  echo "=== [wasm] verifying before touching the seed ==="
  [ "$(uname -s):$(uname -m)" = Darwin:arm64 ] \
    || { echo "[wasm] the portable seed is verified on macOS arm64; refresh it there"; exit 2; }
  # Build with the compiler this run just verified; a wasm-only refresh uses
  # COIL_SEED_COMPILER, or the checkout's verified build/bin/coil.
  if [ -x "$NEWSEED" ]; then wasm_compiler="$NEWSEED"; else wasm_compiler="${COIL_SEED_COMPILER:-$PWD/build/bin/coil}"; fi
  [ -x "$wasm_compiler" ] || { echo "[wasm] no verified compiler to build it with"; exit 1; }
  W="$RUN_DIR/wasm"
  mkdir -p "$W"
  "$wasm_compiler" build src/compiler/main_wasm.coil --target wasm64-unknown-unknown \
      --wasm-stack-size=64 -o "$W/coilc.wasm" >/dev/null \
    || { echo "[wasm] building the portable compiler FAILED — seed NOT updated"; exit 1; }
  if command -v wasm-tools >/dev/null 2>&1; then
    wasm-tools validate --features=memory64 "$W/coilc.wasm" \
      || { echo "[wasm] validation FAILED — seed NOT updated"; exit 1; }
  fi
  python3 scripts/tests/bootstrap-imports.py --module "$W/coilc.wasm" \
    || { echo "[wasm] runtime.c does not host its imports — seed NOT updated"; exit 1; }
  # The seed's whole job: translated to C, can it check this tree and build a
  # native compiler that works?
  cc -O2 -o "$W/wasm2c" src/bootstrap/wasm2c.c \
    && "$W/wasm2c" "$W/coilc.wasm" "$W/coilc.c" little \
    && cc -O1 -w -o "$W/coil-bootstrap" "$W/coilc.c" src/bootstrap/runtime.c -lm \
    || { echo "[wasm] translating the seed FAILED — seed NOT updated"; exit 1; }
  . scripts/compiler/select-stage0.sh
  for src in src/compiler/main.coil src/compiler/main_a64.coil; do
    stage0_compat_run "$W/coil-bootstrap" check "$src" >/dev/null \
      || { echo "[wasm] the translated seed cannot check $src — seed NOT updated"; exit 1; }
  done
  stage0_compat_run "$W/coil-bootstrap" build src/compiler/main_a64.coil --backend arm64 \
      -o "$W/stage1" >/dev/null \
    || { echo "[wasm] the translated seed cannot build a native stage1 — seed NOT updated"; exit 1; }
  "$W/stage1" run src/examples/fib.coil >/dev/null 2>&1
  [ $? = 55 ] || { echo "[wasm] its native stage1 does not run fib correctly — seed NOT updated"; exit 1; }
  cp "$W/coilc.wasm" bootstrap/seeds/wasm/coilc.wasm
  {
    seed_source_stamp
    echo "built:  $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "source: src/compiler/main_wasm.coil"
    echo "target: wasm64-unknown-unknown"
    echo
    echo "Portable compiler using interpreter metaprogramming with ARM64 and x86-64"
    echo "native object backends. Translated with src/bootstrap/wasm2c.c when a native"
    echo "seed is unavailable or cannot compile the current sources."
    echo
    echo "proof (scripts/compiler/refresh-seed.sh wasm):"
    echo "- wasm-tools validation with memory64 enabled, when wasm-tools is installed."
    echo "- every env import is defined by src/bootstrap/runtime.c with its exact type."
    echo "- translated with wasm2c and linked against runtime.c on macOS ARM64."
    echo "- the translated compiler checks main.coil and main_a64.coil, and builds a"
    echo "  native main_a64.coil stage1 that runs src/examples/fib.coil (exit 55)."
    echo
    echo "The Linux x86-64 native seeds are not refreshed on this host. Their automatic"
    echo "fallback is this portable seed (then the Linux bootstrap IR); actual Linux"
    echo "x86-64 self-host verification remains the Linux CI job's responsibility."
  } > bootstrap/seeds/wasm/SEED_VERSION
  updated+=(bootstrap/seeds/wasm/coilc.wasm bootstrap/seeds/wasm/SEED_VERSION)
fi

echo
echo "seed(s) updated:"
for f in "${updated[@]}"; do
  case "$f" in *coil-seed*) echo "  $f  ($(du -h "$f" | cut -f1))";; *) echo "  $f";; esac
done
echo "review and commit:"
echo "  git add ${updated[*]} && git commit -m 'refresh self-host seed(s)'"
