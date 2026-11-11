
build/return-merge-verifier/candidate.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000000000001a0 <_stogir.verify.structure>:
     1a0:      	sub	sp, sp, #0x1b0
     1a4:      	str	x29, [sp, #0x10]
     1a8:      	str	x30, [sp, #0x18]
     1ac:      	add	x29, sp, #0x10
     1b0:      	str	x19, [sp, #0x160]
     1b4:      	str	x20, [sp, #0x168]
     1b8:      	str	x21, [sp, #0x170]
     1bc:      	str	x22, [sp, #0x178]
     1c0:      	str	x23, [sp, #0x180]
     1c4:      	str	x24, [sp, #0x188]
     1c8:      	str	x25, [sp, #0x190]
     1cc:      	str	x26, [sp, #0x198]
     1d0:      	str	x27, [sp, #0x1a0]
     1d4:      	str	x28, [sp, #0x1a8]
     1d8:      	add	x1, x0, #0x78
     1dc:      	ldr	x2, [x0, #0x8]
     1e0:      	ldr	x1, [x1, #0x8]
     1e4:      	cmp	x2, x1
     1e8:      	b.ne	0x228 <_stogir.verify.structure+0x88>
     1ec:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000001ec:  ARM64_RELOC_PAGE21	l_stogir.304
     1f0:      	ldr	x16, [x16]
		00000000000001f0:  ARM64_RELOC_PAGEOFF12	l_stogir.304
     1f4:      	orr	x1, x16, xzr
     1f8:      	movz	x2, #0x0, lsl #48
     1fc:      	b	0x238 <_stogir.verify.structure+0x98>
     200:      	ldr	x2, [sp, #0x138]
     204:      	ldr	x1, [sp, #0x140]
     208:      	add	x1, x2, x1
     20c:      	ldr	x2, [sp, #0xb0]
     210:      	add	x2, x2, #0x1
     214:      	lsr	w2, w2, #0
     218:      	sxtw	x2, w2
     21c:      	ldr	x6, [sp, #0x110]
     220:      	ldr	x8, [sp, #0x108]
     224:      	b	0x304 <_stogir.verify.structure+0x164>
     228:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000228:  ARM64_RELOC_PAGE21	l_stogir.305
     22c:      	ldr	x16, [x16]
		000000000000022c:  ARM64_RELOC_PAGEOFF12	l_stogir.305
     230:      	orr	x1, x16, xzr
     234:      	mov	x2, #0x2c               ; =44
     238:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000238:  ARM64_RELOC_PAGE21	l_stogir.306
     23c:      	ldr	x16, [x16]
		000000000000023c:  ARM64_RELOC_PAGEOFF12	l_stogir.306
     240:      	orr	x19, x16, xzr
     244:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000244:  ARM64_RELOC_PAGE21	l_stogir.307
     248:      	ldr	x16, [x16]
		0000000000000248:  ARM64_RELOC_PAGEOFF12	l_stogir.307
     24c:      	orr	x20, x16, xzr
     250:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000250:  ARM64_RELOC_PAGE21	l_stogir.308
     254:      	ldr	x16, [x16]
		0000000000000254:  ARM64_RELOC_PAGEOFF12	l_stogir.308
     258:      	orr	x21, x16, xzr
     25c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000025c:  ARM64_RELOC_PAGE21	l_stogir.309
     260:      	ldr	x16, [x16]
		0000000000000260:  ARM64_RELOC_PAGEOFF12	l_stogir.309
     264:      	orr	x22, x16, xzr
     268:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000268:  ARM64_RELOC_PAGE21	l_stogir.310
     26c:      	ldr	x16, [x16]
		000000000000026c:  ARM64_RELOC_PAGEOFF12	l_stogir.310
     270:      	orr	x23, x16, xzr
     274:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000274:  ARM64_RELOC_PAGE21	l_stogir.311
     278:      	ldr	x16, [x16]
		0000000000000278:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     27c:      	orr	x24, x16, xzr
     280:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000280:  ARM64_RELOC_PAGE21	l_stogir.312
     284:      	ldr	x16, [x16]
		0000000000000284:  ARM64_RELOC_PAGEOFF12	l_stogir.312
     288:      	orr	x25, x16, xzr
     28c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000028c:  ARM64_RELOC_PAGE21	l_stogir.313
     290:      	ldr	x16, [x16]
		0000000000000290:  ARM64_RELOC_PAGEOFF12	l_stogir.313
     294:      	orr	x26, x16, xzr
     298:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000298:  ARM64_RELOC_PAGE21	l_stogir.314
     29c:      	ldr	x16, [x16]
		000000000000029c:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     2a0:      	orr	x27, x16, xzr
     2a4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002a4:  ARM64_RELOC_PAGE21	l_stogir.315
     2a8:      	ldr	x16, [x16]
		00000000000002a8:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     2ac:      	orr	x28, x16, xzr
     2b0:      	add	x3, x0, #0x110
     2b4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002b4:  ARM64_RELOC_PAGE21	l_stogir.316
     2b8:      	ldr	x16, [x16]
		00000000000002b8:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     2bc:      	orr	x4, x16, xzr
     2c0:      	add	x5, x0, #0x78
     2c4:      	add	x6, x0, #0x28
     2c8:      	add	x7, x0, #0x50
     2cc:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002cc:  ARM64_RELOC_PAGE21	l_stogir.316
     2d0:      	ldr	x16, [x16]
		00000000000002d0:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     2d4:      	orr	x9, x16, xzr
     2d8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002d8:  ARM64_RELOC_PAGE21	l_stogir.317
     2dc:      	ldr	x16, [x16]
		00000000000002dc:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     2e0:      	orr	x10, x16, xzr
     2e4:      	add	x11, x3, #0x28
     2e8:      	mov	x12, x1
     2ec:      	mov	x13, x2
     2f0:      	mov	x1, #0x1                ; =1
     2f4:      	movz	x2, #0x0, lsl #48
     2f8:      	b	0x3b0 <_stogir.verify.structure+0x210>
     2fc:      	ldr	x6, [sp, #0x58]
     300:      	mov	x8, #0x16               ; =22
     304:      	b	0x35c <_stogir.verify.structure+0x1bc>
     308:      	str	x8, [sp, #0xa0]
     30c:      	str	x19, [sp, #0x40]
     310:      	str	x20, [sp, #0x58]
     314:      	str	x21, [sp, #0x60]
     318:      	mov	x21, x0
     31c:      	str	x22, [sp, #0x68]
     320:      	str	x23, [sp, #0x70]
     324:      	str	x24, [sp, #0x78]
     328:      	str	x25, [sp, #0x80]
     32c:      	str	x26, [sp, #0x88]
     330:      	str	x27, [sp, #0x90]
     334:      	str	x28, [sp, #0x98]
     338:      	str	x4, [sp, #0x100]
     33c:      	mov	x0, x5
     340:      	mov	x5, x3
     344:      	mov	x3, x11
     348:      	mov	x4, x6
     34c:      	str	x9, [sp, #0x120]
     350:      	str	x10, [sp, #0x128]
     354:      	ldr	x6, [sp, #0x40]
     358:      	mov	x8, #0x23               ; =35
     35c:      	ldr	x19, [sp, #0x40]
     360:      	ldr	x20, [sp, #0x58]
     364:      	ldr	x22, [sp, #0x68]
     368:      	ldr	x23, [sp, #0x70]
     36c:      	ldr	x24, [sp, #0x78]
     370:      	ldr	x25, [sp, #0x80]
     374:      	ldr	x26, [sp, #0x88]
     378:      	ldr	x27, [sp, #0x90]
     37c:      	ldr	x28, [sp, #0x98]
     380:      	mov	x11, x3
     384:      	mov	x3, x5
     388:      	mov	x5, x0
     38c:      	mov	x0, x21
     390:      	ldr	x21, [sp, #0x60]
     394:      	ldr	x9, [sp, #0x120]
     398:      	ldr	x10, [sp, #0x128]
     39c:      	mov	x12, x6
     3a0:      	mov	x6, x4
     3a4:      	ldr	x4, [sp, #0x100]
     3a8:      	mov	x13, x8
     3ac:      	ldr	x8, [sp, #0xa0]
     3b0:      	cmp	x13, #0x0
     3b4:      	b.ne	0xc4c <_stogir.verify.structure+0xaac>
     3b8:      	ldr	x14, [x0, #0x8]
     3bc:      	cmp	x1, x14
     3c0:      	b.ge	0xc5c <_stogir.verify.structure+0xabc>
     3c4:      	lsl	x14, x1, #4
     3c8:      	lsl	x14, x1, #2
     3cc:      	ldr	x14, [x0]
     3d0:      	add	x14, x14, x1, lsl #4
     3d4:      	ldr	x14, [x14]
     3d8:      	ldr	x15, [x0, #0x78]
     3dc:      	add	x15, x15, x1, lsl #2
     3e0:      	ldr	w15, [x15]
     3e4:      	sxtw	x15, w15
     3e8:      	cmp	x15, #0x0
     3ec:      	b.lt	0x308 <_stogir.verify.structure+0x168>
     3f0:      	mov	x17, #0xffff            ; =65535
     3f4:      	cmp	x15, x17
     3f8:      	b.gt	0xc6c <_stogir.verify.structure+0xacc>
     3fc:      	str	x0, [sp, #0x30]
     400:      	uxtb	w0, w14
     404:      	str	w0, [sp, #0x38]
     408:      	str	x19, [sp, #0x40]
     40c:      	cmp	x0, #0x83
     410:      	cset	w19, lt
     414:      	uxtb	w16, w19
     418:      	cmp	w16, wzr
     41c:      	b.eq	0xcbc <_stogir.verify.structure+0xb1c>
     420:      	lsr	w14, w14, #0
     424:      	str	x0, [sp, #0x48]
     428:      	ubfx	x0, x14, #8, #8
     42c:      	str	w0, [sp, #0x50]
     430:      	lsr	w0, w0, #0
     434:      	str	x8, [sp, #0xa0]
     438:      	str	x3, [sp, #0xd8]
     43c:      	str	x5, [sp, #0xd0]
     440:      	str	x6, [sp, #0xc8]
     444:      	str	x7, [sp, #0xa8]
     448:      	str	x11, [sp, #0xe0]
     44c:      	str	x2, [sp, #0xb0]
     450:      	str	x12, [sp, #0xb8]
     454:      	str	x13, [sp, #0xc0]
     458:      	str	x20, [sp, #0x58]
     45c:      	mov	x20, x14
     460:      	str	x21, [sp, #0x60]
     464:      	ldr	x21, [sp, #0x30]
     468:      	str	x22, [sp, #0x68]
     46c:      	ldr	x22, [sp, #0x48]
     470:      	str	x23, [sp, #0x70]
     474:      	mov	x23, x4
     478:      	str	x24, [sp, #0x78]
     47c:      	ldr	w24, [sp, #0x38]
     480:      	str	x25, [sp, #0x80]
     484:      	mov	x25, x15
     488:      	str	x26, [sp, #0x88]
     48c:      	mov	x26, x1
     490:      	str	x27, [sp, #0x90]
     494:      	mov	x27, x9
     498:      	str	x28, [sp, #0x98]
     49c:      	mov	x28, x10
     4a0:      	str	w19, [sp, #0xe8]
     4a4:      	ldr	w19, [sp, #0x50]
     4a8:      	bl	0x4a8 <_stogir.verify.structure+0x308>
		00000000000004a8:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
     4ac:      	cmp	x0, #0x0
     4b0:      	b.eq	0xd08 <_stogir.verify.structure+0xb68>
     4b4:      	add	x0, x22, x28
     4b8:      	lsr	w24, w24, #0
     4bc:      	ldrsb	w0, [x0]
     4c0:      	sxtb	x0, w0
     4c4:      	cmp	x0, #0x0
     4c8:      	b.lt	0xa44 <_stogir.verify.structure+0x8a4>
     4cc:      	mov	w0, w24
     4d0:      	bl	0x4d0 <_stogir.verify.structure+0x330>
		00000000000004d0:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
     4d4:      	lsr	w0, w0, #0
     4d8:      	sxtw	x0, w0
     4dc:      	cmp	x25, x0
     4e0:      	b.eq	0xa44 <_stogir.verify.structure+0x8a4>
     4e4:      	ldr	x5, [sp, #0xd8]
     4e8:      	str	x23, [sp, #0x100]
     4ec:      	ldr	x3, [sp, #0xe0]
     4f0:      	ldr	x0, [sp, #0xd0]
     4f4:      	ldr	x4, [sp, #0xc8]
     4f8:      	ldr	x7, [sp, #0xa8]
     4fc:      	str	x27, [sp, #0x120]
     500:      	str	x28, [sp, #0x128]
     504:      	mov	x1, x26
     508:      	ldr	x2, [sp, #0xb0]
     50c:      	ldr	x6, [sp, #0x60]
     510:      	mov	x8, #0x23               ; =35
     514:      	b	0x224 <_stogir.verify.structure+0x84>
     518:      	ldr	x0, [sp, #0xc0]
     51c:      	cmp	x0, #0x0
     520:      	b.ne	0x538 <_stogir.verify.structure+0x398>
     524:      	and	x0, x2, #0xffffffff
     528:      	mov	x1, x0
     52c:      	movz	x0, #0x0, lsl #48
     530:      	movz	x2, #0x0, lsl #48
     534:      	b	0x544 <_stogir.verify.structure+0x3a4>
     538:      	ldr	x1, [sp, #0xb8]
     53c:      	mov	x2, x0
     540:      	mov	x0, #0x1                ; =1
     544:      	ldr	x3, [sp, #0xa0]
     548:      	str	x0, [x3]
     54c:      	str	x1, [x3, #0x8]
     550:      	str	x2, [x3, #0x10]
     554:      	ldr	x19, [sp, #0x160]
     558:      	ldr	x20, [sp, #0x168]
     55c:      	ldr	x21, [sp, #0x170]
     560:      	ldr	x22, [sp, #0x178]
     564:      	ldr	x23, [sp, #0x180]
     568:      	ldr	x24, [sp, #0x188]
     56c:      	ldr	x25, [sp, #0x190]
     570:      	ldr	x26, [sp, #0x198]
     574:      	ldr	x27, [sp, #0x1a0]
     578:      	ldr	x28, [sp, #0x1a8]
     57c:      	ldr	x29, [sp, #0x10]
     580:      	ldr	x30, [sp, #0x18]
     584:      	add	sp, sp, #0x1b0
     588:      	ret
     58c:      	mov	x12, x9
     590:      	lsl	x12, x12, #2
     594:      	lsr	w12, w12, #0
     598:      	ubfx	x12, x12, #0, #32
     59c:      	lsr	x11, x11, x12
     5a0:      	lsr	w11, w11, #0
     5a4:      	and	x11, x11, #0xf
     5a8:      	lsr	w11, w11, #0
     5ac:      	b	0x5c8 <_stogir.verify.structure+0x428>
     5b0:      	movz	x6, #0x0, lsl #48
     5b4:      	cmp	x6, #0x0
     5b8:      	b.eq	0xa7c <_stogir.verify.structure+0x8dc>
     5bc:      	ldr	w6, [sp, #0x158]
     5c0:      	b	0x6a0 <_stogir.verify.structure+0x500>
     5c4:      	movz	x11, #0x0, lsl #48
     5c8:      	b	0x5d0 <_stogir.verify.structure+0x430>
     5cc:      	movz	x11, #0x0, lsl #48
     5d0:      	add	x16, sp, #0x20
     5d4:      	str	x16, [sp]
     5d8:      	str	w0, [sp, #0xf0]
     5dc:      	str	x4, [sp, #0x108]
     5e0:      	str	x5, [sp, #0x110]
     5e4:      	str	x9, [sp, #0x130]
     5e8:      	str	x22, [sp, #0xf8]
     5ec:      	mov	x22, x2
     5f0:      	mov	w2, w3
     5f4:      	str	x23, [sp, #0x100]
     5f8:      	mov	x23, x1
     5fc:      	mov	w1, w0
     600:      	mov	x0, x21
     604:      	str	x25, [sp, #0x118]
     608:      	mov	x25, x6
     60c:      	str	x27, [sp, #0x120]
     610:      	mov	w27, w7
     614:      	str	x28, [sp, #0x128]
     618:      	mov	w28, w8
     61c:      	str	x20, [sp, #0x138]
     620:      	mov	w20, w10
     624:      	str	x26, [sp, #0x140]
     628:      	mov	x26, x11
     62c:      	bl	0x62c <_stogir.verify.structure+0x48c>
		000000000000062c:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     630:      	ldr	x16, [sp]
     634:      	str	x0, [x16]
     638:      	str	x1, [x16, #0x8]
     63c:      	add	x16, sp, #0x20
     640:      	ldr	x0, [x16]
     644:      	add	x16, sp, #0x20
     648:      	ldr	x1, [x16, #0x8]
     64c:      	lsr	w0, w0, #0
     650:      	lsr	x16, x0, #0
     654:      	cmp	x16, #0x1
     658:      	b.eq	0x674 <_stogir.verify.structure+0x4d4>
     65c:      	b.lo	0x664 <_stogir.verify.structure+0x4c4>
     660:      	b	0x678 <_stogir.verify.structure+0x4d8>
     664:      	cmp	x16, #0x0
     668:      	b.eq	0x670 <_stogir.verify.structure+0x4d0>
     66c:      	b	0x678 <_stogir.verify.structure+0x4d8>
     670:      	b	0x67c <_stogir.verify.structure+0x4dc>
     674:      	b	0x788 <_stogir.verify.structure+0x5e8>
     678:      	b	0xb9c <_stogir.verify.structure+0x9fc>
     67c:      	str	x23, [sp, #0x148]
     680:      	ldr	x5, [sp, #0xd8]
     684:      	ldr	x3, [sp, #0xe0]
     688:      	ldr	x0, [sp, #0xd0]
     68c:      	ldr	x4, [sp, #0xc8]
     690:      	ldr	x7, [sp, #0xa8]
     694:      	mov	w6, w19
     698:      	ldr	x1, [sp, #0x80]
     69c:      	mov	x2, #0x17               ; =23
     6a0:      	ldr	x8, [sp, #0x148]
     6a4:      	add	x8, x8, #0x1
     6a8:      	lsr	w8, w8, #0
     6ac:      	sxtw	x8, w8
     6b0:      	ldr	x26, [sp, #0x140]
     6b4:      	ldr	x25, [sp, #0x118]
     6b8:      	str	x5, [sp, #0xd8]
     6bc:      	str	w20, [sp, #0xe8]
     6c0:      	ldr	x20, [sp, #0x138]
     6c4:      	ldr	x23, [sp, #0x100]
     6c8:      	str	x3, [sp, #0xe0]
     6cc:      	str	x0, [sp, #0xd0]
     6d0:      	ldr	w0, [sp, #0xf0]
     6d4:      	str	x4, [sp, #0xc8]
     6d8:      	str	x7, [sp, #0xa8]
     6dc:      	mov	w19, w6
     6e0:      	ldr	x27, [sp, #0x120]
     6e4:      	ldr	x28, [sp, #0x128]
     6e8:      	mov	x3, x1
     6ec:      	mov	x1, x8
     6f0:      	mov	x4, x2
     6f4:      	mov	x2, x22
     6f8:      	ldr	x22, [sp, #0xf8]
     6fc:      	cmp	x4, #0x0
     700:      	b.ne	0x720 <_stogir.verify.structure+0x580>
     704:      	cmp	x1, x25
     708:      	cset	w5, le
     70c:      	ubfx	x5, x5, #0, #8
     710:      	fmov	d31, x3
     714:      	mov	x3, x5
     718:      	fmov	x5, d31
     71c:      	b	0x728 <_stogir.verify.structure+0x588>
     720:      	mov	x5, x3
     724:      	movz	x3, #0x0, lsl #48
     728:      	cmp	x3, #0x0
     72c:      	b.eq	0xd34 <_stogir.verify.structure+0xb94>
     730:      	lsr	w3, w1, #0
     734:      	sxtw	x6, w3
     738:      	cmp	x6, #0x0
     73c:      	cset	w7, gt
     740:      	cmp	x6, #0x4
     744:      	cset	w8, gt
     748:      	sub	x9, x6, #0x1
     74c:      	lsr	w9, w9, #0
     750:      	sxtw	x9, w9
     754:      	ldr	w10, [sp, #0xe8]
     758:      	uxtb	w16, w10
     75c:      	cmp	w16, wzr
     760:      	b.eq	0x5cc <_stogir.verify.structure+0x42c>
     764:      	ldr	w11, [x22]
     768:      	uxtb	w16, w7
     76c:      	cmp	w16, wzr
     770:      	b.eq	0x5c4 <_stogir.verify.structure+0x424>
     774:      	uxtb	w16, w8
     778:      	cmp	w16, wzr
     77c:      	b.eq	0x58c <_stogir.verify.structure+0x3ec>
     780:      	mov	x12, #0x4               ; =4
     784:      	b	0x590 <_stogir.verify.structure+0x3f0>
     788:      	lsr	w26, w26, #0
     78c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000078c:  ARM64_RELOC_PAGE21	l_stogir.318
     790:      	ldr	x16, [x16]
		0000000000000790:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     794:      	ldr	w0, [x16]
     798:      	orr	x2, x26, xzr
     79c:      	cmp	x2, x0
     7a0:      	b.ne	0x7ac <_stogir.verify.structure+0x60c>
     7a4:      	mov	x0, #0x1                ; =1
     7a8:      	b	0x7c4 <_stogir.verify.structure+0x624>
     7ac:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000007ac:  ARM64_RELOC_PAGE21	l_stogir.319
     7b0:      	ldr	x16, [x16]
		00000000000007b0:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     7b4:      	ldr	w0, [x16]
     7b8:      	cmp	x2, x0
     7bc:      	cset	w0, eq
     7c0:      	ubfx	x0, x0, #0, #8
     7c4:      	lsr	w1, w1, #0
     7c8:      	cmp	x0, #0x0
     7cc:      	b.eq	0xd68 <_stogir.verify.structure+0xbc8>
     7d0:      	lsr	w1, w1, #0
     7d4:      	str	x23, [sp, #0x148]
     7d8:      	mov	x23, x2
     7dc:      	str	x25, [sp, #0x150]
     7e0:      	mov	x25, x0
     7e4:      	mov	x0, x21
     7e8:      	str	w19, [sp, #0x158]
     7ec:      	mov	w19, w1
     7f0:      	bl	0x7f0 <_stogir.verify.structure+0x650>
		00000000000007f0:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
     7f4:      	cmp	x0, #0x0
     7f8:      	cset	w1, eq
     7fc:      	uxtb	w16, w1
     800:      	cmp	w16, wzr
     804:      	cset	x1, eq
     808:      	cmp	x1, #0x0
     80c:      	b.eq	0x83c <_stogir.verify.structure+0x69c>
     810:      	ldr	w0, [x0]
     814:      	uxtb	w0, w0
     818:      	cmp	x0, #0x48
     81c:      	b.ne	0x83c <_stogir.verify.structure+0x69c>
     820:      	ldr	x0, [sp, #0x88]
     824:      	mov	x2, #0x25               ; =37
     828:      	b	0x844 <_stogir.verify.structure+0x6a4>
     82c:      	ldr	x1, [sp, #0x110]
     830:      	ldr	x2, [sp, #0x108]
     834:      	movz	x0, #0x0, lsl #48
     838:      	b	0x850 <_stogir.verify.structure+0x6b0>
     83c:      	ldr	x0, [sp, #0x110]
     840:      	ldr	x2, [sp, #0x108]
     844:      	fmov	d31, x0
     848:      	mov	x0, x1
     84c:      	fmov	x1, d31
     850:      	sxtw	x19, w19
     854:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000854:  ARM64_RELOC_PAGE21	l_stogir.320
     858:      	ldr	x16, [x16]
		0000000000000858:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     85c:      	ldr	w3, [x16]
     860:      	cmp	x23, x3
     864:      	b.ne	0xd84 <_stogir.verify.structure+0xbe4>
     868:      	cmp	x19, #0x0
     86c:      	b.gt	0x9e4 <_stogir.verify.structure+0x844>
     870:      	ldr	x5, [sp, #0xd8]
     874:      	ldr	x3, [sp, #0xe0]
     878:      	movz	x4, #0x0, lsl #48
     87c:      	lsr	w4, w4, #0
     880:      	lsr	x16, x4, #0
     884:      	cmp	x16, #0x1
     888:      	b.eq	0x8a4 <_stogir.verify.structure+0x704>
     88c:      	b.lo	0x894 <_stogir.verify.structure+0x6f4>
     890:      	b	0x8a8 <_stogir.verify.structure+0x708>
     894:      	cmp	x16, #0x0
     898:      	b.eq	0x8a0 <_stogir.verify.structure+0x700>
     89c:      	b	0x8a8 <_stogir.verify.structure+0x708>
     8a0:      	b	0x8ac <_stogir.verify.structure+0x70c>
     8a4:      	b	0x8b4 <_stogir.verify.structure+0x714>
     8a8:      	b	0xc44 <_stogir.verify.structure+0xaa4>
     8ac:      	ldr	x1, [sp, #0x90]
     8b0:      	mov	x2, #0x21               ; =33
     8b4:      	cmp	x26, #0xf
     8b8:      	b.hs	0xd90 <_stogir.verify.structure+0xbf0>
     8bc:      	mov	x16, #0x1               ; =1
     8c0:      	lsl	x4, x16, x26
     8c4:      	lsr	w4, w4, #0
     8c8:      	mov	x17, #0x5e1c            ; =24092
     8cc:      	and	x4, x4, x17
     8d0:      	lsr	w4, w4, #0
     8d4:      	cmp	x4, #0x0
     8d8:      	b.eq	0xda4 <_stogir.verify.structure+0xc04>
     8dc:      	cmp	x25, #0x0
     8e0:      	b.eq	0xab4 <_stogir.verify.structure+0x914>
     8e4:      	ldr	x4, [sp, #0xc8]
     8e8:      	ldr	x7, [sp, #0xa8]
     8ec:      	mov	x6, x0
     8f0:      	ldr	x0, [sp, #0xd0]
     8f4:      	b	0x5b4 <_stogir.verify.structure+0x414>
     8f8:      	lsr	w0, w26, #0
     8fc:      	lsl	x2, x22, #2
     900:      	cmp	x22, #0x78
     904:      	cset	w24, eq
     908:      	lsr	w0, w0, #0
     90c:      	add	x2, x23, x22, lsl #2
     910:      	add	x4, x27, x22, lsl #2
     914:      	cmp	x19, #0x0
     918:      	cset	w19, eq
     91c:      	orr	x22, x2, xzr
     920:      	orr	x2, x4, xzr
     924:      	mov	x4, x3
     928:      	mov	x3, x1
     92c:      	mov	x1, #0x1                ; =1
     930:      	b	0x6fc <_stogir.verify.structure+0x55c>
     934:      	ldr	x1, [sp, #0x78]
     938:      	mov	x2, #0x1b               ; =27
     93c:      	add	x0, x0, #0x1
     940:      	cmp	x2, #0x0
     944:      	b.ne	0x964 <_stogir.verify.structure+0x7c4>
     948:      	cmp	x0, x20
     94c:      	cset	w3, lt
     950:      	ubfx	x3, x3, #0, #8
     954:      	fmov	d31, x2
     958:      	mov	x2, x3
     95c:      	fmov	x3, d31
     960:      	b	0x96c <_stogir.verify.structure+0x7cc>
     964:      	mov	x3, x2
     968:      	movz	x2, #0x0, lsl #48
     96c:      	cmp	x2, #0x0
     970:      	b.eq	0x8f8 <_stogir.verify.structure+0x758>
     974:      	add	x2, x0, x26
     978:      	ldr	x4, [x21, #0x78]
     97c:      	lsl	x5, x2, #2
     980:      	add	x2, x4, x2, lsl #2
     984:      	ldr	w2, [x2]
     988:      	sxtw	x2, w2
     98c:      	cmn	x2, #0x1
     990:      	b.ne	0x934 <_stogir.verify.structure+0x794>
     994:      	mov	x2, x3
     998:      	b	0x93c <_stogir.verify.structure+0x79c>
     99c:      	ldr	x0, [sp, #0xb8]
     9a0:      	ldr	x1, [sp, #0xc0]
     9a4:      	add	x2, x25, #0x4
     9a8:      	ldr	x3, [x21, #0x8]
     9ac:      	asr	x16, x2, #63
     9b0:      	lsr	x16, x16, #62
     9b4:      	add	x2, x2, x16
     9b8:      	asr	x2, x2, #2
     9bc:      	orr	x20, x2, xzr
     9c0:      	add	x2, x20, x26
     9c4:      	cmp	x2, x3
     9c8:      	b.le	0x9d4 <_stogir.verify.structure+0x834>
     9cc:      	ldr	x0, [sp, #0x70]
     9d0:      	mov	x1, #0x15               ; =21
     9d4:      	mov	x2, x1
     9d8:      	mov	x1, x0
     9dc:      	mov	x0, #0x1                ; =1
     9e0:      	b	0x940 <_stogir.verify.structure+0x7a0>
     9e4:      	ldr	x3, [sp, #0xe0]
     9e8:      	ldr	x4, [x3, #0x8]
     9ec:      	cmp	x19, x4
     9f0:      	b.gt	0xdb8 <_stogir.verify.structure+0xc18>
     9f4:      	sub	x4, x19, #0x1
     9f8:      	ldr	x5, [sp, #0xd8]
     9fc:      	ldr	x6, [x5, #0x28]
     a00:      	mov	x17, #0x18              ; =24
     a04:      	mul	x4, x4, x17
     a08:      	add	x4, x4, x6
     a0c:      	ldr	x6, [x4]
     a10:      	ldr	x4, [x4, #0x8]
     a14:      	ldr	x7, [x5, #0x8]
     a18:      	cmp	x6, #0x0
     a1c:      	b.lt	0xa74 <_stogir.verify.structure+0x8d4>
     a20:      	cmp	x6, x7
     a24:      	b.gt	0xa74 <_stogir.verify.structure+0x8d4>
     a28:      	cmp	x4, #0x0
     a2c:      	b.lt	0xa74 <_stogir.verify.structure+0x8d4>
     a30:      	sub	x6, x7, x6
     a34:      	cmp	x4, x6
     a38:      	b.gt	0xa74 <_stogir.verify.structure+0x8d4>
     a3c:      	mov	x4, #0x1                ; =1
     a40:      	b	0xa78 <_stogir.verify.structure+0x8d8>
     a44:      	mov	w0, w24
     a48:      	bl	0xa48 <_stogir.verify.structure+0x8a8>
		0000000000000a48:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
     a4c:      	lsr	w0, w0, #0
     a50:      	sxtw	x0, w0
     a54:      	cmn	x0, #0x1
     a58:      	b.ne	0x99c <_stogir.verify.structure+0x7fc>
     a5c:      	ubfx	x0, x20, #16, #16
     a60:      	cmp	x25, x0
     a64:      	b.eq	0x99c <_stogir.verify.structure+0x7fc>
     a68:      	ldr	x0, [sp, #0x68]
     a6c:      	mov	x1, #0x24               ; =36
     a70:      	b	0x9a4 <_stogir.verify.structure+0x804>
     a74:      	movz	x4, #0x0, lsl #48
     a78:      	b	0x87c <_stogir.verify.structure+0x6dc>
     a7c:      	cmp	x19, #0x0
     a80:      	b.ne	0xdc0 <_stogir.verify.structure+0xc20>
     a84:      	uxtb	w16, w20
     a88:      	cmp	w16, wzr
     a8c:      	b.eq	0xba4 <_stogir.verify.structure+0xa04>
     a90:      	ldr	w6, [x22]
     a94:      	uxtb	w16, w27
     a98:      	cmp	w16, wzr
     a9c:      	b.eq	0xbe4 <_stogir.verify.structure+0xa44>
     aa0:      	uxtb	w16, w28
     aa4:      	cmp	w16, wzr
     aa8:      	b.eq	0xc18 <_stogir.verify.structure+0xa78>
     aac:      	mov	x8, #0x4                ; =4
     ab0:      	b	0xc1c <_stogir.verify.structure+0xa7c>
     ab4:      	cmp	x19, #0x0
     ab8:      	b.le	0xdc8 <_stogir.verify.structure+0xc28>
     abc:      	ldr	x0, [x21, #0x8]
     ac0:      	cmp	x19, x0
     ac4:      	b.ge	0xdd0 <_stogir.verify.structure+0xc30>
     ac8:      	ldr	x0, [sp, #0xd0]
     acc:      	ldr	x4, [x0, #0x8]
     ad0:      	cmp	x19, x4
     ad4:      	b.ge	0xbf4 <_stogir.verify.structure+0xa54>
     ad8:      	lsl	x4, x19, #2
     adc:      	ldr	x4, [x21, #0x78]
     ae0:      	add	x4, x4, x19, lsl #2
     ae4:      	ldr	w4, [x4]
     ae8:      	sxtw	x4, w4
     aec:      	cmp	x4, #0x0
     af0:      	cset	w4, ge
     af4:      	ubfx	x4, x4, #0, #8
     af8:      	b	0xbf8 <_stogir.verify.structure+0xa58>
     afc:      	uxtb	w16, w24
     b00:      	cmp	w16, wzr
     b04:      	b.eq	0xdd8 <_stogir.verify.structure+0xc38>
     b08:      	ldr	w6, [sp, #0x158]
     b0c:      	uxtb	w16, w6
     b10:      	cmp	w16, wzr
     b14:      	b.eq	0xb24 <_stogir.verify.structure+0x984>
     b18:      	ldr	x8, [sp, #0x150]
     b1c:      	cmp	x8, #0x2
     b20:      	b.eq	0x5c0 <_stogir.verify.structure+0x420>
     b24:      	ldr	x1, [sp, #0x98]
     b28:      	mov	x2, #0x1a               ; =26
     b2c:      	b	0x5c0 <_stogir.verify.structure+0x420>
     b30:      	movz	x4, #0x0, lsl #48
     b34:      	ldr	x7, [sp, #0xa8]
     b38:      	mov	x6, x4
     b3c:      	ldr	x4, [sp, #0xc8]
     b40:      	b	0x5b4 <_stogir.verify.structure+0x414>
     b44:      	cmp	x19, #0x0
     b48:      	b.ge	0xde0 <_stogir.verify.structure+0xc40>
     b4c:      	ldr	x4, [sp, #0xc8]
     b50:      	ldr	x6, [x4, #0x8]
     b54:      	ldr	x7, [sp, #0xa8]
     b58:      	ldr	x8, [x7, #0x8]
     b5c:      	cmp	x6, x8
     b60:      	b.ne	0xbec <_stogir.verify.structure+0xa4c>
     b64:      	movz	x16, #0x0, lsl #48
     b68:      	sub	x8, x16, x19
     b6c:      	cmp	x8, x6
     b70:      	b.gt	0xc3c <_stogir.verify.structure+0xa9c>
     b74:      	sub	x6, x8, #0x1
     b78:      	ldr	x8, [x21, #0x50]
     b7c:      	lsl	x9, x6, #2
     b80:      	add	x6, x8, x6, lsl #2
     b84:      	ldr	w6, [x6]
     b88:      	sxtw	x6, w6
     b8c:      	cmp	x6, #0x0
     b90:      	cset	w6, gt
     b94:      	ubfx	x6, x6, #0, #8
     b98:      	b	0xc40 <_stogir.verify.structure+0xaa0>
     b9c:      	brk	#0
     ba0:      	b	0xb9c <_stogir.verify.structure+0x9fc>
     ba4:      	movz	x6, #0x0, lsl #48
     ba8:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ba8:  ARM64_RELOC_PAGE21	l_stogir.321
     bac:      	ldr	x16, [x16]
		0000000000000bac:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     bb0:      	ldr	w8, [x16]
     bb4:      	lsr	w6, w6, #0
     bb8:      	cmp	x6, x8
     bbc:      	b.ne	0xbc8 <_stogir.verify.structure+0xa28>
     bc0:      	ldr	w6, [sp, #0x158]
     bc4:      	b	0x5c0 <_stogir.verify.structure+0x420>
     bc8:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000bc8:  ARM64_RELOC_PAGE21	l_stogir.322
     bcc:      	ldr	x16, [x16]
		0000000000000bcc:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     bd0:      	ldr	w8, [x16]
     bd4:      	cmp	x6, x8
     bd8:      	b.ne	0xbfc <_stogir.verify.structure+0xa5c>
     bdc:      	ldr	w6, [sp, #0x158]
     be0:      	b	0x5c0 <_stogir.verify.structure+0x420>
     be4:      	movz	x6, #0x0, lsl #48
     be8:      	b	0xba8 <_stogir.verify.structure+0xa08>
     bec:      	movz	x6, #0x0, lsl #48
     bf0:      	b	0x5b4 <_stogir.verify.structure+0x414>
     bf4:      	movz	x4, #0x0, lsl #48
     bf8:      	b	0xb34 <_stogir.verify.structure+0x994>
     bfc:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000bfc:  ARM64_RELOC_PAGE21	l_stogir.323
     c00:      	ldr	x16, [x16]
		0000000000000c00:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     c04:      	ldr	w8, [x16]
     c08:      	cmp	x6, x8
     c0c:      	b.ne	0xafc <_stogir.verify.structure+0x95c>
     c10:      	ldr	w6, [sp, #0x158]
     c14:      	b	0x5c0 <_stogir.verify.structure+0x420>
     c18:      	ldr	x8, [sp, #0x130]
     c1c:      	lsl	x8, x8, #2
     c20:      	lsr	w8, w8, #0
     c24:      	ubfx	x8, x8, #0, #32
     c28:      	lsr	x6, x6, x8
     c2c:      	lsr	w6, w6, #0
     c30:      	and	x6, x6, #0xf
     c34:      	lsr	w6, w6, #0
     c38:      	b	0xbe8 <_stogir.verify.structure+0xa48>
     c3c:      	movz	x6, #0x0, lsl #48
     c40:      	b	0xbf0 <_stogir.verify.structure+0xa50>
     c44:      	brk	#0
     c48:      	b	0xc44 <_stogir.verify.structure+0xaa4>
     c4c:      	str	x8, [sp, #0xa0]
     c50:      	str	x12, [sp, #0xb8]
     c54:      	str	x13, [sp, #0xc0]
     c58:      	b	0x518 <_stogir.verify.structure+0x378>
     c5c:      	str	x8, [sp, #0xa0]
     c60:      	str	x12, [sp, #0xb8]
     c64:      	str	x13, [sp, #0xc0]
     c68:      	b	0x518 <_stogir.verify.structure+0x378>
     c6c:      	str	x8, [sp, #0xa0]
     c70:      	str	x19, [sp, #0x40]
     c74:      	str	x20, [sp, #0x58]
     c78:      	str	x21, [sp, #0x60]
     c7c:      	mov	x21, x0
     c80:      	str	x22, [sp, #0x68]
     c84:      	str	x23, [sp, #0x70]
     c88:      	str	x24, [sp, #0x78]
     c8c:      	str	x25, [sp, #0x80]
     c90:      	str	x26, [sp, #0x88]
     c94:      	str	x27, [sp, #0x90]
     c98:      	str	x28, [sp, #0x98]
     c9c:      	str	x4, [sp, #0x100]
     ca0:      	mov	x0, x5
     ca4:      	mov	x5, x3
     ca8:      	mov	x3, x11
     cac:      	mov	x4, x6
     cb0:      	str	x9, [sp, #0x120]
     cb4:      	str	x10, [sp, #0x128]
     cb8:      	b	0x354 <_stogir.verify.structure+0x1b4>
     cbc:      	str	x8, [sp, #0xa0]
     cc0:      	str	x20, [sp, #0x58]
     cc4:      	str	x21, [sp, #0x60]
     cc8:      	ldr	x21, [sp, #0x30]
     ccc:      	str	x22, [sp, #0x68]
     cd0:      	str	x23, [sp, #0x70]
     cd4:      	str	x24, [sp, #0x78]
     cd8:      	str	x25, [sp, #0x80]
     cdc:      	str	x26, [sp, #0x88]
     ce0:      	str	x27, [sp, #0x90]
     ce4:      	str	x28, [sp, #0x98]
     ce8:      	str	x4, [sp, #0x100]
     cec:      	mov	x0, x5
     cf0:      	mov	x5, x3
     cf4:      	mov	x3, x11
     cf8:      	mov	x4, x6
     cfc:      	str	x9, [sp, #0x120]
     d00:      	str	x10, [sp, #0x128]
     d04:      	b	0x2fc <_stogir.verify.structure+0x15c>
     d08:      	mov	x1, x26
     d0c:      	ldr	x2, [sp, #0xb0]
     d10:      	ldr	x5, [sp, #0xd8]
     d14:      	str	x23, [sp, #0x100]
     d18:      	ldr	x3, [sp, #0xe0]
     d1c:      	ldr	x0, [sp, #0xd0]
     d20:      	ldr	x4, [sp, #0xc8]
     d24:      	ldr	x7, [sp, #0xa8]
     d28:      	str	x27, [sp, #0x120]
     d2c:      	str	x28, [sp, #0x128]
     d30:      	b	0x2fc <_stogir.verify.structure+0x15c>
     d34:      	str	x26, [sp, #0x140]
     d38:      	str	x20, [sp, #0x138]
     d3c:      	str	x5, [sp, #0x110]
     d40:      	ldr	x5, [sp, #0xd8]
     d44:      	str	x4, [sp, #0x108]
     d48:      	str	x23, [sp, #0x100]
     d4c:      	ldr	x3, [sp, #0xe0]
     d50:      	ldr	x0, [sp, #0xd0]
     d54:      	ldr	x4, [sp, #0xc8]
     d58:      	ldr	x7, [sp, #0xa8]
     d5c:      	str	x27, [sp, #0x120]
     d60:      	str	x28, [sp, #0x128]
     d64:      	b	0x200 <_stogir.verify.structure+0x60>
     d68:      	str	x23, [sp, #0x148]
     d6c:      	mov	x23, x2
     d70:      	str	x25, [sp, #0x150]
     d74:      	mov	x25, x0
     d78:      	str	w19, [sp, #0x158]
     d7c:      	mov	w19, w1
     d80:      	b	0x82c <_stogir.verify.structure+0x68c>
     d84:      	ldr	x5, [sp, #0xd8]
     d88:      	ldr	x3, [sp, #0xe0]
     d8c:      	b	0x8b4 <_stogir.verify.structure+0x714>
     d90:      	ldr	x0, [sp, #0xd0]
     d94:      	ldr	x4, [sp, #0xc8]
     d98:      	ldr	x7, [sp, #0xa8]
     d9c:      	ldr	w6, [sp, #0x158]
     da0:      	b	0x5c0 <_stogir.verify.structure+0x420>
     da4:      	ldr	x0, [sp, #0xd0]
     da8:      	ldr	x4, [sp, #0xc8]
     dac:      	ldr	x7, [sp, #0xa8]
     db0:      	ldr	w6, [sp, #0x158]
     db4:      	b	0x5c0 <_stogir.verify.structure+0x420>
     db8:      	ldr	x5, [sp, #0xd8]
     dbc:      	b	0x878 <_stogir.verify.structure+0x6d8>
     dc0:      	ldr	w6, [sp, #0x158]
     dc4:      	b	0xb24 <_stogir.verify.structure+0x984>
     dc8:      	ldr	x0, [sp, #0xd0]
     dcc:      	b	0xb44 <_stogir.verify.structure+0x9a4>
     dd0:      	ldr	x0, [sp, #0xd0]
     dd4:      	b	0xb30 <_stogir.verify.structure+0x990>
     dd8:      	ldr	w6, [sp, #0x158]
     ddc:      	b	0xb24 <_stogir.verify.structure+0x984>
     de0:      	ldr	x4, [sp, #0xc8]
     de4:      	ldr	x7, [sp, #0xa8]
     de8:      	b	0x5b0 <_stogir.verify.structure+0x410>
