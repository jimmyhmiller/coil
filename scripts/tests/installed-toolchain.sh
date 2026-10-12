#!/usr/bin/env bash
# COMPREHENSIVE: the installed toolchain, as a user meets it.
#
#   installed-toolchain.sh layout     the prefix layout, PATH resolution, a lonely compiler
#   installed-toolchain.sh allns      the manifest, and every stdlib namespace from an install
#   installed-toolchain.sh jit-sdk    coil.jit linked into a user program from the install
#   installed-toolchain.sh repl       `coil repl`: state, redefinition, transactions, errors
#
# $COIL must be the compiler of an installed prefix (<prefix>/bin/coil beside
# <prefix>/lib/coil), with the coil.jit unit warmed by `dev.py install`; the
# comprehensive harness installs one and passes it. Nothing here installs again.
set -uo pipefail
cd "$(dirname "$0")/../.."
SECTION=${1:?usage: installed-toolchain.sh layout|allns|jit-sdk|repl}
COIL=${COIL:?COIL must name an installed compiler}
PREFIX=$(cd "$(dirname "$COIL")/.." && pwd)
[ -d "$PREFIX/lib/coil/stdlib" ] || { echo "not an installed prefix: $PREFIX"; exit 2; }
T=$(mktemp -d "${COIL_TEST_SCRATCH:-${TMPDIR:-/tmp}}/installed.XXXXXX"); trap 'rm -rf "$T"' EXIT
HOST_OS=$(uname -s)
FAIL=0
ok()  { echo "ok   — $1"; }
bad() { echo "FAIL — $1"; echo "       $2" | head -40; FAIL=1; }
expect_rc() {
  local want=$1 name=$2; shift 2
  local out; out=$("$@" 2>&1); local rc=$?
  [ "$rc" = "$want" ] && ok "$name" || bad "$name" "want rc=$want got rc=$rc: $out"
}
expect_out() {
  local want=$1 name=$2; shift 2
  local out; out=$("$@" 2>&1)
  case "$out" in *"$want"*) ok "$name" ;; *) bad "$name" "want '$want' in: $out" ;; esac
}

layout() {
  [ -d "$PREFIX/lib/coil/stdlib" ] && [ -d "$PREFIX/lib/coil/compiler" ] && [ -f "$PREFIX/lib/coil/prelude.coil" ] \
    && ok "the prefix holds the stdlib, the compiler SDK and the prelude" \
    || bad "the prefix holds the stdlib, the compiler SDK and the prelude" "$(ls "$PREFIX/lib/coil")"
  expect_rc 0 "--version names its provenance" \
    python3 -c 'import re, subprocess, sys; p = subprocess.run([sys.argv[1], "--version"], cwd="/", capture_output=True, text=True); assert p.returncode == 0 and re.fullmatch(r"coil [^\s()]+(?: \(commit [0-9a-f]+, \d{4}-\d{2}-\d{2}(?:, dirty)?\))?\n", p.stdout) and not p.stderr, p' "$COIL"
  expect_rc 0 "--print-stdlib-path names the installed library" \
    python3 -c 'import pathlib, subprocess, sys; p = subprocess.run([sys.argv[1], "--print-stdlib-path"], cwd="/", capture_output=True, text=True); assert p.returncode == 0 and pathlib.Path(p.stdout.strip()).samefile(sys.argv[2]) and not p.stderr, p' "$COIL" "$PREFIX/lib/coil/stdlib"

  # A PATH entry that is a symlink to the installed binary: argv[0] is resolved to
  # the executable, so the bundled native archives beside it are found.
  mkdir -p "$T/path-bin"
  ln -s "$COIL" "$T/path-bin/coil"
  cp tests/http/client_compile.coil "$T/http.coil"
  (cd "$T" && PATH="$T/path-bin:$PATH" coil build "$T/http.coil" -o "$T/http") >"$T/http.log" 2>&1 \
    && ok "a bare \`coil\` through a PATH symlink links the bundled HTTP archives" \
    || bad "a bare \`coil\` through a PATH symlink links the bundled HTTP archives" "$(tail -20 "$T/http.log")"

  # A compiler with no library beside it says so, and where it looked. Outside both
  # the checkout and /tmp, so it cannot find a stage library by walking up.
  local lonely; lonely=$(mktemp -d /var/tmp/coil-lonely.XXXXXX)
  cp "$COIL" "$lonely/coil"
  printf '(module lonely)\n(defn main [] (-> i64) 0)\n' > "$lonely/m.coil"
  expect_out "cannot find the coil standard library" "a compiler with no library fails and says where it looked" \
    bash -c 'cd "$1" && "$1/coil" check m.coil' _ "$lonely"
  expect_rc 0 "--version works without a library" bash -c 'cd "$1" && "$1/coil" --version' _ "$lonely"
  rm -rf "$lonely"
}

