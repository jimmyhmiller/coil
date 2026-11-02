# Native optimization modes

`stogir.options.Options` carries an explicit level. AArch64 callers can use
`image-with-options` for JIT or `object-with-options` for AOT. Both consume the
same image path. The legacy `image`, `object`, `generate` and `text` APIs retain
their existing behavior.

| Level | Current behavior |
| --- | --- |
| 0 | Explicit unsupported diagnostic. Upstream's distinct CFG/de-SSA/fast-allocation path is not implemented. |
| 1 | Existing preparation, scheduling, matching, liveness, allocation and emission path, without SCCP. This is the options default. |
| 2, 3 | Rooted SCCP analysis, owned rewrite and incremental scalar cleanup, followed by the same native pipeline. |

The gate at levels above one follows pinned dstogov/ir
`92171d0a4a36b0acf707f2dea7998de615dd4acd`, `ir.h:ir_jit_compile`.
This does not establish full upstream mode parity: missing fold rules, promotion,
control/load cleanup, optional mem2ssa, coalescing and allocation-policy gaps
remain. Optimized entry requires START at reference one. Invalid levels outside
zero through three are rejected.

The optimized working graph stays alive until pending graph references have
been resolved into the owned image. It is released before returning that image.
No optimized raw Buffer API is exposed: returning pending references after
freeing their working graph would violate ownership. Downstream analyses are
rebuilt by the existing preparation/matching path, before liveness/allocation.

[validation/optimization-modes.json](validation/optimization-modes.json) records
mode/reference text comparisons, byte-identical object output through both
public paths, native JIT and linked AOT answers, and constant-pool ownership
checks after both source graphs have been freed. These are standalone feature
checks, not a compiler delivery or a performance acceptance result. Coil's CLI
optimization level is not yet connected to these APIs.
