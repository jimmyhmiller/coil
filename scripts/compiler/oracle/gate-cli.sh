#!/usr/bin/env bash
# CLI GATE — the driver's user-facing contract: argv handling, exit codes, fmt.
#
# Every case here is a bug that shipped, because the CLI surface had no test at all
# while the compiler core had several. The recurring shape was silent permissiveness:
# a flag ignored, a missing file read as empty, a crash reported as success. If any of
# these regress, the compiler still passes gate-full — that is precisely the gap.
#
# Usage: scripts/compiler/oracle/gate-cli.sh [path-to-coil]      (default: build/bin/coil)
set -uo pipefail

# The sections below are independent test groups. Run them in isolated workers by
# default; the coordinator preserves source order in its combined output. The
# serial mode remains useful when debugging a failure.
if [ "${COIL_GATE_CLI_SERIAL:-0}" != 1 ]; then
  exec python3 "$(dirname "$0")/gate-cli-parallel.py" "$0" "${1:-build/bin/coil}"
fi

cd "$(dirname "$0")/../../.."
COIL="${1:-build/bin/coil}"
[ -x "$COIL" ] || { echo "no coil at $COIL"; exit 1; }
COIL="$(cd "$(dirname "$COIL")" && pwd)/$(basename "$COIL")"

T=$(mktemp -d); trap 'rm -rf "$T"' EXIT
FAIL=0
# Host discrimination: a few checks exercise macOS/arm64-only surfaces (Mach-O
# cross-links, running --backend arm64 output, dsymutil/.dSYM). Off that host they
# skip — or assert the located error the same source correctly produces there.
HOST_OS=$(uname -s)      # Darwin | Linux
HOST_ARCH=$(uname -m)    # arm64 | x86_64 | aarch64
ok()   { echo "  ok   — $1"; }
bad()  { echo "  FAIL — $1"; echo "         $2"; FAIL=1; }

# expect_rc <want> <name> <cmd...>
expect_rc() {
  local want=$1 name=$2; shift 2
  local out; out=$("$@" 2>&1); local rc=$?
  [ "$rc" = "$want" ] && ok "$name" || bad "$name" "want rc=$want got rc=$rc: $out"
}
# expect_rc_arm64 <code> <name> <cmd...>
# For checks that BUILD AND RUN a `--backend arm64` executable. That backend emits
# Mach-O, so off the macOS arm64 host the link fails with `file format not
# recognized` -- a toolchain fact, not a defect, and it accounted for 6 of the 8
# gate-cli failures on the first Linux run.
#
# Deliberately prints a SKIP LINE rather than staying silent: a check that vanishes
# without a trace is indistinguishable from one that passed, which is the same
# vacuum that let gate-target-os rot unnoticed. And the guard is narrow on purpose
# -- widen it and it stops covering the one host that CAN run this, which is the
# only host that ever exercises the arm64 backend end to end.
expect_rc_arm64() {
  if [ "$HOST_OS" = Darwin ] && [ "$HOST_ARCH" = arm64 ]; then
    expect_rc "$@"
  else
    echo "  (skip: $2 — building and running a --backend arm64 Mach-O needs the macOS arm64 host)"
  fi
}
# expect_out <regex> <name> <cmd...>
expect_out() {
  local want=$1 name=$2; shift 2
  local out; out=$("$@" 2>&1)
  echo "$out" | grep -qE "$want" && ok "$name" || bad "$name" "want /$want/, got: $out"
}
# expect_crash_out <regex> <name> <cmd...>
# Runtime-safety tests must prove that a program was built and then trapped. A
# compiler diagnostic can contain the expected string by quoting source, which
# previously allowed a broken test fixture to look green.
expect_crash_out() {
  local want=$1 name=$2; shift 2
  local out; out=$("$@" 2>&1); local rc=$?
  if [ "$rc" -ge 128 ] && echo "$out" | grep -qE "$want"; then
    ok "$name"
  else
    bad "$name" "want runtime signal and /$want/, got rc=$rc: $out"
  fi
}

printf '(defn main [] (-> i64) 7)\n'                     > "$T/seven.coil"
printf '(extern abort :cc c [] (-> i64))\n(defn main [] (-> i64) (abort))\n' > "$T/abort.coil"
printf '(defn a [] (-> i64)    1)\n'                     > "$T/messy1.coil"
printf '(defn b [] (-> i64)    2)\n'                     > "$T/messy2.coil"

echo "== ordinary build launches only its final linker =="
# Compilation used to shell out to find, llvm-config, opt, llvm-split, eight llc
# processes, an intermediate clang -r, and rm. Put fatal stand-ins first on PATH
# and point LLVM_CONFIG there too: a normal source build must still succeed. The
# one allowed child is the final linker driver, named explicitly with COIL_CC.
mkdir -p "$T/no-build-tools"
cat > "$T/no-build-tools/forbidden" <<'EOF'
#!/bin/sh
echo "unexpected compile-time process: $(basename "$0") $*" >&2
exit 97
EOF
cat > "$T/no-build-tools/final-linker" <<'EOF'
#!/bin/sh
exec /usr/bin/cc "$@"
EOF
chmod +x "$T/no-build-tools/forbidden" "$T/no-build-tools/final-linker"
for tool in find llvm-config opt llvm-split llc clang clang++ rm; do
  ln -s forbidden "$T/no-build-tools/$tool"
done
if PATH="$T/no-build-tools:/usr/bin:/bin" \
   LLVM_CONFIG="$T/no-build-tools/llvm-config" \
   COIL_CC="$T/no-build-tools/final-linker" \
   COIL_PARALLEL_CODEGEN_MIN_FUNCTIONS=1 \
   "$COIL" build "$T/seven.coil" -o "$T/no-child-build" --quiet \
   >"$T/no-child-build.stdout" 2>"$T/no-child-build.stderr"; then
  ok "ordinary compilation invokes no tools before the final linker"
else
  bad "ordinary compilation invokes no tools before the final linker" \
      "$(cat "$T/no-child-build.stderr")"
fi

echo "== compile-time reader metaprograms =="
scripts/tests/reader-metaprograms.sh "$COIL" \
  && ok "generic readers cover check/build/run, ambiguity, parity, and strict installed layout" \
  || bad "generic reader metaprograms" "focused reader gate failed"

echo "== metaprogram memory stays linear (META_MEMORY teeth) =="
# An 8,000-form (scope …) body compiled through the macro engine. The quadratic
# code-rest / `(~@acc ~f) idioms this cap exists to keep out peaked ~5 GiB RSS
# here (27 GiB at 20k forms) before commit 7ec494e; the linear implementation
# measures 2.3 GiB VmPeak (LLVM mappings included), so a 4 GiB address-space
# cap separates the two with margin on both sides. See docs/design/META_MEMORY.md.
awk 'BEGIN{
  print "(module memteeth)";
  print "(import \"coil.primitive\" :as primitive)";
  print "(import \"coil.control\" :use [scope return-from])";
  print "(defn main [] (-> i64)";
  print "  (let [(mut x) 0]";
  print "    (scope :s";
  for (i=0;i<8000;i++) print "      (store! x (primitive/iadd (load x) 1))";
  print "      0)";
  print "    (load x)))"
}' > "$T/memteeth.coil"
( ulimit -v 4194304; "$COIL" check "$T/memteeth.coil" >/dev/null 2>&1 ) \
  && ok "an 8k-form scope body typechecks under a 4 GiB address-space cap" \
  || bad "metaprogram memory teeth" "coil check blew the 4 GiB cap — a quadratic expansion idiom is back (docs/design/META_MEMORY.md)"

echo "== CodeBuilder discipline (META_MEMORY phase 4) =="
# The builder/Code type split: a finished list cannot be pushed onto, a list
# still being built cannot be read, and a builder cannot pose as Code without
# (primitive/code-list-done b). Each misuse is a LOCATED error naming the fix.
printf '(module bb1)\n(import "coil.primitive" :as primitive)\n(defn f [(c Code)] (-> Code) (do (primitive/code-list-push! c `1) c))\n(defn main [] (-> i64) 0)\n' > "$T/bb1.coil"
expect_out "expect a builder from .primitive/code-list-new." "pushing onto finished Code is a located error" "$COIL" check "$T/bb1.coil"
printf '(module bb2)\n(import "coil.primitive" :as primitive)\n(defn f [] (-> i64) (let [b (primitive/code-list-new)] (primitive/code-count b)))\n(defn main [] (-> i64) 0)\n' > "$T/bb2.coil"
expect_out "freeze the builder first with .primitive/code-list-done b." "reading an unfrozen builder is a located error" "$COIL" check "$T/bb2.coil"
printf '(module bb3)\n(import "coil.primitive" :as primitive)\n(defn f [] (-> Code) (primitive/code-list-new))\n(defn main [] (-> i64) 0)\n' > "$T/bb3.coil"
expect_out "body has type codebuilder but the declared return type is code" "returning a builder as Code is a type error" "$COIL" check "$T/bb3.coil"
printf '(module bb4)\n(import "coil.primitive" :as primitive)\n(defn ok-done [] (-> Code)\n  (let [b (primitive/code-list-new)]\n    (do (primitive/code-list-push! b `1) (primitive/code-list-done b))))\n(defn main [] (-> i64) 0)\n' > "$T/bb4.coil"
expect_rc 0 "build + done + return typechecks" "$COIL" check "$T/bb4.coil"

echo "== code-rest is a view (META_MEMORY phase 5) =="
# cdr-recursion over a 20,000-element Code list. When code-rest copied the
# tail this shape allocated n²/2 ≈ 2×10⁸ nodes (~13 GiB); as an O(1) view it
# runs at the compiler's baseline (~0.5 GiB measured). The 2 GiB cap fails the
# copying implementation with an order of magnitude to spare.
{
  printf '(module bigcdr)\n(import "coil.primitive" :as primitive)\n'
  printf '(defn sum-ints [(xs Code)] (-> i64)\n'
  printf '  (if (primitive/icmp-eq (primitive/code-count xs) 0)\n      0\n'
  printf '      (primitive/iadd (primitive/code-int (primitive/code-nth xs 0))\n'
  printf '                      (sum-ints (primitive/code-rest xs)))))\n'
  printf '(defn total [& (body Code)] (-> Code) `~(sum-ints body))\n'
  printf '(defn main [] (-> i64)\n  (- (total'
  awk 'BEGIN { for (i=0;i<20000;i++) printf " 1" }'
  printf ') 20000))\n'
} > "$T/bigcdr.coil"
( ulimit -v 2097152; "$COIL" check "$T/bigcdr.coil" >/dev/null 2>&1 ) \
  && ok "20k-step code-rest recursion typechecks under a 2 GiB cap" \
  || bad "code-rest view teeth" "cdr-recursion blew the 2 GiB cap — code-rest is copying tails again (docs/design/META_MEMORY.md)"

echo "== executable-relative resources through PATH =="
HTTP_NATIVE_TARGET=$([ "$HOST_OS" = Linux ] && echo x86_64-linux || echo arm64-macos)
mkdir -p "$T/path-bin" "$T/prefix/bin/native/curl/$HTTP_NATIVE_TARGET" "$T/prefix/lib/coil"
cp "$COIL" "$T/prefix/bin/coil-real"
# A compiler carries no library, so the real executable must live in an actual
# installed prefix: <prefix>/bin beside <prefix>/lib/coil. The PATH entry remains
# an outside symlink so this still proves argv[0] is resolved to the executable.
ln -sfn "$PWD/src/stdlib" "$T/prefix/lib/coil/stdlib"
ln -sfn "$PWD/src/compiler" "$T/prefix/lib/coil/compiler"
ln -sfn "$PWD/src/compiler/prelude.coil" "$T/prefix/lib/coil/prelude.coil"
ln -s "$T/prefix/bin/coil-real" "$T/path-bin/coil"
cp tests/http_client_compile.coil "$T/http.coil"
cat > "$T/curl-stub.c" <<'EOF'
void *curl_easy_init(void) { return 0; }
void curl_easy_cleanup(void *p) {}
int curl_easy_perform(void *p) { return 1; }
int curl_easy_setopt(void *p, int option, ...) { return 0; }
int curl_easy_getinfo(void *p, int info, ...) { return 0; }
char *curl_easy_strerror(int code) { return "stub"; }
void *curl_slist_append(void *list, const char *value) { return list; }
void curl_slist_free_all(void *list) {}
void *curl_multi_init(void) { return 0; }
int curl_multi_add_handle(void *multi, void *easy) { return 0; }
int curl_multi_remove_handle(void *multi, void *easy) { return 0; }
int curl_multi_perform(void *multi, int *running) { *running = 0; return 0; }
int curl_multi_poll(void *multi, void *extra, unsigned int count, int timeout_ms,
                    int *ready) { *ready = 0; return 0; }
void *curl_multi_info_read(void *multi, int *remaining) { *remaining = 0; return 0; }
int curl_multi_cleanup(void *multi) { return 0; }
EOF
cc -c "$T/curl-stub.c" -o "$T/curl-stub.o"
ar rcs "$T/prefix/bin/native/curl/$HTTP_NATIVE_TARGET/libcurl.a" "$T/curl-stub.o"
for archive in libmbedtls.a libmbedx509.a libmbedcrypto.a; do
  ar rcs "$T/prefix/bin/native/curl/$HTTP_NATIVE_TARGET/$archive" "$T/curl-stub.o"
done
(cd "$T" && PATH="$T/path-bin:$PATH" coil build "$T/http.coil" -o "$T/http") >/dev/null 2>&1 \
  && ok "bare argv[0] resolves bundled HTTP archives beside the executable" \
  || bad "bare argv[0] resolves bundled HTTP archives beside the executable" "PATH invocation could not link coil.http.client"

echo "== exit codes (a crash must not look like success) =="
expect_rc 7   "run propagates a normal exit code"        "$COIL" run "$T/seven.coil"
expect_rc 134 "run propagates SIGABRT as 128+signo"      "$COIL" run "$T/abort.coil"
expect_out "signal 6 \(SIGABRT\)" "a signal death names itself" "$COIL" run "$T/abort.coil"

echo "== run keeps every argument after -- out of compiler option parsing =="
cat > "$T/run-child-flags.coil" <<'EOF'
(module run-child-flags)
(import "coil.primitive" :as primitive)
(import "coil.slice" :as slice)
(extern strcmp :cc c [(ptr i8) (ptr i8)] (-> i32))
(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)
  (if (!= (cast i64 argc) 3)
      10
      (if (!= (cast i64 (strcmp (load (primitive/index argv 1))
                                (slice/slice-data [u8] "-o")))
              0)
          11
          (cast i64 (strcmp (load (primitive/index argv 2))
                            (slice/slice-data [u8] "child-output"))))))
EOF
expect_rc 0 "child -o is passed verbatim after --" \
  "$COIL" run "$T/run-child-flags.coil" -- -o child-output
[ ! -e child-output ] \
  && ok "child -o does not select Coil's build output" \
  || bad "child -o does not select Coil's build output" "run leaked a post--- flag into build parsing"

echo "== a file the user named must exist =="
expect_rc 1 "build: missing file is an error"            "$COIL" build "$T/nope.coil" -o "$T/x"
expect_out "no such file" "build: missing file is named" "$COIL" build "$T/nope.coil" -o "$T/x"
expect_rc 2 "fmt: missing file is an error (not 'unformatted')" "$COIL" fmt --check "$T/nope.coil"
"$COIL" fmt --write "$T/ghost.coil" >/dev/null 2>&1
[ -e "$T/ghost.coil" ] && bad "fmt --write must not fabricate a file" "it created one" \
                        || ok  "fmt --write does not fabricate a file"

echo "== flags are position-independent, unknown ones are errors =="
expect_rc 7 "build: flags BEFORE the file"               "$COIL" run "$T/seven.coil"
"$COIL" build -o "$T/a" "$T/seven.coil" >/dev/null 2>&1 && "$T/a"; rc=$?
[ "$rc" = 7 ] && ok "build -o <out> <file> (Unix order)" || bad "build -o <out> <file>" "rc=$rc"
[ ! -e "$T/a.o" ] && ok "build leaves only the requested executable" \
                    || bad "build leaves no adjacent object" "$T/a.o exists"
expect_rc 1 "unknown flag is rejected"                   "$COIL" build "$T/seven.coil" -o "$T/b" --frobnicate
expect_out "unknown flag" "unknown flag is named"        "$COIL" build "$T/seven.coil" -o "$T/b" --frobnicate
rm -rf "$T/default-build"
mkdir -p "$T/default-build"
( cd "$T/default-build" && "$COIL" build "$T/seven.coil" >/dev/null 2>&1 )
[ -x "$T/default-build/build/release/seven" ] && "$T/default-build/build/release/seven"; rc=$?
[ "$rc" = 7 ] && ok "build defaults to build/release/<source-stem>" \
              || bad "default build output" "missing or returned rc=$rc"
[ ! -e "$T/default-build/build/release/seven.o" ] && ok "default build leaves no object artifact" \
  || bad "default build leaves no object artifact" "build/release/seven.o exists"
( cd "$T/default-build" && "$COIL" build "$T/seven.coil" --debug >/dev/null 2>&1 )
[ -x "$T/default-build/build/debug/seven" ] \
  && ok "--debug selects build/debug/<source-stem>" \
  || bad "--debug output profile" "no build/debug/seven"
# Both the ordinary return path and the linker-failure path must remove the
# private object directory.
#
# The sections of this gate run CONCURRENTLY (gate-cli-parallel.py), so a snapshot
# of the global glob races: another section's in-flight link legitimately appears
# between the two `find`s and looks like a leak. Wait for the set to come back to
# what our own builds left -- a real leak never drains, a concurrent link does.
printf '(defn helper [] (-> i64) 1)\n' > "$T/no-main.coil"
find /tmp -maxdepth 1 -name 'coil-link-*' -print 2>/dev/null | sort > "$T/link-tmp-before"
"$COIL" build "$T/seven.coil" -o "$T/link-clean-success" >/dev/null 2>&1
"$COIL" build "$T/no-main.coil" -o "$T/no-main" >/dev/null 2>&1 || true
# The window has to outlast a concurrent COMPILER build, not just a link: the
# heaviest sections here compile whole programs, and their link directory is live
# for as long as that takes. 60s is far past any of them and still far short of
# hanging the gate on a genuine leak.
link_leak=1
for _ in $(seq 60); do
  find /tmp -maxdepth 1 -name 'coil-link-*' -print 2>/dev/null | sort > "$T/link-tmp-after"
  # Only directories that are NEW since the snapshot count; anything that was
  # already there belongs to someone else.
  if [ -z "$(comm -13 "$T/link-tmp-before" "$T/link-tmp-after")" ]; then link_leak=0; break; fi
  sleep 1
done
[ "$link_leak" = 0 ] \
  && ok "successful and failed links leave no temporary object directory" \
  || bad "link temporary cleanup" "new /tmp/coil-link-* directory remains: $(comm -13 "$T/link-tmp-before" "$T/link-tmp-after" | tr '\n' ' ')"
expect_rc 1 "bogus --target is rejected"                 "$COIL" build "$T/seven.coil" -o "$T/c" --target not-a-real-triple

echo "== check mode: typecheck/compile with no object (diag-12) =="
# `build -o /dev/null` USED to SIGABRT with a bare 'LLVMTargetMachineEmitToFile ...
# Operation not permitted' (exit 134) because /dev is unwritable. It now routes to the
# compile-check path: full front-end, no object emitted, real exit codes. FAILS on the
# seed (SIGABRT 134, and no `check` command at all).
printf '(defn main [] (-> i64) (bad-fn 3))\n' > "$T/broken.coil"
expect_rc 0 "build -o /dev/null on a good program exits 0 (was SIGABRT 134)"  "$COIL" build "$T/seven.coil"  -o /dev/null
expect_rc 1 "build -o /dev/null on a broken program exits 1"                  "$COIL" build "$T/broken.coil" -o /dev/null
expect_out "undefined function 'bad-fn'" "build -o /dev/null reports a LOCATED error, not an LLVM abort" \
  "$COIL" build "$T/broken.coil" -o /dev/null
expect_rc 0 "check: a good program exits 0"              "$COIL" check "$T/seven.coil"
expect_rc 1 "check: a broken program exits 1"            "$COIL" check "$T/broken.coil"
expect_out "undefined function 'bad-fn'" "check names the located error"      "$COIL" check "$T/broken.coil"
# check emits NO object: the .o path must not appear.
"$COIL" check "$T/seven.coil" >/dev/null 2>&1

echo "== checked/mono dumps run the expanded frontend and propagate failure =="
expect_rc 0 "dump-checked expands bundled block labels" "$COIL" dump-checked "$T/seven.coil"
expect_rc 0 "dump-mono expands bundled block labels"    "$COIL" dump-mono "$T/seven.coil"
printf '(defn main [] (-> i64) (bad-fn 3))\n' > "$T/broken.coil"
expect_out "undefined function 'bad-fn'" "dump-checked reports the real diagnostic" \
  "$COIL" dump-checked "$T/broken.coil"
printf '(defn main [] (-> i64) (bad-fn 3))\n' > "$T/broken.coil"
expect_rc 1 "dump-checked returns failure for invalid input" "$COIL" dump-checked "$T/broken.coil"
printf '(defn main [] (-> i64) (bad-fn 3))\n' > "$T/broken.coil"
expect_rc 1 "dump-mono returns failure for invalid input"    "$COIL" dump-mono "$T/broken.coil"

echo "== metaprogram closure scope and reachability regressions =="
for f in bug-nested-dispatch.coil bug-direct-dispatch.coil bug-derived-fn-invisible.coil; do
  "$COIL" check "tests/repro/impl-body-scope/$f" >/dev/null 2>&1 \
    && ok "impl body sees generated declarations and same-module impls: $f" \
    || bad "impl body sees generated declarations and same-module impls: $f" "check failed"
done
"$COIL" emit-ir tests/repro/sigbus-emit-ir-singleton-cycle/crash.coil >/dev/null 2>&1 \
  && ok "an unreachable singleton cycle is not pulled into the macro engine (LLVM)" \
  || bad "an unreachable singleton cycle is not pulled into the macro engine (LLVM)" "emit-ir failed or crashed"
if [ "$HOST_OS" = Darwin ] && [ "$HOST_ARCH" = arm64 ]; then
  "$COIL" build tests/repro/sigbus-emit-ir-singleton-cycle/crash.coil -o "$T/singleton-cycle" --backend arm64 >/dev/null 2>&1 \
    && ok "an unreachable singleton cycle is not pulled into the macro engine (arm64)" \
    || bad "an unreachable singleton cycle is not pulled into the macro engine (arm64)" "arm64 build failed or crashed"
fi
[ ! -e "$T/seven.o" ] && ok "check writes no object file" || bad "check writes no object" "$T/seven.o exists"

echo "== malformed LLVM modules fail cleanly and preserve output =="
cat > "$T/invalid-module.coil" <<'EOF'
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
printf sentinel > "$T/invalid-module.o"
expect_rc 1 "LLVM verifier failure exits 1" \
  "$COIL" emit-obj "$T/invalid-module.coil" -o "$T/invalid-module.o"
expect_out "LLVM module verification failed after lowering" \
  "LLVM verifier failure has a readable diagnostic" \
  "$COIL" emit-obj "$T/invalid-module.coil" -o "$T/invalid-module.o"
[ "$(cat "$T/invalid-module.o")" = sentinel ] \
  && ok "failed object emission preserves an existing destination" \
  || bad "failed object emission preserves an existing destination" "destination was replaced or truncated"
[ ! -e "$T/invalid-module.o.tmp" ] \
  && ok "failed object emission leaves no temporary artifact" \
  || bad "failed object emission leaves no temporary artifact" "$T/invalid-module.o.tmp exists"

# A genuinely non-writable -o is a CLEAR error + exit 1, not a SIGABRT.
# The read-only directory has to exist on THIS host: /System is macOS's, and on
# Linux there is no /System at all, so the old spelling exercised nothing here.
UNWRITABLE=$([ "$HOST_OS" = Linux ] && echo /proc/nope || echo /System/nope)
expect_rc 1 "build -o into a read-only location is a clear error, not SIGABRT" \
  "$COIL" build "$T/seven.coil" -o "$UNWRITABLE"
# ...and the object writer's own message, from the subcommand that actually writes
# one where you point it. `build` stages its object in a temp directory and only
# copies out at the end, so an unwritable -o fails there in the LINK; `emit-obj`
# writes the object straight to the path, which is what this diagnostic is for.
expect_out "could not write object file" "non-writable -o names the path + a remedy" \
  "$COIL" emit-obj "$T/seven.coil" -o "$UNWRITABLE.o"
expect_out "usage: coil check" "check --help documents itself"                "$COIL" check --help

echo "== fmt formats EVERY file it is given =="
out=$("$COIL" fmt --check "$T/messy1.coil" "$T/messy2.coil" 2>&1)
n=$(echo "$out" | grep -c "not formatted")
[ "$n" = 2 ] && ok "fmt --check reports both files" || bad "fmt --check multi-file" "named $n of 2: $out"
expect_rc 2 "fmt on a directory is an error"             "$COIL" fmt "$T"

printf '(defn piped [] (-> i64)    1)\n' | "$COIL" fmt - > "$T/fmt-stdin.got"
printf '(defn piped [] (-> i64)\n  1)\n' > "$T/fmt-stdin.want"
cmp -s "$T/fmt-stdin.want" "$T/fmt-stdin.got" \
  && ok "fmt reads piped standard input when no file is named" \
  || bad "fmt reads piped standard input" "$(diff -u "$T/fmt-stdin.want" "$T/fmt-stdin.got")"
printf '(defn check [] (-> i64)    1)\n' | "$COIL" fmt --check - >/dev/null 2>&1
[ "$?" = 1 ] && ok "fmt --check reports unformatted standard input" \
  || bad "fmt --check reports unformatted standard input" "wrong exit status"
printf '(defn no-write [] (-> i64) 1)\n' | "$COIL" fmt --write - >/dev/null 2>&1
[ "$?" = 2 ] && ok "fmt --write rejects standard input" \
  || bad "fmt --write rejects standard input" "wrong exit status"

printf '(defn width [] (-> bool) (or (= 1 1) (= 2 2) (= 3 3) (= 4 4) (= 5 5)))\n' \
  | "$COIL" fmt --width 40 - > "$T/fmt-width.got"
grep -q '^      (= 2 2)$' "$T/fmt-width.got" \
  && ok "fmt --width controls stdin layout" \
  || bad "fmt --width controls stdin layout" "$(cat "$T/fmt-width.got")"
expect_rc 2 "fmt --width rejects zero" "$COIL" fmt --width 0 "$T/seven.coil"
expect_rc 2 "fmt --width requires a value" "$COIL" fmt "$T/seven.coil" --width

"$COIL" fmt tests/compiler/formatter_vertical_spacing_input.coil > "$T/vertical-spacing.got"
cmp -s tests/compiler/formatter_vertical_spacing_expected.coil "$T/vertical-spacing.got" \
  && ok "fmt canonicalizes top-level spacing and keeps leading comments attached" \
  || bad "fmt top-level vertical spacing" "$(diff -u tests/compiler/formatter_vertical_spacing_expected.coil "$T/vertical-spacing.got")"
expect_rc 0 "standalone formatter entry typechecks" \
  "$COIL" check src/compiler/formatter/fmt.coil

mkdir -p "$T/stage0-bin"
ln -s "$COIL" "$T/stage0-bin/coil"
stage0_source=$(
  unset STAGE0 STAGE0_SOURCE COIL_FORCE_WASM_STAGE0
  PATH="$T/stage0-bin:/usr/bin:/bin"
  . scripts/compiler/select-stage0.sh
  select_stage0 "$T/no-native-seed" "$T/seven.coil" arm64
  echo "$STAGE0_SOURCE"
)
[ "$stage0_source" = installed ] \
  && ok "stage0 selection tries a compatible installed coil before WASM" \
  || bad "installed stage0 fallback" "selected '$stage0_source' instead of installed"

echo "== per-subcommand help =="
for c in build run install fmt new emit-ir; do
  expect_out "usage: coil $c" "$c --help"                "$COIL" "$c" --help
done

echo "== project mode honors flags =="
mkdir -p "$T/proj/src"
printf '[package]\nname  = "proj"\nentry = "src/main.coil"\n' > "$T/proj/Coil.toml"
printf '(module app)\n(defn main [] (-> i64) 3)\n'            > "$T/proj/src/main.coil"
( cd "$T/proj" && "$COIL" build >/dev/null 2>&1 )
[ -x "$T/proj/build/release/proj" ] && ok "project build defaults to build/release/<package>" \
                                       || bad "project build" "no ./build/release/proj"
( cd "$T/proj" && "$COIL" run >/dev/null 2>&1 ); [ $? = 3 ] && ok "project run propagates exit code" \
                                                            || bad "project run" "want 3"
# the headline case: --target wasm32 used to print `wrote proj`, exit 0, and emit a Mach-O
( cd "$T/proj" && rm -f build/release/proj && "$COIL" build --target wasm32-unknown-unknown >/dev/null 2>&1 )
if file "$T/proj/build/release/proj" 2>/dev/null | grep -q WebAssembly; then
  ok "project --target wasm32 emits WebAssembly"
else
  bad "project --target wasm32" "got: $(file "$T/proj/build/release/proj" 2>/dev/null | sed 's/.*: //')"
fi
( cd "$T/proj" && "$COIL" build --debug >/dev/null 2>&1 )
[ -x "$T/proj/build/debug/proj" ] && ok "project --debug selects build/debug" \
  || bad "project --debug profile" "no ./build/debug/proj"
( cd "$T/proj" && rm -f proj && "$COIL" build -o "$T/proj/elsewhere" >/dev/null 2>&1 )
[ -x "$T/proj/elsewhere" ] && ok "project -o is honored" || bad "project -o" "not written"
( cd "$T/proj" && "$COIL" build --target not-a-real-triple >/dev/null 2>&1 )
[ $? = 1 ] && ok "project bogus --target is rejected" || bad "project bogus --target" "want rc=1"

