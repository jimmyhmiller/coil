
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-snapshot-copy-fusion/build/snapshot-copy/comparison/candidate.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_graph_clear>:
       0:      	sub	sp, sp, #0x10
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	movz	x1, #0x0, lsl #48
      14:      	mov	x2, #0x1a0              ; =416
      18:      	ldr	x29, [sp]
      1c:      	ldr	x30, [sp, #0x8]
      20:      	add	sp, sp, #0x10
      24:      	b	0x24 <_gap_graph_clear+0x24>
		0000000000000024:  ARM64_RELOC_BRANCH26	_memset

0000000000000028 <_gap_graph_copy>:
      28:      	sub	sp, sp, #0x10
      2c:      	str	x29, [sp]
      30:      	str	x30, [sp, #0x8]
      34:      	mov	x29, sp
      38:      	mov	x2, #0x1a0              ; =416
      3c:      	ldr	x29, [sp]
      40:      	ldr	x30, [sp, #0x8]
      44:      	add	sp, sp, #0x10
      48:      	b	0x48 <_gap_graph_copy+0x20>
		0000000000000048:  ARM64_RELOC_BRANCH26	_memmove

000000000000004c <_gap_graph_extent>:
      4c:      	mov	x0, #0x1a0              ; =416
      50:      	ret
