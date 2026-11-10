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

Shrink-wrapping and leaf inlining copied from coil-stogir feature/inline-policy: Policy small-leaf (adapter small-leaf=1) limits the small-callee exemption to call-free callees; a64.shrink-wrap, selected by the emission Context (adapter COIL_STOGIR_SHRINK_WRAP=1, module emission only), builds the frame only on paths that leave the frameless entry region. Leaf inlining is off by default. Shrink-wrapping is on by default since feature/idiom-frame (COIL_STOGIR_SHRINK_WRAP=0 turns it off); its second allocation with preserved registers assigned late is the separate opt-in COIL_STOGIR_SHRINK_RETRY=1.

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


November 9, 2026 — library `da3e6b0` includes direct recurrence PHIs (`6423076`) and general zero-offset full-width address-view selection. Sources are copied unchanged. The optional strength pass keeps its original reference as the PHI. Normal matching now absorbs integer/address BITCAST chains even when there is no ADD to fold, preserving explicit uses, roots, COPY barriers and width-changing definitions. Expanded native address, nested strength and C-linked tests pass; the old-matcher negative control fails as expected. The first strength-only runtime experiment was mixed and did not meet the target. Fresh controls and runtime measurements are required for this general matching change.


November 9, 2026 — library `0a79472` adds target-aware profitability to the optional strength pass, vendored unchanged. The generic affine proof accepts a product-cost predicate; the AArch64 wrapper uses the existing arithmetic selector to require a real machine multiply. Products already lowered to shifts or shifted ADD no longer justify extra recurrences by themselves. Fresh block counts identified a 1.514B-instruction closure-search regression in the unrestricted policy; the new rule contains no function names or measured weights. Expanded arithmetic (207,360 native executions), nested integrated and C-linked checks pass, and the useful captured stride-40 loop retains its 284-byte combined result. New matched hosts and runtime validation follow.


November 9, 2026 — library `efc2b64` selects equal-count SHL(SHR/SAR) as a single word AND immediate. Sources are vendored unchanged, independently of the mixed contained-view-before-PHI experiment. The matcher requires matching nonzero masked constant counts, equal 32/64-bit integer types and same-block placement, redirects machine uses before liveness, and preserves shared/rooted producers. Retirement respects the selected unary edge when a later address match absorbs the expression. New tests pass 53,472 native answers and fail structurally against the previous matcher; existing arithmetic/address/allocation/PHI/nested tests pass. The captured host graph replaces ASR+LSL with AND, with unchanged total bytes due to alignment. Full host, broad validation and timing follow.


November 10, 2026 — adapter defaults (no library change; `stogir.a64.private-leaf` `context-create` and `call-inline` `default-policy` keep every option off, so library callers and tests choose explicitly). Module emission (`-O3`) now enables with no environment variable set what every measurement since November 9 exported:

- `COIL_STOGIR_LOOP_EVICT`, `COIL_STOGIR_LOOP_RELOAD`, `COIL_STOGIR_PREDICT`, `COIL_STOGIR_PRUNE_DEFAULT` are on; `NAME=0` turns one off, `NAME=1` is accepted, any other value is a hard error. None has a measurable generation cost.
- The inline policy with `COIL_STOGIR_INLINE` unset is `hoist=1,always=1,forward=1,self=1,calls=128` (about 3% fewer host cycles for about 1.5% more generation on the compiler itself). A set `COIL_STOGIR_INLINE` replaces the default entirely: keys it does not name are off or zero with the fixed 512-cell budget and template bound. `COIL_STOGIR_INLINE=budget=512` (or the empty value) is therefore the previous default, a policy with no exemption.
- Shrink wrapping, frame splitting and nested-loop rotation were already on (`COIL_STOGIR_SHRINK_WRAP=0`, `COIL_STOGIR_FRAME_SPLIT=0`). The research options (`CALL_HOLES`, `ROTATE`, `BRANCH_FACTS`, `INDUCTION`, `RECOLOR`, `REGIONAL`, `GLOBAL_LOADS`, `IF_CONVERT`, `HOIST_LOADS`, `STRENGTH`, `SHRINK_RETRY`) stay off unless set to 1.

