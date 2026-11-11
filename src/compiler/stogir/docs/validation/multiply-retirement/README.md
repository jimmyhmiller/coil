# Absorbed MUL_PWR2 retirement: dead code fixed, neutral verifier timing

Library9699a5e, candidatef50de3b8 versus75d34878. New matching test fails before
the fix and passes native debug/ASAN after it. Same source references/root guards;
only the pure word retirement set gains MUL. MUL_PWR2 is selected from original
MUL, so a shift-only retirement set missed it. The scan disassembly confirms
the dead LSL disappears. Independent linked AOT C reference checks also pass;
that correctness-only execution's timer output is excluded due concurrent tests.

| Actual verifier median | Before | Candidate | LLVM O3 |
|---|---:|---:|---:|
| IR-codegen ms |115.0785|117.5720|486.2005|
| CPU runtime ms |30.374|30.294|10.622|
| Object bytes |102066|101090|41440|

Four alternating generation samples and16 rotating CPU runtime samples after
warmups; identical frozen source and LLVM-built caller; serial/O3/no-debug/cache
off. No concurrent build/test during this comparison. Smaller code, no clear
runtime improvement and no demonstrated generation benefit. No full bootstrap
rerun is warranted by this result. Goal remains unmet. The earlier plus-one scan
win (candidate75d34878,15.96%) is separate; do not transfer its number to this
new candidate without measurement. Raw observations and hashes are preserved.
