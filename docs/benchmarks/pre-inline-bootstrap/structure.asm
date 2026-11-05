
build/bootstrap-pre-inline/stogir-0.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000000025b0a0 <_stogir.verify.structure>:
  25b0a0:      	sub	sp, sp, #0x170
  25b0a4:      	str	x29, [sp, #0x10]
  25b0a8:      	str	x30, [sp, #0x18]
  25b0ac:      	add	x29, sp, #0x10
  25b0b0:      	str	x19, [sp, #0x120]
  25b0b4:      	str	x20, [sp, #0x128]
  25b0b8:      	str	x21, [sp, #0x130]
  25b0bc:      	str	x22, [sp, #0x138]
  25b0c0:      	str	x23, [sp, #0x140]
  25b0c4:      	str	x24, [sp, #0x148]
  25b0c8:      	str	x25, [sp, #0x150]
  25b0cc:      	str	x26, [sp, #0x158]
  25b0d0:      	str	x27, [sp, #0x160]
  25b0d4:      	str	x28, [sp, #0x168]
  25b0d8:      	add	x1, x0, #0x78
  25b0dc:      	ldr	x2, [x0, #0x8]
  25b0e0:      	ldr	x1, [x1, #0x8]
  25b0e4:      	cmp	x2, x1
  25b0e8:      	b.ne	0x25b124 <_stogir.verify.structure+0x84>
  25b0ec:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b0ec:  ARM64_RELOC_PAGE21	l_stogir.37952
  25b0f0:      	ldr	x16, [x16]
		000000000025b0f0:  ARM64_RELOC_PAGEOFF12	l_stogir.37952
  25b0f4:      	orr	x1, x16, xzr
  25b0f8:      	movz	x2, #0x0, lsl #48
  25b0fc:      	b	0x25b134 <_stogir.verify.structure+0x94>
  25b100:      	ldr	x0, [sp, #0x30]
  25b104:      	add	x0, x21, x0
  25b108:      	ldr	x1, [sp, #0xa8]
  25b10c:      	add	x1, x1, #0x1
  25b110:      	lsr	w1, w1, #0
  25b114:      	sxtw	x1, w1
  25b118:      	ldr	x2, [sp, #0x100]
  25b11c:      	ldr	x3, [sp, #0xf8]
  25b120:      	b	0x25b1e8 <_stogir.verify.structure+0x148>
  25b124:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b124:  ARM64_RELOC_PAGE21	l_stogir.37953
  25b128:      	ldr	x16, [x16]
		000000000025b128:  ARM64_RELOC_PAGEOFF12	l_stogir.37953
  25b12c:      	orr	x1, x16, xzr
  25b130:      	mov	x2, #0x2c               ; =44
  25b134:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b134:  ARM64_RELOC_PAGE21	l_stogir.37954
  25b138:      	ldr	x16, [x16]
		000000000025b138:  ARM64_RELOC_PAGEOFF12	l_stogir.37954
  25b13c:      	orr	x19, x16, xzr
  25b140:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b140:  ARM64_RELOC_PAGE21	l_stogir.37955
  25b144:      	ldr	x16, [x16]
		000000000025b144:  ARM64_RELOC_PAGEOFF12	l_stogir.37955
  25b148:      	orr	x20, x16, xzr
  25b14c:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b14c:  ARM64_RELOC_PAGE21	l_stogir.37956
  25b150:      	ldr	x16, [x16]
		000000000025b150:  ARM64_RELOC_PAGEOFF12	l_stogir.37956
  25b154:      	orr	x21, x16, xzr
  25b158:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b158:  ARM64_RELOC_PAGE21	l_stogir.37957
  25b15c:      	ldr	x16, [x16]
		000000000025b15c:  ARM64_RELOC_PAGEOFF12	l_stogir.37957
  25b160:      	orr	x22, x16, xzr
  25b164:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b164:  ARM64_RELOC_PAGE21	l_stogir.37958
  25b168:      	ldr	x16, [x16]
		000000000025b168:  ARM64_RELOC_PAGEOFF12	l_stogir.37958
  25b16c:      	orr	x23, x16, xzr
  25b170:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b170:  ARM64_RELOC_PAGE21	l_stogir.37959
  25b174:      	ldr	x16, [x16]
		000000000025b174:  ARM64_RELOC_PAGEOFF12	l_stogir.37959
  25b178:      	orr	x24, x16, xzr
  25b17c:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b17c:  ARM64_RELOC_PAGE21	l_stogir.37960
  25b180:      	ldr	x16, [x16]
		000000000025b180:  ARM64_RELOC_PAGEOFF12	l_stogir.37960
  25b184:      	orr	x25, x16, xzr
  25b188:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b188:  ARM64_RELOC_PAGE21	l_stogir.37961
  25b18c:      	ldr	x16, [x16]
		000000000025b18c:  ARM64_RELOC_PAGEOFF12	l_stogir.37961
  25b190:      	orr	x26, x16, xzr
  25b194:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b194:  ARM64_RELOC_PAGE21	l_stogir.37962
  25b198:      	ldr	x16, [x16]
		000000000025b198:  ARM64_RELOC_PAGEOFF12	l_stogir.37962
  25b19c:      	orr	x27, x16, xzr
  25b1a0:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b1a0:  ARM64_RELOC_PAGE21	l_stogir.37963
  25b1a4:      	ldr	x16, [x16]
		000000000025b1a4:  ARM64_RELOC_PAGEOFF12	l_stogir.37963
  25b1a8:      	orr	x28, x16, xzr
  25b1ac:      	add	x3, x0, #0x110
  25b1b0:      	add	x4, x0, #0x78
  25b1b4:      	add	x5, x0, #0x28
  25b1b8:      	add	x6, x0, #0x50
  25b1bc:      	add	x7, x0, #0x78
  25b1c0:      	add	x9, x0, #0x28
  25b1c4:      	add	x10, x0, #0x50
  25b1c8:      	add	x11, x3, #0x28
  25b1cc:      	mov	x12, x1
  25b1d0:      	mov	x13, x2
  25b1d4:      	mov	x1, #0x1                ; =1
  25b1d8:      	movz	x2, #0x0, lsl #48
  25b1dc:      	b	0x25b2b0 <_stogir.verify.structure+0x210>
  25b1e0:      	ldr	x2, [sp, #0x58]
  25b1e4:      	mov	x3, #0x16               ; =22
  25b1e8:      	b	0x25b250 <_stogir.verify.structure+0x1b0>
  25b1ec:      	nop
  25b1f0:      	mov	x1, x2
  25b1f4:      	str	x8, [sp, #0xa0]
  25b1f8:      	str	x19, [sp, #0x50]
  25b1fc:      	str	x20, [sp, #0x58]
  25b200:      	mov	x20, x0
  25b204:      	ldr	x0, [sp, #0x30]
  25b208:      	str	x21, [sp, #0x60]
  25b20c:      	str	x22, [sp, #0x68]
  25b210:      	str	x23, [sp, #0x70]
  25b214:      	str	x24, [sp, #0x78]
  25b218:      	str	x25, [sp, #0x80]
  25b21c:      	str	x26, [sp, #0x88]
  25b220:      	str	x27, [sp, #0x90]
  25b224:      	str	x28, [sp, #0x98]
  25b228:      	str	x3, [sp, #0xd8]
  25b22c:      	str	x11, [sp, #0xe0]
  25b230:      	mov	x19, x4
  25b234:      	str	x5, [sp, #0xc8]
  25b238:      	str	x6, [sp, #0xc0]
  25b23c:      	mov	x25, x7
  25b240:      	mov	x26, x9
  25b244:      	mov	x27, x10
  25b248:      	ldr	x2, [sp, #0x50]
  25b24c:      	mov	x3, #0x23               ; =35
  25b250:      	ldr	x8, [sp, #0xa0]
  25b254:      	ldr	x21, [sp, #0x60]
  25b258:      	ldr	x22, [sp, #0x68]
  25b25c:      	ldr	x23, [sp, #0x70]
  25b260:      	ldr	x24, [sp, #0x78]
  25b264:      	ldr	x28, [sp, #0x98]
  25b268:      	ldr	x11, [sp, #0xe0]
  25b26c:      	mov	x4, x19
  25b270:      	ldr	x19, [sp, #0x50]
  25b274:      	ldr	x5, [sp, #0xc8]
  25b278:      	ldr	x6, [sp, #0xc0]
  25b27c:      	mov	x7, x25
  25b280:      	ldr	x25, [sp, #0x80]
  25b284:      	mov	x9, x26
  25b288:      	ldr	x26, [sp, #0x88]
  25b28c:      	mov	x10, x27
  25b290:      	ldr	x27, [sp, #0x90]
  25b294:      	mov	x12, x2
  25b298:      	mov	x2, x1
  25b29c:      	mov	x1, x0
  25b2a0:      	mov	x0, x20
  25b2a4:      	ldr	x20, [sp, #0x58]
  25b2a8:      	mov	x13, x3
  25b2ac:      	ldr	x3, [sp, #0xd8]
  25b2b0:      	cmp	x13, #0x0
  25b2b4:      	b.ne	0x25bb3c <_stogir.verify.structure+0xa9c>
  25b2b8:      	ldr	x14, [x0, #0x8]
  25b2bc:      	cmp	x1, x14
  25b2c0:      	b.ge	0x25bb50 <_stogir.verify.structure+0xab0>
  25b2c4:      	lsl	x14, x1, #4
  25b2c8:      	lsl	x15, x1, #2
  25b2cc:      	str	x1, [sp, #0x30]
  25b2d0:      	ldr	x1, [x0]
  25b2d4:      	add	x1, x14, x1
  25b2d8:      	ldr	x1, [x1]
  25b2dc:      	ldr	x14, [x0, #0x78]
  25b2e0:      	add	x14, x15, x14
  25b2e4:      	ldr	w14, [x14]
  25b2e8:      	sxtw	x14, w14
  25b2ec:      	cmp	x14, #0x0
  25b2f0:      	b.lt	0x25b1f0 <_stogir.verify.structure+0x150>
  25b2f4:      	mov	x17, #0xffff            ; =65535
  25b2f8:      	cmp	x14, x17
  25b2fc:      	b.gt	0x25bb64 <_stogir.verify.structure+0xac4>
  25b300:      	uxtb	w15, w1
  25b304:      	str	x0, [sp, #0x38]
  25b308:      	orr	x0, x15, xzr
  25b30c:      	cmp	x0, #0x83
  25b310:      	b.ge	0x25bbc0 <_stogir.verify.structure+0xb20>
  25b314:      	lsr	w1, w1, #0
  25b318:      	str	x0, [sp, #0x40]
  25b31c:      	ubfx	x0, x1, #8, #8
  25b320:      	str	w0, [sp, #0x48]
  25b324:      	lsr	w0, w0, #0
  25b328:      	str	x8, [sp, #0xa0]
  25b32c:      	str	x3, [sp, #0xd8]
  25b330:      	str	x4, [sp, #0xd0]
  25b334:      	str	x5, [sp, #0xc8]
  25b338:      	str	x6, [sp, #0xc0]
  25b33c:      	str	x11, [sp, #0xe0]
  25b340:      	str	x2, [sp, #0xa8]
  25b344:      	str	x12, [sp, #0xb0]
  25b348:      	str	x13, [sp, #0xb8]
  25b34c:      	str	x19, [sp, #0x50]
  25b350:      	ldr	x19, [sp, #0x30]
  25b354:      	str	x20, [sp, #0x58]
  25b358:      	ldr	x20, [sp, #0x38]
  25b35c:      	str	x21, [sp, #0x60]
  25b360:      	mov	x21, x1
  25b364:      	str	x22, [sp, #0x68]
  25b368:      	ldr	x22, [sp, #0x40]
  25b36c:      	str	x23, [sp, #0x70]
  25b370:      	mov	w23, w15
  25b374:      	str	x24, [sp, #0x78]
  25b378:      	mov	x24, x14
  25b37c:      	str	x25, [sp, #0x80]
  25b380:      	mov	x25, x7
  25b384:      	str	x26, [sp, #0x88]
  25b388:      	mov	x26, x9
  25b38c:      	str	x27, [sp, #0x90]
  25b390:      	mov	x27, x10
  25b394:      	str	x28, [sp, #0x98]
  25b398:      	ldr	w28, [sp, #0x48]
  25b39c:      	bl	0x25b39c <_stogir.verify.structure+0x2fc>
		000000000025b39c:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
  25b3a0:      	cmp	x0, #0x0
  25b3a4:      	b.eq	0x25bc1c <_stogir.verify.structure+0xb7c>
  25b3a8:      	lsr	w23, w23, #0
  25b3ac:      	mov	w0, w23
  25b3b0:      	bl	0x25b3b0 <_stogir.verify.structure+0x310>
		000000000025b3b0:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
  25b3b4:      	lsr	w0, w0, #0
  25b3b8:      	sxtw	x0, w0
  25b3bc:      	cmp	x0, #0x0
  25b3c0:      	b.lt	0x25b8f0 <_stogir.verify.structure+0x850>
  25b3c4:      	mov	w0, w23
  25b3c8:      	bl	0x25b3c8 <_stogir.verify.structure+0x328>
		000000000025b3c8:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
  25b3cc:      	lsr	w0, w0, #0
  25b3d0:      	sxtw	x0, w0
  25b3d4:      	cmp	x24, x0
  25b3d8:      	b.eq	0x25b8f0 <_stogir.verify.structure+0x850>
  25b3dc:      	mov	x0, x19
  25b3e0:      	ldr	x19, [sp, #0xd0]
  25b3e4:      	ldr	x1, [sp, #0xa8]
  25b3e8:      	ldr	x2, [sp, #0x60]
  25b3ec:      	mov	x3, #0x23               ; =35
  25b3f0:      	b	0x25b120 <_stogir.verify.structure+0x80>
  25b3f4:      	ldr	x0, [sp, #0xb8]
  25b3f8:      	cmp	x0, #0x0
  25b3fc:      	b.ne	0x25b414 <_stogir.verify.structure+0x374>
  25b400:      	and	x0, x1, #0xffffffff
  25b404:      	mov	x1, x0
  25b408:      	movz	x0, #0x0, lsl #48
  25b40c:      	movz	x2, #0x0, lsl #48
  25b410:      	b	0x25b420 <_stogir.verify.structure+0x380>
  25b414:      	ldr	x1, [sp, #0xb0]
  25b418:      	mov	x2, x0
  25b41c:      	mov	x0, #0x1                ; =1
  25b420:      	ldr	x3, [sp, #0xa0]
  25b424:      	str	x0, [x3]
  25b428:      	str	x1, [x3, #0x8]
  25b42c:      	str	x2, [x3, #0x10]
  25b430:      	ldr	x19, [sp, #0x120]
  25b434:      	ldr	x20, [sp, #0x128]
  25b438:      	ldr	x21, [sp, #0x130]
  25b43c:      	ldr	x22, [sp, #0x138]
  25b440:      	ldr	x23, [sp, #0x140]
  25b444:      	ldr	x24, [sp, #0x148]
  25b448:      	ldr	x25, [sp, #0x150]
  25b44c:      	ldr	x26, [sp, #0x158]
  25b450:      	ldr	x27, [sp, #0x160]
  25b454:      	ldr	x28, [sp, #0x168]
  25b458:      	ldr	x29, [sp, #0x10]
  25b45c:      	ldr	x30, [sp, #0x18]
  25b460:      	add	sp, sp, #0x170
  25b464:      	ret
  25b468:      	mov	x0, x9
  25b46c:      	ldr	x1, [sp, #0x110]
  25b470:      	b	0x25b52c <_stogir.verify.structure+0x48c>
  25b474:      	nop
  25b478:      	mov	x4, x2
  25b47c:      	movz	x2, #0x0, lsl #48
  25b480:      	cmp	x2, #0x0
  25b484:      	b.eq	0x25bc2c <_stogir.verify.structure+0xb8c>
  25b488:      	lsr	w2, w1, #0
  25b48c:      	str	w0, [sp, #0xe8]
  25b490:      	mov	w0, w23
  25b494:      	str	x3, [sp, #0xf8]
  25b498:      	str	x4, [sp, #0x100]
  25b49c:      	str	w23, [sp, #0xf0]
  25b4a0:      	mov	x23, x1
  25b4a4:      	mov	w1, w2
  25b4a8:      	str	x24, [sp, #0x108]
  25b4ac:      	mov	w24, w2
  25b4b0:      	bl	0x25b4b0 <_stogir.verify.structure+0x410>
		000000000025b4b0:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
  25b4b4:      	add	x16, sp, #0x20
  25b4b8:      	str	x16, [sp]
  25b4bc:      	ldr	w1, [sp, #0xe8]
  25b4c0:      	mov	w2, w24
  25b4c4:      	str	x19, [sp, #0x30]
  25b4c8:      	mov	x19, x0
  25b4cc:      	mov	x0, x20
  25b4d0:      	bl	0x25b4d0 <_stogir.verify.structure+0x430>
		000000000025b4d0:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
  25b4d4:      	ldr	x16, [sp]
  25b4d8:      	str	x0, [x16]
  25b4dc:      	str	x1, [x16, #0x8]
  25b4e0:      	add	x16, sp, #0x20
  25b4e4:      	ldr	x0, [x16]
  25b4e8:      	add	x16, sp, #0x20
  25b4ec:      	ldr	x1, [x16, #0x8]
  25b4f0:      	lsr	w0, w0, #0
  25b4f4:      	lsr	x16, x0, #0
  25b4f8:      	cmp	x16, #0x1
  25b4fc:      	b.eq	0x25b518 <_stogir.verify.structure+0x478>
  25b500:      	b.lo	0x25b508 <_stogir.verify.structure+0x468>
  25b504:      	b	0x25b51c <_stogir.verify.structure+0x47c>
  25b508:      	cmp	x16, #0x0
  25b50c:      	b.eq	0x25b514 <_stogir.verify.structure+0x474>
  25b510:      	b	0x25b51c <_stogir.verify.structure+0x47c>
  25b514:      	b	0x25b520 <_stogir.verify.structure+0x480>
  25b518:      	b	0x25b57c <_stogir.verify.structure+0x4dc>
  25b51c:      	b	0x25baa8 <_stogir.verify.structure+0xa08>
  25b520:      	ldr	x19, [sp, #0xd0]
  25b524:      	ldr	x0, [sp, #0x80]
  25b528:      	mov	x1, #0x17               ; =23
  25b52c:      	add	x2, x23, #0x1
  25b530:      	lsr	w2, w2, #0
  25b534:      	sxtw	x2, w2
  25b538:      	ldr	x24, [sp, #0x108]
  25b53c:      	ldr	w23, [sp, #0xf0]
  25b540:      	str	x19, [sp, #0xd0]
  25b544:      	ldr	x19, [sp, #0x30]
  25b548:      	mov	x3, x1
  25b54c:      	mov	x1, x2
  25b550:      	mov	x2, x0
  25b554:      	ldr	w0, [sp, #0xe8]
  25b558:      	cmp	x3, #0x0
  25b55c:      	b.ne	0x25b478 <_stogir.verify.structure+0x3d8>
  25b560:      	cmp	x1, x24
  25b564:      	cset	w4, le
  25b568:      	ubfx	x4, x4, #0, #8
  25b56c:      	fmov	d31, x2
  25b570:      	mov	x2, x4
  25b574:      	fmov	x4, d31
  25b578:      	b	0x25b480 <_stogir.verify.structure+0x3e0>
  25b57c:      	lsr	w19, w19, #0
  25b580:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b580:  ARM64_RELOC_PAGE21	l_stogir.37964
  25b584:      	ldr	x16, [x16]
		000000000025b584:  ARM64_RELOC_PAGEOFF12	l_stogir.37964
  25b588:      	ldr	w0, [x16]
  25b58c:      	orr	x2, x19, xzr
  25b590:      	cmp	x2, x0
  25b594:      	b.ne	0x25b5a0 <_stogir.verify.structure+0x500>
  25b598:      	mov	x0, #0x1                ; =1
  25b59c:      	b	0x25b5b8 <_stogir.verify.structure+0x518>
  25b5a0:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b5a0:  ARM64_RELOC_PAGE21	l_stogir.37965
  25b5a4:      	ldr	x16, [x16]
		000000000025b5a4:  ARM64_RELOC_PAGEOFF12	l_stogir.37965
  25b5a8:      	ldr	w0, [x16]
  25b5ac:      	cmp	x2, x0
  25b5b0:      	cset	w0, eq
  25b5b4:      	ubfx	x0, x0, #0, #8
  25b5b8:      	lsr	w1, w1, #0
  25b5bc:      	sxtw	x1, w1
  25b5c0:      	cmp	x1, #0x0
  25b5c4:      	cset	w3, gt
  25b5c8:      	lsl	x4, x1, #2
  25b5cc:      	cmp	x1, #0x0
  25b5d0:      	cset	w5, lt
  25b5d4:      	movz	x16, #0x0, lsl #48
  25b5d8:      	sub	x6, x16, x1
  25b5dc:      	sub	x7, x6, #0x1
  25b5e0:      	lsl	x8, x7, #2
  25b5e4:      	cmp	x0, #0x0
  25b5e8:      	b.eq	0x25b630 <_stogir.verify.structure+0x590>
  25b5ec:      	uxtb	w16, w3
  25b5f0:      	cmp	w16, wzr
  25b5f4:      	b.eq	0x25b830 <_stogir.verify.structure+0x790>
  25b5f8:      	ldr	x9, [x20, #0x8]
  25b5fc:      	cmp	x1, x9
  25b600:      	b.ge	0x25b874 <_stogir.verify.structure+0x7d4>
  25b604:      	ldr	x9, [x25, #0x8]
  25b608:      	cmp	x1, x9
  25b60c:      	b.ge	0x25b93c <_stogir.verify.structure+0x89c>
  25b610:      	ldr	x9, [x20, #0x78]
  25b614:      	add	x9, x4, x9
  25b618:      	ldr	w9, [x9]
  25b61c:      	sxtw	x9, w9
  25b620:      	cmp	x9, #0x0
  25b624:      	cset	w9, ge
  25b628:      	ubfx	x9, x9, #0, #8
  25b62c:      	b	0x25b940 <_stogir.verify.structure+0x8a0>
  25b630:      	ldr	x9, [sp, #0x100]
  25b634:      	ldr	x10, [sp, #0xf8]
  25b638:      	movz	x7, #0x0, lsl #48
  25b63c:      	b	0x25b654 <_stogir.verify.structure+0x5b4>
  25b640:      	ldr	x7, [sp, #0x100]
  25b644:      	ldr	x10, [sp, #0xf8]
  25b648:      	fmov	d31, x7
  25b64c:      	mov	x7, x9
  25b650:      	fmov	x9, d31
  25b654:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b654:  ARM64_RELOC_PAGE21	l_stogir.37966
  25b658:      	ldr	x16, [x16]
		000000000025b658:  ARM64_RELOC_PAGEOFF12	l_stogir.37966
  25b65c:      	ldr	w11, [x16]
  25b660:      	cmp	x2, x11
  25b664:      	b.ne	0x25bc40 <_stogir.verify.structure+0xba0>
  25b668:      	cmp	x1, #0x0
  25b66c:      	b.gt	0x25b7d0 <_stogir.verify.structure+0x730>
  25b670:      	ldr	x12, [sp, #0xd8]
  25b674:      	ldr	x2, [sp, #0xe0]
  25b678:      	movz	x11, #0x0, lsl #48
  25b67c:      	lsr	w11, w11, #0
  25b680:      	lsr	x16, x11, #0
  25b684:      	cmp	x16, #0x1
  25b688:      	b.eq	0x25b6a4 <_stogir.verify.structure+0x604>
  25b68c:      	b.lo	0x25b694 <_stogir.verify.structure+0x5f4>
  25b690:      	b	0x25b6a8 <_stogir.verify.structure+0x608>
  25b694:      	cmp	x16, #0x0
  25b698:      	b.eq	0x25b6a0 <_stogir.verify.structure+0x600>
  25b69c:      	b	0x25b6a8 <_stogir.verify.structure+0x608>
  25b6a0:      	b	0x25b6ac <_stogir.verify.structure+0x60c>
  25b6a4:      	b	0x25b6b4 <_stogir.verify.structure+0x614>
  25b6a8:      	b	0x25bb2c <_stogir.verify.structure+0xa8c>
  25b6ac:      	ldr	x9, [sp, #0x90]
  25b6b0:      	mov	x10, #0x21              ; =33
  25b6b4:      	cmp	x19, #0xf
  25b6b8:      	b.hs	0x25bc4c <_stogir.verify.structure+0xbac>
  25b6bc:      	mov	x16, #0x1               ; =1
  25b6c0:      	lsl	x11, x16, x19
  25b6c4:      	lsr	w11, w11, #0
  25b6c8:      	mov	x17, #0x5e1c            ; =24092
  25b6cc:      	and	x11, x11, x17
  25b6d0:      	lsr	w11, w11, #0
  25b6d4:      	cmp	x11, #0x0
  25b6d8:      	b.eq	0x25bc60 <_stogir.verify.structure+0xbc0>
  25b6dc:      	cmp	x0, #0x0
  25b6e0:      	b.eq	0x25b9f0 <_stogir.verify.structure+0x950>
  25b6e4:      	ldr	x19, [sp, #0xd0]
  25b6e8:      	ldr	x0, [sp, #0xc8]
  25b6ec:      	ldr	x4, [sp, #0xc0]
  25b6f0:      	mov	x3, x7
  25b6f4:      	mov	x5, x9
  25b6f8:      	b	0x25b97c <_stogir.verify.structure+0x8dc>
  25b6fc:      	lsr	w0, w19, #0
  25b700:      	cmp	x22, #0x78
  25b704:      	cset	w22, eq
  25b708:      	lsr	w0, w0, #0
  25b70c:      	cmp	x28, #0x0
  25b710:      	cset	w28, eq
  25b714:      	mov	x2, x1
  25b718:      	mov	x1, #0x1                ; =1
  25b71c:      	b	0x25b558 <_stogir.verify.structure+0x4b8>
  25b720:      	ldr	x1, [sp, #0x78]
  25b724:      	mov	x2, #0x1b               ; =27
  25b728:      	add	x0, x0, #0x1
  25b72c:      	cmp	x2, #0x0
  25b730:      	b.ne	0x25b750 <_stogir.verify.structure+0x6b0>
  25b734:      	cmp	x0, x21
  25b738:      	cset	w3, lt
  25b73c:      	ubfx	x3, x3, #0, #8
  25b740:      	fmov	d31, x2
  25b744:      	mov	x2, x3
  25b748:      	fmov	x3, d31
  25b74c:      	b	0x25b758 <_stogir.verify.structure+0x6b8>
  25b750:      	mov	x3, x2
  25b754:      	movz	x2, #0x0, lsl #48
  25b758:      	cmp	x2, #0x0
  25b75c:      	b.eq	0x25b6fc <_stogir.verify.structure+0x65c>
  25b760:      	add	x2, x0, x19
  25b764:      	ldr	x4, [x20, #0x78]
  25b768:      	lsl	x2, x2, #2
  25b76c:      	add	x2, x2, x4
  25b770:      	ldr	w2, [x2]
  25b774:      	sxtw	x2, w2
  25b778:      	cmn	x2, #0x1
  25b77c:      	b.ne	0x25b720 <_stogir.verify.structure+0x680>
  25b780:      	mov	x2, x3
  25b784:      	b	0x25b728 <_stogir.verify.structure+0x688>
  25b788:      	ldr	x0, [sp, #0xb0]
  25b78c:      	ldr	x1, [sp, #0xb8]
  25b790:      	add	x2, x24, #0x4
  25b794:      	ldr	x3, [x20, #0x8]
  25b798:      	asr	x16, x2, #63
  25b79c:      	lsr	x16, x16, #62
  25b7a0:      	add	x2, x2, x16
  25b7a4:      	asr	x2, x2, #2
  25b7a8:      	orr	x21, x2, xzr
  25b7ac:      	add	x2, x21, x19
  25b7b0:      	cmp	x2, x3
  25b7b4:      	b.le	0x25b7c0 <_stogir.verify.structure+0x720>
  25b7b8:      	ldr	x0, [sp, #0x70]
  25b7bc:      	mov	x1, #0x15               ; =21
  25b7c0:      	mov	x2, x1
  25b7c4:      	mov	x1, x0
  25b7c8:      	mov	x0, #0x1                ; =1
  25b7cc:      	b	0x25b72c <_stogir.verify.structure+0x68c>
  25b7d0:      	ldr	x2, [sp, #0xe0]
  25b7d4:      	ldr	x11, [x2, #0x8]
  25b7d8:      	cmp	x1, x11
  25b7dc:      	b.gt	0x25bc74 <_stogir.verify.structure+0xbd4>
  25b7e0:      	sub	x11, x1, #0x1
  25b7e4:      	ldr	x12, [sp, #0xd8]
  25b7e8:      	ldr	x13, [x12, #0x28]
  25b7ec:      	mov	x17, #0x18              ; =24
  25b7f0:      	mul	x11, x11, x17
  25b7f4:      	add	x11, x11, x13
  25b7f8:      	ldr	x13, [x11]
  25b7fc:      	ldr	x11, [x11, #0x8]
  25b800:      	ldr	x14, [x12, #0x8]
  25b804:      	cmp	x13, #0x0
  25b808:      	b.lt	0x25b92c <_stogir.verify.structure+0x88c>
  25b80c:      	cmp	x13, x14
  25b810:      	b.gt	0x25b92c <_stogir.verify.structure+0x88c>
  25b814:      	cmp	x11, #0x0
  25b818:      	b.lt	0x25b92c <_stogir.verify.structure+0x88c>
  25b81c:      	sub	x13, x14, x13
  25b820:      	cmp	x11, x13
  25b824:      	b.gt	0x25b92c <_stogir.verify.structure+0x88c>
  25b828:      	mov	x11, #0x1               ; =1
  25b82c:      	b	0x25b930 <_stogir.verify.structure+0x890>
  25b830:      	uxtb	w16, w5
  25b834:      	cmp	w16, wzr
  25b838:      	b.eq	0x25b87c <_stogir.verify.structure+0x7dc>
  25b83c:      	ldr	x9, [x26, #0x8]
  25b840:      	ldr	x10, [x27, #0x8]
  25b844:      	cmp	x9, x10
  25b848:      	b.ne	0x25b934 <_stogir.verify.structure+0x894>
  25b84c:      	cmp	x6, x9
  25b850:      	b.gt	0x25ba38 <_stogir.verify.structure+0x998>
  25b854:      	ldr	x9, [x20, #0x50]
  25b858:      	add	x9, x8, x9
  25b85c:      	ldr	w9, [x9]
  25b860:      	sxtw	x9, w9
  25b864:      	cmp	x9, #0x0
  25b868:      	cset	w9, gt
  25b86c:      	ubfx	x9, x9, #0, #8
  25b870:      	b	0x25ba3c <_stogir.verify.structure+0x99c>
  25b874:      	movz	x9, #0x0, lsl #48
  25b878:      	b	0x25b880 <_stogir.verify.structure+0x7e0>
  25b87c:      	movz	x9, #0x0, lsl #48
  25b880:      	cmp	x9, #0x0
  25b884:      	b.eq	0x25b8b4 <_stogir.verify.structure+0x814>
  25b888:      	uxtb	w16, w3
  25b88c:      	cmp	w16, wzr
  25b890:      	b.eq	0x25b8a4 <_stogir.verify.structure+0x804>
  25b894:      	lsl	x7, x1, #4
  25b898:      	ldr	x9, [x20]
  25b89c:      	add	x7, x7, x9
  25b8a0:      	b	0x25b8b0 <_stogir.verify.structure+0x810>
  25b8a4:      	lsl	x7, x7, #4
  25b8a8:      	ldr	x9, [x20, #0x28]
  25b8ac:      	add	x7, x7, x9
  25b8b0:      	b	0x25b8b8 <_stogir.verify.structure+0x818>
  25b8b4:      	movz	x7, #0x0, lsl #48
  25b8b8:      	cmp	x7, #0x0
  25b8bc:      	cset	w9, eq
  25b8c0:      	uxtb	w16, w9
  25b8c4:      	cmp	w16, wzr
  25b8c8:      	cset	x9, eq
  25b8cc:      	cmp	x9, #0x0
  25b8d0:      	b.eq	0x25b640 <_stogir.verify.structure+0x5a0>
  25b8d4:      	ldr	w7, [x7]
  25b8d8:      	uxtb	w7, w7
  25b8dc:      	cmp	x7, #0x48
  25b8e0:      	b.ne	0x25b640 <_stogir.verify.structure+0x5a0>
  25b8e4:      	ldr	x7, [sp, #0x88]
  25b8e8:      	mov	x10, #0x25              ; =37
  25b8ec:      	b	0x25b648 <_stogir.verify.structure+0x5a8>
  25b8f0:      	mov	w0, w23
  25b8f4:      	bl	0x25b8f4 <_stogir.verify.structure+0x854>
		000000000025b8f4:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
  25b8f8:      	lsr	w0, w0, #0
  25b8fc:      	sxtw	x0, w0
  25b900:      	cmn	x0, #0x1
  25b904:      	b.ne	0x25b788 <_stogir.verify.structure+0x6e8>
  25b908:      	ubfx	x0, x21, #16, #16
  25b90c:      	cmp	x24, x0
  25b910:      	b.eq	0x25b788 <_stogir.verify.structure+0x6e8>
  25b914:      	ldr	x0, [sp, #0x68]
  25b918:      	mov	x1, #0x24               ; =36
  25b91c:      	b	0x25b790 <_stogir.verify.structure+0x6f0>
  25b920:      	mov	x0, x1
  25b924:      	ldr	x1, [sp, #0x110]
  25b928:      	b	0x25b470 <_stogir.verify.structure+0x3d0>
  25b92c:      	movz	x11, #0x0, lsl #48
  25b930:      	b	0x25b67c <_stogir.verify.structure+0x5dc>
  25b934:      	movz	x9, #0x0, lsl #48
  25b938:      	b	0x25b880 <_stogir.verify.structure+0x7e0>
  25b93c:      	movz	x9, #0x0, lsl #48
  25b940:      	b	0x25b878 <_stogir.verify.structure+0x7d8>
  25b944:      	mov	x0, #0x1                ; =1
  25b948:      	cmp	x0, #0x0
  25b94c:      	b.eq	0x25b920 <_stogir.verify.structure+0x880>
  25b950:      	ldr	x0, [sp, #0x98]
  25b954:      	mov	x1, #0x1a               ; =26
  25b958:      	b	0x25b928 <_stogir.verify.structure+0x888>
  25b95c:      	movz	x0, #0x0, lsl #48
  25b960:      	ldr	x1, [sp, #0x118]
  25b964:      	cmp	x0, #0x0
  25b968:      	b.eq	0x25b944 <_stogir.verify.structure+0x8a4>
  25b96c:      	movz	x0, #0x0, lsl #48
  25b970:      	b	0x25b948 <_stogir.verify.structure+0x8a8>
  25b974:      	movz	x3, #0x0, lsl #48
  25b978:      	mov	x5, x9
  25b97c:      	cmp	x3, #0x0
  25b980:      	b.eq	0x25b9a4 <_stogir.verify.structure+0x904>
  25b984:      	str	x12, [sp, #0xd8]
  25b988:      	str	x10, [sp, #0x110]
  25b98c:      	str	x2, [sp, #0xe0]
  25b990:      	str	x0, [sp, #0xc8]
  25b994:      	str	x4, [sp, #0xc0]
  25b998:      	mov	x1, x5
  25b99c:      	mov	x0, #0x1                ; =1
  25b9a0:      	b	0x25b964 <_stogir.verify.structure+0x8c4>
  25b9a4:      	cmp	x1, #0x0
  25b9a8:      	b.ne	0x25bc7c <_stogir.verify.structure+0xbdc>
  25b9ac:      	mov	w1, w24
  25b9b0:      	str	x2, [sp, #0xe0]
  25b9b4:      	str	x12, [sp, #0xd8]
  25b9b8:      	str	x10, [sp, #0x110]
  25b9bc:      	str	x0, [sp, #0xc8]
  25b9c0:      	ldr	w0, [sp, #0xf0]
  25b9c4:      	str	x4, [sp, #0xc0]
  25b9c8:      	str	x5, [sp, #0x118]
  25b9cc:      	bl	0x25b9cc <_stogir.verify.structure+0x92c>
		000000000025b9cc:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
  25b9d0:      	lsr	w0, w0, #0
  25b9d4:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025b9d4:  ARM64_RELOC_PAGE21	l_stogir.37967
  25b9d8:      	ldr	x16, [x16]
		000000000025b9d8:  ARM64_RELOC_PAGEOFF12	l_stogir.37967
  25b9dc:      	ldr	w1, [x16]
  25b9e0:      	cmp	x0, x1
  25b9e4:      	b.ne	0x25bab0 <_stogir.verify.structure+0xa10>
  25b9e8:      	mov	x0, #0x1                ; =1
  25b9ec:      	b	0x25ba44 <_stogir.verify.structure+0x9a4>
  25b9f0:      	uxtb	w16, w3
  25b9f4:      	cmp	w16, wzr
  25b9f8:      	b.eq	0x25bc98 <_stogir.verify.structure+0xbf8>
  25b9fc:      	ldr	x0, [x20, #0x8]
  25ba00:      	cmp	x1, x0
  25ba04:      	b.ge	0x25bca0 <_stogir.verify.structure+0xc00>
  25ba08:      	ldr	x19, [sp, #0xd0]
  25ba0c:      	ldr	x0, [x19, #0x8]
  25ba10:      	cmp	x1, x0
  25ba14:      	b.ge	0x25bad4 <_stogir.verify.structure+0xa34>
  25ba18:      	ldr	x0, [x20, #0x78]
  25ba1c:      	add	x0, x4, x0
  25ba20:      	ldr	w0, [x0]
  25ba24:      	sxtw	x0, w0
  25ba28:      	cmp	x0, #0x0
  25ba2c:      	cset	w0, ge
  25ba30:      	ubfx	x0, x0, #0, #8
  25ba34:      	b	0x25bad8 <_stogir.verify.structure+0xa38>
  25ba38:      	movz	x9, #0x0, lsl #48
  25ba3c:      	b	0x25b938 <_stogir.verify.structure+0x898>
  25ba40:      	movz	x0, #0x0, lsl #48
  25ba44:      	b	0x25b960 <_stogir.verify.structure+0x8c0>
  25ba48:      	movz	x0, #0x0, lsl #48
  25ba4c:      	ldr	x4, [sp, #0xc0]
  25ba50:      	mov	x3, x0
  25ba54:      	ldr	x0, [sp, #0xc8]
  25ba58:      	b	0x25b978 <_stogir.verify.structure+0x8d8>
  25ba5c:      	uxtb	w16, w5
  25ba60:      	cmp	w16, wzr
  25ba64:      	b.eq	0x25bca8 <_stogir.verify.structure+0xc08>
  25ba68:      	ldr	x0, [sp, #0xc8]
  25ba6c:      	ldr	x3, [x0, #0x8]
  25ba70:      	ldr	x4, [sp, #0xc0]
  25ba74:      	ldr	x5, [x4, #0x8]
  25ba78:      	cmp	x3, x5
  25ba7c:      	b.ne	0x25bacc <_stogir.verify.structure+0xa2c>
  25ba80:      	cmp	x6, x3
  25ba84:      	b.gt	0x25baf8 <_stogir.verify.structure+0xa58>
  25ba88:      	ldr	x3, [x20, #0x50]
  25ba8c:      	add	x3, x8, x3
  25ba90:      	ldr	w3, [x3]
  25ba94:      	sxtw	x3, w3
  25ba98:      	cmp	x3, #0x0
  25ba9c:      	cset	w3, gt
  25baa0:      	ubfx	x3, x3, #0, #8
  25baa4:      	b	0x25bafc <_stogir.verify.structure+0xa5c>
  25baa8:      	brk	#0
  25baac:      	b	0x25baa8 <_stogir.verify.structure+0xa08>
  25bab0:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025bab0:  ARM64_RELOC_PAGE21	l_stogir.37968
  25bab4:      	ldr	x16, [x16]
		000000000025bab4:  ARM64_RELOC_PAGEOFF12	l_stogir.37968
  25bab8:      	ldr	w1, [x16]
  25babc:      	cmp	x0, x1
  25bac0:      	b.ne	0x25badc <_stogir.verify.structure+0xa3c>
  25bac4:      	mov	x0, #0x1                ; =1
  25bac8:      	b	0x25ba44 <_stogir.verify.structure+0x9a4>
  25bacc:      	movz	x3, #0x0, lsl #48
  25bad0:      	b	0x25b978 <_stogir.verify.structure+0x8d8>
  25bad4:      	movz	x0, #0x0, lsl #48
  25bad8:      	b	0x25ba4c <_stogir.verify.structure+0x9ac>
  25badc:      	adrp	x16, 0x25b000 <_coil.compiler.codegen_stogir.translate!+0x2090>
		000000000025badc:  ARM64_RELOC_PAGE21	l_stogir.37969
  25bae0:      	ldr	x16, [x16]
		000000000025bae0:  ARM64_RELOC_PAGEOFF12	l_stogir.37969
  25bae4:      	ldr	w1, [x16]
  25bae8:      	cmp	x0, x1
  25baec:      	b.ne	0x25bb00 <_stogir.verify.structure+0xa60>
  25baf0:      	mov	x0, #0x1                ; =1
  25baf4:      	b	0x25ba44 <_stogir.verify.structure+0x9a4>
  25baf8:      	movz	x3, #0x0, lsl #48
  25bafc:      	b	0x25bad0 <_stogir.verify.structure+0xa30>
  25bb00:      	uxtb	w16, w22
  25bb04:      	cmp	w16, wzr
  25bb08:      	b.eq	0x25ba40 <_stogir.verify.structure+0x9a0>
  25bb0c:      	uxtb	w16, w28
  25bb10:      	cmp	w16, wzr
  25bb14:      	b.eq	0x25bb34 <_stogir.verify.structure+0xa94>
  25bb18:      	sxtw	x24, w24
  25bb1c:      	cmp	x24, #0x2
  25bb20:      	cset	w0, eq
  25bb24:      	ubfx	x0, x0, #0, #8
  25bb28:      	b	0x25bb38 <_stogir.verify.structure+0xa98>
  25bb2c:      	brk	#0
  25bb30:      	b	0x25bb2c <_stogir.verify.structure+0xa8c>
  25bb34:      	movz	x0, #0x0, lsl #48
  25bb38:      	b	0x25ba44 <_stogir.verify.structure+0x9a4>
  25bb3c:      	mov	x1, x2
  25bb40:      	str	x8, [sp, #0xa0]
  25bb44:      	str	x12, [sp, #0xb0]
  25bb48:      	str	x13, [sp, #0xb8]
  25bb4c:      	b	0x25b3f4 <_stogir.verify.structure+0x354>
  25bb50:      	mov	x1, x2
  25bb54:      	str	x8, [sp, #0xa0]
  25bb58:      	str	x12, [sp, #0xb0]
  25bb5c:      	str	x13, [sp, #0xb8]
  25bb60:      	b	0x25b3f4 <_stogir.verify.structure+0x354>
  25bb64:      	mov	x1, x2
  25bb68:      	str	x8, [sp, #0xa0]
  25bb6c:      	str	x19, [sp, #0x50]
  25bb70:      	str	x20, [sp, #0x58]
  25bb74:      	mov	x20, x0
  25bb78:      	ldr	x0, [sp, #0x30]
  25bb7c:      	str	x21, [sp, #0x60]
  25bb80:      	str	x22, [sp, #0x68]
  25bb84:      	str	x23, [sp, #0x70]
  25bb88:      	str	x24, [sp, #0x78]
  25bb8c:      	str	x25, [sp, #0x80]
  25bb90:      	str	x26, [sp, #0x88]
  25bb94:      	str	x27, [sp, #0x90]
  25bb98:      	str	x28, [sp, #0x98]
  25bb9c:      	str	x3, [sp, #0xd8]
  25bba0:      	str	x11, [sp, #0xe0]
  25bba4:      	mov	x19, x4
  25bba8:      	str	x5, [sp, #0xc8]
  25bbac:      	str	x6, [sp, #0xc0]
  25bbb0:      	mov	x25, x7
  25bbb4:      	mov	x26, x9
  25bbb8:      	mov	x27, x10
  25bbbc:      	b	0x25b248 <_stogir.verify.structure+0x1a8>
  25bbc0:      	ldr	x0, [sp, #0x30]
  25bbc4:      	mov	x1, x2
  25bbc8:      	str	x8, [sp, #0xa0]
  25bbcc:      	str	x19, [sp, #0x50]
  25bbd0:      	str	x20, [sp, #0x58]
  25bbd4:      	ldr	x20, [sp, #0x38]
  25bbd8:      	str	x21, [sp, #0x60]
  25bbdc:      	str	x22, [sp, #0x68]
  25bbe0:      	str	x23, [sp, #0x70]
  25bbe4:      	str	x24, [sp, #0x78]
  25bbe8:      	str	x25, [sp, #0x80]
  25bbec:      	str	x26, [sp, #0x88]
  25bbf0:      	str	x27, [sp, #0x90]
  25bbf4:      	str	x28, [sp, #0x98]
  25bbf8:      	str	x3, [sp, #0xd8]
  25bbfc:      	str	x11, [sp, #0xe0]
  25bc00:      	mov	x19, x4
  25bc04:      	str	x5, [sp, #0xc8]
  25bc08:      	str	x6, [sp, #0xc0]
  25bc0c:      	mov	x25, x7
  25bc10:      	mov	x26, x9
  25bc14:      	mov	x27, x10
  25bc18:      	b	0x25b1e0 <_stogir.verify.structure+0x140>
  25bc1c:      	mov	x0, x19
  25bc20:      	ldr	x1, [sp, #0xa8]
  25bc24:      	ldr	x19, [sp, #0xd0]
  25bc28:      	b	0x25b1e0 <_stogir.verify.structure+0x140>
  25bc2c:      	str	x19, [sp, #0x30]
  25bc30:      	str	x4, [sp, #0x100]
  25bc34:      	str	x3, [sp, #0xf8]
  25bc38:      	ldr	x19, [sp, #0xd0]
  25bc3c:      	b	0x25b100 <_stogir.verify.structure+0x60>
  25bc40:      	ldr	x12, [sp, #0xd8]
  25bc44:      	ldr	x2, [sp, #0xe0]
  25bc48:      	b	0x25b6b4 <_stogir.verify.structure+0x614>
  25bc4c:      	str	x12, [sp, #0xd8]
  25bc50:      	str	x10, [sp, #0x110]
  25bc54:      	str	x2, [sp, #0xe0]
  25bc58:      	ldr	x19, [sp, #0xd0]
  25bc5c:      	b	0x25b468 <_stogir.verify.structure+0x3c8>
  25bc60:      	str	x12, [sp, #0xd8]
  25bc64:      	str	x10, [sp, #0x110]
  25bc68:      	str	x2, [sp, #0xe0]
  25bc6c:      	ldr	x19, [sp, #0xd0]
  25bc70:      	b	0x25b468 <_stogir.verify.structure+0x3c8>
  25bc74:      	ldr	x12, [sp, #0xd8]
  25bc78:      	b	0x25b678 <_stogir.verify.structure+0x5d8>
  25bc7c:      	str	x12, [sp, #0xd8]
  25bc80:      	str	x5, [sp, #0x118]
  25bc84:      	str	x10, [sp, #0x110]
  25bc88:      	str	x2, [sp, #0xe0]
  25bc8c:      	str	x0, [sp, #0xc8]
  25bc90:      	str	x4, [sp, #0xc0]
  25bc94:      	b	0x25b95c <_stogir.verify.structure+0x8bc>
  25bc98:      	ldr	x19, [sp, #0xd0]
  25bc9c:      	b	0x25ba5c <_stogir.verify.structure+0x9bc>
  25bca0:      	ldr	x19, [sp, #0xd0]
  25bca4:      	b	0x25ba48 <_stogir.verify.structure+0x9a8>
  25bca8:      	ldr	x0, [sp, #0xc8]
  25bcac:      	ldr	x4, [sp, #0xc0]
  25bcb0:      	b	0x25b974 <_stogir.verify.structure+0x8d4>
