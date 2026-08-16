#!/usr/bin/env bash
# Provenance does not prove freshness. A valid seed may still embed a standard
# library too old to compile the source tree beside it. Exercise every committed
# seed runnable on this host against its compiler entry point.
set -uo pipefail
cd "$(dirname "$0")/../../.."

check_seed() {
  local seed="$1" src="$2"; shift 2
  echo "  check $seed -> $src"
  "$seed" check "$src" "$@" >/dev/null || {
    echo "GATE FAIL: $seed cannot compile the current $src" >&2
    echo "Rebuild and re-bless it with scripts/compiler/refresh-seed.sh." >&2
    return 1
  }
}

case "$(uname -s)-$(uname -m)" in
  Linux-x86_64)
    libdir="${COIL_LLVM_LIBDIR:-}"
    if [ -z "$libdir" ]; then
      for lc in llvm-config-21 /usr/src/stdlib/llvm-21/bin/llvm-config llvm-config; do
        if command -v "$lc" >/dev/null 2>&1; then libdir="$("$lc" --libdir)"; break; fi
      done
    fi
    [ -n "$libdir" ] || { echo "GATE FAIL: no LLVM libdir for Linux seed check" >&2; exit 2; }
    lf=(--link-flag "-L$libdir" --link-flag "-Wl,-rpath,$libdir"
        --link-flag -lLLVM --link-flag -lstdc++ --link-flag -lm
        --link-flag -lpthread --link-flag -ldl)
    check_seed bootstrap/seeds/native/coil-seed-linux-x86_64 \
      src/compiler/main.coil "${lf[@]}" || exit 1
    check_seed bootstrap/seeds/native/coil-seed-nollvm-linux-x86_64 \
      src/compiler/main_x64.coil || exit 1
    ;;
  Darwin-arm64)
    check_seed bootstrap/seeds/native/coil-seed src/compiler/main.coil || exit 1
    check_seed bootstrap/seeds/native/coil-seed-nollvm src/compiler/main_a64.coil || exit 1
    ;;
  *)
    echo "gate-seed-current: SKIP — no native seed for $(uname -s)-$(uname -m)"
    exit 0
    ;;
esac

echo "gate-seed-current: PASS"
