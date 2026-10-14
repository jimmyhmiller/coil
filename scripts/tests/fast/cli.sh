#!/usr/bin/env bash
# The command-line contract: what a user sees when they run `coil`.
#
#   scripts/tests/fast/cli.sh <section>      one section (the FAST harness runs each as a step)
#   scripts/tests/fast/cli.sh all            every section, in order
#
# The compiler is $COIL (the harness also puts it first on PATH as `coil`).
# Temporary files go in a fresh directory under $COIL_TEST_SCRATCH, removed on exit.
# Each check prints `ok — name` or `FAIL — name` and why; the section exits 1 if any
# check failed.
#
# Two ways a shell check reports a result it never established (AGENTS.md):
#   - never `grep -q` at the end of a pipeline: capture into a variable, then match;
#   - before concluding something is absent, prove the output it is absent from exists.
set -uo pipefail
cd "$(dirname "$0")/../../.."
ROOT=$PWD

SECTIONS="run usage reference new-project check fmt lint objects cross cimport cexport
debuginfo sanitizers safety-traps debug-checks debug-allocator crash test-runner fuzz"

SECTION=${1:-}
if [ -z "$SECTION" ]; then
  echo "usage: $0 <section>|all"; echo "sections:" $SECTIONS; exit 2
fi
COIL=${COIL:-$(command -v coil)}
[ -n "$COIL" ] && [ -x "$COIL" ] || { echo "cli.sh: no compiler (set COIL)"; exit 2; }
COIL=$(cd "$(dirname "$COIL")" && pwd)/$(basename "$COIL")

SCRATCH=${COIL_TEST_SCRATCH:-${TMPDIR:-/tmp}}
T=$(mktemp -d "${SCRATCH%/}/cli-$SECTION.XXXXXX") || exit 2
trap 'rm -rf "$T"' EXIT

HOST_OS=$(uname -s)
HOST_ARCH=$(uname -m)
FAIL=0
PASSED=0

ok()  { echo "  ok   — $1"; PASSED=$((PASSED + 1)); }
bad() { echo "  FAIL — $1"; printf '         %s\n' "$(printf '%s' "$2" | head -c 1500)"; FAIL=1; }

# expect_rc <want> <name> <cmd...>
expect_rc() {
  local want=$1 name=$2; shift 2
  local out rc
  out=$("$@" 2>&1); rc=$?
  [ "$rc" = "$want" ] && ok "$name" || bad "$name" "want exit $want, got $rc: $out"
}
# expect_out <extended regex> <name> <cmd...>    (the command's stdout+stderr must match)
expect_out() {
  local want=$1 name=$2; shift 2
  local out
  out=$("$@" 2>&1)
  if [ -n "$out" ] && grep -qE -- "$want" <<<"$out"; then ok "$name"; else bad "$name" "want /$want/, got: $out"; fi
}
# expect_rc_out <want-rc> <regex> <name> <cmd...>
expect_rc_out() {
  local want=$1 regex=$2 name=$3; shift 3
  local out rc
  out=$("$@" 2>&1); rc=$?
  if [ "$rc" = "$want" ] && grep -qE -- "$regex" <<<"$out"; then ok "$name"
  else bad "$name" "want exit $want and /$regex/, got exit $rc: $out"; fi
}
# expect_crash <regex> <name> <cmd...>    a program that was BUILT and then died on a signal
expect_crash() {
  local want=$1 name=$2; shift 2
  local out rc flat
  out=$("$@" 2>&1); rc=$?
  flat=$(tr '\n' ' ' <<<"$out")
  if [ "$rc" -ge 128 ] && grep -qE -- "$want" <<<"$flat"; then ok "$name"
  else bad "$name" "want a signal and /$want/, got exit $rc: $out"; fi
}
# build <source> <out> [flags...]    fails the section loudly if it does not build
build() {
  local src=$1 out=$2; shift 2
  local log
  log=$("$COIL" build "$src" -o "$out" "$@" 2>&1) && [ -x "$out" ] && return 0
  bad "builds: $(basename "$src") $*" "$log"
  return 1
}

printf '(defn main [] (-> i64) 7)\n' > "$T/seven.coil"
printf '(extern abort :cc c [] (-> void))\n(defn main [] (-> i64) (abort) 0)\n' > "$T/abort.coil"
printf '(defn main [] (-> i64) (bad-fn 3))\n' > "$T/broken.coil"

# ---------------------------------------------------------------------------
section_run() {
  expect_rc 7 "run passes the program's exit status through" "$COIL" run "$T/seven.coil"
  expect_rc_out 134 'signal 6 \(SIGABRT\)' "run reports a signal death as 128+signo and names it" \
    "$COIL" run "$T/abort.coil"

  cat > "$T/argv.coil" <<'EOF'
(module run-argv)
(import "coil.args" :as args)
(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)
  (args/init! argc argv)
  (for i (range 1 (args/count)) (println "[{}]" (args/nth i)))
  (args/count))
EOF
  local out rc
  out=$("$COIL" run "$T/argv.coil" -- -o child-output --backend nonexistent --use nope -g 2>&1); rc=$?
  if [ "$rc" = 8 ] && [ "$out" = "$(printf '[-o]\n[child-output]\n[--backend]\n[nonexistent]\n[--use]\n[nope]\n[-g]')" ]; then
    ok "every argument after -- reaches the program verbatim"
  else
    bad "every argument after -- reaches the program verbatim" "exit $rc: $out"
  fi
  [ ! -e child-output ] && [ ! -e "$T/child-output" ] \
    && ok "a child's -o does not select the build output" \
    || bad "a child's -o does not select the build output" "child-output was written"

  # The REPL: a definition, a call, a redefinition with the same signature
  # (coil.repl's Var policy), and the call again. Each definition records what
  # it reads in the session's dependency base.
  out=$(printf '(defn sq [(x i64)] (-> i64) (* x x))\n(sq 7)\n(defn sq [(x i64)] (-> i64) (+ x x))\n(sq 7)\n:q\n' \
          | "$COIL" repl 2>&1); rc=$?
  if [ "$rc" = 0 ] && grep -qx "coil> 49" <<<"$out" && grep -qx "coil> 14" <<<"$out"; then
    ok "the REPL defines, calls and redefines a function"
  else
    bad "the REPL defines, calls and redefines a function" "exit $rc: $out"
  fi
}

# ---------------------------------------------------------------------------
section_usage() {
  # An ordinary build launches no compile-time helper process: only the final
  # linker driver, named here with COIL_CC. Fatal stand-ins come first on PATH.
  mkdir -p "$T/no-tools"
  printf '#!/bin/sh\necho "unexpected compile-time process: $(basename "$0") $*" >&2\nexit 97\n' > "$T/no-tools/forbidden"
  printf '#!/bin/sh\nexec /usr/bin/cc "$@"\n' > "$T/no-tools/final-linker"
  chmod +x "$T/no-tools/forbidden" "$T/no-tools/final-linker"
  local tool
  for tool in find llvm-config opt llvm-split llc clang clang++ rm; do ln -s forbidden "$T/no-tools/$tool"; done
  local out rc
  out=$(PATH="$T/no-tools:/usr/bin:/bin" LLVM_CONFIG="$T/no-tools/llvm-config" \
        COIL_CC="$T/no-tools/final-linker" "$COIL" build "$T/seven.coil" -o "$T/no-tools-seven" --quiet 2>&1); rc=$?
  if [ "$rc" = 0 ] && [ -x "$T/no-tools-seven" ]; then ok "an ordinary build runs no tool but the final linker"
  else bad "an ordinary build runs no tool but the final linker" "exit $rc: $out"; fi

  local cmd
  for cmd in build run check; do
    expect_rc_out 1 "no such file: '.*nope.coil'" "$cmd: a missing file is an error that names it" \
      "$COIL" "$cmd" "$T/nope.coil"
  done
  expect_rc_out 1 'is a directory, not a source file' "build: a directory is not a source file" \
    "$COIL" build "$T" -o "$T/dir-out"
  expect_rc 2 "fmt --check: a missing file is an error, not 'unformatted'" "$COIL" fmt --check "$T/nope.coil"
  "$COIL" fmt --write "$T/ghost.coil" >/dev/null 2>&1
  [ ! -e "$T/ghost.coil" ] && ok "fmt --write does not create a missing file" \
                          || bad "fmt --write does not create a missing file" "it created one"

  expect_rc_out 1 "unknown flag '--frobnicate'" "build: an unknown flag is rejected and named" \
    "$COIL" build "$T/seven.coil" -o "$T/b" --frobnicate
  expect_rc_out 1 "unknown flag '--frobnicate'" "run: an unknown flag is rejected and named" \
    "$COIL" run "$T/seven.coil" --frobnicate
  expect_rc_out 1 "unknown flag '--frobnicate'" "check: an unknown flag is rejected and named" \
    "$COIL" check "$T/seven.coil" --frobnicate
  for cmd in -o --target --backend --use --link-flag; do
    expect_rc_out 2 "option '$cmd' requires a value" "a trailing $cmd without its value is a usage error" \
      "$COIL" build "$T/seven.coil" "$cmd"
  done
  expect_rc_out 1 "unsupported --target 'bogus-triple'" "an unknown --target is rejected and named" \
    "$COIL" build "$T/seven.coil" --target bogus-triple -o "$T/bogus"

  # Flags are position-independent: Unix order, and flags before the file.
  rm -f "$T/a" "$T/a.o"
  "$COIL" build -o "$T/a" "$T/seven.coil" >/dev/null 2>&1; "$T/a"; rc=$?
  [ "$rc" = 7 ] && ok "build -o OUT FILE (flags before the file)" || bad "build -o OUT FILE" "exit $rc"
  [ ! -e "$T/a.o" ] && ok "build leaves only the requested executable" \
                     || bad "build leaves only the requested executable" "$T/a.o exists"
  "$COIL" build --quiet "$T/seven.coil" --backend arm64 -o "$T/a2" >/dev/null 2>&1; "$T/a2"; rc=$?
  [ "$rc" = 7 ] && ok "build FILE with flags on both sides" || bad "build FILE with flags on both sides" "exit $rc"

}

