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

### Control-chain scalar memory forwarding

`load-forward` follows pinned `ir.c:ir_find_aliasing_load_i` for control-chain
load/store forwarding, same-width bit views and integer truncation. The Coil
version conservatively stops at all calls, register writes, unknown effects and
block starts rather than implementing upstream's pure-call and register-set
exceptions. Query and address walks are bounded independently of graph size.

Contained extraction at a nonzero constant byte offset is an independent Coil
extension, enabled only by an explicit little-endian target argument. Logical
shift and truncation preserve integer bits; BOOL/pointer partial views are
excluded. Full-width integer/pointer bitcasts and constant address displacements
are decomposed without inferring disjointness for different bases. Unknown or
partially overlapping stores remain barriers. This is construction-equivalent
memory folding before promotion/SCCP and all matching/liveness, not an emitter
peephole or a relaxation of mem2SSA's exact-field eligibility rules.

### Signed high-field view folding

The incremental fold kernel independently implements the integer identity
`SEXT(TRUNC(SHR(word, wordBits-fieldBits))) = view(SAR(word, wordBits-fieldBits))`.
It reuses only a single-use, unrooted intermediate cell and updates exact use
edges and the affected-node work queue. Same-width BITCAST retains the final
signed/unsigned type. Shared/rooted fields and neighboring shift distances are
unchanged. This is a Coil rule related to pinned ir_fold.h's conversion/shift
families, not a claimed translation of an identical upstream pattern. Scalar
SEXT nodes seed iterative folding analogously to existing TRUNC conversions.

### Shared post-allocation emission location resolver

The existing immutable per-parent split-child index is now borrowed by an explicit
`locations.View` threaded through all normal AArch64 emission helpers. One view
is shared by the main function body; it neither constructs an index nor owns
allocation storage. Finalized allocation retains the index and parts until
emission finishes. The full-scan public interfaces remain compatibility wrappers
and a differential oracle, including negative-parent lookup behavior. This is
independent Coil plumbing for the existing location policy guided by ir_ra.c and
ir_aarch64.dasc; no new allocation or emission decisions are introduced.

### Indexed opcode arity facts

Fixed input counts and physical operand-slot counts are stored in signed-byte
lookup tables, matching upstream's ir_op_infos organization. Existing meanings,
variadic sentinels and invalid-opcode results are unchanged. The opcode test
independently derives both counts from the frozen pinned shape strings,
including extra metadata operands, and checks invalid integer boundaries.

### Numeric operand categories inside graph passes

Graph construction/verification, control and vector checks, use lists, liveness,
placement/scheduling, SCCP rewrites, promotion/forwarding and matching now consume
the existing packed operand codes directly. Public operand-name and string
predicate APIs remain compatibility interfaces and the independent oracle.
The compact numeric encoding is Coil storage for the pinned ir.h categories,
not a claimed copy of upstream's numeric enum values. Variadic data operands use
the existing def category; there is no separate arg code. The reference bitmask
preserves def/ref/var/src/reg/grd/ret/lbl exactly, and rejects invalid codes before
shifting. All validation and optional-reference behavior remain enabled.

### Observable value/control roots during memory rewriting

The independent positive-root API can observe a LOAD's value and the effects in
its control closure. When forwarding or promotion rewrites such a LOAD into a
typed COPY/BITCAST, its value reference remains and its resolved prior control
closure is added as a root. Removed private storage/control-only roots retain
their existing remapping. This preserves unrelated external effects through
subsequent SCCP without adding artificial operands or changing graph semantics.

### Bounded direct scalar graph-call expansion

`call-inline` is an independent interprocedural extension, not a claimed port of
an upstream module inliner. It retains the compact graph and existing typed
prototype encoding. The transactional component expands only direct named,
ABI-compatible, acyclic single-exit scalar definitions within an explicit node budget.
Never takes precedence. A bounded topological check rejects cycles; every control
node must be live from the single return. IF/BEGIN/END/MERGE and typed PHI nodes
are cloned without flattening or changing their predecessor order. Nested calls,
loops/frame-dependent operations, variadic
and aggregate-result ABI cases remain calls in this initial component. Ordinary
scalar results also accept validated grouped scalar arguments with identical
prototype bytes: grouping changes register/stack placement, while graph-level
arguments remain explicit scalar SSA values. Integer pairs and floating groups
are exercised by linked before/after execution.

Formal parameters map to actual SSA arguments; clones are reserved before edge
patching, scalar constants retain their bits, and effects remain on the explicit
control chain. CALL value roots retain their identity plus a control root.
Affected nodes seed the ordinary iterative worklist; all structural analyses
are rebuilt before matching/liveness. Linked before/after JIT images check
arithmetic, memory effects, FP/signed zero, immutable inputs and byte-identical
name/prototype/policy/budget fallbacks. No source annotations are changed.

The call expander also accepts same-width signed/unsigned integer parameter
pairs (u8/i8, u16/i16, u32/i32 and u64/i64), inserting explicit typed BITCASTs.
Flags, result type, parameter count and group trailer must still match exactly.
Bool/char, pointer, floating and integer width changes are excluded. Cast cells
count toward the transaction's growth budget. Linked execution checks high-bit
u32/i32 arguments, negative values and byte-identical width-mismatch fallback.

