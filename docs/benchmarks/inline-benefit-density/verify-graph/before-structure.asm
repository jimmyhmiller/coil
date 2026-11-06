
build/inline-density-comparison/verify-graph/before.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000178 <_stogir.verify.structure>:
     178:      	sub	sp, sp, #0x110
     17c:      	str	x29, [sp, #0x10]
     180:      	str	x30, [sp, #0x18]
     184:      	add	x29, sp, #0x10
     188:      	str	x19, [sp, #0xb8]
     18c:      	str	x20, [sp, #0xc0]
     190:      	str	x21, [sp, #0xc8]
     194:      	str	x22, [sp, #0xd0]
     198:      	str	x23, [sp, #0xd8]
     19c:      	str	x24, [sp, #0xe0]
     1a0:      	str	x25, [sp, #0xe8]
     1a4:      	str	x26, [sp, #0xf0]
     1a8:      	str	x27, [sp, #0xf8]
     1ac:      	str	x28, [sp, #0x100]
     1b0:      	mov	x19, x8
     1b4:      	mov	x20, x0
     1b8:      	bl	0x1b8 <_stogir.verify.structure+0x40>
		00000000000001b8:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
     1bc:      	add	x21, x20, #0x78
     1c0:      	mov	x22, x0
     1c4:      	mov	x0, x21
     1c8:      	bl	0x1c8 <_stogir.verify.structure+0x50>
		00000000000001c8:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__i32
     1cc:      	cmp	x22, x0
     1d0:      	b.ne	0x200 <_stogir.verify.structure+0x88>
     1d4:      	adrp	x22, 0x0 <_gap_verify_graph>
		00000000000001d4:  ARM64_RELOC_PAGE21	l_stogir.311
     1d8:      	ldr	x22, [x22]
		00000000000001d8:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     1dc:      	movz	x23, #0x0, lsl #48
     1e0:      	b	0x20c <_stogir.verify.structure+0x94>
     1e4:      	ldr	x1, [sp, #0x88]
     1e8:      	ldr	x5, [sp, #0x90]
     1ec:      	add	x5, x1, x5
     1f0:      	ldr	x19, [sp, #0x40]
     1f4:      	add	x1, x19, #0x1
     1f8:      	sxtw	x19, w1
     1fc:      	b	0x23c <_stogir.verify.structure+0xc4>
     200:      	adrp	x22, 0x0 <_gap_verify_graph>
		0000000000000200:  ARM64_RELOC_PAGE21	l_stogir.312
     204:      	ldr	x22, [x22]
		0000000000000204:  ARM64_RELOC_PAGEOFF12	l_stogir.312
     208:      	mov	x23, #0x2c              ; =44
     20c:      	add	x24, x20, #0x110
     210:      	add	x25, x20, #0x28
     214:      	add	x26, x20, #0x50
     218:      	add	x27, x24, #0x28
     21c:      	mov	x28, #0x1               ; =1
     220:      	movz	x0, #0x0, lsl #48
     224:      	b	0x294 <_stogir.verify.structure+0x11c>
     228:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000228:  ARM64_RELOC_PAGE21	l_stogir.313
     22c:      	ldr	x16, [x16]
		000000000000022c:  ARM64_RELOC_PAGEOFF12	l_stogir.313
     230:      	str	x16, [sp, #0x38]
     234:      	mov	x16, #0x16              ; =22
     238:      	str	x16, [sp, #0x80]
     23c:      	b	0x270 <_stogir.verify.structure+0xf8>
     240:      	mov	x5, x28
     244:      	str	x19, [sp, #0x30]
     248:      	mov	x19, x0
     24c:      	mov	x0, x21
     250:      	mov	x2, x24
     254:      	mov	x3, x25
     258:      	mov	x4, x26
     25c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000025c:  ARM64_RELOC_PAGE21	l_stogir.314
     260:      	ldr	x16, [x16]
		0000000000000260:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     264:      	str	x16, [sp, #0x38]
     268:      	mov	x16, #0x23              ; =35
     26c:      	str	x16, [sp, #0x80]
     270:      	mov	x21, x0
     274:      	mov	x24, x2
     278:      	mov	x25, x3
     27c:      	mov	x26, x4
     280:      	mov	x28, x5
     284:      	mov	x0, x19
     288:      	ldr	x19, [sp, #0x30]
     28c:      	ldr	x22, [sp, #0x38]
     290:      	ldr	x23, [sp, #0x80]
     294:      	cmp	x23, #0x0
     298:      	b.ne	0xa54 <_stogir.verify.structure+0x8dc>
     29c:      	ldr	x1, [x20, #0x8]
     2a0:      	cmp	x28, x1
     2a4:      	b.ge	0xa68 <_stogir.verify.structure+0x8f0>
     2a8:      	ldr	x1, [x20]
     2ac:      	add	x1, x1, x28, lsl #4
     2b0:      	ldr	x1, [x1]
     2b4:      	ldr	x2, [x20, #0x78]
     2b8:      	add	x2, x2, x28, lsl #2
     2bc:      	ldr	w2, [x2]
     2c0:      	sxtw	x2, w2
     2c4:      	cmp	x2, #0x0
     2c8:      	b.lt	0x240 <_stogir.verify.structure+0xc8>
     2cc:      	mov	x17, #0xffff            ; =65535
     2d0:      	cmp	x2, x17
     2d4:      	b.gt	0xa7c <_stogir.verify.structure+0x904>
     2d8:      	uxtb	w3, w1
     2dc:      	orr	x4, x3, xzr
     2e0:      	cmp	x4, #0x83
     2e4:      	cset	w5, lt
     2e8:      	uxtb	w16, w5
     2ec:      	cmp	w16, wzr
     2f0:      	b.eq	0xa9c <_stogir.verify.structure+0x924>
     2f4:      	ubfx	x1, x1, #0, #32
     2f8:      	ubfx	x6, x1, #8, #8
     2fc:      	orr	x7, x6, xzr
     300:      	str	x0, [sp, #0x40]
     304:      	mov	w0, w7
     308:      	str	x19, [sp, #0x30]
     30c:      	mov	w19, w3
     310:      	str	x22, [sp, #0x38]
     314:      	mov	x22, x2
     318:      	str	x26, [sp, #0x48]
     31c:      	mov	x26, x4
     320:      	str	x25, [sp, #0x50]
     324:      	mov	w25, w5
     328:      	str	x21, [sp, #0x58]
     32c:      	mov	x21, x1
     330:      	str	x24, [sp, #0x60]
     334:      	mov	w24, w6
     338:      	bl	0x338 <_stogir.verify.structure+0x1c0>
		0000000000000338:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
     33c:      	cmp	x0, #0x0
     340:      	b.eq	0xabc <_stogir.verify.structure+0x944>
     344:      	adrp	x17, 0x0 <_gap_verify_graph>
		0000000000000344:  ARM64_RELOC_PAGE21	l_stogir.315
     348:      	ldr	x17, [x17]
		0000000000000348:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     34c:      	add	x0, x26, x17
     350:      	ldrsb	w0, [x0]
     354:      	sxtb	x0, w0
     358:      	cmp	x0, #0x0
     35c:      	b.lt	0x774 <_stogir.verify.structure+0x5fc>
     360:      	uxtb	w16, w25
     364:      	cmp	w16, wzr
     368:      	b.eq	0x848 <_stogir.verify.structure+0x6d0>
     36c:      	adrp	x17, 0x0 <_gap_verify_graph>
		000000000000036c:  ARM64_RELOC_PAGE21	l_stogir.315
     370:      	ldr	x17, [x17]
		0000000000000370:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     374:      	add	x0, x26, x17
     378:      	ldrsb	w0, [x0]
     37c:      	sxtb	w0, w0
     380:      	b	0x84c <_stogir.verify.structure+0x6d4>
     384:      	ldr	x0, [sp, #0x38]
     388:      	ldr	x1, [sp, #0x80]
     38c:      	adrp	x2, 0x0 <_gap_verify_graph>
		000000000000038c:  ARM64_RELOC_PAGE21	l_stogir.311
     390:      	ldr	x2, [x2]
		0000000000000390:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     394:      	movz	x3, #0x0, lsl #48
     398:      	bl	0x398 <_stogir.verify.structure+0x220>
		0000000000000398:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     39c:      	cmp	x0, #0x0
     3a0:      	b.eq	0xad8 <_stogir.verify.structure+0x960>
     3a4:      	and	x0, x19, #0xffffffff
     3a8:      	movz	x1, #0x0, lsl #48
     3ac:      	movz	x16, #0x0, lsl #48
     3b0:      	str	x16, [sp, #0x80]
     3b4:      	b	0x3bc <_stogir.verify.structure+0x244>
     3b8:      	mov	x1, #0x1                ; =1
     3bc:      	ldr	x2, [sp, #0x30]
     3c0:      	str	x1, [x2]
     3c4:      	str	x0, [x2, #0x8]
     3c8:      	ldr	x0, [sp, #0x80]
     3cc:      	str	x0, [x2, #0x10]
     3d0:      	ldr	x19, [sp, #0xb8]
     3d4:      	ldr	x20, [sp, #0xc0]
     3d8:      	ldr	x21, [sp, #0xc8]
     3dc:      	ldr	x22, [sp, #0xd0]
     3e0:      	ldr	x23, [sp, #0xd8]
     3e4:      	ldr	x24, [sp, #0xe0]
     3e8:      	ldr	x25, [sp, #0xe8]
     3ec:      	ldr	x26, [sp, #0xf0]
     3f0:      	ldr	x27, [sp, #0xf8]
     3f4:      	ldr	x28, [sp, #0x100]
     3f8:      	ldr	x29, [sp, #0x10]
     3fc:      	ldr	x30, [sp, #0x18]
     400:      	add	sp, sp, #0x110
     404:      	ret
     408:      	mov	w9, w5
     40c:      	lsl	w9, w9, #2
     410:      	ubfx	x9, x9, #0, #32
     414:      	lsr	x8, x8, x9
     418:      	and	w8, w8, #0xf
     41c:      	b	0x43c <_stogir.verify.structure+0x2c4>
     420:      	movz	x1, #0x0, lsl #48
     424:      	cmp	x1, #0x0
     428:      	b.eq	0x888 <_stogir.verify.structure+0x710>
     42c:      	ldr	w1, [sp, #0xb0]
     430:      	ldr	w5, [sp, #0xa8]
     434:      	b	0x4e4 <_stogir.verify.structure+0x36c>
     438:      	movz	w8, #0x0, lsl #16
     43c:      	b	0x444 <_stogir.verify.structure+0x2cc>
     440:      	movz	w8, #0x0, lsl #16
     444:      	str	w0, [sp, #0x68]
     448:      	str	x2, [sp, #0x98]
     44c:      	mov	w2, w3
     450:      	str	x4, [sp, #0xa0]
     454:      	str	x22, [sp, #0x70]
     458:      	mov	x22, x1
     45c:      	mov	w1, w0
     460:      	mov	x0, x20
     464:      	str	x26, [sp, #0x78]
     468:      	mov	w26, w7
     46c:      	str	x23, [sp, #0x80]
     470:      	mov	w23, w8
     474:      	str	x19, [sp, #0x88]
     478:      	mov	w19, w5
     47c:      	str	x28, [sp, #0x90]
     480:      	mov	w28, w6
     484:      	bl	0x484 <_stogir.verify.structure+0x30c>
		0000000000000484:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     488:      	ubfx	x0, x0, #0, #32
     48c:      	lsr	x16, x0, #0
     490:      	cmp	x16, #0x1
     494:      	b.eq	0x4b0 <_stogir.verify.structure+0x338>
     498:      	b.lo	0x4a0 <_stogir.verify.structure+0x328>
     49c:      	b	0x4b4 <_stogir.verify.structure+0x33c>
     4a0:      	cmp	x16, #0x0
     4a4:      	b.eq	0x4ac <_stogir.verify.structure+0x334>
     4a8:      	b	0x4b4 <_stogir.verify.structure+0x33c>
     4ac:      	b	0x4b8 <_stogir.verify.structure+0x340>
     4b0:      	b	0x598 <_stogir.verify.structure+0x420>
     4b4:      	b	0x9bc <_stogir.verify.structure+0x844>
     4b8:      	ldr	x0, [sp, #0x58]
     4bc:      	ldr	x2, [sp, #0x60]
     4c0:      	mov	w1, w21
     4c4:      	mov	w5, w24
     4c8:      	ldr	x3, [sp, #0x50]
     4cc:      	ldr	x4, [sp, #0x48]
     4d0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000004d0:  ARM64_RELOC_PAGE21	l_stogir.316
     4d4:      	ldr	x16, [x16]
		00000000000004d4:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     4d8:      	str	x16, [sp, #0x38]
     4dc:      	mov	x16, #0x17              ; =23
     4e0:      	str	x16, [sp, #0x80]
     4e4:      	ldr	x6, [sp, #0x98]
     4e8:      	add	x6, x6, #0x1
     4ec:      	sxtw	x6, w6
     4f0:      	ldr	x28, [sp, #0x90]
     4f4:      	str	x0, [sp, #0x58]
     4f8:      	ldr	x19, [sp, #0x88]
     4fc:      	ldr	w0, [sp, #0x68]
     500:      	str	x2, [sp, #0x60]
     504:      	ldr	x26, [sp, #0x78]
     508:      	mov	w21, w1
     50c:      	mov	w24, w5
     510:      	mov	x1, x22
     514:      	ldr	x22, [sp, #0x70]
     518:      	str	x3, [sp, #0x50]
     51c:      	str	x4, [sp, #0x48]
     520:      	mov	x2, x6
     524:      	ldr	x23, [sp, #0x80]
     528:      	cmp	x23, #0x0
     52c:      	b.ne	0x540 <_stogir.verify.structure+0x3c8>
     530:      	cmp	x2, x22
     534:      	cset	w3, le
     538:      	ubfx	x3, x3, #0, #8
     53c:      	b	0x544 <_stogir.verify.structure+0x3cc>
     540:      	movz	x3, #0x0, lsl #48
     544:      	cmp	x3, #0x0
     548:      	b.eq	0xae0 <_stogir.verify.structure+0x968>
     54c:      	orr	w3, w2, wzr
     550:      	sxtw	x4, w3
     554:      	sub	w5, w3, #0x1
     558:      	cmp	x4, #0x0
     55c:      	cset	w6, gt
     560:      	cmp	x4, #0x4
     564:      	cset	w7, gt
     568:      	uxtb	w16, w25
     56c:      	cmp	w16, wzr
     570:      	b.eq	0x440 <_stogir.verify.structure+0x2c8>
     574:      	ldr	w8, [x26]
     578:      	uxtb	w16, w6
     57c:      	cmp	w16, wzr
     580:      	b.eq	0x438 <_stogir.verify.structure+0x2c0>
     584:      	uxtb	w16, w7
     588:      	cmp	w16, wzr
     58c:      	b.eq	0x408 <_stogir.verify.structure+0x290>
     590:      	mov	w9, #0x4                ; =4
     594:      	b	0x40c <_stogir.verify.structure+0x294>
     598:      	ubfx	x23, x23, #0, #32
     59c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000059c:  ARM64_RELOC_PAGE21	l_stogir.317
     5a0:      	ldr	x16, [x16]
		00000000000005a0:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     5a4:      	ldr	w0, [x16]
     5a8:      	cmp	x23, x0
     5ac:      	b.ne	0x5c0 <_stogir.verify.structure+0x448>
     5b0:      	mov	x0, #0x1                ; =1
     5b4:      	b	0x5d8 <_stogir.verify.structure+0x460>
     5b8:      	movz	x1, #0x0, lsl #48
     5bc:      	b	0x638 <_stogir.verify.structure+0x4c0>
     5c0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000005c0:  ARM64_RELOC_PAGE21	l_stogir.318
     5c4:      	ldr	x16, [x16]
		00000000000005c4:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     5c8:      	ldr	w0, [x16]
     5cc:      	cmp	x23, x0
     5d0:      	cset	w0, eq
     5d4:      	ubfx	x0, x0, #0, #8
     5d8:      	cmp	x0, #0x0
     5dc:      	b.eq	0xb00 <_stogir.verify.structure+0x988>
     5e0:      	str	w24, [sp, #0xa8]
     5e4:      	mov	x24, x0
     5e8:      	mov	x0, x20
     5ec:      	str	w21, [sp, #0xb0]
     5f0:      	mov	w21, w1
     5f4:      	bl	0x5f4 <_stogir.verify.structure+0x47c>
		00000000000005f4:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
     5f8:      	cmp	x0, #0x0
     5fc:      	cset	w1, eq
     600:      	uxtb	w16, w1
     604:      	cmp	w16, wzr
     608:      	cset	x1, eq
     60c:      	cmp	x1, #0x0
     610:      	b.eq	0x638 <_stogir.verify.structure+0x4c0>
     614:      	ldr	w0, [x0]
     618:      	uxtb	w0, w0
     61c:      	cmp	x0, #0x48
     620:      	b.ne	0x638 <_stogir.verify.structure+0x4c0>
     624:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000624:  ARM64_RELOC_PAGE21	l_stogir.319
     628:      	ldr	x16, [x16]
		0000000000000628:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     62c:      	str	x16, [sp, #0x38]
     630:      	mov	x16, #0x25              ; =37
     634:      	str	x16, [sp, #0x80]
     638:      	sxtw	x21, w21
     63c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000063c:  ARM64_RELOC_PAGE21	l_stogir.320
     640:      	ldr	x16, [x16]
		0000000000000640:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     644:      	ldr	w0, [x16]
     648:      	cmp	x23, x0
     64c:      	b.ne	0xb14 <_stogir.verify.structure+0x99c>
     650:      	cmp	x21, #0x0
     654:      	b.gt	0x7e4 <_stogir.verify.structure+0x66c>
     658:      	ldr	x2, [sp, #0x60]
     65c:      	movz	w0, #0x0, lsl #16
     660:      	ubfx	x0, x0, #0, #32
     664:      	lsr	x16, x0, #0
     668:      	cmp	x16, #0x1
     66c:      	b.eq	0x688 <_stogir.verify.structure+0x510>
     670:      	b.lo	0x678 <_stogir.verify.structure+0x500>
     674:      	b	0x68c <_stogir.verify.structure+0x514>
     678:      	cmp	x16, #0x0
     67c:      	b.eq	0x684 <_stogir.verify.structure+0x50c>
     680:      	b	0x68c <_stogir.verify.structure+0x514>
     684:      	b	0x690 <_stogir.verify.structure+0x518>
     688:      	b	0x6a4 <_stogir.verify.structure+0x52c>
     68c:      	b	0xa4c <_stogir.verify.structure+0x8d4>
     690:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000690:  ARM64_RELOC_PAGE21	l_stogir.321
     694:      	ldr	x16, [x16]
		0000000000000694:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     698:      	str	x16, [sp, #0x38]
     69c:      	mov	x16, #0x21              ; =33
     6a0:      	str	x16, [sp, #0x80]
     6a4:      	cmp	x23, #0xf
     6a8:      	b.hs	0xb1c <_stogir.verify.structure+0x9a4>
     6ac:      	mov	x16, #0x1               ; =1
     6b0:      	lsl	x0, x16, x23
     6b4:      	mov	w17, #0x5e1c            ; =24092
     6b8:      	and	w0, w0, w17
     6bc:      	ubfx	x0, x0, #0, #32
     6c0:      	cmp	x0, #0x0
     6c4:      	b.eq	0xb34 <_stogir.verify.structure+0x9bc>
     6c8:      	cmp	x24, #0x0
     6cc:      	b.eq	0x8d0 <_stogir.verify.structure+0x758>
     6d0:      	ldr	x0, [sp, #0x58]
     6d4:      	ldr	x3, [sp, #0x50]
     6d8:      	ldr	x4, [sp, #0x48]
     6dc:      	b	0x424 <_stogir.verify.structure+0x2ac>
     6e0:      	orr	w0, w28, wzr
     6e4:      	cmp	x26, #0x78
     6e8:      	cset	w21, eq
     6ec:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000006ec:  ARM64_RELOC_PAGE21	l_stogir.322
     6f0:      	ldr	x16, [x16]
		00000000000006f0:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     6f4:      	add	x1, x16, x26, lsl #2
     6f8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000006f8:  ARM64_RELOC_PAGE21	l_stogir.322
     6fc:      	ldr	x16, [x16]
		00000000000006fc:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     700:      	add	x2, x16, x26, lsl #2
     704:      	cmp	x24, #0x0
     708:      	cset	w24, eq
     70c:      	orr	x26, x1, xzr
     710:      	orr	x1, x2, xzr
     714:      	mov	x2, #0x1                ; =1
     718:      	b	0x528 <_stogir.verify.structure+0x3b0>
     71c:      	nop
     720:      	movz	x1, #0x0, lsl #48
     724:      	cmp	x1, #0x0
     728:      	b.eq	0x6e0 <_stogir.verify.structure+0x568>
     72c:      	add	x1, x0, x28
     730:      	ldr	x2, [x20, #0x78]
     734:      	add	x1, x2, x1, lsl #2
     738:      	ldr	w1, [x1]
     73c:      	sxtw	x1, w1
     740:      	cmn	x1, #0x1
     744:      	b.eq	0x758 <_stogir.verify.structure+0x5e0>
     748:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000748:  ARM64_RELOC_PAGE21	l_stogir.323
     74c:      	ldr	x16, [x16]
		000000000000074c:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     750:      	str	x16, [sp, #0x38]
     754:      	mov	x23, #0x1b              ; =27
     758:      	add	x0, x0, #0x1
     75c:      	cmp	x23, #0x0
     760:      	b.ne	0x720 <_stogir.verify.structure+0x5a8>
     764:      	cmp	x0, x19
     768:      	cset	w1, lt
     76c:      	ubfx	x1, x1, #0, #8
     770:      	b	0x724 <_stogir.verify.structure+0x5ac>
     774:      	mov	w0, w19
     778:      	bl	0x778 <_stogir.verify.structure+0x600>
		0000000000000778:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
     77c:      	sxtw	x0, w0
     780:      	cmn	x0, #0x1
     784:      	b.ne	0x7a4 <_stogir.verify.structure+0x62c>
     788:      	ubfx	x0, x21, #16, #16
     78c:      	cmp	x22, x0
     790:      	b.eq	0x7a4 <_stogir.verify.structure+0x62c>
     794:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000794:  ARM64_RELOC_PAGE21	l_stogir.324
     798:      	ldr	x16, [x16]
		0000000000000798:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     79c:      	str	x16, [sp, #0x38]
     7a0:      	mov	x23, #0x24              ; =36
     7a4:      	add	x0, x22, #0x4
     7a8:      	ldr	x1, [x20, #0x8]
     7ac:      	asr	x16, x0, #63
     7b0:      	lsr	x16, x16, #62
     7b4:      	add	x0, x0, x16
     7b8:      	asr	x0, x0, #2
     7bc:      	orr	x19, x0, xzr
     7c0:      	add	x0, x19, x28
     7c4:      	cmp	x0, x1
     7c8:      	b.le	0x7dc <_stogir.verify.structure+0x664>
     7cc:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000007cc:  ARM64_RELOC_PAGE21	l_stogir.325
     7d0:      	ldr	x16, [x16]
		00000000000007d0:  ARM64_RELOC_PAGEOFF12	l_stogir.325
     7d4:      	str	x16, [sp, #0x38]
     7d8:      	mov	x23, #0x15              ; =21
     7dc:      	mov	x0, #0x1                ; =1
     7e0:      	b	0x75c <_stogir.verify.structure+0x5e4>
     7e4:      	ldr	x0, [x27, #0x8]
     7e8:      	cmp	x21, x0
     7ec:      	b.gt	0xb4c <_stogir.verify.structure+0x9d4>
     7f0:      	sub	x0, x21, #0x1
     7f4:      	ldr	x2, [sp, #0x60]
     7f8:      	ldr	x3, [x2, #0x28]
     7fc:      	mov	x17, #0x18              ; =24
     800:      	mul	x0, x0, x17
     804:      	add	x0, x0, x3
     808:      	ldr	x3, [x0]
     80c:      	ldr	x0, [x0, #0x8]
     810:      	ldr	x4, [x2, #0x8]
     814:      	cmp	x3, #0x0
     818:      	b.lt	0x840 <_stogir.verify.structure+0x6c8>
     81c:      	cmp	x3, x4
     820:      	b.gt	0x840 <_stogir.verify.structure+0x6c8>
     824:      	cmp	x0, #0x0
     828:      	b.lt	0x840 <_stogir.verify.structure+0x6c8>
     82c:      	sub	x3, x4, x3
     830:      	cmp	x0, x3
     834:      	b.gt	0x840 <_stogir.verify.structure+0x6c8>
     838:      	mov	w0, #0x1                ; =1
     83c:      	b	0x844 <_stogir.verify.structure+0x6cc>
     840:      	movz	w0, #0x0, lsl #16
     844:      	b	0x660 <_stogir.verify.structure+0x4e8>
     848:      	mov	w0, #-0x2               ; =-2
     84c:      	sxtw	x0, w0
     850:      	cmp	x22, x0
     854:      	b.eq	0x774 <_stogir.verify.structure+0x5fc>
     858:      	ldr	x0, [sp, #0x58]
     85c:      	ldr	x2, [sp, #0x60]
     860:      	ldr	x3, [sp, #0x50]
     864:      	ldr	x4, [sp, #0x48]
     868:      	mov	x5, x28
     86c:      	ldr	x19, [sp, #0x40]
     870:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000870:  ARM64_RELOC_PAGE21	l_stogir.326
     874:      	ldr	x16, [x16]
		0000000000000874:  ARM64_RELOC_PAGEOFF12	l_stogir.326
     878:      	str	x16, [sp, #0x38]
     87c:      	mov	x16, #0x23              ; =35
     880:      	str	x16, [sp, #0x80]
     884:      	b	0x1fc <_stogir.verify.structure+0x84>
     888:      	cmp	x21, #0x0
     88c:      	b.ne	0xb54 <_stogir.verify.structure+0x9dc>
     890:      	uxtb	w16, w25
     894:      	cmp	w16, wzr
     898:      	b.eq	0x9c4 <_stogir.verify.structure+0x84c>
     89c:      	ldr	w1, [x22]
     8a0:      	uxtb	w16, w28
     8a4:      	cmp	w16, wzr
     8a8:      	b.eq	0xa0c <_stogir.verify.structure+0x894>
     8ac:      	uxtb	w16, w26
     8b0:      	cmp	w16, wzr
     8b4:      	b.eq	0x8bc <_stogir.verify.structure+0x744>
     8b8:      	mov	w19, #0x4               ; =4
     8bc:      	lsl	w5, w19, #2
     8c0:      	ubfx	x5, x5, #0, #32
     8c4:      	lsr	x1, x1, x5
     8c8:      	and	w1, w1, #0xf
     8cc:      	b	0xa10 <_stogir.verify.structure+0x898>
     8d0:      	cmp	x21, #0x0
     8d4:      	b.le	0xb60 <_stogir.verify.structure+0x9e8>
     8d8:      	ldr	x0, [x20, #0x8]
     8dc:      	cmp	x21, x0
     8e0:      	b.ge	0xb68 <_stogir.verify.structure+0x9f0>
     8e4:      	ldr	x0, [sp, #0x58]
     8e8:      	ldr	x1, [x0, #0x8]
     8ec:      	cmp	x21, x1
     8f0:      	b.ge	0xa1c <_stogir.verify.structure+0x8a4>
     8f4:      	ldr	x1, [x20, #0x78]
     8f8:      	add	x1, x1, x21, lsl #2
     8fc:      	ldr	w1, [x1]
     900:      	sxtw	x1, w1
     904:      	cmp	x1, #0x0
     908:      	cset	w1, ge
     90c:      	ubfx	x1, x1, #0, #8
     910:      	b	0xa20 <_stogir.verify.structure+0x8a8>
     914:      	ldr	w1, [sp, #0xb0]
     918:      	uxtb	w16, w1
     91c:      	cmp	w16, wzr
     920:      	b.eq	0xb70 <_stogir.verify.structure+0x9f8>
     924:      	ldr	w5, [sp, #0xa8]
     928:      	uxtb	w16, w5
     92c:      	cmp	w16, wzr
     930:      	b.eq	0x940 <_stogir.verify.structure+0x7c8>
     934:      	ldr	x6, [sp, #0xa0]
     938:      	cmp	x6, #0x2
     93c:      	b.eq	0x434 <_stogir.verify.structure+0x2bc>
     940:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000940:  ARM64_RELOC_PAGE21	l_stogir.327
     944:      	ldr	x16, [x16]
		0000000000000944:  ARM64_RELOC_PAGEOFF12	l_stogir.327
     948:      	str	x16, [sp, #0x38]
     94c:      	mov	x16, #0x1a              ; =26
     950:      	str	x16, [sp, #0x80]
     954:      	b	0x434 <_stogir.verify.structure+0x2bc>
     958:      	movz	x1, #0x0, lsl #48
     95c:      	ldr	x3, [sp, #0x50]
     960:      	ldr	x4, [sp, #0x48]
     964:      	b	0x424 <_stogir.verify.structure+0x2ac>
     968:      	cmp	x21, #0x0
     96c:      	b.ge	0xb78 <_stogir.verify.structure+0xa00>
     970:      	ldr	x3, [sp, #0x50]
     974:      	ldr	x1, [x3, #0x8]
     978:      	ldr	x4, [sp, #0x48]
     97c:      	ldr	x5, [x4, #0x8]
     980:      	cmp	x1, x5
     984:      	b.ne	0xa14 <_stogir.verify.structure+0x89c>
     988:      	movz	x16, #0x0, lsl #48
     98c:      	sub	x5, x16, x21
     990:      	cmp	x5, x1
     994:      	b.gt	0xa44 <_stogir.verify.structure+0x8cc>
     998:      	sub	x1, x5, #0x1
     99c:      	ldr	x5, [x20, #0x50]
     9a0:      	add	x1, x5, x1, lsl #2
     9a4:      	ldr	w1, [x1]
     9a8:      	sxtw	x1, w1
     9ac:      	cmp	x1, #0x0
     9b0:      	cset	w1, gt
     9b4:      	ubfx	x1, x1, #0, #8
     9b8:      	b	0xa48 <_stogir.verify.structure+0x8d0>
     9bc:      	brk	#0
     9c0:      	b	0x9bc <_stogir.verify.structure+0x844>
     9c4:      	movz	w1, #0x0, lsl #16
     9c8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000009c8:  ARM64_RELOC_PAGE21	l_stogir.328
     9cc:      	ldr	x16, [x16]
		00000000000009cc:  ARM64_RELOC_PAGEOFF12	l_stogir.328
     9d0:      	ldr	w5, [x16]
     9d4:      	ubfx	x1, x1, #0, #32
     9d8:      	cmp	x1, x5
     9dc:      	b.ne	0x9ec <_stogir.verify.structure+0x874>
     9e0:      	ldr	w1, [sp, #0xb0]
     9e4:      	ldr	w5, [sp, #0xa8]
     9e8:      	b	0x434 <_stogir.verify.structure+0x2bc>
     9ec:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000009ec:  ARM64_RELOC_PAGE21	l_stogir.329
     9f0:      	ldr	x16, [x16]
		00000000000009f0:  ARM64_RELOC_PAGEOFF12	l_stogir.329
     9f4:      	ldr	w5, [x16]
     9f8:      	cmp	x1, x5
     9fc:      	b.ne	0xa24 <_stogir.verify.structure+0x8ac>
     a00:      	ldr	w1, [sp, #0xb0]
     a04:      	ldr	w5, [sp, #0xa8]
     a08:      	b	0x434 <_stogir.verify.structure+0x2bc>
     a0c:      	movz	w1, #0x0, lsl #16
     a10:      	b	0x9c8 <_stogir.verify.structure+0x850>
     a14:      	movz	x1, #0x0, lsl #48
     a18:      	b	0x424 <_stogir.verify.structure+0x2ac>
     a1c:      	movz	x1, #0x0, lsl #48
     a20:      	b	0x95c <_stogir.verify.structure+0x7e4>
     a24:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000a24:  ARM64_RELOC_PAGE21	l_stogir.330
     a28:      	ldr	x16, [x16]
		0000000000000a28:  ARM64_RELOC_PAGEOFF12	l_stogir.330
     a2c:      	ldr	w5, [x16]
     a30:      	cmp	x1, x5
     a34:      	b.ne	0x914 <_stogir.verify.structure+0x79c>
     a38:      	ldr	w1, [sp, #0xb0]
     a3c:      	ldr	w5, [sp, #0xa8]
     a40:      	b	0x434 <_stogir.verify.structure+0x2bc>
     a44:      	movz	x1, #0x0, lsl #48
     a48:      	b	0xa18 <_stogir.verify.structure+0x8a0>
     a4c:      	brk	#0
     a50:      	b	0xa4c <_stogir.verify.structure+0x8d4>
     a54:      	str	x19, [sp, #0x30]
     a58:      	mov	x19, x0
     a5c:      	str	x22, [sp, #0x38]
     a60:      	str	x23, [sp, #0x80]
     a64:      	b	0x384 <_stogir.verify.structure+0x20c>
     a68:      	str	x19, [sp, #0x30]
     a6c:      	mov	x19, x0
     a70:      	str	x22, [sp, #0x38]
     a74:      	str	x23, [sp, #0x80]
     a78:      	b	0x384 <_stogir.verify.structure+0x20c>
     a7c:      	mov	x5, x28
     a80:      	str	x19, [sp, #0x30]
     a84:      	mov	x19, x0
     a88:      	mov	x0, x21
     a8c:      	mov	x2, x24
     a90:      	mov	x3, x25
     a94:      	mov	x4, x26
     a98:      	b	0x25c <_stogir.verify.structure+0xe4>
     a9c:      	mov	x5, x28
     aa0:      	str	x19, [sp, #0x30]
     aa4:      	mov	x19, x0
     aa8:      	mov	x0, x21
     aac:      	mov	x2, x24
     ab0:      	mov	x3, x25
     ab4:      	mov	x4, x26
     ab8:      	b	0x228 <_stogir.verify.structure+0xb0>
     abc:      	mov	x5, x28
     ac0:      	ldr	x19, [sp, #0x40]
     ac4:      	ldr	x0, [sp, #0x58]
     ac8:      	ldr	x2, [sp, #0x60]
     acc:      	ldr	x3, [sp, #0x50]
     ad0:      	ldr	x4, [sp, #0x48]
     ad4:      	b	0x228 <_stogir.verify.structure+0xb0>
     ad8:      	ldr	x0, [sp, #0x38]
     adc:      	b	0x3b8 <_stogir.verify.structure+0x240>
     ae0:      	str	x28, [sp, #0x90]
     ae4:      	ldr	x0, [sp, #0x58]
     ae8:      	str	x19, [sp, #0x88]
     aec:      	ldr	x2, [sp, #0x60]
     af0:      	str	x23, [sp, #0x80]
     af4:      	ldr	x3, [sp, #0x50]
     af8:      	ldr	x4, [sp, #0x48]
     afc:      	b	0x1e4 <_stogir.verify.structure+0x6c>
     b00:      	str	w21, [sp, #0xb0]
     b04:      	mov	w21, w1
     b08:      	str	w24, [sp, #0xa8]
     b0c:      	mov	x24, x0
     b10:      	b	0x5b8 <_stogir.verify.structure+0x440>
     b14:      	ldr	x2, [sp, #0x60]
     b18:      	b	0x6a4 <_stogir.verify.structure+0x52c>
     b1c:      	ldr	x0, [sp, #0x58]
     b20:      	ldr	w1, [sp, #0xb0]
     b24:      	ldr	w5, [sp, #0xa8]
     b28:      	ldr	x3, [sp, #0x50]
     b2c:      	ldr	x4, [sp, #0x48]
     b30:      	b	0x434 <_stogir.verify.structure+0x2bc>
     b34:      	ldr	x0, [sp, #0x58]
     b38:      	ldr	w1, [sp, #0xb0]
     b3c:      	ldr	w5, [sp, #0xa8]
     b40:      	ldr	x3, [sp, #0x50]
     b44:      	ldr	x4, [sp, #0x48]
     b48:      	b	0x434 <_stogir.verify.structure+0x2bc>
     b4c:      	ldr	x2, [sp, #0x60]
     b50:      	b	0x65c <_stogir.verify.structure+0x4e4>
     b54:      	ldr	w1, [sp, #0xb0]
     b58:      	ldr	w5, [sp, #0xa8]
     b5c:      	b	0x940 <_stogir.verify.structure+0x7c8>
     b60:      	ldr	x0, [sp, #0x58]
     b64:      	b	0x968 <_stogir.verify.structure+0x7f0>
     b68:      	ldr	x0, [sp, #0x58]
     b6c:      	b	0x958 <_stogir.verify.structure+0x7e0>
     b70:      	ldr	w5, [sp, #0xa8]
     b74:      	b	0x940 <_stogir.verify.structure+0x7c8>
     b78:      	ldr	x3, [sp, #0x50]
     b7c:      	ldr	x4, [sp, #0x48]
     b80:      	b	0x420 <_stogir.verify.structure+0x2a8>
