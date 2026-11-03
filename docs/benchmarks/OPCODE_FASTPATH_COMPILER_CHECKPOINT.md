# Opcode fast paths and rooted-memory correctness: compiler diagnostic

Standalone3177b24 (arityba7f6d5, operand categories20d6aff, rooted effects3177b24)
and Coilb77627ee. One serial O3 diagnostic sample per combination, cache off,
codegen timing on, no debug information. Not repeated acceptance medians.

|Compiler host|Target|IR-to-code s|Whole emit s|
|---|---|---:|---:|
|LLVM O3|LLVM O3|30.211726|37.309145|
|LLVM O3|stogir O3|6.908697|14.824636|
|stogir O3|LLVM O3|31.061576|59.870562|
|stogir O3|stogir O3|49.133216|80.174663|

Backend generation is4.37× faster. Generated compiler native self-rebuild remains
5.41× slower. The active5× generation /within10% runtime goal remains unmet.
The prior emitter checkpoint reported93.44s native-host wall time; current80.17s
is progress across source checkpoints, not a controlled isolated/repeated gain.
Both target objects match byte-for-byte across generated hosts, and three fixed
native/getter/branch regression objects exactly match0b04f881. Native backend
executions return42. Stogir object12315808 bytes; linked compiler11612448 bytes.

Fixed arities now use signed-byte tables; internal operand classification uses
the existing numeric codes instead of names. Public string APIs and independent
oracles remain.131 opcode counts derive independently from pinned shape strings;
all operand/index boundaries and invalid codes are checked. The feedback kernel
report OPCODE_ARITY_TABLES.md isolates arity lookup rather than compiler speed.

An observable LOAD value root also retains prior control effects. Forwarding
and promotion now preserve its typed value identity and add its resolved control
closure as a root. The regression fails against the unchanged pass and passes
for direct/promotion, same-width typed views and subsequent SCCP. This closes a
component root-contract bug; normal compiler RETURN roots already retained the
chain. No artificial operands or weakened verification are introduced.

ASAN covers opcode/builder/verifier/use lists, SCCP/control/iterative use-list
oracles, promotion, calls and vector lanes/stencil. The root/promotion test also
passes when its host program is stogir-built. FAST49/49 passes in206.3s with the
object-check memory warning1.63GB. Official installation and off-checkout all3
backend AOT runs, pressure/ABI, high-field, resolver, metadata and rooted-memory
oracles pass. All142 installed sources and candidate code sections match.