Named FUNC/SYM address constants retain symbol identity across expansion. Their
names and any attached prototype bytes are re-interned into the caller; graph
string IDs are never copied as if they were module-wide IDs. The embedding
module supplies explicit relocation bindings for new imports. Private STR
constants remain unsupported, preserving their identity and ownership. Linked
execution checks global loads, returned function-pointer identity and execution,
prototype-byte remapping, and unchanged private-string fallback.

### Feasible inputs of retained overdefined PHIs

The pinned SCCP representation/worklist and monotone bottom state are retained.
Our reference-stable graph pipeline additionally closes backward discovery over
all feasible inputs of a retained PHI, even after its meet becomes overdefined.
When region feasibility changes, already-bottom PHIs discover newly feasible top
inputs without putting bottom nodes on the analysis worklist. This closes a gap
exposed by module expansion and forward pure-data references; it is not claimed
as an identical port of upstream's early-terminating PHI meet loop.

The existing JIT rewrite suite includes a three-way switch whose first two PHI
inputs differ and whose last value is a forward BITCAST, with both immediate and
delayed final predecessors. The old code left that live value top and rewrite
failed. Both graph rewrites now verify and execute identically before/after.

### Iterative scalar conversion restarts

The iterative fold worklist now applies pinned ir_fold.h's nested TRUNC/SEXT/ZEXT
and BITCAST restart rules, plus SEXT of an AND with a clear sign bit or a nonzero
effective logical right shift. Some TRUNC/extension pairs were already folded by
construction; module expansion and SSA rewrites expose new pairs afterward.
Instruction references/types and protected roots are preserved, and maintained
uses are updated before affected nodes/users are requeued. Only nested candidate
ZEXT/BITCAST nodes get additional SCCP work seeds.

BOOL views are excluded because our byte-backed BOOL conversions canonicalize
nonzero bytes. Floating views are preserved unless both operations are bitcasts.
Shift counts use the IR's masked effective count, so shifting by a whole word
cannot incorrectly turn signed extension into zero extension. The existing JIT
iterative-fold suite exercises two pointer widths, rooted/shared observations,
use-list reconstruction, explicit rewrite/guard counts, raw FP/NaN payloads and
signed/high-bit inputs against the scalar conversion oracle. Native execution is
checked on the implemented 64-bit target; 32-bit cases verify graph/type policy.

### Scalar opcode property flags

Opcode classification uses a static byte table projected from this port's
pinned shape metadata, following upstream's scalar opcode-flag architecture.
The bit layout is local to this port, not upstream's numeric flag layout.
The string shape API remains available. Placement and SCCP query scalar flags
instead of constructing shape slices. All 131 entries and invalid opcodes are
checked against the preexisting independent string oracle.

### Integer-literal PHI conversion

The existing empty-diamond rewrite now accepts arbitrary integer literals,
following the constant-input subset of pinned ir_sccp.c:ir_optimize_phi's COND
conversion. Existing closed-control, use-count and movable-condition exclusions
remain. Boolean COPY/NOT/ZEXT shortcuts are restricted to actual 0/1 choices;
other values remain typed COND nodes. Stable observable END/BEGIN references and
maintained def-use lists are preserved. No effectful arm is speculated.

### Shared integer diamond values

The PHI-to-COND rewrite no longer requires exactly one use of the PHI value.
Pinned ir_sccp.c:ir_optimize_phi does not impose that restriction: the replacement
keeps the same typed reference, so every consumer observes the same selected
value. Control-region use restrictions remain unchanged. The control suite
compares 2048 cases, including two observations of each PHI, against the branch
oracle, exact rebuilt use lists, ASAN and stogir-built execution. The old guard
fails the shared-value regression before the change.

### Canonical single-predecessor regions

Pinned ir.c:_ir_MERGE_N constructs BEGIN when its input count is one. This port's
raw graph API and the Coil adapter also admit explicit one-input MERGE nodes.
SCCP's bulk rewrite now canonicalizes a reachable one-input MERGE through the
existing region compressor even when no predecessor was removed. This also
rewrites attached one-input PHIs before use-list reconstruction and ordinary
END/BEGIN merging. It does not rerun SCCP or add a repeated whole-graph cleanup.
The control suite reproduces the previous blocked integer-diamond conversion
with one and three layers of rooted single-input regions, then compares native
before/after choices and validates retained roots. ASAN and stogir-built execution
pass; the old implementation fails the regression's conversion assertion.

### Literal folds exposed by raw graph cloning

Upstream SCCP's benefit gate assumes construction already folded initial literal
expressions. Our reference-stable inliner patches raw cloned nodes, which can
newly have only literal operands without a positive lattice replacement. SCCP
now evaluates that all-literal case through its existing evaluator. Mixed-input
benefit/discovery rules, DIV/MOD guard exclusion and COPY metadata policy remain.
This is an explicit bridge for this port's raw graph contract, not a claim that
upstream's gate is identical. No repeated SCCP pass is added.

The fold suite checks raw versus COPY-discovered conversions against the scalar
conversion evaluator, and raw arithmetic against explicit expected values. Seven
raw conversion cases fail before the change. ASAN, stogir-built fold execution,
and the affected pipeline/control/rewrite JIT suites pass. Raw-cloning-only cases
are excluded from the pinned upstream oracle stream, whose constructor contract
differs; existing oracle fixtures remain present.

### AArch64 literal boolean selections

An independent target selection pattern lowers typed integer COND(c,1,0) or
COND(c,0,1) directly to CSET using the existing truth flag emitter. Literal
choices need no register materialization, and CSET already produces canonical
0/1 at every integer width. Other selections, named addresses, relocations and
floating/vector result handling retain the ordinary selection path. This is a
local pattern extension, not claimed as identical upstream COND emission.

