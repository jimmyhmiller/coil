<_stogir.uses.build>:
     268:      	sub	sp, sp, #0xb0
     26c:      	str	x29, [sp]
     270:      	str	x30, [sp, #0x8]
     274:      	mov	x29, sp
     278:      	str	x19, [sp, #0x60]
     27c:      	str	x20, [sp, #0x68]
     280:      	str	x21, [sp, #0x70]
     284:      	str	x22, [sp, #0x78]
     288:      	str	x23, [sp, #0x80]
     28c:      	str	x24, [sp, #0x88]
     290:      	str	x25, [sp, #0x90]
     294:      	str	x26, [sp, #0x98]
     298:      	str	x27, [sp, #0xa0]
     29c:      	str	x28, [sp, #0xa8]
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
     2d8:      	sub	sp, sp, #0x50
     2dc:      	mov	x23, sp
     2e0:      	movz	x5, #0x0, lsl #48
     2e4:      	b	0x2fc <_stogir.uses.build+0x94>
     2e8:      	add	x6, x5, #0x8
     2ec:      	add	x5, x3, x5
     2f0:      	movz	x17, #0x0, lsl #48
     2f4:      	str	x17, [x5]
     2f8:      	mov	x5, x6
     2fc:      	cmp	x5, #0x50
     300:      	b.lo	0x2e8 <_stogir.uses.build+0x80>
     304:      	movz	x5, #0x0, lsl #48
     308:      	b	0x328 <_stogir.uses.build+0xc0>
     30c:      	nop
     310:      	add	x6, x5, #0x8
     314:      	add	x7, x2, x5
     318:      	add	x5, x3, x5
     31c:      	ldr	x5, [x5]
     320:      	str	x5, [x7]
     324:      	mov	x5, x6
     328:      	cmp	x5, #0x50
     32c:      	b.lo	0x310 <_stogir.uses.build+0xa8>
     330:      	add	x3, x2, #0x28
     334:      	ldr	x5, [x1]
     338:      	ldr	x6, [x1, #0x8]
     33c:      	movz	x17, #0x0, lsl #48
     340:      	str	x17, [x2]
     344:      	movz	x17, #0x0, lsl #48
     348:      	str	x17, [x2, #0x8]
     34c:      	movz	x17, #0x0, lsl #48
     350:      	str	x17, [x2, #0x10]
     354:      	str	x5, [x2, #0x18]
     358:      	str	x6, [x2, #0x20]
     35c:      	ldr	x5, [x1]
     360:      	ldr	x6, [x1, #0x8]
     364:      	movz	x17, #0x0, lsl #48
     368:      	str	x17, [x2, #0x28]
     36c:      	movz	x17, #0x0, lsl #48
     370:      	str	x17, [x3, #0x8]
     374:      	movz	x17, #0x0, lsl #48
     378:      	str	x17, [x3, #0x10]
     37c:      	str	x5, [x3, #0x18]
     380:      	str	x6, [x3, #0x20]
     384:      	movz	x3, #0x0, lsl #48
     388:      	b	0x3a8 <_stogir.uses.build+0x140>
     38c:      	nop
     390:      	add	x5, x3, #0x8
     394:      	add	x6, x4, x3
     398:      	add	x3, x2, x3
     39c:      	ldr	x3, [x3]
     3a0:      	str	x3, [x6]
     3a4:      	mov	x3, x5
     3a8:      	cmp	x3, #0x50
     3ac:      	b.lo	0x390 <_stogir.uses.build+0x128>
     3b0:      	movz	x2, #0x0, lsl #48
     3b4:      	b	0x3d0 <_stogir.uses.build+0x168>
     3b8:      	add	x3, x2, #0x8
     3bc:      	add	x5, x19, x2
     3c0:      	add	x2, x4, x2
     3c4:      	ldr	x2, [x2]
     3c8:      	str	x2, [x5]
     3cc:      	mov	x2, x3
     3d0:      	cmp	x2, #0x50
     3d4:      	b.lo	0x3b8 <_stogir.uses.build+0x150>
     3d8:      	ldr	x2, [x1]
     3dc:      	ldr	x1, [x1, #0x8]
     3e0:      	movz	x17, #0x0, lsl #48
     3e4:      	str	x17, [x20]
     3e8:      	movz	x17, #0x0, lsl #48
     3ec:      	str	x17, [x20, #0x8]
     3f0:      	movz	x17, #0x0, lsl #48
     3f4:      	str	x17, [x20, #0x10]
     3f8:      	str	x2, [x20, #0x18]
     3fc:      	str	x1, [x20, #0x20]
     400:      	ldr	x1, [x0, #0x8]
     404:      	orr	x24, x1, xzr
     408:      	ldr	x1, [x19, #0x8]
     40c:      	orr	x25, x1, xzr
     410:      	ldr	x1, [x19, #0x10]
     414:      	add	x26, x25, x24
     418:      	cmp	x26, x1
     41c:      	b.le	0xa6c <_stogir.uses.build+0x804>
     420:      	mov	x17, #0x3fffffffffffffff ; =4611686018427387903
     424:      	cmp	x1, x17
     428:      	b.gt	0x434 <_stogir.uses.build+0x1cc>
     42c:      	lsl	x1, x1, #1
     430:      	b	0x438 <_stogir.uses.build+0x1d0>
     434:      	mov	x1, x26
     438:      	cmp	x1, x26
     43c:      	b.gt	0x444 <_stogir.uses.build+0x1dc>
     440:      	mov	x1, x26
     444:      	mov	x27, x8
     448:      	mov	x28, x0
     44c:      	mov	x0, x19
     450:      	bl	0x450 <_stogir.uses.build+0x1e8>
		0000000000000450:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__stogir.uses.Range
     454:      	orr	x0, x20, xzr
     458:      	lsl	x1, x25, #4
     45c:      	lsl	x2, x24, #4
     460:      	ldr	x3, [x19]
     464:      	add	x1, x1, x3
     468:      	mov	x24, x0
     46c:      	mov	x0, x1
     470:      	movz	x1, #0x0, lsl #48
     474:      	bl	0x474 <_stogir.uses.build+0x20c>
		0000000000000474:  ARM64_RELOC_BRANCH26	_memset
     478:      	str	x26, [x19, #0x8]
     47c:      	ldr	x0, [x28, #0x8]
     480:      	orr	x25, x0, xzr
     484:      	ldr	x0, [x20, #0x8]
     488:      	orr	x26, x0, xzr
     48c:      	ldr	x0, [x20, #0x10]
     490:      	add	x1, x26, x25
     494:      	cmp	x1, x0
     498:      	b.le	0xa78 <_stogir.uses.build+0x810>
     49c:      	mov	x17, #0x3fffffffffffffff ; =4611686018427387903
     4a0:      	cmp	x0, x17
     4a4:      	b.gt	0x4b0 <_stogir.uses.build+0x248>
     4a8:      	lsl	x0, x0, #1
     4ac:      	b	0x4b4 <_stogir.uses.build+0x24c>
     4b0:      	mov	x0, x1
     4b4:      	cmp	x0, x1
     4b8:      	b.gt	0x4c0 <_stogir.uses.build+0x258>
     4bc:      	mov	x0, x1
     4c0:      	str	x24, [x29, #0x10]
     4c4:      	fmov	d31, x0
     4c8:      	mov	x0, x24
     4cc:      	mov	x24, x1
     4d0:      	fmov	x1, d31
     4d4:      	bl	0x4d4 <_stogir.uses.build+0x26c>
		00000000000004d4:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__i64
     4d8:      	add	x0, x19, #0x28
     4dc:      	lsl	x1, x26, #3
     4e0:      	lsl	x2, x25, #3
     4e4:      	adrp	x16, 0x0 <_gap_uses_graph>
		00000000000004e4:  ARM64_RELOC_PAGE21	l_stogir.117
     4e8:      	ldr	x16, [x16]
		00000000000004e8:  ARM64_RELOC_PAGEOFF12	l_stogir.117
     4ec:      	orr	x25, x16, xzr
     4f0:      	add	x26, x28, #0x78
     4f4:      	add	x3, x28, #0x28
     4f8:      	add	x4, x28, #0x50
     4fc:      	ldr	x5, [x20]
     500:      	add	x1, x1, x5
     504:      	str	x0, [x29, #0x28]
     508:      	mov	x0, x1
     50c:      	str	x27, [x29, #0x18]
     510:      	mov	x27, x4
     514:      	str	x23, [x29, #0x20]
     518:      	mov	x23, x3
     51c:      	movz	x1, #0x0, lsl #48
     520:      	bl	0x520 <_stogir.uses.build+0x2b8>
		0000000000000520:  ARM64_RELOC_BRANCH26	_memset
     524:      	str	x24, [x20, #0x8]
     528:      	movz	x24, #0x0, lsl #48
     52c:      	b	0x5a4 <_stogir.uses.build+0x33c>
     530:      	mov	x3, x4
     534:      	cmp	x3, x4
     538:      	b.gt	0x540 <_stogir.uses.build+0x2d8>
     53c:      	mov	x3, x4
     540:      	str	x20, [x29, #0x40]
     544:      	mov	x20, x1
     548:      	mov	x1, x3
     54c:      	str	x21, [x29, #0x48]
     550:      	mov	x21, x0
     554:      	str	x22, [x29, #0x50]
     558:      	mov	x22, x2
     55c:      	str	x23, [x29, #0x58]
     560:      	mov	x23, x4
     564:      	bl	0x564 <_stogir.uses.build+0x2fc>
		0000000000000564:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__stogir.uses.Use
     568:      	lsl	x0, x22, #3
     56c:      	lsl	x1, x20, #3
     570:      	ldr	x2, [x19, #0x28]
     574:      	add	x0, x0, x2
     578:      	mov	x2, x1
     57c:      	movz	x1, #0x0, lsl #48
     580:      	bl	0x580 <_stogir.uses.build+0x318>
		0000000000000580:  ARM64_RELOC_BRANCH26	_memset
     584:      	str	x23, [x21, #0x8]
     588:      	add	x0, x24, #0x1
     58c:      	ldr	x20, [x29, #0x40]
     590:      	ldr	x22, [x29, #0x50]
     594:      	str	x21, [x29, #0x28]
     598:      	ldr	x21, [x29, #0x48]
     59c:      	ldr	x23, [x29, #0x58]
     5a0:      	mov	x24, x0
     5a4:      	cmp	x24, #0x2
     5a8:      	b.ge	0x9c0 <_stogir.uses.build+0x758>
     5ac:      	cmp	x24, #0x0
     5b0:      	cset	w0, eq
     5b4:      	mov	x1, #0x1                ; =1
     5b8:      	b	0x89c <_stogir.uses.build+0x634>
     5bc:      	movz	x2, #0x0, lsl #48
     5c0:      	b	0x5d0 <_stogir.uses.build+0x368>
     5c4:      	movz	x15, #0x0, lsl #48
     5c8:      	b	0x5d8 <_stogir.uses.build+0x370>
     5cc:      	movz	x2, #0x0, lsl #48
     5d0:      	b	0x5e8 <_stogir.uses.build+0x380>
     5d4:      	movz	x15, #0x0, lsl #48
     5d8:      	str	x2, [x29, #0x30]
     5dc:      	mov	x2, x15
     5e0:      	b	0x5e8 <_stogir.uses.build+0x380>
     5e4:      	movz	x2, #0x0, lsl #48
     5e8:      	cmp	x2, #0x0
     5ec:      	b.eq	0x7b0 <_stogir.uses.build+0x548>
     5f0:      	cmp	x14, #0x1
     5f4:      	b.lt	0x664 <_stogir.uses.build+0x3fc>
     5f8:      	ldr	x2, [x28, #0x78]
     5fc:      	add	x2, x7, x2
     600:      	ldr	w2, [x2]
     604:      	sxtw	x2, w2
     608:      	cmp	x14, x2
     60c:      	b.gt	0x664 <_stogir.uses.build+0x3fc>
     610:      	ldr	x2, [x28]
     614:      	asr	x16, x14, #63
     618:      	lsr	x16, x16, #62
     61c:      	add	x15, x14, x16
     620:      	asr	x15, x15, #2
     624:      	asr	x16, x14, #63
     628:      	lsr	x16, x16, #62
     62c:      	add	x14, x14, x16
     630:      	and	x14, x14, #0x3
     634:      	sub	x14, x14, x16
     638:      	add	x15, x15, x4
     63c:      	lsl	x14, x14, #2
     640:      	lsl	x15, x15, #4
     644:      	add	x2, x15, x2
     648:      	add	x2, x14, x2
     64c:      	ldr	w2, [x2]
     650:      	sxtw	x2, w2
     654:      	and	x2, x2, #0xffffffff
     658:      	mov	x14, x2
     65c:      	mov	x2, #0x1                ; =1
     660:      	b	0x66c <_stogir.uses.build+0x404>
     664:      	movz	x2, #0x0, lsl #48
     668:      	movz	x14, #0x0, lsl #48
     66c:      	b	0x7b8 <_stogir.uses.build+0x550>
     670:      	movz	x2, #0x0, lsl #48
     674:      	sxtw	x3, w3
     678:      	lsr	w4, w1, #0
     67c:      	lsr	w5, w4, #0
     680:      	sxtw	x4, w4
     684:      	lsr	w2, w2, #0
     688:      	cmp	x4, #0x0
     68c:      	cset	w6, le
     690:      	lsl	x7, x4, #2
     694:      	cmp	x4, #0x0
     698:      	cset	w8, gt
     69c:      	cmp	x4, #0x0
     6a0:      	cset	w9, lt
     6a4:      	movz	x16, #0x0, lsl #48
     6a8:      	sub	x10, x16, x4
     6ac:      	sub	x11, x10, #0x1
     6b0:      	lsl	x11, x11, #2
     6b4:      	mov	x12, #0x1               ; =1
     6b8:      	b	0x71c <_stogir.uses.build+0x4b4>
     6bc:      	lsl	x4, x2, #3
     6c0:      	lsl	x2, x2, #3
     6c4:      	ldr	x14, [x20]
     6c8:      	add	x4, x4, x14
     6cc:      	ldr	x4, [x4]
     6d0:      	movz	x17, #0x0, lsl #48
     6d4:      	str	x17, [x22]
     6d8:      	add	x14, x4, #0x1
     6dc:      	lsl	x4, x4, #3
     6e0:      	str	w5, [x22]
     6e4:      	str	w13, [x22, #0x4]
     6e8:      	ldr	x13, [x22]
     6ec:      	ldr	x15, [x19, #0x28]
     6f0:      	add	x4, x4, x15
     6f4:      	str	x13, [x4]
     6f8:      	ldr	x4, [x20]
     6fc:      	add	x2, x2, x4
     700:      	str	x14, [x2]
     704:      	add	x2, x12, #0x1
     708:      	lsr	w2, w2, #0
     70c:      	sxtw	x2, w2
     710:      	ldr	x4, [x29, #0x38]
     714:      	mov	x12, x2
     718:      	ldr	x2, [x29, #0x30]
     71c:      	cmp	x12, x3
     720:      	b.gt	0x884 <_stogir.uses.build+0x61c>
     724:      	lsr	w13, w12, #0
     728:      	sxtw	x14, w13
     72c:      	cmp	x14, #0x0
     730:      	b.le	0x770 <_stogir.uses.build+0x508>
     734:      	cmp	x14, #0x4
     738:      	b.le	0x744 <_stogir.uses.build+0x4dc>
     73c:      	mov	x15, #0x4               ; =4
     740:      	b	0x750 <_stogir.uses.build+0x4e8>
     744:      	sub	x15, x14, #0x1
     748:      	lsr	w15, w15, #0
     74c:      	sxtw	x15, w15
     750:      	lsl	x15, x15, #2
     754:      	lsr	w15, w15, #0
     758:      	ubfx	x15, x15, #0, #32
     75c:      	lsr	x15, x2, x15
     760:      	lsr	w15, w15, #0
     764:      	and	x15, x15, #0xf
     768:      	lsr	w15, w15, #0
     76c:      	b	0x774 <_stogir.uses.build+0x50c>
     770:      	movz	x15, #0x0, lsl #48
     774:      	lsr	w15, w15, #0
     778:      	cmp	x15, #0xf
     77c:      	b.hs	0xa84 <_stogir.uses.build+0x81c>
     780:      	mov	x16, #0x1               ; =1
     784:      	lsl	x15, x16, x15
     788:      	lsr	w15, w15, #0
     78c:      	mov	x17, #0x5e1c            ; =24092
     790:      	and	x15, x15, x17
     794:      	lsr	w15, w15, #0
     798:      	cmp	x15, #0x0
     79c:      	b.eq	0xa90 <_stogir.uses.build+0x828>
     7a0:      	uxtb	w16, w6
     7a4:      	cmp	w16, wzr
     7a8:      	b.eq	0x840 <_stogir.uses.build+0x5d8>
     7ac:      	str	x2, [x29, #0x30]
     7b0:      	movz	x2, #0x0, lsl #48
     7b4:      	movz	x14, #0x0, lsl #48
     7b8:      	str	x2, [x21]
     7bc:      	lsr	w2, w2, #0
     7c0:      	str	x14, [x21, #0x8]
     7c4:      	lsr	x16, x2, #0
     7c8:      	cmp	x16, #0x1
     7cc:      	b.eq	0x7ec <_stogir.uses.build+0x584>
     7d0:      	b.lo	0x7d8 <_stogir.uses.build+0x570>
     7d4:      	b	0x7f0 <_stogir.uses.build+0x588>
     7d8:      	cmp	x16, #0x0
     7dc:      	b.eq	0x7e4 <_stogir.uses.build+0x57c>
     7e0:      	b	0x7f0 <_stogir.uses.build+0x588>
     7e4:      	str	x4, [x29, #0x38]
     7e8:      	b	0x704 <_stogir.uses.build+0x49c>
     7ec:      	b	0x7f4 <_stogir.uses.build+0x58c>
     7f0:      	b	0x9b8 <_stogir.uses.build+0x750>
     7f4:      	ldr	w2, [x21, #0x8]
     7f8:      	sxtw	x2, w2
     7fc:      	cmp	x2, #0x0
     800:      	b.le	0xa9c <_stogir.uses.build+0x834>
     804:      	lsl	x14, x2, #4
     808:      	ldr	x15, [x19]
     80c:      	add	x14, x14, x15
     810:      	str	x4, [x29, #0x38]
     814:      	ldr	x4, [x14]
     818:      	ldr	x14, [x14, #0x8]
     81c:      	uxtb	w16, w0
     820:      	cmp	w16, wzr
     824:      	b.eq	0x6bc <_stogir.uses.build+0x454>
     828:      	add	x13, x14, #0x1
     82c:      	lsl	x2, x2, #4
     830:      	add	x2, x2, x15
     834:      	str	x4, [x2]
     838:      	str	x13, [x2, #0x8]
     83c:      	b	0x704 <_stogir.uses.build+0x49c>
     840:      	uxtb	w16, w8
     844:      	cmp	w16, wzr
     848:      	b.eq	0x8e4 <_stogir.uses.build+0x67c>
     84c:      	ldr	x15, [x28, #0x8]
     850:      	cmp	x4, x15
     854:      	b.ge	0x5d4 <_stogir.uses.build+0x36c>
     858:      	ldr	x15, [x26, #0x8]
     85c:      	cmp	x4, x15
     860:      	b.ge	0x5c4 <_stogir.uses.build+0x35c>
     864:      	ldr	x15, [x28, #0x78]
     868:      	add	x15, x7, x15
     86c:      	ldr	w15, [x15]
     870:      	sxtw	x15, w15
     874:      	cmp	x15, #0x0
     878:      	cset	w15, ge
     87c:      	ubfx	x15, x15, #0, #8
     880:      	b	0x5c8 <_stogir.uses.build+0x360>
     884:      	add	x2, x3, #0x4
     888:      	asr	x16, x2, #63
     88c:      	lsr	x16, x16, #62
     890:      	add	x2, x2, x16
     894:      	asr	x2, x2, #2
     898:      	add	x1, x2, x1
     89c:      	ldr	x2, [x28, #0x8]
     8a0:      	cmp	x1, x2
     8a4:      	b.ge	0x92c <_stogir.uses.build+0x6c4>
     8a8:      	lsl	x2, x1, #4
     8ac:      	lsl	x3, x1, #2
     8b0:      	ldr	x4, [x28]
     8b4:      	add	x2, x2, x4
     8b8:      	ldr	x2, [x2]
     8bc:      	ldr	x4, [x28, #0x78]
     8c0:      	uxtb	w2, w2
     8c4:      	add	x3, x3, x4
     8c8:      	ldr	w3, [x3]
     8cc:      	cmp	x2, #0x83
     8d0:      	b.ge	0x670 <_stogir.uses.build+0x408>
     8d4:      	lsl	x2, x2, #2
     8d8:      	add	x2, x2, x25
     8dc:      	ldr	w2, [x2]
     8e0:      	b	0x674 <_stogir.uses.build+0x40c>
     8e4:      	uxtb	w16, w9
     8e8:      	cmp	w16, wzr
     8ec:      	b.eq	0xaa4 <_stogir.uses.build+0x83c>
     8f0:      	ldr	x15, [x23, #0x8]
     8f4:      	str	x2, [x29, #0x30]
     8f8:      	ldr	x2, [x27, #0x8]
     8fc:      	cmp	x15, x2
     900:      	b.ne	0x5cc <_stogir.uses.build+0x364>
     904:      	cmp	x10, x15
     908:      	b.gt	0x5bc <_stogir.uses.build+0x354>
     90c:      	ldr	x2, [x28, #0x50]
     910:      	add	x2, x11, x2
     914:      	ldr	w2, [x2]
     918:      	sxtw	x2, w2
     91c:      	cmp	x2, #0x0
     920:      	cset	w2, gt
     924:      	ubfx	x2, x2, #0, #8
     928:      	b	0x5c0 <_stogir.uses.build+0x358>
     92c:      	cmp	x24, #0x0
     930:      	b.ne	0xaac <_stogir.uses.build+0x844>
     934:      	movz	x0, #0x0, lsl #48
     938:      	movz	x1, #0x0, lsl #48
     93c:      	b	0x980 <_stogir.uses.build+0x718>
     940:      	lsl	x2, x0, #4
     944:      	add	x3, x0, #0x1
     948:      	lsl	x4, x0, #4
     94c:      	lsl	x0, x0, #3
     950:      	ldr	x5, [x19]
     954:      	add	x2, x2, x5
     958:      	add	x4, x4, x5
     95c:      	ldr	x2, [x2, #0x8]
     960:      	add	x5, x2, x1
     964:      	str	x1, [x4]
     968:      	str	x2, [x4, #0x8]
     96c:      	ldr	x2, [x20]
     970:      	add	x0, x0, x2
     974:      	str	x1, [x0]
     978:      	mov	x0, x3
     97c:      	mov	x1, x5
     980:      	ldr	x2, [x19, #0x8]
     984:      	cmp	x0, x2
     988:      	b.lt	0x940 <_stogir.uses.build+0x6d8>
     98c:      	ldr	x0, [x29, #0x28]
     990:      	ldr	x2, [x0, #0x8]
     994:      	ldr	x3, [x0, #0x10]
     998:      	add	x4, x2, x1
     99c:      	cmp	x4, x3
     9a0:      	b.le	0xac4 <_stogir.uses.build+0x85c>
     9a4:      	mov	x17, #0x3fffffffffffffff ; =4611686018427387903
     9a8:      	cmp	x3, x17
     9ac:      	b.gt	0x530 <_stogir.uses.build+0x2c8>
     9b0:      	lsl	x3, x3, #1
     9b4:      	b	0x534 <_stogir.uses.build+0x2cc>
     9b8:      	brk	#0
     9bc:      	b	0x9b8 <_stogir.uses.build+0x750>
     9c0:      	ldr	x0, [x29, #0x10]
     9c4:      	bl	0x9c4 <_stogir.uses.build+0x75c>
		00000000000009c4:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$free!__i64
     9c8:      	movz	x0, #0x0, lsl #48
     9cc:      	b	0x9f0 <_stogir.uses.build+0x788>
     9d0:      	add	x1, x0, #0x8
     9d4:      	ldr	x2, [x29, #0x20]
     9d8:      	add	x3, x2, x0
     9dc:      	add	x0, x19, x0
     9e0:      	ldr	x0, [x0]
     9e4:      	str	x0, [x3]
     9e8:      	str	x2, [x29, #0x20]
     9ec:      	mov	x0, x1
     9f0:      	cmp	x0, #0x50
     9f4:      	b.lo	0x9d0 <_stogir.uses.build+0x768>
     9f8:      	ldr	x2, [x29, #0x20]
     9fc:      	movz	x0, #0x0, lsl #48
     a00:      	b	0xa28 <_stogir.uses.build+0x7c0>
     a04:      	nop
     a08:      	add	x1, x0, #0x8
     a0c:      	ldr	x3, [x29, #0x18]
     a10:      	add	x4, x3, x0
     a14:      	add	x0, x2, x0
     a18:      	ldr	x0, [x0]
     a1c:      	str	x0, [x4]
     a20:      	str	x3, [x29, #0x18]
     a24:      	mov	x0, x1
     a28:      	cmp	x0, #0x50
     a2c:      	b.lo	0xa08 <_stogir.uses.build+0x7a0>
     a30:      	sub	sp, x29, #0x0
     a34:      	ldr	x19, [sp, #0x60]
     a38:      	ldr	x20, [sp, #0x68]
     a3c:      	ldr	x21, [sp, #0x70]
     a40:      	ldr	x22, [sp, #0x78]
     a44:      	ldr	x23, [sp, #0x80]
     a48:      	ldr	x24, [sp, #0x88]
     a4c:      	ldr	x25, [sp, #0x90]
     a50:      	ldr	x26, [sp, #0x98]
     a54:      	ldr	x27, [sp, #0xa0]
     a58:      	ldr	x28, [sp, #0xa8]
     a5c:      	ldr	x29, [sp]
     a60:      	ldr	x30, [sp, #0x8]
     a64:      	add	sp, sp, #0xb0
     a68:      	ret
     a6c:      	mov	x27, x8
     a70:      	mov	x28, x0
     a74:      	b	0x454 <_stogir.uses.build+0x1ec>
     a78:      	str	x24, [x29, #0x10]
     a7c:      	mov	x24, x1
     a80:      	b	0x4d8 <_stogir.uses.build+0x270>
     a84:      	str	x2, [x29, #0x30]
     a88:      	str	x4, [x29, #0x38]
     a8c:      	b	0x704 <_stogir.uses.build+0x49c>
     a90:      	str	x2, [x29, #0x30]
     a94:      	str	x4, [x29, #0x38]
     a98:      	b	0x704 <_stogir.uses.build+0x49c>
     a9c:      	str	x4, [x29, #0x38]
     aa0:      	b	0x704 <_stogir.uses.build+0x49c>
     aa4:      	str	x2, [x29, #0x30]
     aa8:      	b	0x5e4 <_stogir.uses.build+0x37c>
     aac:      	str	x20, [x29, #0x40]
     ab0:      	str	x21, [x29, #0x48]
     ab4:      	str	x22, [x29, #0x50]
     ab8:      	ldr	x21, [x29, #0x28]
     abc:      	str	x23, [x29, #0x58]
     ac0:      	b	0x588 <_stogir.uses.build+0x320>
     ac4:      	str	x20, [x29, #0x40]
     ac8:      	mov	x20, x1
     acc:      	str	x21, [x29, #0x48]
     ad0:      	str	x22, [x29, #0x50]
     ad4:      	mov	x21, x0
     ad8:      	str	x23, [x29, #0x58]
     adc:      	mov	x22, x2
     ae0:      	mov	x23, x4
     ae4:      	b	0x568 <_stogir.uses.build+0x300>
