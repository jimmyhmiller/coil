
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-contained-load-promotion/build/verifier-contained-promotion/core-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_verify_graph>:
       0:      	sub	sp, sp, #0x1e0
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	str	x19, [sp, #0x1d0]
      14:      	add	x8, sp, #0x10
      18:      	mov	x19, x0
      1c:      	mov	x1, #0x8                ; =8
      20:      	bl	0x20 <_gap_verify_graph+0x20>
		0000000000000020:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target
      24:      	add	x16, sp, #0x10
      28:      	ldr	w0, [x16]
      2c:      	lsr	x16, x0, #0
      30:      	cmp	x16, #0x1
      34:      	b.eq	0x50 <_gap_verify_graph+0x50>
      38:      	b.lo	0x40 <_gap_verify_graph+0x40>
      3c:      	b	0x54 <_gap_verify_graph+0x54>
      40:      	cmp	x16, #0x0
      44:      	b.eq	0x4c <_gap_verify_graph+0x4c>
      48:      	b	0x54 <_gap_verify_graph+0x54>
      4c:      	b	0x60 <_gap_verify_graph+0x60>
      50:      	b	0x58 <_gap_verify_graph+0x58>
      54:      	b	0xa8 <_gap_verify_graph+0xa8>
      58:      	movn	x0, #0x0, lsl #48
      5c:      	b	0x94 <_gap_verify_graph+0x94>
      60:      	movz	x0, #0x0, lsl #48
      64:      	b	0x84 <_gap_verify_graph+0x84>
      68:      	add	x1, x0, #0x8
      6c:      	add	x16, sp, #0x30
      70:      	add	x2, x16, x0
      74:      	add	x0, x19, x0
      78:      	ldr	x0, [x0]
      7c:      	str	x0, [x2]
      80:      	mov	x0, x1
      84:      	cmp	x0, #0x1a0
      88:      	b.lo	0x68 <_gap_verify_graph+0x68>
      8c:      	add	x16, sp, #0x30
      90:      	ldr	x0, [x16, #0x8]
      94:      	ldr	x19, [sp, #0x1d0]
      98:      	ldr	x29, [sp]
      9c:      	ldr	x30, [sp, #0x8]
      a0:      	add	sp, sp, #0x1e0
      a4:      	ret
      a8:      	brk	#0
      ac:      	b	0xa8 <_gap_verify_graph+0xa8>

00000000000000b0 <_stogir.verify.integer-operations-target>:
      b0:      	sub	sp, sp, #0x70
      b4:      	str	x29, [sp]
      b8:      	str	x30, [sp, #0x8]
      bc:      	mov	x29, sp
      c0:      	str	x19, [sp, #0x50]
      c4:      	str	x20, [sp, #0x58]
      c8:      	str	x21, [sp, #0x60]
      cc:      	mov	x19, x8
      d0:      	add	x8, sp, #0x10
      d4:      	mov	x20, x0
      d8:      	mov	w21, w1
      dc:      	bl	0xdc <_stogir.verify.integer-operations-target+0x2c>
		00000000000000dc:  ARM64_RELOC_BRANCH26	_stogir.verify.structure
      e0:      	add	x16, sp, #0x10
      e4:      	ldr	w0, [x16]
      e8:      	lsr	x16, x0, #0
      ec:      	cmp	x16, #0x1
      f0:      	b.eq	0x10c <_stogir.verify.integer-operations-target+0x5c>
      f4:      	b.lo	0xfc <_stogir.verify.integer-operations-target+0x4c>
      f8:      	b	0x110 <_stogir.verify.integer-operations-target+0x60>
      fc:      	cmp	x16, #0x0
     100:      	b.eq	0x108 <_stogir.verify.integer-operations-target+0x58>
     104:      	b	0x110 <_stogir.verify.integer-operations-target+0x60>
     108:      	b	0x138 <_stogir.verify.integer-operations-target+0x88>
     10c:      	b	0x114 <_stogir.verify.integer-operations-target+0x64>
     110:      	b	0x18c <_stogir.verify.integer-operations-target+0xdc>
     114:      	add	x16, sp, #0x10
     118:      	orr	x0, x16, xzr
     11c:      	add	x0, x0, #0x8
     120:      	add	x16, sp, #0x10
     124:      	ldr	x1, [x16, #0x8]
     128:      	ldr	x0, [x0, #0x8]
     12c:      	mov	x2, x0
     130:      	mov	x0, #0x1                ; =1
     134:      	b	0x164 <_stogir.verify.integer-operations-target+0xb4>
     138:      	lsr	w21, w21, #0
     13c:      	add	x8, sp, #0x30
     140:      	mov	x0, x20
     144:      	mov	w1, w21
     148:      	bl	0x148 <_stogir.verify.integer-operations-target+0x98>
		0000000000000148:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target-structured
     14c:      	add	x16, sp, #0x30
     150:      	ldr	x0, [x16]
     154:      	add	x16, sp, #0x30
     158:      	ldr	x1, [x16, #0x8]
     15c:      	add	x16, sp, #0x30
     160:      	ldr	x2, [x16, #0x10]
     164:      	str	x0, [x19]
     168:      	str	x1, [x19, #0x8]
     16c:      	str	x2, [x19, #0x10]
     170:      	ldr	x19, [sp, #0x50]
     174:      	ldr	x20, [sp, #0x58]
     178:      	ldr	x21, [sp, #0x60]
     17c:      	ldr	x29, [sp]
     180:      	ldr	x30, [sp, #0x8]
     184:      	add	sp, sp, #0x70
     188:      	ret
     18c:      	brk	#0
     190:      	b	0x18c <_stogir.verify.integer-operations-target+0xdc>

0000000000000194 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node>:
     194:      	ldr	x0, [x0, #0x8]
     198:      	ret
     19c:      	udf	#0x0

00000000000001a0 <_stogir.verify.structure>:
     1a0:      	sub	sp, sp, #0x1a0
     1a4:      	str	x29, [sp, #0x10]
     1a8:      	str	x30, [sp, #0x18]
     1ac:      	add	x29, sp, #0x10
     1b0:      	str	x19, [sp, #0x148]
     1b4:      	str	x20, [sp, #0x150]
     1b8:      	str	x21, [sp, #0x158]
     1bc:      	str	x22, [sp, #0x160]
     1c0:      	str	x23, [sp, #0x168]
     1c4:      	str	x24, [sp, #0x170]
     1c8:      	str	x25, [sp, #0x178]
     1cc:      	str	x26, [sp, #0x180]
     1d0:      	str	x27, [sp, #0x188]
     1d4:      	str	x28, [sp, #0x190]
     1d8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000001d8:  ARM64_RELOC_PAGE21	l_stogir.299
     1dc:      	ldr	x16, [x16]
		00000000000001dc:  ARM64_RELOC_PAGEOFF12	l_stogir.299
     1e0:      	orr	x19, x16, xzr
     1e4:      	add	x1, x0, #0x78
     1e8:      	ldr	x20, [x0, #0x8]
     1ec:      	mov	x21, x8
     1f0:      	mov	x22, x0
     1f4:      	mov	x0, x1
     1f8:      	bl	0x1f8 <_stogir.verify.structure+0x58>
		00000000000001f8:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__i32
     1fc:      	cmp	x20, x0
     200:      	b.ne	0x560 <_stogir.verify.structure+0x3c0>
     204:      	mov	x0, x19
     208:      	movz	x1, #0x0, lsl #48
     20c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000020c:  ARM64_RELOC_PAGE21	l_stogir.300
     210:      	ldr	x16, [x16]
		0000000000000210:  ARM64_RELOC_PAGEOFF12	l_stogir.300
     214:      	orr	x20, x16, xzr
     218:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000218:  ARM64_RELOC_PAGE21	l_stogir.301
     21c:      	ldr	x16, [x16]
		000000000000021c:  ARM64_RELOC_PAGEOFF12	l_stogir.301
     220:      	orr	x23, x16, xzr
     224:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000224:  ARM64_RELOC_PAGE21	l_stogir.302
     228:      	ldr	x16, [x16]
		0000000000000228:  ARM64_RELOC_PAGEOFF12	l_stogir.302
     22c:      	orr	x24, x16, xzr
     230:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000230:  ARM64_RELOC_PAGE21	l_stogir.303
     234:      	ldr	x16, [x16]
		0000000000000234:  ARM64_RELOC_PAGEOFF12	l_stogir.303
     238:      	orr	x25, x16, xzr
     23c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000023c:  ARM64_RELOC_PAGE21	l_stogir.304
     240:      	ldr	x16, [x16]
		0000000000000240:  ARM64_RELOC_PAGEOFF12	l_stogir.304
     244:      	orr	x26, x16, xzr
     248:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000248:  ARM64_RELOC_PAGE21	l_stogir.305
     24c:      	ldr	x16, [x16]
		000000000000024c:  ARM64_RELOC_PAGEOFF12	l_stogir.305
     250:      	orr	x27, x16, xzr
     254:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000254:  ARM64_RELOC_PAGE21	l_stogir.306
     258:      	ldr	x16, [x16]
		0000000000000258:  ARM64_RELOC_PAGEOFF12	l_stogir.306
     25c:      	orr	x28, x16, xzr
     260:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000260:  ARM64_RELOC_PAGE21	l_stogir.307
     264:      	ldr	x16, [x16]
		0000000000000264:  ARM64_RELOC_PAGEOFF12	l_stogir.307
     268:      	orr	x2, x16, xzr
     26c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000026c:  ARM64_RELOC_PAGE21	l_stogir.308
     270:      	ldr	x16, [x16]
		0000000000000270:  ARM64_RELOC_PAGEOFF12	l_stogir.308
     274:      	orr	x3, x16, xzr
     278:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000278:  ARM64_RELOC_PAGE21	l_stogir.309
     27c:      	ldr	x16, [x16]
		000000000000027c:  ARM64_RELOC_PAGEOFF12	l_stogir.309
     280:      	orr	x4, x16, xzr
     284:      	add	x5, x22, #0x110
     288:      	add	x6, x22, #0x78
     28c:      	add	x7, x22, #0x28
     290:      	add	x8, x22, #0x50
     294:      	add	x9, x22, #0x78
     298:      	add	x10, x22, #0x28
     29c:      	add	x11, x22, #0x50
     2a0:      	add	x12, x5, #0x28
     2a4:      	mov	x13, x0
     2a8:      	mov	x14, x1
     2ac:      	mov	x0, #0x1                ; =1
     2b0:      	movz	x1, #0x0, lsl #48
     2b4:      	b	0x34c <_stogir.verify.structure+0x1ac>
     2b8:      	mov	x0, x21
     2bc:      	mov	x1, x19
     2c0:      	ldr	x2, [sp, #0x78]
     2c4:      	mov	x3, #0x16               ; =22
     2c8:      	b	0x2f4 <_stogir.verify.structure+0x154>
     2cc:      	nop
     2d0:      	str	x19, [sp, #0xe8]
     2d4:      	ldr	x19, [sp, #0xb0]
     2d8:      	str	x20, [sp, #0xe0]
     2dc:      	str	x23, [sp, #0xd0]
     2e0:      	str	x24, [sp, #0xc8]
     2e4:      	mov	x0, x21
     2e8:      	mov	x1, x19
     2ec:      	ldr	x2, [sp, #0x70]
     2f0:      	mov	x3, #0x23               ; =35
     2f4:      	ldr	x21, [sp, #0xa8]
     2f8:      	ldr	x19, [sp, #0x68]
     2fc:      	ldr	x20, [sp, #0x70]
     300:      	ldr	x23, [sp, #0x78]
     304:      	ldr	x24, [sp, #0x80]
     308:      	ldr	x4, [sp, #0x60]
     30c:      	ldr	x5, [sp, #0xe8]
     310:      	mov	x12, x28
     314:      	ldr	x28, [sp, #0xa0]
     318:      	ldr	x6, [sp, #0xe0]
     31c:      	ldr	x7, [sp, #0xd0]
     320:      	ldr	x8, [sp, #0xc8]
     324:      	mov	x9, x25
     328:      	ldr	x25, [sp, #0x88]
     32c:      	mov	x10, x26
     330:      	ldr	x26, [sp, #0x90]
     334:      	mov	x11, x27
     338:      	ldr	x27, [sp, #0x98]
     33c:      	mov	x13, x2
     340:      	ldr	x2, [sp, #0x50]
     344:      	mov	x14, x3
     348:      	ldr	x3, [sp, #0x58]
     34c:      	str	x2, [sp, #0x50]
     350:      	mov	x2, x19
     354:      	str	x3, [sp, #0x58]
     358:      	str	x4, [sp, #0x60]
     35c:      	str	x1, [sp, #0xb0]
     360:      	mov	x1, x14
     364:      	str	x13, [sp, #0xb8]
     368:      	str	x14, [sp, #0xc0]
     36c:      	str	x19, [sp, #0x68]
     370:      	mov	x19, x5
     374:      	str	x20, [sp, #0x70]
     378:      	mov	x20, x6
     37c:      	str	x23, [sp, #0x78]
     380:      	mov	x23, x7
     384:      	str	x24, [sp, #0x80]
     388:      	mov	x24, x8
     38c:      	str	x25, [sp, #0x88]
     390:      	mov	x25, x9
     394:      	str	x26, [sp, #0x90]
     398:      	mov	x26, x10
     39c:      	str	x27, [sp, #0x98]
     3a0:      	mov	x27, x11
     3a4:      	str	x28, [sp, #0xa0]
     3a8:      	mov	x28, x12
     3ac:      	str	x21, [sp, #0xa8]
     3b0:      	mov	x21, x0
     3b4:      	mov	x0, x13
     3b8:      	movz	x3, #0x0, lsl #48
     3bc:      	bl	0x3bc <_stogir.verify.structure+0x21c>
		00000000000003bc:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     3c0:      	cmp	x0, #0x0
     3c4:      	b.eq	0xd8c <_stogir.verify.structure+0xbec>
     3c8:      	ldr	x0, [x22, #0x8]
     3cc:      	cmp	x21, x0
     3d0:      	b.ge	0xd94 <_stogir.verify.structure+0xbf4>
     3d4:      	lsl	x0, x21, #4
     3d8:      	lsl	x1, x21, #2
     3dc:      	ldr	x2, [x22]
     3e0:      	add	x0, x0, x2
     3e4:      	ldr	x2, [x0]
     3e8:      	ldr	x0, [x0, #0x8]
     3ec:      	add	x16, sp, #0x20
     3f0:      	str	x2, [x16]
     3f4:      	add	x16, sp, #0x20
     3f8:      	str	x0, [x16, #0x8]
     3fc:      	ldr	x0, [x22, #0x78]
     400:      	add	x0, x1, x0
     404:      	ldr	w0, [x0]
     408:      	sxtw	x0, w0
     40c:      	cmp	x0, #0x0
     410:      	b.lt	0x2d0 <_stogir.verify.structure+0x130>
     414:      	mov	x17, #0xffff            ; =65535
     418:      	cmp	x0, x17
     41c:      	b.gt	0xd9c <_stogir.verify.structure+0xbfc>
     420:      	uxtb	w1, w2
     424:      	orr	x2, x1, xzr
     428:      	lsr	w2, w2, #0
     42c:      	str	w2, [sp, #0xd8]
     430:      	str	x24, [sp, #0xc8]
     434:      	mov	x24, x0
     438:      	mov	w0, w2
     43c:      	str	x23, [sp, #0xd0]
     440:      	mov	w23, w1
     444:      	bl	0x444 <_stogir.verify.structure+0x2a4>
		0000000000000444:  ARM64_RELOC_BRANCH26	_stogir.opcode.valid?
     448:      	cmp	x0, #0x0
     44c:      	b.eq	0xdb4 <_stogir.verify.structure+0xc14>
     450:      	add	x16, sp, #0x20
     454:      	ldr	w0, [x16]
     458:      	ubfx	x0, x0, #8, #8
     45c:      	lsr	w0, w0, #0
     460:      	bl	0x460 <_stogir.verify.structure+0x2c0>
		0000000000000460:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
     464:      	cmp	x0, #0x0
     468:      	b.eq	0xdc4 <_stogir.verify.structure+0xc24>
     46c:      	ldr	w0, [sp, #0xd8]
     470:      	bl	0x470 <_stogir.verify.structure+0x2d0>
		0000000000000470:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
     474:      	lsr	w0, w0, #0
     478:      	sxtw	x0, w0
     47c:      	cmp	x0, #0x0
     480:      	b.lt	0xb30 <_stogir.verify.structure+0x990>
     484:      	ldr	w0, [sp, #0xd8]
     488:      	bl	0x488 <_stogir.verify.structure+0x2e8>
		0000000000000488:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
     48c:      	lsr	w0, w0, #0
     490:      	sxtw	x0, w0
     494:      	cmp	x24, x0
     498:      	b.eq	0xb30 <_stogir.verify.structure+0x990>
     49c:      	str	x19, [sp, #0xe8]
     4a0:      	str	x20, [sp, #0xe0]
     4a4:      	mov	x0, x21
     4a8:      	ldr	x1, [sp, #0xb0]
     4ac:      	ldr	x2, [sp, #0x80]
     4b0:      	mov	x3, #0x23               ; =35
     4b4:      	b	0x55c <_stogir.verify.structure+0x3bc>
     4b8:      	ldr	x0, [sp, #0xb8]
     4bc:      	ldr	x1, [sp, #0xc0]
     4c0:      	ldr	x2, [sp, #0x68]
     4c4:      	movz	x3, #0x0, lsl #48
     4c8:      	bl	0x4c8 <_stogir.verify.structure+0x328>
		00000000000004c8:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     4cc:      	cmp	x0, #0x0
     4d0:      	b.eq	0x4e8 <_stogir.verify.structure+0x348>
     4d4:      	and	x0, x19, #0xffffffff
     4d8:      	mov	x1, x0
     4dc:      	movz	x0, #0x0, lsl #48
     4e0:      	movz	x2, #0x0, lsl #48
     4e4:      	b	0x4f4 <_stogir.verify.structure+0x354>
     4e8:      	ldr	x1, [sp, #0xb8]
     4ec:      	ldr	x2, [sp, #0xc0]
     4f0:      	mov	x0, #0x1                ; =1
     4f4:      	ldr	x3, [sp, #0xa8]
     4f8:      	str	x0, [x3]
     4fc:      	str	x1, [x3, #0x8]
     500:      	str	x2, [x3, #0x10]
     504:      	ldr	x19, [sp, #0x148]
     508:      	ldr	x20, [sp, #0x150]
     50c:      	ldr	x21, [sp, #0x158]
     510:      	ldr	x22, [sp, #0x160]
     514:      	ldr	x23, [sp, #0x168]
     518:      	ldr	x24, [sp, #0x170]
     51c:      	ldr	x25, [sp, #0x178]
     520:      	ldr	x26, [sp, #0x180]
     524:      	ldr	x27, [sp, #0x188]
     528:      	ldr	x28, [sp, #0x190]
     52c:      	ldr	x29, [sp, #0x10]
     530:      	ldr	x30, [sp, #0x18]
     534:      	add	sp, sp, #0x1a0
     538:      	ret
     53c:      	ldr	x2, [sp, #0x130]
     540:      	add	x0, x2, x21
     544:      	ldr	x19, [sp, #0xb0]
     548:      	add	x1, x19, #0x1
     54c:      	lsr	w1, w1, #0
     550:      	sxtw	x1, w1
     554:      	ldr	x2, [sp, #0x118]
     558:      	ldr	x3, [sp, #0x120]
     55c:      	b	0x2c8 <_stogir.verify.structure+0x128>
     560:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000560:  ARM64_RELOC_PAGE21	l_stogir.310
     564:      	ldr	x16, [x16]
		0000000000000564:  ARM64_RELOC_PAGEOFF12	l_stogir.310
     568:      	orr	x0, x16, xzr
     56c:      	mov	x1, #0x2c               ; =44
     570:      	b	0x20c <_stogir.verify.structure+0x6c>
     574:      	mov	x10, x1
     578:      	movz	x1, #0x0, lsl #48
     57c:      	cmp	x1, #0x0
     580:      	b.eq	0xdd4 <_stogir.verify.structure+0xc34>
     584:      	cmp	x2, #0x0
     588:      	b.eq	0xc20 <_stogir.verify.structure+0xa80>
     58c:      	ldr	x20, [sp, #0xe0]
     590:      	ldr	x1, [sp, #0xd0]
     594:      	ldr	x3, [sp, #0xc8]
     598:      	mov	x2, x7
     59c:      	mov	x4, x10
     5a0:      	b	0xba0 <_stogir.verify.structure+0xa00>
     5a4:      	mov	x0, x1
     5a8:      	ldr	x1, [sp, #0x138]
     5ac:      	b	0x5b8 <_stogir.verify.structure+0x418>
     5b0:      	mov	x0, x10
     5b4:      	ldr	x1, [sp, #0x138]
     5b8:      	b	0x6d4 <_stogir.verify.structure+0x534>
     5bc:      	lsr	x3, x2, #0
     5c0:      	str	x1, [sp, #0x108]
     5c4:      	str	x2, [sp, #0x110]
     5c8:      	mov	x2, x3
     5cc:      	str	w19, [sp, #0x100]
     5d0:      	mov	x19, x0
     5d4:      	mov	x0, x1
     5d8:      	ldr	x1, [sp, #0x68]
     5dc:      	bl	0x5dc <_stogir.verify.structure+0x43c>
		00000000000005dc:  ARM64_RELOC_BRANCH26	_memcmp
     5e0:      	lsr	w0, w0, #0
     5e4:      	sxtw	x0, w0
     5e8:      	cmp	x0, #0x0
     5ec:      	cset	w0, eq
     5f0:      	ubfx	x0, x0, #0, #8
     5f4:      	ldr	x1, [sp, #0x108]
     5f8:      	ldr	x2, [sp, #0x110]
     5fc:      	b	0x60c <_stogir.verify.structure+0x46c>
     600:      	ldr	x1, [sp, #0x108]
     604:      	ldr	x2, [sp, #0x110]
     608:      	movz	x0, #0x0, lsl #48
     60c:      	cmp	x0, #0x0
     610:      	b.eq	0x624 <_stogir.verify.structure+0x484>
     614:      	cmp	x19, x24
     618:      	cset	w0, le
     61c:      	ubfx	x0, x0, #0, #8
     620:      	b	0x628 <_stogir.verify.structure+0x488>
     624:      	movz	x0, #0x0, lsl #48
     628:      	cmp	x0, #0x0
     62c:      	b.eq	0xde0 <_stogir.verify.structure+0xc40>
     630:      	lsr	w0, w19, #0
     634:      	str	x1, [sp, #0x118]
     638:      	mov	w1, w0
     63c:      	str	x2, [sp, #0x120]
     640:      	str	x24, [sp, #0x128]
     644:      	mov	w24, w0
     648:      	ldr	w0, [sp, #0xd8]
     64c:      	bl	0x64c <_stogir.verify.structure+0x4ac>
		000000000000064c:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
     650:      	add	x16, sp, #0x40
     654:      	str	x16, [sp]
     658:      	ldr	w1, [sp, #0x100]
     65c:      	mov	w2, w24
     660:      	str	x20, [sp, #0x130]
     664:      	mov	x20, x0
     668:      	mov	x0, x22
     66c:      	bl	0x66c <_stogir.verify.structure+0x4cc>
		000000000000066c:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     670:      	ldr	x16, [sp]
     674:      	str	x0, [x16]
     678:      	str	x1, [x16, #0x8]
     67c:      	add	x16, sp, #0x40
     680:      	ldr	x0, [x16]
     684:      	add	x16, sp, #0x40
     688:      	ldr	x1, [x16, #0x8]
     68c:      	lsr	w2, w0, #0
     690:      	add	x16, sp, #0x30
     694:      	str	x0, [x16]
     698:      	add	x16, sp, #0x30
     69c:      	str	x1, [x16, #0x8]
     6a0:      	lsr	x16, x2, #0
     6a4:      	cmp	x16, #0x1
     6a8:      	b.eq	0x6c4 <_stogir.verify.structure+0x524>
     6ac:      	b.lo	0x6b4 <_stogir.verify.structure+0x514>
     6b0:      	b	0x6c8 <_stogir.verify.structure+0x528>
     6b4:      	cmp	x16, #0x0
     6b8:      	b.eq	0x6c0 <_stogir.verify.structure+0x520>
     6bc:      	b	0x6c8 <_stogir.verify.structure+0x528>
     6c0:      	b	0x6cc <_stogir.verify.structure+0x52c>
     6c4:      	b	0x724 <_stogir.verify.structure+0x584>
     6c8:      	b	0xd24 <_stogir.verify.structure+0xb84>
     6cc:      	ldr	x0, [sp, #0xa0]
     6d0:      	mov	x1, #0x17               ; =23
     6d4:      	add	x2, x19, #0x1
     6d8:      	lsr	w2, w2, #0
     6dc:      	sxtw	x2, w2
     6e0:      	ldr	x24, [sp, #0x128]
     6e4:      	ldr	x20, [sp, #0x130]
     6e8:      	ldr	w19, [sp, #0x100]
     6ec:      	fmov	d31, x0
     6f0:      	mov	x0, x2
     6f4:      	mov	x2, x1
     6f8:      	fmov	x1, d31
     6fc:      	cmp	x2, #0x0
     700:      	b.ne	0xdf0 <_stogir.verify.structure+0xc50>
     704:      	cmp	x2, #0x0
     708:      	b.ne	0x5bc <_stogir.verify.structure+0x41c>
     70c:      	str	w19, [sp, #0x100]
     710:      	mov	x19, x0
     714:      	str	x1, [sp, #0x108]
     718:      	str	x2, [sp, #0x110]
     71c:      	mov	x0, #0x1                ; =1
     720:      	b	0x5f4 <_stogir.verify.structure+0x454>
     724:      	lsr	w20, w20, #0
     728:      	add	x16, sp, #0x30
     72c:      	ldr	w0, [x16, #0x8]
     730:      	orr	x1, x20, xzr
     734:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000734:  ARM64_RELOC_PAGE21	l_stogir.311
     738:      	ldr	x16, [x16]
		0000000000000738:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     73c:      	ldr	w2, [x16]
     740:      	cmp	x1, x2
     744:      	b.ne	0x750 <_stogir.verify.structure+0x5b0>
     748:      	mov	x2, #0x1                ; =1
     74c:      	b	0x768 <_stogir.verify.structure+0x5c8>
     750:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000750:  ARM64_RELOC_PAGE21	l_stogir.312
     754:      	ldr	x16, [x16]
		0000000000000754:  ARM64_RELOC_PAGEOFF12	l_stogir.312
     758:      	ldr	w2, [x16]
     75c:      	cmp	x1, x2
     760:      	cset	w2, eq
     764:      	ubfx	x2, x2, #0, #8
     768:      	sxtw	x0, w0
     76c:      	cmp	x0, #0x0
     770:      	cset	w3, gt
     774:      	lsl	x4, x0, #2
     778:      	cmp	x0, #0x0
     77c:      	cset	w5, lt
     780:      	movz	x16, #0x0, lsl #48
     784:      	sub	x6, x16, x0
     788:      	sub	x7, x6, #0x1
     78c:      	lsl	x8, x7, #2
     790:      	cmp	x2, #0x0
     794:      	b.eq	0x7dc <_stogir.verify.structure+0x63c>
     798:      	uxtb	w16, w3
     79c:      	cmp	w16, wzr
     7a0:      	b.eq	0xa70 <_stogir.verify.structure+0x8d0>
     7a4:      	ldr	x9, [x22, #0x8]
     7a8:      	cmp	x0, x9
     7ac:      	b.ge	0xab4 <_stogir.verify.structure+0x914>
     7b0:      	ldr	x9, [x25, #0x8]
     7b4:      	cmp	x0, x9
     7b8:      	b.ge	0xc80 <_stogir.verify.structure+0xae0>
     7bc:      	ldr	x9, [x22, #0x78]
     7c0:      	add	x9, x4, x9
     7c4:      	ldr	w9, [x9]
     7c8:      	sxtw	x9, w9
     7cc:      	cmp	x9, #0x0
     7d0:      	cset	w9, ge
     7d4:      	ubfx	x9, x9, #0, #8
     7d8:      	b	0xc84 <_stogir.verify.structure+0xae4>
     7dc:      	ldr	x9, [sp, #0x118]
     7e0:      	ldr	x10, [sp, #0x120]
     7e4:      	movz	x7, #0x0, lsl #48
     7e8:      	b	0x800 <_stogir.verify.structure+0x660>
     7ec:      	ldr	x7, [sp, #0x118]
     7f0:      	ldr	x10, [sp, #0x120]
     7f4:      	fmov	d31, x7
     7f8:      	mov	x7, x9
     7fc:      	fmov	x9, d31
     800:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000800:  ARM64_RELOC_PAGE21	l_stogir.313
     804:      	ldr	x16, [x16]
		0000000000000804:  ARM64_RELOC_PAGEOFF12	l_stogir.313
     808:      	ldr	w11, [x16]
     80c:      	cmp	x1, x11
     810:      	b.ne	0xe04 <_stogir.verify.structure+0xc64>
     814:      	cmp	x0, #0x0
     818:      	b.gt	0xa14 <_stogir.verify.structure+0x874>
     81c:      	ldr	x11, [sp, #0xe8]
     820:      	mov	x1, x9
     824:      	mov	x9, x1
     828:      	movz	x1, #0x0, lsl #48
     82c:      	lsr	w1, w1, #0
     830:      	lsr	x16, x1, #0
     834:      	cmp	x16, #0x1
     838:      	b.eq	0x854 <_stogir.verify.structure+0x6b4>
     83c:      	b.lo	0x844 <_stogir.verify.structure+0x6a4>
     840:      	b	0x858 <_stogir.verify.structure+0x6b8>
     844:      	cmp	x16, #0x0
     848:      	b.eq	0x850 <_stogir.verify.structure+0x6b0>
     84c:      	b	0x858 <_stogir.verify.structure+0x6b8>
     850:      	b	0x85c <_stogir.verify.structure+0x6bc>
     854:      	b	0xa08 <_stogir.verify.structure+0x868>
     858:      	b	0xd84 <_stogir.verify.structure+0xbe4>
     85c:      	ldr	x1, [sp, #0x58]
     860:      	mov	x9, #0x21               ; =33
     864:      	b	0xa10 <_stogir.verify.structure+0x870>
     868:      	mov	x1, x9
     86c:      	mov	x9, x10
     870:      	cmp	x20, #0xf
     874:      	b.hs	0x574 <_stogir.verify.structure+0x3d4>
     878:      	mov	x16, #0x1               ; =1
     87c:      	lsl	x10, x16, x20
     880:      	lsr	w10, w10, #0
     884:      	mov	x17, #0x5e1c            ; =24092
     888:      	and	x10, x10, x17
     88c:      	lsr	w10, w10, #0
     890:      	cmp	x10, #0x0
     894:      	cset	w10, eq
     898:      	uxtb	w16, w10
     89c:      	cmp	w16, wzr
     8a0:      	cset	x10, eq
     8a4:      	fmov	d31, x1
     8a8:      	mov	x1, x10
     8ac:      	fmov	x10, d31
     8b0:      	b	0x57c <_stogir.verify.structure+0x3dc>
     8b4:      	lsr	w0, w21, #0
     8b8:      	lsr	w19, w0, #0
     8bc:      	cmp	x23, #0x78
     8c0:      	cset	w23, eq
     8c4:      	mov	x2, x1
     8c8:      	ldr	x1, [sp, #0xf0]
     8cc:      	mov	x0, #0x1                ; =1
     8d0:      	b	0x6fc <_stogir.verify.structure+0x55c>
     8d4:      	ldr	x0, [sp, #0x98]
     8d8:      	mov	x1, #0x1b               ; =27
     8dc:      	b	0x978 <_stogir.verify.structure+0x7d8>
     8e0:      	lsr	x4, x3, #0
     8e4:      	str	x1, [sp, #0xf0]
     8e8:      	str	x3, [sp, #0xf8]
     8ec:      	str	x20, [sp, #0xe0]
     8f0:      	mov	x20, x2
     8f4:      	mov	x2, x4
     8f8:      	str	x19, [sp, #0xe8]
     8fc:      	mov	x19, x0
     900:      	mov	x0, x1
     904:      	ldr	x1, [sp, #0x68]
     908:      	bl	0x908 <_stogir.verify.structure+0x768>
		0000000000000908:  ARM64_RELOC_BRANCH26	_memcmp
     90c:      	lsr	w0, w0, #0
     910:      	sxtw	x0, w0
     914:      	cmp	x0, #0x0
     918:      	cset	w0, eq
     91c:      	ubfx	x0, x0, #0, #8
     920:      	ldr	x1, [sp, #0xf8]
     924:      	b	0x930 <_stogir.verify.structure+0x790>
     928:      	ldr	x1, [sp, #0xf8]
     92c:      	movz	x0, #0x0, lsl #48
     930:      	cmp	x0, #0x0
     934:      	b.eq	0x948 <_stogir.verify.structure+0x7a8>
     938:      	cmp	x19, x20
     93c:      	cset	w0, lt
     940:      	ubfx	x0, x0, #0, #8
     944:      	b	0x94c <_stogir.verify.structure+0x7ac>
     948:      	movz	x0, #0x0, lsl #48
     94c:      	cmp	x0, #0x0
     950:      	b.eq	0x8b4 <_stogir.verify.structure+0x714>
     954:      	add	x0, x19, x21
     958:      	ldr	x2, [x22, #0x78]
     95c:      	lsl	x0, x0, #2
     960:      	add	x0, x0, x2
     964:      	ldr	w0, [x0]
     968:      	sxtw	x0, w0
     96c:      	cmn	x0, #0x1
     970:      	b.ne	0x8d4 <_stogir.verify.structure+0x734>
     974:      	ldr	x0, [sp, #0xf0]
     978:      	add	x2, x19, #0x1
     97c:      	ldr	x19, [sp, #0xe8]
     980:      	mov	x3, x1
     984:      	mov	x1, x0
     988:      	mov	x0, x2
     98c:      	mov	x2, x20
     990:      	ldr	x20, [sp, #0xe0]
     994:      	cmp	x3, #0x0
     998:      	b.ne	0xe0c <_stogir.verify.structure+0xc6c>
     99c:      	cmp	x3, #0x0
     9a0:      	b.ne	0x8e0 <_stogir.verify.structure+0x740>
     9a4:      	str	x19, [sp, #0xe8]
     9a8:      	mov	x19, x0
     9ac:      	str	x20, [sp, #0xe0]
     9b0:      	mov	x20, x2
     9b4:      	str	x1, [sp, #0xf0]
     9b8:      	str	x3, [sp, #0xf8]
     9bc:      	mov	x0, #0x1                ; =1
     9c0:      	b	0x920 <_stogir.verify.structure+0x780>
     9c4:      	ldr	x0, [sp, #0xb8]
     9c8:      	ldr	x1, [sp, #0xc0]
     9cc:      	add	x2, x24, #0x4
     9d0:      	ldr	x3, [x22, #0x8]
     9d4:      	asr	x16, x2, #63
     9d8:      	lsr	x16, x16, #62
     9dc:      	add	x2, x2, x16
     9e0:      	asr	x2, x2, #2
     9e4:      	add	x4, x2, x21
     9e8:      	cmp	x4, x3
     9ec:      	b.le	0x9f8 <_stogir.verify.structure+0x858>
     9f0:      	ldr	x0, [sp, #0x90]
     9f4:      	mov	x1, #0x15               ; =21
     9f8:      	mov	x3, x1
     9fc:      	mov	x1, x0
     a00:      	mov	x0, #0x1                ; =1
     a04:      	b	0x994 <_stogir.verify.structure+0x7f4>
     a08:      	mov	x1, x9
     a0c:      	mov	x9, x10
     a10:      	b	0x870 <_stogir.verify.structure+0x6d0>
     a14:      	ldr	x1, [x28, #0x8]
     a18:      	cmp	x0, x1
     a1c:      	b.gt	0xe28 <_stogir.verify.structure+0xc88>
     a20:      	sub	x1, x0, #0x1
     a24:      	ldr	x11, [sp, #0xe8]
     a28:      	ldr	x12, [x11, #0x28]
     a2c:      	mov	x17, #0x18              ; =24
     a30:      	mul	x1, x1, x17
     a34:      	add	x1, x1, x12
     a38:      	ldr	x12, [x1]
     a3c:      	ldr	x1, [x1, #0x8]
     a40:      	ldr	x13, [x11, #0x8]
     a44:      	cmp	x12, #0x0
     a48:      	b.lt	0xc70 <_stogir.verify.structure+0xad0>
     a4c:      	cmp	x12, x13
     a50:      	b.gt	0xc70 <_stogir.verify.structure+0xad0>
     a54:      	cmp	x1, #0x0
     a58:      	b.lt	0xc70 <_stogir.verify.structure+0xad0>
     a5c:      	sub	x12, x13, x12
     a60:      	cmp	x1, x12
     a64:      	b.gt	0xc70 <_stogir.verify.structure+0xad0>
     a68:      	mov	x1, #0x1                ; =1
     a6c:      	b	0xc74 <_stogir.verify.structure+0xad4>
     a70:      	uxtb	w16, w5
     a74:      	cmp	w16, wzr
     a78:      	b.eq	0xabc <_stogir.verify.structure+0x91c>
     a7c:      	ldr	x9, [x26, #0x8]
     a80:      	ldr	x10, [x27, #0x8]
     a84:      	cmp	x9, x10
     a88:      	b.ne	0xc78 <_stogir.verify.structure+0xad8>
     a8c:      	cmp	x6, x9
     a90:      	b.gt	0xcf0 <_stogir.verify.structure+0xb50>
     a94:      	ldr	x9, [x22, #0x50]
     a98:      	add	x9, x8, x9
     a9c:      	ldr	w9, [x9]
     aa0:      	sxtw	x9, w9
     aa4:      	cmp	x9, #0x0
     aa8:      	cset	w9, gt
     aac:      	ubfx	x9, x9, #0, #8
     ab0:      	b	0xcf4 <_stogir.verify.structure+0xb54>
     ab4:      	movz	x9, #0x0, lsl #48
     ab8:      	b	0xac0 <_stogir.verify.structure+0x920>
     abc:      	movz	x9, #0x0, lsl #48
     ac0:      	cmp	x9, #0x0
     ac4:      	b.eq	0xaf4 <_stogir.verify.structure+0x954>
     ac8:      	uxtb	w16, w3
     acc:      	cmp	w16, wzr
     ad0:      	b.eq	0xae4 <_stogir.verify.structure+0x944>
     ad4:      	lsl	x7, x0, #4
     ad8:      	ldr	x9, [x22]
     adc:      	add	x7, x7, x9
     ae0:      	b	0xaf0 <_stogir.verify.structure+0x950>
     ae4:      	lsl	x7, x7, #4
     ae8:      	ldr	x9, [x22, #0x28]
     aec:      	add	x7, x7, x9
     af0:      	b	0xaf8 <_stogir.verify.structure+0x958>
     af4:      	movz	x7, #0x0, lsl #48
     af8:      	cmp	x7, #0x0
     afc:      	cset	w9, eq
     b00:      	uxtb	w16, w9
     b04:      	cmp	w16, wzr
     b08:      	cset	x9, eq
     b0c:      	cmp	x9, #0x0
     b10:      	b.eq	0x7ec <_stogir.verify.structure+0x64c>
     b14:      	ldr	w7, [x7]
     b18:      	uxtb	w7, w7
     b1c:      	cmp	x7, #0x48
     b20:      	b.ne	0x7ec <_stogir.verify.structure+0x64c>
     b24:      	ldr	x7, [sp, #0x50]
     b28:      	mov	x10, #0x25              ; =37
     b2c:      	b	0x7f4 <_stogir.verify.structure+0x654>
     b30:      	ldr	w0, [sp, #0xd8]
     b34:      	bl	0xb34 <_stogir.verify.structure+0x994>
		0000000000000b34:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
     b38:      	lsr	w0, w0, #0
     b3c:      	sxtw	x0, w0
     b40:      	cmn	x0, #0x1
     b44:      	b.ne	0x9c4 <_stogir.verify.structure+0x824>
     b48:      	add	x16, sp, #0x20
     b4c:      	ldr	w0, [x16]
     b50:      	ubfx	x0, x0, #16, #16
     b54:      	cmp	x24, x0
     b58:      	b.eq	0x9c4 <_stogir.verify.structure+0x824>
     b5c:      	ldr	x0, [sp, #0x88]
     b60:      	mov	x1, #0x24               ; =36
     b64:      	b	0x9cc <_stogir.verify.structure+0x82c>
     b68:      	mov	x0, #0x1                ; =1
     b6c:      	cmp	x0, #0x0
     b70:      	b.eq	0x5a4 <_stogir.verify.structure+0x404>
     b74:      	ldr	x0, [sp, #0x60]
     b78:      	mov	x1, #0x1a               ; =26
     b7c:      	b	0x5ac <_stogir.verify.structure+0x40c>
     b80:      	movz	x0, #0x0, lsl #48
     b84:      	ldr	x1, [sp, #0x140]
     b88:      	cmp	x0, #0x0
     b8c:      	b.eq	0xb68 <_stogir.verify.structure+0x9c8>
     b90:      	movz	x0, #0x0, lsl #48
     b94:      	b	0xb6c <_stogir.verify.structure+0x9cc>
     b98:      	movz	x2, #0x0, lsl #48
     b9c:      	mov	x4, x10
     ba0:      	cmp	x2, #0x0
     ba4:      	b.eq	0xbc8 <_stogir.verify.structure+0xa28>
     ba8:      	str	x11, [sp, #0xe8]
     bac:      	str	x20, [sp, #0xe0]
     bb0:      	str	x1, [sp, #0xd0]
     bb4:      	str	x3, [sp, #0xc8]
     bb8:      	str	x9, [sp, #0x138]
     bbc:      	mov	x1, x4
     bc0:      	mov	x0, #0x1                ; =1
     bc4:      	b	0xb88 <_stogir.verify.structure+0x9e8>
     bc8:      	cmp	x0, #0x0
     bcc:      	b.ne	0xe30 <_stogir.verify.structure+0xc90>
     bd0:      	add	x16, sp, #0x20
     bd4:      	ldr	w0, [x16]
     bd8:      	str	x11, [sp, #0xe8]
     bdc:      	str	x9, [sp, #0x138]
     be0:      	str	x1, [sp, #0xd0]
     be4:      	mov	w1, w24
     be8:      	str	x3, [sp, #0xc8]
     bec:      	str	x4, [sp, #0x140]
     bf0:      	str	x20, [sp, #0xe0]
     bf4:      	mov	w20, w0
     bf8:      	ldr	w0, [sp, #0xd8]
     bfc:      	bl	0xbfc <_stogir.verify.structure+0xa5c>
		0000000000000bfc:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
     c00:      	lsr	w0, w0, #0
     c04:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000c04:  ARM64_RELOC_PAGE21	l_stogir.314
     c08:      	ldr	x16, [x16]
		0000000000000c08:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     c0c:      	ldr	w1, [x16]
     c10:      	cmp	x0, x1
     c14:      	b.ne	0xcf8 <_stogir.verify.structure+0xb58>
     c18:      	mov	x0, #0x1                ; =1
     c1c:      	b	0xc8c <_stogir.verify.structure+0xaec>
     c20:      	uxtb	w16, w3
     c24:      	cmp	w16, wzr
     c28:      	b.eq	0xe4c <_stogir.verify.structure+0xcac>
     c2c:      	ldr	x1, [x22, #0x8]
     c30:      	cmp	x0, x1
     c34:      	b.ge	0xe54 <_stogir.verify.structure+0xcb4>
     c38:      	ldr	x20, [sp, #0xe0]
     c3c:      	ldr	x1, [x20, #0x8]
     c40:      	cmp	x0, x1
     c44:      	b.ge	0xd1c <_stogir.verify.structure+0xb7c>
     c48:      	ldr	x1, [x22, #0x78]
     c4c:      	add	x1, x4, x1
     c50:      	ldr	w1, [x1]
     c54:      	sxtw	x1, w1
     c58:      	cmp	x1, #0x0
     c5c:      	cset	w1, ge
     c60:      	ubfx	x1, x1, #0, #8
     c64:      	b	0xd20 <_stogir.verify.structure+0xb80>
     c68:      	mov	x1, x9
     c6c:      	b	0x824 <_stogir.verify.structure+0x684>
     c70:      	movz	x1, #0x0, lsl #48
     c74:      	b	0x82c <_stogir.verify.structure+0x68c>
     c78:      	movz	x9, #0x0, lsl #48
     c7c:      	b	0xac0 <_stogir.verify.structure+0x920>
     c80:      	movz	x9, #0x0, lsl #48
     c84:      	b	0xab8 <_stogir.verify.structure+0x918>
     c88:      	movz	x0, #0x0, lsl #48
     c8c:      	b	0xb84 <_stogir.verify.structure+0x9e4>
     c90:      	movz	x1, #0x0, lsl #48
     c94:      	ldr	x3, [sp, #0xc8]
     c98:      	mov	x2, x1
     c9c:      	ldr	x1, [sp, #0xd0]
     ca0:      	b	0xb9c <_stogir.verify.structure+0x9fc>
     ca4:      	uxtb	w16, w5
     ca8:      	cmp	w16, wzr
     cac:      	b.eq	0xe5c <_stogir.verify.structure+0xcbc>
     cb0:      	ldr	x1, [sp, #0xd0]
     cb4:      	ldr	x2, [x1, #0x8]
     cb8:      	ldr	x3, [sp, #0xc8]
     cbc:      	ldr	x4, [x3, #0x8]
     cc0:      	cmp	x2, x4
     cc4:      	b.ne	0xd14 <_stogir.verify.structure+0xb74>
     cc8:      	cmp	x6, x2
     ccc:      	b.gt	0xd48 <_stogir.verify.structure+0xba8>
     cd0:      	ldr	x2, [x22, #0x50]
     cd4:      	add	x2, x8, x2
     cd8:      	ldr	w2, [x2]
     cdc:      	sxtw	x2, w2
     ce0:      	cmp	x2, #0x0
     ce4:      	cset	w2, gt
     ce8:      	ubfx	x2, x2, #0, #8
     cec:      	b	0xd4c <_stogir.verify.structure+0xbac>
     cf0:      	movz	x9, #0x0, lsl #48
     cf4:      	b	0xc7c <_stogir.verify.structure+0xadc>
     cf8:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000cf8:  ARM64_RELOC_PAGE21	l_stogir.315
     cfc:      	ldr	x16, [x16]
		0000000000000cfc:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     d00:      	ldr	w1, [x16]
     d04:      	cmp	x0, x1
     d08:      	b.ne	0xd2c <_stogir.verify.structure+0xb8c>
     d0c:      	mov	x0, #0x1                ; =1
     d10:      	b	0xc8c <_stogir.verify.structure+0xaec>
     d14:      	movz	x2, #0x0, lsl #48
     d18:      	b	0xb9c <_stogir.verify.structure+0x9fc>
     d1c:      	movz	x1, #0x0, lsl #48
     d20:      	b	0xc94 <_stogir.verify.structure+0xaf4>
     d24:      	brk	#0
     d28:      	b	0xd24 <_stogir.verify.structure+0xb84>
     d2c:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000d2c:  ARM64_RELOC_PAGE21	l_stogir.316
     d30:      	ldr	x16, [x16]
		0000000000000d30:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     d34:      	ldr	w1, [x16]
     d38:      	cmp	x0, x1
     d3c:      	b.ne	0xd50 <_stogir.verify.structure+0xbb0>
     d40:      	mov	x0, #0x1                ; =1
     d44:      	b	0xc8c <_stogir.verify.structure+0xaec>
     d48:      	movz	x2, #0x0, lsl #48
     d4c:      	b	0xd18 <_stogir.verify.structure+0xb78>
     d50:      	uxtb	w16, w23
     d54:      	cmp	w16, wzr
     d58:      	b.eq	0xc88 <_stogir.verify.structure+0xae8>
     d5c:      	ubfx	x0, x20, #8, #8
     d60:      	cmp	x0, #0x0
     d64:      	b.ne	0xd7c <_stogir.verify.structure+0xbdc>
     d68:      	sxtw	x24, w24
     d6c:      	cmp	x24, #0x2
     d70:      	cset	w0, eq
     d74:      	ubfx	x0, x0, #0, #8
     d78:      	b	0xd80 <_stogir.verify.structure+0xbe0>
     d7c:      	movz	x0, #0x0, lsl #48
     d80:      	b	0xc8c <_stogir.verify.structure+0xaec>
     d84:      	brk	#0
     d88:      	b	0xd84 <_stogir.verify.structure+0xbe4>
     d8c:      	ldr	x19, [sp, #0xb0]
     d90:      	b	0x4b8 <_stogir.verify.structure+0x318>
     d94:      	ldr	x19, [sp, #0xb0]
     d98:      	b	0x4b8 <_stogir.verify.structure+0x318>
     d9c:      	str	x19, [sp, #0xe8]
     da0:      	ldr	x19, [sp, #0xb0]
     da4:      	str	x20, [sp, #0xe0]
     da8:      	str	x23, [sp, #0xd0]
     dac:      	str	x24, [sp, #0xc8]
     db0:      	b	0x2e4 <_stogir.verify.structure+0x144>
     db4:      	str	x19, [sp, #0xe8]
     db8:      	ldr	x19, [sp, #0xb0]
     dbc:      	str	x20, [sp, #0xe0]
     dc0:      	b	0x2b8 <_stogir.verify.structure+0x118>
     dc4:      	str	x19, [sp, #0xe8]
     dc8:      	ldr	x19, [sp, #0xb0]
     dcc:      	str	x20, [sp, #0xe0]
     dd0:      	b	0x2b8 <_stogir.verify.structure+0x118>
     dd4:      	str	x11, [sp, #0xe8]
     dd8:      	str	x9, [sp, #0x138]
     ddc:      	b	0x5b0 <_stogir.verify.structure+0x410>
     de0:      	str	x20, [sp, #0x130]
     de4:      	str	x1, [sp, #0x118]
     de8:      	str	x2, [sp, #0x120]
     dec:      	b	0x53c <_stogir.verify.structure+0x39c>
     df0:      	str	w19, [sp, #0x100]
     df4:      	mov	x19, x0
     df8:      	str	x1, [sp, #0x108]
     dfc:      	str	x2, [sp, #0x110]
     e00:      	b	0x600 <_stogir.verify.structure+0x460>
     e04:      	ldr	x11, [sp, #0xe8]
     e08:      	b	0x868 <_stogir.verify.structure+0x6c8>
     e0c:      	str	x19, [sp, #0xe8]
     e10:      	mov	x19, x0
     e14:      	str	x20, [sp, #0xe0]
     e18:      	mov	x20, x2
     e1c:      	str	x1, [sp, #0xf0]
     e20:      	str	x3, [sp, #0xf8]
     e24:      	b	0x928 <_stogir.verify.structure+0x788>
     e28:      	ldr	x11, [sp, #0xe8]
     e2c:      	b	0xc68 <_stogir.verify.structure+0xac8>
     e30:      	str	x11, [sp, #0xe8]
     e34:      	str	x20, [sp, #0xe0]
     e38:      	str	x1, [sp, #0xd0]
     e3c:      	str	x3, [sp, #0xc8]
     e40:      	str	x4, [sp, #0x140]
     e44:      	str	x9, [sp, #0x138]
     e48:      	b	0xb80 <_stogir.verify.structure+0x9e0>
     e4c:      	ldr	x20, [sp, #0xe0]
     e50:      	b	0xca4 <_stogir.verify.structure+0xb04>
     e54:      	ldr	x20, [sp, #0xe0]
     e58:      	b	0xc90 <_stogir.verify.structure+0xaf0>
     e5c:      	ldr	x1, [sp, #0xd0]
     e60:      	ldr	x3, [sp, #0xc8]
     e64:      	b	0xb98 <_stogir.verify.structure+0x9f8>

0000000000000e68 <_stogir.verify.integer-operations-target-structured>:
     e68:      	sub	sp, sp, #0x4d0
     e6c:      	str	x29, [sp, #0x10]
     e70:      	str	x30, [sp, #0x18]
     e74:      	add	x29, sp, #0x10
     e78:      	str	x19, [sp, #0x480]
     e7c:      	str	x20, [sp, #0x488]
     e80:      	str	x21, [sp, #0x490]
     e84:      	str	x22, [sp, #0x498]
     e88:      	str	x23, [sp, #0x4a0]
     e8c:      	str	x24, [sp, #0x4a8]
     e90:      	str	x25, [sp, #0x4b0]
     e94:      	str	x26, [sp, #0x4b8]
     e98:      	str	x27, [sp, #0x4c0]
     e9c:      	str	x28, [sp, #0x4c8]
     ea0:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ea0:  ARM64_RELOC_PAGE21	l_stogir.317
     ea4:      	ldr	x16, [x16]
		0000000000000ea4:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     ea8:      	orr	x2, x16, xzr
     eac:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000eac:  ARM64_RELOC_PAGE21	l_stogir.318
     eb0:      	ldr	x16, [x16]
		0000000000000eb0:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     eb4:      	orr	x19, x16, xzr
     eb8:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000eb8:  ARM64_RELOC_PAGE21	l_stogir.319
     ebc:      	ldr	x16, [x16]
		0000000000000ebc:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     ec0:      	orr	x20, x16, xzr
     ec4:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ec4:  ARM64_RELOC_PAGE21	l_stogir.320
     ec8:      	ldr	x16, [x16]
		0000000000000ec8:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     ecc:      	orr	x21, x16, xzr
     ed0:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ed0:  ARM64_RELOC_PAGE21	l_stogir.321
     ed4:      	ldr	x16, [x16]
		0000000000000ed4:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     ed8:      	orr	x22, x16, xzr
     edc:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000edc:  ARM64_RELOC_PAGE21	l_stogir.322
     ee0:      	ldr	x16, [x16]
		0000000000000ee0:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     ee4:      	orr	x23, x16, xzr
     ee8:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ee8:  ARM64_RELOC_PAGE21	l_stogir.323
     eec:      	ldr	x16, [x16]
		0000000000000eec:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     ef0:      	orr	x24, x16, xzr
     ef4:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ef4:  ARM64_RELOC_PAGE21	l_stogir.324
     ef8:      	ldr	x16, [x16]
		0000000000000ef8:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     efc:      	orr	x25, x16, xzr
     f00:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000f00:  ARM64_RELOC_PAGE21	l_stogir.325
     f04:      	ldr	x16, [x16]
		0000000000000f04:  ARM64_RELOC_PAGEOFF12	l_stogir.325
     f08:      	orr	x26, x16, xzr
     f0c:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000f0c:  ARM64_RELOC_PAGE21	l_stogir.326
     f10:      	ldr	x16, [x16]
		0000000000000f10:  ARM64_RELOC_PAGEOFF12	l_stogir.326
     f14:      	orr	x27, x16, xzr
     f18:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000f18:  ARM64_RELOC_PAGE21	l_stogir.327
     f1c:      	ldr	x16, [x16]
		0000000000000f1c:  ARM64_RELOC_PAGEOFF12	l_stogir.327
     f20:      	orr	x28, x16, xzr
     f24:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000f24:  ARM64_RELOC_PAGE21	l_stogir.328
     f28:      	ldr	x16, [x16]
		0000000000000f28:  ARM64_RELOC_PAGEOFF12	l_stogir.328
     f2c:      	orr	x3, x16, xzr
     f30:      	lsr	w4, w1, #0
     f34:      	lsr	w5, w1, #0
     f38:      	lsr	w1, w1, #0
     f3c:      	add	x16, sp, #0x20
     f40:      	orr	x6, x16, xzr
     f44:      	add	x16, sp, #0x30
     f48:      	orr	x7, x16, xzr
     f4c:      	add	x7, x7, #0x8
     f50:      	add	x16, sp, #0x50
     f54:      	orr	x9, x16, xzr
     f58:      	add	x9, x9, #0x8
     f5c:      	add	x16, sp, #0x70
     f60:      	orr	x10, x16, xzr
     f64:      	add	x10, x10, #0x8
     f68:      	add	x16, sp, #0xd0
     f6c:      	orr	x11, x16, xzr
     f70:      	add	x11, x11, #0x8
     f74:      	add	x16, sp, #0x110
     f78:      	orr	x12, x16, xzr
     f7c:      	add	x12, x12, #0x8
     f80:      	add	x16, sp, #0x130
     f84:      	orr	x13, x16, xzr
     f88:      	add	x13, x13, #0x8
     f8c:      	add	x16, sp, #0x150
     f90:      	orr	x14, x16, xzr
     f94:      	add	x14, x14, #0x8
     f98:      	add	x16, sp, #0x170
     f9c:      	orr	x15, x16, xzr
     fa0:      	add	x15, x15, #0x8
     fa4:      	str	w1, [sp, #0x280]
     fa8:      	add	x16, sp, #0x190
     fac:      	orr	x1, x16, xzr
     fb0:      	add	x1, x1, #0x8
     fb4:      	str	x1, [sp, #0x288]
     fb8:      	add	x16, sp, #0x1b0
     fbc:      	orr	x1, x16, xzr
     fc0:      	add	x1, x1, #0x8
     fc4:      	str	x1, [sp, #0x290]
     fc8:      	add	x16, sp, #0x1d0
     fcc:      	orr	x1, x16, xzr
     fd0:      	add	x1, x1, #0x8
     fd4:      	str	x1, [sp, #0x298]
     fd8:      	add	x16, sp, #0x220
     fdc:      	orr	x1, x16, xzr
     fe0:      	add	x1, x1, #0x8
     fe4:      	str	x19, [sp, #0x2a0]
     fe8:      	str	x20, [sp, #0x2b0]
     fec:      	str	x2, [sp, #0x2a8]
     ff0:      	mov	x2, #0x1                ; =1
     ff4:      	movz	x19, #0x0, lsl #48
     ff8:      	movz	x20, #0x0, lsl #48
     ffc:      	str	x1, [sp, #0x2b8]
    1000:      	cmp	x20, #0x0
    1004:      	cset	w1, eq
    1008:      	uxtb	w16, w1
    100c:      	cmp	w16, wzr
    1010:      	b.eq	0x2510 <_stogir.verify.integer-operations-target-structured+0x16a8>
    1014:      	str	x3, [sp, #0x2c0]
    1018:      	ldr	x3, [x0, #0x8]
    101c:      	cmp	x2, x3
    1020:      	b.ge	0x251c <_stogir.verify.integer-operations-target-structured+0x16b4>
    1024:      	lsl	x1, x2, #4
    1028:      	lsl	x3, x2, #2
    102c:      	str	w4, [sp, #0x2c8]
    1030:      	ldr	x4, [x0]
    1034:      	add	x1, x1, x4
    1038:      	ldr	x4, [x1]
    103c:      	str	x20, [sp, #0x2d0]
    1040:      	uxtb	w20, w4
    1044:      	ldr	x1, [x1, #0x8]
    1048:      	str	x21, [sp, #0x2d8]
    104c:      	orr	x21, x20, xzr
    1050:      	add	x16, sp, #0x20
    1054:      	str	x4, [x16]
    1058:      	add	x16, sp, #0x20
    105c:      	str	x1, [x16, #0x8]
    1060:      	ldr	x1, [x0, #0x78]
    1064:      	add	x1, x3, x1
    1068:      	ldr	w1, [x1]
    106c:      	cmp	x21, #0xe
    1070:      	b.lt	0x1aa0 <_stogir.verify.integer-operations-target-structured+0xc38>
    1074:      	cmp	x21, #0x17
    1078:      	cset	w3, le
    107c:      	ubfx	x3, x3, #0, #8
    1080:      	cmp	x21, #0x1a
    1084:      	b.lt	0x1aa8 <_stogir.verify.integer-operations-target-structured+0xc40>
    1088:      	cmp	x21, #0x1e
    108c:      	b.gt	0x1aa8 <_stogir.verify.integer-operations-target-structured+0xc40>
    1090:      	mov	x4, #0x1                ; =1
    1094:      	cmp	x21, #0x1f
    1098:      	b.ne	0x1ae0 <_stogir.verify.integer-operations-target-structured+0xc78>
    109c:      	str	x0, [sp, #0x2e0]
    10a0:      	mov	x0, #0x1                ; =1
    10a4:      	str	x0, [sp, #0x2e8]
    10a8:      	lsr	w0, w2, #0
    10ac:      	lsr	w1, w1, #0
    10b0:      	lsr	w0, w0, #0
    10b4:      	str	x8, [sp, #0x338]
    10b8:      	str	w5, [sp, #0x300]
    10bc:      	str	x6, [sp, #0x308]
    10c0:      	str	x15, [sp, #0x348]
    10c4:      	str	x2, [sp, #0x350]
    10c8:      	mov	x2, x6
    10cc:      	str	w1, [sp, #0x358]
    10d0:      	str	x3, [sp, #0x360]
    10d4:      	mov	w3, w1
    10d8:      	mov	w1, w0
    10dc:      	str	x4, [sp, #0x368]
    10e0:      	str	w0, [sp, #0x370]
    10e4:      	ldr	x0, [sp, #0x2e0]
    10e8:      	str	x22, [sp, #0x2f0]
    10ec:      	mov	x22, x13
    10f0:      	str	x23, [sp, #0x2f8]
    10f4:      	ldr	x23, [sp, #0x2c0]
    10f8:      	str	x24, [sp, #0x310]
    10fc:      	mov	x24, x7
    1100:      	str	x25, [sp, #0x318]
    1104:      	mov	x25, x9
    1108:      	str	x26, [sp, #0x320]
    110c:      	mov	x26, x10
    1110:      	str	x27, [sp, #0x328]
    1114:      	mov	x27, x11
    1118:      	str	x28, [sp, #0x330]
    111c:      	mov	x28, x12
    1120:      	str	w20, [sp, #0x340]
    1124:      	mov	x20, x14
    1128:      	bl	0x1128 <_stogir.verify.integer-operations-target-structured+0x2c0>
		0000000000001128:  ARM64_RELOC_BRANCH26	_stogir.verify.classifications
    112c:      	uxtb	w1, w0
    1130:      	cmp	x1, #0x0
    1134:      	cset	w1, ne
    1138:      	cmp	x21, #0x3d
    113c:      	b.lt	0x1b58 <_stogir.verify.integer-operations-target-structured+0xcf0>
    1140:      	cmp	x21, #0x3f
    1144:      	b.gt	0x1b58 <_stogir.verify.integer-operations-target-structured+0xcf0>
    1148:      	add	x8, sp, #0x30
    114c:      	ldr	w2, [sp, #0x2c8]
    1150:      	str	x0, [sp, #0x378]
    1154:      	ldr	x0, [sp, #0x2e0]
    1158:      	str	x20, [sp, #0x380]
    115c:      	mov	w20, w1
    1160:      	ldr	w1, [sp, #0x370]
    1164:      	bl	0x1164 <_stogir.verify.integer-operations-target-structured+0x2fc>
		0000000000001164:  ARM64_RELOC_BRANCH26	_stogir.vector.validate
    1168:      	add	x16, sp, #0x30
    116c:      	ldr	w0, [x16]
    1170:      	lsr	x16, x0, #0
    1174:      	cmp	x16, #0x1
    1178:      	b.eq	0x1194 <_stogir.verify.integer-operations-target-structured+0x32c>
    117c:      	b.lo	0x1184 <_stogir.verify.integer-operations-target-structured+0x31c>
    1180:      	b	0x1198 <_stogir.verify.integer-operations-target-structured+0x330>
    1184:      	cmp	x16, #0x0
    1188:      	b.eq	0x1190 <_stogir.verify.integer-operations-target-structured+0x328>
    118c:      	b	0x1198 <_stogir.verify.integer-operations-target-structured+0x330>
    1190:      	b	0x1b7c <_stogir.verify.integer-operations-target-structured+0xd14>
    1194:      	b	0x119c <_stogir.verify.integer-operations-target-structured+0x334>
    1198:      	b	0x2494 <_stogir.verify.integer-operations-target-structured+0x162c>
    119c:      	add	x16, sp, #0x30
    11a0:      	ldr	x0, [x16, #0x8]
    11a4:      	ldr	x1, [x24, #0x8]
    11a8:      	mov	x2, x1
    11ac:      	mov	x1, x0
    11b0:      	mov	x0, x19
    11b4:      	mov	x19, x0
    11b8:      	mov	x0, x1
    11bc:      	mov	x1, x2
    11c0:      	cmp	x21, #0x44
    11c4:      	b.ne	0x1ba4 <_stogir.verify.integer-operations-target-structured+0xd3c>
    11c8:      	uxtb	w16, w20
    11cc:      	cmp	w16, wzr
    11d0:      	b.eq	0x1b94 <_stogir.verify.integer-operations-target-structured+0xd2c>
    11d4:      	mov	x2, x1
    11d8:      	mov	x1, x0
    11dc:      	movz	x0, #0x0, lsl #48
    11e0:      	cmp	x0, #0x0
    11e4:      	b.eq	0x2528 <_stogir.verify.integer-operations-target-structured+0x16c0>
    11e8:      	add	x8, sp, #0x50
    11ec:      	ldr	x0, [sp, #0x2e0]
    11f0:      	str	x1, [sp, #0x388]
    11f4:      	ldr	w1, [sp, #0x370]
    11f8:      	str	x2, [sp, #0x390]
    11fc:      	bl	0x11fc <_stogir.verify.integer-operations-target-structured+0x394>
		00000000000011fc:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    1200:      	add	x16, sp, #0x50
    1204:      	ldr	w0, [x16]
    1208:      	lsr	x16, x0, #0
    120c:      	cmp	x16, #0x1
    1210:      	b.eq	0x122c <_stogir.verify.integer-operations-target-structured+0x3c4>
    1214:      	b.lo	0x121c <_stogir.verify.integer-operations-target-structured+0x3b4>
    1218:      	b	0x1230 <_stogir.verify.integer-operations-target-structured+0x3c8>
    121c:      	cmp	x16, #0x0
    1220:      	b.eq	0x1228 <_stogir.verify.integer-operations-target-structured+0x3c0>
    1224:      	b	0x1230 <_stogir.verify.integer-operations-target-structured+0x3c8>
    1228:      	b	0x1bb4 <_stogir.verify.integer-operations-target-structured+0xd4c>
    122c:      	b	0x1234 <_stogir.verify.integer-operations-target-structured+0x3cc>
    1230:      	b	0x1bcc <_stogir.verify.integer-operations-target-structured+0xd64>
    1234:      	add	x16, sp, #0x50
    1238:      	ldr	x0, [x16, #0x8]
    123c:      	ldr	x1, [x25, #0x8]
    1240:      	mov	x2, x1
    1244:      	mov	x1, x0
    1248:      	mov	x0, x19
    124c:      	mov	x19, x0
    1250:      	mov	x0, x1
    1254:      	mov	x1, x2
    1258:      	cmp	x21, #0x1d
    125c:      	b.ne	0x1be0 <_stogir.verify.integer-operations-target-structured+0xd78>
    1260:      	mov	x2, x1
    1264:      	mov	x1, x0
    1268:      	mov	x0, #0x1                ; =1
    126c:      	cmp	x0, #0x0
    1270:      	b.eq	0x1c08 <_stogir.verify.integer-operations-target-structured+0xda0>
    1274:      	add	x16, sp, #0x20
    1278:      	ldr	w0, [x16, #0xc]
    127c:      	sxtw	x0, w0
    1280:      	cmp	x0, #0x0
    1284:      	b.ne	0x1c00 <_stogir.verify.integer-operations-target-structured+0xd98>
    1288:      	movz	x0, #0x0, lsl #48
    128c:      	cmp	x0, #0x0
    1290:      	b.eq	0x2534 <_stogir.verify.integer-operations-target-structured+0x16cc>
    1294:      	add	x16, sp, #0x20
    1298:      	ldr	w0, [x16, #0xc]
    129c:      	lsr	w0, w0, #0
    12a0:      	add	x8, sp, #0x70
    12a4:      	str	x1, [sp, #0x398]
    12a8:      	mov	w1, w0
    12ac:      	ldr	x0, [sp, #0x2e0]
    12b0:      	str	x2, [sp, #0x3a0]
    12b4:      	bl	0x12b4 <_stogir.verify.integer-operations-target-structured+0x44c>
		00000000000012b4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    12b8:      	add	x16, sp, #0x70
    12bc:      	ldr	w0, [x16]
    12c0:      	lsr	x16, x0, #0
    12c4:      	cmp	x16, #0x1
    12c8:      	b.eq	0x12e4 <_stogir.verify.integer-operations-target-structured+0x47c>
    12cc:      	b.lo	0x12d4 <_stogir.verify.integer-operations-target-structured+0x46c>
    12d0:      	b	0x12e8 <_stogir.verify.integer-operations-target-structured+0x480>
    12d4:      	cmp	x16, #0x0
    12d8:      	b.eq	0x12e0 <_stogir.verify.integer-operations-target-structured+0x478>
    12dc:      	b	0x12e8 <_stogir.verify.integer-operations-target-structured+0x480>
    12e0:      	b	0x12ec <_stogir.verify.integer-operations-target-structured+0x484>
    12e4:      	b	0x1c10 <_stogir.verify.integer-operations-target-structured+0xda8>
    12e8:      	b	0x1cec <_stogir.verify.integer-operations-target-structured+0xe84>
    12ec:      	ldr	x0, [sp, #0x2a0]
    12f0:      	mov	x1, #0x16               ; =22
    12f4:      	cmp	x21, #0x29
    12f8:      	b.lt	0x1d00 <_stogir.verify.integer-operations-target-structured+0xe98>
    12fc:      	cmp	x21, #0x2b
    1300:      	cset	w2, le
    1304:      	ubfx	x2, x2, #0, #8
    1308:      	fmov	d31, x0
    130c:      	mov	x0, x2
    1310:      	mov	x2, x1
    1314:      	fmov	x1, d31
    1318:      	cmp	x21, #0x2c
    131c:      	cset	w3, eq
    1320:      	cmp	x0, #0x0
    1324:      	b.eq	0x1d10 <_stogir.verify.integer-operations-target-structured+0xea8>
    1328:      	mov	x0, #0x1                ; =1
    132c:      	cmp	x0, #0x0
    1330:      	b.eq	0x2540 <_stogir.verify.integer-operations-target-structured+0x16d8>
    1334:      	uxtb	w16, w3
    1338:      	cmp	w16, wzr
    133c:      	b.eq	0x254c <_stogir.verify.integer-operations-target-structured+0x16e4>
    1340:      	add	x8, sp, #0xb0
    1344:      	ldr	x0, [sp, #0x2e0]
    1348:      	str	x1, [sp, #0x3a8]
    134c:      	ldr	w1, [sp, #0x370]
    1350:      	str	x2, [sp, #0x3b0]
    1354:      	bl	0x1354 <_stogir.verify.integer-operations-target-structured+0x4ec>
		0000000000001354:  ARM64_RELOC_BRANCH26	_stogir.checked.validate-projection
    1358:      	add	x16, sp, #0xb0
    135c:      	ldr	x0, [x16]
    1360:      	add	x16, sp, #0xd0
    1364:      	str	x0, [x16]
    1368:      	add	x16, sp, #0xb0
    136c:      	ldr	x0, [x16, #0x8]
    1370:      	add	x16, sp, #0xd0
    1374:      	str	x0, [x16, #0x8]
    1378:      	add	x16, sp, #0xb0
    137c:      	ldr	x0, [x16, #0x10]
    1380:      	add	x16, sp, #0xd0
    1384:      	str	x0, [x16, #0x10]
    1388:      	ldr	x0, [sp, #0x3a8]
    138c:      	ldr	x1, [sp, #0x3b0]
    1390:      	add	x16, sp, #0xd0
    1394:      	ldr	w2, [x16]
    1398:      	lsr	x16, x2, #0
    139c:      	cmp	x16, #0x1
    13a0:      	b.eq	0x13bc <_stogir.verify.integer-operations-target-structured+0x554>
    13a4:      	b.lo	0x13ac <_stogir.verify.integer-operations-target-structured+0x544>
    13a8:      	b	0x13c0 <_stogir.verify.integer-operations-target-structured+0x558>
    13ac:      	cmp	x16, #0x0
    13b0:      	b.eq	0x13b8 <_stogir.verify.integer-operations-target-structured+0x550>
    13b4:      	b	0x13c0 <_stogir.verify.integer-operations-target-structured+0x558>
    13b8:      	b	0x1d64 <_stogir.verify.integer-operations-target-structured+0xefc>
    13bc:      	b	0x13c4 <_stogir.verify.integer-operations-target-structured+0x55c>
    13c0:      	b	0x1d84 <_stogir.verify.integer-operations-target-structured+0xf1c>
    13c4:      	add	x16, sp, #0xd0
    13c8:      	ldr	x0, [x16, #0x8]
    13cc:      	ldr	x1, [x27, #0x8]
    13d0:      	mov	x2, x1
    13d4:      	mov	x1, x0
    13d8:      	mov	x0, x19
    13dc:      	mov	x19, x0
    13e0:      	mov	x0, x1
    13e4:      	mov	x1, x2
    13e8:      	cmp	x21, #0x7e
    13ec:      	b.lt	0x1d98 <_stogir.verify.integer-operations-target-structured+0xf30>
    13f0:      	cmp	x21, #0x82
    13f4:      	cset	w2, le
    13f8:      	ubfx	x2, x2, #0, #8
    13fc:      	fmov	d31, x0
    1400:      	mov	x0, x2
    1404:      	mov	x2, x1
    1408:      	fmov	x1, d31
    140c:      	cmp	x0, #0x0
    1410:      	b.eq	0x2558 <_stogir.verify.integer-operations-target-structured+0x16f0>
    1414:      	add	x8, sp, #0x110
    1418:      	ldr	x0, [sp, #0x2e0]
    141c:      	str	x1, [sp, #0x3b8]
    1420:      	ldr	w1, [sp, #0x370]
    1424:      	str	x2, [sp, #0x3c0]
    1428:      	bl	0x1428 <_stogir.verify.integer-operations-target-structured+0x5c0>
		0000000000001428:  ARM64_RELOC_BRANCH26	_stogir.atomic.validate
    142c:      	add	x16, sp, #0x110
    1430:      	ldr	w0, [x16]
    1434:      	lsr	x16, x0, #0
    1438:      	cmp	x16, #0x1
    143c:      	b.eq	0x1458 <_stogir.verify.integer-operations-target-structured+0x5f0>
    1440:      	b.lo	0x1448 <_stogir.verify.integer-operations-target-structured+0x5e0>
    1444:      	b	0x145c <_stogir.verify.integer-operations-target-structured+0x5f4>
    1448:      	cmp	x16, #0x0
    144c:      	b.eq	0x1454 <_stogir.verify.integer-operations-target-structured+0x5ec>
    1450:      	b	0x145c <_stogir.verify.integer-operations-target-structured+0x5f4>
    1454:      	b	0x1da8 <_stogir.verify.integer-operations-target-structured+0xf40>
    1458:      	b	0x1460 <_stogir.verify.integer-operations-target-structured+0x5f8>
    145c:      	b	0x1dc0 <_stogir.verify.integer-operations-target-structured+0xf58>
    1460:      	add	x16, sp, #0x110
    1464:      	ldr	x0, [x16, #0x8]
    1468:      	ldr	x1, [x28, #0x8]
    146c:      	mov	x2, x1
    1470:      	mov	x1, x0
    1474:      	mov	x0, x19
    1478:      	mov	x19, x0
    147c:      	mov	x0, x1
    1480:      	mov	x1, x2
    1484:      	cmp	x21, #0x60
    1488:      	b.ne	0x1dd4 <_stogir.verify.integer-operations-target-structured+0xf6c>
    148c:      	mov	x2, x1
    1490:      	mov	x1, x0
    1494:      	mov	x0, #0x1                ; =1
    1498:      	cmp	x0, #0x0
    149c:      	b.eq	0x2564 <_stogir.verify.integer-operations-target-structured+0x16fc>
    14a0:      	add	x8, sp, #0x130
    14a4:      	ldr	x0, [sp, #0x2e0]
    14a8:      	str	x1, [sp, #0x3c8]
    14ac:      	ldr	w1, [sp, #0x370]
    14b0:      	str	x2, [sp, #0x3d0]
    14b4:      	bl	0x14b4 <_stogir.verify.integer-operations-target-structured+0x64c>
		00000000000014b4:  ARM64_RELOC_BRANCH26	_stogir.terminal.validate
    14b8:      	add	x16, sp, #0x130
    14bc:      	ldr	w0, [x16]
    14c0:      	lsr	x16, x0, #0
    14c4:      	cmp	x16, #0x1
    14c8:      	b.eq	0x14e4 <_stogir.verify.integer-operations-target-structured+0x67c>
    14cc:      	b.lo	0x14d4 <_stogir.verify.integer-operations-target-structured+0x66c>
    14d0:      	b	0x14e8 <_stogir.verify.integer-operations-target-structured+0x680>
    14d4:      	cmp	x16, #0x0
    14d8:      	b.eq	0x14e0 <_stogir.verify.integer-operations-target-structured+0x678>
    14dc:      	b	0x14e8 <_stogir.verify.integer-operations-target-structured+0x680>
    14e0:      	b	0x1df4 <_stogir.verify.integer-operations-target-structured+0xf8c>
    14e4:      	b	0x14ec <_stogir.verify.integer-operations-target-structured+0x684>
    14e8:      	b	0x1e0c <_stogir.verify.integer-operations-target-structured+0xfa4>
    14ec:      	add	x16, sp, #0x130
    14f0:      	ldr	x0, [x16, #0x8]
    14f4:      	ldr	x1, [x22, #0x8]
    14f8:      	mov	x2, x1
    14fc:      	mov	x1, x0
    1500:      	mov	x0, x19
    1504:      	mov	x19, x0
    1508:      	mov	x0, x1
    150c:      	mov	x1, x2
    1510:      	cmp	x21, #0x75
    1514:      	b.ne	0x1e20 <_stogir.verify.integer-operations-target-structured+0xfb8>
    1518:      	mov	x2, x1
    151c:      	mov	x1, x0
    1520:      	mov	x0, #0x1                ; =1
    1524:      	cmp	x0, #0x0
    1528:      	b.eq	0x2570 <_stogir.verify.integer-operations-target-structured+0x1708>
    152c:      	add	x8, sp, #0x150
    1530:      	ldr	x0, [sp, #0x2e0]
    1534:      	str	x1, [sp, #0x3d8]
    1538:      	ldr	w1, [sp, #0x370]
    153c:      	str	x2, [sp, #0x3e0]
    1540:      	bl	0x1540 <_stogir.verify.integer-operations-target-structured+0x6d8>
		0000000000001540:  ARM64_RELOC_BRANCH26	_stogir.switch.validate
    1544:      	add	x16, sp, #0x150
    1548:      	ldr	w0, [x16]
    154c:      	lsr	x16, x0, #0
    1550:      	cmp	x16, #0x1
    1554:      	b.eq	0x1574 <_stogir.verify.integer-operations-target-structured+0x70c>
    1558:      	b.lo	0x1560 <_stogir.verify.integer-operations-target-structured+0x6f8>
    155c:      	b	0x1578 <_stogir.verify.integer-operations-target-structured+0x710>
    1560:      	cmp	x16, #0x0
    1564:      	b.eq	0x156c <_stogir.verify.integer-operations-target-structured+0x704>
    1568:      	b	0x1578 <_stogir.verify.integer-operations-target-structured+0x710>
    156c:      	ldr	x1, [sp, #0x380]
    1570:      	b	0x1e50 <_stogir.verify.integer-operations-target-structured+0xfe8>
    1574:      	b	0x157c <_stogir.verify.integer-operations-target-structured+0x714>
    1578:      	b	0x1e68 <_stogir.verify.integer-operations-target-structured+0x1000>
    157c:      	add	x16, sp, #0x150
    1580:      	ldr	x0, [x16, #0x8]
    1584:      	ldr	x1, [sp, #0x380]
    1588:      	ldr	x2, [x1, #0x8]
    158c:      	mov	x3, x2
    1590:      	mov	x2, x0
    1594:      	mov	x0, x19
    1598:      	mov	x19, x0
    159c:      	mov	x0, x2
    15a0:      	mov	x2, x3
    15a4:      	cmp	x21, #0x42
    15a8:      	b.ne	0x1e7c <_stogir.verify.integer-operations-target-structured+0x1014>
    15ac:      	mov	x3, x2
    15b0:      	mov	x2, x0
    15b4:      	mov	x0, #0x1                ; =1
    15b8:      	cmp	x0, #0x0
    15bc:      	b.eq	0x2580 <_stogir.verify.integer-operations-target-structured+0x1718>
    15c0:      	add	x8, sp, #0x170
    15c4:      	ldr	x0, [sp, #0x2e0]
    15c8:      	str	x1, [sp, #0x380]
    15cc:      	ldr	w1, [sp, #0x370]
    15d0:      	str	x2, [sp, #0x3e8]
    15d4:      	str	x3, [sp, #0x3f0]
    15d8:      	bl	0x15d8 <_stogir.verify.integer-operations-target-structured+0x770>
		00000000000015d8:  ARM64_RELOC_BRANCH26	_stogir.stack.validate
    15dc:      	add	x16, sp, #0x170
    15e0:      	ldr	w0, [x16]
    15e4:      	lsr	x16, x0, #0
    15e8:      	cmp	x16, #0x1
    15ec:      	b.eq	0x160c <_stogir.verify.integer-operations-target-structured+0x7a4>
    15f0:      	b.lo	0x15f8 <_stogir.verify.integer-operations-target-structured+0x790>
    15f4:      	b	0x1610 <_stogir.verify.integer-operations-target-structured+0x7a8>
    15f8:      	cmp	x16, #0x0
    15fc:      	b.eq	0x1604 <_stogir.verify.integer-operations-target-structured+0x79c>
    1600:      	b	0x1610 <_stogir.verify.integer-operations-target-structured+0x7a8>
    1604:      	ldr	x1, [sp, #0x348]
    1608:      	b	0x1ecc <_stogir.verify.integer-operations-target-structured+0x1064>
    160c:      	b	0x1614 <_stogir.verify.integer-operations-target-structured+0x7ac>
    1610:      	b	0x1ee4 <_stogir.verify.integer-operations-target-structured+0x107c>
    1614:      	add	x16, sp, #0x170
    1618:      	ldr	x0, [x16, #0x8]
    161c:      	ldr	x1, [sp, #0x348]
    1620:      	ldr	x2, [x1, #0x8]
    1624:      	mov	x3, x2
    1628:      	mov	x2, x0
    162c:      	mov	x0, x19
    1630:      	mov	x19, x0
    1634:      	mov	x0, x2
    1638:      	mov	x2, x3
    163c:      	cmp	x21, #0x41
    1640:      	b.ne	0x1ef8 <_stogir.verify.integer-operations-target-structured+0x1090>
    1644:      	mov	x3, x2
    1648:      	mov	x2, x0
    164c:      	mov	x0, #0x1                ; =1
    1650:      	cmp	x0, #0x0
    1654:      	b.eq	0x2594 <_stogir.verify.integer-operations-target-structured+0x172c>
    1658:      	add	x8, sp, #0x190
    165c:      	ldr	x0, [sp, #0x2e0]
    1660:      	str	x1, [sp, #0x348]
    1664:      	ldr	w1, [sp, #0x370]
    1668:      	str	x2, [sp, #0x3f8]
    166c:      	ldr	w2, [sp, #0x300]
    1670:      	str	x3, [sp, #0x400]
    1674:      	bl	0x1674 <_stogir.verify.integer-operations-target-structured+0x80c>
		0000000000001674:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    1678:      	add	x16, sp, #0x190
    167c:      	ldr	w0, [x16]
    1680:      	lsr	x16, x0, #0
    1684:      	cmp	x16, #0x1
    1688:      	b.eq	0x16a8 <_stogir.verify.integer-operations-target-structured+0x840>
    168c:      	b.lo	0x1694 <_stogir.verify.integer-operations-target-structured+0x82c>
    1690:      	b	0x16ac <_stogir.verify.integer-operations-target-structured+0x844>
    1694:      	cmp	x16, #0x0
    1698:      	b.eq	0x16a0 <_stogir.verify.integer-operations-target-structured+0x838>
    169c:      	b	0x16ac <_stogir.verify.integer-operations-target-structured+0x844>
    16a0:      	ldr	x1, [sp, #0x288]
    16a4:      	b	0x1f38 <_stogir.verify.integer-operations-target-structured+0x10d0>
    16a8:      	b	0x16b0 <_stogir.verify.integer-operations-target-structured+0x848>
    16ac:      	b	0x1f50 <_stogir.verify.integer-operations-target-structured+0x10e8>
    16b0:      	add	x16, sp, #0x190
    16b4:      	ldr	x0, [x16, #0x8]
    16b8:      	ldr	x1, [sp, #0x288]
    16bc:      	ldr	x2, [x1, #0x8]
    16c0:      	mov	x3, x2
    16c4:      	mov	x2, x0
    16c8:      	mov	x0, x19
    16cc:      	mov	x19, x0
    16d0:      	mov	x0, x2
    16d4:      	mov	x2, x3
    16d8:      	cmp	x21, #0x21
    16dc:      	b.lt	0x1f64 <_stogir.verify.integer-operations-target-structured+0x10fc>
    16e0:      	cmp	x21, #0x27
    16e4:      	cset	w3, le
    16e8:      	ubfx	x3, x3, #0, #8
    16ec:      	fmov	d31, x0
    16f0:      	mov	x0, x3
    16f4:      	mov	x3, x2
    16f8:      	fmov	x2, d31
    16fc:      	cmp	x0, #0x0
    1700:      	b.eq	0x25a8 <_stogir.verify.integer-operations-target-structured+0x1740>
    1704:      	add	x8, sp, #0x1b0
    1708:      	ldr	x0, [sp, #0x2e0]
    170c:      	str	x1, [sp, #0x288]
    1710:      	ldr	w1, [sp, #0x370]
    1714:      	str	x2, [sp, #0x408]
    1718:      	ldr	w2, [sp, #0x280]
    171c:      	str	x3, [sp, #0x410]
    1720:      	bl	0x1720 <_stogir.verify.integer-operations-target-structured+0x8b8>
		0000000000001720:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    1724:      	add	x16, sp, #0x1b0
    1728:      	ldr	w0, [x16]
    172c:      	lsr	x16, x0, #0
    1730:      	cmp	x16, #0x1
    1734:      	b.eq	0x1754 <_stogir.verify.integer-operations-target-structured+0x8ec>
    1738:      	b.lo	0x1740 <_stogir.verify.integer-operations-target-structured+0x8d8>
    173c:      	b	0x1758 <_stogir.verify.integer-operations-target-structured+0x8f0>
    1740:      	cmp	x16, #0x0
    1744:      	b.eq	0x174c <_stogir.verify.integer-operations-target-structured+0x8e4>
    1748:      	b	0x1758 <_stogir.verify.integer-operations-target-structured+0x8f0>
    174c:      	ldr	x1, [sp, #0x290]
    1750:      	b	0x1f74 <_stogir.verify.integer-operations-target-structured+0x110c>
    1754:      	b	0x175c <_stogir.verify.integer-operations-target-structured+0x8f4>
    1758:      	b	0x1f8c <_stogir.verify.integer-operations-target-structured+0x1124>
    175c:      	add	x16, sp, #0x1b0
    1760:      	ldr	x0, [x16, #0x8]
    1764:      	ldr	x1, [sp, #0x290]
    1768:      	ldr	x2, [x1, #0x8]
    176c:      	mov	x3, x2
    1770:      	mov	x2, x0
    1774:      	mov	x0, x19
    1778:      	mov	x19, x0
    177c:      	mov	x0, x2
    1780:      	mov	x2, x3
    1784:      	cmp	x21, #0x3c
    1788:      	b.ne	0x25bc <_stogir.verify.integer-operations-target-structured+0x1754>
    178c:      	add	x8, sp, #0x1d0
    1790:      	str	x1, [sp, #0x290]
    1794:      	ldr	w1, [sp, #0x370]
    1798:      	str	x0, [sp, #0x418]
    179c:      	ldr	x0, [sp, #0x2e0]
    17a0:      	str	x2, [sp, #0x420]
    17a4:      	bl	0x17a4 <_stogir.verify.integer-operations-target-structured+0x93c>
		00000000000017a4:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    17a8:      	add	x16, sp, #0x1d0
    17ac:      	ldr	w0, [x16]
    17b0:      	lsr	x16, x0, #0
    17b4:      	cmp	x16, #0x1
    17b8:      	b.eq	0x17d8 <_stogir.verify.integer-operations-target-structured+0x970>
    17bc:      	b.lo	0x17c4 <_stogir.verify.integer-operations-target-structured+0x95c>
    17c0:      	b	0x17dc <_stogir.verify.integer-operations-target-structured+0x974>
    17c4:      	cmp	x16, #0x0
    17c8:      	b.eq	0x17d0 <_stogir.verify.integer-operations-target-structured+0x968>
    17cc:      	b	0x17dc <_stogir.verify.integer-operations-target-structured+0x974>
    17d0:      	ldr	x1, [sp, #0x298]
    17d4:      	b	0x1fa0 <_stogir.verify.integer-operations-target-structured+0x1138>
    17d8:      	b	0x17e0 <_stogir.verify.integer-operations-target-structured+0x978>
    17dc:      	b	0x1fb8 <_stogir.verify.integer-operations-target-structured+0x1150>
    17e0:      	add	x16, sp, #0x1d0
    17e4:      	ldr	x0, [x16, #0x8]
    17e8:      	ldr	x1, [sp, #0x298]
    17ec:      	ldr	x2, [x1, #0x8]
    17f0:      	mov	x3, x2
    17f4:      	mov	x2, x0
    17f8:      	mov	x0, x19
    17fc:      	mov	x19, x0
    1800:      	mov	x0, x2
    1804:      	mov	x2, x3
    1808:      	cmp	x21, #0x78
    180c:      	b.ne	0x25d0 <_stogir.verify.integer-operations-target-structured+0x1768>
    1810:      	add	x16, sp, #0x20
    1814:      	ldr	w3, [x16]
    1818:      	ubfx	x3, x3, #8, #8
    181c:      	cmp	x3, #0x0
    1820:      	b.ne	0x1fe8 <_stogir.verify.integer-operations-target-structured+0x1180>
    1824:      	add	x16, sp, #0x20
    1828:      	ldr	w3, [x16, #0x8]
    182c:      	sxtw	x3, w3
    1830:      	cmp	x3, #0x0
    1834:      	b.ne	0x1fcc <_stogir.verify.integer-operations-target-structured+0x1164>
    1838:      	mov	x3, x2
    183c:      	mov	x2, x0
    1840:      	movz	x0, #0x0, lsl #48
    1844:      	cmp	x0, #0x0
    1848:      	b.eq	0x1fdc <_stogir.verify.integer-operations-target-structured+0x1174>
    184c:      	ldr	x0, [sp, #0x2d8]
    1850:      	mov	x2, #0x1f               ; =31
    1854:      	str	x1, [sp, #0x298]
    1858:      	mov	x1, x2
    185c:      	add	x2, x19, #0x1
    1860:      	lsr	w2, w2, #0
    1864:      	sxtw	x2, w2
    1868:      	mov	x19, x2
    186c:      	ldr	x2, [sp, #0x378]
    1870:      	uxth	w2, w2
    1874:      	mov	w17, #0x8               ; =8
    1878:      	uxth	w16, w2
    187c:      	ubfx	w17, w17, #0, #4
    1880:      	lsr	w2, w16, w17
    1884:      	uxth	w2, w2
    1888:      	uxtb	w2, w2
    188c:      	cmp	x2, #0x0
    1890:      	b.eq	0x25e0 <_stogir.verify.integer-operations-target-structured+0x1778>
    1894:      	add	x8, sp, #0x220
    1898:      	str	x0, [sp, #0x438]
    189c:      	ldr	x0, [sp, #0x2e0]
    18a0:      	str	x1, [sp, #0x440]
    18a4:      	ldr	w1, [sp, #0x370]
    18a8:      	str	x22, [sp, #0x448]
    18ac:      	mov	x22, x2
    18b0:      	bl	0x18b0 <_stogir.verify.integer-operations-target-structured+0xa48>
		00000000000018b0:  ARM64_RELOC_BRANCH26	_stogir.floating.validate
    18b4:      	add	x16, sp, #0x220
    18b8:      	ldr	w0, [x16]
    18bc:      	lsr	x16, x0, #0
    18c0:      	cmp	x16, #0x1
    18c4:      	b.eq	0x18e4 <_stogir.verify.integer-operations-target-structured+0xa7c>
    18c8:      	b.lo	0x18d0 <_stogir.verify.integer-operations-target-structured+0xa68>
    18cc:      	b	0x18e8 <_stogir.verify.integer-operations-target-structured+0xa80>
    18d0:      	cmp	x16, #0x0
    18d4:      	b.eq	0x18dc <_stogir.verify.integer-operations-target-structured+0xa74>
    18d8:      	b	0x18e8 <_stogir.verify.integer-operations-target-structured+0xa80>
    18dc:      	ldr	x1, [sp, #0x2b8]
    18e0:      	b	0x20a0 <_stogir.verify.integer-operations-target-structured+0x1238>
    18e4:      	b	0x18ec <_stogir.verify.integer-operations-target-structured+0xa84>
    18e8:      	b	0x20b8 <_stogir.verify.integer-operations-target-structured+0x1250>
    18ec:      	add	x16, sp, #0x220
    18f0:      	ldr	x0, [x16, #0x8]
    18f4:      	ldr	x1, [sp, #0x2b8]
    18f8:      	ldr	x2, [x1, #0x8]
    18fc:      	mov	x3, x2
    1900:      	mov	x2, x0
    1904:      	mov	x0, x19
    1908:      	mov	x19, x0
    190c:      	mov	x0, x2
    1910:      	mov	x2, x3
    1914:      	uxtb	w16, w20
    1918:      	cmp	w16, wzr
    191c:      	b.eq	0x20cc <_stogir.verify.integer-operations-target-structured+0x1264>
    1920:      	mov	x3, x2
    1924:      	mov	x2, x0
    1928:      	movz	x0, #0x0, lsl #48
    192c:      	cmp	x0, #0x0
    1930:      	b.eq	0x25f8 <_stogir.verify.integer-operations-target-structured+0x1790>
    1934:      	cmp	x22, #0x0
    1938:      	b.eq	0x20dc <_stogir.verify.integer-operations-target-structured+0x1274>
    193c:      	movz	x0, #0x0, lsl #48
    1940:      	cmp	x0, #0x0
    1944:      	b.eq	0x2604 <_stogir.verify.integer-operations-target-structured+0x179c>
    1948:      	ldr	x20, [sp, #0x360]
    194c:      	cmp	x20, #0x0
    1950:      	b.eq	0x20e4 <_stogir.verify.integer-operations-target-structured+0x127c>
    1954:      	ldr	x22, [sp, #0x368]
    1958:      	mov	x0, #0x1                ; =1
    195c:      	cmp	x0, #0x0
    1960:      	b.eq	0x2610 <_stogir.verify.integer-operations-target-structured+0x17a8>
    1964:      	add	x16, sp, #0x260
    1968:      	str	x16, [sp]
    196c:      	ldr	x0, [sp, #0x2e0]
    1970:      	str	x1, [sp, #0x2b8]
    1974:      	ldr	w1, [sp, #0x370]
    1978:      	str	x2, [sp, #0x450]
    197c:      	str	x3, [sp, #0x458]
    1980:      	mov	x2, #0x1                ; =1
    1984:      	bl	0x1984 <_stogir.verify.integer-operations-target-structured+0xb1c>
		0000000000001984:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    1988:      	ldr	x16, [sp]
    198c:      	str	x0, [x16]
    1990:      	str	x1, [x16, #0x8]
    1994:      	add	x16, sp, #0x260
    1998:      	ldr	x0, [x16]
    199c:      	add	x16, sp, #0x260
    19a0:      	ldr	x1, [x16, #0x8]
    19a4:      	lsr	w2, w0, #0
    19a8:      	add	x16, sp, #0x240
    19ac:      	str	x0, [x16]
    19b0:      	add	x16, sp, #0x240
    19b4:      	str	x1, [x16, #0x8]
    19b8:      	lsr	x16, x2, #0
    19bc:      	cmp	x16, #0x1
    19c0:      	b.eq	0x19dc <_stogir.verify.integer-operations-target-structured+0xb74>
    19c4:      	b.lo	0x19cc <_stogir.verify.integer-operations-target-structured+0xb64>
    19c8:      	b	0x19e0 <_stogir.verify.integer-operations-target-structured+0xb78>
    19cc:      	cmp	x16, #0x0
    19d0:      	b.eq	0x19d8 <_stogir.verify.integer-operations-target-structured+0xb70>
    19d4:      	b	0x19e0 <_stogir.verify.integer-operations-target-structured+0xb78>
    19d8:      	b	0x19e4 <_stogir.verify.integer-operations-target-structured+0xb7c>
    19dc:      	b	0x2110 <_stogir.verify.integer-operations-target-structured+0x12a8>
    19e0:      	b	0x247c <_stogir.verify.integer-operations-target-structured+0x1614>
    19e4:      	str	x23, [sp, #0x2c0]
    19e8:      	ldr	x0, [sp, #0x310]
    19ec:      	mov	x1, #0x17               ; =23
    19f0:      	add	x2, x19, #0x1
    19f4:      	lsr	w2, w2, #0
    19f8:      	sxtw	x2, w2
    19fc:      	fmov	d31, x0
    1a00:      	mov	x0, x2
    1a04:      	mov	x2, x1
    1a08:      	fmov	x1, d31
    1a0c:      	ldr	w3, [sp, #0x358]
    1a10:      	sxtw	x3, w3
    1a14:      	add	x3, x3, #0x4
    1a18:      	asr	x16, x3, #63
    1a1c:      	lsr	x16, x16, #62
    1a20:      	add	x3, x3, x16
    1a24:      	asr	x3, x3, #2
    1a28:      	ldr	x4, [sp, #0x350]
    1a2c:      	add	x3, x3, x4
    1a30:      	ldr	x8, [sp, #0x338]
    1a34:      	ldr	x6, [sp, #0x308]
    1a38:      	ldr	x21, [sp, #0x2d8]
    1a3c:      	ldr	x22, [sp, #0x2f0]
    1a40:      	ldr	x23, [sp, #0x2f8]
    1a44:      	ldr	w4, [sp, #0x2c8]
    1a48:      	mov	x7, x24
    1a4c:      	ldr	x24, [sp, #0x310]
    1a50:      	mov	x9, x25
    1a54:      	ldr	x25, [sp, #0x318]
    1a58:      	mov	x10, x26
    1a5c:      	ldr	x26, [sp, #0x320]
    1a60:      	mov	x11, x27
    1a64:      	ldr	x27, [sp, #0x328]
    1a68:      	mov	x12, x28
    1a6c:      	ldr	x28, [sp, #0x330]
    1a70:      	ldr	x13, [sp, #0x448]
    1a74:      	ldr	x14, [sp, #0x380]
    1a78:      	ldr	x15, [sp, #0x348]
    1a7c:      	ldr	w5, [sp, #0x300]
    1a80:      	mov	x19, x0
    1a84:      	ldr	x0, [sp, #0x2e0]
    1a88:      	str	x1, [sp, #0x2a8]
    1a8c:      	ldr	x1, [sp, #0x2b8]
    1a90:      	mov	x20, x2
    1a94:      	mov	x2, x3
    1a98:      	ldr	x3, [sp, #0x2c0]
    1a9c:      	b	0xffc <_stogir.verify.integer-operations-target-structured+0x194>
    1aa0:      	movz	x3, #0x0, lsl #48
    1aa4:      	b	0x1080 <_stogir.verify.integer-operations-target-structured+0x218>
    1aa8:      	cmp	x21, #0x2e
    1aac:      	b.lt	0x1ac0 <_stogir.verify.integer-operations-target-structured+0xc58>
    1ab0:      	cmp	x21, #0x35
    1ab4:      	b.gt	0x1ac0 <_stogir.verify.integer-operations-target-structured+0xc58>
    1ab8:      	mov	x4, #0x1                ; =1
    1abc:      	b	0x1094 <_stogir.verify.integer-operations-target-structured+0x22c>
    1ac0:      	cmp	x21, #0x3a
    1ac4:      	b.ne	0x1ad0 <_stogir.verify.integer-operations-target-structured+0xc68>
    1ac8:      	mov	x4, #0x1                ; =1
    1acc:      	b	0x1abc <_stogir.verify.integer-operations-target-structured+0xc54>
    1ad0:      	cmp	x21, #0x3b
    1ad4:      	cset	w4, eq
    1ad8:      	ubfx	x4, x4, #0, #8
    1adc:      	b	0x1acc <_stogir.verify.integer-operations-target-structured+0xc64>
    1ae0:      	cmp	x21, #0x20
    1ae4:      	b.ne	0x1af4 <_stogir.verify.integer-operations-target-structured+0xc8c>
    1ae8:      	str	x0, [sp, #0x2e0]
    1aec:      	mov	x0, #0x1                ; =1
    1af0:      	b	0x10a4 <_stogir.verify.integer-operations-target-structured+0x23c>
    1af4:      	cmp	x21, #0x2d
    1af8:      	b.ne	0x1b08 <_stogir.verify.integer-operations-target-structured+0xca0>
    1afc:      	str	x0, [sp, #0x2e0]
    1b00:      	mov	x0, #0x1                ; =1
    1b04:      	b	0x1af0 <_stogir.verify.integer-operations-target-structured+0xc88>
    1b08:      	cmp	x21, #0x36
    1b0c:      	b.ne	0x1b1c <_stogir.verify.integer-operations-target-structured+0xcb4>
    1b10:      	str	x0, [sp, #0x2e0]
    1b14:      	mov	x0, #0x1                ; =1
    1b18:      	b	0x1b04 <_stogir.verify.integer-operations-target-structured+0xc9c>
    1b1c:      	cmp	x21, #0x37
    1b20:      	b.ne	0x1b30 <_stogir.verify.integer-operations-target-structured+0xcc8>
    1b24:      	str	x0, [sp, #0x2e0]
    1b28:      	mov	x0, #0x1                ; =1
    1b2c:      	b	0x1b18 <_stogir.verify.integer-operations-target-structured+0xcb0>
    1b30:      	cmp	x21, #0x38
    1b34:      	b.ne	0x1b44 <_stogir.verify.integer-operations-target-structured+0xcdc>
    1b38:      	str	x0, [sp, #0x2e0]
    1b3c:      	mov	x0, #0x1                ; =1
    1b40:      	b	0x1b2c <_stogir.verify.integer-operations-target-structured+0xcc4>
    1b44:      	str	x0, [sp, #0x2e0]
    1b48:      	cmp	x21, #0x39
    1b4c:      	cset	w0, eq
    1b50:      	ubfx	x0, x0, #0, #8
    1b54:      	b	0x1b40 <_stogir.verify.integer-operations-target-structured+0xcd8>
    1b58:      	uxtb	w16, w1
    1b5c:      	cmp	w16, wzr
    1b60:      	b.ne	0x1148 <_stogir.verify.integer-operations-target-structured+0x2e0>
    1b64:      	str	x0, [sp, #0x378]
    1b68:      	str	x20, [sp, #0x380]
    1b6c:      	mov	w20, w1
    1b70:      	ldr	x0, [sp, #0x2a8]
    1b74:      	ldr	x1, [sp, #0x2d0]
    1b78:      	b	0x11c0 <_stogir.verify.integer-operations-target-structured+0x358>
    1b7c:      	add	x0, x19, #0x1
    1b80:      	lsr	w0, w0, #0
    1b84:      	sxtw	x0, w0
    1b88:      	ldr	x1, [sp, #0x2a8]
    1b8c:      	ldr	x2, [sp, #0x2d0]
    1b90:      	b	0x11b4 <_stogir.verify.integer-operations-target-structured+0x34c>
    1b94:      	mov	x2, x1
    1b98:      	mov	x1, x0
    1b9c:      	mov	x0, #0x1                ; =1
    1ba0:      	b	0x11e0 <_stogir.verify.integer-operations-target-structured+0x378>
    1ba4:      	mov	x2, x1
    1ba8:      	mov	x1, x0
    1bac:      	movz	x0, #0x0, lsl #48
    1bb0:      	b	0x11e0 <_stogir.verify.integer-operations-target-structured+0x378>
    1bb4:      	add	x0, x19, #0x1
    1bb8:      	lsr	w0, w0, #0
    1bbc:      	sxtw	x0, w0
    1bc0:      	ldr	x1, [sp, #0x388]
    1bc4:      	ldr	x2, [sp, #0x390]
    1bc8:      	b	0x124c <_stogir.verify.integer-operations-target-structured+0x3e4>
    1bcc:      	brk	#0
    1bd0:      	b	0x1bcc <_stogir.verify.integer-operations-target-structured+0xd64>
    1bd4:      	ldr	x0, [sp, #0x388]
    1bd8:      	ldr	x1, [sp, #0x390]
    1bdc:      	b	0x1258 <_stogir.verify.integer-operations-target-structured+0x3f0>
    1be0:      	cmp	x21, #0x1e
    1be4:      	cset	w2, eq
    1be8:      	ubfx	x2, x2, #0, #8
    1bec:      	fmov	d31, x0
    1bf0:      	mov	x0, x2
    1bf4:      	mov	x2, x1
    1bf8:      	fmov	x1, d31
    1bfc:      	b	0x126c <_stogir.verify.integer-operations-target-structured+0x404>
    1c00:      	mov	x0, #0x1                ; =1
    1c04:      	b	0x128c <_stogir.verify.integer-operations-target-structured+0x424>
    1c08:      	movz	x0, #0x0, lsl #48
    1c0c:      	b	0x128c <_stogir.verify.integer-operations-target-structured+0x424>
    1c10:      	add	x16, sp, #0x70
    1c14:      	ldr	x0, [x16, #0x8]
    1c18:      	add	x16, sp, #0xa0
    1c1c:      	str	x0, [x16]
    1c20:      	ldr	x0, [x26, #0x8]
    1c24:      	add	x16, sp, #0xa0
    1c28:      	str	x0, [x16, #0x8]
    1c2c:      	add	x16, sp, #0x20
    1c30:      	ldr	w0, [x16, #0xc]
    1c34:      	sxtw	x0, w0
    1c38:      	cmp	x0, #0x0
    1c3c:      	b.ge	0x1c60 <_stogir.verify.integer-operations-target-structured+0xdf8>
    1c40:      	ldr	x1, [sp, #0x398]
    1c44:      	ldr	x2, [sp, #0x3a0]
    1c48:      	mov	x0, #0x1                ; =1
    1c4c:      	cmp	x0, #0x0
    1c50:      	b.eq	0x1ce0 <_stogir.verify.integer-operations-target-structured+0xe78>
    1c54:      	ldr	x0, [sp, #0x2b0]
    1c58:      	mov	x1, #0x2d               ; =45
    1c5c:      	b	0x12f4 <_stogir.verify.integer-operations-target-structured+0x48c>
    1c60:      	add	x16, sp, #0xa0
    1c64:      	ldr	w0, [x16]
    1c68:      	uxtb	w0, w0
    1c6c:      	cmp	x0, #0x83
    1c70:      	b.ge	0x1cd0 <_stogir.verify.integer-operations-target-structured+0xe68>
    1c74:      	add	x0, x0, x23
    1c78:      	ldrb	w0, [x0]
    1c7c:      	uxtb	w0, w0
    1c80:      	and	x0, x0, #0x2
    1c84:      	uxtb	w0, w0
    1c88:      	cmp	x0, #0x0
    1c8c:      	cset	w0, eq
    1c90:      	uxtb	w16, w0
    1c94:      	cmp	w16, wzr
    1c98:      	cset	x0, eq
    1c9c:      	cmp	x0, #0x0
    1ca0:      	b.ne	0x1cd8 <_stogir.verify.integer-operations-target-structured+0xe70>
    1ca4:      	add	x16, sp, #0xa0
    1ca8:      	ldr	w0, [x16]
    1cac:      	uxtb	w0, w0
    1cb0:      	cmp	x0, #0x65
    1cb4:      	b.eq	0x1cd8 <_stogir.verify.integer-operations-target-structured+0xe70>
    1cb8:      	cmp	x0, #0x66
    1cbc:      	b.eq	0x1cd8 <_stogir.verify.integer-operations-target-structured+0xe70>
    1cc0:      	mov	x0, #0x1                ; =1
    1cc4:      	ldr	x1, [sp, #0x398]
    1cc8:      	ldr	x2, [sp, #0x3a0]
    1ccc:      	b	0x1c4c <_stogir.verify.integer-operations-target-structured+0xde4>
    1cd0:      	movz	x0, #0x0, lsl #48
    1cd4:      	b	0x1c7c <_stogir.verify.integer-operations-target-structured+0xe14>
    1cd8:      	movz	x0, #0x0, lsl #48
    1cdc:      	b	0x1cc4 <_stogir.verify.integer-operations-target-structured+0xe5c>
    1ce0:      	mov	x0, x1
    1ce4:      	mov	x1, x2
    1ce8:      	b	0x1c5c <_stogir.verify.integer-operations-target-structured+0xdf4>
    1cec:      	brk	#0
    1cf0:      	b	0x1cec <_stogir.verify.integer-operations-target-structured+0xe84>
    1cf4:      	ldr	x0, [sp, #0x398]
    1cf8:      	ldr	x1, [sp, #0x3a0]
    1cfc:      	b	0x12f4 <_stogir.verify.integer-operations-target-structured+0x48c>
    1d00:      	mov	x2, x1
    1d04:      	mov	x1, x0
    1d08:      	movz	x0, #0x0, lsl #48
    1d0c:      	b	0x1318 <_stogir.verify.integer-operations-target-structured+0x4b0>
    1d10:      	ubfx	x0, x3, #0, #8
    1d14:      	b	0x132c <_stogir.verify.integer-operations-target-structured+0x4c4>
    1d18:      	add	x8, sp, #0xf0
    1d1c:      	ldr	x0, [sp, #0x2e0]
    1d20:      	ldr	w1, [sp, #0x370]
    1d24:      	bl	0x1d24 <_stogir.verify.integer-operations-target-structured+0xebc>
		0000000000001d24:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    1d28:      	add	x16, sp, #0xf0
    1d2c:      	ldr	x0, [x16]
    1d30:      	add	x16, sp, #0xd0
    1d34:      	str	x0, [x16]
    1d38:      	add	x16, sp, #0xf0
    1d3c:      	ldr	x0, [x16, #0x8]
    1d40:      	add	x16, sp, #0xd0
    1d44:      	str	x0, [x16, #0x8]
    1d48:      	add	x16, sp, #0xf0
    1d4c:      	ldr	x0, [x16, #0x10]
    1d50:      	add	x16, sp, #0xd0
    1d54:      	str	x0, [x16, #0x10]
    1d58:      	ldr	x0, [sp, #0x3a8]
    1d5c:      	ldr	x1, [sp, #0x3b0]
    1d60:      	b	0x1390 <_stogir.verify.integer-operations-target-structured+0x528>
    1d64:      	add	x2, x19, #0x1
    1d68:      	lsr	w2, w2, #0
    1d6c:      	sxtw	x2, w2
    1d70:      	fmov	d31, x0
    1d74:      	mov	x0, x2
    1d78:      	mov	x2, x1
    1d7c:      	fmov	x1, d31
    1d80:      	b	0x13dc <_stogir.verify.integer-operations-target-structured+0x574>
    1d84:      	brk	#0
    1d88:      	b	0x1d84 <_stogir.verify.integer-operations-target-structured+0xf1c>
    1d8c:      	ldr	x0, [sp, #0x3a8]
    1d90:      	ldr	x1, [sp, #0x3b0]
    1d94:      	b	0x13e8 <_stogir.verify.integer-operations-target-structured+0x580>
    1d98:      	mov	x2, x1
    1d9c:      	mov	x1, x0
    1da0:      	movz	x0, #0x0, lsl #48
    1da4:      	b	0x140c <_stogir.verify.integer-operations-target-structured+0x5a4>
    1da8:      	add	x0, x19, #0x1
    1dac:      	lsr	w0, w0, #0
    1db0:      	sxtw	x0, w0
    1db4:      	ldr	x1, [sp, #0x3b8]
    1db8:      	ldr	x2, [sp, #0x3c0]
    1dbc:      	b	0x1478 <_stogir.verify.integer-operations-target-structured+0x610>
    1dc0:      	brk	#0
    1dc4:      	b	0x1dc0 <_stogir.verify.integer-operations-target-structured+0xf58>
    1dc8:      	ldr	x0, [sp, #0x3b8]
    1dcc:      	ldr	x1, [sp, #0x3c0]
    1dd0:      	b	0x1484 <_stogir.verify.integer-operations-target-structured+0x61c>
    1dd4:      	cmp	x21, #0x79
    1dd8:      	cset	w2, eq
    1ddc:      	ubfx	x2, x2, #0, #8
    1de0:      	fmov	d31, x0
    1de4:      	mov	x0, x2
    1de8:      	mov	x2, x1
    1dec:      	fmov	x1, d31
    1df0:      	b	0x1498 <_stogir.verify.integer-operations-target-structured+0x630>
    1df4:      	add	x0, x19, #0x1
    1df8:      	lsr	w0, w0, #0
    1dfc:      	sxtw	x0, w0
    1e00:      	ldr	x1, [sp, #0x3c8]
    1e04:      	ldr	x2, [sp, #0x3d0]
    1e08:      	b	0x1504 <_stogir.verify.integer-operations-target-structured+0x69c>
    1e0c:      	brk	#0
    1e10:      	b	0x1e0c <_stogir.verify.integer-operations-target-structured+0xfa4>
    1e14:      	ldr	x0, [sp, #0x3c8]
    1e18:      	ldr	x1, [sp, #0x3d0]
    1e1c:      	b	0x1510 <_stogir.verify.integer-operations-target-structured+0x6a8>
    1e20:      	cmp	x21, #0x6d
    1e24:      	b.lt	0x1e48 <_stogir.verify.integer-operations-target-structured+0xfe0>
    1e28:      	cmp	x21, #0x6f
    1e2c:      	cset	w2, le
    1e30:      	ubfx	x2, x2, #0, #8
    1e34:      	fmov	d31, x0
    1e38:      	mov	x0, x2
    1e3c:      	mov	x2, x1
    1e40:      	fmov	x1, d31
    1e44:      	b	0x1524 <_stogir.verify.integer-operations-target-structured+0x6bc>
    1e48:      	movz	x2, #0x0, lsl #48
    1e4c:      	b	0x1e34 <_stogir.verify.integer-operations-target-structured+0xfcc>
    1e50:      	add	x0, x19, #0x1
    1e54:      	lsr	w0, w0, #0
    1e58:      	sxtw	x0, w0
    1e5c:      	ldr	x2, [sp, #0x3d8]
    1e60:      	ldr	x3, [sp, #0x3e0]
    1e64:      	b	0x1598 <_stogir.verify.integer-operations-target-structured+0x730>
    1e68:      	brk	#0
    1e6c:      	b	0x1e68 <_stogir.verify.integer-operations-target-structured+0x1000>
    1e70:      	ldr	x0, [sp, #0x3d8]
    1e74:      	ldr	x2, [sp, #0x3e0]
    1e78:      	b	0x15a4 <_stogir.verify.integer-operations-target-structured+0x73c>
    1e7c:      	cmp	x21, #0x51
    1e80:      	b.ne	0x1e9c <_stogir.verify.integer-operations-target-structured+0x1034>
    1e84:      	mov	x3, #0x1                ; =1
    1e88:      	fmov	d31, x0
    1e8c:      	mov	x0, x3
    1e90:      	mov	x3, x2
    1e94:      	fmov	x2, d31
    1e98:      	b	0x15b8 <_stogir.verify.integer-operations-target-structured+0x750>
    1e9c:      	cmp	x21, #0x52
    1ea0:      	b.ne	0x1eac <_stogir.verify.integer-operations-target-structured+0x1044>
    1ea4:      	mov	x3, #0x1                ; =1
    1ea8:      	b	0x1e88 <_stogir.verify.integer-operations-target-structured+0x1020>
    1eac:      	cmp	x21, #0x53
    1eb0:      	b.ne	0x1ebc <_stogir.verify.integer-operations-target-structured+0x1054>
    1eb4:      	mov	x3, #0x1                ; =1
    1eb8:      	b	0x1ea8 <_stogir.verify.integer-operations-target-structured+0x1040>
    1ebc:      	cmp	x21, #0x54
    1ec0:      	cset	w3, eq
    1ec4:      	ubfx	x3, x3, #0, #8
    1ec8:      	b	0x1eb8 <_stogir.verify.integer-operations-target-structured+0x1050>
    1ecc:      	add	x0, x19, #0x1
    1ed0:      	lsr	w0, w0, #0
    1ed4:      	sxtw	x0, w0
    1ed8:      	ldr	x2, [sp, #0x3e8]
    1edc:      	ldr	x3, [sp, #0x3f0]
    1ee0:      	b	0x1630 <_stogir.verify.integer-operations-target-structured+0x7c8>
    1ee4:      	brk	#0
    1ee8:      	b	0x1ee4 <_stogir.verify.integer-operations-target-structured+0x107c>
    1eec:      	ldr	x0, [sp, #0x3e8]
    1ef0:      	ldr	x2, [sp, #0x3f0]
    1ef4:      	b	0x163c <_stogir.verify.integer-operations-target-structured+0x7d4>
    1ef8:      	cmp	x21, #0x48
    1efc:      	b.ne	0x1f18 <_stogir.verify.integer-operations-target-structured+0x10b0>
    1f00:      	mov	x3, #0x1                ; =1
    1f04:      	fmov	d31, x0
    1f08:      	mov	x0, x3
    1f0c:      	mov	x3, x2
    1f10:      	fmov	x2, d31
    1f14:      	b	0x1650 <_stogir.verify.integer-operations-target-structured+0x7e8>
    1f18:      	cmp	x21, #0x55
    1f1c:      	b.lt	0x1f30 <_stogir.verify.integer-operations-target-structured+0x10c8>
    1f20:      	cmp	x21, #0x58
    1f24:      	cset	w3, le
    1f28:      	ubfx	x3, x3, #0, #8
    1f2c:      	b	0x1f04 <_stogir.verify.integer-operations-target-structured+0x109c>
    1f30:      	movz	x3, #0x0, lsl #48
    1f34:      	b	0x1f2c <_stogir.verify.integer-operations-target-structured+0x10c4>
    1f38:      	add	x0, x19, #0x1
    1f3c:      	lsr	w0, w0, #0
    1f40:      	sxtw	x0, w0
    1f44:      	ldr	x2, [sp, #0x3f8]
    1f48:      	ldr	x3, [sp, #0x400]
    1f4c:      	b	0x16cc <_stogir.verify.integer-operations-target-structured+0x864>
    1f50:      	brk	#0
    1f54:      	b	0x1f50 <_stogir.verify.integer-operations-target-structured+0x10e8>
    1f58:      	ldr	x0, [sp, #0x3f8]
    1f5c:      	ldr	x2, [sp, #0x400]
    1f60:      	b	0x16d8 <_stogir.verify.integer-operations-target-structured+0x870>
    1f64:      	mov	x3, x2
    1f68:      	mov	x2, x0
    1f6c:      	movz	x0, #0x0, lsl #48
    1f70:      	b	0x16fc <_stogir.verify.integer-operations-target-structured+0x894>
    1f74:      	add	x0, x19, #0x1
    1f78:      	lsr	w0, w0, #0
    1f7c:      	sxtw	x0, w0
    1f80:      	ldr	x2, [sp, #0x408]
    1f84:      	ldr	x3, [sp, #0x410]
    1f88:      	b	0x1778 <_stogir.verify.integer-operations-target-structured+0x910>
    1f8c:      	brk	#0
    1f90:      	b	0x1f8c <_stogir.verify.integer-operations-target-structured+0x1124>
    1f94:      	ldr	x0, [sp, #0x408]
    1f98:      	ldr	x2, [sp, #0x410]
    1f9c:      	b	0x1784 <_stogir.verify.integer-operations-target-structured+0x91c>
    1fa0:      	add	x0, x19, #0x1
    1fa4:      	lsr	w0, w0, #0
    1fa8:      	sxtw	x0, w0
    1fac:      	ldr	x2, [sp, #0x418]
    1fb0:      	ldr	x3, [sp, #0x420]
    1fb4:      	b	0x17fc <_stogir.verify.integer-operations-target-structured+0x994>
    1fb8:      	brk	#0
    1fbc:      	b	0x1fb8 <_stogir.verify.integer-operations-target-structured+0x1150>
    1fc0:      	ldr	x0, [sp, #0x418]
    1fc4:      	ldr	x2, [sp, #0x420]
    1fc8:      	b	0x1808 <_stogir.verify.integer-operations-target-structured+0x9a0>
    1fcc:      	mov	x3, x2
    1fd0:      	mov	x2, x0
    1fd4:      	mov	x0, #0x1                ; =1
    1fd8:      	b	0x1844 <_stogir.verify.integer-operations-target-structured+0x9dc>
    1fdc:      	mov	x0, x2
    1fe0:      	mov	x2, x3
    1fe4:      	b	0x1854 <_stogir.verify.integer-operations-target-structured+0x9ec>
    1fe8:      	add	x16, sp, #0x20
    1fec:      	ldr	w3, [x16, #0x8]
    1ff0:      	lsr	w3, w3, #0
    1ff4:      	add	x8, sp, #0x1f0
    1ff8:      	str	x1, [sp, #0x298]
    1ffc:      	mov	w1, w3
    2000:      	str	x0, [sp, #0x428]
    2004:      	ldr	x0, [sp, #0x2e0]
    2008:      	str	x2, [sp, #0x430]
    200c:      	bl	0x200c <_stogir.verify.integer-operations-target-structured+0x11a4>
		000000000000200c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    2010:      	add	x16, sp, #0x1f0
    2014:      	ldr	w0, [x16]
    2018:      	lsr	x16, x0, #0
    201c:      	cmp	x16, #0x1
    2020:      	b.eq	0x203c <_stogir.verify.integer-operations-target-structured+0x11d4>
    2024:      	b.lo	0x202c <_stogir.verify.integer-operations-target-structured+0x11c4>
    2028:      	b	0x2040 <_stogir.verify.integer-operations-target-structured+0x11d8>
    202c:      	cmp	x16, #0x0
    2030:      	b.eq	0x2038 <_stogir.verify.integer-operations-target-structured+0x11d0>
    2034:      	b	0x2040 <_stogir.verify.integer-operations-target-structured+0x11d8>
    2038:      	b	0x2044 <_stogir.verify.integer-operations-target-structured+0x11dc>
    203c:      	b	0x2050 <_stogir.verify.integer-operations-target-structured+0x11e8>
    2040:      	b	0x208c <_stogir.verify.integer-operations-target-structured+0x1224>
    2044:      	ldr	x0, [sp, #0x2f0]
    2048:      	mov	x1, #0x14               ; =20
    204c:      	b	0x185c <_stogir.verify.integer-operations-target-structured+0x9f4>
    2050:      	add	x16, sp, #0x1f0
    2054:      	ldr	x0, [x16, #0x8]
    2058:      	add	x16, sp, #0x20
    205c:      	ldr	w1, [x16]
    2060:      	lsr	w0, w0, #0
    2064:      	ubfx	x1, x1, #8, #8
    2068:      	ubfx	x0, x0, #8, #8
    206c:      	cmp	x0, x1
    2070:      	b.ne	0x2080 <_stogir.verify.integer-operations-target-structured+0x1218>
    2074:      	ldr	x0, [sp, #0x428]
    2078:      	ldr	x1, [sp, #0x430]
    207c:      	b	0x204c <_stogir.verify.integer-operations-target-structured+0x11e4>
    2080:      	ldr	x0, [sp, #0x2f8]
    2084:      	mov	x1, #0x1a               ; =26
    2088:      	b	0x207c <_stogir.verify.integer-operations-target-structured+0x1214>
    208c:      	brk	#0
    2090:      	b	0x208c <_stogir.verify.integer-operations-target-structured+0x1224>
    2094:      	ldr	x0, [sp, #0x428]
    2098:      	ldr	x1, [sp, #0x430]
    209c:      	b	0x186c <_stogir.verify.integer-operations-target-structured+0xa04>
    20a0:      	add	x0, x19, #0x1
    20a4:      	lsr	w0, w0, #0
    20a8:      	sxtw	x0, w0
    20ac:      	ldr	x2, [sp, #0x438]
    20b0:      	ldr	x3, [sp, #0x440]
    20b4:      	b	0x1908 <_stogir.verify.integer-operations-target-structured+0xaa0>
    20b8:      	brk	#0
    20bc:      	b	0x20b8 <_stogir.verify.integer-operations-target-structured+0x1250>
    20c0:      	ldr	x0, [sp, #0x438]
    20c4:      	ldr	x2, [sp, #0x440]
    20c8:      	b	0x1914 <_stogir.verify.integer-operations-target-structured+0xaac>
    20cc:      	mov	x3, x2
    20d0:      	mov	x2, x0
    20d4:      	mov	x0, #0x1                ; =1
    20d8:      	b	0x192c <_stogir.verify.integer-operations-target-structured+0xac4>
    20dc:      	mov	x0, #0x1                ; =1
    20e0:      	b	0x1940 <_stogir.verify.integer-operations-target-structured+0xad8>
    20e4:      	ldr	x22, [sp, #0x368]
    20e8:      	cmp	x22, #0x0
    20ec:      	b.eq	0x20f8 <_stogir.verify.integer-operations-target-structured+0x1290>
    20f0:      	mov	x0, #0x1                ; =1
    20f4:      	b	0x195c <_stogir.verify.integer-operations-target-structured+0xaf4>
    20f8:      	ldr	x0, [sp, #0x2e8]
    20fc:      	b	0x20f4 <_stogir.verify.integer-operations-target-structured+0x128c>
    2100:      	movz	x0, #0x0, lsl #48
    2104:      	b	0x195c <_stogir.verify.integer-operations-target-structured+0xaf4>
    2108:      	movz	x0, #0x0, lsl #48
    210c:      	b	0x195c <_stogir.verify.integer-operations-target-structured+0xaf4>
    2110:      	add	x16, sp, #0x240
    2114:      	ldr	w0, [x16, #0x8]
    2118:      	lsr	w0, w0, #0
    211c:      	mov	w1, w0
    2120:      	ldr	x0, [sp, #0x2e0]
    2124:      	bl	0x2124 <_stogir.verify.integer-operations-target-structured+0x12bc>
		0000000000002124:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    2128:      	cmp	x0, #0x0
    212c:      	b.ne	0x2140 <_stogir.verify.integer-operations-target-structured+0x12d8>
    2130:      	str	x23, [sp, #0x2c0]
    2134:      	ldr	x0, [sp, #0x310]
    2138:      	mov	x1, #0x17               ; =23
    213c:      	b	0x19f0 <_stogir.verify.integer-operations-target-structured+0xb88>
    2140:      	ldr	w0, [x0]
    2144:      	add	x16, sp, #0x20
    2148:      	ldr	w1, [x16]
    214c:      	ubfx	x0, x0, #8, #8
    2150:      	orr	x2, x0, xzr
    2154:      	ubfx	x1, x1, #8, #8
    2158:      	cmp	x1, #0x6
    215c:      	b.ne	0x22d8 <_stogir.verify.integer-operations-target-structured+0x1470>
    2160:      	cmp	x2, #0x6
    2164:      	b.ne	0x22c8 <_stogir.verify.integer-operations-target-structured+0x1460>
    2168:      	cmp	x21, #0x1a
    216c:      	b.ne	0x22b0 <_stogir.verify.integer-operations-target-structured+0x1448>
    2170:      	ldr	x3, [sp, #0x450]
    2174:      	ldr	x4, [sp, #0x458]
    2178:      	mov	x1, #0x1                ; =1
    217c:      	mov	x21, x1
    2180:      	mov	x1, x3
    2184:      	mov	x3, x4
    2188:      	cmp	x2, #0x1
    218c:      	b.lt	0x22e8 <_stogir.verify.integer-operations-target-structured+0x1480>
    2190:      	cmp	x2, #0xb
    2194:      	cset	w4, le
    2198:      	ubfx	x4, x4, #0, #8
    219c:      	fmov	d31, x1
    21a0:      	mov	x1, x4
    21a4:      	mov	x4, x3
    21a8:      	fmov	x3, d31
    21ac:      	cmp	x1, #0x0
    21b0:      	b.eq	0x22f8 <_stogir.verify.integer-operations-target-structured+0x1490>
    21b4:      	movz	x1, #0x0, lsl #48
    21b8:      	cmp	x1, #0x0
    21bc:      	b.eq	0x2300 <_stogir.verify.integer-operations-target-structured+0x1498>
    21c0:      	str	x23, [sp, #0x2c0]
    21c4:      	mov	x23, x2
    21c8:      	mov	x1, x3
    21cc:      	mov	x2, x4
    21d0:      	mov	x0, #0x1                ; =1
    21d4:      	cmp	x0, #0x0
    21d8:      	b.eq	0x238c <_stogir.verify.integer-operations-target-structured+0x1524>
    21dc:      	ldr	x0, [sp, #0x318]
    21e0:      	mov	x1, #0x1c               ; =28
    21e4:      	add	x16, sp, #0x20
    21e8:      	ldr	w2, [x16]
    21ec:      	cmp	x20, #0x0
    21f0:      	b.eq	0x2398 <_stogir.verify.integer-operations-target-structured+0x1530>
    21f4:      	mov	x3, x0
    21f8:      	mov	x0, #0x1                ; =1
    21fc:      	lsr	w0, w0, #0
    2200:      	ubfx	x2, x2, #8, #8
    2204:      	sxtw	x0, w0
    2208:      	cmp	x2, x0
    220c:      	b.ne	0x23a4 <_stogir.verify.integer-operations-target-structured+0x153c>
    2210:      	mov	x0, x3
    2214:      	cmp	x20, #0x0
    2218:      	b.eq	0x23b0 <_stogir.verify.integer-operations-target-structured+0x1548>
    221c:      	mov	x20, x0
    2220:      	mov	x0, #0x1                ; =1
    2224:      	cmp	x0, #0x0
    2228:      	b.eq	0x2624 <_stogir.verify.integer-operations-target-structured+0x17bc>
    222c:      	add	x16, sp, #0x270
    2230:      	str	x16, [sp]
    2234:      	ldr	x0, [sp, #0x2e0]
    2238:      	mov	x22, x1
    223c:      	ldr	w1, [sp, #0x370]
    2240:      	mov	x2, #0x2                ; =2
    2244:      	bl	0x2244 <_stogir.verify.integer-operations-target-structured+0x13dc>
		0000000000002244:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    2248:      	ldr	x16, [sp]
    224c:      	str	x0, [x16]
    2250:      	str	x1, [x16, #0x8]
    2254:      	add	x16, sp, #0x270
    2258:      	ldr	x0, [x16]
    225c:      	add	x16, sp, #0x270
    2260:      	ldr	x1, [x16, #0x8]
    2264:      	lsr	w2, w0, #0
    2268:      	add	x16, sp, #0x250
    226c:      	str	x0, [x16]
    2270:      	add	x16, sp, #0x250
    2274:      	str	x1, [x16, #0x8]
    2278:      	lsr	x16, x2, #0
    227c:      	cmp	x16, #0x1
    2280:      	b.eq	0x229c <_stogir.verify.integer-operations-target-structured+0x1434>
    2284:      	b.lo	0x228c <_stogir.verify.integer-operations-target-structured+0x1424>
    2288:      	b	0x22a0 <_stogir.verify.integer-operations-target-structured+0x1438>
    228c:      	cmp	x16, #0x0
    2290:      	b.eq	0x2298 <_stogir.verify.integer-operations-target-structured+0x1430>
    2294:      	b	0x22a0 <_stogir.verify.integer-operations-target-structured+0x1438>
    2298:      	b	0x22a4 <_stogir.verify.integer-operations-target-structured+0x143c>
    229c:      	b	0x23bc <_stogir.verify.integer-operations-target-structured+0x1554>
    22a0:      	b	0x2468 <_stogir.verify.integer-operations-target-structured+0x1600>
    22a4:      	ldr	x0, [sp, #0x328]
    22a8:      	mov	x1, #0x1d               ; =29
    22ac:      	b	0x213c <_stogir.verify.integer-operations-target-structured+0x12d4>
    22b0:      	cmp	x21, #0x1b
    22b4:      	cset	w1, eq
    22b8:      	ubfx	x1, x1, #0, #8
    22bc:      	ldr	x3, [sp, #0x450]
    22c0:      	ldr	x4, [sp, #0x458]
    22c4:      	b	0x217c <_stogir.verify.integer-operations-target-structured+0x1314>
    22c8:      	ldr	x3, [sp, #0x450]
    22cc:      	ldr	x4, [sp, #0x458]
    22d0:      	movz	x1, #0x0, lsl #48
    22d4:      	b	0x217c <_stogir.verify.integer-operations-target-structured+0x1314>
    22d8:      	ldr	x1, [sp, #0x450]
    22dc:      	ldr	x3, [sp, #0x458]
    22e0:      	movz	x21, #0x0, lsl #48
    22e4:      	b	0x2188 <_stogir.verify.integer-operations-target-structured+0x1320>
    22e8:      	mov	x4, x3
    22ec:      	mov	x3, x1
    22f0:      	movz	x1, #0x0, lsl #48
    22f4:      	b	0x21ac <_stogir.verify.integer-operations-target-structured+0x1344>
    22f8:      	mov	x1, #0x1                ; =1
    22fc:      	b	0x21b8 <_stogir.verify.integer-operations-target-structured+0x1350>
    2300:      	ldr	w1, [sp, #0x340]
    2304:      	lsr	w1, w1, #0
    2308:      	lsr	w0, w0, #0
    230c:      	ldr	x5, [sp, #0x2e8]
    2310:      	cmp	x5, #0x0
    2314:      	b.eq	0x262c <_stogir.verify.integer-operations-target-structured+0x17c4>
    2318:      	str	x3, [sp, #0x460]
    231c:      	str	x4, [sp, #0x468]
    2320:      	str	w1, [sp, #0x470]
    2324:      	str	w0, [sp, #0x478]
    2328:      	str	x23, [sp, #0x2c0]
    232c:      	mov	x23, x2
    2330:      	fmov	s31, w0
    2334:      	mov	w0, w1
    2338:      	fmov	w1, s31
    233c:      	bl	0x233c <_stogir.verify.integer-operations-target-structured+0x14d4>
		000000000000233c:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    2340:      	cmp	x0, #0x0
    2344:      	b.ne	0x2358 <_stogir.verify.integer-operations-target-structured+0x14f0>
    2348:      	mov	x0, #0x1                ; =1
    234c:      	ldr	x1, [sp, #0x460]
    2350:      	ldr	x2, [sp, #0x468]
    2354:      	b	0x21d4 <_stogir.verify.integer-operations-target-structured+0x136c>
    2358:      	cmp	x22, #0x0
    235c:      	b.eq	0x2384 <_stogir.verify.integer-operations-target-structured+0x151c>
    2360:      	ldr	w0, [sp, #0x470]
    2364:      	ldr	w1, [sp, #0x478]
    2368:      	bl	0x2368 <_stogir.verify.integer-operations-target-structured+0x1500>
		0000000000002368:  ARM64_RELOC_BRANCH26	_stogir.integer-binary.valid-type?
    236c:      	cmp	x0, #0x0
    2370:      	cset	w0, ne
    2374:      	uxtb	w16, w0
    2378:      	cmp	w16, wzr
    237c:      	cset	x0, eq
    2380:      	b	0x234c <_stogir.verify.integer-operations-target-structured+0x14e4>
    2384:      	movz	x0, #0x0, lsl #48
    2388:      	b	0x2380 <_stogir.verify.integer-operations-target-structured+0x1518>
    238c:      	mov	x0, x1
    2390:      	mov	x1, x2
    2394:      	b	0x21e4 <_stogir.verify.integer-operations-target-structured+0x137c>
    2398:      	mov	x3, x0
    239c:      	mov	x0, x23
    23a0:      	b	0x21fc <_stogir.verify.integer-operations-target-structured+0x1394>
    23a4:      	ldr	x0, [sp, #0x320]
    23a8:      	mov	x1, #0x26               ; =38
    23ac:      	b	0x2214 <_stogir.verify.integer-operations-target-structured+0x13ac>
    23b0:      	mov	x20, x0
    23b4:      	mov	x0, x22
    23b8:      	b	0x2224 <_stogir.verify.integer-operations-target-structured+0x13bc>
    23bc:      	add	x16, sp, #0x250
    23c0:      	ldr	w0, [x16, #0x8]
    23c4:      	lsr	w0, w0, #0
    23c8:      	mov	w1, w0
    23cc:      	ldr	x0, [sp, #0x2e0]
    23d0:      	bl	0x23d0 <_stogir.verify.integer-operations-target-structured+0x1568>
		00000000000023d0:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    23d4:      	cmp	x0, #0x0
    23d8:      	b.ne	0x23e8 <_stogir.verify.integer-operations-target-structured+0x1580>
    23dc:      	ldr	x0, [sp, #0x328]
    23e0:      	mov	x1, #0x1d               ; =29
    23e4:      	b	0x22ac <_stogir.verify.integer-operations-target-structured+0x1444>
    23e8:      	ldr	w0, [x0]
    23ec:      	ubfx	x0, x0, #8, #8
    23f0:      	cmp	x23, x0
    23f4:      	b.ne	0x2420 <_stogir.verify.integer-operations-target-structured+0x15b8>
    23f8:      	mov	x1, x20
    23fc:      	mov	x0, #0x1                ; =1
    2400:      	cmp	x0, #0x0
    2404:      	b.eq	0x2454 <_stogir.verify.integer-operations-target-structured+0x15ec>
    2408:      	movz	x0, #0x0, lsl #48
    240c:      	cmp	x0, #0x0
    2410:      	b.eq	0x245c <_stogir.verify.integer-operations-target-structured+0x15f4>
    2414:      	ldr	x0, [sp, #0x330]
    2418:      	mov	x1, #0x1d               ; =29
    241c:      	b	0x23e4 <_stogir.verify.integer-operations-target-structured+0x157c>
    2420:      	cmp	x21, #0x0
    2424:      	b.eq	0x244c <_stogir.verify.integer-operations-target-structured+0x15e4>
    2428:      	cmp	x0, #0x5
    242c:      	b.ne	0x243c <_stogir.verify.integer-operations-target-structured+0x15d4>
    2430:      	mov	x0, #0x1                ; =1
    2434:      	mov	x1, x20
    2438:      	b	0x2400 <_stogir.verify.integer-operations-target-structured+0x1598>
    243c:      	cmp	x0, #0xb
    2440:      	cset	w0, eq
    2444:      	ubfx	x0, x0, #0, #8
    2448:      	b	0x2434 <_stogir.verify.integer-operations-target-structured+0x15cc>
    244c:      	movz	x0, #0x0, lsl #48
    2450:      	b	0x2434 <_stogir.verify.integer-operations-target-structured+0x15cc>
    2454:      	mov	x0, #0x1                ; =1
    2458:      	b	0x240c <_stogir.verify.integer-operations-target-structured+0x15a4>
    245c:      	mov	x0, x1
    2460:      	mov	x1, x22
    2464:      	b	0x241c <_stogir.verify.integer-operations-target-structured+0x15b4>
    2468:      	brk	#0
    246c:      	b	0x2468 <_stogir.verify.integer-operations-target-structured+0x1600>
    2470:      	mov	x0, x20
    2474:      	mov	x1, x22
    2478:      	b	0x22ac <_stogir.verify.integer-operations-target-structured+0x1444>
    247c:      	brk	#0
    2480:      	b	0x247c <_stogir.verify.integer-operations-target-structured+0x1614>
    2484:      	mov	x0, x19
    2488:      	ldr	x1, [sp, #0x450]
    248c:      	ldr	x2, [sp, #0x458]
    2490:      	b	0x1a0c <_stogir.verify.integer-operations-target-structured+0xba4>
    2494:      	brk	#0
    2498:      	b	0x2494 <_stogir.verify.integer-operations-target-structured+0x162c>
    249c:      	uxtb	w16, w1
    24a0:      	cmp	w16, wzr
    24a4:      	b.eq	0x2500 <_stogir.verify.integer-operations-target-structured+0x1698>
    24a8:      	and	x0, x19, #0xffffffff
    24ac:      	mov	x1, x0
    24b0:      	movz	x0, #0x0, lsl #48
    24b4:      	movz	x2, #0x0, lsl #48
    24b8:      	ldr	x3, [sp, #0x338]
    24bc:      	str	x0, [x3]
    24c0:      	str	x1, [x3, #0x8]
    24c4:      	str	x2, [x3, #0x10]
    24c8:      	ldr	x19, [sp, #0x480]
    24cc:      	ldr	x20, [sp, #0x488]
    24d0:      	ldr	x21, [sp, #0x490]
    24d4:      	ldr	x22, [sp, #0x498]
    24d8:      	ldr	x23, [sp, #0x4a0]
    24dc:      	ldr	x24, [sp, #0x4a8]
    24e0:      	ldr	x25, [sp, #0x4b0]
    24e4:      	ldr	x26, [sp, #0x4b8]
    24e8:      	ldr	x27, [sp, #0x4c0]
    24ec:      	ldr	x28, [sp, #0x4c8]
    24f0:      	ldr	x29, [sp, #0x10]
    24f4:      	ldr	x30, [sp, #0x18]
    24f8:      	add	sp, sp, #0x4d0
    24fc:      	ret
    2500:      	ldr	x1, [sp, #0x2a8]
    2504:      	ldr	x2, [sp, #0x2d0]
    2508:      	mov	x0, #0x1                ; =1
    250c:      	b	0x24b8 <_stogir.verify.integer-operations-target-structured+0x1650>
    2510:      	str	x8, [sp, #0x338]
    2514:      	str	x20, [sp, #0x2d0]
    2518:      	b	0x249c <_stogir.verify.integer-operations-target-structured+0x1634>
    251c:      	str	x8, [sp, #0x338]
    2520:      	str	x20, [sp, #0x2d0]
    2524:      	b	0x249c <_stogir.verify.integer-operations-target-structured+0x1634>
    2528:      	str	x1, [sp, #0x388]
    252c:      	str	x2, [sp, #0x390]
    2530:      	b	0x1bd4 <_stogir.verify.integer-operations-target-structured+0xd6c>
    2534:      	str	x1, [sp, #0x398]
    2538:      	str	x2, [sp, #0x3a0]
    253c:      	b	0x1cf4 <_stogir.verify.integer-operations-target-structured+0xe8c>
    2540:      	str	x1, [sp, #0x3a8]
    2544:      	str	x2, [sp, #0x3b0]
    2548:      	b	0x1d8c <_stogir.verify.integer-operations-target-structured+0xf24>
    254c:      	str	x1, [sp, #0x3a8]
    2550:      	str	x2, [sp, #0x3b0]
    2554:      	b	0x1d18 <_stogir.verify.integer-operations-target-structured+0xeb0>
    2558:      	str	x1, [sp, #0x3b8]
    255c:      	str	x2, [sp, #0x3c0]
    2560:      	b	0x1dc8 <_stogir.verify.integer-operations-target-structured+0xf60>
    2564:      	str	x1, [sp, #0x3c8]
    2568:      	str	x2, [sp, #0x3d0]
    256c:      	b	0x1e14 <_stogir.verify.integer-operations-target-structured+0xfac>
    2570:      	str	x1, [sp, #0x3d8]
    2574:      	ldr	x1, [sp, #0x380]
    2578:      	str	x2, [sp, #0x3e0]
    257c:      	b	0x1e70 <_stogir.verify.integer-operations-target-structured+0x1008>
    2580:      	str	x1, [sp, #0x380]
    2584:      	ldr	x1, [sp, #0x348]
    2588:      	str	x2, [sp, #0x3e8]
    258c:      	str	x3, [sp, #0x3f0]
    2590:      	b	0x1eec <_stogir.verify.integer-operations-target-structured+0x1084>
    2594:      	str	x1, [sp, #0x348]
    2598:      	ldr	x1, [sp, #0x288]
    259c:      	str	x2, [sp, #0x3f8]
    25a0:      	str	x3, [sp, #0x400]
    25a4:      	b	0x1f58 <_stogir.verify.integer-operations-target-structured+0x10f0>
    25a8:      	str	x1, [sp, #0x288]
    25ac:      	ldr	x1, [sp, #0x290]
    25b0:      	str	x2, [sp, #0x408]
    25b4:      	str	x3, [sp, #0x410]
    25b8:      	b	0x1f94 <_stogir.verify.integer-operations-target-structured+0x112c>
    25bc:      	str	x1, [sp, #0x290]
    25c0:      	ldr	x1, [sp, #0x298]
    25c4:      	str	x0, [sp, #0x418]
    25c8:      	str	x2, [sp, #0x420]
    25cc:      	b	0x1fc0 <_stogir.verify.integer-operations-target-structured+0x1158>
    25d0:      	str	x1, [sp, #0x298]
    25d4:      	str	x0, [sp, #0x428]
    25d8:      	str	x2, [sp, #0x430]
    25dc:      	b	0x2094 <_stogir.verify.integer-operations-target-structured+0x122c>
    25e0:      	str	x22, [sp, #0x448]
    25e4:      	mov	x22, x2
    25e8:      	str	x0, [sp, #0x438]
    25ec:      	str	x1, [sp, #0x440]
    25f0:      	ldr	x1, [sp, #0x2b8]
    25f4:      	b	0x20c0 <_stogir.verify.integer-operations-target-structured+0x1258>
    25f8:      	ldr	x20, [sp, #0x360]
    25fc:      	ldr	x22, [sp, #0x368]
    2600:      	b	0x2108 <_stogir.verify.integer-operations-target-structured+0x12a0>
    2604:      	ldr	x20, [sp, #0x360]
    2608:      	ldr	x22, [sp, #0x368]
    260c:      	b	0x2100 <_stogir.verify.integer-operations-target-structured+0x1298>
    2610:      	str	x1, [sp, #0x2b8]
    2614:      	str	x23, [sp, #0x2c0]
    2618:      	str	x2, [sp, #0x450]
    261c:      	str	x3, [sp, #0x458]
    2620:      	b	0x2484 <_stogir.verify.integer-operations-target-structured+0x161c>
    2624:      	mov	x22, x1
    2628:      	b	0x2470 <_stogir.verify.integer-operations-target-structured+0x1608>
    262c:      	str	w1, [sp, #0x470]
    2630:      	str	w0, [sp, #0x478]
    2634:      	str	x23, [sp, #0x2c0]
    2638:      	mov	x23, x2
    263c:      	str	x3, [sp, #0x460]
    2640:      	str	x4, [sp, #0x468]
    2644:      	b	0x2358 <_stogir.verify.integer-operations-target-structured+0x14f0>

0000000000002648 <_coil.core.Len$coil.arraylist.ArrayList$len__i32>:
    2648:      	ldr	x0, [x0, #0x8]
    264c:      	ret

0000000000002650 <_coil.core.Eq$slice<u8>$=>:
    2650:      	sub	sp, sp, #0x10
    2654:      	str	x29, [sp]
    2658:      	str	x30, [sp, #0x8]
    265c:      	mov	x29, sp
    2660:      	cmp	x1, x3
    2664:      	b.ne	0x26a4 <_coil.core.Eq$slice<u8>$=+0x54>
    2668:      	cmp	x1, #0x0
    266c:      	b.ne	0x2678 <_coil.core.Eq$slice<u8>$=+0x28>
    2670:      	mov	x0, #0x1                ; =1
    2674:      	b	0x26a0 <_coil.core.Eq$slice<u8>$=+0x50>
    2678:      	lsr	x1, x1, #0
    267c:      	fmov	d31, x1
    2680:      	mov	x1, x2
    2684:      	fmov	x2, d31
    2688:      	bl	0x2688 <_coil.core.Eq$slice<u8>$=+0x38>
		0000000000002688:  ARM64_RELOC_BRANCH26	_memcmp
    268c:      	lsr	w0, w0, #0
    2690:      	sxtw	x0, w0
    2694:      	cmp	x0, #0x0
    2698:      	cset	w0, eq
    269c:      	ubfx	x0, x0, #0, #8
    26a0:      	b	0x26a8 <_coil.core.Eq$slice<u8>$=+0x58>
    26a4:      	movz	x0, #0x0, lsl #48
    26a8:      	ldr	x29, [sp]
    26ac:      	ldr	x30, [sp, #0x8]
    26b0:      	add	sp, sp, #0x10
    26b4:      	ret

00000000000026b8 <_stogir.node.opcode>:
    26b8:      	ldr	w0, [x0]
    26bc:      	uxtb	w0, w0
    26c0:      	ret

00000000000026c4 <_stogir.opcode.valid?>:
    26c4:      	sxtw	x0, w0
    26c8:      	cmp	x0, #0x0
    26cc:      	b.lt	0x26e0 <_stogir.opcode.valid?+0x1c>
    26d0:      	cmp	x0, #0x83
    26d4:      	cset	w0, lt
    26d8:      	ubfx	x0, x0, #0, #8
    26dc:      	b	0x26e4 <_stogir.opcode.valid?+0x20>
    26e0:      	movz	x0, #0x0, lsl #48
    26e4:      	ret

00000000000026e8 <_stogir.node.type-id>:
    26e8:      	ldr	w0, [x0]
    26ec:      	ubfx	x0, x0, #8, #8
    26f0:      	ret

00000000000026f4 <_stogir.types.valid?>:
    26f4:      	sxtw	x0, w0
    26f8:      	cmp	x0, #0x0
    26fc:      	b.lt	0x2710 <_stogir.types.valid?+0x1c>
    2700:      	cmp	x0, #0xd
    2704:      	b.gt	0x2710 <_stogir.types.valid?+0x1c>
    2708:      	mov	x0, #0x1                ; =1
    270c:      	ret
    2710:      	cmp	x0, #0xf
    2714:      	b.le	0x274c <_stogir.types.valid?+0x58>
    2718:      	cmp	x0, #0x80
    271c:      	b.ge	0x2744 <_stogir.types.valid?+0x50>
    2720:      	and	x0, x0, #0xf
    2724:      	lsr	w0, w0, #0
    2728:      	sxtw	x0, w0
    272c:      	cmp	x0, #0x1
    2730:      	b.lt	0x2754 <_stogir.types.valid?+0x60>
    2734:      	cmp	x0, #0xd
    2738:      	cset	w0, le
    273c:      	ubfx	x0, x0, #0, #8
    2740:      	b	0x2758 <_stogir.types.valid?+0x64>
    2744:      	movz	x0, #0x0, lsl #48
    2748:      	b	0x2750 <_stogir.types.valid?+0x5c>
    274c:      	movz	x0, #0x0, lsl #48
    2750:      	ret
    2754:      	movz	x0, #0x0, lsl #48
    2758:      	b	0x2748 <_stogir.types.valid?+0x54>

000000000000275c <_stogir.opcode.operand-slots>:
    275c:      	sxtw	x0, w0
    2760:      	cmp	x0, #0x0
    2764:      	b.lt	0x2790 <_stogir.opcode.operand-slots+0x34>
    2768:      	cmp	x0, #0x83
    276c:      	b.ge	0x2790 <_stogir.opcode.operand-slots+0x34>
    2770:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x1198>
		0000000000002770:  ARM64_RELOC_PAGE21	l_stogir.329
    2774:      	ldr	x16, [x16]
		0000000000002774:  ARM64_RELOC_PAGEOFF12	l_stogir.329
    2778:      	orr	x1, x16, xzr
    277c:      	lsr	x0, x0, #0
    2780:      	add	x0, x0, x1
    2784:      	ldrsb	w0, [x0]
    2788:      	sxtb	x0, w0
    278c:      	b	0x2794 <_stogir.opcode.operand-slots+0x38>
    2790:      	mov	x0, #-0x2               ; =-2
    2794:      	ret

0000000000002798 <_stogir.opcode.input-count>:
    2798:      	sxtw	x0, w0
    279c:      	cmp	x0, #0x0
    27a0:      	b.lt	0x27cc <_stogir.opcode.input-count+0x34>
    27a4:      	cmp	x0, #0x83
    27a8:      	b.ge	0x27cc <_stogir.opcode.input-count+0x34>
    27ac:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x1198>
		00000000000027ac:  ARM64_RELOC_PAGE21	l_stogir.330
    27b0:      	ldr	x16, [x16]
		00000000000027b0:  ARM64_RELOC_PAGEOFF12	l_stogir.330
    27b4:      	orr	x1, x16, xzr
    27b8:      	lsr	x0, x0, #0
    27bc:      	add	x0, x0, x1
    27c0:      	ldrsb	w0, [x0]
    27c4:      	sxtb	x0, w0
    27c8:      	b	0x27d0 <_stogir.opcode.input-count+0x38>
    27cc:      	mov	x0, #-0x2               ; =-2
    27d0:      	ret

00000000000027d4 <_stogir.node.auxiliary>:
    27d4:      	ldr	w0, [x0]
    27d8:      	ubfx	x0, x0, #16, #16
    27dc:      	ret

00000000000027e0 <_stogir.opcode.operand-code>:
    27e0:      	sxtw	x0, w0
    27e4:      	cmp	x0, #0x0
    27e8:      	b.lt	0x2828 <_stogir.opcode.operand-code+0x48>
    27ec:      	cmp	x0, #0x83
    27f0:      	b.ge	0x2828 <_stogir.opcode.operand-code+0x48>
    27f4:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x1198>
		00000000000027f4:  ARM64_RELOC_PAGE21	l_stogir.331
    27f8:      	ldr	x16, [x16]
		00000000000027f8:  ARM64_RELOC_PAGEOFF12	l_stogir.331
    27fc:      	orr	x2, x16, xzr
    2800:      	lsl	x0, x0, #2
    2804:      	sxtw	x1, w1
    2808:      	add	x0, x0, x2
    280c:      	ldr	w0, [x0]
    2810:      	cmp	x1, #0x0
    2814:      	b.le	0x285c <_stogir.opcode.operand-code+0x7c>
    2818:      	cmp	x1, #0x4
    281c:      	b.le	0x2830 <_stogir.opcode.operand-code+0x50>
    2820:      	mov	x1, #0x4                ; =4
    2824:      	b	0x283c <_stogir.opcode.operand-code+0x5c>
    2828:      	movz	x0, #0x0, lsl #48
    282c:      	ret
    2830:      	sub	x1, x1, #0x1
    2834:      	lsr	w1, w1, #0
    2838:      	sxtw	x1, w1
    283c:      	lsl	x1, x1, #2
    2840:      	lsr	w1, w1, #0
    2844:      	ubfx	x1, x1, #0, #32
    2848:      	lsr	x0, x0, x1
    284c:      	lsr	w0, w0, #0
    2850:      	and	x0, x0, #0xf
    2854:      	lsr	w0, w0, #0
    2858:      	b	0x2860 <_stogir.opcode.operand-code+0x80>
    285c:      	movz	x0, #0x0, lsl #48
    2860:      	ret

0000000000002864 <_stogir.graph.operand>:
    2864:      	sub	sp, sp, #0x10
    2868:      	mov	x3, sp
    286c:      	sxtw	x1, w1
    2870:      	cmp	x1, #0x0
    2874:      	b.le	0x28c0 <_stogir.graph.operand+0x5c>
    2878:      	lsl	x4, x1, #2
    287c:      	cmp	x1, #0x0
    2880:      	b.le	0x28ec <_stogir.graph.operand+0x88>
    2884:      	ldr	x5, [x0, #0x8]
    2888:      	cmp	x1, x5
    288c:      	b.ge	0x2944 <_stogir.graph.operand+0xe0>
    2890:      	add	x5, x0, #0x78
    2894:      	ldr	x5, [x5, #0x8]
    2898:      	cmp	x1, x5
    289c:      	b.ge	0x29d8 <_stogir.graph.operand+0x174>
    28a0:      	ldr	x5, [x0, #0x78]
    28a4:      	add	x5, x4, x5
    28a8:      	ldr	w5, [x5]
    28ac:      	sxtw	x5, w5
    28b0:      	cmp	x5, #0x0
    28b4:      	cset	w5, ge
    28b8:      	ubfx	x5, x5, #0, #8
    28bc:      	b	0x29dc <_stogir.graph.operand+0x178>
    28c0:      	movz	x0, #0x0, lsl #48
    28c4:      	movz	x1, #0x0, lsl #48
    28c8:      	str	x0, [x3]
    28cc:      	str	x1, [x3, #0x8]
    28d0:      	ldr	x0, [sp]
    28d4:      	ldr	x1, [sp, #0x8]
    28d8:      	add	sp, sp, #0x10
    28dc:      	ret
    28e0:      	movz	x0, #0x0, lsl #48
    28e4:      	movz	x1, #0x0, lsl #48
    28e8:      	b	0x28c8 <_stogir.graph.operand+0x64>
    28ec:      	cmp	x1, #0x0
    28f0:      	b.ge	0x294c <_stogir.graph.operand+0xe8>
    28f4:      	add	x5, x0, #0x28
    28f8:      	add	x6, x0, #0x50
    28fc:      	ldr	x5, [x5, #0x8]
    2900:      	ldr	x6, [x6, #0x8]
    2904:      	cmp	x5, x6
    2908:      	b.ne	0x29d0 <_stogir.graph.operand+0x16c>
    290c:      	movz	x16, #0x0, lsl #48
    2910:      	sub	x6, x16, x1
    2914:      	cmp	x6, x5
    2918:      	b.gt	0x29e0 <_stogir.graph.operand+0x17c>
    291c:      	sub	x5, x6, #0x1
    2920:      	lsl	x5, x5, #2
    2924:      	ldr	x6, [x0, #0x50]
    2928:      	add	x5, x5, x6
    292c:      	ldr	w5, [x5]
    2930:      	sxtw	x5, w5
    2934:      	cmp	x5, #0x0
    2938:      	cset	w5, gt
    293c:      	ubfx	x5, x5, #0, #8
    2940:      	b	0x29e4 <_stogir.graph.operand+0x180>
    2944:      	movz	x5, #0x0, lsl #48
    2948:      	b	0x2950 <_stogir.graph.operand+0xec>
    294c:      	movz	x5, #0x0, lsl #48
    2950:      	cmp	x5, #0x0
    2954:      	b.eq	0x28c0 <_stogir.graph.operand+0x5c>
    2958:      	sxtw	x2, w2
    295c:      	cmp	x2, #0x1
    2960:      	b.lt	0x28e0 <_stogir.graph.operand+0x7c>
    2964:      	ldr	x5, [x0, #0x78]
    2968:      	add	x4, x4, x5
    296c:      	ldr	w4, [x4]
    2970:      	sxtw	x4, w4
    2974:      	cmp	x2, x4
    2978:      	b.gt	0x28e0 <_stogir.graph.operand+0x7c>
    297c:      	asr	x16, x2, #63
    2980:      	lsr	x16, x16, #62
    2984:      	add	x4, x2, x16
    2988:      	asr	x4, x4, #2
    298c:      	asr	x16, x2, #63
    2990:      	lsr	x16, x16, #62
    2994:      	add	x2, x2, x16
    2998:      	and	x2, x2, #0x3
    299c:      	sub	x2, x2, x16
    29a0:      	ldr	x0, [x0]
    29a4:      	add	x1, x4, x1
    29a8:      	lsl	x2, x2, #2
    29ac:      	lsl	x1, x1, #4
    29b0:      	add	x0, x1, x0
    29b4:      	add	x0, x2, x0
    29b8:      	ldr	w0, [x0]
    29bc:      	sxtw	x0, w0
    29c0:      	and	x0, x0, #0xffffffff
    29c4:      	mov	x1, x0
    29c8:      	mov	x0, #0x1                ; =1
    29cc:      	b	0x28e8 <_stogir.graph.operand+0x84>
    29d0:      	movz	x5, #0x0, lsl #48
    29d4:      	b	0x2950 <_stogir.graph.operand+0xec>
    29d8:      	movz	x5, #0x0, lsl #48
    29dc:      	b	0x2948 <_stogir.graph.operand+0xe4>
    29e0:      	movz	x5, #0x0, lsl #48
    29e4:      	b	0x29d4 <_stogir.graph.operand+0x170>

00000000000029e8 <_stogir.graph.borrow-node>:
    29e8:      	sxtw	x1, w1
    29ec:      	cmp	x1, #0x0
    29f0:      	cset	w2, gt
    29f4:      	movz	x16, #0x0, lsl #48
    29f8:      	sub	x3, x16, x1
    29fc:      	sub	x4, x3, #0x1
    2a00:      	uxtb	w16, w2
    2a04:      	cmp	w16, wzr
    2a08:      	b.eq	0x2a4c <_stogir.graph.borrow-node+0x64>
    2a0c:      	ldr	x3, [x0, #0x8]
    2a10:      	cmp	x1, x3
    2a14:      	b.ge	0x2aa0 <_stogir.graph.borrow-node+0xb8>
    2a18:      	add	x3, x0, #0x78
    2a1c:      	ldr	x3, [x3, #0x8]
    2a20:      	cmp	x1, x3
    2a24:      	b.ge	0x2ae8 <_stogir.graph.borrow-node+0x100>
    2a28:      	lsl	x3, x1, #2
    2a2c:      	ldr	x5, [x0, #0x78]
    2a30:      	add	x3, x3, x5
    2a34:      	ldr	w3, [x3]
    2a38:      	sxtw	x3, w3
    2a3c:      	cmp	x3, #0x0
    2a40:      	cset	w3, ge
    2a44:      	ubfx	x3, x3, #0, #8
    2a48:      	b	0x2aec <_stogir.graph.borrow-node+0x104>
    2a4c:      	cmp	x1, #0x0
    2a50:      	b.ge	0x2aa8 <_stogir.graph.borrow-node+0xc0>
    2a54:      	add	x5, x0, #0x28
    2a58:      	add	x6, x0, #0x50
    2a5c:      	ldr	x5, [x5, #0x8]
    2a60:      	ldr	x6, [x6, #0x8]
    2a64:      	cmp	x5, x6
    2a68:      	b.ne	0x2a98 <_stogir.graph.borrow-node+0xb0>
    2a6c:      	cmp	x3, x5
    2a70:      	b.gt	0x2af0 <_stogir.graph.borrow-node+0x108>
    2a74:      	lsl	x3, x4, #2
    2a78:      	ldr	x5, [x0, #0x50]
    2a7c:      	add	x3, x3, x5
    2a80:      	ldr	w3, [x3]
    2a84:      	sxtw	x3, w3
    2a88:      	cmp	x3, #0x0
    2a8c:      	cset	w3, gt
    2a90:      	ubfx	x3, x3, #0, #8
    2a94:      	b	0x2af4 <_stogir.graph.borrow-node+0x10c>
    2a98:      	movz	x3, #0x0, lsl #48
    2a9c:      	b	0x2aac <_stogir.graph.borrow-node+0xc4>
    2aa0:      	movz	x3, #0x0, lsl #48
    2aa4:      	b	0x2aac <_stogir.graph.borrow-node+0xc4>
    2aa8:      	movz	x3, #0x0, lsl #48
    2aac:      	cmp	x3, #0x0
    2ab0:      	b.eq	0x2ae0 <_stogir.graph.borrow-node+0xf8>
    2ab4:      	uxtb	w16, w2
    2ab8:      	cmp	w16, wzr
    2abc:      	b.eq	0x2ad0 <_stogir.graph.borrow-node+0xe8>
    2ac0:      	lsl	x1, x1, #4
    2ac4:      	ldr	x0, [x0]
    2ac8:      	add	x0, x1, x0
    2acc:      	b	0x2adc <_stogir.graph.borrow-node+0xf4>
    2ad0:      	lsl	x1, x4, #4
    2ad4:      	ldr	x0, [x0, #0x28]
    2ad8:      	add	x0, x1, x0
    2adc:      	b	0x2ae4 <_stogir.graph.borrow-node+0xfc>
    2ae0:      	movz	x0, #0x0, lsl #48
    2ae4:      	ret
    2ae8:      	movz	x3, #0x0, lsl #48
    2aec:      	b	0x2aa4 <_stogir.graph.borrow-node+0xbc>
    2af0:      	movz	x3, #0x0, lsl #48
    2af4:      	b	0x2a9c <_stogir.graph.borrow-node+0xb4>

0000000000002af8 <_stogir.strings.lookup>:
    2af8:      	sxtw	x1, w1
    2afc:      	cmp	x1, #0x0
    2b00:      	b.le	0x2b7c <_stogir.strings.lookup+0x84>
    2b04:      	add	x2, x0, #0x28
    2b08:      	ldr	x2, [x2, #0x8]
    2b0c:      	cmp	x1, x2
    2b10:      	b.gt	0x2b7c <_stogir.strings.lookup+0x84>
    2b14:      	sub	x1, x1, #0x1
    2b18:      	mov	x17, #0x18              ; =24
    2b1c:      	mul	x1, x1, x17
    2b20:      	ldr	x2, [x0, #0x28]
    2b24:      	add	x1, x1, x2
    2b28:      	ldr	x2, [x1]
    2b2c:      	ldr	x1, [x1, #0x8]
    2b30:      	ldr	x3, [x0, #0x8]
    2b34:      	cmp	x2, #0x0
    2b38:      	b.lt	0x2b98 <_stogir.strings.lookup+0xa0>
    2b3c:      	cmp	x2, x3
    2b40:      	b.gt	0x2b98 <_stogir.strings.lookup+0xa0>
    2b44:      	cmp	x1, #0x0
    2b48:      	b.lt	0x2b98 <_stogir.strings.lookup+0xa0>
    2b4c:      	sub	x3, x3, x2
    2b50:      	cmp	x1, x3
    2b54:      	b.gt	0x2b98 <_stogir.strings.lookup+0xa0>
    2b58:      	add	x1, x1, x2
    2b5c:      	lsr	x3, x2, #0
    2b60:      	sub	x1, x1, x2
    2b64:      	ldr	x0, [x0]
    2b68:      	add	x0, x3, x0
    2b6c:      	mov	x2, x1
    2b70:      	mov	x1, x0
    2b74:      	mov	x0, #0x1                ; =1
    2b78:      	b	0x2ba4 <_stogir.strings.lookup+0xac>
    2b7c:      	movz	x0, #0x0, lsl #48
    2b80:      	movz	x1, #0x0, lsl #48
    2b84:      	movz	x2, #0x0, lsl #48
    2b88:      	str	x0, [x8]
    2b8c:      	str	x1, [x8, #0x8]
    2b90:      	str	x2, [x8, #0x10]
    2b94:      	ret
    2b98:      	movz	x0, #0x0, lsl #48
    2b9c:      	movz	x1, #0x0, lsl #48
    2ba0:      	movz	x2, #0x0, lsl #48
    2ba4:      	b	0x2b88 <_stogir.strings.lookup+0x90>

0000000000002ba8 <_stogir.uses.edge-code?>:
    2ba8:      	ubfx	x0, x0, #0, #32
    2bac:      	cmp	x0, #0xf
    2bb0:      	b.hs	0x2be4 <_stogir.uses.edge-code?+0x3c>
    2bb4:      	mov	x16, #0x1               ; =1
    2bb8:      	lsl	x0, x16, x0
    2bbc:      	lsr	w0, w0, #0
    2bc0:      	mov	x17, #0x5e1c            ; =24092
    2bc4:      	and	x0, x0, x17
    2bc8:      	lsr	w0, w0, #0
    2bcc:      	cmp	x0, #0x0
    2bd0:      	cset	w0, eq
    2bd4:      	uxtb	w16, w0
    2bd8:      	cmp	w16, wzr
    2bdc:      	cset	x0, eq
    2be0:      	b	0x2be8 <_stogir.uses.edge-code?+0x40>
    2be4:      	movz	x0, #0x0, lsl #48
    2be8:      	ret

0000000000002bec <_stogir.graph.contains?>:
    2bec:      	sxtw	x1, w1
    2bf0:      	cmp	x1, #0x0
    2bf4:      	b.le	0x2c38 <_stogir.graph.contains?+0x4c>
    2bf8:      	ldr	x2, [x0, #0x8]
    2bfc:      	cmp	x1, x2
    2c00:      	b.ge	0x2c98 <_stogir.graph.contains?+0xac>
    2c04:      	add	x2, x0, #0x78
    2c08:      	ldr	x2, [x2, #0x8]
    2c0c:      	cmp	x1, x2
    2c10:      	b.ge	0x2ca8 <_stogir.graph.contains?+0xbc>
    2c14:      	lsl	x1, x1, #2
    2c18:      	ldr	x0, [x0, #0x78]
    2c1c:      	add	x0, x1, x0
    2c20:      	ldr	w0, [x0]
    2c24:      	sxtw	x0, w0
    2c28:      	cmp	x0, #0x0
    2c2c:      	cset	w0, ge
    2c30:      	ubfx	x0, x0, #0, #8
    2c34:      	b	0x2cac <_stogir.graph.contains?+0xc0>
    2c38:      	cmp	x1, #0x0
    2c3c:      	b.ge	0x2ca0 <_stogir.graph.contains?+0xb4>
    2c40:      	add	x2, x0, #0x28
    2c44:      	add	x3, x0, #0x50
    2c48:      	ldr	x2, [x2, #0x8]
    2c4c:      	ldr	x3, [x3, #0x8]
    2c50:      	cmp	x2, x3
    2c54:      	b.ne	0x2cb8 <_stogir.graph.contains?+0xcc>
    2c58:      	movz	x16, #0x0, lsl #48
    2c5c:      	sub	x3, x16, x1
    2c60:      	cmp	x3, x2
    2c64:      	b.gt	0x2cb0 <_stogir.graph.contains?+0xc4>
    2c68:      	movz	x16, #0x0, lsl #48
    2c6c:      	sub	x1, x16, x1
    2c70:      	sub	x1, x1, #0x1
    2c74:      	lsl	x1, x1, #2
    2c78:      	ldr	x0, [x0, #0x50]
    2c7c:      	add	x0, x1, x0
    2c80:      	ldr	w0, [x0]
    2c84:      	sxtw	x0, w0
    2c88:      	cmp	x0, #0x0
    2c8c:      	cset	w0, gt
    2c90:      	ubfx	x0, x0, #0, #8
    2c94:      	b	0x2cb4 <_stogir.graph.contains?+0xc8>
    2c98:      	movz	x0, #0x0, lsl #48
    2c9c:      	b	0x2cac <_stogir.graph.contains?+0xc0>
    2ca0:      	movz	x0, #0x0, lsl #48
    2ca4:      	b	0x2cb4 <_stogir.graph.contains?+0xc8>
    2ca8:      	movz	x0, #0x0, lsl #48
    2cac:      	b	0x2cb4 <_stogir.graph.contains?+0xc8>
    2cb0:      	movz	x0, #0x0, lsl #48
    2cb4:      	ret
    2cb8:      	movz	x0, #0x0, lsl #48
    2cbc:      	b	0x2cb4 <_stogir.graph.contains?+0xc8>

0000000000002cc0 <_stogir.opcode.optional-reference?>:
    2cc0:      	sub	sp, sp, #0x30
    2cc4:      	str	x29, [sp]
    2cc8:      	str	x30, [sp, #0x8]
    2ccc:      	mov	x29, sp
    2cd0:      	str	x19, [sp, #0x10]
    2cd4:      	str	x20, [sp, #0x18]
    2cd8:      	str	x21, [sp, #0x20]
    2cdc:      	lsr	w0, w0, #0
    2ce0:      	lsr	w2, w2, #0
    2ce4:      	mov	w19, w0
    2ce8:      	mov	w20, w1
    2cec:      	mov	w1, w2
    2cf0:      	mov	w21, w2
    2cf4:      	bl	0x2cf4 <_stogir.opcode.optional-reference?+0x34>
		0000000000002cf4:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
    2cf8:      	lsr	w0, w0, #0
    2cfc:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x1198>
		0000000000002cfc:  ARM64_RELOC_PAGE21	l_stogir.332
    2d00:      	ldr	x16, [x16]
		0000000000002d00:  ARM64_RELOC_PAGEOFF12	l_stogir.332
    2d04:      	ldr	w1, [x16]
    2d08:      	cmp	x0, x1
    2d0c:      	b.ne	0x2d38 <_stogir.opcode.optional-reference?+0x78>
    2d10:      	mov	x0, #0x1                ; =1
    2d14:      	b	0x2d1c <_stogir.opcode.optional-reference?+0x5c>
    2d18:      	movz	x0, #0x0, lsl #48
    2d1c:      	ldr	x19, [sp, #0x10]
    2d20:      	ldr	x20, [sp, #0x18]
    2d24:      	ldr	x21, [sp, #0x20]
    2d28:      	ldr	x29, [sp]
    2d2c:      	ldr	x30, [sp, #0x8]
    2d30:      	add	sp, sp, #0x30
    2d34:      	ret
    2d38:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x1198>
		0000000000002d38:  ARM64_RELOC_PAGE21	l_stogir.333
    2d3c:      	ldr	x16, [x16]
		0000000000002d3c:  ARM64_RELOC_PAGEOFF12	l_stogir.333
    2d40:      	ldr	w1, [x16]
    2d44:      	cmp	x0, x1
    2d48:      	b.ne	0x2d54 <_stogir.opcode.optional-reference?+0x94>
    2d4c:      	mov	x0, #0x1                ; =1
    2d50:      	b	0x2d1c <_stogir.opcode.optional-reference?+0x5c>
    2d54:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x1198>
		0000000000002d54:  ARM64_RELOC_PAGE21	l_stogir.334
    2d58:      	ldr	x16, [x16]
		0000000000002d58:  ARM64_RELOC_PAGEOFF12	l_stogir.334
    2d5c:      	ldr	w1, [x16]
    2d60:      	cmp	x0, x1
    2d64:      	b.ne	0x2d70 <_stogir.opcode.optional-reference?+0xb0>
    2d68:      	mov	x0, #0x1                ; =1
    2d6c:      	b	0x2d1c <_stogir.opcode.optional-reference?+0x5c>
    2d70:      	sxtw	x19, w19
    2d74:      	cmp	x19, #0x78
    2d78:      	b.ne	0x2d9c <_stogir.opcode.optional-reference?+0xdc>
    2d7c:      	sxtw	x20, w20
    2d80:      	cmp	x20, #0x0
    2d84:      	b.ne	0x2d18 <_stogir.opcode.optional-reference?+0x58>
    2d88:      	sxtw	x21, w21
    2d8c:      	cmp	x21, #0x2
    2d90:      	cset	w0, eq
    2d94:      	ubfx	x0, x0, #0, #8
    2d98:      	b	0x2d1c <_stogir.opcode.optional-reference?+0x5c>
    2d9c:      	movz	x0, #0x0, lsl #48
    2da0:      	b	0x2d1c <_stogir.opcode.optional-reference?+0x5c>

0000000000002da4 <_stogir.integer-binary.operation?>:
    2da4:      	sxtw	x0, w0
    2da8:      	cmp	x0, #0x1a
    2dac:      	b.lt	0x2dc0 <_stogir.integer-binary.operation?+0x1c>
    2db0:      	cmp	x0, #0x1e
    2db4:      	b.gt	0x2dc0 <_stogir.integer-binary.operation?+0x1c>
    2db8:      	mov	x0, #0x1                ; =1
    2dbc:      	b	0x2df4 <_stogir.integer-binary.operation?+0x50>
    2dc0:      	cmp	x0, #0x2e
    2dc4:      	b.lt	0x2dd8 <_stogir.integer-binary.operation?+0x34>
    2dc8:      	cmp	x0, #0x35
    2dcc:      	b.gt	0x2dd8 <_stogir.integer-binary.operation?+0x34>
    2dd0:      	mov	x0, #0x1                ; =1
    2dd4:      	b	0x2df4 <_stogir.integer-binary.operation?+0x50>
    2dd8:      	cmp	x0, #0x3a
    2ddc:      	b.ne	0x2de8 <_stogir.integer-binary.operation?+0x44>
    2de0:      	mov	x0, #0x1                ; =1
    2de4:      	b	0x2df4 <_stogir.integer-binary.operation?+0x50>
    2de8:      	cmp	x0, #0x3b
    2dec:      	cset	w0, eq
    2df0:      	ubfx	x0, x0, #0, #8
    2df4:      	ret

0000000000002df8 <_stogir.integer-unary.operation?>:
    2df8:      	sxtw	x0, w0
    2dfc:      	cmp	x0, #0x1f
    2e00:      	b.ne	0x2e1c <_stogir.integer-unary.operation?+0x24>
    2e04:      	mov	x0, #0x1                ; =1
    2e08:      	b	0x2e18 <_stogir.integer-unary.operation?+0x20>
    2e0c:      	cmp	x0, #0x39
    2e10:      	cset	w0, eq
    2e14:      	ubfx	x0, x0, #0, #8
    2e18:      	ret
    2e1c:      	cmp	x0, #0x20
    2e20:      	b.ne	0x2e2c <_stogir.integer-unary.operation?+0x34>
    2e24:      	mov	x0, #0x1                ; =1
    2e28:      	b	0x2e18 <_stogir.integer-unary.operation?+0x20>
    2e2c:      	cmp	x0, #0x2d
    2e30:      	b.ne	0x2e3c <_stogir.integer-unary.operation?+0x44>
    2e34:      	mov	x0, #0x1                ; =1
    2e38:      	b	0x2e18 <_stogir.integer-unary.operation?+0x20>
    2e3c:      	cmp	x0, #0x36
    2e40:      	b.ne	0x2e4c <_stogir.integer-unary.operation?+0x54>
    2e44:      	mov	x0, #0x1                ; =1
    2e48:      	b	0x2e18 <_stogir.integer-unary.operation?+0x20>
    2e4c:      	cmp	x0, #0x37
    2e50:      	b.ne	0x2e5c <_stogir.integer-unary.operation?+0x64>
    2e54:      	mov	x0, #0x1                ; =1
    2e58:      	b	0x2e18 <_stogir.integer-unary.operation?+0x20>
    2e5c:      	cmp	x0, #0x38
    2e60:      	b.ne	0x2e0c <_stogir.integer-unary.operation?+0x14>
    2e64:      	mov	x0, #0x1                ; =1
    2e68:      	b	0x2e18 <_stogir.integer-unary.operation?+0x20>

0000000000002e6c <_stogir.verify.classifications>:
    2e6c:      	sub	sp, sp, #0xf0
    2e70:      	str	x29, [sp]
    2e74:      	str	x30, [sp, #0x8]
    2e78:      	mov	x29, sp
    2e7c:      	str	x19, [sp, #0xa0]
    2e80:      	str	x20, [sp, #0xa8]
    2e84:      	str	x21, [sp, #0xb0]
    2e88:      	str	x22, [sp, #0xb8]
    2e8c:      	str	x23, [sp, #0xc0]
    2e90:      	str	x24, [sp, #0xc8]
    2e94:      	str	x25, [sp, #0xd0]
    2e98:      	str	x26, [sp, #0xd8]
    2e9c:      	str	x27, [sp, #0xe0]
    2ea0:      	str	x28, [sp, #0xe8]
    2ea4:      	ldr	w4, [x2]
    2ea8:      	orr	x5, x4, xzr
    2eac:      	ubfx	x5, x5, #8, #8
    2eb0:      	orr	x19, x5, xzr
    2eb4:      	cmp	x19, #0xf
    2eb8:      	b.le	0x2ef4 <_stogir.verify.classifications+0x88>
    2ebc:      	cmp	x19, #0x80
    2ec0:      	b.ge	0x2ee8 <_stogir.verify.classifications+0x7c>
    2ec4:      	and	x5, x19, #0xf
    2ec8:      	lsr	w5, w5, #0
    2ecc:      	sxtw	x5, w5
    2ed0:      	cmp	x5, #0x1
    2ed4:      	b.lt	0x3548 <_stogir.verify.classifications+0x6dc>
    2ed8:      	cmp	x5, #0xd
    2edc:      	cset	w5, le
    2ee0:      	ubfx	x5, x5, #0, #8
    2ee4:      	b	0x354c <_stogir.verify.classifications+0x6e0>
    2ee8:      	movz	x5, #0x0, lsl #48
    2eec:      	mov	x20, x5
    2ef0:      	b	0x2ef8 <_stogir.verify.classifications+0x8c>
    2ef4:      	movz	x20, #0x0, lsl #48
    2ef8:      	uxtb	w21, w4
    2efc:      	orr	x4, x21, xzr
    2f00:      	lsr	w22, w4, #0
    2f04:      	mov	x23, x0
    2f08:      	mov	w0, w22
    2f0c:      	mov	w24, w1
    2f10:      	mov	x25, x2
    2f14:      	mov	w26, w3
    2f18:      	bl	0x2f18 <_stogir.verify.classifications+0xac>
		0000000000002f18:  ARM64_RELOC_BRANCH26	_stogir.floating.operation?
    2f1c:      	cmp	x0, #0x0
    2f20:      	b.eq	0x2f40 <_stogir.verify.classifications+0xd4>
    2f24:      	cmp	x20, #0x0
    2f28:      	cset	w0, ne
    2f2c:      	uxtb	w16, w0
    2f30:      	cmp	w16, wzr
    2f34:      	cset	x0, eq
    2f38:      	mov	x27, x0
    2f3c:      	b	0x2f44 <_stogir.verify.classifications+0xd8>
    2f40:      	movz	x27, #0x0, lsl #48
    2f44:      	cmp	x27, #0x0
    2f48:      	cset	w28, ne
    2f4c:      	uxtb	w16, w28
    2f50:      	cmp	w16, wzr
    2f54:      	b.eq	0x2f88 <_stogir.verify.classifications+0x11c>
    2f58:      	ldr	w0, [x25, #0x4]
    2f5c:      	lsr	w0, w0, #0
    2f60:      	mov	w1, w0
    2f64:      	mov	x0, x23
    2f68:      	bl	0x2f68 <_stogir.verify.classifications+0xfc>
		0000000000002f68:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    2f6c:      	cmp	x0, #0x0
    2f70:      	b.ne	0x2f7c <_stogir.verify.classifications+0x110>
    2f74:      	movn	x0, #0x0, lsl #48
    2f78:      	b	0x2f84 <_stogir.verify.classifications+0x118>
    2f7c:      	ldr	w0, [x0]
    2f80:      	ubfx	x0, x0, #8, #8
    2f84:      	b	0x2f8c <_stogir.verify.classifications+0x120>
    2f88:      	movn	x0, #0x0, lsl #48
    2f8c:      	lsr	w0, w0, #0
    2f90:      	sxtw	x0, w0
    2f94:      	cmp	x0, #0xf
    2f98:      	cset	w1, gt
    2f9c:      	cmp	x0, #0x80
    2fa0:      	cset	w2, lt
    2fa4:      	and	x3, x0, #0xf
    2fa8:      	lsr	w3, w3, #0
    2fac:      	sxtw	x3, w3
    2fb0:      	cmp	x3, #0x1
    2fb4:      	cset	w4, ge
    2fb8:      	cmp	x3, #0xd
    2fbc:      	cset	w3, le
    2fc0:      	cmp	x27, #0x0
    2fc4:      	b.eq	0x301c <_stogir.verify.classifications+0x1b0>
    2fc8:      	uxtb	w16, w1
    2fcc:      	cmp	w16, wzr
    2fd0:      	b.eq	0x3550 <_stogir.verify.classifications+0x6e4>
    2fd4:      	uxtb	w16, w2
    2fd8:      	cmp	w16, wzr
    2fdc:      	b.eq	0x3550 <_stogir.verify.classifications+0x6e4>
    2fe0:      	uxtb	w16, w4
    2fe4:      	cmp	w16, wzr
    2fe8:      	b.eq	0x3550 <_stogir.verify.classifications+0x6e4>
    2fec:      	uxtb	w16, w3
    2ff0:      	cmp	w16, wzr
    2ff4:      	b.eq	0x3550 <_stogir.verify.classifications+0x6e4>
    2ff8:      	movz	x0, #0x0, lsl #48
    2ffc:      	b	0x3004 <_stogir.verify.classifications+0x198>
    3000:      	mov	x0, #0x1                ; =1
    3004:      	mov	x19, x0
    3008:      	b	0x3020 <_stogir.verify.classifications+0x1b4>
    300c:      	movz	x9, #0x0, lsl #48
    3010:      	b	0x3084 <_stogir.verify.classifications+0x218>
    3014:      	movz	x0, #0x0, lsl #48
    3018:      	b	0x308c <_stogir.verify.classifications+0x220>
    301c:      	movz	x19, #0x0, lsl #48
    3020:      	sxtw	x26, w26
    3024:      	ubfx	x21, x3, #0, #8
    3028:      	add	x27, x23, #0x78
    302c:      	add	x0, x23, #0x28
    3030:      	add	x3, x23, #0x50
    3034:      	sxtw	x24, w24
    3038:      	add	x5, x23, #0x78
    303c:      	add	x6, x23, #0x28
    3040:      	add	x7, x23, #0x50
    3044:      	cmp	x24, #0x0
    3048:      	cset	w8, le
    304c:      	lsl	x9, x24, #2
    3050:      	cmp	x24, #0x0
    3054:      	cset	w10, gt
    3058:      	cmp	x24, #0x0
    305c:      	cset	w11, lt
    3060:      	movz	x16, #0x0, lsl #48
    3064:      	sub	x12, x16, x24
    3068:      	sub	x13, x12, #0x1
    306c:      	lsl	x13, x13, #2
    3070:      	mov	x14, #0x1               ; =1
    3074:      	b	0x31b0 <_stogir.verify.classifications+0x344>
    3078:      	movz	x9, #0x0, lsl #48
    307c:      	b	0x30c0 <_stogir.verify.classifications+0x254>
    3080:      	movz	x9, #0x0, lsl #48
    3084:      	b	0x30d0 <_stogir.verify.classifications+0x264>
    3088:      	movz	x0, #0x0, lsl #48
    308c:      	ldr	x11, [sp, #0x58]
    3090:      	ldr	x12, [sp, #0x50]
    3094:      	ldr	x14, [sp, #0x48]
    3098:      	ldr	x2, [sp, #0x70]
    309c:      	ldr	w1, [sp, #0x78]
    30a0:      	ldr	x3, [sp, #0x68]
    30a4:      	ldr	x5, [sp, #0x60]
    30a8:      	ldr	x6, [sp, #0x80]
    30ac:      	ldr	x7, [sp, #0x88]
    30b0:      	mov	x4, x0
    30b4:      	ldr	x0, [sp, #0x90]
    30b8:      	b	0x3150 <_stogir.verify.classifications+0x2e4>
    30bc:      	movz	x9, #0x0, lsl #48
    30c0:      	ldr	x12, [sp, #0x50]
    30c4:      	ldr	x14, [sp, #0x48]
    30c8:      	b	0x30d0 <_stogir.verify.classifications+0x264>
    30cc:      	movz	x9, #0x0, lsl #48
    30d0:      	cmp	x9, #0x0
    30d4:      	b.eq	0x3104 <_stogir.verify.classifications+0x298>
    30d8:      	uxtb	w16, w8
    30dc:      	cmp	w16, wzr
    30e0:      	b.eq	0x30f4 <_stogir.verify.classifications+0x288>
    30e4:      	lsl	x4, x4, #4
    30e8:      	ldr	x8, [x23]
    30ec:      	add	x4, x4, x8
    30f0:      	b	0x3100 <_stogir.verify.classifications+0x294>
    30f4:      	lsl	x4, x10, #4
    30f8:      	ldr	x8, [x23, #0x28]
    30fc:      	add	x4, x4, x8
    3100:      	b	0x3108 <_stogir.verify.classifications+0x29c>
    3104:      	movz	x4, #0x0, lsl #48
    3108:      	cmp	x4, #0x0
    310c:      	b.eq	0x314c <_stogir.verify.classifications+0x2e0>
    3110:      	ldr	w4, [x4]
    3114:      	ubfx	x4, x4, #8, #8
    3118:      	cmp	x4, #0xf
    311c:      	b.le	0x314c <_stogir.verify.classifications+0x2e0>
    3120:      	cmp	x4, #0x80
    3124:      	b.ge	0x314c <_stogir.verify.classifications+0x2e0>
    3128:      	and	x4, x4, #0xf
    312c:      	lsr	w4, w4, #0
    3130:      	sxtw	x4, w4
    3134:      	cmp	x4, #0x1
    3138:      	b.lt	0x314c <_stogir.verify.classifications+0x2e0>
    313c:      	cmp	x4, #0xd
    3140:      	b.gt	0x314c <_stogir.verify.classifications+0x2e0>
    3144:      	mov	x4, #0x1                ; =1
    3148:      	b	0x3150 <_stogir.verify.classifications+0x2e4>
    314c:      	ldr	x4, [sp, #0x40]
    3150:      	add	x8, x20, #0x1
    3154:      	lsr	w8, w8, #0
    3158:      	sxtw	x8, w8
    315c:      	mov	x9, x2
    3160:      	mov	w2, w22
    3164:      	ldr	w22, [sp, #0x28]
    3168:      	mov	w10, w19
    316c:      	ldr	x19, [sp, #0x38]
    3170:      	mov	x13, x7
    3174:      	mov	x7, x5
    3178:      	mov	x5, x0
    317c:      	mov	x0, x12
    3180:      	mov	x12, x6
    3184:      	mov	x6, x3
    3188:      	mov	x3, x14
    318c:      	mov	x20, x4
    3190:      	mov	w4, w26
    3194:      	ldr	x26, [sp, #0x30]
    3198:      	mov	x14, x8
    319c:      	mov	w8, w27
    31a0:      	mov	x27, x11
    31a4:      	mov	w11, w1
    31a8:      	mov	w1, w21
    31ac:      	ldr	x21, [sp, #0x20]
    31b0:      	cmp	x20, #0x0
    31b4:      	b.ne	0x36cc <_stogir.verify.classifications+0x860>
    31b8:      	cmp	x14, x26
    31bc:      	b.gt	0x36d8 <_stogir.verify.classifications+0x86c>
    31c0:      	lsr	w15, w14, #0
    31c4:      	str	x0, [sp, #0x50]
    31c8:      	mov	w0, w22
    31cc:      	str	x3, [sp, #0x48]
    31d0:      	str	x5, [sp, #0x90]
    31d4:      	str	x6, [sp, #0x68]
    31d8:      	str	x7, [sp, #0x60]
    31dc:      	str	x9, [sp, #0x70]
    31e0:      	str	w11, [sp, #0x78]
    31e4:      	str	x12, [sp, #0x80]
    31e8:      	str	x13, [sp, #0x88]
    31ec:      	str	w15, [sp, #0x98]
    31f0:      	str	x21, [sp, #0x20]
    31f4:      	mov	w21, w1
    31f8:      	mov	w1, w15
    31fc:      	str	w22, [sp, #0x28]
    3200:      	mov	w22, w2
    3204:      	str	x26, [sp, #0x30]
    3208:      	mov	w26, w4
    320c:      	str	x19, [sp, #0x38]
    3210:      	mov	w19, w10
    3214:      	str	x20, [sp, #0x40]
    3218:      	mov	x20, x14
    321c:      	str	x27, [sp, #0x58]
    3220:      	mov	w27, w8
    3224:      	bl	0x3224 <_stogir.verify.classifications+0x3b8>
		0000000000003224:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
    3228:      	lsr	w0, w0, #0
    322c:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x194>
		000000000000322c:  ARM64_RELOC_PAGE21	l_stogir.335
    3230:      	ldr	x16, [x16]
		0000000000003230:  ARM64_RELOC_PAGEOFF12	l_stogir.335
    3234:      	ldr	w1, [x16]
    3238:      	cmp	x0, x1
    323c:      	b.eq	0x3284 <_stogir.verify.classifications+0x418>
    3240:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x194>
		0000000000003240:  ARM64_RELOC_PAGE21	l_stogir.336
    3244:      	ldr	x16, [x16]
		0000000000003244:  ARM64_RELOC_PAGEOFF12	l_stogir.336
    3248:      	ldr	w1, [x16]
    324c:      	cmp	x0, x1
    3250:      	b.eq	0x3284 <_stogir.verify.classifications+0x418>
    3254:      	ldr	x11, [sp, #0x58]
    3258:      	ldr	x12, [sp, #0x50]
    325c:      	ldr	x14, [sp, #0x48]
    3260:      	ldr	x2, [sp, #0x70]
    3264:      	ldr	x0, [sp, #0x90]
    3268:      	ldr	w1, [sp, #0x78]
    326c:      	ldr	x3, [sp, #0x68]
    3270:      	ldr	x5, [sp, #0x60]
    3274:      	ldr	x6, [sp, #0x80]
    3278:      	ldr	x7, [sp, #0x88]
    327c:      	ldr	x4, [sp, #0x40]
    3280:      	b	0x3150 <_stogir.verify.classifications+0x2e4>
    3284:      	cmp	x20, #0x1
    3288:      	b.ne	0x32c4 <_stogir.verify.classifications+0x458>
    328c:      	uxtb	w16, w28
    3290:      	cmp	w16, wzr
    3294:      	b.eq	0x32c4 <_stogir.verify.classifications+0x458>
    3298:      	uxtb	w16, w21
    329c:      	cmp	w16, wzr
    32a0:      	b.eq	0x3088 <_stogir.verify.classifications+0x21c>
    32a4:      	uxtb	w16, w22
    32a8:      	cmp	w16, wzr
    32ac:      	b.eq	0x3014 <_stogir.verify.classifications+0x1a8>
    32b0:      	uxtb	w16, w26
    32b4:      	cmp	w16, wzr
    32b8:      	b.eq	0x34e4 <_stogir.verify.classifications+0x678>
    32bc:      	ldr	x0, [sp, #0x20]
    32c0:      	b	0x34e8 <_stogir.verify.classifications+0x67c>
    32c4:      	cmp	x20, #0x1
    32c8:      	b.ne	0x335c <_stogir.verify.classifications+0x4f0>
    32cc:      	ldr	w0, [x25, #0x4]
    32d0:      	sxtw	x0, w0
    32d4:      	ldr	x2, [sp, #0x70]
    32d8:      	ldr	w1, [sp, #0x78]
    32dc:      	ldr	x3, [sp, #0x68]
    32e0:      	ldr	x5, [sp, #0x60]
    32e4:      	ldr	x6, [sp, #0x80]
    32e8:      	ldr	x7, [sp, #0x88]
    32ec:      	mov	x4, x0
    32f0:      	ldr	x0, [sp, #0x90]
    32f4:      	lsr	w4, w4, #0
    32f8:      	sxtw	x4, w4
    32fc:      	cmp	x4, #0x0
    3300:      	cset	w8, gt
    3304:      	movz	x16, #0x0, lsl #48
    3308:      	sub	x9, x16, x4
    330c:      	sub	x10, x9, #0x1
    3310:      	uxtb	w16, w8
    3314:      	cmp	w16, wzr
    3318:      	b.eq	0x36e4 <_stogir.verify.classifications+0x878>
    331c:      	ldr	x9, [x23, #0x8]
    3320:      	cmp	x4, x9
    3324:      	b.ge	0x36ec <_stogir.verify.classifications+0x880>
    3328:      	ldr	x11, [sp, #0x58]
    332c:      	ldr	x9, [x11, #0x8]
    3330:      	cmp	x4, x9
    3334:      	b.ge	0x3078 <_stogir.verify.classifications+0x20c>
    3338:      	lsl	x9, x4, #2
    333c:      	ldr	x12, [x23, #0x78]
    3340:      	add	x9, x9, x12
    3344:      	ldr	w9, [x9]
    3348:      	sxtw	x9, w9
    334c:      	cmp	x9, #0x0
    3350:      	cset	w9, ge
    3354:      	ubfx	x9, x9, #0, #8
    3358:      	b	0x307c <_stogir.verify.classifications+0x210>
    335c:      	cmp	x20, #0x2
    3360:      	b.ne	0x33dc <_stogir.verify.classifications+0x570>
    3364:      	ldr	w0, [x25, #0x8]
    3368:      	sxtw	x0, w0
    336c:      	ldr	x2, [sp, #0x70]
    3370:      	ldr	w1, [sp, #0x78]
    3374:      	ldr	x3, [sp, #0x68]
    3378:      	ldr	x5, [sp, #0x60]
    337c:      	ldr	x6, [sp, #0x80]
    3380:      	ldr	x7, [sp, #0x88]
    3384:      	mov	x4, x0
    3388:      	ldr	x0, [sp, #0x90]
    338c:      	b	0x32f4 <_stogir.verify.classifications+0x488>
    3390:      	cmp	x4, #0x0
    3394:      	b.ge	0x36f4 <_stogir.verify.classifications+0x888>
    3398:      	ldr	x12, [sp, #0x50]
    339c:      	ldr	x13, [x12, #0x8]
    33a0:      	ldr	x14, [sp, #0x48]
    33a4:      	ldr	x15, [x14, #0x8]
    33a8:      	cmp	x13, x15
    33ac:      	b.ne	0x3080 <_stogir.verify.classifications+0x214>
    33b0:      	cmp	x9, x13
    33b4:      	b.gt	0x300c <_stogir.verify.classifications+0x1a0>
    33b8:      	lsl	x9, x10, #2
    33bc:      	ldr	x13, [x23, #0x50]
    33c0:      	add	x9, x9, x13
    33c4:      	ldr	w9, [x9]
    33c8:      	sxtw	x9, w9
    33cc:      	cmp	x9, #0x0
    33d0:      	cset	w9, gt
    33d4:      	ubfx	x9, x9, #0, #8
    33d8:      	b	0x3010 <_stogir.verify.classifications+0x1a4>
    33dc:      	cmp	x20, #0x3
    33e0:      	b.ne	0x347c <_stogir.verify.classifications+0x610>
    33e4:      	ldr	w0, [x25, #0xc]
    33e8:      	sxtw	x0, w0
    33ec:      	ldr	x2, [sp, #0x70]
    33f0:      	ldr	w1, [sp, #0x78]
    33f4:      	ldr	x3, [sp, #0x68]
    33f8:      	ldr	x5, [sp, #0x60]
    33fc:      	ldr	x6, [sp, #0x80]
    3400:      	ldr	x7, [sp, #0x88]
    3404:      	mov	x4, x0
    3408:      	ldr	x0, [sp, #0x90]
    340c:      	b	0x338c <_stogir.verify.classifications+0x520>
    3410:      	ldr	x0, [sp, #0x40]
    3414:      	uxtb	w0, w0
    3418:      	ldr	x1, [sp, #0x38]
    341c:      	uxtb	w1, w1
    3420:      	add	x16, sp, #0x10
    3424:      	movz	w17, #0x0, lsl #16
    3428:      	strh	w17, [x16]
    342c:      	add	x16, sp, #0x10
    3430:      	strb	w0, [x16]
    3434:      	add	x16, sp, #0x10
    3438:      	strb	w1, [x16, #0x1]
    343c:      	add	x16, sp, #0x10
    3440:      	ldrh	w0, [x16]
    3444:      	ldr	x19, [sp, #0xa0]
    3448:      	ldr	x20, [sp, #0xa8]
    344c:      	ldr	x21, [sp, #0xb0]
    3450:      	ldr	x22, [sp, #0xb8]
    3454:      	ldr	x23, [sp, #0xc0]
    3458:      	ldr	x24, [sp, #0xc8]
    345c:      	ldr	x25, [sp, #0xd0]
    3460:      	ldr	x26, [sp, #0xd8]
    3464:      	ldr	x27, [sp, #0xe0]
    3468:      	ldr	x28, [sp, #0xe8]
    346c:      	ldr	x29, [sp]
    3470:      	ldr	x30, [sp, #0x8]
    3474:      	add	sp, sp, #0xf0
    3478:      	ret
    347c:      	uxtb	w16, w27
    3480:      	cmp	w16, wzr
    3484:      	b.eq	0x34fc <_stogir.verify.classifications+0x690>
    3488:      	ldr	x2, [sp, #0x70]
    348c:      	ldr	x0, [sp, #0x90]
    3490:      	ldr	w1, [sp, #0x78]
    3494:      	ldr	x3, [sp, #0x68]
    3498:      	ldr	x5, [sp, #0x60]
    349c:      	ldr	x6, [sp, #0x80]
    34a0:      	ldr	x7, [sp, #0x88]
    34a4:      	movz	x4, #0x0, lsl #48
    34a8:      	movz	x8, #0x0, lsl #48
    34ac:      	lsr	w4, w4, #0
    34b0:      	lsr	x16, x4, #0
    34b4:      	cmp	x16, #0x1
    34b8:      	b.eq	0x34d4 <_stogir.verify.classifications+0x668>
    34bc:      	b.lo	0x34c4 <_stogir.verify.classifications+0x658>
    34c0:      	b	0x34d8 <_stogir.verify.classifications+0x66c>
    34c4:      	cmp	x16, #0x0
    34c8:      	b.eq	0x34d0 <_stogir.verify.classifications+0x664>
    34cc:      	b	0x34d8 <_stogir.verify.classifications+0x66c>
    34d0:      	b	0x34dc <_stogir.verify.classifications+0x670>
    34d4:      	b	0x34ec <_stogir.verify.classifications+0x680>
    34d8:      	b	0x36c4 <_stogir.verify.classifications+0x858>
    34dc:      	movz	x4, #0x0, lsl #48
    34e0:      	b	0x34f8 <_stogir.verify.classifications+0x68c>
    34e4:      	movz	x0, #0x0, lsl #48
    34e8:      	b	0x3018 <_stogir.verify.classifications+0x1ac>
    34ec:      	lsr	w8, w8, #0
    34f0:      	sxtw	x8, w8
    34f4:      	mov	x4, x8
    34f8:      	b	0x340c <_stogir.verify.classifications+0x5a0>
    34fc:      	uxtb	w16, w19
    3500:      	cmp	w16, wzr
    3504:      	b.eq	0x3700 <_stogir.verify.classifications+0x894>
    3508:      	ldr	x0, [x23, #0x8]
    350c:      	cmp	x24, x0
    3510:      	b.ge	0x370c <_stogir.verify.classifications+0x8a0>
    3514:      	ldr	x0, [sp, #0x90]
    3518:      	ldr	x1, [x0, #0x8]
    351c:      	cmp	x24, x1
    3520:      	b.ge	0x3718 <_stogir.verify.classifications+0x8ac>
    3524:      	ldr	x1, [x23, #0x78]
    3528:      	ldr	x2, [sp, #0x70]
    352c:      	add	x1, x2, x1
    3530:      	ldr	w1, [x1]
    3534:      	sxtw	x1, w1
    3538:      	cmp	x1, #0x0
    353c:      	cset	w1, ge
    3540:      	ubfx	x1, x1, #0, #8
    3544:      	b	0x36a8 <_stogir.verify.classifications+0x83c>
    3548:      	movz	x5, #0x0, lsl #48
    354c:      	b	0x2eec <_stogir.verify.classifications+0x80>
    3550:      	cmp	x21, #0x18
    3554:      	b.ne	0x3560 <_stogir.verify.classifications+0x6f4>
    3558:      	mov	x0, #0x1                ; =1
    355c:      	b	0x3004 <_stogir.verify.classifications+0x198>
    3560:      	cmp	x21, #0x19
    3564:      	b.ne	0x367c <_stogir.verify.classifications+0x810>
    3568:      	mov	x0, #0x1                ; =1
    356c:      	b	0x3004 <_stogir.verify.classifications+0x198>
    3570:      	movz	x4, #0x0, lsl #48
    3574:      	movz	x8, #0x0, lsl #48
    3578:      	b	0x34ac <_stogir.verify.classifications+0x640>
    357c:      	ldr	w1, [sp, #0x78]
    3580:      	uxtb	w16, w1
    3584:      	cmp	w16, wzr
    3588:      	b.eq	0x3720 <_stogir.verify.classifications+0x8b4>
    358c:      	ldr	x3, [sp, #0x68]
    3590:      	ldr	x4, [x3, #0x8]
    3594:      	ldr	x5, [sp, #0x60]
    3598:      	ldr	x6, [x5, #0x8]
    359c:      	cmp	x4, x6
    35a0:      	b.ne	0x3734 <_stogir.verify.classifications+0x8c8>
    35a4:      	ldr	x6, [sp, #0x80]
    35a8:      	cmp	x6, x4
    35ac:      	b.gt	0x3740 <_stogir.verify.classifications+0x8d4>
    35b0:      	ldr	x4, [x23, #0x50]
    35b4:      	ldr	x7, [sp, #0x88]
    35b8:      	add	x4, x7, x4
    35bc:      	ldr	w4, [x4]
    35c0:      	sxtw	x4, w4
    35c4:      	cmp	x4, #0x0
    35c8:      	cset	w4, gt
    35cc:      	ubfx	x4, x4, #0, #8
    35d0:      	b	0x36b0 <_stogir.verify.classifications+0x844>
    35d4:      	movz	x1, #0x0, lsl #48
    35d8:      	ldr	x3, [sp, #0x68]
    35dc:      	ldr	x5, [sp, #0x60]
    35e0:      	ldr	x6, [sp, #0x80]
    35e4:      	ldr	x7, [sp, #0x88]
    35e8:      	mov	x4, x1
    35ec:      	ldr	w1, [sp, #0x78]
    35f0:      	b	0x35f8 <_stogir.verify.classifications+0x78c>
    35f4:      	movz	x4, #0x0, lsl #48
    35f8:      	cmp	x4, #0x0
    35fc:      	b.eq	0x34a4 <_stogir.verify.classifications+0x638>
    3600:      	ldr	w4, [sp, #0x98]
    3604:      	sxtw	x4, w4
    3608:      	cmp	x4, #0x1
    360c:      	b.lt	0x3570 <_stogir.verify.classifications+0x704>
    3610:      	ldr	x8, [x23, #0x78]
    3614:      	add	x8, x2, x8
    3618:      	ldr	w8, [x8]
    361c:      	sxtw	x8, w8
    3620:      	cmp	x4, x8
    3624:      	b.gt	0x3570 <_stogir.verify.classifications+0x704>
    3628:      	ldr	x8, [x23]
    362c:      	asr	x16, x4, #63
    3630:      	lsr	x16, x16, #62
    3634:      	add	x9, x4, x16
    3638:      	asr	x9, x9, #2
    363c:      	asr	x16, x4, #63
    3640:      	lsr	x16, x16, #62
    3644:      	add	x4, x4, x16
    3648:      	and	x4, x4, #0x3
    364c:      	sub	x4, x4, x16
    3650:      	add	x9, x9, x24
    3654:      	lsl	x4, x4, #2
    3658:      	lsl	x9, x9, #4
    365c:      	add	x8, x9, x8
    3660:      	add	x4, x4, x8
    3664:      	ldr	w4, [x4]
    3668:      	sxtw	x4, w4
    366c:      	and	x4, x4, #0xffffffff
    3670:      	mov	x8, x4
    3674:      	mov	x4, #0x1                ; =1
    3678:      	b	0x3578 <_stogir.verify.classifications+0x70c>
    367c:      	cmp	x19, #0xc
    3680:      	b.eq	0x3000 <_stogir.verify.classifications+0x194>
    3684:      	cmp	x19, #0xd
    3688:      	b.eq	0x3000 <_stogir.verify.classifications+0x194>
    368c:      	cmp	x0, #0xc
    3690:      	b.ne	0x36b4 <_stogir.verify.classifications+0x848>
    3694:      	mov	x0, #0x1                ; =1
    3698:      	b	0x36c0 <_stogir.verify.classifications+0x854>
    369c:      	movz	x4, #0x0, lsl #48
    36a0:      	b	0x35f8 <_stogir.verify.classifications+0x78c>
    36a4:      	movz	x1, #0x0, lsl #48
    36a8:      	b	0x35d8 <_stogir.verify.classifications+0x76c>
    36ac:      	movz	x4, #0x0, lsl #48
    36b0:      	b	0x36a0 <_stogir.verify.classifications+0x834>
    36b4:      	cmp	x0, #0xd
    36b8:      	cset	w0, eq
    36bc:      	ubfx	x0, x0, #0, #8
    36c0:      	b	0x3004 <_stogir.verify.classifications+0x198>
    36c4:      	brk	#0
    36c8:      	b	0x36c4 <_stogir.verify.classifications+0x858>
    36cc:      	str	x19, [sp, #0x38]
    36d0:      	str	x20, [sp, #0x40]
    36d4:      	b	0x3410 <_stogir.verify.classifications+0x5a4>
    36d8:      	str	x19, [sp, #0x38]
    36dc:      	str	x20, [sp, #0x40]
    36e0:      	b	0x3410 <_stogir.verify.classifications+0x5a4>
    36e4:      	ldr	x11, [sp, #0x58]
    36e8:      	b	0x3390 <_stogir.verify.classifications+0x524>
    36ec:      	ldr	x11, [sp, #0x58]
    36f0:      	b	0x30bc <_stogir.verify.classifications+0x250>
    36f4:      	ldr	x12, [sp, #0x50]
    36f8:      	ldr	x14, [sp, #0x48]
    36fc:      	b	0x30cc <_stogir.verify.classifications+0x260>
    3700:      	ldr	x2, [sp, #0x70]
    3704:      	ldr	x0, [sp, #0x90]
    3708:      	b	0x357c <_stogir.verify.classifications+0x710>
    370c:      	ldr	x2, [sp, #0x70]
    3710:      	ldr	x0, [sp, #0x90]
    3714:      	b	0x35d4 <_stogir.verify.classifications+0x768>
    3718:      	ldr	x2, [sp, #0x70]
    371c:      	b	0x36a4 <_stogir.verify.classifications+0x838>
    3720:      	ldr	x3, [sp, #0x68]
    3724:      	ldr	x5, [sp, #0x60]
    3728:      	ldr	x6, [sp, #0x80]
    372c:      	ldr	x7, [sp, #0x88]
    3730:      	b	0x35f4 <_stogir.verify.classifications+0x788>
    3734:      	ldr	x6, [sp, #0x80]
    3738:      	ldr	x7, [sp, #0x88]
    373c:      	b	0x369c <_stogir.verify.classifications+0x830>
    3740:      	ldr	x7, [sp, #0x88]
    3744:      	b	0x36ac <_stogir.verify.classifications+0x840>

0000000000003748 <_stogir.vector-lanes.operation?>:
    3748:      	sxtw	x0, w0
    374c:      	cmp	x0, #0x3d
    3750:      	b.lt	0x3764 <_stogir.vector-lanes.operation?+0x1c>
    3754:      	cmp	x0, #0x3f
    3758:      	cset	w0, le
    375c:      	ubfx	x0, x0, #0, #8
    3760:      	b	0x3768 <_stogir.vector-lanes.operation?+0x20>
    3764:      	movz	x0, #0x0, lsl #48
    3768:      	ret
    376c:      	udf	#0x0

0000000000003770 <_stogir.vector.validate>:
    3770:      	sub	sp, sp, #0x250
    3774:      	str	x29, [sp]
    3778:      	str	x30, [sp, #0x8]
    377c:      	mov	x29, sp
    3780:      	str	x19, [sp, #0x1f8]
    3784:      	str	x20, [sp, #0x200]
    3788:      	str	x21, [sp, #0x208]
    378c:      	str	x22, [sp, #0x210]
    3790:      	str	x23, [sp, #0x218]
    3794:      	str	x24, [sp, #0x220]
    3798:      	str	x25, [sp, #0x228]
    379c:      	str	x26, [sp, #0x230]
    37a0:      	str	x27, [sp, #0x238]
    37a4:      	str	x28, [sp, #0x240]
    37a8:      	lsr	w19, w1, #0
    37ac:      	mov	x20, x8
    37b0:      	add	x8, sp, #0x10
    37b4:      	mov	x21, x0
    37b8:      	mov	w22, w1
    37bc:      	mov	w1, w19
    37c0:      	mov	w23, w2
    37c4:      	bl	0x37c4 <_stogir.vector.validate+0x54>
		00000000000037c4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    37c8:      	add	x16, sp, #0x10
    37cc:      	ldr	w0, [x16]
    37d0:      	lsr	x16, x0, #0
    37d4:      	cmp	x16, #0x1
    37d8:      	b.eq	0x37f4 <_stogir.vector.validate+0x84>
    37dc:      	b.lo	0x37e4 <_stogir.vector.validate+0x74>
    37e0:      	b	0x37f8 <_stogir.vector.validate+0x88>
    37e4:      	cmp	x16, #0x0
    37e8:      	b.eq	0x37f0 <_stogir.vector.validate+0x80>
    37ec:      	b	0x37f8 <_stogir.vector.validate+0x88>
    37f0:      	b	0x37fc <_stogir.vector.validate+0x8c>
    37f4:      	b	0x3894 <_stogir.vector.validate+0x124>
    37f8:      	b	0x3abc <_stogir.vector.validate+0x34c>
    37fc:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x194>
		00000000000037fc:  ARM64_RELOC_PAGE21	l_stogir.337
    3800:      	ldr	x16, [x16]
		0000000000003800:  ARM64_RELOC_PAGEOFF12	l_stogir.337
    3804:      	orr	x0, x16, xzr
    3808:      	str	x20, [sp, #0x1c8]
    380c:      	mov	x1, x0
    3810:      	mov	x0, #0x1                ; =1
    3814:      	mov	x2, #0x1a               ; =26
    3818:      	b	0x384c <_stogir.vector.validate+0xdc>
    381c:      	lsr	w23, w23, #0
    3820:      	add	x8, sp, #0x70
    3824:      	mov	x0, x21
    3828:      	ldr	w1, [sp, #0x1c0]
    382c:      	mov	w2, w23
    3830:      	bl	0x3830 <_stogir.vector.validate+0xc0>
		0000000000003830:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    3834:      	add	x16, sp, #0x70
    3838:      	ldr	x0, [x16]
    383c:      	add	x16, sp, #0x70
    3840:      	ldr	x1, [x16, #0x8]
    3844:      	add	x16, sp, #0x70
    3848:      	ldr	x2, [x16, #0x10]
    384c:      	ldr	x3, [sp, #0x1c8]
    3850:      	str	x0, [x3]
    3854:      	str	x1, [x3, #0x8]
    3858:      	str	x2, [x3, #0x10]
    385c:      	ldr	x19, [sp, #0x1f8]
    3860:      	ldr	x20, [sp, #0x200]
    3864:      	ldr	x21, [sp, #0x208]
    3868:      	ldr	x22, [sp, #0x210]
    386c:      	ldr	x23, [sp, #0x218]
    3870:      	ldr	x24, [sp, #0x220]
    3874:      	ldr	x25, [sp, #0x228]
    3878:      	ldr	x26, [sp, #0x230]
    387c:      	ldr	x27, [sp, #0x238]
    3880:      	ldr	x28, [sp, #0x240]
    3884:      	ldr	x29, [sp]
    3888:      	ldr	x30, [sp, #0x8]
    388c:      	add	sp, sp, #0x250
    3890:      	ret
    3894:      	sxtw	x22, w22
    3898:      	add	x16, sp, #0x10
    389c:      	orr	x0, x16, xzr
    38a0:      	cmp	x22, #0x0
    38a4:      	cset	w24, le
    38a8:      	add	x0, x0, #0x8
    38ac:      	add	x16, sp, #0x10
    38b0:      	ldr	x1, [x16, #0x8]
    38b4:      	add	x16, sp, #0x40
    38b8:      	str	x1, [x16]
    38bc:      	ldr	x0, [x0, #0x8]
    38c0:      	add	x16, sp, #0x40
    38c4:      	str	x0, [x16, #0x8]
    38c8:      	uxtb	w16, w24
    38cc:      	cmp	w16, wzr
    38d0:      	b.eq	0x38f4 <_stogir.vector.validate+0x184>
    38d4:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x194>
		00000000000038d4:  ARM64_RELOC_PAGE21	l_stogir.338
    38d8:      	ldr	x16, [x16]
		00000000000038d8:  ARM64_RELOC_PAGEOFF12	l_stogir.338
    38dc:      	orr	x0, x16, xzr
    38e0:      	str	x20, [sp, #0x1c8]
    38e4:      	mov	x1, x0
    38e8:      	mov	x0, #0x1                ; =1
    38ec:      	mov	x2, #0x3b               ; =59
    38f0:      	b	0x384c <_stogir.vector.validate+0xdc>
    38f4:      	lsl	x25, x22, #2
    38f8:      	add	x16, sp, #0x40
    38fc:      	ldr	w26, [x16]
    3900:      	uxtb	w0, w26
    3904:      	ldr	x1, [x21, #0x78]
    3908:      	orr	x27, x0, xzr
    390c:      	cmp	x27, #0x44
    3910:      	cset	w0, eq
    3914:      	add	x1, x25, x1
    3918:      	ldr	w28, [x1]
    391c:      	cmp	x27, #0x24
    3920:      	b.ne	0x3964 <_stogir.vector.validate+0x1f4>
    3924:      	str	x20, [sp, #0x1c8]
    3928:      	str	w19, [sp, #0x1c0]
    392c:      	uxtb	w16, w0
    3930:      	cmp	w16, wzr
    3934:      	b.eq	0x381c <_stogir.vector.validate+0xac>
    3938:      	add	x8, sp, #0x50
    393c:      	mov	x0, x21
    3940:      	ldr	w1, [sp, #0x1c0]
    3944:      	bl	0x3944 <_stogir.vector.validate+0x1d4>
		0000000000003944:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    3948:      	add	x16, sp, #0x50
    394c:      	ldr	x0, [x16]
    3950:      	add	x16, sp, #0x50
    3954:      	ldr	x1, [x16, #0x8]
    3958:      	add	x16, sp, #0x50
    395c:      	ldr	x2, [x16, #0x10]
    3960:      	b	0x384c <_stogir.vector.validate+0xdc>
    3964:      	uxtb	w16, w0
    3968:      	cmp	w16, wzr
    396c:      	b.ne	0x4328 <_stogir.vector.validate+0xbb8>
    3970:      	cmp	x27, #0x3c
    3974:      	b.ne	0x3a28 <_stogir.vector.validate+0x2b8>
    3978:      	add	x8, sp, #0x90
    397c:      	mov	x0, x21
    3980:      	mov	w1, w19
    3984:      	bl	0x3984 <_stogir.vector.validate+0x214>
		0000000000003984:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    3988:      	add	x16, sp, #0x90
    398c:      	ldr	x0, [x16]
    3990:      	add	x16, sp, #0x90
    3994:      	ldr	x1, [x16, #0x8]
    3998:      	add	x16, sp, #0x90
    399c:      	ldr	x2, [x16, #0x10]
    39a0:      	str	x20, [sp, #0x1c8]
    39a4:      	b	0x3a24 <_stogir.vector.validate+0x2b4>
    39a8:      	cmp	x27, #0x41
    39ac:      	cset	w0, eq
    39b0:      	cmp	x27, #0x48
    39b4:      	cset	w1, eq
    39b8:      	cmp	x27, #0x55
    39bc:      	cset	w2, ge
    39c0:      	cmp	x27, #0x58
    39c4:      	cset	w3, le
    39c8:      	cmp	x27, #0x47
    39cc:      	b.ne	0x3ac4 <_stogir.vector.validate+0x354>
    39d0:      	str	x20, [sp, #0x1c8]
    39d4:      	str	w19, [sp, #0x1c0]
    39d8:      	mov	w19, w0
    39dc:      	mov	w20, w1
    39e0:      	str	w2, [sp, #0x1d0]
    39e4:      	str	w3, [sp, #0x1d8]
    39e8:      	mov	x0, x21
    39ec:      	ldr	w1, [sp, #0x1c0]
    39f0:      	bl	0x39f0 <_stogir.vector.validate+0x280>
		00000000000039f0:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    39f4:      	cmp	x0, #0x0
    39f8:      	b.eq	0x3ae8 <_stogir.vector.validate+0x378>
    39fc:      	add	x8, sp, #0xf0
    3a00:      	mov	x0, x21
    3a04:      	ldr	w1, [sp, #0x1c0]
    3a08:      	bl	0x3a08 <_stogir.vector.validate+0x298>
		0000000000003a08:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.validate
    3a0c:      	add	x16, sp, #0xf0
    3a10:      	ldr	x0, [x16]
    3a14:      	add	x16, sp, #0xf0
    3a18:      	ldr	x1, [x16, #0x8]
    3a1c:      	add	x16, sp, #0xf0
    3a20:      	ldr	x2, [x16, #0x10]
    3a24:      	b	0x384c <_stogir.vector.validate+0xdc>
    3a28:      	cmp	x27, #0x3d
    3a2c:      	b.lt	0x3a70 <_stogir.vector.validate+0x300>
    3a30:      	cmp	x27, #0x3f
    3a34:      	b.gt	0x3a70 <_stogir.vector.validate+0x300>
    3a38:      	lsr	w23, w23, #0
    3a3c:      	add	x8, sp, #0xb0
    3a40:      	mov	x0, x21
    3a44:      	mov	w1, w19
    3a48:      	mov	w2, w23
    3a4c:      	bl	0x3a4c <_stogir.vector.validate+0x2dc>
		0000000000003a4c:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.validate
    3a50:      	add	x16, sp, #0xb0
    3a54:      	ldr	x0, [x16]
    3a58:      	add	x16, sp, #0xb0
    3a5c:      	ldr	x1, [x16, #0x8]
    3a60:      	add	x16, sp, #0xb0
    3a64:      	ldr	x2, [x16, #0x10]
    3a68:      	str	x20, [sp, #0x1c8]
    3a6c:      	b	0x3a24 <_stogir.vector.validate+0x2b4>
    3a70:      	mov	x0, x21
    3a74:      	mov	w1, w19
    3a78:      	bl	0x3a78 <_stogir.vector.validate+0x308>
		0000000000003a78:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.node?
    3a7c:      	cmp	x0, #0x0
    3a80:      	b.eq	0x39a8 <_stogir.vector.validate+0x238>
    3a84:      	lsr	w23, w23, #0
    3a88:      	add	x8, sp, #0xd0
    3a8c:      	mov	x0, x21
    3a90:      	mov	w1, w19
    3a94:      	mov	w2, w23
    3a98:      	bl	0x3a98 <_stogir.vector.validate+0x328>
		0000000000003a98:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.validate
    3a9c:      	add	x16, sp, #0xd0
    3aa0:      	ldr	x0, [x16]
    3aa4:      	add	x16, sp, #0xd0
    3aa8:      	ldr	x1, [x16, #0x8]
    3aac:      	add	x16, sp, #0xd0
    3ab0:      	ldr	x2, [x16, #0x10]
    3ab4:      	str	x20, [sp, #0x1c8]
    3ab8:      	b	0x3a24 <_stogir.vector.validate+0x2b4>
    3abc:      	brk	#0
    3ac0:      	b	0x3abc <_stogir.vector.validate+0x34c>
    3ac4:      	cmp	x27, #0x4f
    3ac8:      	b.ne	0x3b64 <_stogir.vector.validate+0x3f4>
    3acc:      	str	x20, [sp, #0x1c8]
    3ad0:      	str	w19, [sp, #0x1c0]
    3ad4:      	mov	w19, w0
    3ad8:      	mov	w20, w1
    3adc:      	str	w2, [sp, #0x1d0]
    3ae0:      	str	w3, [sp, #0x1d8]
    3ae4:      	b	0x39e8 <_stogir.vector.validate+0x278>
    3ae8:      	uxtb	w16, w19
    3aec:      	cmp	w16, wzr
    3af0:      	b.ne	0x3b30 <_stogir.vector.validate+0x3c0>
    3af4:      	uxtb	w16, w20
    3af8:      	cmp	w16, wzr
    3afc:      	b.ne	0x3b30 <_stogir.vector.validate+0x3c0>
    3b00:      	ldr	w0, [sp, #0x1d0]
    3b04:      	uxtb	w16, w0
    3b08:      	cmp	w16, wzr
    3b0c:      	b.eq	0x3b20 <_stogir.vector.validate+0x3b0>
    3b10:      	ldr	w0, [sp, #0x1d8]
    3b14:      	uxtb	w16, w0
    3b18:      	cmp	w16, wzr
    3b1c:      	b.ne	0x3b30 <_stogir.vector.validate+0x3c0>
    3b20:      	movz	x0, #0x0, lsl #48
    3b24:      	movz	x1, #0x0, lsl #48
    3b28:      	movz	x2, #0x0, lsl #48
    3b2c:      	b	0x3b60 <_stogir.vector.validate+0x3f0>
    3b30:      	lsr	w23, w23, #0
    3b34:      	add	x8, sp, #0x110
    3b38:      	mov	x0, x21
    3b3c:      	ldr	w1, [sp, #0x1c0]
    3b40:      	mov	w2, w23
    3b44:      	bl	0x3b44 <_stogir.vector.validate+0x3d4>
		0000000000003b44:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    3b48:      	add	x16, sp, #0x110
    3b4c:      	ldr	x0, [x16]
    3b50:      	add	x16, sp, #0x110
    3b54:      	ldr	x1, [x16, #0x8]
    3b58:      	add	x16, sp, #0x110
    3b5c:      	ldr	x2, [x16, #0x10]
    3b60:      	b	0x3a24 <_stogir.vector.validate+0x2b4>
    3b64:      	cmp	x27, #0x50
    3b68:      	b.eq	0x4334 <_stogir.vector.validate+0xbc4>
    3b6c:      	cmp	x27, #0x78
    3b70:      	b.ne	0x3b90 <_stogir.vector.validate+0x420>
    3b74:      	str	x20, [sp, #0x1c8]
    3b78:      	str	w19, [sp, #0x1c0]
    3b7c:      	mov	w19, w0
    3b80:      	mov	w20, w1
    3b84:      	str	w2, [sp, #0x1d0]
    3b88:      	str	w3, [sp, #0x1d8]
    3b8c:      	b	0x39e8 <_stogir.vector.validate+0x278>
    3b90:      	uxtb	w16, w0
    3b94:      	cmp	w16, wzr
    3b98:      	b.ne	0x3c78 <_stogir.vector.validate+0x508>
    3b9c:      	uxtb	w16, w1
    3ba0:      	cmp	w16, wzr
    3ba4:      	b.ne	0x3c78 <_stogir.vector.validate+0x508>
    3ba8:      	uxtb	w16, w2
    3bac:      	cmp	w16, wzr
    3bb0:      	b.eq	0x3bc0 <_stogir.vector.validate+0x450>
    3bb4:      	uxtb	w16, w3
    3bb8:      	cmp	w16, wzr
    3bbc:      	b.ne	0x3c78 <_stogir.vector.validate+0x508>
    3bc0:      	str	w2, [sp, #0x1d0]
    3bc4:      	str	w3, [sp, #0x1d8]
    3bc8:      	str	w19, [sp, #0x1c0]
    3bcc:      	str	x20, [sp, #0x1c8]
    3bd0:      	mov	w20, w1
    3bd4:      	mov	w1, w19
    3bd8:      	mov	w19, w0
    3bdc:      	mov	x0, x21
    3be0:      	bl	0x3be0 <_stogir.vector.validate+0x470>
		0000000000003be0:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    3be4:      	cmp	x0, #0x0
    3be8:      	b.ne	0x39e8 <_stogir.vector.validate+0x278>
    3bec:      	sxtw	x28, w28
    3bf0:      	ubfx	x0, x26, #8, #8
    3bf4:      	orr	x1, x0, xzr
    3bf8:      	lsr	w19, w1, #0
    3bfc:      	cmp	x27, #0x5b
    3c00:      	b.eq	0x3cb0 <_stogir.vector.validate+0x540>
    3c04:      	cmp	x27, #0x5c
    3c08:      	b.eq	0x3cb0 <_stogir.vector.validate+0x540>
    3c0c:      	orr	x20, x0, xzr
    3c10:      	cmp	x27, #0x5d
    3c14:      	b.eq	0x3d28 <_stogir.vector.validate+0x5b8>
    3c18:      	cmp	x27, #0x5e
    3c1c:      	b.eq	0x3d28 <_stogir.vector.validate+0x5b8>
    3c20:      	cmp	x27, #0x43
    3c24:      	b.ne	0x3da8 <_stogir.vector.validate+0x638>
    3c28:      	mov	w0, w19
    3c2c:      	bl	0x3c2c <_stogir.vector.validate+0x4bc>
		0000000000003c2c:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    3c30:      	cmp	x0, #0x0
    3c34:      	b.eq	0x41ac <_stogir.vector.validate+0xa3c>
    3c38:      	lsr	w23, w23, #0
    3c3c:      	mov	w0, w19
    3c40:      	mov	w1, w23
    3c44:      	bl	0x3c44 <_stogir.vector.validate+0x4d4>
		0000000000003c44:  ARM64_RELOC_BRANCH26	_stogir.types.size
    3c48:      	lsr	w0, w0, #0
    3c4c:      	sxtw	x0, w0
    3c50:      	cmp	x0, #0x0
    3c54:      	b.le	0x41ac <_stogir.vector.validate+0xa3c>
    3c58:      	cmp	x28, #0x3
    3c5c:      	b.lt	0x41ac <_stogir.vector.validate+0xa3c>
    3c60:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x194>
		0000000000003c60:  ARM64_RELOC_PAGE21	l_stogir.339
    3c64:      	ldr	x16, [x16]
		0000000000003c64:  ARM64_RELOC_PAGEOFF12	l_stogir.339
    3c68:      	orr	x0, x16, xzr
    3c6c:      	mov	x26, x0
    3c70:      	movz	x27, #0x0, lsl #48
    3c74:      	b	0x41c0 <_stogir.vector.validate+0xa50>
    3c78:      	str	x20, [sp, #0x1c8]
    3c7c:      	str	w19, [sp, #0x1c0]
    3c80:      	mov	w19, w0
    3c84:      	mov	w20, w1
    3c88:      	str	w2, [sp, #0x1d0]
    3c8c:      	str	w3, [sp, #0x1d8]
    3c90:      	b	0x39e8 <_stogir.vector.validate+0x278>
    3c94:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x194>
		0000000000003c94:  ARM64_RELOC_PAGE21	l_stogir.340
    3c98:      	ldr	x16, [x16]
		0000000000003c98:  ARM64_RELOC_PAGEOFF12	l_stogir.340
    3c9c:      	orr	x0, x16, xzr
    3ca0:      	mov	x1, x0
    3ca4:      	mov	x0, #0x1                ; =1
    3ca8:      	mov	x2, #0x19               ; =25
    3cac:      	b	0x3a24 <_stogir.vector.validate+0x2b4>
    3cb0:      	cmp	x28, #0x2
    3cb4:      	b.ne	0x3c94 <_stogir.vector.validate+0x524>
    3cb8:      	lsr	w23, w23, #0
    3cbc:      	add	x16, sp, #0x40
    3cc0:      	ldr	w0, [x16, #0x4]
    3cc4:      	add	x16, sp, #0x40
    3cc8:      	ldr	w1, [x16, #0x8]
    3ccc:      	lsr	w0, w0, #0
    3cd0:      	lsr	w1, w1, #0
    3cd4:      	add	x8, sp, #0x130
    3cd8:      	mov	w2, w23
    3cdc:      	mov	w3, w0
    3ce0:      	mov	x0, x21
    3ce4:      	mov	w4, w1
    3ce8:      	mov	w1, w19
    3cec:      	bl	0x3cec <_stogir.vector.validate+0x57c>
		0000000000003cec:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    3cf0:      	add	x16, sp, #0x130
    3cf4:      	ldr	x0, [x16]
    3cf8:      	add	x16, sp, #0x130
    3cfc:      	ldr	x1, [x16, #0x8]
    3d00:      	add	x16, sp, #0x130
    3d04:      	ldr	x2, [x16, #0x10]
    3d08:      	b	0x3cac <_stogir.vector.validate+0x53c>
    3d0c:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x194>
		0000000000003d0c:  ARM64_RELOC_PAGE21	l_stogir.341
    3d10:      	ldr	x16, [x16]
		0000000000003d10:  ARM64_RELOC_PAGEOFF12	l_stogir.341
    3d14:      	orr	x0, x16, xzr
    3d18:      	mov	x1, x0
    3d1c:      	mov	x0, #0x1                ; =1
    3d20:      	mov	x2, #0x1a               ; =26
    3d24:      	b	0x3cac <_stogir.vector.validate+0x53c>
    3d28:      	cmp	x28, #0x3
    3d2c:      	b.ne	0x3d0c <_stogir.vector.validate+0x59c>
    3d30:      	cmp	x20, #0x0
    3d34:      	b.ne	0x3d0c <_stogir.vector.validate+0x59c>
    3d38:      	lsr	w23, w23, #0
    3d3c:      	add	x16, sp, #0x40
    3d40:      	ldr	w0, [x16, #0x4]
    3d44:      	add	x16, sp, #0x40
    3d48:      	ldr	w1, [x16, #0x8]
    3d4c:      	lsr	w0, w0, #0
    3d50:      	add	x16, sp, #0x40
    3d54:      	ldr	w2, [x16, #0xc]
    3d58:      	lsr	w1, w1, #0
    3d5c:      	lsr	w2, w2, #0
    3d60:      	add	x8, sp, #0x150
    3d64:      	mov	w3, w1
    3d68:      	mov	w1, w23
    3d6c:      	mov	w4, w2
    3d70:      	mov	w2, w0
    3d74:      	mov	x0, x21
    3d78:      	bl	0x3d78 <_stogir.vector.validate+0x608>
		0000000000003d78:  ARM64_RELOC_BRANCH26	_stogir.vector.store-inputs
    3d7c:      	add	x16, sp, #0x150
    3d80:      	ldr	x0, [x16]
    3d84:      	add	x16, sp, #0x150
    3d88:      	ldr	x1, [x16, #0x8]
    3d8c:      	add	x16, sp, #0x150
    3d90:      	ldr	x2, [x16, #0x10]
    3d94:      	b	0x3d24 <_stogir.vector.validate+0x5b4>
    3d98:      	ldr	x1, [sp, #0x1e0]
    3d9c:      	mov	x2, x14
    3da0:      	mov	x0, #0x1                ; =1
    3da4:      	b	0x3d24 <_stogir.vector.validate+0x5b4>
    3da8:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x194>
		0000000000003da8:  ARM64_RELOC_PAGE21	l_stogir.342
    3dac:      	ldr	x16, [x16]
		0000000000003dac:  ARM64_RELOC_PAGEOFF12	l_stogir.342
    3db0:      	orr	x0, x16, xzr
    3db4:      	mov	x1, x0
    3db8:      	mov	x0, #0x1                ; =1
    3dbc:      	mov	x2, #0x28               ; =40
    3dc0:      	b	0x3da4 <_stogir.vector.validate+0x634>
    3dc4:      	mov	x0, x1
    3dc8:      	mov	x1, x27
    3dcc:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x194>
		0000000000003dcc:  ARM64_RELOC_PAGE21	l_stogir.343
    3dd0:      	ldr	x16, [x16]
		0000000000003dd0:  ARM64_RELOC_PAGEOFF12	l_stogir.343
    3dd4:      	orr	x2, x16, xzr
    3dd8:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x194>
		0000000000003dd8:  ARM64_RELOC_PAGE21	l_stogir.344
    3ddc:      	ldr	x16, [x16]
		0000000000003ddc:  ARM64_RELOC_PAGEOFF12	l_stogir.344
    3de0:      	orr	x3, x16, xzr
    3de4:      	add	x4, x21, #0x78
    3de8:      	add	x5, x21, #0x28
    3dec:      	add	x6, x21, #0x50
    3df0:      	cmp	x22, #0x0
    3df4:      	cset	w7, gt
    3df8:      	add	x8, x21, #0x78
    3dfc:      	cmp	x22, #0x0
    3e00:      	cset	w9, lt
    3e04:      	add	x10, x21, #0x28
    3e08:      	add	x11, x21, #0x50
    3e0c:      	movz	x16, #0x0, lsl #48
    3e10:      	sub	x12, x16, x22
    3e14:      	sub	x13, x12, #0x1
    3e18:      	lsl	x13, x13, #2
    3e1c:      	mov	x14, x1
    3e20:      	mov	x1, x0
    3e24:      	mov	x0, #0x2                ; =2
    3e28:      	b	0x3f58 <_stogir.vector.validate+0x7e8>
    3e2c:      	movz	x15, #0x0, lsl #48
    3e30:      	b	0x3e4c <_stogir.vector.validate+0x6dc>
    3e34:      	movz	x15, #0x0, lsl #48
    3e38:      	b	0x3e54 <_stogir.vector.validate+0x6e4>
    3e3c:      	ldr	x1, [sp, #0x1f0]
    3e40:      	mov	x2, #0x1e               ; =30
    3e44:      	b	0x3f40 <_stogir.vector.validate+0x7d0>
    3e48:      	movz	x15, #0x0, lsl #48
    3e4c:      	b	0x3e54 <_stogir.vector.validate+0x6e4>
    3e50:      	movz	x15, #0x0, lsl #48
    3e54:      	cmp	x15, #0x0
    3e58:      	b.eq	0x3ee8 <_stogir.vector.validate+0x778>
    3e5c:      	lsr	w15, w0, #0
    3e60:      	sxtw	x15, w15
    3e64:      	cmp	x15, #0x1
    3e68:      	b.lt	0x3ed8 <_stogir.vector.validate+0x768>
    3e6c:      	ldr	x26, [x21, #0x78]
    3e70:      	add	x26, x25, x26
    3e74:      	ldr	w26, [x26]
    3e78:      	sxtw	x26, w26
    3e7c:      	cmp	x15, x26
    3e80:      	b.gt	0x3ed8 <_stogir.vector.validate+0x768>
    3e84:      	ldr	x26, [x21]
    3e88:      	asr	x16, x15, #63
    3e8c:      	lsr	x16, x16, #62
    3e90:      	add	x27, x15, x16
    3e94:      	asr	x27, x27, #2
    3e98:      	asr	x16, x15, #63
    3e9c:      	lsr	x16, x16, #62
    3ea0:      	add	x15, x15, x16
    3ea4:      	and	x15, x15, #0x3
    3ea8:      	sub	x15, x15, x16
    3eac:      	add	x27, x27, x22
    3eb0:      	lsl	x15, x15, #2
    3eb4:      	lsl	x27, x27, #4
    3eb8:      	add	x26, x27, x26
    3ebc:      	add	x15, x15, x26
    3ec0:      	ldr	w15, [x15]
    3ec4:      	sxtw	x15, w15
    3ec8:      	and	x15, x15, #0xffffffff
    3ecc:      	mov	x26, x15
    3ed0:      	mov	x15, #0x1               ; =1
    3ed4:      	b	0x3ee0 <_stogir.vector.validate+0x770>
    3ed8:      	movz	x15, #0x0, lsl #48
    3edc:      	movz	x26, #0x0, lsl #48
    3ee0:      	b	0x3ef0 <_stogir.vector.validate+0x780>
    3ee4:      	nop
    3ee8:      	movz	x15, #0x0, lsl #48
    3eec:      	movz	x26, #0x0, lsl #48
    3ef0:      	add	x16, sp, #0x1b0
    3ef4:      	str	x15, [x16]
    3ef8:      	lsr	w15, w15, #0
    3efc:      	add	x16, sp, #0x1b0
    3f00:      	str	x26, [x16, #0x8]
    3f04:      	lsr	x16, x15, #0
    3f08:      	cmp	x16, #0x1
    3f0c:      	b.eq	0x3f28 <_stogir.vector.validate+0x7b8>
    3f10:      	b.lo	0x3f18 <_stogir.vector.validate+0x7a8>
    3f14:      	b	0x3f2c <_stogir.vector.validate+0x7bc>
    3f18:      	cmp	x16, #0x0
    3f1c:      	b.eq	0x3f24 <_stogir.vector.validate+0x7b4>
    3f20:      	b	0x3f2c <_stogir.vector.validate+0x7bc>
    3f24:      	b	0x3f30 <_stogir.vector.validate+0x7c0>
    3f28:      	b	0x3fc4 <_stogir.vector.validate+0x854>
    3f2c:      	b	0x4310 <_stogir.vector.validate+0xba0>
    3f30:      	str	x2, [sp, #0x1e8]
    3f34:      	str	x3, [sp, #0x1f0]
    3f38:      	mov	x1, x2
    3f3c:      	mov	x2, #0x18               ; =24
    3f40:      	add	x0, x0, #0x1
    3f44:      	lsr	w0, w0, #0
    3f48:      	sxtw	x0, w0
    3f4c:      	ldr	x3, [sp, #0x1f0]
    3f50:      	mov	x14, x2
    3f54:      	ldr	x2, [sp, #0x1e8]
    3f58:      	cmp	x14, #0x0
    3f5c:      	cset	w15, eq
    3f60:      	uxtb	w16, w15
    3f64:      	cmp	w16, wzr
    3f68:      	b.eq	0x4350 <_stogir.vector.validate+0xbe0>
    3f6c:      	cmp	x0, x28
    3f70:      	b.gt	0x4358 <_stogir.vector.validate+0xbe8>
    3f74:      	uxtb	w16, w24
    3f78:      	cmp	w16, wzr
    3f7c:      	b.ne	0x3ee8 <_stogir.vector.validate+0x778>
    3f80:      	uxtb	w16, w7
    3f84:      	cmp	w16, wzr
    3f88:      	b.eq	0x4034 <_stogir.vector.validate+0x8c4>
    3f8c:      	ldr	x15, [x21, #0x8]
    3f90:      	cmp	x22, x15
    3f94:      	b.ge	0x3e48 <_stogir.vector.validate+0x6d8>
    3f98:      	ldr	x15, [x8, #0x8]
    3f9c:      	cmp	x22, x15
    3fa0:      	b.ge	0x3e2c <_stogir.vector.validate+0x6bc>
    3fa4:      	ldr	x15, [x21, #0x78]
    3fa8:      	add	x15, x25, x15
    3fac:      	ldr	w15, [x15]
    3fb0:      	sxtw	x15, w15
    3fb4:      	cmp	x15, #0x0
    3fb8:      	cset	w15, ge
    3fbc:      	ubfx	x15, x15, #0, #8
    3fc0:      	b	0x3e30 <_stogir.vector.validate+0x6c0>
    3fc4:      	add	x16, sp, #0x1b0
    3fc8:      	ldr	w15, [x16, #0x8]
    3fcc:      	sxtw	x15, w15
    3fd0:      	cmp	x15, #0x0
    3fd4:      	cset	w26, gt
    3fd8:      	movz	x16, #0x0, lsl #48
    3fdc:      	sub	x27, x16, x15
    3fe0:      	str	x1, [sp, #0x1e0]
    3fe4:      	sub	x1, x27, #0x1
    3fe8:      	uxtb	w16, w26
    3fec:      	cmp	w16, wzr
    3ff0:      	b.eq	0x4360 <_stogir.vector.validate+0xbf0>
    3ff4:      	ldr	x27, [x21, #0x8]
    3ff8:      	cmp	x15, x27
    3ffc:      	b.ge	0x4368 <_stogir.vector.validate+0xbf8>
    4000:      	ldr	x27, [x4, #0x8]
    4004:      	cmp	x15, x27
    4008:      	b.ge	0x4370 <_stogir.vector.validate+0xc00>
    400c:      	lsl	x27, x15, #2
    4010:      	str	x2, [sp, #0x1e8]
    4014:      	ldr	x2, [x21, #0x78]
    4018:      	add	x2, x27, x2
    401c:      	ldr	w2, [x2]
    4020:      	sxtw	x2, w2
    4024:      	cmp	x2, #0x0
    4028:      	cset	w2, ge
    402c:      	ubfx	x2, x2, #0, #8
    4030:      	b	0x4230 <_stogir.vector.validate+0xac0>
    4034:      	uxtb	w16, w9
    4038:      	cmp	w16, wzr
    403c:      	b.eq	0x3e50 <_stogir.vector.validate+0x6e0>
    4040:      	ldr	x15, [x10, #0x8]
    4044:      	ldr	x26, [x11, #0x8]
    4048:      	cmp	x15, x26
    404c:      	b.ne	0x3e34 <_stogir.vector.validate+0x6c4>
    4050:      	cmp	x12, x15
    4054:      	b.gt	0x4234 <_stogir.vector.validate+0xac4>
    4058:      	ldr	x15, [x21, #0x50]
    405c:      	add	x15, x13, x15
    4060:      	ldr	w15, [x15]
    4064:      	sxtw	x15, w15
    4068:      	cmp	x15, #0x0
    406c:      	cset	w15, gt
    4070:      	ubfx	x15, x15, #0, #8
    4074:      	b	0x4238 <_stogir.vector.validate+0xac8>
    4078:      	cmp	x15, #0x0
    407c:      	b.ge	0x4378 <_stogir.vector.validate+0xc08>
    4080:      	ldr	x2, [x5, #0x8]
    4084:      	str	x3, [sp, #0x1f0]
    4088:      	ldr	x3, [x6, #0x8]
    408c:      	cmp	x2, x3
    4090:      	b.ne	0x4224 <_stogir.vector.validate+0xab4>
    4094:      	cmp	x27, x2
    4098:      	b.gt	0x4284 <_stogir.vector.validate+0xb14>
    409c:      	lsl	x2, x1, #2
    40a0:      	ldr	x3, [x21, #0x50]
    40a4:      	add	x2, x2, x3
    40a8:      	ldr	w2, [x2]
    40ac:      	sxtw	x2, w2
    40b0:      	cmp	x2, #0x0
    40b4:      	cset	w2, gt
    40b8:      	ubfx	x2, x2, #0, #8
    40bc:      	b	0x4288 <_stogir.vector.validate+0xb18>
    40c0:      	uxtb	w16, w15
    40c4:      	cmp	w16, wzr
    40c8:      	b.eq	0x3d98 <_stogir.vector.validate+0x628>
    40cc:      	lsr	w23, w23, #0
    40d0:      	mov	w0, w19
    40d4:      	mov	w1, w23
    40d8:      	bl	0x40d8 <_stogir.vector.validate+0x968>
		00000000000040d8:  ARM64_RELOC_BRANCH26	_stogir.types.size
    40dc:      	lsr	w0, w0, #0
    40e0:      	sxtw	x0, w0
    40e4:      	and	x0, x0, #0xffffffff
    40e8:      	mov	x1, x0
    40ec:      	movz	x0, #0x0, lsl #48
    40f0:      	movz	x2, #0x0, lsl #48
    40f4:      	b	0x3da4 <_stogir.vector.validate+0x634>
    40f8:      	movz	x2, #0x0, lsl #48
    40fc:      	str	x3, [sp, #0x1f0]
    4100:      	b	0x4108 <_stogir.vector.validate+0x998>
    4104:      	movz	x2, #0x0, lsl #48
    4108:      	cmp	x2, #0x0
    410c:      	b.eq	0x414c <_stogir.vector.validate+0x9dc>
    4110:      	uxtb	w16, w26
    4114:      	cmp	w16, wzr
    4118:      	b.eq	0x4130 <_stogir.vector.validate+0x9c0>
    411c:      	lsl	x1, x15, #4
    4120:      	ldr	x2, [x21]
    4124:      	add	x1, x1, x2
    4128:      	ldr	x1, [x1]
    412c:      	b	0x4140 <_stogir.vector.validate+0x9d0>
    4130:      	lsl	x1, x1, #4
    4134:      	ldr	x2, [x21, #0x28]
    4138:      	add	x1, x1, x2
    413c:      	ldr	x1, [x1]
    4140:      	mov	x2, x1
    4144:      	mov	x1, #0x1                ; =1
    4148:      	b	0x4154 <_stogir.vector.validate+0x9e4>
    414c:      	movz	x1, #0x0, lsl #48
    4150:      	movz	x2, #0x0, lsl #48
    4154:      	lsr	w1, w1, #0
    4158:      	lsr	x16, x1, #0
    415c:      	cmp	x16, #0x1
    4160:      	b.eq	0x417c <_stogir.vector.validate+0xa0c>
    4164:      	b.lo	0x416c <_stogir.vector.validate+0x9fc>
    4168:      	b	0x4180 <_stogir.vector.validate+0xa10>
    416c:      	cmp	x16, #0x0
    4170:      	b.eq	0x4178 <_stogir.vector.validate+0xa08>
    4174:      	b	0x4180 <_stogir.vector.validate+0xa10>
    4178:      	b	0x4184 <_stogir.vector.validate+0xa14>
    417c:      	b	0x4190 <_stogir.vector.validate+0xa20>
    4180:      	b	0x4318 <_stogir.vector.validate+0xba8>
    4184:      	ldr	x1, [sp, #0x1e8]
    4188:      	mov	x2, #0x18               ; =24
    418c:      	b	0x3e44 <_stogir.vector.validate+0x6d4>
    4190:      	lsr	w2, w2, #0
    4194:      	ubfx	x1, x2, #8, #8
    4198:      	cmp	x1, x20
    419c:      	b.ne	0x3e3c <_stogir.vector.validate+0x6cc>
    41a0:      	ldr	x1, [sp, #0x1e0]
    41a4:      	mov	x2, x14
    41a8:      	b	0x3e44 <_stogir.vector.validate+0x6d4>
    41ac:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		00000000000041ac:  ARM64_RELOC_PAGE21	l_stogir.345
    41b0:      	ldr	x16, [x16]
		00000000000041b0:  ARM64_RELOC_PAGEOFF12	l_stogir.345
    41b4:      	orr	x0, x16, xzr
    41b8:      	mov	x26, x0
    41bc:      	mov	x27, #0x20              ; =32
    41c0:      	add	x16, sp, #0x40
    41c4:      	ldr	w0, [x16, #0x4]
    41c8:      	lsr	w0, w0, #0
    41cc:      	add	x8, sp, #0x170
    41d0:      	mov	w1, w0
    41d4:      	mov	x0, x21
    41d8:      	bl	0x41d8 <_stogir.vector.validate+0xa68>
		00000000000041d8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    41dc:      	add	x16, sp, #0x170
    41e0:      	ldr	w0, [x16]
    41e4:      	lsr	x16, x0, #0
    41e8:      	cmp	x16, #0x1
    41ec:      	b.eq	0x4208 <_stogir.vector.validate+0xa98>
    41f0:      	b.lo	0x41f8 <_stogir.vector.validate+0xa88>
    41f4:      	b	0x420c <_stogir.vector.validate+0xa9c>
    41f8:      	cmp	x16, #0x0
    41fc:      	b.eq	0x4204 <_stogir.vector.validate+0xa94>
    4200:      	b	0x420c <_stogir.vector.validate+0xa9c>
    4204:      	b	0x4210 <_stogir.vector.validate+0xaa0>
    4208:      	b	0x423c <_stogir.vector.validate+0xacc>
    420c:      	b	0x4320 <_stogir.vector.validate+0xbb0>
    4210:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004210:  ARM64_RELOC_PAGE21	l_stogir.346
    4214:      	ldr	x16, [x16]
		0000000000004214:  ARM64_RELOC_PAGEOFF12	l_stogir.346
    4218:      	orr	x0, x16, xzr
    421c:      	mov	x1, #0x19               ; =25
    4220:      	b	0x3dcc <_stogir.vector.validate+0x65c>
    4224:      	movz	x2, #0x0, lsl #48
    4228:      	b	0x4108 <_stogir.vector.validate+0x998>
    422c:      	movz	x2, #0x0, lsl #48
    4230:      	b	0x40fc <_stogir.vector.validate+0x98c>
    4234:      	movz	x15, #0x0, lsl #48
    4238:      	b	0x3e38 <_stogir.vector.validate+0x6c8>
    423c:      	add	x16, sp, #0x170
    4240:      	orr	x0, x16, xzr
    4244:      	add	x0, x0, #0x8
    4248:      	add	x16, sp, #0x170
    424c:      	ldr	x1, [x16, #0x8]
    4250:      	add	x16, sp, #0x1a0
    4254:      	str	x1, [x16]
    4258:      	ldr	x0, [x0, #0x8]
    425c:      	add	x16, sp, #0x1a0
    4260:      	str	x0, [x16, #0x8]
    4264:      	add	x16, sp, #0x40
    4268:      	ldr	w0, [x16, #0x4]
    426c:      	sxtw	x0, w0
    4270:      	cmp	x0, #0x0
    4274:      	b.gt	0x42ec <_stogir.vector.validate+0xb7c>
    4278:      	mov	x1, x26
    427c:      	mov	x0, #0x1                ; =1
    4280:      	b	0x42d0 <_stogir.vector.validate+0xb60>
    4284:      	movz	x2, #0x0, lsl #48
    4288:      	b	0x4228 <_stogir.vector.validate+0xab8>
    428c:      	add	x16, sp, #0x40
    4290:      	ldr	w0, [x16, #0x4]
    4294:      	sxtw	x0, w0
    4298:      	ldr	x1, [x21, #0x78]
    429c:      	lsl	x0, x0, #2
    42a0:      	add	x0, x0, x1
    42a4:      	ldr	w0, [x0]
    42a8:      	sxtw	x0, w0
    42ac:      	add	x0, x0, #0x1
    42b0:      	lsr	w0, w0, #0
    42b4:      	sxtw	x0, w0
    42b8:      	cmp	x28, x0
    42bc:      	cset	w0, eq
    42c0:      	uxtb	w16, w0
    42c4:      	cmp	w16, wzr
    42c8:      	cset	x0, eq
    42cc:      	mov	x1, x26
    42d0:      	cmp	x0, #0x0
    42d4:      	b.eq	0x3dc4 <_stogir.vector.validate+0x654>
    42d8:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		00000000000042d8:  ARM64_RELOC_PAGE21	l_stogir.347
    42dc:      	ldr	x16, [x16]
		00000000000042dc:  ARM64_RELOC_PAGEOFF12	l_stogir.347
    42e0:      	orr	x0, x16, xzr
    42e4:      	mov	x1, #0x19               ; =25
    42e8:      	b	0x3dcc <_stogir.vector.validate+0x65c>
    42ec:      	add	x16, sp, #0x1a0
    42f0:      	ldr	w0, [x16]
    42f4:      	uxtb	w0, w0
    42f8:      	cmp	x0, #0x70
    42fc:      	b.eq	0x428c <_stogir.vector.validate+0xb1c>
    4300:      	cmp	x0, #0x71
    4304:      	b.eq	0x428c <_stogir.vector.validate+0xb1c>
    4308:      	mov	x0, #0x1                ; =1
    430c:      	b	0x42cc <_stogir.vector.validate+0xb5c>
    4310:      	brk	#0
    4314:      	b	0x4310 <_stogir.vector.validate+0xba0>
    4318:      	brk	#0
    431c:      	b	0x4318 <_stogir.vector.validate+0xba8>
    4320:      	brk	#0
    4324:      	b	0x4320 <_stogir.vector.validate+0xbb0>
    4328:      	str	x20, [sp, #0x1c8]
    432c:      	str	w19, [sp, #0x1c0]
    4330:      	b	0x392c <_stogir.vector.validate+0x1bc>
    4334:      	str	x20, [sp, #0x1c8]
    4338:      	str	w19, [sp, #0x1c0]
    433c:      	mov	w19, w0
    4340:      	mov	w20, w1
    4344:      	str	w2, [sp, #0x1d0]
    4348:      	str	w3, [sp, #0x1d8]
    434c:      	b	0x39e8 <_stogir.vector.validate+0x278>
    4350:      	str	x1, [sp, #0x1e0]
    4354:      	b	0x40c0 <_stogir.vector.validate+0x950>
    4358:      	str	x1, [sp, #0x1e0]
    435c:      	b	0x40c0 <_stogir.vector.validate+0x950>
    4360:      	str	x2, [sp, #0x1e8]
    4364:      	b	0x4078 <_stogir.vector.validate+0x908>
    4368:      	str	x2, [sp, #0x1e8]
    436c:      	b	0x40f8 <_stogir.vector.validate+0x988>
    4370:      	str	x2, [sp, #0x1e8]
    4374:      	b	0x422c <_stogir.vector.validate+0xabc>
    4378:      	str	x3, [sp, #0x1f0]
    437c:      	b	0x4104 <_stogir.vector.validate+0x994>

0000000000004380 <_stogir.copy.validate>:
    4380:      	sub	sp, sp, #0x40
    4384:      	str	x29, [sp]
    4388:      	str	x30, [sp, #0x8]
    438c:      	mov	x29, sp
    4390:      	str	x19, [sp, #0x20]
    4394:      	str	x20, [sp, #0x28]
    4398:      	str	x21, [sp, #0x30]
    439c:      	sxtw	x1, w1
    43a0:      	lsl	x2, x1, #2
    43a4:      	cmp	x1, #0x0
    43a8:      	cset	w3, gt
    43ac:      	movz	x16, #0x0, lsl #48
    43b0:      	sub	x4, x16, x1
    43b4:      	sub	x5, x4, #0x1
    43b8:      	uxtb	w16, w3
    43bc:      	cmp	w16, wzr
    43c0:      	b.eq	0x4400 <_stogir.copy.validate+0x80>
    43c4:      	ldr	x4, [x0, #0x8]
    43c8:      	cmp	x1, x4
    43cc:      	b.ge	0x4454 <_stogir.copy.validate+0xd4>
    43d0:      	add	x4, x0, #0x78
    43d4:      	ldr	x4, [x4, #0x8]
    43d8:      	cmp	x1, x4
    43dc:      	b.ge	0x4580 <_stogir.copy.validate+0x200>
    43e0:      	ldr	x4, [x0, #0x78]
    43e4:      	add	x4, x2, x4
    43e8:      	ldr	w4, [x4]
    43ec:      	sxtw	x4, w4
    43f0:      	cmp	x4, #0x0
    43f4:      	cset	w4, ge
    43f8:      	ubfx	x4, x4, #0, #8
    43fc:      	b	0x4584 <_stogir.copy.validate+0x204>
    4400:      	cmp	x1, #0x0
    4404:      	b.ge	0x445c <_stogir.copy.validate+0xdc>
    4408:      	add	x6, x0, #0x28
    440c:      	add	x7, x0, #0x50
    4410:      	ldr	x6, [x6, #0x8]
    4414:      	ldr	x7, [x7, #0x8]
    4418:      	cmp	x6, x7
    441c:      	b.ne	0x444c <_stogir.copy.validate+0xcc>
    4420:      	cmp	x4, x6
    4424:      	b.gt	0x45c8 <_stogir.copy.validate+0x248>
    4428:      	lsl	x4, x5, #2
    442c:      	ldr	x6, [x0, #0x50]
    4430:      	add	x4, x4, x6
    4434:      	ldr	w4, [x4]
    4438:      	sxtw	x4, w4
    443c:      	cmp	x4, #0x0
    4440:      	cset	w4, gt
    4444:      	ubfx	x4, x4, #0, #8
    4448:      	b	0x45cc <_stogir.copy.validate+0x24c>
    444c:      	movz	x4, #0x0, lsl #48
    4450:      	b	0x4460 <_stogir.copy.validate+0xe0>
    4454:      	movz	x4, #0x0, lsl #48
    4458:      	b	0x4460 <_stogir.copy.validate+0xe0>
    445c:      	movz	x4, #0x0, lsl #48
    4460:      	cmp	x4, #0x0
    4464:      	b.eq	0x44c8 <_stogir.copy.validate+0x148>
    4468:      	uxtb	w16, w3
    446c:      	cmp	w16, wzr
    4470:      	b.eq	0x4498 <_stogir.copy.validate+0x118>
    4474:      	lsl	x3, x1, #4
    4478:      	ldr	x4, [x0]
    447c:      	add	x3, x3, x4
    4480:      	ldr	x4, [x3]
    4484:      	ldr	x3, [x3, #0x8]
    4488:      	fmov	d31, x3
    448c:      	mov	x3, x4
    4490:      	fmov	x4, d31
    4494:      	b	0x44b8 <_stogir.copy.validate+0x138>
    4498:      	lsl	x3, x5, #4
    449c:      	ldr	x4, [x0, #0x28]
    44a0:      	add	x3, x3, x4
    44a4:      	ldr	x4, [x3]
    44a8:      	ldr	x3, [x3, #0x8]
    44ac:      	fmov	d31, x3
    44b0:      	mov	x3, x4
    44b4:      	fmov	x4, d31
    44b8:      	mov	x5, x4
    44bc:      	mov	x4, x3
    44c0:      	mov	x3, #0x1                ; =1
    44c4:      	b	0x44d4 <_stogir.copy.validate+0x154>
    44c8:      	movz	x3, #0x0, lsl #48
    44cc:      	movz	x4, #0x0, lsl #48
    44d0:      	movz	x5, #0x0, lsl #48
    44d4:      	lsr	w3, w3, #0
    44d8:      	lsr	x16, x3, #0
    44dc:      	cmp	x16, #0x1
    44e0:      	b.eq	0x44fc <_stogir.copy.validate+0x17c>
    44e4:      	b.lo	0x44ec <_stogir.copy.validate+0x16c>
    44e8:      	b	0x4500 <_stogir.copy.validate+0x180>
    44ec:      	cmp	x16, #0x0
    44f0:      	b.eq	0x44f8 <_stogir.copy.validate+0x178>
    44f4:      	b	0x4500 <_stogir.copy.validate+0x180>
    44f8:      	b	0x4504 <_stogir.copy.validate+0x184>
    44fc:      	b	0x4548 <_stogir.copy.validate+0x1c8>
    4500:      	b	0x4658 <_stogir.copy.validate+0x2d8>
    4504:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004504:  ARM64_RELOC_PAGE21	l_stogir.348
    4508:      	ldr	x16, [x16]
		0000000000004508:  ARM64_RELOC_PAGEOFF12	l_stogir.348
    450c:      	orr	x0, x16, xzr
    4510:      	mov	x20, x8
    4514:      	mov	x1, x0
    4518:      	mov	x0, #0x1                ; =1
    451c:      	mov	x2, #0x18               ; =24
    4520:      	str	x0, [x20]
    4524:      	str	x1, [x20, #0x8]
    4528:      	str	x2, [x20, #0x10]
    452c:      	ldr	x19, [sp, #0x20]
    4530:      	ldr	x20, [sp, #0x28]
    4534:      	ldr	x21, [sp, #0x30]
    4538:      	ldr	x29, [sp]
    453c:      	ldr	x30, [sp, #0x8]
    4540:      	add	sp, sp, #0x40
    4544:      	ret
    4548:      	add	x16, sp, #0x10
    454c:      	str	x4, [x16]
    4550:      	add	x16, sp, #0x10
    4554:      	str	x5, [x16, #0x8]
    4558:      	cmp	x1, #0x0
    455c:      	b.gt	0x4588 <_stogir.copy.validate+0x208>
    4560:      	mov	x20, x8
    4564:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004564:  ARM64_RELOC_PAGE21	l_stogir.349
    4568:      	ldr	x16, [x16]
		0000000000004568:  ARM64_RELOC_PAGEOFF12	l_stogir.349
    456c:      	orr	x0, x16, xzr
    4570:      	mov	x1, x0
    4574:      	mov	x0, #0x1                ; =1
    4578:      	mov	x2, #0x21               ; =33
    457c:      	b	0x4520 <_stogir.copy.validate+0x1a0>
    4580:      	movz	x4, #0x0, lsl #48
    4584:      	b	0x4458 <_stogir.copy.validate+0xd8>
    4588:      	uxtb	w1, w4
    458c:      	cmp	x1, #0x44
    4590:      	b.ne	0x47bc <_stogir.copy.validate+0x43c>
    4594:      	ldr	x1, [x0, #0x78]
    4598:      	add	x1, x2, x1
    459c:      	ldr	w1, [x1]
    45a0:      	sxtw	x1, w1
    45a4:      	cmp	x1, #0x2
    45a8:      	b.ne	0x47c4 <_stogir.copy.validate+0x444>
    45ac:      	lsr	w4, w4, #0
    45b0:      	ubfx	x1, x4, #8, #8
    45b4:      	orr	x19, x1, xzr
    45b8:      	cmp	x19, #0x0
    45bc:      	b.ne	0x45d0 <_stogir.copy.validate+0x250>
    45c0:      	mov	x20, x8
    45c4:      	b	0x4564 <_stogir.copy.validate+0x1e4>
    45c8:      	movz	x4, #0x0, lsl #48
    45cc:      	b	0x4450 <_stogir.copy.validate+0xd0>
    45d0:      	lsr	w1, w1, #0
    45d4:      	mov	x20, x8
    45d8:      	mov	x21, x0
    45dc:      	mov	w0, w1
    45e0:      	bl	0x45e0 <_stogir.copy.validate+0x260>
		00000000000045e0:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    45e4:      	cmp	x0, #0x0
    45e8:      	b.eq	0x4564 <_stogir.copy.validate+0x1e4>
    45ec:      	add	x16, sp, #0x10
    45f0:      	ldr	w0, [x16, #0x4]
    45f4:      	sxtw	x0, w0
    45f8:      	cmp	x0, #0x0
    45fc:      	cset	w1, gt
    4600:      	movz	x16, #0x0, lsl #48
    4604:      	sub	x2, x16, x0
    4608:      	sub	x3, x2, #0x1
    460c:      	uxtb	w16, w1
    4610:      	cmp	w16, wzr
    4614:      	b.eq	0x467c <_stogir.copy.validate+0x2fc>
    4618:      	ldr	x2, [x21, #0x8]
    461c:      	cmp	x0, x2
    4620:      	b.ge	0x46c8 <_stogir.copy.validate+0x348>
    4624:      	add	x2, x21, #0x78
    4628:      	ldr	x2, [x2, #0x8]
    462c:      	cmp	x0, x2
    4630:      	b.ge	0x47a4 <_stogir.copy.validate+0x424>
    4634:      	lsl	x2, x0, #2
    4638:      	ldr	x4, [x21, #0x78]
    463c:      	add	x2, x2, x4
    4640:      	ldr	w2, [x2]
    4644:      	sxtw	x2, w2
    4648:      	cmp	x2, #0x0
    464c:      	cset	w2, ge
    4650:      	ubfx	x2, x2, #0, #8
    4654:      	b	0x47a8 <_stogir.copy.validate+0x428>
    4658:      	brk	#0
    465c:      	b	0x4658 <_stogir.copy.validate+0x2d8>
    4660:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004660:  ARM64_RELOC_PAGE21	l_stogir.350
    4664:      	ldr	x16, [x16]
		0000000000004664:  ARM64_RELOC_PAGEOFF12	l_stogir.350
    4668:      	orr	x0, x16, xzr
    466c:      	mov	x1, x0
    4670:      	mov	x0, #0x1                ; =1
    4674:      	mov	x2, #0x20               ; =32
    4678:      	b	0x457c <_stogir.copy.validate+0x1fc>
    467c:      	cmp	x0, #0x0
    4680:      	b.ge	0x46d0 <_stogir.copy.validate+0x350>
    4684:      	add	x4, x21, #0x28
    4688:      	add	x5, x21, #0x50
    468c:      	ldr	x4, [x4, #0x8]
    4690:      	ldr	x5, [x5, #0x8]
    4694:      	cmp	x4, x5
    4698:      	b.ne	0x479c <_stogir.copy.validate+0x41c>
    469c:      	cmp	x2, x4
    46a0:      	b.gt	0x47ac <_stogir.copy.validate+0x42c>
    46a4:      	lsl	x2, x3, #2
    46a8:      	ldr	x4, [x21, #0x50]
    46ac:      	add	x2, x2, x4
    46b0:      	ldr	w2, [x2]
    46b4:      	sxtw	x2, w2
    46b8:      	cmp	x2, #0x0
    46bc:      	cset	w2, gt
    46c0:      	ubfx	x2, x2, #0, #8
    46c4:      	b	0x47b0 <_stogir.copy.validate+0x430>
    46c8:      	movz	x2, #0x0, lsl #48
    46cc:      	b	0x46d4 <_stogir.copy.validate+0x354>
    46d0:      	movz	x2, #0x0, lsl #48
    46d4:      	cmp	x2, #0x0
    46d8:      	b.eq	0x4718 <_stogir.copy.validate+0x398>
    46dc:      	uxtb	w16, w1
    46e0:      	cmp	w16, wzr
    46e4:      	b.eq	0x46fc <_stogir.copy.validate+0x37c>
    46e8:      	lsl	x0, x0, #4
    46ec:      	ldr	x1, [x21]
    46f0:      	add	x0, x0, x1
    46f4:      	ldr	x0, [x0]
    46f8:      	b	0x470c <_stogir.copy.validate+0x38c>
    46fc:      	lsl	x0, x3, #4
    4700:      	ldr	x1, [x21, #0x28]
    4704:      	add	x0, x0, x1
    4708:      	ldr	x0, [x0]
    470c:      	mov	x1, x0
    4710:      	mov	x0, #0x1                ; =1
    4714:      	b	0x4720 <_stogir.copy.validate+0x3a0>
    4718:      	movz	x0, #0x0, lsl #48
    471c:      	movz	x1, #0x0, lsl #48
    4720:      	lsr	w0, w0, #0
    4724:      	lsr	x16, x0, #0
    4728:      	cmp	x16, #0x1
    472c:      	b.eq	0x4748 <_stogir.copy.validate+0x3c8>
    4730:      	b.lo	0x4738 <_stogir.copy.validate+0x3b8>
    4734:      	b	0x474c <_stogir.copy.validate+0x3cc>
    4738:      	cmp	x16, #0x0
    473c:      	b.eq	0x4744 <_stogir.copy.validate+0x3c4>
    4740:      	b	0x474c <_stogir.copy.validate+0x3cc>
    4744:      	b	0x4750 <_stogir.copy.validate+0x3d0>
    4748:      	b	0x476c <_stogir.copy.validate+0x3ec>
    474c:      	b	0x47b4 <_stogir.copy.validate+0x434>
    4750:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004750:  ARM64_RELOC_PAGE21	l_stogir.351
    4754:      	ldr	x16, [x16]
		0000000000004754:  ARM64_RELOC_PAGEOFF12	l_stogir.351
    4758:      	orr	x0, x16, xzr
    475c:      	mov	x1, x0
    4760:      	mov	x0, #0x1                ; =1
    4764:      	mov	x2, #0x13               ; =19
    4768:      	b	0x4678 <_stogir.copy.validate+0x2f8>
    476c:      	lsr	w1, w1, #0
    4770:      	add	x16, sp, #0x10
    4774:      	ldr	w0, [x16]
    4778:      	ubfx	x1, x1, #8, #8
    477c:      	ubfx	x0, x0, #8, #8
    4780:      	cmp	x1, x0
    4784:      	b.ne	0x4660 <_stogir.copy.validate+0x2e0>
    4788:      	and	x0, x19, #0xffffffff
    478c:      	mov	x1, x0
    4790:      	movz	x0, #0x0, lsl #48
    4794:      	movz	x2, #0x0, lsl #48
    4798:      	b	0x4678 <_stogir.copy.validate+0x2f8>
    479c:      	movz	x2, #0x0, lsl #48
    47a0:      	b	0x46d4 <_stogir.copy.validate+0x354>
    47a4:      	movz	x2, #0x0, lsl #48
    47a8:      	b	0x46cc <_stogir.copy.validate+0x34c>
    47ac:      	movz	x2, #0x0, lsl #48
    47b0:      	b	0x47a0 <_stogir.copy.validate+0x420>
    47b4:      	brk	#0
    47b8:      	b	0x47b4 <_stogir.copy.validate+0x434>
    47bc:      	mov	x20, x8
    47c0:      	b	0x4564 <_stogir.copy.validate+0x1e4>
    47c4:      	mov	x20, x8
    47c8:      	b	0x4564 <_stogir.copy.validate+0x1e4>

00000000000047cc <_stogir.graph.lookup>:
    47cc:      	sxtw	x1, w1
    47d0:      	cmp	x1, #0x0
    47d4:      	cset	w2, gt
    47d8:      	movz	x16, #0x0, lsl #48
    47dc:      	sub	x3, x16, x1
    47e0:      	sub	x4, x3, #0x1
    47e4:      	uxtb	w16, w2
    47e8:      	cmp	w16, wzr
    47ec:      	b.eq	0x4830 <_stogir.graph.lookup+0x64>
    47f0:      	ldr	x3, [x0, #0x8]
    47f4:      	cmp	x1, x3
    47f8:      	b.ge	0x4884 <_stogir.graph.lookup+0xb8>
    47fc:      	add	x3, x0, #0x78
    4800:      	ldr	x3, [x3, #0x8]
    4804:      	cmp	x1, x3
    4808:      	b.ge	0x4924 <_stogir.graph.lookup+0x158>
    480c:      	lsl	x3, x1, #2
    4810:      	ldr	x5, [x0, #0x78]
    4814:      	add	x3, x3, x5
    4818:      	ldr	w3, [x3]
    481c:      	sxtw	x3, w3
    4820:      	cmp	x3, #0x0
    4824:      	cset	w3, ge
    4828:      	ubfx	x3, x3, #0, #8
    482c:      	b	0x4928 <_stogir.graph.lookup+0x15c>
    4830:      	cmp	x1, #0x0
    4834:      	b.ge	0x488c <_stogir.graph.lookup+0xc0>
    4838:      	add	x5, x0, #0x28
    483c:      	add	x6, x0, #0x50
    4840:      	ldr	x5, [x5, #0x8]
    4844:      	ldr	x6, [x6, #0x8]
    4848:      	cmp	x5, x6
    484c:      	b.ne	0x487c <_stogir.graph.lookup+0xb0>
    4850:      	cmp	x3, x5
    4854:      	b.gt	0x492c <_stogir.graph.lookup+0x160>
    4858:      	lsl	x3, x4, #2
    485c:      	ldr	x5, [x0, #0x50]
    4860:      	add	x3, x3, x5
    4864:      	ldr	w3, [x3]
    4868:      	sxtw	x3, w3
    486c:      	cmp	x3, #0x0
    4870:      	cset	w3, gt
    4874:      	ubfx	x3, x3, #0, #8
    4878:      	b	0x4930 <_stogir.graph.lookup+0x164>
    487c:      	movz	x3, #0x0, lsl #48
    4880:      	b	0x4890 <_stogir.graph.lookup+0xc4>
    4884:      	movz	x3, #0x0, lsl #48
    4888:      	b	0x4890 <_stogir.graph.lookup+0xc4>
    488c:      	movz	x3, #0x0, lsl #48
    4890:      	cmp	x3, #0x0
    4894:      	b.eq	0x48f8 <_stogir.graph.lookup+0x12c>
    4898:      	uxtb	w16, w2
    489c:      	cmp	w16, wzr
    48a0:      	b.eq	0x48c8 <_stogir.graph.lookup+0xfc>
    48a4:      	lsl	x1, x1, #4
    48a8:      	ldr	x0, [x0]
    48ac:      	add	x0, x1, x0
    48b0:      	ldr	x1, [x0]
    48b4:      	ldr	x0, [x0, #0x8]
    48b8:      	fmov	d31, x0
    48bc:      	mov	x0, x1
    48c0:      	fmov	x1, d31
    48c4:      	b	0x48e8 <_stogir.graph.lookup+0x11c>
    48c8:      	lsl	x1, x4, #4
    48cc:      	ldr	x0, [x0, #0x28]
    48d0:      	add	x0, x1, x0
    48d4:      	ldr	x1, [x0]
    48d8:      	ldr	x0, [x0, #0x8]
    48dc:      	fmov	d31, x0
    48e0:      	mov	x0, x1
    48e4:      	fmov	x1, d31
    48e8:      	mov	x2, x1
    48ec:      	mov	x1, x0
    48f0:      	mov	x0, #0x1                ; =1
    48f4:      	b	0x4904 <_stogir.graph.lookup+0x138>
    48f8:      	movz	x0, #0x0, lsl #48
    48fc:      	movz	x1, #0x0, lsl #48
    4900:      	movz	x2, #0x0, lsl #48
    4904:      	str	x0, [x8]
    4908:      	str	x1, [x8, #0x8]
    490c:      	str	x2, [x8, #0x10]
    4910:      	movz	x17, #0x0, lsl #48
    4914:      	str	x17, [x8, #0x18]
    4918:      	movz	x17, #0x0, lsl #48
    491c:      	str	x17, [x8, #0x20]
    4920:      	ret
    4924:      	movz	x3, #0x0, lsl #48
    4928:      	b	0x4888 <_stogir.graph.lookup+0xbc>
    492c:      	movz	x3, #0x0, lsl #48
    4930:      	b	0x4880 <_stogir.graph.lookup+0xb4>

0000000000004934 <_stogir.opcode.block-start?>:
    4934:      	sxtw	x0, w0
    4938:      	cmp	x0, #0x0
    493c:      	b.lt	0x4964 <_stogir.opcode.block-start?+0x30>
    4940:      	cmp	x0, #0x83
    4944:      	b.ge	0x4964 <_stogir.opcode.block-start?+0x30>
    4948:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004948:  ARM64_RELOC_PAGE21	l_stogir.352
    494c:      	ldr	x16, [x16]
		000000000000494c:  ARM64_RELOC_PAGEOFF12	l_stogir.352
    4950:      	orr	x1, x16, xzr
    4954:      	lsr	x0, x0, #0
    4958:      	add	x0, x0, x1
    495c:      	ldrb	w0, [x0]
    4960:      	b	0x4968 <_stogir.opcode.block-start?+0x34>
    4964:      	movz	x0, #0x0, lsl #48
    4968:      	uxtb	w0, w0
    496c:      	and	x0, x0, #0x2
    4970:      	uxtb	w0, w0
    4974:      	cmp	x0, #0x0
    4978:      	cset	w0, eq
    497c:      	uxtb	w16, w0
    4980:      	cmp	w16, wzr
    4984:      	cset	x0, eq
    4988:      	ret

000000000000498c <_stogir.checked.operation?>:
    498c:      	sxtw	x0, w0
    4990:      	cmp	x0, #0x29
    4994:      	b.lt	0x49a8 <_stogir.checked.operation?+0x1c>
    4998:      	cmp	x0, #0x2b
    499c:      	cset	w0, le
    49a0:      	ubfx	x0, x0, #0, #8
    49a4:      	b	0x49ac <_stogir.checked.operation?+0x20>
    49a8:      	movz	x0, #0x0, lsl #48
    49ac:      	ret

00000000000049b0 <_stogir.checked.validate-projection>:
    49b0:      	sub	sp, sp, #0x40
    49b4:      	str	x29, [sp]
    49b8:      	str	x30, [sp, #0x8]
    49bc:      	mov	x29, sp
    49c0:      	str	x19, [sp, #0x30]
    49c4:      	sxtw	x1, w1
    49c8:      	lsl	x2, x1, #2
    49cc:      	cmp	x1, #0x0
    49d0:      	cset	w3, gt
    49d4:      	movz	x16, #0x0, lsl #48
    49d8:      	sub	x4, x16, x1
    49dc:      	sub	x5, x4, #0x1
    49e0:      	uxtb	w16, w3
    49e4:      	cmp	w16, wzr
    49e8:      	b.eq	0x4a28 <_stogir.checked.validate-projection+0x78>
    49ec:      	ldr	x4, [x0, #0x8]
    49f0:      	cmp	x1, x4
    49f4:      	b.ge	0x4a7c <_stogir.checked.validate-projection+0xcc>
    49f8:      	add	x4, x0, #0x78
    49fc:      	ldr	x4, [x4, #0x8]
    4a00:      	cmp	x1, x4
    4a04:      	b.ge	0x4b68 <_stogir.checked.validate-projection+0x1b8>
    4a08:      	ldr	x4, [x0, #0x78]
    4a0c:      	add	x4, x2, x4
    4a10:      	ldr	w4, [x4]
    4a14:      	sxtw	x4, w4
    4a18:      	cmp	x4, #0x0
    4a1c:      	cset	w4, ge
    4a20:      	ubfx	x4, x4, #0, #8
    4a24:      	b	0x4b6c <_stogir.checked.validate-projection+0x1bc>
    4a28:      	cmp	x1, #0x0
    4a2c:      	b.ge	0x4a84 <_stogir.checked.validate-projection+0xd4>
    4a30:      	add	x6, x0, #0x28
    4a34:      	add	x7, x0, #0x50
    4a38:      	ldr	x6, [x6, #0x8]
    4a3c:      	ldr	x7, [x7, #0x8]
    4a40:      	cmp	x6, x7
    4a44:      	b.ne	0x4a74 <_stogir.checked.validate-projection+0xc4>
    4a48:      	cmp	x4, x6
    4a4c:      	b.gt	0x4bd4 <_stogir.checked.validate-projection+0x224>
    4a50:      	lsl	x4, x5, #2
    4a54:      	ldr	x6, [x0, #0x50]
    4a58:      	add	x4, x4, x6
    4a5c:      	ldr	w4, [x4]
    4a60:      	sxtw	x4, w4
    4a64:      	cmp	x4, #0x0
    4a68:      	cset	w4, gt
    4a6c:      	ubfx	x4, x4, #0, #8
    4a70:      	b	0x4bd8 <_stogir.checked.validate-projection+0x228>
    4a74:      	movz	x4, #0x0, lsl #48
    4a78:      	b	0x4a88 <_stogir.checked.validate-projection+0xd8>
    4a7c:      	movz	x4, #0x0, lsl #48
    4a80:      	b	0x4a88 <_stogir.checked.validate-projection+0xd8>
    4a84:      	movz	x4, #0x0, lsl #48
    4a88:      	cmp	x4, #0x0
    4a8c:      	b.eq	0x4acc <_stogir.checked.validate-projection+0x11c>
    4a90:      	uxtb	w16, w3
    4a94:      	cmp	w16, wzr
    4a98:      	b.eq	0x4ab0 <_stogir.checked.validate-projection+0x100>
    4a9c:      	lsl	x3, x1, #4
    4aa0:      	ldr	x4, [x0]
    4aa4:      	add	x3, x3, x4
    4aa8:      	ldr	x3, [x3]
    4aac:      	b	0x4ac0 <_stogir.checked.validate-projection+0x110>
    4ab0:      	lsl	x3, x5, #4
    4ab4:      	ldr	x4, [x0, #0x28]
    4ab8:      	add	x3, x3, x4
    4abc:      	ldr	x3, [x3]
    4ac0:      	mov	x4, x3
    4ac4:      	mov	x3, #0x1                ; =1
    4ac8:      	b	0x4ad4 <_stogir.checked.validate-projection+0x124>
    4acc:      	movz	x3, #0x0, lsl #48
    4ad0:      	movz	x4, #0x0, lsl #48
    4ad4:      	lsr	w3, w3, #0
    4ad8:      	lsr	x16, x3, #0
    4adc:      	cmp	x16, #0x1
    4ae0:      	b.eq	0x4afc <_stogir.checked.validate-projection+0x14c>
    4ae4:      	b.lo	0x4aec <_stogir.checked.validate-projection+0x13c>
    4ae8:      	b	0x4b00 <_stogir.checked.validate-projection+0x150>
    4aec:      	cmp	x16, #0x0
    4af0:      	b.eq	0x4af8 <_stogir.checked.validate-projection+0x148>
    4af4:      	b	0x4b00 <_stogir.checked.validate-projection+0x150>
    4af8:      	b	0x4b04 <_stogir.checked.validate-projection+0x154>
    4afc:      	b	0x4b24 <_stogir.checked.validate-projection+0x174>
    4b00:      	b	0x4bdc <_stogir.checked.validate-projection+0x22c>
    4b04:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004b04:  ARM64_RELOC_PAGE21	l_stogir.353
    4b08:      	ldr	x16, [x16]
		0000000000004b08:  ARM64_RELOC_PAGEOFF12	l_stogir.353
    4b0c:      	orr	x0, x16, xzr
    4b10:      	mov	x19, x8
    4b14:      	mov	x1, x0
    4b18:      	mov	x0, #0x1                ; =1
    4b1c:      	mov	x2, #0x10               ; =16
    4b20:      	b	0x4b48 <_stogir.checked.validate-projection+0x198>
    4b24:      	cmp	x1, #0x0
    4b28:      	b.gt	0x4b70 <_stogir.checked.validate-projection+0x1c0>
    4b2c:      	mov	x19, x8
    4b30:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004b30:  ARM64_RELOC_PAGE21	l_stogir.354
    4b34:      	ldr	x16, [x16]
		0000000000004b34:  ARM64_RELOC_PAGEOFF12	l_stogir.354
    4b38:      	orr	x0, x16, xzr
    4b3c:      	mov	x1, x0
    4b40:      	mov	x0, #0x1                ; =1
    4b44:      	mov	x2, #0x1c               ; =28
    4b48:      	str	x0, [x19]
    4b4c:      	str	x1, [x19, #0x8]
    4b50:      	str	x2, [x19, #0x10]
    4b54:      	ldr	x19, [sp, #0x30]
    4b58:      	ldr	x29, [sp]
    4b5c:      	ldr	x30, [sp, #0x8]
    4b60:      	add	sp, sp, #0x40
    4b64:      	ret
    4b68:      	movz	x4, #0x0, lsl #48
    4b6c:      	b	0x4a80 <_stogir.checked.validate-projection+0xd0>
    4b70:      	uxtb	w1, w4
    4b74:      	cmp	x1, #0x2c
    4b78:      	b.ne	0x4be4 <_stogir.checked.validate-projection+0x234>
    4b7c:      	lsr	w1, w4, #0
    4b80:      	ubfx	x1, x1, #8, #8
    4b84:      	cmp	x1, #0x1
    4b88:      	b.ne	0x4bec <_stogir.checked.validate-projection+0x23c>
    4b8c:      	ldr	x1, [x0, #0x78]
    4b90:      	add	x1, x2, x1
    4b94:      	ldr	w1, [x1]
    4b98:      	sxtw	x1, w1
    4b9c:      	cmp	x1, #0x1
    4ba0:      	b.ne	0x4bf4 <_stogir.checked.validate-projection+0x244>
    4ba4:      	lsr	x1, x4, #32
    4ba8:      	lsr	w1, w1, #0
    4bac:      	mov	x19, x8
    4bb0:      	add	x8, sp, #0x10
    4bb4:      	bl	0x4bb4 <_stogir.checked.validate-projection+0x204>
		0000000000004bb4:  ARM64_RELOC_BRANCH26	_stogir.checked.projection
    4bb8:      	add	x16, sp, #0x10
    4bbc:      	ldr	x0, [x16]
    4bc0:      	add	x16, sp, #0x10
    4bc4:      	ldr	x1, [x16, #0x8]
    4bc8:      	add	x16, sp, #0x10
    4bcc:      	ldr	x2, [x16, #0x10]
    4bd0:      	b	0x4b48 <_stogir.checked.validate-projection+0x198>
    4bd4:      	movz	x4, #0x0, lsl #48
    4bd8:      	b	0x4a78 <_stogir.checked.validate-projection+0xc8>
    4bdc:      	brk	#0
    4be0:      	b	0x4bdc <_stogir.checked.validate-projection+0x22c>
    4be4:      	mov	x19, x8
    4be8:      	b	0x4b30 <_stogir.checked.validate-projection+0x180>
    4bec:      	mov	x19, x8
    4bf0:      	b	0x4b30 <_stogir.checked.validate-projection+0x180>
    4bf4:      	mov	x19, x8
    4bf8:      	b	0x4b30 <_stogir.checked.validate-projection+0x180>

0000000000004bfc <_stogir.checked.validate>:
    4bfc:      	sub	sp, sp, #0x40
    4c00:      	str	x29, [sp]
    4c04:      	str	x30, [sp, #0x8]
    4c08:      	mov	x29, sp
    4c0c:      	str	x19, [sp, #0x10]
    4c10:      	str	x20, [sp, #0x18]
    4c14:      	str	x21, [sp, #0x20]
    4c18:      	str	x22, [sp, #0x28]
    4c1c:      	str	x23, [sp, #0x30]
    4c20:      	sxtw	x1, w1
    4c24:      	lsl	x2, x1, #2
    4c28:      	cmp	x1, #0x0
    4c2c:      	cset	w3, gt
    4c30:      	movz	x16, #0x0, lsl #48
    4c34:      	sub	x4, x16, x1
    4c38:      	sub	x5, x4, #0x1
    4c3c:      	uxtb	w16, w3
    4c40:      	cmp	w16, wzr
    4c44:      	b.eq	0x4c84 <_stogir.checked.validate+0x88>
    4c48:      	ldr	x4, [x0, #0x8]
    4c4c:      	cmp	x1, x4
    4c50:      	b.ge	0x4cd8 <_stogir.checked.validate+0xdc>
    4c54:      	add	x4, x0, #0x78
    4c58:      	ldr	x4, [x4, #0x8]
    4c5c:      	cmp	x1, x4
    4c60:      	b.ge	0x4e00 <_stogir.checked.validate+0x204>
    4c64:      	ldr	x4, [x0, #0x78]
    4c68:      	add	x4, x2, x4
    4c6c:      	ldr	w4, [x4]
    4c70:      	sxtw	x4, w4
    4c74:      	cmp	x4, #0x0
    4c78:      	cset	w4, ge
    4c7c:      	ubfx	x4, x4, #0, #8
    4c80:      	b	0x4e04 <_stogir.checked.validate+0x208>
    4c84:      	cmp	x1, #0x0
    4c88:      	b.ge	0x4ce0 <_stogir.checked.validate+0xe4>
    4c8c:      	add	x6, x0, #0x28
    4c90:      	add	x7, x0, #0x50
    4c94:      	ldr	x6, [x6, #0x8]
    4c98:      	ldr	x7, [x7, #0x8]
    4c9c:      	cmp	x6, x7
    4ca0:      	b.ne	0x4cd0 <_stogir.checked.validate+0xd4>
    4ca4:      	cmp	x4, x6
    4ca8:      	b.gt	0x4eb4 <_stogir.checked.validate+0x2b8>
    4cac:      	lsl	x4, x5, #2
    4cb0:      	ldr	x6, [x0, #0x50]
    4cb4:      	add	x4, x4, x6
    4cb8:      	ldr	w4, [x4]
    4cbc:      	sxtw	x4, w4
    4cc0:      	cmp	x4, #0x0
    4cc4:      	cset	w4, gt
    4cc8:      	ubfx	x4, x4, #0, #8
    4ccc:      	b	0x4eb8 <_stogir.checked.validate+0x2bc>
    4cd0:      	movz	x4, #0x0, lsl #48
    4cd4:      	b	0x4ce4 <_stogir.checked.validate+0xe8>
    4cd8:      	movz	x4, #0x0, lsl #48
    4cdc:      	b	0x4ce4 <_stogir.checked.validate+0xe8>
    4ce0:      	movz	x4, #0x0, lsl #48
    4ce4:      	cmp	x4, #0x0
    4ce8:      	b.eq	0x4d4c <_stogir.checked.validate+0x150>
    4cec:      	uxtb	w16, w3
    4cf0:      	cmp	w16, wzr
    4cf4:      	b.eq	0x4d1c <_stogir.checked.validate+0x120>
    4cf8:      	lsl	x3, x1, #4
    4cfc:      	ldr	x4, [x0]
    4d00:      	add	x3, x3, x4
    4d04:      	ldr	x4, [x3]
    4d08:      	ldr	x3, [x3, #0x8]
    4d0c:      	fmov	d31, x3
    4d10:      	mov	x3, x4
    4d14:      	fmov	x4, d31
    4d18:      	b	0x4d3c <_stogir.checked.validate+0x140>
    4d1c:      	lsl	x3, x5, #4
    4d20:      	ldr	x4, [x0, #0x28]
    4d24:      	add	x3, x3, x4
    4d28:      	ldr	x4, [x3]
    4d2c:      	ldr	x3, [x3, #0x8]
    4d30:      	fmov	d31, x3
    4d34:      	mov	x3, x4
    4d38:      	fmov	x4, d31
    4d3c:      	mov	x5, x4
    4d40:      	mov	x4, x3
    4d44:      	mov	x3, #0x1                ; =1
    4d48:      	b	0x4d58 <_stogir.checked.validate+0x15c>
    4d4c:      	movz	x3, #0x0, lsl #48
    4d50:      	movz	x4, #0x0, lsl #48
    4d54:      	movz	x5, #0x0, lsl #48
    4d58:      	lsr	w3, w3, #0
    4d5c:      	lsr	x16, x3, #0
    4d60:      	cmp	x16, #0x1
    4d64:      	b.eq	0x4d80 <_stogir.checked.validate+0x184>
    4d68:      	b.lo	0x4d70 <_stogir.checked.validate+0x174>
    4d6c:      	b	0x4d84 <_stogir.checked.validate+0x188>
    4d70:      	cmp	x16, #0x0
    4d74:      	b.eq	0x4d7c <_stogir.checked.validate+0x180>
    4d78:      	b	0x4d84 <_stogir.checked.validate+0x188>
    4d7c:      	b	0x4d88 <_stogir.checked.validate+0x18c>
    4d80:      	b	0x4da8 <_stogir.checked.validate+0x1ac>
    4d84:      	b	0x5170 <_stogir.checked.validate+0x574>
    4d88:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004d88:  ARM64_RELOC_PAGE21	l_stogir.355
    4d8c:      	ldr	x16, [x16]
		0000000000004d8c:  ARM64_RELOC_PAGEOFF12	l_stogir.355
    4d90:      	orr	x0, x16, xzr
    4d94:      	mov	x23, x8
    4d98:      	mov	x1, x0
    4d9c:      	mov	x0, #0x1                ; =1
    4da0:      	mov	x2, #0x1a               ; =26
    4da4:      	b	0x4dcc <_stogir.checked.validate+0x1d0>
    4da8:      	cmp	x1, #0x0
    4dac:      	b.gt	0x4e08 <_stogir.checked.validate+0x20c>
    4db0:      	mov	x23, x8
    4db4:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004db4:  ARM64_RELOC_PAGE21	l_stogir.356
    4db8:      	ldr	x16, [x16]
		0000000000004db8:  ARM64_RELOC_PAGEOFF12	l_stogir.356
    4dbc:      	orr	x0, x16, xzr
    4dc0:      	mov	x1, x0
    4dc4:      	mov	x0, #0x1                ; =1
    4dc8:      	mov	x2, #0x26               ; =38
    4dcc:      	str	x0, [x23]
    4dd0:      	str	x1, [x23, #0x8]
    4dd4:      	str	x2, [x23, #0x10]
    4dd8:      	sub	sp, x29, #0x0
    4ddc:      	ldr	x19, [sp, #0x10]
    4de0:      	ldr	x20, [sp, #0x18]
    4de4:      	ldr	x21, [sp, #0x20]
    4de8:      	ldr	x22, [sp, #0x28]
    4dec:      	ldr	x23, [sp, #0x30]
    4df0:      	ldr	x29, [sp]
    4df4:      	ldr	x30, [sp, #0x8]
    4df8:      	add	sp, sp, #0x40
    4dfc:      	ret
    4e00:      	movz	x4, #0x0, lsl #48
    4e04:      	b	0x4cdc <_stogir.checked.validate+0xe0>
    4e08:      	uxtb	w1, w4
    4e0c:      	cmp	x1, #0x29
    4e10:      	cset	w3, ge
    4e14:      	uxtb	w16, w3
    4e18:      	cmp	w16, wzr
    4e1c:      	b.eq	0x5190 <_stogir.checked.validate+0x594>
    4e20:      	cmp	x1, #0x2b
    4e24:      	cset	w1, le
    4e28:      	uxtb	w16, w1
    4e2c:      	cmp	w16, wzr
    4e30:      	b.eq	0x5198 <_stogir.checked.validate+0x59c>
    4e34:      	ldr	x6, [x0, #0x78]
    4e38:      	add	x2, x2, x6
    4e3c:      	ldr	w2, [x2]
    4e40:      	sxtw	x2, w2
    4e44:      	cmp	x2, #0x2
    4e48:      	b.ne	0x51a0 <_stogir.checked.validate+0x5a4>
    4e4c:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x890>
		0000000000004e4c:  ARM64_RELOC_PAGE21	l_stogir.357
    4e50:      	ldr	x16, [x16]
		0000000000004e50:  ARM64_RELOC_PAGEOFF12	l_stogir.357
    4e54:      	orr	x2, x16, xzr
    4e58:      	lsr	w6, w4, #0
    4e5c:      	mov	x19, sp
    4e60:      	sub	sp, sp, #0x10
    4e64:      	mov	x7, sp
    4e68:      	sub	sp, sp, #0x10
    4e6c:      	mov	x9, sp
    4e70:      	ubfx	x6, x6, #8, #8
    4e74:      	orr	x20, x6, xzr
    4e78:      	uxtb	w16, w3
    4e7c:      	cmp	w16, wzr
    4e80:      	b.eq	0x50f8 <_stogir.checked.validate+0x4fc>
    4e84:      	uxtb	w16, w1
    4e88:      	cmp	w16, wzr
    4e8c:      	b.eq	0x50f8 <_stogir.checked.validate+0x4fc>
    4e90:      	cmp	x20, #0x1
    4e94:      	b.lt	0x50f8 <_stogir.checked.validate+0x4fc>
    4e98:      	cmp	x20, #0xb
    4e9c:      	b.gt	0x50f8 <_stogir.checked.validate+0x4fc>
    4ea0:      	cmp	x20, #0x1
    4ea4:      	b.eq	0x50f8 <_stogir.checked.validate+0x4fc>
    4ea8:      	mov	x1, x2
    4eac:      	movz	x3, #0x0, lsl #48
    4eb0:      	b	0x5108 <_stogir.checked.validate+0x50c>
    4eb4:      	movz	x4, #0x0, lsl #48
    4eb8:      	b	0x4cd4 <_stogir.checked.validate+0xd8>
    4ebc:      	lsr	x0, x22, #0
    4ec0:      	mov	x1, x2
    4ec4:      	mov	x2, x0
    4ec8:      	mov	x0, x21
    4ecc:      	mov	x23, x8
    4ed0:      	bl	0x4ed0 <_stogir.checked.validate+0x2d4>
		0000000000004ed0:  ARM64_RELOC_BRANCH26	_memcmp
    4ed4:      	lsr	w0, w0, #0
    4ed8:      	sxtw	x0, w0
    4edc:      	cmp	x0, #0x0
    4ee0:      	b.eq	0x4ff0 <_stogir.checked.validate+0x3f4>
    4ee4:      	mov	x1, x21
    4ee8:      	mov	x2, x22
    4eec:      	mov	x0, #0x1                ; =1
    4ef0:      	mov	sp, x19
    4ef4:      	b	0x4dcc <_stogir.checked.validate+0x1d0>
    4ef8:      	mov	x1, x11
    4efc:      	mov	x3, #0x28               ; =40
    4f00:      	mov	x21, x1
    4f04:      	mov	x22, x3
    4f08:      	mov	x1, x4
    4f0c:      	cmp	x1, #0x2
    4f10:      	b.ge	0x4f3c <_stogir.checked.validate+0x340>
    4f14:      	add	x3, x1, #0x1
    4f18:      	lsl	x1, x1, #2
    4f1c:      	add	x1, x1, x6
    4f20:      	ldr	w1, [x1]
    4f24:      	sxtw	x1, w1
    4f28:      	and	x1, x1, #0xffffffff
    4f2c:      	mov	x4, x3
    4f30:      	mov	x3, x1
    4f34:      	mov	x1, #0x1                ; =1
    4f38:      	b	0x4f48 <_stogir.checked.validate+0x34c>
    4f3c:      	mov	x4, x1
    4f40:      	movz	x1, #0x0, lsl #48
    4f44:      	movz	x3, #0x0, lsl #48
    4f48:      	lsr	w1, w1, #0
    4f4c:      	lsr	x16, x1, #0
    4f50:      	cmp	x16, #0x1
    4f54:      	b.eq	0x4f70 <_stogir.checked.validate+0x374>
    4f58:      	b.lo	0x4f60 <_stogir.checked.validate+0x364>
    4f5c:      	b	0x4f74 <_stogir.checked.validate+0x378>
    4f60:      	cmp	x16, #0x0
    4f64:      	b.eq	0x4f6c <_stogir.checked.validate+0x370>
    4f68:      	b	0x4f74 <_stogir.checked.validate+0x378>
    4f6c:      	b	0x4fdc <_stogir.checked.validate+0x3e0>
    4f70:      	b	0x4f78 <_stogir.checked.validate+0x37c>
    4f74:      	b	0x5180 <_stogir.checked.validate+0x584>
    4f78:      	lsr	w3, w3, #0
    4f7c:      	sxtw	x3, w3
    4f80:      	cmp	x3, #0x0
    4f84:      	cset	w1, gt
    4f88:      	movz	x16, #0x0, lsl #48
    4f8c:      	sub	x5, x16, x3
    4f90:      	sub	x7, x5, #0x1
    4f94:      	uxtb	w16, w1
    4f98:      	cmp	w16, wzr
    4f9c:      	b.eq	0x5004 <_stogir.checked.validate+0x408>
    4fa0:      	ldr	x5, [x0, #0x8]
    4fa4:      	cmp	x3, x5
    4fa8:      	b.ge	0x5048 <_stogir.checked.validate+0x44c>
    4fac:      	ldr	x5, [x12, #0x8]
    4fb0:      	cmp	x3, x5
    4fb4:      	b.ge	0x5168 <_stogir.checked.validate+0x56c>
    4fb8:      	lsl	x5, x3, #2
    4fbc:      	ldr	x9, [x0, #0x78]
    4fc0:      	add	x5, x5, x9
    4fc4:      	ldr	w5, [x5]
    4fc8:      	sxtw	x5, w5
    4fcc:      	cmp	x5, #0x0
    4fd0:      	cset	w5, ge
    4fd4:      	ubfx	x5, x5, #0, #8
    4fd8:      	b	0x516c <_stogir.checked.validate+0x570>
    4fdc:      	cmp	x22, #0x0
    4fe0:      	b.ne	0x51a8 <_stogir.checked.validate+0x5ac>
    4fe4:      	cmp	x22, #0x0
    4fe8:      	b.ne	0x4ebc <_stogir.checked.validate+0x2c0>
    4fec:      	mov	x23, x8
    4ff0:      	and	x0, x20, #0xffffffff
    4ff4:      	mov	x1, x0
    4ff8:      	movz	x0, #0x0, lsl #48
    4ffc:      	movz	x2, #0x0, lsl #48
    5000:      	b	0x4ef0 <_stogir.checked.validate+0x2f4>
    5004:      	cmp	x3, #0x0
    5008:      	b.ge	0x5050 <_stogir.checked.validate+0x454>
    500c:      	ldr	x9, [x13, #0x8]
    5010:      	ldr	x15, [x14, #0x8]
    5014:      	cmp	x9, x15
    5018:      	b.ne	0x5160 <_stogir.checked.validate+0x564>
    501c:      	cmp	x5, x9
    5020:      	b.gt	0x5178 <_stogir.checked.validate+0x57c>
    5024:      	lsl	x5, x7, #2
    5028:      	ldr	x9, [x0, #0x50]
    502c:      	add	x5, x5, x9
    5030:      	ldr	w5, [x5]
    5034:      	sxtw	x5, w5
    5038:      	cmp	x5, #0x0
    503c:      	cset	w5, gt
    5040:      	ubfx	x5, x5, #0, #8
    5044:      	b	0x517c <_stogir.checked.validate+0x580>
    5048:      	movz	x5, #0x0, lsl #48
    504c:      	b	0x5054 <_stogir.checked.validate+0x458>
    5050:      	movz	x5, #0x0, lsl #48
    5054:      	cmp	x5, #0x0
    5058:      	b.eq	0x5098 <_stogir.checked.validate+0x49c>
    505c:      	uxtb	w16, w1
    5060:      	cmp	w16, wzr
    5064:      	b.eq	0x507c <_stogir.checked.validate+0x480>
    5068:      	lsl	x1, x3, #4
    506c:      	ldr	x3, [x0]
    5070:      	add	x1, x1, x3
    5074:      	ldr	x1, [x1]
    5078:      	b	0x508c <_stogir.checked.validate+0x490>
    507c:      	lsl	x1, x7, #4
    5080:      	ldr	x3, [x0, #0x28]
    5084:      	add	x1, x1, x3
    5088:      	ldr	x1, [x1]
    508c:      	mov	x3, x1
    5090:      	mov	x1, #0x1                ; =1
    5094:      	b	0x50a0 <_stogir.checked.validate+0x4a4>
    5098:      	movz	x1, #0x0, lsl #48
    509c:      	movz	x3, #0x0, lsl #48
    50a0:      	lsr	w1, w1, #0
    50a4:      	lsr	x16, x1, #0
    50a8:      	cmp	x16, #0x1
    50ac:      	b.eq	0x50c8 <_stogir.checked.validate+0x4cc>
    50b0:      	b.lo	0x50b8 <_stogir.checked.validate+0x4bc>
    50b4:      	b	0x50cc <_stogir.checked.validate+0x4d0>
    50b8:      	cmp	x16, #0x0
    50bc:      	b.eq	0x50c4 <_stogir.checked.validate+0x4c8>
    50c0:      	b	0x50cc <_stogir.checked.validate+0x4d0>
    50c4:      	b	0x50d0 <_stogir.checked.validate+0x4d4>
    50c8:      	b	0x50dc <_stogir.checked.validate+0x4e0>
    50cc:      	b	0x5188 <_stogir.checked.validate+0x58c>
    50d0:      	mov	x1, x10
    50d4:      	mov	x3, #0x22               ; =34
    50d8:      	b	0x4f00 <_stogir.checked.validate+0x304>
    50dc:      	lsr	w3, w3, #0
    50e0:      	ubfx	x1, x3, #8, #8
    50e4:      	cmp	x1, x20
    50e8:      	b.ne	0x4ef8 <_stogir.checked.validate+0x2fc>
    50ec:      	mov	x1, x21
    50f0:      	mov	x3, x22
    50f4:      	b	0x4f00 <_stogir.checked.validate+0x304>
    50f8:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		00000000000050f8:  ARM64_RELOC_PAGE21	l_stogir.358
    50fc:      	ldr	x16, [x16]
		00000000000050fc:  ARM64_RELOC_PAGEOFF12	l_stogir.358
    5100:      	orr	x1, x16, xzr
    5104:      	mov	x3, #0x36               ; =54
    5108:      	orr	x6, x9, xzr
    510c:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		000000000000510c:  ARM64_RELOC_PAGE21	l_stogir.359
    5110:      	ldr	x16, [x16]
		0000000000005110:  ARM64_RELOC_PAGEOFF12	l_stogir.359
    5114:      	orr	x10, x16, xzr
    5118:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005118:  ARM64_RELOC_PAGE21	l_stogir.360
    511c:      	ldr	x16, [x16]
		000000000000511c:  ARM64_RELOC_PAGEOFF12	l_stogir.360
    5120:      	orr	x11, x16, xzr
    5124:      	add	x12, x0, #0x78
    5128:      	add	x13, x0, #0x28
    512c:      	add	x14, x0, #0x50
    5130:      	lsr	w5, w5, #0
    5134:      	lsr	x4, x4, #32
    5138:      	lsr	w5, w5, #0
    513c:      	lsr	w4, w4, #0
    5140:      	str	w4, [x7]
    5144:      	str	w5, [x7, #0x4]
    5148:      	ldr	x4, [x7]
    514c:      	str	x4, [x9]
    5150:      	mov	x21, x1
    5154:      	mov	x22, x3
    5158:      	movz	x1, #0x0, lsl #48
    515c:      	b	0x4f0c <_stogir.checked.validate+0x310>
    5160:      	movz	x5, #0x0, lsl #48
    5164:      	b	0x5054 <_stogir.checked.validate+0x458>
    5168:      	movz	x5, #0x0, lsl #48
    516c:      	b	0x504c <_stogir.checked.validate+0x450>
    5170:      	brk	#0
    5174:      	b	0x5170 <_stogir.checked.validate+0x574>
    5178:      	movz	x5, #0x0, lsl #48
    517c:      	b	0x5164 <_stogir.checked.validate+0x568>
    5180:      	brk	#0
    5184:      	b	0x5180 <_stogir.checked.validate+0x584>
    5188:      	brk	#0
    518c:      	b	0x5188 <_stogir.checked.validate+0x58c>
    5190:      	mov	x23, x8
    5194:      	b	0x4db4 <_stogir.checked.validate+0x1b8>
    5198:      	mov	x23, x8
    519c:      	b	0x4db4 <_stogir.checked.validate+0x1b8>
    51a0:      	mov	x23, x8
    51a4:      	b	0x4db4 <_stogir.checked.validate+0x1b8>
    51a8:      	mov	x23, x8
    51ac:      	b	0x4ee4 <_stogir.checked.validate+0x2e8>

00000000000051b0 <_stogir.atomic.operation?>:
    51b0:      	sxtw	x0, w0
    51b4:      	cmp	x0, #0x7e
    51b8:      	b.lt	0x51cc <_stogir.atomic.operation?+0x1c>
    51bc:      	cmp	x0, #0x82
    51c0:      	cset	w0, le
    51c4:      	ubfx	x0, x0, #0, #8
    51c8:      	b	0x51d0 <_stogir.atomic.operation?+0x20>
    51cc:      	movz	x0, #0x0, lsl #48
    51d0:      	ret

00000000000051d4 <_stogir.atomic.validate>:
    51d4:      	sub	sp, sp, #0x110
    51d8:      	str	x29, [sp, #0x10]
    51dc:      	str	x30, [sp, #0x18]
    51e0:      	add	x29, sp, #0x10
    51e4:      	str	x19, [sp, #0xc0]
    51e8:      	str	x20, [sp, #0xc8]
    51ec:      	str	x21, [sp, #0xd0]
    51f0:      	str	x22, [sp, #0xd8]
    51f4:      	str	x23, [sp, #0xe0]
    51f8:      	str	x24, [sp, #0xe8]
    51fc:      	str	x25, [sp, #0xf0]
    5200:      	str	x26, [sp, #0xf8]
    5204:      	str	x27, [sp, #0x100]
    5208:      	str	x28, [sp, #0x108]
    520c:      	sxtw	x2, w1
    5210:      	lsl	x3, x2, #2
    5214:      	cmp	x2, #0x0
    5218:      	cset	w4, gt
    521c:      	movz	x16, #0x0, lsl #48
    5220:      	sub	x5, x16, x2
    5224:      	sub	x6, x5, #0x1
    5228:      	uxtb	w16, w4
    522c:      	cmp	w16, wzr
    5230:      	b.eq	0x5270 <_stogir.atomic.validate+0x9c>
    5234:      	ldr	x5, [x0, #0x8]
    5238:      	cmp	x2, x5
    523c:      	b.ge	0x52c4 <_stogir.atomic.validate+0xf0>
    5240:      	add	x5, x0, #0x78
    5244:      	ldr	x5, [x5, #0x8]
    5248:      	cmp	x2, x5
    524c:      	b.ge	0x543c <_stogir.atomic.validate+0x268>
    5250:      	ldr	x5, [x0, #0x78]
    5254:      	add	x5, x3, x5
    5258:      	ldr	w5, [x5]
    525c:      	sxtw	x5, w5
    5260:      	cmp	x5, #0x0
    5264:      	cset	w5, ge
    5268:      	ubfx	x5, x5, #0, #8
    526c:      	b	0x5440 <_stogir.atomic.validate+0x26c>
    5270:      	cmp	x2, #0x0
    5274:      	b.ge	0x52cc <_stogir.atomic.validate+0xf8>
    5278:      	add	x7, x0, #0x28
    527c:      	add	x9, x0, #0x50
    5280:      	ldr	x7, [x7, #0x8]
    5284:      	ldr	x9, [x9, #0x8]
    5288:      	cmp	x7, x9
    528c:      	b.ne	0x52bc <_stogir.atomic.validate+0xe8>
    5290:      	cmp	x5, x7
    5294:      	b.gt	0x5510 <_stogir.atomic.validate+0x33c>
    5298:      	lsl	x5, x6, #2
    529c:      	ldr	x7, [x0, #0x50]
    52a0:      	add	x5, x5, x7
    52a4:      	ldr	w5, [x5]
    52a8:      	sxtw	x5, w5
    52ac:      	cmp	x5, #0x0
    52b0:      	cset	w5, gt
    52b4:      	ubfx	x5, x5, #0, #8
    52b8:      	b	0x5514 <_stogir.atomic.validate+0x340>
    52bc:      	movz	x5, #0x0, lsl #48
    52c0:      	b	0x52d0 <_stogir.atomic.validate+0xfc>
    52c4:      	movz	x5, #0x0, lsl #48
    52c8:      	b	0x52d0 <_stogir.atomic.validate+0xfc>
    52cc:      	movz	x5, #0x0, lsl #48
    52d0:      	cmp	x5, #0x0
    52d4:      	b.eq	0x5334 <_stogir.atomic.validate+0x160>
    52d8:      	uxtb	w16, w4
    52dc:      	cmp	w16, wzr
    52e0:      	b.eq	0x5308 <_stogir.atomic.validate+0x134>
    52e4:      	lsl	x4, x2, #4
    52e8:      	ldr	x5, [x0]
    52ec:      	add	x4, x4, x5
    52f0:      	ldr	x5, [x4]
    52f4:      	ldr	x4, [x4, #0x8]
    52f8:      	fmov	d31, x4
    52fc:      	mov	x4, x5
    5300:      	fmov	x5, d31
    5304:      	b	0x5328 <_stogir.atomic.validate+0x154>
    5308:      	lsl	x4, x6, #4
    530c:      	ldr	x5, [x0, #0x28]
    5310:      	add	x4, x4, x5
    5314:      	ldr	x5, [x4]
    5318:      	ldr	x4, [x4, #0x8]
    531c:      	fmov	d31, x4
    5320:      	mov	x4, x5
    5324:      	fmov	x5, d31
    5328:      	mov	x19, x4
    532c:      	mov	x4, #0x1                ; =1
    5330:      	b	0x5340 <_stogir.atomic.validate+0x16c>
    5334:      	movz	x4, #0x0, lsl #48
    5338:      	movz	x19, #0x0, lsl #48
    533c:      	movz	x5, #0x0, lsl #48
    5340:      	lsr	w4, w4, #0
    5344:      	lsr	x16, x4, #0
    5348:      	cmp	x16, #0x1
    534c:      	b.eq	0x5368 <_stogir.atomic.validate+0x194>
    5350:      	b.lo	0x5358 <_stogir.atomic.validate+0x184>
    5354:      	b	0x536c <_stogir.atomic.validate+0x198>
    5358:      	cmp	x16, #0x0
    535c:      	b.eq	0x5364 <_stogir.atomic.validate+0x190>
    5360:      	b	0x536c <_stogir.atomic.validate+0x198>
    5364:      	b	0x5370 <_stogir.atomic.validate+0x19c>
    5368:      	b	0x53d0 <_stogir.atomic.validate+0x1fc>
    536c:      	b	0x5b68 <_stogir.atomic.validate+0x994>
    5370:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005370:  ARM64_RELOC_PAGE21	l_stogir.361
    5374:      	ldr	x16, [x16]
		0000000000005374:  ARM64_RELOC_PAGEOFF12	l_stogir.361
    5378:      	orr	x0, x16, xzr
    537c:      	mov	x24, x8
    5380:      	mov	x1, x0
    5384:      	mov	x0, #0x1                ; =1
    5388:      	mov	x2, #0x1a               ; =26
    538c:      	str	x0, [x24]
    5390:      	str	x1, [x24, #0x8]
    5394:      	str	x2, [x24, #0x10]
    5398:      	ldr	x19, [sp, #0xc0]
    539c:      	ldr	x20, [sp, #0xc8]
    53a0:      	ldr	x21, [sp, #0xd0]
    53a4:      	ldr	x22, [sp, #0xd8]
    53a8:      	ldr	x23, [sp, #0xe0]
    53ac:      	ldr	x24, [sp, #0xe8]
    53b0:      	ldr	x25, [sp, #0xf0]
    53b4:      	ldr	x26, [sp, #0xf8]
    53b8:      	ldr	x27, [sp, #0x100]
    53bc:      	ldr	x28, [sp, #0x108]
    53c0:      	ldr	x29, [sp, #0x10]
    53c4:      	ldr	x30, [sp, #0x18]
    53c8:      	add	sp, sp, #0x110
    53cc:      	ret
    53d0:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		00000000000053d0:  ARM64_RELOC_PAGE21	l_stogir.362
    53d4:      	ldr	x16, [x16]
		00000000000053d4:  ARM64_RELOC_PAGEOFF12	l_stogir.362
    53d8:      	orr	x20, x16, xzr
    53dc:      	uxtb	w4, w19
    53e0:      	add	x16, sp, #0x20
    53e4:      	str	x19, [x16]
    53e8:      	orr	x21, x4, xzr
    53ec:      	add	x16, sp, #0x20
    53f0:      	str	x5, [x16, #0x8]
    53f4:      	cmp	x2, #0x0
    53f8:      	b.le	0x5490 <_stogir.atomic.validate+0x2bc>
    53fc:      	cmp	x21, #0x7e
    5400:      	b.lt	0x5490 <_stogir.atomic.validate+0x2bc>
    5404:      	cmp	x21, #0x82
    5408:      	b.gt	0x5490 <_stogir.atomic.validate+0x2bc>
    540c:      	ldr	x2, [x0, #0x78]
    5410:      	add	x2, x3, x2
    5414:      	ldr	w2, [x2]
    5418:      	cmp	x21, #0x83
    541c:      	b.ge	0x5a90 <_stogir.atomic.validate+0x8bc>
    5420:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005420:  ARM64_RELOC_PAGE21	l_stogir.363
    5424:      	ldr	x16, [x16]
		0000000000005424:  ARM64_RELOC_PAGEOFF12	l_stogir.363
    5428:      	orr	x3, x16, xzr
    542c:      	add	x3, x21, x3
    5430:      	ldrsb	w3, [x3]
    5434:      	sxtb	x3, w3
    5438:      	b	0x5a94 <_stogir.atomic.validate+0x8c0>
    543c:      	movz	x5, #0x0, lsl #48
    5440:      	b	0x52c8 <_stogir.atomic.validate+0xf4>
    5444:      	mov	x19, x21
    5448:      	mov	x21, x23
    544c:      	cmp	x21, #0x0
    5450:      	b.ne	0x5480 <_stogir.atomic.validate+0x2ac>
    5454:      	cmp	x21, #0x0
    5458:      	b.eq	0x5934 <_stogir.atomic.validate+0x760>
    545c:      	lsr	x0, x21, #0
    5460:      	mov	x1, x20
    5464:      	mov	x2, x0
    5468:      	mov	x0, x19
    546c:      	bl	0x546c <_stogir.atomic.validate+0x298>
		000000000000546c:  ARM64_RELOC_BRANCH26	_memcmp
    5470:      	lsr	w0, w0, #0
    5474:      	sxtw	x0, w0
    5478:      	cmp	x0, #0x0
    547c:      	b.eq	0x5934 <_stogir.atomic.validate+0x760>
    5480:      	mov	x1, x19
    5484:      	mov	x2, x21
    5488:      	mov	x0, #0x1                ; =1
    548c:      	b	0x538c <_stogir.atomic.validate+0x1b8>
    5490:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005490:  ARM64_RELOC_PAGE21	l_stogir.364
    5494:      	ldr	x16, [x16]
		0000000000005494:  ARM64_RELOC_PAGEOFF12	l_stogir.364
    5498:      	orr	x2, x16, xzr
    549c:      	mov	x22, x2
    54a0:      	mov	x23, #0x20              ; =32
    54a4:      	add	x16, sp, #0x20
    54a8:      	ldr	w2, [x16, #0x4]
    54ac:      	lsr	w2, w2, #0
    54b0:      	mov	x24, x8
    54b4:      	add	x8, sp, #0x30
    54b8:      	mov	x25, x0
    54bc:      	mov	w26, w1
    54c0:      	mov	w1, w2
    54c4:      	bl	0x54c4 <_stogir.atomic.validate+0x2f0>
		00000000000054c4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    54c8:      	add	x16, sp, #0x30
    54cc:      	ldr	w0, [x16]
    54d0:      	lsr	x16, x0, #0
    54d4:      	cmp	x16, #0x1
    54d8:      	b.eq	0x54f4 <_stogir.atomic.validate+0x320>
    54dc:      	b.lo	0x54e4 <_stogir.atomic.validate+0x310>
    54e0:      	b	0x54f8 <_stogir.atomic.validate+0x324>
    54e4:      	cmp	x16, #0x0
    54e8:      	b.eq	0x54f0 <_stogir.atomic.validate+0x31c>
    54ec:      	b	0x54f8 <_stogir.atomic.validate+0x324>
    54f0:      	b	0x54fc <_stogir.atomic.validate+0x328>
    54f4:      	b	0x55f8 <_stogir.atomic.validate+0x424>
    54f8:      	b	0x5ba0 <_stogir.atomic.validate+0x9cc>
    54fc:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		00000000000054fc:  ARM64_RELOC_PAGE21	l_stogir.365
    5500:      	ldr	x16, [x16]
		0000000000005500:  ARM64_RELOC_PAGEOFF12	l_stogir.365
    5504:      	orr	x0, x16, xzr
    5508:      	mov	x1, #0x16               ; =22
    550c:      	b	0x5520 <_stogir.atomic.validate+0x34c>
    5510:      	movz	x5, #0x0, lsl #48
    5514:      	b	0x52c0 <_stogir.atomic.validate+0xec>
    5518:      	mov	x0, x1
    551c:      	mov	x1, x2
    5520:      	cmp	x21, #0x82
    5524:      	cset	w22, eq
    5528:      	lsr	w19, w19, #0
    552c:      	ubfx	x2, x19, #8, #8
    5530:      	orr	x19, x2, xzr
    5534:      	cmp	x19, #0x0
    5538:      	cset	w23, eq
    553c:      	uxtb	w16, w22
    5540:      	cmp	w16, wzr
    5544:      	b.eq	0x556c <_stogir.atomic.validate+0x398>
    5548:      	uxtb	w16, w23
    554c:      	cmp	w16, wzr
    5550:      	b.eq	0x5794 <_stogir.atomic.validate+0x5c0>
    5554:      	mov	x2, x0
    5558:      	movz	x0, #0x0, lsl #48
    555c:      	b	0x579c <_stogir.atomic.validate+0x5c8>
    5560:      	mov	x0, x2
    5564:      	mov	x27, x1
    5568:      	b	0x5570 <_stogir.atomic.validate+0x39c>
    556c:      	mov	x27, x1
    5570:      	uxtb	w16, w22
    5574:      	cmp	w16, wzr
    5578:      	b.eq	0x5588 <_stogir.atomic.validate+0x3b4>
    557c:      	mov	x28, x0
    5580:      	movz	x0, #0x0, lsl #48
    5584:      	b	0x5590 <_stogir.atomic.validate+0x3bc>
    5588:      	mov	x28, x0
    558c:      	mov	x0, #0x1                ; =1
    5590:      	cmp	x0, #0x0
    5594:      	b.eq	0x55c8 <_stogir.atomic.validate+0x3f4>
    5598:      	add	x16, sp, #0x20
    559c:      	ldr	w0, [x16, #0x8]
    55a0:      	lsr	w0, w0, #0
    55a4:      	mov	w1, w0
    55a8:      	mov	x0, x25
    55ac:      	mov	x2, #0x6                ; =6
    55b0:      	bl	0x55b0 <_stogir.atomic.validate+0x3dc>
		00000000000055b0:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    55b4:      	cmp	x0, #0x0
    55b8:      	b.eq	0x5748 <_stogir.atomic.validate+0x574>
    55bc:      	mov	x1, x28
    55c0:      	movz	x0, #0x0, lsl #48
    55c4:      	b	0x5750 <_stogir.atomic.validate+0x57c>
    55c8:      	mov	x0, x19
    55cc:      	mov	x1, x28
    55d0:      	mov	x2, x27
    55d4:      	cmp	x21, #0x80
    55d8:      	cset	w19, eq
    55dc:      	uxtb	w16, w19
    55e0:      	cmp	w16, wzr
    55e4:      	b.eq	0x5644 <_stogir.atomic.validate+0x470>
    55e8:      	mov	x21, x1
    55ec:      	mov	x23, x2
    55f0:      	mov	x1, #0x1                ; =1
    55f4:      	b	0x565c <_stogir.atomic.validate+0x488>
    55f8:      	add	x16, sp, #0x30
    55fc:      	orr	x0, x16, xzr
    5600:      	add	x0, x0, #0x8
    5604:      	add	x16, sp, #0x30
    5608:      	ldr	x1, [x16, #0x8]
    560c:      	add	x16, sp, #0x60
    5610:      	str	x1, [x16]
    5614:      	ldr	x0, [x0, #0x8]
    5618:      	add	x16, sp, #0x60
    561c:      	str	x0, [x16, #0x8]
    5620:      	add	x16, sp, #0x20
    5624:      	ldr	w0, [x16, #0x4]
    5628:      	sxtw	x0, w0
    562c:      	cmp	x0, #0x0
    5630:      	b.gt	0x57fc <_stogir.atomic.validate+0x628>
    5634:      	mov	x1, x22
    5638:      	mov	x2, x23
    563c:      	mov	x0, #0x1                ; =1
    5640:      	b	0x57e0 <_stogir.atomic.validate+0x60c>
    5644:      	cmp	x21, #0x81
    5648:      	cset	w3, eq
    564c:      	ubfx	x3, x3, #0, #8
    5650:      	mov	x21, x1
    5654:      	mov	x1, x3
    5658:      	mov	x23, x2
    565c:      	lsr	w27, w0, #0
    5660:      	cmp	x1, #0x0
    5664:      	b.eq	0x5444 <_stogir.atomic.validate+0x270>
    5668:      	lsr	w26, w26, #0
    566c:      	add	x16, sp, #0xb0
    5670:      	str	x16, [sp]
    5674:      	mov	x0, x25
    5678:      	mov	w1, w26
    567c:      	mov	x2, #0x4                ; =4
    5680:      	bl	0x5680 <_stogir.atomic.validate+0x4ac>
		0000000000005680:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    5684:      	ldr	x16, [sp]
    5688:      	str	x0, [x16]
    568c:      	str	x1, [x16, #0x8]
    5690:      	add	x16, sp, #0xb0
    5694:      	ldr	x0, [x16]
    5698:      	add	x16, sp, #0xb0
    569c:      	ldr	x1, [x16, #0x8]
    56a0:      	lsr	w2, w0, #0
    56a4:      	add	x16, sp, #0xa0
    56a8:      	str	x0, [x16]
    56ac:      	add	x16, sp, #0xa0
    56b0:      	str	x1, [x16, #0x8]
    56b4:      	lsr	x16, x2, #0
    56b8:      	cmp	x16, #0x1
    56bc:      	b.eq	0x56d8 <_stogir.atomic.validate+0x504>
    56c0:      	b.lo	0x56c8 <_stogir.atomic.validate+0x4f4>
    56c4:      	b	0x56dc <_stogir.atomic.validate+0x508>
    56c8:      	cmp	x16, #0x0
    56cc:      	b.eq	0x56d4 <_stogir.atomic.validate+0x500>
    56d0:      	b	0x56dc <_stogir.atomic.validate+0x508>
    56d4:      	b	0x56e0 <_stogir.atomic.validate+0x50c>
    56d8:      	b	0x5948 <_stogir.atomic.validate+0x774>
    56dc:      	b	0x5bb0 <_stogir.atomic.validate+0x9dc>
    56e0:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		00000000000056e0:  ARM64_RELOC_PAGE21	l_stogir.366
    56e4:      	ldr	x16, [x16]
		00000000000056e4:  ARM64_RELOC_PAGEOFF12	l_stogir.366
    56e8:      	orr	x0, x16, xzr
    56ec:      	mov	x1, #0x1d               ; =29
    56f0:      	b	0x571c <_stogir.atomic.validate+0x548>
    56f4:      	mov	x0, x1
    56f8:      	mov	x1, x2
    56fc:      	mov	x2, x1
    5700:      	mov	x1, x0
    5704:      	mov	x0, x19
    5708:      	b	0x55d4 <_stogir.atomic.validate+0x400>
    570c:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		000000000000570c:  ARM64_RELOC_PAGE21	l_stogir.367
    5710:      	ldr	x16, [x16]
		0000000000005710:  ARM64_RELOC_PAGEOFF12	l_stogir.367
    5714:      	orr	x0, x16, xzr
    5718:      	mov	x1, #0x24               ; =36
    571c:      	mov	x19, x0
    5720:      	mov	x21, x1
    5724:      	b	0x544c <_stogir.atomic.validate+0x278>
    5728:      	mov	x0, #0x1                ; =1
    572c:      	lsr	w0, w0, #0
    5730:      	sxtw	x0, w0
    5734:      	and	x0, x0, #0xffffffff
    5738:      	mov	x1, x0
    573c:      	movz	x0, #0x0, lsl #48
    5740:      	movz	x2, #0x0, lsl #48
    5744:      	b	0x548c <_stogir.atomic.validate+0x2b8>
    5748:      	mov	x1, x28
    574c:      	mov	x0, #0x1                ; =1
    5750:      	cmp	x0, #0x0
    5754:      	b.eq	0x576c <_stogir.atomic.validate+0x598>
    5758:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005758:  ARM64_RELOC_PAGE21	l_stogir.368
    575c:      	ldr	x16, [x16]
		000000000000575c:  ARM64_RELOC_PAGEOFF12	l_stogir.368
    5760:      	orr	x0, x16, xzr
    5764:      	mov	x1, #0x1b               ; =27
    5768:      	b	0x5774 <_stogir.atomic.validate+0x5a0>
    576c:      	mov	x0, x1
    5770:      	mov	x1, x27
    5774:      	cmp	x21, #0x7f
    5778:      	b.ne	0x5850 <_stogir.atomic.validate+0x67c>
    577c:      	uxtb	w16, w23
    5780:      	cmp	w16, wzr
    5784:      	b.eq	0x598c <_stogir.atomic.validate+0x7b8>
    5788:      	mov	x2, x0
    578c:      	movz	x0, #0x0, lsl #48
    5790:      	b	0x5994 <_stogir.atomic.validate+0x7c0>
    5794:      	mov	x2, x0
    5798:      	mov	x0, #0x1                ; =1
    579c:      	cmp	x0, #0x0
    57a0:      	b.eq	0x5560 <_stogir.atomic.validate+0x38c>
    57a4:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		00000000000057a4:  ARM64_RELOC_PAGE21	l_stogir.369
    57a8:      	ldr	x16, [x16]
		00000000000057a8:  ARM64_RELOC_PAGEOFF12	l_stogir.369
    57ac:      	orr	x0, x16, xzr
    57b0:      	mov	x1, #0x19               ; =25
    57b4:      	b	0x5564 <_stogir.atomic.validate+0x390>
    57b8:      	movz	x0, #0x0, lsl #48
    57bc:      	uxtb	w0, w0
    57c0:      	and	x0, x0, #0x4
    57c4:      	uxtb	w0, w0
    57c8:      	cmp	x0, #0x0
    57cc:      	cset	w0, eq
    57d0:      	uxtb	w16, w0
    57d4:      	cmp	w16, wzr
    57d8:      	cset	x0, eq
    57dc:      	mov	x2, x23
    57e0:      	cmp	x0, #0x0
    57e4:      	b.eq	0x5518 <_stogir.atomic.validate+0x344>
    57e8:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		00000000000057e8:  ARM64_RELOC_PAGE21	l_stogir.370
    57ec:      	ldr	x16, [x16]
		00000000000057ec:  ARM64_RELOC_PAGEOFF12	l_stogir.370
    57f0:      	orr	x0, x16, xzr
    57f4:      	mov	x1, #0x16               ; =22
    57f8:      	b	0x5520 <_stogir.atomic.validate+0x34c>
    57fc:      	add	x16, sp, #0x60
    5800:      	ldr	w0, [x16]
    5804:      	uxtb	w0, w0
    5808:      	cmp	x0, #0x83
    580c:      	b.ge	0x5a6c <_stogir.atomic.validate+0x898>
    5810:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005810:  ARM64_RELOC_PAGE21	l_stogir.371
    5814:      	ldr	x16, [x16]
		0000000000005814:  ARM64_RELOC_PAGEOFF12	l_stogir.371
    5818:      	orr	x1, x16, xzr
    581c:      	add	x0, x0, x1
    5820:      	ldrb	w0, [x0]
    5824:      	mov	x1, x22
    5828:      	b	0x5a74 <_stogir.atomic.validate+0x8a0>
    582c:      	add	x16, sp, #0x70
    5830:      	ldr	x0, [x16, #0x8]
    5834:      	lsr	w0, w0, #0
    5838:      	ubfx	x0, x0, #8, #8
    583c:      	mov	x1, x23
    5840:      	mov	x2, x27
    5844:      	mov	x19, x0
    5848:      	mov	x0, x1
    584c:      	mov	x1, x2
    5850:      	cmp	x19, #0x2
    5854:      	b.ge	0x58fc <_stogir.atomic.validate+0x728>
    5858:      	mov	x2, x1
    585c:      	mov	x1, x0
    5860:      	mov	x0, #0x1                ; =1
    5864:      	b	0x5918 <_stogir.atomic.validate+0x744>
    5868:      	mov	x1, x27
    586c:      	mov	x2, x23
    5870:      	movz	x0, #0x0, lsl #48
    5874:      	cmp	x0, #0x0
    5878:      	b.eq	0x56f4 <_stogir.atomic.validate+0x520>
    587c:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		000000000000587c:  ARM64_RELOC_PAGE21	l_stogir.372
    5880:      	ldr	x16, [x16]
		0000000000005880:  ARM64_RELOC_PAGEOFF12	l_stogir.372
    5884:      	orr	x0, x16, xzr
    5888:      	mov	x1, #0x22               ; =34
    588c:      	b	0x56fc <_stogir.atomic.validate+0x528>
    5890:      	mov	x1, x27
    5894:      	mov	x0, #0x1                ; =1
    5898:      	mov	x2, x23
    589c:      	b	0x5874 <_stogir.atomic.validate+0x6a0>
    58a0:      	mov	x27, x0
    58a4:      	mov	x0, #0x1                ; =1
    58a8:      	cmp	x0, #0x0
    58ac:      	b.eq	0x5868 <_stogir.atomic.validate+0x694>
    58b0:      	lsr	w0, w19, #0
    58b4:      	add	x16, sp, #0x20
    58b8:      	ldr	w1, [x16, #0xc]
    58bc:      	lsr	w1, w1, #0
    58c0:      	mov	w2, w0
    58c4:      	mov	x0, x25
    58c8:      	bl	0x58c8 <_stogir.atomic.validate+0x6f4>
		00000000000058c8:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    58cc:      	cmp	x0, #0x0
    58d0:      	b.eq	0x5890 <_stogir.atomic.validate+0x6bc>
    58d4:      	mov	x1, x27
    58d8:      	movz	x0, #0x0, lsl #48
    58dc:      	b	0x5898 <_stogir.atomic.validate+0x6c4>
    58e0:      	mov	x0, x1
    58e4:      	mov	x23, x2
    58e8:      	cmp	x21, #0x7e
    58ec:      	b.ne	0x58a0 <_stogir.atomic.validate+0x6cc>
    58f0:      	mov	x27, x0
    58f4:      	movz	x0, #0x0, lsl #48
    58f8:      	b	0x58a8 <_stogir.atomic.validate+0x6d4>
    58fc:      	cmp	x19, #0x5
    5900:      	cset	w2, gt
    5904:      	ubfx	x2, x2, #0, #8
    5908:      	fmov	d31, x0
    590c:      	mov	x0, x2
    5910:      	mov	x2, x1
    5914:      	fmov	x1, d31
    5918:      	cmp	x0, #0x0
    591c:      	b.eq	0x58e0 <_stogir.atomic.validate+0x70c>
    5920:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005920:  ARM64_RELOC_PAGE21	l_stogir.373
    5924:      	ldr	x16, [x16]
		0000000000005924:  ARM64_RELOC_PAGEOFF12	l_stogir.373
    5928:      	orr	x0, x16, xzr
    592c:      	mov	x23, #0x25              ; =37
    5930:      	b	0x58e8 <_stogir.atomic.validate+0x714>
    5934:      	uxtb	w16, w22
    5938:      	cmp	w16, wzr
    593c:      	b.eq	0x5978 <_stogir.atomic.validate+0x7a4>
    5940:      	movz	x0, #0x0, lsl #48
    5944:      	b	0x5734 <_stogir.atomic.validate+0x560>
    5948:      	add	x16, sp, #0xa0
    594c:      	ldr	w0, [x16, #0x8]
    5950:      	uxtb	w16, w19
    5954:      	cmp	w16, wzr
    5958:      	b.eq	0x5ac0 <_stogir.atomic.validate+0x8ec>
    595c:      	sxtw	x0, w0
    5960:      	cmp	x0, #0x0
    5964:      	b.ge	0x5b70 <_stogir.atomic.validate+0x99c>
    5968:      	mov	x1, x21
    596c:      	mov	x2, x23
    5970:      	mov	x0, #0x1                ; =1
    5974:      	b	0x5b84 <_stogir.atomic.validate+0x9b0>
    5978:      	sxtw	x27, w27
    597c:      	cmp	x27, #0x0
    5980:      	b.ne	0x5ae8 <_stogir.atomic.validate+0x914>
    5984:      	movz	x0, #0x0, lsl #48
    5988:      	b	0x572c <_stogir.atomic.validate+0x558>
    598c:      	mov	x2, x0
    5990:      	mov	x0, #0x1                ; =1
    5994:      	cmp	x0, #0x0
    5998:      	b.eq	0x59b4 <_stogir.atomic.validate+0x7e0>
    599c:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		000000000000599c:  ARM64_RELOC_PAGE21	l_stogir.374
    59a0:      	ldr	x16, [x16]
		00000000000059a0:  ARM64_RELOC_PAGEOFF12	l_stogir.374
    59a4:      	orr	x0, x16, xzr
    59a8:      	mov	x23, x0
    59ac:      	mov	x27, #0x19              ; =25
    59b0:      	b	0x59bc <_stogir.atomic.validate+0x7e8>
    59b4:      	mov	x23, x2
    59b8:      	mov	x27, x1
    59bc:      	add	x16, sp, #0x20
    59c0:      	ldr	w0, [x16, #0xc]
    59c4:      	lsr	w0, w0, #0
    59c8:      	add	x8, sp, #0x70
    59cc:      	mov	w1, w0
    59d0:      	mov	x0, x25
    59d4:      	bl	0x59d4 <_stogir.atomic.validate+0x800>
		00000000000059d4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    59d8:      	add	x16, sp, #0x70
    59dc:      	ldr	w0, [x16]
    59e0:      	lsr	x16, x0, #0
    59e4:      	cmp	x16, #0x1
    59e8:      	b.eq	0x5a04 <_stogir.atomic.validate+0x830>
    59ec:      	b.lo	0x59f4 <_stogir.atomic.validate+0x820>
    59f0:      	b	0x5a08 <_stogir.atomic.validate+0x834>
    59f4:      	cmp	x16, #0x0
    59f8:      	b.eq	0x5a00 <_stogir.atomic.validate+0x82c>
    59fc:      	b	0x5a08 <_stogir.atomic.validate+0x834>
    5a00:      	b	0x5a0c <_stogir.atomic.validate+0x838>
    5a04:      	b	0x582c <_stogir.atomic.validate+0x658>
    5a08:      	b	0x5bb8 <_stogir.atomic.validate+0x9e4>
    5a0c:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005a0c:  ARM64_RELOC_PAGE21	l_stogir.375
    5a10:      	ldr	x16, [x16]
		0000000000005a10:  ARM64_RELOC_PAGEOFF12	l_stogir.375
    5a14:      	orr	x0, x16, xzr
    5a18:      	mov	x1, x0
    5a1c:      	mov	x0, x19
    5a20:      	mov	x2, #0x1a               ; =26
    5a24:      	b	0x5844 <_stogir.atomic.validate+0x670>
    5a28:      	mov	x0, #0x1                ; =1
    5a2c:      	cmp	x0, #0x0
    5a30:      	b.eq	0x5a40 <_stogir.atomic.validate+0x86c>
    5a34:      	mov	x2, x23
    5a38:      	mov	x0, #0x1                ; =1
    5a3c:      	b	0x57e0 <_stogir.atomic.validate+0x60c>
    5a40:      	add	x16, sp, #0x60
    5a44:      	ldr	w0, [x16]
    5a48:      	uxtb	w0, w0
    5a4c:      	cmp	x0, #0x83
    5a50:      	b.ge	0x57b8 <_stogir.atomic.validate+0x5e4>
    5a54:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005a54:  ARM64_RELOC_PAGE21	l_stogir.371
    5a58:      	ldr	x16, [x16]
		0000000000005a58:  ARM64_RELOC_PAGEOFF12	l_stogir.371
    5a5c:      	orr	x2, x16, xzr
    5a60:      	add	x0, x0, x2
    5a64:      	ldrb	w0, [x0]
    5a68:      	b	0x57bc <_stogir.atomic.validate+0x5e8>
    5a6c:      	mov	x1, x22
    5a70:      	movz	x0, #0x0, lsl #48
    5a74:      	uxtb	w0, w0
    5a78:      	and	x0, x0, #0x1
    5a7c:      	uxtb	w0, w0
    5a80:      	cmp	x0, #0x0
    5a84:      	b.eq	0x5a28 <_stogir.atomic.validate+0x854>
    5a88:      	movz	x0, #0x0, lsl #48
    5a8c:      	b	0x5a2c <_stogir.atomic.validate+0x858>
    5a90:      	mov	x3, #-0x2               ; =-2
    5a94:      	sxtw	x2, w2
    5a98:      	lsr	w3, w3, #0
    5a9c:      	sxtw	x3, w3
    5aa0:      	cmp	x2, x3
    5aa4:      	b.ne	0x5490 <_stogir.atomic.validate+0x2bc>
    5aa8:      	mov	x22, x20
    5aac:      	movz	x23, #0x0, lsl #48
    5ab0:      	b	0x54a4 <_stogir.atomic.validate+0x2d0>
    5ab4:      	mov	x0, x1
    5ab8:      	mov	x1, x2
    5abc:      	b	0x571c <_stogir.atomic.validate+0x548>
    5ac0:      	lsr	w0, w0, #0
    5ac4:      	mov	w1, w0
    5ac8:      	mov	x0, x25
    5acc:      	mov	w2, w27
    5ad0:      	bl	0x5ad0 <_stogir.atomic.validate+0x8fc>
		0000000000005ad0:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    5ad4:      	cmp	x0, #0x0
    5ad8:      	b.eq	0x570c <_stogir.atomic.validate+0x538>
    5adc:      	mov	x0, x21
    5ae0:      	mov	x1, x23
    5ae4:      	b	0x571c <_stogir.atomic.validate+0x548>
    5ae8:      	cmp	x27, #0x1
    5aec:      	b.eq	0x5728 <_stogir.atomic.validate+0x554>
    5af0:      	cmp	x27, #0x2
    5af4:      	b.eq	0x5728 <_stogir.atomic.validate+0x554>
    5af8:      	cmp	x27, #0x7
    5afc:      	b.eq	0x5728 <_stogir.atomic.validate+0x554>
    5b00:      	cmp	x27, #0x8
    5b04:      	b.eq	0x5728 <_stogir.atomic.validate+0x554>
    5b08:      	cmp	x27, #0x3
    5b0c:      	b.eq	0x5ba8 <_stogir.atomic.validate+0x9d4>
    5b10:      	cmp	x27, #0x9
    5b14:      	b.eq	0x5ba8 <_stogir.atomic.validate+0x9d4>
    5b18:      	cmp	x27, #0x4
    5b1c:      	b.eq	0x5bc0 <_stogir.atomic.validate+0x9ec>
    5b20:      	cmp	x27, #0xa
    5b24:      	b.eq	0x5bc0 <_stogir.atomic.validate+0x9ec>
    5b28:      	cmp	x27, #0xd
    5b2c:      	b.eq	0x5bc0 <_stogir.atomic.validate+0x9ec>
    5b30:      	cmp	x27, #0x5
    5b34:      	b.eq	0x5bc8 <_stogir.atomic.validate+0x9f4>
    5b38:      	cmp	x27, #0xb
    5b3c:      	b.eq	0x5bc8 <_stogir.atomic.validate+0x9f4>
    5b40:      	cmp	x27, #0xc
    5b44:      	b.eq	0x5bc8 <_stogir.atomic.validate+0x9f4>
    5b48:      	cmp	x27, #0x6
    5b4c:      	cset	w0, eq
    5b50:      	uxtb	w16, w0
    5b54:      	cmp	w16, wzr
    5b58:      	mov	x16, #0x8               ; =8
    5b5c:      	movn	x17, #0x0, lsl #48
    5b60:      	csel	x0, x16, x17, ne
    5b64:      	b	0x5bcc <_stogir.atomic.validate+0x9f8>
    5b68:      	brk	#0
    5b6c:      	b	0x5b68 <_stogir.atomic.validate+0x994>
    5b70:      	cmp	x0, #0x9
    5b74:      	cset	w0, gt
    5b78:      	ubfx	x0, x0, #0, #8
    5b7c:      	mov	x1, x21
    5b80:      	mov	x2, x23
    5b84:      	cmp	x0, #0x0
    5b88:      	b.eq	0x5ab4 <_stogir.atomic.validate+0x8e0>
    5b8c:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005b8c:  ARM64_RELOC_PAGE21	l_stogir.376
    5b90:      	ldr	x16, [x16]
		0000000000005b90:  ARM64_RELOC_PAGEOFF12	l_stogir.376
    5b94:      	orr	x0, x16, xzr
    5b98:      	mov	x1, #0x1c               ; =28
    5b9c:      	b	0x5abc <_stogir.atomic.validate+0x8e8>
    5ba0:      	brk	#0
    5ba4:      	b	0x5ba0 <_stogir.atomic.validate+0x9cc>
    5ba8:      	mov	x0, #0x2                ; =2
    5bac:      	b	0x572c <_stogir.atomic.validate+0x558>
    5bb0:      	brk	#0
    5bb4:      	b	0x5bb0 <_stogir.atomic.validate+0x9dc>
    5bb8:      	brk	#0
    5bbc:      	b	0x5bb8 <_stogir.atomic.validate+0x9e4>
    5bc0:      	mov	x0, #0x4                ; =4
    5bc4:      	b	0x5bac <_stogir.atomic.validate+0x9d8>
    5bc8:      	mov	x0, #0x8                ; =8
    5bcc:      	b	0x5bc4 <_stogir.atomic.validate+0x9f0>

0000000000005bd0 <_stogir.terminal.operation?>:
    5bd0:      	sxtw	x0, w0
    5bd4:      	cmp	x0, #0x60
    5bd8:      	b.ne	0x5be4 <_stogir.terminal.operation?+0x14>
    5bdc:      	mov	x0, #0x1                ; =1
    5be0:      	b	0x5bf0 <_stogir.terminal.operation?+0x20>
    5be4:      	cmp	x0, #0x79
    5be8:      	cset	w0, eq
    5bec:      	ubfx	x0, x0, #0, #8
    5bf0:      	ret

0000000000005bf4 <_stogir.terminal.validate>:
    5bf4:      	sub	sp, sp, #0x50
    5bf8:      	str	x29, [sp]
    5bfc:      	str	x30, [sp, #0x8]
    5c00:      	mov	x29, sp
    5c04:      	str	x19, [sp, #0x40]
    5c08:      	sxtw	x1, w1
    5c0c:      	lsl	x2, x1, #2
    5c10:      	cmp	x1, #0x0
    5c14:      	cset	w3, gt
    5c18:      	movz	x16, #0x0, lsl #48
    5c1c:      	sub	x4, x16, x1
    5c20:      	sub	x5, x4, #0x1
    5c24:      	uxtb	w16, w3
    5c28:      	cmp	w16, wzr
    5c2c:      	b.eq	0x5c6c <_stogir.terminal.validate+0x78>
    5c30:      	ldr	x4, [x0, #0x8]
    5c34:      	cmp	x1, x4
    5c38:      	b.ge	0x5cc0 <_stogir.terminal.validate+0xcc>
    5c3c:      	add	x4, x0, #0x78
    5c40:      	ldr	x4, [x4, #0x8]
    5c44:      	cmp	x1, x4
    5c48:      	b.ge	0x5de4 <_stogir.terminal.validate+0x1f0>
    5c4c:      	ldr	x4, [x0, #0x78]
    5c50:      	add	x4, x2, x4
    5c54:      	ldr	w4, [x4]
    5c58:      	sxtw	x4, w4
    5c5c:      	cmp	x4, #0x0
    5c60:      	cset	w4, ge
    5c64:      	ubfx	x4, x4, #0, #8
    5c68:      	b	0x5de8 <_stogir.terminal.validate+0x1f4>
    5c6c:      	cmp	x1, #0x0
    5c70:      	b.ge	0x5cc8 <_stogir.terminal.validate+0xd4>
    5c74:      	add	x6, x0, #0x28
    5c78:      	add	x7, x0, #0x50
    5c7c:      	ldr	x6, [x6, #0x8]
    5c80:      	ldr	x7, [x7, #0x8]
    5c84:      	cmp	x6, x7
    5c88:      	b.ne	0x5cb8 <_stogir.terminal.validate+0xc4>
    5c8c:      	cmp	x4, x6
    5c90:      	b.gt	0x5e24 <_stogir.terminal.validate+0x230>
    5c94:      	lsl	x4, x5, #2
    5c98:      	ldr	x6, [x0, #0x50]
    5c9c:      	add	x4, x4, x6
    5ca0:      	ldr	w4, [x4]
    5ca4:      	sxtw	x4, w4
    5ca8:      	cmp	x4, #0x0
    5cac:      	cset	w4, gt
    5cb0:      	ubfx	x4, x4, #0, #8
    5cb4:      	b	0x5e28 <_stogir.terminal.validate+0x234>
    5cb8:      	movz	x4, #0x0, lsl #48
    5cbc:      	b	0x5ccc <_stogir.terminal.validate+0xd8>
    5cc0:      	movz	x4, #0x0, lsl #48
    5cc4:      	b	0x5ccc <_stogir.terminal.validate+0xd8>
    5cc8:      	movz	x4, #0x0, lsl #48
    5ccc:      	cmp	x4, #0x0
    5cd0:      	b.eq	0x5d34 <_stogir.terminal.validate+0x140>
    5cd4:      	uxtb	w16, w3
    5cd8:      	cmp	w16, wzr
    5cdc:      	b.eq	0x5d04 <_stogir.terminal.validate+0x110>
    5ce0:      	lsl	x3, x1, #4
    5ce4:      	ldr	x4, [x0]
    5ce8:      	add	x3, x3, x4
    5cec:      	ldr	x4, [x3]
    5cf0:      	ldr	x3, [x3, #0x8]
    5cf4:      	fmov	d31, x3
    5cf8:      	mov	x3, x4
    5cfc:      	fmov	x4, d31
    5d00:      	b	0x5d24 <_stogir.terminal.validate+0x130>
    5d04:      	lsl	x3, x5, #4
    5d08:      	ldr	x4, [x0, #0x28]
    5d0c:      	add	x3, x3, x4
    5d10:      	ldr	x4, [x3]
    5d14:      	ldr	x3, [x3, #0x8]
    5d18:      	fmov	d31, x3
    5d1c:      	mov	x3, x4
    5d20:      	fmov	x4, d31
    5d24:      	mov	x5, x4
    5d28:      	mov	x4, x3
    5d2c:      	mov	x3, #0x1                ; =1
    5d30:      	b	0x5d40 <_stogir.terminal.validate+0x14c>
    5d34:      	movz	x3, #0x0, lsl #48
    5d38:      	movz	x4, #0x0, lsl #48
    5d3c:      	movz	x5, #0x0, lsl #48
    5d40:      	lsr	w3, w3, #0
    5d44:      	lsr	x16, x3, #0
    5d48:      	cmp	x16, #0x1
    5d4c:      	b.eq	0x5d68 <_stogir.terminal.validate+0x174>
    5d50:      	b.lo	0x5d58 <_stogir.terminal.validate+0x164>
    5d54:      	b	0x5d6c <_stogir.terminal.validate+0x178>
    5d58:      	cmp	x16, #0x0
    5d5c:      	b.eq	0x5d64 <_stogir.terminal.validate+0x170>
    5d60:      	b	0x5d6c <_stogir.terminal.validate+0x178>
    5d64:      	b	0x5d70 <_stogir.terminal.validate+0x17c>
    5d68:      	b	0x5d90 <_stogir.terminal.validate+0x19c>
    5d6c:      	b	0x5f00 <_stogir.terminal.validate+0x30c>
    5d70:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005d70:  ARM64_RELOC_PAGE21	l_stogir.377
    5d74:      	ldr	x16, [x16]
		0000000000005d74:  ARM64_RELOC_PAGEOFF12	l_stogir.377
    5d78:      	orr	x0, x16, xzr
    5d7c:      	mov	x19, x8
    5d80:      	mov	x1, x0
    5d84:      	mov	x0, #0x1                ; =1
    5d88:      	mov	x2, #0x21               ; =33
    5d8c:      	b	0x5dc4 <_stogir.terminal.validate+0x1d0>
    5d90:      	add	x16, sp, #0x10
    5d94:      	str	x4, [x16]
    5d98:      	add	x16, sp, #0x10
    5d9c:      	str	x5, [x16, #0x8]
    5da0:      	cmp	x1, #0x0
    5da4:      	b.gt	0x5dec <_stogir.terminal.validate+0x1f8>
    5da8:      	mov	x19, x8
    5dac:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x404>
		0000000000005dac:  ARM64_RELOC_PAGE21	l_stogir.378
    5db0:      	ldr	x16, [x16]
		0000000000005db0:  ARM64_RELOC_PAGEOFF12	l_stogir.378
    5db4:      	orr	x0, x16, xzr
    5db8:      	mov	x1, x0
    5dbc:      	mov	x0, #0x1                ; =1
    5dc0:      	mov	x2, #0x1b               ; =27
    5dc4:      	str	x0, [x19]
    5dc8:      	str	x1, [x19, #0x8]
    5dcc:      	str	x2, [x19, #0x10]
    5dd0:      	ldr	x19, [sp, #0x40]
    5dd4:      	ldr	x29, [sp]
    5dd8:      	ldr	x30, [sp, #0x8]
    5ddc:      	add	sp, sp, #0x50
    5de0:      	ret
    5de4:      	movz	x4, #0x0, lsl #48
    5de8:      	b	0x5cc4 <_stogir.terminal.validate+0xd0>
    5dec:      	uxtb	w4, w4
    5df0:      	orr	x1, x4, xzr
    5df4:      	cmp	x1, #0x60
    5df8:      	cset	w3, eq
    5dfc:      	cmp	x1, #0x79
    5e00:      	cset	w1, eq
    5e04:      	uxtb	w16, w3
    5e08:      	cmp	w16, wzr
    5e0c:      	b.ne	0x5e2c <_stogir.terminal.validate+0x238>
    5e10:      	uxtb	w16, w1
    5e14:      	cmp	w16, wzr
    5e18:      	b.ne	0x5e2c <_stogir.terminal.validate+0x238>
    5e1c:      	mov	x19, x8
    5e20:      	b	0x5dac <_stogir.terminal.validate+0x1b8>
    5e24:      	movz	x4, #0x0, lsl #48
    5e28:      	b	0x5cbc <_stogir.terminal.validate+0xc8>
    5e2c:      	add	x16, sp, #0x10
    5e30:      	ldr	w5, [x16]
    5e34:      	ubfx	x5, x5, #8, #8
    5e38:      	cmp	x5, #0x0
    5e3c:      	b.ne	0x5f08 <_stogir.terminal.validate+0x314>
    5e40:      	uxtb	w16, w3
    5e44:      	cmp	w16, wzr
    5e48:      	mov	x16, #0x1               ; =1
    5e4c:      	mov	x17, #0x3               ; =3
    5e50:      	csel	x3, x16, x17, ne
    5e54:      	lsr	w3, w3, #0
    5e58:      	sxtw	x3, w3
    5e5c:      	ldr	x5, [x0, #0x78]
    5e60:      	add	x2, x2, x5
    5e64:      	ldr	w2, [x2]
    5e68:      	sxtw	x2, w2
    5e6c:      	cmp	x2, x3
    5e70:      	b.ne	0x5f10 <_stogir.terminal.validate+0x31c>
    5e74:      	uxtb	w16, w1
    5e78:      	cmp	w16, wzr
    5e7c:      	b.eq	0x5edc <_stogir.terminal.validate+0x2e8>
    5e80:      	add	x16, sp, #0x10
    5e84:      	ldr	w2, [x16, #0x8]
    5e88:      	sxtw	x2, w2
    5e8c:      	cmp	x2, #0x0
    5e90:      	b.eq	0x5edc <_stogir.terminal.validate+0x2e8>
    5e94:      	mov	x19, x8
    5e98:      	b	0x5dac <_stogir.terminal.validate+0x1b8>
    5e9c:      	movz	x1, #0x0, lsl #48
    5ea0:      	lsr	w2, w2, #0
    5ea4:      	lsr	w4, w4, #0
    5ea8:      	lsr	w1, w1, #0
    5eac:      	mov	w3, w1
    5eb0:      	mov	w1, w4
    5eb4:      	mov	x19, x8
    5eb8:      	add	x8, sp, #0x20
    5ebc:      	bl	0x5ebc <_stogir.terminal.validate+0x2c8>
		0000000000005ebc:  ARM64_RELOC_BRANCH26	_stogir.terminal.inputs
    5ec0:      	add	x16, sp, #0x20
    5ec4:      	ldr	x0, [x16]
    5ec8:      	add	x16, sp, #0x20
    5ecc:      	ldr	x1, [x16, #0x8]
    5ed0:      	add	x16, sp, #0x20
    5ed4:      	ldr	x2, [x16, #0x10]
    5ed8:      	b	0x5dc4 <_stogir.terminal.validate+0x1d0>
    5edc:      	add	x16, sp, #0x10
    5ee0:      	ldr	w2, [x16, #0x4]
    5ee4:      	uxtb	w16, w1
    5ee8:      	cmp	w16, wzr
    5eec:      	b.eq	0x5e9c <_stogir.terminal.validate+0x2a8>
    5ef0:      	add	x16, sp, #0x10
    5ef4:      	ldr	w1, [x16, #0xc]
    5ef8:      	sxtw	x1, w1
    5efc:      	b	0x5ea0 <_stogir.terminal.validate+0x2ac>
    5f00:      	brk	#0
    5f04:      	b	0x5f00 <_stogir.terminal.validate+0x30c>
    5f08:      	mov	x19, x8
    5f0c:      	b	0x5dac <_stogir.terminal.validate+0x1b8>
    5f10:      	mov	x19, x8
    5f14:      	b	0x5dac <_stogir.terminal.validate+0x1b8>

0000000000005f18 <_stogir.switch.operation?>:
    5f18:      	sxtw	x0, w0
    5f1c:      	cmp	x0, #0x75
    5f20:      	b.ne	0x5f34 <_stogir.switch.operation?+0x1c>
    5f24:      	mov	x0, #0x1                ; =1
    5f28:      	b	0x5f30 <_stogir.switch.operation?+0x18>
    5f2c:      	movz	x0, #0x0, lsl #48
    5f30:      	ret
    5f34:      	cmp	x0, #0x6d
    5f38:      	b.lt	0x5f2c <_stogir.switch.operation?+0x14>
    5f3c:      	cmp	x0, #0x6f
    5f40:      	cset	w0, le
    5f44:      	ubfx	x0, x0, #0, #8
    5f48:      	b	0x5f30 <_stogir.switch.operation?+0x18>

0000000000005f4c <_stogir.switch.validate>:
    5f4c:      	sub	sp, sp, #0x70
    5f50:      	str	x29, [sp]
    5f54:      	str	x30, [sp, #0x8]
    5f58:      	mov	x29, sp
    5f5c:      	str	x19, [sp, #0x60]
    5f60:      	sxtw	x1, w1
    5f64:      	lsl	x2, x1, #2
    5f68:      	cmp	x1, #0x0
    5f6c:      	cset	w3, gt
    5f70:      	movz	x16, #0x0, lsl #48
    5f74:      	sub	x4, x16, x1
    5f78:      	sub	x5, x4, #0x1
    5f7c:      	uxtb	w16, w3
    5f80:      	cmp	w16, wzr
    5f84:      	b.eq	0x5fc4 <_stogir.switch.validate+0x78>
    5f88:      	ldr	x4, [x0, #0x8]
    5f8c:      	cmp	x1, x4
    5f90:      	b.ge	0x6018 <_stogir.switch.validate+0xcc>
    5f94:      	add	x4, x0, #0x78
    5f98:      	ldr	x4, [x4, #0x8]
    5f9c:      	cmp	x1, x4
    5fa0:      	b.ge	0x613c <_stogir.switch.validate+0x1f0>
    5fa4:      	ldr	x4, [x0, #0x78]
    5fa8:      	add	x4, x2, x4
    5fac:      	ldr	w4, [x4]
    5fb0:      	sxtw	x4, w4
    5fb4:      	cmp	x4, #0x0
    5fb8:      	cset	w4, ge
    5fbc:      	ubfx	x4, x4, #0, #8
    5fc0:      	b	0x6140 <_stogir.switch.validate+0x1f4>
    5fc4:      	cmp	x1, #0x0
    5fc8:      	b.ge	0x6020 <_stogir.switch.validate+0xd4>
    5fcc:      	add	x6, x0, #0x28
    5fd0:      	add	x7, x0, #0x50
    5fd4:      	ldr	x6, [x6, #0x8]
    5fd8:      	ldr	x7, [x7, #0x8]
    5fdc:      	cmp	x6, x7
    5fe0:      	b.ne	0x6010 <_stogir.switch.validate+0xc4>
    5fe4:      	cmp	x4, x6
    5fe8:      	b.gt	0x6178 <_stogir.switch.validate+0x22c>
    5fec:      	lsl	x4, x5, #2
    5ff0:      	ldr	x6, [x0, #0x50]
    5ff4:      	add	x4, x4, x6
    5ff8:      	ldr	w4, [x4]
    5ffc:      	sxtw	x4, w4
    6000:      	cmp	x4, #0x0
    6004:      	cset	w4, gt
    6008:      	ubfx	x4, x4, #0, #8
    600c:      	b	0x617c <_stogir.switch.validate+0x230>
    6010:      	movz	x4, #0x0, lsl #48
    6014:      	b	0x6024 <_stogir.switch.validate+0xd8>
    6018:      	movz	x4, #0x0, lsl #48
    601c:      	b	0x6024 <_stogir.switch.validate+0xd8>
    6020:      	movz	x4, #0x0, lsl #48
    6024:      	cmp	x4, #0x0
    6028:      	b.eq	0x608c <_stogir.switch.validate+0x140>
    602c:      	uxtb	w16, w3
    6030:      	cmp	w16, wzr
    6034:      	b.eq	0x605c <_stogir.switch.validate+0x110>
    6038:      	lsl	x3, x1, #4
    603c:      	ldr	x4, [x0]
    6040:      	add	x3, x3, x4
    6044:      	ldr	x4, [x3]
    6048:      	ldr	x3, [x3, #0x8]
    604c:      	fmov	d31, x3
    6050:      	mov	x3, x4
    6054:      	fmov	x4, d31
    6058:      	b	0x607c <_stogir.switch.validate+0x130>
    605c:      	lsl	x3, x5, #4
    6060:      	ldr	x4, [x0, #0x28]
    6064:      	add	x3, x3, x4
    6068:      	ldr	x4, [x3]
    606c:      	ldr	x3, [x3, #0x8]
    6070:      	fmov	d31, x3
    6074:      	mov	x3, x4
    6078:      	fmov	x4, d31
    607c:      	mov	x5, x4
    6080:      	mov	x4, x3
    6084:      	mov	x3, #0x1                ; =1
    6088:      	b	0x6098 <_stogir.switch.validate+0x14c>
    608c:      	movz	x3, #0x0, lsl #48
    6090:      	movz	x4, #0x0, lsl #48
    6094:      	movz	x5, #0x0, lsl #48
    6098:      	lsr	w3, w3, #0
    609c:      	lsr	x16, x3, #0
    60a0:      	cmp	x16, #0x1
    60a4:      	b.eq	0x60c0 <_stogir.switch.validate+0x174>
    60a8:      	b.lo	0x60b0 <_stogir.switch.validate+0x164>
    60ac:      	b	0x60c4 <_stogir.switch.validate+0x178>
    60b0:      	cmp	x16, #0x0
    60b4:      	b.eq	0x60bc <_stogir.switch.validate+0x170>
    60b8:      	b	0x60c4 <_stogir.switch.validate+0x178>
    60bc:      	b	0x60c8 <_stogir.switch.validate+0x17c>
    60c0:      	b	0x60e8 <_stogir.switch.validate+0x19c>
    60c4:      	b	0x627c <_stogir.switch.validate+0x330>
    60c8:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		00000000000060c8:  ARM64_RELOC_PAGE21	l_stogir.379
    60cc:      	ldr	x16, [x16]
		00000000000060cc:  ARM64_RELOC_PAGEOFF12	l_stogir.379
    60d0:      	orr	x0, x16, xzr
    60d4:      	mov	x19, x8
    60d8:      	mov	x1, x0
    60dc:      	mov	x0, #0x1                ; =1
    60e0:      	mov	x2, #0x1a               ; =26
    60e4:      	b	0x611c <_stogir.switch.validate+0x1d0>
    60e8:      	add	x16, sp, #0x10
    60ec:      	str	x4, [x16]
    60f0:      	add	x16, sp, #0x10
    60f4:      	str	x5, [x16, #0x8]
    60f8:      	cmp	x1, #0x0
    60fc:      	b.gt	0x6144 <_stogir.switch.validate+0x1f8>
    6100:      	mov	x19, x8
    6104:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		0000000000006104:  ARM64_RELOC_PAGE21	l_stogir.380
    6108:      	ldr	x16, [x16]
		0000000000006108:  ARM64_RELOC_PAGEOFF12	l_stogir.380
    610c:      	orr	x0, x16, xzr
    6110:      	mov	x1, x0
    6114:      	mov	x0, #0x1                ; =1
    6118:      	mov	x2, #0x20               ; =32
    611c:      	str	x0, [x19]
    6120:      	str	x1, [x19, #0x8]
    6124:      	str	x2, [x19, #0x10]
    6128:      	ldr	x19, [sp, #0x60]
    612c:      	ldr	x29, [sp]
    6130:      	ldr	x30, [sp, #0x8]
    6134:      	add	sp, sp, #0x70
    6138:      	ret
    613c:      	movz	x4, #0x0, lsl #48
    6140:      	b	0x601c <_stogir.switch.validate+0xd0>
    6144:      	uxtb	w4, w4
    6148:      	orr	x1, x4, xzr
    614c:      	cmp	x1, #0x75
    6150:      	cset	w3, eq
    6154:      	uxtb	w16, w3
    6158:      	cmp	w16, wzr
    615c:      	b.ne	0x6180 <_stogir.switch.validate+0x234>
    6160:      	cmp	x1, #0x6d
    6164:      	b.lt	0x6284 <_stogir.switch.validate+0x338>
    6168:      	cmp	x1, #0x6f
    616c:      	b.le	0x6180 <_stogir.switch.validate+0x234>
    6170:      	mov	x19, x8
    6174:      	b	0x6104 <_stogir.switch.validate+0x1b8>
    6178:      	movz	x4, #0x0, lsl #48
    617c:      	b	0x6014 <_stogir.switch.validate+0xc8>
    6180:      	add	x16, sp, #0x10
    6184:      	ldr	w5, [x16]
    6188:      	ubfx	x5, x5, #8, #8
    618c:      	cmp	x5, #0x0
    6190:      	b.ne	0x628c <_stogir.switch.validate+0x340>
    6194:      	ldr	x5, [x0, #0x78]
    6198:      	add	x2, x2, x5
    619c:      	ldr	w2, [x2]
    61a0:      	cmp	x1, #0x6d
    61a4:      	b.eq	0x6218 <_stogir.switch.validate+0x2cc>
    61a8:      	cmp	x1, #0x6e
    61ac:      	b.eq	0x6218 <_stogir.switch.validate+0x2cc>
    61b0:      	mov	x1, #0x2                ; =2
    61b4:      	b	0x621c <_stogir.switch.validate+0x2d0>
    61b8:      	lsr	w4, w4, #0
    61bc:      	add	x16, sp, #0x10
    61c0:      	ldr	w1, [x16, #0x4]
    61c4:      	add	x16, sp, #0x10
    61c8:      	ldr	w2, [x16, #0x8]
    61cc:      	lsr	w1, w1, #0
    61d0:      	add	x16, sp, #0x10
    61d4:      	ldr	w3, [x16, #0xc]
    61d8:      	lsr	w2, w2, #0
    61dc:      	lsr	w3, w3, #0
    61e0:      	add	x8, sp, #0x40
    61e4:      	fmov	s31, w1
    61e8:      	mov	w1, w4
    61ec:      	mov	w4, w3
    61f0:      	mov	w3, w2
    61f4:      	fmov	w2, s31
    61f8:      	bl	0x61f8 <_stogir.switch.validate+0x2ac>
		00000000000061f8:  ARM64_RELOC_BRANCH26	_stogir.switch.case-inputs
    61fc:      	add	x16, sp, #0x40
    6200:      	ldr	x0, [x16]
    6204:      	add	x16, sp, #0x40
    6208:      	ldr	x1, [x16, #0x8]
    620c:      	add	x16, sp, #0x40
    6210:      	ldr	x2, [x16, #0x10]
    6214:      	b	0x611c <_stogir.switch.validate+0x1d0>
    6218:      	mov	x1, #0x3                ; =3
    621c:      	sxtw	x2, w2
    6220:      	lsr	w1, w1, #0
    6224:      	sxtw	x1, w1
    6228:      	cmp	x2, x1
    622c:      	b.ne	0x6294 <_stogir.switch.validate+0x348>
    6230:      	uxtb	w16, w3
    6234:      	cmp	w16, wzr
    6238:      	b.eq	0x629c <_stogir.switch.validate+0x350>
    623c:      	add	x16, sp, #0x10
    6240:      	ldr	w1, [x16, #0x4]
    6244:      	add	x16, sp, #0x10
    6248:      	ldr	w2, [x16, #0x8]
    624c:      	lsr	w1, w1, #0
    6250:      	lsr	w2, w2, #0
    6254:      	mov	x19, x8
    6258:      	add	x8, sp, #0x20
    625c:      	bl	0x625c <_stogir.switch.validate+0x310>
		000000000000625c:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    6260:      	add	x16, sp, #0x20
    6264:      	ldr	x0, [x16]
    6268:      	add	x16, sp, #0x20
    626c:      	ldr	x1, [x16, #0x8]
    6270:      	add	x16, sp, #0x20
    6274:      	ldr	x2, [x16, #0x10]
    6278:      	b	0x6214 <_stogir.switch.validate+0x2c8>
    627c:      	brk	#0
    6280:      	b	0x627c <_stogir.switch.validate+0x330>
    6284:      	mov	x19, x8
    6288:      	b	0x6104 <_stogir.switch.validate+0x1b8>
    628c:      	mov	x19, x8
    6290:      	b	0x6104 <_stogir.switch.validate+0x1b8>
    6294:      	mov	x19, x8
    6298:      	b	0x6104 <_stogir.switch.validate+0x1b8>
    629c:      	mov	x19, x8
    62a0:      	b	0x61b8 <_stogir.switch.validate+0x26c>

00000000000062a4 <_stogir.stack.operation?>:
    62a4:      	sxtw	x0, w0
    62a8:      	cmp	x0, #0x42
    62ac:      	b.ne	0x62c8 <_stogir.stack.operation?+0x24>
    62b0:      	mov	x0, #0x1                ; =1
    62b4:      	b	0x62c4 <_stogir.stack.operation?+0x20>
    62b8:      	cmp	x0, #0x54
    62bc:      	cset	w0, eq
    62c0:      	ubfx	x0, x0, #0, #8
    62c4:      	ret
    62c8:      	cmp	x0, #0x51
    62cc:      	b.ne	0x62d8 <_stogir.stack.operation?+0x34>
    62d0:      	mov	x0, #0x1                ; =1
    62d4:      	b	0x62c4 <_stogir.stack.operation?+0x20>
    62d8:      	cmp	x0, #0x52
    62dc:      	b.ne	0x62e8 <_stogir.stack.operation?+0x44>
    62e0:      	mov	x0, #0x1                ; =1
    62e4:      	b	0x62c4 <_stogir.stack.operation?+0x20>
    62e8:      	cmp	x0, #0x53
    62ec:      	b.ne	0x62b8 <_stogir.stack.operation?+0x14>
    62f0:      	mov	x0, #0x1                ; =1
    62f4:      	b	0x62c4 <_stogir.stack.operation?+0x20>

00000000000062f8 <_stogir.stack.validate>:
    62f8:      	sub	sp, sp, #0x70
    62fc:      	str	x29, [sp]
    6300:      	str	x30, [sp, #0x8]
    6304:      	mov	x29, sp
    6308:      	str	x19, [sp, #0x60]
    630c:      	sxtw	x1, w1
    6310:      	lsl	x2, x1, #2
    6314:      	cmp	x1, #0x0
    6318:      	cset	w3, gt
    631c:      	movz	x16, #0x0, lsl #48
    6320:      	sub	x4, x16, x1
    6324:      	cmp	x1, #0x0
    6328:      	cset	w5, lt
    632c:      	sub	x6, x4, #0x1
    6330:      	lsl	x7, x6, #2
    6334:      	uxtb	w16, w3
    6338:      	cmp	w16, wzr
    633c:      	b.eq	0x637c <_stogir.stack.validate+0x84>
    6340:      	ldr	x9, [x0, #0x8]
    6344:      	cmp	x1, x9
    6348:      	b.ge	0x63fc <_stogir.stack.validate+0x104>
    634c:      	add	x9, x0, #0x78
    6350:      	ldr	x9, [x9, #0x8]
    6354:      	cmp	x1, x9
    6358:      	b.ge	0x6558 <_stogir.stack.validate+0x260>
    635c:      	ldr	x9, [x0, #0x78]
    6360:      	add	x9, x2, x9
    6364:      	ldr	w9, [x9]
    6368:      	sxtw	x9, w9
    636c:      	cmp	x9, #0x0
    6370:      	cset	w9, ge
    6374:      	ubfx	x9, x9, #0, #8
    6378:      	b	0x655c <_stogir.stack.validate+0x264>
    637c:      	uxtb	w16, w5
    6380:      	cmp	w16, wzr
    6384:      	b.eq	0x6404 <_stogir.stack.validate+0x10c>
    6388:      	add	x9, x0, #0x28
    638c:      	add	x10, x0, #0x50
    6390:      	ldr	x9, [x9, #0x8]
    6394:      	ldr	x10, [x10, #0x8]
    6398:      	cmp	x9, x10
    639c:      	b.ne	0x63c8 <_stogir.stack.validate+0xd0>
    63a0:      	cmp	x4, x9
    63a4:      	b.gt	0x6560 <_stogir.stack.validate+0x268>
    63a8:      	ldr	x9, [x0, #0x50]
    63ac:      	add	x9, x7, x9
    63b0:      	ldr	w9, [x9]
    63b4:      	sxtw	x9, w9
    63b8:      	cmp	x9, #0x0
    63bc:      	cset	w9, gt
    63c0:      	ubfx	x9, x9, #0, #8
    63c4:      	b	0x6564 <_stogir.stack.validate+0x26c>
    63c8:      	movz	x9, #0x0, lsl #48
    63cc:      	b	0x6408 <_stogir.stack.validate+0x110>
    63d0:      	uxtb	w16, w9
    63d4:      	cmp	w16, wzr
    63d8:      	b.eq	0x6588 <_stogir.stack.validate+0x290>
    63dc:      	mov	x19, x8
    63e0:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		00000000000063e0:  ARM64_RELOC_PAGE21	l_stogir.381
    63e4:      	ldr	x16, [x16]
		00000000000063e4:  ARM64_RELOC_PAGEOFF12	l_stogir.381
    63e8:      	orr	x0, x16, xzr
    63ec:      	mov	x1, x0
    63f0:      	mov	x0, #0x1                ; =1
    63f4:      	mov	x2, #0x19               ; =25
    63f8:      	b	0x64c8 <_stogir.stack.validate+0x1d0>
    63fc:      	movz	x9, #0x0, lsl #48
    6400:      	b	0x6408 <_stogir.stack.validate+0x110>
    6404:      	movz	x9, #0x0, lsl #48
    6408:      	lsl	x10, x1, #4
    640c:      	lsl	x6, x6, #4
    6410:      	cmp	x9, #0x0
    6414:      	b.eq	0x6470 <_stogir.stack.validate+0x178>
    6418:      	uxtb	w16, w3
    641c:      	cmp	w16, wzr
    6420:      	b.eq	0x6444 <_stogir.stack.validate+0x14c>
    6424:      	ldr	x9, [x0]
    6428:      	add	x9, x10, x9
    642c:      	ldr	x11, [x9]
    6430:      	ldr	x9, [x9, #0x8]
    6434:      	fmov	d31, x9
    6438:      	mov	x9, x11
    643c:      	fmov	x11, d31
    6440:      	b	0x6460 <_stogir.stack.validate+0x168>
    6444:      	ldr	x9, [x0, #0x28]
    6448:      	add	x9, x6, x9
    644c:      	ldr	x11, [x9]
    6450:      	ldr	x9, [x9, #0x8]
    6454:      	fmov	d31, x9
    6458:      	mov	x9, x11
    645c:      	fmov	x11, d31
    6460:      	mov	x12, x11
    6464:      	mov	x11, x9
    6468:      	mov	x9, #0x1                ; =1
    646c:      	b	0x647c <_stogir.stack.validate+0x184>
    6470:      	movz	x9, #0x0, lsl #48
    6474:      	movz	x11, #0x0, lsl #48
    6478:      	movz	x12, #0x0, lsl #48
    647c:      	lsr	w9, w9, #0
    6480:      	lsr	x16, x9, #0
    6484:      	cmp	x16, #0x1
    6488:      	b.eq	0x64a4 <_stogir.stack.validate+0x1ac>
    648c:      	b.lo	0x6494 <_stogir.stack.validate+0x19c>
    6490:      	b	0x64a8 <_stogir.stack.validate+0x1b0>
    6494:      	cmp	x16, #0x0
    6498:      	b.eq	0x64a0 <_stogir.stack.validate+0x1a8>
    649c:      	b	0x64a8 <_stogir.stack.validate+0x1b0>
    64a0:      	b	0x64ac <_stogir.stack.validate+0x1b4>
    64a4:      	b	0x64e8 <_stogir.stack.validate+0x1f0>
    64a8:      	b	0x6858 <_stogir.stack.validate+0x560>
    64ac:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		00000000000064ac:  ARM64_RELOC_PAGE21	l_stogir.382
    64b0:      	ldr	x16, [x16]
		00000000000064b0:  ARM64_RELOC_PAGEOFF12	l_stogir.382
    64b4:      	orr	x0, x16, xzr
    64b8:      	mov	x19, x8
    64bc:      	mov	x1, x0
    64c0:      	mov	x0, #0x1                ; =1
    64c4:      	mov	x2, #0x19               ; =25
    64c8:      	str	x0, [x19]
    64cc:      	str	x1, [x19, #0x8]
    64d0:      	str	x2, [x19, #0x10]
    64d4:      	ldr	x19, [sp, #0x60]
    64d8:      	ldr	x29, [sp]
    64dc:      	ldr	x30, [sp, #0x8]
    64e0:      	add	sp, sp, #0x70
    64e4:      	ret
    64e8:      	cmp	x1, #0x0
    64ec:      	cset	w9, le
    64f0:      	uxtb	w13, w11
    64f4:      	add	x16, sp, #0x10
    64f8:      	str	x11, [x16]
    64fc:      	orr	x11, x13, xzr
    6500:      	add	x16, sp, #0x10
    6504:      	str	x12, [x16, #0x8]
    6508:      	cmp	x11, #0x42
    650c:      	b.ne	0x63d0 <_stogir.stack.validate+0xd8>
    6510:      	uxtb	w16, w3
    6514:      	cmp	w16, wzr
    6518:      	b.eq	0x65d4 <_stogir.stack.validate+0x2dc>
    651c:      	ldr	x4, [x0, #0x8]
    6520:      	cmp	x1, x4
    6524:      	b.ge	0x6620 <_stogir.stack.validate+0x328>
    6528:      	add	x4, x0, #0x78
    652c:      	ldr	x4, [x4, #0x8]
    6530:      	cmp	x1, x4
    6534:      	b.ge	0x6714 <_stogir.stack.validate+0x41c>
    6538:      	ldr	x1, [x0, #0x78]
    653c:      	add	x1, x2, x1
    6540:      	ldr	w1, [x1]
    6544:      	sxtw	x1, w1
    6548:      	cmp	x1, #0x0
    654c:      	cset	w1, ge
    6550:      	ubfx	x1, x1, #0, #8
    6554:      	b	0x6718 <_stogir.stack.validate+0x420>
    6558:      	movz	x9, #0x0, lsl #48
    655c:      	b	0x6400 <_stogir.stack.validate+0x108>
    6560:      	movz	x9, #0x0, lsl #48
    6564:      	b	0x63cc <_stogir.stack.validate+0xd4>
    6568:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		0000000000006568:  ARM64_RELOC_PAGE21	l_stogir.383
    656c:      	ldr	x16, [x16]
		000000000000656c:  ARM64_RELOC_PAGEOFF12	l_stogir.383
    6570:      	orr	x0, x16, xzr
    6574:      	mov	x1, x0
    6578:      	mov	x0, #0x1                ; =1
    657c:      	mov	x2, #0x1e               ; =30
    6580:      	mov	x19, x8
    6584:      	b	0x63f8 <_stogir.stack.validate+0x100>
    6588:      	cmp	x11, #0x51
    658c:      	cset	w1, eq
    6590:      	cmp	x11, #0x53
    6594:      	cset	w3, eq
    6598:      	cmp	x11, #0x54
    659c:      	cset	w4, eq
    65a0:      	uxtb	w16, w1
    65a4:      	cmp	w16, wzr
    65a8:      	b.ne	0x671c <_stogir.stack.validate+0x424>
    65ac:      	cmp	x11, #0x52
    65b0:      	b.eq	0x671c <_stogir.stack.validate+0x424>
    65b4:      	uxtb	w16, w3
    65b8:      	cmp	w16, wzr
    65bc:      	b.ne	0x671c <_stogir.stack.validate+0x424>
    65c0:      	uxtb	w16, w4
    65c4:      	cmp	w16, wzr
    65c8:      	b.ne	0x671c <_stogir.stack.validate+0x424>
    65cc:      	mov	x19, x8
    65d0:      	b	0x63e0 <_stogir.stack.validate+0xe8>
    65d4:      	uxtb	w16, w5
    65d8:      	cmp	w16, wzr
    65dc:      	b.eq	0x6628 <_stogir.stack.validate+0x330>
    65e0:      	add	x1, x0, #0x28
    65e4:      	add	x5, x0, #0x50
    65e8:      	ldr	x1, [x1, #0x8]
    65ec:      	ldr	x5, [x5, #0x8]
    65f0:      	cmp	x1, x5
    65f4:      	b.ne	0x670c <_stogir.stack.validate+0x414>
    65f8:      	cmp	x4, x1
    65fc:      	b.gt	0x67d4 <_stogir.stack.validate+0x4dc>
    6600:      	ldr	x1, [x0, #0x50]
    6604:      	add	x1, x7, x1
    6608:      	ldr	w1, [x1]
    660c:      	sxtw	x1, w1
    6610:      	cmp	x1, #0x0
    6614:      	cset	w1, gt
    6618:      	ubfx	x1, x1, #0, #8
    661c:      	b	0x67d8 <_stogir.stack.validate+0x4e0>
    6620:      	movz	x1, #0x0, lsl #48
    6624:      	b	0x662c <_stogir.stack.validate+0x334>
    6628:      	movz	x1, #0x0, lsl #48
    662c:      	cmp	x1, #0x0
    6630:      	b.eq	0x6668 <_stogir.stack.validate+0x370>
    6634:      	uxtb	w16, w3
    6638:      	cmp	w16, wzr
    663c:      	b.eq	0x6650 <_stogir.stack.validate+0x358>
    6640:      	ldr	x1, [x0]
    6644:      	add	x1, x10, x1
    6648:      	ldr	x1, [x1]
    664c:      	b	0x665c <_stogir.stack.validate+0x364>
    6650:      	ldr	x1, [x0, #0x28]
    6654:      	add	x1, x6, x1
    6658:      	ldr	x1, [x1]
    665c:      	mov	x3, x1
    6660:      	mov	x1, #0x1                ; =1
    6664:      	b	0x6670 <_stogir.stack.validate+0x378>
    6668:      	movz	x1, #0x0, lsl #48
    666c:      	movz	x3, #0x0, lsl #48
    6670:      	lsr	w1, w1, #0
    6674:      	lsr	x16, x1, #0
    6678:      	cmp	x16, #0x1
    667c:      	b.eq	0x6698 <_stogir.stack.validate+0x3a0>
    6680:      	b.lo	0x6688 <_stogir.stack.validate+0x390>
    6684:      	b	0x669c <_stogir.stack.validate+0x3a4>
    6688:      	cmp	x16, #0x0
    668c:      	b.eq	0x6694 <_stogir.stack.validate+0x39c>
    6690:      	b	0x669c <_stogir.stack.validate+0x3a4>
    6694:      	b	0x66a0 <_stogir.stack.validate+0x3a8>
    6698:      	b	0x66bc <_stogir.stack.validate+0x3c4>
    669c:      	b	0x6860 <_stogir.stack.validate+0x568>
    66a0:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		00000000000066a0:  ARM64_RELOC_PAGE21	l_stogir.384
    66a4:      	ldr	x16, [x16]
		00000000000066a4:  ARM64_RELOC_PAGEOFF12	l_stogir.384
    66a8:      	orr	x0, x16, xzr
    66ac:      	mov	x1, x0
    66b0:      	mov	x0, #0x1                ; =1
    66b4:      	mov	x2, #0x21               ; =33
    66b8:      	b	0x6580 <_stogir.stack.validate+0x288>
    66bc:      	uxtb	w16, w9
    66c0:      	cmp	w16, wzr
    66c4:      	b.ne	0x6568 <_stogir.stack.validate+0x270>
    66c8:      	uxtb	w1, w3
    66cc:      	cmp	x1, #0x42
    66d0:      	b.ne	0x6568 <_stogir.stack.validate+0x270>
    66d4:      	lsr	w3, w3, #0
    66d8:      	ubfx	x1, x3, #8, #8
    66dc:      	cmp	x1, #0x6
    66e0:      	b.ne	0x6568 <_stogir.stack.validate+0x270>
    66e4:      	ldr	x0, [x0, #0x78]
    66e8:      	add	x0, x2, x0
    66ec:      	ldr	w0, [x0]
    66f0:      	sxtw	x0, w0
    66f4:      	cmp	x0, #0x0
    66f8:      	b.ne	0x6568 <_stogir.stack.validate+0x270>
    66fc:      	movz	x0, #0x0, lsl #48
    6700:      	mov	x1, #0x8                ; =8
    6704:      	movz	x2, #0x0, lsl #48
    6708:      	b	0x6580 <_stogir.stack.validate+0x288>
    670c:      	movz	x1, #0x0, lsl #48
    6710:      	b	0x662c <_stogir.stack.validate+0x334>
    6714:      	movz	x1, #0x0, lsl #48
    6718:      	b	0x6624 <_stogir.stack.validate+0x32c>
    671c:      	ldr	x5, [x0, #0x78]
    6720:      	add	x2, x2, x5
    6724:      	ldr	w2, [x2]
    6728:      	uxtb	w16, w1
    672c:      	cmp	w16, wzr
    6730:      	b.eq	0x673c <_stogir.stack.validate+0x444>
    6734:      	mov	x1, #0x3                ; =3
    6738:      	b	0x6750 <_stogir.stack.validate+0x458>
    673c:      	uxtb	w16, w3
    6740:      	cmp	w16, wzr
    6744:      	mov	x16, #0x1               ; =1
    6748:      	mov	x17, #0x2               ; =2
    674c:      	csel	x1, x16, x17, ne
    6750:      	sxtw	x2, w2
    6754:      	lsr	w1, w1, #0
    6758:      	sxtw	x1, w1
    675c:      	cmp	x2, x1
    6760:      	b.ne	0x6868 <_stogir.stack.validate+0x570>
    6764:      	lsr	w13, w13, #0
    6768:      	uxtb	w16, w3
    676c:      	cmp	w16, wzr
    6770:      	b.eq	0x67dc <_stogir.stack.validate+0x4e4>
    6774:      	mov	x19, x8
    6778:      	add	x16, sp, #0x10
    677c:      	ldr	w1, [x16]
    6780:      	add	x16, sp, #0x10
    6784:      	ldr	w2, [x16, #0x4]
    6788:      	add	x16, sp, #0x10
    678c:      	ldr	w3, [x16, #0x8]
    6790:      	lsr	w2, w2, #0
    6794:      	ubfx	x1, x1, #8, #8
    6798:      	lsr	w3, w3, #0
    679c:      	lsr	w1, w1, #0
    67a0:      	add	x8, sp, #0x20
    67a4:      	mov	w4, w3
    67a8:      	mov	w3, w2
    67ac:      	mov	w2, w1
    67b0:      	mov	w1, w13
    67b4:      	bl	0x67b4 <_stogir.stack.validate+0x4bc>
		00000000000067b4:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-scope-inputs
    67b8:      	add	x16, sp, #0x20
    67bc:      	ldr	x0, [x16]
    67c0:      	add	x16, sp, #0x20
    67c4:      	ldr	x1, [x16, #0x8]
    67c8:      	add	x16, sp, #0x20
    67cc:      	ldr	x2, [x16, #0x10]
    67d0:      	b	0x63f8 <_stogir.stack.validate+0x100>
    67d4:      	movz	x1, #0x0, lsl #48
    67d8:      	b	0x6710 <_stogir.stack.validate+0x418>
    67dc:      	uxtb	w16, w4
    67e0:      	cmp	w16, wzr
    67e4:      	b.ne	0x6870 <_stogir.stack.validate+0x578>
    67e8:      	add	x16, sp, #0x10
    67ec:      	ldr	w1, [x16]
    67f0:      	add	x16, sp, #0x10
    67f4:      	ldr	w2, [x16, #0x4]
    67f8:      	add	x16, sp, #0x10
    67fc:      	ldr	w3, [x16, #0x8]
    6800:      	lsr	w2, w2, #0
    6804:      	ubfx	x1, x1, #8, #8
    6808:      	add	x16, sp, #0x10
    680c:      	ldr	w4, [x16, #0xc]
    6810:      	lsr	w3, w3, #0
    6814:      	lsr	w4, w4, #0
    6818:      	lsr	w1, w1, #0
    681c:      	mov	w5, w4
    6820:      	mov	w4, w3
    6824:      	mov	w3, w2
    6828:      	mov	w2, w1
    682c:      	mov	w1, w13
    6830:      	mov	x19, x8
    6834:      	add	x8, sp, #0x40
    6838:      	bl	0x6838 <_stogir.stack.validate+0x540>
		0000000000006838:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-inputs
    683c:      	add	x16, sp, #0x40
    6840:      	ldr	x0, [x16]
    6844:      	add	x16, sp, #0x40
    6848:      	ldr	x1, [x16, #0x8]
    684c:      	add	x16, sp, #0x40
    6850:      	ldr	x2, [x16, #0x10]
    6854:      	b	0x67d0 <_stogir.stack.validate+0x4d8>
    6858:      	brk	#0
    685c:      	b	0x6858 <_stogir.stack.validate+0x560>
    6860:      	brk	#0
    6864:      	b	0x6860 <_stogir.stack.validate+0x568>
    6868:      	mov	x19, x8
    686c:      	b	0x63e0 <_stogir.stack.validate+0xe8>
    6870:      	mov	x19, x8
    6874:      	b	0x6778 <_stogir.stack.validate+0x480>

0000000000006878 <_stogir.locals.operation?>:
    6878:      	sxtw	x0, w0
    687c:      	cmp	x0, #0x41
    6880:      	b.ne	0x6894 <_stogir.locals.operation?+0x1c>
    6884:      	mov	x0, #0x1                ; =1
    6888:      	b	0x6890 <_stogir.locals.operation?+0x18>
    688c:      	movz	x0, #0x0, lsl #48
    6890:      	ret
    6894:      	cmp	x0, #0x48
    6898:      	b.ne	0x68a4 <_stogir.locals.operation?+0x2c>
    689c:      	mov	x0, #0x1                ; =1
    68a0:      	b	0x6890 <_stogir.locals.operation?+0x18>
    68a4:      	cmp	x0, #0x55
    68a8:      	b.lt	0x688c <_stogir.locals.operation?+0x14>
    68ac:      	cmp	x0, #0x58
    68b0:      	cset	w0, le
    68b4:      	ubfx	x0, x0, #0, #8
    68b8:      	b	0x6890 <_stogir.locals.operation?+0x18>

00000000000068bc <_stogir.locals.validate>:
    68bc:      	sub	sp, sp, #0x100
    68c0:      	str	x29, [sp]
    68c4:      	str	x30, [sp, #0x8]
    68c8:      	mov	x29, sp
    68cc:      	str	x19, [sp, #0xc0]
    68d0:      	str	x20, [sp, #0xc8]
    68d4:      	str	x21, [sp, #0xd0]
    68d8:      	str	x22, [sp, #0xd8]
    68dc:      	str	x23, [sp, #0xe0]
    68e0:      	str	x24, [sp, #0xe8]
    68e4:      	str	x25, [sp, #0xf0]
    68e8:      	sxtw	x1, w1
    68ec:      	lsl	x3, x1, #2
    68f0:      	cmp	x1, #0x0
    68f4:      	cset	w4, gt
    68f8:      	movz	x16, #0x0, lsl #48
    68fc:      	sub	x5, x16, x1
    6900:      	sub	x6, x5, #0x1
    6904:      	uxtb	w16, w4
    6908:      	cmp	w16, wzr
    690c:      	b.eq	0x694c <_stogir.locals.validate+0x90>
    6910:      	ldr	x5, [x0, #0x8]
    6914:      	cmp	x1, x5
    6918:      	b.ge	0x69ec <_stogir.locals.validate+0x130>
    691c:      	add	x5, x0, #0x78
    6920:      	ldr	x5, [x5, #0x8]
    6924:      	cmp	x1, x5
    6928:      	b.ge	0x6b14 <_stogir.locals.validate+0x258>
    692c:      	ldr	x5, [x0, #0x78]
    6930:      	add	x5, x3, x5
    6934:      	ldr	w5, [x5]
    6938:      	sxtw	x5, w5
    693c:      	cmp	x5, #0x0
    6940:      	cset	w5, ge
    6944:      	ubfx	x5, x5, #0, #8
    6948:      	b	0x6b18 <_stogir.locals.validate+0x25c>
    694c:      	cmp	x1, #0x0
    6950:      	b.ge	0x69f4 <_stogir.locals.validate+0x138>
    6954:      	add	x7, x0, #0x28
    6958:      	add	x9, x0, #0x50
    695c:      	ldr	x7, [x7, #0x8]
    6960:      	ldr	x9, [x9, #0x8]
    6964:      	cmp	x7, x9
    6968:      	b.ne	0x6998 <_stogir.locals.validate+0xdc>
    696c:      	cmp	x5, x7
    6970:      	b.gt	0x6b9c <_stogir.locals.validate+0x2e0>
    6974:      	lsl	x5, x6, #2
    6978:      	ldr	x7, [x0, #0x50]
    697c:      	add	x5, x5, x7
    6980:      	ldr	w5, [x5]
    6984:      	sxtw	x5, w5
    6988:      	cmp	x5, #0x0
    698c:      	cset	w5, gt
    6990:      	ubfx	x5, x5, #0, #8
    6994:      	b	0x6ba0 <_stogir.locals.validate+0x2e4>
    6998:      	movz	x5, #0x0, lsl #48
    699c:      	b	0x69f8 <_stogir.locals.validate+0x13c>
    69a0:      	cmp	x5, #0x0
    69a4:      	cset	w5, ne
    69a8:      	uxtb	w16, w5
    69ac:      	cmp	w16, wzr
    69b0:      	mov	x16, #0x2               ; =2
    69b4:      	mov	x17, #0x3               ; =3
    69b8:      	csel	x5, x16, x17, ne
    69bc:      	lsr	w5, w5, #0
    69c0:      	sxtw	x5, w5
    69c4:      	cmp	x1, #0x0
    69c8:      	b.gt	0x6b1c <_stogir.locals.validate+0x260>
    69cc:      	mov	x23, x8
    69d0:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		00000000000069d0:  ARM64_RELOC_PAGE21	l_stogir.385
    69d4:      	ldr	x16, [x16]
		00000000000069d4:  ARM64_RELOC_PAGEOFF12	l_stogir.385
    69d8:      	orr	x0, x16, xzr
    69dc:      	mov	x1, x0
    69e0:      	mov	x0, #0x1                ; =1
    69e4:      	mov	x2, #0x17               ; =23
    69e8:      	b	0x6ab8 <_stogir.locals.validate+0x1fc>
    69ec:      	movz	x5, #0x0, lsl #48
    69f0:      	b	0x69f8 <_stogir.locals.validate+0x13c>
    69f4:      	movz	x5, #0x0, lsl #48
    69f8:      	cmp	x5, #0x0
    69fc:      	b.eq	0x6a60 <_stogir.locals.validate+0x1a4>
    6a00:      	uxtb	w16, w4
    6a04:      	cmp	w16, wzr
    6a08:      	b.eq	0x6a30 <_stogir.locals.validate+0x174>
    6a0c:      	lsl	x4, x1, #4
    6a10:      	ldr	x5, [x0]
    6a14:      	add	x4, x4, x5
    6a18:      	ldr	x5, [x4]
    6a1c:      	ldr	x4, [x4, #0x8]
    6a20:      	fmov	d31, x4
    6a24:      	mov	x4, x5
    6a28:      	fmov	x5, d31
    6a2c:      	b	0x6a50 <_stogir.locals.validate+0x194>
    6a30:      	lsl	x4, x6, #4
    6a34:      	ldr	x5, [x0, #0x28]
    6a38:      	add	x4, x4, x5
    6a3c:      	ldr	x5, [x4]
    6a40:      	ldr	x4, [x4, #0x8]
    6a44:      	fmov	d31, x4
    6a48:      	mov	x4, x5
    6a4c:      	fmov	x5, d31
    6a50:      	mov	x6, x5
    6a54:      	mov	x5, x4
    6a58:      	mov	x4, #0x1                ; =1
    6a5c:      	b	0x6a6c <_stogir.locals.validate+0x1b0>
    6a60:      	movz	x4, #0x0, lsl #48
    6a64:      	movz	x5, #0x0, lsl #48
    6a68:      	movz	x6, #0x0, lsl #48
    6a6c:      	lsr	w4, w4, #0
    6a70:      	lsr	x16, x4, #0
    6a74:      	cmp	x16, #0x1
    6a78:      	b.eq	0x6a94 <_stogir.locals.validate+0x1d8>
    6a7c:      	b.lo	0x6a84 <_stogir.locals.validate+0x1c8>
    6a80:      	b	0x6a98 <_stogir.locals.validate+0x1dc>
    6a84:      	cmp	x16, #0x0
    6a88:      	b.eq	0x6a90 <_stogir.locals.validate+0x1d4>
    6a8c:      	b	0x6a98 <_stogir.locals.validate+0x1dc>
    6a90:      	b	0x6a9c <_stogir.locals.validate+0x1e0>
    6a94:      	b	0x6af0 <_stogir.locals.validate+0x234>
    6a98:      	b	0x6ce0 <_stogir.locals.validate+0x424>
    6a9c:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		0000000000006a9c:  ARM64_RELOC_PAGE21	l_stogir.386
    6aa0:      	ldr	x16, [x16]
		0000000000006aa0:  ARM64_RELOC_PAGEOFF12	l_stogir.386
    6aa4:      	orr	x0, x16, xzr
    6aa8:      	mov	x23, x8
    6aac:      	mov	x1, x0
    6ab0:      	mov	x0, #0x1                ; =1
    6ab4:      	mov	x2, #0x17               ; =23
    6ab8:      	str	x0, [x23]
    6abc:      	str	x1, [x23, #0x8]
    6ac0:      	str	x2, [x23, #0x10]
    6ac4:      	ldr	x19, [sp, #0xc0]
    6ac8:      	ldr	x20, [sp, #0xc8]
    6acc:      	ldr	x21, [sp, #0xd0]
    6ad0:      	ldr	x22, [sp, #0xd8]
    6ad4:      	ldr	x23, [sp, #0xe0]
    6ad8:      	ldr	x24, [sp, #0xe8]
    6adc:      	ldr	x25, [sp, #0xf0]
    6ae0:      	ldr	x29, [sp]
    6ae4:      	ldr	x30, [sp, #0x8]
    6ae8:      	add	sp, sp, #0x100
    6aec:      	ret
    6af0:      	uxtb	w4, w5
    6af4:      	add	x16, sp, #0x10
    6af8:      	str	x5, [x16]
    6afc:      	add	x16, sp, #0x10
    6b00:      	str	x6, [x16, #0x8]
    6b04:      	cmp	x4, #0x55
    6b08:      	b.ne	0x6b80 <_stogir.locals.validate+0x2c4>
    6b0c:      	mov	x5, #0x1                ; =1
    6b10:      	b	0x6b8c <_stogir.locals.validate+0x2d0>
    6b14:      	movz	x5, #0x0, lsl #48
    6b18:      	b	0x69f0 <_stogir.locals.validate+0x134>
    6b1c:      	cmp	x4, #0x48
    6b20:      	cset	w21, eq
    6b24:      	uxtb	w16, w20
    6b28:      	cmp	w16, wzr
    6b2c:      	b.ne	0x6ba4 <_stogir.locals.validate+0x2e8>
    6b30:      	uxtb	w16, w21
    6b34:      	cmp	w16, wzr
    6b38:      	b.ne	0x6ba4 <_stogir.locals.validate+0x2e8>
    6b3c:      	cmp	x4, #0x55
    6b40:      	b.lt	0x7144 <_stogir.locals.validate+0x888>
    6b44:      	cmp	x4, #0x58
    6b48:      	b.le	0x6ba4 <_stogir.locals.validate+0x2e8>
    6b4c:      	mov	x23, x8
    6b50:      	b	0x69d0 <_stogir.locals.validate+0x114>
    6b54:      	cmp	x4, #0x58
    6b58:      	cset	w6, eq
    6b5c:      	ubfx	x6, x6, #0, #8
    6b60:      	mov	x19, x6
    6b64:      	cmp	x4, #0x41
    6b68:      	cset	w20, eq
    6b6c:      	uxtb	w16, w20
    6b70:      	cmp	w16, wzr
    6b74:      	b.eq	0x69a0 <_stogir.locals.validate+0xe4>
    6b78:      	mov	x5, #0x1                ; =1
    6b7c:      	b	0x69c4 <_stogir.locals.validate+0x108>
    6b80:      	cmp	x4, #0x56
    6b84:      	cset	w5, eq
    6b88:      	ubfx	x5, x5, #0, #8
    6b8c:      	cmp	x4, #0x57
    6b90:      	b.ne	0x6b54 <_stogir.locals.validate+0x298>
    6b94:      	mov	x19, #0x1               ; =1
    6b98:      	b	0x6b64 <_stogir.locals.validate+0x2a8>
    6b9c:      	movz	x5, #0x0, lsl #48
    6ba0:      	b	0x699c <_stogir.locals.validate+0xe0>
    6ba4:      	lsr	w5, w5, #0
    6ba8:      	sxtw	x5, w5
    6bac:      	ldr	x4, [x0, #0x78]
    6bb0:      	add	x3, x3, x4
    6bb4:      	ldr	w3, [x3]
    6bb8:      	sxtw	x3, w3
    6bbc:      	cmp	x3, x5
    6bc0:      	b.ne	0x714c <_stogir.locals.validate+0x890>
    6bc4:      	uxtb	w16, w20
    6bc8:      	cmp	w16, wzr
    6bcc:      	b.ne	0x6bec <_stogir.locals.validate+0x330>
    6bd0:      	uxtb	w16, w21
    6bd4:      	cmp	w16, wzr
    6bd8:      	b.ne	0x6bec <_stogir.locals.validate+0x330>
    6bdc:      	add	x16, sp, #0x10
    6be0:      	ldr	w1, [x16, #0x8]
    6be4:      	sxtw	x1, w1
    6be8:      	b	0x6c04 <_stogir.locals.validate+0x348>
    6bec:      	uxtb	w16, w21
    6bf0:      	cmp	w16, wzr
    6bf4:      	b.ne	0x6c04 <_stogir.locals.validate+0x348>
    6bf8:      	add	x16, sp, #0x10
    6bfc:      	ldr	w1, [x16, #0x4]
    6c00:      	sxtw	x1, w1
    6c04:      	add	x16, sp, #0x20
    6c08:      	orr	x22, x16, xzr
    6c0c:      	lsr	w2, w2, #0
    6c10:      	lsr	w1, w1, #0
    6c14:      	mov	x23, x8
    6c18:      	add	x8, sp, #0x20
    6c1c:      	mov	x24, x0
    6c20:      	mov	w25, w2
    6c24:      	bl	0x6c24 <_stogir.locals.validate+0x368>
		0000000000006c24:  ARM64_RELOC_BRANCH26	_stogir.locals.shape
    6c28:      	add	x16, sp, #0x20
    6c2c:      	ldr	w0, [x16]
    6c30:      	lsr	x16, x0, #0
    6c34:      	cmp	x16, #0x1
    6c38:      	b.eq	0x6c54 <_stogir.locals.validate+0x398>
    6c3c:      	b.lo	0x6c44 <_stogir.locals.validate+0x388>
    6c40:      	b	0x6c58 <_stogir.locals.validate+0x39c>
    6c44:      	cmp	x16, #0x0
    6c48:      	b.eq	0x6c50 <_stogir.locals.validate+0x394>
    6c4c:      	b	0x6c58 <_stogir.locals.validate+0x39c>
    6c50:      	b	0x6c78 <_stogir.locals.validate+0x3bc>
    6c54:      	b	0x6c5c <_stogir.locals.validate+0x3a0>
    6c58:      	b	0x6f0c <_stogir.locals.validate+0x650>
    6c5c:      	add	x0, x22, #0x8
    6c60:      	add	x16, sp, #0x20
    6c64:      	ldr	x1, [x16, #0x8]
    6c68:      	ldr	x0, [x0, #0x8]
    6c6c:      	mov	x2, x0
    6c70:      	mov	x0, #0x1                ; =1
    6c74:      	b	0x69e8 <_stogir.locals.validate+0x12c>
    6c78:      	add	x16, sp, #0x20
    6c7c:      	ldr	x22, [x16, #0x8]
    6c80:      	uxtb	w16, w21
    6c84:      	cmp	w16, wzr
    6c88:      	b.eq	0x6ca8 <_stogir.locals.validate+0x3ec>
    6c8c:      	lsr	w22, w22, #0
    6c90:      	sxtw	x22, w22
    6c94:      	and	x0, x22, #0xffffffff
    6c98:      	mov	x1, x0
    6c9c:      	movz	x0, #0x0, lsl #48
    6ca0:      	movz	x2, #0x0, lsl #48
    6ca4:      	b	0x6c74 <_stogir.locals.validate+0x3b8>
    6ca8:      	uxtb	w16, w20
    6cac:      	cmp	w16, wzr
    6cb0:      	b.eq	0x6d04 <_stogir.locals.validate+0x448>
    6cb4:      	add	x16, sp, #0x10
    6cb8:      	ldr	w0, [x16]
    6cbc:      	ubfx	x0, x0, #8, #8
    6cc0:      	cmp	x0, #0x6
    6cc4:      	b.ne	0x6ce8 <_stogir.locals.validate+0x42c>
    6cc8:      	sxtw	x25, w25
    6ccc:      	and	x0, x25, #0xffffffff
    6cd0:      	mov	x1, x0
    6cd4:      	movz	x0, #0x0, lsl #48
    6cd8:      	movz	x2, #0x0, lsl #48
    6cdc:      	b	0x6d00 <_stogir.locals.validate+0x444>
    6ce0:      	brk	#0
    6ce4:      	b	0x6ce0 <_stogir.locals.validate+0x424>
    6ce8:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		0000000000006ce8:  ARM64_RELOC_PAGE21	l_stogir.387
    6cec:      	ldr	x16, [x16]
		0000000000006cec:  ARM64_RELOC_PAGEOFF12	l_stogir.387
    6cf0:      	orr	x0, x16, xzr
    6cf4:      	mov	x1, x0
    6cf8:      	mov	x0, #0x1                ; =1
    6cfc:      	mov	x2, #0x21               ; =33
    6d00:      	b	0x6ca4 <_stogir.locals.validate+0x3e8>
    6d04:      	add	x16, sp, #0x10
    6d08:      	ldr	w0, [x16, #0x4]
    6d0c:      	sxtw	x0, w0
    6d10:      	cmp	x0, #0x0
    6d14:      	cset	w1, gt
    6d18:      	movz	x16, #0x0, lsl #48
    6d1c:      	sub	x2, x16, x0
    6d20:      	sub	x3, x2, #0x1
    6d24:      	uxtb	w16, w1
    6d28:      	cmp	w16, wzr
    6d2c:      	b.eq	0x6e3c <_stogir.locals.validate+0x580>
    6d30:      	ldr	x2, [x24, #0x8]
    6d34:      	cmp	x0, x2
    6d38:      	b.ge	0x6e34 <_stogir.locals.validate+0x578>
    6d3c:      	add	x2, x24, #0x78
    6d40:      	ldr	x2, [x2, #0x8]
    6d44:      	cmp	x0, x2
    6d48:      	b.ge	0x6efc <_stogir.locals.validate+0x640>
    6d4c:      	lsl	x2, x0, #2
    6d50:      	ldr	x4, [x24, #0x78]
    6d54:      	add	x2, x2, x4
    6d58:      	ldr	w2, [x2]
    6d5c:      	sxtw	x2, w2
    6d60:      	cmp	x2, #0x0
    6d64:      	cset	w2, ge
    6d68:      	ubfx	x2, x2, #0, #8
    6d6c:      	b	0x6f00 <_stogir.locals.validate+0x644>
    6d70:      	movz	x0, #0x0, lsl #48
    6d74:      	movz	x1, #0x0, lsl #48
    6d78:      	movz	x2, #0x0, lsl #48
    6d7c:      	lsr	w0, w0, #0
    6d80:      	lsr	x16, x0, #0
    6d84:      	cmp	x16, #0x1
    6d88:      	b.eq	0x6da4 <_stogir.locals.validate+0x4e8>
    6d8c:      	b.lo	0x6d94 <_stogir.locals.validate+0x4d8>
    6d90:      	b	0x6da8 <_stogir.locals.validate+0x4ec>
    6d94:      	cmp	x16, #0x0
    6d98:      	b.eq	0x6da0 <_stogir.locals.validate+0x4e4>
    6d9c:      	b	0x6da8 <_stogir.locals.validate+0x4ec>
    6da0:      	b	0x6dac <_stogir.locals.validate+0x4f0>
    6da4:      	b	0x6e88 <_stogir.locals.validate+0x5cc>
    6da8:      	b	0x710c <_stogir.locals.validate+0x850>
    6dac:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		0000000000006dac:  ARM64_RELOC_PAGE21	l_stogir.388
    6db0:      	ldr	x16, [x16]
		0000000000006db0:  ARM64_RELOC_PAGEOFF12	l_stogir.388
    6db4:      	orr	x0, x16, xzr
    6db8:      	mov	x1, x0
    6dbc:      	mov	x0, #0x1                ; =1
    6dc0:      	mov	x2, #0x1c               ; =28
    6dc4:      	b	0x6d00 <_stogir.locals.validate+0x444>
    6dc8:      	lsl	x0, x3, #4
    6dcc:      	ldr	x1, [x24, #0x28]
    6dd0:      	add	x0, x0, x1
    6dd4:      	ldr	x1, [x0]
    6dd8:      	ldr	x0, [x0, #0x8]
    6ddc:      	fmov	d31, x0
    6de0:      	mov	x0, x1
    6de4:      	fmov	x1, d31
    6de8:      	mov	x2, x1
    6dec:      	mov	x1, x0
    6df0:      	mov	x0, #0x1                ; =1
    6df4:      	b	0x6d7c <_stogir.locals.validate+0x4c0>
    6df8:      	movz	x2, #0x0, lsl #48
    6dfc:      	cmp	x2, #0x0
    6e00:      	b.eq	0x6d70 <_stogir.locals.validate+0x4b4>
    6e04:      	uxtb	w16, w1
    6e08:      	cmp	w16, wzr
    6e0c:      	b.eq	0x6dc8 <_stogir.locals.validate+0x50c>
    6e10:      	lsl	x0, x0, #4
    6e14:      	ldr	x1, [x24]
    6e18:      	add	x0, x0, x1
    6e1c:      	ldr	x1, [x0]
    6e20:      	ldr	x0, [x0, #0x8]
    6e24:      	fmov	d31, x0
    6e28:      	mov	x0, x1
    6e2c:      	fmov	x1, d31
    6e30:      	b	0x6de8 <_stogir.locals.validate+0x52c>
    6e34:      	movz	x2, #0x0, lsl #48
    6e38:      	b	0x6dfc <_stogir.locals.validate+0x540>
    6e3c:      	cmp	x0, #0x0
    6e40:      	b.ge	0x6df8 <_stogir.locals.validate+0x53c>
    6e44:      	add	x4, x24, #0x28
    6e48:      	add	x5, x24, #0x50
    6e4c:      	ldr	x4, [x4, #0x8]
    6e50:      	ldr	x5, [x5, #0x8]
    6e54:      	cmp	x4, x5
    6e58:      	b.ne	0x6ef4 <_stogir.locals.validate+0x638>
    6e5c:      	cmp	x2, x4
    6e60:      	b.gt	0x6f04 <_stogir.locals.validate+0x648>
    6e64:      	lsl	x2, x3, #2
    6e68:      	ldr	x4, [x24, #0x50]
    6e6c:      	add	x2, x2, x4
    6e70:      	ldr	w2, [x2]
    6e74:      	sxtw	x2, w2
    6e78:      	cmp	x2, #0x0
    6e7c:      	cset	w2, gt
    6e80:      	ubfx	x2, x2, #0, #8
    6e84:      	b	0x6f08 <_stogir.locals.validate+0x64c>
    6e88:      	add	x16, sp, #0x40
    6e8c:      	str	x1, [x16]
    6e90:      	add	x16, sp, #0x40
    6e94:      	str	x2, [x16, #0x8]
    6e98:      	add	x16, sp, #0x10
    6e9c:      	ldr	w0, [x16, #0x4]
    6ea0:      	sxtw	x0, w0
    6ea4:      	cmp	x0, #0x0
    6ea8:      	b.le	0x6ed8 <_stogir.locals.validate+0x61c>
    6eac:      	add	x16, sp, #0x40
    6eb0:      	ldr	w0, [x16]
    6eb4:      	uxtb	w0, w0
    6eb8:      	cmp	x0, #0x83
    6ebc:      	b.ge	0x6f14 <_stogir.locals.validate+0x658>
    6ec0:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		0000000000006ec0:  ARM64_RELOC_PAGE21	l_stogir.389
    6ec4:      	ldr	x16, [x16]
		0000000000006ec4:  ARM64_RELOC_PAGEOFF12	l_stogir.389
    6ec8:      	orr	x1, x16, xzr
    6ecc:      	add	x0, x0, x1
    6ed0:      	ldrb	w0, [x0]
    6ed4:      	b	0x6f18 <_stogir.locals.validate+0x65c>
    6ed8:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		0000000000006ed8:  ARM64_RELOC_PAGE21	l_stogir.390
    6edc:      	ldr	x16, [x16]
		0000000000006edc:  ARM64_RELOC_PAGEOFF12	l_stogir.390
    6ee0:      	orr	x0, x16, xzr
    6ee4:      	mov	x1, x0
    6ee8:      	mov	x0, #0x1                ; =1
    6eec:      	mov	x2, #0x1c               ; =28
    6ef0:      	b	0x6dc4 <_stogir.locals.validate+0x508>
    6ef4:      	movz	x2, #0x0, lsl #48
    6ef8:      	b	0x6dfc <_stogir.locals.validate+0x540>
    6efc:      	movz	x2, #0x0, lsl #48
    6f00:      	b	0x6e38 <_stogir.locals.validate+0x57c>
    6f04:      	movz	x2, #0x0, lsl #48
    6f08:      	b	0x6ef8 <_stogir.locals.validate+0x63c>
    6f0c:      	brk	#0
    6f10:      	b	0x6f0c <_stogir.locals.validate+0x650>
    6f14:      	movz	x0, #0x0, lsl #48
    6f18:      	uxtb	w0, w0
    6f1c:      	and	x0, x0, #0x1
    6f20:      	uxtb	w0, w0
    6f24:      	cmp	x0, #0x0
    6f28:      	b.eq	0x6ed8 <_stogir.locals.validate+0x61c>
    6f2c:      	add	x16, sp, #0x40
    6f30:      	ldr	w0, [x16]
    6f34:      	uxtb	w0, w0
    6f38:      	cmp	x0, #0x83
    6f3c:      	b.ge	0x6f58 <_stogir.locals.validate+0x69c>
    6f40:      	adrp	x16, 0x6000 <_stogir.switch.validate+0xb4>
		0000000000006f40:  ARM64_RELOC_PAGE21	l_stogir.389
    6f44:      	ldr	x16, [x16]
		0000000000006f44:  ARM64_RELOC_PAGEOFF12	l_stogir.389
    6f48:      	orr	x1, x16, xzr
    6f4c:      	add	x0, x0, x1
    6f50:      	ldrb	w0, [x0]
    6f54:      	b	0x6f5c <_stogir.locals.validate+0x6a0>
    6f58:      	movz	x0, #0x0, lsl #48
    6f5c:      	uxtb	w0, w0
    6f60:      	and	x0, x0, #0x4
    6f64:      	uxtb	w0, w0
    6f68:      	cmp	x0, #0x0
    6f6c:      	b.ne	0x6ed8 <_stogir.locals.validate+0x61c>
    6f70:      	cmp	x19, #0x0
    6f74:      	b.eq	0x7078 <_stogir.locals.validate+0x7bc>
    6f78:      	add	x16, sp, #0x10
    6f7c:      	ldr	w0, [x16, #0xc]
    6f80:      	lsr	w0, w0, #0
    6f84:      	add	x8, sp, #0x50
    6f88:      	mov	w1, w0
    6f8c:      	mov	x0, x24
    6f90:      	bl	0x6f90 <_stogir.locals.validate+0x6d4>
		0000000000006f90:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    6f94:      	add	x16, sp, #0x50
    6f98:      	ldr	x0, [x16]
    6f9c:      	add	x16, sp, #0x80
    6fa0:      	str	x0, [x16]
    6fa4:      	add	x16, sp, #0x50
    6fa8:      	ldr	x0, [x16, #0x8]
    6fac:      	add	x16, sp, #0x80
    6fb0:      	str	x0, [x16, #0x8]
    6fb4:      	add	x16, sp, #0x50
    6fb8:      	ldr	x0, [x16, #0x10]
    6fbc:      	add	x16, sp, #0x80
    6fc0:      	str	x0, [x16, #0x10]
    6fc4:      	add	x16, sp, #0x50
    6fc8:      	ldr	x0, [x16, #0x18]
    6fcc:      	add	x16, sp, #0x80
    6fd0:      	str	x0, [x16, #0x18]
    6fd4:      	add	x16, sp, #0x50
    6fd8:      	ldr	x0, [x16, #0x20]
    6fdc:      	add	x16, sp, #0x80
    6fe0:      	str	x0, [x16, #0x20]
    6fe4:      	b	0x70bc <_stogir.locals.validate+0x800>
    6fe8:      	add	x16, sp, #0x80
    6fec:      	orr	x0, x16, xzr
    6ff0:      	lsr	w25, w25, #0
    6ff4:      	add	x0, x0, #0x8
    6ff8:      	add	x16, sp, #0x80
    6ffc:      	ldr	x1, [x16, #0x8]
    7000:      	add	x16, sp, #0xb0
    7004:      	str	x1, [x16]
    7008:      	lsr	w1, w1, #0
    700c:      	ldr	x0, [x0, #0x8]
    7010:      	add	x16, sp, #0xb0
    7014:      	str	x0, [x16, #0x8]
    7018:      	ubfx	x0, x1, #8, #8
    701c:      	lsr	w0, w0, #0
    7020:      	mov	w1, w25
    7024:      	bl	0x7024 <_stogir.locals.validate+0x768>
		0000000000007024:  ARM64_RELOC_BRANCH26	_stogir.types.size
    7028:      	lsr	w0, w0, #0
    702c:      	sxtw	x0, w0
    7030:      	cmp	x0, #0x0
    7034:      	b.le	0x705c <_stogir.locals.validate+0x7a0>
    7038:      	cmp	x0, x22
    703c:      	b.gt	0x705c <_stogir.locals.validate+0x7a0>
    7040:      	cmp	x19, #0x0
    7044:      	b.eq	0x7114 <_stogir.locals.validate+0x858>
    7048:      	add	x16, sp, #0x10
    704c:      	ldr	w1, [x16]
    7050:      	ubfx	x1, x1, #8, #8
    7054:      	cmp	x1, #0x0
    7058:      	b.eq	0x7114 <_stogir.locals.validate+0x858>
    705c:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		000000000000705c:  ARM64_RELOC_PAGE21	l_stogir.391
    7060:      	ldr	x16, [x16]
		0000000000007060:  ARM64_RELOC_PAGEOFF12	l_stogir.391
    7064:      	orr	x0, x16, xzr
    7068:      	mov	x1, x0
    706c:      	mov	x0, #0x1                ; =1
    7070:      	mov	x2, #0x23               ; =35
    7074:      	b	0x6ef0 <_stogir.locals.validate+0x634>
    7078:      	add	x16, sp, #0x10
    707c:      	ldr	x0, [x16]
    7080:      	add	x16, sp, #0x10
    7084:      	ldr	x1, [x16, #0x8]
    7088:      	add	x16, sp, #0x80
    708c:      	mov	x17, #0x1               ; =1
    7090:      	str	x17, [x16]
    7094:      	add	x16, sp, #0x80
    7098:      	str	x0, [x16, #0x8]
    709c:      	add	x16, sp, #0x80
    70a0:      	str	x1, [x16, #0x10]
    70a4:      	add	x16, sp, #0x80
    70a8:      	movz	x17, #0x0, lsl #48
    70ac:      	str	x17, [x16, #0x18]
    70b0:      	add	x16, sp, #0x80
    70b4:      	movz	x17, #0x0, lsl #48
    70b8:      	str	x17, [x16, #0x20]
    70bc:      	add	x16, sp, #0x80
    70c0:      	ldr	w0, [x16]
    70c4:      	lsr	x16, x0, #0
    70c8:      	cmp	x16, #0x1
    70cc:      	b.eq	0x70e8 <_stogir.locals.validate+0x82c>
    70d0:      	b.lo	0x70d8 <_stogir.locals.validate+0x81c>
    70d4:      	b	0x70ec <_stogir.locals.validate+0x830>
    70d8:      	cmp	x16, #0x0
    70dc:      	b.eq	0x70e4 <_stogir.locals.validate+0x828>
    70e0:      	b	0x70ec <_stogir.locals.validate+0x830>
    70e4:      	b	0x70f0 <_stogir.locals.validate+0x834>
    70e8:      	b	0x6fe8 <_stogir.locals.validate+0x72c>
    70ec:      	b	0x713c <_stogir.locals.validate+0x880>
    70f0:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		00000000000070f0:  ARM64_RELOC_PAGE21	l_stogir.392
    70f4:      	ldr	x16, [x16]
		00000000000070f4:  ARM64_RELOC_PAGEOFF12	l_stogir.392
    70f8:      	orr	x0, x16, xzr
    70fc:      	mov	x1, x0
    7100:      	mov	x0, #0x1                ; =1
    7104:      	mov	x2, #0x19               ; =25
    7108:      	b	0x7074 <_stogir.locals.validate+0x7b8>
    710c:      	brk	#0
    7110:      	b	0x710c <_stogir.locals.validate+0x850>
    7114:      	add	x16, sp, #0xb0
    7118:      	ldr	w1, [x16]
    711c:      	uxtb	w1, w1
    7120:      	cmp	x1, #0x48
    7124:      	b.eq	0x705c <_stogir.locals.validate+0x7a0>
    7128:      	and	x0, x0, #0xffffffff
    712c:      	mov	x1, x0
    7130:      	movz	x0, #0x0, lsl #48
    7134:      	movz	x2, #0x0, lsl #48
    7138:      	b	0x7074 <_stogir.locals.validate+0x7b8>
    713c:      	brk	#0
    7140:      	b	0x713c <_stogir.locals.validate+0x880>
    7144:      	mov	x23, x8
    7148:      	b	0x69d0 <_stogir.locals.validate+0x114>
    714c:      	mov	x23, x8
    7150:      	b	0x69d0 <_stogir.locals.validate+0x114>

0000000000007154 <_stogir.conversion.operation?>:
    7154:      	sxtw	x0, w0
    7158:      	cmp	x0, #0x21
    715c:      	b.lt	0x7170 <_stogir.conversion.operation?+0x1c>
    7160:      	cmp	x0, #0x27
    7164:      	cset	w0, le
    7168:      	ubfx	x0, x0, #0, #8
    716c:      	b	0x7174 <_stogir.conversion.operation?+0x20>
    7170:      	movz	x0, #0x0, lsl #48
    7174:      	ret

0000000000007178 <_stogir.conversion.validate>:
    7178:      	sub	sp, sp, #0x50
    717c:      	str	x29, [sp]
    7180:      	str	x30, [sp, #0x8]
    7184:      	mov	x29, sp
    7188:      	str	x19, [sp, #0x40]
    718c:      	sxtw	x1, w1
    7190:      	lsl	x3, x1, #2
    7194:      	cmp	x1, #0x0
    7198:      	cset	w4, gt
    719c:      	movz	x16, #0x0, lsl #48
    71a0:      	sub	x5, x16, x1
    71a4:      	sub	x6, x5, #0x1
    71a8:      	uxtb	w16, w4
    71ac:      	cmp	w16, wzr
    71b0:      	b.eq	0x71f0 <_stogir.conversion.validate+0x78>
    71b4:      	ldr	x5, [x0, #0x8]
    71b8:      	cmp	x1, x5
    71bc:      	b.ge	0x7244 <_stogir.conversion.validate+0xcc>
    71c0:      	add	x5, x0, #0x78
    71c4:      	ldr	x5, [x5, #0x8]
    71c8:      	cmp	x1, x5
    71cc:      	b.ge	0x7368 <_stogir.conversion.validate+0x1f0>
    71d0:      	ldr	x5, [x0, #0x78]
    71d4:      	add	x5, x3, x5
    71d8:      	ldr	w5, [x5]
    71dc:      	sxtw	x5, w5
    71e0:      	cmp	x5, #0x0
    71e4:      	cset	w5, ge
    71e8:      	ubfx	x5, x5, #0, #8
    71ec:      	b	0x736c <_stogir.conversion.validate+0x1f4>
    71f0:      	cmp	x1, #0x0
    71f4:      	b.ge	0x724c <_stogir.conversion.validate+0xd4>
    71f8:      	add	x7, x0, #0x28
    71fc:      	add	x9, x0, #0x50
    7200:      	ldr	x7, [x7, #0x8]
    7204:      	ldr	x9, [x9, #0x8]
    7208:      	cmp	x7, x9
    720c:      	b.ne	0x723c <_stogir.conversion.validate+0xc4>
    7210:      	cmp	x5, x7
    7214:      	b.gt	0x73fc <_stogir.conversion.validate+0x284>
    7218:      	lsl	x5, x6, #2
    721c:      	ldr	x7, [x0, #0x50]
    7220:      	add	x5, x5, x7
    7224:      	ldr	w5, [x5]
    7228:      	sxtw	x5, w5
    722c:      	cmp	x5, #0x0
    7230:      	cset	w5, gt
    7234:      	ubfx	x5, x5, #0, #8
    7238:      	b	0x7400 <_stogir.conversion.validate+0x288>
    723c:      	movz	x5, #0x0, lsl #48
    7240:      	b	0x7250 <_stogir.conversion.validate+0xd8>
    7244:      	movz	x5, #0x0, lsl #48
    7248:      	b	0x7250 <_stogir.conversion.validate+0xd8>
    724c:      	movz	x5, #0x0, lsl #48
    7250:      	cmp	x5, #0x0
    7254:      	b.eq	0x72b8 <_stogir.conversion.validate+0x140>
    7258:      	uxtb	w16, w4
    725c:      	cmp	w16, wzr
    7260:      	b.eq	0x7288 <_stogir.conversion.validate+0x110>
    7264:      	lsl	x4, x1, #4
    7268:      	ldr	x5, [x0]
    726c:      	add	x4, x4, x5
    7270:      	ldr	x5, [x4]
    7274:      	ldr	x4, [x4, #0x8]
    7278:      	fmov	d31, x4
    727c:      	mov	x4, x5
    7280:      	fmov	x5, d31
    7284:      	b	0x72a8 <_stogir.conversion.validate+0x130>
    7288:      	lsl	x4, x6, #4
    728c:      	ldr	x5, [x0, #0x28]
    7290:      	add	x4, x4, x5
    7294:      	ldr	x5, [x4]
    7298:      	ldr	x4, [x4, #0x8]
    729c:      	fmov	d31, x4
    72a0:      	mov	x4, x5
    72a4:      	fmov	x5, d31
    72a8:      	mov	x6, x5
    72ac:      	mov	x5, x4
    72b0:      	mov	x4, #0x1                ; =1
    72b4:      	b	0x72c4 <_stogir.conversion.validate+0x14c>
    72b8:      	movz	x4, #0x0, lsl #48
    72bc:      	movz	x5, #0x0, lsl #48
    72c0:      	movz	x6, #0x0, lsl #48
    72c4:      	lsr	w4, w4, #0
    72c8:      	lsr	x16, x4, #0
    72cc:      	cmp	x16, #0x1
    72d0:      	b.eq	0x72ec <_stogir.conversion.validate+0x174>
    72d4:      	b.lo	0x72dc <_stogir.conversion.validate+0x164>
    72d8:      	b	0x72f0 <_stogir.conversion.validate+0x178>
    72dc:      	cmp	x16, #0x0
    72e0:      	b.eq	0x72e8 <_stogir.conversion.validate+0x170>
    72e4:      	b	0x72f0 <_stogir.conversion.validate+0x178>
    72e8:      	b	0x72f4 <_stogir.conversion.validate+0x17c>
    72ec:      	b	0x7330 <_stogir.conversion.validate+0x1b8>
    72f0:      	b	0x747c <_stogir.conversion.validate+0x304>
    72f4:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		00000000000072f4:  ARM64_RELOC_PAGE21	l_stogir.393
    72f8:      	ldr	x16, [x16]
		00000000000072f8:  ARM64_RELOC_PAGEOFF12	l_stogir.393
    72fc:      	orr	x0, x16, xzr
    7300:      	mov	x19, x8
    7304:      	mov	x1, x0
    7308:      	mov	x0, #0x1                ; =1
    730c:      	mov	x2, #0x12               ; =18
    7310:      	str	x0, [x19]
    7314:      	str	x1, [x19, #0x8]
    7318:      	str	x2, [x19, #0x10]
    731c:      	ldr	x19, [sp, #0x40]
    7320:      	ldr	x29, [sp]
    7324:      	ldr	x30, [sp, #0x8]
    7328:      	add	sp, sp, #0x50
    732c:      	ret
    7330:      	add	x16, sp, #0x10
    7334:      	str	x5, [x16]
    7338:      	add	x16, sp, #0x10
    733c:      	str	x6, [x16, #0x8]
    7340:      	cmp	x1, #0x0
    7344:      	b.gt	0x7370 <_stogir.conversion.validate+0x1f8>
    7348:      	mov	x19, x8
    734c:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		000000000000734c:  ARM64_RELOC_PAGE21	l_stogir.394
    7350:      	ldr	x16, [x16]
		0000000000007350:  ARM64_RELOC_PAGEOFF12	l_stogir.394
    7354:      	orr	x0, x16, xzr
    7358:      	mov	x1, x0
    735c:      	mov	x0, #0x1                ; =1
    7360:      	mov	x2, #0x1e               ; =30
    7364:      	b	0x7310 <_stogir.conversion.validate+0x198>
    7368:      	movz	x5, #0x0, lsl #48
    736c:      	b	0x7248 <_stogir.conversion.validate+0xd0>
    7370:      	uxtb	w1, w5
    7374:      	cmp	x1, #0x21
    7378:      	b.lt	0x75b4 <_stogir.conversion.validate+0x43c>
    737c:      	cmp	x1, #0x27
    7380:      	b.gt	0x75bc <_stogir.conversion.validate+0x444>
    7384:      	ldr	x1, [x0, #0x78]
    7388:      	add	x3, x3, x1
    738c:      	ldr	w3, [x3]
    7390:      	sxtw	x3, w3
    7394:      	cmp	x3, #0x1
    7398:      	b.ne	0x75c4 <_stogir.conversion.validate+0x44c>
    739c:      	asr	x3, x5, #32
    73a0:      	cmp	x3, #0x0
    73a4:      	cset	w4, gt
    73a8:      	movz	x16, #0x0, lsl #48
    73ac:      	sub	x5, x16, x3
    73b0:      	sub	x6, x5, #0x1
    73b4:      	uxtb	w16, w4
    73b8:      	cmp	w16, wzr
    73bc:      	b.eq	0x7430 <_stogir.conversion.validate+0x2b8>
    73c0:      	ldr	x5, [x0, #0x8]
    73c4:      	cmp	x3, x5
    73c8:      	b.ge	0x7484 <_stogir.conversion.validate+0x30c>
    73cc:      	add	x5, x0, #0x78
    73d0:      	ldr	x5, [x5, #0x8]
    73d4:      	cmp	x3, x5
    73d8:      	b.ge	0x7534 <_stogir.conversion.validate+0x3bc>
    73dc:      	lsl	x5, x3, #2
    73e0:      	add	x1, x5, x1
    73e4:      	ldr	w1, [x1]
    73e8:      	sxtw	x1, w1
    73ec:      	cmp	x1, #0x0
    73f0:      	cset	w1, ge
    73f4:      	ubfx	x1, x1, #0, #8
    73f8:      	b	0x7538 <_stogir.conversion.validate+0x3c0>
    73fc:      	movz	x5, #0x0, lsl #48
    7400:      	b	0x7240 <_stogir.conversion.validate+0xc8>
    7404:      	uxtb	w0, w1
    7408:      	cmp	x0, #0x48
    740c:      	b.ne	0x753c <_stogir.conversion.validate+0x3c4>
    7410:      	mov	x19, x8
    7414:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		0000000000007414:  ARM64_RELOC_PAGE21	l_stogir.395
    7418:      	ldr	x16, [x16]
		0000000000007418:  ARM64_RELOC_PAGEOFF12	l_stogir.395
    741c:      	orr	x0, x16, xzr
    7420:      	mov	x1, x0
    7424:      	mov	x0, #0x1                ; =1
    7428:      	mov	x2, #0x25               ; =37
    742c:      	b	0x7364 <_stogir.conversion.validate+0x1ec>
    7430:      	cmp	x3, #0x0
    7434:      	b.ge	0x748c <_stogir.conversion.validate+0x314>
    7438:      	add	x1, x0, #0x28
    743c:      	add	x7, x0, #0x50
    7440:      	ldr	x1, [x1, #0x8]
    7444:      	ldr	x7, [x7, #0x8]
    7448:      	cmp	x1, x7
    744c:      	b.ne	0x752c <_stogir.conversion.validate+0x3b4>
    7450:      	cmp	x5, x1
    7454:      	b.gt	0x75a4 <_stogir.conversion.validate+0x42c>
    7458:      	lsl	x1, x6, #2
    745c:      	ldr	x5, [x0, #0x50]
    7460:      	add	x1, x1, x5
    7464:      	ldr	w1, [x1]
    7468:      	sxtw	x1, w1
    746c:      	cmp	x1, #0x0
    7470:      	cset	w1, gt
    7474:      	ubfx	x1, x1, #0, #8
    7478:      	b	0x75a8 <_stogir.conversion.validate+0x430>
    747c:      	brk	#0
    7480:      	b	0x747c <_stogir.conversion.validate+0x304>
    7484:      	movz	x1, #0x0, lsl #48
    7488:      	b	0x7490 <_stogir.conversion.validate+0x318>
    748c:      	movz	x1, #0x0, lsl #48
    7490:      	cmp	x1, #0x0
    7494:      	b.eq	0x74d4 <_stogir.conversion.validate+0x35c>
    7498:      	uxtb	w16, w4
    749c:      	cmp	w16, wzr
    74a0:      	b.eq	0x74b8 <_stogir.conversion.validate+0x340>
    74a4:      	lsl	x1, x3, #4
    74a8:      	ldr	x0, [x0]
    74ac:      	add	x0, x1, x0
    74b0:      	ldr	x0, [x0]
    74b4:      	b	0x74c8 <_stogir.conversion.validate+0x350>
    74b8:      	lsl	x1, x6, #4
    74bc:      	ldr	x0, [x0, #0x28]
    74c0:      	add	x0, x1, x0
    74c4:      	ldr	x0, [x0]
    74c8:      	mov	x1, x0
    74cc:      	mov	x0, #0x1                ; =1
    74d0:      	b	0x74dc <_stogir.conversion.validate+0x364>
    74d4:      	movz	x0, #0x0, lsl #48
    74d8:      	movz	x1, #0x0, lsl #48
    74dc:      	lsr	w0, w0, #0
    74e0:      	lsr	x16, x0, #0
    74e4:      	cmp	x16, #0x1
    74e8:      	b.eq	0x7504 <_stogir.conversion.validate+0x38c>
    74ec:      	b.lo	0x74f4 <_stogir.conversion.validate+0x37c>
    74f0:      	b	0x7508 <_stogir.conversion.validate+0x390>
    74f4:      	cmp	x16, #0x0
    74f8:      	b.eq	0x7500 <_stogir.conversion.validate+0x388>
    74fc:      	b	0x7508 <_stogir.conversion.validate+0x390>
    7500:      	b	0x750c <_stogir.conversion.validate+0x394>
    7504:      	b	0x7404 <_stogir.conversion.validate+0x28c>
    7508:      	b	0x75ac <_stogir.conversion.validate+0x434>
    750c:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		000000000000750c:  ARM64_RELOC_PAGE21	l_stogir.396
    7510:      	ldr	x16, [x16]
		0000000000007510:  ARM64_RELOC_PAGEOFF12	l_stogir.396
    7514:      	orr	x0, x16, xzr
    7518:      	mov	x19, x8
    751c:      	mov	x1, x0
    7520:      	mov	x0, #0x1                ; =1
    7524:      	mov	x2, #0x19               ; =25
    7528:      	b	0x742c <_stogir.conversion.validate+0x2b4>
    752c:      	movz	x1, #0x0, lsl #48
    7530:      	b	0x7490 <_stogir.conversion.validate+0x318>
    7534:      	movz	x1, #0x0, lsl #48
    7538:      	b	0x7488 <_stogir.conversion.validate+0x310>
    753c:      	cmp	x0, #0x46
    7540:      	b.eq	0x75cc <_stogir.conversion.validate+0x454>
    7544:      	lsr	w2, w2, #0
    7548:      	lsr	w1, w1, #0
    754c:      	add	x16, sp, #0x10
    7550:      	ldr	w0, [x16]
    7554:      	uxtb	w3, w0
    7558:      	ubfx	x1, x1, #8, #8
    755c:      	lsr	w3, w3, #0
    7560:      	ubfx	x0, x0, #8, #8
    7564:      	lsr	w1, w1, #0
    7568:      	lsr	w0, w0, #0
    756c:      	mov	x19, x8
    7570:      	add	x8, sp, #0x20
    7574:      	fmov	s31, w0
    7578:      	mov	w0, w3
    757c:      	mov	w3, w2
    7580:      	fmov	w2, s31
    7584:      	bl	0x7584 <_stogir.conversion.validate+0x40c>
		0000000000007584:  ARM64_RELOC_BRANCH26	_stogir.conversion.policy
    7588:      	add	x16, sp, #0x20
    758c:      	ldr	x0, [x16]
    7590:      	add	x16, sp, #0x20
    7594:      	ldr	x1, [x16, #0x8]
    7598:      	add	x16, sp, #0x20
    759c:      	ldr	x2, [x16, #0x10]
    75a0:      	b	0x742c <_stogir.conversion.validate+0x2b4>
    75a4:      	movz	x1, #0x0, lsl #48
    75a8:      	b	0x7530 <_stogir.conversion.validate+0x3b8>
    75ac:      	brk	#0
    75b0:      	b	0x75ac <_stogir.conversion.validate+0x434>
    75b4:      	mov	x19, x8
    75b8:      	b	0x734c <_stogir.conversion.validate+0x1d4>
    75bc:      	mov	x19, x8
    75c0:      	b	0x734c <_stogir.conversion.validate+0x1d4>
    75c4:      	mov	x19, x8
    75c8:      	b	0x734c <_stogir.conversion.validate+0x1d4>
    75cc:      	mov	x19, x8
    75d0:      	b	0x7414 <_stogir.conversion.validate+0x29c>

00000000000075d4 <_stogir.conditional.validate>:
    75d4:      	sub	sp, sp, #0x40
    75d8:      	str	x29, [sp]
    75dc:      	str	x30, [sp, #0x8]
    75e0:      	mov	x29, sp
    75e4:      	str	x19, [sp, #0x30]
    75e8:      	sxtw	x1, w1
    75ec:      	lsl	x2, x1, #2
    75f0:      	cmp	x1, #0x0
    75f4:      	cset	w3, gt
    75f8:      	movz	x16, #0x0, lsl #48
    75fc:      	sub	x4, x16, x1
    7600:      	sub	x5, x4, #0x1
    7604:      	uxtb	w16, w3
    7608:      	cmp	w16, wzr
    760c:      	b.eq	0x764c <_stogir.conditional.validate+0x78>
    7610:      	ldr	x4, [x0, #0x8]
    7614:      	cmp	x1, x4
    7618:      	b.ge	0x76a0 <_stogir.conditional.validate+0xcc>
    761c:      	add	x4, x0, #0x78
    7620:      	ldr	x4, [x4, #0x8]
    7624:      	cmp	x1, x4
    7628:      	b.ge	0x77b4 <_stogir.conditional.validate+0x1e0>
    762c:      	ldr	x4, [x0, #0x78]
    7630:      	add	x4, x2, x4
    7634:      	ldr	w4, [x4]
    7638:      	sxtw	x4, w4
    763c:      	cmp	x4, #0x0
    7640:      	cset	w4, ge
    7644:      	ubfx	x4, x4, #0, #8
    7648:      	b	0x77b8 <_stogir.conditional.validate+0x1e4>
    764c:      	cmp	x1, #0x0
    7650:      	b.ge	0x76a8 <_stogir.conditional.validate+0xd4>
    7654:      	add	x6, x0, #0x28
    7658:      	add	x7, x0, #0x50
    765c:      	ldr	x6, [x6, #0x8]
    7660:      	ldr	x7, [x7, #0x8]
    7664:      	cmp	x6, x7
    7668:      	b.ne	0x7698 <_stogir.conditional.validate+0xc4>
    766c:      	cmp	x4, x6
    7670:      	b.gt	0x783c <_stogir.conditional.validate+0x268>
    7674:      	lsl	x4, x5, #2
    7678:      	ldr	x6, [x0, #0x50]
    767c:      	add	x4, x4, x6
    7680:      	ldr	w4, [x4]
    7684:      	sxtw	x4, w4
    7688:      	cmp	x4, #0x0
    768c:      	cset	w4, gt
    7690:      	ubfx	x4, x4, #0, #8
    7694:      	b	0x7840 <_stogir.conditional.validate+0x26c>
    7698:      	movz	x4, #0x0, lsl #48
    769c:      	b	0x76ac <_stogir.conditional.validate+0xd8>
    76a0:      	movz	x4, #0x0, lsl #48
    76a4:      	b	0x76ac <_stogir.conditional.validate+0xd8>
    76a8:      	movz	x4, #0x0, lsl #48
    76ac:      	cmp	x4, #0x0
    76b0:      	b.eq	0x7714 <_stogir.conditional.validate+0x140>
    76b4:      	uxtb	w16, w3
    76b8:      	cmp	w16, wzr
    76bc:      	b.eq	0x76e4 <_stogir.conditional.validate+0x110>
    76c0:      	lsl	x3, x1, #4
    76c4:      	ldr	x4, [x0]
    76c8:      	add	x3, x3, x4
    76cc:      	ldr	x4, [x3]
    76d0:      	ldr	x3, [x3, #0x8]
    76d4:      	fmov	d31, x3
    76d8:      	mov	x3, x4
    76dc:      	fmov	x4, d31
    76e0:      	b	0x7704 <_stogir.conditional.validate+0x130>
    76e4:      	lsl	x3, x5, #4
    76e8:      	ldr	x4, [x0, #0x28]
    76ec:      	add	x3, x3, x4
    76f0:      	ldr	x4, [x3]
    76f4:      	ldr	x3, [x3, #0x8]
    76f8:      	fmov	d31, x3
    76fc:      	mov	x3, x4
    7700:      	fmov	x4, d31
    7704:      	mov	x5, x4
    7708:      	mov	x4, x3
    770c:      	mov	x3, #0x1                ; =1
    7710:      	b	0x7720 <_stogir.conditional.validate+0x14c>
    7714:      	movz	x3, #0x0, lsl #48
    7718:      	movz	x4, #0x0, lsl #48
    771c:      	movz	x5, #0x0, lsl #48
    7720:      	lsr	w3, w3, #0
    7724:      	lsr	x16, x3, #0
    7728:      	cmp	x16, #0x1
    772c:      	b.eq	0x7748 <_stogir.conditional.validate+0x174>
    7730:      	b.lo	0x7738 <_stogir.conditional.validate+0x164>
    7734:      	b	0x774c <_stogir.conditional.validate+0x178>
    7738:      	cmp	x16, #0x0
    773c:      	b.eq	0x7744 <_stogir.conditional.validate+0x170>
    7740:      	b	0x774c <_stogir.conditional.validate+0x178>
    7744:      	b	0x7750 <_stogir.conditional.validate+0x17c>
    7748:      	b	0x7770 <_stogir.conditional.validate+0x19c>
    774c:      	b	0x7844 <_stogir.conditional.validate+0x270>
    7750:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		0000000000007750:  ARM64_RELOC_PAGE21	l_stogir.397
    7754:      	ldr	x16, [x16]
		0000000000007754:  ARM64_RELOC_PAGEOFF12	l_stogir.397
    7758:      	orr	x0, x16, xzr
    775c:      	mov	x19, x8
    7760:      	mov	x1, x0
    7764:      	mov	x0, #0x1                ; =1
    7768:      	mov	x2, #0x18               ; =24
    776c:      	b	0x7794 <_stogir.conditional.validate+0x1c0>
    7770:      	cmp	x1, #0x0
    7774:      	b.gt	0x77bc <_stogir.conditional.validate+0x1e8>
    7778:      	mov	x19, x8
    777c:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		000000000000777c:  ARM64_RELOC_PAGE21	l_stogir.398
    7780:      	ldr	x16, [x16]
		0000000000007780:  ARM64_RELOC_PAGEOFF12	l_stogir.398
    7784:      	orr	x0, x16, xzr
    7788:      	mov	x1, x0
    778c:      	mov	x0, #0x1                ; =1
    7790:      	mov	x2, #0x18               ; =24
    7794:      	str	x0, [x19]
    7798:      	str	x1, [x19, #0x8]
    779c:      	str	x2, [x19, #0x10]
    77a0:      	ldr	x19, [sp, #0x30]
    77a4:      	ldr	x29, [sp]
    77a8:      	ldr	x30, [sp, #0x8]
    77ac:      	add	sp, sp, #0x40
    77b0:      	ret
    77b4:      	movz	x4, #0x0, lsl #48
    77b8:      	b	0x76a4 <_stogir.conditional.validate+0xd0>
    77bc:      	uxtb	w1, w4
    77c0:      	cmp	x1, #0x3c
    77c4:      	b.ne	0x784c <_stogir.conditional.validate+0x278>
    77c8:      	ldr	x1, [x0, #0x78]
    77cc:      	add	x1, x2, x1
    77d0:      	ldr	w1, [x1]
    77d4:      	sxtw	x1, w1
    77d8:      	cmp	x1, #0x3
    77dc:      	b.ne	0x7854 <_stogir.conditional.validate+0x280>
    77e0:      	lsr	w1, w5, #0
    77e4:      	lsr	w2, w4, #0
    77e8:      	lsr	x3, x4, #32
    77ec:      	lsr	w1, w1, #0
    77f0:      	lsr	x4, x5, #32
    77f4:      	lsr	w3, w3, #0
    77f8:      	lsr	w4, w4, #0
    77fc:      	ubfx	x2, x2, #8, #8
    7800:      	lsr	w2, w2, #0
    7804:      	mov	x19, x8
    7808:      	add	x8, sp, #0x10
    780c:      	fmov	s31, w1
    7810:      	mov	w1, w2
    7814:      	mov	w2, w3
    7818:      	fmov	w3, s31
    781c:      	bl	0x781c <_stogir.conditional.validate+0x248>
		000000000000781c:  ARM64_RELOC_BRANCH26	_stogir.conditional.operands
    7820:      	add	x16, sp, #0x10
    7824:      	ldr	x0, [x16]
    7828:      	add	x16, sp, #0x10
    782c:      	ldr	x1, [x16, #0x8]
    7830:      	add	x16, sp, #0x10
    7834:      	ldr	x2, [x16, #0x10]
    7838:      	b	0x7794 <_stogir.conditional.validate+0x1c0>
    783c:      	movz	x4, #0x0, lsl #48
    7840:      	b	0x769c <_stogir.conditional.validate+0xc8>
    7844:      	brk	#0
    7848:      	b	0x7844 <_stogir.conditional.validate+0x270>
    784c:      	mov	x19, x8
    7850:      	b	0x777c <_stogir.conditional.validate+0x1a8>
    7854:      	mov	x19, x8
    7858:      	b	0x777c <_stogir.conditional.validate+0x1a8>

000000000000785c <_stogir.floating.validate>:
    785c:      	sub	sp, sp, #0x50
    7860:      	str	x29, [sp]
    7864:      	str	x30, [sp, #0x8]
    7868:      	mov	x29, sp
    786c:      	str	x19, [sp, #0x40]
    7870:      	sxtw	x1, w1
    7874:      	lsl	x2, x1, #2
    7878:      	cmp	x1, #0x0
    787c:      	cset	w3, gt
    7880:      	movz	x16, #0x0, lsl #48
    7884:      	sub	x4, x16, x1
    7888:      	sub	x5, x4, #0x1
    788c:      	uxtb	w16, w3
    7890:      	cmp	w16, wzr
    7894:      	b.eq	0x78d4 <_stogir.floating.validate+0x78>
    7898:      	ldr	x4, [x0, #0x8]
    789c:      	cmp	x1, x4
    78a0:      	b.ge	0x7928 <_stogir.floating.validate+0xcc>
    78a4:      	add	x4, x0, #0x78
    78a8:      	ldr	x4, [x4, #0x8]
    78ac:      	cmp	x1, x4
    78b0:      	b.ge	0x7a4c <_stogir.floating.validate+0x1f0>
    78b4:      	ldr	x4, [x0, #0x78]
    78b8:      	add	x4, x2, x4
    78bc:      	ldr	w4, [x4]
    78c0:      	sxtw	x4, w4
    78c4:      	cmp	x4, #0x0
    78c8:      	cset	w4, ge
    78cc:      	ubfx	x4, x4, #0, #8
    78d0:      	b	0x7a50 <_stogir.floating.validate+0x1f4>
    78d4:      	cmp	x1, #0x0
    78d8:      	b.ge	0x7930 <_stogir.floating.validate+0xd4>
    78dc:      	add	x6, x0, #0x28
    78e0:      	add	x7, x0, #0x50
    78e4:      	ldr	x6, [x6, #0x8]
    78e8:      	ldr	x7, [x7, #0x8]
    78ec:      	cmp	x6, x7
    78f0:      	b.ne	0x7920 <_stogir.floating.validate+0xc4>
    78f4:      	cmp	x4, x6
    78f8:      	b.gt	0x7ad8 <_stogir.floating.validate+0x27c>
    78fc:      	lsl	x4, x5, #2
    7900:      	ldr	x6, [x0, #0x50]
    7904:      	add	x4, x4, x6
    7908:      	ldr	w4, [x4]
    790c:      	sxtw	x4, w4
    7910:      	cmp	x4, #0x0
    7914:      	cset	w4, gt
    7918:      	ubfx	x4, x4, #0, #8
    791c:      	b	0x7adc <_stogir.floating.validate+0x280>
    7920:      	movz	x4, #0x0, lsl #48
    7924:      	b	0x7934 <_stogir.floating.validate+0xd8>
    7928:      	movz	x4, #0x0, lsl #48
    792c:      	b	0x7934 <_stogir.floating.validate+0xd8>
    7930:      	movz	x4, #0x0, lsl #48
    7934:      	cmp	x4, #0x0
    7938:      	b.eq	0x799c <_stogir.floating.validate+0x140>
    793c:      	uxtb	w16, w3
    7940:      	cmp	w16, wzr
    7944:      	b.eq	0x796c <_stogir.floating.validate+0x110>
    7948:      	lsl	x3, x1, #4
    794c:      	ldr	x4, [x0]
    7950:      	add	x3, x3, x4
    7954:      	ldr	x4, [x3]
    7958:      	ldr	x3, [x3, #0x8]
    795c:      	fmov	d31, x3
    7960:      	mov	x3, x4
    7964:      	fmov	x4, d31
    7968:      	b	0x798c <_stogir.floating.validate+0x130>
    796c:      	lsl	x3, x5, #4
    7970:      	ldr	x4, [x0, #0x28]
    7974:      	add	x3, x3, x4
    7978:      	ldr	x4, [x3]
    797c:      	ldr	x3, [x3, #0x8]
    7980:      	fmov	d31, x3
    7984:      	mov	x3, x4
    7988:      	fmov	x4, d31
    798c:      	mov	x5, x4
    7990:      	mov	x4, x3
    7994:      	mov	x3, #0x1                ; =1
    7998:      	b	0x79a8 <_stogir.floating.validate+0x14c>
    799c:      	movz	x3, #0x0, lsl #48
    79a0:      	movz	x4, #0x0, lsl #48
    79a4:      	movz	x5, #0x0, lsl #48
    79a8:      	lsr	w3, w3, #0
    79ac:      	lsr	x16, x3, #0
    79b0:      	cmp	x16, #0x1
    79b4:      	b.eq	0x79d0 <_stogir.floating.validate+0x174>
    79b8:      	b.lo	0x79c0 <_stogir.floating.validate+0x164>
    79bc:      	b	0x79d4 <_stogir.floating.validate+0x178>
    79c0:      	cmp	x16, #0x0
    79c4:      	b.eq	0x79cc <_stogir.floating.validate+0x170>
    79c8:      	b	0x79d4 <_stogir.floating.validate+0x178>
    79cc:      	b	0x79d8 <_stogir.floating.validate+0x17c>
    79d0:      	b	0x7a14 <_stogir.floating.validate+0x1b8>
    79d4:      	b	0x7d94 <_stogir.floating.validate+0x538>
    79d8:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		00000000000079d8:  ARM64_RELOC_PAGE21	l_stogir.399
    79dc:      	ldr	x16, [x16]
		00000000000079dc:  ARM64_RELOC_PAGEOFF12	l_stogir.399
    79e0:      	orr	x0, x16, xzr
    79e4:      	mov	x19, x8
    79e8:      	mov	x1, x0
    79ec:      	mov	x0, #0x1                ; =1
    79f0:      	mov	x2, #0x1c               ; =28
    79f4:      	str	x0, [x19]
    79f8:      	str	x1, [x19, #0x8]
    79fc:      	str	x2, [x19, #0x10]
    7a00:      	ldr	x19, [sp, #0x40]
    7a04:      	ldr	x29, [sp]
    7a08:      	ldr	x30, [sp, #0x8]
    7a0c:      	add	sp, sp, #0x50
    7a10:      	ret
    7a14:      	add	x16, sp, #0x10
    7a18:      	str	x4, [x16]
    7a1c:      	add	x16, sp, #0x10
    7a20:      	str	x5, [x16, #0x8]
    7a24:      	cmp	x1, #0x0
    7a28:      	b.gt	0x7a54 <_stogir.floating.validate+0x1f8>
    7a2c:      	mov	x19, x8
    7a30:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		0000000000007a30:  ARM64_RELOC_PAGE21	l_stogir.400
    7a34:      	ldr	x16, [x16]
		0000000000007a34:  ARM64_RELOC_PAGEOFF12	l_stogir.400
    7a38:      	orr	x0, x16, xzr
    7a3c:      	mov	x1, x0
    7a40:      	mov	x0, #0x1                ; =1
    7a44:      	mov	x2, #0x1c               ; =28
    7a48:      	b	0x79f4 <_stogir.floating.validate+0x198>
    7a4c:      	movz	x4, #0x0, lsl #48
    7a50:      	b	0x792c <_stogir.floating.validate+0xd0>
    7a54:      	uxtb	w4, w4
    7a58:      	orr	x1, x4, xzr
    7a5c:      	cmp	x1, #0xe
    7a60:      	cset	w3, ge
    7a64:      	cmp	x1, #0x19
    7a68:      	cset	w5, le
    7a6c:      	cmp	x1, #0x1f
    7a70:      	cset	w6, eq
    7a74:      	cmp	x1, #0x20
    7a78:      	cset	w7, eq
    7a7c:      	uxtb	w16, w3
    7a80:      	cmp	w16, wzr
    7a84:      	b.eq	0x7ae0 <_stogir.floating.validate+0x284>
    7a88:      	uxtb	w16, w5
    7a8c:      	cmp	w16, wzr
    7a90:      	b.eq	0x7ae0 <_stogir.floating.validate+0x284>
    7a94:      	cmp	x1, #0x1d
    7a98:      	cset	w1, eq
    7a9c:      	ldr	x9, [x0, #0x78]
    7aa0:      	add	x2, x2, x9
    7aa4:      	ldr	w2, [x2]
    7aa8:      	uxtb	w16, w6
    7aac:      	cmp	w16, wzr
    7ab0:      	b.ne	0x7b20 <_stogir.floating.validate+0x2c4>
    7ab4:      	uxtb	w16, w7
    7ab8:      	cmp	w16, wzr
    7abc:      	b.ne	0x7b20 <_stogir.floating.validate+0x2c4>
    7ac0:      	uxtb	w16, w1
    7ac4:      	cmp	w16, wzr
    7ac8:      	mov	x16, #0x3               ; =3
    7acc:      	mov	x17, #0x2               ; =2
    7ad0:      	csel	x6, x16, x17, ne
    7ad4:      	b	0x7b24 <_stogir.floating.validate+0x2c8>
    7ad8:      	movz	x4, #0x0, lsl #48
    7adc:      	b	0x7924 <_stogir.floating.validate+0xc8>
    7ae0:      	uxtb	w16, w6
    7ae4:      	cmp	w16, wzr
    7ae8:      	b.ne	0x7a94 <_stogir.floating.validate+0x238>
    7aec:      	uxtb	w16, w7
    7af0:      	cmp	w16, wzr
    7af4:      	b.ne	0x7a94 <_stogir.floating.validate+0x238>
    7af8:      	cmp	x1, #0x1a
    7afc:      	b.lt	0x7b08 <_stogir.floating.validate+0x2ac>
    7b00:      	cmp	x1, #0x1d
    7b04:      	b.le	0x7a94 <_stogir.floating.validate+0x238>
    7b08:      	cmp	x1, #0x3a
    7b0c:      	b.eq	0x7a94 <_stogir.floating.validate+0x238>
    7b10:      	cmp	x1, #0x3b
    7b14:      	b.eq	0x7a94 <_stogir.floating.validate+0x238>
    7b18:      	mov	x19, x8
    7b1c:      	b	0x7a30 <_stogir.floating.validate+0x1d4>
    7b20:      	mov	x6, #0x1                ; =1
    7b24:      	sxtw	x2, w2
    7b28:      	lsr	w6, w6, #0
    7b2c:      	sxtw	x6, w6
    7b30:      	cmp	x2, x6
    7b34:      	b.ne	0x7da4 <_stogir.floating.validate+0x548>
    7b38:      	add	x16, sp, #0x10
    7b3c:      	ldr	w2, [x16, #0x4]
    7b40:      	sxtw	x2, w2
    7b44:      	cmp	x2, #0x0
    7b48:      	cset	w6, gt
    7b4c:      	movz	x16, #0x0, lsl #48
    7b50:      	sub	x7, x16, x2
    7b54:      	sub	x9, x7, #0x1
    7b58:      	uxtb	w16, w6
    7b5c:      	cmp	w16, wzr
    7b60:      	b.eq	0x7bc0 <_stogir.floating.validate+0x364>
    7b64:      	ldr	x7, [x0, #0x8]
    7b68:      	cmp	x2, x7
    7b6c:      	b.ge	0x7c0c <_stogir.floating.validate+0x3b0>
    7b70:      	add	x7, x0, #0x78
    7b74:      	ldr	x7, [x7, #0x8]
    7b78:      	cmp	x2, x7
    7b7c:      	b.ge	0x7cec <_stogir.floating.validate+0x490>
    7b80:      	lsl	x7, x2, #2
    7b84:      	ldr	x10, [x0, #0x78]
    7b88:      	add	x7, x7, x10
    7b8c:      	ldr	w7, [x7]
    7b90:      	sxtw	x7, w7
    7b94:      	cmp	x7, #0x0
    7b98:      	cset	w7, ge
    7b9c:      	ubfx	x7, x7, #0, #8
    7ba0:      	b	0x7cf0 <_stogir.floating.validate+0x494>
    7ba4:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		0000000000007ba4:  ARM64_RELOC_PAGE21	l_stogir.401
    7ba8:      	ldr	x16, [x16]
		0000000000007ba8:  ARM64_RELOC_PAGEOFF12	l_stogir.401
    7bac:      	orr	x0, x16, xzr
    7bb0:      	mov	x1, x0
    7bb4:      	mov	x0, #0x1                ; =1
    7bb8:      	mov	x2, #0x1d               ; =29
    7bbc:      	b	0x7a48 <_stogir.floating.validate+0x1ec>
    7bc0:      	cmp	x2, #0x0
    7bc4:      	b.ge	0x7c14 <_stogir.floating.validate+0x3b8>
    7bc8:      	add	x10, x0, #0x28
    7bcc:      	add	x11, x0, #0x50
    7bd0:      	ldr	x10, [x10, #0x8]
    7bd4:      	ldr	x11, [x11, #0x8]
    7bd8:      	cmp	x10, x11
    7bdc:      	b.ne	0x7ce4 <_stogir.floating.validate+0x488>
    7be0:      	cmp	x7, x10
    7be4:      	b.gt	0x7d8c <_stogir.floating.validate+0x530>
    7be8:      	lsl	x7, x9, #2
    7bec:      	ldr	x10, [x0, #0x50]
    7bf0:      	add	x7, x7, x10
    7bf4:      	ldr	w7, [x7]
    7bf8:      	sxtw	x7, w7
    7bfc:      	cmp	x7, #0x0
    7c00:      	cset	w7, gt
    7c04:      	ubfx	x7, x7, #0, #8
    7c08:      	b	0x7d90 <_stogir.floating.validate+0x534>
    7c0c:      	movz	x7, #0x0, lsl #48
    7c10:      	b	0x7c18 <_stogir.floating.validate+0x3bc>
    7c14:      	movz	x7, #0x0, lsl #48
    7c18:      	cmp	x7, #0x0
    7c1c:      	b.eq	0x7c5c <_stogir.floating.validate+0x400>
    7c20:      	uxtb	w16, w6
    7c24:      	cmp	w16, wzr
    7c28:      	b.eq	0x7c40 <_stogir.floating.validate+0x3e4>
    7c2c:      	lsl	x2, x2, #4
    7c30:      	ldr	x6, [x0]
    7c34:      	add	x2, x2, x6
    7c38:      	ldr	x2, [x2]
    7c3c:      	b	0x7c50 <_stogir.floating.validate+0x3f4>
    7c40:      	lsl	x2, x9, #4
    7c44:      	ldr	x6, [x0, #0x28]
    7c48:      	add	x2, x2, x6
    7c4c:      	ldr	x2, [x2]
    7c50:      	mov	x6, x2
    7c54:      	mov	x2, #0x1                ; =1
    7c58:      	b	0x7c64 <_stogir.floating.validate+0x408>
    7c5c:      	movz	x2, #0x0, lsl #48
    7c60:      	movz	x6, #0x0, lsl #48
    7c64:      	lsr	w2, w2, #0
    7c68:      	lsr	x16, x2, #0
    7c6c:      	cmp	x16, #0x1
    7c70:      	b.eq	0x7c8c <_stogir.floating.validate+0x430>
    7c74:      	b.lo	0x7c7c <_stogir.floating.validate+0x420>
    7c78:      	b	0x7c90 <_stogir.floating.validate+0x434>
    7c7c:      	cmp	x16, #0x0
    7c80:      	b.eq	0x7c88 <_stogir.floating.validate+0x42c>
    7c84:      	b	0x7c90 <_stogir.floating.validate+0x434>
    7c88:      	b	0x7c94 <_stogir.floating.validate+0x438>
    7c8c:      	b	0x7cb4 <_stogir.floating.validate+0x458>
    7c90:      	b	0x7d9c <_stogir.floating.validate+0x540>
    7c94:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x744>
		0000000000007c94:  ARM64_RELOC_PAGE21	l_stogir.402
    7c98:      	ldr	x16, [x16]
		0000000000007c98:  ARM64_RELOC_PAGEOFF12	l_stogir.402
    7c9c:      	orr	x0, x16, xzr
    7ca0:      	mov	x19, x8
    7ca4:      	mov	x1, x0
    7ca8:      	mov	x0, #0x1                ; =1
    7cac:      	mov	x2, #0x18               ; =24
    7cb0:      	b	0x7bbc <_stogir.floating.validate+0x360>
    7cb4:      	lsr	w6, w6, #0
    7cb8:      	add	x16, sp, #0x10
    7cbc:      	ldr	w2, [x16]
    7cc0:      	ubfx	x6, x6, #8, #8
    7cc4:      	uxtb	w16, w3
    7cc8:      	cmp	w16, wzr
    7ccc:      	b.eq	0x7d48 <_stogir.floating.validate+0x4ec>
    7cd0:      	uxtb	w16, w5
    7cd4:      	cmp	w16, wzr
    7cd8:      	b.eq	0x7d48 <_stogir.floating.validate+0x4ec>
    7cdc:      	mov	x3, #0x1                ; =1
    7ce0:      	b	0x7d4c <_stogir.floating.validate+0x4f0>
    7ce4:      	movz	x7, #0x0, lsl #48
    7ce8:      	b	0x7c18 <_stogir.floating.validate+0x3bc>
    7cec:      	movz	x7, #0x0, lsl #48
    7cf0:      	b	0x7c10 <_stogir.floating.validate+0x3b4>
    7cf4:      	movz	x1, #0x0, lsl #48
    7cf8:      	lsr	w2, w2, #0
    7cfc:      	lsr	w3, w3, #0
    7d00:      	lsr	w4, w4, #0
    7d04:      	lsr	w6, w6, #0
    7d08:      	lsr	w1, w1, #0
    7d0c:      	mov	w5, w1
    7d10:      	mov	w1, w4
    7d14:      	mov	w4, w3
    7d18:      	mov	w3, w2
    7d1c:      	mov	w2, w6
    7d20:      	mov	x19, x8
    7d24:      	add	x8, sp, #0x20
    7d28:      	bl	0x7d28 <_stogir.floating.validate+0x4cc>
		0000000000007d28:  ARM64_RELOC_BRANCH26	_stogir.floating.operands
    7d2c:      	add	x16, sp, #0x20
    7d30:      	ldr	x0, [x16]
    7d34:      	add	x16, sp, #0x20
    7d38:      	ldr	x1, [x16, #0x8]
    7d3c:      	add	x16, sp, #0x20
    7d40:      	ldr	x2, [x16, #0x10]
    7d44:      	b	0x7bbc <_stogir.floating.validate+0x360>
    7d48:      	orr	x3, x6, xzr
    7d4c:      	lsr	w3, w3, #0
    7d50:      	ubfx	x2, x2, #8, #8
    7d54:      	sxtw	x3, w3
    7d58:      	cmp	x2, x3
    7d5c:      	b.ne	0x7dac <_stogir.floating.validate+0x550>
    7d60:      	add	x16, sp, #0x10
    7d64:      	ldr	w2, [x16, #0x4]
    7d68:      	add	x16, sp, #0x10
    7d6c:      	ldr	w3, [x16, #0x8]
    7d70:      	uxtb	w16, w1
    7d74:      	cmp	w16, wzr
    7d78:      	b.eq	0x7cf4 <_stogir.floating.validate+0x498>
    7d7c:      	add	x16, sp, #0x10
    7d80:      	ldr	w1, [x16, #0xc]
    7d84:      	sxtw	x1, w1
    7d88:      	b	0x7cf8 <_stogir.floating.validate+0x49c>
    7d8c:      	movz	x7, #0x0, lsl #48
    7d90:      	b	0x7ce8 <_stogir.floating.validate+0x48c>
    7d94:      	brk	#0
    7d98:      	b	0x7d94 <_stogir.floating.validate+0x538>
    7d9c:      	brk	#0
    7da0:      	b	0x7d9c <_stogir.floating.validate+0x540>
    7da4:      	mov	x19, x8
    7da8:      	b	0x7a30 <_stogir.floating.validate+0x1d4>
    7dac:      	mov	x19, x8
    7db0:      	b	0x7ba4 <_stogir.floating.validate+0x348>

0000000000007db4 <_stogir.types.integer?>:
    7db4:      	sxtw	x0, w0
    7db8:      	cmp	x0, #0x1
    7dbc:      	b.lt	0x7dd0 <_stogir.types.integer?+0x1c>
    7dc0:      	cmp	x0, #0xb
    7dc4:      	cset	w0, le
    7dc8:      	ubfx	x0, x0, #0, #8
    7dcc:      	b	0x7dd4 <_stogir.types.integer?+0x20>
    7dd0:      	movz	x0, #0x0, lsl #48
    7dd4:      	ret

0000000000007dd8 <_stogir.integer-unary.valid-type?>:
    7dd8:      	sxtw	x0, w0
    7ddc:      	cmp	x0, #0x2d
    7de0:      	cset	w2, eq
    7de4:      	cmp	x0, #0x1f
    7de8:      	cset	w3, eq
    7dec:      	cmp	x0, #0x20
    7df0:      	cset	w4, eq
    7df4:      	cmp	x0, #0x36
    7df8:      	cset	w5, eq
    7dfc:      	uxtb	w16, w3
    7e00:      	cmp	w16, wzr
    7e04:      	b.ne	0x7e4c <_stogir.integer-unary.valid-type?+0x74>
    7e08:      	uxtb	w16, w4
    7e0c:      	cmp	w16, wzr
    7e10:      	b.ne	0x7e4c <_stogir.integer-unary.valid-type?+0x74>
    7e14:      	uxtb	w16, w2
    7e18:      	cmp	w16, wzr
    7e1c:      	b.ne	0x7e4c <_stogir.integer-unary.valid-type?+0x74>
    7e20:      	uxtb	w16, w5
    7e24:      	cmp	w16, wzr
    7e28:      	b.ne	0x7e4c <_stogir.integer-unary.valid-type?+0x74>
    7e2c:      	cmp	x0, #0x37
    7e30:      	b.eq	0x7e4c <_stogir.integer-unary.valid-type?+0x74>
    7e34:      	cmp	x0, #0x38
    7e38:      	b.eq	0x7e4c <_stogir.integer-unary.valid-type?+0x74>
    7e3c:      	cmp	x0, #0x39
    7e40:      	b.eq	0x7e4c <_stogir.integer-unary.valid-type?+0x74>
    7e44:      	movz	x0, #0x0, lsl #48
    7e48:      	b	0x7e84 <_stogir.integer-unary.valid-type?+0xac>
    7e4c:      	sxtw	x1, w1
    7e50:      	cmp	x1, #0x1
    7e54:      	b.lt	0x7e80 <_stogir.integer-unary.valid-type?+0xa8>
    7e58:      	cmp	x1, #0xb
    7e5c:      	cset	w0, le
    7e60:      	uxtb	w16, w0
    7e64:      	cmp	w16, wzr
    7e68:      	b.eq	0x7e80 <_stogir.integer-unary.valid-type?+0xa8>
    7e6c:      	uxtb	w16, w2
    7e70:      	cmp	w16, wzr
    7e74:      	b.eq	0x7e90 <_stogir.integer-unary.valid-type?+0xb8>
    7e78:      	mov	x0, #0x1                ; =1
    7e7c:      	b	0x7e8c <_stogir.integer-unary.valid-type?+0xb4>
    7e80:      	movz	x0, #0x0, lsl #48
    7e84:      	ret
    7e88:      	mov	x0, #0x1                ; =1
    7e8c:      	b	0x7e84 <_stogir.integer-unary.valid-type?+0xac>
    7e90:      	cmp	x1, #0x1
    7e94:      	b.ne	0x7ea0 <_stogir.integer-unary.valid-type?+0xc8>
    7e98:      	movz	x0, #0x0, lsl #48
    7e9c:      	b	0x7e8c <_stogir.integer-unary.valid-type?+0xb4>
    7ea0:      	cmp	x1, #0x6
    7ea4:      	cset	w2, eq
    7ea8:      	uxtb	w16, w3
    7eac:      	cmp	w16, wzr
    7eb0:      	b.eq	0x7ec4 <_stogir.integer-unary.valid-type?+0xec>
    7eb4:      	uxtb	w16, w2
    7eb8:      	cmp	w16, wzr
    7ebc:      	cset	x0, eq
    7ec0:      	b	0x7e8c <_stogir.integer-unary.valid-type?+0xb4>
    7ec4:      	uxtb	w16, w4
    7ec8:      	cmp	w16, wzr
    7ecc:      	b.eq	0x7ee8 <_stogir.integer-unary.valid-type?+0x110>
    7ed0:      	cmp	x1, #0x7
    7ed4:      	b.lt	0x7ee0 <_stogir.integer-unary.valid-type?+0x108>
    7ed8:      	ubfx	x0, x0, #0, #8
    7edc:      	b	0x7ee4 <_stogir.integer-unary.valid-type?+0x10c>
    7ee0:      	movz	x0, #0x0, lsl #48
    7ee4:      	b	0x7e8c <_stogir.integer-unary.valid-type?+0xb4>
    7ee8:      	uxtb	w16, w5
    7eec:      	cmp	w16, wzr
    7ef0:      	b.eq	0x7e88 <_stogir.integer-unary.valid-type?+0xb0>
    7ef4:      	cmp	x1, #0x3
    7ef8:      	b.ne	0x7f14 <_stogir.integer-unary.valid-type?+0x13c>
    7efc:      	mov	x0, #0x1                ; =1
    7f00:      	b	0x7f10 <_stogir.integer-unary.valid-type?+0x138>
    7f04:      	cmp	x1, #0xb
    7f08:      	cset	w0, eq
    7f0c:      	ubfx	x0, x0, #0, #8
    7f10:      	b	0x7e8c <_stogir.integer-unary.valid-type?+0xb4>
    7f14:      	cmp	x1, #0x4
    7f18:      	b.ne	0x7f24 <_stogir.integer-unary.valid-type?+0x14c>
    7f1c:      	mov	x0, #0x1                ; =1
    7f20:      	b	0x7f10 <_stogir.integer-unary.valid-type?+0x138>
    7f24:      	cmp	x1, #0x5
    7f28:      	b.ne	0x7f34 <_stogir.integer-unary.valid-type?+0x15c>
    7f2c:      	mov	x0, #0x1                ; =1
    7f30:      	b	0x7f10 <_stogir.integer-unary.valid-type?+0x138>
    7f34:      	uxtb	w16, w2
    7f38:      	cmp	w16, wzr
    7f3c:      	b.eq	0x7f48 <_stogir.integer-unary.valid-type?+0x170>
    7f40:      	mov	x0, #0x1                ; =1
    7f44:      	b	0x7f10 <_stogir.integer-unary.valid-type?+0x138>
    7f48:      	cmp	x1, #0x9
    7f4c:      	b.ne	0x7f58 <_stogir.integer-unary.valid-type?+0x180>
    7f50:      	mov	x0, #0x1                ; =1
    7f54:      	b	0x7f10 <_stogir.integer-unary.valid-type?+0x138>
    7f58:      	cmp	x1, #0xa
    7f5c:      	b.ne	0x7f04 <_stogir.integer-unary.valid-type?+0x12c>
    7f60:      	mov	x0, #0x1                ; =1
    7f64:      	b	0x7f10 <_stogir.integer-unary.valid-type?+0x138>

0000000000007f68 <_stogir.integer-binary.valid-type?>:
    7f68:      	sxtw	x0, w0
    7f6c:      	cmp	x0, #0x3a
    7f70:      	cset	w2, eq
    7f74:      	cmp	x0, #0x3b
    7f78:      	cset	w3, eq
    7f7c:      	cmp	x0, #0x1a
    7f80:      	b.lt	0x7fd4 <_stogir.integer-binary.valid-type?+0x6c>
    7f84:      	cmp	x0, #0x1e
    7f88:      	b.gt	0x7fd4 <_stogir.integer-binary.valid-type?+0x6c>
    7f8c:      	sxtw	x1, w1
    7f90:      	cmp	x1, #0x1
    7f94:      	b.lt	0x8004 <_stogir.integer-binary.valid-type?+0x9c>
    7f98:      	cmp	x1, #0xb
    7f9c:      	b.gt	0x8004 <_stogir.integer-binary.valid-type?+0x9c>
    7fa0:      	cmp	x1, #0x1
    7fa4:      	b.ne	0x800c <_stogir.integer-binary.valid-type?+0xa4>
    7fa8:      	cmp	x0, #0x2e
    7fac:      	b.eq	0x8014 <_stogir.integer-binary.valid-type?+0xac>
    7fb0:      	cmp	x0, #0x2f
    7fb4:      	b.eq	0x8014 <_stogir.integer-binary.valid-type?+0xac>
    7fb8:      	cmp	x0, #0x30
    7fbc:      	b.eq	0x8014 <_stogir.integer-binary.valid-type?+0xac>
    7fc0:      	uxtb	w16, w2
    7fc4:      	cmp	w16, wzr
    7fc8:      	b.eq	0x801c <_stogir.integer-binary.valid-type?+0xb4>
    7fcc:      	mov	x0, #0x1                ; =1
    7fd0:      	b	0x8024 <_stogir.integer-binary.valid-type?+0xbc>
    7fd4:      	cmp	x0, #0x2e
    7fd8:      	b.lt	0x7fe4 <_stogir.integer-binary.valid-type?+0x7c>
    7fdc:      	cmp	x0, #0x35
    7fe0:      	b.le	0x7f8c <_stogir.integer-binary.valid-type?+0x24>
    7fe4:      	uxtb	w16, w2
    7fe8:      	cmp	w16, wzr
    7fec:      	b.ne	0x7f8c <_stogir.integer-binary.valid-type?+0x24>
    7ff0:      	uxtb	w16, w3
    7ff4:      	cmp	w16, wzr
    7ff8:      	b.ne	0x7f8c <_stogir.integer-binary.valid-type?+0x24>
    7ffc:      	movz	x0, #0x0, lsl #48
    8000:      	b	0x8008 <_stogir.integer-binary.valid-type?+0xa0>
    8004:      	movz	x0, #0x0, lsl #48
    8008:      	ret
    800c:      	mov	x0, #0x1                ; =1
    8010:      	b	0x8008 <_stogir.integer-binary.valid-type?+0xa0>
    8014:      	mov	x0, #0x1                ; =1
    8018:      	b	0x8010 <_stogir.integer-binary.valid-type?+0xa8>
    801c:      	ubfx	x3, x3, #0, #8
    8020:      	mov	x0, x3
    8024:      	b	0x8018 <_stogir.integer-binary.valid-type?+0xb0>

0000000000008028 <_coil.core.Len$slice$len__u8>:
    8028:      	mov	x0, x1
    802c:      	ret

0000000000008030 <_inherent$slice$data__u8>:
    8030:      	ret

0000000000008034 <_coil.mem.eql__u8>:
    8034:      	sub	sp, sp, #0x10
    8038:      	str	x29, [sp]
    803c:      	str	x30, [sp, #0x8]
    8040:      	mov	x29, sp
    8044:      	cmp	x2, #0x0
    8048:      	b.ne	0x8054 <_coil.mem.eql__u8+0x20>
    804c:      	mov	x0, #0x1                ; =1
    8050:      	b	0x8070 <_coil.mem.eql__u8+0x3c>
    8054:      	lsr	x2, x2, #0
    8058:      	bl	0x8058 <_coil.mem.eql__u8+0x24>
		0000000000008058:  ARM64_RELOC_BRANCH26	_memcmp
    805c:      	lsr	w0, w0, #0
    8060:      	sxtw	x0, w0
    8064:      	cmp	x0, #0x0
    8068:      	cset	w0, eq
    806c:      	ubfx	x0, x0, #0, #8
    8070:      	ldr	x29, [sp]
    8074:      	ldr	x30, [sp, #0x8]
    8078:      	add	sp, sp, #0x10
    807c:      	ret

0000000000008080 <_stogir.opcode.count>:
    8080:      	mov	x0, #0x83               ; =131
    8084:      	ret

0000000000008088 <_stogir.types.valid-scalar?>:
    8088:      	sxtw	x0, w0
    808c:      	cmp	x0, #0x0
    8090:      	b.lt	0x80a4 <_stogir.types.valid-scalar?+0x1c>
    8094:      	cmp	x0, #0xd
    8098:      	cset	w0, le
    809c:      	ubfx	x0, x0, #0, #8
    80a0:      	b	0x80a8 <_stogir.types.valid-scalar?+0x20>
    80a4:      	movz	x0, #0x0, lsl #48
    80a8:      	ret

00000000000080ac <_stogir.types.vector?>:
    80ac:      	sxtw	x0, w0
    80b0:      	cmp	x0, #0xf
    80b4:      	b.le	0x80f0 <_stogir.types.vector?+0x44>
    80b8:      	cmp	x0, #0x80
    80bc:      	b.ge	0x8100 <_stogir.types.vector?+0x54>
    80c0:      	and	x1, x0, #0xf
    80c4:      	lsr	w1, w1, #0
    80c8:      	sxtw	x1, w1
    80cc:      	cmp	x1, #0x1
    80d0:      	b.lt	0x80f8 <_stogir.types.vector?+0x4c>
    80d4:      	and	x0, x0, #0xf
    80d8:      	lsr	w0, w0, #0
    80dc:      	sxtw	x0, w0
    80e0:      	cmp	x0, #0xd
    80e4:      	cset	w0, le
    80e8:      	ubfx	x0, x0, #0, #8
    80ec:      	b	0x80fc <_stogir.types.vector?+0x50>
    80f0:      	movz	x0, #0x0, lsl #48
    80f4:      	b	0x80fc <_stogir.types.vector?+0x50>
    80f8:      	movz	x0, #0x0, lsl #48
    80fc:      	ret
    8100:      	movz	x0, #0x0, lsl #48
    8104:      	b	0x80fc <_stogir.types.vector?+0x50>

0000000000008108 <_coil.core.Get$slice$get__i8>:
    8108:      	lsr	x1, x2, #0
    810c:      	add	x0, x1, x0
    8110:      	ldrsb	w0, [x0]
    8114:      	sxtb	x0, w0
    8118:      	ret

000000000000811c <_stogir.opcode.metadata>:
    811c:      	sub	sp, sp, #0x10
    8120:      	mov	x0, sp
    8124:      	adrp	x16, 0x8000 <_stogir.integer-binary.valid-type?+0x98>
		0000000000008124:  ARM64_RELOC_PAGE21	l_stogir.403
    8128:      	ldr	x16, [x16]
		0000000000008128:  ARM64_RELOC_PAGEOFF12	l_stogir.403
    812c:      	orr	x1, x16, xzr
    8130:      	str	x1, [x0]
    8134:      	mov	x17, #0x83              ; =131
    8138:      	str	x17, [x0, #0x8]
    813c:      	ldr	x0, [sp]
    8140:      	ldr	x1, [sp, #0x8]
    8144:      	add	sp, sp, #0x10
    8148:      	ret

000000000000814c <_coil.core.Get$slice$get__u32>:
    814c:      	lsl	x1, x2, #2
    8150:      	add	x0, x1, x0
    8154:      	ldr	w0, [x0]
    8158:      	ret

000000000000815c <_stogir.opcode.operand-code-word>:
    815c:      	sxtw	x1, w1
    8160:      	cmp	x1, #0x0
    8164:      	b.le	0x8178 <_stogir.opcode.operand-code-word+0x1c>
    8168:      	cmp	x1, #0x4
    816c:      	b.le	0x8180 <_stogir.opcode.operand-code-word+0x24>
    8170:      	mov	x1, #0x4                ; =4
    8174:      	b	0x818c <_stogir.opcode.operand-code-word+0x30>
    8178:      	movz	x0, #0x0, lsl #48
    817c:      	b	0x81ac <_stogir.opcode.operand-code-word+0x50>
    8180:      	sub	x1, x1, #0x1
    8184:      	lsr	w1, w1, #0
    8188:      	sxtw	x1, w1
    818c:      	ubfx	x0, x0, #0, #32
    8190:      	lsl	x1, x1, #2
    8194:      	lsr	w1, w1, #0
    8198:      	ubfx	x1, x1, #0, #32
    819c:      	lsr	x0, x0, x1
    81a0:      	lsr	w0, w0, #0
    81a4:      	and	x0, x0, #0xf
    81a8:      	lsr	w0, w0, #0
    81ac:      	ret

00000000000081b0 <_inherent$coil.arraylist.ArrayList$at__stogir.node.Node>:
    81b0:      	lsl	x1, x1, #4
    81b4:      	ldr	x0, [x0]
    81b8:      	add	x0, x1, x0
    81bc:      	ret

00000000000081c0 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.strings.Entry>:
    81c0:      	ldr	x0, [x0, #0x8]
    81c4:      	ret

00000000000081c8 <_coil.core.Len$coil.arraylist.ArrayList$len__u8>:
    81c8:      	ldr	x0, [x0, #0x8]
    81cc:      	ret

00000000000081d0 <_inherent$coil.arraylist.ArrayList$slice__u8>:
    81d0:      	sub	sp, sp, #0x10
    81d4:      	mov	x1, sp
    81d8:      	ldr	x2, [x0]
    81dc:      	ldr	x0, [x0, #0x8]
    81e0:      	str	x2, [x1]
    81e4:      	str	x0, [x1, #0x8]
    81e8:      	ldr	x0, [sp]
    81ec:      	ldr	x1, [sp, #0x8]
    81f0:      	add	sp, sp, #0x10
    81f4:      	ret

00000000000081f8 <_coil.slice.subslice__u8>:
    81f8:      	sub	sp, sp, #0x10
    81fc:      	mov	x1, sp
    8200:      	lsr	x4, x2, #0
    8204:      	sub	x2, x3, x2
    8208:      	add	x0, x4, x0
    820c:      	str	x0, [x1]
    8210:      	str	x2, [x1, #0x8]
    8214:      	ldr	x0, [sp]
    8218:      	ldr	x1, [sp, #0x8]
    821c:      	add	sp, sp, #0x10
    8220:      	ret

0000000000008224 <_stogir.floating.operation?>:
    8224:      	sxtw	x0, w0
    8228:      	cmp	x0, #0xe
    822c:      	b.lt	0x8240 <_stogir.floating.operation?+0x1c>
    8230:      	cmp	x0, #0x19
    8234:      	b.gt	0x8240 <_stogir.floating.operation?+0x1c>
    8238:      	mov	x0, #0x1                ; =1
    823c:      	b	0x826c <_stogir.floating.operation?+0x48>
    8240:      	cmp	x0, #0x1f
    8244:      	b.eq	0x8268 <_stogir.floating.operation?+0x44>
    8248:      	cmp	x0, #0x20
    824c:      	b.eq	0x8268 <_stogir.floating.operation?+0x44>
    8250:      	cmp	x0, #0x1a
    8254:      	b.lt	0x8280 <_stogir.floating.operation?+0x5c>
    8258:      	cmp	x0, #0x1d
    825c:      	b.gt	0x8280 <_stogir.floating.operation?+0x5c>
    8260:      	mov	x0, #0x1                ; =1
    8264:      	b	0x827c <_stogir.floating.operation?+0x58>
    8268:      	mov	x0, #0x1                ; =1
    826c:      	ret
    8270:      	cmp	x0, #0x3b
    8274:      	cset	w0, eq
    8278:      	ubfx	x0, x0, #0, #8
    827c:      	b	0x826c <_stogir.floating.operation?+0x48>
    8280:      	cmp	x0, #0x3a
    8284:      	b.ne	0x8270 <_stogir.floating.operation?+0x4c>
    8288:      	mov	x0, #0x1                ; =1
    828c:      	b	0x827c <_stogir.floating.operation?+0x58>

0000000000008290 <_stogir.types.floating?>:
    8290:      	sxtw	x0, w0
    8294:      	cmp	x0, #0xc
    8298:      	b.ne	0x82a4 <_stogir.types.floating?+0x14>
    829c:      	mov	x0, #0x1                ; =1
    82a0:      	b	0x82b0 <_stogir.types.floating?+0x20>
    82a4:      	cmp	x0, #0xd
    82a8:      	cset	w0, eq
    82ac:      	ubfx	x0, x0, #0, #8
    82b0:      	ret

00000000000082b4 <_stogir.vector-lanes.validate>:
    82b4:      	sub	sp, sp, #0x50
    82b8:      	str	x29, [sp]
    82bc:      	str	x30, [sp, #0x8]
    82c0:      	mov	x29, sp
    82c4:      	str	x19, [sp, #0x40]
    82c8:      	sxtw	x1, w1
    82cc:      	lsl	x3, x1, #2
    82d0:      	cmp	x1, #0x0
    82d4:      	cset	w4, gt
    82d8:      	movz	x16, #0x0, lsl #48
    82dc:      	sub	x5, x16, x1
    82e0:      	sub	x6, x5, #0x1
    82e4:      	uxtb	w16, w4
    82e8:      	cmp	w16, wzr
    82ec:      	b.eq	0x832c <_stogir.vector-lanes.validate+0x78>
    82f0:      	ldr	x5, [x0, #0x8]
    82f4:      	cmp	x1, x5
    82f8:      	b.ge	0x8380 <_stogir.vector-lanes.validate+0xcc>
    82fc:      	add	x5, x0, #0x78
    8300:      	ldr	x5, [x5, #0x8]
    8304:      	cmp	x1, x5
    8308:      	b.ge	0x84a4 <_stogir.vector-lanes.validate+0x1f0>
    830c:      	ldr	x5, [x0, #0x78]
    8310:      	add	x5, x3, x5
    8314:      	ldr	w5, [x5]
    8318:      	sxtw	x5, w5
    831c:      	cmp	x5, #0x0
    8320:      	cset	w5, ge
    8324:      	ubfx	x5, x5, #0, #8
    8328:      	b	0x84a8 <_stogir.vector-lanes.validate+0x1f4>
    832c:      	cmp	x1, #0x0
    8330:      	b.ge	0x8388 <_stogir.vector-lanes.validate+0xd4>
    8334:      	add	x7, x0, #0x28
    8338:      	add	x9, x0, #0x50
    833c:      	ldr	x7, [x7, #0x8]
    8340:      	ldr	x9, [x9, #0x8]
    8344:      	cmp	x7, x9
    8348:      	b.ne	0x8378 <_stogir.vector-lanes.validate+0xc4>
    834c:      	cmp	x5, x7
    8350:      	b.gt	0x84e8 <_stogir.vector-lanes.validate+0x234>
    8354:      	lsl	x5, x6, #2
    8358:      	ldr	x7, [x0, #0x50]
    835c:      	add	x5, x5, x7
    8360:      	ldr	w5, [x5]
    8364:      	sxtw	x5, w5
    8368:      	cmp	x5, #0x0
    836c:      	cset	w5, gt
    8370:      	ubfx	x5, x5, #0, #8
    8374:      	b	0x84ec <_stogir.vector-lanes.validate+0x238>
    8378:      	movz	x5, #0x0, lsl #48
    837c:      	b	0x838c <_stogir.vector-lanes.validate+0xd8>
    8380:      	movz	x5, #0x0, lsl #48
    8384:      	b	0x838c <_stogir.vector-lanes.validate+0xd8>
    8388:      	movz	x5, #0x0, lsl #48
    838c:      	cmp	x5, #0x0
    8390:      	b.eq	0x83f4 <_stogir.vector-lanes.validate+0x140>
    8394:      	uxtb	w16, w4
    8398:      	cmp	w16, wzr
    839c:      	b.eq	0x83c4 <_stogir.vector-lanes.validate+0x110>
    83a0:      	lsl	x4, x1, #4
    83a4:      	ldr	x5, [x0]
    83a8:      	add	x4, x4, x5
    83ac:      	ldr	x5, [x4]
    83b0:      	ldr	x4, [x4, #0x8]
    83b4:      	fmov	d31, x4
    83b8:      	mov	x4, x5
    83bc:      	fmov	x5, d31
    83c0:      	b	0x83e4 <_stogir.vector-lanes.validate+0x130>
    83c4:      	lsl	x4, x6, #4
    83c8:      	ldr	x5, [x0, #0x28]
    83cc:      	add	x4, x4, x5
    83d0:      	ldr	x5, [x4]
    83d4:      	ldr	x4, [x4, #0x8]
    83d8:      	fmov	d31, x4
    83dc:      	mov	x4, x5
    83e0:      	fmov	x5, d31
    83e4:      	mov	x6, x5
    83e8:      	mov	x5, x4
    83ec:      	mov	x4, #0x1                ; =1
    83f0:      	b	0x8400 <_stogir.vector-lanes.validate+0x14c>
    83f4:      	movz	x4, #0x0, lsl #48
    83f8:      	movz	x5, #0x0, lsl #48
    83fc:      	movz	x6, #0x0, lsl #48
    8400:      	lsr	w4, w4, #0
    8404:      	lsr	x16, x4, #0
    8408:      	cmp	x16, #0x1
    840c:      	b.eq	0x8428 <_stogir.vector-lanes.validate+0x174>
    8410:      	b.lo	0x8418 <_stogir.vector-lanes.validate+0x164>
    8414:      	b	0x842c <_stogir.vector-lanes.validate+0x178>
    8418:      	cmp	x16, #0x0
    841c:      	b.eq	0x8424 <_stogir.vector-lanes.validate+0x170>
    8420:      	b	0x842c <_stogir.vector-lanes.validate+0x178>
    8424:      	b	0x8430 <_stogir.vector-lanes.validate+0x17c>
    8428:      	b	0x8450 <_stogir.vector-lanes.validate+0x19c>
    842c:      	b	0x85cc <_stogir.vector-lanes.validate+0x318>
    8430:      	adrp	x16, 0x8000 <_stogir.integer-binary.valid-type?+0x98>
		0000000000008430:  ARM64_RELOC_PAGE21	l_stogir.404
    8434:      	ldr	x16, [x16]
		0000000000008434:  ARM64_RELOC_PAGEOFF12	l_stogir.404
    8438:      	orr	x0, x16, xzr
    843c:      	mov	x19, x8
    8440:      	mov	x1, x0
    8444:      	mov	x0, #0x1                ; =1
    8448:      	mov	x2, #0x1f               ; =31
    844c:      	b	0x8484 <_stogir.vector-lanes.validate+0x1d0>
    8450:      	add	x16, sp, #0x10
    8454:      	str	x5, [x16]
    8458:      	add	x16, sp, #0x10
    845c:      	str	x6, [x16, #0x8]
    8460:      	cmp	x1, #0x0
    8464:      	b.gt	0x84ac <_stogir.vector-lanes.validate+0x1f8>
    8468:      	mov	x19, x8
    846c:      	adrp	x16, 0x8000 <_stogir.integer-binary.valid-type?+0x98>
		000000000000846c:  ARM64_RELOC_PAGE21	l_stogir.405
    8470:      	ldr	x16, [x16]
		0000000000008470:  ARM64_RELOC_PAGEOFF12	l_stogir.405
    8474:      	orr	x0, x16, xzr
    8478:      	mov	x1, x0
    847c:      	mov	x0, #0x1                ; =1
    8480:      	mov	x2, #0x25               ; =37
    8484:      	str	x0, [x19]
    8488:      	str	x1, [x19, #0x8]
    848c:      	str	x2, [x19, #0x10]
    8490:      	ldr	x19, [sp, #0x40]
    8494:      	ldr	x29, [sp]
    8498:      	ldr	x30, [sp, #0x8]
    849c:      	add	sp, sp, #0x50
    84a0:      	ret
    84a4:      	movz	x5, #0x0, lsl #48
    84a8:      	b	0x8384 <_stogir.vector-lanes.validate+0xd0>
    84ac:      	uxtb	w5, w5
    84b0:      	orr	x1, x5, xzr
    84b4:      	cmp	x1, #0x3d
    84b8:      	b.lt	0x85d4 <_stogir.vector-lanes.validate+0x320>
    84bc:      	cmp	x1, #0x3f
    84c0:      	b.gt	0x85dc <_stogir.vector-lanes.validate+0x328>
    84c4:      	cmp	x1, #0x3e
    84c8:      	cset	w4, eq
    84cc:      	ldr	x6, [x0, #0x78]
    84d0:      	add	x3, x3, x6
    84d4:      	ldr	w3, [x3]
    84d8:      	cmp	x1, #0x3d
    84dc:      	b.ne	0x855c <_stogir.vector-lanes.validate+0x2a8>
    84e0:      	mov	x6, #0x2                ; =2
    84e4:      	b	0x8570 <_stogir.vector-lanes.validate+0x2bc>
    84e8:      	movz	x5, #0x0, lsl #48
    84ec:      	b	0x837c <_stogir.vector-lanes.validate+0xc8>
    84f0:      	movz	x4, #0x0, lsl #48
    84f4:      	lsr	w2, w2, #0
    84f8:      	lsr	w6, w6, #0
    84fc:      	lsr	w1, w1, #0
    8500:      	lsr	w5, w5, #0
    8504:      	lsr	w4, w4, #0
    8508:      	ubfx	x3, x3, #8, #8
    850c:      	lsr	w3, w3, #0
    8510:      	mov	x19, x8
    8514:      	add	x8, sp, #0x20
    8518:      	fmov	s31, w1
    851c:      	mov	w1, w5
    8520:      	fmov	w5, s31
    8524:      	fmov	s31, w2
    8528:      	mov	w2, w3
    852c:      	fmov	w3, s31
    8530:      	fmov	s31, w4
    8534:      	mov	w4, w6
    8538:      	fmov	w6, s31
    853c:      	bl	0x853c <_stogir.vector-lanes.validate+0x288>
		000000000000853c:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operands
    8540:      	add	x16, sp, #0x20
    8544:      	ldr	x0, [x16]
    8548:      	add	x16, sp, #0x20
    854c:      	ldr	x1, [x16, #0x8]
    8550:      	add	x16, sp, #0x20
    8554:      	ldr	x2, [x16, #0x10]
    8558:      	b	0x8484 <_stogir.vector-lanes.validate+0x1d0>
    855c:      	uxtb	w16, w4
    8560:      	cmp	w16, wzr
    8564:      	mov	x16, #0x3               ; =3
    8568:      	mov	x17, #0x1               ; =1
    856c:      	csel	x6, x16, x17, ne
    8570:      	sxtw	x3, w3
    8574:      	lsr	w6, w6, #0
    8578:      	sxtw	x6, w6
    857c:      	cmp	x3, x6
    8580:      	b.ne	0x85e4 <_stogir.vector-lanes.validate+0x330>
    8584:      	add	x16, sp, #0x10
    8588:      	ldr	w3, [x16]
    858c:      	add	x16, sp, #0x10
    8590:      	ldr	w6, [x16, #0x4]
    8594:      	cmp	x1, #0x3f
    8598:      	b.ne	0x85a4 <_stogir.vector-lanes.validate+0x2f0>
    859c:      	movz	x1, #0x0, lsl #48
    85a0:      	b	0x85b0 <_stogir.vector-lanes.validate+0x2fc>
    85a4:      	add	x16, sp, #0x10
    85a8:      	ldr	w1, [x16, #0x8]
    85ac:      	sxtw	x1, w1
    85b0:      	uxtb	w16, w4
    85b4:      	cmp	w16, wzr
    85b8:      	b.eq	0x84f0 <_stogir.vector-lanes.validate+0x23c>
    85bc:      	add	x16, sp, #0x10
    85c0:      	ldr	w4, [x16, #0xc]
    85c4:      	sxtw	x4, w4
    85c8:      	b	0x84f4 <_stogir.vector-lanes.validate+0x240>
    85cc:      	brk	#0
    85d0:      	b	0x85cc <_stogir.vector-lanes.validate+0x318>
    85d4:      	mov	x19, x8
    85d8:      	b	0x846c <_stogir.vector-lanes.validate+0x1b8>
    85dc:      	mov	x19, x8
    85e0:      	b	0x846c <_stogir.vector-lanes.validate+0x1b8>
    85e4:      	mov	x19, x8
    85e8:      	b	0x846c <_stogir.vector-lanes.validate+0x1b8>

00000000000085ec <_stogir.vector-comparison.node?>:
    85ec:      	sxtw	x1, w1
    85f0:      	cmp	x1, #0x0
    85f4:      	cset	w2, gt
    85f8:      	movz	x16, #0x0, lsl #48
    85fc:      	sub	x3, x16, x1
    8600:      	sub	x4, x3, #0x1
    8604:      	uxtb	w16, w2
    8608:      	cmp	w16, wzr
    860c:      	b.eq	0x8650 <_stogir.vector-comparison.node?+0x64>
    8610:      	ldr	x3, [x0, #0x8]
    8614:      	cmp	x1, x3
    8618:      	b.ge	0x86a4 <_stogir.vector-comparison.node?+0xb8>
    861c:      	add	x3, x0, #0x78
    8620:      	ldr	x3, [x3, #0x8]
    8624:      	cmp	x1, x3
    8628:      	b.ge	0x878c <_stogir.vector-comparison.node?+0x1a0>
    862c:      	lsl	x3, x1, #2
    8630:      	ldr	x5, [x0, #0x78]
    8634:      	add	x3, x3, x5
    8638:      	ldr	w3, [x3]
    863c:      	sxtw	x3, w3
    8640:      	cmp	x3, #0x0
    8644:      	cset	w3, ge
    8648:      	ubfx	x3, x3, #0, #8
    864c:      	b	0x8790 <_stogir.vector-comparison.node?+0x1a4>
    8650:      	cmp	x1, #0x0
    8654:      	b.ge	0x86ac <_stogir.vector-comparison.node?+0xc0>
    8658:      	add	x5, x0, #0x28
    865c:      	add	x6, x0, #0x50
    8660:      	ldr	x5, [x5, #0x8]
    8664:      	ldr	x6, [x6, #0x8]
    8668:      	cmp	x5, x6
    866c:      	b.ne	0x869c <_stogir.vector-comparison.node?+0xb0>
    8670:      	cmp	x3, x5
    8674:      	b.gt	0x8794 <_stogir.vector-comparison.node?+0x1a8>
    8678:      	lsl	x3, x4, #2
    867c:      	ldr	x5, [x0, #0x50]
    8680:      	add	x3, x3, x5
    8684:      	ldr	w3, [x3]
    8688:      	sxtw	x3, w3
    868c:      	cmp	x3, #0x0
    8690:      	cset	w3, gt
    8694:      	ubfx	x3, x3, #0, #8
    8698:      	b	0x8798 <_stogir.vector-comparison.node?+0x1ac>
    869c:      	movz	x3, #0x0, lsl #48
    86a0:      	b	0x86b0 <_stogir.vector-comparison.node?+0xc4>
    86a4:      	movz	x3, #0x0, lsl #48
    86a8:      	b	0x86b0 <_stogir.vector-comparison.node?+0xc4>
    86ac:      	movz	x3, #0x0, lsl #48
    86b0:      	cmp	x3, #0x0
    86b4:      	b.eq	0x86f4 <_stogir.vector-comparison.node?+0x108>
    86b8:      	uxtb	w16, w2
    86bc:      	cmp	w16, wzr
    86c0:      	b.eq	0x86d8 <_stogir.vector-comparison.node?+0xec>
    86c4:      	lsl	x1, x1, #4
    86c8:      	ldr	x0, [x0]
    86cc:      	add	x0, x1, x0
    86d0:      	ldr	x0, [x0]
    86d4:      	b	0x86e8 <_stogir.vector-comparison.node?+0xfc>
    86d8:      	lsl	x1, x4, #4
    86dc:      	ldr	x0, [x0, #0x28]
    86e0:      	add	x0, x1, x0
    86e4:      	ldr	x0, [x0]
    86e8:      	mov	x1, x0
    86ec:      	mov	x0, #0x1                ; =1
    86f0:      	b	0x86fc <_stogir.vector-comparison.node?+0x110>
    86f4:      	movz	x0, #0x0, lsl #48
    86f8:      	movz	x1, #0x0, lsl #48
    86fc:      	lsr	w0, w0, #0
    8700:      	lsr	x16, x0, #0
    8704:      	cmp	x16, #0x1
    8708:      	b.eq	0x8724 <_stogir.vector-comparison.node?+0x138>
    870c:      	b.lo	0x8714 <_stogir.vector-comparison.node?+0x128>
    8710:      	b	0x8728 <_stogir.vector-comparison.node?+0x13c>
    8714:      	cmp	x16, #0x0
    8718:      	b.eq	0x8720 <_stogir.vector-comparison.node?+0x134>
    871c:      	b	0x8728 <_stogir.vector-comparison.node?+0x13c>
    8720:      	b	0x872c <_stogir.vector-comparison.node?+0x140>
    8724:      	b	0x873c <_stogir.vector-comparison.node?+0x150>
    8728:      	b	0x87b4 <_stogir.vector-comparison.node?+0x1c8>
    872c:      	movz	x0, #0x0, lsl #48
    8730:      	b	0x8738 <_stogir.vector-comparison.node?+0x14c>
    8734:      	movz	x0, #0x0, lsl #48
    8738:      	ret
    873c:      	uxtb	w0, w1
    8740:      	cmp	x0, #0xe
    8744:      	b.lt	0x8734 <_stogir.vector-comparison.node?+0x148>
    8748:      	cmp	x0, #0x19
    874c:      	b.gt	0x8734 <_stogir.vector-comparison.node?+0x148>
    8750:      	lsr	w1, w1, #0
    8754:      	ubfx	x0, x1, #8, #8
    8758:      	cmp	x0, #0xf
    875c:      	b.le	0x879c <_stogir.vector-comparison.node?+0x1b0>
    8760:      	cmp	x0, #0x80
    8764:      	b.ge	0x87a4 <_stogir.vector-comparison.node?+0x1b8>
    8768:      	and	x0, x0, #0xf
    876c:      	lsr	w0, w0, #0
    8770:      	sxtw	x0, w0
    8774:      	cmp	x0, #0x1
    8778:      	b.lt	0x87ac <_stogir.vector-comparison.node?+0x1c0>
    877c:      	cmp	x0, #0xd
    8780:      	cset	w0, le
    8784:      	ubfx	x0, x0, #0, #8
    8788:      	b	0x87b0 <_stogir.vector-comparison.node?+0x1c4>
    878c:      	movz	x3, #0x0, lsl #48
    8790:      	b	0x86a8 <_stogir.vector-comparison.node?+0xbc>
    8794:      	movz	x3, #0x0, lsl #48
    8798:      	b	0x86a0 <_stogir.vector-comparison.node?+0xb4>
    879c:      	movz	x0, #0x0, lsl #48
    87a0:      	b	0x8738 <_stogir.vector-comparison.node?+0x14c>
    87a4:      	movz	x0, #0x0, lsl #48
    87a8:      	b	0x87a0 <_stogir.vector-comparison.node?+0x1b4>
    87ac:      	movz	x0, #0x0, lsl #48
    87b0:      	b	0x87a8 <_stogir.vector-comparison.node?+0x1bc>
    87b4:      	brk	#0
    87b8:      	b	0x87b4 <_stogir.vector-comparison.node?+0x1c8>

00000000000087bc <_stogir.vector-comparison.validate>:
    87bc:      	sub	sp, sp, #0x50
    87c0:      	str	x29, [sp]
    87c4:      	str	x30, [sp, #0x8]
    87c8:      	mov	x29, sp
    87cc:      	str	x19, [sp, #0x40]
    87d0:      	sxtw	x1, w1
    87d4:      	lsl	x3, x1, #2
    87d8:      	cmp	x1, #0x0
    87dc:      	cset	w4, gt
    87e0:      	movz	x16, #0x0, lsl #48
    87e4:      	sub	x5, x16, x1
    87e8:      	cmp	x1, #0x0
    87ec:      	cset	w6, lt
    87f0:      	sub	x7, x5, #0x1
    87f4:      	lsl	x9, x7, #2
    87f8:      	uxtb	w16, w4
    87fc:      	cmp	w16, wzr
    8800:      	b.eq	0x8840 <_stogir.vector-comparison.validate+0x84>
    8804:      	ldr	x10, [x0, #0x8]
    8808:      	cmp	x1, x10
    880c:      	b.ge	0x8894 <_stogir.vector-comparison.validate+0xd8>
    8810:      	add	x10, x0, #0x78
    8814:      	ldr	x10, [x10, #0x8]
    8818:      	cmp	x1, x10
    881c:      	b.ge	0x89bc <_stogir.vector-comparison.validate+0x200>
    8820:      	ldr	x10, [x0, #0x78]
    8824:      	add	x10, x3, x10
    8828:      	ldr	w10, [x10]
    882c:      	sxtw	x10, w10
    8830:      	cmp	x10, #0x0
    8834:      	cset	w10, ge
    8838:      	ubfx	x10, x10, #0, #8
    883c:      	b	0x89c0 <_stogir.vector-comparison.validate+0x204>
    8840:      	uxtb	w16, w6
    8844:      	cmp	w16, wzr
    8848:      	b.eq	0x889c <_stogir.vector-comparison.validate+0xe0>
    884c:      	add	x10, x0, #0x28
    8850:      	add	x11, x0, #0x50
    8854:      	ldr	x10, [x10, #0x8]
    8858:      	ldr	x11, [x11, #0x8]
    885c:      	cmp	x10, x11
    8860:      	b.ne	0x888c <_stogir.vector-comparison.validate+0xd0>
    8864:      	cmp	x5, x10
    8868:      	b.gt	0x8a18 <_stogir.vector-comparison.validate+0x25c>
    886c:      	ldr	x10, [x0, #0x50]
    8870:      	add	x10, x9, x10
    8874:      	ldr	w10, [x10]
    8878:      	sxtw	x10, w10
    887c:      	cmp	x10, #0x0
    8880:      	cset	w10, gt
    8884:      	ubfx	x10, x10, #0, #8
    8888:      	b	0x8a1c <_stogir.vector-comparison.validate+0x260>
    888c:      	movz	x10, #0x0, lsl #48
    8890:      	b	0x88a0 <_stogir.vector-comparison.validate+0xe4>
    8894:      	movz	x10, #0x0, lsl #48
    8898:      	b	0x88a0 <_stogir.vector-comparison.validate+0xe4>
    889c:      	movz	x10, #0x0, lsl #48
    88a0:      	lsl	x11, x1, #4
    88a4:      	lsl	x7, x7, #4
    88a8:      	cmp	x10, #0x0
    88ac:      	b.eq	0x8908 <_stogir.vector-comparison.validate+0x14c>
    88b0:      	uxtb	w16, w4
    88b4:      	cmp	w16, wzr
    88b8:      	b.eq	0x88dc <_stogir.vector-comparison.validate+0x120>
    88bc:      	ldr	x10, [x0]
    88c0:      	add	x10, x11, x10
    88c4:      	ldr	x12, [x10]
    88c8:      	ldr	x10, [x10, #0x8]
    88cc:      	fmov	d31, x10
    88d0:      	mov	x10, x12
    88d4:      	fmov	x12, d31
    88d8:      	b	0x88f8 <_stogir.vector-comparison.validate+0x13c>
    88dc:      	ldr	x10, [x0, #0x28]
    88e0:      	add	x10, x7, x10
    88e4:      	ldr	x12, [x10]
    88e8:      	ldr	x10, [x10, #0x8]
    88ec:      	fmov	d31, x10
    88f0:      	mov	x10, x12
    88f4:      	fmov	x12, d31
    88f8:      	mov	x13, x12
    88fc:      	mov	x12, x10
    8900:      	mov	x10, #0x1               ; =1
    8904:      	b	0x8914 <_stogir.vector-comparison.validate+0x158>
    8908:      	movz	x10, #0x0, lsl #48
    890c:      	movz	x12, #0x0, lsl #48
    8910:      	movz	x13, #0x0, lsl #48
    8914:      	lsr	w10, w10, #0
    8918:      	lsr	x16, x10, #0
    891c:      	cmp	x16, #0x1
    8920:      	b.eq	0x893c <_stogir.vector-comparison.validate+0x180>
    8924:      	b.lo	0x892c <_stogir.vector-comparison.validate+0x170>
    8928:      	b	0x8940 <_stogir.vector-comparison.validate+0x184>
    892c:      	cmp	x16, #0x0
    8930:      	b.eq	0x8938 <_stogir.vector-comparison.validate+0x17c>
    8934:      	b	0x8940 <_stogir.vector-comparison.validate+0x184>
    8938:      	b	0x8944 <_stogir.vector-comparison.validate+0x188>
    893c:      	b	0x8984 <_stogir.vector-comparison.validate+0x1c8>
    8940:      	b	0x8c28 <_stogir.vector-comparison.validate+0x46c>
    8944:      	adrp	x16, 0x8000 <_stogir.integer-binary.valid-type?+0x98>
		0000000000008944:  ARM64_RELOC_PAGE21	l_stogir.406
    8948:      	ldr	x16, [x16]
		0000000000008948:  ARM64_RELOC_PAGEOFF12	l_stogir.406
    894c:      	orr	x0, x16, xzr
    8950:      	mov	x19, x8
    8954:      	mov	x1, x0
    8958:      	mov	x0, #0x1                ; =1
    895c:      	mov	x2, #0x25               ; =37
    8960:      	str	x0, [x19]
    8964:      	str	x1, [x19, #0x8]
    8968:      	str	x2, [x19, #0x10]
    896c:      	sub	sp, x29, #0x0
    8970:      	ldr	x19, [sp, #0x40]
    8974:      	ldr	x29, [sp]
    8978:      	ldr	x30, [sp, #0x8]
    897c:      	add	sp, sp, #0x50
    8980:      	ret
    8984:      	add	x16, x29, #0x10
    8988:      	str	x12, [x16]
    898c:      	add	x16, x29, #0x10
    8990:      	str	x13, [x16, #0x8]
    8994:      	cmp	x1, #0x0
    8998:      	b.gt	0x89c4 <_stogir.vector-comparison.validate+0x208>
    899c:      	mov	x19, x8
    89a0:      	adrp	x16, 0x8000 <_stogir.integer-binary.valid-type?+0x98>
		00000000000089a0:  ARM64_RELOC_PAGE21	l_stogir.407
    89a4:      	ldr	x16, [x16]
		00000000000089a4:  ARM64_RELOC_PAGEOFF12	l_stogir.407
    89a8:      	orr	x0, x16, xzr
    89ac:      	mov	x1, x0
    89b0:      	mov	x0, #0x1                ; =1
    89b4:      	mov	x2, #0x2b               ; =43
    89b8:      	b	0x8960 <_stogir.vector-comparison.validate+0x1a4>
    89bc:      	movz	x10, #0x0, lsl #48
    89c0:      	b	0x8898 <_stogir.vector-comparison.validate+0xdc>
    89c4:      	mov	x10, sp
    89c8:      	sub	sp, sp, #0x10
    89cc:      	mov	x12, sp
    89d0:      	uxtb	w16, w4
    89d4:      	cmp	w16, wzr
    89d8:      	b.eq	0x8a20 <_stogir.vector-comparison.validate+0x264>
    89dc:      	ldr	x5, [x0, #0x8]
    89e0:      	cmp	x1, x5
    89e4:      	b.ge	0x8a74 <_stogir.vector-comparison.validate+0x2b8>
    89e8:      	add	x5, x0, #0x78
    89ec:      	ldr	x5, [x5, #0x8]
    89f0:      	cmp	x1, x5
    89f4:      	b.ge	0x8c10 <_stogir.vector-comparison.validate+0x454>
    89f8:      	ldr	x1, [x0, #0x78]
    89fc:      	add	x1, x3, x1
    8a00:      	ldr	w1, [x1]
    8a04:      	sxtw	x1, w1
    8a08:      	cmp	x1, #0x0
    8a0c:      	cset	w1, ge
    8a10:      	ubfx	x1, x1, #0, #8
    8a14:      	b	0x8c14 <_stogir.vector-comparison.validate+0x458>
    8a18:      	movz	x10, #0x0, lsl #48
    8a1c:      	b	0x8890 <_stogir.vector-comparison.validate+0xd4>
    8a20:      	uxtb	w16, w6
    8a24:      	cmp	w16, wzr
    8a28:      	b.eq	0x8a7c <_stogir.vector-comparison.validate+0x2c0>
    8a2c:      	add	x1, x0, #0x28
    8a30:      	add	x6, x0, #0x50
    8a34:      	ldr	x1, [x1, #0x8]
    8a38:      	ldr	x6, [x6, #0x8]
    8a3c:      	cmp	x1, x6
    8a40:      	b.ne	0x8c08 <_stogir.vector-comparison.validate+0x44c>
    8a44:      	cmp	x5, x1
    8a48:      	b.gt	0x8c18 <_stogir.vector-comparison.validate+0x45c>
    8a4c:      	ldr	x1, [x0, #0x50]
    8a50:      	add	x1, x9, x1
    8a54:      	ldr	w1, [x1]
    8a58:      	sxtw	x1, w1
    8a5c:      	cmp	x1, #0x0
    8a60:      	cset	w1, gt
    8a64:      	ubfx	x1, x1, #0, #8
    8a68:      	b	0x8c1c <_stogir.vector-comparison.validate+0x460>
    8a6c:      	movz	x1, #0x0, lsl #48
    8a70:      	b	0x8b20 <_stogir.vector-comparison.validate+0x364>
    8a74:      	movz	x1, #0x0, lsl #48
    8a78:      	b	0x8a80 <_stogir.vector-comparison.validate+0x2c4>
    8a7c:      	movz	x1, #0x0, lsl #48
    8a80:      	cmp	x1, #0x0
    8a84:      	b.eq	0x8ae0 <_stogir.vector-comparison.validate+0x324>
    8a88:      	uxtb	w16, w4
    8a8c:      	cmp	w16, wzr
    8a90:      	b.eq	0x8ab4 <_stogir.vector-comparison.validate+0x2f8>
    8a94:      	ldr	x1, [x0]
    8a98:      	add	x1, x11, x1
    8a9c:      	ldr	x4, [x1]
    8aa0:      	ldr	x1, [x1, #0x8]
    8aa4:      	fmov	d31, x1
    8aa8:      	mov	x1, x4
    8aac:      	fmov	x4, d31
    8ab0:      	b	0x8ad0 <_stogir.vector-comparison.validate+0x314>
    8ab4:      	ldr	x1, [x0, #0x28]
    8ab8:      	add	x1, x7, x1
    8abc:      	ldr	x4, [x1]
    8ac0:      	ldr	x1, [x1, #0x8]
    8ac4:      	fmov	d31, x1
    8ac8:      	mov	x1, x4
    8acc:      	fmov	x4, d31
    8ad0:      	mov	x5, x4
    8ad4:      	mov	x4, x1
    8ad8:      	mov	x1, #0x1                ; =1
    8adc:      	b	0x8aec <_stogir.vector-comparison.validate+0x330>
    8ae0:      	movz	x1, #0x0, lsl #48
    8ae4:      	movz	x4, #0x0, lsl #48
    8ae8:      	movz	x5, #0x0, lsl #48
    8aec:      	lsr	w1, w1, #0
    8af0:      	lsr	x16, x1, #0
    8af4:      	cmp	x16, #0x1
    8af8:      	b.eq	0x8b14 <_stogir.vector-comparison.validate+0x358>
    8afc:      	b.lo	0x8b04 <_stogir.vector-comparison.validate+0x348>
    8b00:      	b	0x8b18 <_stogir.vector-comparison.validate+0x35c>
    8b04:      	cmp	x16, #0x0
    8b08:      	b.eq	0x8b10 <_stogir.vector-comparison.validate+0x354>
    8b0c:      	b	0x8b18 <_stogir.vector-comparison.validate+0x35c>
    8b10:      	b	0x8b1c <_stogir.vector-comparison.validate+0x360>
    8b14:      	b	0x8bb0 <_stogir.vector-comparison.validate+0x3f4>
    8b18:      	b	0x8c40 <_stogir.vector-comparison.validate+0x484>
    8b1c:      	movz	x1, #0x0, lsl #48
    8b20:      	mov	sp, x10
    8b24:      	cmp	x1, #0x0
    8b28:      	b.eq	0x8c48 <_stogir.vector-comparison.validate+0x48c>
    8b2c:      	ldr	x1, [x0, #0x78]
    8b30:      	add	x1, x3, x1
    8b34:      	ldr	w1, [x1]
    8b38:      	sxtw	x1, w1
    8b3c:      	cmp	x1, #0x2
    8b40:      	b.ne	0x8c50 <_stogir.vector-comparison.validate+0x494>
    8b44:      	lsr	w2, w2, #0
    8b48:      	add	x16, x29, #0x10
    8b4c:      	ldr	w1, [x16]
    8b50:      	uxtb	w3, w1
    8b54:      	add	x16, x29, #0x10
    8b58:      	ldr	w4, [x16, #0x4]
    8b5c:      	lsr	w3, w3, #0
    8b60:      	ubfx	x1, x1, #8, #8
    8b64:      	add	x16, x29, #0x10
    8b68:      	ldr	w5, [x16, #0x8]
    8b6c:      	lsr	w4, w4, #0
    8b70:      	lsr	w5, w5, #0
    8b74:      	lsr	w1, w1, #0
    8b78:      	mov	x19, x8
    8b7c:      	add	x8, x29, #0x20
    8b80:      	fmov	s31, w1
    8b84:      	mov	w1, w3
    8b88:      	mov	w3, w2
    8b8c:      	fmov	w2, s31
    8b90:      	bl	0x8b90 <_stogir.vector-comparison.validate+0x3d4>
		0000000000008b90:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.operands
    8b94:      	add	x16, x29, #0x20
    8b98:      	ldr	x0, [x16]
    8b9c:      	add	x16, x29, #0x20
    8ba0:      	ldr	x1, [x16, #0x8]
    8ba4:      	add	x16, x29, #0x20
    8ba8:      	ldr	x2, [x16, #0x10]
    8bac:      	b	0x89b8 <_stogir.vector-comparison.validate+0x1fc>
    8bb0:      	uxtb	w1, w4
    8bb4:      	str	x4, [x12]
    8bb8:      	str	x5, [x12, #0x8]
    8bbc:      	cmp	x1, #0xe
    8bc0:      	b.lt	0x8a6c <_stogir.vector-comparison.validate+0x2b0>
    8bc4:      	cmp	x1, #0x19
    8bc8:      	b.gt	0x8a6c <_stogir.vector-comparison.validate+0x2b0>
    8bcc:      	lsr	w4, w4, #0
    8bd0:      	ubfx	x1, x4, #8, #8
    8bd4:      	cmp	x1, #0xf
    8bd8:      	b.le	0x8c20 <_stogir.vector-comparison.validate+0x464>
    8bdc:      	cmp	x1, #0x80
    8be0:      	b.ge	0x8c30 <_stogir.vector-comparison.validate+0x474>
    8be4:      	and	x1, x1, #0xf
    8be8:      	lsr	w1, w1, #0
    8bec:      	sxtw	x1, w1
    8bf0:      	cmp	x1, #0x1
    8bf4:      	b.lt	0x8c38 <_stogir.vector-comparison.validate+0x47c>
    8bf8:      	cmp	x1, #0xd
    8bfc:      	cset	w1, le
    8c00:      	ubfx	x1, x1, #0, #8
    8c04:      	b	0x8c3c <_stogir.vector-comparison.validate+0x480>
    8c08:      	movz	x1, #0x0, lsl #48
    8c0c:      	b	0x8a80 <_stogir.vector-comparison.validate+0x2c4>
    8c10:      	movz	x1, #0x0, lsl #48
    8c14:      	b	0x8a78 <_stogir.vector-comparison.validate+0x2bc>
    8c18:      	movz	x1, #0x0, lsl #48
    8c1c:      	b	0x8c0c <_stogir.vector-comparison.validate+0x450>
    8c20:      	movz	x1, #0x0, lsl #48
    8c24:      	b	0x8a70 <_stogir.vector-comparison.validate+0x2b4>
    8c28:      	brk	#0
    8c2c:      	b	0x8c28 <_stogir.vector-comparison.validate+0x46c>
    8c30:      	movz	x1, #0x0, lsl #48
    8c34:      	b	0x8c24 <_stogir.vector-comparison.validate+0x468>
    8c38:      	movz	x1, #0x0, lsl #48
    8c3c:      	b	0x8c34 <_stogir.vector-comparison.validate+0x478>
    8c40:      	brk	#0
    8c44:      	b	0x8c40 <_stogir.vector-comparison.validate+0x484>
    8c48:      	mov	x19, x8
    8c4c:      	b	0x89a0 <_stogir.vector-comparison.validate+0x1e4>
    8c50:      	mov	x19, x8
    8c54:      	b	0x89a0 <_stogir.vector-comparison.validate+0x1e4>

0000000000008c58 <_stogir.vector-arithmetic.node?>:
    8c58:      	sub	sp, sp, #0x10
    8c5c:      	sxtw	x1, w1
    8c60:      	cmp	x1, #0x0
    8c64:      	cset	w2, gt
    8c68:      	movz	x16, #0x0, lsl #48
    8c6c:      	sub	x3, x16, x1
    8c70:      	sub	x4, x3, #0x1
    8c74:      	uxtb	w16, w2
    8c78:      	cmp	w16, wzr
    8c7c:      	b.eq	0x8cc0 <_stogir.vector-arithmetic.node?+0x68>
    8c80:      	ldr	x3, [x0, #0x8]
    8c84:      	cmp	x1, x3
    8c88:      	b.ge	0x8d14 <_stogir.vector-arithmetic.node?+0xbc>
    8c8c:      	add	x3, x0, #0x78
    8c90:      	ldr	x3, [x3, #0x8]
    8c94:      	cmp	x1, x3
    8c98:      	b.ge	0x8e84 <_stogir.vector-arithmetic.node?+0x22c>
    8c9c:      	lsl	x3, x1, #2
    8ca0:      	ldr	x5, [x0, #0x78]
    8ca4:      	add	x3, x3, x5
    8ca8:      	ldr	w3, [x3]
    8cac:      	sxtw	x3, w3
    8cb0:      	cmp	x3, #0x0
    8cb4:      	cset	w3, ge
    8cb8:      	ubfx	x3, x3, #0, #8
    8cbc:      	b	0x8e88 <_stogir.vector-arithmetic.node?+0x230>
    8cc0:      	cmp	x1, #0x0
    8cc4:      	b.ge	0x8d1c <_stogir.vector-arithmetic.node?+0xc4>
    8cc8:      	add	x5, x0, #0x28
    8ccc:      	add	x6, x0, #0x50
    8cd0:      	ldr	x5, [x5, #0x8]
    8cd4:      	ldr	x6, [x6, #0x8]
    8cd8:      	cmp	x5, x6
    8cdc:      	b.ne	0x8d0c <_stogir.vector-arithmetic.node?+0xb4>
    8ce0:      	cmp	x3, x5
    8ce4:      	b.gt	0x8e94 <_stogir.vector-arithmetic.node?+0x23c>
    8ce8:      	lsl	x3, x4, #2
    8cec:      	ldr	x5, [x0, #0x50]
    8cf0:      	add	x3, x3, x5
    8cf4:      	ldr	w3, [x3]
    8cf8:      	sxtw	x3, w3
    8cfc:      	cmp	x3, #0x0
    8d00:      	cset	w3, gt
    8d04:      	ubfx	x3, x3, #0, #8
    8d08:      	b	0x8e98 <_stogir.vector-arithmetic.node?+0x240>
    8d0c:      	movz	x3, #0x0, lsl #48
    8d10:      	b	0x8d20 <_stogir.vector-arithmetic.node?+0xc8>
    8d14:      	movz	x3, #0x0, lsl #48
    8d18:      	b	0x8d20 <_stogir.vector-arithmetic.node?+0xc8>
    8d1c:      	movz	x3, #0x0, lsl #48
    8d20:      	cmp	x3, #0x0
    8d24:      	b.eq	0x8d88 <_stogir.vector-arithmetic.node?+0x130>
    8d28:      	uxtb	w16, w2
    8d2c:      	cmp	w16, wzr
    8d30:      	b.eq	0x8d58 <_stogir.vector-arithmetic.node?+0x100>
    8d34:      	lsl	x1, x1, #4
    8d38:      	ldr	x0, [x0]
    8d3c:      	add	x0, x1, x0
    8d40:      	ldr	x1, [x0]
    8d44:      	ldr	x0, [x0, #0x8]
    8d48:      	fmov	d31, x0
    8d4c:      	mov	x0, x1
    8d50:      	fmov	x1, d31
    8d54:      	b	0x8d78 <_stogir.vector-arithmetic.node?+0x120>
    8d58:      	lsl	x1, x4, #4
    8d5c:      	ldr	x0, [x0, #0x28]
    8d60:      	add	x0, x1, x0
    8d64:      	ldr	x1, [x0]
    8d68:      	ldr	x0, [x0, #0x8]
    8d6c:      	fmov	d31, x0
    8d70:      	mov	x0, x1
    8d74:      	fmov	x1, d31
    8d78:      	mov	x2, x1
    8d7c:      	mov	x1, x0
    8d80:      	mov	x0, #0x1                ; =1
    8d84:      	b	0x8d94 <_stogir.vector-arithmetic.node?+0x13c>
    8d88:      	movz	x0, #0x0, lsl #48
    8d8c:      	movz	x1, #0x0, lsl #48
    8d90:      	movz	x2, #0x0, lsl #48
    8d94:      	lsr	w0, w0, #0
    8d98:      	lsr	x16, x0, #0
    8d9c:      	cmp	x16, #0x1
    8da0:      	b.eq	0x8dbc <_stogir.vector-arithmetic.node?+0x164>
    8da4:      	b.lo	0x8dac <_stogir.vector-arithmetic.node?+0x154>
    8da8:      	b	0x8dc0 <_stogir.vector-arithmetic.node?+0x168>
    8dac:      	cmp	x16, #0x0
    8db0:      	b.eq	0x8db8 <_stogir.vector-arithmetic.node?+0x160>
    8db4:      	b	0x8dc0 <_stogir.vector-arithmetic.node?+0x168>
    8db8:      	b	0x8dc4 <_stogir.vector-arithmetic.node?+0x16c>
    8dbc:      	b	0x8dd8 <_stogir.vector-arithmetic.node?+0x180>
    8dc0:      	b	0x8ea4 <_stogir.vector-arithmetic.node?+0x24c>
    8dc4:      	movz	x0, #0x0, lsl #48
    8dc8:      	b	0x8dd0 <_stogir.vector-arithmetic.node?+0x178>
    8dcc:      	movz	x0, #0x0, lsl #48
    8dd0:      	add	sp, sp, #0x10
    8dd4:      	ret
    8dd8:      	uxtb	w0, w1
    8ddc:      	mov	x16, sp
    8de0:      	str	x1, [x16]
    8de4:      	mov	x16, sp
    8de8:      	str	x2, [x16, #0x8]
    8dec:      	cmp	x0, #0x1f
    8df0:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8df4:      	cmp	x0, #0x20
    8df8:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8dfc:      	cmp	x0, #0x2d
    8e00:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8e04:      	cmp	x0, #0x36
    8e08:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8e0c:      	cmp	x0, #0x37
    8e10:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8e14:      	cmp	x0, #0x38
    8e18:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8e1c:      	cmp	x0, #0x39
    8e20:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8e24:      	cmp	x0, #0x3a
    8e28:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8e2c:      	cmp	x0, #0x3b
    8e30:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8e34:      	cmp	x0, #0x31
    8e38:      	b.lt	0x8eac <_stogir.vector-arithmetic.node?+0x254>
    8e3c:      	cmp	x0, #0x35
    8e40:      	b.gt	0x8eac <_stogir.vector-arithmetic.node?+0x254>
    8e44:      	mov	x16, sp
    8e48:      	ldr	w0, [x16]
    8e4c:      	ubfx	x0, x0, #8, #8
    8e50:      	cmp	x0, #0xf
    8e54:      	b.le	0x8dcc <_stogir.vector-arithmetic.node?+0x174>
    8e58:      	cmp	x0, #0x80
    8e5c:      	b.ge	0x8e8c <_stogir.vector-arithmetic.node?+0x234>
    8e60:      	and	x0, x0, #0xf
    8e64:      	lsr	w0, w0, #0
    8e68:      	sxtw	x0, w0
    8e6c:      	cmp	x0, #0x1
    8e70:      	b.lt	0x8e9c <_stogir.vector-arithmetic.node?+0x244>
    8e74:      	cmp	x0, #0xd
    8e78:      	cset	w0, le
    8e7c:      	ubfx	x0, x0, #0, #8
    8e80:      	b	0x8ea0 <_stogir.vector-arithmetic.node?+0x248>
    8e84:      	movz	x3, #0x0, lsl #48
    8e88:      	b	0x8d18 <_stogir.vector-arithmetic.node?+0xc0>
    8e8c:      	movz	x0, #0x0, lsl #48
    8e90:      	b	0x8dd0 <_stogir.vector-arithmetic.node?+0x178>
    8e94:      	movz	x3, #0x0, lsl #48
    8e98:      	b	0x8d10 <_stogir.vector-arithmetic.node?+0xb8>
    8e9c:      	movz	x0, #0x0, lsl #48
    8ea0:      	b	0x8e90 <_stogir.vector-arithmetic.node?+0x238>
    8ea4:      	brk	#0
    8ea8:      	b	0x8ea4 <_stogir.vector-arithmetic.node?+0x24c>
    8eac:      	cmp	x0, #0x1a
    8eb0:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8eb4:      	cmp	x0, #0x1b
    8eb8:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8ebc:      	cmp	x0, #0x1c
    8ec0:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8ec4:      	cmp	x0, #0x1d
    8ec8:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8ecc:      	cmp	x0, #0x1e
    8ed0:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8ed4:      	cmp	x0, #0x2e
    8ed8:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8edc:      	cmp	x0, #0x2f
    8ee0:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8ee4:      	cmp	x0, #0x30
    8ee8:      	b.eq	0x8e44 <_stogir.vector-arithmetic.node?+0x1ec>
    8eec:      	movz	x0, #0x0, lsl #48
    8ef0:      	b	0x8dd0 <_stogir.vector-arithmetic.node?+0x178>

0000000000008ef4 <_stogir.vector-arithmetic.validate>:
    8ef4:      	sub	sp, sp, #0x60
    8ef8:      	str	x29, [sp]
    8efc:      	str	x30, [sp, #0x8]
    8f00:      	mov	x29, sp
    8f04:      	str	x19, [sp, #0x40]
    8f08:      	str	x20, [sp, #0x48]
    8f0c:      	str	x21, [sp, #0x50]
    8f10:      	str	x22, [sp, #0x58]
    8f14:      	sxtw	x2, w1
    8f18:      	lsl	x19, x2, #2
    8f1c:      	cmp	x2, #0x0
    8f20:      	cset	w3, gt
    8f24:      	movz	x16, #0x0, lsl #48
    8f28:      	sub	x4, x16, x2
    8f2c:      	sub	x5, x4, #0x1
    8f30:      	uxtb	w16, w3
    8f34:      	cmp	w16, wzr
    8f38:      	b.eq	0x8f78 <_stogir.vector-arithmetic.validate+0x84>
    8f3c:      	ldr	x4, [x0, #0x8]
    8f40:      	cmp	x2, x4
    8f44:      	b.ge	0x8fcc <_stogir.vector-arithmetic.validate+0xd8>
    8f48:      	add	x4, x0, #0x78
    8f4c:      	ldr	x4, [x4, #0x8]
    8f50:      	cmp	x2, x4
    8f54:      	b.ge	0x90f8 <_stogir.vector-arithmetic.validate+0x204>
    8f58:      	ldr	x4, [x0, #0x78]
    8f5c:      	add	x4, x19, x4
    8f60:      	ldr	w4, [x4]
    8f64:      	sxtw	x4, w4
    8f68:      	cmp	x4, #0x0
    8f6c:      	cset	w4, ge
    8f70:      	ubfx	x4, x4, #0, #8
    8f74:      	b	0x90fc <_stogir.vector-arithmetic.validate+0x208>
    8f78:      	cmp	x2, #0x0
    8f7c:      	b.ge	0x8fd4 <_stogir.vector-arithmetic.validate+0xe0>
    8f80:      	add	x6, x0, #0x28
    8f84:      	add	x7, x0, #0x50
    8f88:      	ldr	x6, [x6, #0x8]
    8f8c:      	ldr	x7, [x7, #0x8]
    8f90:      	cmp	x6, x7
    8f94:      	b.ne	0x8fc4 <_stogir.vector-arithmetic.validate+0xd0>
    8f98:      	cmp	x4, x6
    8f9c:      	b.gt	0x9194 <_stogir.vector-arithmetic.validate+0x2a0>
    8fa0:      	lsl	x4, x5, #2
    8fa4:      	ldr	x6, [x0, #0x50]
    8fa8:      	add	x4, x4, x6
    8fac:      	ldr	w4, [x4]
    8fb0:      	sxtw	x4, w4
    8fb4:      	cmp	x4, #0x0
    8fb8:      	cset	w4, gt
    8fbc:      	ubfx	x4, x4, #0, #8
    8fc0:      	b	0x9198 <_stogir.vector-arithmetic.validate+0x2a4>
    8fc4:      	movz	x4, #0x0, lsl #48
    8fc8:      	b	0x8fd8 <_stogir.vector-arithmetic.validate+0xe4>
    8fcc:      	movz	x4, #0x0, lsl #48
    8fd0:      	b	0x8fd8 <_stogir.vector-arithmetic.validate+0xe4>
    8fd4:      	movz	x4, #0x0, lsl #48
    8fd8:      	cmp	x4, #0x0
    8fdc:      	b.eq	0x903c <_stogir.vector-arithmetic.validate+0x148>
    8fe0:      	uxtb	w16, w3
    8fe4:      	cmp	w16, wzr
    8fe8:      	b.eq	0x9010 <_stogir.vector-arithmetic.validate+0x11c>
    8fec:      	lsl	x3, x2, #4
    8ff0:      	ldr	x4, [x0]
    8ff4:      	add	x3, x3, x4
    8ff8:      	ldr	x4, [x3]
    8ffc:      	ldr	x3, [x3, #0x8]
    9000:      	fmov	d31, x3
    9004:      	mov	x3, x4
    9008:      	fmov	x4, d31
    900c:      	b	0x9030 <_stogir.vector-arithmetic.validate+0x13c>
    9010:      	lsl	x3, x5, #4
    9014:      	ldr	x4, [x0, #0x28]
    9018:      	add	x3, x3, x4
    901c:      	ldr	x4, [x3]
    9020:      	ldr	x3, [x3, #0x8]
    9024:      	fmov	d31, x3
    9028:      	mov	x3, x4
    902c:      	fmov	x4, d31
    9030:      	mov	x20, x3
    9034:      	mov	x3, #0x1                ; =1
    9038:      	b	0x9048 <_stogir.vector-arithmetic.validate+0x154>
    903c:      	movz	x3, #0x0, lsl #48
    9040:      	movz	x20, #0x0, lsl #48
    9044:      	movz	x4, #0x0, lsl #48
    9048:      	lsr	w3, w3, #0
    904c:      	lsr	x16, x3, #0
    9050:      	cmp	x16, #0x1
    9054:      	b.eq	0x9070 <_stogir.vector-arithmetic.validate+0x17c>
    9058:      	b.lo	0x9060 <_stogir.vector-arithmetic.validate+0x16c>
    905c:      	b	0x9074 <_stogir.vector-arithmetic.validate+0x180>
    9060:      	cmp	x16, #0x0
    9064:      	b.eq	0x906c <_stogir.vector-arithmetic.validate+0x178>
    9068:      	b	0x9074 <_stogir.vector-arithmetic.validate+0x180>
    906c:      	b	0x9078 <_stogir.vector-arithmetic.validate+0x184>
    9070:      	b	0x9098 <_stogir.vector-arithmetic.validate+0x1a4>
    9074:      	b	0x9248 <_stogir.vector-arithmetic.validate+0x354>
    9078:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		0000000000009078:  ARM64_RELOC_PAGE21	l_stogir.408
    907c:      	ldr	x16, [x16]
		000000000000907c:  ARM64_RELOC_PAGEOFF12	l_stogir.408
    9080:      	orr	x0, x16, xzr
    9084:      	mov	x21, x8
    9088:      	mov	x1, x0
    908c:      	mov	x0, #0x1                ; =1
    9090:      	mov	x2, #0x25               ; =37
    9094:      	b	0x90cc <_stogir.vector-arithmetic.validate+0x1d8>
    9098:      	add	x16, sp, #0x10
    909c:      	str	x20, [x16]
    90a0:      	add	x16, sp, #0x10
    90a4:      	str	x4, [x16, #0x8]
    90a8:      	cmp	x2, #0x0
    90ac:      	b.gt	0x9100 <_stogir.vector-arithmetic.validate+0x20c>
    90b0:      	mov	x21, x8
    90b4:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		00000000000090b4:  ARM64_RELOC_PAGE21	l_stogir.409
    90b8:      	ldr	x16, [x16]
		00000000000090b8:  ARM64_RELOC_PAGEOFF12	l_stogir.409
    90bc:      	orr	x0, x16, xzr
    90c0:      	mov	x1, x0
    90c4:      	mov	x0, #0x1                ; =1
    90c8:      	mov	x2, #0x2b               ; =43
    90cc:      	str	x0, [x21]
    90d0:      	str	x1, [x21, #0x8]
    90d4:      	str	x2, [x21, #0x10]
    90d8:      	ldr	x19, [sp, #0x40]
    90dc:      	ldr	x20, [sp, #0x48]
    90e0:      	ldr	x21, [sp, #0x50]
    90e4:      	ldr	x22, [sp, #0x58]
    90e8:      	ldr	x29, [sp]
    90ec:      	ldr	x30, [sp, #0x8]
    90f0:      	add	sp, sp, #0x60
    90f4:      	ret
    90f8:      	movz	x4, #0x0, lsl #48
    90fc:      	b	0x8fd0 <_stogir.vector-arithmetic.validate+0xdc>
    9100:      	lsr	w1, w1, #0
    9104:      	mov	x21, x8
    9108:      	mov	x22, x0
    910c:      	bl	0x910c <_stogir.vector-arithmetic.validate+0x218>
		000000000000910c:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    9110:      	cmp	x0, #0x0
    9114:      	b.eq	0x90b4 <_stogir.vector-arithmetic.validate+0x1c0>
    9118:      	uxtb	w20, w20
    911c:      	orr	x0, x20, xzr
    9120:      	ldr	x1, [x22, #0x78]
    9124:      	cmp	x0, #0x1d
    9128:      	cset	w2, eq
    912c:      	cmp	x0, #0x1e
    9130:      	cset	w3, eq
    9134:      	add	x1, x19, x1
    9138:      	ldr	w1, [x1]
    913c:      	cmp	x0, #0x1f
    9140:      	b.eq	0x91f8 <_stogir.vector-arithmetic.validate+0x304>
    9144:      	cmp	x0, #0x20
    9148:      	b.eq	0x91f8 <_stogir.vector-arithmetic.validate+0x304>
    914c:      	cmp	x0, #0x2d
    9150:      	b.eq	0x91f8 <_stogir.vector-arithmetic.validate+0x304>
    9154:      	cmp	x0, #0x36
    9158:      	b.eq	0x91f8 <_stogir.vector-arithmetic.validate+0x304>
    915c:      	cmp	x0, #0x37
    9160:      	b.eq	0x91f8 <_stogir.vector-arithmetic.validate+0x304>
    9164:      	cmp	x0, #0x38
    9168:      	b.eq	0x91f8 <_stogir.vector-arithmetic.validate+0x304>
    916c:      	cmp	x0, #0x39
    9170:      	b.eq	0x91f8 <_stogir.vector-arithmetic.validate+0x304>
    9174:      	uxtb	w16, w2
    9178:      	cmp	w16, wzr
    917c:      	b.ne	0x9250 <_stogir.vector-arithmetic.validate+0x35c>
    9180:      	uxtb	w16, w3
    9184:      	cmp	w16, wzr
    9188:      	b.ne	0x9250 <_stogir.vector-arithmetic.validate+0x35c>
    918c:      	mov	x0, #0x2                ; =2
    9190:      	b	0x9254 <_stogir.vector-arithmetic.validate+0x360>
    9194:      	movz	x4, #0x0, lsl #48
    9198:      	b	0x8fc8 <_stogir.vector-arithmetic.validate+0xd4>
    919c:      	add	x16, sp, #0x10
    91a0:      	ldr	w2, [x16, #0xc]
    91a4:      	sxtw	x2, w2
    91a8:      	lsr	w1, w1, #0
    91ac:      	lsr	w4, w4, #0
    91b0:      	lsr	w20, w20, #0
    91b4:      	lsr	w2, w2, #0
    91b8:      	ubfx	x0, x0, #8, #8
    91bc:      	lsr	w0, w0, #0
    91c0:      	add	x8, sp, #0x20
    91c4:      	mov	w3, w1
    91c8:      	mov	w1, w20
    91cc:      	mov	w5, w2
    91d0:      	mov	w2, w0
    91d4:      	mov	x0, x22
    91d8:      	bl	0x91d8 <_stogir.vector-arithmetic.validate+0x2e4>
		00000000000091d8:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.operands
    91dc:      	add	x16, sp, #0x20
    91e0:      	ldr	x0, [x16]
    91e4:      	add	x16, sp, #0x20
    91e8:      	ldr	x1, [x16, #0x8]
    91ec:      	add	x16, sp, #0x20
    91f0:      	ldr	x2, [x16, #0x10]
    91f4:      	b	0x90cc <_stogir.vector-arithmetic.validate+0x1d8>
    91f8:      	mov	x0, #0x1                ; =1
    91fc:      	sxtw	x1, w1
    9200:      	lsr	w0, w0, #0
    9204:      	sxtw	x0, w0
    9208:      	cmp	x1, x0
    920c:      	b.ne	0x90b4 <_stogir.vector-arithmetic.validate+0x1c0>
    9210:      	add	x16, sp, #0x10
    9214:      	ldr	w0, [x16]
    9218:      	add	x16, sp, #0x10
    921c:      	ldr	w1, [x16, #0x4]
    9220:      	add	x16, sp, #0x10
    9224:      	ldr	w4, [x16, #0x8]
    9228:      	uxtb	w16, w2
    922c:      	cmp	w16, wzr
    9230:      	b.ne	0x919c <_stogir.vector-arithmetic.validate+0x2a8>
    9234:      	uxtb	w16, w3
    9238:      	cmp	w16, wzr
    923c:      	b.ne	0x919c <_stogir.vector-arithmetic.validate+0x2a8>
    9240:      	movz	x2, #0x0, lsl #48
    9244:      	b	0x91a8 <_stogir.vector-arithmetic.validate+0x2b4>
    9248:      	brk	#0
    924c:      	b	0x9248 <_stogir.vector-arithmetic.validate+0x354>
    9250:      	mov	x0, #0x3                ; =3
    9254:      	b	0x91fc <_stogir.vector-arithmetic.validate+0x308>

0000000000009258 <_stogir.vector.memory-inputs>:
    9258:      	sub	sp, sp, #0x60
    925c:      	str	x29, [sp]
    9260:      	str	x30, [sp, #0x8]
    9264:      	mov	x29, sp
    9268:      	str	x19, [sp, #0x30]
    926c:      	str	x20, [sp, #0x38]
    9270:      	str	x21, [sp, #0x40]
    9274:      	str	x22, [sp, #0x48]
    9278:      	str	x23, [sp, #0x50]
    927c:      	str	x24, [sp, #0x58]
    9280:      	sxtw	x5, w1
    9284:      	cmp	x5, #0xf
    9288:      	b.le	0x97c0 <_stogir.vector.memory-inputs+0x568>
    928c:      	cmp	x5, #0x80
    9290:      	b.ge	0x97c8 <_stogir.vector.memory-inputs+0x570>
    9294:      	and	x6, x5, #0xf
    9298:      	lsr	w6, w6, #0
    929c:      	sxtw	x6, w6
    92a0:      	cmp	x6, #0x1
    92a4:      	b.lt	0x97d0 <_stogir.vector.memory-inputs+0x578>
    92a8:      	and	x5, x5, #0xf
    92ac:      	lsr	w5, w5, #0
    92b0:      	sxtw	x5, w5
    92b4:      	cmp	x5, #0xd
    92b8:      	b.gt	0x97d8 <_stogir.vector.memory-inputs+0x580>
    92bc:      	lsr	w1, w1, #0
    92c0:      	lsr	w2, w2, #0
    92c4:      	mov	x19, x8
    92c8:      	mov	x20, x0
    92cc:      	mov	w0, w1
    92d0:      	mov	w21, w1
    92d4:      	mov	w1, w2
    92d8:      	mov	w22, w2
    92dc:      	mov	w23, w3
    92e0:      	mov	w24, w4
    92e4:      	bl	0x92e4 <_stogir.vector.memory-inputs+0x8c>
		00000000000092e4:  ARM64_RELOC_BRANCH26	_stogir.types.size
    92e8:      	lsr	w0, w0, #0
    92ec:      	sxtw	x0, w0
    92f0:      	cmp	x0, #0x0
    92f4:      	b.le	0x935c <_stogir.vector.memory-inputs+0x104>
    92f8:      	sxtw	x23, w23
    92fc:      	cmp	x23, #0x0
    9300:      	cset	w0, gt
    9304:      	movz	x16, #0x0, lsl #48
    9308:      	sub	x1, x16, x23
    930c:      	sub	x2, x1, #0x1
    9310:      	uxtb	w16, w0
    9314:      	cmp	w16, wzr
    9318:      	b.eq	0x9474 <_stogir.vector.memory-inputs+0x21c>
    931c:      	ldr	x1, [x20, #0x8]
    9320:      	cmp	x23, x1
    9324:      	b.ge	0x946c <_stogir.vector.memory-inputs+0x214>
    9328:      	add	x1, x20, #0x78
    932c:      	ldr	x1, [x1, #0x8]
    9330:      	cmp	x23, x1
    9334:      	b.ge	0x9528 <_stogir.vector.memory-inputs+0x2d0>
    9338:      	lsl	x1, x23, #2
    933c:      	ldr	x3, [x20, #0x78]
    9340:      	add	x1, x1, x3
    9344:      	ldr	w1, [x1]
    9348:      	sxtw	x1, w1
    934c:      	cmp	x1, #0x0
    9350:      	cset	w1, ge
    9354:      	ubfx	x1, x1, #0, #8
    9358:      	b	0x952c <_stogir.vector.memory-inputs+0x2d4>
    935c:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		000000000000935c:  ARM64_RELOC_PAGE21	l_stogir.410
    9360:      	ldr	x16, [x16]
		0000000000009360:  ARM64_RELOC_PAGEOFF12	l_stogir.410
    9364:      	orr	x0, x16, xzr
    9368:      	mov	x1, x0
    936c:      	mov	x0, #0x1                ; =1
    9370:      	mov	x2, #0x32               ; =50
    9374:      	str	x0, [x19]
    9378:      	str	x1, [x19, #0x8]
    937c:      	str	x2, [x19, #0x10]
    9380:      	ldr	x19, [sp, #0x30]
    9384:      	ldr	x20, [sp, #0x38]
    9388:      	ldr	x21, [sp, #0x40]
    938c:      	ldr	x22, [sp, #0x48]
    9390:      	ldr	x23, [sp, #0x50]
    9394:      	ldr	x24, [sp, #0x58]
    9398:      	ldr	x29, [sp]
    939c:      	ldr	x30, [sp, #0x8]
    93a0:      	add	sp, sp, #0x60
    93a4:      	ret
    93a8:      	movz	x0, #0x0, lsl #48
    93ac:      	movz	x1, #0x0, lsl #48
    93b0:      	movz	x2, #0x0, lsl #48
    93b4:      	lsr	w0, w0, #0
    93b8:      	lsr	x16, x0, #0
    93bc:      	cmp	x16, #0x1
    93c0:      	b.eq	0x93dc <_stogir.vector.memory-inputs+0x184>
    93c4:      	b.lo	0x93cc <_stogir.vector.memory-inputs+0x174>
    93c8:      	b	0x93e0 <_stogir.vector.memory-inputs+0x188>
    93cc:      	cmp	x16, #0x0
    93d0:      	b.eq	0x93d8 <_stogir.vector.memory-inputs+0x180>
    93d4:      	b	0x93e0 <_stogir.vector.memory-inputs+0x188>
    93d8:      	b	0x93e4 <_stogir.vector.memory-inputs+0x18c>
    93dc:      	b	0x94c0 <_stogir.vector.memory-inputs+0x268>
    93e0:      	b	0x97a8 <_stogir.vector.memory-inputs+0x550>
    93e4:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		00000000000093e4:  ARM64_RELOC_PAGE21	l_stogir.411
    93e8:      	ldr	x16, [x16]
		00000000000093e8:  ARM64_RELOC_PAGEOFF12	l_stogir.411
    93ec:      	orr	x0, x16, xzr
    93f0:      	mov	x1, x0
    93f4:      	mov	x0, #0x1                ; =1
    93f8:      	mov	x2, #0x1d               ; =29
    93fc:      	b	0x9374 <_stogir.vector.memory-inputs+0x11c>
    9400:      	lsl	x0, x2, #4
    9404:      	ldr	x1, [x20, #0x28]
    9408:      	add	x0, x0, x1
    940c:      	ldr	x1, [x0]
    9410:      	ldr	x0, [x0, #0x8]
    9414:      	fmov	d31, x0
    9418:      	mov	x0, x1
    941c:      	fmov	x1, d31
    9420:      	mov	x2, x1
    9424:      	mov	x1, x0
    9428:      	mov	x0, #0x1                ; =1
    942c:      	b	0x93b4 <_stogir.vector.memory-inputs+0x15c>
    9430:      	movz	x1, #0x0, lsl #48
    9434:      	cmp	x1, #0x0
    9438:      	b.eq	0x93a8 <_stogir.vector.memory-inputs+0x150>
    943c:      	uxtb	w16, w0
    9440:      	cmp	w16, wzr
    9444:      	b.eq	0x9400 <_stogir.vector.memory-inputs+0x1a8>
    9448:      	lsl	x0, x23, #4
    944c:      	ldr	x1, [x20]
    9450:      	add	x0, x0, x1
    9454:      	ldr	x1, [x0]
    9458:      	ldr	x0, [x0, #0x8]
    945c:      	fmov	d31, x0
    9460:      	mov	x0, x1
    9464:      	fmov	x1, d31
    9468:      	b	0x9420 <_stogir.vector.memory-inputs+0x1c8>
    946c:      	movz	x1, #0x0, lsl #48
    9470:      	b	0x9434 <_stogir.vector.memory-inputs+0x1dc>
    9474:      	cmp	x23, #0x0
    9478:      	b.ge	0x9430 <_stogir.vector.memory-inputs+0x1d8>
    947c:      	add	x3, x20, #0x28
    9480:      	add	x4, x20, #0x50
    9484:      	ldr	x3, [x3, #0x8]
    9488:      	ldr	x4, [x4, #0x8]
    948c:      	cmp	x3, x4
    9490:      	b.ne	0x9520 <_stogir.vector.memory-inputs+0x2c8>
    9494:      	cmp	x1, x3
    9498:      	b.gt	0x9530 <_stogir.vector.memory-inputs+0x2d8>
    949c:      	lsl	x1, x2, #2
    94a0:      	ldr	x3, [x20, #0x50]
    94a4:      	add	x1, x1, x3
    94a8:      	ldr	w1, [x1]
    94ac:      	sxtw	x1, w1
    94b0:      	cmp	x1, #0x0
    94b4:      	cset	w1, gt
    94b8:      	ubfx	x1, x1, #0, #8
    94bc:      	b	0x9534 <_stogir.vector.memory-inputs+0x2dc>
    94c0:      	add	x16, sp, #0x10
    94c4:      	str	x1, [x16]
    94c8:      	add	x16, sp, #0x10
    94cc:      	str	x2, [x16, #0x8]
    94d0:      	cmp	x23, #0x0
    94d4:      	b.le	0x9504 <_stogir.vector.memory-inputs+0x2ac>
    94d8:      	add	x16, sp, #0x10
    94dc:      	ldr	w0, [x16]
    94e0:      	uxtb	w0, w0
    94e4:      	cmp	x0, #0x83
    94e8:      	b.ge	0x9538 <_stogir.vector.memory-inputs+0x2e0>
    94ec:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		00000000000094ec:  ARM64_RELOC_PAGE21	l_stogir.412
    94f0:      	ldr	x16, [x16]
		00000000000094f0:  ARM64_RELOC_PAGEOFF12	l_stogir.412
    94f4:      	orr	x1, x16, xzr
    94f8:      	add	x0, x0, x1
    94fc:      	ldrb	w0, [x0]
    9500:      	b	0x953c <_stogir.vector.memory-inputs+0x2e4>
    9504:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		0000000000009504:  ARM64_RELOC_PAGE21	l_stogir.413
    9508:      	ldr	x16, [x16]
		0000000000009508:  ARM64_RELOC_PAGEOFF12	l_stogir.413
    950c:      	orr	x0, x16, xzr
    9510:      	mov	x1, x0
    9514:      	mov	x0, #0x1                ; =1
    9518:      	mov	x2, #0x2c               ; =44
    951c:      	b	0x93fc <_stogir.vector.memory-inputs+0x1a4>
    9520:      	movz	x1, #0x0, lsl #48
    9524:      	b	0x9434 <_stogir.vector.memory-inputs+0x1dc>
    9528:      	movz	x1, #0x0, lsl #48
    952c:      	b	0x9470 <_stogir.vector.memory-inputs+0x218>
    9530:      	movz	x1, #0x0, lsl #48
    9534:      	b	0x9524 <_stogir.vector.memory-inputs+0x2cc>
    9538:      	movz	x0, #0x0, lsl #48
    953c:      	uxtb	w0, w0
    9540:      	and	x0, x0, #0x1
    9544:      	uxtb	w0, w0
    9548:      	cmp	x0, #0x0
    954c:      	b.eq	0x9504 <_stogir.vector.memory-inputs+0x2ac>
    9550:      	add	x16, sp, #0x10
    9554:      	ldr	w0, [x16]
    9558:      	uxtb	w0, w0
    955c:      	cmp	x0, #0x83
    9560:      	b.ge	0x957c <_stogir.vector.memory-inputs+0x324>
    9564:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		0000000000009564:  ARM64_RELOC_PAGE21	l_stogir.412
    9568:      	ldr	x16, [x16]
		0000000000009568:  ARM64_RELOC_PAGEOFF12	l_stogir.412
    956c:      	orr	x1, x16, xzr
    9570:      	add	x0, x0, x1
    9574:      	ldrb	w0, [x0]
    9578:      	b	0x9580 <_stogir.vector.memory-inputs+0x328>
    957c:      	movz	x0, #0x0, lsl #48
    9580:      	uxtb	w0, w0
    9584:      	and	x0, x0, #0x4
    9588:      	uxtb	w0, w0
    958c:      	cmp	x0, #0x0
    9590:      	b.ne	0x9504 <_stogir.vector.memory-inputs+0x2ac>
    9594:      	sxtw	x24, w24
    9598:      	cmp	x24, #0x0
    959c:      	cset	w0, gt
    95a0:      	movz	x16, #0x0, lsl #48
    95a4:      	sub	x1, x16, x24
    95a8:      	sub	x2, x1, #0x1
    95ac:      	uxtb	w16, w0
    95b0:      	cmp	w16, wzr
    95b4:      	b.eq	0x9614 <_stogir.vector.memory-inputs+0x3bc>
    95b8:      	ldr	x1, [x20, #0x8]
    95bc:      	cmp	x24, x1
    95c0:      	b.ge	0x9660 <_stogir.vector.memory-inputs+0x408>
    95c4:      	add	x1, x20, #0x78
    95c8:      	ldr	x1, [x1, #0x8]
    95cc:      	cmp	x24, x1
    95d0:      	b.ge	0x97a0 <_stogir.vector.memory-inputs+0x548>
    95d4:      	lsl	x1, x24, #2
    95d8:      	ldr	x3, [x20, #0x78]
    95dc:      	add	x1, x1, x3
    95e0:      	ldr	w1, [x1]
    95e4:      	sxtw	x1, w1
    95e8:      	cmp	x1, #0x0
    95ec:      	cset	w1, ge
    95f0:      	ubfx	x1, x1, #0, #8
    95f4:      	b	0x97a4 <_stogir.vector.memory-inputs+0x54c>
    95f8:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		00000000000095f8:  ARM64_RELOC_PAGE21	l_stogir.414
    95fc:      	ldr	x16, [x16]
		00000000000095fc:  ARM64_RELOC_PAGEOFF12	l_stogir.414
    9600:      	orr	x0, x16, xzr
    9604:      	mov	x1, x0
    9608:      	mov	x0, #0x1                ; =1
    960c:      	mov	x2, #0x2b               ; =43
    9610:      	b	0x951c <_stogir.vector.memory-inputs+0x2c4>
    9614:      	cmp	x24, #0x0
    9618:      	b.ge	0x9668 <_stogir.vector.memory-inputs+0x410>
    961c:      	add	x3, x20, #0x28
    9620:      	add	x4, x20, #0x50
    9624:      	ldr	x3, [x3, #0x8]
    9628:      	ldr	x4, [x4, #0x8]
    962c:      	cmp	x3, x4
    9630:      	b.ne	0x9798 <_stogir.vector.memory-inputs+0x540>
    9634:      	cmp	x1, x3
    9638:      	b.gt	0x97b0 <_stogir.vector.memory-inputs+0x558>
    963c:      	lsl	x1, x2, #2
    9640:      	ldr	x3, [x20, #0x50]
    9644:      	add	x1, x1, x3
    9648:      	ldr	w1, [x1]
    964c:      	sxtw	x1, w1
    9650:      	cmp	x1, #0x0
    9654:      	cset	w1, gt
    9658:      	ubfx	x1, x1, #0, #8
    965c:      	b	0x97b4 <_stogir.vector.memory-inputs+0x55c>
    9660:      	movz	x1, #0x0, lsl #48
    9664:      	b	0x966c <_stogir.vector.memory-inputs+0x414>
    9668:      	movz	x1, #0x0, lsl #48
    966c:      	cmp	x1, #0x0
    9670:      	b.eq	0x96d4 <_stogir.vector.memory-inputs+0x47c>
    9674:      	uxtb	w16, w0
    9678:      	cmp	w16, wzr
    967c:      	b.eq	0x96a4 <_stogir.vector.memory-inputs+0x44c>
    9680:      	lsl	x0, x24, #4
    9684:      	ldr	x1, [x20]
    9688:      	add	x0, x0, x1
    968c:      	ldr	x1, [x0]
    9690:      	ldr	x0, [x0, #0x8]
    9694:      	fmov	d31, x0
    9698:      	mov	x0, x1
    969c:      	fmov	x1, d31
    96a0:      	b	0x96c4 <_stogir.vector.memory-inputs+0x46c>
    96a4:      	lsl	x0, x2, #4
    96a8:      	ldr	x1, [x20, #0x28]
    96ac:      	add	x0, x0, x1
    96b0:      	ldr	x1, [x0]
    96b4:      	ldr	x0, [x0, #0x8]
    96b8:      	fmov	d31, x0
    96bc:      	mov	x0, x1
    96c0:      	fmov	x1, d31
    96c4:      	mov	x2, x1
    96c8:      	mov	x1, x0
    96cc:      	mov	x0, #0x1                ; =1
    96d0:      	b	0x96e0 <_stogir.vector.memory-inputs+0x488>
    96d4:      	movz	x0, #0x0, lsl #48
    96d8:      	movz	x1, #0x0, lsl #48
    96dc:      	movz	x2, #0x0, lsl #48
    96e0:      	lsr	w0, w0, #0
    96e4:      	lsr	x16, x0, #0
    96e8:      	cmp	x16, #0x1
    96ec:      	b.eq	0x9708 <_stogir.vector.memory-inputs+0x4b0>
    96f0:      	b.lo	0x96f8 <_stogir.vector.memory-inputs+0x4a0>
    96f4:      	b	0x970c <_stogir.vector.memory-inputs+0x4b4>
    96f8:      	cmp	x16, #0x0
    96fc:      	b.eq	0x9704 <_stogir.vector.memory-inputs+0x4ac>
    9700:      	b	0x970c <_stogir.vector.memory-inputs+0x4b4>
    9704:      	b	0x9710 <_stogir.vector.memory-inputs+0x4b8>
    9708:      	b	0x972c <_stogir.vector.memory-inputs+0x4d4>
    970c:      	b	0x97b8 <_stogir.vector.memory-inputs+0x560>
    9710:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		0000000000009710:  ARM64_RELOC_PAGE21	l_stogir.415
    9714:      	ldr	x16, [x16]
		0000000000009714:  ARM64_RELOC_PAGEOFF12	l_stogir.415
    9718:      	orr	x0, x16, xzr
    971c:      	mov	x1, x0
    9720:      	mov	x0, #0x1                ; =1
    9724:      	mov	x2, #0x1d               ; =29
    9728:      	b	0x9610 <_stogir.vector.memory-inputs+0x3b8>
    972c:      	lsr	w0, w1, #0
    9730:      	add	x16, sp, #0x20
    9734:      	str	x1, [x16]
    9738:      	add	x16, sp, #0x20
    973c:      	str	x2, [x16, #0x8]
    9740:      	ubfx	x0, x0, #8, #8
    9744:      	cmp	x0, #0x6
    9748:      	b.ne	0x95f8 <_stogir.vector.memory-inputs+0x3a0>
    974c:      	add	x16, sp, #0x20
    9750:      	ldr	w0, [x16]
    9754:      	uxtb	w0, w0
    9758:      	cmp	x0, #0x48
    975c:      	b.eq	0x95f8 <_stogir.vector.memory-inputs+0x3a0>
    9760:      	cmp	x0, #0x46
    9764:      	b.eq	0x95f8 <_stogir.vector.memory-inputs+0x3a0>
    9768:      	lsr	w21, w21, #0
    976c:      	lsr	w22, w22, #0
    9770:      	mov	w0, w21
    9774:      	mov	w1, w22
    9778:      	bl	0x9778 <_stogir.vector.memory-inputs+0x520>
		0000000000009778:  ARM64_RELOC_BRANCH26	_stogir.types.size
    977c:      	lsr	w0, w0, #0
    9780:      	sxtw	x0, w0
    9784:      	and	x0, x0, #0xffffffff
    9788:      	mov	x1, x0
    978c:      	movz	x0, #0x0, lsl #48
    9790:      	movz	x2, #0x0, lsl #48
    9794:      	b	0x9610 <_stogir.vector.memory-inputs+0x3b8>
    9798:      	movz	x1, #0x0, lsl #48
    979c:      	b	0x966c <_stogir.vector.memory-inputs+0x414>
    97a0:      	movz	x1, #0x0, lsl #48
    97a4:      	b	0x9664 <_stogir.vector.memory-inputs+0x40c>
    97a8:      	brk	#0
    97ac:      	b	0x97a8 <_stogir.vector.memory-inputs+0x550>
    97b0:      	movz	x1, #0x0, lsl #48
    97b4:      	b	0x979c <_stogir.vector.memory-inputs+0x544>
    97b8:      	brk	#0
    97bc:      	b	0x97b8 <_stogir.vector.memory-inputs+0x560>
    97c0:      	mov	x19, x8
    97c4:      	b	0x935c <_stogir.vector.memory-inputs+0x104>
    97c8:      	mov	x19, x8
    97cc:      	b	0x935c <_stogir.vector.memory-inputs+0x104>
    97d0:      	mov	x19, x8
    97d4:      	b	0x935c <_stogir.vector.memory-inputs+0x104>
    97d8:      	mov	x19, x8
    97dc:      	b	0x935c <_stogir.vector.memory-inputs+0x104>

00000000000097e0 <_stogir.vector.store-inputs>:
    97e0:      	sub	sp, sp, #0x40
    97e4:      	str	x29, [sp]
    97e8:      	str	x30, [sp, #0x8]
    97ec:      	mov	x29, sp
    97f0:      	str	x19, [sp, #0x30]
    97f4:      	sxtw	x4, w4
    97f8:      	cmp	x4, #0x0
    97fc:      	cset	w5, gt
    9800:      	movz	x16, #0x0, lsl #48
    9804:      	sub	x6, x16, x4
    9808:      	sub	x7, x6, #0x1
    980c:      	uxtb	w16, w5
    9810:      	cmp	w16, wzr
    9814:      	b.eq	0x9858 <_stogir.vector.store-inputs+0x78>
    9818:      	ldr	x6, [x0, #0x8]
    981c:      	cmp	x4, x6
    9820:      	b.ge	0x98ac <_stogir.vector.store-inputs+0xcc>
    9824:      	add	x6, x0, #0x78
    9828:      	ldr	x6, [x6, #0x8]
    982c:      	cmp	x4, x6
    9830:      	b.ge	0x99c4 <_stogir.vector.store-inputs+0x1e4>
    9834:      	lsl	x6, x4, #2
    9838:      	ldr	x9, [x0, #0x78]
    983c:      	add	x6, x6, x9
    9840:      	ldr	w6, [x6]
    9844:      	sxtw	x6, w6
    9848:      	cmp	x6, #0x0
    984c:      	cset	w6, ge
    9850:      	ubfx	x6, x6, #0, #8
    9854:      	b	0x99c8 <_stogir.vector.store-inputs+0x1e8>
    9858:      	cmp	x4, #0x0
    985c:      	b.ge	0x98b4 <_stogir.vector.store-inputs+0xd4>
    9860:      	add	x9, x0, #0x28
    9864:      	add	x10, x0, #0x50
    9868:      	ldr	x9, [x9, #0x8]
    986c:      	ldr	x10, [x10, #0x8]
    9870:      	cmp	x9, x10
    9874:      	b.ne	0x98a4 <_stogir.vector.store-inputs+0xc4>
    9878:      	cmp	x6, x9
    987c:      	b.gt	0x99cc <_stogir.vector.store-inputs+0x1ec>
    9880:      	lsl	x6, x7, #2
    9884:      	ldr	x9, [x0, #0x50]
    9888:      	add	x6, x6, x9
    988c:      	ldr	w6, [x6]
    9890:      	sxtw	x6, w6
    9894:      	cmp	x6, #0x0
    9898:      	cset	w6, gt
    989c:      	ubfx	x6, x6, #0, #8
    98a0:      	b	0x99d0 <_stogir.vector.store-inputs+0x1f0>
    98a4:      	movz	x6, #0x0, lsl #48
    98a8:      	b	0x98b8 <_stogir.vector.store-inputs+0xd8>
    98ac:      	movz	x6, #0x0, lsl #48
    98b0:      	b	0x98b8 <_stogir.vector.store-inputs+0xd8>
    98b4:      	movz	x6, #0x0, lsl #48
    98b8:      	cmp	x6, #0x0
    98bc:      	b.eq	0x98fc <_stogir.vector.store-inputs+0x11c>
    98c0:      	uxtb	w16, w5
    98c4:      	cmp	w16, wzr
    98c8:      	b.eq	0x98e0 <_stogir.vector.store-inputs+0x100>
    98cc:      	lsl	x4, x4, #4
    98d0:      	ldr	x5, [x0]
    98d4:      	add	x4, x4, x5
    98d8:      	ldr	x4, [x4]
    98dc:      	b	0x98f0 <_stogir.vector.store-inputs+0x110>
    98e0:      	lsl	x4, x7, #4
    98e4:      	ldr	x5, [x0, #0x28]
    98e8:      	add	x4, x4, x5
    98ec:      	ldr	x4, [x4]
    98f0:      	mov	x5, x4
    98f4:      	mov	x4, #0x1                ; =1
    98f8:      	b	0x9904 <_stogir.vector.store-inputs+0x124>
    98fc:      	movz	x4, #0x0, lsl #48
    9900:      	movz	x5, #0x0, lsl #48
    9904:      	lsr	w4, w4, #0
    9908:      	lsr	x16, x4, #0
    990c:      	cmp	x16, #0x1
    9910:      	b.eq	0x992c <_stogir.vector.store-inputs+0x14c>
    9914:      	b.lo	0x991c <_stogir.vector.store-inputs+0x13c>
    9918:      	b	0x9930 <_stogir.vector.store-inputs+0x150>
    991c:      	cmp	x16, #0x0
    9920:      	b.eq	0x9928 <_stogir.vector.store-inputs+0x148>
    9924:      	b	0x9930 <_stogir.vector.store-inputs+0x150>
    9928:      	b	0x9934 <_stogir.vector.store-inputs+0x154>
    992c:      	b	0x9954 <_stogir.vector.store-inputs+0x174>
    9930:      	b	0x99d4 <_stogir.vector.store-inputs+0x1f4>
    9934:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		0000000000009934:  ARM64_RELOC_PAGE21	l_stogir.416
    9938:      	ldr	x16, [x16]
		0000000000009938:  ARM64_RELOC_PAGEOFF12	l_stogir.416
    993c:      	orr	x0, x16, xzr
    9940:      	mov	x19, x8
    9944:      	mov	x1, x0
    9948:      	mov	x0, #0x1                ; =1
    994c:      	mov	x2, #0x1a               ; =26
    9950:      	b	0x99a4 <_stogir.vector.store-inputs+0x1c4>
    9954:      	lsr	w1, w1, #0
    9958:      	lsr	w2, w2, #0
    995c:      	lsr	w3, w3, #0
    9960:      	lsr	w5, w5, #0
    9964:      	ubfx	x4, x5, #8, #8
    9968:      	lsr	w4, w4, #0
    996c:      	mov	x19, x8
    9970:      	add	x8, sp, #0x10
    9974:      	fmov	s31, w1
    9978:      	mov	w1, w4
    997c:      	mov	w4, w3
    9980:      	mov	w3, w2
    9984:      	fmov	w2, s31
    9988:      	bl	0x9988 <_stogir.vector.store-inputs+0x1a8>
		0000000000009988:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    998c:      	add	x16, sp, #0x10
    9990:      	ldr	x0, [x16]
    9994:      	add	x16, sp, #0x10
    9998:      	ldr	x1, [x16, #0x8]
    999c:      	add	x16, sp, #0x10
    99a0:      	ldr	x2, [x16, #0x10]
    99a4:      	str	x0, [x19]
    99a8:      	str	x1, [x19, #0x8]
    99ac:      	str	x2, [x19, #0x10]
    99b0:      	ldr	x19, [sp, #0x30]
    99b4:      	ldr	x29, [sp]
    99b8:      	ldr	x30, [sp, #0x8]
    99bc:      	add	sp, sp, #0x40
    99c0:      	ret
    99c4:      	movz	x6, #0x0, lsl #48
    99c8:      	b	0x98b0 <_stogir.vector.store-inputs+0xd0>
    99cc:      	movz	x6, #0x0, lsl #48
    99d0:      	b	0x98a8 <_stogir.vector.store-inputs+0xc8>
    99d4:      	brk	#0
    99d8:      	b	0x99d4 <_stogir.vector.store-inputs+0x1f4>

00000000000099dc <_stogir.types.size>:
    99dc:      	sub	sp, sp, #0x60
    99e0:      	str	x29, [sp]
    99e4:      	str	x30, [sp, #0x8]
    99e8:      	mov	x29, sp
    99ec:      	str	x19, [sp, #0x10]
    99f0:      	str	x20, [sp, #0x18]
    99f4:      	str	x21, [sp, #0x20]
    99f8:      	str	x22, [sp, #0x28]
    99fc:      	str	x23, [sp, #0x30]
    9a00:      	str	x24, [sp, #0x38]
    9a04:      	str	x25, [sp, #0x40]
    9a08:      	str	x26, [sp, #0x48]
    9a0c:      	str	x27, [sp, #0x50]
    9a10:      	str	x28, [sp, #0x58]
    9a14:      	sxtw	x19, w0
    9a18:      	sxtw	x20, w1
    9a1c:      	cmp	x19, #0xf
    9a20:      	cset	w21, gt
    9a24:      	cmp	x19, #0x0
    9a28:      	cset	w22, eq
    9a2c:      	cmp	x20, #0x4
    9a30:      	cset	w23, eq
    9a34:      	cmp	x20, #0x8
    9a38:      	cset	w24, eq
    9a3c:      	uxtb	w16, w21
    9a40:      	cmp	w16, wzr
    9a44:      	b.eq	0x9aa8 <_stogir.types.size+0xcc>
    9a48:      	cmp	x19, #0x80
    9a4c:      	cset	w25, lt
    9a50:      	uxtb	w16, w25
    9a54:      	cmp	w16, wzr
    9a58:      	b.eq	0x9aa8 <_stogir.types.size+0xcc>
    9a5c:      	and	x1, x19, #0xf
    9a60:      	lsr	w1, w1, #0
    9a64:      	sxtw	x26, w1
    9a68:      	cmp	x26, #0x1
    9a6c:      	cset	w27, ge
    9a70:      	uxtb	w16, w27
    9a74:      	cmp	w16, wzr
    9a78:      	b.eq	0x9aa8 <_stogir.types.size+0xcc>
    9a7c:      	cmp	x26, #0xd
    9a80:      	cset	w28, le
    9a84:      	uxtb	w16, w28
    9a88:      	cmp	w16, wzr
    9a8c:      	b.eq	0x9aa8 <_stogir.types.size+0xcc>
    9a90:      	lsr	w0, w0, #0
    9a94:      	bl	0x9a94 <_stogir.types.size+0xb8>
		0000000000009a94:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    9a98:      	cmp	x0, #0x0
    9a9c:      	b.eq	0x9b88 <_stogir.types.size+0x1ac>
    9aa0:      	mov	x0, x26
    9aa4:      	b	0x9b8c <_stogir.types.size+0x1b0>
    9aa8:      	uxtb	w16, w23
    9aac:      	cmp	w16, wzr
    9ab0:      	b.ne	0x9ac8 <_stogir.types.size+0xec>
    9ab4:      	uxtb	w16, w24
    9ab8:      	cmp	w16, wzr
    9abc:      	b.ne	0x9ac8 <_stogir.types.size+0xec>
    9ac0:      	movn	x0, #0x0, lsl #48
    9ac4:      	b	0x9ae0 <_stogir.types.size+0x104>
    9ac8:      	uxtb	w16, w22
    9acc:      	cmp	w16, wzr
    9ad0:      	b.eq	0x9b18 <_stogir.types.size+0x13c>
    9ad4:      	movz	x0, #0x0, lsl #48
    9ad8:      	b	0x9ae0 <_stogir.types.size+0x104>
    9adc:      	mov	x0, #0x1                ; =1
    9ae0:      	ldr	x19, [sp, #0x10]
    9ae4:      	ldr	x20, [sp, #0x18]
    9ae8:      	ldr	x21, [sp, #0x20]
    9aec:      	ldr	x22, [sp, #0x28]
    9af0:      	ldr	x23, [sp, #0x30]
    9af4:      	ldr	x24, [sp, #0x38]
    9af8:      	ldr	x25, [sp, #0x40]
    9afc:      	ldr	x26, [sp, #0x48]
    9b00:      	ldr	x27, [sp, #0x50]
    9b04:      	ldr	x28, [sp, #0x58]
    9b08:      	ldr	x29, [sp]
    9b0c:      	ldr	x30, [sp, #0x8]
    9b10:      	add	sp, sp, #0x60
    9b14:      	ret
    9b18:      	cmp	x19, #0x1
    9b1c:      	b.eq	0x9adc <_stogir.types.size+0x100>
    9b20:      	cmp	x19, #0x2
    9b24:      	b.eq	0x9adc <_stogir.types.size+0x100>
    9b28:      	cmp	x19, #0x7
    9b2c:      	b.eq	0x9adc <_stogir.types.size+0x100>
    9b30:      	cmp	x19, #0x8
    9b34:      	b.eq	0x9adc <_stogir.types.size+0x100>
    9b38:      	cmp	x19, #0x3
    9b3c:      	b.eq	0x9cf8 <_stogir.types.size+0x31c>
    9b40:      	cmp	x19, #0x9
    9b44:      	b.eq	0x9cf8 <_stogir.types.size+0x31c>
    9b48:      	cmp	x19, #0x4
    9b4c:      	b.eq	0x9d20 <_stogir.types.size+0x344>
    9b50:      	cmp	x19, #0xa
    9b54:      	b.eq	0x9d20 <_stogir.types.size+0x344>
    9b58:      	cmp	x19, #0xd
    9b5c:      	b.eq	0x9d20 <_stogir.types.size+0x344>
    9b60:      	cmp	x19, #0x5
    9b64:      	b.eq	0x9d30 <_stogir.types.size+0x354>
    9b68:      	cmp	x19, #0xb
    9b6c:      	b.eq	0x9d30 <_stogir.types.size+0x354>
    9b70:      	cmp	x19, #0xc
    9b74:      	b.eq	0x9d30 <_stogir.types.size+0x354>
    9b78:      	cmp	x19, #0x6
    9b7c:      	b.ne	0x9d40 <_stogir.types.size+0x364>
    9b80:      	mov	x0, x20
    9b84:      	b	0x9d44 <_stogir.types.size+0x368>
    9b88:      	movn	x0, #0x0, lsl #48
    9b8c:      	uxtb	w16, w23
    9b90:      	cmp	w16, wzr
    9b94:      	b.ne	0x9bac <_stogir.types.size+0x1d0>
    9b98:      	uxtb	w16, w24
    9b9c:      	cmp	w16, wzr
    9ba0:      	b.ne	0x9bac <_stogir.types.size+0x1d0>
    9ba4:      	movn	x0, #0x0, lsl #48
    9ba8:      	b	0x9bc8 <_stogir.types.size+0x1ec>
    9bac:      	lsr	w0, w0, #0
    9bb0:      	sxtw	x0, w0
    9bb4:      	cmp	x0, #0x0
    9bb8:      	b.ne	0x9c88 <_stogir.types.size+0x2ac>
    9bbc:      	movz	x0, #0x0, lsl #48
    9bc0:      	b	0x9bc8 <_stogir.types.size+0x1ec>
    9bc4:      	mov	x0, #0x1                ; =1
    9bc8:      	lsr	w0, w0, #0
    9bcc:      	sxtw	x0, w0
    9bd0:      	cmp	x0, #0x0
    9bd4:      	b.ge	0x9c30 <_stogir.types.size+0x254>
    9bd8:      	movn	x0, #0x0, lsl #48
    9bdc:      	b	0x9bf8 <_stogir.types.size+0x21c>
    9be0:      	movn	x1, #0x0, lsl #48
    9be4:      	lsr	w1, w1, #0
    9be8:      	sxtw	x1, w1
    9bec:      	mul	x0, x1, x0
    9bf0:      	lsr	w0, w0, #0
    9bf4:      	sxtw	x0, w0
    9bf8:      	ldr	x19, [sp, #0x10]
    9bfc:      	ldr	x20, [sp, #0x18]
    9c00:      	ldr	x21, [sp, #0x20]
    9c04:      	ldr	x22, [sp, #0x28]
    9c08:      	ldr	x23, [sp, #0x30]
    9c0c:      	ldr	x24, [sp, #0x38]
    9c10:      	ldr	x25, [sp, #0x40]
    9c14:      	ldr	x26, [sp, #0x48]
    9c18:      	ldr	x27, [sp, #0x50]
    9c1c:      	ldr	x28, [sp, #0x58]
    9c20:      	ldr	x29, [sp]
    9c24:      	ldr	x30, [sp, #0x8]
    9c28:      	add	sp, sp, #0x60
    9c2c:      	ret
    9c30:      	uxtb	w16, w21
    9c34:      	cmp	w16, wzr
    9c38:      	b.eq	0x9d00 <_stogir.types.size+0x324>
    9c3c:      	uxtb	w16, w25
    9c40:      	cmp	w16, wzr
    9c44:      	b.eq	0x9d00 <_stogir.types.size+0x324>
    9c48:      	uxtb	w16, w27
    9c4c:      	cmp	w16, wzr
    9c50:      	b.eq	0x9d00 <_stogir.types.size+0x324>
    9c54:      	uxtb	w16, w28
    9c58:      	cmp	w16, wzr
    9c5c:      	b.eq	0x9d00 <_stogir.types.size+0x324>
    9c60:      	ubfx	x1, x19, #4, #32
    9c64:      	sxtw	x1, w1
    9c68:      	sub	x1, x1, #0x1
    9c6c:      	lsr	w1, w1, #0
    9c70:      	sxtw	x1, w1
    9c74:      	mov	x16, #0x1               ; =1
    9c78:      	lsl	x1, x16, x1
    9c7c:      	lsr	w1, w1, #0
    9c80:      	sxtw	x1, w1
    9c84:      	b	0x9be4 <_stogir.types.size+0x208>
    9c88:      	cmp	x0, #0x1
    9c8c:      	b.eq	0x9bc4 <_stogir.types.size+0x1e8>
    9c90:      	cmp	x0, #0x2
    9c94:      	b.eq	0x9bc4 <_stogir.types.size+0x1e8>
    9c98:      	cmp	x0, #0x7
    9c9c:      	b.eq	0x9bc4 <_stogir.types.size+0x1e8>
    9ca0:      	cmp	x0, #0x8
    9ca4:      	b.eq	0x9bc4 <_stogir.types.size+0x1e8>
    9ca8:      	cmp	x0, #0x3
    9cac:      	b.eq	0x9d28 <_stogir.types.size+0x34c>
    9cb0:      	cmp	x0, #0x9
    9cb4:      	b.eq	0x9d28 <_stogir.types.size+0x34c>
    9cb8:      	cmp	x0, #0x4
    9cbc:      	b.eq	0x9d38 <_stogir.types.size+0x35c>
    9cc0:      	cmp	x0, #0xa
    9cc4:      	b.eq	0x9d38 <_stogir.types.size+0x35c>
    9cc8:      	cmp	x0, #0xd
    9ccc:      	b.eq	0x9d38 <_stogir.types.size+0x35c>
    9cd0:      	cmp	x0, #0x5
    9cd4:      	b.eq	0x9d48 <_stogir.types.size+0x36c>
    9cd8:      	cmp	x0, #0xb
    9cdc:      	b.eq	0x9d48 <_stogir.types.size+0x36c>
    9ce0:      	cmp	x0, #0xc
    9ce4:      	b.eq	0x9d48 <_stogir.types.size+0x36c>
    9ce8:      	cmp	x0, #0x6
    9cec:      	b.ne	0x9d50 <_stogir.types.size+0x374>
    9cf0:      	mov	x0, x20
    9cf4:      	b	0x9d54 <_stogir.types.size+0x378>
    9cf8:      	mov	x0, #0x2                ; =2
    9cfc:      	b	0x9ae0 <_stogir.types.size+0x104>
    9d00:      	cmp	x19, #0x0
    9d04:      	b.lt	0x9be0 <_stogir.types.size+0x204>
    9d08:      	cmp	x19, #0xd
    9d0c:      	b.gt	0x9be0 <_stogir.types.size+0x204>
    9d10:      	uxtb	w16, w22
    9d14:      	cmp	w16, wzr
    9d18:      	cset	x1, eq
    9d1c:      	b	0x9be4 <_stogir.types.size+0x208>
    9d20:      	mov	x0, #0x4                ; =4
    9d24:      	b	0x9cfc <_stogir.types.size+0x320>
    9d28:      	mov	x0, #0x2                ; =2
    9d2c:      	b	0x9bc8 <_stogir.types.size+0x1ec>
    9d30:      	mov	x0, #0x8                ; =8
    9d34:      	b	0x9d24 <_stogir.types.size+0x348>
    9d38:      	mov	x0, #0x4                ; =4
    9d3c:      	b	0x9d2c <_stogir.types.size+0x350>
    9d40:      	movn	x0, #0x0, lsl #48
    9d44:      	b	0x9d34 <_stogir.types.size+0x358>
    9d48:      	mov	x0, #0x8                ; =8
    9d4c:      	b	0x9d3c <_stogir.types.size+0x360>
    9d50:      	movn	x0, #0x0, lsl #48
    9d54:      	b	0x9d4c <_stogir.types.size+0x370>

0000000000009d58 <_stogir.opcode.properties>:
    9d58:      	sxtw	x0, w0
    9d5c:      	cmp	x0, #0x0
    9d60:      	b.lt	0x9d88 <_stogir.opcode.properties+0x30>
    9d64:      	cmp	x0, #0x83
    9d68:      	b.ge	0x9d88 <_stogir.opcode.properties+0x30>
    9d6c:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		0000000000009d6c:  ARM64_RELOC_PAGE21	l_stogir.417
    9d70:      	ldr	x16, [x16]
		0000000000009d70:  ARM64_RELOC_PAGEOFF12	l_stogir.417
    9d74:      	orr	x1, x16, xzr
    9d78:      	lsr	x0, x0, #0
    9d7c:      	add	x0, x0, x1
    9d80:      	ldrb	w0, [x0]
    9d84:      	b	0x9d8c <_stogir.opcode.properties+0x34>
    9d88:      	movz	x0, #0x0, lsl #48
    9d8c:      	ret

0000000000009d90 <_stogir.checked.projection>:
    9d90:      	sub	sp, sp, #0x50
    9d94:      	str	x29, [sp]
    9d98:      	str	x30, [sp, #0x8]
    9d9c:      	mov	x29, sp
    9da0:      	str	x19, [sp, #0x40]
    9da4:      	sxtw	x2, w1
    9da8:      	cmp	x2, #0x0
    9dac:      	cset	w3, gt
    9db0:      	movz	x16, #0x0, lsl #48
    9db4:      	sub	x4, x16, x2
    9db8:      	sub	x5, x4, #0x1
    9dbc:      	uxtb	w16, w3
    9dc0:      	cmp	w16, wzr
    9dc4:      	b.eq	0x9e08 <_stogir.checked.projection+0x78>
    9dc8:      	ldr	x4, [x0, #0x8]
    9dcc:      	cmp	x2, x4
    9dd0:      	b.ge	0x9e5c <_stogir.checked.projection+0xcc>
    9dd4:      	add	x4, x0, #0x78
    9dd8:      	ldr	x4, [x4, #0x8]
    9ddc:      	cmp	x2, x4
    9de0:      	b.ge	0x9fb4 <_stogir.checked.projection+0x224>
    9de4:      	lsl	x4, x2, #2
    9de8:      	ldr	x6, [x0, #0x78]
    9dec:      	add	x4, x4, x6
    9df0:      	ldr	w4, [x4]
    9df4:      	sxtw	x4, w4
    9df8:      	cmp	x4, #0x0
    9dfc:      	cset	w4, ge
    9e00:      	ubfx	x4, x4, #0, #8
    9e04:      	b	0x9fb8 <_stogir.checked.projection+0x228>
    9e08:      	cmp	x2, #0x0
    9e0c:      	b.ge	0x9e64 <_stogir.checked.projection+0xd4>
    9e10:      	add	x6, x0, #0x28
    9e14:      	add	x7, x0, #0x50
    9e18:      	ldr	x6, [x6, #0x8]
    9e1c:      	ldr	x7, [x7, #0x8]
    9e20:      	cmp	x6, x7
    9e24:      	b.ne	0x9e54 <_stogir.checked.projection+0xc4>
    9e28:      	cmp	x4, x6
    9e2c:      	b.gt	0x9ff0 <_stogir.checked.projection+0x260>
    9e30:      	lsl	x4, x5, #2
    9e34:      	ldr	x6, [x0, #0x50]
    9e38:      	add	x4, x4, x6
    9e3c:      	ldr	w4, [x4]
    9e40:      	sxtw	x4, w4
    9e44:      	cmp	x4, #0x0
    9e48:      	cset	w4, gt
    9e4c:      	ubfx	x4, x4, #0, #8
    9e50:      	b	0x9ff4 <_stogir.checked.projection+0x264>
    9e54:      	movz	x4, #0x0, lsl #48
    9e58:      	b	0x9e68 <_stogir.checked.projection+0xd8>
    9e5c:      	movz	x4, #0x0, lsl #48
    9e60:      	b	0x9e68 <_stogir.checked.projection+0xd8>
    9e64:      	movz	x4, #0x0, lsl #48
    9e68:      	cmp	x4, #0x0
    9e6c:      	b.eq	0x9ed0 <_stogir.checked.projection+0x140>
    9e70:      	uxtb	w16, w3
    9e74:      	cmp	w16, wzr
    9e78:      	b.eq	0x9ea0 <_stogir.checked.projection+0x110>
    9e7c:      	lsl	x2, x2, #4
    9e80:      	ldr	x3, [x0]
    9e84:      	add	x2, x2, x3
    9e88:      	ldr	x3, [x2]
    9e8c:      	ldr	x2, [x2, #0x8]
    9e90:      	fmov	d31, x2
    9e94:      	mov	x2, x3
    9e98:      	fmov	x3, d31
    9e9c:      	b	0x9ec0 <_stogir.checked.projection+0x130>
    9ea0:      	lsl	x2, x5, #4
    9ea4:      	ldr	x3, [x0, #0x28]
    9ea8:      	add	x2, x2, x3
    9eac:      	ldr	x3, [x2]
    9eb0:      	ldr	x2, [x2, #0x8]
    9eb4:      	fmov	d31, x2
    9eb8:      	mov	x2, x3
    9ebc:      	fmov	x3, d31
    9ec0:      	mov	x4, x3
    9ec4:      	mov	x3, x2
    9ec8:      	mov	x2, #0x1                ; =1
    9ecc:      	b	0x9edc <_stogir.checked.projection+0x14c>
    9ed0:      	movz	x2, #0x0, lsl #48
    9ed4:      	movz	x3, #0x0, lsl #48
    9ed8:      	movz	x4, #0x0, lsl #48
    9edc:      	lsr	w2, w2, #0
    9ee0:      	lsr	x16, x2, #0
    9ee4:      	cmp	x16, #0x1
    9ee8:      	b.eq	0x9f04 <_stogir.checked.projection+0x174>
    9eec:      	b.lo	0x9ef4 <_stogir.checked.projection+0x164>
    9ef0:      	b	0x9f08 <_stogir.checked.projection+0x178>
    9ef4:      	cmp	x16, #0x0
    9ef8:      	b.eq	0x9f00 <_stogir.checked.projection+0x170>
    9efc:      	b	0x9f08 <_stogir.checked.projection+0x178>
    9f00:      	b	0x9f0c <_stogir.checked.projection+0x17c>
    9f04:      	b	0x9f64 <_stogir.checked.projection+0x1d4>
    9f08:      	b	0x9ff8 <_stogir.checked.projection+0x268>
    9f0c:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		0000000000009f0c:  ARM64_RELOC_PAGE21	l_stogir.418
    9f10:      	ldr	x16, [x16]
		0000000000009f10:  ARM64_RELOC_PAGEOFF12	l_stogir.418
    9f14:      	orr	x0, x16, xzr
    9f18:      	mov	x19, x8
    9f1c:      	mov	x1, x0
    9f20:      	mov	x0, #0x1                ; =1
    9f24:      	mov	x2, #0x17               ; =23
    9f28:      	b	0x9f44 <_stogir.checked.projection+0x1b4>
    9f2c:      	adrp	x16, 0x9000 <_stogir.vector-arithmetic.validate+0x10c>
		0000000000009f2c:  ARM64_RELOC_PAGE21	l_stogir.419
    9f30:      	ldr	x16, [x16]
		0000000000009f30:  ARM64_RELOC_PAGEOFF12	l_stogir.419
    9f34:      	orr	x0, x16, xzr
    9f38:      	mov	x1, x0
    9f3c:      	mov	x0, #0x1                ; =1
    9f40:      	mov	x2, #0x20               ; =32
    9f44:      	str	x0, [x19]
    9f48:      	str	x1, [x19, #0x8]
    9f4c:      	str	x2, [x19, #0x10]
    9f50:      	ldr	x19, [sp, #0x40]
    9f54:      	ldr	x29, [sp]
    9f58:      	ldr	x30, [sp, #0x8]
    9f5c:      	add	sp, sp, #0x50
    9f60:      	ret
    9f64:      	uxtb	w2, w3
    9f68:      	add	x16, sp, #0x10
    9f6c:      	str	x3, [x16]
    9f70:      	add	x16, sp, #0x10
    9f74:      	str	x4, [x16, #0x8]
    9f78:      	cmp	x2, #0x29
    9f7c:      	b.lt	0xa000 <_stogir.checked.projection+0x270>
    9f80:      	cmp	x2, #0x2b
    9f84:      	b.gt	0xa008 <_stogir.checked.projection+0x278>
    9f88:      	lsr	w1, w1, #0
    9f8c:      	mov	x19, x8
    9f90:      	add	x8, sp, #0x20
    9f94:      	bl	0x9f94 <_stogir.checked.projection+0x204>
		0000000000009f94:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    9f98:      	add	x16, sp, #0x20
    9f9c:      	ldr	x0, [x16]
    9fa0:      	add	x16, sp, #0x20
    9fa4:      	ldr	x1, [x16, #0x8]
    9fa8:      	add	x16, sp, #0x20
    9fac:      	ldr	x2, [x16, #0x10]
    9fb0:      	b	0x9f44 <_stogir.checked.projection+0x1b4>
    9fb4:      	movz	x4, #0x0, lsl #48
    9fb8:      	b	0x9e60 <_stogir.checked.projection+0xd0>
    9fbc:      	add	x16, sp, #0x10
    9fc0:      	ldr	w0, [x16]
    9fc4:      	orr	x1, x0, xzr
    9fc8:      	ubfx	x1, x1, #8, #8
    9fcc:      	cmp	x1, #0x0
    9fd0:      	b.eq	0x9f2c <_stogir.checked.projection+0x19c>
    9fd4:      	ubfx	x0, x0, #8, #8
    9fd8:      	cmp	x0, #0xd
    9fdc:      	b.gt	0x9f2c <_stogir.checked.projection+0x19c>
    9fe0:      	movz	x0, #0x0, lsl #48
    9fe4:      	movz	x1, #0x0, lsl #48
    9fe8:      	movz	x2, #0x0, lsl #48
    9fec:      	b	0x9f44 <_stogir.checked.projection+0x1b4>
    9ff0:      	movz	x4, #0x0, lsl #48
    9ff4:      	b	0x9e58 <_stogir.checked.projection+0xc8>
    9ff8:      	brk	#0
    9ffc:      	b	0x9ff8 <_stogir.checked.projection+0x268>
    a000:      	mov	x19, x8
    a004:      	b	0x9fbc <_stogir.checked.projection+0x22c>
    a008:      	mov	x19, x8
    a00c:      	b	0x9fbc <_stogir.checked.projection+0x22c>

000000000000a010 <_stogir.checked.operands>:
    a010:      	sub	sp, sp, #0x50
    a014:      	str	x29, [sp]
    a018:      	str	x30, [sp, #0x8]
    a01c:      	mov	x29, sp
    a020:      	str	x19, [sp, #0x30]
    a024:      	str	x20, [sp, #0x38]
    a028:      	str	x21, [sp, #0x40]
    a02c:      	str	x22, [sp, #0x48]
    a030:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a030:  ARM64_RELOC_PAGE21	l_stogir.420
    a034:      	ldr	x16, [x16]
		000000000000a034:  ARM64_RELOC_PAGEOFF12	l_stogir.420
    a038:      	orr	x5, x16, xzr
    a03c:      	sxtw	x1, w1
    a040:      	sxtw	x19, w2
    a044:      	cmp	x1, #0x29
    a048:      	b.lt	0xa088 <_stogir.checked.operands+0x78>
    a04c:      	cmp	x1, #0x2b
    a050:      	b.gt	0xa088 <_stogir.checked.operands+0x78>
    a054:      	cmp	x19, #0x1
    a058:      	b.lt	0xa088 <_stogir.checked.operands+0x78>
    a05c:      	cmp	x19, #0xb
    a060:      	b.gt	0xa088 <_stogir.checked.operands+0x78>
    a064:      	cmp	x19, #0x1
    a068:      	b.eq	0xa088 <_stogir.checked.operands+0x78>
    a06c:      	mov	x1, x5
    a070:      	movz	x2, #0x0, lsl #48
    a074:      	b	0xa098 <_stogir.checked.operands+0x88>
    a078:      	movz	x4, #0x0, lsl #48
    a07c:      	b	0xa100 <_stogir.checked.operands+0xf0>
    a080:      	movz	x4, #0x0, lsl #48
    a084:      	b	0xa114 <_stogir.checked.operands+0x104>
    a088:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a088:  ARM64_RELOC_PAGE21	l_stogir.421
    a08c:      	ldr	x16, [x16]
		000000000000a08c:  ARM64_RELOC_PAGEOFF12	l_stogir.421
    a090:      	orr	x1, x16, xzr
    a094:      	mov	x2, #0x36               ; =54
    a098:      	add	x16, sp, #0x20
    a09c:      	orr	x6, x16, xzr
    a0a0:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a0a0:  ARM64_RELOC_PAGE21	l_stogir.422
    a0a4:      	ldr	x16, [x16]
		000000000000a0a4:  ARM64_RELOC_PAGEOFF12	l_stogir.422
    a0a8:      	orr	x7, x16, xzr
    a0ac:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a0ac:  ARM64_RELOC_PAGE21	l_stogir.423
    a0b0:      	ldr	x16, [x16]
		000000000000a0b0:  ARM64_RELOC_PAGEOFF12	l_stogir.423
    a0b4:      	orr	x9, x16, xzr
    a0b8:      	lsr	w3, w3, #0
    a0bc:      	lsr	w4, w4, #0
    a0c0:      	add	x10, x0, #0x78
    a0c4:      	add	x11, x0, #0x28
    a0c8:      	add	x12, x0, #0x50
    a0cc:      	add	x16, sp, #0x10
    a0d0:      	str	w3, [x16]
    a0d4:      	add	x16, sp, #0x10
    a0d8:      	str	w4, [x16, #0x4]
    a0dc:      	add	x16, sp, #0x10
    a0e0:      	ldr	x3, [x16]
    a0e4:      	add	x16, sp, #0x20
    a0e8:      	str	x3, [x16]
    a0ec:      	mov	x20, x1
    a0f0:      	mov	x21, x2
    a0f4:      	movz	x1, #0x0, lsl #48
    a0f8:      	b	0xa1bc <_stogir.checked.operands+0x1ac>
    a0fc:      	movz	x4, #0x0, lsl #48
    a100:      	fmov	d31, x3
    a104:      	mov	x3, x4
    a108:      	fmov	x4, d31
    a10c:      	b	0xa120 <_stogir.checked.operands+0x110>
    a110:      	movz	x4, #0x0, lsl #48
    a114:      	fmov	d31, x3
    a118:      	mov	x3, x4
    a11c:      	fmov	x4, d31
    a120:      	cmp	x3, #0x0
    a124:      	b.eq	0xa164 <_stogir.checked.operands+0x154>
    a128:      	uxtb	w16, w1
    a12c:      	cmp	w16, wzr
    a130:      	b.eq	0xa148 <_stogir.checked.operands+0x138>
    a134:      	lsl	x1, x2, #4
    a138:      	ldr	x2, [x0]
    a13c:      	add	x1, x1, x2
    a140:      	ldr	x1, [x1]
    a144:      	b	0xa158 <_stogir.checked.operands+0x148>
    a148:      	lsl	x1, x13, #4
    a14c:      	ldr	x2, [x0, #0x28]
    a150:      	add	x1, x1, x2
    a154:      	ldr	x1, [x1]
    a158:      	mov	x2, x1
    a15c:      	mov	x1, #0x1                ; =1
    a160:      	b	0xa16c <_stogir.checked.operands+0x15c>
    a164:      	movz	x1, #0x0, lsl #48
    a168:      	movz	x2, #0x0, lsl #48
    a16c:      	lsr	w1, w1, #0
    a170:      	lsr	x16, x1, #0
    a174:      	cmp	x16, #0x1
    a178:      	b.eq	0xa194 <_stogir.checked.operands+0x184>
    a17c:      	b.lo	0xa184 <_stogir.checked.operands+0x174>
    a180:      	b	0xa198 <_stogir.checked.operands+0x188>
    a184:      	cmp	x16, #0x0
    a188:      	b.eq	0xa190 <_stogir.checked.operands+0x180>
    a18c:      	b	0xa198 <_stogir.checked.operands+0x188>
    a190:      	b	0xa19c <_stogir.checked.operands+0x18c>
    a194:      	b	0xa358 <_stogir.checked.operands+0x348>
    a198:      	b	0xa384 <_stogir.checked.operands+0x374>
    a19c:      	mov	x1, x7
    a1a0:      	mov	x2, #0x22               ; =34
    a1a4:      	b	0xa1b0 <_stogir.checked.operands+0x1a0>
    a1a8:      	mov	x1, x9
    a1ac:      	mov	x2, #0x28               ; =40
    a1b0:      	mov	x20, x1
    a1b4:      	mov	x21, x2
    a1b8:      	mov	x1, x4
    a1bc:      	cmp	x1, #0x2
    a1c0:      	b.ge	0xa1ec <_stogir.checked.operands+0x1dc>
    a1c4:      	add	x2, x1, #0x1
    a1c8:      	lsl	x1, x1, #2
    a1cc:      	add	x1, x1, x6
    a1d0:      	ldr	w1, [x1]
    a1d4:      	sxtw	x1, w1
    a1d8:      	and	x1, x1, #0xffffffff
    a1dc:      	mov	x3, x2
    a1e0:      	mov	x2, x1
    a1e4:      	mov	x1, #0x1                ; =1
    a1e8:      	b	0xa1f8 <_stogir.checked.operands+0x1e8>
    a1ec:      	mov	x3, x1
    a1f0:      	movz	x1, #0x0, lsl #48
    a1f4:      	movz	x2, #0x0, lsl #48
    a1f8:      	lsr	w1, w1, #0
    a1fc:      	lsr	x16, x1, #0
    a200:      	cmp	x16, #0x1
    a204:      	b.eq	0xa220 <_stogir.checked.operands+0x210>
    a208:      	b.lo	0xa210 <_stogir.checked.operands+0x200>
    a20c:      	b	0xa224 <_stogir.checked.operands+0x214>
    a210:      	cmp	x16, #0x0
    a214:      	b.eq	0xa21c <_stogir.checked.operands+0x20c>
    a218:      	b	0xa224 <_stogir.checked.operands+0x214>
    a21c:      	b	0xa28c <_stogir.checked.operands+0x27c>
    a220:      	b	0xa228 <_stogir.checked.operands+0x218>
    a224:      	b	0xa37c <_stogir.checked.operands+0x36c>
    a228:      	lsr	w2, w2, #0
    a22c:      	sxtw	x2, w2
    a230:      	cmp	x2, #0x0
    a234:      	cset	w1, gt
    a238:      	movz	x16, #0x0, lsl #48
    a23c:      	sub	x4, x16, x2
    a240:      	sub	x13, x4, #0x1
    a244:      	uxtb	w16, w1
    a248:      	cmp	w16, wzr
    a24c:      	b.eq	0xa2b4 <_stogir.checked.operands+0x2a4>
    a250:      	ldr	x4, [x0, #0x8]
    a254:      	cmp	x2, x4
    a258:      	b.ge	0xa0fc <_stogir.checked.operands+0xec>
    a25c:      	ldr	x4, [x10, #0x8]
    a260:      	cmp	x2, x4
    a264:      	b.ge	0xa078 <_stogir.checked.operands+0x68>
    a268:      	lsl	x4, x2, #2
    a26c:      	ldr	x14, [x0, #0x78]
    a270:      	add	x4, x4, x14
    a274:      	ldr	w4, [x4]
    a278:      	sxtw	x4, w4
    a27c:      	cmp	x4, #0x0
    a280:      	cset	w4, ge
    a284:      	ubfx	x4, x4, #0, #8
    a288:      	b	0xa07c <_stogir.checked.operands+0x6c>
    a28c:      	cmp	x21, #0x0
    a290:      	b.ne	0xa38c <_stogir.checked.operands+0x37c>
    a294:      	cmp	x21, #0x0
    a298:      	b.ne	0xa2f8 <_stogir.checked.operands+0x2e8>
    a29c:      	mov	x22, x8
    a2a0:      	and	x0, x19, #0xffffffff
    a2a4:      	mov	x1, x0
    a2a8:      	movz	x0, #0x0, lsl #48
    a2ac:      	movz	x2, #0x0, lsl #48
    a2b0:      	b	0xa32c <_stogir.checked.operands+0x31c>
    a2b4:      	cmp	x2, #0x0
    a2b8:      	b.ge	0xa110 <_stogir.checked.operands+0x100>
    a2bc:      	ldr	x14, [x11, #0x8]
    a2c0:      	ldr	x15, [x12, #0x8]
    a2c4:      	cmp	x14, x15
    a2c8:      	b.ne	0xa080 <_stogir.checked.operands+0x70>
    a2cc:      	cmp	x4, x14
    a2d0:      	b.gt	0xa374 <_stogir.checked.operands+0x364>
    a2d4:      	lsl	x4, x13, #2
    a2d8:      	ldr	x14, [x0, #0x50]
    a2dc:      	add	x4, x4, x14
    a2e0:      	ldr	w4, [x4]
    a2e4:      	sxtw	x4, w4
    a2e8:      	cmp	x4, #0x0
    a2ec:      	cset	w4, gt
    a2f0:      	ubfx	x4, x4, #0, #8
    a2f4:      	b	0xa378 <_stogir.checked.operands+0x368>
    a2f8:      	lsr	x0, x21, #0
    a2fc:      	mov	x1, x5
    a300:      	mov	x2, x0
    a304:      	mov	x0, x20
    a308:      	mov	x22, x8
    a30c:      	bl	0xa30c <_stogir.checked.operands+0x2fc>
		000000000000a30c:  ARM64_RELOC_BRANCH26	_memcmp
    a310:      	lsr	w0, w0, #0
    a314:      	sxtw	x0, w0
    a318:      	cmp	x0, #0x0
    a31c:      	b.eq	0xa2a0 <_stogir.checked.operands+0x290>
    a320:      	mov	x1, x20
    a324:      	mov	x2, x21
    a328:      	mov	x0, #0x1                ; =1
    a32c:      	str	x0, [x22]
    a330:      	str	x1, [x22, #0x8]
    a334:      	str	x2, [x22, #0x10]
    a338:      	ldr	x19, [sp, #0x30]
    a33c:      	ldr	x20, [sp, #0x38]
    a340:      	ldr	x21, [sp, #0x40]
    a344:      	ldr	x22, [sp, #0x48]
    a348:      	ldr	x29, [sp]
    a34c:      	ldr	x30, [sp, #0x8]
    a350:      	add	sp, sp, #0x50
    a354:      	ret
    a358:      	lsr	w2, w2, #0
    a35c:      	ubfx	x1, x2, #8, #8
    a360:      	cmp	x1, x19
    a364:      	b.ne	0xa1a8 <_stogir.checked.operands+0x198>
    a368:      	mov	x1, x20
    a36c:      	mov	x2, x21
    a370:      	b	0xa1b0 <_stogir.checked.operands+0x1a0>
    a374:      	movz	x4, #0x0, lsl #48
    a378:      	b	0xa084 <_stogir.checked.operands+0x74>
    a37c:      	brk	#0
    a380:      	b	0xa37c <_stogir.checked.operands+0x36c>
    a384:      	brk	#0
    a388:      	b	0xa384 <_stogir.checked.operands+0x374>
    a38c:      	mov	x22, x8
    a390:      	b	0xa320 <_stogir.checked.operands+0x310>

000000000000a394 <_stogir.opcode.control?>:
    a394:      	sxtw	x0, w0
    a398:      	cmp	x0, #0x0
    a39c:      	b.lt	0xa3c4 <_stogir.opcode.control?+0x30>
    a3a0:      	cmp	x0, #0x83
    a3a4:      	b.ge	0xa3c4 <_stogir.opcode.control?+0x30>
    a3a8:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a3a8:  ARM64_RELOC_PAGE21	l_stogir.424
    a3ac:      	ldr	x16, [x16]
		000000000000a3ac:  ARM64_RELOC_PAGEOFF12	l_stogir.424
    a3b0:      	orr	x1, x16, xzr
    a3b4:      	lsr	x0, x0, #0
    a3b8:      	add	x0, x0, x1
    a3bc:      	ldrb	w0, [x0]
    a3c0:      	b	0xa3c8 <_stogir.opcode.control?+0x34>
    a3c4:      	movz	x0, #0x0, lsl #48
    a3c8:      	uxtb	w0, w0
    a3cc:      	and	x0, x0, #0x1
    a3d0:      	uxtb	w0, w0
    a3d4:      	ret

000000000000a3d8 <_stogir.opcode.block-end?>:
    a3d8:      	sxtw	x0, w0
    a3dc:      	cmp	x0, #0x0
    a3e0:      	b.lt	0xa408 <_stogir.opcode.block-end?+0x30>
    a3e4:      	cmp	x0, #0x83
    a3e8:      	b.ge	0xa408 <_stogir.opcode.block-end?+0x30>
    a3ec:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a3ec:  ARM64_RELOC_PAGE21	l_stogir.425
    a3f0:      	ldr	x16, [x16]
		000000000000a3f0:  ARM64_RELOC_PAGEOFF12	l_stogir.425
    a3f4:      	orr	x1, x16, xzr
    a3f8:      	lsr	x0, x0, #0
    a3fc:      	add	x0, x0, x1
    a400:      	ldrb	w0, [x0]
    a404:      	b	0xa40c <_stogir.opcode.block-end?+0x34>
    a408:      	movz	x0, #0x0, lsl #48
    a40c:      	uxtb	w0, w0
    a410:      	and	x0, x0, #0x4
    a414:      	uxtb	w0, w0
    a418:      	cmp	x0, #0x0
    a41c:      	cset	w0, eq
    a420:      	uxtb	w16, w0
    a424:      	cmp	w16, wzr
    a428:      	cset	x0, eq
    a42c:      	ret

000000000000a430 <_stogir.atomic.ordinary?>:
    a430:      	sxtw	x1, w1
    a434:      	cmp	x1, #0x0
    a438:      	cset	w3, gt
    a43c:      	movz	x16, #0x0, lsl #48
    a440:      	sub	x4, x16, x1
    a444:      	sub	x5, x4, #0x1
    a448:      	uxtb	w16, w3
    a44c:      	cmp	w16, wzr
    a450:      	b.eq	0xa494 <_stogir.atomic.ordinary?+0x64>
    a454:      	ldr	x4, [x0, #0x8]
    a458:      	cmp	x1, x4
    a45c:      	b.ge	0xa4e8 <_stogir.atomic.ordinary?+0xb8>
    a460:      	add	x4, x0, #0x78
    a464:      	ldr	x4, [x4, #0x8]
    a468:      	cmp	x1, x4
    a46c:      	b.ge	0xa5a8 <_stogir.atomic.ordinary?+0x178>
    a470:      	lsl	x4, x1, #2
    a474:      	ldr	x6, [x0, #0x78]
    a478:      	add	x4, x4, x6
    a47c:      	ldr	w4, [x4]
    a480:      	sxtw	x4, w4
    a484:      	cmp	x4, #0x0
    a488:      	cset	w4, ge
    a48c:      	ubfx	x4, x4, #0, #8
    a490:      	b	0xa5ac <_stogir.atomic.ordinary?+0x17c>
    a494:      	cmp	x1, #0x0
    a498:      	b.ge	0xa4f0 <_stogir.atomic.ordinary?+0xc0>
    a49c:      	add	x6, x0, #0x28
    a4a0:      	add	x7, x0, #0x50
    a4a4:      	ldr	x6, [x6, #0x8]
    a4a8:      	ldr	x7, [x7, #0x8]
    a4ac:      	cmp	x6, x7
    a4b0:      	b.ne	0xa4e0 <_stogir.atomic.ordinary?+0xb0>
    a4b4:      	cmp	x4, x6
    a4b8:      	b.gt	0xa5c8 <_stogir.atomic.ordinary?+0x198>
    a4bc:      	lsl	x4, x5, #2
    a4c0:      	ldr	x6, [x0, #0x50]
    a4c4:      	add	x4, x4, x6
    a4c8:      	ldr	w4, [x4]
    a4cc:      	sxtw	x4, w4
    a4d0:      	cmp	x4, #0x0
    a4d4:      	cset	w4, gt
    a4d8:      	ubfx	x4, x4, #0, #8
    a4dc:      	b	0xa5cc <_stogir.atomic.ordinary?+0x19c>
    a4e0:      	movz	x4, #0x0, lsl #48
    a4e4:      	b	0xa4f4 <_stogir.atomic.ordinary?+0xc4>
    a4e8:      	movz	x4, #0x0, lsl #48
    a4ec:      	b	0xa4f4 <_stogir.atomic.ordinary?+0xc4>
    a4f0:      	movz	x4, #0x0, lsl #48
    a4f4:      	cmp	x4, #0x0
    a4f8:      	b.eq	0xa538 <_stogir.atomic.ordinary?+0x108>
    a4fc:      	uxtb	w16, w3
    a500:      	cmp	w16, wzr
    a504:      	b.eq	0xa51c <_stogir.atomic.ordinary?+0xec>
    a508:      	lsl	x1, x1, #4
    a50c:      	ldr	x0, [x0]
    a510:      	add	x0, x1, x0
    a514:      	ldr	x0, [x0]
    a518:      	b	0xa52c <_stogir.atomic.ordinary?+0xfc>
    a51c:      	lsl	x1, x5, #4
    a520:      	ldr	x0, [x0, #0x28]
    a524:      	add	x0, x1, x0
    a528:      	ldr	x0, [x0]
    a52c:      	mov	x1, x0
    a530:      	mov	x0, #0x1                ; =1
    a534:      	b	0xa540 <_stogir.atomic.ordinary?+0x110>
    a538:      	movz	x0, #0x0, lsl #48
    a53c:      	movz	x1, #0x0, lsl #48
    a540:      	lsr	w0, w0, #0
    a544:      	lsr	x16, x0, #0
    a548:      	cmp	x16, #0x1
    a54c:      	b.eq	0xa568 <_stogir.atomic.ordinary?+0x138>
    a550:      	b.lo	0xa558 <_stogir.atomic.ordinary?+0x128>
    a554:      	b	0xa56c <_stogir.atomic.ordinary?+0x13c>
    a558:      	cmp	x16, #0x0
    a55c:      	b.eq	0xa564 <_stogir.atomic.ordinary?+0x134>
    a560:      	b	0xa56c <_stogir.atomic.ordinary?+0x13c>
    a564:      	b	0xa570 <_stogir.atomic.ordinary?+0x140>
    a568:      	b	0xa580 <_stogir.atomic.ordinary?+0x150>
    a56c:      	b	0xa5d0 <_stogir.atomic.ordinary?+0x1a0>
    a570:      	movz	x0, #0x0, lsl #48
    a574:      	b	0xa57c <_stogir.atomic.ordinary?+0x14c>
    a578:      	movz	x0, #0x0, lsl #48
    a57c:      	ret
    a580:      	sxtw	x2, w2
    a584:      	lsr	w0, w1, #0
    a588:      	ubfx	x0, x0, #8, #8
    a58c:      	cmp	x0, x2
    a590:      	b.ne	0xa578 <_stogir.atomic.ordinary?+0x148>
    a594:      	uxtb	w1, w1
    a598:      	cmp	x1, #0x46
    a59c:      	b.ne	0xa5b0 <_stogir.atomic.ordinary?+0x180>
    a5a0:      	movz	x0, #0x0, lsl #48
    a5a4:      	b	0xa5c4 <_stogir.atomic.ordinary?+0x194>
    a5a8:      	movz	x4, #0x0, lsl #48
    a5ac:      	b	0xa4ec <_stogir.atomic.ordinary?+0xbc>
    a5b0:      	cmp	x1, #0x48
    a5b4:      	cset	w0, eq
    a5b8:      	uxtb	w16, w0
    a5bc:      	cmp	w16, wzr
    a5c0:      	cset	x0, eq
    a5c4:      	b	0xa57c <_stogir.atomic.ordinary?+0x14c>
    a5c8:      	movz	x4, #0x0, lsl #48
    a5cc:      	b	0xa4e4 <_stogir.atomic.ordinary?+0xb4>
    a5d0:      	brk	#0
    a5d4:      	b	0xa5d0 <_stogir.atomic.ordinary?+0x1a0>

000000000000a5d8 <_stogir.types.scalar-size>:
    a5d8:      	sxtw	x1, w1
    a5dc:      	cmp	x1, #0x4
    a5e0:      	b.eq	0xa5f4 <_stogir.types.scalar-size+0x1c>
    a5e4:      	cmp	x1, #0x8
    a5e8:      	b.eq	0xa5f4 <_stogir.types.scalar-size+0x1c>
    a5ec:      	movn	x0, #0x0, lsl #48
    a5f0:      	b	0xa60c <_stogir.types.scalar-size+0x34>
    a5f4:      	sxtw	x0, w0
    a5f8:      	cmp	x0, #0x0
    a5fc:      	b.ne	0xa610 <_stogir.types.scalar-size+0x38>
    a600:      	movz	x0, #0x0, lsl #48
    a604:      	b	0xa60c <_stogir.types.scalar-size+0x34>
    a608:      	mov	x0, #0x1                ; =1
    a60c:      	ret
    a610:      	cmp	x0, #0x1
    a614:      	b.eq	0xa608 <_stogir.types.scalar-size+0x30>
    a618:      	cmp	x0, #0x2
    a61c:      	b.eq	0xa608 <_stogir.types.scalar-size+0x30>
    a620:      	cmp	x0, #0x7
    a624:      	b.eq	0xa608 <_stogir.types.scalar-size+0x30>
    a628:      	cmp	x0, #0x8
    a62c:      	b.eq	0xa608 <_stogir.types.scalar-size+0x30>
    a630:      	cmp	x0, #0x3
    a634:      	b.eq	0xa680 <_stogir.types.scalar-size+0xa8>
    a638:      	cmp	x0, #0x9
    a63c:      	b.eq	0xa680 <_stogir.types.scalar-size+0xa8>
    a640:      	cmp	x0, #0x4
    a644:      	b.eq	0xa688 <_stogir.types.scalar-size+0xb0>
    a648:      	cmp	x0, #0xa
    a64c:      	b.eq	0xa688 <_stogir.types.scalar-size+0xb0>
    a650:      	cmp	x0, #0xd
    a654:      	b.eq	0xa688 <_stogir.types.scalar-size+0xb0>
    a658:      	cmp	x0, #0x5
    a65c:      	b.eq	0xa690 <_stogir.types.scalar-size+0xb8>
    a660:      	cmp	x0, #0xb
    a664:      	b.eq	0xa690 <_stogir.types.scalar-size+0xb8>
    a668:      	cmp	x0, #0xc
    a66c:      	b.eq	0xa690 <_stogir.types.scalar-size+0xb8>
    a670:      	cmp	x0, #0x6
    a674:      	b.ne	0xa698 <_stogir.types.scalar-size+0xc0>
    a678:      	mov	x0, x1
    a67c:      	b	0xa69c <_stogir.types.scalar-size+0xc4>
    a680:      	mov	x0, #0x2                ; =2
    a684:      	b	0xa60c <_stogir.types.scalar-size+0x34>
    a688:      	mov	x0, #0x4                ; =4
    a68c:      	b	0xa684 <_stogir.types.scalar-size+0xac>
    a690:      	mov	x0, #0x8                ; =8
    a694:      	b	0xa68c <_stogir.types.scalar-size+0xb4>
    a698:      	movn	x0, #0x0, lsl #48
    a69c:      	b	0xa694 <_stogir.types.scalar-size+0xbc>

000000000000a6a0 <_stogir.terminal.inputs>:
    a6a0:      	sub	sp, sp, #0x10
    a6a4:      	sxtw	x1, w1
    a6a8:      	cmp	x1, #0x60
    a6ac:      	cset	w4, eq
    a6b0:      	uxtb	w16, w4
    a6b4:      	cmp	w16, wzr
    a6b8:      	b.ne	0xa6f0 <_stogir.terminal.inputs+0x50>
    a6bc:      	cmp	x1, #0x79
    a6c0:      	b.eq	0xa6f0 <_stogir.terminal.inputs+0x50>
    a6c4:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a6c4:  ARM64_RELOC_PAGE21	l_stogir.426
    a6c8:      	ldr	x16, [x16]
		000000000000a6c8:  ARM64_RELOC_PAGEOFF12	l_stogir.426
    a6cc:      	orr	x0, x16, xzr
    a6d0:      	mov	x1, x0
    a6d4:      	mov	x0, #0x1                ; =1
    a6d8:      	mov	x2, #0x25               ; =37
    a6dc:      	str	x0, [x8]
    a6e0:      	str	x1, [x8, #0x8]
    a6e4:      	str	x2, [x8, #0x10]
    a6e8:      	add	sp, sp, #0x10
    a6ec:      	ret
    a6f0:      	sxtw	x3, w3
    a6f4:      	uxtb	w16, w4
    a6f8:      	cmp	w16, wzr
    a6fc:      	b.eq	0xa708 <_stogir.terminal.inputs+0x68>
    a700:      	cmp	x3, #0x0
    a704:      	b.ne	0xa6c4 <_stogir.terminal.inputs+0x24>
    a708:      	sxtw	x2, w2
    a70c:      	cmp	x2, #0x0
    a710:      	cset	w1, gt
    a714:      	movz	x16, #0x0, lsl #48
    a718:      	sub	x4, x16, x2
    a71c:      	sub	x5, x4, #0x1
    a720:      	uxtb	w16, w1
    a724:      	cmp	w16, wzr
    a728:      	b.eq	0xa838 <_stogir.terminal.inputs+0x198>
    a72c:      	ldr	x4, [x0, #0x8]
    a730:      	cmp	x2, x4
    a734:      	b.ge	0xa830 <_stogir.terminal.inputs+0x190>
    a738:      	add	x4, x0, #0x78
    a73c:      	ldr	x4, [x4, #0x8]
    a740:      	cmp	x2, x4
    a744:      	b.ge	0xa8e4 <_stogir.terminal.inputs+0x244>
    a748:      	lsl	x4, x2, #2
    a74c:      	ldr	x6, [x0, #0x78]
    a750:      	add	x4, x4, x6
    a754:      	ldr	w4, [x4]
    a758:      	sxtw	x4, w4
    a75c:      	cmp	x4, #0x0
    a760:      	cset	w4, ge
    a764:      	ubfx	x4, x4, #0, #8
    a768:      	b	0xa8e8 <_stogir.terminal.inputs+0x248>
    a76c:      	movz	x1, #0x0, lsl #48
    a770:      	movz	x4, #0x0, lsl #48
    a774:      	movz	x5, #0x0, lsl #48
    a778:      	lsr	w1, w1, #0
    a77c:      	lsr	x16, x1, #0
    a780:      	cmp	x16, #0x1
    a784:      	b.eq	0xa7a0 <_stogir.terminal.inputs+0x100>
    a788:      	b.lo	0xa790 <_stogir.terminal.inputs+0xf0>
    a78c:      	b	0xa7a4 <_stogir.terminal.inputs+0x104>
    a790:      	cmp	x16, #0x0
    a794:      	b.eq	0xa79c <_stogir.terminal.inputs+0xfc>
    a798:      	b	0xa7a4 <_stogir.terminal.inputs+0x104>
    a79c:      	b	0xa7a8 <_stogir.terminal.inputs+0x108>
    a7a0:      	b	0xa884 <_stogir.terminal.inputs+0x1e4>
    a7a4:      	b	0xaa44 <_stogir.terminal.inputs+0x3a4>
    a7a8:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a7a8:  ARM64_RELOC_PAGE21	l_stogir.427
    a7ac:      	ldr	x16, [x16]
		000000000000a7ac:  ARM64_RELOC_PAGEOFF12	l_stogir.427
    a7b0:      	orr	x0, x16, xzr
    a7b4:      	mov	x1, x0
    a7b8:      	mov	x0, #0x1                ; =1
    a7bc:      	mov	x2, #0x1d               ; =29
    a7c0:      	b	0xa6dc <_stogir.terminal.inputs+0x3c>
    a7c4:      	lsl	x1, x5, #4
    a7c8:      	ldr	x4, [x0, #0x28]
    a7cc:      	add	x1, x1, x4
    a7d0:      	ldr	x4, [x1]
    a7d4:      	ldr	x1, [x1, #0x8]
    a7d8:      	fmov	d31, x1
    a7dc:      	mov	x1, x4
    a7e0:      	fmov	x4, d31
    a7e4:      	mov	x5, x4
    a7e8:      	mov	x4, x1
    a7ec:      	mov	x1, #0x1                ; =1
    a7f0:      	b	0xa778 <_stogir.terminal.inputs+0xd8>
    a7f4:      	movz	x4, #0x0, lsl #48
    a7f8:      	cmp	x4, #0x0
    a7fc:      	b.eq	0xa76c <_stogir.terminal.inputs+0xcc>
    a800:      	uxtb	w16, w1
    a804:      	cmp	w16, wzr
    a808:      	b.eq	0xa7c4 <_stogir.terminal.inputs+0x124>
    a80c:      	lsl	x1, x2, #4
    a810:      	ldr	x4, [x0]
    a814:      	add	x1, x1, x4
    a818:      	ldr	x4, [x1]
    a81c:      	ldr	x1, [x1, #0x8]
    a820:      	fmov	d31, x1
    a824:      	mov	x1, x4
    a828:      	fmov	x4, d31
    a82c:      	b	0xa7e4 <_stogir.terminal.inputs+0x144>
    a830:      	movz	x4, #0x0, lsl #48
    a834:      	b	0xa7f8 <_stogir.terminal.inputs+0x158>
    a838:      	cmp	x2, #0x0
    a83c:      	b.ge	0xa7f4 <_stogir.terminal.inputs+0x154>
    a840:      	add	x6, x0, #0x28
    a844:      	add	x7, x0, #0x50
    a848:      	ldr	x6, [x6, #0x8]
    a84c:      	ldr	x7, [x7, #0x8]
    a850:      	cmp	x6, x7
    a854:      	b.ne	0xa8dc <_stogir.terminal.inputs+0x23c>
    a858:      	cmp	x4, x6
    a85c:      	b.gt	0xa8ec <_stogir.terminal.inputs+0x24c>
    a860:      	lsl	x4, x5, #2
    a864:      	ldr	x6, [x0, #0x50]
    a868:      	add	x4, x4, x6
    a86c:      	ldr	w4, [x4]
    a870:      	sxtw	x4, w4
    a874:      	cmp	x4, #0x0
    a878:      	cset	w4, gt
    a87c:      	ubfx	x4, x4, #0, #8
    a880:      	b	0xa8f0 <_stogir.terminal.inputs+0x250>
    a884:      	mov	x16, sp
    a888:      	str	x4, [x16]
    a88c:      	mov	x16, sp
    a890:      	str	x5, [x16, #0x8]
    a894:      	cmp	x2, #0x0
    a898:      	b.le	0xa8c0 <_stogir.terminal.inputs+0x220>
    a89c:      	uxtb	w4, w4
    a8a0:      	cmp	x4, #0x83
    a8a4:      	b.ge	0xa8f4 <_stogir.terminal.inputs+0x254>
    a8a8:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a8a8:  ARM64_RELOC_PAGE21	l_stogir.428
    a8ac:      	ldr	x16, [x16]
		000000000000a8ac:  ARM64_RELOC_PAGEOFF12	l_stogir.428
    a8b0:      	orr	x1, x16, xzr
    a8b4:      	add	x1, x4, x1
    a8b8:      	ldrb	w1, [x1]
    a8bc:      	b	0xa8f8 <_stogir.terminal.inputs+0x258>
    a8c0:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a8c0:  ARM64_RELOC_PAGE21	l_stogir.429
    a8c4:      	ldr	x16, [x16]
		000000000000a8c4:  ARM64_RELOC_PAGEOFF12	l_stogir.429
    a8c8:      	orr	x0, x16, xzr
    a8cc:      	mov	x1, x0
    a8d0:      	mov	x0, #0x1                ; =1
    a8d4:      	mov	x2, #0x2c               ; =44
    a8d8:      	b	0xa7c0 <_stogir.terminal.inputs+0x120>
    a8dc:      	movz	x4, #0x0, lsl #48
    a8e0:      	b	0xa7f8 <_stogir.terminal.inputs+0x158>
    a8e4:      	movz	x4, #0x0, lsl #48
    a8e8:      	b	0xa834 <_stogir.terminal.inputs+0x194>
    a8ec:      	movz	x4, #0x0, lsl #48
    a8f0:      	b	0xa8e0 <_stogir.terminal.inputs+0x240>
    a8f4:      	movz	x1, #0x0, lsl #48
    a8f8:      	uxtb	w1, w1
    a8fc:      	and	x1, x1, #0x1
    a900:      	uxtb	w1, w1
    a904:      	cmp	x1, #0x0
    a908:      	b.eq	0xa8c0 <_stogir.terminal.inputs+0x220>
    a90c:      	mov	x16, sp
    a910:      	ldr	w1, [x16]
    a914:      	uxtb	w1, w1
    a918:      	cmp	x1, #0x83
    a91c:      	b.ge	0xa938 <_stogir.terminal.inputs+0x298>
    a920:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a920:  ARM64_RELOC_PAGE21	l_stogir.428
    a924:      	ldr	x16, [x16]
		000000000000a924:  ARM64_RELOC_PAGEOFF12	l_stogir.428
    a928:      	orr	x2, x16, xzr
    a92c:      	add	x1, x1, x2
    a930:      	ldrb	w1, [x1]
    a934:      	b	0xa93c <_stogir.terminal.inputs+0x29c>
    a938:      	movz	x1, #0x0, lsl #48
    a93c:      	uxtb	w1, w1
    a940:      	and	x1, x1, #0x4
    a944:      	uxtb	w1, w1
    a948:      	cmp	x1, #0x0
    a94c:      	cset	w1, eq
    a950:      	uxtb	w16, w1
    a954:      	cmp	w16, wzr
    a958:      	cset	x1, eq
    a95c:      	cmp	x1, #0x0
    a960:      	b.ne	0xa8c0 <_stogir.terminal.inputs+0x220>
    a964:      	cmp	x3, #0x0
    a968:      	b.ne	0xa97c <_stogir.terminal.inputs+0x2dc>
    a96c:      	movz	x0, #0x0, lsl #48
    a970:      	movz	x1, #0x0, lsl #48
    a974:      	movz	x2, #0x0, lsl #48
    a978:      	b	0xa8d8 <_stogir.terminal.inputs+0x238>
    a97c:      	cmp	x3, #0x0
    a980:      	cset	w1, gt
    a984:      	movz	x16, #0x0, lsl #48
    a988:      	sub	x2, x16, x3
    a98c:      	sub	x4, x2, #0x1
    a990:      	uxtb	w16, w1
    a994:      	cmp	w16, wzr
    a998:      	b.eq	0xa9f8 <_stogir.terminal.inputs+0x358>
    a99c:      	ldr	x2, [x0, #0x8]
    a9a0:      	cmp	x3, x2
    a9a4:      	b.ge	0xaa4c <_stogir.terminal.inputs+0x3ac>
    a9a8:      	add	x2, x0, #0x78
    a9ac:      	ldr	x2, [x2, #0x8]
    a9b0:      	cmp	x3, x2
    a9b4:      	b.ge	0xab24 <_stogir.terminal.inputs+0x484>
    a9b8:      	lsl	x2, x3, #2
    a9bc:      	ldr	x5, [x0, #0x78]
    a9c0:      	add	x2, x2, x5
    a9c4:      	ldr	w2, [x2]
    a9c8:      	sxtw	x2, w2
    a9cc:      	cmp	x2, #0x0
    a9d0:      	cset	w2, ge
    a9d4:      	ubfx	x2, x2, #0, #8
    a9d8:      	b	0xab28 <_stogir.terminal.inputs+0x488>
    a9dc:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000a9dc:  ARM64_RELOC_PAGE21	l_stogir.430
    a9e0:      	ldr	x16, [x16]
		000000000000a9e0:  ARM64_RELOC_PAGEOFF12	l_stogir.430
    a9e4:      	orr	x0, x16, xzr
    a9e8:      	mov	x1, x0
    a9ec:      	mov	x0, #0x1                ; =1
    a9f0:      	mov	x2, #0x2e               ; =46
    a9f4:      	b	0xa978 <_stogir.terminal.inputs+0x2d8>
    a9f8:      	cmp	x3, #0x0
    a9fc:      	b.ge	0xaa54 <_stogir.terminal.inputs+0x3b4>
    aa00:      	add	x5, x0, #0x28
    aa04:      	add	x6, x0, #0x50
    aa08:      	ldr	x5, [x5, #0x8]
    aa0c:      	ldr	x6, [x6, #0x8]
    aa10:      	cmp	x5, x6
    aa14:      	b.ne	0xab1c <_stogir.terminal.inputs+0x47c>
    aa18:      	cmp	x2, x5
    aa1c:      	b.gt	0xab2c <_stogir.terminal.inputs+0x48c>
    aa20:      	lsl	x2, x4, #2
    aa24:      	ldr	x5, [x0, #0x50]
    aa28:      	add	x2, x2, x5
    aa2c:      	ldr	w2, [x2]
    aa30:      	sxtw	x2, w2
    aa34:      	cmp	x2, #0x0
    aa38:      	cset	w2, gt
    aa3c:      	ubfx	x2, x2, #0, #8
    aa40:      	b	0xab30 <_stogir.terminal.inputs+0x490>
    aa44:      	brk	#0
    aa48:      	b	0xaa44 <_stogir.terminal.inputs+0x3a4>
    aa4c:      	movz	x2, #0x0, lsl #48
    aa50:      	b	0xaa58 <_stogir.terminal.inputs+0x3b8>
    aa54:      	movz	x2, #0x0, lsl #48
    aa58:      	cmp	x2, #0x0
    aa5c:      	b.eq	0xaa9c <_stogir.terminal.inputs+0x3fc>
    aa60:      	uxtb	w16, w1
    aa64:      	cmp	w16, wzr
    aa68:      	b.eq	0xaa80 <_stogir.terminal.inputs+0x3e0>
    aa6c:      	lsl	x1, x3, #4
    aa70:      	ldr	x0, [x0]
    aa74:      	add	x0, x1, x0
    aa78:      	ldr	x0, [x0]
    aa7c:      	b	0xaa90 <_stogir.terminal.inputs+0x3f0>
    aa80:      	lsl	x1, x4, #4
    aa84:      	ldr	x0, [x0, #0x28]
    aa88:      	add	x0, x1, x0
    aa8c:      	ldr	x0, [x0]
    aa90:      	mov	x1, x0
    aa94:      	mov	x0, #0x1                ; =1
    aa98:      	b	0xaaa4 <_stogir.terminal.inputs+0x404>
    aa9c:      	movz	x0, #0x0, lsl #48
    aaa0:      	movz	x1, #0x0, lsl #48
    aaa4:      	lsr	w0, w0, #0
    aaa8:      	lsr	x16, x0, #0
    aaac:      	cmp	x16, #0x1
    aab0:      	b.eq	0xaacc <_stogir.terminal.inputs+0x42c>
    aab4:      	b.lo	0xaabc <_stogir.terminal.inputs+0x41c>
    aab8:      	b	0xaad0 <_stogir.terminal.inputs+0x430>
    aabc:      	cmp	x16, #0x0
    aac0:      	b.eq	0xaac8 <_stogir.terminal.inputs+0x428>
    aac4:      	b	0xaad0 <_stogir.terminal.inputs+0x430>
    aac8:      	b	0xaad4 <_stogir.terminal.inputs+0x434>
    aacc:      	b	0xaaf0 <_stogir.terminal.inputs+0x450>
    aad0:      	b	0xab74 <_stogir.terminal.inputs+0x4d4>
    aad4:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000aad4:  ARM64_RELOC_PAGE21	l_stogir.431
    aad8:      	ldr	x16, [x16]
		000000000000aad8:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    aadc:      	orr	x0, x16, xzr
    aae0:      	mov	x1, x0
    aae4:      	mov	x0, #0x1                ; =1
    aae8:      	mov	x2, #0x1d               ; =29
    aaec:      	b	0xa9f4 <_stogir.terminal.inputs+0x354>
    aaf0:      	cmp	x3, #0x0
    aaf4:      	b.le	0xa9dc <_stogir.terminal.inputs+0x33c>
    aaf8:      	uxtb	w1, w1
    aafc:      	cmp	x1, #0x83
    ab00:      	b.ge	0xab34 <_stogir.terminal.inputs+0x494>
    ab04:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000ab04:  ARM64_RELOC_PAGE21	l_stogir.428
    ab08:      	ldr	x16, [x16]
		000000000000ab08:  ARM64_RELOC_PAGEOFF12	l_stogir.428
    ab0c:      	orr	x0, x16, xzr
    ab10:      	add	x0, x1, x0
    ab14:      	ldrb	w0, [x0]
    ab18:      	b	0xab38 <_stogir.terminal.inputs+0x498>
    ab1c:      	movz	x2, #0x0, lsl #48
    ab20:      	b	0xaa58 <_stogir.terminal.inputs+0x3b8>
    ab24:      	movz	x2, #0x0, lsl #48
    ab28:      	b	0xaa50 <_stogir.terminal.inputs+0x3b0>
    ab2c:      	movz	x2, #0x0, lsl #48
    ab30:      	b	0xab20 <_stogir.terminal.inputs+0x480>
    ab34:      	movz	x0, #0x0, lsl #48
    ab38:      	uxtb	w0, w0
    ab3c:      	and	x0, x0, #0x8
    ab40:      	uxtb	w0, w0
    ab44:      	cmp	x0, #0x0
    ab48:      	cset	w0, eq
    ab4c:      	uxtb	w16, w0
    ab50:      	cmp	w16, wzr
    ab54:      	cset	x0, eq
    ab58:      	cmp	x0, #0x0
    ab5c:      	b.eq	0xa9dc <_stogir.terminal.inputs+0x33c>
    ab60:      	and	x0, x3, #0xffffffff
    ab64:      	mov	x1, x0
    ab68:      	movz	x0, #0x0, lsl #48
    ab6c:      	movz	x2, #0x0, lsl #48
    ab70:      	b	0xa9f4 <_stogir.terminal.inputs+0x354>
    ab74:      	brk	#0
    ab78:      	b	0xab74 <_stogir.terminal.inputs+0x4d4>

000000000000ab7c <_stogir.switch.switch-inputs>:
    ab7c:      	sub	sp, sp, #0x20
    ab80:      	str	x29, [sp]
    ab84:      	str	x30, [sp, #0x8]
    ab88:      	mov	x29, sp
    ab8c:      	sxtw	x1, w1
    ab90:      	cmp	x1, #0x0
    ab94:      	cset	w3, gt
    ab98:      	movz	x16, #0x0, lsl #48
    ab9c:      	sub	x4, x16, x1
    aba0:      	sub	x5, x4, #0x1
    aba4:      	uxtb	w16, w3
    aba8:      	cmp	w16, wzr
    abac:      	b.eq	0xabf0 <_stogir.switch.switch-inputs+0x74>
    abb0:      	ldr	x4, [x0, #0x8]
    abb4:      	cmp	x1, x4
    abb8:      	b.ge	0xac60 <_stogir.switch.switch-inputs+0xe4>
    abbc:      	add	x4, x0, #0x78
    abc0:      	ldr	x4, [x4, #0x8]
    abc4:      	cmp	x1, x4
    abc8:      	b.ge	0xad84 <_stogir.switch.switch-inputs+0x208>
    abcc:      	lsl	x4, x1, #2
    abd0:      	ldr	x6, [x0, #0x78]
    abd4:      	add	x4, x4, x6
    abd8:      	ldr	w4, [x4]
    abdc:      	sxtw	x4, w4
    abe0:      	cmp	x4, #0x0
    abe4:      	cset	w4, ge
    abe8:      	ubfx	x4, x4, #0, #8
    abec:      	b	0xad88 <_stogir.switch.switch-inputs+0x20c>
    abf0:      	cmp	x1, #0x0
    abf4:      	b.ge	0xac68 <_stogir.switch.switch-inputs+0xec>
    abf8:      	add	x6, x0, #0x28
    abfc:      	add	x7, x0, #0x50
    ac00:      	ldr	x6, [x6, #0x8]
    ac04:      	ldr	x7, [x7, #0x8]
    ac08:      	cmp	x6, x7
    ac0c:      	b.ne	0xac3c <_stogir.switch.switch-inputs+0xc0>
    ac10:      	cmp	x4, x6
    ac14:      	b.gt	0xad8c <_stogir.switch.switch-inputs+0x210>
    ac18:      	lsl	x4, x5, #2
    ac1c:      	ldr	x6, [x0, #0x50]
    ac20:      	add	x4, x4, x6
    ac24:      	ldr	w4, [x4]
    ac28:      	sxtw	x4, w4
    ac2c:      	cmp	x4, #0x0
    ac30:      	cset	w4, gt
    ac34:      	ubfx	x4, x4, #0, #8
    ac38:      	b	0xad90 <_stogir.switch.switch-inputs+0x214>
    ac3c:      	movz	x4, #0x0, lsl #48
    ac40:      	b	0xac6c <_stogir.switch.switch-inputs+0xf0>
    ac44:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000ac44:  ARM64_RELOC_PAGE21	l_stogir.432
    ac48:      	ldr	x16, [x16]
		000000000000ac48:  ARM64_RELOC_PAGEOFF12	l_stogir.432
    ac4c:      	orr	x0, x16, xzr
    ac50:      	mov	x1, x0
    ac54:      	mov	x0, #0x1                ; =1
    ac58:      	mov	x2, #0x16               ; =22
    ac5c:      	b	0xad28 <_stogir.switch.switch-inputs+0x1ac>
    ac60:      	movz	x4, #0x0, lsl #48
    ac64:      	b	0xac6c <_stogir.switch.switch-inputs+0xf0>
    ac68:      	movz	x4, #0x0, lsl #48
    ac6c:      	cmp	x4, #0x0
    ac70:      	b.eq	0xacd4 <_stogir.switch.switch-inputs+0x158>
    ac74:      	uxtb	w16, w3
    ac78:      	cmp	w16, wzr
    ac7c:      	b.eq	0xaca4 <_stogir.switch.switch-inputs+0x128>
    ac80:      	lsl	x3, x1, #4
    ac84:      	ldr	x4, [x0]
    ac88:      	add	x3, x3, x4
    ac8c:      	ldr	x4, [x3]
    ac90:      	ldr	x3, [x3, #0x8]
    ac94:      	fmov	d31, x3
    ac98:      	mov	x3, x4
    ac9c:      	fmov	x4, d31
    aca0:      	b	0xacc4 <_stogir.switch.switch-inputs+0x148>
    aca4:      	lsl	x3, x5, #4
    aca8:      	ldr	x4, [x0, #0x28]
    acac:      	add	x3, x3, x4
    acb0:      	ldr	x4, [x3]
    acb4:      	ldr	x3, [x3, #0x8]
    acb8:      	fmov	d31, x3
    acbc:      	mov	x3, x4
    acc0:      	fmov	x4, d31
    acc4:      	mov	x5, x4
    acc8:      	mov	x4, x3
    accc:      	mov	x3, #0x1                ; =1
    acd0:      	b	0xace0 <_stogir.switch.switch-inputs+0x164>
    acd4:      	movz	x3, #0x0, lsl #48
    acd8:      	movz	x4, #0x0, lsl #48
    acdc:      	movz	x5, #0x0, lsl #48
    ace0:      	lsr	w3, w3, #0
    ace4:      	lsr	x16, x3, #0
    ace8:      	cmp	x16, #0x1
    acec:      	b.eq	0xad08 <_stogir.switch.switch-inputs+0x18c>
    acf0:      	b.lo	0xacf8 <_stogir.switch.switch-inputs+0x17c>
    acf4:      	b	0xad0c <_stogir.switch.switch-inputs+0x190>
    acf8:      	cmp	x16, #0x0
    acfc:      	b.eq	0xad04 <_stogir.switch.switch-inputs+0x188>
    ad00:      	b	0xad0c <_stogir.switch.switch-inputs+0x190>
    ad04:      	b	0xad10 <_stogir.switch.switch-inputs+0x194>
    ad08:      	b	0xad48 <_stogir.switch.switch-inputs+0x1cc>
    ad0c:      	b	0xb004 <_stogir.switch.switch-inputs+0x488>
    ad10:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000ad10:  ARM64_RELOC_PAGE21	l_stogir.433
    ad14:      	ldr	x16, [x16]
		000000000000ad14:  ARM64_RELOC_PAGEOFF12	l_stogir.433
    ad18:      	orr	x0, x16, xzr
    ad1c:      	mov	x1, x0
    ad20:      	mov	x0, #0x1                ; =1
    ad24:      	mov	x2, #0x16               ; =22
    ad28:      	str	x0, [x8]
    ad2c:      	str	x1, [x8, #0x8]
    ad30:      	str	x2, [x8, #0x10]
    ad34:      	sub	sp, x29, #0x0
    ad38:      	ldr	x29, [sp]
    ad3c:      	ldr	x30, [sp, #0x8]
    ad40:      	add	sp, sp, #0x20
    ad44:      	ret
    ad48:      	add	x16, x29, #0x10
    ad4c:      	str	x4, [x16]
    ad50:      	add	x16, x29, #0x10
    ad54:      	str	x5, [x16, #0x8]
    ad58:      	cmp	x1, #0x0
    ad5c:      	b.le	0xac44 <_stogir.switch.switch-inputs+0xc8>
    ad60:      	uxtb	w4, w4
    ad64:      	cmp	x4, #0x83
    ad68:      	b.ge	0xad94 <_stogir.switch.switch-inputs+0x218>
    ad6c:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000ad6c:  ARM64_RELOC_PAGE21	l_stogir.434
    ad70:      	ldr	x16, [x16]
		000000000000ad70:  ARM64_RELOC_PAGEOFF12	l_stogir.434
    ad74:      	orr	x1, x16, xzr
    ad78:      	add	x1, x4, x1
    ad7c:      	ldrb	w1, [x1]
    ad80:      	b	0xad98 <_stogir.switch.switch-inputs+0x21c>
    ad84:      	movz	x4, #0x0, lsl #48
    ad88:      	b	0xac64 <_stogir.switch.switch-inputs+0xe8>
    ad8c:      	movz	x4, #0x0, lsl #48
    ad90:      	b	0xac40 <_stogir.switch.switch-inputs+0xc4>
    ad94:      	movz	x1, #0x0, lsl #48
    ad98:      	uxtb	w1, w1
    ad9c:      	and	x1, x1, #0x1
    ada0:      	uxtb	w1, w1
    ada4:      	cmp	x1, #0x0
    ada8:      	b.eq	0xac44 <_stogir.switch.switch-inputs+0xc8>
    adac:      	add	x16, x29, #0x10
    adb0:      	ldr	w1, [x16]
    adb4:      	uxtb	w1, w1
    adb8:      	cmp	x1, #0x83
    adbc:      	b.ge	0xadd8 <_stogir.switch.switch-inputs+0x25c>
    adc0:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000adc0:  ARM64_RELOC_PAGE21	l_stogir.434
    adc4:      	ldr	x16, [x16]
		000000000000adc4:  ARM64_RELOC_PAGEOFF12	l_stogir.434
    adc8:      	orr	x3, x16, xzr
    adcc:      	add	x1, x1, x3
    add0:      	ldrb	w1, [x1]
    add4:      	b	0xaddc <_stogir.switch.switch-inputs+0x260>
    add8:      	movz	x1, #0x0, lsl #48
    addc:      	uxtb	w1, w1
    ade0:      	and	x1, x1, #0x4
    ade4:      	uxtb	w1, w1
    ade8:      	cmp	x1, #0x0
    adec:      	cset	w1, eq
    adf0:      	uxtb	w16, w1
    adf4:      	cmp	w16, wzr
    adf8:      	cset	x1, eq
    adfc:      	cmp	x1, #0x0
    ae00:      	b.ne	0xac44 <_stogir.switch.switch-inputs+0xc8>
    ae04:      	sxtw	x2, w2
    ae08:      	mov	x1, sp
    ae0c:      	cmp	x2, #0x0
    ae10:      	cset	w3, gt
    ae14:      	movz	x16, #0x0, lsl #48
    ae18:      	sub	x4, x16, x2
    ae1c:      	sub	sp, sp, #0x10
    ae20:      	mov	x5, sp
    ae24:      	sub	x6, x4, #0x1
    ae28:      	uxtb	w16, w3
    ae2c:      	cmp	w16, wzr
    ae30:      	b.eq	0xae9c <_stogir.switch.switch-inputs+0x320>
    ae34:      	ldr	x4, [x0, #0x8]
    ae38:      	cmp	x2, x4
    ae3c:      	b.ge	0xaee8 <_stogir.switch.switch-inputs+0x36c>
    ae40:      	add	x4, x0, #0x78
    ae44:      	ldr	x4, [x4, #0x8]
    ae48:      	cmp	x2, x4
    ae4c:      	b.ge	0xaffc <_stogir.switch.switch-inputs+0x480>
    ae50:      	lsl	x4, x2, #2
    ae54:      	ldr	x7, [x0, #0x78]
    ae58:      	add	x4, x4, x7
    ae5c:      	ldr	w4, [x4]
    ae60:      	sxtw	x4, w4
    ae64:      	cmp	x4, #0x0
    ae68:      	cset	w4, ge
    ae6c:      	ubfx	x4, x4, #0, #8
    ae70:      	b	0xb000 <_stogir.switch.switch-inputs+0x484>
    ae74:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000ae74:  ARM64_RELOC_PAGE21	l_stogir.435
    ae78:      	ldr	x16, [x16]
		000000000000ae78:  ARM64_RELOC_PAGEOFF12	l_stogir.435
    ae7c:      	orr	x0, x16, xzr
    ae80:      	mov	x2, x0
    ae84:      	mov	x0, #0x1                ; =1
    ae88:      	mov	x3, #0x20               ; =32
    ae8c:      	mov	sp, x1
    ae90:      	mov	x1, x2
    ae94:      	mov	x2, x3
    ae98:      	b	0xac5c <_stogir.switch.switch-inputs+0xe0>
    ae9c:      	cmp	x2, #0x0
    aea0:      	b.ge	0xaef0 <_stogir.switch.switch-inputs+0x374>
    aea4:      	add	x7, x0, #0x28
    aea8:      	add	x9, x0, #0x50
    aeac:      	ldr	x7, [x7, #0x8]
    aeb0:      	ldr	x9, [x9, #0x8]
    aeb4:      	cmp	x7, x9
    aeb8:      	b.ne	0xaff4 <_stogir.switch.switch-inputs+0x478>
    aebc:      	cmp	x4, x7
    aec0:      	b.gt	0xb00c <_stogir.switch.switch-inputs+0x490>
    aec4:      	lsl	x4, x6, #2
    aec8:      	ldr	x7, [x0, #0x50]
    aecc:      	add	x4, x4, x7
    aed0:      	ldr	w4, [x4]
    aed4:      	sxtw	x4, w4
    aed8:      	cmp	x4, #0x0
    aedc:      	cset	w4, gt
    aee0:      	ubfx	x4, x4, #0, #8
    aee4:      	b	0xb010 <_stogir.switch.switch-inputs+0x494>
    aee8:      	movz	x4, #0x0, lsl #48
    aeec:      	b	0xaef4 <_stogir.switch.switch-inputs+0x378>
    aef0:      	movz	x4, #0x0, lsl #48
    aef4:      	cmp	x4, #0x0
    aef8:      	b.eq	0xaf5c <_stogir.switch.switch-inputs+0x3e0>
    aefc:      	uxtb	w16, w3
    af00:      	cmp	w16, wzr
    af04:      	b.eq	0xaf2c <_stogir.switch.switch-inputs+0x3b0>
    af08:      	lsl	x2, x2, #4
    af0c:      	ldr	x0, [x0]
    af10:      	add	x0, x2, x0
    af14:      	ldr	x2, [x0]
    af18:      	ldr	x0, [x0, #0x8]
    af1c:      	fmov	d31, x0
    af20:      	mov	x0, x2
    af24:      	fmov	x2, d31
    af28:      	b	0xaf4c <_stogir.switch.switch-inputs+0x3d0>
    af2c:      	lsl	x2, x6, #4
    af30:      	ldr	x0, [x0, #0x28]
    af34:      	add	x0, x2, x0
    af38:      	ldr	x2, [x0]
    af3c:      	ldr	x0, [x0, #0x8]
    af40:      	fmov	d31, x0
    af44:      	mov	x0, x2
    af48:      	fmov	x2, d31
    af4c:      	mov	x3, x2
    af50:      	mov	x2, x0
    af54:      	mov	x0, #0x1                ; =1
    af58:      	b	0xaf68 <_stogir.switch.switch-inputs+0x3ec>
    af5c:      	movz	x0, #0x0, lsl #48
    af60:      	movz	x2, #0x0, lsl #48
    af64:      	movz	x3, #0x0, lsl #48
    af68:      	lsr	w0, w0, #0
    af6c:      	lsr	x16, x0, #0
    af70:      	cmp	x16, #0x1
    af74:      	b.eq	0xaf90 <_stogir.switch.switch-inputs+0x414>
    af78:      	b.lo	0xaf80 <_stogir.switch.switch-inputs+0x404>
    af7c:      	b	0xaf94 <_stogir.switch.switch-inputs+0x418>
    af80:      	cmp	x16, #0x0
    af84:      	b.eq	0xaf8c <_stogir.switch.switch-inputs+0x410>
    af88:      	b	0xaf94 <_stogir.switch.switch-inputs+0x418>
    af8c:      	b	0xaf98 <_stogir.switch.switch-inputs+0x41c>
    af90:      	b	0xafb4 <_stogir.switch.switch-inputs+0x438>
    af94:      	b	0xb014 <_stogir.switch.switch-inputs+0x498>
    af98:      	adrp	x16, 0xa000 <_stogir.checked.projection+0x270>
		000000000000af98:  ARM64_RELOC_PAGE21	l_stogir.436
    af9c:      	ldr	x16, [x16]
		000000000000af9c:  ARM64_RELOC_PAGEOFF12	l_stogir.436
    afa0:      	orr	x0, x16, xzr
    afa4:      	mov	x2, x0
    afa8:      	mov	x0, #0x1                ; =1
    afac:      	mov	x3, #0x17               ; =23
    afb0:      	b	0xae8c <_stogir.switch.switch-inputs+0x310>
    afb4:      	lsr	w0, w2, #0
    afb8:      	str	x2, [x5]
    afbc:      	str	x3, [x5, #0x8]
    afc0:      	ubfx	x0, x0, #8, #8
    afc4:      	cmp	x0, #0x1
    afc8:      	b.lt	0xae74 <_stogir.switch.switch-inputs+0x2f8>
    afcc:      	cmp	x0, #0xb
    afd0:      	b.gt	0xae74 <_stogir.switch.switch-inputs+0x2f8>
    afd4:      	uxtb	w2, w2
    afd8:      	cmp	x2, #0x48
    afdc:      	b.eq	0xae74 <_stogir.switch.switch-inputs+0x2f8>
    afe0:      	and	x0, x0, #0xffffffff
    afe4:      	mov	x2, x0
    afe8:      	movz	x0, #0x0, lsl #48
    afec:      	movz	x3, #0x0, lsl #48
    aff0:      	b	0xae8c <_stogir.switch.switch-inputs+0x310>
    aff4:      	movz	x4, #0x0, lsl #48
    aff8:      	b	0xaef4 <_stogir.switch.switch-inputs+0x378>
    affc:      	movz	x4, #0x0, lsl #48
    b000:      	b	0xaeec <_stogir.switch.switch-inputs+0x370>
    b004:      	brk	#0
    b008:      	b	0xb004 <_stogir.switch.switch-inputs+0x488>
    b00c:      	movz	x4, #0x0, lsl #48
    b010:      	b	0xaff8 <_stogir.switch.switch-inputs+0x47c>
    b014:      	brk	#0
    b018:      	b	0xb014 <_stogir.switch.switch-inputs+0x498>

000000000000b01c <_stogir.switch.case-inputs>:
    b01c:      	sub	sp, sp, #0xc0
    b020:      	str	x29, [sp]
    b024:      	str	x30, [sp, #0x8]
    b028:      	mov	x29, sp
    b02c:      	str	x19, [sp, #0x80]
    b030:      	str	x20, [sp, #0x88]
    b034:      	str	x21, [sp, #0x90]
    b038:      	str	x22, [sp, #0x98]
    b03c:      	str	x23, [sp, #0xa0]
    b040:      	str	x24, [sp, #0xa8]
    b044:      	str	x25, [sp, #0xb0]
    b048:      	str	x26, [sp, #0xb8]
    b04c:      	sxtw	x2, w2
    b050:      	lsl	x5, x2, #2
    b054:      	cmp	x2, #0x0
    b058:      	cset	w6, gt
    b05c:      	movz	x16, #0x0, lsl #48
    b060:      	sub	x7, x16, x2
    b064:      	sub	x9, x7, #0x1
    b068:      	uxtb	w16, w6
    b06c:      	cmp	w16, wzr
    b070:      	b.eq	0xb0b0 <_stogir.switch.case-inputs+0x94>
    b074:      	ldr	x7, [x0, #0x8]
    b078:      	cmp	x2, x7
    b07c:      	b.ge	0xb104 <_stogir.switch.case-inputs+0xe8>
    b080:      	add	x7, x0, #0x78
    b084:      	ldr	x7, [x7, #0x8]
    b088:      	cmp	x2, x7
    b08c:      	b.ge	0xb244 <_stogir.switch.case-inputs+0x228>
    b090:      	ldr	x7, [x0, #0x78]
    b094:      	add	x7, x5, x7
    b098:      	ldr	w7, [x7]
    b09c:      	sxtw	x7, w7
    b0a0:      	cmp	x7, #0x0
    b0a4:      	cset	w7, ge
    b0a8:      	ubfx	x7, x7, #0, #8
    b0ac:      	b	0xb248 <_stogir.switch.case-inputs+0x22c>
    b0b0:      	cmp	x2, #0x0
    b0b4:      	b.ge	0xb10c <_stogir.switch.case-inputs+0xf0>
    b0b8:      	add	x10, x0, #0x28
    b0bc:      	add	x11, x0, #0x50
    b0c0:      	ldr	x10, [x10, #0x8]
    b0c4:      	ldr	x11, [x11, #0x8]
    b0c8:      	cmp	x10, x11
    b0cc:      	b.ne	0xb0fc <_stogir.switch.case-inputs+0xe0>
    b0d0:      	cmp	x7, x10
    b0d4:      	b.gt	0xb320 <_stogir.switch.case-inputs+0x304>
    b0d8:      	lsl	x7, x9, #2
    b0dc:      	ldr	x10, [x0, #0x50]
    b0e0:      	add	x7, x7, x10
    b0e4:      	ldr	w7, [x7]
    b0e8:      	sxtw	x7, w7
    b0ec:      	cmp	x7, #0x0
    b0f0:      	cset	w7, gt
    b0f4:      	ubfx	x7, x7, #0, #8
    b0f8:      	b	0xb324 <_stogir.switch.case-inputs+0x308>
    b0fc:      	movz	x7, #0x0, lsl #48
    b100:      	b	0xb110 <_stogir.switch.case-inputs+0xf4>
    b104:      	movz	x7, #0x0, lsl #48
    b108:      	b	0xb110 <_stogir.switch.case-inputs+0xf4>
    b10c:      	movz	x7, #0x0, lsl #48
    b110:      	cmp	x7, #0x0
    b114:      	b.eq	0xb178 <_stogir.switch.case-inputs+0x15c>
    b118:      	uxtb	w16, w6
    b11c:      	cmp	w16, wzr
    b120:      	b.eq	0xb148 <_stogir.switch.case-inputs+0x12c>
    b124:      	lsl	x6, x2, #4
    b128:      	ldr	x7, [x0]
    b12c:      	add	x6, x6, x7
    b130:      	ldr	x7, [x6]
    b134:      	ldr	x6, [x6, #0x8]
    b138:      	fmov	d31, x6
    b13c:      	mov	x6, x7
    b140:      	fmov	x7, d31
    b144:      	b	0xb168 <_stogir.switch.case-inputs+0x14c>
    b148:      	lsl	x6, x9, #4
    b14c:      	ldr	x7, [x0, #0x28]
    b150:      	add	x6, x6, x7
    b154:      	ldr	x7, [x6]
    b158:      	ldr	x6, [x6, #0x8]
    b15c:      	fmov	d31, x6
    b160:      	mov	x6, x7
    b164:      	fmov	x7, d31
    b168:      	mov	x9, x7
    b16c:      	mov	x7, x6
    b170:      	mov	x6, #0x1                ; =1
    b174:      	b	0xb184 <_stogir.switch.case-inputs+0x168>
    b178:      	movz	x6, #0x0, lsl #48
    b17c:      	movz	x7, #0x0, lsl #48
    b180:      	movz	x9, #0x0, lsl #48
    b184:      	lsr	w6, w6, #0
    b188:      	lsr	x16, x6, #0
    b18c:      	cmp	x16, #0x1
    b190:      	b.eq	0xb1ac <_stogir.switch.case-inputs+0x190>
    b194:      	b.lo	0xb19c <_stogir.switch.case-inputs+0x180>
    b198:      	b	0xb1b0 <_stogir.switch.case-inputs+0x194>
    b19c:      	cmp	x16, #0x0
    b1a0:      	b.eq	0xb1a8 <_stogir.switch.case-inputs+0x18c>
    b1a4:      	b	0xb1b0 <_stogir.switch.case-inputs+0x194>
    b1a8:      	b	0xb1b4 <_stogir.switch.case-inputs+0x198>
    b1ac:      	b	0xb20c <_stogir.switch.case-inputs+0x1f0>
    b1b0:      	b	0xb328 <_stogir.switch.case-inputs+0x30c>
    b1b4:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000b1b4:  ARM64_RELOC_PAGE21	l_stogir.437
    b1b8:      	ldr	x16, [x16]
		000000000000b1b8:  ARM64_RELOC_PAGEOFF12	l_stogir.437
    b1bc:      	orr	x0, x16, xzr
    b1c0:      	mov	x21, x8
    b1c4:      	mov	x1, x0
    b1c8:      	mov	x0, #0x1                ; =1
    b1cc:      	mov	x2, #0x1a               ; =26
    b1d0:      	str	x0, [x21]
    b1d4:      	str	x1, [x21, #0x8]
    b1d8:      	str	x2, [x21, #0x10]
    b1dc:      	ldr	x19, [sp, #0x80]
    b1e0:      	ldr	x20, [sp, #0x88]
    b1e4:      	ldr	x21, [sp, #0x90]
    b1e8:      	ldr	x22, [sp, #0x98]
    b1ec:      	ldr	x23, [sp, #0xa0]
    b1f0:      	ldr	x24, [sp, #0xa8]
    b1f4:      	ldr	x25, [sp, #0xb0]
    b1f8:      	ldr	x26, [sp, #0xb8]
    b1fc:      	ldr	x29, [sp]
    b200:      	ldr	x30, [sp, #0x8]
    b204:      	add	sp, sp, #0xc0
    b208:      	ret
    b20c:      	add	x16, sp, #0x10
    b210:      	str	x7, [x16]
    b214:      	add	x16, sp, #0x10
    b218:      	str	x9, [x16, #0x8]
    b21c:      	cmp	x2, #0x0
    b220:      	b.gt	0xb24c <_stogir.switch.case-inputs+0x230>
    b224:      	mov	x21, x8
    b228:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000b228:  ARM64_RELOC_PAGE21	l_stogir.438
    b22c:      	ldr	x16, [x16]
		000000000000b22c:  ARM64_RELOC_PAGEOFF12	l_stogir.438
    b230:      	orr	x0, x16, xzr
    b234:      	mov	x1, x0
    b238:      	mov	x0, #0x1                ; =1
    b23c:      	mov	x2, #0x1f               ; =31
    b240:      	b	0xb1d0 <_stogir.switch.case-inputs+0x1b4>
    b244:      	movz	x7, #0x0, lsl #48
    b248:      	b	0xb108 <_stogir.switch.case-inputs+0xec>
    b24c:      	add	x16, sp, #0x10
    b250:      	ldr	w2, [x16]
    b254:      	uxtb	w6, w2
    b258:      	cmp	x6, #0x75
    b25c:      	b.ne	0xb4b8 <_stogir.switch.case-inputs+0x49c>
    b260:      	ubfx	x2, x2, #8, #8
    b264:      	cmp	x2, #0x0
    b268:      	b.ne	0xb4c0 <_stogir.switch.case-inputs+0x4a4>
    b26c:      	ldr	x2, [x0, #0x78]
    b270:      	add	x2, x5, x2
    b274:      	ldr	w2, [x2]
    b278:      	sxtw	x2, w2
    b27c:      	cmp	x2, #0x2
    b280:      	b.ne	0xb4c8 <_stogir.switch.case-inputs+0x4ac>
    b284:      	sxtw	x19, w1
    b288:      	cmp	x19, #0x6d
    b28c:      	b.lt	0xb4d0 <_stogir.switch.case-inputs+0x4b4>
    b290:      	cmp	x19, #0x6f
    b294:      	b.gt	0xb4d8 <_stogir.switch.case-inputs+0x4bc>
    b298:      	add	x16, sp, #0x20
    b29c:      	orr	x20, x16, xzr
    b2a0:      	add	x16, sp, #0x10
    b2a4:      	ldr	w1, [x16, #0x4]
    b2a8:      	add	x16, sp, #0x10
    b2ac:      	ldr	w2, [x16, #0x8]
    b2b0:      	lsr	w1, w1, #0
    b2b4:      	lsr	w2, w2, #0
    b2b8:      	mov	x21, x8
    b2bc:      	add	x8, sp, #0x20
    b2c0:      	mov	x22, x0
    b2c4:      	mov	w23, w3
    b2c8:      	mov	w24, w4
    b2cc:      	bl	0xb2cc <_stogir.switch.case-inputs+0x2b0>
		000000000000b2cc:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    b2d0:      	add	x16, sp, #0x20
    b2d4:      	ldr	w0, [x16]
    b2d8:      	lsr	x16, x0, #0
    b2dc:      	cmp	x16, #0x1
    b2e0:      	b.eq	0xb2fc <_stogir.switch.case-inputs+0x2e0>
    b2e4:      	b.lo	0xb2ec <_stogir.switch.case-inputs+0x2d0>
    b2e8:      	b	0xb300 <_stogir.switch.case-inputs+0x2e4>
    b2ec:      	cmp	x16, #0x0
    b2f0:      	b.eq	0xb2f8 <_stogir.switch.case-inputs+0x2dc>
    b2f4:      	b	0xb300 <_stogir.switch.case-inputs+0x2e4>
    b2f8:      	b	0xb330 <_stogir.switch.case-inputs+0x314>
    b2fc:      	b	0xb304 <_stogir.switch.case-inputs+0x2e8>
    b300:      	b	0xb4a0 <_stogir.switch.case-inputs+0x484>
    b304:      	add	x0, x20, #0x8
    b308:      	add	x16, sp, #0x20
    b30c:      	ldr	x1, [x16, #0x8]
    b310:      	ldr	x0, [x0, #0x8]
    b314:      	mov	x2, x0
    b318:      	mov	x0, #0x1                ; =1
    b31c:      	b	0xb240 <_stogir.switch.case-inputs+0x224>
    b320:      	movz	x7, #0x0, lsl #48
    b324:      	b	0xb100 <_stogir.switch.case-inputs+0xe4>
    b328:      	brk	#0
    b32c:      	b	0xb328 <_stogir.switch.case-inputs+0x30c>
    b330:      	add	x16, sp, #0x20
    b334:      	ldr	w20, [x16, #0x8]
    b338:      	sxtw	x0, w20
    b33c:      	and	x25, x0, #0xffffffff
    b340:      	cmp	x19, #0x6f
    b344:      	b.ne	0xb358 <_stogir.switch.case-inputs+0x33c>
    b348:      	mov	x1, x25
    b34c:      	movz	x0, #0x0, lsl #48
    b350:      	movz	x2, #0x0, lsl #48
    b354:      	b	0xb31c <_stogir.switch.case-inputs+0x300>
    b358:      	add	x16, sp, #0x40
    b35c:      	orr	x26, x16, xzr
    b360:      	lsr	w23, w23, #0
    b364:      	lsr	w20, w20, #0
    b368:      	add	x8, sp, #0x40
    b36c:      	mov	x0, x22
    b370:      	mov	w1, w23
    b374:      	mov	w2, w20
    b378:      	bl	0xb378 <_stogir.switch.case-inputs+0x35c>
		000000000000b378:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    b37c:      	add	x16, sp, #0x40
    b380:      	ldr	w0, [x16]
    b384:      	lsr	x16, x0, #0
    b388:      	cmp	x16, #0x1
    b38c:      	b.eq	0xb3a8 <_stogir.switch.case-inputs+0x38c>
    b390:      	b.lo	0xb398 <_stogir.switch.case-inputs+0x37c>
    b394:      	b	0xb3ac <_stogir.switch.case-inputs+0x390>
    b398:      	cmp	x16, #0x0
    b39c:      	b.eq	0xb3a4 <_stogir.switch.case-inputs+0x388>
    b3a0:      	b	0xb3ac <_stogir.switch.case-inputs+0x390>
    b3a4:      	b	0xb3cc <_stogir.switch.case-inputs+0x3b0>
    b3a8:      	b	0xb3b0 <_stogir.switch.case-inputs+0x394>
    b3ac:      	b	0xb4a8 <_stogir.switch.case-inputs+0x48c>
    b3b0:      	add	x0, x26, #0x8
    b3b4:      	add	x16, sp, #0x40
    b3b8:      	ldr	x1, [x16, #0x8]
    b3bc:      	ldr	x0, [x0, #0x8]
    b3c0:      	mov	x2, x0
    b3c4:      	mov	x0, #0x1                ; =1
    b3c8:      	b	0xb354 <_stogir.switch.case-inputs+0x338>
    b3cc:      	add	x16, sp, #0x40
    b3d0:      	ldr	x26, [x16, #0x8]
    b3d4:      	cmp	x19, #0x6d
    b3d8:      	b.ne	0xb3f8 <_stogir.switch.case-inputs+0x3dc>
    b3dc:      	sxtw	x23, w23
    b3e0:      	mov	x0, x23
    b3e4:      	b	0xb400 <_stogir.switch.case-inputs+0x3e4>
    b3e8:      	mov	x1, x25
    b3ec:      	movz	x0, #0x0, lsl #48
    b3f0:      	movz	x2, #0x0, lsl #48
    b3f4:      	b	0xb3c8 <_stogir.switch.case-inputs+0x3ac>
    b3f8:      	sxtw	x24, w24
    b3fc:      	mov	x0, x24
    b400:      	add	x16, sp, #0x60
    b404:      	orr	x19, x16, xzr
    b408:      	lsr	w20, w20, #0
    b40c:      	lsr	w0, w0, #0
    b410:      	add	x8, sp, #0x60
    b414:      	mov	w1, w0
    b418:      	mov	x0, x22
    b41c:      	mov	w2, w20
    b420:      	bl	0xb420 <_stogir.switch.case-inputs+0x404>
		000000000000b420:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    b424:      	add	x16, sp, #0x60
    b428:      	ldr	w0, [x16]
    b42c:      	lsr	x16, x0, #0
    b430:      	cmp	x16, #0x1
    b434:      	b.eq	0xb450 <_stogir.switch.case-inputs+0x434>
    b438:      	b.lo	0xb440 <_stogir.switch.case-inputs+0x424>
    b43c:      	b	0xb454 <_stogir.switch.case-inputs+0x438>
    b440:      	cmp	x16, #0x0
    b444:      	b.eq	0xb44c <_stogir.switch.case-inputs+0x430>
    b448:      	b	0xb454 <_stogir.switch.case-inputs+0x438>
    b44c:      	b	0xb474 <_stogir.switch.case-inputs+0x458>
    b450:      	b	0xb458 <_stogir.switch.case-inputs+0x43c>
    b454:      	b	0xb4b0 <_stogir.switch.case-inputs+0x494>
    b458:      	add	x0, x19, #0x8
    b45c:      	add	x16, sp, #0x60
    b460:      	ldr	x1, [x16, #0x8]
    b464:      	ldr	x0, [x0, #0x8]
    b468:      	mov	x2, x0
    b46c:      	mov	x0, #0x1                ; =1
    b470:      	b	0xb3f4 <_stogir.switch.case-inputs+0x3d8>
    b474:      	add	x16, sp, #0x60
    b478:      	ldr	x0, [x16, #0x8]
    b47c:      	cmp	x26, x0
    b480:      	b.ls	0xb3e8 <_stogir.switch.case-inputs+0x3cc>
    b484:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000b484:  ARM64_RELOC_PAGE21	l_stogir.439
    b488:      	ldr	x16, [x16]
		000000000000b488:  ARM64_RELOC_PAGEOFF12	l_stogir.439
    b48c:      	orr	x0, x16, xzr
    b490:      	mov	x1, x0
    b494:      	mov	x0, #0x1                ; =1
    b498:      	mov	x2, #0x1a               ; =26
    b49c:      	b	0xb3f4 <_stogir.switch.case-inputs+0x3d8>
    b4a0:      	brk	#0
    b4a4:      	b	0xb4a0 <_stogir.switch.case-inputs+0x484>
    b4a8:      	brk	#0
    b4ac:      	b	0xb4a8 <_stogir.switch.case-inputs+0x48c>
    b4b0:      	brk	#0
    b4b4:      	b	0xb4b0 <_stogir.switch.case-inputs+0x494>
    b4b8:      	mov	x21, x8
    b4bc:      	b	0xb228 <_stogir.switch.case-inputs+0x20c>
    b4c0:      	mov	x21, x8
    b4c4:      	b	0xb228 <_stogir.switch.case-inputs+0x20c>
    b4c8:      	mov	x21, x8
    b4cc:      	b	0xb228 <_stogir.switch.case-inputs+0x20c>
    b4d0:      	mov	x21, x8
    b4d4:      	b	0xb228 <_stogir.switch.case-inputs+0x20c>
    b4d8:      	mov	x21, x8
    b4dc:      	b	0xb228 <_stogir.switch.case-inputs+0x20c>

000000000000b4e0 <_stogir.stack.validate-frame-address>:
    b4e0:      	sxtw	x1, w1
    b4e4:      	lsl	x2, x1, #2
    b4e8:      	cmp	x1, #0x0
    b4ec:      	cset	w3, gt
    b4f0:      	movz	x16, #0x0, lsl #48
    b4f4:      	sub	x4, x16, x1
    b4f8:      	sub	x5, x4, #0x1
    b4fc:      	uxtb	w16, w3
    b500:      	cmp	w16, wzr
    b504:      	b.eq	0xb544 <_stogir.stack.validate-frame-address+0x64>
    b508:      	ldr	x4, [x0, #0x8]
    b50c:      	cmp	x1, x4
    b510:      	b.ge	0xb598 <_stogir.stack.validate-frame-address+0xb8>
    b514:      	add	x4, x0, #0x78
    b518:      	ldr	x4, [x4, #0x8]
    b51c:      	cmp	x1, x4
    b520:      	b.ge	0xb6b0 <_stogir.stack.validate-frame-address+0x1d0>
    b524:      	ldr	x4, [x0, #0x78]
    b528:      	add	x4, x2, x4
    b52c:      	ldr	w4, [x4]
    b530:      	sxtw	x4, w4
    b534:      	cmp	x4, #0x0
    b538:      	cset	w4, ge
    b53c:      	ubfx	x4, x4, #0, #8
    b540:      	b	0xb6b4 <_stogir.stack.validate-frame-address+0x1d4>
    b544:      	cmp	x1, #0x0
    b548:      	b.ge	0xb5a0 <_stogir.stack.validate-frame-address+0xc0>
    b54c:      	add	x6, x0, #0x28
    b550:      	add	x7, x0, #0x50
    b554:      	ldr	x6, [x6, #0x8]
    b558:      	ldr	x7, [x7, #0x8]
    b55c:      	cmp	x6, x7
    b560:      	b.ne	0xb590 <_stogir.stack.validate-frame-address+0xb0>
    b564:      	cmp	x4, x6
    b568:      	b.gt	0xb6b8 <_stogir.stack.validate-frame-address+0x1d8>
    b56c:      	lsl	x4, x5, #2
    b570:      	ldr	x6, [x0, #0x50]
    b574:      	add	x4, x4, x6
    b578:      	ldr	w4, [x4]
    b57c:      	sxtw	x4, w4
    b580:      	cmp	x4, #0x0
    b584:      	cset	w4, gt
    b588:      	ubfx	x4, x4, #0, #8
    b58c:      	b	0xb6bc <_stogir.stack.validate-frame-address+0x1dc>
    b590:      	movz	x4, #0x0, lsl #48
    b594:      	b	0xb5a4 <_stogir.stack.validate-frame-address+0xc4>
    b598:      	movz	x4, #0x0, lsl #48
    b59c:      	b	0xb5a4 <_stogir.stack.validate-frame-address+0xc4>
    b5a0:      	movz	x4, #0x0, lsl #48
    b5a4:      	cmp	x4, #0x0
    b5a8:      	b.eq	0xb5e8 <_stogir.stack.validate-frame-address+0x108>
    b5ac:      	uxtb	w16, w3
    b5b0:      	cmp	w16, wzr
    b5b4:      	b.eq	0xb5cc <_stogir.stack.validate-frame-address+0xec>
    b5b8:      	lsl	x3, x1, #4
    b5bc:      	ldr	x4, [x0]
    b5c0:      	add	x3, x3, x4
    b5c4:      	ldr	x3, [x3]
    b5c8:      	b	0xb5dc <_stogir.stack.validate-frame-address+0xfc>
    b5cc:      	lsl	x3, x5, #4
    b5d0:      	ldr	x4, [x0, #0x28]
    b5d4:      	add	x3, x3, x4
    b5d8:      	ldr	x3, [x3]
    b5dc:      	mov	x4, x3
    b5e0:      	mov	x3, #0x1                ; =1
    b5e4:      	b	0xb5f0 <_stogir.stack.validate-frame-address+0x110>
    b5e8:      	movz	x3, #0x0, lsl #48
    b5ec:      	movz	x4, #0x0, lsl #48
    b5f0:      	lsr	w3, w3, #0
    b5f4:      	lsr	x16, x3, #0
    b5f8:      	cmp	x16, #0x1
    b5fc:      	b.eq	0xb618 <_stogir.stack.validate-frame-address+0x138>
    b600:      	b.lo	0xb608 <_stogir.stack.validate-frame-address+0x128>
    b604:      	b	0xb61c <_stogir.stack.validate-frame-address+0x13c>
    b608:      	cmp	x16, #0x0
    b60c:      	b.eq	0xb614 <_stogir.stack.validate-frame-address+0x134>
    b610:      	b	0xb61c <_stogir.stack.validate-frame-address+0x13c>
    b614:      	b	0xb620 <_stogir.stack.validate-frame-address+0x140>
    b618:      	b	0xb664 <_stogir.stack.validate-frame-address+0x184>
    b61c:      	b	0xb6c0 <_stogir.stack.validate-frame-address+0x1e0>
    b620:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000b620:  ARM64_RELOC_PAGE21	l_stogir.440
    b624:      	ldr	x16, [x16]
		000000000000b624:  ARM64_RELOC_PAGEOFF12	l_stogir.440
    b628:      	orr	x0, x16, xzr
    b62c:      	mov	x1, x0
    b630:      	mov	x0, #0x1                ; =1
    b634:      	mov	x2, #0x21               ; =33
    b638:      	b	0xb654 <_stogir.stack.validate-frame-address+0x174>
    b63c:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000b63c:  ARM64_RELOC_PAGE21	l_stogir.441
    b640:      	ldr	x16, [x16]
		000000000000b640:  ARM64_RELOC_PAGEOFF12	l_stogir.441
    b644:      	orr	x0, x16, xzr
    b648:      	mov	x1, x0
    b64c:      	mov	x0, #0x1                ; =1
    b650:      	mov	x2, #0x1e               ; =30
    b654:      	str	x0, [x8]
    b658:      	str	x1, [x8, #0x8]
    b65c:      	str	x2, [x8, #0x10]
    b660:      	ret
    b664:      	cmp	x1, #0x0
    b668:      	b.le	0xb63c <_stogir.stack.validate-frame-address+0x15c>
    b66c:      	uxtb	w1, w4
    b670:      	cmp	x1, #0x42
    b674:      	b.ne	0xb63c <_stogir.stack.validate-frame-address+0x15c>
    b678:      	lsr	w4, w4, #0
    b67c:      	ubfx	x1, x4, #8, #8
    b680:      	cmp	x1, #0x6
    b684:      	b.ne	0xb63c <_stogir.stack.validate-frame-address+0x15c>
    b688:      	ldr	x0, [x0, #0x78]
    b68c:      	add	x0, x2, x0
    b690:      	ldr	w0, [x0]
    b694:      	sxtw	x0, w0
    b698:      	cmp	x0, #0x0
    b69c:      	b.ne	0xb63c <_stogir.stack.validate-frame-address+0x15c>
    b6a0:      	movz	x0, #0x0, lsl #48
    b6a4:      	mov	x1, #0x8                ; =8
    b6a8:      	movz	x2, #0x0, lsl #48
    b6ac:      	b	0xb654 <_stogir.stack.validate-frame-address+0x174>
    b6b0:      	movz	x4, #0x0, lsl #48
    b6b4:      	b	0xb59c <_stogir.stack.validate-frame-address+0xbc>
    b6b8:      	movz	x4, #0x0, lsl #48
    b6bc:      	b	0xb594 <_stogir.stack.validate-frame-address+0xb4>
    b6c0:      	brk	#0
    b6c4:      	b	0xb6c0 <_stogir.stack.validate-frame-address+0x1e0>

000000000000b6c8 <_stogir.stack.validate-scope-inputs>:
    b6c8:      	sub	sp, sp, #0x20
    b6cc:      	sxtw	x1, w1
    b6d0:      	cmp	x1, #0x53
    b6d4:      	cset	w5, eq
    b6d8:      	uxtb	w16, w5
    b6dc:      	cmp	w16, wzr
    b6e0:      	b.ne	0xb718 <_stogir.stack.validate-scope-inputs+0x50>
    b6e4:      	cmp	x1, #0x54
    b6e8:      	b.eq	0xb718 <_stogir.stack.validate-scope-inputs+0x50>
    b6ec:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000b6ec:  ARM64_RELOC_PAGE21	l_stogir.442
    b6f0:      	ldr	x16, [x16]
		000000000000b6f0:  ARM64_RELOC_PAGEOFF12	l_stogir.442
    b6f4:      	orr	x0, x16, xzr
    b6f8:      	mov	x1, x0
    b6fc:      	mov	x0, #0x1                ; =1
    b700:      	mov	x2, #0x22               ; =34
    b704:      	str	x0, [x8]
    b708:      	str	x1, [x8, #0x8]
    b70c:      	str	x2, [x8, #0x10]
    b710:      	add	sp, sp, #0x20
    b714:      	ret
    b718:      	uxtb	w16, w5
    b71c:      	cmp	w16, wzr
    b720:      	mov	x16, #0x6               ; =6
    b724:      	movz	x17, #0x0, lsl #48
    b728:      	csel	x1, x16, x17, ne
    b72c:      	sxtw	x2, w2
    b730:      	lsr	w1, w1, #0
    b734:      	sxtw	x1, w1
    b738:      	cmp	x2, x1
    b73c:      	b.ne	0xb6ec <_stogir.stack.validate-scope-inputs+0x24>
    b740:      	sxtw	x3, w3
    b744:      	cmp	x3, #0x0
    b748:      	cset	w1, gt
    b74c:      	movz	x16, #0x0, lsl #48
    b750:      	sub	x2, x16, x3
    b754:      	sub	x6, x2, #0x1
    b758:      	uxtb	w16, w1
    b75c:      	cmp	w16, wzr
    b760:      	b.eq	0xb870 <_stogir.stack.validate-scope-inputs+0x1a8>
    b764:      	ldr	x2, [x0, #0x8]
    b768:      	cmp	x3, x2
    b76c:      	b.ge	0xb868 <_stogir.stack.validate-scope-inputs+0x1a0>
    b770:      	add	x2, x0, #0x78
    b774:      	ldr	x2, [x2, #0x8]
    b778:      	cmp	x3, x2
    b77c:      	b.ge	0xb924 <_stogir.stack.validate-scope-inputs+0x25c>
    b780:      	lsl	x2, x3, #2
    b784:      	ldr	x7, [x0, #0x78]
    b788:      	add	x2, x2, x7
    b78c:      	ldr	w2, [x2]
    b790:      	sxtw	x2, w2
    b794:      	cmp	x2, #0x0
    b798:      	cset	w2, ge
    b79c:      	ubfx	x2, x2, #0, #8
    b7a0:      	b	0xb928 <_stogir.stack.validate-scope-inputs+0x260>
    b7a4:      	movz	x1, #0x0, lsl #48
    b7a8:      	movz	x2, #0x0, lsl #48
    b7ac:      	movz	x6, #0x0, lsl #48
    b7b0:      	lsr	w1, w1, #0
    b7b4:      	lsr	x16, x1, #0
    b7b8:      	cmp	x16, #0x1
    b7bc:      	b.eq	0xb7d8 <_stogir.stack.validate-scope-inputs+0x110>
    b7c0:      	b.lo	0xb7c8 <_stogir.stack.validate-scope-inputs+0x100>
    b7c4:      	b	0xb7dc <_stogir.stack.validate-scope-inputs+0x114>
    b7c8:      	cmp	x16, #0x0
    b7cc:      	b.eq	0xb7d4 <_stogir.stack.validate-scope-inputs+0x10c>
    b7d0:      	b	0xb7dc <_stogir.stack.validate-scope-inputs+0x114>
    b7d4:      	b	0xb7e0 <_stogir.stack.validate-scope-inputs+0x118>
    b7d8:      	b	0xb8bc <_stogir.stack.validate-scope-inputs+0x1f4>
    b7dc:      	b	0xbb28 <_stogir.stack.validate-scope-inputs+0x460>
    b7e0:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000b7e0:  ARM64_RELOC_PAGE21	l_stogir.443
    b7e4:      	ldr	x16, [x16]
		000000000000b7e4:  ARM64_RELOC_PAGEOFF12	l_stogir.443
    b7e8:      	orr	x0, x16, xzr
    b7ec:      	mov	x1, x0
    b7f0:      	mov	x0, #0x1                ; =1
    b7f4:      	mov	x2, #0x1b               ; =27
    b7f8:      	b	0xb704 <_stogir.stack.validate-scope-inputs+0x3c>
    b7fc:      	lsl	x1, x6, #4
    b800:      	ldr	x2, [x0, #0x28]
    b804:      	add	x1, x1, x2
    b808:      	ldr	x2, [x1]
    b80c:      	ldr	x1, [x1, #0x8]
    b810:      	fmov	d31, x1
    b814:      	mov	x1, x2
    b818:      	fmov	x2, d31
    b81c:      	mov	x6, x2
    b820:      	mov	x2, x1
    b824:      	mov	x1, #0x1                ; =1
    b828:      	b	0xb7b0 <_stogir.stack.validate-scope-inputs+0xe8>
    b82c:      	movz	x2, #0x0, lsl #48
    b830:      	cmp	x2, #0x0
    b834:      	b.eq	0xb7a4 <_stogir.stack.validate-scope-inputs+0xdc>
    b838:      	uxtb	w16, w1
    b83c:      	cmp	w16, wzr
    b840:      	b.eq	0xb7fc <_stogir.stack.validate-scope-inputs+0x134>
    b844:      	lsl	x1, x3, #4
    b848:      	ldr	x2, [x0]
    b84c:      	add	x1, x1, x2
    b850:      	ldr	x2, [x1]
    b854:      	ldr	x1, [x1, #0x8]
    b858:      	fmov	d31, x1
    b85c:      	mov	x1, x2
    b860:      	fmov	x2, d31
    b864:      	b	0xb81c <_stogir.stack.validate-scope-inputs+0x154>
    b868:      	movz	x2, #0x0, lsl #48
    b86c:      	b	0xb830 <_stogir.stack.validate-scope-inputs+0x168>
    b870:      	cmp	x3, #0x0
    b874:      	b.ge	0xb82c <_stogir.stack.validate-scope-inputs+0x164>
    b878:      	add	x7, x0, #0x28
    b87c:      	add	x9, x0, #0x50
    b880:      	ldr	x7, [x7, #0x8]
    b884:      	ldr	x9, [x9, #0x8]
    b888:      	cmp	x7, x9
    b88c:      	b.ne	0xb91c <_stogir.stack.validate-scope-inputs+0x254>
    b890:      	cmp	x2, x7
    b894:      	b.gt	0xb92c <_stogir.stack.validate-scope-inputs+0x264>
    b898:      	lsl	x2, x6, #2
    b89c:      	ldr	x7, [x0, #0x50]
    b8a0:      	add	x2, x2, x7
    b8a4:      	ldr	w2, [x2]
    b8a8:      	sxtw	x2, w2
    b8ac:      	cmp	x2, #0x0
    b8b0:      	cset	w2, gt
    b8b4:      	ubfx	x2, x2, #0, #8
    b8b8:      	b	0xb930 <_stogir.stack.validate-scope-inputs+0x268>
    b8bc:      	mov	x16, sp
    b8c0:      	str	x2, [x16]
    b8c4:      	mov	x16, sp
    b8c8:      	str	x6, [x16, #0x8]
    b8cc:      	cmp	x3, #0x0
    b8d0:      	b.le	0xb900 <_stogir.stack.validate-scope-inputs+0x238>
    b8d4:      	mov	x16, sp
    b8d8:      	ldr	w1, [x16]
    b8dc:      	uxtb	w1, w1
    b8e0:      	cmp	x1, #0x83
    b8e4:      	b.ge	0xb934 <_stogir.stack.validate-scope-inputs+0x26c>
    b8e8:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000b8e8:  ARM64_RELOC_PAGE21	l_stogir.444
    b8ec:      	ldr	x16, [x16]
		000000000000b8ec:  ARM64_RELOC_PAGEOFF12	l_stogir.444
    b8f0:      	orr	x2, x16, xzr
    b8f4:      	add	x1, x1, x2
    b8f8:      	ldrb	w1, [x1]
    b8fc:      	b	0xb938 <_stogir.stack.validate-scope-inputs+0x270>
    b900:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000b900:  ARM64_RELOC_PAGE21	l_stogir.445
    b904:      	ldr	x16, [x16]
		000000000000b904:  ARM64_RELOC_PAGEOFF12	l_stogir.445
    b908:      	orr	x0, x16, xzr
    b90c:      	mov	x1, x0
    b910:      	mov	x0, #0x1                ; =1
    b914:      	mov	x2, #0x1b               ; =27
    b918:      	b	0xb7f8 <_stogir.stack.validate-scope-inputs+0x130>
    b91c:      	movz	x2, #0x0, lsl #48
    b920:      	b	0xb830 <_stogir.stack.validate-scope-inputs+0x168>
    b924:      	movz	x2, #0x0, lsl #48
    b928:      	b	0xb86c <_stogir.stack.validate-scope-inputs+0x1a4>
    b92c:      	movz	x2, #0x0, lsl #48
    b930:      	b	0xb920 <_stogir.stack.validate-scope-inputs+0x258>
    b934:      	movz	x1, #0x0, lsl #48
    b938:      	uxtb	w1, w1
    b93c:      	and	x1, x1, #0x1
    b940:      	uxtb	w1, w1
    b944:      	cmp	x1, #0x0
    b948:      	b.eq	0xb900 <_stogir.stack.validate-scope-inputs+0x238>
    b94c:      	mov	x16, sp
    b950:      	ldr	w1, [x16]
    b954:      	uxtb	w1, w1
    b958:      	cmp	x1, #0x83
    b95c:      	b.ge	0xb978 <_stogir.stack.validate-scope-inputs+0x2b0>
    b960:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000b960:  ARM64_RELOC_PAGE21	l_stogir.444
    b964:      	ldr	x16, [x16]
		000000000000b964:  ARM64_RELOC_PAGEOFF12	l_stogir.444
    b968:      	orr	x2, x16, xzr
    b96c:      	add	x1, x1, x2
    b970:      	ldrb	w1, [x1]
    b974:      	b	0xb97c <_stogir.stack.validate-scope-inputs+0x2b4>
    b978:      	movz	x1, #0x0, lsl #48
    b97c:      	uxtb	w1, w1
    b980:      	and	x1, x1, #0x4
    b984:      	uxtb	w1, w1
    b988:      	cmp	x1, #0x0
    b98c:      	b.ne	0xb900 <_stogir.stack.validate-scope-inputs+0x238>
    b990:      	uxtb	w16, w5
    b994:      	cmp	w16, wzr
    b998:      	b.eq	0xb9ac <_stogir.stack.validate-scope-inputs+0x2e4>
    b99c:      	movz	x0, #0x0, lsl #48
    b9a0:      	mov	x1, #0x8                ; =8
    b9a4:      	movz	x2, #0x0, lsl #48
    b9a8:      	b	0xb918 <_stogir.stack.validate-scope-inputs+0x250>
    b9ac:      	sxtw	x4, w4
    b9b0:      	cmp	x4, #0x0
    b9b4:      	cset	w1, gt
    b9b8:      	movz	x16, #0x0, lsl #48
    b9bc:      	sub	x2, x16, x4
    b9c0:      	sub	x3, x2, #0x1
    b9c4:      	uxtb	w16, w1
    b9c8:      	cmp	w16, wzr
    b9cc:      	b.eq	0xbadc <_stogir.stack.validate-scope-inputs+0x414>
    b9d0:      	ldr	x2, [x0, #0x8]
    b9d4:      	cmp	x4, x2
    b9d8:      	b.ge	0xbad4 <_stogir.stack.validate-scope-inputs+0x40c>
    b9dc:      	add	x2, x0, #0x78
    b9e0:      	ldr	x2, [x2, #0x8]
    b9e4:      	cmp	x4, x2
    b9e8:      	b.ge	0xbb98 <_stogir.stack.validate-scope-inputs+0x4d0>
    b9ec:      	lsl	x2, x4, #2
    b9f0:      	ldr	x5, [x0, #0x78]
    b9f4:      	add	x2, x2, x5
    b9f8:      	ldr	w2, [x2]
    b9fc:      	sxtw	x2, w2
    ba00:      	cmp	x2, #0x0
    ba04:      	cset	w2, ge
    ba08:      	ubfx	x2, x2, #0, #8
    ba0c:      	b	0xbb9c <_stogir.stack.validate-scope-inputs+0x4d4>
    ba10:      	movz	x0, #0x0, lsl #48
    ba14:      	movz	x1, #0x0, lsl #48
    ba18:      	movz	x2, #0x0, lsl #48
    ba1c:      	lsr	w0, w0, #0
    ba20:      	lsr	x16, x0, #0
    ba24:      	cmp	x16, #0x1
    ba28:      	b.eq	0xba44 <_stogir.stack.validate-scope-inputs+0x37c>
    ba2c:      	b.lo	0xba34 <_stogir.stack.validate-scope-inputs+0x36c>
    ba30:      	b	0xba48 <_stogir.stack.validate-scope-inputs+0x380>
    ba34:      	cmp	x16, #0x0
    ba38:      	b.eq	0xba40 <_stogir.stack.validate-scope-inputs+0x378>
    ba3c:      	b	0xba48 <_stogir.stack.validate-scope-inputs+0x380>
    ba40:      	b	0xba4c <_stogir.stack.validate-scope-inputs+0x384>
    ba44:      	b	0xbb30 <_stogir.stack.validate-scope-inputs+0x468>
    ba48:      	b	0xbba8 <_stogir.stack.validate-scope-inputs+0x4e0>
    ba4c:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000ba4c:  ARM64_RELOC_PAGE21	l_stogir.446
    ba50:      	ldr	x16, [x16]
		000000000000ba50:  ARM64_RELOC_PAGEOFF12	l_stogir.446
    ba54:      	orr	x0, x16, xzr
    ba58:      	mov	x1, x0
    ba5c:      	mov	x0, #0x1                ; =1
    ba60:      	mov	x2, #0x1b               ; =27
    ba64:      	b	0xb9a8 <_stogir.stack.validate-scope-inputs+0x2e0>
    ba68:      	lsl	x1, x3, #4
    ba6c:      	ldr	x0, [x0, #0x28]
    ba70:      	add	x0, x1, x0
    ba74:      	ldr	x1, [x0]
    ba78:      	ldr	x0, [x0, #0x8]
    ba7c:      	fmov	d31, x0
    ba80:      	mov	x0, x1
    ba84:      	fmov	x1, d31
    ba88:      	mov	x2, x1
    ba8c:      	mov	x1, x0
    ba90:      	mov	x0, #0x1                ; =1
    ba94:      	b	0xba1c <_stogir.stack.validate-scope-inputs+0x354>
    ba98:      	movz	x2, #0x0, lsl #48
    ba9c:      	cmp	x2, #0x0
    baa0:      	b.eq	0xba10 <_stogir.stack.validate-scope-inputs+0x348>
    baa4:      	uxtb	w16, w1
    baa8:      	cmp	w16, wzr
    baac:      	b.eq	0xba68 <_stogir.stack.validate-scope-inputs+0x3a0>
    bab0:      	lsl	x1, x4, #4
    bab4:      	ldr	x0, [x0]
    bab8:      	add	x0, x1, x0
    babc:      	ldr	x1, [x0]
    bac0:      	ldr	x0, [x0, #0x8]
    bac4:      	fmov	d31, x0
    bac8:      	mov	x0, x1
    bacc:      	fmov	x1, d31
    bad0:      	b	0xba88 <_stogir.stack.validate-scope-inputs+0x3c0>
    bad4:      	movz	x2, #0x0, lsl #48
    bad8:      	b	0xba9c <_stogir.stack.validate-scope-inputs+0x3d4>
    badc:      	cmp	x4, #0x0
    bae0:      	b.ge	0xba98 <_stogir.stack.validate-scope-inputs+0x3d0>
    bae4:      	add	x5, x0, #0x28
    bae8:      	add	x6, x0, #0x50
    baec:      	ldr	x5, [x5, #0x8]
    baf0:      	ldr	x6, [x6, #0x8]
    baf4:      	cmp	x5, x6
    baf8:      	b.ne	0xbb90 <_stogir.stack.validate-scope-inputs+0x4c8>
    bafc:      	cmp	x2, x5
    bb00:      	b.gt	0xbba0 <_stogir.stack.validate-scope-inputs+0x4d8>
    bb04:      	lsl	x2, x3, #2
    bb08:      	ldr	x5, [x0, #0x50]
    bb0c:      	add	x2, x2, x5
    bb10:      	ldr	w2, [x2]
    bb14:      	sxtw	x2, w2
    bb18:      	cmp	x2, #0x0
    bb1c:      	cset	w2, gt
    bb20:      	ubfx	x2, x2, #0, #8
    bb24:      	b	0xbba4 <_stogir.stack.validate-scope-inputs+0x4dc>
    bb28:      	brk	#0
    bb2c:      	b	0xbb28 <_stogir.stack.validate-scope-inputs+0x460>
    bb30:      	lsr	w0, w1, #0
    bb34:      	add	x16, sp, #0x10
    bb38:      	str	x1, [x16]
    bb3c:      	add	x16, sp, #0x10
    bb40:      	str	x2, [x16, #0x8]
    bb44:      	ubfx	x0, x0, #8, #8
    bb48:      	cmp	x0, #0x6
    bb4c:      	b.ne	0xbb74 <_stogir.stack.validate-scope-inputs+0x4ac>
    bb50:      	add	x16, sp, #0x10
    bb54:      	ldr	w0, [x16]
    bb58:      	uxtb	w0, w0
    bb5c:      	cmp	x0, #0x48
    bb60:      	b.eq	0xbb74 <_stogir.stack.validate-scope-inputs+0x4ac>
    bb64:      	movz	x0, #0x0, lsl #48
    bb68:      	mov	x1, #0x8                ; =8
    bb6c:      	movz	x2, #0x0, lsl #48
    bb70:      	b	0xbb8c <_stogir.stack.validate-scope-inputs+0x4c4>
    bb74:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000bb74:  ARM64_RELOC_PAGE21	l_stogir.447
    bb78:      	ldr	x16, [x16]
		000000000000bb78:  ARM64_RELOC_PAGEOFF12	l_stogir.447
    bb7c:      	orr	x0, x16, xzr
    bb80:      	mov	x1, x0
    bb84:      	mov	x0, #0x1                ; =1
    bb88:      	mov	x2, #0x29               ; =41
    bb8c:      	b	0xba64 <_stogir.stack.validate-scope-inputs+0x39c>
    bb90:      	movz	x2, #0x0, lsl #48
    bb94:      	b	0xba9c <_stogir.stack.validate-scope-inputs+0x3d4>
    bb98:      	movz	x2, #0x0, lsl #48
    bb9c:      	b	0xbad8 <_stogir.stack.validate-scope-inputs+0x410>
    bba0:      	movz	x2, #0x0, lsl #48
    bba4:      	b	0xbb94 <_stogir.stack.validate-scope-inputs+0x4cc>
    bba8:      	brk	#0
    bbac:      	b	0xbba8 <_stogir.stack.validate-scope-inputs+0x4e0>

000000000000bbb0 <_stogir.stack.validate-inputs>:
    bbb0:      	sub	sp, sp, #0xe0
    bbb4:      	str	x29, [sp]
    bbb8:      	str	x30, [sp, #0x8]
    bbbc:      	mov	x29, sp
    bbc0:      	str	x19, [sp, #0xb0]
    bbc4:      	str	x20, [sp, #0xb8]
    bbc8:      	str	x21, [sp, #0xc0]
    bbcc:      	str	x22, [sp, #0xc8]
    bbd0:      	str	x23, [sp, #0xd0]
    bbd4:      	str	x24, [sp, #0xd8]
    bbd8:      	sxtw	x1, w1
    bbdc:      	cmp	x1, #0x51
    bbe0:      	cset	w19, eq
    bbe4:      	uxtb	w16, w19
    bbe8:      	cmp	w16, wzr
    bbec:      	b.ne	0xbc48 <_stogir.stack.validate-inputs+0x98>
    bbf0:      	cmp	x1, #0x52
    bbf4:      	b.eq	0xbc48 <_stogir.stack.validate-inputs+0x98>
    bbf8:      	mov	x21, x8
    bbfc:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000bbfc:  ARM64_RELOC_PAGE21	l_stogir.448
    bc00:      	ldr	x16, [x16]
		000000000000bc00:  ARM64_RELOC_PAGEOFF12	l_stogir.448
    bc04:      	orr	x0, x16, xzr
    bc08:      	mov	x1, x0
    bc0c:      	mov	x0, #0x1                ; =1
    bc10:      	mov	x2, #0x29               ; =41
    bc14:      	str	x0, [x21]
    bc18:      	str	x1, [x21, #0x8]
    bc1c:      	str	x2, [x21, #0x10]
    bc20:      	ldr	x19, [sp, #0xb0]
    bc24:      	ldr	x20, [sp, #0xb8]
    bc28:      	ldr	x21, [sp, #0xc0]
    bc2c:      	ldr	x22, [sp, #0xc8]
    bc30:      	ldr	x23, [sp, #0xd0]
    bc34:      	ldr	x24, [sp, #0xd8]
    bc38:      	ldr	x29, [sp]
    bc3c:      	ldr	x30, [sp, #0x8]
    bc40:      	add	sp, sp, #0xe0
    bc44:      	ret
    bc48:      	uxtb	w16, w19
    bc4c:      	cmp	w16, wzr
    bc50:      	mov	x16, #0x6               ; =6
    bc54:      	movz	x17, #0x0, lsl #48
    bc58:      	csel	x1, x16, x17, ne
    bc5c:      	sxtw	x2, w2
    bc60:      	lsr	w1, w1, #0
    bc64:      	sxtw	x1, w1
    bc68:      	cmp	x2, x1
    bc6c:      	b.ne	0xc12c <_stogir.stack.validate-inputs+0x57c>
    bc70:      	sxtw	x20, w5
    bc74:      	uxtb	w16, w19
    bc78:      	cmp	w16, wzr
    bc7c:      	b.eq	0xbca8 <_stogir.stack.validate-inputs+0xf8>
    bc80:      	cmp	x20, #0x0
    bc84:      	b.eq	0xbca8 <_stogir.stack.validate-inputs+0xf8>
    bc88:      	cmp	x20, #0x0
    bc8c:      	b.le	0xbd94 <_stogir.stack.validate-inputs+0x1e4>
    bc90:      	sub	x1, x20, #0x1
    bc94:      	and	x1, x1, x20
    bc98:      	cmp	x1, #0x0
    bc9c:      	cset	w1, eq
    bca0:      	ubfx	x1, x1, #0, #8
    bca4:      	b	0xbd98 <_stogir.stack.validate-inputs+0x1e8>
    bca8:      	lsr	w3, w3, #0
    bcac:      	mov	w1, w3
    bcb0:      	mov	x21, x8
    bcb4:      	add	x8, sp, #0x10
    bcb8:      	mov	x22, x0
    bcbc:      	mov	w23, w3
    bcc0:      	mov	w24, w4
    bcc4:      	bl	0xbcc4 <_stogir.stack.validate-inputs+0x114>
		000000000000bcc4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    bcc8:      	add	x16, sp, #0x10
    bccc:      	ldr	w0, [x16]
    bcd0:      	lsr	x16, x0, #0
    bcd4:      	cmp	x16, #0x1
    bcd8:      	b.eq	0xbcf4 <_stogir.stack.validate-inputs+0x144>
    bcdc:      	b.lo	0xbce4 <_stogir.stack.validate-inputs+0x134>
    bce0:      	b	0xbcf8 <_stogir.stack.validate-inputs+0x148>
    bce4:      	cmp	x16, #0x0
    bce8:      	b.eq	0xbcf0 <_stogir.stack.validate-inputs+0x140>
    bcec:      	b	0xbcf8 <_stogir.stack.validate-inputs+0x148>
    bcf0:      	b	0xbcfc <_stogir.stack.validate-inputs+0x14c>
    bcf4:      	b	0xbd18 <_stogir.stack.validate-inputs+0x168>
    bcf8:      	b	0xbf00 <_stogir.stack.validate-inputs+0x350>
    bcfc:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000bcfc:  ARM64_RELOC_PAGE21	l_stogir.449
    bd00:      	ldr	x16, [x16]
		000000000000bd00:  ARM64_RELOC_PAGEOFF12	l_stogir.449
    bd04:      	orr	x0, x16, xzr
    bd08:      	mov	x1, x0
    bd0c:      	mov	x0, #0x1                ; =1
    bd10:      	mov	x2, #0x1f               ; =31
    bd14:      	b	0xbc14 <_stogir.stack.validate-inputs+0x64>
    bd18:      	sxtw	x23, w23
    bd1c:      	add	x16, sp, #0x10
    bd20:      	orr	x0, x16, xzr
    bd24:      	add	x0, x0, #0x8
    bd28:      	add	x16, sp, #0x10
    bd2c:      	ldr	x1, [x16, #0x8]
    bd30:      	add	x16, sp, #0x40
    bd34:      	str	x1, [x16]
    bd38:      	ldr	x0, [x0, #0x8]
    bd3c:      	add	x16, sp, #0x40
    bd40:      	str	x0, [x16, #0x8]
    bd44:      	cmp	x23, #0x0
    bd48:      	b.le	0xbd78 <_stogir.stack.validate-inputs+0x1c8>
    bd4c:      	add	x16, sp, #0x40
    bd50:      	ldr	w0, [x16]
    bd54:      	uxtb	w0, w0
    bd58:      	cmp	x0, #0x83
    bd5c:      	b.ge	0xbda8 <_stogir.stack.validate-inputs+0x1f8>
    bd60:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000bd60:  ARM64_RELOC_PAGE21	l_stogir.450
    bd64:      	ldr	x16, [x16]
		000000000000bd64:  ARM64_RELOC_PAGEOFF12	l_stogir.450
    bd68:      	orr	x1, x16, xzr
    bd6c:      	add	x0, x0, x1
    bd70:      	ldrb	w0, [x0]
    bd74:      	b	0xbdac <_stogir.stack.validate-inputs+0x1fc>
    bd78:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000bd78:  ARM64_RELOC_PAGE21	l_stogir.451
    bd7c:      	ldr	x16, [x16]
		000000000000bd7c:  ARM64_RELOC_PAGEOFF12	l_stogir.451
    bd80:      	orr	x0, x16, xzr
    bd84:      	mov	x1, x0
    bd88:      	mov	x0, #0x1                ; =1
    bd8c:      	mov	x2, #0x1f               ; =31
    bd90:      	b	0xbd14 <_stogir.stack.validate-inputs+0x164>
    bd94:      	movz	x1, #0x0, lsl #48
    bd98:      	cmp	x1, #0x0
    bd9c:      	b.ne	0xbca8 <_stogir.stack.validate-inputs+0xf8>
    bda0:      	mov	x21, x8
    bda4:      	b	0xbbfc <_stogir.stack.validate-inputs+0x4c>
    bda8:      	movz	x0, #0x0, lsl #48
    bdac:      	uxtb	w0, w0
    bdb0:      	and	x0, x0, #0x1
    bdb4:      	uxtb	w0, w0
    bdb8:      	cmp	x0, #0x0
    bdbc:      	b.eq	0xbd78 <_stogir.stack.validate-inputs+0x1c8>
    bdc0:      	add	x16, sp, #0x40
    bdc4:      	ldr	w0, [x16]
    bdc8:      	uxtb	w0, w0
    bdcc:      	cmp	x0, #0x83
    bdd0:      	b.ge	0xbdec <_stogir.stack.validate-inputs+0x23c>
    bdd4:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000bdd4:  ARM64_RELOC_PAGE21	l_stogir.450
    bdd8:      	ldr	x16, [x16]
		000000000000bdd8:  ARM64_RELOC_PAGEOFF12	l_stogir.450
    bddc:      	orr	x1, x16, xzr
    bde0:      	add	x0, x0, x1
    bde4:      	ldrb	w0, [x0]
    bde8:      	b	0xbdf0 <_stogir.stack.validate-inputs+0x240>
    bdec:      	movz	x0, #0x0, lsl #48
    bdf0:      	uxtb	w0, w0
    bdf4:      	and	x0, x0, #0x4
    bdf8:      	uxtb	w0, w0
    bdfc:      	cmp	x0, #0x0
    be00:      	b.ne	0xbd78 <_stogir.stack.validate-inputs+0x1c8>
    be04:      	lsr	w24, w24, #0
    be08:      	add	x8, sp, #0x50
    be0c:      	mov	x0, x22
    be10:      	mov	w1, w24
    be14:      	bl	0xbe14 <_stogir.stack.validate-inputs+0x264>
		000000000000be14:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    be18:      	add	x16, sp, #0x50
    be1c:      	ldr	w0, [x16]
    be20:      	lsr	x16, x0, #0
    be24:      	cmp	x16, #0x1
    be28:      	b.eq	0xbe44 <_stogir.stack.validate-inputs+0x294>
    be2c:      	b.lo	0xbe34 <_stogir.stack.validate-inputs+0x284>
    be30:      	b	0xbe48 <_stogir.stack.validate-inputs+0x298>
    be34:      	cmp	x16, #0x0
    be38:      	b.eq	0xbe40 <_stogir.stack.validate-inputs+0x290>
    be3c:      	b	0xbe48 <_stogir.stack.validate-inputs+0x298>
    be40:      	b	0xbe4c <_stogir.stack.validate-inputs+0x29c>
    be44:      	b	0xbe68 <_stogir.stack.validate-inputs+0x2b8>
    be48:      	b	0xc050 <_stogir.stack.validate-inputs+0x4a0>
    be4c:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000be4c:  ARM64_RELOC_PAGE21	l_stogir.452
    be50:      	ldr	x16, [x16]
		000000000000be50:  ARM64_RELOC_PAGEOFF12	l_stogir.452
    be54:      	orr	x0, x16, xzr
    be58:      	mov	x1, x0
    be5c:      	mov	x0, #0x1                ; =1
    be60:      	mov	x2, #0x18               ; =24
    be64:      	b	0xbd90 <_stogir.stack.validate-inputs+0x1e0>
    be68:      	add	x16, sp, #0x50
    be6c:      	orr	x0, x16, xzr
    be70:      	add	x0, x0, #0x8
    be74:      	add	x16, sp, #0x50
    be78:      	ldr	x1, [x16, #0x8]
    be7c:      	add	x16, sp, #0x80
    be80:      	str	x1, [x16]
    be84:      	lsr	w1, w1, #0
    be88:      	ldr	x0, [x0, #0x8]
    be8c:      	add	x16, sp, #0x80
    be90:      	str	x0, [x16, #0x8]
    be94:      	ubfx	x0, x1, #8, #8
    be98:      	cmp	x0, #0x1
    be9c:      	b.lt	0xbee4 <_stogir.stack.validate-inputs+0x334>
    bea0:      	cmp	x0, #0xb
    bea4:      	b.gt	0xbee4 <_stogir.stack.validate-inputs+0x334>
    bea8:      	add	x16, sp, #0x80
    beac:      	ldr	w0, [x16]
    beb0:      	uxtb	w1, w0
    beb4:      	cmp	x1, #0x48
    beb8:      	b.eq	0xbee4 <_stogir.stack.validate-inputs+0x334>
    bebc:      	sxtw	x1, w24
    bec0:      	cmp	x1, #0x0
    bec4:      	b.ge	0xbf28 <_stogir.stack.validate-inputs+0x378>
    bec8:      	uxtb	w16, w19
    becc:      	cmp	w16, wzr
    bed0:      	b.eq	0xbfdc <_stogir.stack.validate-inputs+0x42c>
    bed4:      	cmp	x20, #0x10
    bed8:      	b.le	0xbfdc <_stogir.stack.validate-inputs+0x42c>
    bedc:      	mov	x0, x20
    bee0:      	b	0xbfe0 <_stogir.stack.validate-inputs+0x430>
    bee4:      	adrp	x16, 0xb000 <_stogir.switch.switch-inputs+0x484>
		000000000000bee4:  ARM64_RELOC_PAGE21	l_stogir.453
    bee8:      	ldr	x16, [x16]
		000000000000bee8:  ARM64_RELOC_PAGEOFF12	l_stogir.453
    beec:      	orr	x0, x16, xzr
    bef0:      	mov	x1, x0
    bef4:      	mov	x0, #0x1                ; =1
    bef8:      	mov	x2, #0x29               ; =41
    befc:      	b	0xbe64 <_stogir.stack.validate-inputs+0x2b4>
    bf00:      	brk	#0
    bf04:      	b	0xbf00 <_stogir.stack.validate-inputs+0x350>
    bf08:      	mov	x0, #0x1                ; =1
    bf0c:      	lsr	w0, w0, #0
    bf10:      	sxtw	x0, w0
    bf14:      	and	x0, x0, #0xffffffff
    bf18:      	mov	x1, x0
    bf1c:      	movz	x0, #0x0, lsl #48
    bf20:      	movz	x2, #0x0, lsl #48
    bf24:      	b	0xbefc <_stogir.stack.validate-inputs+0x34c>
    bf28:      	ubfx	x0, x0, #8, #8
    bf2c:      	cmp	x0, #0x0
    bf30:      	b.ne	0xbf5c <_stogir.stack.validate-inputs+0x3ac>
    bf34:      	movz	x0, #0x0, lsl #48
    bf38:      	b	0xbf0c <_stogir.stack.validate-inputs+0x35c>
    bf3c:      	mov	x0, #0x1                ; =1
    bf40:      	lsr	w0, w0, #0
    bf44:      	sxtw	x0, w0
    bf48:      	and	x0, x0, #0xffffffff
    bf4c:      	mov	x1, x0
    bf50:      	movz	x0, #0x0, lsl #48
    bf54:      	movz	x2, #0x0, lsl #48
    bf58:      	b	0xbf24 <_stogir.stack.validate-inputs+0x374>
    bf5c:      	cmp	x0, #0x1
    bf60:      	b.eq	0xbf08 <_stogir.stack.validate-inputs+0x358>
    bf64:      	cmp	x0, #0x2
    bf68:      	b.eq	0xbf08 <_stogir.stack.validate-inputs+0x358>
    bf6c:      	cmp	x0, #0x7
    bf70:      	b.eq	0xbf08 <_stogir.stack.validate-inputs+0x358>
    bf74:      	cmp	x0, #0x8
    bf78:      	b.eq	0xbf08 <_stogir.stack.validate-inputs+0x358>
    bf7c:      	cmp	x0, #0x3
    bf80:      	b.eq	0xc0f4 <_stogir.stack.validate-inputs+0x544>
    bf84:      	cmp	x0, #0x9
    bf88:      	b.eq	0xc0f4 <_stogir.stack.validate-inputs+0x544>
    bf8c:      	cmp	x0, #0x4
    bf90:      	b.eq	0xc10c <_stogir.stack.validate-inputs+0x55c>
    bf94:      	cmp	x0, #0xa
    bf98:      	b.eq	0xc10c <_stogir.stack.validate-inputs+0x55c>
    bf9c:      	cmp	x0, #0xd
    bfa0:      	b.eq	0xc10c <_stogir.stack.validate-inputs+0x55c>
    bfa4:      	cmp	x0, #0x5
    bfa8:      	b.eq	0xc11c <_stogir.stack.validate-inputs+0x56c>
    bfac:      	cmp	x0, #0xb
    bfb0:      	b.eq	0xc11c <_stogir.stack.validate-inputs+0x56c>
    bfb4:      	cmp	x0, #0xc
    bfb8:      	b.eq	0xc11c <_stogir.stack.validate-inputs+0x56c>
    bfbc:      	cmp	x0, #0x6
    bfc0:      	cset	w0, eq
    bfc4:      	uxtb	w16, w0
    bfc8:      	cmp	w16, wzr
    bfcc:      	mov	x16, #0x8               ; =8
    bfd0:      	movn	x17, #0x0, lsl #48
    bfd4:      	csel	x0, x16, x17, ne
    bfd8:      	b	0xc120 <_stogir.stack.validate-inputs+0x570>
    bfdc:      	mov	x0, #0x10               ; =16
    bfe0:      	lsr	w24, w24, #0
    bfe4:      	add	x8, sp, #0x90
    bfe8:      	mov	w1, w24
    bfec:      	mov	x2, x0
    bff0:      	mov	x0, x22
    bff4:      	bl	0xbff4 <_stogir.stack.validate-inputs+0x444>
		000000000000bff4:  ARM64_RELOC_BRANCH26	_stogir.stack.constant-size-aligned
    bff8:      	add	x16, sp, #0x90
    bffc:      	ldr	w0, [x16]
    c000:      	lsr	x16, x0, #0
    c004:      	cmp	x16, #0x1
    c008:      	b.eq	0xc024 <_stogir.stack.validate-inputs+0x474>
    c00c:      	b.lo	0xc014 <_stogir.stack.validate-inputs+0x464>
    c010:      	b	0xc028 <_stogir.stack.validate-inputs+0x478>
    c014:      	cmp	x16, #0x0
    c018:      	b.eq	0xc020 <_stogir.stack.validate-inputs+0x470>
    c01c:      	b	0xc028 <_stogir.stack.validate-inputs+0x478>
    c020:      	b	0xc058 <_stogir.stack.validate-inputs+0x4a8>
    c024:      	b	0xc02c <_stogir.stack.validate-inputs+0x47c>
    c028:      	b	0xc104 <_stogir.stack.validate-inputs+0x554>
    c02c:      	add	x16, sp, #0x90
    c030:      	orr	x0, x16, xzr
    c034:      	add	x0, x0, #0x8
    c038:      	add	x16, sp, #0x90
    c03c:      	ldr	x1, [x16, #0x8]
    c040:      	ldr	x0, [x0, #0x8]
    c044:      	mov	x2, x0
    c048:      	mov	x0, #0x1                ; =1
    c04c:      	b	0xbf58 <_stogir.stack.validate-inputs+0x3a8>
    c050:      	brk	#0
    c054:      	b	0xc050 <_stogir.stack.validate-inputs+0x4a0>
    c058:      	add	x16, sp, #0x80
    c05c:      	ldr	w0, [x16]
    c060:      	ubfx	x0, x0, #8, #8
    c064:      	cmp	x0, #0x0
    c068:      	b.ne	0xc074 <_stogir.stack.validate-inputs+0x4c4>
    c06c:      	movz	x0, #0x0, lsl #48
    c070:      	b	0xbf40 <_stogir.stack.validate-inputs+0x390>
    c074:      	cmp	x0, #0x1
    c078:      	b.eq	0xbf3c <_stogir.stack.validate-inputs+0x38c>
    c07c:      	cmp	x0, #0x2
    c080:      	b.eq	0xbf3c <_stogir.stack.validate-inputs+0x38c>
    c084:      	cmp	x0, #0x7
    c088:      	b.eq	0xbf3c <_stogir.stack.validate-inputs+0x38c>
    c08c:      	cmp	x0, #0x8
    c090:      	b.eq	0xbf3c <_stogir.stack.validate-inputs+0x38c>
    c094:      	cmp	x0, #0x3
    c098:      	b.eq	0xc0fc <_stogir.stack.validate-inputs+0x54c>
    c09c:      	cmp	x0, #0x9
    c0a0:      	b.eq	0xc0fc <_stogir.stack.validate-inputs+0x54c>
    c0a4:      	cmp	x0, #0x4
    c0a8:      	b.eq	0xc114 <_stogir.stack.validate-inputs+0x564>
    c0ac:      	cmp	x0, #0xa
    c0b0:      	b.eq	0xc114 <_stogir.stack.validate-inputs+0x564>
    c0b4:      	cmp	x0, #0xd
    c0b8:      	b.eq	0xc114 <_stogir.stack.validate-inputs+0x564>
    c0bc:      	cmp	x0, #0x5
    c0c0:      	b.eq	0xc124 <_stogir.stack.validate-inputs+0x574>
    c0c4:      	cmp	x0, #0xb
    c0c8:      	b.eq	0xc124 <_stogir.stack.validate-inputs+0x574>
    c0cc:      	cmp	x0, #0xc
    c0d0:      	b.eq	0xc124 <_stogir.stack.validate-inputs+0x574>
    c0d4:      	cmp	x0, #0x6
    c0d8:      	cset	w0, eq
    c0dc:      	uxtb	w16, w0
    c0e0:      	cmp	w16, wzr
    c0e4:      	mov	x16, #0x8               ; =8
    c0e8:      	movn	x17, #0x0, lsl #48
    c0ec:      	csel	x0, x16, x17, ne
    c0f0:      	b	0xc128 <_stogir.stack.validate-inputs+0x578>
    c0f4:      	mov	x0, #0x2                ; =2
    c0f8:      	b	0xbf0c <_stogir.stack.validate-inputs+0x35c>
    c0fc:      	mov	x0, #0x2                ; =2
    c100:      	b	0xbf40 <_stogir.stack.validate-inputs+0x390>
    c104:      	brk	#0
    c108:      	b	0xc104 <_stogir.stack.validate-inputs+0x554>
    c10c:      	mov	x0, #0x4                ; =4
    c110:      	b	0xc0f8 <_stogir.stack.validate-inputs+0x548>
    c114:      	mov	x0, #0x4                ; =4
    c118:      	b	0xc100 <_stogir.stack.validate-inputs+0x550>
    c11c:      	mov	x0, #0x8                ; =8
    c120:      	b	0xc110 <_stogir.stack.validate-inputs+0x560>
    c124:      	mov	x0, #0x8                ; =8
    c128:      	b	0xc118 <_stogir.stack.validate-inputs+0x568>
    c12c:      	mov	x21, x8
    c130:      	b	0xbbfc <_stogir.stack.validate-inputs+0x4c>

000000000000c134 <_stogir.locals.shape>:
    c134:      	sub	sp, sp, #0x50
    c138:      	str	x29, [sp]
    c13c:      	str	x30, [sp, #0x8]
    c140:      	mov	x29, sp
    c144:      	str	x19, [sp, #0x30]
    c148:      	str	x20, [sp, #0x38]
    c14c:      	str	x21, [sp, #0x40]
    c150:      	str	x22, [sp, #0x48]
    c154:      	sxtw	x19, w1
    c158:      	lsl	x20, x19, #2
    c15c:      	cmp	x19, #0x0
    c160:      	cset	w1, gt
    c164:      	movz	x16, #0x0, lsl #48
    c168:      	sub	x3, x16, x19
    c16c:      	sub	x4, x3, #0x1
    c170:      	uxtb	w16, w1
    c174:      	cmp	w16, wzr
    c178:      	b.eq	0xc1b8 <_stogir.locals.shape+0x84>
    c17c:      	ldr	x3, [x0, #0x8]
    c180:      	cmp	x19, x3
    c184:      	b.ge	0xc228 <_stogir.locals.shape+0xf4>
    c188:      	add	x3, x0, #0x78
    c18c:      	ldr	x3, [x3, #0x8]
    c190:      	cmp	x19, x3
    c194:      	b.ge	0xc3fc <_stogir.locals.shape+0x2c8>
    c198:      	ldr	x3, [x0, #0x78]
    c19c:      	add	x3, x20, x3
    c1a0:      	ldr	w3, [x3]
    c1a4:      	sxtw	x3, w3
    c1a8:      	cmp	x3, #0x0
    c1ac:      	cset	w3, ge
    c1b0:      	ubfx	x3, x3, #0, #8
    c1b4:      	b	0xc400 <_stogir.locals.shape+0x2cc>
    c1b8:      	cmp	x19, #0x0
    c1bc:      	b.ge	0xc230 <_stogir.locals.shape+0xfc>
    c1c0:      	add	x5, x0, #0x28
    c1c4:      	add	x6, x0, #0x50
    c1c8:      	ldr	x5, [x5, #0x8]
    c1cc:      	ldr	x6, [x6, #0x8]
    c1d0:      	cmp	x5, x6
    c1d4:      	b.ne	0xc204 <_stogir.locals.shape+0xd0>
    c1d8:      	cmp	x3, x5
    c1dc:      	b.gt	0xc46c <_stogir.locals.shape+0x338>
    c1e0:      	lsl	x3, x4, #2
    c1e4:      	ldr	x5, [x0, #0x50]
    c1e8:      	add	x3, x3, x5
    c1ec:      	ldr	w3, [x3]
    c1f0:      	sxtw	x3, w3
    c1f4:      	cmp	x3, #0x0
    c1f8:      	cset	w3, gt
    c1fc:      	ubfx	x3, x3, #0, #8
    c200:      	b	0xc470 <_stogir.locals.shape+0x33c>
    c204:      	movz	x3, #0x0, lsl #48
    c208:      	b	0xc234 <_stogir.locals.shape+0x100>
    c20c:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000c20c:  ARM64_RELOC_PAGE21	l_stogir.454
    c210:      	ldr	x16, [x16]
		000000000000c210:  ARM64_RELOC_PAGEOFF12	l_stogir.454
    c214:      	orr	x0, x16, xzr
    c218:      	mov	x1, x0
    c21c:      	mov	x0, #0x1                ; =1
    c220:      	mov	x2, #0x1c               ; =28
    c224:      	b	0xc2f4 <_stogir.locals.shape+0x1c0>
    c228:      	movz	x3, #0x0, lsl #48
    c22c:      	b	0xc234 <_stogir.locals.shape+0x100>
    c230:      	movz	x3, #0x0, lsl #48
    c234:      	cmp	x3, #0x0
    c238:      	b.eq	0xc29c <_stogir.locals.shape+0x168>
    c23c:      	uxtb	w16, w1
    c240:      	cmp	w16, wzr
    c244:      	b.eq	0xc26c <_stogir.locals.shape+0x138>
    c248:      	lsl	x1, x19, #4
    c24c:      	ldr	x3, [x0]
    c250:      	add	x1, x1, x3
    c254:      	ldr	x3, [x1]
    c258:      	ldr	x1, [x1, #0x8]
    c25c:      	fmov	d31, x1
    c260:      	mov	x1, x3
    c264:      	fmov	x3, d31
    c268:      	b	0xc28c <_stogir.locals.shape+0x158>
    c26c:      	lsl	x1, x4, #4
    c270:      	ldr	x3, [x0, #0x28]
    c274:      	add	x1, x1, x3
    c278:      	ldr	x3, [x1]
    c27c:      	ldr	x1, [x1, #0x8]
    c280:      	fmov	d31, x1
    c284:      	mov	x1, x3
    c288:      	fmov	x3, d31
    c28c:      	mov	x4, x3
    c290:      	mov	x3, x1
    c294:      	mov	x1, #0x1                ; =1
    c298:      	b	0xc2a8 <_stogir.locals.shape+0x174>
    c29c:      	movz	x1, #0x0, lsl #48
    c2a0:      	movz	x3, #0x0, lsl #48
    c2a4:      	movz	x4, #0x0, lsl #48
    c2a8:      	lsr	w1, w1, #0
    c2ac:      	lsr	x16, x1, #0
    c2b0:      	cmp	x16, #0x1
    c2b4:      	b.eq	0xc2d0 <_stogir.locals.shape+0x19c>
    c2b8:      	b.lo	0xc2c0 <_stogir.locals.shape+0x18c>
    c2bc:      	b	0xc2d4 <_stogir.locals.shape+0x1a0>
    c2c0:      	cmp	x16, #0x0
    c2c4:      	b.eq	0xc2cc <_stogir.locals.shape+0x198>
    c2c8:      	b	0xc2d4 <_stogir.locals.shape+0x1a0>
    c2cc:      	b	0xc2d8 <_stogir.locals.shape+0x1a4>
    c2d0:      	b	0xc320 <_stogir.locals.shape+0x1ec>
    c2d4:      	b	0xc4c0 <_stogir.locals.shape+0x38c>
    c2d8:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000c2d8:  ARM64_RELOC_PAGE21	l_stogir.455
    c2dc:      	ldr	x16, [x16]
		000000000000c2dc:  ARM64_RELOC_PAGEOFF12	l_stogir.455
    c2e0:      	orr	x0, x16, xzr
    c2e4:      	mov	x21, x8
    c2e8:      	mov	x1, x0
    c2ec:      	mov	x0, #0x1                ; =1
    c2f0:      	mov	x2, #0x16               ; =22
    c2f4:      	str	x0, [x21]
    c2f8:      	str	x1, [x21, #0x8]
    c2fc:      	str	x2, [x21, #0x10]
    c300:      	ldr	x19, [sp, #0x30]
    c304:      	ldr	x20, [sp, #0x38]
    c308:      	ldr	x21, [sp, #0x40]
    c30c:      	ldr	x22, [sp, #0x48]
    c310:      	ldr	x29, [sp]
    c314:      	ldr	x30, [sp, #0x8]
    c318:      	add	sp, sp, #0x50
    c31c:      	ret
    c320:      	lsr	w2, w2, #0
    c324:      	lsr	w1, w3, #0
    c328:      	add	x16, sp, #0x10
    c32c:      	str	x3, [x16]
    c330:      	add	x16, sp, #0x10
    c334:      	str	x4, [x16, #0x8]
    c338:      	ubfx	x1, x1, #8, #8
    c33c:      	lsr	w1, w1, #0
    c340:      	mov	x21, x8
    c344:      	mov	x22, x0
    c348:      	mov	w0, w1
    c34c:      	mov	w1, w2
    c350:      	bl	0xc350 <_stogir.locals.shape+0x21c>
		000000000000c350:  ARM64_RELOC_BRANCH26	_stogir.types.size
    c354:      	lsr	w0, w0, #0
    c358:      	add	x16, sp, #0x10
    c35c:      	ldr	w1, [x16, #0xc]
    c360:      	sxtw	x0, w0
    c364:      	sxtw	x1, w1
    c368:      	cmp	x1, #0x0
    c36c:      	b.ne	0xc374 <_stogir.locals.shape+0x240>
    c370:      	mov	x1, x0
    c374:      	add	x16, sp, #0x10
    c378:      	ldr	w2, [x16, #0x8]
    c37c:      	sxtw	x2, w2
    c380:      	cmp	x2, #0x0
    c384:      	cset	w3, eq
    c388:      	ubfx	x3, x3, #0, #8
    c38c:      	cmp	x2, #0x0
    c390:      	b.le	0xc404 <_stogir.locals.shape+0x2d0>
    c394:      	cmp	x2, #0x0
    c398:      	b.le	0xc47c <_stogir.locals.shape+0x348>
    c39c:      	add	x4, x22, #0x110
    c3a0:      	add	x5, x4, #0x28
    c3a4:      	ldr	x5, [x5, #0x8]
    c3a8:      	cmp	x2, x5
    c3ac:      	b.gt	0xc47c <_stogir.locals.shape+0x348>
    c3b0:      	sub	x2, x2, #0x1
    c3b4:      	mov	x17, #0x18              ; =24
    c3b8:      	mul	x2, x2, x17
    c3bc:      	ldr	x5, [x4, #0x28]
    c3c0:      	add	x2, x2, x5
    c3c4:      	ldr	x5, [x2]
    c3c8:      	ldr	x2, [x2, #0x8]
    c3cc:      	ldr	x4, [x4, #0x8]
    c3d0:      	cmp	x5, #0x0
    c3d4:      	b.lt	0xc4b8 <_stogir.locals.shape+0x384>
    c3d8:      	cmp	x5, x4
    c3dc:      	b.gt	0xc4b8 <_stogir.locals.shape+0x384>
    c3e0:      	cmp	x2, #0x0
    c3e4:      	b.lt	0xc4b8 <_stogir.locals.shape+0x384>
    c3e8:      	sub	x4, x4, x5
    c3ec:      	cmp	x2, x4
    c3f0:      	b.gt	0xc4b8 <_stogir.locals.shape+0x384>
    c3f4:      	mov	x2, #0x1                ; =1
    c3f8:      	b	0xc4bc <_stogir.locals.shape+0x388>
    c3fc:      	movz	x3, #0x0, lsl #48
    c400:      	b	0xc22c <_stogir.locals.shape+0xf8>
    c404:      	mov	x2, x3
    c408:      	cmp	x19, #0x0
    c40c:      	b.le	0xc20c <_stogir.locals.shape+0xd8>
    c410:      	add	x16, sp, #0x10
    c414:      	ldr	w3, [x16]
    c418:      	uxtb	w3, w3
    c41c:      	cmp	x3, #0x48
    c420:      	b.ne	0xc20c <_stogir.locals.shape+0xd8>
    c424:      	ldr	x3, [x22, #0x78]
    c428:      	add	x3, x20, x3
    c42c:      	ldr	w3, [x3]
    c430:      	sxtw	x3, w3
    c434:      	cmp	x3, #0x3
    c438:      	b.ne	0xc20c <_stogir.locals.shape+0xd8>
    c43c:      	cmp	x0, #0x0
    c440:      	b.le	0xc20c <_stogir.locals.shape+0xd8>
    c444:      	cmp	x2, #0x0
    c448:      	b.eq	0xc20c <_stogir.locals.shape+0xd8>
    c44c:      	cmp	x1, #0x0
    c450:      	b.le	0xc4c8 <_stogir.locals.shape+0x394>
    c454:      	sub	x2, x1, #0x1
    c458:      	and	x2, x2, x1
    c45c:      	cmp	x2, #0x0
    c460:      	cset	w2, eq
    c464:      	ubfx	x2, x2, #0, #8
    c468:      	b	0xc4cc <_stogir.locals.shape+0x398>
    c46c:      	movz	x3, #0x0, lsl #48
    c470:      	b	0xc208 <_stogir.locals.shape+0xd4>
    c474:      	mov	x2, #0x1                ; =1
    c478:      	b	0xc408 <_stogir.locals.shape+0x2d4>
    c47c:      	movz	x2, #0x0, lsl #48
    c480:      	lsr	w2, w2, #0
    c484:      	lsr	x16, x2, #0
    c488:      	cmp	x16, #0x1
    c48c:      	b.eq	0xc4a8 <_stogir.locals.shape+0x374>
    c490:      	b.lo	0xc498 <_stogir.locals.shape+0x364>
    c494:      	b	0xc4ac <_stogir.locals.shape+0x378>
    c498:      	cmp	x16, #0x0
    c49c:      	b.eq	0xc4a4 <_stogir.locals.shape+0x370>
    c4a0:      	b	0xc4ac <_stogir.locals.shape+0x378>
    c4a4:      	b	0xc4b0 <_stogir.locals.shape+0x37c>
    c4a8:      	b	0xc474 <_stogir.locals.shape+0x340>
    c4ac:      	b	0xc5a8 <_stogir.locals.shape+0x474>
    c4b0:      	mov	x2, x3
    c4b4:      	b	0xc478 <_stogir.locals.shape+0x344>
    c4b8:      	movz	x2, #0x0, lsl #48
    c4bc:      	b	0xc480 <_stogir.locals.shape+0x34c>
    c4c0:      	brk	#0
    c4c4:      	b	0xc4c0 <_stogir.locals.shape+0x38c>
    c4c8:      	movz	x2, #0x0, lsl #48
    c4cc:      	cmp	x2, #0x0
    c4d0:      	b.eq	0xc20c <_stogir.locals.shape+0xd8>
    c4d4:      	add	x16, sp, #0x10
    c4d8:      	ldr	w2, [x16, #0x4]
    c4dc:      	sxtw	x2, w2
    c4e0:      	cmp	x2, #0x0
    c4e4:      	cset	w3, gt
    c4e8:      	movz	x16, #0x0, lsl #48
    c4ec:      	sub	x4, x16, x2
    c4f0:      	sub	x5, x4, #0x1
    c4f4:      	uxtb	w16, w3
    c4f8:      	cmp	w16, wzr
    c4fc:      	b.eq	0xc55c <_stogir.locals.shape+0x428>
    c500:      	ldr	x4, [x22, #0x8]
    c504:      	cmp	x2, x4
    c508:      	b.ge	0xc5b0 <_stogir.locals.shape+0x47c>
    c50c:      	add	x4, x22, #0x78
    c510:      	ldr	x4, [x4, #0x8]
    c514:      	cmp	x2, x4
    c518:      	b.ge	0xc6d4 <_stogir.locals.shape+0x5a0>
    c51c:      	lsl	x4, x2, #2
    c520:      	ldr	x6, [x22, #0x78]
    c524:      	add	x4, x4, x6
    c528:      	ldr	w4, [x4]
    c52c:      	sxtw	x4, w4
    c530:      	cmp	x4, #0x0
    c534:      	cset	w4, ge
    c538:      	ubfx	x4, x4, #0, #8
    c53c:      	b	0xc6d8 <_stogir.locals.shape+0x5a4>
    c540:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000c540:  ARM64_RELOC_PAGE21	l_stogir.456
    c544:      	ldr	x16, [x16]
		000000000000c544:  ARM64_RELOC_PAGEOFF12	l_stogir.456
    c548:      	orr	x0, x16, xzr
    c54c:      	mov	x1, x0
    c550:      	mov	x0, #0x1                ; =1
    c554:      	mov	x2, #0x2c               ; =44
    c558:      	b	0xc224 <_stogir.locals.shape+0xf0>
    c55c:      	cmp	x2, #0x0
    c560:      	b.ge	0xc5b8 <_stogir.locals.shape+0x484>
    c564:      	add	x6, x22, #0x28
    c568:      	add	x7, x22, #0x50
    c56c:      	ldr	x6, [x6, #0x8]
    c570:      	ldr	x7, [x7, #0x8]
    c574:      	cmp	x6, x7
    c578:      	b.ne	0xc6cc <_stogir.locals.shape+0x598>
    c57c:      	cmp	x4, x6
    c580:      	b.gt	0xc6dc <_stogir.locals.shape+0x5a8>
    c584:      	lsl	x4, x5, #2
    c588:      	ldr	x6, [x22, #0x50]
    c58c:      	add	x4, x4, x6
    c590:      	ldr	w4, [x4]
    c594:      	sxtw	x4, w4
    c598:      	cmp	x4, #0x0
    c59c:      	cset	w4, gt
    c5a0:      	ubfx	x4, x4, #0, #8
    c5a4:      	b	0xc6e0 <_stogir.locals.shape+0x5ac>
    c5a8:      	brk	#0
    c5ac:      	b	0xc5a8 <_stogir.locals.shape+0x474>
    c5b0:      	movz	x4, #0x0, lsl #48
    c5b4:      	b	0xc5bc <_stogir.locals.shape+0x488>
    c5b8:      	movz	x4, #0x0, lsl #48
    c5bc:      	cmp	x4, #0x0
    c5c0:      	b.eq	0xc624 <_stogir.locals.shape+0x4f0>
    c5c4:      	uxtb	w16, w3
    c5c8:      	cmp	w16, wzr
    c5cc:      	b.eq	0xc5f4 <_stogir.locals.shape+0x4c0>
    c5d0:      	lsl	x2, x2, #4
    c5d4:      	ldr	x3, [x22]
    c5d8:      	add	x2, x2, x3
    c5dc:      	ldr	x3, [x2]
    c5e0:      	ldr	x2, [x2, #0x8]
    c5e4:      	fmov	d31, x2
    c5e8:      	mov	x2, x3
    c5ec:      	fmov	x3, d31
    c5f0:      	b	0xc614 <_stogir.locals.shape+0x4e0>
    c5f4:      	lsl	x2, x5, #4
    c5f8:      	ldr	x3, [x22, #0x28]
    c5fc:      	add	x2, x2, x3
    c600:      	ldr	x3, [x2]
    c604:      	ldr	x2, [x2, #0x8]
    c608:      	fmov	d31, x2
    c60c:      	mov	x2, x3
    c610:      	fmov	x3, d31
    c614:      	mov	x4, x3
    c618:      	mov	x3, x2
    c61c:      	mov	x2, #0x1                ; =1
    c620:      	b	0xc630 <_stogir.locals.shape+0x4fc>
    c624:      	movz	x2, #0x0, lsl #48
    c628:      	movz	x3, #0x0, lsl #48
    c62c:      	movz	x4, #0x0, lsl #48
    c630:      	lsr	w2, w2, #0
    c634:      	lsr	x16, x2, #0
    c638:      	cmp	x16, #0x1
    c63c:      	b.eq	0xc658 <_stogir.locals.shape+0x524>
    c640:      	b.lo	0xc648 <_stogir.locals.shape+0x514>
    c644:      	b	0xc65c <_stogir.locals.shape+0x528>
    c648:      	cmp	x16, #0x0
    c64c:      	b.eq	0xc654 <_stogir.locals.shape+0x520>
    c650:      	b	0xc65c <_stogir.locals.shape+0x528>
    c654:      	b	0xc660 <_stogir.locals.shape+0x52c>
    c658:      	b	0xc67c <_stogir.locals.shape+0x548>
    c65c:      	b	0xc70c <_stogir.locals.shape+0x5d8>
    c660:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000c660:  ARM64_RELOC_PAGE21	l_stogir.457
    c664:      	ldr	x16, [x16]
		000000000000c664:  ARM64_RELOC_PAGEOFF12	l_stogir.457
    c668:      	orr	x0, x16, xzr
    c66c:      	mov	x1, x0
    c670:      	mov	x0, #0x1                ; =1
    c674:      	mov	x2, #0x1d               ; =29
    c678:      	b	0xc558 <_stogir.locals.shape+0x424>
    c67c:      	add	x16, sp, #0x20
    c680:      	str	x3, [x16]
    c684:      	add	x16, sp, #0x20
    c688:      	str	x4, [x16, #0x8]
    c68c:      	add	x16, sp, #0x10
    c690:      	ldr	w2, [x16, #0x4]
    c694:      	sxtw	x2, w2
    c698:      	cmp	x2, #0x0
    c69c:      	b.le	0xc540 <_stogir.locals.shape+0x40c>
    c6a0:      	add	x16, sp, #0x20
    c6a4:      	ldr	w2, [x16]
    c6a8:      	uxtb	w2, w2
    c6ac:      	cmp	x2, #0x83
    c6b0:      	b.ge	0xc6e4 <_stogir.locals.shape+0x5b0>
    c6b4:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000c6b4:  ARM64_RELOC_PAGE21	l_stogir.458
    c6b8:      	ldr	x16, [x16]
		000000000000c6b8:  ARM64_RELOC_PAGEOFF12	l_stogir.458
    c6bc:      	orr	x3, x16, xzr
    c6c0:      	add	x2, x2, x3
    c6c4:      	ldrb	w2, [x2]
    c6c8:      	b	0xc6e8 <_stogir.locals.shape+0x5b4>
    c6cc:      	movz	x4, #0x0, lsl #48
    c6d0:      	b	0xc5bc <_stogir.locals.shape+0x488>
    c6d4:      	movz	x4, #0x0, lsl #48
    c6d8:      	b	0xc5b4 <_stogir.locals.shape+0x480>
    c6dc:      	movz	x4, #0x0, lsl #48
    c6e0:      	b	0xc6d0 <_stogir.locals.shape+0x59c>
    c6e4:      	movz	x2, #0x0, lsl #48
    c6e8:      	uxtb	w2, w2
    c6ec:      	and	x2, x2, #0x2
    c6f0:      	uxtb	w2, w2
    c6f4:      	cmp	x2, #0x0
    c6f8:      	b.eq	0xc540 <_stogir.locals.shape+0x40c>
    c6fc:      	mov	x2, x1
    c700:      	mov	x1, x0
    c704:      	movz	x0, #0x0, lsl #48
    c708:      	b	0xc558 <_stogir.locals.shape+0x424>
    c70c:      	brk	#0
    c710:      	b	0xc70c <_stogir.locals.shape+0x5d8>

000000000000c714 <_stogir.conversion.policy>:
    c714:      	sub	sp, sp, #0x70
    c718:      	str	x29, [sp]
    c71c:      	str	x30, [sp, #0x8]
    c720:      	mov	x29, sp
    c724:      	str	x19, [sp, #0x20]
    c728:      	str	x20, [sp, #0x28]
    c72c:      	str	x21, [sp, #0x30]
    c730:      	str	x22, [sp, #0x38]
    c734:      	str	x23, [sp, #0x40]
    c738:      	str	x24, [sp, #0x48]
    c73c:      	str	x25, [sp, #0x50]
    c740:      	str	x26, [sp, #0x58]
    c744:      	str	x27, [sp, #0x60]
    c748:      	str	x28, [sp, #0x68]
    c74c:      	sxtw	x19, w0
    c750:      	sxtw	x20, w1
    c754:      	sxtw	x21, w2
    c758:      	cmp	x19, #0x24
    c75c:      	b.ne	0xc7ac <_stogir.conversion.policy+0x98>
    c760:      	cmp	x20, #0xf
    c764:      	b.le	0xc9e0 <_stogir.conversion.policy+0x2cc>
    c768:      	cmp	x20, #0x80
    c76c:      	b.ge	0xc9e0 <_stogir.conversion.policy+0x2cc>
    c770:      	and	x0, x20, #0xf
    c774:      	lsr	w0, w0, #0
    c778:      	sxtw	x0, w0
    c77c:      	cmp	x0, #0x1
    c780:      	b.lt	0xc9e0 <_stogir.conversion.policy+0x2cc>
    c784:      	and	x0, x20, #0xf
    c788:      	lsr	w0, w0, #0
    c78c:      	sxtw	x0, w0
    c790:      	cmp	x0, #0xd
    c794:      	b.gt	0xc9e0 <_stogir.conversion.policy+0x2cc>
    c798:      	mov	x0, #0x1                ; =1
    c79c:      	b	0xc7a4 <_stogir.conversion.policy+0x90>
    c7a0:      	movz	x0, #0x0, lsl #48
    c7a4:      	mov	x22, x0
    c7a8:      	b	0xc7b0 <_stogir.conversion.policy+0x9c>
    c7ac:      	movz	x22, #0x0, lsl #48
    c7b0:      	sxtw	x23, w3
    c7b4:      	cmp	x20, #0xd
    c7b8:      	cset	w24, eq
    c7bc:      	cmp	x20, #0xc
    c7c0:      	cset	w25, eq
    c7c4:      	cmp	x23, #0x4
    c7c8:      	cset	w26, eq
    c7cc:      	cmp	x23, #0x8
    c7d0:      	cset	w27, eq
    c7d4:      	cmp	x22, #0x0
    c7d8:      	b.eq	0xccd4 <_stogir.conversion.policy+0x5c0>
    c7dc:      	lsr	w1, w1, #0
    c7e0:      	lsr	w3, w3, #0
    c7e4:      	mov	w0, w1
    c7e8:      	mov	w1, w3
    c7ec:      	str	x8, [sp, #0x18]
    c7f0:      	mov	w28, w3
    c7f4:      	str	x23, [sp, #0x10]
    c7f8:      	mov	w23, w2
    c7fc:      	bl	0xc7fc <_stogir.conversion.policy+0xe8>
		000000000000c7fc:  ARM64_RELOC_BRANCH26	_stogir.types.size
    c800:      	lsr	w0, w0, #0
    c804:      	sxtw	x0, w0
    c808:      	b	0xc818 <_stogir.conversion.policy+0x104>
    c80c:      	mov	x0, #0x1                ; =1
    c810:      	lsr	w0, w0, #0
    c814:      	sxtw	x0, w0
    c818:      	cmp	x21, #0xd
    c81c:      	cset	w1, eq
    c820:      	cmp	x21, #0xc
    c824:      	cset	w2, eq
    c828:      	cmp	x22, #0x0
    c82c:      	b.eq	0xcce8 <_stogir.conversion.policy+0x5d4>
    c830:      	lsr	w23, w23, #0
    c834:      	lsr	w28, w28, #0
    c838:      	mov	x22, x0
    c83c:      	mov	w0, w23
    c840:      	mov	w23, w1
    c844:      	mov	w1, w28
    c848:      	mov	w28, w2
    c84c:      	bl	0xc84c <_stogir.conversion.policy+0x138>
		000000000000c84c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    c850:      	lsr	w0, w0, #0
    c854:      	sxtw	x0, w0
    c858:      	b	0xc868 <_stogir.conversion.policy+0x154>
    c85c:      	mov	x0, #0x1                ; =1
    c860:      	lsr	w0, w0, #0
    c864:      	sxtw	x0, w0
    c868:      	cmp	x19, #0x21
    c86c:      	b.lt	0xc960 <_stogir.conversion.policy+0x24c>
    c870:      	cmp	x19, #0x27
    c874:      	cset	w1, le
    c878:      	uxtb	w16, w1
    c87c:      	cmp	w16, wzr
    c880:      	b.eq	0xc960 <_stogir.conversion.policy+0x24c>
    c884:      	lsl	x2, x22, #3
    c888:      	lsr	w2, w2, #0
    c88c:      	sxtw	x2, w2
    c890:      	cmp	x2, #0x0
    c894:      	b.le	0xc960 <_stogir.conversion.policy+0x24c>
    c898:      	lsl	x0, x0, #3
    c89c:      	lsr	w0, w0, #0
    c8a0:      	sxtw	x0, w0
    c8a4:      	cmp	x0, #0x0
    c8a8:      	b.le	0xc960 <_stogir.conversion.policy+0x24c>
    c8ac:      	cmp	x19, #0x26
    c8b0:      	cset	w3, eq
    c8b4:      	cmp	x20, #0x1
    c8b8:      	cset	w4, ge
    c8bc:      	cmp	x20, #0xb
    c8c0:      	cset	w5, le
    c8c4:      	cmp	x21, #0x1
    c8c8:      	cset	w6, ge
    c8cc:      	cmp	x21, #0xb
    c8d0:      	cset	w7, le
    c8d4:      	cmp	x19, #0x25
    c8d8:      	b.lt	0xcb58 <_stogir.conversion.policy+0x444>
    c8dc:      	uxtb	w16, w1
    c8e0:      	cmp	w16, wzr
    c8e4:      	b.eq	0xcb58 <_stogir.conversion.policy+0x444>
    c8e8:      	ubfx	x23, x23, #0, #8
    c8ec:      	cmp	x19, #0x25
    c8f0:      	b.ne	0xcbf4 <_stogir.conversion.policy+0x4e0>
    c8f4:      	uxtb	w16, w4
    c8f8:      	cmp	w16, wzr
    c8fc:      	b.eq	0xcbec <_stogir.conversion.policy+0x4d8>
    c900:      	uxtb	w16, w5
    c904:      	cmp	w16, wzr
    c908:      	b.eq	0xcbec <_stogir.conversion.policy+0x4d8>
    c90c:      	uxtb	w16, w28
    c910:      	cmp	w16, wzr
    c914:      	b.eq	0xcc68 <_stogir.conversion.policy+0x554>
    c918:      	mov	x1, #0x1                ; =1
    c91c:      	b	0xcc6c <_stogir.conversion.policy+0x558>
    c920:      	uxtb	w16, w26
    c924:      	cmp	w16, wzr
    c928:      	b.ne	0xc9c0 <_stogir.conversion.policy+0x2ac>
    c92c:      	uxtb	w16, w27
    c930:      	cmp	w16, wzr
    c934:      	b.ne	0xc9c0 <_stogir.conversion.policy+0x2ac>
    c938:      	movn	x0, #0x0, lsl #48
    c93c:      	b	0xc860 <_stogir.conversion.policy+0x14c>
    c940:      	uxtb	w16, w26
    c944:      	cmp	w16, wzr
    c948:      	b.ne	0xc9d0 <_stogir.conversion.policy+0x2bc>
    c94c:      	uxtb	w16, w27
    c950:      	cmp	w16, wzr
    c954:      	b.ne	0xc9d0 <_stogir.conversion.policy+0x2bc>
    c958:      	movn	x0, #0x0, lsl #48
    c95c:      	b	0xc810 <_stogir.conversion.policy+0xfc>
    c960:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000c960:  ARM64_RELOC_PAGE21	l_stogir.459
    c964:      	ldr	x16, [x16]
		000000000000c964:  ARM64_RELOC_PAGEOFF12	l_stogir.459
    c968:      	orr	x0, x16, xzr
    c96c:      	mov	x1, x0
    c970:      	mov	x0, #0x1                ; =1
    c974:      	mov	x2, #0x22               ; =34
    c978:      	ldr	x3, [sp, #0x18]
    c97c:      	str	x0, [x3]
    c980:      	str	x1, [x3, #0x8]
    c984:      	str	x2, [x3, #0x10]
    c988:      	ldr	x19, [sp, #0x20]
    c98c:      	ldr	x20, [sp, #0x28]
    c990:      	ldr	x21, [sp, #0x30]
    c994:      	ldr	x22, [sp, #0x38]
    c998:      	ldr	x23, [sp, #0x40]
    c99c:      	ldr	x24, [sp, #0x48]
    c9a0:      	ldr	x25, [sp, #0x50]
    c9a4:      	ldr	x26, [sp, #0x58]
    c9a8:      	ldr	x27, [sp, #0x60]
    c9ac:      	ldr	x28, [sp, #0x68]
    c9b0:      	ldr	x29, [sp]
    c9b4:      	ldr	x30, [sp, #0x8]
    c9b8:      	add	sp, sp, #0x70
    c9bc:      	ret
    c9c0:      	cmp	x21, #0x0
    c9c4:      	b.ne	0xca28 <_stogir.conversion.policy+0x314>
    c9c8:      	movz	x0, #0x0, lsl #48
    c9cc:      	b	0xc860 <_stogir.conversion.policy+0x14c>
    c9d0:      	cmp	x20, #0x0
    c9d4:      	b.ne	0xcaa0 <_stogir.conversion.policy+0x38c>
    c9d8:      	movz	x0, #0x0, lsl #48
    c9dc:      	b	0xc810 <_stogir.conversion.policy+0xfc>
    c9e0:      	cmp	x21, #0xf
    c9e4:      	b.le	0xc7a0 <_stogir.conversion.policy+0x8c>
    c9e8:      	cmp	x21, #0x80
    c9ec:      	b.ge	0xca20 <_stogir.conversion.policy+0x30c>
    c9f0:      	and	x0, x21, #0xf
    c9f4:      	lsr	w0, w0, #0
    c9f8:      	sxtw	x0, w0
    c9fc:      	cmp	x0, #0x1
    ca00:      	b.lt	0xcb18 <_stogir.conversion.policy+0x404>
    ca04:      	and	x0, x21, #0xf
    ca08:      	lsr	w0, w0, #0
    ca0c:      	sxtw	x0, w0
    ca10:      	cmp	x0, #0xd
    ca14:      	cset	w0, le
    ca18:      	ubfx	x0, x0, #0, #8
    ca1c:      	b	0xcb1c <_stogir.conversion.policy+0x408>
    ca20:      	movz	x0, #0x0, lsl #48
    ca24:      	b	0xc7a4 <_stogir.conversion.policy+0x90>
    ca28:      	cmp	x21, #0x1
    ca2c:      	b.eq	0xc85c <_stogir.conversion.policy+0x148>
    ca30:      	cmp	x21, #0x2
    ca34:      	b.eq	0xc85c <_stogir.conversion.policy+0x148>
    ca38:      	cmp	x21, #0x7
    ca3c:      	b.eq	0xc85c <_stogir.conversion.policy+0x148>
    ca40:      	cmp	x21, #0x8
    ca44:      	b.eq	0xc85c <_stogir.conversion.policy+0x148>
    ca48:      	cmp	x21, #0x3
    ca4c:      	b.eq	0xcbdc <_stogir.conversion.policy+0x4c8>
    ca50:      	cmp	x21, #0x9
    ca54:      	b.eq	0xcbdc <_stogir.conversion.policy+0x4c8>
    ca58:      	cmp	x21, #0x4
    ca5c:      	b.eq	0xcc58 <_stogir.conversion.policy+0x544>
    ca60:      	cmp	x21, #0xa
    ca64:      	b.eq	0xcc58 <_stogir.conversion.policy+0x544>
    ca68:      	uxtb	w16, w23
    ca6c:      	cmp	w16, wzr
    ca70:      	b.ne	0xcc58 <_stogir.conversion.policy+0x544>
    ca74:      	cmp	x21, #0x5
    ca78:      	b.eq	0xccb4 <_stogir.conversion.policy+0x5a0>
    ca7c:      	cmp	x21, #0xb
    ca80:      	b.eq	0xccb4 <_stogir.conversion.policy+0x5a0>
    ca84:      	uxtb	w16, w28
    ca88:      	cmp	w16, wzr
    ca8c:      	b.ne	0xccb4 <_stogir.conversion.policy+0x5a0>
    ca90:      	cmp	x21, #0x6
    ca94:      	b.ne	0xccc4 <_stogir.conversion.policy+0x5b0>
    ca98:      	ldr	x0, [sp, #0x10]
    ca9c:      	b	0xccc8 <_stogir.conversion.policy+0x5b4>
    caa0:      	cmp	x20, #0x1
    caa4:      	b.eq	0xc80c <_stogir.conversion.policy+0xf8>
    caa8:      	cmp	x20, #0x2
    caac:      	b.eq	0xc80c <_stogir.conversion.policy+0xf8>
    cab0:      	cmp	x20, #0x7
    cab4:      	b.eq	0xc80c <_stogir.conversion.policy+0xf8>
    cab8:      	cmp	x20, #0x8
    cabc:      	b.eq	0xc80c <_stogir.conversion.policy+0xf8>
    cac0:      	cmp	x20, #0x3
    cac4:      	b.eq	0xcbe4 <_stogir.conversion.policy+0x4d0>
    cac8:      	cmp	x20, #0x9
    cacc:      	b.eq	0xcbe4 <_stogir.conversion.policy+0x4d0>
    cad0:      	cmp	x20, #0x4
    cad4:      	b.eq	0xcc60 <_stogir.conversion.policy+0x54c>
    cad8:      	cmp	x20, #0xa
    cadc:      	b.eq	0xcc60 <_stogir.conversion.policy+0x54c>
    cae0:      	uxtb	w16, w24
    cae4:      	cmp	w16, wzr
    cae8:      	b.ne	0xcc60 <_stogir.conversion.policy+0x54c>
    caec:      	cmp	x20, #0x5
    caf0:      	b.eq	0xccbc <_stogir.conversion.policy+0x5a8>
    caf4:      	cmp	x20, #0xb
    caf8:      	b.eq	0xccbc <_stogir.conversion.policy+0x5a8>
    cafc:      	uxtb	w16, w25
    cb00:      	cmp	w16, wzr
    cb04:      	b.ne	0xccbc <_stogir.conversion.policy+0x5a8>
    cb08:      	cmp	x20, #0x6
    cb0c:      	b.ne	0xcccc <_stogir.conversion.policy+0x5b8>
    cb10:      	ldr	x0, [sp, #0x10]
    cb14:      	b	0xccd0 <_stogir.conversion.policy+0x5bc>
    cb18:      	movz	x0, #0x0, lsl #48
    cb1c:      	b	0xca24 <_stogir.conversion.policy+0x310>
    cb20:      	mov	x1, #0x1                ; =1
    cb24:      	cmp	x1, #0x0
    cb28:      	b.ne	0xc960 <_stogir.conversion.policy+0x24c>
    cb2c:      	cmp	x19, #0x23
    cb30:      	b.eq	0xcb44 <_stogir.conversion.policy+0x430>
    cb34:      	uxtb	w16, w3
    cb38:      	cmp	w16, wzr
    cb3c:      	b.ne	0xcb44 <_stogir.conversion.policy+0x430>
    cb40:      	mov	x0, x2
    cb44:      	and	x0, x0, #0xffffffff
    cb48:      	mov	x1, x0
    cb4c:      	movz	x0, #0x0, lsl #48
    cb50:      	movz	x2, #0x0, lsl #48
    cb54:      	b	0xc978 <_stogir.conversion.policy+0x264>
    cb58:      	cmp	x19, #0x24
    cb5c:      	b.ne	0xcb78 <_stogir.conversion.policy+0x464>
    cb60:      	cmp	x2, x0
    cb64:      	cset	w1, eq
    cb68:      	uxtb	w16, w1
    cb6c:      	cmp	w16, wzr
    cb70:      	cset	x1, eq
    cb74:      	b	0xcb24 <_stogir.conversion.policy+0x410>
    cb78:      	uxtb	w16, w4
    cb7c:      	cmp	w16, wzr
    cb80:      	b.eq	0xcb20 <_stogir.conversion.policy+0x40c>
    cb84:      	uxtb	w16, w5
    cb88:      	cmp	w16, wzr
    cb8c:      	b.eq	0xcb20 <_stogir.conversion.policy+0x40c>
    cb90:      	uxtb	w16, w6
    cb94:      	cmp	w16, wzr
    cb98:      	b.eq	0xcc20 <_stogir.conversion.policy+0x50c>
    cb9c:      	uxtb	w16, w7
    cba0:      	cmp	w16, wzr
    cba4:      	b.eq	0xcc20 <_stogir.conversion.policy+0x50c>
    cba8:      	cmp	x19, #0x23
    cbac:      	b.ne	0xcc90 <_stogir.conversion.policy+0x57c>
    cbb0:      	cmp	x0, x2
    cbb4:      	cset	w1, ge
    cbb8:      	ubfx	x1, x1, #0, #8
    cbbc:      	b	0xcc9c <_stogir.conversion.policy+0x588>
    cbc0:      	movz	x1, #0x0, lsl #48
    cbc4:      	cmp	x1, #0x0
    cbc8:      	cset	w1, ne
    cbcc:      	uxtb	w16, w1
    cbd0:      	cmp	w16, wzr
    cbd4:      	cset	x1, eq
    cbd8:      	b	0xcb24 <_stogir.conversion.policy+0x410>
    cbdc:      	mov	x0, #0x2                ; =2
    cbe0:      	b	0xc860 <_stogir.conversion.policy+0x14c>
    cbe4:      	mov	x0, #0x2                ; =2
    cbe8:      	b	0xc810 <_stogir.conversion.policy+0xfc>
    cbec:      	movz	x1, #0x0, lsl #48
    cbf0:      	b	0xcbc4 <_stogir.conversion.policy+0x4b0>
    cbf4:      	uxtb	w16, w3
    cbf8:      	cmp	w16, wzr
    cbfc:      	b.eq	0xcc30 <_stogir.conversion.policy+0x51c>
    cc00:      	uxtb	w16, w25
    cc04:      	cmp	w16, wzr
    cc08:      	b.ne	0xcc78 <_stogir.conversion.policy+0x564>
    cc0c:      	uxtb	w16, w24
    cc10:      	cmp	w16, wzr
    cc14:      	b.ne	0xcc78 <_stogir.conversion.policy+0x564>
    cc18:      	movz	x1, #0x0, lsl #48
    cc1c:      	b	0xcc2c <_stogir.conversion.policy+0x518>
    cc20:      	mov	x1, #0x1                ; =1
    cc24:      	b	0xcb24 <_stogir.conversion.policy+0x410>
    cc28:      	movz	x1, #0x0, lsl #48
    cc2c:      	b	0xcbc4 <_stogir.conversion.policy+0x4b0>
    cc30:      	cmp	x19, #0x27
    cc34:      	b.ne	0xcbc0 <_stogir.conversion.policy+0x4ac>
    cc38:      	uxtb	w16, w25
    cc3c:      	cmp	w16, wzr
    cc40:      	b.ne	0xcca0 <_stogir.conversion.policy+0x58c>
    cc44:      	uxtb	w16, w24
    cc48:      	cmp	w16, wzr
    cc4c:      	b.ne	0xcca0 <_stogir.conversion.policy+0x58c>
    cc50:      	movz	x1, #0x0, lsl #48
    cc54:      	b	0xcc74 <_stogir.conversion.policy+0x560>
    cc58:      	mov	x0, #0x4                ; =4
    cc5c:      	b	0xcbe0 <_stogir.conversion.policy+0x4cc>
    cc60:      	mov	x0, #0x4                ; =4
    cc64:      	b	0xcbe8 <_stogir.conversion.policy+0x4d4>
    cc68:      	mov	x1, x23
    cc6c:      	b	0xcbf0 <_stogir.conversion.policy+0x4dc>
    cc70:      	mov	x1, x23
    cc74:      	b	0xcbc4 <_stogir.conversion.policy+0x4b0>
    cc78:      	uxtb	w16, w6
    cc7c:      	cmp	w16, wzr
    cc80:      	b.eq	0xcc28 <_stogir.conversion.policy+0x514>
    cc84:      	ubfx	x7, x7, #0, #8
    cc88:      	mov	x1, x7
    cc8c:      	b	0xcc2c <_stogir.conversion.policy+0x518>
    cc90:      	cmp	x0, x2
    cc94:      	cset	w1, le
    cc98:      	ubfx	x1, x1, #0, #8
    cc9c:      	b	0xcc24 <_stogir.conversion.policy+0x510>
    cca0:      	uxtb	w16, w28
    cca4:      	cmp	w16, wzr
    cca8:      	b.eq	0xcc70 <_stogir.conversion.policy+0x55c>
    ccac:      	mov	x1, #0x1                ; =1
    ccb0:      	b	0xcc74 <_stogir.conversion.policy+0x560>
    ccb4:      	mov	x0, #0x8                ; =8
    ccb8:      	b	0xcc5c <_stogir.conversion.policy+0x548>
    ccbc:      	mov	x0, #0x8                ; =8
    ccc0:      	b	0xcc64 <_stogir.conversion.policy+0x550>
    ccc4:      	movn	x0, #0x0, lsl #48
    ccc8:      	b	0xccb8 <_stogir.conversion.policy+0x5a4>
    cccc:      	movn	x0, #0x0, lsl #48
    ccd0:      	b	0xccc0 <_stogir.conversion.policy+0x5ac>
    ccd4:      	str	x8, [sp, #0x18]
    ccd8:      	mov	w28, w3
    ccdc:      	str	x23, [sp, #0x10]
    cce0:      	mov	w23, w2
    cce4:      	b	0xc940 <_stogir.conversion.policy+0x22c>
    cce8:      	mov	x22, x0
    ccec:      	mov	w23, w1
    ccf0:      	mov	w28, w2
    ccf4:      	b	0xc920 <_stogir.conversion.policy+0x20c>

000000000000ccf8 <_stogir.conditional.operands>:
    ccf8:      	sub	sp, sp, #0xa0
    ccfc:      	str	x29, [sp]
    cd00:      	str	x30, [sp, #0x8]
    cd04:      	mov	x29, sp
    cd08:      	str	x19, [sp, #0x60]
    cd0c:      	str	x20, [sp, #0x68]
    cd10:      	str	x21, [sp, #0x70]
    cd14:      	str	x22, [sp, #0x78]
    cd18:      	str	x23, [sp, #0x80]
    cd1c:      	str	x24, [sp, #0x88]
    cd20:      	str	x25, [sp, #0x90]
    cd24:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000cd24:  ARM64_RELOC_PAGE21	l_stogir.460
    cd28:      	ldr	x16, [x16]
		000000000000cd28:  ARM64_RELOC_PAGEOFF12	l_stogir.460
    cd2c:      	orr	x19, x16, xzr
    cd30:      	sxtw	x20, w1
    cd34:      	cmp	x20, #0x0
    cd38:      	b.ne	0xce1c <_stogir.conditional.operands+0x124>
    cd3c:      	mov	x21, x8
    cd40:      	mov	x22, x0
    cd44:      	mov	w23, w2
    cd48:      	mov	w24, w3
    cd4c:      	mov	w25, w4
    cd50:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000cd50:  ARM64_RELOC_PAGE21	l_stogir.461
    cd54:      	ldr	x16, [x16]
		000000000000cd54:  ARM64_RELOC_PAGEOFF12	l_stogir.461
    cd58:      	orr	x0, x16, xzr
    cd5c:      	mov	x1, #0x2b               ; =43
    cd60:      	sxtw	x23, w23
    cd64:      	cmp	x23, #0x0
    cd68:      	cset	w2, gt
    cd6c:      	movz	x16, #0x0, lsl #48
    cd70:      	sub	x3, x16, x23
    cd74:      	sub	x4, x3, #0x1
    cd78:      	uxtb	w16, w2
    cd7c:      	cmp	w16, wzr
    cd80:      	b.eq	0xcdd0 <_stogir.conditional.operands+0xd8>
    cd84:      	ldr	x3, [x22, #0x8]
    cd88:      	cmp	x23, x3
    cd8c:      	b.ge	0xce60 <_stogir.conditional.operands+0x168>
    cd90:      	add	x3, x22, #0x78
    cd94:      	ldr	x3, [x3, #0x8]
    cd98:      	cmp	x23, x3
    cd9c:      	b.ge	0xd2ec <_stogir.conditional.operands+0x5f4>
    cda0:      	lsl	x3, x23, #2
    cda4:      	ldr	x5, [x22, #0x78]
    cda8:      	add	x3, x3, x5
    cdac:      	ldr	w3, [x3]
    cdb0:      	sxtw	x3, w3
    cdb4:      	cmp	x3, #0x0
    cdb8:      	cset	w3, ge
    cdbc:      	ubfx	x3, x3, #0, #8
    cdc0:      	fmov	d31, x0
    cdc4:      	mov	x0, x3
    cdc8:      	fmov	x3, d31
    cdcc:      	b	0xd2f4 <_stogir.conditional.operands+0x5fc>
    cdd0:      	cmp	x23, #0x0
    cdd4:      	b.ge	0xce70 <_stogir.conditional.operands+0x178>
    cdd8:      	add	x5, x22, #0x28
    cddc:      	add	x6, x22, #0x50
    cde0:      	ldr	x5, [x5, #0x8]
    cde4:      	ldr	x6, [x6, #0x8]
    cde8:      	cmp	x5, x6
    cdec:      	b.ne	0xce50 <_stogir.conditional.operands+0x158>
    cdf0:      	cmp	x3, x5
    cdf4:      	b.gt	0xd358 <_stogir.conditional.operands+0x660>
    cdf8:      	lsl	x3, x4, #2
    cdfc:      	ldr	x5, [x22, #0x50]
    ce00:      	add	x3, x3, x5
    ce04:      	ldr	w3, [x3]
    ce08:      	sxtw	x3, w3
    ce0c:      	cmp	x3, #0x0
    ce10:      	cset	w3, gt
    ce14:      	ubfx	x3, x3, #0, #8
    ce18:      	b	0xd35c <_stogir.conditional.operands+0x664>
    ce1c:      	lsr	w1, w1, #0
    ce20:      	mov	x21, x8
    ce24:      	mov	x22, x0
    ce28:      	mov	w0, w1
    ce2c:      	mov	w23, w2
    ce30:      	mov	w24, w3
    ce34:      	mov	w25, w4
    ce38:      	bl	0xce38 <_stogir.conditional.operands+0x140>
		000000000000ce38:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    ce3c:      	cmp	x0, #0x0
    ce40:      	b.eq	0xcd50 <_stogir.conditional.operands+0x58>
    ce44:      	mov	x0, x19
    ce48:      	movz	x1, #0x0, lsl #48
    ce4c:      	b	0xcd60 <_stogir.conditional.operands+0x68>
    ce50:      	movz	x3, #0x0, lsl #48
    ce54:      	b	0xce74 <_stogir.conditional.operands+0x17c>
    ce58:      	movz	x9, #0x0, lsl #48
    ce5c:      	b	0xcf60 <_stogir.conditional.operands+0x268>
    ce60:      	mov	x3, x1
    ce64:      	mov	x1, x0
    ce68:      	movz	x0, #0x0, lsl #48
    ce6c:      	b	0xce84 <_stogir.conditional.operands+0x18c>
    ce70:      	movz	x3, #0x0, lsl #48
    ce74:      	fmov	d31, x0
    ce78:      	mov	x0, x3
    ce7c:      	mov	x3, x1
    ce80:      	fmov	x1, d31
    ce84:      	cmp	x0, #0x0
    ce88:      	b.eq	0xcef0 <_stogir.conditional.operands+0x1f8>
    ce8c:      	uxtb	w16, w2
    ce90:      	cmp	w16, wzr
    ce94:      	b.eq	0xcebc <_stogir.conditional.operands+0x1c4>
    ce98:      	lsl	x0, x23, #4
    ce9c:      	ldr	x2, [x22]
    cea0:      	add	x0, x0, x2
    cea4:      	ldr	x2, [x0]
    cea8:      	ldr	x0, [x0, #0x8]
    ceac:      	fmov	d31, x0
    ceb0:      	mov	x0, x2
    ceb4:      	fmov	x2, d31
    ceb8:      	b	0xcedc <_stogir.conditional.operands+0x1e4>
    cebc:      	lsl	x0, x4, #4
    cec0:      	ldr	x2, [x22, #0x28]
    cec4:      	add	x0, x0, x2
    cec8:      	ldr	x2, [x0]
    cecc:      	ldr	x0, [x0, #0x8]
    ced0:      	fmov	d31, x0
    ced4:      	mov	x0, x2
    ced8:      	fmov	x2, d31
    cedc:      	mov	x4, x3
    cee0:      	mov	x3, x1
    cee4:      	mov	x1, x0
    cee8:      	mov	x0, #0x1                ; =1
    ceec:      	b	0xcf04 <_stogir.conditional.operands+0x20c>
    cef0:      	mov	x4, x3
    cef4:      	mov	x3, x1
    cef8:      	movz	x0, #0x0, lsl #48
    cefc:      	movz	x1, #0x0, lsl #48
    cf00:      	movz	x2, #0x0, lsl #48
    cf04:      	lsr	w0, w0, #0
    cf08:      	lsr	x16, x0, #0
    cf0c:      	cmp	x16, #0x1
    cf10:      	b.eq	0xcf2c <_stogir.conditional.operands+0x234>
    cf14:      	b.lo	0xcf1c <_stogir.conditional.operands+0x224>
    cf18:      	b	0xcf30 <_stogir.conditional.operands+0x238>
    cf1c:      	cmp	x16, #0x0
    cf20:      	b.eq	0xcf28 <_stogir.conditional.operands+0x230>
    cf24:      	b	0xcf30 <_stogir.conditional.operands+0x238>
    cf28:      	b	0xcf34 <_stogir.conditional.operands+0x23c>
    cf2c:      	b	0xd2c0 <_stogir.conditional.operands+0x5c8>
    cf30:      	b	0xd384 <_stogir.conditional.operands+0x68c>
    cf34:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000cf34:  ARM64_RELOC_PAGE21	l_stogir.462
    cf38:      	ldr	x16, [x16]
		000000000000cf38:  ARM64_RELOC_PAGEOFF12	l_stogir.462
    cf3c:      	orr	x0, x16, xzr
    cf40:      	mov	x1, #0x16               ; =22
    cf44:      	b	0xcf6c <_stogir.conditional.operands+0x274>
    cf48:      	movz	x9, #0x0, lsl #48
    cf4c:      	fmov	d31, x8
    cf50:      	mov	x8, x9
    cf54:      	fmov	x9, d31
    cf58:      	b	0xcfd8 <_stogir.conditional.operands+0x2e0>
    cf5c:      	movz	x9, #0x0, lsl #48
    cf60:      	b	0xcfe0 <_stogir.conditional.operands+0x2e8>
    cf64:      	mov	x0, x1
    cf68:      	mov	x1, x2
    cf6c:      	add	x16, sp, #0x30
    cf70:      	orr	x2, x16, xzr
    cf74:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000cf74:  ARM64_RELOC_PAGE21	l_stogir.463
    cf78:      	ldr	x16, [x16]
		000000000000cf78:  ARM64_RELOC_PAGEOFF12	l_stogir.463
    cf7c:      	orr	x3, x16, xzr
    cf80:      	adrp	x16, 0xc000 <_stogir.stack.validate-inputs+0x450>
		000000000000cf80:  ARM64_RELOC_PAGE21	l_stogir.464
    cf84:      	ldr	x16, [x16]
		000000000000cf84:  ARM64_RELOC_PAGEOFF12	l_stogir.464
    cf88:      	orr	x4, x16, xzr
    cf8c:      	lsr	w24, w24, #0
    cf90:      	lsr	w25, w25, #0
    cf94:      	add	x5, x22, #0x78
    cf98:      	add	x6, x22, #0x28
    cf9c:      	add	x7, x22, #0x50
    cfa0:      	add	x16, sp, #0x20
    cfa4:      	str	w24, [x16]
    cfa8:      	add	x16, sp, #0x20
    cfac:      	str	w25, [x16, #0x4]
    cfb0:      	add	x16, sp, #0x20
    cfb4:      	ldr	x8, [x16]
    cfb8:      	add	x16, sp, #0x30
    cfbc:      	str	x8, [x16]
    cfc0:      	mov	x8, x1
    cfc4:      	mov	x1, x0
    cfc8:      	movz	x0, #0x0, lsl #48
    cfcc:      	b	0xd0c8 <_stogir.conditional.operands+0x3d0>
    cfd0:      	mov	x9, x8
    cfd4:      	movz	x8, #0x0, lsl #48
    cfd8:      	b	0xcfec <_stogir.conditional.operands+0x2f4>
    cfdc:      	movz	x9, #0x0, lsl #48
    cfe0:      	fmov	d31, x8
    cfe4:      	mov	x8, x9
    cfe8:      	fmov	x9, d31
    cfec:      	cmp	x8, #0x0
    cff0:      	b.eq	0xd054 <_stogir.conditional.operands+0x35c>
    cff4:      	uxtb	w16, w1
    cff8:      	cmp	w16, wzr
    cffc:      	b.eq	0xd024 <_stogir.conditional.operands+0x32c>
    d000:      	lsl	x0, x0, #4
    d004:      	ldr	x1, [x22]
    d008:      	add	x0, x0, x1
    d00c:      	ldr	x1, [x0]
    d010:      	ldr	x0, [x0, #0x8]
    d014:      	fmov	d31, x0
    d018:      	mov	x0, x1
    d01c:      	fmov	x1, d31
    d020:      	b	0xd044 <_stogir.conditional.operands+0x34c>
    d024:      	lsl	x0, x10, #4
    d028:      	ldr	x1, [x22, #0x28]
    d02c:      	add	x0, x0, x1
    d030:      	ldr	x1, [x0]
    d034:      	ldr	x0, [x0, #0x8]
    d038:      	fmov	d31, x0
    d03c:      	mov	x0, x1
    d040:      	fmov	x1, d31
    d044:      	mov	x8, x1
    d048:      	mov	x1, x0
    d04c:      	mov	x0, #0x1                ; =1
    d050:      	b	0xd060 <_stogir.conditional.operands+0x368>
    d054:      	movz	x0, #0x0, lsl #48
    d058:      	movz	x1, #0x0, lsl #48
    d05c:      	movz	x8, #0x0, lsl #48
    d060:      	lsr	w0, w0, #0
    d064:      	lsr	x16, x0, #0
    d068:      	cmp	x16, #0x1
    d06c:      	b.eq	0xd088 <_stogir.conditional.operands+0x390>
    d070:      	b.lo	0xd078 <_stogir.conditional.operands+0x380>
    d074:      	b	0xd08c <_stogir.conditional.operands+0x394>
    d078:      	cmp	x16, #0x0
    d07c:      	b.eq	0xd084 <_stogir.conditional.operands+0x38c>
    d080:      	b	0xd08c <_stogir.conditional.operands+0x394>
    d084:      	b	0xd090 <_stogir.conditional.operands+0x398>
    d088:      	b	0xd278 <_stogir.conditional.operands+0x580>
    d08c:      	b	0xd37c <_stogir.conditional.operands+0x684>
    d090:      	mov	x0, x9
    d094:      	mov	x1, x3
    d098:      	mov	x8, #0x10               ; =16
    d09c:      	b	0xd0c8 <_stogir.conditional.operands+0x3d0>
    d0a0:      	and	x0, x20, #0xffffffff
    d0a4:      	mov	x1, x0
    d0a8:      	movz	x0, #0x0, lsl #48
    d0ac:      	movz	x2, #0x0, lsl #48
    d0b0:      	b	0xd1fc <_stogir.conditional.operands+0x504>
    d0b4:      	mov	x0, x4
    d0b8:      	mov	x1, #0x21               ; =33
    d0bc:      	mov	x8, x1
    d0c0:      	mov	x1, x0
    d0c4:      	mov	x0, x9
    d0c8:      	cmp	x0, #0x2
    d0cc:      	b.ge	0xd100 <_stogir.conditional.operands+0x408>
    d0d0:      	add	x9, x0, #0x1
    d0d4:      	lsl	x0, x0, #2
    d0d8:      	add	x0, x0, x2
    d0dc:      	ldr	w0, [x0]
    d0e0:      	sxtw	x0, w0
    d0e4:      	and	x0, x0, #0xffffffff
    d0e8:      	mov	x23, x1
    d0ec:      	mov	x1, x0
    d0f0:      	mov	x24, x8
    d0f4:      	mov	x8, x9
    d0f8:      	mov	x0, #0x1                ; =1
    d0fc:      	b	0xd114 <_stogir.conditional.operands+0x41c>
    d100:      	mov	x23, x1
    d104:      	mov	x24, x8
    d108:      	mov	x8, x0
    d10c:      	movz	x0, #0x0, lsl #48
    d110:      	movz	x1, #0x0, lsl #48
    d114:      	add	x16, sp, #0x40
    d118:      	str	x0, [x16]
    d11c:      	lsr	w0, w0, #0
    d120:      	add	x16, sp, #0x40
    d124:      	str	x1, [x16, #0x8]
    d128:      	lsr	x16, x0, #0
    d12c:      	cmp	x16, #0x1
    d130:      	b.eq	0xd14c <_stogir.conditional.operands+0x454>
    d134:      	b.lo	0xd13c <_stogir.conditional.operands+0x444>
    d138:      	b	0xd150 <_stogir.conditional.operands+0x458>
    d13c:      	cmp	x16, #0x0
    d140:      	b.eq	0xd148 <_stogir.conditional.operands+0x450>
    d144:      	b	0xd150 <_stogir.conditional.operands+0x458>
    d148:      	b	0xd1bc <_stogir.conditional.operands+0x4c4>
    d14c:      	b	0xd154 <_stogir.conditional.operands+0x45c>
    d150:      	b	0xd374 <_stogir.conditional.operands+0x67c>
    d154:      	add	x16, sp, #0x40
    d158:      	ldr	w0, [x16, #0x8]
    d15c:      	sxtw	x0, w0
    d160:      	cmp	x0, #0x0
    d164:      	cset	w1, gt
    d168:      	movz	x16, #0x0, lsl #48
    d16c:      	sub	x9, x16, x0
    d170:      	sub	x10, x9, #0x1
    d174:      	uxtb	w16, w1
    d178:      	cmp	w16, wzr
    d17c:      	b.eq	0xd234 <_stogir.conditional.operands+0x53c>
    d180:      	ldr	x9, [x22, #0x8]
    d184:      	cmp	x0, x9
    d188:      	b.ge	0xcfd0 <_stogir.conditional.operands+0x2d8>
    d18c:      	ldr	x9, [x5, #0x8]
    d190:      	cmp	x0, x9
    d194:      	b.ge	0xcf48 <_stogir.conditional.operands+0x250>
    d198:      	lsl	x9, x0, #2
    d19c:      	ldr	x11, [x22, #0x78]
    d1a0:      	add	x9, x9, x11
    d1a4:      	ldr	w9, [x9]
    d1a8:      	sxtw	x9, w9
    d1ac:      	cmp	x9, #0x0
    d1b0:      	cset	w9, ge
    d1b4:      	ubfx	x9, x9, #0, #8
    d1b8:      	b	0xcf4c <_stogir.conditional.operands+0x254>
    d1bc:      	cmp	x24, #0x0
    d1c0:      	b.ne	0xd1f0 <_stogir.conditional.operands+0x4f8>
    d1c4:      	cmp	x24, #0x0
    d1c8:      	b.eq	0xd0a0 <_stogir.conditional.operands+0x3a8>
    d1cc:      	lsr	x0, x24, #0
    d1d0:      	mov	x1, x19
    d1d4:      	mov	x2, x0
    d1d8:      	mov	x0, x23
    d1dc:      	bl	0xd1dc <_stogir.conditional.operands+0x4e4>
		000000000000d1dc:  ARM64_RELOC_BRANCH26	_memcmp
    d1e0:      	lsr	w0, w0, #0
    d1e4:      	sxtw	x0, w0
    d1e8:      	cmp	x0, #0x0
    d1ec:      	b.eq	0xd0a0 <_stogir.conditional.operands+0x3a8>
    d1f0:      	mov	x1, x23
    d1f4:      	mov	x2, x24
    d1f8:      	mov	x0, #0x1                ; =1
    d1fc:      	str	x0, [x21]
    d200:      	str	x1, [x21, #0x8]
    d204:      	str	x2, [x21, #0x10]
    d208:      	ldr	x19, [sp, #0x60]
    d20c:      	ldr	x20, [sp, #0x68]
    d210:      	ldr	x21, [sp, #0x70]
    d214:      	ldr	x22, [sp, #0x78]
    d218:      	ldr	x23, [sp, #0x80]
    d21c:      	ldr	x24, [sp, #0x88]
    d220:      	ldr	x25, [sp, #0x90]
    d224:      	ldr	x29, [sp]
    d228:      	ldr	x30, [sp, #0x8]
    d22c:      	add	sp, sp, #0xa0
    d230:      	ret
    d234:      	cmp	x0, #0x0
    d238:      	b.ge	0xcfdc <_stogir.conditional.operands+0x2e4>
    d23c:      	ldr	x11, [x6, #0x8]
    d240:      	ldr	x12, [x7, #0x8]
    d244:      	cmp	x11, x12
    d248:      	b.ne	0xcf5c <_stogir.conditional.operands+0x264>
    d24c:      	cmp	x9, x11
    d250:      	b.gt	0xce58 <_stogir.conditional.operands+0x160>
    d254:      	lsl	x9, x10, #2
    d258:      	ldr	x11, [x22, #0x50]
    d25c:      	add	x9, x9, x11
    d260:      	ldr	w9, [x9]
    d264:      	sxtw	x9, w9
    d268:      	cmp	x9, #0x0
    d26c:      	cset	w9, gt
    d270:      	ubfx	x9, x9, #0, #8
    d274:      	b	0xce5c <_stogir.conditional.operands+0x164>
    d278:      	uxtb	w0, w1
    d27c:      	add	x16, sp, #0x50
    d280:      	str	x1, [x16]
    d284:      	add	x16, sp, #0x50
    d288:      	str	x8, [x16, #0x8]
    d28c:      	cmp	x0, #0x48
    d290:      	b.eq	0xd0b4 <_stogir.conditional.operands+0x3bc>
    d294:      	add	x16, sp, #0x50
    d298:      	ldr	w0, [x16]
    d29c:      	uxtb	w1, w0
    d2a0:      	cmp	x1, #0x46
    d2a4:      	b.eq	0xd0b4 <_stogir.conditional.operands+0x3bc>
    d2a8:      	ubfx	x0, x0, #8, #8
    d2ac:      	cmp	x0, x20
    d2b0:      	b.ne	0xd0b4 <_stogir.conditional.operands+0x3bc>
    d2b4:      	mov	x0, x23
    d2b8:      	mov	x1, x24
    d2bc:      	b	0xd0bc <_stogir.conditional.operands+0x3c4>
    d2c0:      	uxtb	w0, w1
    d2c4:      	add	x16, sp, #0x10
    d2c8:      	str	x1, [x16]
    d2cc:      	add	x16, sp, #0x10
    d2d0:      	str	x2, [x16, #0x8]
    d2d4:      	cmp	x0, #0x48
    d2d8:      	b.ne	0xd33c <_stogir.conditional.operands+0x644>
    d2dc:      	mov	x1, x3
    d2e0:      	mov	x2, x4
    d2e4:      	mov	x0, #0x1                ; =1
    d2e8:      	b	0xd320 <_stogir.conditional.operands+0x628>
    d2ec:      	mov	x3, x0
    d2f0:      	movz	x0, #0x0, lsl #48
    d2f4:      	fmov	d31, x1
    d2f8:      	mov	x1, x3
    d2fc:      	fmov	x3, d31
    d300:      	b	0xce6c <_stogir.conditional.operands+0x174>
    d304:      	cmp	x0, #0xd
    d308:      	cset	w0, le
    d30c:      	uxtb	w16, w0
    d310:      	cmp	w16, wzr
    d314:      	cset	x0, eq
    d318:      	mov	x1, x3
    d31c:      	mov	x2, x4
    d320:      	cmp	x0, #0x0
    d324:      	b.eq	0xcf64 <_stogir.conditional.operands+0x26c>
    d328:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000d328:  ARM64_RELOC_PAGE21	l_stogir.465
    d32c:      	ldr	x16, [x16]
		000000000000d32c:  ARM64_RELOC_PAGEOFF12	l_stogir.465
    d330:      	orr	x0, x16, xzr
    d334:      	mov	x1, #0x2a               ; =42
    d338:      	b	0xcf6c <_stogir.conditional.operands+0x274>
    d33c:      	add	x16, sp, #0x10
    d340:      	ldr	w0, [x16]
    d344:      	uxtb	w1, w0
    d348:      	cmp	x1, #0x46
    d34c:      	b.ne	0xd360 <_stogir.conditional.operands+0x668>
    d350:      	mov	x0, #0x1                ; =1
    d354:      	b	0xd318 <_stogir.conditional.operands+0x620>
    d358:      	movz	x3, #0x0, lsl #48
    d35c:      	b	0xce54 <_stogir.conditional.operands+0x15c>
    d360:      	ubfx	x0, x0, #8, #8
    d364:      	cmp	x0, #0x0
    d368:      	b.ne	0xd304 <_stogir.conditional.operands+0x60c>
    d36c:      	mov	x0, #0x1                ; =1
    d370:      	b	0xd318 <_stogir.conditional.operands+0x620>
    d374:      	brk	#0
    d378:      	b	0xd374 <_stogir.conditional.operands+0x67c>
    d37c:      	brk	#0
    d380:      	b	0xd37c <_stogir.conditional.operands+0x684>
    d384:      	brk	#0
    d388:      	b	0xd384 <_stogir.conditional.operands+0x68c>

000000000000d38c <_stogir.floating.unary?>:
    d38c:      	sxtw	x0, w0
    d390:      	cmp	x0, #0x1f
    d394:      	b.ne	0xd3a0 <_stogir.floating.unary?+0x14>
    d398:      	mov	x0, #0x1                ; =1
    d39c:      	b	0xd3ac <_stogir.floating.unary?+0x20>
    d3a0:      	cmp	x0, #0x20
    d3a4:      	cset	w0, eq
    d3a8:      	ubfx	x0, x0, #0, #8
    d3ac:      	ret

000000000000d3b0 <_stogir.floating.comparison?>:
    d3b0:      	sxtw	x0, w0
    d3b4:      	cmp	x0, #0xe
    d3b8:      	b.lt	0xd3cc <_stogir.floating.comparison?+0x1c>
    d3bc:      	cmp	x0, #0x19
    d3c0:      	cset	w0, le
    d3c4:      	ubfx	x0, x0, #0, #8
    d3c8:      	b	0xd3d0 <_stogir.floating.comparison?+0x20>
    d3cc:      	movz	x0, #0x0, lsl #48
    d3d0:      	ret

000000000000d3d4 <_stogir.floating.operands>:
    d3d4:      	sub	sp, sp, #0xb0
    d3d8:      	str	x29, [sp]
    d3dc:      	str	x30, [sp, #0x8]
    d3e0:      	mov	x29, sp
    d3e4:      	str	x19, [sp, #0x80]
    d3e8:      	str	x20, [sp, #0x88]
    d3ec:      	str	x21, [sp, #0x90]
    d3f0:      	str	x22, [sp, #0x98]
    d3f4:      	str	x23, [sp, #0xa0]
    d3f8:      	str	x24, [sp, #0xa8]
    d3fc:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000d3fc:  ARM64_RELOC_PAGE21	l_stogir.466
    d400:      	ldr	x16, [x16]
		000000000000d400:  ARM64_RELOC_PAGEOFF12	l_stogir.466
    d404:      	orr	x19, x16, xzr
    d408:      	sxtw	x1, w1
    d40c:      	sxtw	x20, w2
    d410:      	cmp	x1, #0x1f
    d414:      	cset	w2, eq
    d418:      	cmp	x1, #0x20
    d41c:      	cset	w6, eq
    d420:      	cmp	x1, #0xe
    d424:      	b.lt	0xd460 <_stogir.floating.operands+0x8c>
    d428:      	cmp	x1, #0x19
    d42c:      	b.gt	0xd460 <_stogir.floating.operands+0x8c>
    d430:      	cmp	x20, #0xc
    d434:      	b.ne	0xd440 <_stogir.floating.operands+0x6c>
    d438:      	mov	x7, #0x1                ; =1
    d43c:      	b	0xd44c <_stogir.floating.operands+0x78>
    d440:      	cmp	x20, #0xd
    d444:      	cset	w7, eq
    d448:      	ubfx	x7, x7, #0, #8
    d44c:      	cmp	x7, #0x0
    d450:      	b.eq	0xd498 <_stogir.floating.operands+0xc4>
    d454:      	mov	x7, x19
    d458:      	movz	x9, #0x0, lsl #48
    d45c:      	b	0xd4a8 <_stogir.floating.operands+0xd4>
    d460:      	uxtb	w16, w2
    d464:      	cmp	w16, wzr
    d468:      	b.ne	0xd430 <_stogir.floating.operands+0x5c>
    d46c:      	uxtb	w16, w6
    d470:      	cmp	w16, wzr
    d474:      	b.ne	0xd430 <_stogir.floating.operands+0x5c>
    d478:      	cmp	x1, #0x1a
    d47c:      	b.lt	0xd488 <_stogir.floating.operands+0xb4>
    d480:      	cmp	x1, #0x1d
    d484:      	b.le	0xd430 <_stogir.floating.operands+0x5c>
    d488:      	cmp	x1, #0x3a
    d48c:      	b.eq	0xd430 <_stogir.floating.operands+0x5c>
    d490:      	cmp	x1, #0x3b
    d494:      	b.eq	0xd430 <_stogir.floating.operands+0x5c>
    d498:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000d498:  ARM64_RELOC_PAGE21	l_stogir.467
    d49c:      	ldr	x16, [x16]
		000000000000d49c:  ARM64_RELOC_PAGEOFF12	l_stogir.467
    d4a0:      	orr	x7, x16, xzr
    d4a4:      	mov	x9, #0x22               ; =34
    d4a8:      	lsr	w3, w3, #0
    d4ac:      	add	x16, sp, #0x10
    d4b0:      	str	w3, [x16]
    d4b4:      	uxtb	w16, w2
    d4b8:      	cmp	w16, wzr
    d4bc:      	b.eq	0xd4cc <_stogir.floating.operands+0xf8>
    d4c0:      	mov	x6, x7
    d4c4:      	mov	x2, #0x1                ; =1
    d4c8:      	b	0xd4d8 <_stogir.floating.operands+0x104>
    d4cc:      	ubfx	x6, x6, #0, #8
    d4d0:      	mov	x2, x6
    d4d4:      	mov	x6, x7
    d4d8:      	cmp	x2, #0x0
    d4dc:      	b.eq	0xd518 <_stogir.floating.operands+0x144>
    d4e0:      	sxtw	x3, w3
    d4e4:      	mov	x2, x3
    d4e8:      	mov	x3, x6
    d4ec:      	b	0xd524 <_stogir.floating.operands+0x150>
    d4f0:      	mov	x0, x1
    d4f4:      	mov	x1, x2
    d4f8:      	b	0xd660 <_stogir.floating.operands+0x28c>
    d4fc:      	movz	x15, #0x0, lsl #48
    d500:      	fmov	d31, x9
    d504:      	mov	x9, x15
    d508:      	fmov	x15, d31
    d50c:      	b	0xd57c <_stogir.floating.operands+0x1a8>
    d510:      	movz	x15, #0x0, lsl #48
    d514:      	b	0xd584 <_stogir.floating.operands+0x1b0>
    d518:      	sxtw	x4, w4
    d51c:      	mov	x2, x4
    d520:      	mov	x3, x6
    d524:      	add	x16, sp, #0x20
    d528:      	orr	x4, x16, xzr
    d52c:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000d52c:  ARM64_RELOC_PAGE21	l_stogir.468
    d530:      	ldr	x16, [x16]
		000000000000d530:  ARM64_RELOC_PAGEOFF12	l_stogir.468
    d534:      	orr	x6, x16, xzr
    d538:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000d538:  ARM64_RELOC_PAGE21	l_stogir.469
    d53c:      	ldr	x16, [x16]
		000000000000d53c:  ARM64_RELOC_PAGEOFF12	l_stogir.469
    d540:      	orr	x7, x16, xzr
    d544:      	add	x10, x0, #0x78
    d548:      	add	x11, x0, #0x28
    d54c:      	add	x12, x0, #0x50
    d550:      	lsr	w2, w2, #0
    d554:      	add	x16, sp, #0x10
    d558:      	str	w2, [x16, #0x4]
    d55c:      	add	x16, sp, #0x10
    d560:      	ldr	x2, [x16]
    d564:      	add	x16, sp, #0x20
    d568:      	str	x2, [x16]
    d56c:      	movz	x2, #0x0, lsl #48
    d570:      	b	0xd684 <_stogir.floating.operands+0x2b0>
    d574:      	mov	x15, x9
    d578:      	movz	x9, #0x0, lsl #48
    d57c:      	b	0xd590 <_stogir.floating.operands+0x1bc>
    d580:      	movz	x15, #0x0, lsl #48
    d584:      	fmov	d31, x9
    d588:      	mov	x9, x15
    d58c:      	fmov	x15, d31
    d590:      	cmp	x9, #0x0
    d594:      	b.eq	0xd5d8 <_stogir.floating.operands+0x204>
    d598:      	uxtb	w16, w3
    d59c:      	cmp	w16, wzr
    d5a0:      	b.eq	0xd5b8 <_stogir.floating.operands+0x1e4>
    d5a4:      	lsl	x2, x2, #4
    d5a8:      	ldr	x3, [x0]
    d5ac:      	add	x2, x2, x3
    d5b0:      	ldr	x2, [x2]
    d5b4:      	b	0xd5c8 <_stogir.floating.operands+0x1f4>
    d5b8:      	lsl	x2, x21, #4
    d5bc:      	ldr	x3, [x0, #0x28]
    d5c0:      	add	x2, x2, x3
    d5c4:      	ldr	x2, [x2]
    d5c8:      	mov	x3, x2
    d5cc:      	mov	x9, x15
    d5d0:      	mov	x2, #0x1                ; =1
    d5d4:      	b	0xd5e4 <_stogir.floating.operands+0x210>
    d5d8:      	mov	x9, x15
    d5dc:      	movz	x2, #0x0, lsl #48
    d5e0:      	movz	x3, #0x0, lsl #48
    d5e4:      	lsr	w2, w2, #0
    d5e8:      	lsr	x16, x2, #0
    d5ec:      	cmp	x16, #0x1
    d5f0:      	b.eq	0xd60c <_stogir.floating.operands+0x238>
    d5f4:      	b.lo	0xd5fc <_stogir.floating.operands+0x228>
    d5f8:      	b	0xd610 <_stogir.floating.operands+0x23c>
    d5fc:      	cmp	x16, #0x0
    d600:      	b.eq	0xd608 <_stogir.floating.operands+0x234>
    d604:      	b	0xd610 <_stogir.floating.operands+0x23c>
    d608:      	b	0xd614 <_stogir.floating.operands+0x240>
    d60c:      	b	0xd880 <_stogir.floating.operands+0x4ac>
    d610:      	b	0xd9ec <_stogir.floating.operands+0x618>
    d614:      	mov	x2, x9
    d618:      	mov	x3, x6
    d61c:      	mov	x9, #0x18               ; =24
    d620:      	b	0xd684 <_stogir.floating.operands+0x2b0>
    d624:      	and	x0, x20, #0xffffffff
    d628:      	mov	x1, x0
    d62c:      	movz	x0, #0x0, lsl #48
    d630:      	movz	x2, #0x0, lsl #48
    d634:      	b	0xd808 <_stogir.floating.operands+0x434>
    d638:      	mov	x22, x3
    d63c:      	mov	x23, x4
    d640:      	mov	x1, #0x1                ; =1
    d644:      	cmp	x1, #0x0
    d648:      	b.eq	0xd89c <_stogir.floating.operands+0x4c8>
    d64c:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000d64c:  ARM64_RELOC_PAGE21	l_stogir.470
    d650:      	ldr	x16, [x16]
		000000000000d650:  ARM64_RELOC_PAGEOFF12	l_stogir.470
    d654:      	orr	x0, x16, xzr
    d658:      	mov	x24, x8
    d65c:      	mov	x1, #0x21               ; =33
    d660:      	mov	x21, x0
    d664:      	mov	x22, x1
    d668:      	b	0xd7c8 <_stogir.floating.operands+0x3f4>
    d66c:      	mov	x2, x7
    d670:      	mov	x3, #0x1e               ; =30
    d674:      	fmov	d31, x2
    d678:      	mov	x2, x9
    d67c:      	mov	x9, x3
    d680:      	fmov	x3, d31
    d684:      	cmp	x2, #0x2
    d688:      	b.ge	0xd6bc <_stogir.floating.operands+0x2e8>
    d68c:      	add	x13, x2, #0x1
    d690:      	lsl	x2, x2, #2
    d694:      	add	x2, x2, x4
    d698:      	ldr	w2, [x2]
    d69c:      	sxtw	x2, w2
    d6a0:      	and	x2, x2, #0xffffffff
    d6a4:      	mov	x14, x9
    d6a8:      	mov	x9, x13
    d6ac:      	mov	x13, x3
    d6b0:      	mov	x3, x2
    d6b4:      	mov	x2, #0x1                ; =1
    d6b8:      	b	0xd6d0 <_stogir.floating.operands+0x2fc>
    d6bc:      	mov	x13, x3
    d6c0:      	mov	x14, x9
    d6c4:      	mov	x9, x2
    d6c8:      	movz	x2, #0x0, lsl #48
    d6cc:      	movz	x3, #0x0, lsl #48
    d6d0:      	add	x16, sp, #0x30
    d6d4:      	str	x2, [x16]
    d6d8:      	lsr	w2, w2, #0
    d6dc:      	add	x16, sp, #0x30
    d6e0:      	str	x3, [x16, #0x8]
    d6e4:      	lsr	x16, x2, #0
    d6e8:      	cmp	x16, #0x1
    d6ec:      	b.eq	0xd708 <_stogir.floating.operands+0x334>
    d6f0:      	b.lo	0xd6f8 <_stogir.floating.operands+0x324>
    d6f4:      	b	0xd70c <_stogir.floating.operands+0x338>
    d6f8:      	cmp	x16, #0x0
    d6fc:      	b.eq	0xd704 <_stogir.floating.operands+0x330>
    d700:      	b	0xd70c <_stogir.floating.operands+0x338>
    d704:      	b	0xd778 <_stogir.floating.operands+0x3a4>
    d708:      	b	0xd710 <_stogir.floating.operands+0x33c>
    d70c:      	b	0xd994 <_stogir.floating.operands+0x5c0>
    d710:      	add	x16, sp, #0x30
    d714:      	ldr	w2, [x16, #0x8]
    d718:      	sxtw	x2, w2
    d71c:      	cmp	x2, #0x0
    d720:      	cset	w3, gt
    d724:      	movz	x16, #0x0, lsl #48
    d728:      	sub	x15, x16, x2
    d72c:      	sub	x21, x15, #0x1
    d730:      	uxtb	w16, w3
    d734:      	cmp	w16, wzr
    d738:      	b.eq	0xd83c <_stogir.floating.operands+0x468>
    d73c:      	ldr	x15, [x0, #0x8]
    d740:      	cmp	x2, x15
    d744:      	b.ge	0xd574 <_stogir.floating.operands+0x1a0>
    d748:      	ldr	x15, [x10, #0x8]
    d74c:      	cmp	x2, x15
    d750:      	b.ge	0xd4fc <_stogir.floating.operands+0x128>
    d754:      	lsl	x15, x2, #2
    d758:      	ldr	x22, [x0, #0x78]
    d75c:      	add	x15, x15, x22
    d760:      	ldr	w15, [x15]
    d764:      	sxtw	x15, w15
    d768:      	cmp	x15, #0x0
    d76c:      	cset	w15, ge
    d770:      	ubfx	x15, x15, #0, #8
    d774:      	b	0xd500 <_stogir.floating.operands+0x12c>
    d778:      	sxtw	x21, w5
    d77c:      	cmp	x21, #0x0
    d780:      	b.ne	0xd794 <_stogir.floating.operands+0x3c0>
    d784:      	mov	x3, x13
    d788:      	mov	x4, x14
    d78c:      	movz	x2, #0x0, lsl #48
    d790:      	b	0xd7a0 <_stogir.floating.operands+0x3cc>
    d794:      	mov	x3, x13
    d798:      	mov	x4, x14
    d79c:      	mov	x2, #0x1                ; =1
    d7a0:      	cmp	x2, #0x0
    d7a4:      	b.eq	0xd9fc <_stogir.floating.operands+0x628>
    d7a8:      	cmp	x1, #0x1d
    d7ac:      	b.ne	0xd638 <_stogir.floating.operands+0x264>
    d7b0:      	mov	x22, x3
    d7b4:      	mov	x23, x4
    d7b8:      	movz	x1, #0x0, lsl #48
    d7bc:      	b	0xd644 <_stogir.floating.operands+0x270>
    d7c0:      	mov	x21, x3
    d7c4:      	mov	x22, x4
    d7c8:      	cmp	x22, #0x0
    d7cc:      	b.ne	0xd7fc <_stogir.floating.operands+0x428>
    d7d0:      	cmp	x22, #0x0
    d7d4:      	b.eq	0xd624 <_stogir.floating.operands+0x250>
    d7d8:      	lsr	x0, x22, #0
    d7dc:      	mov	x1, x19
    d7e0:      	mov	x2, x0
    d7e4:      	mov	x0, x21
    d7e8:      	bl	0xd7e8 <_stogir.floating.operands+0x414>
		000000000000d7e8:  ARM64_RELOC_BRANCH26	_memcmp
    d7ec:      	lsr	w0, w0, #0
    d7f0:      	sxtw	x0, w0
    d7f4:      	cmp	x0, #0x0
    d7f8:      	b.eq	0xd624 <_stogir.floating.operands+0x250>
    d7fc:      	mov	x1, x21
    d800:      	mov	x2, x22
    d804:      	mov	x0, #0x1                ; =1
    d808:      	str	x0, [x24]
    d80c:      	str	x1, [x24, #0x8]
    d810:      	str	x2, [x24, #0x10]
    d814:      	ldr	x19, [sp, #0x80]
    d818:      	ldr	x20, [sp, #0x88]
    d81c:      	ldr	x21, [sp, #0x90]
    d820:      	ldr	x22, [sp, #0x98]
    d824:      	ldr	x23, [sp, #0xa0]
    d828:      	ldr	x24, [sp, #0xa8]
    d82c:      	ldr	x29, [sp]
    d830:      	ldr	x30, [sp, #0x8]
    d834:      	add	sp, sp, #0xb0
    d838:      	ret
    d83c:      	cmp	x2, #0x0
    d840:      	b.ge	0xd580 <_stogir.floating.operands+0x1ac>
    d844:      	ldr	x22, [x11, #0x8]
    d848:      	ldr	x23, [x12, #0x8]
    d84c:      	cmp	x22, x23
    d850:      	b.ne	0xd510 <_stogir.floating.operands+0x13c>
    d854:      	cmp	x15, x22
    d858:      	b.gt	0xd8f8 <_stogir.floating.operands+0x524>
    d85c:      	lsl	x15, x21, #2
    d860:      	ldr	x22, [x0, #0x50]
    d864:      	add	x15, x15, x22
    d868:      	ldr	w15, [x15]
    d86c:      	sxtw	x15, w15
    d870:      	cmp	x15, #0x0
    d874:      	cset	w15, gt
    d878:      	ubfx	x15, x15, #0, #8
    d87c:      	b	0xd8fc <_stogir.floating.operands+0x528>
    d880:      	lsr	w3, w3, #0
    d884:      	ubfx	x2, x3, #8, #8
    d888:      	cmp	x2, x20
    d88c:      	b.ne	0xd66c <_stogir.floating.operands+0x298>
    d890:      	mov	x2, x13
    d894:      	mov	x3, x14
    d898:      	b	0xd674 <_stogir.floating.operands+0x2a0>
    d89c:      	lsr	w5, w5, #0
    d8a0:      	mov	w1, w5
    d8a4:      	mov	x24, x8
    d8a8:      	add	x8, sp, #0x40
    d8ac:      	bl	0xd8ac <_stogir.floating.operands+0x4d8>
		000000000000d8ac:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    d8b0:      	add	x16, sp, #0x40
    d8b4:      	ldr	w0, [x16]
    d8b8:      	lsr	x16, x0, #0
    d8bc:      	cmp	x16, #0x1
    d8c0:      	b.eq	0xd8dc <_stogir.floating.operands+0x508>
    d8c4:      	b.lo	0xd8cc <_stogir.floating.operands+0x4f8>
    d8c8:      	b	0xd8e0 <_stogir.floating.operands+0x50c>
    d8cc:      	cmp	x16, #0x0
    d8d0:      	b.eq	0xd8d8 <_stogir.floating.operands+0x504>
    d8d4:      	b	0xd8e0 <_stogir.floating.operands+0x50c>
    d8d8:      	b	0xd8e4 <_stogir.floating.operands+0x510>
    d8dc:      	b	0xd900 <_stogir.floating.operands+0x52c>
    d8e0:      	b	0xd9f4 <_stogir.floating.operands+0x620>
    d8e4:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000d8e4:  ARM64_RELOC_PAGE21	l_stogir.471
    d8e8:      	ldr	x16, [x16]
		000000000000d8e8:  ARM64_RELOC_PAGEOFF12	l_stogir.471
    d8ec:      	orr	x0, x16, xzr
    d8f0:      	mov	x1, #0x16               ; =22
    d8f4:      	b	0xd4f8 <_stogir.floating.operands+0x124>
    d8f8:      	movz	x15, #0x0, lsl #48
    d8fc:      	b	0xd514 <_stogir.floating.operands+0x140>
    d900:      	add	x16, sp, #0x40
    d904:      	orr	x0, x16, xzr
    d908:      	add	x0, x0, #0x8
    d90c:      	add	x16, sp, #0x40
    d910:      	ldr	x1, [x16, #0x8]
    d914:      	add	x16, sp, #0x70
    d918:      	str	x1, [x16]
    d91c:      	ldr	x0, [x0, #0x8]
    d920:      	add	x16, sp, #0x70
    d924:      	str	x0, [x16, #0x8]
    d928:      	cmp	x21, #0x0
    d92c:      	b.ge	0xd968 <_stogir.floating.operands+0x594>
    d930:      	mov	x1, x22
    d934:      	mov	x2, x23
    d938:      	mov	x0, #0x1                ; =1
    d93c:      	b	0xd94c <_stogir.floating.operands+0x578>
    d940:      	movz	x0, #0x0, lsl #48
    d944:      	mov	x1, x22
    d948:      	mov	x2, x23
    d94c:      	cmp	x0, #0x0
    d950:      	b.eq	0xd4f0 <_stogir.floating.operands+0x11c>
    d954:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000d954:  ARM64_RELOC_PAGE21	l_stogir.472
    d958:      	ldr	x16, [x16]
		000000000000d958:  ARM64_RELOC_PAGEOFF12	l_stogir.472
    d95c:      	orr	x0, x16, xzr
    d960:      	mov	x1, #0x2d               ; =45
    d964:      	b	0xd4f8 <_stogir.floating.operands+0x124>
    d968:      	add	x16, sp, #0x70
    d96c:      	ldr	w0, [x16]
    d970:      	uxtb	w0, w0
    d974:      	cmp	x0, #0x83
    d978:      	b.ge	0xd99c <_stogir.floating.operands+0x5c8>
    d97c:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000d97c:  ARM64_RELOC_PAGE21	l_stogir.473
    d980:      	ldr	x16, [x16]
		000000000000d980:  ARM64_RELOC_PAGEOFF12	l_stogir.473
    d984:      	orr	x1, x16, xzr
    d988:      	add	x0, x0, x1
    d98c:      	ldrb	w0, [x0]
    d990:      	b	0xd9a0 <_stogir.floating.operands+0x5cc>
    d994:      	brk	#0
    d998:      	b	0xd994 <_stogir.floating.operands+0x5c0>
    d99c:      	movz	x0, #0x0, lsl #48
    d9a0:      	uxtb	w0, w0
    d9a4:      	and	x0, x0, #0x2
    d9a8:      	uxtb	w0, w0
    d9ac:      	cmp	x0, #0x0
    d9b0:      	cset	w0, eq
    d9b4:      	uxtb	w16, w0
    d9b8:      	cmp	w16, wzr
    d9bc:      	cset	x0, eq
    d9c0:      	cmp	x0, #0x0
    d9c4:      	b.ne	0xd940 <_stogir.floating.operands+0x56c>
    d9c8:      	add	x16, sp, #0x70
    d9cc:      	ldr	w0, [x16]
    d9d0:      	uxtb	w0, w0
    d9d4:      	cmp	x0, #0x65
    d9d8:      	b.eq	0xd940 <_stogir.floating.operands+0x56c>
    d9dc:      	cmp	x0, #0x66
    d9e0:      	b.eq	0xd940 <_stogir.floating.operands+0x56c>
    d9e4:      	mov	x0, #0x1                ; =1
    d9e8:      	b	0xd944 <_stogir.floating.operands+0x570>
    d9ec:      	brk	#0
    d9f0:      	b	0xd9ec <_stogir.floating.operands+0x618>
    d9f4:      	brk	#0
    d9f8:      	b	0xd9f4 <_stogir.floating.operands+0x620>
    d9fc:      	mov	x24, x8
    da00:      	b	0xd7c0 <_stogir.floating.operands+0x3ec>

000000000000da04 <_stogir.types.signed?>:
    da04:      	sxtw	x0, w0
    da08:      	cmp	x0, #0x7
    da0c:      	b.lt	0xda20 <_stogir.types.signed?+0x1c>
    da10:      	cmp	x0, #0xb
    da14:      	cset	w0, le
    da18:      	ubfx	x0, x0, #0, #8
    da1c:      	b	0xda24 <_stogir.types.signed?+0x20>
    da20:      	movz	x0, #0x0, lsl #48
    da24:      	ret

000000000000da28 <_stogir.integer-binary.logical?>:
    da28:      	sxtw	x0, w0
    da2c:      	cmp	x0, #0x2e
    da30:      	b.ne	0xda4c <_stogir.integer-binary.logical?+0x24>
    da34:      	mov	x0, #0x1                ; =1
    da38:      	b	0xda48 <_stogir.integer-binary.logical?+0x20>
    da3c:      	cmp	x0, #0x30
    da40:      	cset	w0, eq
    da44:      	ubfx	x0, x0, #0, #8
    da48:      	ret
    da4c:      	cmp	x0, #0x2f
    da50:      	b.ne	0xda3c <_stogir.integer-binary.logical?+0x14>
    da54:      	mov	x0, #0x1                ; =1
    da58:      	b	0xda48 <_stogir.integer-binary.logical?+0x20>

000000000000da5c <_inherent$slice$data__i8>:
    da5c:      	ret

000000000000da60 <_inherent$slice$data__u32>:
    da60:      	ret

000000000000da64 <_inherent$coil.arraylist.ArrayList$slice__stogir.node.Node>:
    da64:      	sub	sp, sp, #0x10
    da68:      	mov	x1, sp
    da6c:      	ldr	x2, [x0]
    da70:      	ldr	x0, [x0, #0x8]
    da74:      	str	x2, [x1]
    da78:      	str	x0, [x1, #0x8]
    da7c:      	ldr	x0, [sp]
    da80:      	ldr	x1, [sp, #0x8]
    da84:      	add	sp, sp, #0x10
    da88:      	ret

000000000000da8c <_inherent$slice$at__stogir.node.Node>:
    da8c:      	lsl	x1, x2, #4
    da90:      	add	x0, x1, x0
    da94:      	ret

000000000000da98 <_inherent$slice$new__u8>:
    da98:      	sub	sp, sp, #0x10
    da9c:      	mov	x2, sp
    daa0:      	str	x0, [x2]
    daa4:      	str	x1, [x2, #0x8]
    daa8:      	ldr	x0, [sp]
    daac:      	ldr	x1, [sp, #0x8]
    dab0:      	add	sp, sp, #0x10
    dab4:      	ret

000000000000dab8 <_stogir.vector-lanes.operands>:
    dab8:      	sub	sp, sp, #0x140
    dabc:      	str	x29, [sp]
    dac0:      	str	x30, [sp, #0x8]
    dac4:      	mov	x29, sp
    dac8:      	str	x19, [sp, #0xe8]
    dacc:      	str	x20, [sp, #0xf0]
    dad0:      	str	x21, [sp, #0xf8]
    dad4:      	str	x22, [sp, #0x100]
    dad8:      	str	x23, [sp, #0x108]
    dadc:      	str	x24, [sp, #0x110]
    dae0:      	str	x25, [sp, #0x118]
    dae4:      	str	x26, [sp, #0x120]
    dae8:      	str	x27, [sp, #0x128]
    daec:      	str	x28, [sp, #0x130]
    daf0:      	sxtw	x4, w4
    daf4:      	cmp	x4, #0x0
    daf8:      	cset	w7, gt
    dafc:      	movz	x16, #0x0, lsl #48
    db00:      	sub	x9, x16, x4
    db04:      	sub	x10, x9, #0x1
    db08:      	uxtb	w16, w7
    db0c:      	cmp	w16, wzr
    db10:      	b.eq	0xdb54 <_stogir.vector-lanes.operands+0x9c>
    db14:      	ldr	x9, [x0, #0x8]
    db18:      	cmp	x4, x9
    db1c:      	b.ge	0xdc08 <_stogir.vector-lanes.operands+0x150>
    db20:      	add	x9, x0, #0x78
    db24:      	ldr	x9, [x9, #0x8]
    db28:      	cmp	x4, x9
    db2c:      	b.ge	0xdd50 <_stogir.vector-lanes.operands+0x298>
    db30:      	lsl	x9, x4, #2
    db34:      	ldr	x11, [x0, #0x78]
    db38:      	add	x9, x9, x11
    db3c:      	ldr	w9, [x9]
    db40:      	sxtw	x9, w9
    db44:      	cmp	x9, #0x0
    db48:      	cset	w9, ge
    db4c:      	ubfx	x9, x9, #0, #8
    db50:      	b	0xdd54 <_stogir.vector-lanes.operands+0x29c>
    db54:      	cmp	x4, #0x0
    db58:      	b.ge	0xdc10 <_stogir.vector-lanes.operands+0x158>
    db5c:      	add	x11, x0, #0x28
    db60:      	add	x12, x0, #0x50
    db64:      	ldr	x11, [x11, #0x8]
    db68:      	ldr	x12, [x12, #0x8]
    db6c:      	cmp	x11, x12
    db70:      	b.ne	0xdba0 <_stogir.vector-lanes.operands+0xe8>
    db74:      	cmp	x9, x11
    db78:      	b.gt	0xded4 <_stogir.vector-lanes.operands+0x41c>
    db7c:      	lsl	x9, x10, #2
    db80:      	ldr	x11, [x0, #0x50]
    db84:      	add	x9, x9, x11
    db88:      	ldr	w9, [x9]
    db8c:      	sxtw	x9, w9
    db90:      	cmp	x9, #0x0
    db94:      	cset	w9, gt
    db98:      	ubfx	x9, x9, #0, #8
    db9c:      	b	0xded8 <_stogir.vector-lanes.operands+0x420>
    dba0:      	movz	x9, #0x0, lsl #48
    dba4:      	b	0xdc14 <_stogir.vector-lanes.operands+0x15c>
    dba8:      	mov	x0, x1
    dbac:      	mov	x1, x22
    dbb0:      	str	x20, [sp, #0xd0]
    dbb4:      	str	x19, [sp, #0xc0]
    dbb8:      	str	x21, [sp, #0xa8]
    dbbc:      	mov	x19, x0
    dbc0:      	mov	x20, x1
    dbc4:      	cmp	x20, #0x0
    dbc8:      	b.ne	0xdbf8 <_stogir.vector-lanes.operands+0x140>
    dbcc:      	cmp	x20, #0x0
    dbd0:      	b.eq	0xdedc <_stogir.vector-lanes.operands+0x424>
    dbd4:      	lsr	x0, x20, #0
    dbd8:      	ldr	x1, [sp, #0xa8]
    dbdc:      	mov	x2, x0
    dbe0:      	mov	x0, x19
    dbe4:      	bl	0xdbe4 <_stogir.vector-lanes.operands+0x12c>
		000000000000dbe4:  ARM64_RELOC_BRANCH26	_memcmp
    dbe8:      	lsr	w0, w0, #0
    dbec:      	sxtw	x0, w0
    dbf0:      	cmp	x0, #0x0
    dbf4:      	b.eq	0xdedc <_stogir.vector-lanes.operands+0x424>
    dbf8:      	mov	x1, x19
    dbfc:      	mov	x2, x20
    dc00:      	mov	x0, #0x1                ; =1
    dc04:      	b	0xdcd4 <_stogir.vector-lanes.operands+0x21c>
    dc08:      	movz	x9, #0x0, lsl #48
    dc0c:      	b	0xdc14 <_stogir.vector-lanes.operands+0x15c>
    dc10:      	movz	x9, #0x0, lsl #48
    dc14:      	cmp	x9, #0x0
    dc18:      	b.eq	0xdc7c <_stogir.vector-lanes.operands+0x1c4>
    dc1c:      	uxtb	w16, w7
    dc20:      	cmp	w16, wzr
    dc24:      	b.eq	0xdc4c <_stogir.vector-lanes.operands+0x194>
    dc28:      	lsl	x4, x4, #4
    dc2c:      	ldr	x7, [x0]
    dc30:      	add	x4, x4, x7
    dc34:      	ldr	x7, [x4]
    dc38:      	ldr	x4, [x4, #0x8]
    dc3c:      	fmov	d31, x4
    dc40:      	mov	x4, x7
    dc44:      	fmov	x7, d31
    dc48:      	b	0xdc6c <_stogir.vector-lanes.operands+0x1b4>
    dc4c:      	lsl	x4, x10, #4
    dc50:      	ldr	x7, [x0, #0x28]
    dc54:      	add	x4, x4, x7
    dc58:      	ldr	x7, [x4]
    dc5c:      	ldr	x4, [x4, #0x8]
    dc60:      	fmov	d31, x4
    dc64:      	mov	x4, x7
    dc68:      	fmov	x7, d31
    dc6c:      	mov	x9, x7
    dc70:      	mov	x7, x4
    dc74:      	mov	x4, #0x1                ; =1
    dc78:      	b	0xdc88 <_stogir.vector-lanes.operands+0x1d0>
    dc7c:      	movz	x4, #0x0, lsl #48
    dc80:      	movz	x7, #0x0, lsl #48
    dc84:      	movz	x9, #0x0, lsl #48
    dc88:      	lsr	w4, w4, #0
    dc8c:      	lsr	x16, x4, #0
    dc90:      	cmp	x16, #0x1
    dc94:      	b.eq	0xdcb0 <_stogir.vector-lanes.operands+0x1f8>
    dc98:      	b.lo	0xdca0 <_stogir.vector-lanes.operands+0x1e8>
    dc9c:      	b	0xdcb4 <_stogir.vector-lanes.operands+0x1fc>
    dca0:      	cmp	x16, #0x0
    dca4:      	b.eq	0xdcac <_stogir.vector-lanes.operands+0x1f4>
    dca8:      	b	0xdcb4 <_stogir.vector-lanes.operands+0x1fc>
    dcac:      	b	0xdcb8 <_stogir.vector-lanes.operands+0x200>
    dcb0:      	b	0xdd1c <_stogir.vector-lanes.operands+0x264>
    dcb4:      	b	0xe32c <_stogir.vector-lanes.operands+0x874>
    dcb8:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000dcb8:  ARM64_RELOC_PAGE21	l_stogir.474
    dcbc:      	ldr	x16, [x16]
		000000000000dcbc:  ARM64_RELOC_PAGEOFF12	l_stogir.474
    dcc0:      	orr	x0, x16, xzr
    dcc4:      	str	x8, [sp, #0xc0]
    dcc8:      	mov	x1, x0
    dccc:      	mov	x0, #0x1                ; =1
    dcd0:      	mov	x2, #0x1b               ; =27
    dcd4:      	ldr	x3, [sp, #0xc0]
    dcd8:      	str	x0, [x3]
    dcdc:      	str	x1, [x3, #0x8]
    dce0:      	str	x2, [x3, #0x10]
    dce4:      	ldr	x19, [sp, #0xe8]
    dce8:      	ldr	x20, [sp, #0xf0]
    dcec:      	ldr	x21, [sp, #0xf8]
    dcf0:      	ldr	x22, [sp, #0x100]
    dcf4:      	ldr	x23, [sp, #0x108]
    dcf8:      	ldr	x24, [sp, #0x110]
    dcfc:      	ldr	x25, [sp, #0x118]
    dd00:      	ldr	x26, [sp, #0x120]
    dd04:      	ldr	x27, [sp, #0x128]
    dd08:      	ldr	x28, [sp, #0x130]
    dd0c:      	ldr	x29, [sp]
    dd10:      	ldr	x30, [sp, #0x8]
    dd14:      	add	sp, sp, #0x140
    dd18:      	ret
    dd1c:      	sxtw	x19, w1
    dd20:      	sxtw	x1, w2
    dd24:      	add	x16, sp, #0x10
    dd28:      	str	x7, [x16]
    dd2c:      	add	x16, sp, #0x10
    dd30:      	str	x9, [x16, #0x8]
    dd34:      	cmp	x19, #0x3d
    dd38:      	b.ne	0xdd58 <_stogir.vector-lanes.operands+0x2a0>
    dd3c:      	add	x16, sp, #0x10
    dd40:      	ldr	w4, [x16]
    dd44:      	ubfx	x4, x4, #8, #8
    dd48:      	mov	x20, x4
    dd4c:      	b	0xdd5c <_stogir.vector-lanes.operands+0x2a4>
    dd50:      	movz	x9, #0x0, lsl #48
    dd54:      	b	0xdc0c <_stogir.vector-lanes.operands+0x154>
    dd58:      	mov	x20, x1
    dd5c:      	cmp	x19, #0x3d
    dd60:      	b.eq	0xdd70 <_stogir.vector-lanes.operands+0x2b8>
    dd64:      	add	x16, sp, #0x10
    dd68:      	ldr	w1, [x16]
    dd6c:      	ubfx	x1, x1, #8, #8
    dd70:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000dd70:  ARM64_RELOC_PAGE21	l_stogir.475
    dd74:      	ldr	x16, [x16]
		000000000000dd74:  ARM64_RELOC_PAGEOFF12	l_stogir.475
    dd78:      	orr	x21, x16, xzr
    dd7c:      	lsr	w22, w20, #0
    dd80:      	sxtw	x23, w22
    dd84:      	cmp	x23, #0xf
    dd88:      	cset	w24, gt
    dd8c:      	cmp	x23, #0x80
    dd90:      	cset	w25, lt
    dd94:      	and	x4, x23, #0xf
    dd98:      	lsr	w4, w4, #0
    dd9c:      	sxtw	x4, w4
    dda0:      	cmp	x4, #0x1
    dda4:      	cset	w26, ge
    dda8:      	cmp	x4, #0xd
    ddac:      	cset	w27, le
    ddb0:      	cmp	x19, #0x3d
    ddb4:      	b.lt	0xde04 <_stogir.vector-lanes.operands+0x34c>
    ddb8:      	cmp	x19, #0x3f
    ddbc:      	b.gt	0xde04 <_stogir.vector-lanes.operands+0x34c>
    ddc0:      	uxtb	w16, w24
    ddc4:      	cmp	w16, wzr
    ddc8:      	b.eq	0xde04 <_stogir.vector-lanes.operands+0x34c>
    ddcc:      	uxtb	w16, w25
    ddd0:      	cmp	w16, wzr
    ddd4:      	b.eq	0xde04 <_stogir.vector-lanes.operands+0x34c>
    ddd8:      	uxtb	w16, w26
    dddc:      	cmp	w16, wzr
    dde0:      	b.eq	0xde04 <_stogir.vector-lanes.operands+0x34c>
    dde4:      	uxtb	w16, w27
    dde8:      	cmp	w16, wzr
    ddec:      	b.eq	0xde04 <_stogir.vector-lanes.operands+0x34c>
    ddf0:      	sxtw	x4, w3
    ddf4:      	cmp	x4, #0x4
    ddf8:      	b.eq	0xe42c <_stogir.vector-lanes.operands+0x974>
    ddfc:      	cmp	x4, #0x8
    de00:      	b.eq	0xe42c <_stogir.vector-lanes.operands+0x974>
    de04:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000de04:  ARM64_RELOC_PAGE21	l_stogir.476
    de08:      	ldr	x16, [x16]
		000000000000de08:  ARM64_RELOC_PAGEOFF12	l_stogir.476
    de0c:      	orr	x4, x16, xzr
    de10:      	mov	x28, x4
    de14:      	mov	x4, #0x36               ; =54
    de18:      	sxtw	x7, w5
    de1c:      	sxtw	x9, w6
    de20:      	cmp	x9, #0x0
    de24:      	cset	w9, eq
    de28:      	cmp	x19, #0x3f
    de2c:      	b.ne	0xe480 <_stogir.vector-lanes.operands+0x9c8>
    de30:      	lsr	w1, w1, #0
    de34:      	lsr	w3, w3, #0
    de38:      	mov	w0, w22
    de3c:      	mov	w2, w3
    de40:      	mov	x19, x8
    de44:      	mov	x22, x4
    de48:      	mov	x23, x7
    de4c:      	mov	w24, w9
    de50:      	bl	0xde50 <_stogir.vector-lanes.operands+0x398>
		000000000000de50:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    de54:      	cmp	x0, #0x0
    de58:      	b.eq	0xdf48 <_stogir.vector-lanes.operands+0x490>
    de5c:      	mov	x1, x28
    de60:      	movz	x0, #0x0, lsl #48
    de64:      	b	0xdf50 <_stogir.vector-lanes.operands+0x498>
    de68:      	cmp	x19, #0x3d
    de6c:      	b.ne	0xe48c <_stogir.vector-lanes.operands+0x9d4>
    de70:      	lsr	w2, w2, #0
    de74:      	lsr	w3, w3, #0
    de78:      	str	x0, [sp, #0xa0]
    de7c:      	mov	w0, w22
    de80:      	str	x1, [sp, #0xc0]
    de84:      	mov	w1, w2
    de88:      	mov	w2, w3
    de8c:      	str	x4, [sp, #0xc8]
    de90:      	str	w8, [sp, #0xd8]
    de94:      	str	x21, [sp, #0xa8]
    de98:      	mov	w21, w3
    de9c:      	str	w22, [sp, #0xb0]
    dea0:      	mov	w22, w5
    dea4:      	str	x28, [sp, #0xb8]
    dea8:      	mov	w28, w6
    deac:      	str	x20, [sp, #0xd0]
    deb0:      	mov	x20, x7
    deb4:      	bl	0xdeb4 <_stogir.vector-lanes.operands+0x3fc>
		000000000000deb4:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    deb8:      	cmp	x0, #0x0
    debc:      	b.ne	0xdf60 <_stogir.vector-lanes.operands+0x4a8>
    dec0:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000dec0:  ARM64_RELOC_PAGE21	l_stogir.477
    dec4:      	ldr	x16, [x16]
		000000000000dec4:  ARM64_RELOC_PAGEOFF12	l_stogir.477
    dec8:      	orr	x0, x16, xzr
    decc:      	mov	x1, #0x26               ; =38
    ded0:      	b	0xdf68 <_stogir.vector-lanes.operands+0x4b0>
    ded4:      	movz	x9, #0x0, lsl #48
    ded8:      	b	0xdba4 <_stogir.vector-lanes.operands+0xec>
    dedc:      	ldr	x0, [sp, #0xd0]
    dee0:      	and	x0, x0, #0xffffffff
    dee4:      	mov	x1, x0
    dee8:      	movz	x0, #0x0, lsl #48
    deec:      	movz	x2, #0x0, lsl #48
    def0:      	b	0xdc04 <_stogir.vector-lanes.operands+0x14c>
    def4:      	ldr	w0, [sp, #0xd8]
    def8:      	uxtb	w16, w0
    defc:      	cmp	w16, wzr
    df00:      	b.eq	0xe210 <_stogir.vector-lanes.operands+0x758>
    df04:      	mov	x0, x20
    df08:      	mov	x1, x22
    df0c:      	mov	x19, x0
    df10:      	mov	x20, x1
    df14:      	b	0xdbc4 <_stogir.vector-lanes.operands+0x10c>
    df18:      	cmp	x23, #0x0
    df1c:      	b.ne	0xe100 <_stogir.vector-lanes.operands+0x648>
    df20:      	uxtb	w16, w24
    df24:      	cmp	w16, wzr
    df28:      	cset	x0, eq
    df2c:      	cmp	x0, #0x0
    df30:      	b.eq	0xdba8 <_stogir.vector-lanes.operands+0xf0>
    df34:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000df34:  ARM64_RELOC_PAGE21	l_stogir.478
    df38:      	ldr	x16, [x16]
		000000000000df38:  ARM64_RELOC_PAGEOFF12	l_stogir.478
    df3c:      	orr	x0, x16, xzr
    df40:      	mov	x1, #0x24               ; =36
    df44:      	b	0xdbb0 <_stogir.vector-lanes.operands+0xf8>
    df48:      	mov	x1, x28
    df4c:      	mov	x0, #0x1                ; =1
    df50:      	cmp	x0, #0x0
    df54:      	b.eq	0xdf18 <_stogir.vector-lanes.operands+0x460>
    df58:      	mov	x0, #0x1                ; =1
    df5c:      	b	0xdf2c <_stogir.vector-lanes.operands+0x474>
    df60:      	ldr	x0, [sp, #0xb8]
    df64:      	ldr	x1, [sp, #0xc8]
    df68:      	cmp	x19, #0x3e
    df6c:      	b.ne	0xdfa8 <_stogir.vector-lanes.operands+0x4f0>
    df70:      	add	x16, sp, #0x10
    df74:      	ldr	w2, [x16]
    df78:      	ubfx	x2, x2, #8, #8
    df7c:      	cmp	x2, x23
    df80:      	b.ne	0xdf90 <_stogir.vector-lanes.operands+0x4d8>
    df84:      	mov	x2, x0
    df88:      	movz	x0, #0x0, lsl #48
    df8c:      	b	0xdf98 <_stogir.vector-lanes.operands+0x4e0>
    df90:      	mov	x2, x0
    df94:      	mov	x0, #0x1                ; =1
    df98:      	fmov	d31, x1
    df9c:      	mov	x1, x2
    dfa0:      	fmov	x2, d31
    dfa4:      	b	0xdfb4 <_stogir.vector-lanes.operands+0x4fc>
    dfa8:      	mov	x2, x1
    dfac:      	mov	x1, x0
    dfb0:      	movz	x0, #0x0, lsl #48
    dfb4:      	cmp	x0, #0x0
    dfb8:      	b.eq	0xdfd0 <_stogir.vector-lanes.operands+0x518>
    dfbc:      	adrp	x16, 0xd000 <_stogir.conditional.operands+0x308>
		000000000000dfbc:  ARM64_RELOC_PAGE21	l_stogir.479
    dfc0:      	ldr	x16, [x16]
		000000000000dfc0:  ARM64_RELOC_PAGEOFF12	l_stogir.479
    dfc4:      	orr	x0, x16, xzr
    dfc8:      	mov	x1, #0x27               ; =39
    dfcc:      	b	0xdfd8 <_stogir.vector-lanes.operands+0x520>
    dfd0:      	mov	x0, x1
    dfd4:      	mov	x1, x2
    dfd8:      	lsr	w22, w22, #0
    dfdc:      	add	x8, sp, #0x20
    dfe0:      	str	x1, [sp, #0xe0]
    dfe4:      	mov	w1, w22
    dfe8:      	mov	x22, x0
    dfec:      	ldr	x0, [sp, #0xa0]
    dff0:      	bl	0xdff0 <_stogir.vector-lanes.operands+0x538>
		000000000000dff0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    dff4:      	add	x16, sp, #0x20
    dff8:      	ldr	w0, [x16]
    dffc:      	lsr	x16, x0, #0
    e000:      	cmp	x16, #0x1
    e004:      	b.eq	0xe020 <_stogir.vector-lanes.operands+0x568>
    e008:      	b.lo	0xe010 <_stogir.vector-lanes.operands+0x558>
    e00c:      	b	0xe024 <_stogir.vector-lanes.operands+0x56c>
    e010:      	cmp	x16, #0x0
    e014:      	b.eq	0xe01c <_stogir.vector-lanes.operands+0x564>
    e018:      	b	0xe024 <_stogir.vector-lanes.operands+0x56c>
    e01c:      	b	0xe028 <_stogir.vector-lanes.operands+0x570>
    e020:      	b	0xe0a0 <_stogir.vector-lanes.operands+0x5e8>
    e024:      	b	0xe470 <_stogir.vector-lanes.operands+0x9b8>
    e028:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000e028:  ARM64_RELOC_PAGE21	l_stogir.480
    e02c:      	ldr	x16, [x16]
		000000000000e02c:  ARM64_RELOC_PAGEOFF12	l_stogir.480
    e030:      	orr	x0, x16, xzr
    e034:      	mov	x20, x0
    e038:      	mov	x22, #0x19              ; =25
    e03c:      	cmp	x19, #0x3e
    e040:      	b.ne	0xdef4 <_stogir.vector-lanes.operands+0x43c>
    e044:      	lsr	w28, w28, #0
    e048:      	add	x8, sp, #0x60
    e04c:      	ldr	x0, [sp, #0xa0]
    e050:      	mov	w1, w28
    e054:      	bl	0xe054 <_stogir.vector-lanes.operands+0x59c>
		000000000000e054:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    e058:      	add	x16, sp, #0x60
    e05c:      	ldr	w0, [x16]
    e060:      	lsr	x16, x0, #0
    e064:      	cmp	x16, #0x1
    e068:      	b.eq	0xe084 <_stogir.vector-lanes.operands+0x5cc>
    e06c:      	b.lo	0xe074 <_stogir.vector-lanes.operands+0x5bc>
    e070:      	b	0xe088 <_stogir.vector-lanes.operands+0x5d0>
    e074:      	cmp	x16, #0x0
    e078:      	b.eq	0xe080 <_stogir.vector-lanes.operands+0x5c8>
    e07c:      	b	0xe088 <_stogir.vector-lanes.operands+0x5d0>
    e080:      	b	0xe08c <_stogir.vector-lanes.operands+0x5d4>
    e084:      	b	0xe224 <_stogir.vector-lanes.operands+0x76c>
    e088:      	b	0xe478 <_stogir.vector-lanes.operands+0x9c0>
    e08c:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000e08c:  ARM64_RELOC_PAGE21	l_stogir.481
    e090:      	ldr	x16, [x16]
		000000000000e090:  ARM64_RELOC_PAGEOFF12	l_stogir.481
    e094:      	orr	x0, x16, xzr
    e098:      	mov	x1, #0x20               ; =32
    e09c:      	b	0xe110 <_stogir.vector-lanes.operands+0x658>
    e0a0:      	add	x16, sp, #0x20
    e0a4:      	orr	x0, x16, xzr
    e0a8:      	add	x0, x0, #0x8
    e0ac:      	add	x16, sp, #0x20
    e0b0:      	ldr	x1, [x16, #0x8]
    e0b4:      	add	x16, sp, #0x50
    e0b8:      	str	x1, [x16]
    e0bc:      	lsr	w1, w1, #0
    e0c0:      	ldr	x0, [x0, #0x8]
    e0c4:      	add	x16, sp, #0x50
    e0c8:      	str	x0, [x16, #0x8]
    e0cc:      	ubfx	x0, x1, #8, #8
    e0d0:      	cmp	x0, #0x1
    e0d4:      	b.lt	0xe114 <_stogir.vector-lanes.operands+0x65c>
    e0d8:      	cmp	x0, #0xb
    e0dc:      	cset	w0, le
    e0e0:      	ubfx	x0, x0, #0, #8
    e0e4:      	mov	x1, x22
    e0e8:      	b	0xe11c <_stogir.vector-lanes.operands+0x664>
    e0ec:      	mov	x0, x1
    e0f0:      	mov	x1, x2
    e0f4:      	mov	x20, x0
    e0f8:      	mov	x22, x1
    e0fc:      	b	0xe03c <_stogir.vector-lanes.operands+0x584>
    e100:      	mov	x0, #0x1                ; =1
    e104:      	b	0xdf2c <_stogir.vector-lanes.operands+0x474>
    e108:      	mov	x0, x1
    e10c:      	mov	x1, x22
    e110:      	b	0xdf0c <_stogir.vector-lanes.operands+0x454>
    e114:      	mov	x1, x22
    e118:      	movz	x0, #0x0, lsl #48
    e11c:      	cmp	x0, #0x0
    e120:      	b.eq	0xe12c <_stogir.vector-lanes.operands+0x674>
    e124:      	movz	x0, #0x0, lsl #48
    e128:      	b	0xe130 <_stogir.vector-lanes.operands+0x678>
    e12c:      	mov	x0, #0x1                ; =1
    e130:      	cmp	x0, #0x0
    e134:      	b.eq	0xe1e0 <_stogir.vector-lanes.operands+0x728>
    e138:      	mov	x0, #0x1                ; =1
    e13c:      	b	0xe168 <_stogir.vector-lanes.operands+0x6b0>
    e140:      	cmp	x0, #0x46
    e144:      	cset	w0, eq
    e148:      	uxtb	w16, w0
    e14c:      	cmp	w16, wzr
    e150:      	cset	x0, eq
    e154:      	cmp	x0, #0x0
    e158:      	cset	w0, ne
    e15c:      	uxtb	w16, w0
    e160:      	cmp	w16, wzr
    e164:      	cset	x0, eq
    e168:      	cmp	x0, #0x0
    e16c:      	b.eq	0xe184 <_stogir.vector-lanes.operands+0x6cc>
    e170:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000e170:  ARM64_RELOC_PAGE21	l_stogir.482
    e174:      	ldr	x16, [x16]
		000000000000e174:  ARM64_RELOC_PAGEOFF12	l_stogir.482
    e178:      	orr	x0, x16, xzr
    e17c:      	mov	x1, #0x2b               ; =43
    e180:      	b	0xe18c <_stogir.vector-lanes.operands+0x6d4>
    e184:      	mov	x0, x1
    e188:      	ldr	x1, [sp, #0xe0]
    e18c:      	cmp	x20, #0x0
    e190:      	b.ge	0xe1b8 <_stogir.vector-lanes.operands+0x700>
    e194:      	add	x16, sp, #0x50
    e198:      	ldr	w2, [x16]
    e19c:      	uxtb	w3, w2
    e1a0:      	ubfx	x2, x2, #8, #8
    e1a4:      	cmp	x3, x2
    e1a8:      	b.ne	0xe264 <_stogir.vector-lanes.operands+0x7ac>
    e1ac:      	mov	x2, x0
    e1b0:      	mov	x0, #0x1                ; =1
    e1b4:      	b	0xe27c <_stogir.vector-lanes.operands+0x7c4>
    e1b8:      	mov	x2, x1
    e1bc:      	mov	x1, x0
    e1c0:      	movz	x0, #0x0, lsl #48
    e1c4:      	cmp	x0, #0x0
    e1c8:      	b.eq	0xe0ec <_stogir.vector-lanes.operands+0x634>
    e1cc:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000e1cc:  ARM64_RELOC_PAGE21	l_stogir.483
    e1d0:      	ldr	x16, [x16]
		000000000000e1d0:  ARM64_RELOC_PAGEOFF12	l_stogir.483
    e1d4:      	orr	x0, x16, xzr
    e1d8:      	mov	x1, #0x28               ; =40
    e1dc:      	b	0xe0f4 <_stogir.vector-lanes.operands+0x63c>
    e1e0:      	add	x16, sp, #0x50
    e1e4:      	ldr	w0, [x16]
    e1e8:      	uxtb	w0, w0
    e1ec:      	cmp	x0, #0x48
    e1f0:      	b.ne	0xe140 <_stogir.vector-lanes.operands+0x688>
    e1f4:      	movz	x0, #0x0, lsl #48
    e1f8:      	b	0xe154 <_stogir.vector-lanes.operands+0x69c>
    e1fc:      	fmov	d31, x1
    e200:      	mov	x1, x2
    e204:      	fmov	x2, d31
    e208:      	movz	x0, #0x0, lsl #48
    e20c:      	b	0xe1c4 <_stogir.vector-lanes.operands+0x70c>
    e210:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000e210:  ARM64_RELOC_PAGE21	l_stogir.484
    e214:      	ldr	x16, [x16]
		000000000000e214:  ARM64_RELOC_PAGEOFF12	l_stogir.484
    e218:      	orr	x0, x16, xzr
    e21c:      	mov	x1, #0x20               ; =32
    e220:      	b	0xdf0c <_stogir.vector-lanes.operands+0x454>
    e224:      	add	x16, sp, #0x60
    e228:      	orr	x0, x16, xzr
    e22c:      	add	x0, x0, #0x8
    e230:      	add	x16, sp, #0x60
    e234:      	ldr	x1, [x16, #0x8]
    e238:      	add	x16, sp, #0x90
    e23c:      	str	x1, [x16]
    e240:      	uxtb	w1, w1
    e244:      	ldr	x0, [x0, #0x8]
    e248:      	add	x16, sp, #0x90
    e24c:      	str	x0, [x16, #0x8]
    e250:      	cmp	x1, #0x48
    e254:      	b.ne	0xe3a8 <_stogir.vector-lanes.operands+0x8f0>
    e258:      	mov	x1, x20
    e25c:      	movz	x0, #0x0, lsl #48
    e260:      	b	0xe3c0 <_stogir.vector-lanes.operands+0x908>
    e264:      	cmp	x3, #0x49
    e268:      	cset	w2, eq
    e26c:      	ubfx	x2, x2, #0, #8
    e270:      	fmov	d31, x0
    e274:      	mov	x0, x2
    e278:      	fmov	x2, d31
    e27c:      	cmp	x0, #0x0
    e280:      	b.eq	0xe1fc <_stogir.vector-lanes.operands+0x744>
    e284:      	add	x16, sp, #0x50
    e288:      	ldr	w0, [x16, #0x8]
    e28c:      	add	x16, sp, #0x50
    e290:      	ldr	w3, [x16, #0xc]
    e294:      	uxtb	w16, w24
    e298:      	cmp	w16, wzr
    e29c:      	b.eq	0xe2c8 <_stogir.vector-lanes.operands+0x810>
    e2a0:      	uxtb	w16, w25
    e2a4:      	cmp	w16, wzr
    e2a8:      	b.eq	0xe3fc <_stogir.vector-lanes.operands+0x944>
    e2ac:      	uxtb	w16, w26
    e2b0:      	cmp	w16, wzr
    e2b4:      	b.eq	0xe410 <_stogir.vector-lanes.operands+0x958>
    e2b8:      	ubfx	x27, x27, #0, #8
    e2bc:      	mov	x4, x2
    e2c0:      	mov	x2, x27
    e2c4:      	b	0xe418 <_stogir.vector-lanes.operands+0x960>
    e2c8:      	mov	x4, x1
    e2cc:      	movz	x1, #0x0, lsl #48
    e2d0:      	cmp	x1, #0x0
    e2d4:      	b.eq	0xe3d4 <_stogir.vector-lanes.operands+0x91c>
    e2d8:      	ubfx	x1, x23, #4, #32
    e2dc:      	sxtw	x1, w1
    e2e0:      	sub	x1, x1, #0x1
    e2e4:      	lsr	w1, w1, #0
    e2e8:      	sxtw	x1, w1
    e2ec:      	mov	x16, #0x1               ; =1
    e2f0:      	lsl	x1, x16, x1
    e2f4:      	lsr	w1, w1, #0
    e2f8:      	sxtw	x1, w1
    e2fc:      	ubfx	x0, x0, #0, #32
    e300:      	ubfx	x3, x3, #0, #32
    e304:      	lsl	x3, x3, #32
    e308:      	orr	x0, x3, x0
    e30c:      	lsr	w1, w1, #0
    e310:      	sxtw	x1, w1
    e314:      	cmp	x0, x1
    e318:      	cset	w0, hs
    e31c:      	ubfx	x0, x0, #0, #8
    e320:      	mov	x1, x2
    e324:      	mov	x2, x4
    e328:      	b	0xe20c <_stogir.vector-lanes.operands+0x754>
    e32c:      	brk	#0
    e330:      	b	0xe32c <_stogir.vector-lanes.operands+0x874>
    e334:      	lsr	w21, w21, #0
    e338:      	add	x16, sp, #0x90
    e33c:      	ldr	w0, [x16]
    e340:      	ubfx	x0, x0, #8, #8
    e344:      	lsr	w0, w0, #0
    e348:      	mov	w1, w0
    e34c:      	ldr	w0, [sp, #0xb0]
    e350:      	mov	w2, w21
    e354:      	bl	0xe354 <_stogir.vector-lanes.operands+0x89c>
		000000000000e354:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    e358:      	cmp	x0, #0x0
    e35c:      	cset	w0, ne
    e360:      	uxtb	w16, w0
    e364:      	cmp	w16, wzr
    e368:      	cset	x0, eq
    e36c:      	mov	x1, x19
    e370:      	cmp	x0, #0x0
    e374:      	b.eq	0xe108 <_stogir.vector-lanes.operands+0x650>
    e378:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000e378:  ARM64_RELOC_PAGE21	l_stogir.485
    e37c:      	ldr	x16, [x16]
		000000000000e37c:  ARM64_RELOC_PAGEOFF12	l_stogir.485
    e380:      	orr	x0, x16, xzr
    e384:      	mov	x1, #0x27               ; =39
    e388:      	b	0xe110 <_stogir.vector-lanes.operands+0x658>
    e38c:      	mov	x19, x1
    e390:      	mov	x0, #0x1                ; =1
    e394:      	cmp	x0, #0x0
    e398:      	b.eq	0xe334 <_stogir.vector-lanes.operands+0x87c>
    e39c:      	mov	x1, x19
    e3a0:      	mov	x0, #0x1                ; =1
    e3a4:      	b	0xe370 <_stogir.vector-lanes.operands+0x8b8>
    e3a8:      	cmp	x1, #0x46
    e3ac:      	cset	w0, eq
    e3b0:      	uxtb	w16, w0
    e3b4:      	cmp	w16, wzr
    e3b8:      	cset	x0, eq
    e3bc:      	mov	x1, x20
    e3c0:      	cmp	x0, #0x0
    e3c4:      	b.eq	0xe38c <_stogir.vector-lanes.operands+0x8d4>
    e3c8:      	mov	x19, x1
    e3cc:      	movz	x0, #0x0, lsl #48
    e3d0:      	b	0xe394 <_stogir.vector-lanes.operands+0x8dc>
    e3d4:      	cmp	x23, #0x0
    e3d8:      	b.lt	0xe408 <_stogir.vector-lanes.operands+0x950>
    e3dc:      	cmp	x23, #0xd
    e3e0:      	b.gt	0xe408 <_stogir.vector-lanes.operands+0x950>
    e3e4:      	cmp	x23, #0x0
    e3e8:      	cset	w1, eq
    e3ec:      	uxtb	w16, w1
    e3f0:      	cmp	w16, wzr
    e3f4:      	cset	x1, eq
    e3f8:      	b	0xe40c <_stogir.vector-lanes.operands+0x954>
    e3fc:      	mov	x4, x1
    e400:      	movz	x1, #0x0, lsl #48
    e404:      	b	0xe2d0 <_stogir.vector-lanes.operands+0x818>
    e408:      	movn	x1, #0x0, lsl #48
    e40c:      	b	0xe2fc <_stogir.vector-lanes.operands+0x844>
    e410:      	mov	x4, x2
    e414:      	movz	x2, #0x0, lsl #48
    e418:      	fmov	d31, x1
    e41c:      	mov	x1, x2
    e420:      	mov	x2, x4
    e424:      	fmov	x4, d31
    e428:      	b	0xe404 <_stogir.vector-lanes.operands+0x94c>
    e42c:      	add	x16, sp, #0x10
    e430:      	ldr	w4, [x16]
    e434:      	uxtb	w4, w4
    e438:      	cmp	x4, #0x48
    e43c:      	b.ne	0xe448 <_stogir.vector-lanes.operands+0x990>
    e440:      	movz	x4, #0x0, lsl #48
    e444:      	b	0xe45c <_stogir.vector-lanes.operands+0x9a4>
    e448:      	cmp	x4, #0x46
    e44c:      	cset	w4, eq
    e450:      	uxtb	w16, w4
    e454:      	cmp	w16, wzr
    e458:      	cset	x4, eq
    e45c:      	cmp	x4, #0x0
    e460:      	b.eq	0xde04 <_stogir.vector-lanes.operands+0x34c>
    e464:      	mov	x28, x21
    e468:      	movz	x4, #0x0, lsl #48
    e46c:      	b	0xde18 <_stogir.vector-lanes.operands+0x360>
    e470:      	brk	#0
    e474:      	b	0xe470 <_stogir.vector-lanes.operands+0x9b8>
    e478:      	brk	#0
    e47c:      	b	0xe478 <_stogir.vector-lanes.operands+0x9c0>
    e480:      	mov	x1, x8
    e484:      	mov	w8, w9
    e488:      	b	0xde68 <_stogir.vector-lanes.operands+0x3b0>
    e48c:      	str	x20, [sp, #0xd0]
    e490:      	str	x1, [sp, #0xc0]
    e494:      	str	x0, [sp, #0xa0]
    e498:      	mov	x20, x7
    e49c:      	str	x21, [sp, #0xa8]
    e4a0:      	mov	w21, w3
    e4a4:      	str	w22, [sp, #0xb0]
    e4a8:      	mov	w22, w5
    e4ac:      	str	w8, [sp, #0xd8]
    e4b0:      	str	x28, [sp, #0xb8]
    e4b4:      	mov	w28, w6
    e4b8:      	str	x4, [sp, #0xc8]
    e4bc:      	b	0xdf60 <_stogir.vector-lanes.operands+0x4a8>

000000000000e4c0 <_stogir.vector-comparison.operation?>:
    e4c0:      	sxtw	x0, w0
    e4c4:      	cmp	x0, #0xe
    e4c8:      	b.lt	0xe4dc <_stogir.vector-comparison.operation?+0x1c>
    e4cc:      	cmp	x0, #0x19
    e4d0:      	cset	w0, le
    e4d4:      	ubfx	x0, x0, #0, #8
    e4d8:      	b	0xe4e0 <_stogir.vector-comparison.operation?+0x20>
    e4dc:      	movz	x0, #0x0, lsl #48
    e4e0:      	ret

000000000000e4e4 <_stogir.vector-comparison.operands>:
    e4e4:      	sub	sp, sp, #0x100
    e4e8:      	str	x29, [sp]
    e4ec:      	str	x30, [sp, #0x8]
    e4f0:      	mov	x29, sp
    e4f4:      	str	x19, [sp, #0xb0]
    e4f8:      	str	x20, [sp, #0xb8]
    e4fc:      	str	x21, [sp, #0xc0]
    e500:      	str	x22, [sp, #0xc8]
    e504:      	str	x23, [sp, #0xd0]
    e508:      	str	x24, [sp, #0xd8]
    e50c:      	str	x25, [sp, #0xe0]
    e510:      	str	x26, [sp, #0xe8]
    e514:      	str	x27, [sp, #0xf0]
    e518:      	str	x28, [sp, #0xf8]
    e51c:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000e51c:  ARM64_RELOC_PAGE21	l_stogir.486
    e520:      	ldr	x16, [x16]
		000000000000e520:  ARM64_RELOC_PAGEOFF12	l_stogir.486
    e524:      	orr	x19, x16, xzr
    e528:      	lsr	w4, w4, #0
    e52c:      	mov	x20, x8
    e530:      	add	x8, sp, #0x10
    e534:      	mov	x21, x0
    e538:      	mov	w22, w1
    e53c:      	mov	w1, w4
    e540:      	mov	w23, w2
    e544:      	mov	w24, w3
    e548:      	mov	w25, w5
    e54c:      	bl	0xe54c <_stogir.vector-comparison.operands+0x68>
		000000000000e54c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    e550:      	add	x16, sp, #0x10
    e554:      	ldr	w0, [x16]
    e558:      	lsr	x16, x0, #0
    e55c:      	cmp	x16, #0x1
    e560:      	b.eq	0xe57c <_stogir.vector-comparison.operands+0x98>
    e564:      	b.lo	0xe56c <_stogir.vector-comparison.operands+0x88>
    e568:      	b	0xe580 <_stogir.vector-comparison.operands+0x9c>
    e56c:      	cmp	x16, #0x0
    e570:      	b.eq	0xe578 <_stogir.vector-comparison.operands+0x94>
    e574:      	b	0xe580 <_stogir.vector-comparison.operands+0x9c>
    e578:      	b	0xe584 <_stogir.vector-comparison.operands+0xa0>
    e57c:      	b	0xe5d4 <_stogir.vector-comparison.operands+0xf0>
    e580:      	b	0xe7d8 <_stogir.vector-comparison.operands+0x2f4>
    e584:      	mov	x1, x19
    e588:      	mov	x0, #0x1                ; =1
    e58c:      	mov	x2, #0x21               ; =33
    e590:      	str	x0, [x20]
    e594:      	str	x1, [x20, #0x8]
    e598:      	str	x2, [x20, #0x10]
    e59c:      	ldr	x19, [sp, #0xb0]
    e5a0:      	ldr	x20, [sp, #0xb8]
    e5a4:      	ldr	x21, [sp, #0xc0]
    e5a8:      	ldr	x22, [sp, #0xc8]
    e5ac:      	ldr	x23, [sp, #0xd0]
    e5b0:      	ldr	x24, [sp, #0xd8]
    e5b4:      	ldr	x25, [sp, #0xe0]
    e5b8:      	ldr	x26, [sp, #0xe8]
    e5bc:      	ldr	x27, [sp, #0xf0]
    e5c0:      	ldr	x28, [sp, #0xf8]
    e5c4:      	ldr	x29, [sp]
    e5c8:      	ldr	x30, [sp, #0x8]
    e5cc:      	add	sp, sp, #0x100
    e5d0:      	ret
    e5d4:      	add	x16, sp, #0x10
    e5d8:      	orr	x0, x16, xzr
    e5dc:      	lsr	w25, w25, #0
    e5e0:      	add	x0, x0, #0x8
    e5e4:      	add	x16, sp, #0x10
    e5e8:      	ldr	x1, [x16, #0x8]
    e5ec:      	add	x16, sp, #0x40
    e5f0:      	str	x1, [x16]
    e5f4:      	ldr	x0, [x0, #0x8]
    e5f8:      	add	x16, sp, #0x40
    e5fc:      	str	x0, [x16, #0x8]
    e600:      	add	x8, sp, #0x50
    e604:      	mov	x0, x21
    e608:      	mov	w1, w25
    e60c:      	bl	0xe60c <_stogir.vector-comparison.operands+0x128>
		000000000000e60c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    e610:      	add	x16, sp, #0x50
    e614:      	ldr	w0, [x16]
    e618:      	lsr	x16, x0, #0
    e61c:      	cmp	x16, #0x1
    e620:      	b.eq	0xe63c <_stogir.vector-comparison.operands+0x158>
    e624:      	b.lo	0xe62c <_stogir.vector-comparison.operands+0x148>
    e628:      	b	0xe640 <_stogir.vector-comparison.operands+0x15c>
    e62c:      	cmp	x16, #0x0
    e630:      	b.eq	0xe638 <_stogir.vector-comparison.operands+0x154>
    e634:      	b	0xe640 <_stogir.vector-comparison.operands+0x15c>
    e638:      	b	0xe644 <_stogir.vector-comparison.operands+0x160>
    e63c:      	b	0xe654 <_stogir.vector-comparison.operands+0x170>
    e640:      	b	0xe7e0 <_stogir.vector-comparison.operands+0x2fc>
    e644:      	mov	x1, x19
    e648:      	mov	x0, #0x1                ; =1
    e64c:      	mov	x2, #0x21               ; =33
    e650:      	b	0xe590 <_stogir.vector-comparison.operands+0xac>
    e654:      	sxtw	x19, w24
    e658:      	add	x16, sp, #0x50
    e65c:      	orr	x0, x16, xzr
    e660:      	cmp	x19, #0x4
    e664:      	cset	w21, eq
    e668:      	cmp	x19, #0x8
    e66c:      	cset	w25, eq
    e670:      	add	x0, x0, #0x8
    e674:      	add	x16, sp, #0x50
    e678:      	ldr	x1, [x16, #0x8]
    e67c:      	add	x16, sp, #0x80
    e680:      	str	x1, [x16]
    e684:      	ldr	x0, [x0, #0x8]
    e688:      	add	x16, sp, #0x80
    e68c:      	str	x0, [x16, #0x8]
    e690:      	add	x16, sp, #0x40
    e694:      	ldr	w0, [x16]
    e698:      	uxtb	w16, w21
    e69c:      	cmp	w16, wzr
    e6a0:      	b.ne	0xe6cc <_stogir.vector-comparison.operands+0x1e8>
    e6a4:      	uxtb	w16, w25
    e6a8:      	cmp	w16, wzr
    e6ac:      	b.ne	0xe6cc <_stogir.vector-comparison.operands+0x1e8>
    e6b0:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000e6b0:  ARM64_RELOC_PAGE21	l_stogir.487
    e6b4:      	ldr	x16, [x16]
		000000000000e6b4:  ARM64_RELOC_PAGEOFF12	l_stogir.487
    e6b8:      	orr	x0, x16, xzr
    e6bc:      	mov	x1, x0
    e6c0:      	mov	x0, #0x1                ; =1
    e6c4:      	mov	x2, #0x33               ; =51
    e6c8:      	b	0xe650 <_stogir.vector-comparison.operands+0x16c>
    e6cc:      	lsr	w22, w22, #0
    e6d0:      	ubfx	x26, x0, #8, #8
    e6d4:      	orr	x0, x26, xzr
    e6d8:      	lsr	w27, w0, #0
    e6dc:      	mov	w0, w22
    e6e0:      	mov	w1, w27
    e6e4:      	bl	0xe6e4 <_stogir.vector-comparison.operands+0x200>
		000000000000e6e4:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.valid-type?
    e6e8:      	cmp	x0, #0x0
    e6ec:      	b.eq	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e6f0:      	add	x16, sp, #0x40
    e6f4:      	ldr	w0, [x16]
    e6f8:      	orr	x1, x0, xzr
    e6fc:      	add	x16, sp, #0x80
    e700:      	ldr	w2, [x16]
    e704:      	orr	x3, x2, xzr
    e708:      	ubfx	x1, x1, #8, #8
    e70c:      	ubfx	x3, x3, #8, #8
    e710:      	cmp	x1, x3
    e714:      	b.ne	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e718:      	uxtb	w0, w0
    e71c:      	cmp	x0, #0x48
    e720:      	b.eq	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e724:      	cmp	x0, #0x46
    e728:      	b.eq	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e72c:      	uxtb	w2, w2
    e730:      	cmp	x2, #0x48
    e734:      	b.eq	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e738:      	cmp	x2, #0x46
    e73c:      	b.eq	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e740:      	sxtw	x22, w23
    e744:      	cmp	x22, #0xf
    e748:      	cset	w28, gt
    e74c:      	uxtb	w16, w28
    e750:      	cmp	w16, wzr
    e754:      	b.eq	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e758:      	cmp	x22, #0x80
    e75c:      	cset	w0, lt
    e760:      	uxtb	w16, w0
    e764:      	cmp	w16, wzr
    e768:      	b.eq	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e76c:      	and	x1, x22, #0xf
    e770:      	lsr	w1, w1, #0
    e774:      	sxtw	x1, w1
    e778:      	cmp	x1, #0x1
    e77c:      	cset	w2, ge
    e780:      	uxtb	w16, w2
    e784:      	cmp	w16, wzr
    e788:      	b.eq	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e78c:      	cmp	x1, #0xd
    e790:      	cset	w3, le
    e794:      	uxtb	w16, w3
    e798:      	cmp	w16, wzr
    e79c:      	b.eq	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e7a0:      	lsr	w23, w23, #0
    e7a4:      	str	x1, [sp, #0x98]
    e7a8:      	str	x19, [sp, #0x90]
    e7ac:      	mov	w19, w0
    e7b0:      	mov	w0, w23
    e7b4:      	str	w23, [sp, #0xa0]
    e7b8:      	mov	w23, w2
    e7bc:      	str	w27, [sp, #0xa8]
    e7c0:      	mov	w27, w3
    e7c4:      	bl	0xe7c4 <_stogir.vector-comparison.operands+0x2e0>
		000000000000e7c4:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    e7c8:      	cmp	x0, #0x0
    e7cc:      	b.eq	0xe7e8 <_stogir.vector-comparison.operands+0x304>
    e7d0:      	ldr	x0, [sp, #0x98]
    e7d4:      	b	0xe7ec <_stogir.vector-comparison.operands+0x308>
    e7d8:      	brk	#0
    e7dc:      	b	0xe7d8 <_stogir.vector-comparison.operands+0x2f4>
    e7e0:      	brk	#0
    e7e4:      	b	0xe7e0 <_stogir.vector-comparison.operands+0x2fc>
    e7e8:      	movn	x0, #0x0, lsl #48
    e7ec:      	lsr	w0, w0, #0
    e7f0:      	sxtw	x0, w0
    e7f4:      	cmp	x0, #0x1
    e7f8:      	b.lt	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e7fc:      	cmp	x0, #0xb
    e800:      	b.gt	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e804:      	uxtb	w16, w28
    e808:      	cmp	w16, wzr
    e80c:      	b.eq	0xe890 <_stogir.vector-comparison.operands+0x3ac>
    e810:      	uxtb	w16, w19
    e814:      	cmp	w16, wzr
    e818:      	b.eq	0xe890 <_stogir.vector-comparison.operands+0x3ac>
    e81c:      	uxtb	w16, w23
    e820:      	cmp	w16, wzr
    e824:      	b.eq	0xe890 <_stogir.vector-comparison.operands+0x3ac>
    e828:      	uxtb	w16, w27
    e82c:      	cmp	w16, wzr
    e830:      	b.eq	0xe890 <_stogir.vector-comparison.operands+0x3ac>
    e834:      	ubfx	x0, x22, #4, #32
    e838:      	sxtw	x0, w0
    e83c:      	sub	x0, x0, #0x1
    e840:      	lsr	w0, w0, #0
    e844:      	sxtw	x0, w0
    e848:      	mov	x16, #0x1               ; =1
    e84c:      	lsl	x0, x16, x0
    e850:      	lsr	w0, w0, #0
    e854:      	sxtw	x0, w0
    e858:      	b	0xe8bc <_stogir.vector-comparison.operands+0x3d8>
    e85c:      	movn	x1, #0x0, lsl #48
    e860:      	lsr	w0, w0, #0
    e864:      	sxtw	x0, w0
    e868:      	lsr	w1, w1, #0
    e86c:      	sxtw	x1, w1
    e870:      	cmp	x0, x1
    e874:      	b.ne	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e878:      	ldr	w0, [sp, #0xa0]
    e87c:      	bl	0xe87c <_stogir.vector-comparison.operands+0x398>
		000000000000e87c:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    e880:      	cmp	x0, #0x0
    e884:      	b.eq	0xe974 <_stogir.vector-comparison.operands+0x490>
    e888:      	ldr	x0, [sp, #0x98]
    e88c:      	b	0xe978 <_stogir.vector-comparison.operands+0x494>
    e890:      	cmp	x22, #0x0
    e894:      	b.lt	0xe8b8 <_stogir.vector-comparison.operands+0x3d4>
    e898:      	cmp	x22, #0xd
    e89c:      	b.gt	0xe8b8 <_stogir.vector-comparison.operands+0x3d4>
    e8a0:      	cmp	x22, #0x0
    e8a4:      	cset	w0, eq
    e8a8:      	uxtb	w16, w0
    e8ac:      	cmp	w16, wzr
    e8b0:      	cset	x0, eq
    e8b4:      	b	0xe8bc <_stogir.vector-comparison.operands+0x3d8>
    e8b8:      	movn	x0, #0x0, lsl #48
    e8bc:      	and	x1, x26, #0xf
    e8c0:      	lsr	w1, w1, #0
    e8c4:      	sxtw	x19, w1
    e8c8:      	cmp	x26, #0xf
    e8cc:      	b.le	0xe910 <_stogir.vector-comparison.operands+0x42c>
    e8d0:      	cmp	x26, #0x80
    e8d4:      	b.ge	0xe910 <_stogir.vector-comparison.operands+0x42c>
    e8d8:      	cmp	x19, #0x1
    e8dc:      	b.lt	0xe910 <_stogir.vector-comparison.operands+0x42c>
    e8e0:      	cmp	x19, #0xd
    e8e4:      	b.gt	0xe910 <_stogir.vector-comparison.operands+0x42c>
    e8e8:      	ubfx	x1, x26, #4, #32
    e8ec:      	sxtw	x1, w1
    e8f0:      	sub	x1, x1, #0x1
    e8f4:      	lsr	w1, w1, #0
    e8f8:      	sxtw	x1, w1
    e8fc:      	mov	x16, #0x1               ; =1
    e900:      	lsl	x1, x16, x1
    e904:      	lsr	w1, w1, #0
    e908:      	sxtw	x1, w1
    e90c:      	b	0xe860 <_stogir.vector-comparison.operands+0x37c>
    e910:      	cmp	x26, #0xd
    e914:      	b.gt	0xe85c <_stogir.vector-comparison.operands+0x378>
    e918:      	cmp	x26, #0x0
    e91c:      	cset	w1, eq
    e920:      	uxtb	w16, w1
    e924:      	cmp	w16, wzr
    e928:      	cset	x1, eq
    e92c:      	b	0xe860 <_stogir.vector-comparison.operands+0x37c>
    e930:      	movn	x0, #0x0, lsl #48
    e934:      	lsr	w24, w24, #0
    e938:      	lsr	w21, w21, #0
    e93c:      	sxtw	x21, w21
    e940:      	lsr	w0, w0, #0
    e944:      	lsr	w0, w0, #0
    e948:      	mov	w1, w24
    e94c:      	bl	0xe94c <_stogir.vector-comparison.operands+0x468>
		000000000000e94c:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    e950:      	lsr	w0, w0, #0
    e954:      	sxtw	x0, w0
    e958:      	cmp	x21, x0
    e95c:      	b.ne	0xe6b0 <_stogir.vector-comparison.operands+0x1cc>
    e960:      	and	x0, x26, #0xffffffff
    e964:      	mov	x1, x0
    e968:      	movz	x0, #0x0, lsl #48
    e96c:      	movz	x2, #0x0, lsl #48
    e970:      	b	0xe6c8 <_stogir.vector-comparison.operands+0x1e4>
    e974:      	movn	x0, #0x0, lsl #48
    e978:      	uxtb	w16, w21
    e97c:      	cmp	w16, wzr
    e980:      	b.ne	0xe9b8 <_stogir.vector-comparison.operands+0x4d4>
    e984:      	uxtb	w16, w25
    e988:      	cmp	w16, wzr
    e98c:      	b.ne	0xe9b8 <_stogir.vector-comparison.operands+0x4d4>
    e990:      	movn	x21, #0x0, lsl #48
    e994:      	b	0xe9a0 <_stogir.vector-comparison.operands+0x4bc>
    e998:      	mov	x0, #0x1                ; =1
    e99c:      	mov	x21, x0
    e9a0:      	ldr	w0, [sp, #0xa8]
    e9a4:      	bl	0xe9a4 <_stogir.vector-comparison.operands+0x4c0>
		000000000000e9a4:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    e9a8:      	cmp	x0, #0x0
    e9ac:      	b.eq	0xe930 <_stogir.vector-comparison.operands+0x44c>
    e9b0:      	mov	x0, x19
    e9b4:      	b	0xe934 <_stogir.vector-comparison.operands+0x450>
    e9b8:      	lsr	w0, w0, #0
    e9bc:      	sxtw	x0, w0
    e9c0:      	cmp	x0, #0x0
    e9c4:      	b.ne	0xe9d0 <_stogir.vector-comparison.operands+0x4ec>
    e9c8:      	movz	x0, #0x0, lsl #48
    e9cc:      	b	0xe99c <_stogir.vector-comparison.operands+0x4b8>
    e9d0:      	cmp	x0, #0x1
    e9d4:      	b.eq	0xe998 <_stogir.vector-comparison.operands+0x4b4>
    e9d8:      	cmp	x0, #0x2
    e9dc:      	b.eq	0xe998 <_stogir.vector-comparison.operands+0x4b4>
    e9e0:      	cmp	x0, #0x7
    e9e4:      	b.eq	0xe998 <_stogir.vector-comparison.operands+0x4b4>
    e9e8:      	cmp	x0, #0x8
    e9ec:      	b.eq	0xe998 <_stogir.vector-comparison.operands+0x4b4>
    e9f0:      	cmp	x0, #0x3
    e9f4:      	b.eq	0xea40 <_stogir.vector-comparison.operands+0x55c>
    e9f8:      	cmp	x0, #0x9
    e9fc:      	b.eq	0xea40 <_stogir.vector-comparison.operands+0x55c>
    ea00:      	cmp	x0, #0x4
    ea04:      	b.eq	0xea48 <_stogir.vector-comparison.operands+0x564>
    ea08:      	cmp	x0, #0xa
    ea0c:      	b.eq	0xea48 <_stogir.vector-comparison.operands+0x564>
    ea10:      	cmp	x0, #0xd
    ea14:      	b.eq	0xea48 <_stogir.vector-comparison.operands+0x564>
    ea18:      	cmp	x0, #0x5
    ea1c:      	b.eq	0xea50 <_stogir.vector-comparison.operands+0x56c>
    ea20:      	cmp	x0, #0xb
    ea24:      	b.eq	0xea50 <_stogir.vector-comparison.operands+0x56c>
    ea28:      	cmp	x0, #0xc
    ea2c:      	b.eq	0xea50 <_stogir.vector-comparison.operands+0x56c>
    ea30:      	cmp	x0, #0x6
    ea34:      	b.ne	0xea58 <_stogir.vector-comparison.operands+0x574>
    ea38:      	ldr	x0, [sp, #0x90]
    ea3c:      	b	0xea5c <_stogir.vector-comparison.operands+0x578>
    ea40:      	mov	x0, #0x2                ; =2
    ea44:      	b	0xe99c <_stogir.vector-comparison.operands+0x4b8>
    ea48:      	mov	x0, #0x4                ; =4
    ea4c:      	b	0xea44 <_stogir.vector-comparison.operands+0x560>
    ea50:      	mov	x0, #0x8                ; =8
    ea54:      	b	0xea4c <_stogir.vector-comparison.operands+0x568>
    ea58:      	movn	x0, #0x0, lsl #48
    ea5c:      	b	0xea54 <_stogir.vector-comparison.operands+0x570>

000000000000ea60 <_stogir.vector-arithmetic.operation?>:
    ea60:      	sxtw	x0, w0
    ea64:      	cmp	x0, #0x1f
    ea68:      	b.eq	0xeac4 <_stogir.vector-arithmetic.operation?+0x64>
    ea6c:      	cmp	x0, #0x20
    ea70:      	b.eq	0xeac4 <_stogir.vector-arithmetic.operation?+0x64>
    ea74:      	cmp	x0, #0x2d
    ea78:      	b.eq	0xeac4 <_stogir.vector-arithmetic.operation?+0x64>
    ea7c:      	cmp	x0, #0x36
    ea80:      	b.eq	0xeac4 <_stogir.vector-arithmetic.operation?+0x64>
    ea84:      	cmp	x0, #0x37
    ea88:      	b.eq	0xeac4 <_stogir.vector-arithmetic.operation?+0x64>
    ea8c:      	cmp	x0, #0x38
    ea90:      	b.eq	0xeac4 <_stogir.vector-arithmetic.operation?+0x64>
    ea94:      	cmp	x0, #0x39
    ea98:      	b.eq	0xeac4 <_stogir.vector-arithmetic.operation?+0x64>
    ea9c:      	cmp	x0, #0x3a
    eaa0:      	b.eq	0xeacc <_stogir.vector-arithmetic.operation?+0x6c>
    eaa4:      	cmp	x0, #0x3b
    eaa8:      	b.eq	0xeacc <_stogir.vector-arithmetic.operation?+0x6c>
    eaac:      	cmp	x0, #0x31
    eab0:      	b.lt	0xeae4 <_stogir.vector-arithmetic.operation?+0x84>
    eab4:      	cmp	x0, #0x35
    eab8:      	b.gt	0xeae4 <_stogir.vector-arithmetic.operation?+0x84>
    eabc:      	mov	x0, #0x1                ; =1
    eac0:      	b	0xeae0 <_stogir.vector-arithmetic.operation?+0x80>
    eac4:      	mov	x0, #0x1                ; =1
    eac8:      	ret
    eacc:      	mov	x0, #0x1                ; =1
    ead0:      	b	0xeac8 <_stogir.vector-arithmetic.operation?+0x68>
    ead4:      	cmp	x0, #0x30
    ead8:      	cset	w0, eq
    eadc:      	ubfx	x0, x0, #0, #8
    eae0:      	b	0xead0 <_stogir.vector-arithmetic.operation?+0x70>
    eae4:      	cmp	x0, #0x1a
    eae8:      	b.ne	0xeaf4 <_stogir.vector-arithmetic.operation?+0x94>
    eaec:      	mov	x0, #0x1                ; =1
    eaf0:      	b	0xeae0 <_stogir.vector-arithmetic.operation?+0x80>
    eaf4:      	cmp	x0, #0x1b
    eaf8:      	b.ne	0xeb04 <_stogir.vector-arithmetic.operation?+0xa4>
    eafc:      	mov	x0, #0x1                ; =1
    eb00:      	b	0xeae0 <_stogir.vector-arithmetic.operation?+0x80>
    eb04:      	cmp	x0, #0x1c
    eb08:      	b.ne	0xeb14 <_stogir.vector-arithmetic.operation?+0xb4>
    eb0c:      	mov	x0, #0x1                ; =1
    eb10:      	b	0xeae0 <_stogir.vector-arithmetic.operation?+0x80>
    eb14:      	cmp	x0, #0x1d
    eb18:      	b.ne	0xeb24 <_stogir.vector-arithmetic.operation?+0xc4>
    eb1c:      	mov	x0, #0x1                ; =1
    eb20:      	b	0xeae0 <_stogir.vector-arithmetic.operation?+0x80>
    eb24:      	cmp	x0, #0x1e
    eb28:      	b.ne	0xeb34 <_stogir.vector-arithmetic.operation?+0xd4>
    eb2c:      	mov	x0, #0x1                ; =1
    eb30:      	b	0xeae0 <_stogir.vector-arithmetic.operation?+0x80>
    eb34:      	cmp	x0, #0x2e
    eb38:      	b.ne	0xeb44 <_stogir.vector-arithmetic.operation?+0xe4>
    eb3c:      	mov	x0, #0x1                ; =1
    eb40:      	b	0xeae0 <_stogir.vector-arithmetic.operation?+0x80>
    eb44:      	cmp	x0, #0x2f
    eb48:      	b.ne	0xead4 <_stogir.vector-arithmetic.operation?+0x74>
    eb4c:      	mov	x0, #0x1                ; =1
    eb50:      	b	0xeae0 <_stogir.vector-arithmetic.operation?+0x80>

000000000000eb54 <_stogir.vector-arithmetic.unary?>:
    eb54:      	sxtw	x0, w0
    eb58:      	cmp	x0, #0x1f
    eb5c:      	b.ne	0xeb78 <_stogir.vector-arithmetic.unary?+0x24>
    eb60:      	mov	x0, #0x1                ; =1
    eb64:      	b	0xeb74 <_stogir.vector-arithmetic.unary?+0x20>
    eb68:      	cmp	x0, #0x39
    eb6c:      	cset	w0, eq
    eb70:      	ubfx	x0, x0, #0, #8
    eb74:      	ret
    eb78:      	cmp	x0, #0x20
    eb7c:      	b.ne	0xeb88 <_stogir.vector-arithmetic.unary?+0x34>
    eb80:      	mov	x0, #0x1                ; =1
    eb84:      	b	0xeb74 <_stogir.vector-arithmetic.unary?+0x20>
    eb88:      	cmp	x0, #0x2d
    eb8c:      	b.ne	0xeb98 <_stogir.vector-arithmetic.unary?+0x44>
    eb90:      	mov	x0, #0x1                ; =1
    eb94:      	b	0xeb74 <_stogir.vector-arithmetic.unary?+0x20>
    eb98:      	cmp	x0, #0x36
    eb9c:      	b.ne	0xeba8 <_stogir.vector-arithmetic.unary?+0x54>
    eba0:      	mov	x0, #0x1                ; =1
    eba4:      	b	0xeb74 <_stogir.vector-arithmetic.unary?+0x20>
    eba8:      	cmp	x0, #0x37
    ebac:      	b.ne	0xebb8 <_stogir.vector-arithmetic.unary?+0x64>
    ebb0:      	mov	x0, #0x1                ; =1
    ebb4:      	b	0xeb74 <_stogir.vector-arithmetic.unary?+0x20>
    ebb8:      	cmp	x0, #0x38
    ebbc:      	b.ne	0xeb68 <_stogir.vector-arithmetic.unary?+0x14>
    ebc0:      	mov	x0, #0x1                ; =1
    ebc4:      	b	0xeb74 <_stogir.vector-arithmetic.unary?+0x20>

000000000000ebc8 <_stogir.vector-arithmetic.operands>:
    ebc8:      	sub	sp, sp, #0xe0
    ebcc:      	str	x29, [sp]
    ebd0:      	str	x30, [sp, #0x8]
    ebd4:      	mov	x29, sp
    ebd8:      	str	x19, [sp, #0x88]
    ebdc:      	str	x20, [sp, #0x90]
    ebe0:      	str	x21, [sp, #0x98]
    ebe4:      	str	x22, [sp, #0xa0]
    ebe8:      	str	x23, [sp, #0xa8]
    ebec:      	str	x24, [sp, #0xb0]
    ebf0:      	str	x25, [sp, #0xb8]
    ebf4:      	str	x26, [sp, #0xc0]
    ebf8:      	str	x27, [sp, #0xc8]
    ebfc:      	str	x28, [sp, #0xd0]
    ec00:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000ec00:  ARM64_RELOC_PAGE21	l_stogir.488
    ec04:      	ldr	x16, [x16]
		000000000000ec04:  ARM64_RELOC_PAGEOFF12	l_stogir.488
    ec08:      	orr	x19, x16, xzr
    ec0c:      	lsr	w1, w1, #0
    ec10:      	lsr	w2, w2, #0
    ec14:      	mov	x20, x8
    ec18:      	mov	x21, x0
    ec1c:      	mov	w0, w1
    ec20:      	mov	w22, w1
    ec24:      	mov	w1, w2
    ec28:      	mov	w23, w2
    ec2c:      	mov	w24, w3
    ec30:      	mov	w25, w4
    ec34:      	mov	w26, w5
    ec38:      	bl	0xec38 <_stogir.vector-arithmetic.operands+0x70>
		000000000000ec38:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.valid-type?
    ec3c:      	cmp	x0, #0x0
    ec40:      	b.eq	0xec50 <_stogir.vector-arithmetic.operands+0x88>
    ec44:      	mov	x0, x19
    ec48:      	movz	x1, #0x0, lsl #48
    ec4c:      	b	0xec60 <_stogir.vector-arithmetic.operands+0x98>
    ec50:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000ec50:  ARM64_RELOC_PAGE21	l_stogir.489
    ec54:      	ldr	x16, [x16]
		000000000000ec54:  ARM64_RELOC_PAGEOFF12	l_stogir.489
    ec58:      	orr	x0, x16, xzr
    ec5c:      	mov	x1, #0x37               ; =55
    ec60:      	sxtw	x22, w22
    ec64:      	sxtw	x23, w23
    ec68:      	sxtw	x24, w24
    ec6c:      	sxtw	x25, w25
    ec70:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000ec70:  ARM64_RELOC_PAGE21	l_stogir.490
    ec74:      	ldr	x16, [x16]
		000000000000ec74:  ARM64_RELOC_PAGEOFF12	l_stogir.490
    ec78:      	orr	x2, x16, xzr
    ec7c:      	adrp	x16, 0xe000 <_stogir.vector-lanes.operands+0x548>
		000000000000ec7c:  ARM64_RELOC_PAGE21	l_stogir.491
    ec80:      	ldr	x16, [x16]
		000000000000ec80:  ARM64_RELOC_PAGEOFF12	l_stogir.491
    ec84:      	orr	x3, x16, xzr
    ec88:      	add	x4, x21, #0x78
    ec8c:      	add	x5, x21, #0x28
    ec90:      	add	x6, x21, #0x50
    ec94:      	cmp	x22, #0x31
    ec98:      	cset	w7, ge
    ec9c:      	cmp	x22, #0x35
    eca0:      	cset	w8, le
    eca4:      	cmp	x22, #0x1f
    eca8:      	cset	w9, eq
    ecac:      	cmp	x22, #0x20
    ecb0:      	cset	w10, eq
    ecb4:      	cmp	x22, #0x2d
    ecb8:      	cset	w11, eq
    ecbc:      	cmp	x22, #0x36
    ecc0:      	cset	w12, eq
    ecc4:      	cmp	x22, #0x37
    ecc8:      	cset	w13, eq
    eccc:      	cmp	x22, #0x38
    ecd0:      	cset	w14, eq
    ecd4:      	cmp	x22, #0x39
    ecd8:      	cset	w15, eq
    ecdc:      	ubfx	x15, x15, #0, #8
    ece0:      	mov	x27, x1
    ece4:      	mov	x1, x0
    ece8:      	movz	x0, #0x0, lsl #48
    ecec:      	b	0xedf4 <_stogir.vector-arithmetic.operands+0x22c>
    ecf0:      	movz	x3, #0x0, lsl #48
    ecf4:      	b	0xed04 <_stogir.vector-arithmetic.operands+0x13c>
    ecf8:      	movz	x3, #0x0, lsl #48
    ecfc:      	b	0xed0c <_stogir.vector-arithmetic.operands+0x144>
    ed00:      	movz	x3, #0x0, lsl #48
    ed04:      	b	0xed18 <_stogir.vector-arithmetic.operands+0x150>
    ed08:      	movz	x3, #0x0, lsl #48
    ed0c:      	str	x5, [sp, #0x80]
    ed10:      	b	0xed18 <_stogir.vector-arithmetic.operands+0x150>
    ed14:      	movz	x3, #0x0, lsl #48
    ed18:      	cmp	x3, #0x0
    ed1c:      	b.eq	0xed80 <_stogir.vector-arithmetic.operands+0x1b8>
    ed20:      	uxtb	w16, w2
    ed24:      	cmp	w16, wzr
    ed28:      	b.eq	0xed50 <_stogir.vector-arithmetic.operands+0x188>
    ed2c:      	lsl	x1, x1, #4
    ed30:      	ldr	x2, [x21]
    ed34:      	add	x1, x1, x2
    ed38:      	ldr	x2, [x1]
    ed3c:      	ldr	x1, [x1, #0x8]
    ed40:      	fmov	d31, x1
    ed44:      	mov	x1, x2
    ed48:      	fmov	x2, d31
    ed4c:      	b	0xed70 <_stogir.vector-arithmetic.operands+0x1a8>
    ed50:      	lsl	x1, x9, #4
    ed54:      	ldr	x2, [x21, #0x28]
    ed58:      	add	x1, x1, x2
    ed5c:      	ldr	x2, [x1]
    ed60:      	ldr	x1, [x1, #0x8]
    ed64:      	fmov	d31, x1
    ed68:      	mov	x1, x2
    ed6c:      	fmov	x2, d31
    ed70:      	mov	x3, x2
    ed74:      	mov	x2, x1
    ed78:      	mov	x1, #0x1                ; =1
    ed7c:      	b	0xed8c <_stogir.vector-arithmetic.operands+0x1c4>
    ed80:      	movz	x1, #0x0, lsl #48
    ed84:      	movz	x2, #0x0, lsl #48
    ed88:      	movz	x3, #0x0, lsl #48
    ed8c:      	lsr	w1, w1, #0
    ed90:      	lsr	x16, x1, #0
    ed94:      	cmp	x16, #0x1
    ed98:      	b.eq	0xedb4 <_stogir.vector-arithmetic.operands+0x1ec>
    ed9c:      	b.lo	0xeda4 <_stogir.vector-arithmetic.operands+0x1dc>
    eda0:      	b	0xedb8 <_stogir.vector-arithmetic.operands+0x1f0>
    eda4:      	cmp	x16, #0x0
    eda8:      	b.eq	0xedb0 <_stogir.vector-arithmetic.operands+0x1e8>
    edac:      	b	0xedb8 <_stogir.vector-arithmetic.operands+0x1f0>
    edb0:      	b	0xedbc <_stogir.vector-arithmetic.operands+0x1f4>
    edb4:      	b	0xef24 <_stogir.vector-arithmetic.operands+0x35c>
    edb8:      	b	0xf194 <_stogir.vector-arithmetic.operands+0x5cc>
    edbc:      	ldr	x1, [sp, #0x60]
    edc0:      	mov	x2, #0x21               ; =33
    edc4:      	b	0xedd0 <_stogir.vector-arithmetic.operands+0x208>
    edc8:      	ldr	x1, [sp, #0x68]
    edcc:      	mov	x2, #0x32               ; =50
    edd0:      	add	x0, x0, #0x1
    edd4:      	lsr	w0, w0, #0
    edd8:      	sxtw	x0, w0
    eddc:      	ldr	x3, [sp, #0x68]
    ede0:      	ldr	w9, [sp, #0x70]
    ede4:      	ldr	x4, [sp, #0x78]
    ede8:      	ldr	x5, [sp, #0x80]
    edec:      	mov	x27, x2
    edf0:      	ldr	x2, [sp, #0x60]
    edf4:      	uxtb	w16, w9
    edf8:      	cmp	w16, wzr
    edfc:      	b.eq	0xee50 <_stogir.vector-arithmetic.operands+0x288>
    ee00:      	mov	x28, x27
    ee04:      	mov	x27, x1
    ee08:      	mov	x1, #0x1                ; =1
    ee0c:      	b	0xee24 <_stogir.vector-arithmetic.operands+0x25c>
    ee10:      	mov	x28, x15
    ee14:      	fmov	d31, x1
    ee18:      	mov	x1, x28
    ee1c:      	mov	x28, x27
    ee20:      	fmov	x27, d31
    ee24:      	cmp	x1, #0x0
    ee28:      	b.eq	0xee34 <_stogir.vector-arithmetic.operands+0x26c>
    ee2c:      	mov	x1, #0x1                ; =1
    ee30:      	b	0xee38 <_stogir.vector-arithmetic.operands+0x270>
    ee34:      	mov	x1, #0x2                ; =2
    ee38:      	cmp	x0, x1
    ee3c:      	b.ge	0xefd0 <_stogir.vector-arithmetic.operands+0x408>
    ee40:      	cmp	x0, #0x0
    ee44:      	b.ne	0xee64 <_stogir.vector-arithmetic.operands+0x29c>
    ee48:      	mov	x1, x24
    ee4c:      	b	0xee68 <_stogir.vector-arithmetic.operands+0x2a0>
    ee50:      	uxtb	w16, w10
    ee54:      	cmp	w16, wzr
    ee58:      	b.eq	0xefa8 <_stogir.vector-arithmetic.operands+0x3e0>
    ee5c:      	mov	x28, #0x1               ; =1
    ee60:      	b	0xee14 <_stogir.vector-arithmetic.operands+0x24c>
    ee64:      	mov	x1, x25
    ee68:      	lsr	w1, w1, #0
    ee6c:      	sxtw	x1, w1
    ee70:      	str	x2, [sp, #0x60]
    ee74:      	cmp	x1, #0x0
    ee78:      	cset	w2, gt
    ee7c:      	str	x3, [sp, #0x68]
    ee80:      	movz	x16, #0x0, lsl #48
    ee84:      	sub	x3, x16, x1
    ee88:      	str	w9, [sp, #0x70]
    ee8c:      	sub	x9, x3, #0x1
    ee90:      	uxtb	w16, w2
    ee94:      	cmp	w16, wzr
    ee98:      	b.eq	0xf288 <_stogir.vector-arithmetic.operands+0x6c0>
    ee9c:      	ldr	x3, [x21, #0x8]
    eea0:      	cmp	x1, x3
    eea4:      	b.ge	0xf290 <_stogir.vector-arithmetic.operands+0x6c8>
    eea8:      	ldr	x3, [x4, #0x8]
    eeac:      	cmp	x1, x3
    eeb0:      	b.ge	0xf298 <_stogir.vector-arithmetic.operands+0x6d0>
    eeb4:      	lsl	x3, x1, #2
    eeb8:      	str	x4, [sp, #0x78]
    eebc:      	ldr	x4, [x21, #0x78]
    eec0:      	add	x3, x3, x4
    eec4:      	ldr	w3, [x3]
    eec8:      	sxtw	x3, w3
    eecc:      	cmp	x3, #0x0
    eed0:      	cset	w3, ge
    eed4:      	ubfx	x3, x3, #0, #8
    eed8:      	b	0xecfc <_stogir.vector-arithmetic.operands+0x134>
    eedc:      	cmp	x1, #0x0
    eee0:      	b.ge	0xf2a0 <_stogir.vector-arithmetic.operands+0x6d8>
    eee4:      	ldr	x4, [x5, #0x8]
    eee8:      	str	x5, [sp, #0x80]
    eeec:      	ldr	x5, [x6, #0x8]
    eef0:      	cmp	x4, x5
    eef4:      	b.ne	0xed00 <_stogir.vector-arithmetic.operands+0x138>
    eef8:      	cmp	x3, x4
    eefc:      	b.gt	0xecf0 <_stogir.vector-arithmetic.operands+0x128>
    ef00:      	lsl	x3, x9, #2
    ef04:      	ldr	x4, [x21, #0x50]
    ef08:      	add	x3, x3, x4
    ef0c:      	ldr	w3, [x3]
    ef10:      	sxtw	x3, w3
    ef14:      	cmp	x3, #0x0
    ef18:      	cset	w3, gt
    ef1c:      	ubfx	x3, x3, #0, #8
    ef20:      	b	0xecf4 <_stogir.vector-arithmetic.operands+0x12c>
    ef24:      	lsr	w1, w2, #0
    ef28:      	add	x16, sp, #0x10
    ef2c:      	str	x2, [x16]
    ef30:      	add	x16, sp, #0x10
    ef34:      	str	x3, [x16, #0x8]
    ef38:      	ubfx	x1, x1, #8, #8
    ef3c:      	cmp	x1, x23
    ef40:      	b.eq	0xef80 <_stogir.vector-arithmetic.operands+0x3b8>
    ef44:      	cmp	x0, #0x1
    ef48:      	b.ne	0xedc8 <_stogir.vector-arithmetic.operands+0x200>
    ef4c:      	uxtb	w16, w7
    ef50:      	cmp	w16, wzr
    ef54:      	b.eq	0xedc8 <_stogir.vector-arithmetic.operands+0x200>
    ef58:      	uxtb	w16, w8
    ef5c:      	cmp	w16, wzr
    ef60:      	b.eq	0xedc8 <_stogir.vector-arithmetic.operands+0x200>
    ef64:      	add	x16, sp, #0x10
    ef68:      	ldr	w1, [x16]
    ef6c:      	ubfx	x1, x1, #8, #8
    ef70:      	cmp	x1, #0x1
    ef74:      	b.lt	0xedc8 <_stogir.vector-arithmetic.operands+0x200>
    ef78:      	cmp	x1, #0xb
    ef7c:      	b.gt	0xedc8 <_stogir.vector-arithmetic.operands+0x200>
    ef80:      	add	x16, sp, #0x10
    ef84:      	ldr	w1, [x16]
    ef88:      	uxtb	w1, w1
    ef8c:      	cmp	x1, #0x48
    ef90:      	b.eq	0xedc8 <_stogir.vector-arithmetic.operands+0x200>
    ef94:      	cmp	x1, #0x46
    ef98:      	b.eq	0xedc8 <_stogir.vector-arithmetic.operands+0x200>
    ef9c:      	mov	x1, x27
    efa0:      	mov	x2, x28
    efa4:      	b	0xedd0 <_stogir.vector-arithmetic.operands+0x208>
    efa8:      	uxtb	w16, w11
    efac:      	cmp	w16, wzr
    efb0:      	b.eq	0xefbc <_stogir.vector-arithmetic.operands+0x3f4>
    efb4:      	mov	x28, #0x1               ; =1
    efb8:      	b	0xee14 <_stogir.vector-arithmetic.operands+0x24c>
    efbc:      	uxtb	w16, w12
    efc0:      	cmp	w16, wzr
    efc4:      	b.eq	0xefec <_stogir.vector-arithmetic.operands+0x424>
    efc8:      	mov	x28, #0x1               ; =1
    efcc:      	b	0xee14 <_stogir.vector-arithmetic.operands+0x24c>
    efd0:      	sxtw	x24, w26
    efd4:      	cmp	x24, #0x0
    efd8:      	b.ne	0xf000 <_stogir.vector-arithmetic.operands+0x438>
    efdc:      	mov	x1, x27
    efe0:      	mov	x2, x28
    efe4:      	movz	x0, #0x0, lsl #48
    efe8:      	b	0xf00c <_stogir.vector-arithmetic.operands+0x444>
    efec:      	uxtb	w16, w13
    eff0:      	cmp	w16, wzr
    eff4:      	b.eq	0xf0f4 <_stogir.vector-arithmetic.operands+0x52c>
    eff8:      	mov	x28, #0x1               ; =1
    effc:      	b	0xee14 <_stogir.vector-arithmetic.operands+0x24c>
    f000:      	mov	x1, x27
    f004:      	mov	x2, x28
    f008:      	mov	x0, #0x1                ; =1
    f00c:      	cmp	x0, #0x0
    f010:      	b.eq	0xf024 <_stogir.vector-arithmetic.operands+0x45c>
    f014:      	cmp	x22, #0x1d
    f018:      	b.ne	0xf164 <_stogir.vector-arithmetic.operands+0x59c>
    f01c:      	mov	x0, #0x1                ; =1
    f020:      	b	0xf170 <_stogir.vector-arithmetic.operands+0x5a8>
    f024:      	mov	x21, x1
    f028:      	mov	x22, x2
    f02c:      	cmp	x22, #0x0
    f030:      	b.ne	0xf060 <_stogir.vector-arithmetic.operands+0x498>
    f034:      	cmp	x22, #0x0
    f038:      	b.eq	0xf0e0 <_stogir.vector-arithmetic.operands+0x518>
    f03c:      	lsr	x0, x22, #0
    f040:      	mov	x1, x19
    f044:      	mov	x2, x0
    f048:      	mov	x0, x21
    f04c:      	bl	0xf04c <_stogir.vector-arithmetic.operands+0x484>
		000000000000f04c:  ARM64_RELOC_BRANCH26	_memcmp
    f050:      	lsr	w0, w0, #0
    f054:      	sxtw	x0, w0
    f058:      	cmp	x0, #0x0
    f05c:      	b.eq	0xf0e0 <_stogir.vector-arithmetic.operands+0x518>
    f060:      	mov	x1, x21
    f064:      	mov	x2, x22
    f068:      	mov	x0, #0x1                ; =1
    f06c:      	str	x0, [x20]
    f070:      	str	x1, [x20, #0x8]
    f074:      	str	x2, [x20, #0x10]
    f078:      	ldr	x19, [sp, #0x88]
    f07c:      	ldr	x20, [sp, #0x90]
    f080:      	ldr	x21, [sp, #0x98]
    f084:      	ldr	x22, [sp, #0xa0]
    f088:      	ldr	x23, [sp, #0xa8]
    f08c:      	ldr	x24, [sp, #0xb0]
    f090:      	ldr	x25, [sp, #0xb8]
    f094:      	ldr	x26, [sp, #0xc0]
    f098:      	ldr	x27, [sp, #0xc8]
    f09c:      	ldr	x28, [sp, #0xd0]
    f0a0:      	ldr	x29, [sp]
    f0a4:      	ldr	x30, [sp, #0x8]
    f0a8:      	add	sp, sp, #0xe0
    f0ac:      	ret
    f0b0:      	mov	x22, x1
    f0b4:      	mov	x25, x2
    f0b8:      	mov	x0, #0x1                ; =1
    f0bc:      	cmp	x0, #0x0
    f0c0:      	b.eq	0xf108 <_stogir.vector-arithmetic.operands+0x540>
    f0c4:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f0c4:  ARM64_RELOC_PAGE21	l_stogir.492
    f0c8:      	ldr	x16, [x16]
		000000000000f0c8:  ARM64_RELOC_PAGEOFF12	l_stogir.492
    f0cc:      	orr	x0, x16, xzr
    f0d0:      	mov	x1, #0x23               ; =35
    f0d4:      	mov	x21, x0
    f0d8:      	mov	x22, x1
    f0dc:      	b	0xf02c <_stogir.vector-arithmetic.operands+0x464>
    f0e0:      	and	x0, x23, #0xffffffff
    f0e4:      	mov	x1, x0
    f0e8:      	movz	x0, #0x0, lsl #48
    f0ec:      	movz	x2, #0x0, lsl #48
    f0f0:      	b	0xf06c <_stogir.vector-arithmetic.operands+0x4a4>
    f0f4:      	uxtb	w16, w14
    f0f8:      	cmp	w16, wzr
    f0fc:      	b.eq	0xee10 <_stogir.vector-arithmetic.operands+0x248>
    f100:      	mov	x28, #0x1               ; =1
    f104:      	b	0xee14 <_stogir.vector-arithmetic.operands+0x24c>
    f108:      	lsr	w26, w26, #0
    f10c:      	add	x8, sp, #0x20
    f110:      	mov	x0, x21
    f114:      	mov	w1, w26
    f118:      	bl	0xf118 <_stogir.vector-arithmetic.operands+0x550>
		000000000000f118:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    f11c:      	add	x16, sp, #0x20
    f120:      	ldr	w0, [x16]
    f124:      	lsr	x16, x0, #0
    f128:      	cmp	x16, #0x1
    f12c:      	b.eq	0xf148 <_stogir.vector-arithmetic.operands+0x580>
    f130:      	b.lo	0xf138 <_stogir.vector-arithmetic.operands+0x570>
    f134:      	b	0xf14c <_stogir.vector-arithmetic.operands+0x584>
    f138:      	cmp	x16, #0x0
    f13c:      	b.eq	0xf144 <_stogir.vector-arithmetic.operands+0x57c>
    f140:      	b	0xf14c <_stogir.vector-arithmetic.operands+0x584>
    f144:      	b	0xf150 <_stogir.vector-arithmetic.operands+0x588>
    f148:      	b	0xf19c <_stogir.vector-arithmetic.operands+0x5d4>
    f14c:      	b	0xf280 <_stogir.vector-arithmetic.operands+0x6b8>
    f150:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f150:  ARM64_RELOC_PAGE21	l_stogir.493
    f154:      	ldr	x16, [x16]
		000000000000f154:  ARM64_RELOC_PAGEOFF12	l_stogir.493
    f158:      	orr	x0, x16, xzr
    f15c:      	mov	x1, #0x1d               ; =29
    f160:      	b	0xf190 <_stogir.vector-arithmetic.operands+0x5c8>
    f164:      	cmp	x22, #0x1e
    f168:      	cset	w0, eq
    f16c:      	ubfx	x0, x0, #0, #8
    f170:      	cmp	x0, #0x0
    f174:      	b.eq	0xf0b0 <_stogir.vector-arithmetic.operands+0x4e8>
    f178:      	mov	x22, x1
    f17c:      	mov	x25, x2
    f180:      	movz	x0, #0x0, lsl #48
    f184:      	b	0xf0bc <_stogir.vector-arithmetic.operands+0x4f4>
    f188:      	mov	x0, x1
    f18c:      	mov	x1, x2
    f190:      	b	0xf0d4 <_stogir.vector-arithmetic.operands+0x50c>
    f194:      	brk	#0
    f198:      	b	0xf194 <_stogir.vector-arithmetic.operands+0x5cc>
    f19c:      	add	x16, sp, #0x20
    f1a0:      	orr	x0, x16, xzr
    f1a4:      	add	x0, x0, #0x8
    f1a8:      	add	x16, sp, #0x20
    f1ac:      	ldr	x1, [x16, #0x8]
    f1b0:      	add	x16, sp, #0x50
    f1b4:      	str	x1, [x16]
    f1b8:      	ldr	x0, [x0, #0x8]
    f1bc:      	add	x16, sp, #0x50
    f1c0:      	str	x0, [x16, #0x8]
    f1c4:      	cmp	x24, #0x0
    f1c8:      	b.gt	0xf204 <_stogir.vector-arithmetic.operands+0x63c>
    f1cc:      	mov	x1, x22
    f1d0:      	mov	x2, x25
    f1d4:      	mov	x0, #0x1                ; =1
    f1d8:      	b	0xf1e8 <_stogir.vector-arithmetic.operands+0x620>
    f1dc:      	movz	x0, #0x0, lsl #48
    f1e0:      	mov	x1, x22
    f1e4:      	mov	x2, x25
    f1e8:      	cmp	x0, #0x0
    f1ec:      	b.eq	0xf188 <_stogir.vector-arithmetic.operands+0x5c0>
    f1f0:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f1f0:  ARM64_RELOC_PAGE21	l_stogir.494
    f1f4:      	ldr	x16, [x16]
		000000000000f1f4:  ARM64_RELOC_PAGEOFF12	l_stogir.494
    f1f8:      	orr	x0, x16, xzr
    f1fc:      	mov	x1, #0x34               ; =52
    f200:      	b	0xf190 <_stogir.vector-arithmetic.operands+0x5c8>
    f204:      	add	x16, sp, #0x50
    f208:      	ldr	w0, [x16]
    f20c:      	uxtb	w0, w0
    f210:      	cmp	x0, #0x83
    f214:      	b.ge	0xf230 <_stogir.vector-arithmetic.operands+0x668>
    f218:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f218:  ARM64_RELOC_PAGE21	l_stogir.495
    f21c:      	ldr	x16, [x16]
		000000000000f21c:  ARM64_RELOC_PAGEOFF12	l_stogir.495
    f220:      	orr	x1, x16, xzr
    f224:      	add	x0, x0, x1
    f228:      	ldrb	w0, [x0]
    f22c:      	b	0xf234 <_stogir.vector-arithmetic.operands+0x66c>
    f230:      	movz	x0, #0x0, lsl #48
    f234:      	uxtb	w0, w0
    f238:      	and	x0, x0, #0x2
    f23c:      	uxtb	w0, w0
    f240:      	cmp	x0, #0x0
    f244:      	cset	w0, eq
    f248:      	uxtb	w16, w0
    f24c:      	cmp	w16, wzr
    f250:      	cset	x0, eq
    f254:      	cmp	x0, #0x0
    f258:      	b.ne	0xf1dc <_stogir.vector-arithmetic.operands+0x614>
    f25c:      	add	x16, sp, #0x50
    f260:      	ldr	w0, [x16]
    f264:      	uxtb	w0, w0
    f268:      	cmp	x0, #0x65
    f26c:      	b.eq	0xf1dc <_stogir.vector-arithmetic.operands+0x614>
    f270:      	cmp	x0, #0x66
    f274:      	b.eq	0xf1dc <_stogir.vector-arithmetic.operands+0x614>
    f278:      	mov	x0, #0x1                ; =1
    f27c:      	b	0xf1e0 <_stogir.vector-arithmetic.operands+0x618>
    f280:      	brk	#0
    f284:      	b	0xf280 <_stogir.vector-arithmetic.operands+0x6b8>
    f288:      	str	x4, [sp, #0x78]
    f28c:      	b	0xeedc <_stogir.vector-arithmetic.operands+0x314>
    f290:      	str	x4, [sp, #0x78]
    f294:      	b	0xed08 <_stogir.vector-arithmetic.operands+0x140>
    f298:      	str	x4, [sp, #0x78]
    f29c:      	b	0xecf8 <_stogir.vector-arithmetic.operands+0x130>
    f2a0:      	str	x5, [sp, #0x80]
    f2a4:      	b	0xed14 <_stogir.vector-arithmetic.operands+0x14c>

000000000000f2a8 <_stogir.types.base-type>:
    f2a8:      	sub	sp, sp, #0x20
    f2ac:      	str	x29, [sp]
    f2b0:      	str	x30, [sp, #0x8]
    f2b4:      	mov	x29, sp
    f2b8:      	str	x19, [sp, #0x10]
    f2bc:      	lsr	w0, w0, #0
    f2c0:      	mov	w19, w0
    f2c4:      	bl	0xf2c4 <_stogir.types.base-type+0x1c>
		000000000000f2c4:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    f2c8:      	cmp	x0, #0x0
    f2cc:      	b.eq	0xf2e4 <_stogir.types.base-type+0x3c>
    f2d0:      	sxtw	x19, w19
    f2d4:      	and	x0, x19, #0xf
    f2d8:      	lsr	w0, w0, #0
    f2dc:      	sxtw	x0, w0
    f2e0:      	b	0xf2e8 <_stogir.types.base-type+0x40>
    f2e4:      	movn	x0, #0x0, lsl #48
    f2e8:      	ldr	x19, [sp, #0x10]
    f2ec:      	ldr	x29, [sp]
    f2f0:      	ldr	x30, [sp, #0x8]
    f2f4:      	add	sp, sp, #0x20
    f2f8:      	ret

000000000000f2fc <_stogir.types.lanes>:
    f2fc:      	sxtw	x0, w0
    f300:      	cmp	x0, #0xf
    f304:      	b.le	0xf354 <_stogir.types.lanes+0x58>
    f308:      	cmp	x0, #0x80
    f30c:      	b.ge	0xf354 <_stogir.types.lanes+0x58>
    f310:      	and	x1, x0, #0xf
    f314:      	lsr	w1, w1, #0
    f318:      	sxtw	x1, w1
    f31c:      	cmp	x1, #0x1
    f320:      	b.lt	0xf354 <_stogir.types.lanes+0x58>
    f324:      	cmp	x1, #0xd
    f328:      	b.gt	0xf354 <_stogir.types.lanes+0x58>
    f32c:      	ubfx	x0, x0, #4, #32
    f330:      	sxtw	x0, w0
    f334:      	sub	x0, x0, #0x1
    f338:      	lsr	w0, w0, #0
    f33c:      	sxtw	x0, w0
    f340:      	mov	x16, #0x1               ; =1
    f344:      	lsl	x0, x16, x0
    f348:      	lsr	w0, w0, #0
    f34c:      	sxtw	x0, w0
    f350:      	b	0xf380 <_stogir.types.lanes+0x84>
    f354:      	cmp	x0, #0x0
    f358:      	b.lt	0xf37c <_stogir.types.lanes+0x80>
    f35c:      	cmp	x0, #0xd
    f360:      	b.gt	0xf37c <_stogir.types.lanes+0x80>
    f364:      	cmp	x0, #0x0
    f368:      	cset	w0, eq
    f36c:      	uxtb	w16, w0
    f370:      	cmp	w16, wzr
    f374:      	cset	x0, eq
    f378:      	b	0xf380 <_stogir.types.lanes+0x84>
    f37c:      	movn	x0, #0x0, lsl #48
    f380:      	ret

000000000000f384 <_coil.core.Get$slice$get__u8>:
    f384:      	lsr	x1, x2, #0
    f388:      	add	x0, x1, x0
    f38c:      	ldrb	w0, [x0]
    f390:      	ret

000000000000f394 <_stogir.checked.valid-type?>:
    f394:      	sxtw	x0, w0
    f398:      	cmp	x0, #0x1
    f39c:      	b.lt	0xf3c0 <_stogir.checked.valid-type?+0x2c>
    f3a0:      	cmp	x0, #0xb
    f3a4:      	b.gt	0xf3c0 <_stogir.checked.valid-type?+0x2c>
    f3a8:      	cmp	x0, #0x1
    f3ac:      	cset	w0, eq
    f3b0:      	uxtb	w16, w0
    f3b4:      	cmp	w16, wzr
    f3b8:      	cset	x0, eq
    f3bc:      	b	0xf3c4 <_stogir.checked.valid-type?+0x30>
    f3c0:      	movz	x0, #0x0, lsl #48
    f3c4:      	ret

000000000000f3c8 <_coil.core.Iterable$slice$iter__i32>:
    f3c8:      	str	x0, [x8]
    f3cc:      	str	x1, [x8, #0x8]
    f3d0:      	movz	x17, #0x0, lsl #48
    f3d4:      	str	x17, [x8, #0x10]
    f3d8:      	ret

000000000000f3dc <_coil.core.Iterator$coil.slice.SliceIter$next__i32>:
    f3dc:      	sub	sp, sp, #0x10
    f3e0:      	mov	x1, sp
    f3e4:      	ldr	x2, [x0, #0x10]
    f3e8:      	ldr	x3, [x0]
    f3ec:      	ldr	x4, [x0, #0x8]
    f3f0:      	cmp	x2, x4
    f3f4:      	b.ge	0xf420 <_coil.core.Iterator$coil.slice.SliceIter$next__i32+0x44>
    f3f8:      	add	x4, x2, #0x1
    f3fc:      	lsl	x2, x2, #2
    f400:      	add	x2, x2, x3
    f404:      	str	x4, [x0, #0x10]
    f408:      	ldr	w0, [x2]
    f40c:      	sxtw	x0, w0
    f410:      	and	x0, x0, #0xffffffff
    f414:      	mov	x2, x0
    f418:      	mov	x0, #0x1                ; =1
    f41c:      	b	0xf428 <_coil.core.Iterator$coil.slice.SliceIter$next__i32+0x4c>
    f420:      	movz	x0, #0x0, lsl #48
    f424:      	movz	x2, #0x0, lsl #48
    f428:      	str	x0, [x1]
    f42c:      	str	x2, [x1, #0x8]
    f430:      	ldr	x0, [sp]
    f434:      	ldr	x1, [sp, #0x8]
    f438:      	add	sp, sp, #0x10
    f43c:      	ret

000000000000f440 <_stogir.terminal.previous-input>:
    f440:      	sxtw	x1, w1
    f444:      	cmp	x1, #0x0
    f448:      	b.ne	0xf468 <_stogir.terminal.previous-input+0x28>
    f44c:      	movz	x0, #0x0, lsl #48
    f450:      	movz	x1, #0x0, lsl #48
    f454:      	movz	x2, #0x0, lsl #48
    f458:      	str	x0, [x8]
    f45c:      	str	x1, [x8, #0x8]
    f460:      	str	x2, [x8, #0x10]
    f464:      	ret
    f468:      	cmp	x1, #0x0
    f46c:      	cset	w2, gt
    f470:      	movz	x16, #0x0, lsl #48
    f474:      	sub	x3, x16, x1
    f478:      	sub	x4, x3, #0x1
    f47c:      	uxtb	w16, w2
    f480:      	cmp	w16, wzr
    f484:      	b.eq	0xf4e4 <_stogir.terminal.previous-input+0xa4>
    f488:      	ldr	x3, [x0, #0x8]
    f48c:      	cmp	x1, x3
    f490:      	b.ge	0xf530 <_stogir.terminal.previous-input+0xf0>
    f494:      	add	x3, x0, #0x78
    f498:      	ldr	x3, [x3, #0x8]
    f49c:      	cmp	x1, x3
    f4a0:      	b.ge	0xf608 <_stogir.terminal.previous-input+0x1c8>
    f4a4:      	lsl	x3, x1, #2
    f4a8:      	ldr	x5, [x0, #0x78]
    f4ac:      	add	x3, x3, x5
    f4b0:      	ldr	w3, [x3]
    f4b4:      	sxtw	x3, w3
    f4b8:      	cmp	x3, #0x0
    f4bc:      	cset	w3, ge
    f4c0:      	ubfx	x3, x3, #0, #8
    f4c4:      	b	0xf60c <_stogir.terminal.previous-input+0x1cc>
    f4c8:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f4c8:  ARM64_RELOC_PAGE21	l_stogir.496
    f4cc:      	ldr	x16, [x16]
		000000000000f4cc:  ARM64_RELOC_PAGEOFF12	l_stogir.496
    f4d0:      	orr	x0, x16, xzr
    f4d4:      	mov	x1, x0
    f4d8:      	mov	x0, #0x1                ; =1
    f4dc:      	mov	x2, #0x2e               ; =46
    f4e0:      	b	0xf458 <_stogir.terminal.previous-input+0x18>
    f4e4:      	cmp	x1, #0x0
    f4e8:      	b.ge	0xf538 <_stogir.terminal.previous-input+0xf8>
    f4ec:      	add	x5, x0, #0x28
    f4f0:      	add	x6, x0, #0x50
    f4f4:      	ldr	x5, [x5, #0x8]
    f4f8:      	ldr	x6, [x6, #0x8]
    f4fc:      	cmp	x5, x6
    f500:      	b.ne	0xf600 <_stogir.terminal.previous-input+0x1c0>
    f504:      	cmp	x3, x5
    f508:      	b.gt	0xf610 <_stogir.terminal.previous-input+0x1d0>
    f50c:      	lsl	x3, x4, #2
    f510:      	ldr	x5, [x0, #0x50]
    f514:      	add	x3, x3, x5
    f518:      	ldr	w3, [x3]
    f51c:      	sxtw	x3, w3
    f520:      	cmp	x3, #0x0
    f524:      	cset	w3, gt
    f528:      	ubfx	x3, x3, #0, #8
    f52c:      	b	0xf614 <_stogir.terminal.previous-input+0x1d4>
    f530:      	movz	x3, #0x0, lsl #48
    f534:      	b	0xf53c <_stogir.terminal.previous-input+0xfc>
    f538:      	movz	x3, #0x0, lsl #48
    f53c:      	cmp	x3, #0x0
    f540:      	b.eq	0xf580 <_stogir.terminal.previous-input+0x140>
    f544:      	uxtb	w16, w2
    f548:      	cmp	w16, wzr
    f54c:      	b.eq	0xf564 <_stogir.terminal.previous-input+0x124>
    f550:      	lsl	x2, x1, #4
    f554:      	ldr	x0, [x0]
    f558:      	add	x0, x2, x0
    f55c:      	ldr	x0, [x0]
    f560:      	b	0xf574 <_stogir.terminal.previous-input+0x134>
    f564:      	lsl	x2, x4, #4
    f568:      	ldr	x0, [x0, #0x28]
    f56c:      	add	x0, x2, x0
    f570:      	ldr	x0, [x0]
    f574:      	mov	x2, x0
    f578:      	mov	x0, #0x1                ; =1
    f57c:      	b	0xf588 <_stogir.terminal.previous-input+0x148>
    f580:      	movz	x0, #0x0, lsl #48
    f584:      	movz	x2, #0x0, lsl #48
    f588:      	lsr	w0, w0, #0
    f58c:      	lsr	x16, x0, #0
    f590:      	cmp	x16, #0x1
    f594:      	b.eq	0xf5b0 <_stogir.terminal.previous-input+0x170>
    f598:      	b.lo	0xf5a0 <_stogir.terminal.previous-input+0x160>
    f59c:      	b	0xf5b4 <_stogir.terminal.previous-input+0x174>
    f5a0:      	cmp	x16, #0x0
    f5a4:      	b.eq	0xf5ac <_stogir.terminal.previous-input+0x16c>
    f5a8:      	b	0xf5b4 <_stogir.terminal.previous-input+0x174>
    f5ac:      	b	0xf5b8 <_stogir.terminal.previous-input+0x178>
    f5b0:      	b	0xf5d4 <_stogir.terminal.previous-input+0x194>
    f5b4:      	b	0xf658 <_stogir.terminal.previous-input+0x218>
    f5b8:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f5b8:  ARM64_RELOC_PAGE21	l_stogir.497
    f5bc:      	ldr	x16, [x16]
		000000000000f5bc:  ARM64_RELOC_PAGEOFF12	l_stogir.497
    f5c0:      	orr	x0, x16, xzr
    f5c4:      	mov	x1, x0
    f5c8:      	mov	x0, #0x1                ; =1
    f5cc:      	mov	x2, #0x1d               ; =29
    f5d0:      	b	0xf4e0 <_stogir.terminal.previous-input+0xa0>
    f5d4:      	cmp	x1, #0x0
    f5d8:      	b.le	0xf4c8 <_stogir.terminal.previous-input+0x88>
    f5dc:      	uxtb	w2, w2
    f5e0:      	cmp	x2, #0x83
    f5e4:      	b.ge	0xf618 <_stogir.terminal.previous-input+0x1d8>
    f5e8:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f5e8:  ARM64_RELOC_PAGE21	l_stogir.498
    f5ec:      	ldr	x16, [x16]
		000000000000f5ec:  ARM64_RELOC_PAGEOFF12	l_stogir.498
    f5f0:      	orr	x0, x16, xzr
    f5f4:      	add	x0, x2, x0
    f5f8:      	ldrb	w0, [x0]
    f5fc:      	b	0xf61c <_stogir.terminal.previous-input+0x1dc>
    f600:      	movz	x3, #0x0, lsl #48
    f604:      	b	0xf53c <_stogir.terminal.previous-input+0xfc>
    f608:      	movz	x3, #0x0, lsl #48
    f60c:      	b	0xf534 <_stogir.terminal.previous-input+0xf4>
    f610:      	movz	x3, #0x0, lsl #48
    f614:      	b	0xf604 <_stogir.terminal.previous-input+0x1c4>
    f618:      	movz	x0, #0x0, lsl #48
    f61c:      	uxtb	w0, w0
    f620:      	and	x0, x0, #0x8
    f624:      	uxtb	w0, w0
    f628:      	cmp	x0, #0x0
    f62c:      	cset	w0, eq
    f630:      	uxtb	w16, w0
    f634:      	cmp	w16, wzr
    f638:      	cset	x0, eq
    f63c:      	cmp	x0, #0x0
    f640:      	b.eq	0xf4c8 <_stogir.terminal.previous-input+0x88>
    f644:      	and	x0, x1, #0xffffffff
    f648:      	mov	x1, x0
    f64c:      	movz	x0, #0x0, lsl #48
    f650:      	movz	x2, #0x0, lsl #48
    f654:      	b	0xf4e0 <_stogir.terminal.previous-input+0xa0>
    f658:      	brk	#0
    f65c:      	b	0xf658 <_stogir.terminal.previous-input+0x218>

000000000000f660 <_stogir.switch.selector-type>:
    f660:      	sxtw	x1, w1
    f664:      	cmp	x1, #0x0
    f668:      	cset	w2, gt
    f66c:      	movz	x16, #0x0, lsl #48
    f670:      	sub	x3, x16, x1
    f674:      	sub	x4, x3, #0x1
    f678:      	uxtb	w16, w2
    f67c:      	cmp	w16, wzr
    f680:      	b.eq	0xf6c4 <_stogir.switch.selector-type+0x64>
    f684:      	ldr	x3, [x0, #0x8]
    f688:      	cmp	x1, x3
    f68c:      	b.ge	0xf718 <_stogir.switch.selector-type+0xb8>
    f690:      	add	x3, x0, #0x78
    f694:      	ldr	x3, [x3, #0x8]
    f698:      	cmp	x1, x3
    f69c:      	b.ge	0xf81c <_stogir.switch.selector-type+0x1bc>
    f6a0:      	lsl	x3, x1, #2
    f6a4:      	ldr	x5, [x0, #0x78]
    f6a8:      	add	x3, x3, x5
    f6ac:      	ldr	w3, [x3]
    f6b0:      	sxtw	x3, w3
    f6b4:      	cmp	x3, #0x0
    f6b8:      	cset	w3, ge
    f6bc:      	ubfx	x3, x3, #0, #8
    f6c0:      	b	0xf820 <_stogir.switch.selector-type+0x1c0>
    f6c4:      	cmp	x1, #0x0
    f6c8:      	b.ge	0xf720 <_stogir.switch.selector-type+0xc0>
    f6cc:      	add	x5, x0, #0x28
    f6d0:      	add	x6, x0, #0x50
    f6d4:      	ldr	x5, [x5, #0x8]
    f6d8:      	ldr	x6, [x6, #0x8]
    f6dc:      	cmp	x5, x6
    f6e0:      	b.ne	0xf710 <_stogir.switch.selector-type+0xb0>
    f6e4:      	cmp	x3, x5
    f6e8:      	b.gt	0xf824 <_stogir.switch.selector-type+0x1c4>
    f6ec:      	lsl	x3, x4, #2
    f6f0:      	ldr	x5, [x0, #0x50]
    f6f4:      	add	x3, x3, x5
    f6f8:      	ldr	w3, [x3]
    f6fc:      	sxtw	x3, w3
    f700:      	cmp	x3, #0x0
    f704:      	cset	w3, gt
    f708:      	ubfx	x3, x3, #0, #8
    f70c:      	b	0xf828 <_stogir.switch.selector-type+0x1c8>
    f710:      	movz	x3, #0x0, lsl #48
    f714:      	b	0xf724 <_stogir.switch.selector-type+0xc4>
    f718:      	movz	x3, #0x0, lsl #48
    f71c:      	b	0xf724 <_stogir.switch.selector-type+0xc4>
    f720:      	movz	x3, #0x0, lsl #48
    f724:      	cmp	x3, #0x0
    f728:      	b.eq	0xf768 <_stogir.switch.selector-type+0x108>
    f72c:      	uxtb	w16, w2
    f730:      	cmp	w16, wzr
    f734:      	b.eq	0xf74c <_stogir.switch.selector-type+0xec>
    f738:      	lsl	x1, x1, #4
    f73c:      	ldr	x0, [x0]
    f740:      	add	x0, x1, x0
    f744:      	ldr	x0, [x0]
    f748:      	b	0xf75c <_stogir.switch.selector-type+0xfc>
    f74c:      	lsl	x1, x4, #4
    f750:      	ldr	x0, [x0, #0x28]
    f754:      	add	x0, x1, x0
    f758:      	ldr	x0, [x0]
    f75c:      	mov	x1, x0
    f760:      	mov	x0, #0x1                ; =1
    f764:      	b	0xf770 <_stogir.switch.selector-type+0x110>
    f768:      	movz	x0, #0x0, lsl #48
    f76c:      	movz	x1, #0x0, lsl #48
    f770:      	lsr	w0, w0, #0
    f774:      	lsr	x16, x0, #0
    f778:      	cmp	x16, #0x1
    f77c:      	b.eq	0xf798 <_stogir.switch.selector-type+0x138>
    f780:      	b.lo	0xf788 <_stogir.switch.selector-type+0x128>
    f784:      	b	0xf79c <_stogir.switch.selector-type+0x13c>
    f788:      	cmp	x16, #0x0
    f78c:      	b.eq	0xf794 <_stogir.switch.selector-type+0x134>
    f790:      	b	0xf79c <_stogir.switch.selector-type+0x13c>
    f794:      	b	0xf7a0 <_stogir.switch.selector-type+0x140>
    f798:      	b	0xf7e4 <_stogir.switch.selector-type+0x184>
    f79c:      	b	0xf82c <_stogir.switch.selector-type+0x1cc>
    f7a0:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f7a0:  ARM64_RELOC_PAGE21	l_stogir.499
    f7a4:      	ldr	x16, [x16]
		000000000000f7a4:  ARM64_RELOC_PAGEOFF12	l_stogir.499
    f7a8:      	orr	x0, x16, xzr
    f7ac:      	mov	x1, x0
    f7b0:      	mov	x0, #0x1                ; =1
    f7b4:      	mov	x2, #0x17               ; =23
    f7b8:      	b	0xf7d4 <_stogir.switch.selector-type+0x174>
    f7bc:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f7bc:  ARM64_RELOC_PAGE21	l_stogir.500
    f7c0:      	ldr	x16, [x16]
		000000000000f7c0:  ARM64_RELOC_PAGEOFF12	l_stogir.500
    f7c4:      	orr	x0, x16, xzr
    f7c8:      	mov	x1, x0
    f7cc:      	mov	x0, #0x1                ; =1
    f7d0:      	mov	x2, #0x20               ; =32
    f7d4:      	str	x0, [x8]
    f7d8:      	str	x1, [x8, #0x8]
    f7dc:      	str	x2, [x8, #0x10]
    f7e0:      	ret
    f7e4:      	lsr	w0, w1, #0
    f7e8:      	ubfx	x0, x0, #8, #8
    f7ec:      	cmp	x0, #0x1
    f7f0:      	b.lt	0xf7bc <_stogir.switch.selector-type+0x15c>
    f7f4:      	cmp	x0, #0xb
    f7f8:      	b.gt	0xf7bc <_stogir.switch.selector-type+0x15c>
    f7fc:      	uxtb	w1, w1
    f800:      	cmp	x1, #0x48
    f804:      	b.eq	0xf7bc <_stogir.switch.selector-type+0x15c>
    f808:      	and	x0, x0, #0xffffffff
    f80c:      	mov	x1, x0
    f810:      	movz	x0, #0x0, lsl #48
    f814:      	movz	x2, #0x0, lsl #48
    f818:      	b	0xf7d4 <_stogir.switch.selector-type+0x174>
    f81c:      	movz	x3, #0x0, lsl #48
    f820:      	b	0xf71c <_stogir.switch.selector-type+0xbc>
    f824:      	movz	x3, #0x0, lsl #48
    f828:      	b	0xf714 <_stogir.switch.selector-type+0xb4>
    f82c:      	brk	#0
    f830:      	b	0xf82c <_stogir.switch.selector-type+0x1cc>

000000000000f834 <_stogir.switch.key>:
    f834:      	sub	sp, sp, #0x40
    f838:      	str	x19, [sp, #0x10]
    f83c:      	str	x20, [sp, #0x18]
    f840:      	str	x21, [sp, #0x20]
    f844:      	str	x22, [sp, #0x28]
    f848:      	str	x23, [sp, #0x30]
    f84c:      	sxtw	x2, w2
    f850:      	cmp	x2, #0x1
    f854:      	b.lt	0xf8d0 <_stogir.switch.key+0x9c>
    f858:      	cmp	x2, #0xb
    f85c:      	cset	w3, le
    f860:      	uxtb	w16, w3
    f864:      	cmp	w16, wzr
    f868:      	b.eq	0xf8d0 <_stogir.switch.key+0x9c>
    f86c:      	sxtw	x1, w1
    f870:      	cmp	x1, #0x0
    f874:      	cset	w4, gt
    f878:      	movz	x16, #0x0, lsl #48
    f87c:      	sub	x5, x16, x1
    f880:      	sub	x6, x5, #0x1
    f884:      	uxtb	w16, w4
    f888:      	cmp	w16, wzr
    f88c:      	b.eq	0xf958 <_stogir.switch.key+0x124>
    f890:      	ldr	x5, [x0, #0x8]
    f894:      	cmp	x1, x5
    f898:      	b.ge	0xf9a4 <_stogir.switch.key+0x170>
    f89c:      	add	x5, x0, #0x78
    f8a0:      	ldr	x5, [x5, #0x8]
    f8a4:      	cmp	x1, x5
    f8a8:      	b.ge	0xfb20 <_stogir.switch.key+0x2ec>
    f8ac:      	lsl	x5, x1, #2
    f8b0:      	ldr	x7, [x0, #0x78]
    f8b4:      	add	x5, x5, x7
    f8b8:      	ldr	w5, [x5]
    f8bc:      	sxtw	x5, w5
    f8c0:      	cmp	x5, #0x0
    f8c4:      	cset	w5, ge
    f8c8:      	ubfx	x5, x5, #0, #8
    f8cc:      	b	0xfb24 <_stogir.switch.key+0x2f0>
    f8d0:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f8d0:  ARM64_RELOC_PAGE21	l_stogir.501
    f8d4:      	ldr	x16, [x16]
		000000000000f8d4:  ARM64_RELOC_PAGEOFF12	l_stogir.501
    f8d8:      	orr	x0, x16, xzr
    f8dc:      	mov	x1, x0
    f8e0:      	mov	x0, #0x1                ; =1
    f8e4:      	mov	x2, #0x24               ; =36
    f8e8:      	str	x0, [x8]
    f8ec:      	str	x1, [x8, #0x8]
    f8f0:      	str	x2, [x8, #0x10]
    f8f4:      	ldr	x19, [sp, #0x10]
    f8f8:      	ldr	x20, [sp, #0x18]
    f8fc:      	ldr	x21, [sp, #0x20]
    f900:      	ldr	x22, [sp, #0x28]
    f904:      	ldr	x23, [sp, #0x30]
    f908:      	add	sp, sp, #0x40
    f90c:      	ret
    f910:      	mov	x22, #0x1               ; =1
    f914:      	cmp	x1, #0x0
    f918:      	b.ge	0xf93c <_stogir.switch.key+0x108>
    f91c:      	mov	x16, sp
    f920:      	ldr	w1, [x16]
    f924:      	uxtb	w23, w1
    f928:      	ubfx	x1, x1, #8, #8
    f92c:      	cmp	x23, x1
    f930:      	b.eq	0xfbc8 <_stogir.switch.key+0x394>
    f934:      	cmp	x23, #0x49
    f938:      	b.eq	0xfbc8 <_stogir.switch.key+0x394>
    f93c:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000f93c:  ARM64_RELOC_PAGE21	l_stogir.502
    f940:      	ldr	x16, [x16]
		000000000000f940:  ARM64_RELOC_PAGEOFF12	l_stogir.502
    f944:      	orr	x0, x16, xzr
    f948:      	mov	x1, x0
    f94c:      	mov	x0, #0x1                ; =1
    f950:      	mov	x2, #0x30               ; =48
    f954:      	b	0xf8e8 <_stogir.switch.key+0xb4>
    f958:      	cmp	x1, #0x0
    f95c:      	b.ge	0xf9ac <_stogir.switch.key+0x178>
    f960:      	add	x7, x0, #0x28
    f964:      	add	x9, x0, #0x50
    f968:      	ldr	x7, [x7, #0x8]
    f96c:      	ldr	x9, [x9, #0x8]
    f970:      	cmp	x7, x9
    f974:      	b.ne	0xfb18 <_stogir.switch.key+0x2e4>
    f978:      	cmp	x5, x7
    f97c:      	b.gt	0xfbc0 <_stogir.switch.key+0x38c>
    f980:      	lsl	x5, x6, #2
    f984:      	ldr	x7, [x0, #0x50]
    f988:      	add	x5, x5, x7
    f98c:      	ldr	w5, [x5]
    f990:      	sxtw	x5, w5
    f994:      	cmp	x5, #0x0
    f998:      	cset	w5, gt
    f99c:      	ubfx	x5, x5, #0, #8
    f9a0:      	b	0xfbc4 <_stogir.switch.key+0x390>
    f9a4:      	movz	x5, #0x0, lsl #48
    f9a8:      	b	0xf9b0 <_stogir.switch.key+0x17c>
    f9ac:      	movz	x5, #0x0, lsl #48
    f9b0:      	cmp	x5, #0x0
    f9b4:      	b.eq	0xfa18 <_stogir.switch.key+0x1e4>
    f9b8:      	uxtb	w16, w4
    f9bc:      	cmp	w16, wzr
    f9c0:      	b.eq	0xf9e8 <_stogir.switch.key+0x1b4>
    f9c4:      	lsl	x4, x1, #4
    f9c8:      	ldr	x0, [x0]
    f9cc:      	add	x0, x4, x0
    f9d0:      	ldr	x4, [x0]
    f9d4:      	ldr	x0, [x0, #0x8]
    f9d8:      	fmov	d31, x0
    f9dc:      	mov	x0, x4
    f9e0:      	fmov	x4, d31
    f9e4:      	b	0xfa08 <_stogir.switch.key+0x1d4>
    f9e8:      	lsl	x4, x6, #4
    f9ec:      	ldr	x0, [x0, #0x28]
    f9f0:      	add	x0, x4, x0
    f9f4:      	ldr	x4, [x0]
    f9f8:      	ldr	x0, [x0, #0x8]
    f9fc:      	fmov	d31, x0
    fa00:      	mov	x0, x4
    fa04:      	fmov	x4, d31
    fa08:      	mov	x5, x4
    fa0c:      	mov	x4, x0
    fa10:      	mov	x0, #0x1                ; =1
    fa14:      	b	0xfa24 <_stogir.switch.key+0x1f0>
    fa18:      	movz	x0, #0x0, lsl #48
    fa1c:      	movz	x4, #0x0, lsl #48
    fa20:      	movz	x5, #0x0, lsl #48
    fa24:      	lsr	w0, w0, #0
    fa28:      	lsr	x16, x0, #0
    fa2c:      	cmp	x16, #0x1
    fa30:      	b.eq	0xfa4c <_stogir.switch.key+0x218>
    fa34:      	b.lo	0xfa3c <_stogir.switch.key+0x208>
    fa38:      	b	0xfa50 <_stogir.switch.key+0x21c>
    fa3c:      	cmp	x16, #0x0
    fa40:      	b.eq	0xfa48 <_stogir.switch.key+0x214>
    fa44:      	b	0xfa50 <_stogir.switch.key+0x21c>
    fa48:      	b	0xfa54 <_stogir.switch.key+0x220>
    fa4c:      	b	0xfa70 <_stogir.switch.key+0x23c>
    fa50:      	b	0xfc78 <_stogir.switch.key+0x444>
    fa54:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000fa54:  ARM64_RELOC_PAGE21	l_stogir.503
    fa58:      	ldr	x16, [x16]
		000000000000fa58:  ARM64_RELOC_PAGEOFF12	l_stogir.503
    fa5c:      	orr	x0, x16, xzr
    fa60:      	mov	x1, x0
    fa64:      	mov	x0, #0x1                ; =1
    fa68:      	mov	x2, #0x1c               ; =28
    fa6c:      	b	0xf954 <_stogir.switch.key+0x120>
    fa70:      	cmp	x2, #0x1
    fa74:      	cset	w0, eq
    fa78:      	cmp	x2, #0x0
    fa7c:      	cset	w6, eq
    fa80:      	cmp	x2, #0x2
    fa84:      	cset	w7, eq
    fa88:      	cmp	x2, #0x7
    fa8c:      	cset	w9, eq
    fa90:      	cmp	x2, #0x8
    fa94:      	cset	w10, eq
    fa98:      	cmp	x2, #0x3
    fa9c:      	cset	w11, eq
    faa0:      	cmp	x2, #0x9
    faa4:      	cset	w12, eq
    faa8:      	cmp	x2, #0x4
    faac:      	cset	w13, eq
    fab0:      	cmp	x2, #0xa
    fab4:      	cset	w14, eq
    fab8:      	cmp	x2, #0xd
    fabc:      	cset	w15, eq
    fac0:      	cmp	x2, #0x5
    fac4:      	cset	w19, eq
    fac8:      	cmp	x2, #0xb
    facc:      	cset	w20, eq
    fad0:      	cmp	x2, #0xc
    fad4:      	cset	w21, eq
    fad8:      	cmp	x2, #0x6
    fadc:      	cset	w22, eq
    fae0:      	mov	x16, sp
    fae4:      	str	x4, [x16]
    fae8:      	uxtb	w16, w22
    faec:      	cmp	w16, wzr
    faf0:      	mov	x16, #0x8               ; =8
    faf4:      	movn	x17, #0x0, lsl #48
    faf8:      	csel	x4, x16, x17, ne
    fafc:      	mov	x16, sp
    fb00:      	str	x5, [x16, #0x8]
    fb04:      	uxtb	w16, w6
    fb08:      	cmp	w16, wzr
    fb0c:      	b.eq	0xfb28 <_stogir.switch.key+0x2f4>
    fb10:      	movz	x22, #0x0, lsl #48
    fb14:      	b	0xf914 <_stogir.switch.key+0xe0>
    fb18:      	movz	x5, #0x0, lsl #48
    fb1c:      	b	0xf9b0 <_stogir.switch.key+0x17c>
    fb20:      	movz	x5, #0x0, lsl #48
    fb24:      	b	0xf9a8 <_stogir.switch.key+0x174>
    fb28:      	uxtb	w16, w0
    fb2c:      	cmp	w16, wzr
    fb30:      	b.ne	0xf910 <_stogir.switch.key+0xdc>
    fb34:      	uxtb	w16, w7
    fb38:      	cmp	w16, wzr
    fb3c:      	b.ne	0xf910 <_stogir.switch.key+0xdc>
    fb40:      	uxtb	w16, w9
    fb44:      	cmp	w16, wzr
    fb48:      	b.ne	0xf910 <_stogir.switch.key+0xdc>
    fb4c:      	uxtb	w16, w10
    fb50:      	cmp	w16, wzr
    fb54:      	b.ne	0xf910 <_stogir.switch.key+0xdc>
    fb58:      	uxtb	w16, w11
    fb5c:      	cmp	w16, wzr
    fb60:      	b.ne	0xfc70 <_stogir.switch.key+0x43c>
    fb64:      	uxtb	w16, w12
    fb68:      	cmp	w16, wzr
    fb6c:      	b.ne	0xfc70 <_stogir.switch.key+0x43c>
    fb70:      	uxtb	w16, w13
    fb74:      	cmp	w16, wzr
    fb78:      	b.ne	0xfd48 <_stogir.switch.key+0x514>
    fb7c:      	uxtb	w16, w14
    fb80:      	cmp	w16, wzr
    fb84:      	b.ne	0xfd48 <_stogir.switch.key+0x514>
    fb88:      	uxtb	w16, w15
    fb8c:      	cmp	w16, wzr
    fb90:      	b.ne	0xfd48 <_stogir.switch.key+0x514>
    fb94:      	uxtb	w16, w19
    fb98:      	cmp	w16, wzr
    fb9c:      	b.ne	0xfd50 <_stogir.switch.key+0x51c>
    fba0:      	uxtb	w16, w20
    fba4:      	cmp	w16, wzr
    fba8:      	b.ne	0xfd50 <_stogir.switch.key+0x51c>
    fbac:      	uxtb	w16, w21
    fbb0:      	cmp	w16, wzr
    fbb4:      	b.ne	0xfd50 <_stogir.switch.key+0x51c>
    fbb8:      	mov	x22, x4
    fbbc:      	b	0xfd54 <_stogir.switch.key+0x520>
    fbc0:      	movz	x5, #0x0, lsl #48
    fbc4:      	b	0xfb1c <_stogir.switch.key+0x2e8>
    fbc8:      	mov	x16, sp
    fbcc:      	ldr	w1, [x16]
    fbd0:      	ubfx	x1, x1, #8, #8
    fbd4:      	cmp	x1, x2
    fbd8:      	b.ne	0xf93c <_stogir.switch.key+0x108>
    fbdc:      	lsr	w22, w22, #0
    fbe0:      	lsr	w1, w5, #0
    fbe4:      	sxtw	x22, w22
    fbe8:      	ubfx	x1, x1, #0, #32
    fbec:      	lsr	x5, x5, #32
    fbf0:      	lsl	x22, x22, #3
    fbf4:      	ubfx	x5, x5, #0, #32
    fbf8:      	lsr	w22, w22, #0
    fbfc:      	lsl	x5, x5, #32
    fc00:      	sxtw	x22, w22
    fc04:      	orr	x1, x5, x1
    fc08:      	cmp	x22, #0x40
    fc0c:      	b.ge	0xfc1c <_stogir.switch.key+0x3e8>
    fc10:      	lsr	x5, x1, x22
    fc14:      	cmp	x5, #0x0
    fc18:      	b.ne	0xf93c <_stogir.switch.key+0x108>
    fc1c:      	uxtb	w16, w0
    fc20:      	cmp	w16, wzr
    fc24:      	b.eq	0xfc30 <_stogir.switch.key+0x3fc>
    fc28:      	cmp	x1, #0x1
    fc2c:      	b.hi	0xf93c <_stogir.switch.key+0x108>
    fc30:      	cmp	x2, #0x7
    fc34:      	b.lt	0xfc58 <_stogir.switch.key+0x424>
    fc38:      	uxtb	w16, w3
    fc3c:      	cmp	w16, wzr
    fc40:      	b.eq	0xfc58 <_stogir.switch.key+0x424>
    fc44:      	uxtb	w16, w6
    fc48:      	cmp	w16, wzr
    fc4c:      	b.eq	0xfcb0 <_stogir.switch.key+0x47c>
    fc50:      	movz	x0, #0x0, lsl #48
    fc54:      	b	0xfc84 <_stogir.switch.key+0x450>
    fc58:      	movz	x0, #0x0, lsl #48
    fc5c:      	eor	x0, x0, x1
    fc60:      	mov	x1, x0
    fc64:      	movz	x0, #0x0, lsl #48
    fc68:      	movz	x2, #0x0, lsl #48
    fc6c:      	b	0xf954 <_stogir.switch.key+0x120>
    fc70:      	mov	x22, #0x2               ; =2
    fc74:      	b	0xf914 <_stogir.switch.key+0xe0>
    fc78:      	brk	#0
    fc7c:      	b	0xfc78 <_stogir.switch.key+0x444>
    fc80:      	mov	x0, #0x1                ; =1
    fc84:      	lsr	w0, w0, #0
    fc88:      	sxtw	x0, w0
    fc8c:      	lsl	x0, x0, #3
    fc90:      	lsr	w0, w0, #0
    fc94:      	sxtw	x0, w0
    fc98:      	sub	x0, x0, #0x1
    fc9c:      	lsr	w0, w0, #0
    fca0:      	sxtw	x0, w0
    fca4:      	mov	x16, #0x1               ; =1
    fca8:      	lsl	x0, x16, x0
    fcac:      	b	0xfc5c <_stogir.switch.key+0x428>
    fcb0:      	uxtb	w16, w0
    fcb4:      	cmp	w16, wzr
    fcb8:      	b.ne	0xfc80 <_stogir.switch.key+0x44c>
    fcbc:      	uxtb	w16, w7
    fcc0:      	cmp	w16, wzr
    fcc4:      	b.ne	0xfc80 <_stogir.switch.key+0x44c>
    fcc8:      	uxtb	w16, w9
    fccc:      	cmp	w16, wzr
    fcd0:      	b.ne	0xfc80 <_stogir.switch.key+0x44c>
    fcd4:      	uxtb	w16, w10
    fcd8:      	cmp	w16, wzr
    fcdc:      	b.ne	0xfc80 <_stogir.switch.key+0x44c>
    fce0:      	uxtb	w16, w11
    fce4:      	cmp	w16, wzr
    fce8:      	b.ne	0xfd58 <_stogir.switch.key+0x524>
    fcec:      	uxtb	w16, w12
    fcf0:      	cmp	w16, wzr
    fcf4:      	b.ne	0xfd58 <_stogir.switch.key+0x524>
    fcf8:      	uxtb	w16, w13
    fcfc:      	cmp	w16, wzr
    fd00:      	b.ne	0xfd60 <_stogir.switch.key+0x52c>
    fd04:      	uxtb	w16, w14
    fd08:      	cmp	w16, wzr
    fd0c:      	b.ne	0xfd60 <_stogir.switch.key+0x52c>
    fd10:      	uxtb	w16, w15
    fd14:      	cmp	w16, wzr
    fd18:      	b.ne	0xfd60 <_stogir.switch.key+0x52c>
    fd1c:      	uxtb	w16, w19
    fd20:      	cmp	w16, wzr
    fd24:      	b.ne	0xfd68 <_stogir.switch.key+0x534>
    fd28:      	uxtb	w16, w20
    fd2c:      	cmp	w16, wzr
    fd30:      	b.ne	0xfd68 <_stogir.switch.key+0x534>
    fd34:      	uxtb	w16, w21
    fd38:      	cmp	w16, wzr
    fd3c:      	b.ne	0xfd68 <_stogir.switch.key+0x534>
    fd40:      	mov	x0, x4
    fd44:      	b	0xfd6c <_stogir.switch.key+0x538>
    fd48:      	mov	x22, #0x4               ; =4
    fd4c:      	b	0xfc74 <_stogir.switch.key+0x440>
    fd50:      	mov	x22, #0x8               ; =8
    fd54:      	b	0xfd4c <_stogir.switch.key+0x518>
    fd58:      	mov	x0, #0x2                ; =2
    fd5c:      	b	0xfc84 <_stogir.switch.key+0x450>
    fd60:      	mov	x0, #0x4                ; =4
    fd64:      	b	0xfd5c <_stogir.switch.key+0x528>
    fd68:      	mov	x0, #0x8                ; =8
    fd6c:      	b	0xfd64 <_stogir.switch.key+0x530>

000000000000fd70 <_stogir.frame.valid-alignment?>:
    fd70:      	cmp	x0, #0x0
    fd74:      	b.le	0xfd90 <_stogir.frame.valid-alignment?+0x20>
    fd78:      	sub	x1, x0, #0x1
    fd7c:      	and	x0, x1, x0
    fd80:      	cmp	x0, #0x0
    fd84:      	cset	w0, eq
    fd88:      	ubfx	x0, x0, #0, #8
    fd8c:      	b	0xfd94 <_stogir.frame.valid-alignment?+0x24>
    fd90:      	movz	x0, #0x0, lsl #48
    fd94:      	ret

000000000000fd98 <_stogir.stack.constant-size-aligned>:
    fd98:      	sub	sp, sp, #0x10
    fd9c:      	cmp	x2, #0x10
    fda0:      	b.lt	0xfe20 <_stogir.stack.constant-size-aligned+0x88>
    fda4:      	cmp	x2, #0x0
    fda8:      	b.le	0xfe20 <_stogir.stack.constant-size-aligned+0x88>
    fdac:      	sub	x3, x2, #0x1
    fdb0:      	and	x3, x3, x2
    fdb4:      	cmp	x3, #0x0
    fdb8:      	b.ne	0xfe20 <_stogir.stack.constant-size-aligned+0x88>
    fdbc:      	sxtw	x1, w1
    fdc0:      	cmp	x1, #0x0
    fdc4:      	cset	w3, gt
    fdc8:      	movz	x16, #0x0, lsl #48
    fdcc:      	sub	x4, x16, x1
    fdd0:      	sub	x5, x4, #0x1
    fdd4:      	uxtb	w16, w3
    fdd8:      	cmp	w16, wzr
    fddc:      	b.eq	0xfec0 <_stogir.stack.constant-size-aligned+0x128>
    fde0:      	ldr	x4, [x0, #0x8]
    fde4:      	cmp	x1, x4
    fde8:      	b.ge	0xff0c <_stogir.stack.constant-size-aligned+0x174>
    fdec:      	add	x4, x0, #0x78
    fdf0:      	ldr	x4, [x4, #0x8]
    fdf4:      	cmp	x1, x4
    fdf8:      	b.ge	0x10008 <_stogir.stack.constant-size-aligned+0x270>
    fdfc:      	lsl	x4, x1, #2
    fe00:      	ldr	x6, [x0, #0x78]
    fe04:      	add	x4, x4, x6
    fe08:      	ldr	w4, [x4]
    fe0c:      	sxtw	x4, w4
    fe10:      	cmp	x4, #0x0
    fe14:      	cset	w4, ge
    fe18:      	ubfx	x4, x4, #0, #8
    fe1c:      	b	0x1000c <_stogir.stack.constant-size-aligned+0x274>
    fe20:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000fe20:  ARM64_RELOC_PAGE21	l_stogir.504
    fe24:      	ldr	x16, [x16]
		000000000000fe24:  ARM64_RELOC_PAGEOFF12	l_stogir.504
    fe28:      	orr	x0, x16, xzr
    fe2c:      	mov	x1, x0
    fe30:      	mov	x0, #0x1                ; =1
    fe34:      	mov	x2, #0x20               ; =32
    fe38:      	str	x0, [x8]
    fe3c:      	str	x1, [x8, #0x8]
    fe40:      	str	x2, [x8, #0x10]
    fe44:      	add	sp, sp, #0x10
    fe48:      	ret
    fe4c:      	mov	x3, #0x1                ; =1
    fe50:      	mov	x16, sp
    fe54:      	ldr	w4, [x16, #0x8]
    fe58:      	mov	x16, sp
    fe5c:      	ldr	w5, [x16, #0xc]
    fe60:      	cmp	x1, #0x0
    fe64:      	b.ge	0xfea4 <_stogir.stack.constant-size-aligned+0x10c>
    fe68:      	cmp	x0, #0x1
    fe6c:      	b.lt	0xfea4 <_stogir.stack.constant-size-aligned+0x10c>
    fe70:      	cmp	x0, #0xb
    fe74:      	cset	w1, le
    fe78:      	uxtb	w16, w1
    fe7c:      	cmp	w16, wzr
    fe80:      	b.eq	0xfea4 <_stogir.stack.constant-size-aligned+0x10c>
    fe84:      	mov	x16, sp
    fe88:      	ldr	w6, [x16]
    fe8c:      	uxtb	w7, w6
    fe90:      	ubfx	x6, x6, #8, #8
    fe94:      	cmp	x7, x6
    fe98:      	b.eq	0x10098 <_stogir.stack.constant-size-aligned+0x300>
    fe9c:      	cmp	x7, #0x49
    fea0:      	b.eq	0x10098 <_stogir.stack.constant-size-aligned+0x300>
    fea4:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000fea4:  ARM64_RELOC_PAGE21	l_stogir.505
    fea8:      	ldr	x16, [x16]
		000000000000fea8:  ARM64_RELOC_PAGEOFF12	l_stogir.505
    feac:      	orr	x0, x16, xzr
    feb0:      	mov	x1, x0
    feb4:      	mov	x0, #0x1                ; =1
    feb8:      	mov	x2, #0x30               ; =48
    febc:      	b	0xfe38 <_stogir.stack.constant-size-aligned+0xa0>
    fec0:      	cmp	x1, #0x0
    fec4:      	b.ge	0xff14 <_stogir.stack.constant-size-aligned+0x17c>
    fec8:      	add	x6, x0, #0x28
    fecc:      	add	x7, x0, #0x50
    fed0:      	ldr	x6, [x6, #0x8]
    fed4:      	ldr	x7, [x7, #0x8]
    fed8:      	cmp	x6, x7
    fedc:      	b.ne	0x10000 <_stogir.stack.constant-size-aligned+0x268>
    fee0:      	cmp	x4, x6
    fee4:      	b.gt	0x10090 <_stogir.stack.constant-size-aligned+0x2f8>
    fee8:      	lsl	x4, x5, #2
    feec:      	ldr	x6, [x0, #0x50]
    fef0:      	add	x4, x4, x6
    fef4:      	ldr	w4, [x4]
    fef8:      	sxtw	x4, w4
    fefc:      	cmp	x4, #0x0
    ff00:      	cset	w4, gt
    ff04:      	ubfx	x4, x4, #0, #8
    ff08:      	b	0x10094 <_stogir.stack.constant-size-aligned+0x2fc>
    ff0c:      	movz	x4, #0x0, lsl #48
    ff10:      	b	0xff18 <_stogir.stack.constant-size-aligned+0x180>
    ff14:      	movz	x4, #0x0, lsl #48
    ff18:      	cmp	x4, #0x0
    ff1c:      	b.eq	0xff80 <_stogir.stack.constant-size-aligned+0x1e8>
    ff20:      	uxtb	w16, w3
    ff24:      	cmp	w16, wzr
    ff28:      	b.eq	0xff50 <_stogir.stack.constant-size-aligned+0x1b8>
    ff2c:      	lsl	x3, x1, #4
    ff30:      	ldr	x0, [x0]
    ff34:      	add	x0, x3, x0
    ff38:      	ldr	x3, [x0]
    ff3c:      	ldr	x0, [x0, #0x8]
    ff40:      	fmov	d31, x0
    ff44:      	mov	x0, x3
    ff48:      	fmov	x3, d31
    ff4c:      	b	0xff70 <_stogir.stack.constant-size-aligned+0x1d8>
    ff50:      	lsl	x3, x5, #4
    ff54:      	ldr	x0, [x0, #0x28]
    ff58:      	add	x0, x3, x0
    ff5c:      	ldr	x3, [x0]
    ff60:      	ldr	x0, [x0, #0x8]
    ff64:      	fmov	d31, x0
    ff68:      	mov	x0, x3
    ff6c:      	fmov	x3, d31
    ff70:      	mov	x4, x3
    ff74:      	mov	x3, x0
    ff78:      	mov	x0, #0x1                ; =1
    ff7c:      	b	0xff8c <_stogir.stack.constant-size-aligned+0x1f4>
    ff80:      	movz	x0, #0x0, lsl #48
    ff84:      	movz	x3, #0x0, lsl #48
    ff88:      	movz	x4, #0x0, lsl #48
    ff8c:      	lsr	w0, w0, #0
    ff90:      	lsr	x16, x0, #0
    ff94:      	cmp	x16, #0x1
    ff98:      	b.eq	0xffb4 <_stogir.stack.constant-size-aligned+0x21c>
    ff9c:      	b.lo	0xffa4 <_stogir.stack.constant-size-aligned+0x20c>
    ffa0:      	b	0xffb8 <_stogir.stack.constant-size-aligned+0x220>
    ffa4:      	cmp	x16, #0x0
    ffa8:      	b.eq	0xffb0 <_stogir.stack.constant-size-aligned+0x218>
    ffac:      	b	0xffb8 <_stogir.stack.constant-size-aligned+0x220>
    ffb0:      	b	0xffbc <_stogir.stack.constant-size-aligned+0x224>
    ffb4:      	b	0xffd8 <_stogir.stack.constant-size-aligned+0x240>
    ffb8:      	b	0x10158 <_stogir.stack.constant-size-aligned+0x3c0>
    ffbc:      	adrp	x16, 0xf000 <_stogir.vector-arithmetic.operands+0x438>
		000000000000ffbc:  ARM64_RELOC_PAGE21	l_stogir.506
    ffc0:      	ldr	x16, [x16]
		000000000000ffc0:  ARM64_RELOC_PAGEOFF12	l_stogir.506
    ffc4:      	orr	x0, x16, xzr
    ffc8:      	mov	x1, x0
    ffcc:      	mov	x0, #0x1                ; =1
    ffd0:      	mov	x2, #0x18               ; =24
    ffd4:      	b	0xfebc <_stogir.stack.constant-size-aligned+0x124>
    ffd8:      	lsr	w0, w3, #0
    ffdc:      	mov	x16, sp
    ffe0:      	str	x3, [x16]
    ffe4:      	mov	x16, sp
    ffe8:      	str	x4, [x16, #0x8]
    ffec:      	ubfx	x0, x0, #8, #8
    fff0:      	cmp	x0, #0x0
    fff4:      	b.ne	0x10010 <_stogir.stack.constant-size-aligned+0x278>
    fff8:      	movz	x3, #0x0, lsl #48
    fffc:      	b	0xfe50 <_stogir.stack.constant-size-aligned+0xb8>
   10000:      	movz	x4, #0x0, lsl #48
   10004:      	b	0xff18 <_stogir.stack.constant-size-aligned+0x180>
   10008:      	movz	x4, #0x0, lsl #48
   1000c:      	b	0xff10 <_stogir.stack.constant-size-aligned+0x178>
   10010:      	cmp	x0, #0x1
   10014:      	b.eq	0xfe4c <_stogir.stack.constant-size-aligned+0xb4>
   10018:      	cmp	x0, #0x2
   1001c:      	b.eq	0xfe4c <_stogir.stack.constant-size-aligned+0xb4>
   10020:      	cmp	x0, #0x7
   10024:      	b.eq	0xfe4c <_stogir.stack.constant-size-aligned+0xb4>
   10028:      	cmp	x0, #0x8
   1002c:      	b.eq	0xfe4c <_stogir.stack.constant-size-aligned+0xb4>
   10030:      	cmp	x0, #0x3
   10034:      	b.eq	0x10150 <_stogir.stack.constant-size-aligned+0x3b8>
   10038:      	cmp	x0, #0x9
   1003c:      	b.eq	0x10150 <_stogir.stack.constant-size-aligned+0x3b8>
   10040:      	cmp	x0, #0x4
   10044:      	b.eq	0x10160 <_stogir.stack.constant-size-aligned+0x3c8>
   10048:      	cmp	x0, #0xa
   1004c:      	b.eq	0x10160 <_stogir.stack.constant-size-aligned+0x3c8>
   10050:      	cmp	x0, #0xd
   10054:      	b.eq	0x10160 <_stogir.stack.constant-size-aligned+0x3c8>
   10058:      	cmp	x0, #0x5
   1005c:      	b.eq	0x10168 <_stogir.stack.constant-size-aligned+0x3d0>
   10060:      	cmp	x0, #0xb
   10064:      	b.eq	0x10168 <_stogir.stack.constant-size-aligned+0x3d0>
   10068:      	cmp	x0, #0xc
   1006c:      	b.eq	0x10168 <_stogir.stack.constant-size-aligned+0x3d0>
   10070:      	cmp	x0, #0x6
   10074:      	cset	w3, eq
   10078:      	uxtb	w16, w3
   1007c:      	cmp	w16, wzr
   10080:      	mov	x16, #0x8               ; =8
   10084:      	movn	x17, #0x0, lsl #48
   10088:      	csel	x3, x16, x17, ne
   1008c:      	b	0x1016c <_stogir.stack.constant-size-aligned+0x3d4>
   10090:      	movz	x4, #0x0, lsl #48
   10094:      	b	0x10004 <_stogir.stack.constant-size-aligned+0x26c>
   10098:      	lsr	w3, w3, #0
   1009c:      	sxtw	x3, w3
   100a0:      	cmp	x3, #0x0
   100a4:      	b.le	0xfea4 <_stogir.stack.constant-size-aligned+0x10c>
   100a8:      	ubfx	x4, x4, #0, #32
   100ac:      	ubfx	x5, x5, #0, #32
   100b0:      	lsl	x5, x5, #32
   100b4:      	orr	x4, x5, x4
   100b8:      	cmp	x3, #0x8
   100bc:      	b.ge	0x100d8 <_stogir.stack.constant-size-aligned+0x340>
   100c0:      	lsl	x5, x3, #3
   100c4:      	lsr	w5, w5, #0
   100c8:      	sxtw	x5, w5
   100cc:      	lsr	x5, x4, x5
   100d0:      	cmp	x5, #0x0
   100d4:      	b.ne	0xfea4 <_stogir.stack.constant-size-aligned+0x10c>
   100d8:      	cmp	x0, #0x7
   100dc:      	b.lt	0x10118 <_stogir.stack.constant-size-aligned+0x380>
   100e0:      	uxtb	w16, w1
   100e4:      	cmp	w16, wzr
   100e8:      	b.eq	0x10118 <_stogir.stack.constant-size-aligned+0x380>
   100ec:      	lsl	x0, x3, #3
   100f0:      	lsr	w0, w0, #0
   100f4:      	sxtw	x0, w0
   100f8:      	sub	x0, x0, #0x1
   100fc:      	lsr	w0, w0, #0
   10100:      	sxtw	x0, w0
   10104:      	mov	x16, #0x1               ; =1
   10108:      	lsl	x0, x16, x0
   1010c:      	and	x0, x0, x4
   10110:      	cmp	x0, #0x0
   10114:      	b.ne	0xfea4 <_stogir.stack.constant-size-aligned+0x10c>
   10118:      	sub	x0, x2, #0x1
   1011c:      	mov	x16, #0x7fffffffffffffff ; =9223372036854775807
   10120:      	sub	x0, x16, x0
   10124:      	cmp	x4, x0
   10128:      	b.hi	0xfea4 <_stogir.stack.constant-size-aligned+0x10c>
   1012c:      	sub	x0, x2, #0x1
   10130:      	movz	x16, #0x0, lsl #48
   10134:      	sub	x1, x16, x2
   10138:      	add	x0, x0, x4
   1013c:      	and	x0, x1, x0
   10140:      	mov	x1, x0
   10144:      	movz	x0, #0x0, lsl #48
   10148:      	movz	x2, #0x0, lsl #48
   1014c:      	b	0xfebc <_stogir.stack.constant-size-aligned+0x124>
   10150:      	mov	x3, #0x2                ; =2
   10154:      	b	0xfe50 <_stogir.stack.constant-size-aligned+0xb8>
   10158:      	brk	#0
   1015c:      	b	0x10158 <_stogir.stack.constant-size-aligned+0x3c0>
   10160:      	mov	x3, #0x4                ; =4
   10164:      	b	0x10154 <_stogir.stack.constant-size-aligned+0x3bc>
   10168:      	mov	x3, #0x8                ; =8
   1016c:      	b	0x10164 <_stogir.stack.constant-size-aligned+0x3cc>

0000000000010170 <_stogir.numeric-conversion.operation?>:
   10170:      	sxtw	x0, w0
   10174:      	cmp	x0, #0x25
   10178:      	b.lt	0x1018c <_stogir.numeric-conversion.operation?+0x1c>
   1017c:      	cmp	x0, #0x27
   10180:      	cset	w0, le
   10184:      	ubfx	x0, x0, #0, #8
   10188:      	b	0x10190 <_stogir.numeric-conversion.operation?+0x20>
   1018c:      	movz	x0, #0x0, lsl #48
   10190:      	ret

0000000000010194 <_stogir.numeric-conversion.valid-types?>:
   10194:      	sxtw	x0, w0
   10198:      	sxtw	x1, w1
   1019c:      	sxtw	x2, w2
   101a0:      	cmp	x2, #0xc
   101a4:      	cset	w3, eq
   101a8:      	cmp	x2, #0xd
   101ac:      	cset	w4, eq
   101b0:      	ubfx	x4, x4, #0, #8
   101b4:      	cmp	x0, #0x25
   101b8:      	b.ne	0x101e0 <_stogir.numeric-conversion.valid-types?+0x4c>
   101bc:      	cmp	x1, #0x1
   101c0:      	b.lt	0x10248 <_stogir.numeric-conversion.valid-types?+0xb4>
   101c4:      	cmp	x1, #0xb
   101c8:      	b.gt	0x10248 <_stogir.numeric-conversion.valid-types?+0xb4>
   101cc:      	uxtb	w16, w3
   101d0:      	cmp	w16, wzr
   101d4:      	b.eq	0x10258 <_stogir.numeric-conversion.valid-types?+0xc4>
   101d8:      	mov	x0, #0x1                ; =1
   101dc:      	b	0x1025c <_stogir.numeric-conversion.valid-types?+0xc8>
   101e0:      	cmp	x1, #0xc
   101e4:      	cset	w5, eq
   101e8:      	cmp	x1, #0xd
   101ec:      	cset	w1, eq
   101f0:      	cmp	x0, #0x26
   101f4:      	b.ne	0x10218 <_stogir.numeric-conversion.valid-types?+0x84>
   101f8:      	uxtb	w16, w5
   101fc:      	cmp	w16, wzr
   10200:      	b.ne	0x10268 <_stogir.numeric-conversion.valid-types?+0xd4>
   10204:      	uxtb	w16, w1
   10208:      	cmp	w16, wzr
   1020c:      	b.ne	0x10268 <_stogir.numeric-conversion.valid-types?+0xd4>
   10210:      	movz	x0, #0x0, lsl #48
   10214:      	b	0x10244 <_stogir.numeric-conversion.valid-types?+0xb0>
   10218:      	cmp	x0, #0x27
   1021c:      	b.ne	0x10250 <_stogir.numeric-conversion.valid-types?+0xbc>
   10220:      	uxtb	w16, w5
   10224:      	cmp	w16, wzr
   10228:      	b.ne	0x10280 <_stogir.numeric-conversion.valid-types?+0xec>
   1022c:      	uxtb	w16, w1
   10230:      	cmp	w16, wzr
   10234:      	b.ne	0x10280 <_stogir.numeric-conversion.valid-types?+0xec>
   10238:      	movz	x0, #0x0, lsl #48
   1023c:      	b	0x10264 <_stogir.numeric-conversion.valid-types?+0xd0>
   10240:      	movz	x0, #0x0, lsl #48
   10244:      	b	0x10254 <_stogir.numeric-conversion.valid-types?+0xc0>
   10248:      	movz	x0, #0x0, lsl #48
   1024c:      	b	0x10254 <_stogir.numeric-conversion.valid-types?+0xc0>
   10250:      	movz	x0, #0x0, lsl #48
   10254:      	ret
   10258:      	mov	x0, x4
   1025c:      	b	0x1024c <_stogir.numeric-conversion.valid-types?+0xb8>
   10260:      	mov	x0, x4
   10264:      	b	0x10254 <_stogir.numeric-conversion.valid-types?+0xc0>
   10268:      	cmp	x2, #0x1
   1026c:      	b.lt	0x10240 <_stogir.numeric-conversion.valid-types?+0xac>
   10270:      	cmp	x2, #0xb
   10274:      	cset	w0, le
   10278:      	ubfx	x0, x0, #0, #8
   1027c:      	b	0x10244 <_stogir.numeric-conversion.valid-types?+0xb0>
   10280:      	uxtb	w16, w3
   10284:      	cmp	w16, wzr
   10288:      	b.eq	0x10260 <_stogir.numeric-conversion.valid-types?+0xcc>
   1028c:      	mov	x0, #0x1                ; =1
   10290:      	b	0x10264 <_stogir.numeric-conversion.valid-types?+0xd0>

0000000000010294 <_inherent$slice$new__stogir.node.Node>:
   10294:      	sub	sp, sp, #0x10
   10298:      	mov	x2, sp
   1029c:      	str	x0, [x2]
   102a0:      	str	x1, [x2, #0x8]
   102a4:      	ldr	x0, [sp]
   102a8:      	ldr	x1, [sp, #0x8]
   102ac:      	add	sp, sp, #0x10
   102b0:      	ret

00000000000102b4 <_inherent$slice$data__stogir.node.Node>:
   102b4:      	ret

00000000000102b8 <_coil.slice.element-ref__stogir.node.Node>:
   102b8:      	ret

00000000000102bc <_stogir.vector-lanes.ordinary?>:
   102bc:      	ldr	w0, [x0]
   102c0:      	uxtb	w0, w0
   102c4:      	cmp	x0, #0x48
   102c8:      	b.ne	0x102d4 <_stogir.vector-lanes.ordinary?+0x18>
   102cc:      	movz	x0, #0x0, lsl #48
   102d0:      	b	0x102e8 <_stogir.vector-lanes.ordinary?+0x2c>
   102d4:      	cmp	x0, #0x46
   102d8:      	cset	w0, eq
   102dc:      	uxtb	w16, w0
   102e0:      	cmp	w16, wzr
   102e4:      	cset	x0, eq
   102e8:      	ret

00000000000102ec <_stogir.vector-lanes.compatible?>:
   102ec:      	sub	sp, sp, #0x30
   102f0:      	str	x29, [sp]
   102f4:      	str	x30, [sp, #0x8]
   102f8:      	mov	x29, sp
   102fc:      	str	x19, [sp, #0x10]
   10300:      	str	x20, [sp, #0x18]
   10304:      	str	x21, [sp, #0x20]
   10308:      	lsr	w3, w0, #0
   1030c:      	sxtw	x19, w0
   10310:      	mov	w0, w3
   10314:      	mov	w20, w1
   10318:      	mov	w21, w2
   1031c:      	bl	0x1031c <_stogir.vector-lanes.compatible?+0x30>
		000000000001031c:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   10320:      	and	x1, x19, #0xf
   10324:      	lsr	w1, w1, #0
   10328:      	sxtw	x1, w1
   1032c:      	cmp	x0, #0x0
   10330:      	b.eq	0x1033c <_stogir.vector-lanes.compatible?+0x50>
   10334:      	mov	x0, x1
   10338:      	b	0x10340 <_stogir.vector-lanes.compatible?+0x54>
   1033c:      	movn	x0, #0x0, lsl #48
   10340:      	cmp	x19, #0xf
   10344:      	b.le	0x10394 <_stogir.vector-lanes.compatible?+0xa8>
   10348:      	cmp	x19, #0x80
   1034c:      	b.ge	0x10394 <_stogir.vector-lanes.compatible?+0xa8>
   10350:      	cmp	x1, #0x1
   10354:      	b.lt	0x10394 <_stogir.vector-lanes.compatible?+0xa8>
   10358:      	cmp	x1, #0xd
   1035c:      	b.gt	0x10394 <_stogir.vector-lanes.compatible?+0xa8>
   10360:      	sxtw	x21, w21
   10364:      	cmp	x21, #0x4
   10368:      	cset	w1, eq
   1036c:      	cmp	x21, #0x8
   10370:      	cset	w2, eq
   10374:      	uxtb	w16, w1
   10378:      	cmp	w16, wzr
   1037c:      	b.ne	0x103bc <_stogir.vector-lanes.compatible?+0xd0>
   10380:      	uxtb	w16, w2
   10384:      	cmp	w16, wzr
   10388:      	b.ne	0x103bc <_stogir.vector-lanes.compatible?+0xd0>
   1038c:      	movz	x0, #0x0, lsl #48
   10390:      	b	0x103b8 <_stogir.vector-lanes.compatible?+0xcc>
   10394:      	movz	x0, #0x0, lsl #48
   10398:      	ldr	x19, [sp, #0x10]
   1039c:      	ldr	x20, [sp, #0x18]
   103a0:      	ldr	x21, [sp, #0x20]
   103a4:      	ldr	x29, [sp]
   103a8:      	ldr	x30, [sp, #0x8]
   103ac:      	add	sp, sp, #0x30
   103b0:      	ret
   103b4:      	movz	x0, #0x0, lsl #48
   103b8:      	b	0x10398 <_stogir.vector-lanes.compatible?+0xac>
   103bc:      	sxtw	x20, w20
   103c0:      	cmp	x20, #0x0
   103c4:      	b.lt	0x103b4 <_stogir.vector-lanes.compatible?+0xc8>
   103c8:      	cmp	x20, #0xd
   103cc:      	b.gt	0x103b4 <_stogir.vector-lanes.compatible?+0xc8>
   103d0:      	cmp	x20, #0x0
   103d4:      	b.le	0x103f0 <_stogir.vector-lanes.compatible?+0x104>
   103d8:      	lsr	w0, w0, #0
   103dc:      	sxtw	x0, w0
   103e0:      	cmp	x0, x20
   103e4:      	b.ne	0x103f8 <_stogir.vector-lanes.compatible?+0x10c>
   103e8:      	mov	x0, #0x1                ; =1
   103ec:      	b	0x103f4 <_stogir.vector-lanes.compatible?+0x108>
   103f0:      	movz	x0, #0x0, lsl #48
   103f4:      	b	0x103b8 <_stogir.vector-lanes.compatible?+0xcc>
   103f8:      	cmp	x0, #0x1
   103fc:      	b.lt	0x10438 <_stogir.vector-lanes.compatible?+0x14c>
   10400:      	cmp	x0, #0xb
   10404:      	b.gt	0x10438 <_stogir.vector-lanes.compatible?+0x14c>
   10408:      	cmp	x20, #0x1
   1040c:      	b.lt	0x10440 <_stogir.vector-lanes.compatible?+0x154>
   10410:      	cmp	x20, #0xb
   10414:      	b.gt	0x10440 <_stogir.vector-lanes.compatible?+0x154>
   10418:      	uxtb	w16, w1
   1041c:      	cmp	w16, wzr
   10420:      	b.ne	0x1046c <_stogir.vector-lanes.compatible?+0x180>
   10424:      	uxtb	w16, w2
   10428:      	cmp	w16, wzr
   1042c:      	b.ne	0x1046c <_stogir.vector-lanes.compatible?+0x180>
   10430:      	movn	x0, #0x0, lsl #48
   10434:      	b	0x10480 <_stogir.vector-lanes.compatible?+0x194>
   10438:      	movz	x0, #0x0, lsl #48
   1043c:      	b	0x103ec <_stogir.vector-lanes.compatible?+0x100>
   10440:      	movz	x0, #0x0, lsl #48
   10444:      	b	0x1043c <_stogir.vector-lanes.compatible?+0x150>
   10448:      	mov	x1, #0x1                ; =1
   1044c:      	lsr	w0, w0, #0
   10450:      	sxtw	x0, w0
   10454:      	lsr	w1, w1, #0
   10458:      	sxtw	x1, w1
   1045c:      	cmp	x0, x1
   10460:      	cset	w0, eq
   10464:      	ubfx	x0, x0, #0, #8
   10468:      	b	0x10444 <_stogir.vector-lanes.compatible?+0x158>
   1046c:      	cmp	x0, #0x0
   10470:      	b.ne	0x10520 <_stogir.vector-lanes.compatible?+0x234>
   10474:      	movz	x0, #0x0, lsl #48
   10478:      	b	0x10480 <_stogir.vector-lanes.compatible?+0x194>
   1047c:      	mov	x0, #0x1                ; =1
   10480:      	uxtb	w16, w1
   10484:      	cmp	w16, wzr
   10488:      	b.ne	0x104a0 <_stogir.vector-lanes.compatible?+0x1b4>
   1048c:      	uxtb	w16, w2
   10490:      	cmp	w16, wzr
   10494:      	b.ne	0x104a0 <_stogir.vector-lanes.compatible?+0x1b4>
   10498:      	movn	x1, #0x0, lsl #48
   1049c:      	b	0x1044c <_stogir.vector-lanes.compatible?+0x160>
   104a0:      	cmp	x20, #0x0
   104a4:      	b.ne	0x104b0 <_stogir.vector-lanes.compatible?+0x1c4>
   104a8:      	movz	x1, #0x0, lsl #48
   104ac:      	b	0x1044c <_stogir.vector-lanes.compatible?+0x160>
   104b0:      	cmp	x20, #0x1
   104b4:      	b.eq	0x10448 <_stogir.vector-lanes.compatible?+0x15c>
   104b8:      	cmp	x20, #0x2
   104bc:      	b.eq	0x10448 <_stogir.vector-lanes.compatible?+0x15c>
   104c0:      	cmp	x20, #0x7
   104c4:      	b.eq	0x10448 <_stogir.vector-lanes.compatible?+0x15c>
   104c8:      	cmp	x20, #0x8
   104cc:      	b.eq	0x10448 <_stogir.vector-lanes.compatible?+0x15c>
   104d0:      	cmp	x20, #0x3
   104d4:      	b.eq	0x10590 <_stogir.vector-lanes.compatible?+0x2a4>
   104d8:      	cmp	x20, #0x9
   104dc:      	b.eq	0x10590 <_stogir.vector-lanes.compatible?+0x2a4>
   104e0:      	cmp	x20, #0x4
   104e4:      	b.eq	0x105a0 <_stogir.vector-lanes.compatible?+0x2b4>
   104e8:      	cmp	x20, #0xa
   104ec:      	b.eq	0x105a0 <_stogir.vector-lanes.compatible?+0x2b4>
   104f0:      	cmp	x20, #0xd
   104f4:      	b.eq	0x105a0 <_stogir.vector-lanes.compatible?+0x2b4>
   104f8:      	cmp	x20, #0x5
   104fc:      	b.eq	0x105b0 <_stogir.vector-lanes.compatible?+0x2c4>
   10500:      	cmp	x20, #0xb
   10504:      	b.eq	0x105b0 <_stogir.vector-lanes.compatible?+0x2c4>
   10508:      	cmp	x20, #0xc
   1050c:      	b.eq	0x105b0 <_stogir.vector-lanes.compatible?+0x2c4>
   10510:      	cmp	x20, #0x6
   10514:      	b.ne	0x105c0 <_stogir.vector-lanes.compatible?+0x2d4>
   10518:      	mov	x1, x21
   1051c:      	b	0x105c4 <_stogir.vector-lanes.compatible?+0x2d8>
   10520:      	cmp	x0, #0x1
   10524:      	b.eq	0x1047c <_stogir.vector-lanes.compatible?+0x190>
   10528:      	cmp	x0, #0x2
   1052c:      	b.eq	0x1047c <_stogir.vector-lanes.compatible?+0x190>
   10530:      	cmp	x0, #0x7
   10534:      	b.eq	0x1047c <_stogir.vector-lanes.compatible?+0x190>
   10538:      	cmp	x0, #0x8
   1053c:      	b.eq	0x1047c <_stogir.vector-lanes.compatible?+0x190>
   10540:      	cmp	x0, #0x3
   10544:      	b.eq	0x10598 <_stogir.vector-lanes.compatible?+0x2ac>
   10548:      	cmp	x0, #0x9
   1054c:      	b.eq	0x10598 <_stogir.vector-lanes.compatible?+0x2ac>
   10550:      	cmp	x0, #0x4
   10554:      	b.eq	0x105a8 <_stogir.vector-lanes.compatible?+0x2bc>
   10558:      	cmp	x0, #0xa
   1055c:      	b.eq	0x105a8 <_stogir.vector-lanes.compatible?+0x2bc>
   10560:      	cmp	x0, #0xd
   10564:      	b.eq	0x105a8 <_stogir.vector-lanes.compatible?+0x2bc>
   10568:      	cmp	x0, #0x5
   1056c:      	b.eq	0x105b8 <_stogir.vector-lanes.compatible?+0x2cc>
   10570:      	cmp	x0, #0xb
   10574:      	b.eq	0x105b8 <_stogir.vector-lanes.compatible?+0x2cc>
   10578:      	cmp	x0, #0xc
   1057c:      	b.eq	0x105b8 <_stogir.vector-lanes.compatible?+0x2cc>
   10580:      	cmp	x0, #0x6
   10584:      	b.ne	0x105c8 <_stogir.vector-lanes.compatible?+0x2dc>
   10588:      	mov	x0, x21
   1058c:      	b	0x105cc <_stogir.vector-lanes.compatible?+0x2e0>
   10590:      	mov	x1, #0x2                ; =2
   10594:      	b	0x1044c <_stogir.vector-lanes.compatible?+0x160>
   10598:      	mov	x0, #0x2                ; =2
   1059c:      	b	0x10480 <_stogir.vector-lanes.compatible?+0x194>
   105a0:      	mov	x1, #0x4                ; =4
   105a4:      	b	0x10594 <_stogir.vector-lanes.compatible?+0x2a8>
   105a8:      	mov	x0, #0x4                ; =4
   105ac:      	b	0x1059c <_stogir.vector-lanes.compatible?+0x2b0>
   105b0:      	mov	x1, #0x8                ; =8
   105b4:      	b	0x105a4 <_stogir.vector-lanes.compatible?+0x2b8>
   105b8:      	mov	x0, #0x8                ; =8
   105bc:      	b	0x105ac <_stogir.vector-lanes.compatible?+0x2c0>
   105c0:      	movn	x1, #0x0, lsl #48
   105c4:      	b	0x105b4 <_stogir.vector-lanes.compatible?+0x2c8>
   105c8:      	movn	x0, #0x0, lsl #48
   105cc:      	b	0x105bc <_stogir.vector-lanes.compatible?+0x2d0>

00000000000105d0 <_stogir.symbols.numeric?>:
   105d0:      	ldr	w0, [x0]
   105d4:      	uxtb	w1, w0
   105d8:      	ubfx	x0, x0, #8, #8
   105dc:      	cmp	x1, x0
   105e0:      	b.ne	0x105ec <_stogir.symbols.numeric?+0x1c>
   105e4:      	mov	x0, #0x1                ; =1
   105e8:      	b	0x105f8 <_stogir.symbols.numeric?+0x28>
   105ec:      	cmp	x1, #0x49
   105f0:      	cset	w0, eq
   105f4:      	ubfx	x0, x0, #0, #8
   105f8:      	ret

00000000000105fc <_stogir.node.constant-bits>:
   105fc:      	ldr	w1, [x0, #0x8]
   10600:      	ubfx	x1, x1, #0, #32
   10604:      	ldr	w0, [x0, #0xc]
   10608:      	ubfx	x0, x0, #0, #32
   1060c:      	lsl	x0, x0, #32
   10610:      	orr	x0, x0, x1
   10614:      	ret

0000000000010618 <_stogir.vector-comparison.valid-type?>:
   10618:      	sub	sp, sp, #0x30
   1061c:      	str	x29, [sp]
   10620:      	str	x30, [sp, #0x8]
   10624:      	mov	x29, sp
   10628:      	str	x19, [sp, #0x10]
   1062c:      	str	x20, [sp, #0x18]
   10630:      	str	x21, [sp, #0x20]
   10634:      	sxtw	x19, w0
   10638:      	cmp	x19, #0xe
   1063c:      	b.lt	0x10694 <_stogir.vector-comparison.valid-type?+0x7c>
   10640:      	cmp	x19, #0x19
   10644:      	b.gt	0x10694 <_stogir.vector-comparison.valid-type?+0x7c>
   10648:      	sxtw	x0, w1
   1064c:      	cmp	x0, #0xf
   10650:      	b.le	0x106b4 <_stogir.vector-comparison.valid-type?+0x9c>
   10654:      	cmp	x0, #0x80
   10658:      	b.ge	0x106b4 <_stogir.vector-comparison.valid-type?+0x9c>
   1065c:      	and	x0, x0, #0xf
   10660:      	lsr	w0, w0, #0
   10664:      	sxtw	x20, w0
   10668:      	cmp	x20, #0x1
   1066c:      	b.lt	0x106b4 <_stogir.vector-comparison.valid-type?+0x9c>
   10670:      	cmp	x20, #0xd
   10674:      	b.gt	0x106b4 <_stogir.vector-comparison.valid-type?+0x9c>
   10678:      	lsr	w21, w1, #0
   1067c:      	mov	w0, w21
   10680:      	bl	0x10680 <_stogir.vector-comparison.valid-type?+0x68>
		0000000000010680:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   10684:      	cmp	x0, #0x0
   10688:      	b.eq	0x106c4 <_stogir.vector-comparison.valid-type?+0xac>
   1068c:      	mov	x0, x20
   10690:      	b	0x106c8 <_stogir.vector-comparison.valid-type?+0xb0>
   10694:      	movz	x0, #0x0, lsl #48
   10698:      	ldr	x19, [sp, #0x10]
   1069c:      	ldr	x20, [sp, #0x18]
   106a0:      	ldr	x21, [sp, #0x20]
   106a4:      	ldr	x29, [sp]
   106a8:      	ldr	x30, [sp, #0x8]
   106ac:      	add	sp, sp, #0x30
   106b0:      	ret
   106b4:      	movz	x0, #0x0, lsl #48
   106b8:      	b	0x10698 <_stogir.vector-comparison.valid-type?+0x80>
   106bc:      	mov	x0, #0x1                ; =1
   106c0:      	b	0x106b8 <_stogir.vector-comparison.valid-type?+0xa0>
   106c4:      	movn	x0, #0x0, lsl #48
   106c8:      	lsr	w0, w0, #0
   106cc:      	sxtw	x0, w0
   106d0:      	cmp	x0, #0xc
   106d4:      	b.eq	0x106bc <_stogir.vector-comparison.valid-type?+0xa4>
   106d8:      	cmp	x0, #0xd
   106dc:      	b.eq	0x106bc <_stogir.vector-comparison.valid-type?+0xa4>
   106e0:      	mov	w0, w21
   106e4:      	bl	0x106e4 <_stogir.vector-comparison.valid-type?+0xcc>
		00000000000106e4:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   106e8:      	cmp	x0, #0x0
   106ec:      	b.eq	0x10700 <_stogir.vector-comparison.valid-type?+0xe8>
   106f0:      	mov	x0, x20
   106f4:      	b	0x10704 <_stogir.vector-comparison.valid-type?+0xec>
   106f8:      	movz	x0, #0x0, lsl #48
   106fc:      	b	0x106c0 <_stogir.vector-comparison.valid-type?+0xa8>
   10700:      	movn	x0, #0x0, lsl #48
   10704:      	lsr	w0, w0, #0
   10708:      	sxtw	x0, w0
   1070c:      	cmp	x0, #0x1
   10710:      	b.lt	0x106f8 <_stogir.vector-comparison.valid-type?+0xe0>
   10714:      	cmp	x0, #0xb
   10718:      	b.gt	0x106f8 <_stogir.vector-comparison.valid-type?+0xe0>
   1071c:      	cmp	x19, #0x17
   10720:      	cset	w0, le
   10724:      	ubfx	x0, x0, #0, #8
   10728:      	b	0x106fc <_stogir.vector-comparison.valid-type?+0xe4>

000000000001072c <_stogir.vector-arithmetic.extrema?>:
   1072c:      	sxtw	x0, w0
   10730:      	cmp	x0, #0x3a
   10734:      	b.ne	0x10740 <_stogir.vector-arithmetic.extrema?+0x14>
   10738:      	mov	x0, #0x1                ; =1
   1073c:      	b	0x1074c <_stogir.vector-arithmetic.extrema?+0x20>
   10740:      	cmp	x0, #0x3b
   10744:      	cset	w0, eq
   10748:      	ubfx	x0, x0, #0, #8
   1074c:      	ret

0000000000010750 <_stogir.vector-arithmetic.shift?>:
   10750:      	sxtw	x0, w0
   10754:      	cmp	x0, #0x31
   10758:      	b.lt	0x1076c <_stogir.vector-arithmetic.shift?+0x1c>
   1075c:      	cmp	x0, #0x35
   10760:      	cset	w0, le
   10764:      	ubfx	x0, x0, #0, #8
   10768:      	b	0x10770 <_stogir.vector-arithmetic.shift?+0x20>
   1076c:      	movz	x0, #0x0, lsl #48
   10770:      	ret

0000000000010774 <_stogir.vector-arithmetic.valid-type?>:
   10774:      	sub	sp, sp, #0x40
   10778:      	str	x29, [sp]
   1077c:      	str	x30, [sp, #0x8]
   10780:      	mov	x29, sp
   10784:      	str	x19, [sp, #0x10]
   10788:      	str	x20, [sp, #0x18]
   1078c:      	str	x21, [sp, #0x20]
   10790:      	str	x22, [sp, #0x28]
   10794:      	str	x23, [sp, #0x30]
   10798:      	lsr	w2, w1, #0
   1079c:      	sxtw	x19, w1
   107a0:      	mov	w20, w0
   107a4:      	mov	w0, w2
   107a8:      	bl	0x107a8 <_stogir.vector-arithmetic.valid-type?+0x34>
		00000000000107a8:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   107ac:      	and	x1, x19, #0xf
   107b0:      	lsr	w1, w1, #0
   107b4:      	sxtw	x1, w1
   107b8:      	cmp	x0, #0x0
   107bc:      	b.eq	0x107c8 <_stogir.vector-arithmetic.valid-type?+0x54>
   107c0:      	mov	x0, x1
   107c4:      	b	0x107cc <_stogir.vector-arithmetic.valid-type?+0x58>
   107c8:      	movn	x0, #0x0, lsl #48
   107cc:      	cmp	x19, #0xf
   107d0:      	b.le	0x109b0 <_stogir.vector-arithmetic.valid-type?+0x23c>
   107d4:      	cmp	x19, #0x80
   107d8:      	b.ge	0x109b0 <_stogir.vector-arithmetic.valid-type?+0x23c>
   107dc:      	cmp	x1, #0x1
   107e0:      	b.lt	0x109b0 <_stogir.vector-arithmetic.valid-type?+0x23c>
   107e4:      	cmp	x1, #0xd
   107e8:      	b.gt	0x109b0 <_stogir.vector-arithmetic.valid-type?+0x23c>
   107ec:      	sxtw	x1, w20
   107f0:      	cmp	x1, #0x1f
   107f4:      	cset	w19, eq
   107f8:      	cmp	x1, #0x20
   107fc:      	cset	w21, eq
   10800:      	cmp	x1, #0x2e
   10804:      	cset	w2, eq
   10808:      	cmp	x1, #0x2f
   1080c:      	cset	w3, eq
   10810:      	cmp	x1, #0x30
   10814:      	cset	w4, eq
   10818:      	cmp	x1, #0x1e
   1081c:      	cset	w5, eq
   10820:      	cmp	x1, #0x31
   10824:      	cset	w6, ge
   10828:      	cmp	x1, #0x35
   1082c:      	cset	w7, le
   10830:      	cmp	x1, #0x3a
   10834:      	cset	w8, eq
   10838:      	cmp	x1, #0x3b
   1083c:      	cset	w9, eq
   10840:      	cmp	x1, #0x2d
   10844:      	cset	w10, eq
   10848:      	cmp	x1, #0x36
   1084c:      	cset	w11, eq
   10850:      	cmp	x1, #0x37
   10854:      	cset	w12, eq
   10858:      	cmp	x1, #0x38
   1085c:      	cset	w13, eq
   10860:      	cmp	x1, #0x39
   10864:      	cset	w14, eq
   10868:      	uxtb	w16, w19
   1086c:      	cmp	w16, wzr
   10870:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10874:      	uxtb	w16, w21
   10878:      	cmp	w16, wzr
   1087c:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10880:      	uxtb	w16, w10
   10884:      	cmp	w16, wzr
   10888:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   1088c:      	uxtb	w16, w11
   10890:      	cmp	w16, wzr
   10894:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10898:      	uxtb	w16, w12
   1089c:      	cmp	w16, wzr
   108a0:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   108a4:      	uxtb	w16, w13
   108a8:      	cmp	w16, wzr
   108ac:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   108b0:      	uxtb	w16, w14
   108b4:      	cmp	w16, wzr
   108b8:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   108bc:      	uxtb	w16, w8
   108c0:      	cmp	w16, wzr
   108c4:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   108c8:      	uxtb	w16, w9
   108cc:      	cmp	w16, wzr
   108d0:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   108d4:      	uxtb	w16, w6
   108d8:      	cmp	w16, wzr
   108dc:      	b.eq	0x10ad8 <_stogir.vector-arithmetic.valid-type?+0x364>
   108e0:      	uxtb	w16, w7
   108e4:      	cmp	w16, wzr
   108e8:      	b.eq	0x10ad8 <_stogir.vector-arithmetic.valid-type?+0x364>
   108ec:      	lsr	w0, w0, #0
   108f0:      	sxtw	x1, w0
   108f4:      	cmp	x1, #0xc
   108f8:      	cset	w22, eq
   108fc:      	cmp	x1, #0xd
   10900:      	cset	w23, eq
   10904:      	uxtb	w16, w19
   10908:      	cmp	w16, wzr
   1090c:      	b.ne	0x109e4 <_stogir.vector-arithmetic.valid-type?+0x270>
   10910:      	uxtb	w16, w21
   10914:      	cmp	w16, wzr
   10918:      	b.ne	0x109e4 <_stogir.vector-arithmetic.valid-type?+0x270>
   1091c:      	uxtb	w16, w10
   10920:      	cmp	w16, wzr
   10924:      	b.ne	0x109e4 <_stogir.vector-arithmetic.valid-type?+0x270>
   10928:      	uxtb	w16, w11
   1092c:      	cmp	w16, wzr
   10930:      	b.ne	0x109e4 <_stogir.vector-arithmetic.valid-type?+0x270>
   10934:      	uxtb	w16, w12
   10938:      	cmp	w16, wzr
   1093c:      	b.ne	0x109e4 <_stogir.vector-arithmetic.valid-type?+0x270>
   10940:      	uxtb	w16, w13
   10944:      	cmp	w16, wzr
   10948:      	b.ne	0x109e4 <_stogir.vector-arithmetic.valid-type?+0x270>
   1094c:      	uxtb	w16, w14
   10950:      	cmp	w16, wzr
   10954:      	b.ne	0x109e4 <_stogir.vector-arithmetic.valid-type?+0x270>
   10958:      	cmp	x1, #0x1
   1095c:      	cset	w0, eq
   10960:      	cmp	x1, #0x1
   10964:      	cset	w10, ge
   10968:      	cmp	x1, #0xb
   1096c:      	cset	w1, le
   10970:      	uxtb	w16, w6
   10974:      	cmp	w16, wzr
   10978:      	b.eq	0x10a44 <_stogir.vector-arithmetic.valid-type?+0x2d0>
   1097c:      	uxtb	w16, w7
   10980:      	cmp	w16, wzr
   10984:      	b.eq	0x10a44 <_stogir.vector-arithmetic.valid-type?+0x2d0>
   10988:      	uxtb	w16, w10
   1098c:      	cmp	w16, wzr
   10990:      	b.eq	0x10ad0 <_stogir.vector-arithmetic.valid-type?+0x35c>
   10994:      	uxtb	w16, w1
   10998:      	cmp	w16, wzr
   1099c:      	b.eq	0x10ad0 <_stogir.vector-arithmetic.valid-type?+0x35c>
   109a0:      	uxtb	w16, w0
   109a4:      	cmp	w16, wzr
   109a8:      	cset	x0, eq
   109ac:      	b	0x10ad4 <_stogir.vector-arithmetic.valid-type?+0x360>
   109b0:      	movz	x0, #0x0, lsl #48
   109b4:      	ldr	x19, [sp, #0x10]
   109b8:      	ldr	x20, [sp, #0x18]
   109bc:      	ldr	x21, [sp, #0x20]
   109c0:      	ldr	x22, [sp, #0x28]
   109c4:      	ldr	x23, [sp, #0x30]
   109c8:      	ldr	x29, [sp]
   109cc:      	ldr	x30, [sp, #0x8]
   109d0:      	add	sp, sp, #0x40
   109d4:      	ret
   109d8:      	ubfx	x21, x21, #0, #8
   109dc:      	mov	x0, x21
   109e0:      	b	0x109b4 <_stogir.vector-arithmetic.valid-type?+0x240>
   109e4:      	lsr	w20, w20, #0
   109e8:      	lsr	w0, w0, #0
   109ec:      	mov	w1, w0
   109f0:      	mov	w0, w20
   109f4:      	bl	0x109f4 <_stogir.vector-arithmetic.valid-type?+0x280>
		00000000000109f4:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
   109f8:      	cmp	x0, #0x0
   109fc:      	b.eq	0x10a08 <_stogir.vector-arithmetic.valid-type?+0x294>
   10a00:      	mov	x0, #0x1                ; =1
   10a04:      	b	0x109e0 <_stogir.vector-arithmetic.valid-type?+0x26c>
   10a08:      	uxtb	w16, w22
   10a0c:      	cmp	w16, wzr
   10a10:      	b.ne	0x10a28 <_stogir.vector-arithmetic.valid-type?+0x2b4>
   10a14:      	uxtb	w16, w23
   10a18:      	cmp	w16, wzr
   10a1c:      	b.ne	0x10a28 <_stogir.vector-arithmetic.valid-type?+0x2b4>
   10a20:      	movz	x0, #0x0, lsl #48
   10a24:      	b	0x109e0 <_stogir.vector-arithmetic.valid-type?+0x26c>
   10a28:      	uxtb	w16, w19
   10a2c:      	cmp	w16, wzr
   10a30:      	b.eq	0x109d8 <_stogir.vector-arithmetic.valid-type?+0x264>
   10a34:      	mov	x0, #0x1                ; =1
   10a38:      	b	0x109e0 <_stogir.vector-arithmetic.valid-type?+0x26c>
   10a3c:      	movz	x0, #0x0, lsl #48
   10a40:      	b	0x109e0 <_stogir.vector-arithmetic.valid-type?+0x26c>
   10a44:      	uxtb	w16, w2
   10a48:      	cmp	w16, wzr
   10a4c:      	b.ne	0x10ab8 <_stogir.vector-arithmetic.valid-type?+0x344>
   10a50:      	uxtb	w16, w3
   10a54:      	cmp	w16, wzr
   10a58:      	b.ne	0x10ab8 <_stogir.vector-arithmetic.valid-type?+0x344>
   10a5c:      	uxtb	w16, w4
   10a60:      	cmp	w16, wzr
   10a64:      	b.ne	0x10ab8 <_stogir.vector-arithmetic.valid-type?+0x344>
   10a68:      	uxtb	w16, w22
   10a6c:      	cmp	w16, wzr
   10a70:      	b.ne	0x10b30 <_stogir.vector-arithmetic.valid-type?+0x3bc>
   10a74:      	uxtb	w16, w23
   10a78:      	cmp	w16, wzr
   10a7c:      	b.ne	0x10b30 <_stogir.vector-arithmetic.valid-type?+0x3bc>
   10a80:      	uxtb	w16, w10
   10a84:      	cmp	w16, wzr
   10a88:      	b.eq	0x10b40 <_stogir.vector-arithmetic.valid-type?+0x3cc>
   10a8c:      	uxtb	w16, w1
   10a90:      	cmp	w16, wzr
   10a94:      	b.eq	0x10b40 <_stogir.vector-arithmetic.valid-type?+0x3cc>
   10a98:      	uxtb	w16, w0
   10a9c:      	cmp	w16, wzr
   10aa0:      	b.eq	0x10b48 <_stogir.vector-arithmetic.valid-type?+0x3d4>
   10aa4:      	uxtb	w16, w8
   10aa8:      	cmp	w16, wzr
   10aac:      	b.eq	0x10b50 <_stogir.vector-arithmetic.valid-type?+0x3dc>
   10ab0:      	mov	x0, #0x1                ; =1
   10ab4:      	b	0x10b58 <_stogir.vector-arithmetic.valid-type?+0x3e4>
   10ab8:      	uxtb	w16, w10
   10abc:      	cmp	w16, wzr
   10ac0:      	b.eq	0x10a3c <_stogir.vector-arithmetic.valid-type?+0x2c8>
   10ac4:      	ubfx	x1, x1, #0, #8
   10ac8:      	mov	x0, x1
   10acc:      	b	0x10a40 <_stogir.vector-arithmetic.valid-type?+0x2cc>
   10ad0:      	movz	x0, #0x0, lsl #48
   10ad4:      	b	0x10a40 <_stogir.vector-arithmetic.valid-type?+0x2cc>
   10ad8:      	cmp	x1, #0x1a
   10adc:      	b.eq	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10ae0:      	cmp	x1, #0x1b
   10ae4:      	b.eq	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10ae8:      	cmp	x1, #0x1c
   10aec:      	b.eq	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10af0:      	cmp	x1, #0x1d
   10af4:      	b.eq	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10af8:      	uxtb	w16, w5
   10afc:      	cmp	w16, wzr
   10b00:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10b04:      	uxtb	w16, w2
   10b08:      	cmp	w16, wzr
   10b0c:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10b10:      	uxtb	w16, w3
   10b14:      	cmp	w16, wzr
   10b18:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10b1c:      	uxtb	w16, w4
   10b20:      	cmp	w16, wzr
   10b24:      	b.ne	0x108ec <_stogir.vector-arithmetic.valid-type?+0x178>
   10b28:      	movz	x0, #0x0, lsl #48
   10b2c:      	b	0x109e0 <_stogir.vector-arithmetic.valid-type?+0x26c>
   10b30:      	uxtb	w16, w5
   10b34:      	cmp	w16, wzr
   10b38:      	cset	x0, eq
   10b3c:      	b	0x10a40 <_stogir.vector-arithmetic.valid-type?+0x2cc>
   10b40:      	movz	x0, #0x0, lsl #48
   10b44:      	b	0x10b3c <_stogir.vector-arithmetic.valid-type?+0x3c8>
   10b48:      	mov	x0, #0x1                ; =1
   10b4c:      	b	0x10b44 <_stogir.vector-arithmetic.valid-type?+0x3d0>
   10b50:      	ubfx	x9, x9, #0, #8
   10b54:      	mov	x0, x9
   10b58:      	b	0x10b4c <_stogir.vector-arithmetic.valid-type?+0x3d8>

0000000000010b5c <_coil.core.Len$slice$len__i32>:
   10b5c:      	mov	x0, x1
   10b60:      	ret

0000000000010b64 <_inherent$slice$data__i32>:
   10b64:      	ret

0000000000010b68 <_stogir.opcode.terminator?>:
   10b68:      	sxtw	x0, w0
   10b6c:      	cmp	x0, #0x0
   10b70:      	b.lt	0x10b98 <_stogir.opcode.terminator?+0x30>
   10b74:      	cmp	x0, #0x83
   10b78:      	b.ge	0x10b98 <_stogir.opcode.terminator?+0x30>
   10b7c:      	adrp	x16, 0x10000 <_stogir.stack.constant-size-aligned+0x268>
		0000000000010b7c:  ARM64_RELOC_PAGE21	l_stogir.507
   10b80:      	ldr	x16, [x16]
		0000000000010b80:  ARM64_RELOC_PAGEOFF12	l_stogir.507
   10b84:      	orr	x1, x16, xzr
   10b88:      	lsr	x0, x0, #0
   10b8c:      	add	x0, x0, x1
   10b90:      	ldrb	w0, [x0]
   10b94:      	b	0x10b9c <_stogir.opcode.terminator?+0x34>
   10b98:      	movz	x0, #0x0, lsl #48
   10b9c:      	uxtb	w0, w0
   10ba0:      	and	x0, x0, #0x8
   10ba4:      	uxtb	w0, w0
   10ba8:      	cmp	x0, #0x0
   10bac:      	cset	w0, eq
   10bb0:      	uxtb	w16, w0
   10bb4:      	cmp	w16, wzr
   10bb8:      	cset	x0, eq
   10bbc:      	ret

0000000000010bc0 <_stogir.switch.sign-mask>:
   10bc0:      	sxtw	x0, w0
   10bc4:      	cmp	x0, #0x7
   10bc8:      	b.lt	0x10be4 <_stogir.switch.sign-mask+0x24>
   10bcc:      	cmp	x0, #0xb
   10bd0:      	b.gt	0x10be4 <_stogir.switch.sign-mask+0x24>
   10bd4:      	cmp	x0, #0x0
   10bd8:      	b.ne	0x10c1c <_stogir.switch.sign-mask+0x5c>
   10bdc:      	movz	x0, #0x0, lsl #48
   10be0:      	b	0x10bf0 <_stogir.switch.sign-mask+0x30>
   10be4:      	movz	x0, #0x0, lsl #48
   10be8:      	ret
   10bec:      	mov	x0, #0x1                ; =1
   10bf0:      	lsr	w0, w0, #0
   10bf4:      	sxtw	x0, w0
   10bf8:      	lsl	x0, x0, #3
   10bfc:      	lsr	w0, w0, #0
   10c00:      	sxtw	x0, w0
   10c04:      	sub	x0, x0, #0x1
   10c08:      	lsr	w0, w0, #0
   10c0c:      	sxtw	x0, w0
   10c10:      	mov	x16, #0x1               ; =1
   10c14:      	lsl	x0, x16, x0
   10c18:      	b	0x10be8 <_stogir.switch.sign-mask+0x28>
   10c1c:      	cmp	x0, #0x1
   10c20:      	b.eq	0x10bec <_stogir.switch.sign-mask+0x2c>
   10c24:      	cmp	x0, #0x2
   10c28:      	b.eq	0x10bec <_stogir.switch.sign-mask+0x2c>
   10c2c:      	cmp	x0, #0x7
   10c30:      	b.eq	0x10bec <_stogir.switch.sign-mask+0x2c>
   10c34:      	cmp	x0, #0x8
   10c38:      	b.eq	0x10bec <_stogir.switch.sign-mask+0x2c>
   10c3c:      	cmp	x0, #0x3
   10c40:      	b.eq	0x10c9c <_stogir.switch.sign-mask+0xdc>
   10c44:      	cmp	x0, #0x9
   10c48:      	b.eq	0x10c9c <_stogir.switch.sign-mask+0xdc>
   10c4c:      	cmp	x0, #0x4
   10c50:      	b.eq	0x10ca4 <_stogir.switch.sign-mask+0xe4>
   10c54:      	cmp	x0, #0xa
   10c58:      	b.eq	0x10ca4 <_stogir.switch.sign-mask+0xe4>
   10c5c:      	cmp	x0, #0xd
   10c60:      	b.eq	0x10ca4 <_stogir.switch.sign-mask+0xe4>
   10c64:      	cmp	x0, #0x5
   10c68:      	b.eq	0x10cac <_stogir.switch.sign-mask+0xec>
   10c6c:      	cmp	x0, #0xb
   10c70:      	b.eq	0x10cac <_stogir.switch.sign-mask+0xec>
   10c74:      	cmp	x0, #0xc
   10c78:      	b.eq	0x10cac <_stogir.switch.sign-mask+0xec>
   10c7c:      	cmp	x0, #0x6
   10c80:      	cset	w0, eq
   10c84:      	uxtb	w16, w0
   10c88:      	cmp	w16, wzr
   10c8c:      	mov	x16, #0x8               ; =8
   10c90:      	movn	x17, #0x0, lsl #48
   10c94:      	csel	x0, x16, x17, ne
   10c98:      	b	0x10cb0 <_stogir.switch.sign-mask+0xf0>
   10c9c:      	mov	x0, #0x2                ; =2
   10ca0:      	b	0x10bf0 <_stogir.switch.sign-mask+0x30>
   10ca4:      	mov	x0, #0x4                ; =4
   10ca8:      	b	0x10ca0 <_stogir.switch.sign-mask+0xe0>
   10cac:      	mov	x0, #0x8                ; =8
   10cb0:      	b	0x10ca8 <_stogir.switch.sign-mask+0xe8>
