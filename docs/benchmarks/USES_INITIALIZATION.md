# Bulk def-use initialization: compiler integration

Library f34be99 replaces repeated zero push loops with bulk initialization of
known plain-integer storage extents, following pinned upstream allocation.
Exact reference categories, count/fill ordering and mutation behavior remain.
ASAN/debug uses, mutable-use, switch native matrix and verifier suites pass.
[Library evidence](../../src/compiler/stogir/docs/USES_INITIALIZATION.md) records
the reduced builder runtime improvement15.1%/14.6% with an independent checksum.

Same-source integrated emitter comparison: LLVM-built drivers86648db1 before
and4d21432d after, O3/no-debug/cache off. Eight rotating generation samples per
run after warmup. These numbers measure actual compiler IR-to-machine-code
execution; runtime of the already-generated kernel is separate.

|Run|Workload|Backend|IR→code ms|Kernel CPU ms|Object bytes|
|---|---|---|---:|---:|---:|
|1|selector|before-stogir|0.3805|8.9035|726|
|1|selector|current-stogir|0.3770|8.0795|726|
|1|selector|llvm|14.9520|9.4840|944|
|1|selector|tpde|0.0505|21.9255|910|
|1|verifier|before-stogir|114.8575|34.9445|106236|
|1|verifier|current-stogir|107.7775|34.8510|106236|
|1|verifier|llvm|371.0750|10.3485|41008|
|1|verifier|tpde|1.5075|68.1635|75589|
|2|selector|before-stogir|0.3830|6.0805|726|
|2|selector|current-stogir|0.3700|6.0960|726|
|2|selector|llvm|14.7410|6.2740|944|
|2|selector|tpde|0.0525|18.1340|910|
|2|verifier|before-stogir|114.0640|35.3695|106236|
|2|verifier|current-stogir|107.7045|35.1365|106236|
|2|verifier|llvm|373.2120|10.5410|41008|
|2|verifier|tpde|1.5195|68.6215|75589|

Verifier generation improves6.16%/5.58% (114.8575→107.7775ms and
114.0640→107.7045ms). Selector generation is0.3805→0.3770ms and
0.3830→0.3700ms; its tiny absolute difference does not establish a broader gain.
Both old/current selector objects are byte-identical, as are both verifier
objects. Their measured kernel runtime differences are noise; no generated-code
runtime improvement is claimed. The first selector runtime set is visibly slower
than the repeat despite identical objects; host snapshots are retained.

[First raw run](results/uses-initialization/integrated.json),
[repeat](results/uses-initialization/integrated-repeat.json), and
[driver](results/uses-initialization/measure-integrated.py).
No new full bootstrap measurement is made for this step. The last qualified
full checkpoint remains2.45× LLVM generation and2.61× LLVM runtime, outside the
5×/within10% goal. New full measurements need a larger accumulated change;
small reductions guide the next work.
