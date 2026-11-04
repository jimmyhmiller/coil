# Memory forwarding across branch control

The finder now follows the sole control predecessor through IF/SWITCH and their
projections, END and plain BEGIN, matching pinned upstream
`ir.c:ir_find_aliasing_load_i`. MERGE, LOOP_BEGIN and annotated BEGIN remain
barriers. Unknown writes, volatile/atomic operations, calls, register writes and
all unrecognized effects still stop the walk. The 32-predecessor bound remains.
No reachability, observation or aliasing guard is weakened.

Standalone d84cf5b and Coil5984439a contain the implementation. Extended existing
jit-mem2ssa checks pass ASAN: 36 IF/singleton-switch/range-switch cases with both
outcomes, aliased/distinct pointers, unknown writes, volatile accesses, observed
loads and early/late forwarding. Existing 2115 late-forward cases and 1254
scalar-view checks also pass. Incremental fold/CSE/JIT and dead-load/control/use
ASAN suites pass.

## Matched verifier reduction

Saved86036f0c compiler versus5984439a, identical source and one opaque LLVM-built
caller. Six rotating generation repetitions and ten runtime repetitions follow
excluded warmups. The caller checks valid input and three rejected invalid graphs.

| Backend | IR-to-object median ms | Runtime CPU median ms | Object bytes |
|---|---:|---:|---:|
| stogir before |129.4375|60.2400|115057|
| stogir branch forwarding |126.3660|59.5820|114129|
| LLVM O3 |309.0165|13.6745|37176|
| TPDE |1.3735|97.2730|74617|

Runtime improves about1.1%, generation about2.4%. These are small gains;
stogir remains4.36×LLVM runtime on this reduction, with2.45×faster generation.
This is not bootstrap acceptance. Object hashes are stable within each compiler
across all repetitions and differ between before and after as expected.
Exact samples and hashes: [verifier](results/branch-forward/verify.json).


## Matched iterator reduction

The same compilers use one identical LLVM caller, independent full-run hash
checks, six generation repetitions and ten runtime repetitions after warmup.

| Backend | IR-to-object median ms | Runtime CPU median ms | Object bytes |
|---|---:|---:|---:|
| stogir before |1.2600|28.5435|1708|
| stogir branch forwarding |1.2430|26.3650|1660|
| LLVM O3 |15.7470|9.4675|920|
| TPDE |0.0715|54.6335|1604|

The runtime reduction is7.6%; before samples range28.380–29.324ms and after
26.119–27.616ms. Stogir remains2.78×LLVM runtime on this reduction. Assembly
still contains two conditional private Option objects, stores of a32-bit tag
and8-bit payload, then64-bit loads through a selected pointer. LLVM keeps these
values in registers. Exact-field scalar promotion rejects partially overlapping
memory views; this is a concrete remaining investigation, not a proven fix.
Exact samples and hashes: [iterator](results/branch-forward/iterator.json).

Current development is committed, not installed globally and not pushed. The
previous c379f059 toolchain remains global; no bootstrap result is claimed here.
