# Analysis buffer initialization: integrated measurement

Library b346ad2, Coil55649d17. Known-size plain integer/bool buffers use bulk zero
initialization. Algorithms, sentinels and ownership remain intact. Focused
ASAN/debug/native/AOT checks and Coil FAST49/49 pass (375.4s; time and1.61GB
object-step warnings). Matching toolchain installed globally.

Same-source LLVM-built driverscd81b35b/55649d17; caches off, serial O3/no-debug.
Eight rotating generation and16 native CPU samples after warmup. One comparison,
not repeated bootstrap acceptance. Output objects are identical before/current.

|Workload|Backend|IR→code ms|Kernel CPU ms|
|---|---|---:|---:|
|selector|before-stogir|0.3815|6.1815|
|selector|current-stogir|0.3675|6.1655|
|selector|llvm|15.3825|6.3610|
|selector|tpde|0.0490|18.0555|
|verifier|before-stogir|105.6470|35.2295|
|verifier|current-stogir|98.7060|35.0125|
|verifier|llvm|364.2035|10.1475|
|verifier|tpde|1.5565|68.2385|

Verifier generation improves6.57%,105.647→98.706ms. Selector0.3815→0.3675ms
is a tiny absolute difference. Generated-kernel runtime differences are noise;
this change improves execution of the compiler's analyses, not those unchanged
kernel instructions. No full-bootstrap gain is inferred. Last full measurement
was contended;5× generation/within10% runtime goal remains unmet.

[Raw data](results/analysis-storage/integrated.json), [driver](results/analysis-storage/measure.py).
