# Closed Always aggregates: compiler checkpoint

Coil source `156a7e3b`, standalone engine `13a6bfe`. The existing Always-only importer now accepts fully validated closed expression sequences and aggregate results. Default/Hint/Never policy is unchanged. Recursion guards and AST64/depth16/expansion16384 bounds remain. This honors source annotations, not general standalone module-graph inlining.

Coil struct parameters retain their reference-model aliases. Mutable locals make explicit copies. Tests distinguish alias visibility from explicit copies, effects in later arguments, aggregate conditionals, EDo effects, lexical restoration and HFA results. Actual aggregate TV values are captured before evaluating later arguments, and those additional optimizer spans are charged to IR-codegen timing. Nested spans are not double counted.

## Full compiler O3 diagnostic

One serial sample per cell on the local arm64 Mac. **COIL_LIBRARY_STATE=0 for both hosts**, all inherited COIL overrides cleared. IR-codegen includes native optimizer/emission and disjoint inline spans. Codegen timing is enabled in both hosts; production runtime acceptance must also run with timing disabled. These are not acceptance medians.

| Fixed LLVM-built driver emits compiler source | LLVM O3 | stogir O3 |
|---|---:|---:|
| IR→machine-code seconds |30.507690|14.828704|
| Total wall seconds |37.605411|22.772091|
| Object bytes |8,291,912|12,413,944|

Code-generation speedup is **2.06×**, below the **5×** target.

| Generated host executes full compiler emission | LLVM-built host wall s |stogir-built host wall s|
|---|---:|---:|
| LLVM target |37.605411|61.072998|
| stogir target |22.772091|143.738292|

Stogir-host stogir emission is **6.31× slower**, outside the within10% runtime target. Both targets produce byte-identical objects across hosts. Native-host stogir codegen is111.236037s versus14.828704s for the LLVM host. Linked stogir compiler:11,720,528bytes; version/check/native-run smoke checks pass. Source and binary hashes are in raw JSON.

Earlier checkpoints did not explicitly match standard-library state sidecars across hosts. Their wall-time ratios are historical diagnostics, not controlled acceptance results. A partial new run was stopped after this audit; its timing is discarded. The table above reruns both hosts with library-state caching explicitly disabled. Target objects are identical with cache on/off in this diagnostic. Default LLVM optimization level3 was verified in `metaengine.coil`; both emitted compiler targets explicitly use-O3.

## Compact-node getter gap

The unchanged fixture uses an ArrayList of16-byte nodes with a u32 header and three i32 operands. One identical LLVM caller executes200million opaque calls, checksum63500000000. Kernel objects are linked first; link maps confirm backend ownership.

Five measured samples after an excluded warm run, rotated four-way:

| Kernel backend |Median runtime seconds|
|---|---:|
|LLVM O3|0.168437459|
|TPDE O3|0.213844333|
|stogir O3, previous9ea2f8c8|0.633662125|
|stogir O3, current156a7e3b|0.281751291|

Current stogir improves **2.25×** over its prior binary but remains **67.3% slower** than LLVM. Kernel instruction counts are LLVM7, TPDE15, previous stogir48, current stogir30. The Get call is removed. Stogir retains a two-word stack copy followed by narrower field loads; current exact-field mem2SSA rejects the overlap. TPDE uses SIMD copies and signed loads; LLVM directly loads/combines the fields. This is a concrete next memory-optimization gap, not a whole-compiler performance claim.

## Validation and next work

FAST49/49 passes in209.3s (cli/objects memory warning1.69GB vs1.5GB). Official installation of156a7e3b passes. Off-checkout checks verify139 byte-identical stogir SDK modules, code-section equality, native LLVM/TPDE/stogir execution and the expanded alias/aggregate regression. Timing off/on objects are byte-identical for each backend with serial emission, and timing tags identify only the requested target.

A separate3-second macOS sample during stogir target emission is excluded from all timings above. Top CPU leaf: `allocation.pressure-into!`765 samples, constraint iterator195, i32 iterator155. Other-thread lock waits are not optimizer CPU. The query still scans all assigned parts and fixed-constrained uses at each allocation decision. Index reservations by register/position and maintain exact split ownership; use the existing full-scan pressure query as an oracle. A short sample can emphasize individual large functions, so verify scaling on small examples before another full checkpoint.

For runtime, pinned `ir.c` construction forwarding and `ir_sccp.c` LOAD cleanup are the next references. Exact-address partial forwarding exists upstream; offset-contained extraction is a distinct extension. Preserve typed payloads, aliases, barriers and roots, and keep optimization inside the measured boundary. Equal-input Phi folding is independently committed as137e2c2 but is not part of this compiler delivery.
