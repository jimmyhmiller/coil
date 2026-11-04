# Immutable use-index integration

Standaloneca13d63, Coil source088de286. Pipeline preparation owns one exact
use index across early placement, late placement and local scheduling of the
unchanged graph, replacing three builds. Existing owning APIs remain; borrowed
APIs retain all original prerequisites. Index released on success/error before
prepared facts escape. No reuse across graph editing boundaries.

ASAN/debug placement/branch/mutation/error oracle, SCCP pipeline, native
loops/switches/module execution and linked AOT pass. Opaque preparation CPU
repeats12.30%/12.38% stogir gain, LLVM14.50%/13.51%, TPDE17.21%/17.62%; see
vendored docs/IMMUTABLE_USE_INDEX.md. Stogir runtime gap is still~2.76× there.

## Actual backend generation

Fixed LLVM-built driversa1fecfc1/088de286, same checked opaque verifier and caller,
O3/no-debug, state off, serial;8 alternating generation/16 CPU samples excluding
warmup. Generation95.5760→93.4730ms (2.20% improvement); CPU34.4980→34.5420ms.
103419-byte output objects are byte-identical. All runner checks pass. This is
one integrated comparison, not repeated full bootstrap acceptance.

[Raw data and host evidence](results/immutable-use-index/results.json),
[driver](results/immutable-use-index/measure.py).
The5× generation/within10% full compiler runtime goal remains unmet.

## Integrated repeat and validation

Same fixed drivers, source, runner and sampling protocol after FAST.
Generation96.8680→95.2560ms (1.66% improvement), CPU35.7235→35.9445ms.
103419-byte objects remain byte-identical. This repeats the small generation
gain, without changing generated kernel code. Do not infer a bootstrap gain.

FAST49/49PASS238.8s, cli/objects1.60GB memory warning.
[Repeat data](results/immutable-use-index/repeat-results.json),
[driver](results/immutable-use-index/repeat-measure.py).