allns() {
  expect_rc 0 "the stdlib manifest matches src/stdlib" python3 scripts/compiler/gen-stdlib-manifest.py --check
  "$COIL" namespaces > "$T/ns.txt" 2>/dev/null
  python3 scripts/compiler/gen-stdlib-manifest.py --print-namespaces > "$T/ns-want.txt"
  if diff -u "$T/ns-want.txt" "$T/ns.txt" > "$T/ns.diff" 2>&1; then
    ok "the compiler advertises exactly the namespaces in src/stdlib"
  else
    bad "the compiler advertises exactly the namespaces in src/stdlib" "$(head -20 "$T/ns.diff")"
  fi
  {
    echo '(module allns)'
    i=0
    while read -r ns; do
      case "$ns" in ""|coil.core|coil.jit|coil.jit.reload) continue ;; esac
      i=$((i + 1))
      echo "(import \"$ns\" :as ns$i)"
    done < "$T/ns.txt"
    echo '(defn main [] (-> i64) 0)'
  } > "$T/allns.coil"
  local count; count=$(grep -c '^(import' "$T/allns.coil")
  [ "$count" -ge 40 ] && ok "$count namespaces to import" || bad "a plausible namespace list" "got $count"
  expect_rc 0 "every advertised namespace compiles from the install, outside the checkout" \
    bash -c 'cd "$1" && env -u COIL_NAMESPACE_ROOTS "$2" check allns.coil' _ "$T" "$COIL"
}

jit_sdk() {
  local units="$PREFIX/lib/coil/units"
  [ -f "$units/llvm/coil.compiler.jit_api/unit.o" ] \
    && ok "install warmed the coil.jit unit for the default (LLVM) backend" \
    || bad "install warmed the coil.jit unit" "no $units/llvm/coil.compiler.jit_api/unit.o"
  local iface; iface=$(cat "$units/llvm/coil.compiler.jit_api/interface.coil" 2>/dev/null)
  case "$iface" in
    *"(module coil.compiler.jit_api)"*)
      case "$iface" in
        *'(import "coil.compiler.driver"'*) bad "the coil.jit unit interface imports no compiler module" "it imports coil.compiler.driver" ;;
        *) ok "the coil.jit unit interface imports no compiler module" ;;
      esac ;;
    *) bad "the coil.jit unit interface imports no compiler module" "no interface under $units/llvm" ;;
  esac
  mkdir -p "$T/sdk" "$T/no-cc"
  local link=()
  if [ "$HOST_OS" = Linux ]; then
    link=(--link-flag "-L$("${LLVM_CONFIG:-llvm-config}" --libdir)" --link-flag -lLLVM --link-flag -lm)
  fi
  cp tests/jit/checked_baseline.coil "$T/sdk/live-ir.coil"
  expect_rc 0 "a live-IR consumer links the warmed unit and runs" \
    bash -c 'cd "$1" && "$2" build live-ir.coil --backend llvm -o live-ir "${@:3}" && PATH="$(dirname "$2"):$PATH" ./live-ir' \
    _ "$T/sdk" "$COIL" ${link[@]+"${link[@]}"}
  cat > "$T/sdk/c-externs.coil" <<'EOF'
(module jit-c-externs)
(import "coil.jit" :use [jit-backend])
(extern access :cc c [(ptr i8) i32] (-> i32))
(extern strlen :cc c [(ptr i8)] (-> u64))
(extern write :cc c [i32 (ptr i8) u64] (-> i64))
(defn main [] (-> i64)
  (if (and (= (access c"/" 0) 0) (= (strlen c"four") 4)) 0 1))