# ---------------------------------------------------------------------------
section_reference() {
  local arg
  for arg in --version -V version; do
    expect_rc 0 "$arg prints compiler provenance" python3 -c '
import re, subprocess, sys
p = subprocess.run(sys.argv[1:], capture_output=True, text=True)
assert p.returncode == 0 and not p.stderr, p
assert re.fullmatch(r"coil [^\s()]+(?: \(commit [0-9a-f]+, \d{4}-\d{2}-\d{2}(?:, dirty)?\))?\n", p.stdout), p.stdout
' "$COIL" "$arg"
  done
  expect_rc_out 0 'usage: coil <command>' "--help prints the command overview" "$COIL" --help
  local c
  for c in build run check test fmt lint new; do
    expect_out "usage: coil $c" "$c --help documents itself" "$COIL" "$c" --help
  done

  expect_out '^  tests[[:space:]]+deftest' "guide: no topic prints the topic index" "$COIL" guide
  expect_out '^## Tests$' "guide: a topic prints its own section" "$COIL" guide tests
  expect_out 'defstruct Point' "guide: a topic alias resolves" "$COIL" guide struct
  expect_out 'zeroed T' "guide --search returns a contextual excerpt" "$COIL" guide --search zeroed
  expect_rc_out 1 'Closest topics:' "guide: an unknown topic is an error with suggestions" "$COIL" guide testt
  local all
  all=$("$COIL" guide --all 2>&1)
  case "$all" in
    '# The Coil Language'*"## Gotchas"*) ok "guide --all prints the whole reference" ;;
    *) bad "guide --all prints the whole reference" "$(head -3 <<<"$all")" ;;
  esac

  mkdir -p "$T/docs"
  cat > "$T/docs/m.coil" <<'EOF'
;;; Points and arithmetic on them.
(module shapes)

;;; A point in 2D space.
(defstruct Point [(x i64) (y i64)])

;;; Add two numbers together.
;;; Returns their sum.
(defn add [(a i64) (b i64)] (-> i64) (+ a b))

;; an ordinary comment, not documentation
(defn helper [] (-> i64) 0)
EOF
  local doc
  doc=$("$COIL" doc "$T/docs/m.coil" 2>&1); local rc=$?
  [ "$rc" = 0 ] && ok "doc exits 0 on a documented module" || bad "doc exits 0" "exit $rc: $doc"
  case "$doc" in
    *"# shapes"*"Points and arithmetic on them."*) ok "doc: a ;;; block above (module …) documents the module" ;;
    *) bad "doc: module doc" "$doc" ;;
  esac
  case "$doc" in
    *"A point in 2D space."*"Add two numbers together."*"Returns their sum."*) ok "doc: struct and multi-line fn docs" ;;
    *) bad "doc: struct and multi-line fn docs" "$doc" ;;
  esac
  case "$doc" in
    *"(defn add [(a i64) (b i64)] (-> i64))"*) ok "doc: the signature without the body" ;;
    *) bad "doc: the signature without the body" "$doc" ;;
  esac
  case "$doc" in
    *"## add"*) case "$doc" in *helper*) bad "doc: ;; is an ordinary comment" "helper is documented: $doc" ;;
                                 *) ok "doc: ;; is an ordinary comment (helper not listed)" ;; esac ;;
    *) bad "doc: ;; is an ordinary comment" "add is missing, so the absence proves nothing: $doc" ;;
  esac
  expect_out '^coil\.arraylist$' "namespaces lists the bundled library" "$COIL" namespaces
  expect_out '^# coil\.arraylist' "namespace prints a bundled namespace" "$COIL" namespace coil.arraylist
  expect_out '^## helper ' "namespace on a file lists undocumented definitions too" "$COIL" namespace "$T/docs/m.coil"
  expect_rc 1 "namespace --name rejects a missing definition" "$COIL" namespace coil.primitive --name no-such-primitive
}

# ---------------------------------------------------------------------------
section_new_project() {
  local out rc
  out=$(cd "$T" && "$COIL" new proj 2>&1); rc=$?
  [ "$rc" = 0 ] && [ -f "$T/proj/Coil.toml" ] && [ -f "$T/proj/src/main.coil" ] \
    && ok "new scaffolds Coil.toml and src/main.coil" || bad "new scaffolds a project" "exit $rc: $out"
  # A second `coil new` over an existing project must not destroy what is there.
  cp "$T/proj/src/main.coil" "$T/scaffold.coil"
  printf '(module app)\n; my own work\n(defn main [] (-> i64) 0)\n' > "$T/proj/src/main.coil"
  cp "$T/proj/src/main.coil" "$T/mine.coil"
  out=$(cd "$T" && "$COIL" new proj 2>&1); rc=$?
  [ "$rc" != 0 ] && cmp -s "$T/mine.coil" "$T/proj/src/main.coil" \
    && ok "new refuses to overwrite an existing project" \
    || bad "new refuses to overwrite an existing project" "exit $rc, src/main.coil now: $(head -3 "$T/proj/src/main.coil")"
  cp "$T/scaffold.coil" "$T/proj/src/main.coil"
  expect_rc_out 0 '^doubled total: 42$' "the scaffold runs" bash -c 'cd "$1/proj" && "$2" run' _ "$T" "$COIL"
  expect_rc 0 "the scaffold is fmt-clean" bash -c 'cd "$1/proj" && "$2" fmt --check' _ "$T" "$COIL"
  expect_rc 0 "the scaffold checks" bash -c 'cd "$1/proj" && "$2" check' _ "$T" "$COIL"
  expect_rc 0 "the scaffold lints clean" bash -c 'cd "$1/proj" && "$2" lint' _ "$T" "$COIL"
  expect_rc 0 "the scaffold passes its own coil verify" bash -c 'cd "$1/proj" && "$2" verify' _ "$T" "$COIL"
}

# ---------------------------------------------------------------------------
section_check() {
  local out rc
  out=$("$COIL" check "$T/broken.coil" 2>&1); rc=$?
  [ "$rc" = 1 ] && case "$out" in *"undefined function 'bad-fn'"*) true ;; *) false ;; esac \
    && ok "check: a broken program exits 1 and names the error" \
    || bad "check: a broken program exits 1 and names the error" "exit $rc: $out"
  case "$out" in *"broken.coil:1:24"*) ok "check: the error points at its line and column" ;;
    *) bad "check: the error points at its line and column" "$out" ;; esac
  rm -f "$T/seven.o" "$T/seven"
  expect_rc 0 "check: a good program exits 0" "$COIL" check "$T/seven.coil"
  # Every compile expands the library's metaprograms in tower generations, each of
  # which resolves and checks the whole metaprogram closure again. A function or a
  # method whose body nests macros converges inside one generation; when methods
  # could not, the generic slice `=` alone held a trivial program for seven.
  local generations
  out=$(COIL_TRACE=1 "$COIL" check "$T/seven.coil" 2>&1); rc=$?
  generations=$(grep -c 'coil-trace begin frontend.expand.round.resolve' <<<"$out")
  [ "$rc" = 0 ] && [ "$generations" -ge 1 ] && [ "$generations" -le 12 ] \
    && ok "check: a trivial program expands the library in at most 12 tower generations" \
    || bad "check: a trivial program expands the library in at most 12 tower generations" "exit $rc, $generations generations"
  [ ! -e "$T/seven.o" ] && [ ! -e "$T/seven" ] && ok "check writes no object or executable" \
    || bad "check writes no object or executable" "$(ls "$T")"
  expect_rc 0 "build -o /dev/null checks a good program" "$COIL" build "$T/seven.coil" -o /dev/null
  expect_rc_out 1 "undefined function 'bad-fn'" "build -o /dev/null reports a broken program's located error" \
    "$COIL" build "$T/broken.coil" -o /dev/null
  local unwritable=/System/nope
  [ "$HOST_OS" = Linux ] && unwritable=/proc/nope
  expect_rc 1 "build -o into a read-only location is a clear error, not a crash" \
    "$COIL" build "$T/seven.coil" -o "$unwritable"
  expect_rc_out 1 'could not write object file' "emit-obj -o into a read-only location names the problem" \
    "$COIL" emit-obj "$T/seven.coil" -o "$unwritable.o"
  # A user extern may redeclare a library C symbol with another integer width (the
  # conflicting case, another register class, is a diag golden).
  printf '(module extern-width)\n(import "coil.fs" :as fs)\n(extern mkdir :cc c [(ptr i8) i32] (-> i32))\n(defn main [] (-> i64) (mkdir c"/nonexistent-coil-dir/x" 448) 0)\n' > "$T/extern-width.coil"
  expect_rc 0 "an extern may redeclare a library symbol with another integer width" "$COIL" check "$T/extern-width.coil"
}

