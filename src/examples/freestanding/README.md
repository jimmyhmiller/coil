# Freestanding: Coil on bare metal

These programs run with no OS, no libc and no crt0 from a toolchain. The aarch64
ones boot under `qemu-system-aarch64 -M virt`, print over the PL011 UART and
power off through PSCI; `riscv32/` boots under `qemu-system-riscv32 -M virt`, and
`esp32c3/` is a direct-boot ESP32-C3 image (see `docs/reference/ESP32_C3.md`).

```
python3 scripts/dev.py example freestanding              # hello.coil
python3 scripts/dev.py example freestanding uart         # typed-register PL011 driver
python3 scripts/dev.py example freestanding arena        # the stdlib arena, bare metal
python3 scripts/dev.py example freestanding fail         # a failure reported over the UART
python3 scripts/dev.py example freestanding build_time   # text a macro read from a file while building
python3 scripts/dev.py example freestanding-riscv32
python3 scripts/dev.py example esp32c3 --build-only
```

`python3 scripts/tests/freestanding.py` builds all of them, links each with
`ld.lld --gc-sections`, requires zero undefined symbols, and boots the aarch64 and
riscv32 images. It is the `freestanding` step of COMPREHENSIVE and needs
`brew install lld qemu`.

## The contract

A program built for a `*-none` target links against nothing but what it brings
itself. What the toolchain guarantees:

- **Unused code is droppable.** On every ELF target each function and global is
  emitted in a section group of its own, with its jump tables, so
  `--gc-sections` keeps exactly what the program reaches. Every program imports
  `coil.core`, and through it `coil.fmt`, `coil.io` and `coil.os`; none of that
  survives the link unless it is used.
- **No invented library calls.** On `*-none` the compiler marks every function
  `no-builtins`, as clang's `-ffreestanding` does, so the optimizer does not turn
  a byte loop into `strlen` or a `printf` into `puts`.
- **Failures need no OS.** Out of memory, a full fixed-capacity container, a
  failed `--debug-checks` or `coil.safety` check, `panic` and `assert` would
  write to stderr and abort. On `*-none` they call the handler installed with
  `coil.fail/set-handler!` and then trap (`brk`, `unimp`). `fail.coil` installs
  one that prints `fatal: out of memory at box!`; without a handler the program
  stops at the trap instruction. `--debug-runtime` and `--sanitize=undefined`
  checks trap the same way.
- **Compile-time code runs on the build machine.** Macros, `(meta …)` generators
  and transforms run while the image is built, with the build machine's OS, so
  they can use `coil.fs` and friends; what only they use is never compiled for
  the target (see "Code that runs inside the compiler" in
  `docs/reference/METAPROGRAMS.md`). A module the image itself uses at run time
  that needs an OS is refused, with the use that brought it in.
- **No unaligned accesses on aarch64.** A `*-none` aarch64 object is built with
  `+strict-align`: the programs run with the MMU off, where all memory is Device
  memory and any unaligned access faults.

What the program still supplies, as in freestanding C: LLVM lowers large copies
and zeroing to `memcpy`, `memmove`, `memset` and `memcmp`, and on targets without
the hardware to `compiler-rt` helpers (`__divdi3`, soft-float such as `__adddf3`
on rv32imc). A program that needs them links compiler-rt or provides them.

## How an image is built

The compiler has no freestanding mode. It emits an object for a target, and the
recipe in `scripts/dev.py` does the rest:

1. `coil emit-obj prog.coil --target aarch64-unknown-none -o prog.o`
2. `clang -target aarch64-unknown-none -c start.s` — the boot stub: set the stack
   pointer, enable FP/SIMD (the optimizer uses SIMD for struct initialization),
   zero `.bss`, then call `coil_start`.
3. `ld.lld --gc-sections -T virt.ld boot.o prog.o -o prog.elf`
4. `qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -kernel prog.elf`

Each program exports its entry with `(export-c [start :as "coil_start"])`. The
export is also what gives the compiler a root: without one it cannot tell what
the program reaches.

## The programs

- `hello.coil` brings its own arena and `Writer`: an `alloc-static` buffer in
  `.bss` and a `{write-fn, ctx}` value over the UART.
- `uart.coil` drives the PL011 properly, polling the flag register's TXFF bit,
  with the registers declared as typed bitfields by `coil.mmio`'s `defmmio-reg`
  macro. The library is a macro over `llvm-ir` volatile loads and stores.
- `arena.coil` imports `coil.alloc` and allocates with `box!` from
  `arena-over-buffer`, the stdlib arena over a caller-provided static buffer.
- `fail.coil` installs a `coil.fail` handler and exhausts a 64-byte arena.
- `build_time.coil` prints `build_time.txt`, which its `baked-text` macro read
  with `coil.fs` while the image was compiled.
