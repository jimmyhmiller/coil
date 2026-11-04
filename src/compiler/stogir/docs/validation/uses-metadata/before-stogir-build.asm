<_stogir.uses.build>:
     268:      	sub	sp, sp, #0xc0
     26c:      	str	x29, [sp]
     270:      	str	x30, [sp, #0x8]
     274:      	mov	x29, sp
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
     2a4:      	mov	x19, sp
     2a8:      	sub	sp, sp, #0x50
     2ac:      	mov	x2, sp
     2b0:      	sub	sp, sp, #0x50
     2b4:      	mov	x3, sp
     2b8:      	sub	sp, sp, #0x50
     2bc:      	mov	x4, sp
     2c0:      	sub	sp, sp, #0x30
     2c4:      	mov	x20, sp
     2c8:      	sub	sp, sp, #0x10
     2cc:      	mov	x21, sp
     2d0:      	sub	sp, sp, #0x10
     2d4:      	mov	x22, sp
     2d8:      	sub	sp, sp, #0x10
     2dc:      	mov	x23, sp
     2e0:      	sub	sp, sp, #0x50
     2e4:      	mov	x24, sp
     2e8:      	movz	x5, #0x0, lsl #48
     2ec:      	b	0x304 <_stogir.uses.build+0x9c>
     2f0:      	add	x6, x5, #0x8
     2f4:      	add	x5, x3, x5
     2f8:      	movz	x17, #0x0, lsl #48
     2fc:      	str	x17, [x5]
     300:      	mov	x5, x6
     304:      	cmp	x5, #0x50
     308:      	b.lo	0x2f0 <_stogir.uses.build+0x88>
     30c:      	movz	x5, #0x0, lsl #48
     310:      	b	0x330 <_stogir.uses.build+0xc8>
     314:      	nop
     318:      	add	x6, x5, #0x8
     31c:      	add	x7, x2, x5
     320:      	add	x5, x3, x5
     324:      	ldr	x5, [x5]
     328:      	str	x5, [x7]
     32c:      	mov	x5, x6
     330:      	cmp	x5, #0x50
     334:      	b.lo	0x318 <_stogir.uses.build+0xb0>
     338:      	add	x3, x2, #0x28
     33c:      	ldr	x5, [x1]
     340:      	ldr	x6, [x1, #0x8]
     344:      	movz	x17, #0x0, lsl #48
     348:      	str	x17, [x2]
     34c:      	movz	x17, #0x0, lsl #48
     350:      	str	x17, [x2, #0x8]
     354:      	movz	x17, #0x0, lsl #48
     358:      	str	x17, [x2, #0x10]
     35c:      	str	x5, [x2, #0x18]
     360:      	str	x6, [x2, #0x20]
     364:      	ldr	x5, [x1]
     368:      	ldr	x6, [x1, #0x8]
     36c:      	movz	x17, #0x0, lsl #48
     370:      	str	x17, [x2, #0x28]
     374:      	movz	x17, #0x0, lsl #48
     378:      	str	x17, [x3, #0x8]
     37c:      	movz	x17, #0x0, lsl #48
     380:      	str	x17, [x3, #0x10]
     384:      	str	x5, [x3, #0x18]
     388:      	str	x6, [x3, #0x20]
     38c:      	movz	x3, #0x0, lsl #48
     390:      	b	0x3b0 <_stogir.uses.build+0x148>
     394:      	nop
     398:      	add	x5, x3, #0x8
     39c:      	add	x6, x4, x3
     3a0:      	add	x3, x2, x3
     3a4:      	ldr	x3, [x3]
     3a8:      	str	x3, [x6]
     3ac:      	mov	x3, x5
     3b0:      	cmp	x3, #0x50
     3b4:      	b.lo	0x398 <_stogir.uses.build+0x130>
     3b8:      	movz	x2, #0x0, lsl #48
     3bc:      	b	0x3d8 <_stogir.uses.build+0x170>
     3c0:      	add	x3, x2, #0x8
     3c4:      	add	x5, x19, x2
     3c8:      	add	x2, x4, x2
     3cc:      	ldr	x2, [x2]
     3d0:      	str	x2, [x5]
     3d4:      	mov	x2, x3
     3d8:      	cmp	x2, #0x50
     3dc:      	b.lo	0x3c0 <_stogir.uses.build+0x158>
     3e0:      	ldr	x2, [x1]
     3e4:      	ldr	x1, [x1, #0x8]
     3e8:      	movz	x17, #0x0, lsl #48
     3ec:      	str	x17, [x20]
     3f0:      	movz	x17, #0x0, lsl #48
     3f4:      	str	x17, [x20, #0x8]
     3f8:      	movz	x17, #0x0, lsl #48
     3fc:      	str	x17, [x20, #0x10]
     400:      	str	x2, [x20, #0x18]
     404:      	str	x1, [x20, #0x20]
     408:      	ldr	x1, [x0, #0x8]
     40c:      	orr	x25, x1, xzr
     410:      	ldr	x1, [x19, #0x8]
     414:      	orr	x26, x1, xzr
     418:      	ldr	x1, [x19, #0x10]
     41c:      	add	x27, x26, x25
     420:      	cmp	x27, x1
     424:      	b.le	0xa94 <_stogir.uses.build+0x82c>
     428:      	mov	x17, #0x3fffffffffffffff ; =4611686018427387903
     42c:      	cmp	x1, x17
     430:      	b.gt	0x43c <_stogir.uses.build+0x1d4>
     434:      	lsl	x1, x1, #1
     438:      	b	0x440 <_stogir.uses.build+0x1d8>
     43c:      	mov	x1, x27
     440:      	cmp	x1, x27
     444:      	b.gt	0x44c <_stogir.uses.build+0x1e4>
     448:      	mov	x1, x27
     44c:      	str	x8, [x29, #0x10]
     450:      	mov	x28, x0
     454:      	mov	x0, x19
     458:      	bl	0x458 <_stogir.uses.build+0x1f0>
		0000000000000458:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__stogir.uses.Range
     45c:      	orr	x0, x20, xzr
     460:      	lsl	x1, x26, #4
     464:      	lsl	x2, x25, #4
     468:      	ldr	x3, [x19]
     46c:      	add	x1, x1, x3
     470:      	mov	x25, x0
     474:      	mov	x0, x1
     478:      	movz	x1, #0x0, lsl #48
     47c:      	bl	0x47c <_stogir.uses.build+0x214>
		000000000000047c:  ARM64_RELOC_BRANCH26	_memset
     480:      	str	x27, [x19, #0x8]
     484:      	ldr	x0, [x28, #0x8]
     488:      	orr	x26, x0, xzr
     48c:      	ldr	x0, [x20, #0x8]
     490:      	orr	x27, x0, xzr
     494:      	ldr	x0, [x20, #0x10]
     498:      	add	x1, x27, x26
     49c:      	cmp	x1, x0
     4a0:      	b.le	0xaa0 <_stogir.uses.build+0x838>
     4a4:      	mov	x17, #0x3fffffffffffffff ; =4611686018427387903
     4a8:      	cmp	x0, x17
     4ac:      	b.gt	0x4b8 <_stogir.uses.build+0x250>
     4b0:      	lsl	x0, x0, #1
     4b4:      	b	0x4bc <_stogir.uses.build+0x254>
     4b8:      	mov	x0, x1
     4bc:      	cmp	x0, x1
     4c0:      	b.gt	0x4c8 <_stogir.uses.build+0x260>
     4c4:      	mov	x0, x1
     4c8:      	str	x25, [x29, #0x18]
     4cc:      	fmov	d31, x0
     4d0:      	mov	x0, x25
     4d4:      	mov	x25, x1
     4d8:      	fmov	x1, d31
     4dc:      	bl	0x4dc <_stogir.uses.build+0x274>
		00000000000004dc:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__i64
     4e0:      	add	x0, x19, #0x28
     4e4:      	lsl	x1, x27, #3
     4e8:      	lsl	x2, x26, #3
     4ec:      	adrp	x16, 0x0 <_gap_uses_graph>
		00000000000004ec:  ARM64_RELOC_PAGE21	l_stogir.117
     4f0:      	ldr	x16, [x16]
		00000000000004f0:  ARM64_RELOC_PAGEOFF12	l_stogir.117
     4f4:      	orr	x26, x16, xzr
     4f8:      	add	x27, x28, #0x78
     4fc:      	add	x3, x28, #0x28
     500:      	add	x4, x28, #0x50
     504:      	ldr	x5, [x20]
     508:      	add	x1, x1, x5
     50c:      	str	x0, [x29, #0x28]
     510:      	mov	x0, x1
     514:      	str	x24, [x29, #0x20]
     518:      	mov	x24, x3
     51c:      	str	x23, [x29, #0x30]
     520:      	mov	x23, x4
     524:      	movz	x1, #0x0, lsl #48
     528:      	bl	0x528 <_stogir.uses.build+0x2c0>
		0000000000000528:  ARM64_RELOC_BRANCH26	_memset
     52c:      	str	x25, [x20, #0x8]
     530:      	movz	x25, #0x0, lsl #48
     534:      	b	0x5b0 <_stogir.uses.build+0x348>
     538:      	mov	x3, x4
     53c:      	cmp	x3, x4
     540:      	b.gt	0x548 <_stogir.uses.build+0x2e0>
     544:      	mov	x3, x4
     548:      	str	x14, [x29, #0x30]
     54c:      	str	x20, [x29, #0x48]
     550:      	mov	x20, x1
     554:      	mov	x1, x3
     558:      	str	x21, [x29, #0x50]
     55c:      	mov	x21, x0
     560:      	str	x22, [x29, #0x58]
     564:      	mov	x22, x2
     568:      	str	x23, [x29, #0x60]
     56c:      	mov	x23, x4
     570:      	bl	0x570 <_stogir.uses.build+0x308>
		0000000000000570:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__stogir.uses.Use
     574:      	lsl	x0, x22, #3
     578:      	lsl	x1, x20, #3
     57c:      	ldr	x2, [x19, #0x28]
     580:      	add	x0, x0, x2
     584:      	mov	x2, x1
     588:      	movz	x1, #0x0, lsl #48
     58c:      	bl	0x58c <_stogir.uses.build+0x324>
		000000000000058c:  ARM64_RELOC_BRANCH26	_memset
     590:      	str	x23, [x21, #0x8]
     594:      	add	x0, x25, #0x1
     598:      	ldr	x20, [x29, #0x48]
     59c:      	ldr	x22, [x29, #0x58]
     5a0:      	str	x21, [x29, #0x28]
     5a4:      	ldr	x21, [x29, #0x50]
     5a8:      	ldr	x23, [x29, #0x60]
     5ac:      	mov	x25, x0
     5b0:      	cmp	x25, #0x2
     5b4:      	b.ge	0x9e8 <_stogir.uses.build+0x780>
     5b8:      	cmp	x25, #0x0
     5bc:      	cset	w0, eq
     5c0:      	mov	x1, #0x1                ; =1
     5c4:      	b	0x894 <_stogir.uses.build+0x62c>
     5c8:      	movz	x13, #0x0, lsl #48
     5cc:      	b	0x5dc <_stogir.uses.build+0x374>
     5d0:      	movz	x13, #0x0, lsl #48
     5d4:      	b	0x5e4 <_stogir.uses.build+0x37c>
     5d8:      	movz	x13, #0x0, lsl #48
     5dc:      	b	0x5ec <_stogir.uses.build+0x384>
     5e0:      	movz	x13, #0x0, lsl #48
     5e4:      	b	0x5ec <_stogir.uses.build+0x384>
     5e8:      	movz	x13, #0x0, lsl #48
     5ec:      	cmp	x13, #0x0
     5f0:      	b.eq	0x7d0 <_stogir.uses.build+0x568>
     5f4:      	cmp	x14, #0x1
     5f8:      	b.lt	0x668 <_stogir.uses.build+0x400>
     5fc:      	ldr	x13, [x28, #0x78]
     600:      	add	x13, x8, x13
     604:      	ldr	w13, [x13]
     608:      	sxtw	x13, w13
     60c:      	cmp	x14, x13
     610:      	b.gt	0x668 <_stogir.uses.build+0x400>
     614:      	ldr	x13, [x28]
     618:      	asr	x16, x14, #63
     61c:      	lsr	x16, x16, #62
     620:      	add	x15, x14, x16
     624:      	asr	x15, x15, #2
     628:      	asr	x16, x14, #63
     62c:      	lsr	x16, x16, #62
     630:      	add	x14, x14, x16
     634:      	and	x14, x14, #0x3
     638:      	sub	x14, x14, x16
     63c:      	add	x15, x15, x4
     640:      	lsl	x14, x14, #2
     644:      	lsl	x15, x15, #4
     648:      	add	x13, x15, x13
     64c:      	add	x13, x14, x13
     650:      	ldr	w13, [x13]
     654:      	sxtw	x13, w13
     658:      	and	x13, x13, #0xffffffff
     65c:      	mov	x14, x13
     660:      	mov	x13, #0x1               ; =1
     664:      	b	0x670 <_stogir.uses.build+0x408>
     668:      	movz	x13, #0x0, lsl #48
     66c:      	movz	x14, #0x0, lsl #48
     670:      	b	0x7d8 <_stogir.uses.build+0x570>
     674:      	sub	x15, x14, #0x1
     678:      	lsr	w15, w15, #0
     67c:      	sxtw	x15, w15
     680:      	lsl	x13, x13, #2
     684:      	add	x13, x13, x26
     688:      	lsl	x15, x15, #2
     68c:      	lsr	w15, w15, #0
     690:      	ldr	w13, [x13]
     694:      	ubfx	x15, x15, #0, #32
     698:      	lsr	x13, x13, x15
     69c:      	lsr	w13, w13, #0
     6a0:      	and	x13, x13, #0xf
     6a4:      	lsr	w13, w13, #0
     6a8:      	b	0x6b0 <_stogir.uses.build+0x448>
     6ac:      	movz	x13, #0x0, lsl #48
     6b0:      	lsr	w13, w13, #0
     6b4:      	cmp	x13, #0xf
     6b8:      	b.hs	0xaac <_stogir.uses.build+0x844>
     6bc:      	mov	x16, #0x1               ; =1
     6c0:      	lsl	x13, x16, x13
     6c4:      	lsr	w13, w13, #0
     6c8:      	mov	x17, #0x5e1c            ; =24092
     6cc:      	and	x13, x13, x17
     6d0:      	lsr	w13, w13, #0
     6d4:      	cmp	x13, #0x0
     6d8:      	b.eq	0xabc <_stogir.uses.build+0x854>
     6dc:      	uxtb	w16, w7
     6e0:      	cmp	w16, wzr
     6e4:      	b.ne	0x7d0 <_stogir.uses.build+0x568>
     6e8:      	uxtb	w16, w9
     6ec:      	cmp	w16, wzr
     6f0:      	b.eq	0x910 <_stogir.uses.build+0x6a8>
     6f4:      	ldr	x13, [x28, #0x8]
     6f8:      	cmp	x4, x13
     6fc:      	b.ge	0x5e0 <_stogir.uses.build+0x378>
     700:      	ldr	x13, [x27, #0x8]
     704:      	cmp	x4, x13
     708:      	b.ge	0x5d0 <_stogir.uses.build+0x368>
     70c:      	ldr	x13, [x28, #0x78]
     710:      	add	x13, x8, x13
     714:      	ldr	w13, [x13]
     718:      	sxtw	x13, w13
     71c:      	cmp	x13, #0x0
     720:      	cset	w13, ge
     724:      	ubfx	x13, x13, #0, #8
     728:      	b	0x5d4 <_stogir.uses.build+0x36c>
     72c:      	lsl	x4, x13, #3
     730:      	lsl	x13, x13, #3
     734:      	ldr	x14, [x20]
     738:      	add	x4, x4, x14
     73c:      	ldr	x4, [x4]
     740:      	ldr	x14, [x29, #0x30]
     744:      	movz	x17, #0x0, lsl #48
     748:      	str	x17, [x14]
     74c:      	add	x15, x4, #0x1
     750:      	lsl	x4, x4, #3
     754:      	str	w6, [x14]
     758:      	str	w12, [x14, #0x4]
     75c:      	ldr	x12, [x14]
     760:      	str	w0, [x29, #0x40]
     764:      	ldr	x0, [x19, #0x28]
     768:      	add	x0, x4, x0
     76c:      	str	x12, [x0]
     770:      	ldr	x0, [x20]
     774:      	add	x0, x13, x0
     778:      	str	x15, [x0]
     77c:      	add	x0, x3, #0x1
     780:      	lsr	w0, w0, #0
     784:      	sxtw	x0, w0
     788:      	str	x14, [x29, #0x30]
     78c:      	ldr	x4, [x29, #0x38]
     790:      	mov	x3, x0
     794:      	ldr	w0, [x29, #0x40]
     798:      	cmp	x3, x2
     79c:      	b.gt	0xacc <_stogir.uses.build+0x864>
     7a0:      	lsr	w12, w3, #0
     7a4:      	ldr	w13, [x21]
     7a8:      	sxtw	x14, w12
     7ac:      	uxtb	w13, w13
     7b0:      	cmp	x13, #0x83
     7b4:      	b.ge	0x6ac <_stogir.uses.build+0x444>
     7b8:      	cmp	x14, #0x0
     7bc:      	b.le	0x6ac <_stogir.uses.build+0x444>
     7c0:      	cmp	x14, #0x4
     7c4:      	b.le	0x674 <_stogir.uses.build+0x40c>
     7c8:      	mov	x15, #0x4               ; =4
     7cc:      	b	0x680 <_stogir.uses.build+0x418>
     7d0:      	movz	x13, #0x0, lsl #48
     7d4:      	movz	x14, #0x0, lsl #48
     7d8:      	str	x13, [x22]
     7dc:      	lsr	w13, w13, #0
     7e0:      	str	x14, [x22, #0x8]
     7e4:      	lsr	x16, x13, #0
     7e8:      	cmp	x16, #0x1
     7ec:      	b.eq	0x814 <_stogir.uses.build+0x5ac>
     7f0:      	b.lo	0x7f8 <_stogir.uses.build+0x590>
     7f4:      	b	0x818 <_stogir.uses.build+0x5b0>
     7f8:      	cmp	x16, #0x0
     7fc:      	b.eq	0x804 <_stogir.uses.build+0x59c>
     800:      	b	0x818 <_stogir.uses.build+0x5b0>
     804:      	ldr	x14, [x29, #0x30]
     808:      	str	w0, [x29, #0x40]
     80c:      	str	x4, [x29, #0x38]
     810:      	b	0x77c <_stogir.uses.build+0x514>
     814:      	b	0x81c <_stogir.uses.build+0x5b4>
     818:      	b	0x9e0 <_stogir.uses.build+0x778>
     81c:      	ldr	w13, [x22, #0x8]
     820:      	sxtw	x13, w13
     824:      	cmp	x13, #0x0
     828:      	b.le	0xad8 <_stogir.uses.build+0x870>
     82c:      	lsl	x14, x13, #4
     830:      	ldr	x15, [x19]
     834:      	add	x14, x14, x15
     838:      	str	x4, [x29, #0x38]
     83c:      	ldr	x4, [x14]
     840:      	ldr	x14, [x14, #0x8]
     844:      	uxtb	w16, w0
     848:      	cmp	w16, wzr
     84c:      	b.eq	0x72c <_stogir.uses.build+0x4c4>
     850:      	add	x12, x14, #0x1
     854:      	lsl	x13, x13, #4
     858:      	add	x13, x13, x15
     85c:      	str	x4, [x13]
     860:      	str	x12, [x13, #0x8]
     864:      	ldr	x14, [x29, #0x30]
     868:      	str	w0, [x29, #0x40]
     86c:      	b	0x77c <_stogir.uses.build+0x514>
     870:      	add	x0, x2, #0x4
     874:      	asr	x16, x0, #63
     878:      	lsr	x16, x16, #62
     87c:      	add	x0, x0, x16
     880:      	asr	x0, x0, #2
     884:      	add	x0, x0, x1
     888:      	str	x14, [x29, #0x30]
     88c:      	mov	x1, x0
     890:      	ldr	w0, [x29, #0x40]
     894:      	ldr	x2, [x28, #0x8]
     898:      	cmp	x1, x2
     89c:      	b.ge	0xae8 <_stogir.uses.build+0x880>
     8a0:      	lsl	x2, x1, #4
     8a4:      	lsl	x3, x1, #2
     8a8:      	lsr	w4, w1, #0
     8ac:      	ldr	x5, [x28]
     8b0:      	lsr	w6, w4, #0
     8b4:      	sxtw	x4, w4
     8b8:      	cmp	x4, #0x0
     8bc:      	cset	w7, le
     8c0:      	lsl	x8, x4, #2
     8c4:      	cmp	x4, #0x0
     8c8:      	cset	w9, gt
     8cc:      	cmp	x4, #0x0
     8d0:      	cset	w10, lt
     8d4:      	movz	x16, #0x0, lsl #48
     8d8:      	sub	x11, x16, x4
     8dc:      	add	x2, x2, x5
     8e0:      	sub	x5, x11, #0x1
     8e4:      	lsl	x5, x5, #2
     8e8:      	ldr	x12, [x2]
     8ec:      	ldr	x2, [x2, #0x8]
     8f0:      	str	x12, [x21]
     8f4:      	str	x2, [x21, #0x8]
     8f8:      	ldr	x2, [x28, #0x78]
     8fc:      	add	x2, x3, x2
     900:      	ldr	w2, [x2]
     904:      	sxtw	x2, w2
     908:      	mov	x3, #0x1                ; =1
     90c:      	b	0x798 <_stogir.uses.build+0x530>
     910:      	uxtb	w16, w10
     914:      	cmp	w16, wzr
     918:      	b.eq	0x5e8 <_stogir.uses.build+0x380>
     91c:      	ldr	x13, [x24, #0x8]
     920:      	ldr	x15, [x23, #0x8]
     924:      	cmp	x13, x15
     928:      	b.ne	0x5d8 <_stogir.uses.build+0x370>
     92c:      	cmp	x11, x13
     930:      	b.gt	0x5c8 <_stogir.uses.build+0x360>
     934:      	ldr	x13, [x28, #0x50]
     938:      	add	x13, x5, x13
     93c:      	ldr	w13, [x13]
     940:      	sxtw	x13, w13
     944:      	cmp	x13, #0x0
     948:      	cset	w13, gt
     94c:      	ubfx	x13, x13, #0, #8
     950:      	b	0x5cc <_stogir.uses.build+0x364>
     954:      	cmp	x25, #0x0
     958:      	b.ne	0xaf0 <_stogir.uses.build+0x888>
     95c:      	movz	x0, #0x0, lsl #48
     960:      	movz	x1, #0x0, lsl #48
     964:      	b	0x9a8 <_stogir.uses.build+0x740>
     968:      	lsl	x2, x0, #4
     96c:      	add	x3, x0, #0x1
     970:      	lsl	x4, x0, #4
     974:      	lsl	x0, x0, #3
     978:      	ldr	x5, [x19]
     97c:      	add	x2, x2, x5
     980:      	add	x4, x4, x5
     984:      	ldr	x2, [x2, #0x8]
     988:      	add	x5, x2, x1
     98c:      	str	x1, [x4]
     990:      	str	x2, [x4, #0x8]
     994:      	ldr	x2, [x20]
     998:      	add	x0, x0, x2
     99c:      	str	x1, [x0]
     9a0:      	mov	x0, x3
     9a4:      	mov	x1, x5
     9a8:      	ldr	x2, [x19, #0x8]
     9ac:      	cmp	x0, x2
     9b0:      	b.lt	0x968 <_stogir.uses.build+0x700>
     9b4:      	ldr	x0, [x29, #0x28]
     9b8:      	ldr	x2, [x0, #0x8]
     9bc:      	ldr	x3, [x0, #0x10]
     9c0:      	add	x4, x2, x1
     9c4:      	cmp	x4, x3
     9c8:      	b.le	0xb0c <_stogir.uses.build+0x8a4>
     9cc:      	mov	x17, #0x3fffffffffffffff ; =4611686018427387903
     9d0:      	cmp	x3, x17
     9d4:      	b.gt	0x538 <_stogir.uses.build+0x2d0>
     9d8:      	lsl	x3, x3, #1
     9dc:      	b	0x53c <_stogir.uses.build+0x2d4>
     9e0:      	brk	#0
     9e4:      	b	0x9e0 <_stogir.uses.build+0x778>
     9e8:      	ldr	x0, [x29, #0x18]
     9ec:      	bl	0x9ec <_stogir.uses.build+0x784>
		00000000000009ec:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$free!__i64
     9f0:      	movz	x0, #0x0, lsl #48
     9f4:      	b	0xa18 <_stogir.uses.build+0x7b0>
     9f8:      	add	x1, x0, #0x8
     9fc:      	ldr	x2, [x29, #0x20]
     a00:      	add	x3, x2, x0
     a04:      	add	x0, x19, x0
     a08:      	ldr	x0, [x0]
     a0c:      	str	x0, [x3]
     a10:      	str	x2, [x29, #0x20]
     a14:      	mov	x0, x1
     a18:      	cmp	x0, #0x50
     a1c:      	b.lo	0x9f8 <_stogir.uses.build+0x790>
     a20:      	ldr	x2, [x29, #0x20]
     a24:      	movz	x0, #0x0, lsl #48
     a28:      	b	0xa50 <_stogir.uses.build+0x7e8>
     a2c:      	nop
     a30:      	add	x1, x0, #0x8
     a34:      	ldr	x3, [x29, #0x10]
     a38:      	add	x4, x3, x0
     a3c:      	add	x0, x2, x0
     a40:      	ldr	x0, [x0]
     a44:      	str	x0, [x4]
     a48:      	str	x3, [x29, #0x10]
     a4c:      	mov	x0, x1
     a50:      	cmp	x0, #0x50
     a54:      	b.lo	0xa30 <_stogir.uses.build+0x7c8>
     a58:      	sub	sp, x29, #0x0
     a5c:      	ldr	x19, [sp, #0x68]
     a60:      	ldr	x20, [sp, #0x70]
     a64:      	ldr	x21, [sp, #0x78]
     a68:      	ldr	x22, [sp, #0x80]
     a6c:      	ldr	x23, [sp, #0x88]
     a70:      	ldr	x24, [sp, #0x90]
     a74:      	ldr	x25, [sp, #0x98]
     a78:      	ldr	x26, [sp, #0xa0]
     a7c:      	ldr	x27, [sp, #0xa8]
     a80:      	ldr	x28, [sp, #0xb0]
     a84:      	ldr	x29, [sp]
     a88:      	ldr	x30, [sp, #0x8]
     a8c:      	add	sp, sp, #0xc0
     a90:      	ret
     a94:      	str	x8, [x29, #0x10]
     a98:      	mov	x28, x0
     a9c:      	b	0x45c <_stogir.uses.build+0x1f4>
     aa0:      	str	x25, [x29, #0x18]
     aa4:      	mov	x25, x1
     aa8:      	b	0x4e0 <_stogir.uses.build+0x278>
     aac:      	ldr	x14, [x29, #0x30]
     ab0:      	str	w0, [x29, #0x40]
     ab4:      	str	x4, [x29, #0x38]
     ab8:      	b	0x77c <_stogir.uses.build+0x514>
     abc:      	ldr	x14, [x29, #0x30]
     ac0:      	str	w0, [x29, #0x40]
     ac4:      	str	x4, [x29, #0x38]
     ac8:      	b	0x77c <_stogir.uses.build+0x514>
     acc:      	ldr	x14, [x29, #0x30]
     ad0:      	str	w0, [x29, #0x40]
     ad4:      	b	0x870 <_stogir.uses.build+0x608>
     ad8:      	ldr	x14, [x29, #0x30]
     adc:      	str	w0, [x29, #0x40]
     ae0:      	str	x4, [x29, #0x38]
     ae4:      	b	0x77c <_stogir.uses.build+0x514>
     ae8:      	ldr	x14, [x29, #0x30]
     aec:      	b	0x954 <_stogir.uses.build+0x6ec>
     af0:      	str	x20, [x29, #0x48]
     af4:      	str	x21, [x29, #0x50]
     af8:      	str	x22, [x29, #0x58]
     afc:      	str	x14, [x29, #0x30]
     b00:      	ldr	x21, [x29, #0x28]
     b04:      	str	x23, [x29, #0x60]
     b08:      	b	0x594 <_stogir.uses.build+0x32c>
     b0c:      	str	x20, [x29, #0x48]
     b10:      	mov	x20, x1
     b14:      	str	x21, [x29, #0x50]
     b18:      	str	x22, [x29, #0x58]
     b1c:      	str	x14, [x29, #0x30]
     b20:      	mov	x21, x0
     b24:      	str	x23, [x29, #0x60]
     b28:      	mov	x22, x2
     b2c:      	mov	x23, x4
     b30:      	b	0x574 <_stogir.uses.build+0x30c>
