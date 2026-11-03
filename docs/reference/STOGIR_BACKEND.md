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
`src/compiler/stogir` at revision `13a6bfe`. Its [README](../../src/compiler/stogir/README.md),
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
pinned-register shim calls and deep tail recursion. The narrow-bit/i128 gap
from that run is repaired in 0dcc4101; scalar FP math CIR remains unsupported.
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
stage above. The library now provides rooted SCCP analysis, owned graph
rewriting and incremental scalar fold/CSE/DCE. The adapter passes the requested
optimization level explicitly: O1 retains the existing native path, while O2/O3
run that pipeline before CFG/GCM, matching and liveness. O0 explicitly diagnoses
the missing distinct fast-allocation path. This supersedes the previous behavior
where the CLI level did not select native optimizer stages. Optional mem2ssa,
remaining fold/restart rules, promotion and control/load cleanup remain pending.
Persistent AArch64 matching precedes liveness and carries selected scalar
rules and conservative single-use, same-block 64-bit compare/branch fusion.
Its def/use metadata retains the original graph references. Full target fusion
and reuse coverage remains incomplete. Coalescing remains incomplete. The post-allocation block scheduling core now
follows upstream bottom-up/top-down selection; optional empty-entry merging and
surrounding CFG/loop metadata parity remain open.
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
The subsequent post-allocation layout checkpoint now supplies the physical
block-chain scheduling core; the earlier fallthrough checkpoint did not include it.

The [fallthrough checkpoint](../benchmarks/STOGIR_FALLTHROUGH.md) preserves the
next measured snapshot: stogir runtime 2959.625 ms, TPDE 3987.739 ms and LLVM O3
308.410 ms, with stogir codegen 5.22× faster than LLVM. The combined runtime and
codegen goal remains unachieved. Earlier reports and original baseline are unchanged.


## Post-allocation block layout

The standalone pass ports pinned `ir_cfg.c` bottom-up Pettis-Hansen for small
reducible functions and top-down positioning for >256 blocks or irreducibility.
It preserves static frequency estimation, tie-breaking, early joins, loop
rotation and loop alignment. Shared post-allocation CFG facts produce identical
orders/alignment decisions in 59 checked comparisons against the unmodified
pinned C scheduler. This proves the scheduling core on those facts; surrounding
optimizer/loop-analysis/allocator parity is still unproven. Optional empty-entry
merging remains disabled.

Allocation subpositions stay fixed. Physical emission follows original schedule
indices and aliases proven-empty start/END blocks. Actual edge/split moves keep
blocks nonempty, and all-empty cycles retain an anchor. Eight-byte loop alignment
is preserved by conditional relaxation and carried through the code-buffer/image
alignment fields into JIT, AOT and module merging. Each PAGE21, PAGEOFF12 or
BRANCH26 relocation describes one instruction, so adjacent branches/calls remain
valid while true overlaps are rejected.

The [block-layout checkpoint](../benchmarks/STOGIR_BLOCK_LAYOUT.md) records
compiler `60174544`: 4.85× faster codegen and 9.68× LLVM runtime on the unchanged
workload. Both active criteria remain unmet. Its 59-case scheduler differential,
212 standalone checks, 65 linked consumers and Coil FAST 49/49 pass.

## SCCP value-domain prerequisite (historical)

The vendored library now includes the combined constant/copy lattice from
pinned `ir_sccp.c`, using 16-byte cells and circular copy partitions. Its
deduplicating bit worklist supports backward discovery and lower-reference
insertions. The shared bitset now finds the first bit in a nonzero word using
trailing-zero count, following upstream.

The domain differential matches 179,554 state/queue observations across 13
traces, including forward/reverse dependent-partition splits, exact floating
payloads, symbolic and long constants. This does not enable SCCP: its analyzer,
graph transformation, follow-up iterative optimization, mutable compilation
ownership and optimization-level policy remain pending. Current `-O3` behavior
must not be represented as upstream optimized-pipeline parity.

The [SCCP-domain validation checkpoint](../validation/STOGIR_SCCP_DOMAIN.md)
records source provenance, differential scope and delivery checks. New timings
for the shared-bitset change remain pending an uncontended machine.

