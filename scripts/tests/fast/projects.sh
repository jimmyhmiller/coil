#!/usr/bin/env bash
# FAST: projects. Drives tests/projects, the fixture of real project layouts:
#
#   app/        a package using every dependency kind and manifest section: a path
#               dependency with its own C source (and a dependency cycle behind
#               it), a git dependency pinned by SHA, a prebuilt dependency, a
#               transform, a lint rule and a reader from a tools package, [cc],
#               [link], [profile.safe], an executable and an object artifact, and
#               a default plus an opt-in test suite.
#   workspace/  members that import each other with no dependency declarations,
#               a library member, a directory the members glob skips, a
#               dependency of the workspace's (with C source) and one of a member's.
#   hermetic/   the hermetic standard-library profile with a core provider.
#   units/      modules built ahead of time with build-unit (one re-exports the
#               other's names), and their consumers.
#
# The fixture is copied to a scratch directory first; the tree is never written.
# The compiler is $COIL (default: `coil` on PATH). Exit status 0 only if every
# check passes.
set -uo pipefail

ROOT=$(cd "$(dirname "$0")/../../.." && pwd)
COIL=${COIL:-coil}
BASE=${COIL_TEST_SCRATCH:-${TMPDIR:-/tmp}}
W=$(mktemp -d "$BASE/coil-projects.XXXXXX") || { echo "projects: cannot create a scratch directory"; exit 2; }
trap 'rm -rf "$W"' EXIT
cp -R "$ROOT/tests/projects/." "$W/"

FAIL=0
ok()  { echo "ok   $1"; }
bad() { echo "FAIL $1"; printf '%s\n' "$2" | head -40 | sed 's/^/       /'; FAIL=1; }

# run DIR CMD...: run CMD in DIR, leaving its combined output in OUT and status in RC.
run() {
  local dir=$1; shift
  OUT=$(cd "$dir" && "$@" 2>&1); RC=$?
}
# expect RC NEEDLE NAME: the last run exited RC and its output contains NEEDLE.
expect() {
  local want=$1 needle=$2 name=$3
  if [ "$RC" != "$want" ]; then bad "$name" "want exit $want, got $RC: $OUT"; return; fi
  case "$OUT" in
    *"$needle"*) ok "$name" ;;
    *) bad "$name" "output lacks '$needle': $OUT" ;;
  esac
}
replace() { # replace FILE FROM TO
  local text; text=$(cat "$1"); printf '%s\n' "${text//"$2"/$3}" > "$1"
}

case "$(uname -s)" in
  Darwin) LINK_FLAG=-Wl,-dead_strip ;;
  *) LINK_FLAG=-Wl,--gc-sections ;;
esac

# The git dependency: a repository created now, pinned by its commit.
GIT="$W/deps/gitlib"
git -C "$GIT" init -q && git -C "$GIT" add . \
  && git -C "$GIT" -c user.name=coil -c user.email=coil@example.invalid -c commit.gpgsign=false \
       commit -qm initial || { echo "projects: cannot create the git dependency"; exit 2; }
SHA=$(git -C "$GIT" rev-parse HEAD)
replace "$W/app/Coil.toml" "@GITLIB_URL@" "$GIT"
replace "$W/app/Coil.toml" "@GITLIB_SHA@" "$SHA"
replace "$W/app/Coil.toml" "@LINK_FLAG@" "$LINK_FLAG"
APP="$W/app"

echo "== app: build, artifacts and dependencies"
run "$APP" "$COIL" build
expect 0 "wrote build/release/pfapp" "a bare build builds the package and its artifacts"
[ -x "$APP/build/tools/tool" ] && [ -f "$APP/build/runtime.o" ] \
  && ok "the executable and object artifacts are written where the manifest says" \
  || bad "artifact outputs" "$(ls -R "$APP/build" 2>&1)"
[ -f "$APP/.coil/units/llvm/engine/unit.o" ] \
  && ok "a prebuilt dependency is compiled once into .coil/units/<backend>" \
  || bad "prebuilt dependency unit" "$(ls -R "$APP/.coil/units" 2>&1)"
checkouts=$(find "$APP/.coil/deps" -mindepth 1 -maxdepth 1 -type d -name "*-$SHA")
[ "$(printf '%s\n' "$checkouts" | grep -c .)" = 1 ] \
  && ok "the git dependency is checked out once, at its pinned SHA" \
  || bad "git dependency checkout" "$checkouts"

APP_WANT="clamp 10
settings 12x30
path 42
git 2
engine 2
native 42
libm 42
dialect 42"
run "$APP" ./build/release/pfapp
[ "$RC" = 0 ] && [ "$OUT" = "$APP_WANT" ] \
  && ok "the program reaches a placement-independent module, a reader-served module, a path dependency's C code through a dependency cycle, a git dependency, a prebuilt dependency, [cc], [link] and the project transform" \
  || bad "the built program's output" "exit $RC: $OUT"