# ---------------------------------------------------------------------------
section_fmt() {
  printf '(defn a [] (-> i64)    1)\n' > "$T/messy1.coil"
  printf '(defn b [] (-> i64)    2)\n' > "$T/messy2.coil"
  local out n
  out=$("$COIL" fmt --check "$T/messy1.coil" "$T/messy2.coil" 2>&1)
  n=$(grep -c "not formatted" <<<"$out")
  [ "$n" = 2 ] && ok "fmt --check names every unformatted file" || bad "fmt --check names every unformatted file" "named $n of 2: $out"
  expect_rc 2 "fmt on a directory is an error" "$COIL" fmt "$T"

  out=$(printf '(defn piped [] (-> i64)    1)\n' | "$COIL" fmt - 2>&1)
  [ "$out" = "$(printf '(defn piped [] (-> i64)\n  1)')" ] && ok "fmt - formats standard input" \
    || bad "fmt - formats standard input" "$out"
  printf '(defn c [] (-> i64)    1)\n' | "$COIL" fmt --check - >/dev/null 2>&1
  [ $? = 1 ] && ok "fmt --check - reports unformatted standard input" || bad "fmt --check - on stdin" "wrong exit status"
  printf '(defn c [] (-> i64) 1)\n' | "$COIL" fmt --write - >/dev/null 2>&1
  [ $? = 2 ] && ok "fmt --write - is a usage error" || bad "fmt --write - is a usage error" "wrong exit status"

  out=$(printf '(defn width [] (-> bool) (or (= 1 1) (= 2 2) (= 3 3) (= 4 4) (= 5 5)))\n' | "$COIL" fmt --width 40 - 2>&1)
  case "$out" in *$'\n      (= 2 2)\n'*) ok "fmt --width sets the line width" ;; *) bad "fmt --width sets the line width" "$out" ;; esac
  expect_rc 2 "fmt --width 0 is rejected" "$COIL" fmt --width 0 "$T/seven.coil"

  cp "$T/messy1.coil" "$T/write.coil"
  "$COIL" fmt --write "$T/write.coil" >/dev/null 2>&1
  expect_rc 0 "fmt --write leaves a file that --check accepts" "$COIL" fmt --check "$T/write.coil"

  # Comments: one right after `(` moves in front of the list; one between a
  # binding and its value stays in that binding. The program still means the same.
  printf '(module fmtcomments)\n(defn main [] (-> i64)\n  (let [x 1\n        v\n        ; between name and value\n        [1 2]\n        w [; inside\n           3]]\n    (; before the head\n     if (= x 1) (+ x (get v 1) (get w 0)) 0)))\n' > "$T/comments.coil"
  "$COIL" fmt --write "$T/comments.coil" >/dev/null 2>&1
  expect_rc 6 "fmt keeps a list that starts with a comment a program" "$COIL" run "$T/comments.coil"
  local text
  text=$(cat "$T/comments.coil")
  case "$text" in *"; before the head"*"(if (= x 1)"*) ok "fmt moves a comment after ( in front of the list" ;;
    *) bad "fmt moves a comment after ( in front of the list" "$text" ;; esac
  case "$text" in *"v"*"; between name and value"*"[1 2]"*"w"*) ok "fmt keeps a comment inside its binding" ;;
    *) bad "fmt keeps a comment inside its binding" "$text" ;; esac
  expect_rc 0 "fmt of those comments is idempotent" "$COIL" fmt --check "$T/comments.coil"

  local base
  for base in layout vertical_spacing; do
    "$COIL" fmt "tests/cli/fmt/${base}_input.coil" > "$T/$base.got" 2>&1
    cmp -s "tests/cli/fmt/${base}_expected.coil" "$T/$base.got" \
      && ok "fmt lays out tests/cli/fmt/${base}_input.coil as expected" \
      || bad "fmt lays out tests/cli/fmt/${base}_input.coil as expected" \
             "$(diff -u "tests/cli/fmt/${base}_expected.coil" "$T/$base.got" | head -40)"
  done
  expect_rc 0 "the expected layout is a fixpoint" "$COIL" fmt --check tests/cli/fmt/layout_expected.coil
}

# ---------------------------------------------------------------------------
section_lint() {
  # --fix must actually rewrite (two rounds: primitive spellings, then set!).
  python3 -c '
import sys
open(sys.argv[1], "w").write(
    "(module lint-fires-probe)\n"
    "(import \"coil.primitive\" :as primitive)\n"
    "(defn main [] (-> i64)\n"
    "  (let [(mut x) 0]\n"
    "    (primitive/store! x 2)\n"
    "    (if (primitive/icmp-ge (primitive/load x) 2) 0 1)))\n")
' "$T/probe.coil"
  cp "$T/probe.coil" "$T/probe.orig"
  local diff_out rc
  diff_out=$("$COIL" lint "$T/probe.coil" --diff 2>&1); rc=$?
  if cmp -s "$T/probe.orig" "$T/probe.coil"; then
    case "$diff_out" in
      *"+"*"(set! x 2)"*) ok "lint --diff prints the fix and writes nothing" ;;
      *) bad "lint --diff prints the fix and writes nothing" "exit $rc, no (set! x 2) in the diff: $(head -c 600 <<<"$diff_out")" ;;
    esac
  else
    bad "lint --diff prints the fix and writes nothing" "--diff changed the file"
  fi
  # The standard profile's checkers are kept compiled beside the compiler (beside
  # an installed library, else beside the binary), built by the first lint that
  # finds none; later lints load it instead of compiling coil.lint.default.
  local profile fix_out
  if [ -d "$(dirname "$COIL")/../lib/coil/stdlib" ]; then
    profile="$(dirname "$COIL")/../lib/coil/lint-profile"
  else
    profile="$COIL.lint-profile"
  fi
  fix_out=$("$COIL" lint "$T/probe.coil" --fix --verbose 2>&1); rc=$?
  case "$fix_out" in
    *"building the lint profile"*) bad "lint loads the lint profile an earlier lint built" "$fix_out" ;;
    *"lint: analysis 1"*)
      if [ -f "$profile/metadata" ]; then
        ok "lint loads the lint profile an earlier lint built"
      else
        bad "lint loads the lint profile an earlier lint built" "no profile at $profile"
      fi ;;
    *) bad "lint loads the lint profile an earlier lint built" "exit $rc: $fix_out" ;;
  esac
  local fixed
  fixed=$(cat "$T/probe.coil")
  case "$fixed" in
    *"primitive/store!"*|*"primitive/icmp-"*) bad "lint --fix rewrites to the modern spellings" "exit $rc: $(head -c 600 <<<"$fixed")" ;;
    *"(set! x 2)"*"(load x)"*) ok "lint --fix rewrites to the modern spellings" ;;
    *) bad "lint --fix rewrites to the modern spellings" "exit $rc: $(head -c 600 <<<"$fixed")" ;;
  esac
  expect_rc 0 "the fixed file checks" "$COIL" check "$T/probe.coil"

  # A fix that does not compile is rolled back byte for byte, across the project.
  mkdir -p "$T/broken-project/src"
  printf '[package]\nname = "broken-project"\nentry = "src/main.coil"\nsource-roots = ["src"]\n' > "$T/broken-project/Coil.toml"
  printf '(module broken-project)\n(import "broken-dependency")\n(defn main [] (-> i64) (iadd 40 2))\n' > "$T/broken-project/src/main.coil"
  printf '(module broken-dependency)\n(defn broken [] (-> i64) missing)\n' > "$T/broken-project/src/dependency.coil"
  cp "$T/broken-project/src/main.coil" "$T/broken-main.orig"
  local broken
  broken=$(cd "$T/broken-project" && "$COIL" lint --fix 2>&1); rc=$?
  [ "$rc" != 0 ] && cmp -s "$T/broken-main.orig" "$T/broken-project/src/main.coil" \
    && ok "project lint --fix that cannot compile rolls back every file" \
    || bad "project lint --fix that cannot compile rolls back every file" "exit $rc"
  # The preflight rewrote `iadd`, so the error to show is the rewritten program's
  # (the dependency's unbound name), not `iadd`, which the file is put back to; and
  # a file put back is not named as fixed.
  case "$broken" in
    *"undefined function 'iadd'"*|*"fixed "*) bad "lint --fix reports why the preflight's rewrite does not compile" "$broken" ;;
    *"rewritten program reported"*"unbound variable 'missing'"*) ok "lint --fix reports why the preflight's rewrite does not compile" ;;
    *) bad "lint --fix reports why the preflight's rewrite does not compile" "$broken" ;;
  esac

  # Standard-library names that were removed (src/compiler/api_renames.coil): a
  # build points at the migration, lint --fix rewrites every spelling of them (a
  # :use list, an alias, :use * with :rename, type arguments a method drops, a
  # constructor that needs its type imported, a binding that would capture the new
  # name, lines aligned with a call's arguments, a renamed function whose new name
  # the file already calls, written qualified, a name core provided with no import,
  # a name reached through a module that re-exports its own, a call in a template,
  # names a template writes fully dotted (`coil.hashmap.hm-len`) for the module
  # that expands it, which it rewrites to spellings that need no import there
  # either; quoted data and a template's symbol only a hand could rewrite are left
  # as written), and the program runs, the template expanded in another module.
  mkdir -p "$T/renamed/src"
  printf '[package]\nname = "renamed"\nentry = "src/main.coil"\n' > "$T/renamed/Coil.toml"
  cat > "$T/renamed/src/main.coil" <<'EOF'
