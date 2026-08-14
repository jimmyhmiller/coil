ENTRY(_start)
SECTIONS {
  . = 0x80000000;
  .text : {
    KEEP(*(.text.boot))
    *(.text*)
  }
  .rodata : { *(.rodata*) }
  .data : { *(.sdata*) *(.data*) }
  PROVIDE(__global_pointer$ = . + 0x800);
  . = ALIGN(16);
  __bss_start = .;
  .bss : { *(.sbss*) *(.bss*) *(COMMON) }
  . = ALIGN(16);
  __bss_end = .;
  . = . + 0x10000;
  . = ALIGN(16);
  _stack_top = .;
}
