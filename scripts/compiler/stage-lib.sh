#!/usr/bin/env bash
# Give /tmp the toolchain layout that a stage compiler built into /tmp will look for.
#
# A compiler resolves the standard library by walking up from its own location and
# then from the working directory (src/compiler/loader.coil, find-stdlib-layout!).
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
