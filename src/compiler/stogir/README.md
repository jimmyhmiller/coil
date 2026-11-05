# Vendored coil-stogir

Copied from [coil-stogir](https://github.com/jimmyhmiller/coil-stogir), revision
`93349ce`, on 2026-11-05. The independent library remains maintained in that
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
