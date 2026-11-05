# Profile-guided combined pipeline: full compiler checkpoint

Coil candidate/source88e09ce2, standalone74530b8. Combines checked immutable
validation transactions, specialized count/fill use-list construction, fixed
frame objects/rematerialization, contained integer loads, integer complements
and changed-input IF notifications. Both backends compile the same frozen
compiler source. Target IR-to-machine-code boundary is unchanged.

Single diagnostic sample per backend and generated host. No excluded warmup or
alternating repetitions; not acceptance or a controlled historical before/after
claim. Caches/library state off, serial/O3/no-debug. Generated hosts carry the
same frozen SDK prefix and official source stamps. Host contention snapshots,
compiler/source/object hashes and exact commands are in raw results.

| Full compiler metric | Stogir O3 | LLVM O3 |
|---|---:|---:|
| Seed IR-to-machine-code seconds |10.748128|33.796706|
| Seed total wall seconds |18.620093|41.207981|
| Generated compiler wall seconds |37.416721|16.674476|
| Generated compiler CPU seconds |37.315107|16.554649|
| Compiler object bytes |14575428|8488656|

Generation advantage3.144427×; generated-compiler runtime slowdown2.243952×.
The goal remains unmet: this workload requires generation≤6.759341s and
runtime≤18.341924s. Runtime means each generated compiler compiling the same
compiler source to the same Stogir object, not seed generation time. Both native
outputs exactly match the seed Stogir object e2baaf20ede161363550fba2a0d537781537eec26071e4d1d85a353a0a2179d9.

The previous a58918c7 two-sample checkpoint was11.203523/35.209871s generation
and39.656033/16.809783s runtime. Source and protocol differ; do not infer a
controlled improvement percentage from those historical numbers.

Prior whole-bootstrap sampling1533665e identified broader verification,
construction and allocation paths. That motivated integrating existing tested
algorithm improvements rather than judging them by a fixed verifier kernel
that does not execute use-list construction. Their combined contracts pass six
debug/ASAN suites, including29700 validation diagnostic/priority comparisons,
65535-operand storage, native promotion/control/static-frame/inline-result cases.

Standalone74530b8 is committed and pushed. Compiler source/evidence is committed,
not installed globally, not pushed; FAST has not run. The global compiler remains
independently updated4776c39fffbf. No goal completion or performance adoption is
claimed. Future work still needs a substantial general code-quality/runtime gain
and additional generation savings; isolated operand tuning has a low ceiling.
