# Same-budget inline benefit density

Standalonebe66336; compiler55d4a5ff, SDK8f942a6d63338328f4cdbcbb370b5eb5b7eff07c6f3f7d25f38fe07e879f7588.
Priority now compares bounded static loop benefit per expansion cell rather
than strict depth before cost. Weight doubles per natural-loop depth, saturated
at8; zero-cost sites first, ties lower cost/originalordinal. Independent general
heuristic, no function-name handling or benchmark-specific rewrite. Same legality,
Never/recursion/ABI/capture/context proofs; same single512-cell growth ledger.
Original ordered APIs unchanged. Native module suiteLLVM O1/debug/ASAN passes.
Compiler candidate buildPASS, quick32.2sPASS, emission checksPASS.

Same current sources per workload, old01f47440/new55d4a5ffStogir and newLLVM O3
objects; common opaqueLLVMcaller b27ffeb4. Small verifier entry copied byte-for-
byte from standalone fixture into this workspace's build directory so imports
resolve the current vendor, rather than compiling an outside-package entry.
Valid and deliberately malformed runtime graphs checked.4096valid iterations.
Actual emitter:32/128/512-operation CIR,513emissions per size,75JITanswers/process
plus equal emitted text fingerprints across every repetition and host.

Four rotating verifier IR-generation samples afterwarmup, eight rotating CPU/
wall samples afterwarmup perworkload. Actual emitter objects built once perhost:
no repeated emitter-generation claim. No task build/test overlaps timed runs.
SDK/source frozen, objects deterministic, hashes/raw samples/exact driver retained.

| Workload / host | Median IR gen | Median CPU | Median wall | Object bytes |
|---|---:|---:|---:|---:|
| Verifier before |92.9325ms|766.3400ms|808.4796ms|83,259|
| Verifier density |92.3605ms|725.0765ms|771.0261ms|82,536|
| Verifier LLVM O3 |381.3730ms|254.0900ms|270.1247ms|39,880|
| Actual emitter before |not repeated|790.4605ms|792.4140ms|2,759,972|
| Actual emitter density |not repeated|763.7510ms|765.5462ms|2,706,128|
| Actual emitter LLVM O3 |not repeated|341.5130ms|343.2784ms|1,578,320|

Verifier CPU5.384%better, generation0.615%better(no substantial compile-time gain);
actual emitter CPU3.379%better. Still2.854×/2.236×LLVM CPU respectively. This is
not whole-bootstrap acceptance or a whole-bootstrap improvement claim.

Verifier.structure disassembly643→566instructions,143→103loads,68→74stores,
7→3calls. Remaining contains?/operand/borrow-node calls, with selection trace
25sites/22changes/505reserved/7remaining. Before trace25sites/18changes/510reserved.
Traced object must equal timed density object; checked. Fewer calls/loads at same
cap explains a plausible mechanism; static counts are not dynamic cost proof.

Caller GP-result selection audit is committed separately in standalone8a46349:
three captured hot functions select all3eligibleGPcalls, so no selection change
was made. Snapshots originate from backend-emission workload; whole-module
specialization context order may differ.

Goal remains5×whole-bootstrap generation/≤1.10×runtime. Latest full diagnostic is
still01f47440, ../return-allocation-bootstrap. Keep this experiment isolated until
broader compiler validation/performance evidence; fullFASTbeforepush. Installed:no,
pushed:no. Do not compound percentage gains across independent runs.