mkdir -p "$T/install-root"
out=$( cd "$T/proj" && "$COIL" install --root "$T/install-root" 2>&1 ); rc=$?
[ "$rc" = 0 ] && [ -x "$T/install-root/bin/proj" ] \
  && ok "install builds the package into the requested user-wide root" \
  || bad "install --root" "rc=$rc output=$out"
"$T/install-root/bin/proj" >/dev/null 2>&1; [ $? = 3 ] \
  && ok "the installed package executable runs" \
  || bad "installed executable" "want rc=3"
case "$out" in
  *"installed proj -> $T/install-root/bin/proj"*) ok "install reports the installed command path" ;;
  *) bad "install report" "got: $out" ;;
esac
rm -rf "$T/install-root"
( cd "$T/proj" && COIL_INSTALL_ROOT="$T/install-root" "$COIL" install >/dev/null 2>&1 )
[ -x "$T/install-root/bin/proj" ] \
  && ok "COIL_INSTALL_ROOT selects the install prefix" \
  || bad "COIL_INSTALL_ROOT" "missing $T/install-root/bin/proj"

echo "== Coil.toml dependencies and strict manifest errors =="
# Dependency roots participate in the namespace index; Git dependencies are checked
# out at an exact SHA.
mkdir -p "$T/dep-lib/src" "$T/path-dep/src" "$T/git-dep/src"
printf '(module math)\n(defn answer [] (-> i64) 42)\n' > "$T/dep-lib/src/math.coil"
printf '(module app)\n(import "math" :use *)\n(defn main [] (-> i64) (answer))\n' > "$T/path-dep/src/main.coil"
printf '[package]\nname = "path-dep"\nentry = "src/main.coil"\n\n[dependencies]\nmath = { path = "../dep-lib" }\n' > "$T/path-dep/Coil.toml"
( cd "$T/path-dep" && "$COIL" run >/dev/null 2>&1 ); [ $? = 42 ] \
  && ok "path dependency imports through its declared namespace" \
  || bad "path dependency" "want rc=42"

# The root manifest can replace the entire ambient library universe. The selected
# prelude is an ordinary dependency module: it is indexed through the declared
# dependency root, auto-referred in every loaded module, and gets no bundled-path
# privilege of its own.
mkdir -p "$T/platform/src" "$T/no-stdlib/src"
printf '(module platform.prelude)\n(defn platform-answer [] (-> i64) 42)\n' > "$T/platform/src/prelude.coil"
printf '(module app)\n(defn main [] (-> i64) (platform-answer))\n' > "$T/no-stdlib/src/main.coil"
printf '[package]\nname = "no-stdlib"\nentry = "src/main.coil"\n\n[language]\nstdlib = false\nprelude = "platform.prelude"\n\n[dependencies]\nplatform = { path = "../platform" }\n' > "$T/no-stdlib/Coil.toml"
( cd "$T/no-stdlib" && "$COIL" run >/dev/null 2>&1 ); [ $? = 42 ] \
  && ok "stdlib=false auto-refers an ordinary dependency-module prelude" \
  || bad "replacement prelude" "want rc=42"

# A reachable dependency is loaded by the same LS and therefore cannot recover
# the compiler bundle. This is the transitive-universe guarantee, not a spelling
# ban: an explicitly supplied dependency would still be allowed to own that name.
printf '(module platform.bad)\n(import "coil.os" :as os)\n(defn bad [] (-> i64) 0)\n' > "$T/platform/src/bad.coil"
printf '(module app)\n(import "platform.bad" :use *)\n(defn main [] (-> i64) (bad))\n' > "$T/no-stdlib/src/main.coil"
out=$( cd "$T/no-stdlib" && "$COIL" check 2>&1 ); rc=$?
case "$out" in
  *"namespace 'coil.os' was not found in the no-stdlib compilation universe"*) universe_diag=1 ;;
  *) universe_diag=0 ;;
esac
[ "$rc" = 1 ] && [ "$universe_diag" = 1 ] \
  && ok "a transitive dependency cannot recover a bundled stdlib namespace" \
  || bad "sealed transitive universe" "want located no-stdlib lookup failure, got rc=$rc: $out"

# Restore the positive entry before checking the manifest's two invalid states.
printf '(module app)\n(defn main [] (-> i64) (platform-answer))\n' > "$T/no-stdlib/src/main.coil"
printf '[package]\nname = "no-stdlib"\nentry = "src/main.coil"\n\n[language]\nstdlib = false\n' > "$T/no-stdlib/Coil.toml"
expect_out "stdlib = false requires prelude" \
  "stdlib=false requires an explicit replacement prelude" \
  sh -c "cd '$T/no-stdlib' && '$COIL' check"
printf '[package]\nname = "no-stdlib"\nentry = "src/main.coil"\n\n[language]\nprelude = "platform.prelude"\n' > "$T/no-stdlib/Coil.toml"
expect_out "prelude requires stdlib = false" \
  "a replacement prelude cannot coexist with the bundled universe" \
  sh -c "cd '$T/no-stdlib' && '$COIL' check"

( cd "$T/dep-lib" && git init -q && git add src/math.coil \
    && git -c user.name=Coil -c user.email=coil@example.invalid commit -qm initial )
dep_sha=$(git -C "$T/dep-lib" rev-parse HEAD)
printf '(module app)\n(import "math" :use *)\n(defn main [] (-> i64) (answer))\n' > "$T/git-dep/src/main.coil"
printf '[package]\nname = "git-dep"\nentry = "src/main.coil"\n\n[dependencies]\nmath = { git = "%s", sha = "%s" }\n' "$T/dep-lib" "$dep_sha" > "$T/git-dep/Coil.toml"
( cd "$T/git-dep" && "$COIL" run >/dev/null 2>&1 ); [ $? = 42 ] \
  && ok "Git dependency imports at its pinned SHA" \
  || bad "Git dependency" "want rc=42"
[ "$(find "$T/git-dep/.coil/deps" -mindepth 1 -maxdepth 1 -type d -name "*-$dep_sha" | wc -l | tr -d ' ')" = 1 ] \
  && ok "Git dependency is cached by repository and SHA" \
  || bad "Git dependency cache" "missing pinned checkout"

# A Git subdir is a package boundary: consume its Coil.toml roots, module map,
# exclusions, transitive Coil dependency, and native flags. Two aliases selecting
# different packages at one repository/SHA must still materialize one checkout.
mkdir -p "$T/mono/packages/core/lib" "$T/mono/packages/core/mapped" \
         "$T/mono/packages/extra/src" "$T/mono/packages/support/src" \
         "$T/subdir-app/src"
printf '(module mono.core)\n(defn core-answer [] (-> i64) 20)\n' > "$T/mono/packages/core/lib/core.coil"
printf '(module mono.hidden)\n(defn hidden [] (-> i64) 99)\n' > "$T/mono/packages/core/lib/hidden.coil"
printf '(module ignored.sibling)\n(defn sibling [] (-> i64) 99)\n' > "$T/mono/sibling.coil"
printf '(module placeholder)\n(defn mapped-answer [] (-> i64) 1)\n' > "$T/mono/packages/core/mapped/value.coil"
printf '(module mono.extra)\n(defn extra-answer [] (-> i64) 20)\n' > "$T/mono/packages/extra/src/extra.coil"
printf '(module mono.support)\n(defn support-answer [] (-> i64) 1)\n' > "$T/mono/packages/support/src/support.coil"
printf '#!/bin/sh\nprintf -- "-lm\\n"\n' > "$T/mono/packages/core/native-flags"
chmod +x "$T/mono/packages/core/native-flags"
cat > "$T/mono/packages/core/Coil.toml" <<'EOF'
[package]
name = "core"
source-roots = ["lib"]
exclude = ["lib/hidden.coil"]

[dependencies]
support = { path = "../support" }

[native-dependencies]
math = { flags-command = "./native-flags" }

[modules]
"mono.mapped" = "mapped/value.coil"
EOF
printf '[package]\nname = "extra"\nsource-roots = ["src"]\n' > "$T/mono/packages/extra/Coil.toml"
printf '[package]\nname = "support"\nsource-roots = ["src"]\n' > "$T/mono/packages/support/Coil.toml"
( cd "$T/mono" && git init -q && git add . \
    && git -c user.name=Coil -c user.email=coil@example.invalid commit -qm initial )
mono_sha=$(git -C "$T/mono" rev-parse HEAD)
git -C "$T/mono" tag v1
git -C "$T/mono" branch stable
cat > "$T/subdir-app/src/main.coil" <<'EOF'
(module app)
(import "mono.core" :use *)
(import "mono.extra" :use *)
(import "mono.support" :use *)
(import "mono.mapped" :use *)
(defn main [] (-> i64)
  (+ (core-answer) (+ (extra-answer) (+ (support-answer) (mapped-answer)))))
EOF
printf '[package]\nname = "subdir-app"\nentry = "src/main.coil"\n\n[dependencies]\ncore = { git = "%s", sha = "%s", subdir = "packages/core" }\nextra = { git = "%s", sha = "%s", subdir = "packages/extra" }\n' \
  "$T/mono" "$mono_sha" "$T/mono" "$mono_sha" > "$T/subdir-app/Coil.toml"
( cd "$T/subdir-app" && "$COIL" run >/dev/null 2>&1 ); [ $? = 42 ] \
  && ok "Git subdirs consume package manifests and compose transitive/native requirements" \
  || bad "Git subdir package" "want rc=42"
[ "$(find "$T/subdir-app/.coil/deps" -mindepth 1 -maxdepth 1 -type d -name "*-$mono_sha" | wc -l | tr -d ' ')" = 1 ] \
  && ok "different Git subdirs at one repository/SHA share a checkout" \
  || bad "Git subdir shared cache" "wanted exactly one checkout"

printf '[package]\nname = "subdir-app"\nentry = "src/main.coil"\n\n[dependencies]\ncore = { git = "%s", tag = "v1", subdir = "packages/core" }\nextra = { git = "%s", branch = "stable", subdir = "packages/extra" }\n' \
  "$T/mono" "$T/mono" > "$T/subdir-app/Coil.toml"
( cd "$T/subdir-app" && "$COIL" run >/dev/null 2>&1 ); [ $? = 42 ] \
  && ok "Git dependency tags and branches resolve before selecting subdir packages" \
  || bad "Git tag/branch dependency" "want rc=42"
[ "$(find "$T/subdir-app/.coil/deps" -mindepth 1 -maxdepth 1 -type d -name "*-$mono_sha" | wc -l | tr -d ' ')" = 1 ] \
  && ok "tag, branch, and SHA selectors resolving to one commit share a checkout" \
  || bad "Git selector shared cache" "wanted exactly one checkout"

printf '[package]\nname = "bad-subdir"\nentry = "src/main.coil"\n\n[dependencies]\nbad = { git = "%s", sha = "%s", subdir = "../escape" }\n' \
  "$T/mono" "$mono_sha" > "$T/subdir-app/Coil.toml"
expect_out "subdir must be a relative path that does not escape the checkout" \
  "Git dependency subdir rejects checkout escape" \
  sh -c "cd '$T/subdir-app' && '$COIL' check"

# The reader remains strict: unknown sections/keys and malformed dependency specs
# are located hard errors rather than silent no-ops.
mkdir -p "$T/strict/src"
printf '(module app)\n(defn main [] (-> i64) 3)\n' > "$T/strict/src/main.coil"
# typo'd section
printf '[package]\nname  = "s"\nentry = "src/main.coil"\n\n[dependecies]\nfoo = "../foo"\n' > "$T/strict/Coil.toml"
( cd "$T/strict" && "$COIL" build >/dev/null 2>&1 ); [ $? = 1 ] \
  && ok "a typo'd manifest section is rejected" \
  || bad "strict section" "want rc=1"
out=$( cd "$T/strict" && "$COIL" build 2>&1 )
echo "$out" | grep -qE "Coil.toml:5: unknown section \[dependecies\]" \
  && ok "…and the error is located at the section line" \
  || bad "strict section location" "got: $out"
# Libraries can claim a manifest namespace without teaching Coil the keys inside
# it. Validation is deferred until the entire file has been read, so the provider
# declaration may appear before or after the custom section.
printf '[package]\nname = "s"\nentry = "src/main.coil"\n\n[c.raylib]\nsources = ["raylib.c"]\n\n[manifest.providers]\nc = "example.c-reader"\n' > "$T/strict/Coil.toml"
( cd "$T/strict" && rm -f build/release/s && "$COIL" build >/dev/null 2>&1 )
[ -x "$T/strict/build/release/s" ] \
  && ok "a registered provider owns arbitrary sections beneath its namespace" \
  || bad "custom manifest provider" "project did not build"
printf '[package]\nname = "s"\nentry = "src/main.coil"\n\n[c.raylib]\nsources = ["raylib.c"]\n' > "$T/strict/Coil.toml"
out=$( cd "$T/strict" && "$COIL" build 2>&1 ); rc=$?
[ "$rc" = 1 ] && echo "$out" | grep -qE "Coil.toml:5: unknown section \[c.raylib\].*register its root under \[manifest.providers\]" \
  && ok "an unclaimed custom manifest section remains a located error" \
  || bad "unclaimed custom manifest section" "got rc=$rc: $out"
# typo'd key `entrypoint`
printf '[package]\nname  = "s"\nentrypoint = "src/main.coil"\n' > "$T/strict/Coil.toml"
out=$( cd "$T/strict" && "$COIL" build 2>&1 ); rc=$?
[ "$rc" = 1 ] && ok "a typo'd key (entrypoint) is rejected (was: swallowed)" \
              || bad "strict typo key" "want rc=1 got rc=$rc: $out"
echo "$out" | grep -qE "Coil.toml:3: unknown key 'entrypoint' in \[package\]" \
  && ok "…and the error names the key + section + line" \
  || bad "strict typo key location" "got: $out"
# Git source without an immutable pin
printf '[package]\nname = "s"\nentry = "src/main.coil"\n\n[dependencies]\nfoo = { git = "https://example.invalid/foo.git" }\n' > "$T/strict/Coil.toml"
out=$( cd "$T/strict" && "$COIL" build 2>&1 ); rc=$?
[ "$rc" = 1 ] && echo "$out" | grep -qE "Coil.toml:6: dependency must specify either path, or git together with exactly one of sha, tag, or branch" \
  && ok "a Git dependency requires exactly one commit selector" \
  || bad "Git dependency without SHA" "got rc=$rc: $out"
# a valid manifest still builds
printf '[package]\nname  = "s"\nentry = "src/main.coil"\n' > "$T/strict/Coil.toml"
( cd "$T/strict" && rm -f build/release/s && "$COIL" build >/dev/null 2>&1 )
[ -x "$T/strict/build/release/s" ] && ok "a valid manifest still builds" || bad "strict valid manifest" "no ./build/release/s"

# Native libraries that do not ship pkg-config metadata can expose their linker
# argv through their own config tool. The command is manifest-owned and its stdout
# is split into the same link tokens pkg-config would have supplied.
mkdir -p "$T/native-flags-command/src"
printf '(module app)\n(defn main [] (-> i64) 0)\n' > "$T/native-flags-command/src/main.coil"
printf '#!/bin/sh\nprintf -- "-lm\\n"\n' > "$T/native-flags-command/native-flags"
chmod +x "$T/native-flags-command/native-flags"
printf '[package]\nname = "native-flags-command"\nentry = "src/main.coil"\n\n[native-dependencies]\nmath = { flags-command = "./native-flags" }\n' > "$T/native-flags-command/Coil.toml"
( cd "$T/native-flags-command" && "$COIL" build >/dev/null 2>&1 )
[ -x "$T/native-flags-command/build/release/native-flags-command" ] \
  && ok "native dependency linker flags can come from a config command" \
  || bad "native flags-command" "project did not build"

printf '[package]\nname = "s"\nentry = "src/main.coil"\n\n[native-dependencies]\nbad = { pkg-config = "zlib", flags-command = "./flags" }\n' > "$T/strict/Coil.toml"
expect_out "exactly one of pkg-config or flags-command" \
  "native dependencies reject ambiguous providers" \
  sh -c "cd '$T/strict' && '$COIL' build"

echo "== workspace roots own package namespaces and forward commands =="
mkdir -p "$T/workspace/members/app" "$T/workspace/members/util"
cat > "$T/workspace/Coil.toml" <<'EOF'
[workspace]
name = "demo"
members = ["members/*"]
EOF
cat > "$T/workspace/members/app/Coil.toml" <<'EOF'
[package]
name = "app"
entry = "main.coil"
EOF
cat > "$T/workspace/members/app/main.coil" <<'EOF'
(module demo.app.main)
(import "demo.util.math" :use [answer])
(defn main [] (-> i64)
  (let [legacy \-]
    (if (= legacy legacy) (answer) 0)))
EOF
cat > "$T/workspace/members/util/Coil.toml" <<'EOF'
[package]
name = "util"
EOF
cat > "$T/workspace/members/util/math.coil" <<'EOF'
(module demo.util.math)
(export answer)
(defn answer [] (-> i64) 42)
EOF
( cd "$T/workspace" && "$COIL" lint --fix >/dev/null 2>&1 ) \
  && grep -q '#\\-' "$T/workspace/members/app/main.coil" \
  && ok "workspace lint forwards --fix to executable members" \
  || bad "workspace lint --fix" "command failed or member source was not fixed"
( cd "$T/workspace" && "$COIL" check >/dev/null 2>&1 ) \
  && ok "workspace check resolves cross-member imports" \
  || bad "workspace check" "cross-member package graph did not check"
( cd "$T/workspace" && "$COIL" build >/dev/null 2>&1 ) \
  && [ -x "$T/workspace/members/app/build/release/app" ] \
  && ok "workspace build fans out over executable members" \
  || bad "workspace build" "member executable was not produced"

echo "== manifest secondary Coil artifacts =="
mkdir -p "$T/secondary-artifact/src/runtime"
cat > "$T/secondary-artifact/Coil.toml" <<'EOF'
[package]
name = "secondary-artifact"
entry = "src/main.coil"

[artifacts.runtime]
kind = "object"
entry = "src/runtime/runtime.coil"
out = "build/release/runtime.o"
EOF
cat > "$T/secondary-artifact/src/main.coil" <<'EOF'
(defn main [] (-> i64) 0)
EOF
cat > "$T/secondary-artifact/src/runtime/runtime.coil" <<'EOF'
(module secondary.runtime)
(export-c [runtime-answer :as "runtime_answer"])
(defn runtime-answer [] (-> i64) 42)
EOF
secondary_symbols=""
( cd "$T/secondary-artifact" && "$COIL" build >/dev/null 2>&1 ) \
  && [ -x "$T/secondary-artifact/build/release/secondary-artifact" ] \
  && [ -f "$T/secondary-artifact/build/release/runtime.o" ] \
  && secondary_symbols=$(nm "$T/secondary-artifact/build/release/runtime.o")
case "$secondary_symbols" in
  *runtime_answer*) ok "bare project build emits declared Coil object artifacts" ;;
  *) bad "secondary Coil artifact" "executable, object, or exported runtime symbol missing" ;;
esac

mkdir -p "$T/secondary-explicit/src/runtime"
cp "$T/secondary-artifact/Coil.toml" "$T/secondary-explicit/Coil.toml"
cp "$T/secondary-artifact/src/main.coil" "$T/secondary-explicit/src/main.coil"
cp "$T/secondary-artifact/src/runtime/runtime.coil" "$T/secondary-explicit/src/runtime/runtime.coil"
( cd "$T/secondary-explicit" && "$COIL" build src/main.coil -o explicit-main >/dev/null 2>&1 ) \
  && [ -x "$T/secondary-explicit/explicit-main" ] \
  && [ ! -e "$T/secondary-explicit/build/release/runtime.o" ] \
  && ok "explicit-file build does not emit manifest secondary artifacts" \
  || bad "explicit-file secondary artifact selection" "secondary object was emitted or main build failed"

sed 's/kind = "object"/kind = "archive"/' "$T/secondary-artifact/Coil.toml" \
  > "$T/secondary-artifact/Coil.bad.toml"
mv "$T/secondary-artifact/Coil.toml" "$T/secondary-artifact/Coil.good.toml"
mv "$T/secondary-artifact/Coil.bad.toml" "$T/secondary-artifact/Coil.toml"
expect_out 'artifact kind must be "object"' "unsupported secondary artifact kinds are rejected" \
  sh -c "cd '$T/secondary-artifact' && '$COIL' build"

echo "== namespace index: file placement is irrelevant and paths are rejected =="
mkdir -p "$T/sib/src/unrelated/place"
printf '[package]\nname  = "sib"\nentry = "src/main.coil"\n'                             > "$T/sib/Coil.toml"
printf '(module util)\n(defn forty-two [] (-> i64) 42)\n' > "$T/sib/src/unrelated/place/anything.coil"
printf '(module app)\n(import "util" :use *)\n(defn main [] (-> i64) (forty-two))\n' > "$T/sib/src/main.coil"
( cd "$T/sib" && "$COIL" run >/dev/null 2>&1 ); [ $? = 42 ] \
  && ok "project imports a namespace regardless of its file placement" \
  || bad "namespace index (project mode)" "want rc=42"
# Direct-file mode indexes both the process directory and the entry tree.
( cd "$T" && "$COIL" run "$T/sib/src/main.coil" >/dev/null 2>&1 ); [ $? = 42 ] \
  && ok "namespace lookup works from an unrelated cwd" \
  || bad "namespace index (arbitrary cwd)" "want rc=42"
# Once project mode supplies explicit roots, a temporary/synthetic entry does not
# expand the namespace boundary to its containing directory. Besides preventing
# accidental imports, this keeps lint's /tmp/coil-project-lint-root-*.coil from
# recursively indexing all of /tmp and retaining tens of gigabytes of paths.
mkdir -p "$T/configured-root" "$T/outside-entry"
printf '(module leaked)\n(defn value [] (-> i64) 42)\n' > "$T/outside-entry/leaked.coil"
printf '(module configured-boundary)\n(import "leaked" :use *)\n(defn main [] (-> i64) (value))\n' \
  > "$T/outside-entry/main.coil"
out=$(COIL_NAMESPACE_ROOTS="$T/configured-root" "$COIL" check "$T/outside-entry/main.coil" 2>&1)
rc=$?
case "$out" in *"namespace 'leaked' was not found"*) missing_leaked=1;; *) missing_leaked=0;; esac
[ "$rc" = 1 ] && [ "$missing_leaked" = 1 ] \
  && ok "configured namespace roots do not absorb a temporary entry directory" \
  || bad "configured namespace boundary" "got rc=$rc: $out"
printf '(module bad)\n(import "unrelated/place/anything.coil" :use *)\n(defn main [] (-> i64) 0)\n' > "$T/sib/src/bad.coil"
expect_out 'import paths are not supported' "relative path imports are rejected" \
  "$COIL" check "$T/sib/src/bad.coil"
# Preflight lint runs before loading/typechecking, but --fix is transactional: if a
# separate semantic error remains, even the valid import migration is rolled back.
printf '(module migrate)\n(import "unrelated/place/anything.coil" :use *)\n(defn main [] (-> i64) missing-name)\n' > "$T/sib/src/migrate.coil"
"$COIL" lint "$T/sib/src/migrate.coil" --fix >/dev/null 2>&1
grep -q '(import "unrelated/place/anything.coil" :use \*)' "$T/sib/src/migrate.coil" \
  && ok "lint --fix rolls back a preflight import migration when semantic checking fails" \
  || bad "transactional preflight migration" "broken file was left partially rewritten"
# Namespace-owner migrations are one transaction too: add missing aliases alongside
# the rewritten calls, otherwise the retry fails resolution and rolls everything back.
printf '(module owner-migrate)\n(defn main [] (-> i64) (let [p (stack i64)] (store! p (ior 40 2)) (load p)))\n' \
  > "$T/sib/src/owner-migrate.coil"
"$COIL" lint "$T/sib/src/owner-migrate.coil" --fix >/dev/null 2>&1
grep -q '(import "coil.primitive" :as primitive)' "$T/sib/src/owner-migrate.coil" \
  && grep -q '(primitive/alloc-stack i64)' "$T/sib/src/owner-migrate.coil" \
  && grep -q '(primitive/ior 40 2)' "$T/sib/src/owner-migrate.coil" \
  && ok "lint --fix adds missing owner imports with primitive/allocation rewrites" \
  || bad "owner import migration" "missing import or qualified replacement"
expect_rc 42 "owner-import migration still runs" "$COIL" run "$T/sib/src/owner-migrate.coil"

# A macro closure must carry only the extern declarations its reachable bodies use.
# Keeping every project extern made the in-memory metaprogram object advertise unrelated
# undefined symbols, so merely declaring an FFI function could make the bundled
# dbg-slice-get macro fail during project lint's post-fix validation.
mkdir -p "$T/lint-extern-closure/src"
printf '[package]\nname = "lint-extern-closure"\nentry = "src/main.coil"\n' \
  > "$T/lint-extern-closure/Coil.toml"
printf '(module lint-extern-closure.main)\n(extern unreachable_native_symbol :cc c [] (-> i64))\n(defn main [] (-> i64) (ior 40 2))\n' \
  > "$T/lint-extern-closure/src/main.coil"
( cd "$T/lint-extern-closure" && "$COIL" lint --fix >/dev/null 2>&1 ) \
  && grep -q '(primitive/ior 40 2)' "$T/lint-extern-closure/src/main.coil" \
  && ok "project lint excludes unreachable externs from macro-engine closures" \
  || bad "project lint extern closure" "an unrelated native declaration poisoned post-fix validation"

# A package entry may live beside Coil.toml rather than under conventional src/.
# It is still project-owned source and bare `coil lint` must not silently skip it.
mkdir -p "$T/lint-root-entry"
printf '[package]\nname = "lint-root-entry"\nentry = "main.coil"\n' \
  > "$T/lint-root-entry/Coil.toml"
printf '(module lint-root-entry)\n(defn main [] (-> i64) (ior 40 2))\n' \
  > "$T/lint-root-entry/main.coil"
( cd "$T/lint-root-entry" && "$COIL" lint --fix >/dev/null 2>&1 ) \
  && grep -q '(primitive/ior 40 2)' "$T/lint-root-entry/main.coil" \
  && ok "project lint includes a package entry outside source roots" \
  || bad "project lint root entry" "entry = main.coil was silently skipped"

printf '(module owner-alias-migrate)\n(import "coil.alloc" :as memory)\n(import "coil.primitive" :as metal)\n(defn main [] (-> i64) (let [p (stack i64)] (store! p (ior 40 2)) (load p)))\n' \
  > "$T/sib/src/owner-alias-migrate.coil"
"$COIL" lint "$T/sib/src/owner-alias-migrate.coil" --fix >/dev/null 2>&1
grep -q '(metal/alloc-stack i64)' "$T/sib/src/owner-alias-migrate.coil" \
  && grep -q '(metal/ior 40 2)' "$T/sib/src/owner-alias-migrate.coil" \
  && [ "$(grep -c 'coil.alloc' "$T/sib/src/owner-alias-migrate.coil")" = 1 ] \
  && [ "$(grep -c 'coil.primitive' "$T/sib/src/owner-alias-migrate.coil")" = 1 ] \
  && ok "lint --fix reuses existing owner aliases without duplicate imports" \
  || bad "owner alias migration" "existing aliases were not reused"
# The PRELUDE + bundled libs are self-contained: their imports resolve to the BUNDLED
# stdlib, never to same-named decoys sitting in the entry file's directory. A naive
# file-relative switch made the prelude's control.coil->print->io chain resolve to
# src/examples/io.coil (a demo), silently dropping the io library from every build — the
# emit-ir change the prior attempt could not explain. `println` here comes only from
# the prelude, so it breaks if the chain loads the decoy instead of bundled io.
mkdir -p "$T/dec"
printf '(module control)\n(defn decoy [] (-> i64) 0)\n'           > "$T/dec/control.coil"
printf '(module io)\n(defn decoy [] (-> i64) 0)\n'                > "$T/dec/io.coil"
printf '(module app)\n(defn main [] (-> i64) (println "hi") 7)\n' > "$T/dec/main.coil"
( cd "$T/dec" && "$COIL" run "$T/dec/main.coil" >/dev/null 2>&1 ); [ $? = 7 ] \
  && ok "the prelude reaches the BUNDLED stdlib despite same-named decoys in the entry dir" \
  || bad "bundled prelude self-contained" "want rc=7 (println from bundled print/io, not the decoy)"

echo "== diag-10: (:use [name]) naming a symbol the module does NOT export is a located error =="
# util exports only `good`; `secret` is private. `(import … :use [secret])` used to be
# silently accepted (build succeeded, rc=0) — the bogus name evaporated instead of erroring.
# Now it is a located import-site error naming the importer, the symbol, and the target module.
# FAILS on the seed (which builds it clean, rc=0); PASSES here.
mkdir -p "$T/use"
printf '(module util)\n(export good)\n(defn good [] (-> i64) 42)\n(defn secret [] (-> i64) 99)\n' > "$T/use/util.coil"
printf '(module app)\n(import "util" :use [secret])\n(defn main [] (-> i64) 0)\n'              > "$T/use/nono.coil"
expect_rc  1 "a non-exported :use name is rejected (was: silently accepted)" "$COIL" build "$T/use/nono.coil" -o "$T/use/x"
expect_out "'secret', which module 'util' does not export" "…and the error names the symbol + module" \
  "$COIL" build "$T/use/nono.coil" -o "$T/use/x"
# and the legitimate exported name still builds
printf '(module app)\n(import "util" :use [good])\n(defn main [] (-> i64) (good))\n' > "$T/use/yes.coil"
expect_rc 42 "an exported :use name still resolves" "$COIL" run "$T/use/yes.coil"

echo "== constants have module-qualified identity =="
mkdir -p "$T/const-ns/src"
cat > "$T/const-ns/src/tcp.coil" <<'EOF'
(module constns.tcp)
(export SOCKET_ERROR_CLOSED own)
(const SOCKET_ERROR_CLOSED 20)
(defn own [] (-> i64) SOCKET_ERROR_CLOSED)
EOF
cat > "$T/const-ns/src/unix.coil" <<'EOF'
(module constns.unix)
(export SOCKET_ERROR_CLOSED own)
(const SOCKET_ERROR_CLOSED 22)
(defn own [] (-> i64) SOCKET_ERROR_CLOSED)
EOF
cat > "$T/const-ns/src/main.coil" <<'EOF'
(module constns.main)
(import "constns.tcp" :as tcp)
(import "constns.unix" :as unix)
(defn main [] (-> i64) (+ tcp/SOCKET_ERROR_CLOSED unix/SOCKET_ERROR_CLOSED))
EOF
expect_rc 42 "same-named constants in unrelated modules coexist and resolve qualified" \
  "$COIL" run "$T/const-ns/src/main.coil"

