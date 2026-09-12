#!/usr/bin/env bash
# Reconstruct an executable Linux stage zero from the committed LLVM IR escape
# hatch.  This is used only when neither the committed ELF seed nor an installed
# compiler can check the current tree.  Unlike the portable WASM host, the result
# is a native process and can service the compiler's JIT/dlopen metaprograms.
set -euo pipefail
cd "$(dirname "$0")/../.."

DEST=${1:-build/bootstrap/linux-ir/coil-stage0}
LLVM_CONFIG=${LLVM_CONFIG:-llvm-config-21}
command -v "$LLVM_CONFIG" >/dev/null 2>&1 \
  || { echo "linux IR stage0: cannot execute $LLVM_CONFIG" >&2; exit 1; }
command -v xz >/dev/null 2>&1 \
  || { echo "linux IR stage0: xz is required" >&2; exit 1; }

LLVM_BINDIR=$($LLVM_CONFIG --bindir)
LLVM_LIBDIR=$($LLVM_CONFIG --libdir)
CLANG=${COIL_CC:-$LLVM_BINDIR/clang}
[ -x "$CLANG" ] || { echo "linux IR stage0: clang not found at $CLANG" >&2; exit 1; }
NATIVE="$PWD/build/bin/native/curl/x86_64-linux"
[ -f "$NATIVE/libcurl.a" ] \
  || { echo "linux IR stage0: bundled curl is missing; run scripts/native/build-curl.sh" >&2; exit 1; }

RUN_DIR=$(mktemp -d /tmp/coil-linux-ir-stage0.XXXXXX)
cleanup() { rm -rf "$RUN_DIR"; }
trap cleanup EXIT
xz -dc bootstrap/seeds/native/linux-ir/coil-linux.ll.xz > "$RUN_DIR/coil-linux.ll"
"$CLANG" -c "$RUN_DIR/coil-linux.ll" -o "$RUN_DIR/coil-linux.o"
mkdir -p "$(dirname "$DEST")"
"$CLANG" "$RUN_DIR/coil-linux.o" -o "$DEST" \
  -L"$LLVM_LIBDIR" -Wl,-rpath,"$LLVM_LIBDIR" -lLLVM \
  "$NATIVE/libcurl.a" "$NATIVE/libmbedtls.a" \
  "$NATIVE/libmbedx509.a" "$NATIVE/libmbedcrypto.a" \
  -lstdc++ -lm -lpthread -ldl
chmod +x "$DEST"
echo "built native Linux IR stage0 -> $DEST"
