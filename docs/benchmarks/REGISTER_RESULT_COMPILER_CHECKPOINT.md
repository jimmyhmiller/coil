# Aggregate calls and dead-control cleanup: full compiler diagnostic

Source `675c94ae`, library `c0572dc`. O3/no-debug, macOS AArch64, serial,
library-state cache disabled. Single diagnostics, not acceptance medians.
IR-to-code includes adaptation and module/template preparation and expansion.

| Host | Target | IR-to-code seconds | Whole emission seconds |
|---|---|---:|---:|
|LLVM O3|LLVM O3|33.805785|41.62574387493078|
|LLVM O3|stogir O3|8.661270|16.996614166069776|
|stogir O3|LLVM O3|33.909682|58.1811477500014|
|stogir O3|stogir O3|30.775159|55.52253166702576|

Generation is 3.90× faster than LLVM O3 on the matched LLVM host. Native
self-rebuild is 3.27× slower. Both goals remain unmet. Prior canonical checkpoint
`7f1ed43d` measured native self-rebuild 70.733767208 s and native stogir generation
45.496009 s; the current single samples are 55.522531667 s and 30.775159 s.

Both target objects are byte-identical across compiler hosts. Stogir object
12,042,360 bytes, SHA-256 e6bf6c6ca013d94721d2028143eef1b6b6f5a11ece6a81d5da1bce25c0b39948.
LLVM object 8,349,864 bytes, SHA-256 b146501b05f1c2b51096f5fa0637ca9c00b1d19c4e41a8af90bdbd71a0d6202d.
Native compiler 10,812,176 bytes; version/check/run smokes pass. FAST 49/49 passed in
220.9 seconds, with an objects memory warning of 1.68 GB.

The unchanged checked-view kernel, linked to one identical LLVM-built opaque
caller for 20 million calls, now measures 0.1572539999615401 s before and
0.03579237498342991 s after, LLVM 0.0232005420839414 s, TPDE 0.26860212499741465 s.
One excluded warmup, five alternating process samples, exact checksum 6350000000.
The new kernel has 26 instructions and no calls; aggregate constructor calls and
its temporary frame are gone. Runtime falls 77.2%, but remains 54.3% slower than
LLVM on this kernel. TPDE has substantial spread; raw samples are retained.
Kernel source, runner and exact runner object hashes are in the adjacent raw data.
These small results do not establish full compiler acceptance.

Implementation: explicit indirect result expansion; private capture/no escape/
complete linear write proofs for register-piece expansion; full observable roots
retained through template cleanup; shared dead normal-load removal; guarded empty
static allocation cleanup after promotion. Dynamic sizes, roots, volatile/atomic
reads and explicit stack/frame observability are preserved. Provenance is central
and distinguishes local extensions from pinned upstream. The new dead-code SDK
module has both namespace and installed-path manifest entries.

Global installation verified: Mach-O code sections match the tested candidate;
all 144 modules match the standalone library. Off-checkout LLVM, TPDE and stogir
fixtures return 42. Installed dead-load, aggregate module, stack and frame suites
pass, including resolution of the new dead-code module through the SDK manifest.
