# Vendored coil-stogir

Copied from [coil-stogir](https://github.com/jimmyhmiller/coil-stogir), revision
`ca716c2`, on 2026-11-05. The independent library remains maintained in that
repository. This snapshot contains its Coil implementation, with no compiler
adapter or test generators embedded in the library.

The library is ported/adapted from [Dmitry Stogov’s IR](https://github.com/dstogov/ir),
pinned at `92171d0a4a36b0acf707f2dea7998de615dd4acd`. See [LICENSE](LICENSE),
[NOTICE](NOTICE), and [source provenance](docs/PROVENANCE.md). Include these notices
with distributions and updates. Attribution is centralized here.

Positive optimization levels above one invoke the standalone SCCP pipeline
through the native image API. See [mode policy](docs/OPTIMIZATION_MODES.md)
and [implemented optimizer stages](docs/ITERATIVE_OPTIMIZER.md) for coverage and
remaining upstream gaps. O0's distinct fast-allocation path is not implemented.

O3 additionally selects guarded integer loop vector prefixes through the same
compact graph and shared JIT/AOT image path. O2 retains scalar SCCP optimization.
See [vectorization](docs/LOOP_VECTORIZATION.md) for legality and scalar fallback.

Memory base/constant offsets are selected before liveness and allocation.
See [address matching](docs/ADDRESS_MATCHING.md) for shared-address and COPY rules.

Allocation pressure indexes fixed constraints and omits inert initial records.
Integer vector doubling is selected before liveness. See
[pressure indexing](docs/PRESSURE_INDEX.md) and [vector doubling](docs/VECTOR_DOUBLING.md).

Canonical block scheduling follows pinned upstream before allocation; pressure
queries reuse per-register storage. See [block order](docs/LOOP_BLOCK_ORDER.md)
and [pressure buffers](docs/PRESSURE_BUFFER.md) for coverage and limits.

Indexed opcode shape and operand metadata preserves the string API and generated
code. See [metadata validation](docs/OPCODE_METADATA.md).

Finalized split-child locations use per-value indexing for CFG and contiguous
transfer reconciliation. See [location indexing](docs/LOCATION_INDEX.md).

Nonescaping aggregate fields are promoted across control joins and loops before
SCCP. Uninitialized paths conservatively retain storage. Assignment verification retains all
checks through a sparse class index and live-range sweep; see
[verification](docs/ALLOCATION_VERIFICATION.md).

Native tail-call matching follows pinned upstream late CALL/RETURN selection,
after module inlining. JIT and AOT share ABI/frame eligibility proofs; copied
or stack arguments and escaped frame addresses retain CALL/RETURN.
See [architecture](docs/ARCHITECTURE.md) for validation and implementation scope.

Contiguous pure integer switch results can fold to guarded packed arithmetic;
the original default effects and traps are preserved. This is an independent
extension using existing scalar IR. See [packed switch lookup](docs/SWITCH_VALUE_LOOKUP.md).

Def-use construction initializes known integer storage extents in bulk; exact
edge categories and mutation semantics stay intact. See [initialization](docs/USES_INITIALIZATION.md).

The compiler can explicitly prioritize smaller registered templates under its
existing clone budget. Ordered library APIs remain unchanged; see
[site priority](docs/INLINE_SITE_PRIORITY.md).

Known-size plain analysis buffers use bulk zero initialization. See
[storage initialization](docs/ANALYSIS_STORAGE.md).

Pressure queries skip immutable empty register buckets before traversing interval
ranges. See [pressure register domain](docs/PRESSURE_REGISTER_DOMAIN.md).

Immutable preparation shares one exact use index across early/late placement and
local scheduling. See [use-index lifetime](docs/IMMUTABLE_USE_INDEX.md).

Experimental constant bulk expansion uses a 128-byte budget before scalar memory
promotion. This is a local policy probe; generation/runtime benefit is unproven.

Explicit fixed function-lifetime objects are selected before register liveness and
rematerialized through calls and Phi copies. Raw stack operations retain SP
semantics. See [fixed entry objects](docs/STATIC_ENTRY_ALLOCATIONS.md).


Context-bound parameter specialization/cache is selectively copied from
coil-stogir f97960a (2026-11-05): call-inline.coil, graph.coil and
parameter-specialize.coil. See [specialization](docs/PARAMETER_SPECIALIZATION.md).
Only the opt-in cache API changes inline selection; original semantic validation
and clone limits remain. Compiler performance/adoption is unproven.

Preallocation Phi live-range coalescing is copied from coil-stogir; see
[implementation and credit](docs/PHI_COALESCING.md). Performance is unproven.

Verifier family dispatch uses a checked per-opcode mask while retaining semantic
validators and diagnostic order. Integer32-bit bitcasts and truncations follow pinned AArch64
register-move selection. See [dispatch and word views](docs/VALIDATOR_DISPATCH.md).

Backward modular integer-width propagation is copied from coil-stogir d6300b1.
It follows pinned upstream iterative truncation preflight/apply architecture,
with exact-use/protected-root checks and explicit traversal storage. MIN/MAX/ABS,
BOOL and pointer conversion boundaries remain excluded. Standalone validation
and native JIT/AOT evidence are recorded in that library commit.

Declared nonwriting scalar-call forwarding and conservative validated-body
effect proof copied from coil-stogir e5c96da. See central provenance and NOTICE.

Effect promises are independent of inline ABI compatibility, copied from
coil-stogir93349ce. Only CONST/PURE bits are excluded from flag comparison.

Symbolic word constant rematerialization is copied from coil-stogir d47fd14.
Persistent matching removes only proven address-word views from virtual-register
liveness; read-only constant locations preserve graph references and use the
existing literal, ABI capture, Phi and relocation paths. Frame kinds unchanged.

Private GP register-result captures are selected before liveness, with matched
call output groups and fixed ABI constraints. See [validation and limits](docs/validation/result-projections/README.md).

Bounded address/index/displacement alias analysis enables forwarding past stores
to proven disjoint private storage. Raw stack/unknown/indexed-area and symbol-alias
cases remain conservative. See [validation](docs/validation/memory-area-alias/README.md).

Native readonly register-result targets are distinguished from their explicit
caller capture writes. Forwarding requires disjoint queried/capture footprints;
indirect x8 results remain barriers. See [validation](docs/validation/register-result-effects/README.md).

Finite countdown update copied from coil-stogir231c610 (2026-11-06).
Independent register/memory unit-countdown rules use the existing affected-node
optimizer and control cleanup. Memory reduction preserves the initial read and
zero-trip no-write path; effects, volatile/atomic accesses, unsupported aliases
and protected observations decline. No destructor semantics are changed.
See validation/finite-countdown and validation/memory-countdown in docs; this is
not claimed as a pinned upstream loop-elimination port. Credits remain centralized.

Shared wide integer IF comparison fusion copied from coil-stogir f675d59.
Follows pinned upstream all_usages_are_fusable for supported IF consumers;
retains roots, data, hard COPY and unsupported GUARD consumers. All consumers
read actual operands before liveness. See docs/validation/shared-compare-fusion.

Structural verifier operand reads copied from coil-stogir78394b7, combined
with shared comparison fusionf675d59. Full extent and signed reference domain
are checked before direct operand storage reads. Validation and centralized
provenance are in docs/validation/structure-proven-operands and docs/PROVENANCE.md.

Integer verifier header operand reads copied from coil-stogir756b206.
Successful structural validation proves current operand fields; referenced cells,
types/widths/guards remain checked. See docs/validation/integer-operand-fields.

Identity-only iterative Phi cleanup copied from coil-stogir309d37e.
No new CFG/full scan; exact identity/self-edge rules preserve roots and barriers.
Independent extension, with native/ASAN validation in docs/validation/iterative-phi-identity.

Affected MERGE reconsideration copied from coil-stogir19d6a1a. Phi cleanup can
expose existing literal diamond conversions; local iteration shares the bulk
rewrite body and normal root/control repair. See docs/validation/affected-merge-diamond.

Diamond consumer wakeups copied from coil-stogird2ab904. Existing comparison
folds must restart after a producer becomesCOND even when reference operands
stay unchanged. See docs/validation/diamond-user-notification. Direct choice
projectionf83436a is not included in this candidate.


Verifier semantic-family gate copied from coil-stogir d108f15, validation86a7f4e. Preserves all inner checks and their order, including overlapping families. Independent verifier source optimization; pinned upstream revision unchanged.71,050 exact-result/diagnostic differential cases and ASAN pass; two local paired timings show1.7–2.0% verifier improvement. No whole-bootstrap performance claim.


Fused free-register choice copied from coil-stogir75ed841/docs532a9cd. Exact limit array and prior lower-ID selection/hint policy retained;69,984 differential policy cases plus native/ASAN allocation suite pass. Independent source optimization, pinned upstream unchanged. Mixed-hint LLVM microbenchmark regressed; actual-emitter evaluation pending, no whole-bootstrap claim.


Exact ordered comparison choices copied from coil-stogir caa8275 (base33d6b59). Includes correctness-only active-reservation protection and verified-reader c89a0d5; excludes both rejected register-release retry policies. Exact comparison-input identities follow pinned ir_sccp.c MIN/MAX recognition. Generic graph retains COND; AArch64 chooses existing signed/unsigned CMP/CSEL recipes from comparison opcode, preserving canonical CIR word interpretation.1,219,680 original/selected nativeanswers in native and LLVM-ASAN runs pass, including literals, addressbits, sharedcomparisons and rooteddiamonds. No new full matching scan. Central LICENSE/NOTICE unchanged. No bootstrap performance claim.


Cheap guard ordering copied from coil-stogir e48c294: reject non-COND nodes before matcher flags/error equality, and reject nonordered/nonidentity choices before movability work. Pure predicates reordered;1,219,680 native answer regression passes. Initial f1b39ed6 compiler result was neutral/slower; this follow-up is measured separately.


Phi-entry spill-home correction copied from coil-stogir 32c1770 (base 4e068bc). A Phi certifies its parent's home only when its block-entry location, where Phi transfers and literals write, is that home. Fixes a miscompile of `stogir.verify.integer-operations-target-structured` in the Stogir-built compiler (a831fb94 host failed `missing integer operand`). Real-graph property replay, native/ASAN suites and exact whole-bootstrap object reproduction pass. See coil-stogir docs/validation/phi-home-entry.


Short-trip vector guards copied from coil-stogir fc1efb6 and result-only narrow normalization from 7075173 (base 32c1770). A vector prefix tests its trip count before evaluating its memory-range checks; AND/OR/XOR/ADD/SUB/MUL/NOT/NEG on 8/16-bit values extend only their result. Loop-guard/vectorize native, AOT and ASAN suites and narrow/bitwise/truth native and AOT suites pass. Whole bootstrap reproduces the seed object; runtime effect within noise.


Callee-saved atomic results copied from coil-stogir 03d2b10: the A64 atomic emitter accepts any allocatable GPR result (previously only x0-x15), fixing a compile failure for atomics whose value lives across a call. jit-atomic-across-call (new), jit-atomics, atomics and linked aot-atomics pass.


Boolean view folds, zero-test branches and paired frame saves copied from coil-stogir 3860588 (base 03d2b10). EQ/NE of integer Boolean views (COND of 0/1 literals, and PHIs of them) fold back to BOOL predicates; IF/COND conditions are canonicalized through NOT and BOOL zero tests, and dominating-predicate checks compare truth normal forms. A64 IFs testing CMP Rn,#0 with EQ/NE emit CBZ/CBNZ, and FP/LR plus adjacent callee-saved GPRs are saved with STP/LDP. jit-boolean-folds (new), fixups, a64-encode and frame-memory pass; the full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures. Whole bootstrap reproduces the seed object.


Direct switch dispatch and PHI-only empty blocks copied from coil-stogir ca6be1e (base 3860588). SWITCH edges without moves branch straight to their targets, a full-width unsigned selector is compared in place, up to three singleton cases use a linear compare chain, and blocks holding only PHIs between their start and END are skipped when their outgoing transfer is empty. jit-switch-direct (new) and the switch, PHI, loop, layout, spill-home and pressure suites pass; the full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures. Whole bootstrap reproduces the seed object.


IF-entry edge moves and in-place return tails copied from coil-stogir 5766b5c (base ca6be1e). Taken IF edges whose moves would need an out-of-line stub run them at the single-predecessor projection's entry instead, and ENDs reaching a return tail (start, PHIs, RETURN, no in-block moves) return in place. jit-return-tail (new) passes; the full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures. Whole bootstrap reproduces the seed object.


Load/store pairing copied from coil-stogir ea4453e (base 5766b5c). After emission, adjacent same-base LDR or STR at consecutive scaled slots become LDP/STP plus NOP without moving any offset; labels, relocations, inline data and unsafe load aliasing keep both words. a64-pairing (new) passes; the full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures. Whole bootstrap reproduces the seed object.


Owned SCCP, presized interner copies and SCCP-output image entries copied from coil-stogir c7d8a4a (base ea4453e). The adapter consumes its graph in optimize-memory-owned!, and emits definitions whose graphs are still SCCP output (clean templates, and callers whose inline expansion changed nothing) through the entries that skip the image's entry SCCP. jit-optimized-entry (new) passes; the full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures. Whole bootstrap reproduces the seed object.


Vectorizer preparation reuse copied from coil-stogir dee6e58 (base c7d8a4a). When vectorization makes no edit, code generation reuses its CFG/schedule preparation after the complete native-input verification. Emitted objects are unchanged; the full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures. Whole bootstrap reproduces the seed object.


Bulk array initialization copied from coil-stogir 342ffb7 (base dee6e58). fill/append! replaces 25 one-element-at-a-time initialization loops. Emitted objects are unchanged; the full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures. Whole bootstrap reproduces the seed object.


November 7 afternoon work copied from coil-stogir 8928a88 (base 342ffb7): frame slots addressed directly in loads/stores; BUILTIN-MOVE prototypes with copy forwarding through private memmove destinations (the adapter declares its fixed-size runtime memmove as BUILTIN-MOVE); SWITCH verification without a full use index; LDP/STP pairing NOP compaction and LDPSW pairing; zero stores from XZR; narrow truth tests without UXTB; ZEXT of known zero-extended values and SEXT of sign-extending loads as register views; 64-to-32 TRUNC coalescing; graph compaction before SCCP and the backend; early-exit register pressure scans; return tails through forwarded empty blocks and omitted nodes; small test blocks emitted in place at the ENDs that reach them. The adapter also skips template optimization for adapted graphs over 1.5x the inline budget. New library tests: frame-direct-access, copy-forward, switch-verify-oracle, narrow-truth-test, zext-known-zero, sext-load, trunc-view-coalesce, compact, forwarded-return-tail, rotated-test-block. The full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures.


November 7 evening work copied from coil-stogir 9fe1d77 (base 8928a88): validation proofs, a 128-bit content hash recorded after a graph passes complete verification, so an unchanged graph is not verified again by the next stage (the adapter threads the proof through template optimization and inline expansion); index loops in place of slice iterators on hot paths; a dense SWITCH position table; disjoint physical-register reservations answered from a cursor that advances with the allocation position. Emitted objects are unchanged. New library test: validation-proof; pressure-index gains a cursor oracle. The full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures.


Proof-carrying code generation copied from coil-stogir 37f4a55 (base 9fe1d77): register pressure scans limited to the value's admissible registers; fixed-use events sorted by register buckets and per-bucket merge sort; schedule preparation verifying structure once; image entries that take the optimizer's validation proof and, when the graph still hashes to it, run only the native-input checks that validation does not cover; owned and image SCCP entries compacting dead cells before their final validation, behind a checked compactor that refuses malformed input; a four-lane content hash. The adapter passes each definition's proof to the -proven image entries. Smaller compacted templates change inline-budget outcomes; matched hosts run in the same cycles and emit identical objects. New library tests: fixed-use-sort, backend-validation-proof; compact, validation-proof, pressure-index and jit-optimized-entry gain cases. The full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures.


Sign-extension fix copied from coil-stogir 4b4eda0 (base 37f4a55): SEXT of a signed load is emitted as a register copy only while the value is still in the register its load wrote (its original, unsplit allocation part); a 32-bit move or reload had left bits 32-63 zero. Found when a CSE experiment changed inlining enough to expose it in the self-built compiler. sext-load gains a case that moves the loaded value across a call. The full library suite passes except the pre-existing jit-parameter-specialize and private-leaf failures.

Struct-promotion first step copied from coil-stogir 1716e81 (base 4b4eda0): SCCP skips the post-promotion content digest when promotion already reports changes (caafe51), and a call returning a two-word struct in x0/x1 projects its first piece into a register when the code never addresses the second (1716e81). The self-built compiler's output is unchanged.

Allocation and selection work copied from coil-stogir c295be4 (base 1716e81): a value whose free register ends at a call inside a loop is split at the loop entry rather than at the call, so it takes a preserved register for the whole loop instead of moving around every call (68d4d0c); zero-count immediate shifts, including a multiply by a size that resolves to one, emit as their source (40d3f6b); and nested constant field offsets ADD(ADD(p, C1), C2) fold into one encodable address, retiring intermediate ADDs only when all uses were absorbed (c295be4). The adapter now gives direct calls of memcmp, bcmp, memchr, strlen, strcmp and strncmp the PURE_FUNC flag, as LLVM's library-call knowledge does.

Spill homes and selection copied from coil-stogir c5f9979 (base c295be4): canonical spill homes (one store at each certified definition) also apply to functions with stack scopes, whose BLOCK_BEGIN/BLOCK_END/AFREE move SP below the fixed frame but leave homes in place (8287af0); literal zero sources of full-width register ADD/SUB/logical/MUL and register comparisons read XZR instead of a materialized scratch, and narrow unsigned or BOOL results already zero-extended by their emission (CSET comparisons, LDRB loads, OR/AND/XOR of those) return without an ABI re-extension (c5f9979).

Generation work copied from coil-stogir 2883e06 (base c5f9979): range intersection sweeps in allocation pressure queries start at the first range ending after the query (ae86cab); inline callee registration takes the definition's validation digest and re-validates only when it does not match (fb7c6e9; the adapter passes each definition's proof); and the graph and operand-code accessors are :inline (Always) (2883e06). All produce identical objects.

Work copied from coil-stogir ed893f6 (base 2883e06): uses/build reads inline operands from the node cell and counts into its cursor (cb9d1c2); small callees (at most 40 cloned cells) at ranked loop call sites inline without charging the caller's budget (b7d5d00; the adapter clamps its per-definition remainder at zero, since uncharged growth can exceed it); native tail jumps get no frame record, an indirect one capturing its target in a reserved x15 so x30 keeps the caller's return address (196a155); and the scalar type predicates and sizes are :inline (Always) (ed893f6).

Schedule use lists copied from coil-stogir 765ca29 (base ed893f6): Prepared keeps the use lists schedule preparation built, and emission of the same graph borrows them instead of rebuilding.

Frame records copied from coil-stogir b789424 (base 765ca29): a frame record at the bottom of a small, ordinarily aligned frame is stored with SP pre-decrement and reloaded with post-increment, folding the frame's SP adjustment into the pair.

Small-callee inlining at loop sites reverted in coil-stogir 4589058 (base b789424) to keep generation within the 5x budget; the adapter's per-definition budget accounting returns to plain subtraction.

Inline policy copied from coil-stogir feature/inline-policy (base 4589058): call-inline takes an explicit Policy (per-caller budget; a small-callee exemption of N cloned cells at ranked loop sites or anywhere, b7d5d00 generalized; nested indirect PROTO calls; nested two-register-result calls), with the existing budget APIs as default-policy wrappers. The adapter reads COIL_STOGIR_INLINE for experiments and defaults to the previous fixed 512-cell budget and template bound, clamping its per-definition remainder at zero.

Always policy copied from coil-stogir feature/inline-policy: Callee carries the source's :inline (Always); Policy honor-always (adapter setting always=1) inlines those templates at every site without charging the caller's budget. Off by default.

Shrink-wrapping and leaf inlining copied from coil-stogir feature/inline-policy: Policy small-leaf (adapter small-leaf=1) limits the small-callee exemption to call-free callees; a64.shrink-wrap, selected by the emission Context (adapter COIL_STOGIR_SHRINK_WRAP=1, module emission only), builds the frame only on paths that leave the frameless entry region, and makes the allocator assign preserved registers late. Both are off by default.

November 8 allocation-region research: optional deterministic allocation input/output snapshots, selected through COIL_TPDE_STATS and COIL_STOGIR_GRAPH. Library files vendored unchanged from coil-stogir research/allocation-regions; replay equality validation pending.

Allocation-region experiment: inherit predecessor locations through single-entry control-only blocks after linear scan, before assignment verification and location indexing. Source and regression checks in coil-stogir research/allocation-regions; workload evaluation pending.

The retained region pass verifies allocation both before and after reassignment. The separate earlier proactive-eviction experiment was measured but not retained because its timing was inconsistent. Matched region-only hosts preserve the seed object and show roughly 1.3% lower minimum/median cycles in two rounds; complete validation remains pending.

Branch-fact research from coil-stogir 3edd0e0 (research/branch-facts): opt-in dominating integer relation proofs rewrite individual IF condition edges, followed by SCCP control and PHI cleanup. Signed and unsigned relation masks remain independent. Adapter setting COIL_STOGIR_BRANCH_FACTS=1; off by default. The completed adapter passes Quick FAST and preserves the fixed seed object in all matched runtime runs; its runtime signal is mixed (minimum cycles -0.6%, median +1.2% against the region baseline). This remains an experimental option, not a claimed performance win. Full measurement and validation evidence is in coil-stogir docs/benchmarks/branch-facts/.

Branch-fact option also applies to private leaf precompilation and modules without certified private callees, using an inactive private context (no unsealed registry access).

Induction-range research vendored unchanged from coil-stogir 3752b9b (research/induction-ranges): COIL_STOGIR_INDUCTION=1 enables dominating branch facts plus overflow-checked unit-step recurrence ranges. Natural back edges are identified by dominance and matched to PHI input slots; signed ordering semantics come from the comparison opcode. Off by default. Focused semantic and native boundary tests pass; the full library run has only its two previously recorded standalone failures, all 73 linked consumers pass, and Quick FAST passes with the option enabled. The real primitive-providers-in negative-index check is removed. Measurements and scope are recorded in coil-stogir docs/benchmarks/induction-ranges/.

## Must-execute loop load hoisting research

Vendored coil-stogir `85f5b70341459a55ac90525b0c36fed292aec4e7` on `research/loop-load-hoist`.
Adds the opt-in `COIL_STOGIR_HOIST_LOADS=1` pass before rotation and after successful rotation. It moves only must-execute header load chains from read-only natural loops, preserving control closure and read order. Calls, stores, volatile/atomic operations and lifetime changes are barriers. All existing verifiers remain active. This is research, disabled by default; matched runtime comparisons do not establish a gain, so it is not part of the best runtime policy. See library `docs/benchmarks/loop-load-hoist/README.md` for evidence.

## Allocation-cost diagnostics

Synchronized the library's version-2 allocation snapshot diagnostics on
`research/region-recolor`. Traces now include canonical coalescing aliases and
edge-indexed PHI copies. These records support allocation-cost research; they
do not change allocation decisions or enable the independent-block prototype.

Library diagnostics commit: `dd930d75d1c41baab94f02c1384e87e181c25a2a`.

Research: vendors the general integer diamond if-conversion extension from coil-stogir research/general-if-conversion. `COIL_STOGIR_IF_CONVERT=1` enables it after branch-fact cleanup and before loop transforms. The pass proves availability or bounded nontrapping integer speculation, supports multiple PHIs, preserves roots, and rebuilds analyses after each immutable batch. Disabled by default; workload measurement and broad validation pending.

The if-conversion research option now also enables persistent comparison-to-COND fusion: single-use, unobserved, same-block 64-bit integer predicates with word integer results. Matching redirects comparison and choice operands before liveness, constraints keep all inputs available, and emission uses the selected condition flags directly. Existing matching callers and the default backend remain unchanged. Focused matrix (87,480 native answers), high-pressure and linked AOT checks pass; full validation and matched measurements follow.

Global load-forwarding research vendored unchanged from coil-stogir `55ade43527a8068374e673a238aa6d7c1d62c111`. `COIL_STOGIR_GLOBAL_LOADS=1` enables exact typed scalar load reuse after separate dominance and all-path memory preservation proofs. The pass traverses merge inputs and loop back edges, rejects unsupported effects, preserves observed control and iterates verified immutable batches. No reads are inserted or speculated. All three adapter emission paths carry the option; disabled by default. Focused native and linked AOT tests pass; broad validation and workload measurements remain pending.

Optional bounded allocation recoloring vendored unchanged from coil-stogir `1ff2de885a9cd67c5b4e9a55e55be11bdb7218e4`. `COIL_STOGIR_RECOLOR=1` enables coordinated whole-child recoloring using CFG/PHI/internal transfer costs, typed spill homes and independent allocation verification after every accepted transaction. All three adapter emission paths carry the option; disabled by default. Native replay matches the prototype exactly; focused allocator, pressure/bypass/call JIT and C-linked AOT tests pass. Broad validation and fixed-workload measurements remain pending.

Recoloring instruction-phase correction vendored unchanged from `01adb66c1e66bfb73fd6df41bdfd06ecedb71ca8`: cost construction and emission share matched-definition filtering; bounded candidates must preserve legal transfer directions at ordinary definition phases. The first workload build exposed this missing constraint and was rejected before host publication. Focused regression and native pressure execution pass; corrected workload build and broad validation are pending.

Regional allocation research vendored unchanged from coil-stogir `579c817` (including the balanced-flow component from `bb62ffd`). `COIL_STOGIR_REGIONAL=1` enables CFG-selected loop-bypass regions, exact block-boundary partitions, scoped bounded recoloring and conservation-consistent static flow weights. It is separate from whole-child recoloring; use `COIL_STOGIR_ROTATE=1` to expose rotated loop guards. All three adapter paths carry the new option. Default off. The full captured hot-function replay matches the independent research assignment at 20,850 positions; partition/frozen-scope checks and a transformed nested-loop JIT/C-linked AOT fixture pass. Broad validation and fixed-workload timing remain pending.

Regional allocation setup is updated unchanged from coil-stogir `a153d29`. Internal transfer discovery visits indexed child starts, and scoped interference omits frozen/frozen pairs after independent allocation validation. The allocation policy, search limits and costs are unchanged. Isolated old/new transfer and domain oracles pass for the captured compiler graph and nested-loop native fixture, with byte-identical captured object output. Whole-compiler identity and generation measurements follow.

Regional scoped interference is updated unchanged from coil-stogir `5955426`, extending `a153d29` with a next-mutable index. Frozen/frozen pairs are no longer enumerated; all retained pairs keep the original order. Exact old/new transfer and domain/interference oracles pass for the captured graph and focused allocation tests, and the captured object remains identical. The preceding setup version reproduced the full retained-small compiler object and passed quick FAST; the latest traversal's full identity checks follow.

Allocation scoring is updated unchanged from coil-stogir `59edaf4`. A child-to-transfer-site incidence index recomputes complete costs only at sites affected by each proposal; accepted transactions refresh the baseline. The original full scorer remains unchanged and checks committed costs independently. All proposal scores in the captured real function and nested-loop fixture match the full scorer; 6,480 standalone combinations, repeated queries and refreshes also pass. The captured object remains identical. Full-workload identity and timings follow.


November 9, 2026 — library `2342f7e` adds optional modular affine loop strength reduction. The library sources are vendored unchanged. `COIL_STOGIR_STRENGTH=1` enables it in the module, cached-leaf and fallback native paths; default behavior stays disabled. It proves entry-invariant inputs and a single natural recurrence, preserves wrapping widths, and carries shared affine addresses through loops. Library arithmetic, nested JIT, C-linked and captured-graph checks pass; compiler-host runtime and full acceptance validation remain pending.