cat > "$T/const-ns/src/own-main.coil" <<'EOF'
(module constns.own-main)
(import "constns.tcp" :as tcp :use [own])
(import "constns.unix" :as unix)
(defn main [] (-> i64) (+ (own) (unix/own)))
EOF
expect_rc 42 "each defining module resolves its own same-named constant" \
  "$COIL" run "$T/const-ns/src/own-main.coil"

cat > "$T/const-ns/src/ambiguous.coil" <<'EOF'
(module constns.ambiguous)
(import "constns.tcp" :use *)
(import "constns.unix" :use *)
(defn main [] (-> i64) SOCKET_ERROR_CLOSED)
EOF
expect_out "'SOCKET_ERROR_CLOSED' is ambiguous" "same-named :use'd constants are ambiguous at the reference" \
  "$COIL" build "$T/const-ns/src/ambiguous.coil" -o "$T/const-ns/x"

cat > "$T/const-ns/src/duplicate.coil" <<'EOF'
(module constns.duplicate)
(const VALUE 1)
(const VALUE 2)
(defn main [] (-> i64) VALUE)
EOF
expect_out "const 'constns.duplicate.VALUE' defined more than once" "duplicate constants in one module still fail" \
  "$COIL" build "$T/const-ns/src/duplicate.coil" -o "$T/const-ns/x"

cat > "$T/const-ns/Coil.toml" <<'EOF'
[package]
name = "const-ns"
entry = "src/main.coil"
source-roots = ["src"]
exclude = ["src/ambiguous.coil", "src/duplicate.coil"]
EOF
( cd "$T/const-ns" && "$COIL" lint >/dev/null 2>&1 ) \
  && ok "project lint accepts unrelated modules with same-named constants" \
  || bad "project lint constant namespaces" "lint rejected the aggregate module graph"

echo "== a compile that cannot finish must SAY SO, not hang or crash =="
# Macro nontermination must identify the invocation instead of forcing a binary
# search over generated top-level forms.
macro_cycle="$PWD/tests/compiler/features/macro_expansion_cycle.coil"
out=$("$COIL" check "$macro_cycle" 2>&1); rc=$?
case "$out" in
  *"macro expansion cycle: \`macro-expansion-cycle.spin\` reproduced the identical invocation syntax"*) macro_cycle_msg=1 ;;
  *) macro_cycle_msg=0 ;;
esac
case "$out" in
  *"macro_expansion_cycle.coil:7:3"*) macro_cycle_loc=1 ;;
  *) macro_cycle_loc=0 ;;
esac
[ "$macro_cycle_msg" = 1 ] && [ "$macro_cycle_loc" = 1 ] && macro_cycle_diag=1 || macro_cycle_diag=0
[ "$rc" = 1 ] && [ "$macro_cycle_diag" = 1 ] \
  && ok "an identical macro expansion cycle stops immediately with macro + call site" \
  || bad "macro expansion cycle diagnostic" "rc=$rc: $out"
out=$("$COIL" check "$macro_cycle" --macro-expansion-limit 52 2>&1); rc=$?
case "$out" in
  *"budget exhausted while expanding"*"total expansions=53"*"chain depth=1"*) macro_budget_diag=1 ;;
  *) macro_budget_diag=0 ;;
esac
[ "$rc" = 1 ] && [ "$macro_budget_diag" = 1 ] \
  && ok "macro expansion budget reports macro, total count, and chain depth" \
  || bad "macro expansion budget diagnostic" "rc=$rc: $out"
out=$("$COIL" check "$macro_cycle" --trace-macro macro-expansion-cycle.spin 2>&1); rc=$?
case "$out" in
  *"macro-expand"*"macro=macro-expansion-cycle.spin"*) macro_trace_diag=1 ;;
  *) macro_trace_diag=0 ;;
esac
[ "$rc" = 1 ] && [ "$macro_trace_diag" = 1 ] \
  && ok "--trace-macro filters invocation tracing by qualified macro name" \
  || bad "targeted macro tracing" "rc=$rc: $out"
# These all used to die with zero output: no message, no location, nothing naming the
# construct — the worst possible failure for a mistake a typo can cause.
cat > "$T/runaway.coil" <<'EOF'
(module rw)
(defstruct Box [T] [(v T)])
(defn grow [T] [(x T)] (-> i64)
  (let [b (coil.primitive/alloc-stack (Box T))] (coil.primitive/store! (coil.primitive/field b v) x) (grow (coil.primitive/load b))))
(defn main [] (-> i64) (grow 1))
EOF
out=$(timeout 30 "$COIL" build "$T/runaway.coil" -o "$T/rw" 2>&1); rc=$?
[ "$rc" = 1 ] && ok "runaway monomorphization errors (was: infinite hang)" \
              || bad "runaway monomorphization" "rc=$rc (124=still hanging)"
echo "$out" | grep -q "never reaches a fixpoint" && ok "…and explains the growth" \
                                                 || bad "runaway message" "$(echo "$out" | head -1)"

# deep macro-generated nesting: `cond` expands to nested ifs, so 800 clauses — an
# ordinary bytecode dispatch table — is 800 levels deep, and used to segfault.
{
  printf '(module dp)\n(import "coil.control" :use *)\n(defn f [(x i64)] (-> i64) (cond '
  i=0; while [ $i -lt 800 ]; do printf '(coil.primitive/icmp-eq x %d) %d ' $i $i; i=$((i+1)); done
  printf -- '-1))\n(defn main [] (-> i64) (f 5))\n'
} > "$T/deep.coil"
expect_rc 5 "an 800-clause cond builds and runs (was: SIGSEGV)" "$COIL" run "$T/deep.coil"

# `expand` and the debug dump-* commands run the SAME recursive front-end as `build`
# (reader/parser/loader), so they must share build's 512 MiB pipeline thread — running
# them on the 8 MiB MAIN thread segfaults on deeply nested input that `build` survives.
# Route: driver-main -> run-dump-on-big-stack -> run-on-big-stack (see driver.coil).
# 40000-deep raw nesting overflows an 8 MiB stack in the reader/parser but fits 512 MiB.
{
  printf '(module dp)\n(defn main [] (-> i64)\n  '
  printf '(+ 1 %.0s' $(seq 40000); printf '0'; printf ')%.0s' $(seq 40000); printf ')\n'
} > "$T/deepnest.coil"
expect_rc 0 "dump-read on 40000-deep nesting (was: 8 MiB main-stack SIGSEGV)"  "$COIL" dump-read "$T/deepnest.coil"
expect_rc 0 "dump-ast  on 40000-deep nesting (was: 8 MiB main-stack SIGSEGV)"  "$COIL" dump-ast  "$T/deepnest.coil"

echo "== independent mistakes are reported in ONE pass, across phases =="
# resolve used to abort on its first error, so a batch of mistakes surfaced one
# recompile at a time — and the one that survived was the span-less resolve error.
cat > "$T/multi.coil" <<'EOF'
(module m)
(defn f [(a i64)] (-> i64) a)
(defn g [] (-> i64) (f 1.5))
(defn h [] (-> i64) (f 1 2))
(defn i2 [] (-> i64) (nosuchfn 3))
(defn j [] (-> i64) (f "x"))
(defn main [] (-> i64) 0)
EOF
out=$("$COIL" build "$T/multi.coil" -o "$T/x" 2>&1)
echo "$out" | grep -q "4 errors" && ok "4 independent errors in one pass (1 resolve + 3 type)" \
                                 || bad "multi-error report" "no '4 errors': $(echo "$out" | tail -1)"
# a resolve error with NO type errors must still fail the build, not reach codegen
cat > "$T/resonly.coil" <<'EOF'
(module m)
(defn ok [(x i64)] (-> i64) (+ x 1))
(defn bad [] (-> i64) (nosuchfn 3))
(defn main [] (-> i64) (ok 5))
EOF
expect_rc 1 "a resolve-only error still fails the build" "$COIL" build "$T/resonly.coil" -o "$T/x"

echo "== trait bounds on type params are resolved and enforced =="
# unknown trait in a bound: error at the DEFINITION (was: accepted, or mis-blamed at the call)
printf '(module m)\n(defn f [(T NoSuchTrait)] [(x T)] (-> i64) 0)\n(defn main [] (-> i64) 0)\n' > "$T/badtrait.coil"
expect_rc 1 "unknown trait in a bound is rejected" "$COIL" build "$T/badtrait.coil" -o "$T/x"
expect_out "unknown trait" "…and named" "$COIL" build "$T/badtrait.coil" -o "$T/x"
# defstruct bound ENFORCED at instantiation (was: silently ignored)
printf '(module m)\n(defstruct Box [(T Eq)] [(v T)])\n(defn u [] (-> i64) (let [b (coil.primitive/alloc-stack (Box f64))] 0))\n(defn main [] (-> i64) (u))\n' > "$T/structbound.coil"
expect_rc 1 "defstruct bound enforced ((Box f64), f64 has no Eq)" "$COIL" build "$T/structbound.coil" -o "$T/x"
# defsum now PARSES a bound (was: 'expected symbol') and enforces it
printf '(module m)\n(defsum Opt [(T Eq)] (Non) (Som [(v T)]))\n(defn u [] (-> i64) (let [o (coil.primitive/alloc-stack (Opt f64))] 0))\n(defn main [] (-> i64) (u))\n' > "$T/sumbound.coil"
expect_rc 1 "defsum bound parses + enforced" "$COIL" build "$T/sumbound.coil" -o "$T/x"
# and the valid instantiations still compile
printf '(module m)\n(defstruct Box [(T Eq)] [(v T)])\n(defn main [] (-> i64) (let [b (coil.primitive/alloc-stack (Box i64))] (coil.primitive/store! (coil.primitive/field b v) 7) 0))\n' > "$T/okbound.coil"
expect_rc 0 "a satisfied bound ((Box i64)) still compiles" "$COIL" build "$T/okbound.coil" -o "$T/x"
# trait-names: EVERY bound position (defn/defstruct/defsum/impl) resolves the trait name
# through ONE shared helper, so an unknown trait errors IDENTICALLY. The impl trait was the
# odd one out — resolved leniently, then caught late in the checker as "impl: unknown trait"
# (no "in bound"). The seed emits that divergent message → FAILS the shared-text assertion.
printf '(module m)\n(deftrait A [Self] (go [(x Self)] (-> i64)))\n(impl NoSuchTrait i64 (go [(x i64)] (-> i64) 1))\n(defn main [] (-> i64) 0)\n' > "$T/impltrait.coil"
expect_rc 1 "impl over an unknown trait is rejected" "$COIL" build "$T/impltrait.coil" -o "$T/x"
expect_out "unknown trait 'NoSuchTrait' in bound" "impl trait resolves through the shared bound helper (was: 'impl: unknown trait')" "$COIL" build "$T/impltrait.coil" -o "$T/x"
# and impling a name that IS declared but ISN'T a trait (a plain fn) errors the SAME way
printf '(module m)\n(defn Helper [] (-> i64) 0)\n(impl Helper i64 (go [(x i64)] (-> i64) 1))\n(defn main [] (-> i64) 0)\n' > "$T/implnonfn.coil"
expect_out "unknown trait 'Helper' in bound" "impl over a non-trait name errors identically" "$COIL" build "$T/implnonfn.coil" -o "$T/x"

echo "== Callable values use typed, static impl dispatch =="
cat > "$T/anonymous-fn.coil" <<'EOF'
(module anonymous-fn)
(defn main [] (-> i64)
  (fold (fn [total value] (+ total value))
        0
        (map (fn [x] (+ x 2)) (range 0 10))))
EOF
expect_rc 65 "non-capturing anonymous fn infers through Callable bounds" "$COIL" run "$T/anonymous-fn.coil"

cat > "$T/anonymous-fn-capture.coil" <<'EOF'
(module anonymous-fn-capture)
(defn main [] (-> i64)
  (let [offset 2]
    (count (map (fn [x] (+ x offset)) (range 0 10)))))
EOF
expect_out "anonymous fn cannot capture local 'offset'.*pass it as an explicit parameter or use coil.closure/defclosure" \
  "anonymous fn rejects captures with an actionable diagnostic" \
  "$COIL" check "$T/anonymous-fn-capture.coil"

cat > "$T/callable.coil" <<'EOF'
(module m)
(defstruct Vec3 [(x i64) (y i64) (z i64)])
(defn get [(v Vec3) (i i64)] (-> i64)
  (if (= i 0) (load (field v x)) (if (= i 1) (load (field v y)) (load (field v z)))))
(impl Callable Vec3
  (call [(self Vec3) (i i64)] (-> i64) (get self i)))
(defstruct Box [T] [(value T)])
(impl [T] Callable (Box T)
  (call [(self (Box T))] (-> T) (load (field self value))))
(defn main [] (-> i64)
  (let [v (Vec3 :x 10 :y 20 :z 30) b (Box :value 12)] (- (v 2) (b))))
EOF
expect_rc 18 "concrete and generic Callable values run with their declared arities" "$COIL" run "$T/callable.coil"

cat > "$T/callable-arity.coil" <<'EOF'
(module m)
(defstruct F [(unused i64)])
(impl Callable F (call [(self F) (x i64)] (-> i64) x))
(defn main [] (-> i64) (let [f (F :unused 0)] (f)))
EOF
expect_out "expects 2 args, got 1" "Callable arity includes the statically supplied receiver" "$COIL" check "$T/callable-arity.coil"

cat > "$T/not-callable.coil" <<'EOF'
(module m)
(defstruct Plain [(x i64)])
(defn main [] (-> i64) (let [p (Plain :x 1)] (p 2)))
EOF
expect_out "is not callable" "calling a value without a call implementation is rejected" "$COIL" check "$T/not-callable.coil"

cat > "$T/bad-callable-impl.coil" <<'EOF'
(module m)
(defstruct F [(unused i64)])
(impl Callable F (call [(not-self i64)] (-> i64) not-self))
(defn main [] (-> i64) 0)
EOF
expect_out "'call' first parameter must be the implementing type" "Callable validates its receiver parameter" "$COIL" check "$T/bad-callable-impl.coil"

expect_rc 23 "closure values are callable and a typed code-pointer update changes later calls" \
  "$COIL" run tests/compiler/features/callable_closure_reload.coil
expect_rc 0 "Var forwards typed calls of several arities and observes code-pointer updates" \
  "$COIL" run tests/compiler/features/callable_var_reload.coil

echo "== store! yields unit (std-12): effect-only stores type-check without a wrapping do =="
# was: `store!` took the STORED VALUE's type, so `(if c (coil.primitive/store! p ptr) 0)` was a type error
# (then=(ptr i64) vs else=i64) and every non-i64 effect-only store needed `(do (coil.primitive/store! …) 0)`.
# Now store! is unit (canonical i64 0): the bare form checks, and the store still happens.
# FAILS on the seed (branch-type error, build exits 1); PASSES here (runs, returns 7).
cat > "$T/std12.coil" <<'EOF'
(module m)
(defn main [] (-> i64)
  (let [n (coil.primitive/alloc-stack i64) pp (coil.primitive/alloc-stack (ptr i64))]
    (coil.primitive/store! n 7)
    (if (coil.primitive/icmp-eq 1 1) (coil.primitive/store! pp n) 0)   ; stores a (ptr i64); store! yields unit i64 0
    (coil.primitive/load (coil.primitive/load pp))))
EOF
expect_rc 7 "a bare effect-only (if c (coil.primitive/store! p ptr) 0) builds+runs (was: branch-type error)" "$COIL" run "$T/std12.coil"

echo "== type ascription (: value type) supplies a stranded type arg + enforces it (gen-9) =="
# was: a local could not be annotated, so a generic value whose type argument only the
# RETURN position could fix — e.g. (Okk 5), where the error type E is undetermined —
# could not be bound in a let ("cannot infer type argument 'E'"), and `(: …)` itself was
# a parse error ("expected a symbol head, got :"). Now `(: value type)` checks `value`
# against `type`, flowing the expected type IN. FAILS on the seed (parse error → run ≠ 5);
# PASSES here (runs, returns 5 — the payload of (Okk 5)).
cat > "$T/gen9.coil" <<'EOF'
(module m)
(defsum Res [T E] (Okk [(v T)]) (Errr [(e E)]))
(defn via-let [] (-> (Res i64 bool))
  (let [r (: (Okk 5) (Res i64 bool))] r))
(defn main [] (-> i64) (match (via-let) (Okk [v] v) (Errr [e] 0)))
EOF
expect_rc 5 "ascription supplies a let binding's stranded type arg (was: parse error)" "$COIL" run "$T/gen9.coil"
# and inference now flows across the let on its OWN: when the let's tail is the binding
# and the let has an expected type, the binding's value is checked against it — so the
# bare `(let [r (Okk 5)] r)` needs no annotation. FAILS on the seed ("cannot infer type
# argument 'E'"), PASSES here (returns 5).
cat > "$T/gen9auto.coil" <<'EOF'
(module m)
(defsum Res [T E] (Okk [(v T)]) (Errr [(e E)]))
(defn via-let [] (-> (Res i64 bool))
  (let [r (Okk 5)] r))
(defn main [] (-> i64) (match (via-let) (Okk [v] v) (Errr [e] 0)))
EOF
expect_rc 5 "inference flows the return type into a returned let binding (was: 'cannot infer E')" "$COIL" run "$T/gen9auto.coil"
# and it TYPE-CHECKS, it is NOT a silent cast: a value whose type is not the ascribed one
# is rejected with a located error naming both types.
printf '(module m)\n(defn main [] (-> i64) (: true i64))\n' > "$T/gen9bad.coil"
expect_rc 1 "ascription rejects a mismatched value (not a numeric cast)" "$COIL" build "$T/gen9bad.coil" -o "$T/x"
expect_out "has type bool but expected i64" "…naming both the actual and ascribed type" "$COIL" build "$T/gen9bad.coil" -o "$T/x"

echo "== qualified trait-method calls (A::go) recover a same-name collision (gen-6) =="
# was: two traits declaring the same method name were an UNFIXABLE collision — `(go x)`
# errored "ambiguous / none in scope" and there was no syntax to pick one. Now a
# `Trait::method` head pins dispatch to the named trait. FAILS on the seed ('A::go' is a
# call to an undefined function → rc=1), PASSES here (dispatches to A's impl → 111).
cat > "$T/gen6.coil" <<'EOF'
(deftrait A [Self] (go [(x Self)] (-> i64)))
(deftrait B [Self] (go [(x Self)] (-> i64)))
(impl A i64 (go [(x i64)] (-> i64) 111))
(impl B i64 (go [(x i64)] (-> i64) 222))
(defn main [] (-> i64) (A::go 5))
EOF
expect_rc 111 "A::go selects trait A's impl (was: undefined function 'A::go')" "$COIL" run "$T/gen6.coil"
sed 's/(A::go 5)/(B::go 5)/' "$T/gen6.coil" > "$T/gen6b.coil"
expect_rc 222 "B::go selects trait B's impl" "$COIL" run "$T/gen6b.coil"
# an unknown qualifier/method is a located trait-method error, not a bare undefined-function
printf '(deftrait A [Self] (go [(x Self)] (-> i64)))\n(impl A i64 (go [(x i64)] (-> i64) 1))\n(defn main [] (-> i64) (A::nope 5))\n' > "$T/gen6bad.coil"
expect_out "names no trait method 'nope'" "A::nope is a located trait-method error" "$COIL" build "$T/gen6bad.coil" -o "$T/x"
# the collision error stops recommending `:use` (useless when the traits are your own) and
# points at the qualified escape hatch instead. FAILS on the seed (its message says `:use`).
cat > "$T/gen6col.coil" <<'EOF'
(module app)
(deftrait A [Self] (go [(x Self)] (-> i64)))
(deftrait B [Self] (go [(x Self)] (-> i64)))
(impl A i64 (go [(x i64)] (-> i64) 111))
(impl B i64 (go [(x i64)] (-> i64) 222))
(defn main [] (-> i64) (go 5))
EOF
expect_out "call it qualified" "a collision error advertises Trait::method, not :use" "$COIL" build "$T/gen6col.coil" -o "$T/x"

echo "== inherent methods: receiver dispatch + Type::associated calls =="
# Struct constructor, bare immutable/mutable receivers, sum/enum receiver,
# generic impl, scalar/pointer/slice extensions, an imported type extension, and
# specialization, qualified receiver calls, and coexistence with same-named
# trait dispatch. Result = 223.
expect_rc 223 "nominal/generic/structural extension methods dispatch and run" \
  "$COIL" run tests/compiler/oracle/cli/fixtures/inherent-methods.coil

# Receiverless associated functions cannot infer an owner and must be qualified.
cat > "$T/inherent_bare_assoc.coil" <<'EOF'
(module app)
(defstruct Box [(v i64)])
(impl Box (new [(v i64)] (-> Box) (let [p (coil.primitive/alloc-stack Box)] (coil.primitive/store! (coil.primitive/field p v) v) (coil.primitive/load p))))
(defn main [] (-> i64) (let [b (new 1)] (coil.primitive/load (coil.primitive/field b v))))
EOF
expect_out "undefined function 'new'" "a receiverless associated function requires Type::name" \
  "$COIL" build "$T/inherent_bare_assoc.coil" -o "$T/x"

cat > "$T/inherent_dup.coil" <<'EOF'
(module app)
(defstruct P [(x i64)])
(impl P
  (x [(p P)] (-> i64) 1)
  (x [(p P)] (-> i64) 2))
(defn main [] (-> i64) 0)
EOF
expect_out "duplicate inherent method 'x'" "duplicate inherent methods are rejected" \
  "$COIL" build "$T/inherent_dup.coil" -o "$T/x"
expect_out "duplicate inherent method 'remote-mark'" "duplicate imported extensions are rejected" \
  "$COIL" build tests/compiler/oracle/cli/fixtures/inherent-duplicate-imports.coil -o "$T/x"

cat > "$T/inherent_ambiguous.coil" <<'EOF'
(module app)
(defstruct Pair [A B] [(a A) (b B)])
(impl [B] (Pair i64 B) (mark [(p (Pair i64 B))] (-> i64) 1))
(impl [A] (Pair A bool) (mark [(p (Pair A bool))] (-> i64) 2))
(defn main [] (-> i64) (mark (coil.primitive/zeroed (Pair i64 bool))))
EOF
expect_out "ambiguous inherent method 'mark'" "unordered extension overlap is rejected at use" \
  "$COIL" build "$T/inherent_ambiguous.coil" -o "$T/x"

echo "== coil.core macros are ambient without an import =="
printf '(module app)\n(defn main [] (-> i64) (cond false 1 :else 9))\n' > "$T/core_cond.coil"
expect_rc 9 "cond is owned by coil.core and available by default" "$COIL" run "$T/core_cond.coil"

echo "== supertraits: (deftrait D [Self] :requires [Base] …) (gen-8) =="
# was: supertraits and associated-type params shared the ONE `[Self …]` vector, so a
# supertrait written there was silently accepted as an extra type parameter, and there
# was no way to say "every impl of D must also impl Base". Now `:requires [Base …]` is a
# SEPARATE clause the checker ENFORCES. FAILS on the seed (`:requires` is unknown there,
# so the keyword parses as a bad trait method → build error), PASSES here (runs → 11).
cat > "$T/super_ok.coil" <<'EOF'
(module app)
(deftrait Animal [Self] (legs [(x Self)] (-> i64)))
(deftrait Pet [Self] :requires [Animal] (name [(x Self)] (-> i64)))
(defstruct Dog [(n i64)])
(impl Animal Dog (legs [(x Dog)] (-> i64) 4))
(impl Pet Dog (name [(x Dog)] (-> i64) 7))
(defn main [] (-> i64) (let [d (coil.primitive/alloc-stack Dog)] (coil.primitive/iadd (Animal::legs (coil.primitive/load d)) (Pet::name (coil.primitive/load d)))))
EOF
expect_rc 11 "a :requires supertrait builds+runs when the base is impl'd (was: parse error)" "$COIL" run "$T/super_ok.coil"
# the supertrait is ENFORCED: impl Pet without impl Animal is a located error naming the
# base. Both the seed and this build exit 1 here, so the TEETH is the message: the seed
# fails to PARSE `:requires` ("trait method must be…"), this build names the supertrait.
cat > "$T/super_missing.coil" <<'EOF'
(module app)
(deftrait Animal [Self] (legs [(x Self)] (-> i64)))
(deftrait Pet [Self] :requires [Animal] (name [(x Self)] (-> i64)))
(defstruct Dog [(n i64)])
(impl Pet Dog (name [(x Dog)] (-> i64) 7))
(defn main [] (-> i64) 0)
EOF
expect_rc 1 "impl Pet without impl Animal is rejected" "$COIL" build "$T/super_missing.coil" -o "$T/x"
expect_out "supertrait 'app.Animal'" "…and the error names the missing supertrait" "$COIL" build "$T/super_missing.coil" -o "$T/x"
# the OLD ambiguous form — a supertrait smuggled into the `[Self …]` vector — is now a
# located error pointing at `:requires` (was: silently an associated-type parameter, so
# the seed builds it clean, rc=0). The extra param NAMES a trait, which is the tell.
cat > "$T/super_ambig.coil" <<'EOF'
(module app)
(deftrait Animal [Self] (legs [(x Self)] (-> i64)))
(deftrait Pet [Self Animal] (name [(x Self)] (-> i64)))
(defn main [] (-> i64) 0)
EOF
expect_rc 1 "a trait name in the [Self …] vector is rejected" "$COIL" build "$T/super_ambig.coil" -o "$T/x"
expect_out "if you meant a supertrait" "…and the error points at :requires" "$COIL" build "$T/super_ambig.coil" -o "$T/x"
# a genuine associated-type parameter (NOT a trait name) is still fine — the guard only
# fires on names that actually resolve to a trait, so `[Self K E]` (à la Get) still works.
printf '(module app)\n(deftrait Grab [Self K E] (grab [(x Self) (k K)] (-> E)))\n(defn main [] (-> i64) 0)\n' > "$T/super_assoc.coil"
expect_rc 0 "associated-type params [Self K E] still parse (not mistaken for supertraits)" "$COIL" build "$T/super_assoc.coil" -o "$T/x"

echo "== parameterized traits are usable as bounds; extra params are associated types (gen-1) =="
# was: a bound over a PARAMETERIZED trait (Get/Set/Push/Pop or any [Self …] trait) was a
# hard error — "trait 'Pop' takes type parameters — bounds over parameterized traits aren't
# supported yet" — so there was NO generic code over any collection. Now the non-Self params
# are ASSOCIATED TYPES determined by the impl (one impl per type): the bounded body checks
# against them, and mono resolves each to the impl's concrete type. FAILS on the seed (build
# exits 1, "aren't supported yet"), PASSES here.
# Pop is (deftrait Pop [Self E] (pop! [(xs (mut Self))] (-> (Option E)))); E is return-only.
cat > "$T/gen1pop.coil" <<'EOF'
(module app)
(import "coil.arraylist" :use *)
(import "coil.alloc" :use *)
(import "coil.result" :use *)
(defn drain-count [(C Pop)] [(xs (mut C))] (-> i64)
  (let [(mut n) 0]
    (loop (match (pop! (mut xs)) (None [] (break)) (Some [v] (coil.primitive/store! n (+ (coil.primitive/load n) 1)))))
    (coil.primitive/load n)))
(defn main [] (-> i64)
  (let [a (malloc-allocator) (mut xs) (al-new [i64] a)]
    (al-push! (mut xs) 10) (al-push! (mut xs) 20) (al-push! (mut xs) 30)
    (drain-count (mut xs))))
EOF
expect_rc 3 "Pop used as a bound drains a concrete ArrayList (was: 'aren't supported yet')" "$COIL" run "$T/gen1pop.coil"
# a user's own parameterized trait, two impls, associated element type read off each impl
cat > "$T/gen1custom.coil" <<'EOF'
(module app)
(import "coil.result" :use *)
(deftrait Container [Self Elem]
  (head [(c Self)] (-> (Option Elem)))
  (size [(c Self)] (-> i64)))
(defstruct IntBox [(v i64)])
(impl Container IntBox (head [(c IntBox)] (-> (Option i64)) (Some (coil.primitive/load (coil.primitive/field c v)))) (size [(c IntBox)] (-> i64) 1))
(defstruct Empty [(x i64)])
(impl Container Empty (head [(c Empty)] (-> (Option i64)) (None)) (size [(c Empty)] (-> i64) 0))
(defn describe [(C Container)] [(c C)] (-> i64)
  (match (head c) (Some [v] (+ 100 (size c))) (None [] (size c))))
(defn main [] (-> i64)
  (let [b (coil.primitive/alloc-stack IntBox) e (coil.primitive/alloc-stack Empty)]
    (coil.primitive/store! (coil.primitive/field b v) 7) (coil.primitive/store! (coil.primitive/field e x) 0)
    (+ (describe (coil.primitive/load b)) (describe (coil.primitive/load e)))))
