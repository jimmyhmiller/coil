# Checked verifier reads and empty byte comparisons

Standalone `170c60d` / `80c06d3`, Coil integration `c7902aff`, and general stdlib
fast path `a1acd0d1`. Structural verification consumes existing checked node
borrows and reuses exact membership within one immutable operand iteration.
Integer validation consumes only operand type bytes. Optional zeros, all checks,
counts and diagnostic priority remain intact. No pointer crosses graph mutation.
`coil.mem.eql` returns true for zero elements before calling C; nonzero semantics
are unchanged. No backend function-name special case or new inline annotation.

ASAN verifier/graph/unary/control suites pass. The existing tests add missing,
continuation, extreme and local-storage refs, void RETURN and competing errors;
2420 type checks span integer/pointer types, result mismatches and widths4/8.
The existing slice-equality test covers zero/nonzero/null cases under LLVM ASAN;
u8/u64 dynamic zero/nonzero probes pass LLVM, TPDE and stogir.

Runtime source-algorithm comparison uses one fixed3556e760 emitter and one exact
opaque LLVM caller. Retained old and intermediate objects are reemitted to their
recorded SHA256 before timing. Every process checks valid and malformed inputs.
Rotating samples exclude warmup; caches are disabled.

| Checked-read verifier CPU ms | Original | Structure only | Both checked reads | Updated LLVM O3 | Updated TPDE |
|---|---:|---:|---:|---:|---:|
| First12 samples |42.5200|41.6630|40.2180|10.2005|73.7760|
| Repeat16 samples |41.8965|40.8720|40.0355|9.6995|74.0780|

Checked reads reduce CPU5.4%/4.4% versus the original. Objects are
102164 -> 102212 -> 101884bytes. Then an identical staged compiler compares old
and new stdlib, changing only mem.coil:

| Verifier CPU ms | Original source + old stdlib | Checked reads + old stdlib | Checked reads + empty fast path | Updated LLVM O3 | Updated TPDE |
|---|---:|---:|---:|---:|---:|
| First16 samples |—|42.0445|39.2020|11.2655|73.7925|
| Repeat16 samples |40.3725|38.5005|35.9840|9.7455|69.6465|

The fast path reduces CPU a further6.8%/6.5%. The same repeat measures10.9%
combined improvement versus original source/stdlib. Current stogir still takes
about3.7x LLVM CPU on this kernel, far outside within10%. New object102092bytes.
Do not compare absolute times across runs with different host conditions.

Three static memcmp sites remain guarded. A separate debug-only comparator
counter observes1830980 calls, all zero-byte, become0 calls on the same verified
runner. Counter builds are never used for timing or production. Source and logs
are retained alongside raw results.

Same-source integrated comparison (eight generation / twelve CPU samples) gives:

| Workload / metric | Before compiler | Current compiler | LLVM O3 | TPDE |
|---|---:|---:|---:|---:|
| Verifier generation ms |108.6940|108.5475|364.7680|1.4545|
| Verifier CPU ms |38.8665|38.8900|10.7305|73.4425|
| Iterator generation ms |1.1950|1.2060|16.4605|0.0675|
| Iterator CPU ms |21.6720|21.6950|10.1450|55.7585|

Both compiler hosts consume the exact same updated source/stdlib here, producing
byte-identical stogir objects (102092/1436bytes). This isolates emitting-compiler
behavior and is neutral; it does not negate or establish the separate source
algorithm gain. No compile-speed gain or full compiler speedup is claimed. No
full bootstrap was measured for these changes. The5x generation / within10%
runtime compiler objective remains unmet; the last full checkpoint is in
[CALLEE_ORDER.md](CALLEE_ORDER.md).

Raw [checked reads first](results/checked-empty/typed-first.json),
[repeat](results/checked-empty/typed-repeat.json),
[empty fast path first](results/checked-empty/empty-first.json),
[repeat](results/checked-empty/empty-repeat.json),
[integrated verifier](results/checked-empty/integrated-verifier.json), and
[iterator](results/checked-empty/integrated-iterator.json).
