#!/usr/bin/env bash
# FAST: reader providers end to end. Fixtures live in tests/readers/.
#
#   * a Brainfuck reader turns foreign syntax into a program that runs, reads
#     stdin, exits with the program's own status, and reports a located error;
#   * a project maps file suffixes to three readers and explicit module names to
#     guest files, and imports across them;
#   * two providers for one input is an error, not last-wins;
#   * an error raised inside a provider names the file and the reader;
#   * a precompiled provider artifact is reused, invalidated and checked
#     (scripts/tests/provider-artifacts.py).
#
# Usage: scripts/tests/fast/readers.sh      (compiler from $COIL, else `coil`)
set -uo pipefail
cd "$(dirname "$0")/../../.."
COIL=${COIL:-$(command -v coil)}
[ -x "$COIL" ] || { echo "FAIL readers: no compiler (set COIL)"; exit 2; }
WORK=$(mktemp -d "${COIL_TEST_SCRATCH:-${TMPDIR:-/tmp}}/readers.XXXXXX") || exit 2
trap 'rm -rf "$WORK"' EXIT
R=tests/readers
fail=0

ok()  { echo "ok   $1"; }
bad() { echo "FAIL $1"; printf '%s\n' "$2" | head -40 | sed 's/^/     /'; fail=1; }

# expect NAME RC NEEDLE CMD...: CMD exits RC and its combined output contains NEEDLE.
expect() {
  local name=$1 want=$2 needle=$3; shift 3
  local out rc
  out=$("$@" 2>&1); rc=$?
  if [ "$rc" != "$want" ]; then bad "$name" "exit $rc, want $want: $out"; return; fi
  case "$out" in
    *"$needle"*) ok "$name" ;;
    *) bad "$name" "output lacks [$needle]: $out" ;;
  esac
}

# ---- a reader for a foreign language --------------------------------------------
out=$("$COIL" run $R/hello.bf --use rd.brainfuck 2>&1); rc=$?
[ "$rc|$out" = "0|Hello World!" ] && ok "brainfuck: a foreign program runs" \
  || bad "brainfuck: a foreign program runs" "exit $rc: $out"
# echo_underflow.bf copies stdin to stdout, then steps the data pointer below
# cell 0, which the generated program reports with exit status 3.
out=$(printf 'reader metaprogram\n' | "$COIL" run $R/echo_underflow.bf --use rd.brainfuck 2>&1); rc=$?
[ "$rc|$out" = "3|reader metaprogram" ] && ok "brainfuck: the program reads stdin and exits with its own status" \
  || bad "brainfuck: the program reads stdin and exits with its own status" "exit $rc (want 3): $out"
expect "brainfuck: a reader error is located in the input" 1 \
  "brainfuck reader: unmatched '[' in tests/readers/unmatched_open.bf at byte 1" \
  "$COIL" check $R/unmatched_open.bf --use rd.brainfuck

# ---- readers in a project ---------------------------------------------------------
# [readers] maps .json, .guest and .kv to three providers; [modules] names guest
# files explicitly; one guest file declares its module on its first line. The
# entry imports all of them: 48 is their sum.
out=$(cd $R/json_project && "$COIL" run 2>&1); rc=$?
[ "$rc" = 48 ] && ok "project: suffix readers and mapped guest modules import each other" \
  || bad "project: suffix readers and mapped guest modules import each other" "exit $rc, want 48: $out"

expect "two reader providers for one input is an error" 1 \
  "more than one --use module declares a reader provider" \
  "$COIL" check $R/raw.answer --use rd.raw --use rd.brainfuck

# An error raised inside a provider has no span of its own: it must name the
# file, the reader and the part it could not use.
mkdir -p "$WORK/rdr/src"
printf '[package]\nname = "rdr"\nentry = "src/main.coil"\n\n[readers]\n".bad" = "rdr.reader"\n\n[modules]\n"rdr.data" = "src/data.bad"\n' \
  > "$WORK/rdr/Coil.toml"
cat > "$WORK/rdr/src/reader.coil" <<'EOF'
(module rdr.reader)
(import "coil.primitive" :as p)
(reader-provider "rdr.reader" read-bad)
(defn read-bad [(context Code)] (-> Code)
  `(defn value [] (-> i64) ~(p/code-symbol `1.5)))
EOF
echo "anything" > "$WORK/rdr/src/data.bad"
printf '(module rdr.main)\n(import "rdr.data" :as d)\n(defn main [] (-> i64) (d/value))\n' > "$WORK/rdr/src/main.coil"
out=$(cd "$WORK/rdr" && "$COIL" check 2>&1); rc=$?
case "$rc|$out" in
  "1|"*"data.bad' with reader 'rdr.reader'"*"got a float"*)
    ok "a provider's error names the file, the reader and the bad part" ;;
  *) bad "a provider's error names the file, the reader and the bad part" "exit $rc: $out" ;;
esac

# ---- a precompiled provider -------------------------------------------------------
if out=$(python3 scripts/tests/provider-artifacts.py "$COIL" 2>&1); then
  printf '%s\n' "$out" | grep '^ok'
else
  bad "provider artifacts" "$out"
fi

if [ "$fail" = 0 ]; then echo "readers: PASS"; else echo "readers: FAILED"; exit 1; fi