November 10, 2026 (later) — the default inline policy is now `hoist=1,always=1,forward=1,self=1,calls=128,wrap=256,small=80,small-scope=loop,small-leaf=1`. Library `call-inline` gains three policy fields, all off in `default-policy`: `keep-cells` (adapter key `wrap=N`: a template whose clone is at most N cells expands no callee whose clone is larger than N; its callers clone the small body and decide that call themselves, and the template's own emitted body takes the call in one more expansion with the budget it has left), `small-callers` (`small-caller=N`: under `small-scope=loop` the small exemption applies at every site of a caller of at most N cells) and `small-charged` (`small-charge=1`: a site the small exemption takes is charged while the budget lasts). Two output-preserving savings: a site whose callee is known to clone more cells than its allowance skips the eligibility walk, and the leaf test runs only for callees that fit the small exemption (`host.o` is byte-identical at the previous default and at the two small-leaf settings measured below).

Why: at the previous default, adding `small=80,small-scope=any,small-leaf=1` removed 0.39B executed calls for +3.6% generator instructions. Of the 5,206 call instructions it removed from the linked compiler, 57% never execute on the workload and 252 (4.8%) carry 90% of the removed calls. A third of the benefit was not the exemption at all: uncharged leaves made `seg-flatten!` too large for `seg-force` to absorb, which left `seg-force`, and with it `sx-items` and `code-node-parts`, small enough for their callers to clone (135M calls). `wrap` states that directly: a small template does not absorb a large callee. The remaining benefit sits in loops, and comes from the loop sites not being charged (charging them while the budget lasts gives nearly all of it back).

Exact counts on the fixed workload (generator: block counts of the compiler built by a fixed counting compiler; host: block counts of the emitted compiler emitting the seed object, which every host reproduced):

| Policy (after `hoist=1,always=1,forward=1,self=1,calls=128`) | Generator instructions | Host instructions | Direct calls | Loads | Stores |
|---|---|---|---|---|---|
| nothing more (previous default) | 161.56B | 150.3B | 2.08B | 38.84B | 10.13B |
| `wrap=256` | 161.21B (−0.22%) | 149.7B | 1.98B | 38.18B | 9.87B |
| `wrap=200,small=80,small-scope=loop,small-leaf=1,small-charge=1` | 161.56B (0.0%) | 149.1B | 1.90B | 38.12B | 9.82B |
| `wrap=256,small=40,small-scope=loop,small-leaf=1` | 162.22B (+0.40%) | 148.7B | 1.83B | 37.94B | 9.71B |
| `wrap=256,small=80,small-scope=loop,small-leaf=1` (new default) | 163.07B (+0.93%) | 148.2B | 1.78B | 37.80B | 9.56B |
| `small=80,small-scope=loop,small-leaf=1` | 163.75B (+1.35%) | 148.2B | 1.79B | 37.79B | 9.56B |
| `wrap=200,small=80,small-scope=any,small-leaf=1` | 166.12B (+2.8%) | 147.6B | 1.70B | 37.72B | 9.55B |
| `small=80,small-scope=any,small-leaf=1` | 167.40B (+3.6%) | 147.5B | 1.69B | 37.62B | 9.47B |

Measured and rejected: `budget=768` with `wrap=256` (+4.6% generation, more host instructions), `template=128` (more calls), `small-caller=80|200` (no change in the host for +0.2 to +0.5% generation), a non-leaf loop exemption (+2.8% generation, more host instructions), and an earlier form of `wrap` that bounded the template's total size instead of the callee's (small helpers stopped merging: 0.6B more calls).

Older entries above that call these options "off by default" describe the state when they were written. Unit keys (`unit-key-header` in the driver) record the compiler binary, target, level and backend but no `COIL_STOGIR_` setting: a new compiler never reuses an old compiler's unit, but one compiler run under two settings reuses the unit built under the first.

November 10, 2026 (07:15) — `COIL_STOGIR_SELECT` is default on again (`=0` turns it off). Two independent paired measurements agree: 16 alternating rounds gave −0.70 ± 0.23B cycles (13 of 16 pairs faster, medians 1.132x vs 1.152x of the LLVM-built compiler) and a 24-run sampled study gave −0.72 ± 0.22B, with 15 functions gaining significantly. The earlier eight-round comparison saw no difference because the minimum over runs is unchanged (49.98B vs 49.99B); the gain is in typical runs, not the best one. Cost: about +0.44% generation.

November 10, 2026 (09:30) — the default inline policy is now `hoist=1,always=1,forward=1,self=1,calls=128,wrap=256,small=80,small-scope=loop,small-leaf=1,thunk=40` (library `feature/idiom-calls3`). Library `call-inline` gains one policy field, off in `default-policy`: `thunk-cells` (adapter key `thunk=N`): a callee whose clone is at most N cells and that contains exactly one call, of any shape (direct, through a pointer, two-register result), inlines uncharged at every site, in templates and emitted bodies alike. Three output-preserving generation savings come with it (`host.o` at the previous policy spelled out is byte-identical to the base default, `fdc1fc42`): region inheritance reads, per bypass region, only the parts whose lifetime bounds hold its positions, from two position lists built once per function (`allocation-regions` `stabs-of`; it was every part per region); register liveness seeds its worklist last block first (the fixed point is the same, reached in a fifth of the set operations); and the location index keeps each split child's lifetime bounds, so a lookup reads only the children that can cover the position.

Why: paired exact counts against the LLVM-built compiler put the gross surplus of executed direct calls at 779M over 2,925 callees (97M the other way over 407). By shape of the callee: one call in at most 40 cells 163M and one pointer call in at most 16 cells 84M (`KeyOps$hash`/`eq`, `alloc__T`, `reallocate__T`, `push!` where the budget is spent, `Eq$slice<u8>$=`, `amap--hash`/`eq?`); two calls in at most 80 cells 100M (`reserve!`, `sconcat`, `box-al`); never a template 51M (28M of it libc); recursive about 110M; leaves over 80 cells 60M. No existing exemption reached the first two groups: the charged policy does not clone pointer or two-register-result calls, and `calls=N` applies only in `:inline (Never)` functions.

Exact counts on the fixed workload, base `stogir/idioms` daf4474a (generator: block counts of the compiler built by a fixed counting compiler; host: block counts of the emitted compiler emitting the seed object, which every host reproduced). All rows add to the previous default:

| Policy | Generator instructions | Host instructions | Direct calls | Indirect calls | Loads | Stores |
|---|---|---|---|---|---|---|
| base compiler, previous default | 164.17B | 147.2B | 1.78B | 0.15B | 37.37B | 9.58B |
| nothing more (previous default, this compiler) | 162.42B (−1.07%) | 147.2B | 1.78B | 0.15B | 37.37B | 9.58B |
| `thunk=32` | 161.51B (−1.62%) | 147.7B | 1.72B | 0.23B | 37.66B | 9.64B |
| `thunk=40` (new default) | 162.56B (−0.98%) | 146.1B | 1.56B | 0.23B | 36.89B | 9.30B |
| `thunk=64` | 164.33B (+0.10%) | 145.9B | 1.54B | 0.23B | 36.83B | 9.30B |
| `thunk=40,indirect=1,pair=1` | 172.60B (+5.1%) | 144.9B | 1.47B | 0.23B | 36.68B | 9.36B |

The 0.08B more indirect calls are not new calls: the pointer-call wrappers ended in a tail jump, so `bl` + `br` became one `blr`. Whole-process instructions retired by the uninstrumented host: 164.08B before, 163.08B now.

What the thunk rule changes besides removing the wrappers: a template that absorbs a thunk around a pointer call contains a pointer call, which the charged policy does not clone, so it is a call at its own sites from then on. On the compiler that is `HashMap$get-ptr` and `insert-raw` (73M calls added, against 295M removed); the LLVM-built compiler makes the same choice (it calls `get-ptr`, with the hash and equality calls inlined in it). Below 40 cells that loss outweighs the gain (`thunk=16`, `24`, `32` all leave the host slower than no thunk rule at all, while generating faster, because less gets cloned). Measured and rejected on the round-eight base: keeping such templates clonable by taking pointer-call thunks only in emitted bodies, with extra expansion rounds for the cloned bodies (0.05B fewer calls and 0.9B fewer host instructions for +2.8% generation); a larger thunk size at loop sites only (`40` everywhere, `80` or `128` in loops: 0.01 to 0.02B fewer calls for +0.5 to +0.8%); not counting calls that cannot return in the thunk test (no change at 40 cells; +1.2% at 48 with nothing gained). Still calls after this: the two-call wrappers (`reserve!` 35M, `sconcat`/`sconcat3`/`concat` 35M, `box-al`, `box-type`), `verify.classifications` (17.6M, a 625-cell leaf with one call site), recursive helpers (`mem2ssa.resolve`, `amap--find`, `diverging-operand`).

November 10, 2026 (fix round) — calls in tail position, and 128-bit arithmetic by powers of two. (1) A marked self call in tail position (CIR `OP-TAILCALL` to the function's own symbol, under the other CIR backend's rule: plain arguments of the parameters' types, and no integer or pointer argument once an address of the frame has escaped) is adapted as a jump back to a body region whose PHIs replace the parameters, so it is an ordinary loop to every later pass and needs no argument registers. (2) Every other call in tail position is still an ordinary CALL followed by its RETURN; the library now splits such a call out of a return join again (`tail-split`, also through the nested joins inline expansion leaves) and jumps with stack arguments too when they fit in the stack arguments the function received. A tail call returning two register words (an i128) captures them straight into the function's own result place. `tests/corpus/control_collections.coil` no longer overflows the stack; `tests/backend/stogir-tail-calls.coil` (FAST, O3 and O1 with debug checks) runs self and mutual recursion ten million levels deep with eleven arguments, i128 and float values, narrow parameters, values held across calls, a frame on one path only and an expanded callee. Not done: a function with a marked tail call and an i128 result returns its other paths through the result buffer (the direct-piece lowering declines once a call captures into the place), and LLVM's accumulator rewrite of `fib`-like non-tail recursion has no counterpart. (3) 128-bit division and remainder by a literal power of two (signed also by a negated one; rounding toward zero), multiplication by one, and shifts by a literal count are built from shifts and masks of the two halves instead of calling `__divti3`/`__modti3`/`__udivti3`/`__umodti3` or the general shift (`wide-divide-power!`, `wide-shift-by!`; the literal may be a wide constant, an extended or paired word constant, or one of those shifted left). `scripts/tests/stogir-wide-powers.py` checks that `tests/backend/stogir-wide-powers.coil` references no division helper and passes at O3 and O1. Still runtime calls where LLVM is inline: unsigned division/remainder by other literals (LLVM multiplies by a reciprocal) and by a zero-extended 64-bit divisor; still longer than LLVM without a call: 128-bit multiply and `OP-UMULH`/`OP-SMULH` (four 32-bit limb products instead of `umulh`), add/sub carries and comparisons (`cmp`/`cset` chains instead of `adds`/`adcs`, `sbcs` or `ccmp`).

November 10, 2026 (later) — `COIL_STOGIR_SELECT` (late select conversion, `select-diamond`) is now opt-in (`=1`), not default. A matched eight-round timing of the compiler workload measured no cycle change with it (1.138x vs 1.137x of the LLVM-built compiler) for about +0.44% generation. The conditional-compare chain merging and subsumed range guards from the same work stay on; they have no measurable generation cost.

November 10, 2026 — callee effect records and private frame objects. The library computes, from a finalized body, which pointer parameters a function may write through (and how far), which it may keep, and whether it may write anything else (`call-effects/summarize`), and carries the result on call prototypes (trailer version 4; `docs/CALL_EFFECTS.md`). Always on, at no measured generation cost: a frame object whose address is only a load/store address, a builtin move/compare operand, the place of register result pieces or an argument a callee cannot keep is spared by stores through other pointers and by calls it is not handed to (`private-object.coil`). `COIL_STOGIR_EFFECTS=1` (off by default) summarizes every finalized template, writes the full record on direct calls of module bodies, promotes loads of stack objects passed to reading callees, and optimizes a template once more when its records enable something; off, a body is only classified non-writing as before. It is opt-in because on the compiler itself it removes 0.06B of 37.2B executed loads for +1.8% generator instructions. Functions that are `:inline (Never)`, over the template bound or in another unit never have a record.


November 10, 2026 (fix round) — floating operations, masks, and what `coil.simd` still costs.

**CIR opcodes.** The adapter now lowers CIR `FSQRT`, `FMIN`, `FMAX`, `FMINNM`, `FMAXNM`, `FRINT` (all five modes) and `FMA` to the library's extension opcodes 131..141 (`docs/FLOATING_EXTENSIONS.md` in coil-stogir): one AArch64 instruction each (`fsqrt`, `fmin`, `fmax`, `fminnm`, `fmaxnm`, `frintn/p/m/z/a`, `fmadd`), the instructions LLVM selects for the same intrinsics, so results are bit-identical including NaNs and signed zeros. CIR has only scalar forms of these (vectors are scalarised before CIR, see below). Four CIR opcodes still stop a Stogir build, each with its own message: `SHIMCALL` (104, a call under a `:shim` register-pinned convention; `tests/corpus/machine_code.coil` is the one program that needs it), `MACHINE` (103), `BITREV` (43) and `VLOAD-LANE` (95); nothing in the compiler produces the last three today.

`SHIMCALL` is not implemented because the library's calls know one register assignment and one clobber set. The intended form is a call to a private thunk, emitted once per distinct (pinned registers, result register, clobber mask, target or inline bytes): the thunk takes the arguments in the C registers, saves the callee-saved registers the convention may clobber, moves the arguments through the stack into the pinned registers (a parallel move), runs `bl target` or the inline bytes, moves the result register to `x0`, restores and returns. It has to be defined at module level, under a name made from its content, because a function containing the call can be adapted more than once and can be inlined away entirely; that module-level emission (thread-safe appends to the text section during preparation) is the missing piece.

**Signed narrow arguments.** A CIR call argument said how many bytes its C type has but not whether it is signed, and the adapter typed every narrow argument unsigned. A private leaf with an `i8`/`i16` parameter then failed to build ("private function ABI prototype mismatch"), and a signed narrow argument to a C function was zero-extended where Darwin requires sign extension. CIR call arguments now carry `AF-SIGNED` (semantic only: TPDE ignores it, the value is already extended), and the adapter types the argument from it.

**How vectors reach Stogir.** They do not. For every backend but LLVM the frontend (`frontend/vector_scalar.coil`) rewrites each `coil.simd` operation into scalar expressions over the operands' lanes in memory: every operand is spilled to a slot, each lane is loaded, computed and stored into a zeroed result slot, and the result is loaded back as a value. CIR has no vector operations (its `V128` type only carries 16-byte homogeneous-aggregate members), so the adapter sees loads, scalar arithmetic and stores, and the library's vector opcodes (`vector-arithmetic`, `vector-comparison`, `vector-lanes`, NEON selection in `a64/vector-*.coil`) are never reached from Coil source. Masks were worse than values: a mask packs one lane per bit, and every lane of every mask operation was a load of the byte, a shift and mask, and (for a result) a read-modify-write of the result byte, about 18 instructions a lane; `vand`/`vxor` on a 16-lane mask were 295-instruction functions called twice per iteration of the mandelbrot kernel.

**What changed (in the scalariser, so TPDE, wasm and the interpreter get it too).**
- `and`/`or`/`xor`/`not` of masks, a select between masks, `mask-any?`/`mask-all?` (reduce-or/and) and `mask->bits` work on the packed bytes, eight lanes per operation; bits past the last lane are masked off in results and ignored in operands.
- A mask produced lane by lane (comparisons, `mask-low`, `bits->mask`, …) is assembled eight lanes to a byte in a register and stored once per byte instead of sixteen read-modify-writes.
- A select reads both candidate lanes before choosing, so the choice is between two values.
- `tests/simd/mask_bytes.coil` (part of `tests/simd/semantics.coil`) checks all of these at 20 lane counts on both sides of every byte boundary, lane by lane and through the stored bytes.

Measured on the otherbench `k-simdk` kernel (cycles, 7 alternating runs): whole program 2.19x → 1.16x of LLVM; the `coil.simd` pass alone about 4.8x → 1.5x. `escape-lanes` at 16 lanes went from 1220 instructions plus two 295-instruction callees to 1005 with no calls.

**What remains, and the design for it.** The 1.5x that is left on the SIMD pass has three causes, in order of size:

1. *Lanes live in memory.* `escape-lanes` still has about 200 `ldr` and 220 `str` of single lanes: each operation's operands are spilled and its result is a slot. The library's SSA promotion removes some, but a 16-lane `f64` vector is 16 scalar values and there are 32 SIMD registers, so five live vectors cannot stay in registers as scalars.
2. *Selects on floats are branches.* The library's if-conversion (`if-convert`, `select-diamond`) accepts integer PHIs only, so each `f64` lane select is a `tbz` on the mask bit around the computation of the chosen value. `COND` on floating types is already selected as `fcsel` (`a64/conditional.coil`); what is missing is admitting floating PHIs (and pricing `FADD`/`FMUL`/… as speculable, which they are: IEEE operations do not trap in the default environment) in those two passes.
3. *No NEON.* LLVM runs the same kernel as eight 2-lane registers per vector with `fcmgt.2d` and `bit.16b`.

Using NEON needs vectors to survive to the library, which is a change in three layers and too large for this round:

- **CIR.** Add vector value types and operations rather than scalarising: a type per (lane type, 128-bit multiple) or `V128` with a lane-type immediate, and opcodes `VADD/VSUB/VMUL/VDIV`, bitwise, `VCMP` (predicate immediate, result a lane-sized all-ones/zero vector), `VSELECT` (bitwise), `VSPLAT`, `VEXTRACT`/`VINSERT`, `VLOAD`/`VSTORE`, conversions. A vector wider than 128 bits is split into 128-bit parts by the producer (as `I128` is two parts today), so `(vec f64 16)` is eight `V128` values. TPDE needs the same operations or keeps receiving the scalarised form: the producer chooses per backend, as it already does for LLVM.
- **Masks.** A mask is a bit-packed value in the language's layout, but between a comparison and its select it should stay a lane mask (all-ones/zero lanes) in a register. The producer keeps a mask in lane form while it is an SSA temporary and packs it (`VMASK-BITS`: `shrn`/`umov`-style narrowing, or the and-with-powers-of-two/`addv` sequence) only when it is stored, extracted as bits, or tested with any/all (which have direct forms: `umaxv`/`uminv` then compare).
- **Library.** Typed vectors of up to 16 bytes already exist (`types/vector-type`, type codes above 15) and already live in the SIMD register class with 16-byte spill slots and `q` moves (`registers/simd-type?` admits `types/short-vector?`; `encode/simd-move`, `floating-load-store` at size 16), so no new register class is needed. NEON selection exists for integer and floating add/sub/mul/div, negate/abs, integer bitwise operations, shifts and extrema (`vector-arithmetic`, `a64/vector-arithmetic`, `vector-unary`, `vector-shift`, `vector-extrema`), for comparisons of integer and floating lanes into an integer lane mask (`vector-comparison`), and for lane extract/replace/splat/shuffle (`vector-lanes`). What has to be added: a lane-wise select by a mask vector (`bsl`/`bit`; today's `a64/vector-select` chooses between whole vectors on a scalar condition), the mask-to-bits packing above and any/all tests on a lane mask, `SQRT`/`FMA`/`FMIN`/`FMAX` and the roundings on vector types (this round's extension opcodes are scalar-only by validation), integer-to-float and float-to-integer lane conversions, and vector parameters and results in the C ABI (`a64/call-abi.coil`).
- **Adapter.** `type-id` maps CIR vector types to library vector types; each CIR vector opcode maps to the scalar opcode number on a vector type (the library's vector families reuse the scalar opcode numbers), comparisons to `vector-comparison`, lane access to `EXTRACT`/`REPLACE`/`SPLAT`.

The order that keeps every step testable: (1) floating PHIs in if-conversion (library only, benefits scalar float code too); (2) CIR vector types and arithmetic/load/store for 128-bit multiples with masks still packed at every operation (correct, already removes the lane loads and stores); (3) lane-form masks; (4) ABI.
