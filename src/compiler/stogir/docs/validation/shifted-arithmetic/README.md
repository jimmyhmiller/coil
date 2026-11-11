# Shifted arithmetic: code reduction, no measured runtime gain

Standalone1e8ab84; compiler source/candidatec9186232. Existing source fixtures,
same LLVM-built runners, four alternating generation samples and16 rotating
CPU runtime samples after excluded warmups. Serial/O3/no-debug/caches off. No
concurrent builds/tests during either timed comparison. Both runners check results.

| Median | Before928b34ee | Candidatec9186232 | LLVM O3 |
|---|---:|---:|---:|
| Node-access IR-codegen ms |0.202|0.201|14.2425|
| Node-access CPU ms |182.623|183.313|182.9365|
| Actual verifier IR-codegen ms |96.926|97.062|373.8175|
| Actual verifier CPU ms |29.640|29.611|10.1985|
| Actual verifier object bytes |102110|102078|41440|

Node access instruction count12→10 (LLVM7), but the opaque-call workload gives
no runtime improvement. Actual verifier generation+0.14%, runtime-0.10%:
no clear gain. It remains2.90×LLVM runtime. No full bootstrap rerun or performance
adoption is justified by this result. The whole-bootstrap goal remains unmet.

The attempted packed-load hypothesis is not demonstrated by aggregate-get:
existing scalarization already avoids stack storage. Do not use this example to
justify an interior-load promotion rewrite. Target shifted arithmetic changes
code as intended but its effect is too small here. Raw observations, source and
compiler hashes, scripts and disassembly accompany this report.
