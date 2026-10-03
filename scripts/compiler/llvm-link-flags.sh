#!/usr/bin/env bash
# The ONE place that knows how to link the LLVM backend. Emits the `--link-flag …`
# arguments for `coil build`, in one of two modes. rebootstrap.sh consumes this;
# nothing else should hand-roll an LLVM link line.
#
#   llvm-link-flags.sh dynamic   # link Homebrew's libLLVM.dylib  (small, needs LLVM installed)
#   llvm-link-flags.sh static    # link LLVM's component archives (fat, self-contained)
#
# There is a third build that needs none of this: scripts/compiler/rebootstrap-nollvm.sh
# builds src/compiler/main_a64.coil, which has no LLVM backend at all and links
# only libSystem. See the table in rebootstrap.sh.
#
# DYNAMIC is the historical default and what the committed seed expects. The
# resulting compiler carries a hard dependency on
# /opt/homebrew/opt/llvm/src/stdlib/libLLVM.dylib and will not run on a machine without
# it.
#
# STATIC links the LLVM component archives instead, the way rustc and zig ship
# LLVM (rustc statically links it into a ~200MB librustc_driver; there is no
# system libLLVM anywhere in a rustup toolchain). The result is ~92MB versus
# ~3.5MB, and depends only on macOS system libraries in /usr/lib — no Homebrew.
# Two details make that possible:
#   * z3. Homebrew's `llvm-config --system-libs` reports libz3.dylib regardless of
#     which components you ask for, because Homebrew builds LLVM with
#     LLVM_ENABLE_Z3_SOLVER. z3 is used by clang's static analyzer, not by codegen,
#     so the components below do not reference it and it is deliberately omitted.
#     Passing it would reintroduce a Homebrew dependency for nothing.
#   * zstd. Homebrew's libzstd has no /usr/lib copy, so `-lzstd` resolves to a
#     Homebrew dylib. Link the static archive by full path instead when it exists.
set -uo pipefail

MODE="${1:-dynamic}"
LLVM_CONFIG="${LLVM_CONFIG:-/opt/homebrew/opt/llvm/bin/llvm-config}"
command -v "$LLVM_CONFIG" >/dev/null 2>&1 || LLVM_CONFIG=llvm-config-21
command -v "$LLVM_CONFIG" >/dev/null 2>&1 || LLVM_CONFIG=llvm-config
command -v "$LLVM_CONFIG" >/dev/null 2>&1 || {
  echo "llvm-link-flags: no llvm-config (set LLVM_CONFIG=/path/to/llvm-config)" >&2; exit 1; }
# COIL_LLVM_LIBDIR overrides where libLLVM lives, for an LLVM whose llvm-config
# reports somewhere else.
LIBDIR="${COIL_LLVM_LIBDIR:-$("$LLVM_CONFIG" --libdir)}"

# the components the Coil backend actually calls into (see src/compiler/ffi.coil):
# IR construction + the three targets it can emit for + the O3 pass pipeline.
COMPONENTS="core target analysis passes executionengine mcjit orcjit jitlink aarch64 x86 riscv webassembly"

emit() { for f in "$@"; do printf -- '--link-flag %s ' "$f"; done; }

# The LLVM C entry points the shipped coil.jit unit reaches and the compiler's own
# code never calls, declared in ONE place: src/compiler/orc.coil, the typed C
# boundary to LLVM's object linker. Derived rather than listed here so the two
# cannot drift as that boundary grows.
jit_boundary_symbols() {
  sed -n 's/^(extern \(LLVM[A-Za-z0-9_]*\).*/\1/p' \
    "$(dirname "$0")/../../src/compiler/orc.coil" | sort -u
}

case "$MODE" in
  dynamic)
    # Coil's interpreter uses libm directly (`floor`, `fmod`, ...). macOS folds
    # those symbols into libSystem, while ELF linkers require an explicit -lm.
    emit "-L$LIBDIR" -lLLVM -lm
    if [ "$(uname -s)" != Darwin ]; then
      # Load libLLVM from LIBDIR, the LLVM this compiler was linked against. The
      # compiler finds its matching clang (sanitizer and coil.jit links) beside
      # the library the loader reports for an LLVM symbol. Without an rpath the
      # loader takes the library through its cache instead: on Debian that is
      # /usr/lib/x86_64-linux-gnu/libLLVM.so.21.1, which has no bin/clang
      # beside it, and every such link fails. A Homebrew dylib's install name
      # is already its absolute path.
      emit "-Wl,-rpath,$LIBDIR" -lstdc++ -lpthread -ldl
    fi
    ;;
  static)
    emit "-L$LIBDIR"
    # shellcheck disable=SC2046
    emit $("$LLVM_CONFIG" --link-static --libs $COMPONENTS)
    emit -lm -lz
    if [ "$(uname -s)" = Darwin ]; then
      ZSTD_A="$(brew --prefix zstd 2>/dev/null)/lib/libzstd.a"
      if [ -f "$ZSTD_A" ]; then emit "$ZSTD_A"; else emit -lzstd; fi
      emit -lxml2 -lc++
      # The shipped coil.jit unit is a dylib whose LLVM references are left
      # undefined (`-Wl,-undefined,dynamic_lookup`) and resolved in the flat
      # namespace when the compiler dlopens it. A DYNAMIC build finds them in
      # libLLVM.dylib. A STATIC build has to find them in the compiler executable
      # itself, and every executable is linked `-dead_strip`: an archive member is
      # pulled in to satisfy the JIT SDK's references, then the functions are
      # deleted again because nothing reachable from `main` calls them (main.coil
      # imports coil.compiler.jit_api for the module graph, not for a call). ld
      # neither keeps nor exports a dead-stripped symbol, so loading the unit died
      # on `symbol not found in flat namespace '_LLVMGetFirstUse'`. `-u` makes each
      # one an undefined symbol of the link, which is both a dead-strip root and an
      # export.
      for sym in $(jit_boundary_symbols); do emit "-Wl,-u,_$sym"; done
    else
      emit $($LLVM_CONFIG --link-static --system-libs $COMPONENTS)
      emit -lstdc++ -lpthread -ldl
    fi
    ;;
  *)
    echo "llvm-link-flags: unknown mode '$MODE' (want: static | dynamic)" >&2; exit 1
    ;;
esac
if [ "$(uname -s)" != Darwin ]; then
  # A prebuilt unit's shared library (`unit.so`, see build-unit in driver.coil)
  # is linked with its references to the compiler's own runtime left UNDEFINED,
  # and `--unit DIR` dlopen's it with RTLD_NOW. ld64 puts every global symbol of
  # a Mach-O executable in the export table; ELF puts an executable's symbols in
  # .dynsym only when it is linked --export-dynamic, so without it the dlopen
  # fails outright.
  emit "-Wl,--export-dynamic"
fi
echo
