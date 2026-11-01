# AArch64 fallthrough checkpoint

Measured on Apple M2 Max, macOS arm64, 2026-11-01. Compiler `25630e25`;
independent library `f29043e`. The original [stencil baseline](STOGIR_STENCIL.md),
[scalar selection checkpoint](STOGIR_SCALAR_SELECTION.md) and
[matching checkpoint](STOGIR_MATCHING.md) remain unchanged.

The same `native-stencil.coil` source runs 200,000 passes over 16,384 periodic
u32 cells, seed 12345. Five measured samples follow warmup with rotating backend
order. Every backend uses `-O3 --no-debug`. Complete stdout and exit statuses
agree. Compiler, SDK source digest, stamp, harness and workload hashes remain
fixed; no build or test suite ran alongside measurement.

| Backend | IR-to-object ms, median [range] | Whole-command compile ms, median | Runtime ms, median [range] |
| --- | ---: | ---: | ---: |
| llvm | 27.411 [26.271–28.108] | 226.470 | 308.410 [305.941–313.051] |
| tpde | 0.141 [0.131–0.158] | 187.197 | 3987.739 [3954.389–4022.449] |
| stogir | 5.249 [5.018–5.447] | 194.961 | 2959.625 [2923.635–2987.943] |

Stogir code generation is **5.22× faster than LLVM O3**; runtime is
**9.60× LLVM O3**. It is **25.8% faster than TPDE** in runtime
on this workload. The new runtime median is **51.2% lower** than the prior
matching checkpoint's 6066.856 ms. These are separate runs; LLVM and TPDE also
ran slightly faster. The within-run ratios and complete ranges are the primary
comparison, not a claim of isolated per-instruction cycle attribution.

The active target remains at least 5× faster IR-to-machine-code generation and
runtime no more than 10% slower than LLVM O3. Codegen meets its median threshold;
**runtime remains far outside the target** (at most 339.251 ms here).
The [timing boundary](STOGIR_SCALAR_SELECTION.md#timing-boundary) is unchanged:
constructed IR to relocatable object bytes, excluding frontend/IR construction,
target-context setup and disk writes. Whole-command compile time is not the
target metric. Native emission is serial in measurement mode.

## Architecture and generated code

Pinned AArch64 `ir_emit_jcc`/`ir_emit_jz` and END/LOOP_END emission omit jumps to
the next emitted block and invert the predicate when true falls through. The
Coil emitter now applies these rules while preserving graph references,
allocation subpositions and Phi edge-copy semantics. Empty edge transfers permit
direct branches; nonempty copies remain path-specific in deferred stubs.

Distant conditional branches expand to an inverted local branch over an ordinary
B. A monotone prefix-layout fixed point handles cascading expansions and rebases
labels, graph references, inline-data ranges and relative tables together.
Far changes commit transactionally; in-range branches need no relaxation
allocation. This is independent Coil assembler code, not DynASM/veneer parity.

Static inspection of the retained matching object and new object shows the
steady interior path dropping **26→23 instructions** and **5→2 branch
instructions**. Both branches in the new path are taken on ordinary interior
iterations. The new kernel remains scalar, with address/width work and two
control transfers per cell. LLVM's inner loop uses SIMD and processes eight
cells per iteration. These static counts are not hardware-counter profiles.

Physical bottom-up/top-down block-chain ordering remains unported. Upstream
chooses bottom-up Pettis-Hansen for ≤256 reducible blocks and top-down for larger
or irreducible CFGs, with frequency estimation, empty-block handling and loop
rotation. The current emitter changes do not complete that separate stage.
SCCP, mem2ssa, full target fusion/reuse, coalescing and allocator parity also
remain open. Automatic loop vectorization is not established in pinned upstream;
any general additional pass must preserve its compact graph model and must not
specialize this benchmark. See the [architecture audit](../reference/STOGIR_BACKEND.md#architecture-fidelity-audit).

## Validation

- All 211 standalone tests pass, including freshly generated objects, followed
  by 65 linked AOT consumers. Every linked object is newer than the final-source
  snapshot; frozen compiler/SDK and project inputs remain unchanged.
- Existing fixup/branch tests cover exact positive/negative reach boundaries,
  native forward/backward branches beyond 1 MiB, cascading growth with relocated
  references/data/tables, rollback, and absence of B-to-next in predicate cases.
- Coil FAST passes 49/49 in 198.3 seconds. The existing object-test memory warning
  is 1.60 GB against 1.5 GB. Full stogir corpus remains 6/9 with the same three
  pinned-shim, numeric-adaptation and deep-tail-call failures.
- Candidate `25630e25` is installed globally with matching SDK/units. Installed
  off-checkout measured AOT emission, system linking and execution return 42
  with empty output under LLVM, TPDE and stogir.
- Additional untimed runs of the measured binaries at 1, 2, 17 and 257 passes
  agree across all three backends with nonzero checksums. The benchmark itself
  is unchanged.

[Raw samples](stogir-fallthrough.csv), [input hashes](stogir-fallthrough-inputs.json),
[summary](stogir-fallthrough-summary.json), [static code paths](stogir-fallthrough-code.json),
[short-run checks](stogir-fallthrough-short-checks.json),
[installed checks](stogir-fallthrough-installed-checks.json).
Reproduce with the [Coil harness](../../scripts/benchmarks/NATIVE_BACKENDS.md):
`--iterations 200000 --samples 5 --codegen-timings`.
