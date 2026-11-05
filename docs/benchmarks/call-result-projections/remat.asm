
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-call-result-projections/build/projections-verifier/remat.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_verify_graph>:
       0:      	sub	sp, sp, #0x1e0
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	str	x19, [sp, #0x1d0]
      14:      	add	x8, sp, #0x10
      18:      	mov	x19, x0
      1c:      	mov	x1, #0x8                ; =8
      20:      	bl	0x20 <_gap_verify_graph+0x20>
		0000000000000020:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target
      24:      	add	x16, sp, #0x10
      28:      	ldr	w0, [x16]
      2c:      	lsr	x16, x0, #0
      30:      	cmp	x16, #0x1
      34:      	b.eq	0x50 <_gap_verify_graph+0x50>
      38:      	b.lo	0x40 <_gap_verify_graph+0x40>
      3c:      	b	0x54 <_gap_verify_graph+0x54>
      40:      	cmp	x16, #0x0
      44:      	b.eq	0x4c <_gap_verify_graph+0x4c>
      48:      	b	0x54 <_gap_verify_graph+0x54>
      4c:      	b	0x60 <_gap_verify_graph+0x60>
      50:      	b	0x58 <_gap_verify_graph+0x58>
      54:      	b	0x8c <_gap_verify_graph+0x8c>
      58:      	movn	x0, #0x0, lsl #48
      5c:      	b	0x78 <_gap_verify_graph+0x78>
      60:      	add	x0, sp, #0x30
      64:      	mov	x1, x19
      68:      	mov	x2, #0x1a0              ; =416
      6c:      	bl	0x6c <_gap_verify_graph+0x6c>
		000000000000006c:  ARM64_RELOC_BRANCH26	_memmove
      70:      	add	x16, sp, #0x30
      74:      	ldr	x0, [x16, #0x8]
      78:      	ldr	x19, [sp, #0x1d0]
      7c:      	ldr	x29, [sp]
      80:      	ldr	x30, [sp, #0x8]
      84:      	add	sp, sp, #0x1e0
      88:      	ret
      8c:      	brk	#0
      90:      	b	0x8c <_gap_verify_graph+0x8c>

0000000000000094 <_stogir.verify.integer-operations-target>:
      94:      	sub	sp, sp, #0x70
      98:      	str	x29, [sp]
      9c:      	str	x30, [sp, #0x8]
      a0:      	mov	x29, sp
      a4:      	str	x19, [sp, #0x50]
      a8:      	str	x20, [sp, #0x58]
      ac:      	str	x21, [sp, #0x60]
      b0:      	mov	x19, x8
      b4:      	add	x8, sp, #0x10
      b8:      	mov	x20, x0
      bc:      	mov	w21, w1
      c0:      	bl	0xc0 <_stogir.verify.integer-operations-target+0x2c>
		00000000000000c0:  ARM64_RELOC_BRANCH26	_stogir.verify.structure
      c4:      	add	x16, sp, #0x10
      c8:      	ldr	w0, [x16]
      cc:      	lsr	x16, x0, #0
      d0:      	cmp	x16, #0x1
      d4:      	b.eq	0xf0 <_stogir.verify.integer-operations-target+0x5c>
      d8:      	b.lo	0xe0 <_stogir.verify.integer-operations-target+0x4c>
      dc:      	b	0xf4 <_stogir.verify.integer-operations-target+0x60>
      e0:      	cmp	x16, #0x0
      e4:      	b.eq	0xec <_stogir.verify.integer-operations-target+0x58>
      e8:      	b	0xf4 <_stogir.verify.integer-operations-target+0x60>
      ec:      	b	0x118 <_stogir.verify.integer-operations-target+0x84>
      f0:      	b	0xf8 <_stogir.verify.integer-operations-target+0x64>
      f4:      	b	0x168 <_stogir.verify.integer-operations-target+0xd4>
      f8:      	add	x16, sp, #0x10
      fc:      	orr	x0, x16, xzr
     100:      	add	x0, x0, #0x8
     104:      	add	x16, sp, #0x10
     108:      	ldr	x1, [x16, #0x8]
     10c:      	ldr	x0, [x0, #0x8]
     110:      	mov	x2, #0x1                ; =1
     114:      	b	0x140 <_stogir.verify.integer-operations-target+0xac>
     118:      	add	x8, sp, #0x30
     11c:      	mov	x0, x20
     120:      	mov	w1, w21
     124:      	bl	0x124 <_stogir.verify.integer-operations-target+0x90>
		0000000000000124:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target-structured
     128:      	add	x16, sp, #0x30
     12c:      	ldr	x2, [x16]
     130:      	add	x16, sp, #0x30
     134:      	ldr	x1, [x16, #0x8]
     138:      	add	x16, sp, #0x30
     13c:      	ldr	x0, [x16, #0x10]
     140:      	str	x2, [x19]
     144:      	str	x1, [x19, #0x8]
     148:      	str	x0, [x19, #0x10]
     14c:      	ldr	x19, [sp, #0x50]
     150:      	ldr	x20, [sp, #0x58]
     154:      	ldr	x21, [sp, #0x60]
     158:      	ldr	x29, [sp]
     15c:      	ldr	x30, [sp, #0x8]
     160:      	add	sp, sp, #0x70
     164:      	ret
     168:      	brk	#0
     16c:      	b	0x168 <_stogir.verify.integer-operations-target+0xd4>

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
     290:      	b.ne	0xa6c <_stogir.verify.structure+0x8fc>
     294:      	ldr	x1, [x0, #0x8]
     298:      	cmp	x26, x1
     29c:      	b.ge	0xa80 <_stogir.verify.structure+0x910>
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
     2cc:      	b.gt	0xa94 <_stogir.verify.structure+0x924>
     2d0:      	uxtb	w2, w1
     2d4:      	orr	x3, x2, xzr
     2d8:      	cmp	x3, #0x83
     2dc:      	cset	w4, lt
     2e0:      	uxtb	w16, w4
     2e4:      	cmp	w16, wzr
     2e8:      	b.eq	0xab8 <_stogir.verify.structure+0x948>
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
     338:      	b.eq	0xadc <_stogir.verify.structure+0x96c>
     33c:      	adrp	x17, 0x0 <_gap_verify_graph>
		000000000000033c:  ARM64_RELOC_PAGE21	l_stogir.315
     340:      	ldr	x17, [x17]
		0000000000000340:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     344:      	add	x0, x24, x17
     348:      	ldrsb	w0, [x0]
     34c:      	sxtb	x0, w0
     350:      	cmp	x0, #0x0
     354:      	b.lt	0x78c <_stogir.verify.structure+0x61c>
     358:      	uxtb	w16, w23
     35c:      	cmp	w16, wzr
     360:      	b.eq	0x860 <_stogir.verify.structure+0x6f0>
     364:      	adrp	x17, 0x0 <_gap_verify_graph>
		0000000000000364:  ARM64_RELOC_PAGE21	l_stogir.315
     368:      	ldr	x17, [x17]
		0000000000000368:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     36c:      	add	x0, x24, x17
     370:      	ldrsb	w0, [x0]
     374:      	sxtb	w0, w0
     378:      	b	0x864 <_stogir.verify.structure+0x6f4>
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
     398:      	b.eq	0xaf8 <_stogir.verify.structure+0x988>
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
     420:      	b.eq	0x8a0 <_stogir.verify.structure+0x730>
     424:      	ldr	w1, [sp, #0xb0]
     428:      	ldr	w5, [sp, #0xa8]
     42c:      	b	0x500 <_stogir.verify.structure+0x390>
     430:      	movz	w8, #0x0, lsl #16
     434:      	b	0x43c <_stogir.verify.structure+0x2cc>
     438:      	movz	w8, #0x0, lsl #16
     43c:      	add	x16, sp, #0x20
     440:      	str	x16, [sp]
     444:      	str	w0, [sp, #0x68]
     448:      	str	x2, [sp, #0x98]
     44c:      	mov	w2, w3
     450:      	str	x4, [sp, #0xa0]
     454:      	str	x24, [sp, #0x70]
     458:      	mov	x24, x1
     45c:      	mov	w1, w0
     460:      	mov	x0, x19
     464:      	str	x28, [sp, #0x78]
     468:      	mov	w28, w7
     46c:      	str	x20, [sp, #0x80]
     470:      	mov	w20, w8
     474:      	str	x22, [sp, #0x88]
     478:      	mov	w22, w5
     47c:      	str	x26, [sp, #0x90]
     480:      	mov	w26, w6
     484:      	bl	0x484 <_stogir.verify.structure+0x314>
		0000000000000484:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     488:      	ldr	x16, [sp]
     48c:      	str	x0, [x16]
     490:      	str	x1, [x16, #0x8]
     494:      	add	x16, sp, #0x20
     498:      	ldr	x0, [x16]
     49c:      	add	x16, sp, #0x20
     4a0:      	ldr	x1, [x16, #0x8]
     4a4:      	ubfx	x0, x0, #0, #32
     4a8:      	lsr	x16, x0, #0
     4ac:      	cmp	x16, #0x1
     4b0:      	b.eq	0x4cc <_stogir.verify.structure+0x35c>
     4b4:      	b.lo	0x4bc <_stogir.verify.structure+0x34c>
     4b8:      	b	0x4d0 <_stogir.verify.structure+0x360>
     4bc:      	cmp	x16, #0x0
     4c0:      	b.eq	0x4c8 <_stogir.verify.structure+0x358>
     4c4:      	b	0x4d0 <_stogir.verify.structure+0x360>
     4c8:      	b	0x4d4 <_stogir.verify.structure+0x364>
     4cc:      	b	0x5b4 <_stogir.verify.structure+0x444>
     4d0:      	b	0x9d4 <_stogir.verify.structure+0x864>
     4d4:      	ldr	x2, [sp, #0x60]
     4d8:      	ldr	x0, [sp, #0x58]
     4dc:      	ldr	x3, [sp, #0x50]
     4e0:      	ldr	x4, [sp, #0x48]
     4e4:      	mov	w1, w27
     4e8:      	mov	w5, w21
     4ec:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000004ec:  ARM64_RELOC_PAGE21	l_stogir.316
     4f0:      	ldr	x16, [x16]
		00000000000004f0:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     4f4:      	str	x16, [sp, #0x38]
     4f8:      	mov	x16, #0x17              ; =23
     4fc:      	str	x16, [sp, #0x80]
     500:      	ldr	x6, [sp, #0x98]
     504:      	add	x6, x6, #0x1
     508:      	sxtw	x6, w6
     50c:      	ldr	x26, [sp, #0x90]
     510:      	ldr	x28, [sp, #0x78]
     514:      	ldr	x22, [sp, #0x88]
     518:      	str	x2, [sp, #0x60]
     51c:      	str	x0, [sp, #0x58]
     520:      	ldr	w0, [sp, #0x68]
     524:      	str	x3, [sp, #0x50]
     528:      	str	x4, [sp, #0x48]
     52c:      	mov	w27, w1
     530:      	mov	w21, w5
     534:      	mov	x1, x24
     538:      	ldr	x24, [sp, #0x70]
     53c:      	mov	x2, x6
     540:      	ldr	x20, [sp, #0x80]
     544:      	cmp	x20, #0x0
     548:      	b.ne	0x55c <_stogir.verify.structure+0x3ec>
     54c:      	cmp	x2, x28
     550:      	cset	w3, le
     554:      	ubfx	x3, x3, #0, #8
     558:      	b	0x560 <_stogir.verify.structure+0x3f0>
     55c:      	movz	x3, #0x0, lsl #48
     560:      	cmp	x3, #0x0
     564:      	b.eq	0xb00 <_stogir.verify.structure+0x990>
     568:      	orr	w3, w2, wzr
     56c:      	sxtw	x4, w3
     570:      	sub	w5, w3, #0x1
     574:      	cmp	x4, #0x0
     578:      	cset	w6, gt
     57c:      	cmp	x4, #0x4
     580:      	cset	w7, gt
     584:      	uxtb	w16, w23
     588:      	cmp	w16, wzr
     58c:      	b.eq	0x438 <_stogir.verify.structure+0x2c8>
     590:      	ldr	w8, [x24]
     594:      	uxtb	w16, w6
     598:      	cmp	w16, wzr
     59c:      	b.eq	0x430 <_stogir.verify.structure+0x2c0>
     5a0:      	uxtb	w16, w7
     5a4:      	cmp	w16, wzr
     5a8:      	b.eq	0x400 <_stogir.verify.structure+0x290>
     5ac:      	mov	w9, #0x4                ; =4
     5b0:      	b	0x404 <_stogir.verify.structure+0x294>
     5b4:      	ubfx	x20, x20, #0, #32
     5b8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000005b8:  ARM64_RELOC_PAGE21	l_stogir.317
     5bc:      	ldr	x16, [x16]
		00000000000005bc:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     5c0:      	ldr	w0, [x16]
     5c4:      	cmp	x20, x0
     5c8:      	b.ne	0x5dc <_stogir.verify.structure+0x46c>
     5cc:      	mov	x0, #0x1                ; =1
     5d0:      	b	0x5f4 <_stogir.verify.structure+0x484>
     5d4:      	movz	x1, #0x0, lsl #48
     5d8:      	b	0x654 <_stogir.verify.structure+0x4e4>
     5dc:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000005dc:  ARM64_RELOC_PAGE21	l_stogir.318
     5e0:      	ldr	x16, [x16]
		00000000000005e0:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     5e4:      	ldr	w0, [x16]
     5e8:      	cmp	x20, x0
     5ec:      	cset	w0, eq
     5f0:      	ubfx	x0, x0, #0, #8
     5f4:      	cmp	x0, #0x0
     5f8:      	b.eq	0xb20 <_stogir.verify.structure+0x9b0>
     5fc:      	str	w21, [sp, #0xa8]
     600:      	mov	x21, x0
     604:      	mov	x0, x19
     608:      	str	w27, [sp, #0xb0]
     60c:      	mov	w27, w1
     610:      	bl	0x610 <_stogir.verify.structure+0x4a0>
		0000000000000610:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
     614:      	cmp	x0, #0x0
     618:      	cset	w1, eq
     61c:      	uxtb	w16, w1
     620:      	cmp	w16, wzr
     624:      	cset	x1, eq
     628:      	cmp	x1, #0x0
     62c:      	b.eq	0x654 <_stogir.verify.structure+0x4e4>
     630:      	ldr	w0, [x0]
     634:      	uxtb	w0, w0
     638:      	cmp	x0, #0x48
     63c:      	b.ne	0x654 <_stogir.verify.structure+0x4e4>
     640:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000640:  ARM64_RELOC_PAGE21	l_stogir.319
     644:      	ldr	x16, [x16]
		0000000000000644:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     648:      	str	x16, [sp, #0x38]
     64c:      	mov	x16, #0x25              ; =37
     650:      	str	x16, [sp, #0x80]
     654:      	sxtw	x27, w27
     658:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000658:  ARM64_RELOC_PAGE21	l_stogir.320
     65c:      	ldr	x16, [x16]
		000000000000065c:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     660:      	ldr	w0, [x16]
     664:      	cmp	x20, x0
     668:      	b.ne	0xb34 <_stogir.verify.structure+0x9c4>
     66c:      	cmp	x27, #0x0
     670:      	b.gt	0x7fc <_stogir.verify.structure+0x68c>
     674:      	ldr	x2, [sp, #0x60]
     678:      	movz	w0, #0x0, lsl #16
     67c:      	ubfx	x0, x0, #0, #32
     680:      	lsr	x16, x0, #0
     684:      	cmp	x16, #0x1
     688:      	b.eq	0x6a4 <_stogir.verify.structure+0x534>
     68c:      	b.lo	0x694 <_stogir.verify.structure+0x524>
     690:      	b	0x6a8 <_stogir.verify.structure+0x538>
     694:      	cmp	x16, #0x0
     698:      	b.eq	0x6a0 <_stogir.verify.structure+0x530>
     69c:      	b	0x6a8 <_stogir.verify.structure+0x538>
     6a0:      	b	0x6ac <_stogir.verify.structure+0x53c>
     6a4:      	b	0x6c0 <_stogir.verify.structure+0x550>
     6a8:      	b	0xa64 <_stogir.verify.structure+0x8f4>
     6ac:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000006ac:  ARM64_RELOC_PAGE21	l_stogir.321
     6b0:      	ldr	x16, [x16]
		00000000000006b0:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     6b4:      	str	x16, [sp, #0x38]
     6b8:      	mov	x16, #0x21              ; =33
     6bc:      	str	x16, [sp, #0x80]
     6c0:      	cmp	x20, #0xf
     6c4:      	b.hs	0xb3c <_stogir.verify.structure+0x9cc>
     6c8:      	mov	x16, #0x1               ; =1
     6cc:      	lsl	x0, x16, x20
     6d0:      	mov	w17, #0x5e1c            ; =24092
     6d4:      	and	w0, w0, w17
     6d8:      	ubfx	x0, x0, #0, #32
     6dc:      	cmp	x0, #0x0
     6e0:      	b.eq	0xb54 <_stogir.verify.structure+0x9e4>
     6e4:      	cmp	x21, #0x0
     6e8:      	b.eq	0x8e8 <_stogir.verify.structure+0x778>
     6ec:      	ldr	x0, [sp, #0x58]
     6f0:      	ldr	x3, [sp, #0x50]
     6f4:      	ldr	x4, [sp, #0x48]
     6f8:      	b	0x41c <_stogir.verify.structure+0x2ac>
     6fc:      	orr	w0, w26, wzr
     700:      	cmp	x24, #0x78
     704:      	cset	w27, eq
     708:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000708:  ARM64_RELOC_PAGE21	l_stogir.322
     70c:      	ldr	x16, [x16]
		000000000000070c:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     710:      	add	x1, x16, x24, lsl #2
     714:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000714:  ARM64_RELOC_PAGE21	l_stogir.322
     718:      	ldr	x16, [x16]
		0000000000000718:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     71c:      	add	x2, x16, x24, lsl #2
     720:      	cmp	x21, #0x0
     724:      	cset	w21, eq
     728:      	orr	x24, x1, xzr
     72c:      	orr	x1, x2, xzr
     730:      	mov	x2, #0x1                ; =1
     734:      	b	0x544 <_stogir.verify.structure+0x3d4>
     738:      	movz	x1, #0x0, lsl #48
     73c:      	cmp	x1, #0x0
     740:      	b.eq	0x6fc <_stogir.verify.structure+0x58c>
     744:      	add	x1, x0, x26
     748:      	ldr	x2, [x19, #0x78]
     74c:      	add	x1, x2, x1, lsl #2
     750:      	ldr	w1, [x1]
     754:      	sxtw	x1, w1
     758:      	cmn	x1, #0x1
     75c:      	b.eq	0x770 <_stogir.verify.structure+0x600>
     760:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000760:  ARM64_RELOC_PAGE21	l_stogir.323
     764:      	ldr	x16, [x16]
		0000000000000764:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     768:      	str	x16, [sp, #0x38]
     76c:      	mov	x20, #0x1b              ; =27
     770:      	add	x0, x0, #0x1
     774:      	cmp	x20, #0x0
     778:      	b.ne	0x738 <_stogir.verify.structure+0x5c8>
     77c:      	cmp	x0, x22
     780:      	cset	w1, lt
     784:      	ubfx	x1, x1, #0, #8
     788:      	b	0x73c <_stogir.verify.structure+0x5cc>
     78c:      	mov	w0, w27
     790:      	bl	0x790 <_stogir.verify.structure+0x620>
		0000000000000790:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
     794:      	sxtw	x0, w0
     798:      	cmn	x0, #0x1
     79c:      	b.ne	0x7bc <_stogir.verify.structure+0x64c>
     7a0:      	ubfx	x0, x22, #16, #16
     7a4:      	cmp	x28, x0
     7a8:      	b.eq	0x7bc <_stogir.verify.structure+0x64c>
     7ac:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000007ac:  ARM64_RELOC_PAGE21	l_stogir.324
     7b0:      	ldr	x16, [x16]
		00000000000007b0:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     7b4:      	str	x16, [sp, #0x38]
     7b8:      	mov	x20, #0x24              ; =36
     7bc:      	add	x0, x28, #0x4
     7c0:      	ldr	x1, [x19, #0x8]
     7c4:      	asr	x16, x0, #63
     7c8:      	lsr	x16, x16, #62
     7cc:      	add	x0, x0, x16
     7d0:      	asr	x0, x0, #2
     7d4:      	orr	x22, x0, xzr
     7d8:      	add	x0, x22, x26
     7dc:      	cmp	x0, x1
     7e0:      	b.le	0x7f4 <_stogir.verify.structure+0x684>
     7e4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000007e4:  ARM64_RELOC_PAGE21	l_stogir.325
     7e8:      	ldr	x16, [x16]
		00000000000007e8:  ARM64_RELOC_PAGEOFF12	l_stogir.325
     7ec:      	str	x16, [sp, #0x38]
     7f0:      	mov	x20, #0x15              ; =21
     7f4:      	mov	x0, #0x1                ; =1
     7f8:      	b	0x774 <_stogir.verify.structure+0x604>
     7fc:      	ldr	x0, [x25, #0x8]
     800:      	cmp	x27, x0
     804:      	b.gt	0xb6c <_stogir.verify.structure+0x9fc>
     808:      	sub	x0, x27, #0x1
     80c:      	ldr	x2, [sp, #0x60]
     810:      	ldr	x3, [x2, #0x28]
     814:      	mov	x17, #0x18              ; =24
     818:      	mul	x0, x0, x17
     81c:      	add	x0, x0, x3
     820:      	ldr	x3, [x0]
     824:      	ldr	x0, [x0, #0x8]
     828:      	ldr	x4, [x2, #0x8]
     82c:      	cmp	x3, #0x0
     830:      	b.lt	0x858 <_stogir.verify.structure+0x6e8>
     834:      	cmp	x3, x4
     838:      	b.gt	0x858 <_stogir.verify.structure+0x6e8>
     83c:      	cmp	x0, #0x0
     840:      	b.lt	0x858 <_stogir.verify.structure+0x6e8>
     844:      	sub	x3, x4, x3
     848:      	cmp	x0, x3
     84c:      	b.gt	0x858 <_stogir.verify.structure+0x6e8>
     850:      	mov	w0, #0x1                ; =1
     854:      	b	0x85c <_stogir.verify.structure+0x6ec>
     858:      	movz	w0, #0x0, lsl #16
     85c:      	b	0x67c <_stogir.verify.structure+0x50c>
     860:      	mov	w0, #-0x2               ; =-2
     864:      	sxtw	x0, w0
     868:      	cmp	x28, x0
     86c:      	b.eq	0x78c <_stogir.verify.structure+0x61c>
     870:      	ldr	x2, [sp, #0x60]
     874:      	ldr	x0, [sp, #0x58]
     878:      	ldr	x3, [sp, #0x50]
     87c:      	ldr	x4, [sp, #0x48]
     880:      	mov	x5, x26
     884:      	ldr	x20, [sp, #0x40]
     888:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000888:  ARM64_RELOC_PAGE21	l_stogir.326
     88c:      	ldr	x16, [x16]
		000000000000088c:  ARM64_RELOC_PAGEOFF12	l_stogir.326
     890:      	str	x16, [sp, #0x38]
     894:      	mov	x16, #0x23              ; =35
     898:      	str	x16, [sp, #0x80]
     89c:      	b	0x1e4 <_stogir.verify.structure+0x74>
     8a0:      	cmp	x27, #0x0
     8a4:      	b.ne	0xb74 <_stogir.verify.structure+0xa04>
     8a8:      	uxtb	w16, w23
     8ac:      	cmp	w16, wzr
     8b0:      	b.eq	0x9dc <_stogir.verify.structure+0x86c>
     8b4:      	ldr	w1, [x24]
     8b8:      	uxtb	w16, w26
     8bc:      	cmp	w16, wzr
     8c0:      	b.eq	0xa24 <_stogir.verify.structure+0x8b4>
     8c4:      	uxtb	w16, w28
     8c8:      	cmp	w16, wzr
     8cc:      	b.eq	0x8d4 <_stogir.verify.structure+0x764>
     8d0:      	mov	w22, #0x4               ; =4
     8d4:      	lsl	w5, w22, #2
     8d8:      	ubfx	x5, x5, #0, #32
     8dc:      	lsr	x1, x1, x5
     8e0:      	and	w1, w1, #0xf
     8e4:      	b	0xa28 <_stogir.verify.structure+0x8b8>
     8e8:      	cmp	x27, #0x0
     8ec:      	b.le	0xb80 <_stogir.verify.structure+0xa10>
     8f0:      	ldr	x0, [x19, #0x8]
     8f4:      	cmp	x27, x0
     8f8:      	b.ge	0xb88 <_stogir.verify.structure+0xa18>
     8fc:      	ldr	x0, [sp, #0x58]
     900:      	ldr	x1, [x0, #0x8]
     904:      	cmp	x27, x1
     908:      	b.ge	0xa34 <_stogir.verify.structure+0x8c4>
     90c:      	ldr	x1, [x19, #0x78]
     910:      	add	x1, x1, x27, lsl #2
     914:      	ldr	w1, [x1]
     918:      	sxtw	x1, w1
     91c:      	cmp	x1, #0x0
     920:      	cset	w1, ge
     924:      	ubfx	x1, x1, #0, #8
     928:      	b	0xa38 <_stogir.verify.structure+0x8c8>
     92c:      	ldr	w1, [sp, #0xb0]
     930:      	uxtb	w16, w1
     934:      	cmp	w16, wzr
     938:      	b.eq	0xb90 <_stogir.verify.structure+0xa20>
     93c:      	ldr	w5, [sp, #0xa8]
     940:      	uxtb	w16, w5
     944:      	cmp	w16, wzr
     948:      	b.eq	0x958 <_stogir.verify.structure+0x7e8>
     94c:      	ldr	x6, [sp, #0xa0]
     950:      	cmp	x6, #0x2
     954:      	b.eq	0x42c <_stogir.verify.structure+0x2bc>
     958:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000958:  ARM64_RELOC_PAGE21	l_stogir.327
     95c:      	ldr	x16, [x16]
		000000000000095c:  ARM64_RELOC_PAGEOFF12	l_stogir.327
     960:      	str	x16, [sp, #0x38]
     964:      	mov	x16, #0x1a              ; =26
     968:      	str	x16, [sp, #0x80]
     96c:      	b	0x42c <_stogir.verify.structure+0x2bc>
     970:      	movz	x1, #0x0, lsl #48
     974:      	ldr	x3, [sp, #0x50]
     978:      	ldr	x4, [sp, #0x48]
     97c:      	b	0x41c <_stogir.verify.structure+0x2ac>
     980:      	cmp	x27, #0x0
     984:      	b.ge	0xb98 <_stogir.verify.structure+0xa28>
     988:      	ldr	x3, [sp, #0x50]
     98c:      	ldr	x1, [x3, #0x8]
     990:      	ldr	x4, [sp, #0x48]
     994:      	ldr	x5, [x4, #0x8]
     998:      	cmp	x1, x5
     99c:      	b.ne	0xa2c <_stogir.verify.structure+0x8bc>
     9a0:      	movz	x16, #0x0, lsl #48
     9a4:      	sub	x5, x16, x27
     9a8:      	cmp	x5, x1
     9ac:      	b.gt	0xa5c <_stogir.verify.structure+0x8ec>
     9b0:      	sub	x1, x5, #0x1
     9b4:      	ldr	x5, [x19, #0x50]
     9b8:      	add	x1, x5, x1, lsl #2
     9bc:      	ldr	w1, [x1]
     9c0:      	sxtw	x1, w1
     9c4:      	cmp	x1, #0x0
     9c8:      	cset	w1, gt
     9cc:      	ubfx	x1, x1, #0, #8
     9d0:      	b	0xa60 <_stogir.verify.structure+0x8f0>
     9d4:      	brk	#0
     9d8:      	b	0x9d4 <_stogir.verify.structure+0x864>
     9dc:      	movz	w1, #0x0, lsl #16
     9e0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000009e0:  ARM64_RELOC_PAGE21	l_stogir.328
     9e4:      	ldr	x16, [x16]
		00000000000009e4:  ARM64_RELOC_PAGEOFF12	l_stogir.328
     9e8:      	ldr	w5, [x16]
     9ec:      	ubfx	x1, x1, #0, #32
     9f0:      	cmp	x1, x5
     9f4:      	b.ne	0xa04 <_stogir.verify.structure+0x894>
     9f8:      	ldr	w1, [sp, #0xb0]
     9fc:      	ldr	w5, [sp, #0xa8]
     a00:      	b	0x42c <_stogir.verify.structure+0x2bc>
     a04:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000a04:  ARM64_RELOC_PAGE21	l_stogir.329
     a08:      	ldr	x16, [x16]
		0000000000000a08:  ARM64_RELOC_PAGEOFF12	l_stogir.329
     a0c:      	ldr	w5, [x16]
     a10:      	cmp	x1, x5
     a14:      	b.ne	0xa3c <_stogir.verify.structure+0x8cc>
     a18:      	ldr	w1, [sp, #0xb0]
     a1c:      	ldr	w5, [sp, #0xa8]
     a20:      	b	0x42c <_stogir.verify.structure+0x2bc>
     a24:      	movz	w1, #0x0, lsl #16
     a28:      	b	0x9e0 <_stogir.verify.structure+0x870>
     a2c:      	movz	x1, #0x0, lsl #48
     a30:      	b	0x41c <_stogir.verify.structure+0x2ac>
     a34:      	movz	x1, #0x0, lsl #48
     a38:      	b	0x974 <_stogir.verify.structure+0x804>
     a3c:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000a3c:  ARM64_RELOC_PAGE21	l_stogir.330
     a40:      	ldr	x16, [x16]
		0000000000000a40:  ARM64_RELOC_PAGEOFF12	l_stogir.330
     a44:      	ldr	w5, [x16]
     a48:      	cmp	x1, x5
     a4c:      	b.ne	0x92c <_stogir.verify.structure+0x7bc>
     a50:      	ldr	w1, [sp, #0xb0]
     a54:      	ldr	w5, [sp, #0xa8]
     a58:      	b	0x42c <_stogir.verify.structure+0x2bc>
     a5c:      	movz	x1, #0x0, lsl #48
     a60:      	b	0xa30 <_stogir.verify.structure+0x8c0>
     a64:      	brk	#0
     a68:      	b	0xa64 <_stogir.verify.structure+0x8f4>
     a6c:      	str	x8, [sp, #0x30]
     a70:      	str	x19, [sp, #0x38]
     a74:      	str	x20, [sp, #0x80]
     a78:      	mov	x20, x27
     a7c:      	b	0x37c <_stogir.verify.structure+0x20c>
     a80:      	str	x8, [sp, #0x30]
     a84:      	str	x19, [sp, #0x38]
     a88:      	str	x20, [sp, #0x80]
     a8c:      	mov	x20, x27
     a90:      	b	0x37c <_stogir.verify.structure+0x20c>
     a94:      	mov	x5, x26
     a98:      	mov	x20, x27
     a9c:      	str	x8, [sp, #0x30]
     aa0:      	mov	x19, x0
     aa4:      	mov	x2, x21
     aa8:      	mov	x0, x22
     aac:      	mov	x3, x23
     ab0:      	mov	x4, x24
     ab4:      	b	0x250 <_stogir.verify.structure+0xe0>
     ab8:      	mov	x5, x26
     abc:      	mov	x20, x27
     ac0:      	str	x8, [sp, #0x30]
     ac4:      	mov	x19, x0
     ac8:      	mov	x2, x21
     acc:      	mov	x0, x22
     ad0:      	mov	x3, x23
     ad4:      	mov	x4, x24
     ad8:      	b	0x214 <_stogir.verify.structure+0xa4>
     adc:      	mov	x5, x26
     ae0:      	ldr	x20, [sp, #0x40]
     ae4:      	ldr	x2, [sp, #0x60]
     ae8:      	ldr	x0, [sp, #0x58]
     aec:      	ldr	x3, [sp, #0x50]
     af0:      	ldr	x4, [sp, #0x48]
     af4:      	b	0x214 <_stogir.verify.structure+0xa4>
     af8:      	ldr	x0, [sp, #0x38]
     afc:      	b	0x3b0 <_stogir.verify.structure+0x240>
     b00:      	str	x26, [sp, #0x90]
     b04:      	str	x22, [sp, #0x88]
     b08:      	ldr	x2, [sp, #0x60]
     b0c:      	str	x20, [sp, #0x80]
     b10:      	ldr	x0, [sp, #0x58]
     b14:      	ldr	x3, [sp, #0x50]
     b18:      	ldr	x4, [sp, #0x48]
     b1c:      	b	0x1cc <_stogir.verify.structure+0x5c>
     b20:      	str	w27, [sp, #0xb0]
     b24:      	mov	w27, w1
     b28:      	str	w21, [sp, #0xa8]
     b2c:      	mov	x21, x0
     b30:      	b	0x5d4 <_stogir.verify.structure+0x464>
     b34:      	ldr	x2, [sp, #0x60]
     b38:      	b	0x6c0 <_stogir.verify.structure+0x550>
     b3c:      	ldr	x0, [sp, #0x58]
     b40:      	ldr	x3, [sp, #0x50]
     b44:      	ldr	x4, [sp, #0x48]
     b48:      	ldr	w1, [sp, #0xb0]
     b4c:      	ldr	w5, [sp, #0xa8]
     b50:      	b	0x42c <_stogir.verify.structure+0x2bc>
     b54:      	ldr	x0, [sp, #0x58]
     b58:      	ldr	x3, [sp, #0x50]
     b5c:      	ldr	x4, [sp, #0x48]
     b60:      	ldr	w1, [sp, #0xb0]
     b64:      	ldr	w5, [sp, #0xa8]
     b68:      	b	0x42c <_stogir.verify.structure+0x2bc>
     b6c:      	ldr	x2, [sp, #0x60]
     b70:      	b	0x678 <_stogir.verify.structure+0x508>
     b74:      	ldr	w1, [sp, #0xb0]
     b78:      	ldr	w5, [sp, #0xa8]
     b7c:      	b	0x958 <_stogir.verify.structure+0x7e8>
     b80:      	ldr	x0, [sp, #0x58]
     b84:      	b	0x980 <_stogir.verify.structure+0x810>
     b88:      	ldr	x0, [sp, #0x58]
     b8c:      	b	0x970 <_stogir.verify.structure+0x800>
     b90:      	ldr	w5, [sp, #0xa8]
     b94:      	b	0x958 <_stogir.verify.structure+0x7e8>
     b98:      	ldr	x3, [sp, #0x50]
     b9c:      	ldr	x4, [sp, #0x48]
     ba0:      	b	0x418 <_stogir.verify.structure+0x2a8>

0000000000000ba4 <_stogir.verify.integer-operations-target-structured>:
     ba4:      	sub	sp, sp, #0x350
     ba8:      	str	x29, [sp, #0x10]
     bac:      	str	x30, [sp, #0x18]
     bb0:      	add	x29, sp, #0x10
     bb4:      	str	x19, [sp, #0x2f8]
     bb8:      	str	x20, [sp, #0x300]
     bbc:      	str	x21, [sp, #0x308]
     bc0:      	str	x22, [sp, #0x310]
     bc4:      	str	x23, [sp, #0x318]
     bc8:      	str	x24, [sp, #0x320]
     bcc:      	str	x25, [sp, #0x328]
     bd0:      	str	x26, [sp, #0x330]
     bd4:      	str	x27, [sp, #0x338]
     bd8:      	str	x28, [sp, #0x340]
     bdc:      	add	x19, x0, #0x78
     be0:      	add	x20, x0, #0x28
     be4:      	add	x21, x0, #0x50
     be8:      	orr	w22, w1, wzr
     bec:      	orr	w23, w1, wzr
     bf0:      	orr	w24, w1, wzr
     bf4:      	add	x16, sp, #0x20
     bf8:      	orr	x25, x16, xzr
     bfc:      	add	x16, sp, #0x30
     c00:      	orr	x1, x16, xzr
     c04:      	add	x26, x1, #0x8
     c08:      	add	x16, sp, #0x50
     c0c:      	orr	x1, x16, xzr
     c10:      	add	x27, x1, #0x8
     c14:      	add	x16, sp, #0xe0
     c18:      	orr	x1, x16, xzr
     c1c:      	add	x28, x1, #0x8
     c20:      	add	x16, sp, #0x100
     c24:      	orr	x1, x16, xzr
     c28:      	add	x1, x1, #0x8
     c2c:      	add	x16, sp, #0x120
     c30:      	orr	x2, x16, xzr
     c34:      	add	x2, x2, #0x8
     c38:      	add	x16, sp, #0x140
     c3c:      	orr	x3, x16, xzr
     c40:      	add	x3, x3, #0x8
     c44:      	add	x16, sp, #0x160
     c48:      	orr	x4, x16, xzr
     c4c:      	add	x4, x4, #0x8
     c50:      	add	x16, sp, #0x180
     c54:      	orr	x5, x16, xzr
     c58:      	add	x5, x5, #0x8
     c5c:      	add	x16, sp, #0x1a0
     c60:      	orr	x6, x16, xzr
     c64:      	add	x6, x6, #0x8
     c68:      	add	x16, sp, #0x1f0
     c6c:      	orr	x7, x16, xzr
     c70:      	add	x7, x7, #0x8
     c74:      	mov	x9, #0x1                ; =1
     c78:      	movz	x10, #0x0, lsl #48
     c7c:      	adrp	x11, 0x0 <_gap_verify_graph>
		0000000000000c7c:  ARM64_RELOC_PAGE21	l_stogir.331
     c80:      	ldr	x11, [x11]
		0000000000000c80:  ARM64_RELOC_PAGEOFF12	l_stogir.331
     c84:      	movz	x12, #0x0, lsl #48
     c88:      	cmp	x12, #0x0
     c8c:      	b.ne	0x1c60 <_stogir.verify.integer-operations-target-structured+0x10bc>
     c90:      	ldr	x13, [x0, #0x8]
     c94:      	cmp	x9, x13
     c98:      	b.ge	0x1c74 <_stogir.verify.integer-operations-target-structured+0x10d0>
     c9c:      	ldr	x13, [x0]
     ca0:      	add	x13, x13, x9, lsl #4
     ca4:      	ldr	x14, [x13]
     ca8:      	uxtb	w15, w14
     cac:      	ldr	x13, [x13, #0x8]
     cb0:      	str	w22, [sp, #0x230]
     cb4:      	orr	x22, x15, xzr
     cb8:      	add	x16, sp, #0x20
     cbc:      	str	x14, [x16]
     cc0:      	add	x16, sp, #0x20
     cc4:      	str	x13, [x16, #0x8]
     cc8:      	ldr	x13, [x0, #0x78]
     ccc:      	add	x13, x13, x9, lsl #2
     cd0:      	ldr	w13, [x13]
     cd4:      	cmp	x22, #0x83
     cd8:      	b.ge	0x14c0 <_stogir.verify.integer-operations-target-structured+0x91c>
     cdc:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000cdc:  ARM64_RELOC_PAGE21	l_stogir.332
     ce0:      	ldr	x16, [x16]
		0000000000000ce0:  ARM64_RELOC_PAGEOFF12	l_stogir.332
     ce4:      	add	x14, x16, x22, lsl #1
     ce8:      	ldrh	w14, [x14]
     cec:      	cmp	x22, #0xe
     cf0:      	b.lt	0x1c88 <_stogir.verify.integer-operations-target-structured+0x10e4>
     cf4:      	str	x0, [sp, #0x238]
     cf8:      	cmp	x22, #0x17
     cfc:      	cset	w0, le
     d00:      	ubfx	x0, x0, #0, #8
     d04:      	str	x0, [sp, #0x240]
     d08:      	orr	w0, w9, wzr
     d0c:      	str	x1, [sp, #0x248]
     d10:      	and	w1, w14, #0x4
     d14:      	ubfx	x1, x1, #0, #32
     d18:      	str	x8, [sp, #0x268]
     d1c:      	str	x2, [sp, #0x2d0]
     d20:      	mov	x2, x25
     d24:      	str	x3, [sp, #0x2c0]
     d28:      	mov	w3, w13
     d2c:      	str	x4, [sp, #0x2a8]
     d30:      	str	x5, [sp, #0x2a0]
     d34:      	str	x6, [sp, #0x298]
     d38:      	str	x7, [sp, #0x288]
     d3c:      	str	x9, [sp, #0x290]
     d40:      	str	w15, [sp, #0x2b0]
     d44:      	str	w13, [sp, #0x2b8]
     d48:      	str	w0, [sp, #0x2c8]
     d4c:      	str	w23, [sp, #0x250]
     d50:      	mov	x23, x1
     d54:      	mov	w1, w0
     d58:      	ldr	x0, [sp, #0x238]
     d5c:      	str	w24, [sp, #0x258]
     d60:      	mov	x24, x10
     d64:      	str	x25, [sp, #0x260]
     d68:      	ldr	x25, [sp, #0x248]
     d6c:      	str	x21, [sp, #0x270]
     d70:      	mov	w21, w14
     d74:      	str	x20, [sp, #0x278]
     d78:      	mov	x20, x12
     d7c:      	str	x19, [sp, #0x280]
     d80:      	mov	x19, x11
     d84:      	bl	0xd84 <_stogir.verify.integer-operations-target-structured+0x1e0>
		0000000000000d84:  ARM64_RELOC_BRANCH26	_stogir.verify.classifications
     d88:      	uxtb	w1, w0
     d8c:      	cmp	x1, #0x0
     d90:      	cset	w1, ne
     d94:      	cmp	x23, #0x0
     d98:      	b.ne	0x14d0 <_stogir.verify.integer-operations-target-structured+0x92c>
     d9c:      	uxtb	w16, w1
     da0:      	cmp	w16, wzr
     da4:      	b.ne	0x14d0 <_stogir.verify.integer-operations-target-structured+0x92c>
     da8:      	str	x0, [sp, #0x2d8]
     dac:      	mov	w23, w1
     db0:      	cmp	x22, #0x44
     db4:      	b.ne	0x1544 <_stogir.verify.integer-operations-target-structured+0x9a0>
     db8:      	uxtb	w16, w23
     dbc:      	cmp	w16, wzr
     dc0:      	b.eq	0x153c <_stogir.verify.integer-operations-target-structured+0x998>
     dc4:      	movz	x0, #0x0, lsl #48
     dc8:      	cmp	x0, #0x0
     dcc:      	b.eq	0xe20 <_stogir.verify.integer-operations-target-structured+0x27c>
     dd0:      	add	x8, sp, #0x50
     dd4:      	ldr	x0, [sp, #0x238]
     dd8:      	ldr	w1, [sp, #0x2c8]
     ddc:      	bl	0xddc <_stogir.verify.integer-operations-target-structured+0x238>
		0000000000000ddc:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
     de0:      	add	x16, sp, #0x50
     de4:      	ldr	w0, [x16]
     de8:      	lsr	x16, x0, #0
     dec:      	cmp	x16, #0x1
     df0:      	b.eq	0xe0c <_stogir.verify.integer-operations-target-structured+0x268>
     df4:      	b.lo	0xdfc <_stogir.verify.integer-operations-target-structured+0x258>
     df8:      	b	0xe10 <_stogir.verify.integer-operations-target-structured+0x26c>
     dfc:      	cmp	x16, #0x0
     e00:      	b.eq	0xe08 <_stogir.verify.integer-operations-target-structured+0x264>
     e04:      	b	0xe10 <_stogir.verify.integer-operations-target-structured+0x26c>
     e08:      	b	0x154c <_stogir.verify.integer-operations-target-structured+0x9a8>
     e0c:      	b	0xe14 <_stogir.verify.integer-operations-target-structured+0x270>
     e10:      	b	0x1558 <_stogir.verify.integer-operations-target-structured+0x9b4>
     e14:      	add	x16, sp, #0x50
     e18:      	ldr	x19, [x16, #0x8]
     e1c:      	ldr	x20, [x27, #0x8]
     e20:      	cmp	x22, #0x1d
     e24:      	b.ne	0x1560 <_stogir.verify.integer-operations-target-structured+0x9bc>
     e28:      	mov	x0, #0x1                ; =1
     e2c:      	cmp	x0, #0x0
     e30:      	b.eq	0x1578 <_stogir.verify.integer-operations-target-structured+0x9d4>
     e34:      	add	x16, sp, #0x20
     e38:      	ldr	w0, [x16, #0xc]
     e3c:      	sxtw	x0, w0
     e40:      	cmp	x0, #0x0
     e44:      	b.ne	0x1570 <_stogir.verify.integer-operations-target-structured+0x9cc>
     e48:      	movz	x0, #0x0, lsl #48
     e4c:      	cmp	x0, #0x0
     e50:      	b.eq	0xeac <_stogir.verify.integer-operations-target-structured+0x308>
     e54:      	add	x16, sp, #0x20
     e58:      	ldr	w0, [x16, #0xc]
     e5c:      	add	x8, sp, #0x70
     e60:      	mov	w1, w0
     e64:      	ldr	x0, [sp, #0x238]
     e68:      	bl	0xe68 <_stogir.verify.integer-operations-target-structured+0x2c4>
		0000000000000e68:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
     e6c:      	add	x16, sp, #0x70
     e70:      	ldr	w0, [x16]
     e74:      	lsr	x16, x0, #0
     e78:      	cmp	x16, #0x1
     e7c:      	b.eq	0xe98 <_stogir.verify.integer-operations-target-structured+0x2f4>
     e80:      	b.lo	0xe88 <_stogir.verify.integer-operations-target-structured+0x2e4>
     e84:      	b	0xe9c <_stogir.verify.integer-operations-target-structured+0x2f8>
     e88:      	cmp	x16, #0x0
     e8c:      	b.eq	0xe94 <_stogir.verify.integer-operations-target-structured+0x2f0>
     e90:      	b	0xe9c <_stogir.verify.integer-operations-target-structured+0x2f8>
     e94:      	b	0xea0 <_stogir.verify.integer-operations-target-structured+0x2fc>
     e98:      	b	0x1580 <_stogir.verify.integer-operations-target-structured+0x9dc>
     e9c:      	b	0x1628 <_stogir.verify.integer-operations-target-structured+0xa84>
     ea0:      	adrp	x19, 0x0 <_gap_verify_graph>
		0000000000000ea0:  ARM64_RELOC_PAGE21	l_stogir.333
     ea4:      	ldr	x19, [x19]
		0000000000000ea4:  ARM64_RELOC_PAGEOFF12	l_stogir.333
     ea8:      	mov	x20, #0x16              ; =22
     eac:      	and	w0, w21, #0x8
     eb0:      	ubfx	x0, x0, #0, #32
     eb4:      	cmp	x0, #0x0
     eb8:      	b.ne	0x1630 <_stogir.verify.integer-operations-target-structured+0xa8c>
     ebc:      	movz	x0, #0x0, lsl #48
     ec0:      	cmp	x22, #0x2c
     ec4:      	cset	w1, eq
     ec8:      	cmp	x0, #0x0
     ecc:      	b.eq	0x1638 <_stogir.verify.integer-operations-target-structured+0xa94>
     ed0:      	mov	x0, #0x1                ; =1
     ed4:      	cmp	x0, #0x0
     ed8:      	b.eq	0xf48 <_stogir.verify.integer-operations-target-structured+0x3a4>
     edc:      	uxtb	w16, w1
     ee0:      	cmp	w16, wzr
     ee4:      	b.eq	0x1640 <_stogir.verify.integer-operations-target-structured+0xa9c>
     ee8:      	add	x8, sp, #0xa0
     eec:      	ldr	x0, [sp, #0x238]
     ef0:      	ldr	w1, [sp, #0x2c8]
     ef4:      	bl	0xef4 <_stogir.verify.integer-operations-target-structured+0x350>
		0000000000000ef4:  ARM64_RELOC_BRANCH26	_stogir.checked.validate-projection
     ef8:      	add	x16, sp, #0xa0
     efc:      	ldr	x0, [x16]
     f00:      	add	x16, sp, #0xa0
     f04:      	ldr	x1, [x16, #0x8]
     f08:      	add	x16, sp, #0xa0
     f0c:      	ldr	x2, [x16, #0x10]
     f10:      	ubfx	x0, x0, #0, #32
     f14:      	lsr	x16, x0, #0
     f18:      	cmp	x16, #0x1
     f1c:      	b.eq	0xf38 <_stogir.verify.integer-operations-target-structured+0x394>
     f20:      	b.lo	0xf28 <_stogir.verify.integer-operations-target-structured+0x384>
     f24:      	b	0xf3c <_stogir.verify.integer-operations-target-structured+0x398>
     f28:      	cmp	x16, #0x0
     f2c:      	b.eq	0xf34 <_stogir.verify.integer-operations-target-structured+0x390>
     f30:      	b	0xf3c <_stogir.verify.integer-operations-target-structured+0x398>
     f34:      	b	0x166c <_stogir.verify.integer-operations-target-structured+0xac8>
     f38:      	b	0xf40 <_stogir.verify.integer-operations-target-structured+0x39c>
     f3c:      	b	0x1678 <_stogir.verify.integer-operations-target-structured+0xad4>
     f40:      	mov	x19, x1
     f44:      	mov	x20, x2
     f48:      	and	w0, w21, #0x10
     f4c:      	ubfx	x0, x0, #0, #32
     f50:      	cmp	x0, #0x0
     f54:      	b.ne	0x1680 <_stogir.verify.integer-operations-target-structured+0xadc>
     f58:      	movz	x0, #0x0, lsl #48
     f5c:      	cmp	x0, #0x0
     f60:      	b.eq	0xfb4 <_stogir.verify.integer-operations-target-structured+0x410>
     f64:      	add	x8, sp, #0xe0
     f68:      	ldr	x0, [sp, #0x238]
     f6c:      	ldr	w1, [sp, #0x2c8]
     f70:      	bl	0xf70 <_stogir.verify.integer-operations-target-structured+0x3cc>
		0000000000000f70:  ARM64_RELOC_BRANCH26	_stogir.atomic.validate
     f74:      	add	x16, sp, #0xe0
     f78:      	ldr	w0, [x16]
     f7c:      	lsr	x16, x0, #0
     f80:      	cmp	x16, #0x1
     f84:      	b.eq	0xfa0 <_stogir.verify.integer-operations-target-structured+0x3fc>
     f88:      	b.lo	0xf90 <_stogir.verify.integer-operations-target-structured+0x3ec>
     f8c:      	b	0xfa4 <_stogir.verify.integer-operations-target-structured+0x400>
     f90:      	cmp	x16, #0x0
     f94:      	b.eq	0xf9c <_stogir.verify.integer-operations-target-structured+0x3f8>
     f98:      	b	0xfa4 <_stogir.verify.integer-operations-target-structured+0x400>
     f9c:      	b	0x1688 <_stogir.verify.integer-operations-target-structured+0xae4>
     fa0:      	b	0xfa8 <_stogir.verify.integer-operations-target-structured+0x404>
     fa4:      	b	0x1694 <_stogir.verify.integer-operations-target-structured+0xaf0>
     fa8:      	add	x16, sp, #0xe0
     fac:      	ldr	x19, [x16, #0x8]
     fb0:      	ldr	x20, [x28, #0x8]
     fb4:      	and	w0, w21, #0x20
     fb8:      	ubfx	x0, x0, #0, #32
     fbc:      	cmp	x0, #0x0
     fc0:      	b.ne	0x169c <_stogir.verify.integer-operations-target-structured+0xaf8>
     fc4:      	movz	x0, #0x0, lsl #48
     fc8:      	cmp	x0, #0x0
     fcc:      	b.eq	0x1020 <_stogir.verify.integer-operations-target-structured+0x47c>
     fd0:      	add	x8, sp, #0x100
     fd4:      	ldr	x0, [sp, #0x238]
     fd8:      	ldr	w1, [sp, #0x2c8]
     fdc:      	bl	0xfdc <_stogir.verify.integer-operations-target-structured+0x438>
		0000000000000fdc:  ARM64_RELOC_BRANCH26	_stogir.terminal.validate
     fe0:      	add	x16, sp, #0x100
     fe4:      	ldr	w0, [x16]
     fe8:      	lsr	x16, x0, #0
     fec:      	cmp	x16, #0x1
     ff0:      	b.eq	0x100c <_stogir.verify.integer-operations-target-structured+0x468>
     ff4:      	b.lo	0xffc <_stogir.verify.integer-operations-target-structured+0x458>
     ff8:      	b	0x1010 <_stogir.verify.integer-operations-target-structured+0x46c>
     ffc:      	cmp	x16, #0x0
    1000:      	b.eq	0x1008 <_stogir.verify.integer-operations-target-structured+0x464>
    1004:      	b	0x1010 <_stogir.verify.integer-operations-target-structured+0x46c>
    1008:      	b	0x16a4 <_stogir.verify.integer-operations-target-structured+0xb00>
    100c:      	b	0x1014 <_stogir.verify.integer-operations-target-structured+0x470>
    1010:      	b	0x16b0 <_stogir.verify.integer-operations-target-structured+0xb0c>
    1014:      	add	x16, sp, #0x100
    1018:      	ldr	x19, [x16, #0x8]
    101c:      	ldr	x20, [x25, #0x8]
    1020:      	and	w0, w21, #0x40
    1024:      	ubfx	x0, x0, #0, #32
    1028:      	cmp	x0, #0x0
    102c:      	b.ne	0x16b8 <_stogir.verify.integer-operations-target-structured+0xb14>
    1030:      	movz	x0, #0x0, lsl #48
    1034:      	cmp	x0, #0x0
    1038:      	b.eq	0x1c90 <_stogir.verify.integer-operations-target-structured+0x10ec>
    103c:      	add	x8, sp, #0x120
    1040:      	ldr	x0, [sp, #0x238]
    1044:      	ldr	w1, [sp, #0x2c8]
    1048:      	bl	0x1048 <_stogir.verify.integer-operations-target-structured+0x4a4>
		0000000000001048:  ARM64_RELOC_BRANCH26	_stogir.switch.validate
    104c:      	add	x16, sp, #0x120
    1050:      	ldr	w0, [x16]
    1054:      	lsr	x16, x0, #0
    1058:      	cmp	x16, #0x1
    105c:      	b.eq	0x107c <_stogir.verify.integer-operations-target-structured+0x4d8>
    1060:      	b.lo	0x1068 <_stogir.verify.integer-operations-target-structured+0x4c4>
    1064:      	b	0x1080 <_stogir.verify.integer-operations-target-structured+0x4dc>
    1068:      	cmp	x16, #0x0
    106c:      	b.eq	0x1074 <_stogir.verify.integer-operations-target-structured+0x4d0>
    1070:      	b	0x1080 <_stogir.verify.integer-operations-target-structured+0x4dc>
    1074:      	ldr	x0, [sp, #0x2d0]
    1078:      	b	0x16c0 <_stogir.verify.integer-operations-target-structured+0xb1c>
    107c:      	b	0x1084 <_stogir.verify.integer-operations-target-structured+0x4e0>
    1080:      	b	0x16cc <_stogir.verify.integer-operations-target-structured+0xb28>
    1084:      	add	x16, sp, #0x120
    1088:      	ldr	x19, [x16, #0x8]
    108c:      	ldr	x0, [sp, #0x2d0]
    1090:      	ldr	x20, [x0, #0x8]
    1094:      	and	w1, w21, #0x80
    1098:      	ubfx	x1, x1, #0, #32
    109c:      	cmp	x1, #0x0
    10a0:      	b.ne	0x16d4 <_stogir.verify.integer-operations-target-structured+0xb30>
    10a4:      	movz	x1, #0x0, lsl #48
    10a8:      	cmp	x1, #0x0
    10ac:      	b.eq	0x1c98 <_stogir.verify.integer-operations-target-structured+0x10f4>
    10b0:      	add	x8, sp, #0x140
    10b4:      	ldr	w1, [sp, #0x2c8]
    10b8:      	str	x0, [sp, #0x2d0]
    10bc:      	ldr	x0, [sp, #0x238]
    10c0:      	bl	0x10c0 <_stogir.verify.integer-operations-target-structured+0x51c>
		00000000000010c0:  ARM64_RELOC_BRANCH26	_stogir.stack.validate
    10c4:      	add	x16, sp, #0x140
    10c8:      	ldr	w0, [x16]
    10cc:      	lsr	x16, x0, #0
    10d0:      	cmp	x16, #0x1
    10d4:      	b.eq	0x10f4 <_stogir.verify.integer-operations-target-structured+0x550>
    10d8:      	b.lo	0x10e0 <_stogir.verify.integer-operations-target-structured+0x53c>
    10dc:      	b	0x10f8 <_stogir.verify.integer-operations-target-structured+0x554>
    10e0:      	cmp	x16, #0x0
    10e4:      	b.eq	0x10ec <_stogir.verify.integer-operations-target-structured+0x548>
    10e8:      	b	0x10f8 <_stogir.verify.integer-operations-target-structured+0x554>
    10ec:      	ldr	x0, [sp, #0x2c0]
    10f0:      	b	0x16dc <_stogir.verify.integer-operations-target-structured+0xb38>
    10f4:      	b	0x10fc <_stogir.verify.integer-operations-target-structured+0x558>
    10f8:      	b	0x16e8 <_stogir.verify.integer-operations-target-structured+0xb44>
    10fc:      	add	x16, sp, #0x140
    1100:      	ldr	x19, [x16, #0x8]
    1104:      	ldr	x0, [sp, #0x2c0]
    1108:      	ldr	x20, [x0, #0x8]
    110c:      	and	w1, w21, #0x100
    1110:      	ubfx	x1, x1, #0, #32
    1114:      	cmp	x1, #0x0
    1118:      	b.ne	0x16f0 <_stogir.verify.integer-operations-target-structured+0xb4c>
    111c:      	movz	x1, #0x0, lsl #48
    1120:      	cmp	x1, #0x0
    1124:      	b.eq	0x1ca4 <_stogir.verify.integer-operations-target-structured+0x1100>
    1128:      	add	x8, sp, #0x160
    112c:      	ldr	w1, [sp, #0x2c8]
    1130:      	ldr	w2, [sp, #0x250]
    1134:      	str	x0, [sp, #0x2c0]
    1138:      	ldr	x0, [sp, #0x238]
    113c:      	bl	0x113c <_stogir.verify.integer-operations-target-structured+0x598>
		000000000000113c:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    1140:      	add	x16, sp, #0x160
    1144:      	ldr	w0, [x16]
    1148:      	lsr	x16, x0, #0
    114c:      	cmp	x16, #0x1
    1150:      	b.eq	0x1170 <_stogir.verify.integer-operations-target-structured+0x5cc>
    1154:      	b.lo	0x115c <_stogir.verify.integer-operations-target-structured+0x5b8>
    1158:      	b	0x1174 <_stogir.verify.integer-operations-target-structured+0x5d0>
    115c:      	cmp	x16, #0x0
    1160:      	b.eq	0x1168 <_stogir.verify.integer-operations-target-structured+0x5c4>
    1164:      	b	0x1174 <_stogir.verify.integer-operations-target-structured+0x5d0>
    1168:      	ldr	x0, [sp, #0x2a8]
    116c:      	b	0x16f8 <_stogir.verify.integer-operations-target-structured+0xb54>
    1170:      	b	0x1178 <_stogir.verify.integer-operations-target-structured+0x5d4>
    1174:      	b	0x1704 <_stogir.verify.integer-operations-target-structured+0xb60>
    1178:      	add	x16, sp, #0x160
    117c:      	ldr	x19, [x16, #0x8]
    1180:      	ldr	x0, [sp, #0x2a8]
    1184:      	ldr	x20, [x0, #0x8]
    1188:      	and	w1, w21, #0x200
    118c:      	ubfx	x1, x1, #0, #32
    1190:      	cmp	x1, #0x0
    1194:      	b.ne	0x170c <_stogir.verify.integer-operations-target-structured+0xb68>
    1198:      	movz	x1, #0x0, lsl #48
    119c:      	cmp	x1, #0x0
    11a0:      	b.eq	0x1cb0 <_stogir.verify.integer-operations-target-structured+0x110c>
    11a4:      	add	x8, sp, #0x180
    11a8:      	ldr	w1, [sp, #0x2c8]
    11ac:      	ldr	w2, [sp, #0x258]
    11b0:      	str	x0, [sp, #0x2a8]
    11b4:      	ldr	x0, [sp, #0x238]
    11b8:      	bl	0x11b8 <_stogir.verify.integer-operations-target-structured+0x614>
		00000000000011b8:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    11bc:      	add	x16, sp, #0x180
    11c0:      	ldr	w0, [x16]
    11c4:      	lsr	x16, x0, #0
    11c8:      	cmp	x16, #0x1
    11cc:      	b.eq	0x11ec <_stogir.verify.integer-operations-target-structured+0x648>
    11d0:      	b.lo	0x11d8 <_stogir.verify.integer-operations-target-structured+0x634>
    11d4:      	b	0x11f0 <_stogir.verify.integer-operations-target-structured+0x64c>
    11d8:      	cmp	x16, #0x0
    11dc:      	b.eq	0x11e4 <_stogir.verify.integer-operations-target-structured+0x640>
    11e0:      	b	0x11f0 <_stogir.verify.integer-operations-target-structured+0x64c>
    11e4:      	ldr	x0, [sp, #0x2a0]
    11e8:      	b	0x1714 <_stogir.verify.integer-operations-target-structured+0xb70>
    11ec:      	b	0x11f4 <_stogir.verify.integer-operations-target-structured+0x650>
    11f0:      	b	0x1720 <_stogir.verify.integer-operations-target-structured+0xb7c>
    11f4:      	add	x16, sp, #0x180
    11f8:      	ldr	x19, [x16, #0x8]
    11fc:      	ldr	x0, [sp, #0x2a0]
    1200:      	ldr	x20, [x0, #0x8]
    1204:      	cmp	x22, #0x3c
    1208:      	b.ne	0x1cbc <_stogir.verify.integer-operations-target-structured+0x1118>
    120c:      	add	x8, sp, #0x1a0
    1210:      	ldr	w1, [sp, #0x2c8]
    1214:      	str	x0, [sp, #0x2a0]
    1218:      	ldr	x0, [sp, #0x238]
    121c:      	bl	0x121c <_stogir.verify.integer-operations-target-structured+0x678>
		000000000000121c:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    1220:      	add	x16, sp, #0x1a0
    1224:      	ldr	w0, [x16]
    1228:      	lsr	x16, x0, #0
    122c:      	cmp	x16, #0x1
    1230:      	b.eq	0x1250 <_stogir.verify.integer-operations-target-structured+0x6ac>
    1234:      	b.lo	0x123c <_stogir.verify.integer-operations-target-structured+0x698>
    1238:      	b	0x1254 <_stogir.verify.integer-operations-target-structured+0x6b0>
    123c:      	cmp	x16, #0x0
    1240:      	b.eq	0x1248 <_stogir.verify.integer-operations-target-structured+0x6a4>
    1244:      	b	0x1254 <_stogir.verify.integer-operations-target-structured+0x6b0>
    1248:      	ldr	x0, [sp, #0x298]
    124c:      	b	0x1728 <_stogir.verify.integer-operations-target-structured+0xb84>
    1250:      	b	0x1258 <_stogir.verify.integer-operations-target-structured+0x6b4>
    1254:      	b	0x1734 <_stogir.verify.integer-operations-target-structured+0xb90>
    1258:      	add	x16, sp, #0x1a0
    125c:      	ldr	x19, [x16, #0x8]
    1260:      	ldr	x0, [sp, #0x298]
    1264:      	ldr	x20, [x0, #0x8]
    1268:      	cmp	x22, #0x78
    126c:      	b.ne	0x1cc8 <_stogir.verify.integer-operations-target-structured+0x1124>
    1270:      	add	x16, sp, #0x20
    1274:      	ldr	w1, [x16]
    1278:      	ubfx	x1, x1, #8, #8
    127c:      	cmp	x1, #0x0
    1280:      	b.ne	0x173c <_stogir.verify.integer-operations-target-structured+0xb98>
    1284:      	add	x16, sp, #0x20
    1288:      	ldr	w1, [x16, #0x8]
    128c:      	sxtw	x1, w1
    1290:      	cmp	x1, #0x0
    1294:      	b.eq	0x12a4 <_stogir.verify.integer-operations-target-structured+0x700>
    1298:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		0000000000001298:  ARM64_RELOC_PAGE21	l_stogir.334
    129c:      	ldr	x19, [x19]
		000000000000129c:  ARM64_RELOC_PAGEOFF12	l_stogir.334
    12a0:      	mov	x20, #0x1f              ; =31
    12a4:      	str	x0, [sp, #0x298]
    12a8:      	add	x0, x24, #0x1
    12ac:      	sxtw	x24, w0
    12b0:      	ldr	x0, [sp, #0x2d8]
    12b4:      	uxth	w0, w0
    12b8:      	mov	w17, #0x8               ; =8
    12bc:      	uxth	w16, w0
    12c0:      	ubfx	w17, w17, #0, #4
    12c4:      	lsr	w0, w16, w17
    12c8:      	uxth	w0, w0
    12cc:      	uxtb	w0, w0
    12d0:      	cmp	x0, #0x0
    12d4:      	b.eq	0x1cd0 <_stogir.verify.integer-operations-target-structured+0x112c>
    12d8:      	add	x8, sp, #0x1f0
    12dc:      	ldr	w1, [sp, #0x2c8]
    12e0:      	str	x25, [sp, #0x248]
    12e4:      	mov	x25, x0
    12e8:      	ldr	x0, [sp, #0x238]
    12ec:      	bl	0x12ec <_stogir.verify.integer-operations-target-structured+0x748>
		00000000000012ec:  ARM64_RELOC_BRANCH26	_stogir.floating.validate
    12f0:      	add	x16, sp, #0x1f0
    12f4:      	ldr	w0, [x16]
    12f8:      	lsr	x16, x0, #0
    12fc:      	cmp	x16, #0x1
    1300:      	b.eq	0x1320 <_stogir.verify.integer-operations-target-structured+0x77c>
    1304:      	b.lo	0x130c <_stogir.verify.integer-operations-target-structured+0x768>
    1308:      	b	0x1324 <_stogir.verify.integer-operations-target-structured+0x780>
    130c:      	cmp	x16, #0x0
    1310:      	b.eq	0x1318 <_stogir.verify.integer-operations-target-structured+0x774>
    1314:      	b	0x1324 <_stogir.verify.integer-operations-target-structured+0x780>
    1318:      	ldr	x0, [sp, #0x288]
    131c:      	b	0x17d4 <_stogir.verify.integer-operations-target-structured+0xc30>
    1320:      	b	0x1328 <_stogir.verify.integer-operations-target-structured+0x784>
    1324:      	b	0x17e0 <_stogir.verify.integer-operations-target-structured+0xc3c>
    1328:      	add	x16, sp, #0x1f0
    132c:      	ldr	x19, [x16, #0x8]
    1330:      	ldr	x0, [sp, #0x288]
    1334:      	ldr	x20, [x0, #0x8]
    1338:      	uxtb	w16, w23
    133c:      	cmp	w16, wzr
    1340:      	b.eq	0x17e8 <_stogir.verify.integer-operations-target-structured+0xc44>
    1344:      	movz	x1, #0x0, lsl #48
    1348:      	and	w2, w21, #0x1
    134c:      	and	w3, w21, #0x2
    1350:      	ubfx	x2, x2, #0, #32
    1354:      	ubfx	x3, x3, #0, #32
    1358:      	cmp	x2, #0x0
    135c:      	cset	w2, eq
    1360:      	cmp	x3, #0x0
    1364:      	cset	w3, eq
    1368:      	uxtb	w16, w2
    136c:      	cmp	w16, wzr
    1370:      	cset	x21, eq
    1374:      	uxtb	w16, w3
    1378:      	cmp	w16, wzr
    137c:      	cset	x23, eq
    1380:      	cmp	x1, #0x0
    1384:      	b.eq	0x1ce0 <_stogir.verify.integer-operations-target-structured+0x113c>
    1388:      	cmp	x25, #0x0
    138c:      	b.eq	0x17f0 <_stogir.verify.integer-operations-target-structured+0xc4c>
    1390:      	movz	x1, #0x0, lsl #48
    1394:      	cmp	x1, #0x0
    1398:      	b.eq	0x1ce8 <_stogir.verify.integer-operations-target-structured+0x1144>
    139c:      	ldr	x25, [sp, #0x240]
    13a0:      	cmp	x25, #0x0
    13a4:      	b.eq	0x17f8 <_stogir.verify.integer-operations-target-structured+0xc54>
    13a8:      	mov	x1, #0x1                ; =1
    13ac:      	cmp	x1, #0x0
    13b0:      	b.eq	0x1cf0 <_stogir.verify.integer-operations-target-structured+0x114c>
    13b4:      	add	x16, sp, #0x210
    13b8:      	str	x16, [sp]
    13bc:      	ldr	w1, [sp, #0x2c8]
    13c0:      	str	x0, [sp, #0x288]
    13c4:      	ldr	x0, [sp, #0x238]
    13c8:      	mov	x2, #0x1                ; =1
    13cc:      	bl	0x13cc <_stogir.verify.integer-operations-target-structured+0x828>
		00000000000013cc:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    13d0:      	ldr	x16, [sp]
    13d4:      	str	x0, [x16]
    13d8:      	str	x1, [x16, #0x8]
    13dc:      	add	x16, sp, #0x210
    13e0:      	ldr	x0, [x16]
    13e4:      	add	x16, sp, #0x210
    13e8:      	ldr	x1, [x16, #0x8]
    13ec:      	ubfx	x0, x0, #0, #32
    13f0:      	lsr	x16, x0, #0
    13f4:      	cmp	x16, #0x1
    13f8:      	b.eq	0x1414 <_stogir.verify.integer-operations-target-structured+0x870>
    13fc:      	b.lo	0x1404 <_stogir.verify.integer-operations-target-structured+0x860>
    1400:      	b	0x1418 <_stogir.verify.integer-operations-target-structured+0x874>
    1404:      	cmp	x16, #0x0
    1408:      	b.eq	0x1410 <_stogir.verify.integer-operations-target-structured+0x86c>
    140c:      	b	0x1418 <_stogir.verify.integer-operations-target-structured+0x874>
    1410:      	b	0x141c <_stogir.verify.integer-operations-target-structured+0x878>
    1414:      	b	0x1820 <_stogir.verify.integer-operations-target-structured+0xc7c>
    1418:      	b	0x1bec <_stogir.verify.integer-operations-target-structured+0x1048>
    141c:      	str	x26, [sp, #0x2e0]
    1420:      	str	x27, [sp, #0x2e8]
    1424:      	str	x28, [sp, #0x2f0]
    1428:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		0000000000001428:  ARM64_RELOC_PAGE21	l_stogir.335
    142c:      	ldr	x19, [x19]
		000000000000142c:  ARM64_RELOC_PAGEOFF12	l_stogir.335
    1430:      	mov	x20, #0x17              ; =23
    1434:      	add	x0, x24, #0x1
    1438:      	sxtw	x24, w0
    143c:      	ldr	w0, [sp, #0x2b8]
    1440:      	sxtw	x0, w0
    1444:      	add	x0, x0, #0x4
    1448:      	asr	x16, x0, #63
    144c:      	lsr	x16, x16, #62
    1450:      	add	x0, x0, x16
    1454:      	asr	x0, x0, #2
    1458:      	ldr	x1, [sp, #0x290]
    145c:      	add	x1, x0, x1
    1460:      	ldr	x8, [sp, #0x268]
    1464:      	ldr	x0, [sp, #0x238]
    1468:      	ldr	x25, [sp, #0x260]
    146c:      	ldr	w22, [sp, #0x230]
    1470:      	ldr	x26, [sp, #0x2e0]
    1474:      	ldr	x27, [sp, #0x2e8]
    1478:      	ldr	x28, [sp, #0x2f0]
    147c:      	ldr	x2, [sp, #0x2d0]
    1480:      	ldr	x3, [sp, #0x2c0]
    1484:      	ldr	w23, [sp, #0x250]
    1488:      	ldr	x4, [sp, #0x2a8]
    148c:      	ldr	x5, [sp, #0x2a0]
    1490:      	ldr	x6, [sp, #0x298]
    1494:      	ldr	x7, [sp, #0x288]
    1498:      	ldr	x21, [sp, #0x270]
    149c:      	mov	x9, x1
    14a0:      	ldr	x1, [sp, #0x248]
    14a4:      	mov	x10, x24
    14a8:      	ldr	w24, [sp, #0x258]
    14ac:      	mov	x11, x19
    14b0:      	ldr	x19, [sp, #0x280]
    14b4:      	mov	x12, x20
    14b8:      	ldr	x20, [sp, #0x278]
    14bc:      	b	0xc88 <_stogir.verify.integer-operations-target-structured+0xe4>
    14c0:      	movz	w14, #0x0, lsl #16
    14c4:      	b	0xcec <_stogir.verify.integer-operations-target-structured+0x148>
    14c8:      	movz	x0, #0x0, lsl #48
    14cc:      	b	0xd04 <_stogir.verify.integer-operations-target-structured+0x160>
    14d0:      	add	x8, sp, #0x30
    14d4:      	ldr	w2, [sp, #0x230]
    14d8:      	str	x0, [sp, #0x2d8]
    14dc:      	ldr	x0, [sp, #0x238]
    14e0:      	mov	w23, w1
    14e4:      	ldr	w1, [sp, #0x2c8]
    14e8:      	bl	0x14e8 <_stogir.verify.integer-operations-target-structured+0x944>
		00000000000014e8:  ARM64_RELOC_BRANCH26	_stogir.vector.validate
    14ec:      	add	x16, sp, #0x30
    14f0:      	ldr	w0, [x16]
    14f4:      	lsr	x16, x0, #0
    14f8:      	cmp	x16, #0x1
    14fc:      	b.eq	0x1518 <_stogir.verify.integer-operations-target-structured+0x974>
    1500:      	b.lo	0x1508 <_stogir.verify.integer-operations-target-structured+0x964>
    1504:      	b	0x151c <_stogir.verify.integer-operations-target-structured+0x978>
    1508:      	cmp	x16, #0x0
    150c:      	b.eq	0x1514 <_stogir.verify.integer-operations-target-structured+0x970>
    1510:      	b	0x151c <_stogir.verify.integer-operations-target-structured+0x978>
    1514:      	b	0x1530 <_stogir.verify.integer-operations-target-structured+0x98c>
    1518:      	b	0x1520 <_stogir.verify.integer-operations-target-structured+0x97c>
    151c:      	b	0x1bf4 <_stogir.verify.integer-operations-target-structured+0x1050>
    1520:      	add	x16, sp, #0x30
    1524:      	ldr	x19, [x16, #0x8]
    1528:      	ldr	x20, [x26, #0x8]
    152c:      	b	0xdb0 <_stogir.verify.integer-operations-target-structured+0x20c>
    1530:      	add	x0, x24, #0x1
    1534:      	sxtw	x24, w0
    1538:      	b	0x152c <_stogir.verify.integer-operations-target-structured+0x988>
    153c:      	mov	x0, #0x1                ; =1
    1540:      	b	0xdc8 <_stogir.verify.integer-operations-target-structured+0x224>
    1544:      	movz	x0, #0x0, lsl #48
    1548:      	b	0xdc8 <_stogir.verify.integer-operations-target-structured+0x224>
    154c:      	add	x0, x24, #0x1
    1550:      	sxtw	x24, w0
    1554:      	b	0xe20 <_stogir.verify.integer-operations-target-structured+0x27c>
    1558:      	brk	#0
    155c:      	b	0x1558 <_stogir.verify.integer-operations-target-structured+0x9b4>
    1560:      	cmp	x22, #0x1e
    1564:      	cset	w0, eq
    1568:      	ubfx	x0, x0, #0, #8
    156c:      	b	0xe2c <_stogir.verify.integer-operations-target-structured+0x288>
    1570:      	mov	x0, #0x1                ; =1
    1574:      	b	0xe4c <_stogir.verify.integer-operations-target-structured+0x2a8>
    1578:      	movz	x0, #0x0, lsl #48
    157c:      	b	0xe4c <_stogir.verify.integer-operations-target-structured+0x2a8>
    1580:      	add	x16, sp, #0x70
    1584:      	ldr	x0, [x16, #0x8]
    1588:      	add	x16, sp, #0x20
    158c:      	ldr	w1, [x16, #0xc]
    1590:      	sxtw	x1, w1
    1594:      	cmp	x1, #0x0
    1598:      	b.ge	0x15b8 <_stogir.verify.integer-operations-target-structured+0xa14>
    159c:      	mov	x0, #0x1                ; =1
    15a0:      	cmp	x0, #0x0
    15a4:      	b.eq	0x15b4 <_stogir.verify.integer-operations-target-structured+0xa10>
    15a8:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		00000000000015a8:  ARM64_RELOC_PAGE21	l_stogir.336
    15ac:      	ldr	x19, [x19]
		00000000000015ac:  ARM64_RELOC_PAGEOFF12	l_stogir.336
    15b0:      	mov	x20, #0x2d              ; =45
    15b4:      	b	0xeac <_stogir.verify.integer-operations-target-structured+0x308>
    15b8:      	uxtb	w0, w0
    15bc:      	cmp	x0, #0x83
    15c0:      	b.ge	0x1618 <_stogir.verify.integer-operations-target-structured+0xa74>
    15c4:      	adrp	x17, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		00000000000015c4:  ARM64_RELOC_PAGE21	l_stogir.337
    15c8:      	ldr	x17, [x17]
		00000000000015c8:  ARM64_RELOC_PAGEOFF12	l_stogir.337
    15cc:      	add	x1, x0, x17
    15d0:      	ldrb	w1, [x1]
    15d4:      	uxtb	w16, w1
    15d8:      	and	w1, w16, #0x2
    15dc:      	uxtb	w1, w1
    15e0:      	ubfx	x1, x1, #0, #8
    15e4:      	cmp	x1, #0x0
    15e8:      	cset	w1, eq
    15ec:      	uxtb	w16, w1
    15f0:      	cmp	w16, wzr
    15f4:      	cset	x1, eq
    15f8:      	cmp	x1, #0x0
    15fc:      	b.ne	0x1620 <_stogir.verify.integer-operations-target-structured+0xa7c>
    1600:      	cmp	x0, #0x65
    1604:      	b.eq	0x1620 <_stogir.verify.integer-operations-target-structured+0xa7c>
    1608:      	cmp	x0, #0x66
    160c:      	b.eq	0x1620 <_stogir.verify.integer-operations-target-structured+0xa7c>
    1610:      	mov	x0, #0x1                ; =1
    1614:      	b	0x15a0 <_stogir.verify.integer-operations-target-structured+0x9fc>
    1618:      	movz	w1, #0x0, lsl #16
    161c:      	b	0x15d4 <_stogir.verify.integer-operations-target-structured+0xa30>
    1620:      	movz	x0, #0x0, lsl #48
    1624:      	b	0x1614 <_stogir.verify.integer-operations-target-structured+0xa70>
    1628:      	brk	#0
    162c:      	b	0x1628 <_stogir.verify.integer-operations-target-structured+0xa84>
    1630:      	mov	x0, #0x1                ; =1
    1634:      	b	0xec0 <_stogir.verify.integer-operations-target-structured+0x31c>
    1638:      	ubfx	x0, x1, #0, #8
    163c:      	b	0xed4 <_stogir.verify.integer-operations-target-structured+0x330>
    1640:      	add	x8, sp, #0xc0
    1644:      	ldr	x0, [sp, #0x238]
    1648:      	ldr	w1, [sp, #0x2c8]
    164c:      	bl	0x164c <_stogir.verify.integer-operations-target-structured+0xaa8>
		000000000000164c:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    1650:      	add	x16, sp, #0xc0
    1654:      	ldr	x0, [x16]
    1658:      	add	x16, sp, #0xc0
    165c:      	ldr	x1, [x16, #0x8]
    1660:      	add	x16, sp, #0xc0
    1664:      	ldr	x2, [x16, #0x10]
    1668:      	b	0xf10 <_stogir.verify.integer-operations-target-structured+0x36c>
    166c:      	add	x0, x24, #0x1
    1670:      	sxtw	x24, w0
    1674:      	b	0xf48 <_stogir.verify.integer-operations-target-structured+0x3a4>
    1678:      	brk	#0
    167c:      	b	0x1678 <_stogir.verify.integer-operations-target-structured+0xad4>
    1680:      	mov	x0, #0x1                ; =1
    1684:      	b	0xf5c <_stogir.verify.integer-operations-target-structured+0x3b8>
    1688:      	add	x0, x24, #0x1
    168c:      	sxtw	x24, w0
    1690:      	b	0xfb4 <_stogir.verify.integer-operations-target-structured+0x410>
    1694:      	brk	#0
    1698:      	b	0x1694 <_stogir.verify.integer-operations-target-structured+0xaf0>
    169c:      	mov	x0, #0x1                ; =1
    16a0:      	b	0xfc8 <_stogir.verify.integer-operations-target-structured+0x424>
    16a4:      	add	x0, x24, #0x1
    16a8:      	sxtw	x24, w0
    16ac:      	b	0x1020 <_stogir.verify.integer-operations-target-structured+0x47c>
    16b0:      	brk	#0
    16b4:      	b	0x16b0 <_stogir.verify.integer-operations-target-structured+0xb0c>
    16b8:      	mov	x0, #0x1                ; =1
    16bc:      	b	0x1034 <_stogir.verify.integer-operations-target-structured+0x490>
    16c0:      	add	x1, x24, #0x1
    16c4:      	sxtw	x24, w1
    16c8:      	b	0x1094 <_stogir.verify.integer-operations-target-structured+0x4f0>
    16cc:      	brk	#0
    16d0:      	b	0x16cc <_stogir.verify.integer-operations-target-structured+0xb28>
    16d4:      	mov	x1, #0x1                ; =1
    16d8:      	b	0x10a8 <_stogir.verify.integer-operations-target-structured+0x504>
    16dc:      	add	x1, x24, #0x1
    16e0:      	sxtw	x24, w1
    16e4:      	b	0x110c <_stogir.verify.integer-operations-target-structured+0x568>
    16e8:      	brk	#0
    16ec:      	b	0x16e8 <_stogir.verify.integer-operations-target-structured+0xb44>
    16f0:      	mov	x1, #0x1                ; =1
    16f4:      	b	0x1120 <_stogir.verify.integer-operations-target-structured+0x57c>
    16f8:      	add	x1, x24, #0x1
    16fc:      	sxtw	x24, w1
    1700:      	b	0x1188 <_stogir.verify.integer-operations-target-structured+0x5e4>
    1704:      	brk	#0
    1708:      	b	0x1704 <_stogir.verify.integer-operations-target-structured+0xb60>
    170c:      	mov	x1, #0x1                ; =1
    1710:      	b	0x119c <_stogir.verify.integer-operations-target-structured+0x5f8>
    1714:      	add	x1, x24, #0x1
    1718:      	sxtw	x24, w1
    171c:      	b	0x1204 <_stogir.verify.integer-operations-target-structured+0x660>
    1720:      	brk	#0
    1724:      	b	0x1720 <_stogir.verify.integer-operations-target-structured+0xb7c>
    1728:      	add	x1, x24, #0x1
    172c:      	sxtw	x24, w1
    1730:      	b	0x1268 <_stogir.verify.integer-operations-target-structured+0x6c4>
    1734:      	brk	#0
    1738:      	b	0x1734 <_stogir.verify.integer-operations-target-structured+0xb90>
    173c:      	add	x16, sp, #0x20
    1740:      	ldr	w1, [x16, #0x8]
    1744:      	add	x8, sp, #0x1c0
    1748:      	str	x0, [sp, #0x298]
    174c:      	ldr	x0, [sp, #0x238]
    1750:      	bl	0x1750 <_stogir.verify.integer-operations-target-structured+0xbac>
		0000000000001750:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    1754:      	add	x16, sp, #0x1c0
    1758:      	ldr	w0, [x16]
    175c:      	lsr	x16, x0, #0
    1760:      	cmp	x16, #0x1
    1764:      	b.eq	0x1780 <_stogir.verify.integer-operations-target-structured+0xbdc>
    1768:      	b.lo	0x1770 <_stogir.verify.integer-operations-target-structured+0xbcc>
    176c:      	b	0x1784 <_stogir.verify.integer-operations-target-structured+0xbe0>
    1770:      	cmp	x16, #0x0
    1774:      	b.eq	0x177c <_stogir.verify.integer-operations-target-structured+0xbd8>
    1778:      	b	0x1784 <_stogir.verify.integer-operations-target-structured+0xbe0>
    177c:      	b	0x1788 <_stogir.verify.integer-operations-target-structured+0xbe4>
    1780:      	b	0x1798 <_stogir.verify.integer-operations-target-structured+0xbf4>
    1784:      	b	0x17cc <_stogir.verify.integer-operations-target-structured+0xc28>
    1788:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		0000000000001788:  ARM64_RELOC_PAGE21	l_stogir.338
    178c:      	ldr	x19, [x19]
		000000000000178c:  ARM64_RELOC_PAGEOFF12	l_stogir.338
    1790:      	mov	x20, #0x14              ; =20
    1794:      	b	0x12a8 <_stogir.verify.integer-operations-target-structured+0x704>
    1798:      	add	x16, sp, #0x1c0
    179c:      	ldr	x0, [x16, #0x8]
    17a0:      	add	x16, sp, #0x20
    17a4:      	ldr	w1, [x16]
    17a8:      	ubfx	x0, x0, #0, #32
    17ac:      	ubfx	x1, x1, #8, #8
    17b0:      	ubfx	x0, x0, #8, #8
    17b4:      	cmp	x0, x1
    17b8:      	b.eq	0x17c8 <_stogir.verify.integer-operations-target-structured+0xc24>
    17bc:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		00000000000017bc:  ARM64_RELOC_PAGE21	l_stogir.339
    17c0:      	ldr	x19, [x19]
		00000000000017c0:  ARM64_RELOC_PAGEOFF12	l_stogir.339
    17c4:      	mov	x20, #0x1a              ; =26
    17c8:      	b	0x1794 <_stogir.verify.integer-operations-target-structured+0xbf0>
    17cc:      	brk	#0
    17d0:      	b	0x17cc <_stogir.verify.integer-operations-target-structured+0xc28>
    17d4:      	add	x1, x24, #0x1
    17d8:      	sxtw	x24, w1
    17dc:      	b	0x1338 <_stogir.verify.integer-operations-target-structured+0x794>
    17e0:      	brk	#0
    17e4:      	b	0x17e0 <_stogir.verify.integer-operations-target-structured+0xc3c>
    17e8:      	mov	x1, #0x1                ; =1
    17ec:      	b	0x1348 <_stogir.verify.integer-operations-target-structured+0x7a4>
    17f0:      	mov	x1, #0x1                ; =1
    17f4:      	b	0x1394 <_stogir.verify.integer-operations-target-structured+0x7f0>
    17f8:      	cmp	x21, #0x0
    17fc:      	b.eq	0x1808 <_stogir.verify.integer-operations-target-structured+0xc64>
    1800:      	mov	x1, #0x1                ; =1
    1804:      	b	0x13ac <_stogir.verify.integer-operations-target-structured+0x808>
    1808:      	mov	x1, x23
    180c:      	b	0x1804 <_stogir.verify.integer-operations-target-structured+0xc60>
    1810:      	movz	x1, #0x0, lsl #48
    1814:      	b	0x13ac <_stogir.verify.integer-operations-target-structured+0x808>
    1818:      	movz	x1, #0x0, lsl #48
    181c:      	b	0x13ac <_stogir.verify.integer-operations-target-structured+0x808>
    1820:      	sxtw	x1, w1
    1824:      	cmp	x1, #0x0
    1828:      	cset	w0, gt
    182c:      	movz	x16, #0x0, lsl #48
    1830:      	sub	x2, x16, x1
    1834:      	sub	x3, x2, #0x1
    1838:      	uxtb	w16, w0
    183c:      	cmp	w16, wzr
    1840:      	b.eq	0x1d04 <_stogir.verify.integer-operations-target-structured+0x1160>
    1844:      	ldr	x4, [sp, #0x238]
    1848:      	ldr	x2, [x4, #0x8]
    184c:      	cmp	x1, x2
    1850:      	b.ge	0x1d10 <_stogir.verify.integer-operations-target-structured+0x116c>
    1854:      	ldr	x5, [sp, #0x280]
    1858:      	ldr	x2, [x5, #0x8]
    185c:      	cmp	x1, x2
    1860:      	b.ge	0x18d8 <_stogir.verify.integer-operations-target-structured+0xd34>
    1864:      	ldr	x2, [x4, #0x78]
    1868:      	add	x2, x2, x1, lsl #2
    186c:      	ldr	w2, [x2]
    1870:      	sxtw	x2, w2
    1874:      	cmp	x2, #0x0
    1878:      	cset	w2, ge
    187c:      	ubfx	x2, x2, #0, #8
    1880:      	ldr	x6, [sp, #0x278]
    1884:      	ldr	x8, [sp, #0x270]
    1888:      	cmp	x2, #0x0
    188c:      	b.eq	0x1954 <_stogir.verify.integer-operations-target-structured+0xdb0>
    1890:      	uxtb	w16, w0
    1894:      	cmp	w16, wzr
    1898:      	b.eq	0x1948 <_stogir.verify.integer-operations-target-structured+0xda4>
    189c:      	ldr	x0, [x4]
    18a0:      	add	x0, x0, x1, lsl #4
    18a4:      	cmp	x0, #0x0
    18a8:      	b.ne	0x195c <_stogir.verify.integer-operations-target-structured+0xdb8>
    18ac:      	str	x4, [sp, #0x238]
    18b0:      	str	x26, [sp, #0x2e0]
    18b4:      	str	x27, [sp, #0x2e8]
    18b8:      	str	x28, [sp, #0x2f0]
    18bc:      	str	x5, [sp, #0x280]
    18c0:      	str	x6, [sp, #0x278]
    18c4:      	str	x8, [sp, #0x270]
    18c8:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		00000000000018c8:  ARM64_RELOC_PAGE21	l_stogir.335
    18cc:      	ldr	x19, [x19]
		00000000000018cc:  ARM64_RELOC_PAGEOFF12	l_stogir.335
    18d0:      	mov	x20, #0x17              ; =23
    18d4:      	b	0x1434 <_stogir.verify.integer-operations-target-structured+0x890>
    18d8:      	movz	x2, #0x0, lsl #48
    18dc:      	b	0x1880 <_stogir.verify.integer-operations-target-structured+0xcdc>
    18e0:      	movz	x2, #0x0, lsl #48
    18e4:      	b	0x1880 <_stogir.verify.integer-operations-target-structured+0xcdc>
    18e8:      	cmp	x1, #0x0
    18ec:      	b.ge	0x1d18 <_stogir.verify.integer-operations-target-structured+0x1174>
    18f0:      	ldr	x6, [sp, #0x278]
    18f4:      	ldr	x7, [x6, #0x8]
    18f8:      	ldr	x8, [sp, #0x270]
    18fc:      	ldr	x9, [x8, #0x8]
    1900:      	cmp	x7, x9
    1904:      	b.ne	0x1938 <_stogir.verify.integer-operations-target-structured+0xd94>
    1908:      	cmp	x2, x7
    190c:      	b.gt	0x1930 <_stogir.verify.integer-operations-target-structured+0xd8c>
    1910:      	ldr	x2, [x4, #0x50]
    1914:      	add	x2, x2, x3, lsl #2
    1918:      	ldr	w2, [x2]
    191c:      	sxtw	x2, w2
    1920:      	cmp	x2, #0x0
    1924:      	cset	w2, gt
    1928:      	ubfx	x2, x2, #0, #8
    192c:      	b	0x1888 <_stogir.verify.integer-operations-target-structured+0xce4>
    1930:      	movz	x2, #0x0, lsl #48
    1934:      	b	0x192c <_stogir.verify.integer-operations-target-structured+0xd88>
    1938:      	movz	x2, #0x0, lsl #48
    193c:      	b	0x192c <_stogir.verify.integer-operations-target-structured+0xd88>
    1940:      	movz	x2, #0x0, lsl #48
    1944:      	b	0x192c <_stogir.verify.integer-operations-target-structured+0xd88>
    1948:      	ldr	x0, [x4, #0x28]
    194c:      	add	x0, x0, x3, lsl #4
    1950:      	b	0x18a4 <_stogir.verify.integer-operations-target-structured+0xd00>
    1954:      	movz	x0, #0x0, lsl #48
    1958:      	b	0x18a4 <_stogir.verify.integer-operations-target-structured+0xd00>
    195c:      	ldr	w0, [x0]
    1960:      	add	x16, sp, #0x20
    1964:      	ldr	w1, [x16]
    1968:      	ubfx	x0, x0, #8, #8
    196c:      	orr	x2, x0, xzr
    1970:      	ubfx	x1, x1, #8, #8
    1974:      	cmp	x1, #0x6
    1978:      	b.ne	0x1ae0 <_stogir.verify.integer-operations-target-structured+0xf3c>
    197c:      	cmp	x2, #0x6
    1980:      	b.ne	0x1ad8 <_stogir.verify.integer-operations-target-structured+0xf34>
    1984:      	cmp	x22, #0x1a
    1988:      	b.ne	0x1ac8 <_stogir.verify.integer-operations-target-structured+0xf24>
    198c:      	mov	x1, #0x1                ; =1
    1990:      	cmp	x2, #0x1
    1994:      	cset	w3, ge
    1998:      	uxtb	w16, w3
    199c:      	cmp	w16, wzr
    19a0:      	b.eq	0x1d24 <_stogir.verify.integer-operations-target-structured+0x1180>
    19a4:      	cmp	x2, #0xb
    19a8:      	cset	w7, le
    19ac:      	uxtb	w16, w7
    19b0:      	cmp	w16, wzr
    19b4:      	b.eq	0x1d4c <_stogir.verify.integer-operations-target-structured+0x11a8>
    19b8:      	cmp	x23, #0x0
    19bc:      	b.eq	0x1d74 <_stogir.verify.integer-operations-target-structured+0x11d0>
    19c0:      	ldr	w14, [sp, #0x2b0]
    19c4:      	str	x4, [sp, #0x238]
    19c8:      	str	x5, [sp, #0x280]
    19cc:      	str	x6, [sp, #0x278]
    19d0:      	str	x8, [sp, #0x270]
    19d4:      	mov	x23, x2
    19d8:      	str	x26, [sp, #0x2e0]
    19dc:      	mov	x26, x1
    19e0:      	mov	w1, w0
    19e4:      	mov	w0, w14
    19e8:      	str	x27, [sp, #0x2e8]
    19ec:      	mov	w27, w3
    19f0:      	str	x28, [sp, #0x2f0]
    19f4:      	mov	w28, w7
    19f8:      	bl	0x19f8 <_stogir.verify.integer-operations-target-structured+0xe54>
		00000000000019f8:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    19fc:      	cmp	x0, #0x0
    1a00:      	b.ne	0x1ae8 <_stogir.verify.integer-operations-target-structured+0xf44>
    1a04:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		0000000000001a04:  ARM64_RELOC_PAGE21	l_stogir.340
    1a08:      	ldr	x19, [x19]
		0000000000001a08:  ARM64_RELOC_PAGEOFF12	l_stogir.340
    1a0c:      	mov	x20, #0x1c              ; =28
    1a10:      	add	x16, sp, #0x20
    1a14:      	ldr	w0, [x16]
    1a18:      	cmp	x25, #0x0
    1a1c:      	b.eq	0x1b80 <_stogir.verify.integer-operations-target-structured+0xfdc>
    1a20:      	mov	x1, #0x1                ; =1
    1a24:      	ubfx	x0, x0, #8, #8
    1a28:      	sxtw	x1, w1
    1a2c:      	cmp	x0, x1
    1a30:      	b.eq	0x1a40 <_stogir.verify.integer-operations-target-structured+0xe9c>
    1a34:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		0000000000001a34:  ARM64_RELOC_PAGE21	l_stogir.341
    1a38:      	ldr	x19, [x19]
		0000000000001a38:  ARM64_RELOC_PAGEOFF12	l_stogir.341
    1a3c:      	mov	x20, #0x26              ; =38
    1a40:      	cmp	x25, #0x0
    1a44:      	b.eq	0x1a4c <_stogir.verify.integer-operations-target-structured+0xea8>
    1a48:      	mov	x21, #0x1               ; =1
    1a4c:      	cmp	x21, #0x0
    1a50:      	b.eq	0x1ac4 <_stogir.verify.integer-operations-target-structured+0xf20>
    1a54:      	add	x16, sp, #0x220
    1a58:      	str	x16, [sp]
    1a5c:      	ldr	x0, [sp, #0x238]
    1a60:      	ldr	w1, [sp, #0x2c8]
    1a64:      	mov	x2, #0x2                ; =2
    1a68:      	bl	0x1a68 <_stogir.verify.integer-operations-target-structured+0xec4>
		0000000000001a68:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    1a6c:      	ldr	x16, [sp]
    1a70:      	str	x0, [x16]
    1a74:      	str	x1, [x16, #0x8]
    1a78:      	add	x16, sp, #0x220
    1a7c:      	ldr	x0, [x16]
    1a80:      	add	x16, sp, #0x220
    1a84:      	ldr	x1, [x16, #0x8]
    1a88:      	ubfx	x0, x0, #0, #32
    1a8c:      	lsr	x16, x0, #0
    1a90:      	cmp	x16, #0x1
    1a94:      	b.eq	0x1ab0 <_stogir.verify.integer-operations-target-structured+0xf0c>
    1a98:      	b.lo	0x1aa0 <_stogir.verify.integer-operations-target-structured+0xefc>
    1a9c:      	b	0x1ab4 <_stogir.verify.integer-operations-target-structured+0xf10>
    1aa0:      	cmp	x16, #0x0
    1aa4:      	b.eq	0x1aac <_stogir.verify.integer-operations-target-structured+0xf08>
    1aa8:      	b	0x1ab4 <_stogir.verify.integer-operations-target-structured+0xf10>
    1aac:      	b	0x1ab8 <_stogir.verify.integer-operations-target-structured+0xf14>
    1ab0:      	b	0x1b88 <_stogir.verify.integer-operations-target-structured+0xfe4>
    1ab4:      	b	0x1be4 <_stogir.verify.integer-operations-target-structured+0x1040>
    1ab8:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		0000000000001ab8:  ARM64_RELOC_PAGE21	l_stogir.342
    1abc:      	ldr	x19, [x19]
		0000000000001abc:  ARM64_RELOC_PAGEOFF12	l_stogir.342
    1ac0:      	mov	x20, #0x1d              ; =29
    1ac4:      	b	0x18d4 <_stogir.verify.integer-operations-target-structured+0xd30>
    1ac8:      	cmp	x22, #0x1b
    1acc:      	cset	w1, eq
    1ad0:      	ubfx	x1, x1, #0, #8
    1ad4:      	b	0x1990 <_stogir.verify.integer-operations-target-structured+0xdec>
    1ad8:      	movz	x1, #0x0, lsl #48
    1adc:      	b	0x1990 <_stogir.verify.integer-operations-target-structured+0xdec>
    1ae0:      	movz	x1, #0x0, lsl #48
    1ae4:      	b	0x1990 <_stogir.verify.integer-operations-target-structured+0xdec>
    1ae8:      	cmp	x21, #0x0
    1aec:      	b.eq	0x1a10 <_stogir.verify.integer-operations-target-structured+0xe6c>
    1af0:      	cmp	x22, #0x3a
    1af4:      	cset	w0, eq
    1af8:      	cmp	x22, #0x1a
    1afc:      	b.lt	0x1b58 <_stogir.verify.integer-operations-target-structured+0xfb4>
    1b00:      	cmp	x22, #0x1e
    1b04:      	b.gt	0x1b58 <_stogir.verify.integer-operations-target-structured+0xfb4>
    1b08:      	uxtb	w16, w27
    1b0c:      	cmp	w16, wzr
    1b10:      	b.eq	0x1a04 <_stogir.verify.integer-operations-target-structured+0xe60>
    1b14:      	uxtb	w16, w28
    1b18:      	cmp	w16, wzr
    1b1c:      	b.eq	0x1a04 <_stogir.verify.integer-operations-target-structured+0xe60>
    1b20:      	cmp	x23, #0x1
    1b24:      	b.ne	0x1a10 <_stogir.verify.integer-operations-target-structured+0xe6c>
    1b28:      	cmp	x22, #0x2e
    1b2c:      	b.eq	0x1a10 <_stogir.verify.integer-operations-target-structured+0xe6c>
    1b30:      	cmp	x22, #0x2f
    1b34:      	b.eq	0x1a10 <_stogir.verify.integer-operations-target-structured+0xe6c>
    1b38:      	cmp	x22, #0x30
    1b3c:      	b.eq	0x1a10 <_stogir.verify.integer-operations-target-structured+0xe6c>
    1b40:      	uxtb	w16, w0
    1b44:      	cmp	w16, wzr
    1b48:      	b.ne	0x1a10 <_stogir.verify.integer-operations-target-structured+0xe6c>
    1b4c:      	cmp	x22, #0x3b
    1b50:      	b.ne	0x1a04 <_stogir.verify.integer-operations-target-structured+0xe60>
    1b54:      	b	0x1a10 <_stogir.verify.integer-operations-target-structured+0xe6c>
    1b58:      	cmp	x22, #0x2e
    1b5c:      	b.lt	0x1b68 <_stogir.verify.integer-operations-target-structured+0xfc4>
    1b60:      	cmp	x22, #0x35
    1b64:      	b.le	0x1b08 <_stogir.verify.integer-operations-target-structured+0xf64>
    1b68:      	uxtb	w16, w0
    1b6c:      	cmp	w16, wzr
    1b70:      	b.ne	0x1b08 <_stogir.verify.integer-operations-target-structured+0xf64>
    1b74:      	cmp	x22, #0x3b
    1b78:      	b.eq	0x1b08 <_stogir.verify.integer-operations-target-structured+0xf64>
    1b7c:      	b	0x1a04 <_stogir.verify.integer-operations-target-structured+0xe60>
    1b80:      	mov	x1, x23
    1b84:      	b	0x1a24 <_stogir.verify.integer-operations-target-structured+0xe80>
    1b88:      	ldr	x0, [sp, #0x238]
    1b8c:      	bl	0x1b8c <_stogir.verify.integer-operations-target-structured+0xfe8>
		0000000000001b8c:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    1b90:      	cmp	x0, #0x0
    1b94:      	b.ne	0x1ba8 <_stogir.verify.integer-operations-target-structured+0x1004>
    1b98:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		0000000000001b98:  ARM64_RELOC_PAGE21	l_stogir.342
    1b9c:      	ldr	x19, [x19]
		0000000000001b9c:  ARM64_RELOC_PAGEOFF12	l_stogir.342
    1ba0:      	mov	x20, #0x1d              ; =29
    1ba4:      	b	0x1ac4 <_stogir.verify.integer-operations-target-structured+0xf20>
    1ba8:      	ldr	w0, [x0]
    1bac:      	ubfx	x0, x0, #8, #8
    1bb0:      	cmp	x23, x0
    1bb4:      	b.eq	0x1bd0 <_stogir.verify.integer-operations-target-structured+0x102c>
    1bb8:      	cmp	x26, #0x0
    1bbc:      	b.eq	0x1bd4 <_stogir.verify.integer-operations-target-structured+0x1030>
    1bc0:      	cmp	x0, #0x5
    1bc4:      	b.eq	0x1bd0 <_stogir.verify.integer-operations-target-structured+0x102c>
    1bc8:      	cmp	x0, #0xb
    1bcc:      	b.ne	0x1bd4 <_stogir.verify.integer-operations-target-structured+0x1030>
    1bd0:      	b	0x1ba4 <_stogir.verify.integer-operations-target-structured+0x1000>
    1bd4:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		0000000000001bd4:  ARM64_RELOC_PAGE21	l_stogir.343
    1bd8:      	ldr	x19, [x19]
		0000000000001bd8:  ARM64_RELOC_PAGEOFF12	l_stogir.343
    1bdc:      	mov	x20, #0x1d              ; =29
    1be0:      	b	0x1bd0 <_stogir.verify.integer-operations-target-structured+0x102c>
    1be4:      	brk	#0
    1be8:      	b	0x1be4 <_stogir.verify.integer-operations-target-structured+0x1040>
    1bec:      	brk	#0
    1bf0:      	b	0x1bec <_stogir.verify.integer-operations-target-structured+0x1048>
    1bf4:      	brk	#0
    1bf8:      	b	0x1bf4 <_stogir.verify.integer-operations-target-structured+0x1050>
    1bfc:      	cmp	x20, #0x0
    1c00:      	b.ne	0x1c58 <_stogir.verify.integer-operations-target-structured+0x10b4>
    1c04:      	and	x19, x24, #0xffffffff
    1c08:      	movz	x0, #0x0, lsl #48
    1c0c:      	movz	x20, #0x0, lsl #48
    1c10:      	ldr	x1, [sp, #0x268]
    1c14:      	str	x0, [x1]
    1c18:      	str	x19, [x1, #0x8]
    1c1c:      	str	x20, [x1, #0x10]
    1c20:      	ldr	x19, [sp, #0x2f8]
    1c24:      	ldr	x20, [sp, #0x300]
    1c28:      	ldr	x21, [sp, #0x308]
    1c2c:      	ldr	x22, [sp, #0x310]
    1c30:      	ldr	x23, [sp, #0x318]
    1c34:      	ldr	x24, [sp, #0x320]
    1c38:      	ldr	x25, [sp, #0x328]
    1c3c:      	ldr	x26, [sp, #0x330]
    1c40:      	ldr	x27, [sp, #0x338]
    1c44:      	ldr	x28, [sp, #0x340]
    1c48:      	ldr	x29, [sp, #0x10]
    1c4c:      	ldr	x30, [sp, #0x18]
    1c50:      	add	sp, sp, #0x350
    1c54:      	ret
    1c58:      	mov	x0, #0x1                ; =1
    1c5c:      	b	0x1c10 <_stogir.verify.integer-operations-target-structured+0x106c>
    1c60:      	mov	x24, x10
    1c64:      	str	x8, [sp, #0x268]
    1c68:      	mov	x19, x11
    1c6c:      	mov	x20, x12
    1c70:      	b	0x1bfc <_stogir.verify.integer-operations-target-structured+0x1058>
    1c74:      	mov	x24, x10
    1c78:      	str	x8, [sp, #0x268]
    1c7c:      	mov	x19, x11
    1c80:      	mov	x20, x12
    1c84:      	b	0x1bfc <_stogir.verify.integer-operations-target-structured+0x1058>
    1c88:      	str	x0, [sp, #0x238]
    1c8c:      	b	0x14c8 <_stogir.verify.integer-operations-target-structured+0x924>
    1c90:      	ldr	x0, [sp, #0x2d0]
    1c94:      	b	0x1094 <_stogir.verify.integer-operations-target-structured+0x4f0>
    1c98:      	str	x0, [sp, #0x2d0]
    1c9c:      	ldr	x0, [sp, #0x2c0]
    1ca0:      	b	0x110c <_stogir.verify.integer-operations-target-structured+0x568>
    1ca4:      	str	x0, [sp, #0x2c0]
    1ca8:      	ldr	x0, [sp, #0x2a8]
    1cac:      	b	0x1188 <_stogir.verify.integer-operations-target-structured+0x5e4>
    1cb0:      	str	x0, [sp, #0x2a8]
    1cb4:      	ldr	x0, [sp, #0x2a0]
    1cb8:      	b	0x1204 <_stogir.verify.integer-operations-target-structured+0x660>
    1cbc:      	str	x0, [sp, #0x2a0]
    1cc0:      	ldr	x0, [sp, #0x298]
    1cc4:      	b	0x1268 <_stogir.verify.integer-operations-target-structured+0x6c4>
    1cc8:      	str	x0, [sp, #0x298]
    1ccc:      	b	0x12b0 <_stogir.verify.integer-operations-target-structured+0x70c>
    1cd0:      	str	x25, [sp, #0x248]
    1cd4:      	mov	x25, x0
    1cd8:      	ldr	x0, [sp, #0x288]
    1cdc:      	b	0x1338 <_stogir.verify.integer-operations-target-structured+0x794>
    1ce0:      	ldr	x25, [sp, #0x240]
    1ce4:      	b	0x1818 <_stogir.verify.integer-operations-target-structured+0xc74>
    1ce8:      	ldr	x25, [sp, #0x240]
    1cec:      	b	0x1810 <_stogir.verify.integer-operations-target-structured+0xc6c>
    1cf0:      	str	x26, [sp, #0x2e0]
    1cf4:      	str	x27, [sp, #0x2e8]
    1cf8:      	str	x28, [sp, #0x2f0]
    1cfc:      	str	x0, [sp, #0x288]
    1d00:      	b	0x143c <_stogir.verify.integer-operations-target-structured+0x898>
    1d04:      	ldr	x4, [sp, #0x238]
    1d08:      	ldr	x5, [sp, #0x280]
    1d0c:      	b	0x18e8 <_stogir.verify.integer-operations-target-structured+0xd44>
    1d10:      	ldr	x5, [sp, #0x280]
    1d14:      	b	0x18e0 <_stogir.verify.integer-operations-target-structured+0xd3c>
    1d18:      	ldr	x6, [sp, #0x278]
    1d1c:      	ldr	x8, [sp, #0x270]
    1d20:      	b	0x1940 <_stogir.verify.integer-operations-target-structured+0xd9c>
    1d24:      	str	x4, [sp, #0x238]
    1d28:      	str	x26, [sp, #0x2e0]
    1d2c:      	mov	x26, x1
    1d30:      	str	x27, [sp, #0x2e8]
    1d34:      	str	x28, [sp, #0x2f0]
    1d38:      	mov	x23, x2
    1d3c:      	str	x5, [sp, #0x280]
    1d40:      	str	x6, [sp, #0x278]
    1d44:      	str	x8, [sp, #0x270]
    1d48:      	b	0x1a04 <_stogir.verify.integer-operations-target-structured+0xe60>
    1d4c:      	str	x4, [sp, #0x238]
    1d50:      	str	x26, [sp, #0x2e0]
    1d54:      	mov	x26, x1
    1d58:      	str	x27, [sp, #0x2e8]
    1d5c:      	str	x28, [sp, #0x2f0]
    1d60:      	mov	x23, x2
    1d64:      	str	x5, [sp, #0x280]
    1d68:      	str	x6, [sp, #0x278]
    1d6c:      	str	x8, [sp, #0x270]
    1d70:      	b	0x1a04 <_stogir.verify.integer-operations-target-structured+0xe60>
    1d74:      	str	x4, [sp, #0x238]
    1d78:      	str	x26, [sp, #0x2e0]
    1d7c:      	mov	x26, x1
    1d80:      	str	x27, [sp, #0x2e8]
    1d84:      	str	x28, [sp, #0x2f0]
    1d88:      	mov	x23, x2
    1d8c:      	mov	w27, w3
    1d90:      	mov	w28, w7
    1d94:      	str	x5, [sp, #0x280]
    1d98:      	str	x6, [sp, #0x278]
    1d9c:      	str	x8, [sp, #0x270]
    1da0:      	b	0x1ae8 <_stogir.verify.integer-operations-target-structured+0xf44>

0000000000001da4 <_coil.core.Eq$slice<u8>$=>:
    1da4:      	sub	sp, sp, #0x10
    1da8:      	str	x29, [sp]
    1dac:      	str	x30, [sp, #0x8]
    1db0:      	mov	x29, sp
    1db4:      	cmp	x1, x3
    1db8:      	b.ne	0x1df4 <_coil.core.Eq$slice<u8>$=+0x50>
    1dbc:      	cmp	x1, #0x0
    1dc0:      	b.ne	0x1dcc <_coil.core.Eq$slice<u8>$=+0x28>
    1dc4:      	mov	x0, #0x1                ; =1
    1dc8:      	b	0x1df0 <_coil.core.Eq$slice<u8>$=+0x4c>
    1dcc:      	lsr	x1, x1, #0
    1dd0:      	fmov	d31, x1
    1dd4:      	mov	x1, x2
    1dd8:      	fmov	x2, d31
    1ddc:      	bl	0x1ddc <_coil.core.Eq$slice<u8>$=+0x38>
		0000000000001ddc:  ARM64_RELOC_BRANCH26	_memcmp
    1de0:      	sxtw	x0, w0
    1de4:      	cmp	x0, #0x0
    1de8:      	cset	w0, eq
    1dec:      	ubfx	x0, x0, #0, #8
    1df0:      	b	0x1df8 <_coil.core.Eq$slice<u8>$=+0x54>
    1df4:      	movz	x0, #0x0, lsl #48
    1df8:      	ldr	x29, [sp]
    1dfc:      	ldr	x30, [sp, #0x8]
    1e00:      	add	sp, sp, #0x10
    1e04:      	ret

0000000000001e08 <_stogir.types.valid?>:
    1e08:      	sxtw	x1, w0
    1e0c:      	cmp	x1, #0x0
    1e10:      	b.lt	0x1e24 <_stogir.types.valid?+0x1c>
    1e14:      	cmp	x1, #0xd
    1e18:      	b.gt	0x1e24 <_stogir.types.valid?+0x1c>
    1e1c:      	mov	x0, #0x1                ; =1
    1e20:      	b	0x1e60 <_stogir.types.valid?+0x58>
    1e24:      	cmp	x1, #0xf
    1e28:      	b.le	0x1e5c <_stogir.types.valid?+0x54>
    1e2c:      	cmp	x1, #0x80
    1e30:      	b.ge	0x1e54 <_stogir.types.valid?+0x4c>
    1e34:      	and	w0, w0, #0xf
    1e38:      	ubfx	x0, x0, #0, #32
    1e3c:      	cmp	x0, #0x1
    1e40:      	b.lt	0x1e64 <_stogir.types.valid?+0x5c>
    1e44:      	cmp	x0, #0xd
    1e48:      	cset	w0, le
    1e4c:      	ubfx	x0, x0, #0, #8
    1e50:      	b	0x1e68 <_stogir.types.valid?+0x60>
    1e54:      	movz	x0, #0x0, lsl #48
    1e58:      	b	0x1e60 <_stogir.types.valid?+0x58>
    1e5c:      	movz	x0, #0x0, lsl #48
    1e60:      	ret
    1e64:      	movz	x0, #0x0, lsl #48
    1e68:      	b	0x1e58 <_stogir.types.valid?+0x50>

0000000000001e6c <_stogir.opcode.input-count>:
    1e6c:      	sxtw	x0, w0
    1e70:      	cmp	x0, #0x0
    1e74:      	b.lt	0x1e98 <_stogir.opcode.input-count+0x2c>
    1e78:      	cmp	x0, #0x83
    1e7c:      	b.ge	0x1e98 <_stogir.opcode.input-count+0x2c>
    1e80:      	adrp	x16, 0x1000 <_stogir.verify.integer-operations-target-structured+0x45c>
		0000000000001e80:  ARM64_RELOC_PAGE21	l_stogir.344
    1e84:      	ldr	x16, [x16]
		0000000000001e84:  ARM64_RELOC_PAGEOFF12	l_stogir.344
    1e88:      	add	x0, x16, x0
    1e8c:      	ldrsb	w0, [x0]
    1e90:      	sxtb	x0, w0
    1e94:      	b	0x1e9c <_stogir.opcode.input-count+0x30>
    1e98:      	mov	x0, #-0x2               ; =-2
    1e9c:      	ret

0000000000001ea0 <_stogir.graph.operand>:
    1ea0:      	sub	sp, sp, #0x10
    1ea4:      	mov	x3, sp
    1ea8:      	sxtw	x1, w1
    1eac:      	cmp	x1, #0x0
    1eb0:      	b.le	0x1ef4 <_stogir.graph.operand+0x54>
    1eb4:      	lsl	x4, x1, #2
    1eb8:      	ldr	x5, [x0, #0x8]
    1ebc:      	cmp	x1, x5
    1ec0:      	b.ge	0x1f28 <_stogir.graph.operand+0x88>
    1ec4:      	add	x5, x0, #0x78
    1ec8:      	ldr	x5, [x5, #0x8]
    1ecc:      	cmp	x1, x5
    1ed0:      	b.ge	0x1f20 <_stogir.graph.operand+0x80>
    1ed4:      	ldr	x5, [x0, #0x78]
    1ed8:      	add	x5, x4, x5
    1edc:      	ldr	w5, [x5]
    1ee0:      	sxtw	x5, w5
    1ee4:      	cmp	x5, #0x0
    1ee8:      	cset	w5, ge
    1eec:      	ubfx	x5, x5, #0, #8
    1ef0:      	b	0x1f24 <_stogir.graph.operand+0x84>
    1ef4:      	movz	x1, #0x0, lsl #48
    1ef8:      	movz	x0, #0x0, lsl #48
    1efc:      	str	x1, [x3]
    1f00:      	str	x0, [x3, #0x8]
    1f04:      	ldr	x0, [sp]
    1f08:      	ldr	x1, [sp, #0x8]
    1f0c:      	add	sp, sp, #0x10
    1f10:      	ret
    1f14:      	movz	x1, #0x0, lsl #48
    1f18:      	movz	x0, #0x0, lsl #48
    1f1c:      	b	0x1efc <_stogir.graph.operand+0x5c>
    1f20:      	movz	x5, #0x0, lsl #48
    1f24:      	b	0x1f2c <_stogir.graph.operand+0x8c>
    1f28:      	movz	x5, #0x0, lsl #48
    1f2c:      	cmp	x5, #0x0
    1f30:      	b.eq	0x1ef4 <_stogir.graph.operand+0x54>
    1f34:      	sxtw	x2, w2
    1f38:      	cmp	x2, #0x1
    1f3c:      	b.lt	0x1f14 <_stogir.graph.operand+0x74>
    1f40:      	ldr	x5, [x0, #0x78]
    1f44:      	add	x4, x4, x5
    1f48:      	ldr	w4, [x4]
    1f4c:      	sxtw	x4, w4
    1f50:      	cmp	x2, x4
    1f54:      	b.gt	0x1f14 <_stogir.graph.operand+0x74>
    1f58:      	asr	x16, x2, #63
    1f5c:      	lsr	x16, x16, #62
    1f60:      	add	x4, x2, x16
    1f64:      	asr	x4, x4, #2
    1f68:      	asr	x16, x2, #63
    1f6c:      	lsr	x16, x16, #62
    1f70:      	add	x2, x2, x16
    1f74:      	and	x2, x2, #0x3
    1f78:      	sub	x2, x2, x16
    1f7c:      	ldr	x0, [x0]
    1f80:      	add	x1, x4, x1
    1f84:      	add	x0, x0, x1, lsl #4
    1f88:      	add	x0, x0, x2, lsl #2
    1f8c:      	ldr	w0, [x0]
    1f90:      	sxtw	x0, w0
    1f94:      	and	x0, x0, #0xffffffff
    1f98:      	mov	x1, #0x1                ; =1
    1f9c:      	b	0x1f1c <_stogir.graph.operand+0x7c>

0000000000001fa0 <_stogir.graph.borrow-node>:
    1fa0:      	sxtw	x1, w1
    1fa4:      	cmp	x1, #0x0
    1fa8:      	cset	w2, gt
    1fac:      	movz	x16, #0x0, lsl #48
    1fb0:      	sub	x3, x16, x1
    1fb4:      	sub	x4, x3, #0x1
    1fb8:      	uxtb	w16, w2
    1fbc:      	cmp	w16, wzr
    1fc0:      	b.eq	0x2000 <_stogir.graph.borrow-node+0x60>
    1fc4:      	ldr	x3, [x0, #0x8]
    1fc8:      	cmp	x1, x3
    1fcc:      	b.ge	0x2050 <_stogir.graph.borrow-node+0xb0>
    1fd0:      	add	x3, x0, #0x78
    1fd4:      	ldr	x3, [x3, #0x8]
    1fd8:      	cmp	x1, x3
    1fdc:      	b.ge	0x2090 <_stogir.graph.borrow-node+0xf0>
    1fe0:      	ldr	x3, [x0, #0x78]
    1fe4:      	add	x3, x3, x1, lsl #2
    1fe8:      	ldr	w3, [x3]
    1fec:      	sxtw	x3, w3
    1ff0:      	cmp	x3, #0x0
    1ff4:      	cset	w3, ge
    1ff8:      	ubfx	x3, x3, #0, #8
    1ffc:      	b	0x2094 <_stogir.graph.borrow-node+0xf4>
    2000:      	cmp	x1, #0x0
    2004:      	b.ge	0x2058 <_stogir.graph.borrow-node+0xb8>
    2008:      	add	x5, x0, #0x28
    200c:      	add	x6, x0, #0x50
    2010:      	ldr	x5, [x5, #0x8]
    2014:      	ldr	x6, [x6, #0x8]
    2018:      	cmp	x5, x6
    201c:      	b.ne	0x2048 <_stogir.graph.borrow-node+0xa8>
    2020:      	cmp	x3, x5
    2024:      	b.gt	0x2098 <_stogir.graph.borrow-node+0xf8>
    2028:      	ldr	x3, [x0, #0x50]
    202c:      	add	x3, x3, x4, lsl #2
    2030:      	ldr	w3, [x3]
    2034:      	sxtw	x3, w3
    2038:      	cmp	x3, #0x0
    203c:      	cset	w3, gt
    2040:      	ubfx	x3, x3, #0, #8
    2044:      	b	0x209c <_stogir.graph.borrow-node+0xfc>
    2048:      	movz	x3, #0x0, lsl #48
    204c:      	b	0x205c <_stogir.graph.borrow-node+0xbc>
    2050:      	movz	x3, #0x0, lsl #48
    2054:      	b	0x205c <_stogir.graph.borrow-node+0xbc>
    2058:      	movz	x3, #0x0, lsl #48
    205c:      	cmp	x3, #0x0
    2060:      	b.eq	0x2088 <_stogir.graph.borrow-node+0xe8>
    2064:      	uxtb	w16, w2
    2068:      	cmp	w16, wzr
    206c:      	b.eq	0x207c <_stogir.graph.borrow-node+0xdc>
    2070:      	ldr	x0, [x0]
    2074:      	add	x0, x0, x1, lsl #4
    2078:      	b	0x2084 <_stogir.graph.borrow-node+0xe4>
    207c:      	ldr	x0, [x0, #0x28]
    2080:      	add	x0, x0, x4, lsl #4
    2084:      	b	0x208c <_stogir.graph.borrow-node+0xec>
    2088:      	movz	x0, #0x0, lsl #48
    208c:      	ret
    2090:      	movz	x3, #0x0, lsl #48
    2094:      	b	0x2054 <_stogir.graph.borrow-node+0xb4>
    2098:      	movz	x3, #0x0, lsl #48
    209c:      	b	0x204c <_stogir.graph.borrow-node+0xac>

00000000000020a0 <_stogir.verify.classifications>:
    20a0:      	sub	sp, sp, #0x70
    20a4:      	str	x29, [sp]
    20a8:      	str	x30, [sp, #0x8]
    20ac:      	mov	x29, sp
    20b0:      	str	x19, [sp, #0x20]
    20b4:      	str	x20, [sp, #0x28]
    20b8:      	str	x21, [sp, #0x30]
    20bc:      	str	x22, [sp, #0x38]
    20c0:      	str	x23, [sp, #0x40]
    20c4:      	str	x24, [sp, #0x48]
    20c8:      	str	x25, [sp, #0x50]
    20cc:      	str	x26, [sp, #0x58]
    20d0:      	str	x27, [sp, #0x60]
    20d4:      	str	x28, [sp, #0x68]
    20d8:      	ldr	w4, [x2]
    20dc:      	orr	x5, x4, xzr
    20e0:      	ubfx	x5, x5, #8, #8
    20e4:      	orr	x19, x5, xzr
    20e8:      	cmp	x19, #0xf
    20ec:      	b.le	0x2120 <_stogir.verify.classifications+0x80>
    20f0:      	cmp	x19, #0x80
    20f4:      	b.ge	0x2118 <_stogir.verify.classifications+0x78>
    20f8:      	and	w5, w5, #0xf
    20fc:      	ubfx	x5, x5, #0, #32
    2100:      	cmp	x5, #0x1
    2104:      	b.lt	0x25f8 <_stogir.verify.classifications+0x558>
    2108:      	cmp	x5, #0xd
    210c:      	cset	w5, le
    2110:      	ubfx	x20, x5, #0, #8
    2114:      	b	0x25fc <_stogir.verify.classifications+0x55c>
    2118:      	movz	x20, #0x0, lsl #48
    211c:      	b	0x2124 <_stogir.verify.classifications+0x84>
    2120:      	movz	x20, #0x0, lsl #48
    2124:      	uxtb	w21, w4
    2128:      	orr	x4, x21, xzr
    212c:      	mov	x22, x0
    2130:      	mov	w0, w4
    2134:      	mov	w23, w1
    2138:      	mov	x24, x2
    213c:      	mov	w25, w3
    2140:      	bl	0x2140 <_stogir.verify.classifications+0xa0>
		0000000000002140:  ARM64_RELOC_BRANCH26	_stogir.floating.operation?
    2144:      	cmp	x0, #0x0
    2148:      	b.eq	0x2164 <_stogir.verify.classifications+0xc4>
    214c:      	cmp	x20, #0x0
    2150:      	cset	w0, ne
    2154:      	uxtb	w16, w0
    2158:      	cmp	w16, wzr
    215c:      	cset	x26, eq
    2160:      	b	0x2168 <_stogir.verify.classifications+0xc8>
    2164:      	movz	x26, #0x0, lsl #48
    2168:      	cmp	x26, #0x0
    216c:      	cset	w27, ne
    2170:      	uxtb	w16, w27
    2174:      	cmp	w16, wzr
    2178:      	b.eq	0x21ac <_stogir.verify.classifications+0x10c>
    217c:      	ldr	w0, [x24, #0x4]
    2180:      	mov	w1, w0
    2184:      	mov	x0, x22
    2188:      	bl	0x2188 <_stogir.verify.classifications+0xe8>
		0000000000002188:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    218c:      	cmp	x0, #0x0
    2190:      	b.ne	0x219c <_stogir.verify.classifications+0xfc>
    2194:      	movn	w28, #0x0, lsl #16
    2198:      	b	0x21a8 <_stogir.verify.classifications+0x108>
    219c:      	ldr	w0, [x0]
    21a0:      	ubfx	x0, x0, #8, #8
    21a4:      	orr	x28, x0, xzr
    21a8:      	b	0x21b0 <_stogir.verify.classifications+0x110>
    21ac:      	movn	w28, #0x0, lsl #16
    21b0:      	sxtw	x0, w28
    21b4:      	cmp	x26, #0x0
    21b8:      	b.eq	0x2654 <_stogir.verify.classifications+0x5b4>
    21bc:      	mov	x26, x0
    21c0:      	mov	w0, w28
    21c4:      	bl	0x21c4 <_stogir.verify.classifications+0x124>
		00000000000021c4:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    21c8:      	cmp	x0, #0x0
    21cc:      	b.eq	0x25e8 <_stogir.verify.classifications+0x548>
    21d0:      	movz	x0, #0x0, lsl #48
    21d4:      	b	0x21dc <_stogir.verify.classifications+0x13c>
    21d8:      	mov	x0, #0x1                ; =1
    21dc:      	b	0x21f4 <_stogir.verify.classifications+0x154>
    21e0:      	movz	x19, #0x0, lsl #48
    21e4:      	b	0x226c <_stogir.verify.classifications+0x1cc>
    21e8:      	movz	x20, #0x0, lsl #48
    21ec:      	b	0x2274 <_stogir.verify.classifications+0x1d4>
    21f0:      	movz	x0, #0x0, lsl #48
    21f4:      	sxtw	x25, w25
    21f8:      	cmp	x26, #0xf
    21fc:      	cset	w1, gt
    2200:      	cmp	x26, #0x80
    2204:      	cset	w2, lt
    2208:      	cmp	x21, #0x83
    220c:      	cset	w3, lt
    2210:      	add	x4, x22, #0x78
    2214:      	add	x5, x22, #0x28
    2218:      	add	x6, x22, #0x50
    221c:      	sxtw	x23, w23
    2220:      	add	x7, x22, #0x78
    2224:      	and	w8, w28, #0xf
    2228:      	adrp	x16, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002228:  ARM64_RELOC_PAGE21	l_stogir.345
    222c:      	ldr	x16, [x16]
		000000000000222c:  ARM64_RELOC_PAGEOFF12	l_stogir.345
    2230:      	add	x9, x16, x21, lsl #2
    2234:      	cmp	x23, #0x0
    2238:      	cset	w10, le
    223c:      	lsl	x11, x23, #2
    2240:      	ubfx	x8, x8, #0, #32
    2244:      	cmp	x8, #0x1
    2248:      	cset	w12, ge
    224c:      	cmp	x8, #0xd
    2250:      	cset	w8, le
    2254:      	ubfx	x8, x8, #0, #8
    2258:      	mov	x13, #0x1               ; =1
    225c:      	b	0x2314 <_stogir.verify.classifications+0x274>
    2260:      	movz	x19, #0x0, lsl #48
    2264:      	b	0x2294 <_stogir.verify.classifications+0x1f4>
    2268:      	movz	x19, #0x0, lsl #48
    226c:      	b	0x229c <_stogir.verify.classifications+0x1fc>
    2270:      	movz	x20, #0x0, lsl #48
    2274:      	b	0x230c <_stogir.verify.classifications+0x26c>
    2278:      	sub	w14, w14, #0x1
    227c:      	lsl	w14, w14, #2
    2280:      	ubfx	x14, x14, #0, #32
    2284:      	lsr	x14, x19, x14
    2288:      	and	w14, w14, #0xf
    228c:      	b	0x2358 <_stogir.verify.classifications+0x2b8>
    2290:      	movz	x19, #0x0, lsl #48
    2294:      	b	0x229c <_stogir.verify.classifications+0x1fc>
    2298:      	movz	x19, #0x0, lsl #48
    229c:      	cmp	x19, #0x0
    22a0:      	b.eq	0x22c8 <_stogir.verify.classifications+0x228>
    22a4:      	uxtb	w16, w15
    22a8:      	cmp	w16, wzr
    22ac:      	b.eq	0x22bc <_stogir.verify.classifications+0x21c>
    22b0:      	ldr	x15, [x22]
    22b4:      	add	x14, x15, x14, lsl #4
    22b8:      	b	0x22c4 <_stogir.verify.classifications+0x224>
    22bc:      	ldr	x14, [x22, #0x28]
    22c0:      	add	x14, x14, x21, lsl #4
    22c4:      	b	0x22cc <_stogir.verify.classifications+0x22c>
    22c8:      	movz	x14, #0x0, lsl #48
    22cc:      	cmp	x14, #0x0
    22d0:      	b.eq	0x230c <_stogir.verify.classifications+0x26c>
    22d4:      	ldr	w14, [x14]
    22d8:      	ubfx	x14, x14, #8, #8
    22dc:      	orr	x15, x14, xzr
    22e0:      	cmp	x15, #0xf
    22e4:      	b.le	0x230c <_stogir.verify.classifications+0x26c>
    22e8:      	cmp	x15, #0x80
    22ec:      	b.ge	0x230c <_stogir.verify.classifications+0x26c>
    22f0:      	and	w14, w14, #0xf
    22f4:      	ubfx	x14, x14, #0, #32
    22f8:      	cmp	x14, #0x1
    22fc:      	b.lt	0x230c <_stogir.verify.classifications+0x26c>
    2300:      	cmp	x14, #0xd
    2304:      	b.gt	0x230c <_stogir.verify.classifications+0x26c>
    2308:      	mov	x20, #0x1               ; =1
    230c:      	add	x13, x13, #0x1
    2310:      	sxtw	x13, w13
    2314:      	cmp	x20, #0x0
    2318:      	b.ne	0x2494 <_stogir.verify.classifications+0x3f4>
    231c:      	cmp	x13, x25
    2320:      	b.gt	0x2494 <_stogir.verify.classifications+0x3f4>
    2324:      	orr	w14, w13, wzr
    2328:      	sxtw	x15, w14
    232c:      	uxtb	w16, w3
    2330:      	cmp	w16, wzr
    2334:      	b.eq	0x235c <_stogir.verify.classifications+0x2bc>
    2338:      	ldr	w19, [x9]
    233c:      	cmp	x15, #0x0
    2340:      	b.le	0x2354 <_stogir.verify.classifications+0x2b4>
    2344:      	cmp	x15, #0x4
    2348:      	b.le	0x2278 <_stogir.verify.classifications+0x1d8>
    234c:      	mov	w14, #0x4               ; =4
    2350:      	b	0x227c <_stogir.verify.classifications+0x1dc>
    2354:      	movz	w14, #0x0, lsl #16
    2358:      	b	0x2360 <_stogir.verify.classifications+0x2c0>
    235c:      	movz	w14, #0x0, lsl #16
    2360:      	adrp	x16, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002360:  ARM64_RELOC_PAGE21	l_stogir.346
    2364:      	ldr	x16, [x16]
		0000000000002364:  ARM64_RELOC_PAGEOFF12	l_stogir.346
    2368:      	ldr	w19, [x16]
    236c:      	ubfx	x14, x14, #0, #32
    2370:      	cmp	x14, x19
    2374:      	b.eq	0x238c <_stogir.verify.classifications+0x2ec>
    2378:      	adrp	x16, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002378:  ARM64_RELOC_PAGE21	l_stogir.347
    237c:      	ldr	x16, [x16]
		000000000000237c:  ARM64_RELOC_PAGEOFF12	l_stogir.347
    2380:      	ldr	w19, [x16]
    2384:      	cmp	x14, x19
    2388:      	b.ne	0x230c <_stogir.verify.classifications+0x26c>
    238c:      	cmp	x13, #0x1
    2390:      	b.ne	0x23cc <_stogir.verify.classifications+0x32c>
    2394:      	uxtb	w16, w27
    2398:      	cmp	w16, wzr
    239c:      	b.eq	0x23cc <_stogir.verify.classifications+0x32c>
    23a0:      	uxtb	w16, w1
    23a4:      	cmp	w16, wzr
    23a8:      	b.eq	0x2270 <_stogir.verify.classifications+0x1d0>
    23ac:      	uxtb	w16, w2
    23b0:      	cmp	w16, wzr
    23b4:      	b.eq	0x21e8 <_stogir.verify.classifications+0x148>
    23b8:      	uxtb	w16, w12
    23bc:      	cmp	w16, wzr
    23c0:      	b.eq	0x259c <_stogir.verify.classifications+0x4fc>
    23c4:      	mov	x20, x8
    23c8:      	b	0x25a0 <_stogir.verify.classifications+0x500>
    23cc:      	cmp	x13, #0x1
    23d0:      	b.ne	0x2434 <_stogir.verify.classifications+0x394>
    23d4:      	ldr	w14, [x24, #0x4]
    23d8:      	sxtw	x14, w14
    23dc:      	cmp	x14, #0x0
    23e0:      	cset	w15, gt
    23e4:      	movz	x16, #0x0, lsl #48
    23e8:      	sub	x19, x16, x14
    23ec:      	sub	x21, x19, #0x1
    23f0:      	uxtb	w16, w15
    23f4:      	cmp	w16, wzr
    23f8:      	b.eq	0x2444 <_stogir.verify.classifications+0x3a4>
    23fc:      	ldr	x19, [x22, #0x8]
    2400:      	cmp	x14, x19
    2404:      	b.ge	0x2290 <_stogir.verify.classifications+0x1f0>
    2408:      	ldr	x19, [x4, #0x8]
    240c:      	cmp	x14, x19
    2410:      	b.ge	0x2260 <_stogir.verify.classifications+0x1c0>
    2414:      	ldr	x19, [x22, #0x78]
    2418:      	add	x19, x19, x14, lsl #2
    241c:      	ldr	w19, [x19]
    2420:      	sxtw	x19, w19
    2424:      	cmp	x19, #0x0
    2428:      	cset	w19, ge
    242c:      	ubfx	x19, x19, #0, #8
    2430:      	b	0x2264 <_stogir.verify.classifications+0x1c4>
    2434:      	cmp	x13, #0x2
    2438:      	b.ne	0x2484 <_stogir.verify.classifications+0x3e4>
    243c:      	ldr	w14, [x24, #0x8]
    2440:      	b	0x23d8 <_stogir.verify.classifications+0x338>
    2444:      	cmp	x14, #0x0
    2448:      	b.ge	0x2298 <_stogir.verify.classifications+0x1f8>
    244c:      	ldr	x26, [x5, #0x8]
    2450:      	ldr	x28, [x6, #0x8]
    2454:      	cmp	x26, x28
    2458:      	b.ne	0x2268 <_stogir.verify.classifications+0x1c8>
    245c:      	cmp	x19, x26
    2460:      	b.gt	0x21e0 <_stogir.verify.classifications+0x140>
    2464:      	ldr	x19, [x22, #0x50]
    2468:      	add	x19, x19, x21, lsl #2
    246c:      	ldr	w19, [x19]
    2470:      	sxtw	x19, w19
    2474:      	cmp	x19, #0x0
    2478:      	cset	w19, gt
    247c:      	ubfx	x19, x19, #0, #8
    2480:      	b	0x21e4 <_stogir.verify.classifications+0x144>
    2484:      	cmp	x13, #0x3
    2488:      	b.ne	0x24f8 <_stogir.verify.classifications+0x458>
    248c:      	ldr	w14, [x24, #0xc]
    2490:      	b	0x2440 <_stogir.verify.classifications+0x3a0>
    2494:      	uxtb	w20, w20
    2498:      	uxtb	w0, w0
    249c:      	add	x16, sp, #0x10
    24a0:      	movz	w17, #0x0, lsl #16
    24a4:      	strh	w17, [x16]
    24a8:      	add	x16, sp, #0x10
    24ac:      	strb	w20, [x16]
    24b0:      	add	x16, sp, #0x10
    24b4:      	strb	w0, [x16, #0x1]
    24b8:      	add	x16, sp, #0x10
    24bc:      	ldrh	w0, [x16]
    24c0:      	ldr	x19, [sp, #0x20]
    24c4:      	ldr	x20, [sp, #0x28]
    24c8:      	ldr	x21, [sp, #0x30]
    24cc:      	ldr	x22, [sp, #0x38]
    24d0:      	ldr	x23, [sp, #0x40]
    24d4:      	ldr	x24, [sp, #0x48]
    24d8:      	ldr	x25, [sp, #0x50]
    24dc:      	ldr	x26, [sp, #0x58]
    24e0:      	ldr	x27, [sp, #0x60]
    24e4:      	ldr	x28, [sp, #0x68]
    24e8:      	ldr	x29, [sp]
    24ec:      	ldr	x30, [sp, #0x8]
    24f0:      	add	sp, sp, #0x70
    24f4:      	ret
    24f8:      	uxtb	w16, w10
    24fc:      	cmp	w16, wzr
    2500:      	b.ne	0x25a8 <_stogir.verify.classifications+0x508>
    2504:      	ldr	x14, [x22, #0x8]
    2508:      	cmp	x23, x14
    250c:      	b.ge	0x25a8 <_stogir.verify.classifications+0x508>
    2510:      	ldr	x14, [x7, #0x8]
    2514:      	cmp	x23, x14
    2518:      	b.ge	0x25a8 <_stogir.verify.classifications+0x508>
    251c:      	ldr	x14, [x22, #0x78]
    2520:      	add	x14, x11, x14
    2524:      	ldr	w14, [x14]
    2528:      	sxtw	x14, w14
    252c:      	cmp	x14, #0x0
    2530:      	b.lt	0x25a8 <_stogir.verify.classifications+0x508>
    2534:      	cmp	x15, #0x1
    2538:      	b.lt	0x2630 <_stogir.verify.classifications+0x590>
    253c:      	ldr	x14, [x22, #0x78]
    2540:      	add	x14, x11, x14
    2544:      	ldr	w14, [x14]
    2548:      	sxtw	x14, w14
    254c:      	cmp	x15, x14
    2550:      	b.gt	0x2630 <_stogir.verify.classifications+0x590>
    2554:      	ldr	x14, [x22]
    2558:      	asr	x16, x15, #63
    255c:      	lsr	x16, x16, #62
    2560:      	add	x19, x15, x16
    2564:      	asr	x19, x19, #2
    2568:      	asr	x16, x15, #63
    256c:      	lsr	x16, x16, #62
    2570:      	add	x15, x15, x16
    2574:      	and	x15, x15, #0x3
    2578:      	sub	x15, x15, x16
    257c:      	add	x19, x19, x23
    2580:      	add	x14, x14, x19, lsl #4
    2584:      	add	x14, x14, x15, lsl #2
    2588:      	ldr	w14, [x14]
    258c:      	movn	w17, #0x0, lsl #16
    2590:      	and	w14, w14, w17
    2594:      	mov	w15, #0x1               ; =1
    2598:      	b	0x2638 <_stogir.verify.classifications+0x598>
    259c:      	movz	x20, #0x0, lsl #48
    25a0:      	b	0x21ec <_stogir.verify.classifications+0x14c>
    25a4:      	b	0x2490 <_stogir.verify.classifications+0x3f0>
    25a8:      	movz	w15, #0x0, lsl #16
    25ac:      	movz	w14, #0x0, lsl #16
    25b0:      	ubfx	x15, x15, #0, #32
    25b4:      	lsr	x16, x15, #0
    25b8:      	cmp	x16, #0x1
    25bc:      	b.eq	0x25d8 <_stogir.verify.classifications+0x538>
    25c0:      	b.lo	0x25c8 <_stogir.verify.classifications+0x528>
    25c4:      	b	0x25dc <_stogir.verify.classifications+0x53c>
    25c8:      	cmp	x16, #0x0
    25cc:      	b.eq	0x25d4 <_stogir.verify.classifications+0x534>
    25d0:      	b	0x25dc <_stogir.verify.classifications+0x53c>
    25d4:      	b	0x25e0 <_stogir.verify.classifications+0x540>
    25d8:      	b	0x25a4 <_stogir.verify.classifications+0x504>
    25dc:      	b	0x264c <_stogir.verify.classifications+0x5ac>
    25e0:      	movz	w14, #0x0, lsl #16
    25e4:      	b	0x25a4 <_stogir.verify.classifications+0x504>
    25e8:      	cmp	x21, #0x18
    25ec:      	b.ne	0x2600 <_stogir.verify.classifications+0x560>
    25f0:      	mov	x0, #0x1                ; =1
    25f4:      	b	0x21dc <_stogir.verify.classifications+0x13c>
    25f8:      	movz	x20, #0x0, lsl #48
    25fc:      	b	0x211c <_stogir.verify.classifications+0x7c>
    2600:      	cmp	x21, #0x19
    2604:      	b.ne	0x2610 <_stogir.verify.classifications+0x570>
    2608:      	mov	x0, #0x1                ; =1
    260c:      	b	0x21dc <_stogir.verify.classifications+0x13c>
    2610:      	cmp	x19, #0xc
    2614:      	b.eq	0x21d8 <_stogir.verify.classifications+0x138>
    2618:      	cmp	x19, #0xd
    261c:      	b.eq	0x21d8 <_stogir.verify.classifications+0x138>
    2620:      	cmp	x26, #0xc
    2624:      	b.ne	0x263c <_stogir.verify.classifications+0x59c>
    2628:      	mov	x0, #0x1                ; =1
    262c:      	b	0x2648 <_stogir.verify.classifications+0x5a8>
    2630:      	movz	w15, #0x0, lsl #16
    2634:      	movz	w14, #0x0, lsl #16
    2638:      	b	0x25b0 <_stogir.verify.classifications+0x510>
    263c:      	cmp	x26, #0xd
    2640:      	cset	w0, eq
    2644:      	ubfx	x0, x0, #0, #8
    2648:      	b	0x21dc <_stogir.verify.classifications+0x13c>
    264c:      	brk	#0
    2650:      	b	0x264c <_stogir.verify.classifications+0x5ac>
    2654:      	mov	x26, x0
    2658:      	b	0x21f0 <_stogir.verify.classifications+0x150>
    265c:      	udf	#0x0

0000000000002660 <_stogir.vector.validate>:
    2660:      	sub	sp, sp, #0x210
    2664:      	str	x29, [sp]
    2668:      	str	x30, [sp, #0x8]
    266c:      	mov	x29, sp
    2670:      	str	x19, [sp, #0x1c0]
    2674:      	str	x20, [sp, #0x1c8]
    2678:      	str	x21, [sp, #0x1d0]
    267c:      	str	x22, [sp, #0x1d8]
    2680:      	str	x23, [sp, #0x1e0]
    2684:      	str	x24, [sp, #0x1e8]
    2688:      	str	x25, [sp, #0x1f0]
    268c:      	str	x26, [sp, #0x1f8]
    2690:      	str	x27, [sp, #0x200]
    2694:      	str	x28, [sp, #0x208]
    2698:      	orr	w19, w1, wzr
    269c:      	mov	x20, x8
    26a0:      	add	x8, sp, #0x10
    26a4:      	mov	x21, x0
    26a8:      	mov	w22, w1
    26ac:      	mov	w1, w19
    26b0:      	mov	w23, w2
    26b4:      	bl	0x26b4 <_stogir.vector.validate+0x54>
		00000000000026b4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    26b8:      	add	x16, sp, #0x10
    26bc:      	ldr	w0, [x16]
    26c0:      	lsr	x16, x0, #0
    26c4:      	cmp	x16, #0x1
    26c8:      	b.eq	0x26e4 <_stogir.vector.validate+0x84>
    26cc:      	b.lo	0x26d4 <_stogir.vector.validate+0x74>
    26d0:      	b	0x26e8 <_stogir.vector.validate+0x88>
    26d4:      	cmp	x16, #0x0
    26d8:      	b.eq	0x26e0 <_stogir.vector.validate+0x80>
    26dc:      	b	0x26e8 <_stogir.vector.validate+0x88>
    26e0:      	b	0x26ec <_stogir.vector.validate+0x8c>
    26e4:      	b	0x2778 <_stogir.vector.validate+0x118>
    26e8:      	b	0x2988 <_stogir.vector.validate+0x328>
    26ec:      	str	x20, [sp, #0x1a8]
    26f0:      	mov	x0, #0x1                ; =1
    26f4:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		00000000000026f4:  ARM64_RELOC_PAGE21	l_stogir.348
    26f8:      	ldr	x19, [x19]
		00000000000026f8:  ARM64_RELOC_PAGEOFF12	l_stogir.348
    26fc:      	mov	x25, #0x1a              ; =26
    2700:      	b	0x2730 <_stogir.vector.validate+0xd0>
    2704:      	add	x8, sp, #0x70
    2708:      	mov	x0, x21
    270c:      	ldr	w1, [sp, #0x1a0]
    2710:      	mov	w2, w23
    2714:      	bl	0x2714 <_stogir.vector.validate+0xb4>
		0000000000002714:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    2718:      	add	x16, sp, #0x70
    271c:      	ldr	x0, [x16]
    2720:      	add	x16, sp, #0x70
    2724:      	ldr	x19, [x16, #0x8]
    2728:      	add	x16, sp, #0x70
    272c:      	ldr	x25, [x16, #0x10]
    2730:      	ldr	x1, [sp, #0x1a8]
    2734:      	str	x0, [x1]
    2738:      	str	x19, [x1, #0x8]
    273c:      	str	x25, [x1, #0x10]
    2740:      	ldr	x19, [sp, #0x1c0]
    2744:      	ldr	x20, [sp, #0x1c8]
    2748:      	ldr	x21, [sp, #0x1d0]
    274c:      	ldr	x22, [sp, #0x1d8]
    2750:      	ldr	x23, [sp, #0x1e0]
    2754:      	ldr	x24, [sp, #0x1e8]
    2758:      	ldr	x25, [sp, #0x1f0]
    275c:      	ldr	x26, [sp, #0x1f8]
    2760:      	ldr	x27, [sp, #0x200]
    2764:      	ldr	x28, [sp, #0x208]
    2768:      	ldr	x29, [sp]
    276c:      	ldr	x30, [sp, #0x8]
    2770:      	add	sp, sp, #0x210
    2774:      	ret
    2778:      	sxtw	x22, w22
    277c:      	add	x16, sp, #0x10
    2780:      	orr	x0, x16, xzr
    2784:      	cmp	x22, #0x0
    2788:      	cset	w24, le
    278c:      	add	x0, x0, #0x8
    2790:      	add	x16, sp, #0x10
    2794:      	ldr	x25, [x16, #0x8]
    2798:      	add	x16, sp, #0x40
    279c:      	str	x25, [x16]
    27a0:      	ldr	x0, [x0, #0x8]
    27a4:      	add	x16, sp, #0x40
    27a8:      	str	x0, [x16, #0x8]
    27ac:      	uxtb	w16, w24
    27b0:      	cmp	w16, wzr
    27b4:      	b.eq	0x27d0 <_stogir.vector.validate+0x170>
    27b8:      	str	x20, [sp, #0x1a8]
    27bc:      	mov	x0, #0x1                ; =1
    27c0:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		00000000000027c0:  ARM64_RELOC_PAGE21	l_stogir.349
    27c4:      	ldr	x19, [x19]
		00000000000027c4:  ARM64_RELOC_PAGEOFF12	l_stogir.349
    27c8:      	mov	x25, #0x3b              ; =59
    27cc:      	b	0x2730 <_stogir.vector.validate+0xd0>
    27d0:      	lsl	x26, x22, #2
    27d4:      	uxtb	w0, w25
    27d8:      	orr	x27, x0, xzr
    27dc:      	ldr	x0, [x21, #0x78]
    27e0:      	cmp	x27, #0x44
    27e4:      	cset	w1, eq
    27e8:      	add	x0, x0, x22, lsl #2
    27ec:      	ldr	w28, [x0]
    27f0:      	cmp	x27, #0x24
    27f4:      	b.ne	0x2838 <_stogir.vector.validate+0x1d8>
    27f8:      	str	x20, [sp, #0x1a8]
    27fc:      	str	w19, [sp, #0x1a0]
    2800:      	uxtb	w16, w1
    2804:      	cmp	w16, wzr
    2808:      	b.eq	0x2704 <_stogir.vector.validate+0xa4>
    280c:      	add	x8, sp, #0x50
    2810:      	mov	x0, x21
    2814:      	ldr	w1, [sp, #0x1a0]
    2818:      	bl	0x2818 <_stogir.vector.validate+0x1b8>
		0000000000002818:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    281c:      	add	x16, sp, #0x50
    2820:      	ldr	x0, [x16]
    2824:      	add	x16, sp, #0x50
    2828:      	ldr	x19, [x16, #0x8]
    282c:      	add	x16, sp, #0x50
    2830:      	ldr	x25, [x16, #0x10]
    2834:      	b	0x2730 <_stogir.vector.validate+0xd0>
    2838:      	uxtb	w16, w1
    283c:      	cmp	w16, wzr
    2840:      	b.ne	0x3040 <_stogir.vector.validate+0x9e0>
    2844:      	cmp	x27, #0x3c
    2848:      	b.ne	0x28fc <_stogir.vector.validate+0x29c>
    284c:      	add	x8, sp, #0x90
    2850:      	mov	x0, x21
    2854:      	mov	w1, w19
    2858:      	bl	0x2858 <_stogir.vector.validate+0x1f8>
		0000000000002858:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    285c:      	add	x16, sp, #0x90
    2860:      	ldr	x0, [x16]
    2864:      	add	x16, sp, #0x90
    2868:      	ldr	x19, [x16, #0x8]
    286c:      	add	x16, sp, #0x90
    2870:      	ldr	x25, [x16, #0x10]
    2874:      	str	x20, [sp, #0x1a8]
    2878:      	b	0x28f8 <_stogir.vector.validate+0x298>
    287c:      	cmp	x27, #0x41
    2880:      	cset	w0, eq
    2884:      	cmp	x27, #0x48
    2888:      	cset	w1, eq
    288c:      	cmp	x27, #0x55
    2890:      	cset	w2, ge
    2894:      	cmp	x27, #0x58
    2898:      	cset	w3, le
    289c:      	cmp	x27, #0x47
    28a0:      	b.ne	0x2990 <_stogir.vector.validate+0x330>
    28a4:      	str	x20, [sp, #0x1a8]
    28a8:      	str	w19, [sp, #0x1a0]
    28ac:      	mov	w19, w0
    28b0:      	mov	w20, w1
    28b4:      	str	w2, [sp, #0x1b0]
    28b8:      	str	w3, [sp, #0x1b8]
    28bc:      	mov	x0, x21
    28c0:      	ldr	w1, [sp, #0x1a0]
    28c4:      	bl	0x28c4 <_stogir.vector.validate+0x264>
		00000000000028c4:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    28c8:      	cmp	x0, #0x0
    28cc:      	b.eq	0x29b4 <_stogir.vector.validate+0x354>
    28d0:      	add	x8, sp, #0xf0
    28d4:      	mov	x0, x21
    28d8:      	ldr	w1, [sp, #0x1a0]
    28dc:      	bl	0x28dc <_stogir.vector.validate+0x27c>
		00000000000028dc:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.validate
    28e0:      	add	x16, sp, #0xf0
    28e4:      	ldr	x0, [x16]
    28e8:      	add	x16, sp, #0xf0
    28ec:      	ldr	x19, [x16, #0x8]
    28f0:      	add	x16, sp, #0xf0
    28f4:      	ldr	x25, [x16, #0x10]
    28f8:      	b	0x2730 <_stogir.vector.validate+0xd0>
    28fc:      	cmp	x27, #0x3d
    2900:      	b.lt	0x2940 <_stogir.vector.validate+0x2e0>
    2904:      	cmp	x27, #0x3f
    2908:      	b.gt	0x2940 <_stogir.vector.validate+0x2e0>
    290c:      	add	x8, sp, #0xb0
    2910:      	mov	x0, x21
    2914:      	mov	w1, w19
    2918:      	mov	w2, w23
    291c:      	bl	0x291c <_stogir.vector.validate+0x2bc>
		000000000000291c:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.validate
    2920:      	add	x16, sp, #0xb0
    2924:      	ldr	x0, [x16]
    2928:      	add	x16, sp, #0xb0
    292c:      	ldr	x19, [x16, #0x8]
    2930:      	add	x16, sp, #0xb0
    2934:      	ldr	x25, [x16, #0x10]
    2938:      	str	x20, [sp, #0x1a8]
    293c:      	b	0x28f8 <_stogir.vector.validate+0x298>
    2940:      	mov	x0, x21
    2944:      	mov	w1, w19
    2948:      	bl	0x2948 <_stogir.vector.validate+0x2e8>
		0000000000002948:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.node?
    294c:      	cmp	x0, #0x0
    2950:      	b.eq	0x287c <_stogir.vector.validate+0x21c>
    2954:      	add	x8, sp, #0xd0
    2958:      	mov	x0, x21
    295c:      	mov	w1, w19
    2960:      	mov	w2, w23
    2964:      	bl	0x2964 <_stogir.vector.validate+0x304>
		0000000000002964:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.validate
    2968:      	add	x16, sp, #0xd0
    296c:      	ldr	x0, [x16]
    2970:      	add	x16, sp, #0xd0
    2974:      	ldr	x19, [x16, #0x8]
    2978:      	add	x16, sp, #0xd0
    297c:      	ldr	x25, [x16, #0x10]
    2980:      	str	x20, [sp, #0x1a8]
    2984:      	b	0x28f8 <_stogir.vector.validate+0x298>
    2988:      	brk	#0
    298c:      	b	0x2988 <_stogir.vector.validate+0x328>
    2990:      	cmp	x27, #0x4f
    2994:      	b.ne	0x2a2c <_stogir.vector.validate+0x3cc>
    2998:      	str	x20, [sp, #0x1a8]
    299c:      	str	w19, [sp, #0x1a0]
    29a0:      	mov	w19, w0
    29a4:      	mov	w20, w1
    29a8:      	str	w2, [sp, #0x1b0]
    29ac:      	str	w3, [sp, #0x1b8]
    29b0:      	b	0x28bc <_stogir.vector.validate+0x25c>
    29b4:      	uxtb	w16, w19
    29b8:      	cmp	w16, wzr
    29bc:      	b.ne	0x29fc <_stogir.vector.validate+0x39c>
    29c0:      	uxtb	w16, w20
    29c4:      	cmp	w16, wzr
    29c8:      	b.ne	0x29fc <_stogir.vector.validate+0x39c>
    29cc:      	ldr	w0, [sp, #0x1b0]
    29d0:      	uxtb	w16, w0
    29d4:      	cmp	w16, wzr
    29d8:      	b.eq	0x29ec <_stogir.vector.validate+0x38c>
    29dc:      	ldr	w0, [sp, #0x1b8]
    29e0:      	uxtb	w16, w0
    29e4:      	cmp	w16, wzr
    29e8:      	b.ne	0x29fc <_stogir.vector.validate+0x39c>
    29ec:      	movz	x0, #0x0, lsl #48
    29f0:      	movz	x19, #0x0, lsl #48
    29f4:      	movz	x25, #0x0, lsl #48
    29f8:      	b	0x2a28 <_stogir.vector.validate+0x3c8>
    29fc:      	add	x8, sp, #0x110
    2a00:      	mov	x0, x21
    2a04:      	ldr	w1, [sp, #0x1a0]
    2a08:      	mov	w2, w23
    2a0c:      	bl	0x2a0c <_stogir.vector.validate+0x3ac>
		0000000000002a0c:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    2a10:      	add	x16, sp, #0x110
    2a14:      	ldr	x0, [x16]
    2a18:      	add	x16, sp, #0x110
    2a1c:      	ldr	x19, [x16, #0x8]
    2a20:      	add	x16, sp, #0x110
    2a24:      	ldr	x25, [x16, #0x10]
    2a28:      	b	0x28f8 <_stogir.vector.validate+0x298>
    2a2c:      	cmp	x27, #0x50
    2a30:      	b.eq	0x304c <_stogir.vector.validate+0x9ec>
    2a34:      	cmp	x27, #0x78
    2a38:      	b.ne	0x2a58 <_stogir.vector.validate+0x3f8>
    2a3c:      	str	x20, [sp, #0x1a8]
    2a40:      	str	w19, [sp, #0x1a0]
    2a44:      	mov	w19, w0
    2a48:      	mov	w20, w1
    2a4c:      	str	w2, [sp, #0x1b0]
    2a50:      	str	w3, [sp, #0x1b8]
    2a54:      	b	0x28bc <_stogir.vector.validate+0x25c>
    2a58:      	uxtb	w16, w0
    2a5c:      	cmp	w16, wzr
    2a60:      	b.ne	0x2b48 <_stogir.vector.validate+0x4e8>
    2a64:      	uxtb	w16, w1
    2a68:      	cmp	w16, wzr
    2a6c:      	b.ne	0x2b48 <_stogir.vector.validate+0x4e8>
    2a70:      	uxtb	w16, w2
    2a74:      	cmp	w16, wzr
    2a78:      	b.eq	0x2a88 <_stogir.vector.validate+0x428>
    2a7c:      	uxtb	w16, w3
    2a80:      	cmp	w16, wzr
    2a84:      	b.ne	0x2b48 <_stogir.vector.validate+0x4e8>
    2a88:      	str	w2, [sp, #0x1b0]
    2a8c:      	str	w3, [sp, #0x1b8]
    2a90:      	str	w19, [sp, #0x1a0]
    2a94:      	str	x20, [sp, #0x1a8]
    2a98:      	mov	w20, w1
    2a9c:      	mov	w1, w19
    2aa0:      	mov	w19, w0
    2aa4:      	mov	x0, x21
    2aa8:      	bl	0x2aa8 <_stogir.vector.validate+0x448>
		0000000000002aa8:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    2aac:      	cmp	x0, #0x0
    2ab0:      	b.ne	0x28bc <_stogir.vector.validate+0x25c>
    2ab4:      	sxtw	x28, w28
    2ab8:      	ubfx	x25, x25, #0, #32
    2abc:      	ubfx	x0, x25, #8, #8
    2ac0:      	orr	x1, x0, xzr
    2ac4:      	orr	w20, w1, wzr
    2ac8:      	cmp	x27, #0x5b
    2acc:      	b.eq	0x2b78 <_stogir.vector.validate+0x518>
    2ad0:      	cmp	x27, #0x5c
    2ad4:      	b.eq	0x2b78 <_stogir.vector.validate+0x518>
    2ad8:      	orr	x19, x0, xzr
    2adc:      	cmp	x27, #0x5d
    2ae0:      	b.ne	0x2bdc <_stogir.vector.validate+0x57c>
    2ae4:      	mov	x27, x19
    2ae8:      	cmp	x28, #0x3
    2aec:      	b.ne	0x2bc8 <_stogir.vector.validate+0x568>
    2af0:      	cmp	x27, #0x0
    2af4:      	b.ne	0x2bc8 <_stogir.vector.validate+0x568>
    2af8:      	add	x16, sp, #0x40
    2afc:      	ldr	w0, [x16, #0x4]
    2b00:      	add	x16, sp, #0x40
    2b04:      	ldr	w1, [x16, #0x8]
    2b08:      	add	x16, sp, #0x40
    2b0c:      	ldr	w2, [x16, #0xc]
    2b10:      	add	x8, sp, #0x150
    2b14:      	mov	w3, w1
    2b18:      	mov	w1, w23
    2b1c:      	mov	w4, w2
    2b20:      	mov	w2, w0
    2b24:      	mov	x0, x21
    2b28:      	bl	0x2b28 <_stogir.vector.validate+0x4c8>
		0000000000002b28:  ARM64_RELOC_BRANCH26	_stogir.vector.store-inputs
    2b2c:      	add	x16, sp, #0x150
    2b30:      	ldr	x0, [x16]
    2b34:      	add	x16, sp, #0x150
    2b38:      	ldr	x19, [x16, #0x8]
    2b3c:      	add	x16, sp, #0x150
    2b40:      	ldr	x25, [x16, #0x10]
    2b44:      	b	0x2bd8 <_stogir.vector.validate+0x578>
    2b48:      	str	x20, [sp, #0x1a8]
    2b4c:      	str	w19, [sp, #0x1a0]
    2b50:      	mov	w19, w0
    2b54:      	mov	w20, w1
    2b58:      	str	w2, [sp, #0x1b0]
    2b5c:      	str	w3, [sp, #0x1b8]
    2b60:      	b	0x28bc <_stogir.vector.validate+0x25c>
    2b64:      	mov	x0, #0x1                ; =1
    2b68:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002b68:  ARM64_RELOC_PAGE21	l_stogir.350
    2b6c:      	ldr	x19, [x19]
		0000000000002b6c:  ARM64_RELOC_PAGEOFF12	l_stogir.350
    2b70:      	mov	x25, #0x19              ; =25
    2b74:      	b	0x28f8 <_stogir.vector.validate+0x298>
    2b78:      	cmp	x28, #0x2
    2b7c:      	b.ne	0x2b64 <_stogir.vector.validate+0x504>
    2b80:      	add	x16, sp, #0x40
    2b84:      	ldr	w0, [x16, #0x4]
    2b88:      	add	x16, sp, #0x40
    2b8c:      	ldr	w1, [x16, #0x8]
    2b90:      	add	x8, sp, #0x130
    2b94:      	mov	w2, w23
    2b98:      	mov	w3, w0
    2b9c:      	mov	x0, x21
    2ba0:      	mov	w4, w1
    2ba4:      	mov	w1, w20
    2ba8:      	bl	0x2ba8 <_stogir.vector.validate+0x548>
		0000000000002ba8:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    2bac:      	add	x16, sp, #0x130
    2bb0:      	ldr	x0, [x16]
    2bb4:      	add	x16, sp, #0x130
    2bb8:      	ldr	x19, [x16, #0x8]
    2bbc:      	add	x16, sp, #0x130
    2bc0:      	ldr	x25, [x16, #0x10]
    2bc4:      	b	0x2b74 <_stogir.vector.validate+0x514>
    2bc8:      	mov	x0, #0x1                ; =1
    2bcc:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002bcc:  ARM64_RELOC_PAGE21	l_stogir.351
    2bd0:      	ldr	x19, [x19]
		0000000000002bd0:  ARM64_RELOC_PAGEOFF12	l_stogir.351
    2bd4:      	mov	x25, #0x1a              ; =26
    2bd8:      	b	0x2b74 <_stogir.vector.validate+0x514>
    2bdc:      	cmp	x27, #0x5e
    2be0:      	b.eq	0x3068 <_stogir.vector.validate+0xa08>
    2be4:      	cmp	x27, #0x43
    2be8:      	b.ne	0x2c50 <_stogir.vector.validate+0x5f0>
    2bec:      	cmp	x19, #0xf
    2bf0:      	b.le	0x2f64 <_stogir.vector.validate+0x904>
    2bf4:      	cmp	x19, #0x80
    2bf8:      	b.ge	0x2f64 <_stogir.vector.validate+0x904>
    2bfc:      	and	w0, w1, #0xf
    2c00:      	ubfx	x0, x0, #0, #32
    2c04:      	cmp	x0, #0x1
    2c08:      	b.lt	0x2f64 <_stogir.vector.validate+0x904>
    2c0c:      	cmp	x0, #0xd
    2c10:      	b.gt	0x2f64 <_stogir.vector.validate+0x904>
    2c14:      	mov	w0, w20
    2c18:      	mov	w1, w23
    2c1c:      	bl	0x2c1c <_stogir.vector.validate+0x5bc>
		0000000000002c1c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    2c20:      	sxtw	x0, w0
    2c24:      	cmp	x0, #0x0
    2c28:      	b.le	0x2f64 <_stogir.vector.validate+0x904>
    2c2c:      	cmp	x28, #0x3
    2c30:      	b.lt	0x2f64 <_stogir.vector.validate+0x904>
    2c34:      	mov	x27, x19
    2c38:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002c38:  ARM64_RELOC_PAGE21	l_stogir.352
    2c3c:      	ldr	x19, [x19]
		0000000000002c3c:  ARM64_RELOC_PAGEOFF12	l_stogir.352
    2c40:      	movz	x25, #0x0, lsl #48
    2c44:      	b	0x2f74 <_stogir.vector.validate+0x914>
    2c48:      	mov	x0, #0x1                ; =1
    2c4c:      	b	0x2bd8 <_stogir.vector.validate+0x578>
    2c50:      	mov	x0, #0x1                ; =1
    2c54:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002c54:  ARM64_RELOC_PAGE21	l_stogir.353
    2c58:      	ldr	x19, [x19]
		0000000000002c58:  ARM64_RELOC_PAGEOFF12	l_stogir.353
    2c5c:      	mov	x25, #0x28              ; =40
    2c60:      	b	0x2c4c <_stogir.vector.validate+0x5ec>
    2c64:      	add	x16, sp, #0x40
    2c68:      	ldr	w0, [x16, #0x4]
    2c6c:      	sxtw	x0, w0
    2c70:      	ldr	x1, [x21, #0x78]
    2c74:      	add	x0, x1, x0, lsl #2
    2c78:      	ldr	w0, [x0]
    2c7c:      	add	w0, w0, #0x1
    2c80:      	sxtw	x0, w0
    2c84:      	cmp	x28, x0
    2c88:      	cset	w0, eq
    2c8c:      	uxtb	w16, w0
    2c90:      	cmp	w16, wzr
    2c94:      	cset	x0, eq
    2c98:      	cmp	x0, #0x0
    2c9c:      	b.eq	0x2cac <_stogir.vector.validate+0x64c>
    2ca0:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002ca0:  ARM64_RELOC_PAGE21	l_stogir.354
    2ca4:      	ldr	x19, [x19]
		0000000000002ca4:  ARM64_RELOC_PAGEOFF12	l_stogir.354
    2ca8:      	mov	x25, #0x19              ; =25
    2cac:      	add	x0, x21, #0x78
    2cb0:      	add	x1, x21, #0x28
    2cb4:      	add	x2, x21, #0x50
    2cb8:      	add	x3, x21, #0x78
    2cbc:      	mov	x4, #0x2                ; =2
    2cc0:      	b	0x2d3c <_stogir.vector.validate+0x6dc>
    2cc4:      	ubfx	x5, x5, #0, #32
    2cc8:      	ubfx	x5, x5, #8, #8
    2ccc:      	cmp	x5, x27
    2cd0:      	b.eq	0x2ce0 <_stogir.vector.validate+0x680>
    2cd4:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002cd4:  ARM64_RELOC_PAGE21	l_stogir.355
    2cd8:      	ldr	x19, [x19]
		0000000000002cd8:  ARM64_RELOC_PAGEOFF12	l_stogir.355
    2cdc:      	mov	x25, #0x1e              ; =30
    2ce0:      	b	0x2d34 <_stogir.vector.validate+0x6d4>
    2ce4:      	movz	w6, #0x0, lsl #16
    2ce8:      	movz	w5, #0x0, lsl #16
    2cec:      	b	0x2cf8 <_stogir.vector.validate+0x698>
    2cf0:      	movz	w6, #0x0, lsl #16
    2cf4:      	movz	w5, #0x0, lsl #16
    2cf8:      	ubfx	x6, x6, #0, #32
    2cfc:      	lsr	x16, x6, #0
    2d00:      	cmp	x16, #0x1
    2d04:      	b.eq	0x2d20 <_stogir.vector.validate+0x6c0>
    2d08:      	b.lo	0x2d10 <_stogir.vector.validate+0x6b0>
    2d0c:      	b	0x2d24 <_stogir.vector.validate+0x6c4>
    2d10:      	cmp	x16, #0x0
    2d14:      	b.eq	0x2d1c <_stogir.vector.validate+0x6bc>
    2d18:      	b	0x2d24 <_stogir.vector.validate+0x6c4>
    2d1c:      	b	0x2d28 <_stogir.vector.validate+0x6c8>
    2d20:      	b	0x2d90 <_stogir.vector.validate+0x730>
    2d24:      	b	0x3028 <_stogir.vector.validate+0x9c8>
    2d28:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002d28:  ARM64_RELOC_PAGE21	l_stogir.356
    2d2c:      	ldr	x19, [x19]
		0000000000002d2c:  ARM64_RELOC_PAGEOFF12	l_stogir.356
    2d30:      	mov	x25, #0x18              ; =24
    2d34:      	add	x4, x4, #0x1
    2d38:      	sxtw	x4, w4
    2d3c:      	cmp	x25, #0x0
    2d40:      	b.ne	0x2eb0 <_stogir.vector.validate+0x850>
    2d44:      	cmp	x4, x28
    2d48:      	b.gt	0x2eb0 <_stogir.vector.validate+0x850>
    2d4c:      	uxtb	w16, w24
    2d50:      	cmp	w16, wzr
    2d54:      	b.ne	0x2cf0 <_stogir.vector.validate+0x690>
    2d58:      	ldr	x5, [x21, #0x8]
    2d5c:      	cmp	x22, x5
    2d60:      	b.ge	0x2df4 <_stogir.vector.validate+0x794>
    2d64:      	ldr	x5, [x3, #0x8]
    2d68:      	cmp	x22, x5
    2d6c:      	b.ge	0x2dec <_stogir.vector.validate+0x78c>
    2d70:      	ldr	x5, [x21, #0x78]
    2d74:      	add	x5, x26, x5
    2d78:      	ldr	w5, [x5]
    2d7c:      	sxtw	x5, w5
    2d80:      	cmp	x5, #0x0
    2d84:      	cset	w5, ge
    2d88:      	ubfx	x5, x5, #0, #8
    2d8c:      	b	0x2df0 <_stogir.vector.validate+0x790>
    2d90:      	sxtw	x5, w5
    2d94:      	cmp	x5, #0x0
    2d98:      	cset	w6, gt
    2d9c:      	movz	x16, #0x0, lsl #48
    2da0:      	sub	x7, x16, x5
    2da4:      	sub	x8, x7, #0x1
    2da8:      	uxtb	w16, w6
    2dac:      	cmp	w16, wzr
    2db0:      	b.eq	0x2e70 <_stogir.vector.validate+0x810>
    2db4:      	ldr	x7, [x21, #0x8]
    2db8:      	cmp	x5, x7
    2dbc:      	b.ge	0x2ed8 <_stogir.vector.validate+0x878>
    2dc0:      	ldr	x7, [x0, #0x8]
    2dc4:      	cmp	x5, x7
    2dc8:      	b.ge	0x2fd8 <_stogir.vector.validate+0x978>
    2dcc:      	ldr	x7, [x21, #0x78]
    2dd0:      	add	x7, x7, x5, lsl #2
    2dd4:      	ldr	w7, [x7]
    2dd8:      	sxtw	x7, w7
    2ddc:      	cmp	x7, #0x0
    2de0:      	cset	w7, ge
    2de4:      	ubfx	x7, x7, #0, #8
    2de8:      	b	0x2fdc <_stogir.vector.validate+0x97c>
    2dec:      	movz	x5, #0x0, lsl #48
    2df0:      	b	0x2df8 <_stogir.vector.validate+0x798>
    2df4:      	movz	x5, #0x0, lsl #48
    2df8:      	cmp	x5, #0x0
    2dfc:      	b.eq	0x2cf0 <_stogir.vector.validate+0x690>
    2e00:      	orr	w5, w4, wzr
    2e04:      	sxtw	x5, w5
    2e08:      	cmp	x5, #0x1
    2e0c:      	b.lt	0x2ce4 <_stogir.vector.validate+0x684>
    2e10:      	ldr	x6, [x21, #0x78]
    2e14:      	add	x6, x26, x6
    2e18:      	ldr	w6, [x6]
    2e1c:      	sxtw	x6, w6
    2e20:      	cmp	x5, x6
    2e24:      	b.gt	0x2ce4 <_stogir.vector.validate+0x684>
    2e28:      	ldr	x6, [x21]
    2e2c:      	asr	x16, x5, #63
    2e30:      	lsr	x16, x16, #62
    2e34:      	add	x7, x5, x16
    2e38:      	asr	x7, x7, #2
    2e3c:      	asr	x16, x5, #63
    2e40:      	lsr	x16, x16, #62
    2e44:      	add	x5, x5, x16
    2e48:      	and	x5, x5, #0x3
    2e4c:      	sub	x5, x5, x16
    2e50:      	add	x7, x7, x22
    2e54:      	add	x6, x6, x7, lsl #4
    2e58:      	add	x5, x6, x5, lsl #2
    2e5c:      	ldr	w5, [x5]
    2e60:      	movn	w17, #0x0, lsl #16
    2e64:      	and	w5, w5, w17
    2e68:      	mov	w6, #0x1                ; =1
    2e6c:      	b	0x2cec <_stogir.vector.validate+0x68c>
    2e70:      	cmp	x5, #0x0
    2e74:      	b.ge	0x2ee0 <_stogir.vector.validate+0x880>
    2e78:      	ldr	x9, [x1, #0x8]
    2e7c:      	ldr	x10, [x2, #0x8]
    2e80:      	cmp	x9, x10
    2e84:      	b.ne	0x2fd0 <_stogir.vector.validate+0x970>
    2e88:      	cmp	x7, x9
    2e8c:      	b.gt	0x3004 <_stogir.vector.validate+0x9a4>
    2e90:      	ldr	x7, [x21, #0x50]
    2e94:      	add	x7, x7, x8, lsl #2
    2e98:      	ldr	w7, [x7]
    2e9c:      	sxtw	x7, w7
    2ea0:      	cmp	x7, #0x0
    2ea4:      	cset	w7, gt
    2ea8:      	ubfx	x7, x7, #0, #8
    2eac:      	b	0x3008 <_stogir.vector.validate+0x9a8>
    2eb0:      	cmp	x25, #0x0
    2eb4:      	b.ne	0x2c48 <_stogir.vector.validate+0x5e8>
    2eb8:      	mov	w0, w20
    2ebc:      	mov	w1, w23
    2ec0:      	bl	0x2ec0 <_stogir.vector.validate+0x860>
		0000000000002ec0:  ARM64_RELOC_BRANCH26	_stogir.types.size
    2ec4:      	sxtw	x0, w0
    2ec8:      	and	x19, x0, #0xffffffff
    2ecc:      	movz	x0, #0x0, lsl #48
    2ed0:      	movz	x25, #0x0, lsl #48
    2ed4:      	b	0x2c4c <_stogir.vector.validate+0x5ec>
    2ed8:      	movz	x7, #0x0, lsl #48
    2edc:      	b	0x2ee4 <_stogir.vector.validate+0x884>
    2ee0:      	movz	x7, #0x0, lsl #48
    2ee4:      	cmp	x7, #0x0
    2ee8:      	b.eq	0x2f1c <_stogir.vector.validate+0x8bc>
    2eec:      	uxtb	w16, w6
    2ef0:      	cmp	w16, wzr
    2ef4:      	b.eq	0x2f08 <_stogir.vector.validate+0x8a8>
    2ef8:      	ldr	x6, [x21]
    2efc:      	add	x5, x6, x5, lsl #4
    2f00:      	ldr	x5, [x5]
    2f04:      	b	0x2f14 <_stogir.vector.validate+0x8b4>
    2f08:      	ldr	x5, [x21, #0x28]
    2f0c:      	add	x5, x5, x8, lsl #4
    2f10:      	ldr	x5, [x5]
    2f14:      	mov	w6, #0x1                ; =1
    2f18:      	b	0x2f24 <_stogir.vector.validate+0x8c4>
    2f1c:      	movz	w6, #0x0, lsl #16
    2f20:      	movz	x5, #0x0, lsl #48
    2f24:      	ubfx	x6, x6, #0, #32
    2f28:      	lsr	x16, x6, #0
    2f2c:      	cmp	x16, #0x1
    2f30:      	b.eq	0x2f4c <_stogir.vector.validate+0x8ec>
    2f34:      	b.lo	0x2f3c <_stogir.vector.validate+0x8dc>
    2f38:      	b	0x2f50 <_stogir.vector.validate+0x8f0>
    2f3c:      	cmp	x16, #0x0
    2f40:      	b.eq	0x2f48 <_stogir.vector.validate+0x8e8>
    2f44:      	b	0x2f50 <_stogir.vector.validate+0x8f0>
    2f48:      	b	0x2f54 <_stogir.vector.validate+0x8f4>
    2f4c:      	b	0x2cc4 <_stogir.vector.validate+0x664>
    2f50:      	b	0x3030 <_stogir.vector.validate+0x9d0>
    2f54:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002f54:  ARM64_RELOC_PAGE21	l_stogir.356
    2f58:      	ldr	x19, [x19]
		0000000000002f58:  ARM64_RELOC_PAGEOFF12	l_stogir.356
    2f5c:      	mov	x25, #0x18              ; =24
    2f60:      	b	0x2ce0 <_stogir.vector.validate+0x680>
    2f64:      	mov	x27, x19
    2f68:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002f68:  ARM64_RELOC_PAGE21	l_stogir.357
    2f6c:      	ldr	x19, [x19]
		0000000000002f6c:  ARM64_RELOC_PAGEOFF12	l_stogir.357
    2f70:      	mov	x25, #0x20              ; =32
    2f74:      	add	x16, sp, #0x40
    2f78:      	ldr	w0, [x16, #0x4]
    2f7c:      	add	x8, sp, #0x170
    2f80:      	mov	w1, w0
    2f84:      	mov	x0, x21
    2f88:      	bl	0x2f88 <_stogir.vector.validate+0x928>
		0000000000002f88:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    2f8c:      	add	x16, sp, #0x170
    2f90:      	ldr	w0, [x16]
    2f94:      	lsr	x16, x0, #0
    2f98:      	cmp	x16, #0x1
    2f9c:      	b.eq	0x2fb8 <_stogir.vector.validate+0x958>
    2fa0:      	b.lo	0x2fa8 <_stogir.vector.validate+0x948>
    2fa4:      	b	0x2fbc <_stogir.vector.validate+0x95c>
    2fa8:      	cmp	x16, #0x0
    2fac:      	b.eq	0x2fb4 <_stogir.vector.validate+0x954>
    2fb0:      	b	0x2fbc <_stogir.vector.validate+0x95c>
    2fb4:      	b	0x2fc0 <_stogir.vector.validate+0x960>
    2fb8:      	b	0x2fe0 <_stogir.vector.validate+0x980>
    2fbc:      	b	0x3038 <_stogir.vector.validate+0x9d8>
    2fc0:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0x60>
		0000000000002fc0:  ARM64_RELOC_PAGE21	l_stogir.358
    2fc4:      	ldr	x19, [x19]
		0000000000002fc4:  ARM64_RELOC_PAGEOFF12	l_stogir.358
    2fc8:      	mov	x25, #0x19              ; =25
    2fcc:      	b	0x2cac <_stogir.vector.validate+0x64c>
    2fd0:      	movz	x7, #0x0, lsl #48
    2fd4:      	b	0x2ee4 <_stogir.vector.validate+0x884>
    2fd8:      	movz	x7, #0x0, lsl #48
    2fdc:      	b	0x2edc <_stogir.vector.validate+0x87c>
    2fe0:      	add	x16, sp, #0x170
    2fe4:      	ldr	x0, [x16, #0x8]
    2fe8:      	add	x16, sp, #0x40
    2fec:      	ldr	w1, [x16, #0x4]
    2ff0:      	sxtw	x1, w1
    2ff4:      	cmp	x1, #0x0
    2ff8:      	b.gt	0x300c <_stogir.vector.validate+0x9ac>
    2ffc:      	mov	x0, #0x1                ; =1
    3000:      	b	0x2c98 <_stogir.vector.validate+0x638>
    3004:      	movz	x7, #0x0, lsl #48
    3008:      	b	0x2fd4 <_stogir.vector.validate+0x974>
    300c:      	uxtb	w0, w0
    3010:      	cmp	x0, #0x70
    3014:      	b.eq	0x2c64 <_stogir.vector.validate+0x604>
    3018:      	cmp	x0, #0x71
    301c:      	b.eq	0x2c64 <_stogir.vector.validate+0x604>
    3020:      	mov	x0, #0x1                ; =1
    3024:      	b	0x2c98 <_stogir.vector.validate+0x638>
    3028:      	brk	#0
    302c:      	b	0x3028 <_stogir.vector.validate+0x9c8>
    3030:      	brk	#0
    3034:      	b	0x3030 <_stogir.vector.validate+0x9d0>
    3038:      	brk	#0
    303c:      	b	0x3038 <_stogir.vector.validate+0x9d8>
    3040:      	str	x20, [sp, #0x1a8]
    3044:      	str	w19, [sp, #0x1a0]
    3048:      	b	0x2800 <_stogir.vector.validate+0x1a0>
    304c:      	str	x20, [sp, #0x1a8]
    3050:      	str	w19, [sp, #0x1a0]
    3054:      	mov	w19, w0
    3058:      	mov	w20, w1
    305c:      	str	w2, [sp, #0x1b0]
    3060:      	str	w3, [sp, #0x1b8]
    3064:      	b	0x28bc <_stogir.vector.validate+0x25c>
    3068:      	mov	x27, x19
    306c:      	b	0x2ae8 <_stogir.vector.validate+0x488>

0000000000003070 <_stogir.copy.validate>:
    3070:      	sub	sp, sp, #0x10
    3074:      	sxtw	x1, w1
    3078:      	lsl	x2, x1, #2
    307c:      	cmp	x1, #0x0
    3080:      	cset	w3, gt
    3084:      	movz	x16, #0x0, lsl #48
    3088:      	sub	x4, x16, x1
    308c:      	sub	x5, x4, #0x1
    3090:      	uxtb	w16, w3
    3094:      	cmp	w16, wzr
    3098:      	b.eq	0x30d8 <_stogir.copy.validate+0x68>
    309c:      	ldr	x4, [x0, #0x8]
    30a0:      	cmp	x1, x4
    30a4:      	b.ge	0x313c <_stogir.copy.validate+0xcc>
    30a8:      	add	x4, x0, #0x78
    30ac:      	ldr	x4, [x4, #0x8]
    30b0:      	cmp	x1, x4
    30b4:      	b.ge	0x32d0 <_stogir.copy.validate+0x260>
    30b8:      	ldr	x4, [x0, #0x78]
    30bc:      	add	x4, x2, x4
    30c0:      	ldr	w4, [x4]
    30c4:      	sxtw	x4, w4
    30c8:      	cmp	x4, #0x0
    30cc:      	cset	w4, ge
    30d0:      	ubfx	x4, x4, #0, #8
    30d4:      	b	0x32d4 <_stogir.copy.validate+0x264>
    30d8:      	cmp	x1, #0x0
    30dc:      	b.ge	0x3144 <_stogir.copy.validate+0xd4>
    30e0:      	add	x6, x0, #0x28
    30e4:      	add	x7, x0, #0x50
    30e8:      	ldr	x6, [x6, #0x8]
    30ec:      	ldr	x7, [x7, #0x8]
    30f0:      	cmp	x6, x7
    30f4:      	b.ne	0x3120 <_stogir.copy.validate+0xb0>
    30f8:      	cmp	x4, x6
    30fc:      	b.gt	0x32d8 <_stogir.copy.validate+0x268>
    3100:      	ldr	x4, [x0, #0x50]
    3104:      	add	x4, x4, x5, lsl #2
    3108:      	ldr	w4, [x4]
    310c:      	sxtw	x4, w4
    3110:      	cmp	x4, #0x0
    3114:      	cset	w4, gt
    3118:      	ubfx	x4, x4, #0, #8
    311c:      	b	0x32dc <_stogir.copy.validate+0x26c>
    3120:      	movz	x4, #0x0, lsl #48
    3124:      	b	0x3148 <_stogir.copy.validate+0xd8>
    3128:      	mov	x1, #0x1                ; =1
    312c:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x9a0>
		000000000000312c:  ARM64_RELOC_PAGE21	l_stogir.359
    3130:      	ldr	x0, [x0]
		0000000000003130:  ARM64_RELOC_PAGEOFF12	l_stogir.359
    3134:      	mov	x2, #0x21               ; =33
    3138:      	b	0x31d4 <_stogir.copy.validate+0x164>
    313c:      	movz	x4, #0x0, lsl #48
    3140:      	b	0x3148 <_stogir.copy.validate+0xd8>
    3144:      	movz	x4, #0x0, lsl #48
    3148:      	cmp	x4, #0x0
    314c:      	b.eq	0x3188 <_stogir.copy.validate+0x118>
    3150:      	uxtb	w16, w3
    3154:      	cmp	w16, wzr
    3158:      	b.eq	0x3170 <_stogir.copy.validate+0x100>
    315c:      	ldr	x3, [x0]
    3160:      	add	x3, x3, x1, lsl #4
    3164:      	ldr	x4, [x3]
    3168:      	ldr	x3, [x3, #0x8]
    316c:      	b	0x3180 <_stogir.copy.validate+0x110>
    3170:      	ldr	x3, [x0, #0x28]
    3174:      	add	x3, x3, x5, lsl #4
    3178:      	ldr	x4, [x3]
    317c:      	ldr	x3, [x3, #0x8]
    3180:      	mov	w5, #0x1                ; =1
    3184:      	b	0x3194 <_stogir.copy.validate+0x124>
    3188:      	movz	w5, #0x0, lsl #16
    318c:      	movz	x4, #0x0, lsl #48
    3190:      	movz	x3, #0x0, lsl #48
    3194:      	ubfx	x5, x5, #0, #32
    3198:      	lsr	x16, x5, #0
    319c:      	cmp	x16, #0x1
    31a0:      	b.eq	0x31bc <_stogir.copy.validate+0x14c>
    31a4:      	b.lo	0x31ac <_stogir.copy.validate+0x13c>
    31a8:      	b	0x31c0 <_stogir.copy.validate+0x150>
    31ac:      	cmp	x16, #0x0
    31b0:      	b.eq	0x31b8 <_stogir.copy.validate+0x148>
    31b4:      	b	0x31c0 <_stogir.copy.validate+0x150>
    31b8:      	b	0x31c4 <_stogir.copy.validate+0x154>
    31bc:      	b	0x31e8 <_stogir.copy.validate+0x178>
    31c0:      	b	0x32e0 <_stogir.copy.validate+0x270>
    31c4:      	mov	x1, #0x1                ; =1
    31c8:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x9a0>
		00000000000031c8:  ARM64_RELOC_PAGE21	l_stogir.360
    31cc:      	ldr	x0, [x0]
		00000000000031cc:  ARM64_RELOC_PAGEOFF12	l_stogir.360
    31d0:      	mov	x2, #0x18               ; =24
    31d4:      	str	x1, [x8]
    31d8:      	str	x0, [x8, #0x8]
    31dc:      	str	x2, [x8, #0x10]
    31e0:      	add	sp, sp, #0x10
    31e4:      	ret
    31e8:      	mov	x16, sp
    31ec:      	str	x4, [x16]
    31f0:      	mov	x16, sp
    31f4:      	str	x3, [x16, #0x8]
    31f8:      	cmp	x1, #0x0
    31fc:      	b.le	0x3128 <_stogir.copy.validate+0xb8>
    3200:      	uxtb	w1, w4
    3204:      	cmp	x1, #0x44
    3208:      	b.ne	0x3128 <_stogir.copy.validate+0xb8>
    320c:      	ldr	x1, [x0, #0x78]
    3210:      	add	x1, x2, x1
    3214:      	ldr	w1, [x1]
    3218:      	sxtw	x1, w1
    321c:      	cmp	x1, #0x2
    3220:      	b.ne	0x3128 <_stogir.copy.validate+0xb8>
    3224:      	ubfx	x4, x4, #0, #32
    3228:      	ubfx	x1, x4, #8, #8
    322c:      	orr	x2, x1, xzr
    3230:      	cmp	x2, #0x0
    3234:      	b.eq	0x3128 <_stogir.copy.validate+0xb8>
    3238:      	cmp	x2, #0xd
    323c:      	b.le	0x3268 <_stogir.copy.validate+0x1f8>
    3240:      	cmp	x2, #0xf
    3244:      	b.le	0x3128 <_stogir.copy.validate+0xb8>
    3248:      	cmp	x2, #0x80
    324c:      	b.ge	0x3128 <_stogir.copy.validate+0xb8>
    3250:      	and	w1, w1, #0xf
    3254:      	ubfx	x1, x1, #0, #32
    3258:      	cmp	x1, #0x1
    325c:      	b.lt	0x3128 <_stogir.copy.validate+0xb8>
    3260:      	cmp	x1, #0xd
    3264:      	b.gt	0x3128 <_stogir.copy.validate+0xb8>
    3268:      	mov	x16, sp
    326c:      	ldr	w1, [x16, #0x4]
    3270:      	sxtw	x1, w1
    3274:      	cmp	x1, #0x0
    3278:      	cset	w3, gt
    327c:      	movz	x16, #0x0, lsl #48
    3280:      	sub	x4, x16, x1
    3284:      	sub	x5, x4, #0x1
    3288:      	uxtb	w16, w3
    328c:      	cmp	w16, wzr
    3290:      	b.eq	0x32fc <_stogir.copy.validate+0x28c>
    3294:      	ldr	x4, [x0, #0x8]
    3298:      	cmp	x1, x4
    329c:      	b.ge	0x3344 <_stogir.copy.validate+0x2d4>
    32a0:      	add	x4, x0, #0x78
    32a4:      	ldr	x4, [x4, #0x8]
    32a8:      	cmp	x1, x4
    32ac:      	b.ge	0x3408 <_stogir.copy.validate+0x398>
    32b0:      	ldr	x4, [x0, #0x78]
    32b4:      	add	x4, x4, x1, lsl #2
    32b8:      	ldr	w4, [x4]
    32bc:      	sxtw	x4, w4
    32c0:      	cmp	x4, #0x0
    32c4:      	cset	w4, ge
    32c8:      	ubfx	x4, x4, #0, #8
    32cc:      	b	0x340c <_stogir.copy.validate+0x39c>
    32d0:      	movz	x4, #0x0, lsl #48
    32d4:      	b	0x3140 <_stogir.copy.validate+0xd0>
    32d8:      	movz	x4, #0x0, lsl #48
    32dc:      	b	0x3124 <_stogir.copy.validate+0xb4>
    32e0:      	brk	#0
    32e4:      	b	0x32e0 <_stogir.copy.validate+0x270>
    32e8:      	mov	x1, #0x1                ; =1
    32ec:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x9a0>
		00000000000032ec:  ARM64_RELOC_PAGE21	l_stogir.361
    32f0:      	ldr	x0, [x0]
		00000000000032f0:  ARM64_RELOC_PAGEOFF12	l_stogir.361
    32f4:      	mov	x2, #0x20               ; =32
    32f8:      	b	0x3138 <_stogir.copy.validate+0xc8>
    32fc:      	cmp	x1, #0x0
    3300:      	b.ge	0x334c <_stogir.copy.validate+0x2dc>
    3304:      	add	x6, x0, #0x28
    3308:      	add	x7, x0, #0x50
    330c:      	ldr	x6, [x6, #0x8]
    3310:      	ldr	x7, [x7, #0x8]
    3314:      	cmp	x6, x7
    3318:      	b.ne	0x3400 <_stogir.copy.validate+0x390>
    331c:      	cmp	x4, x6
    3320:      	b.gt	0x3410 <_stogir.copy.validate+0x3a0>
    3324:      	ldr	x4, [x0, #0x50]
    3328:      	add	x4, x4, x5, lsl #2
    332c:      	ldr	w4, [x4]
    3330:      	sxtw	x4, w4
    3334:      	cmp	x4, #0x0
    3338:      	cset	w4, gt
    333c:      	ubfx	x4, x4, #0, #8
    3340:      	b	0x3414 <_stogir.copy.validate+0x3a4>
    3344:      	movz	x4, #0x0, lsl #48
    3348:      	b	0x3350 <_stogir.copy.validate+0x2e0>
    334c:      	movz	x4, #0x0, lsl #48
    3350:      	cmp	x4, #0x0
    3354:      	b.eq	0x3388 <_stogir.copy.validate+0x318>
    3358:      	uxtb	w16, w3
    335c:      	cmp	w16, wzr
    3360:      	b.eq	0x3374 <_stogir.copy.validate+0x304>
    3364:      	ldr	x0, [x0]
    3368:      	add	x0, x0, x1, lsl #4
    336c:      	ldr	x0, [x0]
    3370:      	b	0x3380 <_stogir.copy.validate+0x310>
    3374:      	ldr	x0, [x0, #0x28]
    3378:      	add	x0, x0, x5, lsl #4
    337c:      	ldr	x0, [x0]
    3380:      	mov	w1, #0x1                ; =1
    3384:      	b	0x3390 <_stogir.copy.validate+0x320>
    3388:      	movz	w1, #0x0, lsl #16
    338c:      	movz	x0, #0x0, lsl #48
    3390:      	ubfx	x1, x1, #0, #32
    3394:      	lsr	x16, x1, #0
    3398:      	cmp	x16, #0x1
    339c:      	b.eq	0x33b8 <_stogir.copy.validate+0x348>
    33a0:      	b.lo	0x33a8 <_stogir.copy.validate+0x338>
    33a4:      	b	0x33bc <_stogir.copy.validate+0x34c>
    33a8:      	cmp	x16, #0x0
    33ac:      	b.eq	0x33b4 <_stogir.copy.validate+0x344>
    33b0:      	b	0x33bc <_stogir.copy.validate+0x34c>
    33b4:      	b	0x33c0 <_stogir.copy.validate+0x350>
    33b8:      	b	0x33d4 <_stogir.copy.validate+0x364>
    33bc:      	b	0x3418 <_stogir.copy.validate+0x3a8>
    33c0:      	mov	x1, #0x1                ; =1
    33c4:      	adrp	x0, 0x3000 <_stogir.vector.validate+0x9a0>
		00000000000033c4:  ARM64_RELOC_PAGE21	l_stogir.362
    33c8:      	ldr	x0, [x0]
		00000000000033c8:  ARM64_RELOC_PAGEOFF12	l_stogir.362
    33cc:      	mov	x2, #0x13               ; =19
    33d0:      	b	0x32f8 <_stogir.copy.validate+0x288>
    33d4:      	mov	x16, sp
    33d8:      	ldr	w1, [x16]
    33dc:      	ubfx	x0, x0, #0, #32
    33e0:      	ubfx	x0, x0, #8, #8
    33e4:      	ubfx	x1, x1, #8, #8
    33e8:      	cmp	x0, x1
    33ec:      	b.ne	0x32e8 <_stogir.copy.validate+0x278>
    33f0:      	and	x0, x2, #0xffffffff
    33f4:      	movz	x1, #0x0, lsl #48
    33f8:      	movz	x2, #0x0, lsl #48
    33fc:      	b	0x32f8 <_stogir.copy.validate+0x288>
    3400:      	movz	x4, #0x0, lsl #48
    3404:      	b	0x3350 <_stogir.copy.validate+0x2e0>
    3408:      	movz	x4, #0x0, lsl #48
    340c:      	b	0x3348 <_stogir.copy.validate+0x2d8>
    3410:      	movz	x4, #0x0, lsl #48
    3414:      	b	0x3404 <_stogir.copy.validate+0x394>
    3418:      	brk	#0
    341c:      	b	0x3418 <_stogir.copy.validate+0x3a8>

0000000000003420 <_stogir.graph.lookup>:
    3420:      	sxtw	x1, w1
    3424:      	cmp	x1, #0x0
    3428:      	cset	w2, gt
    342c:      	movz	x16, #0x0, lsl #48
    3430:      	sub	x3, x16, x1
    3434:      	sub	x4, x3, #0x1
    3438:      	uxtb	w16, w2
    343c:      	cmp	w16, wzr
    3440:      	b.eq	0x3480 <_stogir.graph.lookup+0x60>
    3444:      	ldr	x3, [x0, #0x8]
    3448:      	cmp	x1, x3
    344c:      	b.ge	0x34d0 <_stogir.graph.lookup+0xb0>
    3450:      	add	x3, x0, #0x78
    3454:      	ldr	x3, [x3, #0x8]
    3458:      	cmp	x1, x3
    345c:      	b.ge	0x3548 <_stogir.graph.lookup+0x128>
    3460:      	ldr	x3, [x0, #0x78]
    3464:      	add	x3, x3, x1, lsl #2
    3468:      	ldr	w3, [x3]
    346c:      	sxtw	x3, w3
    3470:      	cmp	x3, #0x0
    3474:      	cset	w3, ge
    3478:      	ubfx	x3, x3, #0, #8
    347c:      	b	0x354c <_stogir.graph.lookup+0x12c>
    3480:      	cmp	x1, #0x0
    3484:      	b.ge	0x34d8 <_stogir.graph.lookup+0xb8>
    3488:      	add	x5, x0, #0x28
    348c:      	add	x6, x0, #0x50
    3490:      	ldr	x5, [x5, #0x8]
    3494:      	ldr	x6, [x6, #0x8]
    3498:      	cmp	x5, x6
    349c:      	b.ne	0x34c8 <_stogir.graph.lookup+0xa8>
    34a0:      	cmp	x3, x5
    34a4:      	b.gt	0x3550 <_stogir.graph.lookup+0x130>
    34a8:      	ldr	x3, [x0, #0x50]
    34ac:      	add	x3, x3, x4, lsl #2
    34b0:      	ldr	w3, [x3]
    34b4:      	sxtw	x3, w3
    34b8:      	cmp	x3, #0x0
    34bc:      	cset	w3, gt
    34c0:      	ubfx	x3, x3, #0, #8
    34c4:      	b	0x3554 <_stogir.graph.lookup+0x134>
    34c8:      	movz	x3, #0x0, lsl #48
    34cc:      	b	0x34dc <_stogir.graph.lookup+0xbc>
    34d0:      	movz	x3, #0x0, lsl #48
    34d4:      	b	0x34dc <_stogir.graph.lookup+0xbc>
    34d8:      	movz	x3, #0x0, lsl #48
    34dc:      	cmp	x3, #0x0
    34e0:      	b.eq	0x351c <_stogir.graph.lookup+0xfc>
    34e4:      	uxtb	w16, w2
    34e8:      	cmp	w16, wzr
    34ec:      	b.eq	0x3504 <_stogir.graph.lookup+0xe4>
    34f0:      	ldr	x0, [x0]
    34f4:      	add	x0, x0, x1, lsl #4
    34f8:      	ldr	x1, [x0]
    34fc:      	ldr	x0, [x0, #0x8]
    3500:      	b	0x3514 <_stogir.graph.lookup+0xf4>
    3504:      	ldr	x0, [x0, #0x28]
    3508:      	add	x0, x0, x4, lsl #4
    350c:      	ldr	x1, [x0]
    3510:      	ldr	x0, [x0, #0x8]
    3514:      	mov	x2, #0x1                ; =1
    3518:      	b	0x3528 <_stogir.graph.lookup+0x108>
    351c:      	movz	x2, #0x0, lsl #48
    3520:      	movz	x1, #0x0, lsl #48
    3524:      	movz	x0, #0x0, lsl #48
    3528:      	str	x2, [x8]
    352c:      	str	x1, [x8, #0x8]
    3530:      	str	x0, [x8, #0x10]
    3534:      	movz	x17, #0x0, lsl #48
    3538:      	str	x17, [x8, #0x18]
    353c:      	movz	x17, #0x0, lsl #48
    3540:      	str	x17, [x8, #0x20]
    3544:      	ret
    3548:      	movz	x3, #0x0, lsl #48
    354c:      	b	0x34d4 <_stogir.graph.lookup+0xb4>
    3550:      	movz	x3, #0x0, lsl #48
    3554:      	b	0x34cc <_stogir.graph.lookup+0xac>

0000000000003558 <_stogir.checked.validate-projection>:
    3558:      	sub	sp, sp, #0x40
    355c:      	str	x29, [sp]
    3560:      	str	x30, [sp, #0x8]
    3564:      	mov	x29, sp
    3568:      	str	x19, [sp, #0x30]
    356c:      	sxtw	x1, w1
    3570:      	lsl	x2, x1, #2
    3574:      	cmp	x1, #0x0
    3578:      	cset	w3, gt
    357c:      	movz	x16, #0x0, lsl #48
    3580:      	sub	x4, x16, x1
    3584:      	sub	x5, x4, #0x1
    3588:      	uxtb	w16, w3
    358c:      	cmp	w16, wzr
    3590:      	b.eq	0x35d0 <_stogir.checked.validate-projection+0x78>
    3594:      	ldr	x4, [x0, #0x8]
    3598:      	cmp	x1, x4
    359c:      	b.ge	0x3620 <_stogir.checked.validate-projection+0xc8>
    35a0:      	add	x4, x0, #0x78
    35a4:      	ldr	x4, [x4, #0x8]
    35a8:      	cmp	x1, x4
    35ac:      	b.ge	0x36f0 <_stogir.checked.validate-projection+0x198>
    35b0:      	ldr	x4, [x0, #0x78]
    35b4:      	add	x4, x2, x4
    35b8:      	ldr	w4, [x4]
    35bc:      	sxtw	x4, w4
    35c0:      	cmp	x4, #0x0
    35c4:      	cset	w4, ge
    35c8:      	ubfx	x4, x4, #0, #8
    35cc:      	b	0x36f4 <_stogir.checked.validate-projection+0x19c>
    35d0:      	cmp	x1, #0x0
    35d4:      	b.ge	0x3628 <_stogir.checked.validate-projection+0xd0>
    35d8:      	add	x6, x0, #0x28
    35dc:      	add	x7, x0, #0x50
    35e0:      	ldr	x6, [x6, #0x8]
    35e4:      	ldr	x7, [x7, #0x8]
    35e8:      	cmp	x6, x7
    35ec:      	b.ne	0x3618 <_stogir.checked.validate-projection+0xc0>
    35f0:      	cmp	x4, x6
    35f4:      	b.gt	0x375c <_stogir.checked.validate-projection+0x204>
    35f8:      	ldr	x4, [x0, #0x50]
    35fc:      	add	x4, x4, x5, lsl #2
    3600:      	ldr	w4, [x4]
    3604:      	sxtw	x4, w4
    3608:      	cmp	x4, #0x0
    360c:      	cset	w4, gt
    3610:      	ubfx	x4, x4, #0, #8
    3614:      	b	0x3760 <_stogir.checked.validate-projection+0x208>
    3618:      	movz	x4, #0x0, lsl #48
    361c:      	b	0x362c <_stogir.checked.validate-projection+0xd4>
    3620:      	movz	x4, #0x0, lsl #48
    3624:      	b	0x362c <_stogir.checked.validate-projection+0xd4>
    3628:      	movz	x4, #0x0, lsl #48
    362c:      	cmp	x4, #0x0
    3630:      	b.eq	0x3664 <_stogir.checked.validate-projection+0x10c>
    3634:      	uxtb	w16, w3
    3638:      	cmp	w16, wzr
    363c:      	b.eq	0x3650 <_stogir.checked.validate-projection+0xf8>
    3640:      	ldr	x3, [x0]
    3644:      	add	x3, x3, x1, lsl #4
    3648:      	ldr	x3, [x3]
    364c:      	b	0x365c <_stogir.checked.validate-projection+0x104>
    3650:      	ldr	x3, [x0, #0x28]
    3654:      	add	x3, x3, x5, lsl #4
    3658:      	ldr	x3, [x3]
    365c:      	mov	w4, #0x1                ; =1
    3660:      	b	0x366c <_stogir.checked.validate-projection+0x114>
    3664:      	movz	w4, #0x0, lsl #16
    3668:      	movz	x3, #0x0, lsl #48
    366c:      	ubfx	x4, x4, #0, #32
    3670:      	lsr	x16, x4, #0
    3674:      	cmp	x16, #0x1
    3678:      	b.eq	0x3694 <_stogir.checked.validate-projection+0x13c>
    367c:      	b.lo	0x3684 <_stogir.checked.validate-projection+0x12c>
    3680:      	b	0x3698 <_stogir.checked.validate-projection+0x140>
    3684:      	cmp	x16, #0x0
    3688:      	b.eq	0x3690 <_stogir.checked.validate-projection+0x138>
    368c:      	b	0x3698 <_stogir.checked.validate-projection+0x140>
    3690:      	b	0x369c <_stogir.checked.validate-projection+0x144>
    3694:      	b	0x36b4 <_stogir.checked.validate-projection+0x15c>
    3698:      	b	0x3764 <_stogir.checked.validate-projection+0x20c>
    369c:      	mov	x19, x8
    36a0:      	mov	x0, #0x1                ; =1
    36a4:      	adrp	x1, 0x3000 <_stogir.vector.validate+0x9a0>
		00000000000036a4:  ARM64_RELOC_PAGE21	l_stogir.363
    36a8:      	ldr	x1, [x1]
		00000000000036a8:  ARM64_RELOC_PAGEOFF12	l_stogir.363
    36ac:      	mov	x2, #0x10               ; =16
    36b0:      	b	0x36d0 <_stogir.checked.validate-projection+0x178>
    36b4:      	cmp	x1, #0x0
    36b8:      	b.gt	0x36f8 <_stogir.checked.validate-projection+0x1a0>
    36bc:      	mov	x19, x8
    36c0:      	mov	x0, #0x1                ; =1
    36c4:      	adrp	x1, 0x3000 <_stogir.vector.validate+0x9a0>
		00000000000036c4:  ARM64_RELOC_PAGE21	l_stogir.364
    36c8:      	ldr	x1, [x1]
		00000000000036c8:  ARM64_RELOC_PAGEOFF12	l_stogir.364
    36cc:      	mov	x2, #0x1c               ; =28
    36d0:      	str	x0, [x19]
    36d4:      	str	x1, [x19, #0x8]
    36d8:      	str	x2, [x19, #0x10]
    36dc:      	ldr	x19, [sp, #0x30]
    36e0:      	ldr	x29, [sp]
    36e4:      	ldr	x30, [sp, #0x8]
    36e8:      	add	sp, sp, #0x40
    36ec:      	ret
    36f0:      	movz	x4, #0x0, lsl #48
    36f4:      	b	0x3624 <_stogir.checked.validate-projection+0xcc>
    36f8:      	uxtb	w1, w3
    36fc:      	cmp	x1, #0x2c
    3700:      	b.ne	0x376c <_stogir.checked.validate-projection+0x214>
    3704:      	orr	w1, w3, wzr
    3708:      	ubfx	x1, x1, #0, #32
    370c:      	ubfx	x1, x1, #8, #8
    3710:      	cmp	x1, #0x1
    3714:      	b.ne	0x3774 <_stogir.checked.validate-projection+0x21c>
    3718:      	ldr	x1, [x0, #0x78]
    371c:      	add	x1, x2, x1
    3720:      	ldr	w1, [x1]
    3724:      	sxtw	x1, w1
    3728:      	cmp	x1, #0x1
    372c:      	b.ne	0x377c <_stogir.checked.validate-projection+0x224>
    3730:      	lsr	x1, x3, #32
    3734:      	mov	x19, x8
    3738:      	add	x8, sp, #0x10
    373c:      	bl	0x373c <_stogir.checked.validate-projection+0x1e4>
		000000000000373c:  ARM64_RELOC_BRANCH26	_stogir.checked.projection
    3740:      	add	x16, sp, #0x10
    3744:      	ldr	x0, [x16]
    3748:      	add	x16, sp, #0x10
    374c:      	ldr	x1, [x16, #0x8]
    3750:      	add	x16, sp, #0x10
    3754:      	ldr	x2, [x16, #0x10]
    3758:      	b	0x36d0 <_stogir.checked.validate-projection+0x178>
    375c:      	movz	x4, #0x0, lsl #48
    3760:      	b	0x361c <_stogir.checked.validate-projection+0xc4>
    3764:      	brk	#0
    3768:      	b	0x3764 <_stogir.checked.validate-projection+0x20c>
    376c:      	mov	x19, x8
    3770:      	b	0x36c0 <_stogir.checked.validate-projection+0x168>
    3774:      	mov	x19, x8
    3778:      	b	0x36c0 <_stogir.checked.validate-projection+0x168>
    377c:      	mov	x19, x8
    3780:      	b	0x36c0 <_stogir.checked.validate-projection+0x168>

0000000000003784 <_stogir.checked.validate>:
    3784:      	sub	sp, sp, #0x20
    3788:      	str	x29, [sp]
    378c:      	str	x30, [sp, #0x8]
    3790:      	mov	x29, sp
    3794:      	str	x19, [sp, #0x10]
    3798:      	sxtw	x1, w1
    379c:      	lsl	x2, x1, #2
    37a0:      	cmp	x1, #0x0
    37a4:      	cset	w3, gt
    37a8:      	movz	x16, #0x0, lsl #48
    37ac:      	sub	x4, x16, x1
    37b0:      	sub	x5, x4, #0x1
    37b4:      	uxtb	w16, w3
    37b8:      	cmp	w16, wzr
    37bc:      	b.eq	0x37fc <_stogir.checked.validate+0x78>
    37c0:      	ldr	x4, [x0, #0x8]
    37c4:      	cmp	x1, x4
    37c8:      	b.ge	0x384c <_stogir.checked.validate+0xc8>
    37cc:      	add	x4, x0, #0x78
    37d0:      	ldr	x4, [x4, #0x8]
    37d4:      	cmp	x1, x4
    37d8:      	b.ge	0x3998 <_stogir.checked.validate+0x214>
    37dc:      	ldr	x4, [x0, #0x78]
    37e0:      	add	x4, x2, x4
    37e4:      	ldr	w4, [x4]
    37e8:      	sxtw	x4, w4
    37ec:      	cmp	x4, #0x0
    37f0:      	cset	w4, ge
    37f4:      	ubfx	x4, x4, #0, #8
    37f8:      	b	0x399c <_stogir.checked.validate+0x218>
    37fc:      	cmp	x1, #0x0
    3800:      	b.ge	0x3854 <_stogir.checked.validate+0xd0>
    3804:      	add	x6, x0, #0x28
    3808:      	add	x7, x0, #0x50
    380c:      	ldr	x6, [x6, #0x8]
    3810:      	ldr	x7, [x7, #0x8]
    3814:      	cmp	x6, x7
    3818:      	b.ne	0x3844 <_stogir.checked.validate+0xc0>
    381c:      	cmp	x4, x6
    3820:      	b.gt	0x39a0 <_stogir.checked.validate+0x21c>
    3824:      	ldr	x4, [x0, #0x50]
    3828:      	add	x4, x4, x5, lsl #2
    382c:      	ldr	w4, [x4]
    3830:      	sxtw	x4, w4
    3834:      	cmp	x4, #0x0
    3838:      	cset	w4, gt
    383c:      	ubfx	x4, x4, #0, #8
    3840:      	b	0x39a4 <_stogir.checked.validate+0x220>
    3844:      	movz	x4, #0x0, lsl #48
    3848:      	b	0x3858 <_stogir.checked.validate+0xd4>
    384c:      	movz	x4, #0x0, lsl #48
    3850:      	b	0x3858 <_stogir.checked.validate+0xd4>
    3854:      	movz	x4, #0x0, lsl #48
    3858:      	cmp	x4, #0x0
    385c:      	b.eq	0x3898 <_stogir.checked.validate+0x114>
    3860:      	uxtb	w16, w3
    3864:      	cmp	w16, wzr
    3868:      	b.eq	0x3880 <_stogir.checked.validate+0xfc>
    386c:      	ldr	x3, [x0]
    3870:      	add	x3, x3, x1, lsl #4
    3874:      	ldr	x4, [x3]
    3878:      	ldr	x3, [x3, #0x8]
    387c:      	b	0x3890 <_stogir.checked.validate+0x10c>
    3880:      	ldr	x3, [x0, #0x28]
    3884:      	add	x3, x3, x5, lsl #4
    3888:      	ldr	x4, [x3]
    388c:      	ldr	x3, [x3, #0x8]
    3890:      	mov	w5, #0x1                ; =1
    3894:      	b	0x38a4 <_stogir.checked.validate+0x120>
    3898:      	movz	w5, #0x0, lsl #16
    389c:      	movz	x4, #0x0, lsl #48
    38a0:      	movz	x3, #0x0, lsl #48
    38a4:      	ubfx	x5, x5, #0, #32
    38a8:      	lsr	x16, x5, #0
    38ac:      	cmp	x16, #0x1
    38b0:      	b.eq	0x38cc <_stogir.checked.validate+0x148>
    38b4:      	b.lo	0x38bc <_stogir.checked.validate+0x138>
    38b8:      	b	0x38d0 <_stogir.checked.validate+0x14c>
    38bc:      	cmp	x16, #0x0
    38c0:      	b.eq	0x38c8 <_stogir.checked.validate+0x144>
    38c4:      	b	0x38d0 <_stogir.checked.validate+0x14c>
    38c8:      	b	0x38d4 <_stogir.checked.validate+0x150>
    38cc:      	b	0x391c <_stogir.checked.validate+0x198>
    38d0:      	b	0x3bb8 <_stogir.checked.validate+0x434>
    38d4:      	mov	x0, #0x1                ; =1
    38d8:      	adrp	x7, 0x3000 <_stogir.vector.validate+0x9a0>
		00000000000038d8:  ARM64_RELOC_PAGE21	l_stogir.365
    38dc:      	ldr	x7, [x7]
		00000000000038dc:  ARM64_RELOC_PAGEOFF12	l_stogir.365
    38e0:      	mov	x9, #0x1a               ; =26
    38e4:      	b	0x38f8 <_stogir.checked.validate+0x174>
    38e8:      	mov	x0, #0x1                ; =1
    38ec:      	adrp	x7, 0x3000 <_stogir.vector.validate+0x9a0>
		00000000000038ec:  ARM64_RELOC_PAGE21	l_stogir.366
    38f0:      	ldr	x7, [x7]
		00000000000038f0:  ARM64_RELOC_PAGEOFF12	l_stogir.366
    38f4:      	mov	x9, #0x26               ; =38
    38f8:      	str	x0, [x8]
    38fc:      	str	x7, [x8, #0x8]
    3900:      	str	x9, [x8, #0x10]
    3904:      	sub	sp, x29, #0x0
    3908:      	ldr	x19, [sp, #0x10]
    390c:      	ldr	x29, [sp]
    3910:      	ldr	x30, [sp, #0x8]
    3914:      	add	sp, sp, #0x20
    3918:      	ret
    391c:      	cmp	x1, #0x0
    3920:      	b.le	0x38e8 <_stogir.checked.validate+0x164>
    3924:      	uxtb	w1, w4
    3928:      	cmp	x1, #0x29
    392c:      	b.lt	0x38e8 <_stogir.checked.validate+0x164>
    3930:      	cmp	x1, #0x2b
    3934:      	b.gt	0x38e8 <_stogir.checked.validate+0x164>
    3938:      	ldr	x1, [x0, #0x78]
    393c:      	add	x1, x2, x1
    3940:      	ldr	w1, [x1]
    3944:      	sxtw	x1, w1
    3948:      	cmp	x1, #0x2
    394c:      	b.ne	0x38e8 <_stogir.checked.validate+0x164>
    3950:      	orr	w1, w4, wzr
    3954:      	mov	x2, sp
    3958:      	ubfx	x1, x1, #0, #32
    395c:      	sub	sp, sp, #0x10
    3960:      	mov	x5, sp
    3964:      	sub	sp, sp, #0x10
    3968:      	mov	x6, sp
    396c:      	ubfx	x1, x1, #8, #8
    3970:      	cmp	x1, #0x1
    3974:      	b.lt	0x3b70 <_stogir.checked.validate+0x3ec>
    3978:      	cmp	x1, #0xb
    397c:      	b.gt	0x3b70 <_stogir.checked.validate+0x3ec>
    3980:      	cmp	x1, #0x1
    3984:      	b.eq	0x3b70 <_stogir.checked.validate+0x3ec>
    3988:      	adrp	x7, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003988:  ARM64_RELOC_PAGE21	l_stogir.367
    398c:      	ldr	x7, [x7]
		000000000000398c:  ARM64_RELOC_PAGEOFF12	l_stogir.367
    3990:      	movz	x9, #0x0, lsl #48
    3994:      	b	0x3b7c <_stogir.checked.validate+0x3f8>
    3998:      	movz	x4, #0x0, lsl #48
    399c:      	b	0x3850 <_stogir.checked.validate+0xcc>
    39a0:      	movz	x4, #0x0, lsl #48
    39a4:      	b	0x3848 <_stogir.checked.validate+0xc4>
    39a8:      	mov	x0, #0x1                ; =1
    39ac:      	mov	sp, x2
    39b0:      	b	0x38f8 <_stogir.checked.validate+0x174>
    39b4:      	movz	w5, #0x0, lsl #16
    39b8:      	movz	x4, #0x0, lsl #48
    39bc:      	ubfx	x5, x5, #0, #32
    39c0:      	lsr	x16, x5, #0
    39c4:      	cmp	x16, #0x1
    39c8:      	b.eq	0x39e4 <_stogir.checked.validate+0x260>
    39cc:      	b.lo	0x39d4 <_stogir.checked.validate+0x250>
    39d0:      	b	0x39e8 <_stogir.checked.validate+0x264>
    39d4:      	cmp	x16, #0x0
    39d8:      	b.eq	0x39e0 <_stogir.checked.validate+0x25c>
    39dc:      	b	0x39e8 <_stogir.checked.validate+0x264>
    39e0:      	b	0x39ec <_stogir.checked.validate+0x268>
    39e4:      	b	0x3b50 <_stogir.checked.validate+0x3cc>
    39e8:      	b	0x3bd0 <_stogir.checked.validate+0x44c>
    39ec:      	adrp	x7, 0x3000 <_stogir.vector.validate+0x9a0>
		00000000000039ec:  ARM64_RELOC_PAGE21	l_stogir.368
    39f0:      	ldr	x7, [x7]
		00000000000039f0:  ARM64_RELOC_PAGEOFF12	l_stogir.368
    39f4:      	mov	x9, #0x22               ; =34
    39f8:      	cmp	x3, #0x2
    39fc:      	b.ge	0x3a20 <_stogir.checked.validate+0x29c>
    3a00:      	add	x4, x3, #0x1
    3a04:      	add	x3, x10, x3, lsl #2
    3a08:      	ldr	w3, [x3]
    3a0c:      	movn	w17, #0x0, lsl #16
    3a10:      	and	w5, w3, w17
    3a14:      	mov	x3, x4
    3a18:      	mov	w4, #0x1                ; =1
    3a1c:      	b	0x3a28 <_stogir.checked.validate+0x2a4>
    3a20:      	movz	w4, #0x0, lsl #16
    3a24:      	movz	w5, #0x0, lsl #16
    3a28:      	ubfx	x4, x4, #0, #32
    3a2c:      	lsr	x16, x4, #0
    3a30:      	cmp	x16, #0x1
    3a34:      	b.eq	0x3a50 <_stogir.checked.validate+0x2cc>
    3a38:      	b.lo	0x3a40 <_stogir.checked.validate+0x2bc>
    3a3c:      	b	0x3a54 <_stogir.checked.validate+0x2d0>
    3a40:      	cmp	x16, #0x0
    3a44:      	b.eq	0x3a4c <_stogir.checked.validate+0x2c8>
    3a48:      	b	0x3a54 <_stogir.checked.validate+0x2d0>
    3a4c:      	b	0x3ab4 <_stogir.checked.validate+0x330>
    3a50:      	b	0x3a58 <_stogir.checked.validate+0x2d4>
    3a54:      	b	0x3bc8 <_stogir.checked.validate+0x444>
    3a58:      	sxtw	x5, w5
    3a5c:      	cmp	x5, #0x0
    3a60:      	cset	w4, gt
    3a64:      	movz	x16, #0x0, lsl #48
    3a68:      	sub	x6, x16, x5
    3a6c:      	sub	x14, x6, #0x1
    3a70:      	uxtb	w16, w4
    3a74:      	cmp	w16, wzr
    3a78:      	b.eq	0x3b10 <_stogir.checked.validate+0x38c>
    3a7c:      	ldr	x6, [x0, #0x8]
    3a80:      	cmp	x5, x6
    3a84:      	b.ge	0x3b08 <_stogir.checked.validate+0x384>
    3a88:      	ldr	x6, [x11, #0x8]
    3a8c:      	cmp	x5, x6
    3a90:      	b.ge	0x3bb0 <_stogir.checked.validate+0x42c>
    3a94:      	ldr	x6, [x0, #0x78]
    3a98:      	add	x6, x6, x5, lsl #2
    3a9c:      	ldr	w6, [x6]
    3aa0:      	sxtw	x6, w6
    3aa4:      	cmp	x6, #0x0
    3aa8:      	cset	w6, ge
    3aac:      	ubfx	x6, x6, #0, #8
    3ab0:      	b	0x3bb4 <_stogir.checked.validate+0x430>
    3ab4:      	cmp	x9, #0x0
    3ab8:      	b.ne	0x39a8 <_stogir.checked.validate+0x224>
    3abc:      	and	x7, x1, #0xffffffff
    3ac0:      	movz	x0, #0x0, lsl #48
    3ac4:      	movz	x9, #0x0, lsl #48
    3ac8:      	b	0x39ac <_stogir.checked.validate+0x228>
    3acc:      	ldr	x4, [x0, #0x28]
    3ad0:      	add	x4, x4, x14, lsl #4
    3ad4:      	ldr	x4, [x4]
    3ad8:      	mov	w5, #0x1                ; =1
    3adc:      	b	0x39bc <_stogir.checked.validate+0x238>
    3ae0:      	movz	x6, #0x0, lsl #48
    3ae4:      	cmp	x6, #0x0
    3ae8:      	b.eq	0x39b4 <_stogir.checked.validate+0x230>
    3aec:      	uxtb	w16, w4
    3af0:      	cmp	w16, wzr
    3af4:      	b.eq	0x3acc <_stogir.checked.validate+0x348>
    3af8:      	ldr	x4, [x0]
    3afc:      	add	x4, x4, x5, lsl #4
    3b00:      	ldr	x4, [x4]
    3b04:      	b	0x3ad8 <_stogir.checked.validate+0x354>
    3b08:      	movz	x6, #0x0, lsl #48
    3b0c:      	b	0x3ae4 <_stogir.checked.validate+0x360>
    3b10:      	cmp	x5, #0x0
    3b14:      	b.ge	0x3ae0 <_stogir.checked.validate+0x35c>
    3b18:      	ldr	x15, [x12, #0x8]
    3b1c:      	ldr	x19, [x13, #0x8]
    3b20:      	cmp	x15, x19
    3b24:      	b.ne	0x3ba8 <_stogir.checked.validate+0x424>
    3b28:      	cmp	x6, x15
    3b2c:      	b.gt	0x3bc0 <_stogir.checked.validate+0x43c>
    3b30:      	ldr	x6, [x0, #0x50]
    3b34:      	add	x6, x6, x14, lsl #2
    3b38:      	ldr	w6, [x6]
    3b3c:      	sxtw	x6, w6
    3b40:      	cmp	x6, #0x0
    3b44:      	cset	w6, gt
    3b48:      	ubfx	x6, x6, #0, #8
    3b4c:      	b	0x3bc4 <_stogir.checked.validate+0x440>
    3b50:      	ubfx	x4, x4, #0, #32
    3b54:      	ubfx	x4, x4, #8, #8
    3b58:      	cmp	x4, x1
    3b5c:      	b.eq	0x3b6c <_stogir.checked.validate+0x3e8>
    3b60:      	adrp	x7, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003b60:  ARM64_RELOC_PAGE21	l_stogir.369
    3b64:      	ldr	x7, [x7]
		0000000000003b64:  ARM64_RELOC_PAGEOFF12	l_stogir.369
    3b68:      	mov	x9, #0x28               ; =40
    3b6c:      	b	0x39f8 <_stogir.checked.validate+0x274>
    3b70:      	adrp	x7, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003b70:  ARM64_RELOC_PAGE21	l_stogir.370
    3b74:      	ldr	x7, [x7]
		0000000000003b74:  ARM64_RELOC_PAGEOFF12	l_stogir.370
    3b78:      	mov	x9, #0x36               ; =54
    3b7c:      	orr	x10, x6, xzr
    3b80:      	add	x11, x0, #0x78
    3b84:      	add	x12, x0, #0x28
    3b88:      	add	x13, x0, #0x50
    3b8c:      	lsr	x4, x4, #32
    3b90:      	str	w4, [x5]
    3b94:      	str	w3, [x5, #0x4]
    3b98:      	ldr	x3, [x5]
    3b9c:      	str	x3, [x6]
    3ba0:      	movz	x3, #0x0, lsl #48
    3ba4:      	b	0x39f8 <_stogir.checked.validate+0x274>
    3ba8:      	movz	x6, #0x0, lsl #48
    3bac:      	b	0x3ae4 <_stogir.checked.validate+0x360>
    3bb0:      	movz	x6, #0x0, lsl #48
    3bb4:      	b	0x3b0c <_stogir.checked.validate+0x388>
    3bb8:      	brk	#0
    3bbc:      	b	0x3bb8 <_stogir.checked.validate+0x434>
    3bc0:      	movz	x6, #0x0, lsl #48
    3bc4:      	b	0x3bac <_stogir.checked.validate+0x428>
    3bc8:      	brk	#0
    3bcc:      	b	0x3bc8 <_stogir.checked.validate+0x444>
    3bd0:      	brk	#0
    3bd4:      	b	0x3bd0 <_stogir.checked.validate+0x44c>

0000000000003bd8 <_stogir.atomic.validate>:
    3bd8:      	sub	sp, sp, #0xf0
    3bdc:      	str	x29, [sp, #0x10]
    3be0:      	str	x30, [sp, #0x18]
    3be4:      	add	x29, sp, #0x10
    3be8:      	str	x19, [sp, #0xa0]
    3bec:      	str	x20, [sp, #0xa8]
    3bf0:      	str	x21, [sp, #0xb0]
    3bf4:      	str	x22, [sp, #0xb8]
    3bf8:      	str	x23, [sp, #0xc0]
    3bfc:      	str	x24, [sp, #0xc8]
    3c00:      	str	x25, [sp, #0xd0]
    3c04:      	str	x26, [sp, #0xd8]
    3c08:      	str	x27, [sp, #0xe0]
    3c0c:      	sxtw	x2, w1
    3c10:      	lsl	x3, x2, #2
    3c14:      	cmp	x2, #0x0
    3c18:      	cset	w4, gt
    3c1c:      	movz	x16, #0x0, lsl #48
    3c20:      	sub	x5, x16, x2
    3c24:      	sub	x6, x5, #0x1
    3c28:      	uxtb	w16, w4
    3c2c:      	cmp	w16, wzr
    3c30:      	b.eq	0x3c70 <_stogir.atomic.validate+0x98>
    3c34:      	ldr	x5, [x0, #0x8]
    3c38:      	cmp	x2, x5
    3c3c:      	b.ge	0x3cc0 <_stogir.atomic.validate+0xe8>
    3c40:      	add	x5, x0, #0x78
    3c44:      	ldr	x5, [x5, #0x8]
    3c48:      	cmp	x2, x5
    3c4c:      	b.ge	0x3df8 <_stogir.atomic.validate+0x220>
    3c50:      	ldr	x5, [x0, #0x78]
    3c54:      	add	x5, x3, x5
    3c58:      	ldr	w5, [x5]
    3c5c:      	sxtw	x5, w5
    3c60:      	cmp	x5, #0x0
    3c64:      	cset	w5, ge
    3c68:      	ubfx	x5, x5, #0, #8
    3c6c:      	b	0x3dfc <_stogir.atomic.validate+0x224>
    3c70:      	cmp	x2, #0x0
    3c74:      	b.ge	0x3cc8 <_stogir.atomic.validate+0xf0>
    3c78:      	add	x7, x0, #0x28
    3c7c:      	add	x9, x0, #0x50
    3c80:      	ldr	x7, [x7, #0x8]
    3c84:      	ldr	x9, [x9, #0x8]
    3c88:      	cmp	x7, x9
    3c8c:      	b.ne	0x3cb8 <_stogir.atomic.validate+0xe0>
    3c90:      	cmp	x5, x7
    3c94:      	b.gt	0x3e78 <_stogir.atomic.validate+0x2a0>
    3c98:      	ldr	x5, [x0, #0x50]
    3c9c:      	add	x5, x5, x6, lsl #2
    3ca0:      	ldr	w5, [x5]
    3ca4:      	sxtw	x5, w5
    3ca8:      	cmp	x5, #0x0
    3cac:      	cset	w5, gt
    3cb0:      	ubfx	x5, x5, #0, #8
    3cb4:      	b	0x3e7c <_stogir.atomic.validate+0x2a4>
    3cb8:      	movz	x5, #0x0, lsl #48
    3cbc:      	b	0x3ccc <_stogir.atomic.validate+0xf4>
    3cc0:      	movz	x5, #0x0, lsl #48
    3cc4:      	b	0x3ccc <_stogir.atomic.validate+0xf4>
    3cc8:      	movz	x5, #0x0, lsl #48
    3ccc:      	cmp	x5, #0x0
    3cd0:      	b.eq	0x3d0c <_stogir.atomic.validate+0x134>
    3cd4:      	uxtb	w16, w4
    3cd8:      	cmp	w16, wzr
    3cdc:      	b.eq	0x3cf4 <_stogir.atomic.validate+0x11c>
    3ce0:      	ldr	x4, [x0]
    3ce4:      	add	x4, x4, x2, lsl #4
    3ce8:      	ldr	x19, [x4]
    3cec:      	ldr	x4, [x4, #0x8]
    3cf0:      	b	0x3d04 <_stogir.atomic.validate+0x12c>
    3cf4:      	ldr	x4, [x0, #0x28]
    3cf8:      	add	x4, x4, x6, lsl #4
    3cfc:      	ldr	x19, [x4]
    3d00:      	ldr	x4, [x4, #0x8]
    3d04:      	mov	w5, #0x1                ; =1
    3d08:      	b	0x3d18 <_stogir.atomic.validate+0x140>
    3d0c:      	movz	w5, #0x0, lsl #16
    3d10:      	movz	x19, #0x0, lsl #48
    3d14:      	movz	x4, #0x0, lsl #48
    3d18:      	ubfx	x5, x5, #0, #32
    3d1c:      	lsr	x16, x5, #0
    3d20:      	cmp	x16, #0x1
    3d24:      	b.eq	0x3d40 <_stogir.atomic.validate+0x168>
    3d28:      	b.lo	0x3d30 <_stogir.atomic.validate+0x158>
    3d2c:      	b	0x3d44 <_stogir.atomic.validate+0x16c>
    3d30:      	cmp	x16, #0x0
    3d34:      	b.eq	0x3d3c <_stogir.atomic.validate+0x164>
    3d38:      	b	0x3d44 <_stogir.atomic.validate+0x16c>
    3d3c:      	b	0x3d48 <_stogir.atomic.validate+0x170>
    3d40:      	b	0x3d9c <_stogir.atomic.validate+0x1c4>
    3d44:      	b	0x4308 <_stogir.atomic.validate+0x730>
    3d48:      	mov	x23, x8
    3d4c:      	mov	x0, #0x1                ; =1
    3d50:      	adrp	x21, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003d50:  ARM64_RELOC_PAGE21	l_stogir.371
    3d54:      	ldr	x21, [x21]
		0000000000003d54:  ARM64_RELOC_PAGEOFF12	l_stogir.371
    3d58:      	mov	x22, #0x1a              ; =26
    3d5c:      	str	x0, [x23]
    3d60:      	str	x21, [x23, #0x8]
    3d64:      	str	x22, [x23, #0x10]
    3d68:      	ldr	x19, [sp, #0xa0]
    3d6c:      	ldr	x20, [sp, #0xa8]
    3d70:      	ldr	x21, [sp, #0xb0]
    3d74:      	ldr	x22, [sp, #0xb8]
    3d78:      	ldr	x23, [sp, #0xc0]
    3d7c:      	ldr	x24, [sp, #0xc8]
    3d80:      	ldr	x25, [sp, #0xd0]
    3d84:      	ldr	x26, [sp, #0xd8]
    3d88:      	ldr	x27, [sp, #0xe0]
    3d8c:      	ldr	x29, [sp, #0x10]
    3d90:      	ldr	x30, [sp, #0x18]
    3d94:      	add	sp, sp, #0xf0
    3d98:      	ret
    3d9c:      	uxtb	w5, w19
    3da0:      	add	x16, sp, #0x20
    3da4:      	str	x19, [x16]
    3da8:      	orr	x20, x5, xzr
    3dac:      	add	x16, sp, #0x20
    3db0:      	str	x4, [x16, #0x8]
    3db4:      	cmp	x2, #0x0
    3db8:      	b.le	0x3e08 <_stogir.atomic.validate+0x230>
    3dbc:      	cmp	x20, #0x7e
    3dc0:      	b.lt	0x3e08 <_stogir.atomic.validate+0x230>
    3dc4:      	cmp	x20, #0x82
    3dc8:      	b.gt	0x3e08 <_stogir.atomic.validate+0x230>
    3dcc:      	ldr	x2, [x0, #0x78]
    3dd0:      	add	x2, x3, x2
    3dd4:      	ldr	w2, [x2]
    3dd8:      	cmp	x20, #0x83
    3ddc:      	b.ge	0x4240 <_stogir.atomic.validate+0x668>
    3de0:      	adrp	x17, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003de0:  ARM64_RELOC_PAGE21	l_stogir.372
    3de4:      	ldr	x17, [x17]
		0000000000003de4:  ARM64_RELOC_PAGEOFF12	l_stogir.372
    3de8:      	add	x3, x20, x17
    3dec:      	ldrsb	w3, [x3]
    3df0:      	sxtb	w3, w3
    3df4:      	b	0x4244 <_stogir.atomic.validate+0x66c>
    3df8:      	movz	x5, #0x0, lsl #48
    3dfc:      	b	0x3cc4 <_stogir.atomic.validate+0xec>
    3e00:      	mov	x0, #0x1                ; =1
    3e04:      	b	0x3d5c <_stogir.atomic.validate+0x184>
    3e08:      	adrp	x21, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003e08:  ARM64_RELOC_PAGE21	l_stogir.373
    3e0c:      	ldr	x21, [x21]
		0000000000003e0c:  ARM64_RELOC_PAGEOFF12	l_stogir.373
    3e10:      	mov	x22, #0x20              ; =32
    3e14:      	add	x16, sp, #0x20
    3e18:      	ldr	w2, [x16, #0x4]
    3e1c:      	mov	x23, x8
    3e20:      	add	x8, sp, #0x30
    3e24:      	mov	x24, x0
    3e28:      	mov	w25, w1
    3e2c:      	mov	w1, w2
    3e30:      	bl	0x3e30 <_stogir.atomic.validate+0x258>
		0000000000003e30:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    3e34:      	add	x16, sp, #0x30
    3e38:      	ldr	w0, [x16]
    3e3c:      	lsr	x16, x0, #0
    3e40:      	cmp	x16, #0x1
    3e44:      	b.eq	0x3e60 <_stogir.atomic.validate+0x288>
    3e48:      	b.lo	0x3e50 <_stogir.atomic.validate+0x278>
    3e4c:      	b	0x3e64 <_stogir.atomic.validate+0x28c>
    3e50:      	cmp	x16, #0x0
    3e54:      	b.eq	0x3e5c <_stogir.atomic.validate+0x284>
    3e58:      	b	0x3e64 <_stogir.atomic.validate+0x28c>
    3e5c:      	b	0x3e68 <_stogir.atomic.validate+0x290>
    3e60:      	b	0x3f20 <_stogir.atomic.validate+0x348>
    3e64:      	b	0x4310 <_stogir.atomic.validate+0x738>
    3e68:      	adrp	x21, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003e68:  ARM64_RELOC_PAGE21	l_stogir.374
    3e6c:      	ldr	x21, [x21]
		0000000000003e6c:  ARM64_RELOC_PAGEOFF12	l_stogir.374
    3e70:      	mov	x22, #0x16              ; =22
    3e74:      	b	0x3e98 <_stogir.atomic.validate+0x2c0>
    3e78:      	movz	x5, #0x0, lsl #48
    3e7c:      	b	0x3cbc <_stogir.atomic.validate+0xe4>
    3e80:      	mov	x0, #0x1                ; =1
    3e84:      	cmp	x0, #0x0
    3e88:      	b.eq	0x3e98 <_stogir.atomic.validate+0x2c0>
    3e8c:      	adrp	x21, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003e8c:  ARM64_RELOC_PAGE21	l_stogir.375
    3e90:      	ldr	x21, [x21]
		0000000000003e90:  ARM64_RELOC_PAGEOFF12	l_stogir.375
    3e94:      	mov	x22, #0x16              ; =22
    3e98:      	cmp	x20, #0x82
    3e9c:      	cset	w26, eq
    3ea0:      	ubfx	x19, x19, #0, #32
    3ea4:      	ubfx	x0, x19, #8, #8
    3ea8:      	orr	x19, x0, xzr
    3eac:      	cmp	x19, #0x0
    3eb0:      	cset	w27, eq
    3eb4:      	uxtb	w16, w26
    3eb8:      	cmp	w16, wzr
    3ebc:      	b.eq	0x3ed8 <_stogir.atomic.validate+0x300>
    3ec0:      	uxtb	w16, w27
    3ec4:      	cmp	w16, wzr
    3ec8:      	b.ne	0x3ed8 <_stogir.atomic.validate+0x300>
    3ecc:      	adrp	x21, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003ecc:  ARM64_RELOC_PAGE21	l_stogir.376
    3ed0:      	ldr	x21, [x21]
		0000000000003ed0:  ARM64_RELOC_PAGEOFF12	l_stogir.376
    3ed4:      	mov	x22, #0x19              ; =25
    3ed8:      	uxtb	w16, w26
    3edc:      	cmp	w16, wzr
    3ee0:      	b.eq	0x3eec <_stogir.atomic.validate+0x314>
    3ee4:      	movz	x0, #0x0, lsl #48
    3ee8:      	b	0x3ef0 <_stogir.atomic.validate+0x318>
    3eec:      	mov	x0, #0x1                ; =1
    3ef0:      	cmp	x0, #0x0
    3ef4:      	b.eq	0x3f5c <_stogir.atomic.validate+0x384>
    3ef8:      	add	x16, sp, #0x20
    3efc:      	ldr	w0, [x16, #0x8]
    3f00:      	mov	w1, w0
    3f04:      	mov	x0, x24
    3f08:      	mov	x2, #0x6                ; =6
    3f0c:      	bl	0x3f0c <_stogir.atomic.validate+0x334>
		0000000000003f0c:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    3f10:      	cmp	x0, #0x0
    3f14:      	b.eq	0x4030 <_stogir.atomic.validate+0x458>
    3f18:      	movz	x0, #0x0, lsl #48
    3f1c:      	b	0x4034 <_stogir.atomic.validate+0x45c>
    3f20:      	add	x16, sp, #0x30
    3f24:      	ldr	x0, [x16, #0x8]
    3f28:      	add	x16, sp, #0x20
    3f2c:      	ldr	w1, [x16, #0x4]
    3f30:      	sxtw	x1, w1
    3f34:      	cmp	x1, #0x0
    3f38:      	b.gt	0x40c4 <_stogir.atomic.validate+0x4ec>
    3f3c:      	mov	x0, #0x1                ; =1
    3f40:      	b	0x3e84 <_stogir.atomic.validate+0x2ac>
    3f44:      	movz	x0, #0x0, lsl #48
    3f48:      	cmp	x0, #0x0
    3f4c:      	b.eq	0x3f5c <_stogir.atomic.validate+0x384>
    3f50:      	adrp	x21, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003f50:  ARM64_RELOC_PAGE21	l_stogir.377
    3f54:      	ldr	x21, [x21]
		0000000000003f54:  ARM64_RELOC_PAGEOFF12	l_stogir.377
    3f58:      	mov	x22, #0x22              ; =34
    3f5c:      	cmp	x20, #0x80
    3f60:      	cset	w27, eq
    3f64:      	uxtb	w16, w27
    3f68:      	cmp	w16, wzr
    3f6c:      	b.eq	0x3f78 <_stogir.atomic.validate+0x3a0>
    3f70:      	mov	x0, #0x1                ; =1
    3f74:      	b	0x3f84 <_stogir.atomic.validate+0x3ac>
    3f78:      	cmp	x20, #0x81
    3f7c:      	cset	w0, eq
    3f80:      	ubfx	x0, x0, #0, #8
    3f84:      	cmp	x0, #0x0
    3f88:      	b.eq	0x3ffc <_stogir.atomic.validate+0x424>
    3f8c:      	add	x16, sp, #0x90
    3f90:      	str	x16, [sp]
    3f94:      	mov	x0, x24
    3f98:      	mov	w1, w25
    3f9c:      	mov	x2, #0x4                ; =4
    3fa0:      	bl	0x3fa0 <_stogir.atomic.validate+0x3c8>
		0000000000003fa0:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    3fa4:      	ldr	x16, [sp]
    3fa8:      	str	x0, [x16]
    3fac:      	str	x1, [x16, #0x8]
    3fb0:      	add	x16, sp, #0x90
    3fb4:      	ldr	x0, [x16]
    3fb8:      	add	x16, sp, #0x90
    3fbc:      	ldr	x1, [x16, #0x8]
    3fc0:      	ubfx	x0, x0, #0, #32
    3fc4:      	lsr	x16, x0, #0
    3fc8:      	cmp	x16, #0x1
    3fcc:      	b.eq	0x3fe8 <_stogir.atomic.validate+0x410>
    3fd0:      	b.lo	0x3fd8 <_stogir.atomic.validate+0x400>
    3fd4:      	b	0x3fec <_stogir.atomic.validate+0x414>
    3fd8:      	cmp	x16, #0x0
    3fdc:      	b.eq	0x3fe4 <_stogir.atomic.validate+0x40c>
    3fe0:      	b	0x3fec <_stogir.atomic.validate+0x414>
    3fe4:      	b	0x3ff0 <_stogir.atomic.validate+0x418>
    3fe8:      	b	0x4194 <_stogir.atomic.validate+0x5bc>
    3fec:      	b	0x4320 <_stogir.atomic.validate+0x748>
    3ff0:      	adrp	x21, 0x3000 <_stogir.vector.validate+0x9a0>
		0000000000003ff0:  ARM64_RELOC_PAGE21	l_stogir.378
    3ff4:      	ldr	x21, [x21]
		0000000000003ff4:  ARM64_RELOC_PAGEOFF12	l_stogir.378
    3ff8:      	mov	x22, #0x1d              ; =29
    3ffc:      	cmp	x22, #0x0
    4000:      	b.ne	0x3e00 <_stogir.atomic.validate+0x228>
    4004:      	uxtb	w16, w26
    4008:      	cmp	w16, wzr
    400c:      	b.eq	0x4180 <_stogir.atomic.validate+0x5a8>
    4010:      	movz	x0, #0x0, lsl #48
    4014:      	b	0x4020 <_stogir.atomic.validate+0x448>
    4018:      	mov	w0, #0x1                ; =1
    401c:      	sxtw	x0, w0
    4020:      	and	x21, x0, #0xffffffff
    4024:      	movz	x0, #0x0, lsl #48
    4028:      	movz	x22, #0x0, lsl #48
    402c:      	b	0x3e04 <_stogir.atomic.validate+0x22c>
    4030:      	mov	x0, #0x1                ; =1
    4034:      	cmp	x0, #0x0
    4038:      	b.eq	0x4048 <_stogir.atomic.validate+0x470>
    403c:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x428>
		000000000000403c:  ARM64_RELOC_PAGE21	l_stogir.379
    4040:      	ldr	x21, [x21]
		0000000000004040:  ARM64_RELOC_PAGEOFF12	l_stogir.379
    4044:      	mov	x22, #0x1b              ; =27
    4048:      	cmp	x20, #0x7f
    404c:      	b.ne	0x4104 <_stogir.atomic.validate+0x52c>
    4050:      	uxtb	w16, w27
    4054:      	cmp	w16, wzr
    4058:      	b.ne	0x4068 <_stogir.atomic.validate+0x490>
    405c:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x428>
		000000000000405c:  ARM64_RELOC_PAGE21	l_stogir.380
    4060:      	ldr	x21, [x21]
		0000000000004060:  ARM64_RELOC_PAGEOFF12	l_stogir.380
    4064:      	mov	x22, #0x19              ; =25
    4068:      	add	x16, sp, #0x20
    406c:      	ldr	w0, [x16, #0xc]
    4070:      	add	x8, sp, #0x60
    4074:      	mov	w1, w0
    4078:      	mov	x0, x24
    407c:      	bl	0x407c <_stogir.atomic.validate+0x4a4>
		000000000000407c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4080:      	add	x16, sp, #0x60
    4084:      	ldr	w0, [x16]
    4088:      	lsr	x16, x0, #0
    408c:      	cmp	x16, #0x1
    4090:      	b.eq	0x40ac <_stogir.atomic.validate+0x4d4>
    4094:      	b.lo	0x409c <_stogir.atomic.validate+0x4c4>
    4098:      	b	0x40b0 <_stogir.atomic.validate+0x4d8>
    409c:      	cmp	x16, #0x0
    40a0:      	b.eq	0x40a8 <_stogir.atomic.validate+0x4d0>
    40a4:      	b	0x40b0 <_stogir.atomic.validate+0x4d8>
    40a8:      	b	0x40b4 <_stogir.atomic.validate+0x4dc>
    40ac:      	b	0x40f0 <_stogir.atomic.validate+0x518>
    40b0:      	b	0x4328 <_stogir.atomic.validate+0x750>
    40b4:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x428>
		00000000000040b4:  ARM64_RELOC_PAGE21	l_stogir.381
    40b8:      	ldr	x21, [x21]
		00000000000040b8:  ARM64_RELOC_PAGEOFF12	l_stogir.381
    40bc:      	mov	x22, #0x1a              ; =26
    40c0:      	b	0x4104 <_stogir.atomic.validate+0x52c>
    40c4:      	uxtb	w0, w0
    40c8:      	cmp	x0, #0x83
    40cc:      	cset	w1, lt
    40d0:      	uxtb	w16, w1
    40d4:      	cmp	w16, wzr
    40d8:      	b.eq	0x4204 <_stogir.atomic.validate+0x62c>
    40dc:      	adrp	x17, 0x4000 <_stogir.atomic.validate+0x428>
		00000000000040dc:  ARM64_RELOC_PAGE21	l_stogir.382
    40e0:      	ldr	x17, [x17]
		00000000000040e0:  ARM64_RELOC_PAGEOFF12	l_stogir.382
    40e4:      	add	x2, x0, x17
    40e8:      	ldrb	w2, [x2]
    40ec:      	b	0x4208 <_stogir.atomic.validate+0x630>
    40f0:      	add	x16, sp, #0x60
    40f4:      	ldr	x0, [x16, #0x8]
    40f8:      	ubfx	x0, x0, #0, #32
    40fc:      	ubfx	x0, x0, #8, #8
    4100:      	orr	x19, x0, xzr
    4104:      	cmp	x19, #0x2
    4108:      	b.ge	0x4150 <_stogir.atomic.validate+0x578>
    410c:      	mov	x0, #0x1                ; =1
    4110:      	b	0x415c <_stogir.atomic.validate+0x584>
    4114:      	mov	x0, #0x1                ; =1
    4118:      	b	0x3f48 <_stogir.atomic.validate+0x370>
    411c:      	mov	x0, #0x1                ; =1
    4120:      	cmp	x0, #0x0
    4124:      	b.eq	0x3f44 <_stogir.atomic.validate+0x36c>
    4128:      	orr	w0, w19, wzr
    412c:      	add	x16, sp, #0x20
    4130:      	ldr	w1, [x16, #0xc]
    4134:      	mov	w2, w0
    4138:      	mov	x0, x24
    413c:      	bl	0x413c <_stogir.atomic.validate+0x564>
		000000000000413c:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    4140:      	cmp	x0, #0x0
    4144:      	b.eq	0x4114 <_stogir.atomic.validate+0x53c>
    4148:      	movz	x0, #0x0, lsl #48
    414c:      	b	0x4118 <_stogir.atomic.validate+0x540>
    4150:      	cmp	x19, #0x5
    4154:      	cset	w0, gt
    4158:      	ubfx	x0, x0, #0, #8
    415c:      	cmp	x0, #0x0
    4160:      	b.eq	0x4170 <_stogir.atomic.validate+0x598>
    4164:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x428>
		0000000000004164:  ARM64_RELOC_PAGE21	l_stogir.383
    4168:      	ldr	x21, [x21]
		0000000000004168:  ARM64_RELOC_PAGEOFF12	l_stogir.383
    416c:      	mov	x22, #0x25              ; =37
    4170:      	cmp	x20, #0x7e
    4174:      	b.ne	0x411c <_stogir.atomic.validate+0x544>
    4178:      	movz	x0, #0x0, lsl #48
    417c:      	b	0x4120 <_stogir.atomic.validate+0x548>
    4180:      	sxtw	x19, w19
    4184:      	cmp	x19, #0x0
    4188:      	b.ne	0x4264 <_stogir.atomic.validate+0x68c>
    418c:      	movz	w0, #0x0, lsl #16
    4190:      	b	0x401c <_stogir.atomic.validate+0x444>
    4194:      	uxtb	w16, w27
    4198:      	cmp	w16, wzr
    419c:      	b.eq	0x41b4 <_stogir.atomic.validate+0x5dc>
    41a0:      	sxtw	x1, w1
    41a4:      	cmp	x1, #0x0
    41a8:      	b.ge	0x42e4 <_stogir.atomic.validate+0x70c>
    41ac:      	mov	x0, #0x1                ; =1
    41b0:      	b	0x42f0 <_stogir.atomic.validate+0x718>
    41b4:      	mov	x0, x24
    41b8:      	mov	w2, w19
    41bc:      	bl	0x41bc <_stogir.atomic.validate+0x5e4>
		00000000000041bc:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    41c0:      	cmp	x0, #0x0
    41c4:      	b.ne	0x41d4 <_stogir.atomic.validate+0x5fc>
    41c8:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x428>
		00000000000041c8:  ARM64_RELOC_PAGE21	l_stogir.384
    41cc:      	ldr	x21, [x21]
		00000000000041cc:  ARM64_RELOC_PAGEOFF12	l_stogir.384
    41d0:      	mov	x22, #0x24              ; =36
    41d4:      	b	0x3ffc <_stogir.atomic.validate+0x424>
    41d8:      	movz	w0, #0x0, lsl #16
    41dc:      	uxtb	w16, w0
    41e0:      	and	w0, w16, #0x4
    41e4:      	uxtb	w0, w0
    41e8:      	ubfx	x0, x0, #0, #8
    41ec:      	cmp	x0, #0x0
    41f0:      	cset	w0, eq
    41f4:      	uxtb	w16, w0
    41f8:      	cmp	w16, wzr
    41fc:      	cset	x0, eq
    4200:      	b	0x3e84 <_stogir.atomic.validate+0x2ac>
    4204:      	movz	w2, #0x0, lsl #16
    4208:      	uxtb	w16, w2
    420c:      	and	w2, w16, #0x1
    4210:      	uxtb	w2, w2
    4214:      	ubfx	x2, x2, #0, #8
    4218:      	cmp	x2, #0x0
    421c:      	b.eq	0x3e80 <_stogir.atomic.validate+0x2a8>
    4220:      	uxtb	w16, w1
    4224:      	cmp	w16, wzr
    4228:      	b.eq	0x41d8 <_stogir.atomic.validate+0x600>
    422c:      	adrp	x17, 0x4000 <_stogir.atomic.validate+0x428>
		000000000000422c:  ARM64_RELOC_PAGE21	l_stogir.382
    4230:      	ldr	x17, [x17]
		0000000000004230:  ARM64_RELOC_PAGEOFF12	l_stogir.382
    4234:      	add	x0, x0, x17
    4238:      	ldrb	w0, [x0]
    423c:      	b	0x41dc <_stogir.atomic.validate+0x604>
    4240:      	mov	w3, #-0x2               ; =-2
    4244:      	sxtw	x2, w2
    4248:      	sxtw	x3, w3
    424c:      	cmp	x2, x3
    4250:      	b.ne	0x3e08 <_stogir.atomic.validate+0x230>
    4254:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x428>
		0000000000004254:  ARM64_RELOC_PAGE21	l_stogir.385
    4258:      	ldr	x21, [x21]
		0000000000004258:  ARM64_RELOC_PAGEOFF12	l_stogir.385
    425c:      	movz	x22, #0x0, lsl #48
    4260:      	b	0x3e14 <_stogir.atomic.validate+0x23c>
    4264:      	cmp	x19, #0x1
    4268:      	b.eq	0x4018 <_stogir.atomic.validate+0x440>
    426c:      	cmp	x19, #0x2
    4270:      	b.eq	0x4018 <_stogir.atomic.validate+0x440>
    4274:      	cmp	x19, #0x7
    4278:      	b.eq	0x4018 <_stogir.atomic.validate+0x440>
    427c:      	cmp	x19, #0x8
    4280:      	b.eq	0x4018 <_stogir.atomic.validate+0x440>
    4284:      	cmp	x19, #0x3
    4288:      	b.eq	0x4318 <_stogir.atomic.validate+0x740>
    428c:      	cmp	x19, #0x9
    4290:      	b.eq	0x4318 <_stogir.atomic.validate+0x740>
    4294:      	cmp	x19, #0x4
    4298:      	b.eq	0x4330 <_stogir.atomic.validate+0x758>
    429c:      	cmp	x19, #0xa
    42a0:      	b.eq	0x4330 <_stogir.atomic.validate+0x758>
    42a4:      	cmp	x19, #0xd
    42a8:      	b.eq	0x4330 <_stogir.atomic.validate+0x758>
    42ac:      	cmp	x19, #0x5
    42b0:      	b.eq	0x4338 <_stogir.atomic.validate+0x760>
    42b4:      	cmp	x19, #0xb
    42b8:      	b.eq	0x4338 <_stogir.atomic.validate+0x760>
    42bc:      	cmp	x19, #0xc
    42c0:      	b.eq	0x4338 <_stogir.atomic.validate+0x760>
    42c4:      	cmp	x19, #0x6
    42c8:      	cset	w0, eq
    42cc:      	uxtb	w16, w0
    42d0:      	cmp	w16, wzr
    42d4:      	mov	w16, #0x8               ; =8
    42d8:      	movn	w17, #0x0, lsl #16
    42dc:      	csel	w0, w16, w17, ne
    42e0:      	b	0x433c <_stogir.atomic.validate+0x764>
    42e4:      	cmp	x1, #0x9
    42e8:      	cset	w0, gt
    42ec:      	ubfx	x0, x0, #0, #8
    42f0:      	cmp	x0, #0x0
    42f4:      	b.eq	0x4304 <_stogir.atomic.validate+0x72c>
    42f8:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x428>
		00000000000042f8:  ARM64_RELOC_PAGE21	l_stogir.386
    42fc:      	ldr	x21, [x21]
		00000000000042fc:  ARM64_RELOC_PAGEOFF12	l_stogir.386
    4300:      	mov	x22, #0x1c              ; =28
    4304:      	b	0x41d4 <_stogir.atomic.validate+0x5fc>
    4308:      	brk	#0
    430c:      	b	0x4308 <_stogir.atomic.validate+0x730>
    4310:      	brk	#0
    4314:      	b	0x4310 <_stogir.atomic.validate+0x738>
    4318:      	mov	w0, #0x2                ; =2
    431c:      	b	0x401c <_stogir.atomic.validate+0x444>
    4320:      	brk	#0
    4324:      	b	0x4320 <_stogir.atomic.validate+0x748>
    4328:      	brk	#0
    432c:      	b	0x4328 <_stogir.atomic.validate+0x750>
    4330:      	mov	w0, #0x4                ; =4
    4334:      	b	0x431c <_stogir.atomic.validate+0x744>
    4338:      	mov	w0, #0x8                ; =8
    433c:      	b	0x4334 <_stogir.atomic.validate+0x75c>

0000000000004340 <_stogir.terminal.validate>:
    4340:      	sub	sp, sp, #0x50
    4344:      	str	x29, [sp]
    4348:      	str	x30, [sp, #0x8]
    434c:      	mov	x29, sp
    4350:      	str	x19, [sp, #0x40]
    4354:      	sxtw	x1, w1
    4358:      	lsl	x2, x1, #2
    435c:      	cmp	x1, #0x0
    4360:      	cset	w3, gt
    4364:      	movz	x16, #0x0, lsl #48
    4368:      	sub	x4, x16, x1
    436c:      	sub	x5, x4, #0x1
    4370:      	uxtb	w16, w3
    4374:      	cmp	w16, wzr
    4378:      	b.eq	0x43b8 <_stogir.terminal.validate+0x78>
    437c:      	ldr	x4, [x0, #0x8]
    4380:      	cmp	x1, x4
    4384:      	b.ge	0x4408 <_stogir.terminal.validate+0xc8>
    4388:      	add	x4, x0, #0x78
    438c:      	ldr	x4, [x4, #0x8]
    4390:      	cmp	x1, x4
    4394:      	b.ge	0x44f4 <_stogir.terminal.validate+0x1b4>
    4398:      	ldr	x4, [x0, #0x78]
    439c:      	add	x4, x2, x4
    43a0:      	ldr	w4, [x4]
    43a4:      	sxtw	x4, w4
    43a8:      	cmp	x4, #0x0
    43ac:      	cset	w4, ge
    43b0:      	ubfx	x4, x4, #0, #8
    43b4:      	b	0x44f8 <_stogir.terminal.validate+0x1b8>
    43b8:      	cmp	x1, #0x0
    43bc:      	b.ge	0x4410 <_stogir.terminal.validate+0xd0>
    43c0:      	add	x6, x0, #0x28
    43c4:      	add	x7, x0, #0x50
    43c8:      	ldr	x6, [x6, #0x8]
    43cc:      	ldr	x7, [x7, #0x8]
    43d0:      	cmp	x6, x7
    43d4:      	b.ne	0x4400 <_stogir.terminal.validate+0xc0>
    43d8:      	cmp	x4, x6
    43dc:      	b.gt	0x4534 <_stogir.terminal.validate+0x1f4>
    43e0:      	ldr	x4, [x0, #0x50]
    43e4:      	add	x4, x4, x5, lsl #2
    43e8:      	ldr	w4, [x4]
    43ec:      	sxtw	x4, w4
    43f0:      	cmp	x4, #0x0
    43f4:      	cset	w4, gt
    43f8:      	ubfx	x4, x4, #0, #8
    43fc:      	b	0x4538 <_stogir.terminal.validate+0x1f8>
    4400:      	movz	x4, #0x0, lsl #48
    4404:      	b	0x4414 <_stogir.terminal.validate+0xd4>
    4408:      	movz	x4, #0x0, lsl #48
    440c:      	b	0x4414 <_stogir.terminal.validate+0xd4>
    4410:      	movz	x4, #0x0, lsl #48
    4414:      	cmp	x4, #0x0
    4418:      	b.eq	0x4454 <_stogir.terminal.validate+0x114>
    441c:      	uxtb	w16, w3
    4420:      	cmp	w16, wzr
    4424:      	b.eq	0x443c <_stogir.terminal.validate+0xfc>
    4428:      	ldr	x3, [x0]
    442c:      	add	x3, x3, x1, lsl #4
    4430:      	ldr	x4, [x3]
    4434:      	ldr	x3, [x3, #0x8]
    4438:      	b	0x444c <_stogir.terminal.validate+0x10c>
    443c:      	ldr	x3, [x0, #0x28]
    4440:      	add	x3, x3, x5, lsl #4
    4444:      	ldr	x4, [x3]
    4448:      	ldr	x3, [x3, #0x8]
    444c:      	mov	w5, #0x1                ; =1
    4450:      	b	0x4460 <_stogir.terminal.validate+0x120>
    4454:      	movz	w5, #0x0, lsl #16
    4458:      	movz	x4, #0x0, lsl #48
    445c:      	movz	x3, #0x0, lsl #48
    4460:      	ubfx	x5, x5, #0, #32
    4464:      	lsr	x16, x5, #0
    4468:      	cmp	x16, #0x1
    446c:      	b.eq	0x4488 <_stogir.terminal.validate+0x148>
    4470:      	b.lo	0x4478 <_stogir.terminal.validate+0x138>
    4474:      	b	0x448c <_stogir.terminal.validate+0x14c>
    4478:      	cmp	x16, #0x0
    447c:      	b.eq	0x4484 <_stogir.terminal.validate+0x144>
    4480:      	b	0x448c <_stogir.terminal.validate+0x14c>
    4484:      	b	0x4490 <_stogir.terminal.validate+0x150>
    4488:      	b	0x44a8 <_stogir.terminal.validate+0x168>
    448c:      	b	0x45fc <_stogir.terminal.validate+0x2bc>
    4490:      	mov	x19, x8
    4494:      	mov	x0, #0x1                ; =1
    4498:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x428>
		0000000000004498:  ARM64_RELOC_PAGE21	l_stogir.387
    449c:      	ldr	x1, [x1]
		000000000000449c:  ARM64_RELOC_PAGEOFF12	l_stogir.387
    44a0:      	mov	x2, #0x21               ; =33
    44a4:      	b	0x44d4 <_stogir.terminal.validate+0x194>
    44a8:      	add	x16, sp, #0x10
    44ac:      	str	x4, [x16]
    44b0:      	add	x16, sp, #0x10
    44b4:      	str	x3, [x16, #0x8]
    44b8:      	cmp	x1, #0x0
    44bc:      	b.gt	0x44fc <_stogir.terminal.validate+0x1bc>
    44c0:      	mov	x19, x8
    44c4:      	mov	x0, #0x1                ; =1
    44c8:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x428>
		00000000000044c8:  ARM64_RELOC_PAGE21	l_stogir.388
    44cc:      	ldr	x1, [x1]
		00000000000044cc:  ARM64_RELOC_PAGEOFF12	l_stogir.388
    44d0:      	mov	x2, #0x1b               ; =27
    44d4:      	str	x0, [x19]
    44d8:      	str	x1, [x19, #0x8]
    44dc:      	str	x2, [x19, #0x10]
    44e0:      	ldr	x19, [sp, #0x40]
    44e4:      	ldr	x29, [sp]
    44e8:      	ldr	x30, [sp, #0x8]
    44ec:      	add	sp, sp, #0x50
    44f0:      	ret
    44f4:      	movz	x4, #0x0, lsl #48
    44f8:      	b	0x440c <_stogir.terminal.validate+0xcc>
    44fc:      	uxtb	w4, w4
    4500:      	orr	x1, x4, xzr
    4504:      	cmp	x1, #0x60
    4508:      	cset	w3, eq
    450c:      	cmp	x1, #0x79
    4510:      	cset	w1, eq
    4514:      	uxtb	w16, w3
    4518:      	cmp	w16, wzr
    451c:      	b.ne	0x453c <_stogir.terminal.validate+0x1fc>
    4520:      	uxtb	w16, w1
    4524:      	cmp	w16, wzr
    4528:      	b.ne	0x453c <_stogir.terminal.validate+0x1fc>
    452c:      	mov	x19, x8
    4530:      	b	0x44c4 <_stogir.terminal.validate+0x184>
    4534:      	movz	x4, #0x0, lsl #48
    4538:      	b	0x4404 <_stogir.terminal.validate+0xc4>
    453c:      	add	x16, sp, #0x10
    4540:      	ldr	w5, [x16]
    4544:      	ubfx	x5, x5, #8, #8
    4548:      	cmp	x5, #0x0
    454c:      	b.ne	0x4604 <_stogir.terminal.validate+0x2c4>
    4550:      	uxtb	w16, w3
    4554:      	cmp	w16, wzr
    4558:      	mov	w16, #0x1               ; =1
    455c:      	mov	w17, #0x3               ; =3
    4560:      	csel	w3, w16, w17, ne
    4564:      	sxtw	x3, w3
    4568:      	ldr	x5, [x0, #0x78]
    456c:      	add	x2, x2, x5
    4570:      	ldr	w2, [x2]
    4574:      	sxtw	x2, w2
    4578:      	cmp	x2, x3
    457c:      	b.ne	0x460c <_stogir.terminal.validate+0x2cc>
    4580:      	uxtb	w16, w1
    4584:      	cmp	w16, wzr
    4588:      	b.eq	0x45dc <_stogir.terminal.validate+0x29c>
    458c:      	add	x16, sp, #0x10
    4590:      	ldr	w2, [x16, #0x8]
    4594:      	sxtw	x2, w2
    4598:      	cmp	x2, #0x0
    459c:      	b.eq	0x45dc <_stogir.terminal.validate+0x29c>
    45a0:      	mov	x19, x8
    45a4:      	b	0x44c4 <_stogir.terminal.validate+0x184>
    45a8:      	movz	w1, #0x0, lsl #16
    45ac:      	mov	w3, w1
    45b0:      	mov	w1, w4
    45b4:      	mov	x19, x8
    45b8:      	add	x8, sp, #0x20
    45bc:      	bl	0x45bc <_stogir.terminal.validate+0x27c>
		00000000000045bc:  ARM64_RELOC_BRANCH26	_stogir.terminal.inputs
    45c0:      	add	x16, sp, #0x20
    45c4:      	ldr	x0, [x16]
    45c8:      	add	x16, sp, #0x20
    45cc:      	ldr	x1, [x16, #0x8]
    45d0:      	add	x16, sp, #0x20
    45d4:      	ldr	x2, [x16, #0x10]
    45d8:      	b	0x44d4 <_stogir.terminal.validate+0x194>
    45dc:      	add	x16, sp, #0x10
    45e0:      	ldr	w2, [x16, #0x4]
    45e4:      	uxtb	w16, w1
    45e8:      	cmp	w16, wzr
    45ec:      	b.eq	0x45a8 <_stogir.terminal.validate+0x268>
    45f0:      	add	x16, sp, #0x10
    45f4:      	ldr	w1, [x16, #0xc]
    45f8:      	b	0x45ac <_stogir.terminal.validate+0x26c>
    45fc:      	brk	#0
    4600:      	b	0x45fc <_stogir.terminal.validate+0x2bc>
    4604:      	mov	x19, x8
    4608:      	b	0x44c4 <_stogir.terminal.validate+0x184>
    460c:      	mov	x19, x8
    4610:      	b	0x44c4 <_stogir.terminal.validate+0x184>

0000000000004614 <_stogir.switch.validate>:
    4614:      	sub	sp, sp, #0x70
    4618:      	str	x29, [sp]
    461c:      	str	x30, [sp, #0x8]
    4620:      	mov	x29, sp
    4624:      	str	x19, [sp, #0x60]
    4628:      	sxtw	x1, w1
    462c:      	lsl	x2, x1, #2
    4630:      	cmp	x1, #0x0
    4634:      	cset	w3, gt
    4638:      	movz	x16, #0x0, lsl #48
    463c:      	sub	x4, x16, x1
    4640:      	sub	x5, x4, #0x1
    4644:      	uxtb	w16, w3
    4648:      	cmp	w16, wzr
    464c:      	b.eq	0x468c <_stogir.switch.validate+0x78>
    4650:      	ldr	x4, [x0, #0x8]
    4654:      	cmp	x1, x4
    4658:      	b.ge	0x46dc <_stogir.switch.validate+0xc8>
    465c:      	add	x4, x0, #0x78
    4660:      	ldr	x4, [x4, #0x8]
    4664:      	cmp	x1, x4
    4668:      	b.ge	0x47c8 <_stogir.switch.validate+0x1b4>
    466c:      	ldr	x4, [x0, #0x78]
    4670:      	add	x4, x2, x4
    4674:      	ldr	w4, [x4]
    4678:      	sxtw	x4, w4
    467c:      	cmp	x4, #0x0
    4680:      	cset	w4, ge
    4684:      	ubfx	x4, x4, #0, #8
    4688:      	b	0x47cc <_stogir.switch.validate+0x1b8>
    468c:      	cmp	x1, #0x0
    4690:      	b.ge	0x46e4 <_stogir.switch.validate+0xd0>
    4694:      	add	x6, x0, #0x28
    4698:      	add	x7, x0, #0x50
    469c:      	ldr	x6, [x6, #0x8]
    46a0:      	ldr	x7, [x7, #0x8]
    46a4:      	cmp	x6, x7
    46a8:      	b.ne	0x46d4 <_stogir.switch.validate+0xc0>
    46ac:      	cmp	x4, x6
    46b0:      	b.gt	0x4804 <_stogir.switch.validate+0x1f0>
    46b4:      	ldr	x4, [x0, #0x50]
    46b8:      	add	x4, x4, x5, lsl #2
    46bc:      	ldr	w4, [x4]
    46c0:      	sxtw	x4, w4
    46c4:      	cmp	x4, #0x0
    46c8:      	cset	w4, gt
    46cc:      	ubfx	x4, x4, #0, #8
    46d0:      	b	0x4808 <_stogir.switch.validate+0x1f4>
    46d4:      	movz	x4, #0x0, lsl #48
    46d8:      	b	0x46e8 <_stogir.switch.validate+0xd4>
    46dc:      	movz	x4, #0x0, lsl #48
    46e0:      	b	0x46e8 <_stogir.switch.validate+0xd4>
    46e4:      	movz	x4, #0x0, lsl #48
    46e8:      	cmp	x4, #0x0
    46ec:      	b.eq	0x4728 <_stogir.switch.validate+0x114>
    46f0:      	uxtb	w16, w3
    46f4:      	cmp	w16, wzr
    46f8:      	b.eq	0x4710 <_stogir.switch.validate+0xfc>
    46fc:      	ldr	x3, [x0]
    4700:      	add	x3, x3, x1, lsl #4
    4704:      	ldr	x4, [x3]
    4708:      	ldr	x3, [x3, #0x8]
    470c:      	b	0x4720 <_stogir.switch.validate+0x10c>
    4710:      	ldr	x3, [x0, #0x28]
    4714:      	add	x3, x3, x5, lsl #4
    4718:      	ldr	x4, [x3]
    471c:      	ldr	x3, [x3, #0x8]
    4720:      	mov	w5, #0x1                ; =1
    4724:      	b	0x4734 <_stogir.switch.validate+0x120>
    4728:      	movz	w5, #0x0, lsl #16
    472c:      	movz	x4, #0x0, lsl #48
    4730:      	movz	x3, #0x0, lsl #48
    4734:      	ubfx	x5, x5, #0, #32
    4738:      	lsr	x16, x5, #0
    473c:      	cmp	x16, #0x1
    4740:      	b.eq	0x475c <_stogir.switch.validate+0x148>
    4744:      	b.lo	0x474c <_stogir.switch.validate+0x138>
    4748:      	b	0x4760 <_stogir.switch.validate+0x14c>
    474c:      	cmp	x16, #0x0
    4750:      	b.eq	0x4758 <_stogir.switch.validate+0x144>
    4754:      	b	0x4760 <_stogir.switch.validate+0x14c>
    4758:      	b	0x4764 <_stogir.switch.validate+0x150>
    475c:      	b	0x477c <_stogir.switch.validate+0x168>
    4760:      	b	0x48ec <_stogir.switch.validate+0x2d8>
    4764:      	mov	x19, x8
    4768:      	mov	x0, #0x1                ; =1
    476c:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x428>
		000000000000476c:  ARM64_RELOC_PAGE21	l_stogir.389
    4770:      	ldr	x1, [x1]
		0000000000004770:  ARM64_RELOC_PAGEOFF12	l_stogir.389
    4774:      	mov	x2, #0x1a               ; =26
    4778:      	b	0x47a8 <_stogir.switch.validate+0x194>
    477c:      	add	x16, sp, #0x10
    4780:      	str	x4, [x16]
    4784:      	add	x16, sp, #0x10
    4788:      	str	x3, [x16, #0x8]
    478c:      	cmp	x1, #0x0
    4790:      	b.gt	0x47d0 <_stogir.switch.validate+0x1bc>
    4794:      	mov	x19, x8
    4798:      	mov	x0, #0x1                ; =1
    479c:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x428>
		000000000000479c:  ARM64_RELOC_PAGE21	l_stogir.390
    47a0:      	ldr	x1, [x1]
		00000000000047a0:  ARM64_RELOC_PAGEOFF12	l_stogir.390
    47a4:      	mov	x2, #0x20               ; =32
    47a8:      	str	x0, [x19]
    47ac:      	str	x1, [x19, #0x8]
    47b0:      	str	x2, [x19, #0x10]
    47b4:      	ldr	x19, [sp, #0x60]
    47b8:      	ldr	x29, [sp]
    47bc:      	ldr	x30, [sp, #0x8]
    47c0:      	add	sp, sp, #0x70
    47c4:      	ret
    47c8:      	movz	x4, #0x0, lsl #48
    47cc:      	b	0x46e0 <_stogir.switch.validate+0xcc>
    47d0:      	uxtb	w4, w4
    47d4:      	orr	x1, x4, xzr
    47d8:      	cmp	x1, #0x75
    47dc:      	cset	w3, eq
    47e0:      	uxtb	w16, w3
    47e4:      	cmp	w16, wzr
    47e8:      	b.ne	0x480c <_stogir.switch.validate+0x1f8>
    47ec:      	cmp	x1, #0x6d
    47f0:      	b.lt	0x48f4 <_stogir.switch.validate+0x2e0>
    47f4:      	cmp	x1, #0x6f
    47f8:      	b.le	0x480c <_stogir.switch.validate+0x1f8>
    47fc:      	mov	x19, x8
    4800:      	b	0x4798 <_stogir.switch.validate+0x184>
    4804:      	movz	x4, #0x0, lsl #48
    4808:      	b	0x46d8 <_stogir.switch.validate+0xc4>
    480c:      	add	x16, sp, #0x10
    4810:      	ldr	w5, [x16]
    4814:      	ubfx	x5, x5, #8, #8
    4818:      	cmp	x5, #0x0
    481c:      	b.ne	0x48fc <_stogir.switch.validate+0x2e8>
    4820:      	ldr	x5, [x0, #0x78]
    4824:      	add	x2, x2, x5
    4828:      	ldr	w2, [x2]
    482c:      	cmp	x1, #0x6d
    4830:      	b.eq	0x4894 <_stogir.switch.validate+0x280>
    4834:      	cmp	x1, #0x6e
    4838:      	b.eq	0x4894 <_stogir.switch.validate+0x280>
    483c:      	mov	w1, #0x2                ; =2
    4840:      	b	0x4898 <_stogir.switch.validate+0x284>
    4844:      	add	x16, sp, #0x10
    4848:      	ldr	w1, [x16, #0x4]
    484c:      	add	x16, sp, #0x10
    4850:      	ldr	w2, [x16, #0x8]
    4854:      	add	x16, sp, #0x10
    4858:      	ldr	w3, [x16, #0xc]
    485c:      	add	x8, sp, #0x40
    4860:      	fmov	s31, w1
    4864:      	mov	w1, w4
    4868:      	mov	w4, w3
    486c:      	mov	w3, w2
    4870:      	fmov	w2, s31
    4874:      	bl	0x4874 <_stogir.switch.validate+0x260>
		0000000000004874:  ARM64_RELOC_BRANCH26	_stogir.switch.case-inputs
    4878:      	add	x16, sp, #0x40
    487c:      	ldr	x0, [x16]
    4880:      	add	x16, sp, #0x40
    4884:      	ldr	x1, [x16, #0x8]
    4888:      	add	x16, sp, #0x40
    488c:      	ldr	x2, [x16, #0x10]
    4890:      	b	0x47a8 <_stogir.switch.validate+0x194>
    4894:      	mov	w1, #0x3                ; =3
    4898:      	sxtw	x2, w2
    489c:      	sxtw	x1, w1
    48a0:      	cmp	x2, x1
    48a4:      	b.ne	0x4904 <_stogir.switch.validate+0x2f0>
    48a8:      	uxtb	w16, w3
    48ac:      	cmp	w16, wzr
    48b0:      	b.eq	0x490c <_stogir.switch.validate+0x2f8>
    48b4:      	add	x16, sp, #0x10
    48b8:      	ldr	w1, [x16, #0x4]
    48bc:      	add	x16, sp, #0x10
    48c0:      	ldr	w2, [x16, #0x8]
    48c4:      	mov	x19, x8
    48c8:      	add	x8, sp, #0x20
    48cc:      	bl	0x48cc <_stogir.switch.validate+0x2b8>
		00000000000048cc:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    48d0:      	add	x16, sp, #0x20
    48d4:      	ldr	x0, [x16]
    48d8:      	add	x16, sp, #0x20
    48dc:      	ldr	x1, [x16, #0x8]
    48e0:      	add	x16, sp, #0x20
    48e4:      	ldr	x2, [x16, #0x10]
    48e8:      	b	0x4890 <_stogir.switch.validate+0x27c>
    48ec:      	brk	#0
    48f0:      	b	0x48ec <_stogir.switch.validate+0x2d8>
    48f4:      	mov	x19, x8
    48f8:      	b	0x4798 <_stogir.switch.validate+0x184>
    48fc:      	mov	x19, x8
    4900:      	b	0x4798 <_stogir.switch.validate+0x184>
    4904:      	mov	x19, x8
    4908:      	b	0x4798 <_stogir.switch.validate+0x184>
    490c:      	mov	x19, x8
    4910:      	b	0x4844 <_stogir.switch.validate+0x230>

0000000000004914 <_stogir.stack.validate>:
    4914:      	sub	sp, sp, #0x90
    4918:      	str	x29, [sp]
    491c:      	str	x30, [sp, #0x8]
    4920:      	mov	x29, sp
    4924:      	str	x19, [sp, #0x60]
    4928:      	str	x20, [sp, #0x68]
    492c:      	str	x21, [sp, #0x70]
    4930:      	str	x22, [sp, #0x78]
    4934:      	str	x23, [sp, #0x80]
    4938:      	sxtw	x1, w1
    493c:      	lsl	x2, x1, #2
    4940:      	cmp	x1, #0x0
    4944:      	cset	w3, gt
    4948:      	movz	x16, #0x0, lsl #48
    494c:      	sub	x4, x16, x1
    4950:      	cmp	x1, #0x0
    4954:      	cset	w5, lt
    4958:      	sub	x6, x4, #0x1
    495c:      	lsl	x7, x6, #2
    4960:      	uxtb	w16, w3
    4964:      	cmp	w16, wzr
    4968:      	b.eq	0x49a8 <_stogir.stack.validate+0x94>
    496c:      	ldr	x9, [x0, #0x8]
    4970:      	cmp	x1, x9
    4974:      	b.ge	0x4a20 <_stogir.stack.validate+0x10c>
    4978:      	add	x9, x0, #0x78
    497c:      	ldr	x9, [x9, #0x8]
    4980:      	cmp	x1, x9
    4984:      	b.ge	0x4b64 <_stogir.stack.validate+0x250>
    4988:      	ldr	x9, [x0, #0x78]
    498c:      	add	x9, x2, x9
    4990:      	ldr	w9, [x9]
    4994:      	sxtw	x9, w9
    4998:      	cmp	x9, #0x0
    499c:      	cset	w9, ge
    49a0:      	ubfx	x9, x9, #0, #8
    49a4:      	b	0x4b68 <_stogir.stack.validate+0x254>
    49a8:      	uxtb	w16, w5
    49ac:      	cmp	w16, wzr
    49b0:      	b.eq	0x4a28 <_stogir.stack.validate+0x114>
    49b4:      	add	x9, x0, #0x28
    49b8:      	add	x10, x0, #0x50
    49bc:      	ldr	x9, [x9, #0x8]
    49c0:      	ldr	x10, [x10, #0x8]
    49c4:      	cmp	x9, x10
    49c8:      	b.ne	0x49f4 <_stogir.stack.validate+0xe0>
    49cc:      	cmp	x4, x9
    49d0:      	b.gt	0x4b6c <_stogir.stack.validate+0x258>
    49d4:      	ldr	x9, [x0, #0x50]
    49d8:      	add	x9, x7, x9
    49dc:      	ldr	w9, [x9]
    49e0:      	sxtw	x9, w9
    49e4:      	cmp	x9, #0x0
    49e8:      	cset	w9, gt
    49ec:      	ubfx	x9, x9, #0, #8
    49f0:      	b	0x4b70 <_stogir.stack.validate+0x25c>
    49f4:      	movz	x9, #0x0, lsl #48
    49f8:      	b	0x4a2c <_stogir.stack.validate+0x118>
    49fc:      	uxtb	w16, w12
    4a00:      	cmp	w16, wzr
    4a04:      	b.eq	0x4b8c <_stogir.stack.validate+0x278>
    4a08:      	mov	x22, x8
    4a0c:      	mov	x0, #0x1                ; =1
    4a10:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x428>
		0000000000004a10:  ARM64_RELOC_PAGE21	l_stogir.391
    4a14:      	ldr	x1, [x1]
		0000000000004a14:  ARM64_RELOC_PAGEOFF12	l_stogir.391
    4a18:      	mov	x2, #0x19               ; =25
    4a1c:      	b	0x4ac4 <_stogir.stack.validate+0x1b0>
    4a20:      	movz	x9, #0x0, lsl #48
    4a24:      	b	0x4a2c <_stogir.stack.validate+0x118>
    4a28:      	movz	x9, #0x0, lsl #48
    4a2c:      	lsl	x10, x1, #4
    4a30:      	lsl	x6, x6, #4
    4a34:      	cmp	x9, #0x0
    4a38:      	b.eq	0x4a74 <_stogir.stack.validate+0x160>
    4a3c:      	uxtb	w16, w3
    4a40:      	cmp	w16, wzr
    4a44:      	b.eq	0x4a5c <_stogir.stack.validate+0x148>
    4a48:      	ldr	x9, [x0]
    4a4c:      	add	x9, x10, x9
    4a50:      	ldr	x11, [x9]
    4a54:      	ldr	x9, [x9, #0x8]
    4a58:      	b	0x4a6c <_stogir.stack.validate+0x158>
    4a5c:      	ldr	x9, [x0, #0x28]
    4a60:      	add	x9, x6, x9
    4a64:      	ldr	x11, [x9]
    4a68:      	ldr	x9, [x9, #0x8]
    4a6c:      	mov	w12, #0x1               ; =1
    4a70:      	b	0x4a80 <_stogir.stack.validate+0x16c>
    4a74:      	movz	w12, #0x0, lsl #16
    4a78:      	movz	x11, #0x0, lsl #48
    4a7c:      	movz	x9, #0x0, lsl #48
    4a80:      	ubfx	x12, x12, #0, #32
    4a84:      	lsr	x16, x12, #0
    4a88:      	cmp	x16, #0x1
    4a8c:      	b.eq	0x4aa8 <_stogir.stack.validate+0x194>
    4a90:      	b.lo	0x4a98 <_stogir.stack.validate+0x184>
    4a94:      	b	0x4aac <_stogir.stack.validate+0x198>
    4a98:      	cmp	x16, #0x0
    4a9c:      	b.eq	0x4aa4 <_stogir.stack.validate+0x190>
    4aa0:      	b	0x4aac <_stogir.stack.validate+0x198>
    4aa4:      	b	0x4ab0 <_stogir.stack.validate+0x19c>
    4aa8:      	b	0x4af4 <_stogir.stack.validate+0x1e0>
    4aac:      	b	0x4eac <_stogir.stack.validate+0x598>
    4ab0:      	mov	x22, x8
    4ab4:      	mov	x0, #0x1                ; =1
    4ab8:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x428>
		0000000000004ab8:  ARM64_RELOC_PAGE21	l_stogir.392
    4abc:      	ldr	x1, [x1]
		0000000000004abc:  ARM64_RELOC_PAGEOFF12	l_stogir.392
    4ac0:      	mov	x2, #0x19               ; =25
    4ac4:      	str	x0, [x22]
    4ac8:      	str	x1, [x22, #0x8]
    4acc:      	str	x2, [x22, #0x10]
    4ad0:      	ldr	x19, [sp, #0x60]
    4ad4:      	ldr	x20, [sp, #0x68]
    4ad8:      	ldr	x21, [sp, #0x70]
    4adc:      	ldr	x22, [sp, #0x78]
    4ae0:      	ldr	x23, [sp, #0x80]
    4ae4:      	ldr	x29, [sp]
    4ae8:      	ldr	x30, [sp, #0x8]
    4aec:      	add	sp, sp, #0x90
    4af0:      	ret
    4af4:      	cmp	x1, #0x0
    4af8:      	cset	w12, le
    4afc:      	uxtb	w19, w11
    4b00:      	add	x16, sp, #0x10
    4b04:      	str	x11, [x16]
    4b08:      	orr	x11, x19, xzr
    4b0c:      	add	x16, sp, #0x10
    4b10:      	str	x9, [x16, #0x8]
    4b14:      	cmp	x11, #0x42
    4b18:      	b.ne	0x49fc <_stogir.stack.validate+0xe8>
    4b1c:      	uxtb	w16, w3
    4b20:      	cmp	w16, wzr
    4b24:      	b.eq	0x4bd8 <_stogir.stack.validate+0x2c4>
    4b28:      	ldr	x4, [x0, #0x8]
    4b2c:      	cmp	x1, x4
    4b30:      	b.ge	0x4c24 <_stogir.stack.validate+0x310>
    4b34:      	add	x4, x0, #0x78
    4b38:      	ldr	x4, [x4, #0x8]
    4b3c:      	cmp	x1, x4
    4b40:      	b.ge	0x4d0c <_stogir.stack.validate+0x3f8>
    4b44:      	ldr	x1, [x0, #0x78]
    4b48:      	add	x1, x2, x1
    4b4c:      	ldr	w1, [x1]
    4b50:      	sxtw	x1, w1
    4b54:      	cmp	x1, #0x0
    4b58:      	cset	w1, ge
    4b5c:      	ubfx	x1, x1, #0, #8
    4b60:      	b	0x4d10 <_stogir.stack.validate+0x3fc>
    4b64:      	movz	x9, #0x0, lsl #48
    4b68:      	b	0x4a24 <_stogir.stack.validate+0x110>
    4b6c:      	movz	x9, #0x0, lsl #48
    4b70:      	b	0x49f8 <_stogir.stack.validate+0xe4>
    4b74:      	mov	x0, #0x1                ; =1
    4b78:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x428>
		0000000000004b78:  ARM64_RELOC_PAGE21	l_stogir.393
    4b7c:      	ldr	x1, [x1]
		0000000000004b7c:  ARM64_RELOC_PAGEOFF12	l_stogir.393
    4b80:      	mov	x2, #0x1e               ; =30
    4b84:      	mov	x22, x8
    4b88:      	b	0x4a1c <_stogir.stack.validate+0x108>
    4b8c:      	cmp	x11, #0x51
    4b90:      	cset	w1, eq
    4b94:      	cmp	x11, #0x53
    4b98:      	cset	w20, eq
    4b9c:      	cmp	x11, #0x54
    4ba0:      	cset	w21, eq
    4ba4:      	uxtb	w16, w1
    4ba8:      	cmp	w16, wzr
    4bac:      	b.ne	0x4d14 <_stogir.stack.validate+0x400>
    4bb0:      	cmp	x11, #0x52
    4bb4:      	b.eq	0x4d14 <_stogir.stack.validate+0x400>
    4bb8:      	uxtb	w16, w20
    4bbc:      	cmp	w16, wzr
    4bc0:      	b.ne	0x4d14 <_stogir.stack.validate+0x400>
    4bc4:      	uxtb	w16, w21
    4bc8:      	cmp	w16, wzr
    4bcc:      	b.ne	0x4d14 <_stogir.stack.validate+0x400>
    4bd0:      	mov	x22, x8
    4bd4:      	b	0x4a0c <_stogir.stack.validate+0xf8>
    4bd8:      	uxtb	w16, w5
    4bdc:      	cmp	w16, wzr
    4be0:      	b.eq	0x4c2c <_stogir.stack.validate+0x318>
    4be4:      	add	x1, x0, #0x28
    4be8:      	add	x5, x0, #0x50
    4bec:      	ldr	x1, [x1, #0x8]
    4bf0:      	ldr	x5, [x5, #0x8]
    4bf4:      	cmp	x1, x5
    4bf8:      	b.ne	0x4d04 <_stogir.stack.validate+0x3f0>
    4bfc:      	cmp	x4, x1
    4c00:      	b.gt	0x4e54 <_stogir.stack.validate+0x540>
    4c04:      	ldr	x1, [x0, #0x50]
    4c08:      	add	x1, x7, x1
    4c0c:      	ldr	w1, [x1]
    4c10:      	sxtw	x1, w1
    4c14:      	cmp	x1, #0x0
    4c18:      	cset	w1, gt
    4c1c:      	ubfx	x1, x1, #0, #8
    4c20:      	b	0x4e58 <_stogir.stack.validate+0x544>
    4c24:      	movz	x1, #0x0, lsl #48
    4c28:      	b	0x4c30 <_stogir.stack.validate+0x31c>
    4c2c:      	movz	x1, #0x0, lsl #48
    4c30:      	cmp	x1, #0x0
    4c34:      	b.eq	0x4c68 <_stogir.stack.validate+0x354>
    4c38:      	uxtb	w16, w3
    4c3c:      	cmp	w16, wzr
    4c40:      	b.eq	0x4c54 <_stogir.stack.validate+0x340>
    4c44:      	ldr	x1, [x0]
    4c48:      	add	x1, x10, x1
    4c4c:      	ldr	x1, [x1]
    4c50:      	b	0x4c60 <_stogir.stack.validate+0x34c>
    4c54:      	ldr	x1, [x0, #0x28]
    4c58:      	add	x1, x6, x1
    4c5c:      	ldr	x1, [x1]
    4c60:      	mov	w3, #0x1                ; =1
    4c64:      	b	0x4c70 <_stogir.stack.validate+0x35c>
    4c68:      	movz	w3, #0x0, lsl #16
    4c6c:      	movz	x1, #0x0, lsl #48
    4c70:      	ubfx	x3, x3, #0, #32
    4c74:      	lsr	x16, x3, #0
    4c78:      	cmp	x16, #0x1
    4c7c:      	b.eq	0x4c98 <_stogir.stack.validate+0x384>
    4c80:      	b.lo	0x4c88 <_stogir.stack.validate+0x374>
    4c84:      	b	0x4c9c <_stogir.stack.validate+0x388>
    4c88:      	cmp	x16, #0x0
    4c8c:      	b.eq	0x4c94 <_stogir.stack.validate+0x380>
    4c90:      	b	0x4c9c <_stogir.stack.validate+0x388>
    4c94:      	b	0x4ca0 <_stogir.stack.validate+0x38c>
    4c98:      	b	0x4cb4 <_stogir.stack.validate+0x3a0>
    4c9c:      	b	0x4eb4 <_stogir.stack.validate+0x5a0>
    4ca0:      	mov	x0, #0x1                ; =1
    4ca4:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x428>
		0000000000004ca4:  ARM64_RELOC_PAGE21	l_stogir.394
    4ca8:      	ldr	x1, [x1]
		0000000000004ca8:  ARM64_RELOC_PAGEOFF12	l_stogir.394
    4cac:      	mov	x2, #0x21               ; =33
    4cb0:      	b	0x4b84 <_stogir.stack.validate+0x270>
    4cb4:      	uxtb	w16, w12
    4cb8:      	cmp	w16, wzr
    4cbc:      	b.ne	0x4b74 <_stogir.stack.validate+0x260>
    4cc0:      	uxtb	w3, w1
    4cc4:      	cmp	x3, #0x42
    4cc8:      	b.ne	0x4b74 <_stogir.stack.validate+0x260>
    4ccc:      	ubfx	x1, x1, #0, #32
    4cd0:      	ubfx	x1, x1, #8, #8
    4cd4:      	cmp	x1, #0x6
    4cd8:      	b.ne	0x4b74 <_stogir.stack.validate+0x260>
    4cdc:      	ldr	x0, [x0, #0x78]
    4ce0:      	add	x0, x2, x0
    4ce4:      	ldr	w0, [x0]
    4ce8:      	sxtw	x0, w0
    4cec:      	cmp	x0, #0x0
    4cf0:      	b.ne	0x4b74 <_stogir.stack.validate+0x260>
    4cf4:      	movz	x0, #0x0, lsl #48
    4cf8:      	mov	x1, #0x8                ; =8
    4cfc:      	movz	x2, #0x0, lsl #48
    4d00:      	b	0x4b84 <_stogir.stack.validate+0x270>
    4d04:      	movz	x1, #0x0, lsl #48
    4d08:      	b	0x4c30 <_stogir.stack.validate+0x31c>
    4d0c:      	movz	x1, #0x0, lsl #48
    4d10:      	b	0x4c28 <_stogir.stack.validate+0x314>
    4d14:      	ldr	x3, [x0, #0x78]
    4d18:      	add	x2, x2, x3
    4d1c:      	ldr	w2, [x2]
    4d20:      	uxtb	w16, w1
    4d24:      	cmp	w16, wzr
    4d28:      	b.eq	0x4d88 <_stogir.stack.validate+0x474>
    4d2c:      	mov	w1, #0x3                ; =3
    4d30:      	b	0x4d9c <_stogir.stack.validate+0x488>
    4d34:      	add	x16, sp, #0x10
    4d38:      	ldr	w0, [x16]
    4d3c:      	add	x16, sp, #0x10
    4d40:      	ldr	w1, [x16, #0x4]
    4d44:      	add	x16, sp, #0x10
    4d48:      	ldr	w2, [x16, #0x8]
    4d4c:      	ubfx	x0, x0, #8, #8
    4d50:      	add	x8, sp, #0x20
    4d54:      	mov	w3, w1
    4d58:      	mov	w1, w19
    4d5c:      	mov	w4, w2
    4d60:      	mov	w2, w0
    4d64:      	mov	x0, x23
    4d68:      	bl	0x4d68 <_stogir.stack.validate+0x454>
		0000000000004d68:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-scope-inputs
    4d6c:      	add	x16, sp, #0x20
    4d70:      	ldr	x0, [x16]
    4d74:      	add	x16, sp, #0x20
    4d78:      	ldr	x1, [x16, #0x8]
    4d7c:      	add	x16, sp, #0x20
    4d80:      	ldr	x2, [x16, #0x10]
    4d84:      	b	0x4a1c <_stogir.stack.validate+0x108>
    4d88:      	uxtb	w16, w20
    4d8c:      	cmp	w16, wzr
    4d90:      	mov	w16, #0x1               ; =1
    4d94:      	mov	w17, #0x2               ; =2
    4d98:      	csel	w1, w16, w17, ne
    4d9c:      	sxtw	x2, w2
    4da0:      	sxtw	x1, w1
    4da4:      	cmp	x2, x1
    4da8:      	b.ne	0x4ebc <_stogir.stack.validate+0x5a8>
    4dac:      	add	x16, sp, #0x10
    4db0:      	ldr	w1, [x16]
    4db4:      	orr	x2, x1, xzr
    4db8:      	ubfx	x2, x2, #16, #16
    4dbc:      	uxth	w16, w2
    4dc0:      	and	w2, w16, #0x8000
    4dc4:      	uxth	w2, w2
    4dc8:      	ubfx	x2, x2, #0, #16
    4dcc:      	cmp	x2, #0x0
    4dd0:      	b.ne	0x4e5c <_stogir.stack.validate+0x548>
    4dd4:      	mov	x22, x8
    4dd8:      	mov	x23, x0
    4ddc:      	uxtb	w16, w20
    4de0:      	cmp	w16, wzr
    4de4:      	b.ne	0x4d34 <_stogir.stack.validate+0x420>
    4de8:      	uxtb	w16, w21
    4dec:      	cmp	w16, wzr
    4df0:      	b.ne	0x4d34 <_stogir.stack.validate+0x420>
    4df4:      	add	x16, sp, #0x10
    4df8:      	ldr	w0, [x16]
    4dfc:      	add	x16, sp, #0x10
    4e00:      	ldr	w1, [x16, #0x4]
    4e04:      	add	x16, sp, #0x10
    4e08:      	ldr	w2, [x16, #0x8]
    4e0c:      	ubfx	x0, x0, #8, #8
    4e10:      	add	x16, sp, #0x10
    4e14:      	ldr	w3, [x16, #0xc]
    4e18:      	add	x8, sp, #0x40
    4e1c:      	mov	w4, w2
    4e20:      	mov	w2, w0
    4e24:      	mov	x0, x23
    4e28:      	mov	w5, w3
    4e2c:      	mov	w3, w1
    4e30:      	mov	w1, w19
    4e34:      	bl	0x4e34 <_stogir.stack.validate+0x520>
		0000000000004e34:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-inputs
    4e38:      	add	x16, sp, #0x40
    4e3c:      	ldr	x0, [x16]
    4e40:      	add	x16, sp, #0x40
    4e44:      	ldr	x1, [x16, #0x8]
    4e48:      	add	x16, sp, #0x40
    4e4c:      	ldr	x2, [x16, #0x10]
    4e50:      	b	0x4d84 <_stogir.stack.validate+0x470>
    4e54:      	movz	x1, #0x0, lsl #48
    4e58:      	b	0x4d08 <_stogir.stack.validate+0x3f4>
    4e5c:      	uxtb	w2, w1
    4e60:      	cmp	x2, #0x51
    4e64:      	b.ne	0x4ec4 <_stogir.stack.validate+0x5b0>
    4e68:      	ubfx	x1, x1, #16, #16
    4e6c:      	cmp	x1, #0x8, lsl #12       ; =0x8000
    4e70:      	b.ne	0x4ecc <_stogir.stack.validate+0x5b8>
    4e74:      	add	x16, sp, #0x10
    4e78:      	ldr	w1, [x16, #0x4]
    4e7c:      	add	x16, sp, #0x10
    4e80:      	ldr	w2, [x16, #0x8]
    4e84:      	mov	x22, x8
    4e88:      	mov	x23, x0
    4e8c:      	bl	0x4e8c <_stogir.stack.validate+0x578>
		0000000000004e8c:  ARM64_RELOC_BRANCH26	_stogir.stack.valid-frame-object-inputs?
    4e90:      	cmp	x0, #0x0
    4e94:      	b.ne	0x4ddc <_stogir.stack.validate+0x4c8>
    4e98:      	mov	x0, #0x1                ; =1
    4e9c:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x428>
		0000000000004e9c:  ARM64_RELOC_PAGE21	l_stogir.395
    4ea0:      	ldr	x1, [x1]
		0000000000004ea0:  ARM64_RELOC_PAGEOFF12	l_stogir.395
    4ea4:      	mov	x2, #0x26               ; =38
    4ea8:      	b	0x4d84 <_stogir.stack.validate+0x470>
    4eac:      	brk	#0
    4eb0:      	b	0x4eac <_stogir.stack.validate+0x598>
    4eb4:      	brk	#0
    4eb8:      	b	0x4eb4 <_stogir.stack.validate+0x5a0>
    4ebc:      	mov	x22, x8
    4ec0:      	b	0x4a0c <_stogir.stack.validate+0xf8>
    4ec4:      	mov	x22, x8
    4ec8:      	b	0x4e98 <_stogir.stack.validate+0x584>
    4ecc:      	mov	x22, x8
    4ed0:      	b	0x4e98 <_stogir.stack.validate+0x584>

0000000000004ed4 <_stogir.locals.validate>:
    4ed4:      	sub	sp, sp, #0xb0
    4ed8:      	str	x29, [sp]
    4edc:      	str	x30, [sp, #0x8]
    4ee0:      	mov	x29, sp
    4ee4:      	str	x19, [sp, #0x70]
    4ee8:      	str	x20, [sp, #0x78]
    4eec:      	str	x21, [sp, #0x80]
    4ef0:      	str	x22, [sp, #0x88]
    4ef4:      	str	x23, [sp, #0x90]
    4ef8:      	str	x24, [sp, #0x98]
    4efc:      	str	x25, [sp, #0xa0]
    4f00:      	sxtw	x1, w1
    4f04:      	lsl	x3, x1, #2
    4f08:      	cmp	x1, #0x0
    4f0c:      	cset	w4, gt
    4f10:      	movz	x16, #0x0, lsl #48
    4f14:      	sub	x5, x16, x1
    4f18:      	sub	x6, x5, #0x1
    4f1c:      	uxtb	w16, w4
    4f20:      	cmp	w16, wzr
    4f24:      	b.eq	0x4f64 <_stogir.locals.validate+0x90>
    4f28:      	ldr	x5, [x0, #0x8]
    4f2c:      	cmp	x1, x5
    4f30:      	b.ge	0x4ff0 <_stogir.locals.validate+0x11c>
    4f34:      	add	x5, x0, #0x78
    4f38:      	ldr	x5, [x5, #0x8]
    4f3c:      	cmp	x1, x5
    4f40:      	b.ge	0x50e8 <_stogir.locals.validate+0x214>
    4f44:      	ldr	x5, [x0, #0x78]
    4f48:      	add	x5, x3, x5
    4f4c:      	ldr	w5, [x5]
    4f50:      	sxtw	x5, w5
    4f54:      	cmp	x5, #0x0
    4f58:      	cset	w5, ge
    4f5c:      	ubfx	x5, x5, #0, #8
    4f60:      	b	0x50ec <_stogir.locals.validate+0x218>
    4f64:      	cmp	x1, #0x0
    4f68:      	b.ge	0x4ff8 <_stogir.locals.validate+0x124>
    4f6c:      	add	x7, x0, #0x28
    4f70:      	add	x9, x0, #0x50
    4f74:      	ldr	x7, [x7, #0x8]
    4f78:      	ldr	x9, [x9, #0x8]
    4f7c:      	cmp	x7, x9
    4f80:      	b.ne	0x4fac <_stogir.locals.validate+0xd8>
    4f84:      	cmp	x5, x7
    4f88:      	b.gt	0x516c <_stogir.locals.validate+0x298>
    4f8c:      	ldr	x5, [x0, #0x50]
    4f90:      	add	x5, x5, x6, lsl #2
    4f94:      	ldr	w5, [x5]
    4f98:      	sxtw	x5, w5
    4f9c:      	cmp	x5, #0x0
    4fa0:      	cset	w5, gt
    4fa4:      	ubfx	x5, x5, #0, #8
    4fa8:      	b	0x5170 <_stogir.locals.validate+0x29c>
    4fac:      	movz	x5, #0x0, lsl #48
    4fb0:      	b	0x4ffc <_stogir.locals.validate+0x128>
    4fb4:      	cmp	x4, #0x0
    4fb8:      	cset	w4, ne
    4fbc:      	uxtb	w16, w4
    4fc0:      	cmp	w16, wzr
    4fc4:      	mov	w16, #0x2               ; =2
    4fc8:      	mov	w17, #0x3               ; =3
    4fcc:      	csel	w4, w16, w17, ne
    4fd0:      	cmp	x1, #0x0
    4fd4:      	b.gt	0x50f0 <_stogir.locals.validate+0x21c>
    4fd8:      	mov	x23, x8
    4fdc:      	mov	x2, #0x1                ; =1
    4fe0:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x428>
		0000000000004fe0:  ARM64_RELOC_PAGE21	l_stogir.396
    4fe4:      	ldr	x1, [x1]
		0000000000004fe4:  ARM64_RELOC_PAGEOFF12	l_stogir.396
    4fe8:      	mov	x0, #0x17               ; =23
    4fec:      	b	0x508c <_stogir.locals.validate+0x1b8>
    4ff0:      	movz	x5, #0x0, lsl #48
    4ff4:      	b	0x4ffc <_stogir.locals.validate+0x128>
    4ff8:      	movz	x5, #0x0, lsl #48
    4ffc:      	cmp	x5, #0x0
    5000:      	b.eq	0x503c <_stogir.locals.validate+0x168>
    5004:      	uxtb	w16, w4
    5008:      	cmp	w16, wzr
    500c:      	b.eq	0x5024 <_stogir.locals.validate+0x150>
    5010:      	ldr	x4, [x0]
    5014:      	add	x4, x4, x1, lsl #4
    5018:      	ldr	x5, [x4]
    501c:      	ldr	x4, [x4, #0x8]
    5020:      	b	0x5034 <_stogir.locals.validate+0x160>
    5024:      	ldr	x4, [x0, #0x28]
    5028:      	add	x4, x4, x6, lsl #4
    502c:      	ldr	x5, [x4]
    5030:      	ldr	x4, [x4, #0x8]
    5034:      	mov	w6, #0x1                ; =1
    5038:      	b	0x5048 <_stogir.locals.validate+0x174>
    503c:      	movz	w6, #0x0, lsl #16
    5040:      	movz	x5, #0x0, lsl #48
    5044:      	movz	x4, #0x0, lsl #48
    5048:      	ubfx	x6, x6, #0, #32
    504c:      	lsr	x16, x6, #0
    5050:      	cmp	x16, #0x1
    5054:      	b.eq	0x5070 <_stogir.locals.validate+0x19c>
    5058:      	b.lo	0x5060 <_stogir.locals.validate+0x18c>
    505c:      	b	0x5074 <_stogir.locals.validate+0x1a0>
    5060:      	cmp	x16, #0x0
    5064:      	b.eq	0x506c <_stogir.locals.validate+0x198>
    5068:      	b	0x5074 <_stogir.locals.validate+0x1a0>
    506c:      	b	0x5078 <_stogir.locals.validate+0x1a4>
    5070:      	b	0x50c4 <_stogir.locals.validate+0x1f0>
    5074:      	b	0x5294 <_stogir.locals.validate+0x3c0>
    5078:      	mov	x23, x8
    507c:      	mov	x2, #0x1                ; =1
    5080:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005080:  ARM64_RELOC_PAGE21	l_stogir.397
    5084:      	ldr	x1, [x1]
		0000000000005084:  ARM64_RELOC_PAGEOFF12	l_stogir.397
    5088:      	mov	x0, #0x17               ; =23
    508c:      	str	x2, [x23]
    5090:      	str	x1, [x23, #0x8]
    5094:      	str	x0, [x23, #0x10]
    5098:      	ldr	x19, [sp, #0x70]
    509c:      	ldr	x20, [sp, #0x78]
    50a0:      	ldr	x21, [sp, #0x80]
    50a4:      	ldr	x22, [sp, #0x88]
    50a8:      	ldr	x23, [sp, #0x90]
    50ac:      	ldr	x24, [sp, #0x98]
    50b0:      	ldr	x25, [sp, #0xa0]
    50b4:      	ldr	x29, [sp]
    50b8:      	ldr	x30, [sp, #0x8]
    50bc:      	add	sp, sp, #0xb0
    50c0:      	ret
    50c4:      	uxtb	w6, w5
    50c8:      	add	x16, sp, #0x10
    50cc:      	str	x5, [x16]
    50d0:      	add	x16, sp, #0x10
    50d4:      	str	x4, [x16, #0x8]
    50d8:      	cmp	x6, #0x55
    50dc:      	b.ne	0x5150 <_stogir.locals.validate+0x27c>
    50e0:      	mov	x4, #0x1                ; =1
    50e4:      	b	0x515c <_stogir.locals.validate+0x288>
    50e8:      	movz	x5, #0x0, lsl #48
    50ec:      	b	0x4ff4 <_stogir.locals.validate+0x120>
    50f0:      	cmp	x6, #0x48
    50f4:      	cset	w21, eq
    50f8:      	uxtb	w16, w20
    50fc:      	cmp	w16, wzr
    5100:      	b.ne	0x5174 <_stogir.locals.validate+0x2a0>
    5104:      	uxtb	w16, w21
    5108:      	cmp	w16, wzr
    510c:      	b.ne	0x5174 <_stogir.locals.validate+0x2a0>
    5110:      	cmp	x6, #0x55
    5114:      	b.lt	0x55d8 <_stogir.locals.validate+0x704>
    5118:      	cmp	x6, #0x58
    511c:      	b.le	0x5174 <_stogir.locals.validate+0x2a0>
    5120:      	mov	x23, x8
    5124:      	b	0x4fdc <_stogir.locals.validate+0x108>
    5128:      	cmp	x6, #0x58
    512c:      	cset	w5, eq
    5130:      	ubfx	x19, x5, #0, #8
    5134:      	cmp	x6, #0x41
    5138:      	cset	w20, eq
    513c:      	uxtb	w16, w20
    5140:      	cmp	w16, wzr
    5144:      	b.eq	0x4fb4 <_stogir.locals.validate+0xe0>
    5148:      	mov	w4, #0x1                ; =1
    514c:      	b	0x4fd0 <_stogir.locals.validate+0xfc>
    5150:      	cmp	x6, #0x56
    5154:      	cset	w4, eq
    5158:      	ubfx	x4, x4, #0, #8
    515c:      	cmp	x6, #0x57
    5160:      	b.ne	0x5128 <_stogir.locals.validate+0x254>
    5164:      	mov	x19, #0x1               ; =1
    5168:      	b	0x5134 <_stogir.locals.validate+0x260>
    516c:      	movz	x5, #0x0, lsl #48
    5170:      	b	0x4fb0 <_stogir.locals.validate+0xdc>
    5174:      	sxtw	x4, w4
    5178:      	ldr	x5, [x0, #0x78]
    517c:      	add	x3, x3, x5
    5180:      	ldr	w3, [x3]
    5184:      	sxtw	x3, w3
    5188:      	cmp	x3, x4
    518c:      	b.ne	0x55e0 <_stogir.locals.validate+0x70c>
    5190:      	uxtb	w16, w20
    5194:      	cmp	w16, wzr
    5198:      	b.ne	0x51b8 <_stogir.locals.validate+0x2e4>
    519c:      	uxtb	w16, w21
    51a0:      	cmp	w16, wzr
    51a4:      	b.ne	0x51b8 <_stogir.locals.validate+0x2e4>
    51a8:      	add	x16, sp, #0x10
    51ac:      	ldr	w1, [x16, #0x8]
    51b0:      	sxtw	x1, w1
    51b4:      	b	0x51d0 <_stogir.locals.validate+0x2fc>
    51b8:      	uxtb	w16, w21
    51bc:      	cmp	w16, wzr
    51c0:      	b.ne	0x51d0 <_stogir.locals.validate+0x2fc>
    51c4:      	add	x16, sp, #0x10
    51c8:      	ldr	w1, [x16, #0x4]
    51cc:      	sxtw	x1, w1
    51d0:      	add	x16, sp, #0x20
    51d4:      	orr	x22, x16, xzr
    51d8:      	mov	x23, x8
    51dc:      	add	x8, sp, #0x20
    51e0:      	mov	x24, x0
    51e4:      	mov	w25, w2
    51e8:      	bl	0x51e8 <_stogir.locals.validate+0x314>
		00000000000051e8:  ARM64_RELOC_BRANCH26	_stogir.locals.shape
    51ec:      	add	x16, sp, #0x20
    51f0:      	ldr	w0, [x16]
    51f4:      	lsr	x16, x0, #0
    51f8:      	cmp	x16, #0x1
    51fc:      	b.eq	0x5218 <_stogir.locals.validate+0x344>
    5200:      	b.lo	0x5208 <_stogir.locals.validate+0x334>
    5204:      	b	0x521c <_stogir.locals.validate+0x348>
    5208:      	cmp	x16, #0x0
    520c:      	b.eq	0x5214 <_stogir.locals.validate+0x340>
    5210:      	b	0x521c <_stogir.locals.validate+0x348>
    5214:      	b	0x5238 <_stogir.locals.validate+0x364>
    5218:      	b	0x5220 <_stogir.locals.validate+0x34c>
    521c:      	b	0x545c <_stogir.locals.validate+0x588>
    5220:      	add	x0, x22, #0x8
    5224:      	add	x16, sp, #0x20
    5228:      	ldr	x1, [x16, #0x8]
    522c:      	ldr	x0, [x0, #0x8]
    5230:      	mov	x2, #0x1                ; =1
    5234:      	b	0x4fec <_stogir.locals.validate+0x118>
    5238:      	add	x16, sp, #0x20
    523c:      	ldr	x22, [x16, #0x8]
    5240:      	uxtb	w16, w21
    5244:      	cmp	w16, wzr
    5248:      	b.eq	0x5260 <_stogir.locals.validate+0x38c>
    524c:      	sxtw	x22, w22
    5250:      	and	x1, x22, #0xffffffff
    5254:      	movz	x2, #0x0, lsl #48
    5258:      	movz	x0, #0x0, lsl #48
    525c:      	b	0x5234 <_stogir.locals.validate+0x360>
    5260:      	uxtb	w16, w20
    5264:      	cmp	w16, wzr
    5268:      	b.eq	0x52b0 <_stogir.locals.validate+0x3dc>
    526c:      	add	x16, sp, #0x10
    5270:      	ldr	w0, [x16]
    5274:      	ubfx	x0, x0, #8, #8
    5278:      	cmp	x0, #0x6
    527c:      	b.ne	0x529c <_stogir.locals.validate+0x3c8>
    5280:      	sxtw	x25, w25
    5284:      	and	x1, x25, #0xffffffff
    5288:      	movz	x2, #0x0, lsl #48
    528c:      	movz	x0, #0x0, lsl #48
    5290:      	b	0x52ac <_stogir.locals.validate+0x3d8>
    5294:      	brk	#0
    5298:      	b	0x5294 <_stogir.locals.validate+0x3c0>
    529c:      	mov	x2, #0x1                ; =1
    52a0:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		00000000000052a0:  ARM64_RELOC_PAGE21	l_stogir.398
    52a4:      	ldr	x1, [x1]
		00000000000052a4:  ARM64_RELOC_PAGEOFF12	l_stogir.398
    52a8:      	mov	x0, #0x21               ; =33
    52ac:      	b	0x525c <_stogir.locals.validate+0x388>
    52b0:      	add	x16, sp, #0x10
    52b4:      	ldr	w0, [x16, #0x4]
    52b8:      	sxtw	x0, w0
    52bc:      	cmp	x0, #0x0
    52c0:      	cset	w1, gt
    52c4:      	movz	x16, #0x0, lsl #48
    52c8:      	sub	x2, x16, x0
    52cc:      	sub	x3, x2, #0x1
    52d0:      	uxtb	w16, w1
    52d4:      	cmp	w16, wzr
    52d8:      	b.eq	0x53a8 <_stogir.locals.validate+0x4d4>
    52dc:      	ldr	x2, [x24, #0x8]
    52e0:      	cmp	x0, x2
    52e4:      	b.ge	0x53a0 <_stogir.locals.validate+0x4cc>
    52e8:      	add	x2, x24, #0x78
    52ec:      	ldr	x2, [x2, #0x8]
    52f0:      	cmp	x0, x2
    52f4:      	b.ge	0x544c <_stogir.locals.validate+0x578>
    52f8:      	ldr	x2, [x24, #0x78]
    52fc:      	add	x2, x2, x0, lsl #2
    5300:      	ldr	w2, [x2]
    5304:      	sxtw	x2, w2
    5308:      	cmp	x2, #0x0
    530c:      	cset	w2, ge
    5310:      	ubfx	x2, x2, #0, #8
    5314:      	b	0x5450 <_stogir.locals.validate+0x57c>
    5318:      	movz	w1, #0x0, lsl #16
    531c:      	movz	x0, #0x0, lsl #48
    5320:      	ubfx	x1, x1, #0, #32
    5324:      	lsr	x16, x1, #0
    5328:      	cmp	x16, #0x1
    532c:      	b.eq	0x5348 <_stogir.locals.validate+0x474>
    5330:      	b.lo	0x5338 <_stogir.locals.validate+0x464>
    5334:      	b	0x534c <_stogir.locals.validate+0x478>
    5338:      	cmp	x16, #0x0
    533c:      	b.eq	0x5344 <_stogir.locals.validate+0x470>
    5340:      	b	0x534c <_stogir.locals.validate+0x478>
    5344:      	b	0x5350 <_stogir.locals.validate+0x47c>
    5348:      	b	0x53f0 <_stogir.locals.validate+0x51c>
    534c:      	b	0x55ac <_stogir.locals.validate+0x6d8>
    5350:      	mov	x2, #0x1                ; =1
    5354:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005354:  ARM64_RELOC_PAGE21	l_stogir.399
    5358:      	ldr	x1, [x1]
		0000000000005358:  ARM64_RELOC_PAGEOFF12	l_stogir.399
    535c:      	mov	x0, #0x1c               ; =28
    5360:      	b	0x52ac <_stogir.locals.validate+0x3d8>
    5364:      	ldr	x0, [x24, #0x28]
    5368:      	add	x0, x0, x3, lsl #4
    536c:      	ldr	x0, [x0]
    5370:      	mov	w1, #0x1                ; =1
    5374:      	b	0x5320 <_stogir.locals.validate+0x44c>
    5378:      	movz	x2, #0x0, lsl #48
    537c:      	cmp	x2, #0x0
    5380:      	b.eq	0x5318 <_stogir.locals.validate+0x444>
    5384:      	uxtb	w16, w1
    5388:      	cmp	w16, wzr
    538c:      	b.eq	0x5364 <_stogir.locals.validate+0x490>
    5390:      	ldr	x1, [x24]
    5394:      	add	x0, x1, x0, lsl #4
    5398:      	ldr	x0, [x0]
    539c:      	b	0x5370 <_stogir.locals.validate+0x49c>
    53a0:      	movz	x2, #0x0, lsl #48
    53a4:      	b	0x537c <_stogir.locals.validate+0x4a8>
    53a8:      	cmp	x0, #0x0
    53ac:      	b.ge	0x5378 <_stogir.locals.validate+0x4a4>
    53b0:      	add	x4, x24, #0x28
    53b4:      	add	x5, x24, #0x50
    53b8:      	ldr	x4, [x4, #0x8]
    53bc:      	ldr	x5, [x5, #0x8]
    53c0:      	cmp	x4, x5
    53c4:      	b.ne	0x5444 <_stogir.locals.validate+0x570>
    53c8:      	cmp	x2, x4
    53cc:      	b.gt	0x5454 <_stogir.locals.validate+0x580>
    53d0:      	ldr	x2, [x24, #0x50]
    53d4:      	add	x2, x2, x3, lsl #2
    53d8:      	ldr	w2, [x2]
    53dc:      	sxtw	x2, w2
    53e0:      	cmp	x2, #0x0
    53e4:      	cset	w2, gt
    53e8:      	ubfx	x2, x2, #0, #8
    53ec:      	b	0x5458 <_stogir.locals.validate+0x584>
    53f0:      	add	x16, sp, #0x10
    53f4:      	ldr	w1, [x16, #0x4]
    53f8:      	sxtw	x1, w1
    53fc:      	cmp	x1, #0x0
    5400:      	b.le	0x5430 <_stogir.locals.validate+0x55c>
    5404:      	uxtb	w0, w0
    5408:      	cmp	x0, #0x83
    540c:      	cset	w1, lt
    5410:      	uxtb	w16, w1
    5414:      	cmp	w16, wzr
    5418:      	b.eq	0x5464 <_stogir.locals.validate+0x590>
    541c:      	adrp	x17, 0x5000 <_stogir.locals.validate+0x12c>
		000000000000541c:  ARM64_RELOC_PAGE21	l_stogir.400
    5420:      	ldr	x17, [x17]
		0000000000005420:  ARM64_RELOC_PAGEOFF12	l_stogir.400
    5424:      	add	x2, x0, x17
    5428:      	ldrb	w2, [x2]
    542c:      	b	0x5468 <_stogir.locals.validate+0x594>
    5430:      	mov	x2, #0x1                ; =1
    5434:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005434:  ARM64_RELOC_PAGE21	l_stogir.401
    5438:      	ldr	x1, [x1]
		0000000000005438:  ARM64_RELOC_PAGEOFF12	l_stogir.401
    543c:      	mov	x0, #0x1c               ; =28
    5440:      	b	0x5360 <_stogir.locals.validate+0x48c>
    5444:      	movz	x2, #0x0, lsl #48
    5448:      	b	0x537c <_stogir.locals.validate+0x4a8>
    544c:      	movz	x2, #0x0, lsl #48
    5450:      	b	0x53a4 <_stogir.locals.validate+0x4d0>
    5454:      	movz	x2, #0x0, lsl #48
    5458:      	b	0x5448 <_stogir.locals.validate+0x574>
    545c:      	brk	#0
    5460:      	b	0x545c <_stogir.locals.validate+0x588>
    5464:      	movz	w2, #0x0, lsl #16
    5468:      	uxtb	w16, w2
    546c:      	and	w2, w16, #0x1
    5470:      	uxtb	w2, w2
    5474:      	ubfx	x2, x2, #0, #8
    5478:      	cmp	x2, #0x0
    547c:      	b.eq	0x5430 <_stogir.locals.validate+0x55c>
    5480:      	uxtb	w16, w1
    5484:      	cmp	w16, wzr
    5488:      	b.eq	0x54a0 <_stogir.locals.validate+0x5cc>
    548c:      	adrp	x17, 0x5000 <_stogir.locals.validate+0x12c>
		000000000000548c:  ARM64_RELOC_PAGE21	l_stogir.400
    5490:      	ldr	x17, [x17]
		0000000000005490:  ARM64_RELOC_PAGEOFF12	l_stogir.400
    5494:      	add	x0, x0, x17
    5498:      	ldrb	w0, [x0]
    549c:      	b	0x54a4 <_stogir.locals.validate+0x5d0>
    54a0:      	movz	w0, #0x0, lsl #16
    54a4:      	uxtb	w16, w0
    54a8:      	and	w0, w16, #0x4
    54ac:      	uxtb	w0, w0
    54b0:      	ubfx	x0, x0, #0, #8
    54b4:      	cmp	x0, #0x0
    54b8:      	cset	w0, eq
    54bc:      	uxtb	w16, w0
    54c0:      	cmp	w16, wzr
    54c4:      	cset	x0, eq
    54c8:      	cmp	x0, #0x0
    54cc:      	b.ne	0x5430 <_stogir.locals.validate+0x55c>
    54d0:      	cmp	x19, #0x0
    54d4:      	b.eq	0x555c <_stogir.locals.validate+0x688>
    54d8:      	add	x16, sp, #0x10
    54dc:      	ldr	w0, [x16, #0xc]
    54e0:      	add	x8, sp, #0x40
    54e4:      	mov	w1, w0
    54e8:      	mov	x0, x24
    54ec:      	bl	0x54ec <_stogir.locals.validate+0x618>
		00000000000054ec:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    54f0:      	add	x16, sp, #0x40
    54f4:      	ldr	x0, [x16]
    54f8:      	add	x16, sp, #0x40
    54fc:      	ldr	x20, [x16, #0x8]
    5500:      	b	0x5568 <_stogir.locals.validate+0x694>
    5504:      	orr	w0, w20, wzr
    5508:      	ubfx	x0, x0, #0, #32
    550c:      	ubfx	x0, x0, #8, #8
    5510:      	mov	w1, w25
    5514:      	bl	0x5514 <_stogir.locals.validate+0x640>
		0000000000005514:  ARM64_RELOC_BRANCH26	_stogir.types.size
    5518:      	sxtw	x0, w0
    551c:      	cmp	x0, #0x0
    5520:      	b.le	0x5548 <_stogir.locals.validate+0x674>
    5524:      	cmp	x0, x22
    5528:      	b.gt	0x5548 <_stogir.locals.validate+0x674>
    552c:      	cmp	x19, #0x0
    5530:      	b.eq	0x55b4 <_stogir.locals.validate+0x6e0>
    5534:      	add	x16, sp, #0x10
    5538:      	ldr	w1, [x16]
    553c:      	ubfx	x1, x1, #8, #8
    5540:      	cmp	x1, #0x0
    5544:      	b.eq	0x55b4 <_stogir.locals.validate+0x6e0>
    5548:      	mov	x2, #0x1                ; =1
    554c:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		000000000000554c:  ARM64_RELOC_PAGE21	l_stogir.402
    5550:      	ldr	x1, [x1]
		0000000000005550:  ARM64_RELOC_PAGEOFF12	l_stogir.402
    5554:      	mov	x0, #0x23               ; =35
    5558:      	b	0x5440 <_stogir.locals.validate+0x56c>
    555c:      	add	x16, sp, #0x10
    5560:      	ldr	x20, [x16]
    5564:      	mov	x0, #0x1                ; =1
    5568:      	ubfx	x0, x0, #0, #32
    556c:      	lsr	x16, x0, #0
    5570:      	cmp	x16, #0x1
    5574:      	b.eq	0x5590 <_stogir.locals.validate+0x6bc>
    5578:      	b.lo	0x5580 <_stogir.locals.validate+0x6ac>
    557c:      	b	0x5594 <_stogir.locals.validate+0x6c0>
    5580:      	cmp	x16, #0x0
    5584:      	b.eq	0x558c <_stogir.locals.validate+0x6b8>
    5588:      	b	0x5594 <_stogir.locals.validate+0x6c0>
    558c:      	b	0x5598 <_stogir.locals.validate+0x6c4>
    5590:      	b	0x5504 <_stogir.locals.validate+0x630>
    5594:      	b	0x55d0 <_stogir.locals.validate+0x6fc>
    5598:      	mov	x2, #0x1                ; =1
    559c:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		000000000000559c:  ARM64_RELOC_PAGE21	l_stogir.403
    55a0:      	ldr	x1, [x1]
		00000000000055a0:  ARM64_RELOC_PAGEOFF12	l_stogir.403
    55a4:      	mov	x0, #0x19               ; =25
    55a8:      	b	0x5558 <_stogir.locals.validate+0x684>
    55ac:      	brk	#0
    55b0:      	b	0x55ac <_stogir.locals.validate+0x6d8>
    55b4:      	uxtb	w20, w20
    55b8:      	cmp	x20, #0x48
    55bc:      	b.eq	0x5548 <_stogir.locals.validate+0x674>
    55c0:      	and	x1, x0, #0xffffffff
    55c4:      	movz	x2, #0x0, lsl #48
    55c8:      	movz	x0, #0x0, lsl #48
    55cc:      	b	0x5558 <_stogir.locals.validate+0x684>
    55d0:      	brk	#0
    55d4:      	b	0x55d0 <_stogir.locals.validate+0x6fc>
    55d8:      	mov	x23, x8
    55dc:      	b	0x4fdc <_stogir.locals.validate+0x108>
    55e0:      	mov	x23, x8
    55e4:      	b	0x4fdc <_stogir.locals.validate+0x108>

00000000000055e8 <_stogir.conversion.validate>:
    55e8:      	sub	sp, sp, #0x40
    55ec:      	str	x29, [sp]
    55f0:      	str	x30, [sp, #0x8]
    55f4:      	mov	x29, sp
    55f8:      	str	x19, [sp, #0x30]
    55fc:      	sxtw	x1, w1
    5600:      	lsl	x3, x1, #2
    5604:      	cmp	x1, #0x0
    5608:      	cset	w4, gt
    560c:      	movz	x16, #0x0, lsl #48
    5610:      	sub	x5, x16, x1
    5614:      	sub	x6, x5, #0x1
    5618:      	uxtb	w16, w4
    561c:      	cmp	w16, wzr
    5620:      	b.eq	0x5660 <_stogir.conversion.validate+0x78>
    5624:      	ldr	x5, [x0, #0x8]
    5628:      	cmp	x1, x5
    562c:      	b.ge	0x56b0 <_stogir.conversion.validate+0xc8>
    5630:      	add	x5, x0, #0x78
    5634:      	ldr	x5, [x5, #0x8]
    5638:      	cmp	x1, x5
    563c:      	b.ge	0x5780 <_stogir.conversion.validate+0x198>
    5640:      	ldr	x5, [x0, #0x78]
    5644:      	add	x5, x3, x5
    5648:      	ldr	w5, [x5]
    564c:      	sxtw	x5, w5
    5650:      	cmp	x5, #0x0
    5654:      	cset	w5, ge
    5658:      	ubfx	x5, x5, #0, #8
    565c:      	b	0x5784 <_stogir.conversion.validate+0x19c>
    5660:      	cmp	x1, #0x0
    5664:      	b.ge	0x56b8 <_stogir.conversion.validate+0xd0>
    5668:      	add	x7, x0, #0x28
    566c:      	add	x9, x0, #0x50
    5670:      	ldr	x7, [x7, #0x8]
    5674:      	ldr	x9, [x9, #0x8]
    5678:      	cmp	x7, x9
    567c:      	b.ne	0x56a8 <_stogir.conversion.validate+0xc0>
    5680:      	cmp	x5, x7
    5684:      	b.gt	0x5814 <_stogir.conversion.validate+0x22c>
    5688:      	ldr	x5, [x0, #0x50]
    568c:      	add	x5, x5, x6, lsl #2
    5690:      	ldr	w5, [x5]
    5694:      	sxtw	x5, w5
    5698:      	cmp	x5, #0x0
    569c:      	cset	w5, gt
    56a0:      	ubfx	x5, x5, #0, #8
    56a4:      	b	0x5818 <_stogir.conversion.validate+0x230>
    56a8:      	movz	x5, #0x0, lsl #48
    56ac:      	b	0x56bc <_stogir.conversion.validate+0xd4>
    56b0:      	movz	x5, #0x0, lsl #48
    56b4:      	b	0x56bc <_stogir.conversion.validate+0xd4>
    56b8:      	movz	x5, #0x0, lsl #48
    56bc:      	cmp	x5, #0x0
    56c0:      	b.eq	0x56f4 <_stogir.conversion.validate+0x10c>
    56c4:      	uxtb	w16, w4
    56c8:      	cmp	w16, wzr
    56cc:      	b.eq	0x56e0 <_stogir.conversion.validate+0xf8>
    56d0:      	ldr	x4, [x0]
    56d4:      	add	x4, x4, x1, lsl #4
    56d8:      	ldr	x4, [x4]
    56dc:      	b	0x56ec <_stogir.conversion.validate+0x104>
    56e0:      	ldr	x4, [x0, #0x28]
    56e4:      	add	x4, x4, x6, lsl #4
    56e8:      	ldr	x4, [x4]
    56ec:      	mov	w5, #0x1                ; =1
    56f0:      	b	0x56fc <_stogir.conversion.validate+0x114>
    56f4:      	movz	w5, #0x0, lsl #16
    56f8:      	movz	x4, #0x0, lsl #48
    56fc:      	ubfx	x5, x5, #0, #32
    5700:      	lsr	x16, x5, #0
    5704:      	cmp	x16, #0x1
    5708:      	b.eq	0x5724 <_stogir.conversion.validate+0x13c>
    570c:      	b.lo	0x5714 <_stogir.conversion.validate+0x12c>
    5710:      	b	0x5728 <_stogir.conversion.validate+0x140>
    5714:      	cmp	x16, #0x0
    5718:      	b.eq	0x5720 <_stogir.conversion.validate+0x138>
    571c:      	b	0x5728 <_stogir.conversion.validate+0x140>
    5720:      	b	0x572c <_stogir.conversion.validate+0x144>
    5724:      	b	0x5760 <_stogir.conversion.validate+0x178>
    5728:      	b	0x5888 <_stogir.conversion.validate+0x2a0>
    572c:      	mov	x19, x8
    5730:      	mov	x0, #0x1                ; =1
    5734:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005734:  ARM64_RELOC_PAGE21	l_stogir.404
    5738:      	ldr	x1, [x1]
		0000000000005738:  ARM64_RELOC_PAGEOFF12	l_stogir.404
    573c:      	mov	x2, #0x12               ; =18
    5740:      	str	x0, [x19]
    5744:      	str	x1, [x19, #0x8]
    5748:      	str	x2, [x19, #0x10]
    574c:      	ldr	x19, [sp, #0x30]
    5750:      	ldr	x29, [sp]
    5754:      	ldr	x30, [sp, #0x8]
    5758:      	add	sp, sp, #0x40
    575c:      	ret
    5760:      	cmp	x1, #0x0
    5764:      	b.gt	0x5788 <_stogir.conversion.validate+0x1a0>
    5768:      	mov	x19, x8
    576c:      	mov	x0, #0x1                ; =1
    5770:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005770:  ARM64_RELOC_PAGE21	l_stogir.405
    5774:      	ldr	x1, [x1]
		0000000000005774:  ARM64_RELOC_PAGEOFF12	l_stogir.405
    5778:      	mov	x2, #0x1e               ; =30
    577c:      	b	0x5740 <_stogir.conversion.validate+0x158>
    5780:      	movz	x5, #0x0, lsl #48
    5784:      	b	0x56b4 <_stogir.conversion.validate+0xcc>
    5788:      	uxtb	w1, w4
    578c:      	orr	x5, x1, xzr
    5790:      	cmp	x5, #0x21
    5794:      	b.lt	0x599c <_stogir.conversion.validate+0x3b4>
    5798:      	cmp	x5, #0x27
    579c:      	b.gt	0x59a4 <_stogir.conversion.validate+0x3bc>
    57a0:      	ldr	x5, [x0, #0x78]
    57a4:      	add	x3, x3, x5
    57a8:      	ldr	w3, [x3]
    57ac:      	sxtw	x3, w3
    57b0:      	cmp	x3, #0x1
    57b4:      	b.ne	0x59ac <_stogir.conversion.validate+0x3c4>
    57b8:      	asr	x3, x4, #32
    57bc:      	cmp	x3, #0x0
    57c0:      	cset	w6, gt
    57c4:      	movz	x16, #0x0, lsl #48
    57c8:      	sub	x7, x16, x3
    57cc:      	sub	x9, x7, #0x1
    57d0:      	uxtb	w16, w6
    57d4:      	cmp	w16, wzr
    57d8:      	b.eq	0x5840 <_stogir.conversion.validate+0x258>
    57dc:      	ldr	x7, [x0, #0x8]
    57e0:      	cmp	x3, x7
    57e4:      	b.ge	0x5890 <_stogir.conversion.validate+0x2a8>
    57e8:      	add	x7, x0, #0x78
    57ec:      	ldr	x7, [x7, #0x8]
    57f0:      	cmp	x3, x7
    57f4:      	b.ge	0x592c <_stogir.conversion.validate+0x344>
    57f8:      	add	x5, x5, x3, lsl #2
    57fc:      	ldr	w5, [x5]
    5800:      	sxtw	x5, w5
    5804:      	cmp	x5, #0x0
    5808:      	cset	w5, ge
    580c:      	ubfx	x5, x5, #0, #8
    5810:      	b	0x5930 <_stogir.conversion.validate+0x348>
    5814:      	movz	x5, #0x0, lsl #48
    5818:      	b	0x56ac <_stogir.conversion.validate+0xc4>
    581c:      	uxtb	w3, w0
    5820:      	cmp	x3, #0x48
    5824:      	b.ne	0x5934 <_stogir.conversion.validate+0x34c>
    5828:      	mov	x19, x8
    582c:      	mov	x0, #0x1                ; =1
    5830:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005830:  ARM64_RELOC_PAGE21	l_stogir.406
    5834:      	ldr	x1, [x1]
		0000000000005834:  ARM64_RELOC_PAGEOFF12	l_stogir.406
    5838:      	mov	x2, #0x25               ; =37
    583c:      	b	0x577c <_stogir.conversion.validate+0x194>
    5840:      	cmp	x3, #0x0
    5844:      	b.ge	0x5898 <_stogir.conversion.validate+0x2b0>
    5848:      	add	x5, x0, #0x28
    584c:      	add	x10, x0, #0x50
    5850:      	ldr	x5, [x5, #0x8]
    5854:      	ldr	x10, [x10, #0x8]
    5858:      	cmp	x5, x10
    585c:      	b.ne	0x5924 <_stogir.conversion.validate+0x33c>
    5860:      	cmp	x7, x5
    5864:      	b.gt	0x598c <_stogir.conversion.validate+0x3a4>
    5868:      	ldr	x5, [x0, #0x50]
    586c:      	add	x5, x5, x9, lsl #2
    5870:      	ldr	w5, [x5]
    5874:      	sxtw	x5, w5
    5878:      	cmp	x5, #0x0
    587c:      	cset	w5, gt
    5880:      	ubfx	x5, x5, #0, #8
    5884:      	b	0x5990 <_stogir.conversion.validate+0x3a8>
    5888:      	brk	#0
    588c:      	b	0x5888 <_stogir.conversion.validate+0x2a0>
    5890:      	movz	x5, #0x0, lsl #48
    5894:      	b	0x589c <_stogir.conversion.validate+0x2b4>
    5898:      	movz	x5, #0x0, lsl #48
    589c:      	cmp	x5, #0x0
    58a0:      	b.eq	0x58d4 <_stogir.conversion.validate+0x2ec>
    58a4:      	uxtb	w16, w6
    58a8:      	cmp	w16, wzr
    58ac:      	b.eq	0x58c0 <_stogir.conversion.validate+0x2d8>
    58b0:      	ldr	x0, [x0]
    58b4:      	add	x0, x0, x3, lsl #4
    58b8:      	ldr	x0, [x0]
    58bc:      	b	0x58cc <_stogir.conversion.validate+0x2e4>
    58c0:      	ldr	x0, [x0, #0x28]
    58c4:      	add	x0, x0, x9, lsl #4
    58c8:      	ldr	x0, [x0]
    58cc:      	mov	w3, #0x1                ; =1
    58d0:      	b	0x58dc <_stogir.conversion.validate+0x2f4>
    58d4:      	movz	w3, #0x0, lsl #16
    58d8:      	movz	x0, #0x0, lsl #48
    58dc:      	ubfx	x3, x3, #0, #32
    58e0:      	lsr	x16, x3, #0
    58e4:      	cmp	x16, #0x1
    58e8:      	b.eq	0x5904 <_stogir.conversion.validate+0x31c>
    58ec:      	b.lo	0x58f4 <_stogir.conversion.validate+0x30c>
    58f0:      	b	0x5908 <_stogir.conversion.validate+0x320>
    58f4:      	cmp	x16, #0x0
    58f8:      	b.eq	0x5900 <_stogir.conversion.validate+0x318>
    58fc:      	b	0x5908 <_stogir.conversion.validate+0x320>
    5900:      	b	0x590c <_stogir.conversion.validate+0x324>
    5904:      	b	0x581c <_stogir.conversion.validate+0x234>
    5908:      	b	0x5994 <_stogir.conversion.validate+0x3ac>
    590c:      	mov	x19, x8
    5910:      	mov	x0, #0x1                ; =1
    5914:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005914:  ARM64_RELOC_PAGE21	l_stogir.407
    5918:      	ldr	x1, [x1]
		0000000000005918:  ARM64_RELOC_PAGEOFF12	l_stogir.407
    591c:      	mov	x2, #0x19               ; =25
    5920:      	b	0x583c <_stogir.conversion.validate+0x254>
    5924:      	movz	x5, #0x0, lsl #48
    5928:      	b	0x589c <_stogir.conversion.validate+0x2b4>
    592c:      	movz	x5, #0x0, lsl #48
    5930:      	b	0x5894 <_stogir.conversion.validate+0x2ac>
    5934:      	cmp	x3, #0x46
    5938:      	b.eq	0x59b4 <_stogir.conversion.validate+0x3cc>
    593c:      	ubfx	x4, x4, #0, #32
    5940:      	ubfx	x0, x0, #0, #32
    5944:      	ubfx	x3, x4, #8, #8
    5948:      	ubfx	x0, x0, #8, #8
    594c:      	mov	x19, x8
    5950:      	add	x8, sp, #0x10
    5954:      	fmov	s31, w0
    5958:      	mov	w0, w1
    595c:      	fmov	w1, s31
    5960:      	fmov	s31, w2
    5964:      	mov	w2, w3
    5968:      	fmov	w3, s31
    596c:      	bl	0x596c <_stogir.conversion.validate+0x384>
		000000000000596c:  ARM64_RELOC_BRANCH26	_stogir.conversion.policy
    5970:      	add	x16, sp, #0x10
    5974:      	ldr	x0, [x16]
    5978:      	add	x16, sp, #0x10
    597c:      	ldr	x1, [x16, #0x8]
    5980:      	add	x16, sp, #0x10
    5984:      	ldr	x2, [x16, #0x10]
    5988:      	b	0x583c <_stogir.conversion.validate+0x254>
    598c:      	movz	x5, #0x0, lsl #48
    5990:      	b	0x5928 <_stogir.conversion.validate+0x340>
    5994:      	brk	#0
    5998:      	b	0x5994 <_stogir.conversion.validate+0x3ac>
    599c:      	mov	x19, x8
    59a0:      	b	0x576c <_stogir.conversion.validate+0x184>
    59a4:      	mov	x19, x8
    59a8:      	b	0x576c <_stogir.conversion.validate+0x184>
    59ac:      	mov	x19, x8
    59b0:      	b	0x576c <_stogir.conversion.validate+0x184>
    59b4:      	mov	x19, x8
    59b8:      	b	0x582c <_stogir.conversion.validate+0x244>

00000000000059bc <_stogir.conditional.validate>:
    59bc:      	sub	sp, sp, #0x40
    59c0:      	str	x29, [sp]
    59c4:      	str	x30, [sp, #0x8]
    59c8:      	mov	x29, sp
    59cc:      	str	x19, [sp, #0x30]
    59d0:      	sxtw	x1, w1
    59d4:      	lsl	x2, x1, #2
    59d8:      	cmp	x1, #0x0
    59dc:      	cset	w3, gt
    59e0:      	movz	x16, #0x0, lsl #48
    59e4:      	sub	x4, x16, x1
    59e8:      	sub	x5, x4, #0x1
    59ec:      	uxtb	w16, w3
    59f0:      	cmp	w16, wzr
    59f4:      	b.eq	0x5a34 <_stogir.conditional.validate+0x78>
    59f8:      	ldr	x4, [x0, #0x8]
    59fc:      	cmp	x1, x4
    5a00:      	b.ge	0x5a84 <_stogir.conditional.validate+0xc8>
    5a04:      	add	x4, x0, #0x78
    5a08:      	ldr	x4, [x4, #0x8]
    5a0c:      	cmp	x1, x4
    5a10:      	b.ge	0x5b60 <_stogir.conditional.validate+0x1a4>
    5a14:      	ldr	x4, [x0, #0x78]
    5a18:      	add	x4, x2, x4
    5a1c:      	ldr	w4, [x4]
    5a20:      	sxtw	x4, w4
    5a24:      	cmp	x4, #0x0
    5a28:      	cset	w4, ge
    5a2c:      	ubfx	x4, x4, #0, #8
    5a30:      	b	0x5b64 <_stogir.conditional.validate+0x1a8>
    5a34:      	cmp	x1, #0x0
    5a38:      	b.ge	0x5a8c <_stogir.conditional.validate+0xd0>
    5a3c:      	add	x6, x0, #0x28
    5a40:      	add	x7, x0, #0x50
    5a44:      	ldr	x6, [x6, #0x8]
    5a48:      	ldr	x7, [x7, #0x8]
    5a4c:      	cmp	x6, x7
    5a50:      	b.ne	0x5a7c <_stogir.conditional.validate+0xc0>
    5a54:      	cmp	x4, x6
    5a58:      	b.gt	0x5be0 <_stogir.conditional.validate+0x224>
    5a5c:      	ldr	x4, [x0, #0x50]
    5a60:      	add	x4, x4, x5, lsl #2
    5a64:      	ldr	w4, [x4]
    5a68:      	sxtw	x4, w4
    5a6c:      	cmp	x4, #0x0
    5a70:      	cset	w4, gt
    5a74:      	ubfx	x4, x4, #0, #8
    5a78:      	b	0x5be4 <_stogir.conditional.validate+0x228>
    5a7c:      	movz	x4, #0x0, lsl #48
    5a80:      	b	0x5a90 <_stogir.conditional.validate+0xd4>
    5a84:      	movz	x4, #0x0, lsl #48
    5a88:      	b	0x5a90 <_stogir.conditional.validate+0xd4>
    5a8c:      	movz	x4, #0x0, lsl #48
    5a90:      	cmp	x4, #0x0
    5a94:      	b.eq	0x5ad0 <_stogir.conditional.validate+0x114>
    5a98:      	uxtb	w16, w3
    5a9c:      	cmp	w16, wzr
    5aa0:      	b.eq	0x5ab8 <_stogir.conditional.validate+0xfc>
    5aa4:      	ldr	x3, [x0]
    5aa8:      	add	x3, x3, x1, lsl #4
    5aac:      	ldr	x4, [x3]
    5ab0:      	ldr	x3, [x3, #0x8]
    5ab4:      	b	0x5ac8 <_stogir.conditional.validate+0x10c>
    5ab8:      	ldr	x3, [x0, #0x28]
    5abc:      	add	x3, x3, x5, lsl #4
    5ac0:      	ldr	x4, [x3]
    5ac4:      	ldr	x3, [x3, #0x8]
    5ac8:      	mov	w5, #0x1                ; =1
    5acc:      	b	0x5adc <_stogir.conditional.validate+0x120>
    5ad0:      	movz	w5, #0x0, lsl #16
    5ad4:      	movz	x4, #0x0, lsl #48
    5ad8:      	movz	x3, #0x0, lsl #48
    5adc:      	ubfx	x5, x5, #0, #32
    5ae0:      	lsr	x16, x5, #0
    5ae4:      	cmp	x16, #0x1
    5ae8:      	b.eq	0x5b04 <_stogir.conditional.validate+0x148>
    5aec:      	b.lo	0x5af4 <_stogir.conditional.validate+0x138>
    5af0:      	b	0x5b08 <_stogir.conditional.validate+0x14c>
    5af4:      	cmp	x16, #0x0
    5af8:      	b.eq	0x5b00 <_stogir.conditional.validate+0x144>
    5afc:      	b	0x5b08 <_stogir.conditional.validate+0x14c>
    5b00:      	b	0x5b0c <_stogir.conditional.validate+0x150>
    5b04:      	b	0x5b24 <_stogir.conditional.validate+0x168>
    5b08:      	b	0x5be8 <_stogir.conditional.validate+0x22c>
    5b0c:      	mov	x19, x8
    5b10:      	mov	x0, #0x1                ; =1
    5b14:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005b14:  ARM64_RELOC_PAGE21	l_stogir.408
    5b18:      	ldr	x1, [x1]
		0000000000005b18:  ARM64_RELOC_PAGEOFF12	l_stogir.408
    5b1c:      	mov	x2, #0x18               ; =24
    5b20:      	b	0x5b40 <_stogir.conditional.validate+0x184>
    5b24:      	cmp	x1, #0x0
    5b28:      	b.gt	0x5b68 <_stogir.conditional.validate+0x1ac>
    5b2c:      	mov	x19, x8
    5b30:      	mov	x0, #0x1                ; =1
    5b34:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005b34:  ARM64_RELOC_PAGE21	l_stogir.409
    5b38:      	ldr	x1, [x1]
		0000000000005b38:  ARM64_RELOC_PAGEOFF12	l_stogir.409
    5b3c:      	mov	x2, #0x18               ; =24
    5b40:      	str	x0, [x19]
    5b44:      	str	x1, [x19, #0x8]
    5b48:      	str	x2, [x19, #0x10]
    5b4c:      	ldr	x19, [sp, #0x30]
    5b50:      	ldr	x29, [sp]
    5b54:      	ldr	x30, [sp, #0x8]
    5b58:      	add	sp, sp, #0x40
    5b5c:      	ret
    5b60:      	movz	x4, #0x0, lsl #48
    5b64:      	b	0x5a88 <_stogir.conditional.validate+0xcc>
    5b68:      	uxtb	w1, w4
    5b6c:      	cmp	x1, #0x3c
    5b70:      	b.ne	0x5bf0 <_stogir.conditional.validate+0x234>
    5b74:      	ldr	x1, [x0, #0x78]
    5b78:      	add	x1, x2, x1
    5b7c:      	ldr	w1, [x1]
    5b80:      	sxtw	x1, w1
    5b84:      	cmp	x1, #0x3
    5b88:      	b.ne	0x5bf8 <_stogir.conditional.validate+0x23c>
    5b8c:      	orr	w1, w3, wzr
    5b90:      	orr	w2, w4, wzr
    5b94:      	lsr	x4, x4, #32
    5b98:      	lsr	x3, x3, #32
    5b9c:      	ubfx	x2, x2, #0, #32
    5ba0:      	ubfx	x2, x2, #8, #8
    5ba4:      	mov	x19, x8
    5ba8:      	add	x8, sp, #0x10
    5bac:      	fmov	s31, w1
    5bb0:      	mov	w1, w2
    5bb4:      	mov	w2, w4
    5bb8:      	mov	w4, w3
    5bbc:      	fmov	w3, s31
    5bc0:      	bl	0x5bc0 <_stogir.conditional.validate+0x204>
		0000000000005bc0:  ARM64_RELOC_BRANCH26	_stogir.conditional.operands
    5bc4:      	add	x16, sp, #0x10
    5bc8:      	ldr	x0, [x16]
    5bcc:      	add	x16, sp, #0x10
    5bd0:      	ldr	x1, [x16, #0x8]
    5bd4:      	add	x16, sp, #0x10
    5bd8:      	ldr	x2, [x16, #0x10]
    5bdc:      	b	0x5b40 <_stogir.conditional.validate+0x184>
    5be0:      	movz	x4, #0x0, lsl #48
    5be4:      	b	0x5a80 <_stogir.conditional.validate+0xc4>
    5be8:      	brk	#0
    5bec:      	b	0x5be8 <_stogir.conditional.validate+0x22c>
    5bf0:      	mov	x19, x8
    5bf4:      	b	0x5b30 <_stogir.conditional.validate+0x174>
    5bf8:      	mov	x19, x8
    5bfc:      	b	0x5b30 <_stogir.conditional.validate+0x174>

0000000000005c00 <_stogir.floating.validate>:
    5c00:      	sub	sp, sp, #0x50
    5c04:      	str	x29, [sp]
    5c08:      	str	x30, [sp, #0x8]
    5c0c:      	mov	x29, sp
    5c10:      	str	x19, [sp, #0x40]
    5c14:      	sxtw	x1, w1
    5c18:      	lsl	x2, x1, #2
    5c1c:      	cmp	x1, #0x0
    5c20:      	cset	w3, gt
    5c24:      	movz	x16, #0x0, lsl #48
    5c28:      	sub	x4, x16, x1
    5c2c:      	sub	x5, x4, #0x1
    5c30:      	uxtb	w16, w3
    5c34:      	cmp	w16, wzr
    5c38:      	b.eq	0x5c78 <_stogir.floating.validate+0x78>
    5c3c:      	ldr	x4, [x0, #0x8]
    5c40:      	cmp	x1, x4
    5c44:      	b.ge	0x5cc8 <_stogir.floating.validate+0xc8>
    5c48:      	add	x4, x0, #0x78
    5c4c:      	ldr	x4, [x4, #0x8]
    5c50:      	cmp	x1, x4
    5c54:      	b.ge	0x5db4 <_stogir.floating.validate+0x1b4>
    5c58:      	ldr	x4, [x0, #0x78]
    5c5c:      	add	x4, x2, x4
    5c60:      	ldr	w4, [x4]
    5c64:      	sxtw	x4, w4
    5c68:      	cmp	x4, #0x0
    5c6c:      	cset	w4, ge
    5c70:      	ubfx	x4, x4, #0, #8
    5c74:      	b	0x5db8 <_stogir.floating.validate+0x1b8>
    5c78:      	cmp	x1, #0x0
    5c7c:      	b.ge	0x5cd0 <_stogir.floating.validate+0xd0>
    5c80:      	add	x6, x0, #0x28
    5c84:      	add	x7, x0, #0x50
    5c88:      	ldr	x6, [x6, #0x8]
    5c8c:      	ldr	x7, [x7, #0x8]
    5c90:      	cmp	x6, x7
    5c94:      	b.ne	0x5cc0 <_stogir.floating.validate+0xc0>
    5c98:      	cmp	x4, x6
    5c9c:      	b.gt	0x5e40 <_stogir.floating.validate+0x240>
    5ca0:      	ldr	x4, [x0, #0x50]
    5ca4:      	add	x4, x4, x5, lsl #2
    5ca8:      	ldr	w4, [x4]
    5cac:      	sxtw	x4, w4
    5cb0:      	cmp	x4, #0x0
    5cb4:      	cset	w4, gt
    5cb8:      	ubfx	x4, x4, #0, #8
    5cbc:      	b	0x5e44 <_stogir.floating.validate+0x244>
    5cc0:      	movz	x4, #0x0, lsl #48
    5cc4:      	b	0x5cd4 <_stogir.floating.validate+0xd4>
    5cc8:      	movz	x4, #0x0, lsl #48
    5ccc:      	b	0x5cd4 <_stogir.floating.validate+0xd4>
    5cd0:      	movz	x4, #0x0, lsl #48
    5cd4:      	cmp	x4, #0x0
    5cd8:      	b.eq	0x5d14 <_stogir.floating.validate+0x114>
    5cdc:      	uxtb	w16, w3
    5ce0:      	cmp	w16, wzr
    5ce4:      	b.eq	0x5cfc <_stogir.floating.validate+0xfc>
    5ce8:      	ldr	x3, [x0]
    5cec:      	add	x3, x3, x1, lsl #4
    5cf0:      	ldr	x4, [x3]
    5cf4:      	ldr	x3, [x3, #0x8]
    5cf8:      	b	0x5d0c <_stogir.floating.validate+0x10c>
    5cfc:      	ldr	x3, [x0, #0x28]
    5d00:      	add	x3, x3, x5, lsl #4
    5d04:      	ldr	x4, [x3]
    5d08:      	ldr	x3, [x3, #0x8]
    5d0c:      	mov	w5, #0x1                ; =1
    5d10:      	b	0x5d20 <_stogir.floating.validate+0x120>
    5d14:      	movz	w5, #0x0, lsl #16
    5d18:      	movz	x4, #0x0, lsl #48
    5d1c:      	movz	x3, #0x0, lsl #48
    5d20:      	ubfx	x5, x5, #0, #32
    5d24:      	lsr	x16, x5, #0
    5d28:      	cmp	x16, #0x1
    5d2c:      	b.eq	0x5d48 <_stogir.floating.validate+0x148>
    5d30:      	b.lo	0x5d38 <_stogir.floating.validate+0x138>
    5d34:      	b	0x5d4c <_stogir.floating.validate+0x14c>
    5d38:      	cmp	x16, #0x0
    5d3c:      	b.eq	0x5d44 <_stogir.floating.validate+0x144>
    5d40:      	b	0x5d4c <_stogir.floating.validate+0x14c>
    5d44:      	b	0x5d50 <_stogir.floating.validate+0x150>
    5d48:      	b	0x5d84 <_stogir.floating.validate+0x184>
    5d4c:      	b	0x60b4 <_stogir.floating.validate+0x4b4>
    5d50:      	mov	x19, x8
    5d54:      	mov	x0, #0x1                ; =1
    5d58:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005d58:  ARM64_RELOC_PAGE21	l_stogir.410
    5d5c:      	ldr	x1, [x1]
		0000000000005d5c:  ARM64_RELOC_PAGEOFF12	l_stogir.410
    5d60:      	mov	x2, #0x1c               ; =28
    5d64:      	str	x0, [x19]
    5d68:      	str	x1, [x19, #0x8]
    5d6c:      	str	x2, [x19, #0x10]
    5d70:      	ldr	x19, [sp, #0x40]
    5d74:      	ldr	x29, [sp]
    5d78:      	ldr	x30, [sp, #0x8]
    5d7c:      	add	sp, sp, #0x50
    5d80:      	ret
    5d84:      	add	x16, sp, #0x10
    5d88:      	str	x4, [x16]
    5d8c:      	add	x16, sp, #0x10
    5d90:      	str	x3, [x16, #0x8]
    5d94:      	cmp	x1, #0x0
    5d98:      	b.gt	0x5dbc <_stogir.floating.validate+0x1bc>
    5d9c:      	mov	x19, x8
    5da0:      	mov	x0, #0x1                ; =1
    5da4:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005da4:  ARM64_RELOC_PAGE21	l_stogir.411
    5da8:      	ldr	x1, [x1]
		0000000000005da8:  ARM64_RELOC_PAGEOFF12	l_stogir.411
    5dac:      	mov	x2, #0x1c               ; =28
    5db0:      	b	0x5d64 <_stogir.floating.validate+0x164>
    5db4:      	movz	x4, #0x0, lsl #48
    5db8:      	b	0x5ccc <_stogir.floating.validate+0xcc>
    5dbc:      	uxtb	w4, w4
    5dc0:      	orr	x1, x4, xzr
    5dc4:      	cmp	x1, #0xe
    5dc8:      	cset	w3, ge
    5dcc:      	cmp	x1, #0x19
    5dd0:      	cset	w5, le
    5dd4:      	cmp	x1, #0x1f
    5dd8:      	cset	w6, eq
    5ddc:      	cmp	x1, #0x20
    5de0:      	cset	w7, eq
    5de4:      	uxtb	w16, w3
    5de8:      	cmp	w16, wzr
    5dec:      	b.eq	0x5e48 <_stogir.floating.validate+0x248>
    5df0:      	uxtb	w16, w5
    5df4:      	cmp	w16, wzr
    5df8:      	b.eq	0x5e48 <_stogir.floating.validate+0x248>
    5dfc:      	cmp	x1, #0x1d
    5e00:      	cset	w1, eq
    5e04:      	ldr	x9, [x0, #0x78]
    5e08:      	add	x2, x2, x9
    5e0c:      	ldr	w2, [x2]
    5e10:      	uxtb	w16, w6
    5e14:      	cmp	w16, wzr
    5e18:      	b.ne	0x5e88 <_stogir.floating.validate+0x288>
    5e1c:      	uxtb	w16, w7
    5e20:      	cmp	w16, wzr
    5e24:      	b.ne	0x5e88 <_stogir.floating.validate+0x288>
    5e28:      	uxtb	w16, w1
    5e2c:      	cmp	w16, wzr
    5e30:      	mov	w16, #0x3               ; =3
    5e34:      	mov	w17, #0x2               ; =2
    5e38:      	csel	w6, w16, w17, ne
    5e3c:      	b	0x5e8c <_stogir.floating.validate+0x28c>
    5e40:      	movz	x4, #0x0, lsl #48
    5e44:      	b	0x5cc4 <_stogir.floating.validate+0xc4>
    5e48:      	uxtb	w16, w6
    5e4c:      	cmp	w16, wzr
    5e50:      	b.ne	0x5dfc <_stogir.floating.validate+0x1fc>
    5e54:      	uxtb	w16, w7
    5e58:      	cmp	w16, wzr
    5e5c:      	b.ne	0x5dfc <_stogir.floating.validate+0x1fc>
    5e60:      	cmp	x1, #0x1a
    5e64:      	b.lt	0x5e70 <_stogir.floating.validate+0x270>
    5e68:      	cmp	x1, #0x1d
    5e6c:      	b.le	0x5dfc <_stogir.floating.validate+0x1fc>
    5e70:      	cmp	x1, #0x3a
    5e74:      	b.eq	0x5dfc <_stogir.floating.validate+0x1fc>
    5e78:      	cmp	x1, #0x3b
    5e7c:      	b.eq	0x5dfc <_stogir.floating.validate+0x1fc>
    5e80:      	mov	x19, x8
    5e84:      	b	0x5da0 <_stogir.floating.validate+0x1a0>
    5e88:      	mov	w6, #0x1                ; =1
    5e8c:      	sxtw	x2, w2
    5e90:      	sxtw	x6, w6
    5e94:      	cmp	x2, x6
    5e98:      	b.ne	0x60c4 <_stogir.floating.validate+0x4c4>
    5e9c:      	add	x16, sp, #0x10
    5ea0:      	ldr	w2, [x16, #0x4]
    5ea4:      	sxtw	x2, w2
    5ea8:      	cmp	x2, #0x0
    5eac:      	cset	w6, gt
    5eb0:      	movz	x16, #0x0, lsl #48
    5eb4:      	sub	x7, x16, x2
    5eb8:      	sub	x9, x7, #0x1
    5ebc:      	uxtb	w16, w6
    5ec0:      	cmp	w16, wzr
    5ec4:      	b.eq	0x5f18 <_stogir.floating.validate+0x318>
    5ec8:      	ldr	x7, [x0, #0x8]
    5ecc:      	cmp	x2, x7
    5ed0:      	b.ge	0x5f60 <_stogir.floating.validate+0x360>
    5ed4:      	add	x7, x0, #0x78
    5ed8:      	ldr	x7, [x7, #0x8]
    5edc:      	cmp	x2, x7
    5ee0:      	b.ge	0x602c <_stogir.floating.validate+0x42c>
    5ee4:      	ldr	x7, [x0, #0x78]
    5ee8:      	add	x7, x7, x2, lsl #2
    5eec:      	ldr	w7, [x7]
    5ef0:      	sxtw	x7, w7
    5ef4:      	cmp	x7, #0x0
    5ef8:      	cset	w7, ge
    5efc:      	ubfx	x7, x7, #0, #8
    5f00:      	b	0x6030 <_stogir.floating.validate+0x430>
    5f04:      	mov	x0, #0x1                ; =1
    5f08:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005f08:  ARM64_RELOC_PAGE21	l_stogir.412
    5f0c:      	ldr	x1, [x1]
		0000000000005f0c:  ARM64_RELOC_PAGEOFF12	l_stogir.412
    5f10:      	mov	x2, #0x1d               ; =29
    5f14:      	b	0x5db0 <_stogir.floating.validate+0x1b0>
    5f18:      	cmp	x2, #0x0
    5f1c:      	b.ge	0x5f68 <_stogir.floating.validate+0x368>
    5f20:      	add	x10, x0, #0x28
    5f24:      	add	x11, x0, #0x50
    5f28:      	ldr	x10, [x10, #0x8]
    5f2c:      	ldr	x11, [x11, #0x8]
    5f30:      	cmp	x10, x11
    5f34:      	b.ne	0x6024 <_stogir.floating.validate+0x424>
    5f38:      	cmp	x7, x10
    5f3c:      	b.gt	0x60ac <_stogir.floating.validate+0x4ac>
    5f40:      	ldr	x7, [x0, #0x50]
    5f44:      	add	x7, x7, x9, lsl #2
    5f48:      	ldr	w7, [x7]
    5f4c:      	sxtw	x7, w7
    5f50:      	cmp	x7, #0x0
    5f54:      	cset	w7, gt
    5f58:      	ubfx	x7, x7, #0, #8
    5f5c:      	b	0x60b0 <_stogir.floating.validate+0x4b0>
    5f60:      	movz	x7, #0x0, lsl #48
    5f64:      	b	0x5f6c <_stogir.floating.validate+0x36c>
    5f68:      	movz	x7, #0x0, lsl #48
    5f6c:      	cmp	x7, #0x0
    5f70:      	b.eq	0x5fa4 <_stogir.floating.validate+0x3a4>
    5f74:      	uxtb	w16, w6
    5f78:      	cmp	w16, wzr
    5f7c:      	b.eq	0x5f90 <_stogir.floating.validate+0x390>
    5f80:      	ldr	x6, [x0]
    5f84:      	add	x2, x6, x2, lsl #4
    5f88:      	ldr	x2, [x2]
    5f8c:      	b	0x5f9c <_stogir.floating.validate+0x39c>
    5f90:      	ldr	x2, [x0, #0x28]
    5f94:      	add	x2, x2, x9, lsl #4
    5f98:      	ldr	x2, [x2]
    5f9c:      	mov	w6, #0x1                ; =1
    5fa0:      	b	0x5fac <_stogir.floating.validate+0x3ac>
    5fa4:      	movz	w6, #0x0, lsl #16
    5fa8:      	movz	x2, #0x0, lsl #48
    5fac:      	ubfx	x6, x6, #0, #32
    5fb0:      	lsr	x16, x6, #0
    5fb4:      	cmp	x16, #0x1
    5fb8:      	b.eq	0x5fd4 <_stogir.floating.validate+0x3d4>
    5fbc:      	b.lo	0x5fc4 <_stogir.floating.validate+0x3c4>
    5fc0:      	b	0x5fd8 <_stogir.floating.validate+0x3d8>
    5fc4:      	cmp	x16, #0x0
    5fc8:      	b.eq	0x5fd0 <_stogir.floating.validate+0x3d0>
    5fcc:      	b	0x5fd8 <_stogir.floating.validate+0x3d8>
    5fd0:      	b	0x5fdc <_stogir.floating.validate+0x3dc>
    5fd4:      	b	0x5ff4 <_stogir.floating.validate+0x3f4>
    5fd8:      	b	0x60bc <_stogir.floating.validate+0x4bc>
    5fdc:      	mov	x19, x8
    5fe0:      	mov	x0, #0x1                ; =1
    5fe4:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x12c>
		0000000000005fe4:  ARM64_RELOC_PAGE21	l_stogir.413
    5fe8:      	ldr	x1, [x1]
		0000000000005fe8:  ARM64_RELOC_PAGEOFF12	l_stogir.413
    5fec:      	mov	x2, #0x18               ; =24
    5ff0:      	b	0x5f14 <_stogir.floating.validate+0x314>
    5ff4:      	add	x16, sp, #0x10
    5ff8:      	ldr	w6, [x16]
    5ffc:      	ubfx	x2, x2, #0, #32
    6000:      	ubfx	x2, x2, #8, #8
    6004:      	uxtb	w16, w3
    6008:      	cmp	w16, wzr
    600c:      	b.eq	0x6070 <_stogir.floating.validate+0x470>
    6010:      	uxtb	w16, w5
    6014:      	cmp	w16, wzr
    6018:      	b.eq	0x6070 <_stogir.floating.validate+0x470>
    601c:      	mov	w3, #0x1                ; =1
    6020:      	b	0x6074 <_stogir.floating.validate+0x474>
    6024:      	movz	x7, #0x0, lsl #48
    6028:      	b	0x5f6c <_stogir.floating.validate+0x36c>
    602c:      	movz	x7, #0x0, lsl #48
    6030:      	b	0x5f64 <_stogir.floating.validate+0x364>
    6034:      	movz	w1, #0x0, lsl #16
    6038:      	mov	x19, x8
    603c:      	add	x8, sp, #0x20
    6040:      	fmov	s31, w1
    6044:      	mov	w1, w4
    6048:      	mov	w4, w5
    604c:      	fmov	w5, s31
    6050:      	bl	0x6050 <_stogir.floating.validate+0x450>
		0000000000006050:  ARM64_RELOC_BRANCH26	_stogir.floating.operands
    6054:      	add	x16, sp, #0x20
    6058:      	ldr	x0, [x16]
    605c:      	add	x16, sp, #0x20
    6060:      	ldr	x1, [x16, #0x8]
    6064:      	add	x16, sp, #0x20
    6068:      	ldr	x2, [x16, #0x10]
    606c:      	b	0x5f14 <_stogir.floating.validate+0x314>
    6070:      	orr	x3, x2, xzr
    6074:      	sxtw	x3, w3
    6078:      	ubfx	x5, x6, #8, #8
    607c:      	cmp	x5, x3
    6080:      	b.ne	0x60cc <_stogir.floating.validate+0x4cc>
    6084:      	add	x16, sp, #0x10
    6088:      	ldr	w3, [x16, #0x4]
    608c:      	add	x16, sp, #0x10
    6090:      	ldr	w5, [x16, #0x8]
    6094:      	uxtb	w16, w1
    6098:      	cmp	w16, wzr
    609c:      	b.eq	0x6034 <_stogir.floating.validate+0x434>
    60a0:      	add	x16, sp, #0x10
    60a4:      	ldr	w1, [x16, #0xc]
    60a8:      	b	0x6038 <_stogir.floating.validate+0x438>
    60ac:      	movz	x7, #0x0, lsl #48
    60b0:      	b	0x6028 <_stogir.floating.validate+0x428>
    60b4:      	brk	#0
    60b8:      	b	0x60b4 <_stogir.floating.validate+0x4b4>
    60bc:      	brk	#0
    60c0:      	b	0x60bc <_stogir.floating.validate+0x4bc>
    60c4:      	mov	x19, x8
    60c8:      	b	0x5da0 <_stogir.floating.validate+0x1a0>
    60cc:      	mov	x19, x8
    60d0:      	b	0x5f04 <_stogir.floating.validate+0x304>

00000000000060d4 <_stogir.integer-unary.valid-type?>:
    60d4:      	sxtw	x0, w0
    60d8:      	cmp	x0, #0x2d
    60dc:      	cset	w2, eq
    60e0:      	cmp	x0, #0x1f
    60e4:      	cset	w3, eq
    60e8:      	cmp	x0, #0x20
    60ec:      	cset	w4, eq
    60f0:      	cmp	x0, #0x36
    60f4:      	cset	w5, eq
    60f8:      	uxtb	w16, w3
    60fc:      	cmp	w16, wzr
    6100:      	b.ne	0x6148 <_stogir.integer-unary.valid-type?+0x74>
    6104:      	uxtb	w16, w4
    6108:      	cmp	w16, wzr
    610c:      	b.ne	0x6148 <_stogir.integer-unary.valid-type?+0x74>
    6110:      	uxtb	w16, w2
    6114:      	cmp	w16, wzr
    6118:      	b.ne	0x6148 <_stogir.integer-unary.valid-type?+0x74>
    611c:      	uxtb	w16, w5
    6120:      	cmp	w16, wzr
    6124:      	b.ne	0x6148 <_stogir.integer-unary.valid-type?+0x74>
    6128:      	cmp	x0, #0x37
    612c:      	b.eq	0x6148 <_stogir.integer-unary.valid-type?+0x74>
    6130:      	cmp	x0, #0x38
    6134:      	b.eq	0x6148 <_stogir.integer-unary.valid-type?+0x74>
    6138:      	cmp	x0, #0x39
    613c:      	b.eq	0x6148 <_stogir.integer-unary.valid-type?+0x74>
    6140:      	movz	x0, #0x0, lsl #48
    6144:      	b	0x6180 <_stogir.integer-unary.valid-type?+0xac>
    6148:      	sxtw	x1, w1
    614c:      	cmp	x1, #0x1
    6150:      	b.lt	0x617c <_stogir.integer-unary.valid-type?+0xa8>
    6154:      	cmp	x1, #0xb
    6158:      	cset	w0, le
    615c:      	uxtb	w16, w0
    6160:      	cmp	w16, wzr
    6164:      	b.eq	0x617c <_stogir.integer-unary.valid-type?+0xa8>
    6168:      	uxtb	w16, w2
    616c:      	cmp	w16, wzr
    6170:      	b.eq	0x618c <_stogir.integer-unary.valid-type?+0xb8>
    6174:      	mov	x0, #0x1                ; =1
    6178:      	b	0x6188 <_stogir.integer-unary.valid-type?+0xb4>
    617c:      	movz	x0, #0x0, lsl #48
    6180:      	ret
    6184:      	mov	x0, #0x1                ; =1
    6188:      	b	0x6180 <_stogir.integer-unary.valid-type?+0xac>
    618c:      	cmp	x1, #0x1
    6190:      	b.ne	0x619c <_stogir.integer-unary.valid-type?+0xc8>
    6194:      	movz	x0, #0x0, lsl #48
    6198:      	b	0x6188 <_stogir.integer-unary.valid-type?+0xb4>
    619c:      	cmp	x1, #0x6
    61a0:      	cset	w2, eq
    61a4:      	uxtb	w16, w3
    61a8:      	cmp	w16, wzr
    61ac:      	b.eq	0x61c0 <_stogir.integer-unary.valid-type?+0xec>
    61b0:      	uxtb	w16, w2
    61b4:      	cmp	w16, wzr
    61b8:      	cset	x0, eq
    61bc:      	b	0x6188 <_stogir.integer-unary.valid-type?+0xb4>
    61c0:      	uxtb	w16, w4
    61c4:      	cmp	w16, wzr
    61c8:      	b.eq	0x61e4 <_stogir.integer-unary.valid-type?+0x110>
    61cc:      	cmp	x1, #0x7
    61d0:      	b.lt	0x61dc <_stogir.integer-unary.valid-type?+0x108>
    61d4:      	ubfx	x0, x0, #0, #8
    61d8:      	b	0x61e0 <_stogir.integer-unary.valid-type?+0x10c>
    61dc:      	movz	x0, #0x0, lsl #48
    61e0:      	b	0x6188 <_stogir.integer-unary.valid-type?+0xb4>
    61e4:      	uxtb	w16, w5
    61e8:      	cmp	w16, wzr
    61ec:      	b.eq	0x6184 <_stogir.integer-unary.valid-type?+0xb0>
    61f0:      	cmp	x1, #0x3
    61f4:      	b.ne	0x6210 <_stogir.integer-unary.valid-type?+0x13c>
    61f8:      	mov	x0, #0x1                ; =1
    61fc:      	b	0x620c <_stogir.integer-unary.valid-type?+0x138>
    6200:      	cmp	x1, #0xb
    6204:      	cset	w0, eq
    6208:      	ubfx	x0, x0, #0, #8
    620c:      	b	0x6188 <_stogir.integer-unary.valid-type?+0xb4>
    6210:      	cmp	x1, #0x4
    6214:      	b.ne	0x6220 <_stogir.integer-unary.valid-type?+0x14c>
    6218:      	mov	x0, #0x1                ; =1
    621c:      	b	0x620c <_stogir.integer-unary.valid-type?+0x138>
    6220:      	cmp	x1, #0x5
    6224:      	b.ne	0x6230 <_stogir.integer-unary.valid-type?+0x15c>
    6228:      	mov	x0, #0x1                ; =1
    622c:      	b	0x620c <_stogir.integer-unary.valid-type?+0x138>
    6230:      	uxtb	w16, w2
    6234:      	cmp	w16, wzr
    6238:      	b.eq	0x6244 <_stogir.integer-unary.valid-type?+0x170>
    623c:      	mov	x0, #0x1                ; =1
    6240:      	b	0x620c <_stogir.integer-unary.valid-type?+0x138>
    6244:      	cmp	x1, #0x9
    6248:      	b.ne	0x6254 <_stogir.integer-unary.valid-type?+0x180>
    624c:      	mov	x0, #0x1                ; =1
    6250:      	b	0x620c <_stogir.integer-unary.valid-type?+0x138>
    6254:      	cmp	x1, #0xa
    6258:      	b.ne	0x6200 <_stogir.integer-unary.valid-type?+0x12c>
    625c:      	mov	x0, #0x1                ; =1
    6260:      	b	0x620c <_stogir.integer-unary.valid-type?+0x138>

0000000000006264 <_stogir.types.vector?>:
    6264:      	sxtw	x1, w0
    6268:      	cmp	x1, #0xf
    626c:      	b.le	0x6298 <_stogir.types.vector?+0x34>
    6270:      	cmp	x1, #0x80
    6274:      	b.ge	0x62a8 <_stogir.types.vector?+0x44>
    6278:      	and	w0, w0, #0xf
    627c:      	ubfx	x0, x0, #0, #32
    6280:      	cmp	x0, #0x1
    6284:      	b.lt	0x62a0 <_stogir.types.vector?+0x3c>
    6288:      	cmp	x0, #0xd
    628c:      	cset	w0, le
    6290:      	ubfx	x0, x0, #0, #8
    6294:      	b	0x62a4 <_stogir.types.vector?+0x40>
    6298:      	movz	x0, #0x0, lsl #48
    629c:      	b	0x62a4 <_stogir.types.vector?+0x40>
    62a0:      	movz	x0, #0x0, lsl #48
    62a4:      	ret
    62a8:      	movz	x0, #0x0, lsl #48
    62ac:      	b	0x62a4 <_stogir.types.vector?+0x40>

00000000000062b0 <_stogir.floating.operation?>:
    62b0:      	sxtw	x0, w0
    62b4:      	cmp	x0, #0xe
    62b8:      	b.lt	0x62cc <_stogir.floating.operation?+0x1c>
    62bc:      	cmp	x0, #0x19
    62c0:      	b.gt	0x62cc <_stogir.floating.operation?+0x1c>
    62c4:      	mov	x0, #0x1                ; =1
    62c8:      	b	0x62f8 <_stogir.floating.operation?+0x48>
    62cc:      	cmp	x0, #0x1f
    62d0:      	b.eq	0x62f4 <_stogir.floating.operation?+0x44>
    62d4:      	cmp	x0, #0x20
    62d8:      	b.eq	0x62f4 <_stogir.floating.operation?+0x44>
    62dc:      	cmp	x0, #0x1a
    62e0:      	b.lt	0x630c <_stogir.floating.operation?+0x5c>
    62e4:      	cmp	x0, #0x1d
    62e8:      	b.gt	0x630c <_stogir.floating.operation?+0x5c>
    62ec:      	mov	x0, #0x1                ; =1
    62f0:      	b	0x6308 <_stogir.floating.operation?+0x58>
    62f4:      	mov	x0, #0x1                ; =1
    62f8:      	ret
    62fc:      	cmp	x0, #0x3b
    6300:      	cset	w0, eq
    6304:      	ubfx	x0, x0, #0, #8
    6308:      	b	0x62f8 <_stogir.floating.operation?+0x48>
    630c:      	cmp	x0, #0x3a
    6310:      	b.ne	0x62fc <_stogir.floating.operation?+0x4c>
    6314:      	mov	x0, #0x1                ; =1
    6318:      	b	0x6308 <_stogir.floating.operation?+0x58>

000000000000631c <_stogir.vector-lanes.validate>:
    631c:      	sub	sp, sp, #0x50
    6320:      	str	x29, [sp]
    6324:      	str	x30, [sp, #0x8]
    6328:      	mov	x29, sp
    632c:      	str	x19, [sp, #0x40]
    6330:      	sxtw	x1, w1
    6334:      	lsl	x3, x1, #2
    6338:      	cmp	x1, #0x0
    633c:      	cset	w4, gt
    6340:      	movz	x16, #0x0, lsl #48
    6344:      	sub	x5, x16, x1
    6348:      	sub	x6, x5, #0x1
    634c:      	uxtb	w16, w4
    6350:      	cmp	w16, wzr
    6354:      	b.eq	0x6394 <_stogir.vector-lanes.validate+0x78>
    6358:      	ldr	x5, [x0, #0x8]
    635c:      	cmp	x1, x5
    6360:      	b.ge	0x63e4 <_stogir.vector-lanes.validate+0xc8>
    6364:      	add	x5, x0, #0x78
    6368:      	ldr	x5, [x5, #0x8]
    636c:      	cmp	x1, x5
    6370:      	b.ge	0x64d0 <_stogir.vector-lanes.validate+0x1b4>
    6374:      	ldr	x5, [x0, #0x78]
    6378:      	add	x5, x3, x5
    637c:      	ldr	w5, [x5]
    6380:      	sxtw	x5, w5
    6384:      	cmp	x5, #0x0
    6388:      	cset	w5, ge
    638c:      	ubfx	x5, x5, #0, #8
    6390:      	b	0x64d4 <_stogir.vector-lanes.validate+0x1b8>
    6394:      	cmp	x1, #0x0
    6398:      	b.ge	0x63ec <_stogir.vector-lanes.validate+0xd0>
    639c:      	add	x7, x0, #0x28
    63a0:      	add	x9, x0, #0x50
    63a4:      	ldr	x7, [x7, #0x8]
    63a8:      	ldr	x9, [x9, #0x8]
    63ac:      	cmp	x7, x9
    63b0:      	b.ne	0x63dc <_stogir.vector-lanes.validate+0xc0>
    63b4:      	cmp	x5, x7
    63b8:      	b.gt	0x6514 <_stogir.vector-lanes.validate+0x1f8>
    63bc:      	ldr	x5, [x0, #0x50]
    63c0:      	add	x5, x5, x6, lsl #2
    63c4:      	ldr	w5, [x5]
    63c8:      	sxtw	x5, w5
    63cc:      	cmp	x5, #0x0
    63d0:      	cset	w5, gt
    63d4:      	ubfx	x5, x5, #0, #8
    63d8:      	b	0x6518 <_stogir.vector-lanes.validate+0x1fc>
    63dc:      	movz	x5, #0x0, lsl #48
    63e0:      	b	0x63f0 <_stogir.vector-lanes.validate+0xd4>
    63e4:      	movz	x5, #0x0, lsl #48
    63e8:      	b	0x63f0 <_stogir.vector-lanes.validate+0xd4>
    63ec:      	movz	x5, #0x0, lsl #48
    63f0:      	cmp	x5, #0x0
    63f4:      	b.eq	0x6430 <_stogir.vector-lanes.validate+0x114>
    63f8:      	uxtb	w16, w4
    63fc:      	cmp	w16, wzr
    6400:      	b.eq	0x6418 <_stogir.vector-lanes.validate+0xfc>
    6404:      	ldr	x4, [x0]
    6408:      	add	x4, x4, x1, lsl #4
    640c:      	ldr	x5, [x4]
    6410:      	ldr	x4, [x4, #0x8]
    6414:      	b	0x6428 <_stogir.vector-lanes.validate+0x10c>
    6418:      	ldr	x4, [x0, #0x28]
    641c:      	add	x4, x4, x6, lsl #4
    6420:      	ldr	x5, [x4]
    6424:      	ldr	x4, [x4, #0x8]
    6428:      	mov	w6, #0x1                ; =1
    642c:      	b	0x643c <_stogir.vector-lanes.validate+0x120>
    6430:      	movz	w6, #0x0, lsl #16
    6434:      	movz	x5, #0x0, lsl #48
    6438:      	movz	x4, #0x0, lsl #48
    643c:      	ubfx	x6, x6, #0, #32
    6440:      	lsr	x16, x6, #0
    6444:      	cmp	x16, #0x1
    6448:      	b.eq	0x6464 <_stogir.vector-lanes.validate+0x148>
    644c:      	b.lo	0x6454 <_stogir.vector-lanes.validate+0x138>
    6450:      	b	0x6468 <_stogir.vector-lanes.validate+0x14c>
    6454:      	cmp	x16, #0x0
    6458:      	b.eq	0x6460 <_stogir.vector-lanes.validate+0x144>
    645c:      	b	0x6468 <_stogir.vector-lanes.validate+0x14c>
    6460:      	b	0x646c <_stogir.vector-lanes.validate+0x150>
    6464:      	b	0x6484 <_stogir.vector-lanes.validate+0x168>
    6468:      	b	0x65d4 <_stogir.vector-lanes.validate+0x2b8>
    646c:      	mov	x19, x8
    6470:      	mov	x0, #0x1                ; =1
    6474:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x400>
		0000000000006474:  ARM64_RELOC_PAGE21	l_stogir.414
    6478:      	ldr	x1, [x1]
		0000000000006478:  ARM64_RELOC_PAGEOFF12	l_stogir.414
    647c:      	mov	x2, #0x1f               ; =31
    6480:      	b	0x64b0 <_stogir.vector-lanes.validate+0x194>
    6484:      	add	x16, sp, #0x10
    6488:      	str	x5, [x16]
    648c:      	add	x16, sp, #0x10
    6490:      	str	x4, [x16, #0x8]
    6494:      	cmp	x1, #0x0
    6498:      	b.gt	0x64d8 <_stogir.vector-lanes.validate+0x1bc>
    649c:      	mov	x19, x8
    64a0:      	mov	x0, #0x1                ; =1
    64a4:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x400>
		00000000000064a4:  ARM64_RELOC_PAGE21	l_stogir.415
    64a8:      	ldr	x1, [x1]
		00000000000064a8:  ARM64_RELOC_PAGEOFF12	l_stogir.415
    64ac:      	mov	x2, #0x25               ; =37
    64b0:      	str	x0, [x19]
    64b4:      	str	x1, [x19, #0x8]
    64b8:      	str	x2, [x19, #0x10]
    64bc:      	ldr	x19, [sp, #0x40]
    64c0:      	ldr	x29, [sp]
    64c4:      	ldr	x30, [sp, #0x8]
    64c8:      	add	sp, sp, #0x50
    64cc:      	ret
    64d0:      	movz	x5, #0x0, lsl #48
    64d4:      	b	0x63e8 <_stogir.vector-lanes.validate+0xcc>
    64d8:      	uxtb	w5, w5
    64dc:      	orr	x1, x5, xzr
    64e0:      	cmp	x1, #0x3d
    64e4:      	b.lt	0x65dc <_stogir.vector-lanes.validate+0x2c0>
    64e8:      	cmp	x1, #0x3f
    64ec:      	b.gt	0x65e4 <_stogir.vector-lanes.validate+0x2c8>
    64f0:      	cmp	x1, #0x3e
    64f4:      	cset	w4, eq
    64f8:      	ldr	x6, [x0, #0x78]
    64fc:      	add	x3, x3, x6
    6500:      	ldr	w3, [x3]
    6504:      	cmp	x1, #0x3d
    6508:      	b.ne	0x6570 <_stogir.vector-lanes.validate+0x254>
    650c:      	mov	w6, #0x2                ; =2
    6510:      	b	0x6584 <_stogir.vector-lanes.validate+0x268>
    6514:      	movz	x5, #0x0, lsl #48
    6518:      	b	0x63e0 <_stogir.vector-lanes.validate+0xc4>
    651c:      	movz	w4, #0x0, lsl #16
    6520:      	ubfx	x3, x3, #8, #8
    6524:      	mov	x19, x8
    6528:      	add	x8, sp, #0x20
    652c:      	fmov	s31, w1
    6530:      	mov	w1, w5
    6534:      	fmov	w5, s31
    6538:      	fmov	s31, w2
    653c:      	mov	w2, w3
    6540:      	fmov	w3, s31
    6544:      	fmov	s31, w4
    6548:      	mov	w4, w6
    654c:      	fmov	w6, s31
    6550:      	bl	0x6550 <_stogir.vector-lanes.validate+0x234>
		0000000000006550:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operands
    6554:      	add	x16, sp, #0x20
    6558:      	ldr	x0, [x16]
    655c:      	add	x16, sp, #0x20
    6560:      	ldr	x1, [x16, #0x8]
    6564:      	add	x16, sp, #0x20
    6568:      	ldr	x2, [x16, #0x10]
    656c:      	b	0x64b0 <_stogir.vector-lanes.validate+0x194>
    6570:      	uxtb	w16, w4
    6574:      	cmp	w16, wzr
    6578:      	mov	w16, #0x3               ; =3
    657c:      	mov	w17, #0x1               ; =1
    6580:      	csel	w6, w16, w17, ne
    6584:      	sxtw	x3, w3
    6588:      	sxtw	x6, w6
    658c:      	cmp	x3, x6
    6590:      	b.ne	0x65ec <_stogir.vector-lanes.validate+0x2d0>
    6594:      	add	x16, sp, #0x10
    6598:      	ldr	w3, [x16]
    659c:      	add	x16, sp, #0x10
    65a0:      	ldr	w6, [x16, #0x4]
    65a4:      	cmp	x1, #0x3f
    65a8:      	b.ne	0x65b4 <_stogir.vector-lanes.validate+0x298>
    65ac:      	movz	w1, #0x0, lsl #16
    65b0:      	b	0x65bc <_stogir.vector-lanes.validate+0x2a0>
    65b4:      	add	x16, sp, #0x10
    65b8:      	ldr	w1, [x16, #0x8]
    65bc:      	uxtb	w16, w4
    65c0:      	cmp	w16, wzr
    65c4:      	b.eq	0x651c <_stogir.vector-lanes.validate+0x200>
    65c8:      	add	x16, sp, #0x10
    65cc:      	ldr	w4, [x16, #0xc]
    65d0:      	b	0x6520 <_stogir.vector-lanes.validate+0x204>
    65d4:      	brk	#0
    65d8:      	b	0x65d4 <_stogir.vector-lanes.validate+0x2b8>
    65dc:      	mov	x19, x8
    65e0:      	b	0x64a0 <_stogir.vector-lanes.validate+0x184>
    65e4:      	mov	x19, x8
    65e8:      	b	0x64a0 <_stogir.vector-lanes.validate+0x184>
    65ec:      	mov	x19, x8
    65f0:      	b	0x64a0 <_stogir.vector-lanes.validate+0x184>

00000000000065f4 <_stogir.vector-comparison.node?>:
    65f4:      	sxtw	x1, w1
    65f8:      	cmp	x1, #0x0
    65fc:      	cset	w2, gt
    6600:      	movz	x16, #0x0, lsl #48
    6604:      	sub	x3, x16, x1
    6608:      	sub	x4, x3, #0x1
    660c:      	uxtb	w16, w2
    6610:      	cmp	w16, wzr
    6614:      	b.eq	0x6654 <_stogir.vector-comparison.node?+0x60>
    6618:      	ldr	x3, [x0, #0x8]
    661c:      	cmp	x1, x3
    6620:      	b.ge	0x66a4 <_stogir.vector-comparison.node?+0xb0>
    6624:      	add	x3, x0, #0x78
    6628:      	ldr	x3, [x3, #0x8]
    662c:      	cmp	x1, x3
    6630:      	b.ge	0x6780 <_stogir.vector-comparison.node?+0x18c>
    6634:      	ldr	x3, [x0, #0x78]
    6638:      	add	x3, x3, x1, lsl #2
    663c:      	ldr	w3, [x3]
    6640:      	sxtw	x3, w3
    6644:      	cmp	x3, #0x0
    6648:      	cset	w3, ge
    664c:      	ubfx	x3, x3, #0, #8
    6650:      	b	0x6784 <_stogir.vector-comparison.node?+0x190>
    6654:      	cmp	x1, #0x0
    6658:      	b.ge	0x66ac <_stogir.vector-comparison.node?+0xb8>
    665c:      	add	x5, x0, #0x28
    6660:      	add	x6, x0, #0x50
    6664:      	ldr	x5, [x5, #0x8]
    6668:      	ldr	x6, [x6, #0x8]
    666c:      	cmp	x5, x6
    6670:      	b.ne	0x669c <_stogir.vector-comparison.node?+0xa8>
    6674:      	cmp	x3, x5
    6678:      	b.gt	0x6788 <_stogir.vector-comparison.node?+0x194>
    667c:      	ldr	x3, [x0, #0x50]
    6680:      	add	x3, x3, x4, lsl #2
    6684:      	ldr	w3, [x3]
    6688:      	sxtw	x3, w3
    668c:      	cmp	x3, #0x0
    6690:      	cset	w3, gt
    6694:      	ubfx	x3, x3, #0, #8
    6698:      	b	0x678c <_stogir.vector-comparison.node?+0x198>
    669c:      	movz	x3, #0x0, lsl #48
    66a0:      	b	0x66b0 <_stogir.vector-comparison.node?+0xbc>
    66a4:      	movz	x3, #0x0, lsl #48
    66a8:      	b	0x66b0 <_stogir.vector-comparison.node?+0xbc>
    66ac:      	movz	x3, #0x0, lsl #48
    66b0:      	cmp	x3, #0x0
    66b4:      	b.eq	0x66e8 <_stogir.vector-comparison.node?+0xf4>
    66b8:      	uxtb	w16, w2
    66bc:      	cmp	w16, wzr
    66c0:      	b.eq	0x66d4 <_stogir.vector-comparison.node?+0xe0>
    66c4:      	ldr	x0, [x0]
    66c8:      	add	x0, x0, x1, lsl #4
    66cc:      	ldr	x0, [x0]
    66d0:      	b	0x66e0 <_stogir.vector-comparison.node?+0xec>
    66d4:      	ldr	x0, [x0, #0x28]
    66d8:      	add	x0, x0, x4, lsl #4
    66dc:      	ldr	x0, [x0]
    66e0:      	mov	w1, #0x1                ; =1
    66e4:      	b	0x66f0 <_stogir.vector-comparison.node?+0xfc>
    66e8:      	movz	w1, #0x0, lsl #16
    66ec:      	movz	x0, #0x0, lsl #48
    66f0:      	ubfx	x1, x1, #0, #32
    66f4:      	lsr	x16, x1, #0
    66f8:      	cmp	x16, #0x1
    66fc:      	b.eq	0x6718 <_stogir.vector-comparison.node?+0x124>
    6700:      	b.lo	0x6708 <_stogir.vector-comparison.node?+0x114>
    6704:      	b	0x671c <_stogir.vector-comparison.node?+0x128>
    6708:      	cmp	x16, #0x0
    670c:      	b.eq	0x6714 <_stogir.vector-comparison.node?+0x120>
    6710:      	b	0x671c <_stogir.vector-comparison.node?+0x128>
    6714:      	b	0x6720 <_stogir.vector-comparison.node?+0x12c>
    6718:      	b	0x6730 <_stogir.vector-comparison.node?+0x13c>
    671c:      	b	0x67a8 <_stogir.vector-comparison.node?+0x1b4>
    6720:      	movz	x0, #0x0, lsl #48
    6724:      	b	0x672c <_stogir.vector-comparison.node?+0x138>
    6728:      	movz	x0, #0x0, lsl #48
    672c:      	ret
    6730:      	uxtb	w1, w0
    6734:      	cmp	x1, #0xe
    6738:      	b.lt	0x6728 <_stogir.vector-comparison.node?+0x134>
    673c:      	cmp	x1, #0x19
    6740:      	b.gt	0x6728 <_stogir.vector-comparison.node?+0x134>
    6744:      	ubfx	x0, x0, #0, #32
    6748:      	ubfx	x0, x0, #8, #8
    674c:      	orr	x1, x0, xzr
    6750:      	cmp	x1, #0xf
    6754:      	b.le	0x6790 <_stogir.vector-comparison.node?+0x19c>
    6758:      	cmp	x1, #0x80
    675c:      	b.ge	0x6798 <_stogir.vector-comparison.node?+0x1a4>
    6760:      	and	w0, w0, #0xf
    6764:      	ubfx	x0, x0, #0, #32
    6768:      	cmp	x0, #0x1
    676c:      	b.lt	0x67a0 <_stogir.vector-comparison.node?+0x1ac>
    6770:      	cmp	x0, #0xd
    6774:      	cset	w0, le
    6778:      	ubfx	x0, x0, #0, #8
    677c:      	b	0x67a4 <_stogir.vector-comparison.node?+0x1b0>
    6780:      	movz	x3, #0x0, lsl #48
    6784:      	b	0x66a8 <_stogir.vector-comparison.node?+0xb4>
    6788:      	movz	x3, #0x0, lsl #48
    678c:      	b	0x66a0 <_stogir.vector-comparison.node?+0xac>
    6790:      	movz	x0, #0x0, lsl #48
    6794:      	b	0x672c <_stogir.vector-comparison.node?+0x138>
    6798:      	movz	x0, #0x0, lsl #48
    679c:      	b	0x6794 <_stogir.vector-comparison.node?+0x1a0>
    67a0:      	movz	x0, #0x0, lsl #48
    67a4:      	b	0x679c <_stogir.vector-comparison.node?+0x1a8>
    67a8:      	brk	#0
    67ac:      	b	0x67a8 <_stogir.vector-comparison.node?+0x1b4>

00000000000067b0 <_stogir.vector-comparison.validate>:
    67b0:      	sub	sp, sp, #0x50
    67b4:      	str	x29, [sp]
    67b8:      	str	x30, [sp, #0x8]
    67bc:      	mov	x29, sp
    67c0:      	str	x19, [sp, #0x40]
    67c4:      	sxtw	x1, w1
    67c8:      	lsl	x3, x1, #2
    67cc:      	cmp	x1, #0x0
    67d0:      	cset	w4, gt
    67d4:      	movz	x16, #0x0, lsl #48
    67d8:      	sub	x5, x16, x1
    67dc:      	sub	x6, x5, #0x1
    67e0:      	uxtb	w16, w4
    67e4:      	cmp	w16, wzr
    67e8:      	b.eq	0x6828 <_stogir.vector-comparison.validate+0x78>
    67ec:      	ldr	x5, [x0, #0x8]
    67f0:      	cmp	x1, x5
    67f4:      	b.ge	0x6878 <_stogir.vector-comparison.validate+0xc8>
    67f8:      	add	x5, x0, #0x78
    67fc:      	ldr	x5, [x5, #0x8]
    6800:      	cmp	x1, x5
    6804:      	b.ge	0x6968 <_stogir.vector-comparison.validate+0x1b8>
    6808:      	ldr	x5, [x0, #0x78]
    680c:      	add	x5, x3, x5
    6810:      	ldr	w5, [x5]
    6814:      	sxtw	x5, w5
    6818:      	cmp	x5, #0x0
    681c:      	cset	w5, ge
    6820:      	ubfx	x5, x5, #0, #8
    6824:      	b	0x696c <_stogir.vector-comparison.validate+0x1bc>
    6828:      	cmp	x1, #0x0
    682c:      	b.ge	0x6880 <_stogir.vector-comparison.validate+0xd0>
    6830:      	add	x7, x0, #0x28
    6834:      	add	x9, x0, #0x50
    6838:      	ldr	x7, [x7, #0x8]
    683c:      	ldr	x9, [x9, #0x8]
    6840:      	cmp	x7, x9
    6844:      	b.ne	0x6870 <_stogir.vector-comparison.validate+0xc0>
    6848:      	cmp	x5, x7
    684c:      	b.gt	0x69b8 <_stogir.vector-comparison.validate+0x208>
    6850:      	ldr	x5, [x0, #0x50]
    6854:      	add	x5, x5, x6, lsl #2
    6858:      	ldr	w5, [x5]
    685c:      	sxtw	x5, w5
    6860:      	cmp	x5, #0x0
    6864:      	cset	w5, gt
    6868:      	ubfx	x5, x5, #0, #8
    686c:      	b	0x69bc <_stogir.vector-comparison.validate+0x20c>
    6870:      	movz	x5, #0x0, lsl #48
    6874:      	b	0x6884 <_stogir.vector-comparison.validate+0xd4>
    6878:      	movz	x5, #0x0, lsl #48
    687c:      	b	0x6884 <_stogir.vector-comparison.validate+0xd4>
    6880:      	movz	x5, #0x0, lsl #48
    6884:      	lsl	x7, x1, #4
    6888:      	cmp	x5, #0x0
    688c:      	b.eq	0x68c8 <_stogir.vector-comparison.validate+0x118>
    6890:      	uxtb	w16, w4
    6894:      	cmp	w16, wzr
    6898:      	b.eq	0x68b0 <_stogir.vector-comparison.validate+0x100>
    689c:      	ldr	x4, [x0]
    68a0:      	add	x4, x7, x4
    68a4:      	ldr	x5, [x4]
    68a8:      	ldr	x4, [x4, #0x8]
    68ac:      	b	0x68c0 <_stogir.vector-comparison.validate+0x110>
    68b0:      	ldr	x4, [x0, #0x28]
    68b4:      	add	x4, x4, x6, lsl #4
    68b8:      	ldr	x5, [x4]
    68bc:      	ldr	x4, [x4, #0x8]
    68c0:      	mov	w6, #0x1                ; =1
    68c4:      	b	0x68d4 <_stogir.vector-comparison.validate+0x124>
    68c8:      	movz	w6, #0x0, lsl #16
    68cc:      	movz	x5, #0x0, lsl #48
    68d0:      	movz	x4, #0x0, lsl #48
    68d4:      	ubfx	x6, x6, #0, #32
    68d8:      	lsr	x16, x6, #0
    68dc:      	cmp	x16, #0x1
    68e0:      	b.eq	0x68fc <_stogir.vector-comparison.validate+0x14c>
    68e4:      	b.lo	0x68ec <_stogir.vector-comparison.validate+0x13c>
    68e8:      	b	0x6900 <_stogir.vector-comparison.validate+0x150>
    68ec:      	cmp	x16, #0x0
    68f0:      	b.eq	0x68f8 <_stogir.vector-comparison.validate+0x148>
    68f4:      	b	0x6900 <_stogir.vector-comparison.validate+0x150>
    68f8:      	b	0x6904 <_stogir.vector-comparison.validate+0x154>
    68fc:      	b	0x6938 <_stogir.vector-comparison.validate+0x188>
    6900:      	b	0x6ab8 <_stogir.vector-comparison.validate+0x308>
    6904:      	mov	x19, x8
    6908:      	mov	x0, #0x1                ; =1
    690c:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x400>
		000000000000690c:  ARM64_RELOC_PAGE21	l_stogir.416
    6910:      	ldr	x1, [x1]
		0000000000006910:  ARM64_RELOC_PAGEOFF12	l_stogir.416
    6914:      	mov	x2, #0x25               ; =37
    6918:      	str	x0, [x19]
    691c:      	str	x1, [x19, #0x8]
    6920:      	str	x2, [x19, #0x10]
    6924:      	ldr	x19, [sp, #0x40]
    6928:      	ldr	x29, [sp]
    692c:      	ldr	x30, [sp, #0x8]
    6930:      	add	sp, sp, #0x50
    6934:      	ret
    6938:      	add	x16, sp, #0x10
    693c:      	str	x5, [x16]
    6940:      	add	x16, sp, #0x10
    6944:      	str	x4, [x16, #0x8]
    6948:      	cmp	x1, #0x0
    694c:      	b.gt	0x6970 <_stogir.vector-comparison.validate+0x1c0>
    6950:      	mov	x19, x8
    6954:      	mov	x0, #0x1                ; =1
    6958:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x400>
		0000000000006958:  ARM64_RELOC_PAGE21	l_stogir.417
    695c:      	ldr	x1, [x1]
		000000000000695c:  ARM64_RELOC_PAGEOFF12	l_stogir.417
    6960:      	mov	x2, #0x2b               ; =43
    6964:      	b	0x6918 <_stogir.vector-comparison.validate+0x168>
    6968:      	movz	x5, #0x0, lsl #48
    696c:      	b	0x687c <_stogir.vector-comparison.validate+0xcc>
    6970:      	ldr	x4, [x0, #0x8]
    6974:      	cmp	x1, x4
    6978:      	b.ge	0x69c0 <_stogir.vector-comparison.validate+0x210>
    697c:      	add	x4, x0, #0x78
    6980:      	ldr	x4, [x4, #0x8]
    6984:      	cmp	x1, x4
    6988:      	b.ge	0x69c0 <_stogir.vector-comparison.validate+0x210>
    698c:      	ldr	x1, [x0, #0x78]
    6990:      	add	x1, x3, x1
    6994:      	ldr	w1, [x1]
    6998:      	sxtw	x1, w1
    699c:      	cmp	x1, #0x0
    69a0:      	b.lt	0x69c0 <_stogir.vector-comparison.validate+0x210>
    69a4:      	ldr	x1, [x0]
    69a8:      	add	x1, x7, x1
    69ac:      	ldr	x1, [x1]
    69b0:      	mov	w4, #0x1                ; =1
    69b4:      	b	0x69c8 <_stogir.vector-comparison.validate+0x218>
    69b8:      	movz	x5, #0x0, lsl #48
    69bc:      	b	0x6874 <_stogir.vector-comparison.validate+0xc4>
    69c0:      	movz	w4, #0x0, lsl #16
    69c4:      	movz	x1, #0x0, lsl #48
    69c8:      	ubfx	x4, x4, #0, #32
    69cc:      	lsr	x16, x4, #0
    69d0:      	cmp	x16, #0x1
    69d4:      	b.eq	0x69f0 <_stogir.vector-comparison.validate+0x240>
    69d8:      	b.lo	0x69e0 <_stogir.vector-comparison.validate+0x230>
    69dc:      	b	0x69f4 <_stogir.vector-comparison.validate+0x244>
    69e0:      	cmp	x16, #0x0
    69e4:      	b.eq	0x69ec <_stogir.vector-comparison.validate+0x23c>
    69e8:      	b	0x69f4 <_stogir.vector-comparison.validate+0x244>
    69ec:      	b	0x69f8 <_stogir.vector-comparison.validate+0x248>
    69f0:      	b	0x6a00 <_stogir.vector-comparison.validate+0x250>
    69f4:      	b	0x6ac0 <_stogir.vector-comparison.validate+0x310>
    69f8:      	mov	x19, x8
    69fc:      	b	0x6954 <_stogir.vector-comparison.validate+0x1a4>
    6a00:      	uxtb	w4, w1
    6a04:      	cmp	x4, #0xe
    6a08:      	b.lt	0x6ac8 <_stogir.vector-comparison.validate+0x318>
    6a0c:      	cmp	x4, #0x19
    6a10:      	b.gt	0x6ad0 <_stogir.vector-comparison.validate+0x320>
    6a14:      	ubfx	x1, x1, #0, #32
    6a18:      	ubfx	x1, x1, #8, #8
    6a1c:      	orr	x4, x1, xzr
    6a20:      	cmp	x4, #0xf
    6a24:      	b.le	0x6ad8 <_stogir.vector-comparison.validate+0x328>
    6a28:      	cmp	x4, #0x80
    6a2c:      	b.ge	0x6ae0 <_stogir.vector-comparison.validate+0x330>
    6a30:      	and	w1, w1, #0xf
    6a34:      	ubfx	x1, x1, #0, #32
    6a38:      	cmp	x1, #0x1
    6a3c:      	b.lt	0x6ae8 <_stogir.vector-comparison.validate+0x338>
    6a40:      	cmp	x1, #0xd
    6a44:      	b.gt	0x6af0 <_stogir.vector-comparison.validate+0x340>
    6a48:      	ldr	x1, [x0, #0x78]
    6a4c:      	add	x1, x3, x1
    6a50:      	ldr	w1, [x1]
    6a54:      	sxtw	x1, w1
    6a58:      	cmp	x1, #0x2
    6a5c:      	b.ne	0x6af8 <_stogir.vector-comparison.validate+0x348>
    6a60:      	add	x16, sp, #0x10
    6a64:      	ldr	w1, [x16]
    6a68:      	uxtb	w3, w1
    6a6c:      	add	x16, sp, #0x10
    6a70:      	ldr	w4, [x16, #0x4]
    6a74:      	ubfx	x1, x1, #8, #8
    6a78:      	add	x16, sp, #0x10
    6a7c:      	ldr	w5, [x16, #0x8]
    6a80:      	mov	x19, x8
    6a84:      	add	x8, sp, #0x20
    6a88:      	fmov	s31, w1
    6a8c:      	mov	w1, w3
    6a90:      	mov	w3, w2
    6a94:      	fmov	w2, s31
    6a98:      	bl	0x6a98 <_stogir.vector-comparison.validate+0x2e8>
		0000000000006a98:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.operands
    6a9c:      	add	x16, sp, #0x20
    6aa0:      	ldr	x0, [x16]
    6aa4:      	add	x16, sp, #0x20
    6aa8:      	ldr	x1, [x16, #0x8]
    6aac:      	add	x16, sp, #0x20
    6ab0:      	ldr	x2, [x16, #0x10]
    6ab4:      	b	0x6964 <_stogir.vector-comparison.validate+0x1b4>
    6ab8:      	brk	#0
    6abc:      	b	0x6ab8 <_stogir.vector-comparison.validate+0x308>
    6ac0:      	brk	#0
    6ac4:      	b	0x6ac0 <_stogir.vector-comparison.validate+0x310>
    6ac8:      	mov	x19, x8
    6acc:      	b	0x6954 <_stogir.vector-comparison.validate+0x1a4>
    6ad0:      	mov	x19, x8
    6ad4:      	b	0x6954 <_stogir.vector-comparison.validate+0x1a4>
    6ad8:      	mov	x19, x8
    6adc:      	b	0x6954 <_stogir.vector-comparison.validate+0x1a4>
    6ae0:      	mov	x19, x8
    6ae4:      	b	0x6954 <_stogir.vector-comparison.validate+0x1a4>
    6ae8:      	mov	x19, x8
    6aec:      	b	0x6954 <_stogir.vector-comparison.validate+0x1a4>
    6af0:      	mov	x19, x8
    6af4:      	b	0x6954 <_stogir.vector-comparison.validate+0x1a4>
    6af8:      	mov	x19, x8
    6afc:      	b	0x6954 <_stogir.vector-comparison.validate+0x1a4>

0000000000006b00 <_stogir.vector-arithmetic.node?>:
    6b00:      	sxtw	x1, w1
    6b04:      	cmp	x1, #0x0
    6b08:      	cset	w2, gt
    6b0c:      	movz	x16, #0x0, lsl #48
    6b10:      	sub	x3, x16, x1
    6b14:      	sub	x4, x3, #0x1
    6b18:      	uxtb	w16, w2
    6b1c:      	cmp	w16, wzr
    6b20:      	b.eq	0x6b60 <_stogir.vector-arithmetic.node?+0x60>
    6b24:      	ldr	x3, [x0, #0x8]
    6b28:      	cmp	x1, x3
    6b2c:      	b.ge	0x6bb0 <_stogir.vector-arithmetic.node?+0xb0>
    6b30:      	add	x3, x0, #0x78
    6b34:      	ldr	x3, [x3, #0x8]
    6b38:      	cmp	x1, x3
    6b3c:      	b.ge	0x6cd4 <_stogir.vector-arithmetic.node?+0x1d4>
    6b40:      	ldr	x3, [x0, #0x78]
    6b44:      	add	x3, x3, x1, lsl #2
    6b48:      	ldr	w3, [x3]
    6b4c:      	sxtw	x3, w3
    6b50:      	cmp	x3, #0x0
    6b54:      	cset	w3, ge
    6b58:      	ubfx	x3, x3, #0, #8
    6b5c:      	b	0x6cd8 <_stogir.vector-arithmetic.node?+0x1d8>
    6b60:      	cmp	x1, #0x0
    6b64:      	b.ge	0x6bb8 <_stogir.vector-arithmetic.node?+0xb8>
    6b68:      	add	x5, x0, #0x28
    6b6c:      	add	x6, x0, #0x50
    6b70:      	ldr	x5, [x5, #0x8]
    6b74:      	ldr	x6, [x6, #0x8]
    6b78:      	cmp	x5, x6
    6b7c:      	b.ne	0x6ba8 <_stogir.vector-arithmetic.node?+0xa8>
    6b80:      	cmp	x3, x5
    6b84:      	b.gt	0x6ce4 <_stogir.vector-arithmetic.node?+0x1e4>
    6b88:      	ldr	x3, [x0, #0x50]
    6b8c:      	add	x3, x3, x4, lsl #2
    6b90:      	ldr	w3, [x3]
    6b94:      	sxtw	x3, w3
    6b98:      	cmp	x3, #0x0
    6b9c:      	cset	w3, gt
    6ba0:      	ubfx	x3, x3, #0, #8
    6ba4:      	b	0x6ce8 <_stogir.vector-arithmetic.node?+0x1e8>
    6ba8:      	movz	x3, #0x0, lsl #48
    6bac:      	b	0x6bbc <_stogir.vector-arithmetic.node?+0xbc>
    6bb0:      	movz	x3, #0x0, lsl #48
    6bb4:      	b	0x6bbc <_stogir.vector-arithmetic.node?+0xbc>
    6bb8:      	movz	x3, #0x0, lsl #48
    6bbc:      	cmp	x3, #0x0
    6bc0:      	b.eq	0x6bf4 <_stogir.vector-arithmetic.node?+0xf4>
    6bc4:      	uxtb	w16, w2
    6bc8:      	cmp	w16, wzr
    6bcc:      	b.eq	0x6be0 <_stogir.vector-arithmetic.node?+0xe0>
    6bd0:      	ldr	x0, [x0]
    6bd4:      	add	x0, x0, x1, lsl #4
    6bd8:      	ldr	x0, [x0]
    6bdc:      	b	0x6bec <_stogir.vector-arithmetic.node?+0xec>
    6be0:      	ldr	x0, [x0, #0x28]
    6be4:      	add	x0, x0, x4, lsl #4
    6be8:      	ldr	x0, [x0]
    6bec:      	mov	w1, #0x1                ; =1
    6bf0:      	b	0x6bfc <_stogir.vector-arithmetic.node?+0xfc>
    6bf4:      	movz	w1, #0x0, lsl #16
    6bf8:      	movz	x0, #0x0, lsl #48
    6bfc:      	ubfx	x1, x1, #0, #32
    6c00:      	lsr	x16, x1, #0
    6c04:      	cmp	x16, #0x1
    6c08:      	b.eq	0x6c24 <_stogir.vector-arithmetic.node?+0x124>
    6c0c:      	b.lo	0x6c14 <_stogir.vector-arithmetic.node?+0x114>
    6c10:      	b	0x6c28 <_stogir.vector-arithmetic.node?+0x128>
    6c14:      	cmp	x16, #0x0
    6c18:      	b.eq	0x6c20 <_stogir.vector-arithmetic.node?+0x120>
    6c1c:      	b	0x6c28 <_stogir.vector-arithmetic.node?+0x128>
    6c20:      	b	0x6c2c <_stogir.vector-arithmetic.node?+0x12c>
    6c24:      	b	0x6c3c <_stogir.vector-arithmetic.node?+0x13c>
    6c28:      	b	0x6cf4 <_stogir.vector-arithmetic.node?+0x1f4>
    6c2c:      	movz	x0, #0x0, lsl #48
    6c30:      	b	0x6c38 <_stogir.vector-arithmetic.node?+0x138>
    6c34:      	movz	x0, #0x0, lsl #48
    6c38:      	ret
    6c3c:      	uxtb	w1, w0
    6c40:      	cmp	x1, #0x1f
    6c44:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6c48:      	cmp	x1, #0x20
    6c4c:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6c50:      	cmp	x1, #0x2d
    6c54:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6c58:      	cmp	x1, #0x36
    6c5c:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6c60:      	cmp	x1, #0x37
    6c64:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6c68:      	cmp	x1, #0x38
    6c6c:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6c70:      	cmp	x1, #0x39
    6c74:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6c78:      	cmp	x1, #0x3a
    6c7c:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6c80:      	cmp	x1, #0x3b
    6c84:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6c88:      	cmp	x1, #0x31
    6c8c:      	b.lt	0x6cfc <_stogir.vector-arithmetic.node?+0x1fc>
    6c90:      	cmp	x1, #0x35
    6c94:      	b.gt	0x6cfc <_stogir.vector-arithmetic.node?+0x1fc>
    6c98:      	ubfx	x0, x0, #0, #32
    6c9c:      	ubfx	x0, x0, #8, #8
    6ca0:      	orr	x1, x0, xzr
    6ca4:      	cmp	x1, #0xf
    6ca8:      	b.le	0x6c34 <_stogir.vector-arithmetic.node?+0x134>
    6cac:      	cmp	x1, #0x80
    6cb0:      	b.ge	0x6cdc <_stogir.vector-arithmetic.node?+0x1dc>
    6cb4:      	and	w0, w0, #0xf
    6cb8:      	ubfx	x0, x0, #0, #32
    6cbc:      	cmp	x0, #0x1
    6cc0:      	b.lt	0x6cec <_stogir.vector-arithmetic.node?+0x1ec>
    6cc4:      	cmp	x0, #0xd
    6cc8:      	cset	w0, le
    6ccc:      	ubfx	x0, x0, #0, #8
    6cd0:      	b	0x6cf0 <_stogir.vector-arithmetic.node?+0x1f0>
    6cd4:      	movz	x3, #0x0, lsl #48
    6cd8:      	b	0x6bb4 <_stogir.vector-arithmetic.node?+0xb4>
    6cdc:      	movz	x0, #0x0, lsl #48
    6ce0:      	b	0x6c38 <_stogir.vector-arithmetic.node?+0x138>
    6ce4:      	movz	x3, #0x0, lsl #48
    6ce8:      	b	0x6bac <_stogir.vector-arithmetic.node?+0xac>
    6cec:      	movz	x0, #0x0, lsl #48
    6cf0:      	b	0x6ce0 <_stogir.vector-arithmetic.node?+0x1e0>
    6cf4:      	brk	#0
    6cf8:      	b	0x6cf4 <_stogir.vector-arithmetic.node?+0x1f4>
    6cfc:      	cmp	x1, #0x1a
    6d00:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6d04:      	cmp	x1, #0x1b
    6d08:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6d0c:      	cmp	x1, #0x1c
    6d10:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6d14:      	cmp	x1, #0x1d
    6d18:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6d1c:      	cmp	x1, #0x1e
    6d20:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6d24:      	cmp	x1, #0x2e
    6d28:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6d2c:      	cmp	x1, #0x2f
    6d30:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6d34:      	cmp	x1, #0x30
    6d38:      	b.eq	0x6c98 <_stogir.vector-arithmetic.node?+0x198>
    6d3c:      	movz	x0, #0x0, lsl #48
    6d40:      	b	0x6c38 <_stogir.vector-arithmetic.node?+0x138>

0000000000006d44 <_stogir.vector-arithmetic.validate>:
    6d44:      	sub	sp, sp, #0x60
    6d48:      	str	x29, [sp]
    6d4c:      	str	x30, [sp, #0x8]
    6d50:      	mov	x29, sp
    6d54:      	str	x19, [sp, #0x40]
    6d58:      	str	x20, [sp, #0x48]
    6d5c:      	str	x21, [sp, #0x50]
    6d60:      	str	x22, [sp, #0x58]
    6d64:      	sxtw	x2, w1
    6d68:      	lsl	x19, x2, #2
    6d6c:      	cmp	x2, #0x0
    6d70:      	cset	w3, gt
    6d74:      	movz	x16, #0x0, lsl #48
    6d78:      	sub	x4, x16, x2
    6d7c:      	sub	x5, x4, #0x1
    6d80:      	uxtb	w16, w3
    6d84:      	cmp	w16, wzr
    6d88:      	b.eq	0x6dc8 <_stogir.vector-arithmetic.validate+0x84>
    6d8c:      	ldr	x4, [x0, #0x8]
    6d90:      	cmp	x2, x4
    6d94:      	b.ge	0x6e18 <_stogir.vector-arithmetic.validate+0xd4>
    6d98:      	add	x4, x0, #0x78
    6d9c:      	ldr	x4, [x4, #0x8]
    6da0:      	cmp	x2, x4
    6da4:      	b.ge	0x6f10 <_stogir.vector-arithmetic.validate+0x1cc>
    6da8:      	ldr	x4, [x0, #0x78]
    6dac:      	add	x4, x19, x4
    6db0:      	ldr	w4, [x4]
    6db4:      	sxtw	x4, w4
    6db8:      	cmp	x4, #0x0
    6dbc:      	cset	w4, ge
    6dc0:      	ubfx	x4, x4, #0, #8
    6dc4:      	b	0x6f14 <_stogir.vector-arithmetic.validate+0x1d0>
    6dc8:      	cmp	x2, #0x0
    6dcc:      	b.ge	0x6e20 <_stogir.vector-arithmetic.validate+0xdc>
    6dd0:      	add	x6, x0, #0x28
    6dd4:      	add	x7, x0, #0x50
    6dd8:      	ldr	x6, [x6, #0x8]
    6ddc:      	ldr	x7, [x7, #0x8]
    6de0:      	cmp	x6, x7
    6de4:      	b.ne	0x6e10 <_stogir.vector-arithmetic.validate+0xcc>
    6de8:      	cmp	x4, x6
    6dec:      	b.gt	0x6fa8 <_stogir.vector-arithmetic.validate+0x264>
    6df0:      	ldr	x4, [x0, #0x50]
    6df4:      	add	x4, x4, x5, lsl #2
    6df8:      	ldr	w4, [x4]
    6dfc:      	sxtw	x4, w4
    6e00:      	cmp	x4, #0x0
    6e04:      	cset	w4, gt
    6e08:      	ubfx	x4, x4, #0, #8
    6e0c:      	b	0x6fac <_stogir.vector-arithmetic.validate+0x268>
    6e10:      	movz	x4, #0x0, lsl #48
    6e14:      	b	0x6e24 <_stogir.vector-arithmetic.validate+0xe0>
    6e18:      	movz	x4, #0x0, lsl #48
    6e1c:      	b	0x6e24 <_stogir.vector-arithmetic.validate+0xe0>
    6e20:      	movz	x4, #0x0, lsl #48
    6e24:      	cmp	x4, #0x0
    6e28:      	b.eq	0x6e64 <_stogir.vector-arithmetic.validate+0x120>
    6e2c:      	uxtb	w16, w3
    6e30:      	cmp	w16, wzr
    6e34:      	b.eq	0x6e4c <_stogir.vector-arithmetic.validate+0x108>
    6e38:      	ldr	x3, [x0]
    6e3c:      	add	x3, x3, x2, lsl #4
    6e40:      	ldr	x20, [x3]
    6e44:      	ldr	x3, [x3, #0x8]
    6e48:      	b	0x6e5c <_stogir.vector-arithmetic.validate+0x118>
    6e4c:      	ldr	x3, [x0, #0x28]
    6e50:      	add	x3, x3, x5, lsl #4
    6e54:      	ldr	x20, [x3]
    6e58:      	ldr	x3, [x3, #0x8]
    6e5c:      	mov	w4, #0x1                ; =1
    6e60:      	b	0x6e70 <_stogir.vector-arithmetic.validate+0x12c>
    6e64:      	movz	w4, #0x0, lsl #16
    6e68:      	movz	x20, #0x0, lsl #48
    6e6c:      	movz	x3, #0x0, lsl #48
    6e70:      	ubfx	x4, x4, #0, #32
    6e74:      	lsr	x16, x4, #0
    6e78:      	cmp	x16, #0x1
    6e7c:      	b.eq	0x6e98 <_stogir.vector-arithmetic.validate+0x154>
    6e80:      	b.lo	0x6e88 <_stogir.vector-arithmetic.validate+0x144>
    6e84:      	b	0x6e9c <_stogir.vector-arithmetic.validate+0x158>
    6e88:      	cmp	x16, #0x0
    6e8c:      	b.eq	0x6e94 <_stogir.vector-arithmetic.validate+0x150>
    6e90:      	b	0x6e9c <_stogir.vector-arithmetic.validate+0x158>
    6e94:      	b	0x6ea0 <_stogir.vector-arithmetic.validate+0x15c>
    6e98:      	b	0x6eb8 <_stogir.vector-arithmetic.validate+0x174>
    6e9c:      	b	0x7040 <_stogir.vector-arithmetic.validate+0x2fc>
    6ea0:      	mov	x21, x8
    6ea4:      	mov	x0, #0x1                ; =1
    6ea8:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x400>
		0000000000006ea8:  ARM64_RELOC_PAGE21	l_stogir.418
    6eac:      	ldr	x1, [x1]
		0000000000006eac:  ARM64_RELOC_PAGEOFF12	l_stogir.418
    6eb0:      	mov	x2, #0x25               ; =37
    6eb4:      	b	0x6ee4 <_stogir.vector-arithmetic.validate+0x1a0>
    6eb8:      	add	x16, sp, #0x10
    6ebc:      	str	x20, [x16]
    6ec0:      	add	x16, sp, #0x10
    6ec4:      	str	x3, [x16, #0x8]
    6ec8:      	cmp	x2, #0x0
    6ecc:      	b.gt	0x6f18 <_stogir.vector-arithmetic.validate+0x1d4>
    6ed0:      	mov	x21, x8
    6ed4:      	mov	x0, #0x1                ; =1
    6ed8:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x400>
		0000000000006ed8:  ARM64_RELOC_PAGE21	l_stogir.419
    6edc:      	ldr	x1, [x1]
		0000000000006edc:  ARM64_RELOC_PAGEOFF12	l_stogir.419
    6ee0:      	mov	x2, #0x2b               ; =43
    6ee4:      	str	x0, [x21]
    6ee8:      	str	x1, [x21, #0x8]
    6eec:      	str	x2, [x21, #0x10]
    6ef0:      	ldr	x19, [sp, #0x40]
    6ef4:      	ldr	x20, [sp, #0x48]
    6ef8:      	ldr	x21, [sp, #0x50]
    6efc:      	ldr	x22, [sp, #0x58]
    6f00:      	ldr	x29, [sp]
    6f04:      	ldr	x30, [sp, #0x8]
    6f08:      	add	sp, sp, #0x60
    6f0c:      	ret
    6f10:      	movz	x4, #0x0, lsl #48
    6f14:      	b	0x6e1c <_stogir.vector-arithmetic.validate+0xd8>
    6f18:      	mov	x21, x8
    6f1c:      	mov	x22, x0
    6f20:      	bl	0x6f20 <_stogir.vector-arithmetic.validate+0x1dc>
		0000000000006f20:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    6f24:      	cmp	x0, #0x0
    6f28:      	b.eq	0x6ed4 <_stogir.vector-arithmetic.validate+0x190>
    6f2c:      	uxtb	w20, w20
    6f30:      	orr	x0, x20, xzr
    6f34:      	ldr	x1, [x22, #0x78]
    6f38:      	cmp	x0, #0x1d
    6f3c:      	cset	w2, eq
    6f40:      	cmp	x0, #0x1e
    6f44:      	cset	w3, eq
    6f48:      	add	x1, x19, x1
    6f4c:      	ldr	w1, [x1]
    6f50:      	cmp	x0, #0x1f
    6f54:      	b.eq	0x6ff4 <_stogir.vector-arithmetic.validate+0x2b0>
    6f58:      	cmp	x0, #0x20
    6f5c:      	b.eq	0x6ff4 <_stogir.vector-arithmetic.validate+0x2b0>
    6f60:      	cmp	x0, #0x2d
    6f64:      	b.eq	0x6ff4 <_stogir.vector-arithmetic.validate+0x2b0>
    6f68:      	cmp	x0, #0x36
    6f6c:      	b.eq	0x6ff4 <_stogir.vector-arithmetic.validate+0x2b0>
    6f70:      	cmp	x0, #0x37
    6f74:      	b.eq	0x6ff4 <_stogir.vector-arithmetic.validate+0x2b0>
    6f78:      	cmp	x0, #0x38
    6f7c:      	b.eq	0x6ff4 <_stogir.vector-arithmetic.validate+0x2b0>
    6f80:      	cmp	x0, #0x39
    6f84:      	b.eq	0x6ff4 <_stogir.vector-arithmetic.validate+0x2b0>
    6f88:      	uxtb	w16, w2
    6f8c:      	cmp	w16, wzr
    6f90:      	b.ne	0x7048 <_stogir.vector-arithmetic.validate+0x304>
    6f94:      	uxtb	w16, w3
    6f98:      	cmp	w16, wzr
    6f9c:      	b.ne	0x7048 <_stogir.vector-arithmetic.validate+0x304>
    6fa0:      	mov	w0, #0x2                ; =2
    6fa4:      	b	0x704c <_stogir.vector-arithmetic.validate+0x308>
    6fa8:      	movz	x4, #0x0, lsl #48
    6fac:      	b	0x6e14 <_stogir.vector-arithmetic.validate+0xd0>
    6fb0:      	add	x16, sp, #0x10
    6fb4:      	ldr	w2, [x16, #0xc]
    6fb8:      	ubfx	x0, x0, #8, #8
    6fbc:      	add	x8, sp, #0x20
    6fc0:      	mov	w3, w1
    6fc4:      	mov	w1, w20
    6fc8:      	mov	w5, w2
    6fcc:      	mov	w2, w0
    6fd0:      	mov	x0, x22
    6fd4:      	bl	0x6fd4 <_stogir.vector-arithmetic.validate+0x290>
		0000000000006fd4:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.operands
    6fd8:      	add	x16, sp, #0x20
    6fdc:      	ldr	x0, [x16]
    6fe0:      	add	x16, sp, #0x20
    6fe4:      	ldr	x1, [x16, #0x8]
    6fe8:      	add	x16, sp, #0x20
    6fec:      	ldr	x2, [x16, #0x10]
    6ff0:      	b	0x6ee4 <_stogir.vector-arithmetic.validate+0x1a0>
    6ff4:      	mov	w0, #0x1                ; =1
    6ff8:      	sxtw	x1, w1
    6ffc:      	sxtw	x0, w0
    7000:      	cmp	x1, x0
    7004:      	b.ne	0x6ed4 <_stogir.vector-arithmetic.validate+0x190>
    7008:      	add	x16, sp, #0x10
    700c:      	ldr	w0, [x16]
    7010:      	add	x16, sp, #0x10
    7014:      	ldr	w1, [x16, #0x4]
    7018:      	add	x16, sp, #0x10
    701c:      	ldr	w4, [x16, #0x8]
    7020:      	uxtb	w16, w2
    7024:      	cmp	w16, wzr
    7028:      	b.ne	0x6fb0 <_stogir.vector-arithmetic.validate+0x26c>
    702c:      	uxtb	w16, w3
    7030:      	cmp	w16, wzr
    7034:      	b.ne	0x6fb0 <_stogir.vector-arithmetic.validate+0x26c>
    7038:      	movz	w2, #0x0, lsl #16
    703c:      	b	0x6fb8 <_stogir.vector-arithmetic.validate+0x274>
    7040:      	brk	#0
    7044:      	b	0x7040 <_stogir.vector-arithmetic.validate+0x2fc>
    7048:      	mov	w0, #0x3                ; =3
    704c:      	b	0x6ff8 <_stogir.vector-arithmetic.validate+0x2b4>

0000000000007050 <_stogir.vector.memory-inputs>:
    7050:      	sub	sp, sp, #0x40
    7054:      	str	x29, [sp]
    7058:      	str	x30, [sp, #0x8]
    705c:      	mov	x29, sp
    7060:      	str	x19, [sp, #0x10]
    7064:      	str	x20, [sp, #0x18]
    7068:      	str	x21, [sp, #0x20]
    706c:      	str	x22, [sp, #0x28]
    7070:      	str	x23, [sp, #0x30]
    7074:      	str	x24, [sp, #0x38]
    7078:      	sxtw	x5, w1
    707c:      	cmp	x5, #0xf
    7080:      	b.le	0x74d8 <_stogir.vector.memory-inputs+0x488>
    7084:      	cmp	x5, #0x80
    7088:      	b.ge	0x74e0 <_stogir.vector.memory-inputs+0x490>
    708c:      	and	w5, w1, #0xf
    7090:      	ubfx	x5, x5, #0, #32
    7094:      	cmp	x5, #0x1
    7098:      	b.lt	0x74e8 <_stogir.vector.memory-inputs+0x498>
    709c:      	cmp	x5, #0xd
    70a0:      	b.gt	0x74f0 <_stogir.vector.memory-inputs+0x4a0>
    70a4:      	mov	x19, x8
    70a8:      	mov	x20, x0
    70ac:      	mov	w0, w1
    70b0:      	mov	w21, w1
    70b4:      	mov	w1, w2
    70b8:      	mov	w22, w2
    70bc:      	mov	w23, w3
    70c0:      	mov	w24, w4
    70c4:      	bl	0x70c4 <_stogir.vector.memory-inputs+0x74>
		00000000000070c4:  ARM64_RELOC_BRANCH26	_stogir.types.size
    70c8:      	sxtw	x0, w0
    70cc:      	cmp	x0, #0x0
    70d0:      	b.le	0x7134 <_stogir.vector.memory-inputs+0xe4>
    70d4:      	sxtw	x23, w23
    70d8:      	cmp	x23, #0x0
    70dc:      	cset	w0, gt
    70e0:      	movz	x16, #0x0, lsl #48
    70e4:      	sub	x1, x16, x23
    70e8:      	sub	x2, x1, #0x1
    70ec:      	uxtb	w16, w0
    70f0:      	cmp	w16, wzr
    70f4:      	b.eq	0x7208 <_stogir.vector.memory-inputs+0x1b8>
    70f8:      	ldr	x1, [x20, #0x8]
    70fc:      	cmp	x23, x1
    7100:      	b.ge	0x7200 <_stogir.vector.memory-inputs+0x1b0>
    7104:      	add	x1, x20, #0x78
    7108:      	ldr	x1, [x1, #0x8]
    710c:      	cmp	x23, x1
    7110:      	b.ge	0x72a0 <_stogir.vector.memory-inputs+0x250>
    7114:      	ldr	x1, [x20, #0x78]
    7118:      	add	x1, x1, x23, lsl #2
    711c:      	ldr	w1, [x1]
    7120:      	sxtw	x1, w1
    7124:      	cmp	x1, #0x0
    7128:      	cset	w1, ge
    712c:      	ubfx	x1, x1, #0, #8
    7130:      	b	0x72a4 <_stogir.vector.memory-inputs+0x254>
    7134:      	mov	x1, #0x1                ; =1
    7138:      	adrp	x0, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007138:  ARM64_RELOC_PAGE21	l_stogir.420
    713c:      	ldr	x0, [x0]
		000000000000713c:  ARM64_RELOC_PAGEOFF12	l_stogir.420
    7140:      	mov	x2, #0x32               ; =50
    7144:      	str	x1, [x19]
    7148:      	str	x0, [x19, #0x8]
    714c:      	str	x2, [x19, #0x10]
    7150:      	ldr	x19, [sp, #0x10]
    7154:      	ldr	x20, [sp, #0x18]
    7158:      	ldr	x21, [sp, #0x20]
    715c:      	ldr	x22, [sp, #0x28]
    7160:      	ldr	x23, [sp, #0x30]
    7164:      	ldr	x24, [sp, #0x38]
    7168:      	ldr	x29, [sp]
    716c:      	ldr	x30, [sp, #0x8]
    7170:      	add	sp, sp, #0x40
    7174:      	ret
    7178:      	movz	w1, #0x0, lsl #16
    717c:      	movz	x0, #0x0, lsl #48
    7180:      	ubfx	x1, x1, #0, #32
    7184:      	lsr	x16, x1, #0
    7188:      	cmp	x16, #0x1
    718c:      	b.eq	0x71a8 <_stogir.vector.memory-inputs+0x158>
    7190:      	b.lo	0x7198 <_stogir.vector.memory-inputs+0x148>
    7194:      	b	0x71ac <_stogir.vector.memory-inputs+0x15c>
    7198:      	cmp	x16, #0x0
    719c:      	b.eq	0x71a4 <_stogir.vector.memory-inputs+0x154>
    71a0:      	b	0x71ac <_stogir.vector.memory-inputs+0x15c>
    71a4:      	b	0x71b0 <_stogir.vector.memory-inputs+0x160>
    71a8:      	b	0x7250 <_stogir.vector.memory-inputs+0x200>
    71ac:      	b	0x74c0 <_stogir.vector.memory-inputs+0x470>
    71b0:      	mov	x1, #0x1                ; =1
    71b4:      	adrp	x0, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		00000000000071b4:  ARM64_RELOC_PAGE21	l_stogir.421
    71b8:      	ldr	x0, [x0]
		00000000000071b8:  ARM64_RELOC_PAGEOFF12	l_stogir.421
    71bc:      	mov	x2, #0x1d               ; =29
    71c0:      	b	0x7144 <_stogir.vector.memory-inputs+0xf4>
    71c4:      	ldr	x0, [x20, #0x28]
    71c8:      	add	x0, x0, x2, lsl #4
    71cc:      	ldr	x0, [x0]
    71d0:      	mov	w1, #0x1                ; =1
    71d4:      	b	0x7180 <_stogir.vector.memory-inputs+0x130>
    71d8:      	movz	x1, #0x0, lsl #48
    71dc:      	cmp	x1, #0x0
    71e0:      	b.eq	0x7178 <_stogir.vector.memory-inputs+0x128>
    71e4:      	uxtb	w16, w0
    71e8:      	cmp	w16, wzr
    71ec:      	b.eq	0x71c4 <_stogir.vector.memory-inputs+0x174>
    71f0:      	ldr	x0, [x20]
    71f4:      	add	x0, x0, x23, lsl #4
    71f8:      	ldr	x0, [x0]
    71fc:      	b	0x71d0 <_stogir.vector.memory-inputs+0x180>
    7200:      	movz	x1, #0x0, lsl #48
    7204:      	b	0x71dc <_stogir.vector.memory-inputs+0x18c>
    7208:      	cmp	x23, #0x0
    720c:      	b.ge	0x71d8 <_stogir.vector.memory-inputs+0x188>
    7210:      	add	x3, x20, #0x28
    7214:      	add	x4, x20, #0x50
    7218:      	ldr	x3, [x3, #0x8]
    721c:      	ldr	x4, [x4, #0x8]
    7220:      	cmp	x3, x4
    7224:      	b.ne	0x7298 <_stogir.vector.memory-inputs+0x248>
    7228:      	cmp	x1, x3
    722c:      	b.gt	0x72a8 <_stogir.vector.memory-inputs+0x258>
    7230:      	ldr	x1, [x20, #0x50]
    7234:      	add	x1, x1, x2, lsl #2
    7238:      	ldr	w1, [x1]
    723c:      	sxtw	x1, w1
    7240:      	cmp	x1, #0x0
    7244:      	cset	w1, gt
    7248:      	ubfx	x1, x1, #0, #8
    724c:      	b	0x72ac <_stogir.vector.memory-inputs+0x25c>
    7250:      	cmp	x23, #0x0
    7254:      	b.le	0x7284 <_stogir.vector.memory-inputs+0x234>
    7258:      	uxtb	w0, w0
    725c:      	cmp	x0, #0x83
    7260:      	cset	w1, lt
    7264:      	uxtb	w16, w1
    7268:      	cmp	w16, wzr
    726c:      	b.eq	0x72b0 <_stogir.vector.memory-inputs+0x260>
    7270:      	adrp	x17, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007270:  ARM64_RELOC_PAGE21	l_stogir.422
    7274:      	ldr	x17, [x17]
		0000000000007274:  ARM64_RELOC_PAGEOFF12	l_stogir.422
    7278:      	add	x2, x0, x17
    727c:      	ldrb	w2, [x2]
    7280:      	b	0x72b4 <_stogir.vector.memory-inputs+0x264>
    7284:      	mov	x1, #0x1                ; =1
    7288:      	adrp	x0, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007288:  ARM64_RELOC_PAGE21	l_stogir.423
    728c:      	ldr	x0, [x0]
		000000000000728c:  ARM64_RELOC_PAGEOFF12	l_stogir.423
    7290:      	mov	x2, #0x2c               ; =44
    7294:      	b	0x71c0 <_stogir.vector.memory-inputs+0x170>
    7298:      	movz	x1, #0x0, lsl #48
    729c:      	b	0x71dc <_stogir.vector.memory-inputs+0x18c>
    72a0:      	movz	x1, #0x0, lsl #48
    72a4:      	b	0x7204 <_stogir.vector.memory-inputs+0x1b4>
    72a8:      	movz	x1, #0x0, lsl #48
    72ac:      	b	0x729c <_stogir.vector.memory-inputs+0x24c>
    72b0:      	movz	w2, #0x0, lsl #16
    72b4:      	uxtb	w16, w2
    72b8:      	and	w2, w16, #0x1
    72bc:      	uxtb	w2, w2
    72c0:      	ubfx	x2, x2, #0, #8
    72c4:      	cmp	x2, #0x0
    72c8:      	b.eq	0x7284 <_stogir.vector.memory-inputs+0x234>
    72cc:      	uxtb	w16, w1
    72d0:      	cmp	w16, wzr
    72d4:      	b.eq	0x72ec <_stogir.vector.memory-inputs+0x29c>
    72d8:      	adrp	x17, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		00000000000072d8:  ARM64_RELOC_PAGE21	l_stogir.422
    72dc:      	ldr	x17, [x17]
		00000000000072dc:  ARM64_RELOC_PAGEOFF12	l_stogir.422
    72e0:      	add	x0, x0, x17
    72e4:      	ldrb	w0, [x0]
    72e8:      	b	0x72f0 <_stogir.vector.memory-inputs+0x2a0>
    72ec:      	movz	w0, #0x0, lsl #16
    72f0:      	uxtb	w16, w0
    72f4:      	and	w0, w16, #0x4
    72f8:      	uxtb	w0, w0
    72fc:      	ubfx	x0, x0, #0, #8
    7300:      	cmp	x0, #0x0
    7304:      	cset	w0, eq
    7308:      	uxtb	w16, w0
    730c:      	cmp	w16, wzr
    7310:      	cset	x0, eq
    7314:      	cmp	x0, #0x0
    7318:      	b.ne	0x7284 <_stogir.vector.memory-inputs+0x234>
    731c:      	sxtw	x24, w24
    7320:      	cmp	x24, #0x0
    7324:      	cset	w0, gt
    7328:      	movz	x16, #0x0, lsl #48
    732c:      	sub	x1, x16, x24
    7330:      	sub	x2, x1, #0x1
    7334:      	uxtb	w16, w0
    7338:      	cmp	w16, wzr
    733c:      	b.eq	0x7390 <_stogir.vector.memory-inputs+0x340>
    7340:      	ldr	x1, [x20, #0x8]
    7344:      	cmp	x24, x1
    7348:      	b.ge	0x73d8 <_stogir.vector.memory-inputs+0x388>
    734c:      	add	x1, x20, #0x78
    7350:      	ldr	x1, [x1, #0x8]
    7354:      	cmp	x24, x1
    7358:      	b.ge	0x74b8 <_stogir.vector.memory-inputs+0x468>
    735c:      	ldr	x1, [x20, #0x78]
    7360:      	add	x1, x1, x24, lsl #2
    7364:      	ldr	w1, [x1]
    7368:      	sxtw	x1, w1
    736c:      	cmp	x1, #0x0
    7370:      	cset	w1, ge
    7374:      	ubfx	x1, x1, #0, #8
    7378:      	b	0x74bc <_stogir.vector.memory-inputs+0x46c>
    737c:      	mov	x1, #0x1                ; =1
    7380:      	adrp	x0, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007380:  ARM64_RELOC_PAGE21	l_stogir.424
    7384:      	ldr	x0, [x0]
		0000000000007384:  ARM64_RELOC_PAGEOFF12	l_stogir.424
    7388:      	mov	x2, #0x2b               ; =43
    738c:      	b	0x7294 <_stogir.vector.memory-inputs+0x244>
    7390:      	cmp	x24, #0x0
    7394:      	b.ge	0x73e0 <_stogir.vector.memory-inputs+0x390>
    7398:      	add	x3, x20, #0x28
    739c:      	add	x4, x20, #0x50
    73a0:      	ldr	x3, [x3, #0x8]
    73a4:      	ldr	x4, [x4, #0x8]
    73a8:      	cmp	x3, x4
    73ac:      	b.ne	0x74b0 <_stogir.vector.memory-inputs+0x460>
    73b0:      	cmp	x1, x3
    73b4:      	b.gt	0x74c8 <_stogir.vector.memory-inputs+0x478>
    73b8:      	ldr	x1, [x20, #0x50]
    73bc:      	add	x1, x1, x2, lsl #2
    73c0:      	ldr	w1, [x1]
    73c4:      	sxtw	x1, w1
    73c8:      	cmp	x1, #0x0
    73cc:      	cset	w1, gt
    73d0:      	ubfx	x1, x1, #0, #8
    73d4:      	b	0x74cc <_stogir.vector.memory-inputs+0x47c>
    73d8:      	movz	x1, #0x0, lsl #48
    73dc:      	b	0x73e4 <_stogir.vector.memory-inputs+0x394>
    73e0:      	movz	x1, #0x0, lsl #48
    73e4:      	cmp	x1, #0x0
    73e8:      	b.eq	0x741c <_stogir.vector.memory-inputs+0x3cc>
    73ec:      	uxtb	w16, w0
    73f0:      	cmp	w16, wzr
    73f4:      	b.eq	0x7408 <_stogir.vector.memory-inputs+0x3b8>
    73f8:      	ldr	x0, [x20]
    73fc:      	add	x0, x0, x24, lsl #4
    7400:      	ldr	x0, [x0]
    7404:      	b	0x7414 <_stogir.vector.memory-inputs+0x3c4>
    7408:      	ldr	x0, [x20, #0x28]
    740c:      	add	x0, x0, x2, lsl #4
    7410:      	ldr	x0, [x0]
    7414:      	mov	w1, #0x1                ; =1
    7418:      	b	0x7424 <_stogir.vector.memory-inputs+0x3d4>
    741c:      	movz	w1, #0x0, lsl #16
    7420:      	movz	x0, #0x0, lsl #48
    7424:      	ubfx	x1, x1, #0, #32
    7428:      	lsr	x16, x1, #0
    742c:      	cmp	x16, #0x1
    7430:      	b.eq	0x744c <_stogir.vector.memory-inputs+0x3fc>
    7434:      	b.lo	0x743c <_stogir.vector.memory-inputs+0x3ec>
    7438:      	b	0x7450 <_stogir.vector.memory-inputs+0x400>
    743c:      	cmp	x16, #0x0
    7440:      	b.eq	0x7448 <_stogir.vector.memory-inputs+0x3f8>
    7444:      	b	0x7450 <_stogir.vector.memory-inputs+0x400>
    7448:      	b	0x7454 <_stogir.vector.memory-inputs+0x404>
    744c:      	b	0x7468 <_stogir.vector.memory-inputs+0x418>
    7450:      	b	0x74d0 <_stogir.vector.memory-inputs+0x480>
    7454:      	mov	x1, #0x1                ; =1
    7458:      	adrp	x0, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007458:  ARM64_RELOC_PAGE21	l_stogir.425
    745c:      	ldr	x0, [x0]
		000000000000745c:  ARM64_RELOC_PAGEOFF12	l_stogir.425
    7460:      	mov	x2, #0x1d               ; =29
    7464:      	b	0x738c <_stogir.vector.memory-inputs+0x33c>
    7468:      	orr	w1, w0, wzr
    746c:      	ubfx	x1, x1, #0, #32
    7470:      	ubfx	x1, x1, #8, #8
    7474:      	cmp	x1, #0x6
    7478:      	b.ne	0x737c <_stogir.vector.memory-inputs+0x32c>
    747c:      	uxtb	w0, w0
    7480:      	cmp	x0, #0x48
    7484:      	b.eq	0x737c <_stogir.vector.memory-inputs+0x32c>
    7488:      	cmp	x0, #0x46
    748c:      	b.eq	0x737c <_stogir.vector.memory-inputs+0x32c>
    7490:      	mov	w0, w21
    7494:      	mov	w1, w22
    7498:      	bl	0x7498 <_stogir.vector.memory-inputs+0x448>
		0000000000007498:  ARM64_RELOC_BRANCH26	_stogir.types.size
    749c:      	sxtw	x0, w0
    74a0:      	and	x0, x0, #0xffffffff
    74a4:      	movz	x1, #0x0, lsl #48
    74a8:      	movz	x2, #0x0, lsl #48
    74ac:      	b	0x738c <_stogir.vector.memory-inputs+0x33c>
    74b0:      	movz	x1, #0x0, lsl #48
    74b4:      	b	0x73e4 <_stogir.vector.memory-inputs+0x394>
    74b8:      	movz	x1, #0x0, lsl #48
    74bc:      	b	0x73dc <_stogir.vector.memory-inputs+0x38c>
    74c0:      	brk	#0
    74c4:      	b	0x74c0 <_stogir.vector.memory-inputs+0x470>
    74c8:      	movz	x1, #0x0, lsl #48
    74cc:      	b	0x74b4 <_stogir.vector.memory-inputs+0x464>
    74d0:      	brk	#0
    74d4:      	b	0x74d0 <_stogir.vector.memory-inputs+0x480>
    74d8:      	mov	x19, x8
    74dc:      	b	0x7134 <_stogir.vector.memory-inputs+0xe4>
    74e0:      	mov	x19, x8
    74e4:      	b	0x7134 <_stogir.vector.memory-inputs+0xe4>
    74e8:      	mov	x19, x8
    74ec:      	b	0x7134 <_stogir.vector.memory-inputs+0xe4>
    74f0:      	mov	x19, x8
    74f4:      	b	0x7134 <_stogir.vector.memory-inputs+0xe4>

00000000000074f8 <_stogir.vector.store-inputs>:
    74f8:      	sub	sp, sp, #0x40
    74fc:      	str	x29, [sp]
    7500:      	str	x30, [sp, #0x8]
    7504:      	mov	x29, sp
    7508:      	str	x19, [sp, #0x30]
    750c:      	sxtw	x4, w4
    7510:      	cmp	x4, #0x0
    7514:      	cset	w5, gt
    7518:      	movz	x16, #0x0, lsl #48
    751c:      	sub	x6, x16, x4
    7520:      	sub	x7, x6, #0x1
    7524:      	uxtb	w16, w5
    7528:      	cmp	w16, wzr
    752c:      	b.eq	0x756c <_stogir.vector.store-inputs+0x74>
    7530:      	ldr	x6, [x0, #0x8]
    7534:      	cmp	x4, x6
    7538:      	b.ge	0x75bc <_stogir.vector.store-inputs+0xc4>
    753c:      	add	x6, x0, #0x78
    7540:      	ldr	x6, [x6, #0x8]
    7544:      	cmp	x4, x6
    7548:      	b.ge	0x76b0 <_stogir.vector.store-inputs+0x1b8>
    754c:      	ldr	x6, [x0, #0x78]
    7550:      	add	x6, x6, x4, lsl #2
    7554:      	ldr	w6, [x6]
    7558:      	sxtw	x6, w6
    755c:      	cmp	x6, #0x0
    7560:      	cset	w6, ge
    7564:      	ubfx	x6, x6, #0, #8
    7568:      	b	0x76b4 <_stogir.vector.store-inputs+0x1bc>
    756c:      	cmp	x4, #0x0
    7570:      	b.ge	0x75c4 <_stogir.vector.store-inputs+0xcc>
    7574:      	add	x9, x0, #0x28
    7578:      	add	x10, x0, #0x50
    757c:      	ldr	x9, [x9, #0x8]
    7580:      	ldr	x10, [x10, #0x8]
    7584:      	cmp	x9, x10
    7588:      	b.ne	0x75b4 <_stogir.vector.store-inputs+0xbc>
    758c:      	cmp	x6, x9
    7590:      	b.gt	0x76b8 <_stogir.vector.store-inputs+0x1c0>
    7594:      	ldr	x6, [x0, #0x50]
    7598:      	add	x6, x6, x7, lsl #2
    759c:      	ldr	w6, [x6]
    75a0:      	sxtw	x6, w6
    75a4:      	cmp	x6, #0x0
    75a8:      	cset	w6, gt
    75ac:      	ubfx	x6, x6, #0, #8
    75b0:      	b	0x76bc <_stogir.vector.store-inputs+0x1c4>
    75b4:      	movz	x6, #0x0, lsl #48
    75b8:      	b	0x75c8 <_stogir.vector.store-inputs+0xd0>
    75bc:      	movz	x6, #0x0, lsl #48
    75c0:      	b	0x75c8 <_stogir.vector.store-inputs+0xd0>
    75c4:      	movz	x6, #0x0, lsl #48
    75c8:      	cmp	x6, #0x0
    75cc:      	b.eq	0x7600 <_stogir.vector.store-inputs+0x108>
    75d0:      	uxtb	w16, w5
    75d4:      	cmp	w16, wzr
    75d8:      	b.eq	0x75ec <_stogir.vector.store-inputs+0xf4>
    75dc:      	ldr	x5, [x0]
    75e0:      	add	x4, x5, x4, lsl #4
    75e4:      	ldr	x4, [x4]
    75e8:      	b	0x75f8 <_stogir.vector.store-inputs+0x100>
    75ec:      	ldr	x4, [x0, #0x28]
    75f0:      	add	x4, x4, x7, lsl #4
    75f4:      	ldr	x4, [x4]
    75f8:      	mov	w5, #0x1                ; =1
    75fc:      	b	0x7608 <_stogir.vector.store-inputs+0x110>
    7600:      	movz	w5, #0x0, lsl #16
    7604:      	movz	x4, #0x0, lsl #48
    7608:      	ubfx	x5, x5, #0, #32
    760c:      	lsr	x16, x5, #0
    7610:      	cmp	x16, #0x1
    7614:      	b.eq	0x7630 <_stogir.vector.store-inputs+0x138>
    7618:      	b.lo	0x7620 <_stogir.vector.store-inputs+0x128>
    761c:      	b	0x7634 <_stogir.vector.store-inputs+0x13c>
    7620:      	cmp	x16, #0x0
    7624:      	b.eq	0x762c <_stogir.vector.store-inputs+0x134>
    7628:      	b	0x7634 <_stogir.vector.store-inputs+0x13c>
    762c:      	b	0x7638 <_stogir.vector.store-inputs+0x140>
    7630:      	b	0x7650 <_stogir.vector.store-inputs+0x158>
    7634:      	b	0x76c0 <_stogir.vector.store-inputs+0x1c8>
    7638:      	mov	x19, x8
    763c:      	mov	x0, #0x1                ; =1
    7640:      	adrp	x1, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007640:  ARM64_RELOC_PAGE21	l_stogir.426
    7644:      	ldr	x1, [x1]
		0000000000007644:  ARM64_RELOC_PAGEOFF12	l_stogir.426
    7648:      	mov	x2, #0x1a               ; =26
    764c:      	b	0x7690 <_stogir.vector.store-inputs+0x198>
    7650:      	ubfx	x4, x4, #0, #32
    7654:      	ubfx	x4, x4, #8, #8
    7658:      	mov	x19, x8
    765c:      	add	x8, sp, #0x10
    7660:      	fmov	s31, w1
    7664:      	mov	w1, w4
    7668:      	mov	w4, w3
    766c:      	mov	w3, w2
    7670:      	fmov	w2, s31
    7674:      	bl	0x7674 <_stogir.vector.store-inputs+0x17c>
		0000000000007674:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    7678:      	add	x16, sp, #0x10
    767c:      	ldr	x0, [x16]
    7680:      	add	x16, sp, #0x10
    7684:      	ldr	x1, [x16, #0x8]
    7688:      	add	x16, sp, #0x10
    768c:      	ldr	x2, [x16, #0x10]
    7690:      	str	x0, [x19]
    7694:      	str	x1, [x19, #0x8]
    7698:      	str	x2, [x19, #0x10]
    769c:      	ldr	x19, [sp, #0x30]
    76a0:      	ldr	x29, [sp]
    76a4:      	ldr	x30, [sp, #0x8]
    76a8:      	add	sp, sp, #0x40
    76ac:      	ret
    76b0:      	movz	x6, #0x0, lsl #48
    76b4:      	b	0x75c0 <_stogir.vector.store-inputs+0xc8>
    76b8:      	movz	x6, #0x0, lsl #48
    76bc:      	b	0x75b8 <_stogir.vector.store-inputs+0xc0>
    76c0:      	brk	#0
    76c4:      	b	0x76c0 <_stogir.vector.store-inputs+0x1c8>

00000000000076c8 <_stogir.types.size>:
    76c8:      	sxtw	x2, w0
    76cc:      	sxtw	x3, w1
    76d0:      	cmp	x2, #0xf
    76d4:      	cset	w4, gt
    76d8:      	cmp	x2, #0x0
    76dc:      	cset	w5, eq
    76e0:      	cmp	x3, #0x4
    76e4:      	cset	w6, eq
    76e8:      	cmp	x3, #0x8
    76ec:      	cset	w7, eq
    76f0:      	uxtb	w16, w4
    76f4:      	cmp	w16, wzr
    76f8:      	b.eq	0x77bc <_stogir.types.size+0xf4>
    76fc:      	cmp	x2, #0x80
    7700:      	cset	w8, lt
    7704:      	uxtb	w16, w8
    7708:      	cmp	w16, wzr
    770c:      	b.eq	0x77bc <_stogir.types.size+0xf4>
    7710:      	and	w0, w0, #0xf
    7714:      	ubfx	x9, x0, #0, #32
    7718:      	cmp	x9, #0x1
    771c:      	cset	w10, ge
    7720:      	uxtb	w16, w10
    7724:      	cmp	w16, wzr
    7728:      	b.eq	0x77bc <_stogir.types.size+0xf4>
    772c:      	cmp	x9, #0xd
    7730:      	cset	w9, le
    7734:      	uxtb	w16, w9
    7738:      	cmp	w16, wzr
    773c:      	b.eq	0x77bc <_stogir.types.size+0xf4>
    7740:      	cmp	x2, #0x0
    7744:      	cset	w3, ge
    7748:      	cmp	x2, #0xd
    774c:      	cset	w11, le
    7750:      	uxtb	w16, w3
    7754:      	cmp	w16, wzr
    7758:      	b.eq	0x7768 <_stogir.types.size+0xa0>
    775c:      	uxtb	w16, w11
    7760:      	cmp	w16, wzr
    7764:      	b.ne	0x779c <_stogir.types.size+0xd4>
    7768:      	uxtb	w16, w4
    776c:      	cmp	w16, wzr
    7770:      	b.eq	0x7798 <_stogir.types.size+0xd0>
    7774:      	uxtb	w16, w8
    7778:      	cmp	w16, wzr
    777c:      	b.eq	0x7798 <_stogir.types.size+0xd0>
    7780:      	uxtb	w16, w10
    7784:      	cmp	w16, wzr
    7788:      	b.eq	0x7798 <_stogir.types.size+0xd0>
    778c:      	uxtb	w16, w9
    7790:      	cmp	w16, wzr
    7794:      	b.ne	0x779c <_stogir.types.size+0xd4>
    7798:      	movn	w0, #0x0, lsl #16
    779c:      	uxtb	w16, w6
    77a0:      	cmp	w16, wzr
    77a4:      	b.ne	0x78dc <_stogir.types.size+0x214>
    77a8:      	uxtb	w16, w7
    77ac:      	cmp	w16, wzr
    77b0:      	b.ne	0x78dc <_stogir.types.size+0x214>
    77b4:      	movn	w1, #0x0, lsl #16
    77b8:      	b	0x7870 <_stogir.types.size+0x1a8>
    77bc:      	uxtb	w16, w6
    77c0:      	cmp	w16, wzr
    77c4:      	b.ne	0x77dc <_stogir.types.size+0x114>
    77c8:      	uxtb	w16, w7
    77cc:      	cmp	w16, wzr
    77d0:      	b.ne	0x77dc <_stogir.types.size+0x114>
    77d4:      	movn	x3, #0x0, lsl #48
    77d8:      	b	0x77f4 <_stogir.types.size+0x12c>
    77dc:      	uxtb	w16, w5
    77e0:      	cmp	w16, wzr
    77e4:      	b.eq	0x77fc <_stogir.types.size+0x134>
    77e8:      	movz	x3, #0x0, lsl #48
    77ec:      	b	0x77f4 <_stogir.types.size+0x12c>
    77f0:      	mov	x3, #0x1                ; =1
    77f4:      	mov	x0, x3
    77f8:      	ret
    77fc:      	cmp	x2, #0x1
    7800:      	b.eq	0x77f0 <_stogir.types.size+0x128>
    7804:      	cmp	x2, #0x2
    7808:      	b.eq	0x77f0 <_stogir.types.size+0x128>
    780c:      	cmp	x2, #0x7
    7810:      	b.eq	0x77f0 <_stogir.types.size+0x128>
    7814:      	cmp	x2, #0x8
    7818:      	b.eq	0x77f0 <_stogir.types.size+0x128>
    781c:      	cmp	x2, #0x3
    7820:      	b.eq	0x7960 <_stogir.types.size+0x298>
    7824:      	cmp	x2, #0x9
    7828:      	b.eq	0x7960 <_stogir.types.size+0x298>
    782c:      	cmp	x2, #0x4
    7830:      	b.eq	0x7990 <_stogir.types.size+0x2c8>
    7834:      	cmp	x2, #0xa
    7838:      	b.eq	0x7990 <_stogir.types.size+0x2c8>
    783c:      	cmp	x2, #0xd
    7840:      	b.eq	0x7990 <_stogir.types.size+0x2c8>
    7844:      	cmp	x2, #0x5
    7848:      	b.eq	0x79a0 <_stogir.types.size+0x2d8>
    784c:      	cmp	x2, #0xb
    7850:      	b.eq	0x79a0 <_stogir.types.size+0x2d8>
    7854:      	cmp	x2, #0xc
    7858:      	b.eq	0x79a0 <_stogir.types.size+0x2d8>
    785c:      	cmp	x2, #0x6
    7860:      	b.eq	0x7868 <_stogir.types.size+0x1a0>
    7864:      	movn	x3, #0x0, lsl #48
    7868:      	b	0x79a4 <_stogir.types.size+0x2dc>
    786c:      	mov	w1, #0x1                ; =1
    7870:      	sxtw	x0, w1
    7874:      	cmp	x0, #0x0
    7878:      	b.ge	0x7884 <_stogir.types.size+0x1bc>
    787c:      	movn	x3, #0x0, lsl #48
    7880:      	b	0x77f4 <_stogir.types.size+0x12c>
    7884:      	uxtb	w16, w4
    7888:      	cmp	w16, wzr
    788c:      	b.eq	0x7968 <_stogir.types.size+0x2a0>
    7890:      	uxtb	w16, w8
    7894:      	cmp	w16, wzr
    7898:      	b.eq	0x7968 <_stogir.types.size+0x2a0>
    789c:      	uxtb	w16, w10
    78a0:      	cmp	w16, wzr
    78a4:      	b.eq	0x7968 <_stogir.types.size+0x2a0>
    78a8:      	uxtb	w16, w9
    78ac:      	cmp	w16, wzr
    78b0:      	b.eq	0x7968 <_stogir.types.size+0x2a0>
    78b4:      	ubfx	x0, x2, #4, #32
    78b8:      	sub	w0, w0, #0x1
    78bc:      	sxtw	x0, w0
    78c0:      	mov	x16, #0x1               ; =1
    78c4:      	lsl	x0, x16, x0
    78c8:      	b	0x78d0 <_stogir.types.size+0x208>
    78cc:      	movn	w0, #0x0, lsl #16
    78d0:      	mul	w0, w0, w1
    78d4:      	sxtw	x3, w0
    78d8:      	b	0x7880 <_stogir.types.size+0x1b8>
    78dc:      	sxtw	x0, w0
    78e0:      	cmp	x0, #0x0
    78e4:      	b.ne	0x78f0 <_stogir.types.size+0x228>
    78e8:      	movz	w1, #0x0, lsl #16
    78ec:      	b	0x7870 <_stogir.types.size+0x1a8>
    78f0:      	cmp	x0, #0x1
    78f4:      	b.eq	0x786c <_stogir.types.size+0x1a4>
    78f8:      	cmp	x0, #0x2
    78fc:      	b.eq	0x786c <_stogir.types.size+0x1a4>
    7900:      	cmp	x0, #0x7
    7904:      	b.eq	0x786c <_stogir.types.size+0x1a4>
    7908:      	cmp	x0, #0x8
    790c:      	b.eq	0x786c <_stogir.types.size+0x1a4>
    7910:      	cmp	x0, #0x3
    7914:      	b.eq	0x7998 <_stogir.types.size+0x2d0>
    7918:      	cmp	x0, #0x9
    791c:      	b.eq	0x7998 <_stogir.types.size+0x2d0>
    7920:      	cmp	x0, #0x4
    7924:      	b.eq	0x79a8 <_stogir.types.size+0x2e0>
    7928:      	cmp	x0, #0xa
    792c:      	b.eq	0x79a8 <_stogir.types.size+0x2e0>
    7930:      	cmp	x0, #0xd
    7934:      	b.eq	0x79a8 <_stogir.types.size+0x2e0>
    7938:      	cmp	x0, #0x5
    793c:      	b.eq	0x79b0 <_stogir.types.size+0x2e8>
    7940:      	cmp	x0, #0xb
    7944:      	b.eq	0x79b0 <_stogir.types.size+0x2e8>
    7948:      	cmp	x0, #0xc
    794c:      	b.eq	0x79b0 <_stogir.types.size+0x2e8>
    7950:      	cmp	x0, #0x6
    7954:      	b.eq	0x795c <_stogir.types.size+0x294>
    7958:      	movn	w1, #0x0, lsl #16
    795c:      	b	0x79b4 <_stogir.types.size+0x2ec>
    7960:      	mov	x3, #0x2                ; =2
    7964:      	b	0x77f4 <_stogir.types.size+0x12c>
    7968:      	uxtb	w16, w3
    796c:      	cmp	w16, wzr
    7970:      	b.eq	0x78cc <_stogir.types.size+0x204>
    7974:      	uxtb	w16, w11
    7978:      	cmp	w16, wzr
    797c:      	b.eq	0x78cc <_stogir.types.size+0x204>
    7980:      	uxtb	w16, w5
    7984:      	cmp	w16, wzr
    7988:      	cset	w0, eq
    798c:      	b	0x78d0 <_stogir.types.size+0x208>
    7990:      	mov	x3, #0x4                ; =4
    7994:      	b	0x7964 <_stogir.types.size+0x29c>
    7998:      	mov	w1, #0x2                ; =2
    799c:      	b	0x7870 <_stogir.types.size+0x1a8>
    79a0:      	mov	x3, #0x8                ; =8
    79a4:      	b	0x7994 <_stogir.types.size+0x2cc>
    79a8:      	mov	w1, #0x4                ; =4
    79ac:      	b	0x799c <_stogir.types.size+0x2d4>
    79b0:      	mov	w1, #0x8                ; =8
    79b4:      	b	0x79ac <_stogir.types.size+0x2e4>

00000000000079b8 <_stogir.checked.projection>:
    79b8:      	sub	sp, sp, #0x40
    79bc:      	str	x29, [sp]
    79c0:      	str	x30, [sp, #0x8]
    79c4:      	mov	x29, sp
    79c8:      	str	x19, [sp, #0x30]
    79cc:      	sxtw	x2, w1
    79d0:      	cmp	x2, #0x0
    79d4:      	cset	w3, gt
    79d8:      	movz	x16, #0x0, lsl #48
    79dc:      	sub	x4, x16, x2
    79e0:      	sub	x5, x4, #0x1
    79e4:      	uxtb	w16, w3
    79e8:      	cmp	w16, wzr
    79ec:      	b.eq	0x7a2c <_stogir.checked.projection+0x74>
    79f0:      	ldr	x4, [x0, #0x8]
    79f4:      	cmp	x2, x4
    79f8:      	b.ge	0x7a7c <_stogir.checked.projection+0xc4>
    79fc:      	add	x4, x0, #0x78
    7a00:      	ldr	x4, [x4, #0x8]
    7a04:      	cmp	x2, x4
    7a08:      	b.ge	0x7b7c <_stogir.checked.projection+0x1c4>
    7a0c:      	ldr	x4, [x0, #0x78]
    7a10:      	add	x4, x4, x2, lsl #2
    7a14:      	ldr	w4, [x4]
    7a18:      	sxtw	x4, w4
    7a1c:      	cmp	x4, #0x0
    7a20:      	cset	w4, ge
    7a24:      	ubfx	x4, x4, #0, #8
    7a28:      	b	0x7b80 <_stogir.checked.projection+0x1c8>
    7a2c:      	cmp	x2, #0x0
    7a30:      	b.ge	0x7a84 <_stogir.checked.projection+0xcc>
    7a34:      	add	x6, x0, #0x28
    7a38:      	add	x7, x0, #0x50
    7a3c:      	ldr	x6, [x6, #0x8]
    7a40:      	ldr	x7, [x7, #0x8]
    7a44:      	cmp	x6, x7
    7a48:      	b.ne	0x7a74 <_stogir.checked.projection+0xbc>
    7a4c:      	cmp	x4, x6
    7a50:      	b.gt	0x7bac <_stogir.checked.projection+0x1f4>
    7a54:      	ldr	x4, [x0, #0x50]
    7a58:      	add	x4, x4, x5, lsl #2
    7a5c:      	ldr	w4, [x4]
    7a60:      	sxtw	x4, w4
    7a64:      	cmp	x4, #0x0
    7a68:      	cset	w4, gt
    7a6c:      	ubfx	x4, x4, #0, #8
    7a70:      	b	0x7bb0 <_stogir.checked.projection+0x1f8>
    7a74:      	movz	x4, #0x0, lsl #48
    7a78:      	b	0x7a88 <_stogir.checked.projection+0xd0>
    7a7c:      	movz	x4, #0x0, lsl #48
    7a80:      	b	0x7a88 <_stogir.checked.projection+0xd0>
    7a84:      	movz	x4, #0x0, lsl #48
    7a88:      	cmp	x4, #0x0
    7a8c:      	b.eq	0x7ac0 <_stogir.checked.projection+0x108>
    7a90:      	uxtb	w16, w3
    7a94:      	cmp	w16, wzr
    7a98:      	b.eq	0x7aac <_stogir.checked.projection+0xf4>
    7a9c:      	ldr	x3, [x0]
    7aa0:      	add	x2, x3, x2, lsl #4
    7aa4:      	ldr	x2, [x2]
    7aa8:      	b	0x7ab8 <_stogir.checked.projection+0x100>
    7aac:      	ldr	x2, [x0, #0x28]
    7ab0:      	add	x2, x2, x5, lsl #4
    7ab4:      	ldr	x2, [x2]
    7ab8:      	mov	w3, #0x1                ; =1
    7abc:      	b	0x7ac8 <_stogir.checked.projection+0x110>
    7ac0:      	movz	w3, #0x0, lsl #16
    7ac4:      	movz	x2, #0x0, lsl #48
    7ac8:      	ubfx	x3, x3, #0, #32
    7acc:      	lsr	x16, x3, #0
    7ad0:      	cmp	x16, #0x1
    7ad4:      	b.eq	0x7af0 <_stogir.checked.projection+0x138>
    7ad8:      	b.lo	0x7ae0 <_stogir.checked.projection+0x128>
    7adc:      	b	0x7af4 <_stogir.checked.projection+0x13c>
    7ae0:      	cmp	x16, #0x0
    7ae4:      	b.eq	0x7aec <_stogir.checked.projection+0x134>
    7ae8:      	b	0x7af4 <_stogir.checked.projection+0x13c>
    7aec:      	b	0x7af8 <_stogir.checked.projection+0x140>
    7af0:      	b	0x7b40 <_stogir.checked.projection+0x188>
    7af4:      	b	0x7bb4 <_stogir.checked.projection+0x1fc>
    7af8:      	mov	x19, x8
    7afc:      	mov	x0, #0x1                ; =1
    7b00:      	adrp	x1, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007b00:  ARM64_RELOC_PAGE21	l_stogir.427
    7b04:      	ldr	x1, [x1]
		0000000000007b04:  ARM64_RELOC_PAGEOFF12	l_stogir.427
    7b08:      	mov	x2, #0x17               ; =23
    7b0c:      	b	0x7b20 <_stogir.checked.projection+0x168>
    7b10:      	mov	x0, #0x1                ; =1
    7b14:      	adrp	x1, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007b14:  ARM64_RELOC_PAGE21	l_stogir.428
    7b18:      	ldr	x1, [x1]
		0000000000007b18:  ARM64_RELOC_PAGEOFF12	l_stogir.428
    7b1c:      	mov	x2, #0x20               ; =32
    7b20:      	str	x0, [x19]
    7b24:      	str	x1, [x19, #0x8]
    7b28:      	str	x2, [x19, #0x10]
    7b2c:      	ldr	x19, [sp, #0x30]
    7b30:      	ldr	x29, [sp]
    7b34:      	ldr	x30, [sp, #0x8]
    7b38:      	add	sp, sp, #0x40
    7b3c:      	ret
    7b40:      	uxtb	w3, w2
    7b44:      	cmp	x3, #0x29
    7b48:      	b.lt	0x7bbc <_stogir.checked.projection+0x204>
    7b4c:      	cmp	x3, #0x2b
    7b50:      	b.gt	0x7bc4 <_stogir.checked.projection+0x20c>
    7b54:      	mov	x19, x8
    7b58:      	add	x8, sp, #0x10
    7b5c:      	bl	0x7b5c <_stogir.checked.projection+0x1a4>
		0000000000007b5c:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    7b60:      	add	x16, sp, #0x10
    7b64:      	ldr	x0, [x16]
    7b68:      	add	x16, sp, #0x10
    7b6c:      	ldr	x1, [x16, #0x8]
    7b70:      	add	x16, sp, #0x10
    7b74:      	ldr	x2, [x16, #0x10]
    7b78:      	b	0x7b20 <_stogir.checked.projection+0x168>
    7b7c:      	movz	x4, #0x0, lsl #48
    7b80:      	b	0x7a80 <_stogir.checked.projection+0xc8>
    7b84:      	ubfx	x2, x2, #0, #32
    7b88:      	ubfx	x0, x2, #8, #8
    7b8c:      	cmp	x0, #0x0
    7b90:      	b.eq	0x7b10 <_stogir.checked.projection+0x158>
    7b94:      	cmp	x0, #0xd
    7b98:      	b.gt	0x7b10 <_stogir.checked.projection+0x158>
    7b9c:      	movz	x0, #0x0, lsl #48
    7ba0:      	movz	x1, #0x0, lsl #48
    7ba4:      	movz	x2, #0x0, lsl #48
    7ba8:      	b	0x7b20 <_stogir.checked.projection+0x168>
    7bac:      	movz	x4, #0x0, lsl #48
    7bb0:      	b	0x7a78 <_stogir.checked.projection+0xc0>
    7bb4:      	brk	#0
    7bb8:      	b	0x7bb4 <_stogir.checked.projection+0x1fc>
    7bbc:      	mov	x19, x8
    7bc0:      	b	0x7b84 <_stogir.checked.projection+0x1cc>
    7bc4:      	mov	x19, x8
    7bc8:      	b	0x7b84 <_stogir.checked.projection+0x1cc>

0000000000007bcc <_stogir.atomic.ordinary?>:
    7bcc:      	sxtw	x1, w1
    7bd0:      	cmp	x1, #0x0
    7bd4:      	cset	w3, gt
    7bd8:      	movz	x16, #0x0, lsl #48
    7bdc:      	sub	x4, x16, x1
    7be0:      	sub	x5, x4, #0x1
    7be4:      	uxtb	w16, w3
    7be8:      	cmp	w16, wzr
    7bec:      	b.eq	0x7c2c <_stogir.atomic.ordinary?+0x60>
    7bf0:      	ldr	x4, [x0, #0x8]
    7bf4:      	cmp	x1, x4
    7bf8:      	b.ge	0x7c7c <_stogir.atomic.ordinary?+0xb0>
    7bfc:      	add	x4, x0, #0x78
    7c00:      	ldr	x4, [x4, #0x8]
    7c04:      	cmp	x1, x4
    7c08:      	b.ge	0x7d34 <_stogir.atomic.ordinary?+0x168>
    7c0c:      	ldr	x4, [x0, #0x78]
    7c10:      	add	x4, x4, x1, lsl #2
    7c14:      	ldr	w4, [x4]
    7c18:      	sxtw	x4, w4
    7c1c:      	cmp	x4, #0x0
    7c20:      	cset	w4, ge
    7c24:      	ubfx	x4, x4, #0, #8
    7c28:      	b	0x7d38 <_stogir.atomic.ordinary?+0x16c>
    7c2c:      	cmp	x1, #0x0
    7c30:      	b.ge	0x7c84 <_stogir.atomic.ordinary?+0xb8>
    7c34:      	add	x6, x0, #0x28
    7c38:      	add	x7, x0, #0x50
    7c3c:      	ldr	x6, [x6, #0x8]
    7c40:      	ldr	x7, [x7, #0x8]
    7c44:      	cmp	x6, x7
    7c48:      	b.ne	0x7c74 <_stogir.atomic.ordinary?+0xa8>
    7c4c:      	cmp	x4, x6
    7c50:      	b.gt	0x7d54 <_stogir.atomic.ordinary?+0x188>
    7c54:      	ldr	x4, [x0, #0x50]
    7c58:      	add	x4, x4, x5, lsl #2
    7c5c:      	ldr	w4, [x4]
    7c60:      	sxtw	x4, w4
    7c64:      	cmp	x4, #0x0
    7c68:      	cset	w4, gt
    7c6c:      	ubfx	x4, x4, #0, #8
    7c70:      	b	0x7d58 <_stogir.atomic.ordinary?+0x18c>
    7c74:      	movz	x4, #0x0, lsl #48
    7c78:      	b	0x7c88 <_stogir.atomic.ordinary?+0xbc>
    7c7c:      	movz	x4, #0x0, lsl #48
    7c80:      	b	0x7c88 <_stogir.atomic.ordinary?+0xbc>
    7c84:      	movz	x4, #0x0, lsl #48
    7c88:      	cmp	x4, #0x0
    7c8c:      	b.eq	0x7cc0 <_stogir.atomic.ordinary?+0xf4>
    7c90:      	uxtb	w16, w3
    7c94:      	cmp	w16, wzr
    7c98:      	b.eq	0x7cac <_stogir.atomic.ordinary?+0xe0>
    7c9c:      	ldr	x0, [x0]
    7ca0:      	add	x0, x0, x1, lsl #4
    7ca4:      	ldr	x0, [x0]
    7ca8:      	b	0x7cb8 <_stogir.atomic.ordinary?+0xec>
    7cac:      	ldr	x0, [x0, #0x28]
    7cb0:      	add	x0, x0, x5, lsl #4
    7cb4:      	ldr	x0, [x0]
    7cb8:      	mov	w1, #0x1                ; =1
    7cbc:      	b	0x7cc8 <_stogir.atomic.ordinary?+0xfc>
    7cc0:      	movz	w1, #0x0, lsl #16
    7cc4:      	movz	x0, #0x0, lsl #48
    7cc8:      	ubfx	x1, x1, #0, #32
    7ccc:      	lsr	x16, x1, #0
    7cd0:      	cmp	x16, #0x1
    7cd4:      	b.eq	0x7cf0 <_stogir.atomic.ordinary?+0x124>
    7cd8:      	b.lo	0x7ce0 <_stogir.atomic.ordinary?+0x114>
    7cdc:      	b	0x7cf4 <_stogir.atomic.ordinary?+0x128>
    7ce0:      	cmp	x16, #0x0
    7ce4:      	b.eq	0x7cec <_stogir.atomic.ordinary?+0x120>
    7ce8:      	b	0x7cf4 <_stogir.atomic.ordinary?+0x128>
    7cec:      	b	0x7cf8 <_stogir.atomic.ordinary?+0x12c>
    7cf0:      	b	0x7d08 <_stogir.atomic.ordinary?+0x13c>
    7cf4:      	b	0x7d5c <_stogir.atomic.ordinary?+0x190>
    7cf8:      	movz	x0, #0x0, lsl #48
    7cfc:      	b	0x7d04 <_stogir.atomic.ordinary?+0x138>
    7d00:      	movz	x0, #0x0, lsl #48
    7d04:      	ret
    7d08:      	sxtw	x2, w2
    7d0c:      	orr	w1, w0, wzr
    7d10:      	ubfx	x1, x1, #0, #32
    7d14:      	ubfx	x1, x1, #8, #8
    7d18:      	cmp	x1, x2
    7d1c:      	b.ne	0x7d00 <_stogir.atomic.ordinary?+0x134>
    7d20:      	uxtb	w0, w0
    7d24:      	cmp	x0, #0x46
    7d28:      	b.ne	0x7d3c <_stogir.atomic.ordinary?+0x170>
    7d2c:      	movz	x0, #0x0, lsl #48
    7d30:      	b	0x7d50 <_stogir.atomic.ordinary?+0x184>
    7d34:      	movz	x4, #0x0, lsl #48
    7d38:      	b	0x7c80 <_stogir.atomic.ordinary?+0xb4>
    7d3c:      	cmp	x0, #0x48
    7d40:      	cset	w0, eq
    7d44:      	uxtb	w16, w0
    7d48:      	cmp	w16, wzr
    7d4c:      	cset	x0, eq
    7d50:      	b	0x7d04 <_stogir.atomic.ordinary?+0x138>
    7d54:      	movz	x4, #0x0, lsl #48
    7d58:      	b	0x7c78 <_stogir.atomic.ordinary?+0xac>
    7d5c:      	brk	#0
    7d60:      	b	0x7d5c <_stogir.atomic.ordinary?+0x190>

0000000000007d64 <_stogir.types.scalar-size>:
    7d64:      	sxtw	x1, w1
    7d68:      	cmp	x1, #0x4
    7d6c:      	b.eq	0x7d80 <_stogir.types.scalar-size+0x1c>
    7d70:      	cmp	x1, #0x8
    7d74:      	b.eq	0x7d80 <_stogir.types.scalar-size+0x1c>
    7d78:      	movn	x1, #0x0, lsl #48
    7d7c:      	b	0x7d98 <_stogir.types.scalar-size+0x34>
    7d80:      	sxtw	x0, w0
    7d84:      	cmp	x0, #0x0
    7d88:      	b.ne	0x7da0 <_stogir.types.scalar-size+0x3c>
    7d8c:      	movz	x1, #0x0, lsl #48
    7d90:      	b	0x7d98 <_stogir.types.scalar-size+0x34>
    7d94:      	mov	x1, #0x1                ; =1
    7d98:      	mov	x0, x1
    7d9c:      	ret
    7da0:      	cmp	x0, #0x1
    7da4:      	b.eq	0x7d94 <_stogir.types.scalar-size+0x30>
    7da8:      	cmp	x0, #0x2
    7dac:      	b.eq	0x7d94 <_stogir.types.scalar-size+0x30>
    7db0:      	cmp	x0, #0x7
    7db4:      	b.eq	0x7d94 <_stogir.types.scalar-size+0x30>
    7db8:      	cmp	x0, #0x8
    7dbc:      	b.eq	0x7d94 <_stogir.types.scalar-size+0x30>
    7dc0:      	cmp	x0, #0x3
    7dc4:      	b.eq	0x7e10 <_stogir.types.scalar-size+0xac>
    7dc8:      	cmp	x0, #0x9
    7dcc:      	b.eq	0x7e10 <_stogir.types.scalar-size+0xac>
    7dd0:      	cmp	x0, #0x4
    7dd4:      	b.eq	0x7e18 <_stogir.types.scalar-size+0xb4>
    7dd8:      	cmp	x0, #0xa
    7ddc:      	b.eq	0x7e18 <_stogir.types.scalar-size+0xb4>
    7de0:      	cmp	x0, #0xd
    7de4:      	b.eq	0x7e18 <_stogir.types.scalar-size+0xb4>
    7de8:      	cmp	x0, #0x5
    7dec:      	b.eq	0x7e20 <_stogir.types.scalar-size+0xbc>
    7df0:      	cmp	x0, #0xb
    7df4:      	b.eq	0x7e20 <_stogir.types.scalar-size+0xbc>
    7df8:      	cmp	x0, #0xc
    7dfc:      	b.eq	0x7e20 <_stogir.types.scalar-size+0xbc>
    7e00:      	cmp	x0, #0x6
    7e04:      	b.eq	0x7e0c <_stogir.types.scalar-size+0xa8>
    7e08:      	movn	x1, #0x0, lsl #48
    7e0c:      	b	0x7e24 <_stogir.types.scalar-size+0xc0>
    7e10:      	mov	x1, #0x2                ; =2
    7e14:      	b	0x7d98 <_stogir.types.scalar-size+0x34>
    7e18:      	mov	x1, #0x4                ; =4
    7e1c:      	b	0x7e14 <_stogir.types.scalar-size+0xb0>
    7e20:      	mov	x1, #0x8                ; =8
    7e24:      	b	0x7e1c <_stogir.types.scalar-size+0xb8>

0000000000007e28 <_stogir.terminal.inputs>:
    7e28:      	sxtw	x1, w1
    7e2c:      	cmp	x1, #0x60
    7e30:      	cset	w4, eq
    7e34:      	uxtb	w16, w4
    7e38:      	cmp	w16, wzr
    7e3c:      	b.ne	0x7e68 <_stogir.terminal.inputs+0x40>
    7e40:      	cmp	x1, #0x79
    7e44:      	b.eq	0x7e68 <_stogir.terminal.inputs+0x40>
    7e48:      	mov	x1, #0x1                ; =1
    7e4c:      	adrp	x0, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007e4c:  ARM64_RELOC_PAGE21	l_stogir.429
    7e50:      	ldr	x0, [x0]
		0000000000007e50:  ARM64_RELOC_PAGEOFF12	l_stogir.429
    7e54:      	mov	x2, #0x25               ; =37
    7e58:      	str	x1, [x8]
    7e5c:      	str	x0, [x8, #0x8]
    7e60:      	str	x2, [x8, #0x10]
    7e64:      	ret
    7e68:      	sxtw	x3, w3
    7e6c:      	uxtb	w16, w4
    7e70:      	cmp	w16, wzr
    7e74:      	b.eq	0x7e80 <_stogir.terminal.inputs+0x58>
    7e78:      	cmp	x3, #0x0
    7e7c:      	b.ne	0x7e48 <_stogir.terminal.inputs+0x20>
    7e80:      	sxtw	x2, w2
    7e84:      	cmp	x2, #0x0
    7e88:      	cset	w1, gt
    7e8c:      	movz	x16, #0x0, lsl #48
    7e90:      	sub	x4, x16, x2
    7e94:      	sub	x5, x4, #0x1
    7e98:      	uxtb	w16, w1
    7e9c:      	cmp	w16, wzr
    7ea0:      	b.eq	0x7f70 <_stogir.terminal.inputs+0x148>
    7ea4:      	ldr	x4, [x0, #0x8]
    7ea8:      	cmp	x2, x4
    7eac:      	b.ge	0x7f68 <_stogir.terminal.inputs+0x140>
    7eb0:      	add	x4, x0, #0x78
    7eb4:      	ldr	x4, [x4, #0x8]
    7eb8:      	cmp	x2, x4
    7ebc:      	b.ge	0x8008 <_stogir.terminal.inputs+0x1e0>
    7ec0:      	ldr	x4, [x0, #0x78]
    7ec4:      	add	x4, x4, x2, lsl #2
    7ec8:      	ldr	w4, [x4]
    7ecc:      	sxtw	x4, w4
    7ed0:      	cmp	x4, #0x0
    7ed4:      	cset	w4, ge
    7ed8:      	ubfx	x4, x4, #0, #8
    7edc:      	b	0x800c <_stogir.terminal.inputs+0x1e4>
    7ee0:      	movz	w4, #0x0, lsl #16
    7ee4:      	movz	x1, #0x0, lsl #48
    7ee8:      	ubfx	x4, x4, #0, #32
    7eec:      	lsr	x16, x4, #0
    7ef0:      	cmp	x16, #0x1
    7ef4:      	b.eq	0x7f10 <_stogir.terminal.inputs+0xe8>
    7ef8:      	b.lo	0x7f00 <_stogir.terminal.inputs+0xd8>
    7efc:      	b	0x7f14 <_stogir.terminal.inputs+0xec>
    7f00:      	cmp	x16, #0x0
    7f04:      	b.eq	0x7f0c <_stogir.terminal.inputs+0xe4>
    7f08:      	b	0x7f14 <_stogir.terminal.inputs+0xec>
    7f0c:      	b	0x7f18 <_stogir.terminal.inputs+0xf0>
    7f10:      	b	0x7fb8 <_stogir.terminal.inputs+0x190>
    7f14:      	b	0x8154 <_stogir.terminal.inputs+0x32c>
    7f18:      	mov	x1, #0x1                ; =1
    7f1c:      	adrp	x0, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007f1c:  ARM64_RELOC_PAGE21	l_stogir.430
    7f20:      	ldr	x0, [x0]
		0000000000007f20:  ARM64_RELOC_PAGEOFF12	l_stogir.430
    7f24:      	mov	x2, #0x1d               ; =29
    7f28:      	b	0x7e58 <_stogir.terminal.inputs+0x30>
    7f2c:      	ldr	x1, [x0, #0x28]
    7f30:      	add	x1, x1, x5, lsl #4
    7f34:      	ldr	x1, [x1]
    7f38:      	mov	w4, #0x1                ; =1
    7f3c:      	b	0x7ee8 <_stogir.terminal.inputs+0xc0>
    7f40:      	movz	x4, #0x0, lsl #48
    7f44:      	cmp	x4, #0x0
    7f48:      	b.eq	0x7ee0 <_stogir.terminal.inputs+0xb8>
    7f4c:      	uxtb	w16, w1
    7f50:      	cmp	w16, wzr
    7f54:      	b.eq	0x7f2c <_stogir.terminal.inputs+0x104>
    7f58:      	ldr	x1, [x0]
    7f5c:      	add	x1, x1, x2, lsl #4
    7f60:      	ldr	x1, [x1]
    7f64:      	b	0x7f38 <_stogir.terminal.inputs+0x110>
    7f68:      	movz	x4, #0x0, lsl #48
    7f6c:      	b	0x7f44 <_stogir.terminal.inputs+0x11c>
    7f70:      	cmp	x2, #0x0
    7f74:      	b.ge	0x7f40 <_stogir.terminal.inputs+0x118>
    7f78:      	add	x6, x0, #0x28
    7f7c:      	add	x7, x0, #0x50
    7f80:      	ldr	x6, [x6, #0x8]
    7f84:      	ldr	x7, [x7, #0x8]
    7f88:      	cmp	x6, x7
    7f8c:      	b.ne	0x8000 <_stogir.terminal.inputs+0x1d8>
    7f90:      	cmp	x4, x6
    7f94:      	b.gt	0x8010 <_stogir.terminal.inputs+0x1e8>
    7f98:      	ldr	x4, [x0, #0x50]
    7f9c:      	add	x4, x4, x5, lsl #2
    7fa0:      	ldr	w4, [x4]
    7fa4:      	sxtw	x4, w4
    7fa8:      	cmp	x4, #0x0
    7fac:      	cset	w4, gt
    7fb0:      	ubfx	x4, x4, #0, #8
    7fb4:      	b	0x8014 <_stogir.terminal.inputs+0x1ec>
    7fb8:      	cmp	x2, #0x0
    7fbc:      	b.le	0x7fec <_stogir.terminal.inputs+0x1c4>
    7fc0:      	uxtb	w1, w1
    7fc4:      	cmp	x1, #0x83
    7fc8:      	cset	w2, lt
    7fcc:      	uxtb	w16, w2
    7fd0:      	cmp	w16, wzr
    7fd4:      	b.eq	0x8018 <_stogir.terminal.inputs+0x1f0>
    7fd8:      	adrp	x17, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007fd8:  ARM64_RELOC_PAGE21	l_stogir.431
    7fdc:      	ldr	x17, [x17]
		0000000000007fdc:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    7fe0:      	add	x4, x1, x17
    7fe4:      	ldrb	w4, [x4]
    7fe8:      	b	0x801c <_stogir.terminal.inputs+0x1f4>
    7fec:      	mov	x1, #0x1                ; =1
    7ff0:      	adrp	x0, 0x7000 <_stogir.vector-arithmetic.validate+0x2bc>
		0000000000007ff0:  ARM64_RELOC_PAGE21	l_stogir.432
    7ff4:      	ldr	x0, [x0]
		0000000000007ff4:  ARM64_RELOC_PAGEOFF12	l_stogir.432
    7ff8:      	mov	x2, #0x2c               ; =44
    7ffc:      	b	0x7f28 <_stogir.terminal.inputs+0x100>
    8000:      	movz	x4, #0x0, lsl #48
    8004:      	b	0x7f44 <_stogir.terminal.inputs+0x11c>
    8008:      	movz	x4, #0x0, lsl #48
    800c:      	b	0x7f6c <_stogir.terminal.inputs+0x144>
    8010:      	movz	x4, #0x0, lsl #48
    8014:      	b	0x8004 <_stogir.terminal.inputs+0x1dc>
    8018:      	movz	w4, #0x0, lsl #16
    801c:      	uxtb	w16, w4
    8020:      	and	w4, w16, #0x1
    8024:      	uxtb	w4, w4
    8028:      	ubfx	x4, x4, #0, #8
    802c:      	cmp	x4, #0x0
    8030:      	b.eq	0x7fec <_stogir.terminal.inputs+0x1c4>
    8034:      	uxtb	w16, w2
    8038:      	cmp	w16, wzr
    803c:      	b.eq	0x8054 <_stogir.terminal.inputs+0x22c>
    8040:      	adrp	x17, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008040:  ARM64_RELOC_PAGE21	l_stogir.431
    8044:      	ldr	x17, [x17]
		0000000000008044:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    8048:      	add	x1, x1, x17
    804c:      	ldrb	w1, [x1]
    8050:      	b	0x8058 <_stogir.terminal.inputs+0x230>
    8054:      	movz	w1, #0x0, lsl #16
    8058:      	uxtb	w16, w1
    805c:      	and	w1, w16, #0x4
    8060:      	uxtb	w1, w1
    8064:      	ubfx	x1, x1, #0, #8
    8068:      	cmp	x1, #0x0
    806c:      	cset	w1, eq
    8070:      	uxtb	w16, w1
    8074:      	cmp	w16, wzr
    8078:      	cset	x1, eq
    807c:      	cmp	x1, #0x0
    8080:      	b.ne	0x7fec <_stogir.terminal.inputs+0x1c4>
    8084:      	cmp	x3, #0x0
    8088:      	b.ne	0x809c <_stogir.terminal.inputs+0x274>
    808c:      	movz	x1, #0x0, lsl #48
    8090:      	movz	x0, #0x0, lsl #48
    8094:      	movz	x2, #0x0, lsl #48
    8098:      	b	0x7ffc <_stogir.terminal.inputs+0x1d4>
    809c:      	cmp	x3, #0x0
    80a0:      	cset	w1, gt
    80a4:      	movz	x16, #0x0, lsl #48
    80a8:      	sub	x2, x16, x3
    80ac:      	sub	x4, x2, #0x1
    80b0:      	uxtb	w16, w1
    80b4:      	cmp	w16, wzr
    80b8:      	b.eq	0x810c <_stogir.terminal.inputs+0x2e4>
    80bc:      	ldr	x2, [x0, #0x8]
    80c0:      	cmp	x3, x2
    80c4:      	b.ge	0x815c <_stogir.terminal.inputs+0x334>
    80c8:      	add	x2, x0, #0x78
    80cc:      	ldr	x2, [x2, #0x8]
    80d0:      	cmp	x3, x2
    80d4:      	b.ge	0x821c <_stogir.terminal.inputs+0x3f4>
    80d8:      	ldr	x2, [x0, #0x78]
    80dc:      	add	x2, x2, x3, lsl #2
    80e0:      	ldr	w2, [x2]
    80e4:      	sxtw	x2, w2
    80e8:      	cmp	x2, #0x0
    80ec:      	cset	w2, ge
    80f0:      	ubfx	x2, x2, #0, #8
    80f4:      	b	0x8220 <_stogir.terminal.inputs+0x3f8>
    80f8:      	mov	x1, #0x1                ; =1
    80fc:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x1d8>
		00000000000080fc:  ARM64_RELOC_PAGE21	l_stogir.433
    8100:      	ldr	x0, [x0]
		0000000000008100:  ARM64_RELOC_PAGEOFF12	l_stogir.433
    8104:      	mov	x2, #0x2e               ; =46
    8108:      	b	0x8098 <_stogir.terminal.inputs+0x270>
    810c:      	cmp	x3, #0x0
    8110:      	b.ge	0x8164 <_stogir.terminal.inputs+0x33c>
    8114:      	add	x5, x0, #0x28
    8118:      	add	x6, x0, #0x50
    811c:      	ldr	x5, [x5, #0x8]
    8120:      	ldr	x6, [x6, #0x8]
    8124:      	cmp	x5, x6
    8128:      	b.ne	0x8214 <_stogir.terminal.inputs+0x3ec>
    812c:      	cmp	x2, x5
    8130:      	b.gt	0x8224 <_stogir.terminal.inputs+0x3fc>
    8134:      	ldr	x2, [x0, #0x50]
    8138:      	add	x2, x2, x4, lsl #2
    813c:      	ldr	w2, [x2]
    8140:      	sxtw	x2, w2
    8144:      	cmp	x2, #0x0
    8148:      	cset	w2, gt
    814c:      	ubfx	x2, x2, #0, #8
    8150:      	b	0x8228 <_stogir.terminal.inputs+0x400>
    8154:      	brk	#0
    8158:      	b	0x8154 <_stogir.terminal.inputs+0x32c>
    815c:      	movz	x2, #0x0, lsl #48
    8160:      	b	0x8168 <_stogir.terminal.inputs+0x340>
    8164:      	movz	x2, #0x0, lsl #48
    8168:      	cmp	x2, #0x0
    816c:      	b.eq	0x81a0 <_stogir.terminal.inputs+0x378>
    8170:      	uxtb	w16, w1
    8174:      	cmp	w16, wzr
    8178:      	b.eq	0x818c <_stogir.terminal.inputs+0x364>
    817c:      	ldr	x0, [x0]
    8180:      	add	x0, x0, x3, lsl #4
    8184:      	ldr	x0, [x0]
    8188:      	b	0x8198 <_stogir.terminal.inputs+0x370>
    818c:      	ldr	x0, [x0, #0x28]
    8190:      	add	x0, x0, x4, lsl #4
    8194:      	ldr	x0, [x0]
    8198:      	mov	w1, #0x1                ; =1
    819c:      	b	0x81a8 <_stogir.terminal.inputs+0x380>
    81a0:      	movz	w1, #0x0, lsl #16
    81a4:      	movz	x0, #0x0, lsl #48
    81a8:      	ubfx	x1, x1, #0, #32
    81ac:      	lsr	x16, x1, #0
    81b0:      	cmp	x16, #0x1
    81b4:      	b.eq	0x81d0 <_stogir.terminal.inputs+0x3a8>
    81b8:      	b.lo	0x81c0 <_stogir.terminal.inputs+0x398>
    81bc:      	b	0x81d4 <_stogir.terminal.inputs+0x3ac>
    81c0:      	cmp	x16, #0x0
    81c4:      	b.eq	0x81cc <_stogir.terminal.inputs+0x3a4>
    81c8:      	b	0x81d4 <_stogir.terminal.inputs+0x3ac>
    81cc:      	b	0x81d8 <_stogir.terminal.inputs+0x3b0>
    81d0:      	b	0x81ec <_stogir.terminal.inputs+0x3c4>
    81d4:      	b	0x826c <_stogir.terminal.inputs+0x444>
    81d8:      	mov	x1, #0x1                ; =1
    81dc:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x1d8>
		00000000000081dc:  ARM64_RELOC_PAGE21	l_stogir.434
    81e0:      	ldr	x0, [x0]
		00000000000081e0:  ARM64_RELOC_PAGEOFF12	l_stogir.434
    81e4:      	mov	x2, #0x1d               ; =29
    81e8:      	b	0x8108 <_stogir.terminal.inputs+0x2e0>
    81ec:      	cmp	x3, #0x0
    81f0:      	b.le	0x80f8 <_stogir.terminal.inputs+0x2d0>
    81f4:      	uxtb	w0, w0
    81f8:      	cmp	x0, #0x83
    81fc:      	b.ge	0x822c <_stogir.terminal.inputs+0x404>
    8200:      	adrp	x17, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008200:  ARM64_RELOC_PAGE21	l_stogir.431
    8204:      	ldr	x17, [x17]
		0000000000008204:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    8208:      	add	x0, x0, x17
    820c:      	ldrb	w0, [x0]
    8210:      	b	0x8230 <_stogir.terminal.inputs+0x408>
    8214:      	movz	x2, #0x0, lsl #48
    8218:      	b	0x8168 <_stogir.terminal.inputs+0x340>
    821c:      	movz	x2, #0x0, lsl #48
    8220:      	b	0x8160 <_stogir.terminal.inputs+0x338>
    8224:      	movz	x2, #0x0, lsl #48
    8228:      	b	0x8218 <_stogir.terminal.inputs+0x3f0>
    822c:      	movz	w0, #0x0, lsl #16
    8230:      	uxtb	w16, w0
    8234:      	and	w0, w16, #0x8
    8238:      	uxtb	w0, w0
    823c:      	ubfx	x0, x0, #0, #8
    8240:      	cmp	x0, #0x0
    8244:      	cset	w0, eq
    8248:      	uxtb	w16, w0
    824c:      	cmp	w16, wzr
    8250:      	cset	x0, eq
    8254:      	cmp	x0, #0x0
    8258:      	b.eq	0x80f8 <_stogir.terminal.inputs+0x2d0>
    825c:      	and	x0, x3, #0xffffffff
    8260:      	movz	x1, #0x0, lsl #48
    8264:      	movz	x2, #0x0, lsl #48
    8268:      	b	0x8108 <_stogir.terminal.inputs+0x2e0>
    826c:      	brk	#0
    8270:      	b	0x826c <_stogir.terminal.inputs+0x444>

0000000000008274 <_stogir.switch.switch-inputs>:
    8274:      	sxtw	x1, w1
    8278:      	cmp	x1, #0x0
    827c:      	cset	w3, gt
    8280:      	movz	x16, #0x0, lsl #48
    8284:      	sub	x4, x16, x1
    8288:      	sub	x5, x4, #0x1
    828c:      	uxtb	w16, w3
    8290:      	cmp	w16, wzr
    8294:      	b.eq	0x82d4 <_stogir.switch.switch-inputs+0x60>
    8298:      	ldr	x4, [x0, #0x8]
    829c:      	cmp	x1, x4
    82a0:      	b.ge	0x8338 <_stogir.switch.switch-inputs+0xc4>
    82a4:      	add	x4, x0, #0x78
    82a8:      	ldr	x4, [x4, #0x8]
    82ac:      	cmp	x1, x4
    82b0:      	b.ge	0x8408 <_stogir.switch.switch-inputs+0x194>
    82b4:      	ldr	x4, [x0, #0x78]
    82b8:      	add	x4, x4, x1, lsl #2
    82bc:      	ldr	w4, [x4]
    82c0:      	sxtw	x4, w4
    82c4:      	cmp	x4, #0x0
    82c8:      	cset	w4, ge
    82cc:      	ubfx	x4, x4, #0, #8
    82d0:      	b	0x840c <_stogir.switch.switch-inputs+0x198>
    82d4:      	cmp	x1, #0x0
    82d8:      	b.ge	0x8340 <_stogir.switch.switch-inputs+0xcc>
    82dc:      	add	x6, x0, #0x28
    82e0:      	add	x7, x0, #0x50
    82e4:      	ldr	x6, [x6, #0x8]
    82e8:      	ldr	x7, [x7, #0x8]
    82ec:      	cmp	x6, x7
    82f0:      	b.ne	0x831c <_stogir.switch.switch-inputs+0xa8>
    82f4:      	cmp	x4, x6
    82f8:      	b.gt	0x8410 <_stogir.switch.switch-inputs+0x19c>
    82fc:      	ldr	x4, [x0, #0x50]
    8300:      	add	x4, x4, x5, lsl #2
    8304:      	ldr	w4, [x4]
    8308:      	sxtw	x4, w4
    830c:      	cmp	x4, #0x0
    8310:      	cset	w4, gt
    8314:      	ubfx	x4, x4, #0, #8
    8318:      	b	0x8414 <_stogir.switch.switch-inputs+0x1a0>
    831c:      	movz	x4, #0x0, lsl #48
    8320:      	b	0x8344 <_stogir.switch.switch-inputs+0xd0>
    8324:      	mov	x1, #0x1                ; =1
    8328:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008328:  ARM64_RELOC_PAGE21	l_stogir.435
    832c:      	ldr	x0, [x0]
		000000000000832c:  ARM64_RELOC_PAGEOFF12	l_stogir.435
    8330:      	mov	x2, #0x16               ; =22
    8334:      	b	0x83c4 <_stogir.switch.switch-inputs+0x150>
    8338:      	movz	x4, #0x0, lsl #48
    833c:      	b	0x8344 <_stogir.switch.switch-inputs+0xd0>
    8340:      	movz	x4, #0x0, lsl #48
    8344:      	cmp	x4, #0x0
    8348:      	b.eq	0x837c <_stogir.switch.switch-inputs+0x108>
    834c:      	uxtb	w16, w3
    8350:      	cmp	w16, wzr
    8354:      	b.eq	0x8368 <_stogir.switch.switch-inputs+0xf4>
    8358:      	ldr	x3, [x0]
    835c:      	add	x3, x3, x1, lsl #4
    8360:      	ldr	x3, [x3]
    8364:      	b	0x8374 <_stogir.switch.switch-inputs+0x100>
    8368:      	ldr	x3, [x0, #0x28]
    836c:      	add	x3, x3, x5, lsl #4
    8370:      	ldr	x3, [x3]
    8374:      	mov	w4, #0x1                ; =1
    8378:      	b	0x8384 <_stogir.switch.switch-inputs+0x110>
    837c:      	movz	w4, #0x0, lsl #16
    8380:      	movz	x3, #0x0, lsl #48
    8384:      	ubfx	x4, x4, #0, #32
    8388:      	lsr	x16, x4, #0
    838c:      	cmp	x16, #0x1
    8390:      	b.eq	0x83ac <_stogir.switch.switch-inputs+0x138>
    8394:      	b.lo	0x839c <_stogir.switch.switch-inputs+0x128>
    8398:      	b	0x83b0 <_stogir.switch.switch-inputs+0x13c>
    839c:      	cmp	x16, #0x0
    83a0:      	b.eq	0x83a8 <_stogir.switch.switch-inputs+0x134>
    83a4:      	b	0x83b0 <_stogir.switch.switch-inputs+0x13c>
    83a8:      	b	0x83b4 <_stogir.switch.switch-inputs+0x140>
    83ac:      	b	0x83d4 <_stogir.switch.switch-inputs+0x160>
    83b0:      	b	0x8618 <_stogir.switch.switch-inputs+0x3a4>
    83b4:      	mov	x1, #0x1                ; =1
    83b8:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x1d8>
		00000000000083b8:  ARM64_RELOC_PAGE21	l_stogir.436
    83bc:      	ldr	x0, [x0]
		00000000000083bc:  ARM64_RELOC_PAGEOFF12	l_stogir.436
    83c0:      	mov	x2, #0x16               ; =22
    83c4:      	str	x1, [x8]
    83c8:      	str	x0, [x8, #0x8]
    83cc:      	str	x2, [x8, #0x10]
    83d0:      	ret
    83d4:      	cmp	x1, #0x0
    83d8:      	b.le	0x8324 <_stogir.switch.switch-inputs+0xb0>
    83dc:      	uxtb	w3, w3
    83e0:      	cmp	x3, #0x83
    83e4:      	cset	w1, lt
    83e8:      	uxtb	w16, w1
    83ec:      	cmp	w16, wzr
    83f0:      	b.eq	0x8418 <_stogir.switch.switch-inputs+0x1a4>
    83f4:      	adrp	x17, 0x8000 <_stogir.terminal.inputs+0x1d8>
		00000000000083f4:  ARM64_RELOC_PAGE21	l_stogir.437
    83f8:      	ldr	x17, [x17]
		00000000000083f8:  ARM64_RELOC_PAGEOFF12	l_stogir.437
    83fc:      	add	x4, x3, x17
    8400:      	ldrb	w4, [x4]
    8404:      	b	0x841c <_stogir.switch.switch-inputs+0x1a8>
    8408:      	movz	x4, #0x0, lsl #48
    840c:      	b	0x833c <_stogir.switch.switch-inputs+0xc8>
    8410:      	movz	x4, #0x0, lsl #48
    8414:      	b	0x8320 <_stogir.switch.switch-inputs+0xac>
    8418:      	movz	w4, #0x0, lsl #16
    841c:      	uxtb	w16, w4
    8420:      	and	w4, w16, #0x1
    8424:      	uxtb	w4, w4
    8428:      	ubfx	x4, x4, #0, #8
    842c:      	cmp	x4, #0x0
    8430:      	b.eq	0x8324 <_stogir.switch.switch-inputs+0xb0>
    8434:      	uxtb	w16, w1
    8438:      	cmp	w16, wzr
    843c:      	b.eq	0x8454 <_stogir.switch.switch-inputs+0x1e0>
    8440:      	adrp	x17, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008440:  ARM64_RELOC_PAGE21	l_stogir.437
    8444:      	ldr	x17, [x17]
		0000000000008444:  ARM64_RELOC_PAGEOFF12	l_stogir.437
    8448:      	add	x1, x3, x17
    844c:      	ldrb	w1, [x1]
    8450:      	b	0x8458 <_stogir.switch.switch-inputs+0x1e4>
    8454:      	movz	w1, #0x0, lsl #16
    8458:      	uxtb	w16, w1
    845c:      	and	w1, w16, #0x4
    8460:      	uxtb	w1, w1
    8464:      	ubfx	x1, x1, #0, #8
    8468:      	cmp	x1, #0x0
    846c:      	cset	w1, eq
    8470:      	uxtb	w16, w1
    8474:      	cmp	w16, wzr
    8478:      	cset	x1, eq
    847c:      	cmp	x1, #0x0
    8480:      	b.ne	0x8324 <_stogir.switch.switch-inputs+0xb0>
    8484:      	sxtw	x2, w2
    8488:      	cmp	x2, #0x0
    848c:      	cset	w1, gt
    8490:      	movz	x16, #0x0, lsl #48
    8494:      	sub	x3, x16, x2
    8498:      	sub	x4, x3, #0x1
    849c:      	uxtb	w16, w1
    84a0:      	cmp	w16, wzr
    84a4:      	b.eq	0x84f8 <_stogir.switch.switch-inputs+0x284>
    84a8:      	ldr	x3, [x0, #0x8]
    84ac:      	cmp	x2, x3
    84b0:      	b.ge	0x8540 <_stogir.switch.switch-inputs+0x2cc>
    84b4:      	add	x3, x0, #0x78
    84b8:      	ldr	x3, [x3, #0x8]
    84bc:      	cmp	x2, x3
    84c0:      	b.ge	0x8610 <_stogir.switch.switch-inputs+0x39c>
    84c4:      	ldr	x3, [x0, #0x78]
    84c8:      	add	x3, x3, x2, lsl #2
    84cc:      	ldr	w3, [x3]
    84d0:      	sxtw	x3, w3
    84d4:      	cmp	x3, #0x0
    84d8:      	cset	w3, ge
    84dc:      	ubfx	x3, x3, #0, #8
    84e0:      	b	0x8614 <_stogir.switch.switch-inputs+0x3a0>
    84e4:      	mov	x1, #0x1                ; =1
    84e8:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x1d8>
		00000000000084e8:  ARM64_RELOC_PAGE21	l_stogir.438
    84ec:      	ldr	x0, [x0]
		00000000000084ec:  ARM64_RELOC_PAGEOFF12	l_stogir.438
    84f0:      	mov	x2, #0x20               ; =32
    84f4:      	b	0x8334 <_stogir.switch.switch-inputs+0xc0>
    84f8:      	cmp	x2, #0x0
    84fc:      	b.ge	0x8548 <_stogir.switch.switch-inputs+0x2d4>
    8500:      	add	x5, x0, #0x28
    8504:      	add	x6, x0, #0x50
    8508:      	ldr	x5, [x5, #0x8]
    850c:      	ldr	x6, [x6, #0x8]
    8510:      	cmp	x5, x6
    8514:      	b.ne	0x8608 <_stogir.switch.switch-inputs+0x394>
    8518:      	cmp	x3, x5
    851c:      	b.gt	0x8620 <_stogir.switch.switch-inputs+0x3ac>
    8520:      	ldr	x3, [x0, #0x50]
    8524:      	add	x3, x3, x4, lsl #2
    8528:      	ldr	w3, [x3]
    852c:      	sxtw	x3, w3
    8530:      	cmp	x3, #0x0
    8534:      	cset	w3, gt
    8538:      	ubfx	x3, x3, #0, #8
    853c:      	b	0x8624 <_stogir.switch.switch-inputs+0x3b0>
    8540:      	movz	x3, #0x0, lsl #48
    8544:      	b	0x854c <_stogir.switch.switch-inputs+0x2d8>
    8548:      	movz	x3, #0x0, lsl #48
    854c:      	cmp	x3, #0x0
    8550:      	b.eq	0x8584 <_stogir.switch.switch-inputs+0x310>
    8554:      	uxtb	w16, w1
    8558:      	cmp	w16, wzr
    855c:      	b.eq	0x8570 <_stogir.switch.switch-inputs+0x2fc>
    8560:      	ldr	x0, [x0]
    8564:      	add	x0, x0, x2, lsl #4
    8568:      	ldr	x0, [x0]
    856c:      	b	0x857c <_stogir.switch.switch-inputs+0x308>
    8570:      	ldr	x0, [x0, #0x28]
    8574:      	add	x0, x0, x4, lsl #4
    8578:      	ldr	x0, [x0]
    857c:      	mov	w1, #0x1                ; =1
    8580:      	b	0x858c <_stogir.switch.switch-inputs+0x318>
    8584:      	movz	w1, #0x0, lsl #16
    8588:      	movz	x0, #0x0, lsl #48
    858c:      	ubfx	x1, x1, #0, #32
    8590:      	lsr	x16, x1, #0
    8594:      	cmp	x16, #0x1
    8598:      	b.eq	0x85b4 <_stogir.switch.switch-inputs+0x340>
    859c:      	b.lo	0x85a4 <_stogir.switch.switch-inputs+0x330>
    85a0:      	b	0x85b8 <_stogir.switch.switch-inputs+0x344>
    85a4:      	cmp	x16, #0x0
    85a8:      	b.eq	0x85b0 <_stogir.switch.switch-inputs+0x33c>
    85ac:      	b	0x85b8 <_stogir.switch.switch-inputs+0x344>
    85b0:      	b	0x85bc <_stogir.switch.switch-inputs+0x348>
    85b4:      	b	0x85d0 <_stogir.switch.switch-inputs+0x35c>
    85b8:      	b	0x8628 <_stogir.switch.switch-inputs+0x3b4>
    85bc:      	mov	x1, #0x1                ; =1
    85c0:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x1d8>
		00000000000085c0:  ARM64_RELOC_PAGE21	l_stogir.439
    85c4:      	ldr	x0, [x0]
		00000000000085c4:  ARM64_RELOC_PAGEOFF12	l_stogir.439
    85c8:      	mov	x2, #0x17               ; =23
    85cc:      	b	0x84f4 <_stogir.switch.switch-inputs+0x280>
    85d0:      	orr	w1, w0, wzr
    85d4:      	ubfx	x1, x1, #0, #32
    85d8:      	ubfx	x1, x1, #8, #8
    85dc:      	cmp	x1, #0x1
    85e0:      	b.lt	0x84e4 <_stogir.switch.switch-inputs+0x270>
    85e4:      	cmp	x1, #0xb
    85e8:      	b.gt	0x84e4 <_stogir.switch.switch-inputs+0x270>
    85ec:      	uxtb	w0, w0
    85f0:      	cmp	x0, #0x48
    85f4:      	b.eq	0x84e4 <_stogir.switch.switch-inputs+0x270>
    85f8:      	and	x0, x1, #0xffffffff
    85fc:      	movz	x1, #0x0, lsl #48
    8600:      	movz	x2, #0x0, lsl #48
    8604:      	b	0x84f4 <_stogir.switch.switch-inputs+0x280>
    8608:      	movz	x3, #0x0, lsl #48
    860c:      	b	0x854c <_stogir.switch.switch-inputs+0x2d8>
    8610:      	movz	x3, #0x0, lsl #48
    8614:      	b	0x8544 <_stogir.switch.switch-inputs+0x2d0>
    8618:      	brk	#0
    861c:      	b	0x8618 <_stogir.switch.switch-inputs+0x3a4>
    8620:      	movz	x3, #0x0, lsl #48
    8624:      	b	0x860c <_stogir.switch.switch-inputs+0x398>
    8628:      	brk	#0
    862c:      	b	0x8628 <_stogir.switch.switch-inputs+0x3b4>

0000000000008630 <_stogir.switch.case-inputs>:
    8630:      	sub	sp, sp, #0xb0
    8634:      	str	x29, [sp]
    8638:      	str	x30, [sp, #0x8]
    863c:      	mov	x29, sp
    8640:      	str	x19, [sp, #0x70]
    8644:      	str	x20, [sp, #0x78]
    8648:      	str	x21, [sp, #0x80]
    864c:      	str	x22, [sp, #0x88]
    8650:      	str	x23, [sp, #0x90]
    8654:      	str	x24, [sp, #0x98]
    8658:      	str	x25, [sp, #0xa0]
    865c:      	str	x26, [sp, #0xa8]
    8660:      	sxtw	x2, w2
    8664:      	lsl	x5, x2, #2
    8668:      	cmp	x2, #0x0
    866c:      	cset	w6, gt
    8670:      	movz	x16, #0x0, lsl #48
    8674:      	sub	x7, x16, x2
    8678:      	sub	x9, x7, #0x1
    867c:      	uxtb	w16, w6
    8680:      	cmp	w16, wzr
    8684:      	b.eq	0x86c4 <_stogir.switch.case-inputs+0x94>
    8688:      	ldr	x7, [x0, #0x8]
    868c:      	cmp	x2, x7
    8690:      	b.ge	0x8714 <_stogir.switch.case-inputs+0xe4>
    8694:      	add	x7, x0, #0x78
    8698:      	ldr	x7, [x7, #0x8]
    869c:      	cmp	x2, x7
    86a0:      	b.ge	0x880c <_stogir.switch.case-inputs+0x1dc>
    86a4:      	ldr	x7, [x0, #0x78]
    86a8:      	add	x7, x5, x7
    86ac:      	ldr	w7, [x7]
    86b0:      	sxtw	x7, w7
    86b4:      	cmp	x7, #0x0
    86b8:      	cset	w7, ge
    86bc:      	ubfx	x7, x7, #0, #8
    86c0:      	b	0x8810 <_stogir.switch.case-inputs+0x1e0>
    86c4:      	cmp	x2, #0x0
    86c8:      	b.ge	0x871c <_stogir.switch.case-inputs+0xec>
    86cc:      	add	x10, x0, #0x28
    86d0:      	add	x11, x0, #0x50
    86d4:      	ldr	x10, [x10, #0x8]
    86d8:      	ldr	x11, [x11, #0x8]
    86dc:      	cmp	x10, x11
    86e0:      	b.ne	0x870c <_stogir.switch.case-inputs+0xdc>
    86e4:      	cmp	x7, x10
    86e8:      	b.gt	0x88d4 <_stogir.switch.case-inputs+0x2a4>
    86ec:      	ldr	x7, [x0, #0x50]
    86f0:      	add	x7, x7, x9, lsl #2
    86f4:      	ldr	w7, [x7]
    86f8:      	sxtw	x7, w7
    86fc:      	cmp	x7, #0x0
    8700:      	cset	w7, gt
    8704:      	ubfx	x7, x7, #0, #8
    8708:      	b	0x88d8 <_stogir.switch.case-inputs+0x2a8>
    870c:      	movz	x7, #0x0, lsl #48
    8710:      	b	0x8720 <_stogir.switch.case-inputs+0xf0>
    8714:      	movz	x7, #0x0, lsl #48
    8718:      	b	0x8720 <_stogir.switch.case-inputs+0xf0>
    871c:      	movz	x7, #0x0, lsl #48
    8720:      	cmp	x7, #0x0
    8724:      	b.eq	0x8760 <_stogir.switch.case-inputs+0x130>
    8728:      	uxtb	w16, w6
    872c:      	cmp	w16, wzr
    8730:      	b.eq	0x8748 <_stogir.switch.case-inputs+0x118>
    8734:      	ldr	x6, [x0]
    8738:      	add	x6, x6, x2, lsl #4
    873c:      	ldr	x7, [x6]
    8740:      	ldr	x6, [x6, #0x8]
    8744:      	b	0x8758 <_stogir.switch.case-inputs+0x128>
    8748:      	ldr	x6, [x0, #0x28]
    874c:      	add	x6, x6, x9, lsl #4
    8750:      	ldr	x7, [x6]
    8754:      	ldr	x6, [x6, #0x8]
    8758:      	mov	w9, #0x1                ; =1
    875c:      	b	0x876c <_stogir.switch.case-inputs+0x13c>
    8760:      	movz	w9, #0x0, lsl #16
    8764:      	movz	x7, #0x0, lsl #48
    8768:      	movz	x6, #0x0, lsl #48
    876c:      	ubfx	x9, x9, #0, #32
    8770:      	lsr	x16, x9, #0
    8774:      	cmp	x16, #0x1
    8778:      	b.eq	0x8794 <_stogir.switch.case-inputs+0x164>
    877c:      	b.lo	0x8784 <_stogir.switch.case-inputs+0x154>
    8780:      	b	0x8798 <_stogir.switch.case-inputs+0x168>
    8784:      	cmp	x16, #0x0
    8788:      	b.eq	0x8790 <_stogir.switch.case-inputs+0x160>
    878c:      	b	0x8798 <_stogir.switch.case-inputs+0x168>
    8790:      	b	0x879c <_stogir.switch.case-inputs+0x16c>
    8794:      	b	0x87ec <_stogir.switch.case-inputs+0x1bc>
    8798:      	b	0x88dc <_stogir.switch.case-inputs+0x2ac>
    879c:      	mov	x21, x8
    87a0:      	mov	x1, #0x1                ; =1
    87a4:      	adrp	x20, 0x8000 <_stogir.terminal.inputs+0x1d8>
		00000000000087a4:  ARM64_RELOC_PAGE21	l_stogir.440
    87a8:      	ldr	x20, [x20]
		00000000000087a8:  ARM64_RELOC_PAGEOFF12	l_stogir.440
    87ac:      	mov	x0, #0x1a               ; =26
    87b0:      	str	x1, [x21]
    87b4:      	str	x20, [x21, #0x8]
    87b8:      	str	x0, [x21, #0x10]
    87bc:      	ldr	x19, [sp, #0x70]
    87c0:      	ldr	x20, [sp, #0x78]
    87c4:      	ldr	x21, [sp, #0x80]
    87c8:      	ldr	x22, [sp, #0x88]
    87cc:      	ldr	x23, [sp, #0x90]
    87d0:      	ldr	x24, [sp, #0x98]
    87d4:      	ldr	x25, [sp, #0xa0]
    87d8:      	ldr	x26, [sp, #0xa8]
    87dc:      	ldr	x29, [sp]
    87e0:      	ldr	x30, [sp, #0x8]
    87e4:      	add	sp, sp, #0xb0
    87e8:      	ret
    87ec:      	cmp	x2, #0x0
    87f0:      	b.gt	0x8814 <_stogir.switch.case-inputs+0x1e4>
    87f4:      	mov	x21, x8
    87f8:      	mov	x1, #0x1                ; =1
    87fc:      	adrp	x20, 0x8000 <_stogir.terminal.inputs+0x1d8>
		00000000000087fc:  ARM64_RELOC_PAGE21	l_stogir.441
    8800:      	ldr	x20, [x20]
		0000000000008800:  ARM64_RELOC_PAGEOFF12	l_stogir.441
    8804:      	mov	x0, #0x1f               ; =31
    8808:      	b	0x87b0 <_stogir.switch.case-inputs+0x180>
    880c:      	movz	x7, #0x0, lsl #48
    8810:      	b	0x8718 <_stogir.switch.case-inputs+0xe8>
    8814:      	uxtb	w2, w7
    8818:      	cmp	x2, #0x75
    881c:      	b.ne	0x8a34 <_stogir.switch.case-inputs+0x404>
    8820:      	orr	w2, w7, wzr
    8824:      	ubfx	x2, x2, #0, #32
    8828:      	ubfx	x2, x2, #8, #8
    882c:      	cmp	x2, #0x0
    8830:      	b.ne	0x8a3c <_stogir.switch.case-inputs+0x40c>
    8834:      	ldr	x2, [x0, #0x78]
    8838:      	add	x2, x5, x2
    883c:      	ldr	w2, [x2]
    8840:      	sxtw	x2, w2
    8844:      	cmp	x2, #0x2
    8848:      	b.ne	0x8a44 <_stogir.switch.case-inputs+0x414>
    884c:      	sxtw	x19, w1
    8850:      	cmp	x19, #0x6d
    8854:      	b.lt	0x8a4c <_stogir.switch.case-inputs+0x41c>
    8858:      	cmp	x19, #0x6f
    885c:      	b.gt	0x8a54 <_stogir.switch.case-inputs+0x424>
    8860:      	add	x16, sp, #0x10
    8864:      	orr	x20, x16, xzr
    8868:      	lsr	x1, x7, #32
    886c:      	mov	w2, w6
    8870:      	mov	x21, x8
    8874:      	add	x8, sp, #0x10
    8878:      	mov	x22, x0
    887c:      	mov	w23, w3
    8880:      	mov	w24, w4
    8884:      	bl	0x8884 <_stogir.switch.case-inputs+0x254>
		0000000000008884:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    8888:      	add	x16, sp, #0x10
    888c:      	ldr	w0, [x16]
    8890:      	lsr	x16, x0, #0
    8894:      	cmp	x16, #0x1
    8898:      	b.eq	0x88b4 <_stogir.switch.case-inputs+0x284>
    889c:      	b.lo	0x88a4 <_stogir.switch.case-inputs+0x274>
    88a0:      	b	0x88b8 <_stogir.switch.case-inputs+0x288>
    88a4:      	cmp	x16, #0x0
    88a8:      	b.eq	0x88b0 <_stogir.switch.case-inputs+0x280>
    88ac:      	b	0x88b8 <_stogir.switch.case-inputs+0x288>
    88b0:      	b	0x88e4 <_stogir.switch.case-inputs+0x2b4>
    88b4:      	b	0x88bc <_stogir.switch.case-inputs+0x28c>
    88b8:      	b	0x8a1c <_stogir.switch.case-inputs+0x3ec>
    88bc:      	add	x0, x20, #0x8
    88c0:      	add	x16, sp, #0x10
    88c4:      	ldr	x20, [x16, #0x8]
    88c8:      	ldr	x0, [x0, #0x8]
    88cc:      	mov	x1, #0x1                ; =1
    88d0:      	b	0x8808 <_stogir.switch.case-inputs+0x1d8>
    88d4:      	movz	x7, #0x0, lsl #48
    88d8:      	b	0x8710 <_stogir.switch.case-inputs+0xe0>
    88dc:      	brk	#0
    88e0:      	b	0x88dc <_stogir.switch.case-inputs+0x2ac>
    88e4:      	add	x16, sp, #0x10
    88e8:      	ldr	w25, [x16, #0x8]
    88ec:      	sxtw	x0, w25
    88f0:      	and	x20, x0, #0xffffffff
    88f4:      	cmp	x19, #0x6f
    88f8:      	b.ne	0x8908 <_stogir.switch.case-inputs+0x2d8>
    88fc:      	movz	x1, #0x0, lsl #48
    8900:      	movz	x0, #0x0, lsl #48
    8904:      	b	0x88d0 <_stogir.switch.case-inputs+0x2a0>
    8908:      	add	x16, sp, #0x30
    890c:      	orr	x26, x16, xzr
    8910:      	add	x8, sp, #0x30
    8914:      	mov	x0, x22
    8918:      	mov	w1, w23
    891c:      	mov	w2, w25
    8920:      	bl	0x8920 <_stogir.switch.case-inputs+0x2f0>
		0000000000008920:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    8924:      	add	x16, sp, #0x30
    8928:      	ldr	w0, [x16]
    892c:      	lsr	x16, x0, #0
    8930:      	cmp	x16, #0x1
    8934:      	b.eq	0x8950 <_stogir.switch.case-inputs+0x320>
    8938:      	b.lo	0x8940 <_stogir.switch.case-inputs+0x310>
    893c:      	b	0x8954 <_stogir.switch.case-inputs+0x324>
    8940:      	cmp	x16, #0x0
    8944:      	b.eq	0x894c <_stogir.switch.case-inputs+0x31c>
    8948:      	b	0x8954 <_stogir.switch.case-inputs+0x324>
    894c:      	b	0x8970 <_stogir.switch.case-inputs+0x340>
    8950:      	b	0x8958 <_stogir.switch.case-inputs+0x328>
    8954:      	b	0x8a24 <_stogir.switch.case-inputs+0x3f4>
    8958:      	add	x0, x26, #0x8
    895c:      	add	x16, sp, #0x30
    8960:      	ldr	x20, [x16, #0x8]
    8964:      	ldr	x0, [x0, #0x8]
    8968:      	mov	x1, #0x1                ; =1
    896c:      	b	0x8904 <_stogir.switch.case-inputs+0x2d4>
    8970:      	add	x16, sp, #0x30
    8974:      	ldr	x26, [x16, #0x8]
    8978:      	cmp	x19, #0x6d
    897c:      	b.eq	0x8984 <_stogir.switch.case-inputs+0x354>
    8980:      	orr	w23, w24, wzr
    8984:      	add	x16, sp, #0x50
    8988:      	orr	x19, x16, xzr
    898c:      	add	x8, sp, #0x50
    8990:      	mov	x0, x22
    8994:      	mov	w1, w23
    8998:      	mov	w2, w25
    899c:      	bl	0x899c <_stogir.switch.case-inputs+0x36c>
		000000000000899c:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    89a0:      	add	x16, sp, #0x50
    89a4:      	ldr	w0, [x16]
    89a8:      	lsr	x16, x0, #0
    89ac:      	cmp	x16, #0x1
    89b0:      	b.eq	0x89cc <_stogir.switch.case-inputs+0x39c>
    89b4:      	b.lo	0x89bc <_stogir.switch.case-inputs+0x38c>
    89b8:      	b	0x89d0 <_stogir.switch.case-inputs+0x3a0>
    89bc:      	cmp	x16, #0x0
    89c0:      	b.eq	0x89c8 <_stogir.switch.case-inputs+0x398>
    89c4:      	b	0x89d0 <_stogir.switch.case-inputs+0x3a0>
    89c8:      	b	0x89f8 <_stogir.switch.case-inputs+0x3c8>
    89cc:      	b	0x89d4 <_stogir.switch.case-inputs+0x3a4>
    89d0:      	b	0x8a2c <_stogir.switch.case-inputs+0x3fc>
    89d4:      	add	x0, x19, #0x8
    89d8:      	add	x16, sp, #0x50
    89dc:      	ldr	x20, [x16, #0x8]
    89e0:      	ldr	x0, [x0, #0x8]
    89e4:      	mov	x1, #0x1                ; =1
    89e8:      	b	0x89f4 <_stogir.switch.case-inputs+0x3c4>
    89ec:      	movz	x1, #0x0, lsl #48
    89f0:      	movz	x0, #0x0, lsl #48
    89f4:      	b	0x896c <_stogir.switch.case-inputs+0x33c>
    89f8:      	add	x16, sp, #0x50
    89fc:      	ldr	x0, [x16, #0x8]
    8a00:      	cmp	x26, x0
    8a04:      	b.ls	0x89ec <_stogir.switch.case-inputs+0x3bc>
    8a08:      	mov	x1, #0x1                ; =1
    8a0c:      	adrp	x20, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008a0c:  ARM64_RELOC_PAGE21	l_stogir.442
    8a10:      	ldr	x20, [x20]
		0000000000008a10:  ARM64_RELOC_PAGEOFF12	l_stogir.442
    8a14:      	mov	x0, #0x1a               ; =26
    8a18:      	b	0x89f4 <_stogir.switch.case-inputs+0x3c4>
    8a1c:      	brk	#0
    8a20:      	b	0x8a1c <_stogir.switch.case-inputs+0x3ec>
    8a24:      	brk	#0
    8a28:      	b	0x8a24 <_stogir.switch.case-inputs+0x3f4>
    8a2c:      	brk	#0
    8a30:      	b	0x8a2c <_stogir.switch.case-inputs+0x3fc>
    8a34:      	mov	x21, x8
    8a38:      	b	0x87f8 <_stogir.switch.case-inputs+0x1c8>
    8a3c:      	mov	x21, x8
    8a40:      	b	0x87f8 <_stogir.switch.case-inputs+0x1c8>
    8a44:      	mov	x21, x8
    8a48:      	b	0x87f8 <_stogir.switch.case-inputs+0x1c8>
    8a4c:      	mov	x21, x8
    8a50:      	b	0x87f8 <_stogir.switch.case-inputs+0x1c8>
    8a54:      	mov	x21, x8
    8a58:      	b	0x87f8 <_stogir.switch.case-inputs+0x1c8>

0000000000008a5c <_stogir.stack.valid-frame-object-inputs?>:
    8a5c:      	sub	sp, sp, #0x20
    8a60:      	str	x29, [sp]
    8a64:      	str	x30, [sp, #0x8]
    8a68:      	mov	x29, sp
    8a6c:      	str	x19, [sp, #0x10]
    8a70:      	str	x20, [sp, #0x18]
    8a74:      	mov	x19, x0
    8a78:      	mov	w20, w2
    8a7c:      	bl	0x8a7c <_stogir.stack.valid-frame-object-inputs?+0x20>
		0000000000008a7c:  ARM64_RELOC_BRANCH26	_stogir.stack.entry-allocation?
    8a80:      	cmp	x0, #0x0
    8a84:      	b.eq	0x8b00 <_stogir.stack.valid-frame-object-inputs?+0xa4>
    8a88:      	sxtw	x20, w20
    8a8c:      	cmp	x20, #0x0
    8a90:      	b.ge	0x8b20 <_stogir.stack.valid-frame-object-inputs?+0xc4>
    8a94:      	cmp	x20, #0x0
    8a98:      	cset	w0, gt
    8a9c:      	movz	x16, #0x0, lsl #48
    8aa0:      	sub	x1, x16, x20
    8aa4:      	mov	x2, sp
    8aa8:      	sub	x3, x1, #0x1
    8aac:      	mov	x4, sp
    8ab0:      	sub	sp, sp, #0x10
    8ab4:      	mov	x5, sp
    8ab8:      	uxtb	w16, w0
    8abc:      	cmp	w16, wzr
    8ac0:      	b.eq	0x8b28 <_stogir.stack.valid-frame-object-inputs?+0xcc>
    8ac4:      	ldr	x1, [x19, #0x8]
    8ac8:      	cmp	x20, x1
    8acc:      	b.ge	0x8b80 <_stogir.stack.valid-frame-object-inputs?+0x124>
    8ad0:      	add	x1, x19, #0x78
    8ad4:      	ldr	x1, [x1, #0x8]
    8ad8:      	cmp	x20, x1
    8adc:      	b.ge	0x8cd4 <_stogir.stack.valid-frame-object-inputs?+0x278>
    8ae0:      	ldr	x1, [x19, #0x78]
    8ae4:      	add	x1, x1, x20, lsl #2
    8ae8:      	ldr	w1, [x1]
    8aec:      	sxtw	x1, w1
    8af0:      	cmp	x1, #0x0
    8af4:      	cset	w1, ge
    8af8:      	ubfx	x1, x1, #0, #8
    8afc:      	b	0x8cd8 <_stogir.stack.valid-frame-object-inputs?+0x27c>
    8b00:      	movz	x0, #0x0, lsl #48
    8b04:      	sub	sp, x29, #0x0
    8b08:      	ldr	x19, [sp, #0x10]
    8b0c:      	ldr	x20, [sp, #0x18]
    8b10:      	ldr	x29, [sp]
    8b14:      	ldr	x30, [sp, #0x8]
    8b18:      	add	sp, sp, #0x20
    8b1c:      	ret
    8b20:      	movz	x0, #0x0, lsl #48
    8b24:      	b	0x8b04 <_stogir.stack.valid-frame-object-inputs?+0xa8>
    8b28:      	add	x6, x19, #0x28
    8b2c:      	add	x7, x19, #0x50
    8b30:      	ldr	x6, [x6, #0x8]
    8b34:      	ldr	x7, [x7, #0x8]
    8b38:      	cmp	x6, x7
    8b3c:      	b.ne	0x8b88 <_stogir.stack.valid-frame-object-inputs?+0x12c>
    8b40:      	cmp	x1, x6
    8b44:      	b.gt	0x8b78 <_stogir.stack.valid-frame-object-inputs?+0x11c>
    8b48:      	ldr	x1, [x19, #0x50]
    8b4c:      	add	x1, x1, x3, lsl #2
    8b50:      	ldr	w1, [x1]
    8b54:      	sxtw	x1, w1
    8b58:      	cmp	x1, #0x0
    8b5c:      	cset	w1, gt
    8b60:      	ubfx	x1, x1, #0, #8
    8b64:      	b	0x8b7c <_stogir.stack.valid-frame-object-inputs?+0x120>
    8b68:      	cmp	x0, #0x0
    8b6c:      	cset	w0, gt
    8b70:      	ubfx	x0, x0, #0, #8
    8b74:      	b	0x8b24 <_stogir.stack.valid-frame-object-inputs?+0xc8>
    8b78:      	movz	x1, #0x0, lsl #48
    8b7c:      	b	0x8b8c <_stogir.stack.valid-frame-object-inputs?+0x130>
    8b80:      	movz	x1, #0x0, lsl #48
    8b84:      	b	0x8b8c <_stogir.stack.valid-frame-object-inputs?+0x130>
    8b88:      	movz	x1, #0x0, lsl #48
    8b8c:      	cmp	x1, #0x0
    8b90:      	b.eq	0x8bcc <_stogir.stack.valid-frame-object-inputs?+0x170>
    8b94:      	uxtb	w16, w0
    8b98:      	cmp	w16, wzr
    8b9c:      	b.eq	0x8bb4 <_stogir.stack.valid-frame-object-inputs?+0x158>
    8ba0:      	ldr	x0, [x19]
    8ba4:      	add	x0, x0, x20, lsl #4
    8ba8:      	ldr	x1, [x0]
    8bac:      	ldr	x0, [x0, #0x8]
    8bb0:      	b	0x8bc4 <_stogir.stack.valid-frame-object-inputs?+0x168>
    8bb4:      	ldr	x0, [x19, #0x28]
    8bb8:      	add	x0, x0, x3, lsl #4
    8bbc:      	ldr	x1, [x0]
    8bc0:      	ldr	x0, [x0, #0x8]
    8bc4:      	mov	w3, #0x1                ; =1
    8bc8:      	b	0x8bd8 <_stogir.stack.valid-frame-object-inputs?+0x17c>
    8bcc:      	movz	w3, #0x0, lsl #16
    8bd0:      	movz	x1, #0x0, lsl #48
    8bd4:      	movz	x0, #0x0, lsl #48
    8bd8:      	ubfx	x3, x3, #0, #32
    8bdc:      	lsr	x16, x3, #0
    8be0:      	cmp	x16, #0x1
    8be4:      	b.eq	0x8c00 <_stogir.stack.valid-frame-object-inputs?+0x1a4>
    8be8:      	b.lo	0x8bf0 <_stogir.stack.valid-frame-object-inputs?+0x194>
    8bec:      	b	0x8c04 <_stogir.stack.valid-frame-object-inputs?+0x1a8>
    8bf0:      	cmp	x16, #0x0
    8bf4:      	b.eq	0x8bfc <_stogir.stack.valid-frame-object-inputs?+0x1a0>
    8bf8:      	b	0x8c04 <_stogir.stack.valid-frame-object-inputs?+0x1a8>
    8bfc:      	b	0x8c08 <_stogir.stack.valid-frame-object-inputs?+0x1ac>
    8c00:      	b	0x8cb0 <_stogir.stack.valid-frame-object-inputs?+0x254>
    8c04:      	b	0x8dec <_stogir.stack.valid-frame-object-inputs?+0x390>
    8c08:      	mov	w1, #0x1                ; =1
    8c0c:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008c0c:  ARM64_RELOC_PAGE21	l_stogir.443
    8c10:      	ldr	x0, [x0]
		0000000000008c10:  ARM64_RELOC_PAGEOFF12	l_stogir.443
    8c14:      	b	0x8c70 <_stogir.stack.valid-frame-object-inputs?+0x214>
    8c18:      	mov	w1, #0x1                ; =1
    8c1c:      	ldr	w3, [x5, #0x8]
    8c20:      	ldr	w6, [x5, #0xc]
    8c24:      	cmp	x20, #0x0
    8c28:      	b.ge	0x8c64 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8c2c:      	cmp	x0, #0x1
    8c30:      	b.lt	0x8c64 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8c34:      	cmp	x0, #0xb
    8c38:      	cset	w7, le
    8c3c:      	uxtb	w16, w7
    8c40:      	cmp	w16, wzr
    8c44:      	b.eq	0x8c64 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8c48:      	ldr	w5, [x5]
    8c4c:      	uxtb	w8, w5
    8c50:      	ubfx	x5, x5, #8, #8
    8c54:      	cmp	x8, x5
    8c58:      	b.eq	0x8d5c <_stogir.stack.valid-frame-object-inputs?+0x300>
    8c5c:      	cmp	x8, #0x49
    8c60:      	b.eq	0x8d5c <_stogir.stack.valid-frame-object-inputs?+0x300>
    8c64:      	mov	w1, #0x1                ; =1
    8c68:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008c68:  ARM64_RELOC_PAGE21	l_stogir.444
    8c6c:      	ldr	x0, [x0]
		0000000000008c6c:  ARM64_RELOC_PAGEOFF12	l_stogir.444
    8c70:      	mov	sp, x4
    8c74:      	ubfx	x1, x1, #0, #32
    8c78:      	mov	sp, x2
    8c7c:      	lsr	x16, x1, #0
    8c80:      	cmp	x16, #0x1
    8c84:      	b.eq	0x8ca0 <_stogir.stack.valid-frame-object-inputs?+0x244>
    8c88:      	b.lo	0x8c90 <_stogir.stack.valid-frame-object-inputs?+0x234>
    8c8c:      	b	0x8ca4 <_stogir.stack.valid-frame-object-inputs?+0x248>
    8c90:      	cmp	x16, #0x0
    8c94:      	b.eq	0x8c9c <_stogir.stack.valid-frame-object-inputs?+0x240>
    8c98:      	b	0x8ca4 <_stogir.stack.valid-frame-object-inputs?+0x248>
    8c9c:      	b	0x8b68 <_stogir.stack.valid-frame-object-inputs?+0x10c>
    8ca0:      	b	0x8ca8 <_stogir.stack.valid-frame-object-inputs?+0x24c>
    8ca4:      	b	0x8df4 <_stogir.stack.valid-frame-object-inputs?+0x398>
    8ca8:      	movz	x0, #0x0, lsl #48
    8cac:      	b	0x8b74 <_stogir.stack.valid-frame-object-inputs?+0x118>
    8cb0:      	orr	w3, w1, wzr
    8cb4:      	str	x1, [x5]
    8cb8:      	ubfx	x3, x3, #0, #32
    8cbc:      	str	x0, [x5, #0x8]
    8cc0:      	ubfx	x0, x3, #8, #8
    8cc4:      	cmp	x0, #0x0
    8cc8:      	b.ne	0x8cdc <_stogir.stack.valid-frame-object-inputs?+0x280>
    8ccc:      	movz	w1, #0x0, lsl #16
    8cd0:      	b	0x8c1c <_stogir.stack.valid-frame-object-inputs?+0x1c0>
    8cd4:      	movz	x1, #0x0, lsl #48
    8cd8:      	b	0x8b84 <_stogir.stack.valid-frame-object-inputs?+0x128>
    8cdc:      	cmp	x0, #0x1
    8ce0:      	b.eq	0x8c18 <_stogir.stack.valid-frame-object-inputs?+0x1bc>
    8ce4:      	cmp	x0, #0x2
    8ce8:      	b.eq	0x8c18 <_stogir.stack.valid-frame-object-inputs?+0x1bc>
    8cec:      	cmp	x0, #0x7
    8cf0:      	b.eq	0x8c18 <_stogir.stack.valid-frame-object-inputs?+0x1bc>
    8cf4:      	cmp	x0, #0x8
    8cf8:      	b.eq	0x8c18 <_stogir.stack.valid-frame-object-inputs?+0x1bc>
    8cfc:      	cmp	x0, #0x3
    8d00:      	b.eq	0x8de4 <_stogir.stack.valid-frame-object-inputs?+0x388>
    8d04:      	cmp	x0, #0x9
    8d08:      	b.eq	0x8de4 <_stogir.stack.valid-frame-object-inputs?+0x388>
    8d0c:      	cmp	x0, #0x4
    8d10:      	b.eq	0x8dfc <_stogir.stack.valid-frame-object-inputs?+0x3a0>
    8d14:      	cmp	x0, #0xa
    8d18:      	b.eq	0x8dfc <_stogir.stack.valid-frame-object-inputs?+0x3a0>
    8d1c:      	cmp	x0, #0xd
    8d20:      	b.eq	0x8dfc <_stogir.stack.valid-frame-object-inputs?+0x3a0>
    8d24:      	cmp	x0, #0x5
    8d28:      	b.eq	0x8e04 <_stogir.stack.valid-frame-object-inputs?+0x3a8>
    8d2c:      	cmp	x0, #0xb
    8d30:      	b.eq	0x8e04 <_stogir.stack.valid-frame-object-inputs?+0x3a8>
    8d34:      	cmp	x0, #0xc
    8d38:      	b.eq	0x8e04 <_stogir.stack.valid-frame-object-inputs?+0x3a8>
    8d3c:      	cmp	x0, #0x6
    8d40:      	cset	w1, eq
    8d44:      	uxtb	w16, w1
    8d48:      	cmp	w16, wzr
    8d4c:      	mov	w16, #0x8               ; =8
    8d50:      	movn	w17, #0x0, lsl #16
    8d54:      	csel	w1, w16, w17, ne
    8d58:      	b	0x8e08 <_stogir.stack.valid-frame-object-inputs?+0x3ac>
    8d5c:      	sxtw	x5, w1
    8d60:      	cmp	x5, #0x0
    8d64:      	b.le	0x8c64 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8d68:      	lsl	w1, w1, #3
    8d6c:      	ubfx	x3, x3, #0, #32
    8d70:      	ubfx	x6, x6, #0, #32
    8d74:      	lsl	x6, x6, #32
    8d78:      	orr	x3, x6, x3
    8d7c:      	cmp	x5, #0x8
    8d80:      	b.ge	0x8d94 <_stogir.stack.valid-frame-object-inputs?+0x338>
    8d84:      	sxtw	x5, w1
    8d88:      	lsr	x5, x3, x5
    8d8c:      	cmp	x5, #0x0
    8d90:      	b.ne	0x8c64 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8d94:      	cmp	x0, #0x7
    8d98:      	b.lt	0x8dc4 <_stogir.stack.valid-frame-object-inputs?+0x368>
    8d9c:      	uxtb	w16, w7
    8da0:      	cmp	w16, wzr
    8da4:      	b.eq	0x8dc4 <_stogir.stack.valid-frame-object-inputs?+0x368>
    8da8:      	sub	w0, w1, #0x1
    8dac:      	sxtw	x0, w0
    8db0:      	mov	x16, #0x1               ; =1
    8db4:      	lsl	x0, x16, x0
    8db8:      	and	x0, x0, x3
    8dbc:      	cmp	x0, #0x0
    8dc0:      	b.ne	0x8c64 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8dc4:      	mov	x17, #-0x10             ; =-16
    8dc8:      	movk	x17, #0x7fff, lsl #48
    8dcc:      	cmp	x3, x17
    8dd0:      	b.hi	0x8c64 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8dd4:      	add	x0, x3, #0xf
    8dd8:      	and	x0, x0, #0xfffffffffffffff0
    8ddc:      	movz	w1, #0x0, lsl #16
    8de0:      	b	0x8c70 <_stogir.stack.valid-frame-object-inputs?+0x214>
    8de4:      	mov	w1, #0x2                ; =2
    8de8:      	b	0x8c1c <_stogir.stack.valid-frame-object-inputs?+0x1c0>
    8dec:      	brk	#0
    8df0:      	b	0x8dec <_stogir.stack.valid-frame-object-inputs?+0x390>
    8df4:      	brk	#0
    8df8:      	b	0x8df4 <_stogir.stack.valid-frame-object-inputs?+0x398>
    8dfc:      	mov	w1, #0x4                ; =4
    8e00:      	b	0x8de8 <_stogir.stack.valid-frame-object-inputs?+0x38c>
    8e04:      	mov	w1, #0x8                ; =8
    8e08:      	b	0x8e00 <_stogir.stack.valid-frame-object-inputs?+0x3a4>

0000000000008e0c <_stogir.stack.validate-scope-inputs>:
    8e0c:      	sxtw	x1, w1
    8e10:      	cmp	x1, #0x53
    8e14:      	cset	w5, eq
    8e18:      	uxtb	w16, w5
    8e1c:      	cmp	w16, wzr
    8e20:      	b.ne	0x8e4c <_stogir.stack.validate-scope-inputs+0x40>
    8e24:      	cmp	x1, #0x54
    8e28:      	b.eq	0x8e4c <_stogir.stack.validate-scope-inputs+0x40>
    8e2c:      	mov	x0, #0x1                ; =1
    8e30:      	adrp	x1, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008e30:  ARM64_RELOC_PAGE21	l_stogir.445
    8e34:      	ldr	x1, [x1]
		0000000000008e34:  ARM64_RELOC_PAGEOFF12	l_stogir.445
    8e38:      	mov	x2, #0x22               ; =34
    8e3c:      	str	x0, [x8]
    8e40:      	str	x1, [x8, #0x8]
    8e44:      	str	x2, [x8, #0x10]
    8e48:      	ret
    8e4c:      	uxtb	w16, w5
    8e50:      	cmp	w16, wzr
    8e54:      	mov	w16, #0x6               ; =6
    8e58:      	movz	w17, #0x0, lsl #16
    8e5c:      	csel	w1, w16, w17, ne
    8e60:      	sxtw	x2, w2
    8e64:      	sxtw	x1, w1
    8e68:      	cmp	x2, x1
    8e6c:      	b.ne	0x8e2c <_stogir.stack.validate-scope-inputs+0x20>
    8e70:      	sxtw	x3, w3
    8e74:      	cmp	x3, #0x0
    8e78:      	cset	w1, gt
    8e7c:      	movz	x16, #0x0, lsl #48
    8e80:      	sub	x2, x16, x3
    8e84:      	sub	x6, x2, #0x1
    8e88:      	uxtb	w16, w1
    8e8c:      	cmp	w16, wzr
    8e90:      	b.eq	0x8f60 <_stogir.stack.validate-scope-inputs+0x154>
    8e94:      	ldr	x2, [x0, #0x8]
    8e98:      	cmp	x3, x2
    8e9c:      	b.ge	0x8f58 <_stogir.stack.validate-scope-inputs+0x14c>
    8ea0:      	add	x2, x0, #0x78
    8ea4:      	ldr	x2, [x2, #0x8]
    8ea8:      	cmp	x3, x2
    8eac:      	b.ge	0x8ff8 <_stogir.stack.validate-scope-inputs+0x1ec>
    8eb0:      	ldr	x2, [x0, #0x78]
    8eb4:      	add	x2, x2, x3, lsl #2
    8eb8:      	ldr	w2, [x2]
    8ebc:      	sxtw	x2, w2
    8ec0:      	cmp	x2, #0x0
    8ec4:      	cset	w2, ge
    8ec8:      	ubfx	x2, x2, #0, #8
    8ecc:      	b	0x8ffc <_stogir.stack.validate-scope-inputs+0x1f0>
    8ed0:      	movz	w2, #0x0, lsl #16
    8ed4:      	movz	x1, #0x0, lsl #48
    8ed8:      	ubfx	x2, x2, #0, #32
    8edc:      	lsr	x16, x2, #0
    8ee0:      	cmp	x16, #0x1
    8ee4:      	b.eq	0x8f00 <_stogir.stack.validate-scope-inputs+0xf4>
    8ee8:      	b.lo	0x8ef0 <_stogir.stack.validate-scope-inputs+0xe4>
    8eec:      	b	0x8f04 <_stogir.stack.validate-scope-inputs+0xf8>
    8ef0:      	cmp	x16, #0x0
    8ef4:      	b.eq	0x8efc <_stogir.stack.validate-scope-inputs+0xf0>
    8ef8:      	b	0x8f04 <_stogir.stack.validate-scope-inputs+0xf8>
    8efc:      	b	0x8f08 <_stogir.stack.validate-scope-inputs+0xfc>
    8f00:      	b	0x8fa8 <_stogir.stack.validate-scope-inputs+0x19c>
    8f04:      	b	0x91c8 <_stogir.stack.validate-scope-inputs+0x3bc>
    8f08:      	mov	x0, #0x1                ; =1
    8f0c:      	adrp	x1, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008f0c:  ARM64_RELOC_PAGE21	l_stogir.446
    8f10:      	ldr	x1, [x1]
		0000000000008f10:  ARM64_RELOC_PAGEOFF12	l_stogir.446
    8f14:      	mov	x2, #0x1b               ; =27
    8f18:      	b	0x8e3c <_stogir.stack.validate-scope-inputs+0x30>
    8f1c:      	ldr	x1, [x0, #0x28]
    8f20:      	add	x1, x1, x6, lsl #4
    8f24:      	ldr	x1, [x1]
    8f28:      	mov	w2, #0x1                ; =1
    8f2c:      	b	0x8ed8 <_stogir.stack.validate-scope-inputs+0xcc>
    8f30:      	movz	x2, #0x0, lsl #48
    8f34:      	cmp	x2, #0x0
    8f38:      	b.eq	0x8ed0 <_stogir.stack.validate-scope-inputs+0xc4>
    8f3c:      	uxtb	w16, w1
    8f40:      	cmp	w16, wzr
    8f44:      	b.eq	0x8f1c <_stogir.stack.validate-scope-inputs+0x110>
    8f48:      	ldr	x1, [x0]
    8f4c:      	add	x1, x1, x3, lsl #4
    8f50:      	ldr	x1, [x1]
    8f54:      	b	0x8f28 <_stogir.stack.validate-scope-inputs+0x11c>
    8f58:      	movz	x2, #0x0, lsl #48
    8f5c:      	b	0x8f34 <_stogir.stack.validate-scope-inputs+0x128>
    8f60:      	cmp	x3, #0x0
    8f64:      	b.ge	0x8f30 <_stogir.stack.validate-scope-inputs+0x124>
    8f68:      	add	x7, x0, #0x28
    8f6c:      	add	x9, x0, #0x50
    8f70:      	ldr	x7, [x7, #0x8]
    8f74:      	ldr	x9, [x9, #0x8]
    8f78:      	cmp	x7, x9
    8f7c:      	b.ne	0x8ff0 <_stogir.stack.validate-scope-inputs+0x1e4>
    8f80:      	cmp	x2, x7
    8f84:      	b.gt	0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
    8f88:      	ldr	x2, [x0, #0x50]
    8f8c:      	add	x2, x2, x6, lsl #2
    8f90:      	ldr	w2, [x2]
    8f94:      	sxtw	x2, w2
    8f98:      	cmp	x2, #0x0
    8f9c:      	cset	w2, gt
    8fa0:      	ubfx	x2, x2, #0, #8
    8fa4:      	b	0x9004 <_stogir.stack.validate-scope-inputs+0x1f8>
    8fa8:      	cmp	x3, #0x0
    8fac:      	b.le	0x8fdc <_stogir.stack.validate-scope-inputs+0x1d0>
    8fb0:      	uxtb	w1, w1
    8fb4:      	cmp	x1, #0x83
    8fb8:      	cset	w2, lt
    8fbc:      	uxtb	w16, w2
    8fc0:      	cmp	w16, wzr
    8fc4:      	b.eq	0x9008 <_stogir.stack.validate-scope-inputs+0x1fc>
    8fc8:      	adrp	x17, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008fc8:  ARM64_RELOC_PAGE21	l_stogir.447
    8fcc:      	ldr	x17, [x17]
		0000000000008fcc:  ARM64_RELOC_PAGEOFF12	l_stogir.447
    8fd0:      	add	x3, x1, x17
    8fd4:      	ldrb	w3, [x3]
    8fd8:      	b	0x900c <_stogir.stack.validate-scope-inputs+0x200>
    8fdc:      	mov	x0, #0x1                ; =1
    8fe0:      	adrp	x1, 0x8000 <_stogir.terminal.inputs+0x1d8>
		0000000000008fe0:  ARM64_RELOC_PAGE21	l_stogir.448
    8fe4:      	ldr	x1, [x1]
		0000000000008fe4:  ARM64_RELOC_PAGEOFF12	l_stogir.448
    8fe8:      	mov	x2, #0x1b               ; =27
    8fec:      	b	0x8f18 <_stogir.stack.validate-scope-inputs+0x10c>
    8ff0:      	movz	x2, #0x0, lsl #48
    8ff4:      	b	0x8f34 <_stogir.stack.validate-scope-inputs+0x128>
    8ff8:      	movz	x2, #0x0, lsl #48
    8ffc:      	b	0x8f5c <_stogir.stack.validate-scope-inputs+0x150>
    9000:      	movz	x2, #0x0, lsl #48
    9004:      	b	0x8ff4 <_stogir.stack.validate-scope-inputs+0x1e8>
    9008:      	movz	w3, #0x0, lsl #16
    900c:      	uxtb	w16, w3
    9010:      	and	w3, w16, #0x1
    9014:      	uxtb	w3, w3
    9018:      	ubfx	x3, x3, #0, #8
    901c:      	cmp	x3, #0x0
    9020:      	b.eq	0x8fdc <_stogir.stack.validate-scope-inputs+0x1d0>
    9024:      	uxtb	w16, w2
    9028:      	cmp	w16, wzr
    902c:      	b.eq	0x9044 <_stogir.stack.validate-scope-inputs+0x238>
    9030:      	adrp	x17, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009030:  ARM64_RELOC_PAGE21	l_stogir.447
    9034:      	ldr	x17, [x17]
		0000000000009034:  ARM64_RELOC_PAGEOFF12	l_stogir.447
    9038:      	add	x1, x1, x17
    903c:      	ldrb	w1, [x1]
    9040:      	b	0x9048 <_stogir.stack.validate-scope-inputs+0x23c>
    9044:      	movz	w1, #0x0, lsl #16
    9048:      	uxtb	w16, w1
    904c:      	and	w1, w16, #0x4
    9050:      	uxtb	w1, w1
    9054:      	ubfx	x1, x1, #0, #8
    9058:      	cmp	x1, #0x0
    905c:      	cset	w1, eq
    9060:      	uxtb	w16, w1
    9064:      	cmp	w16, wzr
    9068:      	cset	x1, eq
    906c:      	cmp	x1, #0x0
    9070:      	b.ne	0x8fdc <_stogir.stack.validate-scope-inputs+0x1d0>
    9074:      	uxtb	w16, w5
    9078:      	cmp	w16, wzr
    907c:      	b.eq	0x9090 <_stogir.stack.validate-scope-inputs+0x284>
    9080:      	movz	x0, #0x0, lsl #48
    9084:      	mov	x1, #0x8                ; =8
    9088:      	movz	x2, #0x0, lsl #48
    908c:      	b	0x8fec <_stogir.stack.validate-scope-inputs+0x1e0>
    9090:      	sxtw	x4, w4
    9094:      	cmp	x4, #0x0
    9098:      	cset	w1, gt
    909c:      	movz	x16, #0x0, lsl #48
    90a0:      	sub	x2, x16, x4
    90a4:      	sub	x3, x2, #0x1
    90a8:      	uxtb	w16, w1
    90ac:      	cmp	w16, wzr
    90b0:      	b.eq	0x9180 <_stogir.stack.validate-scope-inputs+0x374>
    90b4:      	ldr	x2, [x0, #0x8]
    90b8:      	cmp	x4, x2
    90bc:      	b.ge	0x9178 <_stogir.stack.validate-scope-inputs+0x36c>
    90c0:      	add	x2, x0, #0x78
    90c4:      	ldr	x2, [x2, #0x8]
    90c8:      	cmp	x4, x2
    90cc:      	b.ge	0x921c <_stogir.stack.validate-scope-inputs+0x410>
    90d0:      	ldr	x2, [x0, #0x78]
    90d4:      	add	x2, x2, x4, lsl #2
    90d8:      	ldr	w2, [x2]
    90dc:      	sxtw	x2, w2
    90e0:      	cmp	x2, #0x0
    90e4:      	cset	w2, ge
    90e8:      	ubfx	x2, x2, #0, #8
    90ec:      	b	0x9220 <_stogir.stack.validate-scope-inputs+0x414>
    90f0:      	movz	w1, #0x0, lsl #16
    90f4:      	movz	x0, #0x0, lsl #48
    90f8:      	ubfx	x1, x1, #0, #32
    90fc:      	lsr	x16, x1, #0
    9100:      	cmp	x16, #0x1
    9104:      	b.eq	0x9120 <_stogir.stack.validate-scope-inputs+0x314>
    9108:      	b.lo	0x9110 <_stogir.stack.validate-scope-inputs+0x304>
    910c:      	b	0x9124 <_stogir.stack.validate-scope-inputs+0x318>
    9110:      	cmp	x16, #0x0
    9114:      	b.eq	0x911c <_stogir.stack.validate-scope-inputs+0x310>
    9118:      	b	0x9124 <_stogir.stack.validate-scope-inputs+0x318>
    911c:      	b	0x9128 <_stogir.stack.validate-scope-inputs+0x31c>
    9120:      	b	0x91d0 <_stogir.stack.validate-scope-inputs+0x3c4>
    9124:      	b	0x922c <_stogir.stack.validate-scope-inputs+0x420>
    9128:      	mov	x0, #0x1                ; =1
    912c:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		000000000000912c:  ARM64_RELOC_PAGE21	l_stogir.449
    9130:      	ldr	x1, [x1]
		0000000000009130:  ARM64_RELOC_PAGEOFF12	l_stogir.449
    9134:      	mov	x2, #0x1b               ; =27
    9138:      	b	0x908c <_stogir.stack.validate-scope-inputs+0x280>
    913c:      	ldr	x0, [x0, #0x28]
    9140:      	add	x0, x0, x3, lsl #4
    9144:      	ldr	x0, [x0]
    9148:      	mov	w1, #0x1                ; =1
    914c:      	b	0x90f8 <_stogir.stack.validate-scope-inputs+0x2ec>
    9150:      	movz	x2, #0x0, lsl #48
    9154:      	cmp	x2, #0x0
    9158:      	b.eq	0x90f0 <_stogir.stack.validate-scope-inputs+0x2e4>
    915c:      	uxtb	w16, w1
    9160:      	cmp	w16, wzr
    9164:      	b.eq	0x913c <_stogir.stack.validate-scope-inputs+0x330>
    9168:      	ldr	x0, [x0]
    916c:      	add	x0, x0, x4, lsl #4
    9170:      	ldr	x0, [x0]
    9174:      	b	0x9148 <_stogir.stack.validate-scope-inputs+0x33c>
    9178:      	movz	x2, #0x0, lsl #48
    917c:      	b	0x9154 <_stogir.stack.validate-scope-inputs+0x348>
    9180:      	cmp	x4, #0x0
    9184:      	b.ge	0x9150 <_stogir.stack.validate-scope-inputs+0x344>
    9188:      	add	x5, x0, #0x28
    918c:      	add	x6, x0, #0x50
    9190:      	ldr	x5, [x5, #0x8]
    9194:      	ldr	x6, [x6, #0x8]
    9198:      	cmp	x5, x6
    919c:      	b.ne	0x9214 <_stogir.stack.validate-scope-inputs+0x408>
    91a0:      	cmp	x2, x5
    91a4:      	b.gt	0x9224 <_stogir.stack.validate-scope-inputs+0x418>
    91a8:      	ldr	x2, [x0, #0x50]
    91ac:      	add	x2, x2, x3, lsl #2
    91b0:      	ldr	w2, [x2]
    91b4:      	sxtw	x2, w2
    91b8:      	cmp	x2, #0x0
    91bc:      	cset	w2, gt
    91c0:      	ubfx	x2, x2, #0, #8
    91c4:      	b	0x9228 <_stogir.stack.validate-scope-inputs+0x41c>
    91c8:      	brk	#0
    91cc:      	b	0x91c8 <_stogir.stack.validate-scope-inputs+0x3bc>
    91d0:      	orr	w1, w0, wzr
    91d4:      	ubfx	x1, x1, #0, #32
    91d8:      	ubfx	x1, x1, #8, #8
    91dc:      	cmp	x1, #0x6
    91e0:      	b.ne	0x9200 <_stogir.stack.validate-scope-inputs+0x3f4>
    91e4:      	uxtb	w0, w0
    91e8:      	cmp	x0, #0x48
    91ec:      	b.eq	0x9200 <_stogir.stack.validate-scope-inputs+0x3f4>
    91f0:      	movz	x0, #0x0, lsl #48
    91f4:      	mov	x1, #0x8                ; =8
    91f8:      	movz	x2, #0x0, lsl #48
    91fc:      	b	0x9210 <_stogir.stack.validate-scope-inputs+0x404>
    9200:      	mov	x0, #0x1                ; =1
    9204:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009204:  ARM64_RELOC_PAGE21	l_stogir.450
    9208:      	ldr	x1, [x1]
		0000000000009208:  ARM64_RELOC_PAGEOFF12	l_stogir.450
    920c:      	mov	x2, #0x29               ; =41
    9210:      	b	0x9138 <_stogir.stack.validate-scope-inputs+0x32c>
    9214:      	movz	x2, #0x0, lsl #48
    9218:      	b	0x9154 <_stogir.stack.validate-scope-inputs+0x348>
    921c:      	movz	x2, #0x0, lsl #48
    9220:      	b	0x917c <_stogir.stack.validate-scope-inputs+0x370>
    9224:      	movz	x2, #0x0, lsl #48
    9228:      	b	0x9218 <_stogir.stack.validate-scope-inputs+0x40c>
    922c:      	brk	#0
    9230:      	b	0x922c <_stogir.stack.validate-scope-inputs+0x420>

0000000000009234 <_stogir.stack.validate-inputs>:
    9234:      	sub	sp, sp, #0x110
    9238:      	str	x29, [sp]
    923c:      	str	x30, [sp, #0x8]
    9240:      	mov	x29, sp
    9244:      	str	x19, [sp, #0xb8]
    9248:      	str	x20, [sp, #0xc0]
    924c:      	str	x21, [sp, #0xc8]
    9250:      	str	x22, [sp, #0xd0]
    9254:      	str	x23, [sp, #0xd8]
    9258:      	str	x24, [sp, #0xe0]
    925c:      	str	x25, [sp, #0xe8]
    9260:      	str	x26, [sp, #0xf0]
    9264:      	str	x27, [sp, #0xf8]
    9268:      	str	x28, [sp, #0x100]
    926c:      	sxtw	x1, w1
    9270:      	cmp	x1, #0x51
    9274:      	cset	w19, eq
    9278:      	uxtb	w16, w19
    927c:      	cmp	w16, wzr
    9280:      	b.ne	0x92e8 <_stogir.stack.validate-inputs+0xb4>
    9284:      	cmp	x1, #0x52
    9288:      	b.eq	0x92e8 <_stogir.stack.validate-inputs+0xb4>
    928c:      	str	x8, [sp, #0x90]
    9290:      	mov	x2, #0x1                ; =1
    9294:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009294:  ARM64_RELOC_PAGE21	l_stogir.451
    9298:      	ldr	x1, [x1]
		0000000000009298:  ARM64_RELOC_PAGEOFF12	l_stogir.451
    929c:      	mov	x0, #0x29               ; =41
    92a0:      	ldr	x3, [sp, #0x90]
    92a4:      	str	x2, [x3]
    92a8:      	str	x1, [x3, #0x8]
    92ac:      	str	x0, [x3, #0x10]
    92b0:      	ldr	x19, [sp, #0xb8]
    92b4:      	ldr	x20, [sp, #0xc0]
    92b8:      	ldr	x21, [sp, #0xc8]
    92bc:      	ldr	x22, [sp, #0xd0]
    92c0:      	ldr	x23, [sp, #0xd8]
    92c4:      	ldr	x24, [sp, #0xe0]
    92c8:      	ldr	x25, [sp, #0xe8]
    92cc:      	ldr	x26, [sp, #0xf0]
    92d0:      	ldr	x27, [sp, #0xf8]
    92d4:      	ldr	x28, [sp, #0x100]
    92d8:      	ldr	x29, [sp]
    92dc:      	ldr	x30, [sp, #0x8]
    92e0:      	add	sp, sp, #0x110
    92e4:      	ret
    92e8:      	uxtb	w16, w19
    92ec:      	cmp	w16, wzr
    92f0:      	mov	w16, #0x6               ; =6
    92f4:      	movz	w17, #0x0, lsl #16
    92f8:      	csel	w1, w16, w17, ne
    92fc:      	sxtw	x2, w2
    9300:      	sxtw	x1, w1
    9304:      	cmp	x2, x1
    9308:      	b.ne	0x982c <_stogir.stack.validate-inputs+0x5f8>
    930c:      	sxtw	x20, w5
    9310:      	uxtb	w16, w19
    9314:      	cmp	w16, wzr
    9318:      	b.eq	0x933c <_stogir.stack.validate-inputs+0x108>
    931c:      	cmp	x20, #0x0
    9320:      	b.eq	0x933c <_stogir.stack.validate-inputs+0x108>
    9324:      	cmp	x20, #0x0
    9328:      	b.le	0x93d0 <_stogir.stack.validate-inputs+0x19c>
    932c:      	sub	x1, x20, #0x1
    9330:      	and	x1, x1, x20
    9334:      	cmp	x1, #0x0
    9338:      	b.ne	0x93d0 <_stogir.stack.validate-inputs+0x19c>
    933c:      	mov	w1, w3
    9340:      	mov	x21, x8
    9344:      	add	x8, sp, #0x10
    9348:      	mov	x22, x0
    934c:      	mov	w23, w3
    9350:      	mov	w24, w4
    9354:      	bl	0x9354 <_stogir.stack.validate-inputs+0x120>
		0000000000009354:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    9358:      	add	x16, sp, #0x10
    935c:      	ldr	w0, [x16]
    9360:      	lsr	x16, x0, #0
    9364:      	cmp	x16, #0x1
    9368:      	b.eq	0x9384 <_stogir.stack.validate-inputs+0x150>
    936c:      	b.lo	0x9374 <_stogir.stack.validate-inputs+0x140>
    9370:      	b	0x9388 <_stogir.stack.validate-inputs+0x154>
    9374:      	cmp	x16, #0x0
    9378:      	b.eq	0x9380 <_stogir.stack.validate-inputs+0x14c>
    937c:      	b	0x9388 <_stogir.stack.validate-inputs+0x154>
    9380:      	b	0x938c <_stogir.stack.validate-inputs+0x158>
    9384:      	b	0x93a4 <_stogir.stack.validate-inputs+0x170>
    9388:      	b	0x9648 <_stogir.stack.validate-inputs+0x414>
    938c:      	str	x21, [sp, #0x90]
    9390:      	mov	x2, #0x1                ; =1
    9394:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009394:  ARM64_RELOC_PAGE21	l_stogir.452
    9398:      	ldr	x1, [x1]
		0000000000009398:  ARM64_RELOC_PAGEOFF12	l_stogir.452
    939c:      	mov	x0, #0x1f               ; =31
    93a0:      	b	0x92a0 <_stogir.stack.validate-inputs+0x6c>
    93a4:      	sxtw	x23, w23
    93a8:      	add	x16, sp, #0x10
    93ac:      	ldr	x0, [x16, #0x8]
    93b0:      	cmp	x23, #0x0
    93b4:      	b.gt	0x93d8 <_stogir.stack.validate-inputs+0x1a4>
    93b8:      	str	x21, [sp, #0x90]
    93bc:      	mov	x2, #0x1                ; =1
    93c0:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		00000000000093c0:  ARM64_RELOC_PAGE21	l_stogir.453
    93c4:      	ldr	x1, [x1]
		00000000000093c4:  ARM64_RELOC_PAGEOFF12	l_stogir.453
    93c8:      	mov	x0, #0x1f               ; =31
    93cc:      	b	0x93a0 <_stogir.stack.validate-inputs+0x16c>
    93d0:      	str	x8, [sp, #0x90]
    93d4:      	b	0x9290 <_stogir.stack.validate-inputs+0x5c>
    93d8:      	uxtb	w0, w0
    93dc:      	cmp	x0, #0x83
    93e0:      	cset	w1, lt
    93e4:      	uxtb	w16, w1
    93e8:      	cmp	w16, wzr
    93ec:      	b.eq	0x9404 <_stogir.stack.validate-inputs+0x1d0>
    93f0:      	adrp	x17, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		00000000000093f0:  ARM64_RELOC_PAGE21	l_stogir.454
    93f4:      	ldr	x17, [x17]
		00000000000093f4:  ARM64_RELOC_PAGEOFF12	l_stogir.454
    93f8:      	add	x2, x0, x17
    93fc:      	ldrb	w2, [x2]
    9400:      	b	0x9408 <_stogir.stack.validate-inputs+0x1d4>
    9404:      	movz	w2, #0x0, lsl #16
    9408:      	uxtb	w16, w2
    940c:      	and	w2, w16, #0x1
    9410:      	uxtb	w2, w2
    9414:      	ubfx	x2, x2, #0, #8
    9418:      	cmp	x2, #0x0
    941c:      	b.eq	0x9834 <_stogir.stack.validate-inputs+0x600>
    9420:      	uxtb	w16, w1
    9424:      	cmp	w16, wzr
    9428:      	b.eq	0x9440 <_stogir.stack.validate-inputs+0x20c>
    942c:      	adrp	x17, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		000000000000942c:  ARM64_RELOC_PAGE21	l_stogir.454
    9430:      	ldr	x17, [x17]
		0000000000009430:  ARM64_RELOC_PAGEOFF12	l_stogir.454
    9434:      	add	x0, x0, x17
    9438:      	ldrb	w0, [x0]
    943c:      	b	0x9444 <_stogir.stack.validate-inputs+0x210>
    9440:      	movz	w0, #0x0, lsl #16
    9444:      	uxtb	w16, w0
    9448:      	and	w0, w16, #0x4
    944c:      	uxtb	w0, w0
    9450:      	ubfx	x0, x0, #0, #8
    9454:      	cmp	x0, #0x0
    9458:      	cset	w0, eq
    945c:      	uxtb	w16, w0
    9460:      	cmp	w16, wzr
    9464:      	cset	x0, eq
    9468:      	cmp	x0, #0x0
    946c:      	b.ne	0x983c <_stogir.stack.validate-inputs+0x608>
    9470:      	add	x8, sp, #0x40
    9474:      	mov	x0, x22
    9478:      	mov	w1, w24
    947c:      	bl	0x947c <_stogir.stack.validate-inputs+0x248>
		000000000000947c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    9480:      	add	x16, sp, #0x40
    9484:      	ldr	w0, [x16]
    9488:      	lsr	x16, x0, #0
    948c:      	cmp	x16, #0x1
    9490:      	b.eq	0x94ac <_stogir.stack.validate-inputs+0x278>
    9494:      	b.lo	0x949c <_stogir.stack.validate-inputs+0x268>
    9498:      	b	0x94b0 <_stogir.stack.validate-inputs+0x27c>
    949c:      	cmp	x16, #0x0
    94a0:      	b.eq	0x94a8 <_stogir.stack.validate-inputs+0x274>
    94a4:      	b	0x94b0 <_stogir.stack.validate-inputs+0x27c>
    94a8:      	b	0x94b4 <_stogir.stack.validate-inputs+0x280>
    94ac:      	b	0x94cc <_stogir.stack.validate-inputs+0x298>
    94b0:      	b	0x9734 <_stogir.stack.validate-inputs+0x500>
    94b4:      	str	x21, [sp, #0x90]
    94b8:      	mov	x2, #0x1                ; =1
    94bc:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		00000000000094bc:  ARM64_RELOC_PAGE21	l_stogir.455
    94c0:      	ldr	x1, [x1]
		00000000000094c0:  ARM64_RELOC_PAGEOFF12	l_stogir.455
    94c4:      	mov	x0, #0x18               ; =24
    94c8:      	b	0x93cc <_stogir.stack.validate-inputs+0x198>
    94cc:      	add	x16, sp, #0x40
    94d0:      	ldr	x0, [x16, #0x8]
    94d4:      	orr	w1, w0, wzr
    94d8:      	ubfx	x1, x1, #0, #32
    94dc:      	ubfx	x1, x1, #8, #8
    94e0:      	cmp	x1, #0x1
    94e4:      	b.lt	0x9844 <_stogir.stack.validate-inputs+0x610>
    94e8:      	cmp	x1, #0xb
    94ec:      	b.gt	0x984c <_stogir.stack.validate-inputs+0x618>
    94f0:      	uxtb	w0, w0
    94f4:      	cmp	x0, #0x48
    94f8:      	b.eq	0x9854 <_stogir.stack.validate-inputs+0x620>
    94fc:      	sxtw	x0, w24
    9500:      	cmp	x1, #0x0
    9504:      	cset	w23, eq
    9508:      	cmp	x1, #0x1
    950c:      	cset	w25, eq
    9510:      	cmp	x1, #0x2
    9514:      	cset	w26, eq
    9518:      	cmp	x1, #0x7
    951c:      	cset	w27, eq
    9520:      	cmp	x1, #0x8
    9524:      	cset	w28, eq
    9528:      	cmp	x1, #0x3
    952c:      	cset	w2, eq
    9530:      	cmp	x1, #0x9
    9534:      	cset	w3, eq
    9538:      	cmp	x1, #0x4
    953c:      	cset	w4, eq
    9540:      	cmp	x1, #0xa
    9544:      	cset	w5, eq
    9548:      	cmp	x1, #0xd
    954c:      	cset	w6, eq
    9550:      	cmp	x1, #0x5
    9554:      	cset	w7, eq
    9558:      	cmp	x1, #0xb
    955c:      	cset	w8, eq
    9560:      	cmp	x1, #0xc
    9564:      	cset	w9, eq
    9568:      	cmp	x1, #0x6
    956c:      	cset	w1, eq
    9570:      	uxtb	w16, w1
    9574:      	cmp	w16, wzr
    9578:      	mov	w16, #0x8               ; =8
    957c:      	movn	w17, #0x0, lsl #16
    9580:      	csel	w1, w16, w17, ne
    9584:      	cmp	x0, #0x0
    9588:      	b.ge	0x985c <_stogir.stack.validate-inputs+0x628>
    958c:      	uxtb	w16, w19
    9590:      	cmp	w16, wzr
    9594:      	b.eq	0x95a0 <_stogir.stack.validate-inputs+0x36c>
    9598:      	cmp	x20, #0x10
    959c:      	b.gt	0x95a4 <_stogir.stack.validate-inputs+0x370>
    95a0:      	mov	x20, #0x10              ; =16
    95a4:      	mov	x0, x22
    95a8:      	mov	w19, w2
    95ac:      	mov	x2, x20
    95b0:      	mov	w20, w3
    95b4:      	mov	w22, w4
    95b8:      	str	w7, [sp, #0x98]
    95bc:      	str	w8, [sp, #0xa0]
    95c0:      	add	x8, sp, #0x70
    95c4:      	str	w9, [sp, #0xa8]
    95c8:      	str	w1, [sp, #0xb0]
    95cc:      	mov	w1, w24
    95d0:      	mov	w24, w5
    95d4:      	str	x21, [sp, #0x90]
    95d8:      	mov	w21, w6
    95dc:      	bl	0x95dc <_stogir.stack.validate-inputs+0x3a8>
		00000000000095dc:  ARM64_RELOC_BRANCH26	_stogir.stack.constant-size-aligned
    95e0:      	add	x16, sp, #0x70
    95e4:      	ldr	w0, [x16]
    95e8:      	lsr	x16, x0, #0
    95ec:      	cmp	x16, #0x1
    95f0:      	b.eq	0x960c <_stogir.stack.validate-inputs+0x3d8>
    95f4:      	b.lo	0x95fc <_stogir.stack.validate-inputs+0x3c8>
    95f8:      	b	0x9610 <_stogir.stack.validate-inputs+0x3dc>
    95fc:      	cmp	x16, #0x0
    9600:      	b.eq	0x9608 <_stogir.stack.validate-inputs+0x3d4>
    9604:      	b	0x9610 <_stogir.stack.validate-inputs+0x3dc>
    9608:      	b	0x973c <_stogir.stack.validate-inputs+0x508>
    960c:      	b	0x9614 <_stogir.stack.validate-inputs+0x3e0>
    9610:      	b	0x9810 <_stogir.stack.validate-inputs+0x5dc>
    9614:      	add	x16, sp, #0x70
    9618:      	orr	x0, x16, xzr
    961c:      	add	x0, x0, #0x8
    9620:      	add	x16, sp, #0x70
    9624:      	ldr	x1, [x16, #0x8]
    9628:      	ldr	x0, [x0, #0x8]
    962c:      	mov	x2, #0x1                ; =1
    9630:      	b	0x9698 <_stogir.stack.validate-inputs+0x464>
    9634:      	mov	x2, #0x1                ; =1
    9638:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009638:  ARM64_RELOC_PAGE21	l_stogir.456
    963c:      	ldr	x1, [x1]
		000000000000963c:  ARM64_RELOC_PAGEOFF12	l_stogir.456
    9640:      	mov	x0, #0x29               ; =41
    9644:      	b	0x94c8 <_stogir.stack.validate-inputs+0x294>
    9648:      	brk	#0
    964c:      	b	0x9648 <_stogir.stack.validate-inputs+0x414>
    9650:      	mov	w3, #0x1                ; =1
    9654:      	sxtw	x3, w3
    9658:      	and	x1, x3, #0xffffffff
    965c:      	movz	x2, #0x0, lsl #48
    9660:      	movz	x0, #0x0, lsl #48
    9664:      	b	0x9644 <_stogir.stack.validate-inputs+0x410>
    9668:      	uxtb	w16, w23
    966c:      	cmp	w16, wzr
    9670:      	b.eq	0x969c <_stogir.stack.validate-inputs+0x468>
    9674:      	movz	w3, #0x0, lsl #16
    9678:      	b	0x9654 <_stogir.stack.validate-inputs+0x420>
    967c:      	mov	w16, #0x1               ; =1
    9680:      	str	w16, [sp, #0xb0]
    9684:      	ldr	w3, [sp, #0xb0]
    9688:      	sxtw	x3, w3
    968c:      	and	x1, x3, #0xffffffff
    9690:      	movz	x2, #0x0, lsl #48
    9694:      	movz	x0, #0x0, lsl #48
    9698:      	b	0x9664 <_stogir.stack.validate-inputs+0x430>
    969c:      	uxtb	w16, w25
    96a0:      	cmp	w16, wzr
    96a4:      	b.ne	0x9650 <_stogir.stack.validate-inputs+0x41c>
    96a8:      	uxtb	w16, w26
    96ac:      	cmp	w16, wzr
    96b0:      	b.ne	0x9650 <_stogir.stack.validate-inputs+0x41c>
    96b4:      	uxtb	w16, w27
    96b8:      	cmp	w16, wzr
    96bc:      	b.ne	0x9650 <_stogir.stack.validate-inputs+0x41c>
    96c0:      	uxtb	w16, w28
    96c4:      	cmp	w16, wzr
    96c8:      	b.ne	0x9650 <_stogir.stack.validate-inputs+0x41c>
    96cc:      	uxtb	w16, w19
    96d0:      	cmp	w16, wzr
    96d4:      	b.ne	0x97fc <_stogir.stack.validate-inputs+0x5c8>
    96d8:      	uxtb	w16, w20
    96dc:      	cmp	w16, wzr
    96e0:      	b.ne	0x97fc <_stogir.stack.validate-inputs+0x5c8>
    96e4:      	uxtb	w16, w22
    96e8:      	cmp	w16, wzr
    96ec:      	b.ne	0x9818 <_stogir.stack.validate-inputs+0x5e4>
    96f0:      	uxtb	w16, w24
    96f4:      	cmp	w16, wzr
    96f8:      	b.ne	0x9818 <_stogir.stack.validate-inputs+0x5e4>
    96fc:      	uxtb	w16, w21
    9700:      	cmp	w16, wzr
    9704:      	b.ne	0x9818 <_stogir.stack.validate-inputs+0x5e4>
    9708:      	uxtb	w16, w0
    970c:      	cmp	w16, wzr
    9710:      	b.ne	0x972c <_stogir.stack.validate-inputs+0x4f8>
    9714:      	uxtb	w16, w1
    9718:      	cmp	w16, wzr
    971c:      	b.ne	0x972c <_stogir.stack.validate-inputs+0x4f8>
    9720:      	uxtb	w16, w2
    9724:      	cmp	w16, wzr
    9728:      	b.eq	0x9730 <_stogir.stack.validate-inputs+0x4fc>
    972c:      	mov	w3, #0x8                ; =8
    9730:      	b	0x981c <_stogir.stack.validate-inputs+0x5e8>
    9734:      	brk	#0
    9738:      	b	0x9734 <_stogir.stack.validate-inputs+0x500>
    973c:      	uxtb	w16, w23
    9740:      	cmp	w16, wzr
    9744:      	b.eq	0x9754 <_stogir.stack.validate-inputs+0x520>
    9748:      	movz	w16, #0x0, lsl #16
    974c:      	str	w16, [sp, #0xb0]
    9750:      	b	0x9684 <_stogir.stack.validate-inputs+0x450>
    9754:      	uxtb	w16, w25
    9758:      	cmp	w16, wzr
    975c:      	b.ne	0x967c <_stogir.stack.validate-inputs+0x448>
    9760:      	uxtb	w16, w26
    9764:      	cmp	w16, wzr
    9768:      	b.ne	0x967c <_stogir.stack.validate-inputs+0x448>
    976c:      	uxtb	w16, w27
    9770:      	cmp	w16, wzr
    9774:      	b.ne	0x967c <_stogir.stack.validate-inputs+0x448>
    9778:      	uxtb	w16, w28
    977c:      	cmp	w16, wzr
    9780:      	b.ne	0x967c <_stogir.stack.validate-inputs+0x448>
    9784:      	uxtb	w16, w19
    9788:      	cmp	w16, wzr
    978c:      	b.ne	0x9804 <_stogir.stack.validate-inputs+0x5d0>
    9790:      	uxtb	w16, w20
    9794:      	cmp	w16, wzr
    9798:      	b.ne	0x9804 <_stogir.stack.validate-inputs+0x5d0>
    979c:      	uxtb	w16, w22
    97a0:      	cmp	w16, wzr
    97a4:      	b.ne	0x9820 <_stogir.stack.validate-inputs+0x5ec>
    97a8:      	uxtb	w16, w24
    97ac:      	cmp	w16, wzr
    97b0:      	b.ne	0x9820 <_stogir.stack.validate-inputs+0x5ec>
    97b4:      	uxtb	w16, w21
    97b8:      	cmp	w16, wzr
    97bc:      	b.ne	0x9820 <_stogir.stack.validate-inputs+0x5ec>
    97c0:      	ldr	w0, [sp, #0x98]
    97c4:      	uxtb	w16, w0
    97c8:      	cmp	w16, wzr
    97cc:      	b.ne	0x97f0 <_stogir.stack.validate-inputs+0x5bc>
    97d0:      	ldr	w1, [sp, #0xa0]
    97d4:      	uxtb	w16, w1
    97d8:      	cmp	w16, wzr
    97dc:      	b.ne	0x97f0 <_stogir.stack.validate-inputs+0x5bc>
    97e0:      	ldr	w2, [sp, #0xa8]
    97e4:      	uxtb	w16, w2
    97e8:      	cmp	w16, wzr
    97ec:      	b.eq	0x97f8 <_stogir.stack.validate-inputs+0x5c4>
    97f0:      	mov	w16, #0x8               ; =8
    97f4:      	str	w16, [sp, #0xb0]
    97f8:      	b	0x9828 <_stogir.stack.validate-inputs+0x5f4>
    97fc:      	mov	w3, #0x2                ; =2
    9800:      	b	0x9654 <_stogir.stack.validate-inputs+0x420>
    9804:      	mov	w16, #0x2               ; =2
    9808:      	str	w16, [sp, #0xb0]
    980c:      	b	0x9684 <_stogir.stack.validate-inputs+0x450>
    9810:      	brk	#0
    9814:      	b	0x9810 <_stogir.stack.validate-inputs+0x5dc>
    9818:      	mov	w3, #0x4                ; =4
    981c:      	b	0x9800 <_stogir.stack.validate-inputs+0x5cc>
    9820:      	mov	w16, #0x4               ; =4
    9824:      	str	w16, [sp, #0xb0]
    9828:      	b	0x980c <_stogir.stack.validate-inputs+0x5d8>
    982c:      	str	x8, [sp, #0x90]
    9830:      	b	0x9290 <_stogir.stack.validate-inputs+0x5c>
    9834:      	str	x21, [sp, #0x90]
    9838:      	b	0x93bc <_stogir.stack.validate-inputs+0x188>
    983c:      	str	x21, [sp, #0x90]
    9840:      	b	0x93bc <_stogir.stack.validate-inputs+0x188>
    9844:      	str	x21, [sp, #0x90]
    9848:      	b	0x9634 <_stogir.stack.validate-inputs+0x400>
    984c:      	str	x21, [sp, #0x90]
    9850:      	b	0x9634 <_stogir.stack.validate-inputs+0x400>
    9854:      	str	x21, [sp, #0x90]
    9858:      	b	0x9634 <_stogir.stack.validate-inputs+0x400>
    985c:      	str	x21, [sp, #0x90]
    9860:      	mov	w19, w2
    9864:      	mov	w20, w3
    9868:      	mov	w3, w1
    986c:      	mov	w22, w4
    9870:      	mov	w24, w5
    9874:      	mov	w21, w6
    9878:      	mov	w0, w7
    987c:      	mov	w1, w8
    9880:      	mov	w2, w9
    9884:      	b	0x9668 <_stogir.stack.validate-inputs+0x434>

0000000000009888 <_stogir.locals.shape>:
    9888:      	sub	sp, sp, #0x50
    988c:      	str	x29, [sp]
    9890:      	str	x30, [sp, #0x8]
    9894:      	mov	x29, sp
    9898:      	str	x19, [sp, #0x20]
    989c:      	str	x20, [sp, #0x28]
    98a0:      	str	x21, [sp, #0x30]
    98a4:      	str	x22, [sp, #0x38]
    98a8:      	str	x23, [sp, #0x40]
    98ac:      	sxtw	x19, w1
    98b0:      	lsl	x20, x19, #2
    98b4:      	cmp	x19, #0x0
    98b8:      	cset	w1, gt
    98bc:      	movz	x16, #0x0, lsl #48
    98c0:      	sub	x3, x16, x19
    98c4:      	sub	x4, x3, #0x1
    98c8:      	uxtb	w16, w1
    98cc:      	cmp	w16, wzr
    98d0:      	b.eq	0x9910 <_stogir.locals.shape+0x88>
    98d4:      	ldr	x3, [x0, #0x8]
    98d8:      	cmp	x19, x3
    98dc:      	b.ge	0x9974 <_stogir.locals.shape+0xec>
    98e0:      	add	x3, x0, #0x78
    98e4:      	ldr	x3, [x3, #0x8]
    98e8:      	cmp	x19, x3
    98ec:      	b.ge	0x9b04 <_stogir.locals.shape+0x27c>
    98f0:      	ldr	x3, [x0, #0x78]
    98f4:      	add	x3, x20, x3
    98f8:      	ldr	w3, [x3]
    98fc:      	sxtw	x3, w3
    9900:      	cmp	x3, #0x0
    9904:      	cset	w3, ge
    9908:      	ubfx	x3, x3, #0, #8
    990c:      	b	0x9b08 <_stogir.locals.shape+0x280>
    9910:      	cmp	x19, #0x0
    9914:      	b.ge	0x997c <_stogir.locals.shape+0xf4>
    9918:      	add	x5, x0, #0x28
    991c:      	add	x6, x0, #0x50
    9920:      	ldr	x5, [x5, #0x8]
    9924:      	ldr	x6, [x6, #0x8]
    9928:      	cmp	x5, x6
    992c:      	b.ne	0x9958 <_stogir.locals.shape+0xd0>
    9930:      	cmp	x3, x5
    9934:      	b.gt	0x9c08 <_stogir.locals.shape+0x380>
    9938:      	ldr	x3, [x0, #0x50]
    993c:      	add	x3, x3, x4, lsl #2
    9940:      	ldr	w3, [x3]
    9944:      	sxtw	x3, w3
    9948:      	cmp	x3, #0x0
    994c:      	cset	w3, gt
    9950:      	ubfx	x3, x3, #0, #8
    9954:      	b	0x9c0c <_stogir.locals.shape+0x384>
    9958:      	movz	x3, #0x0, lsl #48
    995c:      	b	0x9980 <_stogir.locals.shape+0xf8>
    9960:      	mov	x1, #0x1                ; =1
    9964:      	adrp	x0, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009964:  ARM64_RELOC_PAGE21	l_stogir.457
    9968:      	ldr	x0, [x0]
		0000000000009968:  ARM64_RELOC_PAGEOFF12	l_stogir.457
    996c:      	mov	x21, #0x1c              ; =28
    9970:      	b	0x9a10 <_stogir.locals.shape+0x188>
    9974:      	movz	x3, #0x0, lsl #48
    9978:      	b	0x9980 <_stogir.locals.shape+0xf8>
    997c:      	movz	x3, #0x0, lsl #48
    9980:      	cmp	x3, #0x0
    9984:      	b.eq	0x99c0 <_stogir.locals.shape+0x138>
    9988:      	uxtb	w16, w1
    998c:      	cmp	w16, wzr
    9990:      	b.eq	0x99a8 <_stogir.locals.shape+0x120>
    9994:      	ldr	x1, [x0]
    9998:      	add	x1, x1, x19, lsl #4
    999c:      	ldr	x3, [x1]
    99a0:      	ldr	x1, [x1, #0x8]
    99a4:      	b	0x99b8 <_stogir.locals.shape+0x130>
    99a8:      	ldr	x1, [x0, #0x28]
    99ac:      	add	x1, x1, x4, lsl #4
    99b0:      	ldr	x3, [x1]
    99b4:      	ldr	x1, [x1, #0x8]
    99b8:      	mov	w4, #0x1                ; =1
    99bc:      	b	0x99cc <_stogir.locals.shape+0x144>
    99c0:      	movz	w4, #0x0, lsl #16
    99c4:      	movz	x3, #0x0, lsl #48
    99c8:      	movz	x1, #0x0, lsl #48
    99cc:      	ubfx	x4, x4, #0, #32
    99d0:      	lsr	x16, x4, #0
    99d4:      	cmp	x16, #0x1
    99d8:      	b.eq	0x99f4 <_stogir.locals.shape+0x16c>
    99dc:      	b.lo	0x99e4 <_stogir.locals.shape+0x15c>
    99e0:      	b	0x99f8 <_stogir.locals.shape+0x170>
    99e4:      	cmp	x16, #0x0
    99e8:      	b.eq	0x99f0 <_stogir.locals.shape+0x168>
    99ec:      	b	0x99f8 <_stogir.locals.shape+0x170>
    99f0:      	b	0x99fc <_stogir.locals.shape+0x174>
    99f4:      	b	0x9a40 <_stogir.locals.shape+0x1b8>
    99f8:      	b	0x9c18 <_stogir.locals.shape+0x390>
    99fc:      	mov	x22, x8
    9a00:      	mov	x1, #0x1                ; =1
    9a04:      	adrp	x0, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009a04:  ARM64_RELOC_PAGE21	l_stogir.458
    9a08:      	ldr	x0, [x0]
		0000000000009a08:  ARM64_RELOC_PAGEOFF12	l_stogir.458
    9a0c:      	mov	x21, #0x16              ; =22
    9a10:      	str	x1, [x22]
    9a14:      	str	x0, [x22, #0x8]
    9a18:      	str	x21, [x22, #0x10]
    9a1c:      	ldr	x19, [sp, #0x20]
    9a20:      	ldr	x20, [sp, #0x28]
    9a24:      	ldr	x21, [sp, #0x30]
    9a28:      	ldr	x22, [sp, #0x38]
    9a2c:      	ldr	x23, [sp, #0x40]
    9a30:      	ldr	x29, [sp]
    9a34:      	ldr	x30, [sp, #0x8]
    9a38:      	add	sp, sp, #0x50
    9a3c:      	ret
    9a40:      	asr	x21, x1, #32
    9a44:      	orr	w4, w3, wzr
    9a48:      	add	x16, sp, #0x10
    9a4c:      	str	x3, [x16]
    9a50:      	ubfx	x4, x4, #0, #32
    9a54:      	add	x16, sp, #0x10
    9a58:      	str	x1, [x16, #0x8]
    9a5c:      	ubfx	x1, x4, #8, #8
    9a60:      	mov	x22, x8
    9a64:      	mov	x23, x0
    9a68:      	mov	w0, w1
    9a6c:      	mov	w1, w2
    9a70:      	bl	0x9a70 <_stogir.locals.shape+0x1e8>
		0000000000009a70:  ARM64_RELOC_BRANCH26	_stogir.types.size
    9a74:      	sxtw	x0, w0
    9a78:      	cmp	x21, #0x0
    9a7c:      	b.ne	0x9a84 <_stogir.locals.shape+0x1fc>
    9a80:      	mov	x21, x0
    9a84:      	add	x16, sp, #0x10
    9a88:      	ldr	w1, [x16, #0x8]
    9a8c:      	sxtw	x1, w1
    9a90:      	cmp	x1, #0x0
    9a94:      	cset	w2, eq
    9a98:      	ubfx	x2, x2, #0, #8
    9a9c:      	cmp	x1, #0x0
    9aa0:      	b.le	0x9b44 <_stogir.locals.shape+0x2bc>
    9aa4:      	add	x3, x23, #0x110
    9aa8:      	add	x4, x3, #0x28
    9aac:      	ldr	x4, [x4, #0x8]
    9ab0:      	cmp	x1, x4
    9ab4:      	b.gt	0x9b0c <_stogir.locals.shape+0x284>
    9ab8:      	sub	x1, x1, #0x1
    9abc:      	mov	x17, #0x18              ; =24
    9ac0:      	mul	x1, x1, x17
    9ac4:      	ldr	x4, [x3, #0x28]
    9ac8:      	add	x1, x1, x4
    9acc:      	ldr	x4, [x1]
    9ad0:      	ldr	x1, [x1, #0x8]
    9ad4:      	ldr	x3, [x3, #0x8]
    9ad8:      	cmp	x4, #0x0
    9adc:      	b.lt	0x9c10 <_stogir.locals.shape+0x388>
    9ae0:      	cmp	x4, x3
    9ae4:      	b.gt	0x9c10 <_stogir.locals.shape+0x388>
    9ae8:      	cmp	x1, #0x0
    9aec:      	b.lt	0x9c10 <_stogir.locals.shape+0x388>
    9af0:      	sub	x3, x3, x4
    9af4:      	cmp	x1, x3
    9af8:      	b.gt	0x9c10 <_stogir.locals.shape+0x388>
    9afc:      	mov	w1, #0x1                ; =1
    9b00:      	b	0x9c14 <_stogir.locals.shape+0x38c>
    9b04:      	movz	x3, #0x0, lsl #48
    9b08:      	b	0x9978 <_stogir.locals.shape+0xf0>
    9b0c:      	movz	w1, #0x0, lsl #16
    9b10:      	ubfx	x1, x1, #0, #32
    9b14:      	lsr	x16, x1, #0
    9b18:      	cmp	x16, #0x1
    9b1c:      	b.eq	0x9b38 <_stogir.locals.shape+0x2b0>
    9b20:      	b.lo	0x9b28 <_stogir.locals.shape+0x2a0>
    9b24:      	b	0x9b3c <_stogir.locals.shape+0x2b4>
    9b28:      	cmp	x16, #0x0
    9b2c:      	b.eq	0x9b34 <_stogir.locals.shape+0x2ac>
    9b30:      	b	0x9b3c <_stogir.locals.shape+0x2b4>
    9b34:      	b	0x9b44 <_stogir.locals.shape+0x2bc>
    9b38:      	b	0x9b40 <_stogir.locals.shape+0x2b8>
    9b3c:      	b	0x9c20 <_stogir.locals.shape+0x398>
    9b40:      	mov	x2, #0x1                ; =1
    9b44:      	cmp	x19, #0x0
    9b48:      	b.le	0x9960 <_stogir.locals.shape+0xd8>
    9b4c:      	add	x16, sp, #0x10
    9b50:      	ldr	w1, [x16]
    9b54:      	uxtb	w1, w1
    9b58:      	cmp	x1, #0x48
    9b5c:      	b.ne	0x9960 <_stogir.locals.shape+0xd8>
    9b60:      	ldr	x1, [x23, #0x78]
    9b64:      	add	x1, x20, x1
    9b68:      	ldr	w1, [x1]
    9b6c:      	sxtw	x1, w1
    9b70:      	cmp	x1, #0x3
    9b74:      	b.ne	0x9960 <_stogir.locals.shape+0xd8>
    9b78:      	cmp	x0, #0x0
    9b7c:      	b.le	0x9960 <_stogir.locals.shape+0xd8>
    9b80:      	cmp	x2, #0x0
    9b84:      	b.eq	0x9960 <_stogir.locals.shape+0xd8>
    9b88:      	cmp	x21, #0x0
    9b8c:      	b.le	0x9960 <_stogir.locals.shape+0xd8>
    9b90:      	sub	x1, x21, #0x1
    9b94:      	and	x1, x1, x21
    9b98:      	cmp	x1, #0x0
    9b9c:      	b.ne	0x9960 <_stogir.locals.shape+0xd8>
    9ba0:      	add	x16, sp, #0x10
    9ba4:      	ldr	w1, [x16, #0x4]
    9ba8:      	sxtw	x1, w1
    9bac:      	cmp	x1, #0x0
    9bb0:      	cset	w2, gt
    9bb4:      	movz	x16, #0x0, lsl #48
    9bb8:      	sub	x3, x16, x1
    9bbc:      	sub	x4, x3, #0x1
    9bc0:      	uxtb	w16, w2
    9bc4:      	cmp	w16, wzr
    9bc8:      	b.eq	0x9c3c <_stogir.locals.shape+0x3b4>
    9bcc:      	ldr	x3, [x23, #0x8]
    9bd0:      	cmp	x1, x3
    9bd4:      	b.ge	0x9c84 <_stogir.locals.shape+0x3fc>
    9bd8:      	add	x3, x23, #0x78
    9bdc:      	ldr	x3, [x3, #0x8]
    9be0:      	cmp	x1, x3
    9be4:      	b.ge	0x9d50 <_stogir.locals.shape+0x4c8>
    9be8:      	ldr	x3, [x23, #0x78]
    9bec:      	add	x3, x3, x1, lsl #2
    9bf0:      	ldr	w3, [x3]
    9bf4:      	sxtw	x3, w3
    9bf8:      	cmp	x3, #0x0
    9bfc:      	cset	w3, ge
    9c00:      	ubfx	x3, x3, #0, #8
    9c04:      	b	0x9d54 <_stogir.locals.shape+0x4cc>
    9c08:      	movz	x3, #0x0, lsl #48
    9c0c:      	b	0x995c <_stogir.locals.shape+0xd4>
    9c10:      	movz	w1, #0x0, lsl #16
    9c14:      	b	0x9b10 <_stogir.locals.shape+0x288>
    9c18:      	brk	#0
    9c1c:      	b	0x9c18 <_stogir.locals.shape+0x390>
    9c20:      	brk	#0
    9c24:      	b	0x9c20 <_stogir.locals.shape+0x398>
    9c28:      	mov	x1, #0x1                ; =1
    9c2c:      	adrp	x0, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009c2c:  ARM64_RELOC_PAGE21	l_stogir.459
    9c30:      	ldr	x0, [x0]
		0000000000009c30:  ARM64_RELOC_PAGEOFF12	l_stogir.459
    9c34:      	mov	x21, #0x2c              ; =44
    9c38:      	b	0x9970 <_stogir.locals.shape+0xe8>
    9c3c:      	cmp	x1, #0x0
    9c40:      	b.ge	0x9c8c <_stogir.locals.shape+0x404>
    9c44:      	add	x5, x23, #0x28
    9c48:      	add	x6, x23, #0x50
    9c4c:      	ldr	x5, [x5, #0x8]
    9c50:      	ldr	x6, [x6, #0x8]
    9c54:      	cmp	x5, x6
    9c58:      	b.ne	0x9d48 <_stogir.locals.shape+0x4c0>
    9c5c:      	cmp	x3, x5
    9c60:      	b.gt	0x9d58 <_stogir.locals.shape+0x4d0>
    9c64:      	ldr	x3, [x23, #0x50]
    9c68:      	add	x3, x3, x4, lsl #2
    9c6c:      	ldr	w3, [x3]
    9c70:      	sxtw	x3, w3
    9c74:      	cmp	x3, #0x0
    9c78:      	cset	w3, gt
    9c7c:      	ubfx	x3, x3, #0, #8
    9c80:      	b	0x9d5c <_stogir.locals.shape+0x4d4>
    9c84:      	movz	x3, #0x0, lsl #48
    9c88:      	b	0x9c90 <_stogir.locals.shape+0x408>
    9c8c:      	movz	x3, #0x0, lsl #48
    9c90:      	cmp	x3, #0x0
    9c94:      	b.eq	0x9cc8 <_stogir.locals.shape+0x440>
    9c98:      	uxtb	w16, w2
    9c9c:      	cmp	w16, wzr
    9ca0:      	b.eq	0x9cb4 <_stogir.locals.shape+0x42c>
    9ca4:      	ldr	x2, [x23]
    9ca8:      	add	x1, x2, x1, lsl #4
    9cac:      	ldr	x1, [x1]
    9cb0:      	b	0x9cc0 <_stogir.locals.shape+0x438>
    9cb4:      	ldr	x1, [x23, #0x28]
    9cb8:      	add	x1, x1, x4, lsl #4
    9cbc:      	ldr	x1, [x1]
    9cc0:      	mov	w2, #0x1                ; =1
    9cc4:      	b	0x9cd0 <_stogir.locals.shape+0x448>
    9cc8:      	movz	w2, #0x0, lsl #16
    9ccc:      	movz	x1, #0x0, lsl #48
    9cd0:      	ubfx	x2, x2, #0, #32
    9cd4:      	lsr	x16, x2, #0
    9cd8:      	cmp	x16, #0x1
    9cdc:      	b.eq	0x9cf8 <_stogir.locals.shape+0x470>
    9ce0:      	b.lo	0x9ce8 <_stogir.locals.shape+0x460>
    9ce4:      	b	0x9cfc <_stogir.locals.shape+0x474>
    9ce8:      	cmp	x16, #0x0
    9cec:      	b.eq	0x9cf4 <_stogir.locals.shape+0x46c>
    9cf0:      	b	0x9cfc <_stogir.locals.shape+0x474>
    9cf4:      	b	0x9d00 <_stogir.locals.shape+0x478>
    9cf8:      	b	0x9d14 <_stogir.locals.shape+0x48c>
    9cfc:      	b	0x9d98 <_stogir.locals.shape+0x510>
    9d00:      	mov	x1, #0x1                ; =1
    9d04:      	adrp	x0, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009d04:  ARM64_RELOC_PAGE21	l_stogir.460
    9d08:      	ldr	x0, [x0]
		0000000000009d08:  ARM64_RELOC_PAGEOFF12	l_stogir.460
    9d0c:      	mov	x21, #0x1d              ; =29
    9d10:      	b	0x9c38 <_stogir.locals.shape+0x3b0>
    9d14:      	add	x16, sp, #0x10
    9d18:      	ldr	w2, [x16, #0x4]
    9d1c:      	sxtw	x2, w2
    9d20:      	cmp	x2, #0x0
    9d24:      	b.le	0x9c28 <_stogir.locals.shape+0x3a0>
    9d28:      	uxtb	w1, w1
    9d2c:      	cmp	x1, #0x83
    9d30:      	b.ge	0x9d60 <_stogir.locals.shape+0x4d8>
    9d34:      	adrp	x17, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009d34:  ARM64_RELOC_PAGE21	l_stogir.461
    9d38:      	ldr	x17, [x17]
		0000000000009d38:  ARM64_RELOC_PAGEOFF12	l_stogir.461
    9d3c:      	add	x1, x1, x17
    9d40:      	ldrb	w1, [x1]
    9d44:      	b	0x9d64 <_stogir.locals.shape+0x4dc>
    9d48:      	movz	x3, #0x0, lsl #48
    9d4c:      	b	0x9c90 <_stogir.locals.shape+0x408>
    9d50:      	movz	x3, #0x0, lsl #48
    9d54:      	b	0x9c88 <_stogir.locals.shape+0x400>
    9d58:      	movz	x3, #0x0, lsl #48
    9d5c:      	b	0x9d4c <_stogir.locals.shape+0x4c4>
    9d60:      	movz	w1, #0x0, lsl #16
    9d64:      	uxtb	w16, w1
    9d68:      	and	w1, w16, #0x2
    9d6c:      	uxtb	w1, w1
    9d70:      	ubfx	x1, x1, #0, #8
    9d74:      	cmp	x1, #0x0
    9d78:      	cset	w1, eq
    9d7c:      	uxtb	w16, w1
    9d80:      	cmp	w16, wzr
    9d84:      	cset	x1, eq
    9d88:      	cmp	x1, #0x0
    9d8c:      	b.eq	0x9c28 <_stogir.locals.shape+0x3a0>
    9d90:      	movz	x1, #0x0, lsl #48
    9d94:      	b	0x9c38 <_stogir.locals.shape+0x3b0>
    9d98:      	brk	#0
    9d9c:      	b	0x9d98 <_stogir.locals.shape+0x510>

0000000000009da0 <_stogir.conversion.policy>:
    9da0:      	sub	sp, sp, #0x70
    9da4:      	str	x29, [sp]
    9da8:      	str	x30, [sp, #0x8]
    9dac:      	mov	x29, sp
    9db0:      	str	x19, [sp, #0x18]
    9db4:      	str	x20, [sp, #0x20]
    9db8:      	str	x21, [sp, #0x28]
    9dbc:      	str	x22, [sp, #0x30]
    9dc0:      	str	x23, [sp, #0x38]
    9dc4:      	str	x24, [sp, #0x40]
    9dc8:      	str	x25, [sp, #0x48]
    9dcc:      	str	x26, [sp, #0x50]
    9dd0:      	str	x27, [sp, #0x58]
    9dd4:      	str	x28, [sp, #0x60]
    9dd8:      	sxtw	x19, w0
    9ddc:      	sxtw	x20, w1
    9de0:      	sxtw	x21, w2
    9de4:      	cmp	x19, #0x24
    9de8:      	b.ne	0x9e24 <_stogir.conversion.policy+0x84>
    9dec:      	cmp	x20, #0xf
    9df0:      	b.le	0xa00c <_stogir.conversion.policy+0x26c>
    9df4:      	cmp	x20, #0x80
    9df8:      	b.ge	0xa00c <_stogir.conversion.policy+0x26c>
    9dfc:      	and	w0, w1, #0xf
    9e00:      	ubfx	x0, x0, #0, #32
    9e04:      	cmp	x0, #0x1
    9e08:      	b.lt	0xa00c <_stogir.conversion.policy+0x26c>
    9e0c:      	cmp	x0, #0xd
    9e10:      	b.gt	0xa00c <_stogir.conversion.policy+0x26c>
    9e14:      	mov	x22, #0x1               ; =1
    9e18:      	b	0x9e20 <_stogir.conversion.policy+0x80>
    9e1c:      	movz	x22, #0x0, lsl #48
    9e20:      	b	0x9e28 <_stogir.conversion.policy+0x88>
    9e24:      	movz	x22, #0x0, lsl #48
    9e28:      	sxtw	x0, w3
    9e2c:      	cmp	x20, #0xd
    9e30:      	cset	w23, eq
    9e34:      	cmp	x20, #0xc
    9e38:      	cset	w24, eq
    9e3c:      	cmp	x0, #0x4
    9e40:      	cset	w25, eq
    9e44:      	cmp	x0, #0x8
    9e48:      	cset	w26, eq
    9e4c:      	cmp	x22, #0x0
    9e50:      	b.eq	0xa2d0 <_stogir.conversion.policy+0x530>
    9e54:      	orr	w0, w3, wzr
    9e58:      	str	x8, [sp, #0x10]
    9e5c:      	mov	w28, w2
    9e60:      	mov	w27, w3
    9e64:      	fmov	s31, w0
    9e68:      	mov	w0, w1
    9e6c:      	fmov	w1, s31
    9e70:      	bl	0x9e70 <_stogir.conversion.policy+0xd0>
		0000000000009e70:  ARM64_RELOC_BRANCH26	_stogir.types.size
    9e74:      	b	0x9e7c <_stogir.conversion.policy+0xdc>
    9e78:      	mov	w0, #0x1                ; =1
    9e7c:      	cmp	x21, #0xd
    9e80:      	cset	w1, eq
    9e84:      	cmp	x21, #0xc
    9e88:      	cset	w2, eq
    9e8c:      	cmp	x22, #0x0
    9e90:      	b.eq	0xa2e0 <_stogir.conversion.policy+0x540>
    9e94:      	mov	w22, w0
    9e98:      	mov	w0, w28
    9e9c:      	mov	w28, w1
    9ea0:      	mov	w1, w27
    9ea4:      	mov	w25, w2
    9ea8:      	bl	0x9ea8 <_stogir.conversion.policy+0x108>
		0000000000009ea8:  ARM64_RELOC_BRANCH26	_stogir.types.size
    9eac:      	orr	w27, w0, wzr
    9eb0:      	mov	w0, w25
    9eb4:      	b	0x9ebc <_stogir.conversion.policy+0x11c>
    9eb8:      	mov	w27, #0x1               ; =1
    9ebc:      	cmp	x19, #0x21
    9ec0:      	b.lt	0x9f94 <_stogir.conversion.policy+0x1f4>
    9ec4:      	cmp	x19, #0x27
    9ec8:      	b.gt	0x9f94 <_stogir.conversion.policy+0x1f4>
    9ecc:      	lsl	w1, w22, #3
    9ed0:      	sxtw	x1, w1
    9ed4:      	cmp	x1, #0x0
    9ed8:      	b.le	0x9f94 <_stogir.conversion.policy+0x1f4>
    9edc:      	lsl	w2, w27, #3
    9ee0:      	sxtw	x2, w2
    9ee4:      	cmp	x2, #0x0
    9ee8:      	b.le	0x9f94 <_stogir.conversion.policy+0x1f4>
    9eec:      	cmp	x19, #0x26
    9ef0:      	cset	w3, eq
    9ef4:      	cmp	x20, #0x1
    9ef8:      	cset	w4, ge
    9efc:      	cmp	x20, #0xb
    9f00:      	cset	w5, le
    9f04:      	cmp	x21, #0x1
    9f08:      	cset	w6, ge
    9f0c:      	cmp	x21, #0xb
    9f10:      	cset	w7, le
    9f14:      	cmp	x19, #0x25
    9f18:      	b.lt	0xa18c <_stogir.conversion.policy+0x3ec>
    9f1c:      	ubfx	x8, x28, #0, #8
    9f20:      	cmp	x19, #0x25
    9f24:      	b.ne	0xa1fc <_stogir.conversion.policy+0x45c>
    9f28:      	uxtb	w16, w4
    9f2c:      	cmp	w16, wzr
    9f30:      	b.eq	0xa1f4 <_stogir.conversion.policy+0x454>
    9f34:      	uxtb	w16, w5
    9f38:      	cmp	w16, wzr
    9f3c:      	b.eq	0xa1f4 <_stogir.conversion.policy+0x454>
    9f40:      	uxtb	w16, w0
    9f44:      	cmp	w16, wzr
    9f48:      	b.eq	0x9f50 <_stogir.conversion.policy+0x1b0>
    9f4c:      	mov	x8, #0x1                ; =1
    9f50:      	b	0xa1f8 <_stogir.conversion.policy+0x458>
    9f54:      	uxtb	w16, w25
    9f58:      	cmp	w16, wzr
    9f5c:      	b.ne	0x9fec <_stogir.conversion.policy+0x24c>
    9f60:      	uxtb	w16, w26
    9f64:      	cmp	w16, wzr
    9f68:      	b.ne	0x9fec <_stogir.conversion.policy+0x24c>
    9f6c:      	movn	w27, #0x0, lsl #16
    9f70:      	b	0x9ebc <_stogir.conversion.policy+0x11c>
    9f74:      	uxtb	w16, w25
    9f78:      	cmp	w16, wzr
    9f7c:      	b.ne	0x9ffc <_stogir.conversion.policy+0x25c>
    9f80:      	uxtb	w16, w26
    9f84:      	cmp	w16, wzr
    9f88:      	b.ne	0x9ffc <_stogir.conversion.policy+0x25c>
    9f8c:      	movn	w0, #0x0, lsl #16
    9f90:      	b	0x9e7c <_stogir.conversion.policy+0xdc>
    9f94:      	mov	x1, #0x1                ; =1
    9f98:      	adrp	x0, 0x9000 <_stogir.stack.validate-scope-inputs+0x1f4>
		0000000000009f98:  ARM64_RELOC_PAGE21	l_stogir.462
    9f9c:      	ldr	x0, [x0]
		0000000000009f9c:  ARM64_RELOC_PAGEOFF12	l_stogir.462
    9fa0:      	mov	x2, #0x22               ; =34
    9fa4:      	ldr	x3, [sp, #0x10]
    9fa8:      	str	x1, [x3]
    9fac:      	str	x0, [x3, #0x8]
    9fb0:      	str	x2, [x3, #0x10]
    9fb4:      	ldr	x19, [sp, #0x18]
    9fb8:      	ldr	x20, [sp, #0x20]
    9fbc:      	ldr	x21, [sp, #0x28]
    9fc0:      	ldr	x22, [sp, #0x30]
    9fc4:      	ldr	x23, [sp, #0x38]
    9fc8:      	ldr	x24, [sp, #0x40]
    9fcc:      	ldr	x25, [sp, #0x48]
    9fd0:      	ldr	x26, [sp, #0x50]
    9fd4:      	ldr	x27, [sp, #0x58]
    9fd8:      	ldr	x28, [sp, #0x60]
    9fdc:      	ldr	x29, [sp]
    9fe0:      	ldr	x30, [sp, #0x8]
    9fe4:      	add	sp, sp, #0x70
    9fe8:      	ret
    9fec:      	cmp	x21, #0x0
    9ff0:      	b.ne	0xa044 <_stogir.conversion.policy+0x2a4>
    9ff4:      	movz	w27, #0x0, lsl #16
    9ff8:      	b	0x9ebc <_stogir.conversion.policy+0x11c>
    9ffc:      	cmp	x20, #0x0
    a000:      	b.ne	0xa0bc <_stogir.conversion.policy+0x31c>
    a004:      	movz	w0, #0x0, lsl #16
    a008:      	b	0x9e7c <_stogir.conversion.policy+0xdc>
    a00c:      	cmp	x21, #0xf
    a010:      	b.le	0x9e1c <_stogir.conversion.policy+0x7c>
    a014:      	cmp	x21, #0x80
    a018:      	b.ge	0xa03c <_stogir.conversion.policy+0x29c>
    a01c:      	and	w0, w2, #0xf
    a020:      	ubfx	x0, x0, #0, #32
    a024:      	cmp	x0, #0x1
    a028:      	b.lt	0xa134 <_stogir.conversion.policy+0x394>
    a02c:      	cmp	x0, #0xd
    a030:      	cset	w0, le
    a034:      	ubfx	x22, x0, #0, #8
    a038:      	b	0xa138 <_stogir.conversion.policy+0x398>
    a03c:      	movz	x22, #0x0, lsl #48
    a040:      	b	0x9e20 <_stogir.conversion.policy+0x80>
    a044:      	cmp	x21, #0x1
    a048:      	b.eq	0x9eb8 <_stogir.conversion.policy+0x118>
    a04c:      	cmp	x21, #0x2
    a050:      	b.eq	0x9eb8 <_stogir.conversion.policy+0x118>
    a054:      	cmp	x21, #0x7
    a058:      	b.eq	0x9eb8 <_stogir.conversion.policy+0x118>
    a05c:      	cmp	x21, #0x8
    a060:      	b.eq	0x9eb8 <_stogir.conversion.policy+0x118>
    a064:      	cmp	x21, #0x3
    a068:      	b.eq	0xa228 <_stogir.conversion.policy+0x488>
    a06c:      	cmp	x21, #0x9
    a070:      	b.eq	0xa228 <_stogir.conversion.policy+0x488>
    a074:      	cmp	x21, #0x4
    a078:      	b.eq	0xa298 <_stogir.conversion.policy+0x4f8>
    a07c:      	cmp	x21, #0xa
    a080:      	b.eq	0xa298 <_stogir.conversion.policy+0x4f8>
    a084:      	uxtb	w16, w28
    a088:      	cmp	w16, wzr
    a08c:      	b.ne	0xa298 <_stogir.conversion.policy+0x4f8>
    a090:      	cmp	x21, #0x5
    a094:      	b.eq	0xa2b8 <_stogir.conversion.policy+0x518>
    a098:      	cmp	x21, #0xb
    a09c:      	b.eq	0xa2b8 <_stogir.conversion.policy+0x518>
    a0a0:      	uxtb	w16, w0
    a0a4:      	cmp	w16, wzr
    a0a8:      	b.ne	0xa2b8 <_stogir.conversion.policy+0x518>
    a0ac:      	cmp	x21, #0x6
    a0b0:      	b.eq	0xa0b8 <_stogir.conversion.policy+0x318>
    a0b4:      	movn	w27, #0x0, lsl #16
    a0b8:      	b	0xa2bc <_stogir.conversion.policy+0x51c>
    a0bc:      	cmp	x20, #0x1
    a0c0:      	b.eq	0x9e78 <_stogir.conversion.policy+0xd8>
    a0c4:      	cmp	x20, #0x2
    a0c8:      	b.eq	0x9e78 <_stogir.conversion.policy+0xd8>
    a0cc:      	cmp	x20, #0x7
    a0d0:      	b.eq	0x9e78 <_stogir.conversion.policy+0xd8>
    a0d4:      	cmp	x20, #0x8
    a0d8:      	b.eq	0x9e78 <_stogir.conversion.policy+0xd8>
    a0dc:      	cmp	x20, #0x3
    a0e0:      	b.eq	0xa230 <_stogir.conversion.policy+0x490>
    a0e4:      	cmp	x20, #0x9
    a0e8:      	b.eq	0xa230 <_stogir.conversion.policy+0x490>
    a0ec:      	cmp	x20, #0x4
    a0f0:      	b.eq	0xa2a0 <_stogir.conversion.policy+0x500>
    a0f4:      	cmp	x20, #0xa
    a0f8:      	b.eq	0xa2a0 <_stogir.conversion.policy+0x500>
    a0fc:      	uxtb	w16, w23
    a100:      	cmp	w16, wzr
    a104:      	b.ne	0xa2a0 <_stogir.conversion.policy+0x500>
    a108:      	cmp	x20, #0x5
    a10c:      	b.eq	0xa2c0 <_stogir.conversion.policy+0x520>
    a110:      	cmp	x20, #0xb
    a114:      	b.eq	0xa2c0 <_stogir.conversion.policy+0x520>
    a118:      	uxtb	w16, w24
    a11c:      	cmp	w16, wzr
    a120:      	b.ne	0xa2c0 <_stogir.conversion.policy+0x520>
    a124:      	cmp	x20, #0x6
    a128:      	b.ne	0xa2c8 <_stogir.conversion.policy+0x528>
    a12c:      	mov	w0, w27
    a130:      	b	0xa2cc <_stogir.conversion.policy+0x52c>
    a134:      	movz	x22, #0x0, lsl #48
    a138:      	b	0xa040 <_stogir.conversion.policy+0x2a0>
    a13c:      	mov	x0, #0x1                ; =1
    a140:      	cmp	x0, #0x0
    a144:      	b.ne	0x9f94 <_stogir.conversion.policy+0x1f4>
    a148:      	cmp	x19, #0x23
    a14c:      	b.eq	0xa15c <_stogir.conversion.policy+0x3bc>
    a150:      	uxtb	w16, w3
    a154:      	cmp	w16, wzr
    a158:      	b.eq	0xa160 <_stogir.conversion.policy+0x3c0>
    a15c:      	mov	x1, x2
    a160:      	and	x0, x1, #0xffffffff
    a164:      	movz	x1, #0x0, lsl #48
    a168:      	movz	x2, #0x0, lsl #48
    a16c:      	b	0x9fa4 <_stogir.conversion.policy+0x204>
    a170:      	movz	x8, #0x0, lsl #48
    a174:      	cmp	x8, #0x0
    a178:      	cset	w0, ne
    a17c:      	uxtb	w16, w0
    a180:      	cmp	w16, wzr
    a184:      	cset	x0, eq
    a188:      	b	0xa140 <_stogir.conversion.policy+0x3a0>
    a18c:      	cmp	x19, #0x24
    a190:      	b.ne	0xa1ac <_stogir.conversion.policy+0x40c>
    a194:      	cmp	x1, x2
    a198:      	cset	w0, eq
    a19c:      	uxtb	w16, w0
    a1a0:      	cmp	w16, wzr
    a1a4:      	cset	x0, eq
    a1a8:      	b	0xa140 <_stogir.conversion.policy+0x3a0>
    a1ac:      	uxtb	w16, w4
    a1b0:      	cmp	w16, wzr
    a1b4:      	b.eq	0xa13c <_stogir.conversion.policy+0x39c>
    a1b8:      	uxtb	w16, w5
    a1bc:      	cmp	w16, wzr
    a1c0:      	b.eq	0xa13c <_stogir.conversion.policy+0x39c>
    a1c4:      	uxtb	w16, w6
    a1c8:      	cmp	w16, wzr
    a1cc:      	b.eq	0xa268 <_stogir.conversion.policy+0x4c8>
    a1d0:      	uxtb	w16, w7
    a1d4:      	cmp	w16, wzr
    a1d8:      	b.eq	0xa268 <_stogir.conversion.policy+0x4c8>
    a1dc:      	cmp	x19, #0x23
    a1e0:      	b.ne	0xa2a8 <_stogir.conversion.policy+0x508>
    a1e4:      	cmp	x2, x1
    a1e8:      	cset	w0, ge
    a1ec:      	ubfx	x0, x0, #0, #8
    a1f0:      	b	0xa2b4 <_stogir.conversion.policy+0x514>
    a1f4:      	movz	x8, #0x0, lsl #48
    a1f8:      	b	0xa174 <_stogir.conversion.policy+0x3d4>
    a1fc:      	uxtb	w16, w3
    a200:      	cmp	w16, wzr
    a204:      	b.eq	0xa240 <_stogir.conversion.policy+0x4a0>
    a208:      	uxtb	w16, w24
    a20c:      	cmp	w16, wzr
    a210:      	b.ne	0xa284 <_stogir.conversion.policy+0x4e4>
    a214:      	uxtb	w16, w23
    a218:      	cmp	w16, wzr
    a21c:      	b.ne	0xa284 <_stogir.conversion.policy+0x4e4>
    a220:      	movz	x8, #0x0, lsl #48
    a224:      	b	0xa23c <_stogir.conversion.policy+0x49c>
    a228:      	mov	w27, #0x2               ; =2
    a22c:      	b	0x9ebc <_stogir.conversion.policy+0x11c>
    a230:      	mov	w0, #0x2                ; =2
    a234:      	b	0x9e7c <_stogir.conversion.policy+0xdc>
    a238:      	movz	x8, #0x0, lsl #48
    a23c:      	b	0xa174 <_stogir.conversion.policy+0x3d4>
    a240:      	cmp	x19, #0x27
    a244:      	b.ne	0xa170 <_stogir.conversion.policy+0x3d0>
    a248:      	uxtb	w16, w24
    a24c:      	cmp	w16, wzr
    a250:      	b.ne	0xa270 <_stogir.conversion.policy+0x4d0>
    a254:      	uxtb	w16, w23
    a258:      	cmp	w16, wzr
    a25c:      	b.ne	0xa270 <_stogir.conversion.policy+0x4d0>
    a260:      	movz	x8, #0x0, lsl #48
    a264:      	b	0xa280 <_stogir.conversion.policy+0x4e0>
    a268:      	mov	x0, #0x1                ; =1
    a26c:      	b	0xa140 <_stogir.conversion.policy+0x3a0>
    a270:      	uxtb	w16, w0
    a274:      	cmp	w16, wzr
    a278:      	b.eq	0xa280 <_stogir.conversion.policy+0x4e0>
    a27c:      	mov	x8, #0x1                ; =1
    a280:      	b	0xa174 <_stogir.conversion.policy+0x3d4>
    a284:      	uxtb	w16, w6
    a288:      	cmp	w16, wzr
    a28c:      	b.eq	0xa238 <_stogir.conversion.policy+0x498>
    a290:      	ubfx	x8, x7, #0, #8
    a294:      	b	0xa23c <_stogir.conversion.policy+0x49c>
    a298:      	mov	w27, #0x4               ; =4
    a29c:      	b	0xa22c <_stogir.conversion.policy+0x48c>
    a2a0:      	mov	w0, #0x4                ; =4
    a2a4:      	b	0xa234 <_stogir.conversion.policy+0x494>
    a2a8:      	cmp	x2, x1
    a2ac:      	cset	w0, le
    a2b0:      	ubfx	x0, x0, #0, #8
    a2b4:      	b	0xa26c <_stogir.conversion.policy+0x4cc>
    a2b8:      	mov	w27, #0x8               ; =8
    a2bc:      	b	0xa29c <_stogir.conversion.policy+0x4fc>
    a2c0:      	mov	w0, #0x8                ; =8
    a2c4:      	b	0xa2a4 <_stogir.conversion.policy+0x504>
    a2c8:      	movn	w0, #0x0, lsl #16
    a2cc:      	b	0xa2c4 <_stogir.conversion.policy+0x524>
    a2d0:      	str	x8, [sp, #0x10]
    a2d4:      	mov	w28, w2
    a2d8:      	mov	w27, w3
    a2dc:      	b	0x9f74 <_stogir.conversion.policy+0x1d4>
    a2e0:      	mov	w22, w0
    a2e4:      	mov	w28, w1
    a2e8:      	mov	w0, w2
    a2ec:      	b	0x9f54 <_stogir.conversion.policy+0x1b4>

000000000000a2f0 <_stogir.conditional.operands>:
    a2f0:      	sub	sp, sp, #0x20
    a2f4:      	sxtw	x5, w1
    a2f8:      	cmp	x5, #0x0
    a2fc:      	b.eq	0xa348 <_stogir.conditional.operands+0x58>
    a300:      	cmp	x5, #0x0
    a304:      	b.lt	0xa320 <_stogir.conditional.operands+0x30>
    a308:      	cmp	x5, #0xd
    a30c:      	b.gt	0xa320 <_stogir.conditional.operands+0x30>
    a310:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a310:  ARM64_RELOC_PAGE21	l_stogir.463
    a314:      	ldr	x1, [x1]
		000000000000a314:  ARM64_RELOC_PAGEOFF12	l_stogir.463
    a318:      	movz	x6, #0x0, lsl #48
    a31c:      	b	0xa354 <_stogir.conditional.operands+0x64>
    a320:      	cmp	x5, #0xf
    a324:      	b.le	0xa348 <_stogir.conditional.operands+0x58>
    a328:      	cmp	x5, #0x80
    a32c:      	b.ge	0xa348 <_stogir.conditional.operands+0x58>
    a330:      	and	w1, w1, #0xf
    a334:      	ubfx	x1, x1, #0, #32
    a338:      	cmp	x1, #0x1
    a33c:      	b.lt	0xa348 <_stogir.conditional.operands+0x58>
    a340:      	cmp	x1, #0xd
    a344:      	b.le	0xa310 <_stogir.conditional.operands+0x20>
    a348:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a348:  ARM64_RELOC_PAGE21	l_stogir.464
    a34c:      	ldr	x1, [x1]
		000000000000a34c:  ARM64_RELOC_PAGEOFF12	l_stogir.464
    a350:      	mov	x6, #0x2b               ; =43
    a354:      	sxtw	x2, w2
    a358:      	cmp	x2, #0x0
    a35c:      	cset	w7, gt
    a360:      	movz	x16, #0x0, lsl #48
    a364:      	sub	x9, x16, x2
    a368:      	sub	x10, x9, #0x1
    a36c:      	uxtb	w16, w7
    a370:      	cmp	w16, wzr
    a374:      	b.eq	0xa3b4 <_stogir.conditional.operands+0xc4>
    a378:      	ldr	x9, [x0, #0x8]
    a37c:      	cmp	x2, x9
    a380:      	b.ge	0xa40c <_stogir.conditional.operands+0x11c>
    a384:      	add	x9, x0, #0x78
    a388:      	ldr	x9, [x9, #0x8]
    a38c:      	cmp	x2, x9
    a390:      	b.ge	0xa70c <_stogir.conditional.operands+0x41c>
    a394:      	ldr	x9, [x0, #0x78]
    a398:      	add	x9, x9, x2, lsl #2
    a39c:      	ldr	w9, [x9]
    a3a0:      	sxtw	x9, w9
    a3a4:      	cmp	x9, #0x0
    a3a8:      	cset	w9, ge
    a3ac:      	ubfx	x9, x9, #0, #8
    a3b0:      	b	0xa710 <_stogir.conditional.operands+0x420>
    a3b4:      	cmp	x2, #0x0
    a3b8:      	b.ge	0xa414 <_stogir.conditional.operands+0x124>
    a3bc:      	add	x11, x0, #0x28
    a3c0:      	add	x12, x0, #0x50
    a3c4:      	ldr	x11, [x11, #0x8]
    a3c8:      	ldr	x12, [x12, #0x8]
    a3cc:      	cmp	x11, x12
    a3d0:      	b.ne	0xa3fc <_stogir.conditional.operands+0x10c>
    a3d4:      	cmp	x9, x11
    a3d8:      	b.gt	0xa714 <_stogir.conditional.operands+0x424>
    a3dc:      	ldr	x9, [x0, #0x50]
    a3e0:      	add	x9, x9, x10, lsl #2
    a3e4:      	ldr	w9, [x9]
    a3e8:      	sxtw	x9, w9
    a3ec:      	cmp	x9, #0x0
    a3f0:      	cset	w9, gt
    a3f4:      	ubfx	x9, x9, #0, #8
    a3f8:      	b	0xa718 <_stogir.conditional.operands+0x428>
    a3fc:      	movz	x9, #0x0, lsl #48
    a400:      	b	0xa418 <_stogir.conditional.operands+0x128>
    a404:      	movz	x12, #0x0, lsl #48
    a408:      	b	0xa4a4 <_stogir.conditional.operands+0x1b4>
    a40c:      	movz	x9, #0x0, lsl #48
    a410:      	b	0xa418 <_stogir.conditional.operands+0x128>
    a414:      	movz	x9, #0x0, lsl #48
    a418:      	cmp	x9, #0x0
    a41c:      	b.eq	0xa450 <_stogir.conditional.operands+0x160>
    a420:      	uxtb	w16, w7
    a424:      	cmp	w16, wzr
    a428:      	b.eq	0xa43c <_stogir.conditional.operands+0x14c>
    a42c:      	ldr	x7, [x0]
    a430:      	add	x2, x7, x2, lsl #4
    a434:      	ldr	x2, [x2]
    a438:      	b	0xa448 <_stogir.conditional.operands+0x158>
    a43c:      	ldr	x2, [x0, #0x28]
    a440:      	add	x2, x2, x10, lsl #4
    a444:      	ldr	x2, [x2]
    a448:      	mov	w7, #0x1                ; =1
    a44c:      	b	0xa458 <_stogir.conditional.operands+0x168>
    a450:      	movz	w7, #0x0, lsl #16
    a454:      	movz	x2, #0x0, lsl #48
    a458:      	ubfx	x7, x7, #0, #32
    a45c:      	lsr	x16, x7, #0
    a460:      	cmp	x16, #0x1
    a464:      	b.eq	0xa480 <_stogir.conditional.operands+0x190>
    a468:      	b.lo	0xa470 <_stogir.conditional.operands+0x180>
    a46c:      	b	0xa484 <_stogir.conditional.operands+0x194>
    a470:      	cmp	x16, #0x0
    a474:      	b.eq	0xa47c <_stogir.conditional.operands+0x18c>
    a478:      	b	0xa484 <_stogir.conditional.operands+0x194>
    a47c:      	b	0xa488 <_stogir.conditional.operands+0x198>
    a480:      	b	0xa4a8 <_stogir.conditional.operands+0x1b8>
    a484:      	b	0xa72c <_stogir.conditional.operands+0x43c>
    a488:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a488:  ARM64_RELOC_PAGE21	l_stogir.465
    a48c:      	ldr	x1, [x1]
		000000000000a48c:  ARM64_RELOC_PAGEOFF12	l_stogir.465
    a490:      	mov	x6, #0x16               ; =22
    a494:      	b	0xa4e8 <_stogir.conditional.operands+0x1f8>
    a498:      	movz	x12, #0x0, lsl #48
    a49c:      	b	0xa528 <_stogir.conditional.operands+0x238>
    a4a0:      	movz	x12, #0x0, lsl #48
    a4a4:      	b	0xa530 <_stogir.conditional.operands+0x240>
    a4a8:      	uxtb	w7, w2
    a4ac:      	cmp	x7, #0x48
    a4b0:      	b.eq	0xa4dc <_stogir.conditional.operands+0x1ec>
    a4b4:      	cmp	x7, #0x46
    a4b8:      	b.eq	0xa4dc <_stogir.conditional.operands+0x1ec>
    a4bc:      	ubfx	x7, x2, #0, #32
    a4c0:      	ubfx	x7, x7, #8, #8
    a4c4:      	cmp	x7, #0x0
    a4c8:      	b.eq	0xa4dc <_stogir.conditional.operands+0x1ec>
    a4cc:      	ubfx	x2, x2, #0, #32
    a4d0:      	ubfx	x2, x2, #8, #8
    a4d4:      	cmp	x2, #0xd
    a4d8:      	b.le	0xa4e8 <_stogir.conditional.operands+0x1f8>
    a4dc:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a4dc:  ARM64_RELOC_PAGE21	l_stogir.466
    a4e0:      	ldr	x1, [x1]
		000000000000a4e0:  ARM64_RELOC_PAGEOFF12	l_stogir.466
    a4e4:      	mov	x6, #0x2a               ; =42
    a4e8:      	add	x16, sp, #0x10
    a4ec:      	orr	x2, x16, xzr
    a4f0:      	add	x7, x0, #0x78
    a4f4:      	add	x9, x0, #0x28
    a4f8:      	add	x10, x0, #0x50
    a4fc:      	mov	x16, sp
    a500:      	str	w3, [x16]
    a504:      	mov	x16, sp
    a508:      	str	w4, [x16, #0x4]
    a50c:      	mov	x16, sp
    a510:      	ldr	x3, [x16]
    a514:      	add	x16, sp, #0x10
    a518:      	str	x3, [x16]
    a51c:      	movz	x3, #0x0, lsl #48
    a520:      	b	0xa5e0 <_stogir.conditional.operands+0x2f0>
    a524:      	movz	x12, #0x0, lsl #48
    a528:      	b	0xa530 <_stogir.conditional.operands+0x240>
    a52c:      	movz	x12, #0x0, lsl #48
    a530:      	cmp	x12, #0x0
    a534:      	b.eq	0xa568 <_stogir.conditional.operands+0x278>
    a538:      	uxtb	w16, w4
    a53c:      	cmp	w16, wzr
    a540:      	b.eq	0xa554 <_stogir.conditional.operands+0x264>
    a544:      	ldr	x4, [x0]
    a548:      	add	x4, x4, x11, lsl #4
    a54c:      	ldr	x4, [x4]
    a550:      	b	0xa560 <_stogir.conditional.operands+0x270>
    a554:      	ldr	x4, [x0, #0x28]
    a558:      	add	x4, x4, x13, lsl #4
    a55c:      	ldr	x4, [x4]
    a560:      	mov	w11, #0x1               ; =1
    a564:      	b	0xa570 <_stogir.conditional.operands+0x280>
    a568:      	movz	w11, #0x0, lsl #16
    a56c:      	movz	x4, #0x0, lsl #48
    a570:      	ubfx	x11, x11, #0, #32
    a574:      	lsr	x16, x11, #0
    a578:      	cmp	x16, #0x1
    a57c:      	b.eq	0xa598 <_stogir.conditional.operands+0x2a8>
    a580:      	b.lo	0xa588 <_stogir.conditional.operands+0x298>
    a584:      	b	0xa59c <_stogir.conditional.operands+0x2ac>
    a588:      	cmp	x16, #0x0
    a58c:      	b.eq	0xa594 <_stogir.conditional.operands+0x2a4>
    a590:      	b	0xa59c <_stogir.conditional.operands+0x2ac>
    a594:      	b	0xa5a0 <_stogir.conditional.operands+0x2b0>
    a598:      	b	0xa5b0 <_stogir.conditional.operands+0x2c0>
    a59c:      	b	0xa724 <_stogir.conditional.operands+0x434>
    a5a0:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a5a0:  ARM64_RELOC_PAGE21	l_stogir.467
    a5a4:      	ldr	x1, [x1]
		000000000000a5a4:  ARM64_RELOC_PAGEOFF12	l_stogir.467
    a5a8:      	mov	x6, #0x10               ; =16
    a5ac:      	b	0xa5e0 <_stogir.conditional.operands+0x2f0>
    a5b0:      	uxtb	w11, w4
    a5b4:      	cmp	x11, #0x48
    a5b8:      	b.eq	0xa5d4 <_stogir.conditional.operands+0x2e4>
    a5bc:      	cmp	x11, #0x46
    a5c0:      	b.eq	0xa5d4 <_stogir.conditional.operands+0x2e4>
    a5c4:      	ubfx	x4, x4, #0, #32
    a5c8:      	ubfx	x4, x4, #8, #8
    a5cc:      	cmp	x4, x5
    a5d0:      	b.eq	0xa5e0 <_stogir.conditional.operands+0x2f0>
    a5d4:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a5d4:  ARM64_RELOC_PAGE21	l_stogir.468
    a5d8:      	ldr	x1, [x1]
		000000000000a5d8:  ARM64_RELOC_PAGEOFF12	l_stogir.468
    a5dc:      	mov	x6, #0x21               ; =33
    a5e0:      	cmp	x3, #0x2
    a5e4:      	b.ge	0xa608 <_stogir.conditional.operands+0x318>
    a5e8:      	add	x4, x3, #0x1
    a5ec:      	add	x3, x2, x3, lsl #2
    a5f0:      	ldr	w3, [x3]
    a5f4:      	movn	w17, #0x0, lsl #16
    a5f8:      	and	w11, w3, w17
    a5fc:      	mov	x3, x4
    a600:      	mov	w4, #0x1                ; =1
    a604:      	b	0xa610 <_stogir.conditional.operands+0x320>
    a608:      	movz	w4, #0x0, lsl #16
    a60c:      	movz	w11, #0x0, lsl #16
    a610:      	ubfx	x4, x4, #0, #32
    a614:      	lsr	x16, x4, #0
    a618:      	cmp	x16, #0x1
    a61c:      	b.eq	0xa638 <_stogir.conditional.operands+0x348>
    a620:      	b.lo	0xa628 <_stogir.conditional.operands+0x338>
    a624:      	b	0xa63c <_stogir.conditional.operands+0x34c>
    a628:      	cmp	x16, #0x0
    a62c:      	b.eq	0xa634 <_stogir.conditional.operands+0x344>
    a630:      	b	0xa63c <_stogir.conditional.operands+0x34c>
    a634:      	b	0xa69c <_stogir.conditional.operands+0x3ac>
    a638:      	b	0xa640 <_stogir.conditional.operands+0x350>
    a63c:      	b	0xa71c <_stogir.conditional.operands+0x42c>
    a640:      	sxtw	x11, w11
    a644:      	cmp	x11, #0x0
    a648:      	cset	w4, gt
    a64c:      	movz	x16, #0x0, lsl #48
    a650:      	sub	x12, x16, x11
    a654:      	sub	x13, x12, #0x1
    a658:      	uxtb	w16, w4
    a65c:      	cmp	w16, wzr
    a660:      	b.eq	0xa6cc <_stogir.conditional.operands+0x3dc>
    a664:      	ldr	x12, [x0, #0x8]
    a668:      	cmp	x11, x12
    a66c:      	b.ge	0xa524 <_stogir.conditional.operands+0x234>
    a670:      	ldr	x12, [x7, #0x8]
    a674:      	cmp	x11, x12
    a678:      	b.ge	0xa498 <_stogir.conditional.operands+0x1a8>
    a67c:      	ldr	x12, [x0, #0x78]
    a680:      	add	x12, x12, x11, lsl #2
    a684:      	ldr	w12, [x12]
    a688:      	sxtw	x12, w12
    a68c:      	cmp	x12, #0x0
    a690:      	cset	w12, ge
    a694:      	ubfx	x12, x12, #0, #8
    a698:      	b	0xa49c <_stogir.conditional.operands+0x1ac>
    a69c:      	cmp	x6, #0x0
    a6a0:      	b.ne	0xa6b4 <_stogir.conditional.operands+0x3c4>
    a6a4:      	and	x1, x5, #0xffffffff
    a6a8:      	movz	x0, #0x0, lsl #48
    a6ac:      	movz	x6, #0x0, lsl #48
    a6b0:      	b	0xa6b8 <_stogir.conditional.operands+0x3c8>
    a6b4:      	mov	x0, #0x1                ; =1
    a6b8:      	str	x0, [x8]
    a6bc:      	str	x1, [x8, #0x8]
    a6c0:      	str	x6, [x8, #0x10]
    a6c4:      	add	sp, sp, #0x20
    a6c8:      	ret
    a6cc:      	cmp	x11, #0x0
    a6d0:      	b.ge	0xa52c <_stogir.conditional.operands+0x23c>
    a6d4:      	ldr	x14, [x9, #0x8]
    a6d8:      	ldr	x15, [x10, #0x8]
    a6dc:      	cmp	x14, x15
    a6e0:      	b.ne	0xa4a0 <_stogir.conditional.operands+0x1b0>
    a6e4:      	cmp	x12, x14
    a6e8:      	b.gt	0xa404 <_stogir.conditional.operands+0x114>
    a6ec:      	ldr	x12, [x0, #0x50]
    a6f0:      	add	x12, x12, x13, lsl #2
    a6f4:      	ldr	w12, [x12]
    a6f8:      	sxtw	x12, w12
    a6fc:      	cmp	x12, #0x0
    a700:      	cset	w12, gt
    a704:      	ubfx	x12, x12, #0, #8
    a708:      	b	0xa408 <_stogir.conditional.operands+0x118>
    a70c:      	movz	x9, #0x0, lsl #48
    a710:      	b	0xa410 <_stogir.conditional.operands+0x120>
    a714:      	movz	x9, #0x0, lsl #48
    a718:      	b	0xa400 <_stogir.conditional.operands+0x110>
    a71c:      	brk	#0
    a720:      	b	0xa71c <_stogir.conditional.operands+0x42c>
    a724:      	brk	#0
    a728:      	b	0xa724 <_stogir.conditional.operands+0x434>
    a72c:      	brk	#0
    a730:      	b	0xa72c <_stogir.conditional.operands+0x43c>

000000000000a734 <_stogir.floating.operands>:
    a734:      	sub	sp, sp, #0x90
    a738:      	str	x29, [sp]
    a73c:      	str	x30, [sp, #0x8]
    a740:      	mov	x29, sp
    a744:      	str	x19, [sp, #0x60]
    a748:      	str	x20, [sp, #0x68]
    a74c:      	str	x21, [sp, #0x70]
    a750:      	str	x22, [sp, #0x78]
    a754:      	str	x23, [sp, #0x80]
    a758:      	sxtw	x1, w1
    a75c:      	sxtw	x19, w2
    a760:      	cmp	x1, #0x1f
    a764:      	cset	w2, eq
    a768:      	cmp	x1, #0x20
    a76c:      	cset	w6, eq
    a770:      	cmp	x1, #0xe
    a774:      	b.lt	0xa7a0 <_stogir.floating.operands+0x6c>
    a778:      	cmp	x1, #0x19
    a77c:      	b.gt	0xa7a0 <_stogir.floating.operands+0x6c>
    a780:      	cmp	x19, #0xc
    a784:      	b.eq	0xa83c <_stogir.floating.operands+0x108>
    a788:      	cmp	x19, #0xd
    a78c:      	b.eq	0xa83c <_stogir.floating.operands+0x108>
    a790:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a790:  ARM64_RELOC_PAGE21	l_stogir.469
    a794:      	ldr	x20, [x20]
		000000000000a794:  ARM64_RELOC_PAGEOFF12	l_stogir.469
    a798:      	mov	x21, #0x22              ; =34
    a79c:      	b	0xa848 <_stogir.floating.operands+0x114>
    a7a0:      	uxtb	w16, w2
    a7a4:      	cmp	w16, wzr
    a7a8:      	b.ne	0xa780 <_stogir.floating.operands+0x4c>
    a7ac:      	uxtb	w16, w6
    a7b0:      	cmp	w16, wzr
    a7b4:      	b.ne	0xa780 <_stogir.floating.operands+0x4c>
    a7b8:      	cmp	x1, #0x1a
    a7bc:      	b.lt	0xa7c8 <_stogir.floating.operands+0x94>
    a7c0:      	cmp	x1, #0x1d
    a7c4:      	b.le	0xa780 <_stogir.floating.operands+0x4c>
    a7c8:      	cmp	x1, #0x3a
    a7cc:      	b.eq	0xa780 <_stogir.floating.operands+0x4c>
    a7d0:      	cmp	x1, #0x3b
    a7d4:      	b.eq	0xa780 <_stogir.floating.operands+0x4c>
    a7d8:      	b	0xa790 <_stogir.floating.operands+0x5c>
    a7dc:      	movz	w1, #0x0, lsl #16
    a7e0:      	uxtb	w16, w1
    a7e4:      	and	w1, w16, #0x2
    a7e8:      	uxtb	w1, w1
    a7ec:      	ubfx	x1, x1, #0, #8
    a7f0:      	cmp	x1, #0x0
    a7f4:      	cset	w1, eq
    a7f8:      	uxtb	w16, w1
    a7fc:      	cmp	w16, wzr
    a800:      	cset	x1, eq
    a804:      	cmp	x1, #0x0
    a808:      	b.ne	0xa828 <_stogir.floating.operands+0xf4>
    a80c:      	cmp	x0, #0x65
    a810:      	b.eq	0xa828 <_stogir.floating.operands+0xf4>
    a814:      	cmp	x0, #0x66
    a818:      	b.eq	0xa828 <_stogir.floating.operands+0xf4>
    a81c:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a81c:  ARM64_RELOC_PAGE21	l_stogir.470
    a820:      	ldr	x20, [x20]
		000000000000a820:  ARM64_RELOC_PAGEOFF12	l_stogir.470
    a824:      	mov	x21, #0x2d              ; =45
    a828:      	b	0xa938 <_stogir.floating.operands+0x204>
    a82c:      	movz	x11, #0x0, lsl #48
    a830:      	b	0xa8a4 <_stogir.floating.operands+0x170>
    a834:      	movz	x11, #0x0, lsl #48
    a838:      	b	0xa8ac <_stogir.floating.operands+0x178>
    a83c:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a83c:  ARM64_RELOC_PAGE21	l_stogir.471
    a840:      	ldr	x20, [x20]
		000000000000a840:  ARM64_RELOC_PAGEOFF12	l_stogir.471
    a844:      	movz	x21, #0x0, lsl #48
    a848:      	add	x16, sp, #0x10
    a84c:      	str	w3, [x16]
    a850:      	uxtb	w16, w2
    a854:      	cmp	w16, wzr
    a858:      	b.ne	0xa86c <_stogir.floating.operands+0x138>
    a85c:      	uxtb	w16, w6
    a860:      	cmp	w16, wzr
    a864:      	b.ne	0xa86c <_stogir.floating.operands+0x138>
    a868:      	orr	w3, w4, wzr
    a86c:      	add	x16, sp, #0x20
    a870:      	orr	x2, x16, xzr
    a874:      	add	x4, x0, #0x78
    a878:      	add	x6, x0, #0x28
    a87c:      	add	x7, x0, #0x50
    a880:      	add	x16, sp, #0x10
    a884:      	str	w3, [x16, #0x4]
    a888:      	add	x16, sp, #0x10
    a88c:      	ldr	x3, [x16]
    a890:      	add	x16, sp, #0x20
    a894:      	str	x3, [x16]
    a898:      	movz	x3, #0x0, lsl #48
    a89c:      	b	0xa958 <_stogir.floating.operands+0x224>
    a8a0:      	movz	x11, #0x0, lsl #48
    a8a4:      	b	0xa8ac <_stogir.floating.operands+0x178>
    a8a8:      	movz	x11, #0x0, lsl #48
    a8ac:      	cmp	x11, #0x0
    a8b0:      	b.eq	0xa8e4 <_stogir.floating.operands+0x1b0>
    a8b4:      	uxtb	w16, w9
    a8b8:      	cmp	w16, wzr
    a8bc:      	b.eq	0xa8d0 <_stogir.floating.operands+0x19c>
    a8c0:      	ldr	x9, [x0]
    a8c4:      	add	x9, x9, x10, lsl #4
    a8c8:      	ldr	x9, [x9]
    a8cc:      	b	0xa8dc <_stogir.floating.operands+0x1a8>
    a8d0:      	ldr	x9, [x0, #0x28]
    a8d4:      	add	x9, x9, x12, lsl #4
    a8d8:      	ldr	x9, [x9]
    a8dc:      	mov	w10, #0x1               ; =1
    a8e0:      	b	0xa8ec <_stogir.floating.operands+0x1b8>
    a8e4:      	movz	w10, #0x0, lsl #16
    a8e8:      	movz	x9, #0x0, lsl #48
    a8ec:      	ubfx	x10, x10, #0, #32
    a8f0:      	lsr	x16, x10, #0
    a8f4:      	cmp	x16, #0x1
    a8f8:      	b.eq	0xa914 <_stogir.floating.operands+0x1e0>
    a8fc:      	b.lo	0xa904 <_stogir.floating.operands+0x1d0>
    a900:      	b	0xa918 <_stogir.floating.operands+0x1e4>
    a904:      	cmp	x16, #0x0
    a908:      	b.eq	0xa910 <_stogir.floating.operands+0x1dc>
    a90c:      	b	0xa918 <_stogir.floating.operands+0x1e4>
    a910:      	b	0xa91c <_stogir.floating.operands+0x1e8>
    a914:      	b	0xa93c <_stogir.floating.operands+0x208>
    a918:      	b	0xab4c <_stogir.floating.operands+0x418>
    a91c:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a91c:  ARM64_RELOC_PAGE21	l_stogir.472
    a920:      	ldr	x20, [x20]
		000000000000a920:  ARM64_RELOC_PAGEOFF12	l_stogir.472
    a924:      	mov	x21, #0x18              ; =24
    a928:      	b	0xa958 <_stogir.floating.operands+0x224>
    a92c:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a92c:  ARM64_RELOC_PAGE21	l_stogir.473
    a930:      	ldr	x20, [x20]
		000000000000a930:  ARM64_RELOC_PAGEOFF12	l_stogir.473
    a934:      	mov	x21, #0x21              ; =33
    a938:      	b	0xaa24 <_stogir.floating.operands+0x2f0>
    a93c:      	ubfx	x9, x9, #0, #32
    a940:      	ubfx	x9, x9, #8, #8
    a944:      	cmp	x9, x19
    a948:      	b.eq	0xa958 <_stogir.floating.operands+0x224>
    a94c:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000a94c:  ARM64_RELOC_PAGE21	l_stogir.474
    a950:      	ldr	x20, [x20]
		000000000000a950:  ARM64_RELOC_PAGEOFF12	l_stogir.474
    a954:      	mov	x21, #0x1e              ; =30
    a958:      	cmp	x3, #0x2
    a95c:      	b.ge	0xa980 <_stogir.floating.operands+0x24c>
    a960:      	add	x9, x3, #0x1
    a964:      	add	x3, x2, x3, lsl #2
    a968:      	ldr	w3, [x3]
    a96c:      	movn	w17, #0x0, lsl #16
    a970:      	and	w10, w3, w17
    a974:      	mov	x3, x9
    a978:      	mov	w9, #0x1                ; =1
    a97c:      	b	0xa988 <_stogir.floating.operands+0x254>
    a980:      	movz	w9, #0x0, lsl #16
    a984:      	movz	w10, #0x0, lsl #16
    a988:      	ubfx	x9, x9, #0, #32
    a98c:      	lsr	x16, x9, #0
    a990:      	cmp	x16, #0x1
    a994:      	b.eq	0xa9b0 <_stogir.floating.operands+0x27c>
    a998:      	b.lo	0xa9a0 <_stogir.floating.operands+0x26c>
    a99c:      	b	0xa9b4 <_stogir.floating.operands+0x280>
    a9a0:      	cmp	x16, #0x0
    a9a4:      	b.eq	0xa9ac <_stogir.floating.operands+0x278>
    a9a8:      	b	0xa9b4 <_stogir.floating.operands+0x280>
    a9ac:      	b	0xaa14 <_stogir.floating.operands+0x2e0>
    a9b0:      	b	0xa9b8 <_stogir.floating.operands+0x284>
    a9b4:      	b	0xab44 <_stogir.floating.operands+0x410>
    a9b8:      	sxtw	x10, w10
    a9bc:      	cmp	x10, #0x0
    a9c0:      	cset	w9, gt
    a9c4:      	movz	x16, #0x0, lsl #48
    a9c8:      	sub	x11, x16, x10
    a9cc:      	sub	x12, x11, #0x1
    a9d0:      	uxtb	w16, w9
    a9d4:      	cmp	w16, wzr
    a9d8:      	b.eq	0xaa98 <_stogir.floating.operands+0x364>
    a9dc:      	ldr	x11, [x0, #0x8]
    a9e0:      	cmp	x10, x11
    a9e4:      	b.ge	0xa8a0 <_stogir.floating.operands+0x16c>
    a9e8:      	ldr	x11, [x4, #0x8]
    a9ec:      	cmp	x10, x11
    a9f0:      	b.ge	0xa82c <_stogir.floating.operands+0xf8>
    a9f4:      	ldr	x11, [x0, #0x78]
    a9f8:      	add	x11, x11, x10, lsl #2
    a9fc:      	ldr	w11, [x11]
    aa00:      	sxtw	x11, w11
    aa04:      	cmp	x11, #0x0
    aa08:      	cset	w11, ge
    aa0c:      	ubfx	x11, x11, #0, #8
    aa10:      	b	0xa830 <_stogir.floating.operands+0xfc>
    aa14:      	sxtw	x22, w5
    aa18:      	cmp	x22, #0x0
    aa1c:      	b.ne	0xaa3c <_stogir.floating.operands+0x308>
    aa20:      	mov	x23, x8
    aa24:      	cmp	x21, #0x0
    aa28:      	b.ne	0xaad8 <_stogir.floating.operands+0x3a4>
    aa2c:      	and	x20, x19, #0xffffffff
    aa30:      	movz	x0, #0x0, lsl #48
    aa34:      	movz	x21, #0x0, lsl #48
    aa38:      	b	0xaadc <_stogir.floating.operands+0x3a8>
    aa3c:      	cmp	x1, #0x1d
    aa40:      	b.ne	0xab5c <_stogir.floating.operands+0x428>
    aa44:      	mov	w1, w5
    aa48:      	mov	x23, x8
    aa4c:      	add	x8, sp, #0x30
    aa50:      	bl	0xaa50 <_stogir.floating.operands+0x31c>
		000000000000aa50:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    aa54:      	add	x16, sp, #0x30
    aa58:      	ldr	w0, [x16]
    aa5c:      	lsr	x16, x0, #0
    aa60:      	cmp	x16, #0x1
    aa64:      	b.eq	0xaa80 <_stogir.floating.operands+0x34c>
    aa68:      	b.lo	0xaa70 <_stogir.floating.operands+0x33c>
    aa6c:      	b	0xaa84 <_stogir.floating.operands+0x350>
    aa70:      	cmp	x16, #0x0
    aa74:      	b.eq	0xaa7c <_stogir.floating.operands+0x348>
    aa78:      	b	0xaa84 <_stogir.floating.operands+0x350>
    aa7c:      	b	0xaa88 <_stogir.floating.operands+0x354>
    aa80:      	b	0xab14 <_stogir.floating.operands+0x3e0>
    aa84:      	b	0xab54 <_stogir.floating.operands+0x420>
    aa88:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000aa88:  ARM64_RELOC_PAGE21	l_stogir.475
    aa8c:      	ldr	x20, [x20]
		000000000000aa8c:  ARM64_RELOC_PAGEOFF12	l_stogir.475
    aa90:      	mov	x21, #0x16              ; =22
    aa94:      	b	0xa828 <_stogir.floating.operands+0xf4>
    aa98:      	cmp	x10, #0x0
    aa9c:      	b.ge	0xa8a8 <_stogir.floating.operands+0x174>
    aaa0:      	ldr	x13, [x6, #0x8]
    aaa4:      	ldr	x14, [x7, #0x8]
    aaa8:      	cmp	x13, x14
    aaac:      	b.ne	0xa834 <_stogir.floating.operands+0x100>
    aab0:      	cmp	x11, x13
    aab4:      	b.gt	0xab0c <_stogir.floating.operands+0x3d8>
    aab8:      	ldr	x11, [x0, #0x50]
    aabc:      	add	x11, x11, x12, lsl #2
    aac0:      	ldr	w11, [x11]
    aac4:      	sxtw	x11, w11
    aac8:      	cmp	x11, #0x0
    aacc:      	cset	w11, gt
    aad0:      	ubfx	x11, x11, #0, #8
    aad4:      	b	0xab10 <_stogir.floating.operands+0x3dc>
    aad8:      	mov	x0, #0x1                ; =1
    aadc:      	str	x0, [x23]
    aae0:      	str	x20, [x23, #0x8]
    aae4:      	str	x21, [x23, #0x10]
    aae8:      	ldr	x19, [sp, #0x60]
    aaec:      	ldr	x20, [sp, #0x68]
    aaf0:      	ldr	x21, [sp, #0x70]
    aaf4:      	ldr	x22, [sp, #0x78]
    aaf8:      	ldr	x23, [sp, #0x80]
    aafc:      	ldr	x29, [sp]
    ab00:      	ldr	x30, [sp, #0x8]
    ab04:      	add	sp, sp, #0x90
    ab08:      	ret
    ab0c:      	movz	x11, #0x0, lsl #48
    ab10:      	b	0xa838 <_stogir.floating.operands+0x104>
    ab14:      	add	x16, sp, #0x30
    ab18:      	ldr	x0, [x16, #0x8]
    ab1c:      	cmp	x22, #0x0
    ab20:      	b.lt	0xa81c <_stogir.floating.operands+0xe8>
    ab24:      	uxtb	w0, w0
    ab28:      	cmp	x0, #0x83
    ab2c:      	b.ge	0xa7dc <_stogir.floating.operands+0xa8>
    ab30:      	adrp	x17, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000ab30:  ARM64_RELOC_PAGE21	l_stogir.476
    ab34:      	ldr	x17, [x17]
		000000000000ab34:  ARM64_RELOC_PAGEOFF12	l_stogir.476
    ab38:      	add	x1, x0, x17
    ab3c:      	ldrb	w1, [x1]
    ab40:      	b	0xa7e0 <_stogir.floating.operands+0xac>
    ab44:      	brk	#0
    ab48:      	b	0xab44 <_stogir.floating.operands+0x410>
    ab4c:      	brk	#0
    ab50:      	b	0xab4c <_stogir.floating.operands+0x418>
    ab54:      	brk	#0
    ab58:      	b	0xab54 <_stogir.floating.operands+0x420>
    ab5c:      	mov	x23, x8
    ab60:      	b	0xa92c <_stogir.floating.operands+0x1f8>

000000000000ab64 <_stogir.vector-lanes.operands>:
    ab64:      	sub	sp, sp, #0x110
    ab68:      	str	x29, [sp]
    ab6c:      	str	x30, [sp, #0x8]
    ab70:      	mov	x29, sp
    ab74:      	str	x19, [sp, #0xc0]
    ab78:      	str	x20, [sp, #0xc8]
    ab7c:      	str	x21, [sp, #0xd0]
    ab80:      	str	x22, [sp, #0xd8]
    ab84:      	str	x23, [sp, #0xe0]
    ab88:      	str	x24, [sp, #0xe8]
    ab8c:      	str	x25, [sp, #0xf0]
    ab90:      	str	x26, [sp, #0xf8]
    ab94:      	str	x27, [sp, #0x100]
    ab98:      	str	x28, [sp, #0x108]
    ab9c:      	sxtw	x4, w4
    aba0:      	cmp	x4, #0x0
    aba4:      	cset	w7, gt
    aba8:      	movz	x16, #0x0, lsl #48
    abac:      	sub	x9, x16, x4
    abb0:      	sub	x10, x9, #0x1
    abb4:      	uxtb	w16, w7
    abb8:      	cmp	w16, wzr
    abbc:      	b.eq	0xabfc <_stogir.vector-lanes.operands+0x98>
    abc0:      	ldr	x9, [x0, #0x8]
    abc4:      	cmp	x4, x9
    abc8:      	b.ge	0xac54 <_stogir.vector-lanes.operands+0xf0>
    abcc:      	add	x9, x0, #0x78
    abd0:      	ldr	x9, [x9, #0x8]
    abd4:      	cmp	x4, x9
    abd8:      	b.ge	0xad54 <_stogir.vector-lanes.operands+0x1f0>
    abdc:      	ldr	x9, [x0, #0x78]
    abe0:      	add	x9, x9, x4, lsl #2
    abe4:      	ldr	w9, [x9]
    abe8:      	sxtw	x9, w9
    abec:      	cmp	x9, #0x0
    abf0:      	cset	w9, ge
    abf4:      	ubfx	x9, x9, #0, #8
    abf8:      	b	0xad58 <_stogir.vector-lanes.operands+0x1f4>
    abfc:      	cmp	x4, #0x0
    ac00:      	b.ge	0xac5c <_stogir.vector-lanes.operands+0xf8>
    ac04:      	add	x11, x0, #0x28
    ac08:      	add	x12, x0, #0x50
    ac0c:      	ldr	x11, [x11, #0x8]
    ac10:      	ldr	x12, [x12, #0x8]
    ac14:      	cmp	x11, x12
    ac18:      	b.ne	0xac44 <_stogir.vector-lanes.operands+0xe0>
    ac1c:      	cmp	x9, x11
    ac20:      	b.gt	0xaf08 <_stogir.vector-lanes.operands+0x3a4>
    ac24:      	ldr	x9, [x0, #0x50]
    ac28:      	add	x9, x9, x10, lsl #2
    ac2c:      	ldr	w9, [x9]
    ac30:      	sxtw	x9, w9
    ac34:      	cmp	x9, #0x0
    ac38:      	cset	w9, gt
    ac3c:      	ubfx	x9, x9, #0, #8
    ac40:      	b	0xaf0c <_stogir.vector-lanes.operands+0x3a8>
    ac44:      	movz	x9, #0x0, lsl #48
    ac48:      	b	0xac60 <_stogir.vector-lanes.operands+0xfc>
    ac4c:      	mov	x2, #0x1                ; =1
    ac50:      	b	0xace4 <_stogir.vector-lanes.operands+0x180>
    ac54:      	movz	x9, #0x0, lsl #48
    ac58:      	b	0xac60 <_stogir.vector-lanes.operands+0xfc>
    ac5c:      	movz	x9, #0x0, lsl #48
    ac60:      	cmp	x9, #0x0
    ac64:      	b.eq	0xac98 <_stogir.vector-lanes.operands+0x134>
    ac68:      	uxtb	w16, w7
    ac6c:      	cmp	w16, wzr
    ac70:      	b.eq	0xac84 <_stogir.vector-lanes.operands+0x120>
    ac74:      	ldr	x7, [x0]
    ac78:      	add	x4, x7, x4, lsl #4
    ac7c:      	ldr	x4, [x4]
    ac80:      	b	0xac90 <_stogir.vector-lanes.operands+0x12c>
    ac84:      	ldr	x4, [x0, #0x28]
    ac88:      	add	x4, x4, x10, lsl #4
    ac8c:      	ldr	x4, [x4]
    ac90:      	mov	w7, #0x1                ; =1
    ac94:      	b	0xaca0 <_stogir.vector-lanes.operands+0x13c>
    ac98:      	movz	w7, #0x0, lsl #16
    ac9c:      	movz	x4, #0x0, lsl #48
    aca0:      	ubfx	x7, x7, #0, #32
    aca4:      	lsr	x16, x7, #0
    aca8:      	cmp	x16, #0x1
    acac:      	b.eq	0xacc8 <_stogir.vector-lanes.operands+0x164>
    acb0:      	b.lo	0xacb8 <_stogir.vector-lanes.operands+0x154>
    acb4:      	b	0xaccc <_stogir.vector-lanes.operands+0x168>
    acb8:      	cmp	x16, #0x0
    acbc:      	b.eq	0xacc4 <_stogir.vector-lanes.operands+0x160>
    acc0:      	b	0xaccc <_stogir.vector-lanes.operands+0x168>
    acc4:      	b	0xacd0 <_stogir.vector-lanes.operands+0x16c>
    acc8:      	b	0xad2c <_stogir.vector-lanes.operands+0x1c8>
    accc:      	b	0xb1dc <_stogir.vector-lanes.operands+0x678>
    acd0:      	str	x8, [sp, #0xa0]
    acd4:      	mov	x2, #0x1                ; =1
    acd8:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000acd8:  ARM64_RELOC_PAGE21	l_stogir.477
    acdc:      	ldr	x1, [x1]
		000000000000acdc:  ARM64_RELOC_PAGEOFF12	l_stogir.477
    ace0:      	mov	x0, #0x1b               ; =27
    ace4:      	ldr	x3, [sp, #0xa0]
    ace8:      	str	x2, [x3]
    acec:      	str	x1, [x3, #0x8]
    acf0:      	str	x0, [x3, #0x10]
    acf4:      	ldr	x19, [sp, #0xc0]
    acf8:      	ldr	x20, [sp, #0xc8]
    acfc:      	ldr	x21, [sp, #0xd0]
    ad00:      	ldr	x22, [sp, #0xd8]
    ad04:      	ldr	x23, [sp, #0xe0]
    ad08:      	ldr	x24, [sp, #0xe8]
    ad0c:      	ldr	x25, [sp, #0xf0]
    ad10:      	ldr	x26, [sp, #0xf8]
    ad14:      	ldr	x27, [sp, #0x100]
    ad18:      	ldr	x28, [sp, #0x108]
    ad1c:      	ldr	x29, [sp]
    ad20:      	ldr	x30, [sp, #0x8]
    ad24:      	add	sp, sp, #0x110
    ad28:      	ret
    ad2c:      	sxtw	x19, w1
    ad30:      	sxtw	x1, w2
    ad34:      	orr	w7, w4, wzr
    ad38:      	ubfx	x7, x7, #0, #32
    ad3c:      	ubfx	x7, x7, #8, #8
    ad40:      	orr	x20, x7, xzr
    ad44:      	cmp	x19, #0x3d
    ad48:      	b.ne	0xad5c <_stogir.vector-lanes.operands+0x1f8>
    ad4c:      	mov	x21, x20
    ad50:      	b	0xad60 <_stogir.vector-lanes.operands+0x1fc>
    ad54:      	movz	x9, #0x0, lsl #48
    ad58:      	b	0xac58 <_stogir.vector-lanes.operands+0xf4>
    ad5c:      	mov	x21, x1
    ad60:      	cmp	x19, #0x3d
    ad64:      	b.eq	0xad6c <_stogir.vector-lanes.operands+0x208>
    ad68:      	mov	x1, x20
    ad6c:      	orr	w22, w21, wzr
    ad70:      	sxtw	x23, w22
    ad74:      	cmp	x23, #0xf
    ad78:      	cset	w24, gt
    ad7c:      	cmp	x23, #0x80
    ad80:      	cset	w25, lt
    ad84:      	and	w7, w22, #0xf
    ad88:      	ubfx	x7, x7, #0, #32
    ad8c:      	cmp	x7, #0x1
    ad90:      	cset	w26, ge
    ad94:      	cmp	x7, #0xd
    ad98:      	cset	w27, le
    ad9c:      	cmp	x19, #0x3d
    ada0:      	b.lt	0xadf0 <_stogir.vector-lanes.operands+0x28c>
    ada4:      	cmp	x19, #0x3f
    ada8:      	b.gt	0xadf0 <_stogir.vector-lanes.operands+0x28c>
    adac:      	uxtb	w16, w24
    adb0:      	cmp	w16, wzr
    adb4:      	b.eq	0xadf0 <_stogir.vector-lanes.operands+0x28c>
    adb8:      	uxtb	w16, w25
    adbc:      	cmp	w16, wzr
    adc0:      	b.eq	0xadf0 <_stogir.vector-lanes.operands+0x28c>
    adc4:      	uxtb	w16, w26
    adc8:      	cmp	w16, wzr
    adcc:      	b.eq	0xadf0 <_stogir.vector-lanes.operands+0x28c>
    add0:      	uxtb	w16, w27
    add4:      	cmp	w16, wzr
    add8:      	b.eq	0xadf0 <_stogir.vector-lanes.operands+0x28c>
    addc:      	sxtw	x7, w3
    ade0:      	cmp	x7, #0x4
    ade4:      	b.eq	0xb20c <_stogir.vector-lanes.operands+0x6a8>
    ade8:      	cmp	x7, #0x8
    adec:      	b.eq	0xb20c <_stogir.vector-lanes.operands+0x6a8>
    adf0:      	adrp	x28, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000adf0:  ARM64_RELOC_PAGE21	l_stogir.478
    adf4:      	ldr	x28, [x28]
		000000000000adf4:  ARM64_RELOC_PAGEOFF12	l_stogir.478
    adf8:      	mov	x4, #0x36               ; =54
    adfc:      	sxtw	x7, w5
    ae00:      	sxtw	x9, w6
    ae04:      	cmp	x9, #0x0
    ae08:      	cset	w9, eq
    ae0c:      	cmp	x19, #0x3f
    ae10:      	b.ne	0xb240 <_stogir.vector-lanes.operands+0x6dc>
    ae14:      	mov	w0, w22
    ae18:      	mov	w2, w3
    ae1c:      	mov	x19, x8
    ae20:      	mov	x20, x4
    ae24:      	mov	x22, x7
    ae28:      	mov	w23, w9
    ae2c:      	bl	0xae2c <_stogir.vector-lanes.operands+0x2c8>
		000000000000ae2c:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    ae30:      	cmp	x0, #0x0
    ae34:      	b.eq	0xb014 <_stogir.vector-lanes.operands+0x4b0>
    ae38:      	movz	x0, #0x0, lsl #48
    ae3c:      	b	0xb018 <_stogir.vector-lanes.operands+0x4b4>
    ae40:      	cmp	x19, #0x3d
    ae44:      	b.ne	0xb24c <_stogir.vector-lanes.operands+0x6e8>
    ae48:      	str	x0, [sp, #0x80]
    ae4c:      	mov	w0, w22
    ae50:      	str	w3, [sp, #0xb0]
    ae54:      	str	x1, [sp, #0xa0]
    ae58:      	mov	w1, w2
    ae5c:      	mov	w2, w3
    ae60:      	str	x4, [sp, #0xa8]
    ae64:      	str	w8, [sp, #0xb8]
    ae68:      	str	w22, [sp, #0x88]
    ae6c:      	mov	x22, x7
    ae70:      	str	x28, [sp, #0x90]
    ae74:      	mov	w28, w5
    ae78:      	str	x21, [sp, #0x98]
    ae7c:      	mov	w21, w6
    ae80:      	bl	0xae80 <_stogir.vector-lanes.operands+0x31c>
		000000000000ae80:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    ae84:      	cmp	x0, #0x0
    ae88:      	b.ne	0xaea0 <_stogir.vector-lanes.operands+0x33c>
    ae8c:      	adrp	x16, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000ae8c:  ARM64_RELOC_PAGE21	l_stogir.479
    ae90:      	ldr	x16, [x16]
		000000000000ae90:  ARM64_RELOC_PAGEOFF12	l_stogir.479
    ae94:      	str	x16, [sp, #0x90]
    ae98:      	mov	x16, #0x26              ; =38
    ae9c:      	str	x16, [sp, #0xa8]
    aea0:      	cmp	x19, #0x3e
    aea4:      	b.ne	0xaf38 <_stogir.vector-lanes.operands+0x3d4>
    aea8:      	cmp	x20, x23
    aeac:      	cset	w0, eq
    aeb0:      	uxtb	w16, w0
    aeb4:      	cmp	w16, wzr
    aeb8:      	cset	x0, eq
    aebc:      	b	0xaf3c <_stogir.vector-lanes.operands+0x3d8>
    aec0:      	mov	x0, #0x1                ; =1
    aec4:      	cmp	x0, #0x0
    aec8:      	b.eq	0xaed8 <_stogir.vector-lanes.operands+0x374>
    aecc:      	adrp	x28, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000aecc:  ARM64_RELOC_PAGE21	l_stogir.480
    aed0:      	ldr	x28, [x28]
		000000000000aed0:  ARM64_RELOC_PAGEOFF12	l_stogir.480
    aed4:      	mov	x20, #0x24              ; =36
    aed8:      	str	x21, [sp, #0x98]
    aedc:      	str	x19, [sp, #0xa0]
    aee0:      	str	x28, [sp, #0x90]
    aee4:      	str	x20, [sp, #0xa8]
    aee8:      	ldr	x0, [sp, #0xa8]
    aeec:      	cmp	x0, #0x0
    aef0:      	b.ne	0xb27c <_stogir.vector-lanes.operands+0x718>
    aef4:      	ldr	x0, [sp, #0x98]
    aef8:      	and	x1, x0, #0xffffffff
    aefc:      	movz	x2, #0x0, lsl #48
    af00:      	movz	x0, #0x0, lsl #48
    af04:      	b	0xac50 <_stogir.vector-lanes.operands+0xec>
    af08:      	movz	x9, #0x0, lsl #48
    af0c:      	b	0xac48 <_stogir.vector-lanes.operands+0xe4>
    af10:      	ldr	w0, [sp, #0xb8]
    af14:      	uxtb	w16, w0
    af18:      	cmp	w16, wzr
    af1c:      	b.ne	0xaf34 <_stogir.vector-lanes.operands+0x3d0>
    af20:      	adrp	x16, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000af20:  ARM64_RELOC_PAGE21	l_stogir.481
    af24:      	ldr	x16, [x16]
		000000000000af24:  ARM64_RELOC_PAGEOFF12	l_stogir.481
    af28:      	str	x16, [sp, #0x90]
    af2c:      	mov	x16, #0x20              ; =32
    af30:      	str	x16, [sp, #0xa8]
    af34:      	b	0xaee8 <_stogir.vector-lanes.operands+0x384>
    af38:      	movz	x0, #0x0, lsl #48
    af3c:      	cmp	x0, #0x0
    af40:      	b.eq	0xaf58 <_stogir.vector-lanes.operands+0x3f4>
    af44:      	adrp	x16, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000af44:  ARM64_RELOC_PAGE21	l_stogir.482
    af48:      	ldr	x16, [x16]
		000000000000af48:  ARM64_RELOC_PAGEOFF12	l_stogir.482
    af4c:      	str	x16, [sp, #0x90]
    af50:      	mov	x16, #0x27              ; =39
    af54:      	str	x16, [sp, #0xa8]
    af58:      	add	x8, sp, #0x10
    af5c:      	ldr	x0, [sp, #0x80]
    af60:      	mov	w1, w28
    af64:      	bl	0xaf64 <_stogir.vector-lanes.operands+0x400>
		000000000000af64:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    af68:      	add	x16, sp, #0x10
    af6c:      	ldr	w0, [x16]
    af70:      	lsr	x16, x0, #0
    af74:      	cmp	x16, #0x1
    af78:      	b.eq	0xaf94 <_stogir.vector-lanes.operands+0x430>
    af7c:      	b.lo	0xaf84 <_stogir.vector-lanes.operands+0x420>
    af80:      	b	0xaf98 <_stogir.vector-lanes.operands+0x434>
    af84:      	cmp	x16, #0x0
    af88:      	b.eq	0xaf90 <_stogir.vector-lanes.operands+0x42c>
    af8c:      	b	0xaf98 <_stogir.vector-lanes.operands+0x434>
    af90:      	b	0xaf9c <_stogir.vector-lanes.operands+0x438>
    af94:      	b	0xb040 <_stogir.vector-lanes.operands+0x4dc>
    af98:      	b	0xb230 <_stogir.vector-lanes.operands+0x6cc>
    af9c:      	adrp	x16, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000af9c:  ARM64_RELOC_PAGE21	l_stogir.483
    afa0:      	ldr	x16, [x16]
		000000000000afa0:  ARM64_RELOC_PAGEOFF12	l_stogir.483
    afa4:      	str	x16, [sp, #0x90]
    afa8:      	mov	x16, #0x19              ; =25
    afac:      	str	x16, [sp, #0xa8]
    afb0:      	cmp	x19, #0x3e
    afb4:      	b.ne	0xaf10 <_stogir.vector-lanes.operands+0x3ac>
    afb8:      	add	x8, sp, #0x50
    afbc:      	ldr	x0, [sp, #0x80]
    afc0:      	mov	w1, w21
    afc4:      	bl	0xafc4 <_stogir.vector-lanes.operands+0x460>
		000000000000afc4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    afc8:      	add	x16, sp, #0x50
    afcc:      	ldr	w0, [x16]
    afd0:      	lsr	x16, x0, #0
    afd4:      	cmp	x16, #0x1
    afd8:      	b.eq	0xaff4 <_stogir.vector-lanes.operands+0x490>
    afdc:      	b.lo	0xafe4 <_stogir.vector-lanes.operands+0x480>
    afe0:      	b	0xaff8 <_stogir.vector-lanes.operands+0x494>
    afe4:      	cmp	x16, #0x0
    afe8:      	b.eq	0xaff0 <_stogir.vector-lanes.operands+0x48c>
    afec:      	b	0xaff8 <_stogir.vector-lanes.operands+0x494>
    aff0:      	b	0xaffc <_stogir.vector-lanes.operands+0x498>
    aff4:      	b	0xb12c <_stogir.vector-lanes.operands+0x5c8>
    aff8:      	b	0xb238 <_stogir.vector-lanes.operands+0x6d4>
    affc:      	adrp	x16, 0xa000 <_stogir.conversion.policy+0x260>
		000000000000affc:  ARM64_RELOC_PAGE21	l_stogir.484
    b000:      	ldr	x16, [x16]
		000000000000b000:  ARM64_RELOC_PAGEOFF12	l_stogir.484
    b004:      	str	x16, [sp, #0x90]
    b008:      	mov	x16, #0x20              ; =32
    b00c:      	str	x16, [sp, #0xa8]
    b010:      	b	0xaf34 <_stogir.vector-lanes.operands+0x3d0>
    b014:      	mov	x0, #0x1                ; =1
    b018:      	cmp	x0, #0x0
    b01c:      	b.eq	0xb028 <_stogir.vector-lanes.operands+0x4c4>
    b020:      	mov	x0, #0x1                ; =1
    b024:      	b	0xaec4 <_stogir.vector-lanes.operands+0x360>
    b028:      	cmp	x22, #0x0
    b02c:      	b.ne	0xaec0 <_stogir.vector-lanes.operands+0x35c>
    b030:      	uxtb	w16, w23
    b034:      	cmp	w16, wzr
    b038:      	cset	x0, eq
    b03c:      	b	0xaec4 <_stogir.vector-lanes.operands+0x360>
    b040:      	add	x16, sp, #0x10
    b044:      	orr	x0, x16, xzr
    b048:      	add	x0, x0, #0x8
    b04c:      	add	x16, sp, #0x10
    b050:      	ldr	x1, [x16, #0x8]
    b054:      	add	x16, sp, #0x40
    b058:      	str	x1, [x16]
    b05c:      	ldr	x0, [x0, #0x8]
    b060:      	ubfx	x1, x1, #0, #32
    b064:      	add	x16, sp, #0x40
    b068:      	str	x0, [x16, #0x8]
    b06c:      	ubfx	x0, x1, #8, #8
    b070:      	cmp	x0, #0x1
    b074:      	b.lt	0xb09c <_stogir.vector-lanes.operands+0x538>
    b078:      	cmp	x0, #0xb
    b07c:      	b.gt	0xb09c <_stogir.vector-lanes.operands+0x538>
    b080:      	add	x16, sp, #0x40
    b084:      	ldr	w0, [x16]
    b088:      	uxtb	w0, w0
    b08c:      	cmp	x0, #0x48
    b090:      	b.eq	0xb09c <_stogir.vector-lanes.operands+0x538>
    b094:      	cmp	x0, #0x46
    b098:      	b.ne	0xb0b0 <_stogir.vector-lanes.operands+0x54c>
    b09c:      	adrp	x16, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b09c:  ARM64_RELOC_PAGE21	l_stogir.485
    b0a0:      	ldr	x16, [x16]
		000000000000b0a0:  ARM64_RELOC_PAGEOFF12	l_stogir.485
    b0a4:      	str	x16, [sp, #0x90]
    b0a8:      	mov	x16, #0x2b              ; =43
    b0ac:      	str	x16, [sp, #0xa8]
    b0b0:      	cmp	x22, #0x0
    b0b4:      	b.ge	0xb0e0 <_stogir.vector-lanes.operands+0x57c>
    b0b8:      	add	x16, sp, #0x40
    b0bc:      	ldr	w0, [x16]
    b0c0:      	uxtb	w1, w0
    b0c4:      	ubfx	x0, x0, #8, #8
    b0c8:      	cmp	x1, x0
    b0cc:      	b.eq	0xb184 <_stogir.vector-lanes.operands+0x620>
    b0d0:      	cmp	x1, #0x49
    b0d4:      	b.eq	0xb184 <_stogir.vector-lanes.operands+0x620>
    b0d8:      	movz	x0, #0x0, lsl #48
    b0dc:      	b	0xb128 <_stogir.vector-lanes.operands+0x5c4>
    b0e0:      	movz	x0, #0x0, lsl #48
    b0e4:      	cmp	x0, #0x0
    b0e8:      	b.eq	0xb100 <_stogir.vector-lanes.operands+0x59c>
    b0ec:      	adrp	x16, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b0ec:  ARM64_RELOC_PAGE21	l_stogir.486
    b0f0:      	ldr	x16, [x16]
		000000000000b0f0:  ARM64_RELOC_PAGEOFF12	l_stogir.486
    b0f4:      	str	x16, [sp, #0x90]
    b0f8:      	mov	x16, #0x28              ; =40
    b0fc:      	str	x16, [sp, #0xa8]
    b100:      	b	0xafb0 <_stogir.vector-lanes.operands+0x44c>
    b104:      	movn	w2, #0x0, lsl #16
    b108:      	ubfx	x0, x0, #0, #32
    b10c:      	ubfx	x1, x1, #0, #32
    b110:      	lsl	x1, x1, #32
    b114:      	orr	x0, x1, x0
    b118:      	sxtw	x2, w2
    b11c:      	cmp	x0, x2
    b120:      	cset	w0, hs
    b124:      	ubfx	x0, x0, #0, #8
    b128:      	b	0xb0e4 <_stogir.vector-lanes.operands+0x580>
    b12c:      	add	x16, sp, #0x50
    b130:      	ldr	x0, [x16, #0x8]
    b134:      	uxtb	w1, w0
    b138:      	cmp	x1, #0x48
    b13c:      	b.eq	0xb16c <_stogir.vector-lanes.operands+0x608>
    b140:      	cmp	x1, #0x46
    b144:      	b.eq	0xb16c <_stogir.vector-lanes.operands+0x608>
    b148:      	ldr	w1, [sp, #0xb0]
    b14c:      	ubfx	x0, x0, #0, #32
    b150:      	ubfx	x0, x0, #8, #8
    b154:      	mov	w2, w1
    b158:      	mov	w1, w0
    b15c:      	ldr	w0, [sp, #0x88]
    b160:      	bl	0xb160 <_stogir.vector-lanes.operands+0x5fc>
		000000000000b160:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    b164:      	cmp	x0, #0x0
    b168:      	b.ne	0xb180 <_stogir.vector-lanes.operands+0x61c>
    b16c:      	adrp	x16, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b16c:  ARM64_RELOC_PAGE21	l_stogir.487
    b170:      	ldr	x16, [x16]
		000000000000b170:  ARM64_RELOC_PAGEOFF12	l_stogir.487
    b174:      	str	x16, [sp, #0x90]
    b178:      	mov	x16, #0x27              ; =39
    b17c:      	str	x16, [sp, #0xa8]
    b180:      	b	0xb010 <_stogir.vector-lanes.operands+0x4ac>
    b184:      	add	x16, sp, #0x40
    b188:      	ldr	w0, [x16, #0x8]
    b18c:      	add	x16, sp, #0x40
    b190:      	ldr	w1, [x16, #0xc]
    b194:      	uxtb	w16, w24
    b198:      	cmp	w16, wzr
    b19c:      	b.eq	0xb1e4 <_stogir.vector-lanes.operands+0x680>
    b1a0:      	uxtb	w16, w25
    b1a4:      	cmp	w16, wzr
    b1a8:      	b.eq	0xb1e4 <_stogir.vector-lanes.operands+0x680>
    b1ac:      	uxtb	w16, w26
    b1b0:      	cmp	w16, wzr
    b1b4:      	b.eq	0xb1e4 <_stogir.vector-lanes.operands+0x680>
    b1b8:      	uxtb	w16, w27
    b1bc:      	cmp	w16, wzr
    b1c0:      	b.eq	0xb1e4 <_stogir.vector-lanes.operands+0x680>
    b1c4:      	ubfx	x2, x23, #4, #32
    b1c8:      	sub	w2, w2, #0x1
    b1cc:      	sxtw	x2, w2
    b1d0:      	mov	x16, #0x1               ; =1
    b1d4:      	lsl	x2, x16, x2
    b1d8:      	b	0xb108 <_stogir.vector-lanes.operands+0x5a4>
    b1dc:      	brk	#0
    b1e0:      	b	0xb1dc <_stogir.vector-lanes.operands+0x678>
    b1e4:      	cmp	x23, #0x0
    b1e8:      	b.lt	0xb104 <_stogir.vector-lanes.operands+0x5a0>
    b1ec:      	cmp	x23, #0xd
    b1f0:      	b.gt	0xb104 <_stogir.vector-lanes.operands+0x5a0>
    b1f4:      	cmp	x23, #0x0
    b1f8:      	cset	w2, eq
    b1fc:      	uxtb	w16, w2
    b200:      	cmp	w16, wzr
    b204:      	cset	w2, eq
    b208:      	b	0xb108 <_stogir.vector-lanes.operands+0x5a4>
    b20c:      	uxtb	w4, w4
    b210:      	cmp	x4, #0x48
    b214:      	b.eq	0xadf0 <_stogir.vector-lanes.operands+0x28c>
    b218:      	cmp	x4, #0x46
    b21c:      	b.eq	0xadf0 <_stogir.vector-lanes.operands+0x28c>
    b220:      	adrp	x28, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b220:  ARM64_RELOC_PAGE21	l_stogir.488
    b224:      	ldr	x28, [x28]
		000000000000b224:  ARM64_RELOC_PAGEOFF12	l_stogir.488
    b228:      	movz	x4, #0x0, lsl #48
    b22c:      	b	0xadfc <_stogir.vector-lanes.operands+0x298>
    b230:      	brk	#0
    b234:      	b	0xb230 <_stogir.vector-lanes.operands+0x6cc>
    b238:      	brk	#0
    b23c:      	b	0xb238 <_stogir.vector-lanes.operands+0x6d4>
    b240:      	mov	x1, x8
    b244:      	mov	w8, w9
    b248:      	b	0xae40 <_stogir.vector-lanes.operands+0x2dc>
    b24c:      	str	x21, [sp, #0x98]
    b250:      	str	x1, [sp, #0xa0]
    b254:      	str	x0, [sp, #0x80]
    b258:      	str	w3, [sp, #0xb0]
    b25c:      	mov	w21, w6
    b260:      	str	w22, [sp, #0x88]
    b264:      	mov	x22, x7
    b268:      	str	w8, [sp, #0xb8]
    b26c:      	str	x28, [sp, #0x90]
    b270:      	mov	w28, w5
    b274:      	str	x4, [sp, #0xa8]
    b278:      	b	0xaea0 <_stogir.vector-lanes.operands+0x33c>
    b27c:      	ldr	x1, [sp, #0x90]
    b280:      	b	0xac4c <_stogir.vector-lanes.operands+0xe8>

000000000000b284 <_stogir.vector-comparison.operands>:
    b284:      	sub	sp, sp, #0xc0
    b288:      	str	x29, [sp]
    b28c:      	str	x30, [sp, #0x8]
    b290:      	mov	x29, sp
    b294:      	str	x19, [sp, #0x70]
    b298:      	str	x20, [sp, #0x78]
    b29c:      	str	x21, [sp, #0x80]
    b2a0:      	str	x22, [sp, #0x88]
    b2a4:      	str	x23, [sp, #0x90]
    b2a8:      	str	x24, [sp, #0x98]
    b2ac:      	str	x25, [sp, #0xa0]
    b2b0:      	str	x26, [sp, #0xa8]
    b2b4:      	str	x27, [sp, #0xb0]
    b2b8:      	mov	x19, x8
    b2bc:      	add	x8, sp, #0x10
    b2c0:      	mov	x20, x0
    b2c4:      	mov	w21, w1
    b2c8:      	mov	w1, w4
    b2cc:      	mov	w22, w2
    b2d0:      	mov	w23, w3
    b2d4:      	mov	w24, w5
    b2d8:      	bl	0xb2d8 <_stogir.vector-comparison.operands+0x54>
		000000000000b2d8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b2dc:      	add	x16, sp, #0x10
    b2e0:      	ldr	w0, [x16]
    b2e4:      	lsr	x16, x0, #0
    b2e8:      	cmp	x16, #0x1
    b2ec:      	b.eq	0xb308 <_stogir.vector-comparison.operands+0x84>
    b2f0:      	b.lo	0xb2f8 <_stogir.vector-comparison.operands+0x74>
    b2f4:      	b	0xb30c <_stogir.vector-comparison.operands+0x88>
    b2f8:      	cmp	x16, #0x0
    b2fc:      	b.eq	0xb304 <_stogir.vector-comparison.operands+0x80>
    b300:      	b	0xb30c <_stogir.vector-comparison.operands+0x88>
    b304:      	b	0xb310 <_stogir.vector-comparison.operands+0x8c>
    b308:      	b	0xb360 <_stogir.vector-comparison.operands+0xdc>
    b30c:      	b	0xb4dc <_stogir.vector-comparison.operands+0x258>
    b310:      	mov	x1, #0x1                ; =1
    b314:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b314:  ARM64_RELOC_PAGE21	l_stogir.489
    b318:      	ldr	x0, [x0]
		000000000000b318:  ARM64_RELOC_PAGEOFF12	l_stogir.489
    b31c:      	mov	x2, #0x21               ; =33
    b320:      	str	x1, [x19]
    b324:      	str	x0, [x19, #0x8]
    b328:      	str	x2, [x19, #0x10]
    b32c:      	ldr	x19, [sp, #0x70]
    b330:      	ldr	x20, [sp, #0x78]
    b334:      	ldr	x21, [sp, #0x80]
    b338:      	ldr	x22, [sp, #0x88]
    b33c:      	ldr	x23, [sp, #0x90]
    b340:      	ldr	x24, [sp, #0x98]
    b344:      	ldr	x25, [sp, #0xa0]
    b348:      	ldr	x26, [sp, #0xa8]
    b34c:      	ldr	x27, [sp, #0xb0]
    b350:      	ldr	x29, [sp]
    b354:      	ldr	x30, [sp, #0x8]
    b358:      	add	sp, sp, #0xc0
    b35c:      	ret
    b360:      	add	x16, sp, #0x10
    b364:      	ldr	x25, [x16, #0x8]
    b368:      	add	x8, sp, #0x40
    b36c:      	mov	x0, x20
    b370:      	mov	w1, w24
    b374:      	bl	0xb374 <_stogir.vector-comparison.operands+0xf0>
		000000000000b374:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b378:      	add	x16, sp, #0x40
    b37c:      	ldr	w0, [x16]
    b380:      	lsr	x16, x0, #0
    b384:      	cmp	x16, #0x1
    b388:      	b.eq	0xb3a4 <_stogir.vector-comparison.operands+0x120>
    b38c:      	b.lo	0xb394 <_stogir.vector-comparison.operands+0x110>
    b390:      	b	0xb3a8 <_stogir.vector-comparison.operands+0x124>
    b394:      	cmp	x16, #0x0
    b398:      	b.eq	0xb3a0 <_stogir.vector-comparison.operands+0x11c>
    b39c:      	b	0xb3a8 <_stogir.vector-comparison.operands+0x124>
    b3a0:      	b	0xb3ac <_stogir.vector-comparison.operands+0x128>
    b3a4:      	b	0xb3c0 <_stogir.vector-comparison.operands+0x13c>
    b3a8:      	b	0xb4e4 <_stogir.vector-comparison.operands+0x260>
    b3ac:      	mov	x1, #0x1                ; =1
    b3b0:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b3b0:  ARM64_RELOC_PAGE21	l_stogir.489
    b3b4:      	ldr	x0, [x0]
		000000000000b3b4:  ARM64_RELOC_PAGEOFF12	l_stogir.489
    b3b8:      	mov	x2, #0x21               ; =33
    b3bc:      	b	0xb320 <_stogir.vector-comparison.operands+0x9c>
    b3c0:      	sxtw	x0, w23
    b3c4:      	add	x16, sp, #0x40
    b3c8:      	ldr	x20, [x16, #0x8]
    b3cc:      	cmp	x0, #0x4
    b3d0:      	b.eq	0xb3f0 <_stogir.vector-comparison.operands+0x16c>
    b3d4:      	cmp	x0, #0x8
    b3d8:      	b.eq	0xb3f0 <_stogir.vector-comparison.operands+0x16c>
    b3dc:      	mov	x1, #0x1                ; =1
    b3e0:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b3e0:  ARM64_RELOC_PAGE21	l_stogir.490
    b3e4:      	ldr	x0, [x0]
		000000000000b3e4:  ARM64_RELOC_PAGEOFF12	l_stogir.490
    b3e8:      	mov	x2, #0x33               ; =51
    b3ec:      	b	0xb3bc <_stogir.vector-comparison.operands+0x138>
    b3f0:      	orr	w0, w25, wzr
    b3f4:      	ubfx	x0, x0, #0, #32
    b3f8:      	ubfx	x24, x0, #8, #8
    b3fc:      	orr	x26, x24, xzr
    b400:      	mov	w0, w21
    b404:      	mov	w1, w26
    b408:      	bl	0xb408 <_stogir.vector-comparison.operands+0x184>
		000000000000b408:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.valid-type?
    b40c:      	cmp	x0, #0x0
    b410:      	b.eq	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b414:      	orr	w0, w20, wzr
    b418:      	ubfx	x0, x0, #0, #32
    b41c:      	ubfx	x0, x0, #8, #8
    b420:      	cmp	x24, x0
    b424:      	b.ne	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b428:      	uxtb	w25, w25
    b42c:      	cmp	x25, #0x48
    b430:      	b.eq	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b434:      	cmp	x25, #0x46
    b438:      	b.eq	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b43c:      	uxtb	w20, w20
    b440:      	cmp	x20, #0x48
    b444:      	b.eq	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b448:      	cmp	x20, #0x46
    b44c:      	b.eq	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b450:      	sxtw	x0, w22
    b454:      	cmp	x0, #0xf
    b458:      	cset	w1, gt
    b45c:      	uxtb	w16, w1
    b460:      	cmp	w16, wzr
    b464:      	b.eq	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b468:      	cmp	x0, #0x80
    b46c:      	cset	w2, lt
    b470:      	uxtb	w16, w2
    b474:      	cmp	w16, wzr
    b478:      	b.eq	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b47c:      	and	w3, w22, #0xf
    b480:      	ubfx	x4, x3, #0, #32
    b484:      	cmp	x4, #0x1
    b488:      	cset	w5, ge
    b48c:      	uxtb	w16, w5
    b490:      	cmp	w16, wzr
    b494:      	b.eq	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b498:      	cmp	x4, #0xd
    b49c:      	cset	w4, le
    b4a0:      	uxtb	w16, w4
    b4a4:      	cmp	w16, wzr
    b4a8:      	b.eq	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b4ac:      	cmp	x0, #0x0
    b4b0:      	cset	w6, ge
    b4b4:      	cmp	x0, #0xd
    b4b8:      	cset	w7, le
    b4bc:      	uxtb	w16, w6
    b4c0:      	cmp	w16, wzr
    b4c4:      	b.eq	0xb4ec <_stogir.vector-comparison.operands+0x268>
    b4c8:      	uxtb	w16, w7
    b4cc:      	cmp	w16, wzr
    b4d0:      	b.eq	0xb4ec <_stogir.vector-comparison.operands+0x268>
    b4d4:      	mov	w8, w3
    b4d8:      	b	0xb520 <_stogir.vector-comparison.operands+0x29c>
    b4dc:      	brk	#0
    b4e0:      	b	0xb4dc <_stogir.vector-comparison.operands+0x258>
    b4e4:      	brk	#0
    b4e8:      	b	0xb4e4 <_stogir.vector-comparison.operands+0x260>
    b4ec:      	uxtb	w16, w1
    b4f0:      	cmp	w16, wzr
    b4f4:      	b.eq	0xb51c <_stogir.vector-comparison.operands+0x298>
    b4f8:      	uxtb	w16, w2
    b4fc:      	cmp	w16, wzr
    b500:      	b.eq	0xb51c <_stogir.vector-comparison.operands+0x298>
    b504:      	uxtb	w16, w5
    b508:      	cmp	w16, wzr
    b50c:      	b.eq	0xb51c <_stogir.vector-comparison.operands+0x298>
    b510:      	uxtb	w16, w4
    b514:      	cmp	w16, wzr
    b518:      	b.ne	0xb4d4 <_stogir.vector-comparison.operands+0x250>
    b51c:      	movn	w8, #0x0, lsl #16
    b520:      	sxtw	x8, w8
    b524:      	cmp	x8, #0x1
    b528:      	b.lt	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b52c:      	cmp	x8, #0xb
    b530:      	b.gt	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b534:      	uxtb	w16, w1
    b538:      	cmp	w16, wzr
    b53c:      	b.eq	0xb57c <_stogir.vector-comparison.operands+0x2f8>
    b540:      	uxtb	w16, w2
    b544:      	cmp	w16, wzr
    b548:      	b.eq	0xb57c <_stogir.vector-comparison.operands+0x2f8>
    b54c:      	uxtb	w16, w5
    b550:      	cmp	w16, wzr
    b554:      	b.eq	0xb57c <_stogir.vector-comparison.operands+0x2f8>
    b558:      	uxtb	w16, w4
    b55c:      	cmp	w16, wzr
    b560:      	b.eq	0xb57c <_stogir.vector-comparison.operands+0x2f8>
    b564:      	ubfx	x0, x0, #4, #32
    b568:      	sub	w0, w0, #0x1
    b56c:      	sxtw	x0, w0
    b570:      	mov	x16, #0x1               ; =1
    b574:      	lsl	x0, x16, x0
    b578:      	b	0xb688 <_stogir.vector-comparison.operands+0x404>
    b57c:      	uxtb	w16, w6
    b580:      	cmp	w16, wzr
    b584:      	b.eq	0xb684 <_stogir.vector-comparison.operands+0x400>
    b588:      	uxtb	w16, w7
    b58c:      	cmp	w16, wzr
    b590:      	b.eq	0xb684 <_stogir.vector-comparison.operands+0x400>
    b594:      	cmp	x0, #0x0
    b598:      	cset	w0, eq
    b59c:      	uxtb	w16, w0
    b5a0:      	cmp	w16, wzr
    b5a4:      	cset	w0, eq
    b5a8:      	b	0xb688 <_stogir.vector-comparison.operands+0x404>
    b5ac:      	movn	w8, #0x0, lsl #16
    b5b0:      	sxtw	x0, w0
    b5b4:      	sxtw	x8, w8
    b5b8:      	cmp	x0, x8
    b5bc:      	b.ne	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b5c0:      	uxtb	w16, w6
    b5c4:      	cmp	w16, wzr
    b5c8:      	b.eq	0xb5d8 <_stogir.vector-comparison.operands+0x354>
    b5cc:      	uxtb	w16, w7
    b5d0:      	cmp	w16, wzr
    b5d4:      	b.ne	0xb60c <_stogir.vector-comparison.operands+0x388>
    b5d8:      	uxtb	w16, w1
    b5dc:      	cmp	w16, wzr
    b5e0:      	b.eq	0xb608 <_stogir.vector-comparison.operands+0x384>
    b5e4:      	uxtb	w16, w2
    b5e8:      	cmp	w16, wzr
    b5ec:      	b.eq	0xb608 <_stogir.vector-comparison.operands+0x384>
    b5f0:      	uxtb	w16, w5
    b5f4:      	cmp	w16, wzr
    b5f8:      	b.eq	0xb608 <_stogir.vector-comparison.operands+0x384>
    b5fc:      	uxtb	w16, w4
    b600:      	cmp	w16, wzr
    b604:      	b.ne	0xb60c <_stogir.vector-comparison.operands+0x388>
    b608:      	movn	w3, #0x0, lsl #16
    b60c:      	mov	w0, w3
    b610:      	mov	w1, w23
    b614:      	bl	0xb614 <_stogir.vector-comparison.operands+0x390>
		000000000000b614:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    b618:      	uxtb	w16, w21
    b61c:      	cmp	w16, wzr
    b620:      	b.ne	0xb658 <_stogir.vector-comparison.operands+0x3d4>
    b624:      	uxtb	w16, w22
    b628:      	cmp	w16, wzr
    b62c:      	b.eq	0xb654 <_stogir.vector-comparison.operands+0x3d0>
    b630:      	uxtb	w16, w25
    b634:      	cmp	w16, wzr
    b638:      	b.eq	0xb654 <_stogir.vector-comparison.operands+0x3d0>
    b63c:      	uxtb	w16, w26
    b640:      	cmp	w16, wzr
    b644:      	b.eq	0xb654 <_stogir.vector-comparison.operands+0x3d0>
    b648:      	uxtb	w16, w27
    b64c:      	cmp	w16, wzr
    b650:      	b.ne	0xb658 <_stogir.vector-comparison.operands+0x3d4>
    b654:      	movn	w20, #0x0, lsl #16
    b658:      	sxtw	x21, w0
    b65c:      	mov	w0, w20
    b660:      	mov	w1, w23
    b664:      	bl	0xb664 <_stogir.vector-comparison.operands+0x3e0>
		000000000000b664:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    b668:      	sxtw	x0, w0
    b66c:      	cmp	x21, x0
    b670:      	b.ne	0xb3dc <_stogir.vector-comparison.operands+0x158>
    b674:      	and	x0, x24, #0xffffffff
    b678:      	movz	x1, #0x0, lsl #48
    b67c:      	movz	x2, #0x0, lsl #48
    b680:      	b	0xb3ec <_stogir.vector-comparison.operands+0x168>
    b684:      	movn	w0, #0x0, lsl #16
    b688:      	and	w20, w26, #0xf
    b68c:      	cmp	x24, #0xd
    b690:      	cset	w21, le
    b694:      	cmp	x24, #0xf
    b698:      	cset	w22, gt
    b69c:      	cmp	x24, #0x80
    b6a0:      	cset	w25, lt
    b6a4:      	ubfx	x8, x20, #0, #32
    b6a8:      	cmp	x8, #0x1
    b6ac:      	cset	w26, ge
    b6b0:      	cmp	x8, #0xd
    b6b4:      	cset	w27, le
    b6b8:      	uxtb	w16, w22
    b6bc:      	cmp	w16, wzr
    b6c0:      	b.eq	0xb700 <_stogir.vector-comparison.operands+0x47c>
    b6c4:      	uxtb	w16, w25
    b6c8:      	cmp	w16, wzr
    b6cc:      	b.eq	0xb700 <_stogir.vector-comparison.operands+0x47c>
    b6d0:      	uxtb	w16, w26
    b6d4:      	cmp	w16, wzr
    b6d8:      	b.eq	0xb700 <_stogir.vector-comparison.operands+0x47c>
    b6dc:      	uxtb	w16, w27
    b6e0:      	cmp	w16, wzr
    b6e4:      	b.eq	0xb700 <_stogir.vector-comparison.operands+0x47c>
    b6e8:      	ubfx	x8, x24, #4, #32
    b6ec:      	sub	w8, w8, #0x1
    b6f0:      	sxtw	x8, w8
    b6f4:      	mov	x16, #0x1               ; =1
    b6f8:      	lsl	x8, x16, x8
    b6fc:      	b	0xb5b0 <_stogir.vector-comparison.operands+0x32c>
    b700:      	uxtb	w16, w21
    b704:      	cmp	w16, wzr
    b708:      	b.eq	0xb5ac <_stogir.vector-comparison.operands+0x328>
    b70c:      	cmp	x24, #0x0
    b710:      	cset	w8, eq
    b714:      	uxtb	w16, w8
    b718:      	cmp	w16, wzr
    b71c:      	cset	w8, eq
    b720:      	b	0xb5b0 <_stogir.vector-comparison.operands+0x32c>

000000000000b724 <_stogir.vector-arithmetic.operands>:
    b724:      	sub	sp, sp, #0x70
    b728:      	str	x29, [sp]
    b72c:      	str	x30, [sp, #0x8]
    b730:      	mov	x29, sp
    b734:      	str	x19, [sp, #0x20]
    b738:      	str	x20, [sp, #0x28]
    b73c:      	str	x21, [sp, #0x30]
    b740:      	str	x22, [sp, #0x38]
    b744:      	str	x23, [sp, #0x40]
    b748:      	str	x24, [sp, #0x48]
    b74c:      	str	x25, [sp, #0x50]
    b750:      	str	x26, [sp, #0x58]
    b754:      	str	x27, [sp, #0x60]
    b758:      	str	x28, [sp, #0x68]
    b75c:      	mov	x19, x8
    b760:      	mov	x20, x0
    b764:      	mov	w0, w1
    b768:      	mov	w21, w1
    b76c:      	mov	w1, w2
    b770:      	mov	w22, w2
    b774:      	mov	w23, w3
    b778:      	mov	w24, w4
    b77c:      	mov	w25, w5
    b780:      	bl	0xb780 <_stogir.vector-arithmetic.operands+0x5c>
		000000000000b780:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.valid-type?
    b784:      	cmp	x0, #0x0
    b788:      	b.eq	0xb79c <_stogir.vector-arithmetic.operands+0x78>
    b78c:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b78c:  ARM64_RELOC_PAGE21	l_stogir.491
    b790:      	ldr	x0, [x0]
		000000000000b790:  ARM64_RELOC_PAGEOFF12	l_stogir.491
    b794:      	movz	x1, #0x0, lsl #48
    b798:      	b	0xb7a8 <_stogir.vector-arithmetic.operands+0x84>
    b79c:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b79c:  ARM64_RELOC_PAGE21	l_stogir.492
    b7a0:      	ldr	x0, [x0]
		000000000000b7a0:  ARM64_RELOC_PAGEOFF12	l_stogir.492
    b7a4:      	mov	x1, #0x37               ; =55
    b7a8:      	sxtw	x21, w21
    b7ac:      	sxtw	x22, w22
    b7b0:      	add	x2, x20, #0x78
    b7b4:      	add	x3, x20, #0x28
    b7b8:      	add	x4, x20, #0x50
    b7bc:      	cmp	x21, #0x31
    b7c0:      	cset	w5, ge
    b7c4:      	cmp	x21, #0x35
    b7c8:      	cset	w6, le
    b7cc:      	cmp	x21, #0x1f
    b7d0:      	cset	w7, eq
    b7d4:      	cmp	x21, #0x20
    b7d8:      	cset	w8, eq
    b7dc:      	cmp	x21, #0x2d
    b7e0:      	cset	w9, eq
    b7e4:      	cmp	x21, #0x36
    b7e8:      	cset	w10, eq
    b7ec:      	cmp	x21, #0x37
    b7f0:      	cset	w11, eq
    b7f4:      	cmp	x21, #0x38
    b7f8:      	cset	w12, eq
    b7fc:      	cmp	x21, #0x39
    b800:      	cset	w13, eq
    b804:      	movz	x14, #0x0, lsl #48
    b808:      	b	0xb92c <_stogir.vector-arithmetic.operands+0x208>
    b80c:      	movz	x27, #0x0, lsl #48
    b810:      	b	0xb820 <_stogir.vector-arithmetic.operands+0xfc>
    b814:      	movz	x27, #0x0, lsl #48
    b818:      	b	0xb828 <_stogir.vector-arithmetic.operands+0x104>
    b81c:      	movz	x27, #0x0, lsl #48
    b820:      	b	0xb838 <_stogir.vector-arithmetic.operands+0x114>
    b824:      	movz	x27, #0x0, lsl #48
    b828:      	str	x2, [sp, #0x10]
    b82c:      	str	x3, [sp, #0x18]
    b830:      	b	0xb838 <_stogir.vector-arithmetic.operands+0x114>
    b834:      	movz	x27, #0x0, lsl #48
    b838:      	cmp	x27, #0x0
    b83c:      	b.eq	0xb870 <_stogir.vector-arithmetic.operands+0x14c>
    b840:      	uxtb	w16, w26
    b844:      	cmp	w16, wzr
    b848:      	b.eq	0xb85c <_stogir.vector-arithmetic.operands+0x138>
    b84c:      	ldr	x2, [x20]
    b850:      	add	x2, x2, x15, lsl #4
    b854:      	ldr	x2, [x2]
    b858:      	b	0xb868 <_stogir.vector-arithmetic.operands+0x144>
    b85c:      	ldr	x2, [x20, #0x28]
    b860:      	add	x2, x2, x28, lsl #4
    b864:      	ldr	x2, [x2]
    b868:      	mov	w3, #0x1                ; =1
    b86c:      	b	0xb878 <_stogir.vector-arithmetic.operands+0x154>
    b870:      	movz	w3, #0x0, lsl #16
    b874:      	movz	x2, #0x0, lsl #48
    b878:      	ubfx	x3, x3, #0, #32
    b87c:      	lsr	x16, x3, #0
    b880:      	cmp	x16, #0x1
    b884:      	b.eq	0xb8a0 <_stogir.vector-arithmetic.operands+0x17c>
    b888:      	b.lo	0xb890 <_stogir.vector-arithmetic.operands+0x16c>
    b88c:      	b	0xb8a4 <_stogir.vector-arithmetic.operands+0x180>
    b890:      	cmp	x16, #0x0
    b894:      	b.eq	0xb89c <_stogir.vector-arithmetic.operands+0x178>
    b898:      	b	0xb8a4 <_stogir.vector-arithmetic.operands+0x180>
    b89c:      	b	0xb8a8 <_stogir.vector-arithmetic.operands+0x184>
    b8a0:      	b	0xb8b8 <_stogir.vector-arithmetic.operands+0x194>
    b8a4:      	b	0xbc04 <_stogir.vector-arithmetic.operands+0x4e0>
    b8a8:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b8a8:  ARM64_RELOC_PAGE21	l_stogir.493
    b8ac:      	ldr	x0, [x0]
		000000000000b8ac:  ARM64_RELOC_PAGEOFF12	l_stogir.493
    b8b0:      	mov	x1, #0x21               ; =33
    b8b4:      	b	0xb91c <_stogir.vector-arithmetic.operands+0x1f8>
    b8b8:      	orr	w3, w2, wzr
    b8bc:      	ubfx	x3, x3, #0, #32
    b8c0:      	ubfx	x3, x3, #8, #8
    b8c4:      	cmp	x3, x22
    b8c8:      	b.eq	0xb8fc <_stogir.vector-arithmetic.operands+0x1d8>
    b8cc:      	cmp	x14, #0x1
    b8d0:      	b.ne	0xb910 <_stogir.vector-arithmetic.operands+0x1ec>
    b8d4:      	uxtb	w16, w5
    b8d8:      	cmp	w16, wzr
    b8dc:      	b.eq	0xb910 <_stogir.vector-arithmetic.operands+0x1ec>
    b8e0:      	uxtb	w16, w6
    b8e4:      	cmp	w16, wzr
    b8e8:      	b.eq	0xb910 <_stogir.vector-arithmetic.operands+0x1ec>
    b8ec:      	cmp	x3, #0x1
    b8f0:      	b.lt	0xb910 <_stogir.vector-arithmetic.operands+0x1ec>
    b8f4:      	cmp	x3, #0xb
    b8f8:      	b.gt	0xb910 <_stogir.vector-arithmetic.operands+0x1ec>
    b8fc:      	uxtb	w2, w2
    b900:      	cmp	x2, #0x48
    b904:      	b.eq	0xb910 <_stogir.vector-arithmetic.operands+0x1ec>
    b908:      	cmp	x2, #0x46
    b90c:      	b.ne	0xb91c <_stogir.vector-arithmetic.operands+0x1f8>
    b910:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000b910:  ARM64_RELOC_PAGE21	l_stogir.494
    b914:      	ldr	x0, [x0]
		000000000000b914:  ARM64_RELOC_PAGEOFF12	l_stogir.494
    b918:      	mov	x1, #0x32               ; =50
    b91c:      	add	x2, x14, #0x1
    b920:      	sxtw	x14, w2
    b924:      	ldr	x2, [sp, #0x10]
    b928:      	ldr	x3, [sp, #0x18]
    b92c:      	uxtb	w16, w7
    b930:      	cmp	w16, wzr
    b934:      	b.ne	0xb988 <_stogir.vector-arithmetic.operands+0x264>
    b938:      	uxtb	w16, w8
    b93c:      	cmp	w16, wzr
    b940:      	b.ne	0xb988 <_stogir.vector-arithmetic.operands+0x264>
    b944:      	uxtb	w16, w9
    b948:      	cmp	w16, wzr
    b94c:      	b.ne	0xb988 <_stogir.vector-arithmetic.operands+0x264>
    b950:      	uxtb	w16, w10
    b954:      	cmp	w16, wzr
    b958:      	b.ne	0xb988 <_stogir.vector-arithmetic.operands+0x264>
    b95c:      	uxtb	w16, w11
    b960:      	cmp	w16, wzr
    b964:      	b.ne	0xb988 <_stogir.vector-arithmetic.operands+0x264>
    b968:      	uxtb	w16, w12
    b96c:      	cmp	w16, wzr
    b970:      	b.ne	0xb988 <_stogir.vector-arithmetic.operands+0x264>
    b974:      	uxtb	w16, w13
    b978:      	cmp	w16, wzr
    b97c:      	b.ne	0xb988 <_stogir.vector-arithmetic.operands+0x264>
    b980:      	mov	x15, #0x2               ; =2
    b984:      	b	0xb98c <_stogir.vector-arithmetic.operands+0x268>
    b988:      	mov	x15, #0x1               ; =1
    b98c:      	cmp	x14, x15
    b990:      	b.ge	0xba4c <_stogir.vector-arithmetic.operands+0x328>
    b994:      	cmp	x14, #0x0
    b998:      	b.ne	0xb9a4 <_stogir.vector-arithmetic.operands+0x280>
    b99c:      	mov	w15, w23
    b9a0:      	b	0xb9a8 <_stogir.vector-arithmetic.operands+0x284>
    b9a4:      	mov	w15, w24
    b9a8:      	sxtw	x15, w15
    b9ac:      	cmp	x15, #0x0
    b9b0:      	cset	w26, gt
    b9b4:      	movz	x16, #0x0, lsl #48
    b9b8:      	sub	x27, x16, x15
    b9bc:      	sub	x28, x27, #0x1
    b9c0:      	uxtb	w16, w26
    b9c4:      	cmp	w16, wzr
    b9c8:      	b.eq	0xba04 <_stogir.vector-arithmetic.operands+0x2e0>
    b9cc:      	ldr	x27, [x20, #0x8]
    b9d0:      	cmp	x15, x27
    b9d4:      	b.ge	0xb824 <_stogir.vector-arithmetic.operands+0x100>
    b9d8:      	ldr	x27, [x2, #0x8]
    b9dc:      	cmp	x15, x27
    b9e0:      	b.ge	0xb814 <_stogir.vector-arithmetic.operands+0xf0>
    b9e4:      	ldr	x27, [x20, #0x78]
    b9e8:      	add	x27, x27, x15, lsl #2
    b9ec:      	ldr	w27, [x27]
    b9f0:      	sxtw	x27, w27
    b9f4:      	cmp	x27, #0x0
    b9f8:      	cset	w27, ge
    b9fc:      	ubfx	x27, x27, #0, #8
    ba00:      	b	0xb818 <_stogir.vector-arithmetic.operands+0xf4>
    ba04:      	cmp	x15, #0x0
    ba08:      	b.ge	0xbce0 <_stogir.vector-arithmetic.operands+0x5bc>
    ba0c:      	str	x2, [sp, #0x10]
    ba10:      	ldr	x2, [x3, #0x8]
    ba14:      	str	x3, [sp, #0x18]
    ba18:      	ldr	x3, [x4, #0x8]
    ba1c:      	cmp	x2, x3
    ba20:      	b.ne	0xb81c <_stogir.vector-arithmetic.operands+0xf8>
    ba24:      	cmp	x27, x2
    ba28:      	b.gt	0xb80c <_stogir.vector-arithmetic.operands+0xe8>
    ba2c:      	ldr	x2, [x20, #0x50]
    ba30:      	add	x2, x2, x28, lsl #2
    ba34:      	ldr	w2, [x2]
    ba38:      	sxtw	x2, w2
    ba3c:      	cmp	x2, #0x0
    ba40:      	cset	w2, gt
    ba44:      	ubfx	x27, x2, #0, #8
    ba48:      	b	0xb810 <_stogir.vector-arithmetic.operands+0xec>
    ba4c:      	sxtw	x25, w25
    ba50:      	cmp	x25, #0x0
    ba54:      	b.ne	0xba60 <_stogir.vector-arithmetic.operands+0x33c>
    ba58:      	movz	x2, #0x0, lsl #48
    ba5c:      	b	0xba64 <_stogir.vector-arithmetic.operands+0x340>
    ba60:      	mov	x2, #0x1                ; =1
    ba64:      	cmp	x2, #0x0
    ba68:      	b.eq	0xba94 <_stogir.vector-arithmetic.operands+0x370>
    ba6c:      	cmp	x21, #0x1d
    ba70:      	b.ne	0xbb50 <_stogir.vector-arithmetic.operands+0x42c>
    ba74:      	mov	x2, #0x1                ; =1
    ba78:      	b	0xbb5c <_stogir.vector-arithmetic.operands+0x438>
    ba7c:      	mov	x2, #0x1                ; =1
    ba80:      	cmp	x2, #0x0
    ba84:      	b.eq	0xbaf4 <_stogir.vector-arithmetic.operands+0x3d0>
    ba88:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000ba88:  ARM64_RELOC_PAGE21	l_stogir.495
    ba8c:      	ldr	x0, [x0]
		000000000000ba8c:  ARM64_RELOC_PAGEOFF12	l_stogir.495
    ba90:      	mov	x1, #0x23               ; =35
    ba94:      	cmp	x1, #0x0
    ba98:      	b.ne	0xbaac <_stogir.vector-arithmetic.operands+0x388>
    ba9c:      	and	x0, x22, #0xffffffff
    baa0:      	movz	x2, #0x0, lsl #48
    baa4:      	movz	x1, #0x0, lsl #48
    baa8:      	b	0xbab0 <_stogir.vector-arithmetic.operands+0x38c>
    baac:      	mov	x2, #0x1                ; =1
    bab0:      	str	x2, [x19]
    bab4:      	str	x0, [x19, #0x8]
    bab8:      	str	x1, [x19, #0x10]
    babc:      	ldr	x19, [sp, #0x20]
    bac0:      	ldr	x20, [sp, #0x28]
    bac4:      	ldr	x21, [sp, #0x30]
    bac8:      	ldr	x22, [sp, #0x38]
    bacc:      	ldr	x23, [sp, #0x40]
    bad0:      	ldr	x24, [sp, #0x48]
    bad4:      	ldr	x25, [sp, #0x50]
    bad8:      	ldr	x26, [sp, #0x58]
    badc:      	ldr	x27, [sp, #0x60]
    bae0:      	ldr	x28, [sp, #0x68]
    bae4:      	ldr	x29, [sp]
    bae8:      	ldr	x30, [sp, #0x8]
    baec:      	add	sp, sp, #0x70
    baf0:      	ret
    baf4:      	cmp	x25, #0x0
    baf8:      	cset	w2, gt
    bafc:      	movz	x16, #0x0, lsl #48
    bb00:      	sub	x3, x16, x25
    bb04:      	sub	x4, x3, #0x1
    bb08:      	uxtb	w16, w2
    bb0c:      	cmp	w16, wzr
    bb10:      	b.eq	0xbbbc <_stogir.vector-arithmetic.operands+0x498>
    bb14:      	ldr	x3, [x20, #0x8]
    bb18:      	cmp	x25, x3
    bb1c:      	b.ge	0xbc0c <_stogir.vector-arithmetic.operands+0x4e8>
    bb20:      	add	x3, x20, #0x78
    bb24:      	ldr	x3, [x3, #0x8]
    bb28:      	cmp	x25, x3
    bb2c:      	b.ge	0xbcc8 <_stogir.vector-arithmetic.operands+0x5a4>
    bb30:      	ldr	x3, [x20, #0x78]
    bb34:      	add	x3, x3, x25, lsl #2
    bb38:      	ldr	w3, [x3]
    bb3c:      	sxtw	x3, w3
    bb40:      	cmp	x3, #0x0
    bb44:      	cset	w3, ge
    bb48:      	ubfx	x3, x3, #0, #8
    bb4c:      	b	0xbccc <_stogir.vector-arithmetic.operands+0x5a8>
    bb50:      	cmp	x21, #0x1e
    bb54:      	cset	w2, eq
    bb58:      	ubfx	x2, x2, #0, #8
    bb5c:      	cmp	x2, #0x0
    bb60:      	b.eq	0xba7c <_stogir.vector-arithmetic.operands+0x358>
    bb64:      	movz	x2, #0x0, lsl #48
    bb68:      	b	0xba80 <_stogir.vector-arithmetic.operands+0x35c>
    bb6c:      	movz	w3, #0x0, lsl #16
    bb70:      	uxtb	w16, w3
    bb74:      	and	w3, w16, #0x2
    bb78:      	uxtb	w3, w3
    bb7c:      	ubfx	x3, x3, #0, #8
    bb80:      	cmp	x3, #0x0
    bb84:      	cset	w3, eq
    bb88:      	uxtb	w16, w3
    bb8c:      	cmp	w16, wzr
    bb90:      	cset	x3, eq
    bb94:      	cmp	x3, #0x0
    bb98:      	b.ne	0xbbb8 <_stogir.vector-arithmetic.operands+0x494>
    bb9c:      	cmp	x2, #0x65
    bba0:      	b.eq	0xbbb8 <_stogir.vector-arithmetic.operands+0x494>
    bba4:      	cmp	x2, #0x66
    bba8:      	b.eq	0xbbb8 <_stogir.vector-arithmetic.operands+0x494>
    bbac:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000bbac:  ARM64_RELOC_PAGE21	l_stogir.496
    bbb0:      	ldr	x0, [x0]
		000000000000bbb0:  ARM64_RELOC_PAGEOFF12	l_stogir.496
    bbb4:      	mov	x1, #0x34               ; =52
    bbb8:      	b	0xba94 <_stogir.vector-arithmetic.operands+0x370>
    bbbc:      	cmp	x25, #0x0
    bbc0:      	b.ge	0xbc14 <_stogir.vector-arithmetic.operands+0x4f0>
    bbc4:      	add	x5, x20, #0x28
    bbc8:      	add	x6, x20, #0x50
    bbcc:      	ldr	x5, [x5, #0x8]
    bbd0:      	ldr	x6, [x6, #0x8]
    bbd4:      	cmp	x5, x6
    bbd8:      	b.ne	0xbcc0 <_stogir.vector-arithmetic.operands+0x59c>
    bbdc:      	cmp	x3, x5
    bbe0:      	b.gt	0xbcd0 <_stogir.vector-arithmetic.operands+0x5ac>
    bbe4:      	ldr	x3, [x20, #0x50]
    bbe8:      	add	x3, x3, x4, lsl #2
    bbec:      	ldr	w3, [x3]
    bbf0:      	sxtw	x3, w3
    bbf4:      	cmp	x3, #0x0
    bbf8:      	cset	w3, gt
    bbfc:      	ubfx	x3, x3, #0, #8
    bc00:      	b	0xbcd4 <_stogir.vector-arithmetic.operands+0x5b0>
    bc04:      	brk	#0
    bc08:      	b	0xbc04 <_stogir.vector-arithmetic.operands+0x4e0>
    bc0c:      	movz	x3, #0x0, lsl #48
    bc10:      	b	0xbc18 <_stogir.vector-arithmetic.operands+0x4f4>
    bc14:      	movz	x3, #0x0, lsl #48
    bc18:      	cmp	x3, #0x0
    bc1c:      	b.eq	0xbc50 <_stogir.vector-arithmetic.operands+0x52c>
    bc20:      	uxtb	w16, w2
    bc24:      	cmp	w16, wzr
    bc28:      	b.eq	0xbc3c <_stogir.vector-arithmetic.operands+0x518>
    bc2c:      	ldr	x2, [x20]
    bc30:      	add	x2, x2, x25, lsl #4
    bc34:      	ldr	x2, [x2]
    bc38:      	b	0xbc48 <_stogir.vector-arithmetic.operands+0x524>
    bc3c:      	ldr	x2, [x20, #0x28]
    bc40:      	add	x2, x2, x4, lsl #4
    bc44:      	ldr	x2, [x2]
    bc48:      	mov	w3, #0x1                ; =1
    bc4c:      	b	0xbc58 <_stogir.vector-arithmetic.operands+0x534>
    bc50:      	movz	w3, #0x0, lsl #16
    bc54:      	movz	x2, #0x0, lsl #48
    bc58:      	ubfx	x3, x3, #0, #32
    bc5c:      	lsr	x16, x3, #0
    bc60:      	cmp	x16, #0x1
    bc64:      	b.eq	0xbc80 <_stogir.vector-arithmetic.operands+0x55c>
    bc68:      	b.lo	0xbc70 <_stogir.vector-arithmetic.operands+0x54c>
    bc6c:      	b	0xbc84 <_stogir.vector-arithmetic.operands+0x560>
    bc70:      	cmp	x16, #0x0
    bc74:      	b.eq	0xbc7c <_stogir.vector-arithmetic.operands+0x558>
    bc78:      	b	0xbc84 <_stogir.vector-arithmetic.operands+0x560>
    bc7c:      	b	0xbc88 <_stogir.vector-arithmetic.operands+0x564>
    bc80:      	b	0xbc98 <_stogir.vector-arithmetic.operands+0x574>
    bc84:      	b	0xbcd8 <_stogir.vector-arithmetic.operands+0x5b4>
    bc88:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000bc88:  ARM64_RELOC_PAGE21	l_stogir.497
    bc8c:      	ldr	x0, [x0]
		000000000000bc8c:  ARM64_RELOC_PAGEOFF12	l_stogir.497
    bc90:      	mov	x1, #0x1d               ; =29
    bc94:      	b	0xbbb8 <_stogir.vector-arithmetic.operands+0x494>
    bc98:      	cmp	x25, #0x0
    bc9c:      	b.le	0xbbac <_stogir.vector-arithmetic.operands+0x488>
    bca0:      	uxtb	w2, w2
    bca4:      	cmp	x2, #0x83
    bca8:      	b.ge	0xbb6c <_stogir.vector-arithmetic.operands+0x448>
    bcac:      	adrp	x17, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000bcac:  ARM64_RELOC_PAGE21	l_stogir.498
    bcb0:      	ldr	x17, [x17]
		000000000000bcb0:  ARM64_RELOC_PAGEOFF12	l_stogir.498
    bcb4:      	add	x3, x2, x17
    bcb8:      	ldrb	w3, [x3]
    bcbc:      	b	0xbb70 <_stogir.vector-arithmetic.operands+0x44c>
    bcc0:      	movz	x3, #0x0, lsl #48
    bcc4:      	b	0xbc18 <_stogir.vector-arithmetic.operands+0x4f4>
    bcc8:      	movz	x3, #0x0, lsl #48
    bccc:      	b	0xbc10 <_stogir.vector-arithmetic.operands+0x4ec>
    bcd0:      	movz	x3, #0x0, lsl #48
    bcd4:      	b	0xbcc4 <_stogir.vector-arithmetic.operands+0x5a0>
    bcd8:      	brk	#0
    bcdc:      	b	0xbcd8 <_stogir.vector-arithmetic.operands+0x5b4>
    bce0:      	str	x2, [sp, #0x10]
    bce4:      	str	x3, [sp, #0x18]
    bce8:      	b	0xb834 <_stogir.vector-arithmetic.operands+0x110>

000000000000bcec <_stogir.switch.key>:
    bcec:      	sub	sp, sp, #0x30
    bcf0:      	str	x19, [sp]
    bcf4:      	str	x20, [sp, #0x8]
    bcf8:      	str	x21, [sp, #0x10]
    bcfc:      	str	x22, [sp, #0x18]
    bd00:      	str	x23, [sp, #0x20]
    bd04:      	sxtw	x2, w2
    bd08:      	cmp	x2, #0x1
    bd0c:      	b.lt	0xbd84 <_stogir.switch.key+0x98>
    bd10:      	cmp	x2, #0xb
    bd14:      	cset	w3, le
    bd18:      	uxtb	w16, w3
    bd1c:      	cmp	w16, wzr
    bd20:      	b.eq	0xbd84 <_stogir.switch.key+0x98>
    bd24:      	sxtw	x1, w1
    bd28:      	cmp	x1, #0x0
    bd2c:      	cset	w4, gt
    bd30:      	movz	x16, #0x0, lsl #48
    bd34:      	sub	x5, x16, x1
    bd38:      	sub	x6, x5, #0x1
    bd3c:      	uxtb	w16, w4
    bd40:      	cmp	w16, wzr
    bd44:      	b.eq	0xbdfc <_stogir.switch.key+0x110>
    bd48:      	ldr	x5, [x0, #0x8]
    bd4c:      	cmp	x1, x5
    bd50:      	b.ge	0xbe44 <_stogir.switch.key+0x158>
    bd54:      	add	x5, x0, #0x78
    bd58:      	ldr	x5, [x5, #0x8]
    bd5c:      	cmp	x1, x5
    bd60:      	b.ge	0xbf80 <_stogir.switch.key+0x294>
    bd64:      	ldr	x5, [x0, #0x78]
    bd68:      	add	x5, x5, x1, lsl #2
    bd6c:      	ldr	w5, [x5]
    bd70:      	sxtw	x5, w5
    bd74:      	cmp	x5, #0x0
    bd78:      	cset	w5, ge
    bd7c:      	ubfx	x5, x5, #0, #8
    bd80:      	b	0xbf84 <_stogir.switch.key+0x298>
    bd84:      	mov	x1, #0x1                ; =1
    bd88:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000bd88:  ARM64_RELOC_PAGE21	l_stogir.499
    bd8c:      	ldr	x0, [x0]
		000000000000bd8c:  ARM64_RELOC_PAGEOFF12	l_stogir.499
    bd90:      	mov	x2, #0x24               ; =36
    bd94:      	str	x1, [x8]
    bd98:      	str	x0, [x8, #0x8]
    bd9c:      	str	x2, [x8, #0x10]
    bda0:      	ldr	x19, [sp]
    bda4:      	ldr	x20, [sp, #0x8]
    bda8:      	ldr	x21, [sp, #0x10]
    bdac:      	ldr	x22, [sp, #0x18]
    bdb0:      	ldr	x23, [sp, #0x20]
    bdb4:      	add	sp, sp, #0x30
    bdb8:      	ret
    bdbc:      	mov	w23, #0x1               ; =1
    bdc0:      	cmp	x1, #0x0
    bdc4:      	b.ge	0xbde8 <_stogir.switch.key+0xfc>
    bdc8:      	orr	w1, w4, wzr
    bdcc:      	uxtb	w4, w4
    bdd0:      	ubfx	x1, x1, #0, #32
    bdd4:      	ubfx	x1, x1, #8, #8
    bdd8:      	cmp	x4, x1
    bddc:      	b.eq	0xc028 <_stogir.switch.key+0x33c>
    bde0:      	cmp	x4, #0x49
    bde4:      	b.eq	0xc028 <_stogir.switch.key+0x33c>
    bde8:      	mov	x1, #0x1                ; =1
    bdec:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000bdec:  ARM64_RELOC_PAGE21	l_stogir.500
    bdf0:      	ldr	x0, [x0]
		000000000000bdf0:  ARM64_RELOC_PAGEOFF12	l_stogir.500
    bdf4:      	mov	x2, #0x30               ; =48
    bdf8:      	b	0xbd94 <_stogir.switch.key+0xa8>
    bdfc:      	cmp	x1, #0x0
    be00:      	b.ge	0xbe4c <_stogir.switch.key+0x160>
    be04:      	add	x7, x0, #0x28
    be08:      	add	x9, x0, #0x50
    be0c:      	ldr	x7, [x7, #0x8]
    be10:      	ldr	x9, [x9, #0x8]
    be14:      	cmp	x7, x9
    be18:      	b.ne	0xbf78 <_stogir.switch.key+0x28c>
    be1c:      	cmp	x5, x7
    be20:      	b.gt	0xc020 <_stogir.switch.key+0x334>
    be24:      	ldr	x5, [x0, #0x50]
    be28:      	add	x5, x5, x6, lsl #2
    be2c:      	ldr	w5, [x5]
    be30:      	sxtw	x5, w5
    be34:      	cmp	x5, #0x0
    be38:      	cset	w5, gt
    be3c:      	ubfx	x5, x5, #0, #8
    be40:      	b	0xc024 <_stogir.switch.key+0x338>
    be44:      	movz	x5, #0x0, lsl #48
    be48:      	b	0xbe50 <_stogir.switch.key+0x164>
    be4c:      	movz	x5, #0x0, lsl #48
    be50:      	cmp	x5, #0x0
    be54:      	b.eq	0xbe90 <_stogir.switch.key+0x1a4>
    be58:      	uxtb	w16, w4
    be5c:      	cmp	w16, wzr
    be60:      	b.eq	0xbe78 <_stogir.switch.key+0x18c>
    be64:      	ldr	x0, [x0]
    be68:      	add	x0, x0, x1, lsl #4
    be6c:      	ldr	x4, [x0]
    be70:      	ldr	x0, [x0, #0x8]
    be74:      	b	0xbe88 <_stogir.switch.key+0x19c>
    be78:      	ldr	x0, [x0, #0x28]
    be7c:      	add	x0, x0, x6, lsl #4
    be80:      	ldr	x4, [x0]
    be84:      	ldr	x0, [x0, #0x8]
    be88:      	mov	w5, #0x1                ; =1
    be8c:      	b	0xbe9c <_stogir.switch.key+0x1b0>
    be90:      	movz	w5, #0x0, lsl #16
    be94:      	movz	x4, #0x0, lsl #48
    be98:      	movz	x0, #0x0, lsl #48
    be9c:      	ubfx	x5, x5, #0, #32
    bea0:      	lsr	x16, x5, #0
    bea4:      	cmp	x16, #0x1
    bea8:      	b.eq	0xbec4 <_stogir.switch.key+0x1d8>
    beac:      	b.lo	0xbeb4 <_stogir.switch.key+0x1c8>
    beb0:      	b	0xbec8 <_stogir.switch.key+0x1dc>
    beb4:      	cmp	x16, #0x0
    beb8:      	b.eq	0xbec0 <_stogir.switch.key+0x1d4>
    bebc:      	b	0xbec8 <_stogir.switch.key+0x1dc>
    bec0:      	b	0xbecc <_stogir.switch.key+0x1e0>
    bec4:      	b	0xbee0 <_stogir.switch.key+0x1f4>
    bec8:      	b	0xc0bc <_stogir.switch.key+0x3d0>
    becc:      	mov	x1, #0x1                ; =1
    bed0:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x49c>
		000000000000bed0:  ARM64_RELOC_PAGE21	l_stogir.501
    bed4:      	ldr	x0, [x0]
		000000000000bed4:  ARM64_RELOC_PAGEOFF12	l_stogir.501
    bed8:      	mov	x2, #0x1c               ; =28
    bedc:      	b	0xbdf8 <_stogir.switch.key+0x10c>
    bee0:      	cmp	x2, #0x1
    bee4:      	cset	w5, eq
    bee8:      	cmp	x2, #0x0
    beec:      	cset	w6, eq
    bef0:      	cmp	x2, #0x2
    bef4:      	cset	w7, eq
    bef8:      	cmp	x2, #0x7
    befc:      	cset	w9, eq
    bf00:      	cmp	x2, #0x8
    bf04:      	cset	w10, eq
    bf08:      	cmp	x2, #0x3
    bf0c:      	cset	w11, eq
    bf10:      	cmp	x2, #0x9
    bf14:      	cset	w12, eq
    bf18:      	cmp	x2, #0x4
    bf1c:      	cset	w13, eq
    bf20:      	cmp	x2, #0xa
    bf24:      	cset	w14, eq
    bf28:      	cmp	x2, #0xd
    bf2c:      	cset	w15, eq
    bf30:      	cmp	x2, #0x5
    bf34:      	cset	w19, eq
    bf38:      	cmp	x2, #0xb
    bf3c:      	cset	w20, eq
    bf40:      	cmp	x2, #0xc
    bf44:      	cset	w21, eq
    bf48:      	cmp	x2, #0x6
    bf4c:      	cset	w22, eq
    bf50:      	uxtb	w16, w22
    bf54:      	cmp	w16, wzr
    bf58:      	mov	w16, #0x8               ; =8
    bf5c:      	movn	w17, #0x0, lsl #16
    bf60:      	csel	w22, w16, w17, ne
    bf64:      	uxtb	w16, w6
    bf68:      	cmp	w16, wzr
    bf6c:      	b.eq	0xbf88 <_stogir.switch.key+0x29c>
    bf70:      	movz	w23, #0x0, lsl #16
    bf74:      	b	0xbdc0 <_stogir.switch.key+0xd4>
    bf78:      	movz	x5, #0x0, lsl #48
    bf7c:      	b	0xbe50 <_stogir.switch.key+0x164>
    bf80:      	movz	x5, #0x0, lsl #48
    bf84:      	b	0xbe48 <_stogir.switch.key+0x15c>
    bf88:      	uxtb	w16, w5
    bf8c:      	cmp	w16, wzr
    bf90:      	b.ne	0xbdbc <_stogir.switch.key+0xd0>
    bf94:      	uxtb	w16, w7
    bf98:      	cmp	w16, wzr
    bf9c:      	b.ne	0xbdbc <_stogir.switch.key+0xd0>
    bfa0:      	uxtb	w16, w9
    bfa4:      	cmp	w16, wzr
    bfa8:      	b.ne	0xbdbc <_stogir.switch.key+0xd0>
    bfac:      	uxtb	w16, w10
    bfb0:      	cmp	w16, wzr
    bfb4:      	b.ne	0xbdbc <_stogir.switch.key+0xd0>
    bfb8:      	uxtb	w16, w11
    bfbc:      	cmp	w16, wzr
    bfc0:      	b.ne	0xc0b4 <_stogir.switch.key+0x3c8>
    bfc4:      	uxtb	w16, w12
    bfc8:      	cmp	w16, wzr
    bfcc:      	b.ne	0xc0b4 <_stogir.switch.key+0x3c8>
    bfd0:      	uxtb	w16, w13
    bfd4:      	cmp	w16, wzr
    bfd8:      	b.ne	0xc178 <_stogir.switch.key+0x48c>
    bfdc:      	uxtb	w16, w14
    bfe0:      	cmp	w16, wzr
    bfe4:      	b.ne	0xc178 <_stogir.switch.key+0x48c>
    bfe8:      	uxtb	w16, w15
    bfec:      	cmp	w16, wzr
    bff0:      	b.ne	0xc178 <_stogir.switch.key+0x48c>
    bff4:      	uxtb	w16, w19
    bff8:      	cmp	w16, wzr
    bffc:      	b.ne	0xc180 <_stogir.switch.key+0x494>
    c000:      	uxtb	w16, w20
    c004:      	cmp	w16, wzr
    c008:      	b.ne	0xc180 <_stogir.switch.key+0x494>
    c00c:      	uxtb	w16, w21
    c010:      	cmp	w16, wzr
    c014:      	b.ne	0xc180 <_stogir.switch.key+0x494>
    c018:      	mov	w23, w22
    c01c:      	b	0xc184 <_stogir.switch.key+0x498>
    c020:      	movz	x5, #0x0, lsl #48
    c024:      	b	0xbf7c <_stogir.switch.key+0x290>
    c028:      	cmp	x1, x2
    c02c:      	b.ne	0xbde8 <_stogir.switch.key+0xfc>
    c030:      	lsl	w1, w23, #3
    c034:      	orr	w4, w0, wzr
    c038:      	sxtw	x1, w1
    c03c:      	ubfx	x4, x4, #0, #32
    c040:      	lsr	x0, x0, #32
    c044:      	ubfx	x0, x0, #0, #32
    c048:      	lsl	x0, x0, #32
    c04c:      	orr	x0, x0, x4
    c050:      	cmp	x1, #0x40
    c054:      	b.ge	0xc064 <_stogir.switch.key+0x378>
    c058:      	lsr	x1, x0, x1
    c05c:      	cmp	x1, #0x0
    c060:      	b.ne	0xbde8 <_stogir.switch.key+0xfc>
    c064:      	uxtb	w16, w5
    c068:      	cmp	w16, wzr
    c06c:      	b.eq	0xc078 <_stogir.switch.key+0x38c>
    c070:      	cmp	x0, #0x1
    c074:      	b.hi	0xbde8 <_stogir.switch.key+0xfc>
    c078:      	cmp	x2, #0x7
    c07c:      	b.lt	0xc0a0 <_stogir.switch.key+0x3b4>
    c080:      	uxtb	w16, w3
    c084:      	cmp	w16, wzr
    c088:      	b.eq	0xc0a0 <_stogir.switch.key+0x3b4>
    c08c:      	uxtb	w16, w6
    c090:      	cmp	w16, wzr
    c094:      	b.eq	0xc0e0 <_stogir.switch.key+0x3f4>
    c098:      	movz	w22, #0x0, lsl #16
    c09c:      	b	0xc0c8 <_stogir.switch.key+0x3dc>
    c0a0:      	movz	x1, #0x0, lsl #48
    c0a4:      	eor	x0, x1, x0
    c0a8:      	movz	x1, #0x0, lsl #48
    c0ac:      	movz	x2, #0x0, lsl #48
    c0b0:      	b	0xbdf8 <_stogir.switch.key+0x10c>
    c0b4:      	mov	w23, #0x2               ; =2
    c0b8:      	b	0xbdc0 <_stogir.switch.key+0xd4>
    c0bc:      	brk	#0
    c0c0:      	b	0xc0bc <_stogir.switch.key+0x3d0>
    c0c4:      	mov	w22, #0x1               ; =1
    c0c8:      	lsl	w1, w22, #3
    c0cc:      	sub	w1, w1, #0x1
    c0d0:      	sxtw	x1, w1
    c0d4:      	mov	x16, #0x1               ; =1
    c0d8:      	lsl	x1, x16, x1
    c0dc:      	b	0xc0a4 <_stogir.switch.key+0x3b8>
    c0e0:      	uxtb	w16, w5
    c0e4:      	cmp	w16, wzr
    c0e8:      	b.ne	0xc0c4 <_stogir.switch.key+0x3d8>
    c0ec:      	uxtb	w16, w7
    c0f0:      	cmp	w16, wzr
    c0f4:      	b.ne	0xc0c4 <_stogir.switch.key+0x3d8>
    c0f8:      	uxtb	w16, w9
    c0fc:      	cmp	w16, wzr
    c100:      	b.ne	0xc0c4 <_stogir.switch.key+0x3d8>
    c104:      	uxtb	w16, w10
    c108:      	cmp	w16, wzr
    c10c:      	b.ne	0xc0c4 <_stogir.switch.key+0x3d8>
    c110:      	uxtb	w16, w11
    c114:      	cmp	w16, wzr
    c118:      	b.ne	0xc188 <_stogir.switch.key+0x49c>
    c11c:      	uxtb	w16, w12
    c120:      	cmp	w16, wzr
    c124:      	b.ne	0xc188 <_stogir.switch.key+0x49c>
    c128:      	uxtb	w16, w13
    c12c:      	cmp	w16, wzr
    c130:      	b.ne	0xc190 <_stogir.switch.key+0x4a4>
    c134:      	uxtb	w16, w14
    c138:      	cmp	w16, wzr
    c13c:      	b.ne	0xc190 <_stogir.switch.key+0x4a4>
    c140:      	uxtb	w16, w15
    c144:      	cmp	w16, wzr
    c148:      	b.ne	0xc190 <_stogir.switch.key+0x4a4>
    c14c:      	uxtb	w16, w19
    c150:      	cmp	w16, wzr
    c154:      	b.ne	0xc170 <_stogir.switch.key+0x484>
    c158:      	uxtb	w16, w20
    c15c:      	cmp	w16, wzr
    c160:      	b.ne	0xc170 <_stogir.switch.key+0x484>
    c164:      	uxtb	w16, w21
    c168:      	cmp	w16, wzr
    c16c:      	b.eq	0xc174 <_stogir.switch.key+0x488>
    c170:      	mov	w22, #0x8               ; =8
    c174:      	b	0xc194 <_stogir.switch.key+0x4a8>
    c178:      	mov	w23, #0x4               ; =4
    c17c:      	b	0xc0b8 <_stogir.switch.key+0x3cc>
    c180:      	mov	w23, #0x8               ; =8
    c184:      	b	0xc17c <_stogir.switch.key+0x490>
    c188:      	mov	w22, #0x2               ; =2
    c18c:      	b	0xc0c8 <_stogir.switch.key+0x3dc>
    c190:      	mov	w22, #0x4               ; =4
    c194:      	b	0xc18c <_stogir.switch.key+0x4a0>

000000000000c198 <_stogir.stack.entry-allocation?>:
    c198:      	sub	sp, sp, #0x10
    c19c:      	add	x2, x0, #0x78
    c1a0:      	add	x3, x0, #0x28
    c1a4:      	add	x4, x0, #0x50
    c1a8:      	add	x5, x0, #0x78
    c1ac:      	add	x6, x0, #0x28
    c1b0:      	add	x7, x0, #0x50
    c1b4:      	sxtw	x1, w1
    c1b8:      	mov	x8, #0x1                ; =1
    c1bc:      	movz	x9, #0x0, lsl #48
    c1c0:      	b	0xc2c4 <_stogir.stack.entry-allocation?+0x12c>
    c1c4:      	movz	x12, #0x0, lsl #48
    c1c8:      	b	0xc234 <_stogir.stack.entry-allocation?+0x9c>
    c1cc:      	movz	w11, #0x0, lsl #16
    c1d0:      	movz	x10, #0x0, lsl #48
    c1d4:      	ubfx	x11, x11, #0, #32
    c1d8:      	lsr	x16, x11, #0
    c1dc:      	cmp	x16, #0x1
    c1e0:      	b.eq	0xc1fc <_stogir.stack.entry-allocation?+0x64>
    c1e4:      	b.lo	0xc1ec <_stogir.stack.entry-allocation?+0x54>
    c1e8:      	b	0xc200 <_stogir.stack.entry-allocation?+0x68>
    c1ec:      	cmp	x16, #0x0
    c1f0:      	b.eq	0xc1f8 <_stogir.stack.entry-allocation?+0x60>
    c1f4:      	b	0xc200 <_stogir.stack.entry-allocation?+0x68>
    c1f8:      	b	0xc220 <_stogir.stack.entry-allocation?+0x88>
    c1fc:      	b	0xc204 <_stogir.stack.entry-allocation?+0x6c>
    c200:      	b	0xc4e8 <_stogir.stack.entry-allocation?+0x350>
    c204:      	uxtb	w11, w10
    c208:      	ubfx	x10, x10, #0, #32
    c20c:      	ubfx	x10, x10, #8, #8
    c210:      	cmp	x11, x10
    c214:      	b.eq	0xc4d8 <_stogir.stack.entry-allocation?+0x340>
    c218:      	cmp	x11, #0x49
    c21c:      	b.eq	0xc4d8 <_stogir.stack.entry-allocation?+0x340>
    c220:      	movz	x8, #0x0, lsl #48
    c224:      	b	0xc3a4 <_stogir.stack.entry-allocation?+0x20c>
    c228:      	movz	x12, #0x0, lsl #48
    c22c:      	b	0xc23c <_stogir.stack.entry-allocation?+0xa4>
    c230:      	movz	x12, #0x0, lsl #48
    c234:      	b	0xc244 <_stogir.stack.entry-allocation?+0xac>
    c238:      	movz	x12, #0x0, lsl #48
    c23c:      	b	0xc244 <_stogir.stack.entry-allocation?+0xac>
    c240:      	movz	x12, #0x0, lsl #48
    c244:      	cmp	x12, #0x0
    c248:      	b.eq	0xc284 <_stogir.stack.entry-allocation?+0xec>
    c24c:      	uxtb	w16, w11
    c250:      	cmp	w16, wzr
    c254:      	b.eq	0xc26c <_stogir.stack.entry-allocation?+0xd4>
    c258:      	ldr	x11, [x0]
    c25c:      	add	x10, x11, x10, lsl #4
    c260:      	ldr	x11, [x10]
    c264:      	ldr	x10, [x10, #0x8]
    c268:      	b	0xc27c <_stogir.stack.entry-allocation?+0xe4>
    c26c:      	ldr	x10, [x0, #0x28]
    c270:      	add	x10, x10, x13, lsl #4
    c274:      	ldr	x11, [x10]
    c278:      	ldr	x10, [x10, #0x8]
    c27c:      	mov	w12, #0x1               ; =1
    c280:      	b	0xc290 <_stogir.stack.entry-allocation?+0xf8>
    c284:      	movz	w12, #0x0, lsl #16
    c288:      	movz	x11, #0x0, lsl #48
    c28c:      	movz	x10, #0x0, lsl #48
    c290:      	ubfx	x12, x12, #0, #32
    c294:      	lsr	x16, x12, #0
    c298:      	cmp	x16, #0x1
    c29c:      	b.eq	0xc2b8 <_stogir.stack.entry-allocation?+0x120>
    c2a0:      	b.lo	0xc2a8 <_stogir.stack.entry-allocation?+0x110>
    c2a4:      	b	0xc2bc <_stogir.stack.entry-allocation?+0x124>
    c2a8:      	cmp	x16, #0x0
    c2ac:      	b.eq	0xc2b4 <_stogir.stack.entry-allocation?+0x11c>
    c2b0:      	b	0xc2bc <_stogir.stack.entry-allocation?+0x124>
    c2b4:      	b	0xc2c0 <_stogir.stack.entry-allocation?+0x128>
    c2b8:      	b	0xc374 <_stogir.stack.entry-allocation?+0x1dc>
    c2bc:      	b	0xc444 <_stogir.stack.entry-allocation?+0x2ac>
    c2c0:      	movz	x8, #0x0, lsl #48
    c2c4:      	cmp	x8, #0x0
    c2c8:      	b.eq	0xc42c <_stogir.stack.entry-allocation?+0x294>
    c2cc:      	cmp	x9, #0x0
    c2d0:      	b.ne	0xc42c <_stogir.stack.entry-allocation?+0x294>
    c2d4:      	orr	w10, w1, wzr
    c2d8:      	sxtw	x10, w10
    c2dc:      	cmp	x10, #0x0
    c2e0:      	cset	w11, gt
    c2e4:      	movz	x16, #0x0, lsl #48
    c2e8:      	sub	x12, x16, x10
    c2ec:      	sub	x13, x12, #0x1
    c2f0:      	uxtb	w16, w11
    c2f4:      	cmp	w16, wzr
    c2f8:      	b.eq	0xc334 <_stogir.stack.entry-allocation?+0x19c>
    c2fc:      	ldr	x12, [x0, #0x8]
    c300:      	cmp	x10, x12
    c304:      	b.ge	0xc238 <_stogir.stack.entry-allocation?+0xa0>
    c308:      	ldr	x12, [x2, #0x8]
    c30c:      	cmp	x10, x12
    c310:      	b.ge	0xc228 <_stogir.stack.entry-allocation?+0x90>
    c314:      	ldr	x12, [x0, #0x78]
    c318:      	add	x12, x12, x10, lsl #2
    c31c:      	ldr	w12, [x12]
    c320:      	sxtw	x12, w12
    c324:      	cmp	x12, #0x0
    c328:      	cset	w12, ge
    c32c:      	ubfx	x12, x12, #0, #8
    c330:      	b	0xc22c <_stogir.stack.entry-allocation?+0x94>
    c334:      	cmp	x10, #0x0
    c338:      	b.ge	0xc240 <_stogir.stack.entry-allocation?+0xa8>
    c33c:      	ldr	x14, [x3, #0x8]
    c340:      	ldr	x15, [x4, #0x8]
    c344:      	cmp	x14, x15
    c348:      	b.ne	0xc230 <_stogir.stack.entry-allocation?+0x98>
    c34c:      	cmp	x12, x14
    c350:      	b.gt	0xc1c4 <_stogir.stack.entry-allocation?+0x2c>
    c354:      	ldr	x12, [x0, #0x50]
    c358:      	add	x12, x12, x13, lsl #2
    c35c:      	ldr	w12, [x12]
    c360:      	sxtw	x12, w12
    c364:      	cmp	x12, #0x0
    c368:      	cset	w12, gt
    c36c:      	ubfx	x12, x12, #0, #8
    c370:      	b	0xc1c8 <_stogir.stack.entry-allocation?+0x30>
    c374:      	uxtb	w12, w11
    c378:      	asr	x13, x11, #32
    c37c:      	mov	x16, sp
    c380:      	str	x11, [x16]
    c384:      	mov	x16, sp
    c388:      	str	x10, [x16, #0x8]
    c38c:      	cmp	x12, #0x68
    c390:      	b.ne	0xc3a8 <_stogir.stack.entry-allocation?+0x210>
    c394:      	cmp	x13, #0x0
    c398:      	cset	w8, eq
    c39c:      	ubfx	x8, x8, #0, #8
    c3a0:      	mov	x9, #0x1                ; =1
    c3a4:      	b	0xc2c4 <_stogir.stack.entry-allocation?+0x12c>
    c3a8:      	cmp	x1, #0x0
    c3ac:      	b.le	0xc220 <_stogir.stack.entry-allocation?+0x88>
    c3b0:      	cmp	x12, #0x51
    c3b4:      	b.ne	0xc220 <_stogir.stack.entry-allocation?+0x88>
    c3b8:      	cmp	x13, #0x0
    c3bc:      	b.le	0xc220 <_stogir.stack.entry-allocation?+0x88>
    c3c0:      	cmp	x13, x1
    c3c4:      	b.ge	0xc220 <_stogir.stack.entry-allocation?+0x88>
    c3c8:      	sxtw	x10, w10
    c3cc:      	cmp	x10, #0x0
    c3d0:      	b.ge	0xc220 <_stogir.stack.entry-allocation?+0x88>
    c3d4:      	cmp	x10, #0x0
    c3d8:      	cset	w11, gt
    c3dc:      	movz	x16, #0x0, lsl #48
    c3e0:      	sub	x12, x16, x10
    c3e4:      	sub	x13, x12, #0x1
    c3e8:      	uxtb	w16, w11
    c3ec:      	cmp	w16, wzr
    c3f0:      	b.eq	0xc490 <_stogir.stack.entry-allocation?+0x2f8>
    c3f4:      	ldr	x12, [x0, #0x8]
    c3f8:      	cmp	x10, x12
    c3fc:      	b.ge	0xc488 <_stogir.stack.entry-allocation?+0x2f0>
    c400:      	ldr	x12, [x5, #0x8]
    c404:      	cmp	x10, x12
    c408:      	b.ge	0xc4d0 <_stogir.stack.entry-allocation?+0x338>
    c40c:      	ldr	x12, [x0, #0x78]
    c410:      	add	x12, x12, x10, lsl #2
    c414:      	ldr	w12, [x12]
    c418:      	sxtw	x12, w12
    c41c:      	cmp	x12, #0x0
    c420:      	cset	w12, ge
    c424:      	ubfx	x12, x12, #0, #8
    c428:      	b	0xc4d4 <_stogir.stack.entry-allocation?+0x33c>
    c42c:      	cmp	x8, #0x0
    c430:      	b.ne	0xc438 <_stogir.stack.entry-allocation?+0x2a0>
    c434:      	movz	x9, #0x0, lsl #48
    c438:      	mov	x0, x9
    c43c:      	add	sp, sp, #0x10
    c440:      	ret
    c444:      	brk	#0
    c448:      	b	0xc444 <_stogir.stack.entry-allocation?+0x2ac>
    c44c:      	ldr	x10, [x0, #0x28]
    c450:      	add	x10, x10, x13, lsl #4
    c454:      	ldr	x10, [x10]
    c458:      	mov	w11, #0x1               ; =1
    c45c:      	b	0xc1d4 <_stogir.stack.entry-allocation?+0x3c>
    c460:      	movz	x12, #0x0, lsl #48
    c464:      	cmp	x12, #0x0
    c468:      	b.eq	0xc1cc <_stogir.stack.entry-allocation?+0x34>
    c46c:      	uxtb	w16, w11
    c470:      	cmp	w16, wzr
    c474:      	b.eq	0xc44c <_stogir.stack.entry-allocation?+0x2b4>
    c478:      	ldr	x11, [x0]
    c47c:      	add	x10, x11, x10, lsl #4
    c480:      	ldr	x10, [x10]
    c484:      	b	0xc458 <_stogir.stack.entry-allocation?+0x2c0>
    c488:      	movz	x12, #0x0, lsl #48
    c48c:      	b	0xc464 <_stogir.stack.entry-allocation?+0x2cc>
    c490:      	ldr	x14, [x6, #0x8]
    c494:      	ldr	x15, [x7, #0x8]
    c498:      	cmp	x14, x15
    c49c:      	b.ne	0xc460 <_stogir.stack.entry-allocation?+0x2c8>
    c4a0:      	cmp	x12, x14
    c4a4:      	b.gt	0xc4c8 <_stogir.stack.entry-allocation?+0x330>
    c4a8:      	ldr	x12, [x0, #0x50]
    c4ac:      	add	x12, x12, x13, lsl #2
    c4b0:      	ldr	w12, [x12]
    c4b4:      	sxtw	x12, w12
    c4b8:      	cmp	x12, #0x0
    c4bc:      	cset	w12, gt
    c4c0:      	ubfx	x12, x12, #0, #8
    c4c4:      	b	0xc4cc <_stogir.stack.entry-allocation?+0x334>
    c4c8:      	movz	x12, #0x0, lsl #48
    c4cc:      	b	0xc464 <_stogir.stack.entry-allocation?+0x2cc>
    c4d0:      	movz	x12, #0x0, lsl #48
    c4d4:      	b	0xc48c <_stogir.stack.entry-allocation?+0x2f4>
    c4d8:      	mov	x16, sp
    c4dc:      	ldr	w1, [x16, #0x4]
    c4e0:      	sxtw	x1, w1
    c4e4:      	b	0xc224 <_stogir.stack.entry-allocation?+0x8c>
    c4e8:      	brk	#0
    c4ec:      	b	0xc4e8 <_stogir.stack.entry-allocation?+0x350>

000000000000c4f0 <_stogir.stack.constant-size-aligned>:
    c4f0:      	sub	sp, sp, #0x10
    c4f4:      	cmp	x2, #0x10
    c4f8:      	b.lt	0xc574 <_stogir.stack.constant-size-aligned+0x84>
    c4fc:      	cmp	x2, #0x0
    c500:      	b.le	0xc574 <_stogir.stack.constant-size-aligned+0x84>
    c504:      	sub	x3, x2, #0x1
    c508:      	and	x3, x3, x2
    c50c:      	cmp	x3, #0x0
    c510:      	b.ne	0xc574 <_stogir.stack.constant-size-aligned+0x84>
    c514:      	sxtw	x1, w1
    c518:      	cmp	x1, #0x0
    c51c:      	cset	w3, gt
    c520:      	movz	x16, #0x0, lsl #48
    c524:      	sub	x4, x16, x1
    c528:      	sub	x5, x4, #0x1
    c52c:      	uxtb	w16, w3
    c530:      	cmp	w16, wzr
    c534:      	b.eq	0xc604 <_stogir.stack.constant-size-aligned+0x114>
    c538:      	ldr	x4, [x0, #0x8]
    c53c:      	cmp	x1, x4
    c540:      	b.ge	0xc64c <_stogir.stack.constant-size-aligned+0x15c>
    c544:      	add	x4, x0, #0x78
    c548:      	ldr	x4, [x4, #0x8]
    c54c:      	cmp	x1, x4
    c550:      	b.ge	0xc71c <_stogir.stack.constant-size-aligned+0x22c>
    c554:      	ldr	x4, [x0, #0x78]
    c558:      	add	x4, x4, x1, lsl #2
    c55c:      	ldr	w4, [x4]
    c560:      	sxtw	x4, w4
    c564:      	cmp	x4, #0x0
    c568:      	cset	w4, ge
    c56c:      	ubfx	x4, x4, #0, #8
    c570:      	b	0xc720 <_stogir.stack.constant-size-aligned+0x230>
    c574:      	mov	x1, #0x1                ; =1
    c578:      	adrp	x0, 0xc000 <_stogir.switch.key+0x314>
		000000000000c578:  ARM64_RELOC_PAGE21	l_stogir.502
    c57c:      	ldr	x0, [x0]
		000000000000c57c:  ARM64_RELOC_PAGEOFF12	l_stogir.502
    c580:      	mov	x2, #0x20               ; =32
    c584:      	str	x1, [x8]
    c588:      	str	x0, [x8, #0x8]
    c58c:      	str	x2, [x8, #0x10]
    c590:      	add	sp, sp, #0x10
    c594:      	ret
    c598:      	mov	w3, #0x1                ; =1
    c59c:      	mov	x16, sp
    c5a0:      	ldr	w4, [x16, #0x8]
    c5a4:      	mov	x16, sp
    c5a8:      	ldr	w5, [x16, #0xc]
    c5ac:      	cmp	x1, #0x0
    c5b0:      	b.ge	0xc5f0 <_stogir.stack.constant-size-aligned+0x100>
    c5b4:      	cmp	x0, #0x1
    c5b8:      	b.lt	0xc5f0 <_stogir.stack.constant-size-aligned+0x100>
    c5bc:      	cmp	x0, #0xb
    c5c0:      	cset	w1, le
    c5c4:      	uxtb	w16, w1
    c5c8:      	cmp	w16, wzr
    c5cc:      	b.eq	0xc5f0 <_stogir.stack.constant-size-aligned+0x100>
    c5d0:      	mov	x16, sp
    c5d4:      	ldr	w6, [x16]
    c5d8:      	uxtb	w7, w6
    c5dc:      	ubfx	x6, x6, #8, #8
    c5e0:      	cmp	x7, x6
    c5e4:      	b.eq	0xc7ac <_stogir.stack.constant-size-aligned+0x2bc>
    c5e8:      	cmp	x7, #0x49
    c5ec:      	b.eq	0xc7ac <_stogir.stack.constant-size-aligned+0x2bc>
    c5f0:      	mov	x1, #0x1                ; =1
    c5f4:      	adrp	x0, 0xc000 <_stogir.switch.key+0x314>
		000000000000c5f4:  ARM64_RELOC_PAGE21	l_stogir.503
    c5f8:      	ldr	x0, [x0]
		000000000000c5f8:  ARM64_RELOC_PAGEOFF12	l_stogir.503
    c5fc:      	mov	x2, #0x30               ; =48
    c600:      	b	0xc584 <_stogir.stack.constant-size-aligned+0x94>
    c604:      	cmp	x1, #0x0
    c608:      	b.ge	0xc654 <_stogir.stack.constant-size-aligned+0x164>
    c60c:      	add	x6, x0, #0x28
    c610:      	add	x7, x0, #0x50
    c614:      	ldr	x6, [x6, #0x8]
    c618:      	ldr	x7, [x7, #0x8]
    c61c:      	cmp	x6, x7
    c620:      	b.ne	0xc714 <_stogir.stack.constant-size-aligned+0x224>
    c624:      	cmp	x4, x6
    c628:      	b.gt	0xc7a4 <_stogir.stack.constant-size-aligned+0x2b4>
    c62c:      	ldr	x4, [x0, #0x50]
    c630:      	add	x4, x4, x5, lsl #2
    c634:      	ldr	w4, [x4]
    c638:      	sxtw	x4, w4
    c63c:      	cmp	x4, #0x0
    c640:      	cset	w4, gt
    c644:      	ubfx	x4, x4, #0, #8
    c648:      	b	0xc7a8 <_stogir.stack.constant-size-aligned+0x2b8>
    c64c:      	movz	x4, #0x0, lsl #48
    c650:      	b	0xc658 <_stogir.stack.constant-size-aligned+0x168>
    c654:      	movz	x4, #0x0, lsl #48
    c658:      	cmp	x4, #0x0
    c65c:      	b.eq	0xc698 <_stogir.stack.constant-size-aligned+0x1a8>
    c660:      	uxtb	w16, w3
    c664:      	cmp	w16, wzr
    c668:      	b.eq	0xc680 <_stogir.stack.constant-size-aligned+0x190>
    c66c:      	ldr	x0, [x0]
    c670:      	add	x0, x0, x1, lsl #4
    c674:      	ldr	x3, [x0]
    c678:      	ldr	x0, [x0, #0x8]
    c67c:      	b	0xc690 <_stogir.stack.constant-size-aligned+0x1a0>
    c680:      	ldr	x0, [x0, #0x28]
    c684:      	add	x0, x0, x5, lsl #4
    c688:      	ldr	x3, [x0]
    c68c:      	ldr	x0, [x0, #0x8]
    c690:      	mov	w4, #0x1                ; =1
    c694:      	b	0xc6a4 <_stogir.stack.constant-size-aligned+0x1b4>
    c698:      	movz	w4, #0x0, lsl #16
    c69c:      	movz	x3, #0x0, lsl #48
    c6a0:      	movz	x0, #0x0, lsl #48
    c6a4:      	ubfx	x4, x4, #0, #32
    c6a8:      	lsr	x16, x4, #0
    c6ac:      	cmp	x16, #0x1
    c6b0:      	b.eq	0xc6cc <_stogir.stack.constant-size-aligned+0x1dc>
    c6b4:      	b.lo	0xc6bc <_stogir.stack.constant-size-aligned+0x1cc>
    c6b8:      	b	0xc6d0 <_stogir.stack.constant-size-aligned+0x1e0>
    c6bc:      	cmp	x16, #0x0
    c6c0:      	b.eq	0xc6c8 <_stogir.stack.constant-size-aligned+0x1d8>
    c6c4:      	b	0xc6d0 <_stogir.stack.constant-size-aligned+0x1e0>
    c6c8:      	b	0xc6d4 <_stogir.stack.constant-size-aligned+0x1e4>
    c6cc:      	b	0xc6e8 <_stogir.stack.constant-size-aligned+0x1f8>
    c6d0:      	b	0xc850 <_stogir.stack.constant-size-aligned+0x360>
    c6d4:      	mov	x1, #0x1                ; =1
    c6d8:      	adrp	x0, 0xc000 <_stogir.switch.key+0x314>
		000000000000c6d8:  ARM64_RELOC_PAGE21	l_stogir.504
    c6dc:      	ldr	x0, [x0]
		000000000000c6dc:  ARM64_RELOC_PAGEOFF12	l_stogir.504
    c6e0:      	mov	x2, #0x18               ; =24
    c6e4:      	b	0xc600 <_stogir.stack.constant-size-aligned+0x110>
    c6e8:      	orr	w4, w3, wzr
    c6ec:      	mov	x16, sp
    c6f0:      	str	x3, [x16]
    c6f4:      	ubfx	x4, x4, #0, #32
    c6f8:      	mov	x16, sp
    c6fc:      	str	x0, [x16, #0x8]
    c700:      	ubfx	x0, x4, #8, #8
    c704:      	cmp	x0, #0x0
    c708:      	b.ne	0xc724 <_stogir.stack.constant-size-aligned+0x234>
    c70c:      	movz	w3, #0x0, lsl #16
    c710:      	b	0xc59c <_stogir.stack.constant-size-aligned+0xac>
    c714:      	movz	x4, #0x0, lsl #48
    c718:      	b	0xc658 <_stogir.stack.constant-size-aligned+0x168>
    c71c:      	movz	x4, #0x0, lsl #48
    c720:      	b	0xc650 <_stogir.stack.constant-size-aligned+0x160>
    c724:      	cmp	x0, #0x1
    c728:      	b.eq	0xc598 <_stogir.stack.constant-size-aligned+0xa8>
    c72c:      	cmp	x0, #0x2
    c730:      	b.eq	0xc598 <_stogir.stack.constant-size-aligned+0xa8>
    c734:      	cmp	x0, #0x7
    c738:      	b.eq	0xc598 <_stogir.stack.constant-size-aligned+0xa8>
    c73c:      	cmp	x0, #0x8
    c740:      	b.eq	0xc598 <_stogir.stack.constant-size-aligned+0xa8>
    c744:      	cmp	x0, #0x3
    c748:      	b.eq	0xc848 <_stogir.stack.constant-size-aligned+0x358>
    c74c:      	cmp	x0, #0x9
    c750:      	b.eq	0xc848 <_stogir.stack.constant-size-aligned+0x358>
    c754:      	cmp	x0, #0x4
    c758:      	b.eq	0xc858 <_stogir.stack.constant-size-aligned+0x368>
    c75c:      	cmp	x0, #0xa
    c760:      	b.eq	0xc858 <_stogir.stack.constant-size-aligned+0x368>
    c764:      	cmp	x0, #0xd
    c768:      	b.eq	0xc858 <_stogir.stack.constant-size-aligned+0x368>
    c76c:      	cmp	x0, #0x5
    c770:      	b.eq	0xc860 <_stogir.stack.constant-size-aligned+0x370>
    c774:      	cmp	x0, #0xb
    c778:      	b.eq	0xc860 <_stogir.stack.constant-size-aligned+0x370>
    c77c:      	cmp	x0, #0xc
    c780:      	b.eq	0xc860 <_stogir.stack.constant-size-aligned+0x370>
    c784:      	cmp	x0, #0x6
    c788:      	cset	w3, eq
    c78c:      	uxtb	w16, w3
    c790:      	cmp	w16, wzr
    c794:      	mov	w16, #0x8               ; =8
    c798:      	movn	w17, #0x0, lsl #16
    c79c:      	csel	w3, w16, w17, ne
    c7a0:      	b	0xc864 <_stogir.stack.constant-size-aligned+0x374>
    c7a4:      	movz	x4, #0x0, lsl #48
    c7a8:      	b	0xc718 <_stogir.stack.constant-size-aligned+0x228>
    c7ac:      	sxtw	x6, w3
    c7b0:      	cmp	x6, #0x0
    c7b4:      	b.le	0xc5f0 <_stogir.stack.constant-size-aligned+0x100>
    c7b8:      	lsl	w3, w3, #3
    c7bc:      	ubfx	x4, x4, #0, #32
    c7c0:      	ubfx	x5, x5, #0, #32
    c7c4:      	lsl	x5, x5, #32
    c7c8:      	orr	x4, x5, x4
    c7cc:      	cmp	x6, #0x8
    c7d0:      	b.ge	0xc7e4 <_stogir.stack.constant-size-aligned+0x2f4>
    c7d4:      	sxtw	x5, w3
    c7d8:      	lsr	x5, x4, x5
    c7dc:      	cmp	x5, #0x0
    c7e0:      	b.ne	0xc5f0 <_stogir.stack.constant-size-aligned+0x100>
    c7e4:      	cmp	x0, #0x7
    c7e8:      	b.lt	0xc814 <_stogir.stack.constant-size-aligned+0x324>
    c7ec:      	uxtb	w16, w1
    c7f0:      	cmp	w16, wzr
    c7f4:      	b.eq	0xc814 <_stogir.stack.constant-size-aligned+0x324>
    c7f8:      	sub	w0, w3, #0x1
    c7fc:      	sxtw	x0, w0
    c800:      	mov	x16, #0x1               ; =1
    c804:      	lsl	x0, x16, x0
    c808:      	and	x0, x0, x4
    c80c:      	cmp	x0, #0x0
    c810:      	b.ne	0xc5f0 <_stogir.stack.constant-size-aligned+0x100>
    c814:      	sub	x0, x2, #0x1
    c818:      	mov	x16, #0x7fffffffffffffff ; =9223372036854775807
    c81c:      	sub	x0, x16, x0
    c820:      	cmp	x4, x0
    c824:      	b.hi	0xc5f0 <_stogir.stack.constant-size-aligned+0x100>
    c828:      	sub	x0, x2, #0x1
    c82c:      	movz	x16, #0x0, lsl #48
    c830:      	sub	x1, x16, x2
    c834:      	add	x0, x0, x4
    c838:      	and	x0, x1, x0
    c83c:      	movz	x1, #0x0, lsl #48
    c840:      	movz	x2, #0x0, lsl #48
    c844:      	b	0xc600 <_stogir.stack.constant-size-aligned+0x110>
    c848:      	mov	w3, #0x2                ; =2
    c84c:      	b	0xc59c <_stogir.stack.constant-size-aligned+0xac>
    c850:      	brk	#0
    c854:      	b	0xc850 <_stogir.stack.constant-size-aligned+0x360>
    c858:      	mov	w3, #0x4                ; =4
    c85c:      	b	0xc84c <_stogir.stack.constant-size-aligned+0x35c>
    c860:      	mov	w3, #0x8                ; =8
    c864:      	b	0xc85c <_stogir.stack.constant-size-aligned+0x36c>

000000000000c868 <_stogir.vector-lanes.compatible?>:
    c868:      	and	w3, w0, #0xf
    c86c:      	sxtw	x0, w0
    c870:      	ubfx	x4, x3, #0, #32
    c874:      	cmp	x0, #0xf
    c878:      	cset	w5, gt
    c87c:      	cmp	x0, #0x80
    c880:      	cset	w6, lt
    c884:      	cmp	x4, #0x1
    c888:      	cset	w7, ge
    c88c:      	cmp	x4, #0xd
    c890:      	cset	w4, le
    c894:      	cmp	x0, #0x0
    c898:      	b.lt	0xc8a4 <_stogir.vector-lanes.compatible?+0x3c>
    c89c:      	cmp	x0, #0xd
    c8a0:      	b.le	0xc8d8 <_stogir.vector-lanes.compatible?+0x70>
    c8a4:      	uxtb	w16, w5
    c8a8:      	cmp	w16, wzr
    c8ac:      	b.eq	0xc8d4 <_stogir.vector-lanes.compatible?+0x6c>
    c8b0:      	uxtb	w16, w6
    c8b4:      	cmp	w16, wzr
    c8b8:      	b.eq	0xc8d4 <_stogir.vector-lanes.compatible?+0x6c>
    c8bc:      	uxtb	w16, w7
    c8c0:      	cmp	w16, wzr
    c8c4:      	b.eq	0xc8d4 <_stogir.vector-lanes.compatible?+0x6c>
    c8c8:      	uxtb	w16, w4
    c8cc:      	cmp	w16, wzr
    c8d0:      	b.ne	0xc8d8 <_stogir.vector-lanes.compatible?+0x70>
    c8d4:      	movn	w3, #0x0, lsl #16
    c8d8:      	uxtb	w16, w5
    c8dc:      	cmp	w16, wzr
    c8e0:      	b.eq	0xc93c <_stogir.vector-lanes.compatible?+0xd4>
    c8e4:      	uxtb	w16, w6
    c8e8:      	cmp	w16, wzr
    c8ec:      	b.eq	0xc93c <_stogir.vector-lanes.compatible?+0xd4>
    c8f0:      	uxtb	w16, w7
    c8f4:      	cmp	w16, wzr
    c8f8:      	b.eq	0xc93c <_stogir.vector-lanes.compatible?+0xd4>
    c8fc:      	uxtb	w16, w4
    c900:      	cmp	w16, wzr
    c904:      	b.eq	0xc93c <_stogir.vector-lanes.compatible?+0xd4>
    c908:      	sxtw	x0, w2
    c90c:      	cmp	x0, #0x4
    c910:      	cset	w4, eq
    c914:      	cmp	x0, #0x8
    c918:      	cset	w0, eq
    c91c:      	uxtb	w16, w4
    c920:      	cmp	w16, wzr
    c924:      	b.ne	0xc94c <_stogir.vector-lanes.compatible?+0xe4>
    c928:      	uxtb	w16, w0
    c92c:      	cmp	w16, wzr
    c930:      	b.ne	0xc94c <_stogir.vector-lanes.compatible?+0xe4>
    c934:      	movz	x0, #0x0, lsl #48
    c938:      	b	0xc948 <_stogir.vector-lanes.compatible?+0xe0>
    c93c:      	movz	x0, #0x0, lsl #48
    c940:      	ret
    c944:      	movz	x0, #0x0, lsl #48
    c948:      	b	0xc940 <_stogir.vector-lanes.compatible?+0xd8>
    c94c:      	sxtw	x1, w1
    c950:      	cmp	x1, #0x0
    c954:      	b.lt	0xc944 <_stogir.vector-lanes.compatible?+0xdc>
    c958:      	cmp	x1, #0xd
    c95c:      	b.gt	0xc944 <_stogir.vector-lanes.compatible?+0xdc>
    c960:      	cmp	x1, #0x0
    c964:      	b.le	0xc97c <_stogir.vector-lanes.compatible?+0x114>
    c968:      	sxtw	x3, w3
    c96c:      	cmp	x3, x1
    c970:      	b.ne	0xc984 <_stogir.vector-lanes.compatible?+0x11c>
    c974:      	mov	x0, #0x1                ; =1
    c978:      	b	0xc980 <_stogir.vector-lanes.compatible?+0x118>
    c97c:      	movz	x0, #0x0, lsl #48
    c980:      	b	0xc948 <_stogir.vector-lanes.compatible?+0xe0>
    c984:      	cmp	x3, #0x1
    c988:      	b.lt	0xc9c4 <_stogir.vector-lanes.compatible?+0x15c>
    c98c:      	cmp	x3, #0xb
    c990:      	b.gt	0xc9c4 <_stogir.vector-lanes.compatible?+0x15c>
    c994:      	cmp	x1, #0x1
    c998:      	b.lt	0xc9cc <_stogir.vector-lanes.compatible?+0x164>
    c99c:      	cmp	x1, #0xb
    c9a0:      	b.gt	0xc9cc <_stogir.vector-lanes.compatible?+0x164>
    c9a4:      	uxtb	w16, w4
    c9a8:      	cmp	w16, wzr
    c9ac:      	b.ne	0xc9f0 <_stogir.vector-lanes.compatible?+0x188>
    c9b0:      	uxtb	w16, w0
    c9b4:      	cmp	w16, wzr
    c9b8:      	b.ne	0xc9f0 <_stogir.vector-lanes.compatible?+0x188>
    c9bc:      	movn	w3, #0x0, lsl #16
    c9c0:      	b	0xca04 <_stogir.vector-lanes.compatible?+0x19c>
    c9c4:      	movz	x0, #0x0, lsl #48
    c9c8:      	b	0xc978 <_stogir.vector-lanes.compatible?+0x110>
    c9cc:      	movz	x0, #0x0, lsl #48
    c9d0:      	b	0xc9c8 <_stogir.vector-lanes.compatible?+0x160>
    c9d4:      	mov	w2, #0x1                ; =1
    c9d8:      	sxtw	x3, w3
    c9dc:      	sxtw	x2, w2
    c9e0:      	cmp	x3, x2
    c9e4:      	cset	w0, eq
    c9e8:      	ubfx	x0, x0, #0, #8
    c9ec:      	b	0xc9d0 <_stogir.vector-lanes.compatible?+0x168>
    c9f0:      	cmp	x3, #0x0
    c9f4:      	b.ne	0xcaa4 <_stogir.vector-lanes.compatible?+0x23c>
    c9f8:      	movz	w3, #0x0, lsl #16
    c9fc:      	b	0xca04 <_stogir.vector-lanes.compatible?+0x19c>
    ca00:      	mov	w3, #0x1                ; =1
    ca04:      	uxtb	w16, w4
    ca08:      	cmp	w16, wzr
    ca0c:      	b.ne	0xca24 <_stogir.vector-lanes.compatible?+0x1bc>
    ca10:      	uxtb	w16, w0
    ca14:      	cmp	w16, wzr
    ca18:      	b.ne	0xca24 <_stogir.vector-lanes.compatible?+0x1bc>
    ca1c:      	movn	w2, #0x0, lsl #16
    ca20:      	b	0xc9d8 <_stogir.vector-lanes.compatible?+0x170>
    ca24:      	cmp	x1, #0x0
    ca28:      	b.ne	0xca34 <_stogir.vector-lanes.compatible?+0x1cc>
    ca2c:      	movz	w2, #0x0, lsl #16
    ca30:      	b	0xc9d8 <_stogir.vector-lanes.compatible?+0x170>
    ca34:      	cmp	x1, #0x1
    ca38:      	b.eq	0xc9d4 <_stogir.vector-lanes.compatible?+0x16c>
    ca3c:      	cmp	x1, #0x2
    ca40:      	b.eq	0xc9d4 <_stogir.vector-lanes.compatible?+0x16c>
    ca44:      	cmp	x1, #0x7
    ca48:      	b.eq	0xc9d4 <_stogir.vector-lanes.compatible?+0x16c>
    ca4c:      	cmp	x1, #0x8
    ca50:      	b.eq	0xc9d4 <_stogir.vector-lanes.compatible?+0x16c>
    ca54:      	cmp	x1, #0x3
    ca58:      	b.eq	0xcb14 <_stogir.vector-lanes.compatible?+0x2ac>
    ca5c:      	cmp	x1, #0x9
    ca60:      	b.eq	0xcb14 <_stogir.vector-lanes.compatible?+0x2ac>
    ca64:      	cmp	x1, #0x4
    ca68:      	b.eq	0xcb24 <_stogir.vector-lanes.compatible?+0x2bc>
    ca6c:      	cmp	x1, #0xa
    ca70:      	b.eq	0xcb24 <_stogir.vector-lanes.compatible?+0x2bc>
    ca74:      	cmp	x1, #0xd
    ca78:      	b.eq	0xcb24 <_stogir.vector-lanes.compatible?+0x2bc>
    ca7c:      	cmp	x1, #0x5
    ca80:      	b.eq	0xcb34 <_stogir.vector-lanes.compatible?+0x2cc>
    ca84:      	cmp	x1, #0xb
    ca88:      	b.eq	0xcb34 <_stogir.vector-lanes.compatible?+0x2cc>
    ca8c:      	cmp	x1, #0xc
    ca90:      	b.eq	0xcb34 <_stogir.vector-lanes.compatible?+0x2cc>
    ca94:      	cmp	x1, #0x6
    ca98:      	b.eq	0xcaa0 <_stogir.vector-lanes.compatible?+0x238>
    ca9c:      	movn	w2, #0x0, lsl #16
    caa0:      	b	0xcb38 <_stogir.vector-lanes.compatible?+0x2d0>
    caa4:      	cmp	x3, #0x1
    caa8:      	b.eq	0xca00 <_stogir.vector-lanes.compatible?+0x198>
    caac:      	cmp	x3, #0x2
    cab0:      	b.eq	0xca00 <_stogir.vector-lanes.compatible?+0x198>
    cab4:      	cmp	x3, #0x7
    cab8:      	b.eq	0xca00 <_stogir.vector-lanes.compatible?+0x198>
    cabc:      	cmp	x3, #0x8
    cac0:      	b.eq	0xca00 <_stogir.vector-lanes.compatible?+0x198>
    cac4:      	cmp	x3, #0x3
    cac8:      	b.eq	0xcb1c <_stogir.vector-lanes.compatible?+0x2b4>
    cacc:      	cmp	x3, #0x9
    cad0:      	b.eq	0xcb1c <_stogir.vector-lanes.compatible?+0x2b4>
    cad4:      	cmp	x3, #0x4
    cad8:      	b.eq	0xcb2c <_stogir.vector-lanes.compatible?+0x2c4>
    cadc:      	cmp	x3, #0xa
    cae0:      	b.eq	0xcb2c <_stogir.vector-lanes.compatible?+0x2c4>
    cae4:      	cmp	x3, #0xd
    cae8:      	b.eq	0xcb2c <_stogir.vector-lanes.compatible?+0x2c4>
    caec:      	cmp	x3, #0x5
    caf0:      	b.eq	0xcb3c <_stogir.vector-lanes.compatible?+0x2d4>
    caf4:      	cmp	x3, #0xb
    caf8:      	b.eq	0xcb3c <_stogir.vector-lanes.compatible?+0x2d4>
    cafc:      	cmp	x3, #0xc
    cb00:      	b.eq	0xcb3c <_stogir.vector-lanes.compatible?+0x2d4>
    cb04:      	cmp	x3, #0x6
    cb08:      	b.ne	0xcb44 <_stogir.vector-lanes.compatible?+0x2dc>
    cb0c:      	mov	w3, w2
    cb10:      	b	0xcb48 <_stogir.vector-lanes.compatible?+0x2e0>
    cb14:      	mov	w2, #0x2                ; =2
    cb18:      	b	0xc9d8 <_stogir.vector-lanes.compatible?+0x170>
    cb1c:      	mov	w3, #0x2                ; =2
    cb20:      	b	0xca04 <_stogir.vector-lanes.compatible?+0x19c>
    cb24:      	mov	w2, #0x4                ; =4
    cb28:      	b	0xcb18 <_stogir.vector-lanes.compatible?+0x2b0>
    cb2c:      	mov	w3, #0x4                ; =4
    cb30:      	b	0xcb20 <_stogir.vector-lanes.compatible?+0x2b8>
    cb34:      	mov	w2, #0x8                ; =8
    cb38:      	b	0xcb28 <_stogir.vector-lanes.compatible?+0x2c0>
    cb3c:      	mov	w3, #0x8                ; =8
    cb40:      	b	0xcb30 <_stogir.vector-lanes.compatible?+0x2c8>
    cb44:      	movn	w3, #0x0, lsl #16
    cb48:      	b	0xcb40 <_stogir.vector-lanes.compatible?+0x2d8>

000000000000cb4c <_stogir.vector-comparison.valid-type?>:
    cb4c:      	sxtw	x0, w0
    cb50:      	cmp	x0, #0xe
    cb54:      	b.lt	0xcbec <_stogir.vector-comparison.valid-type?+0xa0>
    cb58:      	cmp	x0, #0x19
    cb5c:      	b.gt	0xcbec <_stogir.vector-comparison.valid-type?+0xa0>
    cb60:      	sxtw	x2, w1
    cb64:      	cmp	x2, #0xf
    cb68:      	cset	w3, gt
    cb6c:      	uxtb	w16, w3
    cb70:      	cmp	w16, wzr
    cb74:      	b.eq	0xcbf4 <_stogir.vector-comparison.valid-type?+0xa8>
    cb78:      	cmp	x2, #0x80
    cb7c:      	cset	w4, lt
    cb80:      	uxtb	w16, w4
    cb84:      	cmp	w16, wzr
    cb88:      	b.eq	0xcbf4 <_stogir.vector-comparison.valid-type?+0xa8>
    cb8c:      	and	w1, w1, #0xf
    cb90:      	ubfx	x5, x1, #0, #32
    cb94:      	cmp	x5, #0x1
    cb98:      	cset	w6, ge
    cb9c:      	uxtb	w16, w6
    cba0:      	cmp	w16, wzr
    cba4:      	b.eq	0xcbf4 <_stogir.vector-comparison.valid-type?+0xa8>
    cba8:      	cmp	x5, #0xd
    cbac:      	cset	w5, le
    cbb0:      	uxtb	w16, w5
    cbb4:      	cmp	w16, wzr
    cbb8:      	b.eq	0xcbf4 <_stogir.vector-comparison.valid-type?+0xa8>
    cbbc:      	cmp	x2, #0x0
    cbc0:      	cset	w7, ge
    cbc4:      	cmp	x2, #0xd
    cbc8:      	cset	w2, le
    cbcc:      	uxtb	w16, w7
    cbd0:      	cmp	w16, wzr
    cbd4:      	b.eq	0xcc04 <_stogir.vector-comparison.valid-type?+0xb8>
    cbd8:      	uxtb	w16, w2
    cbdc:      	cmp	w16, wzr
    cbe0:      	b.eq	0xcc04 <_stogir.vector-comparison.valid-type?+0xb8>
    cbe4:      	mov	w8, w1
    cbe8:      	b	0xcc38 <_stogir.vector-comparison.valid-type?+0xec>
    cbec:      	movz	x0, #0x0, lsl #48
    cbf0:      	ret
    cbf4:      	movz	x0, #0x0, lsl #48
    cbf8:      	b	0xcbf0 <_stogir.vector-comparison.valid-type?+0xa4>
    cbfc:      	mov	x0, #0x1                ; =1
    cc00:      	b	0xcbf8 <_stogir.vector-comparison.valid-type?+0xac>
    cc04:      	uxtb	w16, w3
    cc08:      	cmp	w16, wzr
    cc0c:      	b.eq	0xcc34 <_stogir.vector-comparison.valid-type?+0xe8>
    cc10:      	uxtb	w16, w4
    cc14:      	cmp	w16, wzr
    cc18:      	b.eq	0xcc34 <_stogir.vector-comparison.valid-type?+0xe8>
    cc1c:      	uxtb	w16, w6
    cc20:      	cmp	w16, wzr
    cc24:      	b.eq	0xcc34 <_stogir.vector-comparison.valid-type?+0xe8>
    cc28:      	uxtb	w16, w5
    cc2c:      	cmp	w16, wzr
    cc30:      	b.ne	0xcbe4 <_stogir.vector-comparison.valid-type?+0x98>
    cc34:      	movn	w8, #0x0, lsl #16
    cc38:      	sxtw	x8, w8
    cc3c:      	cmp	x8, #0xc
    cc40:      	b.eq	0xcbfc <_stogir.vector-comparison.valid-type?+0xb0>
    cc44:      	cmp	x8, #0xd
    cc48:      	b.eq	0xcbfc <_stogir.vector-comparison.valid-type?+0xb0>
    cc4c:      	uxtb	w16, w7
    cc50:      	cmp	w16, wzr
    cc54:      	b.eq	0xcc64 <_stogir.vector-comparison.valid-type?+0x118>
    cc58:      	uxtb	w16, w2
    cc5c:      	cmp	w16, wzr
    cc60:      	b.ne	0xcc98 <_stogir.vector-comparison.valid-type?+0x14c>
    cc64:      	uxtb	w16, w3
    cc68:      	cmp	w16, wzr
    cc6c:      	b.eq	0xcc94 <_stogir.vector-comparison.valid-type?+0x148>
    cc70:      	uxtb	w16, w4
    cc74:      	cmp	w16, wzr
    cc78:      	b.eq	0xcc94 <_stogir.vector-comparison.valid-type?+0x148>
    cc7c:      	uxtb	w16, w6
    cc80:      	cmp	w16, wzr
    cc84:      	b.eq	0xcc94 <_stogir.vector-comparison.valid-type?+0x148>
    cc88:      	uxtb	w16, w5
    cc8c:      	cmp	w16, wzr
    cc90:      	b.ne	0xcc98 <_stogir.vector-comparison.valid-type?+0x14c>
    cc94:      	movn	w1, #0x0, lsl #16
    cc98:      	sxtw	x1, w1
    cc9c:      	cmp	x1, #0x1
    cca0:      	b.lt	0xccbc <_stogir.vector-comparison.valid-type?+0x170>
    cca4:      	cmp	x1, #0xb
    cca8:      	b.gt	0xccbc <_stogir.vector-comparison.valid-type?+0x170>
    ccac:      	cmp	x0, #0x17
    ccb0:      	cset	w0, le
    ccb4:      	ubfx	x0, x0, #0, #8
    ccb8:      	b	0xccc0 <_stogir.vector-comparison.valid-type?+0x174>
    ccbc:      	movz	x0, #0x0, lsl #48
    ccc0:      	b	0xcc00 <_stogir.vector-comparison.valid-type?+0xb4>

000000000000ccc4 <_stogir.vector-arithmetic.valid-type?>:
    ccc4:      	sub	sp, sp, #0x30
    ccc8:      	str	x29, [sp]
    cccc:      	str	x30, [sp, #0x8]
    ccd0:      	mov	x29, sp
    ccd4:      	str	x19, [sp, #0x10]
    ccd8:      	str	x20, [sp, #0x18]
    ccdc:      	str	x21, [sp, #0x20]
    cce0:      	str	x22, [sp, #0x28]
    cce4:      	sxtw	x2, w1
    cce8:      	and	w1, w1, #0xf
    ccec:      	cmp	x2, #0xf
    ccf0:      	cset	w3, gt
    ccf4:      	cmp	x2, #0x80
    ccf8:      	cset	w4, lt
    ccfc:      	ubfx	x5, x1, #0, #32
    cd00:      	cmp	x5, #0x1
    cd04:      	cset	w6, ge
    cd08:      	cmp	x5, #0xd
    cd0c:      	cset	w5, le
    cd10:      	cmp	x2, #0x0
    cd14:      	b.lt	0xcd20 <_stogir.vector-arithmetic.valid-type?+0x5c>
    cd18:      	cmp	x2, #0xd
    cd1c:      	b.le	0xcd54 <_stogir.vector-arithmetic.valid-type?+0x90>
    cd20:      	uxtb	w16, w3
    cd24:      	cmp	w16, wzr
    cd28:      	b.eq	0xcd50 <_stogir.vector-arithmetic.valid-type?+0x8c>
    cd2c:      	uxtb	w16, w4
    cd30:      	cmp	w16, wzr
    cd34:      	b.eq	0xcd50 <_stogir.vector-arithmetic.valid-type?+0x8c>
    cd38:      	uxtb	w16, w6
    cd3c:      	cmp	w16, wzr
    cd40:      	b.eq	0xcd50 <_stogir.vector-arithmetic.valid-type?+0x8c>
    cd44:      	uxtb	w16, w5
    cd48:      	cmp	w16, wzr
    cd4c:      	b.ne	0xcd54 <_stogir.vector-arithmetic.valid-type?+0x90>
    cd50:      	movn	w1, #0x0, lsl #16
    cd54:      	uxtb	w16, w3
    cd58:      	cmp	w16, wzr
    cd5c:      	b.eq	0xcf44 <_stogir.vector-arithmetic.valid-type?+0x280>
    cd60:      	uxtb	w16, w4
    cd64:      	cmp	w16, wzr
    cd68:      	b.eq	0xcf44 <_stogir.vector-arithmetic.valid-type?+0x280>
    cd6c:      	uxtb	w16, w6
    cd70:      	cmp	w16, wzr
    cd74:      	b.eq	0xcf44 <_stogir.vector-arithmetic.valid-type?+0x280>
    cd78:      	uxtb	w16, w5
    cd7c:      	cmp	w16, wzr
    cd80:      	b.eq	0xcf44 <_stogir.vector-arithmetic.valid-type?+0x280>
    cd84:      	sxtw	x2, w0
    cd88:      	cmp	x2, #0x1f
    cd8c:      	cset	w19, eq
    cd90:      	cmp	x2, #0x20
    cd94:      	cset	w20, eq
    cd98:      	cmp	x2, #0x2e
    cd9c:      	cset	w3, eq
    cda0:      	cmp	x2, #0x2f
    cda4:      	cset	w4, eq
    cda8:      	cmp	x2, #0x30
    cdac:      	cset	w5, eq
    cdb0:      	cmp	x2, #0x1e
    cdb4:      	cset	w6, eq
    cdb8:      	cmp	x2, #0x31
    cdbc:      	cset	w7, ge
    cdc0:      	cmp	x2, #0x35
    cdc4:      	cset	w8, le
    cdc8:      	cmp	x2, #0x3a
    cdcc:      	cset	w9, eq
    cdd0:      	cmp	x2, #0x3b
    cdd4:      	cset	w10, eq
    cdd8:      	cmp	x2, #0x2d
    cddc:      	cset	w11, eq
    cde0:      	cmp	x2, #0x36
    cde4:      	cset	w12, eq
    cde8:      	cmp	x2, #0x37
    cdec:      	cset	w13, eq
    cdf0:      	cmp	x2, #0x38
    cdf4:      	cset	w14, eq
    cdf8:      	cmp	x2, #0x39
    cdfc:      	cset	w15, eq
    ce00:      	uxtb	w16, w19
    ce04:      	cmp	w16, wzr
    ce08:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    ce0c:      	uxtb	w16, w20
    ce10:      	cmp	w16, wzr
    ce14:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    ce18:      	uxtb	w16, w11
    ce1c:      	cmp	w16, wzr
    ce20:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    ce24:      	uxtb	w16, w12
    ce28:      	cmp	w16, wzr
    ce2c:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    ce30:      	uxtb	w16, w13
    ce34:      	cmp	w16, wzr
    ce38:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    ce3c:      	uxtb	w16, w14
    ce40:      	cmp	w16, wzr
    ce44:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    ce48:      	uxtb	w16, w15
    ce4c:      	cmp	w16, wzr
    ce50:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    ce54:      	uxtb	w16, w9
    ce58:      	cmp	w16, wzr
    ce5c:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    ce60:      	uxtb	w16, w10
    ce64:      	cmp	w16, wzr
    ce68:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    ce6c:      	uxtb	w16, w7
    ce70:      	cmp	w16, wzr
    ce74:      	b.eq	0xd050 <_stogir.vector-arithmetic.valid-type?+0x38c>
    ce78:      	uxtb	w16, w8
    ce7c:      	cmp	w16, wzr
    ce80:      	b.eq	0xd050 <_stogir.vector-arithmetic.valid-type?+0x38c>
    ce84:      	sxtw	x2, w1
    ce88:      	cmp	x2, #0xc
    ce8c:      	cset	w21, eq
    ce90:      	cmp	x2, #0xd
    ce94:      	cset	w22, eq
    ce98:      	uxtb	w16, w19
    ce9c:      	cmp	w16, wzr
    cea0:      	b.ne	0xcf70 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    cea4:      	uxtb	w16, w20
    cea8:      	cmp	w16, wzr
    ceac:      	b.ne	0xcf70 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    ceb0:      	uxtb	w16, w11
    ceb4:      	cmp	w16, wzr
    ceb8:      	b.ne	0xcf70 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    cebc:      	uxtb	w16, w12
    cec0:      	cmp	w16, wzr
    cec4:      	b.ne	0xcf70 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    cec8:      	uxtb	w16, w13
    cecc:      	cmp	w16, wzr
    ced0:      	b.ne	0xcf70 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    ced4:      	uxtb	w16, w14
    ced8:      	cmp	w16, wzr
    cedc:      	b.ne	0xcf70 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    cee0:      	uxtb	w16, w15
    cee4:      	cmp	w16, wzr
    cee8:      	b.ne	0xcf70 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    ceec:      	cmp	x2, #0x1
    cef0:      	cset	w0, eq
    cef4:      	cmp	x2, #0x1
    cef8:      	cset	w1, ge
    cefc:      	cmp	x2, #0xb
    cf00:      	cset	w2, le
    cf04:      	uxtb	w16, w7
    cf08:      	cmp	w16, wzr
    cf0c:      	b.eq	0xcfc0 <_stogir.vector-arithmetic.valid-type?+0x2fc>
    cf10:      	uxtb	w16, w8
    cf14:      	cmp	w16, wzr
    cf18:      	b.eq	0xcfc0 <_stogir.vector-arithmetic.valid-type?+0x2fc>
    cf1c:      	uxtb	w16, w1
    cf20:      	cmp	w16, wzr
    cf24:      	b.eq	0xd048 <_stogir.vector-arithmetic.valid-type?+0x384>
    cf28:      	uxtb	w16, w2
    cf2c:      	cmp	w16, wzr
    cf30:      	b.eq	0xd048 <_stogir.vector-arithmetic.valid-type?+0x384>
    cf34:      	uxtb	w16, w0
    cf38:      	cmp	w16, wzr
    cf3c:      	cset	x0, eq
    cf40:      	b	0xd04c <_stogir.vector-arithmetic.valid-type?+0x388>
    cf44:      	movz	x0, #0x0, lsl #48
    cf48:      	ldr	x19, [sp, #0x10]
    cf4c:      	ldr	x20, [sp, #0x18]
    cf50:      	ldr	x21, [sp, #0x20]
    cf54:      	ldr	x22, [sp, #0x28]
    cf58:      	ldr	x29, [sp]
    cf5c:      	ldr	x30, [sp, #0x8]
    cf60:      	add	sp, sp, #0x30
    cf64:      	ret
    cf68:      	ubfx	x0, x20, #0, #8
    cf6c:      	b	0xcf48 <_stogir.vector-arithmetic.valid-type?+0x284>
    cf70:      	bl	0xcf70 <_stogir.vector-arithmetic.valid-type?+0x2ac>
		000000000000cf70:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    cf74:      	cmp	x0, #0x0
    cf78:      	b.eq	0xcf84 <_stogir.vector-arithmetic.valid-type?+0x2c0>
    cf7c:      	mov	x0, #0x1                ; =1
    cf80:      	b	0xcf6c <_stogir.vector-arithmetic.valid-type?+0x2a8>
    cf84:      	uxtb	w16, w21
    cf88:      	cmp	w16, wzr
    cf8c:      	b.ne	0xcfa4 <_stogir.vector-arithmetic.valid-type?+0x2e0>
    cf90:      	uxtb	w16, w22
    cf94:      	cmp	w16, wzr
    cf98:      	b.ne	0xcfa4 <_stogir.vector-arithmetic.valid-type?+0x2e0>
    cf9c:      	movz	x0, #0x0, lsl #48
    cfa0:      	b	0xcf6c <_stogir.vector-arithmetic.valid-type?+0x2a8>
    cfa4:      	uxtb	w16, w19
    cfa8:      	cmp	w16, wzr
    cfac:      	b.eq	0xcf68 <_stogir.vector-arithmetic.valid-type?+0x2a4>
    cfb0:      	mov	x0, #0x1                ; =1
    cfb4:      	b	0xcf6c <_stogir.vector-arithmetic.valid-type?+0x2a8>
    cfb8:      	movz	x0, #0x0, lsl #48
    cfbc:      	b	0xcf6c <_stogir.vector-arithmetic.valid-type?+0x2a8>
    cfc0:      	uxtb	w16, w3
    cfc4:      	cmp	w16, wzr
    cfc8:      	b.ne	0xd034 <_stogir.vector-arithmetic.valid-type?+0x370>
    cfcc:      	uxtb	w16, w4
    cfd0:      	cmp	w16, wzr
    cfd4:      	b.ne	0xd034 <_stogir.vector-arithmetic.valid-type?+0x370>
    cfd8:      	uxtb	w16, w5
    cfdc:      	cmp	w16, wzr
    cfe0:      	b.ne	0xd034 <_stogir.vector-arithmetic.valid-type?+0x370>
    cfe4:      	uxtb	w16, w21
    cfe8:      	cmp	w16, wzr
    cfec:      	b.ne	0xd0a8 <_stogir.vector-arithmetic.valid-type?+0x3e4>
    cff0:      	uxtb	w16, w22
    cff4:      	cmp	w16, wzr
    cff8:      	b.ne	0xd0a8 <_stogir.vector-arithmetic.valid-type?+0x3e4>
    cffc:      	uxtb	w16, w1
    d000:      	cmp	w16, wzr
    d004:      	b.eq	0xd0b8 <_stogir.vector-arithmetic.valid-type?+0x3f4>
    d008:      	uxtb	w16, w2
    d00c:      	cmp	w16, wzr
    d010:      	b.eq	0xd0b8 <_stogir.vector-arithmetic.valid-type?+0x3f4>
    d014:      	uxtb	w16, w0
    d018:      	cmp	w16, wzr
    d01c:      	b.eq	0xd0c0 <_stogir.vector-arithmetic.valid-type?+0x3fc>
    d020:      	uxtb	w16, w9
    d024:      	cmp	w16, wzr
    d028:      	b.eq	0xd0c8 <_stogir.vector-arithmetic.valid-type?+0x404>
    d02c:      	mov	x0, #0x1                ; =1
    d030:      	b	0xd0cc <_stogir.vector-arithmetic.valid-type?+0x408>
    d034:      	uxtb	w16, w1
    d038:      	cmp	w16, wzr
    d03c:      	b.eq	0xcfb8 <_stogir.vector-arithmetic.valid-type?+0x2f4>
    d040:      	ubfx	x0, x2, #0, #8
    d044:      	b	0xcfbc <_stogir.vector-arithmetic.valid-type?+0x2f8>
    d048:      	movz	x0, #0x0, lsl #48
    d04c:      	b	0xcfbc <_stogir.vector-arithmetic.valid-type?+0x2f8>
    d050:      	cmp	x2, #0x1a
    d054:      	b.eq	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d058:      	cmp	x2, #0x1b
    d05c:      	b.eq	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d060:      	cmp	x2, #0x1c
    d064:      	b.eq	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d068:      	cmp	x2, #0x1d
    d06c:      	b.eq	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d070:      	uxtb	w16, w6
    d074:      	cmp	w16, wzr
    d078:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d07c:      	uxtb	w16, w3
    d080:      	cmp	w16, wzr
    d084:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d088:      	uxtb	w16, w4
    d08c:      	cmp	w16, wzr
    d090:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d094:      	uxtb	w16, w5
    d098:      	cmp	w16, wzr
    d09c:      	b.ne	0xce84 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d0a0:      	movz	x0, #0x0, lsl #48
    d0a4:      	b	0xcf6c <_stogir.vector-arithmetic.valid-type?+0x2a8>
    d0a8:      	uxtb	w16, w6
    d0ac:      	cmp	w16, wzr
    d0b0:      	cset	x0, eq
    d0b4:      	b	0xcfbc <_stogir.vector-arithmetic.valid-type?+0x2f8>
    d0b8:      	movz	x0, #0x0, lsl #48
    d0bc:      	b	0xd0b4 <_stogir.vector-arithmetic.valid-type?+0x3f0>
    d0c0:      	mov	x0, #0x1                ; =1
    d0c4:      	b	0xd0bc <_stogir.vector-arithmetic.valid-type?+0x3f8>
    d0c8:      	ubfx	x0, x10, #0, #8
    d0cc:      	b	0xd0c4 <_stogir.vector-arithmetic.valid-type?+0x400>