run "$APP" ./build/tools/tool
expect 0 "tool 0" "the executable artifact runs"
symbols=$(nm "$APP/build/runtime.o" 2>&1)
case "$symbols" in
  *pfapp_runtime_answer*) ok "the object artifact exports its C symbol" ;;
  *) bad "object artifact symbol" "$symbols" ;;
esac
run "$APP" ./build/release/pfapp overflow
expect 0 "-9223372036854775807" "a release build wraps on overflow"

echo "== app: profiles, install"
run "$APP" "$COIL" build --profile safe
expect 0 "build/safe/pfapp" "--profile safe builds into build/safe"
# A build of one named file scans only that file for removed names, not the whole
# project: a file it never imports is not its business (and scanning every file
# made each such build in a large project pay for parsing all of it).
printf '(module pfapp.legacy-note)\n(import "coil.hashmap" :use [hm-len])\n' > "$APP/src/legacy_note.coil"
run "$APP" "$COIL" build --profile safe src/main.coil
rm -f "$APP/src/legacy_note.coil"
expect 0 "wrote build/safe/main" "--profile safe builds a named file into build/safe too"
case "$OUT" in
  *"removed library names"*) bad "a named-file build scans only that file for removed names" "$OUT" ;;
  *) ok "a named-file build scans only that file for removed names" ;;
esac
run "$APP" ./build/safe/pfapp overflow
[ "$RC" -ge 128 ] && case "$OUT" in *"panic: integer overflow"*) true ;; *) false ;; esac \
  && ok "the safe profile's coil.safety traps the overflow" \
  || bad "the safe profile traps" "exit $RC: $OUT"
run "$APP" "$COIL" install --root "$W/installed"
expect 0 "installed pfapp -> $W/installed/bin/pfapp" "install --root installs the package executable"
run "$W" ./installed/bin/pfapp
expect 0 "dialect 42" "the installed executable runs"

echo "== app: tests and suites"
run "$APP" "$COIL" test --suite slow
expect 1 "opt-in-must-not-run-by-default ... FAILED" "--suite runs an opt-in suite by name"
run "$APP" "$COIL" test --list --suite all
expect 0 "slow [opt-in]:" "--list marks the opt-in suite"

echo "== app: check, verify"
printf '(module pfapp.broken-test)\n\n(deftest broken-body (assert-eq (+ 1 1) "two"))\n' > "$APP/tests/broken_test.coil"
run "$APP" "$COIL" check
expect 1 "broken_test.coil" "check type-checks test bodies and locates the error"
rm -f "$APP/tests/broken_test.coil"
# verify runs fmt, lint, check, build and test: one run shows the project lint
# rule firing (a warning does not fail it) and the default suite passing.
printf '(module pfapp.zero)\n\n(defn same [(x i64)] (-> i64)\n  (+ x 0))\n' > "$APP/src/zero.coil"
run "$APP" "$COIL" verify
expect 0 "adding zero does nothing" "verify: the [lint] rule from the tools dependency fires"
expect 0 "5 passed; 0 failed" "verify: fmt, lint, check, build and the default suite (two modules may each derive their own Rec, the opt-in suite left out) pass"
rm -f "$APP/src/zero.coil"

echo "== app: manifest errors"
cp "$APP/Coil.toml" "$W/Coil.app.toml"
manifest_error() { # manifest_error NEEDLE NAME MANIFEST [ARGS...]
  local needle=$1 name=$2 manifest=$3; shift 3
  printf '%b' "$manifest" > "$APP/Coil.toml"
  run "$APP" "$COIL" check "$@"
  expect 1 "$needle" "$name"
}
PKG='[package]\nname = "pfapp"\nentry = "src/main.coil"\n'
manifest_error "Coil.toml:5: unknown section [dependecies]" "a typo'd section is a located error" \
  "$PKG\n[dependecies]\nfoo = \"../foo\"\n"
manifest_error "Coil.toml:3: unknown key 'entrypoint' in [package]" "an unknown key is a located error" \
  '[package]\nname = "pfapp"\nentrypoint = "src/main.coil"\n'
manifest_error "Coil.toml:6: dependency 'nope' path does not exist" "a missing dependency path is a located error" \
  "$PKG\n[dependencies]\nnope = { path = \"../no-such-package\" }\n"
manifest_error "dependency must specify either path, or git together with exactly one of sha, tag, or branch" \
  "a git dependency without a commit selector is an error" \
  "$PKG\n[dependencies]\nfoo = { git = \"https://example.invalid/foo.git\" }\n"
