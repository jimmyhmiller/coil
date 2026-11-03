# Full Coil compiler: LLVM O3 versus stogir O3

The backend can now compile and bootstrap the full compiler, but the stencil's
performance result does **not** generalize to this workload. Stogir is slower to
build the compiler, and the compiler it produces is substantially slower to run.

## Source and support gap

Source **0dcc4101**; full entry **src/compiler/main.coil**, including LLVM and native
backends, JIT support and the compiler implementation. No smaller compiler or
feature-disabled entry point is substituted. Both targets use **-O3 --no-debug**
and the same library source, native archives and dynamic LLVM link configuration.
The fixed measurement driver is an LLVM-built compiler from the same source.

The initial f9f0b602 attempt failed on i128 CIR registers; its 49.308 seconds is
not a successful compilation timing. Commit 0dcc4101 adds scalar low/high graph
legalization and width-preserving bit operations. Graph optimization, selection
and allocation remain stogir's. Runtime division/remainder helpers are ordinary
compiler-rt C ABI calls, not another selector. No compiler implementation is
removed to make the build work.

## Normal compile and link

Three rotated, warm samples per backend, using ordinary `coil build` without
profiling. All development builds/tests were kept serial with the benchmark.

| Target backend | Full compile+link median | Range | Linked binary |
| --- | ---: | ---: | ---: |
| LLVM O3 | 11.319s | 11.196–11.349s | 6,615,480 bytes (6.31MiB) |
| stogir O3 | 39.799s | 39.795–39.841s | 15,082,840 bytes (14.38MiB) |

Stogir takes **3.516x as long** and produces a **2.280x larger binary**.
Peak RSS is about 3.5GB for both. Normal build observations had OS/UI activity
throughout (75 observations), but no external Node workers; timing ranges above
are preserved. This is the normal scheduling policy of each backend, not an
assertion of equal worker counts.

`build-cmd` explicitly enables parallel LLVM partitions for an ordinary host
link (`driver.coil:parallel-codegen?`, `main.coil:lower-partitions`). `emit-obj`
retains the one-object API. The stogir function-generation path is serial.
Parallel LLVM optimization/emission is a real advantage in the normal build.
It must not be mixed with the separate single-object timing below.

## Serial IR-to-object diagnostics

`COIL_CODEGEN_TIMINGS=1 coil emit-obj src/compiler/main.coil --backend BACKEND -O3
--no-debug -o OUT.o`. Same fixed driver and source. Two series, six measured
samples per backend total; the initial warmup is excluded. All same-backend
objects are byte-identical across samples.

| Backend | Whole emit-object command median | IR→object median | IR→object range |
| --- | ---: | ---: | ---: |
| LLVM O3 | 41.158s | 33.946s | 31.765–35.062s |
| stogir O3 | 45.043s | 36.531s | 32.278–38.613s |

**These are loaded diagnostic timings.** External Node jobs occurred in both
series, including the attempted confirmation. Their load observations and all
raw samples are retained. Do not turn the close difference into a confident
precise-speed claim or select only a favorable sample. No evidence of the requested 10x
codegen speedup appears here. The ordinary linked-build measurements above are
the stronger end-to-end comparison.

The boundary excludes IR construction in each implementation and includes its
optimization, validation, selection/allocation, emission and object serialization.
It is the same previously agreed boundary, with different input IR formats.
Stogir produces 17,936 timing records, LLVM 2, with no other-backend records. The
native sum includes per-function work and module serialization; record count is
not a count of distinct semantic source functions. Object sizes are 8,245,800
bytes LLVM and 15,786,748 bytes stogir.

## Running the resulting compilers

Each built compiler emits the full compiler source to a single object with the
same target backend, O3/no debug and timing mode. These are **single correctness
runs**, not repeated runtime medians. The LLVM-built reference is the official
candidate (default O3), and the stogir-built compiler is the linked full build.
Its code section is identical to the normal stogir build's code section. The
candidate and dedicated LLVM build have slightly different code layout/size
(2,292 text bytes), so these are explicitly named reference-driver runs.

