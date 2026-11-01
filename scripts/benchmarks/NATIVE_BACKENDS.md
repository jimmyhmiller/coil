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