(module renamed.main)
(import "coil.alloc" :use [malloc-allocator])
(import "coil.hashmap" :use [hm-new-scalar hm-put! hm-get hm-len hm-for hm-free!])
(import "renamed.tally" :as tally)
(import "renamed.size" :use [size])
(import "renamed.show" :use [show census])
(import "coil.args" :use [args-count])

(defn main [] (-> i64)
  (let [(mut m) (hm-new-scalar [i64 i64] (malloc-allocator))]
    (for i (range 0 5) (hm-put! [i64 i64] (mut m) i (* i i)))
    (hm-put! (mut m)
             9
             (+ (match (hm-get m 2) (Some [v] v) (None [] 0))
                (hm-len m)))
    (let [len (hm-len m)]
      (hm-for [k v m] (when (= k 9) (println "{} {} {} {} {} {}" (- (hm-len m) len) v (tally/total (mut m)) (size m) (+ (args-count) (count (range 0 3))) (census m 4)))))
    (hm-free! (mut m))
    (show 4 2)
    0))
EOF
  cat > "$T/renamed/src/tally.coil" <<'EOF'
(module renamed.tally)
(import "coil.hashmap" :as hm)
(import "coil.alloc" :use [malloc-allocator])

(defn total [(m (mut (hm/HashMap i64 i64)))] (-> i64)
  (let [(mut seen) (hm/hm-new [i64 i64] (malloc-allocator) (hm/i64-keyops))
        (mut sum) 0]
    (hm/hm-for [k v m]
      (unless (hm/hm-contains? [i64 i64] seen k)
        (hm/hm-put! (mut seen) k 1)
        (set! sum (+ sum v))))
    (hm/hm-free! (mut seen))
    sum))
EOF
  cat > "$T/renamed/src/size.coil" <<'EOF'
(module renamed.size)
(import "coil.hashmap" :use * :rename [[hm-cap capacity]])

(defn size [(m (HashMap i64 i64))] (-> i64) (+ (hm-len m) (capacity m)))

(defn heads [(m Code)] (-> Code) `(do (hm-len ~m) (quote hm-len) (quote coil.hashmap.hm-len) hm-get))
EOF
  cat > "$T/renamed/src/show.coil" <<'EOF'
(module renamed.show)
(import "coil.debug" :as debug)
(import "coil.io" :use [stdout])

(defstruct Pair [(a i64) (b i64)])

(impl Display Pair
  (display-fmt [(p Pair) (f (ptr Formatter))] (-> i64)
    (formatter-disarm! f)
    (fmt (formatter-writer f) "{}/{}\n" (.a p) (.b p))
    0))

(defn show [(a i64) (b i64)] (-> i64)
  (let [(mut f) (zeroed Formatter)]
    (debug/formatter-init (mut f) (stdout))
    (display-fmt (Pair :a a :b b) (mut f))))

(defn census [(m Code) (k Code)] (-> Code)
  `(let [len 1
         (mut seen) (coil.hashmap.hm-new-scalar [i64 i64] (coil.alloc.malloc-allocator))]
     (coil.hashmap.hm-for [key v ~m] (coil.hashmap.hm-put! (mut seen) key v))
     (let [n (+ (coil.hashmap.hm-len seen) (if (coil.hashmap.hm-contains? seen ~k) len 0))]
       (coil.hashmap.hm-free! (mut seen))
       n)))
EOF
  expect_rc_out 1 "removed library names.*coil lint --fix" \
    "building a project that uses removed library names points at lint --fix" \
    sh -c "cd '$T/renamed' && '$COIL' build -o '$T/renamed-bin' </dev/null"
  expect_rc_out 1 "has no 'hm-new'; \`hm-new\` was removed from coil.hashmap; it is \`HashMap::new\`" \
    "an error naming a removed library name says what replaced it" \
    "$COIL" check "$T/renamed/src/tally.coil"
  expect_rc_out 1 "undefined function 'hm-len'; \`hm-len\` was removed from coil.hashmap; it is \`len\`" \
    "a call to a removed library name says what replaced it" \
    "$COIL" check "$T/renamed/src/size.coil"
  (cd "$T/renamed" && "$COIL" lint --fix >"$T/renamed.log" 2>&1); rc=$?
  cat > "$T/renamed-main.want" <<'EOF'
(module renamed.main)
(import "coil.alloc" :use [malloc-allocator])
(import "coil.hashmap" :use [for-entries HashMap])
(import "renamed.tally" :as tally)
(import "renamed.size" :use [size])
(import "renamed.show" :use [show census])
(import "coil.args")

(defn main [] (-> i64)
  (let [(mut m) (HashMap::new-scalar [i64 i64] (malloc-allocator))]
    (for i (range 0 5) (set! (mut m) i (* i i)))
    (set! (mut m)
          9
          (+ (match (get m 2) (Some [v] v) (None [] 0))
             (len m)))
    (let [len (len m)]
      (for-entries [k v m] (when (= k 9) (println "{} {} {} {} {} {}" (- (Len::len m) len) v (tally/total (mut m)) (size m) (+ (coil.args/count) (count (range 0 3))) (census m 4)))))
    (free! (mut m))
    (show 4 2)
    0))
EOF
  cat > "$T/renamed-tally.want" <<'EOF'
(module renamed.tally)
(import "coil.hashmap" :as hm)
(import "coil.alloc" :use [malloc-allocator])

(defn total [(m (mut (hm/HashMap i64 i64)))] (-> i64)
  (let [(mut seen) (hm/HashMap::new [i64 i64] (malloc-allocator) (hm/i64-keyops))
        (mut sum) 0]
    (hm/for-entries [k v m]
      (unless (contains? seen k)
        (set! (mut seen) k 1)
        (set! sum (+ sum v))))
    (free! (mut seen))
    sum))
EOF
  cat > "$T/renamed-size.want" <<'EOF'
(module renamed.size)
(import "coil.hashmap" :use *)

(defn size [(m (HashMap i64 i64))] (-> i64) (+ (len m) (cap m)))

(defn heads [(m Code)] (-> Code) `(do (len ~m) (quote hm-len) (quote coil.hashmap.hm-len) hm-get))
EOF
  cat > "$T/renamed-show.want" <<'EOF'
(module renamed.show)
(import "coil.debug" :as debug)
(import "coil.io" :use [stdout])

(defstruct Pair [(a i64) (b i64)])

(impl Display Pair
  (display-fmt [(p Pair) (f (ptr Formatter))] (-> i64)
    (disarm! f)
    (fmt (writer f) "{}/{}\n" (.a p) (.b p))
    0))

(defn show [(a i64) (b i64)] (-> i64)
  (let [(mut f) (zeroed Formatter)]
    (debug/Formatter::init (mut f) (stdout))
    (display-fmt (Pair :a a :b b) (mut f))))

(defn census [(m Code) (k Code)] (-> Code)
  `(let [len 1
         (mut seen) (coil.hashmap.HashMap::new-scalar [i64 i64] (coil.alloc.malloc-allocator))]
     (coil.hashmap.for-entries [key v ~m] (set! (mut seen) key v))
     (let [n (+ (Len::len seen) (if (contains? seen ~k) len 0))]
       (free! (mut seen))
       n)))
EOF
  local f migrated=1
  for f in main tally size show; do
    cmp -s "$T/renamed-$f.want" "$T/renamed/src/$f.coil" \
      || { migrated=0; bad "lint --fix migrates removed library names in $f.coil" \
             "exit $rc: $(diff -u "$T/renamed-$f.want" "$T/renamed/src/$f.coil" | head -40) $(head -c 600 "$T/renamed.log")"; }
  done
  [ "$rc" = 0 ] && [ "$migrated" = 1 ] && ok "lint --fix migrates removed library names in every spelling"
  # One run, two lines: the map arithmetic, then the Display impl's output.
  local ran
  ran=$(cd "$T/renamed" && "$COIL" run 2>&1); rc=$?
  grep -qxF "0 9 39 22 3 7" <<<"$ran" && ok "the migrated project runs" \
    || bad "the migrated project runs" "exit $rc: $ran"
  grep -qxF "4/2" <<<"$ran" && ok "the migrated project formats through its Display impl" \
    || bad "the migrated project formats through its Display impl" "exit $rc: $ran"
  (cd "$T/renamed" && "$COIL" lint --fix >/dev/null 2>&1); rc=$?
  cmp -s "$T/renamed-main.want" "$T/renamed/src/main.coil" && cmp -s "$T/renamed-tally.want" "$T/renamed/src/tally.coil" \
    && [ "$rc" = 0 ] && ok "lint --fix leaves migrated code alone" \
    || bad "lint --fix leaves migrated code alone" "exit $rc: $(cat "$T/renamed/src/main.coil")"

  # A removed name it cannot rewrite is reported, and its file is left as it was.
  printf '(module value-use)\n(import "coil.hashmap" :use [hm-get])\n(defn f [] (-> i64) (let [g (fnptr-of hm-get [i64 i64])] 0))\n' > "$T/value-use.coil"
  cp "$T/value-use.coil" "$T/value-use.orig"
  expect_rc_out 1 "hm-get.*used as a value" "lint --fix reports a removed name it cannot rewrite" \
    "$COIL" lint "$T/value-use.coil" --fix
  cmp -s "$T/value-use.orig" "$T/value-use.coil" \
    && ok "a file with a removed name it cannot rewrite is left as it was" \
    || bad "a file with a removed name it cannot rewrite is left as it was" "$(cat "$T/value-use.coil")"
}