The native selection matrix includes both literal orders across integer/pointer
condition and result widths. Additional f32/f64 conditions check signed zeros,
finite values, infinities and NaN against a bit-level truth oracle. ASAN passes.

### Indirect result graph expansion

Our independent bounded graph inliner now accepts explicit indirect-result
prototypes. Their first graph parameter already denotes the caller's destination
(the incoming x8 storage), so ordinary parameter substitution and control/effect
cloning preserve the existing storage identity. Register-piece results remain
excluded: their private callee buffer requires a separate escape/alias proof.
The module execution suite compares linked before/after O3 images with aliased
and separate source/destination objects, store-followed-by-load observations,
multiple seeds, and byte-identical Never/zero-budget fallbacks. Both ASAN and
stogir-built execution pass. This extension is not claimed as an upstream port.

### Private register-result expansion

The independent graph inliner also accepts register-piece result prototypes when
both storage identities are proven private. The caller's result argument must
be a fresh exact-size ALLOCA immediately preceding this CALL. Its address may
only flow through full-width copies/bitcasts and bounded constant offsets to
normal capture loads after the call; escapes, other arguments, stores and rooted
pointer observations reject expansion. Caller uses are built lazily once per
batch, against the immutable source graph, only for eligible register results.

The callee must have one virtual result parameter. Existing mem2ssa field
classification proves that address does not escape; a complete straight control
chain must write every result byte, with no reads of the private result object.
This preserves the ABI's delayed capture when the caller's other pointers alias.
No private callee buffer is blindly replaced with externally visible storage.
Only the implemented 64-bit pointer target takes this path; 32-bit falls back.
This is a local extension, not claimed as an upstream inliner port.

The linked O3 before/after matrix covers GPR/signed pairs, f64 pairs, four f32
pieces and a vector return, including raw NaN payloads/high bits. Fresh captures
expand; external/oversized/aliased/observed/escaped/partially written/read-back
or non-immediate captures, Never, zero budget and the 32-bit target fall back
with byte-identical images. Undefined uninitialized capture cases are checked
structurally and are not executed. ASAN and stogir-built execution pass. The
previous implementation fails the expansion-count regression. Compiler module
integration and template promotion are separate subsequent work.

### Dead normal loads and pre-promotion pruning

The shared stogir.dead-code worklist follows pinned ir_sccp.c's dead-load
control bypass and recursive removal of unused foldable data. A normal LOAD is
removed only when its sole use is a control successor; that successor is wired
to the prior control and exact operand uses are updated. Observable data roots,
used load values, volatile accesses and atomics remain. Dependencies are queued,
so dead pointer expressions can expose more dead loads without another scan.
The same removal kernel participates in iterative SCCP cleanup.

Our memory pass also prunes dead reads before field classification, reusing the
uses it already built. This explicit local ordering bridge is needed for raw
undef aggregate construction: unused initial reads must not block promotion of
an otherwise-private object. There is no repeated SCCP analysis or new graph
copy in the pruning routine. The iterative pure-DCE path uses the shared kernel.

Native regression cases compare execution before/after, fresh versus maintained
use lists, idempotence, used/rooted values, rooted storage, volatile and atomic
reads, dead address/load chains, and constructor-style promotion. The old
pipeline retains ALLOCA and fails the regression. ASAN and stogir-built tests
pass; affected mem2ssa/iteration/control/module/atomic/rewrite/seed suites pass
ASAN. The overlap guard fixture now roots its overlapping value: an unobserved
read is legitimately dead and should not masquerade as an incompatible view.

### Empty static allocation cleanup after promotion

A private undef object's last reads can become dead only after another object's
stores are promoted away. The incremental removal kernel now also eliminates a
positive constant-size ALLOCA with only its control successor left. This is an
explicit local extension of mem2ssa's empty private-object removal into the
cleanup worklist, not attributed to upstream's dead-LOAD case. Allocation values
and roots must be unused. A lazily cached function-level proof rejects explicit
stack frees/block scopes, frame or register access, varargs, guards/snapshots,
assembly and exit calls. Dynamic/zero/negative sizes stay intact. No repeated
SCCP or memory pass is introduced; promotion skips candidates already removed.

The late-undef regression fails with the preceding dead-load-only pipeline.
Native before/after results, exact uses, rooted storage, balanced AFREE,
observed FRAME_ADDR and unknown-size allocation retention are checked. ASAN and
stogir-built checks pass, with the existing 2640 stack/free variants, frame,
mem2ssa, iterative folds, module execution and 112 atomic graphs passing ASAN.


### Closed returning loops in bounded call expansion

The independent graph inliner now accepts LOOP_BEGIN/LOOP_END and loop-carried
PHIs in a closed single-return region. This extends the earlier acyclic-only
component; it is not attributed to an upstream module inliner. The existing
two-phase clone reserves all definitions before patching forward and cyclic
edges. The closure check requires every control node to be reachable backwards
from the return. Separate non-returning regions remain ineligible. Nested calls,
frame operations, terminal side exits and variadic calls remain excluded.

`tests/module-execution.coil` compares linked native execution before and after
expansion of a loop with two PHIs, including zero and multiple trips, positive
and negative inputs, and Never/zero-budget fallback. A separate infinite control
region is explicitly rejected. ASAN passes; restoring the old inliner fails the
new expansion-count assertion. No source inline annotation or backend-specific
emission shortcut is introduced.


