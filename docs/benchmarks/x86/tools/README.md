# Measurement tools for the two goals on x86-64 Linux

The workload is always "the compiler compiles itself": `src/compiler/main.coil`
of a checkout (`ROOT`) at `-O3 --no-debug`. The goals:

1. **Generation.** Stogir code generation wall time, default threads, is at
   least 5x faster than LLVM `-O3` code generation wall time (LLVM running its
   partitions in parallel).
2. **Runtime.** The Stogir-built compiler, doing the same work, takes at most
   1.10x the CPU cycles of the LLVM-`-O3`-built compiler.

These are the Linux counterparts of `docs/benchmarks/branch-fusion/tools`
(`mkhost.sh`, `ab.py`, `genab.py`), `docs/benchmarks/inline-policy/tools`
(`mkhost-env.sh`) and `docs/benchmarks/private-call-module/bootstrap.py`. The
macOS mechanics (`/usr/bin/time -l`, Mach-O link flags, the `arm64-macos` curl
archives) are replaced by GNU `time -v`, `perf stat`, and the ELF link line.
Every script takes the checkout and the compilers as arguments and the backend
names as parameters. Until `--backend stogir` works on x86-64 the two sides are
`llvm` and `tpde`.

Every run clears inherited `COIL_*` variables and sets `COIL_LIBRARY_STATE=0`.
Nothing is written into `ROOT`.

## The scripts

- `mkhost-linux.sh ROOT COMPILER BACKEND OUTDIR [NAME=VALUE ...]`: COMPILER
  emits ROOT's compiler with BACKEND (`emit-obj`, default threads) and the object
  is linked into a working compiler `OUTDIR/bin/coil`. Prints generation wall
  time (from `--timings`), serial generation (a second emit under
  `COIL_TPDE_SERIAL=1 COIL_CODEGEN_TIMINGS=1`; `MKHOST_SERIAL=0` skips it), and
  the object's sha256. `NAME=VALUE` settings go into the emits' environment.
- `link-host-linux.sh ROOT OBJECT OUTDIR`: the link itself, used by
  `mkhost-linux.sh` and `bootstrap-linux.py`. The one place that holds the link
  line. It then checks that the host runs `--version` and builds a hello world
  that prints what it should.
- `genwall-linux.py ROOT ROUNDS name=COMPILER:BACKEND ...`: the generation goal.
  Candidates alternate. Each round does a default-thread `build` (generation
  wall, whole-build wall, peak RSS, executable sha256) and a serial `emit-obj`
  (serial generation CPU, object sha256). Prints minimum and median, ratios
  against the first candidate, and whether outputs repeat exactly.
- `runtime-ab-linux.py ROOT ROUNDS OUTDIR name=HOSTCOMPILER ...`: the runtime
  goal. Hosts alternate, each emitting ROOT's compiler with one fixed backend
  (`--emit-args`, default `--backend tpde -O3 --no-debug`) under
  `COIL_TPDE_SERIAL=1`. Cycles and instructions from `perf stat`, user+system CPU
  and peak RSS from GNU time, wall. Fails unless every host writes the identical
  object.
- `bootstrap-linux.py --root ROOT --compiler C --output DIR [--native-backend
  stogir|tpde]`: the port of `bootstrap.py`. One serial emit per row, hosts
  linked from the native and the LLVM object, each host re-emits natively and
  must reproduce the seed object. A diagnostic of the whole loop, not
  acceptance: single runs.
- `benchlib.py`: shared mechanics, and the definitions of the two generation
  times (read `generation_wall` and `serial_generation`).

## Commands

On `computer.jimmyhmiller.com`, with the tools in `~/stogir-x86/bench/tools` and
the checkout in `~/stogir-x86/coil`:

    cd ~/stogir-x86
    T=bench/tools; R=coil; C=coil/build/x86/coil-llvm; O=bench/out/run1

    # Generation goal: 5 alternating rounds, LLVM first (ratios are against it).
    $T/genwall-linux.py --out $O/genwall $R 5 llvm=$C:llvm tpde=$C:tpde

    # Runtime goal: one host per backend from the same source, then A/B.
    $T/mkhost-linux.sh $R $C llvm $O/hosts/llvm
    $T/mkhost-linux.sh $R $C tpde $O/hosts/tpde
    $T/runtime-ab-linux.py $R 5 $O/ab \
        llvm=$O/hosts/llvm/bin/coil tpde=$O/hosts/tpde/bin/coil

    # The whole loop once.
    $T/bootstrap-linux.py --root $R --compiler $C --output $O/bootstrap \
        --native-backend tpde --unstamped-compiler

When Stogir emits x86-64, replace `tpde` with `stogir` in the candidate, in
`mkhost-linux.sh`, and in the work: `--emit-args '--backend stogir -O3
--no-debug'`. To compare two Stogir candidates' generators, build one host per
candidate from the same source and A/B the hosts, as on macOS.

## How the numbers map to the goals

**Goal 1** is `generation wall s` in `genwall-linux.py`: the line for the native
candidate ends with "llvm is N.NNx this"; the goal is N >= 5 (minimum and
median are both printed).