EOF
expect_rc 101 "a user parameterized trait as a bound dispatches per-impl (IntBox=101, Empty=0)" "$COIL" run "$T/gen1custom.coil"
# calling a parameterized method on an UNBOUNDED type param is a located definition-time error
printf '(module m)\n(import "coil.result" :use *)\n(deftrait Box2 [Self E] (peek [(c Self)] (-> (Option E))))\n(defn bad [T] [(x T)] (-> i64) (match (peek x) (Some [v] 1) (None [] 0)))\n(defn main [] (-> i64) 0)\n' > "$T/gen1unb.coil"
expect_out "'T' is not bounded by 'm.Box2'" "an unbounded param calling a parameterized method is located" "$COIL" build "$T/gen1unb.coil" -o "$T/x"
# an associated type in ARGUMENT position (a Get key, not return) renders readably in the
# mismatch — `<C as Get>::K`, not the internal mangling. The seed can't reach this message
# (it errors "aren't supported yet" first), so this is the teeth.
printf '(module app)\n(import "coil.arraylist" :use *)\n(defn first-elem [(C Get)] [(xs C)] (-> i64) (get xs 0))\n(defn main [] (-> i64) 0)\n' > "$T/gen1assoc.coil"
expect_out "expected <C as Get>::K" "an associated type renders as <C as Trait>::Param in diagnostics" "$COIL" build "$T/gen1assoc.coil" -o "$T/x"
# Explicit associated-type constraints connect a generic's callback/value types to
# the selected impl, participate in inference, and reject a different Item at use.
cat > "$T/gen1explicit.coil" <<'EOF'
(module app)
(import "coil.iter" :as lazy)
(defn first-i64 [(I (Iterator i64))] [(source I)] (-> i64)
  (let [(mut it) source] (match (next (mut it)) (Some [v] v) (None [] 0))))
(defn main [] (-> i64) (first-i64 (lazy/range 42 43)))
EOF
expect_rc 42 "an explicit Iterator<i64> associated bound dispatches and infers" "$COIL" run "$T/gen1explicit.coil"
cat > "$T/gen1explicit-bad.coil" <<'EOF'
(module app)
(defstruct BoolIter [(value bool)])
(impl Iterator BoolIter
  (next [(it (mut BoolIter))] (-> (Option bool)) (Some (.value it))))
(defn first-i64 [(I (Iterator i64))] [(source I)] (-> i64)
  (let [(mut it) source] (match (next (mut it)) (Some [v] v) (None [] 0))))
(defn main [] (-> i64) (first-i64 (BoolIter :value true)))
EOF
expect_out "associated type mismatch for 'Iterator': expected i64, got bool" "an explicit associated bound rejects a mismatched impl" "$COIL" check "$T/gen1explicit-bad.coil"

echo "== one Iterator/Iterable protocol: (for x (iter coll)); (in map) fixed (gen-1 · std-11 · std-4) =="
# was: iteration was four unrelated per-collection macros (slice-for/al-for/hm-for/for-in
# via len+get), there was NO Iterator trait, and `(for-in [k (in map)])` iterated GARBAGE —
# a map's `get` takes a KEY, so `(get m i)` by slot index is nonsense (std-4). Now one
# coil.core Iterator/Iterable protocol drives `(for x (iter coll))` uniformly over slices,
# lists and maps; a map yields its keys, so `(in map)` is correct.
# (for x (iter slice)) — the unified surface. FAILS on the seed (no protocol → rc≠20).
cat > "$T/it-slice.coil" <<'EOF'
(module app)
(import "coil.slice" :use *)
(import "coil.control" :use *)
(defn main [] (-> i64)
  (let [arr (coil.primitive/alloc-stack (array i64 4)) (mut s) 0]
    (coil.primitive/store! (coil.primitive/index arr 0) 2) (coil.primitive/store! (coil.primitive/index arr 1) 4) (coil.primitive/store! (coil.primitive/index arr 2) 6) (coil.primitive/store! (coil.primitive/index arr 3) 8)
    (for x (iter (slice-new (coil.primitive/index arr 0) 4)) (coil.primitive/store! s (coil.primitive/iadd (coil.primitive/load s) x)))
    (coil.primitive/load s)))
EOF
expect_rc 20 "(for x (iter slice)) drives the Iterator protocol (was: no such protocol)" "$COIL" run "$T/it-slice.coil"
# std-4: (for-in [k (in map)]) now iterates the map's KEYS correctly (was: get-by-index
# garbage → 'arithmetic on different types i64 vs (Option i64)' on the seed).
cat > "$T/it-map.coil" <<'EOF'
(module app)
(import "coil.hashmap" :use *)
(import "coil.alloc" :use *)
(import "coil.control" :use *)
(defn main [] (-> i64)
  (let [a (malloc-allocator) (mut hm) (hm-new-scalar [i64 i64] a) (mut ksum) 0]
    (hm-put! (mut hm) 40 1) (hm-put! (mut hm) 60 2)
    (for-in [k (in hm)] (coil.primitive/store! ksum (coil.primitive/iadd (coil.primitive/load ksum) k)))
    (coil.primitive/load ksum)))
EOF
expect_rc 100 "(in map) iterates the map's keys (std-4: was get-by-index garbage)" "$COIL" run "$T/it-map.coil"
# a generic bounded on the Iterator trait consumes ANY iterator (Item abstract) — the
# associated-type bound (gen-1) composing with the protocol. FAILS on the seed (rc≠3).
cat > "$T/it-generic.coil" <<'EOF'
(module app)
(import "coil.arraylist" :use *)
(import "coil.alloc" :use *)
(import "coil.control" :use *)
(defn count-iter [(I Iterator)] [(it (mut I))] (-> i64)
  (let [(mut n) 0]
    (loop (match (next (mut it)) (None [] (break)) (Some [x] (coil.primitive/store! n (coil.primitive/iadd (coil.primitive/load n) 1)))))
    (coil.primitive/load n)))
(defn main [] (-> i64)
  (let [a (malloc-allocator) (mut xs) (al-new [i64] a)]
    (al-push! (mut xs) 7) (al-push! (mut xs) 8) (al-push! (mut xs) 9)
    (let [(mut it) (iter xs)] (count-iter (mut it)))))
EOF
expect_rc 3 "a generic (I Iterator) consumes any iterator via the protocol" "$COIL" run "$T/it-generic.coil"
# the collapsed per-collection macros still work: slice-for/al-for now expand through the
# unified protocol (equivalent element iteration).
cat > "$T/it-alfor.coil" <<'EOF'
(module app)
(import "coil.arraylist" :use *)
(import "coil.alloc" :use *)
(import "coil.control" :use *)
(defn main [] (-> i64)
  (let [a (malloc-allocator) (mut xs) (al-new [i64] a) (mut s) 0]
    (al-push! (mut xs) 10) (al-push! (mut xs) 11) (al-push! (mut xs) 12)
    (al-for [v xs] (coil.primitive/store! s (coil.primitive/iadd (coil.primitive/load s) v)))
    (coil.primitive/load s)))
EOF
expect_rc 33 "al-for still iterates (now a thin alias over the Iterator protocol)" "$COIL" run "$T/it-alfor.coil"
# Lazy adapters consume every collection through Iterable/Iterator and allocate no
# intermediate collection. Range is an ordinary lazy Iterable, not a for-macro case.
cat > "$T/it-lazy.coil" <<'EOF'
(module app)
(defn even? [(x i64)] (-> bool) (= (% x 2) 0))
(defn add [(a i64) (b i64)] (-> i64) (+ a b))
(defn main [] (-> i64)
  (fold (coil.primitive/fnptr-of add)
        0
        (take 3 (filter (coil.primitive/fnptr-of even?) (range 0 100)))))
EOF
expect_rc 6 "ambient range/filter/take/fold compose lazily through the iterator traits" "$COIL" run "$T/it-lazy.coil"

