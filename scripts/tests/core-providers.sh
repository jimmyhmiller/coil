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

out=$(cd "$ROOT/collision" && "$COIL" check 2>&1)
rc=$?
case "$out" in
  *"core contribution 'platform-answer' is provided by both"*) collision_diag=1 ;;
  *) collision_diag=0 ;;
esac
[ "$rc" = 1 ] && [ "$collision_diag" = 1 ] \
  && ok "duplicate core contributions are rejected without order precedence" \
  || bad "provider collision" "wanted collision diagnostic, got rc=$rc: $out"

(cd "$ROOT/hermetic" && "$COIL" run >/dev/null 2>&1)
rc=$?
[ "$rc" = 42 ] && ok "hermetic common core and trap-only assertions compile" \
  || bad "hermetic core" "wanted status 42, got $rc"

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

for fixture in hermetic_extern hermetic_ir; do
  out=$(cd "$ROOT/$fixture" && "$COIL" check 2>&1)
  rc=$?
  case "$out" in
    *"extern declarations and llvm-ir are unavailable under stdlib profile 'hermetic'"*) escape_diag=1 ;;
    *) escape_diag=0 ;;
  esac
  [ "$rc" = 1 ] && [ "$escape_diag" = 1 ] \
    && ok "hermetic profile rejects runtime escape hatch ($fixture)" \
    || bad "$fixture escape" "wanted capability rejection, got rc=$rc: $out"
done

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