- LLVM generation wall = `backend.llvm-lower` + `backend.parallel.workers` from
  `--timings` of a `build`. Native generation wall = `backend.tpde-object`.
- It has to be `build`. `emit-obj --backend llvm` never partitions: it optimizes
  one module on one thread (about 66 s here against about 9.5 s with the eight
  partitions of `build`). `genwall-linux.py --emit-only` measures that instead
  and prints a note that LLVM was not parallel.
- The LLVM spans include the metaprograms the front end JIT-compiles through
  LLVM while expanding and checking (17 small modules, about 0.1 s), in every
  build whatever its backend. The timing table does not separate them.
- `serial generation s` is CPU time of code generation proper, the sum of the
  backend's `coil-codegen` records with code generation forced onto one thread.
  For a native backend it covers instruction selection and encoding per function
  and not the lowering to CIR that `backend.tpde-object` also spans, so it is
  smaller than the wall figure. For LLVM it is the single-module pipeline
  (verify, optimize, emit), which is not the sum of what the eight partition
  workers do; the summed worker spans are `backend.parallel.worker.optimize` +
  `backend.parallel.worker.emit` in the build logs.

**Goal 2** is `cycles B (user+kernel)` in `runtime-ab-linux.py`: the line for
the native-built host ends with "vs llvm: min xN.NNNN median xN.NNNN"; the goal
is N <= 1.10.

- The LLVM host from `mkhost-linux.sh` is linked from the `emit-obj` object, so
  it is the single-module `-O3` compiler, as `bootstrap.py` builds its LLVM host
  on macOS. The compiler a normal `build` produces is eight partitions and is
  different code; pass it as a third host (`build=coil/build/x86/coil-llvm`) to
  see both.
- The work must be identical, which the script enforces through the object
  hash. A change to the backend that does the work changes the work, so compare
  hosts on one fixed emitting backend and settings.

## The link

`coil build` on Linux links with (captured by pointing `COIL_CC` at a wrapper
that logs its arguments; the code is `append-bundled-curl!` and the final link
in `src/compiler/driver.coil`):

    cc OBJ -o OUT -Wl,--gc-sections \
       -L$LIBDIR -Wl,-rpath,$LIBDIR -lLLVM -lm \
       $A/libcurl.a $A/libmbedtls.a $A/libmbedx509.a $A/libmbedcrypto.a \
       -lz -lpthread -Wl,--gc-sections -lm

with `LIBDIR=$(llvm-config-21 --libdir)`, `A=ROOT/build/bin/native/curl/x86_64-linux`
and the second line being the `--link-flag` values the build was given.
`link-host-linux.sh` runs exactly this. `scripts/compiler/llvm-link-flags.sh
dynamic` adds `-lstdc++ -lpthread -ldl -Wl,--export-dynamic`, which
`--unit` needs and these measurements do not; the host's own compiler
(`build/x86/coil-llvm`) was built without them.

A host finds its library by walking up from its own path, so `OUTDIR` gets
`lib/coil/{stdlib,compiler,prelude.coil}` and `bin/native` as symlinks into
ROOT, and `bin/coil.toolchain` is ROOT's stamp.

## Caveats

- **Load.** Other people run tests on the host. Candidates alternate within
  each round and the order reverses every round; every line prints the 1-minute
  load. Use minimum and median of at least five rounds, and repeat when the load
  was above about 4 during a run (LLVM's eight workers then compete for cores
  and its wall time grows, which flatters the native side of goal 1).
- **perf.** `/proc/sys/kernel/perf_event_paranoid` is 0 on the host, so
  unprivileged `perf stat -e cycles,instructions` works, user and kernel. If it
  stops working `runtime-ab-linux.py` prints a banner and compares CPU time,
  which does not settle goal 2. Counts cover the compiler and its children. The
  scripts warn if perf had to multiplex counters (someone else profiling).
- **Frequency.** The governor is `powersave` under `amd-pstate-epp` with
  `balance_performance`, and boost (turbo) is on: clock speed depends on load
  and temperature, so wall and CPU seconds move by several percent between
  rounds. Cycles do not depend on clock speed, which is why goal 2 is in cycles.
  Changing the governor needs root and was not done.
- **SMT.** On (16 cores, 32 threads; cpu N and N+16 are siblings). A busy
  sibling slows a run and raises its cycle count. The minimum over rounds is the
  figure least affected.
- **Pinning.** Not done by default. `runtime-ab-linux.py --cpu N` pins each run
  with `taskset`. Measured with the baseline: pinning to one CPU did not narrow
  the spread of cycles (see `../baseline.md`), and a fixed CPU can be the one
  somebody else's job lands on, so the scheduler is left to pick an idle core.
- **Instructions are not the goal.** They repeat far better than cycles and are
  printed for diagnosis, but two hosts with equal instruction counts can differ
  in cycles.
- `bootstrap-linux.py` refuses a compiler with no `.toolchain` stamp unless
  `--unstamped-compiler` is given; `build/x86/coil-llvm` on the host has none.
