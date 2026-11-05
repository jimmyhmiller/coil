
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-runtime-bulk/build/runtime-bulk/comparison/candidate.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_graph_clear>:
       0:      	sub	sp, sp, #0x1c0
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	str	x19, [sp, #0x1b0]
      14:      	orr	x19, x0, xzr
      18:      	add	x0, sp, #0x10
      1c:      	movz	x1, #0x0, lsl #48
      20:      	mov	x2, #0x1a0              ; =416
      24:      	bl	0x24 <_gap_graph_clear+0x24>
		0000000000000024:  ARM64_RELOC_BRANCH26	_memset
      28:      	mov	x0, x19
      2c:      	add	x1, sp, #0x10
      30:      	mov	x2, #0x1a0              ; =416
      34:      	bl	0x34 <_gap_graph_clear+0x34>
		0000000000000034:  ARM64_RELOC_BRANCH26	_memmove
      38:      	ldr	x19, [sp, #0x1b0]
      3c:      	ldr	x29, [sp]
      40:      	ldr	x30, [sp, #0x8]
      44:      	add	sp, sp, #0x1c0
      48:      	ret

000000000000004c <_gap_graph_copy>:
      4c:      	sub	sp, sp, #0x1c0
      50:      	str	x29, [sp]
      54:      	str	x30, [sp, #0x8]
      58:      	mov	x29, sp
      5c:      	str	x19, [sp, #0x1b0]
      60:      	orr	x19, x0, xzr
      64:      	add	x0, sp, #0x10
      68:      	mov	x2, #0x1a0              ; =416
      6c:      	bl	0x6c <_gap_graph_copy+0x20>
		000000000000006c:  ARM64_RELOC_BRANCH26	_memmove
      70:      	mov	x0, x19
      74:      	add	x1, sp, #0x10
      78:      	mov	x2, #0x1a0              ; =416
      7c:      	bl	0x7c <_gap_graph_copy+0x30>
		000000000000007c:  ARM64_RELOC_BRANCH26	_memmove
      80:      	ldr	x19, [sp, #0x1b0]
      84:      	ldr	x29, [sp]
      88:      	ldr	x30, [sp, #0x8]
      8c:      	add	sp, sp, #0x1c0
      90:      	ret

0000000000000094 <_gap_graph_extent>:
      94:      	mov	x0, #0x1a0              ; =416
      98:      	ret
