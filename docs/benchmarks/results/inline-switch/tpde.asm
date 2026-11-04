
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/inline-switch-bench/selector/tpde.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_inline_switch_selector>:
       0:      	stp	x29, x30, [sp, #-0xa0]!
       4:      	mov	x29, sp
       8:      	b	0xc <_gap_inline_switch_selector+0xc>
       c:      	ldp	x29, x30, [sp], #0xa0
      10:      	b	0x10 <_gap_inline_switch_selector+0x10>
		0000000000000010:  ARM64_RELOC_BRANCH26	_gaps.inline-switch-selector.tag

0000000000000014 <_gap_inline_switch_size>:
      14:      	mov	w0, #0x68               ; =104
      18:      	ret

000000000000001c <_gaps.inline-switch-selector.tag>:
      1c:      	stp	x29, x30, [sp, #-0x100]!
      20:      	mov	x29, sp
      24:      	ldr	q0, [x0]
      28:      	str	q0, [x29, #0xa0]
      2c:      	ldr	q0, [x0, #0x10]
      30:      	str	q0, [x29, #0xb0]
      34:      	ldr	w0, [x29, #0xa0]
      38:      	cmp	x0, #0x9
      3c:      	b.hi	0x7c <_gaps.inline-switch-selector.tag+0x60>
      40:      	adr	x1, 0x54 <_gaps.inline-switch-selector.tag+0x38>
      44:      	add	x1, x1, x0, uxtx #2
      48:      	ldrsw	x0, [x1]
      4c:      	add	x1, x1, x0
      50:      	br	x1
      54:      	udf	#0x2c
      58:      	udf	#0x34
      5c:      	udf	#0x3c
      60:      	udf	#0x44
      64:      	udf	#0x4c
      68:      	udf	#0x54
      6c:      	udf	#0x5c
      70:      	udf	#0x64
      74:      	udf	#0x6c
      78:      	udf	#0x80
      7c:      	b	0x114 <_gaps.inline-switch-selector.tag+0xf8>
      80:      	ldr	x0, [x29, #0xa8]
      84:      	mov	w2, #0x0                ; =0
      88:      	b	0x10c <_gaps.inline-switch-selector.tag+0xf0>
      8c:      	ldr	x0, [x29, #0xa8]
      90:      	mov	w2, #0x1                ; =1
      94:      	b	0x10c <_gaps.inline-switch-selector.tag+0xf0>
      98:      	ldr	x0, [x29, #0xa8]
      9c:      	mov	w2, #0x2                ; =2
      a0:      	b	0x10c <_gaps.inline-switch-selector.tag+0xf0>
      a4:      	ldr	x0, [x29, #0xa8]
      a8:      	mov	w2, #0x3                ; =3
      ac:      	b	0x10c <_gaps.inline-switch-selector.tag+0xf0>
      b0:      	ldr	x0, [x29, #0xa8]
      b4:      	mov	w2, #0x4                ; =4
      b8:      	b	0x10c <_gaps.inline-switch-selector.tag+0xf0>
      bc:      	ldr	x0, [x29, #0xa8]
      c0:      	mov	w2, #0x5                ; =5
      c4:      	b	0x10c <_gaps.inline-switch-selector.tag+0xf0>
      c8:      	ldr	x0, [x29, #0xa8]
      cc:      	mov	w2, #0x6                ; =6
      d0:      	b	0x10c <_gaps.inline-switch-selector.tag+0xf0>
      d4:      	ldr	x0, [x29, #0xa8]
      d8:      	mov	w2, #0x7                ; =7
      dc:      	b	0x10c <_gaps.inline-switch-selector.tag+0xf0>
      e0:      	ldur	q0, [x29, #0xa8]
      e4:      	str	q0, [x29, #0xc0]
      e8:      	ldr	x0, [x29, #0xb8]
      ec:      	str	x0, [x29, #0xd0]
      f0:      	mov	w2, #0x8                ; =8
      f4:      	b	0x10c <_gaps.inline-switch-selector.tag+0xf0>
      f8:      	ldur	q0, [x29, #0xa8]
      fc:      	str	q0, [x29, #0xe0]
     100:      	ldr	x0, [x29, #0xb8]
     104:      	str	x0, [x29, #0xf0]
     108:      	mov	w2, #0x6                ; =6
     10c:      	mov	x0, x2
     110:      	b	0x118 <_gaps.inline-switch-selector.tag+0xfc>
     114:      	brk	#0x1
     118:      	ldp	x29, x30, [sp], #0x100
     11c:      	ret
