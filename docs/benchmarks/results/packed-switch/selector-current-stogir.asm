
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/packed-switch-bench/selector/current-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_inline_switch_selector>:
       0:      	ldr	x0, [x0]
       4:      	lsr	w0, w0, #0
       8:      	cmp	x0, #0x9
       c:      	b.hi	0x2c <_gap_inline_switch_selector+0x2c>
      10:      	lsl	x0, x0, #2
      14:      	mov	x16, #0x3210            ; =12816
      18:      	movk	x16, #0x7654, lsl #16
      1c:      	movk	x16, #0x68, lsl #32
      20:      	lsr	x0, x16, x0
      24:      	and	x0, x0, #0xf
      28:      	ret
      2c:      	brk	#0
      30:      	b	0x2c <_gap_inline_switch_selector+0x2c>

0000000000000034 <_gap_inline_switch_size>:
      34:      	mov	x0, #0x68               ; =104
      38:      	ret

000000000000003c <_gaps.inline-switch-selector.tag>:
      3c:      	ldr	x0, [x0]
      40:      	lsr	w0, w0, #0
      44:      	cmp	x0, #0x9
      48:      	b.hi	0x68 <_gaps.inline-switch-selector.tag+0x2c>
      4c:      	lsl	x0, x0, #2
      50:      	mov	x16, #0x3210            ; =12816
      54:      	movk	x16, #0x7654, lsl #16
      58:      	movk	x16, #0x68, lsl #32
      5c:      	lsr	x0, x16, x0
      60:      	and	x0, x0, #0xf
      64:      	ret
      68:      	brk	#0
      6c:      	b	0x68 <_gaps.inline-switch-selector.tag+0x2c>