### Nested ordinary direct calls in bounded graph expansion

The next independent component accepts ordinary CALL nodes whose callee is a
named FUNC constant carrying its typed prototype. The existing constant mapper
re-interns both function names and prototype bytes in the destination graph;
CALL control/data edges and ABI grouping remain unchanged. Indirect PROTO nodes,
variadic calls and aggregate-result call adapters remain excluded. Never policy
and the transaction's actual graph-growth budget are unchanged.

The extended module-execution suite passes ASAN for a direct nested call and a
call inside a two-PHI loop, comparing linked execution before/after and checking
immutable inputs. Indirect and variadic cases execute correctly without graph
expansion; Never/zero-budget cases remain calls. Restoring the loop-only inliner
fails the new expansion-count assertion. Compiler adoption requires separate
worklist dependency, termination and recursive-template policy validation.


### Complete observed controls in call expansion

`Callee` now supplies `observed` controls separately from its unique RETURN root.
The independent bounded inliner validates these roots, uses all of them for
control closure, clones them through the normal two-phase mapping, and appends
their mapped references to caller observations. This preserves side exits and
infinite control regions rather than inferring observability from RETURN alone.
UNREACHABLE terminals are accepted with zero reserved operand and no linked
previous-terminal metadata. Frame/stack operations remain excluded, and the
private register-result proof remains restricted to its existing linear region.

The extended module-execution suite passes ASAN. Hot inputs compare linked
native before/after answers; cold inputs execute a helper CALL then UNREACHABLE
in child processes and must trap. A child watchdog bounds failures. Never and
zero-budget fallbacks preserve execution, and omitting the non-returning root
retains the original call. Restoring RETURN-only closure fails the new assertion.
This is an explicit independent inliner extension; normal graph verification,
CFG, placement, matching and liveness remain the post-optimization pipeline.


Observed roots can also be values after SCCP or CALL expansion. The initial
control-only observation validation failed while compiling the module-execution
suite with stogir (`generate-matched`: invalid inline observed control), so that
candidate was not delivered. The corrected contract accepts every valid positive
observation. A rooted PARAM mapped to a literal actual argument gets one positive
COPY observation, cached for duplicate roots; its original PARAM cell bounds the
additional growth. ASAN compares native before/after answers and checks duplicate
root identity, one-cell growth, Never/zero budget and a three-cell budget. The
strict-control version fails this regression before execution.


### AArch64 logical immediates

The pinned upstream `ir_aarch64.dasc` uses `aarch64_may_encode_logical_imm`
and logical-immediate binary rules. Our persistent selector now covers ordinary
32/64-bit OR, AND and XOR literals on either side. Zero, all-ones and masks that
cannot be encoded retain the register rule; narrow scalar and vector paths are
unchanged. Selection stores canonical N:immr:imms fields before liveness and
physical emission consumes those fields without redoing mask search.

The independent encoder discovers the smallest repeated element by halving,
then uses popcount/ctz to locate and verify its circular run of ones. It does not
copy DynASM's immediate encoder. Field/width/register validation rejects reserved
encodings, and the emitter checks the full tile payload before narrowing it.
Matching uses allocated scalar registers; ABI-specific SP/ZR forms remain the
responsibility of their existing encoders. Graph references, pass order, CFG,
placement, uses and the shared JIT/AOT emitter stay unchanged.

Host-independent encoder and selection checks cover known words, normalized
32-bit inputs, reserved fields and both literal sides. The existing native
`jit-bitwise` suite enumerates all 6,636 mathematical masks independently by
bit position and executes AND/ORR/EOR words against five inputs (99,540 hardware
answers), plus signed/unsigned graph compilation and non-encodable fallback.

The final tests retain host-independent encoder/selector checks and put hardware execution in the existing Darwin `jit-bitwise` suite. All four suites pass ASAN and when built by stogir O3. Logical matching avoids the pre-existing shift/multiply literal lookup, so the selected mask is analyzed only once.


Narrow scalar logical operations use the same 32-bit immediate tiles while
retaining `narrow!`'s existing input and result normalization. This includes
byte/halfword signedness and booleans; vector paths remain unchanged. The raw
constant already has the verified scalar type's width, so it is interpreted as
that value in the 32-bit instruction. Word-level zero/all-ones and unencodable
patterns keep their register fallback. Extended host-independent selection and
native graph tests cover all scalar widths, both literal sides, narrow signed
returns and boolean inputs. ASAN and stogir O3 tests pass.
## Conditional PHI branch splitting

The IF(PHI) and IF(CMP(PHI, literal)) transformations follow the control-shape approach in pinned upstream `ir_sccp.c`, `ir_try_split_if` (line 3168) and `ir_try_split_if_cmp` (line 3348), at commit 92171d0a4a36b0acf707f2dea7998de615dd4acd. This independent Coil implementation reuses compact graph references, updates def-use lists during each mutation, and queues only newly exposed predecessor merges. Optimization remains before matching and liveness, shared by JIT and AOT.

The supported subset has exactly two predecessors, one singly used unobserved scalar PHI, an optional singly used unobserved comparison against a typed literal, and complete true/false projections. Opposite constant outcomes collapse both tests; a single constant outcome moves the variable test onto its predecessor. Equal constant outcomes, shared values and protected value observations retain the original graph. Explicit control observations are remapped to preserve precisely the earlier effects without evaluating an incoming value prematurely. Root-observation handling is a library contract extension, not claimed upstream code parity.

