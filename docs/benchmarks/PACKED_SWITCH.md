# Guarded packed switch-result folding

The standalone library bb45b33 (source implementation 300e221) recognizes pure
contiguous integer switch results in the existing SCCP merge walk. It emits a
bounds guard and packed shifts/mask/addition, preserving default effects/traps.
This is an independent extension over upstream-shaped IR, using existing nodes.
The compiler imports that library unchanged; attribution remains centralized in
its README, LICENSE, NOTICE and provenance. See the [library contract](../../src/compiler/stogir/docs/SWITCH_VALUE_LOOKUP.md).

112 native differential fixtures compare original, direct rewrite and public
SCCP code; two floating fallbacks and one logical 32-bit pointer graph complete
the domain checks. Exact use multisets and typed validation pass. ASAN/debug
switch, verifier, module-execution and SCCP-control suites and linked AOT pass.

Same-source integrated emitter comparison uses the previous a121b4d7 and current
84f388f7 LLVM-built compiler drivers, cache off, serial codegen, O3/no-debug.
Eight rotating generation and sixteen process CPU samples exclude warmup per
run. Compile numbers measure only the instrumented IR-to-machine-code phase.
Runtime is an opaque native C caller; selector checks all ten results then five
million calls and checksum21000000. The verifier runner is unchanged from the
preceding comparison and checks its result/invalid-graph cases.

|Run|Workload|Backend|IR→code ms|Runtime CPU ms|Object bytes|
|---|---|---|---:|---:|---:|
|1|selector|before-stogir|0.4885|14.9490|1080|
|1|selector|current-stogir|0.3740|6.2505|726|
|1|selector|llvm|14.6305|6.3445|944|
|1|selector|tpde|0.0465|18.2720|910|
|1|verifier|before-stogir|112.4360|34.7940|106236|
|1|verifier|current-stogir|112.7380|34.8245|106236|
|1|verifier|llvm|365.5750|10.2060|41008|
|1|verifier|tpde|1.4760|68.1035|75589|
|2|selector|before-stogir|0.4965|14.6285|1080|
|2|selector|current-stogir|0.3820|6.1475|726|
|2|selector|llvm|14.7650|6.1465|944|
|2|selector|tpde|0.0520|17.9010|910|
|2|verifier|before-stogir|113.0230|34.8110|106236|
|2|verifier|current-stogir|112.3865|34.7310|106236|
|2|verifier|llvm|359.8940|10.4760|41008|
|2|verifier|tpde|1.5170|68.2485|75589|

Selector runtime improves58.2%/58.0%, reaching0.985×/1.0002× LLVM O3.
Generation improves23.4%/23.1%, at39.1×/38.7× faster than LLVM on this reduction.
The guarded jump table and arm stubs become packed arithmetic; object size falls
1080→726bytes. The emitted code retains the invalid-tag bounds trap.

Verifier old/new objects are byte-identical, SHA256 beginning1d17ba01062ba0d6;
its roughly3.3× LLVM runtime gap remains. Small selector results do not establish
the5× generation/within10% runtime goal for the whole compiler.

[Raw first run](results/packed-switch/small.json), [repeat](results/packed-switch/small-repeat.json),
[driver](results/packed-switch/measure.py), [fixture](results/packed-switch/selector.coil),
[C runner](results/packed-switch/runner.c), and disassemblies in the same directory.
Host process/load snapshots are in the JSON; these are local Mac diagnostics,
not controlled exclusive-host acceptance measurements.

The real imported `coil.compiler.parser.sx-tag` probe expands one call site and
emits the same guarded packed arithmetic. See [kernel assembly](results/packed-switch/parser-kernel.asm),
[probe](results/packed-switch/parser-probe.coil), and [trace](results/packed-switch/parser-inline-trace.txt).

Full compiler, same frozen source, one serial local diagnostic (not repeated
acceptance). Native compilers are linked from the exact corresponding host
objects and each compiles that same source to stogir O3. All three current
stogir outputs are byte-identical across the LLVM-built driver and both native
compilers. The source fingerprint and host snapshots are in [raw data](results/packed-switch/compiler.json).

|Driver → output backend|IR→code seconds|Total CPU seconds|Object bytes|
|---|---:|---:|---:|
|before-stogir → stogir|13.644904|22.061680|15339684|
|current-stogir → stogir|13.643260|22.101396|15223844|
|llvm → llvm|33.382487|40.948919|8479344|
|native-current-stogir → stogir|30.123025|49.518112|15223844|
|native-llvm → stogir|11.455257|18.947468|15223844|

Current generation is2.45× faster than LLVM O3; the generated stogir compiler
is2.61× LLVM's runtime on compiler-to-stogir. Before/current integrated generation
is neutral. The5× generation/within10% runtime goal remains unmet. This full run
does not compare old-source versus new-source compiler runtime, and cannot
attribute a full runtime gain to packed lookup. Background desktop/system work
was present; preserve these as qualified diagnostics rather than acceptance.
