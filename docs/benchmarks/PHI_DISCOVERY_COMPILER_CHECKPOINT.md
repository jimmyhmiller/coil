# Module inlining and feasible-PHI discovery: compiler checkpoint

Source: Coil `cbc3dc27`, standalone library component `369f19a`.
Platform: local macOS AArch64. Explicit O3/no-debug, serial native pipeline,
`COIL_LIBRARY_STATE=0` and codegen timings enabled for both hosts. One diagnostic
sample per host/target pair, not repeated acceptance medians.

| Compiler host | Target backend | IR-to-machine-code seconds | Whole emission seconds |
|---|---|---:|---:|
| LLVM O3 | LLVM O3 |30.103040|37.12422295799479|
| LLVM O3 | stogir O3 |8.473497|15.862185250036418|
| stogir O3 | LLVM O3 |30.922365|55.541057166061364|
| stogir O3 | stogir O3 |52.932305|78.5118414160097|

At a matched LLVM-built host, stogir generation is3.55× faster. The generated
native compiler's stogir self-rebuild is4.95× slower than the LLVM-built host.
Both full target objects are byte-identical across hosts. Neither5× generation
nor runtime within10% is achieved. New timing includes adapter translation,
module preparation/expansion, and the existing Always-import spans. Older
checkpoints omitted adapter translation, so their generation ratios use a
narrower accounting scope.

The stogir object is12582556 bytes, SHA-256
`ee2735aa59552dc309e9f238dabfb6f41f277642e6bc1bfab5edba996751e0e3`.
The LLVM object is8345936 bytes, SHA-256
`4237a2feea9df600304de3f5669faf64dd5374f81b8d33bf5a09c67a48a339af`.
The generated stogir compiler is11500112 bytes. It passes version, checking,
and the extended native-backend execution smoke check (exit42).

## Bootstrap regression repaired before this comparison

The first module-inliner checkpoint35da0158 passed FAST and small oracles but
failed full compiler generation with a live PHI edge targeting a removed SCCP
value. A14-line program invoking graph verification reproduced the compilation
failure; an even smaller graph in the existing JIT rewrite suite isolated it.

The graph has a three-way PHI with differing early inputs and a forward BITCAST
as its last input. SCCP stopped backward discovery once the meet became bottom;
already-bottom PHIs also missed values when another predecessor became feasible.
The fix keeps the monotone lattice and never requeues bottom nodes: it discovers
all feasible inputs during the meet and on region-feasibility transitions.
Immediate/delayed predecessor tests fail before, pass ASAN and stogir-built
execution after, and fail again when the delayed-discovery half is removed.

The compiler fixture now exercises the public graph verifier, making this shape
part of the existing three-backend FAST check. Full generation, linking, native
smokes and both cross-host object checks pass on cbc3dc27. FAST49/49 passed in241.4 seconds (objects warning1.61GB). The fix is installed
globally; all143 installed library modules match standalone main369f19a.
Off-checkout LLVM/TPDE/stogir executions return42, and the installed late-PHI
rewrite/JIT suite passes with debug checks. The committed candidate sections
match the full-bootstrap-tested candidate exactly.
