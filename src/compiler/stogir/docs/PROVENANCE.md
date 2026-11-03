# Source provenance and credits

coil-stogir is a Coil port and adaptation of Dmitry Stogov's
[IR — Lightweight JIT Compilation Framework](https://github.com/dstogov/ir).
The reference checkout is pinned to
`92171d0a4a36b0acf707f2dea7998de615dd4acd`.

[LICENSE](../LICENSE) retains upstream's MIT permission/disclaimer text and both
copyright notices, with a copyright notice for the Coil implementation added.
[NOTICE](../NOTICE) identifies the upstream author, source, revision, and design
acknowledgments. Licensing and attribution are kept in these central files.

## Reference map

This map records derivation and design references. It does not claim a complete,
line-for-line translation of each upstream pass or equivalent behavior.

| Coil area | Upstream source / relationship |
| --- | --- |
| `types`, `node`, `opcode` | Scalar/vector type encoding, cell layout, opcode ordering and metadata from `ir.h` |
| `graph`, `builder`, `fold`, `integer-unary`, `integer-binary`, `conditional`, `checked`, `conversion`, `numeric-conversion`, `floating` | Construction, signed references, constants, and integer folding adapted from `ir.h`, `ir.c`, `ir_builder.h`, `ir_fold.h` |
| `calls`, `prototype-bytes`, `symbols`, graph string table | Prototype bytes, FUNC/FUNC_ADDR header annotations, FUNC/SYM/STR address constant layout, PROTO annotation, interned string identity, and control-pinned CALL shape follow `ir.h`, `ir.c`, `ir_builder.h`; the binary arena/hash implementation is Coil code |
| `verify`, `dump` | Validation and diagnostics developed against `ir_check.c` and `ir_save.c`, including DIV/MOD control-guard validation; dump format is currently different |
| Uses, CFG, dominance, loops, placement, scheduling | Pipeline developed against `ir_cfg.c` and `ir_gcm.c`; current natural-loop analysis and scheduling are incomplete |
| Liveness, ranges, constraints, allocation, phi/edge moves | Split-interval and SSA allocation work guided by `ir_ra.c` and its algorithm references; exact-subposition transfer indexing is Coil code; not yet upstream allocator parity |
| Terminal control | TRAP/UNREACHABLE and optional START/terminal-list links follow `ir.h` and `ir.c`; UNREACHABLE retains its reserved second slot. Shape/type checks and linear terminal-chain validation are Coil implementations. TRAP emits the reference AArch64 BRK; this target gives UNREACHABLE an explicit breakpoint/re-entry sequence. |
| Switch dispatch | SWITCH and CASE_VAL/CASE_RANGE/CASE_DEFAULT shapes follow `ir.h`, `ir.c` and `ir_builder.h`; `ir_aarch64.dasc` is the target reference. Signed order-key normalization, heapsort validation, balanced range decisions and case edge-transfer stubs are Coil implementations. Dense singleton selection follows the upstream count/span rule; signed 32-bit relative tables replace its full-address entries, retaining the same dispatch/control model. |
| Scalar locals and frame layout | VAR/VADDR/VLOAD/VSTORE, FRAME_ADDR, ALLOCA/AFREE and BLOCK_BEGIN/BLOCK_END metadata and access behavior follow `ir.h`, `ir_ra.c` and `ir_aarch64.dasc`; separate local/spill maps, SP/x29 contexts, outgoing-prefix layout, saved-entry-SP realignment and count-domain guards are Coil code; allocation/free consistently round original counts to the function alignment (minimum sixteen), unlike the qualified upstream dynamic-AFREE source concern |
| AArch64 selection/emission and ABI | `ir_aarch64.dasc` is the target reference; current Coil encoders emit words directly rather than using DynASM; typed scalar truth and floating comparison conditions (with consistent compare/select extrema), conversion sequences (with canonical Boolean destinations), checked-overflow conditions/sequences, DIV/MOD/ROL, MIN/MAX/COND and scalar unary sequences are adapted with explicit scratch handling; unary population count encodes both SIMD register fields |
| Vector long constants | LONG_CONST header/payload order, byte-count limit, DJB2/header hash and full-payload interning follow pinned `ir.h` and `ir.c` (`ir_long_const`, `ir_long_const_commit`, `ir_const_vector`). Checked span metadata, payload-reference protection, verifier/dump integration and private aligned shared-image materialization are Coil implementations. No TPDE or LLVM implementation is imported. |
| Vector graph transport | Independent Coil construction and semantic checks over upstream vector type encoding and LOAD/STORE/Phi shapes. SIMD class/memory integration uses the existing direct encoders. Simultaneous block-entry Phi ranges and edge destinations correct this implementation's scalar/vector pressure defect; no other backend source is imported. |
| Mixed-width copy/spill ownership | Independent Coil per-edge sized copy planning, checked native emission and parent-indexed spill shapes over the existing allocation/move pipeline. Native/linked tests use full payload and frame comparisons; no TPDE implementation is imported. |
| Full-width SIMD transfers | Independent Coil Q-register move, memory and simultaneous-copy emission over the existing frame and move planners. Encodings were checked against LLVM MC output; native byte comparisons and protected pages verify complete 128-bit payloads. No LLVM or TPDE implementation source is imported. |
| Grouped argument ABI | Independent Coil metadata and shared incoming/outgoing placement. The scalar prototype prefix remains upstream-shaped; the versioned SGAG trailer is a Coil extension. Placement was checked against [Apple’s ARM64 ABI documentation](https://developer.apple.com/documentation/xcode/writing-arm64-code-for-apple-platforms), [Arm’s AAPCS64](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst), and LLVM assembly emitted from Coil C aggregate probes. |
| Aggregate result ABI | Independent Coil result-storage roles, SGAG version2 metadata, private frame buffers and immediate return-bank capture. Native x0/x1, v0–v3 and x8 placement follow the Apple/Arm ABI references above and are checked against typed Coil C ABI interfaces. No upstream or TPDE result-lowering implementation is imported. |
| Short-vector/HVA ABI checks | Independent Coil fixtures for 64/128-bit pieces and one through four homogeneous members. Fixed C callbacks, typed C function pointers and LLVM-generated variadic calls check argument/result placement in JIT and linked AOT. The raw entry-SP capture probe is encoded in Coil; its words were checked against LLVM MC. No LLVM implementation source or external-language probe is shipped. |
| Vector binary arithmetic | Typed operation/guard validation follows the shared upstream opcode and type model. Independent Coil AArch64 binary encoder/emitter, with lane/width and scalar SIMD cases checked against LLVM MC. Integer 64-bit MUL and DIV/MOD use native lane expansion; remainder re-extracts the dividend to stay within reserved x16/x17. Full sequences and lane primitives are independently checked against LLVM MC. Scalar lane oracles and native JIT/linked AOT pressure fixtures verify complete payloads. No LLVM implementation source or external-language arithmetic implementation is shipped. |
| Vector unary arithmetic and bit counts | Independent Coil SIMD/scalar encoders for NEG/ABS/NOT, lane byte swap and counts, checked against LLVM MC and integer/bitwise payload oracles in JIT and linked AOT. Shared lane transfer primitives preserve existing binary wrappers. The pinned upstream AArch64 vector ABS NIY is recorded; native ABS and complete lane counts extend that reference target coverage. No external-language implementation is shipped. |
| Vector shifts | Shared upstream opcodes and scalar/vector count roles, with an independent Coil AArch64 encoder checked against LLVM MC. Count normalization follows this library's width-masked scalar policy; valid-range behavior matches the reference, while out-of-domain target differences are documented. No upstream or LLVM implementation is linked or shipped. |
| Vector extrema | Shared MIN/MAX opcodes and vector type geometry from pinned IR, with independent Coil D/Q encoders. Integer lanes use target SIMD min/max or 64-bit CMP/CSEL. FP lanes deliberately preserve the existing scalar compare/select contract, which differs from pinned AArch64 FMINNM/FMAXNM for exceptional inputs. Words are checked against LLVM MC and full result bits against Coil oracles in JIT and linked AOT. No external-language implementation is shipped. |
| Vector comparisons | Predicate opcodes/type geometry and AArch64 SIMD comparison encodings reference pinned IR. Independent Coil construction/verification checks full-lane integer masks and pointer-width geometry; native sequences preserve scratch/result aliases. FP U-prefixed relations and orderedness deliberately follow this library's scalar rules, extending/differing from pinned vector target paths. LLVM MC and Coil bit/mask oracles check JIT and linked AOT behavior. No external-language implementation is shipped. |
| Vector lane transport | EXTRACT/REPLACE/SPLAT opcodes, operand shapes and equal-width integer lane compatibility reference pinned IR. Independent Coil builders and native adapters use SIMD lane words for constant indices, TBL for dynamic extraction, and precomputed lane-ID masks/BSL for dynamic replacement; they do not copy upstream's stack-indexed dynamic path. LLVM MC, Coil raw-bit oracles and JIT/linked pressure checks validate behavior. Invalid dynamic indices have explicitly defined zero/unchanged behavior. No external-language implementation is shipped. |
| Whole-vector conditional selection | Shared COND metadata, scalar truth and fold/CSE rules reference pinned IR. Independent Coil validation admits vector results with exactly typed arms, and AArch64 emission uses captured flags plus CSETM/FMOV-or-DUP/BSL with protected source aliases. LLVM MC and raw-bit Coil oracles check JIT/linked behavior and full NaN payload preservation. No external-language implementation is shipped. |
| Vector rotates | Independent Coil width-masked ROL/ROR composition, with full-width alias saves and a single-lane RORV path using shared lane primitives. Independent LLVM MC words and mathematical u128 oracles verify JIT/linked AOT results; forced-register harnesses check physical aliases directly. No external-language implementation is shipped. |
| Indirect aggregate arguments | ARGVAL opcode/layout and call-time private-copy/pointer semantics follow `ir.h` and `ir_aarch64.dasc`. Checked construction/use validation, separate per-occurrence storage, forward aligned copy-area layout and frame-alignment propagation are Coil implementations. Unlike the reference memcpy call sequence, this target uses reserved-register native copies before argument installation. |
| Native argument copying | Independent Coil AArch64 emission over the checked encoders. Bounded word loops and exact tails use reserved temporaries without importing a runtime memcpy implementation. Used by the ARGVAL indirect-copy path. |
| Bulk memory construction | Independent Coil expansion into the upstream-shaped LOAD/STORE, loop, branch and PHI nodes. Exact-width chunks, small-move snapshots and bounded forward/backward loops are implemented here; no upstream or TPDE bulk-copy implementation is imported. |
| Module image composition | Independent Coil implementation over the shared image model: public definition binding, private namespace isolation, stable per-input ID maps, section/relocation/text-data rebasing, per-section alignment propagation and immutable input validation. |
| JIT images, relocation planning, Mach-O writer | Coil implementations of a shared text/data image with symbol binding, ABS64/branch/page relocations, and Mach-O serialization; format references are Apple SDK headers and LLVM MC object output, with no SDK or LLVM source vendored. Data-in-code spans preserve relative jump-table metadata, with MH_OBJECT VM-offset entries and u16 length splitting. Aligned section VM layout was checked against LLVM MC output; checked reservation/protection layout and original-mapping release tracking are Coil implementations. Named FUNC/SYM/STR graph lowering uses shared image relocations; additional formats/features remain unfinished |
| Vector bitcasts | Shared BITCAST opcode and type geometry reference pinned IR. Independent Coil validation compares complete storage extents for explicit pointer widths; literal folding copies little-endian bytes and native D/Q casts reuse typed register transfers. Named addresses retain relocations. Coil byte oracles check JIT and linked objects. No external-language implementation is shipped. |
| Atomic extension | Five new Coil opcodes follow the unchanged upstream 0–125 identifiers. Checked unsigned-storage operations and native acquire/release/LSE encodings are independent Coil implementations, checked against LLVM MC and raw-byte JIT/linked/thread-contention oracles. These operations are compiler integration requirements beyond pinned upstream IR. No TPDE or LLVM implementation is imported. |

| Constant shift and copy selection | AArch64 `IR_SHIFT_CONST`, `IR_MUL_PWR2` and copy/reuse cases in pinned `ir_aarch64.dasc` are the reference. Coil selection avoids rematerializing constant shift registers; encoder words are checked against LLVM MC. Known canonical unsigned producer results and same-register integer bitcasts avoid redundant copies. This does not establish full matching/reuse/coalescing parity. |

| Construction canonicalization and extension-chain folding | Operand ordering follows pinned `ir_fold.h`'s lower-reference-to-op2 convention, including checked ADD/MUL. `TRUNC(ZEXT/SEXT)` uses upstream's four width cases and restart semantics. Construction tests cover integer type combinations at both pointer widths; dynamic JIT checks preserve original operand liveness and malformed chains are rejected. |

The current graph uses separate contiguous arrays for instructions and constants.
The current allocator, fold rules, target coverage, verifier, and optimization
pipeline remain incomplete. See [PLAN.md](PLAN.md) for the delivery gates.

## Additional references and distribution

The neighboring coil-tpde package demonstrates the independent library followed
by a compiler backend. TPDE/coil-tpde target and object code has also been consulted
as reference material. This package currently vendors/imports no TPDE modules.
TPDE and its contributors have a separate Apache-2.0 WITH LLVM-exception license;
MIT attribution for IR cannot replace that license if TPDE source is adapted in
future work. Preserve file-specific notices when introducing any such source.

The current package uses Coil's standard library and native platform APIs; it
ships no upstream C implementation or DynASM source/generated action tables.
Compiler, runtime, or other dependencies bundled in a future binary release need
their own applicable notices. Packaging this library must include `LICENSE` and
`NOTICE`, together with any later third-party license files. A future Coil backend
vendor/import step must carry these files into Coil along with the source.

Keep this map current as more upstream modules are ported or
other source is reused. Attribute algorithm and design references separately from
copied or translated source so their roles remain clear.

### Persistent target matching

`stogir.a64.match` follows the placement of `ir_match` before virtual-register
assignment/liveness in pinned `ir.h:ir_jit_compile`. Its initial fusion rule is a
conservative subset of `IR_CMP_AND_BRANCH_INT` in `ir_aarch64.dasc:ir_match_insn`
(around line 1698). The virtual-register omission and consumer-position operand
uses follow
`ir_ra.c:ir_assign_virtual_registers_slow` and `ir_add_fusion_ranges`. The plan,
machine def/use metadata, ownership and integration are independent Coil
implementations over the original graph references.
Unlike upstream's broader all-fusible-users support, the initial rule requires
one scheduled use, the same scheduled block, 64-bit integer operands and no
explicit root. Other values retain ordinary materialization. This does not
claim full matcher, coalescing or register-reuse parity.

### Fallthrough and branch layout

Conditional inversion/fallthrough and END/LOOP_END jump omission follow pinned
`ir_aarch64.dasc:ir_emit_jcc`, `ir_emit_jz` and the `ir_emit_code` END cases.
Deferred edge-copy buffers and transactional conditional-branch relaxation are
independent Coil implementations. The far-case prefix-layout computation
preserves the existing relocation/image boundary and rebases all offset-bearing
metadata. It does not import DynASM code or establish full veneer parity.
The pinned bottom-up/top-down block scheduling algorithms remain unported.

### Post-allocation block ordering

`stogir.block-layout` ports/adapts pinned `ir_cfg.c:ir_schedule_blocks`,
`ir_schedule_blocks_bottom_up` and `ir_schedule_blocks_top_down`: static edge
frequencies, deterministic tie-breaking, early chain joins, loop rotation,
loop alignment and final chain grouping. The ≤256/reducible policy and small
function bypass follow upstream. Optional empty-entry merging remains disabled.
Dense RPO keys are CFG metadata over the original references, not another
instruction IR. Sparse CFG adjacency is reused through a packed edge-index API.

Post-allocation empty-block checks follow `ir_emit.c:ir_match` start/END-only
candidates and the `ir_ra.c` rule that real moves keep a block nonempty. An
all-empty-cycle anchor protects unsimplified CFGs while SCCP remains absent.
Loop alignment uses pinned AArch64's eight-byte requirement, carried through
code buffers and shared images; conditional relaxation preserves it. The
alignment-aware prefix machinery is independently implemented in Coil.

A temporary native oracle linked the unmodified pinned C library and received
identical post-allocation CFG facts. All 59 checked cases match its emitted
block order and loop-alignment choices. This verifies this scheduling core;
it does not establish parity for the still-incomplete surrounding optimizer,
loop analysis, allocator or optional entry modes. No C wrapper is linked into
or shipped with the Coil library/backend.

### SCCP value domain and worklist

`stogir.sccp-values` ports the combined constant/copy lattice operations from
pinned `ir_sccp.c`: identity lookup, circular copy-partition insertion and
splitting, constant/copy/long-constant meets, use notification and backward
input discovery. The original 16-byte union representation is retained through
`stogir.node`; payload equality is bitwise. This is analysis metadata over the
existing graph, not a replacement instruction representation.

`stogir.bitqueue` adapts pinned `ir_private.h`'s deduplicating bit worklist,
including rewinding for newly added lower references. It reuses the library
bitset; nonzero-word discovery now uses trailing-zero count, as upstream does,
instead of a loop over individual bits. Bounds handling remains independent
Coil API behavior. Domain internals require valid references and lattice
preconditions, like upstream's internal functions.

The recorded differential calls the unmodified pinned static lattice functions
from a temporary reference-only C translation unit. It normalizes the LAST_OP
sentinel (126 upstream, 131 here due to appended atomic operations) and inactive
union fields. No C wrapper ships or participates in JIT/AOT. The SCCP analyzer,
transformation, iterative optimizer and optimization-level policy are not yet
implemented or connected by this checkpoint.

### In-place rewrites and initial-owner spilling

The graph rewrite API provides the reference-stable storage changes needed by
pinned `ir_sccp.c`'s transformation and iterative optimizer. Unlike upstream's
retained input-count NOP storage, a reduced Coil extent exposes the cleared
released cells as standalone NOPs with explicit arity metadata. No preexisting
valid reference moves. Use-list/analysis rebuilding remains the owning pass's
responsibility; construction CSE is invalidated by the graph API.

Blocked allocation now handles upstream `ir_ra.c:ir_allocate_blocked_reg`'s
`child = other` case when an evictable owner has no earlier register assignment
to retain. At the owner's starting position, its whole spillable prefix is
spilled and its future required-use suffix is requeued. A register-required use
at that position remains an error. The independent allocator still does not
claim parity for optimal split positions, register reuse/coalescing or all
upstream allocation policies.

### Loop-vectorization development

`stogir.loop-shape` and `stogir.loop-affine` are new optimizer analyses over the
existing compact graph, scheduled CFG and dominator metadata. They recognize
single-path natural counted loops and checked unit-stride affine footprints.
No automatic vectorizer is claimed from pinned upstream. Unsupported control,
loop-carried state or memory operations keep their scalar graph. Numeric
constant handling excludes symbolic relocatable constants. Pointer/base identity
is not treated as a no-alias guarantee; versioning must check footprints.

### Feasible Phi analysis — development branch

`stogir.sccp-phi` adapts pinned `ir_sccp.c:ir_sccp_analyze_phi`, meeting only
feasible predecessor inputs, ignoring self identities, discovering top inputs
backward and reusing the combined copy/constant lattice. This module is under
development in the isolated analysis worktree and is not wired to codegen.
The transition tests now compare 4,110 normalized observations with the
unmodified pinned function, including long Phi operand retention, changing
feasibility, discovery, copy-partition splitting and direct/propagated scalar,
symbolic and long constants. See `validation/sccp-phi-oracle.json` for exact
scope and source hashes. This component differential does not establish a
complete SCCP analyzer, rewriting pass or optimized backend pipeline.

### SCCP worklist/control analysis — development branch

`stogir.sccp-analysis` and `stogir.sccp-control` adapt the worklist order,
reachability facts, selected projections, merge counts, continuation retention
and iterative-candidate discovery from pinned `ir_sccp.c:ir_sccp_analyze`.
The original graph remains immutable; analysis owns the combined domain and
queues. General folding returns an explicit development error rather than
silently substituting overdefined results. MEM2SSA immediate-Phi policy and
graph transformation are not implemented.

Fifty-nine control-flow cases match 641 normalized final-state observations
against that unmodified function, including loop-edge widening and switches.
This differential covers those cases, not all control/call/load operations or
the complete analyzer. Evidence: `validation/sccp-analysis-oracle.json`.

SCCP reuses the constructor's numeric truth helper. Named symbol truth stays
unknown because the shared image resolver permits address zero; this deliberately
retains the library's existing contract instead of upstream's nonzero-symbol
assumption. Signed narrow switch ranges use the graph's width-aware order keys;
the differential switch cases use full-width signed/unsigned selectors.

### Scalar lattice folding — development branch

`stogir.sccp-fold` bridges the combined domain to the existing construction
evaluators. Its discovery/benefit gate, constant/copy meets and conversion
iteration candidates follow pinned `ir_sccp.c:ir_sccp_analyze` and
`ir_sccp_fold`. Scalar arithmetic, comparisons, conversions, checked arithmetic,
overflow projection and conditional selection reuse Coil's established scalar
rules. Overflowing checked operations remain instructions. Analysis explicitly
owns the target pointer width; constants are validated against that width.

The scalar folding checkpoint covered 818 graphs and 4,973 observations: 4,941
match exactly. The remaining 32 are recorded rule-coverage extensions, not
discarded cases: the existing Coil evaluator folds literal bit counts and
same-type signed extrema absent from the pinned matching rules. Those results
also have independent known-answer assertions. Reference normalization preserves
upstream's three reserved constant references and its sign-extended narrow
constant representation. See `validation/sccp-fold-oracle.json`.

This is not full upstream folding parity. Algebraic restart/structural rules,
PROTO and remaining vector families are unfinished. Eligible unported families
return explicit errors in this development runner. No graph transformation or
production optimizer integration is enabled.

### Rooted graph transformation and native COPY — development branch

`stogir.sccp-rewrite` adapts `ir_sccp_transform`, region/Phi compression and
terminal-list unlinking from the pinned `ir_sccp.c`. Selected IF/SWITCH paths use
its retained END/BEGIN form. This port keeps that form to preserve protected
references; redundant-block cleanup is still pending. A working graph duplicates
the same compact representation and interning tables, with all original IDs
unchanged. Failure releases the working copy, preserving the input and its caches.
External data roots stay positive via COPY nodes; unreachable control roots are
removed from the returned root list. New uses/CFG/schedule/matching are required.

Typed native COPY covers GP, floating and 64/128-bit vector identities using
existing capture/transfer emission. Operand/definition constraints precede
allocation. The pinned target selects `IR_COPY_INT/FP | IR_MAY_REUSE`; full reuse
hint/coalescing parity is not claimed. The pinned `IR_COPY_HARD` bit prevents
folding, while still permitting native register reuse. Its new reproducer fails
three assertions without the barrier check and passes with it.

Native original/transformed execution, linked AOT payloads, wide Phi extents,
terminal chains, source/cache ownership, no-change detection and rejected-rewrite
cleanup are covered in `validation/sccp-rewrite-native.json`. This is a development
component, not full SCCP iteration or an enabled optimized compiler backend.
Its refreshed comparisons include 59 control-flow graphs and 820 folding graphs,
including both hard-copy cases. The same 32 existing fold extensions remain
explicit; no unexplained reference differences were found.

### Mutable def-use lists — development branch

`uses.add!`, `remove!` and `replace!` adapt pinned `ir.c`'s use-list mutation
policy: reuse trailing zero slots, append at the pool end, relocate blocked
buckets, preserve removal order and update one matching edge. Coil keeps the
operand position alongside each user reference, so repeated operands remain
distinguishable. Callers must re-read ranges after mutation. This extends the
existing use-list representation for the iterative optimizer; it does not create
another semantic IR. Validation: `validation/mutable-uses.json`.


The base/constant memory address matching rule is ported/adapted from pinned
`ir_aarch64.dasc:ir_match_fuse_addr`. Its machine-use representation remains the
existing compact graph plus target metadata. Individual encodable consumer edges
may fuse while a shared/rooted address definition is retained. See
[ADDRESS_MATCHING.md](ADDRESS_MATCHING.md) for coverage and validation.


Canonical pre-allocation block order follows pinned `ir_gcm.c` checks and
`ir_fix_bb_order`. A successor heap preserves the original scanning priority
without quadratic high-fanout rescans. Irreducible-side-entry ordering is not
yet ported and retains the existing RPO. See LOOP_BLOCK_ORDER.md.

Indexed opcode metadata follows pinned upstream `ir.h` opcode order and the
numeric table approach. See OPCODE_METADATA.md for representation and oracle.

Finalized per-value location indexing follows upstream virtual-value interval
ownership and split-child linkage. See LOCATION_INDEX.md for representation.

Local aggregate promotion adapts pinned `ir_mem2ssa.c` eligibility and SRA rules:
constant ALLOCA extents, nonescaping address uses, exact disjoint typed fields.
The current implementation forwards within control blocks and deletes storage
only when every load has a replacement. It does not yet port cross-block Phi
construction. Graph references stay stable; dual control/value results are
remapped separately. See tests/jit-mem2ssa.coil and its linked AOT consumer.

Cross-block field promotion preserves pinned ir_mem2ssa.c's typed Phi and
control/value renaming semantics. The SSA discovery algorithm is a Coil
implementation using demand-driven incoming/outgoing definitions and explicit
work frames, rather than the pinned implementation's dominance-frontier
placement and renaming walks. It uses only the compact graph. Uninitialized
paths reject promotion for the complete allocation; loop-local allocation
boundaries reset incoming values. This is not a claim of full mem2ssa parity
(VAR promotion and broader aggregate layouts remain open).

### Empty boolean control diamonds

`boolean-diamond` adapts the conservative constant-0/1 subset of
`ir_sccp.c:ir_optimize_phi` and the typed boolean COND folds in `ir_fold.h`.
It preserves this implementation's observable control roots with an END/BEGIN
boundary and maintains exact use lists. Nonempty arms, multiple Phis, overflow
and RLOAD-dependent conditions remain excluded. Inverted wide integer results
retain COND; this does not claim the full upstream IF-conversion/folding surface.

### END/BEGIN normalization

`control-merge` follows pinned `ir_sccp.c:ir_merge_blocks` and its iterative
BEGIN eligibility checks: no computed label, one use per boundary and a direct
control successor. A local worklist revisits exposed BEGIN boundaries; an
explicit remapping table preserves caller-observed roots across removals. It
runs before boolean-diamond conversion and scalar iterative cleanup. Other
upstream CFG/control transformations remain incomplete.

### Preserved AArch64 general registers

`a64.callee-saved` and the expanded GPR class follow pinned
`ir_aarch64.dasc` used-preserved-register prologue/epilogue policy. This first
step saves full x19–x28 values in a distinct private frame area. Darwin x18,
scratch x16/x17, FP/LR and preserved SIMD lanes retain their separate policies.
SIMD v8–v15 remain excluded; no complete ABI/allocator parity is claimed.

Call-boundary split preservation and argument moves are lowered as one typed
parallel-copy group over their shared pre-call state. This is a Coil extension
to its existing subposition transfer implementation, not a late change to graph
semantics. Non-call odd-position transfers without dedicated operand/definition
phase support still fail explicitly.

### Fixed-use event indexing

`fixed-uses` is independent Coil analysis storage that accelerates the existing
linear-scan pressure policy guided by pinned `ir_ra.c`. Its sorted per-register
events, persistent split ownership forest and lazy path compression are Coil
implementations, not a translation of upstream's active/inactive linked lists.
The semantic graph, interval constraints, allocation decisions, verification and
subposition transfers are unchanged. Every split path updates ownership; fixed
uses outside live ranges remain represented. The full-scan query is retained as
an independent oracle. Assigned-interval scanning still needs separate work.

### Assigned-value and physical-reservation pressure discovery

`reserved-ranges` uses an independent Coil maximum-end segment tree for immutable
canonical physical reservations. `allocation.AssignedIndex` keeps the remaining
assigned values, expires only their final ranges, retains holes, and re-reads
split/evicted ranges. These structures implement the existing pressure policy
under the monotonic linear-scan frontier guided by pinned `ir_ra.c`; they are not
a translation of upstream's active/inactive linked lists. Noncanonical inputs
retain general intersection/next-use handling. All three pressure vectors and
verification remain unchanged.
