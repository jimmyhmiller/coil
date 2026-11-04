# Typed constructor words and small aggregate destinations

Coil `0709656b` introduces scalar sum words and small aggregate destinations;
`d654b628` selects them only for stogir O2/O3. `57fbfbb4` preserves opaque active
field spans while packing independent known words. Layout, mask and ownership
rules are documented in [the backend guide](../reference/STOGIR_BACKEND.md).
No existing object's store is widened. This changes Coil's typed value lowering,
not the standalone compact graph or its validation contract.

Eight rotating generation and process CPU samples, excluded warmups, caches off,
one identical opaque LLVM runner. Baseline: `50f15183`; scalar-only before:
`d654b628`; current: `57fbfbb4`.

| Workload / metric | Baseline | Scalar-only | Current | LLVM O3 | TPDE |
|---|---:|---:|---:|---:|---:|
| Iterator generation ms | 1.1705 | 1.1215 | 1.1140 | 15.1555 | 0.0615 |
| Iterator CPU ms | 25.1190 | 25.1665 | 25.1715 | 9.4525 | 54.7160 |
| Verifier generation ms | 111.7900 | 114.4815 | 106.9920 | 351.7665 | 1.3700 |
| Verifier CPU ms | 43.1230 | 41.1660 | 40.7115 | 9.7365 | 76.0530 |

The verifier improves 5.6% CPU and 4.3% generation versus baseline; its object
shrinks from 114031 to 102276 bytes. Graph.lookup becomes frameless. Default
iterator consumption also becomes frameless and loses per-iteration stack
objects; its object shrinks from 1660 to 1468 bytes, but CPU is unchanged. Tag
switch dispatch remains elaborate. Do not treat removal of instructions as proof
of a runtime speedup.

Same-source serial compiler diagnostics (single samples, not acceptance):

| Host | Target | Generation s | Whole CPU s | Peak RSS GB |
|---|---|---:|---:|---:|
| LLVM baseline | stogir O3 | 13.217 | 20.726 | 5.001 |
| LLVM current | stogir O3 | 13.433 | 20.906 | 5.023 |
| LLVM current | LLVM O3 | 32.173 | 39.145 | 4.391 |
| stogir current | stogir O3 | 34.660 | 53.556 | 5.035 |
| stogir current | LLVM O3 | 33.069 | 51.405 | 4.402 |

Current generation is 2.40× faster than LLVM O3, below 5×, and 1.6% slower than
the matched baseline. The generated compiler consumes 2.56× LLVM-host CPU on
stogir emission, outside the 10% runtime target. Different prior source
checkpoints are not a controlled before/after native runtime comparison.
Both target objects agree across compiler hosts. The compiler linked from the
exact stogir object passes version, check and native execution smoke checks.

The extended sums corpus passes LLVM O3, TPDE, local x64 through Rosetta, and
stogir O1/O2/O3. New checks cover mixed signed/unsigned fields, scalar argument
snapshots, opaque/scalar neighbors sharing a word, and pointer preservation;
existing floating, aggregate and large payloads cover fallback. TPDE and stogir
O1 iterator objects remain byte-identical to baseline. O0 remains unsupported.
FAST passed all 49 steps in 229.9 seconds for delivered checkpoint c7bdd0ba.
The extended O3 sweep exposed an SCCP retained-load address bug, fixed in
standalone 0608fba and Coil c7bdd0ba; types_traits now passes. Existing missing
tail-call lowering, pinned shim adaptation, and floating intrinsics still keep
three other corpus programs from passing. Full O3 corpus support is not claimed.

Raw [compiler](results/constructor-words/compiler.json),
[iterator](results/constructor-words/iterator.json),
[verifier](results/constructor-words/verifier.json). Full local artifacts:
build/compiler-known-constructor-checkpoint and
build/{iterator,verify}-known-constructor-words.
