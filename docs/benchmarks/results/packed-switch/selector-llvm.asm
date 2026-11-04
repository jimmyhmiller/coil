
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/packed-switch-bench/selector/llvm.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <ltmp0>:
       0:      	ldr	w8, [x0]
       4:      	adrp	x9, 0x0 <ltmp0>
		0000000000000004:  ARM64_RELOC_PAGE21	l_switch.table.gap_inline_switch_selector
       8:      	add	x9, x9, #0x0
		0000000000000008:  ARM64_RELOC_PAGEOFF12	l_switch.table.gap_inline_switch_selector
       c:      	ldrb	w0, [x9, x8]
      10:      	ret

0000000000000014 <_gap_inline_switch_size>:
      14:      	mov	w0, #0x68               ; =104
      18:      	ret
