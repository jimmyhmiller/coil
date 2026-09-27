#!/usr/bin/env bash
# Regenerate the Linux x86-64 bootstrap IR (bootstrap/seeds/native/linux-ir/coil-linux.ll.xz).
#
# The IR is parsed on the Linux host by that host's clang, so it must be PRINTED by
# the same LLVM major version the Linux CI job installs. A newer LLVM writes
# attributes an older parser rejects (LLVM 22's `nocreateundeforpoison` on intrinsic
# declarations made LLVM 21 fail with "unterminated attribute group"). So this script
# builds a compiler linked against that LLVM, emits with it, and proves the result
# parses with the same version's llvm-as before replacing the committed artifact.
#
# Usage: scripts/compiler/emit-linux-ir.sh
#   LLVM_CONFIG   llvm-config of the Linux CI's LLVM major (default: Homebrew llvm@21)
#   STAGE0        compiler that builds the emitting compiler (default: `coil` on PATH)
#
# Run it from a clean, committed tree; NOTES.md records the commit it names.
set -euo pipefail
cd "$(dirname "$0")/../.."

LLVM_CONFIG=${LLVM_CONFIG:-/opt/homebrew/opt/llvm@21/bin/llvm-config}
command -v "$LLVM_CONFIG" >/dev/null 2>&1 \
  || { echo "emit-linux-ir: cannot execute $LLVM_CONFIG (set LLVM_CONFIG to the Linux CI's LLVM)" >&2; exit 1; }
export LLVM_CONFIG
LLVM_BINDIR=$("$LLVM_CONFIG" --bindir)
STAGE0=${STAGE0:-$(command -v coil)}
[ -x "$STAGE0" ] || { echo "emit-linux-ir: no stage0 compiler (set STAGE0)" >&2; exit 1; }
[ -z "$(git status --porcelain -- src)" ] \
  || { echo "emit-linux-ir: src/ has uncommitted changes; commit first so the IR names its source" >&2; exit 1; }

RUN_DIR=$(mktemp -d /tmp/coil-emit-linux-ir.XXXXXX)
cleanup() { rm -rf "$RUN_DIR"; }
trap cleanup EXIT

read -r -a LINK <<<"$(scripts/compiler/llvm-link-flags.sh dynamic)"
python3 scripts/compiler/stage0.py "$STAGE0" build src/compiler/main.coil -o "$RUN_DIR/coil-emitter" "${LINK[@]}"
"$RUN_DIR/coil-emitter" emit-ir src/compiler/main.coil --target x86_64-unknown-linux-gnu > "$RUN_DIR/coil-linux.ll"
"$LLVM_BINDIR/llvm-as" "$RUN_DIR/coil-linux.ll" -o /dev/null \
  || { echo "emit-linux-ir: LLVM $("$LLVM_CONFIG" --version) cannot parse the emitted IR" >&2; exit 1; }
"$LLVM_BINDIR/clang" --target=x86_64-unknown-linux-gnu -c "$RUN_DIR/coil-linux.ll" -o "$RUN_DIR/coil-linux.o"
xz -9 -T0 -c "$RUN_DIR/coil-linux.ll" > bootstrap/seeds/native/linux-ir/coil-linux.ll.xz
echo "wrote bootstrap/seeds/native/linux-ir/coil-linux.ll.xz from $(git rev-parse --short HEAD) with LLVM $("$LLVM_CONFIG" --version)"
