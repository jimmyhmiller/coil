# Vendored coil-stogir

Copied from [coil-stogir](https://github.com/jimmyhmiller/coil-stogir), revision
`ce54ce6`, on 2026-11-02. The independent library remains maintained in that
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
