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
  python3 "$repo/scripts/compiler/stage0.py" "$stage0" "$command" "$source" "$@"
}

# Sets STAGE0 and STAGE0_BUILD_FLAGS. An explicit STAGE0 is authoritative. Without
# one, a matching native seed is used when it can compile this checkout; otherwise
# a compatible installed `coil` is reused, then the committed portable WASM seed
# is translated to a temporary host executable.

select_stage0() {
  local native_seed="$1" src="$2" fallback_backend="$3"; shift 3
  STAGE0_BUILD_FLAGS=()
  # The stage0 this function has already proved can check the tree, so that
  # stage0_check does not repeat the same whole-tree check (minutes on CI).
  STAGE0_VERIFIED=

  if [ -n "${STAGE0:-}" ]; then
    STAGE0_SOURCE=explicit
    return 0
  fi

  if [ "${COIL_FORCE_WASM_STAGE0:-0}" != 1 ] && [ -x "$native_seed" ]; then
    if stage0_compat_run "$native_seed" check "$src" "$@" >/dev/null 2>&1; then
      STAGE0="$native_seed"
      STAGE0_SOURCE=native
      STAGE0_VERIFIED="$STAGE0"
      return 0
    fi
    # A committed seed that cannot compile the tree it ships with is a stale seed.
    # Falling back keeps a developer's build going, but in CI it would hide the
    # rot until the fallback breaks too, so there it is an error.
    echo "committed seed $native_seed cannot compile $src: the seed is stale." >&2
    echo "Refresh the seeds with scripts/compiler/refresh-seed.sh (it also rebuilds the WASM seed) and commit them." >&2
    if [ "${COIL_REQUIRE_FRESH_SEED:-0}" = 1 ]; then
      return 1
    fi
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
    STAGE0_VERIFIED="$STAGE0"
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
  STAGE0_VERIFIED="$STAGE0"
}

# stage1_from_seed <native-seed> <compiler-source> <stage1-out> [build flags...]
#
# Build stage1 straight from the committed native seed. A seed that builds the
# tree can certainly check it, so when this succeeds the separate whole-tree
# check in select_stage0 (which on CI costs as long as the build itself) is
# skipped: STAGE0 is the seed and STAGE0_VERIFIED marks it. When it fails, the
# caller falls back to select_stage0, which diagnoses a stale seed, or picks
# another stage0 locally, and builds stage1 with that.
stage1_from_seed() {
  local native_seed="$1" src="$2" out="$3"; shift 3
  [ -z "${STAGE0:-}" ] && [ "${COIL_FORCE_WASM_STAGE0:-0}" != 1 ] && [ -x "$native_seed" ] || return 1
  local log
  log=$(mktemp "${TMPDIR:-/tmp}/coil-seed-stage1.XXXXXX") || return 1
  if stage0_compat_run "$native_seed" build "$src" -o "$out" "$@" >"$log" 2>&1; then
    rm -f "$log"
    STAGE0="$native_seed"
    STAGE0_SOURCE=native
    STAGE0_VERIFIED="$STAGE0"
    STAGE0_BUILD_FLAGS=()
    return 0
  fi
  rm -f "$log"
  return 1
}