Tests execute before/after graphs over integer and floating comparisons (including signed zero, infinities and NaNs), reversed predecessors, effectful paths, duplicate/control/value observations and nested merges. Incremental use lists are compared with an independent rebuild, and repeated application must be idempotent.

## Boolean comparison restart rules

Pinned upstream `ir_fold.h` contains EQ/NE with C_BOOL and explicit BOOL special cases in the EQ/NE(SEXT/ZEXT, integer literal) family. The independent iterative implementation recognizes a typed right literal 0 or 1, reuses exact replacement/unary rewrites, and revisits affected users through the ordinary queue. Extension matching retains upstream's single-use guard and conservatively excludes observed extensions. It supports both copy and NOT outcomes; non-BOOL sources and noncanonical comparison literals remain outside this subset. Broader extension range rules are not implemented here.

Native before/after cases cover direct BOOL and signed/unsigned extension, all EQ/NE and 0/1 combinations, shared/observed extension fallback, rooted comparisons, and unrecognized literal 2. Input bytes 0, 1, 2, 128, 255 and truncated wider inputs are normalized through the ordinary conversion semantics. Exact rebuilt uses, graph validation and idempotence are checked.

## Conditional graph-call transactions

`optimize-sites-if-changed` is an independent ownership/API extension to the bounded inliner. It validates the caller, every supplied callee, roots and distinct call sites before considering expansion, including Never and zero-budget inputs. Eligibility and private-result proofs read the borrowed source. The first proven expansion opens a single owning graph copy; errors release only owned storage. No-change returns None without copying or revalidating an unchanged graph. Some owns the changed graph, roots and queue. Borrowed inputs must remain immutable for the call, as in the existing API.

The existing `optimize-sites` and single-site convenience API preserve their always-owned return contract by copying on None. The compiler can use the conditional API and keep its current graph on None. No graph validation is disabled, no persistent proof cache is introduced, and pass order remains unchanged. Module execution tests exercise positive, policy/budget/mismatch and private-result negative cases through both contracts, release changed results before reusing callers, reject duplicate sites even at budget zero, check scalar snapshots/counts and execute the original/expanded graphs. ASAN and stogir-built runs validate ownership and native results.

## Local integer mask and extension comparison proofs

This independent fold extension uses the existing SCCP CONST decision and worklist. It does not claim an upstream range-analysis pass. Typed literal AND masks (either operand side), TRUNC(AND), ZEXT and nonnegative SEXT of those shapes yield allowed-bit masks in constant local work. Unsupported conversion chains, BOOL and pointer types remain unchanged. Signed relational folding requires a nonnegative bound; unsigned comparisons cover the full scalar bit pattern. EQ/NE use impossible-bit exclusion or an exact singleton, never the invalid endpoint-equality shortcut. Other relations require equal results at both interval endpoints.

Structural bounds inspect only the immutable input graph, including the comparison's original left operand. They do not consult transient lattice constants or copy identities on grandchildren: changes to those facts need not requeue a comparison once an intervening producer is Bottom. Ordinary direct-input SCCP constant folding remains lattice-aware. A focused transient-mask regression rejects temporary bounds, and a cumulative saved-register layout test exercises the real loop-carried mask failure. Both regressions fail against the prior implementation; the corrected compiler also passes the previously failing module-execution suite and the native mask/control matrices.

Raw-cloned structural comparisons must be evaluated before SCCP commits Bottom, even without a direct lattice replacement. A narrow opcode/producer-shape trigger supplies that opportunity, retaining the existing monotone lattice and deduplicated worklist. No extra graph analysis, pass, bounds-check bypass or workload-specific opcode limit is added. Numeric width masks use u64 with an explicit 64-bit case.

Tests compare raw AArch64 AND/conversion/CMP code against optimized graphs on 10,401 graphs, all 256 byte inputs and wider boundaries, across signed/unsigned 8/16/32/64-bit values, both constant sides, zero/noncontiguous/sign masks and unknown extensions. Selected analysis facts are checked with 4/8-byte target pointer widths. SCCP/fold-decision suites and the native matrix pass ASAN; the matrix also passes when built by stogir O3. The pre-trigger implementation fails the new constant-fact assertion, while its direct proof helper already returns the expected truth.

## Late constant IF and CFG reachability cleanup

Pinned `ir_sccp.c:ir_iter_optimize_if` converts a constant IF to END and changes both projections to BEGIN, detaching the untaken one. It invalidates CFG reachability; pinned `ir_cfg.c:ir_remove_unreachable_blocks` removes unreachable blocks and repairs merge inputs. The independent Coil implementation follows this phase separation: the affected-node scalar/control worklist records late IF changes, then one control-only forward reachability rebuild repairs control, PHIs, terminal links and explicit observations before CFG/GCM/matching consumers. It neither reruns SCCP nor copies the graph again. External entries/labels are preserved conservatively, and cycles without a live entry are unreachable.

Reachable merges retain precisely the corresponding Phi inputs; a single predecessor becomes BEGIN and its Phis become COPY. Variable-arity header counts and exact operand-position use lists are updated together. Terminal chains are unlinked before removed nodes become NOPs. Unreachable control observations disappear; unreachable pure-data observations fail transactionally as in the existing SCCP contract. The existing boundary merger and affected scalar queue are reused. This does not claim full upstream dominating-predicate, loop or load/store iterative optimization coverage.

