# Vendored coil-stogir

Copied from [coil-stogir](https://github.com/jimmyhmiller/coil-stogir), revision
`13a6bfe`, on 2026-11-02. The independent library remains maintained in that
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
