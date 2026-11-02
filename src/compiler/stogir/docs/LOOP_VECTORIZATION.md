# Guarded vector prefixes

This isolated library extension is additional to pinned dstogov/ir; upstream has
no equivalent vectorizer. It is enabled in the library O3 options path; Coil delivery is pending. It does not close the
remaining upstream optimizer and allocator gaps.

`loop-vectorize.vectorize` accepts a compact graph, entry, observable roots,
selected loop header and unroll factor (1, 2 or 4). It returns an owned graph,
scalar rejection (`None`), or construction error. It preserves input graph and
root references. It does not select another backend or recognize workloads.

Legality requires an ascending unit-stride counted loop, uniform integer memory
width, supported low-bit arithmetic, affine invariant-base addresses, and no
non-induction live-outs. Wide integer containers may be narrowed only through
operations that commute with truncation. Right shifts, division, variable shifts
and excessive effective left shifts retain scalar execution. HARD COPY survives
lifting. Floating point and reductions are not implemented.

The runtime guard proves complete-chunk availability and sufficient disjointness
without assuming unequal base references cannot alias. See LOOP_GUARDS.md for
address bounds. The vector prefix uses 128-bit lanes and pointer/countdown Phis.
Its exit joins the fallback path and initializes the original scalar loop with
the covered induction value. Thus the original loop handles alias fallback,
short trips and the exact remainder. Construction errors discard the working
graph; the ordinary pipeline rebuilds CFG, scheduling, matching and liveness.

The selected-header API transforms one loop. The automatic API visits each
original header once, excludes appended headers, and rebuilds facts after edits.
O3 invokes this after SCCP; O2 retains scalar optimization.
Repeated preparation/validation and instruction selection need measurement.
No performance acceptance claim follows from these correctness tests.

Validation on macOS AArch64:

- 49 configurations cover four widths, signed/unsigned loads, multiplication and
  shifts, three unroll factors, and reversed MERGE predecessor order.
- 17,640 native cases cover initial values, chunk boundaries, overlapping and
  disjoint buffers. Whole-buffer byte comparisons check red zones. A second
  image changes only the original scalar store, proving vector execution and
  exact cleanup rather than allowing a vacuous always-scalar result.
- Linked AOT passes 132 cases using an independent bytewise scalar oracle.
- The captured stencil regression passes 60 checksum cases across initialization,
  inner-loop, combined, automatic and public O3 transformations. Fixture source graph SHA-256:
  `99d6d13746c0e947c33fd60b83033eccfc34b6a36599996a862843b980d8891f`.
  It reconstructs semantic cells without original interner caches and is a
  correctness fixture, not a compile-time benchmark or an optimizer special case.
- JIT matrix and stencil pass AddressSanitizer. Loop analysis and public SCCP
  optimization-mode regressions also pass.

The frozen Coil workload, LLVM settings and IR-to-object timing boundary remain
unchanged. End-to-end compiler integration and controlled comparative timings
are still required before assessing the active performance goal.
