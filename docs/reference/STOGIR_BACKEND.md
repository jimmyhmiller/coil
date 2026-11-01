# stogir backend integration

`--backend stogir` selects the independent [coil-stogir library](https://github.com/jimmyhmiller/coil-stogir).
Work is in progress. It currently targets macOS AArch64 and reports unsupported
operations explicitly. This is not yet a general-purpose backend or a completed
benchmark result.

The compiler shares its AST-to-native-CIR lowering with TPDE, then translates CIR
into a stogir graph. Stogir performs scheduling, allocation and instruction
selection. The TPDE selector and allocator are not used on this path. Sharing CIR
and module transport lets the engines consume the same native lowering while
remaining distinct code generators. LLVM retains its existing lowering path.

The library is a separately declared package, vendored under
`src/compiler/stogir` at revision `7d35cb7`. Its [README](../../src/compiler/stogir/README.md),
[LICENSE](../../src/compiler/stogir/LICENSE), [NOTICE](../../src/compiler/stogir/NOTICE)
and provenance preserve credit to coil-stogir and Dmitry Stogov's IR. No per-file
license headers are added by the integration.

The adapter explicitly bridges CIR's extended integer containers and stogir's
scalar/address types, preserves memory control ordering, constructs cyclic Phi
and control edges before verification, and keeps every reachable terminator as
observable control, including paths with no return. Register-piece and x8
indirect results use stogir's ABI metadata; grouped arguments retain their
all-or-stack classification. Switches use stogir dispatch. Image text, private
relocatable constants and relocations merge into the compiler module. Embedded
jump tables retain `LC_DATA_IN_CODE`, with bounded u16 entry lengths and VM offsets.

Unit identities distinguish `stogir` from LLVM and TPDE. Debug info is not enabled
by default for this backend, and an explicit `-g` is diagnosed until implemented.
The public stateful JIT API has not yet acquired a stogir backend choice.

Evidence so far: a compiler candidate builds and checks the full compiler;
a direct CIR-to-stogir native JIT probe computes 42; the CLI check suite passes
72 checks, including a nested dependency/exclusion ownership regression. The
ordinary loop/call program reaches runtime functions but currently stops at
`coil.atomic.add` (CIR atomic RMW). There is no fallback. End-to-end executable
and comparative benchmark validation remain required.

Next work is native atomic adaptation, then the compiler corpus and identical
Coil benchmark sources/inputs under LLVM, TPDE and stogir. Runtime and compile-time
measurements must record compiler/source revisions, backend options, outputs,
repeated samples and separate compile/link/run phases before performance claims.