`run!` retains its scalar-only compatibility behavior. The new `run-rooted!` requires mutable roots and protection bits naming the same observations; both the public owning iterative optimizer and SCCP finishing use it. Bitsets gain a clear operation for remapped observations.

The extended native control matrix passes ASAN and a stogir O3-built binary: 360 cases spanning both truths, predecessor positions, effectful paths, nested dead regions, an untaken infinite loop with watchdog, a live loop losing its backedge, linked returns, live Phi/control observations and duplicates. Unreachable data observations fail while the caller remains unchanged. Exact uses match an independent rebuild; affected reapplication is idempotent. Scalar-only processing fails the new late-IF assertion. Module execution, the 10,401-graph mask/conversion matrix and the SCCP pipeline suites also pass ASAN.

## Boolean choice and comparison inversion restarts

The iterative worklist now ports pinned `ir_fold.h` NOT(integer comparison) and COND(Boolean, 1, 0) rules. Predicate inversion changes the NOT cell to the inverse integer comparison (opcode xor 1), retaining its operands; floating comparisons are explicitly excluded for NaN semantics. Shared/protected comparisons remain intact. A Boolean choice of one/zero becomes COPY for BOOL, BITCAST for byte integers and ZEXT for wider integers. BOOL false/true arms become NOT. All rewrites retain graph references, update exact operand use edges and queue affected consumers without adding graph cells or another analysis. A single opcode dispatch selects these Boolean rules.

The existing native iterative-fold matrix adds 2,430 cases across eight integer types, all ten integer predicates, six NOT/choice/projection shapes and five shared/rooted modes, plus floating predicate exclusions. Native raw-versus-rewritten answers cover all byte patterns, wider boundaries and quiet/signaling NaN bit patterns. Exact uses are rebuilt independently, graphs validate and affected reapplication is idempotent. Both upstream rule families fail independently against the old implementation; ASAN, stogir-built iterative-fold/module execution and ASAN control tests pass. No full bootstrap performance claim follows from these tests.

A separate independent extension projects EQ/NE of a Boolean COND with opposite typed literal 0/1 arms back to its Boolean condition, inverting when necessary. It examines only current graph structure, preserves shared/observed selections, retains the original Boolean comparison reference when rooted and allocates no new cells. This is not claimed as a pinned upstream rule. Both arm orders and protected/shared conditions/selections are covered by the native matrix. Initial upstream-only integration left the opcode kernel unchanged at 109 instructions; the exact wide-choice projection was added in response to that measured gap.

## Current-graph fold view

Iterative folding previously allocated a complete SCCP Domain, initialized every value to Bottom, and never changed those facts. It now calls the shared scalar decision evaluator with an explicit current-graph view. Real SCCP continues to supply its actual domain; its public entry point and lattice-aware semantics are retained. The view is transient read state, not a new IR or a fabricated empty lattice. This removes graph-sized value/queue allocation and initialization from each iterative invocation.

The existing decision suite compares every decision kind, source and constant word between the current view and an independently constructed all-Bottom domain. The native 10,401-graph mask/conversion matrix does the same for every foldable node at both 4-byte and 8-byte target pointer widths. Full SCCP tests continue exercising real facts. Native pipeline validation and paired generated-object comparison are required before delivery.

## Reconstructing a tested bit

This is an independent algebraic extension, not a claim of a pinned upstream rule. The existing immutable-graph allowed-bit proof can establish that a value is either zero or a single specific bit. EQ/NE against zero or that bit then identifies which condition outcome means the bit is set. A COND that returns exactly that bit for the set outcome and zero otherwise reconstructs the original masked value. Boolean integer materialization is likewise redundant for a positive test of an already-zero/one value.

Only integer scalar result types and exact numeric literals participate. The bit must fit the destination width. Same-type replacement retains protected roots as COPY; other types use the appropriate BITCAST, ZEXT or TRUNC, preserving typed bit patterns. Wrong polarity, zero/multi-bit masks, named constants, lost high bits and unsupported producers remain with ordinary folding. Shared/rooted predicates and values keep their meanings. Rewrites allocate no new graph cells, maintain exact uses and feed the existing worklist; there is no repeated analysis or extra IR.

The existing native iterative-fold suite adds 10,024 cases including direct and widened signed/unsigned masks, both AND operand sides, kernel bits 1/2/4/8 and wide sign bits, EQ/NE against zero/bit, both arm orders, byte/word result widths, BOOL materialization and shared/rooted values. Native answers compare raw and rewritten graphs before and after draining the worklist, across all byte inputs and wider boundaries. Exact uses are independently rebuilt and graphs validated. Disabling this rule fails its positive-fold assertion. The full suite passes ASAN and when built by stogir O3; module execution, control, fold-decision and real SCCP suites pass. Compiler integration and performance are measured separately.

## Constant-only iterative CSE

Pinned ir_sccp.c:ir_iter_find_cse searches positive input use lists, relying on construction CSE for pure constant-only expressions. Raw cloning can expose duplicate named-address BITCASTs after that construction phase. A separate lazy exact-key index complements the existing positive-input path. This is an independent extension retaining the upstream affected-worklist architecture, not an additional IR or another whole optimization pass.

