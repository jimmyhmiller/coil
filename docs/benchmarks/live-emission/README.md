# Post-inline live emission: generation improves, runtime goal remains unmet

Compiler source/candidate 6af08261; base source6eb62d2e. Original512-cell clone
budget and template eligibility unchanged. New target emission planning follows
live symbol edges after inlining, retaining public/alias/data/unit roots and all
Host-mode requested names. Raw callers finalize in submission order against
immutable registered callees. Only their final owned graph/import snapshots
survive; preparation scratch closes immediately. Native image validation and
optimization remain unchanged. Late references to pruned jobs are errors.

This is a Coil module integration pass, not a claim about upstream per-function
optimizer parity. No library algorithm or licensing policy changes. Source credit
remains in the vendored library LICENSE/NOTICE/PROVENANCE files.

## Same-source whole-bootstrap diagnostic

| Metric | Previous Stogir6eb62d2e | Current Stogir6af08261 | LLVM O3 |
|---|---:|---:|---:|
| Seed IR-to-machine-code s |11.918603|10.122838|32.439364|
| Seed total wall s |20.035547|17.419653|39.489309|
| Generated compiler wall s |35.031517|34.637405|16.294040|
| Generated compiler CPU s |34.749286|34.600565|16.251509|
| Generated compiler IR-codegen s |21.830231|21.832729|9.545449|
| Compiler object bytes |14348036|12662872|8528872|
| Seed peak bytes |4882710528|4996448256|4452188160|

Generation improves15.07% and object shrinks11.74% in this controlled diagnostic.
Generated compiler runtime is essentially unchanged (wall -1.13%, CPU -0.43%).
Current generation advantage3.20457x; runtime slowdown2.12577x. The goal requires
IR-codegen<=6.487873s and generated-compiler wall<=17.923443s on this source.
It remains unmet. Do not extrapolate a small-case runtime or historical-source
improvement to the bootstrap.

All backends emit the same frozen6af08261 compiler source. Generated hosts all
compile the same source to current Stogir O3 and produce the exact seed object
`a71620d1afd0ea2dfe889b6e56abb5b22b618d2b7c8d6214efb484882b73be2c`.
Previous-backend host targets the current implementation too; its compiler object
is expected to differ while its emitted target object must match exactly.

Single diagnostic per seed/backend/generated host, no warmup/repetition. Serial,
O3/no-debug, caches/library state off, unchanged SDK/source digest checked. No
competing build/test during measurement. Order current Stogir/LLVM seeds, current
Stogir/LLVM generated hosts, previous Stogir seed/generated host. This is not
performance acceptance. Newly added planning, validation and arena release are
included in IR-codegen records.

Initial cache source20fe6c2b retained entire preparation arenas and peaked near
6.9GB. Evidence is in initial-cache; it is superseded by finalized snapshots.
Final peak is near5.0GB (about2.3% above the same-source previous-backend seed),
with generated hosts also near5.0GB. Different-source initial measurements are
not a controlled performance comparison.

## Repeated compiler-derived verifier

| Median | Previous | Current | LLVM O3 |
|---|---:|---:|---:|
| IR-codegen ms |95.501|83.820|340.986|
| CPU runtime ms |25.0865|25.1565|8.8405|
| Object bytes |97858|85126|41440|

Four rotating generation/16CPU samples after excluded warmups; same source and
LLVM-built opaque caller, serial/O3/no-debug/cache+library-state off. Generation
improves12.23%; runtime unchanged. Planner retains56of138emission jobs; its first
conservative CIR-only-root version retained98. Static pruning is not a proxy for
runtime quality. Full bootstrap remains the actual objective.

## Validation and delivery

Quick gate PASS49.2s; full cli/objects gate PASS43.9s (peak3.99GB memory warning).
Native ABI/control/atomics/register-results/capture-loop checks pass; O1/O2 root
fixture passes. The object regression proves unused leaf/wrapper removal while
retaining native-data and cloned function addresses, C export alias, recursion,
and functions exposed only through a prebuilt unit. Separate C constructor
checks200exported-alias calls; source kernel checks200inputs.

The ASAN backend harness constructs CIR directly (no runtime frontend), inlines
an eligible callee into32deferred callers, grows metadata arrays, releases every
caller arena, then checks6432calls into the emitted code. Zero failures. It is
included in the CLI object gate. No sanitizer suppressions used.

A sanitized full compiler independently fails during parsing with both LLVM and
Stogir, before emission. Allocated hygiene names from primitive-bind-one! escape
resolve-form-probe's reset scratch. A matching frozen20fe6c2b compiler/SDK copy
reproduces the LLVM failure from outside the project. Stack traces and command
are under frontend-asan; coil-bugs/resolve-form-probe-hygiene-scratch-use-after-free
records it. Do not claim end-to-end compiler ASAN is clean.

Full FAST PASS331.5s in the standard environment, before push. Warnings: wall
past300s target; cli/objects peak3.99GB past1.5GB warning line. An earlier
COIL_LIBRARY_STATE=0 run was interrupted and had environment-dependent
link-golden/meta-state failures. Both compilers produce the same expected LLVM
wrapper name under standard settings. Goldens and test requirements unchanged.
Nothing installed globally; source/evidence commits are on
feature/stogir-live-emission.
