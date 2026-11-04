
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/inline-switch-bench/selector/before-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_inline_switch_selector>:
       0:      	sub	sp, sp, #0x10
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	ldr	x29, [sp]
      14:      	ldr	x30, [sp, #0x8]
      18:      	add	sp, sp, #0x10
      1c:      	b	0x1c <_gap_inline_switch_selector+0x1c>
		000000000000001c:  ARM64_RELOC_BRANCH26	_gaps.inline-switch-selector.tag

0000000000000020 <_gap_inline_switch_size>:
      20:      	mov	x0, #0x68               ; =104
      24:      	ret

0000000000000028 <_gaps.inline-switch-selector.tag>:
      28:      	ldr	x0, [x0]
      2c:      	lsr	w0, w0, #0
      30:      	lsr	x16, x0, #0
      34:      	cmp	x16, #0x9
      38:      	b.hi	0x9c <_gaps.inline-switch-selector.tag+0x74>
      3c:      	adr	x17, 0x4c <_gaps.inline-switch-selector.tag+0x24>
      40:      	ldrsw	x16, [x17, x16, lsl #2]
      44:      	add	x16, x17, x16
      48:      	br	x16
      4c:      	udf	#0x28
      50:      	udf	#0x2c
      54:      	udf	#0x30
      58:      	udf	#0x34
      5c:      	udf	#0x38
      60:      	udf	#0x3c
      64:      	udf	#0x40
      68:      	udf	#0x44
      6c:      	udf	#0x48
      70:      	udf	#0x4c
      74:      	b	0xa0 <_gaps.inline-switch-selector.tag+0x78>
      78:      	b	0xa8 <_gaps.inline-switch-selector.tag+0x80>
      7c:      	b	0xb0 <_gaps.inline-switch-selector.tag+0x88>
      80:      	b	0xb8 <_gaps.inline-switch-selector.tag+0x90>
      84:      	b	0xc0 <_gaps.inline-switch-selector.tag+0x98>
      88:      	b	0xc8 <_gaps.inline-switch-selector.tag+0xa0>
      8c:      	b	0xd0 <_gaps.inline-switch-selector.tag+0xa8>
      90:      	b	0xd8 <_gaps.inline-switch-selector.tag+0xb0>
      94:      	b	0xe0 <_gaps.inline-switch-selector.tag+0xb8>
      98:      	b	0xe8 <_gaps.inline-switch-selector.tag+0xc0>
      9c:      	b	0xf0 <_gaps.inline-switch-selector.tag+0xc8>
      a0:      	movz	x0, #0x0, lsl #48
      a4:      	b	0xec <_gaps.inline-switch-selector.tag+0xc4>
      a8:      	mov	x0, #0x1                ; =1
      ac:      	b	0xec <_gaps.inline-switch-selector.tag+0xc4>
      b0:      	mov	x0, #0x2                ; =2
      b4:      	b	0xec <_gaps.inline-switch-selector.tag+0xc4>
      b8:      	mov	x0, #0x3                ; =3
      bc:      	b	0xec <_gaps.inline-switch-selector.tag+0xc4>
      c0:      	mov	x0, #0x4                ; =4
      c4:      	b	0xec <_gaps.inline-switch-selector.tag+0xc4>
      c8:      	mov	x0, #0x5                ; =5
      cc:      	b	0xec <_gaps.inline-switch-selector.tag+0xc4>
      d0:      	mov	x0, #0x6                ; =6
      d4:      	b	0xec <_gaps.inline-switch-selector.tag+0xc4>
      d8:      	mov	x0, #0x7                ; =7
      dc:      	b	0xec <_gaps.inline-switch-selector.tag+0xc4>
      e0:      	mov	x0, #0x8                ; =8
      e4:      	b	0xec <_gaps.inline-switch-selector.tag+0xc4>
      e8:      	mov	x0, #0x6                ; =6
      ec:      	ret
      f0:      	brk	#0
      f4:      	b	0xf0 <_gaps.inline-switch-selector.tag+0xc8>
