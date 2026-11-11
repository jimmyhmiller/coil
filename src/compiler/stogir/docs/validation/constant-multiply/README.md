# Constant multiply plus-one: local measured win

Libraryb378e52; candidate75d34878 versus50093aa5. Native binary matrix passes
with debug checks and ASAN. The32-byte copied record is already scalarized;
no promotion change is justified by this example. Only target selection changes.

| Median | Before | Candidate | LLVM O3 |
|---|---:|---:|---:|
| IR-codegen ms |0.2685|0.2770|14.6780|
| Timed kernel-loop CPU ms |5.9785|5.0245|6.8405|
| Object bytes |615|615|720|

Kernel runtime decreases15.96%; candidate is0.7345×LLVM time in this small
serial dependent scan. Same object size includes Mach-O overhead/alignment;
disassembly shows constant33/MUL replaced by same-source shifted ADD. No useful
generation-time improvement is established; these submillisecond times are
small. This is not whole-bootstrap acceptance or a controlled compiler-wide gain.

Four alternating generation samples and16 rotating CPU samples after warmups.
The same LLVM-built Coil caller constructs a real ArrayList. The same independent
C reference/timer object checks negative/zero/small/full counts, sign extraction,
checksum wrapping and final accumulated results. CLOCK_PROCESS_CPUTIME_ID times
only1024 opaque kernel calls over4096records; reference checks run outside it.
Serial/O3/no-debug/caches off; no concurrent builds/tests during timing.

A prior partial run failed on temporary-directory creation with errno28. It was
discarded. Directory creation and the same command later succeeded without
artifact deletion; all reported samples are from the complete restarted run.
Raw observations, source/executable/object hashes, scripts and disassembly are
archived here. The C reference is benchmarks/compiler-gaps/wide-record-scan-reference.c.
