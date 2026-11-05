# Fixed entry objects and rematerialization checkpoint

Compiler source/candidate a58918c7, standalone b01d83d, based on production
bulk128 policy. This is an experiment, not acceptance. Installed production is
unchanged979be2f9. Compiler integration is committed, not installed, not pushed;
FAST has not run. All benchmark evidence is outside the frozen SDK source tree.

## Full compiler

Same frozen compiler source for both O3 backends. Existing IR-to-machine-code
boundary; caches/library state off, serial, no debug. One excluded warmup and
two alternating samples for generation and generated-compiler runtime. Generated
hosts have matching SDK prefixes and official source stamps. All native Stogir
outputs exactly equal the seed object. Host contention snapshots are retained.
Two samples are a diagnostic; different source from older checkpoints prevents
a controlled historical before/after percentage claim.

| Metric | Stogir O3 | LLVM O3 |
|---|---:|---:|
| Seed IR-to-machine-code seconds | 11.203523 | 35.209871 |
| Generated compiler wall seconds | 39.656033 | 16.809783 |
| Generated compiler CPU seconds | 39.504006 | 16.691895 |
| Compiler object bytes | 14679348 | 8488368 |

Generation speed is 3.1427× and runtime slowdown 2.3591×. Goal remains
unmet: generation must be <= 7.041974s and runtime <= 18.490761s on this
workload. Runtime means each generated compiler compiling the same source to the
same Stogir object; it is not the seed generation time.

## Fixed verifier diagnostic

Fixed independent source root and opaque LLVM caller,8 rotating generation and
24 CPU samples after warmup. Every executable passes valid/invalid graph checks.
Per-backend objects are stable and LLVM objects are identical across drivers.

| Driver/backend | Generation ms | Runtime CPU ms | Object bytes |
|---|---:|---:|---:|
| Bulk128/Stogir | 96.1860 | 35.4675 | 103419 |
| Static objects/Stogir | 94.3490 | 35.5200 | 103003 |
| Bulk128/LLVM | 363.0845 | 9.8775 | 41008 |
| Static objects/LLVM | 359.7480 | 9.7465 | 41008 |

Nominal Stogir generation reduction1.91%; runtime+0.15%, effectively unchanged.
The semantic validator's static LDR/STR/LDP/STP count falls555→430 and its
SP/FP-relative subset453→328. Structure's subset221→194; classifications143→135.
Static counts are not dynamic execution percentages. Removing this traffic has
not closed the runtime gap. Source, object and caller hashes and raw samples are
archived under results/static-entry-verifier and results/static-entry-bootstrap.

## Next experiment

The current frozen checkpoint rematerializes addresses before memory accesses.
Pinned upstream also emits direct frame-base/offset memory operands when possible.
A subsequent standalone change is testing that encoding with checked offset
combination and fallback to the existing address path. It is not included in
this candidate or these numbers. No new speedup is claimed for that work yet.
