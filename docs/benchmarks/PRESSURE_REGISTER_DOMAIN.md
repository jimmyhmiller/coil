# Register-domain pressure traversal integration

Standalone0db3867, vendored Coil sourcea1fecfc1. Pressure queries skip interval
range traversal only for immutable empty fixed-use/reservation buckets. Existing
nonempty-bucket queries, owner splitting, deactivation, pressure summaries and
linear-scan policy are unchanged. Standalone ASAN/debug oracle and native/AOT
pressure tests pass. Repeated small allocator measurements are recorded in
src/compiler/stogir/docs/PRESSURE_REGISTER_DOMAIN.md.

## Contended integrated comparison

Fixed LLVM-built drivers55649d17/a1fecfc1; same selector and opaque verifier
kernels and callers as the previous comparison. O3/no-debug, state off, serial;
eight rotating generation and16 native CPU samples excluding warmup. Both
before/current stogir objects are byte-identical (selector726, verifier103419
bytes). All checksum/malformed-input checks pass.

|Workload|Backend|IR→code ms|Kernel CPU ms|
|---|---|---:|---:|
|selector|before-stogir|0.3550|12.9810|
|selector|current-stogir|0.3560|13.9270|
|selector|LLVM O3|17.8245|11.8430|
|selector|TPDE|0.0535|24.2430|
|verifier|before-stogir|103.7185|36.3570|
|verifier|current-stogir|129.0640|36.0135|
|verifier|LLVM O3|428.8400|10.6720|
|verifier|TPDE|2.2645|70.1900|

**Not acceptance evidence.** Start load45, then63; external Rust builds reach
651% CPU. Individual verifier before samples range100.315–155.788 ms, current
99.770–173.573 ms. Current median is24.44% worse, requiring a quieter repeat
before deciding whether this is a regression. Runtime differences on identical
output instructions cannot establish an improvement. The full5× generation and
within10% runtime goal remains unmet.

[Raw contended results](results/pressure-domain/contended-results.json),
[driver](results/pressure-domain/contended-measure.py).

## Focused repeat after FAST

No own build/test workload concurrent. Same fixed drivers, verifier source,
caller and eight rotating generation/16 native CPU samples. Before98.4985 ms,
current96.9560 ms generation:1.57% improvement. CPU35.9890/36.0700 ms;
103419-byte objects are byte-identical. The large regression did not repeat.
This supports retaining the conservative traversal change; it is not full
compiler acceptance or proof of a1.57% bootstrap gain.

Coil FAST49/49PASS267.5s, cli/objects peak1.60GB memory warning.
[Repeat raw data](results/pressure-domain/repeat-results.json),
[driver](results/pressure-domain/repeat-measure.py).