echo "== (coil.primitive/target-arch) reflects --target, not a hardcoded host constant =="
# was: the constant "aarch64" — so a macro branching on it baked the host branch into a
# cross-compiled wasm build, silently.
cat > "$T/tgt.coil" <<'EOF'
(module t)
(defn arch [] (-> Code)
  (if (coil.primitive/code-eq (coil.primitive/target-arch) `wasm32) `1 (if (coil.primitive/code-eq (coil.primitive/target-arch) `aarch64) `2 `3)))
(defn main [] (-> i64) (arch))
EOF
expect_out "i64\) 2" "target-arch = aarch64 on the host"          "$COIL" expand "$T/tgt.coil"
expect_out "i64\) 1" "target-arch = wasm32 under --target wasm32" "$COIL" expand "$T/tgt.coil" --target wasm32-unknown-unknown
expect_out "i64\) 3" "target-arch = x86_64 under --target x86_64" "$COIL" expand "$T/tgt.coil" --target x86_64-apple-macosx11.0.0

echo "== cross-compiling a native non-host target LINKS (passes -arch), not rejected =="
# Was: a native cross-target (`--target x86_64-apple-macosx11.0.0`) emitted a correct
# x86_64 object then linked it with the host arm64 `cc`, dying with
# `found architecture 'x86_64', required arm64`. The seed's stopgap merely REJECTED it.
# Now build-cmd passes `-arch <arch>` to the link step, so macOS cc cross-links every
# slice its SDK carries — the build succeeds and produces a real x86_64 executable.
# (xcompile). This FAILS on the seed (rc 1, no output file) and PASSES here.
if [ "$HOST_OS" = Darwin ]; then
  out=$("$COIL" build "$T/seven.coil" -o "$T/xseven" --target x86_64-apple-macosx11.0.0 2>&1); rc=$?
  if [ "$rc" = 0 ] && file "$T/xseven" 2>/dev/null | grep -q "x86_64"; then
    ok "cross-target build links an x86_64 Mach-O executable"
  else
    bad "cross-target build" "rc=$rc, file=$(file "$T/xseven" 2>/dev/null): $(echo "$out" | head -1)"
  fi
else
  echo "  (skip: cross-linking a Mach-O slice needs the macOS toolchain host)"
fi

echo "== object emission on the DEFAULT (LLVM) backend =="
# Nothing else covers this: the full snapshot gate stops at emit-ir, and the runtime gate only
# exercises --backend arm64. So `:shim` — a naked trampoline, i.e. INLINE ASM, and the
# language's headline calling-convention-as-a-type feature — silently could not build on
# the default backend at all (LLVM aborts without an AsmParser). A committed example
# (src/examples/shim.coil) failed to build and no gate noticed.
if [ "$HOST_OS" = Darwin ]; then
  # emit-obj promises one relocatable artifact, so it deliberately stays on the
  # serial one-object path even when ordinary executable builds use partitions.
  parallel_link_out=$("$COIL" emit-obj "$T/seven.coil" -o "$T/seven-parallel.o" 2>&1); rc=$?
  case "$parallel_link_out" in
    *"unexpected dylib text stub file"*)
      bad "emit-obj excludes SDK dylibs" "$parallel_link_out" ;;
    *)
      if [ "$rc" = 0 ] && [ -s "$T/seven-parallel.o" ]; then
        ok "emit-obj preserves its single relocatable-object contract"
      else
        bad "emit-obj relocatable artifact" "rc=$rc: $parallel_link_out"
      fi ;;
  esac
fi
for e in src/examples/shim.coil src/examples/everything.coil; do
  out=$("$COIL" run "$e" 2>&1); rc=$?
  if [ "$HOST_ARCH" = arm64 ] || [ "$HOST_ARCH" = aarch64 ]; then
    [ "$rc" = 42 ] && ok "$e builds+runs on the LLVM backend (42)" \
                   || bad "$e on the LLVM backend" "rc=$rc: $(echo "$out" | head -1)"
  else
    # These examples declare arm64-register shim conventions; on an x86 host the
    # LLVM backend targets x86_64 and the per-arch diagnostic MUST fire (never a
    # silently-wrong build).
    if [ "$rc" != 0 ] && echo "$out" | grep -q "not a general-purpose register on the target architecture"; then
      ok "$e: arm64-register shim convention is a clear per-arch error on $HOST_ARCH"
    else
      bad "$e on $HOST_ARCH" "want the per-arch shim-convention error, got rc=$rc: $(echo "$out" | head -1)"
    fi
  fi
done

echo "== export-c on the arm64 backend (unblocks the LLVM-free compiled metaprogram engine) =="
# Was: the arm64 backend hard-errored "export-c is not supported by the arm64 backend yet"
# for ANY (export-c …), so main_a64 could register no metaprogram object builder and the
# LLVM-free compiler was stuck on the interpreter (mac-12). It is AAPCS64-native, so
# scalar/pointer params and struct RETURNS are emitted directly under the C symbol with
# external linkage — no thunk. A by-value STRUCT param is the one case that still needs a
# marshaling thunk: a clear hard error, never a silently-wrong symbol.
cat > "$T/expc.coil" <<'EOF'
(module shapes)
(defstruct Point [(x i64) (y i64)])
(defn clamp0 [(n i64)] (-> i64) (if (coil.primitive/icmp-lt n 0) 0 n))
(defn make-point [(x i64) (y i64)] (-> Point)
  (let [p (coil.primitive/alloc-stack Point)] (coil.primitive/store! (coil.primitive/field p x) (clamp0 x)) (coil.primitive/store! (coil.primitive/field p y) (clamp0 y)) (coil.primitive/load p)))
(defn add3 [(x i64) (y i64) (z i64)] (-> i64) (coil.primitive/iadd (coil.primitive/iadd x y) z))
(export-c [make-point :as "shapes_make_point"] [add3 :as "shapes_add3"])
EOF
if "$COIL" emit-obj "$T/expc.coil" -o "$T/expc.o" --backend arm64 >/dev/null 2>&1; then
  if [ "$HOST_OS" != Darwin ]; then
    # emit-obj produced the arm64 Mach-O object (host-independent codegen); linking
    # and executing it needs the macOS arm64 host.
    echo "  (skip: running the arm64 Mach-O object needs the macOS host — emit-obj itself succeeded)"
  else
  cat > "$T/expc_drv.c" <<'EOF'
#include <stdint.h>
typedef struct { int64_t x, y; } Point;
extern Point   shapes_make_point(int64_t, int64_t);
extern int64_t shapes_add3(int64_t, int64_t, int64_t);
int main(void){ Point p = shapes_make_point(3, -4);          /* (3,0) */
  return (int)(p.x + p.y + shapes_add3(10,20,30) - 63); }    /* 3 + 60 - 63 = 0 */
EOF
  if cc "$T/expc_drv.c" "$T/expc.o" -o "$T/expc_test" 2>/dev/null && "$T/expc_test"; then
    ok "export-c --backend arm64: scalar + struct-return callable from C (AAPCS64, no thunk)"
  else
    bad "export-c --backend arm64: C call" "the linked object did not return the expected value"
  fi
  fi
else
  bad "export-c --backend arm64: emit-obj rejected a thunk-free export" "seed hard-errors on all exports"
fi
# a by-value struct param is a clear located hard error (SIGABRT), naming the reason
printf '(module s)\n(defstruct P [(x i64)(y i64)])\n(defn d [(p P)] (-> i64) (coil.primitive/load (coil.primitive/field p x)))\n(export-c [d :as "s_d"])\n' > "$T/expc_bad.coil"
expect_out "by-value struct parameter isn't supported" \
  "export-c arm64: by-value struct param is a clear error, not a bad symbol" \
  "$COIL" emit-obj "$T/expc_bad.coil" -o "$T/expc_bad.o" --backend arm64

echo "== std-3: string HashMap keys are OWNED by default (copied on insert/freed on remove) =="
# Was: str-keyops stored the caller's (slice u8) fat pointer VERBATIM, so two keys built
# over one reused buffer aliased it. Overwrite the buffer between inserts and the map ends
# up holding two keys BOTH reading the buffer's latest bytes ("gamma"), the earlier key
# ("alpha") unreachable. Now str-keyops deep-copies each inserted key into the map's own
# allocator (and frees it on remove/clear/free), so a key never aliases caller storage.
# The program returns alpha*100 + gamma*10 + len : owning => 1*100+2*10+2 = 122 ;
# the old borrow bug => 0*100+2*10+2 = 22 (alpha lost, two entries both "gamma").
cat > "$T/std3.coil" <<'EOF'
(module app)
(import "coil.hashmap" :use *) (import "coil.str"    :use *)
(import "coil.slice"   :use *) (import "coil.mem"    :use *)
(import "coil.alloc"   :use *) (import "coil.result" :use *)
(import "coil.control" :use *)
(defn probe [(ops (ptr KeyOps))] (-> i64)
  (let [a (malloc-allocator) (mut m) (hm-new [(slice u8) i64] a ops)
        buf (coil.primitive/alloc-stack (array u8 8))]
    (mem-copy [u8] (coil.primitive/cast (ptr u8) buf) (slice-data "alpha") 5)
    (hm-put! (mut m) (slice-new (coil.primitive/cast (ptr u8) buf) 5) 1)       ; key "alpha" -> 1
    (mem-copy [u8] (coil.primitive/cast (ptr u8) buf) (slice-data "gamma") 5)  ; OVERWRITE the buffer
    (hm-put! (mut m) (slice-new (coil.primitive/cast (ptr u8) buf) 5) 2)       ; key "gamma" -> 2
    (coil.primitive/iadd (coil.primitive/imul (match (hm-get [(slice u8) i64] m "alpha") (Some [v] v) (None [] 0)) 100)
          (coil.primitive/iadd (coil.primitive/imul (match (hm-get [(slice u8) i64] m "gamma") (Some [v] v) (None [] 0)) 10)
                (hm-len m)))))
(defn main [] (-> i64) (probe (str-keyops)))
EOF
# FAILS on the seed (borrow: alpha aliased away -> 22), PASSES here (owning -> 122).
expect_rc 122 "str-keyops OWNS keys: alpha survives a reused-buffer overwrite" \
  "$COIL" run "$T/std3.coil"
# The opt-in escape hatch str-keyops-borrowed keeps the old (unsafe) borrow behavior,
# reproducing the aliasing on purpose (-> 22). FAILS on the seed (no such function).
sed 's/(str-keyops)/(str-keyops-borrowed)/' "$T/std3.coil" > "$T/std3b.coil"
expect_rc 22 "str-keyops-borrowed is the opt-in borrow path (alpha aliased away -> 22)" \
  "$COIL" run "$T/std3b.coil"

echo "== --debug-checks: library bounds checks (mem-6), zero-cost when off =="
# The build-mode predicate (coil.primitive/debug-checks?) gates slice bounds checks inside macros, so
# the check is emitted ONLY under --debug-checks and the off-path IR is byte-identical.
cat > "$T/dbgget.coil" <<'EOF'
(module m)
(import "coil.slice" :use *)
(defn main [] (-> i64)
  (let [arr (coil.primitive/alloc-stack (array i64 3))]
    (coil.primitive/store! (coil.primitive/index arr 0) 10)
    (let [s (slice-new (coil.primitive/index arr 0) 3)] (slice-get s 7))))
EOF
# ON: a located OOB message before the crash. FAILS on the seed ('unknown flag --debug-checks').
expect_out "slice-get index out of bounds" "--debug-checks catches a slice-get OOB" \
  "$COIL" run "$T/dbgget.coil" --debug-checks
# OFF (default): NO check emitted — the read runs past the end WITHOUT the debug message.
out=$("$COIL" run "$T/dbgget.coil" 2>&1)
echo "$out" | grep -q "out of bounds" && bad "off: the bounds check must NOT fire (zero-cost)" "$out" \
                                      || ok "off: no bounds check emitted (zero-cost when off)"
# the mem-6 headline: subslice lo>hi used to yield a slice reporting length -2.
cat > "$T/dbgsub.coil" <<'EOF'
(module m)
(import "coil.slice" :use *)
(defn main [] (-> i64)
  (let [arr (coil.primitive/alloc-stack (array i64 4))]
    (let [s (slice-new (coil.primitive/index arr 0) 4)] (slice-len (subslice s 3 1)))))
EOF
# OFF: the invariant break is unchanged (length hi-lo = -2 -> exit 254).
"$COIL" run "$T/dbgsub.coil" >/dev/null 2>&1
[ $? = 254 ] && ok "off: subslice(3,1) still yields length -2 (behavior unchanged)" \
             || bad "off: subslice(3,1)" "want rc=254 (length -2)"
# ON: rejected with the located message. FAILS on the seed ('unknown flag --debug-checks').
expect_out "subslice out of range or lo>hi" "--debug-checks rejects a lo>hi subslice (mem-6)" \
  "$COIL" run "$T/dbgsub.coil" --debug-checks

# ArrayList carries a pointer/len/cap/allocator header. A corrupted tagged aggregate
# used to turn those words into an arbitrary later pointer fault. Debug builds should
# stop at the first collection operation and name the broken invariant.
cat > "$T/dbgal.coil" <<'EOF'
(module m)
(import "coil.alloc" :as alloc :use *)
(import "coil.arraylist" :use *)
(defn main [] (-> i64)
  (let [(mut xs) (al-new [i64] (malloc-allocator))]
    (store! (field xs len) 4)
    (store! (field xs cap) 2)
    (al-len [i64] (load xs))))
EOF
expect_out "ArrayList header corrupt" "--debug-checks diagnoses an invalid ArrayList header" \
  "$COIL" run "$T/dbgal.coil" --debug-checks

cat > "$T/dbgalget.coil" <<'EOF'
(module m)
(import "coil.alloc" :as alloc :use *)
(import "coil.arraylist" :use *)
(defn main [] (-> i64)
  (let [(mut xs) (al-new [i64] (malloc-allocator))]
    (al-push! [i64] (mut xs) 7)
    (al-get [i64] (load xs) 3)))
EOF
expect_out "ArrayList index out of bounds in al-get" "--debug-checks catches ArrayList al-get OOB" \
  "$COIL" run "$T/dbgalget.coil" --debug-checks

echo "== --sanitize=address + a sanitizer --link-flag no longer aborts the compiler (mem-7) =="
# was: a program's --link-flag reached the metaprogram dylib, which is dlopen'd into the
# compiler — an ASan-instrumented dylib loaded that late ABORTED the compiler
# ("interceptors are not working"). Now sanitizer flags are filtered off the dylib link.
# FAILS on the seed (the compiler aborts), PASSES here (builds).
"$COIL" build "$T/seven.coil" -o "$T/san1" --link-flag -fsanitize=address >/dev/null 2>&1
[ $? = 0 ] && ok "--link-flag -fsanitize=address does not abort the compiler" \
           || bad "--link-flag -fsanitize=address" "the compiler aborted (mem-7)"
# Use an explicit heap store: ASan global-registration symbols alone do not prove
# that ordinary program memory accesses were instrumented.
cat > "$T/asanstore.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(defn main [] (-> i64)
  (let [a (malloc-allocator)
        p (unwrap-ptr [i8] (create [i8] a))]
    (destroy [i8] a p)
    ; Deliberate UAF keeps the store observable to ASan instead of letting the
    ; optimizer discard an otherwise dead allocate/store/free sequence.
    (coil.primitive/store! p (coil.primitive/cast i8 7))
    0))
EOF
# --sanitize=address runs LLVM's AddressSanitizer pass: the object gains a report
# call for the store, not merely the module-level ASan constructor.
# FAILS on the seed ('unknown flag --sanitize=address').
rm -f "$T/sanobj.a"
"$COIL" build "$T/asanstore.coil" --lib --sanitize=address -O0 -o "$T/sanobj.a" >/dev/null 2>&1
# ⚠ Capture, then match — never `nm … | grep -q`. `grep -q` exits at its first hit
# and closes the pipe, `nm` takes SIGPIPE, and under `set -o pipefail` the pipeline
# reports 141 even though the symbol was found. That made this check fail on a
# healthy tree with the instrumentation plainly present in the object.
# --lib produces the ARCHIVE named by -o and no stray .o beside it; this used to
# read sanobj.o, a file that is never written, so it could not pass however well
# the pass had instrumented anything.
sansyms=$(nm "$T/sanobj.a" 2>/dev/null)
case "$sansyms" in
  *__asan_report_store*) ok "--sanitize=address instruments ordinary stores" ;;
  *) bad "--sanitize=address store instrumentation" "no __asan_report_store* symbol in the emitted object" ;;
esac
# Prove the host runtime initializes and observes that instrumentation too. This
# catches toolchain/runtime regressions that an object-symbol check cannot, such as
# Homebrew LLVM 21's macOS 26 hang in FindDynamicShadowStart.
rm -f "$T/sanrun"
if "$COIL" build "$T/asanstore.coil" --sanitize=address -O0 -o "$T/sanrun" >/dev/null 2>&1; then
  sanout=$("$T/sanrun" 2>&1); sanrc=$?
  if [ "$sanrc" != 0 ] && echo "$sanout" | grep -qE 'AddressSanitizer: heap-use-after-free|SUMMARY: AddressSanitizer'; then
    ok "--sanitize=address runtime diagnoses a deliberate use-after-free"
  else
    bad "--sanitize=address runtime" "want a nonzero ASan use-after-free report, got rc=$sanrc: $sanout"
  fi
else
  bad "--sanitize=address runtime link" "could not link the instrumented executable"
fi
# and WITHOUT the flag the SAME object has no ASan — proving the flag is what adds it.
rm -f "$T/plainobj.o"
"$COIL" build "$T/seven.coil" --lib -o "$T/plainobj.a" >/dev/null 2>&1
# Same SIGPIPE hazard, and here it is worse: this is a NEGATIVE check, so a
# pipeline that dies early would report "no ASan symbols" and pass while the
# object was in fact instrumented.
plainsyms=$(nm "$T/plainobj.o" 2>/dev/null)
case "$plainsyms" in
  *asan*) bad "a plain build must not be instrumented" "found __asan without --sanitize" ;;
  *) ok "no ASan symbols without --sanitize=address" ;;
esac
# ASan needs the LLVM backend — the native arm64 backend is a clear error, never a silent
# uninstrumented binary. FAILS on the seed ('unknown flag').
expect_out "requires the LLVM backend" "--sanitize=address --backend arm64 is rejected" \
  "$COIL" build "$T/seven.coil" -o "$T/san2" --sanitize=address --backend arm64

cat > "$T/tsan-race.coil" <<'EOF'
(module tsan_race)
(import "coil.primitive" :as primitive)
(import "coil.alloc" :as alloc)
(import "coil.thread" :use *)
(defn worker [(arg (ptr i8))] (-> (ptr i8))
  (let [p (primitive/cast (ptr i64) arg)]
    (store! p (primitive/iadd (load p) 1)))
  (primitive/cast (ptr i8) 0))
(defn main [] (-> i64)
  (let [counter (primitive/alloc-stack i64)
        threads (primitive/alloc-stack (array Thread 2))]
    (store! counter 0)
    (thread-spawn (primitive/index threads 0) (primitive/fnptr-of worker) (primitive/cast (ptr i8) counter))
    (thread-spawn (primitive/index threads 1) (primitive/fnptr-of worker) (primitive/cast (ptr i8) counter))
    (thread-join (primitive/index threads 0))
    (thread-join (primitive/index threads 1))
    0))
EOF
if "$COIL" build "$T/tsan-race.coil" --sanitize=thread -O1 -o "$T/tsan-race" >/dev/null 2>&1; then
  tsanout=$(TSAN_OPTIONS=halt_on_error=1 "$T/tsan-race" 2>&1); tsanrc=$?
  if [ "$tsanrc" != 0 ] && echo "$tsanout" | grep -qE 'ThreadSanitizer: data race|SUMMARY: ThreadSanitizer'; then
    ok "--sanitize=thread diagnoses a deliberate data race"
  else
    bad "--sanitize=thread runtime" "want a nonzero TSan data-race report, got rc=$tsanrc: $tsanout"
  fi
else
  bad "--sanitize=thread runtime link" "could not link the instrumented executable"
fi

cat > "$T/ubsan-overflow.coil" <<'EOF'
(module ubsan_overflow)
(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)
  (coil.primitive/iadd 9223372036854775807 (coil.primitive/cast i64 argc)))
EOF
expect_out "undefined behavior: signed integer overflow" "--sanitize=undefined catches signed overflow" \
  sh -c "'$COIL' build '$T/ubsan-overflow.coil' --sanitize=undefined -O1 -o '$T/ubsan-overflow' >/dev/null && '$T/ubsan-overflow'"

cat > "$T/ubsan-divzero.coil" <<'EOF'
(module ubsan_divzero)
(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)
  (coil.primitive/idiv 7 (coil.primitive/isub (coil.primitive/cast i64 argc) 1)))
EOF
expect_out "undefined behavior: integer division or remainder by zero" "--sanitize=undefined catches division by zero" \
  sh -c "'$COIL' build '$T/ubsan-divzero.coil' --sanitize=undefined -O1 -o '$T/ubsan-divzero' >/dev/null && '$T/ubsan-divzero'"

cat > "$T/ubsan-shift.coil" <<'EOF'
(module ubsan_shift)
(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)
  (coil.primitive/ishl 1 (coil.primitive/iadd 63 (coil.primitive/cast i64 argc))))
EOF
expect_out "undefined behavior: shift exponent is negative or too large" "--sanitize=undefined catches an invalid shift" \
  sh -c "'$COIL' build '$T/ubsan-shift.coil' --sanitize=undefined -O1 -o '$T/ubsan-shift' >/dev/null && '$T/ubsan-shift'"

expect_out "sanitizer modes cannot be combined" "incompatible sanitizer modes are rejected" \
  "$COIL" build "$T/seven.coil" --sanitize=address --sanitize=thread -o "$T/multi-san"

if [ "$HOST_OS" = Darwin ]; then
  expect_out "supported only on Linux" "--sanitize=memory explains its Darwin limitation" \
    "$COIL" build "$T/seven.coil" --sanitize=memory -o "$T/msan"
else
  cat > "$T/msan-uninit.coil" <<'EOF'
(module msan_uninit)
(import "coil.primitive" :as primitive)
(import "coil.alloc" :as alloc)
(defn main [] (-> i64)
  (let [p (primitive/alloc-stack i64)] (coil.primitive/load p)))
EOF
  if "$COIL" build "$T/msan-uninit.coil" --sanitize=memory -O1 -o "$T/msan-uninit" >/dev/null 2>&1; then
    msanout=$(MSAN_OPTIONS=halt_on_error=1 "$T/msan-uninit" 2>&1); msanrc=$?
    if [ "$msanrc" != 0 ] && echo "$msanout" | grep -qE 'MemorySanitizer: use-of-uninitialized-value|SUMMARY: MemorySanitizer'; then
      ok "--sanitize=memory diagnoses an uninitialized read"
    else
      bad "--sanitize=memory runtime" "want a nonzero MSan report, got rc=$msanrc: $msanout"
    fi
  else
    bad "--sanitize=memory runtime link" "could not link the instrumented executable"
  fi
fi

# A vulnerable local array gives sspstrong a concrete frame to protect. Check the
# object-level runtime references because normalized emit-ir intentionally omits
# attribute-group details.
cat > "$T/stack-smash.coil" <<'EOF'
(module m)
(defn guarded [(p (ptr i8))] (-> i64)
  (let [buf (coil.primitive/alloc-stack (array i8 64))]
    (coil.primitive/store! (coil.primitive/index buf 0) (coil.primitive/load p))
    0))
(defn main [] (-> i64) 0)
EOF
rm -f "$T/debug-runtime.o"
"$COIL" emit-obj "$T/stack-smash.coil" --debug-runtime -O0 -o "$T/debug-runtime.o" >/dev/null 2>&1
# Do not use grep -q under pipefail here: the heavily instrumented object has
# enough symbols that grep's early exit gives nm SIGPIPE and falsely fails the gate.
nm "$T/debug-runtime.o" 2>/dev/null | grep '__stack_chk_fail' >/dev/null \
  && ok "--debug-runtime enables strong stack-canary checks" \
  || bad "--debug-runtime stack protector" "no __stack_chk_fail reference in a vulnerable function"
nm "$T/debug-runtime.o" 2>/dev/null | grep -E '__asan_report_store[0-9]+' >/dev/null \
  && ok "--debug-runtime enables ASan store instrumentation" \
  || bad "--debug-runtime ASan" "no __asan_report_store* symbol in the emitted object"
nm "$T/debug-runtime.o" 2>/dev/null | grep 'coil.crash.crash-handler' >/dev/null \
  && ok "--debug-runtime automatically installs the crash runtime" \
  || bad "--debug-runtime crash installation" "crash handler was not linked into an unmodified program"

# A dyn receiver's data pointer names an ordinary stack/heap object, not an
# indirect control-flow target. Only the method loaded from its vtable should
# receive dladdr-based target validation.
cat > "$T/debug-runtime-dyn.coil" <<'EOF'
(module debug_runtime_dyn)
(import "coil.primitive" :as primitive)
(import "coil.alloc" :as alloc)
(deftrait Read [Self]
  (read [(self (ptr Self))] (-> i64)))
(defstruct Cell [(value i64)])
(impl Read Cell
  (read [(self (ptr Cell))] (-> i64)
    (load (field self value))))
(defn main [] (-> i64)
  (let [cell (primitive/alloc-stack Cell)
        receiver (: cell (dyn Read))]
    (store! (field cell value) 42)
    (if (= (read receiver) 42) 0 1)))
EOF
if "$COIL" run "$T/debug-runtime-dyn.coil" --debug-runtime >/dev/null 2>&1; then
  ok "--debug-runtime accepts stack-backed dyn receivers"
else
  bad "--debug-runtime dyn dispatch" "valid stack-backed dyn receiver was rejected"
fi

cat > "$T/stack-smash-runtime.coil" <<'EOF'
(module m)
(extern __stack_chk_fail :cc c [] (-> i64))
(defn main [] (-> i64) (__stack_chk_fail))
EOF
out=$("$COIL" run "$T/stack-smash-runtime.coil" --debug-checks -O0 2>&1); rc=$?
[ "$rc" = 134 ] \
  && ok "strong stack canary terminates a deliberate stack smash" \
  || bad "stack-canary runtime" "want SIGABRT/134, got rc=$rc: $out"

echo "== crash diagnostics preserve fatal-signal semantics =="
cat > "$T/crash.coil" <<'EOF'
(module m)
(import "coil.crash" :use *)
(extern raise :cc c [i32] (-> i32))
(defn main [] (-> i64)
  (crash-install!)
  (crash-event! "before deliberate abort")
  (raise 6)
  0)
EOF
out=$("$COIL" run "$T/crash.coil" 2>&1); rc=$?
[ "$rc" = 134 ] \
  && ok "crash diagnostics preserve SIGABRT exit semantics" \
  || bad "crash signal semantics" "want rc=134 got rc=$rc: $out"
echo "$out" | grep -q "coil crash: signal=" \
  && ok "fatal handler prints signal, address, thread, and context" \
  || bad "crash diagnostic header" "$out"
echo "$out" | grep -q "before deliberate abort" \
  && ok "fatal handler includes the recent-event ring" \
  || bad "crash recent events" "$out"
echo "$out" | grep -q "stack trace:" \
  && ok "fatal handler emits a bounded stack trace" \
  || bad "crash stack trace" "$out"
COIL_CRASH_REPORT="$T/crash-report.txt" "$COIL" run "$T/crash.coil" >/dev/null 2>&1
grep -q "profile=debug-runtime" "$T/crash-report.txt" \
  && grep -q "before deliberate abort" "$T/crash-report.txt" \
  && ok "crash artifact contains build/process metadata and recent events" \
  || bad "crash artifact" "$(cat "$T/crash-report.txt" 2>/dev/null)"

cat > "$T/guard-uaf.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.guardalloc" :use *)
(import "coil.crash" :use *)
(defn main [] (-> i64)
  (crash-install!)
  (let [a (guard-allocator (malloc-allocator))
        p (unwrap-ptr [i64] (create [i64] a))]
    (store! p 7)
    (destroy [i64] a p)
    (load p)))
EOF
out=$("$COIL" run "$T/guard-uaf.coil" --debug-checks 2>&1); rc=$?
[ "$rc" = 138 ] || [ "$rc" = 139 ] \
  && ok "guard allocator protects quarantined payload pages" \
  || bad "guard allocator UAF" "want SIGBUS/SIGSEGV, got rc=$rc: $out"

cat > "$T/ffi-out.coil" <<'EOF'
(module m)
(import "coil.primitive" :as primitive)
(import "coil.alloc" :use *)
(import "coil.checked-ffi" :use *)
(defn bad-out [(p (ptr i64))] (-> i64)
  (store! (primitive/index (primitive/cast (ptr i8) p) 8) (primitive/cast i8 1))
  0)
(defn main [] (-> i64)
  (with-checked-out (malloc-allocator) 8 8 out
    (bad-out (primitive/cast (ptr i64) out))))
EOF
expect_out "foreign call wrote past its checked out-parameter" "checked FFI output validates canaries immediately" \
  "$COIL" run "$T/ffi-out.coil"

cat > "$T/null-callptr.coil" <<'EOF'
(module m)
(import "coil.primitive" :as primitive)
(defn main [] (-> i64)
  (let [fp (primitive/cast (fnptr c [] i64) (primitive/cast (ptr i8) 0))]
    (primitive/call-ptr fp)))
EOF
expect_out "invalid indirect target in callptr" "debug checks validate call-ptr before control transfer" \
  "$COIL" run "$T/null-callptr.coil" --debug-checks
out=$("$COIL" emit-ir "$T/null-callptr.coil" 2>&1)
echo "$out" | grep -q "indirect.invalid" \
  && bad "off: indirect validation must be zero-cost" "debug branch appears without the flag" \
  || ok "off: indirect validation emits no branch"

cat > "$T/null-dyn.coil" <<'EOF'
(module m)
(import "coil.primitive" :as primitive)
(deftrait Runnable [Self] (run [(self (ptr Self))] (-> i64)))
(defstruct Worker [(value i64)])
(impl Runnable Worker
  (run [(self (ptr Worker))] (-> i64) (load (field self value))))
(defn main [] (-> i64)
  (let [worker (primitive/make-dyn Runnable (primitive/cast (ptr Worker) 0))]
    (run worker)))
EOF
expect_out "invalid indirect target in dyn.data" "debug checks validate dynamic-trait data" \
  "$COIL" run "$T/null-dyn.coil" --debug-checks

# NO null-allocator-vtable check. There used to be one here, asserting that
# `raw-alloc` on a null (ptr Allocator) aborted before dereferencing the vtable.
# The typed-allocator change made the parameter a `(dyn Allocator)` -- a fat
# trait-object VALUE, not a pointer -- and deliberately deleted the check with it,
# because there is no null to test for. The test outlived the capability, so it is
# gone rather than rewritten: nothing here can construct the state it described.

cat > "$T/bad-slice-header.coil" <<'EOF'
(module m)
(import "coil.primitive" :as primitive)
(import "coil.slice" :use *)
(defn main [] (-> i64)
  (slice-get [i64] (slice-new (primitive/cast (ptr i64) 0) 1) 0))
EOF
expect_out "invalid slice header" "debug checks reject a nonempty null slice" \
  "$COIL" run "$T/bad-slice-header.coil" --debug-checks

cat > "$T/bad-hashmap-header.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.hashmap" :use *)
(defn main [] (-> i64)
  (let [(mut map) (hm-new-scalar [i64 i64] (malloc-allocator))]
    (store! (field map cap) 3)
    (hm-len [i64 i64] (load map))))
EOF
expect_out "HashMap header corrupt" "debug checks reject a corrupt HashMap header" \
  "$COIL" run "$T/bad-hashmap-header.coil" --debug-checks

cat > "$T/bad-arraylist-set.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.arraylist" :use *)
(defn main [] (-> i64)
  (let [(mut xs) (al-new [i64] (malloc-allocator))]
    (al-push! [i64] (mut xs) 1)
    (al-set! [i64] (mut xs) 1 2)))
EOF
expect_crash_out "ArrayList index out of bounds in al-set!" "debug checks validate ArrayList writes" \
  "$COIL" run "$T/bad-arraylist-set.coil" --debug-checks

cat > "$T/thread-config.coil" <<'EOF'
(module m)
(import "coil.primitive" :as primitive)
(import "coil.alloc" :as alloc)
(import "coil.thread" :use *)
(defn worker [(arg (ptr i8))] (-> (ptr i8)) arg)
(defn main [] (-> i64)
  (let [thread (primitive/alloc-stack Thread)
        status (thread-spawn-configured thread
                                        (primitive/fnptr-of worker)
                                        (primitive/cast (ptr i8) 0)
                                        (thread-config 1048576 65536))]
    (if (= status 0) (primitive/cast i64 (thread-join thread)) (primitive/cast i64 status))))
EOF
expect_rc 0 "thread config applies explicit stack and guard sizes" \
  "$COIL" run "$T/thread-config.coil"

echo "== poison-on-free debug-allocator: detects double-free (mem-2) =="
# (debug-allocator a) from dbgalloc.coil — under --debug-checks it detects a double-free
# with a located abort (was: a bare signal or silent reuse). FAILS on the seed
# (dbgalloc.coil is not bundled there, so the build fails and prints no such message).
cat > "$T/df.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.dbgalloc" :use *)
(defn main [] (-> i64)
  (let [a (debug-allocator (malloc-allocator))
        p (unwrap-ptr [i64] (create [i64] a))]
    (coil.primitive/store! p 5)
    (destroy [i64] a p)
    (destroy [i64] a p)
    0))
EOF
expect_out "double free in debug-allocator" "--debug-checks detects a double free (mem-2)" \
  "$COIL" run "$T/df.coil" --debug-checks
# OFF (default): (debug-allocator a) is exactly `a` — no wrapper and zero cost.
# Do not use a double-free to prove this: double-free is undefined behavior, and
# current platform malloc implementations may abort even without our detector.
cat > "$T/dbg-off.coil" <<'EOF'
(module m)
(import "coil.primitive" :as primitive)
(import "coil.alloc" :use *)
(import "coil.dbgalloc" :use *)
; With checks OFF the `debug-allocator` macro expands to its argument verbatim, so
; the wrapper cannot be observed: allocating through it just works, and nothing from
; coil.dbgalloc is linked. (This used to compare the two allocators by casting each
; to i64. A `(dyn Allocator)` is a fat trait-object VALUE, not a pointer, so that is
; not a legal cast any more -- and identity of a copied fat value was never what the
; passthrough property meant.)
(defn main [] (-> i64)
  (let [wrapped (debug-allocator (malloc-allocator))]
    (match (alloc-bytes wrapped 32 8)
      (None [] 1)
      (Some [m] (do (free-bytes wrapped m 8) 0)))))
EOF
expect_rc 0 "off: debug-allocator is a passthrough (no detection, zero cost)" \
  "$COIL" run "$T/dbg-off.coil"
# a use-after-free reads the 0xDE poison (222) rather than the freed value under the flag.
cat > "$T/uaf.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.dbgalloc" :use *)
(defn main [] (-> i64)
  (let [a (debug-allocator (malloc-allocator))
        p (unwrap-ptr [i64] (create [i64] a))]
    (coil.primitive/store! p 1234) (destroy [i64] a p) (coil.primitive/iand (coil.primitive/load p) 255)))
EOF
expect_rc 222 "--debug-checks poisons freed memory (use-after-free reads 0xDE)" \
  "$COIL" run "$T/uaf.coil" --debug-checks

cat > "$T/dbgalloc-misuse.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.dbgalloc" :use *)
(defn main [] (-> i64)
  (let [a (debug-allocator (malloc-allocator))
        p (unwrap-ptr [i64] (create [i64] a))]
    (coil.primitive/store! (coil.primitive/index (coil.primitive/cast (ptr i8) p) -32)
                           (coil.primitive/cast i8 0))
    (destroy [i64] a p)
    0))
EOF
expect_out "buffer underrun in debug-allocator" "debug-allocator detects a prefix underrun" \
  "$COIL" run "$T/dbgalloc-misuse.coil" --debug-checks

sed 's/-32)/8)/' "$T/dbgalloc-misuse.coil" > "$T/dbgalloc-overflow.coil"
expect_out "buffer overflow in debug-allocator" "debug-allocator detects a suffix overflow" \
  "$COIL" run "$T/dbgalloc-overflow.coil" --debug-checks

cat > "$T/dbgalloc-size.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.dbgalloc" :use *)
(defn main [] (-> i64)
  (let [a (debug-allocator (malloc-allocator))]
    (match (bytes-request 8 8)
      (None [] 1)
      (Some [rq]
        (match (raw-alloc a rq)
          (None [] 1)
          (Some [p]
            (match (bytes-request 7 8)
              (None [] 1)
              (Some [bad] (raw-free a p bad)))))))))
EOF
expect_out "allocation size mismatch in debug-allocator" "debug-allocator detects a free-size mismatch" \
  "$COIL" run "$T/dbgalloc-size.coil" --debug-checks

cat > "$T/dbgalloc-stateful.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.dbgalloc" :use *)
(defn use-allocator [(a (dyn Allocator))] (-> i64)
  (let [p (unwrap-ptr [i64] (create [i64] a))]
    (store! p 42)
    (let [value (load p)]
      (destroy [i64] a p)
      value)))
(defn main [] (-> i64)
  (let [debug (debug-allocator-init (malloc-allocator))
        value (use-allocator (debug-allocator-view debug))
        leaks (debug-allocator-deinit! debug)]
    (if (and (= value 42) (= leaks 0)) 0 1)))
EOF
expect_rc 0 "stateful debug allocator exposes a passable Allocator view" \
  "$COIL" run "$T/dbgalloc-stateful.coil"
for opt in -O0 -O1 -O3; do
  expect_rc 0 "stateful debug allocator works at $opt" \
    "$COIL" run "$T/dbgalloc-stateful.coil" "$opt"
done

cat > "$T/dbgalloc-leak.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.dbgalloc" :use *)
(defn main [] (-> i64)
  (let [debug (debug-allocator-init (malloc-allocator))
        a (debug-allocator-view debug)
        p (unwrap-ptr [i64] (create [i64] a))]
    (store! p 7)
    (debug-allocator-deinit! debug)))
EOF
expect_out "debug-allocator leaked 1 allocation" "debug allocator reports live allocations at deinit" \
  "$COIL" run "$T/dbgalloc-leak.coil"
expect_rc 1 "debug allocator deinit returns the live leak count" \
  "$COIL" run "$T/dbgalloc-leak.coil"

cat > "$T/dbgalloc-invalid-free.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.dbgalloc" :use *)
(defn main [] (-> i64)
  (let [debug (debug-allocator-init (malloc-allocator))
        a (debug-allocator-view debug)]
    (match (bytes-request 8 8)
      (None [] 1)
      (Some [rq] (raw-free a (coil.primitive/cast (ptr i8) 4096) rq)))))
EOF
expect_out "invalid free in debug-allocator" "debug allocator rejects an unowned pointer without dereferencing it" \
  "$COIL" run "$T/dbgalloc-invalid-free.coil"

cat > "$T/dbgalloc-interior-free.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.dbgalloc" :use *)
(defn main [] (-> i64)
  (let [debug (debug-allocator-init (malloc-allocator))
        a (debug-allocator-view debug)]
    (match (bytes-request 16 8)
      (None [] 1)
      (Some [rq]
        (match (raw-alloc a rq)
          (None [] 1)
          (Some [p]
            (match (bytes-request 15 8)
              (None [] 1)
              (Some [bad] (raw-free a (coil.primitive/index p 1) bad)))))))))
EOF
expect_out "interior pointer passed to debug-allocator free" "debug allocator diagnoses an interior-pointer free" \
  "$COIL" run "$T/dbgalloc-interior-free.coil"

cat > "$T/dbgalloc-alignment.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(import "coil.dbgalloc" :use *)
(defn main [] (-> i64)
  (let [debug (debug-allocator-init (malloc-allocator))
        a (debug-allocator-view debug)]
    (match (bytes-request 17 256)
      (None [] 1)
      (Some [rq]
        (match (raw-alloc a rq)
          (None [] 1)
          (Some [p]
                (let [aligned (= (coil.primitive/irem (coil.primitive/cast i64 p) 256) 0)]
                  (raw-free a p rq)
                  (let [leaks (debug-allocator-deinit! debug)]
                    (if (and aligned (= leaks 0)) 0 1)))))))))
EOF
expect_rc 0 "debug allocator honors over-aligned requests independently of its backing allocator" \
  "$COIL" run "$T/dbgalloc-alignment.coil"

echo "== stack-return lint under --debug-checks (mem-8) =="
# A bundled (checker …) the driver auto-applies under --debug-checks warns when a
# function returns a pointer to a stack local (clang warns on the identical C; Coil was
# silent). FAILS on the seed ('unknown flag --debug-checks', no such warning).
cat > "$T/dangle.coil" <<'EOF'
(module m)
(defn dangling [] (-> (ptr i64))
  (let [x (coil.primitive/alloc-stack i64)] (coil.primitive/store! x 42) x))
(defn main [] (-> i64) (coil.primitive/load (dangling)))
EOF
expect_out "returns a pointer to a stack local" "--debug-checks warns on a stack-local pointer return (mem-8)" \
  "$COIL" build "$T/dangle.coil" -o "$T/dl1" --debug-checks
# it is a WARNING (like clang), not an error — the build still succeeds.
"$COIL" build "$T/dangle.coil" -o "$T/dl2" --debug-checks >/dev/null 2>&1
[ $? = 0 ] && ok "the stack-return lint is a warning (build still succeeds)" \
           || bad "stack-return lint severity" "the build failed"
# OFF (default): the checker is not even loaded — silent, zero cost.
out=$("$COIL" build "$T/dangle.coil" -o "$T/dl3" 2>&1)
echo "$out" | grep -q "stack local" && bad "off: the lint must not run" "$out" \
                                      || ok "off: the stack-return lint is not loaded (zero cost)"

# no false positive: a function returning a HEAP pointer is fine under the flag.
cat > "$T/heapret.coil" <<'EOF'
(module m)
(import "coil.alloc" :use *)
(defn mk [(a (dyn Allocator))] (-> (ptr i64))
  (let [p (unwrap-ptr [i64] (create [i64] a))] (coil.primitive/store! p 9) p))
(defn main [] (-> i64) (coil.primitive/load (mk (malloc-allocator))))
EOF
out=$("$COIL" build "$T/heapret.coil" -o "$T/hr" --debug-checks 2>&1)
echo "$out" | grep -q "stack local" && bad "no false positive: heap return" "flagged a heap ptr" \
                                    || ok "no false positive: a heap-pointer return is not flagged"

echo "== assert / assert-eq: located failures via the span machinery (tool-12) =="
# src/stdlib/assert.coil (a bundled library) bakes the offending expression AND its file:line
# into the emitted code via the new code-src / code-file / code-line comptime ops. ALL of
# this FAILS on the seed: assert.coil is not bundled there, and code-line/code-src are
# unknown ops.
cat > "$T/assf.coil" <<'EOF'
(module m)
(import "coil.assert" :use *)
(defn main [] (-> i64)
  (assert (> 2 1))
  (assert (< 9 3))
  0)
EOF
expect_rc 134 "assert failure aborts (SIGABRT = 128+6)"                     "$COIL" run "$T/assf.coil"
expect_out "assertion failed: \(< 9 3\)" "assert prints the offending expression (coil.primitive/code-src)" "$COIL" run "$T/assf.coil"
expect_out "assf\.coil:5"  "assert prints file:line (code-file/code-line)"  "$COIL" run "$T/assf.coil"
cat > "$T/asseq.coil" <<'EOF'
(module m)
(import "coil.assert" :use *)
(defn main [] (-> i64) (assert-eq (+ 40 1) 99))
EOF
expect_out "assertion failed: \(\+ 40 1\) == 99" "assert-eq prints BOTH expressions" "$COIL" run "$T/asseq.coil"

echo "== deftest + the test transform: discovery, process isolation, exit code (tool-12) =="
# A file of (deftest …) with NO main. `coil test` loads coil.test-runner, whose
# (transform …) DISCOVERS every coil-test$… and synthesizes a main that runs each in
# its own process. FAILS on the seed ('unknown command test').
#
# These drove `coil run` until the runner moved out of assert.coil: the fixture
# imported coil.assert, and importing it used to register the transform. It no longer
# does — deliberately, see prelude.coil — so `coil run` on a test file has no entry
# point at all, which is the LAST check in this block rather than the first four.
# (The old spelling also had a check that could not fail: `expect_rc 1 "a suite with a
# failing test exits 1"` stayed green off the BUILD's exit 1 after the transform was
# gone, reporting a suite result for a suite that never ran.)
cat > "$T/suite.coil" <<'EOF'
(module m)
(deftest passes (assert-eq (* 6 7) 42))
(deftest fails  (assert-eq (+ 1 1) 3))
(deftest tail   (assert (> 5 0)))
EOF
expect_out "running 3 tests"       "the transform discovers every test"                       "$COIL" test "$T/suite.coil"
expect_out "test passes \.\.\. ok" "a passing test reports ok"                                "$COIL" test "$T/suite.coil"
expect_out "test tail \.\.\. ok"   "the suite continues past a failing test (process isolation)" "$COIL" test "$T/suite.coil"
expect_out "1 failed"              "the summary counts the failure"                           "$COIL" test "$T/suite.coil"
expect_rc 1  "a suite with a failing test exits 1"                                            "$COIL" test "$T/suite.coil"
# The runner is opt-in, so `coil run` on this file cannot link — and an undefined
# `_main` names neither the file, the tests in it, nor the command that runs them.
expect_out "defines 3 test\(s\) and no .main." "building a test file says so, not the linker" "$COIL" run "$T/suite.coil"
expect_out "coil test .*suite.coil"          "…and names the command that runs them"          "$COIL" run "$T/suite.coil"

echo "== coil test: the project test runner (tool-12) =="
# `coil test FILE` auto-loads assert.coil (--use), so a test file needs NO import at all,
# then runs the synthesized suite. FAILS on the seed ('unknown command test').
cat > "$T/noimp.coil" <<'EOF'
(module m)
(deftest a (assert-eq (* 3 3) 9))
(deftest b (assert (> 7 0)))
EOF
expect_rc 0  "coil test: an all-passing suite (no import needed) exits 0" "$COIL" test "$T/noimp.coil"
expect_out "2 passed; 0 failed" "coil test: reports the pass count"       "$COIL" test "$T/noimp.coil"
expect_out "running 1 test" "coil test --filter: selects by test-name substring" \
  "$COIL" test "$T/noimp.coil" --filter '^not-a-pattern$' --filter a
expect_out "1 passed; 0 failed" "coil test --filter: repeated filters combine by OR without counting omissions" \
  "$COIL" test "$T/noimp.coil" --filter no-match --filter b
filtered_list=$("$COIL" test "$T/noimp.coil" --list --filter b 2>&1); filtered_list_rc=$?
filtered_names=$(printf '%s\n' "$filtered_list" | sed '/^ld: warning:/d')
case "$filtered_names" in
  b) [ "$filtered_list_rc" = 0 ] \
       && ok "coil test --list --filter: lists the selected test names only" \
       || bad "coil test --list --filter" "want rc=0 got rc=$filtered_list_rc" ;;
  *) bad "coil test --list --filter" "want exactly b, got: $filtered_names" ;;
esac
expect_rc 1 "coil test --filter: an empty selected set is not green" \
  "$COIL" test "$T/noimp.coil" --filter no-such-test
expect_out "0 tests matched" "coil test --filter: an empty selected set is clear" \
  "$COIL" test "$T/noimp.coil" --filter no-such-test
expect_rc 2 "coil test --filter: a missing substring is rejected" \
  "$COIL" test "$T/noimp.coil" --filter
cat > "$T/filter-prop.coil" <<'EOF'
(module filter_prop)
(import "coil.prop" :use *)
(deftest example-smoke 0)
(defprop property-smoke [(x i64)] (= x x))
EOF
expect_out '^property-smoke$' "coil test --filter: defprop names participate in the same discovery filter" \
  "$COIL" test "$T/filter-prop.coil" --list --filter property
cat > "$T/redf.coil" <<'EOF'
(module m)
(deftest willfail (assert-eq (+ 2 2) 5))
EOF
expect_rc 1  "coil test: a failing suite exits 1"                         "$COIL" test "$T/redf.coil"
expect_out "0 passed; 1 failed" "coil test: reports the failure count"    "$COIL" test "$T/redf.coil"
expect_out "discovers every \(deftest" "coil test --help documents itself" "$COIL" test --help
mkdir -p "$T/test-cleanup"
expect_rc 0 "coil test: a passing suite cleans its invocation-local runner" \
  bash -c 'cd "$1" && "$2" test "$3" >/dev/null' _ "$T/test-cleanup" "$COIL" "$T/noimp.coil"
[ ! -d "$T/test-cleanup/.coil/build/test" ] \
  || [ -z "$(find "$T/test-cleanup/.coil/build/test" -mindepth 1 -print -quit)" ] \
  && ok "coil test leaves no runner artifacts after execution" \
  || bad "coil test leaves no runner artifacts after execution" "runner artifact remains"
expect_rc 0 "coil test --no-run cleans its invocation-local runner" \
  bash -c 'cd "$1" && "$2" test "$3" --no-run >/dev/null' _ "$T/test-cleanup" "$COIL" "$T/noimp.coil"
[ ! -d "$T/test-cleanup/.coil/build/test" ] \
  || [ -z "$(find "$T/test-cleanup/.coil/build/test" -mindepth 1 -print -quit)" ] \
  && ok "coil test --no-run leaves no runner artifacts" \
  || bad "coil test --no-run leaves no runner artifacts" "runner artifact remains"

echo "== project workflows: test/check/fmt/lint/verify + native graph =="
mkdir -p "$T/project/src" "$T/project/tests" "$T/project/native"
cat > "$T/project/Coil.toml" <<'EOF'
[package]
name = "project"
entry = "src/main.coil"
source-roots = ["src", "tests"]

[cc]
sources = ["native/answer.c"]
include-dirs = ["native"]
flags = ["-std=c11", "-Wall", "-Werror"]

[link]
EOF
if [ "$HOST_OS" = Darwin ]; then
  printf 'flags = ["-Wl,-dead_strip"]\n' >> "$T/project/Coil.toml"
else
  printf 'flags = ["-Wl,--gc-sections"]\n' >> "$T/project/Coil.toml"
fi
cat >> "$T/project/Coil.toml" <<'EOF'

[test]
roots = ["tests"]
suffixes = ["_test.coil"]
EOF
cat > "$T/project/native/answer.h" <<'EOF'
long project_answer(void);
EOF
cat > "$T/project/native/answer.c" <<'EOF'
#include "answer.h"
long project_answer(void) { return 42; }
EOF
cat > "$T/project/src/main.coil" <<'EOF'
(module project)
(defn main [] (-> i64) 0)
EOF
cat > "$T/project/tests/native_test.coil" <<'EOF'
(module native_test)
(extern project_answer :cc c [] (-> i64))
(deftest native-linkage (assert-eq (project_answer) 42))
EOF
cat > "$T/project/tests/second_test.coil" <<'EOF'
(module second_test)
(import "coil.primitive" :as primitive)
(defn generate-second-suite [] (-> Code)
  ; hygiene: these declarations intentionally enter the test module's public namespace.
  (let [constant (primitive/syntax->datum `GENERATED_TEST_VALUE)
        function (primitive/syntax->datum `generated-test-value)]
    `(do
       (const ~constant 42)
       (defn ~function [] (-> i64) GENERATED_TEST_VALUE))))
(meta (generate-second-suite))
(deftest second-suite (assert-eq (generated-test-value) 42))
EOF
cat > "$T/project/tests/generic_zeroed_test.coil" <<'EOF'
(module generic_zeroed_test)
(import "coil.primitive" :as primitive)

(defstruct Wrapper [T] [(value T)])

(defn make-wrapper [T] [(value T)] (-> (Wrapper T))
  (let [(mut out) (primitive/zeroed (Wrapper T))]
    (set! (.value (mut out)) value)
    (load out)))

(deftest generic-zeroed-struct
  (let [wrapped (make-wrapper 42)]
    (assert-eq (.value wrapped) 42)))
EOF
"$COIL" fmt --write "$T/project/src/main.coil" "$T/project/tests/native_test.coil" \
  "$T/project/tests/second_test.coil" "$T/project/tests/generic_zeroed_test.coil" >/dev/null
expect_out "native_test.coil" "project test --list discovers configured suffixes" \
  bash -c 'cd "$1" && "$2" test --list' _ "$T/project" "$COIL"
expect_out "1 passed; 0 failed" "project test selector builds with inherited native inputs" \
  bash -c 'cd "$1" && "$2" test native' _ "$T/project" "$COIL"
expect_out "running 3 tests" "project test compiles all selected files into one suite runner" \
  bash -c 'cd "$1" && "$2" test --jobs 2' _ "$T/project" "$COIL"
expect_rc 0 "project test --no-run compiles and links the combined suite" \
  bash -c 'cd "$1" && "$2" test --no-run' _ "$T/project" "$COIL"
expect_rc 0 "project build preserves commas inside a quoted link flag" \
  bash -c 'cd "$1" && "$2" build >/dev/null' _ "$T/project" "$COIL"
expect_rc 2 "coil test rejects a user-owned -o instead of running stale output" \
  bash -c 'cd "$1" && "$2" test tests/native_test.coil -o nope' _ "$T/project" "$COIL"
expect_rc 0 "project check covers entry and test monomorphizations" \
  bash -c 'cd "$1" && "$2" check' _ "$T/project" "$COIL"
# `check` is ONE front end over the entry graph with the whole selected test corpus
# loaded alongside it — not a pass per test file, and not a pass per graph. The failure
# mode of that shape is silence: the roots load but nothing is checked, so a project
# with a broken test file checks clean. Assert on a real type error in a test body, by
# name, not merely on a nonzero status.
cat > "$T/project/tests/broken_test.coil" <<'EOF'
(module broken_test)
(deftest broken-body (assert-eq (+ 1 1) "two"))
EOF
expect_rc 1 "project check fails on a type error inside a test body" \
  bash -c 'cd "$1" && "$2" check' _ "$T/project" "$COIL"
expect_out "broken_test.coil" "project check locates the failing test file" \
  bash -c 'cd "$1" && "$2" check 2>&1' _ "$T/project" "$COIL"
# --target tests drops the entry graph, so the corpus is compiled against a generated
# stub entry instead. Its own path, and the only one that writes that stub.
expect_rc 1 "project check --target tests still fails on a broken test body" \
  bash -c 'cd "$1" && "$2" check --target tests' _ "$T/project" "$COIL"
rm -f "$T/project/tests/broken_test.coil"
expect_rc 0 "project check --target tests passes once the corpus is clean" \
  bash -c 'cd "$1" && "$2" check --target tests' _ "$T/project" "$COIL"
# The entry is checked in that same pass, so prove it is still reported. Loading the
# test roots must not be able to displace the entry's own diagnostics.
cp "$T/project/src/main.coil" "$T/project/src/main.coil.bak"
printf '(module project)\n(defn main [] (-> i64) (bogus-fn 1))\n' > "$T/project/src/main.coil"
expect_out "undefined function 'bogus-fn'" "project check still reports a broken entry" \
  bash -c 'cd "$1" && "$2" check 2>&1' _ "$T/project" "$COIL"
mv "$T/project/src/main.coil.bak" "$T/project/src/main.coil"
expect_rc 0 "project fmt --check discovers owned sources" \
  bash -c 'cd "$1" && "$2" fmt --check' _ "$T/project" "$COIL"
expect_rc 0 "project lint understands test graphs without explicit assert imports" \
  bash -c 'cd "$1" && "$2" lint' _ "$T/project" "$COIL"
expect_rc 0 "coil verify runs the structured project verification pipeline" \
  bash -c 'cd "$1" && "$2" verify' _ "$T/project" "$COIL"
[ ! -e "$T/project/native/answer.c.o" ] \
  && ok "native objects do not dirty the source directory" \
  || bad "native objects do not dirty the source directory" "native/answer.c.o exists"
# Capture, then test — `find … | grep -q .` quits at the first path, and a `find`
# still walking the tree takes SIGPIPE, so under `set -o pipefail` the pipeline
# returns 141 and this reports "no source.d found" while the file exists. Same
# hazard as the ASan checks above.
depfiles=$(find "$T/project/.coil/build/native" -name source.d -type f)
[ -n "$depfiles" ] \
  && ok "native compilation records header depfiles under .coil/build" \
  || bad "native compilation records header depfiles under .coil/build" "no source.d found"

# `coil fuzz` is the one command that drives the linker ITSELF (clang, over the
# program's IR) instead of shelling out to a `coil build` child, so the manifest's
# link inputs have to arrive as plain linker arguments. It used to hand clang
# coil's own `--link-flag <tok>` spelling, which clang rejects outright, and left
# [cc] objects off the line entirely — every project with a [link] or [cc] section
# could build and test but never fuzz. The property below is that this project's
# native symbol resolves in the instrumented build too.
cat > "$T/project/tests/prop_test.coil" <<'EOF'
(module prop_test)
(import "coil.prop" :use *)
(extern project_answer :cc c [] (-> i64))
(defprop native-answer-is-constant [(n i64)] (= (project_answer) 42))
EOF
expect_out "1 passed" "coil fuzz links the manifest's [link] flags and [cc] objects" \
  bash -c 'cd "$1" && "$2" fuzz tests/prop_test.coil -n 200' _ "$T/project" "$COIL"

echo "== named test suites: [test.suites.<name>] =="
# The point of suites: a project can own tests that must NOT run on a bare `coil test`
# — live integration tests, tests that cost money, tests that take minutes. Membership
# is opt-OUT (`default = false`), and the ONLY way an opt-in suite runs is by name.
# Every assertion below is about that boundary holding.
mkdir -p "$T/suites/src" "$T/suites/tests/integration"
cat > "$T/suites/Coil.toml" <<'EOF'
[package]
name = "suites"
entry = "src/main.coil"
source-roots = ["src", "tests"]

[test.suites.unit]
roots = ["tests"]
suffixes = ["_test.coil"]

[test.suites.integration]
roots = ["tests/integration"]
suffixes = ["_integration.coil"]
default = false
EOF
printf '(module suites)\n(defn main [] (-> i64) 0)\n' > "$T/suites/src/main.coil"
printf '(module unit_test)\n(deftest unit-arith (assert-eq (+ 2 2) 4))\n' > "$T/suites/tests/unit_test.coil"
# The opt-in suite FAILS on purpose: any path that runs it without being asked turns red.
printf '(module live_integration)\n(deftest live-must-not-run (assert-eq 0 1))\n' \
  > "$T/suites/tests/integration/live_integration.coil"
"$COIL" fmt --write "$T/suites/src/main.coil" "$T/suites/tests/unit_test.coil" \
  "$T/suites/tests/integration/live_integration.coil" >/dev/null

expect_rc 0 "a bare coil test runs only the default suites" \
  bash -c 'cd "$1" && "$2" test' _ "$T/suites" "$COIL"
expect_rc 0 "coil verify does not reach an opt-in suite" \
  bash -c 'cd "$1" && "$2" verify' _ "$T/suites" "$COIL"
expect_rc 0 "coil check does not reach an opt-in suite" \
  bash -c 'cd "$1" && "$2" check' _ "$T/suites" "$COIL"
expect_rc 1 "--suite names the opt-in suite and actually runs it" \
  bash -c 'cd "$1" && "$2" test --suite integration' _ "$T/suites" "$COIL"
expect_rc 1 "--suite all runs every suite regardless of default" \
  bash -c 'cd "$1" && "$2" test --suite all' _ "$T/suites" "$COIL"
expect_out "unit:" "--list groups discovered files under their suite" \
  bash -c 'cd "$1" && "$2" test --list' _ "$T/suites" "$COIL"
expect_out "integration \[opt-in\]:" "--list marks a suite that a bare run would skip" \
  bash -c 'cd "$1" && "$2" test --list --suite all' _ "$T/suites" "$COIL"
# A default --list that leaked the opt-in suite would mean a bare run reaches it too.
(cd "$T/suites" && "$COIL" test --list 2>/dev/null) | grep -q integration \
  && bad "a default --list omits the opt-in suite" "integration appeared" \
  || ok "a default --list omits the opt-in suite"
expect_rc 1 "an explicit file runs whichever suite claims it" \
  bash -c 'cd "$1" && "$2" test tests/integration/live_integration.coil' _ "$T/suites" "$COIL"
expect_out "unit_test" "--suite is repeatable" \
  bash -c 'cd "$1" && "$2" test --list --suite unit --suite integration' _ "$T/suites" "$COIL"
expect_out "live_integration" "a selector narrows what the suites already chose" \
  bash -c 'cd "$1" && "$2" test --list --suite all live' _ "$T/suites" "$COIL"
# A typo'd suite name must not select nothing and report success.
expect_rc 2 "an unknown suite name is rejected, not silently empty" \
  bash -c 'cd "$1" && "$2" test --suite nope' _ "$T/suites" "$COIL"
expect_out "known: unit, integration" "the unknown-suite error lists the real suites" \
  bash -c 'cd "$1" && "$2" test --suite nope' _ "$T/suites" "$COIL"
expect_rc 2 "--suite without a name is rejected" \
  bash -c 'cd "$1" && "$2" test --suite' _ "$T/suites" "$COIL"
# Regression: discovery once sat INSIDE the argument loop, so every flag past the first
# re-ran the whole thing — `test --list --jobs 2` listed everything twice.
dups=$( (cd "$T/suites" && "$COIL" test --list --jobs 2 2>/dev/null) | sort | uniq -d )
[ -z "$dups" ] && ok "a second flag does not re-run discovery" \
  || bad "a second flag does not re-run discovery" "repeated lines: $dups"
# Suite discovery consumes its own flags, then forwards ordinary build flags to
# the generated one-file harness. This used to reject --debug-checks even though
# `coil test --help` advertises the shared build flags for test builds.
expect_rc 0 "project suites forward build flags to the generated harness" \
  bash -c 'cd "$1" && "$2" test --suite unit --debug-checks --no-run' _ "$T/suites" "$COIL"
# lint must still recognize a non-default suite's files as test files.
expect_rc 0 "lint understands test files in every suite, default or not" \
  bash -c 'cd "$1" && "$2" lint' _ "$T/suites" "$COIL"

# A bare [test] section keeps working untouched, and keeps its FLAT listing: a project
# that never wrote [test.suites.…] should see no suite headers appear under it. ($T/project
# above declares a plain [test] section.)
(cd "$T/project" && "$COIL" test --list 2>/dev/null) | grep -qE '^[a-z-]+:$' \
  && bad "a suite-less project keeps its flat --list" "a suite header appeared" \
  || ok "a suite-less project keeps its flat --list"

# Strict manifest validation extends to suites (tool-12): each of these is a typo that
# would otherwise silently change WHICH tests run.
suite_err() {
  printf '[package]\nname="s"\nentry="src/main.coil"\n\n%b' "$2" > "$T/suites/Coil.bad"
  expect_out "$1" "$3" bash -c 'cd "$1" && cp Coil.toml Coil.keep && cp Coil.bad Coil.toml
    "$2" test --list; rc=$?; cp Coil.keep Coil.toml; exit $rc' _ "$T/suites" "$COIL"
}
suite_err "reserved for .coil test --suite all" '[test.suites.all]\nroots=["tests"]\n' \
  "the suite name 'all' is reserved"
suite_err "reserved for the bare \[test\] section" '[test.suites.default]\nroots=["tests"]\n' \
  "the suite name 'default' is reserved"
suite_err "duplicate test suite" '[test.suites.u]\nroots=["tests"]\n[test.suites.u]\nroots=["tests"]\n' \
  "a duplicate suite is rejected"
suite_err "invalid test suite name" '[test.suites.bad name]\nroots=["tests"]\n' \
  "a suite name outside the identifier shape is rejected"
suite_err "default must be true or false" '[test.suites.u]\ndefault = yes\n' \
  "a non-boolean default is rejected"
suite_err "unknown key 'bogus' in \[test.suites.u\]" '[test.suites.u]\nbogus=["x"]\n' \
  "an unknown key inside a suite is rejected"
# A root the manifest NAMED must exist — otherwise a typo discovers nothing and reports
# a green run, which is the one failure mode a test runner must never have.
# Located at the roots KEY (line 6), not the section header above it.
suite_err "Coil.toml:6: test suite 'u': root 'tests/nope' does not exist" \
  '[test.suites.u]\nroots=["tests/nope"]\n' \
  "a declared root that does not exist is a located configuration error"
# The bare [test] section locates the same way, via its own roots key.
suite_err "Coil.toml:6: test suite 'default': root 'tests/nope' does not exist" \
  '[test]\nroots=["tests/nope"]\n' \
  "a legacy [test] root that does not exist is located at its roots key"
rm -f "$T/suites/Coil.bad" "$T/suites/Coil.keep"

mkdir -p "$T/bad-native/src" "$T/bad-native/native"
printf '[package]\nname="bad"\nentry="src/main.coil"\n[cc]\nsources=["native/bad.c"]\n' > "$T/bad-native/Coil.toml"
printf '(defn main [] (-> i64) 0)\n' > "$T/bad-native/src/main.coil"
printf 'this is not C;\n' > "$T/bad-native/native/bad.c"
expect_rc 1 "a failed C compiler stops the project build immediately" \
  bash -c 'cd "$1" && "$2" build' _ "$T/bad-native" "$COIL"

echo "== -g: dsymutil gathers symbols before temp cleanup; lldb maps source (tool-11) =="
# The arm64 backend now stamps __text-relative RELOCATIONS on every DWARF address (CU +
# subprogram low_pc, the line program's set_address). WITHOUT them dsymutil printed "No
# valid relocations found. Skipping." and produced an EMPTY dSYM — 0 line rows, "No source
# available" in lldb. The driver also runs dsymutil after a -g link. FAILS on the seed
# (it emits no relocations and never runs dsymutil -> no .dSYM, breakpoints don't resolve).
if [ "$HOST_OS" = Darwin ] && command -v dsymutil >/dev/null 2>&1; then
  cat > "$T/dbg.coil" <<'EOF'
(module dbg)
(defn addup [(x i64) (y i64)] (-> i64) (coil.primitive/iadd x y))
(defn main [] (-> i64) (addup 3 4))
EOF
  "$COIL" build "$T/dbg.coil" -g -o "$T/dbgx" >/dev/null 2>&1
  [ -d "$T/dbgx.dSYM" ] && ok "coil build -g gathers a .dSYM" \
                        || bad "coil build -g gathers a .dSYM" "no .dSYM (dsymutil skipped or not run)"
  [ ! -e "$T/dbgx.o" ]  && ok "coil build -g leaves no adjacent object" \
                         || bad "coil build -g object cleanup" "an adjacent .o remains"
  if command -v dwarfdump >/dev/null 2>&1; then
    n=$(dwarfdump --debug-line "$T/dbgx.dSYM/Contents/Resources/DWARF/dbgx" 2>/dev/null | grep -cE '^0x[0-9a-f]+ +[0-9]')
    [ "${n:-0}" -gt 0 ] && ok "the .dSYM line table has rows (was 0 = 'No source available')" \
                        || bad ".dSYM line rows" "0 rows — dsymutil skipped the object (no relocations)"
  fi
  # The temporary object is already gone, so lldb MUST use the .dSYM (the portable
  # artifact). On the seed there is no .dSYM, so lldb has nothing.
  if command -v lldb >/dev/null 2>&1; then
    bp=$(lldb "$T/dbgx" -o "breakpoint set --file dbg.coil --line 3" -o quit 2>&1)
    echo "$bp" | grep -qE 'Breakpoint 1: where = .*dbg\.coil:3' \
      && ok "lldb maps source from the .dSYM alone (no .o)" \
      || bad "lldb maps source from the .dSYM" "$(echo "$bp" | grep -iE 'breakpoint|pending' | head -1)"
  fi
else
  echo "  skip — dsymutil not on PATH (not a macOS toolchain host)"
fi

echo "== runtime-only manifest links stay out of metaprogram dylibs =="
mkdir -p "$T/runtime-link-project"
cat > "$T/runtime-link-project/Coil.toml" <<'EOF'
[project]
entry = "main.coil"

[link]
libs = ["coil_runtime_link_must_not_load"]
EOF
cat > "$T/runtime-link-project/main.coil" <<'EOF'
(module runtime-link.main)
(defn answer [] (-> Code) `42)
(defn main [] (-> i64) (- (answer) 42))
EOF
expect_rc 0 "manifest [link] libraries are not loaded into the compiler" \
  env COIL_META_JIT=0 "$COIL" check "$T/runtime-link-project/main.coil"

echo "== curl auto-link detection reads undefined symbols, not string bytes =="
cat > "$T/curl-name-string.coil" <<'EOF'
(module curl-name-string)
(import "coil.primitive" :use *)
(import "coil.slice" :as slice)
(extern puts :cc c [(ptr i8)] (-> i32))
(defn main [] (-> i64)
  (do (puts (slice/slice-data [u8] "curl_easy_init")) 0))
EOF
expect_rc 0 "a curl symbol name in ordinary data does not request bundled libcurl" \
  "$COIL" build "$T/curl-name-string.coil" -o "$T/curl-name-string"
expect_out '^curl_easy_init$' "the ordinary string program runs" "$T/curl-name-string"

echo "== comptime/const route through the compiled engine (mac-8; interp deletion step 1) =="
# The tree-walk interpreter is a strictly WEAKER sublanguage than a macro body: no
# generic calls, no sizeof/alignof/offsetof, no strings. Those sites now fold through
# the COMPILED metaprogram engine (real codegen) and the program runs. On the pre-mac-8
# seed the interpreter errors and `run` never yields the folded exit code — a tripwire.
printf '(defn main [] (-> i64) (comptime (coil.primitive/sizeof i64)))\n'                                  > "$T/ct_sizeof.coil"
expect_rc 8 "comptime (coil.primitive/sizeof i64) folds to 8 (interp can't)"        "$COIL" run "$T/ct_sizeof.coil"
printf '(defn id [T] [(x T)] (-> T) x)\n(defn main [] (-> i64) (comptime (id [i64] 7)))\n' > "$T/ct_generic.coil"
expect_rc 7 "comptime of a generic call folds to 7 (interp can't)"   "$COIL" run "$T/ct_generic.coil"
printf '(const SZ (coil.primitive/sizeof i64))\n(defn main [] (-> i64) SZ)\n'                              > "$T/ct_const.coil"
expect_rc 8 "(const NAME (coil.primitive/sizeof …)) folds to 8 (interp can't)"      "$COIL" run "$T/ct_const.coil"
printf '(defn main [] (-> i64) (comptime (do c"hi" 5)))\n'                                  > "$T/ct_str.coil"
expect_rc 5 "comptime using a c-string folds to 5 (interp can't)"    "$COIL" run "$T/ct_str.coil"
# NO REGRESSION: an aggregate comptime a MONOMORPHIC function builds still folds on the
# interpreter (no capability gap → the compiled hook never fires).
printf '(defstruct P [(x i64) (y i64)])\n(defn mk [] (-> P) (let [(mut p) (coil.primitive/zeroed P)] (do (coil.primitive/store! (coil.primitive/field p x) 3) (coil.primitive/store! (coil.primitive/field p y) 4) (coil.primitive/load p))))\n(defn main [] (-> i64) (let [q (comptime (mk))] (coil.primitive/iadd (coil.primitive/load (coil.primitive/field q x)) (coil.primitive/load (coil.primitive/field q y)))))\n' > "$T/ct_agg.coil"
expect_rc 7 "aggregate comptime still folds (interp path, no regression)" "$COIL" run "$T/ct_agg.coil"
# interp deletion step 3a: an aggregate/string comptime the INTERPRETER can't evaluate
# (a capability gap — sizeof, a generic call) but which returns a struct/string now folds
# on the COMPILED engine too, via a write-through (ptr T) thunk + a C-layout readback (the
# same natural layout both backends emit). On the seed (no aggregate readback) the interp
# error stands and `run` never yields the folded exit code.
printf '(defstruct L [(sz i64) (al i64)])\n(defn main [] (-> i64) (let [s (comptime (let [p (coil.primitive/alloc-stack L)] (coil.primitive/store! (coil.primitive/field p sz) (coil.primitive/sizeof i64)) (coil.primitive/store! (coil.primitive/field p al) (coil.primitive/sizeof (ptr i8))) (coil.primitive/load p)))] (+ (coil.primitive/field s sz) (coil.primitive/field s al))))\n' > "$T/ct_agg_sizeof.coil"
expect_rc 16 "aggregate (struct) comptime via sizeof reads back on the compiled engine (interp can't)" "$COIL" run "$T/ct_agg_sizeof.coil"
printf '(module app)\n(import "coil.slice" :use *)\n(defn pick [T] [(s (slice u8))] (-> (slice u8)) s)\n(defn main [] (-> i64) (let [s (comptime (pick [i64] "hello"))] (+ (slice-len s) (coil.primitive/cast i64 (coil.primitive/load (coil.primitive/index (slice-data s) 0))))))\n' > "$T/ct_agg_str.coil"
expect_rc 109 "string comptime via a generic call reads back on the compiled engine (interp can't)" "$COIL" run "$T/ct_agg_str.coil"
# interp deletion step 2: a SUM-returning comptime with a capability gap now reads back.
# The reader takes the 4-byte tag at offset 0 (bytes 4..7 are padding the arm64 backend
# leaves UNINITIALISED, so reading 8 would select a variant from stack garbage) and the
# selected variant's fields at natural offsets from offset 8.
printf '(defsum Opt (Yes [(v i64)]) (No []))\n(defn main [] (-> i64) (let [o (comptime (Yes (coil.primitive/sizeof i64)))] (match o (Yes [v] v) (No [] 0))))\n' > "$T/ct_agg_sum.coil"
expect_rc 8 "sum comptime via sizeof reads back on the compiled engine (interp can't)" "$COIL" run "$T/ct_agg_sum.coil"
# ...and the NULLARY variant, whose payload is unread — this is the case that reading an
# 8-byte tag would corrupt, since nothing writes over the padding.
printf '(defsum Opt (Yes [(v i64)]) (No []))\n(defn main [] (-> i64) (let [o (comptime (if (coil.primitive/icmp-gt (coil.primitive/sizeof i64) 0) (No) (Yes 1)))] (match o (Yes [v] v) (No [] 3))))\n' > "$T/ct_agg_sum0.coil"
expect_rc 3 "nullary-variant sum comptime reads back (tag is 4 bytes, not 8)" "$COIL" run "$T/ct_agg_sum0.coil"
# A shape the reader still refuses, and MUST: CtVal has no pointer variant, so a
# compile-time address cannot become a literal. The interpreter cannot represent one
# either, so nothing regresses — but it must fail loudly rather than fold something wrong.
printf '(defstruct HasPtr [(p (ptr i8)) (n i64)])\n(defn main [] (-> i64) (let [h (comptime (let [q (coil.primitive/alloc-stack HasPtr)] (coil.primitive/store! (coil.primitive/field q n) (coil.primitive/sizeof i64)) (coil.primitive/load q)))] (coil.primitive/load (coil.primitive/field h n))))\n' > "$T/ct_agg_ptr.coil"
expect_rc 1 "raw-pointer aggregate comptime declines cleanly (no silently-wrong fold)" "$COIL" run "$T/ct_agg_ptr.coil"

echo "== comptime reaching a NATIVE library: the in-memory loader falls back to a real link =="
# The in-memory JIT resolves undefined symbols with dlsym(RTLD_DEFAULT), so it can only
# reach code already inside the compiler process. A comptime expression that calls into a
# library the PROGRAM links therefore failed outright with
#   jit: undefined symbol '_x' is not present in the compiler process
# even though the very same code builds and runs as an executable. dlopen cannot rescue
# it either, because the library is typically a STATIC ARCHIVE. The fix is to retry
# through the dylib path, which already links with the program's own --link-flags.
mkdir -p "$T/ffi"
printf 'long gate_native_answer(void) { return 42; }\n' > "$T/ffi/lib.c"
cc -c "$T/ffi/lib.c" -o "$T/ffi/lib.o" && ar rcs "$T/ffi/libgatenative.a" "$T/ffi/lib.o"
cat > "$T/ffi/prog.coil" <<'EOF'
(module ffiprog)
(extern gate_native_answer :cc c [] (-> i64))
(defn wrapped [] (-> i64) (gate_native_answer))
(defn main [] (-> i64) (comptime (wrapped)))
EOF
cat > "$T/ffi/ffi_test.coil" <<'EOF'
(module ffitest)
(import "coil.assert" :use *)
(extern gate_native_answer :cc c [] (-> i64))
(defn wrapped [] (-> i64) (gate_native_answer))
(defn folded [] (-> i64) (comptime (wrapped)))
(deftest comptime-reaches-a-native-library (assert-eq (folded) 42))
(deftest runtime-reaches-a-native-library (assert-eq (wrapped) 42))
EOF
if [ "$HOST_OS" = Darwin ]; then
  # The reported shape end to end: `coil test`, a STATIC ARCHIVE force-loaded (which
  # dlopen could never have served — hence a link, not a load), one deftest that folds at
  # comptime and one that calls at runtime.
  expect_out "2 passed; 0 failed" "coil test: a deftest reaches a native library at comptime AND at runtime" \
    "$COIL" test "$T/ffi/ffi_test.coil" --link-flag "-Wl,-force_load,$T/ffi/libgatenative.a"
  # Separate fix, separate place: only `build` forwarded --link-flag to the comptime
  # link, so `check`/`emit-ir` accepted the flag and ignored it — failing on a program
  # `build` compiles fine.
  expect_rc 0 "coil check applies --link-flag to the comptime link" \
    "$COIL" check "$T/ffi/prog.coil" --link-flag "-L$T/ffi" --link-flag -lgatenative
else
  ok "native-library comptime fallback (macOS/arm64 in-memory loader only) — skipped on $HOST_OS"
fi

echo "== a metaprogram's unquoted bytes are COPIED, not borrowed =="
# `~<slice>` used to keep the METAPROGRAM's pointer inside the Sexp, and the compiler
# read it at codegen — long after the generator returned. A slice over a string literal
# survived (the metaprogram image stays mapped); a slice over a stack array in the
# generator was a dead frame by then: `coil check` passed and `coil build` died with
# SIGSEGV and no diagnostic. The quiet version of that is a miscompile.
cat > "$T/unq_stack.coil" <<'EOF'
(module unqstack)
(import "coil.primitive" :as primitive)
(import "coil.slice" :use *)
(defn gen [] (-> Code)
  (let [(mut s) (zeroed (array u8 4))]
    (store! (index (mut s) 0) (cast u8 \a))
    (store! (index (mut s) 1) (cast u8 \b))
    (store! (index (mut s) 2) (cast u8 \c))
    (store! (index (mut s) 3) (cast u8 \d))
    ; hygiene: lit is a caller-visible generated declaration used by main below.
    `(defn ~(primitive/syntax->datum `lit) [] (-> (slice u8)) ~(slice-new [u8] (index (mut s) 0) 4))))
(meta (gen))
(defn main [] (-> i64) (slice-len (lit)))
EOF
expect_rc 4 "a slice over the GENERATOR'S STACK unquotes correctly (was SIGSEGV)" \
  "$COIL" run "$T/unq_stack.coil"
cat > "$T/unq_static.coil" <<'EOF'
(module unqstatic)
(import "coil.primitive" :as primitive)
(import "coil.slice" :use *)
(defn gen [] (-> Code)
  ; hygiene: lit is a caller-visible generated declaration used by main below.
  `(defn ~(primitive/syntax->datum `lit) [] (-> (slice u8)) ~(subslice "hello" 0 4)))
