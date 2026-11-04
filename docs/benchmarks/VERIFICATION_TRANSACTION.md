# Immutable verification transactions

SCCP analysis and rewrite previously invoked independent operation and Phi
validators on one unchanged graph, each performing structural validation.
Two combined entry points now share that immediate structural scan. Internal
scan helpers are not exported; independent public validators still self-validate.
No proof is cached across mutation, and no caller supplies a validation flag.
Analysis keeps constants before operations/Phi. Rewrite keeps operations before
constants before Phi, preserving diagnostic priority and final check counts.
The rules themselves are unchanged and remain incomplete upstream coverage.

Standalone4e22257 (native Phi check642f597), Coil7cb5bc7e. Existing verifier tests
compare combined results and exact diagnostics against sequential public calls
for12 valid/malformed cases at both pointer widths, including simultaneous
constant/type/Phi/shape faults. ASAN passes verifier, SCCP analysis, stale-fact
rewrite rejection and native SCCP pipeline/public-mode suites.

## Phase reduction

An opaque LLVM caller creates2048 mixed scalar operations, rejects layout,
dangling-reference, typing and Phi-specific invalid inputs, then calls the real
combined or sequential validators128 times. The exact caller and each backend's
kernel object are identical between modes. Source digests are frozen across
both runs. Four generation and eight CPU repetitions follow warmup; backend
order rotates within each mode. Modes are separate serial runs, with possible
external activity. The emitting compiler is5984439a, before integration of this
change: this measures validation algorithm cost, not actual generation gain.

| Backend | Sequential CPU ms | Transaction CPU ms | Speedup |
|---|---:|---:|---:|
| stogir |75.0880|59.3545|1.27×|
| LLVM O3 |16.8825|13.5185|1.25×|
| TPDE |128.7810|96.4875|1.33×|

Stogir saves20.9% of CPU in this phase but remains4.39×LLVM runtime. This is not
bootstrap acceptance. Exact samples and object/caller hashes:
[transaction](results/verification-transaction/default.json),
[sequential](results/verification-transaction/legacy.json).

Run `scripts/benchmarks/stogir-iterator.py --workload verify-transaction` with
`--compiler`, `--library` and `--output`; add `--legacy` for the sequential path.


## Integrated compiler generation

Candidate7cb5bc7e versus saved5984439a emits the original verifier workload from
identical current source, six rotating generation samples and eight runtime
samples after warmup. Before/after objects are byte-identical (SHA256
`3f0211ca3c44b0aae491c4b013f46b4fd8f9f82ac34ab0e931145a514564c570`).
Median generation120.8190→117.9485ms is a2.4% reduction. CPU58.6865→58.2245ms
is noise for identical code. LLVM O3 generation322.3375ms, runtime13.4010ms;
TPDE generation1.3670ms, runtime95.1930ms. Raw data:
[integrated verifier](results/verification-transaction/integrated-verifier.json).
No new full-bootstrap timing is established for this change.
