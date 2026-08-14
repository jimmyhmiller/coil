# ESP32-C3 bring-up

Coil can emit a freestanding RV32IMC/ILP32 object, link an ESP32-C3 direct-boot
flash image, and execute it on Espressif's ESP32-C3 QEMU machine. The firmware
entry and C-runtime initialization are written in Coil—there is no assembly
source, ESP-IDF, libc, or compiler-rt in the image.

```sh
python3 scripts/dev.py example esp32c3 --compiler build/bin/coil
```

Use Espressif's QEMU build; the ordinary upstream/Homebrew QEMU does not include
the `esp32c3` machine. Install the pinned, checksum-verified Espressif build with:

```sh
scripts/install-esp32c3-qemu.sh
```

The example command finds that local installation automatically. A successful
run includes:

```text
ESP-ROM:esp32c3-api1-20210207
rst:0x1 (POWERON),boot:0x8 (SPI_FAST_FLASH_BOOT)
coil esp32-c3: ok
```

Pass `--build-only` to produce these artifacts without starting QEMU:

- `build/examples/esp32c3/firmware.o` — ELF32 RISC-V object emitted by Coil
- `build/examples/esp32c3/firmware.elf` — linked image with entry `0x42000008`
- `build/examples/esp32c3/flash.bin` — 4 MiB direct-boot SPI flash image

## What is implemented

- LLVM target initialization for `riscv32-unknown-none-elf`, CPU
  `generic-rv32`, features `+m,+c`, static relocation, and ILP32 aggregate ABI
  classification.
- RV32 pointer-sized layouts and per-function sections for dead-code removal.
- A real `:lower reset` calling-convention lowering. It publishes `_start` in
  `.text.entry` and guarantees the final transfer out of reset code is a tail
  transfer.
- Typed linker-symbol addresses and writes to the RISC-V `sp` and `gp` registers.
- Coil startup loops that copy `.data` from flash and clear `.bss` in SRAM.
- Typed volatile load/store and sequentially-consistent fence operations; the
  MMIO register macro no longer embeds LLVM IR.
- Directly encoded RV32 helpers for named CSR reads/writes, `wfi`, and `mret`.
  These are machine words emitted by Coil's code generator, not inline assembly.
- UART output through the ESP32-C3 UART0 FIFO/status MMIO registers. The boot
  proof no longer calls an ESP ROM output routine.
- A direct-boot linker layout for IROM, DROM, SRAM, global pointer, and stack.
- A deterministic emulator assertion that fails unless Coil reaches its UART
  success sentinel.

The boot ROM establishes the direct-boot environment and initially configures
UART0. Coil then performs runtime initialization and all visible output itself.
It does not rely on ESP-IDF startup or libraries.

## Deliberate next layers

Replacing ESP-IDF is a platform project above this compiler slice. Coil still
needs safe interrupt-entry preservation and vector placement,
clock/reset/GPIO/timer drivers, SPI flash and
partition support, and eventually radio firmware/driver work. Those should be
typed Coil operations backed by LLVM or a Coil-native RISC-V encoder; firmware
authors should not need inline assembly.

The generic `freestanding-riscv32` QEMU `virt` example remains a fast backend
oracle. The `esp32c3` example covers the actual ROM boot contract and memory map.
