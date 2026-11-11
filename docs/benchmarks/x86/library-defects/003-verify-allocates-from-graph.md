# 003: native-input verification allocates from the graph's allocator (data race between compiling threads)

**Status: fixed** in library `feature/x86` 9cf1283 (vendored with d278aba). 2400 parallel `-O3` compiles are identical and a ThreadSanitizer build reports nothing.

Library `feature/x86` 9471372, neutral file `src/stogir/verify.coil` (lines
700-706 and 736): `switch/verify`, `terminal/verify-chains` and
`argval/verify` are called with `(.alc (.instructions graph))`.
Reproducer: `003-verify-allocates-from-graph.coil` (copy to the library's
`tests/x64-verify-borrowed-graph.coil`); it prints `FAILED: compiling allocated
N bytes from the graph's own allocator`.

**Why it matters.** The compile entry points take an allocator and are
documented by their embedder as reading the graph only: the Coil compiler's
emission workers call `image-for-private-module*` / `image-with-options*`
concurrently, one graph each, where the graphs of inline templates share the
module's arena. `argval/verify` allocates as soon as a graph has an ARGVAL
(its `references` list and a `uses/build` index), which every System V
MEMORY-class argument produces, so on x86-64 two workers bump the same
`ScratchArena`. On AArch64 the adapter never makes an ARGVAL and the lists
stay empty, which is why this never showed there.

**Observed in the Coil compiler** (`--backend stogir -O3`, default threads,
x86-64 Linux): about 3 in 1000 compiles of one library test fail, with
`stogir: stogir.x64.fixups.sift!: ARGVAL is only valid as a CALL argument`
(the verifier reading a list another thread overwrote), `out of memory:
arraylist reserve! failed to allocate 446676606272 bytes`, SIGSEGV or abort.
640 of 640 runs are identical under `COIL_TPDE_SERIAL=1`. ThreadSanitizer on
a `--sanitize=thread` build of the compiler reports the race directly:

    WARNING: ThreadSanitizer: data race
      Read of size 8 by thread T88:
        #0 coil.scratch.bump
        #1 coil.alloc.Allocator$coil.scratch.ScratchArena$allocate
        #5 stogir.argument-value.verify
        #6 stogir.x64.compile.generate-buffered
        ...
        #18 coil.compiler.codegen_stogir.native-image
        #19 coil.compiler.codegen_stogir.emission-task
      Previous write of size 8 by thread T83:
        #0 coil.scratch.bump ... #5 stogir.argument-value.verify (same stack)

**Expected.** Verification takes its scratch from the allocator of the compile
call (`native-input`, `native-input-after-validate` and the `-and-control`
forms need an allocator parameter, passed down from `x64/compile` and
`a64/compile`), and never from the graph.

**Adapter workaround.** None that is not a serialization of emission; none is
in place. Until this is fixed, parallel Stogir builds on x86-64 can fail or,
in principle, miscompile; `COIL_TPDE_SERIAL=1` is safe.
