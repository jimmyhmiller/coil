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
     2e0:      	sub	sp, sp, #0x10
     2e4:      	mov	x24, sp
     2e8:      	sub	sp, sp, #0x50
     2ec:      	mov	x25, sp
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
     410:      	movz	x26, #0x0, lsl #48
     414:      	b	0x4b0 <_stogir.uses.build+0x248>
     418:      	lsl	x1, x1, #1
     41c:      	str	x8, [x29, #0x10]
     420:      	mov	x28, x0
     424:      	mov	x0, x19
     428:      	bl	0x428 <_stogir.uses.build+0x1c0>
		0000000000000428:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__stogir.uses.Range
     42c:      	lsl	x0, x27, #4
     430:      	add	x1, x27, #0x1
     434:      	ldr	x2, [x19]
     438:      	add	x0, x0, x2
     43c:      	movz	x17, #0x0, lsl #48
     440:      	str	x17, [x0]
     444:      	movz	x17, #0x0, lsl #48
     448:      	str	x17, [x0, #0x8]
     44c:      	str	x1, [x19, #0x8]
     450:      	ldr	x0, [x20, #0x8]
     454:      	orr	x27, x0, xzr
     458:      	ldr	x0, [x20, #0x10]
     45c:      	cmp	x27, x0
     460:      	b.lt	0x484 <_stogir.uses.build+0x21c>
     464:      	cmp	x0, #0x0
     468:      	b.ne	0x474 <_stogir.uses.build+0x20c>
     46c:      	mov	x0, #0x2                ; =2
     470:      	b	0x478 <_stogir.uses.build+0x210>
     474:      	lsl	x0, x0, #1
     478:      	mov	x1, x0
     47c:      	mov	x0, x20
     480:      	bl	0x480 <_stogir.uses.build+0x218>
		0000000000000480:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__i64
     484:      	add	x0, x26, #0x1
     488:      	lsl	x1, x27, #3
     48c:      	add	x2, x27, #0x1
     490:      	ldr	x3, [x20]
     494:      	add	x1, x1, x3
     498:      	movz	x17, #0x0, lsl #48
     49c:      	str	x17, [x1]
     4a0:      	str	x2, [x20, #0x8]
     4a4:      	ldr	x8, [x29, #0x10]
     4a8:      	mov	x26, x0
     4ac:      	mov	x0, x28
     4b0:      	ldr	x1, [x0, #0x8]
     4b4:      	cmp	x26, x1
     4b8:      	b.ge	0xb2c <_stogir.uses.build+0x8c4>
     4bc:      	ldr	x1, [x19, #0x8]
     4c0:      	orr	x27, x1, xzr
     4c4:      	ldr	x1, [x19, #0x10]
     4c8:      	cmp	x27, x1
     4cc:      	b.lt	0xb38 <_stogir.uses.build+0x8d0>
     4d0:      	cmp	x1, #0x0
     4d4:      	b.ne	0x418 <_stogir.uses.build+0x1b0>
     4d8:      	mov	x1, #0x2                ; =2
     4dc:      	b	0x41c <_stogir.uses.build+0x1b4>
     4e0:      	add	x26, x19, #0x28
     4e4:      	adrp	x16, 0x0 <_gap_uses_graph>
		00000000000004e4:  ARM64_RELOC_PAGE21	l_stogir.113
     4e8:      	ldr	x16, [x16]
		00000000000004e8:  ARM64_RELOC_PAGEOFF12	l_stogir.113
     4ec:      	orr	x27, x16, xzr
     4f0:      	add	x0, x28, #0x78
     4f4:      	add	x1, x28, #0x28
     4f8:      	add	x2, x28, #0x50
     4fc:      	movz	x3, #0x0, lsl #48
     500:      	b	0x644 <_stogir.uses.build+0x3dc>
     504:      	nop
     508:      	lsl	x4, x0, #4
     50c:      	add	x5, x0, #0x1
     510:      	lsl	x6, x0, #4
     514:      	lsl	x0, x0, #3
     518:      	ldr	x7, [x19]
     51c:      	add	x4, x4, x7
     520:      	add	x6, x6, x7
     524:      	ldr	x4, [x4, #0x8]
     528:      	add	x7, x4, x21
     52c:      	str	x21, [x6]
     530:      	str	x4, [x6, #0x8]
     534:      	ldr	x4, [x20]
     538:      	add	x0, x0, x4
     53c:      	str	x21, [x0]
     540:      	mov	x0, x5
     544:      	mov	x21, x7
     548:      	ldr	x4, [x19, #0x8]
     54c:      	cmp	x0, x4
     550:      	b.lt	0x508 <_stogir.uses.build+0x2a0>
     554:      	movz	x24, #0x0, lsl #48
     558:      	b	0x5cc <_stogir.uses.build+0x364>
     55c:      	nop
     560:      	lsl	x5, x5, #1
     564:      	str	x1, [x29, #0x40]
     568:      	mov	x1, x5
     56c:      	str	x2, [x29, #0x48]
     570:      	str	x21, [x29, #0x50]
     574:      	mov	x21, x3
     578:      	str	x22, [x29, #0x58]
     57c:      	mov	x22, x0
     580:      	str	x23, [x29, #0x60]
     584:      	mov	x23, x4
     588:      	bl	0x588 <_stogir.uses.build+0x320>
		0000000000000588:  ARM64_RELOC_BRANCH26	_inherent$coil.arraylist.ArrayList$reserve!__stogir.uses.Use
     58c:      	add	x0, x24, #0x1
     590:      	lsl	x1, x23, #3
     594:      	add	x2, x23, #0x1
     598:      	ldr	x3, [x19, #0x28]
     59c:      	add	x1, x1, x3
     5a0:      	str	x26, [x1]
     5a4:      	str	x2, [x22, #0x8]
     5a8:      	mov	x3, x21
     5ac:      	ldr	x21, [x29, #0x50]
     5b0:      	ldr	x23, [x29, #0x60]
     5b4:      	str	x25, [x29, #0x30]
     5b8:      	str	x22, [x29, #0x28]
     5bc:      	ldr	x22, [x29, #0x58]
     5c0:      	ldr	x1, [x29, #0x40]
     5c4:      	ldr	x2, [x29, #0x48]
     5c8:      	mov	x24, x0
     5cc:      	cmp	x24, x21
     5d0:      	b.ge	0xb44 <_stogir.uses.build+0x8dc>
     5d4:      	ldr	x25, [x29, #0x30]
     5d8:      	movz	x17, #0x0, lsl #48
     5dc:      	str	x17, [x25]
     5e0:      	movz	w17, #0x0, lsl #16
     5e4:      	str	w17, [x25]
     5e8:      	movz	w17, #0x0, lsl #16
     5ec:      	str	w17, [x25, #0x4]
     5f0:      	ldr	x26, [x25]
     5f4:      	ldr	x0, [x29, #0x28]
     5f8:      	ldr	x4, [x0, #0x8]
     5fc:      	ldr	x5, [x0, #0x10]
     600:      	cmp	x4, x5
     604:      	b.lt	0xb64 <_stogir.uses.build+0x8fc>
     608:      	cmp	x5, #0x0
     60c:      	b.ne	0x560 <_stogir.uses.build+0x2f8>
     610:      	mov	x5, #0x2                ; =2
     614:      	b	0x564 <_stogir.uses.build+0x2fc>
     618:      	add	x0, x21, #0x1
     61c:      	ldr	x21, [x29, #0x20]
     620:      	ldr	x23, [x29, #0x60]
     624:      	mov	x24, x25
     628:      	ldr	x25, [x29, #0x18]
     62c:      	mov	x26, x22
     630:      	ldr	x22, [x29, #0x58]
     634:      	ldr	x1, [x29, #0x40]
     638:      	ldr	x2, [x29, #0x48]
     63c:      	mov	x3, x0
     640:      	ldr	x0, [x29, #0x38]
     644:      	cmp	x3, #0x2
     648:      	b.ge	0xb88 <_stogir.uses.build+0x920>
     64c:      	cmp	x3, #0x0
     650:      	cset	w4, eq
     654:      	mov	x5, #0x1                ; =1
     658:      	b	0x930 <_stogir.uses.build+0x6c8>
     65c:      	movz	x21, #0x0, lsl #48
     660:      	b	0x670 <_stogir.uses.build+0x408>
     664:      	movz	x21, #0x0, lsl #48
     668:      	b	0x678 <_stogir.uses.build+0x410>
     66c:      	movz	x21, #0x0, lsl #48
     670:      	b	0x680 <_stogir.uses.build+0x418>
     674:      	movz	x21, #0x0, lsl #48
     678:      	b	0x680 <_stogir.uses.build+0x418>
     67c:      	movz	x21, #0x0, lsl #48
     680:      	cmp	x21, #0x0
     684:      	b.eq	0x870 <_stogir.uses.build+0x608>
     688:      	cmp	x26, #0x1
     68c:      	b.lt	0x6fc <_stogir.uses.build+0x494>
     690:      	ldr	x21, [x28, #0x78]
     694:      	add	x21, x12, x21
     698:      	ldr	w21, [x21]
     69c:      	sxtw	x21, w21
     6a0:      	cmp	x26, x21
     6a4:      	b.gt	0x6fc <_stogir.uses.build+0x494>
     6a8:      	ldr	x21, [x28]
     6ac:      	asr	x16, x26, #63
     6b0:      	lsr	x16, x16, #62
     6b4:      	add	x24, x26, x16
     6b8:      	asr	x24, x24, #2
     6bc:      	asr	x16, x26, #63
     6c0:      	lsr	x16, x16, #62
     6c4:      	add	x26, x26, x16
     6c8:      	and	x26, x26, #0x3
     6cc:      	sub	x26, x26, x16
     6d0:      	add	x24, x24, x8
     6d4:      	lsl	x26, x26, #2
     6d8:      	lsl	x24, x24, #4
     6dc:      	add	x21, x24, x21
     6e0:      	add	x21, x26, x21
     6e4:      	ldr	w21, [x21]
     6e8:      	sxtw	x21, w21
     6ec:      	and	x21, x21, #0xffffffff
     6f0:      	mov	x24, x21
     6f4:      	mov	x21, #0x1               ; =1
     6f8:      	b	0x704 <_stogir.uses.build+0x49c>
     6fc:      	movz	x21, #0x0, lsl #48
     700:      	movz	x24, #0x0, lsl #48
     704:      	b	0x878 <_stogir.uses.build+0x610>
     708:      	str	x24, [x29, #0x30]
     70c:      	sub	x24, x26, #0x1
     710:      	lsr	w24, w24, #0
     714:      	sxtw	x24, w24
     718:      	lsl	x21, x21, #2
     71c:      	add	x21, x21, x27
     720:      	lsl	x24, x24, #2
     724:      	lsr	w24, w24, #0
     728:      	ldr	w21, [x21]
     72c:      	ubfx	x24, x24, #0, #32
     730:      	lsr	x21, x21, x24
     734:      	lsr	w21, w21, #0
     738:      	and	x21, x21, #0xf
     73c:      	lsr	w21, w21, #0
     740:      	b	0x748 <_stogir.uses.build+0x4e0>
     744:      	movz	x21, #0x0, lsl #48
     748:      	lsr	w21, w21, #0
     74c:      	cmp	x21, #0xf
     750:      	b.hs	0xb90 <_stogir.uses.build+0x928>
     754:      	mov	x16, #0x1               ; =1
     758:      	lsl	x21, x16, x21
     75c:      	lsr	w21, w21, #0
     760:      	mov	x17, #0x5e1c            ; =24092
     764:      	and	x21, x21, x17
     768:      	lsr	w21, w21, #0
     76c:      	cmp	x21, #0x0
     770:      	b.eq	0xb98 <_stogir.uses.build+0x930>
     774:      	uxtb	w16, w11
     778:      	cmp	w16, wzr
     77c:      	b.ne	0x870 <_stogir.uses.build+0x608>
     780:      	uxtb	w16, w13
     784:      	cmp	w16, wzr
     788:      	b.eq	0x9b0 <_stogir.uses.build+0x748>
     78c:      	ldr	x21, [x28, #0x8]
     790:      	cmp	x8, x21
     794:      	b.ge	0x674 <_stogir.uses.build+0x40c>
     798:      	ldr	x21, [x0, #0x8]
     79c:      	cmp	x8, x21
     7a0:      	b.ge	0x664 <_stogir.uses.build+0x3fc>
     7a4:      	ldr	x21, [x28, #0x78]
     7a8:      	add	x21, x12, x21
     7ac:      	ldr	w21, [x21]
     7b0:      	sxtw	x21, w21
     7b4:      	cmp	x21, #0x0
     7b8:      	cset	w21, ge
     7bc:      	ubfx	x21, x21, #0, #8
     7c0:      	b	0x668 <_stogir.uses.build+0x400>
     7c4:      	lsl	x0, x21, #3
     7c8:      	lsl	x21, x21, #3
     7cc:      	ldr	x24, [x20]
     7d0:      	add	x0, x0, x24
     7d4:      	ldr	x0, [x0]
     7d8:      	movz	x17, #0x0, lsl #48
     7dc:      	str	x17, [x23]
     7e0:      	add	x24, x0, #0x1
     7e4:      	lsl	x0, x0, #3
     7e8:      	str	w10, [x23]
     7ec:      	str	w25, [x23, #0x4]
     7f0:      	ldr	x25, [x23]
     7f4:      	ldr	x26, [x19, #0x28]
     7f8:      	add	x0, x0, x26
     7fc:      	str	x25, [x0]
     800:      	ldr	x0, [x20]
     804:      	add	x0, x21, x0
     808:      	str	x24, [x0]
     80c:      	add	x0, x7, #0x1
     810:      	lsr	w0, w0, #0
     814:      	sxtw	x0, w0
     818:      	ldr	x21, [x29, #0x20]
     81c:      	ldr	x24, [x29, #0x30]
     820:      	ldr	x26, [x29, #0x28]
     824:      	mov	x7, x0
     828:      	ldr	x0, [x29, #0x38]
     82c:      	cmp	x7, x6
     830:      	b.gt	0xba0 <_stogir.uses.build+0x938>
     834:      	lsr	w25, w7, #0
     838:      	str	x21, [x29, #0x20]
     83c:      	ldr	w21, [x21]
     840:      	str	x26, [x29, #0x28]
     844:      	sxtw	x26, w25
     848:      	uxtb	w21, w21
     84c:      	cmp	x21, #0x83
     850:      	b.ge	0xbb4 <_stogir.uses.build+0x94c>
     854:      	cmp	x26, #0x0
     858:      	b.le	0xbbc <_stogir.uses.build+0x954>
     85c:      	cmp	x26, #0x4
     860:      	b.le	0x708 <_stogir.uses.build+0x4a0>
     864:      	str	x24, [x29, #0x30]
     868:      	mov	x24, #0x4               ; =4
     86c:      	b	0x718 <_stogir.uses.build+0x4b0>
     870:      	movz	x21, #0x0, lsl #48
     874:      	movz	x24, #0x0, lsl #48
     878:      	str	x21, [x22]
     87c:      	lsr	w21, w21, #0
     880:      	str	x24, [x22, #0x8]
     884:      	lsr	x16, x21, #0
     888:      	cmp	x16, #0x1
     88c:      	b.eq	0x8ac <_stogir.uses.build+0x644>
     890:      	b.lo	0x898 <_stogir.uses.build+0x630>
     894:      	b	0x8b0 <_stogir.uses.build+0x648>
     898:      	cmp	x16, #0x0
     89c:      	b.eq	0x8a4 <_stogir.uses.build+0x63c>
     8a0:      	b	0x8b0 <_stogir.uses.build+0x648>
     8a4:      	str	x0, [x29, #0x38]
     8a8:      	b	0x80c <_stogir.uses.build+0x5a4>
     8ac:      	b	0x8b4 <_stogir.uses.build+0x64c>
     8b0:      	b	0xa08 <_stogir.uses.build+0x7a0>
     8b4:      	ldr	w21, [x22, #0x8]
     8b8:      	sxtw	x21, w21
     8bc:      	cmp	x21, #0x0
     8c0:      	b.le	0xbc4 <_stogir.uses.build+0x95c>
     8c4:      	lsl	x24, x21, #4
     8c8:      	ldr	x26, [x19]
     8cc:      	add	x24, x24, x26
     8d0:      	str	x0, [x29, #0x38]
     8d4:      	ldr	x0, [x24]
     8d8:      	ldr	x24, [x24, #0x8]
     8dc:      	uxtb	w16, w4
     8e0:      	cmp	w16, wzr
     8e4:      	b.eq	0x7c4 <_stogir.uses.build+0x55c>
     8e8:      	add	x24, x24, #0x1
     8ec:      	lsl	x21, x21, #4
     8f0:      	add	x21, x21, x26
     8f4:      	str	x0, [x21]
     8f8:      	str	x24, [x21, #0x8]
     8fc:      	b	0x80c <_stogir.uses.build+0x5a4>
     900:      	add	x0, x6, #0x4
     904:      	asr	x16, x0, #63
     908:      	lsr	x16, x16, #62
     90c:      	add	x0, x0, x16
     910:      	asr	x0, x0, #2
     914:      	add	x0, x0, x5
     918:      	ldr	x21, [x29, #0x20]
     91c:      	ldr	x24, [x29, #0x30]
     920:      	ldr	x25, [x29, #0x18]
     924:      	ldr	x26, [x29, #0x28]
     928:      	mov	x5, x0
     92c:      	ldr	x0, [x29, #0x38]
     930:      	ldr	x6, [x28, #0x8]
     934:      	cmp	x5, x6
     938:      	b.ge	0xbcc <_stogir.uses.build+0x964>
     93c:      	lsl	x6, x5, #4
     940:      	lsl	x7, x5, #2
     944:      	lsr	w8, w5, #0
     948:      	ldr	x9, [x28]
     94c:      	lsr	w10, w8, #0
     950:      	sxtw	x8, w8
     954:      	cmp	x8, #0x0
     958:      	cset	w11, le
     95c:      	lsl	x12, x8, #2
     960:      	cmp	x8, #0x0
     964:      	cset	w13, gt
     968:      	cmp	x8, #0x0
     96c:      	cset	w14, lt
     970:      	movz	x16, #0x0, lsl #48
     974:      	sub	x15, x16, x8
     978:      	add	x6, x6, x9
     97c:      	sub	x9, x15, #0x1
     980:      	lsl	x9, x9, #2
     984:      	str	x25, [x29, #0x18]
     988:      	ldr	x25, [x6]
     98c:      	ldr	x6, [x6, #0x8]
     990:      	str	x25, [x21]
     994:      	str	x6, [x21, #0x8]
     998:      	ldr	x6, [x28, #0x78]
     99c:      	add	x6, x7, x6
     9a0:      	ldr	w6, [x6]
     9a4:      	sxtw	x6, w6
     9a8:      	mov	x7, #0x1                ; =1
     9ac:      	b	0x82c <_stogir.uses.build+0x5c4>
     9b0:      	uxtb	w16, w14
     9b4:      	cmp	w16, wzr
     9b8:      	b.eq	0x67c <_stogir.uses.build+0x414>
     9bc:      	ldr	x21, [x1, #0x8]
     9c0:      	ldr	x24, [x2, #0x8]
     9c4:      	cmp	x21, x24
     9c8:      	b.ne	0x66c <_stogir.uses.build+0x404>
     9cc:      	cmp	x15, x21
     9d0:      	b.gt	0x65c <_stogir.uses.build+0x3f4>
     9d4:      	ldr	x21, [x28, #0x50]
     9d8:      	add	x21, x9, x21
     9dc:      	ldr	w21, [x21]
     9e0:      	sxtw	x21, w21
     9e4:      	cmp	x21, #0x0
     9e8:      	cset	w21, gt
     9ec:      	ubfx	x21, x21, #0, #8
     9f0:      	b	0x660 <_stogir.uses.build+0x3f8>
     9f4:      	cmp	x3, #0x0
     9f8:      	b.ne	0xbe4 <_stogir.uses.build+0x97c>
     9fc:      	movz	x0, #0x0, lsl #48
     a00:      	movz	x21, #0x0, lsl #48
     a04:      	b	0x548 <_stogir.uses.build+0x2e0>
     a08:      	brk	#0
     a0c:      	b	0xa08 <_stogir.uses.build+0x7a0>
     a10:      	b	0xa20 <_stogir.uses.build+0x7b8>
     a14:      	nop
     a18:      	sub	x0, x0, #0x1
     a1c:      	str	x0, [x20, #0x8]
     a20:      	ldr	x0, [x20, #0x8]
     a24:      	cmp	x0, #0x0
     a28:      	b.ne	0xa18 <_stogir.uses.build+0x7b0>
     a2c:      	ldr	x0, [x20, #0x10]
     a30:      	cmp	x0, #0x0
     a34:      	b.le	0xa6c <_stogir.uses.build+0x804>
     a38:      	add	x1, x20, #0x18
     a3c:      	adrp	x16, 0x0 <_gap_uses_graph>
		0000000000000a3c:  ARM64_RELOC_PAGE21	l_stogir.114
     a40:      	ldr	x16, [x16]
		0000000000000a40:  ARM64_RELOC_PAGEOFF12	l_stogir.114
     a44:      	orr	x2, x16, xzr
     a48:      	ldr	x3, [x20]
     a4c:      	fmov	d31, x0
     a50:      	mov	x0, x1
     a54:      	mov	x1, x3
     a58:      	mov	x3, x2
     a5c:      	fmov	x2, d31
     a60:      	mov	x4, #0x8                ; =8
     a64:      	mov	x5, #0x8                ; =8
     a68:      	bl	0xa68 <_stogir.uses.build+0x800>
		0000000000000a68:  ARM64_RELOC_BRANCH26	_coil.alloc.sized-free
     a6c:      	movz	x17, #0x0, lsl #48
     a70:      	str	x17, [x20]
     a74:      	movz	x17, #0x0, lsl #48
     a78:      	str	x17, [x20, #0x8]
     a7c:      	movz	x17, #0x0, lsl #48
     a80:      	str	x17, [x20, #0x10]
     a84:      	movz	x0, #0x0, lsl #48
     a88:      	b	0xab0 <_stogir.uses.build+0x848>
     a8c:      	nop
     a90:      	add	x1, x0, #0x8
     a94:      	ldr	x2, [x29, #0x18]
     a98:      	add	x3, x2, x0
     a9c:      	add	x0, x19, x0
     aa0:      	ldr	x0, [x0]
     aa4:      	str	x0, [x3]
     aa8:      	str	x2, [x29, #0x18]
     aac:      	mov	x0, x1
     ab0:      	cmp	x0, #0x50
     ab4:      	b.lo	0xa90 <_stogir.uses.build+0x828>
     ab8:      	ldr	x2, [x29, #0x18]
     abc:      	movz	x0, #0x0, lsl #48
     ac0:      	b	0xae8 <_stogir.uses.build+0x880>
     ac4:      	nop
     ac8:      	add	x1, x0, #0x8
     acc:      	ldr	x3, [x29, #0x10]
     ad0:      	add	x4, x3, x0
     ad4:      	add	x0, x2, x0
     ad8:      	ldr	x0, [x0]
     adc:      	str	x0, [x4]
     ae0:      	str	x3, [x29, #0x10]
     ae4:      	mov	x0, x1
     ae8:      	cmp	x0, #0x50
     aec:      	b.lo	0xac8 <_stogir.uses.build+0x860>
     af0:      	sub	sp, x29, #0x0
     af4:      	ldr	x19, [sp, #0x68]
     af8:      	ldr	x20, [sp, #0x70]
     afc:      	ldr	x21, [sp, #0x78]
     b00:      	ldr	x22, [sp, #0x80]
     b04:      	ldr	x23, [sp, #0x88]
     b08:      	ldr	x24, [sp, #0x90]
     b0c:      	ldr	x25, [sp, #0x98]
     b10:      	ldr	x26, [sp, #0xa0]
     b14:      	ldr	x27, [sp, #0xa8]
     b18:      	ldr	x28, [sp, #0xb0]
     b1c:      	ldr	x29, [sp]
     b20:      	ldr	x30, [sp, #0x8]
     b24:      	add	sp, sp, #0xc0
     b28:      	ret
     b2c:      	str	x8, [x29, #0x10]
     b30:      	mov	x28, x0
     b34:      	b	0x4e0 <_stogir.uses.build+0x278>
     b38:      	str	x8, [x29, #0x10]
     b3c:      	mov	x28, x0
     b40:      	b	0x42c <_stogir.uses.build+0x1c4>
     b44:      	mov	x21, x3
     b48:      	str	x22, [x29, #0x58]
     b4c:      	str	x23, [x29, #0x60]
     b50:      	ldr	x25, [x29, #0x30]
     b54:      	ldr	x22, [x29, #0x28]
     b58:      	str	x1, [x29, #0x40]
     b5c:      	str	x2, [x29, #0x48]
     b60:      	b	0x618 <_stogir.uses.build+0x3b0>
     b64:      	str	x21, [x29, #0x50]
     b68:      	mov	x21, x3
     b6c:      	str	x22, [x29, #0x58]
     b70:      	str	x23, [x29, #0x60]
     b74:      	mov	x22, x0
     b78:      	str	x1, [x29, #0x40]
     b7c:      	str	x2, [x29, #0x48]
     b80:      	mov	x23, x4
     b84:      	b	0x58c <_stogir.uses.build+0x324>
     b88:      	str	x25, [x29, #0x18]
     b8c:      	b	0xa10 <_stogir.uses.build+0x7a8>
     b90:      	str	x0, [x29, #0x38]
     b94:      	b	0x80c <_stogir.uses.build+0x5a4>
     b98:      	str	x0, [x29, #0x38]
     b9c:      	b	0x80c <_stogir.uses.build+0x5a4>
     ba0:      	str	x21, [x29, #0x20]
     ba4:      	str	x24, [x29, #0x30]
     ba8:      	str	x26, [x29, #0x28]
     bac:      	str	x0, [x29, #0x38]
     bb0:      	b	0x900 <_stogir.uses.build+0x698>
     bb4:      	str	x24, [x29, #0x30]
     bb8:      	b	0x744 <_stogir.uses.build+0x4dc>
     bbc:      	str	x24, [x29, #0x30]
     bc0:      	b	0x744 <_stogir.uses.build+0x4dc>
     bc4:      	str	x0, [x29, #0x38]
     bc8:      	b	0x80c <_stogir.uses.build+0x5a4>
     bcc:      	str	x21, [x29, #0x20]
     bd0:      	str	x24, [x29, #0x30]
     bd4:      	str	x25, [x29, #0x18]
     bd8:      	str	x26, [x29, #0x28]
     bdc:      	str	x0, [x29, #0x38]
     be0:      	b	0x9f4 <_stogir.uses.build+0x78c>
     be4:      	mov	x21, x3
     be8:      	str	x22, [x29, #0x58]
     bec:      	str	x23, [x29, #0x60]
     bf0:      	ldr	x25, [x29, #0x30]
     bf4:      	ldr	x22, [x29, #0x28]
     bf8:      	str	x1, [x29, #0x40]
     bfc:      	str	x2, [x29, #0x48]
     c00:      	b	0x618 <_stogir.uses.build+0x3b0>
