# Private GP result projection experiment

Goal remains unmet. This is a repeated small actual-verifier measurement, not a
whole-bootstrap comparison or acceptance result. Compiler source/candidate
b27ffeb4 vendors standalone ebe4833; source remains frozen after candidate build.

| Emitter | IR generation median | Runtime process CPU median | Object bytes |
| --- | ---: | ---: | ---: |
| Previous pure-call backend1914b373 |87.856ms|24.488ms|84615|
| Word rematerialization bec9d720 |89.868ms|24.043ms|83367|
| Private result projections b27ffeb4 |88.6745ms|23.6805ms|83239|
| LLVM O3 b27ffeb4 |348.029ms|8.6285ms|39880|

Relative to rematerialization alone: generation improves1.33%, runtime1.51%.
Relative to the earlier backend: runtime improves3.30%, generation worsens0.93%.
Current small-workload generation advantage versus LLVM is3.9248×, runtime
slowdown2.74445×. These numbers do not establish either whole-bootstrap target.

All rows compile the exact same current verifier/library source, with the same
opaque LLVM O3 caller constructing2048nodes,3 invalid inputs and128 valid results.
Four rotating generation samples and16 rotating child-CPU runtime samples per
row follow excluded warmups. Serial/cache/library-state off; emitted object
hashes checked on every repetition; compiler/source/caller hashes captured.
Our builds/tests were stopped during measurement. Process snapshots are included.
See `measure.py` and `results.json` for the exact inputs and observations.

The candidate's `structure` assembly calls `Graph.operand` and consumes its x0
result directly, without the earlier capture-pointer load,2 stores and2 reloads.
Static instruction counts change704→696 for structure,1201→1183 for structured
integer operations,514→505 for atomic validation relative to rematerialization.
Static counts are not dynamic instruction or spill measurements. The measured
runtime improvement is modest despite eliminating the targeted sequence.

Candidate build and quick gate PASS35.7s. Extended existing post-inline emission
regression retains an opaque C aggregate-return call, checks exact results across
a later writing call and integer edge cases; symbols/traced byte identity/units
also pass. Library validation is centralized in vendored
`docs/validation/result-projections`. Full FAST is pending at this checkpoint.

Not globally installed. Implementation committed; compiler branch not yet pushed.
