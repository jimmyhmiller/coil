#!/usr/bin/env bash
# Give /tmp the toolchain layout that a stage compiler built into /tmp will look for.
#
# A compiler resolves the standard library by walking up from its own location and
# then from the working directory (src/compiler/frontend/loader.coil, find-stdlib-layout!).
# The bootstrap builds its stages as /tmp/coil-rb1, /tmp/coil-rl2, … and the gates
# run them from their own temporary directories, so neither anchor reaches this
# checkout. Treating /tmp as the prefix — /tmp/lib/coil is its library — makes every
# stage find the library no matter where it is invoked from.
#
# Symlinks, not copies: a stage compiler must read THIS checkout's library, because
# the entire point of the layout is that a compiler and a library are never two
# different versions. Source this from the repo root, after the `cd`.
mkdir -p /tmp/lib/coil
ln -sfn "$PWD/src/stdlib" /tmp/lib/coil/stdlib
ln -sfn "$PWD/src/compiler/prelude.coil" /tmp/lib/coil/prelude.coil
# Every compiler links the hosted HTTP client, so every stage needs the bundled
# curl archives. A fresh checkout or worktree has none; build-curl.sh copies them
# from the machine-wide cache (building them once on a miss), here rather than at
# stage1's link. Native archives are resolved beside the compiler executable, and
# stage compilers live directly in /tmp, so mirror <prefix>/bin/native there too.
scripts/native/build-curl.sh >&2 \
  || { echo "stage-lib: cannot provide the bundled curl archives" >&2; exit 1; }
ln -sfn "$PWD/build/bin/native" /tmp/native

# Remove only the links this checkout installed. Leaving them behind makes a later
# CLI layout test accidentally discover this checkout through /tmp and report a
# missing-library case as success.
stage_lib_cleanup() {
  [ "$(readlink /tmp/lib/coil/stdlib 2>/dev/null)" = "$PWD/src/stdlib" ] \
    && rm /tmp/lib/coil/stdlib
  [ "$(readlink /tmp/lib/coil/prelude.coil 2>/dev/null)" = "$PWD/src/compiler/prelude.coil" ] \
    && rm /tmp/lib/coil/prelude.coil
  [ "$(readlink /tmp/native 2>/dev/null)" = "$PWD/build/bin/native" ] \
    && rm /tmp/native
  rmdir /tmp/lib/coil /tmp/lib 2>/dev/null || true
}
