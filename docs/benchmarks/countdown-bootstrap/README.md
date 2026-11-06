# Countdown whole-compiler diagnostic — November 6

Candidate/source30467d56, evidence source head4e026bb3, standalone231c610.
Frozen SDK13ba10804246ebc2a9e27376dfb5757e9e3317556c66d8e8c63ca7154969b0da. Same serial/cache-off/O3/no-debug procedure
as return-allocation-bootstrap. Single run per backend/host; not acceptance.

| Measurement | LLVM O3 | Stogir O3 | Required Stogir |
|---|---:|---:|---:|
| Seed IR→machine code |31.937425s|9.840494s|≤6.387485s|
| Generated compiler runtime, wall |15.389916s|26.855581s|≤16.928908s|
| Generated compiler CPU |15.373540s|26.844232s|—|
| Generated host's own Stogir IR phase |8.553777s|15.751837s|—|
| Compiler object bytes |8602472|11848452|—|

Generation is3.245510× faster; runtime is1.745011× LLVM.
Goal remains unmet. Approximately35.1% less generation and37.0% less generated
compiler runtime still needed at these observed LLVM times.

Both generated hosts successfully emit src/compiler/main.coil through Stogir O3
and reproduce the seed object byte-for-byte, SHA256dd019bb5b023fa09a8643846a1ca69ab78d5dadb278bb2b3b9fc3fcb53022a6a.
This is meaningful correctness evidence across the two generated compilers.
The runtime task/output are identical; these are whole compiler runs, not just
backend calls. The5× compilation target uses recorded IR-codegen phase sums,
not full command time including frontend. CPU/wall/RSS and command logs retained.

IMPORTANT qualification: host snapshots show sustained mediaanalysisd around
95–148% CPU, WindowServer and other background activity. No task builds/tests or
sampling overlap, but this is NOT an uncontended acceptance measurement. Do not
attribute the full movement from the earlier1.948× diagnostic to this fix. The
small paired actual emitter comparison shows4.95% gain with steady LLVM control;
that is the stronger evidence for this optimization. Repeated/uncontended whole
runs will be required for any acceptance claim. Latest experiments remain
isolated, committed locally, not installed or pushed; fullFAST remains pending.

measure.py runs from worktree root and stores artifacts under
build/countdown-bootstrap. Linked host prefixes use the same frozen SDK and
private native support. Raw results.json includes source/candidate identities,
phase sums, output hashes and before/after host process snapshots. Link commands
and compressed command logs are adjacent. No source mutation during runs.
