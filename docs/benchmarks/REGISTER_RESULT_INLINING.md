# Proven register-result expansion: development checkpoint

Source4a846d29, baseline7f1ed43d. Experimental integration, not installed or
pushed. Standalone private-buffer proofaa379e0 passes ASAN and stogir-built
execution across GPR/signed/f64 pairs, four f32 pieces and a vector return, raw
NaN/high-bit inputs, alias/escape/coverage/root/size/read/non-immediate capture
fallbacks, Never, budget0 and 32-bit fallback. Previous code fails the expansion
assertion. Combined library tests also pass.

Compiler templates preserve full observed roots separately from their single
RETURN eligibility root. After actual expansion in a template with ALLOCA, the
normal memory/SCCP pipeline promotes newly private capture storage. Its cost is
inside existing module preparation timing. The CLI fixture passes LLVM/TPDE/
stogir: exit42 normally; --loop preserves an infinite non-returning control arm
(observed alive until subprocess timeout/termination).

One identical opaque LLVM caller object,20million calls, one excluded warmup,
five alternating process samples; each execution checks checksum6350000000.

| Kernel | Before stogir seconds | After stogir seconds | LLVM O3 seconds | TPDE O3 seconds |
|---|---:|---:|---:|---:|
|Raw aggregate get (control)|0.022204624954611063|0.02199983294121921|0.022266540909186006|0.02461633295752108|
|Checked slice view|0.15568950003944337|0.14698970806784928|0.02275966596789658|0.27900704205967486|

The first kernel already has no aggregate calls. The checked view improves5.6%
but remains6.46× slower than LLVM. Its single diagnostic IR-to-code samples are
0.000825s before,0.000829s after, LLVM0.015425s and TPDE0.000062s. These tiny
compile samples do not establish full compiler acceptance. Raw samples/hashes
are adjacent. TPDE runtime samples vary substantially; retain the raw spread.

Assembly still contains ArrayList.slice and slice.new calls. Slice.new contains
unused normal loads from an undef-construction temporary; retained ALLOCA makes
the otherwise-small callee ineligible. SCCP queues dead LOADs, but this port's
iterative cleanup currently implements foldable data only. Upstream's dead-load
control bypass is the next concrete missing pass; no success claim is made for
removing these remaining calls yet.
