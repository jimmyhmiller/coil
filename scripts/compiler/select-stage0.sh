#!/usr/bin/env bash
# Shared native-first stage-zero selection.
#
# Usage after `cd` to the repository root:
#   select_stage0 <native-seed> <compiler-source> <fallback-backend> [check flags...]
#
# Sets STAGE0 and STAGE0_BUILD_FLAGS. An explicit STAGE0 is authoritative. Without
# one, a matching native seed is used when it can compile this checkout; otherwise
# the committed portable WASM seed is translated to a temporary host executable.

select_stage0() {
  local native_seed="$1" src="$2" fallback_backend="$3"; shift 3
  STAGE0_BUILD_FLAGS=()

  if [ -n "${STAGE0:-}" ]; then
    STAGE0_SOURCE=explicit
    return 0
  fi

  if [ "${COIL_FORCE_WASM_STAGE0:-0}" != 1 ] \
     && [ -x "$native_seed" ] \
     && COIL_STRICT_BUNDLE=0 "$native_seed" check "$src" "$@" >/dev/null 2>&1; then
    STAGE0="$native_seed"
    STAGE0_SOURCE=native
    return 0
  fi

  echo "native stage0 unavailable or stale; building portable WASM fallback" >&2
  python3 scripts/dev.py bootstrap c >/dev/null \
    || { echo "WASM stage0 construction failed" >&2; return 1; }
  STAGE0="$PWD/build/bootstrap/c/coil-bootstrap"
  STAGE0_SOURCE=wasm
  STAGE0_BUILD_FLAGS=(--backend "$fallback_backend")
  COIL_STRICT_BUNDLE=0 "$STAGE0" check "$src" "$@" >/dev/null 2>&1 \
    || { echo "WASM stage0 cannot compile the current source tree" >&2; return 1; }
}
