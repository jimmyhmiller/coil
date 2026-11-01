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
`src/compiler/stogir` at revision `f29043e`. Its [README](../../src/compiler/stogir/README.md),
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

The same combined fixture now executes successfully under LLVM, TPDE and stogir:
loops, dense switches, grouped aggregate parameters, two-register and x8 indirect
results, four-float HFA results, FP conversions/NaNs, stack memory, ArrayList heap
allocation, function pointers and native atomics. Exported aggregate C ABI tests
also pass all three engines. Mach-O serialization and the existing JIT loader
selftest pass. The CLI objects section runs these checks on macOS arm64.

An initial full corpus run passes 6 of 9 programs. Remaining failures include
pinned-register shim calls, narrow bit operations/i128, and deep tail recursion.
The adapter currently demotes tail calls to ordinary calls and returns, so deep
recursion exhausts the stack. This must be fixed before general backend use.
Unsupported operations diagnose rather than fall back to another selector.

The target-program reachability pass is shared with TPDE and retains exported
entries, direct and indirect function references, and native-data references.
Host image APIs retain all requested functions for later private-name lookup.

Comparative benchmarking is available in `scripts/benchmarks` using the
same Coil source, inputs and `-O3 --no-debug`. Measurements separate compile,
platform link and executable run, rotate backend order and compare full output.
The [initial comparison](../benchmarks/STOGIR_INITIAL.md) records five measured
samples and full input hashes. Public stateful JIT selection and DWARF remain
unfinished.

## Architecture fidelity audit

The reference is pinned upstream `ir.h:ir_jit_compile` and
`ir_main.c:ir_compile_func`. Its optimized pipeline is:

1. Construction folding/CSE and def-use lists.
2. Optional mem2ssa with CFG/dominators, followed by CFG invalidation.
3. SCCP at optimization levels above one.
4. CFG/dominators/loops, global code motion and scheduling.
5. Target matching, including fusion and register-reuse rules.
6. Virtual-register assignment, live ranges, coalescing and allocation.
7. Block scheduling and target emission.

The Coil port preserves the compact Sea-of-Nodes graph and the independent
relocatable-image boundary used by JIT and AOT. It does not yet implement every
stage above. SCCP and mem2ssa are absent. Persistent AArch64 matching now precedes liveness and carries selected scalar
rules and conservative single-use, same-block 64-bit compare/branch fusion.
Its def/use metadata retains the original graph references. Full target fusion
and reuse coverage remains incomplete. Coalescing and upstream-equivalent block scheduling are incomplete.
The split-interval allocator also needs a detailed invariant audit against
`ir_ra.c`; its current implementation must not be represented as established
upstream parity.

The current local AArch64 changes correspond to upstream `IR_SHIFT_CONST` and
`IR_MUL_PWR2` rules in `ir_aarch64.dasc`. Upstream also supplies copy/reuse flags
that must be carried through matching and allocation. Efficient encodings alone
cannot replace these missing stages. The next optimizer work belongs in the
independent library, with the adapter limited to CIR-to-graph translation and
construction APIs. No benchmark-specific loop rewrite or alternate backend is
an acceptable substitute.

The pinned pipeline does not establish an automatic loop-vectorization pass.
The stencil is useful for exposing the LLVM O3 gap, but closing it must not be
claimed as an automatic consequence of completing upstream's scalar pipeline.
The original benchmark samples remain the fixed baseline.

The [persistent matching checkpoint](../benchmarks/STOGIR_MATCHING.md) records
the next source snapshot and unchanged workload. Its ≥5× codegen target is met
in the measured medians; the runtime-within-10% target remains unmet.

AArch64 emission now omits END/LOOP_END jumps to the next scheduled block and
inverts conditional predicates for true fallthrough, following pinned target
rules. Nonempty edge copies remain path-specific in deferred stubs. Direct
conditional branches beyond their reach relax transactionally with all labels,
relocations and table offsets rebased together. Allocation positions stay fixed.
Physical bottom-up/top-down block-chain scheduling remains unported; this
emitter change does not complete that separate pass.
