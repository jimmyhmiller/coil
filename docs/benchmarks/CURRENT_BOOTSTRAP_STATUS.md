# Current compiler bootstrap status: goals unmet

Compiler source088de286, evidence/checkoutd12758be. Same frozen complete current
compiler source and standard library for all emissions. Library-state caching
off, serial O3/no-debug, existing instrumented IR-codegen boundary preserved.
Generated stogir and LLVM hosts are linked from their respective seed-emitted
objects, then execute the same full source-to-stogir compiler workload. One
excluded warmup per case, two alternating full samples. These are diagnostic
medians, not acceptance evidence from a long repeated run.

|Metric|stogir O3|LLVM O3|Ratio|
|---|---:|---:|---:|
|IR→machine-code generation s|12.190593|34.2389515|2.8086× faster|
|Generated host runtime, CPU s|46.3710585|17.4617005|2.6556× slower|
|Generated host runtime, wall s|46.5102827|17.5735749|2.6466× slower|
|Compiler object bytes|14903044|8482336|1.7570×|

Check the raw data for exact object sizes and identities. The5× generation goal
requires stogir≤6.8477903s at this LLVM baseline, roughly44% below current.
Within10% wall runtime requires≤19.3309324s, roughly58% below current.

## Individual measured samples

|Case|IR→code s|Total CPU s|Total wall s|
|---|---:|---:|---:|
|seed→stogir0|12.536637|22.161798|22.6213415|
|seed→stogir1|11.844549|19.794315|19.9096901|
|seed→LLVM0|33.691703|41.294864|41.4340198|
|seed→LLVM1|34.786200|42.348574|42.5140696|
|native stogir0→stogir|27.435497|46.353561|46.5002587|
|native stogir1→stogir|27.545653|46.388556|46.5203066|
|native LLVM0→stogir|10.492972|17.681866|17.7745250|
|native LLVM1→stogir|10.257114|17.241535|17.3726247|

Generation includes observed Rust contention (stogir0 snapshotrustc821%CPU).
Runtime samples must be qualified by their recorded host snapshots. CPU and
wall runtime ratios agree closely, so descheduling does not explain the large
runtime gap. No uncontended5× or within10% acceptance claim is made.

All per-backend objects are stable. Every measured generated-host output matches
the seed stogir object byte for byte, SHA256
2039071a4b4db8c179feb66c22388d00cb31563d5d079afe0853cc3ed4d66548.
The same source fingerprint is checked before/after every full emission.
Raw linked hosts are benchmark artifacts, not installed toolchains; identities
are their recorded binary hashes and frozen source, not a version-sidecar claim.
The installed production toolchain remains088de286 with matching SDK/JIT/lint.

## Implications

Analysis initialization, pressure queries and use-index reuse delivered real
small generation gains, but cannot establish LLVM-quality generated code. The
verifier reduction still has about17k static stogir instructions versus5.4k LLVM
and a substantial runtime gap. Static counts are not dynamic counts; current
native profiling and exact inline diagnostics identify concrete work to test.

The callee-view API is an isolated experiment95863a7, not integrated and not a
measured performance win. Its budget reduction establishes legality/feasibility
only. Do not extrapolate microbenchmarks or describe these goals as nearly met.
We have not established that this implementation can reach both targets. Further
changes need evidence that they close the code-quality gap without consuming
the required generation advantage.

[Raw samples, source/binary hashes and host snapshots](results/current-bootstrap-status/results.json),
[replay driver](results/current-bootstrap-status/measure.py).
