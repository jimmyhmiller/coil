
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-runtime-bulk/build/runtime-bulk/comparison/llvm.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <ltmp0>:
       0:      	movi.2d	v0, #0000000000000000
       4:      	stp	q0, q0, [x0]
       8:      	stp	q0, q0, [x0, #0x20]
       c:      	stp	q0, q0, [x0, #0x40]
      10:      	stp	q0, q0, [x0, #0x60]
      14:      	stp	q0, q0, [x0, #0x80]
      18:      	stp	q0, q0, [x0, #0xa0]
      1c:      	stp	q0, q0, [x0, #0xc0]
      20:      	stp	q0, q0, [x0, #0xe0]
      24:      	stp	q0, q0, [x0, #0x100]
      28:      	stp	q0, q0, [x0, #0x120]
      2c:      	stp	q0, q0, [x0, #0x140]
      30:      	stp	q0, q0, [x0, #0x160]
      34:      	stp	q0, q0, [x0, #0x180]
      38:      	ret

000000000000003c <_gap_graph_copy>:
      3c:      	mov	w2, #0x1a0              ; =416
      40:      	b	0x40 <_gap_graph_copy+0x4>
		0000000000000040:  ARM64_RELOC_BRANCH26	_memmove

0000000000000044 <_gap_graph_extent>:
      44:      	mov	w0, #0x1a0              ; =416
      48:      	ret

000000000000004c <_coil.hashmap.bytewise-eq>:
      4c:      	cbz	x2, 0x6c <_coil.hashmap.bytewise-eq+0x20>
      50:      	stp	x29, x30, [sp, #-0x10]!
      54:      	mov	x29, sp
      58:      	bl	0x58 <_coil.hashmap.bytewise-eq+0xc>
		0000000000000058:  ARM64_RELOC_BRANCH26	_memcmp
      5c:      	cmp	w0, #0x0
      60:      	cset	w0, eq
      64:      	ldp	x29, x30, [sp], #0x10
      68:      	ret
      6c:      	mov	w0, #0x1                ; =1
      70:      	ret

0000000000000074 <_coil.hashmap.bytewise-hash>:
      74:      	mov	x8, x0
      78:      	mov	x0, #0x2325             ; =8997
      7c:      	cmp	x1, #0x1
      80:      	movk	x0, #0x8422, lsl #16
      84:      	movk	x0, #0x9ce4, lsl #32
      88:      	movk	x0, #0xcbf2, lsl #48
      8c:      	b.lt	0xac <_coil.hashmap.bytewise-hash+0x38>
      90:      	mov	x9, #0x1b3              ; =435
      94:      	movk	x9, #0x100, lsl #32
      98:      	ldrsb	x10, [x8], #0x1
      9c:      	subs	x1, x1, #0x1
      a0:      	eor	x10, x0, x10
      a4:      	mul	x0, x10, x9
      a8:      	b.ne	0x98 <_coil.hashmap.bytewise-hash+0x24>
      ac:      	ret
