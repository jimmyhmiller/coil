
build/inline-density-comparison/verify-graph/density.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000170 <_stogir.verify.structure>:
     170:      	sub	sp, sp, #0xf0
     174:      	str	x29, [sp, #0x10]
     178:      	str	x30, [sp, #0x18]
     17c:      	add	x29, sp, #0x10
     180:      	str	x19, [sp, #0xa0]
     184:      	str	x20, [sp, #0xa8]
     188:      	str	x21, [sp, #0xb0]
     18c:      	str	x22, [sp, #0xb8]
     190:      	str	x23, [sp, #0xc0]
     194:      	str	x24, [sp, #0xc8]
     198:      	str	x25, [sp, #0xd0]
     19c:      	str	x26, [sp, #0xd8]
     1a0:      	str	x27, [sp, #0xe0]
     1a4:      	str	x28, [sp, #0xe8]
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
     1cc:      	ldr	x0, [sp, #0x70]
     1d0:      	ldr	x1, [sp, #0x78]
     1d4:      	add	x0, x1, x0
     1d8:      	ldr	x1, [sp, #0x68]
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
     210:      	str	x16, [sp, #0x58]
     214:      	mov	x16, #0x16              ; =22
     218:      	str	x16, [sp, #0x60]
     21c:      	b	0x244 <_stogir.verify.structure+0xd4>
     220:      	mov	x1, x24
     224:      	str	x8, [sp, #0x40]
     228:      	str	x0, [sp, #0x38]
     22c:      	mov	x0, x23
     230:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000230:  ARM64_RELOC_PAGE21	l_stogir.314
     234:      	ldr	x16, [x16]
		0000000000000234:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     238:      	str	x16, [sp, #0x58]
     23c:      	mov	x16, #0x23              ; =35
     240:      	str	x16, [sp, #0x60]
     244:      	ldr	x8, [sp, #0x40]
     248:      	mov	x23, x0
     24c:      	ldr	x0, [sp, #0x38]
     250:      	mov	x24, x1
     254:      	ldr	x19, [sp, #0x58]
     258:      	ldr	x20, [sp, #0x60]
     25c:      	cmp	x20, #0x0
     260:      	b.ne	0x940 <_stogir.verify.structure+0x7d0>
     264:      	ldr	x1, [x0, #0x8]
     268:      	cmp	x23, x1
     26c:      	b.ge	0x954 <_stogir.verify.structure+0x7e4>
     270:      	ldr	x1, [x0]
     274:      	add	x1, x1, x23, lsl #4
     278:      	ldr	x1, [x1]
     27c:      	ldr	x2, [x0, #0x78]
     280:      	add	x2, x2, x23, lsl #2
     284:      	ldr	w2, [x2]
     288:      	sxtw	x25, w2
     28c:      	cmp	x25, #0x0
     290:      	b.lt	0x220 <_stogir.verify.structure+0xb0>
     294:      	mov	x17, #0xffff            ; =65535
     298:      	cmp	x25, x17
     29c:      	b.gt	0x968 <_stogir.verify.structure+0x7f8>
     2a0:      	uxtb	w2, w1
     2a4:      	cmp	x2, #0x83
     2a8:      	cset	w26, lt
     2ac:      	uxtb	w16, w26
     2b0:      	cmp	w16, wzr
     2b4:      	b.eq	0x97c <_stogir.verify.structure+0x80c>
     2b8:      	ubfx	x1, x1, #0, #32
     2bc:      	ubfx	x3, x1, #8, #8
     2c0:      	orr	x4, x3, xzr
     2c4:      	cmp	x4, #0xd
     2c8:      	b.le	0x2f4 <_stogir.verify.structure+0x184>
     2cc:      	cmp	x4, #0xf
     2d0:      	b.le	0x990 <_stogir.verify.structure+0x820>
     2d4:      	cmp	x4, #0x80
     2d8:      	b.ge	0x9a4 <_stogir.verify.structure+0x834>
     2dc:      	and	w3, w3, #0xf
     2e0:      	ubfx	x3, x3, #0, #32
     2e4:      	cmp	x3, #0x1
     2e8:      	b.lt	0x9b8 <_stogir.verify.structure+0x848>
     2ec:      	cmp	x3, #0xd
     2f0:      	b.gt	0x9cc <_stogir.verify.structure+0x85c>
     2f4:      	uxtb	w16, w26
     2f8:      	cmp	w16, wzr
     2fc:      	b.eq	0x79c <_stogir.verify.structure+0x62c>
     300:      	adrp	x17, 0x0 <_gap_verify_graph>
		0000000000000300:  ARM64_RELOC_PAGE21	l_stogir.315
     304:      	ldr	x17, [x17]
		0000000000000304:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     308:      	add	x3, x2, x17
     30c:      	ldrsb	w3, [x3]
     310:      	sxtb	w3, w3
     314:      	b	0x7a0 <_stogir.verify.structure+0x630>
     318:      	ldr	x0, [sp, #0x60]
     31c:      	cmp	x0, #0x0
     320:      	b.ne	0x9e0 <_stogir.verify.structure+0x870>
     324:      	and	x1, x1, #0xffffffff
     328:      	movz	x2, #0x0, lsl #48
     32c:      	movz	x0, #0x0, lsl #48
     330:      	b	0x338 <_stogir.verify.structure+0x1c8>
     334:      	mov	x2, #0x1                ; =1
     338:      	ldr	x3, [sp, #0x40]
     33c:      	str	x2, [x3]
     340:      	str	x1, [x3, #0x8]
     344:      	str	x0, [x3, #0x10]
     348:      	ldr	x19, [sp, #0xa0]
     34c:      	ldr	x20, [sp, #0xa8]
     350:      	ldr	x21, [sp, #0xb0]
     354:      	ldr	x22, [sp, #0xb8]
     358:      	ldr	x23, [sp, #0xc0]
     35c:      	ldr	x24, [sp, #0xc8]
     360:      	ldr	x25, [sp, #0xd0]
     364:      	ldr	x26, [sp, #0xd8]
     368:      	ldr	x27, [sp, #0xe0]
     36c:      	ldr	x28, [sp, #0xe8]
     370:      	ldr	x29, [sp, #0x10]
     374:      	ldr	x30, [sp, #0x18]
     378:      	add	sp, sp, #0xf0
     37c:      	ret
     380:      	mov	w13, w9
     384:      	lsl	w13, w13, #2
     388:      	ubfx	x13, x13, #0, #32
     38c:      	lsr	x12, x12, x13
     390:      	and	w12, w12, #0xf
     394:      	b	0x3c0 <_stogir.verify.structure+0x250>
     398:      	mov	w1, w28
     39c:      	mov	x28, x0
     3a0:      	ldr	x0, [sp, #0x38]
     3a4:      	bl	0x3a4 <_stogir.verify.structure+0x234>
		00000000000003a4:  ARM64_RELOC_BRANCH26	_stogir.graph.contains?
     3a8:      	cmp	x0, #0x0
     3ac:      	b.eq	0x834 <_stogir.verify.structure+0x6c4>
     3b0:      	ldr	w0, [sp, #0x98]
     3b4:      	ldr	w1, [sp, #0x90]
     3b8:      	b	0x464 <_stogir.verify.structure+0x2f4>
     3bc:      	movz	w12, #0x0, lsl #16
     3c0:      	b	0x3c8 <_stogir.verify.structure+0x258>
     3c4:      	movz	w12, #0x0, lsl #16
     3c8:      	str	x8, [sp, #0x40]
     3cc:      	str	x0, [sp, #0x38]
     3d0:      	str	w1, [sp, #0x48]
     3d4:      	str	x4, [sp, #0x50]
     3d8:      	str	x5, [sp, #0x80]
     3dc:      	str	x7, [sp, #0x88]
     3e0:      	str	x25, [sp, #0x30]
     3e4:      	mov	w25, w3
     3e8:      	str	x19, [sp, #0x58]
     3ec:      	mov	x19, x2
     3f0:      	mov	w2, w6
     3f4:      	str	x20, [sp, #0x60]
     3f8:      	mov	w20, w11
     3fc:      	str	x24, [sp, #0x68]
     400:      	mov	w24, w12
     404:      	str	x23, [sp, #0x70]
     408:      	mov	w23, w9
     40c:      	str	x27, [sp, #0x78]
     410:      	mov	w27, w10
     414:      	bl	0x414 <_stogir.verify.structure+0x2a4>
		0000000000000414:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     418:      	ubfx	x0, x0, #0, #32
     41c:      	lsr	x16, x0, #0
     420:      	cmp	x16, #0x1
     424:      	b.eq	0x440 <_stogir.verify.structure+0x2d0>
     428:      	b.lo	0x430 <_stogir.verify.structure+0x2c0>
     42c:      	b	0x444 <_stogir.verify.structure+0x2d4>
     430:      	cmp	x16, #0x0
     434:      	b.eq	0x43c <_stogir.verify.structure+0x2cc>
     438:      	b	0x444 <_stogir.verify.structure+0x2d4>
     43c:      	b	0x448 <_stogir.verify.structure+0x2d8>
     440:      	b	0x518 <_stogir.verify.structure+0x3a8>
     444:      	b	0x8c0 <_stogir.verify.structure+0x750>
     448:      	mov	w0, w28
     44c:      	mov	w1, w25
     450:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000450:  ARM64_RELOC_PAGE21	l_stogir.316
     454:      	ldr	x16, [x16]
		0000000000000454:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     458:      	str	x16, [sp, #0x58]
     45c:      	mov	x16, #0x17              ; =23
     460:      	str	x16, [sp, #0x60]
     464:      	ldr	x2, [sp, #0x80]
     468:      	add	x2, x2, #0x1
     46c:      	sxtw	x2, w2
     470:      	ldr	x23, [sp, #0x70]
     474:      	ldr	x24, [sp, #0x68]
     478:      	ldr	x8, [sp, #0x40]
     47c:      	ldr	x25, [sp, #0x30]
     480:      	ldr	x27, [sp, #0x78]
     484:      	ldr	x4, [sp, #0x50]
     488:      	mov	w28, w0
     48c:      	ldr	x0, [sp, #0x38]
     490:      	mov	w3, w1
     494:      	ldr	w1, [sp, #0x48]
     498:      	mov	x5, x2
     49c:      	mov	x2, x19
     4a0:      	ldr	x19, [sp, #0x58]
     4a4:      	ldr	x20, [sp, #0x60]
     4a8:      	cmp	x20, #0x0
     4ac:      	b.ne	0x4c0 <_stogir.verify.structure+0x350>
     4b0:      	cmp	x5, x25
     4b4:      	cset	w6, le
     4b8:      	ubfx	x6, x6, #0, #8
     4bc:      	b	0x4c4 <_stogir.verify.structure+0x354>
     4c0:      	movz	x6, #0x0, lsl #48
     4c4:      	cmp	x6, #0x0
     4c8:      	b.eq	0x9e8 <_stogir.verify.structure+0x878>
     4cc:      	orr	w6, w5, wzr
     4d0:      	sxtw	x7, w6
     4d4:      	sub	w9, w6, #0x1
     4d8:      	cmp	x7, #0x0
     4dc:      	cset	w10, gt
     4e0:      	cmp	x7, #0x4
     4e4:      	cset	w11, gt
     4e8:      	uxtb	w16, w26
     4ec:      	cmp	w16, wzr
     4f0:      	b.eq	0x3c4 <_stogir.verify.structure+0x254>
     4f4:      	ldr	w12, [x4]
     4f8:      	uxtb	w16, w10
     4fc:      	cmp	w16, wzr
     500:      	b.eq	0x3bc <_stogir.verify.structure+0x24c>
     504:      	uxtb	w16, w11
     508:      	cmp	w16, wzr
     50c:      	b.eq	0x380 <_stogir.verify.structure+0x210>
     510:      	mov	w13, #0x4               ; =4
     514:      	b	0x384 <_stogir.verify.structure+0x214>
     518:      	ubfx	x24, x24, #0, #32
     51c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000051c:  ARM64_RELOC_PAGE21	l_stogir.317
     520:      	ldr	x16, [x16]
		0000000000000520:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     524:      	ldr	w0, [x16]
     528:      	cmp	x24, x0
     52c:      	b.ne	0x538 <_stogir.verify.structure+0x3c8>
     530:      	mov	x0, #0x1                ; =1
     534:      	b	0x550 <_stogir.verify.structure+0x3e0>
     538:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000538:  ARM64_RELOC_PAGE21	l_stogir.318
     53c:      	ldr	x16, [x16]
		000000000000053c:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     540:      	ldr	w0, [x16]
     544:      	cmp	x24, x0
     548:      	cset	w0, eq
     54c:      	ubfx	x0, x0, #0, #8
     550:      	cmp	x0, #0x0
     554:      	b.eq	0xa08 <_stogir.verify.structure+0x898>
     558:      	str	w25, [sp, #0x90]
     55c:      	mov	x25, x0
     560:      	ldr	x0, [sp, #0x38]
     564:      	str	w28, [sp, #0x98]
     568:      	mov	w28, w1
     56c:      	bl	0x56c <_stogir.verify.structure+0x3fc>
		000000000000056c:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
     570:      	cmp	x0, #0x0
     574:      	cset	w1, eq
     578:      	uxtb	w16, w1
     57c:      	cmp	w16, wzr
     580:      	cset	x1, eq
     584:      	cmp	x1, #0x0
     588:      	b.eq	0x5b0 <_stogir.verify.structure+0x440>
     58c:      	ldr	w0, [x0]
     590:      	uxtb	w0, w0
     594:      	cmp	x0, #0x48
     598:      	b.ne	0x5b0 <_stogir.verify.structure+0x440>
     59c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000059c:  ARM64_RELOC_PAGE21	l_stogir.319
     5a0:      	ldr	x16, [x16]
		00000000000005a0:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     5a4:      	str	x16, [sp, #0x58]
     5a8:      	mov	x16, #0x25              ; =37
     5ac:      	str	x16, [sp, #0x60]
     5b0:      	b	0x5b8 <_stogir.verify.structure+0x448>
     5b4:      	movz	x1, #0x0, lsl #48
     5b8:      	sxtw	x0, w28
     5bc:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000005bc:  ARM64_RELOC_PAGE21	l_stogir.320
     5c0:      	ldr	x16, [x16]
		00000000000005c0:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     5c4:      	ldr	w2, [x16]
     5c8:      	cmp	x24, x2
     5cc:      	b.ne	0x678 <_stogir.verify.structure+0x508>
     5d0:      	cmp	x0, #0x0
     5d4:      	b.le	0x630 <_stogir.verify.structure+0x4c0>
     5d8:      	ldr	x2, [x22, #0x8]
     5dc:      	cmp	x0, x2
     5e0:      	b.gt	0x630 <_stogir.verify.structure+0x4c0>
     5e4:      	sub	x2, x0, #0x1
     5e8:      	ldr	x3, [x21, #0x28]
     5ec:      	mov	x17, #0x18              ; =24
     5f0:      	mul	x2, x2, x17
     5f4:      	add	x2, x2, x3
     5f8:      	ldr	x3, [x2]
     5fc:      	ldr	x2, [x2, #0x8]
     600:      	ldr	x4, [x21, #0x8]
     604:      	cmp	x3, #0x0
     608:      	b.lt	0x7f4 <_stogir.verify.structure+0x684>
     60c:      	cmp	x3, x4
     610:      	b.gt	0x7f4 <_stogir.verify.structure+0x684>
     614:      	cmp	x2, #0x0
     618:      	b.lt	0x7f4 <_stogir.verify.structure+0x684>
     61c:      	sub	x3, x4, x3
     620:      	cmp	x2, x3
     624:      	b.gt	0x7f4 <_stogir.verify.structure+0x684>
     628:      	mov	w2, #0x1                ; =1
     62c:      	b	0x7f8 <_stogir.verify.structure+0x688>
     630:      	movz	w2, #0x0, lsl #16
     634:      	ubfx	x2, x2, #0, #32
     638:      	lsr	x16, x2, #0
     63c:      	cmp	x16, #0x1
     640:      	b.eq	0x65c <_stogir.verify.structure+0x4ec>
     644:      	b.lo	0x64c <_stogir.verify.structure+0x4dc>
     648:      	b	0x660 <_stogir.verify.structure+0x4f0>
     64c:      	cmp	x16, #0x0
     650:      	b.eq	0x658 <_stogir.verify.structure+0x4e8>
     654:      	b	0x660 <_stogir.verify.structure+0x4f0>
     658:      	b	0x664 <_stogir.verify.structure+0x4f4>
     65c:      	b	0x678 <_stogir.verify.structure+0x508>
     660:      	b	0x938 <_stogir.verify.structure+0x7c8>
     664:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000664:  ARM64_RELOC_PAGE21	l_stogir.321
     668:      	ldr	x16, [x16]
		0000000000000668:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     66c:      	str	x16, [sp, #0x58]
     670:      	mov	x16, #0x21              ; =33
     674:      	str	x16, [sp, #0x60]
     678:      	cmp	x24, #0xf
     67c:      	b.hs	0xa1c <_stogir.verify.structure+0x8ac>
     680:      	mov	x16, #0x1               ; =1
     684:      	lsl	x2, x16, x24
     688:      	mov	w17, #0x5e1c            ; =24092
     68c:      	and	w2, w2, w17
     690:      	ubfx	x2, x2, #0, #32
     694:      	cmp	x2, #0x0
     698:      	b.eq	0xa28 <_stogir.verify.structure+0x8b8>
     69c:      	cmp	x25, #0x0
     6a0:      	b.eq	0x398 <_stogir.verify.structure+0x228>
     6a4:      	mov	x28, x0
     6a8:      	mov	x0, x1
     6ac:      	b	0x3a8 <_stogir.verify.structure+0x238>
     6b0:      	orr	w1, w23, wzr
     6b4:      	cmp	x2, #0x78
     6b8:      	cset	w28, eq
     6bc:      	cmp	x4, #0x0
     6c0:      	cset	w3, eq
     6c4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000006c4:  ARM64_RELOC_PAGE21	l_stogir.322
     6c8:      	ldr	x16, [x16]
		00000000000006c8:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     6cc:      	add	x4, x16, x2, lsl #2
     6d0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000006d0:  ARM64_RELOC_PAGE21	l_stogir.322
     6d4:      	ldr	x16, [x16]
		00000000000006d4:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     6d8:      	add	x2, x16, x2, lsl #2
     6dc:      	mov	x5, #0x1                ; =1
     6e0:      	b	0x4a8 <_stogir.verify.structure+0x338>
     6e4:      	nop
     6e8:      	movz	x3, #0x0, lsl #48
     6ec:      	cmp	x3, #0x0
     6f0:      	b.eq	0x6b0 <_stogir.verify.structure+0x540>
     6f4:      	add	x3, x1, x23
     6f8:      	ldr	x5, [x0, #0x78]
     6fc:      	add	x3, x5, x3, lsl #2
     700:      	ldr	w3, [x3]
     704:      	sxtw	x3, w3
     708:      	cmn	x3, #0x1
     70c:      	b.eq	0x71c <_stogir.verify.structure+0x5ac>
     710:      	adrp	x19, 0x0 <_gap_verify_graph>
		0000000000000710:  ARM64_RELOC_PAGE21	l_stogir.323
     714:      	ldr	x19, [x19]
		0000000000000714:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     718:      	mov	x20, #0x1b              ; =27
     71c:      	add	x1, x1, #0x1
     720:      	cmp	x20, #0x0
     724:      	b.ne	0x6e8 <_stogir.verify.structure+0x578>
     728:      	cmp	x1, x27
     72c:      	cset	w3, lt
     730:      	ubfx	x3, x3, #0, #8
     734:      	b	0x6ec <_stogir.verify.structure+0x57c>
     738:      	mov	w3, #-0x2               ; =-2
     73c:      	sxtw	x3, w3
     740:      	cmn	x3, #0x1
     744:      	b.ne	0x760 <_stogir.verify.structure+0x5f0>
     748:      	ubfx	x1, x1, #16, #16
     74c:      	cmp	x25, x1
     750:      	b.eq	0x760 <_stogir.verify.structure+0x5f0>
     754:      	adrp	x19, 0x0 <_gap_verify_graph>
		0000000000000754:  ARM64_RELOC_PAGE21	l_stogir.324
     758:      	ldr	x19, [x19]
		0000000000000758:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     75c:      	mov	x20, #0x24              ; =36
     760:      	add	x1, x25, #0x4
     764:      	ldr	x3, [x0, #0x8]
     768:      	asr	x16, x1, #63
     76c:      	lsr	x16, x16, #62
     770:      	add	x1, x1, x16
     774:      	asr	x1, x1, #2
     778:      	orr	x27, x1, xzr
     77c:      	add	x1, x27, x23
     780:      	cmp	x1, x3
     784:      	b.le	0x794 <_stogir.verify.structure+0x624>
     788:      	adrp	x19, 0x0 <_gap_verify_graph>
		0000000000000788:  ARM64_RELOC_PAGE21	l_stogir.325
     78c:      	ldr	x19, [x19]
		000000000000078c:  ARM64_RELOC_PAGEOFF12	l_stogir.325
     790:      	mov	x20, #0x15              ; =21
     794:      	mov	x1, #0x1                ; =1
     798:      	b	0x720 <_stogir.verify.structure+0x5b0>
     79c:      	mov	w3, #-0x2               ; =-2
     7a0:      	sxtw	x3, w3
     7a4:      	cmp	x3, #0x0
     7a8:      	b.lt	0x7d0 <_stogir.verify.structure+0x660>
     7ac:      	uxtb	w16, w26
     7b0:      	cmp	w16, wzr
     7b4:      	b.eq	0x7fc <_stogir.verify.structure+0x68c>
     7b8:      	adrp	x17, 0x0 <_gap_verify_graph>
		00000000000007b8:  ARM64_RELOC_PAGE21	l_stogir.315
     7bc:      	ldr	x17, [x17]
		00000000000007bc:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     7c0:      	add	x3, x2, x17
     7c4:      	ldrsb	w3, [x3]
     7c8:      	sxtb	w3, w3
     7cc:      	b	0x800 <_stogir.verify.structure+0x690>
     7d0:      	uxtb	w16, w26
     7d4:      	cmp	w16, wzr
     7d8:      	b.eq	0x738 <_stogir.verify.structure+0x5c8>
     7dc:      	adrp	x17, 0x0 <_gap_verify_graph>
		00000000000007dc:  ARM64_RELOC_PAGE21	l_stogir.326
     7e0:      	ldr	x17, [x17]
		00000000000007e0:  ARM64_RELOC_PAGEOFF12	l_stogir.326
     7e4:      	add	x3, x2, x17
     7e8:      	ldrsb	w3, [x3]
     7ec:      	sxtb	w3, w3
     7f0:      	b	0x73c <_stogir.verify.structure+0x5cc>
     7f4:      	movz	w2, #0x0, lsl #16
     7f8:      	b	0x634 <_stogir.verify.structure+0x4c4>
     7fc:      	mov	w3, #-0x2               ; =-2
     800:      	sxtw	x3, w3
     804:      	cmp	x25, x3
     808:      	b.eq	0x7d0 <_stogir.verify.structure+0x660>
     80c:      	str	x8, [sp, #0x40]
     810:      	str	x0, [sp, #0x38]
     814:      	mov	x0, x23
     818:      	mov	x1, x24
     81c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000081c:  ARM64_RELOC_PAGE21	l_stogir.327
     820:      	ldr	x16, [x16]
		0000000000000820:  ARM64_RELOC_PAGEOFF12	l_stogir.327
     824:      	str	x16, [sp, #0x58]
     828:      	mov	x16, #0x23              ; =35
     82c:      	str	x16, [sp, #0x60]
     830:      	b	0x1e4 <_stogir.verify.structure+0x74>
     834:      	cmp	x28, #0x0
     838:      	b.ne	0xa34 <_stogir.verify.structure+0x8c4>
     83c:      	uxtb	w16, w26
     840:      	cmp	w16, wzr
     844:      	b.eq	0x8c8 <_stogir.verify.structure+0x758>
     848:      	ldr	w0, [x19]
     84c:      	uxtb	w16, w27
     850:      	cmp	w16, wzr
     854:      	b.eq	0x910 <_stogir.verify.structure+0x7a0>
     858:      	uxtb	w16, w20
     85c:      	cmp	w16, wzr
     860:      	b.eq	0x868 <_stogir.verify.structure+0x6f8>
     864:      	mov	w23, #0x4               ; =4
     868:      	lsl	w1, w23, #2
     86c:      	ubfx	x1, x1, #0, #32
     870:      	lsr	x0, x0, x1
     874:      	and	w0, w0, #0xf
     878:      	b	0x914 <_stogir.verify.structure+0x7a4>
     87c:      	ldr	w0, [sp, #0x98]
     880:      	uxtb	w16, w0
     884:      	cmp	w16, wzr
     888:      	b.eq	0xa40 <_stogir.verify.structure+0x8d0>
     88c:      	ldr	w1, [sp, #0x90]
     890:      	uxtb	w16, w1
     894:      	cmp	w16, wzr
     898:      	b.eq	0x8a8 <_stogir.verify.structure+0x738>
     89c:      	ldr	x6, [sp, #0x88]
     8a0:      	cmp	x6, #0x2
     8a4:      	b.eq	0x3b8 <_stogir.verify.structure+0x248>
     8a8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000008a8:  ARM64_RELOC_PAGE21	l_stogir.328
     8ac:      	ldr	x16, [x16]
		00000000000008ac:  ARM64_RELOC_PAGEOFF12	l_stogir.328
     8b0:      	str	x16, [sp, #0x58]
     8b4:      	mov	x16, #0x1a              ; =26
     8b8:      	str	x16, [sp, #0x60]
     8bc:      	b	0x3b8 <_stogir.verify.structure+0x248>
     8c0:      	brk	#0
     8c4:      	b	0x8c0 <_stogir.verify.structure+0x750>
     8c8:      	movz	w0, #0x0, lsl #16
     8cc:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000008cc:  ARM64_RELOC_PAGE21	l_stogir.329
     8d0:      	ldr	x16, [x16]
		00000000000008d0:  ARM64_RELOC_PAGEOFF12	l_stogir.329
     8d4:      	ldr	w1, [x16]
     8d8:      	ubfx	x0, x0, #0, #32
     8dc:      	cmp	x0, x1
     8e0:      	b.ne	0x8f0 <_stogir.verify.structure+0x780>
     8e4:      	ldr	w0, [sp, #0x98]
     8e8:      	ldr	w1, [sp, #0x90]
     8ec:      	b	0x3b8 <_stogir.verify.structure+0x248>
     8f0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000008f0:  ARM64_RELOC_PAGE21	l_stogir.330
     8f4:      	ldr	x16, [x16]
		00000000000008f4:  ARM64_RELOC_PAGEOFF12	l_stogir.330
     8f8:      	ldr	w1, [x16]
     8fc:      	cmp	x0, x1
     900:      	b.ne	0x918 <_stogir.verify.structure+0x7a8>
     904:      	ldr	w0, [sp, #0x98]
     908:      	ldr	w1, [sp, #0x90]
     90c:      	b	0x3b8 <_stogir.verify.structure+0x248>
     910:      	movz	w0, #0x0, lsl #16
     914:      	b	0x8cc <_stogir.verify.structure+0x75c>
     918:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000918:  ARM64_RELOC_PAGE21	l_stogir.331
     91c:      	ldr	x16, [x16]
		000000000000091c:  ARM64_RELOC_PAGEOFF12	l_stogir.331
     920:      	ldr	w1, [x16]
     924:      	cmp	x0, x1
     928:      	b.ne	0x87c <_stogir.verify.structure+0x70c>
     92c:      	ldr	w0, [sp, #0x98]
     930:      	ldr	w1, [sp, #0x90]
     934:      	b	0x3b8 <_stogir.verify.structure+0x248>
     938:      	brk	#0
     93c:      	b	0x938 <_stogir.verify.structure+0x7c8>
     940:      	mov	x1, x24
     944:      	str	x8, [sp, #0x40]
     948:      	str	x19, [sp, #0x58]
     94c:      	str	x20, [sp, #0x60]
     950:      	b	0x318 <_stogir.verify.structure+0x1a8>
     954:      	mov	x1, x24
     958:      	str	x8, [sp, #0x40]
     95c:      	str	x19, [sp, #0x58]
     960:      	str	x20, [sp, #0x60]
     964:      	b	0x318 <_stogir.verify.structure+0x1a8>
     968:      	mov	x1, x24
     96c:      	str	x8, [sp, #0x40]
     970:      	str	x0, [sp, #0x38]
     974:      	mov	x0, x23
     978:      	b	0x230 <_stogir.verify.structure+0xc0>
     97c:      	mov	x1, x24
     980:      	str	x8, [sp, #0x40]
     984:      	str	x0, [sp, #0x38]
     988:      	mov	x0, x23
     98c:      	b	0x208 <_stogir.verify.structure+0x98>
     990:      	mov	x1, x24
     994:      	str	x8, [sp, #0x40]
     998:      	str	x0, [sp, #0x38]
     99c:      	mov	x0, x23
     9a0:      	b	0x208 <_stogir.verify.structure+0x98>
     9a4:      	mov	x1, x24
     9a8:      	str	x8, [sp, #0x40]
     9ac:      	str	x0, [sp, #0x38]
     9b0:      	mov	x0, x23
     9b4:      	b	0x208 <_stogir.verify.structure+0x98>
     9b8:      	mov	x1, x24
     9bc:      	str	x8, [sp, #0x40]
     9c0:      	str	x0, [sp, #0x38]
     9c4:      	mov	x0, x23
     9c8:      	b	0x208 <_stogir.verify.structure+0x98>
     9cc:      	mov	x1, x24
     9d0:      	str	x8, [sp, #0x40]
     9d4:      	str	x0, [sp, #0x38]
     9d8:      	mov	x0, x23
     9dc:      	b	0x208 <_stogir.verify.structure+0x98>
     9e0:      	ldr	x1, [sp, #0x58]
     9e4:      	b	0x334 <_stogir.verify.structure+0x1c4>
     9e8:      	str	x23, [sp, #0x70]
     9ec:      	str	x24, [sp, #0x68]
     9f0:      	str	x8, [sp, #0x40]
     9f4:      	str	x0, [sp, #0x38]
     9f8:      	str	x27, [sp, #0x78]
     9fc:      	str	x19, [sp, #0x58]
     a00:      	str	x20, [sp, #0x60]
     a04:      	b	0x1cc <_stogir.verify.structure+0x5c>
     a08:      	str	w28, [sp, #0x98]
     a0c:      	mov	w28, w1
     a10:      	str	w25, [sp, #0x90]
     a14:      	mov	x25, x0
     a18:      	b	0x5b4 <_stogir.verify.structure+0x444>
     a1c:      	ldr	w0, [sp, #0x98]
     a20:      	ldr	w1, [sp, #0x90]
     a24:      	b	0x3b8 <_stogir.verify.structure+0x248>
     a28:      	ldr	w0, [sp, #0x98]
     a2c:      	ldr	w1, [sp, #0x90]
     a30:      	b	0x3b8 <_stogir.verify.structure+0x248>
     a34:      	ldr	w0, [sp, #0x98]
     a38:      	ldr	w1, [sp, #0x90]
     a3c:      	b	0x8a8 <_stogir.verify.structure+0x738>
     a40:      	ldr	w1, [sp, #0x90]
     a44:      	b	0x8a8 <_stogir.verify.structure+0x738>
