
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/packed-switch-bench/verifier/tpde.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_verify_graph>:
       0:      	sub	sp, sp, #0x270
       4:      	stp	x29, x30, [sp]
       8:      	mov	x29, sp
       c:      	stp	x19, x20, [sp, #0x10]
      10:      	mov	x19, x0
      14:      	add	x8, x29, #0xa0
      18:      	mov	x0, x19
      1c:      	mov	w1, #0x8                ; =8
      20:      	bl	0x20 <_gap_verify_graph+0x20>
		0000000000000020:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target
      24:      	ldr	w0, [x29, #0xa0]
      28:      	cmp	x0, #0x0
      2c:      	b.eq	0x50 <_gap_verify_graph+0x50>
      30:      	cmp	x0, #0x1
      34:      	b.eq	0x40 <_gap_verify_graph+0x40>
      38:      	b	0x3c <_gap_verify_graph+0x3c>
      3c:      	b	0x78 <_gap_verify_graph+0x78>
      40:      	ldur	q0, [x29, #0xa8]
      44:      	str	q0, [x29, #0xc0]
      48:      	mov	x20, #-0x1              ; =-1
      4c:      	b	0x70 <_gap_verify_graph+0x70>
      50:      	ldrsw	x0, [x29, #0xa8]
      54:      	add	x0, x29, #0xd0
      58:      	mov	x1, x19
      5c:      	mov	w2, #0x1a0              ; =416
      60:      	bl	0x60 <_gap_verify_graph+0x60>
		0000000000000060:  ARM64_RELOC_BRANCH26	_memcpy
      64:      	add	x0, x29, #0xd0
      68:      	bl	0x68 <_gap_verify_graph+0x68>
		0000000000000068:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
      6c:      	mov	x20, x0
      70:      	mov	x0, x20
      74:      	b	0x7c <_gap_verify_graph+0x7c>
      78:      	brk	#0x1
      7c:      	ldp	x19, x20, [sp, #0x10]
      80:      	ldp	x29, x30, [sp]
      84:      	add	sp, sp, #0x270
      88:      	ret

000000000000008c <_stogir.verify.integer-operations-target>:
      8c:      	stp	x29, x30, [sp, #-0x110]!
      90:      	mov	x29, sp
      94:      	stp	x19, x20, [sp, #0x10]
      98:      	stp	x21, x22, [sp, #0x20]
      9c:      	mov	x19, x8
      a0:      	mov	x20, x0
      a4:      	sxtw	x21, w1
      a8:      	add	x8, x29, #0xa0
      ac:      	mov	x0, x20
      b0:      	bl	0xb0 <_stogir.verify.integer-operations-target+0x24>
		00000000000000b0:  ARM64_RELOC_BRANCH26	_stogir.verify.structure
      b4:      	ldr	w0, [x29, #0xa0]
      b8:      	cmp	x0, #0x0
      bc:      	b.eq	0xf0 <_stogir.verify.integer-operations-target+0x64>
      c0:      	cmp	x0, #0x1
      c4:      	b.eq	0xd0 <_stogir.verify.integer-operations-target+0x44>
      c8:      	b	0xcc <_stogir.verify.integer-operations-target+0x40>
      cc:      	b	0x11c <_stogir.verify.integer-operations-target+0x90>
      d0:      	ldur	q0, [x29, #0xa8]
      d4:      	str	q0, [x29, #0xc0]
      d8:      	mov	w0, #0x1                ; =1
      dc:      	str	w0, [x29, #0xd0]
      e0:      	ldr	q0, [x29, #0xc0]
      e4:      	stur	q0, [x29, #0xd8]
      e8:      	add	x22, x29, #0xd0
      ec:      	b	0x108 <_stogir.verify.integer-operations-target+0x7c>
      f0:      	ldrsw	x0, [x29, #0xa8]
      f4:      	add	x8, x29, #0xf0
      f8:      	mov	x0, x20
      fc:      	mov	x1, x21
     100:      	bl	0x100 <_stogir.verify.integer-operations-target+0x74>
		0000000000000100:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target-structured
     104:      	add	x22, x29, #0xf0
     108:      	ldr	q0, [x22]
     10c:      	str	q0, [x19]
     110:      	ldr	x0, [x22, #0x10]
     114:      	str	x0, [x19, #0x10]
     118:      	b	0x120 <_stogir.verify.integer-operations-target+0x94>
     11c:      	brk	#0x1
     120:      	ldp	x19, x20, [sp, #0x10]
     124:      	ldp	x21, x22, [sp, #0x20]
     128:      	ldp	x29, x30, [sp], #0x110
     12c:      	ret

0000000000000130 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node>:
     130:      	ldr	x0, [x0, #0x8]
     134:      	ret

0000000000000138 <_stogir.verify.structure>:
     138:      	sub	sp, sp, #0x350
     13c:      	stp	x29, x30, [sp]
     140:      	mov	x29, sp
     144:      	stp	x19, x20, [sp, #0x10]
     148:      	stp	x21, x22, [sp, #0x20]
     14c:      	str	x23, [sp, #0x30]
     150:      	adrp	x1, 0x0 <_gap_verify_graph>
		0000000000000150:  ARM64_RELOC_PAGE21	l_cstr.51
     154:      	add	x1, x1, #0x0
		0000000000000154:  ARM64_RELOC_PAGEOFF12	l_cstr.51
     158:      	str	x1, [x29, #0xb0]
     15c:      	str	xzr, [x29, #0xb8]
     160:      	ldr	q0, [x29, #0xb0]
     164:      	str	q0, [x29, #0xa0]
     168:      	mov	x9, x0
     16c:      	str	x8, [x29, #0x148]
     170:      	str	x9, [x29, #0x2e0]
     174:      	bl	0x174 <_stogir.verify.structure+0x3c>
		0000000000000174:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
     178:      	str	x0, [x29, #0xc0]
     17c:      	ldr	x0, [x29, #0x2e0]
     180:      	add	x1, x0, #0x78
     184:      	mov	x9, x0
     188:      	mov	x0, x1
     18c:      	bl	0x18c <_stogir.verify.structure+0x54>
		000000000000018c:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__i32
     190:      	str	x0, [x29, #0xc8]
     194:      	ldr	x0, [x29, #0xc0]
     198:      	ldr	x1, [x29, #0xc8]
     19c:      	cmp	x0, x1
     1a0:      	b.ne	0x1b0 <_stogir.verify.structure+0x78>
     1a4:      	mov	w0, #0x0                ; =0
     1a8:      	str	x0, [x29, #0x2e8]
     1ac:      	b	0x1b8 <_stogir.verify.structure+0x80>
     1b0:      	mov	w0, #0x1                ; =1
     1b4:      	str	x0, [x29, #0x2e8]
     1b8:      	ldr	x0, [x29, #0x2e8]
     1bc:      	cbz	x0, 0x1e0 <_stogir.verify.structure+0xa8>
     1c0:      	adrp	x0, 0x0 <_gap_verify_graph>
		00000000000001c0:  ARM64_RELOC_PAGE21	l_cstr.52
     1c4:      	add	x0, x0, #0x0
		00000000000001c4:  ARM64_RELOC_PAGEOFF12	l_cstr.52
     1c8:      	str	x0, [x29, #0xd0]
     1cc:      	mov	w0, #0x2c               ; =44
     1d0:      	str	x0, [x29, #0xd8]
     1d4:      	ldr	q0, [x29, #0xd0]
     1d8:      	str	q0, [x29, #0xa0]
     1dc:      	b	0x1e0 <_stogir.verify.structure+0xa8>
     1e0:      	mov	w0, #0x1                ; =1
     1e4:      	str	x0, [x29, #0x2e8]
     1e8:      	mov	w0, #0x0                ; =0
     1ec:      	str	x0, [x29, #0x2f0]
     1f0:      	ldr	q0, [x29, #0xa0]
     1f4:      	str	q0, [x29, #0xe0]
     1f8:      	adrp	x0, 0x0 <_gap_verify_graph>
		00000000000001f8:  ARM64_RELOC_PAGE21	l_cstr.51
     1fc:      	add	x0, x0, #0x0
		00000000000001fc:  ARM64_RELOC_PAGEOFF12	l_cstr.51
     200:      	str	x0, [x29, #0xf0]
     204:      	str	xzr, [x29, #0xf8]
     208:      	ldr	x0, [x29, #0xe0]
     20c:      	ldr	x1, [x29, #0xe8]
     210:      	ldr	x2, [x29, #0xf0]
     214:      	ldr	x3, [x29, #0xf8]
     218:      	bl	0x218 <_stogir.verify.structure+0xe0>
		0000000000000218:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     21c:      	cbz	x0, 0x23c <_stogir.verify.structure+0x104>
     220:      	ldr	x0, [x29, #0x2e0]
     224:      	bl	0x224 <_stogir.verify.structure+0xec>
		0000000000000224:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
     228:      	ldr	x1, [x29, #0x2e8]
     22c:      	cmp	x1, x0
     230:      	cset	x0, lt
     234:      	str	x0, [x29, #0x2f8]
     238:      	b	0x244 <_stogir.verify.structure+0x10c>
     23c:      	mov	w0, #0x0                ; =0
     240:      	str	x0, [x29, #0x2f8]
     244:      	ldr	x0, [x29, #0x2f8]
     248:      	cbz	x0, 0x90c <_stogir.verify.structure+0x7d4>
     24c:      	ldr	x0, [x29, #0x2e0]
     250:      	ldr	x1, [x0]
     254:      	ldr	x2, [x29, #0x2e8]
     258:      	add	x1, x1, x2, lsl #4
     25c:      	ldr	q0, [x1]
     260:      	str	q0, [x29, #0x110]
     264:      	ldr	q0, [x29, #0x110]
     268:      	str	q0, [x29, #0x100]
     26c:      	mov	x9, x0
     270:      	add	x0, x29, #0x100
     274:      	bl	0x274 <_stogir.verify.structure+0x13c>
		0000000000000274:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
     278:      	ubfx	x0, x0, #0, #8
     27c:      	sxtw	x0, w0
     280:      	ldr	x1, [x29, #0x2e0]
     284:      	ldr	x2, [x1, #0x78]
     288:      	ldr	x3, [x29, #0x2e8]
     28c:      	add	x2, x2, x3, lsl #2
     290:      	ldrsw	x2, [x2]
     294:      	cmp	x2, #0x0
     298:      	str	x0, [x29, #0x2f8]
     29c:      	str	x2, [x29, #0x300]
     2a0:      	b.ge	0x2b0 <_stogir.verify.structure+0x178>
     2a4:      	mov	w4, #0x1                ; =1
     2a8:      	str	x4, [x29, #0x308]
     2ac:      	b	0x2c4 <_stogir.verify.structure+0x18c>
     2b0:      	ldr	x0, [x29, #0x300]
     2b4:      	mov	w1, #0xffff             ; =65535
     2b8:      	cmp	x0, x1
     2bc:      	cset	x1, gt
     2c0:      	str	x1, [x29, #0x308]
     2c4:      	ldr	x0, [x29, #0x308]
     2c8:      	cbz	x0, 0x2fc <_stogir.verify.structure+0x1c4>
     2cc:      	adrp	x0, 0x0 <_gap_verify_graph>
		00000000000002cc:  ARM64_RELOC_PAGE21	l_cstr.53
     2d0:      	add	x0, x0, #0x0
		00000000000002d0:  ARM64_RELOC_PAGEOFF12	l_cstr.53
     2d4:      	str	x0, [x29, #0x120]
     2d8:      	mov	w0, #0x23               ; =35
     2dc:      	str	x0, [x29, #0x128]
     2e0:      	ldr	q0, [x29, #0x120]
     2e4:      	str	q0, [x29, #0xa0]
     2e8:      	ldr	x0, [x29, #0x2e8]
     2ec:      	str	x0, [x29, #0x308]
     2f0:      	ldr	x0, [x29, #0x2f0]
     2f4:      	str	x0, [x29, #0x310]
     2f8:      	b	0x8f0 <_stogir.verify.structure+0x7b8>
     2fc:      	ldr	x0, [x29, #0x2f8]
     300:      	bl	0x300 <_stogir.verify.structure+0x1c8>
		0000000000000300:  ARM64_RELOC_BRANCH26	_stogir.opcode.valid?
     304:      	cbz	x0, 0x314 <_stogir.verify.structure+0x1dc>
     308:      	mov	w0, #0x0                ; =0
     30c:      	str	x0, [x29, #0x318]
     310:      	b	0x31c <_stogir.verify.structure+0x1e4>
     314:      	mov	w0, #0x1                ; =1
     318:      	str	x0, [x29, #0x318]
     31c:      	ldr	x0, [x29, #0x318]
     320:      	cbz	x0, 0x330 <_stogir.verify.structure+0x1f8>
     324:      	mov	w0, #0x1                ; =1
     328:      	str	x0, [x29, #0x318]
     32c:      	b	0x364 <_stogir.verify.structure+0x22c>
     330:      	add	x0, x29, #0x100
     334:      	bl	0x334 <_stogir.verify.structure+0x1fc>
		0000000000000334:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
     338:      	ubfx	x0, x0, #0, #8
     33c:      	sxtw	x0, w0
     340:      	bl	0x340 <_stogir.verify.structure+0x208>
		0000000000000340:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
     344:      	cbz	x0, 0x354 <_stogir.verify.structure+0x21c>
     348:      	mov	w0, #0x0                ; =0
     34c:      	str	x0, [x29, #0x320]
     350:      	b	0x35c <_stogir.verify.structure+0x224>
     354:      	mov	w0, #0x1                ; =1
     358:      	str	x0, [x29, #0x320]
     35c:      	ldr	x0, [x29, #0x320]
     360:      	str	x0, [x29, #0x318]
     364:      	ldr	x0, [x29, #0x318]
     368:      	cbz	x0, 0x39c <_stogir.verify.structure+0x264>
     36c:      	adrp	x0, 0x0 <_gap_verify_graph>
		000000000000036c:  ARM64_RELOC_PAGE21	l_cstr.54
     370:      	add	x0, x0, #0x0
		0000000000000370:  ARM64_RELOC_PAGEOFF12	l_cstr.54
     374:      	str	x0, [x29, #0x130]
     378:      	mov	w0, #0x16               ; =22
     37c:      	str	x0, [x29, #0x138]
     380:      	ldr	q0, [x29, #0x130]
     384:      	str	q0, [x29, #0xa0]
     388:      	ldr	x0, [x29, #0x2e8]
     38c:      	str	x0, [x29, #0x318]
     390:      	ldr	x0, [x29, #0x2f0]
     394:      	str	x0, [x29, #0x320]
     398:      	b	0x8e0 <_stogir.verify.structure+0x7a8>
     39c:      	ldr	x0, [x29, #0x2f8]
     3a0:      	bl	0x3a0 <_stogir.verify.structure+0x268>
		00000000000003a0:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
     3a4:      	sxtw	x0, w0
     3a8:      	cmp	x0, #0x0
     3ac:      	b.lt	0x3fc <_stogir.verify.structure+0x2c4>
     3b0:      	ldr	x0, [x29, #0x300]
     3b4:      	str	w0, [x29, #0x140]
     3b8:      	mov	x9, x0
     3bc:      	ldr	x0, [x29, #0x2f8]
     3c0:      	bl	0x3c0 <_stogir.verify.structure+0x288>
		00000000000003c0:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
     3c4:      	sxtw	x0, w0
     3c8:      	str	w0, [x29, #0x144]
     3cc:      	ldrsw	x0, [x29, #0x140]
     3d0:      	ldrsw	x1, [x29, #0x144]
     3d4:      	cmp	x0, x1
     3d8:      	b.ne	0x3e8 <_stogir.verify.structure+0x2b0>
     3dc:      	mov	w0, #0x0                ; =0
     3e0:      	str	x0, [x29, #0x328]
     3e4:      	b	0x3f0 <_stogir.verify.structure+0x2b8>
     3e8:      	mov	w0, #0x1                ; =1
     3ec:      	str	x0, [x29, #0x328]
     3f0:      	ldr	x0, [x29, #0x328]
     3f4:      	str	x0, [x29, #0x330]
     3f8:      	b	0x404 <_stogir.verify.structure+0x2cc>
     3fc:      	mov	w0, #0x0                ; =0
     400:      	str	x0, [x29, #0x330]
     404:      	ldr	x0, [x29, #0x330]
     408:      	cbz	x0, 0x43c <_stogir.verify.structure+0x304>
     40c:      	adrp	x0, 0x0 <_gap_verify_graph>
		000000000000040c:  ARM64_RELOC_PAGE21	l_cstr.55
     410:      	add	x0, x0, #0x0
		0000000000000410:  ARM64_RELOC_PAGEOFF12	l_cstr.55
     414:      	str	x0, [x29, #0x150]
     418:      	mov	w0, #0x23               ; =35
     41c:      	str	x0, [x29, #0x158]
     420:      	ldr	q0, [x29, #0x150]
     424:      	str	q0, [x29, #0xa0]
     428:      	ldr	x0, [x29, #0x2e8]
     42c:      	str	x0, [x29, #0x330]
     430:      	ldr	x0, [x29, #0x2f0]
     434:      	str	x0, [x29, #0x328]
     438:      	b	0x8d0 <_stogir.verify.structure+0x798>
     43c:      	ldr	x0, [x29, #0x2f8]
     440:      	bl	0x440 <_stogir.verify.structure+0x308>
		0000000000000440:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
     444:      	sxtw	x0, w0
     448:      	cmn	x0, #0x1
     44c:      	b.ne	0x4a0 <_stogir.verify.structure+0x368>
     450:      	ldr	x0, [x29, #0x300]
     454:      	str	w0, [x29, #0x160]
     458:      	mov	x9, x0
     45c:      	add	x0, x29, #0x100
     460:      	bl	0x460 <_stogir.verify.structure+0x328>
		0000000000000460:  ARM64_RELOC_BRANCH26	_stogir.node.auxiliary
     464:      	ubfx	x0, x0, #0, #16
     468:      	sxtw	x0, w0
     46c:      	str	w0, [x29, #0x164]
     470:      	ldrsw	x0, [x29, #0x160]
     474:      	ldrsw	x1, [x29, #0x164]
     478:      	cmp	x0, x1
     47c:      	b.ne	0x48c <_stogir.verify.structure+0x354>
     480:      	mov	w0, #0x0                ; =0
     484:      	str	x0, [x29, #0x338]
     488:      	b	0x494 <_stogir.verify.structure+0x35c>
     48c:      	mov	w0, #0x1                ; =1
     490:      	str	x0, [x29, #0x338]
     494:      	ldr	x0, [x29, #0x338]
     498:      	str	x0, [x29, #0x340]
     49c:      	b	0x4a8 <_stogir.verify.structure+0x370>
     4a0:      	mov	w0, #0x0                ; =0
     4a4:      	str	x0, [x29, #0x340]
     4a8:      	ldr	x0, [x29, #0x340]
     4ac:      	cbz	x0, 0x4d0 <_stogir.verify.structure+0x398>
     4b0:      	adrp	x0, 0x0 <_gap_verify_graph>
		00000000000004b0:  ARM64_RELOC_PAGE21	l_cstr.56
     4b4:      	add	x0, x0, #0x0
		00000000000004b4:  ARM64_RELOC_PAGEOFF12	l_cstr.56
     4b8:      	str	x0, [x29, #0x170]
     4bc:      	mov	w0, #0x24               ; =36
     4c0:      	str	x0, [x29, #0x178]
     4c4:      	ldr	q0, [x29, #0x170]
     4c8:      	str	q0, [x29, #0xa0]
     4cc:      	b	0x4d0 <_stogir.verify.structure+0x398>
     4d0:      	ldr	x0, [x29, #0x300]
     4d4:      	add	x1, x0, #0x4
     4d8:      	mov	w2, #0x4                ; =4
     4dc:      	sdiv	x1, x1, x2
     4e0:      	ldr	x2, [x29, #0x2e8]
     4e4:      	add	x3, x2, x1
     4e8:      	mov	x9, x0
     4ec:      	ldr	x0, [x29, #0x2e0]
     4f0:      	str	x1, [x29, #0x340]
     4f4:      	str	x3, [x29, #0x338]
     4f8:      	bl	0x4f8 <_stogir.verify.structure+0x3c0>
		00000000000004f8:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
     4fc:      	ldr	x1, [x29, #0x338]
     500:      	cmp	x1, x0
     504:      	b.le	0x528 <_stogir.verify.structure+0x3f0>
     508:      	adrp	x0, 0x0 <_gap_verify_graph>
		0000000000000508:  ARM64_RELOC_PAGE21	l_cstr.57
     50c:      	add	x0, x0, #0x0
		000000000000050c:  ARM64_RELOC_PAGEOFF12	l_cstr.57
     510:      	str	x0, [x29, #0x180]
     514:      	mov	w0, #0x15               ; =21
     518:      	str	x0, [x29, #0x188]
     51c:      	ldr	q0, [x29, #0x180]
     520:      	str	q0, [x29, #0xa0]
     524:      	b	0x528 <_stogir.verify.structure+0x3f0>
     528:      	mov	w19, #0x1               ; =1
     52c:      	ldr	q0, [x29, #0xa0]
     530:      	str	q0, [x29, #0x190]
     534:      	adrp	x0, 0x0 <_gap_verify_graph>
		0000000000000534:  ARM64_RELOC_PAGE21	l_cstr.51
     538:      	add	x0, x0, #0x0
		0000000000000538:  ARM64_RELOC_PAGEOFF12	l_cstr.51
     53c:      	str	x0, [x29, #0x1a0]
     540:      	str	xzr, [x29, #0x1a8]
     544:      	ldr	x0, [x29, #0x190]
     548:      	ldr	x1, [x29, #0x198]
     54c:      	ldr	x2, [x29, #0x1a0]
     550:      	ldr	x3, [x29, #0x1a8]
     554:      	bl	0x554 <_stogir.verify.structure+0x41c>
		0000000000000554:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     558:      	cbz	x0, 0x570 <_stogir.verify.structure+0x438>
     55c:      	ldr	x0, [x29, #0x340]
     560:      	cmp	x19, x0
     564:      	cset	x1, lt
     568:      	mov	x20, x1
     56c:      	b	0x574 <_stogir.verify.structure+0x43c>
     570:      	mov	w20, #0x0               ; =0
     574:      	cbz	x20, 0x5e8 <_stogir.verify.structure+0x4b0>
     578:      	ldr	x0, [x29, #0x2e8]
     57c:      	add	x1, x0, x19
     580:      	ldr	x2, [x29, #0x2e0]
     584:      	ldr	x3, [x2, #0x78]
     588:      	add	x3, x3, x1, lsl #2
     58c:      	ldrsw	x3, [x3]
     590:      	str	w3, [x29, #0x1b0]
     594:      	mov	x1, #-0x1               ; =-1
     598:      	str	w1, [x29, #0x1b4]
     59c:      	ldrsw	x1, [x29, #0x1b0]
     5a0:      	ldrsw	x3, [x29, #0x1b4]
     5a4:      	cmp	x1, x3
     5a8:      	b.ne	0x5b4 <_stogir.verify.structure+0x47c>
     5ac:      	mov	w20, #0x0               ; =0
     5b0:      	b	0x5b8 <_stogir.verify.structure+0x480>
     5b4:      	mov	w20, #0x1               ; =1
     5b8:      	cbz	x20, 0x5dc <_stogir.verify.structure+0x4a4>
     5bc:      	adrp	x0, 0x0 <_gap_verify_graph>
		00000000000005bc:  ARM64_RELOC_PAGE21	l_cstr.58
     5c0:      	add	x0, x0, #0x0
		00000000000005c0:  ARM64_RELOC_PAGEOFF12	l_cstr.58
     5c4:      	str	x0, [x29, #0x1c0]
     5c8:      	mov	w0, #0x1b               ; =27
     5cc:      	str	x0, [x29, #0x1c8]
     5d0:      	ldr	q0, [x29, #0x1c0]
     5d4:      	str	q0, [x29, #0xa0]
     5d8:      	b	0x5dc <_stogir.verify.structure+0x4a4>
     5dc:      	add	x20, x19, #0x1
     5e0:      	mov	x19, x20
     5e4:      	b	0x52c <_stogir.verify.structure+0x3f4>
     5e8:      	mov	w19, #0x1               ; =1
     5ec:      	ldr	q0, [x29, #0xa0]
     5f0:      	str	q0, [x29, #0x1d0]
     5f4:      	adrp	x0, 0x0 <_gap_verify_graph>
		00000000000005f4:  ARM64_RELOC_PAGE21	l_cstr.51
     5f8:      	add	x0, x0, #0x0
		00000000000005f8:  ARM64_RELOC_PAGEOFF12	l_cstr.51
     5fc:      	str	x0, [x29, #0x1e0]
     600:      	str	xzr, [x29, #0x1e8]
     604:      	ldr	x0, [x29, #0x1d0]
     608:      	ldr	x1, [x29, #0x1d8]
     60c:      	ldr	x2, [x29, #0x1e0]
     610:      	ldr	x3, [x29, #0x1e8]
     614:      	bl	0x614 <_stogir.verify.structure+0x4dc>
		0000000000000614:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     618:      	cbz	x0, 0x630 <_stogir.verify.structure+0x4f8>
     61c:      	ldr	x0, [x29, #0x300]
     620:      	cmp	x19, x0
     624:      	cset	x1, le
     628:      	mov	x20, x1
     62c:      	b	0x634 <_stogir.verify.structure+0x4fc>
     630:      	mov	w20, #0x0               ; =0
     634:      	cbz	x20, 0x8b0 <_stogir.verify.structure+0x778>
     638:      	ldr	x0, [x29, #0x2f8]
     63c:      	mov	x1, x19
     640:      	bl	0x640 <_stogir.verify.structure+0x508>
		0000000000000640:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
     644:      	ubfx	x20, x0, #0, #32
     648:      	ldr	x0, [x29, #0x2e8]
     64c:      	sxtw	x1, w0
     650:      	mov	x9, x0
     654:      	ldr	x0, [x29, #0x2e0]
     658:      	mov	x2, x19
     65c:      	bl	0x65c <_stogir.verify.structure+0x524>
		000000000000065c:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     660:      	str	x0, [x29, #0x1f0]
     664:      	str	x1, [x29, #0x1f8]
     668:      	ldr	w0, [x29, #0x1f0]
     66c:      	cmp	x0, #0x0
     670:      	b.eq	0x684 <_stogir.verify.structure+0x54c>
     674:      	cmp	x0, #0x1
     678:      	b.eq	0x6a4 <_stogir.verify.structure+0x56c>
     67c:      	b	0x680 <_stogir.verify.structure+0x548>
     680:      	b	0x908 <_stogir.verify.structure+0x7d0>
     684:      	adrp	x0, 0x0 <_gap_verify_graph>
		0000000000000684:  ARM64_RELOC_PAGE21	l_cstr.59
     688:      	add	x0, x0, #0x0
		0000000000000688:  ARM64_RELOC_PAGEOFF12	l_cstr.59
     68c:      	str	x0, [x29, #0x200]
     690:      	mov	w0, #0x17               ; =23
     694:      	str	x0, [x29, #0x208]
     698:      	ldr	q0, [x29, #0x200]
     69c:      	str	q0, [x29, #0xa0]
     6a0:      	b	0x8a0 <_stogir.verify.structure+0x768>
     6a4:      	ldrsw	x21, [x29, #0x1f8]
     6a8:      	adrp	x0, 0x0 <_gap_verify_graph>
		00000000000006a8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-DEF
     6ac:      	add	x0, x0, #0x0
		00000000000006ac:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-DEF
     6b0:      	ldr	w0, [x0]
     6b4:      	cmp	x20, x0
     6b8:      	b.ne	0x6c4 <_stogir.verify.structure+0x58c>
     6bc:      	mov	w22, #0x1               ; =1
     6c0:      	b	0x6dc <_stogir.verify.structure+0x5a4>
     6c4:      	adrp	x0, 0x0 <_gap_verify_graph>
		00000000000006c4:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-REF
     6c8:      	add	x0, x0, #0x0
		00000000000006c8:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-REF
     6cc:      	ldr	w0, [x0]
     6d0:      	cmp	x20, x0
     6d4:      	cset	x0, eq
     6d8:      	mov	x22, x0
     6dc:      	cbz	x22, 0x778 <_stogir.verify.structure+0x640>
     6e0:      	ldr	x0, [x29, #0x2e0]
     6e4:      	mov	x1, x21
     6e8:      	bl	0x6e8 <_stogir.verify.structure+0x5b0>
		00000000000006e8:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
     6ec:      	mov	x23, x0
     6f0:      	str	x23, [x29, #0x1b8]
     6f4:      	str	xzr, [x29, #0x168]
     6f8:      	ldr	x0, [x29, #0x1b8]
     6fc:      	ldr	x1, [x29, #0x168]
     700:      	cmp	x0, x1
     704:      	b.ne	0x714 <_stogir.verify.structure+0x5dc>
     708:      	mov	w0, #0x0                ; =0
     70c:      	str	x0, [x29, #0x338]
     710:      	b	0x71c <_stogir.verify.structure+0x5e4>
     714:      	mov	w0, #0x1                ; =1
     718:      	str	x0, [x29, #0x338]
     71c:      	ldr	x0, [x29, #0x338]
     720:      	mov	x1, x0
     724:      	cbz	x1, 0x748 <_stogir.verify.structure+0x610>
     728:      	mov	x9, x0
     72c:      	mov	x0, x23
     730:      	bl	0x730 <_stogir.verify.structure+0x5f8>
		0000000000000730:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
     734:      	ubfx	x0, x0, #0, #8
     738:      	cmp	x0, #0x48
     73c:      	cset	x0, eq
     740:      	mov	x23, x0
     744:      	b	0x74c <_stogir.verify.structure+0x614>
     748:      	mov	w23, #0x0               ; =0
     74c:      	cbz	x23, 0x770 <_stogir.verify.structure+0x638>
     750:      	adrp	x0, 0x0 <_gap_verify_graph>
		0000000000000750:  ARM64_RELOC_PAGE21	l_cstr.60
     754:      	add	x0, x0, #0x0
		0000000000000754:  ARM64_RELOC_PAGEOFF12	l_cstr.60
     758:      	str	x0, [x29, #0x210]
     75c:      	mov	w0, #0x25               ; =37
     760:      	str	x0, [x29, #0x218]
     764:      	ldr	q0, [x29, #0x210]
     768:      	str	q0, [x29, #0xa0]
     76c:      	b	0x770 <_stogir.verify.structure+0x638>
     770:      	ldr	x23, [x29, #0x338]
     774:      	b	0x77c <_stogir.verify.structure+0x644>
     778:      	mov	w23, #0x0               ; =0
     77c:      	adrp	x0, 0x0 <_gap_verify_graph>
		000000000000077c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-PRO
     780:      	add	x0, x0, #0x0
		0000000000000780:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-PRO
     784:      	ldr	w0, [x0]
     788:      	cmp	x20, x0
     78c:      	b.ne	0x7f8 <_stogir.verify.structure+0x6c0>
     790:      	ldr	x0, [x29, #0x2e0]
     794:      	add	x1, x0, #0x110
     798:      	add	x8, x29, #0x220
     79c:      	mov	x9, x0
     7a0:      	mov	x0, x1
     7a4:      	mov	x1, x21
     7a8:      	bl	0x7a8 <_stogir.verify.structure+0x670>
		00000000000007a8:  ARM64_RELOC_BRANCH26	_stogir.strings.lookup
     7ac:      	ldr	w0, [x29, #0x220]
     7b0:      	cmp	x0, #0x0
     7b4:      	b.eq	0x7c8 <_stogir.verify.structure+0x690>
     7b8:      	cmp	x0, #0x1
     7bc:      	b.eq	0x7e8 <_stogir.verify.structure+0x6b0>
     7c0:      	b	0x7c4 <_stogir.verify.structure+0x68c>
     7c4:      	b	0x904 <_stogir.verify.structure+0x7cc>
     7c8:      	adrp	x0, 0x0 <_gap_verify_graph>
		00000000000007c8:  ARM64_RELOC_PAGE21	l_cstr.61
     7cc:      	add	x0, x0, #0x0
		00000000000007cc:  ARM64_RELOC_PAGEOFF12	l_cstr.61
     7d0:      	str	x0, [x29, #0x240]
     7d4:      	mov	w0, #0x21               ; =33
     7d8:      	str	x0, [x29, #0x248]
     7dc:      	ldr	q0, [x29, #0x240]
     7e0:      	str	q0, [x29, #0xa0]
     7e4:      	b	0x7f4 <_stogir.verify.structure+0x6bc>
     7e8:      	mov	w16, #0x228             ; =552
     7ec:      	ldr	q0, [x29, x16]
     7f0:      	str	q0, [x29, #0x250]
     7f4:      	b	0x7f8 <_stogir.verify.structure+0x6c0>
     7f8:      	mov	x0, x20
     7fc:      	bl	0x7fc <_stogir.verify.structure+0x6c4>
		00000000000007fc:  ARM64_RELOC_BRANCH26	_stogir.uses.edge-code?
     800:      	cbz	x0, 0x8a0 <_stogir.verify.structure+0x768>
     804:      	cbz	x22, 0x810 <_stogir.verify.structure+0x6d8>
     808:      	mov	x20, x23
     80c:      	b	0x820 <_stogir.verify.structure+0x6e8>
     810:      	ldr	x0, [x29, #0x2e0]
     814:      	mov	x1, x21
     818:      	bl	0x818 <_stogir.verify.structure+0x6e0>
		0000000000000818:  ARM64_RELOC_BRANCH26	_stogir.graph.contains?
     81c:      	mov	x20, x0
     820:      	cbz	x20, 0x82c <_stogir.verify.structure+0x6f4>
     824:      	mov	w20, #0x1               ; =1
     828:      	b	0x868 <_stogir.verify.structure+0x730>
     82c:      	cmp	x21, #0x0
     830:      	b.ne	0x860 <_stogir.verify.structure+0x728>
     834:      	add	x0, x29, #0x100
     838:      	bl	0x838 <_stogir.verify.structure+0x700>
		0000000000000838:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
     83c:      	ubfx	x0, x0, #0, #8
     840:      	sxtw	x0, w0
     844:      	mov	x9, x0
     848:      	ldr	x0, [x29, #0x2f8]
     84c:      	mov	x1, x9
     850:      	mov	x2, x19
     854:      	bl	0x854 <_stogir.verify.structure+0x71c>
		0000000000000854:  ARM64_RELOC_BRANCH26	_stogir.opcode.optional-reference?
     858:      	mov	x21, x0
     85c:      	b	0x864 <_stogir.verify.structure+0x72c>
     860:      	mov	w21, #0x0               ; =0
     864:      	mov	x20, x21
     868:      	cbz	x20, 0x874 <_stogir.verify.structure+0x73c>
     86c:      	mov	w20, #0x0               ; =0
     870:      	b	0x878 <_stogir.verify.structure+0x740>
     874:      	mov	w20, #0x1               ; =1
     878:      	cbz	x20, 0x89c <_stogir.verify.structure+0x764>
     87c:      	adrp	x0, 0x0 <_gap_verify_graph>
		000000000000087c:  ARM64_RELOC_PAGE21	l_cstr.62
     880:      	add	x0, x0, #0x0
		0000000000000880:  ARM64_RELOC_PAGEOFF12	l_cstr.62
     884:      	str	x0, [x29, #0x260]
     888:      	mov	w0, #0x1a               ; =26
     88c:      	str	x0, [x29, #0x268]
     890:      	ldr	q0, [x29, #0x260]
     894:      	str	q0, [x29, #0xa0]
     898:      	b	0x89c <_stogir.verify.structure+0x764>
     89c:      	b	0x8a0 <_stogir.verify.structure+0x768>
     8a0:      	add	x0, x19, #0x1
     8a4:      	sxtw	x20, w0
     8a8:      	mov	x19, x20
     8ac:      	b	0x5ec <_stogir.verify.structure+0x4b4>
     8b0:      	ldr	x0, [x29, #0x2e8]
     8b4:      	ldr	x1, [x29, #0x340]
     8b8:      	add	x2, x0, x1
     8bc:      	ldr	x1, [x29, #0x2f0]
     8c0:      	add	x3, x1, #0x1
     8c4:      	sxtw	x3, w3
     8c8:      	str	x2, [x29, #0x330]
     8cc:      	str	x3, [x29, #0x328]
     8d0:      	ldr	x0, [x29, #0x330]
     8d4:      	str	x0, [x29, #0x318]
     8d8:      	ldr	x0, [x29, #0x328]
     8dc:      	str	x0, [x29, #0x320]
     8e0:      	ldr	x0, [x29, #0x318]
     8e4:      	str	x0, [x29, #0x308]
     8e8:      	ldr	x0, [x29, #0x320]
     8ec:      	str	x0, [x29, #0x310]
     8f0:      	ldr	x0, [x29, #0x308]
     8f4:      	str	x0, [x29, #0x2e8]
     8f8:      	ldr	x0, [x29, #0x310]
     8fc:      	str	x0, [x29, #0x2f0]
     900:      	b	0x1f0 <_stogir.verify.structure+0xb8>
     904:      	brk	#0x1
     908:      	brk	#0x1
     90c:      	ldr	q0, [x29, #0xa0]
     910:      	str	q0, [x29, #0x270]
     914:      	adrp	x0, 0x0 <_gap_verify_graph>
		0000000000000914:  ARM64_RELOC_PAGE21	l_cstr.51
     918:      	add	x0, x0, #0x0
		0000000000000918:  ARM64_RELOC_PAGEOFF12	l_cstr.51
     91c:      	str	x0, [x29, #0x280]
     920:      	str	xzr, [x29, #0x288]
     924:      	ldr	x0, [x29, #0x270]
     928:      	ldr	x1, [x29, #0x278]
     92c:      	ldr	x2, [x29, #0x280]
     930:      	ldr	x3, [x29, #0x288]
     934:      	bl	0x934 <_stogir.verify.structure+0x7fc>
		0000000000000934:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     938:      	cbz	x0, 0x954 <_stogir.verify.structure+0x81c>
     93c:      	str	wzr, [x29, #0x290]
     940:      	ldr	x0, [x29, #0x2f0]
     944:      	str	w0, [x29, #0x298]
     948:      	add	x0, x29, #0x290
     94c:      	str	x0, [x29, #0x2f0]
     950:      	b	0x978 <_stogir.verify.structure+0x840>
     954:      	mov	w0, #0x1                ; =1
     958:      	str	w0, [x29, #0x2b0]
     95c:      	ldr	q0, [x29, #0xa0]
     960:      	str	q0, [x29, #0x2d0]
     964:      	ldr	q0, [x29, #0x2d0]
     968:      	mov	w16, #0x2b8             ; =696
     96c:      	str	q0, [x29, x16]
     970:      	add	x0, x29, #0x2b0
     974:      	str	x0, [x29, #0x2f0]
     978:      	ldr	x0, [x29, #0x148]
     97c:      	ldr	x1, [x29, #0x2f0]
     980:      	ldr	q0, [x1]
     984:      	str	q0, [x0]
     988:      	ldr	x2, [x1, #0x10]
     98c:      	str	x2, [x0, #0x10]
     990:      	ldp	x19, x20, [sp, #0x10]
     994:      	ldp	x21, x22, [sp, #0x20]
     998:      	ldr	x23, [sp, #0x30]
     99c:      	ldp	x29, x30, [sp]
     9a0:      	add	sp, sp, #0x350
     9a4:      	ret

00000000000009a8 <_stogir.verify.integer-operations-target-structured>:
     9a8:      	sub	sp, sp, #0x570
     9ac:      	stp	x29, x30, [sp]
     9b0:      	mov	x29, sp
     9b4:      	stp	x19, x20, [sp, #0x10]
     9b8:      	stp	x21, x22, [sp, #0x20]
     9bc:      	str	x23, [sp, #0x30]
     9c0:      	sxtw	x1, w1
     9c4:      	adrp	x2, 0x0 <_gap_verify_graph>
		00000000000009c4:  ARM64_RELOC_PAGE21	l_cstr.51
     9c8:      	add	x2, x2, #0x0
		00000000000009c8:  ARM64_RELOC_PAGEOFF12	l_cstr.51
     9cc:      	str	x2, [x29, #0xb0]
     9d0:      	str	xzr, [x29, #0xb8]
     9d4:      	ldr	q0, [x29, #0xb0]
     9d8:      	str	q0, [x29, #0xa0]
     9dc:      	str	x0, [x29, #0x3e8]
     9e0:      	str	x1, [x29, #0x378]
     9e4:      	str	x8, [x29, #0x108]
     9e8:      	mov	w19, #0x1               ; =1
     9ec:      	mov	w20, #0x0               ; =0
     9f0:      	ldr	q0, [x29, #0xa0]
     9f4:      	str	q0, [x29, #0xc0]
     9f8:      	adrp	x0, 0x0 <_gap_verify_graph>
		00000000000009f8:  ARM64_RELOC_PAGE21	l_cstr.51
     9fc:      	add	x0, x0, #0x0
		00000000000009fc:  ARM64_RELOC_PAGEOFF12	l_cstr.51
     a00:      	str	x0, [x29, #0xd0]
     a04:      	str	xzr, [x29, #0xd8]
     a08:      	ldr	x0, [x29, #0xc0]
     a0c:      	ldr	x1, [x29, #0xc8]
     a10:      	ldr	x2, [x29, #0xd0]
     a14:      	ldr	x3, [x29, #0xd8]
     a18:      	bl	0xa18 <_stogir.verify.integer-operations-target-structured+0x70>
		0000000000000a18:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     a1c:      	cbz	x0, 0xa38 <_stogir.verify.integer-operations-target-structured+0x90>
     a20:      	ldr	x0, [x29, #0x3e8]
     a24:      	bl	0xa24 <_stogir.verify.integer-operations-target-structured+0x7c>
		0000000000000a24:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
     a28:      	cmp	x19, x0
     a2c:      	cset	x0, lt
     a30:      	mov	x21, x0
     a34:      	b	0xa3c <_stogir.verify.integer-operations-target-structured+0x94>
     a38:      	mov	w21, #0x0               ; =0
     a3c:      	cbz	x21, 0x1944 <_stogir.verify.integer-operations-target-structured+0xf9c>
     a40:      	ldr	x0, [x29, #0x3e8]
     a44:      	ldr	x1, [x0]
     a48:      	add	x1, x1, x19, lsl #4
     a4c:      	ldr	q0, [x1]
     a50:      	str	q0, [x29, #0xf0]
     a54:      	ldr	q0, [x29, #0xf0]
     a58:      	str	q0, [x29, #0xe0]
     a5c:      	mov	x9, x0
     a60:      	add	x0, x29, #0xe0
     a64:      	bl	0xa64 <_stogir.verify.integer-operations-target-structured+0xbc>
		0000000000000a64:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
     a68:      	ubfx	x0, x0, #0, #8
     a6c:      	sxtw	x21, w0
     a70:      	ldr	x0, [x29, #0x3e8]
     a74:      	ldr	x1, [x0, #0x78]
     a78:      	add	x1, x1, x19, lsl #2
     a7c:      	ldrsw	x22, [x1]
     a80:      	cmp	x21, #0xe
     a84:      	b.lt	0xa98 <_stogir.verify.integer-operations-target-structured+0xf0>
     a88:      	cmp	x21, #0x17
     a8c:      	cset	x1, le
     a90:      	mov	x23, x1
     a94:      	b	0xa9c <_stogir.verify.integer-operations-target-structured+0xf4>
     a98:      	mov	w23, #0x0               ; =0
     a9c:      	mov	x0, x21
     aa0:      	bl	0xaa0 <_stogir.verify.integer-operations-target-structured+0xf8>
		0000000000000aa0:  ARM64_RELOC_BRANCH26	_stogir.integer-binary.operation?
     aa4:      	mov	x9, x0
     aa8:      	mov	x0, x21
     aac:      	str	x9, [x29, #0x530]
     ab0:      	bl	0xab0 <_stogir.verify.integer-operations-target-structured+0x108>
		0000000000000ab0:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.operation?
     ab4:      	sxtw	x1, w19
     ab8:      	mov	x9, x0
     abc:      	ldr	x0, [x29, #0x3e8]
     ac0:      	add	x2, x29, #0xe0
     ac4:      	mov	x3, x22
     ac8:      	str	x9, [x29, #0x538]
     acc:      	bl	0xacc <_stogir.verify.integer-operations-target-structured+0x124>
		0000000000000acc:  ARM64_RELOC_BRANCH26	_stogir.verify.classifications
     ad0:      	strh	w0, [x29, #0x102]
     ad4:      	ldrh	w0, [x29, #0x102]
     ad8:      	strh	w0, [x29, #0x100]
     adc:      	ldrb	w0, [x29, #0x100]
     ae0:      	ldrb	w1, [x29, #0x101]
     ae4:      	mov	x9, x0
     ae8:      	mov	x0, x21
     aec:      	str	x1, [x29, #0x540]
     af0:      	str	x9, [x29, #0x548]
     af4:      	bl	0xaf4 <_stogir.verify.integer-operations-target-structured+0x14c>
		0000000000000af4:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operation?
     af8:      	cbz	x0, 0xb08 <_stogir.verify.integer-operations-target-structured+0x160>
     afc:      	mov	w0, #0x1                ; =1
     b00:      	str	x0, [x29, #0x550]
     b04:      	b	0xb10 <_stogir.verify.integer-operations-target-structured+0x168>
     b08:      	ldr	x0, [x29, #0x548]
     b0c:      	str	x0, [x29, #0x550]
     b10:      	ldr	x0, [x29, #0x550]
     b14:      	cbz	x0, 0xb88 <_stogir.verify.integer-operations-target-structured+0x1e0>
     b18:      	sxtw	x0, w19
     b1c:      	add	x8, x29, #0x110
     b20:      	mov	x9, x0
     b24:      	ldr	x0, [x29, #0x3e8]
     b28:      	mov	x1, x9
     b2c:      	ldr	x2, [x29, #0x378]
     b30:      	bl	0xb30 <_stogir.verify.integer-operations-target-structured+0x188>
		0000000000000b30:  ARM64_RELOC_BRANCH26	_stogir.vector.validate
     b34:      	ldr	w0, [x29, #0x110]
     b38:      	cmp	x0, #0x0
     b3c:      	b.eq	0xb6c <_stogir.verify.integer-operations-target-structured+0x1c4>
     b40:      	cmp	x0, #0x1
     b44:      	b.eq	0xb50 <_stogir.verify.integer-operations-target-structured+0x1a8>
     b48:      	b	0xb4c <_stogir.verify.integer-operations-target-structured+0x1a4>
     b4c:      	b	0x1908 <_stogir.verify.integer-operations-target-structured+0xf60>
     b50:      	mov	w16, #0x118             ; =280
     b54:      	ldr	q0, [x29, x16]
     b58:      	str	q0, [x29, #0x130]
     b5c:      	ldr	q0, [x29, #0x130]
     b60:      	str	q0, [x29, #0xa0]
     b64:      	str	x20, [x29, #0x550]
     b68:      	b	0xb7c <_stogir.verify.integer-operations-target-structured+0x1d4>
     b6c:      	ldrsw	x0, [x29, #0x118]
     b70:      	add	x0, x20, #0x1
     b74:      	sxtw	x0, w0
     b78:      	str	x0, [x29, #0x550]
     b7c:      	ldr	x0, [x29, #0x550]
     b80:      	str	x0, [x29, #0x558]
     b84:      	b	0xb8c <_stogir.verify.integer-operations-target-structured+0x1e4>
     b88:      	str	x20, [x29, #0x558]
     b8c:      	cmp	x21, #0x44
     b90:      	b.ne	0xbc0 <_stogir.verify.integer-operations-target-structured+0x218>
     b94:      	ldr	x0, [x29, #0x548]
     b98:      	mov	x1, x0
     b9c:      	cbz	x1, 0xbac <_stogir.verify.integer-operations-target-structured+0x204>
     ba0:      	mov	w1, #0x0                ; =0
     ba4:      	str	x1, [x29, #0x550]
     ba8:      	b	0xbb4 <_stogir.verify.integer-operations-target-structured+0x20c>
     bac:      	mov	w0, #0x1                ; =1
     bb0:      	str	x0, [x29, #0x550]
     bb4:      	ldr	x0, [x29, #0x550]
     bb8:      	str	x0, [x29, #0x560]
     bbc:      	b	0xbc8 <_stogir.verify.integer-operations-target-structured+0x220>
     bc0:      	mov	w0, #0x0                ; =0
     bc4:      	str	x0, [x29, #0x560]
     bc8:      	ldr	x0, [x29, #0x560]
     bcc:      	cbz	x0, 0xc44 <_stogir.verify.integer-operations-target-structured+0x29c>
     bd0:      	sxtw	x0, w19
     bd4:      	add	x8, x29, #0x140
     bd8:      	mov	x9, x0
     bdc:      	ldr	x0, [x29, #0x3e8]
     be0:      	mov	x1, x9
     be4:      	bl	0xbe4 <_stogir.verify.integer-operations-target-structured+0x23c>
		0000000000000be4:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
     be8:      	ldr	w0, [x29, #0x140]
     bec:      	cmp	x0, #0x0
     bf0:      	b.eq	0xc24 <_stogir.verify.integer-operations-target-structured+0x27c>
     bf4:      	cmp	x0, #0x1
     bf8:      	b.eq	0xc04 <_stogir.verify.integer-operations-target-structured+0x25c>
     bfc:      	b	0xc00 <_stogir.verify.integer-operations-target-structured+0x258>
     c00:      	b	0x190c <_stogir.verify.integer-operations-target-structured+0xf64>
     c04:      	mov	w16, #0x148             ; =328
     c08:      	ldr	q0, [x29, x16]
     c0c:      	str	q0, [x29, #0x160]
     c10:      	ldr	q0, [x29, #0x160]
     c14:      	str	q0, [x29, #0xa0]
     c18:      	ldr	x0, [x29, #0x558]
     c1c:      	str	x0, [x29, #0x560]
     c20:      	b	0xc38 <_stogir.verify.integer-operations-target-structured+0x290>
     c24:      	ldrsw	x0, [x29, #0x148]
     c28:      	ldr	x0, [x29, #0x558]
     c2c:      	add	x1, x0, #0x1
     c30:      	sxtw	x1, w1
     c34:      	str	x1, [x29, #0x560]
     c38:      	ldr	x0, [x29, #0x560]
     c3c:      	str	x0, [x29, #0x550]
     c40:      	b	0xc4c <_stogir.verify.integer-operations-target-structured+0x2a4>
     c44:      	ldr	x0, [x29, #0x558]
     c48:      	str	x0, [x29, #0x550]
     c4c:      	cmp	x21, #0x1d
     c50:      	b.ne	0xc60 <_stogir.verify.integer-operations-target-structured+0x2b8>
     c54:      	mov	w0, #0x1                ; =1
     c58:      	str	x0, [x29, #0x558]
     c5c:      	b	0xc6c <_stogir.verify.integer-operations-target-structured+0x2c4>
     c60:      	cmp	x21, #0x1e
     c64:      	cset	x0, eq
     c68:      	str	x0, [x29, #0x558]
     c6c:      	ldr	x0, [x29, #0x558]
     c70:      	cbz	x0, 0xca8 <_stogir.verify.integer-operations-target-structured+0x300>
     c74:      	str	wzr, [x29, #0x104]
     c78:      	ldrsw	x0, [x29, #0xec]
     c7c:      	ldrsw	x1, [x29, #0x104]
     c80:      	cmp	x0, x1
     c84:      	b.ne	0xc94 <_stogir.verify.integer-operations-target-structured+0x2ec>
     c88:      	mov	w0, #0x0                ; =0
     c8c:      	str	x0, [x29, #0x558]
     c90:      	b	0xc9c <_stogir.verify.integer-operations-target-structured+0x2f4>
     c94:      	mov	w0, #0x1                ; =1
     c98:      	str	x0, [x29, #0x558]
     c9c:      	ldr	x0, [x29, #0x558]
     ca0:      	str	x0, [x29, #0x560]
     ca4:      	b	0xcb0 <_stogir.verify.integer-operations-target-structured+0x308>
     ca8:      	mov	w0, #0x0                ; =0
     cac:      	str	x0, [x29, #0x560]
     cb0:      	ldr	x0, [x29, #0x560]
     cb4:      	cbz	x0, 0xde4 <_stogir.verify.integer-operations-target-structured+0x43c>
     cb8:      	ldrsw	x0, [x29, #0xec]
     cbc:      	add	x8, x29, #0x170
     cc0:      	mov	x9, x0
     cc4:      	ldr	x0, [x29, #0x3e8]
     cc8:      	mov	x1, x9
     ccc:      	bl	0xccc <_stogir.verify.integer-operations-target-structured+0x324>
		0000000000000ccc:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
     cd0:      	ldr	w0, [x29, #0x170]
     cd4:      	cmp	x0, #0x0
     cd8:      	b.eq	0xcec <_stogir.verify.integer-operations-target-structured+0x344>
     cdc:      	cmp	x0, #0x1
     ce0:      	b.eq	0xd0c <_stogir.verify.integer-operations-target-structured+0x364>
     ce4:      	b	0xce8 <_stogir.verify.integer-operations-target-structured+0x340>
     ce8:      	b	0x1910 <_stogir.verify.integer-operations-target-structured+0xf68>
     cec:      	adrp	x0, 0x0 <_gap_verify_graph>
		0000000000000cec:  ARM64_RELOC_PAGE21	l_cstr.63
     cf0:      	add	x0, x0, #0x0
		0000000000000cf0:  ARM64_RELOC_PAGEOFF12	l_cstr.63
     cf4:      	str	x0, [x29, #0x1a0]
     cf8:      	mov	w0, #0x16               ; =22
     cfc:      	str	x0, [x29, #0x1a8]
     d00:      	ldr	q0, [x29, #0x1a0]
     d04:      	str	q0, [x29, #0xa0]
     d08:      	b	0xde0 <_stogir.verify.integer-operations-target-structured+0x438>
     d0c:      	mov	w16, #0x178             ; =376
     d10:      	ldr	q0, [x29, x16]
     d14:      	str	q0, [x29, #0x1b0]
     d18:      	ldrsw	x0, [x29, #0xec]
     d1c:      	cmp	x0, #0x0
     d20:      	b.ge	0xd30 <_stogir.verify.integer-operations-target-structured+0x388>
     d24:      	mov	w0, #0x1                ; =1
     d28:      	str	x0, [x29, #0x560]
     d2c:      	b	0xdb8 <_stogir.verify.integer-operations-target-structured+0x410>
     d30:      	add	x0, x29, #0x1b0
     d34:      	bl	0xd34 <_stogir.verify.integer-operations-target-structured+0x38c>
		0000000000000d34:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
     d38:      	ubfx	x0, x0, #0, #8
     d3c:      	sxtw	x0, w0
     d40:      	bl	0xd40 <_stogir.verify.integer-operations-target-structured+0x398>
		0000000000000d40:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-start?
     d44:      	cbz	x0, 0xd54 <_stogir.verify.integer-operations-target-structured+0x3ac>
     d48:      	mov	w0, #0x1                ; =1
     d4c:      	str	x0, [x29, #0x558]
     d50:      	b	0xd94 <_stogir.verify.integer-operations-target-structured+0x3ec>
     d54:      	add	x0, x29, #0x1b0
     d58:      	bl	0xd58 <_stogir.verify.integer-operations-target-structured+0x3b0>
		0000000000000d58:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
     d5c:      	ubfx	x0, x0, #0, #8
     d60:      	cmp	x0, #0x65
     d64:      	b.ne	0xd74 <_stogir.verify.integer-operations-target-structured+0x3cc>
     d68:      	mov	w0, #0x1                ; =1
     d6c:      	str	x0, [x29, #0x568]
     d70:      	b	0xd8c <_stogir.verify.integer-operations-target-structured+0x3e4>
     d74:      	add	x0, x29, #0x1b0
     d78:      	bl	0xd78 <_stogir.verify.integer-operations-target-structured+0x3d0>
		0000000000000d78:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
     d7c:      	ubfx	x0, x0, #0, #8
     d80:      	cmp	x0, #0x66
     d84:      	cset	x0, eq
     d88:      	str	x0, [x29, #0x568]
     d8c:      	ldr	x0, [x29, #0x568]
     d90:      	str	x0, [x29, #0x558]
     d94:      	ldr	x0, [x29, #0x558]
     d98:      	cbz	x0, 0xda8 <_stogir.verify.integer-operations-target-structured+0x400>
     d9c:      	mov	w0, #0x0                ; =0
     da0:      	str	x0, [x29, #0x558]
     da4:      	b	0xdb0 <_stogir.verify.integer-operations-target-structured+0x408>
     da8:      	mov	w0, #0x1                ; =1
     dac:      	str	x0, [x29, #0x558]
     db0:      	ldr	x0, [x29, #0x558]
     db4:      	str	x0, [x29, #0x560]
     db8:      	ldr	x0, [x29, #0x560]
     dbc:      	cbz	x0, 0xde0 <_stogir.verify.integer-operations-target-structured+0x438>
     dc0:      	adrp	x0, 0x0 <_gap_verify_graph>
		0000000000000dc0:  ARM64_RELOC_PAGE21	l_cstr.64
     dc4:      	add	x0, x0, #0x0
		0000000000000dc4:  ARM64_RELOC_PAGEOFF12	l_cstr.64
     dc8:      	str	x0, [x29, #0x1c0]
     dcc:      	mov	w0, #0x2d               ; =45
     dd0:      	str	x0, [x29, #0x1c8]
     dd4:      	ldr	q0, [x29, #0x1c0]
     dd8:      	str	q0, [x29, #0xa0]
     ddc:      	b	0xde0 <_stogir.verify.integer-operations-target-structured+0x438>
     de0:      	b	0xde4 <_stogir.verify.integer-operations-target-structured+0x43c>
     de4:      	mov	x0, x21
     de8:      	bl	0xde8 <_stogir.verify.integer-operations-target-structured+0x440>
		0000000000000de8:  ARM64_RELOC_BRANCH26	_stogir.checked.operation?
     dec:      	cbz	x0, 0xdfc <_stogir.verify.integer-operations-target-structured+0x454>
     df0:      	mov	w0, #0x1                ; =1
     df4:      	str	x0, [x29, #0x560]
     df8:      	b	0xe08 <_stogir.verify.integer-operations-target-structured+0x460>
     dfc:      	cmp	x21, #0x2c
     e00:      	cset	x0, eq
     e04:      	str	x0, [x29, #0x560]
     e08:      	ldr	x0, [x29, #0x560]
     e0c:      	cbz	x0, 0xec0 <_stogir.verify.integer-operations-target-structured+0x518>
     e10:      	cmp	x21, #0x2c
     e14:      	b.ne	0xe3c <_stogir.verify.integer-operations-target-structured+0x494>
     e18:      	sxtw	x0, w19
     e1c:      	add	x8, x29, #0x1d0
     e20:      	mov	x9, x0
     e24:      	ldr	x0, [x29, #0x3e8]
     e28:      	mov	x1, x9
     e2c:      	bl	0xe2c <_stogir.verify.integer-operations-target-structured+0x484>
		0000000000000e2c:  ARM64_RELOC_BRANCH26	_stogir.checked.validate-projection
     e30:      	add	x0, x29, #0x1d0
     e34:      	str	x0, [x29, #0x560]
     e38:      	b	0xe5c <_stogir.verify.integer-operations-target-structured+0x4b4>
     e3c:      	sxtw	x0, w19
     e40:      	add	x8, x29, #0x1f0
     e44:      	mov	x9, x0
     e48:      	ldr	x0, [x29, #0x3e8]
     e4c:      	mov	x1, x9
     e50:      	bl	0xe50 <_stogir.verify.integer-operations-target-structured+0x4a8>
		0000000000000e50:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
     e54:      	add	x0, x29, #0x1f0
     e58:      	str	x0, [x29, #0x560]
     e5c:      	ldr	x0, [x29, #0x560]
     e60:      	ldr	w1, [x0]
     e64:      	cmp	x1, #0x0
     e68:      	b.eq	0xe9c <_stogir.verify.integer-operations-target-structured+0x4f4>
     e6c:      	cmp	x1, #0x1
     e70:      	b.eq	0xe7c <_stogir.verify.integer-operations-target-structured+0x4d4>
     e74:      	b	0xe78 <_stogir.verify.integer-operations-target-structured+0x4d0>
     e78:      	b	0x1914 <_stogir.verify.integer-operations-target-structured+0xf6c>
     e7c:      	add	x1, x0, #0x8
     e80:      	ldr	q0, [x1]
     e84:      	str	q0, [x29, #0x210]
     e88:      	ldr	q0, [x29, #0x210]
     e8c:      	str	q0, [x29, #0xa0]
     e90:      	ldr	x1, [x29, #0x550]
     e94:      	str	x1, [x29, #0x558]
     e98:      	b	0xeb4 <_stogir.verify.integer-operations-target-structured+0x50c>
     e9c:      	ldr	x0, [x29, #0x560]
     ea0:      	ldrsw	x0, [x0, #0x8]
     ea4:      	ldr	x0, [x29, #0x550]
     ea8:      	add	x1, x0, #0x1
     eac:      	sxtw	x1, w1
     eb0:      	str	x1, [x29, #0x558]
     eb4:      	ldr	x0, [x29, #0x558]
     eb8:      	str	x0, [x29, #0x560]
     ebc:      	b	0xec8 <_stogir.verify.integer-operations-target-structured+0x520>
     ec0:      	ldr	x0, [x29, #0x550]
     ec4:      	str	x0, [x29, #0x560]
     ec8:      	mov	x0, x21
     ecc:      	bl	0xecc <_stogir.verify.integer-operations-target-structured+0x524>
		0000000000000ecc:  ARM64_RELOC_BRANCH26	_stogir.atomic.operation?
     ed0:      	cbz	x0, 0xf48 <_stogir.verify.integer-operations-target-structured+0x5a0>
     ed4:      	sxtw	x0, w19
     ed8:      	add	x8, x29, #0x220
     edc:      	mov	x9, x0
     ee0:      	ldr	x0, [x29, #0x3e8]
     ee4:      	mov	x1, x9
     ee8:      	bl	0xee8 <_stogir.verify.integer-operations-target-structured+0x540>
		0000000000000ee8:  ARM64_RELOC_BRANCH26	_stogir.atomic.validate
     eec:      	ldr	w0, [x29, #0x220]
     ef0:      	cmp	x0, #0x0
     ef4:      	b.eq	0xf28 <_stogir.verify.integer-operations-target-structured+0x580>
     ef8:      	cmp	x0, #0x1
     efc:      	b.eq	0xf08 <_stogir.verify.integer-operations-target-structured+0x560>
     f00:      	b	0xf04 <_stogir.verify.integer-operations-target-structured+0x55c>
     f04:      	b	0x1918 <_stogir.verify.integer-operations-target-structured+0xf70>
     f08:      	mov	w16, #0x228             ; =552
     f0c:      	ldr	q0, [x29, x16]
     f10:      	str	q0, [x29, #0x240]
     f14:      	ldr	q0, [x29, #0x240]
     f18:      	str	q0, [x29, #0xa0]
     f1c:      	ldr	x0, [x29, #0x560]
     f20:      	str	x0, [x29, #0x550]
     f24:      	b	0xf3c <_stogir.verify.integer-operations-target-structured+0x594>
     f28:      	ldrsw	x0, [x29, #0x228]
     f2c:      	ldr	x0, [x29, #0x560]
     f30:      	add	x1, x0, #0x1
     f34:      	sxtw	x1, w1
     f38:      	str	x1, [x29, #0x550]
     f3c:      	ldr	x0, [x29, #0x550]
     f40:      	str	x0, [x29, #0x558]
     f44:      	b	0xf50 <_stogir.verify.integer-operations-target-structured+0x5a8>
     f48:      	ldr	x0, [x29, #0x560]
     f4c:      	str	x0, [x29, #0x558]
     f50:      	mov	x0, x21
     f54:      	bl	0xf54 <_stogir.verify.integer-operations-target-structured+0x5ac>
		0000000000000f54:  ARM64_RELOC_BRANCH26	_stogir.terminal.operation?
     f58:      	cbz	x0, 0xfd0 <_stogir.verify.integer-operations-target-structured+0x628>
     f5c:      	sxtw	x0, w19
     f60:      	add	x8, x29, #0x250
     f64:      	mov	x9, x0
     f68:      	ldr	x0, [x29, #0x3e8]
     f6c:      	mov	x1, x9
     f70:      	bl	0xf70 <_stogir.verify.integer-operations-target-structured+0x5c8>
		0000000000000f70:  ARM64_RELOC_BRANCH26	_stogir.terminal.validate
     f74:      	ldr	w0, [x29, #0x250]
     f78:      	cmp	x0, #0x0
     f7c:      	b.eq	0xfb0 <_stogir.verify.integer-operations-target-structured+0x608>
     f80:      	cmp	x0, #0x1
     f84:      	b.eq	0xf90 <_stogir.verify.integer-operations-target-structured+0x5e8>
     f88:      	b	0xf8c <_stogir.verify.integer-operations-target-structured+0x5e4>
     f8c:      	b	0x191c <_stogir.verify.integer-operations-target-structured+0xf74>
     f90:      	mov	w16, #0x258             ; =600
     f94:      	ldr	q0, [x29, x16]
     f98:      	str	q0, [x29, #0x270]
     f9c:      	ldr	q0, [x29, #0x270]
     fa0:      	str	q0, [x29, #0xa0]
     fa4:      	ldr	x0, [x29, #0x558]
     fa8:      	str	x0, [x29, #0x560]
     fac:      	b	0xfc4 <_stogir.verify.integer-operations-target-structured+0x61c>
     fb0:      	ldrsw	x0, [x29, #0x258]
     fb4:      	ldr	x0, [x29, #0x558]
     fb8:      	add	x1, x0, #0x1
     fbc:      	sxtw	x1, w1
     fc0:      	str	x1, [x29, #0x560]
     fc4:      	ldr	x0, [x29, #0x560]
     fc8:      	str	x0, [x29, #0x550]
     fcc:      	b	0xfd8 <_stogir.verify.integer-operations-target-structured+0x630>
     fd0:      	ldr	x0, [x29, #0x558]
     fd4:      	str	x0, [x29, #0x550]
     fd8:      	mov	x0, x21
     fdc:      	bl	0xfdc <_stogir.verify.integer-operations-target-structured+0x634>
		0000000000000fdc:  ARM64_RELOC_BRANCH26	_stogir.switch.operation?
     fe0:      	cbz	x0, 0x1058 <_stogir.verify.integer-operations-target-structured+0x6b0>
     fe4:      	sxtw	x0, w19
     fe8:      	add	x8, x29, #0x280
     fec:      	mov	x9, x0
     ff0:      	ldr	x0, [x29, #0x3e8]
     ff4:      	mov	x1, x9
     ff8:      	bl	0xff8 <_stogir.verify.integer-operations-target-structured+0x650>
		0000000000000ff8:  ARM64_RELOC_BRANCH26	_stogir.switch.validate
     ffc:      	ldr	w0, [x29, #0x280]
    1000:      	cmp	x0, #0x0
    1004:      	b.eq	0x1038 <_stogir.verify.integer-operations-target-structured+0x690>
    1008:      	cmp	x0, #0x1
    100c:      	b.eq	0x1018 <_stogir.verify.integer-operations-target-structured+0x670>
    1010:      	b	0x1014 <_stogir.verify.integer-operations-target-structured+0x66c>
    1014:      	b	0x1920 <_stogir.verify.integer-operations-target-structured+0xf78>
    1018:      	mov	w16, #0x288             ; =648
    101c:      	ldr	q0, [x29, x16]
    1020:      	str	q0, [x29, #0x2a0]
    1024:      	ldr	q0, [x29, #0x2a0]
    1028:      	str	q0, [x29, #0xa0]
    102c:      	ldr	x0, [x29, #0x550]
    1030:      	str	x0, [x29, #0x558]
    1034:      	b	0x104c <_stogir.verify.integer-operations-target-structured+0x6a4>
    1038:      	ldrsw	x0, [x29, #0x288]
    103c:      	ldr	x0, [x29, #0x550]
    1040:      	add	x1, x0, #0x1
    1044:      	sxtw	x1, w1
    1048:      	str	x1, [x29, #0x558]
    104c:      	ldr	x0, [x29, #0x558]
    1050:      	str	x0, [x29, #0x560]
    1054:      	b	0x1060 <_stogir.verify.integer-operations-target-structured+0x6b8>
    1058:      	ldr	x0, [x29, #0x550]
    105c:      	str	x0, [x29, #0x560]
    1060:      	mov	x0, x21
    1064:      	bl	0x1064 <_stogir.verify.integer-operations-target-structured+0x6bc>
		0000000000001064:  ARM64_RELOC_BRANCH26	_stogir.stack.operation?
    1068:      	cbz	x0, 0x10e0 <_stogir.verify.integer-operations-target-structured+0x738>
    106c:      	sxtw	x0, w19
    1070:      	add	x8, x29, #0x2b0
    1074:      	mov	x9, x0
    1078:      	ldr	x0, [x29, #0x3e8]
    107c:      	mov	x1, x9
    1080:      	bl	0x1080 <_stogir.verify.integer-operations-target-structured+0x6d8>
		0000000000001080:  ARM64_RELOC_BRANCH26	_stogir.stack.validate
    1084:      	ldr	w0, [x29, #0x2b0]
    1088:      	cmp	x0, #0x0
    108c:      	b.eq	0x10c0 <_stogir.verify.integer-operations-target-structured+0x718>
    1090:      	cmp	x0, #0x1
    1094:      	b.eq	0x10a0 <_stogir.verify.integer-operations-target-structured+0x6f8>
    1098:      	b	0x109c <_stogir.verify.integer-operations-target-structured+0x6f4>
    109c:      	b	0x1924 <_stogir.verify.integer-operations-target-structured+0xf7c>
    10a0:      	mov	w16, #0x2b8             ; =696
    10a4:      	ldr	q0, [x29, x16]
    10a8:      	str	q0, [x29, #0x2d0]
    10ac:      	ldr	q0, [x29, #0x2d0]
    10b0:      	str	q0, [x29, #0xa0]
    10b4:      	ldr	x0, [x29, #0x560]
    10b8:      	str	x0, [x29, #0x550]
    10bc:      	b	0x10d4 <_stogir.verify.integer-operations-target-structured+0x72c>
    10c0:      	ldrsw	x0, [x29, #0x2b8]
    10c4:      	ldr	x0, [x29, #0x560]
    10c8:      	add	x1, x0, #0x1
    10cc:      	sxtw	x1, w1
    10d0:      	str	x1, [x29, #0x550]
    10d4:      	ldr	x0, [x29, #0x550]
    10d8:      	str	x0, [x29, #0x558]
    10dc:      	b	0x10e8 <_stogir.verify.integer-operations-target-structured+0x740>
    10e0:      	ldr	x0, [x29, #0x560]
    10e4:      	str	x0, [x29, #0x558]
    10e8:      	mov	x0, x21
    10ec:      	bl	0x10ec <_stogir.verify.integer-operations-target-structured+0x744>
		00000000000010ec:  ARM64_RELOC_BRANCH26	_stogir.locals.operation?
    10f0:      	cbz	x0, 0x116c <_stogir.verify.integer-operations-target-structured+0x7c4>
    10f4:      	sxtw	x0, w19
    10f8:      	add	x8, x29, #0x2e0
    10fc:      	mov	x9, x0
    1100:      	ldr	x0, [x29, #0x3e8]
    1104:      	mov	x1, x9
    1108:      	ldr	x2, [x29, #0x378]
    110c:      	bl	0x110c <_stogir.verify.integer-operations-target-structured+0x764>
		000000000000110c:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    1110:      	ldr	w0, [x29, #0x2e0]
    1114:      	cmp	x0, #0x0
    1118:      	b.eq	0x114c <_stogir.verify.integer-operations-target-structured+0x7a4>
    111c:      	cmp	x0, #0x1
    1120:      	b.eq	0x112c <_stogir.verify.integer-operations-target-structured+0x784>
    1124:      	b	0x1128 <_stogir.verify.integer-operations-target-structured+0x780>
    1128:      	b	0x1928 <_stogir.verify.integer-operations-target-structured+0xf80>
    112c:      	mov	w16, #0x2e8             ; =744
    1130:      	ldr	q0, [x29, x16]
    1134:      	str	q0, [x29, #0x300]
    1138:      	ldr	q0, [x29, #0x300]
    113c:      	str	q0, [x29, #0xa0]
    1140:      	ldr	x0, [x29, #0x558]
    1144:      	str	x0, [x29, #0x560]
    1148:      	b	0x1160 <_stogir.verify.integer-operations-target-structured+0x7b8>
    114c:      	ldrsw	x0, [x29, #0x2e8]
    1150:      	ldr	x0, [x29, #0x558]
    1154:      	add	x1, x0, #0x1
    1158:      	sxtw	x1, w1
    115c:      	str	x1, [x29, #0x560]
    1160:      	ldr	x0, [x29, #0x560]
    1164:      	str	x0, [x29, #0x550]
    1168:      	b	0x1174 <_stogir.verify.integer-operations-target-structured+0x7cc>
    116c:      	ldr	x0, [x29, #0x558]
    1170:      	str	x0, [x29, #0x550]
    1174:      	mov	x0, x21
    1178:      	bl	0x1178 <_stogir.verify.integer-operations-target-structured+0x7d0>
		0000000000001178:  ARM64_RELOC_BRANCH26	_stogir.conversion.operation?
    117c:      	cbz	x0, 0x11f8 <_stogir.verify.integer-operations-target-structured+0x850>
    1180:      	sxtw	x0, w19
    1184:      	add	x8, x29, #0x310
    1188:      	mov	x9, x0
    118c:      	ldr	x0, [x29, #0x3e8]
    1190:      	mov	x1, x9
    1194:      	ldr	x2, [x29, #0x378]
    1198:      	bl	0x1198 <_stogir.verify.integer-operations-target-structured+0x7f0>
		0000000000001198:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    119c:      	ldr	w0, [x29, #0x310]
    11a0:      	cmp	x0, #0x0
    11a4:      	b.eq	0x11d8 <_stogir.verify.integer-operations-target-structured+0x830>
    11a8:      	cmp	x0, #0x1
    11ac:      	b.eq	0x11b8 <_stogir.verify.integer-operations-target-structured+0x810>
    11b0:      	b	0x11b4 <_stogir.verify.integer-operations-target-structured+0x80c>
    11b4:      	b	0x192c <_stogir.verify.integer-operations-target-structured+0xf84>
    11b8:      	mov	w16, #0x318             ; =792
    11bc:      	ldr	q0, [x29, x16]
    11c0:      	str	q0, [x29, #0x330]
    11c4:      	ldr	q0, [x29, #0x330]
    11c8:      	str	q0, [x29, #0xa0]
    11cc:      	ldr	x0, [x29, #0x550]
    11d0:      	str	x0, [x29, #0x558]
    11d4:      	b	0x11ec <_stogir.verify.integer-operations-target-structured+0x844>
    11d8:      	ldrsw	x0, [x29, #0x318]
    11dc:      	ldr	x0, [x29, #0x550]
    11e0:      	add	x1, x0, #0x1
    11e4:      	sxtw	x1, w1
    11e8:      	str	x1, [x29, #0x558]
    11ec:      	ldr	x0, [x29, #0x558]
    11f0:      	str	x0, [x29, #0x560]
    11f4:      	b	0x1200 <_stogir.verify.integer-operations-target-structured+0x858>
    11f8:      	ldr	x0, [x29, #0x550]
    11fc:      	str	x0, [x29, #0x560]
    1200:      	cmp	x21, #0x3c
    1204:      	b.ne	0x127c <_stogir.verify.integer-operations-target-structured+0x8d4>
    1208:      	sxtw	x0, w19
    120c:      	add	x8, x29, #0x340
    1210:      	mov	x9, x0
    1214:      	ldr	x0, [x29, #0x3e8]
    1218:      	mov	x1, x9
    121c:      	bl	0x121c <_stogir.verify.integer-operations-target-structured+0x874>
		000000000000121c:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    1220:      	ldr	w0, [x29, #0x340]
    1224:      	cmp	x0, #0x0
    1228:      	b.eq	0x125c <_stogir.verify.integer-operations-target-structured+0x8b4>
    122c:      	cmp	x0, #0x1
    1230:      	b.eq	0x123c <_stogir.verify.integer-operations-target-structured+0x894>
    1234:      	b	0x1238 <_stogir.verify.integer-operations-target-structured+0x890>
    1238:      	b	0x1930 <_stogir.verify.integer-operations-target-structured+0xf88>
    123c:      	mov	w16, #0x348             ; =840
    1240:      	ldr	q0, [x29, x16]
    1244:      	str	q0, [x29, #0x360]
    1248:      	ldr	q0, [x29, #0x360]
    124c:      	str	q0, [x29, #0xa0]
    1250:      	ldr	x0, [x29, #0x560]
    1254:      	str	x0, [x29, #0x550]
    1258:      	b	0x1270 <_stogir.verify.integer-operations-target-structured+0x8c8>
    125c:      	ldrsw	x0, [x29, #0x348]
    1260:      	ldr	x0, [x29, #0x560]
    1264:      	add	x1, x0, #0x1
    1268:      	sxtw	x1, w1
    126c:      	str	x1, [x29, #0x550]
    1270:      	ldr	x0, [x29, #0x550]
    1274:      	str	x0, [x29, #0x558]
    1278:      	b	0x1284 <_stogir.verify.integer-operations-target-structured+0x8dc>
    127c:      	ldr	x0, [x29, #0x560]
    1280:      	str	x0, [x29, #0x558]
    1284:      	cmp	x21, #0x78
    1288:      	b.ne	0x13d4 <_stogir.verify.integer-operations-target-structured+0xa2c>
    128c:      	add	x0, x29, #0xe0
    1290:      	bl	0x1290 <_stogir.verify.integer-operations-target-structured+0x8e8>
		0000000000001290:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    1294:      	ubfx	x0, x0, #0, #8
    1298:      	cmp	x0, #0x0
    129c:      	b.ne	0x12f4 <_stogir.verify.integer-operations-target-structured+0x94c>
    12a0:      	str	wzr, [x29, #0x370]
    12a4:      	ldrsw	x0, [x29, #0xe8]
    12a8:      	ldrsw	x1, [x29, #0x370]
    12ac:      	cmp	x0, x1
    12b0:      	b.ne	0x12c0 <_stogir.verify.integer-operations-target-structured+0x918>
    12b4:      	mov	w0, #0x0                ; =0
    12b8:      	str	x0, [x29, #0x560]
    12bc:      	b	0x12c8 <_stogir.verify.integer-operations-target-structured+0x920>
    12c0:      	mov	w0, #0x1                ; =1
    12c4:      	str	x0, [x29, #0x560]
    12c8:      	ldr	x0, [x29, #0x560]
    12cc:      	cbz	x0, 0x12f0 <_stogir.verify.integer-operations-target-structured+0x948>
    12d0:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		00000000000012d0:  ARM64_RELOC_PAGE21	l_cstr.65
    12d4:      	add	x0, x0, #0x0
		00000000000012d4:  ARM64_RELOC_PAGEOFF12	l_cstr.65
    12d8:      	str	x0, [x29, #0x380]
    12dc:      	mov	w0, #0x1f               ; =31
    12e0:      	str	x0, [x29, #0x388]
    12e4:      	ldr	q0, [x29, #0x380]
    12e8:      	str	q0, [x29, #0xa0]
    12ec:      	b	0x12f0 <_stogir.verify.integer-operations-target-structured+0x948>
    12f0:      	b	0x13c0 <_stogir.verify.integer-operations-target-structured+0xa18>
    12f4:      	ldrsw	x0, [x29, #0xe8]
    12f8:      	add	x8, x29, #0x390
    12fc:      	mov	x9, x0
    1300:      	ldr	x0, [x29, #0x3e8]
    1304:      	mov	x1, x9
    1308:      	bl	0x1308 <_stogir.verify.integer-operations-target-structured+0x960>
		0000000000001308:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    130c:      	ldr	w0, [x29, #0x390]
    1310:      	cmp	x0, #0x0
    1314:      	b.eq	0x1328 <_stogir.verify.integer-operations-target-structured+0x980>
    1318:      	cmp	x0, #0x1
    131c:      	b.eq	0x1348 <_stogir.verify.integer-operations-target-structured+0x9a0>
    1320:      	b	0x1324 <_stogir.verify.integer-operations-target-structured+0x97c>
    1324:      	b	0x1934 <_stogir.verify.integer-operations-target-structured+0xf8c>
    1328:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		0000000000001328:  ARM64_RELOC_PAGE21	l_cstr.66
    132c:      	add	x0, x0, #0x0
		000000000000132c:  ARM64_RELOC_PAGEOFF12	l_cstr.66
    1330:      	str	x0, [x29, #0x3c0]
    1334:      	mov	w0, #0x14               ; =20
    1338:      	str	x0, [x29, #0x3c8]
    133c:      	ldr	q0, [x29, #0x3c0]
    1340:      	str	q0, [x29, #0xa0]
    1344:      	b	0x13c0 <_stogir.verify.integer-operations-target-structured+0xa18>
    1348:      	mov	w16, #0x398             ; =920
    134c:      	ldr	q0, [x29, x16]
    1350:      	str	q0, [x29, #0x3d0]
    1354:      	add	x0, x29, #0x3d0
    1358:      	bl	0x1358 <_stogir.verify.integer-operations-target-structured+0x9b0>
		0000000000001358:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    135c:      	ubfx	x0, x0, #0, #8
    1360:      	strb	w0, [x29, #0x3e0]
    1364:      	add	x0, x29, #0xe0
    1368:      	bl	0x1368 <_stogir.verify.integer-operations-target-structured+0x9c0>
		0000000000001368:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    136c:      	ubfx	x0, x0, #0, #8
    1370:      	strb	w0, [x29, #0x3e1]
    1374:      	ldrb	w0, [x29, #0x3e0]
    1378:      	ldrb	w1, [x29, #0x3e1]
    137c:      	cmp	x0, x1
    1380:      	b.ne	0x1390 <_stogir.verify.integer-operations-target-structured+0x9e8>
    1384:      	mov	w0, #0x0                ; =0
    1388:      	str	x0, [x29, #0x560]
    138c:      	b	0x1398 <_stogir.verify.integer-operations-target-structured+0x9f0>
    1390:      	mov	w0, #0x1                ; =1
    1394:      	str	x0, [x29, #0x560]
    1398:      	ldr	x0, [x29, #0x560]
    139c:      	cbz	x0, 0x13c0 <_stogir.verify.integer-operations-target-structured+0xa18>
    13a0:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		00000000000013a0:  ARM64_RELOC_PAGE21	l_cstr.67
    13a4:      	add	x0, x0, #0x0
		00000000000013a4:  ARM64_RELOC_PAGEOFF12	l_cstr.67
    13a8:      	str	x0, [x29, #0x3f0]
    13ac:      	mov	w0, #0x1a               ; =26
    13b0:      	str	x0, [x29, #0x3f8]
    13b4:      	ldr	q0, [x29, #0x3f0]
    13b8:      	str	q0, [x29, #0xa0]
    13bc:      	b	0x13c0 <_stogir.verify.integer-operations-target-structured+0xa18>
    13c0:      	ldr	x0, [x29, #0x558]
    13c4:      	add	x1, x0, #0x1
    13c8:      	sxtw	x1, w1
    13cc:      	str	x1, [x29, #0x560]
    13d0:      	b	0x13dc <_stogir.verify.integer-operations-target-structured+0xa34>
    13d4:      	ldr	x0, [x29, #0x558]
    13d8:      	str	x0, [x29, #0x560]
    13dc:      	ldr	x0, [x29, #0x540]
    13e0:      	mov	x1, x0
    13e4:      	cbz	x1, 0x1458 <_stogir.verify.integer-operations-target-structured+0xab0>
    13e8:      	sxtw	x1, w19
    13ec:      	add	x8, x29, #0x400
    13f0:      	mov	x9, x0
    13f4:      	ldr	x0, [x29, #0x3e8]
    13f8:      	bl	0x13f8 <_stogir.verify.integer-operations-target-structured+0xa50>
		00000000000013f8:  ARM64_RELOC_BRANCH26	_stogir.floating.validate
    13fc:      	ldr	w0, [x29, #0x400]
    1400:      	cmp	x0, #0x0
    1404:      	b.eq	0x1438 <_stogir.verify.integer-operations-target-structured+0xa90>
    1408:      	cmp	x0, #0x1
    140c:      	b.eq	0x1418 <_stogir.verify.integer-operations-target-structured+0xa70>
    1410:      	b	0x1414 <_stogir.verify.integer-operations-target-structured+0xa6c>
    1414:      	b	0x1938 <_stogir.verify.integer-operations-target-structured+0xf90>
    1418:      	mov	w16, #0x408             ; =1032
    141c:      	ldr	q0, [x29, x16]
    1420:      	str	q0, [x29, #0x420]
    1424:      	ldr	q0, [x29, #0x420]
    1428:      	str	q0, [x29, #0xa0]
    142c:      	ldr	x0, [x29, #0x560]
    1430:      	str	x0, [x29, #0x558]
    1434:      	b	0x144c <_stogir.verify.integer-operations-target-structured+0xaa4>
    1438:      	ldrsw	x0, [x29, #0x408]
    143c:      	ldr	x0, [x29, #0x560]
    1440:      	add	x1, x0, #0x1
    1444:      	sxtw	x1, w1
    1448:      	str	x1, [x29, #0x558]
    144c:      	ldr	x0, [x29, #0x558]
    1450:      	str	x0, [x29, #0x550]
    1454:      	b	0x1460 <_stogir.verify.integer-operations-target-structured+0xab8>
    1458:      	ldr	x0, [x29, #0x560]
    145c:      	str	x0, [x29, #0x550]
    1460:      	ldr	x0, [x29, #0x548]
    1464:      	cbz	x0, 0x1474 <_stogir.verify.integer-operations-target-structured+0xacc>
    1468:      	mov	w0, #0x0                ; =0
    146c:      	str	x0, [x29, #0x548]
    1470:      	b	0x147c <_stogir.verify.integer-operations-target-structured+0xad4>
    1474:      	mov	w0, #0x1                ; =1
    1478:      	str	x0, [x29, #0x548]
    147c:      	ldr	x0, [x29, #0x548]
    1480:      	cbz	x0, 0x1500 <_stogir.verify.integer-operations-target-structured+0xb58>
    1484:      	ldr	x0, [x29, #0x540]
    1488:      	cbz	x0, 0x1498 <_stogir.verify.integer-operations-target-structured+0xaf0>
    148c:      	mov	w0, #0x0                ; =0
    1490:      	str	x0, [x29, #0x540]
    1494:      	b	0x14a0 <_stogir.verify.integer-operations-target-structured+0xaf8>
    1498:      	mov	w0, #0x1                ; =1
    149c:      	str	x0, [x29, #0x540]
    14a0:      	ldr	x0, [x29, #0x540]
    14a4:      	cbz	x0, 0x14ec <_stogir.verify.integer-operations-target-structured+0xb44>
    14a8:      	cbz	x23, 0x14b8 <_stogir.verify.integer-operations-target-structured+0xb10>
    14ac:      	mov	w0, #0x1                ; =1
    14b0:      	str	x0, [x29, #0x540]
    14b4:      	b	0x14e0 <_stogir.verify.integer-operations-target-structured+0xb38>
    14b8:      	ldr	x0, [x29, #0x530]
    14bc:      	mov	x1, x0
    14c0:      	cbz	x1, 0x14d0 <_stogir.verify.integer-operations-target-structured+0xb28>
    14c4:      	mov	w1, #0x1                ; =1
    14c8:      	str	x1, [x29, #0x548]
    14cc:      	b	0x14d8 <_stogir.verify.integer-operations-target-structured+0xb30>
    14d0:      	ldr	x0, [x29, #0x538]
    14d4:      	str	x0, [x29, #0x548]
    14d8:      	ldr	x0, [x29, #0x548]
    14dc:      	str	x0, [x29, #0x540]
    14e0:      	ldr	x0, [x29, #0x540]
    14e4:      	str	x0, [x29, #0x548]
    14e8:      	b	0x14f4 <_stogir.verify.integer-operations-target-structured+0xb4c>
    14ec:      	mov	w0, #0x0                ; =0
    14f0:      	str	x0, [x29, #0x548]
    14f4:      	ldr	x0, [x29, #0x548]
    14f8:      	str	x0, [x29, #0x540]
    14fc:      	b	0x1508 <_stogir.verify.integer-operations-target-structured+0xb60>
    1500:      	mov	w0, #0x0                ; =0
    1504:      	str	x0, [x29, #0x540]
    1508:      	ldr	x0, [x29, #0x540]
    150c:      	cbz	x0, 0x18e8 <_stogir.verify.integer-operations-target-structured+0xf40>
    1510:      	sxtw	x0, w19
    1514:      	mov	x9, x0
    1518:      	ldr	x0, [x29, #0x3e8]
    151c:      	mov	x1, x9
    1520:      	mov	w2, #0x1                ; =1
    1524:      	bl	0x1524 <_stogir.verify.integer-operations-target-structured+0xb7c>
		0000000000001524:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    1528:      	str	x0, [x29, #0x430]
    152c:      	str	x1, [x29, #0x438]
    1530:      	ldr	w0, [x29, #0x430]
    1534:      	cmp	x0, #0x0
    1538:      	b.eq	0x154c <_stogir.verify.integer-operations-target-structured+0xba4>
    153c:      	cmp	x0, #0x1
    1540:      	b.eq	0x156c <_stogir.verify.integer-operations-target-structured+0xbc4>
    1544:      	b	0x1548 <_stogir.verify.integer-operations-target-structured+0xba0>
    1548:      	b	0x1940 <_stogir.verify.integer-operations-target-structured+0xf98>
    154c:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		000000000000154c:  ARM64_RELOC_PAGE21	l_cstr.68
    1550:      	add	x0, x0, #0x0
		0000000000001550:  ARM64_RELOC_PAGEOFF12	l_cstr.68
    1554:      	str	x0, [x29, #0x440]
    1558:      	mov	w0, #0x17               ; =23
    155c:      	str	x0, [x29, #0x448]
    1560:      	ldr	q0, [x29, #0x440]
    1564:      	str	q0, [x29, #0xa0]
    1568:      	b	0x18d4 <_stogir.verify.integer-operations-target-structured+0xf2c>
    156c:      	ldrsw	x0, [x29, #0x438]
    1570:      	mov	x9, x0
    1574:      	ldr	x0, [x29, #0x3e8]
    1578:      	mov	x1, x9
    157c:      	bl	0x157c <_stogir.verify.integer-operations-target-structured+0xbd4>
		000000000000157c:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    1580:      	cmp	x0, #0x0
    1584:      	str	x0, [x29, #0x540]
    1588:      	b.ne	0x15ac <_stogir.verify.integer-operations-target-structured+0xc04>
    158c:      	adrp	x1, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		000000000000158c:  ARM64_RELOC_PAGE21	l_cstr.68
    1590:      	add	x1, x1, #0x0
		0000000000001590:  ARM64_RELOC_PAGEOFF12	l_cstr.68
    1594:      	str	x1, [x29, #0x450]
    1598:      	mov	w1, #0x17               ; =23
    159c:      	str	x1, [x29, #0x458]
    15a0:      	ldr	q0, [x29, #0x450]
    15a4:      	str	q0, [x29, #0xa0]
    15a8:      	b	0x18d4 <_stogir.verify.integer-operations-target-structured+0xf2c>
    15ac:      	ldr	x0, [x29, #0x540]
    15b0:      	bl	0x15b0 <_stogir.verify.integer-operations-target-structured+0xc08>
		00000000000015b0:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    15b4:      	ubfx	x0, x0, #0, #8
    15b8:      	sxtw	x0, w0
    15bc:      	mov	x9, x0
    15c0:      	add	x0, x29, #0xe0
    15c4:      	str	x9, [x29, #0x540]
    15c8:      	bl	0x15c8 <_stogir.verify.integer-operations-target-structured+0xc20>
		00000000000015c8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    15cc:      	ubfx	x0, x0, #0, #8
    15d0:      	cmp	x0, #0x6
    15d4:      	b.ne	0x1624 <_stogir.verify.integer-operations-target-structured+0xc7c>
    15d8:      	ldr	x0, [x29, #0x540]
    15dc:      	cmp	x0, #0x6
    15e0:      	b.ne	0x1610 <_stogir.verify.integer-operations-target-structured+0xc68>
    15e4:      	cmp	x21, #0x1a
    15e8:      	b.ne	0x15f8 <_stogir.verify.integer-operations-target-structured+0xc50>
    15ec:      	mov	w1, #0x1                ; =1
    15f0:      	str	x1, [x29, #0x548]
    15f4:      	b	0x1604 <_stogir.verify.integer-operations-target-structured+0xc5c>
    15f8:      	cmp	x21, #0x1b
    15fc:      	cset	x0, eq
    1600:      	str	x0, [x29, #0x548]
    1604:      	ldr	x0, [x29, #0x548]
    1608:      	str	x0, [x29, #0x560]
    160c:      	b	0x1618 <_stogir.verify.integer-operations-target-structured+0xc70>
    1610:      	mov	w0, #0x0                ; =0
    1614:      	str	x0, [x29, #0x560]
    1618:      	ldr	x0, [x29, #0x560]
    161c:      	str	x0, [x29, #0x548]
    1620:      	b	0x162c <_stogir.verify.integer-operations-target-structured+0xc84>
    1624:      	mov	w0, #0x0                ; =0
    1628:      	str	x0, [x29, #0x548]
    162c:      	ldr	x0, [x29, #0x540]
    1630:      	bl	0x1630 <_stogir.verify.integer-operations-target-structured+0xc88>
		0000000000001630:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    1634:      	cbz	x0, 0x1644 <_stogir.verify.integer-operations-target-structured+0xc9c>
    1638:      	mov	w0, #0x0                ; =0
    163c:      	str	x0, [x29, #0x560]
    1640:      	b	0x164c <_stogir.verify.integer-operations-target-structured+0xca4>
    1644:      	mov	w0, #0x1                ; =1
    1648:      	str	x0, [x29, #0x560]
    164c:      	ldr	x0, [x29, #0x560]
    1650:      	cbz	x0, 0x1660 <_stogir.verify.integer-operations-target-structured+0xcb8>
    1654:      	mov	w0, #0x1                ; =1
    1658:      	str	x0, [x29, #0x560]
    165c:      	b	0x1700 <_stogir.verify.integer-operations-target-structured+0xd58>
    1660:      	ldr	x0, [x29, #0x538]
    1664:      	cbz	x0, 0x1698 <_stogir.verify.integer-operations-target-structured+0xcf0>
    1668:      	mov	x0, x21
    166c:      	ldr	x1, [x29, #0x540]
    1670:      	bl	0x1670 <_stogir.verify.integer-operations-target-structured+0xcc8>
		0000000000001670:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    1674:      	cbz	x0, 0x1684 <_stogir.verify.integer-operations-target-structured+0xcdc>
    1678:      	mov	w0, #0x0                ; =0
    167c:      	str	x0, [x29, #0x538]
    1680:      	b	0x168c <_stogir.verify.integer-operations-target-structured+0xce4>
    1684:      	mov	w0, #0x1                ; =1
    1688:      	str	x0, [x29, #0x538]
    168c:      	ldr	x0, [x29, #0x538]
    1690:      	str	x0, [x29, #0x558]
    1694:      	b	0x16a0 <_stogir.verify.integer-operations-target-structured+0xcf8>
    1698:      	mov	w0, #0x0                ; =0
    169c:      	str	x0, [x29, #0x558]
    16a0:      	ldr	x0, [x29, #0x558]
    16a4:      	cbz	x0, 0x16b4 <_stogir.verify.integer-operations-target-structured+0xd0c>
    16a8:      	mov	w0, #0x1                ; =1
    16ac:      	str	x0, [x29, #0x558]
    16b0:      	b	0x16f8 <_stogir.verify.integer-operations-target-structured+0xd50>
    16b4:      	ldr	x0, [x29, #0x530]
    16b8:      	mov	x1, x0
    16bc:      	cbz	x1, 0x16e8 <_stogir.verify.integer-operations-target-structured+0xd40>
    16c0:      	mov	x9, x0
    16c4:      	mov	x0, x21
    16c8:      	ldr	x1, [x29, #0x540]
    16cc:      	bl	0x16cc <_stogir.verify.integer-operations-target-structured+0xd24>
		00000000000016cc:  ARM64_RELOC_BRANCH26	_stogir.integer-binary.valid-type?
    16d0:      	cbz	x0, 0x16dc <_stogir.verify.integer-operations-target-structured+0xd34>
    16d4:      	mov	w21, #0x0               ; =0
    16d8:      	b	0x16e0 <_stogir.verify.integer-operations-target-structured+0xd38>
    16dc:      	mov	w21, #0x1               ; =1
    16e0:      	str	x21, [x29, #0x538]
    16e4:      	b	0x16f0 <_stogir.verify.integer-operations-target-structured+0xd48>
    16e8:      	mov	w0, #0x0                ; =0
    16ec:      	str	x0, [x29, #0x538]
    16f0:      	ldr	x0, [x29, #0x538]
    16f4:      	str	x0, [x29, #0x558]
    16f8:      	ldr	x0, [x29, #0x558]
    16fc:      	str	x0, [x29, #0x560]
    1700:      	ldr	x0, [x29, #0x560]
    1704:      	cbz	x0, 0x1728 <_stogir.verify.integer-operations-target-structured+0xd80>
    1708:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		0000000000001708:  ARM64_RELOC_PAGE21	l_cstr.69
    170c:      	add	x0, x0, #0x0
		000000000000170c:  ARM64_RELOC_PAGEOFF12	l_cstr.69
    1710:      	str	x0, [x29, #0x460]
    1714:      	mov	w0, #0x1c               ; =28
    1718:      	str	x0, [x29, #0x468]
    171c:      	ldr	q0, [x29, #0x460]
    1720:      	str	q0, [x29, #0xa0]
    1724:      	b	0x1728 <_stogir.verify.integer-operations-target-structured+0xd80>
    1728:      	add	x0, x29, #0xe0
    172c:      	bl	0x172c <_stogir.verify.integer-operations-target-structured+0xd84>
		000000000000172c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    1730:      	ubfx	x0, x0, #0, #8
    1734:      	sxtw	x0, w0
    1738:      	str	w0, [x29, #0x3e4]
    173c:      	cbz	x23, 0x1748 <_stogir.verify.integer-operations-target-structured+0xda0>
    1740:      	mov	w21, #0x1               ; =1
    1744:      	b	0x174c <_stogir.verify.integer-operations-target-structured+0xda4>
    1748:      	ldr	x21, [x29, #0x540]
    174c:      	str	w21, [x29, #0x374]
    1750:      	ldrsw	x0, [x29, #0x3e4]
    1754:      	ldrsw	x1, [x29, #0x374]
    1758:      	cmp	x0, x1
    175c:      	b.ne	0x1768 <_stogir.verify.integer-operations-target-structured+0xdc0>
    1760:      	mov	w21, #0x0               ; =0
    1764:      	b	0x176c <_stogir.verify.integer-operations-target-structured+0xdc4>
    1768:      	mov	w21, #0x1               ; =1
    176c:      	cbz	x21, 0x1790 <_stogir.verify.integer-operations-target-structured+0xde8>
    1770:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		0000000000001770:  ARM64_RELOC_PAGE21	l_cstr.70
    1774:      	add	x0, x0, #0x0
		0000000000001774:  ARM64_RELOC_PAGEOFF12	l_cstr.70
    1778:      	str	x0, [x29, #0x470]
    177c:      	mov	w0, #0x26               ; =38
    1780:      	str	x0, [x29, #0x478]
    1784:      	ldr	q0, [x29, #0x470]
    1788:      	str	q0, [x29, #0xa0]
    178c:      	b	0x1790 <_stogir.verify.integer-operations-target-structured+0xde8>
    1790:      	cbz	x23, 0x179c <_stogir.verify.integer-operations-target-structured+0xdf4>
    1794:      	mov	w21, #0x1               ; =1
    1798:      	b	0x17a0 <_stogir.verify.integer-operations-target-structured+0xdf8>
    179c:      	ldr	x21, [x29, #0x530]
    17a0:      	cbz	x21, 0x18d4 <_stogir.verify.integer-operations-target-structured+0xf2c>
    17a4:      	sxtw	x0, w19
    17a8:      	mov	x9, x0
    17ac:      	ldr	x0, [x29, #0x3e8]
    17b0:      	mov	x1, x9
    17b4:      	mov	w2, #0x2                ; =2
    17b8:      	bl	0x17b8 <_stogir.verify.integer-operations-target-structured+0xe10>
		00000000000017b8:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    17bc:      	str	x0, [x29, #0x480]
    17c0:      	str	x1, [x29, #0x488]
    17c4:      	ldr	w0, [x29, #0x480]
    17c8:      	cmp	x0, #0x0
    17cc:      	b.eq	0x17e0 <_stogir.verify.integer-operations-target-structured+0xe38>
    17d0:      	cmp	x0, #0x1
    17d4:      	b.eq	0x1800 <_stogir.verify.integer-operations-target-structured+0xe58>
    17d8:      	b	0x17dc <_stogir.verify.integer-operations-target-structured+0xe34>
    17dc:      	b	0x193c <_stogir.verify.integer-operations-target-structured+0xf94>
    17e0:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		00000000000017e0:  ARM64_RELOC_PAGE21	l_cstr.71
    17e4:      	add	x0, x0, #0x0
		00000000000017e4:  ARM64_RELOC_PAGEOFF12	l_cstr.71
    17e8:      	str	x0, [x29, #0x490]
    17ec:      	mov	w0, #0x1d               ; =29
    17f0:      	str	x0, [x29, #0x498]
    17f4:      	ldr	q0, [x29, #0x490]
    17f8:      	str	q0, [x29, #0xa0]
    17fc:      	b	0x18d0 <_stogir.verify.integer-operations-target-structured+0xf28>
    1800:      	ldrsw	x0, [x29, #0x488]
    1804:      	mov	x9, x0
    1808:      	ldr	x0, [x29, #0x3e8]
    180c:      	mov	x1, x9
    1810:      	bl	0x1810 <_stogir.verify.integer-operations-target-structured+0xe68>
		0000000000001810:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    1814:      	mov	x21, x0
    1818:      	cmp	x21, #0x0
    181c:      	b.ne	0x1840 <_stogir.verify.integer-operations-target-structured+0xe98>
    1820:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		0000000000001820:  ARM64_RELOC_PAGE21	l_cstr.71
    1824:      	add	x0, x0, #0x0
		0000000000001824:  ARM64_RELOC_PAGEOFF12	l_cstr.71
    1828:      	str	x0, [x29, #0x4a0]
    182c:      	mov	w0, #0x1d               ; =29
    1830:      	str	x0, [x29, #0x4a8]
    1834:      	ldr	q0, [x29, #0x4a0]
    1838:      	str	q0, [x29, #0xa0]
    183c:      	b	0x18d0 <_stogir.verify.integer-operations-target-structured+0xf28>
    1840:      	mov	x0, x21
    1844:      	bl	0x1844 <_stogir.verify.integer-operations-target-structured+0xe9c>
		0000000000001844:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    1848:      	ubfx	x0, x0, #0, #8
    184c:      	sxtw	x21, w0
    1850:      	ldr	x0, [x29, #0x540]
    1854:      	cmp	x0, x21
    1858:      	b.ne	0x1864 <_stogir.verify.integer-operations-target-structured+0xebc>
    185c:      	mov	w23, #0x1               ; =1
    1860:      	b	0x189c <_stogir.verify.integer-operations-target-structured+0xef4>
    1864:      	ldr	x0, [x29, #0x548]
    1868:      	cbz	x0, 0x1894 <_stogir.verify.integer-operations-target-structured+0xeec>
    186c:      	cmp	x21, #0x5
    1870:      	b.ne	0x1880 <_stogir.verify.integer-operations-target-structured+0xed8>
    1874:      	mov	w0, #0x1                ; =1
    1878:      	str	x0, [x29, #0x548]
    187c:      	b	0x188c <_stogir.verify.integer-operations-target-structured+0xee4>
    1880:      	cmp	x21, #0xb
    1884:      	cset	x0, eq
    1888:      	str	x0, [x29, #0x548]
    188c:      	ldr	x21, [x29, #0x548]
    1890:      	b	0x1898 <_stogir.verify.integer-operations-target-structured+0xef0>
    1894:      	mov	w21, #0x0               ; =0
    1898:      	mov	x23, x21
    189c:      	cbz	x23, 0x18a8 <_stogir.verify.integer-operations-target-structured+0xf00>
    18a0:      	mov	w21, #0x0               ; =0
    18a4:      	b	0x18ac <_stogir.verify.integer-operations-target-structured+0xf04>
    18a8:      	mov	w21, #0x1               ; =1
    18ac:      	cbz	x21, 0x18d0 <_stogir.verify.integer-operations-target-structured+0xf28>
    18b0:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		00000000000018b0:  ARM64_RELOC_PAGE21	l_cstr.72
    18b4:      	add	x0, x0, #0x0
		00000000000018b4:  ARM64_RELOC_PAGEOFF12	l_cstr.72
    18b8:      	str	x0, [x29, #0x4b0]
    18bc:      	mov	w0, #0x1d               ; =29
    18c0:      	str	x0, [x29, #0x4b8]
    18c4:      	ldr	q0, [x29, #0x4b0]
    18c8:      	str	q0, [x29, #0xa0]
    18cc:      	b	0x18d0 <_stogir.verify.integer-operations-target-structured+0xf28>
    18d0:      	b	0x18d4 <_stogir.verify.integer-operations-target-structured+0xf2c>
    18d4:      	ldr	x0, [x29, #0x550]
    18d8:      	add	x1, x0, #0x1
    18dc:      	sxtw	x1, w1
    18e0:      	mov	x21, x1
    18e4:      	b	0x18ec <_stogir.verify.integer-operations-target-structured+0xf44>
    18e8:      	ldr	x21, [x29, #0x550]
    18ec:      	add	x22, x22, #0x4
    18f0:      	mov	w0, #0x4                ; =4
    18f4:      	sdiv	x22, x22, x0
    18f8:      	add	x23, x19, x22
    18fc:      	mov	x19, x23
    1900:      	mov	x20, x21
    1904:      	b	0x9f0 <_stogir.verify.integer-operations-target-structured+0x48>
    1908:      	brk	#0x1
    190c:      	brk	#0x1
    1910:      	brk	#0x1
    1914:      	brk	#0x1
    1918:      	brk	#0x1
    191c:      	brk	#0x1
    1920:      	brk	#0x1
    1924:      	brk	#0x1
    1928:      	brk	#0x1
    192c:      	brk	#0x1
    1930:      	brk	#0x1
    1934:      	brk	#0x1
    1938:      	brk	#0x1
    193c:      	brk	#0x1
    1940:      	brk	#0x1
    1944:      	ldr	q0, [x29, #0xa0]
    1948:      	str	q0, [x29, #0x4c0]
    194c:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		000000000000194c:  ARM64_RELOC_PAGE21	l_cstr.51
    1950:      	add	x0, x0, #0x0
		0000000000001950:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    1954:      	str	x0, [x29, #0x4d0]
    1958:      	str	xzr, [x29, #0x4d8]
    195c:      	ldr	x0, [x29, #0x4c0]
    1960:      	ldr	x1, [x29, #0x4c8]
    1964:      	ldr	x2, [x29, #0x4d0]
    1968:      	ldr	x3, [x29, #0x4d8]
    196c:      	bl	0x196c <_stogir.verify.integer-operations-target-structured+0xfc4>
		000000000000196c:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    1970:      	cbz	x0, 0x1988 <_stogir.verify.integer-operations-target-structured+0xfe0>
    1974:      	str	wzr, [x29, #0x4e0]
    1978:      	str	w20, [x29, #0x4e8]
    197c:      	add	x0, x29, #0x4e0
    1980:      	str	x0, [x29, #0x378]
    1984:      	b	0x19ac <_stogir.verify.integer-operations-target-structured+0x1004>
    1988:      	mov	w0, #0x1                ; =1
    198c:      	str	w0, [x29, #0x500]
    1990:      	ldr	q0, [x29, #0xa0]
    1994:      	str	q0, [x29, #0x520]
    1998:      	ldr	q0, [x29, #0x520]
    199c:      	mov	w16, #0x508             ; =1288
    19a0:      	str	q0, [x29, x16]
    19a4:      	add	x0, x29, #0x500
    19a8:      	str	x0, [x29, #0x378]
    19ac:      	ldr	x0, [x29, #0x108]
    19b0:      	ldr	x1, [x29, #0x378]
    19b4:      	ldr	q0, [x1]
    19b8:      	str	q0, [x0]
    19bc:      	ldr	x2, [x1, #0x10]
    19c0:      	str	x2, [x0, #0x10]
    19c4:      	ldp	x19, x20, [sp, #0x10]
    19c8:      	ldp	x21, x22, [sp, #0x20]
    19cc:      	ldr	x23, [sp, #0x30]
    19d0:      	ldp	x29, x30, [sp]
    19d4:      	add	sp, sp, #0x570
    19d8:      	ret

00000000000019dc <_coil.core.Len$coil.arraylist.ArrayList$len__i32>:
    19dc:      	ldr	x0, [x0, #0x8]
    19e0:      	ret

00000000000019e4 <_coil.core.Eq$slice<u8>$=>:
    19e4:      	stp	x29, x30, [sp, #-0xe0]!
    19e8:      	mov	x29, sp
    19ec:      	stp	x19, x20, [sp, #0x10]
    19f0:      	str	x0, [x29, #0xa0]
    19f4:      	str	x1, [x29, #0xa8]
    19f8:      	str	x2, [x29, #0xb0]
    19fc:      	str	x3, [x29, #0xb8]
    1a00:      	ldr	x0, [x29, #0xa0]
    1a04:      	ldr	x1, [x29, #0xa8]
    1a08:      	bl	0x1a08 <_coil.core.Eq$slice<u8>$=+0x24>
		0000000000001a08:  ARM64_RELOC_BRANCH26	_coil.core.Len$slice$len__u8
    1a0c:      	mov	x19, x0
    1a10:      	str	x19, [x29, #0xc0]
    1a14:      	ldr	x0, [x29, #0xb0]
    1a18:      	ldr	x1, [x29, #0xb8]
    1a1c:      	bl	0x1a1c <_coil.core.Eq$slice<u8>$=+0x38>
		0000000000001a1c:  ARM64_RELOC_BRANCH26	_coil.core.Len$slice$len__u8
    1a20:      	str	x0, [x29, #0xc8]
    1a24:      	ldr	x0, [x29, #0xc0]
    1a28:      	ldr	x1, [x29, #0xc8]
    1a2c:      	cmp	x0, x1
    1a30:      	b.ne	0x1a3c <_coil.core.Eq$slice<u8>$=+0x58>
    1a34:      	mov	w20, #0x0               ; =0
    1a38:      	b	0x1a40 <_coil.core.Eq$slice<u8>$=+0x5c>
    1a3c:      	mov	w20, #0x1               ; =1
    1a40:      	cbz	x20, 0x1a4c <_coil.core.Eq$slice<u8>$=+0x68>
    1a44:      	mov	w20, #0x0               ; =0
    1a48:      	b	0x1a8c <_coil.core.Eq$slice<u8>$=+0xa8>
    1a4c:      	ldr	x0, [x29, #0xa0]
    1a50:      	ldr	x1, [x29, #0xa8]
    1a54:      	bl	0x1a54 <_coil.core.Eq$slice<u8>$=+0x70>
		0000000000001a54:  ARM64_RELOC_BRANCH26	_inherent$slice$data__u8
    1a58:      	ldr	x1, [x29, #0xb0]
    1a5c:      	ldr	x2, [x29, #0xb8]
    1a60:      	mov	x9, x0
    1a64:      	mov	x0, x1
    1a68:      	mov	x1, x2
    1a6c:      	str	x9, [x29, #0xd0]
    1a70:      	bl	0x1a70 <_coil.core.Eq$slice<u8>$=+0x8c>
		0000000000001a70:  ARM64_RELOC_BRANCH26	_inherent$slice$data__u8
    1a74:      	mov	x9, x0
    1a78:      	ldr	x0, [x29, #0xd0]
    1a7c:      	mov	x1, x9
    1a80:      	mov	x2, x19
    1a84:      	bl	0x1a84 <_coil.core.Eq$slice<u8>$=+0xa0>
		0000000000001a84:  ARM64_RELOC_BRANCH26	_coil.mem.eql__u8
    1a88:      	mov	x20, x0
    1a8c:      	mov	x0, x20
    1a90:      	ldp	x19, x20, [sp, #0x10]
    1a94:      	ldp	x29, x30, [sp], #0xe0
    1a98:      	ret

0000000000001a9c <_stogir.node.opcode>:
    1a9c:      	ldr	w0, [x0]
    1aa0:      	and	x0, x0, #0xff
    1aa4:      	ubfx	x0, x0, #0, #32
    1aa8:      	ubfx	x0, x0, #0, #8
    1aac:      	ret

0000000000001ab0 <_stogir.opcode.valid?>:
    1ab0:      	stp	x29, x30, [sp, #-0xa0]!
    1ab4:      	mov	x29, sp
    1ab8:      	str	x19, [sp, #0x10]
    1abc:      	sxtw	x19, w0
    1ac0:      	cmp	x19, #0x0
    1ac4:      	b.lt	0x1ae0 <_stogir.opcode.valid?+0x30>
    1ac8:      	bl	0x1ac8 <_stogir.opcode.valid?+0x18>
		0000000000001ac8:  ARM64_RELOC_BRANCH26	_stogir.opcode.count
    1acc:      	sxtw	x0, w0
    1ad0:      	cmp	x19, x0
    1ad4:      	cset	x0, lt
    1ad8:      	mov	x19, x0
    1adc:      	b	0x1ae4 <_stogir.opcode.valid?+0x34>
    1ae0:      	mov	w19, #0x0               ; =0
    1ae4:      	mov	x0, x19
    1ae8:      	ldr	x19, [sp, #0x10]
    1aec:      	ldp	x29, x30, [sp], #0xa0
    1af0:      	ret

0000000000001af4 <_stogir.node.type-id>:
    1af4:      	ldr	w0, [x0]
    1af8:      	lsr	x0, x0, #8
    1afc:      	ubfx	x0, x0, #0, #32
    1b00:      	and	x0, x0, #0xff
    1b04:      	ubfx	x0, x0, #0, #32
    1b08:      	ubfx	x0, x0, #0, #8
    1b0c:      	ret

0000000000001b10 <_stogir.types.valid?>:
    1b10:      	stp	x29, x30, [sp, #-0xa0]!
    1b14:      	mov	x29, sp
    1b18:      	str	x19, [sp, #0x10]
    1b1c:      	sxtw	x19, w0
    1b20:      	mov	x0, x19
    1b24:      	bl	0x1b24 <_stogir.types.valid?+0x14>
		0000000000001b24:  ARM64_RELOC_BRANCH26	_stogir.types.valid-scalar?
    1b28:      	cbz	x0, 0x1b34 <_stogir.types.valid?+0x24>
    1b2c:      	mov	w0, #0x1                ; =1
    1b30:      	b	0x1b3c <_stogir.types.valid?+0x2c>
    1b34:      	mov	x0, x19
    1b38:      	b	0x1b48 <_stogir.types.valid?+0x38>
    1b3c:      	ldr	x19, [sp, #0x10]
    1b40:      	ldp	x29, x30, [sp], #0xa0
    1b44:      	ret
    1b48:      	ldr	x19, [sp, #0x10]
    1b4c:      	ldp	x29, x30, [sp], #0xa0
    1b50:      	b	0x1b50 <_stogir.types.valid?+0x40>
		0000000000001b50:  ARM64_RELOC_BRANCH26	_stogir.types.vector?

0000000000001b54 <_stogir.opcode.operand-slots>:
    1b54:      	stp	x29, x30, [sp, #-0xb0]!
    1b58:      	mov	x29, sp
    1b5c:      	str	x19, [sp, #0x10]
    1b60:      	sxtw	x19, w0
    1b64:      	mov	x0, x19
    1b68:      	bl	0x1b68 <_stogir.opcode.operand-slots+0x14>
		0000000000001b68:  ARM64_RELOC_BRANCH26	_stogir.opcode.valid?
    1b6c:      	cbz	x0, 0x1ba4 <_stogir.opcode.operand-slots+0x50>
    1b70:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		0000000000001b70:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-SLOTS
    1b74:      	add	x0, x0, #0x0
		0000000000001b74:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-SLOTS
    1b78:      	str	x0, [x29, #0xa0]
    1b7c:      	mov	w0, #0x83               ; =131
    1b80:      	str	x0, [x29, #0xa8]
    1b84:      	ldr	x0, [x29, #0xa0]
    1b88:      	ldr	x1, [x29, #0xa8]
    1b8c:      	mov	x2, x19
    1b90:      	bl	0x1b90 <_stogir.opcode.operand-slots+0x3c>
		0000000000001b90:  ARM64_RELOC_BRANCH26	_coil.core.Get$slice$get__i8
    1b94:      	sxtb	x0, w0
    1b98:      	sxtw	x0, w0
    1b9c:      	mov	x19, x0
    1ba0:      	b	0x1ba8 <_stogir.opcode.operand-slots+0x54>
    1ba4:      	mov	x19, #-0x2              ; =-2
    1ba8:      	mov	x0, x19
    1bac:      	ldr	x19, [sp, #0x10]
    1bb0:      	ldp	x29, x30, [sp], #0xb0
    1bb4:      	ret

0000000000001bb8 <_stogir.opcode.input-count>:
    1bb8:      	stp	x29, x30, [sp, #-0xb0]!
    1bbc:      	mov	x29, sp
    1bc0:      	str	x19, [sp, #0x10]
    1bc4:      	sxtw	x19, w0
    1bc8:      	mov	x0, x19
    1bcc:      	bl	0x1bcc <_stogir.opcode.input-count+0x14>
		0000000000001bcc:  ARM64_RELOC_BRANCH26	_stogir.opcode.valid?
    1bd0:      	cbz	x0, 0x1c08 <_stogir.opcode.input-count+0x50>
    1bd4:      	adrp	x0, 0x1000 <_stogir.verify.integer-operations-target-structured+0x658>
		0000000000001bd4:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.INPUT-COUNTS
    1bd8:      	add	x0, x0, #0x0
		0000000000001bd8:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.INPUT-COUNTS
    1bdc:      	str	x0, [x29, #0xa0]
    1be0:      	mov	w0, #0x83               ; =131
    1be4:      	str	x0, [x29, #0xa8]
    1be8:      	ldr	x0, [x29, #0xa0]
    1bec:      	ldr	x1, [x29, #0xa8]
    1bf0:      	mov	x2, x19
    1bf4:      	bl	0x1bf4 <_stogir.opcode.input-count+0x3c>
		0000000000001bf4:  ARM64_RELOC_BRANCH26	_coil.core.Get$slice$get__i8
    1bf8:      	sxtb	x0, w0
    1bfc:      	sxtw	x0, w0
    1c00:      	mov	x19, x0
    1c04:      	b	0x1c0c <_stogir.opcode.input-count+0x54>
    1c08:      	mov	x19, #-0x2              ; =-2
    1c0c:      	mov	x0, x19
    1c10:      	ldr	x19, [sp, #0x10]
    1c14:      	ldp	x29, x30, [sp], #0xb0
    1c18:      	ret

0000000000001c1c <_stogir.node.auxiliary>:
    1c1c:      	ldr	w0, [x0]
    1c20:      	lsr	x0, x0, #16
    1c24:      	ubfx	x0, x0, #0, #32
    1c28:      	ubfx	x0, x0, #0, #16
    1c2c:      	ret

0000000000001c30 <_stogir.opcode.operand-code>:
    1c30:      	stp	x29, x30, [sp, #-0xb0]!
    1c34:      	mov	x29, sp
    1c38:      	stp	x19, x20, [sp, #0x10]
    1c3c:      	str	x21, [sp, #0x20]
    1c40:      	sxtw	x19, w0
    1c44:      	sxtw	x20, w1
    1c48:      	mov	x0, x19
    1c4c:      	bl	0x1c4c <_stogir.opcode.operand-code+0x1c>
		0000000000001c4c:  ARM64_RELOC_BRANCH26	_stogir.opcode.valid?
    1c50:      	cbz	x0, 0x1c64 <_stogir.opcode.operand-code+0x34>
    1c54:      	cmp	x20, #0x0
    1c58:      	cset	x0, gt
    1c5c:      	mov	x21, x0
    1c60:      	b	0x1c68 <_stogir.opcode.operand-code+0x38>
    1c64:      	mov	w21, #0x0               ; =0
    1c68:      	cbz	x21, 0x1cd0 <_stogir.opcode.operand-code+0xa0>
    1c6c:      	cmp	x20, #0x4
    1c70:      	b.le	0x1c7c <_stogir.opcode.operand-code+0x4c>
    1c74:      	mov	w21, #0x4               ; =4
    1c78:      	b	0x1c88 <_stogir.opcode.operand-code+0x58>
    1c7c:      	sub	x20, x20, #0x1
    1c80:      	sxtw	x20, w20
    1c84:      	mov	x21, x20
    1c88:      	bl	0x1c88 <_stogir.opcode.operand-code+0x58>
		0000000000001c88:  ARM64_RELOC_BRANCH26	_stogir.opcode.metadata
    1c8c:      	str	x0, [x29, #0xa0]
    1c90:      	str	x1, [x29, #0xa8]
    1c94:      	ldr	x0, [x29, #0xa0]
    1c98:      	ldr	x1, [x29, #0xa8]
    1c9c:      	mov	x2, x19
    1ca0:      	bl	0x1ca0 <_stogir.opcode.operand-code+0x70>
		0000000000001ca0:  ARM64_RELOC_BRANCH26	_coil.core.Get$slice$get__u32
    1ca4:      	ubfx	x0, x0, #0, #32
    1ca8:      	mov	w1, #0x4                ; =4
    1cac:      	mul	x21, x21, x1
    1cb0:      	sxtw	x21, w21
    1cb4:      	ubfx	x21, x21, #0, #32
    1cb8:      	lsr	x0, x0, x21
    1cbc:      	ubfx	x0, x0, #0, #32
    1cc0:      	and	x0, x0, #0xf
    1cc4:      	ubfx	x0, x0, #0, #32
    1cc8:      	mov	x19, x0
    1ccc:      	b	0x1cd4 <_stogir.opcode.operand-code+0xa4>
    1cd0:      	mov	w19, #0x0               ; =0
    1cd4:      	mov	x0, x19
    1cd8:      	ldp	x19, x20, [sp, #0x10]
    1cdc:      	ldr	x21, [sp, #0x20]
    1ce0:      	ldp	x29, x30, [sp], #0xb0
    1ce4:      	ret

0000000000001ce8 <_stogir.graph.operand>:
    1ce8:      	stp	x29, x30, [sp, #-0xd0]!
    1cec:      	mov	x29, sp
    1cf0:      	stp	x19, x20, [sp, #0x10]
    1cf4:      	stp	x21, x22, [sp, #0x20]
    1cf8:      	str	x23, [sp, #0x30]
    1cfc:      	mov	x19, x0
    1d00:      	sxtw	x20, w1
    1d04:      	sxtw	x21, w2
    1d08:      	cmp	x20, #0x0
    1d0c:      	b.gt	0x1d18 <_stogir.graph.operand+0x30>
    1d10:      	mov	w22, #0x1               ; =1
    1d14:      	b	0x1d38 <_stogir.graph.operand+0x50>
    1d18:      	mov	x0, x19
    1d1c:      	mov	x1, x20
    1d20:      	bl	0x1d20 <_stogir.graph.operand+0x38>
		0000000000001d20:  ARM64_RELOC_BRANCH26	_stogir.graph.contains?
    1d24:      	cbz	x0, 0x1d30 <_stogir.graph.operand+0x48>
    1d28:      	mov	w23, #0x0               ; =0
    1d2c:      	b	0x1d34 <_stogir.graph.operand+0x4c>
    1d30:      	mov	w23, #0x1               ; =1
    1d34:      	mov	x22, x23
    1d38:      	cbz	x22, 0x1d48 <_stogir.graph.operand+0x60>
    1d3c:      	str	wzr, [x29, #0xa0]
    1d40:      	add	x22, x29, #0xa0
    1d44:      	b	0x1dc0 <_stogir.graph.operand+0xd8>
    1d48:      	cmp	x21, #0x1
    1d4c:      	b.ge	0x1d58 <_stogir.graph.operand+0x70>
    1d50:      	mov	w23, #0x1               ; =1
    1d54:      	b	0x1d70 <_stogir.graph.operand+0x88>
    1d58:      	ldr	x0, [x19, #0x78]
    1d5c:      	add	x0, x0, x20, lsl #2
    1d60:      	ldrsw	x0, [x0]
    1d64:      	cmp	x21, x0
    1d68:      	cset	x0, gt
    1d6c:      	mov	x23, x0
    1d70:      	cbz	x23, 0x1d80 <_stogir.graph.operand+0x98>
    1d74:      	str	wzr, [x29, #0xb0]
    1d78:      	add	x23, x29, #0xb0
    1d7c:      	b	0x1dbc <_stogir.graph.operand+0xd4>
    1d80:      	mov	w0, #0x4                ; =4
    1d84:      	sdiv	x1, x21, x0
    1d88:      	add	x20, x20, x1
    1d8c:      	mov	x0, x19
    1d90:      	mov	x1, x20
    1d94:      	bl	0x1d94 <_stogir.graph.operand+0xac>
		0000000000001d94:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$at__stogir.node.Node
    1d98:      	mov	w1, #0x4                ; =4
    1d9c:      	sdiv	x2, x21, x1
    1da0:      	msub	x3, x2, x1, x21
    1da4:      	mov	w1, #0x1                ; =1
    1da8:      	str	w1, [x29, #0xc0]
    1dac:      	add	x0, x0, x3, lsl #2
    1db0:      	ldrsw	x0, [x0]
    1db4:      	str	w0, [x29, #0xc8]
    1db8:      	add	x23, x29, #0xc0
    1dbc:      	mov	x22, x23
    1dc0:      	ldr	x0, [x22]
    1dc4:      	ldr	x22, [x22, #0x8]
    1dc8:      	mov	x1, x22
    1dcc:      	ldp	x19, x20, [sp, #0x10]
    1dd0:      	ldp	x21, x22, [sp, #0x20]
    1dd4:      	ldr	x23, [sp, #0x30]
    1dd8:      	ldp	x29, x30, [sp], #0xd0
    1ddc:      	ret

0000000000001de0 <_stogir.graph.borrow-node>:
    1de0:      	stp	x29, x30, [sp, #-0xa0]!
    1de4:      	mov	x29, sp
    1de8:      	stp	x19, x20, [sp, #0x10]
    1dec:      	stp	x21, x22, [sp, #0x20]
    1df0:      	mov	x19, x0
    1df4:      	sxtw	x20, w1
    1df8:      	mov	x0, x19
    1dfc:      	mov	x1, x20
    1e00:      	bl	0x1e00 <_stogir.graph.borrow-node+0x20>
		0000000000001e00:  ARM64_RELOC_BRANCH26	_stogir.graph.contains?
    1e04:      	cbz	x0, 0x1e10 <_stogir.graph.borrow-node+0x30>
    1e08:      	mov	w21, #0x0               ; =0
    1e0c:      	b	0x1e14 <_stogir.graph.borrow-node+0x34>
    1e10:      	mov	w21, #0x1               ; =1
    1e14:      	cbz	x21, 0x1e20 <_stogir.graph.borrow-node+0x40>
    1e18:      	mov	w21, #0x0               ; =0
    1e1c:      	b	0x1e54 <_stogir.graph.borrow-node+0x74>
    1e20:      	cmp	x20, #0x0
    1e24:      	b.le	0x1e38 <_stogir.graph.borrow-node+0x58>
    1e28:      	ldr	x0, [x19]
    1e2c:      	add	x0, x0, x20, lsl #4
    1e30:      	mov	x22, x0
    1e34:      	b	0x1e50 <_stogir.graph.borrow-node+0x70>
    1e38:      	ldr	x19, [x19, #0x28]
    1e3c:      	mov	w0, #0x0                ; =0
    1e40:      	sub	x0, x0, x20
    1e44:      	sub	x0, x0, #0x1
    1e48:      	add	x19, x19, x0, lsl #4
    1e4c:      	mov	x22, x19
    1e50:      	mov	x21, x22
    1e54:      	mov	x0, x21
    1e58:      	ldp	x19, x20, [sp, #0x10]
    1e5c:      	ldp	x21, x22, [sp, #0x20]
    1e60:      	ldp	x29, x30, [sp], #0xa0
    1e64:      	ret

0000000000001e68 <_stogir.strings.lookup>:
    1e68:      	stp	x29, x30, [sp, #-0x170]!
    1e6c:      	mov	x29, sp
    1e70:      	stp	x19, x20, [sp, #0x10]
    1e74:      	stp	x21, x22, [sp, #0x20]
    1e78:      	str	x23, [sp, #0x30]
    1e7c:      	mov	x19, x8
    1e80:      	mov	x20, x0
    1e84:      	sxtw	x21, w1
    1e88:      	cmp	x21, #0x0
    1e8c:      	b.gt	0x1e98 <_stogir.strings.lookup+0x30>
    1e90:      	mov	w22, #0x1               ; =1
    1e94:      	b	0x1eac <_stogir.strings.lookup+0x44>
    1e98:      	add	x0, x20, #0x28
    1e9c:      	bl	0x1e9c <_stogir.strings.lookup+0x34>
		0000000000001e9c:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.strings.Entry
    1ea0:      	cmp	x21, x0
    1ea4:      	cset	x0, gt
    1ea8:      	mov	x22, x0
    1eac:      	cbz	x22, 0x1ebc <_stogir.strings.lookup+0x54>
    1eb0:      	str	wzr, [x29, #0xa0]
    1eb4:      	add	x22, x29, #0xa0
    1eb8:      	b	0x1fd8 <_stogir.strings.lookup+0x170>
    1ebc:      	sub	x21, x21, #0x1
    1ec0:      	ldr	x0, [x20, #0x28]
    1ec4:      	mov	w16, #0x18              ; =24
    1ec8:      	madd	x0, x21, x16, x0
    1ecc:      	ldr	q0, [x0]
    1ed0:      	str	q0, [x29, #0xe0]
    1ed4:      	ldr	x1, [x0, #0x10]
    1ed8:      	str	x1, [x29, #0xf0]
    1edc:      	ldr	q0, [x29, #0xe0]
    1ee0:      	str	q0, [x29, #0xc0]
    1ee4:      	ldr	x0, [x29, #0xf0]
    1ee8:      	str	x0, [x29, #0xd0]
    1eec:      	mov	x0, x20
    1ef0:      	bl	0x1ef0 <_stogir.strings.lookup+0x88>
		0000000000001ef0:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__u8
    1ef4:      	mov	x21, x0
    1ef8:      	ldr	x0, [x29, #0xc0]
    1efc:      	cmp	x0, #0x0
    1f00:      	b.ge	0x1f0c <_stogir.strings.lookup+0xa4>
    1f04:      	mov	w23, #0x1               ; =1
    1f08:      	b	0x1f60 <_stogir.strings.lookup+0xf8>
    1f0c:      	ldr	x0, [x29, #0xc0]
    1f10:      	cmp	x0, x21
    1f14:      	b.le	0x1f24 <_stogir.strings.lookup+0xbc>
    1f18:      	mov	w0, #0x1                ; =1
    1f1c:      	str	x0, [x29, #0x160]
    1f20:      	b	0x1f5c <_stogir.strings.lookup+0xf4>
    1f24:      	ldr	x0, [x29, #0xc8]
    1f28:      	cmp	x0, #0x0
    1f2c:      	b.ge	0x1f3c <_stogir.strings.lookup+0xd4>
    1f30:      	mov	w0, #0x1                ; =1
    1f34:      	str	x0, [x29, #0x168]
    1f38:      	b	0x1f54 <_stogir.strings.lookup+0xec>
    1f3c:      	ldr	x0, [x29, #0xc8]
    1f40:      	ldr	x1, [x29, #0xc0]
    1f44:      	sub	x21, x21, x1
    1f48:      	cmp	x0, x21
    1f4c:      	cset	x0, gt
    1f50:      	str	x0, [x29, #0x168]
    1f54:      	ldr	x0, [x29, #0x168]
    1f58:      	str	x0, [x29, #0x160]
    1f5c:      	ldr	x23, [x29, #0x160]
    1f60:      	cbz	x23, 0x1f70 <_stogir.strings.lookup+0x108>
    1f64:      	str	wzr, [x29, #0x100]
    1f68:      	add	x21, x29, #0x100
    1f6c:      	b	0x1fd4 <_stogir.strings.lookup+0x16c>
    1f70:      	mov	w0, #0x1                ; =1
    1f74:      	str	w0, [x29, #0x120]
    1f78:      	mov	x0, x20
    1f7c:      	bl	0x1f7c <_stogir.strings.lookup+0x114>
		0000000000001f7c:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$slice__u8
    1f80:      	str	x0, [x29, #0x140]
    1f84:      	str	x1, [x29, #0x148]
    1f88:      	ldr	x0, [x29, #0xc0]
    1f8c:      	ldr	x1, [x29, #0xc0]
    1f90:      	ldr	x2, [x29, #0xc8]
    1f94:      	add	x1, x1, x2
    1f98:      	ldr	x2, [x29, #0x140]
    1f9c:      	ldr	x3, [x29, #0x148]
    1fa0:      	mov	x9, x0
    1fa4:      	mov	x0, x2
    1fa8:      	mov	x10, x1
    1fac:      	mov	x1, x3
    1fb0:      	mov	x2, x9
    1fb4:      	mov	x3, x10
    1fb8:      	bl	0x1fb8 <_stogir.strings.lookup+0x150>
		0000000000001fb8:  ARM64_RELOC_BRANCH26	_coil.slice.subslice__u8
    1fbc:      	str	x0, [x29, #0x150]
    1fc0:      	str	x1, [x29, #0x158]
    1fc4:      	ldr	q0, [x29, #0x150]
    1fc8:      	mov	w16, #0x128             ; =296
    1fcc:      	str	q0, [x29, x16]
    1fd0:      	add	x21, x29, #0x120
    1fd4:      	mov	x22, x21
    1fd8:      	ldr	q0, [x22]
    1fdc:      	str	q0, [x19]
    1fe0:      	ldr	x0, [x22, #0x10]
    1fe4:      	str	x0, [x19, #0x10]
    1fe8:      	ldp	x19, x20, [sp, #0x10]
    1fec:      	ldp	x21, x22, [sp, #0x20]
    1ff0:      	ldr	x23, [sp, #0x30]
    1ff4:      	ldp	x29, x30, [sp], #0x170
    1ff8:      	ret

0000000000001ffc <_stogir.uses.edge-code?>:
    1ffc:      	stp	x29, x30, [sp, #-0xb0]!
    2000:      	mov	x29, sp
    2004:      	ubfx	x2, x0, #0, #32
    2008:      	cmp	x2, #0xf
    200c:      	b.hs	0x2054 <_stogir.uses.edge-code?+0x58>
    2010:      	mov	w0, #0x1                ; =1
    2014:      	lsl	x0, x0, x2
    2018:      	ubfx	x0, x0, #0, #32
    201c:      	mov	w1, #0x5e1c             ; =24092
    2020:      	and	x1, x1, x0
    2024:      	ubfx	x1, x1, #0, #32
    2028:      	str	w1, [x29, #0xa0]
    202c:      	str	wzr, [x29, #0xa4]
    2030:      	ldr	w0, [x29, #0xa0]
    2034:      	ldr	w1, [x29, #0xa4]
    2038:      	cmp	x0, x1
    203c:      	b.ne	0x2048 <_stogir.uses.edge-code?+0x4c>
    2040:      	mov	w2, #0x0                ; =0
    2044:      	b	0x204c <_stogir.uses.edge-code?+0x50>
    2048:      	mov	w2, #0x1                ; =1
    204c:      	mov	x3, x2
    2050:      	b	0x2058 <_stogir.uses.edge-code?+0x5c>
    2054:      	mov	w3, #0x0                ; =0
    2058:      	mov	x0, x3
    205c:      	ldp	x29, x30, [sp], #0xb0
    2060:      	ret

0000000000002064 <_stogir.graph.contains?>:
    2064:      	stp	x29, x30, [sp, #-0xb0]!
    2068:      	mov	x29, sp
    206c:      	stp	x19, x20, [sp, #0x10]
    2070:      	stp	x21, x22, [sp, #0x20]
    2074:      	mov	x19, x0
    2078:      	sxtw	x20, w1
    207c:      	cmp	x20, #0x0
    2080:      	b.le	0x20d8 <_stogir.graph.contains?+0x74>
    2084:      	mov	x0, x19
    2088:      	bl	0x2088 <_stogir.graph.contains?+0x24>
		0000000000002088:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
    208c:      	cmp	x20, x0
    2090:      	b.ge	0x20cc <_stogir.graph.contains?+0x68>
    2094:      	add	x0, x19, #0x78
    2098:      	bl	0x2098 <_stogir.graph.contains?+0x34>
		0000000000002098:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__i32
    209c:      	cmp	x20, x0
    20a0:      	b.ge	0x20c0 <_stogir.graph.contains?+0x5c>
    20a4:      	ldr	x0, [x19, #0x78]
    20a8:      	add	x0, x0, x20, lsl #2
    20ac:      	ldrsw	x0, [x0]
    20b0:      	cmp	x0, #0x0
    20b4:      	cset	x0, ge
    20b8:      	mov	x21, x0
    20bc:      	b	0x20c4 <_stogir.graph.contains?+0x60>
    20c0:      	mov	w21, #0x0               ; =0
    20c4:      	mov	x22, x21
    20c8:      	b	0x20d0 <_stogir.graph.contains?+0x6c>
    20cc:      	mov	w22, #0x0               ; =0
    20d0:      	mov	x21, x22
    20d4:      	b	0x2178 <_stogir.graph.contains?+0x114>
    20d8:      	cmp	x20, #0x0
    20dc:      	b.ge	0x2170 <_stogir.graph.contains?+0x10c>
    20e0:      	add	x0, x19, #0x28
    20e4:      	bl	0x20e4 <_stogir.graph.contains?+0x80>
		00000000000020e4:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
    20e8:      	add	x1, x19, #0x50
    20ec:      	mov	x9, x0
    20f0:      	mov	x0, x1
    20f4:      	str	x9, [x29, #0xa0]
    20f8:      	bl	0x20f8 <_stogir.graph.contains?+0x94>
		00000000000020f8:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__i32
    20fc:      	ldr	x1, [x29, #0xa0]
    2100:      	cmp	x1, x0
    2104:      	b.ne	0x2164 <_stogir.graph.contains?+0x100>
    2108:      	mov	w0, #0x0                ; =0
    210c:      	sub	x0, x0, x20
    2110:      	add	x1, x19, #0x28
    2114:      	mov	x9, x0
    2118:      	mov	x0, x1
    211c:      	str	x9, [x29, #0xa0]
    2120:      	bl	0x2120 <_stogir.graph.contains?+0xbc>
		0000000000002120:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
    2124:      	ldr	x1, [x29, #0xa0]
    2128:      	cmp	x1, x0
    212c:      	b.gt	0x2158 <_stogir.graph.contains?+0xf4>
    2130:      	mov	w0, #0x0                ; =0
    2134:      	sub	x0, x0, x20
    2138:      	sub	x0, x0, #0x1
    213c:      	ldr	x19, [x19, #0x50]
    2140:      	add	x19, x19, x0, lsl #2
    2144:      	ldrsw	x19, [x19]
    2148:      	cmp	x19, #0x0
    214c:      	cset	x0, gt
    2150:      	mov	x19, x0
    2154:      	b	0x215c <_stogir.graph.contains?+0xf8>
    2158:      	mov	w19, #0x0               ; =0
    215c:      	mov	x20, x19
    2160:      	b	0x2168 <_stogir.graph.contains?+0x104>
    2164:      	mov	w20, #0x0               ; =0
    2168:      	mov	x19, x20
    216c:      	b	0x2174 <_stogir.graph.contains?+0x110>
    2170:      	mov	w19, #0x0               ; =0
    2174:      	mov	x21, x19
    2178:      	mov	x0, x21
    217c:      	ldp	x19, x20, [sp, #0x10]
    2180:      	ldp	x21, x22, [sp, #0x20]
    2184:      	ldp	x29, x30, [sp], #0xb0
    2188:      	ret

000000000000218c <_stogir.opcode.optional-reference?>:
    218c:      	stp	x29, x30, [sp, #-0xb0]!
    2190:      	mov	x29, sp
    2194:      	stp	x19, x20, [sp, #0x10]
    2198:      	stp	x21, x22, [sp, #0x20]
    219c:      	str	x23, [sp, #0x30]
    21a0:      	sxtw	x19, w0
    21a4:      	sxtw	x20, w1
    21a8:      	sxtw	x21, w2
    21ac:      	mov	x0, x19
    21b0:      	mov	x1, x21
    21b4:      	bl	0x21b4 <_stogir.opcode.optional-reference?+0x28>
		00000000000021b4:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
    21b8:      	ubfx	x22, x0, #0, #32
    21bc:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		00000000000021bc:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-GRD
    21c0:      	add	x0, x0, #0x0
		00000000000021c0:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-GRD
    21c4:      	ldr	w0, [x0]
    21c8:      	cmp	x22, x0
    21cc:      	b.ne	0x21d8 <_stogir.opcode.optional-reference?+0x4c>
    21d0:      	mov	w23, #0x1               ; =1
    21d4:      	b	0x2250 <_stogir.opcode.optional-reference?+0xc4>
    21d8:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		00000000000021d8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-RET
    21dc:      	add	x0, x0, #0x0
		00000000000021dc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-RET
    21e0:      	ldr	w0, [x0]
    21e4:      	cmp	x22, x0
    21e8:      	b.ne	0x21f8 <_stogir.opcode.optional-reference?+0x6c>
    21ec:      	mov	w0, #0x1                ; =1
    21f0:      	str	x0, [x29, #0xa0]
    21f4:      	b	0x224c <_stogir.opcode.optional-reference?+0xc0>
    21f8:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		00000000000021f8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-LBL
    21fc:      	add	x0, x0, #0x0
		00000000000021fc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-LBL
    2200:      	ldr	w0, [x0]
    2204:      	cmp	x22, x0
    2208:      	b.ne	0x2214 <_stogir.opcode.optional-reference?+0x88>
    220c:      	mov	w22, #0x1               ; =1
    2210:      	b	0x2248 <_stogir.opcode.optional-reference?+0xbc>
    2214:      	cmp	x19, #0x78
    2218:      	b.ne	0x2240 <_stogir.opcode.optional-reference?+0xb4>
    221c:      	cmp	x20, #0x0
    2220:      	b.ne	0x2234 <_stogir.opcode.optional-reference?+0xa8>
    2224:      	cmp	x21, #0x2
    2228:      	cset	x0, eq
    222c:      	mov	x19, x0
    2230:      	b	0x2238 <_stogir.opcode.optional-reference?+0xac>
    2234:      	mov	w19, #0x0               ; =0
    2238:      	mov	x20, x19
    223c:      	b	0x2244 <_stogir.opcode.optional-reference?+0xb8>
    2240:      	mov	w20, #0x0               ; =0
    2244:      	mov	x22, x20
    2248:      	str	x22, [x29, #0xa0]
    224c:      	ldr	x23, [x29, #0xa0]
    2250:      	mov	x0, x23
    2254:      	ldp	x19, x20, [sp, #0x10]
    2258:      	ldp	x21, x22, [sp, #0x20]
    225c:      	ldr	x23, [sp, #0x30]
    2260:      	ldp	x29, x30, [sp], #0xb0
    2264:      	ret

0000000000002268 <_stogir.integer-binary.operation?>:
    2268:      	sxtw	x2, w0
    226c:      	cmp	x2, #0x1a
    2270:      	b.lt	0x2284 <_stogir.integer-binary.operation?+0x1c>
    2274:      	cmp	x2, #0x1e
    2278:      	cset	x0, le
    227c:      	mov	x3, x0
    2280:      	b	0x2288 <_stogir.integer-binary.operation?+0x20>
    2284:      	mov	w3, #0x0                ; =0
    2288:      	cbz	x3, 0x2294 <_stogir.integer-binary.operation?+0x2c>
    228c:      	mov	w3, #0x1                ; =1
    2290:      	b	0x22e0 <_stogir.integer-binary.operation?+0x78>
    2294:      	cmp	x2, #0x2e
    2298:      	b.lt	0x22ac <_stogir.integer-binary.operation?+0x44>
    229c:      	cmp	x2, #0x35
    22a0:      	cset	x0, le
    22a4:      	mov	x4, x0
    22a8:      	b	0x22b0 <_stogir.integer-binary.operation?+0x48>
    22ac:      	mov	w4, #0x0                ; =0
    22b0:      	cbz	x4, 0x22bc <_stogir.integer-binary.operation?+0x54>
    22b4:      	mov	w4, #0x1                ; =1
    22b8:      	b	0x22dc <_stogir.integer-binary.operation?+0x74>
    22bc:      	cmp	x2, #0x3a
    22c0:      	b.ne	0x22cc <_stogir.integer-binary.operation?+0x64>
    22c4:      	mov	w5, #0x1                ; =1
    22c8:      	b	0x22d8 <_stogir.integer-binary.operation?+0x70>
    22cc:      	cmp	x2, #0x3b
    22d0:      	cset	x0, eq
    22d4:      	mov	x5, x0
    22d8:      	mov	x4, x5
    22dc:      	mov	x3, x4
    22e0:      	mov	x0, x3
    22e4:      	ret

00000000000022e8 <_stogir.integer-unary.operation?>:
    22e8:      	stp	x29, x30, [sp, #-0xb0]!
    22ec:      	mov	x29, sp
    22f0:      	sxtw	x2, w0
    22f4:      	cmp	x2, #0x1f
    22f8:      	b.ne	0x2304 <_stogir.integer-unary.operation?+0x1c>
    22fc:      	mov	w3, #0x1                ; =1
    2300:      	b	0x2380 <_stogir.integer-unary.operation?+0x98>
    2304:      	cmp	x2, #0x20
    2308:      	b.ne	0x2314 <_stogir.integer-unary.operation?+0x2c>
    230c:      	mov	w4, #0x1                ; =1
    2310:      	b	0x237c <_stogir.integer-unary.operation?+0x94>
    2314:      	cmp	x2, #0x2d
    2318:      	b.ne	0x2324 <_stogir.integer-unary.operation?+0x3c>
    231c:      	mov	w5, #0x1                ; =1
    2320:      	b	0x2378 <_stogir.integer-unary.operation?+0x90>
    2324:      	cmp	x2, #0x36
    2328:      	b.ne	0x2334 <_stogir.integer-unary.operation?+0x4c>
    232c:      	mov	w6, #0x1                ; =1
    2330:      	b	0x2374 <_stogir.integer-unary.operation?+0x8c>
    2334:      	cmp	x2, #0x37
    2338:      	b.ne	0x2348 <_stogir.integer-unary.operation?+0x60>
    233c:      	mov	w0, #0x1                ; =1
    2340:      	str	x0, [x29, #0xa0]
    2344:      	b	0x2370 <_stogir.integer-unary.operation?+0x88>
    2348:      	cmp	x2, #0x38
    234c:      	b.ne	0x235c <_stogir.integer-unary.operation?+0x74>
    2350:      	mov	w0, #0x1                ; =1
    2354:      	str	x0, [x29, #0xa8]
    2358:      	b	0x2368 <_stogir.integer-unary.operation?+0x80>
    235c:      	cmp	x2, #0x39
    2360:      	cset	x0, eq
    2364:      	str	x0, [x29, #0xa8]
    2368:      	ldr	x0, [x29, #0xa8]
    236c:      	str	x0, [x29, #0xa0]
    2370:      	ldr	x6, [x29, #0xa0]
    2374:      	mov	x5, x6
    2378:      	mov	x4, x5
    237c:      	mov	x3, x4
    2380:      	mov	x0, x3
    2384:      	ldp	x29, x30, [sp], #0xb0
    2388:      	ret

000000000000238c <_stogir.verify.classifications>:
    238c:      	stp	x29, x30, [sp, #-0x130]!
    2390:      	mov	x29, sp
    2394:      	stp	x19, x20, [sp, #0x10]
    2398:      	stp	x21, x22, [sp, #0x20]
    239c:      	str	x23, [sp, #0x30]
    23a0:      	sxtw	x1, w1
    23a4:      	sxtw	x3, w3
    23a8:      	mov	x9, x0
    23ac:      	mov	x0, x2
    23b0:      	str	x1, [x29, #0xd8]
    23b4:      	str	x2, [x29, #0xe0]
    23b8:      	str	x3, [x29, #0xe8]
    23bc:      	str	x9, [x29, #0xf0]
    23c0:      	bl	0x23c0 <_stogir.verify.classifications+0x34>
		00000000000023c0:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    23c4:      	ubfx	x0, x0, #0, #8
    23c8:      	sxtw	x0, w0
    23cc:      	mov	x9, x0
    23d0:      	ldr	x0, [x29, #0xe0]
    23d4:      	str	x9, [x29, #0xf8]
    23d8:      	bl	0x23d8 <_stogir.verify.classifications+0x4c>
		00000000000023d8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    23dc:      	ubfx	x0, x0, #0, #8
    23e0:      	sxtw	x0, w0
    23e4:      	mov	x9, x0
    23e8:      	ldr	x0, [x29, #0xf8]
    23ec:      	str	x9, [x29, #0x100]
    23f0:      	bl	0x23f0 <_stogir.verify.classifications+0x64>
		00000000000023f0:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    23f4:      	mov	x9, x0
    23f8:      	ldr	x0, [x29, #0x100]
    23fc:      	str	x9, [x29, #0x108]
    2400:      	bl	0x2400 <_stogir.verify.classifications+0x74>
		0000000000002400:  ARM64_RELOC_BRANCH26	_stogir.floating.operation?
    2404:      	cbz	x0, 0x2434 <_stogir.verify.classifications+0xa8>
    2408:      	ldr	x0, [x29, #0x108]
    240c:      	mov	x1, x0
    2410:      	cbz	x1, 0x2420 <_stogir.verify.classifications+0x94>
    2414:      	mov	w1, #0x0                ; =0
    2418:      	str	x1, [x29, #0x110]
    241c:      	b	0x2428 <_stogir.verify.classifications+0x9c>
    2420:      	mov	w0, #0x1                ; =1
    2424:      	str	x0, [x29, #0x110]
    2428:      	ldr	x0, [x29, #0x110]
    242c:      	str	x0, [x29, #0x118]
    2430:      	b	0x243c <_stogir.verify.classifications+0xb0>
    2434:      	mov	w0, #0x0                ; =0
    2438:      	str	x0, [x29, #0x118]
    243c:      	ldr	x0, [x29, #0x118]
    2440:      	mov	x1, x0
    2444:      	cbz	x1, 0x24c8 <_stogir.verify.classifications+0x13c>
    2448:      	ldr	x1, [x29, #0xe0]
    244c:      	ldrsw	x2, [x1, #0x4]
    2450:      	mov	x9, x0
    2454:      	ldr	x0, [x29, #0xf0]
    2458:      	mov	x10, x1
    245c:      	mov	x1, x2
    2460:      	bl	0x2460 <_stogir.verify.classifications+0xd4>
		0000000000002460:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    2464:      	str	x0, [x29, #0xa0]
    2468:      	str	xzr, [x29, #0xa8]
    246c:      	ldr	x1, [x29, #0xa0]
    2470:      	ldr	x2, [x29, #0xa8]
    2474:      	cmp	x1, x2
    2478:      	str	x0, [x29, #0x110]
    247c:      	b.ne	0x248c <_stogir.verify.classifications+0x100>
    2480:      	mov	w1, #0x0                ; =0
    2484:      	str	x1, [x29, #0x120]
    2488:      	b	0x2494 <_stogir.verify.classifications+0x108>
    248c:      	mov	w0, #0x1                ; =1
    2490:      	str	x0, [x29, #0x120]
    2494:      	ldr	x0, [x29, #0x120]
    2498:      	cbz	x0, 0x24b4 <_stogir.verify.classifications+0x128>
    249c:      	ldr	x0, [x29, #0x110]
    24a0:      	bl	0x24a0 <_stogir.verify.classifications+0x114>
		00000000000024a0:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    24a4:      	ubfx	x0, x0, #0, #8
    24a8:      	sxtw	x0, w0
    24ac:      	str	x0, [x29, #0x110]
    24b0:      	b	0x24bc <_stogir.verify.classifications+0x130>
    24b4:      	mov	x0, #-0x1               ; =-1
    24b8:      	str	x0, [x29, #0x110]
    24bc:      	ldr	x0, [x29, #0x110]
    24c0:      	str	x0, [x29, #0x120]
    24c4:      	b	0x24d0 <_stogir.verify.classifications+0x144>
    24c8:      	mov	x0, #-0x1               ; =-1
    24cc:      	str	x0, [x29, #0x120]
    24d0:      	ldr	x0, [x29, #0x118]
    24d4:      	mov	x1, x0
    24d8:      	cbz	x1, 0x258c <_stogir.verify.classifications+0x200>
    24dc:      	mov	x9, x0
    24e0:      	ldr	x0, [x29, #0x120]
    24e4:      	bl	0x24e4 <_stogir.verify.classifications+0x158>
		00000000000024e4:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    24e8:      	cbz	x0, 0x24f8 <_stogir.verify.classifications+0x16c>
    24ec:      	mov	w0, #0x0                ; =0
    24f0:      	str	x0, [x29, #0x110]
    24f4:      	b	0x2500 <_stogir.verify.classifications+0x174>
    24f8:      	mov	w0, #0x1                ; =1
    24fc:      	str	x0, [x29, #0x110]
    2500:      	ldr	x0, [x29, #0x110]
    2504:      	cbz	x0, 0x2578 <_stogir.verify.classifications+0x1ec>
    2508:      	ldr	x0, [x29, #0x100]
    250c:      	cmp	x0, #0x18
    2510:      	b.ne	0x2520 <_stogir.verify.classifications+0x194>
    2514:      	mov	w1, #0x1                ; =1
    2518:      	str	x1, [x29, #0x110]
    251c:      	b	0x256c <_stogir.verify.classifications+0x1e0>
    2520:      	ldr	x0, [x29, #0x100]
    2524:      	cmp	x0, #0x19
    2528:      	b.ne	0x2538 <_stogir.verify.classifications+0x1ac>
    252c:      	mov	w1, #0x1                ; =1
    2530:      	str	x1, [x29, #0x128]
    2534:      	b	0x2564 <_stogir.verify.classifications+0x1d8>
    2538:      	ldr	x0, [x29, #0xf8]
    253c:      	bl	0x253c <_stogir.verify.classifications+0x1b0>
		000000000000253c:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
    2540:      	cbz	x0, 0x2550 <_stogir.verify.classifications+0x1c4>
    2544:      	mov	w0, #0x1                ; =1
    2548:      	str	x0, [x29, #0xf8]
    254c:      	b	0x255c <_stogir.verify.classifications+0x1d0>
    2550:      	ldr	x0, [x29, #0x120]
    2554:      	bl	0x2554 <_stogir.verify.classifications+0x1c8>
		0000000000002554:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
    2558:      	str	x0, [x29, #0xf8]
    255c:      	ldr	x0, [x29, #0xf8]
    2560:      	str	x0, [x29, #0x128]
    2564:      	ldr	x0, [x29, #0x128]
    2568:      	str	x0, [x29, #0x110]
    256c:      	ldr	x0, [x29, #0x110]
    2570:      	str	x0, [x29, #0x128]
    2574:      	b	0x2580 <_stogir.verify.classifications+0x1f4>
    2578:      	mov	w0, #0x0                ; =0
    257c:      	str	x0, [x29, #0x128]
    2580:      	ldr	x0, [x29, #0x128]
    2584:      	str	x0, [x29, #0x110]
    2588:      	b	0x2594 <_stogir.verify.classifications+0x208>
    258c:      	mov	w0, #0x0                ; =0
    2590:      	str	x0, [x29, #0x110]
    2594:      	ldr	x19, [x29, #0x108]
    2598:      	mov	w20, #0x1               ; =1
    259c:      	cbz	x19, 0x25a8 <_stogir.verify.classifications+0x21c>
    25a0:      	mov	w21, #0x0               ; =0
    25a4:      	b	0x25ac <_stogir.verify.classifications+0x220>
    25a8:      	mov	w21, #0x1               ; =1
    25ac:      	cbz	x21, 0x25c4 <_stogir.verify.classifications+0x238>
    25b0:      	ldr	x0, [x29, #0xe8]
    25b4:      	cmp	x20, x0
    25b8:      	cset	x1, le
    25bc:      	mov	x21, x1
    25c0:      	b	0x25c8 <_stogir.verify.classifications+0x23c>
    25c4:      	mov	w21, #0x0               ; =0
    25c8:      	cbz	x21, 0x276c <_stogir.verify.classifications+0x3e0>
    25cc:      	ldr	x0, [x29, #0x100]
    25d0:      	mov	x1, x20
    25d4:      	bl	0x25d4 <_stogir.verify.classifications+0x248>
		00000000000025d4:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
    25d8:      	ubfx	x21, x0, #0, #32
    25dc:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		00000000000025dc:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-DEF
    25e0:      	add	x0, x0, #0x0
		00000000000025e0:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-DEF
    25e4:      	ldr	w0, [x0]
    25e8:      	cmp	x21, x0
    25ec:      	b.ne	0x25f8 <_stogir.verify.classifications+0x26c>
    25f0:      	mov	w22, #0x1               ; =1
    25f4:      	b	0x2610 <_stogir.verify.classifications+0x284>
    25f8:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		00000000000025f8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-REF
    25fc:      	add	x0, x0, #0x0
		00000000000025fc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-REF
    2600:      	ldr	w0, [x0]
    2604:      	cmp	x21, x0
    2608:      	cset	x0, eq
    260c:      	mov	x22, x0
    2610:      	cbz	x22, 0x2750 <_stogir.verify.classifications+0x3c4>
    2614:      	cmp	x20, #0x1
    2618:      	b.ne	0x2624 <_stogir.verify.classifications+0x298>
    261c:      	ldr	x21, [x29, #0x118]
    2620:      	b	0x2628 <_stogir.verify.classifications+0x29c>
    2624:      	mov	w21, #0x0               ; =0
    2628:      	cbz	x21, 0x263c <_stogir.verify.classifications+0x2b0>
    262c:      	ldr	x0, [x29, #0x120]
    2630:      	bl	0x2630 <_stogir.verify.classifications+0x2a4>
		0000000000002630:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    2634:      	mov	x21, x0
    2638:      	b	0x2748 <_stogir.verify.classifications+0x3bc>
    263c:      	cmp	x20, #0x1
    2640:      	b.ne	0x2654 <_stogir.verify.classifications+0x2c8>
    2644:      	ldr	x0, [x29, #0xe0]
    2648:      	ldrsw	x1, [x0, #0x4]
    264c:      	mov	x22, x1
    2650:      	b	0x26dc <_stogir.verify.classifications+0x350>
    2654:      	cmp	x20, #0x2
    2658:      	b.ne	0x266c <_stogir.verify.classifications+0x2e0>
    265c:      	ldr	x0, [x29, #0xe0]
    2660:      	ldrsw	x1, [x0, #0x8]
    2664:      	mov	x23, x1
    2668:      	b	0x26d8 <_stogir.verify.classifications+0x34c>
    266c:      	cmp	x20, #0x3
    2670:      	b.ne	0x2684 <_stogir.verify.classifications+0x2f8>
    2674:      	ldr	x0, [x29, #0xe0]
    2678:      	ldrsw	x1, [x0, #0xc]
    267c:      	str	x1, [x29, #0x108]
    2680:      	b	0x26d4 <_stogir.verify.classifications+0x348>
    2684:      	ldr	x0, [x29, #0xf0]
    2688:      	ldr	x1, [x29, #0xd8]
    268c:      	mov	x2, x20
    2690:      	bl	0x2690 <_stogir.verify.classifications+0x304>
		0000000000002690:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    2694:      	str	x0, [x29, #0xb0]
    2698:      	str	x1, [x29, #0xb8]
    269c:      	ldr	w0, [x29, #0xb0]
    26a0:      	cmp	x0, #0x0
    26a4:      	b.eq	0x26b8 <_stogir.verify.classifications+0x32c>
    26a8:      	cmp	x0, #0x1
    26ac:      	b.eq	0x26c4 <_stogir.verify.classifications+0x338>
    26b0:      	b	0x26b4 <_stogir.verify.classifications+0x328>
    26b4:      	b	0x2768 <_stogir.verify.classifications+0x3dc>
    26b8:      	mov	w0, #0x0                ; =0
    26bc:      	str	x0, [x29, #0x128]
    26c0:      	b	0x26cc <_stogir.verify.classifications+0x340>
    26c4:      	ldrsw	x0, [x29, #0xb8]
    26c8:      	str	x0, [x29, #0x128]
    26cc:      	ldr	x0, [x29, #0x128]
    26d0:      	str	x0, [x29, #0x108]
    26d4:      	ldr	x23, [x29, #0x108]
    26d8:      	mov	x22, x23
    26dc:      	ldr	x0, [x29, #0xf0]
    26e0:      	mov	x1, x22
    26e4:      	bl	0x26e4 <_stogir.verify.classifications+0x358>
		00000000000026e4:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    26e8:      	mov	x22, x0
    26ec:      	str	x22, [x29, #0xc0]
    26f0:      	str	xzr, [x29, #0xc8]
    26f4:      	ldr	x0, [x29, #0xc0]
    26f8:      	ldr	x1, [x29, #0xc8]
    26fc:      	cmp	x0, x1
    2700:      	b.ne	0x270c <_stogir.verify.classifications+0x380>
    2704:      	mov	w23, #0x0               ; =0
    2708:      	b	0x2710 <_stogir.verify.classifications+0x384>
    270c:      	mov	w23, #0x1               ; =1
    2710:      	cbz	x23, 0x2730 <_stogir.verify.classifications+0x3a4>
    2714:      	mov	x0, x22
    2718:      	bl	0x2718 <_stogir.verify.classifications+0x38c>
		0000000000002718:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    271c:      	ubfx	x0, x0, #0, #8
    2720:      	sxtw	x0, w0
    2724:      	bl	0x2724 <_stogir.verify.classifications+0x398>
		0000000000002724:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    2728:      	mov	x22, x0
    272c:      	b	0x2734 <_stogir.verify.classifications+0x3a8>
    2730:      	mov	w22, #0x0               ; =0
    2734:      	cbz	x22, 0x2740 <_stogir.verify.classifications+0x3b4>
    2738:      	mov	w22, #0x1               ; =1
    273c:      	b	0x2744 <_stogir.verify.classifications+0x3b8>
    2740:      	mov	x22, x19
    2744:      	mov	x21, x22
    2748:      	mov	x22, x21
    274c:      	b	0x2754 <_stogir.verify.classifications+0x3c8>
    2750:      	mov	x22, x19
    2754:      	add	x0, x20, #0x1
    2758:      	sxtw	x21, w0
    275c:      	mov	x19, x22
    2760:      	mov	x20, x21
    2764:      	b	0x259c <_stogir.verify.classifications+0x210>
    2768:      	brk	#0x1
    276c:      	strh	wzr, [x29, #0xd2]
    2770:      	ldrh	w0, [x29, #0xd2]
    2774:      	strh	w0, [x29, #0xd0]
    2778:      	strb	w19, [x29, #0xd0]
    277c:      	ldr	x0, [x29, #0x110]
    2780:      	strb	w0, [x29, #0xd1]
    2784:      	ldrh	w0, [x29, #0xd0]
    2788:      	strh	w0, [x29, #0xd4]
    278c:      	ldrh	w0, [x29, #0xd4]
    2790:      	ldp	x19, x20, [sp, #0x10]
    2794:      	ldp	x21, x22, [sp, #0x20]
    2798:      	ldr	x23, [sp, #0x30]
    279c:      	ldp	x29, x30, [sp], #0x130
    27a0:      	ret

00000000000027a4 <_stogir.vector-lanes.operation?>:
    27a4:      	sxtw	x2, w0
    27a8:      	cmp	x2, #0x3d
    27ac:      	b.lt	0x27c0 <_stogir.vector-lanes.operation?+0x1c>
    27b0:      	cmp	x2, #0x3f
    27b4:      	cset	x0, le
    27b8:      	mov	x2, x0
    27bc:      	b	0x27c4 <_stogir.vector-lanes.operation?+0x20>
    27c0:      	mov	w2, #0x0                ; =0
    27c4:      	mov	x0, x2
    27c8:      	ret

00000000000027cc <_stogir.vector.validate>:
    27cc:      	sub	sp, sp, #0x570
    27d0:      	stp	x29, x30, [sp]
    27d4:      	mov	x29, sp
    27d8:      	stp	x19, x20, [sp, #0x10]
    27dc:      	sxtw	x1, w1
    27e0:      	sxtw	x2, w2
    27e4:      	mov	x9, x8
    27e8:      	add	x8, x29, #0xa0
    27ec:      	mov	x10, x0
    27f0:      	mov	x11, x1
    27f4:      	str	x2, [x29, #0x438]
    27f8:      	str	x9, [x29, #0x388]
    27fc:      	str	x10, [x29, #0x248]
    2800:      	str	x11, [x29, #0x4f0]
    2804:      	bl	0x2804 <_stogir.vector.validate+0x38>
		0000000000002804:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    2808:      	ldr	w0, [x29, #0xa0]
    280c:      	cmp	x0, #0x0
    2810:      	b.eq	0x2824 <_stogir.vector.validate+0x58>
    2814:      	cmp	x0, #0x1
    2818:      	b.eq	0x2854 <_stogir.vector.validate+0x88>
    281c:      	b	0x2820 <_stogir.vector.validate+0x54>
    2820:      	b	0x31e4 <_stogir.vector.validate+0xa18>
    2824:      	mov	w0, #0x1                ; =1
    2828:      	str	w0, [x29, #0xd0]
    282c:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		000000000000282c:  ARM64_RELOC_PAGE21	l_cstr.73
    2830:      	add	x0, x0, #0x0
		0000000000002830:  ARM64_RELOC_PAGEOFF12	l_cstr.73
    2834:      	str	x0, [x29, #0xf0]
    2838:      	mov	w0, #0x1a               ; =26
    283c:      	str	x0, [x29, #0xf8]
    2840:      	ldr	q0, [x29, #0xf0]
    2844:      	stur	q0, [x29, #0xd8]
    2848:      	add	x0, x29, #0xd0
    284c:      	str	x0, [x29, #0x4f8]
    2850:      	b	0x31c8 <_stogir.vector.validate+0x9fc>
    2854:      	ldur	q0, [x29, #0xa8]
    2858:      	str	q0, [x29, #0x100]
    285c:      	ldr	x0, [x29, #0x4f0]
    2860:      	cmp	x0, #0x0
    2864:      	b.gt	0x289c <_stogir.vector.validate+0xd0>
    2868:      	mov	w1, #0x1                ; =1
    286c:      	str	w1, [x29, #0x110]
    2870:      	adrp	x1, 0x2000 <_stogir.uses.edge-code?+0x4>
		0000000000002870:  ARM64_RELOC_PAGE21	l_cstr.74
    2874:      	add	x1, x1, #0x0
		0000000000002874:  ARM64_RELOC_PAGEOFF12	l_cstr.74
    2878:      	str	x1, [x29, #0x130]
    287c:      	mov	w1, #0x3b               ; =59
    2880:      	str	x1, [x29, #0x138]
    2884:      	ldr	q0, [x29, #0x130]
    2888:      	mov	w16, #0x118             ; =280
    288c:      	str	q0, [x29, x16]
    2890:      	add	x1, x29, #0x110
    2894:      	str	x1, [x29, #0x500]
    2898:      	b	0x31c0 <_stogir.vector.validate+0x9f4>
    289c:      	add	x0, x29, #0x100
    28a0:      	bl	0x28a0 <_stogir.vector.validate+0xd4>
		00000000000028a0:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    28a4:      	ubfx	x0, x0, #0, #8
    28a8:      	sxtw	x0, w0
    28ac:      	mov	x9, x0
    28b0:      	add	x0, x29, #0x100
    28b4:      	str	x9, [x29, #0x508]
    28b8:      	bl	0x28b8 <_stogir.vector.validate+0xec>
		00000000000028b8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    28bc:      	ubfx	x0, x0, #0, #8
    28c0:      	sxtw	x0, w0
    28c4:      	ldr	x1, [x29, #0x248]
    28c8:      	ldr	x2, [x1, #0x78]
    28cc:      	ldr	x3, [x29, #0x4f0]
    28d0:      	add	x2, x2, x3, lsl #2
    28d4:      	ldrsw	x2, [x2]
    28d8:      	ldr	x4, [x29, #0x508]
    28dc:      	cmp	x4, #0x24
    28e0:      	str	x0, [x29, #0x510]
    28e4:      	str	x2, [x29, #0x518]
    28e8:      	b.ne	0x28f8 <_stogir.vector.validate+0x12c>
    28ec:      	mov	w5, #0x1                ; =1
    28f0:      	str	x5, [x29, #0x520]
    28f4:      	b	0x2908 <_stogir.vector.validate+0x13c>
    28f8:      	ldr	x0, [x29, #0x508]
    28fc:      	cmp	x0, #0x44
    2900:      	cset	x1, eq
    2904:      	str	x1, [x29, #0x520]
    2908:      	ldr	x0, [x29, #0x520]
    290c:      	cbz	x0, 0x2964 <_stogir.vector.validate+0x198>
    2910:      	ldr	x0, [x29, #0x508]
    2914:      	cmp	x0, #0x44
    2918:      	b.ne	0x293c <_stogir.vector.validate+0x170>
    291c:      	add	x8, x29, #0x140
    2920:      	mov	x9, x0
    2924:      	ldr	x0, [x29, #0x248]
    2928:      	ldr	x1, [x29, #0x4f0]
    292c:      	bl	0x292c <_stogir.vector.validate+0x160>
		000000000000292c:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    2930:      	add	x0, x29, #0x140
    2934:      	str	x0, [x29, #0x520]
    2938:      	b	0x2958 <_stogir.vector.validate+0x18c>
    293c:      	add	x8, x29, #0x160
    2940:      	ldr	x0, [x29, #0x248]
    2944:      	ldr	x1, [x29, #0x4f0]
    2948:      	ldr	x2, [x29, #0x438]
    294c:      	bl	0x294c <_stogir.vector.validate+0x180>
		000000000000294c:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    2950:      	add	x0, x29, #0x160
    2954:      	str	x0, [x29, #0x520]
    2958:      	ldr	x0, [x29, #0x520]
    295c:      	str	x0, [x29, #0x528]
    2960:      	b	0x31b8 <_stogir.vector.validate+0x9ec>
    2964:      	ldr	x0, [x29, #0x508]
    2968:      	cmp	x0, #0x3c
    296c:      	b.ne	0x2990 <_stogir.vector.validate+0x1c4>
    2970:      	add	x8, x29, #0x180
    2974:      	mov	x9, x0
    2978:      	ldr	x0, [x29, #0x248]
    297c:      	ldr	x1, [x29, #0x4f0]
    2980:      	bl	0x2980 <_stogir.vector.validate+0x1b4>
		0000000000002980:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    2984:      	add	x0, x29, #0x180
    2988:      	str	x0, [x29, #0x520]
    298c:      	b	0x31b0 <_stogir.vector.validate+0x9e4>
    2990:      	ldr	x0, [x29, #0x508]
    2994:      	bl	0x2994 <_stogir.vector.validate+0x1c8>
		0000000000002994:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operation?
    2998:      	cbz	x0, 0x29bc <_stogir.vector.validate+0x1f0>
    299c:      	add	x8, x29, #0x1a0
    29a0:      	ldr	x0, [x29, #0x248]
    29a4:      	ldr	x1, [x29, #0x4f0]
    29a8:      	ldr	x2, [x29, #0x438]
    29ac:      	bl	0x29ac <_stogir.vector.validate+0x1e0>
		00000000000029ac:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.validate
    29b0:      	add	x0, x29, #0x1a0
    29b4:      	str	x0, [x29, #0x530]
    29b8:      	b	0x31a8 <_stogir.vector.validate+0x9dc>
    29bc:      	ldr	x0, [x29, #0x248]
    29c0:      	ldr	x1, [x29, #0x4f0]
    29c4:      	bl	0x29c4 <_stogir.vector.validate+0x1f8>
		00000000000029c4:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.node?
    29c8:      	cbz	x0, 0x29ec <_stogir.vector.validate+0x220>
    29cc:      	add	x8, x29, #0x1c0
    29d0:      	ldr	x0, [x29, #0x248]
    29d4:      	ldr	x1, [x29, #0x4f0]
    29d8:      	ldr	x2, [x29, #0x438]
    29dc:      	bl	0x29dc <_stogir.vector.validate+0x210>
		00000000000029dc:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.validate
    29e0:      	add	x0, x29, #0x1c0
    29e4:      	str	x0, [x29, #0x538]
    29e8:      	b	0x31a0 <_stogir.vector.validate+0x9d4>
    29ec:      	ldr	x0, [x29, #0x508]
    29f0:      	cmp	x0, #0x47
    29f4:      	b.ne	0x2a04 <_stogir.vector.validate+0x238>
    29f8:      	mov	w1, #0x1                ; =1
    29fc:      	str	x1, [x29, #0x540]
    2a00:      	b	0x2a98 <_stogir.vector.validate+0x2cc>
    2a04:      	ldr	x0, [x29, #0x508]
    2a08:      	cmp	x0, #0x4f
    2a0c:      	b.ne	0x2a1c <_stogir.vector.validate+0x250>
    2a10:      	mov	w1, #0x1                ; =1
    2a14:      	str	x1, [x29, #0x548]
    2a18:      	b	0x2a2c <_stogir.vector.validate+0x260>
    2a1c:      	ldr	x0, [x29, #0x508]
    2a20:      	cmp	x0, #0x50
    2a24:      	cset	x1, eq
    2a28:      	str	x1, [x29, #0x548]
    2a2c:      	ldr	x0, [x29, #0x548]
    2a30:      	cbz	x0, 0x2a40 <_stogir.vector.validate+0x274>
    2a34:      	mov	w0, #0x1                ; =1
    2a38:      	str	x0, [x29, #0x548]
    2a3c:      	b	0x2a90 <_stogir.vector.validate+0x2c4>
    2a40:      	ldr	x0, [x29, #0x508]
    2a44:      	cmp	x0, #0x78
    2a48:      	b.ne	0x2a58 <_stogir.vector.validate+0x28c>
    2a4c:      	mov	w1, #0x1                ; =1
    2a50:      	str	x1, [x29, #0x550]
    2a54:      	b	0x2a88 <_stogir.vector.validate+0x2bc>
    2a58:      	ldr	x0, [x29, #0x508]
    2a5c:      	bl	0x2a5c <_stogir.vector.validate+0x290>
		0000000000002a5c:  ARM64_RELOC_BRANCH26	_stogir.locals.operation?
    2a60:      	cbz	x0, 0x2a70 <_stogir.vector.validate+0x2a4>
    2a64:      	mov	w0, #0x1                ; =1
    2a68:      	str	x0, [x29, #0x558]
    2a6c:      	b	0x2a80 <_stogir.vector.validate+0x2b4>
    2a70:      	ldr	x0, [x29, #0x248]
    2a74:      	ldr	x1, [x29, #0x4f0]
    2a78:      	bl	0x2a78 <_stogir.vector.validate+0x2ac>
		0000000000002a78:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    2a7c:      	str	x0, [x29, #0x558]
    2a80:      	ldr	x0, [x29, #0x558]
    2a84:      	str	x0, [x29, #0x550]
    2a88:      	ldr	x0, [x29, #0x550]
    2a8c:      	str	x0, [x29, #0x548]
    2a90:      	ldr	x0, [x29, #0x548]
    2a94:      	str	x0, [x29, #0x540]
    2a98:      	ldr	x0, [x29, #0x540]
    2a9c:      	cbz	x0, 0x2b1c <_stogir.vector.validate+0x350>
    2aa0:      	ldr	x0, [x29, #0x248]
    2aa4:      	ldr	x1, [x29, #0x4f0]
    2aa8:      	bl	0x2aa8 <_stogir.vector.validate+0x2dc>
		0000000000002aa8:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    2aac:      	cbz	x0, 0x2acc <_stogir.vector.validate+0x300>
    2ab0:      	add	x8, x29, #0x1e0
    2ab4:      	ldr	x0, [x29, #0x248]
    2ab8:      	ldr	x1, [x29, #0x4f0]
    2abc:      	bl	0x2abc <_stogir.vector.validate+0x2f0>
		0000000000002abc:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.validate
    2ac0:      	add	x0, x29, #0x1e0
    2ac4:      	str	x0, [x29, #0x540]
    2ac8:      	b	0x2b10 <_stogir.vector.validate+0x344>
    2acc:      	ldr	x0, [x29, #0x508]
    2ad0:      	bl	0x2ad0 <_stogir.vector.validate+0x304>
		0000000000002ad0:  ARM64_RELOC_BRANCH26	_stogir.locals.operation?
    2ad4:      	cbz	x0, 0x2af8 <_stogir.vector.validate+0x32c>
    2ad8:      	add	x8, x29, #0x200
    2adc:      	ldr	x0, [x29, #0x248]
    2ae0:      	ldr	x1, [x29, #0x4f0]
    2ae4:      	ldr	x2, [x29, #0x438]
    2ae8:      	bl	0x2ae8 <_stogir.vector.validate+0x31c>
		0000000000002ae8:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    2aec:      	add	x0, x29, #0x200
    2af0:      	str	x0, [x29, #0x548]
    2af4:      	b	0x2b08 <_stogir.vector.validate+0x33c>
    2af8:      	str	wzr, [x29, #0x220]
    2afc:      	str	wzr, [x29, #0x228]
    2b00:      	add	x0, x29, #0x220
    2b04:      	str	x0, [x29, #0x548]
    2b08:      	ldr	x0, [x29, #0x548]
    2b0c:      	str	x0, [x29, #0x540]
    2b10:      	ldr	x0, [x29, #0x540]
    2b14:      	str	x0, [x29, #0x548]
    2b18:      	b	0x3198 <_stogir.vector.validate+0x9cc>
    2b1c:      	ldr	x0, [x29, #0x508]
    2b20:      	cmp	x0, #0x5b
    2b24:      	b.ne	0x2b34 <_stogir.vector.validate+0x368>
    2b28:      	mov	w1, #0x1                ; =1
    2b2c:      	str	x1, [x29, #0x540]
    2b30:      	b	0x2b44 <_stogir.vector.validate+0x378>
    2b34:      	ldr	x0, [x29, #0x508]
    2b38:      	cmp	x0, #0x5c
    2b3c:      	cset	x1, eq
    2b40:      	str	x1, [x29, #0x540]
    2b44:      	ldr	x0, [x29, #0x540]
    2b48:      	cbz	x0, 0x2bfc <_stogir.vector.validate+0x430>
    2b4c:      	ldr	x0, [x29, #0x518]
    2b50:      	str	w0, [x29, #0x240]
    2b54:      	mov	w1, #0x2                ; =2
    2b58:      	str	w1, [x29, #0x244]
    2b5c:      	ldrsw	x1, [x29, #0x240]
    2b60:      	ldrsw	x2, [x29, #0x244]
    2b64:      	cmp	x1, x2
    2b68:      	b.ne	0x2b78 <_stogir.vector.validate+0x3ac>
    2b6c:      	mov	w1, #0x0                ; =0
    2b70:      	str	x1, [x29, #0x540]
    2b74:      	b	0x2b80 <_stogir.vector.validate+0x3b4>
    2b78:      	mov	w0, #0x1                ; =1
    2b7c:      	str	x0, [x29, #0x540]
    2b80:      	ldr	x0, [x29, #0x540]
    2b84:      	cbz	x0, 0x2bbc <_stogir.vector.validate+0x3f0>
    2b88:      	mov	w0, #0x1                ; =1
    2b8c:      	str	w0, [x29, #0x250]
    2b90:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		0000000000002b90:  ARM64_RELOC_PAGE21	l_cstr.75
    2b94:      	add	x0, x0, #0x0
		0000000000002b94:  ARM64_RELOC_PAGEOFF12	l_cstr.75
    2b98:      	str	x0, [x29, #0x270]
    2b9c:      	mov	w0, #0x19               ; =25
    2ba0:      	str	x0, [x29, #0x278]
    2ba4:      	ldr	q0, [x29, #0x270]
    2ba8:      	mov	w16, #0x258             ; =600
    2bac:      	str	q0, [x29, x16]
    2bb0:      	add	x0, x29, #0x250
    2bb4:      	str	x0, [x29, #0x540]
    2bb8:      	b	0x2bf0 <_stogir.vector.validate+0x424>
    2bbc:      	ldrsw	x0, [x29, #0x104]
    2bc0:      	ldrsw	x1, [x29, #0x108]
    2bc4:      	add	x8, x29, #0x280
    2bc8:      	mov	x9, x0
    2bcc:      	ldr	x0, [x29, #0x248]
    2bd0:      	mov	x10, x1
    2bd4:      	ldr	x1, [x29, #0x510]
    2bd8:      	ldr	x2, [x29, #0x438]
    2bdc:      	mov	x3, x9
    2be0:      	mov	x4, x10
    2be4:      	bl	0x2be4 <_stogir.vector.validate+0x418>
		0000000000002be4:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    2be8:      	add	x0, x29, #0x280
    2bec:      	str	x0, [x29, #0x540]
    2bf0:      	ldr	x0, [x29, #0x540]
    2bf4:      	str	x0, [x29, #0x550]
    2bf8:      	b	0x3190 <_stogir.vector.validate+0x9c4>
    2bfc:      	ldr	x0, [x29, #0x508]
    2c00:      	cmp	x0, #0x5d
    2c04:      	b.ne	0x2c14 <_stogir.vector.validate+0x448>
    2c08:      	mov	w1, #0x1                ; =1
    2c0c:      	str	x1, [x29, #0x540]
    2c10:      	b	0x2c24 <_stogir.vector.validate+0x458>
    2c14:      	ldr	x0, [x29, #0x508]
    2c18:      	cmp	x0, #0x5e
    2c1c:      	cset	x1, eq
    2c20:      	str	x1, [x29, #0x540]
    2c24:      	ldr	x0, [x29, #0x540]
    2c28:      	cbz	x0, 0x2d30 <_stogir.vector.validate+0x564>
    2c2c:      	ldr	x0, [x29, #0x518]
    2c30:      	str	w0, [x29, #0x2a0]
    2c34:      	mov	w1, #0x3                ; =3
    2c38:      	str	w1, [x29, #0x2a4]
    2c3c:      	ldrsw	x1, [x29, #0x2a0]
    2c40:      	ldrsw	x2, [x29, #0x2a4]
    2c44:      	cmp	x1, x2
    2c48:      	b.ne	0x2c58 <_stogir.vector.validate+0x48c>
    2c4c:      	mov	w1, #0x0                ; =0
    2c50:      	str	x1, [x29, #0x540]
    2c54:      	b	0x2c60 <_stogir.vector.validate+0x494>
    2c58:      	mov	w0, #0x1                ; =1
    2c5c:      	str	x0, [x29, #0x540]
    2c60:      	ldr	x0, [x29, #0x540]
    2c64:      	cbz	x0, 0x2c74 <_stogir.vector.validate+0x4a8>
    2c68:      	mov	w0, #0x1                ; =1
    2c6c:      	str	x0, [x29, #0x540]
    2c70:      	b	0x2cac <_stogir.vector.validate+0x4e0>
    2c74:      	ldr	x0, [x29, #0x510]
    2c78:      	str	w0, [x29, #0x2a8]
    2c7c:      	str	wzr, [x29, #0x2ac]
    2c80:      	ldrsw	x1, [x29, #0x2a8]
    2c84:      	ldrsw	x2, [x29, #0x2ac]
    2c88:      	cmp	x1, x2
    2c8c:      	b.ne	0x2c9c <_stogir.vector.validate+0x4d0>
    2c90:      	mov	w1, #0x0                ; =0
    2c94:      	str	x1, [x29, #0x558]
    2c98:      	b	0x2ca4 <_stogir.vector.validate+0x4d8>
    2c9c:      	mov	w0, #0x1                ; =1
    2ca0:      	str	x0, [x29, #0x558]
    2ca4:      	ldr	x0, [x29, #0x558]
    2ca8:      	str	x0, [x29, #0x540]
    2cac:      	ldr	x0, [x29, #0x540]
    2cb0:      	cbz	x0, 0x2ce8 <_stogir.vector.validate+0x51c>
    2cb4:      	mov	w0, #0x1                ; =1
    2cb8:      	str	w0, [x29, #0x2b0]
    2cbc:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		0000000000002cbc:  ARM64_RELOC_PAGE21	l_cstr.76
    2cc0:      	add	x0, x0, #0x0
		0000000000002cc0:  ARM64_RELOC_PAGEOFF12	l_cstr.76
    2cc4:      	str	x0, [x29, #0x2d0]
    2cc8:      	mov	w0, #0x1a               ; =26
    2ccc:      	str	x0, [x29, #0x2d8]
    2cd0:      	ldr	q0, [x29, #0x2d0]
    2cd4:      	mov	w16, #0x2b8             ; =696
    2cd8:      	str	q0, [x29, x16]
    2cdc:      	add	x0, x29, #0x2b0
    2ce0:      	str	x0, [x29, #0x540]
    2ce4:      	b	0x2d24 <_stogir.vector.validate+0x558>
    2ce8:      	ldrsw	x0, [x29, #0x104]
    2cec:      	ldrsw	x1, [x29, #0x108]
    2cf0:      	ldrsw	x2, [x29, #0x10c]
    2cf4:      	add	x8, x29, #0x2e0
    2cf8:      	mov	x9, x0
    2cfc:      	ldr	x0, [x29, #0x248]
    2d00:      	mov	x10, x1
    2d04:      	ldr	x1, [x29, #0x438]
    2d08:      	mov	x11, x2
    2d0c:      	mov	x2, x9
    2d10:      	mov	x3, x10
    2d14:      	mov	x4, x11
    2d18:      	bl	0x2d18 <_stogir.vector.validate+0x54c>
		0000000000002d18:  ARM64_RELOC_BRANCH26	_stogir.vector.store-inputs
    2d1c:      	add	x0, x29, #0x2e0
    2d20:      	str	x0, [x29, #0x540]
    2d24:      	ldr	x0, [x29, #0x540]
    2d28:      	str	x0, [x29, #0x558]
    2d2c:      	b	0x3188 <_stogir.vector.validate+0x9bc>
    2d30:      	ldr	x0, [x29, #0x508]
    2d34:      	cmp	x0, #0x43
    2d38:      	b.ne	0x3150 <_stogir.vector.validate+0x984>
    2d3c:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		0000000000002d3c:  ARM64_RELOC_PAGE21	l_cstr.51
    2d40:      	add	x0, x0, #0x0
		0000000000002d40:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    2d44:      	str	x0, [x29, #0x310]
    2d48:      	str	xzr, [x29, #0x318]
    2d4c:      	ldr	q0, [x29, #0x310]
    2d50:      	str	q0, [x29, #0x300]
    2d54:      	ldr	x0, [x29, #0x510]
    2d58:      	bl	0x2d58 <_stogir.vector.validate+0x58c>
		0000000000002d58:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    2d5c:      	cbz	x0, 0x2d6c <_stogir.vector.validate+0x5a0>
    2d60:      	mov	w0, #0x0                ; =0
    2d64:      	str	x0, [x29, #0x508]
    2d68:      	b	0x2d74 <_stogir.vector.validate+0x5a8>
    2d6c:      	mov	w0, #0x1                ; =1
    2d70:      	str	x0, [x29, #0x508]
    2d74:      	ldr	x0, [x29, #0x508]
    2d78:      	cbz	x0, 0x2d88 <_stogir.vector.validate+0x5bc>
    2d7c:      	mov	w0, #0x1                ; =1
    2d80:      	str	x0, [x29, #0x508]
    2d84:      	b	0x2dc4 <_stogir.vector.validate+0x5f8>
    2d88:      	ldr	x0, [x29, #0x510]
    2d8c:      	ldr	x1, [x29, #0x438]
    2d90:      	bl	0x2d90 <_stogir.vector.validate+0x5c4>
		0000000000002d90:  ARM64_RELOC_BRANCH26	_stogir.types.size
    2d94:      	sxtw	x0, w0
    2d98:      	cmp	x0, #0x0
    2d9c:      	b.gt	0x2dac <_stogir.vector.validate+0x5e0>
    2da0:      	mov	w0, #0x1                ; =1
    2da4:      	str	x0, [x29, #0x540]
    2da8:      	b	0x2dbc <_stogir.vector.validate+0x5f0>
    2dac:      	ldr	x0, [x29, #0x518]
    2db0:      	cmp	x0, #0x3
    2db4:      	cset	x1, lt
    2db8:      	str	x1, [x29, #0x540]
    2dbc:      	ldr	x0, [x29, #0x540]
    2dc0:      	str	x0, [x29, #0x508]
    2dc4:      	ldr	x0, [x29, #0x508]
    2dc8:      	cbz	x0, 0x2dec <_stogir.vector.validate+0x620>
    2dcc:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		0000000000002dcc:  ARM64_RELOC_PAGE21	l_cstr.77
    2dd0:      	add	x0, x0, #0x0
		0000000000002dd0:  ARM64_RELOC_PAGEOFF12	l_cstr.77
    2dd4:      	str	x0, [x29, #0x320]
    2dd8:      	mov	w0, #0x20               ; =32
    2ddc:      	str	x0, [x29, #0x328]
    2de0:      	ldr	q0, [x29, #0x320]
    2de4:      	str	q0, [x29, #0x300]
    2de8:      	b	0x2dec <_stogir.vector.validate+0x620>
    2dec:      	ldrsw	x0, [x29, #0x104]
    2df0:      	add	x8, x29, #0x330
    2df4:      	mov	x9, x0
    2df8:      	ldr	x0, [x29, #0x248]
    2dfc:      	mov	x1, x9
    2e00:      	bl	0x2e00 <_stogir.vector.validate+0x634>
		0000000000002e00:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    2e04:      	ldr	w0, [x29, #0x330]
    2e08:      	cmp	x0, #0x0
    2e0c:      	b.eq	0x2e20 <_stogir.vector.validate+0x654>
    2e10:      	cmp	x0, #0x1
    2e14:      	b.eq	0x2e40 <_stogir.vector.validate+0x674>
    2e18:      	b	0x2e1c <_stogir.vector.validate+0x650>
    2e1c:      	b	0x314c <_stogir.vector.validate+0x980>
    2e20:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		0000000000002e20:  ARM64_RELOC_PAGE21	l_cstr.78
    2e24:      	add	x0, x0, #0x0
		0000000000002e24:  ARM64_RELOC_PAGEOFF12	l_cstr.78
    2e28:      	str	x0, [x29, #0x360]
    2e2c:      	mov	w0, #0x19               ; =25
    2e30:      	str	x0, [x29, #0x368]
    2e34:      	ldr	q0, [x29, #0x360]
    2e38:      	str	q0, [x29, #0x300]
    2e3c:      	b	0x2f50 <_stogir.vector.validate+0x784>
    2e40:      	mov	w16, #0x338             ; =824
    2e44:      	ldr	q0, [x29, x16]
    2e48:      	str	q0, [x29, #0x370]
    2e4c:      	ldrsw	x0, [x29, #0x104]
    2e50:      	cmp	x0, #0x0
    2e54:      	b.gt	0x2e64 <_stogir.vector.validate+0x698>
    2e58:      	mov	w0, #0x1                ; =1
    2e5c:      	str	x0, [x29, #0x508]
    2e60:      	b	0x2f28 <_stogir.vector.validate+0x75c>
    2e64:      	add	x0, x29, #0x370
    2e68:      	bl	0x2e68 <_stogir.vector.validate+0x69c>
		0000000000002e68:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    2e6c:      	ubfx	x0, x0, #0, #8
    2e70:      	cmp	x0, #0x70
    2e74:      	b.ne	0x2e84 <_stogir.vector.validate+0x6b8>
    2e78:      	mov	w0, #0x1                ; =1
    2e7c:      	str	x0, [x29, #0x540]
    2e80:      	b	0x2e9c <_stogir.vector.validate+0x6d0>
    2e84:      	add	x0, x29, #0x370
    2e88:      	bl	0x2e88 <_stogir.vector.validate+0x6bc>
		0000000000002e88:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    2e8c:      	ubfx	x0, x0, #0, #8
    2e90:      	cmp	x0, #0x71
    2e94:      	cset	x0, eq
    2e98:      	str	x0, [x29, #0x540]
    2e9c:      	ldr	x0, [x29, #0x540]
    2ea0:      	cbz	x0, 0x2eb0 <_stogir.vector.validate+0x6e4>
    2ea4:      	mov	w0, #0x0                ; =0
    2ea8:      	str	x0, [x29, #0x540]
    2eac:      	b	0x2eb8 <_stogir.vector.validate+0x6ec>
    2eb0:      	mov	w0, #0x1                ; =1
    2eb4:      	str	x0, [x29, #0x540]
    2eb8:      	ldr	x0, [x29, #0x540]
    2ebc:      	cbz	x0, 0x2ecc <_stogir.vector.validate+0x700>
    2ec0:      	mov	w0, #0x1                ; =1
    2ec4:      	str	x0, [x29, #0x540]
    2ec8:      	b	0x2f20 <_stogir.vector.validate+0x754>
    2ecc:      	ldr	x0, [x29, #0x518]
    2ed0:      	str	w0, [x29, #0x380]
    2ed4:      	ldrsw	x1, [x29, #0x104]
    2ed8:      	ldr	x2, [x29, #0x248]
    2edc:      	ldr	x3, [x2, #0x78]
    2ee0:      	add	x3, x3, x1, lsl #2
    2ee4:      	ldrsw	x3, [x3]
    2ee8:      	add	x3, x3, #0x1
    2eec:      	sxtw	x3, w3
    2ef0:      	str	w3, [x29, #0x384]
    2ef4:      	ldrsw	x1, [x29, #0x380]
    2ef8:      	ldrsw	x3, [x29, #0x384]
    2efc:      	cmp	x1, x3
    2f00:      	b.ne	0x2f10 <_stogir.vector.validate+0x744>
    2f04:      	mov	w1, #0x0                ; =0
    2f08:      	str	x1, [x29, #0x560]
    2f0c:      	b	0x2f18 <_stogir.vector.validate+0x74c>
    2f10:      	mov	w0, #0x1                ; =1
    2f14:      	str	x0, [x29, #0x560]
    2f18:      	ldr	x0, [x29, #0x560]
    2f1c:      	str	x0, [x29, #0x540]
    2f20:      	ldr	x0, [x29, #0x540]
    2f24:      	str	x0, [x29, #0x508]
    2f28:      	ldr	x0, [x29, #0x508]
    2f2c:      	cbz	x0, 0x2f50 <_stogir.vector.validate+0x784>
    2f30:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		0000000000002f30:  ARM64_RELOC_PAGE21	l_cstr.79
    2f34:      	add	x0, x0, #0x0
		0000000000002f34:  ARM64_RELOC_PAGEOFF12	l_cstr.79
    2f38:      	str	x0, [x29, #0x390]
    2f3c:      	mov	w0, #0x19               ; =25
    2f40:      	str	x0, [x29, #0x398]
    2f44:      	ldr	q0, [x29, #0x390]
    2f48:      	str	q0, [x29, #0x300]
    2f4c:      	b	0x2f50 <_stogir.vector.validate+0x784>
    2f50:      	mov	w19, #0x2               ; =2
    2f54:      	ldr	q0, [x29, #0x300]
    2f58:      	str	q0, [x29, #0x3a0]
    2f5c:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		0000000000002f5c:  ARM64_RELOC_PAGE21	l_cstr.51
    2f60:      	add	x0, x0, #0x0
		0000000000002f60:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    2f64:      	str	x0, [x29, #0x3b0]
    2f68:      	str	xzr, [x29, #0x3b8]
    2f6c:      	ldr	x0, [x29, #0x3a0]
    2f70:      	ldr	x1, [x29, #0x3a8]
    2f74:      	ldr	x2, [x29, #0x3b0]
    2f78:      	ldr	x3, [x29, #0x3b8]
    2f7c:      	bl	0x2f7c <_stogir.vector.validate+0x7b0>
		0000000000002f7c:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    2f80:      	cbz	x0, 0x2f98 <_stogir.vector.validate+0x7cc>
    2f84:      	ldr	x0, [x29, #0x518]
    2f88:      	cmp	x19, x0
    2f8c:      	cset	x1, le
    2f90:      	mov	x20, x1
    2f94:      	b	0x2f9c <_stogir.vector.validate+0x7d0>
    2f98:      	mov	w20, #0x0               ; =0
    2f9c:      	cbz	x20, 0x30c8 <_stogir.vector.validate+0x8fc>
    2fa0:      	ldr	x0, [x29, #0x248]
    2fa4:      	ldr	x1, [x29, #0x4f0]
    2fa8:      	mov	x2, x19
    2fac:      	bl	0x2fac <_stogir.vector.validate+0x7e0>
		0000000000002fac:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    2fb0:      	str	x0, [x29, #0x3c0]
    2fb4:      	str	x1, [x29, #0x3c8]
    2fb8:      	ldr	w0, [x29, #0x3c0]
    2fbc:      	cmp	x0, #0x0
    2fc0:      	b.eq	0x2fd4 <_stogir.vector.validate+0x808>
    2fc4:      	cmp	x0, #0x1
    2fc8:      	b.eq	0x2ff4 <_stogir.vector.validate+0x828>
    2fcc:      	b	0x2fd0 <_stogir.vector.validate+0x804>
    2fd0:      	b	0x30c4 <_stogir.vector.validate+0x8f8>
    2fd4:      	adrp	x0, 0x2000 <_stogir.uses.edge-code?+0x4>
		0000000000002fd4:  ARM64_RELOC_PAGE21	l_cstr.80
    2fd8:      	add	x0, x0, #0x0
		0000000000002fd8:  ARM64_RELOC_PAGEOFF12	l_cstr.80
    2fdc:      	str	x0, [x29, #0x3d0]
    2fe0:      	mov	w0, #0x18               ; =24
    2fe4:      	str	x0, [x29, #0x3d8]
    2fe8:      	ldr	q0, [x29, #0x3d0]
    2fec:      	str	q0, [x29, #0x300]
    2ff0:      	b	0x30b0 <_stogir.vector.validate+0x8e4>
    2ff4:      	ldrsw	x0, [x29, #0x3c8]
    2ff8:      	add	x8, x29, #0x3e0
    2ffc:      	mov	x9, x0
    3000:      	ldr	x0, [x29, #0x248]
    3004:      	mov	x1, x9
    3008:      	bl	0x3008 <_stogir.vector.validate+0x83c>
		0000000000003008:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    300c:      	ldr	w0, [x29, #0x3e0]
    3010:      	cmp	x0, #0x0
    3014:      	b.eq	0x3028 <_stogir.vector.validate+0x85c>
    3018:      	cmp	x0, #0x1
    301c:      	b.eq	0x3048 <_stogir.vector.validate+0x87c>
    3020:      	b	0x3024 <_stogir.vector.validate+0x858>
    3024:      	b	0x30c0 <_stogir.vector.validate+0x8f4>
    3028:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003028:  ARM64_RELOC_PAGE21	l_cstr.80
    302c:      	add	x0, x0, #0x0
		000000000000302c:  ARM64_RELOC_PAGEOFF12	l_cstr.80
    3030:      	str	x0, [x29, #0x410]
    3034:      	mov	w0, #0x18               ; =24
    3038:      	str	x0, [x29, #0x418]
    303c:      	ldr	q0, [x29, #0x410]
    3040:      	str	q0, [x29, #0x300]
    3044:      	b	0x30b0 <_stogir.vector.validate+0x8e4>
    3048:      	mov	w16, #0x3e8             ; =1000
    304c:      	ldr	q0, [x29, x16]
    3050:      	str	q0, [x29, #0x420]
    3054:      	add	x0, x29, #0x420
    3058:      	bl	0x3058 <_stogir.vector.validate+0x88c>
		0000000000003058:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    305c:      	ubfx	x0, x0, #0, #8
    3060:      	sxtw	x0, w0
    3064:      	str	w0, [x29, #0x430]
    3068:      	ldr	x0, [x29, #0x510]
    306c:      	str	w0, [x29, #0x434]
    3070:      	ldrsw	x1, [x29, #0x430]
    3074:      	ldrsw	x2, [x29, #0x434]
    3078:      	cmp	x1, x2
    307c:      	b.ne	0x3088 <_stogir.vector.validate+0x8bc>
    3080:      	mov	w20, #0x0               ; =0
    3084:      	b	0x308c <_stogir.vector.validate+0x8c0>
    3088:      	mov	w20, #0x1               ; =1
    308c:      	cbz	x20, 0x30b0 <_stogir.vector.validate+0x8e4>
    3090:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003090:  ARM64_RELOC_PAGE21	l_cstr.81
    3094:      	add	x0, x0, #0x0
		0000000000003094:  ARM64_RELOC_PAGEOFF12	l_cstr.81
    3098:      	str	x0, [x29, #0x440]
    309c:      	mov	w0, #0x1e               ; =30
    30a0:      	str	x0, [x29, #0x448]
    30a4:      	ldr	q0, [x29, #0x440]
    30a8:      	str	q0, [x29, #0x300]
    30ac:      	b	0x30b0 <_stogir.vector.validate+0x8e4>
    30b0:      	add	x0, x19, #0x1
    30b4:      	sxtw	x20, w0
    30b8:      	mov	x19, x20
    30bc:      	b	0x2f54 <_stogir.vector.validate+0x788>
    30c0:      	brk	#0x1
    30c4:      	brk	#0x1
    30c8:      	ldr	q0, [x29, #0x300]
    30cc:      	str	q0, [x29, #0x450]
    30d0:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		00000000000030d0:  ARM64_RELOC_PAGE21	l_cstr.51
    30d4:      	add	x0, x0, #0x0
		00000000000030d4:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    30d8:      	str	x0, [x29, #0x460]
    30dc:      	str	xzr, [x29, #0x468]
    30e0:      	ldr	x0, [x29, #0x450]
    30e4:      	ldr	x1, [x29, #0x458]
    30e8:      	ldr	x2, [x29, #0x460]
    30ec:      	ldr	x3, [x29, #0x468]
    30f0:      	bl	0x30f0 <_stogir.vector.validate+0x924>
		00000000000030f0:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    30f4:      	cbz	x0, 0x311c <_stogir.vector.validate+0x950>
    30f8:      	str	wzr, [x29, #0x470]
    30fc:      	ldr	x0, [x29, #0x510]
    3100:      	ldr	x1, [x29, #0x438]
    3104:      	bl	0x3104 <_stogir.vector.validate+0x938>
		0000000000003104:  ARM64_RELOC_BRANCH26	_stogir.types.size
    3108:      	sxtw	x0, w0
    310c:      	str	w0, [x29, #0x478]
    3110:      	add	x0, x29, #0x470
    3114:      	str	x0, [x29, #0x438]
    3118:      	b	0x3140 <_stogir.vector.validate+0x974>
    311c:      	mov	w0, #0x1                ; =1
    3120:      	str	w0, [x29, #0x490]
    3124:      	ldr	q0, [x29, #0x300]
    3128:      	str	q0, [x29, #0x4b0]
    312c:      	ldr	q0, [x29, #0x4b0]
    3130:      	mov	w16, #0x498             ; =1176
    3134:      	str	q0, [x29, x16]
    3138:      	add	x0, x29, #0x490
    313c:      	str	x0, [x29, #0x438]
    3140:      	ldr	x0, [x29, #0x438]
    3144:      	str	x0, [x29, #0x510]
    3148:      	b	0x3180 <_stogir.vector.validate+0x9b4>
    314c:      	brk	#0x1
    3150:      	mov	w0, #0x1                ; =1
    3154:      	str	w0, [x29, #0x4c0]
    3158:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003158:  ARM64_RELOC_PAGE21	l_cstr.82
    315c:      	add	x0, x0, #0x0
		000000000000315c:  ARM64_RELOC_PAGEOFF12	l_cstr.82
    3160:      	str	x0, [x29, #0x4e0]
    3164:      	mov	w0, #0x28               ; =40
    3168:      	str	x0, [x29, #0x4e8]
    316c:      	ldr	q0, [x29, #0x4e0]
    3170:      	mov	w16, #0x4c8             ; =1224
    3174:      	str	q0, [x29, x16]
    3178:      	add	x0, x29, #0x4c0
    317c:      	str	x0, [x29, #0x510]
    3180:      	ldr	x0, [x29, #0x510]
    3184:      	str	x0, [x29, #0x558]
    3188:      	ldr	x0, [x29, #0x558]
    318c:      	str	x0, [x29, #0x550]
    3190:      	ldr	x0, [x29, #0x550]
    3194:      	str	x0, [x29, #0x548]
    3198:      	ldr	x0, [x29, #0x548]
    319c:      	str	x0, [x29, #0x538]
    31a0:      	ldr	x0, [x29, #0x538]
    31a4:      	str	x0, [x29, #0x530]
    31a8:      	ldr	x0, [x29, #0x530]
    31ac:      	str	x0, [x29, #0x520]
    31b0:      	ldr	x0, [x29, #0x520]
    31b4:      	str	x0, [x29, #0x528]
    31b8:      	ldr	x0, [x29, #0x528]
    31bc:      	str	x0, [x29, #0x500]
    31c0:      	ldr	x0, [x29, #0x500]
    31c4:      	str	x0, [x29, #0x4f8]
    31c8:      	ldr	x0, [x29, #0x388]
    31cc:      	ldr	x1, [x29, #0x4f8]
    31d0:      	ldr	q0, [x1]
    31d4:      	str	q0, [x0]
    31d8:      	ldr	x2, [x1, #0x10]
    31dc:      	str	x2, [x0, #0x10]
    31e0:      	b	0x31e8 <_stogir.vector.validate+0xa1c>
    31e4:      	brk	#0x1
    31e8:      	ldp	x19, x20, [sp, #0x10]
    31ec:      	ldp	x29, x30, [sp]
    31f0:      	add	sp, sp, #0x570
    31f4:      	ret

00000000000031f8 <_stogir.copy.validate>:
    31f8:      	sub	sp, sp, #0x240
    31fc:      	stp	x29, x30, [sp]
    3200:      	mov	x29, sp
    3204:      	stp	x19, x20, [sp, #0x10]
    3208:      	stp	x21, x22, [sp, #0x20]
    320c:      	str	x23, [sp, #0x30]
    3210:      	mov	x19, x8
    3214:      	mov	x20, x0
    3218:      	sxtw	x21, w1
    321c:      	add	x8, x29, #0xa0
    3220:      	mov	x0, x20
    3224:      	mov	x1, x21
    3228:      	bl	0x3228 <_stogir.copy.validate+0x30>
		0000000000003228:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    322c:      	ldr	w0, [x29, #0xa0]
    3230:      	cmp	x0, #0x0
    3234:      	b.eq	0x3248 <_stogir.copy.validate+0x50>
    3238:      	cmp	x0, #0x1
    323c:      	b.eq	0x3274 <_stogir.copy.validate+0x7c>
    3240:      	b	0x3244 <_stogir.copy.validate+0x4c>
    3244:      	b	0x34d8 <_stogir.copy.validate+0x2e0>
    3248:      	mov	w0, #0x1                ; =1
    324c:      	str	w0, [x29, #0xd0]
    3250:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003250:  ARM64_RELOC_PAGE21	l_cstr.83
    3254:      	add	x0, x0, #0x0
		0000000000003254:  ARM64_RELOC_PAGEOFF12	l_cstr.83
    3258:      	str	x0, [x29, #0xf0]
    325c:      	mov	w0, #0x18               ; =24
    3260:      	str	x0, [x29, #0xf8]
    3264:      	ldr	q0, [x29, #0xf0]
    3268:      	stur	q0, [x29, #0xd8]
    326c:      	add	x22, x29, #0xd0
    3270:      	b	0x34c0 <_stogir.copy.validate+0x2c8>
    3274:      	ldur	q0, [x29, #0xa8]
    3278:      	str	q0, [x29, #0x100]
    327c:      	add	x0, x29, #0x100
    3280:      	bl	0x3280 <_stogir.copy.validate+0x88>
		0000000000003280:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    3284:      	ubfx	x0, x0, #0, #8
    3288:      	sxtw	x23, w0
    328c:      	cmp	x21, #0x0
    3290:      	b.gt	0x32a0 <_stogir.copy.validate+0xa8>
    3294:      	mov	w0, #0x1                ; =1
    3298:      	str	x0, [x29, #0x1c8]
    329c:      	b	0x337c <_stogir.copy.validate+0x184>
    32a0:      	add	x0, x29, #0x100
    32a4:      	bl	0x32a4 <_stogir.copy.validate+0xac>
		00000000000032a4:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    32a8:      	ubfx	x0, x0, #0, #8
    32ac:      	strb	w0, [x29, #0x110]
    32b0:      	mov	w0, #0x44               ; =68
    32b4:      	strb	w0, [x29, #0x111]
    32b8:      	ldrb	w0, [x29, #0x110]
    32bc:      	ldrb	w1, [x29, #0x111]
    32c0:      	cmp	x0, x1
    32c4:      	b.ne	0x32d4 <_stogir.copy.validate+0xdc>
    32c8:      	mov	w0, #0x0                ; =0
    32cc:      	str	x0, [x29, #0x220]
    32d0:      	b	0x32dc <_stogir.copy.validate+0xe4>
    32d4:      	mov	w0, #0x1                ; =1
    32d8:      	str	x0, [x29, #0x220]
    32dc:      	ldr	x0, [x29, #0x220]
    32e0:      	cbz	x0, 0x32f0 <_stogir.copy.validate+0xf8>
    32e4:      	mov	w0, #0x1                ; =1
    32e8:      	str	x0, [x29, #0x220]
    32ec:      	b	0x3374 <_stogir.copy.validate+0x17c>
    32f0:      	ldr	x0, [x20, #0x78]
    32f4:      	add	x0, x0, x21, lsl #2
    32f8:      	ldrsw	x0, [x0]
    32fc:      	str	w0, [x29, #0x114]
    3300:      	mov	w0, #0x2                ; =2
    3304:      	str	w0, [x29, #0x118]
    3308:      	ldrsw	x0, [x29, #0x114]
    330c:      	ldrsw	x1, [x29, #0x118]
    3310:      	cmp	x0, x1
    3314:      	b.ne	0x3320 <_stogir.copy.validate+0x128>
    3318:      	mov	w21, #0x0               ; =0
    331c:      	b	0x3324 <_stogir.copy.validate+0x12c>
    3320:      	mov	w21, #0x1               ; =1
    3324:      	cbz	x21, 0x3330 <_stogir.copy.validate+0x138>
    3328:      	mov	w21, #0x1               ; =1
    332c:      	b	0x3370 <_stogir.copy.validate+0x178>
    3330:      	cmp	x23, #0x0
    3334:      	b.ne	0x3344 <_stogir.copy.validate+0x14c>
    3338:      	mov	w0, #0x1                ; =1
    333c:      	str	x0, [x29, #0x228]
    3340:      	b	0x336c <_stogir.copy.validate+0x174>
    3344:      	mov	x0, x23
    3348:      	bl	0x3348 <_stogir.copy.validate+0x150>
		0000000000003348:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    334c:      	cbz	x0, 0x335c <_stogir.copy.validate+0x164>
    3350:      	mov	w0, #0x0                ; =0
    3354:      	str	x0, [x29, #0x230]
    3358:      	b	0x3364 <_stogir.copy.validate+0x16c>
    335c:      	mov	w0, #0x1                ; =1
    3360:      	str	x0, [x29, #0x230]
    3364:      	ldr	x0, [x29, #0x230]
    3368:      	str	x0, [x29, #0x228]
    336c:      	ldr	x21, [x29, #0x228]
    3370:      	str	x21, [x29, #0x220]
    3374:      	ldr	x0, [x29, #0x220]
    3378:      	str	x0, [x29, #0x1c8]
    337c:      	ldr	x0, [x29, #0x1c8]
    3380:      	cbz	x0, 0x33b4 <_stogir.copy.validate+0x1bc>
    3384:      	mov	w0, #0x1                ; =1
    3388:      	str	w0, [x29, #0x120]
    338c:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		000000000000338c:  ARM64_RELOC_PAGE21	l_cstr.84
    3390:      	add	x0, x0, #0x0
		0000000000003390:  ARM64_RELOC_PAGEOFF12	l_cstr.84
    3394:      	str	x0, [x29, #0x140]
    3398:      	mov	w0, #0x21               ; =33
    339c:      	str	x0, [x29, #0x148]
    33a0:      	ldr	q0, [x29, #0x140]
    33a4:      	mov	w16, #0x128             ; =296
    33a8:      	str	q0, [x29, x16]
    33ac:      	add	x21, x29, #0x120
    33b0:      	b	0x34bc <_stogir.copy.validate+0x2c4>
    33b4:      	ldrsw	x0, [x29, #0x104]
    33b8:      	add	x8, x29, #0x150
    33bc:      	mov	x9, x0
    33c0:      	mov	x0, x20
    33c4:      	mov	x1, x9
    33c8:      	bl	0x33c8 <_stogir.copy.validate+0x1d0>
		00000000000033c8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    33cc:      	ldr	w0, [x29, #0x150]
    33d0:      	cmp	x0, #0x0
    33d4:      	b.eq	0x33e8 <_stogir.copy.validate+0x1f0>
    33d8:      	cmp	x0, #0x1
    33dc:      	b.eq	0x3418 <_stogir.copy.validate+0x220>
    33e0:      	b	0x33e4 <_stogir.copy.validate+0x1ec>
    33e4:      	b	0x34d4 <_stogir.copy.validate+0x2dc>
    33e8:      	mov	w0, #0x1                ; =1
    33ec:      	str	w0, [x29, #0x180]
    33f0:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		00000000000033f0:  ARM64_RELOC_PAGE21	l_cstr.85
    33f4:      	add	x0, x0, #0x0
		00000000000033f4:  ARM64_RELOC_PAGEOFF12	l_cstr.85
    33f8:      	str	x0, [x29, #0x1a0]
    33fc:      	mov	w0, #0x13               ; =19
    3400:      	str	x0, [x29, #0x1a8]
    3404:      	ldr	q0, [x29, #0x1a0]
    3408:      	mov	w16, #0x188             ; =392
    340c:      	str	q0, [x29, x16]
    3410:      	add	x20, x29, #0x180
    3414:      	b	0x34b8 <_stogir.copy.validate+0x2c0>
    3418:      	mov	w16, #0x158             ; =344
    341c:      	ldr	q0, [x29, x16]
    3420:      	str	q0, [x29, #0x1b0]
    3424:      	add	x0, x29, #0x1b0
    3428:      	bl	0x3428 <_stogir.copy.validate+0x230>
		0000000000003428:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    342c:      	ubfx	x0, x0, #0, #8
    3430:      	strb	w0, [x29, #0x1c0]
    3434:      	add	x0, x29, #0x100
    3438:      	bl	0x3438 <_stogir.copy.validate+0x240>
		0000000000003438:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    343c:      	ubfx	x0, x0, #0, #8
    3440:      	strb	w0, [x29, #0x1c1]
    3444:      	ldrb	w0, [x29, #0x1c0]
    3448:      	ldrb	w1, [x29, #0x1c1]
    344c:      	cmp	x0, x1
    3450:      	b.ne	0x3460 <_stogir.copy.validate+0x268>
    3454:      	mov	w0, #0x0                ; =0
    3458:      	str	x0, [x29, #0x1c8]
    345c:      	b	0x3468 <_stogir.copy.validate+0x270>
    3460:      	mov	w0, #0x1                ; =1
    3464:      	str	x0, [x29, #0x1c8]
    3468:      	ldr	x0, [x29, #0x1c8]
    346c:      	cbz	x0, 0x34a4 <_stogir.copy.validate+0x2ac>
    3470:      	mov	w0, #0x1                ; =1
    3474:      	str	w0, [x29, #0x1d0]
    3478:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003478:  ARM64_RELOC_PAGE21	l_cstr.86
    347c:      	add	x0, x0, #0x0
		000000000000347c:  ARM64_RELOC_PAGEOFF12	l_cstr.86
    3480:      	str	x0, [x29, #0x1f0]
    3484:      	mov	w0, #0x20               ; =32
    3488:      	str	x0, [x29, #0x1f8]
    348c:      	ldr	q0, [x29, #0x1f0]
    3490:      	mov	w16, #0x1d8             ; =472
    3494:      	str	q0, [x29, x16]
    3498:      	add	x0, x29, #0x1d0
    349c:      	str	x0, [x29, #0x1c8]
    34a0:      	b	0x34b4 <_stogir.copy.validate+0x2bc>
    34a4:      	str	wzr, [x29, #0x200]
    34a8:      	str	w23, [x29, #0x208]
    34ac:      	add	x0, x29, #0x200
    34b0:      	str	x0, [x29, #0x1c8]
    34b4:      	ldr	x20, [x29, #0x1c8]
    34b8:      	mov	x21, x20
    34bc:      	mov	x22, x21
    34c0:      	ldr	q0, [x22]
    34c4:      	str	q0, [x19]
    34c8:      	ldr	x0, [x22, #0x10]
    34cc:      	str	x0, [x19, #0x10]
    34d0:      	b	0x34dc <_stogir.copy.validate+0x2e4>
    34d4:      	brk	#0x1
    34d8:      	brk	#0x1
    34dc:      	ldp	x19, x20, [sp, #0x10]
    34e0:      	ldp	x21, x22, [sp, #0x20]
    34e4:      	ldr	x23, [sp, #0x30]
    34e8:      	ldp	x29, x30, [sp]
    34ec:      	add	sp, sp, #0x240
    34f0:      	ret

00000000000034f4 <_stogir.graph.lookup>:
    34f4:      	stp	x29, x30, [sp, #-0x120]!
    34f8:      	mov	x29, sp
    34fc:      	stp	x19, x20, [sp, #0x10]
    3500:      	stp	x21, x22, [sp, #0x20]
    3504:      	str	x23, [sp, #0x30]
    3508:      	mov	x19, x8
    350c:      	mov	x20, x0
    3510:      	sxtw	x21, w1
    3514:      	mov	x0, x20
    3518:      	mov	x1, x21
    351c:      	bl	0x351c <_stogir.graph.lookup+0x28>
		000000000000351c:  ARM64_RELOC_BRANCH26	_stogir.graph.contains?
    3520:      	cbz	x0, 0x352c <_stogir.graph.lookup+0x38>
    3524:      	mov	w22, #0x0               ; =0
    3528:      	b	0x3530 <_stogir.graph.lookup+0x3c>
    352c:      	mov	w22, #0x1               ; =1
    3530:      	cbz	x22, 0x3540 <_stogir.graph.lookup+0x4c>
    3534:      	str	wzr, [x29, #0xa0]
    3538:      	add	x22, x29, #0xa0
    353c:      	b	0x3594 <_stogir.graph.lookup+0xa0>
    3540:      	mov	w0, #0x1                ; =1
    3544:      	str	w0, [x29, #0xd0]
    3548:      	cmp	x21, #0x0
    354c:      	b.le	0x3568 <_stogir.graph.lookup+0x74>
    3550:      	ldr	x0, [x20]
    3554:      	add	x0, x0, x21, lsl #4
    3558:      	ldr	q0, [x0]
    355c:      	str	q0, [x29, #0x100]
    3560:      	add	x23, x29, #0x100
    3564:      	b	0x3588 <_stogir.graph.lookup+0x94>
    3568:      	mov	w0, #0x0                ; =0
    356c:      	sub	x0, x0, x21
    3570:      	sub	x0, x0, #0x1
    3574:      	ldr	x20, [x20, #0x28]
    3578:      	add	x20, x20, x0, lsl #4
    357c:      	ldr	q0, [x20]
    3580:      	str	q0, [x29, #0x110]
    3584:      	add	x23, x29, #0x110
    3588:      	ldr	q0, [x23]
    358c:      	stur	q0, [x29, #0xd8]
    3590:      	add	x22, x29, #0xd0
    3594:      	ldr	q0, [x22]
    3598:      	str	q0, [x19]
    359c:      	ldr	q0, [x22, #0x10]
    35a0:      	str	q0, [x19, #0x10]
    35a4:      	ldr	x0, [x22, #0x20]
    35a8:      	str	x0, [x19, #0x20]
    35ac:      	ldp	x19, x20, [sp, #0x10]
    35b0:      	ldp	x21, x22, [sp, #0x20]
    35b4:      	ldr	x23, [sp, #0x30]
    35b8:      	ldp	x29, x30, [sp], #0x120
    35bc:      	ret

00000000000035c0 <_stogir.opcode.block-start?>:
    35c0:      	stp	x29, x30, [sp, #-0xb0]!
    35c4:      	mov	x29, sp
    35c8:      	str	x19, [sp, #0x10]
    35cc:      	sxtw	x0, w0
    35d0:      	bl	0x35d0 <_stogir.opcode.block-start?+0x10>
		00000000000035d0:  ARM64_RELOC_BRANCH26	_stogir.opcode.properties
    35d4:      	ubfx	x0, x0, #0, #8
    35d8:      	and	x0, x0, #0x2
    35dc:      	ubfx	x0, x0, #0, #8
    35e0:      	strb	w0, [x29, #0xa0]
    35e4:      	strb	wzr, [x29, #0xa1]
    35e8:      	ldrb	w0, [x29, #0xa0]
    35ec:      	ldrb	w1, [x29, #0xa1]
    35f0:      	cmp	x0, x1
    35f4:      	b.ne	0x3600 <_stogir.opcode.block-start?+0x40>
    35f8:      	mov	w19, #0x0               ; =0
    35fc:      	b	0x3604 <_stogir.opcode.block-start?+0x44>
    3600:      	mov	w19, #0x1               ; =1
    3604:      	mov	x0, x19
    3608:      	ldr	x19, [sp, #0x10]
    360c:      	ldp	x29, x30, [sp], #0xb0
    3610:      	ret

0000000000003614 <_stogir.checked.operation?>:
    3614:      	sxtw	x2, w0
    3618:      	cmp	x2, #0x29
    361c:      	b.lt	0x3630 <_stogir.checked.operation?+0x1c>
    3620:      	cmp	x2, #0x2b
    3624:      	cset	x0, le
    3628:      	mov	x2, x0
    362c:      	b	0x3634 <_stogir.checked.operation?+0x20>
    3630:      	mov	w2, #0x0                ; =0
    3634:      	mov	x0, x2
    3638:      	ret

000000000000363c <_stogir.checked.validate-projection>:
    363c:      	stp	x29, x30, [sp, #-0x180]!
    3640:      	mov	x29, sp
    3644:      	stp	x19, x20, [sp, #0x10]
    3648:      	stp	x21, x22, [sp, #0x20]
    364c:      	str	x23, [sp, #0x30]
    3650:      	mov	x19, x8
    3654:      	mov	x20, x0
    3658:      	sxtw	x21, w1
    365c:      	add	x8, x29, #0xa0
    3660:      	mov	x0, x20
    3664:      	mov	x1, x21
    3668:      	bl	0x3668 <_stogir.checked.validate-projection+0x2c>
		0000000000003668:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    366c:      	ldr	w0, [x29, #0xa0]
    3670:      	cmp	x0, #0x0
    3674:      	b.eq	0x3688 <_stogir.checked.validate-projection+0x4c>
    3678:      	cmp	x0, #0x1
    367c:      	b.eq	0x36b4 <_stogir.checked.validate-projection+0x78>
    3680:      	b	0x3684 <_stogir.checked.validate-projection+0x48>
    3684:      	b	0x3818 <_stogir.checked.validate-projection+0x1dc>
    3688:      	mov	w0, #0x1                ; =1
    368c:      	str	w0, [x29, #0xd0]
    3690:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003690:  ARM64_RELOC_PAGE21	l_cstr.87
    3694:      	add	x0, x0, #0x0
		0000000000003694:  ARM64_RELOC_PAGEOFF12	l_cstr.87
    3698:      	str	x0, [x29, #0xf0]
    369c:      	mov	w0, #0x10               ; =16
    36a0:      	str	x0, [x29, #0xf8]
    36a4:      	ldr	q0, [x29, #0xf0]
    36a8:      	stur	q0, [x29, #0xd8]
    36ac:      	add	x22, x29, #0xd0
    36b0:      	b	0x3804 <_stogir.checked.validate-projection+0x1c8>
    36b4:      	ldur	q0, [x29, #0xa8]
    36b8:      	str	q0, [x29, #0x100]
    36bc:      	cmp	x21, #0x0
    36c0:      	b.gt	0x36cc <_stogir.checked.validate-projection+0x90>
    36c4:      	mov	w23, #0x1               ; =1
    36c8:      	b	0x37b0 <_stogir.checked.validate-projection+0x174>
    36cc:      	add	x0, x29, #0x100
    36d0:      	bl	0x36d0 <_stogir.checked.validate-projection+0x94>
		00000000000036d0:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    36d4:      	ubfx	x0, x0, #0, #8
    36d8:      	strb	w0, [x29, #0x110]
    36dc:      	mov	w0, #0x2c               ; =44
    36e0:      	strb	w0, [x29, #0x111]
    36e4:      	ldrb	w0, [x29, #0x110]
    36e8:      	ldrb	w1, [x29, #0x111]
    36ec:      	cmp	x0, x1
    36f0:      	b.ne	0x3700 <_stogir.checked.validate-projection+0xc4>
    36f4:      	mov	w0, #0x0                ; =0
    36f8:      	str	x0, [x29, #0x170]
    36fc:      	b	0x3708 <_stogir.checked.validate-projection+0xcc>
    3700:      	mov	w0, #0x1                ; =1
    3704:      	str	x0, [x29, #0x170]
    3708:      	ldr	x0, [x29, #0x170]
    370c:      	cbz	x0, 0x371c <_stogir.checked.validate-projection+0xe0>
    3710:      	mov	w0, #0x1                ; =1
    3714:      	str	x0, [x29, #0x170]
    3718:      	b	0x37ac <_stogir.checked.validate-projection+0x170>
    371c:      	add	x0, x29, #0x100
    3720:      	bl	0x3720 <_stogir.checked.validate-projection+0xe4>
		0000000000003720:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    3724:      	ubfx	x0, x0, #0, #8
    3728:      	strb	w0, [x29, #0x112]
    372c:      	mov	w0, #0x1                ; =1
    3730:      	strb	w0, [x29, #0x113]
    3734:      	ldrb	w0, [x29, #0x112]
    3738:      	ldrb	w1, [x29, #0x113]
    373c:      	cmp	x0, x1
    3740:      	b.ne	0x3750 <_stogir.checked.validate-projection+0x114>
    3744:      	mov	w0, #0x0                ; =0
    3748:      	str	x0, [x29, #0x178]
    374c:      	b	0x3758 <_stogir.checked.validate-projection+0x11c>
    3750:      	mov	w0, #0x1                ; =1
    3754:      	str	x0, [x29, #0x178]
    3758:      	ldr	x0, [x29, #0x178]
    375c:      	cbz	x0, 0x376c <_stogir.checked.validate-projection+0x130>
    3760:      	mov	w0, #0x1                ; =1
    3764:      	str	x0, [x29, #0x178]
    3768:      	b	0x37a4 <_stogir.checked.validate-projection+0x168>
    376c:      	ldr	x0, [x20, #0x78]
    3770:      	add	x0, x0, x21, lsl #2
    3774:      	ldrsw	x0, [x0]
    3778:      	str	w0, [x29, #0x114]
    377c:      	mov	w0, #0x1                ; =1
    3780:      	str	w0, [x29, #0x118]
    3784:      	ldrsw	x0, [x29, #0x114]
    3788:      	ldrsw	x1, [x29, #0x118]
    378c:      	cmp	x0, x1
    3790:      	b.ne	0x379c <_stogir.checked.validate-projection+0x160>
    3794:      	mov	w21, #0x0               ; =0
    3798:      	b	0x37a0 <_stogir.checked.validate-projection+0x164>
    379c:      	mov	w21, #0x1               ; =1
    37a0:      	str	x21, [x29, #0x178]
    37a4:      	ldr	x0, [x29, #0x178]
    37a8:      	str	x0, [x29, #0x170]
    37ac:      	ldr	x23, [x29, #0x170]
    37b0:      	cbz	x23, 0x37e4 <_stogir.checked.validate-projection+0x1a8>
    37b4:      	mov	w0, #0x1                ; =1
    37b8:      	str	w0, [x29, #0x120]
    37bc:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		00000000000037bc:  ARM64_RELOC_PAGE21	l_cstr.88
    37c0:      	add	x0, x0, #0x0
		00000000000037c0:  ARM64_RELOC_PAGEOFF12	l_cstr.88
    37c4:      	str	x0, [x29, #0x140]
    37c8:      	mov	w0, #0x1c               ; =28
    37cc:      	str	x0, [x29, #0x148]
    37d0:      	ldr	q0, [x29, #0x140]
    37d4:      	mov	w16, #0x128             ; =296
    37d8:      	str	q0, [x29, x16]
    37dc:      	add	x21, x29, #0x120
    37e0:      	b	0x3800 <_stogir.checked.validate-projection+0x1c4>
    37e4:      	ldrsw	x0, [x29, #0x104]
    37e8:      	add	x8, x29, #0x150
    37ec:      	mov	x9, x0
    37f0:      	mov	x0, x20
    37f4:      	mov	x1, x9
    37f8:      	bl	0x37f8 <_stogir.checked.validate-projection+0x1bc>
		00000000000037f8:  ARM64_RELOC_BRANCH26	_stogir.checked.projection
    37fc:      	add	x21, x29, #0x150
    3800:      	mov	x22, x21
    3804:      	ldr	q0, [x22]
    3808:      	str	q0, [x19]
    380c:      	ldr	x0, [x22, #0x10]
    3810:      	str	x0, [x19, #0x10]
    3814:      	b	0x381c <_stogir.checked.validate-projection+0x1e0>
    3818:      	brk	#0x1
    381c:      	ldp	x19, x20, [sp, #0x10]
    3820:      	ldp	x21, x22, [sp, #0x20]
    3824:      	ldr	x23, [sp, #0x30]
    3828:      	ldp	x29, x30, [sp], #0x180
    382c:      	ret

0000000000003830 <_stogir.checked.validate>:
    3830:      	stp	x29, x30, [sp, #-0x170]!
    3834:      	mov	x29, sp
    3838:      	stp	x19, x20, [sp, #0x10]
    383c:      	stp	x21, x22, [sp, #0x20]
    3840:      	str	x23, [sp, #0x30]
    3844:      	mov	x19, x8
    3848:      	mov	x20, x0
    384c:      	sxtw	x21, w1
    3850:      	add	x8, x29, #0xa0
    3854:      	mov	x0, x20
    3858:      	mov	x1, x21
    385c:      	bl	0x385c <_stogir.checked.validate+0x2c>
		000000000000385c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    3860:      	ldr	w0, [x29, #0xa0]
    3864:      	cmp	x0, #0x0
    3868:      	b.eq	0x387c <_stogir.checked.validate+0x4c>
    386c:      	cmp	x0, #0x1
    3870:      	b.eq	0x38a8 <_stogir.checked.validate+0x78>
    3874:      	b	0x3878 <_stogir.checked.validate+0x48>
    3878:      	b	0x39e4 <_stogir.checked.validate+0x1b4>
    387c:      	mov	w0, #0x1                ; =1
    3880:      	str	w0, [x29, #0xd0]
    3884:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003884:  ARM64_RELOC_PAGE21	l_cstr.89
    3888:      	add	x0, x0, #0x0
		0000000000003888:  ARM64_RELOC_PAGEOFF12	l_cstr.89
    388c:      	str	x0, [x29, #0xf0]
    3890:      	mov	w0, #0x1a               ; =26
    3894:      	str	x0, [x29, #0xf8]
    3898:      	ldr	q0, [x29, #0xf0]
    389c:      	stur	q0, [x29, #0xd8]
    38a0:      	add	x22, x29, #0xd0
    38a4:      	b	0x39d0 <_stogir.checked.validate+0x1a0>
    38a8:      	ldur	q0, [x29, #0xa8]
    38ac:      	str	q0, [x29, #0x100]
    38b0:      	cmp	x21, #0x0
    38b4:      	b.gt	0x38c0 <_stogir.checked.validate+0x90>
    38b8:      	mov	w23, #0x1               ; =1
    38bc:      	b	0x393c <_stogir.checked.validate+0x10c>
    38c0:      	add	x0, x29, #0x100
    38c4:      	bl	0x38c4 <_stogir.checked.validate+0x94>
		00000000000038c4:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    38c8:      	ubfx	x0, x0, #0, #8
    38cc:      	sxtw	x0, w0
    38d0:      	bl	0x38d0 <_stogir.checked.validate+0xa0>
		00000000000038d0:  ARM64_RELOC_BRANCH26	_stogir.checked.operation?
    38d4:      	cbz	x0, 0x38e4 <_stogir.checked.validate+0xb4>
    38d8:      	mov	w0, #0x0                ; =0
    38dc:      	str	x0, [x29, #0x118]
    38e0:      	b	0x38ec <_stogir.checked.validate+0xbc>
    38e4:      	mov	w0, #0x1                ; =1
    38e8:      	str	x0, [x29, #0x118]
    38ec:      	ldr	x0, [x29, #0x118]
    38f0:      	cbz	x0, 0x3900 <_stogir.checked.validate+0xd0>
    38f4:      	mov	w0, #0x1                ; =1
    38f8:      	str	x0, [x29, #0x118]
    38fc:      	b	0x3938 <_stogir.checked.validate+0x108>
    3900:      	ldr	x0, [x20, #0x78]
    3904:      	add	x0, x0, x21, lsl #2
    3908:      	ldrsw	x0, [x0]
    390c:      	str	w0, [x29, #0x110]
    3910:      	mov	w0, #0x2                ; =2
    3914:      	str	w0, [x29, #0x114]
    3918:      	ldrsw	x0, [x29, #0x110]
    391c:      	ldrsw	x1, [x29, #0x114]
    3920:      	cmp	x0, x1
    3924:      	b.ne	0x3930 <_stogir.checked.validate+0x100>
    3928:      	mov	w21, #0x0               ; =0
    392c:      	b	0x3934 <_stogir.checked.validate+0x104>
    3930:      	mov	w21, #0x1               ; =1
    3934:      	str	x21, [x29, #0x118]
    3938:      	ldr	x23, [x29, #0x118]
    393c:      	cbz	x23, 0x3970 <_stogir.checked.validate+0x140>
    3940:      	mov	w0, #0x1                ; =1
    3944:      	str	w0, [x29, #0x120]
    3948:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003948:  ARM64_RELOC_PAGE21	l_cstr.90
    394c:      	add	x0, x0, #0x0
		000000000000394c:  ARM64_RELOC_PAGEOFF12	l_cstr.90
    3950:      	str	x0, [x29, #0x140]
    3954:      	mov	w0, #0x26               ; =38
    3958:      	str	x0, [x29, #0x148]
    395c:      	ldr	q0, [x29, #0x140]
    3960:      	mov	w16, #0x128             ; =296
    3964:      	str	q0, [x29, x16]
    3968:      	add	x21, x29, #0x120
    396c:      	b	0x39cc <_stogir.checked.validate+0x19c>
    3970:      	add	x0, x29, #0x100
    3974:      	bl	0x3974 <_stogir.checked.validate+0x144>
		0000000000003974:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    3978:      	ubfx	x0, x0, #0, #8
    397c:      	sxtw	x0, w0
    3980:      	mov	x9, x0
    3984:      	add	x0, x29, #0x100
    3988:      	str	x9, [x29, #0x118]
    398c:      	bl	0x398c <_stogir.checked.validate+0x15c>
		000000000000398c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    3990:      	ubfx	x0, x0, #0, #8
    3994:      	sxtw	x0, w0
    3998:      	ldrsw	x1, [x29, #0x104]
    399c:      	ldrsw	x2, [x29, #0x108]
    39a0:      	add	x8, x29, #0x150
    39a4:      	mov	x9, x0
    39a8:      	mov	x0, x20
    39ac:      	mov	x10, x1
    39b0:      	ldr	x1, [x29, #0x118]
    39b4:      	mov	x11, x2
    39b8:      	mov	x2, x9
    39bc:      	mov	x3, x10
    39c0:      	mov	x4, x11
    39c4:      	bl	0x39c4 <_stogir.checked.validate+0x194>
		00000000000039c4:  ARM64_RELOC_BRANCH26	_stogir.checked.operands
    39c8:      	add	x21, x29, #0x150
    39cc:      	mov	x22, x21
    39d0:      	ldr	q0, [x22]
    39d4:      	str	q0, [x19]
    39d8:      	ldr	x0, [x22, #0x10]
    39dc:      	str	x0, [x19, #0x10]
    39e0:      	b	0x39e8 <_stogir.checked.validate+0x1b8>
    39e4:      	brk	#0x1
    39e8:      	ldp	x19, x20, [sp, #0x10]
    39ec:      	ldp	x21, x22, [sp, #0x20]
    39f0:      	ldr	x23, [sp, #0x30]
    39f4:      	ldp	x29, x30, [sp], #0x170
    39f8:      	ret

00000000000039fc <_stogir.atomic.operation?>:
    39fc:      	sxtw	x2, w0
    3a00:      	cmp	x2, #0x7e
    3a04:      	b.lt	0x3a18 <_stogir.atomic.operation?+0x1c>
    3a08:      	cmp	x2, #0x82
    3a0c:      	cset	x0, le
    3a10:      	mov	x2, x0
    3a14:      	b	0x3a1c <_stogir.atomic.operation?+0x20>
    3a18:      	mov	w2, #0x0                ; =0
    3a1c:      	mov	x0, x2
    3a20:      	ret

0000000000003a24 <_stogir.atomic.validate>:
    3a24:      	sub	sp, sp, #0x340
    3a28:      	stp	x29, x30, [sp]
    3a2c:      	mov	x29, sp
    3a30:      	stp	x19, x20, [sp, #0x10]
    3a34:      	stp	x21, x22, [sp, #0x20]
    3a38:      	str	x23, [sp, #0x30]
    3a3c:      	mov	x19, x8
    3a40:      	mov	x20, x0
    3a44:      	sxtw	x21, w1
    3a48:      	add	x8, x29, #0xa0
    3a4c:      	mov	x0, x20
    3a50:      	mov	x1, x21
    3a54:      	bl	0x3a54 <_stogir.atomic.validate+0x30>
		0000000000003a54:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    3a58:      	ldr	w0, [x29, #0xa0]
    3a5c:      	cmp	x0, #0x0
    3a60:      	b.eq	0x3a74 <_stogir.atomic.validate+0x50>
    3a64:      	cmp	x0, #0x1
    3a68:      	b.eq	0x3aa0 <_stogir.atomic.validate+0x7c>
    3a6c:      	b	0x3a70 <_stogir.atomic.validate+0x4c>
    3a70:      	b	0x4158 <_stogir.atomic.validate+0x734>
    3a74:      	mov	w0, #0x1                ; =1
    3a78:      	str	w0, [x29, #0xd0]
    3a7c:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003a7c:  ARM64_RELOC_PAGE21	l_cstr.91
    3a80:      	add	x0, x0, #0x0
		0000000000003a80:  ARM64_RELOC_PAGEOFF12	l_cstr.91
    3a84:      	str	x0, [x29, #0xf0]
    3a88:      	mov	w0, #0x1a               ; =26
    3a8c:      	str	x0, [x29, #0xf8]
    3a90:      	ldr	q0, [x29, #0xf0]
    3a94:      	stur	q0, [x29, #0xd8]
    3a98:      	add	x22, x29, #0xd0
    3a9c:      	b	0x4140 <_stogir.atomic.validate+0x71c>
    3aa0:      	ldur	q0, [x29, #0xa8]
    3aa4:      	str	q0, [x29, #0x100]
    3aa8:      	add	x0, x29, #0x100
    3aac:      	bl	0x3aac <_stogir.atomic.validate+0x88>
		0000000000003aac:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    3ab0:      	ubfx	x0, x0, #0, #8
    3ab4:      	sxtw	x23, w0
    3ab8:      	add	x0, x29, #0x100
    3abc:      	bl	0x3abc <_stogir.atomic.validate+0x98>
		0000000000003abc:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    3ac0:      	ubfx	x0, x0, #0, #8
    3ac4:      	sxtw	x0, w0
    3ac8:      	adrp	x1, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003ac8:  ARM64_RELOC_PAGE21	l_cstr.51
    3acc:      	add	x1, x1, #0x0
		0000000000003acc:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    3ad0:      	str	x1, [x29, #0x120]
    3ad4:      	str	xzr, [x29, #0x128]
    3ad8:      	ldr	q0, [x29, #0x120]
    3adc:      	str	q0, [x29, #0x110]
    3ae0:      	cmp	x21, #0x0
    3ae4:      	str	x0, [x29, #0x278]
    3ae8:      	b.gt	0x3af8 <_stogir.atomic.validate+0xd4>
    3aec:      	mov	w1, #0x1                ; =1
    3af0:      	str	x1, [x29, #0x1f8]
    3af4:      	b	0x3b80 <_stogir.atomic.validate+0x15c>
    3af8:      	mov	x0, x23
    3afc:      	bl	0x3afc <_stogir.atomic.validate+0xd8>
		0000000000003afc:  ARM64_RELOC_BRANCH26	_stogir.atomic.operation?
    3b00:      	cbz	x0, 0x3b10 <_stogir.atomic.validate+0xec>
    3b04:      	mov	w0, #0x0                ; =0
    3b08:      	str	x0, [x29, #0x1d8]
    3b0c:      	b	0x3b18 <_stogir.atomic.validate+0xf4>
    3b10:      	mov	w0, #0x1                ; =1
    3b14:      	str	x0, [x29, #0x1d8]
    3b18:      	ldr	x0, [x29, #0x1d8]
    3b1c:      	cbz	x0, 0x3b2c <_stogir.atomic.validate+0x108>
    3b20:      	mov	w0, #0x1                ; =1
    3b24:      	str	x0, [x29, #0x1d8]
    3b28:      	b	0x3b78 <_stogir.atomic.validate+0x154>
    3b2c:      	ldr	x0, [x20, #0x78]
    3b30:      	add	x0, x0, x21, lsl #2
    3b34:      	ldrsw	x0, [x0]
    3b38:      	str	w0, [x29, #0x130]
    3b3c:      	mov	x0, x23
    3b40:      	bl	0x3b40 <_stogir.atomic.validate+0x11c>
		0000000000003b40:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
    3b44:      	sxtw	x0, w0
    3b48:      	str	w0, [x29, #0x134]
    3b4c:      	ldrsw	x0, [x29, #0x130]
    3b50:      	ldrsw	x1, [x29, #0x134]
    3b54:      	cmp	x0, x1
    3b58:      	b.ne	0x3b68 <_stogir.atomic.validate+0x144>
    3b5c:      	mov	w0, #0x0                ; =0
    3b60:      	str	x0, [x29, #0x1b8]
    3b64:      	b	0x3b70 <_stogir.atomic.validate+0x14c>
    3b68:      	mov	w0, #0x1                ; =1
    3b6c:      	str	x0, [x29, #0x1b8]
    3b70:      	ldr	x0, [x29, #0x1b8]
    3b74:      	str	x0, [x29, #0x1d8]
    3b78:      	ldr	x0, [x29, #0x1d8]
    3b7c:      	str	x0, [x29, #0x1f8]
    3b80:      	ldr	x0, [x29, #0x1f8]
    3b84:      	cbz	x0, 0x3ba8 <_stogir.atomic.validate+0x184>
    3b88:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003b88:  ARM64_RELOC_PAGE21	l_cstr.92
    3b8c:      	add	x0, x0, #0x0
		0000000000003b8c:  ARM64_RELOC_PAGEOFF12	l_cstr.92
    3b90:      	str	x0, [x29, #0x140]
    3b94:      	mov	w0, #0x20               ; =32
    3b98:      	str	x0, [x29, #0x148]
    3b9c:      	ldr	q0, [x29, #0x140]
    3ba0:      	str	q0, [x29, #0x110]
    3ba4:      	b	0x3ba8 <_stogir.atomic.validate+0x184>
    3ba8:      	ldrsw	x0, [x29, #0x104]
    3bac:      	add	x8, x29, #0x150
    3bb0:      	mov	x9, x0
    3bb4:      	mov	x0, x20
    3bb8:      	mov	x1, x9
    3bbc:      	bl	0x3bbc <_stogir.atomic.validate+0x198>
		0000000000003bbc:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    3bc0:      	ldr	w0, [x29, #0x150]
    3bc4:      	cmp	x0, #0x0
    3bc8:      	b.eq	0x3bdc <_stogir.atomic.validate+0x1b8>
    3bcc:      	cmp	x0, #0x1
    3bd0:      	b.eq	0x3bfc <_stogir.atomic.validate+0x1d8>
    3bd4:      	b	0x3bd8 <_stogir.atomic.validate+0x1b4>
    3bd8:      	b	0x4154 <_stogir.atomic.validate+0x730>
    3bdc:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003bdc:  ARM64_RELOC_PAGE21	l_cstr.93
    3be0:      	add	x0, x0, #0x0
		0000000000003be0:  ARM64_RELOC_PAGEOFF12	l_cstr.93
    3be4:      	str	x0, [x29, #0x180]
    3be8:      	mov	w0, #0x16               ; =22
    3bec:      	str	x0, [x29, #0x188]
    3bf0:      	ldr	q0, [x29, #0x180]
    3bf4:      	str	q0, [x29, #0x110]
    3bf8:      	b	0x3ca8 <_stogir.atomic.validate+0x284>
    3bfc:      	mov	w16, #0x158             ; =344
    3c00:      	ldr	q0, [x29, x16]
    3c04:      	str	q0, [x29, #0x190]
    3c08:      	ldrsw	x0, [x29, #0x104]
    3c0c:      	cmp	x0, #0x0
    3c10:      	b.gt	0x3c20 <_stogir.atomic.validate+0x1fc>
    3c14:      	mov	w0, #0x1                ; =1
    3c18:      	str	x0, [x29, #0x1f8]
    3c1c:      	b	0x3c80 <_stogir.atomic.validate+0x25c>
    3c20:      	add	x0, x29, #0x190
    3c24:      	bl	0x3c24 <_stogir.atomic.validate+0x200>
		0000000000003c24:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    3c28:      	ubfx	x0, x0, #0, #8
    3c2c:      	sxtw	x0, w0
    3c30:      	bl	0x3c30 <_stogir.atomic.validate+0x20c>
		0000000000003c30:  ARM64_RELOC_BRANCH26	_stogir.opcode.control?
    3c34:      	cbz	x0, 0x3c44 <_stogir.atomic.validate+0x220>
    3c38:      	mov	w0, #0x0                ; =0
    3c3c:      	str	x0, [x29, #0x1d8]
    3c40:      	b	0x3c4c <_stogir.atomic.validate+0x228>
    3c44:      	mov	w0, #0x1                ; =1
    3c48:      	str	x0, [x29, #0x1d8]
    3c4c:      	ldr	x0, [x29, #0x1d8]
    3c50:      	cbz	x0, 0x3c60 <_stogir.atomic.validate+0x23c>
    3c54:      	mov	w0, #0x1                ; =1
    3c58:      	str	x0, [x29, #0x1d8]
    3c5c:      	b	0x3c78 <_stogir.atomic.validate+0x254>
    3c60:      	add	x0, x29, #0x190
    3c64:      	bl	0x3c64 <_stogir.atomic.validate+0x240>
		0000000000003c64:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    3c68:      	ubfx	x0, x0, #0, #8
    3c6c:      	sxtw	x0, w0
    3c70:      	bl	0x3c70 <_stogir.atomic.validate+0x24c>
		0000000000003c70:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-end?
    3c74:      	str	x0, [x29, #0x1d8]
    3c78:      	ldr	x0, [x29, #0x1d8]
    3c7c:      	str	x0, [x29, #0x1f8]
    3c80:      	ldr	x0, [x29, #0x1f8]
    3c84:      	cbz	x0, 0x3ca8 <_stogir.atomic.validate+0x284>
    3c88:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003c88:  ARM64_RELOC_PAGE21	l_cstr.94
    3c8c:      	add	x0, x0, #0x0
		0000000000003c8c:  ARM64_RELOC_PAGEOFF12	l_cstr.94
    3c90:      	str	x0, [x29, #0x1a0]
    3c94:      	mov	w0, #0x16               ; =22
    3c98:      	str	x0, [x29, #0x1a8]
    3c9c:      	ldr	q0, [x29, #0x1a0]
    3ca0:      	str	q0, [x29, #0x110]
    3ca4:      	b	0x3ca8 <_stogir.atomic.validate+0x284>
    3ca8:      	cmp	x23, #0x82
    3cac:      	b.ne	0x3d0c <_stogir.atomic.validate+0x2e8>
    3cb0:      	ldr	x0, [x29, #0x278]
    3cb4:      	str	w0, [x29, #0x1b0]
    3cb8:      	str	wzr, [x29, #0x1b4]
    3cbc:      	ldrsw	x1, [x29, #0x1b0]
    3cc0:      	ldrsw	x2, [x29, #0x1b4]
    3cc4:      	cmp	x1, x2
    3cc8:      	b.ne	0x3cd8 <_stogir.atomic.validate+0x2b4>
    3ccc:      	mov	w1, #0x0                ; =0
    3cd0:      	str	x1, [x29, #0x1f8]
    3cd4:      	b	0x3ce0 <_stogir.atomic.validate+0x2bc>
    3cd8:      	mov	w0, #0x1                ; =1
    3cdc:      	str	x0, [x29, #0x1f8]
    3ce0:      	ldr	x0, [x29, #0x1f8]
    3ce4:      	cbz	x0, 0x3d08 <_stogir.atomic.validate+0x2e4>
    3ce8:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003ce8:  ARM64_RELOC_PAGE21	l_cstr.95
    3cec:      	add	x0, x0, #0x0
		0000000000003cec:  ARM64_RELOC_PAGEOFF12	l_cstr.95
    3cf0:      	str	x0, [x29, #0x1c0]
    3cf4:      	mov	w0, #0x19               ; =25
    3cf8:      	str	x0, [x29, #0x1c8]
    3cfc:      	ldr	q0, [x29, #0x1c0]
    3d00:      	str	q0, [x29, #0x110]
    3d04:      	b	0x3d08 <_stogir.atomic.validate+0x2e4>
    3d08:      	b	0x3d0c <_stogir.atomic.validate+0x2e8>
    3d0c:      	str	w23, [x29, #0x1d0]
    3d10:      	mov	w0, #0x82               ; =130
    3d14:      	str	w0, [x29, #0x1d4]
    3d18:      	ldrsw	x0, [x29, #0x1d0]
    3d1c:      	ldrsw	x1, [x29, #0x1d4]
    3d20:      	cmp	x0, x1
    3d24:      	b.ne	0x3d34 <_stogir.atomic.validate+0x310>
    3d28:      	mov	w0, #0x0                ; =0
    3d2c:      	str	x0, [x29, #0x1f8]
    3d30:      	b	0x3d3c <_stogir.atomic.validate+0x318>
    3d34:      	mov	w0, #0x1                ; =1
    3d38:      	str	x0, [x29, #0x1f8]
    3d3c:      	ldr	x0, [x29, #0x1f8]
    3d40:      	cbz	x0, 0x3f90 <_stogir.atomic.validate+0x56c>
    3d44:      	ldrsw	x0, [x29, #0x108]
    3d48:      	mov	x9, x0
    3d4c:      	mov	x0, x20
    3d50:      	mov	x1, x9
    3d54:      	mov	w2, #0x6                ; =6
    3d58:      	bl	0x3d58 <_stogir.atomic.validate+0x334>
		0000000000003d58:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    3d5c:      	cbz	x0, 0x3d6c <_stogir.atomic.validate+0x348>
    3d60:      	mov	w0, #0x0                ; =0
    3d64:      	str	x0, [x29, #0x1f8]
    3d68:      	b	0x3d74 <_stogir.atomic.validate+0x350>
    3d6c:      	mov	w0, #0x1                ; =1
    3d70:      	str	x0, [x29, #0x1f8]
    3d74:      	ldr	x0, [x29, #0x1f8]
    3d78:      	cbz	x0, 0x3d9c <_stogir.atomic.validate+0x378>
    3d7c:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003d7c:  ARM64_RELOC_PAGE21	l_cstr.96
    3d80:      	add	x0, x0, #0x0
		0000000000003d80:  ARM64_RELOC_PAGEOFF12	l_cstr.96
    3d84:      	str	x0, [x29, #0x1e0]
    3d88:      	mov	w0, #0x1b               ; =27
    3d8c:      	str	x0, [x29, #0x1e8]
    3d90:      	ldr	q0, [x29, #0x1e0]
    3d94:      	str	q0, [x29, #0x110]
    3d98:      	b	0x3d9c <_stogir.atomic.validate+0x378>
    3d9c:      	cmp	x23, #0x7f
    3da0:      	b.ne	0x3e88 <_stogir.atomic.validate+0x464>
    3da4:      	ldr	x0, [x29, #0x278]
    3da8:      	str	w0, [x29, #0x1f0]
    3dac:      	str	wzr, [x29, #0x1f4]
    3db0:      	ldrsw	x1, [x29, #0x1f0]
    3db4:      	ldrsw	x2, [x29, #0x1f4]
    3db8:      	cmp	x1, x2
    3dbc:      	b.ne	0x3dcc <_stogir.atomic.validate+0x3a8>
    3dc0:      	mov	w1, #0x0                ; =0
    3dc4:      	str	x1, [x29, #0x1f8]
    3dc8:      	b	0x3dd4 <_stogir.atomic.validate+0x3b0>
    3dcc:      	mov	w0, #0x1                ; =1
    3dd0:      	str	x0, [x29, #0x1f8]
    3dd4:      	ldr	x0, [x29, #0x1f8]
    3dd8:      	cbz	x0, 0x3dfc <_stogir.atomic.validate+0x3d8>
    3ddc:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003ddc:  ARM64_RELOC_PAGE21	l_cstr.97
    3de0:      	add	x0, x0, #0x0
		0000000000003de0:  ARM64_RELOC_PAGEOFF12	l_cstr.97
    3de4:      	str	x0, [x29, #0x200]
    3de8:      	mov	w0, #0x19               ; =25
    3dec:      	str	x0, [x29, #0x208]
    3df0:      	ldr	q0, [x29, #0x200]
    3df4:      	str	q0, [x29, #0x110]
    3df8:      	b	0x3dfc <_stogir.atomic.validate+0x3d8>
    3dfc:      	ldrsw	x0, [x29, #0x10c]
    3e00:      	add	x8, x29, #0x210
    3e04:      	mov	x9, x0
    3e08:      	mov	x0, x20
    3e0c:      	mov	x1, x9
    3e10:      	bl	0x3e10 <_stogir.atomic.validate+0x3ec>
		0000000000003e10:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    3e14:      	ldr	w0, [x29, #0x210]
    3e18:      	cmp	x0, #0x0
    3e1c:      	b.eq	0x3e30 <_stogir.atomic.validate+0x40c>
    3e20:      	cmp	x0, #0x1
    3e24:      	b.eq	0x3e58 <_stogir.atomic.validate+0x434>
    3e28:      	b	0x3e2c <_stogir.atomic.validate+0x408>
    3e2c:      	b	0x3e84 <_stogir.atomic.validate+0x460>
    3e30:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003e30:  ARM64_RELOC_PAGE21	l_cstr.98
    3e34:      	add	x0, x0, #0x0
		0000000000003e34:  ARM64_RELOC_PAGEOFF12	l_cstr.98
    3e38:      	str	x0, [x29, #0x240]
    3e3c:      	mov	w0, #0x1a               ; =26
    3e40:      	str	x0, [x29, #0x248]
    3e44:      	ldr	q0, [x29, #0x240]
    3e48:      	str	q0, [x29, #0x110]
    3e4c:      	ldr	x0, [x29, #0x278]
    3e50:      	str	x0, [x29, #0x1f8]
    3e54:      	b	0x3e78 <_stogir.atomic.validate+0x454>
    3e58:      	mov	w16, #0x218             ; =536
    3e5c:      	ldr	q0, [x29, x16]
    3e60:      	str	q0, [x29, #0x250]
    3e64:      	add	x0, x29, #0x250
    3e68:      	bl	0x3e68 <_stogir.atomic.validate+0x444>
		0000000000003e68:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    3e6c:      	ubfx	x0, x0, #0, #8
    3e70:      	sxtw	x0, w0
    3e74:      	str	x0, [x29, #0x1f8]
    3e78:      	ldr	x0, [x29, #0x1f8]
    3e7c:      	str	x0, [x29, #0x1d8]
    3e80:      	b	0x3e90 <_stogir.atomic.validate+0x46c>
    3e84:      	brk	#0x1
    3e88:      	ldr	x0, [x29, #0x278]
    3e8c:      	str	x0, [x29, #0x1d8]
    3e90:      	ldr	x0, [x29, #0x1d8]
    3e94:      	cmp	x0, #0x2
    3e98:      	b.ge	0x3ea8 <_stogir.atomic.validate+0x484>
    3e9c:      	mov	w1, #0x1                ; =1
    3ea0:      	str	x1, [x29, #0x1f8]
    3ea4:      	b	0x3eb8 <_stogir.atomic.validate+0x494>
    3ea8:      	ldr	x0, [x29, #0x1d8]
    3eac:      	cmp	x0, #0x5
    3eb0:      	cset	x1, gt
    3eb4:      	str	x1, [x29, #0x1f8]
    3eb8:      	ldr	x0, [x29, #0x1f8]
    3ebc:      	cbz	x0, 0x3ee0 <_stogir.atomic.validate+0x4bc>
    3ec0:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003ec0:  ARM64_RELOC_PAGE21	l_cstr.99
    3ec4:      	add	x0, x0, #0x0
		0000000000003ec4:  ARM64_RELOC_PAGEOFF12	l_cstr.99
    3ec8:      	str	x0, [x29, #0x260]
    3ecc:      	mov	w0, #0x25               ; =37
    3ed0:      	str	x0, [x29, #0x268]
    3ed4:      	ldr	q0, [x29, #0x260]
    3ed8:      	str	q0, [x29, #0x110]
    3edc:      	b	0x3ee0 <_stogir.atomic.validate+0x4bc>
    3ee0:      	str	w23, [x29, #0x270]
    3ee4:      	mov	w0, #0x7e               ; =126
    3ee8:      	str	w0, [x29, #0x274]
    3eec:      	ldrsw	x0, [x29, #0x270]
    3ef0:      	ldrsw	x1, [x29, #0x274]
    3ef4:      	cmp	x0, x1
    3ef8:      	b.ne	0x3f08 <_stogir.atomic.validate+0x4e4>
    3efc:      	mov	w0, #0x0                ; =0
    3f00:      	str	x0, [x29, #0x1f8]
    3f04:      	b	0x3f10 <_stogir.atomic.validate+0x4ec>
    3f08:      	mov	w0, #0x1                ; =1
    3f0c:      	str	x0, [x29, #0x1f8]
    3f10:      	ldr	x0, [x29, #0x1f8]
    3f14:      	cbz	x0, 0x3f54 <_stogir.atomic.validate+0x530>
    3f18:      	ldrsw	x0, [x29, #0x10c]
    3f1c:      	mov	x9, x0
    3f20:      	mov	x0, x20
    3f24:      	mov	x1, x9
    3f28:      	ldr	x2, [x29, #0x1d8]
    3f2c:      	bl	0x3f2c <_stogir.atomic.validate+0x508>
		0000000000003f2c:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    3f30:      	cbz	x0, 0x3f40 <_stogir.atomic.validate+0x51c>
    3f34:      	mov	w0, #0x0                ; =0
    3f38:      	str	x0, [x29, #0x1f8]
    3f3c:      	b	0x3f48 <_stogir.atomic.validate+0x524>
    3f40:      	mov	w0, #0x1                ; =1
    3f44:      	str	x0, [x29, #0x1f8]
    3f48:      	ldr	x0, [x29, #0x1f8]
    3f4c:      	str	x0, [x29, #0x1b8]
    3f50:      	b	0x3f5c <_stogir.atomic.validate+0x538>
    3f54:      	mov	w0, #0x0                ; =0
    3f58:      	str	x0, [x29, #0x1b8]
    3f5c:      	ldr	x0, [x29, #0x1b8]
    3f60:      	cbz	x0, 0x3f84 <_stogir.atomic.validate+0x560>
    3f64:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003f64:  ARM64_RELOC_PAGE21	l_cstr.100
    3f68:      	add	x0, x0, #0x0
		0000000000003f68:  ARM64_RELOC_PAGEOFF12	l_cstr.100
    3f6c:      	str	x0, [x29, #0x280]
    3f70:      	mov	w0, #0x22               ; =34
    3f74:      	str	x0, [x29, #0x288]
    3f78:      	ldr	q0, [x29, #0x280]
    3f7c:      	str	q0, [x29, #0x110]
    3f80:      	b	0x3f84 <_stogir.atomic.validate+0x560>
    3f84:      	ldr	x0, [x29, #0x1d8]
    3f88:      	str	x0, [x29, #0x1b8]
    3f8c:      	b	0x3f98 <_stogir.atomic.validate+0x574>
    3f90:      	ldr	x0, [x29, #0x278]
    3f94:      	str	x0, [x29, #0x1b8]
    3f98:      	cmp	x23, #0x80
    3f9c:      	b.ne	0x3fac <_stogir.atomic.validate+0x588>
    3fa0:      	mov	w0, #0x1                ; =1
    3fa4:      	str	x0, [x29, #0x278]
    3fa8:      	b	0x3fb8 <_stogir.atomic.validate+0x594>
    3fac:      	cmp	x23, #0x81
    3fb0:      	cset	x0, eq
    3fb4:      	str	x0, [x29, #0x278]
    3fb8:      	ldr	x0, [x29, #0x278]
    3fbc:      	cbz	x0, 0x40b8 <_stogir.atomic.validate+0x694>
    3fc0:      	mov	x0, x20
    3fc4:      	mov	x1, x21
    3fc8:      	mov	w2, #0x4                ; =4
    3fcc:      	bl	0x3fcc <_stogir.atomic.validate+0x5a8>
		0000000000003fcc:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    3fd0:      	str	x0, [x29, #0x290]
    3fd4:      	str	x1, [x29, #0x298]
    3fd8:      	ldr	w0, [x29, #0x290]
    3fdc:      	cmp	x0, #0x0
    3fe0:      	b.eq	0x3ff4 <_stogir.atomic.validate+0x5d0>
    3fe4:      	cmp	x0, #0x1
    3fe8:      	b.eq	0x4014 <_stogir.atomic.validate+0x5f0>
    3fec:      	b	0x3ff0 <_stogir.atomic.validate+0x5cc>
    3ff0:      	b	0x40b4 <_stogir.atomic.validate+0x690>
    3ff4:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x834>
		0000000000003ff4:  ARM64_RELOC_PAGE21	l_cstr.101
    3ff8:      	add	x0, x0, #0x0
		0000000000003ff8:  ARM64_RELOC_PAGEOFF12	l_cstr.101
    3ffc:      	str	x0, [x29, #0x2a0]
    4000:      	mov	w0, #0x1d               ; =29
    4004:      	str	x0, [x29, #0x2a8]
    4008:      	ldr	q0, [x29, #0x2a0]
    400c:      	str	q0, [x29, #0x110]
    4010:      	b	0x40b0 <_stogir.atomic.validate+0x68c>
    4014:      	ldrsw	x21, [x29, #0x298]
    4018:      	cmp	x23, #0x80
    401c:      	b.ne	0x406c <_stogir.atomic.validate+0x648>
    4020:      	cmp	x21, #0x0
    4024:      	b.ge	0x4034 <_stogir.atomic.validate+0x610>
    4028:      	mov	w0, #0x1                ; =1
    402c:      	str	x0, [x29, #0x278]
    4030:      	b	0x4040 <_stogir.atomic.validate+0x61c>
    4034:      	cmp	x21, #0x9
    4038:      	cset	x0, gt
    403c:      	str	x0, [x29, #0x278]
    4040:      	ldr	x0, [x29, #0x278]
    4044:      	cbz	x0, 0x4068 <_stogir.atomic.validate+0x644>
    4048:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		0000000000004048:  ARM64_RELOC_PAGE21	l_cstr.102
    404c:      	add	x0, x0, #0x0
		000000000000404c:  ARM64_RELOC_PAGEOFF12	l_cstr.102
    4050:      	str	x0, [x29, #0x2b0]
    4054:      	mov	w0, #0x1c               ; =28
    4058:      	str	x0, [x29, #0x2b8]
    405c:      	ldr	q0, [x29, #0x2b0]
    4060:      	str	q0, [x29, #0x110]
    4064:      	b	0x4068 <_stogir.atomic.validate+0x644>
    4068:      	b	0x40b0 <_stogir.atomic.validate+0x68c>
    406c:      	mov	x0, x20
    4070:      	mov	x1, x21
    4074:      	ldr	x2, [x29, #0x1b8]
    4078:      	bl	0x4078 <_stogir.atomic.validate+0x654>
		0000000000004078:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    407c:      	cbz	x0, 0x4088 <_stogir.atomic.validate+0x664>
    4080:      	mov	w20, #0x0               ; =0
    4084:      	b	0x408c <_stogir.atomic.validate+0x668>
    4088:      	mov	w20, #0x1               ; =1
    408c:      	cbz	x20, 0x40b0 <_stogir.atomic.validate+0x68c>
    4090:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		0000000000004090:  ARM64_RELOC_PAGE21	l_cstr.103
    4094:      	add	x0, x0, #0x0
		0000000000004094:  ARM64_RELOC_PAGEOFF12	l_cstr.103
    4098:      	str	x0, [x29, #0x2c0]
    409c:      	mov	w0, #0x24               ; =36
    40a0:      	str	x0, [x29, #0x2c8]
    40a4:      	ldr	q0, [x29, #0x2c0]
    40a8:      	str	q0, [x29, #0x110]
    40ac:      	b	0x40b0 <_stogir.atomic.validate+0x68c>
    40b0:      	b	0x40b8 <_stogir.atomic.validate+0x694>
    40b4:      	brk	#0x1
    40b8:      	ldr	q0, [x29, #0x110]
    40bc:      	str	q0, [x29, #0x2d0]
    40c0:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		00000000000040c0:  ARM64_RELOC_PAGE21	l_cstr.51
    40c4:      	add	x0, x0, #0x0
		00000000000040c4:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    40c8:      	str	x0, [x29, #0x2e0]
    40cc:      	str	xzr, [x29, #0x2e8]
    40d0:      	ldr	x0, [x29, #0x2d0]
    40d4:      	ldr	x1, [x29, #0x2d8]
    40d8:      	ldr	x2, [x29, #0x2e0]
    40dc:      	ldr	x3, [x29, #0x2e8]
    40e0:      	bl	0x40e0 <_stogir.atomic.validate+0x6bc>
		00000000000040e0:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    40e4:      	cbz	x0, 0x411c <_stogir.atomic.validate+0x6f8>
    40e8:      	str	wzr, [x29, #0x2f0]
    40ec:      	cmp	x23, #0x82
    40f0:      	b.ne	0x40fc <_stogir.atomic.validate+0x6d8>
    40f4:      	mov	w20, #0x0               ; =0
    40f8:      	b	0x4110 <_stogir.atomic.validate+0x6ec>
    40fc:      	ldr	x0, [x29, #0x1b8]
    4100:      	mov	w1, #0x8                ; =8
    4104:      	bl	0x4104 <_stogir.atomic.validate+0x6e0>
		0000000000004104:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    4108:      	sxtw	x0, w0
    410c:      	mov	x20, x0
    4110:      	str	w20, [x29, #0x2f8]
    4114:      	add	x20, x29, #0x2f0
    4118:      	b	0x413c <_stogir.atomic.validate+0x718>
    411c:      	mov	w0, #0x1                ; =1
    4120:      	str	w0, [x29, #0x310]
    4124:      	ldr	q0, [x29, #0x110]
    4128:      	str	q0, [x29, #0x330]
    412c:      	ldr	q0, [x29, #0x330]
    4130:      	mov	w16, #0x318             ; =792
    4134:      	str	q0, [x29, x16]
    4138:      	add	x20, x29, #0x310
    413c:      	mov	x22, x20
    4140:      	ldr	q0, [x22]
    4144:      	str	q0, [x19]
    4148:      	ldr	x0, [x22, #0x10]
    414c:      	str	x0, [x19, #0x10]
    4150:      	b	0x415c <_stogir.atomic.validate+0x738>
    4154:      	brk	#0x1
    4158:      	brk	#0x1
    415c:      	ldp	x19, x20, [sp, #0x10]
    4160:      	ldp	x21, x22, [sp, #0x20]
    4164:      	ldr	x23, [sp, #0x30]
    4168:      	ldp	x29, x30, [sp]
    416c:      	add	sp, sp, #0x340
    4170:      	ret

0000000000004174 <_stogir.terminal.operation?>:
    4174:      	sxtw	x2, w0
    4178:      	cmp	x2, #0x60
    417c:      	b.ne	0x4188 <_stogir.terminal.operation?+0x14>
    4180:      	mov	w3, #0x1                ; =1
    4184:      	b	0x4194 <_stogir.terminal.operation?+0x20>
    4188:      	cmp	x2, #0x79
    418c:      	cset	x0, eq
    4190:      	mov	x3, x0
    4194:      	mov	x0, x3
    4198:      	ret

000000000000419c <_stogir.terminal.validate>:
    419c:      	stp	x29, x30, [sp, #-0x1a0]!
    41a0:      	mov	x29, sp
    41a4:      	stp	x19, x20, [sp, #0x10]
    41a8:      	stp	x21, x22, [sp, #0x20]
    41ac:      	str	x23, [sp, #0x30]
    41b0:      	mov	x19, x8
    41b4:      	mov	x20, x0
    41b8:      	sxtw	x21, w1
    41bc:      	add	x8, x29, #0xa0
    41c0:      	mov	x0, x20
    41c4:      	mov	x1, x21
    41c8:      	bl	0x41c8 <_stogir.terminal.validate+0x2c>
		00000000000041c8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    41cc:      	ldr	w0, [x29, #0xa0]
    41d0:      	cmp	x0, #0x0
    41d4:      	b.eq	0x41e8 <_stogir.terminal.validate+0x4c>
    41d8:      	cmp	x0, #0x1
    41dc:      	b.eq	0x4214 <_stogir.terminal.validate+0x78>
    41e0:      	b	0x41e4 <_stogir.terminal.validate+0x48>
    41e4:      	b	0x4400 <_stogir.terminal.validate+0x264>
    41e8:      	mov	w0, #0x1                ; =1
    41ec:      	str	w0, [x29, #0xd0]
    41f0:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		00000000000041f0:  ARM64_RELOC_PAGE21	l_cstr.104
    41f4:      	add	x0, x0, #0x0
		00000000000041f4:  ARM64_RELOC_PAGEOFF12	l_cstr.104
    41f8:      	str	x0, [x29, #0xf0]
    41fc:      	mov	w0, #0x21               ; =33
    4200:      	str	x0, [x29, #0xf8]
    4204:      	ldr	q0, [x29, #0xf0]
    4208:      	stur	q0, [x29, #0xd8]
    420c:      	add	x22, x29, #0xd0
    4210:      	b	0x43ec <_stogir.terminal.validate+0x250>
    4214:      	ldur	q0, [x29, #0xa8]
    4218:      	str	q0, [x29, #0x100]
    421c:      	add	x0, x29, #0x100
    4220:      	bl	0x4220 <_stogir.terminal.validate+0x84>
		0000000000004220:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    4224:      	ubfx	x0, x0, #0, #8
    4228:      	sxtw	x23, w0
    422c:      	cmp	x21, #0x0
    4230:      	b.gt	0x4240 <_stogir.terminal.validate+0xa4>
    4234:      	mov	w0, #0x1                ; =1
    4238:      	str	x0, [x29, #0x170]
    423c:      	b	0x4370 <_stogir.terminal.validate+0x1d4>
    4240:      	mov	x0, x23
    4244:      	bl	0x4244 <_stogir.terminal.validate+0xa8>
		0000000000004244:  ARM64_RELOC_BRANCH26	_stogir.terminal.operation?
    4248:      	cbz	x0, 0x4258 <_stogir.terminal.validate+0xbc>
    424c:      	mov	w0, #0x0                ; =0
    4250:      	str	x0, [x29, #0x178]
    4254:      	b	0x4260 <_stogir.terminal.validate+0xc4>
    4258:      	mov	w0, #0x1                ; =1
    425c:      	str	x0, [x29, #0x178]
    4260:      	ldr	x0, [x29, #0x178]
    4264:      	cbz	x0, 0x4274 <_stogir.terminal.validate+0xd8>
    4268:      	mov	w0, #0x1                ; =1
    426c:      	str	x0, [x29, #0x178]
    4270:      	b	0x4368 <_stogir.terminal.validate+0x1cc>
    4274:      	add	x0, x29, #0x100
    4278:      	bl	0x4278 <_stogir.terminal.validate+0xdc>
		0000000000004278:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    427c:      	ubfx	x0, x0, #0, #8
    4280:      	strb	w0, [x29, #0x110]
    4284:      	strb	wzr, [x29, #0x111]
    4288:      	ldrb	w0, [x29, #0x110]
    428c:      	ldrb	w1, [x29, #0x111]
    4290:      	cmp	x0, x1
    4294:      	b.ne	0x42a4 <_stogir.terminal.validate+0x108>
    4298:      	mov	w0, #0x0                ; =0
    429c:      	str	x0, [x29, #0x180]
    42a0:      	b	0x42ac <_stogir.terminal.validate+0x110>
    42a4:      	mov	w0, #0x1                ; =1
    42a8:      	str	x0, [x29, #0x180]
    42ac:      	ldr	x0, [x29, #0x180]
    42b0:      	cbz	x0, 0x42c0 <_stogir.terminal.validate+0x124>
    42b4:      	mov	w0, #0x1                ; =1
    42b8:      	str	x0, [x29, #0x180]
    42bc:      	b	0x4360 <_stogir.terminal.validate+0x1c4>
    42c0:      	ldr	x0, [x20, #0x78]
    42c4:      	add	x0, x0, x21, lsl #2
    42c8:      	ldrsw	x0, [x0]
    42cc:      	str	w0, [x29, #0x114]
    42d0:      	cmp	x23, #0x60
    42d4:      	b.ne	0x42e0 <_stogir.terminal.validate+0x144>
    42d8:      	mov	w21, #0x1               ; =1
    42dc:      	b	0x42e4 <_stogir.terminal.validate+0x148>
    42e0:      	mov	w21, #0x3               ; =3
    42e4:      	sxtw	x21, w21
    42e8:      	str	w21, [x29, #0x118]
    42ec:      	ldrsw	x0, [x29, #0x114]
    42f0:      	ldrsw	x1, [x29, #0x118]
    42f4:      	cmp	x0, x1
    42f8:      	b.ne	0x4304 <_stogir.terminal.validate+0x168>
    42fc:      	mov	w21, #0x0               ; =0
    4300:      	b	0x4308 <_stogir.terminal.validate+0x16c>
    4304:      	mov	w21, #0x1               ; =1
    4308:      	cbz	x21, 0x4314 <_stogir.terminal.validate+0x178>
    430c:      	mov	w21, #0x1               ; =1
    4310:      	b	0x435c <_stogir.terminal.validate+0x1c0>
    4314:      	cmp	x23, #0x79
    4318:      	b.ne	0x4350 <_stogir.terminal.validate+0x1b4>
    431c:      	str	wzr, [x29, #0x11c]
    4320:      	ldrsw	x0, [x29, #0x108]
    4324:      	ldrsw	x1, [x29, #0x11c]
    4328:      	cmp	x0, x1
    432c:      	b.ne	0x433c <_stogir.terminal.validate+0x1a0>
    4330:      	mov	w0, #0x0                ; =0
    4334:      	str	x0, [x29, #0x188]
    4338:      	b	0x4344 <_stogir.terminal.validate+0x1a8>
    433c:      	mov	w0, #0x1                ; =1
    4340:      	str	x0, [x29, #0x188]
    4344:      	ldr	x0, [x29, #0x188]
    4348:      	str	x0, [x29, #0x190]
    434c:      	b	0x4358 <_stogir.terminal.validate+0x1bc>
    4350:      	mov	w0, #0x0                ; =0
    4354:      	str	x0, [x29, #0x190]
    4358:      	ldr	x21, [x29, #0x190]
    435c:      	str	x21, [x29, #0x180]
    4360:      	ldr	x0, [x29, #0x180]
    4364:      	str	x0, [x29, #0x178]
    4368:      	ldr	x0, [x29, #0x178]
    436c:      	str	x0, [x29, #0x170]
    4370:      	ldr	x0, [x29, #0x170]
    4374:      	cbz	x0, 0x43a8 <_stogir.terminal.validate+0x20c>
    4378:      	mov	w0, #0x1                ; =1
    437c:      	str	w0, [x29, #0x120]
    4380:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		0000000000004380:  ARM64_RELOC_PAGE21	l_cstr.105
    4384:      	add	x0, x0, #0x0
		0000000000004384:  ARM64_RELOC_PAGEOFF12	l_cstr.105
    4388:      	str	x0, [x29, #0x140]
    438c:      	mov	w0, #0x1b               ; =27
    4390:      	str	x0, [x29, #0x148]
    4394:      	ldr	q0, [x29, #0x140]
    4398:      	mov	w16, #0x128             ; =296
    439c:      	str	q0, [x29, x16]
    43a0:      	add	x21, x29, #0x120
    43a4:      	b	0x43e8 <_stogir.terminal.validate+0x24c>
    43a8:      	ldrsw	x0, [x29, #0x104]
    43ac:      	cmp	x23, #0x79
    43b0:      	str	x0, [x29, #0x170]
    43b4:      	b.ne	0x43c4 <_stogir.terminal.validate+0x228>
    43b8:      	ldrsw	x1, [x29, #0x10c]
    43bc:      	str	x1, [x29, #0x178]
    43c0:      	b	0x43cc <_stogir.terminal.validate+0x230>
    43c4:      	mov	w0, #0x0                ; =0
    43c8:      	str	x0, [x29, #0x178]
    43cc:      	add	x8, x29, #0x150
    43d0:      	mov	x0, x20
    43d4:      	mov	x1, x23
    43d8:      	ldr	x2, [x29, #0x170]
    43dc:      	ldr	x3, [x29, #0x178]
    43e0:      	bl	0x43e0 <_stogir.terminal.validate+0x244>
		00000000000043e0:  ARM64_RELOC_BRANCH26	_stogir.terminal.inputs
    43e4:      	add	x21, x29, #0x150
    43e8:      	mov	x22, x21
    43ec:      	ldr	q0, [x22]
    43f0:      	str	q0, [x19]
    43f4:      	ldr	x0, [x22, #0x10]
    43f8:      	str	x0, [x19, #0x10]
    43fc:      	b	0x4404 <_stogir.terminal.validate+0x268>
    4400:      	brk	#0x1
    4404:      	ldp	x19, x20, [sp, #0x10]
    4408:      	ldp	x21, x22, [sp, #0x20]
    440c:      	ldr	x23, [sp, #0x30]
    4410:      	ldp	x29, x30, [sp], #0x1a0
    4414:      	ret

0000000000004418 <_stogir.switch.operation?>:
    4418:      	sxtw	x2, w0
    441c:      	cmp	x2, #0x75
    4420:      	b.ne	0x442c <_stogir.switch.operation?+0x14>
    4424:      	mov	w3, #0x1                ; =1
    4428:      	b	0x444c <_stogir.switch.operation?+0x34>
    442c:      	cmp	x2, #0x6d
    4430:      	b.lt	0x4444 <_stogir.switch.operation?+0x2c>
    4434:      	cmp	x2, #0x6f
    4438:      	cset	x0, le
    443c:      	mov	x2, x0
    4440:      	b	0x4448 <_stogir.switch.operation?+0x30>
    4444:      	mov	w2, #0x0                ; =0
    4448:      	mov	x3, x2
    444c:      	mov	x0, x3
    4450:      	ret

0000000000004454 <_stogir.switch.validate>:
    4454:      	stp	x29, x30, [sp, #-0x1b0]!
    4458:      	mov	x29, sp
    445c:      	stp	x19, x20, [sp, #0x10]
    4460:      	stp	x21, x22, [sp, #0x20]
    4464:      	str	x23, [sp, #0x30]
    4468:      	mov	x19, x8
    446c:      	mov	x20, x0
    4470:      	sxtw	x21, w1
    4474:      	add	x8, x29, #0xa0
    4478:      	mov	x0, x20
    447c:      	mov	x1, x21
    4480:      	bl	0x4480 <_stogir.switch.validate+0x2c>
		0000000000004480:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4484:      	ldr	w0, [x29, #0xa0]
    4488:      	cmp	x0, #0x0
    448c:      	b.eq	0x44a0 <_stogir.switch.validate+0x4c>
    4490:      	cmp	x0, #0x1
    4494:      	b.eq	0x44cc <_stogir.switch.validate+0x78>
    4498:      	b	0x449c <_stogir.switch.validate+0x48>
    449c:      	b	0x46b4 <_stogir.switch.validate+0x260>
    44a0:      	mov	w0, #0x1                ; =1
    44a4:      	str	w0, [x29, #0xd0]
    44a8:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		00000000000044a8:  ARM64_RELOC_PAGE21	l_cstr.106
    44ac:      	add	x0, x0, #0x0
		00000000000044ac:  ARM64_RELOC_PAGEOFF12	l_cstr.106
    44b0:      	str	x0, [x29, #0xf0]
    44b4:      	mov	w0, #0x1a               ; =26
    44b8:      	str	x0, [x29, #0xf8]
    44bc:      	ldr	q0, [x29, #0xf0]
    44c0:      	stur	q0, [x29, #0xd8]
    44c4:      	add	x22, x29, #0xd0
    44c8:      	b	0x46a0 <_stogir.switch.validate+0x24c>
    44cc:      	ldur	q0, [x29, #0xa8]
    44d0:      	str	q0, [x29, #0x100]
    44d4:      	add	x0, x29, #0x100
    44d8:      	bl	0x44d8 <_stogir.switch.validate+0x84>
		00000000000044d8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    44dc:      	ubfx	x0, x0, #0, #8
    44e0:      	sxtw	x23, w0
    44e4:      	cmp	x21, #0x0
    44e8:      	b.gt	0x44f8 <_stogir.switch.validate+0xa4>
    44ec:      	mov	w0, #0x1                ; =1
    44f0:      	str	x0, [x29, #0x190]
    44f4:      	b	0x45ec <_stogir.switch.validate+0x198>
    44f8:      	mov	x0, x23
    44fc:      	bl	0x44fc <_stogir.switch.validate+0xa8>
		00000000000044fc:  ARM64_RELOC_BRANCH26	_stogir.switch.operation?
    4500:      	cbz	x0, 0x4510 <_stogir.switch.validate+0xbc>
    4504:      	mov	w0, #0x0                ; =0
    4508:      	str	x0, [x29, #0x198]
    450c:      	b	0x4518 <_stogir.switch.validate+0xc4>
    4510:      	mov	w0, #0x1                ; =1
    4514:      	str	x0, [x29, #0x198]
    4518:      	ldr	x0, [x29, #0x198]
    451c:      	cbz	x0, 0x452c <_stogir.switch.validate+0xd8>
    4520:      	mov	w0, #0x1                ; =1
    4524:      	str	x0, [x29, #0x198]
    4528:      	b	0x45e4 <_stogir.switch.validate+0x190>
    452c:      	add	x0, x29, #0x100
    4530:      	bl	0x4530 <_stogir.switch.validate+0xdc>
		0000000000004530:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    4534:      	ubfx	x0, x0, #0, #8
    4538:      	strb	w0, [x29, #0x110]
    453c:      	strb	wzr, [x29, #0x111]
    4540:      	ldrb	w0, [x29, #0x110]
    4544:      	ldrb	w1, [x29, #0x111]
    4548:      	cmp	x0, x1
    454c:      	b.ne	0x455c <_stogir.switch.validate+0x108>
    4550:      	mov	w0, #0x0                ; =0
    4554:      	str	x0, [x29, #0x1a0]
    4558:      	b	0x4564 <_stogir.switch.validate+0x110>
    455c:      	mov	w0, #0x1                ; =1
    4560:      	str	x0, [x29, #0x1a0]
    4564:      	ldr	x0, [x29, #0x1a0]
    4568:      	cbz	x0, 0x4578 <_stogir.switch.validate+0x124>
    456c:      	mov	w0, #0x1                ; =1
    4570:      	str	x0, [x29, #0x1a0]
    4574:      	b	0x45dc <_stogir.switch.validate+0x188>
    4578:      	ldr	x0, [x20, #0x78]
    457c:      	add	x0, x0, x21, lsl #2
    4580:      	ldrsw	x0, [x0]
    4584:      	str	w0, [x29, #0x114]
    4588:      	cmp	x23, #0x6d
    458c:      	b.ne	0x4598 <_stogir.switch.validate+0x144>
    4590:      	mov	w21, #0x1               ; =1
    4594:      	b	0x45a4 <_stogir.switch.validate+0x150>
    4598:      	cmp	x23, #0x6e
    459c:      	cset	x0, eq
    45a0:      	mov	x21, x0
    45a4:      	cbz	x21, 0x45b0 <_stogir.switch.validate+0x15c>
    45a8:      	mov	w21, #0x3               ; =3
    45ac:      	b	0x45b4 <_stogir.switch.validate+0x160>
    45b0:      	mov	w21, #0x2               ; =2
    45b4:      	sxtw	x21, w21
    45b8:      	str	w21, [x29, #0x118]
    45bc:      	ldrsw	x0, [x29, #0x114]
    45c0:      	ldrsw	x1, [x29, #0x118]
    45c4:      	cmp	x0, x1
    45c8:      	b.ne	0x45d4 <_stogir.switch.validate+0x180>
    45cc:      	mov	w21, #0x0               ; =0
    45d0:      	b	0x45d8 <_stogir.switch.validate+0x184>
    45d4:      	mov	w21, #0x1               ; =1
    45d8:      	str	x21, [x29, #0x1a0]
    45dc:      	ldr	x0, [x29, #0x1a0]
    45e0:      	str	x0, [x29, #0x198]
    45e4:      	ldr	x0, [x29, #0x198]
    45e8:      	str	x0, [x29, #0x190]
    45ec:      	ldr	x0, [x29, #0x190]
    45f0:      	cbz	x0, 0x4624 <_stogir.switch.validate+0x1d0>
    45f4:      	mov	w0, #0x1                ; =1
    45f8:      	str	w0, [x29, #0x120]
    45fc:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		00000000000045fc:  ARM64_RELOC_PAGE21	l_cstr.107
    4600:      	add	x0, x0, #0x0
		0000000000004600:  ARM64_RELOC_PAGEOFF12	l_cstr.107
    4604:      	str	x0, [x29, #0x140]
    4608:      	mov	w0, #0x20               ; =32
    460c:      	str	x0, [x29, #0x148]
    4610:      	ldr	q0, [x29, #0x140]
    4614:      	mov	w16, #0x128             ; =296
    4618:      	str	q0, [x29, x16]
    461c:      	add	x21, x29, #0x120
    4620:      	b	0x469c <_stogir.switch.validate+0x248>
    4624:      	cmp	x23, #0x75
    4628:      	b.ne	0x465c <_stogir.switch.validate+0x208>
    462c:      	ldrsw	x0, [x29, #0x104]
    4630:      	ldrsw	x1, [x29, #0x108]
    4634:      	add	x8, x29, #0x150
    4638:      	mov	x9, x0
    463c:      	mov	x0, x20
    4640:      	mov	x10, x1
    4644:      	mov	x1, x9
    4648:      	mov	x2, x10
    464c:      	bl	0x464c <_stogir.switch.validate+0x1f8>
		000000000000464c:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    4650:      	add	x0, x29, #0x150
    4654:      	str	x0, [x29, #0x190]
    4658:      	b	0x4698 <_stogir.switch.validate+0x244>
    465c:      	ldrsw	x0, [x29, #0x104]
    4660:      	ldrsw	x1, [x29, #0x108]
    4664:      	ldrsw	x2, [x29, #0x10c]
    4668:      	add	x8, x29, #0x170
    466c:      	mov	x9, x0
    4670:      	mov	x0, x20
    4674:      	mov	x10, x1
    4678:      	mov	x1, x23
    467c:      	mov	x11, x2
    4680:      	mov	x2, x9
    4684:      	mov	x3, x10
    4688:      	mov	x4, x11
    468c:      	bl	0x468c <_stogir.switch.validate+0x238>
		000000000000468c:  ARM64_RELOC_BRANCH26	_stogir.switch.case-inputs
    4690:      	add	x0, x29, #0x170
    4694:      	str	x0, [x29, #0x190]
    4698:      	ldr	x21, [x29, #0x190]
    469c:      	mov	x22, x21
    46a0:      	ldr	q0, [x22]
    46a4:      	str	q0, [x19]
    46a8:      	ldr	x0, [x22, #0x10]
    46ac:      	str	x0, [x19, #0x10]
    46b0:      	b	0x46b8 <_stogir.switch.validate+0x264>
    46b4:      	brk	#0x1
    46b8:      	ldp	x19, x20, [sp, #0x10]
    46bc:      	ldp	x21, x22, [sp, #0x20]
    46c0:      	ldr	x23, [sp, #0x30]
    46c4:      	ldp	x29, x30, [sp], #0x1b0
    46c8:      	ret

00000000000046cc <_stogir.stack.operation?>:
    46cc:      	sxtw	x2, w0
    46d0:      	cmp	x2, #0x42
    46d4:      	b.ne	0x46e0 <_stogir.stack.operation?+0x14>
    46d8:      	mov	w3, #0x1                ; =1
    46dc:      	b	0x4728 <_stogir.stack.operation?+0x5c>
    46e0:      	cmp	x2, #0x51
    46e4:      	b.ne	0x46f0 <_stogir.stack.operation?+0x24>
    46e8:      	mov	w4, #0x1                ; =1
    46ec:      	b	0x4724 <_stogir.stack.operation?+0x58>
    46f0:      	cmp	x2, #0x52
    46f4:      	b.ne	0x4700 <_stogir.stack.operation?+0x34>
    46f8:      	mov	w5, #0x1                ; =1
    46fc:      	b	0x4720 <_stogir.stack.operation?+0x54>
    4700:      	cmp	x2, #0x53
    4704:      	b.ne	0x4710 <_stogir.stack.operation?+0x44>
    4708:      	mov	w6, #0x1                ; =1
    470c:      	b	0x471c <_stogir.stack.operation?+0x50>
    4710:      	cmp	x2, #0x54
    4714:      	cset	x0, eq
    4718:      	mov	x6, x0
    471c:      	mov	x5, x6
    4720:      	mov	x4, x5
    4724:      	mov	x3, x4
    4728:      	mov	x0, x3
    472c:      	ret

0000000000004730 <_stogir.stack.validate>:
    4730:      	stp	x29, x30, [sp, #-0x1d0]!
    4734:      	mov	x29, sp
    4738:      	stp	x19, x20, [sp, #0x10]
    473c:      	stp	x21, x22, [sp, #0x20]
    4740:      	str	x23, [sp, #0x30]
    4744:      	mov	x19, x8
    4748:      	mov	x20, x0
    474c:      	sxtw	x21, w1
    4750:      	add	x8, x29, #0xa0
    4754:      	mov	x0, x20
    4758:      	mov	x1, x21
    475c:      	bl	0x475c <_stogir.stack.validate+0x2c>
		000000000000475c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4760:      	ldr	w0, [x29, #0xa0]
    4764:      	cmp	x0, #0x0
    4768:      	b.eq	0x477c <_stogir.stack.validate+0x4c>
    476c:      	cmp	x0, #0x1
    4770:      	b.eq	0x47a8 <_stogir.stack.validate+0x78>
    4774:      	b	0x4778 <_stogir.stack.validate+0x48>
    4778:      	b	0x49bc <_stogir.stack.validate+0x28c>
    477c:      	mov	w0, #0x1                ; =1
    4780:      	str	w0, [x29, #0xd0]
    4784:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		0000000000004784:  ARM64_RELOC_PAGE21	l_cstr.108
    4788:      	add	x0, x0, #0x0
		0000000000004788:  ARM64_RELOC_PAGEOFF12	l_cstr.108
    478c:      	str	x0, [x29, #0xf0]
    4790:      	mov	w0, #0x19               ; =25
    4794:      	str	x0, [x29, #0xf8]
    4798:      	ldr	q0, [x29, #0xf0]
    479c:      	stur	q0, [x29, #0xd8]
    47a0:      	add	x22, x29, #0xd0
    47a4:      	b	0x49a8 <_stogir.stack.validate+0x278>
    47a8:      	ldur	q0, [x29, #0xa8]
    47ac:      	str	q0, [x29, #0x100]
    47b0:      	add	x0, x29, #0x100
    47b4:      	bl	0x47b4 <_stogir.stack.validate+0x84>
		00000000000047b4:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    47b8:      	ubfx	x0, x0, #0, #8
    47bc:      	sxtw	x23, w0
    47c0:      	cmp	x23, #0x42
    47c4:      	b.ne	0x47e4 <_stogir.stack.validate+0xb4>
    47c8:      	add	x8, x29, #0x110
    47cc:      	mov	x0, x20
    47d0:      	mov	x1, x21
    47d4:      	bl	0x47d4 <_stogir.stack.validate+0xa4>
		00000000000047d4:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-frame-address
    47d8:      	add	x0, x29, #0x110
    47dc:      	str	x0, [x29, #0x138]
    47e0:      	b	0x49a4 <_stogir.stack.validate+0x274>
    47e4:      	cmp	x21, #0x0
    47e8:      	b.gt	0x47f8 <_stogir.stack.validate+0xc8>
    47ec:      	mov	w0, #0x1                ; =1
    47f0:      	str	x0, [x29, #0x1b0]
    47f4:      	b	0x489c <_stogir.stack.validate+0x16c>
    47f8:      	mov	x0, x23
    47fc:      	bl	0x47fc <_stogir.stack.validate+0xcc>
		00000000000047fc:  ARM64_RELOC_BRANCH26	_stogir.stack.operation?
    4800:      	cbz	x0, 0x4810 <_stogir.stack.validate+0xe0>
    4804:      	mov	w0, #0x0                ; =0
    4808:      	str	x0, [x29, #0x1b8]
    480c:      	b	0x4818 <_stogir.stack.validate+0xe8>
    4810:      	mov	w0, #0x1                ; =1
    4814:      	str	x0, [x29, #0x1b8]
    4818:      	ldr	x0, [x29, #0x1b8]
    481c:      	cbz	x0, 0x482c <_stogir.stack.validate+0xfc>
    4820:      	mov	w0, #0x1                ; =1
    4824:      	str	x0, [x29, #0x1b8]
    4828:      	b	0x4894 <_stogir.stack.validate+0x164>
    482c:      	ldr	x0, [x20, #0x78]
    4830:      	add	x0, x0, x21, lsl #2
    4834:      	ldrsw	x0, [x0]
    4838:      	str	w0, [x29, #0x130]
    483c:      	cmp	x23, #0x51
    4840:      	b.ne	0x484c <_stogir.stack.validate+0x11c>
    4844:      	mov	w21, #0x3               ; =3
    4848:      	b	0x486c <_stogir.stack.validate+0x13c>
    484c:      	cmp	x23, #0x53
    4850:      	b.ne	0x4860 <_stogir.stack.validate+0x130>
    4854:      	mov	w0, #0x1                ; =1
    4858:      	str	x0, [x29, #0x1c0]
    485c:      	b	0x4868 <_stogir.stack.validate+0x138>
    4860:      	mov	w0, #0x2                ; =2
    4864:      	str	x0, [x29, #0x1c0]
    4868:      	ldr	x21, [x29, #0x1c0]
    486c:      	sxtw	x21, w21
    4870:      	str	w21, [x29, #0x134]
    4874:      	ldrsw	x0, [x29, #0x130]
    4878:      	ldrsw	x1, [x29, #0x134]
    487c:      	cmp	x0, x1
    4880:      	b.ne	0x488c <_stogir.stack.validate+0x15c>
    4884:      	mov	w21, #0x0               ; =0
    4888:      	b	0x4890 <_stogir.stack.validate+0x160>
    488c:      	mov	w21, #0x1               ; =1
    4890:      	str	x21, [x29, #0x1b8]
    4894:      	ldr	x0, [x29, #0x1b8]
    4898:      	str	x0, [x29, #0x1b0]
    489c:      	ldr	x0, [x29, #0x1b0]
    48a0:      	cbz	x0, 0x48d4 <_stogir.stack.validate+0x1a4>
    48a4:      	mov	w0, #0x1                ; =1
    48a8:      	str	w0, [x29, #0x140]
    48ac:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		00000000000048ac:  ARM64_RELOC_PAGE21	l_cstr.109
    48b0:      	add	x0, x0, #0x0
		00000000000048b0:  ARM64_RELOC_PAGEOFF12	l_cstr.109
    48b4:      	str	x0, [x29, #0x160]
    48b8:      	mov	w0, #0x19               ; =25
    48bc:      	str	x0, [x29, #0x168]
    48c0:      	ldr	q0, [x29, #0x160]
    48c4:      	mov	w16, #0x148             ; =328
    48c8:      	str	q0, [x29, x16]
    48cc:      	add	x21, x29, #0x140
    48d0:      	b	0x49a0 <_stogir.stack.validate+0x270>
    48d4:      	cmp	x23, #0x53
    48d8:      	b.ne	0x48e8 <_stogir.stack.validate+0x1b8>
    48dc:      	mov	w0, #0x1                ; =1
    48e0:      	str	x0, [x29, #0x1b0]
    48e4:      	b	0x48f4 <_stogir.stack.validate+0x1c4>
    48e8:      	cmp	x23, #0x54
    48ec:      	cset	x0, eq
    48f0:      	str	x0, [x29, #0x1b0]
    48f4:      	ldr	x0, [x29, #0x1b0]
    48f8:      	cbz	x0, 0x4948 <_stogir.stack.validate+0x218>
    48fc:      	add	x0, x29, #0x100
    4900:      	bl	0x4900 <_stogir.stack.validate+0x1d0>
		0000000000004900:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    4904:      	ubfx	x0, x0, #0, #8
    4908:      	sxtw	x0, w0
    490c:      	ldrsw	x1, [x29, #0x104]
    4910:      	ldrsw	x2, [x29, #0x108]
    4914:      	add	x8, x29, #0x170
    4918:      	mov	x9, x0
    491c:      	mov	x0, x20
    4920:      	mov	x10, x1
    4924:      	mov	x1, x23
    4928:      	mov	x11, x2
    492c:      	mov	x2, x9
    4930:      	mov	x3, x10
    4934:      	mov	x4, x11
    4938:      	bl	0x4938 <_stogir.stack.validate+0x208>
		0000000000004938:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-scope-inputs
    493c:      	add	x0, x29, #0x170
    4940:      	str	x0, [x29, #0x1b0]
    4944:      	b	0x499c <_stogir.stack.validate+0x26c>
    4948:      	add	x0, x29, #0x100
    494c:      	bl	0x494c <_stogir.stack.validate+0x21c>
		000000000000494c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    4950:      	ubfx	x0, x0, #0, #8
    4954:      	sxtw	x0, w0
    4958:      	ldrsw	x1, [x29, #0x104]
    495c:      	ldrsw	x2, [x29, #0x108]
    4960:      	ldrsw	x3, [x29, #0x10c]
    4964:      	add	x8, x29, #0x190
    4968:      	mov	x9, x0
    496c:      	mov	x0, x20
    4970:      	mov	x10, x1
    4974:      	mov	x1, x23
    4978:      	mov	x11, x2
    497c:      	mov	x2, x9
    4980:      	mov	x9, x3
    4984:      	mov	x3, x10
    4988:      	mov	x4, x11
    498c:      	mov	x5, x9
    4990:      	bl	0x4990 <_stogir.stack.validate+0x260>
		0000000000004990:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-inputs
    4994:      	add	x0, x29, #0x190
    4998:      	str	x0, [x29, #0x1b0]
    499c:      	ldr	x21, [x29, #0x1b0]
    49a0:      	str	x21, [x29, #0x138]
    49a4:      	ldr	x22, [x29, #0x138]
    49a8:      	ldr	q0, [x22]
    49ac:      	str	q0, [x19]
    49b0:      	ldr	x0, [x22, #0x10]
    49b4:      	str	x0, [x19, #0x10]
    49b8:      	b	0x49c0 <_stogir.stack.validate+0x290>
    49bc:      	brk	#0x1
    49c0:      	ldp	x19, x20, [sp, #0x10]
    49c4:      	ldp	x21, x22, [sp, #0x20]
    49c8:      	ldr	x23, [sp, #0x30]
    49cc:      	ldp	x29, x30, [sp], #0x1d0
    49d0:      	ret

00000000000049d4 <_stogir.locals.operation?>:
    49d4:      	sxtw	x2, w0
    49d8:      	cmp	x2, #0x41
    49dc:      	b.ne	0x49e8 <_stogir.locals.operation?+0x14>
    49e0:      	mov	w3, #0x1                ; =1
    49e4:      	b	0x4a1c <_stogir.locals.operation?+0x48>
    49e8:      	cmp	x2, #0x48
    49ec:      	b.ne	0x49f8 <_stogir.locals.operation?+0x24>
    49f0:      	mov	w4, #0x1                ; =1
    49f4:      	b	0x4a18 <_stogir.locals.operation?+0x44>
    49f8:      	cmp	x2, #0x55
    49fc:      	b.lt	0x4a10 <_stogir.locals.operation?+0x3c>
    4a00:      	cmp	x2, #0x58
    4a04:      	cset	x0, le
    4a08:      	mov	x2, x0
    4a0c:      	b	0x4a14 <_stogir.locals.operation?+0x40>
    4a10:      	mov	w2, #0x0                ; =0
    4a14:      	mov	x4, x2
    4a18:      	mov	x3, x4
    4a1c:      	mov	x0, x3
    4a20:      	ret

0000000000004a24 <_stogir.locals.validate>:
    4a24:      	sub	sp, sp, #0x400
    4a28:      	stp	x29, x30, [sp]
    4a2c:      	mov	x29, sp
    4a30:      	stp	x19, x20, [sp, #0x10]
    4a34:      	stp	x21, x22, [sp, #0x20]
    4a38:      	str	x23, [sp, #0x30]
    4a3c:      	mov	x19, x8
    4a40:      	mov	x20, x0
    4a44:      	sxtw	x21, w1
    4a48:      	sxtw	x22, w2
    4a4c:      	add	x8, x29, #0xa0
    4a50:      	mov	x0, x20
    4a54:      	mov	x1, x21
    4a58:      	bl	0x4a58 <_stogir.locals.validate+0x34>
		0000000000004a58:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4a5c:      	ldr	w0, [x29, #0xa0]
    4a60:      	cmp	x0, #0x0
    4a64:      	b.eq	0x4a78 <_stogir.locals.validate+0x54>
    4a68:      	cmp	x0, #0x1
    4a6c:      	b.eq	0x4aa4 <_stogir.locals.validate+0x80>
    4a70:      	b	0x4a74 <_stogir.locals.validate+0x50>
    4a74:      	b	0x5098 <_stogir.locals.validate+0x674>
    4a78:      	mov	w0, #0x1                ; =1
    4a7c:      	str	w0, [x29, #0xd0]
    4a80:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		0000000000004a80:  ARM64_RELOC_PAGE21	l_cstr.110
    4a84:      	add	x0, x0, #0x0
		0000000000004a84:  ARM64_RELOC_PAGEOFF12	l_cstr.110
    4a88:      	str	x0, [x29, #0xf0]
    4a8c:      	mov	w0, #0x17               ; =23
    4a90:      	str	x0, [x29, #0xf8]
    4a94:      	ldr	q0, [x29, #0xf0]
    4a98:      	stur	q0, [x29, #0xd8]
    4a9c:      	add	x23, x29, #0xd0
    4aa0:      	b	0x5078 <_stogir.locals.validate+0x654>
    4aa4:      	ldur	q0, [x29, #0xa8]
    4aa8:      	str	q0, [x29, #0x100]
    4aac:      	add	x0, x29, #0x100
    4ab0:      	bl	0x4ab0 <_stogir.locals.validate+0x8c>
		0000000000004ab0:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    4ab4:      	ubfx	x0, x0, #0, #8
    4ab8:      	sxtw	x0, w0
    4abc:      	cmp	x0, #0x55
    4ac0:      	str	x0, [x29, #0x368]
    4ac4:      	b.ne	0x4ad4 <_stogir.locals.validate+0xb0>
    4ac8:      	mov	w1, #0x1                ; =1
    4acc:      	str	x1, [x29, #0x118]
    4ad0:      	b	0x4ae4 <_stogir.locals.validate+0xc0>
    4ad4:      	ldr	x0, [x29, #0x368]
    4ad8:      	cmp	x0, #0x56
    4adc:      	cset	x1, eq
    4ae0:      	str	x1, [x29, #0x118]
    4ae4:      	ldr	x0, [x29, #0x368]
    4ae8:      	cmp	x0, #0x57
    4aec:      	b.ne	0x4afc <_stogir.locals.validate+0xd8>
    4af0:      	mov	w1, #0x1                ; =1
    4af4:      	str	x1, [x29, #0x3c0]
    4af8:      	b	0x4b0c <_stogir.locals.validate+0xe8>
    4afc:      	ldr	x0, [x29, #0x368]
    4b00:      	cmp	x0, #0x58
    4b04:      	cset	x1, eq
    4b08:      	str	x1, [x29, #0x3c0]
    4b0c:      	ldr	x0, [x29, #0x368]
    4b10:      	cmp	x0, #0x41
    4b14:      	b.ne	0x4b24 <_stogir.locals.validate+0x100>
    4b18:      	mov	w1, #0x1                ; =1
    4b1c:      	str	x1, [x29, #0x3c8]
    4b20:      	b	0x4b4c <_stogir.locals.validate+0x128>
    4b24:      	ldr	x0, [x29, #0x118]
    4b28:      	cbz	x0, 0x4b38 <_stogir.locals.validate+0x114>
    4b2c:      	mov	w0, #0x2                ; =2
    4b30:      	str	x0, [x29, #0x118]
    4b34:      	b	0x4b40 <_stogir.locals.validate+0x11c>
    4b38:      	mov	w0, #0x3                ; =3
    4b3c:      	str	x0, [x29, #0x118]
    4b40:      	ldr	x0, [x29, #0x118]
    4b44:      	sxtw	x0, w0
    4b48:      	str	x0, [x29, #0x3c8]
    4b4c:      	cmp	x21, #0x0
    4b50:      	b.gt	0x4b60 <_stogir.locals.validate+0x13c>
    4b54:      	mov	w0, #0x1                ; =1
    4b58:      	str	x0, [x29, #0x118]
    4b5c:      	b	0x4be0 <_stogir.locals.validate+0x1bc>
    4b60:      	ldr	x0, [x29, #0x368]
    4b64:      	bl	0x4b64 <_stogir.locals.validate+0x140>
		0000000000004b64:  ARM64_RELOC_BRANCH26	_stogir.locals.operation?
    4b68:      	cbz	x0, 0x4b78 <_stogir.locals.validate+0x154>
    4b6c:      	mov	w0, #0x0                ; =0
    4b70:      	str	x0, [x29, #0x3d0]
    4b74:      	b	0x4b80 <_stogir.locals.validate+0x15c>
    4b78:      	mov	w0, #0x1                ; =1
    4b7c:      	str	x0, [x29, #0x3d0]
    4b80:      	ldr	x0, [x29, #0x3d0]
    4b84:      	cbz	x0, 0x4b94 <_stogir.locals.validate+0x170>
    4b88:      	mov	w0, #0x1                ; =1
    4b8c:      	str	x0, [x29, #0x3d0]
    4b90:      	b	0x4bd8 <_stogir.locals.validate+0x1b4>
    4b94:      	ldr	x0, [x20, #0x78]
    4b98:      	add	x0, x0, x21, lsl #2
    4b9c:      	ldrsw	x0, [x0]
    4ba0:      	str	w0, [x29, #0x110]
    4ba4:      	ldr	x0, [x29, #0x3c8]
    4ba8:      	str	w0, [x29, #0x114]
    4bac:      	ldrsw	x0, [x29, #0x110]
    4bb0:      	ldrsw	x1, [x29, #0x114]
    4bb4:      	cmp	x0, x1
    4bb8:      	b.ne	0x4bc8 <_stogir.locals.validate+0x1a4>
    4bbc:      	mov	w0, #0x0                ; =0
    4bc0:      	str	x0, [x29, #0x3c8]
    4bc4:      	b	0x4bd0 <_stogir.locals.validate+0x1ac>
    4bc8:      	mov	w0, #0x1                ; =1
    4bcc:      	str	x0, [x29, #0x3c8]
    4bd0:      	ldr	x0, [x29, #0x3c8]
    4bd4:      	str	x0, [x29, #0x3d0]
    4bd8:      	ldr	x0, [x29, #0x3d0]
    4bdc:      	str	x0, [x29, #0x118]
    4be0:      	ldr	x0, [x29, #0x118]
    4be4:      	cbz	x0, 0x4c1c <_stogir.locals.validate+0x1f8>
    4be8:      	mov	w0, #0x1                ; =1
    4bec:      	str	w0, [x29, #0x120]
    4bf0:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		0000000000004bf0:  ARM64_RELOC_PAGE21	l_cstr.111
    4bf4:      	add	x0, x0, #0x0
		0000000000004bf4:  ARM64_RELOC_PAGEOFF12	l_cstr.111
    4bf8:      	str	x0, [x29, #0x140]
    4bfc:      	mov	w0, #0x17               ; =23
    4c00:      	str	x0, [x29, #0x148]
    4c04:      	ldr	q0, [x29, #0x140]
    4c08:      	mov	w16, #0x128             ; =296
    4c0c:      	str	q0, [x29, x16]
    4c10:      	add	x0, x29, #0x120
    4c14:      	str	x0, [x29, #0x118]
    4c18:      	b	0x5074 <_stogir.locals.validate+0x650>
    4c1c:      	ldr	x0, [x29, #0x368]
    4c20:      	cmp	x0, #0x41
    4c24:      	b.ne	0x4c34 <_stogir.locals.validate+0x210>
    4c28:      	mov	w1, #0x1                ; =1
    4c2c:      	str	x1, [x29, #0x3d0]
    4c30:      	b	0x4c44 <_stogir.locals.validate+0x220>
    4c34:      	ldr	x0, [x29, #0x368]
    4c38:      	cmp	x0, #0x48
    4c3c:      	cset	x1, eq
    4c40:      	str	x1, [x29, #0x3d0]
    4c44:      	ldr	x0, [x29, #0x3d0]
    4c48:      	cbz	x0, 0x4c70 <_stogir.locals.validate+0x24c>
    4c4c:      	ldr	x0, [x29, #0x368]
    4c50:      	cmp	x0, #0x48
    4c54:      	b.ne	0x4c60 <_stogir.locals.validate+0x23c>
    4c58:      	str	x21, [x29, #0x3d0]
    4c5c:      	b	0x4c68 <_stogir.locals.validate+0x244>
    4c60:      	ldrsw	x0, [x29, #0x104]
    4c64:      	str	x0, [x29, #0x3d0]
    4c68:      	ldr	x21, [x29, #0x3d0]
    4c6c:      	b	0x4c78 <_stogir.locals.validate+0x254>
    4c70:      	ldrsw	x0, [x29, #0x108]
    4c74:      	mov	x21, x0
    4c78:      	add	x8, x29, #0x150
    4c7c:      	mov	x0, x20
    4c80:      	mov	x1, x21
    4c84:      	mov	x2, x22
    4c88:      	bl	0x4c88 <_stogir.locals.validate+0x264>
		0000000000004c88:  ARM64_RELOC_BRANCH26	_stogir.locals.shape
    4c8c:      	ldr	w0, [x29, #0x150]
    4c90:      	cmp	x0, #0x0
    4c94:      	b.eq	0x4cd0 <_stogir.locals.validate+0x2ac>
    4c98:      	cmp	x0, #0x1
    4c9c:      	b.eq	0x4ca8 <_stogir.locals.validate+0x284>
    4ca0:      	b	0x4ca4 <_stogir.locals.validate+0x280>
    4ca4:      	b	0x5094 <_stogir.locals.validate+0x670>
    4ca8:      	mov	w16, #0x158             ; =344
    4cac:      	ldr	q0, [x29, x16]
    4cb0:      	str	q0, [x29, #0x170]
    4cb4:      	mov	w0, #0x1                ; =1
    4cb8:      	str	w0, [x29, #0x180]
    4cbc:      	ldr	q0, [x29, #0x170]
    4cc0:      	mov	w16, #0x188             ; =392
    4cc4:      	str	q0, [x29, x16]
    4cc8:      	add	x21, x29, #0x180
    4ccc:      	b	0x5070 <_stogir.locals.validate+0x64c>
    4cd0:      	mov	w16, #0x158             ; =344
    4cd4:      	ldr	q0, [x29, x16]
    4cd8:      	str	q0, [x29, #0x1a0]
    4cdc:      	ldr	x0, [x29, #0x368]
    4ce0:      	cmp	x0, #0x48
    4ce4:      	b.ne	0x4d04 <_stogir.locals.validate+0x2e0>
    4ce8:      	str	wzr, [x29, #0x1b0]
    4cec:      	ldr	x1, [x29, #0x1a0]
    4cf0:      	sxtw	x1, w1
    4cf4:      	str	w1, [x29, #0x1b8]
    4cf8:      	add	x1, x29, #0x1b0
    4cfc:      	str	x1, [x29, #0x3d0]
    4d00:      	b	0x506c <_stogir.locals.validate+0x648>
    4d04:      	ldr	x0, [x29, #0x368]
    4d08:      	cmp	x0, #0x41
    4d0c:      	b.ne	0x4d74 <_stogir.locals.validate+0x350>
    4d10:      	add	x0, x29, #0x100
    4d14:      	bl	0x4d14 <_stogir.locals.validate+0x2f0>
		0000000000004d14:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    4d18:      	ubfx	x0, x0, #0, #8
    4d1c:      	cmp	x0, #0x6
    4d20:      	b.ne	0x4d38 <_stogir.locals.validate+0x314>
    4d24:      	str	wzr, [x29, #0x1d0]
    4d28:      	str	w22, [x29, #0x1d8]
    4d2c:      	add	x0, x29, #0x1d0
    4d30:      	str	x0, [x29, #0x368]
    4d34:      	b	0x4d68 <_stogir.locals.validate+0x344>
    4d38:      	mov	w0, #0x1                ; =1
    4d3c:      	str	w0, [x29, #0x1f0]
    4d40:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		0000000000004d40:  ARM64_RELOC_PAGE21	l_cstr.112
    4d44:      	add	x0, x0, #0x0
		0000000000004d44:  ARM64_RELOC_PAGEOFF12	l_cstr.112
    4d48:      	str	x0, [x29, #0x210]
    4d4c:      	mov	w0, #0x21               ; =33
    4d50:      	str	x0, [x29, #0x218]
    4d54:      	ldr	q0, [x29, #0x210]
    4d58:      	mov	w16, #0x1f8             ; =504
    4d5c:      	str	q0, [x29, x16]
    4d60:      	add	x0, x29, #0x1f0
    4d64:      	str	x0, [x29, #0x368]
    4d68:      	ldr	x0, [x29, #0x368]
    4d6c:      	str	x0, [x29, #0x3c8]
    4d70:      	b	0x5064 <_stogir.locals.validate+0x640>
    4d74:      	ldrsw	x0, [x29, #0x104]
    4d78:      	add	x8, x29, #0x220
    4d7c:      	mov	x9, x0
    4d80:      	mov	x0, x20
    4d84:      	mov	x1, x9
    4d88:      	bl	0x4d88 <_stogir.locals.validate+0x364>
		0000000000004d88:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4d8c:      	ldr	w0, [x29, #0x220]
    4d90:      	cmp	x0, #0x0
    4d94:      	b.eq	0x4da8 <_stogir.locals.validate+0x384>
    4d98:      	cmp	x0, #0x1
    4d9c:      	b.eq	0x4ddc <_stogir.locals.validate+0x3b8>
    4da0:      	b	0x4da4 <_stogir.locals.validate+0x380>
    4da4:      	b	0x5090 <_stogir.locals.validate+0x66c>
    4da8:      	mov	w0, #0x1                ; =1
    4dac:      	str	w0, [x29, #0x250]
    4db0:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		0000000000004db0:  ARM64_RELOC_PAGE21	l_cstr.113
    4db4:      	add	x0, x0, #0x0
		0000000000004db4:  ARM64_RELOC_PAGEOFF12	l_cstr.113
    4db8:      	str	x0, [x29, #0x270]
    4dbc:      	mov	w0, #0x1c               ; =28
    4dc0:      	str	x0, [x29, #0x278]
    4dc4:      	ldr	q0, [x29, #0x270]
    4dc8:      	mov	w16, #0x258             ; =600
    4dcc:      	str	q0, [x29, x16]
    4dd0:      	add	x0, x29, #0x250
    4dd4:      	str	x0, [x29, #0x368]
    4dd8:      	b	0x505c <_stogir.locals.validate+0x638>
    4ddc:      	mov	w16, #0x228             ; =552
    4de0:      	ldr	q0, [x29, x16]
    4de4:      	str	q0, [x29, #0x280]
    4de8:      	ldrsw	x0, [x29, #0x104]
    4dec:      	cmp	x0, #0x0
    4df0:      	b.gt	0x4e00 <_stogir.locals.validate+0x3dc>
    4df4:      	mov	w0, #0x1                ; =1
    4df8:      	str	x0, [x29, #0x3d8]
    4dfc:      	b	0x4e60 <_stogir.locals.validate+0x43c>
    4e00:      	add	x0, x29, #0x280
    4e04:      	bl	0x4e04 <_stogir.locals.validate+0x3e0>
		0000000000004e04:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    4e08:      	ubfx	x0, x0, #0, #8
    4e0c:      	sxtw	x0, w0
    4e10:      	bl	0x4e10 <_stogir.locals.validate+0x3ec>
		0000000000004e10:  ARM64_RELOC_BRANCH26	_stogir.opcode.control?
    4e14:      	cbz	x0, 0x4e24 <_stogir.locals.validate+0x400>
    4e18:      	mov	w0, #0x0                ; =0
    4e1c:      	str	x0, [x29, #0x3e0]
    4e20:      	b	0x4e2c <_stogir.locals.validate+0x408>
    4e24:      	mov	w0, #0x1                ; =1
    4e28:      	str	x0, [x29, #0x3e0]
    4e2c:      	ldr	x0, [x29, #0x3e0]
    4e30:      	cbz	x0, 0x4e40 <_stogir.locals.validate+0x41c>
    4e34:      	mov	w0, #0x1                ; =1
    4e38:      	str	x0, [x29, #0x3e0]
    4e3c:      	b	0x4e58 <_stogir.locals.validate+0x434>
    4e40:      	add	x0, x29, #0x280
    4e44:      	bl	0x4e44 <_stogir.locals.validate+0x420>
		0000000000004e44:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    4e48:      	ubfx	x0, x0, #0, #8
    4e4c:      	sxtw	x0, w0
    4e50:      	bl	0x4e50 <_stogir.locals.validate+0x42c>
		0000000000004e50:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-end?
    4e54:      	str	x0, [x29, #0x3e0]
    4e58:      	ldr	x0, [x29, #0x3e0]
    4e5c:      	str	x0, [x29, #0x3d8]
    4e60:      	ldr	x0, [x29, #0x3d8]
    4e64:      	cbz	x0, 0x4e9c <_stogir.locals.validate+0x478>
    4e68:      	mov	w0, #0x1                ; =1
    4e6c:      	str	w0, [x29, #0x290]
    4e70:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		0000000000004e70:  ARM64_RELOC_PAGE21	l_cstr.114
    4e74:      	add	x0, x0, #0x0
		0000000000004e74:  ARM64_RELOC_PAGEOFF12	l_cstr.114
    4e78:      	str	x0, [x29, #0x2b0]
    4e7c:      	mov	w0, #0x1c               ; =28
    4e80:      	str	x0, [x29, #0x2b8]
    4e84:      	ldr	q0, [x29, #0x2b0]
    4e88:      	mov	w16, #0x298             ; =664
    4e8c:      	str	q0, [x29, x16]
    4e90:      	add	x0, x29, #0x290
    4e94:      	str	x0, [x29, #0x3d8]
    4e98:      	b	0x5054 <_stogir.locals.validate+0x630>
    4e9c:      	ldr	x0, [x29, #0x3c0]
    4ea0:      	mov	x1, x0
    4ea4:      	cbz	x1, 0x4ec4 <_stogir.locals.validate+0x4a0>
    4ea8:      	ldrsw	x1, [x29, #0x10c]
    4eac:      	add	x8, x29, #0x2c0
    4eb0:      	mov	x9, x0
    4eb4:      	mov	x0, x20
    4eb8:      	bl	0x4eb8 <_stogir.locals.validate+0x494>
		0000000000004eb8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4ebc:      	add	x20, x29, #0x2c0
    4ec0:      	b	0x4edc <_stogir.locals.validate+0x4b8>
    4ec4:      	mov	w0, #0x1                ; =1
    4ec8:      	str	w0, [x29, #0x2f0]
    4ecc:      	ldr	q0, [x29, #0x100]
    4ed0:      	mov	w16, #0x2f8             ; =760
    4ed4:      	str	q0, [x29, x16]
    4ed8:      	add	x20, x29, #0x2f0
    4edc:      	ldr	w0, [x20]
    4ee0:      	cmp	x0, #0x0
    4ee4:      	b.eq	0x4ef8 <_stogir.locals.validate+0x4d4>
    4ee8:      	cmp	x0, #0x1
    4eec:      	b.eq	0x4f2c <_stogir.locals.validate+0x508>
    4ef0:      	b	0x4ef4 <_stogir.locals.validate+0x4d0>
    4ef4:      	b	0x508c <_stogir.locals.validate+0x668>
    4ef8:      	mov	w0, #0x1                ; =1
    4efc:      	str	w0, [x29, #0x320]
    4f00:      	adrp	x0, 0x4000 <_stogir.atomic.validate+0x5dc>
		0000000000004f00:  ARM64_RELOC_PAGE21	l_cstr.115
    4f04:      	add	x0, x0, #0x0
		0000000000004f04:  ARM64_RELOC_PAGEOFF12	l_cstr.115
    4f08:      	str	x0, [x29, #0x340]
    4f0c:      	mov	w0, #0x19               ; =25
    4f10:      	str	x0, [x29, #0x348]
    4f14:      	ldr	q0, [x29, #0x340]
    4f18:      	mov	w16, #0x328             ; =808
    4f1c:      	str	q0, [x29, x16]
    4f20:      	add	x0, x29, #0x320
    4f24:      	str	x0, [x29, #0x3e0]
    4f28:      	b	0x504c <_stogir.locals.validate+0x628>
    4f2c:      	add	x20, x20, #0x8
    4f30:      	ldr	q0, [x20]
    4f34:      	str	q0, [x29, #0x350]
    4f38:      	add	x0, x29, #0x350
    4f3c:      	bl	0x4f3c <_stogir.locals.validate+0x518>
		0000000000004f3c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    4f40:      	ubfx	x0, x0, #0, #8
    4f44:      	sxtw	x0, w0
    4f48:      	mov	x1, x22
    4f4c:      	bl	0x4f4c <_stogir.locals.validate+0x528>
		0000000000004f4c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    4f50:      	sxtw	x20, w0
    4f54:      	cmp	x20, #0x0
    4f58:      	b.gt	0x4f64 <_stogir.locals.validate+0x540>
    4f5c:      	mov	w22, #0x1               ; =1
    4f60:      	b	0x5008 <_stogir.locals.validate+0x5e4>
    4f64:      	ldr	x0, [x29, #0x1a0]
    4f68:      	cmp	x20, x0
    4f6c:      	b.le	0x4f7c <_stogir.locals.validate+0x558>
    4f70:      	mov	w0, #0x1                ; =1
    4f74:      	str	x0, [x29, #0x3e8]
    4f78:      	b	0x5004 <_stogir.locals.validate+0x5e0>
    4f7c:      	ldr	x0, [x29, #0x3c0]
    4f80:      	cbz	x0, 0x4fc8 <_stogir.locals.validate+0x5a4>
    4f84:      	add	x0, x29, #0x100
    4f88:      	bl	0x4f88 <_stogir.locals.validate+0x564>
		0000000000004f88:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    4f8c:      	ubfx	x0, x0, #0, #8
    4f90:      	strb	w0, [x29, #0x360]
    4f94:      	strb	wzr, [x29, #0x361]
    4f98:      	ldrb	w0, [x29, #0x360]
    4f9c:      	ldrb	w1, [x29, #0x361]
    4fa0:      	cmp	x0, x1
    4fa4:      	b.ne	0x4fb4 <_stogir.locals.validate+0x590>
    4fa8:      	mov	w0, #0x0                ; =0
    4fac:      	str	x0, [x29, #0x3c0]
    4fb0:      	b	0x4fbc <_stogir.locals.validate+0x598>
    4fb4:      	mov	w0, #0x1                ; =1
    4fb8:      	str	x0, [x29, #0x3c0]
    4fbc:      	ldr	x0, [x29, #0x3c0]
    4fc0:      	str	x0, [x29, #0x3f0]
    4fc4:      	b	0x4fd0 <_stogir.locals.validate+0x5ac>
    4fc8:      	mov	w0, #0x0                ; =0
    4fcc:      	str	x0, [x29, #0x3f0]
    4fd0:      	ldr	x0, [x29, #0x3f0]
    4fd4:      	cbz	x0, 0x4fe4 <_stogir.locals.validate+0x5c0>
    4fd8:      	mov	w0, #0x1                ; =1
    4fdc:      	str	x0, [x29, #0x3f0]
    4fe0:      	b	0x4ffc <_stogir.locals.validate+0x5d8>
    4fe4:      	add	x0, x29, #0x350
    4fe8:      	bl	0x4fe8 <_stogir.locals.validate+0x5c4>
		0000000000004fe8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    4fec:      	ubfx	x0, x0, #0, #8
    4ff0:      	cmp	x0, #0x48
    4ff4:      	cset	x0, eq
    4ff8:      	str	x0, [x29, #0x3f0]
    4ffc:      	ldr	x0, [x29, #0x3f0]
    5000:      	str	x0, [x29, #0x3e8]
    5004:      	ldr	x22, [x29, #0x3e8]
    5008:      	cbz	x22, 0x503c <_stogir.locals.validate+0x618>
    500c:      	mov	w0, #0x1                ; =1
    5010:      	str	w0, [x29, #0x370]
    5014:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		0000000000005014:  ARM64_RELOC_PAGE21	l_cstr.116
    5018:      	add	x0, x0, #0x0
		0000000000005018:  ARM64_RELOC_PAGEOFF12	l_cstr.116
    501c:      	str	x0, [x29, #0x390]
    5020:      	mov	w0, #0x23               ; =35
    5024:      	str	x0, [x29, #0x398]
    5028:      	ldr	q0, [x29, #0x390]
    502c:      	mov	w16, #0x378             ; =888
    5030:      	str	q0, [x29, x16]
    5034:      	add	x22, x29, #0x370
    5038:      	b	0x5048 <_stogir.locals.validate+0x624>
    503c:      	str	wzr, [x29, #0x3a0]
    5040:      	str	w20, [x29, #0x3a8]
    5044:      	add	x22, x29, #0x3a0
    5048:      	str	x22, [x29, #0x3e0]
    504c:      	ldr	x0, [x29, #0x3e0]
    5050:      	str	x0, [x29, #0x3d8]
    5054:      	ldr	x0, [x29, #0x3d8]
    5058:      	str	x0, [x29, #0x368]
    505c:      	ldr	x0, [x29, #0x368]
    5060:      	str	x0, [x29, #0x3c8]
    5064:      	ldr	x0, [x29, #0x3c8]
    5068:      	str	x0, [x29, #0x3d0]
    506c:      	ldr	x21, [x29, #0x3d0]
    5070:      	str	x21, [x29, #0x118]
    5074:      	ldr	x23, [x29, #0x118]
    5078:      	ldr	q0, [x23]
    507c:      	str	q0, [x19]
    5080:      	ldr	x0, [x23, #0x10]
    5084:      	str	x0, [x19, #0x10]
    5088:      	b	0x509c <_stogir.locals.validate+0x678>
    508c:      	brk	#0x1
    5090:      	brk	#0x1
    5094:      	brk	#0x1
    5098:      	brk	#0x1
    509c:      	ldp	x19, x20, [sp, #0x10]
    50a0:      	ldp	x21, x22, [sp, #0x20]
    50a4:      	ldr	x23, [sp, #0x30]
    50a8:      	ldp	x29, x30, [sp]
    50ac:      	add	sp, sp, #0x400
    50b0:      	ret

00000000000050b4 <_stogir.conversion.operation?>:
    50b4:      	sxtw	x2, w0
    50b8:      	cmp	x2, #0x21
    50bc:      	b.lt	0x50d0 <_stogir.conversion.operation?+0x1c>
    50c0:      	cmp	x2, #0x27
    50c4:      	cset	x0, le
    50c8:      	mov	x2, x0
    50cc:      	b	0x50d4 <_stogir.conversion.operation?+0x20>
    50d0:      	mov	w2, #0x0                ; =0
    50d4:      	mov	x0, x2
    50d8:      	ret

00000000000050dc <_stogir.conversion.validate>:
    50dc:      	sub	sp, sp, #0x220
    50e0:      	stp	x29, x30, [sp]
    50e4:      	mov	x29, sp
    50e8:      	stp	x19, x20, [sp, #0x10]
    50ec:      	stp	x21, x22, [sp, #0x20]
    50f0:      	str	x23, [sp, #0x30]
    50f4:      	mov	x19, x8
    50f8:      	mov	x20, x0
    50fc:      	sxtw	x21, w1
    5100:      	sxtw	x22, w2
    5104:      	add	x8, x29, #0xa0
    5108:      	mov	x0, x20
    510c:      	mov	x1, x21
    5110:      	bl	0x5110 <_stogir.conversion.validate+0x34>
		0000000000005110:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    5114:      	ldr	w0, [x29, #0xa0]
    5118:      	cmp	x0, #0x0
    511c:      	b.eq	0x5130 <_stogir.conversion.validate+0x54>
    5120:      	cmp	x0, #0x1
    5124:      	b.eq	0x515c <_stogir.conversion.validate+0x80>
    5128:      	b	0x512c <_stogir.conversion.validate+0x50>
    512c:      	b	0x539c <_stogir.conversion.validate+0x2c0>
    5130:      	mov	w0, #0x1                ; =1
    5134:      	str	w0, [x29, #0xd0]
    5138:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		0000000000005138:  ARM64_RELOC_PAGE21	l_cstr.117
    513c:      	add	x0, x0, #0x0
		000000000000513c:  ARM64_RELOC_PAGEOFF12	l_cstr.117
    5140:      	str	x0, [x29, #0xf0]
    5144:      	mov	w0, #0x12               ; =18
    5148:      	str	x0, [x29, #0xf8]
    514c:      	ldr	q0, [x29, #0xf0]
    5150:      	stur	q0, [x29, #0xd8]
    5154:      	add	x23, x29, #0xd0
    5158:      	b	0x5384 <_stogir.conversion.validate+0x2a8>
    515c:      	ldur	q0, [x29, #0xa8]
    5160:      	str	q0, [x29, #0x100]
    5164:      	cmp	x21, #0x0
    5168:      	b.gt	0x5178 <_stogir.conversion.validate+0x9c>
    516c:      	mov	w0, #0x1                ; =1
    5170:      	str	x0, [x29, #0x118]
    5174:      	b	0x51f8 <_stogir.conversion.validate+0x11c>
    5178:      	add	x0, x29, #0x100
    517c:      	bl	0x517c <_stogir.conversion.validate+0xa0>
		000000000000517c:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    5180:      	ubfx	x0, x0, #0, #8
    5184:      	sxtw	x0, w0
    5188:      	bl	0x5188 <_stogir.conversion.validate+0xac>
		0000000000005188:  ARM64_RELOC_BRANCH26	_stogir.conversion.operation?
    518c:      	cbz	x0, 0x519c <_stogir.conversion.validate+0xc0>
    5190:      	mov	w0, #0x0                ; =0
    5194:      	str	x0, [x29, #0x210]
    5198:      	b	0x51a4 <_stogir.conversion.validate+0xc8>
    519c:      	mov	w0, #0x1                ; =1
    51a0:      	str	x0, [x29, #0x210]
    51a4:      	ldr	x0, [x29, #0x210]
    51a8:      	cbz	x0, 0x51b8 <_stogir.conversion.validate+0xdc>
    51ac:      	mov	w0, #0x1                ; =1
    51b0:      	str	x0, [x29, #0x210]
    51b4:      	b	0x51f0 <_stogir.conversion.validate+0x114>
    51b8:      	ldr	x0, [x20, #0x78]
    51bc:      	add	x0, x0, x21, lsl #2
    51c0:      	ldrsw	x0, [x0]
    51c4:      	str	w0, [x29, #0x110]
    51c8:      	mov	w0, #0x1                ; =1
    51cc:      	str	w0, [x29, #0x114]
    51d0:      	ldrsw	x0, [x29, #0x110]
    51d4:      	ldrsw	x1, [x29, #0x114]
    51d8:      	cmp	x0, x1
    51dc:      	b.ne	0x51e8 <_stogir.conversion.validate+0x10c>
    51e0:      	mov	w21, #0x0               ; =0
    51e4:      	b	0x51ec <_stogir.conversion.validate+0x110>
    51e8:      	mov	w21, #0x1               ; =1
    51ec:      	str	x21, [x29, #0x210]
    51f0:      	ldr	x0, [x29, #0x210]
    51f4:      	str	x0, [x29, #0x118]
    51f8:      	ldr	x0, [x29, #0x118]
    51fc:      	cbz	x0, 0x5230 <_stogir.conversion.validate+0x154>
    5200:      	mov	w0, #0x1                ; =1
    5204:      	str	w0, [x29, #0x120]
    5208:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		0000000000005208:  ARM64_RELOC_PAGE21	l_cstr.118
    520c:      	add	x0, x0, #0x0
		000000000000520c:  ARM64_RELOC_PAGEOFF12	l_cstr.118
    5210:      	str	x0, [x29, #0x140]
    5214:      	mov	w0, #0x1e               ; =30
    5218:      	str	x0, [x29, #0x148]
    521c:      	ldr	q0, [x29, #0x140]
    5220:      	mov	w16, #0x128             ; =296
    5224:      	str	q0, [x29, x16]
    5228:      	add	x21, x29, #0x120
    522c:      	b	0x5380 <_stogir.conversion.validate+0x2a4>
    5230:      	ldrsw	x0, [x29, #0x104]
    5234:      	add	x8, x29, #0x150
    5238:      	mov	x9, x0
    523c:      	mov	x0, x20
    5240:      	mov	x1, x9
    5244:      	bl	0x5244 <_stogir.conversion.validate+0x168>
		0000000000005244:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    5248:      	ldr	w0, [x29, #0x150]
    524c:      	cmp	x0, #0x0
    5250:      	b.eq	0x5264 <_stogir.conversion.validate+0x188>
    5254:      	cmp	x0, #0x1
    5258:      	b.eq	0x5294 <_stogir.conversion.validate+0x1b8>
    525c:      	b	0x5260 <_stogir.conversion.validate+0x184>
    5260:      	b	0x5398 <_stogir.conversion.validate+0x2bc>
    5264:      	mov	w0, #0x1                ; =1
    5268:      	str	w0, [x29, #0x180]
    526c:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		000000000000526c:  ARM64_RELOC_PAGE21	l_cstr.119
    5270:      	add	x0, x0, #0x0
		0000000000005270:  ARM64_RELOC_PAGEOFF12	l_cstr.119
    5274:      	str	x0, [x29, #0x1a0]
    5278:      	mov	w0, #0x19               ; =25
    527c:      	str	x0, [x29, #0x1a8]
    5280:      	ldr	q0, [x29, #0x1a0]
    5284:      	mov	w16, #0x188             ; =392
    5288:      	str	q0, [x29, x16]
    528c:      	add	x20, x29, #0x180
    5290:      	b	0x537c <_stogir.conversion.validate+0x2a0>
    5294:      	mov	w16, #0x158             ; =344
    5298:      	ldr	q0, [x29, x16]
    529c:      	str	q0, [x29, #0x1b0]
    52a0:      	add	x0, x29, #0x1b0
    52a4:      	bl	0x52a4 <_stogir.conversion.validate+0x1c8>
		00000000000052a4:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    52a8:      	ubfx	x0, x0, #0, #8
    52ac:      	cmp	x0, #0x48
    52b0:      	b.ne	0x52c0 <_stogir.conversion.validate+0x1e4>
    52b4:      	mov	w0, #0x1                ; =1
    52b8:      	str	x0, [x29, #0x118]
    52bc:      	b	0x52d8 <_stogir.conversion.validate+0x1fc>
    52c0:      	add	x0, x29, #0x1b0
    52c4:      	bl	0x52c4 <_stogir.conversion.validate+0x1e8>
		00000000000052c4:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    52c8:      	ubfx	x0, x0, #0, #8
    52cc:      	cmp	x0, #0x46
    52d0:      	cset	x0, eq
    52d4:      	str	x0, [x29, #0x118]
    52d8:      	ldr	x0, [x29, #0x118]
    52dc:      	cbz	x0, 0x5314 <_stogir.conversion.validate+0x238>
    52e0:      	mov	w0, #0x1                ; =1
    52e4:      	str	w0, [x29, #0x1c0]
    52e8:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		00000000000052e8:  ARM64_RELOC_PAGE21	l_cstr.120
    52ec:      	add	x0, x0, #0x0
		00000000000052ec:  ARM64_RELOC_PAGEOFF12	l_cstr.120
    52f0:      	str	x0, [x29, #0x1e0]
    52f4:      	mov	w0, #0x25               ; =37
    52f8:      	str	x0, [x29, #0x1e8]
    52fc:      	ldr	q0, [x29, #0x1e0]
    5300:      	mov	w16, #0x1c8             ; =456
    5304:      	str	q0, [x29, x16]
    5308:      	add	x0, x29, #0x1c0
    530c:      	str	x0, [x29, #0x118]
    5310:      	b	0x5378 <_stogir.conversion.validate+0x29c>
    5314:      	add	x0, x29, #0x100
    5318:      	bl	0x5318 <_stogir.conversion.validate+0x23c>
		0000000000005318:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    531c:      	ubfx	x0, x0, #0, #8
    5320:      	sxtw	x0, w0
    5324:      	mov	x9, x0
    5328:      	add	x0, x29, #0x1b0
    532c:      	str	x9, [x29, #0x210]
    5330:      	bl	0x5330 <_stogir.conversion.validate+0x254>
		0000000000005330:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    5334:      	ubfx	x0, x0, #0, #8
    5338:      	sxtw	x0, w0
    533c:      	mov	x9, x0
    5340:      	add	x0, x29, #0x100
    5344:      	str	x9, [x29, #0x218]
    5348:      	bl	0x5348 <_stogir.conversion.validate+0x26c>
		0000000000005348:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    534c:      	ubfx	x0, x0, #0, #8
    5350:      	sxtw	x0, w0
    5354:      	add	x8, x29, #0x1f0
    5358:      	mov	x9, x0
    535c:      	ldr	x0, [x29, #0x210]
    5360:      	ldr	x1, [x29, #0x218]
    5364:      	mov	x2, x9
    5368:      	mov	x3, x22
    536c:      	bl	0x536c <_stogir.conversion.validate+0x290>
		000000000000536c:  ARM64_RELOC_BRANCH26	_stogir.conversion.policy
    5370:      	add	x0, x29, #0x1f0
    5374:      	str	x0, [x29, #0x118]
    5378:      	ldr	x20, [x29, #0x118]
    537c:      	mov	x21, x20
    5380:      	mov	x23, x21
    5384:      	ldr	q0, [x23]
    5388:      	str	q0, [x19]
    538c:      	ldr	x0, [x23, #0x10]
    5390:      	str	x0, [x19, #0x10]
    5394:      	b	0x53a0 <_stogir.conversion.validate+0x2c4>
    5398:      	brk	#0x1
    539c:      	brk	#0x1
    53a0:      	ldp	x19, x20, [sp, #0x10]
    53a4:      	ldp	x21, x22, [sp, #0x20]
    53a8:      	ldr	x23, [sp, #0x30]
    53ac:      	ldp	x29, x30, [sp]
    53b0:      	add	sp, sp, #0x220
    53b4:      	ret

00000000000053b8 <_stogir.conditional.validate>:
    53b8:      	stp	x29, x30, [sp, #-0x180]!
    53bc:      	mov	x29, sp
    53c0:      	stp	x19, x20, [sp, #0x10]
    53c4:      	stp	x21, x22, [sp, #0x20]
    53c8:      	str	x23, [sp, #0x30]
    53cc:      	mov	x19, x8
    53d0:      	mov	x20, x0
    53d4:      	sxtw	x21, w1
    53d8:      	add	x8, x29, #0xa0
    53dc:      	mov	x0, x20
    53e0:      	mov	x1, x21
    53e4:      	bl	0x53e4 <_stogir.conditional.validate+0x2c>
		00000000000053e4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    53e8:      	ldr	w0, [x29, #0xa0]
    53ec:      	cmp	x0, #0x0
    53f0:      	b.eq	0x5404 <_stogir.conditional.validate+0x4c>
    53f4:      	cmp	x0, #0x1
    53f8:      	b.eq	0x5430 <_stogir.conditional.validate+0x78>
    53fc:      	b	0x5400 <_stogir.conditional.validate+0x48>
    5400:      	b	0x556c <_stogir.conditional.validate+0x1b4>
    5404:      	mov	w0, #0x1                ; =1
    5408:      	str	w0, [x29, #0xd0]
    540c:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		000000000000540c:  ARM64_RELOC_PAGE21	l_cstr.121
    5410:      	add	x0, x0, #0x0
		0000000000005410:  ARM64_RELOC_PAGEOFF12	l_cstr.121
    5414:      	str	x0, [x29, #0xf0]
    5418:      	mov	w0, #0x18               ; =24
    541c:      	str	x0, [x29, #0xf8]
    5420:      	ldr	q0, [x29, #0xf0]
    5424:      	stur	q0, [x29, #0xd8]
    5428:      	add	x22, x29, #0xd0
    542c:      	b	0x5558 <_stogir.conditional.validate+0x1a0>
    5430:      	ldur	q0, [x29, #0xa8]
    5434:      	str	q0, [x29, #0x100]
    5438:      	cmp	x21, #0x0
    543c:      	b.gt	0x5448 <_stogir.conditional.validate+0x90>
    5440:      	mov	w23, #0x1               ; =1
    5444:      	b	0x54d4 <_stogir.conditional.validate+0x11c>
    5448:      	add	x0, x29, #0x100
    544c:      	bl	0x544c <_stogir.conditional.validate+0x94>
		000000000000544c:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    5450:      	ubfx	x0, x0, #0, #8
    5454:      	strb	w0, [x29, #0x110]
    5458:      	mov	w0, #0x3c               ; =60
    545c:      	strb	w0, [x29, #0x111]
    5460:      	ldrb	w0, [x29, #0x110]
    5464:      	ldrb	w1, [x29, #0x111]
    5468:      	cmp	x0, x1
    546c:      	b.ne	0x547c <_stogir.conditional.validate+0xc4>
    5470:      	mov	w0, #0x0                ; =0
    5474:      	str	x0, [x29, #0x170]
    5478:      	b	0x5484 <_stogir.conditional.validate+0xcc>
    547c:      	mov	w0, #0x1                ; =1
    5480:      	str	x0, [x29, #0x170]
    5484:      	ldr	x0, [x29, #0x170]
    5488:      	cbz	x0, 0x5498 <_stogir.conditional.validate+0xe0>
    548c:      	mov	w0, #0x1                ; =1
    5490:      	str	x0, [x29, #0x170]
    5494:      	b	0x54d0 <_stogir.conditional.validate+0x118>
    5498:      	ldr	x0, [x20, #0x78]
    549c:      	add	x0, x0, x21, lsl #2
    54a0:      	ldrsw	x0, [x0]
    54a4:      	str	w0, [x29, #0x114]
    54a8:      	mov	w0, #0x3                ; =3
    54ac:      	str	w0, [x29, #0x118]
    54b0:      	ldrsw	x0, [x29, #0x114]
    54b4:      	ldrsw	x1, [x29, #0x118]
    54b8:      	cmp	x0, x1
    54bc:      	b.ne	0x54c8 <_stogir.conditional.validate+0x110>
    54c0:      	mov	w21, #0x0               ; =0
    54c4:      	b	0x54cc <_stogir.conditional.validate+0x114>
    54c8:      	mov	w21, #0x1               ; =1
    54cc:      	str	x21, [x29, #0x170]
    54d0:      	ldr	x23, [x29, #0x170]
    54d4:      	cbz	x23, 0x5508 <_stogir.conditional.validate+0x150>
    54d8:      	mov	w0, #0x1                ; =1
    54dc:      	str	w0, [x29, #0x120]
    54e0:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		00000000000054e0:  ARM64_RELOC_PAGE21	l_cstr.122
    54e4:      	add	x0, x0, #0x0
		00000000000054e4:  ARM64_RELOC_PAGEOFF12	l_cstr.122
    54e8:      	str	x0, [x29, #0x140]
    54ec:      	mov	w0, #0x18               ; =24
    54f0:      	str	x0, [x29, #0x148]
    54f4:      	ldr	q0, [x29, #0x140]
    54f8:      	mov	w16, #0x128             ; =296
    54fc:      	str	q0, [x29, x16]
    5500:      	add	x21, x29, #0x120
    5504:      	b	0x5554 <_stogir.conditional.validate+0x19c>
    5508:      	add	x0, x29, #0x100
    550c:      	bl	0x550c <_stogir.conditional.validate+0x154>
		000000000000550c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    5510:      	ubfx	x0, x0, #0, #8
    5514:      	sxtw	x0, w0
    5518:      	ldrsw	x1, [x29, #0x104]
    551c:      	ldrsw	x2, [x29, #0x108]
    5520:      	ldrsw	x3, [x29, #0x10c]
    5524:      	add	x8, x29, #0x150
    5528:      	mov	x9, x0
    552c:      	mov	x0, x20
    5530:      	mov	x10, x1
    5534:      	mov	x1, x9
    5538:      	mov	x9, x2
    553c:      	mov	x2, x10
    5540:      	mov	x10, x3
    5544:      	mov	x3, x9
    5548:      	mov	x4, x10
    554c:      	bl	0x554c <_stogir.conditional.validate+0x194>
		000000000000554c:  ARM64_RELOC_BRANCH26	_stogir.conditional.operands
    5550:      	add	x21, x29, #0x150
    5554:      	mov	x22, x21
    5558:      	ldr	q0, [x22]
    555c:      	str	q0, [x19]
    5560:      	ldr	x0, [x22, #0x10]
    5564:      	str	x0, [x19, #0x10]
    5568:      	b	0x5570 <_stogir.conditional.validate+0x1b8>
    556c:      	brk	#0x1
    5570:      	ldp	x19, x20, [sp, #0x10]
    5574:      	ldp	x21, x22, [sp, #0x20]
    5578:      	ldr	x23, [sp, #0x30]
    557c:      	ldp	x29, x30, [sp], #0x180
    5580:      	ret

0000000000005584 <_stogir.floating.validate>:
    5584:      	sub	sp, sp, #0x240
    5588:      	stp	x29, x30, [sp]
    558c:      	mov	x29, sp
    5590:      	stp	x19, x20, [sp, #0x10]
    5594:      	stp	x21, x22, [sp, #0x20]
    5598:      	str	x23, [sp, #0x30]
    559c:      	mov	x19, x8
    55a0:      	mov	x20, x0
    55a4:      	sxtw	x21, w1
    55a8:      	add	x8, x29, #0xa0
    55ac:      	mov	x0, x20
    55b0:      	mov	x1, x21
    55b4:      	bl	0x55b4 <_stogir.floating.validate+0x30>
		00000000000055b4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    55b8:      	ldr	w0, [x29, #0xa0]
    55bc:      	cmp	x0, #0x0
    55c0:      	b.eq	0x55d4 <_stogir.floating.validate+0x50>
    55c4:      	cmp	x0, #0x1
    55c8:      	b.eq	0x5600 <_stogir.floating.validate+0x7c>
    55cc:      	b	0x55d0 <_stogir.floating.validate+0x4c>
    55d0:      	b	0x58b0 <_stogir.floating.validate+0x32c>
    55d4:      	mov	w0, #0x1                ; =1
    55d8:      	str	w0, [x29, #0xd0]
    55dc:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		00000000000055dc:  ARM64_RELOC_PAGE21	l_cstr.123
    55e0:      	add	x0, x0, #0x0
		00000000000055e0:  ARM64_RELOC_PAGEOFF12	l_cstr.123
    55e4:      	str	x0, [x29, #0xf0]
    55e8:      	mov	w0, #0x1c               ; =28
    55ec:      	str	x0, [x29, #0xf8]
    55f0:      	ldr	q0, [x29, #0xf0]
    55f4:      	stur	q0, [x29, #0xd8]
    55f8:      	add	x22, x29, #0xd0
    55fc:      	b	0x5898 <_stogir.floating.validate+0x314>
    5600:      	ldur	q0, [x29, #0xa8]
    5604:      	str	q0, [x29, #0x100]
    5608:      	add	x0, x29, #0x100
    560c:      	bl	0x560c <_stogir.floating.validate+0x88>
		000000000000560c:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    5610:      	ubfx	x0, x0, #0, #8
    5614:      	sxtw	x23, w0
    5618:      	cmp	x21, #0x0
    561c:      	b.gt	0x562c <_stogir.floating.validate+0xa8>
    5620:      	mov	w0, #0x1                ; =1
    5624:      	str	x0, [x29, #0x1c8]
    5628:      	b	0x56d4 <_stogir.floating.validate+0x150>
    562c:      	mov	x0, x23
    5630:      	bl	0x5630 <_stogir.floating.validate+0xac>
		0000000000005630:  ARM64_RELOC_BRANCH26	_stogir.floating.operation?
    5634:      	cbz	x0, 0x5644 <_stogir.floating.validate+0xc0>
    5638:      	mov	w0, #0x0                ; =0
    563c:      	str	x0, [x29, #0x118]
    5640:      	b	0x564c <_stogir.floating.validate+0xc8>
    5644:      	mov	w0, #0x1                ; =1
    5648:      	str	x0, [x29, #0x118]
    564c:      	ldr	x0, [x29, #0x118]
    5650:      	cbz	x0, 0x5660 <_stogir.floating.validate+0xdc>
    5654:      	mov	w0, #0x1                ; =1
    5658:      	str	x0, [x29, #0x118]
    565c:      	b	0x56cc <_stogir.floating.validate+0x148>
    5660:      	ldr	x0, [x20, #0x78]
    5664:      	add	x0, x0, x21, lsl #2
    5668:      	ldrsw	x0, [x0]
    566c:      	str	w0, [x29, #0x110]
    5670:      	mov	x0, x23
    5674:      	bl	0x5674 <_stogir.floating.validate+0xf0>
		0000000000005674:  ARM64_RELOC_BRANCH26	_stogir.floating.unary?
    5678:      	cbz	x0, 0x5684 <_stogir.floating.validate+0x100>
    567c:      	mov	w21, #0x1               ; =1
    5680:      	b	0x56a4 <_stogir.floating.validate+0x120>
    5684:      	cmp	x23, #0x1d
    5688:      	b.ne	0x5698 <_stogir.floating.validate+0x114>
    568c:      	mov	w0, #0x3                ; =3
    5690:      	str	x0, [x29, #0x220]
    5694:      	b	0x56a0 <_stogir.floating.validate+0x11c>
    5698:      	mov	w0, #0x2                ; =2
    569c:      	str	x0, [x29, #0x220]
    56a0:      	ldr	x21, [x29, #0x220]
    56a4:      	sxtw	x21, w21
    56a8:      	str	w21, [x29, #0x114]
    56ac:      	ldrsw	x0, [x29, #0x110]
    56b0:      	ldrsw	x1, [x29, #0x114]
    56b4:      	cmp	x0, x1
    56b8:      	b.ne	0x56c4 <_stogir.floating.validate+0x140>
    56bc:      	mov	w21, #0x0               ; =0
    56c0:      	b	0x56c8 <_stogir.floating.validate+0x144>
    56c4:      	mov	w21, #0x1               ; =1
    56c8:      	str	x21, [x29, #0x118]
    56cc:      	ldr	x0, [x29, #0x118]
    56d0:      	str	x0, [x29, #0x1c8]
    56d4:      	ldr	x0, [x29, #0x1c8]
    56d8:      	cbz	x0, 0x570c <_stogir.floating.validate+0x188>
    56dc:      	mov	w0, #0x1                ; =1
    56e0:      	str	w0, [x29, #0x120]
    56e4:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		00000000000056e4:  ARM64_RELOC_PAGE21	l_cstr.124
    56e8:      	add	x0, x0, #0x0
		00000000000056e8:  ARM64_RELOC_PAGEOFF12	l_cstr.124
    56ec:      	str	x0, [x29, #0x140]
    56f0:      	mov	w0, #0x1c               ; =28
    56f4:      	str	x0, [x29, #0x148]
    56f8:      	ldr	q0, [x29, #0x140]
    56fc:      	mov	w16, #0x128             ; =296
    5700:      	str	q0, [x29, x16]
    5704:      	add	x21, x29, #0x120
    5708:      	b	0x5894 <_stogir.floating.validate+0x310>
    570c:      	ldrsw	x0, [x29, #0x104]
    5710:      	add	x8, x29, #0x150
    5714:      	mov	x9, x0
    5718:      	mov	x0, x20
    571c:      	mov	x1, x9
    5720:      	bl	0x5720 <_stogir.floating.validate+0x19c>
		0000000000005720:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    5724:      	ldr	w0, [x29, #0x150]
    5728:      	cmp	x0, #0x0
    572c:      	b.eq	0x5740 <_stogir.floating.validate+0x1bc>
    5730:      	cmp	x0, #0x1
    5734:      	b.eq	0x5774 <_stogir.floating.validate+0x1f0>
    5738:      	b	0x573c <_stogir.floating.validate+0x1b8>
    573c:      	b	0x58ac <_stogir.floating.validate+0x328>
    5740:      	mov	w0, #0x1                ; =1
    5744:      	str	w0, [x29, #0x180]
    5748:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		0000000000005748:  ARM64_RELOC_PAGE21	l_cstr.125
    574c:      	add	x0, x0, #0x0
		000000000000574c:  ARM64_RELOC_PAGEOFF12	l_cstr.125
    5750:      	str	x0, [x29, #0x1a0]
    5754:      	mov	w0, #0x18               ; =24
    5758:      	str	x0, [x29, #0x1a8]
    575c:      	ldr	q0, [x29, #0x1a0]
    5760:      	mov	w16, #0x188             ; =392
    5764:      	str	q0, [x29, x16]
    5768:      	add	x0, x29, #0x180
    576c:      	str	x0, [x29, #0x1c8]
    5770:      	b	0x5890 <_stogir.floating.validate+0x30c>
    5774:      	mov	w16, #0x158             ; =344
    5778:      	ldr	q0, [x29, x16]
    577c:      	str	q0, [x29, #0x1b0]
    5780:      	add	x0, x29, #0x1b0
    5784:      	bl	0x5784 <_stogir.floating.validate+0x200>
		0000000000005784:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    5788:      	ubfx	x0, x0, #0, #8
    578c:      	sxtw	x0, w0
    5790:      	mov	x9, x0
    5794:      	add	x0, x29, #0x100
    5798:      	str	x9, [x29, #0x118]
    579c:      	bl	0x579c <_stogir.floating.validate+0x218>
		000000000000579c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    57a0:      	ubfx	x0, x0, #0, #8
    57a4:      	sxtw	x0, w0
    57a8:      	str	w0, [x29, #0x1c0]
    57ac:      	mov	x0, x23
    57b0:      	bl	0x57b0 <_stogir.floating.validate+0x22c>
		00000000000057b0:  ARM64_RELOC_BRANCH26	_stogir.floating.comparison?
    57b4:      	cbz	x0, 0x57c4 <_stogir.floating.validate+0x240>
    57b8:      	mov	w0, #0x1                ; =1
    57bc:      	str	x0, [x29, #0x220]
    57c0:      	b	0x57cc <_stogir.floating.validate+0x248>
    57c4:      	ldr	x0, [x29, #0x118]
    57c8:      	str	x0, [x29, #0x220]
    57cc:      	ldr	x0, [x29, #0x220]
    57d0:      	str	w0, [x29, #0x1c4]
    57d4:      	ldrsw	x0, [x29, #0x1c0]
    57d8:      	ldrsw	x1, [x29, #0x1c4]
    57dc:      	cmp	x0, x1
    57e0:      	b.ne	0x57f0 <_stogir.floating.validate+0x26c>
    57e4:      	mov	w0, #0x0                ; =0
    57e8:      	str	x0, [x29, #0x220]
    57ec:      	b	0x57f8 <_stogir.floating.validate+0x274>
    57f0:      	mov	w0, #0x1                ; =1
    57f4:      	str	x0, [x29, #0x220]
    57f8:      	ldr	x0, [x29, #0x220]
    57fc:      	cbz	x0, 0x5834 <_stogir.floating.validate+0x2b0>
    5800:      	mov	w0, #0x1                ; =1
    5804:      	str	w0, [x29, #0x1d0]
    5808:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		0000000000005808:  ARM64_RELOC_PAGE21	l_cstr.126
    580c:      	add	x0, x0, #0x0
		000000000000580c:  ARM64_RELOC_PAGEOFF12	l_cstr.126
    5810:      	str	x0, [x29, #0x1f0]
    5814:      	mov	w0, #0x1d               ; =29
    5818:      	str	x0, [x29, #0x1f8]
    581c:      	ldr	q0, [x29, #0x1f0]
    5820:      	mov	w16, #0x1d8             ; =472
    5824:      	str	q0, [x29, x16]
    5828:      	add	x0, x29, #0x1d0
    582c:      	str	x0, [x29, #0x220]
    5830:      	b	0x5888 <_stogir.floating.validate+0x304>
    5834:      	ldrsw	x0, [x29, #0x104]
    5838:      	ldrsw	x1, [x29, #0x108]
    583c:      	cmp	x23, #0x1d
    5840:      	str	x0, [x29, #0x228]
    5844:      	str	x1, [x29, #0x230]
    5848:      	b.ne	0x5858 <_stogir.floating.validate+0x2d4>
    584c:      	ldrsw	x2, [x29, #0x10c]
    5850:      	str	x2, [x29, #0x238]
    5854:      	b	0x5860 <_stogir.floating.validate+0x2dc>
    5858:      	mov	w0, #0x0                ; =0
    585c:      	str	x0, [x29, #0x238]
    5860:      	add	x8, x29, #0x200
    5864:      	mov	x0, x20
    5868:      	mov	x1, x23
    586c:      	ldr	x2, [x29, #0x118]
    5870:      	ldr	x3, [x29, #0x228]
    5874:      	ldr	x4, [x29, #0x230]
    5878:      	ldr	x5, [x29, #0x238]
    587c:      	bl	0x587c <_stogir.floating.validate+0x2f8>
		000000000000587c:  ARM64_RELOC_BRANCH26	_stogir.floating.operands
    5880:      	add	x0, x29, #0x200
    5884:      	str	x0, [x29, #0x220]
    5888:      	ldr	x0, [x29, #0x220]
    588c:      	str	x0, [x29, #0x1c8]
    5890:      	ldr	x21, [x29, #0x1c8]
    5894:      	mov	x22, x21
    5898:      	ldr	q0, [x22]
    589c:      	str	q0, [x19]
    58a0:      	ldr	x0, [x22, #0x10]
    58a4:      	str	x0, [x19, #0x10]
    58a8:      	b	0x58b4 <_stogir.floating.validate+0x330>
    58ac:      	brk	#0x1
    58b0:      	brk	#0x1
    58b4:      	ldp	x19, x20, [sp, #0x10]
    58b8:      	ldp	x21, x22, [sp, #0x20]
    58bc:      	ldr	x23, [sp, #0x30]
    58c0:      	ldp	x29, x30, [sp]
    58c4:      	add	sp, sp, #0x240
    58c8:      	ret

00000000000058cc <_stogir.types.integer?>:
    58cc:      	sxtw	x2, w0
    58d0:      	cmp	x2, #0x1
    58d4:      	b.lt	0x58e8 <_stogir.types.integer?+0x1c>
    58d8:      	cmp	x2, #0xb
    58dc:      	cset	x0, le
    58e0:      	mov	x2, x0
    58e4:      	b	0x58ec <_stogir.types.integer?+0x20>
    58e8:      	mov	w2, #0x0                ; =0
    58ec:      	mov	x0, x2
    58f0:      	ret

00000000000058f4 <_stogir.integer-unary.valid-type?>:
    58f4:      	stp	x29, x30, [sp, #-0xe0]!
    58f8:      	mov	x29, sp
    58fc:      	stp	x19, x20, [sp, #0x10]
    5900:      	stp	x21, x22, [sp, #0x20]
    5904:      	str	x23, [sp, #0x30]
    5908:      	sxtw	x19, w0
    590c:      	sxtw	x20, w1
    5910:      	mov	x0, x19
    5914:      	bl	0x5914 <_stogir.integer-unary.valid-type?+0x20>
		0000000000005914:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.operation?
    5918:      	cbz	x0, 0x5a98 <_stogir.integer-unary.valid-type?+0x1a4>
    591c:      	mov	x0, x20
    5920:      	bl	0x5920 <_stogir.integer-unary.valid-type?+0x2c>
		0000000000005920:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    5924:      	cbz	x0, 0x5a8c <_stogir.integer-unary.valid-type?+0x198>
    5928:      	cmp	x19, #0x2d
    592c:      	b.ne	0x5938 <_stogir.integer-unary.valid-type?+0x44>
    5930:      	mov	w21, #0x1               ; =1
    5934:      	b	0x5a84 <_stogir.integer-unary.valid-type?+0x190>
    5938:      	str	w20, [x29, #0xa0]
    593c:      	mov	w0, #0x1                ; =1
    5940:      	str	w0, [x29, #0xa4]
    5944:      	ldrsw	x0, [x29, #0xa0]
    5948:      	ldrsw	x1, [x29, #0xa4]
    594c:      	cmp	x0, x1
    5950:      	b.ne	0x595c <_stogir.integer-unary.valid-type?+0x68>
    5954:      	mov	w22, #0x0               ; =0
    5958:      	b	0x5960 <_stogir.integer-unary.valid-type?+0x6c>
    595c:      	mov	w22, #0x1               ; =1
    5960:      	cbz	x22, 0x5a7c <_stogir.integer-unary.valid-type?+0x188>
    5964:      	cmp	x19, #0x1f
    5968:      	b.ne	0x599c <_stogir.integer-unary.valid-type?+0xa8>
    596c:      	str	w20, [x29, #0xa8]
    5970:      	mov	w0, #0x6                ; =6
    5974:      	str	w0, [x29, #0xac]
    5978:      	ldrsw	x0, [x29, #0xa8]
    597c:      	ldrsw	x1, [x29, #0xac]
    5980:      	cmp	x0, x1
    5984:      	b.ne	0x5990 <_stogir.integer-unary.valid-type?+0x9c>
    5988:      	mov	w22, #0x0               ; =0
    598c:      	b	0x5994 <_stogir.integer-unary.valid-type?+0xa0>
    5990:      	mov	w22, #0x1               ; =1
    5994:      	mov	x23, x22
    5998:      	b	0x5a74 <_stogir.integer-unary.valid-type?+0x180>
    599c:      	cmp	x19, #0x20
    59a0:      	b.ne	0x59b4 <_stogir.integer-unary.valid-type?+0xc0>
    59a4:      	mov	x0, x20
    59a8:      	bl	0x59a8 <_stogir.integer-unary.valid-type?+0xb4>
		00000000000059a8:  ARM64_RELOC_BRANCH26	_stogir.types.signed?
    59ac:      	mov	x22, x0
    59b0:      	b	0x5a70 <_stogir.integer-unary.valid-type?+0x17c>
    59b4:      	cmp	x19, #0x36
    59b8:      	b.ne	0x5a68 <_stogir.integer-unary.valid-type?+0x174>
    59bc:      	cmp	x20, #0x3
    59c0:      	b.ne	0x59cc <_stogir.integer-unary.valid-type?+0xd8>
    59c4:      	mov	w19, #0x1               ; =1
    59c8:      	b	0x5a60 <_stogir.integer-unary.valid-type?+0x16c>
    59cc:      	cmp	x20, #0x4
    59d0:      	b.ne	0x59e0 <_stogir.integer-unary.valid-type?+0xec>
    59d4:      	mov	w0, #0x1                ; =1
    59d8:      	str	x0, [x29, #0xb0]
    59dc:      	b	0x5a5c <_stogir.integer-unary.valid-type?+0x168>
    59e0:      	cmp	x20, #0x5
    59e4:      	b.ne	0x59f4 <_stogir.integer-unary.valid-type?+0x100>
    59e8:      	mov	w0, #0x1                ; =1
    59ec:      	str	x0, [x29, #0xb8]
    59f0:      	b	0x5a54 <_stogir.integer-unary.valid-type?+0x160>
    59f4:      	cmp	x20, #0x6
    59f8:      	b.ne	0x5a08 <_stogir.integer-unary.valid-type?+0x114>
    59fc:      	mov	w0, #0x1                ; =1
    5a00:      	str	x0, [x29, #0xc0]
    5a04:      	b	0x5a4c <_stogir.integer-unary.valid-type?+0x158>
    5a08:      	cmp	x20, #0x9
    5a0c:      	b.ne	0x5a1c <_stogir.integer-unary.valid-type?+0x128>
    5a10:      	mov	w0, #0x1                ; =1
    5a14:      	str	x0, [x29, #0xc8]
    5a18:      	b	0x5a44 <_stogir.integer-unary.valid-type?+0x150>
    5a1c:      	cmp	x20, #0xa
    5a20:      	b.ne	0x5a30 <_stogir.integer-unary.valid-type?+0x13c>
    5a24:      	mov	w0, #0x1                ; =1
    5a28:      	str	x0, [x29, #0xd0]
    5a2c:      	b	0x5a3c <_stogir.integer-unary.valid-type?+0x148>
    5a30:      	cmp	x20, #0xb
    5a34:      	cset	x0, eq
    5a38:      	str	x0, [x29, #0xd0]
    5a3c:      	ldr	x0, [x29, #0xd0]
    5a40:      	str	x0, [x29, #0xc8]
    5a44:      	ldr	x0, [x29, #0xc8]
    5a48:      	str	x0, [x29, #0xc0]
    5a4c:      	ldr	x0, [x29, #0xc0]
    5a50:      	str	x0, [x29, #0xb8]
    5a54:      	ldr	x0, [x29, #0xb8]
    5a58:      	str	x0, [x29, #0xb0]
    5a5c:      	ldr	x19, [x29, #0xb0]
    5a60:      	mov	x20, x19
    5a64:      	b	0x5a6c <_stogir.integer-unary.valid-type?+0x178>
    5a68:      	mov	w20, #0x1               ; =1
    5a6c:      	mov	x22, x20
    5a70:      	mov	x23, x22
    5a74:      	mov	x19, x23
    5a78:      	b	0x5a80 <_stogir.integer-unary.valid-type?+0x18c>
    5a7c:      	mov	w19, #0x0               ; =0
    5a80:      	mov	x21, x19
    5a84:      	mov	x19, x21
    5a88:      	b	0x5a90 <_stogir.integer-unary.valid-type?+0x19c>
    5a8c:      	mov	w19, #0x0               ; =0
    5a90:      	mov	x20, x19
    5a94:      	b	0x5a9c <_stogir.integer-unary.valid-type?+0x1a8>
    5a98:      	mov	w20, #0x0               ; =0
    5a9c:      	mov	x0, x20
    5aa0:      	ldp	x19, x20, [sp, #0x10]
    5aa4:      	ldp	x21, x22, [sp, #0x20]
    5aa8:      	ldr	x23, [sp, #0x30]
    5aac:      	ldp	x29, x30, [sp], #0xe0
    5ab0:      	ret

0000000000005ab4 <_stogir.integer-binary.valid-type?>:
    5ab4:      	stp	x29, x30, [sp, #-0xb0]!
    5ab8:      	mov	x29, sp
    5abc:      	stp	x19, x20, [sp, #0x10]
    5ac0:      	stp	x21, x22, [sp, #0x20]
    5ac4:      	sxtw	x19, w0
    5ac8:      	sxtw	x20, w1
    5acc:      	mov	x0, x19
    5ad0:      	bl	0x5ad0 <_stogir.integer-binary.valid-type?+0x1c>
		0000000000005ad0:  ARM64_RELOC_BRANCH26	_stogir.integer-binary.operation?
    5ad4:      	cbz	x0, 0x5b64 <_stogir.integer-binary.valid-type?+0xb0>
    5ad8:      	mov	x0, x20
    5adc:      	bl	0x5adc <_stogir.integer-binary.valid-type?+0x28>
		0000000000005adc:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    5ae0:      	cbz	x0, 0x5b58 <_stogir.integer-binary.valid-type?+0xa4>
    5ae4:      	str	w20, [x29, #0xa0]
    5ae8:      	mov	w0, #0x1                ; =1
    5aec:      	str	w0, [x29, #0xa4]
    5af0:      	ldrsw	x0, [x29, #0xa0]
    5af4:      	ldrsw	x1, [x29, #0xa4]
    5af8:      	cmp	x0, x1
    5afc:      	b.ne	0x5b08 <_stogir.integer-binary.valid-type?+0x54>
    5b00:      	mov	w20, #0x0               ; =0
    5b04:      	b	0x5b0c <_stogir.integer-binary.valid-type?+0x58>
    5b08:      	mov	w20, #0x1               ; =1
    5b0c:      	cbz	x20, 0x5b18 <_stogir.integer-binary.valid-type?+0x64>
    5b10:      	mov	w20, #0x1               ; =1
    5b14:      	b	0x5b50 <_stogir.integer-binary.valid-type?+0x9c>
    5b18:      	mov	x0, x19
    5b1c:      	bl	0x5b1c <_stogir.integer-binary.valid-type?+0x68>
		0000000000005b1c:  ARM64_RELOC_BRANCH26	_stogir.integer-binary.logical?
    5b20:      	cbz	x0, 0x5b2c <_stogir.integer-binary.valid-type?+0x78>
    5b24:      	mov	w21, #0x1               ; =1
    5b28:      	b	0x5b4c <_stogir.integer-binary.valid-type?+0x98>
    5b2c:      	cmp	x19, #0x3a
    5b30:      	b.ne	0x5b3c <_stogir.integer-binary.valid-type?+0x88>
    5b34:      	mov	w22, #0x1               ; =1
    5b38:      	b	0x5b48 <_stogir.integer-binary.valid-type?+0x94>
    5b3c:      	cmp	x19, #0x3b
    5b40:      	cset	x0, eq
    5b44:      	mov	x22, x0
    5b48:      	mov	x21, x22
    5b4c:      	mov	x20, x21
    5b50:      	mov	x19, x20
    5b54:      	b	0x5b5c <_stogir.integer-binary.valid-type?+0xa8>
    5b58:      	mov	w19, #0x0               ; =0
    5b5c:      	mov	x20, x19
    5b60:      	b	0x5b68 <_stogir.integer-binary.valid-type?+0xb4>
    5b64:      	mov	w20, #0x0               ; =0
    5b68:      	mov	x0, x20
    5b6c:      	ldp	x19, x20, [sp, #0x10]
    5b70:      	ldp	x21, x22, [sp, #0x20]
    5b74:      	ldp	x29, x30, [sp], #0xb0
    5b78:      	ret

0000000000005b7c <_coil.core.Len$slice$len__u8>:
    5b7c:      	stp	x29, x30, [sp, #-0xb0]!
    5b80:      	mov	x29, sp
    5b84:      	str	x0, [x29, #0xa0]
    5b88:      	str	x1, [x29, #0xa8]
    5b8c:      	ldr	x0, [x29, #0xa8]
    5b90:      	ldp	x29, x30, [sp], #0xb0
    5b94:      	ret

0000000000005b98 <_inherent$slice$data__u8>:
    5b98:      	stp	x29, x30, [sp, #-0xb0]!
    5b9c:      	mov	x29, sp
    5ba0:      	str	x0, [x29, #0xa0]
    5ba4:      	str	x1, [x29, #0xa8]
    5ba8:      	ldr	x0, [x29, #0xa0]
    5bac:      	ldp	x29, x30, [sp], #0xb0
    5bb0:      	ret

0000000000005bb4 <_coil.mem.eql__u8>:
    5bb4:      	stp	x29, x30, [sp, #-0xa0]!
    5bb8:      	mov	x29, sp
    5bbc:      	stp	x19, x20, [sp, #0x10]
    5bc0:      	stp	x21, x22, [sp, #0x20]
    5bc4:      	mov	x19, x0
    5bc8:      	mov	x20, x1
    5bcc:      	mov	x21, x2
    5bd0:      	cmp	x21, #0x0
    5bd4:      	b.ne	0x5be0 <_coil.mem.eql__u8+0x2c>
    5bd8:      	mov	w22, #0x1               ; =1
    5bdc:      	b	0x5c08 <_coil.mem.eql__u8+0x54>
    5be0:      	mov	w0, #0x1                ; =1
    5be4:      	mul	x21, x21, x0
    5be8:      	mov	x0, x19
    5bec:      	mov	x1, x20
    5bf0:      	mov	x2, x21
    5bf4:      	bl	0x5bf4 <_coil.mem.eql__u8+0x40>
		0000000000005bf4:  ARM64_RELOC_BRANCH26	_memcmp
    5bf8:      	sxtw	x0, w0
    5bfc:      	cmp	x0, #0x0
    5c00:      	cset	x0, eq
    5c04:      	mov	x22, x0
    5c08:      	mov	x0, x22
    5c0c:      	ldp	x19, x20, [sp, #0x10]
    5c10:      	ldp	x21, x22, [sp, #0x20]
    5c14:      	ldp	x29, x30, [sp], #0xa0
    5c18:      	ret

0000000000005c1c <_stogir.opcode.count>:
    5c1c:      	mov	w0, #0x83               ; =131
    5c20:      	ret

0000000000005c24 <_stogir.types.valid-scalar?>:
    5c24:      	sxtw	x2, w0
    5c28:      	cmp	x2, #0x0
    5c2c:      	b.lt	0x5c40 <_stogir.types.valid-scalar?+0x1c>
    5c30:      	cmp	x2, #0xd
    5c34:      	cset	x0, le
    5c38:      	mov	x2, x0
    5c3c:      	b	0x5c44 <_stogir.types.valid-scalar?+0x20>
    5c40:      	mov	w2, #0x0                ; =0
    5c44:      	mov	x0, x2
    5c48:      	ret

0000000000005c4c <_stogir.types.vector?>:
    5c4c:      	sxtw	x2, w0
    5c50:      	cmp	x2, #0xf
    5c54:      	b.le	0x5ca0 <_stogir.types.vector?+0x54>
    5c58:      	cmp	x2, #0x80
    5c5c:      	b.ge	0x5c94 <_stogir.types.vector?+0x48>
    5c60:      	and	x0, x2, #0xf
    5c64:      	sxtw	x0, w0
    5c68:      	cmp	x0, #0x1
    5c6c:      	b.lt	0x5c88 <_stogir.types.vector?+0x3c>
    5c70:      	and	x2, x2, #0xf
    5c74:      	sxtw	x2, w2
    5c78:      	cmp	x2, #0xd
    5c7c:      	cset	x0, le
    5c80:      	mov	x2, x0
    5c84:      	b	0x5c8c <_stogir.types.vector?+0x40>
    5c88:      	mov	w2, #0x0                ; =0
    5c8c:      	mov	x3, x2
    5c90:      	b	0x5c98 <_stogir.types.vector?+0x4c>
    5c94:      	mov	w3, #0x0                ; =0
    5c98:      	mov	x2, x3
    5c9c:      	b	0x5ca4 <_stogir.types.vector?+0x58>
    5ca0:      	mov	w2, #0x0                ; =0
    5ca4:      	mov	x0, x2
    5ca8:      	ret

0000000000005cac <_coil.core.Get$slice$get__i8>:
    5cac:      	stp	x29, x30, [sp, #-0xc0]!
    5cb0:      	mov	x29, sp
    5cb4:      	str	x0, [x29, #0xa0]
    5cb8:      	str	x1, [x29, #0xa8]
    5cbc:      	ldr	x0, [x29, #0xa0]
    5cc0:      	ldr	x1, [x29, #0xa8]
    5cc4:      	str	x2, [x29, #0xb0]
    5cc8:      	bl	0x5cc8 <_coil.core.Get$slice$get__i8+0x1c>
		0000000000005cc8:  ARM64_RELOC_BRANCH26	_inherent$slice$data__i8
    5ccc:      	ldr	x1, [x29, #0xb0]
    5cd0:      	add	x0, x0, x1
    5cd4:      	ldrsb	x0, [x0]
    5cd8:      	ldp	x29, x30, [sp], #0xc0
    5cdc:      	ret

0000000000005ce0 <_stogir.opcode.metadata>:
    5ce0:      	stp	x29, x30, [sp, #-0xb0]!
    5ce4:      	mov	x29, sp
    5ce8:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		0000000000005ce8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    5cec:      	add	x0, x0, #0x0
		0000000000005cec:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    5cf0:      	str	x0, [x29, #0xa0]
    5cf4:      	mov	w0, #0x83               ; =131
    5cf8:      	str	x0, [x29, #0xa8]
    5cfc:      	ldr	x0, [x29, #0xa0]
    5d00:      	ldr	x1, [x29, #0xa8]
    5d04:      	ldp	x29, x30, [sp], #0xb0
    5d08:      	ret

0000000000005d0c <_coil.core.Get$slice$get__u32>:
    5d0c:      	stp	x29, x30, [sp, #-0xc0]!
    5d10:      	mov	x29, sp
    5d14:      	str	x0, [x29, #0xa0]
    5d18:      	str	x1, [x29, #0xa8]
    5d1c:      	ldr	x0, [x29, #0xa0]
    5d20:      	ldr	x1, [x29, #0xa8]
    5d24:      	str	x2, [x29, #0xb0]
    5d28:      	bl	0x5d28 <_coil.core.Get$slice$get__u32+0x1c>
		0000000000005d28:  ARM64_RELOC_BRANCH26	_inherent$slice$data__u32
    5d2c:      	ldr	x1, [x29, #0xb0]
    5d30:      	add	x0, x0, x1, lsl #2
    5d34:      	ldr	w0, [x0]
    5d38:      	ldp	x29, x30, [sp], #0xc0
    5d3c:      	ret

0000000000005d40 <_inherent$coil.arraylist.ArrayList$at__stogir.node.Node>:
    5d40:      	stp	x29, x30, [sp, #-0xc0]!
    5d44:      	mov	x29, sp
    5d48:      	str	x1, [x29, #0xb0]
    5d4c:      	bl	0x5d4c <_inherent$coil.arraylist.ArrayList$at__stogir.node.Node+0xc>
		0000000000005d4c:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$slice__stogir.node.Node
    5d50:      	str	x0, [x29, #0xa0]
    5d54:      	str	x1, [x29, #0xa8]
    5d58:      	ldr	x0, [x29, #0xa0]
    5d5c:      	ldr	x1, [x29, #0xa8]
    5d60:      	ldr	x2, [x29, #0xb0]
    5d64:      	bl	0x5d64 <_inherent$coil.arraylist.ArrayList$at__stogir.node.Node+0x24>
		0000000000005d64:  ARM64_RELOC_BRANCH26	_inherent$slice$at__stogir.node.Node
    5d68:      	ldp	x29, x30, [sp], #0xc0
    5d6c:      	ret

0000000000005d70 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.strings.Entry>:
    5d70:      	ldr	x0, [x0, #0x8]
    5d74:      	ret

0000000000005d78 <_coil.core.Len$coil.arraylist.ArrayList$len__u8>:
    5d78:      	ldr	x0, [x0, #0x8]
    5d7c:      	ret

0000000000005d80 <_inherent$coil.arraylist.ArrayList$slice__u8>:
    5d80:      	stp	x29, x30, [sp, #-0xb0]!
    5d84:      	mov	x29, sp
    5d88:      	ldr	x1, [x0]
    5d8c:      	ldr	x0, [x0, #0x8]
    5d90:      	mov	x9, x0
    5d94:      	mov	x0, x1
    5d98:      	mov	x1, x9
    5d9c:      	bl	0x5d9c <_inherent$coil.arraylist.ArrayList$slice__u8+0x1c>
		0000000000005d9c:  ARM64_RELOC_BRANCH26	_inherent$slice$new__u8
    5da0:      	str	x0, [x29, #0xa0]
    5da4:      	str	x1, [x29, #0xa8]
    5da8:      	ldr	x0, [x29, #0xa0]
    5dac:      	ldr	x1, [x29, #0xa8]
    5db0:      	ldp	x29, x30, [sp], #0xb0
    5db4:      	ret

0000000000005db8 <_coil.slice.subslice__u8>:
    5db8:      	stp	x29, x30, [sp, #-0xd0]!
    5dbc:      	mov	x29, sp
    5dc0:      	str	x0, [x29, #0xa0]
    5dc4:      	str	x1, [x29, #0xa8]
    5dc8:      	ldr	x0, [x29, #0xa0]
    5dcc:      	ldr	x1, [x29, #0xa8]
    5dd0:      	str	x2, [x29, #0xc0]
    5dd4:      	str	x3, [x29, #0xc8]
    5dd8:      	bl	0x5dd8 <_coil.slice.subslice__u8+0x20>
		0000000000005dd8:  ARM64_RELOC_BRANCH26	_inherent$slice$data__u8
    5ddc:      	ldr	x1, [x29, #0xc0]
    5de0:      	add	x0, x0, x1
    5de4:      	ldr	x2, [x29, #0xc8]
    5de8:      	sub	x2, x2, x1
    5dec:      	mov	x1, x2
    5df0:      	bl	0x5df0 <_coil.slice.subslice__u8+0x38>
		0000000000005df0:  ARM64_RELOC_BRANCH26	_inherent$slice$new__u8
    5df4:      	str	x0, [x29, #0xb0]
    5df8:      	str	x1, [x29, #0xb8]
    5dfc:      	ldr	x0, [x29, #0xb0]
    5e00:      	ldr	x1, [x29, #0xb8]
    5e04:      	ldp	x29, x30, [sp], #0xd0
    5e08:      	ret

0000000000005e0c <_stogir.floating.operation?>:
    5e0c:      	stp	x29, x30, [sp, #-0xa0]!
    5e10:      	mov	x29, sp
    5e14:      	stp	x19, x20, [sp, #0x10]
    5e18:      	stp	x21, x22, [sp, #0x20]
    5e1c:      	str	x23, [sp, #0x30]
    5e20:      	sxtw	x19, w0
    5e24:      	mov	x0, x19
    5e28:      	bl	0x5e28 <_stogir.floating.operation?+0x1c>
		0000000000005e28:  ARM64_RELOC_BRANCH26	_stogir.floating.comparison?
    5e2c:      	cbz	x0, 0x5e38 <_stogir.floating.operation?+0x2c>
    5e30:      	mov	w20, #0x1               ; =1
    5e34:      	b	0x5e9c <_stogir.floating.operation?+0x90>
    5e38:      	mov	x0, x19
    5e3c:      	bl	0x5e3c <_stogir.floating.operation?+0x30>
		0000000000005e3c:  ARM64_RELOC_BRANCH26	_stogir.floating.unary?
    5e40:      	cbz	x0, 0x5e4c <_stogir.floating.operation?+0x40>
    5e44:      	mov	w21, #0x1               ; =1
    5e48:      	b	0x5e98 <_stogir.floating.operation?+0x8c>
    5e4c:      	cmp	x19, #0x1a
    5e50:      	b.lt	0x5e64 <_stogir.floating.operation?+0x58>
    5e54:      	cmp	x19, #0x1d
    5e58:      	cset	x0, le
    5e5c:      	mov	x22, x0
    5e60:      	b	0x5e68 <_stogir.floating.operation?+0x5c>
    5e64:      	mov	w22, #0x0               ; =0
    5e68:      	cbz	x22, 0x5e74 <_stogir.floating.operation?+0x68>
    5e6c:      	mov	w22, #0x1               ; =1
    5e70:      	b	0x5e94 <_stogir.floating.operation?+0x88>
    5e74:      	cmp	x19, #0x3a
    5e78:      	b.ne	0x5e84 <_stogir.floating.operation?+0x78>
    5e7c:      	mov	w23, #0x1               ; =1
    5e80:      	b	0x5e90 <_stogir.floating.operation?+0x84>
    5e84:      	cmp	x19, #0x3b
    5e88:      	cset	x0, eq
    5e8c:      	mov	x23, x0
    5e90:      	mov	x22, x23
    5e94:      	mov	x21, x22
    5e98:      	mov	x20, x21
    5e9c:      	mov	x0, x20
    5ea0:      	ldp	x19, x20, [sp, #0x10]
    5ea4:      	ldp	x21, x22, [sp, #0x20]
    5ea8:      	ldr	x23, [sp, #0x30]
    5eac:      	ldp	x29, x30, [sp], #0xa0
    5eb0:      	ret

0000000000005eb4 <_stogir.types.floating?>:
    5eb4:      	sxtw	x2, w0
    5eb8:      	cmp	x2, #0xc
    5ebc:      	b.ne	0x5ec8 <_stogir.types.floating?+0x14>
    5ec0:      	mov	w3, #0x1                ; =1
    5ec4:      	b	0x5ed4 <_stogir.types.floating?+0x20>
    5ec8:      	cmp	x2, #0xd
    5ecc:      	cset	x0, eq
    5ed0:      	mov	x3, x0
    5ed4:      	mov	x0, x3
    5ed8:      	ret

0000000000005edc <_stogir.vector-lanes.validate>:
    5edc:      	stp	x29, x30, [sp, #-0x190]!
    5ee0:      	mov	x29, sp
    5ee4:      	stp	x19, x20, [sp, #0x10]
    5ee8:      	stp	x21, x22, [sp, #0x20]
    5eec:      	str	x23, [sp, #0x30]
    5ef0:      	mov	x19, x8
    5ef4:      	mov	x20, x0
    5ef8:      	sxtw	x21, w1
    5efc:      	sxtw	x22, w2
    5f00:      	add	x8, x29, #0xa0
    5f04:      	mov	x0, x20
    5f08:      	mov	x1, x21
    5f0c:      	bl	0x5f0c <_stogir.vector-lanes.validate+0x30>
		0000000000005f0c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    5f10:      	ldr	w0, [x29, #0xa0]
    5f14:      	cmp	x0, #0x0
    5f18:      	b.eq	0x5f2c <_stogir.vector-lanes.validate+0x50>
    5f1c:      	cmp	x0, #0x1
    5f20:      	b.eq	0x5f58 <_stogir.vector-lanes.validate+0x7c>
    5f24:      	b	0x5f28 <_stogir.vector-lanes.validate+0x4c>
    5f28:      	b	0x6108 <_stogir.vector-lanes.validate+0x22c>
    5f2c:      	mov	w0, #0x1                ; =1
    5f30:      	str	w0, [x29, #0xd0]
    5f34:      	adrp	x0, 0x5000 <_stogir.locals.validate+0x5dc>
		0000000000005f34:  ARM64_RELOC_PAGE21	l_cstr.127
    5f38:      	add	x0, x0, #0x0
		0000000000005f38:  ARM64_RELOC_PAGEOFF12	l_cstr.127
    5f3c:      	str	x0, [x29, #0xf0]
    5f40:      	mov	w0, #0x1f               ; =31
    5f44:      	str	x0, [x29, #0xf8]
    5f48:      	ldr	q0, [x29, #0xf0]
    5f4c:      	stur	q0, [x29, #0xd8]
    5f50:      	add	x23, x29, #0xd0
    5f54:      	b	0x60f4 <_stogir.vector-lanes.validate+0x218>
    5f58:      	ldur	q0, [x29, #0xa8]
    5f5c:      	str	q0, [x29, #0x100]
    5f60:      	add	x0, x29, #0x100
    5f64:      	bl	0x5f64 <_stogir.vector-lanes.validate+0x88>
		0000000000005f64:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    5f68:      	ubfx	x0, x0, #0, #8
    5f6c:      	sxtw	x0, w0
    5f70:      	cmp	x21, #0x0
    5f74:      	str	x0, [x29, #0x118]
    5f78:      	b.gt	0x5f88 <_stogir.vector-lanes.validate+0xac>
    5f7c:      	mov	w1, #0x1                ; =1
    5f80:      	str	x1, [x29, #0x170]
    5f84:      	b	0x6034 <_stogir.vector-lanes.validate+0x158>
    5f88:      	ldr	x0, [x29, #0x118]
    5f8c:      	bl	0x5f8c <_stogir.vector-lanes.validate+0xb0>
		0000000000005f8c:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operation?
    5f90:      	cbz	x0, 0x5fa0 <_stogir.vector-lanes.validate+0xc4>
    5f94:      	mov	w0, #0x0                ; =0
    5f98:      	str	x0, [x29, #0x178]
    5f9c:      	b	0x5fa8 <_stogir.vector-lanes.validate+0xcc>
    5fa0:      	mov	w0, #0x1                ; =1
    5fa4:      	str	x0, [x29, #0x178]
    5fa8:      	ldr	x0, [x29, #0x178]
    5fac:      	cbz	x0, 0x5fbc <_stogir.vector-lanes.validate+0xe0>
    5fb0:      	mov	w0, #0x1                ; =1
    5fb4:      	str	x0, [x29, #0x178]
    5fb8:      	b	0x602c <_stogir.vector-lanes.validate+0x150>
    5fbc:      	ldr	x0, [x20, #0x78]
    5fc0:      	add	x0, x0, x21, lsl #2
    5fc4:      	ldrsw	x0, [x0]
    5fc8:      	str	w0, [x29, #0x110]
    5fcc:      	ldr	x0, [x29, #0x118]
    5fd0:      	cmp	x0, #0x3d
    5fd4:      	b.ne	0x5fe0 <_stogir.vector-lanes.validate+0x104>
    5fd8:      	mov	w21, #0x2               ; =2
    5fdc:      	b	0x6004 <_stogir.vector-lanes.validate+0x128>
    5fe0:      	ldr	x0, [x29, #0x118]
    5fe4:      	cmp	x0, #0x3e
    5fe8:      	b.ne	0x5ff8 <_stogir.vector-lanes.validate+0x11c>
    5fec:      	mov	w1, #0x3                ; =3
    5ff0:      	str	x1, [x29, #0x180]
    5ff4:      	b	0x6000 <_stogir.vector-lanes.validate+0x124>
    5ff8:      	mov	w0, #0x1                ; =1
    5ffc:      	str	x0, [x29, #0x180]
    6000:      	ldr	x21, [x29, #0x180]
    6004:      	sxtw	x21, w21
    6008:      	str	w21, [x29, #0x114]
    600c:      	ldrsw	x0, [x29, #0x110]
    6010:      	ldrsw	x1, [x29, #0x114]
    6014:      	cmp	x0, x1
    6018:      	b.ne	0x6024 <_stogir.vector-lanes.validate+0x148>
    601c:      	mov	w21, #0x0               ; =0
    6020:      	b	0x6028 <_stogir.vector-lanes.validate+0x14c>
    6024:      	mov	w21, #0x1               ; =1
    6028:      	str	x21, [x29, #0x178]
    602c:      	ldr	x0, [x29, #0x178]
    6030:      	str	x0, [x29, #0x170]
    6034:      	ldr	x0, [x29, #0x170]
    6038:      	cbz	x0, 0x606c <_stogir.vector-lanes.validate+0x190>
    603c:      	mov	w0, #0x1                ; =1
    6040:      	str	w0, [x29, #0x120]
    6044:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006044:  ARM64_RELOC_PAGE21	l_cstr.128
    6048:      	add	x0, x0, #0x0
		0000000000006048:  ARM64_RELOC_PAGEOFF12	l_cstr.128
    604c:      	str	x0, [x29, #0x140]
    6050:      	mov	w0, #0x25               ; =37
    6054:      	str	x0, [x29, #0x148]
    6058:      	ldr	q0, [x29, #0x140]
    605c:      	mov	w16, #0x128             ; =296
    6060:      	str	q0, [x29, x16]
    6064:      	add	x21, x29, #0x120
    6068:      	b	0x60f0 <_stogir.vector-lanes.validate+0x214>
    606c:      	add	x0, x29, #0x100
    6070:      	bl	0x6070 <_stogir.vector-lanes.validate+0x194>
		0000000000006070:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    6074:      	ubfx	x0, x0, #0, #8
    6078:      	sxtw	x0, w0
    607c:      	ldrsw	x1, [x29, #0x104]
    6080:      	ldr	x2, [x29, #0x118]
    6084:      	cmp	x2, #0x3f
    6088:      	str	x0, [x29, #0x170]
    608c:      	str	x1, [x29, #0x178]
    6090:      	b.ne	0x60a0 <_stogir.vector-lanes.validate+0x1c4>
    6094:      	mov	w3, #0x0                ; =0
    6098:      	str	x3, [x29, #0x180]
    609c:      	b	0x60a8 <_stogir.vector-lanes.validate+0x1cc>
    60a0:      	ldrsw	x0, [x29, #0x108]
    60a4:      	str	x0, [x29, #0x180]
    60a8:      	ldr	x0, [x29, #0x118]
    60ac:      	cmp	x0, #0x3e
    60b0:      	b.ne	0x60c0 <_stogir.vector-lanes.validate+0x1e4>
    60b4:      	ldrsw	x1, [x29, #0x10c]
    60b8:      	str	x1, [x29, #0x188]
    60bc:      	b	0x60c8 <_stogir.vector-lanes.validate+0x1ec>
    60c0:      	mov	w0, #0x0                ; =0
    60c4:      	str	x0, [x29, #0x188]
    60c8:      	add	x8, x29, #0x150
    60cc:      	mov	x0, x20
    60d0:      	ldr	x1, [x29, #0x118]
    60d4:      	ldr	x2, [x29, #0x170]
    60d8:      	mov	x3, x22
    60dc:      	ldr	x4, [x29, #0x178]
    60e0:      	ldr	x5, [x29, #0x180]
    60e4:      	ldr	x6, [x29, #0x188]
    60e8:      	bl	0x60e8 <_stogir.vector-lanes.validate+0x20c>
		00000000000060e8:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operands
    60ec:      	add	x21, x29, #0x150
    60f0:      	mov	x23, x21
    60f4:      	ldr	q0, [x23]
    60f8:      	str	q0, [x19]
    60fc:      	ldr	x0, [x23, #0x10]
    6100:      	str	x0, [x19, #0x10]
    6104:      	b	0x610c <_stogir.vector-lanes.validate+0x230>
    6108:      	brk	#0x1
    610c:      	ldp	x19, x20, [sp, #0x10]
    6110:      	ldp	x21, x22, [sp, #0x20]
    6114:      	ldr	x23, [sp, #0x30]
    6118:      	ldp	x29, x30, [sp], #0x190
    611c:      	ret

0000000000006120 <_stogir.vector-comparison.node?>:
    6120:      	stp	x29, x30, [sp, #-0xe0]!
    6124:      	mov	x29, sp
    6128:      	stp	x19, x20, [sp, #0x10]
    612c:      	sxtw	x1, w1
    6130:      	add	x8, x29, #0xa0
    6134:      	bl	0x6134 <_stogir.vector-comparison.node?+0x14>
		0000000000006134:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    6138:      	ldr	w0, [x29, #0xa0]
    613c:      	cmp	x0, #0x0
    6140:      	b.eq	0x6154 <_stogir.vector-comparison.node?+0x34>
    6144:      	cmp	x0, #0x1
    6148:      	b.eq	0x615c <_stogir.vector-comparison.node?+0x3c>
    614c:      	b	0x6150 <_stogir.vector-comparison.node?+0x30>
    6150:      	b	0x61a8 <_stogir.vector-comparison.node?+0x88>
    6154:      	mov	w19, #0x0               ; =0
    6158:      	b	0x61a0 <_stogir.vector-comparison.node?+0x80>
    615c:      	ldur	q0, [x29, #0xa8]
    6160:      	str	q0, [x29, #0xd0]
    6164:      	add	x0, x29, #0xd0
    6168:      	bl	0x6168 <_stogir.vector-comparison.node?+0x48>
		0000000000006168:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    616c:      	ubfx	x0, x0, #0, #8
    6170:      	sxtw	x0, w0
    6174:      	bl	0x6174 <_stogir.vector-comparison.node?+0x54>
		0000000000006174:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.operation?
    6178:      	cbz	x0, 0x6198 <_stogir.vector-comparison.node?+0x78>
    617c:      	add	x0, x29, #0xd0
    6180:      	bl	0x6180 <_stogir.vector-comparison.node?+0x60>
		0000000000006180:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    6184:      	ubfx	x0, x0, #0, #8
    6188:      	sxtw	x0, w0
    618c:      	bl	0x618c <_stogir.vector-comparison.node?+0x6c>
		000000000000618c:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    6190:      	mov	x20, x0
    6194:      	b	0x619c <_stogir.vector-comparison.node?+0x7c>
    6198:      	mov	w20, #0x0               ; =0
    619c:      	mov	x19, x20
    61a0:      	mov	x0, x19
    61a4:      	b	0x61ac <_stogir.vector-comparison.node?+0x8c>
    61a8:      	brk	#0x1
    61ac:      	ldp	x19, x20, [sp, #0x10]
    61b0:      	ldp	x29, x30, [sp], #0xe0
    61b4:      	ret

00000000000061b8 <_stogir.vector-comparison.validate>:
    61b8:      	stp	x29, x30, [sp, #-0x180]!
    61bc:      	mov	x29, sp
    61c0:      	stp	x19, x20, [sp, #0x10]
    61c4:      	stp	x21, x22, [sp, #0x20]
    61c8:      	str	x23, [sp, #0x30]
    61cc:      	mov	x19, x8
    61d0:      	mov	x20, x0
    61d4:      	sxtw	x21, w1
    61d8:      	sxtw	x22, w2
    61dc:      	add	x8, x29, #0xa0
    61e0:      	mov	x0, x20
    61e4:      	mov	x1, x21
    61e8:      	bl	0x61e8 <_stogir.vector-comparison.validate+0x30>
		00000000000061e8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    61ec:      	ldr	w0, [x29, #0xa0]
    61f0:      	cmp	x0, #0x0
    61f4:      	b.eq	0x6208 <_stogir.vector-comparison.validate+0x50>
    61f8:      	cmp	x0, #0x1
    61fc:      	b.eq	0x6234 <_stogir.vector-comparison.validate+0x7c>
    6200:      	b	0x6204 <_stogir.vector-comparison.validate+0x4c>
    6204:      	b	0x6378 <_stogir.vector-comparison.validate+0x1c0>
    6208:      	mov	w0, #0x1                ; =1
    620c:      	str	w0, [x29, #0xd0]
    6210:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006210:  ARM64_RELOC_PAGE21	l_cstr.129
    6214:      	add	x0, x0, #0x0
		0000000000006214:  ARM64_RELOC_PAGEOFF12	l_cstr.129
    6218:      	str	x0, [x29, #0xf0]
    621c:      	mov	w0, #0x25               ; =37
    6220:      	str	x0, [x29, #0xf8]
    6224:      	ldr	q0, [x29, #0xf0]
    6228:      	stur	q0, [x29, #0xd8]
    622c:      	add	x23, x29, #0xd0
    6230:      	b	0x6364 <_stogir.vector-comparison.validate+0x1ac>
    6234:      	ldur	q0, [x29, #0xa8]
    6238:      	str	q0, [x29, #0x100]
    623c:      	cmp	x21, #0x0
    6240:      	b.gt	0x6250 <_stogir.vector-comparison.validate+0x98>
    6244:      	mov	w0, #0x1                ; =1
    6248:      	str	x0, [x29, #0x118]
    624c:      	b	0x62c8 <_stogir.vector-comparison.validate+0x110>
    6250:      	mov	x0, x20
    6254:      	mov	x1, x21
    6258:      	bl	0x6258 <_stogir.vector-comparison.validate+0xa0>
		0000000000006258:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.node?
    625c:      	cbz	x0, 0x626c <_stogir.vector-comparison.validate+0xb4>
    6260:      	mov	w0, #0x0                ; =0
    6264:      	str	x0, [x29, #0x170]
    6268:      	b	0x6274 <_stogir.vector-comparison.validate+0xbc>
    626c:      	mov	w0, #0x1                ; =1
    6270:      	str	x0, [x29, #0x170]
    6274:      	ldr	x0, [x29, #0x170]
    6278:      	cbz	x0, 0x6288 <_stogir.vector-comparison.validate+0xd0>
    627c:      	mov	w0, #0x1                ; =1
    6280:      	str	x0, [x29, #0x170]
    6284:      	b	0x62c0 <_stogir.vector-comparison.validate+0x108>
    6288:      	ldr	x0, [x20, #0x78]
    628c:      	add	x0, x0, x21, lsl #2
    6290:      	ldrsw	x0, [x0]
    6294:      	str	w0, [x29, #0x110]
    6298:      	mov	w0, #0x2                ; =2
    629c:      	str	w0, [x29, #0x114]
    62a0:      	ldrsw	x0, [x29, #0x110]
    62a4:      	ldrsw	x1, [x29, #0x114]
    62a8:      	cmp	x0, x1
    62ac:      	b.ne	0x62b8 <_stogir.vector-comparison.validate+0x100>
    62b0:      	mov	w21, #0x0               ; =0
    62b4:      	b	0x62bc <_stogir.vector-comparison.validate+0x104>
    62b8:      	mov	w21, #0x1               ; =1
    62bc:      	str	x21, [x29, #0x170]
    62c0:      	ldr	x0, [x29, #0x170]
    62c4:      	str	x0, [x29, #0x118]
    62c8:      	ldr	x0, [x29, #0x118]
    62cc:      	cbz	x0, 0x6300 <_stogir.vector-comparison.validate+0x148>
    62d0:      	mov	w0, #0x1                ; =1
    62d4:      	str	w0, [x29, #0x120]
    62d8:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		00000000000062d8:  ARM64_RELOC_PAGE21	l_cstr.130
    62dc:      	add	x0, x0, #0x0
		00000000000062dc:  ARM64_RELOC_PAGEOFF12	l_cstr.130
    62e0:      	str	x0, [x29, #0x140]
    62e4:      	mov	w0, #0x2b               ; =43
    62e8:      	str	x0, [x29, #0x148]
    62ec:      	ldr	q0, [x29, #0x140]
    62f0:      	mov	w16, #0x128             ; =296
    62f4:      	str	q0, [x29, x16]
    62f8:      	add	x21, x29, #0x120
    62fc:      	b	0x6360 <_stogir.vector-comparison.validate+0x1a8>
    6300:      	add	x0, x29, #0x100
    6304:      	bl	0x6304 <_stogir.vector-comparison.validate+0x14c>
		0000000000006304:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    6308:      	ubfx	x0, x0, #0, #8
    630c:      	sxtw	x0, w0
    6310:      	mov	x9, x0
    6314:      	add	x0, x29, #0x100
    6318:      	str	x9, [x29, #0x118]
    631c:      	bl	0x631c <_stogir.vector-comparison.validate+0x164>
		000000000000631c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    6320:      	ubfx	x0, x0, #0, #8
    6324:      	sxtw	x0, w0
    6328:      	ldrsw	x1, [x29, #0x104]
    632c:      	ldrsw	x2, [x29, #0x108]
    6330:      	add	x8, x29, #0x150
    6334:      	mov	x9, x0
    6338:      	mov	x0, x20
    633c:      	mov	x10, x1
    6340:      	ldr	x1, [x29, #0x118]
    6344:      	mov	x11, x2
    6348:      	mov	x2, x9
    634c:      	mov	x3, x22
    6350:      	mov	x4, x10
    6354:      	mov	x5, x11
    6358:      	bl	0x6358 <_stogir.vector-comparison.validate+0x1a0>
		0000000000006358:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.operands
    635c:      	add	x21, x29, #0x150
    6360:      	mov	x23, x21
    6364:      	ldr	q0, [x23]
    6368:      	str	q0, [x19]
    636c:      	ldr	x0, [x23, #0x10]
    6370:      	str	x0, [x19, #0x10]
    6374:      	b	0x637c <_stogir.vector-comparison.validate+0x1c4>
    6378:      	brk	#0x1
    637c:      	ldp	x19, x20, [sp, #0x10]
    6380:      	ldp	x21, x22, [sp, #0x20]
    6384:      	ldr	x23, [sp, #0x30]
    6388:      	ldp	x29, x30, [sp], #0x180
    638c:      	ret

0000000000006390 <_stogir.vector-arithmetic.node?>:
    6390:      	stp	x29, x30, [sp, #-0xe0]!
    6394:      	mov	x29, sp
    6398:      	stp	x19, x20, [sp, #0x10]
    639c:      	sxtw	x1, w1
    63a0:      	add	x8, x29, #0xa0
    63a4:      	bl	0x63a4 <_stogir.vector-arithmetic.node?+0x14>
		00000000000063a4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    63a8:      	ldr	w0, [x29, #0xa0]
    63ac:      	cmp	x0, #0x0
    63b0:      	b.eq	0x63c4 <_stogir.vector-arithmetic.node?+0x34>
    63b4:      	cmp	x0, #0x1
    63b8:      	b.eq	0x63cc <_stogir.vector-arithmetic.node?+0x3c>
    63bc:      	b	0x63c0 <_stogir.vector-arithmetic.node?+0x30>
    63c0:      	b	0x6418 <_stogir.vector-arithmetic.node?+0x88>
    63c4:      	mov	w19, #0x0               ; =0
    63c8:      	b	0x6410 <_stogir.vector-arithmetic.node?+0x80>
    63cc:      	ldur	q0, [x29, #0xa8]
    63d0:      	str	q0, [x29, #0xd0]
    63d4:      	add	x0, x29, #0xd0
    63d8:      	bl	0x63d8 <_stogir.vector-arithmetic.node?+0x48>
		00000000000063d8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    63dc:      	ubfx	x0, x0, #0, #8
    63e0:      	sxtw	x0, w0
    63e4:      	bl	0x63e4 <_stogir.vector-arithmetic.node?+0x54>
		00000000000063e4:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.operation?
    63e8:      	cbz	x0, 0x6408 <_stogir.vector-arithmetic.node?+0x78>
    63ec:      	add	x0, x29, #0xd0
    63f0:      	bl	0x63f0 <_stogir.vector-arithmetic.node?+0x60>
		00000000000063f0:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    63f4:      	ubfx	x0, x0, #0, #8
    63f8:      	sxtw	x0, w0
    63fc:      	bl	0x63fc <_stogir.vector-arithmetic.node?+0x6c>
		00000000000063fc:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    6400:      	mov	x20, x0
    6404:      	b	0x640c <_stogir.vector-arithmetic.node?+0x7c>
    6408:      	mov	w20, #0x0               ; =0
    640c:      	mov	x19, x20
    6410:      	mov	x0, x19
    6414:      	b	0x641c <_stogir.vector-arithmetic.node?+0x8c>
    6418:      	brk	#0x1
    641c:      	ldp	x19, x20, [sp, #0x10]
    6420:      	ldp	x29, x30, [sp], #0xe0
    6424:      	ret

0000000000006428 <_stogir.vector-arithmetic.validate>:
    6428:      	stp	x29, x30, [sp, #-0x190]!
    642c:      	mov	x29, sp
    6430:      	stp	x19, x20, [sp, #0x10]
    6434:      	stp	x21, x22, [sp, #0x20]
    6438:      	str	x23, [sp, #0x30]
    643c:      	mov	x19, x8
    6440:      	mov	x20, x0
    6444:      	sxtw	x21, w1
    6448:      	add	x8, x29, #0xa0
    644c:      	mov	x0, x20
    6450:      	mov	x1, x21
    6454:      	bl	0x6454 <_stogir.vector-arithmetic.validate+0x2c>
		0000000000006454:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    6458:      	ldr	w0, [x29, #0xa0]
    645c:      	cmp	x0, #0x0
    6460:      	b.eq	0x6474 <_stogir.vector-arithmetic.validate+0x4c>
    6464:      	cmp	x0, #0x1
    6468:      	b.eq	0x64a0 <_stogir.vector-arithmetic.validate+0x78>
    646c:      	b	0x6470 <_stogir.vector-arithmetic.validate+0x48>
    6470:      	b	0x666c <_stogir.vector-arithmetic.validate+0x244>
    6474:      	mov	w0, #0x1                ; =1
    6478:      	str	w0, [x29, #0xd0]
    647c:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		000000000000647c:  ARM64_RELOC_PAGE21	l_cstr.131
    6480:      	add	x0, x0, #0x0
		0000000000006480:  ARM64_RELOC_PAGEOFF12	l_cstr.131
    6484:      	str	x0, [x29, #0xf0]
    6488:      	mov	w0, #0x25               ; =37
    648c:      	str	x0, [x29, #0xf8]
    6490:      	ldr	q0, [x29, #0xf0]
    6494:      	stur	q0, [x29, #0xd8]
    6498:      	add	x22, x29, #0xd0
    649c:      	b	0x6658 <_stogir.vector-arithmetic.validate+0x230>
    64a0:      	ldur	q0, [x29, #0xa8]
    64a4:      	str	q0, [x29, #0x100]
    64a8:      	add	x0, x29, #0x100
    64ac:      	bl	0x64ac <_stogir.vector-arithmetic.validate+0x84>
		00000000000064ac:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    64b0:      	ubfx	x0, x0, #0, #8
    64b4:      	sxtw	x23, w0
    64b8:      	cmp	x21, #0x0
    64bc:      	b.gt	0x64cc <_stogir.vector-arithmetic.validate+0xa4>
    64c0:      	mov	w0, #0x1                ; =1
    64c4:      	str	x0, [x29, #0x118]
    64c8:      	b	0x6598 <_stogir.vector-arithmetic.validate+0x170>
    64cc:      	mov	x0, x20
    64d0:      	mov	x1, x21
    64d4:      	bl	0x64d4 <_stogir.vector-arithmetic.validate+0xac>
		00000000000064d4:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    64d8:      	cbz	x0, 0x64e8 <_stogir.vector-arithmetic.validate+0xc0>
    64dc:      	mov	w0, #0x0                ; =0
    64e0:      	str	x0, [x29, #0x170]
    64e4:      	b	0x64f0 <_stogir.vector-arithmetic.validate+0xc8>
    64e8:      	mov	w0, #0x1                ; =1
    64ec:      	str	x0, [x29, #0x170]
    64f0:      	ldr	x0, [x29, #0x170]
    64f4:      	cbz	x0, 0x6504 <_stogir.vector-arithmetic.validate+0xdc>
    64f8:      	mov	w0, #0x1                ; =1
    64fc:      	str	x0, [x29, #0x170]
    6500:      	b	0x6590 <_stogir.vector-arithmetic.validate+0x168>
    6504:      	ldr	x0, [x20, #0x78]
    6508:      	add	x0, x0, x21, lsl #2
    650c:      	ldrsw	x0, [x0]
    6510:      	str	w0, [x29, #0x110]
    6514:      	mov	x0, x23
    6518:      	bl	0x6518 <_stogir.vector-arithmetic.validate+0xf0>
		0000000000006518:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.unary?
    651c:      	cbz	x0, 0x6528 <_stogir.vector-arithmetic.validate+0x100>
    6520:      	mov	w21, #0x1               ; =1
    6524:      	b	0x6568 <_stogir.vector-arithmetic.validate+0x140>
    6528:      	cmp	x23, #0x1d
    652c:      	b.ne	0x653c <_stogir.vector-arithmetic.validate+0x114>
    6530:      	mov	w0, #0x1                ; =1
    6534:      	str	x0, [x29, #0x178]
    6538:      	b	0x6548 <_stogir.vector-arithmetic.validate+0x120>
    653c:      	cmp	x23, #0x1e
    6540:      	cset	x0, eq
    6544:      	str	x0, [x29, #0x178]
    6548:      	ldr	x0, [x29, #0x178]
    654c:      	cbz	x0, 0x655c <_stogir.vector-arithmetic.validate+0x134>
    6550:      	mov	w0, #0x3                ; =3
    6554:      	str	x0, [x29, #0x178]
    6558:      	b	0x6564 <_stogir.vector-arithmetic.validate+0x13c>
    655c:      	mov	w0, #0x2                ; =2
    6560:      	str	x0, [x29, #0x178]
    6564:      	ldr	x21, [x29, #0x178]
    6568:      	sxtw	x21, w21
    656c:      	str	w21, [x29, #0x114]
    6570:      	ldrsw	x0, [x29, #0x110]
    6574:      	ldrsw	x1, [x29, #0x114]
    6578:      	cmp	x0, x1
    657c:      	b.ne	0x6588 <_stogir.vector-arithmetic.validate+0x160>
    6580:      	mov	w21, #0x0               ; =0
    6584:      	b	0x658c <_stogir.vector-arithmetic.validate+0x164>
    6588:      	mov	w21, #0x1               ; =1
    658c:      	str	x21, [x29, #0x170]
    6590:      	ldr	x0, [x29, #0x170]
    6594:      	str	x0, [x29, #0x118]
    6598:      	ldr	x0, [x29, #0x118]
    659c:      	cbz	x0, 0x65d0 <_stogir.vector-arithmetic.validate+0x1a8>
    65a0:      	mov	w0, #0x1                ; =1
    65a4:      	str	w0, [x29, #0x120]
    65a8:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		00000000000065a8:  ARM64_RELOC_PAGE21	l_cstr.132
    65ac:      	add	x0, x0, #0x0
		00000000000065ac:  ARM64_RELOC_PAGEOFF12	l_cstr.132
    65b0:      	str	x0, [x29, #0x140]
    65b4:      	mov	w0, #0x2b               ; =43
    65b8:      	str	x0, [x29, #0x148]
    65bc:      	ldr	q0, [x29, #0x140]
    65c0:      	mov	w16, #0x128             ; =296
    65c4:      	str	q0, [x29, x16]
    65c8:      	add	x21, x29, #0x120
    65cc:      	b	0x6654 <_stogir.vector-arithmetic.validate+0x22c>
    65d0:      	add	x0, x29, #0x100
    65d4:      	bl	0x65d4 <_stogir.vector-arithmetic.validate+0x1ac>
		00000000000065d4:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    65d8:      	ubfx	x0, x0, #0, #8
    65dc:      	sxtw	x0, w0
    65e0:      	ldrsw	x1, [x29, #0x104]
    65e4:      	ldrsw	x2, [x29, #0x108]
    65e8:      	cmp	x23, #0x1d
    65ec:      	str	x0, [x29, #0x118]
    65f0:      	str	x1, [x29, #0x170]
    65f4:      	str	x2, [x29, #0x178]
    65f8:      	b.ne	0x6608 <_stogir.vector-arithmetic.validate+0x1e0>
    65fc:      	mov	w3, #0x1                ; =1
    6600:      	str	x3, [x29, #0x180]
    6604:      	b	0x6614 <_stogir.vector-arithmetic.validate+0x1ec>
    6608:      	cmp	x23, #0x1e
    660c:      	cset	x0, eq
    6610:      	str	x0, [x29, #0x180]
    6614:      	ldr	x0, [x29, #0x180]
    6618:      	cbz	x0, 0x6628 <_stogir.vector-arithmetic.validate+0x200>
    661c:      	ldrsw	x0, [x29, #0x10c]
    6620:      	str	x0, [x29, #0x180]
    6624:      	b	0x6630 <_stogir.vector-arithmetic.validate+0x208>
    6628:      	mov	w0, #0x0                ; =0
    662c:      	str	x0, [x29, #0x180]
    6630:      	add	x8, x29, #0x150
    6634:      	mov	x0, x20
    6638:      	mov	x1, x23
    663c:      	ldr	x2, [x29, #0x118]
    6640:      	ldr	x3, [x29, #0x170]
    6644:      	ldr	x4, [x29, #0x178]
    6648:      	ldr	x5, [x29, #0x180]
    664c:      	bl	0x664c <_stogir.vector-arithmetic.validate+0x224>
		000000000000664c:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.operands
    6650:      	add	x21, x29, #0x150
    6654:      	mov	x22, x21
    6658:      	ldr	q0, [x22]
    665c:      	str	q0, [x19]
    6660:      	ldr	x0, [x22, #0x10]
    6664:      	str	x0, [x19, #0x10]
    6668:      	b	0x6670 <_stogir.vector-arithmetic.validate+0x248>
    666c:      	brk	#0x1
    6670:      	ldp	x19, x20, [sp, #0x10]
    6674:      	ldp	x21, x22, [sp, #0x20]
    6678:      	ldr	x23, [sp, #0x30]
    667c:      	ldp	x29, x30, [sp], #0x190
    6680:      	ret

0000000000006684 <_stogir.vector.memory-inputs>:
    6684:      	sub	sp, sp, #0x260
    6688:      	stp	x29, x30, [sp]
    668c:      	mov	x29, sp
    6690:      	stp	x19, x20, [sp, #0x10]
    6694:      	stp	x21, x22, [sp, #0x20]
    6698:      	str	x23, [sp, #0x30]
    669c:      	mov	x19, x8
    66a0:      	mov	x20, x0
    66a4:      	sxtw	x21, w1
    66a8:      	sxtw	x22, w2
    66ac:      	sxtw	x23, w3
    66b0:      	sxtw	x4, w4
    66b4:      	mov	x0, x21
    66b8:      	str	x4, [x29, #0x1e8]
    66bc:      	bl	0x66bc <_stogir.vector.memory-inputs+0x38>
		00000000000066bc:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    66c0:      	cbz	x0, 0x66d0 <_stogir.vector.memory-inputs+0x4c>
    66c4:      	mov	w0, #0x0                ; =0
    66c8:      	str	x0, [x29, #0x240]
    66cc:      	b	0x66d8 <_stogir.vector.memory-inputs+0x54>
    66d0:      	mov	w0, #0x1                ; =1
    66d4:      	str	x0, [x29, #0x240]
    66d8:      	ldr	x0, [x29, #0x240]
    66dc:      	cbz	x0, 0x66ec <_stogir.vector.memory-inputs+0x68>
    66e0:      	mov	w0, #0x1                ; =1
    66e4:      	str	x0, [x29, #0x240]
    66e8:      	b	0x6708 <_stogir.vector.memory-inputs+0x84>
    66ec:      	mov	x0, x21
    66f0:      	mov	x1, x22
    66f4:      	bl	0x66f4 <_stogir.vector.memory-inputs+0x70>
		00000000000066f4:  ARM64_RELOC_BRANCH26	_stogir.types.size
    66f8:      	sxtw	x0, w0
    66fc:      	cmp	x0, #0x0
    6700:      	cset	x0, le
    6704:      	str	x0, [x29, #0x240]
    6708:      	ldr	x0, [x29, #0x240]
    670c:      	cbz	x0, 0x6740 <_stogir.vector.memory-inputs+0xbc>
    6710:      	mov	w0, #0x1                ; =1
    6714:      	str	w0, [x29, #0xa0]
    6718:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006718:  ARM64_RELOC_PAGE21	l_cstr.133
    671c:      	add	x0, x0, #0x0
		000000000000671c:  ARM64_RELOC_PAGEOFF12	l_cstr.133
    6720:      	str	x0, [x29, #0xc0]
    6724:      	mov	w0, #0x32               ; =50
    6728:      	str	x0, [x29, #0xc8]
    672c:      	ldr	q0, [x29, #0xc0]
    6730:      	stur	q0, [x29, #0xa8]
    6734:      	add	x0, x29, #0xa0
    6738:      	str	x0, [x29, #0x240]
    673c:      	b	0x69b0 <_stogir.vector.memory-inputs+0x32c>
    6740:      	add	x8, x29, #0xd0
    6744:      	mov	x0, x20
    6748:      	mov	x1, x23
    674c:      	bl	0x674c <_stogir.vector.memory-inputs+0xc8>
		000000000000674c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    6750:      	ldr	w0, [x29, #0xd0]
    6754:      	cmp	x0, #0x0
    6758:      	b.eq	0x676c <_stogir.vector.memory-inputs+0xe8>
    675c:      	cmp	x0, #0x1
    6760:      	b.eq	0x67a0 <_stogir.vector.memory-inputs+0x11c>
    6764:      	b	0x6768 <_stogir.vector.memory-inputs+0xe4>
    6768:      	b	0x69cc <_stogir.vector.memory-inputs+0x348>
    676c:      	mov	w0, #0x1                ; =1
    6770:      	str	w0, [x29, #0x100]
    6774:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006774:  ARM64_RELOC_PAGE21	l_cstr.134
    6778:      	add	x0, x0, #0x0
		0000000000006778:  ARM64_RELOC_PAGEOFF12	l_cstr.134
    677c:      	str	x0, [x29, #0x120]
    6780:      	mov	w0, #0x1d               ; =29
    6784:      	str	x0, [x29, #0x128]
    6788:      	ldr	q0, [x29, #0x120]
    678c:      	mov	w16, #0x108             ; =264
    6790:      	str	q0, [x29, x16]
    6794:      	add	x0, x29, #0x100
    6798:      	str	x0, [x29, #0x248]
    679c:      	b	0x69a8 <_stogir.vector.memory-inputs+0x324>
    67a0:      	ldur	q0, [x29, #0xd8]
    67a4:      	str	q0, [x29, #0x130]
    67a8:      	cmp	x23, #0x0
    67ac:      	b.gt	0x67b8 <_stogir.vector.memory-inputs+0x134>
    67b0:      	mov	w23, #0x1               ; =1
    67b4:      	b	0x6814 <_stogir.vector.memory-inputs+0x190>
    67b8:      	add	x0, x29, #0x130
    67bc:      	bl	0x67bc <_stogir.vector.memory-inputs+0x138>
		00000000000067bc:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    67c0:      	ubfx	x0, x0, #0, #8
    67c4:      	sxtw	x0, w0
    67c8:      	bl	0x67c8 <_stogir.vector.memory-inputs+0x144>
		00000000000067c8:  ARM64_RELOC_BRANCH26	_stogir.opcode.control?
    67cc:      	cbz	x0, 0x67dc <_stogir.vector.memory-inputs+0x158>
    67d0:      	mov	w0, #0x0                ; =0
    67d4:      	str	x0, [x29, #0x250]
    67d8:      	b	0x67e4 <_stogir.vector.memory-inputs+0x160>
    67dc:      	mov	w0, #0x1                ; =1
    67e0:      	str	x0, [x29, #0x250]
    67e4:      	ldr	x0, [x29, #0x250]
    67e8:      	cbz	x0, 0x67f8 <_stogir.vector.memory-inputs+0x174>
    67ec:      	mov	w0, #0x1                ; =1
    67f0:      	str	x0, [x29, #0x250]
    67f4:      	b	0x6810 <_stogir.vector.memory-inputs+0x18c>
    67f8:      	add	x0, x29, #0x130
    67fc:      	bl	0x67fc <_stogir.vector.memory-inputs+0x178>
		00000000000067fc:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    6800:      	ubfx	x0, x0, #0, #8
    6804:      	sxtw	x0, w0
    6808:      	bl	0x6808 <_stogir.vector.memory-inputs+0x184>
		0000000000006808:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-end?
    680c:      	str	x0, [x29, #0x250]
    6810:      	ldr	x23, [x29, #0x250]
    6814:      	cbz	x23, 0x6848 <_stogir.vector.memory-inputs+0x1c4>
    6818:      	mov	w0, #0x1                ; =1
    681c:      	str	w0, [x29, #0x140]
    6820:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006820:  ARM64_RELOC_PAGE21	l_cstr.135
    6824:      	add	x0, x0, #0x0
		0000000000006824:  ARM64_RELOC_PAGEOFF12	l_cstr.135
    6828:      	str	x0, [x29, #0x160]
    682c:      	mov	w0, #0x2c               ; =44
    6830:      	str	x0, [x29, #0x168]
    6834:      	ldr	q0, [x29, #0x160]
    6838:      	mov	w16, #0x148             ; =328
    683c:      	str	q0, [x29, x16]
    6840:      	add	x23, x29, #0x140
    6844:      	b	0x69a4 <_stogir.vector.memory-inputs+0x320>
    6848:      	add	x8, x29, #0x170
    684c:      	mov	x0, x20
    6850:      	ldr	x1, [x29, #0x1e8]
    6854:      	bl	0x6854 <_stogir.vector.memory-inputs+0x1d0>
		0000000000006854:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    6858:      	ldr	w0, [x29, #0x170]
    685c:      	cmp	x0, #0x0
    6860:      	b.eq	0x6874 <_stogir.vector.memory-inputs+0x1f0>
    6864:      	cmp	x0, #0x1
    6868:      	b.eq	0x68a4 <_stogir.vector.memory-inputs+0x220>
    686c:      	b	0x6870 <_stogir.vector.memory-inputs+0x1ec>
    6870:      	b	0x69c8 <_stogir.vector.memory-inputs+0x344>
    6874:      	mov	w0, #0x1                ; =1
    6878:      	str	w0, [x29, #0x1a0]
    687c:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		000000000000687c:  ARM64_RELOC_PAGE21	l_cstr.136
    6880:      	add	x0, x0, #0x0
		0000000000006880:  ARM64_RELOC_PAGEOFF12	l_cstr.136
    6884:      	str	x0, [x29, #0x1c0]
    6888:      	mov	w0, #0x1d               ; =29
    688c:      	str	x0, [x29, #0x1c8]
    6890:      	ldr	q0, [x29, #0x1c0]
    6894:      	mov	w16, #0x1a8             ; =424
    6898:      	str	q0, [x29, x16]
    689c:      	add	x20, x29, #0x1a0
    68a0:      	b	0x69a0 <_stogir.vector.memory-inputs+0x31c>
    68a4:      	mov	w16, #0x178             ; =376
    68a8:      	ldr	q0, [x29, x16]
    68ac:      	str	q0, [x29, #0x1d0]
    68b0:      	add	x0, x29, #0x1d0
    68b4:      	bl	0x68b4 <_stogir.vector.memory-inputs+0x230>
		00000000000068b4:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    68b8:      	ubfx	x0, x0, #0, #8
    68bc:      	strb	w0, [x29, #0x1e0]
    68c0:      	mov	w0, #0x6                ; =6
    68c4:      	strb	w0, [x29, #0x1e1]
    68c8:      	ldrb	w0, [x29, #0x1e0]
    68cc:      	ldrb	w1, [x29, #0x1e1]
    68d0:      	cmp	x0, x1
    68d4:      	b.ne	0x68e4 <_stogir.vector.memory-inputs+0x260>
    68d8:      	mov	w0, #0x0                ; =0
    68dc:      	str	x0, [x29, #0x1e8]
    68e0:      	b	0x68ec <_stogir.vector.memory-inputs+0x268>
    68e4:      	mov	w0, #0x1                ; =1
    68e8:      	str	x0, [x29, #0x1e8]
    68ec:      	ldr	x0, [x29, #0x1e8]
    68f0:      	cbz	x0, 0x6900 <_stogir.vector.memory-inputs+0x27c>
    68f4:      	mov	w0, #0x1                ; =1
    68f8:      	str	x0, [x29, #0x1e8]
    68fc:      	b	0x6940 <_stogir.vector.memory-inputs+0x2bc>
    6900:      	add	x0, x29, #0x1d0
    6904:      	bl	0x6904 <_stogir.vector.memory-inputs+0x280>
		0000000000006904:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    6908:      	ubfx	x0, x0, #0, #8
    690c:      	cmp	x0, #0x48
    6910:      	b.ne	0x6920 <_stogir.vector.memory-inputs+0x29c>
    6914:      	mov	w0, #0x1                ; =1
    6918:      	str	x0, [x29, #0x250]
    691c:      	b	0x6938 <_stogir.vector.memory-inputs+0x2b4>
    6920:      	add	x0, x29, #0x1d0
    6924:      	bl	0x6924 <_stogir.vector.memory-inputs+0x2a0>
		0000000000006924:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    6928:      	ubfx	x0, x0, #0, #8
    692c:      	cmp	x0, #0x46
    6930:      	cset	x0, eq
    6934:      	str	x0, [x29, #0x250]
    6938:      	ldr	x0, [x29, #0x250]
    693c:      	str	x0, [x29, #0x1e8]
    6940:      	ldr	x0, [x29, #0x1e8]
    6944:      	cbz	x0, 0x697c <_stogir.vector.memory-inputs+0x2f8>
    6948:      	mov	w0, #0x1                ; =1
    694c:      	str	w0, [x29, #0x1f0]
    6950:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006950:  ARM64_RELOC_PAGE21	l_cstr.137
    6954:      	add	x0, x0, #0x0
		0000000000006954:  ARM64_RELOC_PAGEOFF12	l_cstr.137
    6958:      	str	x0, [x29, #0x210]
    695c:      	mov	w0, #0x2b               ; =43
    6960:      	str	x0, [x29, #0x218]
    6964:      	ldr	q0, [x29, #0x210]
    6968:      	mov	w16, #0x1f8             ; =504
    696c:      	str	q0, [x29, x16]
    6970:      	add	x0, x29, #0x1f0
    6974:      	str	x0, [x29, #0x1e8]
    6978:      	b	0x699c <_stogir.vector.memory-inputs+0x318>
    697c:      	str	wzr, [x29, #0x220]
    6980:      	mov	x0, x21
    6984:      	mov	x1, x22
    6988:      	bl	0x6988 <_stogir.vector.memory-inputs+0x304>
		0000000000006988:  ARM64_RELOC_BRANCH26	_stogir.types.size
    698c:      	sxtw	x0, w0
    6990:      	str	w0, [x29, #0x228]
    6994:      	add	x0, x29, #0x220
    6998:      	str	x0, [x29, #0x1e8]
    699c:      	ldr	x20, [x29, #0x1e8]
    69a0:      	mov	x23, x20
    69a4:      	str	x23, [x29, #0x248]
    69a8:      	ldr	x0, [x29, #0x248]
    69ac:      	str	x0, [x29, #0x240]
    69b0:      	ldr	x0, [x29, #0x240]
    69b4:      	ldr	q0, [x0]
    69b8:      	str	q0, [x19]
    69bc:      	ldr	x1, [x0, #0x10]
    69c0:      	str	x1, [x19, #0x10]
    69c4:      	b	0x69d0 <_stogir.vector.memory-inputs+0x34c>
    69c8:      	brk	#0x1
    69cc:      	brk	#0x1
    69d0:      	ldp	x19, x20, [sp, #0x10]
    69d4:      	ldp	x21, x22, [sp, #0x20]
    69d8:      	ldr	x23, [sp, #0x30]
    69dc:      	ldp	x29, x30, [sp]
    69e0:      	add	sp, sp, #0x260
    69e4:      	ret

00000000000069e8 <_stogir.vector.store-inputs>:
    69e8:      	stp	x29, x30, [sp, #-0x140]!
    69ec:      	mov	x29, sp
    69f0:      	stp	x19, x20, [sp, #0x10]
    69f4:      	stp	x21, x22, [sp, #0x20]
    69f8:      	str	x23, [sp, #0x30]
    69fc:      	mov	x19, x8
    6a00:      	mov	x20, x0
    6a04:      	sxtw	x21, w1
    6a08:      	sxtw	x22, w2
    6a0c:      	sxtw	x23, w3
    6a10:      	sxtw	x4, w4
    6a14:      	add	x8, x29, #0xa0
    6a18:      	mov	x0, x20
    6a1c:      	mov	x1, x4
    6a20:      	bl	0x6a20 <_stogir.vector.store-inputs+0x38>
		0000000000006a20:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    6a24:      	ldr	w0, [x29, #0xa0]
    6a28:      	cmp	x0, #0x0
    6a2c:      	b.eq	0x6a40 <_stogir.vector.store-inputs+0x58>
    6a30:      	cmp	x0, #0x1
    6a34:      	b.eq	0x6a70 <_stogir.vector.store-inputs+0x88>
    6a38:      	b	0x6a3c <_stogir.vector.store-inputs+0x54>
    6a3c:      	b	0x6ac8 <_stogir.vector.store-inputs+0xe0>
    6a40:      	mov	w0, #0x1                ; =1
    6a44:      	str	w0, [x29, #0xd0]
    6a48:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006a48:  ARM64_RELOC_PAGE21	l_cstr.138
    6a4c:      	add	x0, x0, #0x0
		0000000000006a4c:  ARM64_RELOC_PAGEOFF12	l_cstr.138
    6a50:      	str	x0, [x29, #0xf0]
    6a54:      	mov	w0, #0x1a               ; =26
    6a58:      	str	x0, [x29, #0xf8]
    6a5c:      	ldr	q0, [x29, #0xf0]
    6a60:      	stur	q0, [x29, #0xd8]
    6a64:      	add	x0, x29, #0xd0
    6a68:      	str	x0, [x29, #0x130]
    6a6c:      	b	0x6ab0 <_stogir.vector.store-inputs+0xc8>
    6a70:      	ldur	q0, [x29, #0xa8]
    6a74:      	str	q0, [x29, #0x100]
    6a78:      	add	x0, x29, #0x100
    6a7c:      	bl	0x6a7c <_stogir.vector.store-inputs+0x94>
		0000000000006a7c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    6a80:      	ubfx	x0, x0, #0, #8
    6a84:      	sxtw	x0, w0
    6a88:      	add	x8, x29, #0x110
    6a8c:      	mov	x9, x0
    6a90:      	mov	x0, x20
    6a94:      	mov	x1, x9
    6a98:      	mov	x2, x21
    6a9c:      	mov	x3, x22
    6aa0:      	mov	x4, x23
    6aa4:      	bl	0x6aa4 <_stogir.vector.store-inputs+0xbc>
		0000000000006aa4:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    6aa8:      	add	x0, x29, #0x110
    6aac:      	str	x0, [x29, #0x130]
    6ab0:      	ldr	x0, [x29, #0x130]
    6ab4:      	ldr	q0, [x0]
    6ab8:      	str	q0, [x19]
    6abc:      	ldr	x1, [x0, #0x10]
    6ac0:      	str	x1, [x19, #0x10]
    6ac4:      	b	0x6acc <_stogir.vector.store-inputs+0xe4>
    6ac8:      	brk	#0x1
    6acc:      	ldp	x19, x20, [sp, #0x10]
    6ad0:      	ldp	x21, x22, [sp, #0x20]
    6ad4:      	ldr	x23, [sp, #0x30]
    6ad8:      	ldp	x29, x30, [sp], #0x140
    6adc:      	ret

0000000000006ae0 <_stogir.types.size>:
    6ae0:      	stp	x29, x30, [sp, #-0xa0]!
    6ae4:      	mov	x29, sp
    6ae8:      	stp	x19, x20, [sp, #0x10]
    6aec:      	stp	x21, x22, [sp, #0x20]
    6af0:      	sxtw	x19, w0
    6af4:      	sxtw	x20, w1
    6af8:      	mov	x0, x19
    6afc:      	bl	0x6afc <_stogir.types.size+0x1c>
		0000000000006afc:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    6b00:      	cbz	x0, 0x6b4c <_stogir.types.size+0x6c>
    6b04:      	mov	x0, x19
    6b08:      	bl	0x6b08 <_stogir.types.size+0x28>
		0000000000006b08:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    6b0c:      	sxtw	x0, w0
    6b10:      	mov	x1, x20
    6b14:      	bl	0x6b14 <_stogir.types.size+0x34>
		0000000000006b14:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    6b18:      	sxtw	x21, w0
    6b1c:      	cmp	x21, #0x0
    6b20:      	b.ge	0x6b2c <_stogir.types.size+0x4c>
    6b24:      	mov	x22, #-0x1              ; =-1
    6b28:      	b	0x6b44 <_stogir.types.size+0x64>
    6b2c:      	mov	x0, x19
    6b30:      	bl	0x6b30 <_stogir.types.size+0x50>
		0000000000006b30:  ARM64_RELOC_BRANCH26	_stogir.types.lanes
    6b34:      	sxtw	x0, w0
    6b38:      	mul	x21, x21, x0
    6b3c:      	sxtw	x21, w21
    6b40:      	mov	x22, x21
    6b44:      	mov	x0, x22
    6b48:      	b	0x6b58 <_stogir.types.size+0x78>
    6b4c:      	mov	x0, x19
    6b50:      	mov	x1, x20
    6b54:      	b	0x6b68 <_stogir.types.size+0x88>
    6b58:      	ldp	x19, x20, [sp, #0x10]
    6b5c:      	ldp	x21, x22, [sp, #0x20]
    6b60:      	ldp	x29, x30, [sp], #0xa0
    6b64:      	ret
    6b68:      	ldp	x19, x20, [sp, #0x10]
    6b6c:      	ldp	x21, x22, [sp, #0x20]
    6b70:      	ldp	x29, x30, [sp], #0xa0
    6b74:      	b	0x6b74 <_stogir.types.size+0x94>
		0000000000006b74:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size

0000000000006b78 <_stogir.opcode.properties>:
    6b78:      	stp	x29, x30, [sp, #-0xb0]!
    6b7c:      	mov	x29, sp
    6b80:      	str	x19, [sp, #0x10]
    6b84:      	sxtw	x19, w0
    6b88:      	mov	x0, x19
    6b8c:      	bl	0x6b8c <_stogir.opcode.properties+0x14>
		0000000000006b8c:  ARM64_RELOC_BRANCH26	_stogir.opcode.valid?
    6b90:      	cbz	x0, 0x6bc4 <_stogir.opcode.properties+0x4c>
    6b94:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006b94:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    6b98:      	add	x0, x0, #0x0
		0000000000006b98:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    6b9c:      	str	x0, [x29, #0xa0]
    6ba0:      	mov	w0, #0x83               ; =131
    6ba4:      	str	x0, [x29, #0xa8]
    6ba8:      	ldr	x0, [x29, #0xa0]
    6bac:      	ldr	x1, [x29, #0xa8]
    6bb0:      	mov	x2, x19
    6bb4:      	bl	0x6bb4 <_stogir.opcode.properties+0x3c>
		0000000000006bb4:  ARM64_RELOC_BRANCH26	_coil.core.Get$slice$get__u8
    6bb8:      	ubfx	x0, x0, #0, #8
    6bbc:      	mov	x19, x0
    6bc0:      	b	0x6bc8 <_stogir.opcode.properties+0x50>
    6bc4:      	mov	w19, #0x0               ; =0
    6bc8:      	mov	x0, x19
    6bcc:      	ldr	x19, [sp, #0x10]
    6bd0:      	ldp	x29, x30, [sp], #0xb0
    6bd4:      	ret

0000000000006bd8 <_stogir.checked.projection>:
    6bd8:      	stp	x29, x30, [sp, #-0x180]!
    6bdc:      	mov	x29, sp
    6be0:      	stp	x19, x20, [sp, #0x10]
    6be4:      	stp	x21, x22, [sp, #0x20]
    6be8:      	str	x23, [sp, #0x30]
    6bec:      	mov	x19, x8
    6bf0:      	mov	x20, x0
    6bf4:      	sxtw	x21, w1
    6bf8:      	add	x8, x29, #0xa0
    6bfc:      	mov	x0, x20
    6c00:      	mov	x1, x21
    6c04:      	bl	0x6c04 <_stogir.checked.projection+0x2c>
		0000000000006c04:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    6c08:      	ldr	w0, [x29, #0xa0]
    6c0c:      	cmp	x0, #0x0
    6c10:      	b.eq	0x6c24 <_stogir.checked.projection+0x4c>
    6c14:      	cmp	x0, #0x1
    6c18:      	b.eq	0x6c50 <_stogir.checked.projection+0x78>
    6c1c:      	b	0x6c20 <_stogir.checked.projection+0x48>
    6c20:      	b	0x6d28 <_stogir.checked.projection+0x150>
    6c24:      	mov	w0, #0x1                ; =1
    6c28:      	str	w0, [x29, #0xd0]
    6c2c:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006c2c:  ARM64_RELOC_PAGE21	l_cstr.139
    6c30:      	add	x0, x0, #0x0
		0000000000006c30:  ARM64_RELOC_PAGEOFF12	l_cstr.139
    6c34:      	str	x0, [x29, #0xf0]
    6c38:      	mov	w0, #0x17               ; =23
    6c3c:      	str	x0, [x29, #0xf8]
    6c40:      	ldr	q0, [x29, #0xf0]
    6c44:      	stur	q0, [x29, #0xd8]
    6c48:      	add	x22, x29, #0xd0
    6c4c:      	b	0x6d14 <_stogir.checked.projection+0x13c>
    6c50:      	ldur	q0, [x29, #0xa8]
    6c54:      	str	q0, [x29, #0x100]
    6c58:      	add	x0, x29, #0x100
    6c5c:      	bl	0x6c5c <_stogir.checked.projection+0x84>
		0000000000006c5c:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    6c60:      	ubfx	x0, x0, #0, #8
    6c64:      	sxtw	x0, w0
    6c68:      	bl	0x6c68 <_stogir.checked.projection+0x90>
		0000000000006c68:  ARM64_RELOC_BRANCH26	_stogir.checked.operation?
    6c6c:      	cbz	x0, 0x6c88 <_stogir.checked.projection+0xb0>
    6c70:      	add	x8, x29, #0x110
    6c74:      	mov	x0, x20
    6c78:      	mov	x1, x21
    6c7c:      	bl	0x6c7c <_stogir.checked.projection+0xa4>
		0000000000006c7c:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    6c80:      	add	x20, x29, #0x110
    6c84:      	b	0x6d10 <_stogir.checked.projection+0x138>
    6c88:      	add	x0, x29, #0x100
    6c8c:      	bl	0x6c8c <_stogir.checked.projection+0xb4>
		0000000000006c8c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    6c90:      	ubfx	x0, x0, #0, #8
    6c94:      	cmp	x0, #0x0
    6c98:      	b.ne	0x6ca4 <_stogir.checked.projection+0xcc>
    6c9c:      	mov	w21, #0x1               ; =1
    6ca0:      	b	0x6ccc <_stogir.checked.projection+0xf4>
    6ca4:      	add	x0, x29, #0x100
    6ca8:      	bl	0x6ca8 <_stogir.checked.projection+0xd0>
		0000000000006ca8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    6cac:      	ubfx	x0, x0, #0, #8
    6cb0:      	sxtw	x0, w0
    6cb4:      	bl	0x6cb4 <_stogir.checked.projection+0xdc>
		0000000000006cb4:  ARM64_RELOC_BRANCH26	_stogir.types.valid-scalar?
    6cb8:      	cbz	x0, 0x6cc4 <_stogir.checked.projection+0xec>
    6cbc:      	mov	w23, #0x0               ; =0
    6cc0:      	b	0x6cc8 <_stogir.checked.projection+0xf0>
    6cc4:      	mov	w23, #0x1               ; =1
    6cc8:      	mov	x21, x23
    6ccc:      	cbz	x21, 0x6d00 <_stogir.checked.projection+0x128>
    6cd0:      	mov	w0, #0x1                ; =1
    6cd4:      	str	w0, [x29, #0x130]
    6cd8:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006cd8:  ARM64_RELOC_PAGE21	l_cstr.140
    6cdc:      	add	x0, x0, #0x0
		0000000000006cdc:  ARM64_RELOC_PAGEOFF12	l_cstr.140
    6ce0:      	str	x0, [x29, #0x150]
    6ce4:      	mov	w0, #0x20               ; =32
    6ce8:      	str	x0, [x29, #0x158]
    6cec:      	ldr	q0, [x29, #0x150]
    6cf0:      	mov	w16, #0x138             ; =312
    6cf4:      	str	q0, [x29, x16]
    6cf8:      	add	x21, x29, #0x130
    6cfc:      	b	0x6d0c <_stogir.checked.projection+0x134>
    6d00:      	str	wzr, [x29, #0x160]
    6d04:      	str	wzr, [x29, #0x168]
    6d08:      	add	x21, x29, #0x160
    6d0c:      	mov	x20, x21
    6d10:      	mov	x22, x20
    6d14:      	ldr	q0, [x22]
    6d18:      	str	q0, [x19]
    6d1c:      	ldr	x0, [x22, #0x10]
    6d20:      	str	x0, [x19, #0x10]
    6d24:      	b	0x6d2c <_stogir.checked.projection+0x154>
    6d28:      	brk	#0x1
    6d2c:      	ldp	x19, x20, [sp, #0x10]
    6d30:      	ldp	x21, x22, [sp, #0x20]
    6d34:      	ldr	x23, [sp, #0x30]
    6d38:      	ldp	x29, x30, [sp], #0x180
    6d3c:      	ret

0000000000006d40 <_stogir.checked.operands>:
    6d40:      	sub	sp, sp, #0x250
    6d44:      	stp	x29, x30, [sp]
    6d48:      	mov	x29, sp
    6d4c:      	str	x19, [sp, #0x10]
    6d50:      	sxtw	x1, w1
    6d54:      	sxtw	x2, w2
    6d58:      	sxtw	x3, w3
    6d5c:      	sxtw	x4, w4
    6d60:      	adrp	x5, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006d60:  ARM64_RELOC_PAGE21	l_cstr.51
    6d64:      	add	x5, x5, #0x0
		0000000000006d64:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    6d68:      	str	x5, [x29, #0xb0]
    6d6c:      	str	xzr, [x29, #0xb8]
    6d70:      	ldr	q0, [x29, #0xb0]
    6d74:      	str	q0, [x29, #0xa0]
    6d78:      	mov	x9, x0
    6d7c:      	mov	x0, x1
    6d80:      	str	x2, [x29, #0x198]
    6d84:      	str	x3, [x29, #0x220]
    6d88:      	str	x4, [x29, #0x228]
    6d8c:      	str	x8, [x29, #0x230]
    6d90:      	str	x9, [x29, #0x238]
    6d94:      	bl	0x6d94 <_stogir.checked.operands+0x54>
		0000000000006d94:  ARM64_RELOC_BRANCH26	_stogir.checked.operation?
    6d98:      	cbz	x0, 0x6da8 <_stogir.checked.operands+0x68>
    6d9c:      	mov	w0, #0x0                ; =0
    6da0:      	str	x0, [x29, #0x240]
    6da4:      	b	0x6db0 <_stogir.checked.operands+0x70>
    6da8:      	mov	w0, #0x1                ; =1
    6dac:      	str	x0, [x29, #0x240]
    6db0:      	ldr	x0, [x29, #0x240]
    6db4:      	cbz	x0, 0x6dc4 <_stogir.checked.operands+0x84>
    6db8:      	mov	w0, #0x1                ; =1
    6dbc:      	str	x0, [x29, #0x240]
    6dc0:      	b	0x6dec <_stogir.checked.operands+0xac>
    6dc4:      	ldr	x0, [x29, #0x198]
    6dc8:      	bl	0x6dc8 <_stogir.checked.operands+0x88>
		0000000000006dc8:  ARM64_RELOC_BRANCH26	_stogir.checked.valid-type?
    6dcc:      	cbz	x0, 0x6ddc <_stogir.checked.operands+0x9c>
    6dd0:      	mov	w0, #0x0                ; =0
    6dd4:      	str	x0, [x29, #0x248]
    6dd8:      	b	0x6de4 <_stogir.checked.operands+0xa4>
    6ddc:      	mov	w0, #0x1                ; =1
    6de0:      	str	x0, [x29, #0x248]
    6de4:      	ldr	x0, [x29, #0x248]
    6de8:      	str	x0, [x29, #0x240]
    6dec:      	ldr	x0, [x29, #0x240]
    6df0:      	cbz	x0, 0x6e14 <_stogir.checked.operands+0xd4>
    6df4:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006df4:  ARM64_RELOC_PAGE21	l_cstr.141
    6df8:      	add	x0, x0, #0x0
		0000000000006df8:  ARM64_RELOC_PAGEOFF12	l_cstr.141
    6dfc:      	str	x0, [x29, #0xc0]
    6e00:      	mov	w0, #0x36               ; =54
    6e04:      	str	x0, [x29, #0xc8]
    6e08:      	ldr	q0, [x29, #0xc0]
    6e0c:      	str	q0, [x29, #0xa0]
    6e10:      	b	0x6e14 <_stogir.checked.operands+0xd4>
    6e14:      	ldr	x0, [x29, #0x220]
    6e18:      	str	w0, [x29, #0xf0]
    6e1c:      	ldr	x0, [x29, #0x228]
    6e20:      	str	w0, [x29, #0xf4]
    6e24:      	ldr	x0, [x29, #0xf0]
    6e28:      	str	x0, [x29, #0xf8]
    6e2c:      	add	x0, x29, #0xf8
    6e30:      	str	x0, [x29, #0x100]
    6e34:      	mov	w1, #0x2                ; =2
    6e38:      	str	x1, [x29, #0x108]
    6e3c:      	ldr	x1, [x29, #0x100]
    6e40:      	ldr	x2, [x29, #0x108]
    6e44:      	add	x8, x29, #0x110
    6e48:      	mov	x9, x0
    6e4c:      	mov	x0, x1
    6e50:      	mov	x1, x2
    6e54:      	bl	0x6e54 <_stogir.checked.operands+0x114>
		0000000000006e54:  ARM64_RELOC_BRANCH26	_coil.core.Iterable$slice$iter__i32
    6e58:      	ldr	q0, [x29, #0x110]
    6e5c:      	str	q0, [x29, #0xd0]
    6e60:      	ldr	x0, [x29, #0x120]
    6e64:      	str	x0, [x29, #0xe0]
    6e68:      	add	x0, x29, #0xd0
    6e6c:      	bl	0x6e6c <_stogir.checked.operands+0x12c>
		0000000000006e6c:  ARM64_RELOC_BRANCH26	_coil.core.Iterator$coil.slice.SliceIter$next__i32
    6e70:      	str	x0, [x29, #0x130]
    6e74:      	str	x1, [x29, #0x138]
    6e78:      	ldr	w0, [x29, #0x130]
    6e7c:      	cmp	x0, #0x0
    6e80:      	b.eq	0x6f54 <_stogir.checked.operands+0x214>
    6e84:      	cmp	x0, #0x1
    6e88:      	b.eq	0x6e94 <_stogir.checked.operands+0x154>
    6e8c:      	b	0x6e90 <_stogir.checked.operands+0x150>
    6e90:      	b	0x6fe0 <_stogir.checked.operands+0x2a0>
    6e94:      	ldrsw	x0, [x29, #0x138]
    6e98:      	add	x8, x29, #0x140
    6e9c:      	mov	x9, x0
    6ea0:      	ldr	x0, [x29, #0x238]
    6ea4:      	mov	x1, x9
    6ea8:      	bl	0x6ea8 <_stogir.checked.operands+0x168>
		0000000000006ea8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    6eac:      	ldr	w0, [x29, #0x140]
    6eb0:      	cmp	x0, #0x0
    6eb4:      	b.eq	0x6ec8 <_stogir.checked.operands+0x188>
    6eb8:      	cmp	x0, #0x1
    6ebc:      	b.eq	0x6ee8 <_stogir.checked.operands+0x1a8>
    6ec0:      	b	0x6ec4 <_stogir.checked.operands+0x184>
    6ec4:      	b	0x6fdc <_stogir.checked.operands+0x29c>
    6ec8:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006ec8:  ARM64_RELOC_PAGE21	l_cstr.142
    6ecc:      	add	x0, x0, #0x0
		0000000000006ecc:  ARM64_RELOC_PAGEOFF12	l_cstr.142
    6ed0:      	str	x0, [x29, #0x170]
    6ed4:      	mov	w0, #0x22               ; =34
    6ed8:      	str	x0, [x29, #0x178]
    6edc:      	ldr	q0, [x29, #0x170]
    6ee0:      	str	q0, [x29, #0xa0]
    6ee4:      	b	0x6f50 <_stogir.checked.operands+0x210>
    6ee8:      	mov	w16, #0x148             ; =328
    6eec:      	ldr	q0, [x29, x16]
    6ef0:      	str	q0, [x29, #0x180]
    6ef4:      	add	x0, x29, #0x180
    6ef8:      	bl	0x6ef8 <_stogir.checked.operands+0x1b8>
		0000000000006ef8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    6efc:      	ubfx	x0, x0, #0, #8
    6f00:      	sxtw	x0, w0
    6f04:      	str	w0, [x29, #0x190]
    6f08:      	ldr	x0, [x29, #0x198]
    6f0c:      	str	w0, [x29, #0x194]
    6f10:      	ldrsw	x1, [x29, #0x190]
    6f14:      	ldrsw	x2, [x29, #0x194]
    6f18:      	cmp	x1, x2
    6f1c:      	b.ne	0x6f28 <_stogir.checked.operands+0x1e8>
    6f20:      	mov	w19, #0x0               ; =0
    6f24:      	b	0x6f2c <_stogir.checked.operands+0x1ec>
    6f28:      	mov	w19, #0x1               ; =1
    6f2c:      	cbz	x19, 0x6f50 <_stogir.checked.operands+0x210>
    6f30:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006f30:  ARM64_RELOC_PAGE21	l_cstr.143
    6f34:      	add	x0, x0, #0x0
		0000000000006f34:  ARM64_RELOC_PAGEOFF12	l_cstr.143
    6f38:      	str	x0, [x29, #0x1a0]
    6f3c:      	mov	w0, #0x28               ; =40
    6f40:      	str	x0, [x29, #0x1a8]
    6f44:      	ldr	q0, [x29, #0x1a0]
    6f48:      	str	q0, [x29, #0xa0]
    6f4c:      	b	0x6f50 <_stogir.checked.operands+0x210>
    6f50:      	b	0x6e68 <_stogir.checked.operands+0x128>
    6f54:      	ldr	q0, [x29, #0xa0]
    6f58:      	str	q0, [x29, #0x1b0]
    6f5c:      	adrp	x0, 0x6000 <_stogir.vector-lanes.validate+0x124>
		0000000000006f5c:  ARM64_RELOC_PAGE21	l_cstr.51
    6f60:      	add	x0, x0, #0x0
		0000000000006f60:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    6f64:      	str	x0, [x29, #0x1c0]
    6f68:      	str	xzr, [x29, #0x1c8]
    6f6c:      	ldr	x0, [x29, #0x1b0]
    6f70:      	ldr	x1, [x29, #0x1b8]
    6f74:      	ldr	x2, [x29, #0x1c0]
    6f78:      	ldr	x3, [x29, #0x1c8]
    6f7c:      	bl	0x6f7c <_stogir.checked.operands+0x23c>
		0000000000006f7c:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    6f80:      	cbz	x0, 0x6f9c <_stogir.checked.operands+0x25c>
    6f84:      	str	wzr, [x29, #0x1d0]
    6f88:      	ldr	x0, [x29, #0x198]
    6f8c:      	str	w0, [x29, #0x1d8]
    6f90:      	add	x0, x29, #0x1d0
    6f94:      	str	x0, [x29, #0x198]
    6f98:      	b	0x6fc0 <_stogir.checked.operands+0x280>
    6f9c:      	mov	w0, #0x1                ; =1
    6fa0:      	str	w0, [x29, #0x1f0]
    6fa4:      	ldr	q0, [x29, #0xa0]
    6fa8:      	str	q0, [x29, #0x210]
    6fac:      	ldr	q0, [x29, #0x210]
    6fb0:      	mov	w16, #0x1f8             ; =504
    6fb4:      	str	q0, [x29, x16]
    6fb8:      	add	x0, x29, #0x1f0
    6fbc:      	str	x0, [x29, #0x198]
    6fc0:      	ldr	x0, [x29, #0x230]
    6fc4:      	ldr	x1, [x29, #0x198]
    6fc8:      	ldr	q0, [x1]
    6fcc:      	str	q0, [x0]
    6fd0:      	ldr	x2, [x1, #0x10]
    6fd4:      	str	x2, [x0, #0x10]
    6fd8:      	b	0x6fe4 <_stogir.checked.operands+0x2a4>
    6fdc:      	brk	#0x1
    6fe0:      	brk	#0x1
    6fe4:      	ldr	x19, [sp, #0x10]
    6fe8:      	ldp	x29, x30, [sp]
    6fec:      	add	sp, sp, #0x250
    6ff0:      	ret

0000000000006ff4 <_stogir.opcode.control?>:
    6ff4:      	stp	x29, x30, [sp, #-0xb0]!
    6ff8:      	mov	x29, sp
    6ffc:      	str	x19, [sp, #0x10]
    7000:      	sxtw	x0, w0
    7004:      	bl	0x7004 <_stogir.opcode.control?+0x10>
		0000000000007004:  ARM64_RELOC_BRANCH26	_stogir.opcode.properties
    7008:      	ubfx	x0, x0, #0, #8
    700c:      	and	x0, x0, #0x1
    7010:      	ubfx	x0, x0, #0, #8
    7014:      	strb	w0, [x29, #0xa0]
    7018:      	strb	wzr, [x29, #0xa1]
    701c:      	ldrb	w0, [x29, #0xa0]
    7020:      	ldrb	w1, [x29, #0xa1]
    7024:      	cmp	x0, x1
    7028:      	b.ne	0x7034 <_stogir.opcode.control?+0x40>
    702c:      	mov	w19, #0x0               ; =0
    7030:      	b	0x7038 <_stogir.opcode.control?+0x44>
    7034:      	mov	w19, #0x1               ; =1
    7038:      	mov	x0, x19
    703c:      	ldr	x19, [sp, #0x10]
    7040:      	ldp	x29, x30, [sp], #0xb0
    7044:      	ret

0000000000007048 <_stogir.opcode.block-end?>:
    7048:      	stp	x29, x30, [sp, #-0xb0]!
    704c:      	mov	x29, sp
    7050:      	str	x19, [sp, #0x10]
    7054:      	sxtw	x0, w0
    7058:      	bl	0x7058 <_stogir.opcode.block-end?+0x10>
		0000000000007058:  ARM64_RELOC_BRANCH26	_stogir.opcode.properties
    705c:      	ubfx	x0, x0, #0, #8
    7060:      	and	x0, x0, #0x4
    7064:      	ubfx	x0, x0, #0, #8
    7068:      	strb	w0, [x29, #0xa0]
    706c:      	strb	wzr, [x29, #0xa1]
    7070:      	ldrb	w0, [x29, #0xa0]
    7074:      	ldrb	w1, [x29, #0xa1]
    7078:      	cmp	x0, x1
    707c:      	b.ne	0x7088 <_stogir.opcode.block-end?+0x40>
    7080:      	mov	w19, #0x0               ; =0
    7084:      	b	0x708c <_stogir.opcode.block-end?+0x44>
    7088:      	mov	w19, #0x1               ; =1
    708c:      	mov	x0, x19
    7090:      	ldr	x19, [sp, #0x10]
    7094:      	ldp	x29, x30, [sp], #0xb0
    7098:      	ret

000000000000709c <_stogir.atomic.ordinary?>:
    709c:      	stp	x29, x30, [sp, #-0xf0]!
    70a0:      	mov	x29, sp
    70a4:      	stp	x19, x20, [sp, #0x10]
    70a8:      	str	x21, [sp, #0x20]
    70ac:      	sxtw	x1, w1
    70b0:      	sxtw	x19, w2
    70b4:      	add	x8, x29, #0xa0
    70b8:      	bl	0x70b8 <_stogir.atomic.ordinary?+0x1c>
		00000000000070b8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    70bc:      	ldr	w0, [x29, #0xa0]
    70c0:      	cmp	x0, #0x0
    70c4:      	b.eq	0x70d8 <_stogir.atomic.ordinary?+0x3c>
    70c8:      	cmp	x0, #0x1
    70cc:      	b.eq	0x70e0 <_stogir.atomic.ordinary?+0x44>
    70d0:      	b	0x70d4 <_stogir.atomic.ordinary?+0x38>
    70d4:      	b	0x7190 <_stogir.atomic.ordinary?+0xf4>
    70d8:      	mov	w20, #0x0               ; =0
    70dc:      	b	0x7188 <_stogir.atomic.ordinary?+0xec>
    70e0:      	ldur	q0, [x29, #0xa8]
    70e4:      	str	q0, [x29, #0xd0]
    70e8:      	add	x0, x29, #0xd0
    70ec:      	bl	0x70ec <_stogir.atomic.ordinary?+0x50>
		00000000000070ec:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    70f0:      	ubfx	x0, x0, #0, #8
    70f4:      	sxtw	x0, w0
    70f8:      	cmp	x0, x19
    70fc:      	b.ne	0x7180 <_stogir.atomic.ordinary?+0xe4>
    7100:      	add	x0, x29, #0xd0
    7104:      	bl	0x7104 <_stogir.atomic.ordinary?+0x68>
		0000000000007104:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    7108:      	ubfx	x0, x0, #0, #8
    710c:      	strb	w0, [x29, #0xe0]
    7110:      	mov	w0, #0x46               ; =70
    7114:      	strb	w0, [x29, #0xe1]
    7118:      	ldrb	w0, [x29, #0xe0]
    711c:      	ldrb	w1, [x29, #0xe1]
    7120:      	cmp	x0, x1
    7124:      	b.ne	0x7130 <_stogir.atomic.ordinary?+0x94>
    7128:      	mov	w19, #0x0               ; =0
    712c:      	b	0x7134 <_stogir.atomic.ordinary?+0x98>
    7130:      	mov	w19, #0x1               ; =1
    7134:      	cbz	x19, 0x7174 <_stogir.atomic.ordinary?+0xd8>
    7138:      	add	x0, x29, #0xd0
    713c:      	bl	0x713c <_stogir.atomic.ordinary?+0xa0>
		000000000000713c:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    7140:      	ubfx	x0, x0, #0, #8
    7144:      	strb	w0, [x29, #0xe2]
    7148:      	mov	w0, #0x48               ; =72
    714c:      	strb	w0, [x29, #0xe3]
    7150:      	ldrb	w0, [x29, #0xe2]
    7154:      	ldrb	w1, [x29, #0xe3]
    7158:      	cmp	x0, x1
    715c:      	b.ne	0x7168 <_stogir.atomic.ordinary?+0xcc>
    7160:      	mov	w19, #0x0               ; =0
    7164:      	b	0x716c <_stogir.atomic.ordinary?+0xd0>
    7168:      	mov	w19, #0x1               ; =1
    716c:      	mov	x21, x19
    7170:      	b	0x7178 <_stogir.atomic.ordinary?+0xdc>
    7174:      	mov	w21, #0x0               ; =0
    7178:      	mov	x19, x21
    717c:      	b	0x7184 <_stogir.atomic.ordinary?+0xe8>
    7180:      	mov	w19, #0x0               ; =0
    7184:      	mov	x20, x19
    7188:      	mov	x0, x20
    718c:      	b	0x7194 <_stogir.atomic.ordinary?+0xf8>
    7190:      	brk	#0x1
    7194:      	ldp	x19, x20, [sp, #0x10]
    7198:      	ldr	x21, [sp, #0x20]
    719c:      	ldp	x29, x30, [sp], #0xf0
    71a0:      	ret

00000000000071a4 <_stogir.types.scalar-size>:
    71a4:      	stp	x29, x30, [sp, #-0xc0]!
    71a8:      	mov	x29, sp
    71ac:      	sxtw	x2, w0
    71b0:      	sxtw	x3, w1
    71b4:      	cmp	x3, #0x4
    71b8:      	b.ne	0x71c4 <_stogir.types.scalar-size+0x20>
    71bc:      	mov	w4, #0x1                ; =1
    71c0:      	b	0x71d0 <_stogir.types.scalar-size+0x2c>
    71c4:      	cmp	x3, #0x8
    71c8:      	cset	x0, eq
    71cc:      	mov	x4, x0
    71d0:      	cbz	x4, 0x71dc <_stogir.types.scalar-size+0x38>
    71d4:      	mov	w4, #0x0                ; =0
    71d8:      	b	0x71e0 <_stogir.types.scalar-size+0x3c>
    71dc:      	mov	w4, #0x1                ; =1
    71e0:      	cbz	x4, 0x71ec <_stogir.types.scalar-size+0x48>
    71e4:      	mov	x4, #-0x1               ; =-1
    71e8:      	b	0x7360 <_stogir.types.scalar-size+0x1bc>
    71ec:      	cmp	x2, #0x0
    71f0:      	b.ne	0x71fc <_stogir.types.scalar-size+0x58>
    71f4:      	mov	w5, #0x0                ; =0
    71f8:      	b	0x735c <_stogir.types.scalar-size+0x1b8>
    71fc:      	cmp	x2, #0x1
    7200:      	b.ne	0x720c <_stogir.types.scalar-size+0x68>
    7204:      	mov	w6, #0x1                ; =1
    7208:      	b	0x724c <_stogir.types.scalar-size+0xa8>
    720c:      	cmp	x2, #0x2
    7210:      	b.ne	0x7220 <_stogir.types.scalar-size+0x7c>
    7214:      	mov	w0, #0x1                ; =1
    7218:      	str	x0, [x29, #0xa0]
    721c:      	b	0x7248 <_stogir.types.scalar-size+0xa4>
    7220:      	cmp	x2, #0x7
    7224:      	b.ne	0x7234 <_stogir.types.scalar-size+0x90>
    7228:      	mov	w0, #0x1                ; =1
    722c:      	str	x0, [x29, #0xa8]
    7230:      	b	0x7240 <_stogir.types.scalar-size+0x9c>
    7234:      	cmp	x2, #0x8
    7238:      	cset	x0, eq
    723c:      	str	x0, [x29, #0xa8]
    7240:      	ldr	x0, [x29, #0xa8]
    7244:      	str	x0, [x29, #0xa0]
    7248:      	ldr	x6, [x29, #0xa0]
    724c:      	cbz	x6, 0x7258 <_stogir.types.scalar-size+0xb4>
    7250:      	mov	w6, #0x1                ; =1
    7254:      	b	0x7358 <_stogir.types.scalar-size+0x1b4>
    7258:      	cmp	x2, #0x3
    725c:      	b.ne	0x726c <_stogir.types.scalar-size+0xc8>
    7260:      	mov	w0, #0x1                ; =1
    7264:      	str	x0, [x29, #0xa0]
    7268:      	b	0x7278 <_stogir.types.scalar-size+0xd4>
    726c:      	cmp	x2, #0x9
    7270:      	cset	x0, eq
    7274:      	str	x0, [x29, #0xa0]
    7278:      	ldr	x0, [x29, #0xa0]
    727c:      	cbz	x0, 0x728c <_stogir.types.scalar-size+0xe8>
    7280:      	mov	w0, #0x2                ; =2
    7284:      	str	x0, [x29, #0xa0]
    7288:      	b	0x7354 <_stogir.types.scalar-size+0x1b0>
    728c:      	cmp	x2, #0x4
    7290:      	b.ne	0x72a0 <_stogir.types.scalar-size+0xfc>
    7294:      	mov	w0, #0x1                ; =1
    7298:      	str	x0, [x29, #0xa8]
    729c:      	b	0x72c8 <_stogir.types.scalar-size+0x124>
    72a0:      	cmp	x2, #0xa
    72a4:      	b.ne	0x72b4 <_stogir.types.scalar-size+0x110>
    72a8:      	mov	w0, #0x1                ; =1
    72ac:      	str	x0, [x29, #0xb0]
    72b0:      	b	0x72c0 <_stogir.types.scalar-size+0x11c>
    72b4:      	cmp	x2, #0xd
    72b8:      	cset	x0, eq
    72bc:      	str	x0, [x29, #0xb0]
    72c0:      	ldr	x0, [x29, #0xb0]
    72c4:      	str	x0, [x29, #0xa8]
    72c8:      	ldr	x0, [x29, #0xa8]
    72cc:      	cbz	x0, 0x72dc <_stogir.types.scalar-size+0x138>
    72d0:      	mov	w0, #0x4                ; =4
    72d4:      	str	x0, [x29, #0xa8]
    72d8:      	b	0x734c <_stogir.types.scalar-size+0x1a8>
    72dc:      	cmp	x2, #0x5
    72e0:      	b.ne	0x72f0 <_stogir.types.scalar-size+0x14c>
    72e4:      	mov	w0, #0x1                ; =1
    72e8:      	str	x0, [x29, #0xb0]
    72ec:      	b	0x7318 <_stogir.types.scalar-size+0x174>
    72f0:      	cmp	x2, #0xb
    72f4:      	b.ne	0x7304 <_stogir.types.scalar-size+0x160>
    72f8:      	mov	w0, #0x1                ; =1
    72fc:      	str	x0, [x29, #0xb8]
    7300:      	b	0x7310 <_stogir.types.scalar-size+0x16c>
    7304:      	cmp	x2, #0xc
    7308:      	cset	x0, eq
    730c:      	str	x0, [x29, #0xb8]
    7310:      	ldr	x0, [x29, #0xb8]
    7314:      	str	x0, [x29, #0xb0]
    7318:      	ldr	x0, [x29, #0xb0]
    731c:      	cbz	x0, 0x732c <_stogir.types.scalar-size+0x188>
    7320:      	mov	w0, #0x8                ; =8
    7324:      	str	x0, [x29, #0xb0]
    7328:      	b	0x7344 <_stogir.types.scalar-size+0x1a0>
    732c:      	cmp	x2, #0x6
    7330:      	b.ne	0x733c <_stogir.types.scalar-size+0x198>
    7334:      	mov	x2, x3
    7338:      	b	0x7340 <_stogir.types.scalar-size+0x19c>
    733c:      	mov	x2, #-0x1               ; =-1
    7340:      	str	x2, [x29, #0xb0]
    7344:      	ldr	x0, [x29, #0xb0]
    7348:      	str	x0, [x29, #0xa8]
    734c:      	ldr	x0, [x29, #0xa8]
    7350:      	str	x0, [x29, #0xa0]
    7354:      	ldr	x6, [x29, #0xa0]
    7358:      	mov	x5, x6
    735c:      	mov	x4, x5
    7360:      	mov	x0, x4
    7364:      	ldp	x29, x30, [sp], #0xc0
    7368:      	ret

000000000000736c <_stogir.terminal.inputs>:
    736c:      	stp	x29, x30, [sp, #-0x1b0]!
    7370:      	mov	x29, sp
    7374:      	stp	x19, x20, [sp, #0x10]
    7378:      	stp	x21, x22, [sp, #0x20]
    737c:      	str	x23, [sp, #0x30]
    7380:      	mov	x19, x8
    7384:      	mov	x20, x0
    7388:      	sxtw	x21, w1
    738c:      	sxtw	x22, w2
    7390:      	sxtw	x23, w3
    7394:      	mov	x0, x21
    7398:      	bl	0x7398 <_stogir.terminal.inputs+0x2c>
		0000000000007398:  ARM64_RELOC_BRANCH26	_stogir.terminal.operation?
    739c:      	cbz	x0, 0x73ac <_stogir.terminal.inputs+0x40>
    73a0:      	mov	w0, #0x0                ; =0
    73a4:      	str	x0, [x29, #0xa8]
    73a8:      	b	0x73b4 <_stogir.terminal.inputs+0x48>
    73ac:      	mov	w0, #0x1                ; =1
    73b0:      	str	x0, [x29, #0xa8]
    73b4:      	ldr	x0, [x29, #0xa8]
    73b8:      	cbz	x0, 0x73c8 <_stogir.terminal.inputs+0x5c>
    73bc:      	mov	w0, #0x1                ; =1
    73c0:      	str	x0, [x29, #0xa8]
    73c4:      	b	0x740c <_stogir.terminal.inputs+0xa0>
    73c8:      	cmp	x21, #0x60
    73cc:      	b.ne	0x73fc <_stogir.terminal.inputs+0x90>
    73d0:      	str	w23, [x29, #0xa0]
    73d4:      	str	wzr, [x29, #0xa4]
    73d8:      	ldrsw	x0, [x29, #0xa0]
    73dc:      	ldrsw	x1, [x29, #0xa4]
    73e0:      	cmp	x0, x1
    73e4:      	b.ne	0x73f0 <_stogir.terminal.inputs+0x84>
    73e8:      	mov	w21, #0x0               ; =0
    73ec:      	b	0x73f4 <_stogir.terminal.inputs+0x88>
    73f0:      	mov	w21, #0x1               ; =1
    73f4:      	str	x21, [x29, #0x1a0]
    73f8:      	b	0x7404 <_stogir.terminal.inputs+0x98>
    73fc:      	mov	w0, #0x0                ; =0
    7400:      	str	x0, [x29, #0x1a0]
    7404:      	ldr	x0, [x29, #0x1a0]
    7408:      	str	x0, [x29, #0xa8]
    740c:      	ldr	x0, [x29, #0xa8]
    7410:      	cbz	x0, 0x7440 <_stogir.terminal.inputs+0xd4>
    7414:      	mov	w0, #0x1                ; =1
    7418:      	str	w0, [x29, #0xb0]
    741c:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		000000000000741c:  ARM64_RELOC_PAGE21	l_cstr.144
    7420:      	add	x0, x0, #0x0
		0000000000007420:  ARM64_RELOC_PAGEOFF12	l_cstr.144
    7424:      	str	x0, [x29, #0xd0]
    7428:      	mov	w0, #0x25               ; =37
    742c:      	str	x0, [x29, #0xd8]
    7430:      	ldr	q0, [x29, #0xd0]
    7434:      	stur	q0, [x29, #0xb8]
    7438:      	add	x21, x29, #0xb0
    743c:      	b	0x7564 <_stogir.terminal.inputs+0x1f8>
    7440:      	add	x8, x29, #0xe0
    7444:      	mov	x0, x20
    7448:      	mov	x1, x22
    744c:      	bl	0x744c <_stogir.terminal.inputs+0xe0>
		000000000000744c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    7450:      	ldr	w0, [x29, #0xe0]
    7454:      	cmp	x0, #0x0
    7458:      	b.eq	0x746c <_stogir.terminal.inputs+0x100>
    745c:      	cmp	x0, #0x1
    7460:      	b.eq	0x74a0 <_stogir.terminal.inputs+0x134>
    7464:      	b	0x7468 <_stogir.terminal.inputs+0xfc>
    7468:      	b	0x7578 <_stogir.terminal.inputs+0x20c>
    746c:      	mov	w0, #0x1                ; =1
    7470:      	str	w0, [x29, #0x110]
    7474:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007474:  ARM64_RELOC_PAGE21	l_cstr.145
    7478:      	add	x0, x0, #0x0
		0000000000007478:  ARM64_RELOC_PAGEOFF12	l_cstr.145
    747c:      	str	x0, [x29, #0x130]
    7480:      	mov	w0, #0x1d               ; =29
    7484:      	str	x0, [x29, #0x138]
    7488:      	ldr	q0, [x29, #0x130]
    748c:      	mov	w16, #0x118             ; =280
    7490:      	str	q0, [x29, x16]
    7494:      	add	x0, x29, #0x110
    7498:      	str	x0, [x29, #0xa8]
    749c:      	b	0x7560 <_stogir.terminal.inputs+0x1f4>
    74a0:      	ldur	q0, [x29, #0xe8]
    74a4:      	str	q0, [x29, #0x140]
    74a8:      	cmp	x22, #0x0
    74ac:      	b.gt	0x74b8 <_stogir.terminal.inputs+0x14c>
    74b0:      	mov	w22, #0x1               ; =1
    74b4:      	b	0x7514 <_stogir.terminal.inputs+0x1a8>
    74b8:      	add	x0, x29, #0x140
    74bc:      	bl	0x74bc <_stogir.terminal.inputs+0x150>
		00000000000074bc:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    74c0:      	ubfx	x0, x0, #0, #8
    74c4:      	sxtw	x0, w0
    74c8:      	bl	0x74c8 <_stogir.terminal.inputs+0x15c>
		00000000000074c8:  ARM64_RELOC_BRANCH26	_stogir.opcode.control?
    74cc:      	cbz	x0, 0x74dc <_stogir.terminal.inputs+0x170>
    74d0:      	mov	w0, #0x0                ; =0
    74d4:      	str	x0, [x29, #0x1a0]
    74d8:      	b	0x74e4 <_stogir.terminal.inputs+0x178>
    74dc:      	mov	w0, #0x1                ; =1
    74e0:      	str	x0, [x29, #0x1a0]
    74e4:      	ldr	x0, [x29, #0x1a0]
    74e8:      	cbz	x0, 0x74f8 <_stogir.terminal.inputs+0x18c>
    74ec:      	mov	w0, #0x1                ; =1
    74f0:      	str	x0, [x29, #0x1a0]
    74f4:      	b	0x7510 <_stogir.terminal.inputs+0x1a4>
    74f8:      	add	x0, x29, #0x140
    74fc:      	bl	0x74fc <_stogir.terminal.inputs+0x190>
		00000000000074fc:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    7500:      	ubfx	x0, x0, #0, #8
    7504:      	sxtw	x0, w0
    7508:      	bl	0x7508 <_stogir.terminal.inputs+0x19c>
		0000000000007508:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-end?
    750c:      	str	x0, [x29, #0x1a0]
    7510:      	ldr	x22, [x29, #0x1a0]
    7514:      	cbz	x22, 0x7548 <_stogir.terminal.inputs+0x1dc>
    7518:      	mov	w0, #0x1                ; =1
    751c:      	str	w0, [x29, #0x150]
    7520:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007520:  ARM64_RELOC_PAGE21	l_cstr.146
    7524:      	add	x0, x0, #0x0
		0000000000007524:  ARM64_RELOC_PAGEOFF12	l_cstr.146
    7528:      	str	x0, [x29, #0x170]
    752c:      	mov	w0, #0x2c               ; =44
    7530:      	str	x0, [x29, #0x178]
    7534:      	ldr	q0, [x29, #0x170]
    7538:      	mov	w16, #0x158             ; =344
    753c:      	str	q0, [x29, x16]
    7540:      	add	x22, x29, #0x150
    7544:      	b	0x755c <_stogir.terminal.inputs+0x1f0>
    7548:      	add	x8, x29, #0x180
    754c:      	mov	x0, x20
    7550:      	mov	x1, x23
    7554:      	bl	0x7554 <_stogir.terminal.inputs+0x1e8>
		0000000000007554:  ARM64_RELOC_BRANCH26	_stogir.terminal.previous-input
    7558:      	add	x22, x29, #0x180
    755c:      	str	x22, [x29, #0xa8]
    7560:      	ldr	x21, [x29, #0xa8]
    7564:      	ldr	q0, [x21]
    7568:      	str	q0, [x19]
    756c:      	ldr	x0, [x21, #0x10]
    7570:      	str	x0, [x19, #0x10]
    7574:      	b	0x757c <_stogir.terminal.inputs+0x210>
    7578:      	brk	#0x1
    757c:      	ldp	x19, x20, [sp, #0x10]
    7580:      	ldp	x21, x22, [sp, #0x20]
    7584:      	ldr	x23, [sp, #0x30]
    7588:      	ldp	x29, x30, [sp], #0x1b0
    758c:      	ret

0000000000007590 <_stogir.switch.switch-inputs>:
    7590:      	stp	x29, x30, [sp, #-0x170]!
    7594:      	mov	x29, sp
    7598:      	stp	x19, x20, [sp, #0x10]
    759c:      	stp	x21, x22, [sp, #0x20]
    75a0:      	str	x23, [sp, #0x30]
    75a4:      	mov	x19, x8
    75a8:      	mov	x20, x0
    75ac:      	sxtw	x21, w1
    75b0:      	sxtw	x22, w2
    75b4:      	add	x8, x29, #0xa0
    75b8:      	mov	x0, x20
    75bc:      	mov	x1, x21
    75c0:      	bl	0x75c0 <_stogir.switch.switch-inputs+0x30>
		00000000000075c0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    75c4:      	ldr	w0, [x29, #0xa0]
    75c8:      	cmp	x0, #0x0
    75cc:      	b.eq	0x75e0 <_stogir.switch.switch-inputs+0x50>
    75d0:      	cmp	x0, #0x1
    75d4:      	b.eq	0x760c <_stogir.switch.switch-inputs+0x7c>
    75d8:      	b	0x75dc <_stogir.switch.switch-inputs+0x4c>
    75dc:      	b	0x76e0 <_stogir.switch.switch-inputs+0x150>
    75e0:      	mov	w0, #0x1                ; =1
    75e4:      	str	w0, [x29, #0xd0]
    75e8:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		00000000000075e8:  ARM64_RELOC_PAGE21	l_cstr.147
    75ec:      	add	x0, x0, #0x0
		00000000000075ec:  ARM64_RELOC_PAGEOFF12	l_cstr.147
    75f0:      	str	x0, [x29, #0xf0]
    75f4:      	mov	w0, #0x16               ; =22
    75f8:      	str	x0, [x29, #0xf8]
    75fc:      	ldr	q0, [x29, #0xf0]
    7600:      	stur	q0, [x29, #0xd8]
    7604:      	add	x23, x29, #0xd0
    7608:      	b	0x76cc <_stogir.switch.switch-inputs+0x13c>
    760c:      	ldur	q0, [x29, #0xa8]
    7610:      	str	q0, [x29, #0x100]
    7614:      	cmp	x21, #0x0
    7618:      	b.gt	0x7624 <_stogir.switch.switch-inputs+0x94>
    761c:      	mov	w21, #0x1               ; =1
    7620:      	b	0x7680 <_stogir.switch.switch-inputs+0xf0>
    7624:      	add	x0, x29, #0x100
    7628:      	bl	0x7628 <_stogir.switch.switch-inputs+0x98>
		0000000000007628:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    762c:      	ubfx	x0, x0, #0, #8
    7630:      	sxtw	x0, w0
    7634:      	bl	0x7634 <_stogir.switch.switch-inputs+0xa4>
		0000000000007634:  ARM64_RELOC_BRANCH26	_stogir.opcode.control?
    7638:      	cbz	x0, 0x7648 <_stogir.switch.switch-inputs+0xb8>
    763c:      	mov	w0, #0x0                ; =0
    7640:      	str	x0, [x29, #0x160]
    7644:      	b	0x7650 <_stogir.switch.switch-inputs+0xc0>
    7648:      	mov	w0, #0x1                ; =1
    764c:      	str	x0, [x29, #0x160]
    7650:      	ldr	x0, [x29, #0x160]
    7654:      	cbz	x0, 0x7664 <_stogir.switch.switch-inputs+0xd4>
    7658:      	mov	w0, #0x1                ; =1
    765c:      	str	x0, [x29, #0x160]
    7660:      	b	0x767c <_stogir.switch.switch-inputs+0xec>
    7664:      	add	x0, x29, #0x100
    7668:      	bl	0x7668 <_stogir.switch.switch-inputs+0xd8>
		0000000000007668:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    766c:      	ubfx	x0, x0, #0, #8
    7670:      	sxtw	x0, w0
    7674:      	bl	0x7674 <_stogir.switch.switch-inputs+0xe4>
		0000000000007674:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-end?
    7678:      	str	x0, [x29, #0x160]
    767c:      	ldr	x21, [x29, #0x160]
    7680:      	cbz	x21, 0x76b4 <_stogir.switch.switch-inputs+0x124>
    7684:      	mov	w0, #0x1                ; =1
    7688:      	str	w0, [x29, #0x110]
    768c:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		000000000000768c:  ARM64_RELOC_PAGE21	l_cstr.148
    7690:      	add	x0, x0, #0x0
		0000000000007690:  ARM64_RELOC_PAGEOFF12	l_cstr.148
    7694:      	str	x0, [x29, #0x130]
    7698:      	mov	w0, #0x16               ; =22
    769c:      	str	x0, [x29, #0x138]
    76a0:      	ldr	q0, [x29, #0x130]
    76a4:      	mov	w16, #0x118             ; =280
    76a8:      	str	q0, [x29, x16]
    76ac:      	add	x21, x29, #0x110
    76b0:      	b	0x76c8 <_stogir.switch.switch-inputs+0x138>
    76b4:      	add	x8, x29, #0x140
    76b8:      	mov	x0, x20
    76bc:      	mov	x1, x22
    76c0:      	bl	0x76c0 <_stogir.switch.switch-inputs+0x130>
		00000000000076c0:  ARM64_RELOC_BRANCH26	_stogir.switch.selector-type
    76c4:      	add	x21, x29, #0x140
    76c8:      	mov	x23, x21
    76cc:      	ldr	q0, [x23]
    76d0:      	str	q0, [x19]
    76d4:      	ldr	x0, [x23, #0x10]
    76d8:      	str	x0, [x19, #0x10]
    76dc:      	b	0x76e4 <_stogir.switch.switch-inputs+0x154>
    76e0:      	brk	#0x1
    76e4:      	ldp	x19, x20, [sp, #0x10]
    76e8:      	ldp	x21, x22, [sp, #0x20]
    76ec:      	ldr	x23, [sp, #0x30]
    76f0:      	ldp	x29, x30, [sp], #0x170
    76f4:      	ret

00000000000076f8 <_stogir.switch.case-inputs>:
    76f8:      	sub	sp, sp, #0x2f0
    76fc:      	stp	x29, x30, [sp]
    7700:      	mov	x29, sp
    7704:      	stp	x19, x20, [sp, #0x10]
    7708:      	stp	x21, x22, [sp, #0x20]
    770c:      	str	x23, [sp, #0x30]
    7710:      	mov	x19, x8
    7714:      	mov	x20, x0
    7718:      	sxtw	x21, w1
    771c:      	sxtw	x22, w2
    7720:      	sxtw	x23, w3
    7724:      	sxtw	x4, w4
    7728:      	add	x8, x29, #0xa0
    772c:      	mov	x0, x20
    7730:      	mov	x1, x22
    7734:      	str	x4, [x29, #0x2b0]
    7738:      	bl	0x7738 <_stogir.switch.case-inputs+0x40>
		0000000000007738:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    773c:      	ldr	w0, [x29, #0xa0]
    7740:      	cmp	x0, #0x0
    7744:      	b.eq	0x7758 <_stogir.switch.case-inputs+0x60>
    7748:      	cmp	x0, #0x1
    774c:      	b.eq	0x7788 <_stogir.switch.case-inputs+0x90>
    7750:      	b	0x7754 <_stogir.switch.case-inputs+0x5c>
    7754:      	b	0x7b00 <_stogir.switch.case-inputs+0x408>
    7758:      	mov	w0, #0x1                ; =1
    775c:      	str	w0, [x29, #0xd0]
    7760:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007760:  ARM64_RELOC_PAGE21	l_cstr.149
    7764:      	add	x0, x0, #0x0
		0000000000007764:  ARM64_RELOC_PAGEOFF12	l_cstr.149
    7768:      	str	x0, [x29, #0xf0]
    776c:      	mov	w0, #0x1a               ; =26
    7770:      	str	x0, [x29, #0xf8]
    7774:      	ldr	q0, [x29, #0xf0]
    7778:      	stur	q0, [x29, #0xd8]
    777c:      	add	x0, x29, #0xd0
    7780:      	str	x0, [x29, #0x2b8]
    7784:      	b	0x7adc <_stogir.switch.case-inputs+0x3e4>
    7788:      	ldur	q0, [x29, #0xa8]
    778c:      	str	q0, [x29, #0x100]
    7790:      	cmp	x22, #0x0
    7794:      	b.gt	0x77a4 <_stogir.switch.case-inputs+0xac>
    7798:      	mov	w0, #0x1                ; =1
    779c:      	str	x0, [x29, #0x2c0]
    77a0:      	b	0x78d4 <_stogir.switch.case-inputs+0x1dc>
    77a4:      	add	x0, x29, #0x100
    77a8:      	bl	0x77a8 <_stogir.switch.case-inputs+0xb0>
		00000000000077a8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    77ac:      	ubfx	x0, x0, #0, #8
    77b0:      	strb	w0, [x29, #0x110]
    77b4:      	mov	w0, #0x75               ; =117
    77b8:      	strb	w0, [x29, #0x111]
    77bc:      	ldrb	w0, [x29, #0x110]
    77c0:      	ldrb	w1, [x29, #0x111]
    77c4:      	cmp	x0, x1
    77c8:      	b.ne	0x77d8 <_stogir.switch.case-inputs+0xe0>
    77cc:      	mov	w0, #0x0                ; =0
    77d0:      	str	x0, [x29, #0x2c8]
    77d4:      	b	0x77e0 <_stogir.switch.case-inputs+0xe8>
    77d8:      	mov	w0, #0x1                ; =1
    77dc:      	str	x0, [x29, #0x2c8]
    77e0:      	ldr	x0, [x29, #0x2c8]
    77e4:      	cbz	x0, 0x77f4 <_stogir.switch.case-inputs+0xfc>
    77e8:      	mov	w0, #0x1                ; =1
    77ec:      	str	x0, [x29, #0x2c8]
    77f0:      	b	0x78cc <_stogir.switch.case-inputs+0x1d4>
    77f4:      	add	x0, x29, #0x100
    77f8:      	bl	0x77f8 <_stogir.switch.case-inputs+0x100>
		00000000000077f8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    77fc:      	ubfx	x0, x0, #0, #8
    7800:      	strb	w0, [x29, #0x112]
    7804:      	strb	wzr, [x29, #0x113]
    7808:      	ldrb	w0, [x29, #0x112]
    780c:      	ldrb	w1, [x29, #0x113]
    7810:      	cmp	x0, x1
    7814:      	b.ne	0x7824 <_stogir.switch.case-inputs+0x12c>
    7818:      	mov	w0, #0x0                ; =0
    781c:      	str	x0, [x29, #0x2d0]
    7820:      	b	0x782c <_stogir.switch.case-inputs+0x134>
    7824:      	mov	w0, #0x1                ; =1
    7828:      	str	x0, [x29, #0x2d0]
    782c:      	ldr	x0, [x29, #0x2d0]
    7830:      	cbz	x0, 0x7840 <_stogir.switch.case-inputs+0x148>
    7834:      	mov	w0, #0x1                ; =1
    7838:      	str	x0, [x29, #0x2d0]
    783c:      	b	0x78c4 <_stogir.switch.case-inputs+0x1cc>
    7840:      	ldr	x0, [x20, #0x78]
    7844:      	add	x0, x0, x22, lsl #2
    7848:      	ldrsw	x0, [x0]
    784c:      	str	w0, [x29, #0x114]
    7850:      	mov	w0, #0x2                ; =2
    7854:      	str	w0, [x29, #0x118]
    7858:      	ldrsw	x0, [x29, #0x114]
    785c:      	ldrsw	x1, [x29, #0x118]
    7860:      	cmp	x0, x1
    7864:      	b.ne	0x7870 <_stogir.switch.case-inputs+0x178>
    7868:      	mov	w22, #0x0               ; =0
    786c:      	b	0x7874 <_stogir.switch.case-inputs+0x17c>
    7870:      	mov	w22, #0x1               ; =1
    7874:      	cbz	x22, 0x7880 <_stogir.switch.case-inputs+0x188>
    7878:      	mov	w22, #0x1               ; =1
    787c:      	b	0x78c0 <_stogir.switch.case-inputs+0x1c8>
    7880:      	cmp	x21, #0x6d
    7884:      	b.lt	0x7898 <_stogir.switch.case-inputs+0x1a0>
    7888:      	cmp	x21, #0x6f
    788c:      	cset	x0, le
    7890:      	str	x0, [x29, #0x2d8]
    7894:      	b	0x78a0 <_stogir.switch.case-inputs+0x1a8>
    7898:      	mov	w0, #0x0                ; =0
    789c:      	str	x0, [x29, #0x2d8]
    78a0:      	ldr	x0, [x29, #0x2d8]
    78a4:      	cbz	x0, 0x78b4 <_stogir.switch.case-inputs+0x1bc>
    78a8:      	mov	w0, #0x0                ; =0
    78ac:      	str	x0, [x29, #0x2d8]
    78b0:      	b	0x78bc <_stogir.switch.case-inputs+0x1c4>
    78b4:      	mov	w0, #0x1                ; =1
    78b8:      	str	x0, [x29, #0x2d8]
    78bc:      	ldr	x22, [x29, #0x2d8]
    78c0:      	str	x22, [x29, #0x2d0]
    78c4:      	ldr	x0, [x29, #0x2d0]
    78c8:      	str	x0, [x29, #0x2c8]
    78cc:      	ldr	x0, [x29, #0x2c8]
    78d0:      	str	x0, [x29, #0x2c0]
    78d4:      	ldr	x0, [x29, #0x2c0]
    78d8:      	cbz	x0, 0x790c <_stogir.switch.case-inputs+0x214>
    78dc:      	mov	w0, #0x1                ; =1
    78e0:      	str	w0, [x29, #0x120]
    78e4:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		00000000000078e4:  ARM64_RELOC_PAGE21	l_cstr.150
    78e8:      	add	x0, x0, #0x0
		00000000000078e8:  ARM64_RELOC_PAGEOFF12	l_cstr.150
    78ec:      	str	x0, [x29, #0x140]
    78f0:      	mov	w0, #0x1f               ; =31
    78f4:      	str	x0, [x29, #0x148]
    78f8:      	ldr	q0, [x29, #0x140]
    78fc:      	mov	w16, #0x128             ; =296
    7900:      	str	q0, [x29, x16]
    7904:      	add	x22, x29, #0x120
    7908:      	b	0x7ad8 <_stogir.switch.case-inputs+0x3e0>
    790c:      	ldrsw	x0, [x29, #0x104]
    7910:      	ldrsw	x1, [x29, #0x108]
    7914:      	add	x8, x29, #0x150
    7918:      	mov	x9, x0
    791c:      	mov	x0, x20
    7920:      	mov	x10, x1
    7924:      	mov	x1, x9
    7928:      	mov	x2, x10
    792c:      	bl	0x792c <_stogir.switch.case-inputs+0x234>
		000000000000792c:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    7930:      	ldr	w0, [x29, #0x150]
    7934:      	cmp	x0, #0x0
    7938:      	b.eq	0x7978 <_stogir.switch.case-inputs+0x280>
    793c:      	cmp	x0, #0x1
    7940:      	b.eq	0x794c <_stogir.switch.case-inputs+0x254>
    7944:      	b	0x7948 <_stogir.switch.case-inputs+0x250>
    7948:      	b	0x7afc <_stogir.switch.case-inputs+0x404>
    794c:      	mov	w16, #0x158             ; =344
    7950:      	ldr	q0, [x29, x16]
    7954:      	str	q0, [x29, #0x170]
    7958:      	mov	w0, #0x1                ; =1
    795c:      	str	w0, [x29, #0x180]
    7960:      	ldr	q0, [x29, #0x170]
    7964:      	mov	w16, #0x188             ; =392
    7968:      	str	q0, [x29, x16]
    796c:      	add	x0, x29, #0x180
    7970:      	str	x0, [x29, #0x2c0]
    7974:      	b	0x7ad4 <_stogir.switch.case-inputs+0x3dc>
    7978:      	ldrsw	x0, [x29, #0x158]
    797c:      	cmp	x21, #0x6f
    7980:      	str	x0, [x29, #0x2c8]
    7984:      	b.ne	0x799c <_stogir.switch.case-inputs+0x2a4>
    7988:      	str	wzr, [x29, #0x1a0]
    798c:      	str	w0, [x29, #0x1a8]
    7990:      	add	x1, x29, #0x1a0
    7994:      	str	x1, [x29, #0x2d0]
    7998:      	b	0x7acc <_stogir.switch.case-inputs+0x3d4>
    799c:      	add	x8, x29, #0x1c0
    79a0:      	mov	x0, x20
    79a4:      	mov	x1, x23
    79a8:      	ldr	x2, [x29, #0x2c8]
    79ac:      	bl	0x79ac <_stogir.switch.case-inputs+0x2b4>
		00000000000079ac:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    79b0:      	ldr	w0, [x29, #0x1c0]
    79b4:      	cmp	x0, #0x0
    79b8:      	b.eq	0x79f8 <_stogir.switch.case-inputs+0x300>
    79bc:      	cmp	x0, #0x1
    79c0:      	b.eq	0x79cc <_stogir.switch.case-inputs+0x2d4>
    79c4:      	b	0x79c8 <_stogir.switch.case-inputs+0x2d0>
    79c8:      	b	0x7af8 <_stogir.switch.case-inputs+0x400>
    79cc:      	mov	w16, #0x1c8             ; =456
    79d0:      	ldr	q0, [x29, x16]
    79d4:      	str	q0, [x29, #0x1e0]
    79d8:      	mov	w0, #0x1                ; =1
    79dc:      	str	w0, [x29, #0x1f0]
    79e0:      	ldr	q0, [x29, #0x1e0]
    79e4:      	mov	w16, #0x1f8             ; =504
    79e8:      	str	q0, [x29, x16]
    79ec:      	add	x0, x29, #0x1f0
    79f0:      	str	x0, [x29, #0x2d8]
    79f4:      	b	0x7ac4 <_stogir.switch.case-inputs+0x3cc>
    79f8:      	ldr	x0, [x29, #0x1c8]
    79fc:      	cmp	x21, #0x6d
    7a00:      	str	x0, [x29, #0x2e0]
    7a04:      	b.ne	0x7a10 <_stogir.switch.case-inputs+0x318>
    7a08:      	mov	x21, x23
    7a0c:      	b	0x7a14 <_stogir.switch.case-inputs+0x31c>
    7a10:      	ldr	x21, [x29, #0x2b0]
    7a14:      	add	x8, x29, #0x210
    7a18:      	mov	x0, x20
    7a1c:      	mov	x1, x21
    7a20:      	ldr	x2, [x29, #0x2c8]
    7a24:      	bl	0x7a24 <_stogir.switch.case-inputs+0x32c>
		0000000000007a24:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    7a28:      	ldr	w0, [x29, #0x210]
    7a2c:      	cmp	x0, #0x0
    7a30:      	b.eq	0x7a6c <_stogir.switch.case-inputs+0x374>
    7a34:      	cmp	x0, #0x1
    7a38:      	b.eq	0x7a44 <_stogir.switch.case-inputs+0x34c>
    7a3c:      	b	0x7a40 <_stogir.switch.case-inputs+0x348>
    7a40:      	b	0x7af4 <_stogir.switch.case-inputs+0x3fc>
    7a44:      	mov	w16, #0x218             ; =536
    7a48:      	ldr	q0, [x29, x16]
    7a4c:      	str	q0, [x29, #0x230]
    7a50:      	mov	w0, #0x1                ; =1
    7a54:      	str	w0, [x29, #0x240]
    7a58:      	ldr	q0, [x29, #0x230]
    7a5c:      	mov	w16, #0x248             ; =584
    7a60:      	str	q0, [x29, x16]
    7a64:      	add	x20, x29, #0x240
    7a68:      	b	0x7ac0 <_stogir.switch.case-inputs+0x3c8>
    7a6c:      	ldr	x0, [x29, #0x218]
    7a70:      	ldr	x1, [x29, #0x2e0]
    7a74:      	cmp	x1, x0
    7a78:      	b.ls	0x7aac <_stogir.switch.case-inputs+0x3b4>
    7a7c:      	mov	w0, #0x1                ; =1
    7a80:      	str	w0, [x29, #0x260]
    7a84:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007a84:  ARM64_RELOC_PAGE21	l_cstr.151
    7a88:      	add	x0, x0, #0x0
		0000000000007a88:  ARM64_RELOC_PAGEOFF12	l_cstr.151
    7a8c:      	str	x0, [x29, #0x280]
    7a90:      	mov	w0, #0x1a               ; =26
    7a94:      	str	x0, [x29, #0x288]
    7a98:      	ldr	q0, [x29, #0x280]
    7a9c:      	mov	w16, #0x268             ; =616
    7aa0:      	str	q0, [x29, x16]
    7aa4:      	add	x21, x29, #0x260
    7aa8:      	b	0x7abc <_stogir.switch.case-inputs+0x3c4>
    7aac:      	str	wzr, [x29, #0x290]
    7ab0:      	ldr	x0, [x29, #0x2c8]
    7ab4:      	str	w0, [x29, #0x298]
    7ab8:      	add	x21, x29, #0x290
    7abc:      	mov	x20, x21
    7ac0:      	str	x20, [x29, #0x2d8]
    7ac4:      	ldr	x0, [x29, #0x2d8]
    7ac8:      	str	x0, [x29, #0x2d0]
    7acc:      	ldr	x0, [x29, #0x2d0]
    7ad0:      	str	x0, [x29, #0x2c0]
    7ad4:      	ldr	x22, [x29, #0x2c0]
    7ad8:      	str	x22, [x29, #0x2b8]
    7adc:      	ldr	x0, [x29, #0x2b8]
    7ae0:      	ldr	q0, [x0]
    7ae4:      	str	q0, [x19]
    7ae8:      	ldr	x1, [x0, #0x10]
    7aec:      	str	x1, [x19, #0x10]
    7af0:      	b	0x7b04 <_stogir.switch.case-inputs+0x40c>
    7af4:      	brk	#0x1
    7af8:      	brk	#0x1
    7afc:      	brk	#0x1
    7b00:      	brk	#0x1
    7b04:      	ldp	x19, x20, [sp, #0x10]
    7b08:      	ldp	x21, x22, [sp, #0x20]
    7b0c:      	ldr	x23, [sp, #0x30]
    7b10:      	ldp	x29, x30, [sp]
    7b14:      	add	sp, sp, #0x2f0
    7b18:      	ret

0000000000007b1c <_stogir.stack.validate-frame-address>:
    7b1c:      	stp	x29, x30, [sp, #-0x180]!
    7b20:      	mov	x29, sp
    7b24:      	stp	x19, x20, [sp, #0x10]
    7b28:      	stp	x21, x22, [sp, #0x20]
    7b2c:      	str	x23, [sp, #0x30]
    7b30:      	mov	x19, x8
    7b34:      	mov	x20, x0
    7b38:      	sxtw	x21, w1
    7b3c:      	add	x8, x29, #0xa0
    7b40:      	mov	x0, x20
    7b44:      	mov	x1, x21
    7b48:      	bl	0x7b48 <_stogir.stack.validate-frame-address+0x2c>
		0000000000007b48:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    7b4c:      	ldr	w0, [x29, #0xa0]
    7b50:      	cmp	x0, #0x0
    7b54:      	b.eq	0x7b68 <_stogir.stack.validate-frame-address+0x4c>
    7b58:      	cmp	x0, #0x1
    7b5c:      	b.eq	0x7b94 <_stogir.stack.validate-frame-address+0x78>
    7b60:      	b	0x7b64 <_stogir.stack.validate-frame-address+0x48>
    7b64:      	b	0x7ce8 <_stogir.stack.validate-frame-address+0x1cc>
    7b68:      	mov	w0, #0x1                ; =1
    7b6c:      	str	w0, [x29, #0xd0]
    7b70:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007b70:  ARM64_RELOC_PAGE21	l_cstr.152
    7b74:      	add	x0, x0, #0x0
		0000000000007b74:  ARM64_RELOC_PAGEOFF12	l_cstr.152
    7b78:      	str	x0, [x29, #0xf0]
    7b7c:      	mov	w0, #0x21               ; =33
    7b80:      	str	x0, [x29, #0xf8]
    7b84:      	ldr	q0, [x29, #0xf0]
    7b88:      	stur	q0, [x29, #0xd8]
    7b8c:      	add	x22, x29, #0xd0
    7b90:      	b	0x7cd4 <_stogir.stack.validate-frame-address+0x1b8>
    7b94:      	ldur	q0, [x29, #0xa8]
    7b98:      	str	q0, [x29, #0x100]
    7b9c:      	cmp	x21, #0x0
    7ba0:      	b.gt	0x7bac <_stogir.stack.validate-frame-address+0x90>
    7ba4:      	mov	w23, #0x1               ; =1
    7ba8:      	b	0x7c8c <_stogir.stack.validate-frame-address+0x170>
    7bac:      	add	x0, x29, #0x100
    7bb0:      	bl	0x7bb0 <_stogir.stack.validate-frame-address+0x94>
		0000000000007bb0:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    7bb4:      	ubfx	x0, x0, #0, #8
    7bb8:      	strb	w0, [x29, #0x110]
    7bbc:      	mov	w0, #0x42               ; =66
    7bc0:      	strb	w0, [x29, #0x111]
    7bc4:      	ldrb	w0, [x29, #0x110]
    7bc8:      	ldrb	w1, [x29, #0x111]
    7bcc:      	cmp	x0, x1
    7bd0:      	b.ne	0x7be0 <_stogir.stack.validate-frame-address+0xc4>
    7bd4:      	mov	w0, #0x0                ; =0
    7bd8:      	str	x0, [x29, #0x170]
    7bdc:      	b	0x7be8 <_stogir.stack.validate-frame-address+0xcc>
    7be0:      	mov	w0, #0x1                ; =1
    7be4:      	str	x0, [x29, #0x170]
    7be8:      	ldr	x0, [x29, #0x170]
    7bec:      	cbz	x0, 0x7bfc <_stogir.stack.validate-frame-address+0xe0>
    7bf0:      	mov	w0, #0x1                ; =1
    7bf4:      	str	x0, [x29, #0x170]
    7bf8:      	b	0x7c88 <_stogir.stack.validate-frame-address+0x16c>
    7bfc:      	add	x0, x29, #0x100
    7c00:      	bl	0x7c00 <_stogir.stack.validate-frame-address+0xe4>
		0000000000007c00:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    7c04:      	ubfx	x0, x0, #0, #8
    7c08:      	strb	w0, [x29, #0x112]
    7c0c:      	mov	w0, #0x6                ; =6
    7c10:      	strb	w0, [x29, #0x113]
    7c14:      	ldrb	w0, [x29, #0x112]
    7c18:      	ldrb	w1, [x29, #0x113]
    7c1c:      	cmp	x0, x1
    7c20:      	b.ne	0x7c30 <_stogir.stack.validate-frame-address+0x114>
    7c24:      	mov	w0, #0x0                ; =0
    7c28:      	str	x0, [x29, #0x178]
    7c2c:      	b	0x7c38 <_stogir.stack.validate-frame-address+0x11c>
    7c30:      	mov	w0, #0x1                ; =1
    7c34:      	str	x0, [x29, #0x178]
    7c38:      	ldr	x0, [x29, #0x178]
    7c3c:      	cbz	x0, 0x7c4c <_stogir.stack.validate-frame-address+0x130>
    7c40:      	mov	w0, #0x1                ; =1
    7c44:      	str	x0, [x29, #0x178]
    7c48:      	b	0x7c80 <_stogir.stack.validate-frame-address+0x164>
    7c4c:      	ldr	x20, [x20, #0x78]
    7c50:      	add	x20, x20, x21, lsl #2
    7c54:      	ldrsw	x20, [x20]
    7c58:      	str	w20, [x29, #0x114]
    7c5c:      	str	wzr, [x29, #0x118]
    7c60:      	ldrsw	x0, [x29, #0x114]
    7c64:      	ldrsw	x1, [x29, #0x118]
    7c68:      	cmp	x0, x1
    7c6c:      	b.ne	0x7c78 <_stogir.stack.validate-frame-address+0x15c>
    7c70:      	mov	w20, #0x0               ; =0
    7c74:      	b	0x7c7c <_stogir.stack.validate-frame-address+0x160>
    7c78:      	mov	w20, #0x1               ; =1
    7c7c:      	str	x20, [x29, #0x178]
    7c80:      	ldr	x0, [x29, #0x178]
    7c84:      	str	x0, [x29, #0x170]
    7c88:      	ldr	x23, [x29, #0x170]
    7c8c:      	cbz	x23, 0x7cc0 <_stogir.stack.validate-frame-address+0x1a4>
    7c90:      	mov	w0, #0x1                ; =1
    7c94:      	str	w0, [x29, #0x120]
    7c98:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007c98:  ARM64_RELOC_PAGE21	l_cstr.153
    7c9c:      	add	x0, x0, #0x0
		0000000000007c9c:  ARM64_RELOC_PAGEOFF12	l_cstr.153
    7ca0:      	str	x0, [x29, #0x140]
    7ca4:      	mov	w0, #0x1e               ; =30
    7ca8:      	str	x0, [x29, #0x148]
    7cac:      	ldr	q0, [x29, #0x140]
    7cb0:      	mov	w16, #0x128             ; =296
    7cb4:      	str	q0, [x29, x16]
    7cb8:      	add	x20, x29, #0x120
    7cbc:      	b	0x7cd0 <_stogir.stack.validate-frame-address+0x1b4>
    7cc0:      	str	wzr, [x29, #0x150]
    7cc4:      	mov	w0, #0x8                ; =8
    7cc8:      	str	w0, [x29, #0x158]
    7ccc:      	add	x20, x29, #0x150
    7cd0:      	mov	x22, x20
    7cd4:      	ldr	q0, [x22]
    7cd8:      	str	q0, [x19]
    7cdc:      	ldr	x0, [x22, #0x10]
    7ce0:      	str	x0, [x19, #0x10]
    7ce4:      	b	0x7cec <_stogir.stack.validate-frame-address+0x1d0>
    7ce8:      	brk	#0x1
    7cec:      	ldp	x19, x20, [sp, #0x10]
    7cf0:      	ldp	x21, x22, [sp, #0x20]
    7cf4:      	ldr	x23, [sp, #0x30]
    7cf8:      	ldp	x29, x30, [sp], #0x180
    7cfc:      	ret

0000000000007d00 <_stogir.stack.validate-scope-inputs>:
    7d00:      	sub	sp, sp, #0x280
    7d04:      	stp	x29, x30, [sp]
    7d08:      	mov	x29, sp
    7d0c:      	stp	x19, x20, [sp, #0x10]
    7d10:      	stp	x21, x22, [sp, #0x20]
    7d14:      	str	x23, [sp, #0x30]
    7d18:      	mov	x19, x8
    7d1c:      	mov	x20, x0
    7d20:      	sxtw	x21, w1
    7d24:      	sxtw	x22, w2
    7d28:      	sxtw	x23, w3
    7d2c:      	sxtw	x4, w4
    7d30:      	cmp	x21, #0x53
    7d34:      	str	x4, [x29, #0x218]
    7d38:      	b.ne	0x7d48 <_stogir.stack.validate-scope-inputs+0x48>
    7d3c:      	mov	w0, #0x1                ; =1
    7d40:      	str	x0, [x29, #0xa8]
    7d44:      	b	0x7d54 <_stogir.stack.validate-scope-inputs+0x54>
    7d48:      	cmp	x21, #0x54
    7d4c:      	cset	x0, eq
    7d50:      	str	x0, [x29, #0xa8]
    7d54:      	ldr	x0, [x29, #0xa8]
    7d58:      	cbz	x0, 0x7d68 <_stogir.stack.validate-scope-inputs+0x68>
    7d5c:      	mov	w0, #0x0                ; =0
    7d60:      	str	x0, [x29, #0xa8]
    7d64:      	b	0x7d70 <_stogir.stack.validate-scope-inputs+0x70>
    7d68:      	mov	w0, #0x1                ; =1
    7d6c:      	str	x0, [x29, #0xa8]
    7d70:      	ldr	x0, [x29, #0xa8]
    7d74:      	cbz	x0, 0x7d84 <_stogir.stack.validate-scope-inputs+0x84>
    7d78:      	mov	w0, #0x1                ; =1
    7d7c:      	str	x0, [x29, #0xa8]
    7d80:      	b	0x7dc4 <_stogir.stack.validate-scope-inputs+0xc4>
    7d84:      	str	w22, [x29, #0xa0]
    7d88:      	cmp	x21, #0x53
    7d8c:      	b.ne	0x7d98 <_stogir.stack.validate-scope-inputs+0x98>
    7d90:      	mov	w22, #0x6               ; =6
    7d94:      	b	0x7d9c <_stogir.stack.validate-scope-inputs+0x9c>
    7d98:      	mov	w22, #0x0               ; =0
    7d9c:      	sxtw	x22, w22
    7da0:      	str	w22, [x29, #0xa4]
    7da4:      	ldrsw	x0, [x29, #0xa0]
    7da8:      	ldrsw	x1, [x29, #0xa4]
    7dac:      	cmp	x0, x1
    7db0:      	b.ne	0x7dbc <_stogir.stack.validate-scope-inputs+0xbc>
    7db4:      	mov	w22, #0x0               ; =0
    7db8:      	b	0x7dc0 <_stogir.stack.validate-scope-inputs+0xc0>
    7dbc:      	mov	w22, #0x1               ; =1
    7dc0:      	str	x22, [x29, #0xa8]
    7dc4:      	ldr	x0, [x29, #0xa8]
    7dc8:      	cbz	x0, 0x7df8 <_stogir.stack.validate-scope-inputs+0xf8>
    7dcc:      	mov	w0, #0x1                ; =1
    7dd0:      	str	w0, [x29, #0xb0]
    7dd4:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007dd4:  ARM64_RELOC_PAGE21	l_cstr.154
    7dd8:      	add	x0, x0, #0x0
		0000000000007dd8:  ARM64_RELOC_PAGEOFF12	l_cstr.154
    7ddc:      	str	x0, [x29, #0xd0]
    7de0:      	mov	w0, #0x22               ; =34
    7de4:      	str	x0, [x29, #0xd8]
    7de8:      	ldr	q0, [x29, #0xd0]
    7dec:      	stur	q0, [x29, #0xb8]
    7df0:      	add	x22, x29, #0xb0
    7df4:      	b	0x8050 <_stogir.stack.validate-scope-inputs+0x350>
    7df8:      	add	x8, x29, #0xe0
    7dfc:      	mov	x0, x20
    7e00:      	mov	x1, x23
    7e04:      	bl	0x7e04 <_stogir.stack.validate-scope-inputs+0x104>
		0000000000007e04:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    7e08:      	ldr	w0, [x29, #0xe0]
    7e0c:      	cmp	x0, #0x0
    7e10:      	b.eq	0x7e24 <_stogir.stack.validate-scope-inputs+0x124>
    7e14:      	cmp	x0, #0x1
    7e18:      	b.eq	0x7e58 <_stogir.stack.validate-scope-inputs+0x158>
    7e1c:      	b	0x7e20 <_stogir.stack.validate-scope-inputs+0x120>
    7e20:      	b	0x8068 <_stogir.stack.validate-scope-inputs+0x368>
    7e24:      	mov	w0, #0x1                ; =1
    7e28:      	str	w0, [x29, #0x110]
    7e2c:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007e2c:  ARM64_RELOC_PAGE21	l_cstr.155
    7e30:      	add	x0, x0, #0x0
		0000000000007e30:  ARM64_RELOC_PAGEOFF12	l_cstr.155
    7e34:      	str	x0, [x29, #0x130]
    7e38:      	mov	w0, #0x1b               ; =27
    7e3c:      	str	x0, [x29, #0x138]
    7e40:      	ldr	q0, [x29, #0x130]
    7e44:      	mov	w16, #0x118             ; =280
    7e48:      	str	q0, [x29, x16]
    7e4c:      	add	x0, x29, #0x110
    7e50:      	str	x0, [x29, #0xa8]
    7e54:      	b	0x804c <_stogir.stack.validate-scope-inputs+0x34c>
    7e58:      	ldur	q0, [x29, #0xe8]
    7e5c:      	str	q0, [x29, #0x140]
    7e60:      	cmp	x23, #0x0
    7e64:      	b.gt	0x7e70 <_stogir.stack.validate-scope-inputs+0x170>
    7e68:      	mov	w23, #0x1               ; =1
    7e6c:      	b	0x7ecc <_stogir.stack.validate-scope-inputs+0x1cc>
    7e70:      	add	x0, x29, #0x140
    7e74:      	bl	0x7e74 <_stogir.stack.validate-scope-inputs+0x174>
		0000000000007e74:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    7e78:      	ubfx	x0, x0, #0, #8
    7e7c:      	sxtw	x0, w0
    7e80:      	bl	0x7e80 <_stogir.stack.validate-scope-inputs+0x180>
		0000000000007e80:  ARM64_RELOC_BRANCH26	_stogir.opcode.control?
    7e84:      	cbz	x0, 0x7e94 <_stogir.stack.validate-scope-inputs+0x194>
    7e88:      	mov	w0, #0x0                ; =0
    7e8c:      	str	x0, [x29, #0x270]
    7e90:      	b	0x7e9c <_stogir.stack.validate-scope-inputs+0x19c>
    7e94:      	mov	w0, #0x1                ; =1
    7e98:      	str	x0, [x29, #0x270]
    7e9c:      	ldr	x0, [x29, #0x270]
    7ea0:      	cbz	x0, 0x7eb0 <_stogir.stack.validate-scope-inputs+0x1b0>
    7ea4:      	mov	w0, #0x1                ; =1
    7ea8:      	str	x0, [x29, #0x270]
    7eac:      	b	0x7ec8 <_stogir.stack.validate-scope-inputs+0x1c8>
    7eb0:      	add	x0, x29, #0x140
    7eb4:      	bl	0x7eb4 <_stogir.stack.validate-scope-inputs+0x1b4>
		0000000000007eb4:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    7eb8:      	ubfx	x0, x0, #0, #8
    7ebc:      	sxtw	x0, w0
    7ec0:      	bl	0x7ec0 <_stogir.stack.validate-scope-inputs+0x1c0>
		0000000000007ec0:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-end?
    7ec4:      	str	x0, [x29, #0x270]
    7ec8:      	ldr	x23, [x29, #0x270]
    7ecc:      	cbz	x23, 0x7f00 <_stogir.stack.validate-scope-inputs+0x200>
    7ed0:      	mov	w0, #0x1                ; =1
    7ed4:      	str	w0, [x29, #0x150]
    7ed8:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007ed8:  ARM64_RELOC_PAGE21	l_cstr.156
    7edc:      	add	x0, x0, #0x0
		0000000000007edc:  ARM64_RELOC_PAGEOFF12	l_cstr.156
    7ee0:      	str	x0, [x29, #0x170]
    7ee4:      	mov	w0, #0x1b               ; =27
    7ee8:      	str	x0, [x29, #0x178]
    7eec:      	ldr	q0, [x29, #0x170]
    7ef0:      	mov	w16, #0x158             ; =344
    7ef4:      	str	q0, [x29, x16]
    7ef8:      	add	x23, x29, #0x150
    7efc:      	b	0x8048 <_stogir.stack.validate-scope-inputs+0x348>
    7f00:      	cmp	x21, #0x53
    7f04:      	b.ne	0x7f1c <_stogir.stack.validate-scope-inputs+0x21c>
    7f08:      	str	wzr, [x29, #0x180]
    7f0c:      	mov	w0, #0x8                ; =8
    7f10:      	str	w0, [x29, #0x188]
    7f14:      	add	x21, x29, #0x180
    7f18:      	b	0x8044 <_stogir.stack.validate-scope-inputs+0x344>
    7f1c:      	add	x8, x29, #0x1a0
    7f20:      	mov	x0, x20
    7f24:      	ldr	x1, [x29, #0x218]
    7f28:      	bl	0x7f28 <_stogir.stack.validate-scope-inputs+0x228>
		0000000000007f28:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    7f2c:      	ldr	w0, [x29, #0x1a0]
    7f30:      	cmp	x0, #0x0
    7f34:      	b.eq	0x7f48 <_stogir.stack.validate-scope-inputs+0x248>
    7f38:      	cmp	x0, #0x1
    7f3c:      	b.eq	0x7f78 <_stogir.stack.validate-scope-inputs+0x278>
    7f40:      	b	0x7f44 <_stogir.stack.validate-scope-inputs+0x244>
    7f44:      	b	0x8064 <_stogir.stack.validate-scope-inputs+0x364>
    7f48:      	mov	w0, #0x1                ; =1
    7f4c:      	str	w0, [x29, #0x1d0]
    7f50:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007f50:  ARM64_RELOC_PAGE21	l_cstr.157
    7f54:      	add	x0, x0, #0x0
		0000000000007f54:  ARM64_RELOC_PAGEOFF12	l_cstr.157
    7f58:      	str	x0, [x29, #0x1f0]
    7f5c:      	mov	w0, #0x1b               ; =27
    7f60:      	str	x0, [x29, #0x1f8]
    7f64:      	ldr	q0, [x29, #0x1f0]
    7f68:      	mov	w16, #0x1d8             ; =472
    7f6c:      	str	q0, [x29, x16]
    7f70:      	add	x20, x29, #0x1d0
    7f74:      	b	0x8040 <_stogir.stack.validate-scope-inputs+0x340>
    7f78:      	mov	w16, #0x1a8             ; =424
    7f7c:      	ldr	q0, [x29, x16]
    7f80:      	str	q0, [x29, #0x200]
    7f84:      	add	x0, x29, #0x200
    7f88:      	bl	0x7f88 <_stogir.stack.validate-scope-inputs+0x288>
		0000000000007f88:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    7f8c:      	ubfx	x0, x0, #0, #8
    7f90:      	strb	w0, [x29, #0x210]
    7f94:      	mov	w0, #0x6                ; =6
    7f98:      	strb	w0, [x29, #0x211]
    7f9c:      	ldrb	w0, [x29, #0x210]
    7fa0:      	ldrb	w1, [x29, #0x211]
    7fa4:      	cmp	x0, x1
    7fa8:      	b.ne	0x7fb8 <_stogir.stack.validate-scope-inputs+0x2b8>
    7fac:      	mov	w0, #0x0                ; =0
    7fb0:      	str	x0, [x29, #0x218]
    7fb4:      	b	0x7fc0 <_stogir.stack.validate-scope-inputs+0x2c0>
    7fb8:      	mov	w0, #0x1                ; =1
    7fbc:      	str	x0, [x29, #0x218]
    7fc0:      	ldr	x0, [x29, #0x218]
    7fc4:      	cbz	x0, 0x7fd4 <_stogir.stack.validate-scope-inputs+0x2d4>
    7fc8:      	mov	w0, #0x1                ; =1
    7fcc:      	str	x0, [x29, #0x218]
    7fd0:      	b	0x7fec <_stogir.stack.validate-scope-inputs+0x2ec>
    7fd4:      	add	x0, x29, #0x200
    7fd8:      	bl	0x7fd8 <_stogir.stack.validate-scope-inputs+0x2d8>
		0000000000007fd8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    7fdc:      	ubfx	x0, x0, #0, #8
    7fe0:      	cmp	x0, #0x48
    7fe4:      	cset	x0, eq
    7fe8:      	str	x0, [x29, #0x218]
    7fec:      	ldr	x0, [x29, #0x218]
    7ff0:      	cbz	x0, 0x8028 <_stogir.stack.validate-scope-inputs+0x328>
    7ff4:      	mov	w0, #0x1                ; =1
    7ff8:      	str	w0, [x29, #0x220]
    7ffc:      	adrp	x0, 0x7000 <_stogir.opcode.control?+0xc>
		0000000000007ffc:  ARM64_RELOC_PAGE21	l_cstr.158
    8000:      	add	x0, x0, #0x0
		0000000000008000:  ARM64_RELOC_PAGEOFF12	l_cstr.158
    8004:      	str	x0, [x29, #0x240]
    8008:      	mov	w0, #0x29               ; =41
    800c:      	str	x0, [x29, #0x248]
    8010:      	ldr	q0, [x29, #0x240]
    8014:      	mov	w16, #0x228             ; =552
    8018:      	str	q0, [x29, x16]
    801c:      	add	x0, x29, #0x220
    8020:      	str	x0, [x29, #0x218]
    8024:      	b	0x803c <_stogir.stack.validate-scope-inputs+0x33c>
    8028:      	str	wzr, [x29, #0x250]
    802c:      	mov	w0, #0x8                ; =8
    8030:      	str	w0, [x29, #0x258]
    8034:      	add	x0, x29, #0x250
    8038:      	str	x0, [x29, #0x218]
    803c:      	ldr	x20, [x29, #0x218]
    8040:      	mov	x21, x20
    8044:      	mov	x23, x21
    8048:      	str	x23, [x29, #0xa8]
    804c:      	ldr	x22, [x29, #0xa8]
    8050:      	ldr	q0, [x22]
    8054:      	str	q0, [x19]
    8058:      	ldr	x0, [x22, #0x10]
    805c:      	str	x0, [x19, #0x10]
    8060:      	b	0x806c <_stogir.stack.validate-scope-inputs+0x36c>
    8064:      	brk	#0x1
    8068:      	brk	#0x1
    806c:      	ldp	x19, x20, [sp, #0x10]
    8070:      	ldp	x21, x22, [sp, #0x20]
    8074:      	ldr	x23, [sp, #0x30]
    8078:      	ldp	x29, x30, [sp]
    807c:      	add	sp, sp, #0x280
    8080:      	ret

0000000000008084 <_stogir.stack.validate-inputs>:
    8084:      	sub	sp, sp, #0x2e0
    8088:      	stp	x29, x30, [sp]
    808c:      	mov	x29, sp
    8090:      	stp	x19, x20, [sp, #0x10]
    8094:      	stp	x21, x22, [sp, #0x20]
    8098:      	str	x23, [sp, #0x30]
    809c:      	mov	x19, x8
    80a0:      	mov	x20, x0
    80a4:      	sxtw	x21, w1
    80a8:      	sxtw	x22, w2
    80ac:      	sxtw	x23, w3
    80b0:      	sxtw	x4, w4
    80b4:      	sxtw	x5, w5
    80b8:      	cmp	x21, #0x51
    80bc:      	str	x4, [x29, #0x2b0]
    80c0:      	str	x5, [x29, #0x2b8]
    80c4:      	b.ne	0x80d4 <_stogir.stack.validate-inputs+0x50>
    80c8:      	mov	w0, #0x1                ; =1
    80cc:      	str	x0, [x29, #0x2c0]
    80d0:      	b	0x80e0 <_stogir.stack.validate-inputs+0x5c>
    80d4:      	cmp	x21, #0x52
    80d8:      	cset	x0, eq
    80dc:      	str	x0, [x29, #0x2c0]
    80e0:      	ldr	x0, [x29, #0x2c0]
    80e4:      	cbz	x0, 0x80f4 <_stogir.stack.validate-inputs+0x70>
    80e8:      	mov	w0, #0x0                ; =0
    80ec:      	str	x0, [x29, #0x2c0]
    80f0:      	b	0x80fc <_stogir.stack.validate-inputs+0x78>
    80f4:      	mov	w0, #0x1                ; =1
    80f8:      	str	x0, [x29, #0x2c0]
    80fc:      	ldr	x0, [x29, #0x2c0]
    8100:      	cbz	x0, 0x8110 <_stogir.stack.validate-inputs+0x8c>
    8104:      	mov	w0, #0x1                ; =1
    8108:      	str	x0, [x29, #0x2c0]
    810c:      	b	0x81e8 <_stogir.stack.validate-inputs+0x164>
    8110:      	str	w22, [x29, #0xa0]
    8114:      	cmp	x21, #0x51
    8118:      	b.ne	0x8124 <_stogir.stack.validate-inputs+0xa0>
    811c:      	mov	w22, #0x6               ; =6
    8120:      	b	0x8128 <_stogir.stack.validate-inputs+0xa4>
    8124:      	mov	w22, #0x0               ; =0
    8128:      	sxtw	x22, w22
    812c:      	str	w22, [x29, #0xa4]
    8130:      	ldrsw	x0, [x29, #0xa0]
    8134:      	ldrsw	x1, [x29, #0xa4]
    8138:      	cmp	x0, x1
    813c:      	b.ne	0x8148 <_stogir.stack.validate-inputs+0xc4>
    8140:      	mov	w22, #0x0               ; =0
    8144:      	b	0x814c <_stogir.stack.validate-inputs+0xc8>
    8148:      	mov	w22, #0x1               ; =1
    814c:      	cbz	x22, 0x8158 <_stogir.stack.validate-inputs+0xd4>
    8150:      	mov	w22, #0x1               ; =1
    8154:      	b	0x81e4 <_stogir.stack.validate-inputs+0x160>
    8158:      	cmp	x21, #0x51
    815c:      	b.ne	0x81d8 <_stogir.stack.validate-inputs+0x154>
    8160:      	ldr	x0, [x29, #0x2b8]
    8164:      	str	w0, [x29, #0xa8]
    8168:      	str	wzr, [x29, #0xac]
    816c:      	ldrsw	x1, [x29, #0xa8]
    8170:      	ldrsw	x2, [x29, #0xac]
    8174:      	cmp	x1, x2
    8178:      	b.ne	0x8188 <_stogir.stack.validate-inputs+0x104>
    817c:      	mov	w1, #0x0                ; =0
    8180:      	str	x1, [x29, #0x2c8]
    8184:      	b	0x8190 <_stogir.stack.validate-inputs+0x10c>
    8188:      	mov	w0, #0x1                ; =1
    818c:      	str	x0, [x29, #0x2c8]
    8190:      	ldr	x0, [x29, #0x2c8]
    8194:      	cbz	x0, 0x81c4 <_stogir.stack.validate-inputs+0x140>
    8198:      	ldr	x0, [x29, #0x2b8]
    819c:      	bl	0x819c <_stogir.stack.validate-inputs+0x118>
		000000000000819c:  ARM64_RELOC_BRANCH26	_stogir.frame.valid-alignment?
    81a0:      	cbz	x0, 0x81b0 <_stogir.stack.validate-inputs+0x12c>
    81a4:      	mov	w0, #0x0                ; =0
    81a8:      	str	x0, [x29, #0x2c8]
    81ac:      	b	0x81b8 <_stogir.stack.validate-inputs+0x134>
    81b0:      	mov	w0, #0x1                ; =1
    81b4:      	str	x0, [x29, #0x2c8]
    81b8:      	ldr	x0, [x29, #0x2c8]
    81bc:      	str	x0, [x29, #0x2d0]
    81c0:      	b	0x81cc <_stogir.stack.validate-inputs+0x148>
    81c4:      	mov	w0, #0x0                ; =0
    81c8:      	str	x0, [x29, #0x2d0]
    81cc:      	ldr	x0, [x29, #0x2d0]
    81d0:      	str	x0, [x29, #0x2c8]
    81d4:      	b	0x81e0 <_stogir.stack.validate-inputs+0x15c>
    81d8:      	mov	w0, #0x0                ; =0
    81dc:      	str	x0, [x29, #0x2c8]
    81e0:      	ldr	x22, [x29, #0x2c8]
    81e4:      	str	x22, [x29, #0x2c0]
    81e8:      	ldr	x0, [x29, #0x2c0]
    81ec:      	cbz	x0, 0x821c <_stogir.stack.validate-inputs+0x198>
    81f0:      	mov	w0, #0x1                ; =1
    81f4:      	str	w0, [x29, #0xb0]
    81f8:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		00000000000081f8:  ARM64_RELOC_PAGE21	l_cstr.159
    81fc:      	add	x0, x0, #0x0
		00000000000081fc:  ARM64_RELOC_PAGEOFF12	l_cstr.159
    8200:      	str	x0, [x29, #0xd0]
    8204:      	mov	w0, #0x29               ; =41
    8208:      	str	x0, [x29, #0xd8]
    820c:      	ldr	q0, [x29, #0xd0]
    8210:      	stur	q0, [x29, #0xb8]
    8214:      	add	x22, x29, #0xb0
    8218:      	b	0x8530 <_stogir.stack.validate-inputs+0x4ac>
    821c:      	add	x8, x29, #0xe0
    8220:      	mov	x0, x20
    8224:      	mov	x1, x23
    8228:      	bl	0x8228 <_stogir.stack.validate-inputs+0x1a4>
		0000000000008228:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    822c:      	ldr	w0, [x29, #0xe0]
    8230:      	cmp	x0, #0x0
    8234:      	b.eq	0x8248 <_stogir.stack.validate-inputs+0x1c4>
    8238:      	cmp	x0, #0x1
    823c:      	b.eq	0x827c <_stogir.stack.validate-inputs+0x1f8>
    8240:      	b	0x8244 <_stogir.stack.validate-inputs+0x1c0>
    8244:      	b	0x8548 <_stogir.stack.validate-inputs+0x4c4>
    8248:      	mov	w0, #0x1                ; =1
    824c:      	str	w0, [x29, #0x110]
    8250:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		0000000000008250:  ARM64_RELOC_PAGE21	l_cstr.160
    8254:      	add	x0, x0, #0x0
		0000000000008254:  ARM64_RELOC_PAGEOFF12	l_cstr.160
    8258:      	str	x0, [x29, #0x130]
    825c:      	mov	w0, #0x1f               ; =31
    8260:      	str	x0, [x29, #0x138]
    8264:      	ldr	q0, [x29, #0x130]
    8268:      	mov	w16, #0x118             ; =280
    826c:      	str	q0, [x29, x16]
    8270:      	add	x0, x29, #0x110
    8274:      	str	x0, [x29, #0x2c0]
    8278:      	b	0x852c <_stogir.stack.validate-inputs+0x4a8>
    827c:      	ldur	q0, [x29, #0xe8]
    8280:      	str	q0, [x29, #0x140]
    8284:      	cmp	x23, #0x0
    8288:      	b.gt	0x8294 <_stogir.stack.validate-inputs+0x210>
    828c:      	mov	w23, #0x1               ; =1
    8290:      	b	0x82f0 <_stogir.stack.validate-inputs+0x26c>
    8294:      	add	x0, x29, #0x140
    8298:      	bl	0x8298 <_stogir.stack.validate-inputs+0x214>
		0000000000008298:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    829c:      	ubfx	x0, x0, #0, #8
    82a0:      	sxtw	x0, w0
    82a4:      	bl	0x82a4 <_stogir.stack.validate-inputs+0x220>
		00000000000082a4:  ARM64_RELOC_BRANCH26	_stogir.opcode.control?
    82a8:      	cbz	x0, 0x82b8 <_stogir.stack.validate-inputs+0x234>
    82ac:      	mov	w0, #0x0                ; =0
    82b0:      	str	x0, [x29, #0x2c8]
    82b4:      	b	0x82c0 <_stogir.stack.validate-inputs+0x23c>
    82b8:      	mov	w0, #0x1                ; =1
    82bc:      	str	x0, [x29, #0x2c8]
    82c0:      	ldr	x0, [x29, #0x2c8]
    82c4:      	cbz	x0, 0x82d4 <_stogir.stack.validate-inputs+0x250>
    82c8:      	mov	w0, #0x1                ; =1
    82cc:      	str	x0, [x29, #0x2c8]
    82d0:      	b	0x82ec <_stogir.stack.validate-inputs+0x268>
    82d4:      	add	x0, x29, #0x140
    82d8:      	bl	0x82d8 <_stogir.stack.validate-inputs+0x254>
		00000000000082d8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    82dc:      	ubfx	x0, x0, #0, #8
    82e0:      	sxtw	x0, w0
    82e4:      	bl	0x82e4 <_stogir.stack.validate-inputs+0x260>
		00000000000082e4:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-end?
    82e8:      	str	x0, [x29, #0x2c8]
    82ec:      	ldr	x23, [x29, #0x2c8]
    82f0:      	cbz	x23, 0x8324 <_stogir.stack.validate-inputs+0x2a0>
    82f4:      	mov	w0, #0x1                ; =1
    82f8:      	str	w0, [x29, #0x150]
    82fc:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		00000000000082fc:  ARM64_RELOC_PAGE21	l_cstr.161
    8300:      	add	x0, x0, #0x0
		0000000000008300:  ARM64_RELOC_PAGEOFF12	l_cstr.161
    8304:      	str	x0, [x29, #0x170]
    8308:      	mov	w0, #0x1f               ; =31
    830c:      	str	x0, [x29, #0x178]
    8310:      	ldr	q0, [x29, #0x170]
    8314:      	mov	w16, #0x158             ; =344
    8318:      	str	q0, [x29, x16]
    831c:      	add	x23, x29, #0x150
    8320:      	b	0x8528 <_stogir.stack.validate-inputs+0x4a4>
    8324:      	add	x8, x29, #0x180
    8328:      	mov	x0, x20
    832c:      	ldr	x1, [x29, #0x2b0]
    8330:      	bl	0x8330 <_stogir.stack.validate-inputs+0x2ac>
		0000000000008330:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    8334:      	ldr	w0, [x29, #0x180]
    8338:      	cmp	x0, #0x0
    833c:      	b.eq	0x8350 <_stogir.stack.validate-inputs+0x2cc>
    8340:      	cmp	x0, #0x1
    8344:      	b.eq	0x8384 <_stogir.stack.validate-inputs+0x300>
    8348:      	b	0x834c <_stogir.stack.validate-inputs+0x2c8>
    834c:      	b	0x8544 <_stogir.stack.validate-inputs+0x4c0>
    8350:      	mov	w0, #0x1                ; =1
    8354:      	str	w0, [x29, #0x1b0]
    8358:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		0000000000008358:  ARM64_RELOC_PAGE21	l_cstr.162
    835c:      	add	x0, x0, #0x0
		000000000000835c:  ARM64_RELOC_PAGEOFF12	l_cstr.162
    8360:      	str	x0, [x29, #0x1d0]
    8364:      	mov	w0, #0x18               ; =24
    8368:      	str	x0, [x29, #0x1d8]
    836c:      	ldr	q0, [x29, #0x1d0]
    8370:      	mov	w16, #0x1b8             ; =440
    8374:      	str	q0, [x29, x16]
    8378:      	add	x0, x29, #0x1b0
    837c:      	str	x0, [x29, #0x2c8]
    8380:      	b	0x8524 <_stogir.stack.validate-inputs+0x4a0>
    8384:      	mov	w16, #0x188             ; =392
    8388:      	ldr	q0, [x29, x16]
    838c:      	str	q0, [x29, #0x1e0]
    8390:      	add	x0, x29, #0x1e0
    8394:      	bl	0x8394 <_stogir.stack.validate-inputs+0x310>
		0000000000008394:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    8398:      	ubfx	x0, x0, #0, #8
    839c:      	sxtw	x0, w0
    83a0:      	bl	0x83a0 <_stogir.stack.validate-inputs+0x31c>
		00000000000083a0:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    83a4:      	cbz	x0, 0x83b4 <_stogir.stack.validate-inputs+0x330>
    83a8:      	mov	w0, #0x0                ; =0
    83ac:      	str	x0, [x29, #0x2d0]
    83b0:      	b	0x83bc <_stogir.stack.validate-inputs+0x338>
    83b4:      	mov	w0, #0x1                ; =1
    83b8:      	str	x0, [x29, #0x2d0]
    83bc:      	ldr	x0, [x29, #0x2d0]
    83c0:      	cbz	x0, 0x83d0 <_stogir.stack.validate-inputs+0x34c>
    83c4:      	mov	w0, #0x1                ; =1
    83c8:      	str	x0, [x29, #0x2d0]
    83cc:      	b	0x83e8 <_stogir.stack.validate-inputs+0x364>
    83d0:      	add	x0, x29, #0x1e0
    83d4:      	bl	0x83d4 <_stogir.stack.validate-inputs+0x350>
		00000000000083d4:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    83d8:      	ubfx	x0, x0, #0, #8
    83dc:      	cmp	x0, #0x48
    83e0:      	cset	x0, eq
    83e4:      	str	x0, [x29, #0x2d0]
    83e8:      	ldr	x0, [x29, #0x2d0]
    83ec:      	cbz	x0, 0x8424 <_stogir.stack.validate-inputs+0x3a0>
    83f0:      	mov	w0, #0x1                ; =1
    83f4:      	str	w0, [x29, #0x1f0]
    83f8:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		00000000000083f8:  ARM64_RELOC_PAGE21	l_cstr.163
    83fc:      	add	x0, x0, #0x0
		00000000000083fc:  ARM64_RELOC_PAGEOFF12	l_cstr.163
    8400:      	str	x0, [x29, #0x210]
    8404:      	mov	w0, #0x29               ; =41
    8408:      	str	x0, [x29, #0x218]
    840c:      	ldr	q0, [x29, #0x210]
    8410:      	mov	w16, #0x1f8             ; =504
    8414:      	str	q0, [x29, x16]
    8418:      	add	x0, x29, #0x1f0
    841c:      	str	x0, [x29, #0x2d0]
    8420:      	b	0x851c <_stogir.stack.validate-inputs+0x498>
    8424:      	ldr	x0, [x29, #0x2b0]
    8428:      	cmp	x0, #0x0
    842c:      	b.ge	0x84f0 <_stogir.stack.validate-inputs+0x46c>
    8430:      	cmp	x21, #0x51
    8434:      	b.ne	0x844c <_stogir.stack.validate-inputs+0x3c8>
    8438:      	ldr	x1, [x29, #0x2b8]
    843c:      	cmp	x1, #0x10
    8440:      	cset	x2, gt
    8444:      	mov	x21, x2
    8448:      	b	0x8450 <_stogir.stack.validate-inputs+0x3cc>
    844c:      	mov	w21, #0x0               ; =0
    8450:      	cbz	x21, 0x845c <_stogir.stack.validate-inputs+0x3d8>
    8454:      	ldr	x21, [x29, #0x2b8]
    8458:      	b	0x8460 <_stogir.stack.validate-inputs+0x3dc>
    845c:      	mov	w21, #0x10              ; =16
    8460:      	add	x8, x29, #0x220
    8464:      	mov	x0, x20
    8468:      	ldr	x1, [x29, #0x2b0]
    846c:      	mov	x2, x21
    8470:      	bl	0x8470 <_stogir.stack.validate-inputs+0x3ec>
		0000000000008470:  ARM64_RELOC_BRANCH26	_stogir.stack.constant-size-aligned
    8474:      	ldr	w0, [x29, #0x220]
    8478:      	cmp	x0, #0x0
    847c:      	b.eq	0x84b8 <_stogir.stack.validate-inputs+0x434>
    8480:      	cmp	x0, #0x1
    8484:      	b.eq	0x8490 <_stogir.stack.validate-inputs+0x40c>
    8488:      	b	0x848c <_stogir.stack.validate-inputs+0x408>
    848c:      	b	0x84ec <_stogir.stack.validate-inputs+0x468>
    8490:      	mov	w16, #0x228             ; =552
    8494:      	ldr	q0, [x29, x16]
    8498:      	str	q0, [x29, #0x240]
    849c:      	mov	w0, #0x1                ; =1
    84a0:      	str	w0, [x29, #0x250]
    84a4:      	ldr	q0, [x29, #0x240]
    84a8:      	mov	w16, #0x258             ; =600
    84ac:      	str	q0, [x29, x16]
    84b0:      	add	x20, x29, #0x250
    84b4:      	b	0x84e4 <_stogir.stack.validate-inputs+0x460>
    84b8:      	ldr	x0, [x29, #0x228]
    84bc:      	str	wzr, [x29, #0x270]
    84c0:      	add	x0, x29, #0x1e0
    84c4:      	bl	0x84c4 <_stogir.stack.validate-inputs+0x440>
		00000000000084c4:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    84c8:      	ubfx	x0, x0, #0, #8
    84cc:      	sxtw	x0, w0
    84d0:      	mov	w1, #0x8                ; =8
    84d4:      	bl	0x84d4 <_stogir.stack.validate-inputs+0x450>
		00000000000084d4:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    84d8:      	sxtw	x0, w0
    84dc:      	str	w0, [x29, #0x278]
    84e0:      	add	x20, x29, #0x270
    84e4:      	mov	x21, x20
    84e8:      	b	0x8518 <_stogir.stack.validate-inputs+0x494>
    84ec:      	brk	#0x1
    84f0:      	str	wzr, [x29, #0x290]
    84f4:      	add	x0, x29, #0x1e0
    84f8:      	bl	0x84f8 <_stogir.stack.validate-inputs+0x474>
		00000000000084f8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    84fc:      	ubfx	x0, x0, #0, #8
    8500:      	sxtw	x0, w0
    8504:      	mov	w1, #0x8                ; =8
    8508:      	bl	0x8508 <_stogir.stack.validate-inputs+0x484>
		0000000000008508:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    850c:      	sxtw	x0, w0
    8510:      	str	w0, [x29, #0x298]
    8514:      	add	x21, x29, #0x290
    8518:      	str	x21, [x29, #0x2d0]
    851c:      	ldr	x0, [x29, #0x2d0]
    8520:      	str	x0, [x29, #0x2c8]
    8524:      	ldr	x23, [x29, #0x2c8]
    8528:      	str	x23, [x29, #0x2c0]
    852c:      	ldr	x22, [x29, #0x2c0]
    8530:      	ldr	q0, [x22]
    8534:      	str	q0, [x19]
    8538:      	ldr	x0, [x22, #0x10]
    853c:      	str	x0, [x19, #0x10]
    8540:      	b	0x854c <_stogir.stack.validate-inputs+0x4c8>
    8544:      	brk	#0x1
    8548:      	brk	#0x1
    854c:      	ldp	x19, x20, [sp, #0x10]
    8550:      	ldp	x21, x22, [sp, #0x20]
    8554:      	ldr	x23, [sp, #0x30]
    8558:      	ldp	x29, x30, [sp]
    855c:      	add	sp, sp, #0x2e0
    8560:      	ret

0000000000008564 <_stogir.locals.shape>:
    8564:      	sub	sp, sp, #0x2a0
    8568:      	stp	x29, x30, [sp]
    856c:      	mov	x29, sp
    8570:      	stp	x19, x20, [sp, #0x10]
    8574:      	stp	x21, x22, [sp, #0x20]
    8578:      	str	x23, [sp, #0x30]
    857c:      	mov	x19, x8
    8580:      	mov	x20, x0
    8584:      	sxtw	x21, w1
    8588:      	sxtw	x22, w2
    858c:      	add	x8, x29, #0xa0
    8590:      	mov	x0, x20
    8594:      	mov	x1, x21
    8598:      	bl	0x8598 <_stogir.locals.shape+0x34>
		0000000000008598:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    859c:      	ldr	w0, [x29, #0xa0]
    85a0:      	cmp	x0, #0x0
    85a4:      	b.eq	0x85b8 <_stogir.locals.shape+0x54>
    85a8:      	cmp	x0, #0x1
    85ac:      	b.eq	0x85e4 <_stogir.locals.shape+0x80>
    85b0:      	b	0x85b4 <_stogir.locals.shape+0x50>
    85b4:      	b	0x8968 <_stogir.locals.shape+0x404>
    85b8:      	mov	w0, #0x1                ; =1
    85bc:      	str	w0, [x29, #0xd0]
    85c0:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		00000000000085c0:  ARM64_RELOC_PAGE21	l_cstr.164
    85c4:      	add	x0, x0, #0x0
		00000000000085c4:  ARM64_RELOC_PAGEOFF12	l_cstr.164
    85c8:      	str	x0, [x29, #0xf0]
    85cc:      	mov	w0, #0x16               ; =22
    85d0:      	str	x0, [x29, #0xf8]
    85d4:      	ldr	q0, [x29, #0xf0]
    85d8:      	stur	q0, [x29, #0xd8]
    85dc:      	add	x23, x29, #0xd0
    85e0:      	b	0x8950 <_stogir.locals.shape+0x3ec>
    85e4:      	ldur	q0, [x29, #0xa8]
    85e8:      	str	q0, [x29, #0x100]
    85ec:      	add	x0, x29, #0x100
    85f0:      	bl	0x85f0 <_stogir.locals.shape+0x8c>
		00000000000085f0:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    85f4:      	ubfx	x0, x0, #0, #8
    85f8:      	sxtw	x0, w0
    85fc:      	mov	x1, x22
    8600:      	bl	0x8600 <_stogir.locals.shape+0x9c>
		0000000000008600:  ARM64_RELOC_BRANCH26	_stogir.types.size
    8604:      	sxtw	x22, w0
    8608:      	ldrsw	x0, [x29, #0x10c]
    860c:      	cmp	x0, #0x0
    8610:      	b.ne	0x861c <_stogir.locals.shape+0xb8>
    8614:      	str	x22, [x29, #0x270]
    8618:      	b	0x8624 <_stogir.locals.shape+0xc0>
    861c:      	ldrsw	x0, [x29, #0x10c]
    8620:      	str	x0, [x29, #0x270]
    8624:      	ldrsw	x0, [x29, #0x108]
    8628:      	cmp	x0, #0x0
    862c:      	cset	x0, eq
    8630:      	ldrsw	x1, [x29, #0x108]
    8634:      	cmp	x1, #0x0
    8638:      	str	x0, [x29, #0x278]
    863c:      	b.le	0x86a8 <_stogir.locals.shape+0x144>
    8640:      	add	x1, x20, #0x110
    8644:      	ldrsw	x2, [x29, #0x108]
    8648:      	add	x8, x29, #0x110
    864c:      	mov	x9, x0
    8650:      	mov	x0, x1
    8654:      	mov	x1, x2
    8658:      	bl	0x8658 <_stogir.locals.shape+0xf4>
		0000000000008658:  ARM64_RELOC_BRANCH26	_stogir.strings.lookup
    865c:      	ldr	w0, [x29, #0x110]
    8660:      	cmp	x0, #0x0
    8664:      	b.eq	0x8678 <_stogir.locals.shape+0x114>
    8668:      	cmp	x0, #0x1
    866c:      	b.eq	0x8684 <_stogir.locals.shape+0x120>
    8670:      	b	0x8674 <_stogir.locals.shape+0x110>
    8674:      	b	0x86a4 <_stogir.locals.shape+0x140>
    8678:      	ldr	x0, [x29, #0x278]
    867c:      	str	x0, [x29, #0x280]
    8680:      	b	0x8698 <_stogir.locals.shape+0x134>
    8684:      	mov	w16, #0x118             ; =280
    8688:      	ldr	q0, [x29, x16]
    868c:      	str	q0, [x29, #0x130]
    8690:      	mov	w0, #0x1                ; =1
    8694:      	str	x0, [x29, #0x280]
    8698:      	ldr	x0, [x29, #0x280]
    869c:      	str	x0, [x29, #0x288]
    86a0:      	b	0x86b0 <_stogir.locals.shape+0x14c>
    86a4:      	brk	#0x1
    86a8:      	ldr	x0, [x29, #0x278]
    86ac:      	str	x0, [x29, #0x288]
    86b0:      	cmp	x21, #0x0
    86b4:      	b.gt	0x86c4 <_stogir.locals.shape+0x160>
    86b8:      	mov	w0, #0x1                ; =1
    86bc:      	str	x0, [x29, #0x278]
    86c0:      	b	0x87d8 <_stogir.locals.shape+0x274>
    86c4:      	add	x0, x29, #0x100
    86c8:      	bl	0x86c8 <_stogir.locals.shape+0x164>
		00000000000086c8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    86cc:      	ubfx	x0, x0, #0, #8
    86d0:      	strb	w0, [x29, #0x140]
    86d4:      	mov	w0, #0x48               ; =72
    86d8:      	strb	w0, [x29, #0x141]
    86dc:      	ldrb	w0, [x29, #0x140]
    86e0:      	ldrb	w1, [x29, #0x141]
    86e4:      	cmp	x0, x1
    86e8:      	b.ne	0x86f8 <_stogir.locals.shape+0x194>
    86ec:      	mov	w0, #0x0                ; =0
    86f0:      	str	x0, [x29, #0x280]
    86f4:      	b	0x8700 <_stogir.locals.shape+0x19c>
    86f8:      	mov	w0, #0x1                ; =1
    86fc:      	str	x0, [x29, #0x280]
    8700:      	ldr	x0, [x29, #0x280]
    8704:      	cbz	x0, 0x8714 <_stogir.locals.shape+0x1b0>
    8708:      	mov	w0, #0x1                ; =1
    870c:      	str	x0, [x29, #0x280]
    8710:      	b	0x87d0 <_stogir.locals.shape+0x26c>
    8714:      	ldr	x0, [x20, #0x78]
    8718:      	add	x0, x0, x21, lsl #2
    871c:      	ldrsw	x0, [x0]
    8720:      	str	w0, [x29, #0x144]
    8724:      	mov	w0, #0x3                ; =3
    8728:      	str	w0, [x29, #0x148]
    872c:      	ldrsw	x0, [x29, #0x144]
    8730:      	ldrsw	x1, [x29, #0x148]
    8734:      	cmp	x0, x1
    8738:      	b.ne	0x8744 <_stogir.locals.shape+0x1e0>
    873c:      	mov	w21, #0x0               ; =0
    8740:      	b	0x8748 <_stogir.locals.shape+0x1e4>
    8744:      	mov	w21, #0x1               ; =1
    8748:      	cbz	x21, 0x8754 <_stogir.locals.shape+0x1f0>
    874c:      	mov	w21, #0x1               ; =1
    8750:      	b	0x87cc <_stogir.locals.shape+0x268>
    8754:      	cmp	x22, #0x0
    8758:      	b.gt	0x8768 <_stogir.locals.shape+0x204>
    875c:      	mov	w0, #0x1                ; =1
    8760:      	str	x0, [x29, #0x290]
    8764:      	b	0x87c8 <_stogir.locals.shape+0x264>
    8768:      	ldr	x0, [x29, #0x288]
    876c:      	cbz	x0, 0x877c <_stogir.locals.shape+0x218>
    8770:      	mov	w0, #0x0                ; =0
    8774:      	str	x0, [x29, #0x288]
    8778:      	b	0x8784 <_stogir.locals.shape+0x220>
    877c:      	mov	w0, #0x1                ; =1
    8780:      	str	x0, [x29, #0x288]
    8784:      	ldr	x0, [x29, #0x288]
    8788:      	cbz	x0, 0x8798 <_stogir.locals.shape+0x234>
    878c:      	mov	w0, #0x1                ; =1
    8790:      	str	x0, [x29, #0x288]
    8794:      	b	0x87c0 <_stogir.locals.shape+0x25c>
    8798:      	ldr	x0, [x29, #0x270]
    879c:      	bl	0x879c <_stogir.locals.shape+0x238>
		000000000000879c:  ARM64_RELOC_BRANCH26	_stogir.frame.valid-alignment?
    87a0:      	cbz	x0, 0x87b0 <_stogir.locals.shape+0x24c>
    87a4:      	mov	w0, #0x0                ; =0
    87a8:      	str	x0, [x29, #0x298]
    87ac:      	b	0x87b8 <_stogir.locals.shape+0x254>
    87b0:      	mov	w0, #0x1                ; =1
    87b4:      	str	x0, [x29, #0x298]
    87b8:      	ldr	x0, [x29, #0x298]
    87bc:      	str	x0, [x29, #0x288]
    87c0:      	ldr	x0, [x29, #0x288]
    87c4:      	str	x0, [x29, #0x290]
    87c8:      	ldr	x21, [x29, #0x290]
    87cc:      	str	x21, [x29, #0x280]
    87d0:      	ldr	x0, [x29, #0x280]
    87d4:      	str	x0, [x29, #0x278]
    87d8:      	ldr	x0, [x29, #0x278]
    87dc:      	cbz	x0, 0x8810 <_stogir.locals.shape+0x2ac>
    87e0:      	mov	w0, #0x1                ; =1
    87e4:      	str	w0, [x29, #0x150]
    87e8:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		00000000000087e8:  ARM64_RELOC_PAGE21	l_cstr.165
    87ec:      	add	x0, x0, #0x0
		00000000000087ec:  ARM64_RELOC_PAGEOFF12	l_cstr.165
    87f0:      	str	x0, [x29, #0x170]
    87f4:      	mov	w0, #0x1c               ; =28
    87f8:      	str	x0, [x29, #0x178]
    87fc:      	ldr	q0, [x29, #0x170]
    8800:      	mov	w16, #0x158             ; =344
    8804:      	str	q0, [x29, x16]
    8808:      	add	x21, x29, #0x150
    880c:      	b	0x894c <_stogir.locals.shape+0x3e8>
    8810:      	ldrsw	x0, [x29, #0x104]
    8814:      	add	x8, x29, #0x180
    8818:      	mov	x9, x0
    881c:      	mov	x0, x20
    8820:      	mov	x1, x9
    8824:      	bl	0x8824 <_stogir.locals.shape+0x2c0>
		0000000000008824:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    8828:      	ldr	w0, [x29, #0x180]
    882c:      	cmp	x0, #0x0
    8830:      	b.eq	0x8844 <_stogir.locals.shape+0x2e0>
    8834:      	cmp	x0, #0x1
    8838:      	b.eq	0x8874 <_stogir.locals.shape+0x310>
    883c:      	b	0x8840 <_stogir.locals.shape+0x2dc>
    8840:      	b	0x8964 <_stogir.locals.shape+0x400>
    8844:      	mov	w0, #0x1                ; =1
    8848:      	str	w0, [x29, #0x1b0]
    884c:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		000000000000884c:  ARM64_RELOC_PAGE21	l_cstr.166
    8850:      	add	x0, x0, #0x0
		0000000000008850:  ARM64_RELOC_PAGEOFF12	l_cstr.166
    8854:      	str	x0, [x29, #0x1d0]
    8858:      	mov	w0, #0x1d               ; =29
    885c:      	str	x0, [x29, #0x1d8]
    8860:      	ldr	q0, [x29, #0x1d0]
    8864:      	mov	w16, #0x1b8             ; =440
    8868:      	str	q0, [x29, x16]
    886c:      	add	x20, x29, #0x1b0
    8870:      	b	0x8948 <_stogir.locals.shape+0x3e4>
    8874:      	mov	w16, #0x188             ; =392
    8878:      	ldr	q0, [x29, x16]
    887c:      	str	q0, [x29, #0x1e0]
    8880:      	ldrsw	x0, [x29, #0x104]
    8884:      	cmp	x0, #0x0
    8888:      	b.gt	0x8898 <_stogir.locals.shape+0x334>
    888c:      	mov	w0, #0x1                ; =1
    8890:      	str	x0, [x29, #0x278]
    8894:      	b	0x88cc <_stogir.locals.shape+0x368>
    8898:      	add	x0, x29, #0x1e0
    889c:      	bl	0x889c <_stogir.locals.shape+0x338>
		000000000000889c:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    88a0:      	ubfx	x0, x0, #0, #8
    88a4:      	sxtw	x0, w0
    88a8:      	bl	0x88a8 <_stogir.locals.shape+0x344>
		00000000000088a8:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-start?
    88ac:      	cbz	x0, 0x88bc <_stogir.locals.shape+0x358>
    88b0:      	mov	w0, #0x0                ; =0
    88b4:      	str	x0, [x29, #0x280]
    88b8:      	b	0x88c4 <_stogir.locals.shape+0x360>
    88bc:      	mov	w0, #0x1                ; =1
    88c0:      	str	x0, [x29, #0x280]
    88c4:      	ldr	x0, [x29, #0x280]
    88c8:      	str	x0, [x29, #0x278]
    88cc:      	ldr	x0, [x29, #0x278]
    88d0:      	cbz	x0, 0x8908 <_stogir.locals.shape+0x3a4>
    88d4:      	mov	w0, #0x1                ; =1
    88d8:      	str	w0, [x29, #0x1f0]
    88dc:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		00000000000088dc:  ARM64_RELOC_PAGE21	l_cstr.167
    88e0:      	add	x0, x0, #0x0
		00000000000088e0:  ARM64_RELOC_PAGEOFF12	l_cstr.167
    88e4:      	str	x0, [x29, #0x210]
    88e8:      	mov	w0, #0x2c               ; =44
    88ec:      	str	x0, [x29, #0x218]
    88f0:      	ldr	q0, [x29, #0x210]
    88f4:      	mov	w16, #0x1f8             ; =504
    88f8:      	str	q0, [x29, x16]
    88fc:      	add	x0, x29, #0x1f0
    8900:      	str	x0, [x29, #0x278]
    8904:      	b	0x8944 <_stogir.locals.shape+0x3e0>
    8908:      	str	wzr, [x29, #0x220]
    890c:      	str	xzr, [x29, #0x250]
    8910:      	str	xzr, [x29, #0x258]
    8914:      	ldr	q0, [x29, #0x250]
    8918:      	str	q0, [x29, #0x240]
    891c:      	str	x22, [x29, #0x240]
    8920:      	ldr	x0, [x29, #0x270]
    8924:      	str	x0, [x29, #0x248]
    8928:      	ldr	q0, [x29, #0x240]
    892c:      	str	q0, [x29, #0x260]
    8930:      	ldr	q0, [x29, #0x260]
    8934:      	mov	w16, #0x228             ; =552
    8938:      	str	q0, [x29, x16]
    893c:      	add	x0, x29, #0x220
    8940:      	str	x0, [x29, #0x278]
    8944:      	ldr	x20, [x29, #0x278]
    8948:      	mov	x21, x20
    894c:      	mov	x23, x21
    8950:      	ldr	q0, [x23]
    8954:      	str	q0, [x19]
    8958:      	ldr	x0, [x23, #0x10]
    895c:      	str	x0, [x19, #0x10]
    8960:      	b	0x896c <_stogir.locals.shape+0x408>
    8964:      	brk	#0x1
    8968:      	brk	#0x1
    896c:      	ldp	x19, x20, [sp, #0x10]
    8970:      	ldp	x21, x22, [sp, #0x20]
    8974:      	ldr	x23, [sp, #0x30]
    8978:      	ldp	x29, x30, [sp]
    897c:      	add	sp, sp, #0x2a0
    8980:      	ret

0000000000008984 <_stogir.conversion.policy>:
    8984:      	stp	x29, x30, [sp, #-0x130]!
    8988:      	mov	x29, sp
    898c:      	stp	x19, x20, [sp, #0x10]
    8990:      	stp	x21, x22, [sp, #0x20]
    8994:      	str	x23, [sp, #0x30]
    8998:      	mov	x19, x8
    899c:      	sxtw	x20, w0
    89a0:      	sxtw	x21, w1
    89a4:      	sxtw	x22, w2
    89a8:      	sxtw	x23, w3
    89ac:      	cmp	x20, #0x24
    89b0:      	b.ne	0x89e4 <_stogir.conversion.policy+0x60>
    89b4:      	mov	x0, x21
    89b8:      	bl	0x89b8 <_stogir.conversion.policy+0x34>
		00000000000089b8:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    89bc:      	cbz	x0, 0x89cc <_stogir.conversion.policy+0x48>
    89c0:      	mov	w0, #0x1                ; =1
    89c4:      	str	x0, [x29, #0xa8]
    89c8:      	b	0x89d8 <_stogir.conversion.policy+0x54>
    89cc:      	mov	x0, x22
    89d0:      	bl	0x89d0 <_stogir.conversion.policy+0x4c>
		00000000000089d0:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    89d4:      	str	x0, [x29, #0xa8]
    89d8:      	ldr	x0, [x29, #0xa8]
    89dc:      	str	x0, [x29, #0x100]
    89e0:      	b	0x89ec <_stogir.conversion.policy+0x68>
    89e4:      	mov	w0, #0x0                ; =0
    89e8:      	str	x0, [x29, #0x100]
    89ec:      	ldr	x0, [x29, #0x100]
    89f0:      	mov	x1, x0
    89f4:      	cbz	x1, 0x8a14 <_stogir.conversion.policy+0x90>
    89f8:      	mov	x9, x0
    89fc:      	mov	x0, x21
    8a00:      	mov	x1, x23
    8a04:      	bl	0x8a04 <_stogir.conversion.policy+0x80>
		0000000000008a04:  ARM64_RELOC_BRANCH26	_stogir.types.size
    8a08:      	sxtw	x0, w0
    8a0c:      	str	x0, [x29, #0xa8]
    8a10:      	b	0x8a28 <_stogir.conversion.policy+0xa4>
    8a14:      	mov	x0, x21
    8a18:      	mov	x1, x23
    8a1c:      	bl	0x8a1c <_stogir.conversion.policy+0x98>
		0000000000008a1c:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    8a20:      	sxtw	x0, w0
    8a24:      	str	x0, [x29, #0xa8]
    8a28:      	mov	w0, #0x8                ; =8
    8a2c:      	ldr	x1, [x29, #0xa8]
    8a30:      	mul	x0, x0, x1
    8a34:      	sxtw	x0, w0
    8a38:      	ldr	x1, [x29, #0x100]
    8a3c:      	str	x0, [x29, #0xa8]
    8a40:      	cbz	x1, 0x8a60 <_stogir.conversion.policy+0xdc>
    8a44:      	mov	x9, x0
    8a48:      	mov	x0, x22
    8a4c:      	mov	x1, x23
    8a50:      	bl	0x8a50 <_stogir.conversion.policy+0xcc>
		0000000000008a50:  ARM64_RELOC_BRANCH26	_stogir.types.size
    8a54:      	sxtw	x0, w0
    8a58:      	str	x0, [x29, #0x100]
    8a5c:      	b	0x8a74 <_stogir.conversion.policy+0xf0>
    8a60:      	mov	x0, x22
    8a64:      	mov	x1, x23
    8a68:      	bl	0x8a68 <_stogir.conversion.policy+0xe4>
		0000000000008a68:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    8a6c:      	sxtw	x0, w0
    8a70:      	str	x0, [x29, #0x100]
    8a74:      	mov	w0, #0x8                ; =8
    8a78:      	ldr	x1, [x29, #0x100]
    8a7c:      	mul	x0, x0, x1
    8a80:      	sxtw	x23, w0
    8a84:      	mov	x0, x20
    8a88:      	bl	0x8a88 <_stogir.conversion.policy+0x104>
		0000000000008a88:  ARM64_RELOC_BRANCH26	_stogir.conversion.operation?
    8a8c:      	cbz	x0, 0x8a9c <_stogir.conversion.policy+0x118>
    8a90:      	mov	w0, #0x0                ; =0
    8a94:      	str	x0, [x29, #0x100]
    8a98:      	b	0x8aa4 <_stogir.conversion.policy+0x120>
    8a9c:      	mov	w0, #0x1                ; =1
    8aa0:      	str	x0, [x29, #0x100]
    8aa4:      	ldr	x0, [x29, #0x100]
    8aa8:      	cbz	x0, 0x8ab8 <_stogir.conversion.policy+0x134>
    8aac:      	mov	w0, #0x1                ; =1
    8ab0:      	str	x0, [x29, #0x100]
    8ab4:      	b	0x8c08 <_stogir.conversion.policy+0x284>
    8ab8:      	ldr	x0, [x29, #0xa8]
    8abc:      	cmp	x0, #0x0
    8ac0:      	b.gt	0x8ad0 <_stogir.conversion.policy+0x14c>
    8ac4:      	mov	w1, #0x1                ; =1
    8ac8:      	str	x1, [x29, #0x108]
    8acc:      	b	0x8c00 <_stogir.conversion.policy+0x27c>
    8ad0:      	cmp	x23, #0x0
    8ad4:      	b.gt	0x8ae4 <_stogir.conversion.policy+0x160>
    8ad8:      	mov	w0, #0x1                ; =1
    8adc:      	str	x0, [x29, #0x110]
    8ae0:      	b	0x8bf8 <_stogir.conversion.policy+0x274>
    8ae4:      	mov	x0, x20
    8ae8:      	bl	0x8ae8 <_stogir.conversion.policy+0x164>
		0000000000008ae8:  ARM64_RELOC_BRANCH26	_stogir.numeric-conversion.operation?
    8aec:      	cbz	x0, 0x8b24 <_stogir.conversion.policy+0x1a0>
    8af0:      	mov	x0, x20
    8af4:      	mov	x1, x21
    8af8:      	mov	x2, x22
    8afc:      	bl	0x8afc <_stogir.conversion.policy+0x178>
		0000000000008afc:  ARM64_RELOC_BRANCH26	_stogir.numeric-conversion.valid-types?
    8b00:      	cbz	x0, 0x8b10 <_stogir.conversion.policy+0x18c>
    8b04:      	mov	w0, #0x0                ; =0
    8b08:      	str	x0, [x29, #0x118]
    8b0c:      	b	0x8b18 <_stogir.conversion.policy+0x194>
    8b10:      	mov	w0, #0x1                ; =1
    8b14:      	str	x0, [x29, #0x118]
    8b18:      	ldr	x0, [x29, #0x118]
    8b1c:      	str	x0, [x29, #0x120]
    8b20:      	b	0x8bf0 <_stogir.conversion.policy+0x26c>
    8b24:      	cmp	x20, #0x24
    8b28:      	b.ne	0x8b68 <_stogir.conversion.policy+0x1e4>
    8b2c:      	ldr	x0, [x29, #0xa8]
    8b30:      	str	w0, [x29, #0xa0]
    8b34:      	str	w23, [x29, #0xa4]
    8b38:      	ldrsw	x1, [x29, #0xa0]
    8b3c:      	ldrsw	x2, [x29, #0xa4]
    8b40:      	cmp	x1, x2
    8b44:      	b.ne	0x8b54 <_stogir.conversion.policy+0x1d0>
    8b48:      	mov	w1, #0x0                ; =0
    8b4c:      	str	x1, [x29, #0x118]
    8b50:      	b	0x8b5c <_stogir.conversion.policy+0x1d8>
    8b54:      	mov	w0, #0x1                ; =1
    8b58:      	str	x0, [x29, #0x118]
    8b5c:      	ldr	x0, [x29, #0x118]
    8b60:      	str	x0, [x29, #0x128]
    8b64:      	b	0x8be8 <_stogir.conversion.policy+0x264>
    8b68:      	mov	x0, x21
    8b6c:      	bl	0x8b6c <_stogir.conversion.policy+0x1e8>
		0000000000008b6c:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    8b70:      	cbz	x0, 0x8b7c <_stogir.conversion.policy+0x1f8>
    8b74:      	mov	w21, #0x0               ; =0
    8b78:      	b	0x8b80 <_stogir.conversion.policy+0x1fc>
    8b7c:      	mov	w21, #0x1               ; =1
    8b80:      	cbz	x21, 0x8b8c <_stogir.conversion.policy+0x208>
    8b84:      	mov	w21, #0x1               ; =1
    8b88:      	b	0x8be4 <_stogir.conversion.policy+0x260>
    8b8c:      	mov	x0, x22
    8b90:      	bl	0x8b90 <_stogir.conversion.policy+0x20c>
		0000000000008b90:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    8b94:      	cbz	x0, 0x8ba0 <_stogir.conversion.policy+0x21c>
    8b98:      	mov	w22, #0x0               ; =0
    8b9c:      	b	0x8ba4 <_stogir.conversion.policy+0x220>
    8ba0:      	mov	w22, #0x1               ; =1
    8ba4:      	cbz	x22, 0x8bb0 <_stogir.conversion.policy+0x22c>
    8ba8:      	mov	w22, #0x1               ; =1
    8bac:      	b	0x8be0 <_stogir.conversion.policy+0x25c>
    8bb0:      	cmp	x20, #0x23
    8bb4:      	b.ne	0x8bcc <_stogir.conversion.policy+0x248>
    8bb8:      	ldr	x0, [x29, #0xa8]
    8bbc:      	cmp	x23, x0
    8bc0:      	cset	x1, ge
    8bc4:      	str	x1, [x29, #0x118]
    8bc8:      	b	0x8bdc <_stogir.conversion.policy+0x258>
    8bcc:      	ldr	x0, [x29, #0xa8]
    8bd0:      	cmp	x23, x0
    8bd4:      	cset	x1, le
    8bd8:      	str	x1, [x29, #0x118]
    8bdc:      	ldr	x22, [x29, #0x118]
    8be0:      	mov	x21, x22
    8be4:      	str	x21, [x29, #0x128]
    8be8:      	ldr	x0, [x29, #0x128]
    8bec:      	str	x0, [x29, #0x120]
    8bf0:      	ldr	x0, [x29, #0x120]
    8bf4:      	str	x0, [x29, #0x110]
    8bf8:      	ldr	x0, [x29, #0x110]
    8bfc:      	str	x0, [x29, #0x108]
    8c00:      	ldr	x0, [x29, #0x108]
    8c04:      	str	x0, [x29, #0x100]
    8c08:      	ldr	x0, [x29, #0x100]
    8c0c:      	cbz	x0, 0x8c3c <_stogir.conversion.policy+0x2b8>
    8c10:      	mov	w0, #0x1                ; =1
    8c14:      	str	w0, [x29, #0xb0]
    8c18:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		0000000000008c18:  ARM64_RELOC_PAGE21	l_cstr.168
    8c1c:      	add	x0, x0, #0x0
		0000000000008c1c:  ARM64_RELOC_PAGEOFF12	l_cstr.168
    8c20:      	str	x0, [x29, #0xd0]
    8c24:      	mov	w0, #0x22               ; =34
    8c28:      	str	x0, [x29, #0xd8]
    8c2c:      	ldr	q0, [x29, #0xd0]
    8c30:      	stur	q0, [x29, #0xb8]
    8c34:      	add	x21, x29, #0xb0
    8c38:      	b	0x8c74 <_stogir.conversion.policy+0x2f0>
    8c3c:      	str	wzr, [x29, #0xe0]
    8c40:      	cmp	x20, #0x23
    8c44:      	b.ne	0x8c50 <_stogir.conversion.policy+0x2cc>
    8c48:      	mov	w22, #0x1               ; =1
    8c4c:      	b	0x8c5c <_stogir.conversion.policy+0x2d8>
    8c50:      	cmp	x20, #0x26
    8c54:      	cset	x0, eq
    8c58:      	mov	x22, x0
    8c5c:      	cbz	x22, 0x8c68 <_stogir.conversion.policy+0x2e4>
    8c60:      	mov	x20, x23
    8c64:      	b	0x8c6c <_stogir.conversion.policy+0x2e8>
    8c68:      	ldr	x20, [x29, #0xa8]
    8c6c:      	str	w20, [x29, #0xe8]
    8c70:      	add	x21, x29, #0xe0
    8c74:      	ldr	q0, [x21]
    8c78:      	str	q0, [x19]
    8c7c:      	ldr	x0, [x21, #0x10]
    8c80:      	str	x0, [x19, #0x10]
    8c84:      	ldp	x19, x20, [sp, #0x10]
    8c88:      	ldp	x21, x22, [sp, #0x20]
    8c8c:      	ldr	x23, [sp, #0x30]
    8c90:      	ldp	x29, x30, [sp], #0x130
    8c94:      	ret

0000000000008c98 <_stogir.conditional.operands>:
    8c98:      	sub	sp, sp, #0x2c0
    8c9c:      	stp	x29, x30, [sp]
    8ca0:      	mov	x29, sp
    8ca4:      	stp	x19, x20, [sp, #0x10]
    8ca8:      	str	x21, [sp, #0x20]
    8cac:      	sxtw	x1, w1
    8cb0:      	sxtw	x2, w2
    8cb4:      	sxtw	x3, w3
    8cb8:      	sxtw	x4, w4
    8cbc:      	adrp	x5, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		0000000000008cbc:  ARM64_RELOC_PAGE21	l_cstr.51
    8cc0:      	add	x5, x5, #0x0
		0000000000008cc0:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    8cc4:      	str	x5, [x29, #0xb0]
    8cc8:      	str	xzr, [x29, #0xb8]
    8ccc:      	ldr	q0, [x29, #0xb0]
    8cd0:      	str	q0, [x29, #0xa0]
    8cd4:      	cmp	x1, #0x0
    8cd8:      	str	x0, [x29, #0x1f8]
    8cdc:      	str	x1, [x29, #0x280]
    8ce0:      	str	x2, [x29, #0x288]
    8ce4:      	str	x3, [x29, #0x290]
    8ce8:      	str	x4, [x29, #0x298]
    8cec:      	str	x8, [x29, #0x2a0]
    8cf0:      	b.ne	0x8d00 <_stogir.conditional.operands+0x68>
    8cf4:      	mov	w5, #0x1                ; =1
    8cf8:      	str	x5, [x29, #0x2a8]
    8cfc:      	b	0x8d28 <_stogir.conditional.operands+0x90>
    8d00:      	ldr	x0, [x29, #0x280]
    8d04:      	bl	0x8d04 <_stogir.conditional.operands+0x6c>
		0000000000008d04:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    8d08:      	cbz	x0, 0x8d18 <_stogir.conditional.operands+0x80>
    8d0c:      	mov	w0, #0x0                ; =0
    8d10:      	str	x0, [x29, #0x2b0]
    8d14:      	b	0x8d20 <_stogir.conditional.operands+0x88>
    8d18:      	mov	w0, #0x1                ; =1
    8d1c:      	str	x0, [x29, #0x2b0]
    8d20:      	ldr	x0, [x29, #0x2b0]
    8d24:      	str	x0, [x29, #0x2a8]
    8d28:      	ldr	x0, [x29, #0x2a8]
    8d2c:      	cbz	x0, 0x8d50 <_stogir.conditional.operands+0xb8>
    8d30:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		0000000000008d30:  ARM64_RELOC_PAGE21	l_cstr.169
    8d34:      	add	x0, x0, #0x0
		0000000000008d34:  ARM64_RELOC_PAGEOFF12	l_cstr.169
    8d38:      	str	x0, [x29, #0xc0]
    8d3c:      	mov	w0, #0x2b               ; =43
    8d40:      	str	x0, [x29, #0xc8]
    8d44:      	ldr	q0, [x29, #0xc0]
    8d48:      	str	q0, [x29, #0xa0]
    8d4c:      	b	0x8d50 <_stogir.conditional.operands+0xb8>
    8d50:      	add	x8, x29, #0xd0
    8d54:      	ldr	x0, [x29, #0x1f8]
    8d58:      	ldr	x1, [x29, #0x288]
    8d5c:      	bl	0x8d5c <_stogir.conditional.operands+0xc4>
		0000000000008d5c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    8d60:      	ldr	w0, [x29, #0xd0]
    8d64:      	cmp	x0, #0x0
    8d68:      	b.eq	0x8d7c <_stogir.conditional.operands+0xe4>
    8d6c:      	cmp	x0, #0x1
    8d70:      	b.eq	0x8d9c <_stogir.conditional.operands+0x104>
    8d74:      	b	0x8d78 <_stogir.conditional.operands+0xe0>
    8d78:      	b	0x9080 <_stogir.conditional.operands+0x3e8>
    8d7c:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		0000000000008d7c:  ARM64_RELOC_PAGE21	l_cstr.170
    8d80:      	add	x0, x0, #0x0
		0000000000008d80:  ARM64_RELOC_PAGEOFF12	l_cstr.170
    8d84:      	str	x0, [x29, #0x100]
    8d88:      	mov	w0, #0x16               ; =22
    8d8c:      	str	x0, [x29, #0x108]
    8d90:      	ldr	q0, [x29, #0x100]
    8d94:      	str	q0, [x29, #0xa0]
    8d98:      	b	0x8e70 <_stogir.conditional.operands+0x1d8>
    8d9c:      	ldur	q0, [x29, #0xd8]
    8da0:      	str	q0, [x29, #0x110]
    8da4:      	add	x0, x29, #0x110
    8da8:      	bl	0x8da8 <_stogir.conditional.operands+0x110>
		0000000000008da8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    8dac:      	ubfx	x0, x0, #0, #8
    8db0:      	cmp	x0, #0x48
    8db4:      	b.ne	0x8dc4 <_stogir.conditional.operands+0x12c>
    8db8:      	mov	w0, #0x1                ; =1
    8dbc:      	str	x0, [x29, #0x288]
    8dc0:      	b	0x8e48 <_stogir.conditional.operands+0x1b0>
    8dc4:      	add	x0, x29, #0x110
    8dc8:      	bl	0x8dc8 <_stogir.conditional.operands+0x130>
		0000000000008dc8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    8dcc:      	ubfx	x0, x0, #0, #8
    8dd0:      	cmp	x0, #0x46
    8dd4:      	b.ne	0x8de4 <_stogir.conditional.operands+0x14c>
    8dd8:      	mov	w0, #0x1                ; =1
    8ddc:      	str	x0, [x29, #0x2a8]
    8de0:      	b	0x8e40 <_stogir.conditional.operands+0x1a8>
    8de4:      	add	x0, x29, #0x110
    8de8:      	bl	0x8de8 <_stogir.conditional.operands+0x150>
		0000000000008de8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    8dec:      	ubfx	x0, x0, #0, #8
    8df0:      	cmp	x0, #0x0
    8df4:      	b.ne	0x8e04 <_stogir.conditional.operands+0x16c>
    8df8:      	mov	w0, #0x1                ; =1
    8dfc:      	str	x0, [x29, #0x2b0]
    8e00:      	b	0x8e38 <_stogir.conditional.operands+0x1a0>
    8e04:      	add	x0, x29, #0x110
    8e08:      	bl	0x8e08 <_stogir.conditional.operands+0x170>
		0000000000008e08:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    8e0c:      	ubfx	x0, x0, #0, #8
    8e10:      	sxtw	x0, w0
    8e14:      	bl	0x8e14 <_stogir.conditional.operands+0x17c>
		0000000000008e14:  ARM64_RELOC_BRANCH26	_stogir.types.valid-scalar?
    8e18:      	cbz	x0, 0x8e28 <_stogir.conditional.operands+0x190>
    8e1c:      	mov	w0, #0x0                ; =0
    8e20:      	str	x0, [x29, #0x2b8]
    8e24:      	b	0x8e30 <_stogir.conditional.operands+0x198>
    8e28:      	mov	w0, #0x1                ; =1
    8e2c:      	str	x0, [x29, #0x2b8]
    8e30:      	ldr	x0, [x29, #0x2b8]
    8e34:      	str	x0, [x29, #0x2b0]
    8e38:      	ldr	x0, [x29, #0x2b0]
    8e3c:      	str	x0, [x29, #0x2a8]
    8e40:      	ldr	x0, [x29, #0x2a8]
    8e44:      	str	x0, [x29, #0x288]
    8e48:      	ldr	x0, [x29, #0x288]
    8e4c:      	cbz	x0, 0x8e70 <_stogir.conditional.operands+0x1d8>
    8e50:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		0000000000008e50:  ARM64_RELOC_PAGE21	l_cstr.171
    8e54:      	add	x0, x0, #0x0
		0000000000008e54:  ARM64_RELOC_PAGEOFF12	l_cstr.171
    8e58:      	str	x0, [x29, #0x120]
    8e5c:      	mov	w0, #0x2a               ; =42
    8e60:      	str	x0, [x29, #0x128]
    8e64:      	ldr	q0, [x29, #0x120]
    8e68:      	str	q0, [x29, #0xa0]
    8e6c:      	b	0x8e70 <_stogir.conditional.operands+0x1d8>
    8e70:      	ldr	x0, [x29, #0x290]
    8e74:      	str	w0, [x29, #0x150]
    8e78:      	ldr	x0, [x29, #0x298]
    8e7c:      	str	w0, [x29, #0x154]
    8e80:      	ldr	x0, [x29, #0x150]
    8e84:      	str	x0, [x29, #0x158]
    8e88:      	add	x0, x29, #0x158
    8e8c:      	str	x0, [x29, #0x160]
    8e90:      	mov	w1, #0x2                ; =2
    8e94:      	str	x1, [x29, #0x168]
    8e98:      	ldr	x1, [x29, #0x160]
    8e9c:      	ldr	x2, [x29, #0x168]
    8ea0:      	add	x8, x29, #0x170
    8ea4:      	mov	x9, x0
    8ea8:      	mov	x0, x1
    8eac:      	mov	x1, x2
    8eb0:      	bl	0x8eb0 <_stogir.conditional.operands+0x218>
		0000000000008eb0:  ARM64_RELOC_BRANCH26	_coil.core.Iterable$slice$iter__i32
    8eb4:      	ldr	q0, [x29, #0x170]
    8eb8:      	str	q0, [x29, #0x130]
    8ebc:      	ldr	x0, [x29, #0x180]
    8ec0:      	str	x0, [x29, #0x140]
    8ec4:      	add	x0, x29, #0x130
    8ec8:      	bl	0x8ec8 <_stogir.conditional.operands+0x230>
		0000000000008ec8:  ARM64_RELOC_BRANCH26	_coil.core.Iterator$coil.slice.SliceIter$next__i32
    8ecc:      	str	x0, [x29, #0x190]
    8ed0:      	str	x1, [x29, #0x198]
    8ed4:      	ldr	w0, [x29, #0x190]
    8ed8:      	cmp	x0, #0x0
    8edc:      	b.eq	0x8ff0 <_stogir.conditional.operands+0x358>
    8ee0:      	cmp	x0, #0x1
    8ee4:      	b.eq	0x8ef0 <_stogir.conditional.operands+0x258>
    8ee8:      	b	0x8eec <_stogir.conditional.operands+0x254>
    8eec:      	b	0x907c <_stogir.conditional.operands+0x3e4>
    8ef0:      	ldrsw	x0, [x29, #0x198]
    8ef4:      	add	x8, x29, #0x1a0
    8ef8:      	mov	x9, x0
    8efc:      	ldr	x0, [x29, #0x1f8]
    8f00:      	mov	x1, x9
    8f04:      	bl	0x8f04 <_stogir.conditional.operands+0x26c>
		0000000000008f04:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    8f08:      	ldr	w0, [x29, #0x1a0]
    8f0c:      	cmp	x0, #0x0
    8f10:      	b.eq	0x8f24 <_stogir.conditional.operands+0x28c>
    8f14:      	cmp	x0, #0x1
    8f18:      	b.eq	0x8f44 <_stogir.conditional.operands+0x2ac>
    8f1c:      	b	0x8f20 <_stogir.conditional.operands+0x288>
    8f20:      	b	0x9078 <_stogir.conditional.operands+0x3e0>
    8f24:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		0000000000008f24:  ARM64_RELOC_PAGE21	l_cstr.172
    8f28:      	add	x0, x0, #0x0
		0000000000008f28:  ARM64_RELOC_PAGEOFF12	l_cstr.172
    8f2c:      	str	x0, [x29, #0x1d0]
    8f30:      	mov	w0, #0x10               ; =16
    8f34:      	str	x0, [x29, #0x1d8]
    8f38:      	ldr	q0, [x29, #0x1d0]
    8f3c:      	str	q0, [x29, #0xa0]
    8f40:      	b	0x8fec <_stogir.conditional.operands+0x354>
    8f44:      	mov	w16, #0x1a8             ; =424
    8f48:      	ldr	q0, [x29, x16]
    8f4c:      	str	q0, [x29, #0x1e0]
    8f50:      	add	x0, x29, #0x1e0
    8f54:      	bl	0x8f54 <_stogir.conditional.operands+0x2bc>
		0000000000008f54:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    8f58:      	ubfx	x0, x0, #0, #8
    8f5c:      	cmp	x0, #0x48
    8f60:      	b.ne	0x8f6c <_stogir.conditional.operands+0x2d4>
    8f64:      	mov	w19, #0x1               ; =1
    8f68:      	b	0x8fc8 <_stogir.conditional.operands+0x330>
    8f6c:      	add	x0, x29, #0x1e0
    8f70:      	bl	0x8f70 <_stogir.conditional.operands+0x2d8>
		0000000000008f70:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    8f74:      	ubfx	x0, x0, #0, #8
    8f78:      	cmp	x0, #0x46
    8f7c:      	b.ne	0x8f88 <_stogir.conditional.operands+0x2f0>
    8f80:      	mov	w20, #0x1               ; =1
    8f84:      	b	0x8fc4 <_stogir.conditional.operands+0x32c>
    8f88:      	add	x0, x29, #0x1e0
    8f8c:      	bl	0x8f8c <_stogir.conditional.operands+0x2f4>
		0000000000008f8c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    8f90:      	ubfx	x0, x0, #0, #8
    8f94:      	sxtw	x0, w0
    8f98:      	str	w0, [x29, #0x1f0]
    8f9c:      	ldr	x0, [x29, #0x280]
    8fa0:      	str	w0, [x29, #0x1f4]
    8fa4:      	ldrsw	x1, [x29, #0x1f0]
    8fa8:      	ldrsw	x2, [x29, #0x1f4]
    8fac:      	cmp	x1, x2
    8fb0:      	b.ne	0x8fbc <_stogir.conditional.operands+0x324>
    8fb4:      	mov	w21, #0x0               ; =0
    8fb8:      	b	0x8fc0 <_stogir.conditional.operands+0x328>
    8fbc:      	mov	w21, #0x1               ; =1
    8fc0:      	mov	x20, x21
    8fc4:      	mov	x19, x20
    8fc8:      	cbz	x19, 0x8fec <_stogir.conditional.operands+0x354>
    8fcc:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		0000000000008fcc:  ARM64_RELOC_PAGE21	l_cstr.173
    8fd0:      	add	x0, x0, #0x0
		0000000000008fd0:  ARM64_RELOC_PAGEOFF12	l_cstr.173
    8fd4:      	str	x0, [x29, #0x200]
    8fd8:      	mov	w0, #0x21               ; =33
    8fdc:      	str	x0, [x29, #0x208]
    8fe0:      	ldr	q0, [x29, #0x200]
    8fe4:      	str	q0, [x29, #0xa0]
    8fe8:      	b	0x8fec <_stogir.conditional.operands+0x354>
    8fec:      	b	0x8ec4 <_stogir.conditional.operands+0x22c>
    8ff0:      	ldr	q0, [x29, #0xa0]
    8ff4:      	str	q0, [x29, #0x210]
    8ff8:      	adrp	x0, 0x8000 <_stogir.stack.validate-scope-inputs+0x300>
		0000000000008ff8:  ARM64_RELOC_PAGE21	l_cstr.51
    8ffc:      	add	x0, x0, #0x0
		0000000000008ffc:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    9000:      	str	x0, [x29, #0x220]
    9004:      	str	xzr, [x29, #0x228]
    9008:      	ldr	x0, [x29, #0x210]
    900c:      	ldr	x1, [x29, #0x218]
    9010:      	ldr	x2, [x29, #0x220]
    9014:      	ldr	x3, [x29, #0x228]
    9018:      	bl	0x9018 <_stogir.conditional.operands+0x380>
		0000000000009018:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    901c:      	cbz	x0, 0x9038 <_stogir.conditional.operands+0x3a0>
    9020:      	str	wzr, [x29, #0x230]
    9024:      	ldr	x0, [x29, #0x280]
    9028:      	str	w0, [x29, #0x238]
    902c:      	add	x0, x29, #0x230
    9030:      	str	x0, [x29, #0x280]
    9034:      	b	0x905c <_stogir.conditional.operands+0x3c4>
    9038:      	mov	w0, #0x1                ; =1
    903c:      	str	w0, [x29, #0x250]
    9040:      	ldr	q0, [x29, #0xa0]
    9044:      	str	q0, [x29, #0x270]
    9048:      	ldr	q0, [x29, #0x270]
    904c:      	mov	w16, #0x258             ; =600
    9050:      	str	q0, [x29, x16]
    9054:      	add	x0, x29, #0x250
    9058:      	str	x0, [x29, #0x280]
    905c:      	ldr	x0, [x29, #0x2a0]
    9060:      	ldr	x1, [x29, #0x280]
    9064:      	ldr	q0, [x1]
    9068:      	str	q0, [x0]
    906c:      	ldr	x2, [x1, #0x10]
    9070:      	str	x2, [x0, #0x10]
    9074:      	b	0x9084 <_stogir.conditional.operands+0x3ec>
    9078:      	brk	#0x1
    907c:      	brk	#0x1
    9080:      	brk	#0x1
    9084:      	ldp	x19, x20, [sp, #0x10]
    9088:      	ldr	x21, [sp, #0x20]
    908c:      	ldp	x29, x30, [sp]
    9090:      	add	sp, sp, #0x2c0
    9094:      	ret

0000000000009098 <_stogir.floating.unary?>:
    9098:      	sxtw	x2, w0
    909c:      	cmp	x2, #0x1f
    90a0:      	b.ne	0x90ac <_stogir.floating.unary?+0x14>
    90a4:      	mov	w3, #0x1                ; =1
    90a8:      	b	0x90b8 <_stogir.floating.unary?+0x20>
    90ac:      	cmp	x2, #0x20
    90b0:      	cset	x0, eq
    90b4:      	mov	x3, x0
    90b8:      	mov	x0, x3
    90bc:      	ret

00000000000090c0 <_stogir.floating.comparison?>:
    90c0:      	sxtw	x2, w0
    90c4:      	cmp	x2, #0xe
    90c8:      	b.lt	0x90dc <_stogir.floating.comparison?+0x1c>
    90cc:      	cmp	x2, #0x19
    90d0:      	cset	x0, le
    90d4:      	mov	x2, x0
    90d8:      	b	0x90e0 <_stogir.floating.comparison?+0x20>
    90dc:      	mov	w2, #0x0                ; =0
    90e0:      	mov	x0, x2
    90e4:      	ret

00000000000090e8 <_stogir.floating.operands>:
    90e8:      	sub	sp, sp, #0x2e0
    90ec:      	stp	x29, x30, [sp]
    90f0:      	mov	x29, sp
    90f4:      	str	x19, [sp, #0x10]
    90f8:      	sxtw	x1, w1
    90fc:      	sxtw	x2, w2
    9100:      	sxtw	x3, w3
    9104:      	sxtw	x4, w4
    9108:      	sxtw	x5, w5
    910c:      	adrp	x6, 0x9000 <_stogir.conditional.operands+0x368>
		000000000000910c:  ARM64_RELOC_PAGE21	l_cstr.51
    9110:      	add	x6, x6, #0x0
		0000000000009110:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    9114:      	str	x6, [x29, #0xb0]
    9118:      	str	xzr, [x29, #0xb8]
    911c:      	ldr	q0, [x29, #0xb0]
    9120:      	str	q0, [x29, #0xa0]
    9124:      	mov	x9, x0
    9128:      	mov	x0, x1
    912c:      	str	x1, [x29, #0x198]
    9130:      	str	x2, [x29, #0x2a0]
    9134:      	str	x3, [x29, #0x2a8]
    9138:      	str	x4, [x29, #0x2b0]
    913c:      	str	x5, [x29, #0x2b8]
    9140:      	str	x8, [x29, #0x2c0]
    9144:      	str	x9, [x29, #0x2c8]
    9148:      	bl	0x9148 <_stogir.floating.operands+0x60>
		0000000000009148:  ARM64_RELOC_BRANCH26	_stogir.floating.operation?
    914c:      	cbz	x0, 0x915c <_stogir.floating.operands+0x74>
    9150:      	mov	w0, #0x0                ; =0
    9154:      	str	x0, [x29, #0x2d0]
    9158:      	b	0x9164 <_stogir.floating.operands+0x7c>
    915c:      	mov	w0, #0x1                ; =1
    9160:      	str	x0, [x29, #0x2d0]
    9164:      	ldr	x0, [x29, #0x2d0]
    9168:      	cbz	x0, 0x9178 <_stogir.floating.operands+0x90>
    916c:      	mov	w0, #0x1                ; =1
    9170:      	str	x0, [x29, #0x2d0]
    9174:      	b	0x91a0 <_stogir.floating.operands+0xb8>
    9178:      	ldr	x0, [x29, #0x2a0]
    917c:      	bl	0x917c <_stogir.floating.operands+0x94>
		000000000000917c:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
    9180:      	cbz	x0, 0x9190 <_stogir.floating.operands+0xa8>
    9184:      	mov	w0, #0x0                ; =0
    9188:      	str	x0, [x29, #0x2d8]
    918c:      	b	0x9198 <_stogir.floating.operands+0xb0>
    9190:      	mov	w0, #0x1                ; =1
    9194:      	str	x0, [x29, #0x2d8]
    9198:      	ldr	x0, [x29, #0x2d8]
    919c:      	str	x0, [x29, #0x2d0]
    91a0:      	ldr	x0, [x29, #0x2d0]
    91a4:      	cbz	x0, 0x91c8 <_stogir.floating.operands+0xe0>
    91a8:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		00000000000091a8:  ARM64_RELOC_PAGE21	l_cstr.174
    91ac:      	add	x0, x0, #0x0
		00000000000091ac:  ARM64_RELOC_PAGEOFF12	l_cstr.174
    91b0:      	str	x0, [x29, #0xc0]
    91b4:      	mov	w0, #0x22               ; =34
    91b8:      	str	x0, [x29, #0xc8]
    91bc:      	ldr	q0, [x29, #0xc0]
    91c0:      	str	q0, [x29, #0xa0]
    91c4:      	b	0x91c8 <_stogir.floating.operands+0xe0>
    91c8:      	ldr	x0, [x29, #0x2a8]
    91cc:      	str	w0, [x29, #0xf0]
    91d0:      	mov	x9, x0
    91d4:      	ldr	x0, [x29, #0x198]
    91d8:      	bl	0x91d8 <_stogir.floating.operands+0xf0>
		00000000000091d8:  ARM64_RELOC_BRANCH26	_stogir.floating.unary?
    91dc:      	cbz	x0, 0x91ec <_stogir.floating.operands+0x104>
    91e0:      	ldr	x0, [x29, #0x2a8]
    91e4:      	str	x0, [x29, #0x2d0]
    91e8:      	b	0x91f4 <_stogir.floating.operands+0x10c>
    91ec:      	ldr	x0, [x29, #0x2b0]
    91f0:      	str	x0, [x29, #0x2d0]
    91f4:      	ldr	x0, [x29, #0x2d0]
    91f8:      	str	w0, [x29, #0xf4]
    91fc:      	ldr	x0, [x29, #0xf0]
    9200:      	str	x0, [x29, #0xf8]
    9204:      	add	x0, x29, #0xf8
    9208:      	str	x0, [x29, #0x100]
    920c:      	mov	w1, #0x2                ; =2
    9210:      	str	x1, [x29, #0x108]
    9214:      	ldr	x1, [x29, #0x100]
    9218:      	ldr	x2, [x29, #0x108]
    921c:      	add	x8, x29, #0x110
    9220:      	mov	x9, x0
    9224:      	mov	x0, x1
    9228:      	mov	x1, x2
    922c:      	bl	0x922c <_stogir.floating.operands+0x144>
		000000000000922c:  ARM64_RELOC_BRANCH26	_coil.core.Iterable$slice$iter__i32
    9230:      	ldr	q0, [x29, #0x110]
    9234:      	str	q0, [x29, #0xd0]
    9238:      	ldr	x0, [x29, #0x120]
    923c:      	str	x0, [x29, #0xe0]
    9240:      	add	x0, x29, #0xd0
    9244:      	bl	0x9244 <_stogir.floating.operands+0x15c>
		0000000000009244:  ARM64_RELOC_BRANCH26	_coil.core.Iterator$coil.slice.SliceIter$next__i32
    9248:      	str	x0, [x29, #0x130]
    924c:      	str	x1, [x29, #0x138]
    9250:      	ldr	w0, [x29, #0x130]
    9254:      	cmp	x0, #0x0
    9258:      	b.eq	0x932c <_stogir.floating.operands+0x244>
    925c:      	cmp	x0, #0x1
    9260:      	b.eq	0x926c <_stogir.floating.operands+0x184>
    9264:      	b	0x9268 <_stogir.floating.operands+0x180>
    9268:      	b	0x9574 <_stogir.floating.operands+0x48c>
    926c:      	ldrsw	x0, [x29, #0x138]
    9270:      	add	x8, x29, #0x140
    9274:      	mov	x9, x0
    9278:      	ldr	x0, [x29, #0x2c8]
    927c:      	mov	x1, x9
    9280:      	bl	0x9280 <_stogir.floating.operands+0x198>
		0000000000009280:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    9284:      	ldr	w0, [x29, #0x140]
    9288:      	cmp	x0, #0x0
    928c:      	b.eq	0x92a0 <_stogir.floating.operands+0x1b8>
    9290:      	cmp	x0, #0x1
    9294:      	b.eq	0x92c0 <_stogir.floating.operands+0x1d8>
    9298:      	b	0x929c <_stogir.floating.operands+0x1b4>
    929c:      	b	0x9570 <_stogir.floating.operands+0x488>
    92a0:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		00000000000092a0:  ARM64_RELOC_PAGE21	l_cstr.125
    92a4:      	add	x0, x0, #0x0
		00000000000092a4:  ARM64_RELOC_PAGEOFF12	l_cstr.125
    92a8:      	str	x0, [x29, #0x170]
    92ac:      	mov	w0, #0x18               ; =24
    92b0:      	str	x0, [x29, #0x178]
    92b4:      	ldr	q0, [x29, #0x170]
    92b8:      	str	q0, [x29, #0xa0]
    92bc:      	b	0x9328 <_stogir.floating.operands+0x240>
    92c0:      	mov	w16, #0x148             ; =328
    92c4:      	ldr	q0, [x29, x16]
    92c8:      	str	q0, [x29, #0x180]
    92cc:      	add	x0, x29, #0x180
    92d0:      	bl	0x92d0 <_stogir.floating.operands+0x1e8>
		00000000000092d0:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    92d4:      	ubfx	x0, x0, #0, #8
    92d8:      	sxtw	x0, w0
    92dc:      	str	w0, [x29, #0x190]
    92e0:      	ldr	x0, [x29, #0x2a0]
    92e4:      	str	w0, [x29, #0x194]
    92e8:      	ldrsw	x1, [x29, #0x190]
    92ec:      	ldrsw	x2, [x29, #0x194]
    92f0:      	cmp	x1, x2
    92f4:      	b.ne	0x9300 <_stogir.floating.operands+0x218>
    92f8:      	mov	w19, #0x0               ; =0
    92fc:      	b	0x9304 <_stogir.floating.operands+0x21c>
    9300:      	mov	w19, #0x1               ; =1
    9304:      	cbz	x19, 0x9328 <_stogir.floating.operands+0x240>
    9308:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009308:  ARM64_RELOC_PAGE21	l_cstr.175
    930c:      	add	x0, x0, #0x0
		000000000000930c:  ARM64_RELOC_PAGEOFF12	l_cstr.175
    9310:      	str	x0, [x29, #0x1a0]
    9314:      	mov	w0, #0x1e               ; =30
    9318:      	str	x0, [x29, #0x1a8]
    931c:      	ldr	q0, [x29, #0x1a0]
    9320:      	str	q0, [x29, #0xa0]
    9324:      	b	0x9328 <_stogir.floating.operands+0x240>
    9328:      	b	0x9240 <_stogir.floating.operands+0x158>
    932c:      	ldr	x0, [x29, #0x2b8]
    9330:      	str	w0, [x29, #0x1b0]
    9334:      	str	wzr, [x29, #0x1b4]
    9338:      	ldrsw	x1, [x29, #0x1b0]
    933c:      	ldrsw	x2, [x29, #0x1b4]
    9340:      	cmp	x1, x2
    9344:      	b.ne	0x9354 <_stogir.floating.operands+0x26c>
    9348:      	mov	w1, #0x0                ; =0
    934c:      	str	x1, [x29, #0x2d0]
    9350:      	b	0x935c <_stogir.floating.operands+0x274>
    9354:      	mov	w0, #0x1                ; =1
    9358:      	str	x0, [x29, #0x2d0]
    935c:      	ldr	x0, [x29, #0x2d0]
    9360:      	cbz	x0, 0x94e8 <_stogir.floating.operands+0x400>
    9364:      	ldr	x0, [x29, #0x198]
    9368:      	str	w0, [x29, #0x1b8]
    936c:      	mov	w0, #0x1d               ; =29
    9370:      	str	w0, [x29, #0x1bc]
    9374:      	ldrsw	x0, [x29, #0x1b8]
    9378:      	ldrsw	x1, [x29, #0x1bc]
    937c:      	cmp	x0, x1
    9380:      	b.ne	0x9390 <_stogir.floating.operands+0x2a8>
    9384:      	mov	w0, #0x0                ; =0
    9388:      	str	x0, [x29, #0x198]
    938c:      	b	0x9398 <_stogir.floating.operands+0x2b0>
    9390:      	mov	w0, #0x1                ; =1
    9394:      	str	x0, [x29, #0x198]
    9398:      	ldr	x0, [x29, #0x198]
    939c:      	cbz	x0, 0x93c0 <_stogir.floating.operands+0x2d8>
    93a0:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		00000000000093a0:  ARM64_RELOC_PAGE21	l_cstr.176
    93a4:      	add	x0, x0, #0x0
		00000000000093a4:  ARM64_RELOC_PAGEOFF12	l_cstr.176
    93a8:      	str	x0, [x29, #0x1c0]
    93ac:      	mov	w0, #0x21               ; =33
    93b0:      	str	x0, [x29, #0x1c8]
    93b4:      	ldr	q0, [x29, #0x1c0]
    93b8:      	str	q0, [x29, #0xa0]
    93bc:      	b	0x94e0 <_stogir.floating.operands+0x3f8>
    93c0:      	add	x8, x29, #0x1d0
    93c4:      	ldr	x0, [x29, #0x2c8]
    93c8:      	ldr	x1, [x29, #0x2b8]
    93cc:      	bl	0x93cc <_stogir.floating.operands+0x2e4>
		00000000000093cc:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    93d0:      	ldr	w0, [x29, #0x1d0]
    93d4:      	cmp	x0, #0x0
    93d8:      	b.eq	0x93ec <_stogir.floating.operands+0x304>
    93dc:      	cmp	x0, #0x1
    93e0:      	b.eq	0x940c <_stogir.floating.operands+0x324>
    93e4:      	b	0x93e8 <_stogir.floating.operands+0x300>
    93e8:      	b	0x94e4 <_stogir.floating.operands+0x3fc>
    93ec:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		00000000000093ec:  ARM64_RELOC_PAGE21	l_cstr.63
    93f0:      	add	x0, x0, #0x0
		00000000000093f0:  ARM64_RELOC_PAGEOFF12	l_cstr.63
    93f4:      	str	x0, [x29, #0x200]
    93f8:      	mov	w0, #0x16               ; =22
    93fc:      	str	x0, [x29, #0x208]
    9400:      	ldr	q0, [x29, #0x200]
    9404:      	str	q0, [x29, #0xa0]
    9408:      	b	0x94e0 <_stogir.floating.operands+0x3f8>
    940c:      	mov	w16, #0x1d8             ; =472
    9410:      	ldr	q0, [x29, x16]
    9414:      	str	q0, [x29, #0x210]
    9418:      	ldr	x0, [x29, #0x2b8]
    941c:      	cmp	x0, #0x0
    9420:      	b.ge	0x9430 <_stogir.floating.operands+0x348>
    9424:      	mov	w0, #0x1                ; =1
    9428:      	str	x0, [x29, #0x2b8]
    942c:      	b	0x94b8 <_stogir.floating.operands+0x3d0>
    9430:      	add	x0, x29, #0x210
    9434:      	bl	0x9434 <_stogir.floating.operands+0x34c>
		0000000000009434:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    9438:      	ubfx	x0, x0, #0, #8
    943c:      	sxtw	x0, w0
    9440:      	bl	0x9440 <_stogir.floating.operands+0x358>
		0000000000009440:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-start?
    9444:      	cbz	x0, 0x9454 <_stogir.floating.operands+0x36c>
    9448:      	mov	w0, #0x1                ; =1
    944c:      	str	x0, [x29, #0x2c8]
    9450:      	b	0x9494 <_stogir.floating.operands+0x3ac>
    9454:      	add	x0, x29, #0x210
    9458:      	bl	0x9458 <_stogir.floating.operands+0x370>
		0000000000009458:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    945c:      	ubfx	x0, x0, #0, #8
    9460:      	cmp	x0, #0x65
    9464:      	b.ne	0x9474 <_stogir.floating.operands+0x38c>
    9468:      	mov	w0, #0x1                ; =1
    946c:      	str	x0, [x29, #0x198]
    9470:      	b	0x948c <_stogir.floating.operands+0x3a4>
    9474:      	add	x0, x29, #0x210
    9478:      	bl	0x9478 <_stogir.floating.operands+0x390>
		0000000000009478:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    947c:      	ubfx	x0, x0, #0, #8
    9480:      	cmp	x0, #0x66
    9484:      	cset	x0, eq
    9488:      	str	x0, [x29, #0x198]
    948c:      	ldr	x0, [x29, #0x198]
    9490:      	str	x0, [x29, #0x2c8]
    9494:      	ldr	x0, [x29, #0x2c8]
    9498:      	cbz	x0, 0x94a8 <_stogir.floating.operands+0x3c0>
    949c:      	mov	w0, #0x0                ; =0
    94a0:      	str	x0, [x29, #0x2c8]
    94a4:      	b	0x94b0 <_stogir.floating.operands+0x3c8>
    94a8:      	mov	w0, #0x1                ; =1
    94ac:      	str	x0, [x29, #0x2c8]
    94b0:      	ldr	x0, [x29, #0x2c8]
    94b4:      	str	x0, [x29, #0x2b8]
    94b8:      	ldr	x0, [x29, #0x2b8]
    94bc:      	cbz	x0, 0x94e0 <_stogir.floating.operands+0x3f8>
    94c0:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		00000000000094c0:  ARM64_RELOC_PAGE21	l_cstr.64
    94c4:      	add	x0, x0, #0x0
		00000000000094c4:  ARM64_RELOC_PAGEOFF12	l_cstr.64
    94c8:      	str	x0, [x29, #0x220]
    94cc:      	mov	w0, #0x2d               ; =45
    94d0:      	str	x0, [x29, #0x228]
    94d4:      	ldr	q0, [x29, #0x220]
    94d8:      	str	q0, [x29, #0xa0]
    94dc:      	b	0x94e0 <_stogir.floating.operands+0x3f8>
    94e0:      	b	0x94e8 <_stogir.floating.operands+0x400>
    94e4:      	brk	#0x1
    94e8:      	ldr	q0, [x29, #0xa0]
    94ec:      	str	q0, [x29, #0x230]
    94f0:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		00000000000094f0:  ARM64_RELOC_PAGE21	l_cstr.51
    94f4:      	add	x0, x0, #0x0
		00000000000094f4:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    94f8:      	str	x0, [x29, #0x240]
    94fc:      	str	xzr, [x29, #0x248]
    9500:      	ldr	x0, [x29, #0x230]
    9504:      	ldr	x1, [x29, #0x238]
    9508:      	ldr	x2, [x29, #0x240]
    950c:      	ldr	x3, [x29, #0x248]
    9510:      	bl	0x9510 <_stogir.floating.operands+0x428>
		0000000000009510:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    9514:      	cbz	x0, 0x9530 <_stogir.floating.operands+0x448>
    9518:      	str	wzr, [x29, #0x250]
    951c:      	ldr	x0, [x29, #0x2a0]
    9520:      	str	w0, [x29, #0x258]
    9524:      	add	x0, x29, #0x250
    9528:      	str	x0, [x29, #0x2a0]
    952c:      	b	0x9554 <_stogir.floating.operands+0x46c>
    9530:      	mov	w0, #0x1                ; =1
    9534:      	str	w0, [x29, #0x270]
    9538:      	ldr	q0, [x29, #0xa0]
    953c:      	str	q0, [x29, #0x290]
    9540:      	ldr	q0, [x29, #0x290]
    9544:      	mov	w16, #0x278             ; =632
    9548:      	str	q0, [x29, x16]
    954c:      	add	x0, x29, #0x270
    9550:      	str	x0, [x29, #0x2a0]
    9554:      	ldr	x0, [x29, #0x2c0]
    9558:      	ldr	x1, [x29, #0x2a0]
    955c:      	ldr	q0, [x1]
    9560:      	str	q0, [x0]
    9564:      	ldr	x2, [x1, #0x10]
    9568:      	str	x2, [x0, #0x10]
    956c:      	b	0x9578 <_stogir.floating.operands+0x490>
    9570:      	brk	#0x1
    9574:      	brk	#0x1
    9578:      	ldr	x19, [sp, #0x10]
    957c:      	ldp	x29, x30, [sp]
    9580:      	add	sp, sp, #0x2e0
    9584:      	ret

0000000000009588 <_stogir.types.signed?>:
    9588:      	sxtw	x2, w0
    958c:      	cmp	x2, #0x7
    9590:      	b.lt	0x95a4 <_stogir.types.signed?+0x1c>
    9594:      	cmp	x2, #0xb
    9598:      	cset	x0, le
    959c:      	mov	x2, x0
    95a0:      	b	0x95a8 <_stogir.types.signed?+0x20>
    95a4:      	mov	w2, #0x0                ; =0
    95a8:      	mov	x0, x2
    95ac:      	ret

00000000000095b0 <_stogir.integer-binary.logical?>:
    95b0:      	sxtw	x2, w0
    95b4:      	cmp	x2, #0x2e
    95b8:      	b.ne	0x95c4 <_stogir.integer-binary.logical?+0x14>
    95bc:      	mov	w3, #0x1                ; =1
    95c0:      	b	0x95e4 <_stogir.integer-binary.logical?+0x34>
    95c4:      	cmp	x2, #0x2f
    95c8:      	b.ne	0x95d4 <_stogir.integer-binary.logical?+0x24>
    95cc:      	mov	w4, #0x1                ; =1
    95d0:      	b	0x95e0 <_stogir.integer-binary.logical?+0x30>
    95d4:      	cmp	x2, #0x30
    95d8:      	cset	x0, eq
    95dc:      	mov	x4, x0
    95e0:      	mov	x3, x4
    95e4:      	mov	x0, x3
    95e8:      	ret

00000000000095ec <_inherent$slice$data__i8>:
    95ec:      	stp	x29, x30, [sp, #-0xb0]!
    95f0:      	mov	x29, sp
    95f4:      	str	x0, [x29, #0xa0]
    95f8:      	str	x1, [x29, #0xa8]
    95fc:      	ldr	x0, [x29, #0xa0]
    9600:      	ldp	x29, x30, [sp], #0xb0
    9604:      	ret

0000000000009608 <_inherent$slice$data__u32>:
    9608:      	stp	x29, x30, [sp, #-0xb0]!
    960c:      	mov	x29, sp
    9610:      	str	x0, [x29, #0xa0]
    9614:      	str	x1, [x29, #0xa8]
    9618:      	ldr	x0, [x29, #0xa0]
    961c:      	ldp	x29, x30, [sp], #0xb0
    9620:      	ret

0000000000009624 <_inherent$coil.arraylist.ArrayList$slice__stogir.node.Node>:
    9624:      	stp	x29, x30, [sp, #-0xb0]!
    9628:      	mov	x29, sp
    962c:      	ldr	x1, [x0]
    9630:      	ldr	x0, [x0, #0x8]
    9634:      	mov	x9, x0
    9638:      	mov	x0, x1
    963c:      	mov	x1, x9
    9640:      	bl	0x9640 <_inherent$coil.arraylist.ArrayList$slice__stogir.node.Node+0x1c>
		0000000000009640:  ARM64_RELOC_BRANCH26	_inherent$slice$new__stogir.node.Node
    9644:      	str	x0, [x29, #0xa0]
    9648:      	str	x1, [x29, #0xa8]
    964c:      	ldr	x0, [x29, #0xa0]
    9650:      	ldr	x1, [x29, #0xa8]
    9654:      	ldp	x29, x30, [sp], #0xb0
    9658:      	ret

000000000000965c <_inherent$slice$at__stogir.node.Node>:
    965c:      	stp	x29, x30, [sp, #-0xc0]!
    9660:      	mov	x29, sp
    9664:      	str	x0, [x29, #0xa0]
    9668:      	str	x1, [x29, #0xa8]
    966c:      	ldr	x0, [x29, #0xa0]
    9670:      	ldr	x1, [x29, #0xa8]
    9674:      	str	x2, [x29, #0xb0]
    9678:      	bl	0x9678 <_inherent$slice$at__stogir.node.Node+0x1c>
		0000000000009678:  ARM64_RELOC_BRANCH26	_inherent$slice$data__stogir.node.Node
    967c:      	ldr	x1, [x29, #0xb0]
    9680:      	add	x0, x0, x1, lsl #4
    9684:      	bl	0x9684 <_inherent$slice$at__stogir.node.Node+0x28>
		0000000000009684:  ARM64_RELOC_BRANCH26	_coil.slice.element-ref__stogir.node.Node
    9688:      	ldp	x29, x30, [sp], #0xc0
    968c:      	ret

0000000000009690 <_inherent$slice$new__u8>:
    9690:      	stp	x29, x30, [sp, #-0xd0]!
    9694:      	mov	x29, sp
    9698:      	ldr	q0, [x29, #0xa0]
    969c:      	str	q0, [x29, #0xb0]
    96a0:      	str	x0, [x29, #0xb0]
    96a4:      	ldr	q0, [x29, #0xb0]
    96a8:      	str	q0, [x29, #0xc0]
    96ac:      	str	x1, [x29, #0xc8]
    96b0:      	ldr	x0, [x29, #0xc0]
    96b4:      	ldr	x1, [x29, #0xc8]
    96b8:      	ldp	x29, x30, [sp], #0xd0
    96bc:      	ret

00000000000096c0 <_stogir.vector-lanes.operands>:
    96c0:      	sub	sp, sp, #0x330
    96c4:      	stp	x29, x30, [sp]
    96c8:      	mov	x29, sp
    96cc:      	stp	x19, x20, [sp, #0x10]
    96d0:      	stp	x21, x22, [sp, #0x20]
    96d4:      	str	x23, [sp, #0x30]
    96d8:      	mov	x19, x8
    96dc:      	mov	x20, x0
    96e0:      	sxtw	x21, w1
    96e4:      	sxtw	x22, w2
    96e8:      	sxtw	x23, w3
    96ec:      	sxtw	x4, w4
    96f0:      	sxtw	x5, w5
    96f4:      	sxtw	x6, w6
    96f8:      	add	x8, x29, #0xa0
    96fc:      	mov	x0, x20
    9700:      	mov	x1, x4
    9704:      	str	x5, [x29, #0x268]
    9708:      	str	x6, [x29, #0x178]
    970c:      	bl	0x970c <_stogir.vector-lanes.operands+0x4c>
		000000000000970c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    9710:      	ldr	w0, [x29, #0xa0]
    9714:      	cmp	x0, #0x0
    9718:      	b.eq	0x972c <_stogir.vector-lanes.operands+0x6c>
    971c:      	cmp	x0, #0x1
    9720:      	b.eq	0x975c <_stogir.vector-lanes.operands+0x9c>
    9724:      	b	0x9728 <_stogir.vector-lanes.operands+0x68>
    9728:      	b	0x9db4 <_stogir.vector-lanes.operands+0x6f4>
    972c:      	mov	w0, #0x1                ; =1
    9730:      	str	w0, [x29, #0xd0]
    9734:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009734:  ARM64_RELOC_PAGE21	l_cstr.177
    9738:      	add	x0, x0, #0x0
		0000000000009738:  ARM64_RELOC_PAGEOFF12	l_cstr.177
    973c:      	str	x0, [x29, #0xf0]
    9740:      	mov	w0, #0x1b               ; =27
    9744:      	str	x0, [x29, #0xf8]
    9748:      	ldr	q0, [x29, #0xf0]
    974c:      	stur	q0, [x29, #0xd8]
    9750:      	add	x0, x29, #0xd0
    9754:      	str	x0, [x29, #0x2f0]
    9758:      	b	0x9d98 <_stogir.vector-lanes.operands+0x6d8>
    975c:      	ldur	q0, [x29, #0xa8]
    9760:      	str	q0, [x29, #0x100]
    9764:      	cmp	x21, #0x3d
    9768:      	b.ne	0x9784 <_stogir.vector-lanes.operands+0xc4>
    976c:      	add	x0, x29, #0x100
    9770:      	bl	0x9770 <_stogir.vector-lanes.operands+0xb0>
		0000000000009770:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    9774:      	ubfx	x0, x0, #0, #8
    9778:      	sxtw	x0, w0
    977c:      	str	x0, [x29, #0x2f8]
    9780:      	b	0x9788 <_stogir.vector-lanes.operands+0xc8>
    9784:      	str	x22, [x29, #0x2f8]
    9788:      	cmp	x21, #0x3d
    978c:      	b.ne	0x9798 <_stogir.vector-lanes.operands+0xd8>
    9790:      	str	x22, [x29, #0x300]
    9794:      	b	0x97ac <_stogir.vector-lanes.operands+0xec>
    9798:      	add	x0, x29, #0x100
    979c:      	bl	0x979c <_stogir.vector-lanes.operands+0xdc>
		000000000000979c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    97a0:      	ubfx	x0, x0, #0, #8
    97a4:      	sxtw	x0, w0
    97a8:      	str	x0, [x29, #0x300]
    97ac:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		00000000000097ac:  ARM64_RELOC_PAGE21	l_cstr.51
    97b0:      	add	x0, x0, #0x0
		00000000000097b0:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    97b4:      	str	x0, [x29, #0x120]
    97b8:      	str	xzr, [x29, #0x128]
    97bc:      	ldr	q0, [x29, #0x120]
    97c0:      	str	q0, [x29, #0x110]
    97c4:      	mov	x0, x21
    97c8:      	bl	0x97c8 <_stogir.vector-lanes.operands+0x108>
		00000000000097c8:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operation?
    97cc:      	cbz	x0, 0x97dc <_stogir.vector-lanes.operands+0x11c>
    97d0:      	mov	w0, #0x0                ; =0
    97d4:      	str	x0, [x29, #0x308]
    97d8:      	b	0x97e4 <_stogir.vector-lanes.operands+0x124>
    97dc:      	mov	w0, #0x1                ; =1
    97e0:      	str	x0, [x29, #0x308]
    97e4:      	ldr	x0, [x29, #0x308]
    97e8:      	cbz	x0, 0x97f8 <_stogir.vector-lanes.operands+0x138>
    97ec:      	mov	w0, #0x1                ; =1
    97f0:      	str	x0, [x29, #0x308]
    97f4:      	b	0x98b4 <_stogir.vector-lanes.operands+0x1f4>
    97f8:      	ldr	x0, [x29, #0x2f8]
    97fc:      	bl	0x97fc <_stogir.vector-lanes.operands+0x13c>
		00000000000097fc:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    9800:      	cbz	x0, 0x9810 <_stogir.vector-lanes.operands+0x150>
    9804:      	mov	w0, #0x0                ; =0
    9808:      	str	x0, [x29, #0x310]
    980c:      	b	0x9818 <_stogir.vector-lanes.operands+0x158>
    9810:      	mov	w0, #0x1                ; =1
    9814:      	str	x0, [x29, #0x310]
    9818:      	ldr	x0, [x29, #0x310]
    981c:      	cbz	x0, 0x982c <_stogir.vector-lanes.operands+0x16c>
    9820:      	mov	w0, #0x1                ; =1
    9824:      	str	x0, [x29, #0x310]
    9828:      	b	0x98ac <_stogir.vector-lanes.operands+0x1ec>
    982c:      	cmp	x23, #0x4
    9830:      	b.ne	0x9840 <_stogir.vector-lanes.operands+0x180>
    9834:      	mov	w0, #0x1                ; =1
    9838:      	str	x0, [x29, #0x318]
    983c:      	b	0x984c <_stogir.vector-lanes.operands+0x18c>
    9840:      	cmp	x23, #0x8
    9844:      	cset	x0, eq
    9848:      	str	x0, [x29, #0x318]
    984c:      	ldr	x0, [x29, #0x318]
    9850:      	cbz	x0, 0x9860 <_stogir.vector-lanes.operands+0x1a0>
    9854:      	mov	w0, #0x0                ; =0
    9858:      	str	x0, [x29, #0x318]
    985c:      	b	0x9868 <_stogir.vector-lanes.operands+0x1a8>
    9860:      	mov	w0, #0x1                ; =1
    9864:      	str	x0, [x29, #0x318]
    9868:      	ldr	x0, [x29, #0x318]
    986c:      	cbz	x0, 0x987c <_stogir.vector-lanes.operands+0x1bc>
    9870:      	mov	w0, #0x1                ; =1
    9874:      	str	x0, [x29, #0x318]
    9878:      	b	0x98a4 <_stogir.vector-lanes.operands+0x1e4>
    987c:      	add	x0, x29, #0x100
    9880:      	bl	0x9880 <_stogir.vector-lanes.operands+0x1c0>
		0000000000009880:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.ordinary?
    9884:      	cbz	x0, 0x9894 <_stogir.vector-lanes.operands+0x1d4>
    9888:      	mov	w0, #0x0                ; =0
    988c:      	str	x0, [x29, #0x320]
    9890:      	b	0x989c <_stogir.vector-lanes.operands+0x1dc>
    9894:      	mov	w0, #0x1                ; =1
    9898:      	str	x0, [x29, #0x320]
    989c:      	ldr	x0, [x29, #0x320]
    98a0:      	str	x0, [x29, #0x318]
    98a4:      	ldr	x0, [x29, #0x318]
    98a8:      	str	x0, [x29, #0x310]
    98ac:      	ldr	x0, [x29, #0x310]
    98b0:      	str	x0, [x29, #0x308]
    98b4:      	ldr	x0, [x29, #0x308]
    98b8:      	cbz	x0, 0x98dc <_stogir.vector-lanes.operands+0x21c>
    98bc:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		00000000000098bc:  ARM64_RELOC_PAGE21	l_cstr.178
    98c0:      	add	x0, x0, #0x0
		00000000000098c0:  ARM64_RELOC_PAGEOFF12	l_cstr.178
    98c4:      	str	x0, [x29, #0x130]
    98c8:      	mov	w0, #0x36               ; =54
    98cc:      	str	x0, [x29, #0x138]
    98d0:      	ldr	q0, [x29, #0x130]
    98d4:      	str	q0, [x29, #0x110]
    98d8:      	b	0x98dc <_stogir.vector-lanes.operands+0x21c>
    98dc:      	cmp	x21, #0x3f
    98e0:      	b.ne	0x99d0 <_stogir.vector-lanes.operands+0x310>
    98e4:      	ldr	x0, [x29, #0x2f8]
    98e8:      	ldr	x1, [x29, #0x300]
    98ec:      	mov	x2, x23
    98f0:      	bl	0x98f0 <_stogir.vector-lanes.operands+0x230>
		00000000000098f0:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    98f4:      	cbz	x0, 0x9904 <_stogir.vector-lanes.operands+0x244>
    98f8:      	mov	w0, #0x0                ; =0
    98fc:      	str	x0, [x29, #0x300]
    9900:      	b	0x990c <_stogir.vector-lanes.operands+0x24c>
    9904:      	mov	w0, #0x1                ; =1
    9908:      	str	x0, [x29, #0x300]
    990c:      	ldr	x0, [x29, #0x300]
    9910:      	cbz	x0, 0x9920 <_stogir.vector-lanes.operands+0x260>
    9914:      	mov	w0, #0x1                ; =1
    9918:      	str	x0, [x29, #0x300]
    991c:      	b	0x99a4 <_stogir.vector-lanes.operands+0x2e4>
    9920:      	ldr	x0, [x29, #0x268]
    9924:      	str	w0, [x29, #0x140]
    9928:      	str	wzr, [x29, #0x144]
    992c:      	ldrsw	x1, [x29, #0x140]
    9930:      	ldrsw	x2, [x29, #0x144]
    9934:      	cmp	x1, x2
    9938:      	b.ne	0x9948 <_stogir.vector-lanes.operands+0x288>
    993c:      	mov	w1, #0x0                ; =0
    9940:      	str	x1, [x29, #0x308]
    9944:      	b	0x9950 <_stogir.vector-lanes.operands+0x290>
    9948:      	mov	w0, #0x1                ; =1
    994c:      	str	x0, [x29, #0x308]
    9950:      	ldr	x0, [x29, #0x308]
    9954:      	cbz	x0, 0x9964 <_stogir.vector-lanes.operands+0x2a4>
    9958:      	mov	w0, #0x1                ; =1
    995c:      	str	x0, [x29, #0x308]
    9960:      	b	0x999c <_stogir.vector-lanes.operands+0x2dc>
    9964:      	ldr	x0, [x29, #0x178]
    9968:      	str	w0, [x29, #0x148]
    996c:      	str	wzr, [x29, #0x14c]
    9970:      	ldrsw	x1, [x29, #0x148]
    9974:      	ldrsw	x2, [x29, #0x14c]
    9978:      	cmp	x1, x2
    997c:      	b.ne	0x998c <_stogir.vector-lanes.operands+0x2cc>
    9980:      	mov	w1, #0x0                ; =0
    9984:      	str	x1, [x29, #0x310]
    9988:      	b	0x9994 <_stogir.vector-lanes.operands+0x2d4>
    998c:      	mov	w0, #0x1                ; =1
    9990:      	str	x0, [x29, #0x310]
    9994:      	ldr	x0, [x29, #0x310]
    9998:      	str	x0, [x29, #0x308]
    999c:      	ldr	x0, [x29, #0x308]
    99a0:      	str	x0, [x29, #0x300]
    99a4:      	ldr	x0, [x29, #0x300]
    99a8:      	cbz	x0, 0x99cc <_stogir.vector-lanes.operands+0x30c>
    99ac:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		00000000000099ac:  ARM64_RELOC_PAGE21	l_cstr.179
    99b0:      	add	x0, x0, #0x0
		00000000000099b0:  ARM64_RELOC_PAGEOFF12	l_cstr.179
    99b4:      	str	x0, [x29, #0x150]
    99b8:      	mov	w0, #0x24               ; =36
    99bc:      	str	x0, [x29, #0x158]
    99c0:      	ldr	q0, [x29, #0x150]
    99c4:      	str	q0, [x29, #0x110]
    99c8:      	b	0x99cc <_stogir.vector-lanes.operands+0x30c>
    99cc:      	b	0x9d30 <_stogir.vector-lanes.operands+0x670>
    99d0:      	cmp	x21, #0x3d
    99d4:      	b.ne	0x9a00 <_stogir.vector-lanes.operands+0x340>
    99d8:      	ldr	x0, [x29, #0x2f8]
    99dc:      	mov	x1, x22
    99e0:      	mov	x2, x23
    99e4:      	bl	0x99e4 <_stogir.vector-lanes.operands+0x324>
		00000000000099e4:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    99e8:      	cbz	x0, 0x99f4 <_stogir.vector-lanes.operands+0x334>
    99ec:      	mov	w22, #0x0               ; =0
    99f0:      	b	0x99f8 <_stogir.vector-lanes.operands+0x338>
    99f4:      	mov	w22, #0x1               ; =1
    99f8:      	str	x22, [x29, #0x300]
    99fc:      	b	0x9a08 <_stogir.vector-lanes.operands+0x348>
    9a00:      	mov	w0, #0x0                ; =0
    9a04:      	str	x0, [x29, #0x300]
    9a08:      	ldr	x0, [x29, #0x300]
    9a0c:      	cbz	x0, 0x9a30 <_stogir.vector-lanes.operands+0x370>
    9a10:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009a10:  ARM64_RELOC_PAGE21	l_cstr.180
    9a14:      	add	x0, x0, #0x0
		0000000000009a14:  ARM64_RELOC_PAGEOFF12	l_cstr.180
    9a18:      	str	x0, [x29, #0x160]
    9a1c:      	mov	w0, #0x26               ; =38
    9a20:      	str	x0, [x29, #0x168]
    9a24:      	ldr	q0, [x29, #0x160]
    9a28:      	str	q0, [x29, #0x110]
    9a2c:      	b	0x9a30 <_stogir.vector-lanes.operands+0x370>
    9a30:      	cmp	x21, #0x3e
    9a34:      	b.ne	0x9a78 <_stogir.vector-lanes.operands+0x3b8>
    9a38:      	add	x0, x29, #0x100
    9a3c:      	bl	0x9a3c <_stogir.vector-lanes.operands+0x37c>
		0000000000009a3c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    9a40:      	ubfx	x0, x0, #0, #8
    9a44:      	sxtw	x0, w0
    9a48:      	str	w0, [x29, #0x170]
    9a4c:      	ldr	x0, [x29, #0x2f8]
    9a50:      	str	w0, [x29, #0x174]
    9a54:      	ldrsw	x1, [x29, #0x170]
    9a58:      	ldrsw	x2, [x29, #0x174]
    9a5c:      	cmp	x1, x2
    9a60:      	b.ne	0x9a6c <_stogir.vector-lanes.operands+0x3ac>
    9a64:      	mov	w22, #0x0               ; =0
    9a68:      	b	0x9a70 <_stogir.vector-lanes.operands+0x3b0>
    9a6c:      	mov	w22, #0x1               ; =1
    9a70:      	str	x22, [x29, #0x300]
    9a74:      	b	0x9a80 <_stogir.vector-lanes.operands+0x3c0>
    9a78:      	mov	w0, #0x0                ; =0
    9a7c:      	str	x0, [x29, #0x300]
    9a80:      	ldr	x0, [x29, #0x300]
    9a84:      	cbz	x0, 0x9aa8 <_stogir.vector-lanes.operands+0x3e8>
    9a88:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009a88:  ARM64_RELOC_PAGE21	l_cstr.181
    9a8c:      	add	x0, x0, #0x0
		0000000000009a8c:  ARM64_RELOC_PAGEOFF12	l_cstr.181
    9a90:      	str	x0, [x29, #0x180]
    9a94:      	mov	w0, #0x27               ; =39
    9a98:      	str	x0, [x29, #0x188]
    9a9c:      	ldr	q0, [x29, #0x180]
    9aa0:      	str	q0, [x29, #0x110]
    9aa4:      	b	0x9aa8 <_stogir.vector-lanes.operands+0x3e8>
    9aa8:      	add	x8, x29, #0x190
    9aac:      	mov	x0, x20
    9ab0:      	ldr	x1, [x29, #0x268]
    9ab4:      	bl	0x9ab4 <_stogir.vector-lanes.operands+0x3f4>
		0000000000009ab4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    9ab8:      	ldr	w0, [x29, #0x190]
    9abc:      	cmp	x0, #0x0
    9ac0:      	b.eq	0x9ad4 <_stogir.vector-lanes.operands+0x414>
    9ac4:      	cmp	x0, #0x1
    9ac8:      	b.eq	0x9af4 <_stogir.vector-lanes.operands+0x434>
    9acc:      	b	0x9ad0 <_stogir.vector-lanes.operands+0x410>
    9ad0:      	b	0x9db0 <_stogir.vector-lanes.operands+0x6f0>
    9ad4:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009ad4:  ARM64_RELOC_PAGE21	l_cstr.182
    9ad8:      	add	x0, x0, #0x0
		0000000000009ad8:  ARM64_RELOC_PAGEOFF12	l_cstr.182
    9adc:      	str	x0, [x29, #0x1c0]
    9ae0:      	mov	w0, #0x19               ; =25
    9ae4:      	str	x0, [x29, #0x1c8]
    9ae8:      	ldr	q0, [x29, #0x1c0]
    9aec:      	str	q0, [x29, #0x110]
    9af0:      	b	0x9bfc <_stogir.vector-lanes.operands+0x53c>
    9af4:      	mov	w16, #0x198             ; =408
    9af8:      	ldr	q0, [x29, x16]
    9afc:      	str	q0, [x29, #0x1d0]
    9b00:      	add	x0, x29, #0x1d0
    9b04:      	bl	0x9b04 <_stogir.vector-lanes.operands+0x444>
		0000000000009b04:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    9b08:      	ubfx	x0, x0, #0, #8
    9b0c:      	sxtw	x0, w0
    9b10:      	bl	0x9b10 <_stogir.vector-lanes.operands+0x450>
		0000000000009b10:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    9b14:      	cbz	x0, 0x9b20 <_stogir.vector-lanes.operands+0x460>
    9b18:      	mov	w22, #0x0               ; =0
    9b1c:      	b	0x9b24 <_stogir.vector-lanes.operands+0x464>
    9b20:      	mov	w22, #0x1               ; =1
    9b24:      	cbz	x22, 0x9b30 <_stogir.vector-lanes.operands+0x470>
    9b28:      	mov	w22, #0x1               ; =1
    9b2c:      	b	0x9b54 <_stogir.vector-lanes.operands+0x494>
    9b30:      	add	x0, x29, #0x1d0
    9b34:      	bl	0x9b34 <_stogir.vector-lanes.operands+0x474>
		0000000000009b34:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.ordinary?
    9b38:      	cbz	x0, 0x9b48 <_stogir.vector-lanes.operands+0x488>
    9b3c:      	mov	w0, #0x0                ; =0
    9b40:      	str	x0, [x29, #0x300]
    9b44:      	b	0x9b50 <_stogir.vector-lanes.operands+0x490>
    9b48:      	mov	w0, #0x1                ; =1
    9b4c:      	str	x0, [x29, #0x300]
    9b50:      	ldr	x22, [x29, #0x300]
    9b54:      	cbz	x22, 0x9b78 <_stogir.vector-lanes.operands+0x4b8>
    9b58:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009b58:  ARM64_RELOC_PAGE21	l_cstr.183
    9b5c:      	add	x0, x0, #0x0
		0000000000009b5c:  ARM64_RELOC_PAGEOFF12	l_cstr.183
    9b60:      	str	x0, [x29, #0x1e0]
    9b64:      	mov	w0, #0x2b               ; =43
    9b68:      	str	x0, [x29, #0x1e8]
    9b6c:      	ldr	q0, [x29, #0x1e0]
    9b70:      	str	q0, [x29, #0x110]
    9b74:      	b	0x9b78 <_stogir.vector-lanes.operands+0x4b8>
    9b78:      	ldr	x0, [x29, #0x268]
    9b7c:      	cmp	x0, #0x0
    9b80:      	b.ge	0x9bcc <_stogir.vector-lanes.operands+0x50c>
    9b84:      	add	x0, x29, #0x1d0
    9b88:      	bl	0x9b88 <_stogir.vector-lanes.operands+0x4c8>
		0000000000009b88:  ARM64_RELOC_BRANCH26	_stogir.symbols.numeric?
    9b8c:      	cbz	x0, 0x9bc0 <_stogir.vector-lanes.operands+0x500>
    9b90:      	add	x0, x29, #0x1d0
    9b94:      	bl	0x9b94 <_stogir.vector-lanes.operands+0x4d4>
		0000000000009b94:  ARM64_RELOC_BRANCH26	_stogir.node.constant-bits
    9b98:      	mov	x9, x0
    9b9c:      	ldr	x0, [x29, #0x2f8]
    9ba0:      	str	x9, [x29, #0x268]
    9ba4:      	bl	0x9ba4 <_stogir.vector-lanes.operands+0x4e4>
		0000000000009ba4:  ARM64_RELOC_BRANCH26	_stogir.types.lanes
    9ba8:      	sxtw	x0, w0
    9bac:      	ldr	x1, [x29, #0x268]
    9bb0:      	cmp	x1, x0
    9bb4:      	cset	x0, hs
    9bb8:      	mov	x22, x0
    9bbc:      	b	0x9bc4 <_stogir.vector-lanes.operands+0x504>
    9bc0:      	mov	w22, #0x0               ; =0
    9bc4:      	str	x22, [x29, #0x268]
    9bc8:      	b	0x9bd4 <_stogir.vector-lanes.operands+0x514>
    9bcc:      	mov	w0, #0x0                ; =0
    9bd0:      	str	x0, [x29, #0x268]
    9bd4:      	ldr	x0, [x29, #0x268]
    9bd8:      	cbz	x0, 0x9bfc <_stogir.vector-lanes.operands+0x53c>
    9bdc:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009bdc:  ARM64_RELOC_PAGE21	l_cstr.184
    9be0:      	add	x0, x0, #0x0
		0000000000009be0:  ARM64_RELOC_PAGEOFF12	l_cstr.184
    9be4:      	str	x0, [x29, #0x1f0]
    9be8:      	mov	w0, #0x28               ; =40
    9bec:      	str	x0, [x29, #0x1f8]
    9bf0:      	ldr	q0, [x29, #0x1f0]
    9bf4:      	str	q0, [x29, #0x110]
    9bf8:      	b	0x9bfc <_stogir.vector-lanes.operands+0x53c>
    9bfc:      	cmp	x21, #0x3e
    9c00:      	b.ne	0x9ce4 <_stogir.vector-lanes.operands+0x624>
    9c04:      	add	x8, x29, #0x200
    9c08:      	mov	x0, x20
    9c0c:      	ldr	x1, [x29, #0x178]
    9c10:      	bl	0x9c10 <_stogir.vector-lanes.operands+0x550>
		0000000000009c10:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    9c14:      	ldr	w0, [x29, #0x200]
    9c18:      	cmp	x0, #0x0
    9c1c:      	b.eq	0x9c30 <_stogir.vector-lanes.operands+0x570>
    9c20:      	cmp	x0, #0x1
    9c24:      	b.eq	0x9c50 <_stogir.vector-lanes.operands+0x590>
    9c28:      	b	0x9c2c <_stogir.vector-lanes.operands+0x56c>
    9c2c:      	b	0x9ce0 <_stogir.vector-lanes.operands+0x620>
    9c30:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009c30:  ARM64_RELOC_PAGE21	l_cstr.185
    9c34:      	add	x0, x0, #0x0
		0000000000009c34:  ARM64_RELOC_PAGEOFF12	l_cstr.185
    9c38:      	str	x0, [x29, #0x230]
    9c3c:      	mov	w0, #0x20               ; =32
    9c40:      	str	x0, [x29, #0x238]
    9c44:      	ldr	q0, [x29, #0x230]
    9c48:      	str	q0, [x29, #0x110]
    9c4c:      	b	0x9cdc <_stogir.vector-lanes.operands+0x61c>
    9c50:      	mov	w16, #0x208             ; =520
    9c54:      	ldr	q0, [x29, x16]
    9c58:      	str	q0, [x29, #0x240]
    9c5c:      	add	x0, x29, #0x240
    9c60:      	bl	0x9c60 <_stogir.vector-lanes.operands+0x5a0>
		0000000000009c60:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.ordinary?
    9c64:      	cbz	x0, 0x9c70 <_stogir.vector-lanes.operands+0x5b0>
    9c68:      	mov	w20, #0x0               ; =0
    9c6c:      	b	0x9c74 <_stogir.vector-lanes.operands+0x5b4>
    9c70:      	mov	w20, #0x1               ; =1
    9c74:      	cbz	x20, 0x9c80 <_stogir.vector-lanes.operands+0x5c0>
    9c78:      	mov	w20, #0x1               ; =1
    9c7c:      	b	0x9cb8 <_stogir.vector-lanes.operands+0x5f8>
    9c80:      	add	x0, x29, #0x240
    9c84:      	bl	0x9c84 <_stogir.vector-lanes.operands+0x5c4>
		0000000000009c84:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    9c88:      	ubfx	x0, x0, #0, #8
    9c8c:      	sxtw	x0, w0
    9c90:      	mov	x9, x0
    9c94:      	ldr	x0, [x29, #0x2f8]
    9c98:      	mov	x1, x9
    9c9c:      	mov	x2, x23
    9ca0:      	bl	0x9ca0 <_stogir.vector-lanes.operands+0x5e0>
		0000000000009ca0:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    9ca4:      	cbz	x0, 0x9cb0 <_stogir.vector-lanes.operands+0x5f0>
    9ca8:      	mov	w21, #0x0               ; =0
    9cac:      	b	0x9cb4 <_stogir.vector-lanes.operands+0x5f4>
    9cb0:      	mov	w21, #0x1               ; =1
    9cb4:      	mov	x20, x21
    9cb8:      	cbz	x20, 0x9cdc <_stogir.vector-lanes.operands+0x61c>
    9cbc:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009cbc:  ARM64_RELOC_PAGE21	l_cstr.186
    9cc0:      	add	x0, x0, #0x0
		0000000000009cc0:  ARM64_RELOC_PAGEOFF12	l_cstr.186
    9cc4:      	str	x0, [x29, #0x250]
    9cc8:      	mov	w0, #0x27               ; =39
    9ccc:      	str	x0, [x29, #0x258]
    9cd0:      	ldr	q0, [x29, #0x250]
    9cd4:      	str	q0, [x29, #0x110]
    9cd8:      	b	0x9cdc <_stogir.vector-lanes.operands+0x61c>
    9cdc:      	b	0x9d30 <_stogir.vector-lanes.operands+0x670>
    9ce0:      	brk	#0x1
    9ce4:      	ldr	x0, [x29, #0x178]
    9ce8:      	str	w0, [x29, #0x260]
    9cec:      	str	wzr, [x29, #0x264]
    9cf0:      	ldrsw	x0, [x29, #0x260]
    9cf4:      	ldrsw	x1, [x29, #0x264]
    9cf8:      	cmp	x0, x1
    9cfc:      	b.ne	0x9d08 <_stogir.vector-lanes.operands+0x648>
    9d00:      	mov	w20, #0x0               ; =0
    9d04:      	b	0x9d0c <_stogir.vector-lanes.operands+0x64c>
    9d08:      	mov	w20, #0x1               ; =1
    9d0c:      	cbz	x20, 0x9d30 <_stogir.vector-lanes.operands+0x670>
    9d10:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009d10:  ARM64_RELOC_PAGE21	l_cstr.187
    9d14:      	add	x0, x0, #0x0
		0000000000009d14:  ARM64_RELOC_PAGEOFF12	l_cstr.187
    9d18:      	str	x0, [x29, #0x270]
    9d1c:      	mov	w0, #0x20               ; =32
    9d20:      	str	x0, [x29, #0x278]
    9d24:      	ldr	q0, [x29, #0x270]
    9d28:      	str	q0, [x29, #0x110]
    9d2c:      	b	0x9d30 <_stogir.vector-lanes.operands+0x670>
    9d30:      	ldr	q0, [x29, #0x110]
    9d34:      	str	q0, [x29, #0x280]
    9d38:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009d38:  ARM64_RELOC_PAGE21	l_cstr.51
    9d3c:      	add	x0, x0, #0x0
		0000000000009d3c:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    9d40:      	str	x0, [x29, #0x290]
    9d44:      	str	xzr, [x29, #0x298]
    9d48:      	ldr	x0, [x29, #0x280]
    9d4c:      	ldr	x1, [x29, #0x288]
    9d50:      	ldr	x2, [x29, #0x290]
    9d54:      	ldr	x3, [x29, #0x298]
    9d58:      	bl	0x9d58 <_stogir.vector-lanes.operands+0x698>
		0000000000009d58:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    9d5c:      	cbz	x0, 0x9d74 <_stogir.vector-lanes.operands+0x6b4>
    9d60:      	str	wzr, [x29, #0x2a0]
    9d64:      	ldr	x0, [x29, #0x2f8]
    9d68:      	str	w0, [x29, #0x2a8]
    9d6c:      	add	x20, x29, #0x2a0
    9d70:      	b	0x9d94 <_stogir.vector-lanes.operands+0x6d4>
    9d74:      	mov	w0, #0x1                ; =1
    9d78:      	str	w0, [x29, #0x2c0]
    9d7c:      	ldr	q0, [x29, #0x110]
    9d80:      	str	q0, [x29, #0x2e0]
    9d84:      	ldr	q0, [x29, #0x2e0]
    9d88:      	mov	w16, #0x2c8             ; =712
    9d8c:      	str	q0, [x29, x16]
    9d90:      	add	x20, x29, #0x2c0
    9d94:      	str	x20, [x29, #0x2f0]
    9d98:      	ldr	x0, [x29, #0x2f0]
    9d9c:      	ldr	q0, [x0]
    9da0:      	str	q0, [x19]
    9da4:      	ldr	x1, [x0, #0x10]
    9da8:      	str	x1, [x19, #0x10]
    9dac:      	b	0x9db8 <_stogir.vector-lanes.operands+0x6f8>
    9db0:      	brk	#0x1
    9db4:      	brk	#0x1
    9db8:      	ldp	x19, x20, [sp, #0x10]
    9dbc:      	ldp	x21, x22, [sp, #0x20]
    9dc0:      	ldr	x23, [sp, #0x30]
    9dc4:      	ldp	x29, x30, [sp]
    9dc8:      	add	sp, sp, #0x330
    9dcc:      	ret

0000000000009dd0 <_stogir.vector-comparison.operation?>:
    9dd0:      	sxtw	x2, w0
    9dd4:      	cmp	x2, #0xe
    9dd8:      	b.lt	0x9dec <_stogir.vector-comparison.operation?+0x1c>
    9ddc:      	cmp	x2, #0x19
    9de0:      	cset	x0, le
    9de4:      	mov	x2, x0
    9de8:      	b	0x9df0 <_stogir.vector-comparison.operation?+0x20>
    9dec:      	mov	w2, #0x0                ; =0
    9df0:      	mov	x0, x2
    9df4:      	ret

0000000000009df8 <_stogir.vector-comparison.operands>:
    9df8:      	sub	sp, sp, #0x240
    9dfc:      	stp	x29, x30, [sp]
    9e00:      	mov	x29, sp
    9e04:      	stp	x19, x20, [sp, #0x10]
    9e08:      	stp	x21, x22, [sp, #0x20]
    9e0c:      	str	x23, [sp, #0x30]
    9e10:      	mov	x19, x8
    9e14:      	mov	x20, x0
    9e18:      	sxtw	x21, w1
    9e1c:      	sxtw	x22, w2
    9e20:      	sxtw	x23, w3
    9e24:      	sxtw	x4, w4
    9e28:      	sxtw	x5, w5
    9e2c:      	add	x8, x29, #0xa0
    9e30:      	mov	x0, x20
    9e34:      	mov	x1, x4
    9e38:      	str	x5, [x29, #0x198]
    9e3c:      	bl	0x9e3c <_stogir.vector-comparison.operands+0x44>
		0000000000009e3c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    9e40:      	ldr	w0, [x29, #0xa0]
    9e44:      	cmp	x0, #0x0
    9e48:      	b.eq	0x9e5c <_stogir.vector-comparison.operands+0x64>
    9e4c:      	cmp	x0, #0x1
    9e50:      	b.eq	0x9e8c <_stogir.vector-comparison.operands+0x94>
    9e54:      	b	0x9e58 <_stogir.vector-comparison.operands+0x60>
    9e58:      	b	0xa22c <_stogir.vector-comparison.operands+0x434>
    9e5c:      	mov	w0, #0x1                ; =1
    9e60:      	str	w0, [x29, #0xd0]
    9e64:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009e64:  ARM64_RELOC_PAGE21	l_cstr.188
    9e68:      	add	x0, x0, #0x0
		0000000000009e68:  ARM64_RELOC_PAGEOFF12	l_cstr.188
    9e6c:      	str	x0, [x29, #0xf0]
    9e70:      	mov	w0, #0x21               ; =33
    9e74:      	str	x0, [x29, #0xf8]
    9e78:      	ldr	q0, [x29, #0xf0]
    9e7c:      	stur	q0, [x29, #0xd8]
    9e80:      	add	x0, x29, #0xd0
    9e84:      	str	x0, [x29, #0x1f0]
    9e88:      	b	0xa210 <_stogir.vector-comparison.operands+0x418>
    9e8c:      	ldur	q0, [x29, #0xa8]
    9e90:      	str	q0, [x29, #0x100]
    9e94:      	add	x8, x29, #0x110
    9e98:      	mov	x0, x20
    9e9c:      	ldr	x1, [x29, #0x198]
    9ea0:      	bl	0x9ea0 <_stogir.vector-comparison.operands+0xa8>
		0000000000009ea0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    9ea4:      	ldr	w0, [x29, #0x110]
    9ea8:      	cmp	x0, #0x0
    9eac:      	b.eq	0x9ec0 <_stogir.vector-comparison.operands+0xc8>
    9eb0:      	cmp	x0, #0x1
    9eb4:      	b.eq	0x9ef0 <_stogir.vector-comparison.operands+0xf8>
    9eb8:      	b	0x9ebc <_stogir.vector-comparison.operands+0xc4>
    9ebc:      	b	0xa228 <_stogir.vector-comparison.operands+0x430>
    9ec0:      	mov	w0, #0x1                ; =1
    9ec4:      	str	w0, [x29, #0x140]
    9ec8:      	adrp	x0, 0x9000 <_stogir.conditional.operands+0x368>
		0000000000009ec8:  ARM64_RELOC_PAGE21	l_cstr.188
    9ecc:      	add	x0, x0, #0x0
		0000000000009ecc:  ARM64_RELOC_PAGEOFF12	l_cstr.188
    9ed0:      	str	x0, [x29, #0x160]
    9ed4:      	mov	w0, #0x21               ; =33
    9ed8:      	str	x0, [x29, #0x168]
    9edc:      	ldr	q0, [x29, #0x160]
    9ee0:      	mov	w16, #0x148             ; =328
    9ee4:      	str	q0, [x29, x16]
    9ee8:      	add	x20, x29, #0x140
    9eec:      	b	0xa20c <_stogir.vector-comparison.operands+0x414>
    9ef0:      	mov	w16, #0x118             ; =280
    9ef4:      	ldr	q0, [x29, x16]
    9ef8:      	str	q0, [x29, #0x170]
    9efc:      	add	x0, x29, #0x100
    9f00:      	bl	0x9f00 <_stogir.vector-comparison.operands+0x108>
		0000000000009f00:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    9f04:      	ubfx	x0, x0, #0, #8
    9f08:      	sxtw	x0, w0
    9f0c:      	cmp	x23, #0x4
    9f10:      	str	x0, [x29, #0x198]
    9f14:      	b.ne	0x9f24 <_stogir.vector-comparison.operands+0x12c>
    9f18:      	mov	w1, #0x1                ; =1
    9f1c:      	str	x1, [x29, #0x1f8]
    9f20:      	b	0x9f30 <_stogir.vector-comparison.operands+0x138>
    9f24:      	cmp	x23, #0x8
    9f28:      	cset	x0, eq
    9f2c:      	str	x0, [x29, #0x1f8]
    9f30:      	ldr	x0, [x29, #0x1f8]
    9f34:      	cbz	x0, 0x9f44 <_stogir.vector-comparison.operands+0x14c>
    9f38:      	mov	w0, #0x0                ; =0
    9f3c:      	str	x0, [x29, #0x1f8]
    9f40:      	b	0x9f4c <_stogir.vector-comparison.operands+0x154>
    9f44:      	mov	w0, #0x1                ; =1
    9f48:      	str	x0, [x29, #0x1f8]
    9f4c:      	ldr	x0, [x29, #0x1f8]
    9f50:      	cbz	x0, 0x9f60 <_stogir.vector-comparison.operands+0x168>
    9f54:      	mov	w0, #0x1                ; =1
    9f58:      	str	x0, [x29, #0x1f8]
    9f5c:      	b	0xa1c0 <_stogir.vector-comparison.operands+0x3c8>
    9f60:      	mov	x0, x21
    9f64:      	ldr	x1, [x29, #0x198]
    9f68:      	bl	0x9f68 <_stogir.vector-comparison.operands+0x170>
		0000000000009f68:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.valid-type?
    9f6c:      	cbz	x0, 0x9f78 <_stogir.vector-comparison.operands+0x180>
    9f70:      	mov	w21, #0x0               ; =0
    9f74:      	b	0x9f7c <_stogir.vector-comparison.operands+0x184>
    9f78:      	mov	w21, #0x1               ; =1
    9f7c:      	cbz	x21, 0x9f88 <_stogir.vector-comparison.operands+0x190>
    9f80:      	mov	w21, #0x1               ; =1
    9f84:      	b	0xa1bc <_stogir.vector-comparison.operands+0x3c4>
    9f88:      	add	x0, x29, #0x100
    9f8c:      	bl	0x9f8c <_stogir.vector-comparison.operands+0x194>
		0000000000009f8c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    9f90:      	ubfx	x0, x0, #0, #8
    9f94:      	strb	w0, [x29, #0x180]
    9f98:      	add	x0, x29, #0x170
    9f9c:      	bl	0x9f9c <_stogir.vector-comparison.operands+0x1a4>
		0000000000009f9c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    9fa0:      	ubfx	x0, x0, #0, #8
    9fa4:      	strb	w0, [x29, #0x181]
    9fa8:      	ldrb	w0, [x29, #0x180]
    9fac:      	ldrb	w1, [x29, #0x181]
    9fb0:      	cmp	x0, x1
    9fb4:      	b.ne	0x9fc4 <_stogir.vector-comparison.operands+0x1cc>
    9fb8:      	mov	w0, #0x0                ; =0
    9fbc:      	str	x0, [x29, #0x200]
    9fc0:      	b	0x9fcc <_stogir.vector-comparison.operands+0x1d4>
    9fc4:      	mov	w0, #0x1                ; =1
    9fc8:      	str	x0, [x29, #0x200]
    9fcc:      	ldr	x0, [x29, #0x200]
    9fd0:      	cbz	x0, 0x9fe0 <_stogir.vector-comparison.operands+0x1e8>
    9fd4:      	mov	w0, #0x1                ; =1
    9fd8:      	str	x0, [x29, #0x200]
    9fdc:      	b	0xa1b8 <_stogir.vector-comparison.operands+0x3c0>
    9fe0:      	add	x0, x29, #0x100
    9fe4:      	bl	0x9fe4 <_stogir.vector-comparison.operands+0x1ec>
		0000000000009fe4:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    9fe8:      	ubfx	x0, x0, #0, #8
    9fec:      	cmp	x0, #0x48
    9ff0:      	b.ne	0xa000 <_stogir.vector-comparison.operands+0x208>
    9ff4:      	mov	w0, #0x1                ; =1
    9ff8:      	str	x0, [x29, #0x208]
    9ffc:      	b	0xa1b0 <_stogir.vector-comparison.operands+0x3b8>
    a000:      	add	x0, x29, #0x100
    a004:      	bl	0xa004 <_stogir.vector-comparison.operands+0x20c>
		000000000000a004:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    a008:      	ubfx	x0, x0, #0, #8
    a00c:      	cmp	x0, #0x46
    a010:      	b.ne	0xa020 <_stogir.vector-comparison.operands+0x228>
    a014:      	mov	w0, #0x1                ; =1
    a018:      	str	x0, [x29, #0x210]
    a01c:      	b	0xa1a8 <_stogir.vector-comparison.operands+0x3b0>
    a020:      	add	x0, x29, #0x170
    a024:      	bl	0xa024 <_stogir.vector-comparison.operands+0x22c>
		000000000000a024:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    a028:      	ubfx	x0, x0, #0, #8
    a02c:      	cmp	x0, #0x48
    a030:      	b.ne	0xa040 <_stogir.vector-comparison.operands+0x248>
    a034:      	mov	w0, #0x1                ; =1
    a038:      	str	x0, [x29, #0x218]
    a03c:      	b	0xa1a0 <_stogir.vector-comparison.operands+0x3a8>
    a040:      	add	x0, x29, #0x170
    a044:      	bl	0xa044 <_stogir.vector-comparison.operands+0x24c>
		000000000000a044:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    a048:      	ubfx	x0, x0, #0, #8
    a04c:      	cmp	x0, #0x46
    a050:      	b.ne	0xa060 <_stogir.vector-comparison.operands+0x268>
    a054:      	mov	w0, #0x1                ; =1
    a058:      	str	x0, [x29, #0x220]
    a05c:      	b	0xa198 <_stogir.vector-comparison.operands+0x3a0>
    a060:      	mov	x0, x22
    a064:      	bl	0xa064 <_stogir.vector-comparison.operands+0x26c>
		000000000000a064:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    a068:      	cbz	x0, 0xa078 <_stogir.vector-comparison.operands+0x280>
    a06c:      	mov	w0, #0x0                ; =0
    a070:      	str	x0, [x29, #0x228]
    a074:      	b	0xa080 <_stogir.vector-comparison.operands+0x288>
    a078:      	mov	w0, #0x1                ; =1
    a07c:      	str	x0, [x29, #0x228]
    a080:      	ldr	x0, [x29, #0x228]
    a084:      	cbz	x0, 0xa094 <_stogir.vector-comparison.operands+0x29c>
    a088:      	mov	w0, #0x1                ; =1
    a08c:      	str	x0, [x29, #0x228]
    a090:      	b	0xa190 <_stogir.vector-comparison.operands+0x398>
    a094:      	mov	x0, x22
    a098:      	bl	0xa098 <_stogir.vector-comparison.operands+0x2a0>
		000000000000a098:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    a09c:      	sxtw	x0, w0
    a0a0:      	bl	0xa0a0 <_stogir.vector-comparison.operands+0x2a8>
		000000000000a0a0:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    a0a4:      	cbz	x0, 0xa0b4 <_stogir.vector-comparison.operands+0x2bc>
    a0a8:      	mov	w0, #0x0                ; =0
    a0ac:      	str	x0, [x29, #0x230]
    a0b0:      	b	0xa0bc <_stogir.vector-comparison.operands+0x2c4>
    a0b4:      	mov	w0, #0x1                ; =1
    a0b8:      	str	x0, [x29, #0x230]
    a0bc:      	ldr	x0, [x29, #0x230]
    a0c0:      	cbz	x0, 0xa0d0 <_stogir.vector-comparison.operands+0x2d8>
    a0c4:      	mov	w0, #0x1                ; =1
    a0c8:      	str	x0, [x29, #0x230]
    a0cc:      	b	0xa188 <_stogir.vector-comparison.operands+0x390>
    a0d0:      	mov	x0, x22
    a0d4:      	bl	0xa0d4 <_stogir.vector-comparison.operands+0x2dc>
		000000000000a0d4:  ARM64_RELOC_BRANCH26	_stogir.types.lanes
    a0d8:      	sxtw	x0, w0
    a0dc:      	str	w0, [x29, #0x184]
    a0e0:      	ldr	x0, [x29, #0x198]
    a0e4:      	bl	0xa0e4 <_stogir.vector-comparison.operands+0x2ec>
		000000000000a0e4:  ARM64_RELOC_BRANCH26	_stogir.types.lanes
    a0e8:      	sxtw	x0, w0
    a0ec:      	str	w0, [x29, #0x188]
    a0f0:      	ldrsw	x0, [x29, #0x184]
    a0f4:      	ldrsw	x1, [x29, #0x188]
    a0f8:      	cmp	x0, x1
    a0fc:      	b.ne	0xa10c <_stogir.vector-comparison.operands+0x314>
    a100:      	mov	w0, #0x0                ; =0
    a104:      	str	x0, [x29, #0x238]
    a108:      	b	0xa114 <_stogir.vector-comparison.operands+0x31c>
    a10c:      	mov	w0, #0x1                ; =1
    a110:      	str	x0, [x29, #0x238]
    a114:      	ldr	x0, [x29, #0x238]
    a118:      	cbz	x0, 0xa128 <_stogir.vector-comparison.operands+0x330>
    a11c:      	mov	w0, #0x1                ; =1
    a120:      	str	x0, [x29, #0x238]
    a124:      	b	0xa180 <_stogir.vector-comparison.operands+0x388>
    a128:      	mov	x0, x22
    a12c:      	bl	0xa12c <_stogir.vector-comparison.operands+0x334>
		000000000000a12c:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    a130:      	sxtw	x0, w0
    a134:      	mov	x1, x23
    a138:      	bl	0xa138 <_stogir.vector-comparison.operands+0x340>
		000000000000a138:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    a13c:      	sxtw	x0, w0
    a140:      	str	w0, [x29, #0x18c]
    a144:      	ldr	x0, [x29, #0x198]
    a148:      	bl	0xa148 <_stogir.vector-comparison.operands+0x350>
		000000000000a148:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    a14c:      	sxtw	x0, w0
    a150:      	mov	x1, x23
    a154:      	bl	0xa154 <_stogir.vector-comparison.operands+0x35c>
		000000000000a154:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    a158:      	sxtw	x0, w0
    a15c:      	str	w0, [x29, #0x190]
    a160:      	ldrsw	x0, [x29, #0x18c]
    a164:      	ldrsw	x1, [x29, #0x190]
    a168:      	cmp	x0, x1
    a16c:      	b.ne	0xa178 <_stogir.vector-comparison.operands+0x380>
    a170:      	mov	w22, #0x0               ; =0
    a174:      	b	0xa17c <_stogir.vector-comparison.operands+0x384>
    a178:      	mov	w22, #0x1               ; =1
    a17c:      	str	x22, [x29, #0x238]
    a180:      	ldr	x0, [x29, #0x238]
    a184:      	str	x0, [x29, #0x230]
    a188:      	ldr	x0, [x29, #0x230]
    a18c:      	str	x0, [x29, #0x228]
    a190:      	ldr	x0, [x29, #0x228]
    a194:      	str	x0, [x29, #0x220]
    a198:      	ldr	x0, [x29, #0x220]
    a19c:      	str	x0, [x29, #0x218]
    a1a0:      	ldr	x0, [x29, #0x218]
    a1a4:      	str	x0, [x29, #0x210]
    a1a8:      	ldr	x0, [x29, #0x210]
    a1ac:      	str	x0, [x29, #0x208]
    a1b0:      	ldr	x0, [x29, #0x208]
    a1b4:      	str	x0, [x29, #0x200]
    a1b8:      	ldr	x21, [x29, #0x200]
    a1bc:      	str	x21, [x29, #0x1f8]
    a1c0:      	ldr	x0, [x29, #0x1f8]
    a1c4:      	cbz	x0, 0xa1f8 <_stogir.vector-comparison.operands+0x400>
    a1c8:      	mov	w0, #0x1                ; =1
    a1cc:      	str	w0, [x29, #0x1a0]
    a1d0:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000a1d0:  ARM64_RELOC_PAGE21	l_cstr.189
    a1d4:      	add	x0, x0, #0x0
		000000000000a1d4:  ARM64_RELOC_PAGEOFF12	l_cstr.189
    a1d8:      	str	x0, [x29, #0x1c0]
    a1dc:      	mov	w0, #0x33               ; =51
    a1e0:      	str	x0, [x29, #0x1c8]
    a1e4:      	ldr	q0, [x29, #0x1c0]
    a1e8:      	mov	w16, #0x1a8             ; =424
    a1ec:      	str	q0, [x29, x16]
    a1f0:      	add	x21, x29, #0x1a0
    a1f4:      	b	0xa208 <_stogir.vector-comparison.operands+0x410>
    a1f8:      	str	wzr, [x29, #0x1d0]
    a1fc:      	ldr	x0, [x29, #0x198]
    a200:      	str	w0, [x29, #0x1d8]
    a204:      	add	x21, x29, #0x1d0
    a208:      	mov	x20, x21
    a20c:      	str	x20, [x29, #0x1f0]
    a210:      	ldr	x0, [x29, #0x1f0]
    a214:      	ldr	q0, [x0]
    a218:      	str	q0, [x19]
    a21c:      	ldr	x1, [x0, #0x10]
    a220:      	str	x1, [x19, #0x10]
    a224:      	b	0xa230 <_stogir.vector-comparison.operands+0x438>
    a228:      	brk	#0x1
    a22c:      	brk	#0x1
    a230:      	ldp	x19, x20, [sp, #0x10]
    a234:      	ldp	x21, x22, [sp, #0x20]
    a238:      	ldr	x23, [sp, #0x30]
    a23c:      	ldp	x29, x30, [sp]
    a240:      	add	sp, sp, #0x240
    a244:      	ret

000000000000a248 <_stogir.vector-arithmetic.operation?>:
    a248:      	stp	x29, x30, [sp, #-0xd0]!
    a24c:      	mov	x29, sp
    a250:      	stp	x19, x20, [sp, #0x10]
    a254:      	stp	x21, x22, [sp, #0x20]
    a258:      	str	x23, [sp, #0x30]
    a25c:      	sxtw	x19, w0
    a260:      	mov	x0, x19
    a264:      	bl	0xa264 <_stogir.vector-arithmetic.operation?+0x1c>
		000000000000a264:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.unary?
    a268:      	cbz	x0, 0xa274 <_stogir.vector-arithmetic.operation?+0x2c>
    a26c:      	mov	w20, #0x1               ; =1
    a270:      	b	0xa368 <_stogir.vector-arithmetic.operation?+0x120>
    a274:      	mov	x0, x19
    a278:      	bl	0xa278 <_stogir.vector-arithmetic.operation?+0x30>
		000000000000a278:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.extrema?
    a27c:      	cbz	x0, 0xa288 <_stogir.vector-arithmetic.operation?+0x40>
    a280:      	mov	w21, #0x1               ; =1
    a284:      	b	0xa364 <_stogir.vector-arithmetic.operation?+0x11c>
    a288:      	mov	x0, x19
    a28c:      	bl	0xa28c <_stogir.vector-arithmetic.operation?+0x44>
		000000000000a28c:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.shift?
    a290:      	cbz	x0, 0xa29c <_stogir.vector-arithmetic.operation?+0x54>
    a294:      	mov	w22, #0x1               ; =1
    a298:      	b	0xa360 <_stogir.vector-arithmetic.operation?+0x118>
    a29c:      	cmp	x19, #0x1a
    a2a0:      	b.ne	0xa2ac <_stogir.vector-arithmetic.operation?+0x64>
    a2a4:      	mov	w23, #0x1               ; =1
    a2a8:      	b	0xa35c <_stogir.vector-arithmetic.operation?+0x114>
    a2ac:      	cmp	x19, #0x1b
    a2b0:      	b.ne	0xa2c0 <_stogir.vector-arithmetic.operation?+0x78>
    a2b4:      	mov	w0, #0x1                ; =1
    a2b8:      	str	x0, [x29, #0xa0]
    a2bc:      	b	0xa358 <_stogir.vector-arithmetic.operation?+0x110>
    a2c0:      	cmp	x19, #0x1c
    a2c4:      	b.ne	0xa2d4 <_stogir.vector-arithmetic.operation?+0x8c>
    a2c8:      	mov	w0, #0x1                ; =1
    a2cc:      	str	x0, [x29, #0xa8]
    a2d0:      	b	0xa350 <_stogir.vector-arithmetic.operation?+0x108>
    a2d4:      	cmp	x19, #0x1d
    a2d8:      	b.ne	0xa2e8 <_stogir.vector-arithmetic.operation?+0xa0>
    a2dc:      	mov	w0, #0x1                ; =1
    a2e0:      	str	x0, [x29, #0xb0]
    a2e4:      	b	0xa348 <_stogir.vector-arithmetic.operation?+0x100>
    a2e8:      	cmp	x19, #0x1e
    a2ec:      	b.ne	0xa2fc <_stogir.vector-arithmetic.operation?+0xb4>
    a2f0:      	mov	w0, #0x1                ; =1
    a2f4:      	str	x0, [x29, #0xb8]
    a2f8:      	b	0xa340 <_stogir.vector-arithmetic.operation?+0xf8>
    a2fc:      	cmp	x19, #0x2e
    a300:      	b.ne	0xa310 <_stogir.vector-arithmetic.operation?+0xc8>
    a304:      	mov	w0, #0x1                ; =1
    a308:      	str	x0, [x29, #0xc0]
    a30c:      	b	0xa338 <_stogir.vector-arithmetic.operation?+0xf0>
    a310:      	cmp	x19, #0x2f
    a314:      	b.ne	0xa324 <_stogir.vector-arithmetic.operation?+0xdc>
    a318:      	mov	w0, #0x1                ; =1
    a31c:      	str	x0, [x29, #0xc8]
    a320:      	b	0xa330 <_stogir.vector-arithmetic.operation?+0xe8>
    a324:      	cmp	x19, #0x30
    a328:      	cset	x0, eq
    a32c:      	str	x0, [x29, #0xc8]
    a330:      	ldr	x0, [x29, #0xc8]
    a334:      	str	x0, [x29, #0xc0]
    a338:      	ldr	x0, [x29, #0xc0]
    a33c:      	str	x0, [x29, #0xb8]
    a340:      	ldr	x0, [x29, #0xb8]
    a344:      	str	x0, [x29, #0xb0]
    a348:      	ldr	x0, [x29, #0xb0]
    a34c:      	str	x0, [x29, #0xa8]
    a350:      	ldr	x0, [x29, #0xa8]
    a354:      	str	x0, [x29, #0xa0]
    a358:      	ldr	x23, [x29, #0xa0]
    a35c:      	mov	x22, x23
    a360:      	mov	x21, x22
    a364:      	mov	x20, x21
    a368:      	mov	x0, x20
    a36c:      	ldp	x19, x20, [sp, #0x10]
    a370:      	ldp	x21, x22, [sp, #0x20]
    a374:      	ldr	x23, [sp, #0x30]
    a378:      	ldp	x29, x30, [sp], #0xd0
    a37c:      	ret

000000000000a380 <_stogir.vector-arithmetic.unary?>:
    a380:      	stp	x29, x30, [sp, #-0xa0]!
    a384:      	mov	x29, sp
    a388:      	sxtw	x0, w0
    a38c:      	b	0xa390 <_stogir.vector-arithmetic.unary?+0x10>
    a390:      	ldp	x29, x30, [sp], #0xa0
    a394:      	b	0xa394 <_stogir.vector-arithmetic.unary?+0x14>
		000000000000a394:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.operation?

000000000000a398 <_stogir.vector-arithmetic.operands>:
    a398:      	sub	sp, sp, #0x260
    a39c:      	stp	x29, x30, [sp]
    a3a0:      	mov	x29, sp
    a3a4:      	stp	x19, x20, [sp, #0x10]
    a3a8:      	stp	x21, x22, [sp, #0x20]
    a3ac:      	sxtw	x1, w1
    a3b0:      	sxtw	x2, w2
    a3b4:      	sxtw	x3, w3
    a3b8:      	sxtw	x4, w4
    a3bc:      	sxtw	x5, w5
    a3c0:      	adrp	x6, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000a3c0:  ARM64_RELOC_PAGE21	l_cstr.51
    a3c4:      	add	x6, x6, #0x0
		000000000000a3c4:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    a3c8:      	str	x6, [x29, #0xb0]
    a3cc:      	str	xzr, [x29, #0xb8]
    a3d0:      	ldr	q0, [x29, #0xb0]
    a3d4:      	str	q0, [x29, #0xa0]
    a3d8:      	mov	x9, x0
    a3dc:      	mov	x0, x1
    a3e0:      	mov	x10, x1
    a3e4:      	mov	x1, x2
    a3e8:      	str	x2, [x29, #0x138]
    a3ec:      	str	x3, [x29, #0x220]
    a3f0:      	str	x4, [x29, #0x228]
    a3f4:      	str	x5, [x29, #0x230]
    a3f8:      	str	x8, [x29, #0x238]
    a3fc:      	str	x9, [x29, #0x240]
    a400:      	str	x10, [x29, #0x248]
    a404:      	bl	0xa404 <_stogir.vector-arithmetic.operands+0x6c>
		000000000000a404:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.valid-type?
    a408:      	cbz	x0, 0xa418 <_stogir.vector-arithmetic.operands+0x80>
    a40c:      	mov	w0, #0x0                ; =0
    a410:      	str	x0, [x29, #0x250]
    a414:      	b	0xa420 <_stogir.vector-arithmetic.operands+0x88>
    a418:      	mov	w0, #0x1                ; =1
    a41c:      	str	x0, [x29, #0x250]
    a420:      	ldr	x0, [x29, #0x250]
    a424:      	cbz	x0, 0xa448 <_stogir.vector-arithmetic.operands+0xb0>
    a428:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000a428:  ARM64_RELOC_PAGE21	l_cstr.190
    a42c:      	add	x0, x0, #0x0
		000000000000a42c:  ARM64_RELOC_PAGEOFF12	l_cstr.190
    a430:      	str	x0, [x29, #0xc0]
    a434:      	mov	w0, #0x37               ; =55
    a438:      	str	x0, [x29, #0xc8]
    a43c:      	ldr	q0, [x29, #0xc0]
    a440:      	str	q0, [x29, #0xa0]
    a444:      	b	0xa448 <_stogir.vector-arithmetic.operands+0xb0>
    a448:      	mov	w19, #0x0               ; =0
    a44c:      	ldr	x0, [x29, #0x248]
    a450:      	bl	0xa450 <_stogir.vector-arithmetic.operands+0xb8>
		000000000000a450:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.unary?
    a454:      	cbz	x0, 0xa460 <_stogir.vector-arithmetic.operands+0xc8>
    a458:      	mov	w20, #0x1               ; =1
    a45c:      	b	0xa464 <_stogir.vector-arithmetic.operands+0xcc>
    a460:      	mov	w20, #0x2               ; =2
    a464:      	cmp	x19, x20
    a468:      	b.ge	0xa5c8 <_stogir.vector-arithmetic.operands+0x230>
    a46c:      	cmp	x19, #0x0
    a470:      	b.ne	0xa47c <_stogir.vector-arithmetic.operands+0xe4>
    a474:      	ldr	x20, [x29, #0x220]
    a478:      	b	0xa480 <_stogir.vector-arithmetic.operands+0xe8>
    a47c:      	ldr	x20, [x29, #0x228]
    a480:      	add	x8, x29, #0xd0
    a484:      	ldr	x0, [x29, #0x240]
    a488:      	mov	x1, x20
    a48c:      	bl	0xa48c <_stogir.vector-arithmetic.operands+0xf4>
		000000000000a48c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    a490:      	ldr	w0, [x29, #0xd0]
    a494:      	cmp	x0, #0x0
    a498:      	b.eq	0xa4ac <_stogir.vector-arithmetic.operands+0x114>
    a49c:      	cmp	x0, #0x1
    a4a0:      	b.eq	0xa4cc <_stogir.vector-arithmetic.operands+0x134>
    a4a4:      	b	0xa4a8 <_stogir.vector-arithmetic.operands+0x110>
    a4a8:      	b	0xa5c4 <_stogir.vector-arithmetic.operands+0x22c>
    a4ac:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000a4ac:  ARM64_RELOC_PAGE21	l_cstr.191
    a4b0:      	add	x0, x0, #0x0
		000000000000a4b0:  ARM64_RELOC_PAGEOFF12	l_cstr.191
    a4b4:      	str	x0, [x29, #0x100]
    a4b8:      	mov	w0, #0x21               ; =33
    a4bc:      	str	x0, [x29, #0x108]
    a4c0:      	ldr	q0, [x29, #0x100]
    a4c4:      	str	q0, [x29, #0xa0]
    a4c8:      	b	0xa5b4 <_stogir.vector-arithmetic.operands+0x21c>
    a4cc:      	ldur	q0, [x29, #0xd8]
    a4d0:      	str	q0, [x29, #0x110]
    a4d4:      	add	x0, x29, #0x110
    a4d8:      	bl	0xa4d8 <_stogir.vector-arithmetic.operands+0x140>
		000000000000a4d8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    a4dc:      	ubfx	x0, x0, #0, #8
    a4e0:      	sxtw	x0, w0
    a4e4:      	ldr	x1, [x29, #0x138]
    a4e8:      	cmp	x0, x1
    a4ec:      	b.ne	0xa4f8 <_stogir.vector-arithmetic.operands+0x160>
    a4f0:      	mov	w20, #0x1               ; =1
    a4f4:      	b	0xa53c <_stogir.vector-arithmetic.operands+0x1a4>
    a4f8:      	cmp	x19, #0x1
    a4fc:      	b.ne	0xa534 <_stogir.vector-arithmetic.operands+0x19c>
    a500:      	ldr	x0, [x29, #0x248]
    a504:      	bl	0xa504 <_stogir.vector-arithmetic.operands+0x16c>
		000000000000a504:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.shift?
    a508:      	cbz	x0, 0xa528 <_stogir.vector-arithmetic.operands+0x190>
    a50c:      	add	x0, x29, #0x110
    a510:      	bl	0xa510 <_stogir.vector-arithmetic.operands+0x178>
		000000000000a510:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    a514:      	ubfx	x0, x0, #0, #8
    a518:      	sxtw	x0, w0
    a51c:      	bl	0xa51c <_stogir.vector-arithmetic.operands+0x184>
		000000000000a51c:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    a520:      	mov	x21, x0
    a524:      	b	0xa52c <_stogir.vector-arithmetic.operands+0x194>
    a528:      	mov	w21, #0x0               ; =0
    a52c:      	mov	x22, x21
    a530:      	b	0xa538 <_stogir.vector-arithmetic.operands+0x1a0>
    a534:      	mov	w22, #0x0               ; =0
    a538:      	mov	x20, x22
    a53c:      	cbz	x20, 0xa548 <_stogir.vector-arithmetic.operands+0x1b0>
    a540:      	mov	w20, #0x0               ; =0
    a544:      	b	0xa54c <_stogir.vector-arithmetic.operands+0x1b4>
    a548:      	mov	w20, #0x1               ; =1
    a54c:      	cbz	x20, 0xa558 <_stogir.vector-arithmetic.operands+0x1c0>
    a550:      	mov	w20, #0x1               ; =1
    a554:      	b	0xa590 <_stogir.vector-arithmetic.operands+0x1f8>
    a558:      	add	x0, x29, #0x110
    a55c:      	bl	0xa55c <_stogir.vector-arithmetic.operands+0x1c4>
		000000000000a55c:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    a560:      	ubfx	x0, x0, #0, #8
    a564:      	cmp	x0, #0x48
    a568:      	b.ne	0xa574 <_stogir.vector-arithmetic.operands+0x1dc>
    a56c:      	mov	w21, #0x1               ; =1
    a570:      	b	0xa58c <_stogir.vector-arithmetic.operands+0x1f4>
    a574:      	add	x0, x29, #0x110
    a578:      	bl	0xa578 <_stogir.vector-arithmetic.operands+0x1e0>
		000000000000a578:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    a57c:      	ubfx	x0, x0, #0, #8
    a580:      	cmp	x0, #0x46
    a584:      	cset	x0, eq
    a588:      	mov	x21, x0
    a58c:      	mov	x20, x21
    a590:      	cbz	x20, 0xa5b4 <_stogir.vector-arithmetic.operands+0x21c>
    a594:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000a594:  ARM64_RELOC_PAGE21	l_cstr.192
    a598:      	add	x0, x0, #0x0
		000000000000a598:  ARM64_RELOC_PAGEOFF12	l_cstr.192
    a59c:      	str	x0, [x29, #0x120]
    a5a0:      	mov	w0, #0x32               ; =50
    a5a4:      	str	x0, [x29, #0x128]
    a5a8:      	ldr	q0, [x29, #0x120]
    a5ac:      	str	q0, [x29, #0xa0]
    a5b0:      	b	0xa5b4 <_stogir.vector-arithmetic.operands+0x21c>
    a5b4:      	add	x0, x19, #0x1
    a5b8:      	sxtw	x20, w0
    a5bc:      	mov	x19, x20
    a5c0:      	b	0xa44c <_stogir.vector-arithmetic.operands+0xb4>
    a5c4:      	brk	#0x1
    a5c8:      	ldr	x0, [x29, #0x230]
    a5cc:      	str	w0, [x29, #0x130]
    a5d0:      	str	wzr, [x29, #0x134]
    a5d4:      	ldrsw	x1, [x29, #0x130]
    a5d8:      	ldrsw	x2, [x29, #0x134]
    a5dc:      	cmp	x1, x2
    a5e0:      	b.ne	0xa5f0 <_stogir.vector-arithmetic.operands+0x258>
    a5e4:      	mov	w1, #0x0                ; =0
    a5e8:      	str	x1, [x29, #0x220]
    a5ec:      	b	0xa5f8 <_stogir.vector-arithmetic.operands+0x260>
    a5f0:      	mov	w0, #0x1                ; =1
    a5f4:      	str	x0, [x29, #0x220]
    a5f8:      	ldr	x0, [x29, #0x220]
    a5fc:      	cbz	x0, 0xa794 <_stogir.vector-arithmetic.operands+0x3fc>
    a600:      	ldr	x0, [x29, #0x248]
    a604:      	cmp	x0, #0x1d
    a608:      	b.ne	0xa618 <_stogir.vector-arithmetic.operands+0x280>
    a60c:      	mov	w1, #0x1                ; =1
    a610:      	str	x1, [x29, #0x220]
    a614:      	b	0xa628 <_stogir.vector-arithmetic.operands+0x290>
    a618:      	ldr	x0, [x29, #0x248]
    a61c:      	cmp	x0, #0x1e
    a620:      	cset	x0, eq
    a624:      	str	x0, [x29, #0x220]
    a628:      	ldr	x0, [x29, #0x220]
    a62c:      	cbz	x0, 0xa63c <_stogir.vector-arithmetic.operands+0x2a4>
    a630:      	mov	w0, #0x0                ; =0
    a634:      	str	x0, [x29, #0x220]
    a638:      	b	0xa644 <_stogir.vector-arithmetic.operands+0x2ac>
    a63c:      	mov	w0, #0x1                ; =1
    a640:      	str	x0, [x29, #0x220]
    a644:      	ldr	x0, [x29, #0x220]
    a648:      	cbz	x0, 0xa66c <_stogir.vector-arithmetic.operands+0x2d4>
    a64c:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000a64c:  ARM64_RELOC_PAGE21	l_cstr.193
    a650:      	add	x0, x0, #0x0
		000000000000a650:  ARM64_RELOC_PAGEOFF12	l_cstr.193
    a654:      	str	x0, [x29, #0x140]
    a658:      	mov	w0, #0x23               ; =35
    a65c:      	str	x0, [x29, #0x148]
    a660:      	ldr	q0, [x29, #0x140]
    a664:      	str	q0, [x29, #0xa0]
    a668:      	b	0xa78c <_stogir.vector-arithmetic.operands+0x3f4>
    a66c:      	add	x8, x29, #0x150
    a670:      	ldr	x0, [x29, #0x240]
    a674:      	ldr	x1, [x29, #0x230]
    a678:      	bl	0xa678 <_stogir.vector-arithmetic.operands+0x2e0>
		000000000000a678:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    a67c:      	ldr	w0, [x29, #0x150]
    a680:      	cmp	x0, #0x0
    a684:      	b.eq	0xa698 <_stogir.vector-arithmetic.operands+0x300>
    a688:      	cmp	x0, #0x1
    a68c:      	b.eq	0xa6b8 <_stogir.vector-arithmetic.operands+0x320>
    a690:      	b	0xa694 <_stogir.vector-arithmetic.operands+0x2fc>
    a694:      	b	0xa790 <_stogir.vector-arithmetic.operands+0x3f8>
    a698:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000a698:  ARM64_RELOC_PAGE21	l_cstr.194
    a69c:      	add	x0, x0, #0x0
		000000000000a69c:  ARM64_RELOC_PAGEOFF12	l_cstr.194
    a6a0:      	str	x0, [x29, #0x180]
    a6a4:      	mov	w0, #0x1d               ; =29
    a6a8:      	str	x0, [x29, #0x188]
    a6ac:      	ldr	q0, [x29, #0x180]
    a6b0:      	str	q0, [x29, #0xa0]
    a6b4:      	b	0xa78c <_stogir.vector-arithmetic.operands+0x3f4>
    a6b8:      	mov	w16, #0x158             ; =344
    a6bc:      	ldr	q0, [x29, x16]
    a6c0:      	str	q0, [x29, #0x190]
    a6c4:      	ldr	x0, [x29, #0x230]
    a6c8:      	cmp	x0, #0x0
    a6cc:      	b.gt	0xa6dc <_stogir.vector-arithmetic.operands+0x344>
    a6d0:      	mov	w0, #0x1                ; =1
    a6d4:      	str	x0, [x29, #0x230]
    a6d8:      	b	0xa764 <_stogir.vector-arithmetic.operands+0x3cc>
    a6dc:      	add	x0, x29, #0x190
    a6e0:      	bl	0xa6e0 <_stogir.vector-arithmetic.operands+0x348>
		000000000000a6e0:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    a6e4:      	ubfx	x0, x0, #0, #8
    a6e8:      	sxtw	x0, w0
    a6ec:      	bl	0xa6ec <_stogir.vector-arithmetic.operands+0x354>
		000000000000a6ec:  ARM64_RELOC_BRANCH26	_stogir.opcode.block-start?
    a6f0:      	cbz	x0, 0xa700 <_stogir.vector-arithmetic.operands+0x368>
    a6f4:      	mov	w0, #0x1                ; =1
    a6f8:      	str	x0, [x29, #0x240]
    a6fc:      	b	0xa740 <_stogir.vector-arithmetic.operands+0x3a8>
    a700:      	add	x0, x29, #0x190
    a704:      	bl	0xa704 <_stogir.vector-arithmetic.operands+0x36c>
		000000000000a704:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    a708:      	ubfx	x0, x0, #0, #8
    a70c:      	cmp	x0, #0x65
    a710:      	b.ne	0xa720 <_stogir.vector-arithmetic.operands+0x388>
    a714:      	mov	w0, #0x1                ; =1
    a718:      	str	x0, [x29, #0x220]
    a71c:      	b	0xa738 <_stogir.vector-arithmetic.operands+0x3a0>
    a720:      	add	x0, x29, #0x190
    a724:      	bl	0xa724 <_stogir.vector-arithmetic.operands+0x38c>
		000000000000a724:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    a728:      	ubfx	x0, x0, #0, #8
    a72c:      	cmp	x0, #0x66
    a730:      	cset	x0, eq
    a734:      	str	x0, [x29, #0x220]
    a738:      	ldr	x0, [x29, #0x220]
    a73c:      	str	x0, [x29, #0x240]
    a740:      	ldr	x0, [x29, #0x240]
    a744:      	cbz	x0, 0xa754 <_stogir.vector-arithmetic.operands+0x3bc>
    a748:      	mov	w0, #0x0                ; =0
    a74c:      	str	x0, [x29, #0x240]
    a750:      	b	0xa75c <_stogir.vector-arithmetic.operands+0x3c4>
    a754:      	mov	w0, #0x1                ; =1
    a758:      	str	x0, [x29, #0x240]
    a75c:      	ldr	x0, [x29, #0x240]
    a760:      	str	x0, [x29, #0x230]
    a764:      	ldr	x0, [x29, #0x230]
    a768:      	cbz	x0, 0xa78c <_stogir.vector-arithmetic.operands+0x3f4>
    a76c:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000a76c:  ARM64_RELOC_PAGE21	l_cstr.195
    a770:      	add	x0, x0, #0x0
		000000000000a770:  ARM64_RELOC_PAGEOFF12	l_cstr.195
    a774:      	str	x0, [x29, #0x1a0]
    a778:      	mov	w0, #0x34               ; =52
    a77c:      	str	x0, [x29, #0x1a8]
    a780:      	ldr	q0, [x29, #0x1a0]
    a784:      	str	q0, [x29, #0xa0]
    a788:      	b	0xa78c <_stogir.vector-arithmetic.operands+0x3f4>
    a78c:      	b	0xa794 <_stogir.vector-arithmetic.operands+0x3fc>
    a790:      	brk	#0x1
    a794:      	ldr	q0, [x29, #0xa0]
    a798:      	str	q0, [x29, #0x1b0]
    a79c:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000a79c:  ARM64_RELOC_PAGE21	l_cstr.51
    a7a0:      	add	x0, x0, #0x0
		000000000000a7a0:  ARM64_RELOC_PAGEOFF12	l_cstr.51
    a7a4:      	str	x0, [x29, #0x1c0]
    a7a8:      	str	xzr, [x29, #0x1c8]
    a7ac:      	ldr	x0, [x29, #0x1b0]
    a7b0:      	ldr	x1, [x29, #0x1b8]
    a7b4:      	ldr	x2, [x29, #0x1c0]
    a7b8:      	ldr	x3, [x29, #0x1c8]
    a7bc:      	bl	0xa7bc <_stogir.vector-arithmetic.operands+0x424>
		000000000000a7bc:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    a7c0:      	cbz	x0, 0xa7dc <_stogir.vector-arithmetic.operands+0x444>
    a7c4:      	str	wzr, [x29, #0x1d0]
    a7c8:      	ldr	x0, [x29, #0x138]
    a7cc:      	str	w0, [x29, #0x1d8]
    a7d0:      	add	x0, x29, #0x1d0
    a7d4:      	str	x0, [x29, #0x138]
    a7d8:      	b	0xa800 <_stogir.vector-arithmetic.operands+0x468>
    a7dc:      	mov	w0, #0x1                ; =1
    a7e0:      	str	w0, [x29, #0x1f0]
    a7e4:      	ldr	q0, [x29, #0xa0]
    a7e8:      	str	q0, [x29, #0x210]
    a7ec:      	ldr	q0, [x29, #0x210]
    a7f0:      	mov	w16, #0x1f8             ; =504
    a7f4:      	str	q0, [x29, x16]
    a7f8:      	add	x0, x29, #0x1f0
    a7fc:      	str	x0, [x29, #0x138]
    a800:      	ldr	x0, [x29, #0x238]
    a804:      	ldr	x1, [x29, #0x138]
    a808:      	ldr	q0, [x1]
    a80c:      	str	q0, [x0]
    a810:      	ldr	x2, [x1, #0x10]
    a814:      	str	x2, [x0, #0x10]
    a818:      	ldp	x19, x20, [sp, #0x10]
    a81c:      	ldp	x21, x22, [sp, #0x20]
    a820:      	ldp	x29, x30, [sp]
    a824:      	add	sp, sp, #0x260
    a828:      	ret

000000000000a82c <_stogir.types.base-type>:
    a82c:      	stp	x29, x30, [sp, #-0xa0]!
    a830:      	mov	x29, sp
    a834:      	stp	x19, x20, [sp, #0x10]
    a838:      	sxtw	x19, w0
    a83c:      	mov	x0, x19
    a840:      	bl	0xa840 <_stogir.types.base-type+0x14>
		000000000000a840:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    a844:      	cbz	x0, 0xa858 <_stogir.types.base-type+0x2c>
    a848:      	and	x19, x19, #0xf
    a84c:      	sxtw	x19, w19
    a850:      	mov	x20, x19
    a854:      	b	0xa85c <_stogir.types.base-type+0x30>
    a858:      	mov	x20, #-0x1              ; =-1
    a85c:      	mov	x0, x20
    a860:      	ldp	x19, x20, [sp, #0x10]
    a864:      	ldp	x29, x30, [sp], #0xa0
    a868:      	ret

000000000000a86c <_stogir.types.lanes>:
    a86c:      	stp	x29, x30, [sp, #-0xa0]!
    a870:      	mov	x29, sp
    a874:      	stp	x19, x20, [sp, #0x10]
    a878:      	str	x21, [sp, #0x20]
    a87c:      	sxtw	x19, w0
    a880:      	mov	x0, x19
    a884:      	bl	0xa884 <_stogir.types.lanes+0x18>
		000000000000a884:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    a888:      	cbz	x0, 0xa8b0 <_stogir.types.lanes+0x44>
    a88c:      	asr	x0, x19, #4
    a890:      	sxtw	x0, w0
    a894:      	sub	x0, x0, #0x1
    a898:      	sxtw	x0, w0
    a89c:      	mov	w1, #0x1                ; =1
    a8a0:      	lsl	x1, x1, x0
    a8a4:      	sxtw	x1, w1
    a8a8:      	mov	x20, x1
    a8ac:      	b	0xa8e0 <_stogir.types.lanes+0x74>
    a8b0:      	mov	x0, x19
    a8b4:      	bl	0xa8b4 <_stogir.types.lanes+0x48>
		000000000000a8b4:  ARM64_RELOC_BRANCH26	_stogir.types.valid-scalar?
    a8b8:      	cbz	x0, 0xa8d8 <_stogir.types.lanes+0x6c>
    a8bc:      	cmp	x19, #0x0
    a8c0:      	b.ne	0xa8cc <_stogir.types.lanes+0x60>
    a8c4:      	mov	w19, #0x0               ; =0
    a8c8:      	b	0xa8d0 <_stogir.types.lanes+0x64>
    a8cc:      	mov	w19, #0x1               ; =1
    a8d0:      	mov	x21, x19
    a8d4:      	b	0xa8dc <_stogir.types.lanes+0x70>
    a8d8:      	mov	x21, #-0x1              ; =-1
    a8dc:      	mov	x20, x21
    a8e0:      	mov	x0, x20
    a8e4:      	ldp	x19, x20, [sp, #0x10]
    a8e8:      	ldr	x21, [sp, #0x20]
    a8ec:      	ldp	x29, x30, [sp], #0xa0
    a8f0:      	ret

000000000000a8f4 <_coil.core.Get$slice$get__u8>:
    a8f4:      	stp	x29, x30, [sp, #-0xc0]!
    a8f8:      	mov	x29, sp
    a8fc:      	str	x0, [x29, #0xa0]
    a900:      	str	x1, [x29, #0xa8]
    a904:      	ldr	x0, [x29, #0xa0]
    a908:      	ldr	x1, [x29, #0xa8]
    a90c:      	str	x2, [x29, #0xb0]
    a910:      	bl	0xa910 <_coil.core.Get$slice$get__u8+0x1c>
		000000000000a910:  ARM64_RELOC_BRANCH26	_inherent$slice$data__u8
    a914:      	ldr	x1, [x29, #0xb0]
    a918:      	add	x0, x0, x1
    a91c:      	ldrb	w0, [x0]
    a920:      	ldp	x29, x30, [sp], #0xc0
    a924:      	ret

000000000000a928 <_stogir.checked.valid-type?>:
    a928:      	stp	x29, x30, [sp, #-0xb0]!
    a92c:      	mov	x29, sp
    a930:      	stp	x19, x20, [sp, #0x10]
    a934:      	sxtw	x19, w0
    a938:      	mov	x0, x19
    a93c:      	bl	0xa93c <_stogir.checked.valid-type?+0x14>
		000000000000a93c:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    a940:      	cbz	x0, 0xa974 <_stogir.checked.valid-type?+0x4c>
    a944:      	str	w19, [x29, #0xa0]
    a948:      	mov	w0, #0x1                ; =1
    a94c:      	str	w0, [x29, #0xa4]
    a950:      	ldrsw	x0, [x29, #0xa0]
    a954:      	ldrsw	x1, [x29, #0xa4]
    a958:      	cmp	x0, x1
    a95c:      	b.ne	0xa968 <_stogir.checked.valid-type?+0x40>
    a960:      	mov	w19, #0x0               ; =0
    a964:      	b	0xa96c <_stogir.checked.valid-type?+0x44>
    a968:      	mov	w19, #0x1               ; =1
    a96c:      	mov	x20, x19
    a970:      	b	0xa978 <_stogir.checked.valid-type?+0x50>
    a974:      	mov	w20, #0x0               ; =0
    a978:      	mov	x0, x20
    a97c:      	ldp	x19, x20, [sp, #0x10]
    a980:      	ldp	x29, x30, [sp], #0xb0
    a984:      	ret

000000000000a988 <_coil.core.Iterable$slice$iter__i32>:
    a988:      	stp	x29, x30, [sp, #-0xf0]!
    a98c:      	mov	x29, sp
    a990:      	str	x0, [x29, #0xa0]
    a994:      	str	x1, [x29, #0xa8]
    a998:      	ldr	q0, [x29, #0xa0]
    a99c:      	str	q0, [x29, #0xb0]
    a9a0:      	str	xzr, [x29, #0xc0]
    a9a4:      	ldr	q0, [x29, #0xb0]
    a9a8:      	str	q0, [x29, #0xd0]
    a9ac:      	ldr	x0, [x29, #0xc0]
    a9b0:      	str	x0, [x29, #0xe0]
    a9b4:      	ldr	q0, [x29, #0xd0]
    a9b8:      	str	q0, [x8]
    a9bc:      	ldr	x0, [x29, #0xe0]
    a9c0:      	str	x0, [x8, #0x10]
    a9c4:      	ldp	x29, x30, [sp], #0xf0
    a9c8:      	ret

000000000000a9cc <_coil.core.Iterator$coil.slice.SliceIter$next__i32>:
    a9cc:      	stp	x29, x30, [sp, #-0xe0]!
    a9d0:      	mov	x29, sp
    a9d4:      	stp	x19, x20, [sp, #0x10]
    a9d8:      	mov	x19, x0
    a9dc:      	ldr	x20, [x19, #0x10]
    a9e0:      	ldr	q0, [x19]
    a9e4:      	str	q0, [x29, #0xa0]
    a9e8:      	ldr	x0, [x29, #0xa0]
    a9ec:      	ldr	x1, [x29, #0xa8]
    a9f0:      	bl	0xa9f0 <_coil.core.Iterator$coil.slice.SliceIter$next__i32+0x24>
		000000000000a9f0:  ARM64_RELOC_BRANCH26	_coil.core.Len$slice$len__i32
    a9f4:      	cmp	x20, x0
    a9f8:      	b.ge	0xaa34 <_coil.core.Iterator$coil.slice.SliceIter$next__i32+0x68>
    a9fc:      	add	x0, x20, #0x1
    aa00:      	str	x0, [x19, #0x10]
    aa04:      	mov	w0, #0x1                ; =1
    aa08:      	str	w0, [x29, #0xb0]
    aa0c:      	ldr	q0, [x19]
    aa10:      	str	q0, [x29, #0xc0]
    aa14:      	ldr	x0, [x29, #0xc0]
    aa18:      	ldr	x1, [x29, #0xc8]
    aa1c:      	bl	0xaa1c <_coil.core.Iterator$coil.slice.SliceIter$next__i32+0x50>
		000000000000aa1c:  ARM64_RELOC_BRANCH26	_inherent$slice$data__i32
    aa20:      	add	x0, x0, x20, lsl #2
    aa24:      	ldrsw	x0, [x0]
    aa28:      	str	w0, [x29, #0xb8]
    aa2c:      	add	x19, x29, #0xb0
    aa30:      	b	0xaa3c <_coil.core.Iterator$coil.slice.SliceIter$next__i32+0x70>
    aa34:      	str	wzr, [x29, #0xd0]
    aa38:      	add	x19, x29, #0xd0
    aa3c:      	ldr	x0, [x19]
    aa40:      	ldr	x19, [x19, #0x8]
    aa44:      	mov	x1, x19
    aa48:      	ldp	x19, x20, [sp, #0x10]
    aa4c:      	ldp	x29, x30, [sp], #0xe0
    aa50:      	ret

000000000000aa54 <_stogir.terminal.previous-input>:
    aa54:      	stp	x29, x30, [sp, #-0x190]!
    aa58:      	mov	x29, sp
    aa5c:      	stp	x19, x20, [sp, #0x10]
    aa60:      	stp	x21, x22, [sp, #0x20]
    aa64:      	str	x23, [sp, #0x30]
    aa68:      	mov	x19, x8
    aa6c:      	mov	x20, x0
    aa70:      	sxtw	x21, w1
    aa74:      	cmp	x21, #0x0
    aa78:      	b.ne	0xaa8c <_stogir.terminal.previous-input+0x38>
    aa7c:      	str	wzr, [x29, #0xa0]
    aa80:      	str	wzr, [x29, #0xa8]
    aa84:      	add	x22, x29, #0xa0
    aa88:      	b	0xab74 <_stogir.terminal.previous-input+0x120>
    aa8c:      	add	x8, x29, #0xc0
    aa90:      	mov	x0, x20
    aa94:      	mov	x1, x21
    aa98:      	bl	0xaa98 <_stogir.terminal.previous-input+0x44>
		000000000000aa98:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    aa9c:      	ldr	w0, [x29, #0xc0]
    aaa0:      	cmp	x0, #0x0
    aaa4:      	b.eq	0xaab8 <_stogir.terminal.previous-input+0x64>
    aaa8:      	cmp	x0, #0x1
    aaac:      	b.eq	0xaae4 <_stogir.terminal.previous-input+0x90>
    aab0:      	b	0xaab4 <_stogir.terminal.previous-input+0x60>
    aab4:      	b	0xab88 <_stogir.terminal.previous-input+0x134>
    aab8:      	mov	w0, #0x1                ; =1
    aabc:      	str	w0, [x29, #0xf0]
    aac0:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000aac0:  ARM64_RELOC_PAGE21	l_cstr.196
    aac4:      	add	x0, x0, #0x0
		000000000000aac4:  ARM64_RELOC_PAGEOFF12	l_cstr.196
    aac8:      	str	x0, [x29, #0x110]
    aacc:      	mov	w0, #0x1d               ; =29
    aad0:      	str	x0, [x29, #0x118]
    aad4:      	ldr	q0, [x29, #0x110]
    aad8:      	stur	q0, [x29, #0xf8]
    aadc:      	add	x20, x29, #0xf0
    aae0:      	b	0xab70 <_stogir.terminal.previous-input+0x11c>
    aae4:      	ldur	q0, [x29, #0xc8]
    aae8:      	str	q0, [x29, #0x120]
    aaec:      	cmp	x21, #0x0
    aaf0:      	b.gt	0xaafc <_stogir.terminal.previous-input+0xa8>
    aaf4:      	mov	w23, #0x1               ; =1
    aaf8:      	b	0xab2c <_stogir.terminal.previous-input+0xd8>
    aafc:      	add	x0, x29, #0x120
    ab00:      	bl	0xab00 <_stogir.terminal.previous-input+0xac>
		000000000000ab00:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    ab04:      	ubfx	x0, x0, #0, #8
    ab08:      	sxtw	x0, w0
    ab0c:      	bl	0xab0c <_stogir.terminal.previous-input+0xb8>
		000000000000ab0c:  ARM64_RELOC_BRANCH26	_stogir.opcode.terminator?
    ab10:      	cbz	x0, 0xab20 <_stogir.terminal.previous-input+0xcc>
    ab14:      	mov	w0, #0x0                ; =0
    ab18:      	str	x0, [x29, #0x180]
    ab1c:      	b	0xab28 <_stogir.terminal.previous-input+0xd4>
    ab20:      	mov	w0, #0x1                ; =1
    ab24:      	str	x0, [x29, #0x180]
    ab28:      	ldr	x23, [x29, #0x180]
    ab2c:      	cbz	x23, 0xab60 <_stogir.terminal.previous-input+0x10c>
    ab30:      	mov	w0, #0x1                ; =1
    ab34:      	str	w0, [x29, #0x130]
    ab38:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000ab38:  ARM64_RELOC_PAGE21	l_cstr.197
    ab3c:      	add	x0, x0, #0x0
		000000000000ab3c:  ARM64_RELOC_PAGEOFF12	l_cstr.197
    ab40:      	str	x0, [x29, #0x150]
    ab44:      	mov	w0, #0x2e               ; =46
    ab48:      	str	x0, [x29, #0x158]
    ab4c:      	ldr	q0, [x29, #0x150]
    ab50:      	mov	w16, #0x138             ; =312
    ab54:      	str	q0, [x29, x16]
    ab58:      	add	x23, x29, #0x130
    ab5c:      	b	0xab6c <_stogir.terminal.previous-input+0x118>
    ab60:      	str	wzr, [x29, #0x160]
    ab64:      	str	w21, [x29, #0x168]
    ab68:      	add	x23, x29, #0x160
    ab6c:      	mov	x20, x23
    ab70:      	mov	x22, x20
    ab74:      	ldr	q0, [x22]
    ab78:      	str	q0, [x19]
    ab7c:      	ldr	x0, [x22, #0x10]
    ab80:      	str	x0, [x19, #0x10]
    ab84:      	b	0xab8c <_stogir.terminal.previous-input+0x138>
    ab88:      	brk	#0x1
    ab8c:      	ldp	x19, x20, [sp, #0x10]
    ab90:      	ldp	x21, x22, [sp, #0x20]
    ab94:      	ldr	x23, [sp, #0x30]
    ab98:      	ldp	x29, x30, [sp], #0x190
    ab9c:      	ret

000000000000aba0 <_stogir.switch.selector-type>:
    aba0:      	stp	x29, x30, [sp, #-0x160]!
    aba4:      	mov	x29, sp
    aba8:      	stp	x19, x20, [sp, #0x10]
    abac:      	str	x21, [sp, #0x20]
    abb0:      	mov	x19, x8
    abb4:      	sxtw	x1, w1
    abb8:      	add	x8, x29, #0xa0
    abbc:      	bl	0xabbc <_stogir.switch.selector-type+0x1c>
		000000000000abbc:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    abc0:      	ldr	w0, [x29, #0xa0]
    abc4:      	cmp	x0, #0x0
    abc8:      	b.eq	0xabdc <_stogir.switch.selector-type+0x3c>
    abcc:      	cmp	x0, #0x1
    abd0:      	b.eq	0xac08 <_stogir.switch.selector-type+0x68>
    abd4:      	b	0xabd8 <_stogir.switch.selector-type+0x38>
    abd8:      	b	0xacc0 <_stogir.switch.selector-type+0x120>
    abdc:      	mov	w0, #0x1                ; =1
    abe0:      	str	w0, [x29, #0xd0]
    abe4:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000abe4:  ARM64_RELOC_PAGE21	l_cstr.198
    abe8:      	add	x0, x0, #0x0
		000000000000abe8:  ARM64_RELOC_PAGEOFF12	l_cstr.198
    abec:      	str	x0, [x29, #0xf0]
    abf0:      	mov	w0, #0x17               ; =23
    abf4:      	str	x0, [x29, #0xf8]
    abf8:      	ldr	q0, [x29, #0xf0]
    abfc:      	stur	q0, [x29, #0xd8]
    ac00:      	add	x20, x29, #0xd0
    ac04:      	b	0xacac <_stogir.switch.selector-type+0x10c>
    ac08:      	ldur	q0, [x29, #0xa8]
    ac0c:      	str	q0, [x29, #0x100]
    ac10:      	add	x0, x29, #0x100
    ac14:      	bl	0xac14 <_stogir.switch.selector-type+0x74>
		000000000000ac14:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    ac18:      	ubfx	x0, x0, #0, #8
    ac1c:      	sxtw	x0, w0
    ac20:      	bl	0xac20 <_stogir.switch.selector-type+0x80>
		000000000000ac20:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    ac24:      	cbz	x0, 0xac30 <_stogir.switch.selector-type+0x90>
    ac28:      	mov	w21, #0x0               ; =0
    ac2c:      	b	0xac34 <_stogir.switch.selector-type+0x94>
    ac30:      	mov	w21, #0x1               ; =1
    ac34:      	cbz	x21, 0xac40 <_stogir.switch.selector-type+0xa0>
    ac38:      	mov	w21, #0x1               ; =1
    ac3c:      	b	0xac58 <_stogir.switch.selector-type+0xb8>
    ac40:      	add	x0, x29, #0x100
    ac44:      	bl	0xac44 <_stogir.switch.selector-type+0xa4>
		000000000000ac44:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    ac48:      	ubfx	x0, x0, #0, #8
    ac4c:      	cmp	x0, #0x48
    ac50:      	cset	x0, eq
    ac54:      	mov	x21, x0
    ac58:      	cbz	x21, 0xac8c <_stogir.switch.selector-type+0xec>
    ac5c:      	mov	w0, #0x1                ; =1
    ac60:      	str	w0, [x29, #0x110]
    ac64:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000ac64:  ARM64_RELOC_PAGE21	l_cstr.199
    ac68:      	add	x0, x0, #0x0
		000000000000ac68:  ARM64_RELOC_PAGEOFF12	l_cstr.199
    ac6c:      	str	x0, [x29, #0x130]
    ac70:      	mov	w0, #0x20               ; =32
    ac74:      	str	x0, [x29, #0x138]
    ac78:      	ldr	q0, [x29, #0x130]
    ac7c:      	mov	w16, #0x118             ; =280
    ac80:      	str	q0, [x29, x16]
    ac84:      	add	x21, x29, #0x110
    ac88:      	b	0xaca8 <_stogir.switch.selector-type+0x108>
    ac8c:      	str	wzr, [x29, #0x140]
    ac90:      	add	x0, x29, #0x100
    ac94:      	bl	0xac94 <_stogir.switch.selector-type+0xf4>
		000000000000ac94:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    ac98:      	ubfx	x0, x0, #0, #8
    ac9c:      	sxtw	x0, w0
    aca0:      	str	w0, [x29, #0x148]
    aca4:      	add	x21, x29, #0x140
    aca8:      	mov	x20, x21
    acac:      	ldr	q0, [x20]
    acb0:      	str	q0, [x19]
    acb4:      	ldr	x0, [x20, #0x10]
    acb8:      	str	x0, [x19, #0x10]
    acbc:      	b	0xacc4 <_stogir.switch.selector-type+0x124>
    acc0:      	brk	#0x1
    acc4:      	ldp	x19, x20, [sp, #0x10]
    acc8:      	ldr	x21, [sp, #0x20]
    accc:      	ldp	x29, x30, [sp], #0x160
    acd0:      	ret

000000000000acd4 <_stogir.switch.key>:
    acd4:      	stp	x29, x30, [sp, #-0x1d0]!
    acd8:      	mov	x29, sp
    acdc:      	stp	x19, x20, [sp, #0x10]
    ace0:      	stp	x21, x22, [sp, #0x20]
    ace4:      	str	x23, [sp, #0x30]
    ace8:      	mov	x19, x8
    acec:      	mov	x20, x0
    acf0:      	sxtw	x21, w1
    acf4:      	sxtw	x22, w2
    acf8:      	mov	x0, x22
    acfc:      	bl	0xacfc <_stogir.switch.key+0x28>
		000000000000acfc:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    ad00:      	cbz	x0, 0xad0c <_stogir.switch.key+0x38>
    ad04:      	mov	w23, #0x0               ; =0
    ad08:      	b	0xad10 <_stogir.switch.key+0x3c>
    ad0c:      	mov	w23, #0x1               ; =1
    ad10:      	cbz	x23, 0xad40 <_stogir.switch.key+0x6c>
    ad14:      	mov	w0, #0x1                ; =1
    ad18:      	str	w0, [x29, #0xa0]
    ad1c:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000ad1c:  ARM64_RELOC_PAGE21	l_cstr.200
    ad20:      	add	x0, x0, #0x0
		000000000000ad20:  ARM64_RELOC_PAGEOFF12	l_cstr.200
    ad24:      	str	x0, [x29, #0xc0]
    ad28:      	mov	w0, #0x24               ; =36
    ad2c:      	str	x0, [x29, #0xc8]
    ad30:      	ldr	q0, [x29, #0xc0]
    ad34:      	stur	q0, [x29, #0xa8]
    ad38:      	add	x23, x29, #0xa0
    ad3c:      	b	0xaf68 <_stogir.switch.key+0x294>
    ad40:      	add	x8, x29, #0xd0
    ad44:      	mov	x0, x20
    ad48:      	mov	x1, x21
    ad4c:      	bl	0xad4c <_stogir.switch.key+0x78>
		000000000000ad4c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    ad50:      	ldr	w0, [x29, #0xd0]
    ad54:      	cmp	x0, #0x0
    ad58:      	b.eq	0xad6c <_stogir.switch.key+0x98>
    ad5c:      	cmp	x0, #0x1
    ad60:      	b.eq	0xad9c <_stogir.switch.key+0xc8>
    ad64:      	b	0xad68 <_stogir.switch.key+0x94>
    ad68:      	b	0xaf7c <_stogir.switch.key+0x2a8>
    ad6c:      	mov	w0, #0x1                ; =1
    ad70:      	str	w0, [x29, #0x100]
    ad74:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000ad74:  ARM64_RELOC_PAGE21	l_cstr.201
    ad78:      	add	x0, x0, #0x0
		000000000000ad78:  ARM64_RELOC_PAGEOFF12	l_cstr.201
    ad7c:      	str	x0, [x29, #0x120]
    ad80:      	mov	w0, #0x1c               ; =28
    ad84:      	str	x0, [x29, #0x128]
    ad88:      	ldr	q0, [x29, #0x120]
    ad8c:      	mov	w16, #0x108             ; =264
    ad90:      	str	q0, [x29, x16]
    ad94:      	add	x20, x29, #0x100
    ad98:      	b	0xaf64 <_stogir.switch.key+0x290>
    ad9c:      	ldur	q0, [x29, #0xd8]
    ada0:      	str	q0, [x29, #0x130]
    ada4:      	add	x0, x29, #0x130
    ada8:      	bl	0xada8 <_stogir.switch.key+0xd4>
		000000000000ada8:  ARM64_RELOC_BRANCH26	_stogir.node.constant-bits
    adac:      	mov	x9, x0
    adb0:      	mov	x0, x22
    adb4:      	mov	w1, #0x8                ; =8
    adb8:      	str	x9, [x29, #0x158]
    adbc:      	bl	0xadbc <_stogir.switch.key+0xe8>
		000000000000adbc:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    adc0:      	sxtw	x0, w0
    adc4:      	mov	w1, #0x8                ; =8
    adc8:      	mul	x1, x1, x0
    adcc:      	sxtw	x1, w1
    add0:      	cmp	x21, #0x0
    add4:      	str	x1, [x29, #0x1b0]
    add8:      	b.lt	0xade4 <_stogir.switch.key+0x110>
    addc:      	mov	w21, #0x1               ; =1
    ade0:      	b	0xaf10 <_stogir.switch.key+0x23c>
    ade4:      	add	x0, x29, #0x130
    ade8:      	bl	0xade8 <_stogir.switch.key+0x114>
		000000000000ade8:  ARM64_RELOC_BRANCH26	_stogir.symbols.numeric?
    adec:      	cbz	x0, 0xadfc <_stogir.switch.key+0x128>
    adf0:      	mov	w0, #0x0                ; =0
    adf4:      	str	x0, [x29, #0x1b8]
    adf8:      	b	0xae04 <_stogir.switch.key+0x130>
    adfc:      	mov	w0, #0x1                ; =1
    ae00:      	str	x0, [x29, #0x1b8]
    ae04:      	ldr	x0, [x29, #0x1b8]
    ae08:      	cbz	x0, 0xae18 <_stogir.switch.key+0x144>
    ae0c:      	mov	w0, #0x1                ; =1
    ae10:      	str	x0, [x29, #0x1b8]
    ae14:      	b	0xaf0c <_stogir.switch.key+0x238>
    ae18:      	add	x0, x29, #0x130
    ae1c:      	bl	0xae1c <_stogir.switch.key+0x148>
		000000000000ae1c:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    ae20:      	ubfx	x0, x0, #0, #8
    ae24:      	sxtw	x0, w0
    ae28:      	str	w0, [x29, #0x140]
    ae2c:      	str	w22, [x29, #0x144]
    ae30:      	ldrsw	x0, [x29, #0x140]
    ae34:      	ldrsw	x1, [x29, #0x144]
    ae38:      	cmp	x0, x1
    ae3c:      	b.ne	0xae4c <_stogir.switch.key+0x178>
    ae40:      	mov	w0, #0x0                ; =0
    ae44:      	str	x0, [x29, #0x1c0]
    ae48:      	b	0xae54 <_stogir.switch.key+0x180>
    ae4c:      	mov	w0, #0x1                ; =1
    ae50:      	str	x0, [x29, #0x1c0]
    ae54:      	ldr	x0, [x29, #0x1c0]
    ae58:      	cbz	x0, 0xae68 <_stogir.switch.key+0x194>
    ae5c:      	mov	w0, #0x1                ; =1
    ae60:      	str	x0, [x29, #0x1c0]
    ae64:      	b	0xaf04 <_stogir.switch.key+0x230>
    ae68:      	ldr	x0, [x29, #0x1b0]
    ae6c:      	cmp	x0, #0x40
    ae70:      	b.ge	0xaeb4 <_stogir.switch.key+0x1e0>
    ae74:      	ldr	x1, [x29, #0x158]
    ae78:      	lsr	x2, x1, x0
    ae7c:      	str	x2, [x29, #0x148]
    ae80:      	str	xzr, [x29, #0x150]
    ae84:      	ldr	x0, [x29, #0x148]
    ae88:      	ldr	x2, [x29, #0x150]
    ae8c:      	cmp	x0, x2
    ae90:      	b.ne	0xaea0 <_stogir.switch.key+0x1cc>
    ae94:      	mov	w0, #0x0                ; =0
    ae98:      	str	x0, [x29, #0x1b0]
    ae9c:      	b	0xaea8 <_stogir.switch.key+0x1d4>
    aea0:      	mov	w0, #0x1                ; =1
    aea4:      	str	x0, [x29, #0x1b0]
    aea8:      	ldr	x0, [x29, #0x1b0]
    aeac:      	str	x0, [x29, #0x1c8]
    aeb0:      	b	0xaebc <_stogir.switch.key+0x1e8>
    aeb4:      	mov	w0, #0x0                ; =0
    aeb8:      	str	x0, [x29, #0x1c8]
    aebc:      	ldr	x0, [x29, #0x1c8]
    aec0:      	cbz	x0, 0xaed0 <_stogir.switch.key+0x1fc>
    aec4:      	mov	w0, #0x1                ; =1
    aec8:      	str	x0, [x29, #0x1c8]
    aecc:      	b	0xaefc <_stogir.switch.key+0x228>
    aed0:      	cmp	x22, #0x1
    aed4:      	b.ne	0xaeec <_stogir.switch.key+0x218>
    aed8:      	ldr	x0, [x29, #0x158]
    aedc:      	cmp	x0, #0x1
    aee0:      	cset	x1, hi
    aee4:      	str	x1, [x29, #0x1b0]
    aee8:      	b	0xaef4 <_stogir.switch.key+0x220>
    aeec:      	mov	w0, #0x0                ; =0
    aef0:      	str	x0, [x29, #0x1b0]
    aef4:      	ldr	x0, [x29, #0x1b0]
    aef8:      	str	x0, [x29, #0x1c8]
    aefc:      	ldr	x0, [x29, #0x1c8]
    af00:      	str	x0, [x29, #0x1c0]
    af04:      	ldr	x0, [x29, #0x1c0]
    af08:      	str	x0, [x29, #0x1b8]
    af0c:      	ldr	x21, [x29, #0x1b8]
    af10:      	cbz	x21, 0xaf44 <_stogir.switch.key+0x270>
    af14:      	mov	w0, #0x1                ; =1
    af18:      	str	w0, [x29, #0x160]
    af1c:      	adrp	x0, 0xa000 <_stogir.vector-comparison.operands+0x208>
		000000000000af1c:  ARM64_RELOC_PAGE21	l_cstr.202
    af20:      	add	x0, x0, #0x0
		000000000000af20:  ARM64_RELOC_PAGEOFF12	l_cstr.202
    af24:      	str	x0, [x29, #0x180]
    af28:      	mov	w0, #0x30               ; =48
    af2c:      	str	x0, [x29, #0x188]
    af30:      	ldr	q0, [x29, #0x180]
    af34:      	mov	w16, #0x168             ; =360
    af38:      	str	q0, [x29, x16]
    af3c:      	add	x21, x29, #0x160
    af40:      	b	0xaf60 <_stogir.switch.key+0x28c>
    af44:      	str	wzr, [x29, #0x190]
    af48:      	mov	x0, x22
    af4c:      	bl	0xaf4c <_stogir.switch.key+0x278>
		000000000000af4c:  ARM64_RELOC_BRANCH26	_stogir.switch.sign-mask
    af50:      	ldr	x1, [x29, #0x158]
    af54:      	eor	x1, x1, x0
    af58:      	str	x1, [x29, #0x198]
    af5c:      	add	x21, x29, #0x190
    af60:      	mov	x20, x21
    af64:      	mov	x23, x20
    af68:      	ldr	q0, [x23]
    af6c:      	str	q0, [x19]
    af70:      	ldr	x0, [x23, #0x10]
    af74:      	str	x0, [x19, #0x10]
    af78:      	b	0xaf80 <_stogir.switch.key+0x2ac>
    af7c:      	brk	#0x1
    af80:      	ldp	x19, x20, [sp, #0x10]
    af84:      	ldp	x21, x22, [sp, #0x20]
    af88:      	ldr	x23, [sp, #0x30]
    af8c:      	ldp	x29, x30, [sp], #0x1d0
    af90:      	ret

000000000000af94 <_stogir.frame.valid-alignment?>:
    af94:      	mov	x9, x0
    af98:      	cmp	x9, #0x0
    af9c:      	b.le	0xafb8 <_stogir.frame.valid-alignment?+0x24>
    afa0:      	sub	x0, x9, #0x1
    afa4:      	and	x9, x9, x0
    afa8:      	cmp	x9, #0x0
    afac:      	cset	x0, eq
    afb0:      	mov	x2, x0
    afb4:      	b	0xafbc <_stogir.frame.valid-alignment?+0x28>
    afb8:      	mov	w2, #0x0                ; =0
    afbc:      	mov	x0, x2
    afc0:      	ret

000000000000afc4 <_stogir.stack.constant-size-aligned>:
    afc4:      	stp	x29, x30, [sp, #-0x1f0]!
    afc8:      	mov	x29, sp
    afcc:      	stp	x19, x20, [sp, #0x10]
    afd0:      	stp	x21, x22, [sp, #0x20]
    afd4:      	str	x23, [sp, #0x30]
    afd8:      	mov	x19, x8
    afdc:      	mov	x20, x0
    afe0:      	mov	x21, x2
    afe4:      	sxtw	x22, w1
    afe8:      	cmp	x21, #0x10
    afec:      	b.ge	0xaff8 <_stogir.stack.constant-size-aligned+0x34>
    aff0:      	mov	w23, #0x1               ; =1
    aff4:      	b	0xb01c <_stogir.stack.constant-size-aligned+0x58>
    aff8:      	mov	x0, x21
    affc:      	bl	0xaffc <_stogir.stack.constant-size-aligned+0x38>
		000000000000affc:  ARM64_RELOC_BRANCH26	_stogir.frame.valid-alignment?
    b000:      	cbz	x0, 0xb010 <_stogir.stack.constant-size-aligned+0x4c>
    b004:      	mov	w0, #0x0                ; =0
    b008:      	str	x0, [x29, #0x1b0]
    b00c:      	b	0xb018 <_stogir.stack.constant-size-aligned+0x54>
    b010:      	mov	w0, #0x1                ; =1
    b014:      	str	x0, [x29, #0x1b0]
    b018:      	ldr	x23, [x29, #0x1b0]
    b01c:      	cbz	x23, 0xb04c <_stogir.stack.constant-size-aligned+0x88>
    b020:      	mov	w0, #0x1                ; =1
    b024:      	str	w0, [x29, #0xa0]
    b028:      	adrp	x0, 0xb000 <_stogir.stack.constant-size-aligned+0x3c>
		000000000000b028:  ARM64_RELOC_PAGE21	l_cstr.203
    b02c:      	add	x0, x0, #0x0
		000000000000b02c:  ARM64_RELOC_PAGEOFF12	l_cstr.203
    b030:      	str	x0, [x29, #0xc0]
    b034:      	mov	w0, #0x20               ; =32
    b038:      	str	x0, [x29, #0xc8]
    b03c:      	ldr	q0, [x29, #0xc0]
    b040:      	stur	q0, [x29, #0xa8]
    b044:      	add	x23, x29, #0xa0
    b048:      	b	0xb314 <_stogir.stack.constant-size-aligned+0x350>
    b04c:      	add	x8, x29, #0xd0
    b050:      	mov	x0, x20
    b054:      	mov	x1, x22
    b058:      	bl	0xb058 <_stogir.stack.constant-size-aligned+0x94>
		000000000000b058:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b05c:      	ldr	w0, [x29, #0xd0]
    b060:      	cmp	x0, #0x0
    b064:      	b.eq	0xb078 <_stogir.stack.constant-size-aligned+0xb4>
    b068:      	cmp	x0, #0x1
    b06c:      	b.eq	0xb0a8 <_stogir.stack.constant-size-aligned+0xe4>
    b070:      	b	0xb074 <_stogir.stack.constant-size-aligned+0xb0>
    b074:      	b	0xb328 <_stogir.stack.constant-size-aligned+0x364>
    b078:      	mov	w0, #0x1                ; =1
    b07c:      	str	w0, [x29, #0x100]
    b080:      	adrp	x0, 0xb000 <_stogir.stack.constant-size-aligned+0x3c>
		000000000000b080:  ARM64_RELOC_PAGE21	l_cstr.162
    b084:      	add	x0, x0, #0x0
		000000000000b084:  ARM64_RELOC_PAGEOFF12	l_cstr.162
    b088:      	str	x0, [x29, #0x120]
    b08c:      	mov	w0, #0x18               ; =24
    b090:      	str	x0, [x29, #0x128]
    b094:      	ldr	q0, [x29, #0x120]
    b098:      	mov	w16, #0x108             ; =264
    b09c:      	str	q0, [x29, x16]
    b0a0:      	add	x20, x29, #0x100
    b0a4:      	b	0xb310 <_stogir.stack.constant-size-aligned+0x34c>
    b0a8:      	ldur	q0, [x29, #0xd8]
    b0ac:      	str	q0, [x29, #0x130]
    b0b0:      	add	x0, x29, #0x130
    b0b4:      	bl	0xb0b4 <_stogir.stack.constant-size-aligned+0xf0>
		000000000000b0b4:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    b0b8:      	ubfx	x0, x0, #0, #8
    b0bc:      	sxtw	x0, w0
    b0c0:      	mov	x9, x0
    b0c4:      	mov	w1, #0x8                ; =8
    b0c8:      	str	x9, [x29, #0x1b0]
    b0cc:      	bl	0xb0cc <_stogir.stack.constant-size-aligned+0x108>
		000000000000b0cc:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    b0d0:      	sxtw	x0, w0
    b0d4:      	mov	x9, x0
    b0d8:      	add	x0, x29, #0x130
    b0dc:      	str	x9, [x29, #0x1b8]
    b0e0:      	bl	0xb0e0 <_stogir.stack.constant-size-aligned+0x11c>
		000000000000b0e0:  ARM64_RELOC_BRANCH26	_stogir.node.constant-bits
    b0e4:      	cmp	x22, #0x0
    b0e8:      	str	x0, [x29, #0x1c0]
    b0ec:      	b.lt	0xb0f8 <_stogir.stack.constant-size-aligned+0x134>
    b0f0:      	mov	w22, #0x1               ; =1
    b0f4:      	b	0xb2b4 <_stogir.stack.constant-size-aligned+0x2f0>
    b0f8:      	ldr	x0, [x29, #0x1b0]
    b0fc:      	bl	0xb0fc <_stogir.stack.constant-size-aligned+0x138>
		000000000000b0fc:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    b100:      	cbz	x0, 0xb110 <_stogir.stack.constant-size-aligned+0x14c>
    b104:      	mov	w0, #0x0                ; =0
    b108:      	str	x0, [x29, #0x1c8]
    b10c:      	b	0xb118 <_stogir.stack.constant-size-aligned+0x154>
    b110:      	mov	w0, #0x1                ; =1
    b114:      	str	x0, [x29, #0x1c8]
    b118:      	ldr	x0, [x29, #0x1c8]
    b11c:      	cbz	x0, 0xb12c <_stogir.stack.constant-size-aligned+0x168>
    b120:      	mov	w0, #0x1                ; =1
    b124:      	str	x0, [x29, #0x1c8]
    b128:      	b	0xb2b0 <_stogir.stack.constant-size-aligned+0x2ec>
    b12c:      	add	x0, x29, #0x130
    b130:      	bl	0xb130 <_stogir.stack.constant-size-aligned+0x16c>
		000000000000b130:  ARM64_RELOC_BRANCH26	_stogir.symbols.numeric?
    b134:      	cbz	x0, 0xb144 <_stogir.stack.constant-size-aligned+0x180>
    b138:      	mov	w0, #0x0                ; =0
    b13c:      	str	x0, [x29, #0x1d0]
    b140:      	b	0xb14c <_stogir.stack.constant-size-aligned+0x188>
    b144:      	mov	w0, #0x1                ; =1
    b148:      	str	x0, [x29, #0x1d0]
    b14c:      	ldr	x0, [x29, #0x1d0]
    b150:      	cbz	x0, 0xb160 <_stogir.stack.constant-size-aligned+0x19c>
    b154:      	mov	w0, #0x1                ; =1
    b158:      	str	x0, [x29, #0x1d0]
    b15c:      	b	0xb2a8 <_stogir.stack.constant-size-aligned+0x2e4>
    b160:      	ldr	x0, [x29, #0x1b8]
    b164:      	cmp	x0, #0x0
    b168:      	b.gt	0xb178 <_stogir.stack.constant-size-aligned+0x1b4>
    b16c:      	mov	w1, #0x1                ; =1
    b170:      	str	x1, [x29, #0x1d8]
    b174:      	b	0xb2a0 <_stogir.stack.constant-size-aligned+0x2dc>
    b178:      	ldr	x0, [x29, #0x1b8]
    b17c:      	cmp	x0, #0x8
    b180:      	b.ge	0xb1d0 <_stogir.stack.constant-size-aligned+0x20c>
    b184:      	mov	w1, #0x8                ; =8
    b188:      	mul	x2, x0, x1
    b18c:      	sxtw	x2, w2
    b190:      	ldr	x1, [x29, #0x1c0]
    b194:      	lsr	x3, x1, x2
    b198:      	str	x3, [x29, #0x140]
    b19c:      	str	xzr, [x29, #0x148]
    b1a0:      	ldr	x2, [x29, #0x140]
    b1a4:      	ldr	x3, [x29, #0x148]
    b1a8:      	cmp	x2, x3
    b1ac:      	b.ne	0xb1bc <_stogir.stack.constant-size-aligned+0x1f8>
    b1b0:      	mov	w2, #0x0                ; =0
    b1b4:      	str	x2, [x29, #0x1e0]
    b1b8:      	b	0xb1c4 <_stogir.stack.constant-size-aligned+0x200>
    b1bc:      	mov	w0, #0x1                ; =1
    b1c0:      	str	x0, [x29, #0x1e0]
    b1c4:      	ldr	x0, [x29, #0x1e0]
    b1c8:      	str	x0, [x29, #0x1e8]
    b1cc:      	b	0xb1d8 <_stogir.stack.constant-size-aligned+0x214>
    b1d0:      	mov	w0, #0x0                ; =0
    b1d4:      	str	x0, [x29, #0x1e8]
    b1d8:      	ldr	x0, [x29, #0x1e8]
    b1dc:      	cbz	x0, 0xb1ec <_stogir.stack.constant-size-aligned+0x228>
    b1e0:      	mov	w0, #0x1                ; =1
    b1e4:      	str	x0, [x29, #0x1e8]
    b1e8:      	b	0xb298 <_stogir.stack.constant-size-aligned+0x2d4>
    b1ec:      	ldr	x0, [x29, #0x1b0]
    b1f0:      	bl	0xb1f0 <_stogir.stack.constant-size-aligned+0x22c>
		000000000000b1f0:  ARM64_RELOC_BRANCH26	_stogir.types.signed?
    b1f4:      	cbz	x0, 0xb258 <_stogir.stack.constant-size-aligned+0x294>
    b1f8:      	ldr	x0, [x29, #0x1b8]
    b1fc:      	mov	w1, #0x8                ; =8
    b200:      	mul	x0, x0, x1
    b204:      	sxtw	x0, w0
    b208:      	sub	x0, x0, #0x1
    b20c:      	sxtw	x0, w0
    b210:      	mov	w1, #0x1                ; =1
    b214:      	lsl	x1, x1, x0
    b218:      	ldr	x0, [x29, #0x1c0]
    b21c:      	and	x2, x0, x1
    b220:      	str	x2, [x29, #0x150]
    b224:      	str	xzr, [x29, #0x158]
    b228:      	ldr	x1, [x29, #0x150]
    b22c:      	ldr	x2, [x29, #0x158]
    b230:      	cmp	x1, x2
    b234:      	b.ne	0xb244 <_stogir.stack.constant-size-aligned+0x280>
    b238:      	mov	w1, #0x0                ; =0
    b23c:      	str	x1, [x29, #0x1b8]
    b240:      	b	0xb24c <_stogir.stack.constant-size-aligned+0x288>
    b244:      	mov	w0, #0x1                ; =1
    b248:      	str	x0, [x29, #0x1b8]
    b24c:      	ldr	x0, [x29, #0x1b8]
    b250:      	str	x0, [x29, #0x1b0]
    b254:      	b	0xb260 <_stogir.stack.constant-size-aligned+0x29c>
    b258:      	mov	w0, #0x0                ; =0
    b25c:      	str	x0, [x29, #0x1b0]
    b260:      	ldr	x0, [x29, #0x1b0]
    b264:      	cbz	x0, 0xb274 <_stogir.stack.constant-size-aligned+0x2b0>
    b268:      	mov	w0, #0x1                ; =1
    b26c:      	str	x0, [x29, #0x1b0]
    b270:      	b	0xb290 <_stogir.stack.constant-size-aligned+0x2cc>
    b274:      	sub	x0, x21, #0x1
    b278:      	mov	x1, #0x7fffffffffffffff ; =9223372036854775807
    b27c:      	sub	x1, x1, x0
    b280:      	ldr	x0, [x29, #0x1c0]
    b284:      	cmp	x0, x1
    b288:      	cset	x1, hi
    b28c:      	str	x1, [x29, #0x1b0]
    b290:      	ldr	x0, [x29, #0x1b0]
    b294:      	str	x0, [x29, #0x1e8]
    b298:      	ldr	x0, [x29, #0x1e8]
    b29c:      	str	x0, [x29, #0x1d8]
    b2a0:      	ldr	x0, [x29, #0x1d8]
    b2a4:      	str	x0, [x29, #0x1d0]
    b2a8:      	ldr	x0, [x29, #0x1d0]
    b2ac:      	str	x0, [x29, #0x1c8]
    b2b0:      	ldr	x22, [x29, #0x1c8]
    b2b4:      	cbz	x22, 0xb2e8 <_stogir.stack.constant-size-aligned+0x324>
    b2b8:      	mov	w0, #0x1                ; =1
    b2bc:      	str	w0, [x29, #0x160]
    b2c0:      	adrp	x0, 0xb000 <_stogir.stack.constant-size-aligned+0x3c>
		000000000000b2c0:  ARM64_RELOC_PAGE21	l_cstr.204
    b2c4:      	add	x0, x0, #0x0
		000000000000b2c4:  ARM64_RELOC_PAGEOFF12	l_cstr.204
    b2c8:      	str	x0, [x29, #0x180]
    b2cc:      	mov	w0, #0x30               ; =48
    b2d0:      	str	x0, [x29, #0x188]
    b2d4:      	ldr	q0, [x29, #0x180]
    b2d8:      	mov	w16, #0x168             ; =360
    b2dc:      	str	q0, [x29, x16]
    b2e0:      	add	x22, x29, #0x160
    b2e4:      	b	0xb30c <_stogir.stack.constant-size-aligned+0x348>
    b2e8:      	str	wzr, [x29, #0x190]
    b2ec:      	sub	x0, x21, #0x1
    b2f0:      	ldr	x1, [x29, #0x1c0]
    b2f4:      	add	x1, x1, x0
    b2f8:      	mov	w0, #0x0                ; =0
    b2fc:      	sub	x0, x0, x21
    b300:      	and	x1, x1, x0
    b304:      	str	x1, [x29, #0x198]
    b308:      	add	x22, x29, #0x190
    b30c:      	mov	x20, x22
    b310:      	mov	x23, x20
    b314:      	ldr	q0, [x23]
    b318:      	str	q0, [x19]
    b31c:      	ldr	x0, [x23, #0x10]
    b320:      	str	x0, [x19, #0x10]
    b324:      	b	0xb32c <_stogir.stack.constant-size-aligned+0x368>
    b328:      	brk	#0x1
    b32c:      	ldp	x19, x20, [sp, #0x10]
    b330:      	ldp	x21, x22, [sp, #0x20]
    b334:      	ldr	x23, [sp, #0x30]
    b338:      	ldp	x29, x30, [sp], #0x1f0
    b33c:      	ret

000000000000b340 <_stogir.numeric-conversion.operation?>:
    b340:      	sxtw	x2, w0
    b344:      	cmp	x2, #0x25
    b348:      	b.lt	0xb35c <_stogir.numeric-conversion.operation?+0x1c>
    b34c:      	cmp	x2, #0x27
    b350:      	cset	x0, le
    b354:      	mov	x2, x0
    b358:      	b	0xb360 <_stogir.numeric-conversion.operation?+0x20>
    b35c:      	mov	w2, #0x0                ; =0
    b360:      	mov	x0, x2
    b364:      	ret

000000000000b368 <_stogir.numeric-conversion.valid-types?>:
    b368:      	stp	x29, x30, [sp, #-0xb0]!
    b36c:      	mov	x29, sp
    b370:      	stp	x19, x20, [sp, #0x10]
    b374:      	stp	x21, x22, [sp, #0x20]
    b378:      	str	x23, [sp, #0x30]
    b37c:      	sxtw	x19, w0
    b380:      	sxtw	x20, w1
    b384:      	sxtw	x21, w2
    b388:      	cmp	x19, #0x25
    b38c:      	b.ne	0xb3b8 <_stogir.numeric-conversion.valid-types?+0x50>
    b390:      	mov	x0, x20
    b394:      	bl	0xb394 <_stogir.numeric-conversion.valid-types?+0x2c>
		000000000000b394:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    b398:      	cbz	x0, 0xb3ac <_stogir.numeric-conversion.valid-types?+0x44>
    b39c:      	mov	x0, x21
    b3a0:      	bl	0xb3a0 <_stogir.numeric-conversion.valid-types?+0x38>
		000000000000b3a0:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
    b3a4:      	mov	x22, x0
    b3a8:      	b	0xb3b0 <_stogir.numeric-conversion.valid-types?+0x48>
    b3ac:      	mov	w22, #0x0               ; =0
    b3b0:      	mov	x23, x22
    b3b4:      	b	0xb424 <_stogir.numeric-conversion.valid-types?+0xbc>
    b3b8:      	cmp	x19, #0x26
    b3bc:      	b.ne	0xb3e8 <_stogir.numeric-conversion.valid-types?+0x80>
    b3c0:      	mov	x0, x20
    b3c4:      	bl	0xb3c4 <_stogir.numeric-conversion.valid-types?+0x5c>
		000000000000b3c4:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
    b3c8:      	cbz	x0, 0xb3dc <_stogir.numeric-conversion.valid-types?+0x74>
    b3cc:      	mov	x0, x21
    b3d0:      	bl	0xb3d0 <_stogir.numeric-conversion.valid-types?+0x68>
		000000000000b3d0:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    b3d4:      	mov	x22, x0
    b3d8:      	b	0xb3e0 <_stogir.numeric-conversion.valid-types?+0x78>
    b3dc:      	mov	w22, #0x0               ; =0
    b3e0:      	str	x22, [x29, #0xa0]
    b3e4:      	b	0xb420 <_stogir.numeric-conversion.valid-types?+0xb8>
    b3e8:      	cmp	x19, #0x27
    b3ec:      	b.ne	0xb418 <_stogir.numeric-conversion.valid-types?+0xb0>
    b3f0:      	mov	x0, x20
    b3f4:      	bl	0xb3f4 <_stogir.numeric-conversion.valid-types?+0x8c>
		000000000000b3f4:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
    b3f8:      	cbz	x0, 0xb40c <_stogir.numeric-conversion.valid-types?+0xa4>
    b3fc:      	mov	x0, x21
    b400:      	bl	0xb400 <_stogir.numeric-conversion.valid-types?+0x98>
		000000000000b400:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
    b404:      	mov	x19, x0
    b408:      	b	0xb410 <_stogir.numeric-conversion.valid-types?+0xa8>
    b40c:      	mov	w19, #0x0               ; =0
    b410:      	mov	x20, x19
    b414:      	b	0xb41c <_stogir.numeric-conversion.valid-types?+0xb4>
    b418:      	mov	w20, #0x0               ; =0
    b41c:      	str	x20, [x29, #0xa0]
    b420:      	ldr	x23, [x29, #0xa0]
    b424:      	mov	x0, x23
    b428:      	ldp	x19, x20, [sp, #0x10]
    b42c:      	ldp	x21, x22, [sp, #0x20]
    b430:      	ldr	x23, [sp, #0x30]
    b434:      	ldp	x29, x30, [sp], #0xb0
    b438:      	ret

000000000000b43c <_inherent$slice$new__stogir.node.Node>:
    b43c:      	stp	x29, x30, [sp, #-0xd0]!
    b440:      	mov	x29, sp
    b444:      	ldr	q0, [x29, #0xa0]
    b448:      	str	q0, [x29, #0xb0]
    b44c:      	str	x0, [x29, #0xb0]
    b450:      	ldr	q0, [x29, #0xb0]
    b454:      	str	q0, [x29, #0xc0]
    b458:      	str	x1, [x29, #0xc8]
    b45c:      	ldr	x0, [x29, #0xc0]
    b460:      	ldr	x1, [x29, #0xc8]
    b464:      	ldp	x29, x30, [sp], #0xd0
    b468:      	ret

000000000000b46c <_inherent$slice$data__stogir.node.Node>:
    b46c:      	stp	x29, x30, [sp, #-0xb0]!
    b470:      	mov	x29, sp
    b474:      	str	x0, [x29, #0xa0]
    b478:      	str	x1, [x29, #0xa8]
    b47c:      	ldr	x0, [x29, #0xa0]
    b480:      	ldp	x29, x30, [sp], #0xb0
    b484:      	ret

000000000000b488 <_coil.slice.element-ref__stogir.node.Node>:
    b488:      	ret

000000000000b48c <_stogir.vector-lanes.ordinary?>:
    b48c:      	stp	x29, x30, [sp, #-0xb0]!
    b490:      	mov	x29, sp
    b494:      	stp	x19, x20, [sp, #0x10]
    b498:      	mov	x19, x0
    b49c:      	mov	x0, x19
    b4a0:      	bl	0xb4a0 <_stogir.vector-lanes.ordinary?+0x14>
		000000000000b4a0:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    b4a4:      	ubfx	x0, x0, #0, #8
    b4a8:      	strb	w0, [x29, #0xa0]
    b4ac:      	mov	w0, #0x48               ; =72
    b4b0:      	strb	w0, [x29, #0xa1]
    b4b4:      	ldrb	w0, [x29, #0xa0]
    b4b8:      	ldrb	w1, [x29, #0xa1]
    b4bc:      	cmp	x0, x1
    b4c0:      	b.ne	0xb4cc <_stogir.vector-lanes.ordinary?+0x40>
    b4c4:      	mov	w20, #0x0               ; =0
    b4c8:      	b	0xb4d0 <_stogir.vector-lanes.ordinary?+0x44>
    b4cc:      	mov	w20, #0x1               ; =1
    b4d0:      	cbz	x20, 0xb510 <_stogir.vector-lanes.ordinary?+0x84>
    b4d4:      	mov	x0, x19
    b4d8:      	bl	0xb4d8 <_stogir.vector-lanes.ordinary?+0x4c>
		000000000000b4d8:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    b4dc:      	ubfx	x0, x0, #0, #8
    b4e0:      	strb	w0, [x29, #0xa2]
    b4e4:      	mov	w0, #0x46               ; =70
    b4e8:      	strb	w0, [x29, #0xa3]
    b4ec:      	ldrb	w0, [x29, #0xa2]
    b4f0:      	ldrb	w1, [x29, #0xa3]
    b4f4:      	cmp	x0, x1
    b4f8:      	b.ne	0xb504 <_stogir.vector-lanes.ordinary?+0x78>
    b4fc:      	mov	w19, #0x0               ; =0
    b500:      	b	0xb508 <_stogir.vector-lanes.ordinary?+0x7c>
    b504:      	mov	w19, #0x1               ; =1
    b508:      	mov	x20, x19
    b50c:      	b	0xb514 <_stogir.vector-lanes.ordinary?+0x88>
    b510:      	mov	w20, #0x0               ; =0
    b514:      	mov	x0, x20
    b518:      	ldp	x19, x20, [sp, #0x10]
    b51c:      	ldp	x29, x30, [sp], #0xb0
    b520:      	ret

000000000000b524 <_stogir.vector-lanes.compatible?>:
    b524:      	stp	x29, x30, [sp, #-0xb0]!
    b528:      	mov	x29, sp
    b52c:      	stp	x19, x20, [sp, #0x10]
    b530:      	stp	x21, x22, [sp, #0x20]
    b534:      	sxtw	x0, w0
    b538:      	sxtw	x19, w1
    b53c:      	sxtw	x20, w2
    b540:      	mov	x9, x0
    b544:      	str	x9, [x29, #0xa0]
    b548:      	bl	0xb548 <_stogir.vector-lanes.compatible?+0x24>
		000000000000b548:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    b54c:      	sxtw	x21, w0
    b550:      	ldr	x0, [x29, #0xa0]
    b554:      	bl	0xb554 <_stogir.vector-lanes.compatible?+0x30>
		000000000000b554:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    b558:      	cbz	x0, 0xb634 <_stogir.vector-lanes.compatible?+0x110>
    b55c:      	cmp	x20, #0x4
    b560:      	b.ne	0xb56c <_stogir.vector-lanes.compatible?+0x48>
    b564:      	mov	w22, #0x1               ; =1
    b568:      	b	0xb578 <_stogir.vector-lanes.compatible?+0x54>
    b56c:      	cmp	x20, #0x8
    b570:      	cset	x0, eq
    b574:      	mov	x22, x0
    b578:      	cbz	x22, 0xb628 <_stogir.vector-lanes.compatible?+0x104>
    b57c:      	mov	x0, x19
    b580:      	bl	0xb580 <_stogir.vector-lanes.compatible?+0x5c>
		000000000000b580:  ARM64_RELOC_BRANCH26	_stogir.types.valid-scalar?
    b584:      	cbz	x0, 0xb61c <_stogir.vector-lanes.compatible?+0xf8>
    b588:      	cmp	x19, #0x0
    b58c:      	b.le	0xb610 <_stogir.vector-lanes.compatible?+0xec>
    b590:      	cmp	x21, x19
    b594:      	b.ne	0xb5a0 <_stogir.vector-lanes.compatible?+0x7c>
    b598:      	mov	w22, #0x1               ; =1
    b59c:      	b	0xb608 <_stogir.vector-lanes.compatible?+0xe4>
    b5a0:      	mov	x0, x21
    b5a4:      	bl	0xb5a4 <_stogir.vector-lanes.compatible?+0x80>
		000000000000b5a4:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    b5a8:      	cbz	x0, 0xb600 <_stogir.vector-lanes.compatible?+0xdc>
    b5ac:      	mov	x0, x19
    b5b0:      	bl	0xb5b0 <_stogir.vector-lanes.compatible?+0x8c>
		000000000000b5b0:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    b5b4:      	cbz	x0, 0xb5f4 <_stogir.vector-lanes.compatible?+0xd0>
    b5b8:      	mov	x0, x21
    b5bc:      	mov	x1, x20
    b5c0:      	bl	0xb5c0 <_stogir.vector-lanes.compatible?+0x9c>
		000000000000b5c0:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    b5c4:      	sxtw	x0, w0
    b5c8:      	mov	x9, x0
    b5cc:      	mov	x0, x19
    b5d0:      	mov	x1, x20
    b5d4:      	str	x9, [x29, #0xa0]
    b5d8:      	bl	0xb5d8 <_stogir.vector-lanes.compatible?+0xb4>
		000000000000b5d8:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    b5dc:      	sxtw	x0, w0
    b5e0:      	ldr	x1, [x29, #0xa0]
    b5e4:      	cmp	x1, x0
    b5e8:      	cset	x0, eq
    b5ec:      	mov	x19, x0
    b5f0:      	b	0xb5f8 <_stogir.vector-lanes.compatible?+0xd4>
    b5f4:      	mov	w19, #0x0               ; =0
    b5f8:      	mov	x20, x19
    b5fc:      	b	0xb604 <_stogir.vector-lanes.compatible?+0xe0>
    b600:      	mov	w20, #0x0               ; =0
    b604:      	mov	x22, x20
    b608:      	mov	x19, x22
    b60c:      	b	0xb614 <_stogir.vector-lanes.compatible?+0xf0>
    b610:      	mov	w19, #0x0               ; =0
    b614:      	mov	x20, x19
    b618:      	b	0xb620 <_stogir.vector-lanes.compatible?+0xfc>
    b61c:      	mov	w20, #0x0               ; =0
    b620:      	mov	x19, x20
    b624:      	b	0xb62c <_stogir.vector-lanes.compatible?+0x108>
    b628:      	mov	w19, #0x0               ; =0
    b62c:      	mov	x20, x19
    b630:      	b	0xb638 <_stogir.vector-lanes.compatible?+0x114>
    b634:      	mov	w20, #0x0               ; =0
    b638:      	mov	x0, x20
    b63c:      	ldp	x19, x20, [sp, #0x10]
    b640:      	ldp	x21, x22, [sp, #0x20]
    b644:      	ldp	x29, x30, [sp], #0xb0
    b648:      	ret

000000000000b64c <_stogir.symbols.numeric?>:
    b64c:      	stp	x29, x30, [sp, #-0xb0]!
    b650:      	mov	x29, sp
    b654:      	stp	x19, x20, [sp, #0x10]
    b658:      	mov	x19, x0
    b65c:      	mov	x0, x19
    b660:      	bl	0xb660 <_stogir.symbols.numeric?+0x14>
		000000000000b660:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    b664:      	ubfx	x0, x0, #0, #8
    b668:      	mov	x9, x0
    b66c:      	mov	x0, x19
    b670:      	str	x9, [x29, #0xa0]
    b674:      	bl	0xb674 <_stogir.symbols.numeric?+0x28>
		000000000000b674:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    b678:      	ubfx	x0, x0, #0, #8
    b67c:      	ldr	x1, [x29, #0xa0]
    b680:      	cmp	x1, x0
    b684:      	b.ne	0xb690 <_stogir.symbols.numeric?+0x44>
    b688:      	mov	w20, #0x1               ; =1
    b68c:      	b	0xb6a8 <_stogir.symbols.numeric?+0x5c>
    b690:      	mov	x0, x19
    b694:      	bl	0xb694 <_stogir.symbols.numeric?+0x48>
		000000000000b694:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
    b698:      	ubfx	x0, x0, #0, #8
    b69c:      	cmp	x0, #0x49
    b6a0:      	cset	x0, eq
    b6a4:      	mov	x20, x0
    b6a8:      	mov	x0, x20
    b6ac:      	ldp	x19, x20, [sp, #0x10]
    b6b0:      	ldp	x29, x30, [sp], #0xb0
    b6b4:      	ret

000000000000b6b8 <_stogir.node.constant-bits>:
    b6b8:      	ldrsw	x1, [x0, #0x8]
    b6bc:      	ubfx	x1, x1, #0, #32
    b6c0:      	ldrsw	x0, [x0, #0xc]
    b6c4:      	ubfx	x0, x0, #0, #32
    b6c8:      	lsl	x0, x0, #32
    b6cc:      	orr	x1, x1, x0
    b6d0:      	mov	x0, x1
    b6d4:      	ret

000000000000b6d8 <_stogir.vector-comparison.valid-type?>:
    b6d8:      	stp	x29, x30, [sp, #-0xa0]!
    b6dc:      	mov	x29, sp
    b6e0:      	stp	x19, x20, [sp, #0x10]
    b6e4:      	str	x21, [sp, #0x20]
    b6e8:      	sxtw	x19, w0
    b6ec:      	sxtw	x20, w1
    b6f0:      	mov	x0, x19
    b6f4:      	bl	0xb6f4 <_stogir.vector-comparison.valid-type?+0x1c>
		000000000000b6f4:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.operation?
    b6f8:      	cbz	x0, 0xb764 <_stogir.vector-comparison.valid-type?+0x8c>
    b6fc:      	mov	x0, x20
    b700:      	bl	0xb700 <_stogir.vector-comparison.valid-type?+0x28>
		000000000000b700:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    b704:      	cbz	x0, 0xb758 <_stogir.vector-comparison.valid-type?+0x80>
    b708:      	mov	x0, x20
    b70c:      	bl	0xb70c <_stogir.vector-comparison.valid-type?+0x34>
		000000000000b70c:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    b710:      	sxtw	x0, w0
    b714:      	bl	0xb714 <_stogir.vector-comparison.valid-type?+0x3c>
		000000000000b714:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
    b718:      	cbz	x0, 0xb724 <_stogir.vector-comparison.valid-type?+0x4c>
    b71c:      	mov	w21, #0x1               ; =1
    b720:      	b	0xb750 <_stogir.vector-comparison.valid-type?+0x78>
    b724:      	mov	x0, x20
    b728:      	bl	0xb728 <_stogir.vector-comparison.valid-type?+0x50>
		000000000000b728:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    b72c:      	sxtw	x0, w0
    b730:      	bl	0xb730 <_stogir.vector-comparison.valid-type?+0x58>
		000000000000b730:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    b734:      	cbz	x0, 0xb748 <_stogir.vector-comparison.valid-type?+0x70>
    b738:      	cmp	x19, #0x17
    b73c:      	cset	x0, le
    b740:      	mov	x19, x0
    b744:      	b	0xb74c <_stogir.vector-comparison.valid-type?+0x74>
    b748:      	mov	w19, #0x0               ; =0
    b74c:      	mov	x21, x19
    b750:      	mov	x19, x21
    b754:      	b	0xb75c <_stogir.vector-comparison.valid-type?+0x84>
    b758:      	mov	w19, #0x0               ; =0
    b75c:      	mov	x20, x19
    b760:      	b	0xb768 <_stogir.vector-comparison.valid-type?+0x90>
    b764:      	mov	w20, #0x0               ; =0
    b768:      	mov	x0, x20
    b76c:      	ldp	x19, x20, [sp, #0x10]
    b770:      	ldr	x21, [sp, #0x20]
    b774:      	ldp	x29, x30, [sp], #0xa0
    b778:      	ret

000000000000b77c <_stogir.vector-arithmetic.extrema?>:
    b77c:      	sxtw	x2, w0
    b780:      	cmp	x2, #0x3a
    b784:      	b.ne	0xb790 <_stogir.vector-arithmetic.extrema?+0x14>
    b788:      	mov	w3, #0x1                ; =1
    b78c:      	b	0xb79c <_stogir.vector-arithmetic.extrema?+0x20>
    b790:      	cmp	x2, #0x3b
    b794:      	cset	x0, eq
    b798:      	mov	x3, x0
    b79c:      	mov	x0, x3
    b7a0:      	ret

000000000000b7a4 <_stogir.vector-arithmetic.shift?>:
    b7a4:      	sxtw	x2, w0
    b7a8:      	cmp	x2, #0x31
    b7ac:      	b.lt	0xb7c0 <_stogir.vector-arithmetic.shift?+0x1c>
    b7b0:      	cmp	x2, #0x35
    b7b4:      	cset	x0, le
    b7b8:      	mov	x2, x0
    b7bc:      	b	0xb7c4 <_stogir.vector-arithmetic.shift?+0x20>
    b7c0:      	mov	w2, #0x0                ; =0
    b7c4:      	mov	x0, x2
    b7c8:      	ret

000000000000b7cc <_stogir.vector-arithmetic.valid-type?>:
    b7cc:      	stp	x29, x30, [sp, #-0xd0]!
    b7d0:      	mov	x29, sp
    b7d4:      	stp	x19, x20, [sp, #0x10]
    b7d8:      	stp	x21, x22, [sp, #0x20]
    b7dc:      	str	x23, [sp, #0x30]
    b7e0:      	sxtw	x19, w0
    b7e4:      	sxtw	x1, w1
    b7e8:      	mov	x0, x1
    b7ec:      	str	x1, [x29, #0xb8]
    b7f0:      	bl	0xb7f0 <_stogir.vector-arithmetic.valid-type?+0x24>
		000000000000b7f0:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    b7f4:      	sxtw	x20, w0
    b7f8:      	ldr	x0, [x29, #0xb8]
    b7fc:      	bl	0xb7fc <_stogir.vector-arithmetic.valid-type?+0x30>
		000000000000b7fc:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    b800:      	cbz	x0, 0xb9d4 <_stogir.vector-arithmetic.valid-type?+0x208>
    b804:      	mov	x0, x19
    b808:      	bl	0xb808 <_stogir.vector-arithmetic.valid-type?+0x3c>
		000000000000b808:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.operation?
    b80c:      	cbz	x0, 0xb9c8 <_stogir.vector-arithmetic.valid-type?+0x1fc>
    b810:      	mov	x0, x19
    b814:      	bl	0xb814 <_stogir.vector-arithmetic.valid-type?+0x48>
		000000000000b814:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.unary?
    b818:      	cbz	x0, 0xb874 <_stogir.vector-arithmetic.valid-type?+0xa8>
    b81c:      	mov	x0, x19
    b820:      	mov	x1, x20
    b824:      	bl	0xb824 <_stogir.vector-arithmetic.valid-type?+0x58>
		000000000000b824:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    b828:      	cbz	x0, 0xb834 <_stogir.vector-arithmetic.valid-type?+0x68>
    b82c:      	mov	w21, #0x1               ; =1
    b830:      	b	0xb86c <_stogir.vector-arithmetic.valid-type?+0xa0>
    b834:      	mov	x0, x20
    b838:      	bl	0xb838 <_stogir.vector-arithmetic.valid-type?+0x6c>
		000000000000b838:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
    b83c:      	cbz	x0, 0xb864 <_stogir.vector-arithmetic.valid-type?+0x98>
    b840:      	cmp	x19, #0x1f
    b844:      	b.ne	0xb850 <_stogir.vector-arithmetic.valid-type?+0x84>
    b848:      	mov	w22, #0x1               ; =1
    b84c:      	b	0xb85c <_stogir.vector-arithmetic.valid-type?+0x90>
    b850:      	cmp	x19, #0x20
    b854:      	cset	x0, eq
    b858:      	mov	x22, x0
    b85c:      	mov	x23, x22
    b860:      	b	0xb868 <_stogir.vector-arithmetic.valid-type?+0x9c>
    b864:      	mov	w23, #0x0               ; =0
    b868:      	mov	x21, x23
    b86c:      	mov	x22, x21
    b870:      	b	0xb9c0 <_stogir.vector-arithmetic.valid-type?+0x1f4>
    b874:      	mov	x0, x19
    b878:      	bl	0xb878 <_stogir.vector-arithmetic.valid-type?+0xac>
		000000000000b878:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.shift?
    b87c:      	cbz	x0, 0xb8c8 <_stogir.vector-arithmetic.valid-type?+0xfc>
    b880:      	mov	x0, x20
    b884:      	bl	0xb884 <_stogir.vector-arithmetic.valid-type?+0xb8>
		000000000000b884:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    b888:      	cbz	x0, 0xb8bc <_stogir.vector-arithmetic.valid-type?+0xf0>
    b88c:      	str	w20, [x29, #0xa0]
    b890:      	mov	w0, #0x1                ; =1
    b894:      	str	w0, [x29, #0xa4]
    b898:      	ldrsw	x0, [x29, #0xa0]
    b89c:      	ldrsw	x1, [x29, #0xa4]
    b8a0:      	cmp	x0, x1
    b8a4:      	b.ne	0xb8b0 <_stogir.vector-arithmetic.valid-type?+0xe4>
    b8a8:      	mov	w21, #0x0               ; =0
    b8ac:      	b	0xb8b4 <_stogir.vector-arithmetic.valid-type?+0xe8>
    b8b0:      	mov	w21, #0x1               ; =1
    b8b4:      	mov	x23, x21
    b8b8:      	b	0xb8c0 <_stogir.vector-arithmetic.valid-type?+0xf4>
    b8bc:      	mov	w23, #0x0               ; =0
    b8c0:      	mov	x21, x23
    b8c4:      	b	0xb9bc <_stogir.vector-arithmetic.valid-type?+0x1f0>
    b8c8:      	cmp	x19, #0x2e
    b8cc:      	b.ne	0xb8d8 <_stogir.vector-arithmetic.valid-type?+0x10c>
    b8d0:      	mov	w23, #0x1               ; =1
    b8d4:      	b	0xb8fc <_stogir.vector-arithmetic.valid-type?+0x130>
    b8d8:      	cmp	x19, #0x2f
    b8dc:      	b.ne	0xb8ec <_stogir.vector-arithmetic.valid-type?+0x120>
    b8e0:      	mov	w0, #0x1                ; =1
    b8e4:      	str	x0, [x29, #0xb8]
    b8e8:      	b	0xb8f8 <_stogir.vector-arithmetic.valid-type?+0x12c>
    b8ec:      	cmp	x19, #0x30
    b8f0:      	cset	x0, eq
    b8f4:      	str	x0, [x29, #0xb8]
    b8f8:      	ldr	x23, [x29, #0xb8]
    b8fc:      	cbz	x23, 0xb910 <_stogir.vector-arithmetic.valid-type?+0x144>
    b900:      	mov	x0, x20
    b904:      	bl	0xb904 <_stogir.vector-arithmetic.valid-type?+0x138>
		000000000000b904:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    b908:      	mov	x23, x0
    b90c:      	b	0xb9b8 <_stogir.vector-arithmetic.valid-type?+0x1ec>
    b910:      	mov	x0, x20
    b914:      	bl	0xb914 <_stogir.vector-arithmetic.valid-type?+0x148>
		000000000000b914:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
    b918:      	cbz	x0, 0xb958 <_stogir.vector-arithmetic.valid-type?+0x18c>
    b91c:      	str	w19, [x29, #0xa8]
    b920:      	mov	w0, #0x1e               ; =30
    b924:      	str	w0, [x29, #0xac]
    b928:      	ldrsw	x0, [x29, #0xa8]
    b92c:      	ldrsw	x1, [x29, #0xac]
    b930:      	cmp	x0, x1
    b934:      	b.ne	0xb944 <_stogir.vector-arithmetic.valid-type?+0x178>
    b938:      	mov	w0, #0x0                ; =0
    b93c:      	str	x0, [x29, #0xb8]
    b940:      	b	0xb94c <_stogir.vector-arithmetic.valid-type?+0x180>
    b944:      	mov	w0, #0x1                ; =1
    b948:      	str	x0, [x29, #0xb8]
    b94c:      	ldr	x0, [x29, #0xb8]
    b950:      	str	x0, [x29, #0xc0]
    b954:      	b	0xb9b4 <_stogir.vector-arithmetic.valid-type?+0x1e8>
    b958:      	mov	x0, x20
    b95c:      	bl	0xb95c <_stogir.vector-arithmetic.valid-type?+0x190>
		000000000000b95c:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    b960:      	cbz	x0, 0xb9ac <_stogir.vector-arithmetic.valid-type?+0x1e0>
    b964:      	str	w20, [x29, #0xb0]
    b968:      	mov	w0, #0x1                ; =1
    b96c:      	str	w0, [x29, #0xb4]
    b970:      	ldrsw	x0, [x29, #0xb0]
    b974:      	ldrsw	x1, [x29, #0xb4]
    b978:      	cmp	x0, x1
    b97c:      	b.ne	0xb988 <_stogir.vector-arithmetic.valid-type?+0x1bc>
    b980:      	mov	w20, #0x0               ; =0
    b984:      	b	0xb98c <_stogir.vector-arithmetic.valid-type?+0x1c0>
    b988:      	mov	w20, #0x1               ; =1
    b98c:      	cbz	x20, 0xb998 <_stogir.vector-arithmetic.valid-type?+0x1cc>
    b990:      	mov	w20, #0x1               ; =1
    b994:      	b	0xb9a4 <_stogir.vector-arithmetic.valid-type?+0x1d8>
    b998:      	mov	x0, x19
    b99c:      	bl	0xb99c <_stogir.vector-arithmetic.valid-type?+0x1d0>
		000000000000b99c:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.extrema?
    b9a0:      	mov	x20, x0
    b9a4:      	mov	x19, x20
    b9a8:      	b	0xb9b0 <_stogir.vector-arithmetic.valid-type?+0x1e4>
    b9ac:      	mov	w19, #0x0               ; =0
    b9b0:      	str	x19, [x29, #0xc0]
    b9b4:      	ldr	x23, [x29, #0xc0]
    b9b8:      	mov	x21, x23
    b9bc:      	mov	x22, x21
    b9c0:      	mov	x19, x22
    b9c4:      	b	0xb9cc <_stogir.vector-arithmetic.valid-type?+0x200>
    b9c8:      	mov	w19, #0x0               ; =0
    b9cc:      	mov	x20, x19
    b9d0:      	b	0xb9d8 <_stogir.vector-arithmetic.valid-type?+0x20c>
    b9d4:      	mov	w20, #0x0               ; =0
    b9d8:      	mov	x0, x20
    b9dc:      	ldp	x19, x20, [sp, #0x10]
    b9e0:      	ldp	x21, x22, [sp, #0x20]
    b9e4:      	ldr	x23, [sp, #0x30]
    b9e8:      	ldp	x29, x30, [sp], #0xd0
    b9ec:      	ret

000000000000b9f0 <_coil.core.Len$slice$len__i32>:
    b9f0:      	stp	x29, x30, [sp, #-0xb0]!
    b9f4:      	mov	x29, sp
    b9f8:      	str	x0, [x29, #0xa0]
    b9fc:      	str	x1, [x29, #0xa8]
    ba00:      	ldr	x0, [x29, #0xa8]
    ba04:      	ldp	x29, x30, [sp], #0xb0
    ba08:      	ret

000000000000ba0c <_inherent$slice$data__i32>:
    ba0c:      	stp	x29, x30, [sp, #-0xb0]!
    ba10:      	mov	x29, sp
    ba14:      	str	x0, [x29, #0xa0]
    ba18:      	str	x1, [x29, #0xa8]
    ba1c:      	ldr	x0, [x29, #0xa0]
    ba20:      	ldp	x29, x30, [sp], #0xb0
    ba24:      	ret

000000000000ba28 <_stogir.opcode.terminator?>:
    ba28:      	stp	x29, x30, [sp, #-0xb0]!
    ba2c:      	mov	x29, sp
    ba30:      	str	x19, [sp, #0x10]
    ba34:      	sxtw	x0, w0
    ba38:      	bl	0xba38 <_stogir.opcode.terminator?+0x10>
		000000000000ba38:  ARM64_RELOC_BRANCH26	_stogir.opcode.properties
    ba3c:      	ubfx	x0, x0, #0, #8
    ba40:      	and	x0, x0, #0x8
    ba44:      	ubfx	x0, x0, #0, #8
    ba48:      	strb	w0, [x29, #0xa0]
    ba4c:      	strb	wzr, [x29, #0xa1]
    ba50:      	ldrb	w0, [x29, #0xa0]
    ba54:      	ldrb	w1, [x29, #0xa1]
    ba58:      	cmp	x0, x1
    ba5c:      	b.ne	0xba68 <_stogir.opcode.terminator?+0x40>
    ba60:      	mov	w19, #0x0               ; =0
    ba64:      	b	0xba6c <_stogir.opcode.terminator?+0x44>
    ba68:      	mov	w19, #0x1               ; =1
    ba6c:      	mov	x0, x19
    ba70:      	ldr	x19, [sp, #0x10]
    ba74:      	ldp	x29, x30, [sp], #0xb0
    ba78:      	ret

000000000000ba7c <_stogir.switch.sign-mask>:
    ba7c:      	stp	x29, x30, [sp, #-0xa0]!
    ba80:      	mov	x29, sp
    ba84:      	str	x19, [sp, #0x10]
    ba88:      	sxtw	x19, w0
    ba8c:      	mov	x0, x19
    ba90:      	bl	0xba90 <_stogir.switch.sign-mask+0x14>
		000000000000ba90:  ARM64_RELOC_BRANCH26	_stogir.types.signed?
    ba94:      	cbz	x0, 0xbacc <_stogir.switch.sign-mask+0x50>
    ba98:      	mov	x0, x19
    ba9c:      	mov	w1, #0x8                ; =8
    baa0:      	bl	0xbaa0 <_stogir.switch.sign-mask+0x24>
		000000000000baa0:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    baa4:      	sxtw	x0, w0
    baa8:      	mov	w1, #0x8                ; =8
    baac:      	mul	x1, x1, x0
    bab0:      	sxtw	x1, w1
    bab4:      	sub	x1, x1, #0x1
    bab8:      	sxtw	x1, w1
    babc:      	mov	w0, #0x1                ; =1
    bac0:      	lsl	x0, x0, x1
    bac4:      	mov	x19, x0
    bac8:      	b	0xbad0 <_stogir.switch.sign-mask+0x54>
    bacc:      	mov	w19, #0x0               ; =0
    bad0:      	mov	x0, x19
    bad4:      	ldr	x19, [sp, #0x10]
    bad8:      	ldp	x29, x30, [sp], #0xa0
    badc:      	ret