manifest_error "profile 'a' inherits from itself" "a profile inheritance cycle is an error" \
  "$PKG\n[profile.a]\ninherits = \"b\"\n\n[profile.b]\ninherits = \"a\"\n" --profile a
cp "$W/Coil.app.toml" "$APP/Coil.toml"
printf '(module pfpath-import)\n\n(import "app/src/main.coil" :use *)\n\n(defn main [] (-> i64)\n  0)\n' > "$W/path-import.coil"
run "$W" "$COIL" check path-import.coil
expect 1 "import paths are not supported" "an import naming a file path is rejected"

echo "== units: build-unit and a consumer"
run "$W/units" env COIL_NAMESPACE_ROOTS="$W/units" "$COIL" build-unit mathlib.coil -o "$W/mathlib-unit"
expect 0 "unit.o" "build-unit writes an interface and an object"
unit_key=$(cat "$W/mathlib-unit/unit.key" 2>&1)
[ -f "$W/mathlib-unit/interface.coil" ] && case "$unit_key" in *"backend llvm"*) true ;; *) false ;; esac \
  && ok "the unit has an interface and records its backend" \
  || bad "unit artifacts" "$(ls "$W/mathlib-unit" 2>&1) $unit_key"
run "$W/units" env COIL_NAMESPACE_ROOTS="$W/units" "$COIL" build consumer.coil --unit "$W/mathlib-unit" -o "$W/consumer"
expect 0 "consumer" "a consumer compiles against the unit's interface"
run "$W" ./consumer
expect 0 "" "the consumer links the unit; state, generic statics, aggregates and impls behave"
# A module that re-exports another's names builds as a unit, and its consumer sees
# the re-exported names, under the names the import gives them, and nothing more.
# With no export list, every name the module declares is public through the unit
# as from source: one its `meta` generates, a C function, a generic sum's
# variants, a derive generator, constants, and functions keep their parameter
# names.
run "$W/units" env COIL_NAMESPACE_ROOTS="$W/units" "$COIL" build-unit facade.coil -o "$W/facade-unit"
expect 0 "unit.o" "build-unit builds a module that re-exports another"
run "$W/units" env COIL_NAMESPACE_ROOTS="$W/units" "$COIL" build facade_consumer.coil --unit "$W/facade-unit" -o "$W/facade-consumer"
expect 0 "facade-consumer" "a consumer of a re-exporting unit reaches the re-exported names and every name the module declares"
run "$W" ./facade-consumer
expect 0 "" "the re-exported names behave as they do from source"
printf '(module pfunit.facade-leak)\n(import "pfunit.facade" :use *)\n(defn excluded [] (-> i64) (bump!))\n(defn renamed [] (-> i64) (combine (Point :x 1 :y 2)))\n(defn main [] (-> i64) 0)\n' > "$W/units/facade_leak.coil"
run "$W/units" env COIL_NAMESPACE_ROOTS="$W/units" "$COIL" check facade_leak.coil --unit "$W/facade-unit"
case "$RC:$OUT" in
  1:*"undefined function 'bump!'"*"undefined function 'combine'"*) ok "a re-exporting unit passes on nothing its re-export excludes or renames away" ;;
  *) bad "a re-exporting unit passes on nothing its re-export excludes or renames away" "exit $RC: $OUT" ;;
esac

echo "== a flat package"
# No src/ or tests/: the package directory is the source root, so project-wide
# commands reach a module beside the entry, not only the entry itself.
FLAT="$W/flat"
mkdir -p "$FLAT"
printf '[package]\nname = "flat"\nentry = "main.coil"\n' > "$FLAT/Coil.toml"
printf '(module flat.main)\n(import "flat.util" :use [twice])\n(defn main [] (-> i64) (println "{}" (twice 21)) 0)\n' > "$FLAT/main.coil"
printf '(module flat.util)\n(import "coil.args" :use [args-count])\n(defn twice [(x i64)] (-> i64) (+ (* x 2) (* 0 (args-count))))\n' > "$FLAT/util.coil"
# A removed name the migration cannot rewrite stops the whole project: every file
# is put back, the run says why, and it names no file as fixed.
printf '(module flat.legacy)\n(import "coil.hashmap" :use [hm-get])\n(defn f [] (-> i64) (let [g (fnptr-of hm-get [i64 i64])] 0))\n' > "$FLAT/legacy.coil"
cp "$FLAT/util.coil" "$W/flat-util.orig"
run "$FLAT" "$COIL" lint --fix
if [ "$RC" = 1 ] && cmp -s "$W/flat-util.orig" "$FLAT/util.coil"; then
  case "$OUT" in
    *"fixed "*) bad "lint --fix that cannot migrate a file names none as fixed" "$OUT" ;;
    *"legacy.coil:3: error: "*"error: lint --fix put every file back as it was: the uses of removed names reported above as errors"*)
      ok "lint --fix that cannot migrate a file puts every file back and says why" ;;
    *) bad "lint --fix that cannot migrate a file puts every file back and says why" "$OUT" ;;
  esac
