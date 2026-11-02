# Installed indexed allocation and vector doubling

Executable source 3b3e8b79, standalone library executable source 5296d0d.
Pressure discovery indexes fixed-constraint parts, initial inert allocation
records are omitted, and integer vector MUL by direct SPLAT(2) is selected as ADD
before liveness. Graph references, constraints and root/COPY contracts remain.
The shared owned image serves JIT and AOT. No backend fallback or workload
recognizer is used; all optimization stays inside the original timing boundary.

Same native-stencil workload, 200000 passes, seed 12345, O3/no debug, five measured
samples after warmup, rotated backend order:

| Backend | IR to object median ms | Whole compile median ms | Runtime median ms |
| --- | ---: | ---: | ---: |
| LLVM O3 | 26.149 | 212.757 | 355.867 |
| TPDE | 0.135 | 184.772 | 4003.891 |
| stogir O3 | 6.323 | 200.456 | 438.818 |

These remain provisional: all 17 monitor observations had external activity,
including WindowServer, macOS services and browser/agent processes. No accepted
baseline is replaced. The measured 4.14x codegen speed and 1.233x runtime miss the
active ≥5x /≤1.10x target. Exact raw samples, input/source/toolchain hashes and
load data accompany this report as stogir-tuned-o3-provisional.*.

All 235 standalone programs and 72 linked AOT consumers pass with frozen inputs
and fresh objects. Focused ASAN includes the pressure oracle (41216 queries,
2627520 compared fields), vector doubling (180 configurations /1980 native cases),
stencil, pressure, call, mixed-spill and floating cases. Allocator-only changes
preserve exact captured object bytes; vector doubling intentionally changes code.

Coil candidate build and full FAST 49/49 pass in 212.7 seconds, with cli/objects
1.70 GB warning. Stogir corpus retains the known 6/9 result. Official installation
completed: installed code sections match candidate, all 133 SDK modules match
standalone source, off-checkout LLVM/TPDE/stogir object-link-run checks pass,
and all new address/loop namespace imports succeed. Generator --check remains
current. See ../validation/stogir-tuned-pipeline-installed.json.

Disassembly confirms vector additions replace hot-loop multiplications by two.
The backedge still carries a load/store transfer pair and an extra jump. Pinned
upstream ir_ra.c has loop-aware optimal split placement and coalescing not fully
ported here. Those are architectural runtime follow-ups, rather than evidence
that changing arithmetic alone can close the remaining gap. Reusable per-register
pressure storage is being tested separately for remaining compile-time cost;
it is not in this installed compiler and no gain from it is claimed here.