# ---------------------------------------------------------------------------
section_objects() {
  cat > "$T/lib.coil" <<'EOF'
(module objlib)
(defstruct Point [(x i64) (y i64)])
(defn scale [(n i64)] (-> i64) (* n 6))
(defn make-point [(x i64) (y i64)] (-> Point) (Point :x x :y y))
(export-c [scale :as "obj_scale"] [make-point :as "obj_make_point"])
EOF
  cat > "$T/driver.c" <<'EOF'
#include <stdint.h>
typedef struct { int64_t x, y; } Point;
int64_t obj_scale(int64_t);
Point obj_make_point(int64_t, int64_t);
int main(void) { Point p = obj_make_point(3, 4); return (int)(obj_scale(7) + p.x + p.y - 49); }
EOF
  local backend rc
  for backend in llvm arm64; do
    if "$COIL" emit-obj "$T/lib.coil" --backend "$backend" -o "$T/lib-$backend.o" >/dev/null 2>&1 \
       && cc "$T/driver.c" "$T/lib-$backend.o" -o "$T/driver-$backend" 2>/dev/null; then
      "$T/driver-$backend"; rc=$?
      [ "$rc" = 0 ] && ok "emit-obj ($backend) links into a C program and returns through the C ABI" \
                    || bad "emit-obj ($backend) C program" "exit $rc"
    else
      bad "emit-obj ($backend) links into a C program" "emit-obj or cc failed"
    fi
  done
  if "$COIL" build "$T/lib.coil" --lib -o "$T/libobj.a" >/dev/null 2>&1 \
     && cc "$T/driver.c" "$T/libobj.a" -o "$T/driver-lib" 2>/dev/null; then
    "$T/driver-lib"; rc=$?
    [ "$rc" = 0 ] && ok "build --lib makes an archive a C program links" || bad "build --lib archive" "exit $rc"
  else
    bad "build --lib makes an archive a C program links" "build --lib or cc failed"
  fi

  # The LLVM verifier rejecting a module is a clean error, and the old output survives.
  cat > "$T/invalid.coil" <<'EOF'
(module invalid.module)
(import "coil.primitive" :as primitive)
(defn bad [] (-> i64)
  (primitive/llvm-ir i64 [] "br i1 true, label %a, label %b
a:
  %x = add i64 1, 2
  br label %merge
b:
  br label %merge
merge:
  ret i64 %x"))
EOF
  printf sentinel > "$T/invalid.o"
  expect_rc_out 1 'LLVM module verification failed after lowering' "an invalid LLVM module is a readable error" \
    "$COIL" emit-obj "$T/invalid.coil" -o "$T/invalid.o"
  [ "$(cat "$T/invalid.o")" = sentinel ] && ok "a failed emit-obj leaves the existing output untouched" \
    || bad "a failed emit-obj leaves the existing output untouched" "the destination was replaced"
}

# ---------------------------------------------------------------------------
section_cross() {
  if [ "$HOST_OS" = Darwin ]; then
    local out rc kind
    out=$("$COIL" build "$T/seven.coil" -o "$T/xseven" --target x86_64-apple-macosx11.0.0 2>&1); rc=$?
    kind=$(file "$T/xseven" 2>&1)
    case "$kind" in
      *x86_64*) [ "$rc" = 0 ] && ok "a cross build links an x86_64 Mach-O executable" \
                              || bad "a cross build links an x86_64 executable" "exit $rc: $out" ;;
      *) bad "a cross build links an x86_64 Mach-O executable" "exit $rc: $out / $kind" ;;
    esac
  else
    echo "  (skip: cross-linking a Mach-O slice needs the macOS toolchain)"
  fi
  # (target-arch) and (target-os) answer for the target, so a compile-time choice
  # on them folds to the target's constant.
  cat > "$T/target.coil" <<'EOF'
(module target-folding)
(import "coil.primitive" :as primitive)
(defn arch-code [] (-> Code)
  (cond (= (primitive/target-arch) `wasm32) `1
        (= (primitive/target-arch) `aarch64) `2
        (= (primitive/target-arch) `x86_64) `3
        :else `4))
(defn os-code [] (-> Code)
  (cond (= (primitive/target-os) `linux) `10
        (= (primitive/target-os) `darwin) `20
        :else `30))
(defn main [] (-> i64) (+ (arch-code) (os-code)))
EOF
  # A backend that cannot lower a program says so where the program asks for it,
  # and exits 1: the x64 backend has no 128-bit integers.
  cat > "$T/wide.coil" <<'EOF'
(module wide-int)
(defn main [] (-> i64)
  (let [big (: 18446744073709551616 i128)]
    (cast i64 (/ big (: 4294967296 i128)))))
EOF
  local wide wide_rc
  wide=$("$COIL" build "$T/wide.coil" --backend x64 --target x86_64-unknown-linux-gnu -o "$T/wide-x64" 2>&1); wide_rc=$?
  if [ "$wide_rc" = 1 ] && grep -q 'x64 backend does not support integers wider than 64 bits' <<<"$wide" \
     && grep -qE -- '--> .*wide.coil:3:16' <<<"$wide"; then
    ok "the x64 backend refuses a 128-bit integer at its location, exit 1"
  else
    bad "the x64 backend refuses a 128-bit integer at its location, exit 1" "exit $wide_rc: $wide"
  fi
  # coil.safety's fault handlers fold their signal ABI for the target, so a cross
  # build need not run anything on this machine.
  expect_rc 0 "coil.safety checks for another target" \
    "$COIL" check "$T/seven.coil" --use coil.safety --target x86_64-pc-linux-gnu
  local triple want
  while read -r triple want; do
    [ "$triple" = host ] && triple=
    expect_out "\(defn\* main \[\] \(-> i64\) \(\+ $want\)\)" "target-arch and target-os fold for ${triple:-the host}" \
      "$COIL" expand "$T/target.coil" ${triple:+--target "$triple"}
  done <<EOF
host $([ "$HOST_OS" = Darwin ] && echo "2 20" || echo "3 10")
wasm32-unknown-unknown 1 30
x86_64-pc-linux-gnu 3 10
x86_64-apple-macosx11.0.0 3 20
aarch64-unknown-linux-gnu 2 10
EOF
}

# ---------------------------------------------------------------------------
section_cimport() {
  "$COIL" cimport tests/cli/cimport_expressions.h -o "$T/expressions.coil" >/dev/null 2>&1
  local bindings
  bindings=$(cat "$T/expressions.coil" 2>/dev/null)
  if [ -z "$bindings" ]; then
    bad "cimport binds a header" "no output from cimport tests/cli/cimport_expressions.h"
  else
    local want
    while IFS= read -r want; do
      case "$bindings" in *"$want"*) ok "cimport: $want" ;; *) bad "cimport: $want" "missing from the bindings" ;; esac
    done <<'EOF'
(const COIL_OR_OPTION 260)
(const COIL_CAST_OPTION 512)
(array u8 37)
(callback (fnptr c [(ptr i8)] void))
(chain (fnptr c [i8] (fnptr c [f64] i32)))
(extern coil_get_loader :cc c [] (-> (fnptr c [(ptr i8) (ptr i32)] (ptr u8))))
(defstruct coil_uninspectable :layout explicit
EOF
    expect_rc 0 "the generated bindings check" "$COIL" check "$T/expressions.coil"
  fi

  # A system header's API includes what it includes; a selection is used directly.
  cat > "$T/sort.coil" <<'EOF'
(module system-sort)
(cimport "stdlib.h" :use [qsort abs malloc free])
(defn compare [(a (ptr i8)) (b (ptr i8))] (-> i32)
  (let [x (load (cast (ptr i64) a)) y (load (cast (ptr i64) b))]
    (cond (< x y) -1 (> x y) 1 :else 0)))
(defn main [] (-> i64)
  (let [p (cast (ptr i64) (malloc 24))]
    (store! (index p 0) 30)
    (store! (index p 1) 10)
    (store! (index p 2) 20)
    (qsort (cast (ptr i8) p) 3 8 (fnptr-of compare))
    (let [r (+ (load (index p 0)) (cast i64 (abs -2)))]
      (free (cast (ptr i8) p))
      r)))
EOF
  expect_rc 12 "a program sorts through qsort cimported from stdlib.h" "$COIL" run "$T/sort.coil"

  # An anonymous record is named by its typedef; one whose fields cannot be spelled
  # stays opaque at clang's layout.
  cat > "$T/anon.h" <<'EOF'
typedef struct { int width; int height; } ReproSize;
ReproSize repro_size_value(int width, int height);
typedef union { char bytes[128]; long long wide; } ReproState;
void repro_state(ReproState *state);
EOF
  "$COIL" cimport "$T/anon.h" -o "$T/anon.coil" >/dev/null 2>&1
  local anon
  anon=$(cat "$T/anon.coil" 2>/dev/null)
  case "$anon" in
    *"(defstruct ReproSize [(width i32) (height i32)])"*"(defstruct ReproState :layout explicit :size 128 :align 8 [])"*|\
    *"(defstruct ReproState :layout explicit :size 128 :align 8 [])"*"(defstruct ReproSize [(width i32) (height i32)])"*)
      ok "cimport names anonymous records by their typedef" ;;
    *) bad "cimport names anonymous records by their typedef" "$anon" ;;
  esac

  # :use selects single enumerators and nothing else.
  printf 'enum { COIL_POLL_IN = 1, COIL_POLL_OUT = 4 };\nenum coil_color { COIL_RED, COIL_BLUE = 7 };\n' > "$T/enums.h"
  printf '(module selected-enums)\n(cimport "%s" :use [COIL_POLL_IN COIL_BLUE])\n(defn main [] (-> i64) (+ (cast i64 COIL_POLL_IN) (cast i64 COIL_BLUE)))\n' "$T/enums.h" > "$T/enums.coil"
  expect_rc 8 "cimport :use selects enumerators" "$COIL" run "$T/enums.coil"
  printf '(module unselected-enum)\n(cimport "%s" :use [COIL_POLL_IN])\n(defn main [] (-> i64) (cast i64 COIL_POLL_OUT))\n' "$T/enums.h" > "$T/unselected.coil"
  expect_rc_out 1 'COIL_POLL_OUT' "an enumerator that was not selected is not bound" "$COIL" check "$T/unselected.coil"
}

