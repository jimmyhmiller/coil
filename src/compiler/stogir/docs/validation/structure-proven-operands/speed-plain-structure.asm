
build/structure-speed/after.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000178 <_stogir.verify.structure>:
     178:      	sub	sp, sp, #0x100
     17c:      	str	x29, [sp, #0x10]
     180:      	str	x30, [sp, #0x18]
     184:      	add	x29, sp, #0x10
     188:      	str	x19, [sp, #0xa8]
     18c:      	str	x20, [sp, #0xb0]
     190:      	str	x21, [sp, #0xb8]
     194:      	str	x22, [sp, #0xc0]
     198:      	str	x23, [sp, #0xc8]
     19c:      	str	x24, [sp, #0xd0]
     1a0:      	str	x25, [sp, #0xd8]
     1a4:      	str	x26, [sp, #0xe0]
     1a8:      	str	x27, [sp, #0xe8]
     1ac:      	str	x28, [sp, #0xf0]
     1b0:      	add	x19, x0, #0x78
     1b4:      	mov	x20, x8
     1b8:      	mov	x21, x0
     1bc:      	bl	0x1bc <_stogir.verify.structure+0x44>
		00000000000001bc:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
     1c0:      	fmov	d31, x0
     1c4:      	mov	x0, x19
     1c8:      	fmov	x19, d31
     1cc:      	bl	0x1cc <_stogir.verify.structure+0x54>
		00000000000001cc:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__i32
     1d0:      	cmp	x19, x0
     1d4:      	b.ne	0x1fc <_stogir.verify.structure+0x84>
     1d8:      	adrp	x19, 0x0 <_gap_verify_graph>
		00000000000001d8:  ARM64_RELOC_PAGE21	l_stogir.311
     1dc:      	ldr	x19, [x19]
		00000000000001dc:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     1e0:      	movz	x22, #0x0, lsl #48
     1e4:      	b	0x208 <_stogir.verify.structure+0x90>
     1e8:      	add	x27, x24, x27
     1ec:      	ldr	x19, [sp, #0x60]
     1f0:      	add	x0, x19, #0x1
     1f4:      	sxtw	x19, w0
     1f8:      	b	0x28c <_stogir.verify.structure+0x114>
     1fc:      	adrp	x19, 0x0 <_gap_verify_graph>
		00000000000001fc:  ARM64_RELOC_PAGE21	l_stogir.312
     200:      	ldr	x19, [x19]
		0000000000000200:  ARM64_RELOC_PAGEOFF12	l_stogir.312
     204:      	mov	x22, #0x2c              ; =44
     208:      	mov	x0, x19
     20c:      	mov	x1, x22
     210:      	adrp	x2, 0x0 <_gap_verify_graph>
		0000000000000210:  ARM64_RELOC_PAGE21	l_stogir.311
     214:      	ldr	x2, [x2]
		0000000000000214:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     218:      	movz	x3, #0x0, lsl #48
     21c:      	bl	0x21c <_stogir.verify.structure+0xa4>
		000000000000021c:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     220:      	cmp	x0, #0x0
     224:      	b.eq	0x248 <_stogir.verify.structure+0xd0>
     228:      	mov	x0, x21
     22c:      	bl	0x22c <_stogir.verify.structure+0xb4>
		000000000000022c:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
     230:      	mov	x17, #0x80000000        ; =2147483648
     234:      	cmp	x0, x17
     238:      	b.le	0x248 <_stogir.verify.structure+0xd0>
     23c:      	adrp	x19, 0x0 <_gap_verify_graph>
		000000000000023c:  ARM64_RELOC_PAGE21	l_stogir.313
     240:      	ldr	x19, [x19]
		0000000000000240:  ARM64_RELOC_PAGEOFF12	l_stogir.313
     244:      	mov	x22, #0x33              ; =51
     248:      	add	x16, sp, #0x20
     24c:      	orr	x23, x16, xzr
     250:      	add	x24, x21, #0x110
     254:      	add	x25, x21, #0x78
     258:      	add	x26, x21, #0x28
     25c:      	add	x27, x21, #0x50
     260:      	add	x28, x21, #0x78
     264:      	add	x0, x21, #0x28
     268:      	add	x1, x21, #0x50
     26c:      	add	x2, x24, #0x28
     270:      	mov	x3, #0x1                ; =1
     274:      	movz	x4, #0x0, lsl #48
     278:      	b	0x2f0 <_stogir.verify.structure+0x178>
     27c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000027c:  ARM64_RELOC_PAGE21	l_stogir.314
     280:      	ldr	x16, [x16]
		0000000000000280:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     284:      	str	x16, [sp, #0x50]
     288:      	mov	x22, #0x16              ; =22
     28c:      	b	0x2c0 <_stogir.verify.structure+0x148>
     290:      	str	x24, [sp, #0x80]
     294:      	str	x19, [sp, #0x88]
     298:      	ldr	x19, [sp, #0x60]
     29c:      	mov	x9, x25
     2a0:      	mov	x10, x26
     2a4:      	ldr	x12, [sp, #0x58]
     2a8:      	str	x23, [sp, #0xa0]
     2ac:      	str	x20, [sp, #0x90]
     2b0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002b0:  ARM64_RELOC_PAGE21	l_stogir.315
     2b4:      	ldr	x16, [x16]
		00000000000002b4:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     2b8:      	str	x16, [sp, #0x50]
     2bc:      	mov	x22, #0x23              ; =35
     2c0:      	ldr	x20, [sp, #0x48]
     2c4:      	ldr	x23, [sp, #0x40]
     2c8:      	ldr	x24, [sp, #0x80]
     2cc:      	ldr	x2, [sp, #0x88]
     2d0:      	mov	x25, x9
     2d4:      	mov	x26, x10
     2d8:      	ldr	x0, [sp, #0xa0]
     2dc:      	ldr	x1, [sp, #0x90]
     2e0:      	mov	x3, x27
     2e4:      	mov	x27, x12
     2e8:      	mov	x4, x19
     2ec:      	ldr	x19, [sp, #0x50]
     2f0:      	str	x4, [sp, #0x60]
     2f4:      	str	x23, [sp, #0x40]
     2f8:      	mov	x23, x0
     2fc:      	mov	x0, x19
     300:      	str	x20, [sp, #0x48]
     304:      	mov	x20, x1
     308:      	mov	x1, x22
     30c:      	str	x19, [sp, #0x50]
     310:      	mov	x19, x2
     314:      	str	x27, [sp, #0x58]
     318:      	mov	x27, x3
     31c:      	adrp	x2, 0x0 <_gap_verify_graph>
		000000000000031c:  ARM64_RELOC_PAGE21	l_stogir.311
     320:      	ldr	x2, [x2]
		0000000000000320:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     324:      	movz	x3, #0x0, lsl #48
     328:      	bl	0x328 <_stogir.verify.structure+0x1b0>
		0000000000000328:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     32c:      	cmp	x0, #0x0
     330:      	b.eq	0xb2c <_stogir.verify.structure+0x9b4>
     334:      	mov	x0, x21
     338:      	bl	0x338 <_stogir.verify.structure+0x1c0>
		0000000000000338:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
     33c:      	cmp	x27, x0
     340:      	b.ge	0xb34 <_stogir.verify.structure+0x9bc>
     344:      	ldr	x0, [x21]
     348:      	add	x0, x0, x27, lsl #4
     34c:      	ldr	x1, [x0]
     350:      	ldr	x0, [x0, #0x8]
     354:      	add	x16, sp, #0x20
     358:      	str	x1, [x16]
     35c:      	add	x16, sp, #0x20
     360:      	str	x0, [x16, #0x8]
     364:      	ldr	x0, [sp, #0x40]
     368:      	bl	0x368 <_stogir.verify.structure+0x1f0>
		0000000000000368:  ARM64_RELOC_BRANCH26	_stogir.node.opcode
     36c:      	ldr	x1, [x21, #0x78]
     370:      	add	x1, x1, x27, lsl #2
     374:      	ldr	w1, [x1]
     378:      	sxtw	x1, w1
     37c:      	cmp	x1, #0x0
     380:      	b.lt	0x290 <_stogir.verify.structure+0x118>
     384:      	mov	x17, #0xffff            ; =65535
     388:      	cmp	x1, x17
     38c:      	b.gt	0xb3c <_stogir.verify.structure+0x9c4>
     390:      	uxtb	w0, w0
     394:      	orr	x2, x0, xzr
     398:      	str	w2, [sp, #0x78]
     39c:      	str	x26, [sp, #0x68]
     3a0:      	mov	x26, x1
     3a4:      	str	x25, [sp, #0x70]
     3a8:      	mov	w25, w0
     3ac:      	mov	w0, w2
     3b0:      	bl	0x3b0 <_stogir.verify.structure+0x238>
		00000000000003b0:  ARM64_RELOC_BRANCH26	_stogir.opcode.valid?
     3b4:      	cmp	x0, #0x0
     3b8:      	b.eq	0xb60 <_stogir.verify.structure+0x9e8>
     3bc:      	ldr	x0, [sp, #0x40]
     3c0:      	bl	0x3c0 <_stogir.verify.structure+0x248>
		00000000000003c0:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
     3c4:      	uxtb	w0, w0
     3c8:      	bl	0x3c8 <_stogir.verify.structure+0x250>
		00000000000003c8:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
     3cc:      	cmp	x0, #0x0
     3d0:      	b.eq	0xb84 <_stogir.verify.structure+0xa0c>
     3d4:      	ldr	w0, [sp, #0x78]
     3d8:      	bl	0x3d8 <_stogir.verify.structure+0x260>
		00000000000003d8:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
     3dc:      	sxtw	x0, w0
     3e0:      	cmp	x0, #0x0
     3e4:      	b.lt	0x8ac <_stogir.verify.structure+0x734>
     3e8:      	ldr	w0, [sp, #0x78]
     3ec:      	bl	0x3ec <_stogir.verify.structure+0x274>
		00000000000003ec:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
     3f0:      	sxtw	x0, w0
     3f4:      	cmp	x26, x0
     3f8:      	b.eq	0x8ac <_stogir.verify.structure+0x734>
     3fc:      	str	x24, [sp, #0x80]
     400:      	str	x19, [sp, #0x88]
     404:      	ldr	x9, [sp, #0x70]
     408:      	ldr	x10, [sp, #0x68]
     40c:      	ldr	x12, [sp, #0x58]
     410:      	str	x23, [sp, #0xa0]
     414:      	str	x20, [sp, #0x90]
     418:      	ldr	x19, [sp, #0x60]
     41c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000041c:  ARM64_RELOC_PAGE21	l_stogir.316
     420:      	ldr	x16, [x16]
		0000000000000420:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     424:      	str	x16, [sp, #0x50]
     428:      	mov	x22, #0x23              ; =35
     42c:      	b	0x1f8 <_stogir.verify.structure+0x80>
     430:      	ldr	x0, [sp, #0x50]
     434:      	mov	x1, x22
     438:      	adrp	x2, 0x0 <_gap_verify_graph>
		0000000000000438:  ARM64_RELOC_PAGE21	l_stogir.311
     43c:      	ldr	x2, [x2]
		000000000000043c:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     440:      	movz	x3, #0x0, lsl #48
     444:      	bl	0x444 <_stogir.verify.structure+0x2cc>
		0000000000000444:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     448:      	cmp	x0, #0x0
     44c:      	b.eq	0xba8 <_stogir.verify.structure+0xa30>
     450:      	and	x0, x19, #0xffffffff
     454:      	movz	x1, #0x0, lsl #48
     458:      	movz	x22, #0x0, lsl #48
     45c:      	b	0x464 <_stogir.verify.structure+0x2ec>
     460:      	mov	x1, #0x1                ; =1
     464:      	ldr	x2, [sp, #0x48]
     468:      	str	x1, [x2]
     46c:      	str	x0, [x2, #0x8]
     470:      	str	x22, [x2, #0x10]
     474:      	ldr	x19, [sp, #0xa8]
     478:      	ldr	x20, [sp, #0xb0]
     47c:      	ldr	x21, [sp, #0xb8]
     480:      	ldr	x22, [sp, #0xc0]
     484:      	ldr	x23, [sp, #0xc8]
     488:      	ldr	x24, [sp, #0xd0]
     48c:      	ldr	x25, [sp, #0xd8]
     490:      	ldr	x26, [sp, #0xe0]
     494:      	ldr	x27, [sp, #0xe8]
     498:      	ldr	x28, [sp, #0xf0]
     49c:      	ldr	x29, [sp, #0x10]
     4a0:      	ldr	x30, [sp, #0x18]
     4a4:      	add	sp, sp, #0x100
     4a8:      	ret
     4ac:      	movz	x25, #0x0, lsl #48
     4b0:      	b	0x4c8 <_stogir.verify.structure+0x350>
     4b4:      	movz	x25, #0x0, lsl #48
     4b8:      	b	0x4d4 <_stogir.verify.structure+0x35c>
     4bc:      	movz	w15, #0x0, lsl #16
     4c0:      	b	0x6f4 <_stogir.verify.structure+0x57c>
     4c4:      	movz	x25, #0x0, lsl #48
     4c8:      	str	x19, [sp, #0x98]
     4cc:      	b	0x4d4 <_stogir.verify.structure+0x35c>
     4d0:      	movz	x25, #0x0, lsl #48
     4d4:      	cmp	x25, #0x0
     4d8:      	b.eq	0x688 <_stogir.verify.structure+0x510>
     4dc:      	uxtb	w16, w11
     4e0:      	cmp	w16, wzr
     4e4:      	b.eq	0x4f4 <_stogir.verify.structure+0x37c>
     4e8:      	ldr	x15, [x21]
     4ec:      	add	x15, x15, x4, lsl #4
     4f0:      	b	0x4fc <_stogir.verify.structure+0x384>
     4f4:      	ldr	x19, [x21, #0x28]
     4f8:      	add	x15, x19, x15, lsl #4
     4fc:      	b	0x68c <_stogir.verify.structure+0x514>
     500:      	mov	x4, #0x1                ; =1
     504:      	cmp	x4, #0x0
     508:      	b.eq	0x51c <_stogir.verify.structure+0x3a4>
     50c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000050c:  ARM64_RELOC_PAGE21	l_stogir.317
     510:      	ldr	x16, [x16]
		0000000000000510:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     514:      	str	x16, [sp, #0x50]
     518:      	mov	x22, #0x1a              ; =26
     51c:      	add	x3, x3, #0x1
     520:      	sxtw	x3, w3
     524:      	ldr	x19, [sp, #0x98]
     528:      	str	x9, [sp, #0x70]
     52c:      	str	x10, [sp, #0x68]
     530:      	str	x12, [sp, #0x58]
     534:      	ldr	x23, [sp, #0xa0]
     538:      	cmp	x22, #0x0
     53c:      	b.ne	0x550 <_stogir.verify.structure+0x3d8>
     540:      	cmp	x3, x26
     544:      	cset	w4, le
     548:      	ubfx	x4, x4, #0, #8
     54c:      	b	0x554 <_stogir.verify.structure+0x3dc>
     550:      	movz	x4, #0x0, lsl #48
     554:      	cmp	x4, #0x0
     558:      	b.eq	0xbb0 <_stogir.verify.structure+0xa38>
     55c:      	orr	w4, w3, wzr
     560:      	sxtw	x5, w4
     564:      	sub	w6, w4, #0x1
     568:      	cmp	x5, #0x0
     56c:      	cset	w7, gt
     570:      	cmp	x5, #0x4
     574:      	cset	w8, gt
     578:      	uxtb	w16, w7
     57c:      	cmp	w16, wzr
     580:      	b.eq	0x5b0 <_stogir.verify.structure+0x438>
     584:      	uxtb	w16, w8
     588:      	cmp	w16, wzr
     58c:      	b.eq	0x598 <_stogir.verify.structure+0x420>
     590:      	mov	w9, #0x4                ; =4
     594:      	b	0x59c <_stogir.verify.structure+0x424>
     598:      	mov	w9, w6
     59c:      	lsl	w9, w9, #2
     5a0:      	ubfx	x9, x9, #0, #32
     5a4:      	lsr	x9, x19, x9
     5a8:      	and	w9, w9, #0xf
     5ac:      	b	0x5b4 <_stogir.verify.structure+0x43c>
     5b0:      	movz	w9, #0x0, lsl #16
     5b4:      	ubfx	x10, x4, #0, #32
     5b8:      	and	w4, w4, #0x3
     5bc:      	ubfx	x4, x4, #0, #32
     5c0:      	ldr	x11, [x21]
     5c4:      	ubfx	x10, x10, #2, #32
     5c8:      	ubfx	x9, x9, #0, #32
     5cc:      	ubfx	x10, x10, #0, #32
     5d0:      	add	x10, x10, x27
     5d4:      	add	x10, x11, x10, lsl #4
     5d8:      	add	x4, x10, x4, lsl #2
     5dc:      	ldr	w4, [x4]
     5e0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000005e0:  ARM64_RELOC_PAGE21	l_stogir.318
     5e4:      	ldr	x16, [x16]
		00000000000005e4:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     5e8:      	ldr	w10, [x16]
     5ec:      	cmp	x9, x10
     5f0:      	b.ne	0x5fc <_stogir.verify.structure+0x484>
     5f4:      	mov	x10, #0x1               ; =1
     5f8:      	b	0x614 <_stogir.verify.structure+0x49c>
     5fc:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000005fc:  ARM64_RELOC_PAGE21	l_stogir.319
     600:      	ldr	x16, [x16]
		0000000000000600:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     604:      	ldr	w10, [x16]
     608:      	cmp	x9, x10
     60c:      	cset	w10, eq
     610:      	ubfx	x10, x10, #0, #8
     614:      	sxtw	x4, w4
     618:      	cmp	x4, #0x0
     61c:      	cset	w11, gt
     620:      	lsl	x12, x4, #2
     624:      	cmp	x4, #0x0
     628:      	cset	w13, lt
     62c:      	movz	x16, #0x0, lsl #48
     630:      	sub	x14, x16, x4
     634:      	sub	x15, x14, #0x1
     638:      	lsl	x20, x15, #2
     63c:      	cmp	x10, #0x0
     640:      	b.eq	0xbc4 <_stogir.verify.structure+0xa4c>
     644:      	uxtb	w16, w11
     648:      	cmp	w16, wzr
     64c:      	b.eq	0x7dc <_stogir.verify.structure+0x664>
     650:      	ldr	x25, [x21, #0x8]
     654:      	cmp	x4, x25
     658:      	b.ge	0x4c4 <_stogir.verify.structure+0x34c>
     65c:      	ldr	x25, [x28, #0x8]
     660:      	cmp	x4, x25
     664:      	b.ge	0x4ac <_stogir.verify.structure+0x334>
     668:      	ldr	x25, [x21, #0x78]
     66c:      	add	x25, x12, x25
     670:      	ldr	w25, [x25]
     674:      	sxtw	x25, w25
     678:      	cmp	x25, #0x0
     67c:      	cset	w25, ge
     680:      	ubfx	x25, x25, #0, #8
     684:      	b	0x4b0 <_stogir.verify.structure+0x338>
     688:      	movz	x15, #0x0, lsl #48
     68c:      	cmp	x15, #0x0
     690:      	cset	w19, eq
     694:      	uxtb	w16, w19
     698:      	cmp	w16, wzr
     69c:      	cset	x19, eq
     6a0:      	cmp	x19, #0x0
     6a4:      	b.eq	0x6c8 <_stogir.verify.structure+0x550>
     6a8:      	ldr	w15, [x15]
     6ac:      	uxtb	w15, w15
     6b0:      	cmp	x15, #0x48
     6b4:      	b.ne	0x6c8 <_stogir.verify.structure+0x550>
     6b8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000006b8:  ARM64_RELOC_PAGE21	l_stogir.320
     6bc:      	ldr	x16, [x16]
		00000000000006bc:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     6c0:      	str	x16, [sp, #0x50]
     6c4:      	mov	x22, #0x25              ; =37
     6c8:      	b	0x6d0 <_stogir.verify.structure+0x558>
     6cc:      	movz	x19, #0x0, lsl #48
     6d0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000006d0:  ARM64_RELOC_PAGE21	l_stogir.321
     6d4:      	ldr	x16, [x16]
		00000000000006d4:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     6d8:      	ldr	w15, [x16]
     6dc:      	cmp	x9, x15
     6e0:      	b.ne	0xbcc <_stogir.verify.structure+0xa54>
     6e4:      	cmp	x4, #0x0
     6e8:      	b.gt	0x770 <_stogir.verify.structure+0x5f8>
     6ec:      	str	x23, [sp, #0xa0]
     6f0:      	movz	w15, #0x0, lsl #16
     6f4:      	ubfx	x15, x15, #0, #32
     6f8:      	lsr	x16, x15, #0
     6fc:      	cmp	x16, #0x1
     700:      	b.eq	0x71c <_stogir.verify.structure+0x5a4>
     704:      	b.lo	0x70c <_stogir.verify.structure+0x594>
     708:      	b	0x720 <_stogir.verify.structure+0x5a8>
     70c:      	cmp	x16, #0x0
     710:      	b.eq	0x718 <_stogir.verify.structure+0x5a0>
     714:      	b	0x720 <_stogir.verify.structure+0x5a8>
     718:      	b	0x724 <_stogir.verify.structure+0x5ac>
     71c:      	b	0x734 <_stogir.verify.structure+0x5bc>
     720:      	b	0xb1c <_stogir.verify.structure+0x9a4>
     724:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000724:  ARM64_RELOC_PAGE21	l_stogir.322
     728:      	ldr	x16, [x16]
		0000000000000728:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     72c:      	str	x16, [sp, #0x50]
     730:      	mov	x22, #0x21              ; =33
     734:      	cmp	x9, #0xf
     738:      	b.hs	0xbd4 <_stogir.verify.structure+0xa5c>
     73c:      	mov	x16, #0x1               ; =1
     740:      	lsl	x9, x16, x9
     744:      	mov	w17, #0x5e1c            ; =24092
     748:      	and	w9, w9, w17
     74c:      	ubfx	x9, x9, #0, #32
     750:      	cmp	x9, #0x0
     754:      	b.eq	0xbe4 <_stogir.verify.structure+0xa6c>
     758:      	cmp	x10, #0x0
     75c:      	b.eq	0x9c4 <_stogir.verify.structure+0x84c>
     760:      	ldr	x9, [sp, #0x70]
     764:      	ldr	x10, [sp, #0x68]
     768:      	ldr	x12, [sp, #0x58]
     76c:      	b	0x964 <_stogir.verify.structure+0x7ec>
     770:      	ldr	x15, [sp, #0x88]
     774:      	ldr	x25, [x15, #0x8]
     778:      	cmp	x4, x25
     77c:      	b.gt	0xbf4 <_stogir.verify.structure+0xa7c>
     780:      	sub	x25, x4, #0x1
     784:      	str	x15, [sp, #0x88]
     788:      	ldr	x15, [sp, #0x80]
     78c:      	str	x23, [sp, #0xa0]
     790:      	ldr	x23, [x15, #0x28]
     794:      	mov	x17, #0x18              ; =24
     798:      	mul	x25, x25, x17
     79c:      	add	x23, x25, x23
     7a0:      	ldr	x25, [x23]
     7a4:      	ldr	x23, [x23, #0x8]
     7a8:      	str	x15, [sp, #0x80]
     7ac:      	ldr	x15, [x15, #0x8]
     7b0:      	cmp	x25, #0x0
     7b4:      	b.lt	0x4bc <_stogir.verify.structure+0x344>
     7b8:      	cmp	x25, x15
     7bc:      	b.gt	0x4bc <_stogir.verify.structure+0x344>
     7c0:      	cmp	x23, #0x0
     7c4:      	b.lt	0x4bc <_stogir.verify.structure+0x344>
     7c8:      	sub	x15, x15, x25
     7cc:      	cmp	x23, x15
     7d0:      	b.gt	0x4bc <_stogir.verify.structure+0x344>
     7d4:      	mov	w15, #0x1               ; =1
     7d8:      	b	0x4c0 <_stogir.verify.structure+0x348>
     7dc:      	uxtb	w16, w13
     7e0:      	cmp	w16, wzr
     7e4:      	b.eq	0xc00 <_stogir.verify.structure+0xa88>
     7e8:      	ldr	x25, [x23, #0x8]
     7ec:      	str	x19, [sp, #0x98]
     7f0:      	ldr	x19, [sp, #0x90]
     7f4:      	str	x19, [sp, #0x90]
     7f8:      	ldr	x19, [x19, #0x8]
     7fc:      	cmp	x25, x19
     800:      	b.ne	0x4b4 <_stogir.verify.structure+0x33c>
     804:      	cmp	x14, x25
     808:      	b.gt	0xa0c <_stogir.verify.structure+0x894>
     80c:      	ldr	x19, [x21, #0x50]
     810:      	add	x19, x20, x19
     814:      	ldr	w19, [x19]
     818:      	sxtw	x19, w19
     81c:      	cmp	x19, #0x0
     820:      	cset	w19, gt
     824:      	ubfx	x25, x19, #0, #8
     828:      	b	0xa10 <_stogir.verify.structure+0x898>
     82c:      	cmp	x25, #0x78
     830:      	cset	w0, eq
     834:      	cmp	x25, #0x83
     838:      	cset	w1, lt
     83c:      	ubfx	x19, x19, #0, #32
     840:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000840:  ARM64_RELOC_PAGE21	l_stogir.323
     844:      	ldr	x16, [x16]
		0000000000000844:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     848:      	add	x2, x16, x25, lsl #2
     84c:      	mov	x3, #0x1                ; =1
     850:      	b	0x538 <_stogir.verify.structure+0x3c0>
     854:      	nop
     858:      	movz	x1, #0x0, lsl #48
     85c:      	cmp	x1, #0x0
     860:      	b.eq	0x82c <_stogir.verify.structure+0x6b4>
     864:      	add	x1, x0, x27
     868:      	ldr	x2, [x21, #0x78]
     86c:      	add	x1, x2, x1, lsl #2
     870:      	ldr	w1, [x1]
     874:      	sxtw	x1, w1
     878:      	cmn	x1, #0x1
     87c:      	b.eq	0x890 <_stogir.verify.structure+0x718>
     880:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000880:  ARM64_RELOC_PAGE21	l_stogir.324
     884:      	ldr	x16, [x16]
		0000000000000884:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     888:      	str	x16, [sp, #0x50]
     88c:      	mov	x22, #0x1b              ; =27
     890:      	add	x0, x0, #0x1
     894:      	cmp	x22, #0x0
     898:      	b.ne	0x858 <_stogir.verify.structure+0x6e0>
     89c:      	cmp	x0, x24
     8a0:      	cset	w1, lt
     8a4:      	ubfx	x1, x1, #0, #8
     8a8:      	b	0x85c <_stogir.verify.structure+0x6e4>
     8ac:      	ldr	w0, [sp, #0x78]
     8b0:      	bl	0x8b0 <_stogir.verify.structure+0x738>
		00000000000008b0:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
     8b4:      	sxtw	x0, w0
     8b8:      	cmn	x0, #0x1
     8bc:      	b.ne	0x8e4 <_stogir.verify.structure+0x76c>
     8c0:      	ldr	x0, [sp, #0x40]
     8c4:      	bl	0x8c4 <_stogir.verify.structure+0x74c>
		00000000000008c4:  ARM64_RELOC_BRANCH26	_stogir.node.auxiliary
     8c8:      	uxth	w0, w0
     8cc:      	cmp	x26, x0
     8d0:      	b.eq	0x8e4 <_stogir.verify.structure+0x76c>
     8d4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000008d4:  ARM64_RELOC_PAGE21	l_stogir.325
     8d8:      	ldr	x16, [x16]
		00000000000008d8:  ARM64_RELOC_PAGEOFF12	l_stogir.325
     8dc:      	str	x16, [sp, #0x50]
     8e0:      	mov	x22, #0x24              ; =36
     8e4:      	add	x0, x26, #0x4
     8e8:      	str	x24, [sp, #0x80]
     8ec:      	mov	x24, x0
     8f0:      	bl	0x8f0 <_stogir.verify.structure+0x778>
		00000000000008f0:  ARM64_RELOC_BRANCH26	_stogir.opcode.metadata
     8f4:      	asr	x16, x24, #63
     8f8:      	lsr	x16, x16, #62
     8fc:      	add	x2, x24, x16
     900:      	asr	x2, x2, #2
     904:      	orr	x24, x2, xzr
     908:      	mov	x2, x25
     90c:      	bl	0x90c <_stogir.verify.structure+0x794>
		000000000000090c:  ARM64_RELOC_BRANCH26	_coil.core.Get$slice$get__u32
     910:      	add	x1, x24, x27
     914:      	str	x19, [sp, #0x88]
     918:      	mov	x19, x0
     91c:      	mov	x0, x21
     920:      	str	x20, [sp, #0x90]
     924:      	mov	x20, x1
     928:      	bl	0x928 <_stogir.verify.structure+0x7b0>
		0000000000000928:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
     92c:      	cmp	x20, x0
     930:      	b.le	0x944 <_stogir.verify.structure+0x7cc>
     934:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000934:  ARM64_RELOC_PAGE21	l_stogir.326
     938:      	ldr	x16, [x16]
		0000000000000938:  ARM64_RELOC_PAGEOFF12	l_stogir.326
     93c:      	str	x16, [sp, #0x50]
     940:      	mov	x22, #0x15              ; =21
     944:      	mov	x0, #0x1                ; =1
     948:      	b	0x894 <_stogir.verify.structure+0x71c>
     94c:      	movz	x4, #0x0, lsl #48
     950:      	cmp	x4, #0x0
     954:      	b.eq	0x500 <_stogir.verify.structure+0x388>
     958:      	movz	x4, #0x0, lsl #48
     95c:      	b	0x504 <_stogir.verify.structure+0x38c>
     960:      	movz	x19, #0x0, lsl #48
     964:      	cmp	x19, #0x0
     968:      	b.eq	0x974 <_stogir.verify.structure+0x7fc>
     96c:      	mov	x4, #0x1                ; =1
     970:      	b	0x950 <_stogir.verify.structure+0x7d8>
     974:      	cmp	x4, #0x0
     978:      	b.ne	0x94c <_stogir.verify.structure+0x7d4>
     97c:      	add	x16, sp, #0x20
     980:      	ldr	w4, [x16]
     984:      	uxtb	w16, w1
     988:      	cmp	w16, wzr
     98c:      	b.eq	0xa78 <_stogir.verify.structure+0x900>
     990:      	ldr	w11, [x2]
     994:      	uxtb	w16, w7
     998:      	cmp	w16, wzr
     99c:      	b.eq	0xab8 <_stogir.verify.structure+0x940>
     9a0:      	uxtb	w16, w8
     9a4:      	cmp	w16, wzr
     9a8:      	b.eq	0x9b0 <_stogir.verify.structure+0x838>
     9ac:      	mov	w6, #0x4                ; =4
     9b0:      	lsl	w6, w6, #2
     9b4:      	ubfx	x6, x6, #0, #32
     9b8:      	lsr	x6, x11, x6
     9bc:      	and	w6, w6, #0xf
     9c0:      	b	0xabc <_stogir.verify.structure+0x944>
     9c4:      	uxtb	w16, w11
     9c8:      	cmp	w16, wzr
     9cc:      	b.eq	0xc08 <_stogir.verify.structure+0xa90>
     9d0:      	ldr	x9, [x21, #0x8]
     9d4:      	cmp	x4, x9
     9d8:      	b.ge	0xc10 <_stogir.verify.structure+0xa98>
     9dc:      	ldr	x9, [sp, #0x70]
     9e0:      	ldr	x10, [x9, #0x8]
     9e4:      	cmp	x4, x10
     9e8:      	b.ge	0xac8 <_stogir.verify.structure+0x950>
     9ec:      	ldr	x10, [x21, #0x78]
     9f0:      	add	x10, x12, x10
     9f4:      	ldr	w10, [x10]
     9f8:      	sxtw	x10, w10
     9fc:      	cmp	x10, #0x0
     a00:      	cset	w10, ge
     a04:      	ubfx	x19, x10, #0, #8
     a08:      	b	0xacc <_stogir.verify.structure+0x954>
     a0c:      	movz	x25, #0x0, lsl #48
     a10:      	b	0x4b8 <_stogir.verify.structure+0x340>
     a14:      	movz	x4, #0x0, lsl #48
     a18:      	b	0x950 <_stogir.verify.structure+0x7d8>
     a1c:      	movz	x19, #0x0, lsl #48
     a20:      	ldr	x10, [sp, #0x68]
     a24:      	ldr	x12, [sp, #0x58]
     a28:      	b	0x964 <_stogir.verify.structure+0x7ec>
     a2c:      	uxtb	w16, w13
     a30:      	cmp	w16, wzr
     a34:      	b.eq	0xc18 <_stogir.verify.structure+0xaa0>
     a38:      	ldr	x10, [sp, #0x68]
     a3c:      	ldr	x11, [x10, #0x8]
     a40:      	ldr	x12, [sp, #0x58]
     a44:      	ldr	x13, [x12, #0x8]
     a48:      	cmp	x11, x13
     a4c:      	b.ne	0xac0 <_stogir.verify.structure+0x948>
     a50:      	cmp	x14, x11
     a54:      	b.gt	0xaec <_stogir.verify.structure+0x974>
     a58:      	ldr	x11, [x21, #0x50]
     a5c:      	add	x11, x20, x11
     a60:      	ldr	w11, [x11]
     a64:      	sxtw	x11, w11
     a68:      	cmp	x11, #0x0
     a6c:      	cset	w11, gt
     a70:      	ubfx	x19, x11, #0, #8
     a74:      	b	0xaf0 <_stogir.verify.structure+0x978>
     a78:      	movz	w6, #0x0, lsl #16
     a7c:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000a7c:  ARM64_RELOC_PAGE21	l_stogir.327
     a80:      	ldr	x16, [x16]
		0000000000000a80:  ARM64_RELOC_PAGEOFF12	l_stogir.327
     a84:      	ldr	w7, [x16]
     a88:      	ubfx	x6, x6, #0, #32
     a8c:      	cmp	x6, x7
     a90:      	b.ne	0xa9c <_stogir.verify.structure+0x924>
     a94:      	mov	x4, #0x1                ; =1
     a98:      	b	0xa18 <_stogir.verify.structure+0x8a0>
     a9c:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000a9c:  ARM64_RELOC_PAGE21	l_stogir.328
     aa0:      	ldr	x16, [x16]
		0000000000000aa0:  ARM64_RELOC_PAGEOFF12	l_stogir.328
     aa4:      	ldr	w7, [x16]
     aa8:      	cmp	x6, x7
     aac:      	b.ne	0xad0 <_stogir.verify.structure+0x958>
     ab0:      	mov	x4, #0x1                ; =1
     ab4:      	b	0xa18 <_stogir.verify.structure+0x8a0>
     ab8:      	movz	w6, #0x0, lsl #16
     abc:      	b	0xa7c <_stogir.verify.structure+0x904>
     ac0:      	movz	x19, #0x0, lsl #48
     ac4:      	b	0x964 <_stogir.verify.structure+0x7ec>
     ac8:      	movz	x19, #0x0, lsl #48
     acc:      	b	0xa20 <_stogir.verify.structure+0x8a8>
     ad0:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ad0:  ARM64_RELOC_PAGE21	l_stogir.329
     ad4:      	ldr	x16, [x16]
		0000000000000ad4:  ARM64_RELOC_PAGEOFF12	l_stogir.329
     ad8:      	ldr	w7, [x16]
     adc:      	cmp	x6, x7
     ae0:      	b.ne	0xaf4 <_stogir.verify.structure+0x97c>
     ae4:      	mov	x4, #0x1                ; =1
     ae8:      	b	0xa18 <_stogir.verify.structure+0x8a0>
     aec:      	movz	x19, #0x0, lsl #48
     af0:      	b	0xac4 <_stogir.verify.structure+0x94c>
     af4:      	uxtb	w16, w0
     af8:      	cmp	w16, wzr
     afc:      	b.eq	0xa14 <_stogir.verify.structure+0x89c>
     b00:      	ubfx	x4, x4, #8, #8
     b04:      	cmp	x4, #0x0
     b08:      	b.ne	0xb24 <_stogir.verify.structure+0x9ac>
     b0c:      	cmp	x5, #0x2
     b10:      	cset	w4, eq
     b14:      	ubfx	x4, x4, #0, #8
     b18:      	b	0xb28 <_stogir.verify.structure+0x9b0>
     b1c:      	brk	#0
     b20:      	b	0xb1c <_stogir.verify.structure+0x9a4>
     b24:      	movz	x4, #0x0, lsl #48
     b28:      	b	0xa18 <_stogir.verify.structure+0x8a0>
     b2c:      	ldr	x19, [sp, #0x60]
     b30:      	b	0x430 <_stogir.verify.structure+0x2b8>
     b34:      	ldr	x19, [sp, #0x60]
     b38:      	b	0x430 <_stogir.verify.structure+0x2b8>
     b3c:      	str	x24, [sp, #0x80]
     b40:      	str	x19, [sp, #0x88]
     b44:      	ldr	x19, [sp, #0x60]
     b48:      	mov	x9, x25
     b4c:      	mov	x10, x26
     b50:      	ldr	x12, [sp, #0x58]
     b54:      	str	x23, [sp, #0xa0]
     b58:      	str	x20, [sp, #0x90]
     b5c:      	b	0x2b0 <_stogir.verify.structure+0x138>
     b60:      	str	x24, [sp, #0x80]
     b64:      	str	x19, [sp, #0x88]
     b68:      	ldr	x19, [sp, #0x60]
     b6c:      	ldr	x9, [sp, #0x70]
     b70:      	ldr	x10, [sp, #0x68]
     b74:      	ldr	x12, [sp, #0x58]
     b78:      	str	x23, [sp, #0xa0]
     b7c:      	str	x20, [sp, #0x90]
     b80:      	b	0x27c <_stogir.verify.structure+0x104>
     b84:      	str	x24, [sp, #0x80]
     b88:      	str	x19, [sp, #0x88]
     b8c:      	ldr	x19, [sp, #0x60]
     b90:      	ldr	x9, [sp, #0x70]
     b94:      	ldr	x10, [sp, #0x68]
     b98:      	ldr	x12, [sp, #0x58]
     b9c:      	str	x23, [sp, #0xa0]
     ba0:      	str	x20, [sp, #0x90]
     ba4:      	b	0x27c <_stogir.verify.structure+0x104>
     ba8:      	ldr	x0, [sp, #0x50]
     bac:      	b	0x460 <_stogir.verify.structure+0x2e8>
     bb0:      	ldr	x9, [sp, #0x70]
     bb4:      	ldr	x10, [sp, #0x68]
     bb8:      	ldr	x12, [sp, #0x58]
     bbc:      	str	x23, [sp, #0xa0]
     bc0:      	b	0x1e8 <_stogir.verify.structure+0x70>
     bc4:      	str	x19, [sp, #0x98]
     bc8:      	b	0x6cc <_stogir.verify.structure+0x554>
     bcc:      	str	x23, [sp, #0xa0]
     bd0:      	b	0x734 <_stogir.verify.structure+0x5bc>
     bd4:      	ldr	x9, [sp, #0x70]
     bd8:      	ldr	x10, [sp, #0x68]
     bdc:      	ldr	x12, [sp, #0x58]
     be0:      	b	0x51c <_stogir.verify.structure+0x3a4>
     be4:      	ldr	x9, [sp, #0x70]
     be8:      	ldr	x10, [sp, #0x68]
     bec:      	ldr	x12, [sp, #0x58]
     bf0:      	b	0x51c <_stogir.verify.structure+0x3a4>
     bf4:      	str	x15, [sp, #0x88]
     bf8:      	str	x23, [sp, #0xa0]
     bfc:      	b	0x6f0 <_stogir.verify.structure+0x578>
     c00:      	str	x19, [sp, #0x98]
     c04:      	b	0x4d0 <_stogir.verify.structure+0x358>
     c08:      	ldr	x9, [sp, #0x70]
     c0c:      	b	0xa2c <_stogir.verify.structure+0x8b4>
     c10:      	ldr	x9, [sp, #0x70]
     c14:      	b	0xa1c <_stogir.verify.structure+0x8a4>
     c18:      	ldr	x10, [sp, #0x68]
     c1c:      	ldr	x12, [sp, #0x58]
     c20:      	b	0x960 <_stogir.verify.structure+0x7e8>
