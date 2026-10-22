# Building Coil against LLVM

`LLVM_CONFIG` selects the LLVM installation for compiler builds. Coil's dynamic
link flags include that installation's library directory in the runtime search
path on macOS and Linux. Sanitized programs also need its matching Clang and
compiler-rt, installed beside that library.

## Reference selects in LLVM 23.1.3

LLVM 23.1.3 emits an untyped WebAssembly `select` for reference operands, which
WebAssembly engines reject. Enabling `+reference-types` does not repair the
encoding. This affects ordinary Coil `if` expressions returning `externref`.
Upstream tracks it in [llvm-project issue 206650](https://github.com/llvm/llvm-project/issues/206650).

Until using an LLVM release containing the encoder fix, apply
[`patches/llvm-23.1-reference-select.patch`](../patches/llvm-23.1-reference-select.patch)
to the official `llvmorg-23.1.3` source. The patch changes reference selects to
the typed opcode and encodes the required one-element type vector. It includes
MC encoding and object-disassembly regressions; numeric selects are unchanged.

The pinned release commit is `0d261d1ca552c95a8f007e061c787ac7132fbcbc`.
The following macOS setup keeps the dependency separate from Homebrew:

```sh
COIL_SOURCE="$PWD"
LLVM_SOURCE="$HOME/.cache/coil/llvm-23.1.3-source"
LLVM_PREFIX="$HOME/.local/opt/coil-llvm-23.1.3"
git clone --filter=blob:none --no-checkout https://github.com/llvm/llvm-project.git "$LLVM_SOURCE"
git -C "$LLVM_SOURCE" sparse-checkout init --cone
git -C "$LLVM_SOURCE" sparse-checkout set llvm cmake third-party libc clang compiler-rt runtimes
git -C "$LLVM_SOURCE" checkout 0d261d1ca552c95a8f007e061c787ac7132fbcbc
git -C "$LLVM_SOURCE" apply "$COIL_SOURCE/patches/llvm-23.1-reference-select.patch"
cmake -S "$LLVM_SOURCE/llvm" -B "$LLVM_SOURCE/build" -G Ninja \
  -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=ON \
  -DLLVM_ABI_BREAKING_CHECKS=FORCE_OFF \
  '-DLLVM_TARGETS_TO_BUILD=AArch64;X86;WebAssembly;RISCV' \
  -DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON \
  -DLLVM_INCLUDE_BENCHMARKS=OFF -DLLVM_INCLUDE_EXAMPLES=OFF \
  -DLLVM_ENABLE_PROJECTS=clang -DLLVM_ENABLE_RUNTIMES=compiler-rt \
  -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON -DCOMPILER_RT_INCLUDE_TESTS=OFF \
  -DCMAKE_INSTALL_PREFIX="$LLVM_PREFIX" \
  -DCMAKE_INSTALL_NAME_DIR="$LLVM_PREFIX/lib"
cmake --build "$LLVM_SOURCE/build" --target LLVM clang llvm-config compiler-rt --parallel 8
cmake --build "$LLVM_SOURCE/build" --target install-LLVM install-clang install-llvm-config install-compiler-rt
LLVM_CONFIG="$LLVM_PREFIX/bin/llvm-config" python3 scripts/dev.py build candidate
python3 scripts/dev.py test fast --compiler build/bin/coil-candidate
```

Assertions stay enabled: the compiler must honor LLVM's API preconditions.
The existing wasm end-to-end test validates both reference-select branches,
including object identity, null and undefined. The full FAST gate also exercises
narrow integer constants and partitioned functions with cross-block value uses.
