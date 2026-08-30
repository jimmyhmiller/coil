#!/usr/bin/env bash
# Shared native-first stage-zero selection.
#
# Usage after `cd` to the repository root:
#   select_stage0 <native-seed> <compiler-source> <fallback-backend> [check flags...]
#
# Run an old compiler outside the checkout so it cannot mistake the new package
# manifest for one it understands. Namespace roots carry the source graph explicitly.
stage0_compat_run() {
  local stage0="$1"; shift
  local repo="$PWD"
  case "$stage0" in
    /*) ;;
    *) stage0="$repo/$stage0" ;;
  esac
  local command="$1" source="$2"; shift 2
  case "$source" in
    /*) ;;
    *) source="$repo/$source" ;;
  esac
  (cd /tmp && \
    COIL_NAMESPACE_ROOTS="$(dirname "$source")" COIL_STRICT_BUNDLE=0 \
      "$stage0" "$command" "$source" "$@")
}

# Sets STAGE0 and STAGE0_BUILD_FLAGS. An explicit STAGE0 is authoritative. Without
# one, a matching native seed is used when it can compile this checkout; otherwise
# a compatible installed `coil` is reused, then the committed portable WASM seed
# is translated to a temporary host executable.

select_stage0() {
  local native_seed="$1" src="$2" fallback_backend="$3"; shift 3
  STAGE0_BUILD_FLAGS=()

  if [ -n "${STAGE0:-}" ]; then
    STAGE0_SOURCE=explicit
    return 0
  fi

  if [ "${COIL_FORCE_WASM_STAGE0:-0}" != 1 ] \
     && [ -x "$native_seed" ] \
     && stage0_compat_run "$native_seed" check "$src" "$@" >/dev/null 2>&1; then
    STAGE0="$native_seed"
    STAGE0_SOURCE=native
    return 0
  fi

  # A developer may have a newer compiler installed than the committed seed. It
  # is still only stage zero — stage1/2/3 rederive and verify the checkout — and
  # trying it before the portable fallback avoids stranding a build when a stale
  # WASM seed cannot yet parse the current compiler sources.
  local installed
  installed=$(command -v coil 2>/dev/null || true)
  if [ "${COIL_FORCE_WASM_STAGE0:-0}" != 1 ] \
     && [ -n "$installed" ] \
     && [ "$installed" != "$native_seed" ] \
     && stage0_compat_run "$installed" check "$src" "$@" >/dev/null 2>&1; then
    STAGE0="$installed"
    STAGE0_SOURCE=installed
    return 0
  fi

  echo "native stage0 unavailable or stale; building portable WASM fallback" >&2
  python3 scripts/dev.py bootstrap c >/dev/null \
    || { echo "WASM stage0 construction failed" >&2; return 1; }
  STAGE0="$PWD/build/bootstrap/c/coil-bootstrap"
  STAGE0_SOURCE=wasm
  STAGE0_BUILD_FLAGS=(--backend "$fallback_backend")
  stage0_compat_run "$STAGE0" check "$src" "$@" >/dev/null 2>&1 \
    || { echo "WASM stage0 cannot compile the current source tree" >&2; return 1; }
}
