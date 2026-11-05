# Caller preparation before guarded specialization: goal still unmet

Frozen source/candidate921b7207 uses the checked memory/SCCP preparation epoch
before raw large-caller expansion. Registered templates already have an early
preparation epoch. Source remains immutable across validation facts; cloning
ends that epoch, and native post-clone cleanup still runs. Only O2/O3/module
callers opt in. No load is guessed constant and the clone cap stays512.

## Small actual verifier

Identical verifier source and LLVM-built caller, three invalid categories and
128valid calls on a2048-node opaque graph. Four alternating generation samples
and16rotating CPU samples after warmup:

| Median metric | Baseline Stogir | Prepared Stogir | LLVM O3 |
|---|---:|---:|---:|
| IR generation ms |88.9575|92.3675|352.7580|
| Runtime CPU ms |32.5790|28.1430|9.2110|
| Object bytes |103966|102110|41440|

Caller arguments now expose the zero length as a numeric constant. Structure
expands19/23sites instead of15, reserves496cells and leaves16. Its two remaining
string-equality calls disappear. Runtime improves13.62%, generation costs3.83%
more in this small comparison. No bootstrap inference follows from that alone.

## Whole compiler diagnostic

| Full compiler metric | Stogir O3 | LLVM O3 |
|---|---:|---:|
| Seed IR-to-machine-code seconds |11.504476|33.386933|
| Seed total wall seconds |19.560758|40.826612|
| Generated compiler wall seconds |38.078731|17.278823|
| Generated compiler CPU seconds |37.948538|17.100887|
| Compiler object bytes |14601480|8508144|

Generation advantage2.902082×; generated-compiler wall slowdown2.203780×.
Goal requires generation at most6.677387s and runtime at most19.006705s on this
workload. It remains unmet. The logged37.948538/17.100887values are CPU time;
the established runtime comparison uses wall time above. Both generated hosts
emit exactly the seed Stogir object39d65fdb0980e202f6f79fedfb4cea0f6ab18e11fdff1ba917b9c77328db37e4.

One diagnostic sample each, no warmup/repetitions; not acceptance. Same frozen
source/SDK and official stamps, serial/O3/no-debug, caches/library state off,
established IR-codegen spans include all preparation. Source/system differ from
historical scalar checkpoints: no controlled historical speedup claim. The
whole compiler's structure body also has zero equality-call relocations versus
two in the historical scalar object, so that local transformation does reach
the compiler. Its impact is insufficient for a demonstrated bootstrap gain.

ABI/results/capture fixtures pass; quick9-step compiler gate passes36.3s.
Full FAST not run. Source/evidence committed, NOT installed globally, NOT pushed.
No performance adoption or goal completion. Full raw results and commands are
in pre-inline-bootstrap/, small comparison in pre-inline-verifier/.

Further work must improve broad code quality and generation cost. The context
helper currently runs a full original-callee eligibility scan before checking
whether any numeric binding exists. Calls with no numeric literal cannot select
any current context, so this optional proof work can be avoided while keeping
ordinary inline validation intact. This is a concrete next cost investigation;
no validation/clone-limit shortcut is authorized.
