# Combined whole-bootstrap diagnostic

Source/candidateca35b006; standalone shared fusionf675d59/verifier78394b7.
SDKd24ae0c8351fd3e54592b60210fcf9e50943ef9c473167d1bfc97809efa97bba.
Serial/cache-off/O3/no-debug, established IR-codegen phase sums.
Single diagnostic per backend/host, no acceptance claim.

| Measurement | LLVM O3 | Stogir O3 | Required Stogir |
|---|---:|---:|---:|
| Seed IR→machine code |33.132373s|10.240683s|≤6.626475s|
| Generated compiler wall |15.498979s|26.771149s|≤17.048876s|
| Generated compiler CPU |15.477774s|26.756079s|—|
| Generated compiler own Stogir IR phase |8.584246s|15.487347s|—|
| Compiler object bytes |8602112|11804700|—|

Generation3.235368× faster; runtime1.727285×LLVM. Goal unmet, still about35.3%
less generation and36.3%less runtime required. Whole result is not materially
changed by these local improvements. Previous304 diagnostic3.245510×/1.745011×
was a different source/run; no causal whole-speedup claim.

Both generated hosts reproduce seed Stogir object exactly:
4eabbe8390f4e2c0ada3e5c15ead7a9958d912f84061d30e49a308b8219e9b49.
Background mediaanalysisd≈94%CPU, WindowServer and other processes remain.
No task build/test/sampling overlaps timing. This is a provisional diagnostic;
repeated controlled runs are required for performance acceptance. Candidate
build, quick43.5s and live-emission/prebuilt-unit checks pass. FullFAST pending.
Not installed or pushed.