(meta (gen))
(defn main [] (-> i64) (slice-len (lit)))
EOF
expect_rc 4 "a slice over static bytes still unquotes (no regression)" \
  "$COIL" run "$T/unq_static.coil"

echo "== pipeline dumps resolve project namespaces, like check/build =="
# `expand` (and the dump-* commands) build their LS in expander.coil, which never built
# the namespace index the driver's own pipeline entries build — so an import that `check`
# resolved fine was "not found in the project" under `expand`, the one command you most
# want when debugging a code generator.
mkdir -p "$T/nsproj/src"
cat > "$T/nsproj/Coil.toml" <<'EOF'
[package]
name = "nsproj"
entry = "src/main.coil"
source-roots = ["src"]
EOF
printf '(module nsproj.lib)\n(defn tag [] (-> i64) 7)\n' > "$T/nsproj/src/lib.coil"
printf '(module nsproj.app)\n(import "nsproj.lib" :use *)\n(defn main [] (-> i64) (tag))\n' > "$T/nsproj/src/app.coil"
expect_rc 0 "coil expand resolves a project namespace from Coil.toml source-roots" \
  bash -c 'cd "$1" && "$2" expand src/app.coil >/dev/null' _ "$T/nsproj" "$COIL"
expect_rc 0 "coil check agrees (the two must not disagree about the same import)" \
  bash -c 'cd "$1" && "$2" check src/app.coil' _ "$T/nsproj" "$COIL"

echo "== C size types are target-width: the prelude's size_t/ssize_t are i32 on wasm32 =="
# `usize`/`isize` (a C machine word: size_t/ssize_t/long) are i32 on wasm32 (ILP32) and
# i64 on LP64. The prelude's write/read/malloc size args use `isize`, so on wasm32 they
# emit i32 — matching the real C ABI. On a pre-usize compiler (the seed) they are i64.
# (Checked via emit-ir, not a full wasm build, because the C0/C1 wasm finalizer that lets
# such a module link is not on this branch — the LLVM IR is what carries the width.)
printf '(defn main [] (-> i64) (println "hi") 0)\n' > "$T/sizet.coil"
w_native=$("$COIL" emit-ir "$T/sizet.coil" 2>/dev/null | grep -oE 'declare i(64|32) @write\([^)]*\)' | head -1)
w_wasm=$("$COIL" emit-ir "$T/sizet.coil" --target wasm32-unknown-unknown 2>/dev/null | grep -oE 'declare i(64|32) @write\([^)]*\)' | head -1)
echo "$w_native" | grep -q 'i64 @write(i32, ptr, i64)' \
  && ok "write is (int fd=i32, ptr, size_t=i64) -> ssize_t=i64 on native"    || bad "native write width" "got: $w_native"
echo "$w_wasm"   | grep -q 'i32 @write(i32, ptr, i32)' \
  && ok "write's fd stays i32 and size_t/ssize_t narrow to i32 on wasm32" || bad "wasm32 write width (fd/usize/isize)" "got: $w_wasm"

