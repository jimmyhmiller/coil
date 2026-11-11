<_stogir.uses.build>:
     268:      	sub	sp, sp, #0xc0
     26c:      	str	x29, [sp, #0x10]
     270:      	str	x30, [sp, #0x18]
     274:      	add	x29, sp, #0x10
     278:      	str	x19, [sp, #0x68]
     27c:      	str	x20, [sp, #0x70]
     280:      	str	x21, [sp, #0x78]
     284:      	str	x22, [sp, #0x80]
     288:      	str	x23, [sp, #0x88]
     28c:      	str	x24, [sp, #0x90]
     290:      	str	x25, [sp, #0x98]
     294:      	str	x26, [sp, #0xa0]
     298:      	str	x27, [sp, #0xa8]
     29c:      	str	x28, [sp, #0xb0]
     2a0:      	sub	sp, sp, #0x50
     2a4:      	add	x19, sp, #0x10
     2a8:      	sub	sp, sp, #0x50
     2ac:      	add	x2, sp, #0x10
     2b0:      	sub	sp, sp, #0x50
     2b4:      	add	x3, sp, #0x10
     2b8:      	sub	sp, sp, #0x50
     2bc:      	add	x4, sp, #0x10
     2c0:      	sub	sp, sp, #0x30
     2c4:      	add	x20, sp, #0x10
     2c8:      	sub	sp, sp, #0x10
     2cc:      	add	x21, sp, #0x10
     2d0:      	sub	sp, sp, #0x10
     2d4:      	add	x22, sp, #0x10
     2d8:      	sub	sp, sp, #0x10
     2dc:      	add	x23, sp, #0x10
     2e0:      	sub	sp, sp, #0x50
     2e4:      	add	x24, sp, #0x10
     2e8:      	sub	sp, sp, #0x10
     2ec:      	add	x25, sp, #0x10
     2f0:      	movz	x5, #0x0, lsl #48
     2f4:      	b	0x30c <_stogir.uses.build+0xa4>
     2f8:      	add	x6, x5, #0x8
     2fc:      	add	x5, x3, x5
     300:      	movz	x17, #0x0, lsl #48
     304:      	str	x17, [x5]
     308:      	mov	x5, x6
     30c:      	cmp	x5, #0x50
     310:      	b.lo	0x2f8 <_stogir.uses.build+0x90>
     314:      	movz	x5, #0x0, lsl #48
     318:      	b	0x338 <_stogir.uses.build+0xd0>
     31c:      	nop
     320:      	add	x6, x5, #0x8
     324:      	add	x7, x2, x5
     328:      	add	x5, x3, x5
     32c:      	ldr	x5, [x5]
     330:      	str	x5, [x7]
     334:      	mov	x5, x6
     338:      	cmp	x5, #0x50
     33c:      	b.lo	0x320 <_stogir.uses.build+0xb8>
     340:      	add	x3, x2, #0x28
     344:      	ldr	x5, [x1]
     348:      	ldr	x6, [x1, #0x8]
     34c:      	movz	x17, #0x0, lsl #48
     350:      	str	x17, [x2]
     354:      	movz	x17, #0x0, lsl #48
     358:      	str	x17, [x2, #0x8]
     35c:      	movz	x17, #0x0, lsl #48
     360:      	str	x17, [x2, #0x10]
     364:      	str	x5, [x2, #0x18]
     368:      	str	x6, [x2, #0x20]
     36c:      	ldr	x5, [x1]
     370:      	ldr	x6, [x1, #0x8]
     374:      	movz	x17, #0x0, lsl #48
     378:      	str	x17, [x2, #0x28]
     37c:      	movz	x17, #0x0, lsl #48
     380:      	str	x17, [x3, #0x8]
     384:      	movz	x17, #0x0, lsl #48
     388:      	str	x17, [x3, #0x10]
     38c:      	str	x5, [x3, #0x18]
     390:      	str	x6, [x3, #0x20]
     394:      	movz	x3, #0x0, lsl #48
     398:      	b	0x3b8 <_stogir.uses.build+0x150>
     39c:      	nop
     3a0:      	add	x5, x3, #0x8
     3a4:      	add	x6, x4, x3
     3a8:      	add	x3, x2, x3
     3ac:      	ldr	x3, [x3]
     3b0:      	str	x3, [x6]
     3b4:      	mov	x3, x5
     3b8:      	cmp	x3, #0x50
     3bc:      	b.lo	0x3a0 <_stogir.uses.build+0x138>
     3c0:      	movz	x2, #0x0, lsl #48
     3c4:      	b	0x3e0 <_stogir.uses.build+0x178>
     3c8:      	add	x3, x2, #0x8
     3cc:      	add	x5, x19, x2
     3d0:      	add	x2, x4, x2
     3d4:      	ldr	x2, [x2]
     3d8:      	str	x2, [x5]
     3dc:      	mov	x2, x3
     3e0:      	cmp	x2, #0x50
     3e4:      	b.lo	0x3c8 <_stogir.uses.build+0x160>
     3e8:      	ldr	x2, [x1]
     3ec:      	ldr	x1, [x1, #0x8]
     3f0:      	movz	x17, #0x0, lsl #48
     3f4:      	str	x17, [x20]
     3f8:      	movz	x17, #0x0, lsl #48
     3fc:      	str	x17, [x20, #0x8]
     400:      	movz	x17, #0x0, lsl #48
     404:      	str	x17, [x20, #0x10]
     408:      	str	x2, [x20, #0x18]
     40c:      	str	x1, [x20, #0x20]
     410:      	ldr	x1, [x0, #0x8]
     414:      	orr	x26, x1, xzr
     418:      	ldr	x1, [x19, #0x8]
     41c:      	orr	x27, x1, xzr
     420:      	ldr	x1, [x19, #0x10]
     424:      	add	x28, x27, x26
     428:      	cmp	x28, x1
     42c:      	b.le	0xb7c <_stogir.uses.build+0x914>
     430:      	mov	x17, #0x3fffffffffffffff ; =4611686018427387903
     434:      	cmp	x1, x17
     438:      	b.gt	0x444 <_stogir.uses.build+0x1dc>
     43c:      	lsl	x1, x1, #1
     440:      	b	0x448 <_stogir.uses.build+0x1e0>
     444:      	mov	x1, x28
     448:      	cmp	x1, x28
     44c:      	b.gt	0x454 <_stogir.uses.build+0x1ec>
     450:      	mov	x1, x28
     454:      	str	x8, [x29, #0x10]
     458:      	str	x24, [x29, #0x18]
     45c:      	mov	x24, x0
     460:      	mov	x0, x19
     464:      	bl	0x464 <_stogir.uses.build+0x1fc>
		0000000000000464:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__stogir.uses.Range
     468:      	orr	x0, x20, xzr
     46c:      	lsl	x1, x27, #4
     470:      	lsl	x2, x26, #4
     474:      	ldr	x3, [x19]
     478:      	add	x1, x1, x3
     47c:      	mov	x26, x0
     480:      	mov	x0, x1
     484:      	movz	x1, #0x0, lsl #48
     488:      	bl	0x488 <_stogir.uses.build+0x220>
		0000000000000488:  ARM64_RELOC_BRANCH26	_memset
     48c:      	str	x28, [x19, #0x8]
     490:      	ldr	x0, [x24, #0x8]
     494:      	orr	x27, x0, xzr
     498:      	ldr	x0, [x20, #0x8]
     49c:      	orr	x28, x0, xzr
     4a0:      	ldr	x0, [x20, #0x10]
     4a4:      	add	x1, x28, x27
     4a8:      	cmp	x1, x0
     4ac:      	b.le	0xb8c <_stogir.uses.build+0x924>
     4b0:      	mov	x17, #0x3fffffffffffffff ; =4611686018427387903
     4b4:      	cmp	x0, x17
     4b8:      	b.gt	0x4c4 <_stogir.uses.build+0x25c>
     4bc:      	lsl	x0, x0, #1
     4c0:      	b	0x4c8 <_stogir.uses.build+0x260>
     4c4:      	mov	x0, x1
     4c8:      	cmp	x0, x1
     4cc:      	b.gt	0x4d4 <_stogir.uses.build+0x26c>
     4d0:      	mov	x0, x1
     4d4:      	str	x26, [x29, #0x20]
     4d8:      	fmov	d31, x0
     4dc:      	mov	x0, x26
     4e0:      	mov	x26, x1
     4e4:      	fmov	x1, d31
     4e8:      	bl	0x4e8 <_stogir.uses.build+0x280>
		00000000000004e8:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__i64
     4ec:      	lsl	x0, x28, #3
     4f0:      	lsl	x1, x27, #3
     4f4:      	adrp	x16, 0x0 <_gap_uses_graph>
		00000000000004f4:  ARM64_RELOC_PAGE21	l_stogir.117
     4f8:      	ldr	x16, [x16]
		00000000000004f8:  ARM64_RELOC_PAGEOFF12	l_stogir.117
     4fc:      	orr	x27, x16, xzr
     500:      	add	x28, x24, #0x78
     504:      	add	x2, x24, #0x28
     508:      	add	x3, x24, #0x50
     50c:      	ldr	x4, [x20]
     510:      	add	x0, x0, x4
     514:      	str	x23, [x29, #0x28]
     518:      	mov	x23, x2
     51c:      	mov	x2, x1
     520:      	str	x22, [x29, #0x30]
     524:      	mov	x22, x3
     528:      	movz	x1, #0x0, lsl #48
     52c:      	bl	0x52c <_stogir.uses.build+0x2c4>
		000000000000052c:  ARM64_RELOC_BRANCH26	_memset
     530:      	str	x26, [x20, #0x8]
     534:      	mov	x0, #0x1                ; =1
     538:      	b	0x7a0 <_stogir.uses.build+0x538>
     53c:      	movz	x12, #0x0, lsl #48
     540:      	b	0x550 <_stogir.uses.build+0x2e8>
     544:      	movz	x12, #0x0, lsl #48
     548:      	b	0x558 <_stogir.uses.build+0x2f0>
     54c:      	movz	x12, #0x0, lsl #48
     550:      	b	0x560 <_stogir.uses.build+0x2f8>
     554:      	movz	x12, #0x0, lsl #48
     558:      	b	0x560 <_stogir.uses.build+0x2f8>
     55c:      	movz	x12, #0x0, lsl #48
     560:      	cmp	x12, #0x0
     564:      	b.eq	0x630 <_stogir.uses.build+0x3c8>
     568:      	cmp	x11, #0x1
     56c:      	b.lt	0x5dc <_stogir.uses.build+0x374>
     570:      	ldr	x12, [x24, #0x78]
     574:      	add	x12, x5, x12
     578:      	ldr	w12, [x12]
     57c:      	sxtw	x12, w12
     580:      	cmp	x11, x12
     584:      	b.gt	0x5dc <_stogir.uses.build+0x374>
     588:      	ldr	x12, [x24]
     58c:      	asr	x16, x11, #63
     590:      	lsr	x16, x16, #62
     594:      	add	x13, x11, x16
     598:      	asr	x13, x13, #2
     59c:      	asr	x16, x11, #63
     5a0:      	lsr	x16, x16, #62
     5a4:      	add	x11, x11, x16
     5a8:      	and	x11, x11, #0x3
     5ac:      	sub	x11, x11, x16
     5b0:      	add	x13, x13, x3
     5b4:      	lsl	x11, x11, #2
     5b8:      	lsl	x13, x13, #4
     5bc:      	add	x12, x13, x12
     5c0:      	add	x11, x11, x12
     5c4:      	ldr	w11, [x11]
     5c8:      	sxtw	x11, w11
     5cc:      	and	x11, x11, #0xffffffff
     5d0:      	mov	x12, x11
     5d4:      	mov	x11, #0x1               ; =1
     5d8:      	b	0x5e4 <_stogir.uses.build+0x37c>
     5dc:      	movz	x11, #0x0, lsl #48
     5e0:      	movz	x12, #0x0, lsl #48
     5e4:      	b	0x638 <_stogir.uses.build+0x3d0>
     5e8:      	movz	x1, #0x0, lsl #48
     5ec:      	sxtw	x2, w2
     5f0:      	lsr	w3, w0, #0
     5f4:      	sxtw	x3, w3
     5f8:      	lsr	w1, w1, #0
     5fc:      	cmp	x3, #0x0
     600:      	cset	w4, le
     604:      	lsl	x5, x3, #2
     608:      	cmp	x3, #0x0
     60c:      	cset	w6, gt
     610:      	cmp	x3, #0x0
     614:      	cset	w7, lt
     618:      	movz	x16, #0x0, lsl #48
     61c:      	sub	x8, x16, x3
     620:      	sub	x9, x8, #0x1
     624:      	lsl	x9, x9, #2
     628:      	mov	x10, #0x1               ; =1
     62c:      	b	0x6b4 <_stogir.uses.build+0x44c>
     630:      	movz	x11, #0x0, lsl #48
     634:      	movz	x12, #0x0, lsl #48
     638:      	str	x11, [x21]
     63c:      	lsr	w11, w11, #0
     640:      	str	x12, [x21, #0x8]
     644:      	lsr	x16, x11, #0
     648:      	cmp	x16, #0x1
     64c:      	b.eq	0x668 <_stogir.uses.build+0x400>
     650:      	b.lo	0x658 <_stogir.uses.build+0x3f0>
     654:      	b	0x66c <_stogir.uses.build+0x404>
     658:      	cmp	x16, #0x0
     65c:      	b.eq	0x664 <_stogir.uses.build+0x3fc>
     660:      	b	0x66c <_stogir.uses.build+0x404>
     664:      	b	0x6a8 <_stogir.uses.build+0x440>
     668:      	b	0x670 <_stogir.uses.build+0x408>
     66c:      	b	0xb74 <_stogir.uses.build+0x90c>
     670:      	ldr	w11, [x21, #0x8]
     674:      	sxtw	x11, w11
     678:      	cmp	x11, #0x0
     67c:      	b.le	0x6a8 <_stogir.uses.build+0x440>
     680:      	lsl	x12, x11, #4
     684:      	lsl	x11, x11, #4
     688:      	ldr	x13, [x19]
     68c:      	add	x12, x12, x13
     690:      	add	x11, x11, x13
     694:      	ldr	x13, [x12]
     698:      	ldr	x12, [x12, #0x8]
     69c:      	add	x12, x12, #0x1
     6a0:      	str	x13, [x11]
     6a4:      	str	x12, [x11, #0x8]
     6a8:      	add	x10, x10, #0x1
     6ac:      	lsr	w10, w10, #0
     6b0:      	sxtw	x10, w10
     6b4:      	cmp	x10, x2
     6b8:      	b.gt	0x788 <_stogir.uses.build+0x520>
     6bc:      	lsr	w11, w10, #0
     6c0:      	sxtw	x11, w11
     6c4:      	cmp	x11, #0x0
     6c8:      	b.le	0x708 <_stogir.uses.build+0x4a0>
     6cc:      	cmp	x11, #0x4
     6d0:      	b.le	0x6dc <_stogir.uses.build+0x474>
     6d4:      	mov	x12, #0x4               ; =4
     6d8:      	b	0x6e8 <_stogir.uses.build+0x480>
     6dc:      	sub	x12, x11, #0x1
     6e0:      	lsr	w12, w12, #0
     6e4:      	sxtw	x12, w12
     6e8:      	lsl	x12, x12, #2
     6ec:      	lsr	w12, w12, #0
     6f0:      	ubfx	x12, x12, #0, #32
     6f4:      	lsr	x12, x1, x12
     6f8:      	lsr	w12, w12, #0
     6fc:      	and	x12, x12, #0xf
     700:      	lsr	w12, w12, #0
     704:      	b	0x70c <_stogir.uses.build+0x4a4>
     708:      	movz	x12, #0x0, lsl #48
     70c:      	lsr	w12, w12, #0
     710:      	cmp	x12, #0xf
     714:      	b.hs	0x6a8 <_stogir.uses.build+0x440>
     718:      	mov	x16, #0x1               ; =1
     71c:      	lsl	x12, x16, x12
     720:      	lsr	w12, w12, #0
     724:      	mov	x17, #0x5e1c            ; =24092
     728:      	and	x12, x12, x17
     72c:      	lsr	w12, w12, #0
     730:      	cmp	x12, #0x0
     734:      	b.eq	0x6a8 <_stogir.uses.build+0x440>
     738:      	uxtb	w16, w4
     73c:      	cmp	w16, wzr
     740:      	b.ne	0x630 <_stogir.uses.build+0x3c8>
     744:      	uxtb	w16, w6
     748:      	cmp	w16, wzr
     74c:      	b.eq	0x7e8 <_stogir.uses.build+0x580>
     750:      	ldr	x12, [x24, #0x8]
     754:      	cmp	x3, x12
     758:      	b.ge	0x554 <_stogir.uses.build+0x2ec>
     75c:      	ldr	x12, [x28, #0x8]
     760:      	cmp	x3, x12
     764:      	b.ge	0x544 <_stogir.uses.build+0x2dc>
     768:      	ldr	x12, [x24, #0x78]
     76c:      	add	x12, x5, x12
     770:      	ldr	w12, [x12]
     774:      	sxtw	x12, w12
     778:      	cmp	x12, #0x0
     77c:      	cset	w12, ge
     780:      	ubfx	x12, x12, #0, #8
     784:      	b	0x548 <_stogir.uses.build+0x2e0>
     788:      	add	x1, x2, #0x4
     78c:      	asr	x16, x1, #63
     790:      	lsr	x16, x16, #62
     794:      	add	x1, x1, x16
     798:      	asr	x1, x1, #2
     79c:      	add	x0, x1, x0
     7a0:      	ldr	x1, [x24, #0x8]
     7a4:      	cmp	x0, x1
     7a8:      	b.ge	0x82c <_stogir.uses.build+0x5c4>
     7ac:      	lsl	x1, x0, #4
     7b0:      	lsl	x2, x0, #2
     7b4:      	ldr	x3, [x24]
     7b8:      	add	x1, x1, x3
     7bc:      	ldr	x1, [x1]
     7c0:      	ldr	x3, [x24, #0x78]
     7c4:      	uxtb	w1, w1
     7c8:      	add	x2, x2, x3
     7cc:      	ldr	w2, [x2]
     7d0:      	cmp	x1, #0x83
     7d4:      	b.ge	0x5e8 <_stogir.uses.build+0x380>
     7d8:      	lsl	x1, x1, #2
     7dc:      	add	x1, x1, x27
     7e0:      	ldr	w1, [x1]
     7e4:      	b	0x5ec <_stogir.uses.build+0x384>
     7e8:      	uxtb	w16, w7
     7ec:      	cmp	w16, wzr
     7f0:      	b.eq	0x55c <_stogir.uses.build+0x2f4>
     7f4:      	ldr	x12, [x23, #0x8]
     7f8:      	ldr	x13, [x22, #0x8]
     7fc:      	cmp	x12, x13
     800:      	b.ne	0x54c <_stogir.uses.build+0x2e4>
     804:      	cmp	x8, x12
     808:      	b.gt	0x53c <_stogir.uses.build+0x2d4>
     80c:      	ldr	x12, [x24, #0x50]
     810:      	add	x12, x9, x12
     814:      	ldr	w12, [x12]
     818:      	sxtw	x12, w12
     81c:      	cmp	x12, #0x0
     820:      	cset	w12, gt
     824:      	ubfx	x12, x12, #0, #8
     828:      	b	0x540 <_stogir.uses.build+0x2d8>
     82c:      	movz	x0, #0x0, lsl #48
     830:      	movz	x21, #0x0, lsl #48
     834:      	b	0x878 <_stogir.uses.build+0x610>
     838:      	lsl	x1, x0, #4
     83c:      	add	x2, x0, #0x1
     840:      	lsl	x3, x0, #4
     844:      	lsl	x0, x0, #3
     848:      	ldr	x4, [x19]
     84c:      	add	x1, x1, x4
     850:      	add	x3, x3, x4
     854:      	ldr	x1, [x1, #0x8]
     858:      	add	x4, x1, x21
     85c:      	str	x21, [x3]
     860:      	str	x1, [x3, #0x8]
     864:      	ldr	x1, [x20]
     868:      	add	x0, x0, x1
     86c:      	str	x21, [x0]
     870:      	mov	x0, x2
     874:      	mov	x21, x4
     878:      	ldr	x1, [x19, #0x8]
     87c:      	cmp	x0, x1
     880:      	b.lt	0x838 <_stogir.uses.build+0x5d0>
     884:      	add	x22, x19, #0x28
     888:      	ldr	x0, [x22, #0x8]
     88c:      	orr	x23, x0, xzr
     890:      	ldr	x0, [x22, #0x10]
     894:      	add	x26, x23, x21
     898:      	cmp	x26, x0
     89c:      	b.le	0x8d0 <_stogir.uses.build+0x668>
     8a0:      	mov	x17, #0x3fffffffffffffff ; =4611686018427387903
     8a4:      	cmp	x0, x17
     8a8:      	b.gt	0x8b4 <_stogir.uses.build+0x64c>
     8ac:      	lsl	x0, x0, #1
     8b0:      	b	0x8b8 <_stogir.uses.build+0x650>
     8b4:      	mov	x0, x26
     8b8:      	cmp	x0, x26
     8bc:      	b.gt	0x8c4 <_stogir.uses.build+0x65c>
     8c0:      	mov	x0, x26
     8c4:      	mov	x1, x0
     8c8:      	mov	x0, x22
     8cc:      	bl	0x8cc <_stogir.uses.build+0x664>
		00000000000008cc:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__stogir.uses.Use
     8d0:      	add	x27, x19, #0x28
     8d4:      	lsl	x0, x23, #3
     8d8:      	lsl	x1, x21, #3
     8dc:      	adrp	x16, 0x0 <_gap_uses_graph>
		00000000000008dc:  ARM64_RELOC_PAGE21	l_stogir.117
     8e0:      	ldr	x16, [x16]
		00000000000008e0:  ARM64_RELOC_PAGEOFF12	l_stogir.117
     8e4:      	orr	x21, x16, xzr
     8e8:      	ldr	x2, [x19, #0x28]
     8ec:      	add	x0, x0, x2
     8f0:      	mov	x2, x1
     8f4:      	movz	x1, #0x0, lsl #48
     8f8:      	bl	0x8f8 <_stogir.uses.build+0x690>
		00000000000008f8:  ARM64_RELOC_BRANCH26	_memset
     8fc:      	str	x26, [x22, #0x8]
     900:      	mov	x22, #0x1               ; =1
     904:      	b	0xa78 <_stogir.uses.build+0x810>
     908:      	movz	x0, #0x0, lsl #48
     90c:      	sxtw	x23, w1
     910:      	lsr	w1, w22, #0
     914:      	lsr	w26, w1, #0
     918:      	lsr	w28, w0, #0
     91c:      	mov	x0, #0x1                ; =1
     920:      	b	0x998 <_stogir.uses.build+0x730>
     924:      	nop
     928:      	lsl	x1, x0, #3
     92c:      	ldr	x2, [x20]
     930:      	add	x1, x1, x2
     934:      	ldr	x1, [x1]
     938:      	ldr	x2, [x29, #0x28]
     93c:      	movz	x17, #0x0, lsl #48
     940:      	str	x17, [x2]
     944:      	add	x4, x1, #0x1
     948:      	str	w26, [x2]
     94c:      	str	w24, [x2, #0x4]
     950:      	ldr	x5, [x2]
     954:      	mov	x24, x3
     958:      	str	x0, [x29, #0x48]
     95c:      	mov	x0, x27
     960:      	str	x2, [x29, #0x28]
     964:      	mov	x2, x5
     968:      	str	x4, [x29, #0x50]
     96c:      	bl	0x96c <_stogir.uses.build+0x704>
		000000000000096c:  ARM64_RELOC_BRANCH26	_coil.core.Set$coil.arraylist.ArrayList$set!__stogir.uses.Use
     970:      	ldr	x0, [x29, #0x20]
     974:      	ldr	x1, [x29, #0x48]
     978:      	ldr	x2, [x29, #0x50]
     97c:      	bl	0x97c <_stogir.uses.build+0x714>
		000000000000097c:  ARM64_RELOC_BRANCH26	_coil.core.Set$coil.arraylist.ArrayList$set!__i64
     980:      	add	x0, x21, #0x1
     984:      	lsr	w0, w0, #0
     988:      	sxtw	x0, w0
     98c:      	str	x24, [x29, #0x30]
     990:      	ldr	x24, [x29, #0x40]
     994:      	ldr	x21, [x29, #0x38]
     998:      	cmp	x0, x23
     99c:      	b.gt	0xb98 <_stogir.uses.build+0x930>
     9a0:      	lsr	w1, w0, #0
     9a4:      	str	x21, [x29, #0x38]
     9a8:      	mov	x21, x0
     9ac:      	mov	w0, w28
     9b0:      	str	x24, [x29, #0x40]
     9b4:      	mov	w24, w1
     9b8:      	bl	0x9b8 <_stogir.uses.build+0x750>
		00000000000009b8:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code-word
     9bc:      	lsr	w0, w0, #0
     9c0:      	bl	0x9c0 <_stogir.uses.build+0x758>
		00000000000009c0:  ARM64_RELOC_BRANCH26	_stogir.uses.edge-code?
     9c4:      	cmp	x0, #0x0
     9c8:      	b.eq	0xba8 <_stogir.uses.build+0x940>
     9cc:      	mov	x16, x25
     9d0:      	str	x16, [sp]
     9d4:      	ldr	x0, [x29, #0x40]
     9d8:      	mov	w1, w26
     9dc:      	mov	w2, w24
     9e0:      	bl	0x9e0 <_stogir.uses.build+0x778>
		00000000000009e0:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     9e4:      	ldr	x16, [sp]
     9e8:      	str	x0, [x16]
     9ec:      	str	x1, [x16, #0x8]
     9f0:      	ldr	x0, [x25]
     9f4:      	ldr	x1, [x25, #0x8]
     9f8:      	lsr	w2, w0, #0
     9fc:      	ldr	x3, [x29, #0x30]
     a00:      	str	x0, [x3]
     a04:      	str	x1, [x3, #0x8]
     a08:      	lsr	x16, x2, #0
     a0c:      	cmp	x16, #0x1
     a10:      	b.eq	0xa30 <_stogir.uses.build+0x7c8>
     a14:      	b.lo	0xa1c <_stogir.uses.build+0x7b4>
     a18:      	b	0xa34 <_stogir.uses.build+0x7cc>
     a1c:      	cmp	x16, #0x0
     a20:      	b.eq	0xa28 <_stogir.uses.build+0x7c0>
     a24:      	b	0xa34 <_stogir.uses.build+0x7cc>
     a28:      	mov	x24, x3
     a2c:      	b	0x980 <_stogir.uses.build+0x718>
     a30:      	b	0xa38 <_stogir.uses.build+0x7d0>
     a34:      	b	0xb6c <_stogir.uses.build+0x904>
     a38:      	ldr	w0, [x3, #0x8]
     a3c:      	sxtw	x0, w0
     a40:      	cmp	x0, #0x0
     a44:      	b.gt	0x928 <_stogir.uses.build+0x6c0>
     a48:      	mov	x24, x3
     a4c:      	b	0x980 <_stogir.uses.build+0x718>
     a50:      	add	x0, x23, #0x4
     a54:      	asr	x16, x0, #63
     a58:      	lsr	x16, x16, #62
     a5c:      	add	x0, x0, x16
     a60:      	asr	x0, x0, #2
     a64:      	add	x0, x0, x22
     a68:      	str	x24, [x29, #0x30]
     a6c:      	ldr	x24, [x29, #0x40]
     a70:      	ldr	x21, [x29, #0x38]
     a74:      	mov	x22, x0
     a78:      	ldr	x0, [x24, #0x8]
     a7c:      	cmp	x22, x0
     a80:      	b.ge	0xac0 <_stogir.uses.build+0x858>
     a84:      	lsl	x0, x22, #4
     a88:      	lsl	x1, x22, #2
     a8c:      	ldr	x2, [x24]
     a90:      	add	x0, x0, x2
     a94:      	ldr	x0, [x0]
     a98:      	ldr	x2, [x24, #0x78]
     a9c:      	uxtb	w0, w0
     aa0:      	add	x1, x1, x2
     aa4:      	ldr	w1, [x1]
     aa8:      	cmp	x0, #0x83
     aac:      	b.ge	0x908 <_stogir.uses.build+0x6a0>
     ab0:      	lsl	x0, x0, #2
     ab4:      	add	x0, x0, x21
     ab8:      	ldr	w0, [x0]
     abc:      	b	0x90c <_stogir.uses.build+0x6a4>
     ac0:      	ldr	x0, [x29, #0x20]
     ac4:      	bl	0xac4 <_stogir.uses.build+0x85c>
		0000000000000ac4:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$free!__i64
     ac8:      	movz	x0, #0x0, lsl #48
     acc:      	b	0xaf0 <_stogir.uses.build+0x888>
     ad0:      	add	x1, x0, #0x8
     ad4:      	ldr	x2, [x29, #0x18]
     ad8:      	add	x3, x2, x0
     adc:      	add	x0, x19, x0
     ae0:      	ldr	x0, [x0]
     ae4:      	str	x0, [x3]
     ae8:      	str	x2, [x29, #0x18]
     aec:      	mov	x0, x1
     af0:      	cmp	x0, #0x50
     af4:      	b.lo	0xad0 <_stogir.uses.build+0x868>
     af8:      	ldr	x2, [x29, #0x18]
     afc:      	movz	x0, #0x0, lsl #48
     b00:      	b	0xb28 <_stogir.uses.build+0x8c0>
     b04:      	nop
     b08:      	add	x1, x0, #0x8
     b0c:      	ldr	x3, [x29, #0x10]
     b10:      	add	x4, x3, x0
     b14:      	add	x0, x2, x0
     b18:      	ldr	x0, [x0]
     b1c:      	str	x0, [x4]
     b20:      	str	x3, [x29, #0x10]
     b24:      	mov	x0, x1
     b28:      	cmp	x0, #0x50
     b2c:      	b.lo	0xb08 <_stogir.uses.build+0x8a0>
     b30:      	sub	sp, x29, #0x10
     b34:      	ldr	x19, [sp, #0x68]
     b38:      	ldr	x20, [sp, #0x70]
     b3c:      	ldr	x21, [sp, #0x78]
     b40:      	ldr	x22, [sp, #0x80]
     b44:      	ldr	x23, [sp, #0x88]
     b48:      	ldr	x24, [sp, #0x90]
     b4c:      	ldr	x25, [sp, #0x98]
     b50:      	ldr	x26, [sp, #0xa0]
     b54:      	ldr	x27, [sp, #0xa8]
     b58:      	ldr	x28, [sp, #0xb0]
     b5c:      	ldr	x29, [sp, #0x10]
     b60:      	ldr	x30, [sp, #0x18]
     b64:      	add	sp, sp, #0xc0
     b68:      	ret
     b6c:      	brk	#0
     b70:      	b	0xb6c <_stogir.uses.build+0x904>
     b74:      	brk	#0
     b78:      	b	0xb74 <_stogir.uses.build+0x90c>
     b7c:      	str	x8, [x29, #0x10]
     b80:      	str	x24, [x29, #0x18]
     b84:      	mov	x24, x0
     b88:      	b	0x468 <_stogir.uses.build+0x200>
     b8c:      	str	x26, [x29, #0x20]
     b90:      	mov	x26, x1
     b94:      	b	0x4ec <_stogir.uses.build+0x284>
     b98:      	str	x24, [x29, #0x40]
     b9c:      	ldr	x24, [x29, #0x30]
     ba0:      	str	x21, [x29, #0x38]
     ba4:      	b	0xa50 <_stogir.uses.build+0x7e8>
     ba8:      	ldr	x24, [x29, #0x30]
     bac:      	b	0x980 <_stogir.uses.build+0x718>
