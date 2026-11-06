
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/finite-countdown/build/structure-speed/before.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000170 <_stogir.verify.structure>:
     170:      	sub	sp, sp, #0x110
     174:      	str	x29, [sp, #0x10]
     178:      	str	x30, [sp, #0x18]
     17c:      	add	x29, sp, #0x10
     180:      	str	x19, [sp, #0xb8]
     184:      	str	x20, [sp, #0xc0]
     188:      	str	x21, [sp, #0xc8]
     18c:      	str	x22, [sp, #0xd0]
     190:      	str	x23, [sp, #0xd8]
     194:      	str	x24, [sp, #0xe0]
     198:      	str	x25, [sp, #0xe8]
     19c:      	str	x26, [sp, #0xf0]
     1a0:      	str	x27, [sp, #0xf8]
     1a4:      	str	x28, [sp, #0x100]
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
     1cc:      	ldr	x1, [sp, #0x88]
     1d0:      	ldr	x5, [sp, #0x90]
     1d4:      	add	x5, x1, x5
     1d8:      	ldr	x20, [sp, #0x40]
     1dc:      	add	x1, x20, #0x1
     1e0:      	sxtw	x20, w1
     1e4:      	b	0x228 <_stogir.verify.structure+0xb8>
     1e8:      	adrp	x19, 0x0 <_gap_verify_graph>
		00000000000001e8:  ARM64_RELOC_PAGE21	l_stogir.312
     1ec:      	ldr	x19, [x19]
		00000000000001ec:  ARM64_RELOC_PAGEOFF12	l_stogir.312
     1f0:      	mov	x20, #0x2c              ; =44
     1f4:      	add	x21, x0, #0x110
     1f8:      	add	x22, x0, #0x78
     1fc:      	add	x23, x0, #0x28
     200:      	add	x24, x0, #0x50
     204:      	add	x25, x21, #0x28
     208:      	mov	x26, #0x1               ; =1
     20c:      	movz	x27, #0x0, lsl #48
     210:      	b	0x28c <_stogir.verify.structure+0x11c>
     214:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000214:  ARM64_RELOC_PAGE21	l_stogir.313
     218:      	ldr	x16, [x16]
		0000000000000218:  ARM64_RELOC_PAGEOFF12	l_stogir.313
     21c:      	str	x16, [sp, #0x38]
     220:      	mov	x16, #0x16              ; =22
     224:      	str	x16, [sp, #0x80]
     228:      	b	0x264 <_stogir.verify.structure+0xf4>
     22c:      	nop
     230:      	mov	x5, x26
     234:      	mov	x20, x27
     238:      	str	x8, [sp, #0x30]
     23c:      	mov	x19, x0
     240:      	mov	x2, x21
     244:      	mov	x0, x22
     248:      	mov	x3, x23
     24c:      	mov	x4, x24
     250:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000250:  ARM64_RELOC_PAGE21	l_stogir.314
     254:      	ldr	x16, [x16]
		0000000000000254:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     258:      	str	x16, [sp, #0x38]
     25c:      	mov	x16, #0x23              ; =35
     260:      	str	x16, [sp, #0x80]
     264:      	ldr	x8, [sp, #0x30]
     268:      	mov	x21, x2
     26c:      	mov	x22, x0
     270:      	mov	x0, x19
     274:      	mov	x23, x3
     278:      	mov	x24, x4
     27c:      	mov	x26, x5
     280:      	mov	x27, x20
     284:      	ldr	x19, [sp, #0x38]
     288:      	ldr	x20, [sp, #0x80]
     28c:      	cmp	x20, #0x0
     290:      	b.ne	0xa4c <_stogir.verify.structure+0x8dc>
     294:      	ldr	x1, [x0, #0x8]
     298:      	cmp	x26, x1
     29c:      	b.ge	0xa60 <_stogir.verify.structure+0x8f0>
     2a0:      	ldr	x1, [x0]
     2a4:      	add	x1, x1, x26, lsl #4
     2a8:      	ldr	x1, [x1]
     2ac:      	ldr	x2, [x0, #0x78]
     2b0:      	add	x2, x2, x26, lsl #2
     2b4:      	ldr	w2, [x2]
     2b8:      	sxtw	x28, w2
     2bc:      	cmp	x28, #0x0
     2c0:      	b.lt	0x230 <_stogir.verify.structure+0xc0>
     2c4:      	mov	x17, #0xffff            ; =65535
     2c8:      	cmp	x28, x17
     2cc:      	b.gt	0xa74 <_stogir.verify.structure+0x904>
     2d0:      	uxtb	w2, w1
     2d4:      	orr	x3, x2, xzr
     2d8:      	cmp	x3, #0x83
     2dc:      	cset	w4, lt
     2e0:      	uxtb	w16, w4
     2e4:      	cmp	w16, wzr
     2e8:      	b.eq	0xa98 <_stogir.verify.structure+0x928>
     2ec:      	ubfx	x1, x1, #0, #32
     2f0:      	ubfx	x5, x1, #8, #8
     2f4:      	orr	x6, x5, xzr
     2f8:      	str	x8, [sp, #0x30]
     2fc:      	str	x19, [sp, #0x38]
     300:      	mov	x19, x0
     304:      	mov	w0, w6
     308:      	str	x27, [sp, #0x40]
     30c:      	mov	w27, w2
     310:      	str	x24, [sp, #0x48]
     314:      	mov	x24, x3
     318:      	str	x23, [sp, #0x50]
     31c:      	mov	w23, w4
     320:      	str	x22, [sp, #0x58]
     324:      	mov	x22, x1
     328:      	str	x21, [sp, #0x60]
     32c:      	mov	w21, w5
     330:      	bl	0x330 <_stogir.verify.structure+0x1c0>
		0000000000000330:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
     334:      	cmp	x0, #0x0
     338:      	b.eq	0xabc <_stogir.verify.structure+0x94c>
     33c:      	adrp	x17, 0x0 <_gap_verify_graph>
		000000000000033c:  ARM64_RELOC_PAGE21	l_stogir.315
     340:      	ldr	x17, [x17]
		0000000000000340:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     344:      	add	x0, x24, x17
     348:      	ldrsb	w0, [x0]
     34c:      	sxtb	x0, w0
     350:      	cmp	x0, #0x0
     354:      	b.lt	0x76c <_stogir.verify.structure+0x5fc>
     358:      	uxtb	w16, w23
     35c:      	cmp	w16, wzr
     360:      	b.eq	0x840 <_stogir.verify.structure+0x6d0>
     364:      	adrp	x17, 0x0 <_gap_verify_graph>
		0000000000000364:  ARM64_RELOC_PAGE21	l_stogir.315
     368:      	ldr	x17, [x17]
		0000000000000368:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     36c:      	add	x0, x24, x17
     370:      	ldrsb	w0, [x0]
     374:      	sxtb	w0, w0
     378:      	b	0x844 <_stogir.verify.structure+0x6d4>
     37c:      	ldr	x0, [sp, #0x38]
     380:      	ldr	x1, [sp, #0x80]
     384:      	adrp	x2, 0x0 <_gap_verify_graph>
		0000000000000384:  ARM64_RELOC_PAGE21	l_stogir.311
     388:      	ldr	x2, [x2]
		0000000000000388:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     38c:      	movz	x3, #0x0, lsl #48
     390:      	bl	0x390 <_stogir.verify.structure+0x220>
		0000000000000390:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     394:      	cmp	x0, #0x0
     398:      	b.eq	0xad8 <_stogir.verify.structure+0x968>
     39c:      	and	x0, x20, #0xffffffff
     3a0:      	movz	x1, #0x0, lsl #48
     3a4:      	movz	x16, #0x0, lsl #48
     3a8:      	str	x16, [sp, #0x80]
     3ac:      	b	0x3b4 <_stogir.verify.structure+0x244>
     3b0:      	mov	x1, #0x1                ; =1
     3b4:      	ldr	x2, [sp, #0x30]
     3b8:      	str	x1, [x2]
     3bc:      	str	x0, [x2, #0x8]
     3c0:      	ldr	x0, [sp, #0x80]
     3c4:      	str	x0, [x2, #0x10]
     3c8:      	ldr	x19, [sp, #0xb8]
     3cc:      	ldr	x20, [sp, #0xc0]
     3d0:      	ldr	x21, [sp, #0xc8]
     3d4:      	ldr	x22, [sp, #0xd0]
     3d8:      	ldr	x23, [sp, #0xd8]
     3dc:      	ldr	x24, [sp, #0xe0]
     3e0:      	ldr	x25, [sp, #0xe8]
     3e4:      	ldr	x26, [sp, #0xf0]
     3e8:      	ldr	x27, [sp, #0xf8]
     3ec:      	ldr	x28, [sp, #0x100]
     3f0:      	ldr	x29, [sp, #0x10]
     3f4:      	ldr	x30, [sp, #0x18]
     3f8:      	add	sp, sp, #0x110
     3fc:      	ret
     400:      	mov	w9, w5
     404:      	lsl	w9, w9, #2
     408:      	ubfx	x9, x9, #0, #32
     40c:      	lsr	x8, x8, x9
     410:      	and	w8, w8, #0xf
     414:      	b	0x434 <_stogir.verify.structure+0x2c4>
     418:      	movz	x1, #0x0, lsl #48
     41c:      	cmp	x1, #0x0
     420:      	b.eq	0x880 <_stogir.verify.structure+0x710>
     424:      	ldr	w1, [sp, #0xb0]
     428:      	ldr	w5, [sp, #0xa8]
     42c:      	b	0x4dc <_stogir.verify.structure+0x36c>
     430:      	movz	w8, #0x0, lsl #16
     434:      	b	0x43c <_stogir.verify.structure+0x2cc>
     438:      	movz	w8, #0x0, lsl #16
     43c:      	str	w0, [sp, #0x68]
     440:      	str	x2, [sp, #0x98]
     444:      	mov	w2, w3
     448:      	str	x4, [sp, #0xa0]
     44c:      	str	x24, [sp, #0x70]
     450:      	mov	x24, x1
     454:      	mov	w1, w0
     458:      	mov	x0, x19
     45c:      	str	x28, [sp, #0x78]
     460:      	mov	w28, w7
     464:      	str	x20, [sp, #0x80]
     468:      	mov	w20, w8
     46c:      	str	x22, [sp, #0x88]
     470:      	mov	w22, w5
     474:      	str	x26, [sp, #0x90]
     478:      	mov	w26, w6
     47c:      	bl	0x47c <_stogir.verify.structure+0x30c>
		000000000000047c:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     480:      	ubfx	x0, x0, #0, #32
     484:      	lsr	x16, x0, #0
     488:      	cmp	x16, #0x1
     48c:      	b.eq	0x4a8 <_stogir.verify.structure+0x338>
     490:      	b.lo	0x498 <_stogir.verify.structure+0x328>
     494:      	b	0x4ac <_stogir.verify.structure+0x33c>
     498:      	cmp	x16, #0x0
     49c:      	b.eq	0x4a4 <_stogir.verify.structure+0x334>
     4a0:      	b	0x4ac <_stogir.verify.structure+0x33c>
     4a4:      	b	0x4b0 <_stogir.verify.structure+0x340>
     4a8:      	b	0x590 <_stogir.verify.structure+0x420>
     4ac:      	b	0x9b4 <_stogir.verify.structure+0x844>
     4b0:      	ldr	x2, [sp, #0x60]
     4b4:      	ldr	x0, [sp, #0x58]
     4b8:      	ldr	x3, [sp, #0x50]
     4bc:      	ldr	x4, [sp, #0x48]
     4c0:      	mov	w1, w27
     4c4:      	mov	w5, w21
     4c8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000004c8:  ARM64_RELOC_PAGE21	l_stogir.316
     4cc:      	ldr	x16, [x16]
		00000000000004cc:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     4d0:      	str	x16, [sp, #0x38]
     4d4:      	mov	x16, #0x17              ; =23
     4d8:      	str	x16, [sp, #0x80]
     4dc:      	ldr	x6, [sp, #0x98]
     4e0:      	add	x6, x6, #0x1
     4e4:      	sxtw	x6, w6
     4e8:      	ldr	x26, [sp, #0x90]
     4ec:      	ldr	x28, [sp, #0x78]
     4f0:      	ldr	x22, [sp, #0x88]
     4f4:      	str	x2, [sp, #0x60]
     4f8:      	str	x0, [sp, #0x58]
     4fc:      	ldr	w0, [sp, #0x68]
     500:      	str	x3, [sp, #0x50]
     504:      	str	x4, [sp, #0x48]
     508:      	mov	w27, w1
     50c:      	mov	w21, w5
     510:      	mov	x1, x24
     514:      	ldr	x24, [sp, #0x70]
     518:      	mov	x2, x6
     51c:      	ldr	x20, [sp, #0x80]
     520:      	cmp	x20, #0x0
     524:      	b.ne	0x538 <_stogir.verify.structure+0x3c8>
     528:      	cmp	x2, x28
     52c:      	cset	w3, le
     530:      	ubfx	x3, x3, #0, #8
     534:      	b	0x53c <_stogir.verify.structure+0x3cc>
     538:      	movz	x3, #0x0, lsl #48
     53c:      	cmp	x3, #0x0
     540:      	b.eq	0xae0 <_stogir.verify.structure+0x970>
     544:      	orr	w3, w2, wzr
     548:      	sxtw	x4, w3
     54c:      	sub	w5, w3, #0x1
     550:      	cmp	x4, #0x0
     554:      	cset	w6, gt
     558:      	cmp	x4, #0x4
     55c:      	cset	w7, gt
     560:      	uxtb	w16, w23
     564:      	cmp	w16, wzr
     568:      	b.eq	0x438 <_stogir.verify.structure+0x2c8>
     56c:      	ldr	w8, [x24]
     570:      	uxtb	w16, w6
     574:      	cmp	w16, wzr
     578:      	b.eq	0x430 <_stogir.verify.structure+0x2c0>
     57c:      	uxtb	w16, w7
     580:      	cmp	w16, wzr
     584:      	b.eq	0x400 <_stogir.verify.structure+0x290>
     588:      	mov	w9, #0x4                ; =4
     58c:      	b	0x404 <_stogir.verify.structure+0x294>
     590:      	ubfx	x20, x20, #0, #32
     594:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000594:  ARM64_RELOC_PAGE21	l_stogir.317
     598:      	ldr	x16, [x16]
		0000000000000598:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     59c:      	ldr	w0, [x16]
     5a0:      	cmp	x20, x0
     5a4:      	b.ne	0x5b8 <_stogir.verify.structure+0x448>
     5a8:      	mov	x0, #0x1                ; =1
     5ac:      	b	0x5d0 <_stogir.verify.structure+0x460>
     5b0:      	movz	x1, #0x0, lsl #48
     5b4:      	b	0x630 <_stogir.verify.structure+0x4c0>
     5b8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000005b8:  ARM64_RELOC_PAGE21	l_stogir.318
     5bc:      	ldr	x16, [x16]
		00000000000005bc:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     5c0:      	ldr	w0, [x16]
     5c4:      	cmp	x20, x0
     5c8:      	cset	w0, eq
     5cc:      	ubfx	x0, x0, #0, #8
     5d0:      	cmp	x0, #0x0
     5d4:      	b.eq	0xb00 <_stogir.verify.structure+0x990>
     5d8:      	str	w21, [sp, #0xa8]
     5dc:      	mov	x21, x0
     5e0:      	mov	x0, x19
     5e4:      	str	w27, [sp, #0xb0]
     5e8:      	mov	w27, w1
     5ec:      	bl	0x5ec <_stogir.verify.structure+0x47c>
		00000000000005ec:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
     5f0:      	cmp	x0, #0x0
     5f4:      	cset	w1, eq
     5f8:      	uxtb	w16, w1
     5fc:      	cmp	w16, wzr
     600:      	cset	x1, eq
     604:      	cmp	x1, #0x0
     608:      	b.eq	0x630 <_stogir.verify.structure+0x4c0>
     60c:      	ldr	w0, [x0]
     610:      	uxtb	w0, w0
     614:      	cmp	x0, #0x48
     618:      	b.ne	0x630 <_stogir.verify.structure+0x4c0>
     61c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000061c:  ARM64_RELOC_PAGE21	l_stogir.319
     620:      	ldr	x16, [x16]
		0000000000000620:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     624:      	str	x16, [sp, #0x38]
     628:      	mov	x16, #0x25              ; =37
     62c:      	str	x16, [sp, #0x80]
     630:      	sxtw	x27, w27
     634:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000634:  ARM64_RELOC_PAGE21	l_stogir.320
     638:      	ldr	x16, [x16]
		0000000000000638:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     63c:      	ldr	w0, [x16]
     640:      	cmp	x20, x0
     644:      	b.ne	0xb14 <_stogir.verify.structure+0x9a4>
     648:      	cmp	x27, #0x0
     64c:      	b.gt	0x7dc <_stogir.verify.structure+0x66c>
     650:      	ldr	x2, [sp, #0x60]
     654:      	movz	w0, #0x0, lsl #16
     658:      	ubfx	x0, x0, #0, #32
     65c:      	lsr	x16, x0, #0
     660:      	cmp	x16, #0x1
     664:      	b.eq	0x680 <_stogir.verify.structure+0x510>
     668:      	b.lo	0x670 <_stogir.verify.structure+0x500>
     66c:      	b	0x684 <_stogir.verify.structure+0x514>
     670:      	cmp	x16, #0x0
     674:      	b.eq	0x67c <_stogir.verify.structure+0x50c>
     678:      	b	0x684 <_stogir.verify.structure+0x514>
     67c:      	b	0x688 <_stogir.verify.structure+0x518>
     680:      	b	0x69c <_stogir.verify.structure+0x52c>
     684:      	b	0xa44 <_stogir.verify.structure+0x8d4>
     688:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000688:  ARM64_RELOC_PAGE21	l_stogir.321
     68c:      	ldr	x16, [x16]
		000000000000068c:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     690:      	str	x16, [sp, #0x38]
     694:      	mov	x16, #0x21              ; =33
     698:      	str	x16, [sp, #0x80]
     69c:      	cmp	x20, #0xf
     6a0:      	b.hs	0xb1c <_stogir.verify.structure+0x9ac>
     6a4:      	mov	x16, #0x1               ; =1
     6a8:      	lsl	x0, x16, x20
     6ac:      	mov	w17, #0x5e1c            ; =24092
     6b0:      	and	w0, w0, w17
     6b4:      	ubfx	x0, x0, #0, #32
     6b8:      	cmp	x0, #0x0
     6bc:      	b.eq	0xb34 <_stogir.verify.structure+0x9c4>
     6c0:      	cmp	x21, #0x0
     6c4:      	b.eq	0x8c8 <_stogir.verify.structure+0x758>
     6c8:      	ldr	x0, [sp, #0x58]
     6cc:      	ldr	x3, [sp, #0x50]
     6d0:      	ldr	x4, [sp, #0x48]
     6d4:      	b	0x41c <_stogir.verify.structure+0x2ac>
     6d8:      	orr	w0, w26, wzr
     6dc:      	cmp	x24, #0x78
     6e0:      	cset	w27, eq
     6e4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000006e4:  ARM64_RELOC_PAGE21	l_stogir.322
     6e8:      	ldr	x16, [x16]
		00000000000006e8:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     6ec:      	add	x1, x16, x24, lsl #2
     6f0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000006f0:  ARM64_RELOC_PAGE21	l_stogir.322
     6f4:      	ldr	x16, [x16]
		00000000000006f4:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     6f8:      	add	x2, x16, x24, lsl #2
     6fc:      	cmp	x21, #0x0
     700:      	cset	w21, eq
     704:      	orr	x24, x1, xzr
     708:      	orr	x1, x2, xzr
     70c:      	mov	x2, #0x1                ; =1
     710:      	b	0x520 <_stogir.verify.structure+0x3b0>
     714:      	nop
     718:      	movz	x1, #0x0, lsl #48
     71c:      	cmp	x1, #0x0
     720:      	b.eq	0x6d8 <_stogir.verify.structure+0x568>
     724:      	add	x1, x0, x26
     728:      	ldr	x2, [x19, #0x78]
     72c:      	add	x1, x2, x1, lsl #2
     730:      	ldr	w1, [x1]
     734:      	sxtw	x1, w1
     738:      	cmn	x1, #0x1
     73c:      	b.eq	0x750 <_stogir.verify.structure+0x5e0>
     740:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000740:  ARM64_RELOC_PAGE21	l_stogir.323
     744:      	ldr	x16, [x16]
		0000000000000744:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     748:      	str	x16, [sp, #0x38]
     74c:      	mov	x20, #0x1b              ; =27
     750:      	add	x0, x0, #0x1
     754:      	cmp	x20, #0x0
     758:      	b.ne	0x718 <_stogir.verify.structure+0x5a8>
     75c:      	cmp	x0, x22
     760:      	cset	w1, lt
     764:      	ubfx	x1, x1, #0, #8
     768:      	b	0x71c <_stogir.verify.structure+0x5ac>
     76c:      	mov	w0, w27
     770:      	bl	0x770 <_stogir.verify.structure+0x600>
		0000000000000770:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
     774:      	sxtw	x0, w0
     778:      	cmn	x0, #0x1
     77c:      	b.ne	0x79c <_stogir.verify.structure+0x62c>
     780:      	ubfx	x0, x22, #16, #16
     784:      	cmp	x28, x0
     788:      	b.eq	0x79c <_stogir.verify.structure+0x62c>
     78c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000078c:  ARM64_RELOC_PAGE21	l_stogir.324
     790:      	ldr	x16, [x16]
		0000000000000790:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     794:      	str	x16, [sp, #0x38]
     798:      	mov	x20, #0x24              ; =36
     79c:      	add	x0, x28, #0x4
     7a0:      	ldr	x1, [x19, #0x8]
     7a4:      	asr	x16, x0, #63
     7a8:      	lsr	x16, x16, #62
     7ac:      	add	x0, x0, x16
     7b0:      	asr	x0, x0, #2
     7b4:      	orr	x22, x0, xzr
     7b8:      	add	x0, x22, x26
     7bc:      	cmp	x0, x1
     7c0:      	b.le	0x7d4 <_stogir.verify.structure+0x664>
     7c4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000007c4:  ARM64_RELOC_PAGE21	l_stogir.325
     7c8:      	ldr	x16, [x16]
		00000000000007c8:  ARM64_RELOC_PAGEOFF12	l_stogir.325
     7cc:      	str	x16, [sp, #0x38]
     7d0:      	mov	x20, #0x15              ; =21
     7d4:      	mov	x0, #0x1                ; =1
     7d8:      	b	0x754 <_stogir.verify.structure+0x5e4>
     7dc:      	ldr	x0, [x25, #0x8]
     7e0:      	cmp	x27, x0
     7e4:      	b.gt	0xb4c <_stogir.verify.structure+0x9dc>
     7e8:      	sub	x0, x27, #0x1
     7ec:      	ldr	x2, [sp, #0x60]
     7f0:      	ldr	x3, [x2, #0x28]
     7f4:      	mov	x17, #0x18              ; =24
     7f8:      	mul	x0, x0, x17
     7fc:      	add	x0, x0, x3
     800:      	ldr	x3, [x0]
     804:      	ldr	x0, [x0, #0x8]
     808:      	ldr	x4, [x2, #0x8]
     80c:      	cmp	x3, #0x0
     810:      	b.lt	0x838 <_stogir.verify.structure+0x6c8>
     814:      	cmp	x3, x4
     818:      	b.gt	0x838 <_stogir.verify.structure+0x6c8>
     81c:      	cmp	x0, #0x0
     820:      	b.lt	0x838 <_stogir.verify.structure+0x6c8>
     824:      	sub	x3, x4, x3
     828:      	cmp	x0, x3
     82c:      	b.gt	0x838 <_stogir.verify.structure+0x6c8>
     830:      	mov	w0, #0x1                ; =1
     834:      	b	0x83c <_stogir.verify.structure+0x6cc>
     838:      	movz	w0, #0x0, lsl #16
     83c:      	b	0x658 <_stogir.verify.structure+0x4e8>
     840:      	mov	w0, #-0x2               ; =-2
     844:      	sxtw	x0, w0
     848:      	cmp	x28, x0
     84c:      	b.eq	0x76c <_stogir.verify.structure+0x5fc>
     850:      	ldr	x2, [sp, #0x60]
     854:      	ldr	x0, [sp, #0x58]
     858:      	ldr	x3, [sp, #0x50]
     85c:      	ldr	x4, [sp, #0x48]
     860:      	mov	x5, x26
     864:      	ldr	x20, [sp, #0x40]
     868:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000868:  ARM64_RELOC_PAGE21	l_stogir.326
     86c:      	ldr	x16, [x16]
		000000000000086c:  ARM64_RELOC_PAGEOFF12	l_stogir.326
     870:      	str	x16, [sp, #0x38]
     874:      	mov	x16, #0x23              ; =35
     878:      	str	x16, [sp, #0x80]
     87c:      	b	0x1e4 <_stogir.verify.structure+0x74>
     880:      	cmp	x27, #0x0
     884:      	b.ne	0xb54 <_stogir.verify.structure+0x9e4>
     888:      	uxtb	w16, w23
     88c:      	cmp	w16, wzr
     890:      	b.eq	0x9bc <_stogir.verify.structure+0x84c>
     894:      	ldr	w1, [x24]
     898:      	uxtb	w16, w26
     89c:      	cmp	w16, wzr
     8a0:      	b.eq	0xa04 <_stogir.verify.structure+0x894>
     8a4:      	uxtb	w16, w28
     8a8:      	cmp	w16, wzr
     8ac:      	b.eq	0x8b4 <_stogir.verify.structure+0x744>
     8b0:      	mov	w22, #0x4               ; =4
     8b4:      	lsl	w5, w22, #2
     8b8:      	ubfx	x5, x5, #0, #32
     8bc:      	lsr	x1, x1, x5
     8c0:      	and	w1, w1, #0xf
     8c4:      	b	0xa08 <_stogir.verify.structure+0x898>
     8c8:      	cmp	x27, #0x0
     8cc:      	b.le	0xb60 <_stogir.verify.structure+0x9f0>
     8d0:      	ldr	x0, [x19, #0x8]
     8d4:      	cmp	x27, x0
     8d8:      	b.ge	0xb68 <_stogir.verify.structure+0x9f8>
     8dc:      	ldr	x0, [sp, #0x58]
     8e0:      	ldr	x1, [x0, #0x8]
     8e4:      	cmp	x27, x1
     8e8:      	b.ge	0xa14 <_stogir.verify.structure+0x8a4>
     8ec:      	ldr	x1, [x19, #0x78]
     8f0:      	add	x1, x1, x27, lsl #2
     8f4:      	ldr	w1, [x1]
     8f8:      	sxtw	x1, w1
     8fc:      	cmp	x1, #0x0
     900:      	cset	w1, ge
     904:      	ubfx	x1, x1, #0, #8
     908:      	b	0xa18 <_stogir.verify.structure+0x8a8>
     90c:      	ldr	w1, [sp, #0xb0]
     910:      	uxtb	w16, w1
     914:      	cmp	w16, wzr
     918:      	b.eq	0xb70 <_stogir.verify.structure+0xa00>
     91c:      	ldr	w5, [sp, #0xa8]
     920:      	uxtb	w16, w5
     924:      	cmp	w16, wzr
     928:      	b.eq	0x938 <_stogir.verify.structure+0x7c8>
     92c:      	ldr	x6, [sp, #0xa0]
     930:      	cmp	x6, #0x2
     934:      	b.eq	0x42c <_stogir.verify.structure+0x2bc>
     938:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000938:  ARM64_RELOC_PAGE21	l_stogir.327
     93c:      	ldr	x16, [x16]
		000000000000093c:  ARM64_RELOC_PAGEOFF12	l_stogir.327
     940:      	str	x16, [sp, #0x38]
     944:      	mov	x16, #0x1a              ; =26
     948:      	str	x16, [sp, #0x80]
     94c:      	b	0x42c <_stogir.verify.structure+0x2bc>
     950:      	movz	x1, #0x0, lsl #48
     954:      	ldr	x3, [sp, #0x50]
     958:      	ldr	x4, [sp, #0x48]
     95c:      	b	0x41c <_stogir.verify.structure+0x2ac>
     960:      	cmp	x27, #0x0
     964:      	b.ge	0xb78 <_stogir.verify.structure+0xa08>
     968:      	ldr	x3, [sp, #0x50]
     96c:      	ldr	x1, [x3, #0x8]
     970:      	ldr	x4, [sp, #0x48]
     974:      	ldr	x5, [x4, #0x8]
     978:      	cmp	x1, x5
     97c:      	b.ne	0xa0c <_stogir.verify.structure+0x89c>
     980:      	movz	x16, #0x0, lsl #48
     984:      	sub	x5, x16, x27
     988:      	cmp	x5, x1
     98c:      	b.gt	0xa3c <_stogir.verify.structure+0x8cc>
     990:      	sub	x1, x5, #0x1
     994:      	ldr	x5, [x19, #0x50]
     998:      	add	x1, x5, x1, lsl #2
     99c:      	ldr	w1, [x1]
     9a0:      	sxtw	x1, w1
     9a4:      	cmp	x1, #0x0
     9a8:      	cset	w1, gt
     9ac:      	ubfx	x1, x1, #0, #8
     9b0:      	b	0xa40 <_stogir.verify.structure+0x8d0>
     9b4:      	brk	#0
     9b8:      	b	0x9b4 <_stogir.verify.structure+0x844>
     9bc:      	movz	w1, #0x0, lsl #16
     9c0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000009c0:  ARM64_RELOC_PAGE21	l_stogir.328
     9c4:      	ldr	x16, [x16]
		00000000000009c4:  ARM64_RELOC_PAGEOFF12	l_stogir.328
     9c8:      	ldr	w5, [x16]
     9cc:      	ubfx	x1, x1, #0, #32
     9d0:      	cmp	x1, x5
     9d4:      	b.ne	0x9e4 <_stogir.verify.structure+0x874>
     9d8:      	ldr	w1, [sp, #0xb0]
     9dc:      	ldr	w5, [sp, #0xa8]
     9e0:      	b	0x42c <_stogir.verify.structure+0x2bc>
     9e4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000009e4:  ARM64_RELOC_PAGE21	l_stogir.329
     9e8:      	ldr	x16, [x16]
		00000000000009e8:  ARM64_RELOC_PAGEOFF12	l_stogir.329
     9ec:      	ldr	w5, [x16]
     9f0:      	cmp	x1, x5
     9f4:      	b.ne	0xa1c <_stogir.verify.structure+0x8ac>
     9f8:      	ldr	w1, [sp, #0xb0]
     9fc:      	ldr	w5, [sp, #0xa8]
     a00:      	b	0x42c <_stogir.verify.structure+0x2bc>
     a04:      	movz	w1, #0x0, lsl #16
     a08:      	b	0x9c0 <_stogir.verify.structure+0x850>
     a0c:      	movz	x1, #0x0, lsl #48
     a10:      	b	0x41c <_stogir.verify.structure+0x2ac>
     a14:      	movz	x1, #0x0, lsl #48
     a18:      	b	0x954 <_stogir.verify.structure+0x7e4>
     a1c:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000a1c:  ARM64_RELOC_PAGE21	l_stogir.330
     a20:      	ldr	x16, [x16]
		0000000000000a20:  ARM64_RELOC_PAGEOFF12	l_stogir.330
     a24:      	ldr	w5, [x16]
     a28:      	cmp	x1, x5
     a2c:      	b.ne	0x90c <_stogir.verify.structure+0x79c>
     a30:      	ldr	w1, [sp, #0xb0]
     a34:      	ldr	w5, [sp, #0xa8]
     a38:      	b	0x42c <_stogir.verify.structure+0x2bc>
     a3c:      	movz	x1, #0x0, lsl #48
     a40:      	b	0xa10 <_stogir.verify.structure+0x8a0>
     a44:      	brk	#0
     a48:      	b	0xa44 <_stogir.verify.structure+0x8d4>
     a4c:      	str	x8, [sp, #0x30]
     a50:      	str	x19, [sp, #0x38]
     a54:      	str	x20, [sp, #0x80]
     a58:      	mov	x20, x27
     a5c:      	b	0x37c <_stogir.verify.structure+0x20c>
     a60:      	str	x8, [sp, #0x30]
     a64:      	str	x19, [sp, #0x38]
     a68:      	str	x20, [sp, #0x80]
     a6c:      	mov	x20, x27
     a70:      	b	0x37c <_stogir.verify.structure+0x20c>
     a74:      	mov	x5, x26
     a78:      	mov	x20, x27
     a7c:      	str	x8, [sp, #0x30]
     a80:      	mov	x19, x0
     a84:      	mov	x2, x21
     a88:      	mov	x0, x22
     a8c:      	mov	x3, x23
     a90:      	mov	x4, x24
     a94:      	b	0x250 <_stogir.verify.structure+0xe0>
     a98:      	mov	x5, x26
     a9c:      	mov	x20, x27
     aa0:      	str	x8, [sp, #0x30]
     aa4:      	mov	x19, x0
     aa8:      	mov	x2, x21
     aac:      	mov	x0, x22
     ab0:      	mov	x3, x23
     ab4:      	mov	x4, x24
     ab8:      	b	0x214 <_stogir.verify.structure+0xa4>
     abc:      	mov	x5, x26
     ac0:      	ldr	x20, [sp, #0x40]
     ac4:      	ldr	x2, [sp, #0x60]
     ac8:      	ldr	x0, [sp, #0x58]
     acc:      	ldr	x3, [sp, #0x50]
     ad0:      	ldr	x4, [sp, #0x48]
     ad4:      	b	0x214 <_stogir.verify.structure+0xa4>
     ad8:      	ldr	x0, [sp, #0x38]
     adc:      	b	0x3b0 <_stogir.verify.structure+0x240>
     ae0:      	str	x26, [sp, #0x90]
     ae4:      	str	x22, [sp, #0x88]
     ae8:      	ldr	x2, [sp, #0x60]
     aec:      	str	x20, [sp, #0x80]
     af0:      	ldr	x0, [sp, #0x58]
     af4:      	ldr	x3, [sp, #0x50]
     af8:      	ldr	x4, [sp, #0x48]
     afc:      	b	0x1cc <_stogir.verify.structure+0x5c>
     b00:      	str	w27, [sp, #0xb0]
     b04:      	mov	w27, w1
     b08:      	str	w21, [sp, #0xa8]
     b0c:      	mov	x21, x0
     b10:      	b	0x5b0 <_stogir.verify.structure+0x440>
     b14:      	ldr	x2, [sp, #0x60]
     b18:      	b	0x69c <_stogir.verify.structure+0x52c>
     b1c:      	ldr	x0, [sp, #0x58]
     b20:      	ldr	x3, [sp, #0x50]
     b24:      	ldr	x4, [sp, #0x48]
     b28:      	ldr	w1, [sp, #0xb0]
     b2c:      	ldr	w5, [sp, #0xa8]
     b30:      	b	0x42c <_stogir.verify.structure+0x2bc>
     b34:      	ldr	x0, [sp, #0x58]
     b38:      	ldr	x3, [sp, #0x50]
     b3c:      	ldr	x4, [sp, #0x48]
     b40:      	ldr	w1, [sp, #0xb0]
     b44:      	ldr	w5, [sp, #0xa8]
     b48:      	b	0x42c <_stogir.verify.structure+0x2bc>
     b4c:      	ldr	x2, [sp, #0x60]
     b50:      	b	0x654 <_stogir.verify.structure+0x4e4>
     b54:      	ldr	w1, [sp, #0xb0]
     b58:      	ldr	w5, [sp, #0xa8]
     b5c:      	b	0x938 <_stogir.verify.structure+0x7c8>
     b60:      	ldr	x0, [sp, #0x58]
     b64:      	b	0x960 <_stogir.verify.structure+0x7f0>
     b68:      	ldr	x0, [sp, #0x58]
     b6c:      	b	0x950 <_stogir.verify.structure+0x7e0>
     b70:      	ldr	w5, [sp, #0xa8]
     b74:      	b	0x938 <_stogir.verify.structure+0x7c8>
     b78:      	ldr	x3, [sp, #0x50]
     b7c:      	ldr	x4, [sp, #0x48]
     b80:      	b	0x418 <_stogir.verify.structure+0x2a8>