else
  bad "lint --fix that cannot migrate a file puts every file back and says why" "exit $RC: $OUT $(cat "$FLAT/util.coil")"
fi
rm "$FLAT/legacy.coil"
run "$FLAT" "$COIL" lint --fix
case "$(cat "$FLAT/util.coil")" in
  *args-count*) bad "lint --fix in a flat package migrates a module beside the entry" "$OUT $(cat "$FLAT/util.coil")" ;;
  *) ok "lint --fix in a flat package migrates a module beside the entry" ;;
esac
case "$OUT" in
  *"fixed main.coil"*) bad "lint --fix names only the files it changed" "$OUT" ;;
  *"fixed util.coil"*) ok "lint --fix names only the files it changed" ;;
  *) bad "lint --fix names only the files it changed" "$OUT" ;;
esac
run "$FLAT" "$COIL" run
expect 0 "42" "the migrated flat package runs"

echo "== lint --fix on several files"
# Every file named is linted, not just the last.
MULTI="$W/multi"
mkdir -p "$MULTI"
for m in one two; do
  printf '(module multi.%s)\n(import "coil.args" :use [args-count])\n(defn main [] (-> i64) (* 0 (args-count)))\n' "$m" > "$MULTI/$m.coil"
done
run "$MULTI" "$COIL" lint --fix one.coil two.coil
case "$RC $(cat "$MULTI/one.coil" "$MULTI/two.coil")" in
  "0 "*args-count*) bad "lint --fix migrates every file it is given" "exit $RC: $OUT $(cat "$MULTI/one.coil")" ;;
  "0 "*) ok "lint --fix migrates every file it is given" ;;
  *) bad "lint --fix migrates every file it is given" "exit $RC: $OUT" ;;
esac

echo "== workspace"
WS="$W/workspace"
run "$WS" "$COIL" check
expect 0 "workspace check: 2/2 members ok" "check fans out over the members, skipping a directory with no Coil.toml"
run "$WS" "$COIL" build
expect 0 "workspace build: 1/1 members ok" "build fans out over the members with an entry"
run "$WS" ./members/cli/build/release/cli
expect 0 "cli 7 area 21 version 2" "a member's program calls into a library member, the workspace's dependency and its C code, and its own dependency"
run "$WS/members/cli" "$COIL" run src/main.coil
expect 0 "cli 7 area 21 version 2" "a member's file, run from its directory, compiles inside the workspace with both dependencies"
run "$WS" "$COIL" test
expect 0 "workspace test: 2/2 members ok" "test runs every member's tests"
cp "$WS/Coil.toml" "$W/Coil.workspace.toml"
printf '[workspace]\nname = "projfix"\nmembers = ["members/cli", "members/notes"]\n' > "$WS/Coil.toml"
run "$WS" "$COIL" check
expect 1 "'members/notes' has no Coil.toml" "an explicit member without a Coil.toml is a located error"
cp "$W/Coil.workspace.toml" "$WS/Coil.toml"

echo "== hermetic"
run "$W" "$COIL" run hermetic
expect 42 "" "run DIR runs a hermetic package whose ambient name comes from a core provider"
cp "$W/hermetic/src/main.coil" "$W/hermetic-main.coil"
printf '(module pfhermetic.main)\n\n(import "coil.io" :as io)\n\n(defn main [] (-> i64)\n  0)\n' > "$W/hermetic/src/main.coil"
run "$W/hermetic" "$COIL" check
expect 1 "namespace 'coil.io' is unavailable under stdlib profile 'hermetic'" "the hermetic profile refuses a host namespace"
cp "$W/hermetic-main.coil" "$W/hermetic/src/main.coil"
run "$W/hermetic" "$COIL" build --target wasm32-unknown-unknown -o "$W/hermetic.wasm"
magic=$(head -c 4 "$W/hermetic.wasm" 2>/dev/null | od -An -tx1 | tr -d ' \n')
[ "$RC" = 0 ] && [ "$magic" = 0061736d ] \
  && ok "a project build honors --target wasm32" \
  || bad "project --target wasm32" "exit $RC, magic '$magic': $OUT"

[ "$FAIL" = 0 ] && echo "projects: PASS" || echo "projects: FAIL"
exit "$FAIL"