# ---------------------------------------------------------------------------
section_cexport() {
  mkdir -p "$T/hdr"
  cat > "$T/hdr/hdr.coil" <<'EOF'
(module hdr)
(defstruct Pair [(x i64) (y i64)])
(defn add2 [(x i64)] (-> i64) (+ x 2))
(defn sum [(p Pair)] (-> i64) (+ (.x p) (.y p)))
(export-c [add2 :as "add2"] [sum :as "pair_sum"])
EOF
  local out rc
  out=$(cd "$T/hdr" && "$COIL" cheader hdr.coil 2>&1)
  case "$out" in
    *"int64_t add2(int64_t);"*"int64_t pair_sum(Pair);"*) ok "cheader prints prototypes, a struct by value included" ;;
    *) bad "cheader prints prototypes" "$out" ;;
  esac
  cat > "$T/hdr/use.c" <<'EOF'
#include "hdr.h"
int main(void) {
    Pair p = { .x = 40, .y = 2 };
    return (add2(40) == 42 && pair_sum(p) == 42) ? 0 : 1;
}
EOF
  if (cd "$T/hdr" && "$COIL" build hdr.coil --lib -o hdr.a --emit-header hdr.h >/dev/null 2>&1) \
     && (cd "$T/hdr" && cc use.c hdr.a -o use 2>/dev/null); then
    (cd "$T/hdr" && ./use); rc=$?
    [ "$rc" = 0 ] && ok "a C program compiles against --emit-header and calls the library" \
                  || bad "a C program calls the library through the header" "exit $rc"
  else
    bad "a C program compiles against --emit-header" "build --lib --emit-header or cc failed"
  fi

  # export-c on the arm64 backend: scalars and a struct return directly; a struct
  # parameter by value through a C-ABI thunk.
  cat > "$T/arm.coil" <<'EOF'
(module shapes)
(defstruct Point [(x i64) (y i64)])
(defn clamp0 [(n i64)] (-> i64) (if (< n 0) 0 n))
(defn make-point [(x i64) (y i64)] (-> Point) (Point :x (clamp0 x) :y (clamp0 y)))
(defn add3 [(x i64) (y i64) (z i64)] (-> i64) (+ x y z))
(defn px [(p Point)] (-> i64) (.x p))
(export-c [make-point :as "shapes_make_point"] [add3 :as "shapes_add3"] [px :as "shapes_px"])
EOF
  cat > "$T/arm.c" <<'EOF'
#include <stdint.h>
typedef struct { int64_t x, y; } Point;
Point shapes_make_point(int64_t, int64_t);
int64_t shapes_add3(int64_t, int64_t, int64_t);
int64_t shapes_px(Point);
int main(void) {
  Point p = shapes_make_point(3, -4);
  Point q = { 9, 1 };
  return (int)(p.x + p.y + shapes_add3(10, 20, 30) + shapes_px(q) - 72);
}
EOF
  if [ "$HOST_OS:$HOST_ARCH" = Darwin:arm64 ]; then
    if "$COIL" emit-obj "$T/arm.coil" --backend arm64 -o "$T/arm.o" >/dev/null 2>&1 \
       && cc "$T/arm.c" "$T/arm.o" -o "$T/arm" 2>/dev/null; then
      "$T/arm"; rc=$?
      [ "$rc" = 0 ] && ok "export-c on arm64: scalars, a struct return and a by-value struct parameter" \
                    || bad "export-c on arm64 called from C" "exit $rc"
    else
      bad "export-c on arm64 called from C" "emit-obj --backend arm64 or cc failed"
    fi
  else
    echo "  (skip: an arm64 Mach-O object runs only on the macOS arm64 host)"
  fi

  # An extern of the symbol a struct-by-value export defines cannot stand in for it.
  cat > "$T/collide.coil" <<'EOF'
(module export-extern-collision)
(defstruct Pair [(a i64) (b i64)])
(defn callback [(value Pair)] (-> i64) (.a value))
(export-c [callback :as "callback_c"])
(extern callback_c :cc c [Pair] (-> i64))
(defn main [] (-> i64) 0)
EOF
  expect_rc_out 1 "export-c defines C symbol 'callback_c'" "an extern colliding with a struct-by-value export is explained" \
    "$COIL" check "$T/collide.coil"
}

# ---------------------------------------------------------------------------
section_debuginfo() {
  if [ "$HOST_OS" != Darwin ] || ! command -v dsymutil >/dev/null 2>&1; then
    echo "  (skip: -g with dsymutil and lldb is checked on the macOS host)"; return
  fi
  local lldb
  lldb=$(command -v lldb || true)
  [ -x /opt/homebrew/opt/llvm/bin/lldb ] && lldb=/opt/homebrew/opt/llvm/bin/lldb
  printf '%s\n' '(module dbgl)' \
    '(defn checkpoint [(value i64)] (-> i64)' \
    '  (let [sum (+ value 1)' \
    '        twice (* sum 2)]' \
    '    (+ sum twice)))' \
    '(defn main [] (-> i64) (checkpoint 41))' > "$T/dbgl.coil"
  "$COIL" build "$T/dbgl.coil" -g -o "$T/dbgl" >/dev/null 2>&1
  [ -d "$T/dbgl.dSYM" ] && ok "build -g gathers a .dSYM" || bad "build -g gathers a .dSYM" "no $T/dbgl.dSYM"
  [ ! -e "$T/dbgl.o" ] && ok "build -g leaves no object beside the executable" \
                        || bad "build -g leaves no object beside the executable" "$T/dbgl.o exists"
  if [ -z "$lldb" ]; then bad "lldb is available" "no lldb on PATH"; return; fi
  # The object is gone, so lldb must read the .dSYM.
  local bp after
  bp=$("$lldb" -b "$T/dbgl" -o "breakpoint set --file dbgl.coil --line 6" 2>&1)
  if grep -qE 'Breakpoint 1: where = .*dbgl\.coil:6:' <<<"$bp"; then ok "lldb sets a breakpoint by source line from the .dSYM"
  else bad "lldb sets a breakpoint by source line from the .dSYM" "$(grep -iE 'breakpoint|pending' <<<"$bp" | head -3)"; fi
  after=$(timeout 60 "$lldb" -b "$T/dbgl" -o "b dbgl.checkpoint" -o run -o "thread step-over" -o "thread step-over" \
          -o "frame variable sum value" -o kill 2>&1)
  case "$after" in
    *"sum = 42"*"value = 41"*|*"value = 41"*"sum = 42"*) ok "lldb shows a parameter and a local after its initializer" ;;
    *) bad "lldb shows a parameter and a local after its initializer" "$(tail -8 <<<"$after")" ;;
  esac
}

# ---------------------------------------------------------------------------
section_sanitizers() {
  cat > "$T/asan.coil" <<'EOF'
(module asan-uaf)
(import "coil.alloc" :use *)
(defn main [] (-> i64)
  (let [a (malloc-allocator)
        p (unwrap-ptr [i8] (create [i8] a))]
    (destroy [i8] a p)
    (store! p (cast i8 7))
    0))
EOF
  if build "$T/asan.coil" "$T/asan" --sanitize=address -O0; then
    expect_crash_or_fail 'AddressSanitizer: heap-use-after-free' "--sanitize=address reports a use-after-free" "$T/asan"
  fi
  cat > "$T/tsan.coil" <<'EOF'
(module tsan-race)
(import "coil.primitive" :as primitive)
(import "coil.thread" :use *)
(defn worker [(arg (ptr i8))] (-> (ptr i8))
  (let [p (cast (ptr i64) arg)]
    (store! p (primitive/iadd (load p) 1)))
  (cast (ptr i8) 0))
(defn main [] (-> i64)
  (let [(mut counter) 0
        threads (primitive/alloc-stack (array Thread 2))]
    (Thread::spawn (index threads 0) (fnptr-of worker) (cast (ptr i8) (mut counter)))
    (Thread::spawn (index threads 1) (fnptr-of worker) (cast (ptr i8) (mut counter)))
    (join (index threads 0))
    (join (index threads 1))
    0))
EOF
  if build "$T/tsan.coil" "$T/tsan" --sanitize=thread -O1; then
    TSAN_OPTIONS=halt_on_error=1 expect_crash_or_fail 'ThreadSanitizer: data race' "--sanitize=thread reports a data race" "$T/tsan"
  fi
  cat > "$T/ubsan.coil" <<'EOF'
(module ubsan-overflow)
(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)
  (coil.primitive/iadd 9223372036854775807 (cast i64 argc)))
