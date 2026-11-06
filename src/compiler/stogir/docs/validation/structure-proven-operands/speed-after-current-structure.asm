
build/structure-speed/after.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000170 <_stogir.verify.structure>:
     170:      	sub	sp, sp, #0xd0
     174:      	str	x29, [sp]
     178:      	str	x30, [sp, #0x8]
     17c:      	mov	x29, sp
     180:      	str	x19, [sp, #0x78]
     184:      	str	x20, [sp, #0x80]
     188:      	str	x21, [sp, #0x88]
     18c:      	str	x22, [sp, #0x90]
     190:      	str	x23, [sp, #0x98]
     194:      	str	x24, [sp, #0xa0]
     198:      	str	x25, [sp, #0xa8]
     19c:      	str	x26, [sp, #0xb0]
     1a0:      	str	x27, [sp, #0xb8]
     1a4:      	str	x28, [sp, #0xc0]
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
     1cc:      	ldr	x0, [sp, #0x48]
     1d0:      	ldr	x1, [sp, #0x50]
     1d4:      	add	x0, x1, x0
     1d8:      	ldr	x1, [sp, #0x40]
     1dc:      	add	x1, x1, #0x1
     1e0:      	sxtw	x1, w1
     1e4:      	b	0x240 <_stogir.verify.structure+0xd0>
     1e8:      	adrp	x19, 0x0 <_gap_verify_graph>
		00000000000001e8:  ARM64_RELOC_PAGE21	l_stogir.312
     1ec:      	ldr	x19, [x19]
		00000000000001ec:  ARM64_RELOC_PAGEOFF12	l_stogir.312
     1f0:      	mov	x20, #0x2c              ; =44
     1f4:      	cmp	x20, #0x0
     1f8:      	b.ne	0x218 <_stogir.verify.structure+0xa8>
     1fc:      	ldr	x1, [x0, #0x8]
     200:      	mov	x17, #0x80000000        ; =2147483648
     204:      	cmp	x1, x17
     208:      	b.le	0x218 <_stogir.verify.structure+0xa8>
     20c:      	adrp	x19, 0x0 <_gap_verify_graph>
		000000000000020c:  ARM64_RELOC_PAGE21	l_stogir.313
     210:      	ldr	x19, [x19]
		0000000000000210:  ARM64_RELOC_PAGEOFF12	l_stogir.313
     214:      	mov	x20, #0x33              ; =51
     218:      	add	x21, x0, #0x110
     21c:      	add	x22, x21, #0x28
     220:      	mov	x23, #0x1               ; =1
     224:      	movz	x24, #0x0, lsl #48
     228:      	b	0x284 <_stogir.verify.structure+0x114>
     22c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000022c:  ARM64_RELOC_PAGE21	l_stogir.314
     230:      	ldr	x16, [x16]
		0000000000000230:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     234:      	str	x16, [sp, #0x30]
     238:      	mov	x16, #0x16              ; =22
     23c:      	str	x16, [sp, #0x38]
     240:      	b	0x26c <_stogir.verify.structure+0xfc>
     244:      	nop
     248:      	mov	x1, x24
     24c:      	str	x8, [sp, #0x28]
     250:      	str	x0, [sp, #0x18]
     254:      	mov	x0, x23
     258:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000258:  ARM64_RELOC_PAGE21	l_stogir.315
     25c:      	ldr	x16, [x16]
		000000000000025c:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     260:      	str	x16, [sp, #0x30]
     264:      	mov	x16, #0x23              ; =35
     268:      	str	x16, [sp, #0x38]
     26c:      	ldr	x8, [sp, #0x28]
     270:      	mov	x23, x0
     274:      	ldr	x0, [sp, #0x18]
     278:      	mov	x24, x1
     27c:      	ldr	x19, [sp, #0x30]
     280:      	ldr	x20, [sp, #0x38]
     284:      	cmp	x20, #0x0
     288:      	b.ne	0x8e8 <_stogir.verify.structure+0x778>
     28c:      	ldr	x1, [x0, #0x8]
     290:      	cmp	x23, x1
     294:      	b.ge	0x8fc <_stogir.verify.structure+0x78c>
     298:      	ldr	x1, [x0]
     29c:      	add	x1, x1, x23, lsl #4
     2a0:      	ldr	x1, [x1]
     2a4:      	ldr	x2, [x0, #0x78]
     2a8:      	ldr	w2, [x2, x23, lsl #2]
     2ac:      	sxtw	x25, w2
     2b0:      	cmp	x25, #0x0
     2b4:      	b.lt	0x248 <_stogir.verify.structure+0xd8>
     2b8:      	mov	x17, #0xffff            ; =65535
     2bc:      	cmp	x25, x17
     2c0:      	b.gt	0x910 <_stogir.verify.structure+0x7a0>
     2c4:      	uxtb	w2, w1
     2c8:      	orr	x26, x2, xzr
     2cc:      	cmp	x26, #0x83
     2d0:      	cset	w27, lt
     2d4:      	uxtb	w16, w27
     2d8:      	cmp	w16, wzr
     2dc:      	b.eq	0x924 <_stogir.verify.structure+0x7b4>
     2e0:      	ubfx	x1, x1, #0, #32
     2e4:      	ubfx	x2, x1, #8, #8
     2e8:      	orr	x3, x2, xzr
     2ec:      	cmp	x3, #0xd
     2f0:      	b.le	0x31c <_stogir.verify.structure+0x1ac>
     2f4:      	cmp	x3, #0xf
     2f8:      	b.le	0x938 <_stogir.verify.structure+0x7c8>
     2fc:      	cmp	x3, #0x80
     300:      	b.ge	0x94c <_stogir.verify.structure+0x7dc>
     304:      	and	w2, w2, #0xf
     308:      	ubfx	x2, x2, #0, #32
     30c:      	cmp	x2, #0x1
     310:      	b.lt	0x960 <_stogir.verify.structure+0x7f0>
     314:      	cmp	x2, #0xd
     318:      	b.gt	0x974 <_stogir.verify.structure+0x804>
     31c:      	uxtb	w16, w27
     320:      	cmp	w16, wzr
     324:      	b.eq	0x7a4 <_stogir.verify.structure+0x634>
     328:      	adrp	x17, 0x0 <_gap_verify_graph>
		0000000000000328:  ARM64_RELOC_PAGE21	l_stogir.316
     32c:      	ldr	x17, [x17]
		000000000000032c:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     330:      	ldrsb	w2, [x26, x17]
     334:      	sxtb	w2, w2
     338:      	b	0x7a8 <_stogir.verify.structure+0x638>
     33c:      	ldr	x0, [sp, #0x38]
     340:      	cmp	x0, #0x0
     344:      	b.ne	0x988 <_stogir.verify.structure+0x818>
     348:      	and	x1, x1, #0xffffffff
     34c:      	movz	x2, #0x0, lsl #48
     350:      	movz	x0, #0x0, lsl #48
     354:      	b	0x35c <_stogir.verify.structure+0x1ec>
     358:      	mov	x2, #0x1                ; =1
     35c:      	ldr	x3, [sp, #0x28]
     360:      	str	x2, [x3]
     364:      	str	x1, [x3, #0x8]
     368:      	str	x0, [x3, #0x10]
     36c:      	ldr	x19, [sp, #0x78]
     370:      	ldr	x20, [sp, #0x80]
     374:      	ldr	x21, [sp, #0x88]
     378:      	ldr	x22, [sp, #0x90]
     37c:      	ldr	x23, [sp, #0x98]
     380:      	ldr	x24, [sp, #0xa0]
     384:      	ldr	x25, [sp, #0xa8]
     388:      	ldr	x26, [sp, #0xb0]
     38c:      	ldr	x27, [sp, #0xb8]
     390:      	ldr	x28, [sp, #0xc0]
     394:      	ldr	x29, [sp]
     398:      	ldr	x30, [sp, #0x8]
     39c:      	add	sp, sp, #0xd0
     3a0:      	ret
     3a4:      	movz	w2, #0x0, lsl #16
     3a8:      	b	0x600 <_stogir.verify.structure+0x490>
     3ac:      	mov	w1, w19
     3b0:      	mov	x19, x0
     3b4:      	ldr	x0, [sp, #0x18]
     3b8:      	bl	0x3b8 <_stogir.verify.structure+0x248>
		00000000000003b8:  ARM64_RELOC_BRANCH26	_stogir.graph.contains?
     3bc:      	cmp	x0, #0x0
     3c0:      	b.eq	0x754 <_stogir.verify.structure+0x5e4>
     3c4:      	ldr	w0, [sp, #0x70]
     3c8:      	ldr	w1, [sp, #0x68]
     3cc:      	ldr	x2, [sp, #0x58]
     3d0:      	add	x2, x2, #0x1
     3d4:      	sxtw	x2, w2
     3d8:      	ldr	x23, [sp, #0x48]
     3dc:      	ldr	x24, [sp, #0x40]
     3e0:      	ldr	x8, [sp, #0x28]
     3e4:      	ldr	x25, [sp, #0x10]
     3e8:      	ldr	x28, [sp, #0x50]
     3ec:      	mov	w3, w1
     3f0:      	ldr	x1, [sp, #0x20]
     3f4:      	mov	x4, x2
     3f8:      	mov	w2, w0
     3fc:      	ldr	x0, [sp, #0x18]
     400:      	ldr	x19, [sp, #0x30]
     404:      	ldr	x20, [sp, #0x38]
     408:      	cmp	x20, #0x0
     40c:      	b.ne	0x420 <_stogir.verify.structure+0x2b0>
     410:      	cmp	x4, x25
     414:      	cset	w5, le
     418:      	ubfx	x5, x5, #0, #8
     41c:      	b	0x424 <_stogir.verify.structure+0x2b4>
     420:      	movz	x5, #0x0, lsl #48
     424:      	cmp	x5, #0x0
     428:      	b.eq	0x990 <_stogir.verify.structure+0x820>
     42c:      	orr	w5, w4, wzr
     430:      	sxtw	x6, w5
     434:      	sub	w7, w5, #0x1
     438:      	cmp	x6, #0x0
     43c:      	cset	w9, gt
     440:      	cmp	x6, #0x4
     444:      	cset	w10, gt
     448:      	uxtb	w16, w9
     44c:      	cmp	w16, wzr
     450:      	b.eq	0x480 <_stogir.verify.structure+0x310>
     454:      	uxtb	w16, w10
     458:      	cmp	w16, wzr
     45c:      	b.eq	0x468 <_stogir.verify.structure+0x2f8>
     460:      	mov	w11, #0x4               ; =4
     464:      	b	0x46c <_stogir.verify.structure+0x2fc>
     468:      	mov	w11, w7
     46c:      	lsl	w11, w11, #2
     470:      	ubfx	x11, x11, #0, #32
     474:      	lsr	x11, x1, x11
     478:      	and	w11, w11, #0xf
     47c:      	b	0x484 <_stogir.verify.structure+0x314>
     480:      	movz	w11, #0x0, lsl #16
     484:      	ubfx	x12, x5, #0, #32
     488:      	and	w5, w5, #0x3
     48c:      	ubfx	x5, x5, #0, #32
     490:      	ldr	x13, [x0]
     494:      	ubfx	x12, x12, #2, #32
     498:      	ubfx	x11, x11, #0, #32
     49c:      	ubfx	x12, x12, #0, #32
     4a0:      	add	x12, x12, x23
     4a4:      	add	x12, x13, x12, lsl #4
     4a8:      	ldr	w5, [x12, x5, lsl #2]
     4ac:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000004ac:  ARM64_RELOC_PAGE21	l_stogir.317
     4b0:      	ldr	x16, [x16]
		00000000000004b0:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     4b4:      	ldr	w12, [x16]
     4b8:      	cmp	x11, x12
     4bc:      	b.ne	0x4c8 <_stogir.verify.structure+0x358>
     4c0:      	mov	x12, #0x1               ; =1
     4c4:      	b	0x4e0 <_stogir.verify.structure+0x370>
     4c8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000004c8:  ARM64_RELOC_PAGE21	l_stogir.318
     4cc:      	ldr	x16, [x16]
		00000000000004cc:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     4d0:      	ldr	w12, [x16]
     4d4:      	cmp	x11, x12
     4d8:      	cset	w12, eq
     4dc:      	ubfx	x12, x12, #0, #8
     4e0:      	cmp	x12, #0x0
     4e4:      	b.eq	0x9b0 <_stogir.verify.structure+0x840>
     4e8:      	str	x8, [sp, #0x28]
     4ec:      	str	x0, [sp, #0x18]
     4f0:      	str	x1, [sp, #0x20]
     4f4:      	mov	w1, w5
     4f8:      	str	w2, [sp, #0x70]
     4fc:      	str	w3, [sp, #0x68]
     500:      	str	x4, [sp, #0x58]
     504:      	str	x6, [sp, #0x60]
     508:      	str	x25, [sp, #0x10]
     50c:      	mov	x25, x12
     510:      	str	x19, [sp, #0x30]
     514:      	mov	w19, w5
     518:      	str	x20, [sp, #0x38]
     51c:      	mov	w20, w10
     520:      	str	x24, [sp, #0x40]
     524:      	mov	x24, x11
     528:      	str	x23, [sp, #0x48]
     52c:      	mov	w23, w7
     530:      	str	x28, [sp, #0x50]
     534:      	mov	w28, w9
     538:      	bl	0x538 <_stogir.verify.structure+0x3c8>
		0000000000000538:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
     53c:      	cmp	x0, #0x0
     540:      	cset	w1, eq
     544:      	uxtb	w16, w1
     548:      	cmp	w16, wzr
     54c:      	cset	x1, eq
     550:      	cmp	x1, #0x0
     554:      	b.eq	0x57c <_stogir.verify.structure+0x40c>
     558:      	ldr	w0, [x0]
     55c:      	uxtb	w0, w0
     560:      	cmp	x0, #0x48
     564:      	b.ne	0x57c <_stogir.verify.structure+0x40c>
     568:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000568:  ARM64_RELOC_PAGE21	l_stogir.319
     56c:      	ldr	x16, [x16]
		000000000000056c:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     570:      	str	x16, [sp, #0x30]
     574:      	mov	x16, #0x25              ; =37
     578:      	str	x16, [sp, #0x38]
     57c:      	b	0x584 <_stogir.verify.structure+0x414>
     580:      	movz	x1, #0x0, lsl #48
     584:      	sxtw	x0, w19
     588:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000588:  ARM64_RELOC_PAGE21	l_stogir.320
     58c:      	ldr	x16, [x16]
		000000000000058c:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     590:      	ldr	w2, [x16]
     594:      	cmp	x24, x2
     598:      	b.ne	0x644 <_stogir.verify.structure+0x4d4>
     59c:      	cmp	x0, #0x0
     5a0:      	b.le	0x5fc <_stogir.verify.structure+0x48c>
     5a4:      	ldr	x2, [x22, #0x8]
     5a8:      	cmp	x0, x2
     5ac:      	b.gt	0x5fc <_stogir.verify.structure+0x48c>
     5b0:      	sub	x2, x0, #0x1
     5b4:      	ldr	x3, [x21, #0x28]
     5b8:      	mov	x17, #0x18              ; =24
     5bc:      	mul	x2, x2, x17
     5c0:      	add	x4, x2, x3
     5c4:      	ldr	x2, [x2, x3]
     5c8:      	ldr	x3, [x4, #0x8]
     5cc:      	ldr	x4, [x21, #0x8]
     5d0:      	cmp	x2, #0x0
     5d4:      	b.lt	0x3a4 <_stogir.verify.structure+0x234>
     5d8:      	cmp	x2, x4
     5dc:      	b.gt	0x3a4 <_stogir.verify.structure+0x234>
     5e0:      	cmp	x3, #0x0
     5e4:      	b.lt	0x3a4 <_stogir.verify.structure+0x234>
     5e8:      	sub	x2, x4, x2
     5ec:      	cmp	x3, x2
     5f0:      	b.gt	0x3a4 <_stogir.verify.structure+0x234>
     5f4:      	mov	w2, #0x1                ; =1
     5f8:      	b	0x3a8 <_stogir.verify.structure+0x238>
     5fc:      	movz	w2, #0x0, lsl #16
     600:      	ubfx	x2, x2, #0, #32
     604:      	lsr	x16, x2, #0
     608:      	cmp	x16, #0x1
     60c:      	b.eq	0x628 <_stogir.verify.structure+0x4b8>
     610:      	b.lo	0x618 <_stogir.verify.structure+0x4a8>
     614:      	b	0x62c <_stogir.verify.structure+0x4bc>
     618:      	cmp	x16, #0x0
     61c:      	b.eq	0x624 <_stogir.verify.structure+0x4b4>
     620:      	b	0x62c <_stogir.verify.structure+0x4bc>
     624:      	b	0x630 <_stogir.verify.structure+0x4c0>
     628:      	b	0x644 <_stogir.verify.structure+0x4d4>
     62c:      	b	0x8e0 <_stogir.verify.structure+0x770>
     630:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000630:  ARM64_RELOC_PAGE21	l_stogir.321
     634:      	ldr	x16, [x16]
		0000000000000634:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     638:      	str	x16, [sp, #0x30]
     63c:      	mov	x16, #0x21              ; =33
     640:      	str	x16, [sp, #0x38]
     644:      	cmp	x24, #0xf
     648:      	b.hs	0xa00 <_stogir.verify.structure+0x890>
     64c:      	mov	x16, #0x1               ; =1
     650:      	lsl	x2, x16, x24
     654:      	mov	w17, #0x5e1c            ; =24092
     658:      	and	w2, w2, w17
     65c:      	ubfx	x2, x2, #0, #32
     660:      	cmp	x2, #0x0
     664:      	b.eq	0xa0c <_stogir.verify.structure+0x89c>
     668:      	cmp	x25, #0x0
     66c:      	b.eq	0x3ac <_stogir.verify.structure+0x23c>
     670:      	mov	x19, x0
     674:      	mov	x0, x1
     678:      	b	0x3bc <_stogir.verify.structure+0x24c>
     67c:      	cmp	x26, #0x78
     680:      	cset	w2, eq
     684:      	cmp	x3, #0x0
     688:      	cset	w3, eq
     68c:      	mov	x4, #0x1                ; =1
     690:      	b	0x408 <_stogir.verify.structure+0x298>
     694:      	nop
     698:      	movz	x4, #0x0, lsl #48
     69c:      	cmp	x4, #0x0
     6a0:      	b.eq	0x67c <_stogir.verify.structure+0x50c>
     6a4:      	add	x4, x2, x23
     6a8:      	ldr	x5, [x0, #0x78]
     6ac:      	ldr	w4, [x5, x4, lsl #2]
     6b0:      	sxtw	x4, w4
     6b4:      	cmn	x4, #0x1
     6b8:      	b.eq	0x6c8 <_stogir.verify.structure+0x558>
     6bc:      	adrp	x19, 0x0 <_gap_verify_graph>
		00000000000006bc:  ARM64_RELOC_PAGE21	l_stogir.322
     6c0:      	ldr	x19, [x19]
		00000000000006c0:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     6c4:      	mov	x20, #0x1b              ; =27
     6c8:      	add	x2, x2, #0x1
     6cc:      	cmp	x20, #0x0
     6d0:      	b.ne	0x698 <_stogir.verify.structure+0x528>
     6d4:      	cmp	x2, x28
     6d8:      	cset	w4, lt
     6dc:      	ubfx	x4, x4, #0, #8
     6e0:      	b	0x69c <_stogir.verify.structure+0x52c>
     6e4:      	mov	w2, #-0x2               ; =-2
     6e8:      	sxtw	x2, w2
     6ec:      	cmn	x2, #0x1
     6f0:      	b.ne	0x70c <_stogir.verify.structure+0x59c>
     6f4:      	ubfx	x1, x1, #16, #16
     6f8:      	cmp	x25, x1
     6fc:      	b.eq	0x70c <_stogir.verify.structure+0x59c>
     700:      	adrp	x19, 0x0 <_gap_verify_graph>
		0000000000000700:  ARM64_RELOC_PAGE21	l_stogir.323
     704:      	ldr	x19, [x19]
		0000000000000704:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     708:      	mov	x20, #0x24              ; =36
     70c:      	add	x1, x25, #0x4
     710:      	asr	x16, x1, #63
     714:      	lsr	x16, x16, #62
     718:      	add	x1, x1, x16
     71c:      	asr	x1, x1, #2
     720:      	orr	x28, x1, xzr
     724:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000724:  ARM64_RELOC_PAGE21	l_stogir.324
     728:      	ldr	x16, [x16]
		0000000000000728:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     72c:      	ldr	w1, [x16, x26, lsl #2]
     730:      	add	x2, x28, x23
     734:      	ldr	x4, [x0, #0x8]
     738:      	cmp	x2, x4
     73c:      	b.le	0x74c <_stogir.verify.structure+0x5dc>
     740:      	adrp	x19, 0x0 <_gap_verify_graph>
		0000000000000740:  ARM64_RELOC_PAGE21	l_stogir.325
     744:      	ldr	x19, [x19]
		0000000000000744:  ARM64_RELOC_PAGEOFF12	l_stogir.325
     748:      	mov	x20, #0x15              ; =21
     74c:      	mov	x2, #0x1                ; =1
     750:      	b	0x6cc <_stogir.verify.structure+0x55c>
     754:      	cmp	x19, #0x0
     758:      	b.ne	0xa18 <_stogir.verify.structure+0x8a8>
     75c:      	uxtb	w16, w27
     760:      	cmp	w16, wzr
     764:      	b.eq	0x870 <_stogir.verify.structure+0x700>
     768:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000768:  ARM64_RELOC_PAGE21	l_stogir.324
     76c:      	ldr	x16, [x16]
		000000000000076c:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     770:      	ldr	w0, [x16, x26, lsl #2]
     774:      	uxtb	w16, w28
     778:      	cmp	w16, wzr
     77c:      	b.eq	0x8b8 <_stogir.verify.structure+0x748>
     780:      	uxtb	w16, w20
     784:      	cmp	w16, wzr
     788:      	b.eq	0x790 <_stogir.verify.structure+0x620>
     78c:      	mov	w23, #0x4               ; =4
     790:      	lsl	w1, w23, #2
     794:      	ubfx	x1, x1, #0, #32
     798:      	lsr	x0, x0, x1
     79c:      	and	w0, w0, #0xf
     7a0:      	b	0x8bc <_stogir.verify.structure+0x74c>
     7a4:      	mov	w2, #-0x2               ; =-2
     7a8:      	sxtw	x2, w2
     7ac:      	cmp	x2, #0x0
     7b0:      	b.lt	0x7d4 <_stogir.verify.structure+0x664>
     7b4:      	uxtb	w16, w27
     7b8:      	cmp	w16, wzr
     7bc:      	b.eq	0x838 <_stogir.verify.structure+0x6c8>
     7c0:      	adrp	x17, 0x0 <_gap_verify_graph>
		00000000000007c0:  ARM64_RELOC_PAGE21	l_stogir.316
     7c4:      	ldr	x17, [x17]
		00000000000007c4:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     7c8:      	ldrsb	w2, [x26, x17]
     7cc:      	sxtb	w2, w2
     7d0:      	b	0x83c <_stogir.verify.structure+0x6cc>
     7d4:      	uxtb	w16, w27
     7d8:      	cmp	w16, wzr
     7dc:      	b.eq	0x6e4 <_stogir.verify.structure+0x574>
     7e0:      	adrp	x17, 0x0 <_gap_verify_graph>
		00000000000007e0:  ARM64_RELOC_PAGE21	l_stogir.326
     7e4:      	ldr	x17, [x17]
		00000000000007e4:  ARM64_RELOC_PAGEOFF12	l_stogir.326
     7e8:      	ldrsb	w2, [x26, x17]
     7ec:      	sxtb	w2, w2
     7f0:      	b	0x6e8 <_stogir.verify.structure+0x578>
     7f4:      	ldr	w0, [sp, #0x70]
     7f8:      	uxtb	w16, w0
     7fc:      	cmp	w16, wzr
     800:      	b.eq	0xa24 <_stogir.verify.structure+0x8b4>
     804:      	ldr	w1, [sp, #0x68]
     808:      	uxtb	w16, w1
     80c:      	cmp	w16, wzr
     810:      	b.eq	0x820 <_stogir.verify.structure+0x6b0>
     814:      	ldr	x5, [sp, #0x60]
     818:      	cmp	x5, #0x2
     81c:      	b.eq	0x3cc <_stogir.verify.structure+0x25c>
     820:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000820:  ARM64_RELOC_PAGE21	l_stogir.327
     824:      	ldr	x16, [x16]
		0000000000000824:  ARM64_RELOC_PAGEOFF12	l_stogir.327
     828:      	str	x16, [sp, #0x30]
     82c:      	mov	x16, #0x1a              ; =26
     830:      	str	x16, [sp, #0x38]
     834:      	b	0x3cc <_stogir.verify.structure+0x25c>
     838:      	mov	w2, #-0x2               ; =-2
     83c:      	sxtw	x2, w2
     840:      	cmp	x25, x2
     844:      	b.eq	0x7d4 <_stogir.verify.structure+0x664>
     848:      	str	x8, [sp, #0x28]
     84c:      	str	x0, [sp, #0x18]
     850:      	mov	x0, x23
     854:      	mov	x1, x24
     858:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000858:  ARM64_RELOC_PAGE21	l_stogir.328
     85c:      	ldr	x16, [x16]
		000000000000085c:  ARM64_RELOC_PAGEOFF12	l_stogir.328
     860:      	str	x16, [sp, #0x30]
     864:      	mov	x16, #0x23              ; =35
     868:      	str	x16, [sp, #0x38]
     86c:      	b	0x1e4 <_stogir.verify.structure+0x74>
     870:      	movz	w0, #0x0, lsl #16
     874:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000874:  ARM64_RELOC_PAGE21	l_stogir.329
     878:      	ldr	x16, [x16]
		0000000000000878:  ARM64_RELOC_PAGEOFF12	l_stogir.329
     87c:      	ldr	w1, [x16]
     880:      	ubfx	x0, x0, #0, #32
     884:      	cmp	x0, x1
     888:      	b.ne	0x898 <_stogir.verify.structure+0x728>
     88c:      	ldr	w0, [sp, #0x70]
     890:      	ldr	w1, [sp, #0x68]
     894:      	b	0x3cc <_stogir.verify.structure+0x25c>
     898:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000898:  ARM64_RELOC_PAGE21	l_stogir.330
     89c:      	ldr	x16, [x16]
		000000000000089c:  ARM64_RELOC_PAGEOFF12	l_stogir.330
     8a0:      	ldr	w1, [x16]
     8a4:      	cmp	x0, x1
     8a8:      	b.ne	0x8c0 <_stogir.verify.structure+0x750>
     8ac:      	ldr	w0, [sp, #0x70]
     8b0:      	ldr	w1, [sp, #0x68]
     8b4:      	b	0x3cc <_stogir.verify.structure+0x25c>
     8b8:      	movz	w0, #0x0, lsl #16
     8bc:      	b	0x874 <_stogir.verify.structure+0x704>
     8c0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000008c0:  ARM64_RELOC_PAGE21	l_stogir.331
     8c4:      	ldr	x16, [x16]
		00000000000008c4:  ARM64_RELOC_PAGEOFF12	l_stogir.331
     8c8:      	ldr	w1, [x16]
     8cc:      	cmp	x0, x1
     8d0:      	b.ne	0x7f4 <_stogir.verify.structure+0x684>
     8d4:      	ldr	w0, [sp, #0x70]
     8d8:      	ldr	w1, [sp, #0x68]
     8dc:      	b	0x3cc <_stogir.verify.structure+0x25c>
     8e0:      	brk	#0
     8e4:      	b	0x8e0 <_stogir.verify.structure+0x770>
     8e8:      	mov	x1, x24
     8ec:      	str	x8, [sp, #0x28]
     8f0:      	str	x19, [sp, #0x30]
     8f4:      	str	x20, [sp, #0x38]
     8f8:      	b	0x33c <_stogir.verify.structure+0x1cc>
     8fc:      	mov	x1, x24
     900:      	str	x8, [sp, #0x28]
     904:      	str	x19, [sp, #0x30]
     908:      	str	x20, [sp, #0x38]
     90c:      	b	0x33c <_stogir.verify.structure+0x1cc>
     910:      	mov	x1, x24
     914:      	str	x8, [sp, #0x28]
     918:      	str	x0, [sp, #0x18]
     91c:      	mov	x0, x23
     920:      	b	0x258 <_stogir.verify.structure+0xe8>
     924:      	mov	x1, x24
     928:      	str	x8, [sp, #0x28]
     92c:      	str	x0, [sp, #0x18]
     930:      	mov	x0, x23
     934:      	b	0x22c <_stogir.verify.structure+0xbc>
     938:      	mov	x1, x24
     93c:      	str	x8, [sp, #0x28]
     940:      	str	x0, [sp, #0x18]
     944:      	mov	x0, x23
     948:      	b	0x22c <_stogir.verify.structure+0xbc>
     94c:      	mov	x1, x24
     950:      	str	x8, [sp, #0x28]
     954:      	str	x0, [sp, #0x18]
     958:      	mov	x0, x23
     95c:      	b	0x22c <_stogir.verify.structure+0xbc>
     960:      	mov	x1, x24
     964:      	str	x8, [sp, #0x28]
     968:      	str	x0, [sp, #0x18]
     96c:      	mov	x0, x23
     970:      	b	0x22c <_stogir.verify.structure+0xbc>
     974:      	mov	x1, x24
     978:      	str	x8, [sp, #0x28]
     97c:      	str	x0, [sp, #0x18]
     980:      	mov	x0, x23
     984:      	b	0x22c <_stogir.verify.structure+0xbc>
     988:      	ldr	x1, [sp, #0x30]
     98c:      	b	0x358 <_stogir.verify.structure+0x1e8>
     990:      	str	x23, [sp, #0x48]
     994:      	str	x24, [sp, #0x40]
     998:      	str	x8, [sp, #0x28]
     99c:      	str	x0, [sp, #0x18]
     9a0:      	str	x28, [sp, #0x50]
     9a4:      	str	x19, [sp, #0x30]
     9a8:      	str	x20, [sp, #0x38]
     9ac:      	b	0x1cc <_stogir.verify.structure+0x5c>
     9b0:      	str	x23, [sp, #0x48]
     9b4:      	str	x24, [sp, #0x40]
     9b8:      	str	x4, [sp, #0x58]
     9bc:      	str	x8, [sp, #0x28]
     9c0:      	str	x0, [sp, #0x18]
     9c4:      	str	x25, [sp, #0x10]
     9c8:      	mov	x25, x12
     9cc:      	str	x28, [sp, #0x50]
     9d0:      	mov	x24, x11
     9d4:      	str	x19, [sp, #0x30]
     9d8:      	mov	w19, w5
     9dc:      	str	x20, [sp, #0x38]
     9e0:      	str	x1, [sp, #0x20]
     9e4:      	str	x6, [sp, #0x60]
     9e8:      	mov	w28, w9
     9ec:      	mov	w20, w10
     9f0:      	mov	w23, w7
     9f4:      	str	w2, [sp, #0x70]
     9f8:      	str	w3, [sp, #0x68]
     9fc:      	b	0x580 <_stogir.verify.structure+0x410>
     a00:      	ldr	w0, [sp, #0x70]
     a04:      	ldr	w1, [sp, #0x68]
     a08:      	b	0x3cc <_stogir.verify.structure+0x25c>
     a0c:      	ldr	w0, [sp, #0x70]
     a10:      	ldr	w1, [sp, #0x68]
     a14:      	b	0x3cc <_stogir.verify.structure+0x25c>
     a18:      	ldr	w0, [sp, #0x70]
     a1c:      	ldr	w1, [sp, #0x68]
     a20:      	b	0x820 <_stogir.verify.structure+0x6b0>
     a24:      	ldr	w1, [sp, #0x68]
     a28:      	b	0x820 <_stogir.verify.structure+0x6b0>
