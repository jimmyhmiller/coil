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

## Integrated repeat

Same fixed drivers, workload, context and sampling protocol as above. Verifier
104.1720 → 97.4310 ms generation (6.47% reduction), CPU35.5640 → 35.5855 ms,
103419-byte identical objects. LLVM O3 generation361.3815 ms, CPU10.1965 ms;
TPDE1.5170 ms, CPU69.4910 ms. Selector generation0.3640 → 0.3440 ms,
CPU5.9970 → 5.9745 ms; LLVM14.5180/6.1265 ms, TPDE0.0520/17.8170 ms.
This repeats the small integrated generation gain, with no runtime change.
[Repeat raw data](results/analysis-storage/integrated-repeat.json),
[driver](results/analysis-storage/measure-repeat.py).
