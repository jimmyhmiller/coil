# Compact aggregate getter: control-chain memory forwarding

Same unchanged 16-byte compact-node getter and shared LLVM O3 caller,200million
opaque calls, checksum63500000000. Five alternating warm measured runs after one
excluded warm run. Component81cf8d6 / Coil2860d92b, baseline installed32c67fbd.

|Kernel|Median seconds|
|---|---:|
|LLVM O3|0.167748042|
|stogir O3 before forwarding|0.283242000|
|stogir O3 with forwarding|0.196610291|

Forwarding reduces runtime30.6%; the new kernel is17.2% slower than LLVM. This
small case is not full-compiler acceptance. All answers match. One exact LLVM
caller object is shared; raw hashes and samples are retained.

The stack copy, frame and three memory field reloads disappear:30 instructions
become16. Remaining code has three zero-shift W-register truncations, separate
signed extensions and shifts/adds. LLVM emits7 instructions, including LDRSW,
scaled addressing, arithmetic-shifted ADD and signed-extended ADD. Further
combining belongs in typed graph folds or persistent target matching before
liveness, with real operand redirection and rooted/shared-node checks.

Delivery checks: FAST49/49 passes in208.8 s; object-check memory warning at
1.70 GB. Official global installation succeeds at2860d92b. Off-checkout all
three native backends return42, new modules import, pressured-call JIT/ABI
checks pass, candidate/installed code sections match and all142 installed module
sources match the standalone implementation. Full-compiler diagnostic follows.