The index is created empty and built only on the first eligible query. It covers pure scalar-expression opcode families with at least one constant reference and no positive reference, excluding zero-input frame/context observations and memory/control instructions. Full node words and arity validate matches. It records initial canonical candidates and sparse duplicate links, announces only the queried expression's later duplicates, and validates changed/deleted canonicals before reuse. Ordinary repeated duplicate lookups are O(1); stale candidates are repaired from their own bucket. One index survives both drains around rooted control cleanup. It is released with the invocation; ordinary positive-input CSE is unchanged.

A current compiler graph dump demonstrates four identical BITCAST(type U64, named address -21) nodes feeding four copies of the same table address. The focused native tests cover earlier/later seeds, an unrelated-key seed, distinct symbols and both protected copies, preserving exact uses and native embedded-string loads. Direct invalidation tests cover changed/deleted canonical nodes, newly constant earlier nodes and excluded FRAME_ADDR. Both ASAN and stogir-built suites pass, including full module execution and existing scalar/control matrices. The previous folder fails the new constant-only CSE assertion. Compiler integration and performance are measured separately.

## Affected-worklist exact-width load forwarding

Pinned ir_sccp.c:ir_iter_opt retries aliasing loads after scalar/control simplification. The iterative kernel now reuses the existing bounded alias finder for equal-width L2L/S2L forwarding. It preserves ordinary data uses through COPY or typed BITCAST and separately bypasses control-source uses. Calls, volatile/atomic operations, unknown overlapping stores, block boundaries and unsupported uses remain barriers. Exact-width bit reinterpretation is endian-independent; partial-width extraction remains in the early pass with its explicit endian setting. No untyped numeric floating conversion, extra graph cells, or repeated full forwarding pass is introduced.

Our arbitrary observation roots extend upstream's terminal-root model. Forwarding a rooted LOAD retains its data reference and adds its predecessor observation when needed, preserving preceding external effects even without a RETURN root. Rootless compatibility calls leave protected loads intact. To retain unreachable-data diagnostics, loads encountered by the first scalar/control drain are deferred in a sparse list until control reachability/merge repair has checked observations. Only those surviving affected loads are seeded for the final drain. The constant-expression index is reused across both drains. Normal data/CSE changes continue queuing affected loads within the final drain.

The existing mem2ssa suite adds 2,115 cases across scalar typed views (including signed bytes, pointers, NaNs, BOOL exclusions and unsupported partial widths), exact/disjoint/unknown stores, volatile loads, opaque writing calls, explicit block boundaries, late-constant diamonds and five observation modes. Native raw/revised return values and both memory words agree for aliased and distinct pointers. Exact uses are independently rebuilt, graphs validate, protected values/effects survive and affected reapplication is idempotent. A direct RETURN consuming one LOAD as both control/data checks exact edge separation and rootless compatibility. An explicitly seeded unreachable LOAD proves that forwarding before observation checking incorrectly accepts it; the deferred version rejects it and leaves the caller graph unchanged. The previous folder fails the new positive forwarding assertion. ASAN, stogir-built memory/module/iterative suites and existing ASAN control tests pass.

## Numeric displacement identity in alias decomposition

The bounded alias decomposition must establish that an address displacement is numeric before reading its constant bits. Named FUNC, SYM and STR constants store string-table IDs in that field, not resolved addresses. The existing shared numeric-constant predicate now guards displacement decomposition; fixed numeric FUNC_ADDR values retain their existing behavior. This corrects the shared early and iterative forwarding proof without adding symbol resolution or inferred pointer provenance.

The native mem2ssa suite adds both ADD operand orders and load/load versus intervening-store cases for named functions and symbols, with resolver values deliberately different from string IDs. Named strings receive structural checks, and fixed numeric function addresses are positive controls. Before the guard, native execution changes an expected result of 11 to 0; with the guard, raw and forwarded code agree. The report remains open until the corrected backend is delivered.

## Contained-range scalar register reuse

The allocation-stage identity proof follows pinned `ir_ra.c:ir_coalesce` / `ir_vregs_inside` and the COPY / same-bank BITCAST `IR_MAY_REUSE` selections in `ir_aarch64.dasc`. A scalar child's complete live ranges must lie inside the source's actual disjoint ranges, and its register class and storage width must agree. BOOL-producing conversions normalize their input and are excluded. Hard COPY retains its optimizer barrier while permitting native register reuse, as upstream does.

Graph references and observations remain unchanged. Compatible original constraints are grouped before physical reservations/allocation; the immutable location index maps their graph references to the canonical split children. No overlapping duplicate allocation or assembly peephole is introduced. Fixed requirements contributed by earlier children participate in later conflict checks. Source groups may accept successive singleton definitions in the verified forward data schedule. This grouping extends the pinned implementation's conservative exclusion of already-coalesced intervals; containment of the retained source ranges and exact fixed-position compatibility provide the proof for every member.

Constraint lists are retained during grouping and merged once per final group with a k-way heap. Full position/reference keys track fixed constraints, avoiding both truncation and repeated copying of a growing source use list. The small many-copy benchmark exposed quadratic behavior in the initial implementation (about 6.6 ms for 2,048 copies); the batched implementation takes about 0.194 ms in the same LLVM-built diagnostic, excluding fixture construction. This is a component scaling check, not compiler acceptance.

The allocation integration suite adds a scalar/bank/range/fixed-conflict matrix, native ordinary/hard copies and same-bank cast chains, and a native BOOL normalization exclusion. A 128-child group tests conflicts against previous children, forced physical reservations, splits, spills, every original fixed requirement, and exact indexed-versus-linear transfer lists. Native and ASAN suites pass. The previous allocator fails the native contained-copy assertion. Existing module/memory, mixed-spill, allocator-oracle, call-pressure, conversion, FP and vector-transport suites are used before compiler integration; compiler performance is measured separately.

