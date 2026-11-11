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

**CIR opcodes.** The adapter now lowers CIR `FSQRT`, `FMIN`, `FMAX`, `FMINNM`, `FMAXNM`, `FRINT` (all five modes) and `FMA` to the library's extension opcodes 131..141 (`docs/FLOATING_EXTENSIONS.md` in coil-stogir): one AArch64 instruction each (`fsqrt`, `fmin`, `fmax`, `fminnm`, `fmaxnm`, `frintn/p/m/z/a`, `fmadd`), the instructions LLVM selects for the same intrinsics, so results are bit-identical including NaNs and signed zeros. CIR has only scalar forms of these (vectors are scalarised before CIR, see below). Three CIR opcodes still stop a Stogir build, each with its own message: `MACHINE` (103), `BITREV` (43) and `VLOAD-LANE` (95); nothing in the compiler produces them today.

`SHIMCALL` (a call under a `:shim` register-pinned convention) goes through a thunk, because the library's calls know one register assignment and one clobber set. The thunk is a C function defined by the adapter (`shim-thunk!`), one per distinct (pinned argument registers, result register, clobber mask, inline bytes): it takes the arguments in `x0..`, saves the preserved registers `x19..x28` the convention may change, moves the arguments through a stack area into the pinned registers (the assignment is a parallel move), runs `blr` on the target (whose address is the last argument, so the caller's graph still references the callee and the emission plan keeps it) or the inline bytes, moves the result register to `x0`, restores and returns. Every thunk is defined during `module-prepare!`, before the emission plan indexes the module's symbols; a later adaptation only looks it up. Limits, each a hard error: at most eight register arguments counting a called symbol, general registers other than `x18`, `x29`, `x30` and `sp` as argument registers, AArch64. `tests/backend/stogir-shim-calls.coil` with `scripts/tests/stogir-shim-calls.py`, and `tests/corpus/machine_code.coil`, cover it.

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
2. *Selects on floats are branches, and here that is the better form.* The library's late select conversion (`select-diamond`) now admits f32/f64 PHIs and emits `fcsel` under the integer budget (add, subtract, negate, abs, IEEE extrema, roundings one unit; multiply and FMA three; four units a diamond). The kernel's lane selects do not qualify: the value a select would make unconditional is `(zr+zr)*zi+ci` (five units) or reads squares the pass cannot see are computed anyway. Forcing every floating diamond to convert was measured and is worse while lanes live in memory: the SIMD pass goes from 1.53x to 2.33x of LLVM (every lane's work is then done for retired lanes too, and each select re-tests its mask bit). So the budget stays as it is; selects become profitable only together with lane-form masks and vectors in registers (below).
3. *No NEON.* LLVM runs the same kernel as eight 2-lane registers per vector with `fcmgt.2d` and `bit.16b`.

Using NEON needs vectors to survive to the library, which is a change in three layers and too large for this round:

- **CIR.** Add vector value types and operations rather than scalarising: a type per (lane type, 128-bit multiple) or `V128` with a lane-type immediate, and opcodes `VADD/VSUB/VMUL/VDIV`, bitwise, `VCMP` (predicate immediate, result a lane-sized all-ones/zero vector), `VSELECT` (bitwise), `VSPLAT`, `VEXTRACT`/`VINSERT`, `VLOAD`/`VSTORE`, conversions. A vector wider than 128 bits is split into 128-bit parts by the producer (as `I128` is two parts today), so `(vec f64 16)` is eight `V128` values. TPDE needs the same operations or keeps receiving the scalarised form: the producer chooses per backend, as it already does for LLVM.
- **Masks.** A mask is a bit-packed value in the language's layout, but between a comparison and its select it should stay a lane mask (all-ones/zero lanes) in a register. The producer keeps a mask in lane form while it is an SSA temporary and packs it (`VMASK-BITS`: `shrn`/`umov`-style narrowing, or the and-with-powers-of-two/`addv` sequence) only when it is stored, extracted as bits, or tested with any/all (which have direct forms: `umaxv`/`uminv` then compare).
- **Library.** Typed vectors of up to 16 bytes already exist (`types/vector-type`, type codes above 15) and already live in the SIMD register class with 16-byte spill slots and `q` moves (`registers/simd-type?` admits `types/short-vector?`; `encode/simd-move`, `floating-load-store` at size 16), so no new register class is needed. NEON selection exists for integer and floating add/sub/mul/div, negate/abs, integer bitwise operations, shifts and extrema (`vector-arithmetic`, `a64/vector-arithmetic`, `vector-unary`, `vector-shift`, `vector-extrema`), for comparisons of integer and floating lanes into an integer lane mask (`vector-comparison`), and for lane extract/replace/splat/shuffle (`vector-lanes`). What has to be added: a lane-wise select by a mask vector (`bsl`/`bit`; today's `a64/vector-select` chooses between whole vectors on a scalar condition), the mask-to-bits packing above and any/all tests on a lane mask, `SQRT`/`FMA`/`FMIN`/`FMAX` and the roundings on vector types (this round's extension opcodes are scalar-only by validation), integer-to-float and float-to-integer lane conversions, and vector parameters and results in the C ABI (`a64/call-abi.coil`).
- **Adapter.** `type-id` maps CIR vector types to library vector types; each CIR vector opcode maps to the scalar opcode number on a vector type (the library's vector families reuse the scalar opcode numbers), comparisons to `vector-comparison`, lane access to `EXTRACT`/`REPLACE`/`SPLAT`.

The order that keeps every step testable: (1) done: floating PHIs in the late select conversion; (2) CIR vector types and arithmetic/load/store for 128-bit multiples with masks still packed at every operation (correct, already removes the lane loads and stores); (3) lane-form masks; (4) ABI.

The order that keeps every step testable: (1) floating PHIs in if-conversion (library only, benefits scalar float code too); (2) CIR vector types and arithmetic/load/store for 128-bit multiples with masks still packed at every operation (correct, already removes the lane loads and stores); (3) lane-form masks; (4) ABI.

## Parallel emission

November 10, 2026. At `-O3` the adapter (`src/compiler/backend/codegen_stogir.coil`, driven by `pipe-finish!` in `codegen_tpde.coil`) generates a module in stages. Five of them now run their per-function work on worker threads (the first two since the morning of that day, the other three since "Finalization, planning and adaptation on workers" below); the rest is serial. The library has no global or static state, every entry point allocates only from the allocator it is given, and the passes behind `native/image-*` and `sccp/optimize-memory-owned!` return a new graph instead of editing a borrowed one. The one shared structure, the inline registry, has read-only entry points for the time after its specialization cache is closed (the library's `docs/PARAMETER_SPECIALIZATION.md`).

| Stage | Where it runs | Why |
|---|---|---|
| Lowering checked functions to CIR (`tl-func-lower!`) | **workers**; the commit of each function serial, in reachability order | see "Coil-side stages on workers" below |
| Copy forwarding over the module (`copies/forward-module!`) | per-function steps on **workers**, three serial joins | see below |
| Template preparation (`module-prepare!`): adapt CIR to a graph | **workers**, reading the assembler; symbols and thunks are created at the commit | a new runtime symbol or SHIMCALL thunk gets its number at the function's place in submission order; a worker that needs one that does not exist yet leaves the function to the commit |
| Template preparation: SCCP and return canonicalization (`prepare-optimize!`) | **workers** | reads and writes one function's own graph, allocates from that function's arena |
| Template preparation: note the function (`prepare-note!`), enter the definition and its bindings into the module (`prepare-commit!`) | serial, submission order | writes the module's lists, bindings and arena, and defines thunks in the assembler |
| Finalization (`module-finish!`): inline expansion in callee-before-caller order, effect summaries, registry snapshots | serial until the registry's specialization cache is closed, then **workers** in dependency order; results installed serially | until then expansion fills the cache in finalization order; afterwards a definition depends only on the definitions it calls |
| Emission planning (`stogir-emission-plan`, `prepare-emission-body!`): reachability, adaptation and final expansion of non-template callers | serial | discovery order decides which bodies are adapted and in what order (assembler symbols), and final expansion reads and fills the registry's bounded specialization cache |
| Native leaf cache: the image of each candidate (`native-leaf-image`) | **workers** | reads one frozen definition and module settings; its context is made from those settings, not the module's native context |
| Emission: image of each live function from its frozen definition (`native-image`) | **workers** | reads one frozen graph, the sealed native context and module settings; allocates from the function's arena |
| Emission: merge each image into the assembler (`merge!`), machine-code bodies, shim trampolines, body release | serial, submission order | everything that fixes an offset or a symbol index |

Mechanism. `Pool` is a set of worker threads that run one function pointer over submitted arguments, each once; a mutex guards the task list and two condition variables carry "there is work" and "the task you await is done". The submitting thread (the compiler's pipeline thread) hands a task its item, does not touch the item again until `pool-await!` of that task returns, and then performs the serial step for it. So an item (its scratch arena, its adapter state, its result) has one owner at a time, and the hand-over in each direction is under the pool's mutex. Workers never write the assembler, the module's lists, the module arena or the callee registry; what they read of them is described per stage below.

Why the object is identical for any thread count and scheduling:

- The serial steps happen in submission order at points fixed by task indices alone. In preparation the commit of candidate `i` follows the submission of candidate `i + lead` (`lead` is 64 per thread); in emission, items are submitted up to `lead` ahead of the merge and merged in order. Nothing the submitting thread does depends on which worker finished first; it only blocks until the task it needs is done.
- The worker steps are functions of their item alone. A template's optimization does not read other templates; an image depends on its definition, on module settings fixed at `module-create`, and on the native context sealed before emission starts.
- Reordering commits against later adaptations is sound because adaptation (`prepare-adapt!`) reads no module list a commit writes. What it reads of the assembler and of the thunk table a commit can extend, so those reads take a mutex and only ever find entries an earlier commit made (see the adaptation paragraph below).
- Functions that are not emitted from frozen state stay on the serial path as a whole: if any live function has no prepared definition (host/comptime images, where emission planning does not run), or tracing is on (`COIL_TPDE_STATS`), emission is serial. That choice depends on the module, never on the thread count's effect.
- A failed optimization or image is recorded in its item and reported at its serial step, so the first failure in submission order is the one reported. The internal errors of adaptation, finalization and body preparation (`fail`) end the process from the worker that meets them; if two functions are broken at once, which is named first can vary.

Each worker item has its own `ScratchArena` over the process allocator. In emission the arena owns the image and is closed by the merging thread after the merge; in preparation it holds the adapted and optimized graph until the commit has copied the definition into the module. At most `lead` items are outstanding per stage, which bounds the retained arenas.

Option. `COIL_STOGIR_THREADS=N` (1 to 64; anything else is a hard error) sets the number of workers; 1 is the serial path, with no thread started. Unset, it is the online processors, at most eight. It is read by `execution-read`, beside `settings-read` and through the same readers, into a separate `Execution` structure that is never rendered into a unit's key: the worker count cannot change the object, so a cached unit is reused across counts (`scripts/tests/stogir-unit-settings.py` checks both that and that every `Settings` field is in the key). `COIL_TPDE_SERIAL` (set to anything) always selects the serial path, as it does for TPDE. While `COIL_CODEGEN_TIMINGS` is on and `COIL_STOGIR_THREADS` is unset the path is also serial, because those records are summed as serial CPU time (`docs/benchmarks/idioms/tools/mkhost-env.sh` sets `COIL_TPDE_SERIAL=1` and keeps its meaning). With both `COIL_CODEGEN_TIMINGS` and an explicit `COIL_STOGIR_THREADS` above one, the parallel stages each contribute one record of elapsed time, so the sum is the wall-clock time of generation. Levels one and two do not build a module and keep the two-stage lowering/compiling pipeline shared with TPDE.

Measurements (November 10, 2026; the compiler workload, `coil build src/compiler/main.coil --backend stogir -O3 --no-debug` and `emit-obj` of the same with `COIL_CODEGEN_TIMINGS=1`, run by the LLVM-built candidate; minimum of three on a machine shared with other jobs, load average about 6, so the ratios mean more than the seconds):

| Workers | whole build, wall s | whole build, CPU s (user+sys) | generation records, wall s |
|---|---|---|---|
| 1 (serial path) | 14.23 | 14.32 | 6.71 |
| 2 | 12.03 | 14.51 | 4.50 |
| 4 | 11.30 | 14.85 | 3.67 |
| 8 (default here) | 10.79 | 14.94 | 3.32 |
| LLVM backend, same session | 12.85 | 38.15 | — |

Serial generation by stage, from one instrumented run (seconds): copy forwarding 0.35, template preparation 1.01 (about 0.4 of it adaptation), finalization 1.38, emission planning 0.59, native leaf cache 0.14, emission 3.38. With eight workers what is left is about 2.9 s of serial stages plus the parallel ones at about 0.4 s, so generation is 2.0x faster and the build 1.32x; about 7.5 s of the build is not Stogir generation at all (parsing, checking, lowering to CIR, object writing, linking). The serial path costs what it did: 156.45B generator instructions against 156.51B before (`COIL_TPDE_SERIAL=1`, minimum of three). The object of the compiler workload is the same file at 1, 2, 4, 8 and the default number of workers (five runs each), in the stage-two and stage-three self builds, and under ThreadSanitizer (`--sanitize=thread` build of the compiler, eight workers, no report; a deliberately unsynchronized counter in the worker is reported). `scripts/tests/stogir-parallel-emission.py` checks identity and the settings on a generated 400-function module.

What stayed serial at that point, and what moving it would take. Finalization and emission planning both expand call sites through `inlining/Registry`, which registers snapshots and fills a bounded specialization cache as it goes; running templates of one call-graph level concurrently needs an expansion entry that only reads the registry, with registration and cache insertion done afterwards in a fixed order, and planning additionally discovers which bodies exist as it goes. Adaptation creates import symbols in the assembler; recording the names and binding them at the commit would let it move to the workers. All three are done in "Finalization, planning and adaptation on workers" below.

### Against the 5x target (November 10, 2026, later)

The target is Stogir generation wall time at one fifth of the LLVM backend's on the compiler workload. `coil build --timings` reports both directly. LLVM: `backend.llvm-lower` 0.73 s (serial lowering into eight partitions) plus `backend.parallel.workers` 4.90 s wall (30.6 s of worker CPU), 5.63 s together, so the target is about 1.13 s. Stogir's comparable span is `backend.tpde-object`: 3.57 s with eight workers. By stage, from an instrumented compiler on the same workload (seconds; the machine was shared):

| Stage | serial | 8 workers | state |
|---|---|---|---|
| lowering to CIR (Coil side, before the adapter) | 0.43 | 0.43 | serial |
| copy forwarding | 0.32 | 0.32 | serial |
| template preparation | 0.99 | 0.34 | SCCP on workers; adaptation and commit serial |
| finalization | 1.37 | 1.37 | serial |
| emission planning | 0.60 | 0.58 | serial |
| native leaf cache | 0.13 | 0.13 | serial |
| emission | 3.52 | 0.51 (0.45 with 12) | images on workers; the merging thread is busy 0.05 to 0.09 s of it |
| writing the module into the object | 0.01 | 0.01 | serial |
| total | 7.37 | 3.70 | |

All of generation is 7.4 s of CPU, so eight workers scaling perfectly would give 0.92 s. The target therefore needs about 97% of the work on workers at better than 7x, which means every serial row above has to move, including the two that are not Stogir's (CIR lowering and copy forwarding). Emission shows what the mechanism achieves when a stage is fully on workers: 6.9x with eight, 7.8x with twelve. With only finalization and planning moved at that scaling the total would be about 2.0 s; with adaptation as well, about 1.7 s; the last 0.75 s is Coil-side lowering and copy forwarding. So this design reaches the target only if those are parallelized too; it is not reached here.

What finalization needs, measured on this workload (18,387 definitions in finalization order):

- The registry's specialization cache stops changing early. It admits 128 creation attempts in total; the 128th happens at position 1,228 of 18,387, after 4% of the stage's time. From then on `context-for!` can only select an existing context, so expansion reads the registry and (apart from a memo cell, `closed`, which caches a pure predicate) writes nothing. Running the first part serially until `context-attempts` reaches 128 and everything after it on workers keeps the cache, and so the object, exactly as today. A module that never reaches 128 attempts would stay serial.
- The work is almost independent: with each definition waiting only for the definitions it calls, the longest dependency chain is 0.2% of the stage's time. But committing results in finalization order and letting a definition start only when its callees are committed loses nearly all of that (a simulation of the measured costs gives 1.6x with eight workers), because the order takes the lowest-numbered ready definition and so puts callers directly behind their callees. Letting a definition start when its callees' tasks are done gives 5.6x with eight in the same simulation.
- That needs two versions of a definition to be visible at once. The 3,538 definitions that are not templates (cycle members and everything that calls into a cycle, a third of the stage's time) read the effect records of definitions later in the order as they were before finalization, and of earlier ones as finalized. So workers must publish results into a side table and read a callee's entry by position, with the module's own list untouched until a serial install at the end.
- In the library: a test that the cache is closed; an expansion entry that takes each site's callee as an explicit frozen snapshot (or a handle registered before the parallel part), never appends to the registry and does not write `closed`; and a way to build a registry snapshot on a worker and append it later in O(1), so that registration is not a per-definition copy on the submitting thread.

Emission planning expands through the same registry after it is closed, so the same entry serves it; its order of discovery fixes the order in which bodies are adapted and therefore assembler symbol numbers, which is the same problem as adaptation: `symbol!` creates assembler symbols as it meets names, and SHIMCALL thunks are defined there. Moving adaptation to workers means recording the names a function needs and binding them at the commit in submission order.

The steps of this subsection are implemented in "Finalization, planning and adaptation on workers" below.

Generation wall time on the merged base (`coil build --timings`, minimum of two to three runs, load average about 7; Stogir is `backend.tpde-object`, LLVM is `backend.llvm-lower` plus `backend.parallel.workers`):

| | generation, wall s | whole build, wall s | whole build, CPU s |
|---|---|---|---|
| Stogir, 1 worker | 6.88 | 14.29 | 14.4 |
| Stogir, 2 | 4.65 | 12.06 | 14.5 |
| Stogir, 4 | 3.75 | 11.44 | 15.0 |
| Stogir, 8 (default) | 3.46 | 11.17 | 15.5 |
| Stogir, 12 | 3.41 | 10.89 | 15.6 |
| LLVM, 8 partitions | 5.66 | 13.31 | 39.9 |

So generation is 1.63x faster than LLVM's in wall time today, against a target of 5x.

### Coil-side stages on workers (November 10, 2026, `front`)

Three stages inside the generation span are not library code: lowering the checked program to CIR, copy forwarding over CIR, and the native leaf cache's driver. They run their per-function work on workers under the same rule as the stages above: workers write nothing shared, and everything that fixes a number or an offset happens on the backend thread in the serial order. `COIL_NATIVE_STAGES=1` prints one line per stage (`native-stage`, name, elapsed, process CPU, the backend thread's own CPU, in microseconds); the same stages are `--timings` spans (`backend.native.*`, `backend.stogir.*`).

Lowering (`codegen_tpde.coil`, "parallel lowering"). Serial lowering depends on order in two ways only: a function creates module symbols as it meets them (interned strings, static cells, runtime imports, linker addresses, method tables, with their data and relocations), and mirrors module symbols into the assembler's symbol table as it first names them. On a worker both are taken out of lowering. The worker's `Tl` is `virtual`: a module symbol it would create is an event in the function's log, named in the CIR by a stand-in, and a tpde symbol is a number local to the function. Its view of the module (`lower-view!`) shares what is read and never written while functions are lowered (program, layouts, signatures, statics) and has private lookup memos, a private allocator and no object at all. The backend thread commits functions in `reach-pending` order, the serial lowering order (`tl-func-commit!`): it replays the log, mirrors the function's symbols in the order lowering first asked for them (interleaved with the events exactly as lowering made them), records what each local symbol became, and reaches the functions the finished CIR refers to in the order `tl-reach-cir!` would. So module symbols, assembler symbols, data offsets and the reachability order are the serial ones. The CIR's local symbol numbers are rewritten later, by whichever thread next works on the function (the first step of copy forwarding, `lower-renumber!`).

Which functions to lower is found by the workers: the functions a finished CIR refers to are exactly those its commit will reach, so the worker queues them at once (and a method table's methods, which the commit reaches through the table's relocations). The backend thread queues what only a commit can find and lowers a function itself when nobody has started it by its turn. Nothing is lowered that serial lowering would not lower. Each lowering thread lowers into one reused `cir/Func` and copies the finished function out at its size (`cir/copy-finished!`); the serial collecting path does the same, which is where most of the serial saving below comes from.

A failure on a worker (`cga-fail` through `cga-failure-hook-cell`) is recorded in the function's item together with the events lowered before it, and that worker thread ends. The backend thread reports it at the function's turn after replaying those events, so the failure the user sees is the first in lowering order, and a failure that serial lowering would have met earlier inside the same function (a duplicate static storage symbol, which only the module can detect) is still the one reported. `scripts/tests/stogir-parallel-emission.py` checks both, and the identity of a module whose functions make every kind of event.

Lowering stays on the backend thread at levels one and two (no collected module), under `COIL_TPDE_STATS`, `COIL_TPDE_PROFILE_LOWER`, while `COIL_CODEGEN_TIMINGS` measures the inlining done during lowering, and when a second crew would start in one process.

Copy forwarding (`cir_copies.coil`). The pass is whole-module only through the argument summaries. It is three phases of per-function steps, each closed by a serial join: local summaries, then two rounds of forwarding with the summaries of the last join followed by the function's new local summary. A step reads and writes its own function and reads the last join's summaries, so a phase's steps run on workers in weighted chunks (`stogir-forward-copies!`), with snapshot fusion after the last step of a function. Two things are answered without recomputing, on the serial path too: a function the last forwarding left unchanged keeps its local summary, and the second round skips a function the first left unchanged when no direct callee's facts changed at the join in between (it would repeat a computation that found nothing). A join solves the summaries by pushing each weakened fact to the arguments that flow into it, over reverse edges built at the join, instead of sweeping every argument until nothing changes (eleven sweeps on the compiler workload); the solution is the same greatest fixpoint.

Native leaf cache (`precompile-native-leaves!`). The image of a candidate is a function of its frozen definition and the module's settings, so images are made on workers up to `lead` ahead; retaining the image, registering it in the native context, merging it into the assembler and confirming the publication happen on the backend thread in function order. Whether a function is a candidate is asked when it is handed out and again at its turn, and a difference is a hard error.

Measurements (the compiler workload R, `coil build --backend stogir -O3 --no-debug --timings` with `COIL_NATIVE_STAGES=1`; elapsed milliseconds, minimum of three; load average 8 to 15 from unrelated jobs):

| Stage | before, serial | 1 worker | 2 | 4 | 8 | 12 | backend thread's own CPU at 8 |
|---|---|---|---|---|---|---|---|
| module setup (`backend.native.setup`) | 12.5 | 14.6 | 13.4 | 12.8 | 12.8 | 12.2 | 12.8 |
| lowering (`backend.native.lower`) | 227 | 188 | 85 | 52 | 35 | 33 | 24 |
| copy forwarding (`backend.stogir.copies`) | 324 | 250 | 91 | 59 | 44 | 41 | 6 in the joins; it also takes chunks |
| native leaf cache (`backend.stogir.native`) | 137 | 133 | 68 | 39 | 25 | 22 | 11 |
| close, merge, object encoding and write | 12 | 12 | 12 | 12 | 12 | 12 | 12 |
| these stages together | 713 | 598 | 270 | 175 | 128 | 121 | |
| `backend.tpde-object` (with the base's parallel preparation, finalization and planning) | | 6942 | 3069 | 1734 | 1093 | 1075 | |

The stage records account for the whole span: their sum differs from `backend.tpde-object` by about 1 ms, so nothing is spent between stages, in arena teardown or around the object write beyond the rows above. The serial path's generator instructions fell from 156.9B to 155.7B. What stays serial in these stages: the commit of each lowered function (about 0.7 microseconds each for its events, 4.7 symbols and 5.7 references on average), the three summary joins, publishing each leaf, module setup (signature and symbol registration in `native_module.coil`, shared with TPDE) and writing the object. Lowering itself is bound by memory latency walking the checked program (1.3B instructions in 0.19 s), so its workers lose more to shared caches than the other stages'.

### Worker scaling and generator work, measured (November 10, 2026, `cpu`)

Method. Generation-only instructions are read with `proc_pid_rusage` at the stage boundaries of `pipe-finish!` on the serial path (`COIL_TPDE_SERIAL=1`); they repeat to within 0.02B, where whole-process `time -l` counts move by 0.1 to 0.2B on a loaded machine. The compiler workload is 72.87B generation instructions: copy forwarding 3.06, template preparation 10.72, finalization 14.57, emission planning 7.07, native leaf cache 1.34, emission 36.08. Exact per-function counts come from a block-counting build of the generator.

Emission scales with its work, not with waiting: at eight workers every worker is busy for the whole stage (476 ms each of a 477 ms stage; the longest single function is 16 ms, the lead window never runs dry), so the stage's wall time is its CPU time over the worker count. What it loses against the serial 3.3 s is CPU inflation (3.9 s of worker time at eight, 4.0 s at twelve): threads at the default scheduling class share the performance cores with every other default-class process and spill onto efficiency cores. With the workers at `QOS_CLASS_USER_INITIATED` the same run used 3.5 s and the stage took 453 to 472 ms instead of 504 ms; that is a scheduling priority over other processes, not a change in the work, and it is not applied. Page faults are not a factor (generation takes 28K of the process's 430K faults, 0.06 s of system time, serial or parallel), so reusing arenas per worker would gain nothing.

Template preparation is bound by its submitting thread, not by the workers: at eight workers each worker is busy 30% of the stage. The submitting thread spends about 200 ms adapting, 40 ms committing and 35 ms in condition-variable signals and mutex hand-offs (each submission wakes an idle worker; the stage's system time rises from 9 ms to 169 ms).

Where the generator's instructions go. One SCCP run (30,652 on this workload) walks its graph for structure about four times (entry, block construction in memory promotion, analysis input, the rewritten graph, the final graph: 147K structure walks, the largest single function at 4% of generation in the LLVM-built compiler), builds a use index two to three times, and 77% of runs end in a compaction. Every one of those checks is on a graph edited since the previous one; a run whose input was already proven happens 48 times. List growth is about 20M reallocations (6% of generation), spread over hundreds of sites, the largest being per-value range and use lists in allocation. No single remaining item is above 1%.

Output-preserving savings (library `feature/idiom-cpu`): compaction's refusal test and its keep set read every operand in one walk (`compact/compact-checked`) and kept cells are copied a run at a time, 72.87B to 72.57B (0.4%); tail splitting decides whether any RETURN will be split before it copies the graph (about 5M instructions; 58% of its candidates were copied and then declined).

### Finalization, planning and adaptation on workers (November 10, 2026, afternoon)

The three stages that the subsection above left serial now run their per-function work on worker threads. The object is the serial path's at every worker count; nothing about the serial path changed.

**Finalization** (`module-finish!`, `finish-parallel!`, `Finishing`). The serial loop runs until the registry's specialization cache is closed (`inlining/registry-closed?`: its 128 creation attempts are spent; on the compiler workload after 1,228 of 18,387 definitions). Up to there the cache is filled in finalization order as before. The remaining definitions are finalized by workers:

- A worker expands through `inlining/optimize-frozen-specialized-policy`, which reads the closed registry and writes nothing, and builds the registry snapshot of its result itself (`inlining/snapshot-create`, in its own arena) instead of registering it.
- The serial loop reads a definition before the current one as finalized and one after it as it was before finalization (the 3,538 definitions outside the acyclic order call later ones). Workers keep that: the module's list is not written while they run; a worker writes its result into a side table and reads another definition's version by position (`visible`). A later definition that has no registry handle is read through a borrowed snapshot made before the workers start.
- A definition starts when the earlier definitions it calls have finished, not when everything before it has. It cannot come to read any other unfinished definition, because a clone only brings calls of definitions that precede the cloned one, and those finished before it; a read of an unfinished entry is checked and is a hard error, not a wait.
- When the workers have stopped, the results are installed in finalization order and the registry adopts each new snapshot in O(1) (`inlining/registry-adopt!`).
- A worker never writes, releases or reallocates anything the module owns: its graph is borrowed, its lists are copies, everything it keeps lives in its own arena, which the module releases after the registry.

A module that never spends the 128 attempts is finalized serially as before. No formulation was found that keeps the bytes while the cache is still open: which specializations exist then depends on the order of the attempts.

Threads. `COIL_STOGIR_THREADS=N` is still the number of worker threads. In finalization the pipeline thread is one more worker, and in template preparation and planning it runs unclaimed tasks itself whenever it would otherwise wait for a worker (`Pool` `helping`, `pool-await!`), so with two workers these stages use three threads. A task runs once whoever takes it. Emission is unchanged: its submitting thread only merges.

**Emission planning** (`stogir-emission-plan`, `planning-*`). Planning walks the functions reachable from the module's roots in discovery order, and preparing a function's body is what discovers more. The functions discovered and not yet prepared form a wave: workers prepare their bodies (the final expansion through the read-only registry entry, and for a function without a template its adaptation and optimization), and when the whole wave is done the driver commits it in discovery order, which appends the next wave exactly as the serial walk does. On the compiler workload there are 24 waves; the first six hold 7,686 of the functions. Planning is serial when the registry is still open.

**Adaptation** (in planning and in template preparation). An adapted graph contains the numbers of the assembler symbols it names, and adaptation creates the symbol of a runtime routine (memmove, the 128-bit division helpers) on first use, so those numbers depend on the order of adaptation. A worker adapts with the assembler read-only (`Adapter` `lookup-only`): it finds existing symbols and SHIMCALL thunks and creates none. A symbol it finds was created at the commit of an earlier function, so it has the number the serial path gives it. If one is missing, the worker's result is void and the commit prepares that function again serially, at its place in the order, where the symbol is created as on the serial path (about 14 functions of the compiler workload in template preparation, none of the planned bodies). In template preparation commits run while workers adapt later functions, so the workers' reads of the assembler and of the thunk table and the commits' additions take one mutex, and `prepare-note!` (which defines thunks) moved from submission to the commit, keeping thunks and runtime symbols in the serial order. In planning no worker runs during a wave's commits and no lock is needed. Which functions are prepared twice can depend on timing in template preparation; what is committed cannot.

Evidence, on the compiler workload (R): the object is the same file on the serial path and with 1, 2, 4, 8, 12 and the default number of workers, five runs each; in a `--debug-checks` build of the compiler with 8 and 3 workers; under ThreadSanitizer with 8 workers (no report); the fixed seed object is reproduced by the host built from it; stage 2 equals stage 3 (also against a serial stage 3). `scripts/tests/stogir-parallel-emission.py` has a module that closes the cache, has a call cycle, and has functions that are the first to need a runtime routine in each stage; it checks through `COIL_TRACE` counts that workers finalized, that planning ran in waves, and that both stages prepared some function again. The 28 other benchmark programs give the same object serially and with 3 and 8 workers.

Stage wall time (`coil build --timings`, spans `backend.stogir.*` under `backend.tpde-object`; milliseconds, minimum of 3 runs, base and new alternating; the machine was heavily shared, load average 13 to 52, so the twelve-worker column in particular is noise-bound):

| Stage | | 1 | 2 | 4 | 8 | 12 workers |
|---|---|---|---|---|---|---|
| template preparation | before | 1029 | 383 | 315 | 355 | 358 |
| | after | 1034 | 358 | 265 | 145 | 194 |
| finalization | before | 1446 | 1433 | 1440 | 1424 | 1423 |
| | after | 1434 | 549 | 397 | 253 | 303 |
| emission planning | before | 617 | 628 | 626 | 598 | 610 |
| | after | 616 | 212 | 153 | 91 | 101 |
| all of `backend.tpde-object` | before | 7376 | 4961 | 4062 | 3683 | 3638 |
| | after | 7258 | 3629 | 2473 | 1674 | 1959 |

"Before" is the same base with only the stage spans added. The other stages did not change (copy forwarding about 325, native leaf cache about 137, emission 3,400 to 480). With eight workers the three stages together take 0.49 s where they took 2.38 s, and generation 1.67 s against a target of 1.09 s; what is left is copy forwarding, the leaf cache, emission and the Coil-side work outside these spans (about 0.26 s).

Serial generator cost is unchanged: 156.72B instructions for the whole `emit-obj` on the serial path against 156.68B for the base (runs vary by 0.3B). Peak resident memory of the whole `emit-obj`: 4.66 GB serially (as before), 4.89 to 5.07 GB with eight workers (the base measured 5.20 GB in one run), 5.3 to 5.6 GB with twelve.

What limits these stages now is their total CPU time (about 1.0 s, 1.3 s and 0.6 s serially), not serial sections: of finalization's wall time with eight workers about 45 ms is the serial prefix up to the closing of the cache, 25 ms ordering and scheduling, and the rest workers. In template preparation the submitting thread (commits) and the workers are about equally loaded.

**November 10, 2026, large-function scaling (library `feature/idiom-edges` `da30f8a`).** One library test, `jit-vector-lanes`, has a single function of several thousand blocks, and its wall generation was 1.6 s where modules of the same size take 0.3 to 0.4 s. Two places scanned a whole list per item. In the adapter, `translate!` and `prepare-control!` scanned every control edge for each block's region, each PHI and each `BR`; `index-edges!` now indexes the edge lists by source and by target block, in the same order a scan met them. In the library, `apply-flag-fusions!` and `merge-conditions!` scanned every branch, table entry, relocation, inline data range and label per candidate; they now build barrier counts, blocked words and a labels-by-word index once (`a64/fixups.coil`, `a64/function.coil`, vendored unchanged). Output is the same: the old and the new candidate emit byte-identical objects for all 427 library tests in the benchmark copy and for the compiler itself, the Stogir-only bootstrap reproduces the seed object, and quick FAST passes. `jit-vector-lanes` (`coil build --timings`, milliseconds, three alternating runs): `backend.tpde-object` 1,601 to 1,741 before and 808 to 825 after; `backend.stogir.plan` 742 to 768 and 105 to 109; `backend.stogir.native` 538 to 565 and 359 to 363. Its serial generation is 1.93 to 2.06 s against 2.84 to 3.02 s. On the compiler the change is neutral (`genab.py`, 4 rounds under load: 7.82 s against 7.80 s minimum, 176.87B against 177.17B instructions). What is left of the native stage for this module is that one function compiled on one worker (about 290 ms: liveness bit sets, interval range searches and SCCP's `dominating-truth` chain walk).

**November 10, 2026, x86-64 port, neutral layers (library `feature/x86` `5fb1476`).** `stogir/` is that revision's `src/stogir`, copied whole. New against `da30f8a`: the target-neutral entry points `stogir.native.compile`, `stogir.native.private-leaf` and `stogir.native.private-types`, which forward to the backend of the machine the embedding program is compiled for (`stogir.target/arch-pick`); `stogir.jit.native` and `stogir.aot.native` with an ELF writer (`aot/elf.coil`); `stogir.symbol-name`; an image's machine identity and the x86-64 relocation kinds 5 (PC32) and 6 (PLT32) with explicit addends in `image.coil`, `link.coil` and `relocate.coil`; the instruction encoder `x64/encode.coil` and `x64/registers.coil`; and placeholders `x64/compile.coil` and `x64/private-leaf.coil`, every function of which fails with "x86-64 backend: NAME is not implemented yet". The AArch64 backend's files are unchanged. The library's `docs/X86_PORT.md` holds the port's design decisions.
