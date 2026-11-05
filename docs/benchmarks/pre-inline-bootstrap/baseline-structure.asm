
../stogir-profile-guided-pipeline/build/bootstrap-profile-guided-pipeline/stogir-0.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000000025b2a0 <_stogir.verify.structure>:
  25b2a0:      	sub	sp, sp, #0x180
  25b2a4:      	str	x29, [sp, #0x10]
  25b2a8:      	str	x30, [sp, #0x18]
  25b2ac:      	add	x29, sp, #0x10
  25b2b0:      	str	x19, [sp, #0x130]
  25b2b4:      	str	x20, [sp, #0x138]
  25b2b8:      	str	x21, [sp, #0x140]
  25b2bc:      	str	x22, [sp, #0x148]
  25b2c0:      	str	x23, [sp, #0x150]
  25b2c4:      	str	x24, [sp, #0x158]
  25b2c8:      	str	x25, [sp, #0x160]
  25b2cc:      	str	x26, [sp, #0x168]
  25b2d0:      	str	x27, [sp, #0x170]
  25b2d4:      	str	x28, [sp, #0x178]
  25b2d8:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b2d8:  ARM64_RELOC_PAGE21	l_stogir.37813
  25b2dc:      	ldr	x16, [x16]
		000000000025b2dc:  ARM64_RELOC_PAGEOFF12	l_stogir.37813
  25b2e0:      	orr	x19, x16, xzr
  25b2e4:      	add	x1, x0, #0x78
  25b2e8:      	ldr	x20, [x0, #0x8]
  25b2ec:      	mov	x21, x8
  25b2f0:      	mov	x22, x0
  25b2f4:      	mov	x0, x1
  25b2f8:      	bl	0x25b2f8 <_stogir.verify.structure+0x58>
		000000000025b2f8:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__i32
  25b2fc:      	cmp	x20, x0
  25b300:      	b.ne	0x25b65c <_stogir.verify.structure+0x3bc>
  25b304:      	mov	x0, x19
  25b308:      	movz	x1, #0x0, lsl #48
  25b30c:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b30c:  ARM64_RELOC_PAGE21	l_stogir.37814
  25b310:      	ldr	x16, [x16]
		000000000025b310:  ARM64_RELOC_PAGEOFF12	l_stogir.37814
  25b314:      	orr	x20, x16, xzr
  25b318:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b318:  ARM64_RELOC_PAGE21	l_stogir.37815
  25b31c:      	ldr	x16, [x16]
		000000000025b31c:  ARM64_RELOC_PAGEOFF12	l_stogir.37815
  25b320:      	orr	x23, x16, xzr
  25b324:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b324:  ARM64_RELOC_PAGE21	l_stogir.37816
  25b328:      	ldr	x16, [x16]
		000000000025b328:  ARM64_RELOC_PAGEOFF12	l_stogir.37816
  25b32c:      	orr	x24, x16, xzr
  25b330:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b330:  ARM64_RELOC_PAGE21	l_stogir.37817
  25b334:      	ldr	x16, [x16]
		000000000025b334:  ARM64_RELOC_PAGEOFF12	l_stogir.37817
  25b338:      	orr	x25, x16, xzr
  25b33c:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b33c:  ARM64_RELOC_PAGE21	l_stogir.37818
  25b340:      	ldr	x16, [x16]
		000000000025b340:  ARM64_RELOC_PAGEOFF12	l_stogir.37818
  25b344:      	orr	x26, x16, xzr
  25b348:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b348:  ARM64_RELOC_PAGE21	l_stogir.37819
  25b34c:      	ldr	x16, [x16]
		000000000025b34c:  ARM64_RELOC_PAGEOFF12	l_stogir.37819
  25b350:      	orr	x27, x16, xzr
  25b354:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b354:  ARM64_RELOC_PAGE21	l_stogir.37820
  25b358:      	ldr	x16, [x16]
		000000000025b358:  ARM64_RELOC_PAGEOFF12	l_stogir.37820
  25b35c:      	orr	x28, x16, xzr
  25b360:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b360:  ARM64_RELOC_PAGE21	l_stogir.37821
  25b364:      	ldr	x16, [x16]
		000000000025b364:  ARM64_RELOC_PAGEOFF12	l_stogir.37821
  25b368:      	orr	x2, x16, xzr
  25b36c:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b36c:  ARM64_RELOC_PAGE21	l_stogir.37822
  25b370:      	ldr	x16, [x16]
		000000000025b370:  ARM64_RELOC_PAGEOFF12	l_stogir.37822
  25b374:      	orr	x3, x16, xzr
  25b378:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b378:  ARM64_RELOC_PAGE21	l_stogir.37823
  25b37c:      	ldr	x16, [x16]
		000000000025b37c:  ARM64_RELOC_PAGEOFF12	l_stogir.37823
  25b380:      	orr	x4, x16, xzr
  25b384:      	add	x5, x22, #0x110
  25b388:      	add	x6, x22, #0x78
  25b38c:      	add	x7, x22, #0x28
  25b390:      	add	x8, x22, #0x50
  25b394:      	add	x9, x22, #0x78
  25b398:      	add	x10, x22, #0x28
  25b39c:      	add	x11, x22, #0x50
  25b3a0:      	add	x12, x5, #0x28
  25b3a4:      	mov	x13, x0
  25b3a8:      	mov	x14, x1
  25b3ac:      	mov	x0, #0x1                ; =1
  25b3b0:      	movz	x1, #0x0, lsl #48
  25b3b4:      	b	0x25b448 <_stogir.verify.structure+0x1a8>
  25b3b8:      	mov	x1, x19
  25b3bc:      	ldr	x2, [sp, #0x58]
  25b3c0:      	mov	x3, #0x16               ; =22
  25b3c4:      	b	0x25b3f0 <_stogir.verify.structure+0x150>
  25b3c8:      	mov	x0, x21
  25b3cc:      	str	x19, [sp, #0xc8]
  25b3d0:      	ldr	x19, [sp, #0x90]
  25b3d4:      	str	x28, [sp, #0xd0]
  25b3d8:      	mov	x21, x20
  25b3dc:      	str	x23, [sp, #0xb0]
  25b3e0:      	str	x24, [sp, #0xa8]
  25b3e4:      	mov	x1, x19
  25b3e8:      	ldr	x2, [sp, #0x50]
  25b3ec:      	mov	x3, #0x23               ; =35
  25b3f0:      	ldr	x19, [sp, #0x48]
  25b3f4:      	ldr	x20, [sp, #0x50]
  25b3f8:      	ldr	x23, [sp, #0x58]
  25b3fc:      	ldr	x24, [sp, #0x60]
  25b400:      	ldr	x28, [sp, #0x80]
  25b404:      	ldr	x4, [sp, #0x40]
  25b408:      	ldr	x5, [sp, #0xc8]
  25b40c:      	ldr	x12, [sp, #0xd0]
  25b410:      	mov	x6, x21
  25b414:      	ldr	x21, [sp, #0x88]
  25b418:      	ldr	x7, [sp, #0xb0]
  25b41c:      	ldr	x8, [sp, #0xa8]
  25b420:      	mov	x9, x25
  25b424:      	ldr	x25, [sp, #0x68]
  25b428:      	mov	x10, x26
  25b42c:      	ldr	x26, [sp, #0x70]
  25b430:      	mov	x11, x27
  25b434:      	ldr	x27, [sp, #0x78]
  25b438:      	mov	x13, x2
  25b43c:      	ldr	x2, [sp, #0x30]
  25b440:      	mov	x14, x3
  25b444:      	ldr	x3, [sp, #0x38]
  25b448:      	str	x2, [sp, #0x30]
  25b44c:      	mov	x2, x19
  25b450:      	str	x3, [sp, #0x38]
  25b454:      	str	x4, [sp, #0x40]
  25b458:      	str	x1, [sp, #0x90]
  25b45c:      	mov	x1, x14
  25b460:      	str	x13, [sp, #0x98]
  25b464:      	str	x14, [sp, #0xa0]
  25b468:      	str	x19, [sp, #0x48]
  25b46c:      	mov	x19, x5
  25b470:      	str	x20, [sp, #0x50]
  25b474:      	mov	x20, x6
  25b478:      	str	x23, [sp, #0x58]
  25b47c:      	mov	x23, x7
  25b480:      	str	x24, [sp, #0x60]
  25b484:      	mov	x24, x8
  25b488:      	str	x25, [sp, #0x68]
  25b48c:      	mov	x25, x9
  25b490:      	str	x26, [sp, #0x70]
  25b494:      	mov	x26, x10
  25b498:      	str	x27, [sp, #0x78]
  25b49c:      	mov	x27, x11
  25b4a0:      	str	x28, [sp, #0x80]
  25b4a4:      	mov	x28, x12
  25b4a8:      	str	x21, [sp, #0x88]
  25b4ac:      	mov	x21, x0
  25b4b0:      	mov	x0, x13
  25b4b4:      	movz	x3, #0x0, lsl #48
  25b4b8:      	bl	0x25b4b8 <_stogir.verify.structure+0x218>
		000000000025b4b8:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
  25b4bc:      	cmp	x0, #0x0
  25b4c0:      	b.eq	0x25be58 <_stogir.verify.structure+0xbb8>
  25b4c4:      	ldr	x0, [x22, #0x8]
  25b4c8:      	cmp	x21, x0
  25b4cc:      	b.ge	0x25be60 <_stogir.verify.structure+0xbc0>
  25b4d0:      	lsl	x0, x21, #4
  25b4d4:      	lsl	x1, x21, #2
  25b4d8:      	ldr	x2, [x22]
  25b4dc:      	add	x0, x0, x2
  25b4e0:      	ldr	x0, [x0]
  25b4e4:      	ldr	x2, [x22, #0x78]
  25b4e8:      	add	x1, x1, x2
  25b4ec:      	ldr	w1, [x1]
  25b4f0:      	sxtw	x1, w1
  25b4f4:      	cmp	x1, #0x0
  25b4f8:      	b.lt	0x25b3c8 <_stogir.verify.structure+0x128>
  25b4fc:      	mov	x17, #0xffff            ; =65535
  25b500:      	cmp	x1, x17
  25b504:      	b.gt	0x25be68 <_stogir.verify.structure+0xbc8>
  25b508:      	uxtb	w2, w0
  25b50c:      	orr	x3, x2, xzr
  25b510:      	lsr	w3, w3, #0
  25b514:      	str	w3, [sp, #0xc0]
  25b518:      	str	x24, [sp, #0xa8]
  25b51c:      	mov	x24, x0
  25b520:      	mov	w0, w3
  25b524:      	str	x23, [sp, #0xb0]
  25b528:      	mov	x23, x1
  25b52c:      	str	x20, [sp, #0xb8]
  25b530:      	mov	w20, w2
  25b534:      	bl	0x25b534 <_stogir.verify.structure+0x294>
		000000000025b534:  ARM64_RELOC_BRANCH26	_stogir.opcode.valid?
  25b538:      	cmp	x0, #0x0
  25b53c:      	b.eq	0x25be88 <_stogir.verify.structure+0xbe8>
  25b540:      	lsr	w24, w24, #0
  25b544:      	ubfx	x0, x24, #8, #8
  25b548:      	orr	x1, x0, xzr
  25b54c:      	lsr	w1, w1, #0
  25b550:      	str	x19, [sp, #0xc8]
  25b554:      	mov	w19, w0
  25b558:      	mov	w0, w1
  25b55c:      	bl	0x25b55c <_stogir.verify.structure+0x2bc>
		000000000025b55c:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
  25b560:      	cmp	x0, #0x0
  25b564:      	b.eq	0x25bea0 <_stogir.verify.structure+0xc00>
  25b568:      	ldr	w0, [sp, #0xc0]
  25b56c:      	bl	0x25b56c <_stogir.verify.structure+0x2cc>
		000000000025b56c:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
  25b570:      	lsr	w0, w0, #0
  25b574:      	sxtw	x0, w0
  25b578:      	cmp	x0, #0x0
  25b57c:      	b.lt	0x25bc0c <_stogir.verify.structure+0x96c>
  25b580:      	ldr	w0, [sp, #0xc0]
  25b584:      	bl	0x25b584 <_stogir.verify.structure+0x2e4>
		000000000025b584:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
  25b588:      	lsr	w0, w0, #0
  25b58c:      	sxtw	x0, w0
  25b590:      	cmp	x23, x0
  25b594:      	b.eq	0x25bc0c <_stogir.verify.structure+0x96c>
  25b598:      	str	x28, [sp, #0xd0]
  25b59c:      	mov	x0, x21
  25b5a0:      	ldr	x21, [sp, #0xb8]
  25b5a4:      	ldr	x1, [sp, #0x90]
  25b5a8:      	ldr	x2, [sp, #0x60]
  25b5ac:      	mov	x3, #0x23               ; =35
  25b5b0:      	b	0x25b658 <_stogir.verify.structure+0x3b8>
  25b5b4:      	ldr	x0, [sp, #0x98]
  25b5b8:      	ldr	x1, [sp, #0xa0]
  25b5bc:      	ldr	x2, [sp, #0x48]
  25b5c0:      	movz	x3, #0x0, lsl #48
  25b5c4:      	bl	0x25b5c4 <_stogir.verify.structure+0x324>
		000000000025b5c4:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
  25b5c8:      	cmp	x0, #0x0
  25b5cc:      	b.eq	0x25b5e4 <_stogir.verify.structure+0x344>
  25b5d0:      	and	x0, x19, #0xffffffff
  25b5d4:      	mov	x1, x0
  25b5d8:      	movz	x0, #0x0, lsl #48
  25b5dc:      	movz	x2, #0x0, lsl #48
  25b5e0:      	b	0x25b5f0 <_stogir.verify.structure+0x350>
  25b5e4:      	ldr	x1, [sp, #0x98]
  25b5e8:      	ldr	x2, [sp, #0xa0]
  25b5ec:      	mov	x0, #0x1                ; =1
  25b5f0:      	ldr	x3, [sp, #0x88]
  25b5f4:      	str	x0, [x3]
  25b5f8:      	str	x1, [x3, #0x8]
  25b5fc:      	str	x2, [x3, #0x10]
  25b600:      	ldr	x19, [sp, #0x130]
  25b604:      	ldr	x20, [sp, #0x138]
  25b608:      	ldr	x21, [sp, #0x140]
  25b60c:      	ldr	x22, [sp, #0x148]
  25b610:      	ldr	x23, [sp, #0x150]
  25b614:      	ldr	x24, [sp, #0x158]
  25b618:      	ldr	x25, [sp, #0x160]
  25b61c:      	ldr	x26, [sp, #0x168]
  25b620:      	ldr	x27, [sp, #0x170]
  25b624:      	ldr	x28, [sp, #0x178]
  25b628:      	ldr	x29, [sp, #0x10]
  25b62c:      	ldr	x30, [sp, #0x18]
  25b630:      	add	sp, sp, #0x180
  25b634:      	ret
  25b638:      	ldr	x0, [sp, #0x118]
  25b63c:      	add	x0, x24, x0
  25b640:      	ldr	x19, [sp, #0x90]
  25b644:      	add	x1, x19, #0x1
  25b648:      	lsr	w1, w1, #0
  25b64c:      	sxtw	x1, w1
  25b650:      	ldr	x2, [sp, #0x100]
  25b654:      	ldr	x3, [sp, #0x108]
  25b658:      	b	0x25b3c4 <_stogir.verify.structure+0x124>
  25b65c:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b65c:  ARM64_RELOC_PAGE21	l_stogir.37824
  25b660:      	ldr	x16, [x16]
		000000000025b660:  ARM64_RELOC_PAGEOFF12	l_stogir.37824
  25b664:      	orr	x0, x16, xzr
  25b668:      	mov	x1, #0x2c               ; =44
  25b66c:      	b	0x25b30c <_stogir.verify.structure+0x6c>
  25b670:      	mov	x11, x9
  25b674:      	movz	x9, #0x0, lsl #48
  25b678:      	cmp	x9, #0x0
  25b67c:      	b.eq	0x25beb4 <_stogir.verify.structure+0xc14>
  25b680:      	cmp	x0, #0x0
  25b684:      	b.eq	0x25bce8 <_stogir.verify.structure+0xa48>
  25b688:      	ldr	x21, [sp, #0xb8]
  25b68c:      	ldr	x0, [sp, #0xb0]
  25b690:      	ldr	x4, [sp, #0xa8]
  25b694:      	mov	x3, x7
  25b698:      	mov	x5, x11
  25b69c:      	b	0x25bc74 <_stogir.verify.structure+0x9d4>
  25b6a0:      	mov	x0, x1
  25b6a4:      	ldr	x1, [sp, #0x120]
  25b6a8:      	b	0x25b6b4 <_stogir.verify.structure+0x414>
  25b6ac:      	mov	x0, x11
  25b6b0:      	ldr	x1, [sp, #0x120]
  25b6b4:      	b	0x25b7c4 <_stogir.verify.structure+0x524>
  25b6b8:      	lsr	x3, x2, #0
  25b6bc:      	str	x1, [sp, #0xf0]
  25b6c0:      	str	x2, [sp, #0xf8]
  25b6c4:      	mov	x2, x3
  25b6c8:      	str	w28, [sp, #0xe8]
  25b6cc:      	mov	x28, x0
  25b6d0:      	mov	x0, x1
  25b6d4:      	ldr	x1, [sp, #0x48]
  25b6d8:      	bl	0x25b6d8 <_stogir.verify.structure+0x438>
		000000000025b6d8:  ARM64_RELOC_BRANCH26	_memcmp
  25b6dc:      	lsr	w0, w0, #0
  25b6e0:      	sxtw	x0, w0
  25b6e4:      	cmp	x0, #0x0
  25b6e8:      	cset	w0, eq
  25b6ec:      	ubfx	x0, x0, #0, #8
  25b6f0:      	ldr	x1, [sp, #0xf0]
  25b6f4:      	ldr	x2, [sp, #0xf8]
  25b6f8:      	b	0x25b708 <_stogir.verify.structure+0x468>
  25b6fc:      	ldr	x1, [sp, #0xf0]
  25b700:      	ldr	x2, [sp, #0xf8]
  25b704:      	movz	x0, #0x0, lsl #48
  25b708:      	cmp	x0, #0x0
  25b70c:      	b.eq	0x25b720 <_stogir.verify.structure+0x480>
  25b710:      	cmp	x28, x23
  25b714:      	cset	w0, le
  25b718:      	ubfx	x0, x0, #0, #8
  25b71c:      	b	0x25b724 <_stogir.verify.structure+0x484>
  25b720:      	movz	x0, #0x0, lsl #48
  25b724:      	cmp	x0, #0x0
  25b728:      	b.eq	0x25bec8 <_stogir.verify.structure+0xc28>
  25b72c:      	lsr	w0, w28, #0
  25b730:      	str	x1, [sp, #0x100]
  25b734:      	mov	w1, w0
  25b738:      	str	x2, [sp, #0x108]
  25b73c:      	str	x23, [sp, #0x110]
  25b740:      	mov	w23, w0
  25b744:      	ldr	w0, [sp, #0xc0]
  25b748:      	bl	0x25b748 <_stogir.verify.structure+0x4a8>
		000000000025b748:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
  25b74c:      	add	x16, sp, #0x20
  25b750:      	str	x16, [sp]
  25b754:      	ldr	w1, [sp, #0xe8]
  25b758:      	mov	w2, w23
  25b75c:      	str	x21, [sp, #0x118]
  25b760:      	mov	x21, x0
  25b764:      	mov	x0, x22
  25b768:      	bl	0x25b768 <_stogir.verify.structure+0x4c8>
		000000000025b768:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
  25b76c:      	ldr	x16, [sp]
  25b770:      	str	x0, [x16]
  25b774:      	str	x1, [x16, #0x8]
  25b778:      	add	x16, sp, #0x20
  25b77c:      	ldr	x0, [x16]
  25b780:      	add	x16, sp, #0x20
  25b784:      	ldr	x1, [x16, #0x8]
  25b788:      	lsr	w0, w0, #0
  25b78c:      	lsr	x16, x0, #0
  25b790:      	cmp	x16, #0x1
  25b794:      	b.eq	0x25b7b0 <_stogir.verify.structure+0x510>
  25b798:      	b.lo	0x25b7a0 <_stogir.verify.structure+0x500>
  25b79c:      	b	0x25b7b4 <_stogir.verify.structure+0x514>
  25b7a0:      	cmp	x16, #0x0
  25b7a4:      	b.eq	0x25b7ac <_stogir.verify.structure+0x50c>
  25b7a8:      	b	0x25b7b4 <_stogir.verify.structure+0x514>
  25b7ac:      	b	0x25b7b8 <_stogir.verify.structure+0x518>
  25b7b0:      	b	0x25b818 <_stogir.verify.structure+0x578>
  25b7b4:      	b	0x25bdf0 <_stogir.verify.structure+0xb50>
  25b7b8:      	ldr	x21, [sp, #0xb8]
  25b7bc:      	ldr	x0, [sp, #0x80]
  25b7c0:      	mov	x1, #0x17               ; =23
  25b7c4:      	add	x2, x28, #0x1
  25b7c8:      	lsr	w2, w2, #0
  25b7cc:      	sxtw	x2, w2
  25b7d0:      	ldr	x23, [sp, #0x110]
  25b7d4:      	ldr	w28, [sp, #0xe8]
  25b7d8:      	str	x21, [sp, #0xb8]
  25b7dc:      	ldr	x21, [sp, #0x118]
  25b7e0:      	fmov	d31, x0
  25b7e4:      	mov	x0, x2
  25b7e8:      	mov	x2, x1
  25b7ec:      	fmov	x1, d31
  25b7f0:      	cmp	x2, #0x0
  25b7f4:      	b.ne	0x25bedc <_stogir.verify.structure+0xc3c>
  25b7f8:      	cmp	x2, #0x0
  25b7fc:      	b.ne	0x25b6b8 <_stogir.verify.structure+0x418>
  25b800:      	str	w28, [sp, #0xe8]
  25b804:      	mov	x28, x0
  25b808:      	str	x1, [sp, #0xf0]
  25b80c:      	str	x2, [sp, #0xf8]
  25b810:      	mov	x0, #0x1                ; =1
  25b814:      	b	0x25b6f0 <_stogir.verify.structure+0x450>
  25b818:      	lsr	w21, w21, #0
  25b81c:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b81c:  ARM64_RELOC_PAGE21	l_stogir.37825
  25b820:      	ldr	x16, [x16]
		000000000025b820:  ARM64_RELOC_PAGEOFF12	l_stogir.37825
  25b824:      	ldr	w0, [x16]
  25b828:      	orr	x2, x21, xzr
  25b82c:      	cmp	x2, x0
  25b830:      	b.ne	0x25b83c <_stogir.verify.structure+0x59c>
  25b834:      	mov	x0, #0x1                ; =1
  25b838:      	b	0x25b854 <_stogir.verify.structure+0x5b4>
  25b83c:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b83c:  ARM64_RELOC_PAGE21	l_stogir.37826
  25b840:      	ldr	x16, [x16]
		000000000025b840:  ARM64_RELOC_PAGEOFF12	l_stogir.37826
  25b844:      	ldr	w0, [x16]
  25b848:      	cmp	x2, x0
  25b84c:      	cset	w0, eq
  25b850:      	ubfx	x0, x0, #0, #8
  25b854:      	lsr	w1, w1, #0
  25b858:      	sxtw	x1, w1
  25b85c:      	cmp	x1, #0x0
  25b860:      	cset	w3, gt
  25b864:      	lsl	x4, x1, #2
  25b868:      	cmp	x1, #0x0
  25b86c:      	cset	w5, lt
  25b870:      	movz	x16, #0x0, lsl #48
  25b874:      	sub	x6, x16, x1
  25b878:      	sub	x7, x6, #0x1
  25b87c:      	lsl	x8, x7, #2
  25b880:      	cmp	x0, #0x0
  25b884:      	b.eq	0x25b8cc <_stogir.verify.structure+0x62c>
  25b888:      	uxtb	w16, w3
  25b88c:      	cmp	w16, wzr
  25b890:      	b.eq	0x25bb4c <_stogir.verify.structure+0x8ac>
  25b894:      	ldr	x9, [x22, #0x8]
  25b898:      	cmp	x1, x9
  25b89c:      	b.ge	0x25bb90 <_stogir.verify.structure+0x8f0>
  25b8a0:      	ldr	x9, [x25, #0x8]
  25b8a4:      	cmp	x1, x9
  25b8a8:      	b.ge	0x25bd4c <_stogir.verify.structure+0xaac>
  25b8ac:      	ldr	x9, [x22, #0x78]
  25b8b0:      	add	x9, x4, x9
  25b8b4:      	ldr	w9, [x9]
  25b8b8:      	sxtw	x9, w9
  25b8bc:      	cmp	x9, #0x0
  25b8c0:      	cset	w9, ge
  25b8c4:      	ubfx	x9, x9, #0, #8
  25b8c8:      	b	0x25bd50 <_stogir.verify.structure+0xab0>
  25b8cc:      	ldr	x9, [sp, #0x100]
  25b8d0:      	ldr	x10, [sp, #0x108]
  25b8d4:      	movz	x7, #0x0, lsl #48
  25b8d8:      	b	0x25b8f0 <_stogir.verify.structure+0x650>
  25b8dc:      	ldr	x7, [sp, #0x100]
  25b8e0:      	ldr	x10, [sp, #0x108]
  25b8e4:      	fmov	d31, x7
  25b8e8:      	mov	x7, x9
  25b8ec:      	fmov	x9, d31
  25b8f0:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025b8f0:  ARM64_RELOC_PAGE21	l_stogir.37827
  25b8f4:      	ldr	x16, [x16]
		000000000025b8f4:  ARM64_RELOC_PAGEOFF12	l_stogir.37827
  25b8f8:      	ldr	w11, [x16]
  25b8fc:      	cmp	x2, x11
  25b900:      	b.ne	0x25bef0 <_stogir.verify.structure+0xc50>
  25b904:      	cmp	x1, #0x0
  25b908:      	b.gt	0x25baec <_stogir.verify.structure+0x84c>
  25b90c:      	ldr	x12, [sp, #0xc8]
  25b910:      	ldr	x2, [sp, #0xd0]
  25b914:      	mov	x11, x9
  25b918:      	movz	x9, #0x0, lsl #48
  25b91c:      	lsr	w9, w9, #0
  25b920:      	lsr	x16, x9, #0
  25b924:      	cmp	x16, #0x1
  25b928:      	b.eq	0x25b944 <_stogir.verify.structure+0x6a4>
  25b92c:      	b.lo	0x25b934 <_stogir.verify.structure+0x694>
  25b930:      	b	0x25b948 <_stogir.verify.structure+0x6a8>
  25b934:      	cmp	x16, #0x0
  25b938:      	b.eq	0x25b940 <_stogir.verify.structure+0x6a0>
  25b93c:      	b	0x25b948 <_stogir.verify.structure+0x6a8>
  25b940:      	b	0x25b94c <_stogir.verify.structure+0x6ac>
  25b944:      	b	0x25b958 <_stogir.verify.structure+0x6b8>
  25b948:      	b	0x25be50 <_stogir.verify.structure+0xbb0>
  25b94c:      	ldr	x9, [sp, #0x38]
  25b950:      	mov	x10, #0x21              ; =33
  25b954:      	b	0x25b95c <_stogir.verify.structure+0x6bc>
  25b958:      	mov	x9, x11
  25b95c:      	cmp	x21, #0xf
  25b960:      	b.hs	0x25b670 <_stogir.verify.structure+0x3d0>
  25b964:      	mov	x16, #0x1               ; =1
  25b968:      	lsl	x11, x16, x21
  25b96c:      	lsr	w11, w11, #0
  25b970:      	mov	x17, #0x5e1c            ; =24092
  25b974:      	and	x11, x11, x17
  25b978:      	lsr	w11, w11, #0
  25b97c:      	cmp	x11, #0x0
  25b980:      	cset	w11, eq
  25b984:      	uxtb	w16, w11
  25b988:      	cmp	w16, wzr
  25b98c:      	cset	x11, eq
  25b990:      	fmov	d31, x9
  25b994:      	mov	x9, x11
  25b998:      	fmov	x11, d31
  25b99c:      	b	0x25b678 <_stogir.verify.structure+0x3d8>
  25b9a0:      	lsr	w0, w21, #0
  25b9a4:      	lsr	w28, w0, #0
  25b9a8:      	cmp	x20, #0x78
  25b9ac:      	cset	w20, eq
  25b9b0:      	cmp	x19, #0x0
  25b9b4:      	cset	w19, eq
  25b9b8:      	mov	x2, x1
  25b9bc:      	ldr	x1, [sp, #0xd8]
  25b9c0:      	mov	x0, #0x1                ; =1
  25b9c4:      	b	0x25b7f0 <_stogir.verify.structure+0x550>
  25b9c8:      	ldr	x0, [sp, #0x78]
  25b9cc:      	mov	x1, #0x1b               ; =27
  25b9d0:      	b	0x25ba64 <_stogir.verify.structure+0x7c4>
  25b9d4:      	lsr	x3, x2, #0
  25b9d8:      	str	x1, [sp, #0xd8]
  25b9dc:      	str	x2, [sp, #0xe0]
  25b9e0:      	mov	x2, x3
  25b9e4:      	str	x28, [sp, #0xd0]
  25b9e8:      	mov	x28, x0
  25b9ec:      	mov	x0, x1
  25b9f0:      	ldr	x1, [sp, #0x48]
  25b9f4:      	bl	0x25b9f4 <_stogir.verify.structure+0x754>
		000000000025b9f4:  ARM64_RELOC_BRANCH26	_memcmp
  25b9f8:      	lsr	w0, w0, #0
  25b9fc:      	sxtw	x0, w0
  25ba00:      	cmp	x0, #0x0
  25ba04:      	cset	w0, eq
  25ba08:      	ubfx	x0, x0, #0, #8
  25ba0c:      	ldr	x1, [sp, #0xe0]
  25ba10:      	b	0x25ba1c <_stogir.verify.structure+0x77c>
  25ba14:      	ldr	x1, [sp, #0xe0]
  25ba18:      	movz	x0, #0x0, lsl #48
  25ba1c:      	cmp	x0, #0x0
  25ba20:      	b.eq	0x25ba34 <_stogir.verify.structure+0x794>
  25ba24:      	cmp	x28, x24
  25ba28:      	cset	w0, lt
  25ba2c:      	ubfx	x0, x0, #0, #8
  25ba30:      	b	0x25ba38 <_stogir.verify.structure+0x798>
  25ba34:      	movz	x0, #0x0, lsl #48
  25ba38:      	cmp	x0, #0x0
  25ba3c:      	b.eq	0x25b9a0 <_stogir.verify.structure+0x700>
  25ba40:      	add	x0, x28, x21
  25ba44:      	ldr	x2, [x22, #0x78]
  25ba48:      	lsl	x0, x0, #2
  25ba4c:      	add	x0, x0, x2
  25ba50:      	ldr	w0, [x0]
  25ba54:      	sxtw	x0, w0
  25ba58:      	cmn	x0, #0x1
  25ba5c:      	b.ne	0x25b9c8 <_stogir.verify.structure+0x728>
  25ba60:      	ldr	x0, [sp, #0xd8]
  25ba64:      	add	x2, x28, #0x1
  25ba68:      	ldr	x28, [sp, #0xd0]
  25ba6c:      	fmov	d31, x0
  25ba70:      	mov	x0, x2
  25ba74:      	mov	x2, x1
  25ba78:      	fmov	x1, d31
  25ba7c:      	cmp	x2, #0x0
  25ba80:      	b.ne	0x25befc <_stogir.verify.structure+0xc5c>
  25ba84:      	cmp	x2, #0x0
  25ba88:      	b.ne	0x25b9d4 <_stogir.verify.structure+0x734>
  25ba8c:      	str	x28, [sp, #0xd0]
  25ba90:      	mov	x28, x0
  25ba94:      	str	x1, [sp, #0xd8]
  25ba98:      	str	x2, [sp, #0xe0]
  25ba9c:      	mov	x0, #0x1                ; =1
  25baa0:      	b	0x25ba0c <_stogir.verify.structure+0x76c>
  25baa4:      	ldr	x0, [sp, #0x98]
  25baa8:      	ldr	x1, [sp, #0xa0]
  25baac:      	add	x2, x23, #0x4
  25bab0:      	ldr	x3, [x22, #0x8]
  25bab4:      	asr	x16, x2, #63
  25bab8:      	lsr	x16, x16, #62
  25babc:      	add	x2, x2, x16
  25bac0:      	asr	x2, x2, #2
  25bac4:      	orr	x24, x2, xzr
  25bac8:      	add	x2, x24, x21
  25bacc:      	cmp	x2, x3
  25bad0:      	b.le	0x25badc <_stogir.verify.structure+0x83c>
  25bad4:      	ldr	x0, [sp, #0x70]
  25bad8:      	mov	x1, #0x15               ; =21
  25badc:      	mov	x2, x1
  25bae0:      	mov	x1, x0
  25bae4:      	mov	x0, #0x1                ; =1
  25bae8:      	b	0x25ba7c <_stogir.verify.structure+0x7dc>
  25baec:      	ldr	x2, [sp, #0xd0]
  25baf0:      	ldr	x11, [x2, #0x8]
  25baf4:      	cmp	x1, x11
  25baf8:      	b.gt	0x25bf10 <_stogir.verify.structure+0xc70>
  25bafc:      	sub	x11, x1, #0x1
  25bb00:      	ldr	x12, [sp, #0xc8]
  25bb04:      	ldr	x13, [x12, #0x28]
  25bb08:      	mov	x17, #0x18              ; =24
  25bb0c:      	mul	x11, x11, x17
  25bb10:      	add	x11, x11, x13
  25bb14:      	ldr	x13, [x11]
  25bb18:      	ldr	x11, [x11, #0x8]
  25bb1c:      	ldr	x14, [x12, #0x8]
  25bb20:      	cmp	x13, #0x0
  25bb24:      	b.lt	0x25bd30 <_stogir.verify.structure+0xa90>
  25bb28:      	cmp	x13, x14
  25bb2c:      	b.gt	0x25bd30 <_stogir.verify.structure+0xa90>
  25bb30:      	cmp	x11, #0x0
  25bb34:      	b.lt	0x25bd30 <_stogir.verify.structure+0xa90>
  25bb38:      	sub	x13, x14, x13
  25bb3c:      	cmp	x11, x13
  25bb40:      	b.gt	0x25bd30 <_stogir.verify.structure+0xa90>
  25bb44:      	mov	x11, #0x1               ; =1
  25bb48:      	b	0x25bd34 <_stogir.verify.structure+0xa94>
  25bb4c:      	uxtb	w16, w5
  25bb50:      	cmp	w16, wzr
  25bb54:      	b.eq	0x25bb98 <_stogir.verify.structure+0x8f8>
  25bb58:      	ldr	x9, [x26, #0x8]
  25bb5c:      	ldr	x10, [x27, #0x8]
  25bb60:      	cmp	x9, x10
  25bb64:      	b.ne	0x25bd44 <_stogir.verify.structure+0xaa4>
  25bb68:      	cmp	x6, x9
  25bb6c:      	b.gt	0x25bdbc <_stogir.verify.structure+0xb1c>
  25bb70:      	ldr	x9, [x22, #0x50]
  25bb74:      	add	x9, x8, x9
  25bb78:      	ldr	w9, [x9]
  25bb7c:      	sxtw	x9, w9
  25bb80:      	cmp	x9, #0x0
  25bb84:      	cset	w9, gt
  25bb88:      	ubfx	x9, x9, #0, #8
  25bb8c:      	b	0x25bdc0 <_stogir.verify.structure+0xb20>
  25bb90:      	movz	x9, #0x0, lsl #48
  25bb94:      	b	0x25bb9c <_stogir.verify.structure+0x8fc>
  25bb98:      	movz	x9, #0x0, lsl #48
  25bb9c:      	cmp	x9, #0x0
  25bba0:      	b.eq	0x25bbd0 <_stogir.verify.structure+0x930>
  25bba4:      	uxtb	w16, w3
  25bba8:      	cmp	w16, wzr
  25bbac:      	b.eq	0x25bbc0 <_stogir.verify.structure+0x920>
  25bbb0:      	lsl	x7, x1, #4
  25bbb4:      	ldr	x9, [x22]
  25bbb8:      	add	x7, x7, x9
  25bbbc:      	b	0x25bbcc <_stogir.verify.structure+0x92c>
  25bbc0:      	lsl	x7, x7, #4
  25bbc4:      	ldr	x9, [x22, #0x28]
  25bbc8:      	add	x7, x7, x9
  25bbcc:      	b	0x25bbd4 <_stogir.verify.structure+0x934>
  25bbd0:      	movz	x7, #0x0, lsl #48
  25bbd4:      	cmp	x7, #0x0
  25bbd8:      	cset	w9, eq
  25bbdc:      	uxtb	w16, w9
  25bbe0:      	cmp	w16, wzr
  25bbe4:      	cset	x9, eq
  25bbe8:      	cmp	x9, #0x0
  25bbec:      	b.eq	0x25b8dc <_stogir.verify.structure+0x63c>
  25bbf0:      	ldr	w7, [x7]
  25bbf4:      	uxtb	w7, w7
  25bbf8:      	cmp	x7, #0x48
  25bbfc:      	b.ne	0x25b8dc <_stogir.verify.structure+0x63c>
  25bc00:      	ldr	x7, [sp, #0x30]
  25bc04:      	mov	x10, #0x25              ; =37
  25bc08:      	b	0x25b8e4 <_stogir.verify.structure+0x644>
  25bc0c:      	ldr	w0, [sp, #0xc0]
  25bc10:      	bl	0x25bc10 <_stogir.verify.structure+0x970>
		000000000025bc10:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
  25bc14:      	lsr	w0, w0, #0
  25bc18:      	sxtw	x0, w0
  25bc1c:      	cmn	x0, #0x1
  25bc20:      	b.ne	0x25baa4 <_stogir.verify.structure+0x804>
  25bc24:      	ubfx	x0, x24, #16, #16
  25bc28:      	cmp	x23, x0
  25bc2c:      	b.eq	0x25baa4 <_stogir.verify.structure+0x804>
  25bc30:      	ldr	x0, [sp, #0x68]
  25bc34:      	mov	x1, #0x24               ; =36
  25bc38:      	b	0x25baac <_stogir.verify.structure+0x80c>
  25bc3c:      	mov	x0, #0x1                ; =1
  25bc40:      	cmp	x0, #0x0
  25bc44:      	b.eq	0x25b6a0 <_stogir.verify.structure+0x400>
  25bc48:      	ldr	x0, [sp, #0x40]
  25bc4c:      	mov	x1, #0x1a               ; =26
  25bc50:      	b	0x25b6a8 <_stogir.verify.structure+0x408>
  25bc54:      	movz	x0, #0x0, lsl #48
  25bc58:      	ldr	x1, [sp, #0x128]
  25bc5c:      	cmp	x0, #0x0
  25bc60:      	b.eq	0x25bc3c <_stogir.verify.structure+0x99c>
  25bc64:      	movz	x0, #0x0, lsl #48
  25bc68:      	b	0x25bc40 <_stogir.verify.structure+0x9a0>
  25bc6c:      	movz	x3, #0x0, lsl #48
  25bc70:      	mov	x5, x11
  25bc74:      	cmp	x3, #0x0
  25bc78:      	b.eq	0x25bc9c <_stogir.verify.structure+0x9fc>
  25bc7c:      	str	x12, [sp, #0xc8]
  25bc80:      	str	x2, [sp, #0xd0]
  25bc84:      	str	x0, [sp, #0xb0]
  25bc88:      	str	x4, [sp, #0xa8]
  25bc8c:      	str	x10, [sp, #0x120]
  25bc90:      	mov	x1, x5
  25bc94:      	mov	x0, #0x1                ; =1
  25bc98:      	b	0x25bc5c <_stogir.verify.structure+0x9bc>
  25bc9c:      	cmp	x1, #0x0
  25bca0:      	b.ne	0x25bf18 <_stogir.verify.structure+0xc78>
  25bca4:      	mov	w1, w23
  25bca8:      	str	x2, [sp, #0xd0]
  25bcac:      	str	x12, [sp, #0xc8]
  25bcb0:      	str	x10, [sp, #0x120]
  25bcb4:      	str	x0, [sp, #0xb0]
  25bcb8:      	ldr	w0, [sp, #0xc0]
  25bcbc:      	str	x4, [sp, #0xa8]
  25bcc0:      	str	x5, [sp, #0x128]
  25bcc4:      	bl	0x25bcc4 <_stogir.verify.structure+0xa24>
		000000000025bcc4:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
  25bcc8:      	lsr	w0, w0, #0
  25bccc:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025bccc:  ARM64_RELOC_PAGE21	l_stogir.37828
  25bcd0:      	ldr	x16, [x16]
		000000000025bcd0:  ARM64_RELOC_PAGEOFF12	l_stogir.37828
  25bcd4:      	ldr	w1, [x16]
  25bcd8:      	cmp	x0, x1
  25bcdc:      	b.ne	0x25bdc4 <_stogir.verify.structure+0xb24>
  25bce0:      	mov	x0, #0x1                ; =1
  25bce4:      	b	0x25bd58 <_stogir.verify.structure+0xab8>
  25bce8:      	uxtb	w16, w3
  25bcec:      	cmp	w16, wzr
  25bcf0:      	b.eq	0x25bf34 <_stogir.verify.structure+0xc94>
  25bcf4:      	ldr	x0, [x22, #0x8]
  25bcf8:      	cmp	x1, x0
  25bcfc:      	b.ge	0x25bf3c <_stogir.verify.structure+0xc9c>
  25bd00:      	ldr	x21, [sp, #0xb8]
  25bd04:      	ldr	x0, [x21, #0x8]
  25bd08:      	cmp	x1, x0
  25bd0c:      	b.ge	0x25bde8 <_stogir.verify.structure+0xb48>
  25bd10:      	ldr	x0, [x22, #0x78]
  25bd14:      	add	x0, x4, x0
  25bd18:      	ldr	w0, [x0]
  25bd1c:      	sxtw	x0, w0
  25bd20:      	cmp	x0, #0x0
  25bd24:      	cset	w0, ge
  25bd28:      	ubfx	x0, x0, #0, #8
  25bd2c:      	b	0x25bdec <_stogir.verify.structure+0xb4c>
  25bd30:      	movz	x11, #0x0, lsl #48
  25bd34:      	fmov	d31, x9
  25bd38:      	mov	x9, x11
  25bd3c:      	fmov	x11, d31
  25bd40:      	b	0x25b91c <_stogir.verify.structure+0x67c>
  25bd44:      	movz	x9, #0x0, lsl #48
  25bd48:      	b	0x25bb9c <_stogir.verify.structure+0x8fc>
  25bd4c:      	movz	x9, #0x0, lsl #48
  25bd50:      	b	0x25bb94 <_stogir.verify.structure+0x8f4>
  25bd54:      	movz	x0, #0x0, lsl #48
  25bd58:      	b	0x25bc58 <_stogir.verify.structure+0x9b8>
  25bd5c:      	movz	x0, #0x0, lsl #48
  25bd60:      	ldr	x4, [sp, #0xa8]
  25bd64:      	mov	x3, x0
  25bd68:      	ldr	x0, [sp, #0xb0]
  25bd6c:      	b	0x25bc70 <_stogir.verify.structure+0x9d0>
  25bd70:      	uxtb	w16, w5
  25bd74:      	cmp	w16, wzr
  25bd78:      	b.eq	0x25bf44 <_stogir.verify.structure+0xca4>
  25bd7c:      	ldr	x0, [sp, #0xb0]
  25bd80:      	ldr	x3, [x0, #0x8]
  25bd84:      	ldr	x4, [sp, #0xa8]
  25bd88:      	ldr	x5, [x4, #0x8]
  25bd8c:      	cmp	x3, x5
  25bd90:      	b.ne	0x25bde0 <_stogir.verify.structure+0xb40>
  25bd94:      	cmp	x6, x3
  25bd98:      	b.gt	0x25be14 <_stogir.verify.structure+0xb74>
  25bd9c:      	ldr	x3, [x22, #0x50]
  25bda0:      	add	x3, x8, x3
  25bda4:      	ldr	w3, [x3]
  25bda8:      	sxtw	x3, w3
  25bdac:      	cmp	x3, #0x0
  25bdb0:      	cset	w3, gt
  25bdb4:      	ubfx	x3, x3, #0, #8
  25bdb8:      	b	0x25be18 <_stogir.verify.structure+0xb78>
  25bdbc:      	movz	x9, #0x0, lsl #48
  25bdc0:      	b	0x25bd48 <_stogir.verify.structure+0xaa8>
  25bdc4:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025bdc4:  ARM64_RELOC_PAGE21	l_stogir.37829
  25bdc8:      	ldr	x16, [x16]
		000000000025bdc8:  ARM64_RELOC_PAGEOFF12	l_stogir.37829
  25bdcc:      	ldr	w1, [x16]
  25bdd0:      	cmp	x0, x1
  25bdd4:      	b.ne	0x25bdf8 <_stogir.verify.structure+0xb58>
  25bdd8:      	mov	x0, #0x1                ; =1
  25bddc:      	b	0x25bd58 <_stogir.verify.structure+0xab8>
  25bde0:      	movz	x3, #0x0, lsl #48
  25bde4:      	b	0x25bc70 <_stogir.verify.structure+0x9d0>
  25bde8:      	movz	x0, #0x0, lsl #48
  25bdec:      	b	0x25bd60 <_stogir.verify.structure+0xac0>
  25bdf0:      	brk	#0
  25bdf4:      	b	0x25bdf0 <_stogir.verify.structure+0xb50>
  25bdf8:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x1e88>
		000000000025bdf8:  ARM64_RELOC_PAGE21	l_stogir.37830
  25bdfc:      	ldr	x16, [x16]
		000000000025bdfc:  ARM64_RELOC_PAGEOFF12	l_stogir.37830
  25be00:      	ldr	w1, [x16]
  25be04:      	cmp	x0, x1
  25be08:      	b.ne	0x25be1c <_stogir.verify.structure+0xb7c>
  25be0c:      	mov	x0, #0x1                ; =1
  25be10:      	b	0x25bd58 <_stogir.verify.structure+0xab8>
  25be14:      	movz	x3, #0x0, lsl #48
  25be18:      	b	0x25bde4 <_stogir.verify.structure+0xb44>
  25be1c:      	uxtb	w16, w20
  25be20:      	cmp	w16, wzr
  25be24:      	b.eq	0x25bd54 <_stogir.verify.structure+0xab4>
  25be28:      	uxtb	w16, w19
  25be2c:      	cmp	w16, wzr
  25be30:      	b.eq	0x25be48 <_stogir.verify.structure+0xba8>
  25be34:      	sxtw	x23, w23
  25be38:      	cmp	x23, #0x2
  25be3c:      	cset	w0, eq
  25be40:      	ubfx	x0, x0, #0, #8
  25be44:      	b	0x25be4c <_stogir.verify.structure+0xbac>
  25be48:      	movz	x0, #0x0, lsl #48
  25be4c:      	b	0x25bd58 <_stogir.verify.structure+0xab8>
  25be50:      	brk	#0
  25be54:      	b	0x25be50 <_stogir.verify.structure+0xbb0>
  25be58:      	ldr	x19, [sp, #0x90]
  25be5c:      	b	0x25b5b4 <_stogir.verify.structure+0x314>
  25be60:      	ldr	x19, [sp, #0x90]
  25be64:      	b	0x25b5b4 <_stogir.verify.structure+0x314>
  25be68:      	mov	x0, x21
  25be6c:      	str	x19, [sp, #0xc8]
  25be70:      	ldr	x19, [sp, #0x90]
  25be74:      	str	x28, [sp, #0xd0]
  25be78:      	mov	x21, x20
  25be7c:      	str	x23, [sp, #0xb0]
  25be80:      	str	x24, [sp, #0xa8]
  25be84:      	b	0x25b3e4 <_stogir.verify.structure+0x144>
  25be88:      	mov	x0, x21
  25be8c:      	str	x19, [sp, #0xc8]
  25be90:      	ldr	x19, [sp, #0x90]
  25be94:      	str	x28, [sp, #0xd0]
  25be98:      	ldr	x21, [sp, #0xb8]
  25be9c:      	b	0x25b3b8 <_stogir.verify.structure+0x118>
  25bea0:      	mov	x0, x21
  25bea4:      	ldr	x19, [sp, #0x90]
  25bea8:      	str	x28, [sp, #0xd0]
  25beac:      	ldr	x21, [sp, #0xb8]
  25beb0:      	b	0x25b3b8 <_stogir.verify.structure+0x118>
  25beb4:      	str	x12, [sp, #0xc8]
  25beb8:      	str	x2, [sp, #0xd0]
  25bebc:      	ldr	x21, [sp, #0xb8]
  25bec0:      	str	x10, [sp, #0x120]
  25bec4:      	b	0x25b6ac <_stogir.verify.structure+0x40c>
  25bec8:      	str	x21, [sp, #0x118]
  25becc:      	ldr	x21, [sp, #0xb8]
  25bed0:      	str	x1, [sp, #0x100]
  25bed4:      	str	x2, [sp, #0x108]
  25bed8:      	b	0x25b638 <_stogir.verify.structure+0x398>
  25bedc:      	str	w28, [sp, #0xe8]
  25bee0:      	mov	x28, x0
  25bee4:      	str	x1, [sp, #0xf0]
  25bee8:      	str	x2, [sp, #0xf8]
  25beec:      	b	0x25b6fc <_stogir.verify.structure+0x45c>
  25bef0:      	ldr	x12, [sp, #0xc8]
  25bef4:      	ldr	x2, [sp, #0xd0]
  25bef8:      	b	0x25b95c <_stogir.verify.structure+0x6bc>
  25befc:      	str	x28, [sp, #0xd0]
  25bf00:      	mov	x28, x0
  25bf04:      	str	x1, [sp, #0xd8]
  25bf08:      	str	x2, [sp, #0xe0]
  25bf0c:      	b	0x25ba14 <_stogir.verify.structure+0x774>
  25bf10:      	ldr	x12, [sp, #0xc8]
  25bf14:      	b	0x25b914 <_stogir.verify.structure+0x674>
  25bf18:      	str	x12, [sp, #0xc8]
  25bf1c:      	str	x2, [sp, #0xd0]
  25bf20:      	str	x0, [sp, #0xb0]
  25bf24:      	str	x4, [sp, #0xa8]
  25bf28:      	str	x5, [sp, #0x128]
  25bf2c:      	str	x10, [sp, #0x120]
  25bf30:      	b	0x25bc54 <_stogir.verify.structure+0x9b4>
  25bf34:      	ldr	x21, [sp, #0xb8]
  25bf38:      	b	0x25bd70 <_stogir.verify.structure+0xad0>
  25bf3c:      	ldr	x21, [sp, #0xb8]
  25bf40:      	b	0x25bd5c <_stogir.verify.structure+0xabc>
  25bf44:      	ldr	x0, [sp, #0xb0]
  25bf48:      	ldr	x4, [sp, #0xa8]
  25bf4c:      	b	0x25bc6c <_stogir.verify.structure+0x9cc>