EOF
  if build "$T/ubsan.coil" "$T/ubsan" --sanitize=undefined -O1; then
    expect_out 'undefined behavior: signed integer overflow' "--sanitize=undefined reports a signed overflow" "$T/ubsan"
  fi
  expect_rc_out 1 'requires the LLVM backend' "a sanitizer with --backend arm64 is rejected" \
    "$COIL" build "$T/seven.coil" -o "$T/san-arm64" --sanitize=address --backend arm64
}
# expect_crash_or_fail <regex> <name> <cmd...>   a nonzero exit whose output matches
expect_crash_or_fail() {
  local want=$1 name=$2; shift 2
  local out rc
  out=$("$@" 2>&1); rc=$?
  if [ "$rc" != 0 ] && grep -qE -- "$want" <<<"$out"; then ok "$name"
  else bad "$name" "want a nonzero exit and /$want/, got exit $rc: $(head -20 <<<"$out")"; fi
}

# ---------------------------------------------------------------------------
section_safety_traps() {
  # tests/cli/safety_checks.coil trips one check per argument; with none it runs
  # the operations that must not trap. Each trap names the check and its location.
  local sc=tests/cli/safety_checks.coil
  build "$sc" "$T/safety" --use coil.safety || return
  local out
  out=$("$T/safety" 2>&1)
  local want
  for want in "in range: 42 255 3" "wrapping: -9223372036854775808 44" "unchecked: -9223372036854775808" \
              "pointers: 14" "undefined: -6148914691236517206"; do
    case "$out" in *"$want"*) ok "safety: no trap — $want" ;; *) bad "safety: no trap — $want" "$out" ;; esac
  done
  local case_name regex
  while IFS='|' read -r case_name regex; do
    expect_crash "$regex" "safety: $case_name traps and says where" "$T/safety" "$case_name"
  done <<'CASES'
index|index out of bounds: index 4, len 3.*safety_checks.coil:19:
add|integer overflow.*safety_checks.coil:20:
sub|integer overflow.*safety_checks.coil:21:
mul|integer overflow.*safety_checks.coil:22:
neg|integer overflow.*safety_checks.coil:23:
div|division by zero.*safety_checks.coil:24:
min-div|integer overflow.*safety_checks.coil:25:
shift|shift amount is greater than the type size.*safety_checks.coil:26:
narrow|integer cast truncated bits.*safety_checks.coil:27:
unsigned|cast negative value to unsigned integer.*safety_checks.coil:28:
float|integer part of floating point value out of bounds.*safety_checks.coil:29:
slice-get|index out of bounds: index 6, len 3.*safety_checks.coil:30:
subslice|start index 3 is larger than end index 2.*safety_checks.coil:31:
generic|integer overflow.*safety_checks.coil:14:.*in generic code
null-next|null pointer dereference.*safety_checks.coil:103:
null-volatile|null pointer dereference.*safety_checks.coil:104:
bad-tag|invalid variant tag: 9, the type has 3 variants.*safety_checks.coil:105:
bad-bool|invalid boolean value.*safety_checks.coil:109:
ptr-index|pointer arithmetic overflow.*safety_checks.coil:110:
memcpy-null|null pointer dereference.*safety_checks.coil:111:
unreachable|entered unreachable code.*safety_checks.coil:112:
stack|diagnosis: stack-overflow guard fault
align|misaligned pointer: address [0-9]+ is not a multiple of 8.*safety_checks.coil:45:
null-load|null pointer dereference.*safety_checks.coil:48:
null-field|null pointer dereference.*safety_checks.coil:51:
memcpy|memcpy source and destination overlap.*safety_checks.coil:57:
CASES
  out=$("$T/safety" index 2>&1)
  case "$out" in *"stack trace:"*) ok "safety: a trap prints a stack trace" ;; *) bad "safety: a trap prints a stack trace" "$out" ;; esac
}

# ---------------------------------------------------------------------------
section_debug_checks() {
  cat > "$T/dbg.coil" <<'EOF'
(module debug-checks)
(import "coil.args" :as args)
(import "coil.alloc" :use *)
(import "coil.arraylist" :use *)
(import "coil.slice" :use *)
(defn exercise [(mode (slice u8)) (s (slice i64))] (-> i64)
    (cond (= mode "slice") (get s 7)
          (= mode "subslice") (len (subslice s 2 1))
          (= mode "list")
            (let [(mut xs) (ArrayList::new [i64] (malloc-allocator))]
              (push! (mut xs) 7)
              (get xs 3))
          :else 0))
(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)
  (args/init! argc argv)
  (exercise (args/nth 1) [10 20 30]))
EOF
  build "$T/dbg.coil" "$T/dbg-on" --debug-checks || return
  expect_crash 'slice index out of bounds in get' "--debug-checks catches a slice index out of bounds" "$T/dbg-on" slice
  expect_crash 'subslice out of range or lo>hi' "--debug-checks rejects a subslice with lo > hi" "$T/dbg-on" subslice
  expect_crash 'ArrayList index out of bounds in get' "--debug-checks catches an ArrayList index out of bounds" "$T/dbg-on" list
  # Off, the checks are not compiled in: the subslice keeps its (wrong) length.
  if build "$T/dbg.coil" "$T/dbg-off"; then
    "$T/dbg-off" subslice >/dev/null 2>&1
    [ $? = 255 ] && ok "without --debug-checks no check is emitted (subslice length -1)" \
                 || bad "without --debug-checks no check is emitted" "want exit 255"
  fi
  # The stack-return and allocator lints warn under --debug-checks and are not
  # loaded without it. The allocator lint finds a Region whose parent allocator is
  # another Region's, by the declarations Region::new and `allocator` resolve to.
  cat > "$T/dangle.coil" <<'EOF'
(module dangle)
(import "coil.region" :as region)
(import "coil.alloc" :use [malloc-allocator])
(defn dangling [] (-> (ptr i64))
  (let [x (coil.primitive/alloc-stack i64)] (store! x 42) x))
(defn nested [] (-> i64)
  (match (region/Region::new (malloc-allocator))
    (None [] 1)
    (Some [outer]
      (match (region/Region::new (allocator outer))
        (None [] 0)
        (Some [inner] (close! inner) 0))
      (close! outer)
      0)))
(defn main [] (-> i64) (+ (load (dangling)) (nested)))
EOF
  local out rc
  out=$("$COIL" build "$T/dangle.coil" -o "$T/dangle-on" --debug-checks 2>&1); rc=$?
  case "$rc:$out" in
    0:*"returns a pointer to a stack local"*) ok "--debug-checks warns on returning a pointer to a stack local" ;;
    *) bad "--debug-checks warns on returning a pointer to a stack local" "exit $rc: $out" ;;
  esac
  case "$rc:$out" in
    0:*"Region is backed by another Region allocator"*"dangle.coil:10:34"*) ok "--debug-checks warns on a region whose parent is a region" ;;
    *) bad "--debug-checks warns on a region whose parent is a region" "exit $rc: $out" ;;
  esac
  out=$("$COIL" build "$T/dangle.coil" -o "$T/dangle-off" 2>&1); rc=$?
  if [ "$rc" = 0 ] && [ -x "$T/dangle-off" ]; then
    case "$out" in *"stack local"*) bad "the stack-return lint is off by default" "$out" ;;
      *) ok "the stack-return lint is off by default" ;; esac
  else
    bad "the stack-return lint is off by default" "the plain build failed: $out"
  fi
}

# ---------------------------------------------------------------------------
section_debug_allocator() {
  cat > "$T/dalloc.coil" <<'EOF'
(module debug-allocator-modes)
(import "coil.args" :as args)
(import "coil.alloc" :use *)
(import "coil.debug-allocator" :use *)
(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)
  (args/init! argc argv)
  (let [mode (args/nth 1)
        debug (DebugAllocator::new (malloc-allocator))
        a (view debug)
        p (unwrap-ptr [i64] (create [i64] a))]
    (store! p 1234)
    (cond (= mode "double-free") (do (destroy [i64] a p) (destroy [i64] a p) 0)
          (= mode "use-after-free") (do (destroy [i64] a p) (& (load p) 255))
          :else (deinit! debug))))
EOF
  build "$T/dalloc.coil" "$T/dalloc" --debug-checks || return
  expect_crash 'double free in debug-allocator' "the debug allocator stops a double free" "$T/dalloc" double-free
  expect_rc 222 "a use after free reads the 0xDE poison" "$T/dalloc" use-after-free
  expect_rc_out 1 'leaked 8 byte.*allocated at:' "deinit reports a leak, where it was allocated, and the count" \
    bash -c '"$1" leak 2>&1 | tr "\n" " "; exit "${PIPESTATUS[0]}"' _ "$T/dalloc"
}

