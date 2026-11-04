# Validated switch-control call expansion

Standalone5a966c8 extends the existing bounded module clone to typed SWITCH,
CASE_VAL, CASE_RANGE and CASE_DEFAULT. Complete dispatch preflight, exact key/
control remapping, Phi insertion order, observed roots and budget/Never checks
remain in force. This is our module extension over upstream-shaped IR.

ASAN/debug module execution passes32 dense/range,width,return/trap graphs,
including native before/after values/stores, actual child-process traps, zero
budget, missing terminal observations, malformed dispatch and cloned jump-table
data. The switch validator and linked Mach-O module driver also pass. Tests and
commands are in src/compiler/stogir/docs/INLINE_SWITCH_CONTROL.md.

The actual parser.sx-tag reduction now reports common=true and1site/1change
(previously common=false/0changes). The earlier captured140-cell/33-clone-cell
body is eligible without changing the512-cell budget. Exact trace is in
[real-selector-trace](results/inline-switch/real-selector-trace.txt).

Same frozen source, before9af0f6f2/currenta121b4d7. Eight rotating generation
samples and16 rotating process CPU samples per run exclude warmup, caches off.
The small standalone aggregate selector preserves the real10-arm tag mapping
without importing compiler dependencies. One exact opaque C runner checks all
10answers and a5-million-call checksum. The verifier uses its exact opaque LLVM
runner with valid and malformed layout/reference/type assertions.

| Selector | First gen ms | Repeat gen ms | First CPU ms | Repeat CPU ms | Object bytes |
| --- | ---: | ---: | ---: | ---: | ---: |
| Before stogir |0.4205|0.4045|17.0500|16.5510|904|
| Current stogir |0.4870|0.4865|15.4510|14.9400|1080|
| LLVM O3 |15.8100|14.8425|6.5965|6.1765|944|
| TPDE |0.0505|0.0485|18.5265|18.0005|910|

Selector CPU improves9.4%/9.7%. Current remains2.42× LLVM CPU in the repeat.
Generation and object size increase; this is not full compiler goal acceptance.

| Verifier | First gen ms | Repeat gen ms | First CPU ms | Repeat CPU ms | Object bytes |
| --- | ---: | ---: | ---: | ---: | ---: |
| Before stogir |112.4280|105.8110|35.5300|33.9040|101874|
| Current stogir |115.6570|109.0665|35.5125|33.9680|106236|
| LLVM O3 |381.9565|348.5635|10.6635|9.6445|41008|
| TPDE |1.5285|1.4800|68.7655|66.9720|75589|

Verifier runtime is neutral; generation increases roughly3%. JSON retains all
samples, exact compiler/source/runner/object hashes and host snapshots.

## Full compiler diagnostics under changing external load

The source hash is724baa9f04f99c12764ad7cf0db9a2ff9cce0c08ab1a424156e4e88b74e7a1c6.
Both runs show external Rust/mi_cs/Node work in snapshots; the second has renewed
Rust load during its native LLVM row. These timings are preserved as contended
diagnostics and must not support acceptance or a regression/improvement claim.

| Run/driver | Generation s | Whole CPU s |
| --- | ---: | ---: |
| First before LLVM-built / stogir |17.852096|27.951250|
| First current LLVM-built / stogir |17.861665|28.325158|
| First current LLVM-built / LLVM O3 |39.615049|49.021197|
| First native stogir / stogir |30.443420|51.175602|
| First native LLVM / stogir |11.270714|18.568522|
| Repeat current LLVM-built / stogir |14.705791|23.632144|
| Repeat current LLVM-built / LLVM O3 |36.104921|44.502255|
| Repeat native stogir / stogir |31.884084|51.640935|
| Repeat native LLVM / stogir |11.710570|21.319107|

All current native outputs match their host-emitted stogir object, across both
runs. Current object15320120bytes, before14368324, LLVM8469320. Thus full-compiler
cross-host consistency passes; no quiet full performance acceptance is available.
The previous less-contended checkpoint remains2.75× generation and2.85× native
CPU relative to LLVM; the5× generation/within10% runtime goal remains unmet.

The remaining selector gap is explicit: native guarded control jump tables and
per-arm Phi transfers versus LLVM's scalar constant-data lookup. A future guarded
constant-result lookup optimization must preserve default/trap behavior and
observed control. It is not established as an upstream feature and is not
implemented here.
