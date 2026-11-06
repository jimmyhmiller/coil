# Fused free-register selection experiment

Build exact rounded per-register limits as before; simultaneously track the same
ascending-ID, strict-improvement maximum used by scan.choose-free. After all
limits are constructed, preferred then source hints retain priority. Returned
Choice and complete scratch array are preserved, including sizes greater64.
Fixed requirements, allowed masks, input-boundary rounding unchanged. Pure
interval-end/required-use values are computed once per query. Independent source
optimization, not a policy port. Pinned upstream92171d0 ir_ra.c uses free-until
bounds and highest-free choice, but has a caller-saved tie preference our old
lower-ID policy does not encode explicitly; this experiment does not change it.

69,984 reference-policy cases (9sizes×9positions×6preferences×8masks×6sources×3steps)
compare register, until and every scratch element. Existing spill/split/hint/
allocation suites also execute. Native O3/debug and LLVM O1/debug/ASAN PASS.
Reference policy still uses original independent register-limit and choose-free.

Fixed93222a58 emitter, common b27 LLVM caller,300000opaque queries with alternating
GP/FP masks and fixed constraints. Eight rotatingCPU samples afterwarmup, no
build/test/profile overlap. Unhinted Stogir80.3175→74.713ms(-6.98%), repeat79.9625→
74.4285ms(-6.92%); LLVM46.164→45.901ms, repeat45.995→45.835ms. Mixed sources -1/30/63:
Stogir78.971→76.811ms(-2.74%), LLVM45.885→47.157ms(+2.77%). Hints reduce benefit;
LLVM regression is a limitation requiring actual-emitter measurement before
promotion. The source API uses opaque create/query/release state so the common
caller imports no backend modules; setup outside repeated query loop.

Initial typed caller hit existing Coil duplicate-module-global linker bug; full
log retained and existing coil-bugs report updated. No duplicate-symbol override.
No integrated or whole-bootstrap result. Goal remains unmet. Not installed/pushed.
