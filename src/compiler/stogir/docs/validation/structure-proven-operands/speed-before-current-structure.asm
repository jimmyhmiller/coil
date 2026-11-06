
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/finite-countdown/build/structure-speed/before-current.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000170 <_stogir.verify.structure>:
     170:      	sub	sp, sp, #0xf0
     174:      	str	x29, [sp, #0x10]
     178:      	str	x30, [sp, #0x18]
     17c:      	add	x29, sp, #0x10
     180:      	str	x19, [sp, #0x98]
     184:      	str	x20, [sp, #0xa0]
     188:      	str	x21, [sp, #0xa8]
     18c:      	str	x22, [sp, #0xb0]
     190:      	str	x23, [sp, #0xb8]
     194:      	str	x24, [sp, #0xc0]
     198:      	str	x25, [sp, #0xc8]
     19c:      	str	x26, [sp, #0xd0]
     1a0:      	str	x27, [sp, #0xd8]
     1a4:      	str	x28, [sp, #0xe0]
     1a8:      	add	x1, x0, #0x78
     1ac:      	ldr	x2, [x0, #0x8]
     1b0:      	ldr	x1, [x1, #0x8]
     1b4:      	cmp	x2, x1
     1b8:      	b.ne	0x1e8 <_stogir.verify.structure+0x78>
     1bc:      	adrp	x19, 0x0 <_gap_verify_graph>
		00000000000001bc:  ARM64_RELOC_PAGE21	l_stogir.311
     1c0:      	ldr	x19, [x19]
		00000000000001c0:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     1c4:      	movz	x20, #0x0, lsl #48
     1c8:      	b	0x1f4 <_stogir.verify.structure+0x84>
     1cc:      	ldr	x0, [sp, #0x68]
     1d0:      	ldr	x1, [sp, #0x70]
     1d4:      	add	x0, x1, x0
     1d8:      	ldr	x1, [sp, #0x60]
     1dc:      	add	x1, x1, #0x1
     1e0:      	sxtw	x1, w1
     1e4:      	b	0x21c <_stogir.verify.structure+0xac>
     1e8:      	adrp	x19, 0x0 <_gap_verify_graph>
		00000000000001e8:  ARM64_RELOC_PAGE21	l_stogir.312
     1ec:      	ldr	x19, [x19]
		00000000000001ec:  ARM64_RELOC_PAGEOFF12	l_stogir.312
     1f0:      	mov	x20, #0x2c              ; =44
     1f4:      	add	x21, x0, #0x110
     1f8:      	add	x22, x21, #0x28
     1fc:      	mov	x23, #0x1               ; =1
     200:      	movz	x24, #0x0, lsl #48
     204:      	b	0x25c <_stogir.verify.structure+0xec>
     208:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000208:  ARM64_RELOC_PAGE21	l_stogir.313
     20c:      	ldr	x16, [x16]
		000000000000020c:  ARM64_RELOC_PAGEOFF12	l_stogir.313
     210:      	str	x16, [sp, #0x48]
     214:      	mov	x16, #0x16              ; =22
     218:      	str	x16, [sp, #0x58]
     21c:      	b	0x244 <_stogir.verify.structure+0xd4>
     220:      	mov	x1, x24
     224:      	str	x8, [sp, #0x40]
     228:      	str	x0, [sp, #0x38]
     22c:      	mov	x0, x23
     230:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000230:  ARM64_RELOC_PAGE21	l_stogir.314
     234:      	ldr	x16, [x16]
		0000000000000234:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     238:      	str	x16, [sp, #0x48]
     23c:      	mov	x16, #0x23              ; =35
     240:      	str	x16, [sp, #0x58]
     244:      	ldr	x8, [sp, #0x40]
     248:      	mov	x23, x0
     24c:      	ldr	x0, [sp, #0x38]
     250:      	mov	x24, x1
     254:      	ldr	x19, [sp, #0x48]
     258:      	ldr	x20, [sp, #0x58]
     25c:      	cmp	x20, #0x0
     260:      	b.ne	0x91c <_stogir.verify.structure+0x7ac>
     264:      	ldr	x1, [x0, #0x8]
     268:      	cmp	x23, x1
     26c:      	b.ge	0x930 <_stogir.verify.structure+0x7c0>
     270:      	ldr	x1, [x0]
     274:      	add	x1, x1, x23, lsl #4
     278:      	ldr	x1, [x1]
     27c:      	ldr	x2, [x0, #0x78]
     280:      	ldr	w2, [x2, x23, lsl #2]
     284:      	sxtw	x25, w2
     288:      	cmp	x25, #0x0
     28c:      	b.lt	0x220 <_stogir.verify.structure+0xb0>
     290:      	mov	x17, #0xffff            ; =65535
     294:      	cmp	x25, x17
     298:      	b.gt	0x944 <_stogir.verify.structure+0x7d4>
     29c:      	uxtb	w2, w1
     2a0:      	orr	x26, x2, xzr
     2a4:      	cmp	x26, #0x83
     2a8:      	cset	w27, lt
     2ac:      	uxtb	w16, w27
     2b0:      	cmp	w16, wzr
     2b4:      	b.eq	0x958 <_stogir.verify.structure+0x7e8>
     2b8:      	ubfx	x1, x1, #0, #32
     2bc:      	ubfx	x2, x1, #8, #8
     2c0:      	orr	x3, x2, xzr
     2c4:      	cmp	x3, #0xd
     2c8:      	b.le	0x2f4 <_stogir.verify.structure+0x184>
     2cc:      	cmp	x3, #0xf
     2d0:      	b.le	0x96c <_stogir.verify.structure+0x7fc>
     2d4:      	cmp	x3, #0x80
     2d8:      	b.ge	0x980 <_stogir.verify.structure+0x810>
     2dc:      	and	w2, w2, #0xf
     2e0:      	ubfx	x2, x2, #0, #32
     2e4:      	cmp	x2, #0x1
     2e8:      	b.lt	0x994 <_stogir.verify.structure+0x824>
     2ec:      	cmp	x2, #0xd
     2f0:      	b.gt	0x9a8 <_stogir.verify.structure+0x838>
     2f4:      	uxtb	w16, w27
     2f8:      	cmp	w16, wzr
     2fc:      	b.eq	0x778 <_stogir.verify.structure+0x608>
     300:      	adrp	x17, 0x0 <_gap_verify_graph>
		0000000000000300:  ARM64_RELOC_PAGE21	l_stogir.315
     304:      	ldr	x17, [x17]
		0000000000000304:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     308:      	ldrsb	w2, [x26, x17]
     30c:      	sxtb	w2, w2
     310:      	b	0x77c <_stogir.verify.structure+0x60c>
     314:      	ldr	x0, [sp, #0x58]
     318:      	cmp	x0, #0x0
     31c:      	b.ne	0x9bc <_stogir.verify.structure+0x84c>
     320:      	and	x1, x1, #0xffffffff
     324:      	movz	x2, #0x0, lsl #48
     328:      	movz	x0, #0x0, lsl #48
     32c:      	b	0x334 <_stogir.verify.structure+0x1c4>
     330:      	mov	x2, #0x1                ; =1
     334:      	ldr	x3, [sp, #0x40]
     338:      	str	x2, [x3]
     33c:      	str	x1, [x3, #0x8]
     340:      	str	x0, [x3, #0x10]
     344:      	ldr	x19, [sp, #0x98]
     348:      	ldr	x20, [sp, #0xa0]
     34c:      	ldr	x21, [sp, #0xa8]
     350:      	ldr	x22, [sp, #0xb0]
     354:      	ldr	x23, [sp, #0xb8]
     358:      	ldr	x24, [sp, #0xc0]
     35c:      	ldr	x25, [sp, #0xc8]
     360:      	ldr	x26, [sp, #0xd0]
     364:      	ldr	x27, [sp, #0xd8]
     368:      	ldr	x28, [sp, #0xe0]
     36c:      	ldr	x29, [sp, #0x10]
     370:      	ldr	x30, [sp, #0x18]
     374:      	add	sp, sp, #0xf0
     378:      	ret
     37c:      	mov	w12, w7
     380:      	lsl	w12, w12, #2
     384:      	ubfx	x12, x12, #0, #32
     388:      	lsr	x11, x11, x12
     38c:      	and	w11, w11, #0xf
     390:      	b	0x3bc <_stogir.verify.structure+0x24c>
     394:      	mov	w1, w25
     398:      	mov	x25, x0
     39c:      	ldr	x0, [sp, #0x38]
     3a0:      	bl	0x3a0 <_stogir.verify.structure+0x230>
		00000000000003a0:  ARM64_RELOC_BRANCH26	_stogir.graph.contains?
     3a4:      	cmp	x0, #0x0
     3a8:      	b.eq	0x808 <_stogir.verify.structure+0x698>
     3ac:      	ldr	w0, [sp, #0x90]
     3b0:      	ldr	w1, [sp, #0x88]
     3b4:      	b	0x45c <_stogir.verify.structure+0x2ec>
     3b8:      	movz	w11, #0x0, lsl #16
     3bc:      	b	0x3c4 <_stogir.verify.structure+0x254>
     3c0:      	movz	w11, #0x0, lsl #16
     3c4:      	str	x8, [sp, #0x40]
     3c8:      	str	x0, [sp, #0x38]
     3cc:      	str	w1, [sp, #0x50]
     3d0:      	str	x4, [sp, #0x78]
     3d4:      	str	x6, [sp, #0x80]
     3d8:      	str	x25, [sp, #0x30]
     3dc:      	mov	w25, w2
     3e0:      	mov	w2, w5
     3e4:      	str	x19, [sp, #0x48]
     3e8:      	mov	w19, w3
     3ec:      	str	x20, [sp, #0x58]
     3f0:      	mov	w20, w10
     3f4:      	str	x24, [sp, #0x60]
     3f8:      	mov	w24, w11
     3fc:      	str	x23, [sp, #0x68]
     400:      	mov	w23, w7
     404:      	str	x28, [sp, #0x70]
     408:      	mov	w28, w9
     40c:      	bl	0x40c <_stogir.verify.structure+0x29c>
		000000000000040c:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     410:      	ubfx	x0, x0, #0, #32
     414:      	lsr	x16, x0, #0
     418:      	cmp	x16, #0x1
     41c:      	b.eq	0x438 <_stogir.verify.structure+0x2c8>
     420:      	b.lo	0x428 <_stogir.verify.structure+0x2b8>
     424:      	b	0x43c <_stogir.verify.structure+0x2cc>
     428:      	cmp	x16, #0x0
     42c:      	b.eq	0x434 <_stogir.verify.structure+0x2c4>
     430:      	b	0x43c <_stogir.verify.structure+0x2cc>
     434:      	b	0x440 <_stogir.verify.structure+0x2d0>
     438:      	b	0x510 <_stogir.verify.structure+0x3a0>
     43c:      	b	0x89c <_stogir.verify.structure+0x72c>
     440:      	mov	w0, w25
     444:      	mov	w1, w19
     448:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000448:  ARM64_RELOC_PAGE21	l_stogir.316
     44c:      	ldr	x16, [x16]
		000000000000044c:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     450:      	str	x16, [sp, #0x48]
     454:      	mov	x16, #0x17              ; =23
     458:      	str	x16, [sp, #0x58]
     45c:      	ldr	x2, [sp, #0x78]
     460:      	add	x2, x2, #0x1
     464:      	sxtw	x2, w2
     468:      	ldr	x23, [sp, #0x68]
     46c:      	ldr	x24, [sp, #0x60]
     470:      	ldr	x8, [sp, #0x40]
     474:      	ldr	x25, [sp, #0x30]
     478:      	ldr	x28, [sp, #0x70]
     47c:      	mov	w3, w1
     480:      	ldr	w1, [sp, #0x50]
     484:      	mov	x4, x2
     488:      	mov	w2, w0
     48c:      	ldr	x0, [sp, #0x38]
     490:      	ldr	x19, [sp, #0x48]
     494:      	ldr	x20, [sp, #0x58]
     498:      	cmp	x20, #0x0
     49c:      	b.ne	0x4b0 <_stogir.verify.structure+0x340>
     4a0:      	cmp	x4, x25
     4a4:      	cset	w5, le
     4a8:      	ubfx	x5, x5, #0, #8
     4ac:      	b	0x4b4 <_stogir.verify.structure+0x344>
     4b0:      	movz	x5, #0x0, lsl #48
     4b4:      	cmp	x5, #0x0
     4b8:      	b.eq	0x9c4 <_stogir.verify.structure+0x854>
     4bc:      	orr	w5, w4, wzr
     4c0:      	sxtw	x6, w5
     4c4:      	sub	w7, w5, #0x1
     4c8:      	cmp	x6, #0x0
     4cc:      	cset	w9, gt
     4d0:      	cmp	x6, #0x4
     4d4:      	cset	w10, gt
     4d8:      	uxtb	w16, w27
     4dc:      	cmp	w16, wzr
     4e0:      	b.eq	0x3c0 <_stogir.verify.structure+0x250>
     4e4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000004e4:  ARM64_RELOC_PAGE21	l_stogir.317
     4e8:      	ldr	x16, [x16]
		00000000000004e8:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     4ec:      	ldr	w11, [x16, x26, lsl #2]
     4f0:      	uxtb	w16, w9
     4f4:      	cmp	w16, wzr
     4f8:      	b.eq	0x3b8 <_stogir.verify.structure+0x248>
     4fc:      	uxtb	w16, w10
     500:      	cmp	w16, wzr
     504:      	b.eq	0x37c <_stogir.verify.structure+0x20c>
     508:      	mov	w12, #0x4               ; =4
     50c:      	b	0x380 <_stogir.verify.structure+0x210>
     510:      	ubfx	x24, x24, #0, #32
     514:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000514:  ARM64_RELOC_PAGE21	l_stogir.318
     518:      	ldr	x16, [x16]
		0000000000000518:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     51c:      	ldr	w0, [x16]
     520:      	cmp	x24, x0
     524:      	b.ne	0x530 <_stogir.verify.structure+0x3c0>
     528:      	mov	x0, #0x1                ; =1
     52c:      	b	0x548 <_stogir.verify.structure+0x3d8>
     530:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000530:  ARM64_RELOC_PAGE21	l_stogir.319
     534:      	ldr	x16, [x16]
		0000000000000534:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     538:      	ldr	w0, [x16]
     53c:      	cmp	x24, x0
     540:      	cset	w0, eq
     544:      	ubfx	x0, x0, #0, #8
     548:      	cmp	x0, #0x0
     54c:      	b.eq	0x9e4 <_stogir.verify.structure+0x874>
     550:      	str	w19, [sp, #0x88]
     554:      	mov	x19, x0
     558:      	ldr	x0, [sp, #0x38]
     55c:      	str	w25, [sp, #0x90]
     560:      	mov	w25, w1
     564:      	bl	0x564 <_stogir.verify.structure+0x3f4>
		0000000000000564:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
     568:      	cmp	x0, #0x0
     56c:      	cset	w1, eq
     570:      	uxtb	w16, w1
     574:      	cmp	w16, wzr
     578:      	cset	x1, eq
     57c:      	cmp	x1, #0x0
     580:      	b.eq	0x5a8 <_stogir.verify.structure+0x438>
     584:      	ldr	w0, [x0]
     588:      	uxtb	w0, w0
     58c:      	cmp	x0, #0x48
     590:      	b.ne	0x5a8 <_stogir.verify.structure+0x438>
     594:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000594:  ARM64_RELOC_PAGE21	l_stogir.320
     598:      	ldr	x16, [x16]
		0000000000000598:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     59c:      	str	x16, [sp, #0x48]
     5a0:      	mov	x16, #0x25              ; =37
     5a4:      	str	x16, [sp, #0x58]
     5a8:      	b	0x5b0 <_stogir.verify.structure+0x440>
     5ac:      	movz	x1, #0x0, lsl #48
     5b0:      	sxtw	x0, w25
     5b4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000005b4:  ARM64_RELOC_PAGE21	l_stogir.321
     5b8:      	ldr	x16, [x16]
		00000000000005b8:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     5bc:      	ldr	w2, [x16]
     5c0:      	cmp	x24, x2
     5c4:      	b.ne	0x670 <_stogir.verify.structure+0x500>
     5c8:      	cmp	x0, #0x0
     5cc:      	b.le	0x628 <_stogir.verify.structure+0x4b8>
     5d0:      	ldr	x2, [x22, #0x8]
     5d4:      	cmp	x0, x2
     5d8:      	b.gt	0x628 <_stogir.verify.structure+0x4b8>
     5dc:      	sub	x2, x0, #0x1
     5e0:      	ldr	x3, [x21, #0x28]
     5e4:      	mov	x17, #0x18              ; =24
     5e8:      	mul	x2, x2, x17
     5ec:      	add	x4, x2, x3
     5f0:      	ldr	x2, [x2, x3]
     5f4:      	ldr	x3, [x4, #0x8]
     5f8:      	ldr	x4, [x21, #0x8]
     5fc:      	cmp	x2, #0x0
     600:      	b.lt	0x7c8 <_stogir.verify.structure+0x658>
     604:      	cmp	x2, x4
     608:      	b.gt	0x7c8 <_stogir.verify.structure+0x658>
     60c:      	cmp	x3, #0x0
     610:      	b.lt	0x7c8 <_stogir.verify.structure+0x658>
     614:      	sub	x2, x4, x2
     618:      	cmp	x3, x2
     61c:      	b.gt	0x7c8 <_stogir.verify.structure+0x658>
     620:      	mov	w2, #0x1                ; =1
     624:      	b	0x7cc <_stogir.verify.structure+0x65c>
     628:      	movz	w2, #0x0, lsl #16
     62c:      	ubfx	x2, x2, #0, #32
     630:      	lsr	x16, x2, #0
     634:      	cmp	x16, #0x1
     638:      	b.eq	0x654 <_stogir.verify.structure+0x4e4>
     63c:      	b.lo	0x644 <_stogir.verify.structure+0x4d4>
     640:      	b	0x658 <_stogir.verify.structure+0x4e8>
     644:      	cmp	x16, #0x0
     648:      	b.eq	0x650 <_stogir.verify.structure+0x4e0>
     64c:      	b	0x658 <_stogir.verify.structure+0x4e8>
     650:      	b	0x65c <_stogir.verify.structure+0x4ec>
     654:      	b	0x670 <_stogir.verify.structure+0x500>
     658:      	b	0x914 <_stogir.verify.structure+0x7a4>
     65c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000065c:  ARM64_RELOC_PAGE21	l_stogir.322
     660:      	ldr	x16, [x16]
		0000000000000660:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     664:      	str	x16, [sp, #0x48]
     668:      	mov	x16, #0x21              ; =33
     66c:      	str	x16, [sp, #0x58]
     670:      	cmp	x24, #0xf
     674:      	b.hs	0x9f8 <_stogir.verify.structure+0x888>
     678:      	mov	x16, #0x1               ; =1
     67c:      	lsl	x2, x16, x24
     680:      	mov	w17, #0x5e1c            ; =24092
     684:      	and	w2, w2, w17
     688:      	ubfx	x2, x2, #0, #32
     68c:      	cmp	x2, #0x0
     690:      	b.eq	0xa04 <_stogir.verify.structure+0x894>
     694:      	cmp	x19, #0x0
     698:      	b.eq	0x394 <_stogir.verify.structure+0x224>
     69c:      	mov	x25, x0
     6a0:      	mov	x0, x1
     6a4:      	b	0x3a4 <_stogir.verify.structure+0x234>
     6a8:      	orr	w1, w23, wzr
     6ac:      	cmp	x26, #0x78
     6b0:      	cset	w2, eq
     6b4:      	cmp	x3, #0x0
     6b8:      	cset	w3, eq
     6bc:      	mov	x4, #0x1                ; =1
     6c0:      	b	0x498 <_stogir.verify.structure+0x328>
     6c4:      	nop
     6c8:      	movz	x2, #0x0, lsl #48
     6cc:      	cmp	x2, #0x0
     6d0:      	b.eq	0x6a8 <_stogir.verify.structure+0x538>
     6d4:      	add	x2, x1, x23
     6d8:      	ldr	x4, [x0, #0x78]
     6dc:      	ldr	w2, [x4, x2, lsl #2]
     6e0:      	sxtw	x2, w2
     6e4:      	cmn	x2, #0x1
     6e8:      	b.eq	0x6f8 <_stogir.verify.structure+0x588>
     6ec:      	adrp	x19, 0x0 <_gap_verify_graph>
		00000000000006ec:  ARM64_RELOC_PAGE21	l_stogir.323
     6f0:      	ldr	x19, [x19]
		00000000000006f0:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     6f4:      	mov	x20, #0x1b              ; =27
     6f8:      	add	x1, x1, #0x1
     6fc:      	cmp	x20, #0x0
     700:      	b.ne	0x6c8 <_stogir.verify.structure+0x558>
     704:      	cmp	x1, x28
     708:      	cset	w2, lt
     70c:      	ubfx	x2, x2, #0, #8
     710:      	b	0x6cc <_stogir.verify.structure+0x55c>
     714:      	mov	w2, #-0x2               ; =-2
     718:      	sxtw	x2, w2
     71c:      	cmn	x2, #0x1
     720:      	b.ne	0x73c <_stogir.verify.structure+0x5cc>
     724:      	ubfx	x1, x1, #16, #16
     728:      	cmp	x25, x1
     72c:      	b.eq	0x73c <_stogir.verify.structure+0x5cc>
     730:      	adrp	x19, 0x0 <_gap_verify_graph>
		0000000000000730:  ARM64_RELOC_PAGE21	l_stogir.324
     734:      	ldr	x19, [x19]
		0000000000000734:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     738:      	mov	x20, #0x24              ; =36
     73c:      	add	x1, x25, #0x4
     740:      	ldr	x2, [x0, #0x8]
     744:      	asr	x16, x1, #63
     748:      	lsr	x16, x16, #62
     74c:      	add	x1, x1, x16
     750:      	asr	x1, x1, #2
     754:      	orr	x28, x1, xzr
     758:      	add	x1, x28, x23
     75c:      	cmp	x1, x2
     760:      	b.le	0x770 <_stogir.verify.structure+0x600>
     764:      	adrp	x19, 0x0 <_gap_verify_graph>
		0000000000000764:  ARM64_RELOC_PAGE21	l_stogir.325
     768:      	ldr	x19, [x19]
		0000000000000768:  ARM64_RELOC_PAGEOFF12	l_stogir.325
     76c:      	mov	x20, #0x15              ; =21
     770:      	mov	x1, #0x1                ; =1
     774:      	b	0x6fc <_stogir.verify.structure+0x58c>
     778:      	mov	w2, #-0x2               ; =-2
     77c:      	sxtw	x2, w2
     780:      	cmp	x2, #0x0
     784:      	b.lt	0x7a8 <_stogir.verify.structure+0x638>
     788:      	uxtb	w16, w27
     78c:      	cmp	w16, wzr
     790:      	b.eq	0x7d0 <_stogir.verify.structure+0x660>
     794:      	adrp	x17, 0x0 <_gap_verify_graph>
		0000000000000794:  ARM64_RELOC_PAGE21	l_stogir.315
     798:      	ldr	x17, [x17]
		0000000000000798:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     79c:      	ldrsb	w2, [x26, x17]
     7a0:      	sxtb	w2, w2
     7a4:      	b	0x7d4 <_stogir.verify.structure+0x664>
     7a8:      	uxtb	w16, w27
     7ac:      	cmp	w16, wzr
     7b0:      	b.eq	0x714 <_stogir.verify.structure+0x5a4>
     7b4:      	adrp	x17, 0x0 <_gap_verify_graph>
		00000000000007b4:  ARM64_RELOC_PAGE21	l_stogir.326
     7b8:      	ldr	x17, [x17]
		00000000000007b8:  ARM64_RELOC_PAGEOFF12	l_stogir.326
     7bc:      	ldrsb	w2, [x26, x17]
     7c0:      	sxtb	w2, w2
     7c4:      	b	0x718 <_stogir.verify.structure+0x5a8>
     7c8:      	movz	w2, #0x0, lsl #16
     7cc:      	b	0x62c <_stogir.verify.structure+0x4bc>
     7d0:      	mov	w2, #-0x2               ; =-2
     7d4:      	sxtw	x2, w2
     7d8:      	cmp	x25, x2
     7dc:      	b.eq	0x7a8 <_stogir.verify.structure+0x638>
     7e0:      	str	x8, [sp, #0x40]
     7e4:      	str	x0, [sp, #0x38]
     7e8:      	mov	x0, x23
     7ec:      	mov	x1, x24
     7f0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000007f0:  ARM64_RELOC_PAGE21	l_stogir.327
     7f4:      	ldr	x16, [x16]
		00000000000007f4:  ARM64_RELOC_PAGEOFF12	l_stogir.327
     7f8:      	str	x16, [sp, #0x48]
     7fc:      	mov	x16, #0x23              ; =35
     800:      	str	x16, [sp, #0x58]
     804:      	b	0x1e4 <_stogir.verify.structure+0x74>
     808:      	cmp	x25, #0x0
     80c:      	b.ne	0xa10 <_stogir.verify.structure+0x8a0>
     810:      	uxtb	w16, w27
     814:      	cmp	w16, wzr
     818:      	b.eq	0x8a4 <_stogir.verify.structure+0x734>
     81c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000081c:  ARM64_RELOC_PAGE21	l_stogir.317
     820:      	ldr	x16, [x16]
		0000000000000820:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     824:      	ldr	w0, [x16, x26, lsl #2]
     828:      	uxtb	w16, w28
     82c:      	cmp	w16, wzr
     830:      	b.eq	0x8ec <_stogir.verify.structure+0x77c>
     834:      	uxtb	w16, w20
     838:      	cmp	w16, wzr
     83c:      	b.eq	0x844 <_stogir.verify.structure+0x6d4>
     840:      	mov	w23, #0x4               ; =4
     844:      	lsl	w1, w23, #2
     848:      	ubfx	x1, x1, #0, #32
     84c:      	lsr	x0, x0, x1
     850:      	and	w0, w0, #0xf
     854:      	b	0x8f0 <_stogir.verify.structure+0x780>
     858:      	ldr	w0, [sp, #0x90]
     85c:      	uxtb	w16, w0
     860:      	cmp	w16, wzr
     864:      	b.eq	0xa1c <_stogir.verify.structure+0x8ac>
     868:      	ldr	w1, [sp, #0x88]
     86c:      	uxtb	w16, w1
     870:      	cmp	w16, wzr
     874:      	b.eq	0x884 <_stogir.verify.structure+0x714>
     878:      	ldr	x5, [sp, #0x80]
     87c:      	cmp	x5, #0x2
     880:      	b.eq	0x3b4 <_stogir.verify.structure+0x244>
     884:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000884:  ARM64_RELOC_PAGE21	l_stogir.328
     888:      	ldr	x16, [x16]
		0000000000000888:  ARM64_RELOC_PAGEOFF12	l_stogir.328
     88c:      	str	x16, [sp, #0x48]
     890:      	mov	x16, #0x1a              ; =26
     894:      	str	x16, [sp, #0x58]
     898:      	b	0x3b4 <_stogir.verify.structure+0x244>
     89c:      	brk	#0
     8a0:      	b	0x89c <_stogir.verify.structure+0x72c>
     8a4:      	movz	w0, #0x0, lsl #16
     8a8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000008a8:  ARM64_RELOC_PAGE21	l_stogir.329
     8ac:      	ldr	x16, [x16]
		00000000000008ac:  ARM64_RELOC_PAGEOFF12	l_stogir.329
     8b0:      	ldr	w1, [x16]
     8b4:      	ubfx	x0, x0, #0, #32
     8b8:      	cmp	x0, x1
     8bc:      	b.ne	0x8cc <_stogir.verify.structure+0x75c>
     8c0:      	ldr	w0, [sp, #0x90]
     8c4:      	ldr	w1, [sp, #0x88]
     8c8:      	b	0x3b4 <_stogir.verify.structure+0x244>
     8cc:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000008cc:  ARM64_RELOC_PAGE21	l_stogir.330
     8d0:      	ldr	x16, [x16]
		00000000000008d0:  ARM64_RELOC_PAGEOFF12	l_stogir.330
     8d4:      	ldr	w1, [x16]
     8d8:      	cmp	x0, x1
     8dc:      	b.ne	0x8f4 <_stogir.verify.structure+0x784>
     8e0:      	ldr	w0, [sp, #0x90]
     8e4:      	ldr	w1, [sp, #0x88]
     8e8:      	b	0x3b4 <_stogir.verify.structure+0x244>
     8ec:      	movz	w0, #0x0, lsl #16
     8f0:      	b	0x8a8 <_stogir.verify.structure+0x738>
     8f4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000008f4:  ARM64_RELOC_PAGE21	l_stogir.331
     8f8:      	ldr	x16, [x16]
		00000000000008f8:  ARM64_RELOC_PAGEOFF12	l_stogir.331
     8fc:      	ldr	w1, [x16]
     900:      	cmp	x0, x1
     904:      	b.ne	0x858 <_stogir.verify.structure+0x6e8>
     908:      	ldr	w0, [sp, #0x90]
     90c:      	ldr	w1, [sp, #0x88]
     910:      	b	0x3b4 <_stogir.verify.structure+0x244>
     914:      	brk	#0
     918:      	b	0x914 <_stogir.verify.structure+0x7a4>
     91c:      	mov	x1, x24
     920:      	str	x8, [sp, #0x40]
     924:      	str	x19, [sp, #0x48]
     928:      	str	x20, [sp, #0x58]
     92c:      	b	0x314 <_stogir.verify.structure+0x1a4>
     930:      	mov	x1, x24
     934:      	str	x8, [sp, #0x40]
     938:      	str	x19, [sp, #0x48]
     93c:      	str	x20, [sp, #0x58]
     940:      	b	0x314 <_stogir.verify.structure+0x1a4>
     944:      	mov	x1, x24
     948:      	str	x8, [sp, #0x40]
     94c:      	str	x0, [sp, #0x38]
     950:      	mov	x0, x23
     954:      	b	0x230 <_stogir.verify.structure+0xc0>
     958:      	mov	x1, x24
     95c:      	str	x8, [sp, #0x40]
     960:      	str	x0, [sp, #0x38]
     964:      	mov	x0, x23
     968:      	b	0x208 <_stogir.verify.structure+0x98>
     96c:      	mov	x1, x24
     970:      	str	x8, [sp, #0x40]
     974:      	str	x0, [sp, #0x38]
     978:      	mov	x0, x23
     97c:      	b	0x208 <_stogir.verify.structure+0x98>
     980:      	mov	x1, x24
     984:      	str	x8, [sp, #0x40]
     988:      	str	x0, [sp, #0x38]
     98c:      	mov	x0, x23
     990:      	b	0x208 <_stogir.verify.structure+0x98>
     994:      	mov	x1, x24
     998:      	str	x8, [sp, #0x40]
     99c:      	str	x0, [sp, #0x38]
     9a0:      	mov	x0, x23
     9a4:      	b	0x208 <_stogir.verify.structure+0x98>
     9a8:      	mov	x1, x24
     9ac:      	str	x8, [sp, #0x40]
     9b0:      	str	x0, [sp, #0x38]
     9b4:      	mov	x0, x23
     9b8:      	b	0x208 <_stogir.verify.structure+0x98>
     9bc:      	ldr	x1, [sp, #0x48]
     9c0:      	b	0x330 <_stogir.verify.structure+0x1c0>
     9c4:      	str	x23, [sp, #0x68]
     9c8:      	str	x24, [sp, #0x60]
     9cc:      	str	x8, [sp, #0x40]
     9d0:      	str	x0, [sp, #0x38]
     9d4:      	str	x28, [sp, #0x70]
     9d8:      	str	x19, [sp, #0x48]
     9dc:      	str	x20, [sp, #0x58]
     9e0:      	b	0x1cc <_stogir.verify.structure+0x5c>
     9e4:      	str	w25, [sp, #0x90]
     9e8:      	mov	w25, w1
     9ec:      	str	w19, [sp, #0x88]
     9f0:      	mov	x19, x0
     9f4:      	b	0x5ac <_stogir.verify.structure+0x43c>
     9f8:      	ldr	w0, [sp, #0x90]
     9fc:      	ldr	w1, [sp, #0x88]
     a00:      	b	0x3b4 <_stogir.verify.structure+0x244>
     a04:      	ldr	w0, [sp, #0x90]
     a08:      	ldr	w1, [sp, #0x88]
     a0c:      	b	0x3b4 <_stogir.verify.structure+0x244>
     a10:      	ldr	w0, [sp, #0x90]
     a14:      	ldr	w1, [sp, #0x88]
     a18:      	b	0x884 <_stogir.verify.structure+0x714>
     a1c:      	ldr	w1, [sp, #0x88]
     a20:      	b	0x884 <_stogir.verify.structure+0x714>
