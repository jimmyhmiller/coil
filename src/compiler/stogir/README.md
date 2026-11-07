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
