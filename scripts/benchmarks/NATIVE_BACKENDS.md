# Native backend comparison

The harness and kernels are Coil programs. On macOS arm64, from the Coil root:

```sh
coil build scripts/benchmarks/native-backends.coil --backend llvm -O3 --no-debug -o build/native-benchmark
mkdir -p build/native-comparison
build/native-benchmark --compiler "$PWD/build/bin/coil-candidate" \
  --source "$PWD/scripts/benchmarks/native-kernels.coil" \
  --output "$PWD/build/native-comparison" --iterations 50000000 --samples 7 > build/native-comparison.csv
```

Use an existing output directory dedicated to the run: the harness overwrites
`llvm`, `tpde`, `stogir` and their `.o` files there. Do not run other builds or
benchmarks concurrently. Preserve the compiler's matching SDK/stdlib and record
its `.toolchain` sidecar and checkout revision with the results.

The harness clears Coil project configuration inherited from its caller before
starting child compilers (namespace roots, manifest, package, units, prelude,
stdlib settings and metaprogram JIT override). Each source therefore uses its own
project discovery.

Each round compiles the identical source with `emit-obj -O3 --no-debug`, links it
with the system `cc -lm`, then executes it with the same iteration count and seed.
Order rotates LLVM/TPDE/stogir between rounds. Sample zero is warmup; exclude it
from summaries. The CSV contains raw monotonic wall-clock nanoseconds for each
phase, including subprocess creation, capture and reaping. Compile time includes
the frontend, lowering and code generation. Run time includes program startup;
it is not a measurement of selector-only cost or an in-process JIT.

The kernels exercise integer bit recurrences, dependent indexed memory updates,
and floating-point recurrences. Their inputs come from argv; results are printed
and compared byte-for-byte with the LLVM warmup. A failed command, timeout,
truncated capture, missing baseline or output disagreement fails the run. Preserve
only complete successful runs. Report medians and sample ranges, never a single
best run. Increase iterations if runtime is too close to process-startup cost.

The header records compiler version, executable/source SHA-256, host, flags and
inputs. This small mixed kernel is an initial comparison, not a representative
language workload suite. The experimental stogir backend still has corpus gaps,
including pinned calls, i128 and proper tail calls. Run its full corpus manually:

```sh
python3 scripts/oracle.py corpus stogir --all --compiler build/bin/coil-candidate
```

## Optimization-sensitive stencil

`native-stencil.coil` is a periodic three-point stencil over 16,384 u32 cells,
using two buffers. Passes depend on the previous pass; cells within a pass are
independent. Unsigned arithmetic wraps. A position-weighted checksum makes the
final contents observable. This isolates an ordinary loop-vectorization
opportunity that the dependent recurrences in `native-kernels.coil` lack.

Use `--source "$PWD/scripts/benchmarks/native-stencil.coil" --iterations 200000`
with the same harness. Add `--llvm-o0` to include a fourth executable compiled by
LLVM at `-O0`; the other three retain `-O3`. The harness compares all outputs
against the LLVM `-O3` warmup. LLVM `-O0` uses `llvm-o0` and `llvm-o0.o` in the
output directory. Keep this targeted optimization workload distinct from a
representative application benchmark suite.

## IR-to-machine-code timing

Add `--codegen-timings` for the performance acceptance metric. The compiler reports
high-resolution monotonic durations in nanoseconds; actual clock resolution is
platform dependent. The harness records their sum as `ir-codegen` and preserves
the individual records as CSV comments. Missing, malformed or unexpected
compiler diagnostics fail the run.

The inputs at this boundary are the constructed library graph for stogir,
finished native CIR for TPDE, and lowered LLVM IR for LLVM. IR construction,
frontend work and target-context setup are excluded. Validation performed by the
code generator, optimization, selection/allocation, code emission, module merging
and relocatable-object serialization are included. LLVM uses its memory-buffer
emitter while measuring, then writes the temporary output outside the timer;
the existing atomic rename/error handling is retained. Native output writes are
also excluded. The native backend runs serially in this mode so summing
per-function durations gives a serial backend cost, without overlapping jobs.
These are measured operations of each implementation, not identical IR formats
or identical optimizer coverage.

The separate `compile` row remains whole-command wall time. With diagnostics
and serial native generation enabled, it is not directly comparable to the old
unprofiled whole-command baseline. Runtime still uses the same source and inputs;
timing mode is unset before linking and running the executable. Caller project
settings and backend profiling/repeat flags are cleared by the harness.

The compiler's original and measured emitters produce byte-identical objects
when compared under the same serial native configuration. The CLI objects gate
checks this and executes the combined native fixture with measurement enabled.
The goal is 10× faster IR-to-machine-code generation than LLVM O3 with runtime
within 10%; whole-command compilation and baseline selection fixes alone do not
establish that goal.
