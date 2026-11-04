# Current backend profile and next pressure reduction

LLVM-built Coil55649d17 emitting the whole compiler with stogir O3, serial,
library state off. Non-timed sampling requested eight seconds at elapsed eight;
process finished during sampling.6038 backend worker samples. Main-thread
6038 ulock waits are joining the worker and excluded from CPU attribution.

|Worker leaf|Samples|
|---|---:|
|uses.build|462|
|allocation.pressure-state-into!|440|
|verify.structure|379|
|verify.integer-operations-target-structured|348|
|a64.compile.generate-matched|292|
|call-inline.apply!|102|
|call-inline.eligible?|41|

This defers static inline proof caching in favor of pressure queries. Iterator
advancement appears under pressure traversal; do not infer an iterator compiler
bug from sampling alone. Empty per-register buckets are a proven no-event domain
and can avoid all range queries without changing allocation policy.

The standalone reduction0db3867 repeats7.99%/7.43% stogir runtime improvement on
sparse fragmented ranges, with dense -0.63%/+1.69% changes. Integrationa1fecfc1
passes FAST49/49 (267.5s,1.60GB object-step warning). Focused generation
repeat98.4985→96.9560ms, objects identical; earlier contended regression does
not repeat. See PRESSURE_REGISTER_DOMAIN.md.
The full5× generation and within10% runtime goal remains unmet.

[Profile metadata](results/storage-profile/metadata.json),
[driver](results/storage-profile/profile.py),
[stack excerpts](results/storage-profile/stacks.txt). Full raw sampling remains
under build/storage-backend-profile/profile.txt with hash recorded in metadata.