EOF
  expect_rc 0 "a coil.jit program declaring libc functions with their C prototypes builds and runs" \
    bash -c 'cd "$1" && "$2" build c-externs.coil -o c-externs "${@:3}" && ./c-externs' \
    _ "$T/sdk" "$COIL" ${link[@]+"${link[@]}"}
  # The in-process JIT never shells out to a C compiler.
  printf '#!/bin/sh\necho "FAIL: an in-process JIT session invoked cc: $*" >&2\nexit 97\n' > "$T/no-cc/cc"
  chmod +x "$T/no-cc/cc"
  cp src/examples/jit_sdk.coil "$T/sdk/main.coil"
  if (cd "$T/sdk" && "$COIL" build main.coil -o app ${link[@]+"${link[@]}"}) >"$T/sdk.log" 2>&1; then
    expect_rc 0 "coil.jit embeds the installed compiler and keeps static definitions" \
      bash -c 'cd "$1" && PATH="$2:$3:$PATH" ./app' _ "$T/sdk" "$T/no-cc" "$PREFIX/bin"
    local syms; syms=$(nm "$T/sdk/app" 2>/dev/null)
    case "$syms" in
      *repl-session-new*) ok "importing coil.jit links the compiler SDK" ;;
      *) bad "importing coil.jit links the compiler SDK" "no SDK symbol in the app" ;;
    esac
  else
    bad "a coil.jit application builds from the installed toolchain" "$(tail -20 "$T/sdk.log")"
  fi
  printf '(module plain)\n(defn main [] (-> i64) 0)\n' > "$T/sdk/plain.coil"
  (cd "$T/sdk" && "$COIL" emit-obj plain.coil -o plain.o) >/dev/null 2>&1
  local plain; plain=$(nm "$T/sdk/plain.o" 2>&1)
  case "$plain" in
    *"No such file"*|"") bad "an ordinary program links no compiler SDK" "emit-obj produced nothing: $plain" ;;
    *repl-session-new*) bad "an ordinary program links no compiler SDK" "unexpected SDK symbol" ;;
    *) ok "an ordinary program links no compiler SDK" ;;
  esac
}

repl_session() { printf '%s\n' "$@" ':q' | "$COIL" repl 2>&1; }

repl() {
  local out
  out=$(repl_session \
    '(defn next [] (-> i64)' \
    '  (let [p (primitive/alloc-static i64)' \
    '        n (+ (load p) 1)]' \
    '    (store! p n)' \
    '    n))' \
    '(defn twice [(x i64)] (-> i64) (* x 2))' \
    '(defn four-times [(x i64)] (-> i64) (twice (twice x)))' \
    '(next)' '(four-times 10)' \
    '(defn twice [(x i64)] (-> i64) (* x 3))' \
    '(next)' '(four-times 10)' \
    '(defn twice [(x f64)] (-> f64) (* x 4.0))' \
    '(next)' '(four-times 10)')
  case "$out" in
    *'coil> 1'*'coil> 40'*'coil> 2'*'coil> 90'*'coil> 3'*'coil> 90'*) ok "repl keeps state and updates compiled callers on redefinition" ;;
    *) bad "repl keeps state and updates compiled callers on redefinition" "$out" ;;
  esac
  case "$out" in
    *"conflicting types for parameter 'T'"*) ok "repl rejects an incompatible redefinition" ;;
    *) bad "repl rejects an incompatible redefinition" "$out" ;;
  esac
  out=$(repl_session \
    '(defn stuff3 [(x Code)] (-> Code) `(* ~x 2))' '(stuff3 21)' \
    '(defn broken [(x Code)] (-> Code) (+ x 1))' '(stuff3 21)')
  case "$out" in
    *'coil> 42'*"'code' does not implement 'Add'"*'coil> 42'*) ok "repl keeps macros and rejects an invalid one as a transaction" ;;
    *) bad "repl keeps macros and rejects an invalid one as a transaction" "$out" ;;
  esac
  out=$(repl_session \
    '(deftrait Total [Self] (total [(value Self)] (-> i64)))' \
    '(defn doubled-total [(T Total)] [(value T)] (-> i64) (* (total value) 2))' \
    '(doubled-total 3)')
  case "$out" in
    *"--> <repl>:1:1"*"1 | (doubled-total 3)"*) ok "repl locates an error in the submitted expression" ;;
    *) bad "repl locates an error in the submitted expression" "$out" ;;
  esac
  out=$(repl_session \
    '(defstruct Point [(x i64) (y i64)])' '(derive Debug Point)' '(Point :x 10 :y 20)' \
    '(defstruct Hidden [(x i64)])' '(Hidden :x 1)')
  case "$out" in
    *"(Point :x 10 :y 20)"*"implements neither Debug nor Display"*) ok "repl prints values with Debug and explains unprintable ones" ;;
    *) bad "repl prints values with Debug and explains unprintable ones" "$out" ;;
  esac
}

case "$SECTION" in
  layout) layout ;;
  allns) allns ;;
  jit-sdk) jit_sdk ;;
  repl) repl ;;
  *) echo "unknown section: $SECTION"; exit 2 ;;
esac
[ "$FAIL" = 0 ] && echo "installed-toolchain $SECTION: PASS" || echo "installed-toolchain $SECTION: FAIL"
exit $FAIL
