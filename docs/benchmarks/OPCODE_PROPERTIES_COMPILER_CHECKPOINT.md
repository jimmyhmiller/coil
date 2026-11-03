# Scalar opcode flags compiler diagnostic

Source49ee73c1, scalar masks still def globals. O3/no-debug, local macOS
AArch64, serial, library-state cache disabled for both hosts. Single diagnostics,
not acceptance medians. Adaptation and module preparation are included.

| Host | Target | IR-to-code seconds | Whole emission seconds |
|---|---|---:|---:|
|LLVM O3|LLVM O3|32.823913|40.45821375004016|
|LLVM O3|stogir O3|9.092052|17.223058167030104|
|stogir O3|LLVM O3|33.036294|59.18137966701761|
|stogir O3|stogir O3|50.48038|77.04119629098568|

3.61× faster generation on the LLVM host; native self-rebuild4.47× slower.
Goal unmet. Both target objects are byte-identical across hosts. Generated
stogir compiler11252336bytes; version/check/native smoke tests pass.
FAST49/49 passed216.4seconds (objects memory warning1.61GB). All three
backends produce the exact small property-kernel checksum.

Literal const masks are a separate measured follow-up: LLVM improves sharply
on the small kernel while stogir does not. Do not generalize the earlier
def-mask kernel's near-LLVM result. Integer-literal PHI conversion is the next
backend component; its graph/JIT tests pass but compiler speed is not measured.
