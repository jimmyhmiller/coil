# Memory forwarding full compiler diagnostic

Coil source2860d92b / standalone component81cf8d6. One serial O3 diagnostic
sample per combination; library-state cache disabled for both hosts, codegen
timing enabled, no debug information. Not repeated performance acceptance.

|Compiler host|Target|IR-to-code s|Whole emit s|
|---|---|---:|---:|
|LLVM O3|LLVM O3|31.335627|38.591218|
|LLVM O3|stogir O3|8.751453|17.045667|
|stogir O3|LLVM O3|31.324888|60.584408|
|stogir O3|stogir O3|76.763282|108.421265|

Fixed-host backend generation is3.58× faster. Generated compiler native
self-rebuild is6.36× slower; the5×/within10% goal remains unmet. The108.42 s
native-host wall time is effectively unchanged from the prior108.79 s single
sample. The getter's30.6% gain does not establish a bootstrap runtime gain.
Sources differ across these diagnostic checkpoints, and each has one sample.

Both target objects are byte-identical across compiler hosts. The stogir object
is12319292 bytes and linked compiler11611464 bytes. Version/check and native
execution smokes pass. Small-case generated instructions remove the compact
getter's16-byte stack copy/frame, reducing30 instructions to16, while LLVM uses7.
See AGGREGATE_GET_MEMORY_FORWARD.md for the unchanged shared-caller workload.

FAST49/49 and official installation/off-checkout checks pass. All142 installed
library modules match the independent component; candidate and installed Mach-O
code sections match. The LLVM/TPDE/stogir AOT regression returns42 and native
JIT pressure/ABI checks pass. Central LICENSE/NOTICE/PROVENANCE attribution is
retained. The high-field scalar identity remains isolated and is not part of
this diagnostic or installed toolchain.
