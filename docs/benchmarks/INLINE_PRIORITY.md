# Inline selection within the existing512-cell cap

The optional library policy7f5c17c validates input through the existing transaction,
then estimates budget pressure from cached immutable base clone extents. Under
pressure it uses existing CFG/dominator/natural-loop facts to prefer deeper loop
calls, then smaller templates and stable original ordinals. Otherwise it keeps
source order and skips loop analysis. Exact growth, cast/scope/anchor charges,
Never, recursion and result/capture legality remain unchanged. Existing library
ordered APIs are preserved. This module policy is our extension, not an upstream
function-inliner port. The production use builder retains its shared count/fill walk.

The first cost-only policy was rejected after about20% shared-use regression:
it left graph.operand called in the hot loop. [Raw cost-only data](results/inline-priority/cost-only.json)
includes its invalid split probe, explicitly excluded because cwd resolved Coil's
SDK for both source variants. Revised probes use their actual project contexts;
raw data records those contexts, source fingerprints and exact runner hashes.

ASAN/debug module tests pass stable ordering over1025sites, released provider
storage, error cases, dependent calls and noncommuting stores in either processing
order, and exact growth budgets. A native one-cell case proves the loop-aware
API expands the loop call while the ordered API expands the earlier cold call;
both images give equal answers. Zero budget/invalid entry/released registry and
normal single-site transactions also pass. Linked Mach-O module/switch AOT passes.

Same-source LLVM-built drivers: before4d21432d, currentcd81b35b. Cache off,
serial O3/no-debug; eight rotating generation and16 process CPU samples after
warmup per run. Generation includes module preparation/finish, confirmed by the
existing ir-codegen timer around those stages. Opaque callers verify every run.

|Run|Workload|Backend|IR→code ms|Kernel CPU ms|Object bytes|
|---|---|---|---:|---:|---:|
|1|selector|before-stogir|0.3855|6.1100|726|
|1|selector|current-stogir|0.3750|6.0890|726|
|1|selector|llvm|14.3800|6.1020|944|
|1|selector|tpde|0.0505|17.6815|910|
|1|verifier|before-stogir|104.6130|35.6710|105950|
|1|verifier|current-stogir|103.5605|34.7805|103419|
|1|verifier|llvm|356.4440|10.0565|41008|
|1|verifier|tpde|1.5455|67.7470|75662|
|1|uses-shared|before-stogir|15.0820|10.4340|24906|
|1|uses-shared|current-stogir|15.2635|10.2195|24959|
|1|uses-shared|llvm|55.5985|5.9270|12464|
|1|uses-shared|tpde|0.4230|41.7425|22634|
|1|uses-split|before-stogir|15.7595|11.6155|25170|
|1|uses-split|current-stogir|15.8955|10.6180|25418|
|1|uses-split|llvm|55.3115|6.0220|12456|
|1|uses-split|tpde|0.4610|42.4575|22954|
|2|selector|before-stogir|0.3715|5.9630|726|
|2|selector|current-stogir|0.3775|5.9940|726|
|2|selector|llvm|14.3590|6.0965|944|
|2|selector|tpde|0.0490|17.5930|910|
|2|verifier|before-stogir|104.8735|36.4800|105950|
|2|verifier|current-stogir|103.8275|35.5495|103419|
|2|verifier|llvm|360.3175|10.1735|41008|
|2|verifier|tpde|1.5380|69.2845|75662|
|2|uses-shared|before-stogir|15.3185|10.2715|24906|
|2|uses-shared|current-stogir|15.3865|10.1525|24959|
|2|uses-shared|llvm|56.1525|5.8010|12464|
|2|uses-shared|tpde|0.4220|42.0280|22634|
|2|uses-split|before-stogir|16.0460|11.6245|25170|
|2|uses-split|current-stogir|16.1120|10.6635|25418|
|2|uses-split|llvm|57.5995|6.0270|12456|
|2|uses-split|tpde|0.4580|42.5125|22954|

Verifier CPU improves2.5%/2.6%, generation roughly1%. Shared-use CPU improves
2.1%/1.2%, with generation roughly neutral/slightly higher. Split-use CPU improves
8.6%/8.3%, but remains slower than shared-use, so its source refactor is rejected.
Selector objects are byte-identical before/current; its tiny runtime differences
are noise. None of these reductions proves the whole-compiler goal.

[First run](results/inline-priority/loop-aware.json), [repeat](results/inline-priority/loop-aware-repeat.json),
[driver](results/inline-priority/measure-loop-aware.py).

Full compiler diagnostic: all drivers compile the same frozen source; native
compilers are linked from each corresponding before/current/LLVM object and then
compile that same source to stogir O3. All three native outputs are byte-identical
to the host-current output (SHA256 begins6b19c4dc5b3d3744).
External Rust jobs overlap the emissions and native stogir runs, with changed
load before native LLVM. The following are contended diagnostics, not acceptance
ratios or an attributed speedup:

|Driver → backend|IR→code s|Total CPU s|Object bytes|
|---|---:|---:|---:|
|before-stogir → stogir|19.286140|31.003709|15234808|
|current-stogir → stogir|13.817794|23.805429|14902728|
|llvm → llvm|47.015942|55.256369|8484792|
|native-before-stogir → stogir|44.210030|70.605524|14902728|
|native-current-stogir → stogir|32.577901|59.779753|14902728|
|native-llvm → stogir|11.668356|18.926610|14902728|

[Full raw data and host snapshots](results/inline-priority/compiler-contended.json),
[driver](results/inline-priority/measure-compiler.py). Cross-host object equality
is a correctness result; it does not validate timing.5× generation and runtime
within10% of LLVM on compiler bootstrap remain unmet.
