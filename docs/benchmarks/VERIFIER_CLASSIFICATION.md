# Repeated immutable verifier classification

A five-second1ms macOS profile of only the emitted verifier kernel identifies
repeated vector/floating classification as substantial work. The opaque LLVM
caller runs32768repetitions, completes its checksum and invalid-input checks,
and exits0. Loader startup appears briefly; no compiler frontend or backend
construction runs inside the hot loop. This sampled run is excluded from timings.

Top leaf counts: vector.involves?808, operation verifier740, graph.lookup620,
structure556, floating.node?361, graph.operand135. The operation verifier computes
both classifications twice for ordinary scalar instructions; COPY may query
vector involvement three times. Standalone9808254 and Coil45f4e200 compute each
pure result once within the same immutable instruction iteration. All validation
calls and diagnostic ordering remain; no cache survives the iteration or mutation.

ASAN passes verifier/differential cases, floating construction/folding/CSE/guards,
vector arithmetic and transport typing/unsupported-role cases, and stale-fact
SCCP rewrite rejection. Existing tests provide the validation boundary.

## Runtime-only algorithm comparison

Fixed emitting compiler55422438. The previous checked stogir object comes from
the power-division report and its SHA256 is verified. All current backends use
updated library source, and every binary links the exact same previous opaque
LLVM runner object. Ten rotating child-CPU samples follow excluded warmup;
checksum and three malformed inputs are checked every run. Source digests are
frozen across measurement. No concurrent heavy jobs.

| Backend | Verifier CPU median ms |
|---|---:|
| stogir previous classification |56.1275|
| stogir classification once |44.1265|
| LLVM O3 current source |9.2065|
| TPDE current source |72.4595|

This saves21.4% of stogir CPU in the reduction. LLVM also benefits, and current
stogir remains4.79×LLVM runtime. This is an algorithm improvement, not target
parity or bootstrap acceptance. Actual integrated generation impact is pending.
Raw [runtime samples and hashes](results/classification/runtime.json) and
[isolated profile](results/classification/isolated-verifier-profile.txt).
