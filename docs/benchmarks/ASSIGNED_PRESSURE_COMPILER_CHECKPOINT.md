# Assigned-pressure full compiler diagnostic

Component `9d4d792`, Coil integration `32c67fbd`. One serial diagnostic sample,
explicit O3 and no debug information, identical full compiler source. Both hosts
use `COIL_LIBRARY_STATE=0`; code-generation timing is enabled and TPDE emission
is serial. These are diagnostic observations, not repeated acceptance medians.

|Compiler host|Target|IR-to-code seconds|Whole emit seconds|
|---|---|---:|---:|
|LLVM O3|LLVM O3|29.032168|35.872616|
|LLVM O3|stogir O3|8.164826|15.818037|
|stogir O3|LLVM O3|30.104541|58.812077|
|stogir O3|stogir O3|77.141223|108.787583|

The fixed-host backend comparison is **3.56× faster**. The generated compiler's
native self-rebuild is **6.88× slower** than the LLVM-built host. The active
5× code-generation / within 10% runtime goal remains unmet. Compared with the
previous diagnostic, stogir code generation fell from 14.828704 to 8.164826 s;
that cross-checkpoint difference also includes normal single-sample variation.

Both target objects are byte-identical across the LLVM and stogir compiler hosts.
Three smaller regression objects also match the prior allocator exactly. Native
LLVM/TPDE/stogir smoke executions return 42. Pressure oracle tests and native
pressure, stack, realignment and stencil ASAN checks pass. See the raw JSON for
source digest, object hashes, record counts and exact measurements.

Next runtime investigation uses the existing compact aggregate getter, which
still copies wide words through a stack object before reading narrow fields.
Keep the scalar memory dependence and typed forwarding work in the independent
library, before matching and liveness, with conservative alias/control barriers.

Delivery validation: FAST passes all49 checks (209.3 s; existing object-check
memory warning at1.63 GB). Official global installation succeeds at32c67fbd.
Off-checkout LLVM/TPDE/stogir AOT execution returns42; new SDK modules import;
pressured-call native JIT and ABI probes pass. Installed code sections equal the
candidate and all141 installed library sources exactly match the component.
