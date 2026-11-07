# Profiling tools for generated compiler hosts

No root or Instruments is needed. `xctrace` cannot attach headlessly here, so
these use `DYLD_INSERT_LIBRARIES` against the locally linked hosts.

Build: `cc -O2 -dynamiclib -o pcprof.dylib pcprof.c` and the same for `memprof.c`.

- **pcprof** samples PC and LR at 2 kHz of process CPU time (`ITIMER_PROF`).
  It writes `$PCPROF_OUT.<pid>`: image slides, then one line per sample with
  the PC, its library and symbol (`dladdr`), then the LR and its symbol. The LR
  attributes leaf library time (for example `_platform_memmove`) to callers.
  Timer skid lands on stalled instructions, so time per instruction is not an
  instruction count.
- **memprof** interposes `memmove`/`memcpy`/`memset`/`bzero`. It writes
  `$MEMPROF_OUT.<pid>` with one line per call site: kind, calls, bytes, return
  address and symbol. Comparing hosts by caller name has to allow for LLVM's
  inlining: a callee's copies show under its caller.
- `selfprof.py SAMPLE_A SAMPLE_B N` compares `/usr/bin/sample` call trees by
  exclusive samples. `mix.py DIS_A DIS_B` compares static instruction mixes of
  two `llvm-objdump -d` listings. `roles.py HOSTDIS PCFILE` classifies PC samples
  by instruction role.

Example, run from the Coil root with frozen hosts:

    DYLD_INSERT_LIBRARIES=$PWD/memprof.dylib MEMPROF_OUT=/path/mem-stogir \
      COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 build/bootstrap-5/host-stogir/bin/coil \
      emit-obj src/compiler/main.coil --backend stogir -O3 --no-debug -o out.o

Also read `/usr/bin/time -l`'s "instructions retired" and "cycles elapsed" in
each bootstrap row's stderr. They gave the key fact at this checkpoint: the
Stogir host retires 1.9x the instructions at a higher IPC.