| Task executed by the compiler | LLVM-built driver | stogir-built driver | Ratio |
| --- | ---: | ---: | ---: |
| Emit full compiler with LLVM O3 | 40.937s | 81.861s | 2.000x |
| Emit full compiler with stogir O3 | 38.361s | 611.530s | 15.941x |

Both paths produce **byte-identical target objects across host compilers**:

- LLVM object SHA256: ccaeabe72b6cc06604a35314a7beace5f13f41bd927e06d19a5642f812369443.
- stogir object SHA256: cf6e6ab6b908d7cb1ba315e9e52acda3bde1dd166b691081cff9c6957ee64d9f.

The stogir self-rebuild codegen sum is 562.533s versus 31.487s under the LLVM-built
driver. A three-second sample was taken during that exploratory correctness run;
it is not treated as a clean benchmark. It finds allocation pressure/checking,
interval operations and tiny slice/collection helpers hot. This establishes
self-bootstrap correctness for this source; it does not establish full language
coverage or LLVM-competitive compiler runtime.

## What the machine code does differently

Disassembly below uses the **matched normal-build binaries**, not an unrelated
standalone kernel. Complete function assembly accompanies this report.

| Function | LLVM instructions /calls | stogir instructions /calls |
| --- | ---: | ---: |
| stogir.locations.lookup | 86 /0 | 309 /5 |
| stogir.uses.build | 257 /4 | 777 /24 |
| coil.compiler.parser.i64->str | 56 /3 | 160 /4 |

For `locations.lookup`, stogir calls Len, ArrayList.at, interval.covers?, of-part
and string inequality helpers. LLVM has inlined the work and has no calls in
that function. Stogir also retains many stack allocations, initialization and
aggregate copies. `uses.build` starts with a 0x330-byte fixed frame versus LLVM's
0x150 bytes, before stogir's further stack allocations. These are static counts,
not measured dynamic instruction counts or a complete attribution of slowdown.

The shared native CIR producer only inlines explicitly Always scalar-leaf cases
(`codegen_tpde.coil:tl-leaf-inline?`). LLVM additionally performs general inlining
and simplification. Proper inlining, aggregate/memory optimization and allocator
costs on large functions need attention; changing source attributes just for this
benchmark or skipping validation would not close the backend gap properly.

Local executables remain in build/bin/coil-normal-llvm-s3 and
build/bin/coil-normal-stogir-s3. Both include the LLVM implementation/dylib because
the requested workload is the **full compiler**. Linking that dylib does not mean
LLVM selected any stogir-target function.

## Validation and delivery

- Focused numeric/ABI sections pass LLVM, TPDE and stogir with identical output.
  New no-output corpus checks cover narrow zero/sign bit counts, odd-width
  rotations, odd GPR prefixes and 128-bit register/stack boundaries.
- Cross-backend C ABI calls pass in both directions: LLVM caller/stogir callee
  and stogir caller/LLVM callee, including odd prefixes and stack arguments.
- Full self-rebuild object equality passes for **both target backends**.
- Version/help, native check and compile/run smoke pass on the stogir-built compiler.
- Full FAST passes 49/49 in 220.3s (cli/objects memory warning 1.60GB versus 1.5GB).
- Official global install of the LLVM-built driver with the updated stogir
  backend passes code-section equality, all 133 SDK module comparisons and
  off-checkout LLVM/TPDE/stogir AOT/import checks.

The full numeric corpus still stops at the separately reported FSQRT adapter
gap. Pinned-shim calls, proper tail calls and independent-library FP MIN/MAX
semantics remain documented issues. This feature checkpoint does not claim they
are fixed. The previous integer stencil result remains a separate workload.

Data and commands are in [compiler-backends/](compiler-backends/), including all
samples, hashes, load observations, self-checks and selected assembly. No Python
implementation or C wrapper is shipped; temporary orchestration drove the actual
Coil compilers and Coil workload.
