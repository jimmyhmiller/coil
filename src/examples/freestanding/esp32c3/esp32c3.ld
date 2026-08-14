ENTRY(_start)
MEMORY {
  irom (rx) : ORIGIN = 0x42000000, LENGTH = 4M
  drom (r)  : ORIGIN = 0x3c000000, LENGTH = 4M
  ram (rw)  : ORIGIN = 0x3fc80000, LENGTH = 320K
}

SECTIONS {
  .header : AT(0) {
    LONG(0xaedb041d)
    LONG(0xaedb041d)
  } > irom

  .text.entry ORIGIN(irom) + 8 : AT(8) {
    KEEP(*(.text.entry))
  } > irom

  .text : {
    *(.text*)
  } > irom
  __irom_end = .;
  __irom_size = ALIGN(__irom_end - ORIGIN(irom), 4);

  .rodata ORIGIN(drom) + __irom_size : AT(__irom_size) {
    *(.rodata*) *(.eh_frame*)
  } > drom
  __flash_data_end = LOADADDR(.rodata) + SIZEOF(.rodata);

  .data ORIGIN(ram) : AT(__flash_data_end) {
    __data_start = .;
    *(.sdata*) *(.data*)
    /* Keep the range non-empty. LLVM may assume two distinct external linker
       symbols have distinct addresses when it optimizes Coil's copy loop. */
    BYTE(0)
    __data_end = .;
  } > ram
  __data_lma = ORIGIN(drom) + LOADADDR(.data);

  .bss ALIGN(4) (NOLOAD) : {
    __bss_start = .;
    *(.sbss*) *(.bss*) *(COMMON)
    BYTE(0)
    __bss_end = .;
  } > ram

  PROVIDE(__global_pointer$ = __data_start + 0x800);
  __stack_top = ORIGIN(ram) + LENGTH(ram);
  ASSERT(__bss_end + 0x4000 < __stack_top, "ESP32-C3 RAM exhausted")

  /DISCARD/ : { *(.comment) *(.note*) }
}
