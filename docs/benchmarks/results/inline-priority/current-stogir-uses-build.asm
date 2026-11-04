<_stogir.uses.build>:
     268:      	sub	sp, sp, #0xb0
     26c:      	str	x29, [sp]
     270:      	str	x30, [sp, #0x8]
     274:      	mov	x29, sp
     278:      	str	x19, [sp, #0x58]
     27c:      	str	x20, [sp, #0x60]
     280:      	str	x21, [sp, #0x68]
     284:      	str	x22, [sp, #0x70]
     288:      	str	x23, [sp, #0x78]
     28c:      	str	x24, [sp, #0x80]
     290:      	str	x25, [sp, #0x88]
     294:      	str	x26, [sp, #0x90]
     298:      	str	x27, [sp, #0x98]
     29c:      	str	x28, [sp, #0xa0]
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
     41c:      	b.le	0xa74 <_stogir.uses.build+0x80c>
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
     454:      	add	x0, x19, #0x28
     458:      	add	x1, x28, #0x78
     45c:      	add	x2, x28, #0x28
     460:      	add	x3, x28, #0x50
     464:      	adrp	x16, 0x0 <_gap_uses_graph>
		0000000000000464:  ARM64_RELOC_PAGE21	l_stogir.117
     468:      	ldr	x16, [x16]
		0000000000000468:  ARM64_RELOC_PAGEOFF12	l_stogir.117
     46c:      	orr	x4, x16, xzr
     470:      	lsl	x5, x25, #4
     474:      	lsl	x6, x24, #4
     478:      	ldr	x7, [x19]
     47c:      	add	x5, x5, x7
     480:      	str	x0, [x29, #0x20]
     484:      	mov	x0, x5
     488:      	mov	x25, x1
     48c:      	mov	x24, x4
     490:      	str	x27, [x29, #0x10]
     494:      	mov	x27, x2
     498:      	mov	x2, x6
     49c:      	str	x23, [x29, #0x18]
     4a0:      	mov	x23, x3
     4a4:      	movz	x1, #0x0, lsl #48
     4a8:      	bl	0x4a8 <_stogir.uses.build+0x240>
		00000000000004a8:  ARM64_RELOC_BRANCH26	_memset
     4ac:      	str	x26, [x19, #0x8]
     4b0:      	ldr	x0, [x28, #0x8]
     4b4:      	mov	x1, x0
     4b8:      	mov	x0, x20
     4bc:      	bl	0x4bc <_stogir.uses.build+0x254>
		00000000000004bc:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$extend-zeroed!__i64
     4c0:      	movz	x26, #0x0, lsl #48
     4c4:      	b	0x53c <_stogir.uses.build+0x2d4>
     4c8:      	mov	x3, x4
     4cc:      	cmp	x3, x4
     4d0:      	b.gt	0x4d8 <_stogir.uses.build+0x270>
     4d4:      	mov	x3, x4
     4d8:      	str	x21, [x29, #0x38]
     4dc:      	mov	x21, x1
     4e0:      	mov	x1, x3
     4e4:      	str	x22, [x29, #0x40]
     4e8:      	mov	x22, x0
     4ec:      	str	x23, [x29, #0x48]
     4f0:      	mov	x23, x2
     4f4:      	str	x24, [x29, #0x50]
     4f8:      	mov	x24, x4
     4fc:      	bl	0x4fc <_stogir.uses.build+0x294>
		00000000000004fc:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__stogir.uses.Use
     500:      	lsl	x0, x23, #3
     504:      	lsl	x1, x21, #3
     508:      	ldr	x2, [x19, #0x28]
     50c:      	add	x0, x0, x2
     510:      	mov	x2, x1
     514:      	movz	x1, #0x0, lsl #48
     518:      	bl	0x518 <_stogir.uses.build+0x2b0>
		0000000000000518:  ARM64_RELOC_BRANCH26	_memset
     51c:      	str	x24, [x22, #0x8]
     520:      	add	x0, x26, #0x1
     524:      	ldr	x21, [x29, #0x38]
     528:      	str	x22, [x29, #0x20]
     52c:      	ldr	x22, [x29, #0x40]
     530:      	ldr	x23, [x29, #0x48]
     534:      	ldr	x24, [x29, #0x50]
     538:      	mov	x26, x0
     53c:      	cmp	x26, #0x2
     540:      	b.ge	0x958 <_stogir.uses.build+0x6f0>
     544:      	cmp	x26, #0x0
     548:      	cset	w0, eq
     54c:      	mov	x1, #0x1                ; =1
     550:      	b	0x834 <_stogir.uses.build+0x5cc>
     554:      	movz	x2, #0x0, lsl #48
     558:      	b	0x568 <_stogir.uses.build+0x300>
     55c:      	movz	x15, #0x0, lsl #48
     560:      	b	0x570 <_stogir.uses.build+0x308>
     564:      	movz	x2, #0x0, lsl #48
     568:      	b	0x580 <_stogir.uses.build+0x318>
     56c:      	movz	x15, #0x0, lsl #48
     570:      	str	x2, [x29, #0x28]
     574:      	mov	x2, x15
     578:      	b	0x580 <_stogir.uses.build+0x318>
     57c:      	movz	x2, #0x0, lsl #48
     580:      	cmp	x2, #0x0
     584:      	b.eq	0x748 <_stogir.uses.build+0x4e0>
     588:      	cmp	x14, #0x1
     58c:      	b.lt	0x5fc <_stogir.uses.build+0x394>
     590:      	ldr	x2, [x28, #0x78]
     594:      	add	x2, x7, x2
     598:      	ldr	w2, [x2]
     59c:      	sxtw	x2, w2
     5a0:      	cmp	x14, x2
     5a4:      	b.gt	0x5fc <_stogir.uses.build+0x394>
     5a8:      	ldr	x2, [x28]
     5ac:      	asr	x16, x14, #63
     5b0:      	lsr	x16, x16, #62
     5b4:      	add	x15, x14, x16
     5b8:      	asr	x15, x15, #2
     5bc:      	asr	x16, x14, #63
     5c0:      	lsr	x16, x16, #62
     5c4:      	add	x14, x14, x16
     5c8:      	and	x14, x14, #0x3
     5cc:      	sub	x14, x14, x16
     5d0:      	add	x15, x15, x4
     5d4:      	lsl	x14, x14, #2
     5d8:      	lsl	x15, x15, #4
     5dc:      	add	x2, x15, x2
     5e0:      	add	x2, x14, x2
     5e4:      	ldr	w2, [x2]
     5e8:      	sxtw	x2, w2
     5ec:      	and	x2, x2, #0xffffffff
     5f0:      	mov	x14, x2
     5f4:      	mov	x2, #0x1                ; =1
     5f8:      	b	0x604 <_stogir.uses.build+0x39c>
     5fc:      	movz	x2, #0x0, lsl #48
     600:      	movz	x14, #0x0, lsl #48
     604:      	b	0x750 <_stogir.uses.build+0x4e8>
     608:      	movz	x2, #0x0, lsl #48
     60c:      	sxtw	x3, w3
     610:      	lsr	w4, w1, #0
     614:      	lsr	w5, w4, #0
     618:      	sxtw	x4, w4
     61c:      	lsr	w2, w2, #0
     620:      	cmp	x4, #0x0
     624:      	cset	w6, le
     628:      	lsl	x7, x4, #2
     62c:      	cmp	x4, #0x0
     630:      	cset	w8, gt
     634:      	cmp	x4, #0x0
     638:      	cset	w9, lt
     63c:      	movz	x16, #0x0, lsl #48
     640:      	sub	x10, x16, x4
     644:      	sub	x11, x10, #0x1
     648:      	lsl	x11, x11, #2
     64c:      	mov	x12, #0x1               ; =1
     650:      	b	0x6b4 <_stogir.uses.build+0x44c>
     654:      	lsl	x4, x2, #3
     658:      	lsl	x2, x2, #3
     65c:      	ldr	x14, [x20]
     660:      	add	x4, x4, x14
     664:      	ldr	x4, [x4]
     668:      	movz	x17, #0x0, lsl #48
     66c:      	str	x17, [x22]
     670:      	add	x14, x4, #0x1
     674:      	lsl	x4, x4, #3
     678:      	str	w5, [x22]
     67c:      	str	w13, [x22, #0x4]
     680:      	ldr	x13, [x22]
     684:      	ldr	x15, [x19, #0x28]
     688:      	add	x4, x4, x15
     68c:      	str	x13, [x4]
     690:      	ldr	x4, [x20]
     694:      	add	x2, x2, x4
     698:      	str	x14, [x2]
     69c:      	add	x2, x12, #0x1
     6a0:      	lsr	w2, w2, #0
     6a4:      	sxtw	x2, w2
     6a8:      	ldr	x4, [x29, #0x30]
     6ac:      	mov	x12, x2
     6b0:      	ldr	x2, [x29, #0x28]
     6b4:      	cmp	x12, x3
     6b8:      	b.gt	0x81c <_stogir.uses.build+0x5b4>
     6bc:      	lsr	w13, w12, #0
     6c0:      	sxtw	x14, w13
     6c4:      	cmp	x14, #0x0
     6c8:      	b.le	0x708 <_stogir.uses.build+0x4a0>
     6cc:      	cmp	x14, #0x4
     6d0:      	b.le	0x6dc <_stogir.uses.build+0x474>
     6d4:      	mov	x15, #0x4               ; =4
     6d8:      	b	0x6e8 <_stogir.uses.build+0x480>
     6dc:      	sub	x15, x14, #0x1
     6e0:      	lsr	w15, w15, #0
     6e4:      	sxtw	x15, w15
     6e8:      	lsl	x15, x15, #2
     6ec:      	lsr	w15, w15, #0
     6f0:      	ubfx	x15, x15, #0, #32
     6f4:      	lsr	x15, x2, x15
     6f8:      	lsr	w15, w15, #0
     6fc:      	and	x15, x15, #0xf
     700:      	lsr	w15, w15, #0
     704:      	b	0x70c <_stogir.uses.build+0x4a4>
     708:      	movz	x15, #0x0, lsl #48
     70c:      	lsr	w15, w15, #0
     710:      	cmp	x15, #0xf
     714:      	b.hs	0xa80 <_stogir.uses.build+0x818>
     718:      	mov	x16, #0x1               ; =1
     71c:      	lsl	x15, x16, x15
     720:      	lsr	w15, w15, #0
     724:      	mov	x17, #0x5e1c            ; =24092
     728:      	and	x15, x15, x17
     72c:      	lsr	w15, w15, #0
     730:      	cmp	x15, #0x0
     734:      	b.eq	0xa8c <_stogir.uses.build+0x824>
     738:      	uxtb	w16, w6
     73c:      	cmp	w16, wzr
     740:      	b.eq	0x7d8 <_stogir.uses.build+0x570>
     744:      	str	x2, [x29, #0x28]
     748:      	movz	x2, #0x0, lsl #48
     74c:      	movz	x14, #0x0, lsl #48
     750:      	str	x2, [x21]
     754:      	lsr	w2, w2, #0
     758:      	str	x14, [x21, #0x8]
     75c:      	lsr	x16, x2, #0
     760:      	cmp	x16, #0x1
     764:      	b.eq	0x784 <_stogir.uses.build+0x51c>
     768:      	b.lo	0x770 <_stogir.uses.build+0x508>
     76c:      	b	0x788 <_stogir.uses.build+0x520>
     770:      	cmp	x16, #0x0
     774:      	b.eq	0x77c <_stogir.uses.build+0x514>
     778:      	b	0x788 <_stogir.uses.build+0x520>
     77c:      	str	x4, [x29, #0x30]
     780:      	b	0x69c <_stogir.uses.build+0x434>
     784:      	b	0x78c <_stogir.uses.build+0x524>
     788:      	b	0x950 <_stogir.uses.build+0x6e8>
     78c:      	ldr	w2, [x21, #0x8]
     790:      	sxtw	x2, w2
     794:      	cmp	x2, #0x0
     798:      	b.le	0xa98 <_stogir.uses.build+0x830>
     79c:      	lsl	x14, x2, #4
     7a0:      	ldr	x15, [x19]
     7a4:      	add	x14, x14, x15
     7a8:      	str	x4, [x29, #0x30]
     7ac:      	ldr	x4, [x14]
     7b0:      	ldr	x14, [x14, #0x8]
     7b4:      	uxtb	w16, w0
     7b8:      	cmp	w16, wzr
     7bc:      	b.eq	0x654 <_stogir.uses.build+0x3ec>
     7c0:      	add	x13, x14, #0x1
     7c4:      	lsl	x2, x2, #4
     7c8:      	add	x2, x2, x15
     7cc:      	str	x4, [x2]
     7d0:      	str	x13, [x2, #0x8]
     7d4:      	b	0x69c <_stogir.uses.build+0x434>
     7d8:      	uxtb	w16, w8
     7dc:      	cmp	w16, wzr
     7e0:      	b.eq	0x87c <_stogir.uses.build+0x614>
     7e4:      	ldr	x15, [x28, #0x8]
     7e8:      	cmp	x4, x15
     7ec:      	b.ge	0x56c <_stogir.uses.build+0x304>
     7f0:      	ldr	x15, [x25, #0x8]
     7f4:      	cmp	x4, x15
     7f8:      	b.ge	0x55c <_stogir.uses.build+0x2f4>
     7fc:      	ldr	x15, [x28, #0x78]
     800:      	add	x15, x7, x15
     804:      	ldr	w15, [x15]
     808:      	sxtw	x15, w15
     80c:      	cmp	x15, #0x0
     810:      	cset	w15, ge
     814:      	ubfx	x15, x15, #0, #8
     818:      	b	0x560 <_stogir.uses.build+0x2f8>
     81c:      	add	x2, x3, #0x4
     820:      	asr	x16, x2, #63
     824:      	lsr	x16, x16, #62
     828:      	add	x2, x2, x16
     82c:      	asr	x2, x2, #2
     830:      	add	x1, x2, x1
     834:      	ldr	x2, [x28, #0x8]
     838:      	cmp	x1, x2
     83c:      	b.ge	0x8c4 <_stogir.uses.build+0x65c>
     840:      	lsl	x2, x1, #4
     844:      	lsl	x3, x1, #2
     848:      	ldr	x4, [x28]
     84c:      	add	x2, x2, x4
     850:      	ldr	x2, [x2]
     854:      	ldr	x4, [x28, #0x78]
     858:      	uxtb	w2, w2
     85c:      	add	x3, x3, x4
     860:      	ldr	w3, [x3]
     864:      	cmp	x2, #0x83
     868:      	b.ge	0x608 <_stogir.uses.build+0x3a0>
     86c:      	lsl	x2, x2, #2
     870:      	add	x2, x2, x24
     874:      	ldr	w2, [x2]
     878:      	b	0x60c <_stogir.uses.build+0x3a4>
     87c:      	uxtb	w16, w9
     880:      	cmp	w16, wzr
     884:      	b.eq	0xaa0 <_stogir.uses.build+0x838>
     888:      	ldr	x15, [x27, #0x8]
     88c:      	str	x2, [x29, #0x28]
     890:      	ldr	x2, [x23, #0x8]
     894:      	cmp	x15, x2
     898:      	b.ne	0x564 <_stogir.uses.build+0x2fc>
     89c:      	cmp	x10, x15
     8a0:      	b.gt	0x554 <_stogir.uses.build+0x2ec>
     8a4:      	ldr	x2, [x28, #0x50]
     8a8:      	add	x2, x11, x2
     8ac:      	ldr	w2, [x2]
     8b0:      	sxtw	x2, w2
     8b4:      	cmp	x2, #0x0
     8b8:      	cset	w2, gt
     8bc:      	ubfx	x2, x2, #0, #8
     8c0:      	b	0x558 <_stogir.uses.build+0x2f0>
     8c4:      	cmp	x26, #0x0
     8c8:      	b.ne	0xaa8 <_stogir.uses.build+0x840>
     8cc:      	movz	x0, #0x0, lsl #48
     8d0:      	movz	x1, #0x0, lsl #48
     8d4:      	b	0x918 <_stogir.uses.build+0x6b0>
     8d8:      	lsl	x2, x0, #4
     8dc:      	add	x3, x0, #0x1
     8e0:      	lsl	x4, x0, #3
     8e4:      	lsl	x0, x0, #4
     8e8:      	ldr	x5, [x19]
     8ec:      	add	x2, x2, x5
     8f0:      	add	x0, x0, x5
     8f4:      	ldr	x2, [x2, #0x8]
     8f8:      	add	x5, x2, x1
     8fc:      	str	x1, [x0]
     900:      	str	x2, [x0, #0x8]
     904:      	ldr	x0, [x20]
     908:      	add	x0, x4, x0
     90c:      	str	x1, [x0]
     910:      	mov	x0, x3
     914:      	mov	x1, x5
     918:      	ldr	x2, [x19, #0x8]
     91c:      	cmp	x0, x2
     920:      	b.lt	0x8d8 <_stogir.uses.build+0x670>
     924:      	ldr	x0, [x29, #0x20]
     928:      	ldr	x2, [x0, #0x8]
     92c:      	ldr	x3, [x0, #0x10]
     930:      	add	x4, x2, x1
     934:      	cmp	x4, x3
     938:      	b.le	0xac0 <_stogir.uses.build+0x858>
     93c:      	mov	x17, #0x3fffffffffffffff ; =4611686018427387903
     940:      	cmp	x3, x17
     944:      	b.gt	0x4c8 <_stogir.uses.build+0x260>
     948:      	lsl	x3, x3, #1
     94c:      	b	0x4cc <_stogir.uses.build+0x264>
     950:      	brk	#0
     954:      	b	0x950 <_stogir.uses.build+0x6e8>
     958:      	b	0x968 <_stogir.uses.build+0x700>
     95c:      	nop
     960:      	sub	x0, x0, #0x1
     964:      	str	x0, [x20, #0x8]
     968:      	ldr	x0, [x20, #0x8]
     96c:      	cmp	x0, #0x0
     970:      	b.ne	0x960 <_stogir.uses.build+0x6f8>
     974:      	ldr	x0, [x20, #0x10]
     978:      	cmp	x0, #0x0
     97c:      	b.le	0x9b4 <_stogir.uses.build+0x74c>
     980:      	add	x1, x20, #0x18
     984:      	adrp	x16, 0x0 <_gap_uses_graph>
		0000000000000984:  ARM64_RELOC_PAGE21	l_stogir.118
     988:      	ldr	x16, [x16]
		0000000000000988:  ARM64_RELOC_PAGEOFF12	l_stogir.118
     98c:      	orr	x2, x16, xzr
     990:      	ldr	x3, [x20]
     994:      	fmov	d31, x0
     998:      	mov	x0, x1
     99c:      	mov	x1, x3
     9a0:      	mov	x3, x2
     9a4:      	fmov	x2, d31
     9a8:      	mov	x4, #0x8                ; =8
     9ac:      	mov	x5, #0x8                ; =8
     9b0:      	bl	0x9b0 <_stogir.uses.build+0x748>
		00000000000009b0:  ARM64_RELOC_BRANCH26	_coil.alloc.sized-free
     9b4:      	movz	x17, #0x0, lsl #48
     9b8:      	str	x17, [x20]
     9bc:      	movz	x17, #0x0, lsl #48
     9c0:      	str	x17, [x20, #0x8]
     9c4:      	movz	x17, #0x0, lsl #48
     9c8:      	str	x17, [x20, #0x10]
     9cc:      	movz	x0, #0x0, lsl #48
     9d0:      	b	0x9f8 <_stogir.uses.build+0x790>
     9d4:      	nop
     9d8:      	add	x1, x0, #0x8
     9dc:      	ldr	x2, [x29, #0x18]
     9e0:      	add	x3, x2, x0
     9e4:      	add	x0, x19, x0
     9e8:      	ldr	x0, [x0]
     9ec:      	str	x0, [x3]
     9f0:      	str	x2, [x29, #0x18]
     9f4:      	mov	x0, x1
     9f8:      	cmp	x0, #0x50
     9fc:      	b.lo	0x9d8 <_stogir.uses.build+0x770>
     a00:      	ldr	x2, [x29, #0x18]
     a04:      	movz	x0, #0x0, lsl #48
     a08:      	b	0xa30 <_stogir.uses.build+0x7c8>
     a0c:      	nop
     a10:      	add	x1, x0, #0x8
     a14:      	ldr	x3, [x29, #0x10]
     a18:      	add	x4, x3, x0
     a1c:      	add	x0, x2, x0
     a20:      	ldr	x0, [x0]
     a24:      	str	x0, [x4]
     a28:      	str	x3, [x29, #0x10]
     a2c:      	mov	x0, x1
     a30:      	cmp	x0, #0x50
     a34:      	b.lo	0xa10 <_stogir.uses.build+0x7a8>
     a38:      	sub	sp, x29, #0x0
     a3c:      	ldr	x19, [sp, #0x58]
     a40:      	ldr	x20, [sp, #0x60]
     a44:      	ldr	x21, [sp, #0x68]
     a48:      	ldr	x22, [sp, #0x70]
     a4c:      	ldr	x23, [sp, #0x78]
     a50:      	ldr	x24, [sp, #0x80]
     a54:      	ldr	x25, [sp, #0x88]
     a58:      	ldr	x26, [sp, #0x90]
     a5c:      	ldr	x27, [sp, #0x98]
     a60:      	ldr	x28, [sp, #0xa0]
     a64:      	ldr	x29, [sp]
     a68:      	ldr	x30, [sp, #0x8]
     a6c:      	add	sp, sp, #0xb0
     a70:      	ret
     a74:      	mov	x27, x8
     a78:      	mov	x28, x0
     a7c:      	b	0x454 <_stogir.uses.build+0x1ec>
     a80:      	str	x2, [x29, #0x28]
     a84:      	str	x4, [x29, #0x30]
     a88:      	b	0x69c <_stogir.uses.build+0x434>
     a8c:      	str	x2, [x29, #0x28]
     a90:      	str	x4, [x29, #0x30]
     a94:      	b	0x69c <_stogir.uses.build+0x434>
     a98:      	str	x4, [x29, #0x30]
     a9c:      	b	0x69c <_stogir.uses.build+0x434>
     aa0:      	str	x2, [x29, #0x28]
     aa4:      	b	0x57c <_stogir.uses.build+0x314>
     aa8:      	str	x21, [x29, #0x38]
     aac:      	str	x22, [x29, #0x40]
     ab0:      	ldr	x22, [x29, #0x20]
     ab4:      	str	x23, [x29, #0x48]
     ab8:      	str	x24, [x29, #0x50]
     abc:      	b	0x520 <_stogir.uses.build+0x2b8>
     ac0:      	str	x21, [x29, #0x38]
     ac4:      	mov	x21, x1
     ac8:      	str	x22, [x29, #0x40]
     acc:      	mov	x22, x0
     ad0:      	str	x23, [x29, #0x48]
     ad4:      	str	x24, [x29, #0x50]
     ad8:      	mov	x23, x2
     adc:      	mov	x24, x4
     ae0:      	b	0x500 <_stogir.uses.build+0x298>