## Graph rewrites and initial-owner pressure

The graph now supports whole-node rewrites within existing cell allocations.
Shrunk tails become cleared NOPs with valid arity metadata; later references
stay fixed. Construction CSE is invalidated, while the owning optimizer must
remap incoming edges/roots and rebuild use/analysis caches. These APIs do not
yet connect SCCP to codegen.

Blocked allocation now spills a whole owner prefix when eviction occurs at its
start and no register-required use occurs there. This follows upstream's
`child = other` case; it does not claim optimal-split or full allocator parity.
It fixes the allocator rejection in a pressured graph-rewrite program; that
source program then reaches the separately recorded i128 CIR type gap. Native
JIT and linked AOT pressure fixtures execute correctly with the fix. Immediate
required uses remain protected. Repeated CSE invalidation skips an already-empty
map, avoiding repeated capacity scans during rewrites.

The [rewrite/pressure validation checkpoint](../validation/STOGIR_GRAPH_REWRITES.md)
records stable storage, the initial-owner spill correction, native before/after
evidence and installed checks. SCCP is still not enabled.


## SCCP mode integration validation

The vendored executable source `799bba6` passes 228 standalone programs and
69 linked AOT consumers with fresh objects and frozen-input checks. Public
library mode tests compare JIT/AOT paths and verify constant-pool ownership
through image finishing. Compiler executable source `3baa1650` passes full FAST (49/49, 343.1 seconds,
with time and 1.60 GB memory warnings) and is installed with its matching SDK.
Off-checkout object generation/link/run checks pass LLVM, TPDE and stogir;
new SDK namespaces resolve and all 127 installed modules match standalone
source. The stogir corpus remains 6/9 with the same known failures.
All optimization stays inside the existing `ir-codegen` timing span.
The [delivery report](../validation/stogir-sccp-pipeline-installed.json) records
these checks. The [latest timing attempt](../benchmarks/STOGIR_SCCP_MODES.md) is
provisional due competing compiler processes and does not meet the performance
goal. Older prerequisite-only statements above describe historical checkpoints.

## Full compiler bootstrap checkpoint

Adapter 0dcc4101 legalizes i128 into two scalar graph values, including calls,
PHIs and memory, and preserves narrow bit-operation widths. The full compiler
now compiles and independently self-rebuilds byte-identical target objects on
both stogir and LLVM paths. This is functional support, not LLVM performance
parity: normal linked builds take 39.799s with stogir versus 11.319s LLVM O3;
the stogir-built compiler runs substantially slower on compiler workloads.
See [full measurements](../benchmarks/STOGIR_COMPILER.md) for phases, sample
ranges, load qualifications, binary disassembly and validation. Historical
checkpoint statements above describe their original revisions.

## Cross-block field promotion and closed Always expressions

The library now constructs typed SSA values across joins and loops for supported
nonescaping ALLOCA fields. It preserves CFG predecessor positions, resets
loop-local allocation lifetimes, and retains the complete allocation when any
path is uninitialized. The discovery algorithm uses explicit demand-driven work
frames; it is documented separately from upstream's dominance-frontier walk.

Shared native CIR lowering accepts closed expression sequences and conditional
scalar or aggregate results marked Always. It validates every nested expression, rejects lexical/control
escapes, caches immutable-body eligibility, tracks active callees to break
recursive cycles, and bounds the callee to 64 AST nodes, cumulative expansion
to 16,384 nodes per function and nesting to 16. Default/Hint/Never policy is
unchanged. This extends existing language-annotation lowering; it is not general
module-level IR inlining. Coil's reference-model struct parameters retain their
pointer aliases. Actual aggregate TV arguments are captured as private values
when evaluated, before later arguments; explicit mutable copies remain distinct.
Sequences contain no lexical bindings, cleanup/control escapes or static identity
changes. Unsupported bodies retain ordinary calls.

Timing mode includes eligibility, aggregate value capture and outermost
inlined-body lowering spans in
the native codegen sum, aggregated once per source function. Nested spans are
not counted twice. Those optimizer costs are no longer hidden in IR creation;
older reports did not charge them and retain their original timing definition.