echo "== A1: a wasm32 module exports __stack_pointer so a host longjmp can restore SP =="
# When the object uses the shadow stack (an alloc-stack address escapes to a C extern),
# the C0 finalizer defines the mutable i32 stack-pointer global. It must ALSO export it —
# otherwise a host-implemented longjmp/panic landing pad (wasm32 has no setjmp) cannot
# restore SP on unwind, and every panic strands the frames (measured ~111 B leaked/panic).
# FAILS on the seed (it exports only main/memory/__heap_base); PASSES here. Needs wasm-tools.
if command -v wasm-tools >/dev/null 2>&1; then
  printf '(extern sink :cc c [(ptr i8)] (-> void))\n(defstruct Big [(a i64) (b i64) (c i64)])\n(defn use-stack [(n i64)] (-> i64) (let [p (coil.primitive/alloc-stack Big)] (do (coil.primitive/store! (coil.primitive/field p a) n) (sink (coil.primitive/cast (ptr i8) p)) (coil.primitive/load (coil.primitive/field p a)))))\n(defn main [] (-> i64) (use-stack 3))\n' > "$T/sp.coil"
  if "$COIL" build "$T/sp.coil" --target wasm32-unknown-unknown -o "$T/sp.wasm" >/dev/null 2>&1; then
    sp_line=$(wasm-tools print "$T/sp.wasm" 2>/dev/null | grep '(export "__stack_pointer"')
    [ -n "$sp_line" ] && ok "wasm32 build exports __stack_pointer ($sp_line)" \
      || bad "wasm32 __stack_pointer export" "absent — host longjmp cannot restore SP"
  else
    bad "wasm32 __stack_pointer export" "shadow-stack build failed"
  fi
else
  echo "  (skip: wasm-tools not on PATH)"
fi

echo "== gen-10: monomorphization instantiation lookup is O(1) (hash-indexed), not a linear scan =="
# Mono's dedupe SETS (queued-structs/sums/funcs), the output insert-or-replace-by-name
# (out-*-idx), and the instantiation-origin map (io-index) are all hash-indexed, so each is
# an O(1) lookup. Before gen-10 they were linear scans of lists that grow with EVERY
# instantiation, making mono ~O(n^1.7) while its IR output is exactly linear (a reported 600
# instantiations = 14s before LLVM even starts). The fix is behaviour-preserving — gate-full
# proves the emitted IR is byte-identical — so the ONLY observable is SPEED.
#
# TEETH (perf, so it must be a timing check): this measures how $COIL's OWN cost SCALES as the
# instantiation count grows, rather than racing it against a baseline binary. Racing cannot work
# here: the only pre-gen-10 binary in the tree was the committed seed, and refreshing the seed —
# which every change to the language the compiler is written in eventually forces — folds the fix
# INTO the baseline, so the comparison silently degrades to seed-vs-seed = 1.00x and fails
# forever. A scaling check has no baseline to go stale.
#
# The two probes hold the struct COUNT fixed and only TRIPLE the number of distinct
# instantiations, so parse/check/codegen cost is identical between them and mono is the only
# term that grows. Measured on this corpus: 3x the work costs ~3.5x with the hash lookups and
# ~7.5x with the old linear scans. The threshold sits between, far enough from both that
# scheduler noise cannot reach it, and both runs are best-of-2 minima under the same load.
if [ -x /usr/bin/time ]; then
  # One generic `hub` fans out to 250 generic structs; calling it at N distinct array types
  # forces 250*N DISTINCT struct instantiations (the O(n^2) regime) while keeping check/codegen
  # cheap (the structs have no bodies) so mono dominates what is being timed.
  mono_probe() {   # <n-array-types> <out-path>
    {
      for j in $(seq 1 250); do printf '(defstruct S%s [T] [(v T)])\n' "$j"; done
      printf '(defn hub [T] [] (-> i64) (do'
      for j in $(seq 1 250); do printf ' (coil.primitive/zeroed (S%s T))' "$j"; done
      printf ' 0))\n(defn main [] (-> i64)\n'
      for k in $(seq 1 "$1"); do printf '  (hub [(array i8 %s)])\n' "$k"; done
      printf '  0)\n'
    } > "$2"
  }
  mono_probe 6  "$T/mono_small.coil"     # 1500 instantiations
  mono_probe 18 "$T/mono_large.coil"     # 4500 — exactly 3x the mono work
  # min wall-clock of 2 `emit-ir` runs; empty string on a compile failure (guarded below).
  monotime() {
    local best="" t
    for _ in 1 2; do
      t=$( { /usr/bin/time -p "$COIL" emit-ir "$1" >/dev/null; } 2>&1 | awk '/^real/{print $2}')
      [ -n "$t" ] || { best=""; break; }
      best=$(awk -v a="$best" -v b="$t" 'BEGIN{ if (a=="" || b+0<a+0) print b; else print a }')
    done
    printf '%s' "$best"
  }
  t_small=$(monotime "$T/mono_small.coil"); t_large=$(monotime "$T/mono_large.coil")
  growth=$(awk -v s="$t_small" -v l="$t_large" 'BEGIN{ if (s+0>0) printf "%.2f", l/s; else printf "?" }')
  if [ -z "$t_small" ] || [ -z "$t_large" ]; then
    bad "gen-10 mono lookup is O(1) (near-linear in instantiation count)" \
        "emit-ir failed on the perf probe (small='$t_small' large='$t_large')"
  elif awk -v s="$t_small" -v l="$t_large" 'BEGIN{ exit !(s+0 > 0 && l < s*5.0) }'; then
    ok "gen-10 mono lookup is O(1) — 3x the instantiations costs ${growth}x the time (${t_small}s -> ${t_large}s)"
  else
    bad "gen-10 mono lookup is O(1) (near-linear in instantiation count)" \
        "3x the instantiations must cost <5.0x the time (a scan costs ~7.5x); got ${growth}x (${t_small}s -> ${t_large}s)"
  fi
else
  echo "  (skip: no /usr/bin/time for the gen-10 perf probe)"
fi

echo "== focused guide lookup =="
expect_out '^  tests[[:space:]]+deftest' "guide: no argument prints the compact topic index" "$COIL" guide
expect_out '^## Tests, assertions, debug checks' "guide: canonical topic prints only its section" "$COIL" guide tests
expect_out 'defstruct Point' "guide: a topic alias resolves to its canonical section" "$COIL" guide struct
expect_out 'primitive/zeroed T' "guide: search returns a contextual excerpt" "$COIL" guide --search zeroed
expect_out 'primitive/cast i64 f' "guide: multiword search tolerates ordinary word endings" "$COIL" guide --search "f64 conversion"
expect_out '^  structs —' "guide: broad concept search ranks the focused structs topic first" \
  "$COIL" guide --search "array struct field match"
expect_out '^  test-suites —' "guide: project-test vocabulary routes to test-suites" \
  "$COIL" guide --search "test roots suffixes import project module"
expect_out '^  match —' "guide: enum/variant vocabulary routes to match" \
  "$COIL" guide --search "defsum match enum"
expect_out '^  memory —' "guide: mutability vocabulary routes to memory" \
  "$COIL" guide --search "mutable parameter mut function"
expect_out '^## Structs' "guide: multiple direct topics print the first requested section" \
  "$COIL" guide structs match
expect_out '^## Sum types' "guide: multiple direct topics print subsequent sections" \
  "$COIL" guide structs match
combined_float=$("$COIL" guide types floats 2>&1)
combined_number_headings=$(printf '%s\n' "$combined_float" | awk '/^## Numbers, bool, casts$/ { n++ } END { print n+0 }')
[ "$combined_number_headings" = 1 ] \
  && ok "guide: combined topics deduplicate shared source fragments" \
  || bad "guide: combined topics deduplicate shared source fragments" "Numbers section appeared $combined_number_headings times"
expect_rc 1 "guide: at most three direct topics are accepted" "$COIL" guide tests modules structs match
guide_all=$("$COIL" guide --all 2>&1); guide_all_rc=$?
case "$guide_all" in
  '# The Coil Language'*)
    [ "$guide_all_rc" = 0 ] \
      && ok "guide: --all preserves the complete reference" \
      || bad "guide: --all preserves the complete reference" "want rc=0 got rc=$guide_all_rc" ;;
  *) bad "guide: --all preserves the complete reference" "output did not begin with the guide title" ;;
esac
expect_rc 1 "guide: an unknown topic is rejected instead of ignored" "$COIL" guide testt
expect_out 'Closest topics:' "guide: an unknown topic suggests alternatives" "$COIL" guide testt
expect_rc 1 "guide: --search requires a query" "$COIL" guide --search

echo "== doc comments (;;;): coil doc + the code-doc comptime op =="
# A `;;;` block DIRECTLY above a definition is its documentation; `;` and `;;` are
# ordinary comments and must NOT become docs. Both the `doc` subcommand and the
# `(coil.primitive/code-doc NODE)` code op read the same rule off the source text.
# FAILS on the seed (no `doc` subcommand, `code-doc` is an undefined function).
mkdir -p "$T/docs"
cat > "$T/docs/m.coil" <<'EOF'
(module shapes)

;;; A point in 2D space.
(defstruct Point [(x i64) (y i64)])

;;; Add two numbers together.
;;; Returns their sum.
(defn add [(a i64) (b i64)] (-> i64) (coil.primitive/iadd a b))

;; internal helper, deliberately NOT documentation — two semicolons is not enough
(defn helper [] (-> i64) 0)
EOF
expect_rc  0 "doc: exits 0 on a documented module"          "$COIL" doc "$T/docs/m.coil"
expect_out '^coil\.arraylist$' "namespaces: lists bundled namespaces" "$COIL" namespaces
expect_out '^## helper ' "namespace: lists undocumented definitions too" "$COIL" namespace "$T/docs/m.coil"
expect_out '^# coil\.arraylist' "namespace: resolves a bundled namespace globally" "$COIL" namespace coil.arraylist
expect_out '^## fadd ' "namespace: --name returns one exact definition" "$COIL" namespace coil.primitive --name fadd
expect_out '^## fadd ' "namespace: --search filters definitions" "$COIL" namespace coil.primitive --search fadd
namespace_broad=$("$COIL" namespace coil.primitive --search defprimitive 2>&1)
namespace_broad_count=$(printf '%s\n' "$namespace_broad" | awk '/^## / { n++ } END { print n+0 }')
[ "$namespace_broad_count" = 10 ] \
  && ok "namespace: broad search is bounded to ten definitions" \
  || bad "namespace: broad search is bounded to ten definitions" "want 10 results, got $namespace_broad_count"
expect_rc 1 "namespace: --name rejects a missing definition" "$COIL" namespace coil.primitive --name no-such-primitive
expect_rc 1 "namespace: malformed filters are rejected" "$COIL" namespace coil.primitive --search
expect_out '^# shapes'          "doc: prints the module name"           "$COIL" doc "$T/docs/m.coil"
expect_out 'Add two numbers together.' "doc: prints a fn doc"           "$COIL" doc "$T/docs/m.coil"
expect_out 'Returns their sum.'        "doc: joins a multi-line doc"    "$COIL" doc "$T/docs/m.coil"
expect_out 'A point in 2D space.'      "doc: documents a defstruct too" "$COIL" doc "$T/docs/m.coil"
# the signature is the HEADER only — the body must not leak into the docs
expect_out '\(defn add \[\(a i64\) \(b i64\)\] \(-> i64\)\)' "doc: shows the signature without the body" \
  "$COIL" doc "$T/docs/m.coil"
# non-vacuous: the documented `add` MUST be listed while the `;;`-commented `helper` must not
_dout=$("$COIL" doc "$T/docs/m.coil" 2>&1)
if echo "$_dout" | grep -q '## add' && ! echo "$_dout" | grep -q 'helper'; then
  ok "doc: a two-semicolon comment is NOT a doc (add listed, helper not)"
else
  bad "doc: a two-semicolon comment is NOT a doc (add listed, helper not)" "got: $_dout"
fi
# (coil.primitive/code-doc NODE) sees the same doc from a checker, and "" where there is none
cat > "$T/docs/op.coil" <<'EOF'
(module app)

;;; Documented on purpose.
(defn add [(a i64) (b i64)] (-> i64) (coil.primitive/iadd a b))

;; not a doc
(defn plain [] (-> i64) 0)

(defn doc-report [(prog Code)] (-> Code)
  (let [(mut m) 0 nm (coil.primitive/code-count prog)]
    (loop (if (coil.primitive/icmp-ge (coil.primitive/load m) nm) (break)
      (do (let [mod (coil.primitive/code-nth prog (coil.primitive/load m)) nf (coil.primitive/code-count mod) (mut i) 1]
            (if (if (coil.primitive/icmp-gt (coil.primitive/code-count mod) 1) (coil.primitive/code-from-user? (coil.primitive/code-nth mod 1)) false)
              (loop (if (coil.primitive/icmp-ge (coil.primitive/load i) nf) (break)
                (do (let [form (coil.primitive/code-nth mod (coil.primitive/load i))] (coil.primitive/warn form (coil.primitive/code-doc form)))
                    (coil.primitive/store! i (coil.primitive/iadd (coil.primitive/load i) 1)))))
              0))
          (coil.primitive/store! m (coil.primitive/iadd (coil.primitive/load m) 1)))))
    `0))
(checker doc-report)

(defn main [] (-> i64) (add 1 2))
EOF
expect_out 'warning: Documented on purpose\.' "code-doc: a checker reads a definition's doc" \
  "$COIL" run "$T/docs/op.coil"
expect_rc 3 "code-doc: the program still builds and runs"  "$COIL" run "$T/docs/op.coil"

# ── `cond` with `:else`, and `coil lint` (coil.primitive/report / --diff / --fix) ────────────
# The fix half of a linter writes to your source, so its contract is exactly the kind
# of thing that has to be gated: a fix must preserve behaviour, be idempotent, never
# delete a comment, and revert itself if it produces code that does not compile.
mkdir -p "$T/lint"
cat > "$T/lint/star-provider.coil" <<'EOF'
(module star-provider)
(export foo bar)
(defn foo [] (-> i64) 42)
(defn bar [] (-> i64) 7)
(defn hidden [] (-> i64) 99)
EOF
cat > "$T/lint/star-target.coil" <<'EOF'
(module star-target)
(import "star-provider" :as provider :use *)
(defn main [] (-> i64) (foo))
EOF
expect_out '^0$' "no-star-imports: not enforced by default" \
  sh -c "\"$COIL\" lint \"$T/lint/star-target.coil\" 2>&1 | grep -c 'wildcard import'"
expect_out '^1$' "no-star-imports: opt-in checker reports wildcard imports" \
  sh -c "\"$COIL\" lint \"$T/lint/star-target.coil\" --use coil.lint.no-star-imports 2>&1 | grep -c 'wildcard import'"
"$COIL" lint "$T/lint/star-target.coil" --use coil.lint.no-star-imports --fix >/dev/null 2>&1
expect_out ':as provider :use \[foo bar\]' \
  "no-star-imports: fix preserves other clauses and uses explicit exports" cat "$T/lint/star-target.coil"
expect_rc 42 "no-star-imports: fixed program behaves identically" "$COIL" run "$T/lint/star-target.coil"
cp "$T/lint/star-target.coil" "$T/lint/star-target.fixed"
"$COIL" lint "$T/lint/star-target.coil" --use coil.lint.no-star-imports --fix >/dev/null 2>&1
cmp -s "$T/lint/star-target.coil" "$T/lint/star-target.fixed" \
  && ok "no-star-imports: fix is idempotent" || bad "no-star-imports: fix is idempotent" "the file changed"

cat > "$T/lint/cond.coil" <<'EOF'
(defn pick [(x i64)] (-> i64)
  (cond (= x 1) 10
        (= x 2) 20
        :else   7))
(defn old [(x i64)] (-> i64)
  (cond (= x 1) 10
        7))
(defn main [] (-> i64) (+ (pick 9) (old 9)))
EOF
expect_rc 14 "cond: :else is the fallback, and the flat trailing else still works" \
  "$COIL" run "$T/lint/cond.coil"

cat > "$T/lint/target.coil" <<'EOF'
(module app)
(defn classify [(x i64)] (-> i64)
  (if (= x 1)
      100
      (if (= x 2)
          200
          (if (= x 3)
              300
              999))))
(defn two-armed [(x i64)] (-> i64)
  (if (< x 0) -1 (if (> x 0) 1 0)))
(defn already [(x i64)] (-> i64)
  (cond (= x 1) 1
        (= x 2) 2
        (= x 3) 3
        9))
(defn commented [(x i64)] (-> i64)
  (if (= x 1)
      1
      (if (= x 2)
          ; a comment between a test and its body
          2
          (if (= x 3) 3 0))))
(defn main [] (-> i64)
  (+ (classify 3) (+ (two-armed -5) (+ (already 9) (commented 2)))))
EOF
cp "$T/lint/target.coil" "$T/lint/target.orig"

expect_rc 54 "lint: the target program runs before any fix"   "$COIL" run "$T/lint/target.coil"
expect_out 'help: try: \(cond \(= x 1\) 100' "lint: reports the chain with a help line" \
  "$COIL" lint "$T/lint/target.coil" --use condlint
# The lint reports the 3-test chain and the commented one — but NOT the two-armed if,
# and NOT the `cond` the author wrote (which is nested ifs by the time a checker sees it).
expect_out '^2$' "lint: flags the two hand-written chains and nothing else" \
  sh -c "\"$COIL\" lint \"$T/lint/target.coil\" --use condlint 2>&1 | grep -c 'nested ifs'"
cmp -s "$T/lint/target.coil" "$T/lint/target.orig" \
  && ok "lint: reporting writes nothing" || bad "lint: reporting writes nothing" "the file changed"

expect_out '^\+  \(cond \(= x 1\) 100' "lint --diff: prints the patch" \
  sh -c "\"$COIL\" lint \"$T/lint/target.coil\" --use condlint --diff 2>/dev/null"
cmp -s "$T/lint/target.coil" "$T/lint/target.orig" \
  && ok "lint --diff: writes nothing" || bad "lint --diff: writes nothing" "the file changed"

"$COIL" lint "$T/lint/target.coil" --use condlint --fix >/dev/null 2>&1
expect_out 'cond \(= x 1\) 100 \(= x 2\) 200 \(= x 3\) 300 :else 999' \
  "lint --fix: rewrote the chain as a cond with :else" cat "$T/lint/target.coil"
# The comment sits in the GAP between two nodes, the one thing no Code value records.
# The renderer carries it across, so a commented chain is fixed like any other rather
# than being refused (or, worse, rewritten with the comment silently gone).
expect_out 'cond \(= x 1\) 1$' \
  "lint --fix: rewrote the commented chain too" cat "$T/lint/target.coil"
expect_out '; a comment between a test and its body' \
  "lint --fix: carried the comment across the rewrite" cat "$T/lint/target.coil"
expect_rc 54 "lint --fix: the program still behaves identically" "$COIL" run "$T/lint/target.coil"
cp "$T/lint/target.coil" "$T/lint/target.fixed"
"$COIL" lint "$T/lint/target.coil" --use condlint --fix >/dev/null 2>&1
cmp -s "$T/lint/target.coil" "$T/lint/target.fixed" \
  && ok "lint --fix: idempotent" || bad "lint --fix: idempotent" "a second --fix changed the file"

# Every awkward place a comment can sit in an `if` staircase, in one file. Each one
# lands in a gap the rewrite closes, so each one is a chance to lose the author's
# text: right after the head, at the end of a body line, stacked several deep, and
# alone before the closing parens. The last function has a `;` INSIDE a string, which
# is not a comment and must not be treated as one.
cat > "$T/lint/comments.coil" <<'EOF'
(module comments)
(defn a [(x i64)] (-> i64)
  (if ; leading, right after the head
      (= x 1)
      10 ; trailing on the body line
      (if (= x 2)
          20
          (if (= x 3)
              30
              ; alone before the closing parens
              40))))
(defn b [(x i64)] (-> i64)
  (if (= x 1)
      1
      ; first line
      ; second line
      ;; even a doc-style one
      (if (= x 2)
          2
          (if (= x 3) 3 4))))
(defn s [(x i64)] (-> (slice u8))
  (if (= x 1) "a; b" (if (= x 2) "c; d" (if (= x 3) "e" "f"))))
(defn main [] (-> i64)
  (+ (a 3) (b 2)))
EOF
cp "$T/lint/comments.coil" "$T/lint/comments.orig"
expect_rc 32 "lint --fix (comments): the program runs before the fix" \
  "$COIL" run "$T/lint/comments.coil"
expect_out '^0$' "lint --fix (comments): no fix is refused over a comment" \
  sh -c "\"$COIL\" lint \"$T/lint/comments.coil\" --use condlint --fix 2>&1 | grep -c 'drop a comment'"
expect_rc 32 "lint --fix (comments): the program behaves identically after" \
  "$COIL" run "$T/lint/comments.coil"
expect_out '^0$' "lint --fix (comments): no nested-if chain is left" \
  sh -c "\"$COIL\" lint \"$T/lint/comments.coil\" --use condlint 2>&1 | grep -c 'nested ifs'"
# Every comment the author wrote is still in the file, byte for byte.
miss=0
while IFS= read -r c; do
  grep -qF "$c" "$T/lint/comments.coil" || { miss=$((miss+1)); echo "         missing: $c"; }
done <<'EOF'
; leading, right after the head
; trailing on the body line
; alone before the closing parens
; first line
; second line
;; even a doc-style one
EOF
[ "$miss" = 0 ] && ok "lint --fix (comments): every comment survived the rewrite" \
  || bad "lint --fix (comments): every comment survived the rewrite" "$miss comment(s) lost"
# A `;` inside a string is not a comment: that chain has nothing to carry, so it stays
# flat on one line instead of being broken up as a commented one would be.
expect_out 'cond \(= x 1\) "a; b" \(= x 2\) "c; d" \(= x 3\) "e" :else "f"' \
  "lint --fix (comments): a ';' inside a string is not treated as a comment" \
  cat "$T/lint/comments.coil"
cp "$T/lint/comments.coil" "$T/lint/comments.fixed"
"$COIL" lint "$T/lint/comments.coil" --use condlint --fix >/dev/null 2>&1
cmp -s "$T/lint/comments.coil" "$T/lint/comments.fixed" \
  && ok "lint --fix (comments): idempotent" \
  || bad "lint --fix (comments): idempotent" "a second --fix changed the file"
# What --fix writes is what `coil fmt` would write: a fixed file needs no reformatting.
"$COIL" fmt --check "$T/lint/comments.coil" >/dev/null 2>&1 \
  && ok "lint --fix (comments): the result is already fmt-clean" \
  || bad "lint --fix (comments): the result is already fmt-clean" "coil fmt would rewrite it"

# A rule whose fix does not compile must leave the file byte-identical. Fail-closed is
# the whole reason --fix is allowed near anyone's source.
cat > "$T/lint/badrule.coil" <<'EOF'
(module badrule)
(defn br-walk [(f Code)] (-> Code)
  (if (coil.primitive/code-list? f)
      (if (coil.primitive/icmp-gt (coil.primitive/code-count f) 0)
          (do (if (coil.primitive/code-eq (coil.primitive/code-nth f 0) `+)
                  (do (coil.primitive/suggest f "nonsense" `(no-such-function ~(coil.primitive/code-nth f 1) ~(coil.primitive/code-nth f 2))) 0)
                  0)
              (br-kids f 0 (coil.primitive/code-count f)))
          `0)
      `0))
(defn br-kids [(f Code) (i i64) (n i64)] (-> Code)
  (if (coil.primitive/icmp-ge i n) `0 (do (br-walk (coil.primitive/code-nth f i)) (br-kids f (coil.primitive/iadd i 1) n))))
