# Private leaf module integration: goal still unmet

Source/candidate572c6210, library9c0b80a (including88ec58b and6e39cf1).
Frozen SDK `11d308f990e57d01decf92d96125c1dd2dcc27c7e4cf7dd47d0830926eed82df`. Neither globally installed nor pushed.
Quick52.6s and extended live/prebuilt suite pass. Library module identity/ABI
matrix native and ASAN pass; existing private pressure/aggregate checks pass.

## Same-source whole bootstrap diagnostic

| Measurement | LLVM O3 | Stogir O3 | Target |
|---|---:|---:|---:|
| Seed IR→machine code |35.870503s|10.700077s|≤7.174101s|
| Generated compiler wall |16.274722s|28.995021s|≤17.902195s|
| Generated compiler CPU |16.093183s|28.635334s|—|
| Generated compiler own Stogir IR phase |8.943953s|15.462696s|—|

Generation **3.3524×**, runtime **1.7816×**. These are single diagnostic
runs, with recorded background host activity, not acceptance-quality medians.
No whole-compiler success claim. Both generated compilers reproduce seed object
`3d9c3795e05802591d9fa229c392c2b32f8962e8286734670c73733e4df08888` byte for byte.

### Previous compiler on the same expanded current source

Previous2c45fb02 generated this source's Stogir object in10.898966s;
new candidate10.700077s. The previous compiler's generated host takes28.615969s
wall/28.413210s CPU and16.093479s in its own Stogir IR phase. New host28.995021s
wall/28.635334s CPU and15.462696s IR phase. Backend phase about3.92% better;
whole runtime about1.32% worse wall/0.78% worse CPU, not a demonstrated total gain.
The new module machinery/source must not be judged by comparison to the older,
smaller93222a58 source alone.

The baseline raw logs have prefix`native-prelude.coil`: the driver's symlink loop
shadowed its label variable. Compiler path and raw command prove the baseline
host identity; results.json records the label correction explicitly. Timing
values are unchanged. The driver variable is fixed.

## Small real-emitter control

All four variants compile the same current backend source, with one identical
opaque LLVM caller. Eight alternating runtime samples after warmup; answers and
emitted-code hashes checked by the caller. A single generation sample is only
diagnostic, especially given variation in the LLVM controls.

| CPU median | Before | After |
|---|---:|---:|
| Stogir emitter |674.267ms|659.3345ms|
| LLVM emitter |358.1165ms|357.6445ms|

Stogir runtime improves2.21%, far below the isolated pressure example21–28%.
LLVM objects are identical. This does not close the whole-compiler gap.

## Next evidence

Separate3-second startup/frontend check profiles (not included in any timings)
identify primitive-provider resolution and closure-subprogram construction among
Stogir's sampled costs. LLVM inlines differently, so per-name sample counts are
not directly comparable. Complete raw profiles are underfrontend-profile.
The next controlled fixture targets the actualprimitive-providers-in resolver
operation with caller-owned import/export tables, rather than a synthetic spill
loop. This should distinguish missed inlining/aggregate or loop optimization
from algorithmic frontend work before another backend change.

Run measure.py for the component; bootstrap.py for same-source whole compiles.
Bootstrap --resume reuses only completed rows after source/compiler/object hash
verification; optional --baseline adds a previous-driver control. No builds,
tests or profiles overlap timed runs. Detailed commands, CPU/wall/RSS, source,
SDK, compiler/object hashes and host snapshots accompany the raw records.
