# Specialization prefilter: no demonstrated performance gain

Library67429e5, candidate928b34ee; checked native specialization suite passes
with debug checks and AddressSanitizer, including all-dynamic ordinary expansion.

Four alternating generation samples after warmup,16 rotating CPU runtime samples
after warmup. Identical source and LLVM-built runner. Timings include all
IR-codegen work; serial/cache off/O3/no-debug. No concurrent build/test during run.

| Median | Before921b7207 | Prefilter928b34ee | LLVM O3 |
|---|---:|---:|---:|
| IR-codegen ms |114.421|113.859|418.1655|
| Runtime CPU ms |37.421|38.325|16.036|
| Object bytes |102110|102110|41440|

Before and candidate objects are byte-identical, SHA256
f81eabec30d29b60239ae906dae95f2283352ad0a8d38e208beb547f0e341e02.
Generation difference0.49% is insufficient to establish a useful improvement;
runtime variation on identical code cannot support a code-quality claim. Absolute
timings differ from earlier runs; use this paired comparison only. No bootstrap
rerun is warranted for this result. Goal remains unmet; broader promotion,
call/codegen quality and generation-cost work are required. Full source hashes,
individual observations and executable hashes are in results.json.
