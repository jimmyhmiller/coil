# SCCP value-domain prerequisite

Compiler source checkpoint `257bbf57`, vendored standalone library `3463e54`,
pinned upstream `92171d0a4a36b0acf707f2dea7998de615dd4acd`.

This checkpoint implements the upstream combined constant/copy value domain:
16-byte lattice entries, exact scalar/symbol payloads, long constants, copy
identities, circular dependent-partition splitting, backward discovery and
use notification. A deduplicating minimum-reference worklist rewinds on earlier
insertions. The shared bitset now uses trailing-zero count on nonzero words
instead of a per-bit loop, following upstream's bit discovery.

The domain is **not connected to code generation**. SCCP analysis, graph/control
transformation, follow-up iterative optimization, mutable graph ownership and
optimization-level policy remain pending. This is progress toward the pinned
pipeline, not an implementation of upstream's optimized pipeline or a claim of
performance acceptance.

## Evidence

- The temporary reference-only C driver includes the unmodified pinned
  `ir_sccp.c` and invokes its static lattice/partition functions directly.
  Thirteen traces match **179,554 state/queue observations**, including forward
  and reverse nested splits at sizes 9/17/64/65/129/257, exact NaN payloads,
  signed zero, symbols, long constants and backward discovery.
- The comparison normalizes the LAST_OP sentinel (126 upstream, 131 in Coil
  because of appended atomic operations) and inactive union fields. No C wrapper
  ships with the product. [Hashes and precise scope](stogir-sccp-values-oracle.json).
- Focused SCCP-domain and bitset programs pass under LLVM, TPDE and stogir.
  Final source passes 213 standalone programs and 65 linked AOT consumers,
  using fresh objects and frozen compiler/SDK/project input hashes.
- Coil FAST passes 49/49 in 387.2 seconds under concurrent external builds.
  It reports elapsed-time (>300 seconds) and object-test memory (1.61 GB versus
  1.5 GB) warnings. Full stogir corpus remains 6/9 with the same pinned-shim,
  narrow numeric and deep-tail-call failures.
- Compiler `257bbf57` is installed globally with matching stamp and warmed
  JIT/lint units. [Off-checkout installed checks](stogir-sccp-installed-checks.json)
  pass for LLVM/TPDE/stogir: measured AOT emission, system linking and execution
  (exit 42, empty output).
- All 118 standalone, vendored and installed modules match byte for byte. The SDK
  manifest includes both new modules.

A Coil primitive type-checking issue was independently reproduced: `ctz` rejects
mutable u64 locals without an explicit value cast. It is recorded in
`coil-bugs#primitive-ctz-mutable`; the library explicitly supplies the u64 value.
No compiler fix is included here.

## Performance status

The latest uncontended fixed-workload measurement remains the
[block-layout checkpoint](../benchmarks/STOGIR_BLOCK_LAYOUT.md): 4.85× faster
IR-to-object codegen and 9.68× LLVM O3 runtime. Both acceptance criteria remain
unmet. No improvement is claimed from the unused SCCP domain.

A new measurement of the shared-bitset change is pending because other builds
are active on this Mac. Contended correctness-suite durations are not evidence
of compile-time performance. The original workload and historical reports remain
unchanged.
