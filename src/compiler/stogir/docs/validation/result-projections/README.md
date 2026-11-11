# Private GP call-result projections

Whole-bootstrap goal remains unmet. This checkpoint has correctness evidence;
no runtime or generation improvement is claimed yet.

The AArch64 matcher proves one private fixed frame buffer is used by exactly one
register-result capture, with one ordinary exact-width load per returned word.
Only a same-block immediate load control chain is selected. An optional base+8
address may be used exclusively by the second load. Escapes, writes, duplicate
loads/captures, volatile operations, roots and intervening control retain the
existing capture/load lowering. Indirect x8 and HFA/vector results are excluded.

Matching transfers the original load definitions to an ordered output group at
the call. Liveness and intervals define every group member there; constraints
fix the pieces to x0/x1. Caller-clobber reservations exclude those result banks
at that boundary, where the new value intervals occupy them. Split-birth filtering
checks every output's canonical owner. Emission skips private capture and the
selected load instructions. Graph refs/types/control, public capture entry points,
frame address kinds and image ownership are unchanged. The private frame and
pointer-save space are still reserved; this checkpoint does not eliminate them.

`tests/jit-result-projections.coil` checks exact group membership, transactional
rejection, definition positions and fixed constraints, plus120 native answers at
O1/O3. Covers1/2-word unsigned and2-word signed results, either load order,36 live
values across calls, both pieces consumed by stores after a later opaque call,
unsigned wrap, output canaries and image use after releasing the source graph.
Negative cases cover buffer writes, duplicate/volatile loads, repeated capture,
raw ALLOCA, explicitly rooted loads, escaped ordinary arguments and intervening
stores. Native compilation runs under LLVM O1/debug checks/ASAN; generated JIT
instructions are checked by exact output/canary oracles, not ASAN instrumentation.

Seven existing LLVM O1/debug/ASAN suites pass: aggregate results, calls, call
pressure, call stack, static stack, Phi and conversion matrix. See transcripts
and `regressions.json`. An initial development failure (`unsatisfiable register
pressure`, including the minimal case) exposed the missing multiple-result
call-clobber reservation connection; it was fixed before this checkpoint. The
pressure test remains present.

The test writes four O3 Mach-O objects under `/tmp/coil-stogir-result-projections*`.
`driver.c`, compiled with `cc -O3`, independently calls all four and checks5 inputs,
canaries and exact scalar values, both ordinary and with `-fsanitize=address`.
Use `-DREVERSE=1` for the reverse object and `-DONE=1` for the one-word object.
The driver itself is instrumented in the ASAN variant; emitted native code is not.

Example reproduction from the library checkout:

```
coil run tests/jit-result-projections.coil --backend llvm -O1 --no-debug --debug-checks --sanitize=address
cc -O3 docs/validation/result-projections/driver.c /tmp/coil-stogir-result-projections.o -o /tmp/result-projections
/tmp/result-projections
```

Upstream design references and credits remain centralized in LICENSE, NOTICE
and docs/PROVENANCE.md. This aggregate ABI optimization is Coil-specific.

The follow-up pressure fixture uses36 control-pinned loads from caller input
storage, instead of movable pure multiplications. It explicitly checks that all36
live intervals cover the aggregate call's definition boundary. The independent
C driver initializes/checks the input words as well as output canaries. All120
O1/O3 JIT answers and40 linked AOT answers pass again. This strengthens test
coverage without changing library source or the measured compiler candidate.