(defn br-forms [(m Code) (i i64) (n i64)] (-> Code)
  (if (coil.primitive/icmp-ge i n) `0 (do (br-walk (coil.primitive/code-nth m i)) (br-forms m (coil.primitive/iadd i 1) n))))
; Ask "did the user write this?" of EVERY form, not just the first. A module
; record also carries its (import …) forms, which come from the import machinery
; and answer false — so sampling form 1 skips any module that opens with an
; import, silently.
(defn br-any-user? [(m Code) (i i64) (n i64)] (-> bool)
  (if (coil.primitive/icmp-ge i n) false
      (if (coil.primitive/code-from-user? (coil.primitive/code-nth m i)) true
          (br-any-user? m (coil.primitive/iadd i 1) n))))
(defn br-mods [(ms Code) (i i64) (n i64)] (-> Code)
  (if (coil.primitive/icmp-ge i n) `0
      (do (let [m (coil.primitive/code-nth ms i)]
            (if (br-any-user? m 1 (coil.primitive/code-count m)) (br-forms m 1 (coil.primitive/code-count m)) `0))
          (br-mods ms (coil.primitive/iadd i 1) n))))
(defn lint-bad [(modules Code)] (-> Code) (br-mods modules 0 (coil.primitive/code-count modules)))
(checker lint-bad)
EOF
printf '(module app)\n(defn main [] (-> i64)\n  (+ 40 2))\n' > "$T/lint/victim.coil"
cp "$T/lint/victim.coil" "$T/lint/victim.orig"
expect_rc 1 "lint --fix: a fix that does not compile fails the run" \
  "$COIL" lint "$T/lint/victim.coil" --use badrule --fix
cmp -s "$T/lint/victim.coil" "$T/lint/victim.orig" \
  && ok "lint --fix: the reverted round left the file byte-identical" \
  || bad "lint --fix: the reverted round left the file byte-identical" "the file was left broken"

echo "== bundled stdlib manifest =="
# The manifest in src/compiler/embedded_stdlib.coil decides which namespaces a
# compiler binary can serve when it runs OUTSIDE this repo. In-repo the loader
# falls back to scanning the source tree, so an omission is completely invisible
# here — coil.socket, coil.sync, coil.region, coil.signals and coil.cancellation
# all shipped unreachable that way. Hence a gate rather than review.
expect_rc 0 "manifest: generated tables match src/stdlib/" \
  python3 scripts/compiler/gen-stdlib-manifest.py --check

# The contract, tested the way a user meets it: through a real INSTALL, from a
# directory that is not this repo. `dev.py install` puts the compiler and its
# standard library in one prefix, which is also the only way either of them ships,
# so this exercises the shipping layout rather than a repo-only shortcut.
mkdir -p "$T/bundle"
expect_rc 0 "install: dev.py install lays down a compiler and its library together" \
  python3 scripts/dev.py install --source "$COIL" --dest "$T/prefix/bin/coil"
INSTALLED="$T/prefix/bin/coil"
[ -d "$T/prefix/lib/coil/stdlib" ] && [ -d "$T/prefix/lib/coil/compiler" ] && [ -f "$T/prefix/lib/coil/prelude.coil" ] \
  && ok "install: the prefix holds stdlib, opt-in compiler SDK, and prelude" \
  || bad "install: the prefix holds stdlib, opt-in compiler SDK, and prelude" "missing"
expect_out "installed:" \
  "install: --version says the library came from an install" \
  bash -c 'cd / && "$1" --version' _ "$INSTALLED"
expect_out "lib/coil/stdlib" \
  "install: --version names the installed library's path" \
  bash -c 'cd / && "$1" --version' _ "$INSTALLED"
"$COIL" namespaces > "$T/bundle/ns.txt" 2>/dev/null
# `--check` above compares the manifest SOURCE to src/stdlib/. This compares what
# the compiler under test actually carries, which also catches gating a binary
# built from older source. The reachability check below cannot cover this: it
# derives its import list from the binary's own advertisement, so a namespace
# missing from every table would leave it silently testing one namespace less.
python3 scripts/compiler/gen-stdlib-manifest.py --print-namespaces > "$T/bundle/ns-want.txt"
if diff -u "$T/bundle/ns-want.txt" "$T/bundle/ns.txt" > "$T/bundle/ns.diff" 2>&1; then
  ok "manifest: the compiler advertises exactly the namespaces in src/stdlib/"
else
  bad "manifest: the compiler advertises exactly the namespaces in src/stdlib/" \
      "$(head -20 "$T/bundle/ns.diff")"
fi
{
  echo '(module allns)'
  i=0
  while read -r ns; do
    [ -n "$ns" ] || continue
    [ "$ns" = "coil.core" ] && continue
    # coil.jit is deliberately source-linked compiler SDK and has its own
    # installed-toolchain execution gate below. Pulling it into this aggregate
    # namespace smoke would compile the entire compiler twice in parallel.
    [ "$ns" = "coil.jit" ] && continue
    [ "$ns" = "coil.jit.reload" ] && continue
    i=$((i + 1))
    echo "(import \"$ns\" :as ns$i)"
  done < "$T/bundle/ns.txt"
  echo '(defn main [] (-> i64) 0)'
} > "$T/bundle/allns.coil"
NSN=$(grep -c '^(import' "$T/bundle/allns.coil")
# A guard on the guard: if `coil namespaces` ever returns nothing, the import file
# would be empty and would "pass" while testing nothing at all.
[ "$NSN" -ge 40 ] \
  && ok "manifest: coil namespaces advertises $NSN importable namespaces" \
  || bad "manifest: coil namespaces advertises a plausible set" "got $NSN, expected >= 40"
expect_rc 0 "manifest: every advertised namespace resolves from an install, outside the repo" \
  bash -c 'cd "$1" && env -u COIL_NAMESPACE_ROOTS "$2" check allns.coil' \
  _ "$T/bundle" "$INSTALLED"

# COIL_STRICT_BUNDLE removes the in-repo asymmetry: a coil.* namespace served by
# the source-tree scan is the exact bug shape above, so under the flag it is an
# error at the import site instead of a success that only breaks for users.
mkdir -p "$T/strict"
printf '(module coil.gatetmp)\n(defn gt [] (-> i64) 0)\n' > "$T/strict/gatetmp.coil"
printf '(module m)\n(import "coil.gatetmp" :as g)\n(defn main [] (-> i64) (g/gt))\n' > "$T/strict/m.coil"
expect_rc 0 "strict-bundle: off, an unbundled coil.* still resolves from the tree" \
  bash -c 'cd "$1" && env -u COIL_STRICT_BUNDLE COIL_NAMESPACE_ROOTS=. "$2" check m.coil' \
  _ "$T/strict" "$INSTALLED"
expect_rc 1 "strict-bundle: on, an unbundled coil.* is an error" \
  bash -c 'cd "$1" && env COIL_NAMESPACE_ROOTS=. COIL_STRICT_BUNDLE=1 "$2" check m.coil' \
  _ "$T/strict" "$INSTALLED"
expect_out "missing from the bundled stdlib manifest" \
  "strict-bundle: the error names the manifest, not the namespace lookup" \
  bash -c 'cd "$1" && env COIL_NAMESPACE_ROOTS=. COIL_STRICT_BUNDLE=1 "$2" check m.coil' \
  _ "$T/strict" "$INSTALLED"

# A compiler carries no copy of the library, so one that has been separated from it
# must say so. Silence here is the whole bug class this layout replaced: the compiler
# used to answer with a library from whenever it was built, and the only symptom was
# that editing src/stdlib changed nothing. There is no environment variable to
# redirect the search, so these are the only two outcomes.
# Keep this outside both the checkout and /tmp: bootstrap stage compilers use
# /tmp/lib/coil while they are being verified, and a "lonely" compiler beneath
# /tmp would otherwise discover that stage library by walking upward.
LONELY=$(mktemp -d /var/tmp/coil-lonely.XXXXXX)
cp "$COIL" "$LONELY/coil"
cp "$T/bundle/allns.coil" "$LONELY/allns.coil"
expect_rc 1 "layout: a compiler with no library beside it fails instead of guessing" \
  bash -c 'cd "$1" && "$1/coil" check allns.coil' _ "$LONELY"
expect_out "cannot find the coil standard library" \
  "layout: the error says the library is missing, and where it looked" \
  bash -c 'cd "$1" && "$1/coil" check allns.coil 2>&1' _ "$LONELY"
rm -rf "$LONELY"
# The other layout, built explicitly rather than assumed of $COIL: a compiler under a
# directory that holds src/stdlib and src/compiler belongs to that checkout. (The
# bootstrap runs its stages out of /tmp, so $COIL itself is not always in one.)
mkdir -p "$T/fakeroot/build/bin"
mkdir -p "$T/fakeroot/src"
ln -sfn "$PWD/src/stdlib" "$T/fakeroot/src/stdlib"
ln -sfn "$PWD/src/compiler" "$T/fakeroot/src/compiler"
cp "$COIL" "$T/fakeroot/build/bin/coil"
codesign -s - --force "$T/fakeroot/build/bin/coil" >/dev/null 2>&1 || true
expect_out "checkout:" \
  "layout: a compiler under a checkout uses that checkout's library" \
  bash -c 'cd / && "$1" --version' _ "$T/fakeroot/build/bin/coil"
expect_rc 0 "layout: and compiles with it" \
  bash -c 'cd "$2" && "$1" check ../bundle/allns.coil' _ "$T/fakeroot/build/bin/coil" "$T/fakeroot"

# A loose stage binary is not an installed compiler merely because an unrelated
# `lib/coil` exists above it. It must fall through to the checkout at cwd; this is
# the deterministic form of the `/tmp/coil-candidate` + stale `/tmp/lib/coil` bug.
mkdir -p "$T/loose/lib/coil"
ln -sfn "$T/bundle" "$T/loose/lib/coil/stdlib"
cp "$COIL" "$T/loose/coil-candidate"
codesign -s - --force "$T/loose/coil-candidate" >/dev/null 2>&1 || true
FAKEROOT_STDLIB="$(cd "$T/fakeroot" && pwd -P)/src/stdlib"
expect_out "checkout: $FAKEROOT_STDLIB" \
  "layout: a loose candidate ignores an unrelated ancestor lib/coil" \
  bash -c 'cd "$2" && "$1" --version' _ "$T/loose/coil-candidate" "$T/fakeroot"

echo "== entry file needs no (module ...) =="
# An ENTRY file is named on the command line and imported by nobody, so it needs no
# namespace of its own. It used to be refused the moment it imported anything, and
# `coil test` / `--debug-checks` inject imports themselves — so the diagnostic pointed
# at `<cli-use>`, a file the user never wrote.
mkdir -p "$T/entrymod"
cat > "$T/entrymod/bare.coil" <<'EOF'
(import "coil.io" :use *)
(defn main [] (-> i64) (println "ok") 0)
EOF
cat > "$T/entrymod/bare_test.coil" <<'EOF'
(deftest arithmetic (assert-eq (+ 2 2) 4))
EOF
cat > "$T/entrymod/nomodnoimp.coil" <<'EOF'
(defn main [] (-> i64) 0)
EOF
expect_rc 0 "entry: imports with no (module ...) compile" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" check bare.coil' \
  _ "$T/entrymod" "$COIL"
expect_rc 0 "entry: --debug-checks injects metaprograms without needing (module ...)" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build bare.coil --debug-checks -o out' \
  _ "$T/entrymod" "$COIL"
expect_rc 0 "entry: coil test on a module-less file runs" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" test bare_test.coil' \
  _ "$T/entrymod" "$COIL"
expect_rc 0 "entry: no module and no imports still compiles" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" check nomodnoimp.coil' \
  _ "$T/entrymod" "$COIL"

echo "== a local shadows a macro in head position =="
# Coil is a Lisp-1: one namespace, so a local binding must win over a macro in HEAD
# position too, not only in argument position. Clojure/Scheme tiering — special forms
# are still unshadowable. Asserted by BEHAVIOUR, not message text.
mkdir -p "$T/shadow"
cat > "$T/shadow/arg.coil" <<'EOF'
(module sarg)
(defn main [] (-> i64) (let [when 5] when))
EOF
cat > "$T/shadow/head.coil" <<'EOF'
(module shead)
(defn main [] (-> i64) (let [when 5] (when 1 2)))
EOF
cat > "$T/shadow/special.coil" <<'EOF'
(module sspec)
(defn main [] (-> i64) (let [if 5] (if (= 1 1) 0 9)))
EOF
cat > "$T/shadow/macro-still-expands.coil" <<'EOF'
(module sstill)
(import "coil.primitive" :as primitive)
(defn main [] (-> i64) (let [(mut n) 0] (when (= 0 0) (store! n 7) 0) (load n)))
EOF
expect_rc 5 "shadow: a local wins in ARGUMENT position (unchanged)" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" run arg.coil' \
  _ "$T/shadow" "$COIL"
expect_rc 1 "shadow: a local wins in HEAD position — the macro no longer expands" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" check head.coil' \
  _ "$T/shadow" "$COIL"
expect_rc 0 "shadow: a SPECIAL FORM is still unshadowable in head position" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" check special.coil' \
  _ "$T/shadow" "$COIL"
expect_rc 7 "shadow: an unshadowed macro still expands normally" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" run macro-still-expands.coil' \
  _ "$T/shadow" "$COIL"

echo "== arm64 self-tail-call optimization =="
# Without TCO the arm64 backend spent a frame per iteration, so a tail-recursive
# function died of stack exhaustion where LLVM ran it in constant space — a runtime
# miscompile-by-omission that comptime inherited (its thunk is built by this backend).
mkdir -p "$T/tco"
cat > "$T/tco/deep.coil" <<'EOF'
(module tcodeep)
(import "coil.primitive" :as primitive)
(defn spin [(n i64)] (-> i64) (if (= n 0) 0 (spin (primitive/isub n 1))))
(defn main [] (-> i64) (spin 100000000))
EOF
cat > "$T/tco/swap.coil" <<'EOF'
(module tcoswap)
(import "coil.primitive" :as primitive)
; arguments SWAP: writing parameters in place would clobber a before b reads it
(defn sw [(n i64) (a i64) (b i64)] (-> i64)
  (if (= n 0) a (sw (primitive/isub n 1) b a)))
(defn main [] (-> i64) (sw 11 3 4))
EOF
cat > "$T/tco/ct.coil" <<'EOF'
(module tcoct)
(import "coil.primitive" :as primitive)
(defn spin [(n i64)] (-> i64) (if (= n 0) 0 (spin (primitive/isub n 1))))
(defn main [] (-> i64) (comptime (spin 100000000)))
EOF
expect_rc_arm64 0 "tco: deep tail recursion runs in constant space on the arm64 backend" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build deep.coil --backend arm64 -o d && ./d' \
  _ "$T/tco" "$COIL"
expect_rc_arm64 4 "tco: a tail call that swaps its arguments is still correct (arm64)" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build swap.coil --backend arm64 -o s && ./s' \
  _ "$T/tco" "$COIL"
expect_rc 4 "tco: same answer from the LLVM backend" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build swap.coil -o s2 && ./s2' \
  _ "$T/tco" "$COIL"
expect_rc 0 "tco: runaway comptime now terminates instead of SIGBUS" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" check ct.coil' \
  _ "$T/tco" "$COIL"

echo "== aggregate-typed const =="
# A const of struct/sum/array type used to be classified as a STATIC, and no backend
# could lower the resulting EStaticRef. It now takes the same path a non-literal const
# already took — EComptime of its value, materialized at each use.
mkdir -p "$T/aggconst"
cat > "$T/aggconst/a.coil" <<'EOF'
(module aggc)
(import "coil.primitive" :as primitive)
(defsum Color (Red []) (Green []) (Blue []))
(defsum Tagged (Num [(v i64)]) (Nothing []))
(defstruct P [(x i64) (y i64)])
(defn mkp [] (-> P)
  (let [(mut p) (primitive/zeroed P)]
    (store! (field (mut p) x) 3) (store! (field (mut p) y) 4) (load (mut p))))
(const FAVOURITE (Blue))
(const ANSWER    (Num 42))
(const ORIGIN    (mkp))
(defn main [] (-> i64)
  (let [(mut o) ORIGIN]
    (primitive/iadd (match FAVOURITE (Red [] 1) (Green [] 2) (Blue [] 3))
                    (primitive/iadd (match ANSWER (Num [v] v) (Nothing [] 0))
                                    (primitive/iadd (load (field (mut o) x))
                                                    (load (field (mut o) y)))))))
EOF
expect_rc 52 "const: sum, payload sum and struct consts all materialize (3+42+3+4)" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build a.coil -o a && ./a' \
  _ "$T/aggconst" "$COIL"
expect_rc_arm64 52 "const: same on the arm64 backend" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build a.coil --backend arm64 -o a2 && ./a2' \
  _ "$T/aggconst" "$COIL"

echo "== comptime generic-instance aggregates =="
# `(Option i64)` / `(Pair i64 i64)` reported "cannot be materialized"; plain structs,
# sums and arrays worked. Two independent causes: the readback did not understand TApp,
# and the materializer rebuilt the literal without the instantiation.
mkdir -p "$T/ctgen"
cat > "$T/ctgen/g.coil" <<'EOF'
(module ctgen)
(import "coil.primitive" :as primitive)
(import "coil.result" :use *)
(defstruct Pair [T U] [(a T) (b U)])
(defsum Maybe [T] (Nope []) (Yep [(v T)]))
(defn mkpair [] (-> (Pair i64 i64))
  (let [(mut p) (primitive/zeroed (Pair i64 i64))]
    (store! (field (mut p) a) 11) (store! (field (mut p) b) 22) (load (mut p))))
(defn nothing [] (-> (Option i64)) (None [i64]))
(defn main [] (-> i64)
  (let [(mut p) (comptime (mkpair))]
    (primitive/iadd (match (comptime (Some [i64] 7)) (Some [v] v) (None [] 0))
      (primitive/iadd (match (comptime (nothing)) (Some [v] v) (None [] 1))
        (primitive/iadd (match (comptime (Yep [i64] 3)) (Yep [v] v) (Nope [] 0))
          (primitive/iadd (load (field (mut p) a)) (load (field (mut p) b))))))))
EOF
expect_rc 44 "comptime: generic sum, user generic sum and generic struct all fold (7+1+3+11+22)" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build g.coil -o g && ./g' \
  _ "$T/ctgen" "$COIL"
expect_rc_arm64 44 "comptime: same on the arm64 backend" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build g.coil --backend arm64 -o g2 && ./g2' \
  _ "$T/ctgen" "$COIL"

echo "== match arm binds scope, nested generics instantiate =="
mkdir -p "$T/rest"
cat > "$T/rest/marm.coil" <<'EOF'
(module marm)
(defsum Box (Wrap [(v i64)]) (Empty []))
(defn get [(b Box)] (-> i64) (match b (Wrap [when] (when 1 2)) (Empty [] 0)))
(defn main [] (-> i64) (get (Wrap 5)))
EOF
cat > "$T/rest/marm-ok.coil" <<'EOF'
(module marmok)
(defsum Box (Wrap [(v i64)]) (Empty []))
; an UNSHADOWED macro inside an arm body must still expand
(defn get [(b Box)] (-> i64) (match b (Wrap [v] (when (= v 5) 7)) (Empty [] 0)))
(defn main [] (-> i64) (get (Wrap 5)))
EOF
cat > "$T/rest/nested.coil" <<'EOF'
(module nested)
(import "coil.primitive" :as primitive)
(import "coil.result" :use *)
(defstruct Pair [T U] [(a T) (b U)])
(defsum Wrap [T] (Only [(v T)]) (Nada []))
(defn deep [] (-> (Pair (Option i64) i64))
  (let [(mut p) (primitive/zeroed (Pair (Option i64) i64))]
    (store! (field (mut p) a) (Some [i64] 8))
    (store! (field (mut p) b) 3) (load (mut p))))
(defn deeper [] (-> (Wrap (Option i64))) (Only [(Option i64)] (Some [i64] 4)))
(defn arr [] (-> (array (Option i64) 2))
  (let [(mut z) (primitive/zeroed (array (Option i64) 2))]
    (store! (primitive/index (mut z) 0) (Some [i64] 6)) (load (mut z))))
(defn main [] (-> i64)
  (let [(mut p) (comptime (deep)) (mut z) (comptime (arr))]
    (primitive/iadd (match (load (field (mut p) a)) (Some [v] v) (None [] 0))
      (primitive/iadd (load (field (mut p) b))
        (primitive/iadd (match (comptime (deeper)) (Only [o] (match o (Some [v] v) (None [] 0))) (Nada [] 0))
                        (match (load (primitive/index (mut z) 0)) (Some [v] v) (None [] 0)))))))
EOF
expect_rc 1 "shadow: a MATCH ARM bind wins over a macro in head position" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" check marm.coil' \
  _ "$T/rest" "$COIL"
expect_rc 7 "shadow: an unshadowed macro still expands inside an arm body" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build marm-ok.coil -o m && ./m' \
  _ "$T/rest" "$COIL"
expect_rc 21 "comptime: generics NESTED in a struct, a generic sum and an array (8+3+4+6)" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build nested.coil -o n && ./n' \
  _ "$T/rest" "$COIL"
expect_rc_arm64 21 "comptime: same on the arm64 backend" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build nested.coil --backend arm64 -o n2 && ./n2' \
  _ "$T/rest" "$COIL"

echo "== --version, and the shadowed-macro diagnostic =="
mkdir -p "$T/ver"
cat > "$T/ver/sh.coil" <<'EOF'
(module vsh)
(defn main [] (-> i64) (let [when 5] (when 1 2)))
EOF
cat > "$T/ver/unimported.coil" <<'EOF'
(module vun)
(defn main [] (-> i64) (str-eq "a" "a"))
EOF
expect_rc 0 "version: --version prints and exits 0" bash -c '"$1" --version' _ "$COIL"
expect_out "coil 0" "version: names the compiler and a version" bash -c '"$1" --version' _ "$COIL"
expect_out "is a local binding here" \
  "shadow: a shadowed macro is reported as a local, not as a missing import" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" check sh.coil 2>&1' \
  _ "$T/ver" "$COIL"
expect_out "which is not imported here" \
  "shadow: a genuinely unimported name still gets the import hint" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" check unimported.coil 2>&1' \
  _ "$T/ver" "$COIL"

echo "== match arms accept any spelling of a variant, and \`_\` covers the rest =="
# The sum is known from the scrutinee, so a variant name inside an arm is unambiguous
# however it is written. `(_ …)` covers whatever the explicit arms left out; it names
# no variant, so no spelling question arises for it at all.
mkdir -p "$T/variant"
cat > "$T/variant/v.coil" <<'EOF'
(module vmatch)
(import "coil.socket" :as socket)
(defn code [(e socket/SocketError)] (-> i64)
  (match e (socket/Closed [] 1) (socket/InvalidAddress [] 2) (_ 0)))
(defn main [] (-> i64)
  (if (= (code (socket/Closed)) 1)
      (if (= (code (socket/InvalidAddress)) 2)
          (if (= (code (socket/IoFailed 5)) 0) 0 3)
          2)
      1))
EOF
cat > "$T/variant/bare.coil" <<'EOF'
(module vbare)
(import "coil.socket" :as socket)
(defn code [(e socket/SocketError)] (-> i64) (match e (Closed [] 1) (_ 0)))
(defn main [] (-> i64) (code (socket/Closed)))
EOF
expect_rc 0 "match: alias-qualified variants plus a `_` arm RUN correctly" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build v.coil -o v && ./v' \
  _ "$T/variant" "$COIL"
expect_rc_arm64 0 "match: same on the arm64 backend" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build v.coil --backend arm64 -o v2 && ./v2' \
  _ "$T/variant" "$COIL"
expect_rc 1 "match: a bare variant under an :as import also resolves" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build bare.coil -o b && ./b' \
  _ "$T/variant" "$COIL"

# `_` is what makes a partial match legal, so the arm has to be positioned where it
# can actually run, and an omitted variant with no `_` is still an error.
cat > "$T/variant/notlast.coil" <<'EOF'
(module vnotlast)
(defsum S (A []) (B []) (C []))
(defn code [(s S)] (-> i64) (match s (A [] 1) (_ 0) (B [] 2)))
(defn main [] (-> i64) (code (A)))
EOF
cat > "$T/variant/missing.coil" <<'EOF'
(module vmissing)
(defsum S (A []) (B []) (C []))
(defn code [(s S)] (-> i64) (match s (A [] 1)))
(defn main [] (-> i64) (code (A)))
EOF
expect_out "the \`_\` arm must come last" \
  "match: arms after \`_\` are rejected" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" check notlast.coil 2>&1' \
  _ "$T/variant" "$COIL"
expect_out "non-exhaustive match" \
  "match: a missing variant with no \`_\` is still an error" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" check missing.coil 2>&1' \
  _ "$T/variant" "$COIL"

echo "== lint: match-else migrates to a \`_\` arm =="
# `match-else` was the library macro that faked a catch-all before `match` had one.
# The rule is a head swap, so the arms — and any comments between them — come through
# untouched, and the result has to still run.
mkdir -p "$T/melint"
cat > "$T/melint/m.coil" <<'EOF'
(module melint)
(import "coil.match" :use *)
(defsum S (A [(x i64)]) (B []) (C []))
(defn code [(s S)] (-> i64)
  (match-else s
              (A [x] x)
              ; a comment inside an untouched arm
              (_ 7)))
(defn main [] (-> i64) (+ (code (A 5)) (code (C))))
EOF
expect_rc 0 "lint --fix rewrites match-else to match" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" lint m.coil --use coil.lint.match-else --fix' \
  _ "$T/melint" "$COIL"
expect_out "\(match s" "lint: the rewritten form is a plain match" \
  cat "$T/melint/m.coil"
expect_out "a comment inside an untouched arm" \
  "lint: comments between arms survive the rewrite" \
  cat "$T/melint/m.coil"
expect_rc 12 "lint: the rewritten program still runs" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=. "$2" build m.coil -o m && ./m' \
  _ "$T/melint" "$COIL"

echo "== generated code must not depend on the CALLER's imports =="
# Reflection strips qualification, which is right for display and wrong for code
# generation: a macro emitting a bare name produces code that only resolves where the
# type happens to be imported unqualified. Each case below FAILS on the previous
# compiler under an `:as` import.
mkdir -p "$T/qual/src"
cat > "$T/qual/src/qlib.coil" <<'EOF'
(module qlib)
(import "coil.derive" :use *)
(import "coil.primitive" :as primitive)
(defstruct Inner [(x i64)])
(derive Eq Hash Inner)
EOF
cat > "$T/qual/src/qlib2.coil" <<'EOF'
(module qlib2)
(defsum Shape (Dot []) (Line [(n i64)]))
EOF
cat > "$T/qual/src/deq.coil" <<'EOF'
(module qdeq)
(import "coil.derive" :use *)
(import "coil.primitive" :as primitive)
(import "qlib" :as l)
(defstruct Outer [(inner l/Inner) (y i64)])
(derive Eq Hash Outer)
(defn main [] (-> i64) 0)
EOF
cat > "$T/qual/src/dserde.coil" <<'EOF'
(module qserde)
(import "coil.serde" :use *)
(import "coil.serde.derive" :use *)
(import "coil.alloc" :as alloc :use *)
(import "coil.primitive" :as primitive)
(import "coil.str" :use *)
(import "coil.result" :use *)
(import "qlib2" :as s)
(derive Serialize Deserialize s/Shape)
(defn main [] (-> i64) 0)
EOF
expect_rc 0 "qual: Eq/Hash derive over a field typed through an :as import" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=src "$2" check src/deq.coil' \
  _ "$T/qual" "$COIL"
expect_rc 0 "qual: Serialize/Deserialize derive on a sum reached through an :as import" \
  bash -c 'cd "$1" && COIL_NAMESPACE_ROOTS=src "$2" check src/dserde.coil' \
  _ "$T/qual" "$COIL"

if { [ "$HOST_OS" = Darwin ] && [ "$HOST_ARCH" = arm64 ]; } \
   || { [ "$HOST_OS" = Linux ] && [ "$HOST_ARCH" = x86_64 ]; }; then
  echo "== coil.jit: installed, source-linked userland SDK =="
  mkdir -p "$T/jit-sdk"
  python3 scripts/dev.py install --source "$COIL" --dest "$T/jit-prefix/bin/coil" >/dev/null 2>&1
  INSTALLED="$T/jit-prefix/bin/coil"
  cp src/examples/jit_sdk.coil "$T/jit-sdk/main.coil"
  if [ "$HOST_OS" = Darwin ]; then
    JIT_BUILD_ARGS=(--backend arm64)
  else
    LLVM_CONFIG=${LLVM_CONFIG:-llvm-config}
    JIT_BUILD_ARGS=(--link-flag "-L$("$LLVM_CONFIG" --libdir)" --link-flag -lLLVM --link-flag -lm)
  fi
  if (cd "$T/jit-sdk" && "$INSTALLED" build main.coil "${JIT_BUILD_ARGS[@]}" -o app >/dev/null 2>&1); then
    mkdir -p "$T/no-cc"
    cat > "$T/no-cc/cc" <<'EOF'
#!/bin/sh
echo "FAIL: an in-process JIT session invoked cc: $*" >&2
exit 97
EOF
    chmod +x "$T/no-cc/cc"
    if [ "$HOST_OS" = Darwin ]; then
      sdk_out=$(cd "$T/jit-sdk" && PATH="$T/no-cc:$T/jit-prefix/bin:$PATH" ./app 2>&1)
    else
      sdk_out=$(cd "$T/jit-sdk" && PATH="$T/jit-prefix/bin:$PATH" ./app 2>&1)
    fi
    case "$sdk_out" in
      *$'20\n'*$'30\n'*) ok "coil.jit embeds an installed compiler and hot reloads from userland" ;;
      *) bad "coil.jit embeds an installed compiler and hot reloads from userland" "$sdk_out" ;;
    esac
    sdk_syms=$(nm "$T/jit-sdk/app" 2>/dev/null)
    case "$sdk_syms" in
      *repl-session-new*) ok "coil.jit import links the compiler SDK" ;;
      *) bad "coil.jit import links the compiler SDK" "missing SDK symbol" ;;
    esac
  else
    bad "coil.jit userland application builds from the installed toolchain" "build failed"
  fi
  printf '(module plain)\n(defn main [] (-> i64) 0)\n' > "$T/jit-sdk/plain.coil"
  if [ "$HOST_OS" = Darwin ]; then
    (cd "$T/jit-sdk" && "$INSTALLED" emit-obj plain.coil --backend arm64 -o plain.o >/dev/null 2>&1)
  else
    (cd "$T/jit-sdk" && "$INSTALLED" emit-obj plain.coil -o plain.o >/dev/null 2>&1)
  fi
  plain_syms=$(nm "$T/jit-sdk/plain.o" 2>/dev/null)
  case "$plain_syms" in
    *repl-session-new*) bad "ordinary programs do not link the compiler SDK" "unexpected SDK symbol" ;;
    *) ok "ordinary programs do not link the compiler SDK" ;;
  esac

  echo "== repl: multiline, reload, persistent state, and transactions =="
  python3 scripts/dev.py install --source "$COIL" --dest "$T/repl-prefix/bin/coil" >/dev/null 2>&1
  REPL_COIL="$T/repl-prefix/bin/coil"
  repl_out=$(printf '%s\n' \
    '(defn next [] (-> i64)' \
    '  (let [p (primitive/alloc-static i64)' \
    '        n (+ (load p) 1)]' \
    '    (store! p n)' \
    '    n))' \
    '(defn twice [(x i64)] (-> i64) (* x 2))' \
    '(defn four-times [(x i64)] (-> i64) (twice (twice x)))' \
    '(next)' \
    '(four-times 10)' \
    '(defn twice [(x i64)] (-> i64) (* x 3))' \
    '(next)' \
    '(four-times 10)' \
    '(defn twice [(x f64)] (-> f64) (* x 4.0))' \
    '(next)' \
    '(four-times 10)' \
    ':q' | if [ "$HOST_OS" = Darwin ]; then PATH="$T/no-cc:$PATH" "$REPL_COIL" repl 2>&1; else "$REPL_COIL" repl 2>&1; fi)
  case "$repl_out" in
    *'coil> 1'*'coil> 40'*'coil> 2'*'coil> 90'*'coil> 3'*'coil> 90'*) ok "repl preserves state, reloads dependent calls, and rejects incompatible replacement" ;;
    *) bad "repl preserves state, reloads dependent calls, and rejects incompatible replacement" "$repl_out" ;;
  esac
  case "$repl_out" in
    *"cannot redefine a REPL function with a different signature"*) ok "repl reports the incompatible redefinition" ;;
    *) bad "repl reports the incompatible redefinition" "$repl_out" ;;
  esac

  repl_bound_out=$(printf '%s\n' \
    '(deftrait Total [Self] (total [(value Self)] (-> i64)))' \
    '(defn doubled-total [(T Total)] [(value T)] (-> i64) (* (total value) 2))' \
    '(doubled-total 3)' \
    ':q' | "$REPL_COIL" repl 2>&1)
  case "$repl_bound_out" in
    *"--> <repl>:1:1"*"1 | (doubled-total 3)"*) ok "repl trait-bound error points at the submitted expression" ;;
    *) bad "repl trait-bound error points at the submitted expression" "$repl_bound_out" ;;
  esac

  repl_module_out=$(printf '%s\n' \
    '(module app)' \
    '(defn answer [] (-> i64) 42)' \
    '(answer)' \
    '(module app.tools)' \
    '(answer)' \
    ':q' | "$REPL_COIL" repl 2>&1)
  case "$repl_module_out" in
    *'coil> 42'*'coil> 42'*) ok "repl module form switches namespace and republishes definitions" ;;
    *) bad "repl module form switches namespace and republishes definitions" "$repl_module_out" ;;
  esac

  repl_macro_out=$(printf '%s\n' \
    '(defn stuff2 [(x Code)] (-> Code) x)' \
    '(stuff2 (+ 1 2))' \
    '(defn stuff2 [(x Code)] (-> Code) `(* ~x 2))' \
    '(stuff2 21)' \
    '(defn stuff2 [(x Code)] (-> Code) (+ x 1))' \
    '(stuff2 21)' \
    ':q' | "$REPL_COIL" repl 2>&1)
  case "$repl_macro_out" in
    *'coil> 3'*'coil> 42'*"'code' does not implement 'Add'"*'coil> 42'*) ok "repl compiles, invokes, replaces, and transactionally rejects macros" ;;
    *) bad "repl compiles, invokes, replaces, and transactionally rejects macros" "$repl_macro_out" ;;
  esac

  repl_ambient_derive_out=$(printf '%s\n' \
    '(defstruct Action [(value i64)])' \
    '(derive Eq Action)' \
    '(= (Action :value 1) (Action :value 1))' \
    '(derive Debug Action)' \
    ':q' | "$REPL_COIL" repl 2>&1)
  case "$repl_ambient_derive_out" in
    *"true"*"no deriver is registered for trait 'Debug'"*"| (derive Debug Action)"*|\
    *"no deriver is registered for trait 'Debug'"*"| (derive Debug Action)"*"true"*)
      ok "repl keeps derive ambient and diagnoses the missing trait module at the submitted form" ;;
    *) bad "repl keeps derive ambient and diagnoses the missing trait module at the submitted form" "$repl_ambient_derive_out" ;;
  esac
  case "$repl_ambient_derive_out" in
    *"| (import \"coil.primitive\" :as primitive)"*)
      bad "repl never attributes a derive failure to its synthetic preamble" "$repl_ambient_derive_out" ;;
    *) ok "repl never attributes a derive failure to its synthetic preamble" ;;
  esac

  repl_debug_out=$(printf '%s\n' \
    '(defstruct Hidden [(x i64)])' \
    '(Hidden :x 1)' \
    '(import "coil.fmt" :as f)' \
    '(defstruct Label [(x i64)])' \
    '(impl f/Display Label (display-fmt [(v Label) (fm (ptr f/Formatter))] (-> i64) (f/formatter-write fm "display-only") 0))' \
    '(Label :x 2)' \
    '(import "coil.debug" :use *)' \
    '(derive Debug Label)' \
    '(Label :x 3)' \
    '(defstruct Point [(x i64) (y i64)])' \
    '(derive Debug Point)' \
    '(Point :x 10 :y 20)' \
    '(import "coil.arraylist" :use *)' \
    '(import "coil.alloc" :use *)' \
    '(defn nums [] (-> (ArrayList i64)) (let [(mut xs) (al-new [i64] (malloc-allocator))] (push! (mut xs) 1) (push! (mut xs) 2) (load xs)))' \
    '(nums)' \
    ':q' | "$REPL_COIL" repl 2>&1)
  case "$repl_debug_out" in
    *"implements neither Debug nor Display"*"display-only"*"(Label :x 3)"*"(Point :x 10 :y 20)"*"(1 2)"*)
      ok "repl prefers Debug, falls back to Display, and explains unprintable values" ;;
    *) bad "repl prefers Debug, falls back to Display, and explains unprintable values" "$repl_debug_out" ;;
  esac
fi

echo
[ "$FAIL" = 0 ] && echo "gate-cli: PASS" || echo "gate-cli: FAIL"
exit $FAIL