# ---------------------------------------------------------------------------
section_crash() {
  cat > "$T/crash.coil" <<'EOF'
(module crash-report)
(import "coil.crash" :as crash)
(extern raise :cc c [i32] (-> i32))
(defn main [] (-> i64)
  (crash/install!)
  (crash/event! "before deliberate abort")
  (raise 6)
  0)
EOF
  build "$T/crash.coil" "$T/crash" || return
  local out rc
  out=$("$T/crash" 2>&1); rc=$?
  [ "$rc" = 134 ] && ok "the crash handler keeps the SIGABRT exit status" || bad "crash: SIGABRT exit status" "exit $rc: $out"
  case "$out" in
    *"coil crash: signal="*"before deliberate abort"*"stack trace:"*) ok "the crash report names the signal, recent events and the stack" ;;
    *) bad "the crash report names the signal, recent events and the stack" "$out" ;;
  esac
  COIL_CRASH_REPORT="$T/crash-report.txt" "$T/crash" >/dev/null 2>&1
  local report
  report=$(cat "$T/crash-report.txt" 2>/dev/null)
  case "$report" in
    *"before deliberate abort"*) ok "COIL_CRASH_REPORT writes the report to a file" ;;
    *) bad "COIL_CRASH_REPORT writes the report to a file" "${report:-no file}" ;;
  esac

  # A panic reports its message, where it was written and a stack trace, then aborts.
  cat > "$T/panic.coil" <<'EOF'
(module panic-report)
(defsum Light (Red) (Green))

(defn step [(l Light) (blocked bool)] (-> Light)
  (match l
    (Red [] (if blocked (unreachable) (Green)))
    (Green [] (if blocked (unreachable "green while {}" "blocked") (Red)))))

(defn parse-digit [(c u8)] (-> i64)
  (if (and (>= c #\0) (<= c #\9))
      (- (cast i64 c) #\0)
      (panic "not a digit: {} at {}" c 7)))

(defn main [(argc i32)] (-> i64)
  (println "{}" (parse-digit #\4))
  (cond (= argc 1) (parse-digit #\x)
        (= argc 2) (do (step (Red) true) 0)
        :else (do (step (Green) true) 0)))
EOF
  build "$T/panic.coil" "$T/panic" || return
  local args want stdout
  while IFS='|' read -r args want; do
    stdout=$("$T/panic" $args 2>/dev/null)
    out=$("$T/panic" $args 2>&1 >/dev/null); rc=$?
    if [ "$rc" = 134 ] && [ "$stdout" = 4 ] && grep -qE -- "$want" <<<"$(tr '\n' ' ' <<<"$out")" \
       && grep -q 'stack trace:' <<<"$out"; then
      ok "panic report: ${want%%  *}"
    else
      bad "panic report: $want" "exit $rc, stdout [$stdout], stderr: $out"
    fi
  done <<'EOF'
|^panic: not a digit: 120 at 7   at .*panic.coil:12:7
a|^panic: entered unreachable code   at .*panic.coil:6:25
a b|^panic: entered unreachable code: green while blocked   at .*panic.coil:7:27
EOF
}

# ---------------------------------------------------------------------------
section_test_runner() {
  cat > "$T/suite.coil" <<'EOF'
(module suite)
(deftest passes (assert-eq (* 6 7) 42))
(deftest fails (assert-eq (+ 1 1) 3))
(deftest crashes (do (coil.primitive/store! (cast (ptr i64) 0) 1) (assert true)))
(deftest tail (assert (> 5 0)))
EOF
  local out rc
  out=$("$COIL" test "$T/suite.coil" 2>&1); rc=$?
  [ "$rc" = 1 ] && ok "a suite with a failing test exits 1" || bad "a suite with a failing test exits 1" "exit $rc: $out"
  case "$out" in *"running 4 tests"*) ok "the runner discovers every deftest" ;; *) bad "the runner discovers every deftest" "$out" ;; esac
  case "$out" in *"test tail ... ok"*) ok "a crashing test does not stop the others (one process per test)" ;;
    *) bad "a crashing test does not stop the others" "$out" ;; esac
  case "$out" in *"2 passed; 2 failed"*) ok "the summary counts passes and failures" ;; *) bad "the summary counts" "$out" ;; esac
  case "$out" in *"(+ 1 1)"*"suite.coil:3"*) ok "a failed assert-eq names its expression and line" ;;
    *) bad "a failed assert-eq names its expression and line" "$out" ;; esac

  cat > "$T/green.coil" <<'EOF'
(module green)
(deftest alpha (assert-eq (* 3 3) 9))
(deftest beta (assert (> 7 0)))
EOF
  expect_rc_out 0 '1 passed; 0 failed' "--filter=NAME selects by name, before or after the file" \
    "$COIL" test --filter=alp "$T/green.coil"
  out=$("$COIL" test "$T/green.coil" --list 2>&1 | sed '/^ld: warning:/d')
  [ "$out" = "$(printf 'alpha\nbeta')" ] && ok "--list prints the tests and runs nothing" || bad "--list prints the tests" "$out"
  expect_rc_out 1 '0 tests matched' "a filter that matches nothing is not green" "$COIL" test "$T/green.coil" --filter nope
  expect_rc 2 "--filter without a value is a usage error" "$COIL" test "$T/green.coil" --filter
  expect_rc_out 1 'defines 2 test\(s\) and no .main.' "running a test file says it has tests, not a link error" \
    "$COIL" run "$T/green.coil"

  # A test project: tests/*_test.coil, an imported module that defines its own main.
  mkdir -p "$T/proj/src" "$T/proj/tests"
  printf '[package]\nname = "tproj"\nentry = "src/main.coil"\n' > "$T/proj/Coil.toml"
  printf '(module tproj.lib)\n(defn helper [] (-> i64) 7)\n' > "$T/proj/src/lib.coil"
  printf '(module tproj.main)\n(import "tproj.lib" :as lib)\n(defn main [] (-> i64) (println "APP MAIN") (lib/helper))\n' > "$T/proj/src/main.coil"
  printf '(module tproj.lib-test)\n(import "tproj.lib" :as lib)\n(import "tproj.main" :as app)\n(deftest helper-works (assert-eq (lib/helper) 7))\n' > "$T/proj/tests/lib_test.coil"
  out=$(cd "$T/proj" && "$COIL" test 2>&1); rc=$?
  if [ "$rc" = 0 ]; then
    case "$out" in
      *"APP MAIN"*) bad "coil test in a project runs the tests, not the app's main" "$out" ;;
      *"1 passed; 0 failed"*) ok "coil test in a project runs the tests, not the app's main" ;;
      *) bad "coil test in a project runs the tests" "$out" ;;
    esac
  else
    bad "coil test in a project runs the tests" "exit $rc: $out"
  fi

  printf '(module eprint)\n(defn main [] (-> i64) (eprintln "err {}" 1) (println "out {}" 2) 0)\n' > "$T/eprint.coil"
  build "$T/eprint.coil" "$T/eprint" || return
  local o e
  o=$("$T/eprint" 2>/dev/null); e=$("$T/eprint" 2>&1 >/dev/null)
  [ "$o" = "out 2" ] && [ "$e" = "err 1" ] && ok "eprintln writes to stderr and println to stdout" \
    || bad "eprintln writes to stderr and println to stdout" "stdout=[$o] stderr=[$e]"
}

# ---------------------------------------------------------------------------
section_fuzz() {
  mkdir -p "$T/fuzz"
  cat > "$T/fuzz/planted_test.coil" <<'EOF'
(module planted)
(import "coil.prop" :use *)

; The planted bug: a "clamp" that forgets the upper bound above 1000.
(defn clamp [(x i64)] (-> i64)
  (cond (< x 0) 0 (> x 1000) x :else x))

(defprop clamp-stays-below-limit [(x i64)]
  (<= (clamp x) 1000))
EOF
  local out rc
  out=$(cd "$T/fuzz" && timeout 120 "$COIL" fuzz planted_test.coil --seed 7 -n 200 --status-every 0 2>&1); rc=$?
  [ "$rc" != 0 ] && ok "coil fuzz fails on a planted bug" || bad "coil fuzz fails on a planted bug" "exit $rc: $out"
  case "$out" in *"FAILED while fuzzing"*"x = 1001"*) ok "the counterexample is shrunk to the boundary (x = 1001)" ;;
    *) bad "the counterexample is shrunk to the boundary (x = 1001)" "$(tail -30 <<<"$out")" ;; esac
  out=$(cd "$T/fuzz" && "$COIL" test planted_test.coil 2>&1); rc=$?
  if [ "$rc" != 0 ]; then
    case "$out" in *"replaying the saved counterexample"*"x = 1001"*) ok "coil test replays the saved finding" ;;
      *) bad "coil test replays the saved finding" "$out" ;; esac
  else
    bad "coil test replays the saved finding" "coil test passed: $out"
  fi
}

run_section() {
  case "$1" in
    run) section_run ;;
    usage) section_usage ;;
    reference) section_reference ;;
    new-project) section_new_project ;;
    check) section_check ;;
    fmt) section_fmt ;;
    lint) section_lint ;;
    objects) section_objects ;;
    cross) section_cross ;;
    cimport) section_cimport ;;
    cexport) section_cexport ;;
    debuginfo) section_debuginfo ;;
    sanitizers) section_sanitizers ;;
    safety-traps) section_safety_traps ;;
    debug-checks) section_debug_checks ;;
    debug-allocator) section_debug_allocator ;;
    crash) section_crash ;;
    test-runner) section_test_runner ;;
    fuzz) section_fuzz ;;
    *) echo "cli.sh: unknown section '$1'"; echo "sections:" $SECTIONS; exit 2 ;;
  esac
}

if [ "$SECTION" = all ]; then
  for s in $SECTIONS; do echo "== $s"; run_section "$s"; done
else
  echo "== $SECTION"
  run_section "$SECTION"
fi
echo "cli $SECTION: $PASSED passed$([ "$FAIL" = 0 ] || echo ", FAILED")"
exit $FAIL