Coalesced virtual-register identity also governs ordinary CFG edge reconciliation: multiple live graph aliases request one transfer for their allocation owner. The generic conflicting-destination check remains strict. A reduced indexed-edge test covers aliases both with and without their canonical reference live on the edge. Scalar loop execution checks simultaneous Phi updates and prior copied bits. Phi-entry overlap is excluded from containment reuse because the compact two-position range model does not distinguish incoming ordinary values from the new Phi definition phase. Native and ASAN edge/allocation suites pass; an integration candidate exposed the missing edge identity before installation.

Coalescing visits the schedule once. It constructs the part index only on a reusable instruction, the fixed-use map only on a contained candidate, and group/merge storage only after a successful identity proof. Functions with no legal merge retain the original allocation path and location-index shape. This removes eager per-function group setup without weakening the containment, fixed-use or edge-phase checks.

## Native register/reference preferences and soft returns

Pinned `ir_ra.c:ir_try_allocate_preferred_reg` tries register and reference hints only when the register remains available for the whole interval; ordinary longest-available allocation remains the fallback. The AArch64 target supplies return-register hints rather than hard fixed return-use constraints, and supplies reference reuse preferences for extensions and copies. Our allocator now carries optional per-part hints, inherited by split children. Stable original part indices own advisory recent-assignment caches; no pointer survives part-array growth. Every preferred choice still obeys target classes, actual fixed uses and computed interference bounds. Default-created generic parts have no hints and retain the previous behavior.

After coalescing, the AArch64 bridge attaches return and same-bank copy/conversion preferences. Parts are still sorted by graph reference at this stage, so binary lookup avoids a second dense graph-sized map. Return values may remain in their actual register or spill slot; emission captures them into the ABI register before normalization/result lowering and the epilogue. Parameter/call-result definitions retain their actual ABI requirements. Constant-return materialization is unchanged.

The reduced adjacent-lifetime hard-copy example drops from MOV/ADD/RET to ADD/RET with identical native answers; this is register selection, not a graph-copy fold. A forced-spill return test crosses a real call returning 99 into x0 while the required return value resides in a stack slot. Disabling positive-value ABI capture makes it fail with expected 0, got 99. Preference tests cover full-interval availability, masks, real fixed requirements, fallback and split inheritance. Native/ASAN allocation tests and existing allocation oracles, mixed spills, module execution, call pressure, integer/FP conversion/arithmetic, vector returns/transport and saved-register suites pass. Compiler integration and matched performance are measured separately.

## Full-width address views in target matching

The constant displacement rule follows pinned `ir_aarch64.dasc:ir_match_fuse_addr`, including exclusion of named symbol constants. Coil's adapter represents many field addresses as a full-width word ADD followed by an address BITCAST. The matcher now recognizes bounded chains of bit-preserving u64/i64/address views and commuted numeric constants. Narrow, floating/vector and COPY operations are not traversed. Fixed numeric function addresses remain numeric; named FUNC/SYM/STR string-table IDs do not become displacements.

This is a target selection rule, not another graph optimizer pass. Each absorbed memory edge is replaced with its positive base before liveness. A sparse worklist retires only newly unused pure word ADD/view expressions, counting replacement base edges first. Shared or rooted expressions survive. The semantic graph is unchanged. Native address tests cover signed/unscaled/scaled limits, out-of-range values, integer/FP/vector widths, shared/rooted/escaping addresses, hard COPY barriers, bounded view depth and named versus numeric constants; the old matcher fails the new cast-wrapped address assertion. Native and AddressSanitizer runs pass.

## Persistent immediate integer comparisons

The target rule follows pinned `ir_aarch64.dasc:ir_emit_cmp_int_common`: numeric immediate CMP/CMN operands avoid a materialization register, and byte/halfword comparisons normalize according to signed versus unsigned comparison semantics. Selection now records the displacement and condition in the existing Tile before allocation. Left-hand numeric constants are commuted with the matching condition reversal without changing the semantic graph. Negative full-width/32-bit operands use CMN with equivalent width-specific carry/overflow flags; zero retains CMP, whose carry behavior differs from CMN zero. Named FUNC/SYM/STR IDs are not numeric operands. Encoding gaps and out-of-range magnitudes retain the ordinary register form.

The compiler's fused-branch emission now consumes its persistent selected Tile for both operands and condition. Compatibility entry points select from the unchanged graph; the native pipeline does not reconstruct original operands after register allocation. Existing full-width-only branch-fusion coverage and root protection are unchanged. Ordinary value-producing comparisons share the same checked encoding helper; narrow normalization remains in the established emitter. No optimizer pass, replacement IR, graph nodes, or late assembly peephole is added.

The native/ASAN regression matrix executes 10,920 graphs across all ten integer conditions, scalar widths, both constant sides, returned values, fused branches and rooted/unfused branches. Host i128 arithmetic supplies an independent expected-value oracle for overflow/carry boundaries and high argument bits. Literal-kind checks distinguish named symbols from fixed numeric addresses, and malformed immediate tiles cannot append half a CMP/CSET sequence. The old selector fails the new zero-comparison assertion. Reduced zero/minus-one/4096 leaf functions shrink from five to four instructions and preserve every checked native result. Compiler integration and runtime/compile-time measurements remain separate requirements.
