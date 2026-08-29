#!/bin/sh
# Focused behavioral gate for stdlib profiles and explicit ambient core providers.
set -u

cd "$(dirname "$0")/../.." || exit 1
COIL=${1:-build/bin/coil}
case "$COIL" in
  /*) ;;
  *) COIL="$PWD/$COIL" ;;
esac

ROOT="$PWD/tests/compiler/core_providers"
failed=0

ok() { printf 'ok: %s\n' "$1"; }
bad() { printf 'FAIL: %s\n%s\n' "$1" "$2"; failed=$((failed + 1)); }

(cd "$ROOT/binding_identity" && "$COIL" check >/dev/null 2>&1)
rc=$?
[ "$rc" = 0 ] && ok "semantic reflection preserves canonical identity through an import rename" \
  || bad "canonical binding reflection" "resolved function did not expose its fully qualified identity"

(cd "$ROOT/app" && "$COIL" run >/dev/null 2>&1)
rc=$?
[ "$rc" = 42 ] && ok "root-activated provide-core name is ambient" \
  || bad "activated provider" "wanted status 42, got $rc"

out=$(cd "$ROOT/dormant" && "$COIL" check 2>&1)
rc=$?
case "$out" in
  *"call to undefined function 'platform-answer'"*) dormant_diag=1 ;;
  *) dormant_diag=0 ;;
esac
[ "$rc" = 1 ] && [ "$dormant_diag" = 1 ] \
  && ok "reachable provider remains dormant until root activation" \
  || bad "dormant provider" "wanted undefined ambient name, got rc=$rc: $out"

(cd "$ROOT/provider_order" && "$COIL" run >/dev/null 2>&1)
rc=$?
[ "$rc" = 7 ] && ok "a later core provider overrides an earlier one" \
  || bad "provider order" "wanted the last provider's 7, got $rc"

(cd "$ROOT/override_builtin" && "$COIL" run >/dev/null 2>&1)
rc=$?
[ "$rc" = 5 ] && ok "a root provider overrides a built-in profile provider" \
  || bad "builtin override" "wanted status 5, got $rc"

(cd "$ROOT/override_prelude" && "$COIL" run >/dev/null 2>&1)
rc=$?
[ "$rc" = 77 ] && ok "a provider overrides an ambient macro reexported by the prelude" \
  || bad "prelude macro override" "wanted status 77, got $rc"

(cd "$ROOT/hermetic_assert" && "$COIL" run >/dev/null 2>&1)
rc=$?
[ "$rc" = 1 ] && ok "hermetic assertions are replaceable by a board-specific handler" \
  || bad "hermetic assert override" "wanted status 1 with no trap, got $rc"

out=$(cd "$ROOT/undefined_name" && "$COIL" check 2>&1)
rc=$?
case "$out" in
  *"provide-core: 'imaginary' is not defined in module 'undefined.name.core'"*) undef_diag=1 ;;
  *) undef_diag=0 ;;
esac
[ "$rc" = 1 ] && [ "$undef_diag" = 1 ] \
  && ok "provide-core naming an undefined declaration is a located error" \
  || bad "provide-core undefined name" "wanted a located diagnostic, got rc=$rc: $out"

out=$(cd "$ROOT/unprovided_name" && "$COIL" check 2>&1)
rc=$?
case "$out" in
  *"call to undefined function 'secret'"*) unprovided_diag=1 ;;
  *) unprovided_diag=0 ;;
esac
[ "$rc" = 1 ] && [ "$unprovided_diag" = 1 ] \
  && ok "a name a provider does not provide never becomes ambient" \
  || bad "unprovided name leak" "wanted 'secret' to be undefined, got rc=$rc: $out"

(cd "$ROOT/hermetic" && "$COIL" run >/dev/null 2>&1)
rc=$?
[ "$rc" = 42 ] && ok "hermetic common core and trap-only assertions compile" \
  || bad "hermetic core" "wanted status 42, got $rc"

(cd "$ROOT/hermetic_surface" && "$COIL" check >/dev/null 2>&1)
rc=$?
[ "$rc" = 0 ] && ok "audited deterministic protocol and intrinsic namespaces form a closed hermetic surface" \
  || bad "hermetic namespace surface" "wanted successful check, got $rc"

out=$(cd "$ROOT/hermetic_forbidden" && "$COIL" check 2>&1)
rc=$?
case "$out" in
  *"namespace 'coil.io' is unavailable under stdlib profile 'hermetic'"*) forbidden_diag=1 ;;
  *) forbidden_diag=0 ;;
esac
[ "$rc" = 1 ] && [ "$forbidden_diag" = 1 ] \
  && ok "hermetic profile rejects direct forbidden stdlib import" \
  || bad "forbidden namespace" "wanted profile diagnostic, got rc=$rc: $out"

(cd "$ROOT/hermetic_print" && "$COIL" run >/dev/null 2>&1)
rc=$?
[ "$rc" = 42 ] && ok "hermetic project supplies its own ambient print core function" \
  || bad "hermetic print shim" "wanted status 42, got $rc"

out=$(cd "$ROOT/hermetic_bad_provider" && "$COIL" check 2>&1)
rc=$?
case "$out" in
  *"namespace 'coil.io' is unavailable under stdlib profile 'hermetic'"*) provider_diag=1 ;;
  *) provider_diag=0 ;;
esac
[ "$rc" = 1 ] && [ "$provider_diag" = 1 ] \
  && ok "core-provider implementation cannot evade hermetic namespace policy" \
  || bad "provider capability escape" "wanted provider import rejection, got rc=$rc: $out"

out=$(cd "$ROOT/hermetic_link" && "$COIL" check 2>&1)
rc=$?
case "$out" in
  *"[link] inputs are unavailable under [language] stdlib = \"hermetic\""*) link_diag=1 ;;
  *) link_diag=0 ;;
esac
[ "$rc" = 1 ] && [ "$link_diag" = 1 ] \
  && ok "hermetic profile rejects native linker inputs" \
  || bad "link capability escape" "wanted linker-input rejection, got rc=$rc: $out"

exit "$failed"
