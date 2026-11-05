
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-call-result-projections/build/projections-verifier/candidate.o:	file format mach-o arm64

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

0000000000000b84 <_stogir.verify.integer-operations-target-structured>:
     b84:      	sub	sp, sp, #0x350
     b88:      	str	x29, [sp, #0x10]
     b8c:      	str	x30, [sp, #0x18]
     b90:      	add	x29, sp, #0x10
     b94:      	str	x19, [sp, #0x2f8]
     b98:      	str	x20, [sp, #0x300]
     b9c:      	str	x21, [sp, #0x308]
     ba0:      	str	x22, [sp, #0x310]
     ba4:      	str	x23, [sp, #0x318]
     ba8:      	str	x24, [sp, #0x320]
     bac:      	str	x25, [sp, #0x328]
     bb0:      	str	x26, [sp, #0x330]
     bb4:      	str	x27, [sp, #0x338]
     bb8:      	str	x28, [sp, #0x340]
     bbc:      	add	x19, x0, #0x78
     bc0:      	add	x20, x0, #0x28
     bc4:      	add	x21, x0, #0x50
     bc8:      	orr	w22, w1, wzr
     bcc:      	orr	w23, w1, wzr
     bd0:      	orr	w24, w1, wzr
     bd4:      	add	x16, sp, #0x20
     bd8:      	orr	x25, x16, xzr
     bdc:      	add	x16, sp, #0x30
     be0:      	orr	x1, x16, xzr
     be4:      	add	x26, x1, #0x8
     be8:      	add	x16, sp, #0x50
     bec:      	orr	x1, x16, xzr
     bf0:      	add	x27, x1, #0x8
     bf4:      	add	x16, sp, #0xe0
     bf8:      	orr	x1, x16, xzr
     bfc:      	add	x28, x1, #0x8
     c00:      	add	x16, sp, #0x100
     c04:      	orr	x1, x16, xzr
     c08:      	add	x1, x1, #0x8
     c0c:      	add	x16, sp, #0x120
     c10:      	orr	x2, x16, xzr
     c14:      	add	x2, x2, #0x8
     c18:      	add	x16, sp, #0x140
     c1c:      	orr	x3, x16, xzr
     c20:      	add	x3, x3, #0x8
     c24:      	add	x16, sp, #0x160
     c28:      	orr	x4, x16, xzr
     c2c:      	add	x4, x4, #0x8
     c30:      	add	x16, sp, #0x180
     c34:      	orr	x5, x16, xzr
     c38:      	add	x5, x5, #0x8
     c3c:      	add	x16, sp, #0x1a0
     c40:      	orr	x6, x16, xzr
     c44:      	add	x6, x6, #0x8
     c48:      	add	x16, sp, #0x1f0
     c4c:      	orr	x7, x16, xzr
     c50:      	add	x7, x7, #0x8
     c54:      	mov	x9, #0x1                ; =1
     c58:      	movz	x10, #0x0, lsl #48
     c5c:      	adrp	x11, 0x0 <_gap_verify_graph>
		0000000000000c5c:  ARM64_RELOC_PAGE21	l_stogir.331
     c60:      	ldr	x11, [x11]
		0000000000000c60:  ARM64_RELOC_PAGEOFF12	l_stogir.331
     c64:      	movz	x12, #0x0, lsl #48
     c68:      	cmp	x12, #0x0
     c6c:      	b.ne	0x1bf8 <_stogir.verify.integer-operations-target-structured+0x1074>
     c70:      	ldr	x13, [x0, #0x8]
     c74:      	cmp	x9, x13
     c78:      	b.ge	0x1c0c <_stogir.verify.integer-operations-target-structured+0x1088>
     c7c:      	ldr	x13, [x0]
     c80:      	add	x13, x13, x9, lsl #4
     c84:      	ldr	x14, [x13]
     c88:      	uxtb	w15, w14
     c8c:      	ldr	x13, [x13, #0x8]
     c90:      	str	w22, [sp, #0x230]
     c94:      	orr	x22, x15, xzr
     c98:      	add	x16, sp, #0x20
     c9c:      	str	x14, [x16]
     ca0:      	add	x16, sp, #0x20
     ca4:      	str	x13, [x16, #0x8]
     ca8:      	ldr	x13, [x0, #0x78]
     cac:      	add	x13, x13, x9, lsl #2
     cb0:      	ldr	w13, [x13]
     cb4:      	cmp	x22, #0x83
     cb8:      	b.ge	0x147c <_stogir.verify.integer-operations-target-structured+0x8f8>
     cbc:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000cbc:  ARM64_RELOC_PAGE21	l_stogir.332
     cc0:      	ldr	x16, [x16]
		0000000000000cc0:  ARM64_RELOC_PAGEOFF12	l_stogir.332
     cc4:      	add	x14, x16, x22, lsl #1
     cc8:      	ldrh	w14, [x14]
     ccc:      	cmp	x22, #0xe
     cd0:      	b.lt	0x1c20 <_stogir.verify.integer-operations-target-structured+0x109c>
     cd4:      	str	x0, [sp, #0x238]
     cd8:      	cmp	x22, #0x17
     cdc:      	cset	w0, le
     ce0:      	ubfx	x0, x0, #0, #8
     ce4:      	str	x0, [sp, #0x240]
     ce8:      	orr	w0, w9, wzr
     cec:      	str	x1, [sp, #0x248]
     cf0:      	and	w1, w14, #0x4
     cf4:      	ubfx	x1, x1, #0, #32
     cf8:      	str	x8, [sp, #0x268]
     cfc:      	str	x2, [sp, #0x2d0]
     d00:      	mov	x2, x25
     d04:      	str	x3, [sp, #0x2c0]
     d08:      	mov	w3, w13
     d0c:      	str	x4, [sp, #0x2a8]
     d10:      	str	x5, [sp, #0x2a0]
     d14:      	str	x6, [sp, #0x298]
     d18:      	str	x7, [sp, #0x288]
     d1c:      	str	x9, [sp, #0x290]
     d20:      	str	w15, [sp, #0x2b0]
     d24:      	str	w13, [sp, #0x2b8]
     d28:      	str	w0, [sp, #0x2c8]
     d2c:      	str	w23, [sp, #0x250]
     d30:      	mov	x23, x1
     d34:      	mov	w1, w0
     d38:      	ldr	x0, [sp, #0x238]
     d3c:      	str	w24, [sp, #0x258]
     d40:      	mov	x24, x10
     d44:      	str	x25, [sp, #0x260]
     d48:      	ldr	x25, [sp, #0x248]
     d4c:      	str	x21, [sp, #0x270]
     d50:      	mov	w21, w14
     d54:      	str	x20, [sp, #0x278]
     d58:      	mov	x20, x12
     d5c:      	str	x19, [sp, #0x280]
     d60:      	mov	x19, x11
     d64:      	bl	0xd64 <_stogir.verify.integer-operations-target-structured+0x1e0>
		0000000000000d64:  ARM64_RELOC_BRANCH26	_stogir.verify.classifications
     d68:      	uxtb	w1, w0
     d6c:      	cmp	x1, #0x0
     d70:      	cset	w1, ne
     d74:      	cmp	x23, #0x0
     d78:      	b.ne	0x148c <_stogir.verify.integer-operations-target-structured+0x908>
     d7c:      	uxtb	w16, w1
     d80:      	cmp	w16, wzr
     d84:      	b.ne	0x148c <_stogir.verify.integer-operations-target-structured+0x908>
     d88:      	str	x0, [sp, #0x2d8]
     d8c:      	mov	w23, w1
     d90:      	cmp	x22, #0x44
     d94:      	b.ne	0x1500 <_stogir.verify.integer-operations-target-structured+0x97c>
     d98:      	uxtb	w16, w23
     d9c:      	cmp	w16, wzr
     da0:      	b.eq	0x14f8 <_stogir.verify.integer-operations-target-structured+0x974>
     da4:      	movz	x0, #0x0, lsl #48
     da8:      	cmp	x0, #0x0
     dac:      	b.eq	0xe00 <_stogir.verify.integer-operations-target-structured+0x27c>
     db0:      	add	x8, sp, #0x50
     db4:      	ldr	x0, [sp, #0x238]
     db8:      	ldr	w1, [sp, #0x2c8]
     dbc:      	bl	0xdbc <_stogir.verify.integer-operations-target-structured+0x238>
		0000000000000dbc:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
     dc0:      	add	x16, sp, #0x50
     dc4:      	ldr	w0, [x16]
     dc8:      	lsr	x16, x0, #0
     dcc:      	cmp	x16, #0x1
     dd0:      	b.eq	0xdec <_stogir.verify.integer-operations-target-structured+0x268>
     dd4:      	b.lo	0xddc <_stogir.verify.integer-operations-target-structured+0x258>
     dd8:      	b	0xdf0 <_stogir.verify.integer-operations-target-structured+0x26c>
     ddc:      	cmp	x16, #0x0
     de0:      	b.eq	0xde8 <_stogir.verify.integer-operations-target-structured+0x264>
     de4:      	b	0xdf0 <_stogir.verify.integer-operations-target-structured+0x26c>
     de8:      	b	0x1508 <_stogir.verify.integer-operations-target-structured+0x984>
     dec:      	b	0xdf4 <_stogir.verify.integer-operations-target-structured+0x270>
     df0:      	b	0x1514 <_stogir.verify.integer-operations-target-structured+0x990>
     df4:      	add	x16, sp, #0x50
     df8:      	ldr	x19, [x16, #0x8]
     dfc:      	ldr	x20, [x27, #0x8]
     e00:      	cmp	x22, #0x1d
     e04:      	b.ne	0x151c <_stogir.verify.integer-operations-target-structured+0x998>
     e08:      	mov	x0, #0x1                ; =1
     e0c:      	cmp	x0, #0x0
     e10:      	b.eq	0x1534 <_stogir.verify.integer-operations-target-structured+0x9b0>
     e14:      	add	x16, sp, #0x20
     e18:      	ldr	w0, [x16, #0xc]
     e1c:      	sxtw	x0, w0
     e20:      	cmp	x0, #0x0
     e24:      	b.ne	0x152c <_stogir.verify.integer-operations-target-structured+0x9a8>
     e28:      	movz	x0, #0x0, lsl #48
     e2c:      	cmp	x0, #0x0
     e30:      	b.eq	0xe8c <_stogir.verify.integer-operations-target-structured+0x308>
     e34:      	add	x16, sp, #0x20
     e38:      	ldr	w0, [x16, #0xc]
     e3c:      	add	x8, sp, #0x70
     e40:      	mov	w1, w0
     e44:      	ldr	x0, [sp, #0x238]
     e48:      	bl	0xe48 <_stogir.verify.integer-operations-target-structured+0x2c4>
		0000000000000e48:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
     e4c:      	add	x16, sp, #0x70
     e50:      	ldr	w0, [x16]
     e54:      	lsr	x16, x0, #0
     e58:      	cmp	x16, #0x1
     e5c:      	b.eq	0xe78 <_stogir.verify.integer-operations-target-structured+0x2f4>
     e60:      	b.lo	0xe68 <_stogir.verify.integer-operations-target-structured+0x2e4>
     e64:      	b	0xe7c <_stogir.verify.integer-operations-target-structured+0x2f8>
     e68:      	cmp	x16, #0x0
     e6c:      	b.eq	0xe74 <_stogir.verify.integer-operations-target-structured+0x2f0>
     e70:      	b	0xe7c <_stogir.verify.integer-operations-target-structured+0x2f8>
     e74:      	b	0xe80 <_stogir.verify.integer-operations-target-structured+0x2fc>
     e78:      	b	0x153c <_stogir.verify.integer-operations-target-structured+0x9b8>
     e7c:      	b	0x15e4 <_stogir.verify.integer-operations-target-structured+0xa60>
     e80:      	adrp	x19, 0x0 <_gap_verify_graph>
		0000000000000e80:  ARM64_RELOC_PAGE21	l_stogir.333
     e84:      	ldr	x19, [x19]
		0000000000000e84:  ARM64_RELOC_PAGEOFF12	l_stogir.333
     e88:      	mov	x20, #0x16              ; =22
     e8c:      	and	w0, w21, #0x8
     e90:      	ubfx	x0, x0, #0, #32
     e94:      	cmp	x0, #0x0
     e98:      	b.ne	0x15ec <_stogir.verify.integer-operations-target-structured+0xa68>
     e9c:      	movz	x0, #0x0, lsl #48
     ea0:      	cmp	x22, #0x2c
     ea4:      	cset	w1, eq
     ea8:      	cmp	x0, #0x0
     eac:      	b.eq	0x15f4 <_stogir.verify.integer-operations-target-structured+0xa70>
     eb0:      	mov	x0, #0x1                ; =1
     eb4:      	cmp	x0, #0x0
     eb8:      	b.eq	0xf28 <_stogir.verify.integer-operations-target-structured+0x3a4>
     ebc:      	uxtb	w16, w1
     ec0:      	cmp	w16, wzr
     ec4:      	b.eq	0x15fc <_stogir.verify.integer-operations-target-structured+0xa78>
     ec8:      	add	x8, sp, #0xa0
     ecc:      	ldr	x0, [sp, #0x238]
     ed0:      	ldr	w1, [sp, #0x2c8]
     ed4:      	bl	0xed4 <_stogir.verify.integer-operations-target-structured+0x350>
		0000000000000ed4:  ARM64_RELOC_BRANCH26	_stogir.checked.validate-projection
     ed8:      	add	x16, sp, #0xa0
     edc:      	ldr	x0, [x16]
     ee0:      	add	x16, sp, #0xa0
     ee4:      	ldr	x1, [x16, #0x8]
     ee8:      	add	x16, sp, #0xa0
     eec:      	ldr	x2, [x16, #0x10]
     ef0:      	ubfx	x0, x0, #0, #32
     ef4:      	lsr	x16, x0, #0
     ef8:      	cmp	x16, #0x1
     efc:      	b.eq	0xf18 <_stogir.verify.integer-operations-target-structured+0x394>
     f00:      	b.lo	0xf08 <_stogir.verify.integer-operations-target-structured+0x384>
     f04:      	b	0xf1c <_stogir.verify.integer-operations-target-structured+0x398>
     f08:      	cmp	x16, #0x0
     f0c:      	b.eq	0xf14 <_stogir.verify.integer-operations-target-structured+0x390>
     f10:      	b	0xf1c <_stogir.verify.integer-operations-target-structured+0x398>
     f14:      	b	0x1628 <_stogir.verify.integer-operations-target-structured+0xaa4>
     f18:      	b	0xf20 <_stogir.verify.integer-operations-target-structured+0x39c>
     f1c:      	b	0x1634 <_stogir.verify.integer-operations-target-structured+0xab0>
     f20:      	mov	x19, x1
     f24:      	mov	x20, x2
     f28:      	and	w0, w21, #0x10
     f2c:      	ubfx	x0, x0, #0, #32
     f30:      	cmp	x0, #0x0
     f34:      	b.ne	0x163c <_stogir.verify.integer-operations-target-structured+0xab8>
     f38:      	movz	x0, #0x0, lsl #48
     f3c:      	cmp	x0, #0x0
     f40:      	b.eq	0xf94 <_stogir.verify.integer-operations-target-structured+0x410>
     f44:      	add	x8, sp, #0xe0
     f48:      	ldr	x0, [sp, #0x238]
     f4c:      	ldr	w1, [sp, #0x2c8]
     f50:      	bl	0xf50 <_stogir.verify.integer-operations-target-structured+0x3cc>
		0000000000000f50:  ARM64_RELOC_BRANCH26	_stogir.atomic.validate
     f54:      	add	x16, sp, #0xe0
     f58:      	ldr	w0, [x16]
     f5c:      	lsr	x16, x0, #0
     f60:      	cmp	x16, #0x1
     f64:      	b.eq	0xf80 <_stogir.verify.integer-operations-target-structured+0x3fc>
     f68:      	b.lo	0xf70 <_stogir.verify.integer-operations-target-structured+0x3ec>
     f6c:      	b	0xf84 <_stogir.verify.integer-operations-target-structured+0x400>
     f70:      	cmp	x16, #0x0
     f74:      	b.eq	0xf7c <_stogir.verify.integer-operations-target-structured+0x3f8>
     f78:      	b	0xf84 <_stogir.verify.integer-operations-target-structured+0x400>
     f7c:      	b	0x1644 <_stogir.verify.integer-operations-target-structured+0xac0>
     f80:      	b	0xf88 <_stogir.verify.integer-operations-target-structured+0x404>
     f84:      	b	0x1650 <_stogir.verify.integer-operations-target-structured+0xacc>
     f88:      	add	x16, sp, #0xe0
     f8c:      	ldr	x19, [x16, #0x8]
     f90:      	ldr	x20, [x28, #0x8]
     f94:      	and	w0, w21, #0x20
     f98:      	ubfx	x0, x0, #0, #32
     f9c:      	cmp	x0, #0x0
     fa0:      	b.ne	0x1658 <_stogir.verify.integer-operations-target-structured+0xad4>
     fa4:      	movz	x0, #0x0, lsl #48
     fa8:      	cmp	x0, #0x0
     fac:      	b.eq	0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
     fb0:      	add	x8, sp, #0x100
     fb4:      	ldr	x0, [sp, #0x238]
     fb8:      	ldr	w1, [sp, #0x2c8]
     fbc:      	bl	0xfbc <_stogir.verify.integer-operations-target-structured+0x438>
		0000000000000fbc:  ARM64_RELOC_BRANCH26	_stogir.terminal.validate
     fc0:      	add	x16, sp, #0x100
     fc4:      	ldr	w0, [x16]
     fc8:      	lsr	x16, x0, #0
     fcc:      	cmp	x16, #0x1
     fd0:      	b.eq	0xfec <_stogir.verify.integer-operations-target-structured+0x468>
     fd4:      	b.lo	0xfdc <_stogir.verify.integer-operations-target-structured+0x458>
     fd8:      	b	0xff0 <_stogir.verify.integer-operations-target-structured+0x46c>
     fdc:      	cmp	x16, #0x0
     fe0:      	b.eq	0xfe8 <_stogir.verify.integer-operations-target-structured+0x464>
     fe4:      	b	0xff0 <_stogir.verify.integer-operations-target-structured+0x46c>
     fe8:      	b	0x1660 <_stogir.verify.integer-operations-target-structured+0xadc>
     fec:      	b	0xff4 <_stogir.verify.integer-operations-target-structured+0x470>
     ff0:      	b	0x166c <_stogir.verify.integer-operations-target-structured+0xae8>
     ff4:      	add	x16, sp, #0x100
     ff8:      	ldr	x19, [x16, #0x8]
     ffc:      	ldr	x20, [x25, #0x8]
    1000:      	and	w0, w21, #0x40
    1004:      	ubfx	x0, x0, #0, #32
    1008:      	cmp	x0, #0x0
    100c:      	b.ne	0x1674 <_stogir.verify.integer-operations-target-structured+0xaf0>
    1010:      	movz	x0, #0x0, lsl #48
    1014:      	cmp	x0, #0x0
    1018:      	b.eq	0x1c28 <_stogir.verify.integer-operations-target-structured+0x10a4>
    101c:      	add	x8, sp, #0x120
    1020:      	ldr	x0, [sp, #0x238]
    1024:      	ldr	w1, [sp, #0x2c8]
    1028:      	bl	0x1028 <_stogir.verify.integer-operations-target-structured+0x4a4>
		0000000000001028:  ARM64_RELOC_BRANCH26	_stogir.switch.validate
    102c:      	add	x16, sp, #0x120
    1030:      	ldr	w0, [x16]
    1034:      	lsr	x16, x0, #0
    1038:      	cmp	x16, #0x1
    103c:      	b.eq	0x105c <_stogir.verify.integer-operations-target-structured+0x4d8>
    1040:      	b.lo	0x1048 <_stogir.verify.integer-operations-target-structured+0x4c4>
    1044:      	b	0x1060 <_stogir.verify.integer-operations-target-structured+0x4dc>
    1048:      	cmp	x16, #0x0
    104c:      	b.eq	0x1054 <_stogir.verify.integer-operations-target-structured+0x4d0>
    1050:      	b	0x1060 <_stogir.verify.integer-operations-target-structured+0x4dc>
    1054:      	ldr	x0, [sp, #0x2d0]
    1058:      	b	0x167c <_stogir.verify.integer-operations-target-structured+0xaf8>
    105c:      	b	0x1064 <_stogir.verify.integer-operations-target-structured+0x4e0>
    1060:      	b	0x1688 <_stogir.verify.integer-operations-target-structured+0xb04>
    1064:      	add	x16, sp, #0x120
    1068:      	ldr	x19, [x16, #0x8]
    106c:      	ldr	x0, [sp, #0x2d0]
    1070:      	ldr	x20, [x0, #0x8]
    1074:      	and	w1, w21, #0x80
    1078:      	ubfx	x1, x1, #0, #32
    107c:      	cmp	x1, #0x0
    1080:      	b.ne	0x1690 <_stogir.verify.integer-operations-target-structured+0xb0c>
    1084:      	movz	x1, #0x0, lsl #48
    1088:      	cmp	x1, #0x0
    108c:      	b.eq	0x1c30 <_stogir.verify.integer-operations-target-structured+0x10ac>
    1090:      	add	x8, sp, #0x140
    1094:      	ldr	w1, [sp, #0x2c8]
    1098:      	str	x0, [sp, #0x2d0]
    109c:      	ldr	x0, [sp, #0x238]
    10a0:      	bl	0x10a0 <_stogir.verify.integer-operations-target-structured+0x51c>
		00000000000010a0:  ARM64_RELOC_BRANCH26	_stogir.stack.validate
    10a4:      	add	x16, sp, #0x140
    10a8:      	ldr	w0, [x16]
    10ac:      	lsr	x16, x0, #0
    10b0:      	cmp	x16, #0x1
    10b4:      	b.eq	0x10d4 <_stogir.verify.integer-operations-target-structured+0x550>
    10b8:      	b.lo	0x10c0 <_stogir.verify.integer-operations-target-structured+0x53c>
    10bc:      	b	0x10d8 <_stogir.verify.integer-operations-target-structured+0x554>
    10c0:      	cmp	x16, #0x0
    10c4:      	b.eq	0x10cc <_stogir.verify.integer-operations-target-structured+0x548>
    10c8:      	b	0x10d8 <_stogir.verify.integer-operations-target-structured+0x554>
    10cc:      	ldr	x0, [sp, #0x2c0]
    10d0:      	b	0x1698 <_stogir.verify.integer-operations-target-structured+0xb14>
    10d4:      	b	0x10dc <_stogir.verify.integer-operations-target-structured+0x558>
    10d8:      	b	0x16a4 <_stogir.verify.integer-operations-target-structured+0xb20>
    10dc:      	add	x16, sp, #0x140
    10e0:      	ldr	x19, [x16, #0x8]
    10e4:      	ldr	x0, [sp, #0x2c0]
    10e8:      	ldr	x20, [x0, #0x8]
    10ec:      	and	w1, w21, #0x100
    10f0:      	ubfx	x1, x1, #0, #32
    10f4:      	cmp	x1, #0x0
    10f8:      	b.ne	0x16ac <_stogir.verify.integer-operations-target-structured+0xb28>
    10fc:      	movz	x1, #0x0, lsl #48
    1100:      	cmp	x1, #0x0
    1104:      	b.eq	0x1c3c <_stogir.verify.integer-operations-target-structured+0x10b8>
    1108:      	add	x8, sp, #0x160
    110c:      	ldr	w1, [sp, #0x2c8]
    1110:      	ldr	w2, [sp, #0x250]
    1114:      	str	x0, [sp, #0x2c0]
    1118:      	ldr	x0, [sp, #0x238]
    111c:      	bl	0x111c <_stogir.verify.integer-operations-target-structured+0x598>
		000000000000111c:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    1120:      	add	x16, sp, #0x160
    1124:      	ldr	w0, [x16]
    1128:      	lsr	x16, x0, #0
    112c:      	cmp	x16, #0x1
    1130:      	b.eq	0x1150 <_stogir.verify.integer-operations-target-structured+0x5cc>
    1134:      	b.lo	0x113c <_stogir.verify.integer-operations-target-structured+0x5b8>
    1138:      	b	0x1154 <_stogir.verify.integer-operations-target-structured+0x5d0>
    113c:      	cmp	x16, #0x0
    1140:      	b.eq	0x1148 <_stogir.verify.integer-operations-target-structured+0x5c4>
    1144:      	b	0x1154 <_stogir.verify.integer-operations-target-structured+0x5d0>
    1148:      	ldr	x0, [sp, #0x2a8]
    114c:      	b	0x16b4 <_stogir.verify.integer-operations-target-structured+0xb30>
    1150:      	b	0x1158 <_stogir.verify.integer-operations-target-structured+0x5d4>
    1154:      	b	0x16c0 <_stogir.verify.integer-operations-target-structured+0xb3c>
    1158:      	add	x16, sp, #0x160
    115c:      	ldr	x19, [x16, #0x8]
    1160:      	ldr	x0, [sp, #0x2a8]
    1164:      	ldr	x20, [x0, #0x8]
    1168:      	and	w1, w21, #0x200
    116c:      	ubfx	x1, x1, #0, #32
    1170:      	cmp	x1, #0x0
    1174:      	b.ne	0x16c8 <_stogir.verify.integer-operations-target-structured+0xb44>
    1178:      	movz	x1, #0x0, lsl #48
    117c:      	cmp	x1, #0x0
    1180:      	b.eq	0x1c48 <_stogir.verify.integer-operations-target-structured+0x10c4>
    1184:      	add	x8, sp, #0x180
    1188:      	ldr	w1, [sp, #0x2c8]
    118c:      	ldr	w2, [sp, #0x258]
    1190:      	str	x0, [sp, #0x2a8]
    1194:      	ldr	x0, [sp, #0x238]
    1198:      	bl	0x1198 <_stogir.verify.integer-operations-target-structured+0x614>
		0000000000001198:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    119c:      	add	x16, sp, #0x180
    11a0:      	ldr	w0, [x16]
    11a4:      	lsr	x16, x0, #0
    11a8:      	cmp	x16, #0x1
    11ac:      	b.eq	0x11cc <_stogir.verify.integer-operations-target-structured+0x648>
    11b0:      	b.lo	0x11b8 <_stogir.verify.integer-operations-target-structured+0x634>
    11b4:      	b	0x11d0 <_stogir.verify.integer-operations-target-structured+0x64c>
    11b8:      	cmp	x16, #0x0
    11bc:      	b.eq	0x11c4 <_stogir.verify.integer-operations-target-structured+0x640>
    11c0:      	b	0x11d0 <_stogir.verify.integer-operations-target-structured+0x64c>
    11c4:      	ldr	x0, [sp, #0x2a0]
    11c8:      	b	0x16d0 <_stogir.verify.integer-operations-target-structured+0xb4c>
    11cc:      	b	0x11d4 <_stogir.verify.integer-operations-target-structured+0x650>
    11d0:      	b	0x16dc <_stogir.verify.integer-operations-target-structured+0xb58>
    11d4:      	add	x16, sp, #0x180
    11d8:      	ldr	x19, [x16, #0x8]
    11dc:      	ldr	x0, [sp, #0x2a0]
    11e0:      	ldr	x20, [x0, #0x8]
    11e4:      	cmp	x22, #0x3c
    11e8:      	b.ne	0x1c54 <_stogir.verify.integer-operations-target-structured+0x10d0>
    11ec:      	add	x8, sp, #0x1a0
    11f0:      	ldr	w1, [sp, #0x2c8]
    11f4:      	str	x0, [sp, #0x2a0]
    11f8:      	ldr	x0, [sp, #0x238]
    11fc:      	bl	0x11fc <_stogir.verify.integer-operations-target-structured+0x678>
		00000000000011fc:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    1200:      	add	x16, sp, #0x1a0
    1204:      	ldr	w0, [x16]
    1208:      	lsr	x16, x0, #0
    120c:      	cmp	x16, #0x1
    1210:      	b.eq	0x1230 <_stogir.verify.integer-operations-target-structured+0x6ac>
    1214:      	b.lo	0x121c <_stogir.verify.integer-operations-target-structured+0x698>
    1218:      	b	0x1234 <_stogir.verify.integer-operations-target-structured+0x6b0>
    121c:      	cmp	x16, #0x0
    1220:      	b.eq	0x1228 <_stogir.verify.integer-operations-target-structured+0x6a4>
    1224:      	b	0x1234 <_stogir.verify.integer-operations-target-structured+0x6b0>
    1228:      	ldr	x0, [sp, #0x298]
    122c:      	b	0x16e4 <_stogir.verify.integer-operations-target-structured+0xb60>
    1230:      	b	0x1238 <_stogir.verify.integer-operations-target-structured+0x6b4>
    1234:      	b	0x16f0 <_stogir.verify.integer-operations-target-structured+0xb6c>
    1238:      	add	x16, sp, #0x1a0
    123c:      	ldr	x19, [x16, #0x8]
    1240:      	ldr	x0, [sp, #0x298]
    1244:      	ldr	x20, [x0, #0x8]
    1248:      	cmp	x22, #0x78
    124c:      	b.ne	0x1c60 <_stogir.verify.integer-operations-target-structured+0x10dc>
    1250:      	add	x16, sp, #0x20
    1254:      	ldr	w1, [x16]
    1258:      	ubfx	x1, x1, #8, #8
    125c:      	cmp	x1, #0x0
    1260:      	b.ne	0x16f8 <_stogir.verify.integer-operations-target-structured+0xb74>
    1264:      	add	x16, sp, #0x20
    1268:      	ldr	w1, [x16, #0x8]
    126c:      	sxtw	x1, w1
    1270:      	cmp	x1, #0x0
    1274:      	b.eq	0x1284 <_stogir.verify.integer-operations-target-structured+0x700>
    1278:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001278:  ARM64_RELOC_PAGE21	l_stogir.334
    127c:      	ldr	x19, [x19]
		000000000000127c:  ARM64_RELOC_PAGEOFF12	l_stogir.334
    1280:      	mov	x20, #0x1f              ; =31
    1284:      	str	x0, [sp, #0x298]
    1288:      	add	x0, x24, #0x1
    128c:      	sxtw	x24, w0
    1290:      	ldr	x0, [sp, #0x2d8]
    1294:      	uxth	w0, w0
    1298:      	mov	w17, #0x8               ; =8
    129c:      	uxth	w16, w0
    12a0:      	ubfx	w17, w17, #0, #4
    12a4:      	lsr	w0, w16, w17
    12a8:      	uxth	w0, w0
    12ac:      	uxtb	w0, w0
    12b0:      	cmp	x0, #0x0
    12b4:      	b.eq	0x1c68 <_stogir.verify.integer-operations-target-structured+0x10e4>
    12b8:      	add	x8, sp, #0x1f0
    12bc:      	ldr	w1, [sp, #0x2c8]
    12c0:      	str	x25, [sp, #0x248]
    12c4:      	mov	x25, x0
    12c8:      	ldr	x0, [sp, #0x238]
    12cc:      	bl	0x12cc <_stogir.verify.integer-operations-target-structured+0x748>
		00000000000012cc:  ARM64_RELOC_BRANCH26	_stogir.floating.validate
    12d0:      	add	x16, sp, #0x1f0
    12d4:      	ldr	w0, [x16]
    12d8:      	lsr	x16, x0, #0
    12dc:      	cmp	x16, #0x1
    12e0:      	b.eq	0x1300 <_stogir.verify.integer-operations-target-structured+0x77c>
    12e4:      	b.lo	0x12ec <_stogir.verify.integer-operations-target-structured+0x768>
    12e8:      	b	0x1304 <_stogir.verify.integer-operations-target-structured+0x780>
    12ec:      	cmp	x16, #0x0
    12f0:      	b.eq	0x12f8 <_stogir.verify.integer-operations-target-structured+0x774>
    12f4:      	b	0x1304 <_stogir.verify.integer-operations-target-structured+0x780>
    12f8:      	ldr	x0, [sp, #0x288]
    12fc:      	b	0x1790 <_stogir.verify.integer-operations-target-structured+0xc0c>
    1300:      	b	0x1308 <_stogir.verify.integer-operations-target-structured+0x784>
    1304:      	b	0x179c <_stogir.verify.integer-operations-target-structured+0xc18>
    1308:      	add	x16, sp, #0x1f0
    130c:      	ldr	x19, [x16, #0x8]
    1310:      	ldr	x0, [sp, #0x288]
    1314:      	ldr	x20, [x0, #0x8]
    1318:      	uxtb	w16, w23
    131c:      	cmp	w16, wzr
    1320:      	b.eq	0x17a4 <_stogir.verify.integer-operations-target-structured+0xc20>
    1324:      	movz	x1, #0x0, lsl #48
    1328:      	and	w2, w21, #0x1
    132c:      	and	w3, w21, #0x2
    1330:      	ubfx	x2, x2, #0, #32
    1334:      	ubfx	x3, x3, #0, #32
    1338:      	cmp	x2, #0x0
    133c:      	cset	w2, eq
    1340:      	cmp	x3, #0x0
    1344:      	cset	w3, eq
    1348:      	uxtb	w16, w2
    134c:      	cmp	w16, wzr
    1350:      	cset	x21, eq
    1354:      	uxtb	w16, w3
    1358:      	cmp	w16, wzr
    135c:      	cset	x23, eq
    1360:      	cmp	x1, #0x0
    1364:      	b.eq	0x1c78 <_stogir.verify.integer-operations-target-structured+0x10f4>
    1368:      	cmp	x25, #0x0
    136c:      	b.eq	0x17ac <_stogir.verify.integer-operations-target-structured+0xc28>
    1370:      	movz	x1, #0x0, lsl #48
    1374:      	cmp	x1, #0x0
    1378:      	b.eq	0x1c80 <_stogir.verify.integer-operations-target-structured+0x10fc>
    137c:      	ldr	x25, [sp, #0x240]
    1380:      	cmp	x25, #0x0
    1384:      	b.eq	0x17b4 <_stogir.verify.integer-operations-target-structured+0xc30>
    1388:      	mov	x1, #0x1                ; =1
    138c:      	cmp	x1, #0x0
    1390:      	b.eq	0x1c88 <_stogir.verify.integer-operations-target-structured+0x1104>
    1394:      	ldr	w1, [sp, #0x2c8]
    1398:      	str	x0, [sp, #0x288]
    139c:      	ldr	x0, [sp, #0x238]
    13a0:      	mov	x2, #0x1                ; =1
    13a4:      	bl	0x13a4 <_stogir.verify.integer-operations-target-structured+0x820>
		00000000000013a4:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    13a8:      	ubfx	x0, x0, #0, #32
    13ac:      	lsr	x16, x0, #0
    13b0:      	cmp	x16, #0x1
    13b4:      	b.eq	0x13d0 <_stogir.verify.integer-operations-target-structured+0x84c>
    13b8:      	b.lo	0x13c0 <_stogir.verify.integer-operations-target-structured+0x83c>
    13bc:      	b	0x13d4 <_stogir.verify.integer-operations-target-structured+0x850>
    13c0:      	cmp	x16, #0x0
    13c4:      	b.eq	0x13cc <_stogir.verify.integer-operations-target-structured+0x848>
    13c8:      	b	0x13d4 <_stogir.verify.integer-operations-target-structured+0x850>
    13cc:      	b	0x13d8 <_stogir.verify.integer-operations-target-structured+0x854>
    13d0:      	b	0x17dc <_stogir.verify.integer-operations-target-structured+0xc58>
    13d4:      	b	0x1b84 <_stogir.verify.integer-operations-target-structured+0x1000>
    13d8:      	str	x26, [sp, #0x2e0]
    13dc:      	str	x27, [sp, #0x2e8]
    13e0:      	str	x28, [sp, #0x2f0]
    13e4:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		00000000000013e4:  ARM64_RELOC_PAGE21	l_stogir.335
    13e8:      	ldr	x19, [x19]
		00000000000013e8:  ARM64_RELOC_PAGEOFF12	l_stogir.335
    13ec:      	mov	x20, #0x17              ; =23
    13f0:      	add	x0, x24, #0x1
    13f4:      	sxtw	x24, w0
    13f8:      	ldr	w0, [sp, #0x2b8]
    13fc:      	sxtw	x0, w0
    1400:      	add	x0, x0, #0x4
    1404:      	asr	x16, x0, #63
    1408:      	lsr	x16, x16, #62
    140c:      	add	x0, x0, x16
    1410:      	asr	x0, x0, #2
    1414:      	ldr	x1, [sp, #0x290]
    1418:      	add	x1, x0, x1
    141c:      	ldr	x8, [sp, #0x268]
    1420:      	ldr	x0, [sp, #0x238]
    1424:      	ldr	x25, [sp, #0x260]
    1428:      	ldr	w22, [sp, #0x230]
    142c:      	ldr	x26, [sp, #0x2e0]
    1430:      	ldr	x27, [sp, #0x2e8]
    1434:      	ldr	x28, [sp, #0x2f0]
    1438:      	ldr	x2, [sp, #0x2d0]
    143c:      	ldr	x3, [sp, #0x2c0]
    1440:      	ldr	w23, [sp, #0x250]
    1444:      	ldr	x4, [sp, #0x2a8]
    1448:      	ldr	x5, [sp, #0x2a0]
    144c:      	ldr	x6, [sp, #0x298]
    1450:      	ldr	x7, [sp, #0x288]
    1454:      	ldr	x21, [sp, #0x270]
    1458:      	mov	x9, x1
    145c:      	ldr	x1, [sp, #0x248]
    1460:      	mov	x10, x24
    1464:      	ldr	w24, [sp, #0x258]
    1468:      	mov	x11, x19
    146c:      	ldr	x19, [sp, #0x280]
    1470:      	mov	x12, x20
    1474:      	ldr	x20, [sp, #0x278]
    1478:      	b	0xc68 <_stogir.verify.integer-operations-target-structured+0xe4>
    147c:      	movz	w14, #0x0, lsl #16
    1480:      	b	0xccc <_stogir.verify.integer-operations-target-structured+0x148>
    1484:      	movz	x0, #0x0, lsl #48
    1488:      	b	0xce4 <_stogir.verify.integer-operations-target-structured+0x160>
    148c:      	add	x8, sp, #0x30
    1490:      	ldr	w2, [sp, #0x230]
    1494:      	str	x0, [sp, #0x2d8]
    1498:      	ldr	x0, [sp, #0x238]
    149c:      	mov	w23, w1
    14a0:      	ldr	w1, [sp, #0x2c8]
    14a4:      	bl	0x14a4 <_stogir.verify.integer-operations-target-structured+0x920>
		00000000000014a4:  ARM64_RELOC_BRANCH26	_stogir.vector.validate
    14a8:      	add	x16, sp, #0x30
    14ac:      	ldr	w0, [x16]
    14b0:      	lsr	x16, x0, #0
    14b4:      	cmp	x16, #0x1
    14b8:      	b.eq	0x14d4 <_stogir.verify.integer-operations-target-structured+0x950>
    14bc:      	b.lo	0x14c4 <_stogir.verify.integer-operations-target-structured+0x940>
    14c0:      	b	0x14d8 <_stogir.verify.integer-operations-target-structured+0x954>
    14c4:      	cmp	x16, #0x0
    14c8:      	b.eq	0x14d0 <_stogir.verify.integer-operations-target-structured+0x94c>
    14cc:      	b	0x14d8 <_stogir.verify.integer-operations-target-structured+0x954>
    14d0:      	b	0x14ec <_stogir.verify.integer-operations-target-structured+0x968>
    14d4:      	b	0x14dc <_stogir.verify.integer-operations-target-structured+0x958>
    14d8:      	b	0x1b8c <_stogir.verify.integer-operations-target-structured+0x1008>
    14dc:      	add	x16, sp, #0x30
    14e0:      	ldr	x19, [x16, #0x8]
    14e4:      	ldr	x20, [x26, #0x8]
    14e8:      	b	0xd90 <_stogir.verify.integer-operations-target-structured+0x20c>
    14ec:      	add	x0, x24, #0x1
    14f0:      	sxtw	x24, w0
    14f4:      	b	0x14e8 <_stogir.verify.integer-operations-target-structured+0x964>
    14f8:      	mov	x0, #0x1                ; =1
    14fc:      	b	0xda8 <_stogir.verify.integer-operations-target-structured+0x224>
    1500:      	movz	x0, #0x0, lsl #48
    1504:      	b	0xda8 <_stogir.verify.integer-operations-target-structured+0x224>
    1508:      	add	x0, x24, #0x1
    150c:      	sxtw	x24, w0
    1510:      	b	0xe00 <_stogir.verify.integer-operations-target-structured+0x27c>
    1514:      	brk	#0
    1518:      	b	0x1514 <_stogir.verify.integer-operations-target-structured+0x990>
    151c:      	cmp	x22, #0x1e
    1520:      	cset	w0, eq
    1524:      	ubfx	x0, x0, #0, #8
    1528:      	b	0xe0c <_stogir.verify.integer-operations-target-structured+0x288>
    152c:      	mov	x0, #0x1                ; =1
    1530:      	b	0xe2c <_stogir.verify.integer-operations-target-structured+0x2a8>
    1534:      	movz	x0, #0x0, lsl #48
    1538:      	b	0xe2c <_stogir.verify.integer-operations-target-structured+0x2a8>
    153c:      	add	x16, sp, #0x70
    1540:      	ldr	x0, [x16, #0x8]
    1544:      	add	x16, sp, #0x20
    1548:      	ldr	w1, [x16, #0xc]
    154c:      	sxtw	x1, w1
    1550:      	cmp	x1, #0x0
    1554:      	b.ge	0x1574 <_stogir.verify.integer-operations-target-structured+0x9f0>
    1558:      	mov	x0, #0x1                ; =1
    155c:      	cmp	x0, #0x0
    1560:      	b.eq	0x1570 <_stogir.verify.integer-operations-target-structured+0x9ec>
    1564:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001564:  ARM64_RELOC_PAGE21	l_stogir.336
    1568:      	ldr	x19, [x19]
		0000000000001568:  ARM64_RELOC_PAGEOFF12	l_stogir.336
    156c:      	mov	x20, #0x2d              ; =45
    1570:      	b	0xe8c <_stogir.verify.integer-operations-target-structured+0x308>
    1574:      	uxtb	w0, w0
    1578:      	cmp	x0, #0x83
    157c:      	b.ge	0x15d4 <_stogir.verify.integer-operations-target-structured+0xa50>
    1580:      	adrp	x17, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001580:  ARM64_RELOC_PAGE21	l_stogir.337
    1584:      	ldr	x17, [x17]
		0000000000001584:  ARM64_RELOC_PAGEOFF12	l_stogir.337
    1588:      	add	x1, x0, x17
    158c:      	ldrb	w1, [x1]
    1590:      	uxtb	w16, w1
    1594:      	and	w1, w16, #0x2
    1598:      	uxtb	w1, w1
    159c:      	ubfx	x1, x1, #0, #8
    15a0:      	cmp	x1, #0x0
    15a4:      	cset	w1, eq
    15a8:      	uxtb	w16, w1
    15ac:      	cmp	w16, wzr
    15b0:      	cset	x1, eq
    15b4:      	cmp	x1, #0x0
    15b8:      	b.ne	0x15dc <_stogir.verify.integer-operations-target-structured+0xa58>
    15bc:      	cmp	x0, #0x65
    15c0:      	b.eq	0x15dc <_stogir.verify.integer-operations-target-structured+0xa58>
    15c4:      	cmp	x0, #0x66
    15c8:      	b.eq	0x15dc <_stogir.verify.integer-operations-target-structured+0xa58>
    15cc:      	mov	x0, #0x1                ; =1
    15d0:      	b	0x155c <_stogir.verify.integer-operations-target-structured+0x9d8>
    15d4:      	movz	w1, #0x0, lsl #16
    15d8:      	b	0x1590 <_stogir.verify.integer-operations-target-structured+0xa0c>
    15dc:      	movz	x0, #0x0, lsl #48
    15e0:      	b	0x15d0 <_stogir.verify.integer-operations-target-structured+0xa4c>
    15e4:      	brk	#0
    15e8:      	b	0x15e4 <_stogir.verify.integer-operations-target-structured+0xa60>
    15ec:      	mov	x0, #0x1                ; =1
    15f0:      	b	0xea0 <_stogir.verify.integer-operations-target-structured+0x31c>
    15f4:      	ubfx	x0, x1, #0, #8
    15f8:      	b	0xeb4 <_stogir.verify.integer-operations-target-structured+0x330>
    15fc:      	add	x8, sp, #0xc0
    1600:      	ldr	x0, [sp, #0x238]
    1604:      	ldr	w1, [sp, #0x2c8]
    1608:      	bl	0x1608 <_stogir.verify.integer-operations-target-structured+0xa84>
		0000000000001608:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    160c:      	add	x16, sp, #0xc0
    1610:      	ldr	x0, [x16]
    1614:      	add	x16, sp, #0xc0
    1618:      	ldr	x1, [x16, #0x8]
    161c:      	add	x16, sp, #0xc0
    1620:      	ldr	x2, [x16, #0x10]
    1624:      	b	0xef0 <_stogir.verify.integer-operations-target-structured+0x36c>
    1628:      	add	x0, x24, #0x1
    162c:      	sxtw	x24, w0
    1630:      	b	0xf28 <_stogir.verify.integer-operations-target-structured+0x3a4>
    1634:      	brk	#0
    1638:      	b	0x1634 <_stogir.verify.integer-operations-target-structured+0xab0>
    163c:      	mov	x0, #0x1                ; =1
    1640:      	b	0xf3c <_stogir.verify.integer-operations-target-structured+0x3b8>
    1644:      	add	x0, x24, #0x1
    1648:      	sxtw	x24, w0
    164c:      	b	0xf94 <_stogir.verify.integer-operations-target-structured+0x410>
    1650:      	brk	#0
    1654:      	b	0x1650 <_stogir.verify.integer-operations-target-structured+0xacc>
    1658:      	mov	x0, #0x1                ; =1
    165c:      	b	0xfa8 <_stogir.verify.integer-operations-target-structured+0x424>
    1660:      	add	x0, x24, #0x1
    1664:      	sxtw	x24, w0
    1668:      	b	0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
    166c:      	brk	#0
    1670:      	b	0x166c <_stogir.verify.integer-operations-target-structured+0xae8>
    1674:      	mov	x0, #0x1                ; =1
    1678:      	b	0x1014 <_stogir.verify.integer-operations-target-structured+0x490>
    167c:      	add	x1, x24, #0x1
    1680:      	sxtw	x24, w1
    1684:      	b	0x1074 <_stogir.verify.integer-operations-target-structured+0x4f0>
    1688:      	brk	#0
    168c:      	b	0x1688 <_stogir.verify.integer-operations-target-structured+0xb04>
    1690:      	mov	x1, #0x1                ; =1
    1694:      	b	0x1088 <_stogir.verify.integer-operations-target-structured+0x504>
    1698:      	add	x1, x24, #0x1
    169c:      	sxtw	x24, w1
    16a0:      	b	0x10ec <_stogir.verify.integer-operations-target-structured+0x568>
    16a4:      	brk	#0
    16a8:      	b	0x16a4 <_stogir.verify.integer-operations-target-structured+0xb20>
    16ac:      	mov	x1, #0x1                ; =1
    16b0:      	b	0x1100 <_stogir.verify.integer-operations-target-structured+0x57c>
    16b4:      	add	x1, x24, #0x1
    16b8:      	sxtw	x24, w1
    16bc:      	b	0x1168 <_stogir.verify.integer-operations-target-structured+0x5e4>
    16c0:      	brk	#0
    16c4:      	b	0x16c0 <_stogir.verify.integer-operations-target-structured+0xb3c>
    16c8:      	mov	x1, #0x1                ; =1
    16cc:      	b	0x117c <_stogir.verify.integer-operations-target-structured+0x5f8>
    16d0:      	add	x1, x24, #0x1
    16d4:      	sxtw	x24, w1
    16d8:      	b	0x11e4 <_stogir.verify.integer-operations-target-structured+0x660>
    16dc:      	brk	#0
    16e0:      	b	0x16dc <_stogir.verify.integer-operations-target-structured+0xb58>
    16e4:      	add	x1, x24, #0x1
    16e8:      	sxtw	x24, w1
    16ec:      	b	0x1248 <_stogir.verify.integer-operations-target-structured+0x6c4>
    16f0:      	brk	#0
    16f4:      	b	0x16f0 <_stogir.verify.integer-operations-target-structured+0xb6c>
    16f8:      	add	x16, sp, #0x20
    16fc:      	ldr	w1, [x16, #0x8]
    1700:      	add	x8, sp, #0x1c0
    1704:      	str	x0, [sp, #0x298]
    1708:      	ldr	x0, [sp, #0x238]
    170c:      	bl	0x170c <_stogir.verify.integer-operations-target-structured+0xb88>
		000000000000170c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    1710:      	add	x16, sp, #0x1c0
    1714:      	ldr	w0, [x16]
    1718:      	lsr	x16, x0, #0
    171c:      	cmp	x16, #0x1
    1720:      	b.eq	0x173c <_stogir.verify.integer-operations-target-structured+0xbb8>
    1724:      	b.lo	0x172c <_stogir.verify.integer-operations-target-structured+0xba8>
    1728:      	b	0x1740 <_stogir.verify.integer-operations-target-structured+0xbbc>
    172c:      	cmp	x16, #0x0
    1730:      	b.eq	0x1738 <_stogir.verify.integer-operations-target-structured+0xbb4>
    1734:      	b	0x1740 <_stogir.verify.integer-operations-target-structured+0xbbc>
    1738:      	b	0x1744 <_stogir.verify.integer-operations-target-structured+0xbc0>
    173c:      	b	0x1754 <_stogir.verify.integer-operations-target-structured+0xbd0>
    1740:      	b	0x1788 <_stogir.verify.integer-operations-target-structured+0xc04>
    1744:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001744:  ARM64_RELOC_PAGE21	l_stogir.338
    1748:      	ldr	x19, [x19]
		0000000000001748:  ARM64_RELOC_PAGEOFF12	l_stogir.338
    174c:      	mov	x20, #0x14              ; =20
    1750:      	b	0x1288 <_stogir.verify.integer-operations-target-structured+0x704>
    1754:      	add	x16, sp, #0x1c0
    1758:      	ldr	x0, [x16, #0x8]
    175c:      	add	x16, sp, #0x20
    1760:      	ldr	w1, [x16]
    1764:      	ubfx	x0, x0, #0, #32
    1768:      	ubfx	x1, x1, #8, #8
    176c:      	ubfx	x0, x0, #8, #8
    1770:      	cmp	x0, x1
    1774:      	b.eq	0x1784 <_stogir.verify.integer-operations-target-structured+0xc00>
    1778:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001778:  ARM64_RELOC_PAGE21	l_stogir.339
    177c:      	ldr	x19, [x19]
		000000000000177c:  ARM64_RELOC_PAGEOFF12	l_stogir.339
    1780:      	mov	x20, #0x1a              ; =26
    1784:      	b	0x1750 <_stogir.verify.integer-operations-target-structured+0xbcc>
    1788:      	brk	#0
    178c:      	b	0x1788 <_stogir.verify.integer-operations-target-structured+0xc04>
    1790:      	add	x1, x24, #0x1
    1794:      	sxtw	x24, w1
    1798:      	b	0x1318 <_stogir.verify.integer-operations-target-structured+0x794>
    179c:      	brk	#0
    17a0:      	b	0x179c <_stogir.verify.integer-operations-target-structured+0xc18>
    17a4:      	mov	x1, #0x1                ; =1
    17a8:      	b	0x1328 <_stogir.verify.integer-operations-target-structured+0x7a4>
    17ac:      	mov	x1, #0x1                ; =1
    17b0:      	b	0x1374 <_stogir.verify.integer-operations-target-structured+0x7f0>
    17b4:      	cmp	x21, #0x0
    17b8:      	b.eq	0x17c4 <_stogir.verify.integer-operations-target-structured+0xc40>
    17bc:      	mov	x1, #0x1                ; =1
    17c0:      	b	0x138c <_stogir.verify.integer-operations-target-structured+0x808>
    17c4:      	mov	x1, x23
    17c8:      	b	0x17c0 <_stogir.verify.integer-operations-target-structured+0xc3c>
    17cc:      	movz	x1, #0x0, lsl #48
    17d0:      	b	0x138c <_stogir.verify.integer-operations-target-structured+0x808>
    17d4:      	movz	x1, #0x0, lsl #48
    17d8:      	b	0x138c <_stogir.verify.integer-operations-target-structured+0x808>
    17dc:      	sxtw	x1, w1
    17e0:      	cmp	x1, #0x0
    17e4:      	cset	w0, gt
    17e8:      	movz	x16, #0x0, lsl #48
    17ec:      	sub	x2, x16, x1
    17f0:      	sub	x3, x2, #0x1
    17f4:      	uxtb	w16, w0
    17f8:      	cmp	w16, wzr
    17fc:      	b.eq	0x1c9c <_stogir.verify.integer-operations-target-structured+0x1118>
    1800:      	ldr	x4, [sp, #0x238]
    1804:      	ldr	x2, [x4, #0x8]
    1808:      	cmp	x1, x2
    180c:      	b.ge	0x1ca8 <_stogir.verify.integer-operations-target-structured+0x1124>
    1810:      	ldr	x5, [sp, #0x280]
    1814:      	ldr	x2, [x5, #0x8]
    1818:      	cmp	x1, x2
    181c:      	b.ge	0x1894 <_stogir.verify.integer-operations-target-structured+0xd10>
    1820:      	ldr	x2, [x4, #0x78]
    1824:      	add	x2, x2, x1, lsl #2
    1828:      	ldr	w2, [x2]
    182c:      	sxtw	x2, w2
    1830:      	cmp	x2, #0x0
    1834:      	cset	w2, ge
    1838:      	ubfx	x2, x2, #0, #8
    183c:      	ldr	x6, [sp, #0x278]
    1840:      	ldr	x8, [sp, #0x270]
    1844:      	cmp	x2, #0x0
    1848:      	b.eq	0x1910 <_stogir.verify.integer-operations-target-structured+0xd8c>
    184c:      	uxtb	w16, w0
    1850:      	cmp	w16, wzr
    1854:      	b.eq	0x1904 <_stogir.verify.integer-operations-target-structured+0xd80>
    1858:      	ldr	x0, [x4]
    185c:      	add	x0, x0, x1, lsl #4
    1860:      	cmp	x0, #0x0
    1864:      	b.ne	0x1918 <_stogir.verify.integer-operations-target-structured+0xd94>
    1868:      	str	x4, [sp, #0x238]
    186c:      	str	x26, [sp, #0x2e0]
    1870:      	str	x27, [sp, #0x2e8]
    1874:      	str	x28, [sp, #0x2f0]
    1878:      	str	x5, [sp, #0x280]
    187c:      	str	x6, [sp, #0x278]
    1880:      	str	x8, [sp, #0x270]
    1884:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001884:  ARM64_RELOC_PAGE21	l_stogir.335
    1888:      	ldr	x19, [x19]
		0000000000001888:  ARM64_RELOC_PAGEOFF12	l_stogir.335
    188c:      	mov	x20, #0x17              ; =23
    1890:      	b	0x13f0 <_stogir.verify.integer-operations-target-structured+0x86c>
    1894:      	movz	x2, #0x0, lsl #48
    1898:      	b	0x183c <_stogir.verify.integer-operations-target-structured+0xcb8>
    189c:      	movz	x2, #0x0, lsl #48
    18a0:      	b	0x183c <_stogir.verify.integer-operations-target-structured+0xcb8>
    18a4:      	cmp	x1, #0x0
    18a8:      	b.ge	0x1cb0 <_stogir.verify.integer-operations-target-structured+0x112c>
    18ac:      	ldr	x6, [sp, #0x278]
    18b0:      	ldr	x7, [x6, #0x8]
    18b4:      	ldr	x8, [sp, #0x270]
    18b8:      	ldr	x9, [x8, #0x8]
    18bc:      	cmp	x7, x9
    18c0:      	b.ne	0x18f4 <_stogir.verify.integer-operations-target-structured+0xd70>
    18c4:      	cmp	x2, x7
    18c8:      	b.gt	0x18ec <_stogir.verify.integer-operations-target-structured+0xd68>
    18cc:      	ldr	x2, [x4, #0x50]
    18d0:      	add	x2, x2, x3, lsl #2
    18d4:      	ldr	w2, [x2]
    18d8:      	sxtw	x2, w2
    18dc:      	cmp	x2, #0x0
    18e0:      	cset	w2, gt
    18e4:      	ubfx	x2, x2, #0, #8
    18e8:      	b	0x1844 <_stogir.verify.integer-operations-target-structured+0xcc0>
    18ec:      	movz	x2, #0x0, lsl #48
    18f0:      	b	0x18e8 <_stogir.verify.integer-operations-target-structured+0xd64>
    18f4:      	movz	x2, #0x0, lsl #48
    18f8:      	b	0x18e8 <_stogir.verify.integer-operations-target-structured+0xd64>
    18fc:      	movz	x2, #0x0, lsl #48
    1900:      	b	0x18e8 <_stogir.verify.integer-operations-target-structured+0xd64>
    1904:      	ldr	x0, [x4, #0x28]
    1908:      	add	x0, x0, x3, lsl #4
    190c:      	b	0x1860 <_stogir.verify.integer-operations-target-structured+0xcdc>
    1910:      	movz	x0, #0x0, lsl #48
    1914:      	b	0x1860 <_stogir.verify.integer-operations-target-structured+0xcdc>
    1918:      	ldr	w0, [x0]
    191c:      	add	x16, sp, #0x20
    1920:      	ldr	w1, [x16]
    1924:      	ubfx	x0, x0, #8, #8
    1928:      	orr	x2, x0, xzr
    192c:      	ubfx	x1, x1, #8, #8
    1930:      	cmp	x1, #0x6
    1934:      	b.ne	0x1a78 <_stogir.verify.integer-operations-target-structured+0xef4>
    1938:      	cmp	x2, #0x6
    193c:      	b.ne	0x1a70 <_stogir.verify.integer-operations-target-structured+0xeec>
    1940:      	cmp	x22, #0x1a
    1944:      	b.ne	0x1a60 <_stogir.verify.integer-operations-target-structured+0xedc>
    1948:      	mov	x1, #0x1                ; =1
    194c:      	cmp	x2, #0x1
    1950:      	cset	w3, ge
    1954:      	uxtb	w16, w3
    1958:      	cmp	w16, wzr
    195c:      	b.eq	0x1cbc <_stogir.verify.integer-operations-target-structured+0x1138>
    1960:      	cmp	x2, #0xb
    1964:      	cset	w7, le
    1968:      	uxtb	w16, w7
    196c:      	cmp	w16, wzr
    1970:      	b.eq	0x1ce4 <_stogir.verify.integer-operations-target-structured+0x1160>
    1974:      	cmp	x23, #0x0
    1978:      	b.eq	0x1d0c <_stogir.verify.integer-operations-target-structured+0x1188>
    197c:      	ldr	w14, [sp, #0x2b0]
    1980:      	str	x4, [sp, #0x238]
    1984:      	str	x5, [sp, #0x280]
    1988:      	str	x6, [sp, #0x278]
    198c:      	str	x8, [sp, #0x270]
    1990:      	mov	x23, x2
    1994:      	str	x26, [sp, #0x2e0]
    1998:      	mov	x26, x1
    199c:      	mov	w1, w0
    19a0:      	mov	w0, w14
    19a4:      	str	x27, [sp, #0x2e8]
    19a8:      	mov	w27, w3
    19ac:      	str	x28, [sp, #0x2f0]
    19b0:      	mov	w28, w7
    19b4:      	bl	0x19b4 <_stogir.verify.integer-operations-target-structured+0xe30>
		00000000000019b4:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    19b8:      	cmp	x0, #0x0
    19bc:      	b.ne	0x1a80 <_stogir.verify.integer-operations-target-structured+0xefc>
    19c0:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		00000000000019c0:  ARM64_RELOC_PAGE21	l_stogir.340
    19c4:      	ldr	x19, [x19]
		00000000000019c4:  ARM64_RELOC_PAGEOFF12	l_stogir.340
    19c8:      	mov	x20, #0x1c              ; =28
    19cc:      	add	x16, sp, #0x20
    19d0:      	ldr	w0, [x16]
    19d4:      	cmp	x25, #0x0
    19d8:      	b.eq	0x1b18 <_stogir.verify.integer-operations-target-structured+0xf94>
    19dc:      	mov	x1, #0x1                ; =1
    19e0:      	ubfx	x0, x0, #8, #8
    19e4:      	sxtw	x1, w1
    19e8:      	cmp	x0, x1
    19ec:      	b.eq	0x19fc <_stogir.verify.integer-operations-target-structured+0xe78>
    19f0:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		00000000000019f0:  ARM64_RELOC_PAGE21	l_stogir.341
    19f4:      	ldr	x19, [x19]
		00000000000019f4:  ARM64_RELOC_PAGEOFF12	l_stogir.341
    19f8:      	mov	x20, #0x26              ; =38
    19fc:      	cmp	x25, #0x0
    1a00:      	b.eq	0x1a08 <_stogir.verify.integer-operations-target-structured+0xe84>
    1a04:      	mov	x21, #0x1               ; =1
    1a08:      	cmp	x21, #0x0
    1a0c:      	b.eq	0x1a5c <_stogir.verify.integer-operations-target-structured+0xed8>
    1a10:      	ldr	x0, [sp, #0x238]
    1a14:      	ldr	w1, [sp, #0x2c8]
    1a18:      	mov	x2, #0x2                ; =2
    1a1c:      	bl	0x1a1c <_stogir.verify.integer-operations-target-structured+0xe98>
		0000000000001a1c:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    1a20:      	ubfx	x0, x0, #0, #32
    1a24:      	lsr	x16, x0, #0
    1a28:      	cmp	x16, #0x1
    1a2c:      	b.eq	0x1a48 <_stogir.verify.integer-operations-target-structured+0xec4>
    1a30:      	b.lo	0x1a38 <_stogir.verify.integer-operations-target-structured+0xeb4>
    1a34:      	b	0x1a4c <_stogir.verify.integer-operations-target-structured+0xec8>
    1a38:      	cmp	x16, #0x0
    1a3c:      	b.eq	0x1a44 <_stogir.verify.integer-operations-target-structured+0xec0>
    1a40:      	b	0x1a4c <_stogir.verify.integer-operations-target-structured+0xec8>
    1a44:      	b	0x1a50 <_stogir.verify.integer-operations-target-structured+0xecc>
    1a48:      	b	0x1b20 <_stogir.verify.integer-operations-target-structured+0xf9c>
    1a4c:      	b	0x1b7c <_stogir.verify.integer-operations-target-structured+0xff8>
    1a50:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001a50:  ARM64_RELOC_PAGE21	l_stogir.342
    1a54:      	ldr	x19, [x19]
		0000000000001a54:  ARM64_RELOC_PAGEOFF12	l_stogir.342
    1a58:      	mov	x20, #0x1d              ; =29
    1a5c:      	b	0x1890 <_stogir.verify.integer-operations-target-structured+0xd0c>
    1a60:      	cmp	x22, #0x1b
    1a64:      	cset	w1, eq
    1a68:      	ubfx	x1, x1, #0, #8
    1a6c:      	b	0x194c <_stogir.verify.integer-operations-target-structured+0xdc8>
    1a70:      	movz	x1, #0x0, lsl #48
    1a74:      	b	0x194c <_stogir.verify.integer-operations-target-structured+0xdc8>
    1a78:      	movz	x1, #0x0, lsl #48
    1a7c:      	b	0x194c <_stogir.verify.integer-operations-target-structured+0xdc8>
    1a80:      	cmp	x21, #0x0
    1a84:      	b.eq	0x19cc <_stogir.verify.integer-operations-target-structured+0xe48>
    1a88:      	cmp	x22, #0x3a
    1a8c:      	cset	w0, eq
    1a90:      	cmp	x22, #0x1a
    1a94:      	b.lt	0x1af0 <_stogir.verify.integer-operations-target-structured+0xf6c>
    1a98:      	cmp	x22, #0x1e
    1a9c:      	b.gt	0x1af0 <_stogir.verify.integer-operations-target-structured+0xf6c>
    1aa0:      	uxtb	w16, w27
    1aa4:      	cmp	w16, wzr
    1aa8:      	b.eq	0x19c0 <_stogir.verify.integer-operations-target-structured+0xe3c>
    1aac:      	uxtb	w16, w28
    1ab0:      	cmp	w16, wzr
    1ab4:      	b.eq	0x19c0 <_stogir.verify.integer-operations-target-structured+0xe3c>
    1ab8:      	cmp	x23, #0x1
    1abc:      	b.ne	0x19cc <_stogir.verify.integer-operations-target-structured+0xe48>
    1ac0:      	cmp	x22, #0x2e
    1ac4:      	b.eq	0x19cc <_stogir.verify.integer-operations-target-structured+0xe48>
    1ac8:      	cmp	x22, #0x2f
    1acc:      	b.eq	0x19cc <_stogir.verify.integer-operations-target-structured+0xe48>
    1ad0:      	cmp	x22, #0x30
    1ad4:      	b.eq	0x19cc <_stogir.verify.integer-operations-target-structured+0xe48>
    1ad8:      	uxtb	w16, w0
    1adc:      	cmp	w16, wzr
    1ae0:      	b.ne	0x19cc <_stogir.verify.integer-operations-target-structured+0xe48>
    1ae4:      	cmp	x22, #0x3b
    1ae8:      	b.ne	0x19c0 <_stogir.verify.integer-operations-target-structured+0xe3c>
    1aec:      	b	0x19cc <_stogir.verify.integer-operations-target-structured+0xe48>
    1af0:      	cmp	x22, #0x2e
    1af4:      	b.lt	0x1b00 <_stogir.verify.integer-operations-target-structured+0xf7c>
    1af8:      	cmp	x22, #0x35
    1afc:      	b.le	0x1aa0 <_stogir.verify.integer-operations-target-structured+0xf1c>
    1b00:      	uxtb	w16, w0
    1b04:      	cmp	w16, wzr
    1b08:      	b.ne	0x1aa0 <_stogir.verify.integer-operations-target-structured+0xf1c>
    1b0c:      	cmp	x22, #0x3b
    1b10:      	b.eq	0x1aa0 <_stogir.verify.integer-operations-target-structured+0xf1c>
    1b14:      	b	0x19c0 <_stogir.verify.integer-operations-target-structured+0xe3c>
    1b18:      	mov	x1, x23
    1b1c:      	b	0x19e0 <_stogir.verify.integer-operations-target-structured+0xe5c>
    1b20:      	ldr	x0, [sp, #0x238]
    1b24:      	bl	0x1b24 <_stogir.verify.integer-operations-target-structured+0xfa0>
		0000000000001b24:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    1b28:      	cmp	x0, #0x0
    1b2c:      	b.ne	0x1b40 <_stogir.verify.integer-operations-target-structured+0xfbc>
    1b30:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001b30:  ARM64_RELOC_PAGE21	l_stogir.342
    1b34:      	ldr	x19, [x19]
		0000000000001b34:  ARM64_RELOC_PAGEOFF12	l_stogir.342
    1b38:      	mov	x20, #0x1d              ; =29
    1b3c:      	b	0x1a5c <_stogir.verify.integer-operations-target-structured+0xed8>
    1b40:      	ldr	w0, [x0]
    1b44:      	ubfx	x0, x0, #8, #8
    1b48:      	cmp	x23, x0
    1b4c:      	b.eq	0x1b68 <_stogir.verify.integer-operations-target-structured+0xfe4>
    1b50:      	cmp	x26, #0x0
    1b54:      	b.eq	0x1b6c <_stogir.verify.integer-operations-target-structured+0xfe8>
    1b58:      	cmp	x0, #0x5
    1b5c:      	b.eq	0x1b68 <_stogir.verify.integer-operations-target-structured+0xfe4>
    1b60:      	cmp	x0, #0xb
    1b64:      	b.ne	0x1b6c <_stogir.verify.integer-operations-target-structured+0xfe8>
    1b68:      	b	0x1b3c <_stogir.verify.integer-operations-target-structured+0xfb8>
    1b6c:      	adrp	x19, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001b6c:  ARM64_RELOC_PAGE21	l_stogir.343
    1b70:      	ldr	x19, [x19]
		0000000000001b70:  ARM64_RELOC_PAGEOFF12	l_stogir.343
    1b74:      	mov	x20, #0x1d              ; =29
    1b78:      	b	0x1b68 <_stogir.verify.integer-operations-target-structured+0xfe4>
    1b7c:      	brk	#0
    1b80:      	b	0x1b7c <_stogir.verify.integer-operations-target-structured+0xff8>
    1b84:      	brk	#0
    1b88:      	b	0x1b84 <_stogir.verify.integer-operations-target-structured+0x1000>
    1b8c:      	brk	#0
    1b90:      	b	0x1b8c <_stogir.verify.integer-operations-target-structured+0x1008>
    1b94:      	cmp	x20, #0x0
    1b98:      	b.ne	0x1bf0 <_stogir.verify.integer-operations-target-structured+0x106c>
    1b9c:      	and	x19, x24, #0xffffffff
    1ba0:      	movz	x0, #0x0, lsl #48
    1ba4:      	movz	x20, #0x0, lsl #48
    1ba8:      	ldr	x1, [sp, #0x268]
    1bac:      	str	x0, [x1]
    1bb0:      	str	x19, [x1, #0x8]
    1bb4:      	str	x20, [x1, #0x10]
    1bb8:      	ldr	x19, [sp, #0x2f8]
    1bbc:      	ldr	x20, [sp, #0x300]
    1bc0:      	ldr	x21, [sp, #0x308]
    1bc4:      	ldr	x22, [sp, #0x310]
    1bc8:      	ldr	x23, [sp, #0x318]
    1bcc:      	ldr	x24, [sp, #0x320]
    1bd0:      	ldr	x25, [sp, #0x328]
    1bd4:      	ldr	x26, [sp, #0x330]
    1bd8:      	ldr	x27, [sp, #0x338]
    1bdc:      	ldr	x28, [sp, #0x340]
    1be0:      	ldr	x29, [sp, #0x10]
    1be4:      	ldr	x30, [sp, #0x18]
    1be8:      	add	sp, sp, #0x350
    1bec:      	ret
    1bf0:      	mov	x0, #0x1                ; =1
    1bf4:      	b	0x1ba8 <_stogir.verify.integer-operations-target-structured+0x1024>
    1bf8:      	mov	x24, x10
    1bfc:      	str	x8, [sp, #0x268]
    1c00:      	mov	x19, x11
    1c04:      	mov	x20, x12
    1c08:      	b	0x1b94 <_stogir.verify.integer-operations-target-structured+0x1010>
    1c0c:      	mov	x24, x10
    1c10:      	str	x8, [sp, #0x268]
    1c14:      	mov	x19, x11
    1c18:      	mov	x20, x12
    1c1c:      	b	0x1b94 <_stogir.verify.integer-operations-target-structured+0x1010>
    1c20:      	str	x0, [sp, #0x238]
    1c24:      	b	0x1484 <_stogir.verify.integer-operations-target-structured+0x900>
    1c28:      	ldr	x0, [sp, #0x2d0]
    1c2c:      	b	0x1074 <_stogir.verify.integer-operations-target-structured+0x4f0>
    1c30:      	str	x0, [sp, #0x2d0]
    1c34:      	ldr	x0, [sp, #0x2c0]
    1c38:      	b	0x10ec <_stogir.verify.integer-operations-target-structured+0x568>
    1c3c:      	str	x0, [sp, #0x2c0]
    1c40:      	ldr	x0, [sp, #0x2a8]
    1c44:      	b	0x1168 <_stogir.verify.integer-operations-target-structured+0x5e4>
    1c48:      	str	x0, [sp, #0x2a8]
    1c4c:      	ldr	x0, [sp, #0x2a0]
    1c50:      	b	0x11e4 <_stogir.verify.integer-operations-target-structured+0x660>
    1c54:      	str	x0, [sp, #0x2a0]
    1c58:      	ldr	x0, [sp, #0x298]
    1c5c:      	b	0x1248 <_stogir.verify.integer-operations-target-structured+0x6c4>
    1c60:      	str	x0, [sp, #0x298]
    1c64:      	b	0x1290 <_stogir.verify.integer-operations-target-structured+0x70c>
    1c68:      	str	x25, [sp, #0x248]
    1c6c:      	mov	x25, x0
    1c70:      	ldr	x0, [sp, #0x288]
    1c74:      	b	0x1318 <_stogir.verify.integer-operations-target-structured+0x794>
    1c78:      	ldr	x25, [sp, #0x240]
    1c7c:      	b	0x17d4 <_stogir.verify.integer-operations-target-structured+0xc50>
    1c80:      	ldr	x25, [sp, #0x240]
    1c84:      	b	0x17cc <_stogir.verify.integer-operations-target-structured+0xc48>
    1c88:      	str	x26, [sp, #0x2e0]
    1c8c:      	str	x27, [sp, #0x2e8]
    1c90:      	str	x28, [sp, #0x2f0]
    1c94:      	str	x0, [sp, #0x288]
    1c98:      	b	0x13f8 <_stogir.verify.integer-operations-target-structured+0x874>
    1c9c:      	ldr	x4, [sp, #0x238]
    1ca0:      	ldr	x5, [sp, #0x280]
    1ca4:      	b	0x18a4 <_stogir.verify.integer-operations-target-structured+0xd20>
    1ca8:      	ldr	x5, [sp, #0x280]
    1cac:      	b	0x189c <_stogir.verify.integer-operations-target-structured+0xd18>
    1cb0:      	ldr	x6, [sp, #0x278]
    1cb4:      	ldr	x8, [sp, #0x270]
    1cb8:      	b	0x18fc <_stogir.verify.integer-operations-target-structured+0xd78>
    1cbc:      	str	x4, [sp, #0x238]
    1cc0:      	str	x26, [sp, #0x2e0]
    1cc4:      	mov	x26, x1
    1cc8:      	str	x27, [sp, #0x2e8]
    1ccc:      	str	x28, [sp, #0x2f0]
    1cd0:      	mov	x23, x2
    1cd4:      	str	x5, [sp, #0x280]
    1cd8:      	str	x6, [sp, #0x278]
    1cdc:      	str	x8, [sp, #0x270]
    1ce0:      	b	0x19c0 <_stogir.verify.integer-operations-target-structured+0xe3c>
    1ce4:      	str	x4, [sp, #0x238]
    1ce8:      	str	x26, [sp, #0x2e0]
    1cec:      	mov	x26, x1
    1cf0:      	str	x27, [sp, #0x2e8]
    1cf4:      	str	x28, [sp, #0x2f0]
    1cf8:      	mov	x23, x2
    1cfc:      	str	x5, [sp, #0x280]
    1d00:      	str	x6, [sp, #0x278]
    1d04:      	str	x8, [sp, #0x270]
    1d08:      	b	0x19c0 <_stogir.verify.integer-operations-target-structured+0xe3c>
    1d0c:      	str	x4, [sp, #0x238]
    1d10:      	str	x26, [sp, #0x2e0]
    1d14:      	mov	x26, x1
    1d18:      	str	x27, [sp, #0x2e8]
    1d1c:      	str	x28, [sp, #0x2f0]
    1d20:      	mov	x23, x2
    1d24:      	mov	w27, w3
    1d28:      	mov	w28, w7
    1d2c:      	str	x5, [sp, #0x280]
    1d30:      	str	x6, [sp, #0x278]
    1d34:      	str	x8, [sp, #0x270]
    1d38:      	b	0x1a80 <_stogir.verify.integer-operations-target-structured+0xefc>

0000000000001d3c <_coil.core.Eq$slice<u8>$=>:
    1d3c:      	sub	sp, sp, #0x10
    1d40:      	str	x29, [sp]
    1d44:      	str	x30, [sp, #0x8]
    1d48:      	mov	x29, sp
    1d4c:      	cmp	x1, x3
    1d50:      	b.ne	0x1d8c <_coil.core.Eq$slice<u8>$=+0x50>
    1d54:      	cmp	x1, #0x0
    1d58:      	b.ne	0x1d64 <_coil.core.Eq$slice<u8>$=+0x28>
    1d5c:      	mov	x0, #0x1                ; =1
    1d60:      	b	0x1d88 <_coil.core.Eq$slice<u8>$=+0x4c>
    1d64:      	lsr	x1, x1, #0
    1d68:      	fmov	d31, x1
    1d6c:      	mov	x1, x2
    1d70:      	fmov	x2, d31
    1d74:      	bl	0x1d74 <_coil.core.Eq$slice<u8>$=+0x38>
		0000000000001d74:  ARM64_RELOC_BRANCH26	_memcmp
    1d78:      	sxtw	x0, w0
    1d7c:      	cmp	x0, #0x0
    1d80:      	cset	w0, eq
    1d84:      	ubfx	x0, x0, #0, #8
    1d88:      	b	0x1d90 <_coil.core.Eq$slice<u8>$=+0x54>
    1d8c:      	movz	x0, #0x0, lsl #48
    1d90:      	ldr	x29, [sp]
    1d94:      	ldr	x30, [sp, #0x8]
    1d98:      	add	sp, sp, #0x10
    1d9c:      	ret

0000000000001da0 <_stogir.types.valid?>:
    1da0:      	sxtw	x1, w0
    1da4:      	cmp	x1, #0x0
    1da8:      	b.lt	0x1dbc <_stogir.types.valid?+0x1c>
    1dac:      	cmp	x1, #0xd
    1db0:      	b.gt	0x1dbc <_stogir.types.valid?+0x1c>
    1db4:      	mov	x0, #0x1                ; =1
    1db8:      	b	0x1df8 <_stogir.types.valid?+0x58>
    1dbc:      	cmp	x1, #0xf
    1dc0:      	b.le	0x1df4 <_stogir.types.valid?+0x54>
    1dc4:      	cmp	x1, #0x80
    1dc8:      	b.ge	0x1dec <_stogir.types.valid?+0x4c>
    1dcc:      	and	w0, w0, #0xf
    1dd0:      	ubfx	x0, x0, #0, #32
    1dd4:      	cmp	x0, #0x1
    1dd8:      	b.lt	0x1dfc <_stogir.types.valid?+0x5c>
    1ddc:      	cmp	x0, #0xd
    1de0:      	cset	w0, le
    1de4:      	ubfx	x0, x0, #0, #8
    1de8:      	b	0x1e00 <_stogir.types.valid?+0x60>
    1dec:      	movz	x0, #0x0, lsl #48
    1df0:      	b	0x1df8 <_stogir.types.valid?+0x58>
    1df4:      	movz	x0, #0x0, lsl #48
    1df8:      	ret
    1dfc:      	movz	x0, #0x0, lsl #48
    1e00:      	b	0x1df0 <_stogir.types.valid?+0x50>

0000000000001e04 <_stogir.opcode.input-count>:
    1e04:      	sxtw	x0, w0
    1e08:      	cmp	x0, #0x0
    1e0c:      	b.lt	0x1e30 <_stogir.opcode.input-count+0x2c>
    1e10:      	cmp	x0, #0x83
    1e14:      	b.ge	0x1e30 <_stogir.opcode.input-count+0x2c>
    1e18:      	adrp	x16, 0x1000 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001e18:  ARM64_RELOC_PAGE21	l_stogir.344
    1e1c:      	ldr	x16, [x16]
		0000000000001e1c:  ARM64_RELOC_PAGEOFF12	l_stogir.344
    1e20:      	add	x0, x16, x0
    1e24:      	ldrsb	w0, [x0]
    1e28:      	sxtb	x0, w0
    1e2c:      	b	0x1e34 <_stogir.opcode.input-count+0x30>
    1e30:      	mov	x0, #-0x2               ; =-2
    1e34:      	ret

0000000000001e38 <_stogir.graph.operand>:
    1e38:      	sub	sp, sp, #0x10
    1e3c:      	mov	x3, sp
    1e40:      	sxtw	x1, w1
    1e44:      	cmp	x1, #0x0
    1e48:      	b.le	0x1e8c <_stogir.graph.operand+0x54>
    1e4c:      	lsl	x4, x1, #2
    1e50:      	ldr	x5, [x0, #0x8]
    1e54:      	cmp	x1, x5
    1e58:      	b.ge	0x1ec0 <_stogir.graph.operand+0x88>
    1e5c:      	add	x5, x0, #0x78
    1e60:      	ldr	x5, [x5, #0x8]
    1e64:      	cmp	x1, x5
    1e68:      	b.ge	0x1eb8 <_stogir.graph.operand+0x80>
    1e6c:      	ldr	x5, [x0, #0x78]
    1e70:      	add	x5, x4, x5
    1e74:      	ldr	w5, [x5]
    1e78:      	sxtw	x5, w5
    1e7c:      	cmp	x5, #0x0
    1e80:      	cset	w5, ge
    1e84:      	ubfx	x5, x5, #0, #8
    1e88:      	b	0x1ebc <_stogir.graph.operand+0x84>
    1e8c:      	movz	x1, #0x0, lsl #48
    1e90:      	movz	x0, #0x0, lsl #48
    1e94:      	str	x1, [x3]
    1e98:      	str	x0, [x3, #0x8]
    1e9c:      	ldr	x0, [sp]
    1ea0:      	ldr	x1, [sp, #0x8]
    1ea4:      	add	sp, sp, #0x10
    1ea8:      	ret
    1eac:      	movz	x1, #0x0, lsl #48
    1eb0:      	movz	x0, #0x0, lsl #48
    1eb4:      	b	0x1e94 <_stogir.graph.operand+0x5c>
    1eb8:      	movz	x5, #0x0, lsl #48
    1ebc:      	b	0x1ec4 <_stogir.graph.operand+0x8c>
    1ec0:      	movz	x5, #0x0, lsl #48
    1ec4:      	cmp	x5, #0x0
    1ec8:      	b.eq	0x1e8c <_stogir.graph.operand+0x54>
    1ecc:      	sxtw	x2, w2
    1ed0:      	cmp	x2, #0x1
    1ed4:      	b.lt	0x1eac <_stogir.graph.operand+0x74>
    1ed8:      	ldr	x5, [x0, #0x78]
    1edc:      	add	x4, x4, x5
    1ee0:      	ldr	w4, [x4]
    1ee4:      	sxtw	x4, w4
    1ee8:      	cmp	x2, x4
    1eec:      	b.gt	0x1eac <_stogir.graph.operand+0x74>
    1ef0:      	asr	x16, x2, #63
    1ef4:      	lsr	x16, x16, #62
    1ef8:      	add	x4, x2, x16
    1efc:      	asr	x4, x4, #2
    1f00:      	asr	x16, x2, #63
    1f04:      	lsr	x16, x16, #62
    1f08:      	add	x2, x2, x16
    1f0c:      	and	x2, x2, #0x3
    1f10:      	sub	x2, x2, x16
    1f14:      	ldr	x0, [x0]
    1f18:      	add	x1, x4, x1
    1f1c:      	add	x0, x0, x1, lsl #4
    1f20:      	add	x0, x0, x2, lsl #2
    1f24:      	ldr	w0, [x0]
    1f28:      	sxtw	x0, w0
    1f2c:      	and	x0, x0, #0xffffffff
    1f30:      	mov	x1, #0x1                ; =1
    1f34:      	b	0x1eb4 <_stogir.graph.operand+0x7c>

0000000000001f38 <_stogir.graph.borrow-node>:
    1f38:      	sxtw	x1, w1
    1f3c:      	cmp	x1, #0x0
    1f40:      	cset	w2, gt
    1f44:      	movz	x16, #0x0, lsl #48
    1f48:      	sub	x3, x16, x1
    1f4c:      	sub	x4, x3, #0x1
    1f50:      	uxtb	w16, w2
    1f54:      	cmp	w16, wzr
    1f58:      	b.eq	0x1f98 <_stogir.graph.borrow-node+0x60>
    1f5c:      	ldr	x3, [x0, #0x8]
    1f60:      	cmp	x1, x3
    1f64:      	b.ge	0x1fe8 <_stogir.graph.borrow-node+0xb0>
    1f68:      	add	x3, x0, #0x78
    1f6c:      	ldr	x3, [x3, #0x8]
    1f70:      	cmp	x1, x3
    1f74:      	b.ge	0x2028 <_stogir.graph.borrow-node+0xf0>
    1f78:      	ldr	x3, [x0, #0x78]
    1f7c:      	add	x3, x3, x1, lsl #2
    1f80:      	ldr	w3, [x3]
    1f84:      	sxtw	x3, w3
    1f88:      	cmp	x3, #0x0
    1f8c:      	cset	w3, ge
    1f90:      	ubfx	x3, x3, #0, #8
    1f94:      	b	0x202c <_stogir.graph.borrow-node+0xf4>
    1f98:      	cmp	x1, #0x0
    1f9c:      	b.ge	0x1ff0 <_stogir.graph.borrow-node+0xb8>
    1fa0:      	add	x5, x0, #0x28
    1fa4:      	add	x6, x0, #0x50
    1fa8:      	ldr	x5, [x5, #0x8]
    1fac:      	ldr	x6, [x6, #0x8]
    1fb0:      	cmp	x5, x6
    1fb4:      	b.ne	0x1fe0 <_stogir.graph.borrow-node+0xa8>
    1fb8:      	cmp	x3, x5
    1fbc:      	b.gt	0x2030 <_stogir.graph.borrow-node+0xf8>
    1fc0:      	ldr	x3, [x0, #0x50]
    1fc4:      	add	x3, x3, x4, lsl #2
    1fc8:      	ldr	w3, [x3]
    1fcc:      	sxtw	x3, w3
    1fd0:      	cmp	x3, #0x0
    1fd4:      	cset	w3, gt
    1fd8:      	ubfx	x3, x3, #0, #8
    1fdc:      	b	0x2034 <_stogir.graph.borrow-node+0xfc>
    1fe0:      	movz	x3, #0x0, lsl #48
    1fe4:      	b	0x1ff4 <_stogir.graph.borrow-node+0xbc>
    1fe8:      	movz	x3, #0x0, lsl #48
    1fec:      	b	0x1ff4 <_stogir.graph.borrow-node+0xbc>
    1ff0:      	movz	x3, #0x0, lsl #48
    1ff4:      	cmp	x3, #0x0
    1ff8:      	b.eq	0x2020 <_stogir.graph.borrow-node+0xe8>
    1ffc:      	uxtb	w16, w2
    2000:      	cmp	w16, wzr
    2004:      	b.eq	0x2014 <_stogir.graph.borrow-node+0xdc>
    2008:      	ldr	x0, [x0]
    200c:      	add	x0, x0, x1, lsl #4
    2010:      	b	0x201c <_stogir.graph.borrow-node+0xe4>
    2014:      	ldr	x0, [x0, #0x28]
    2018:      	add	x0, x0, x4, lsl #4
    201c:      	b	0x2024 <_stogir.graph.borrow-node+0xec>
    2020:      	movz	x0, #0x0, lsl #48
    2024:      	ret
    2028:      	movz	x3, #0x0, lsl #48
    202c:      	b	0x1fec <_stogir.graph.borrow-node+0xb4>
    2030:      	movz	x3, #0x0, lsl #48
    2034:      	b	0x1fe4 <_stogir.graph.borrow-node+0xac>

0000000000002038 <_stogir.verify.classifications>:
    2038:      	sub	sp, sp, #0x70
    203c:      	str	x29, [sp]
    2040:      	str	x30, [sp, #0x8]
    2044:      	mov	x29, sp
    2048:      	str	x19, [sp, #0x20]
    204c:      	str	x20, [sp, #0x28]
    2050:      	str	x21, [sp, #0x30]
    2054:      	str	x22, [sp, #0x38]
    2058:      	str	x23, [sp, #0x40]
    205c:      	str	x24, [sp, #0x48]
    2060:      	str	x25, [sp, #0x50]
    2064:      	str	x26, [sp, #0x58]
    2068:      	str	x27, [sp, #0x60]
    206c:      	str	x28, [sp, #0x68]
    2070:      	ldr	w4, [x2]
    2074:      	orr	x5, x4, xzr
    2078:      	ubfx	x5, x5, #8, #8
    207c:      	orr	x19, x5, xzr
    2080:      	cmp	x19, #0xf
    2084:      	b.le	0x20b8 <_stogir.verify.classifications+0x80>
    2088:      	cmp	x19, #0x80
    208c:      	b.ge	0x20b0 <_stogir.verify.classifications+0x78>
    2090:      	and	w5, w5, #0xf
    2094:      	ubfx	x5, x5, #0, #32
    2098:      	cmp	x5, #0x1
    209c:      	b.lt	0x2590 <_stogir.verify.classifications+0x558>
    20a0:      	cmp	x5, #0xd
    20a4:      	cset	w5, le
    20a8:      	ubfx	x20, x5, #0, #8
    20ac:      	b	0x2594 <_stogir.verify.classifications+0x55c>
    20b0:      	movz	x20, #0x0, lsl #48
    20b4:      	b	0x20bc <_stogir.verify.classifications+0x84>
    20b8:      	movz	x20, #0x0, lsl #48
    20bc:      	uxtb	w21, w4
    20c0:      	orr	x4, x21, xzr
    20c4:      	mov	x22, x0
    20c8:      	mov	w0, w4
    20cc:      	mov	w23, w1
    20d0:      	mov	x24, x2
    20d4:      	mov	w25, w3
    20d8:      	bl	0x20d8 <_stogir.verify.classifications+0xa0>
		00000000000020d8:  ARM64_RELOC_BRANCH26	_stogir.floating.operation?
    20dc:      	cmp	x0, #0x0
    20e0:      	b.eq	0x20fc <_stogir.verify.classifications+0xc4>
    20e4:      	cmp	x20, #0x0
    20e8:      	cset	w0, ne
    20ec:      	uxtb	w16, w0
    20f0:      	cmp	w16, wzr
    20f4:      	cset	x26, eq
    20f8:      	b	0x2100 <_stogir.verify.classifications+0xc8>
    20fc:      	movz	x26, #0x0, lsl #48
    2100:      	cmp	x26, #0x0
    2104:      	cset	w27, ne
    2108:      	uxtb	w16, w27
    210c:      	cmp	w16, wzr
    2110:      	b.eq	0x2144 <_stogir.verify.classifications+0x10c>
    2114:      	ldr	w0, [x24, #0x4]
    2118:      	mov	w1, w0
    211c:      	mov	x0, x22
    2120:      	bl	0x2120 <_stogir.verify.classifications+0xe8>
		0000000000002120:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    2124:      	cmp	x0, #0x0
    2128:      	b.ne	0x2134 <_stogir.verify.classifications+0xfc>
    212c:      	movn	w28, #0x0, lsl #16
    2130:      	b	0x2140 <_stogir.verify.classifications+0x108>
    2134:      	ldr	w0, [x0]
    2138:      	ubfx	x0, x0, #8, #8
    213c:      	orr	x28, x0, xzr
    2140:      	b	0x2148 <_stogir.verify.classifications+0x110>
    2144:      	movn	w28, #0x0, lsl #16
    2148:      	sxtw	x0, w28
    214c:      	cmp	x26, #0x0
    2150:      	b.eq	0x25ec <_stogir.verify.classifications+0x5b4>
    2154:      	mov	x26, x0
    2158:      	mov	w0, w28
    215c:      	bl	0x215c <_stogir.verify.classifications+0x124>
		000000000000215c:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    2160:      	cmp	x0, #0x0
    2164:      	b.eq	0x2580 <_stogir.verify.classifications+0x548>
    2168:      	movz	x0, #0x0, lsl #48
    216c:      	b	0x2174 <_stogir.verify.classifications+0x13c>
    2170:      	mov	x0, #0x1                ; =1
    2174:      	b	0x218c <_stogir.verify.classifications+0x154>
    2178:      	movz	x19, #0x0, lsl #48
    217c:      	b	0x2204 <_stogir.verify.classifications+0x1cc>
    2180:      	movz	x20, #0x0, lsl #48
    2184:      	b	0x220c <_stogir.verify.classifications+0x1d4>
    2188:      	movz	x0, #0x0, lsl #48
    218c:      	sxtw	x25, w25
    2190:      	cmp	x26, #0xf
    2194:      	cset	w1, gt
    2198:      	cmp	x26, #0x80
    219c:      	cset	w2, lt
    21a0:      	cmp	x21, #0x83
    21a4:      	cset	w3, lt
    21a8:      	add	x4, x22, #0x78
    21ac:      	add	x5, x22, #0x28
    21b0:      	add	x6, x22, #0x50
    21b4:      	sxtw	x23, w23
    21b8:      	add	x7, x22, #0x78
    21bc:      	and	w8, w28, #0xf
    21c0:      	adrp	x16, 0x2000 <_stogir.graph.borrow-node+0xc8>
		00000000000021c0:  ARM64_RELOC_PAGE21	l_stogir.345
    21c4:      	ldr	x16, [x16]
		00000000000021c4:  ARM64_RELOC_PAGEOFF12	l_stogir.345
    21c8:      	add	x9, x16, x21, lsl #2
    21cc:      	cmp	x23, #0x0
    21d0:      	cset	w10, le
    21d4:      	lsl	x11, x23, #2
    21d8:      	ubfx	x8, x8, #0, #32
    21dc:      	cmp	x8, #0x1
    21e0:      	cset	w12, ge
    21e4:      	cmp	x8, #0xd
    21e8:      	cset	w8, le
    21ec:      	ubfx	x8, x8, #0, #8
    21f0:      	mov	x13, #0x1               ; =1
    21f4:      	b	0x22ac <_stogir.verify.classifications+0x274>
    21f8:      	movz	x19, #0x0, lsl #48
    21fc:      	b	0x222c <_stogir.verify.classifications+0x1f4>
    2200:      	movz	x19, #0x0, lsl #48
    2204:      	b	0x2234 <_stogir.verify.classifications+0x1fc>
    2208:      	movz	x20, #0x0, lsl #48
    220c:      	b	0x22a4 <_stogir.verify.classifications+0x26c>
    2210:      	sub	w14, w14, #0x1
    2214:      	lsl	w14, w14, #2
    2218:      	ubfx	x14, x14, #0, #32
    221c:      	lsr	x14, x19, x14
    2220:      	and	w14, w14, #0xf
    2224:      	b	0x22f0 <_stogir.verify.classifications+0x2b8>
    2228:      	movz	x19, #0x0, lsl #48
    222c:      	b	0x2234 <_stogir.verify.classifications+0x1fc>
    2230:      	movz	x19, #0x0, lsl #48
    2234:      	cmp	x19, #0x0
    2238:      	b.eq	0x2260 <_stogir.verify.classifications+0x228>
    223c:      	uxtb	w16, w15
    2240:      	cmp	w16, wzr
    2244:      	b.eq	0x2254 <_stogir.verify.classifications+0x21c>
    2248:      	ldr	x15, [x22]
    224c:      	add	x14, x15, x14, lsl #4
    2250:      	b	0x225c <_stogir.verify.classifications+0x224>
    2254:      	ldr	x14, [x22, #0x28]
    2258:      	add	x14, x14, x21, lsl #4
    225c:      	b	0x2264 <_stogir.verify.classifications+0x22c>
    2260:      	movz	x14, #0x0, lsl #48
    2264:      	cmp	x14, #0x0
    2268:      	b.eq	0x22a4 <_stogir.verify.classifications+0x26c>
    226c:      	ldr	w14, [x14]
    2270:      	ubfx	x14, x14, #8, #8
    2274:      	orr	x15, x14, xzr
    2278:      	cmp	x15, #0xf
    227c:      	b.le	0x22a4 <_stogir.verify.classifications+0x26c>
    2280:      	cmp	x15, #0x80
    2284:      	b.ge	0x22a4 <_stogir.verify.classifications+0x26c>
    2288:      	and	w14, w14, #0xf
    228c:      	ubfx	x14, x14, #0, #32
    2290:      	cmp	x14, #0x1
    2294:      	b.lt	0x22a4 <_stogir.verify.classifications+0x26c>
    2298:      	cmp	x14, #0xd
    229c:      	b.gt	0x22a4 <_stogir.verify.classifications+0x26c>
    22a0:      	mov	x20, #0x1               ; =1
    22a4:      	add	x13, x13, #0x1
    22a8:      	sxtw	x13, w13
    22ac:      	cmp	x20, #0x0
    22b0:      	b.ne	0x242c <_stogir.verify.classifications+0x3f4>
    22b4:      	cmp	x13, x25
    22b8:      	b.gt	0x242c <_stogir.verify.classifications+0x3f4>
    22bc:      	orr	w14, w13, wzr
    22c0:      	sxtw	x15, w14
    22c4:      	uxtb	w16, w3
    22c8:      	cmp	w16, wzr
    22cc:      	b.eq	0x22f4 <_stogir.verify.classifications+0x2bc>
    22d0:      	ldr	w19, [x9]
    22d4:      	cmp	x15, #0x0
    22d8:      	b.le	0x22ec <_stogir.verify.classifications+0x2b4>
    22dc:      	cmp	x15, #0x4
    22e0:      	b.le	0x2210 <_stogir.verify.classifications+0x1d8>
    22e4:      	mov	w14, #0x4               ; =4
    22e8:      	b	0x2214 <_stogir.verify.classifications+0x1dc>
    22ec:      	movz	w14, #0x0, lsl #16
    22f0:      	b	0x22f8 <_stogir.verify.classifications+0x2c0>
    22f4:      	movz	w14, #0x0, lsl #16
    22f8:      	adrp	x16, 0x2000 <_stogir.graph.borrow-node+0xc8>
		00000000000022f8:  ARM64_RELOC_PAGE21	l_stogir.346
    22fc:      	ldr	x16, [x16]
		00000000000022fc:  ARM64_RELOC_PAGEOFF12	l_stogir.346
    2300:      	ldr	w19, [x16]
    2304:      	ubfx	x14, x14, #0, #32
    2308:      	cmp	x14, x19
    230c:      	b.eq	0x2324 <_stogir.verify.classifications+0x2ec>
    2310:      	adrp	x16, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002310:  ARM64_RELOC_PAGE21	l_stogir.347
    2314:      	ldr	x16, [x16]
		0000000000002314:  ARM64_RELOC_PAGEOFF12	l_stogir.347
    2318:      	ldr	w19, [x16]
    231c:      	cmp	x14, x19
    2320:      	b.ne	0x22a4 <_stogir.verify.classifications+0x26c>
    2324:      	cmp	x13, #0x1
    2328:      	b.ne	0x2364 <_stogir.verify.classifications+0x32c>
    232c:      	uxtb	w16, w27
    2330:      	cmp	w16, wzr
    2334:      	b.eq	0x2364 <_stogir.verify.classifications+0x32c>
    2338:      	uxtb	w16, w1
    233c:      	cmp	w16, wzr
    2340:      	b.eq	0x2208 <_stogir.verify.classifications+0x1d0>
    2344:      	uxtb	w16, w2
    2348:      	cmp	w16, wzr
    234c:      	b.eq	0x2180 <_stogir.verify.classifications+0x148>
    2350:      	uxtb	w16, w12
    2354:      	cmp	w16, wzr
    2358:      	b.eq	0x2534 <_stogir.verify.classifications+0x4fc>
    235c:      	mov	x20, x8
    2360:      	b	0x2538 <_stogir.verify.classifications+0x500>
    2364:      	cmp	x13, #0x1
    2368:      	b.ne	0x23cc <_stogir.verify.classifications+0x394>
    236c:      	ldr	w14, [x24, #0x4]
    2370:      	sxtw	x14, w14
    2374:      	cmp	x14, #0x0
    2378:      	cset	w15, gt
    237c:      	movz	x16, #0x0, lsl #48
    2380:      	sub	x19, x16, x14
    2384:      	sub	x21, x19, #0x1
    2388:      	uxtb	w16, w15
    238c:      	cmp	w16, wzr
    2390:      	b.eq	0x23dc <_stogir.verify.classifications+0x3a4>
    2394:      	ldr	x19, [x22, #0x8]
    2398:      	cmp	x14, x19
    239c:      	b.ge	0x2228 <_stogir.verify.classifications+0x1f0>
    23a0:      	ldr	x19, [x4, #0x8]
    23a4:      	cmp	x14, x19
    23a8:      	b.ge	0x21f8 <_stogir.verify.classifications+0x1c0>
    23ac:      	ldr	x19, [x22, #0x78]
    23b0:      	add	x19, x19, x14, lsl #2
    23b4:      	ldr	w19, [x19]
    23b8:      	sxtw	x19, w19
    23bc:      	cmp	x19, #0x0
    23c0:      	cset	w19, ge
    23c4:      	ubfx	x19, x19, #0, #8
    23c8:      	b	0x21fc <_stogir.verify.classifications+0x1c4>
    23cc:      	cmp	x13, #0x2
    23d0:      	b.ne	0x241c <_stogir.verify.classifications+0x3e4>
    23d4:      	ldr	w14, [x24, #0x8]
    23d8:      	b	0x2370 <_stogir.verify.classifications+0x338>
    23dc:      	cmp	x14, #0x0
    23e0:      	b.ge	0x2230 <_stogir.verify.classifications+0x1f8>
    23e4:      	ldr	x26, [x5, #0x8]
    23e8:      	ldr	x28, [x6, #0x8]
    23ec:      	cmp	x26, x28
    23f0:      	b.ne	0x2200 <_stogir.verify.classifications+0x1c8>
    23f4:      	cmp	x19, x26
    23f8:      	b.gt	0x2178 <_stogir.verify.classifications+0x140>
    23fc:      	ldr	x19, [x22, #0x50]
    2400:      	add	x19, x19, x21, lsl #2
    2404:      	ldr	w19, [x19]
    2408:      	sxtw	x19, w19
    240c:      	cmp	x19, #0x0
    2410:      	cset	w19, gt
    2414:      	ubfx	x19, x19, #0, #8
    2418:      	b	0x217c <_stogir.verify.classifications+0x144>
    241c:      	cmp	x13, #0x3
    2420:      	b.ne	0x2490 <_stogir.verify.classifications+0x458>
    2424:      	ldr	w14, [x24, #0xc]
    2428:      	b	0x23d8 <_stogir.verify.classifications+0x3a0>
    242c:      	uxtb	w20, w20
    2430:      	uxtb	w0, w0
    2434:      	add	x16, sp, #0x10
    2438:      	movz	w17, #0x0, lsl #16
    243c:      	strh	w17, [x16]
    2440:      	add	x16, sp, #0x10
    2444:      	strb	w20, [x16]
    2448:      	add	x16, sp, #0x10
    244c:      	strb	w0, [x16, #0x1]
    2450:      	add	x16, sp, #0x10
    2454:      	ldrh	w0, [x16]
    2458:      	ldr	x19, [sp, #0x20]
    245c:      	ldr	x20, [sp, #0x28]
    2460:      	ldr	x21, [sp, #0x30]
    2464:      	ldr	x22, [sp, #0x38]
    2468:      	ldr	x23, [sp, #0x40]
    246c:      	ldr	x24, [sp, #0x48]
    2470:      	ldr	x25, [sp, #0x50]
    2474:      	ldr	x26, [sp, #0x58]
    2478:      	ldr	x27, [sp, #0x60]
    247c:      	ldr	x28, [sp, #0x68]
    2480:      	ldr	x29, [sp]
    2484:      	ldr	x30, [sp, #0x8]
    2488:      	add	sp, sp, #0x70
    248c:      	ret
    2490:      	uxtb	w16, w10
    2494:      	cmp	w16, wzr
    2498:      	b.ne	0x2540 <_stogir.verify.classifications+0x508>
    249c:      	ldr	x14, [x22, #0x8]
    24a0:      	cmp	x23, x14
    24a4:      	b.ge	0x2540 <_stogir.verify.classifications+0x508>
    24a8:      	ldr	x14, [x7, #0x8]
    24ac:      	cmp	x23, x14
    24b0:      	b.ge	0x2540 <_stogir.verify.classifications+0x508>
    24b4:      	ldr	x14, [x22, #0x78]
    24b8:      	add	x14, x11, x14
    24bc:      	ldr	w14, [x14]
    24c0:      	sxtw	x14, w14
    24c4:      	cmp	x14, #0x0
    24c8:      	b.lt	0x2540 <_stogir.verify.classifications+0x508>
    24cc:      	cmp	x15, #0x1
    24d0:      	b.lt	0x25c8 <_stogir.verify.classifications+0x590>
    24d4:      	ldr	x14, [x22, #0x78]
    24d8:      	add	x14, x11, x14
    24dc:      	ldr	w14, [x14]
    24e0:      	sxtw	x14, w14
    24e4:      	cmp	x15, x14
    24e8:      	b.gt	0x25c8 <_stogir.verify.classifications+0x590>
    24ec:      	ldr	x14, [x22]
    24f0:      	asr	x16, x15, #63
    24f4:      	lsr	x16, x16, #62
    24f8:      	add	x19, x15, x16
    24fc:      	asr	x19, x19, #2
    2500:      	asr	x16, x15, #63
    2504:      	lsr	x16, x16, #62
    2508:      	add	x15, x15, x16
    250c:      	and	x15, x15, #0x3
    2510:      	sub	x15, x15, x16
    2514:      	add	x19, x19, x23
    2518:      	add	x14, x14, x19, lsl #4
    251c:      	add	x14, x14, x15, lsl #2
    2520:      	ldr	w14, [x14]
    2524:      	movn	w17, #0x0, lsl #16
    2528:      	and	w14, w14, w17
    252c:      	mov	w15, #0x1               ; =1
    2530:      	b	0x25d0 <_stogir.verify.classifications+0x598>
    2534:      	movz	x20, #0x0, lsl #48
    2538:      	b	0x2184 <_stogir.verify.classifications+0x14c>
    253c:      	b	0x2428 <_stogir.verify.classifications+0x3f0>
    2540:      	movz	w15, #0x0, lsl #16
    2544:      	movz	w14, #0x0, lsl #16
    2548:      	ubfx	x15, x15, #0, #32
    254c:      	lsr	x16, x15, #0
    2550:      	cmp	x16, #0x1
    2554:      	b.eq	0x2570 <_stogir.verify.classifications+0x538>
    2558:      	b.lo	0x2560 <_stogir.verify.classifications+0x528>
    255c:      	b	0x2574 <_stogir.verify.classifications+0x53c>
    2560:      	cmp	x16, #0x0
    2564:      	b.eq	0x256c <_stogir.verify.classifications+0x534>
    2568:      	b	0x2574 <_stogir.verify.classifications+0x53c>
    256c:      	b	0x2578 <_stogir.verify.classifications+0x540>
    2570:      	b	0x253c <_stogir.verify.classifications+0x504>
    2574:      	b	0x25e4 <_stogir.verify.classifications+0x5ac>
    2578:      	movz	w14, #0x0, lsl #16
    257c:      	b	0x253c <_stogir.verify.classifications+0x504>
    2580:      	cmp	x21, #0x18
    2584:      	b.ne	0x2598 <_stogir.verify.classifications+0x560>
    2588:      	mov	x0, #0x1                ; =1
    258c:      	b	0x2174 <_stogir.verify.classifications+0x13c>
    2590:      	movz	x20, #0x0, lsl #48
    2594:      	b	0x20b4 <_stogir.verify.classifications+0x7c>
    2598:      	cmp	x21, #0x19
    259c:      	b.ne	0x25a8 <_stogir.verify.classifications+0x570>
    25a0:      	mov	x0, #0x1                ; =1
    25a4:      	b	0x2174 <_stogir.verify.classifications+0x13c>
    25a8:      	cmp	x19, #0xc
    25ac:      	b.eq	0x2170 <_stogir.verify.classifications+0x138>
    25b0:      	cmp	x19, #0xd
    25b4:      	b.eq	0x2170 <_stogir.verify.classifications+0x138>
    25b8:      	cmp	x26, #0xc
    25bc:      	b.ne	0x25d4 <_stogir.verify.classifications+0x59c>
    25c0:      	mov	x0, #0x1                ; =1
    25c4:      	b	0x25e0 <_stogir.verify.classifications+0x5a8>
    25c8:      	movz	w15, #0x0, lsl #16
    25cc:      	movz	w14, #0x0, lsl #16
    25d0:      	b	0x2548 <_stogir.verify.classifications+0x510>
    25d4:      	cmp	x26, #0xd
    25d8:      	cset	w0, eq
    25dc:      	ubfx	x0, x0, #0, #8
    25e0:      	b	0x2174 <_stogir.verify.classifications+0x13c>
    25e4:      	brk	#0
    25e8:      	b	0x25e4 <_stogir.verify.classifications+0x5ac>
    25ec:      	mov	x26, x0
    25f0:      	b	0x2188 <_stogir.verify.classifications+0x150>
    25f4:      	udf	#0x0

00000000000025f8 <_stogir.vector.validate>:
    25f8:      	sub	sp, sp, #0x210
    25fc:      	str	x29, [sp]
    2600:      	str	x30, [sp, #0x8]
    2604:      	mov	x29, sp
    2608:      	str	x19, [sp, #0x1c0]
    260c:      	str	x20, [sp, #0x1c8]
    2610:      	str	x21, [sp, #0x1d0]
    2614:      	str	x22, [sp, #0x1d8]
    2618:      	str	x23, [sp, #0x1e0]
    261c:      	str	x24, [sp, #0x1e8]
    2620:      	str	x25, [sp, #0x1f0]
    2624:      	str	x26, [sp, #0x1f8]
    2628:      	str	x27, [sp, #0x200]
    262c:      	str	x28, [sp, #0x208]
    2630:      	orr	w19, w1, wzr
    2634:      	mov	x20, x8
    2638:      	add	x8, sp, #0x10
    263c:      	mov	x21, x0
    2640:      	mov	w22, w1
    2644:      	mov	w1, w19
    2648:      	mov	w23, w2
    264c:      	bl	0x264c <_stogir.vector.validate+0x54>
		000000000000264c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    2650:      	add	x16, sp, #0x10
    2654:      	ldr	w0, [x16]
    2658:      	lsr	x16, x0, #0
    265c:      	cmp	x16, #0x1
    2660:      	b.eq	0x267c <_stogir.vector.validate+0x84>
    2664:      	b.lo	0x266c <_stogir.vector.validate+0x74>
    2668:      	b	0x2680 <_stogir.vector.validate+0x88>
    266c:      	cmp	x16, #0x0
    2670:      	b.eq	0x2678 <_stogir.vector.validate+0x80>
    2674:      	b	0x2680 <_stogir.vector.validate+0x88>
    2678:      	b	0x2684 <_stogir.vector.validate+0x8c>
    267c:      	b	0x2710 <_stogir.vector.validate+0x118>
    2680:      	b	0x2920 <_stogir.vector.validate+0x328>
    2684:      	str	x20, [sp, #0x1a8]
    2688:      	mov	x0, #0x1                ; =1
    268c:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		000000000000268c:  ARM64_RELOC_PAGE21	l_stogir.348
    2690:      	ldr	x19, [x19]
		0000000000002690:  ARM64_RELOC_PAGEOFF12	l_stogir.348
    2694:      	mov	x25, #0x1a              ; =26
    2698:      	b	0x26c8 <_stogir.vector.validate+0xd0>
    269c:      	add	x8, sp, #0x70
    26a0:      	mov	x0, x21
    26a4:      	ldr	w1, [sp, #0x1a0]
    26a8:      	mov	w2, w23
    26ac:      	bl	0x26ac <_stogir.vector.validate+0xb4>
		00000000000026ac:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    26b0:      	add	x16, sp, #0x70
    26b4:      	ldr	x0, [x16]
    26b8:      	add	x16, sp, #0x70
    26bc:      	ldr	x19, [x16, #0x8]
    26c0:      	add	x16, sp, #0x70
    26c4:      	ldr	x25, [x16, #0x10]
    26c8:      	ldr	x1, [sp, #0x1a8]
    26cc:      	str	x0, [x1]
    26d0:      	str	x19, [x1, #0x8]
    26d4:      	str	x25, [x1, #0x10]
    26d8:      	ldr	x19, [sp, #0x1c0]
    26dc:      	ldr	x20, [sp, #0x1c8]
    26e0:      	ldr	x21, [sp, #0x1d0]
    26e4:      	ldr	x22, [sp, #0x1d8]
    26e8:      	ldr	x23, [sp, #0x1e0]
    26ec:      	ldr	x24, [sp, #0x1e8]
    26f0:      	ldr	x25, [sp, #0x1f0]
    26f4:      	ldr	x26, [sp, #0x1f8]
    26f8:      	ldr	x27, [sp, #0x200]
    26fc:      	ldr	x28, [sp, #0x208]
    2700:      	ldr	x29, [sp]
    2704:      	ldr	x30, [sp, #0x8]
    2708:      	add	sp, sp, #0x210
    270c:      	ret
    2710:      	sxtw	x22, w22
    2714:      	add	x16, sp, #0x10
    2718:      	orr	x0, x16, xzr
    271c:      	cmp	x22, #0x0
    2720:      	cset	w24, le
    2724:      	add	x0, x0, #0x8
    2728:      	add	x16, sp, #0x10
    272c:      	ldr	x25, [x16, #0x8]
    2730:      	add	x16, sp, #0x40
    2734:      	str	x25, [x16]
    2738:      	ldr	x0, [x0, #0x8]
    273c:      	add	x16, sp, #0x40
    2740:      	str	x0, [x16, #0x8]
    2744:      	uxtb	w16, w24
    2748:      	cmp	w16, wzr
    274c:      	b.eq	0x2768 <_stogir.vector.validate+0x170>
    2750:      	str	x20, [sp, #0x1a8]
    2754:      	mov	x0, #0x1                ; =1
    2758:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002758:  ARM64_RELOC_PAGE21	l_stogir.349
    275c:      	ldr	x19, [x19]
		000000000000275c:  ARM64_RELOC_PAGEOFF12	l_stogir.349
    2760:      	mov	x25, #0x3b              ; =59
    2764:      	b	0x26c8 <_stogir.vector.validate+0xd0>
    2768:      	lsl	x26, x22, #2
    276c:      	uxtb	w0, w25
    2770:      	orr	x27, x0, xzr
    2774:      	ldr	x0, [x21, #0x78]
    2778:      	cmp	x27, #0x44
    277c:      	cset	w1, eq
    2780:      	add	x0, x0, x22, lsl #2
    2784:      	ldr	w28, [x0]
    2788:      	cmp	x27, #0x24
    278c:      	b.ne	0x27d0 <_stogir.vector.validate+0x1d8>
    2790:      	str	x20, [sp, #0x1a8]
    2794:      	str	w19, [sp, #0x1a0]
    2798:      	uxtb	w16, w1
    279c:      	cmp	w16, wzr
    27a0:      	b.eq	0x269c <_stogir.vector.validate+0xa4>
    27a4:      	add	x8, sp, #0x50
    27a8:      	mov	x0, x21
    27ac:      	ldr	w1, [sp, #0x1a0]
    27b0:      	bl	0x27b0 <_stogir.vector.validate+0x1b8>
		00000000000027b0:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    27b4:      	add	x16, sp, #0x50
    27b8:      	ldr	x0, [x16]
    27bc:      	add	x16, sp, #0x50
    27c0:      	ldr	x19, [x16, #0x8]
    27c4:      	add	x16, sp, #0x50
    27c8:      	ldr	x25, [x16, #0x10]
    27cc:      	b	0x26c8 <_stogir.vector.validate+0xd0>
    27d0:      	uxtb	w16, w1
    27d4:      	cmp	w16, wzr
    27d8:      	b.ne	0x2fd8 <_stogir.vector.validate+0x9e0>
    27dc:      	cmp	x27, #0x3c
    27e0:      	b.ne	0x2894 <_stogir.vector.validate+0x29c>
    27e4:      	add	x8, sp, #0x90
    27e8:      	mov	x0, x21
    27ec:      	mov	w1, w19
    27f0:      	bl	0x27f0 <_stogir.vector.validate+0x1f8>
		00000000000027f0:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    27f4:      	add	x16, sp, #0x90
    27f8:      	ldr	x0, [x16]
    27fc:      	add	x16, sp, #0x90
    2800:      	ldr	x19, [x16, #0x8]
    2804:      	add	x16, sp, #0x90
    2808:      	ldr	x25, [x16, #0x10]
    280c:      	str	x20, [sp, #0x1a8]
    2810:      	b	0x2890 <_stogir.vector.validate+0x298>
    2814:      	cmp	x27, #0x41
    2818:      	cset	w0, eq
    281c:      	cmp	x27, #0x48
    2820:      	cset	w1, eq
    2824:      	cmp	x27, #0x55
    2828:      	cset	w2, ge
    282c:      	cmp	x27, #0x58
    2830:      	cset	w3, le
    2834:      	cmp	x27, #0x47
    2838:      	b.ne	0x2928 <_stogir.vector.validate+0x330>
    283c:      	str	x20, [sp, #0x1a8]
    2840:      	str	w19, [sp, #0x1a0]
    2844:      	mov	w19, w0
    2848:      	mov	w20, w1
    284c:      	str	w2, [sp, #0x1b0]
    2850:      	str	w3, [sp, #0x1b8]
    2854:      	mov	x0, x21
    2858:      	ldr	w1, [sp, #0x1a0]
    285c:      	bl	0x285c <_stogir.vector.validate+0x264>
		000000000000285c:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    2860:      	cmp	x0, #0x0
    2864:      	b.eq	0x294c <_stogir.vector.validate+0x354>
    2868:      	add	x8, sp, #0xf0
    286c:      	mov	x0, x21
    2870:      	ldr	w1, [sp, #0x1a0]
    2874:      	bl	0x2874 <_stogir.vector.validate+0x27c>
		0000000000002874:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.validate
    2878:      	add	x16, sp, #0xf0
    287c:      	ldr	x0, [x16]
    2880:      	add	x16, sp, #0xf0
    2884:      	ldr	x19, [x16, #0x8]
    2888:      	add	x16, sp, #0xf0
    288c:      	ldr	x25, [x16, #0x10]
    2890:      	b	0x26c8 <_stogir.vector.validate+0xd0>
    2894:      	cmp	x27, #0x3d
    2898:      	b.lt	0x28d8 <_stogir.vector.validate+0x2e0>
    289c:      	cmp	x27, #0x3f
    28a0:      	b.gt	0x28d8 <_stogir.vector.validate+0x2e0>
    28a4:      	add	x8, sp, #0xb0
    28a8:      	mov	x0, x21
    28ac:      	mov	w1, w19
    28b0:      	mov	w2, w23
    28b4:      	bl	0x28b4 <_stogir.vector.validate+0x2bc>
		00000000000028b4:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.validate
    28b8:      	add	x16, sp, #0xb0
    28bc:      	ldr	x0, [x16]
    28c0:      	add	x16, sp, #0xb0
    28c4:      	ldr	x19, [x16, #0x8]
    28c8:      	add	x16, sp, #0xb0
    28cc:      	ldr	x25, [x16, #0x10]
    28d0:      	str	x20, [sp, #0x1a8]
    28d4:      	b	0x2890 <_stogir.vector.validate+0x298>
    28d8:      	mov	x0, x21
    28dc:      	mov	w1, w19
    28e0:      	bl	0x28e0 <_stogir.vector.validate+0x2e8>
		00000000000028e0:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.node?
    28e4:      	cmp	x0, #0x0
    28e8:      	b.eq	0x2814 <_stogir.vector.validate+0x21c>
    28ec:      	add	x8, sp, #0xd0
    28f0:      	mov	x0, x21
    28f4:      	mov	w1, w19
    28f8:      	mov	w2, w23
    28fc:      	bl	0x28fc <_stogir.vector.validate+0x304>
		00000000000028fc:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.validate
    2900:      	add	x16, sp, #0xd0
    2904:      	ldr	x0, [x16]
    2908:      	add	x16, sp, #0xd0
    290c:      	ldr	x19, [x16, #0x8]
    2910:      	add	x16, sp, #0xd0
    2914:      	ldr	x25, [x16, #0x10]
    2918:      	str	x20, [sp, #0x1a8]
    291c:      	b	0x2890 <_stogir.vector.validate+0x298>
    2920:      	brk	#0
    2924:      	b	0x2920 <_stogir.vector.validate+0x328>
    2928:      	cmp	x27, #0x4f
    292c:      	b.ne	0x29c4 <_stogir.vector.validate+0x3cc>
    2930:      	str	x20, [sp, #0x1a8]
    2934:      	str	w19, [sp, #0x1a0]
    2938:      	mov	w19, w0
    293c:      	mov	w20, w1
    2940:      	str	w2, [sp, #0x1b0]
    2944:      	str	w3, [sp, #0x1b8]
    2948:      	b	0x2854 <_stogir.vector.validate+0x25c>
    294c:      	uxtb	w16, w19
    2950:      	cmp	w16, wzr
    2954:      	b.ne	0x2994 <_stogir.vector.validate+0x39c>
    2958:      	uxtb	w16, w20
    295c:      	cmp	w16, wzr
    2960:      	b.ne	0x2994 <_stogir.vector.validate+0x39c>
    2964:      	ldr	w0, [sp, #0x1b0]
    2968:      	uxtb	w16, w0
    296c:      	cmp	w16, wzr
    2970:      	b.eq	0x2984 <_stogir.vector.validate+0x38c>
    2974:      	ldr	w0, [sp, #0x1b8]
    2978:      	uxtb	w16, w0
    297c:      	cmp	w16, wzr
    2980:      	b.ne	0x2994 <_stogir.vector.validate+0x39c>
    2984:      	movz	x0, #0x0, lsl #48
    2988:      	movz	x19, #0x0, lsl #48
    298c:      	movz	x25, #0x0, lsl #48
    2990:      	b	0x29c0 <_stogir.vector.validate+0x3c8>
    2994:      	add	x8, sp, #0x110
    2998:      	mov	x0, x21
    299c:      	ldr	w1, [sp, #0x1a0]
    29a0:      	mov	w2, w23
    29a4:      	bl	0x29a4 <_stogir.vector.validate+0x3ac>
		00000000000029a4:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    29a8:      	add	x16, sp, #0x110
    29ac:      	ldr	x0, [x16]
    29b0:      	add	x16, sp, #0x110
    29b4:      	ldr	x19, [x16, #0x8]
    29b8:      	add	x16, sp, #0x110
    29bc:      	ldr	x25, [x16, #0x10]
    29c0:      	b	0x2890 <_stogir.vector.validate+0x298>
    29c4:      	cmp	x27, #0x50
    29c8:      	b.eq	0x2fe4 <_stogir.vector.validate+0x9ec>
    29cc:      	cmp	x27, #0x78
    29d0:      	b.ne	0x29f0 <_stogir.vector.validate+0x3f8>
    29d4:      	str	x20, [sp, #0x1a8]
    29d8:      	str	w19, [sp, #0x1a0]
    29dc:      	mov	w19, w0
    29e0:      	mov	w20, w1
    29e4:      	str	w2, [sp, #0x1b0]
    29e8:      	str	w3, [sp, #0x1b8]
    29ec:      	b	0x2854 <_stogir.vector.validate+0x25c>
    29f0:      	uxtb	w16, w0
    29f4:      	cmp	w16, wzr
    29f8:      	b.ne	0x2ae0 <_stogir.vector.validate+0x4e8>
    29fc:      	uxtb	w16, w1
    2a00:      	cmp	w16, wzr
    2a04:      	b.ne	0x2ae0 <_stogir.vector.validate+0x4e8>
    2a08:      	uxtb	w16, w2
    2a0c:      	cmp	w16, wzr
    2a10:      	b.eq	0x2a20 <_stogir.vector.validate+0x428>
    2a14:      	uxtb	w16, w3
    2a18:      	cmp	w16, wzr
    2a1c:      	b.ne	0x2ae0 <_stogir.vector.validate+0x4e8>
    2a20:      	str	w2, [sp, #0x1b0]
    2a24:      	str	w3, [sp, #0x1b8]
    2a28:      	str	w19, [sp, #0x1a0]
    2a2c:      	str	x20, [sp, #0x1a8]
    2a30:      	mov	w20, w1
    2a34:      	mov	w1, w19
    2a38:      	mov	w19, w0
    2a3c:      	mov	x0, x21
    2a40:      	bl	0x2a40 <_stogir.vector.validate+0x448>
		0000000000002a40:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    2a44:      	cmp	x0, #0x0
    2a48:      	b.ne	0x2854 <_stogir.vector.validate+0x25c>
    2a4c:      	sxtw	x28, w28
    2a50:      	ubfx	x25, x25, #0, #32
    2a54:      	ubfx	x0, x25, #8, #8
    2a58:      	orr	x1, x0, xzr
    2a5c:      	orr	w20, w1, wzr
    2a60:      	cmp	x27, #0x5b
    2a64:      	b.eq	0x2b10 <_stogir.vector.validate+0x518>
    2a68:      	cmp	x27, #0x5c
    2a6c:      	b.eq	0x2b10 <_stogir.vector.validate+0x518>
    2a70:      	orr	x19, x0, xzr
    2a74:      	cmp	x27, #0x5d
    2a78:      	b.ne	0x2b74 <_stogir.vector.validate+0x57c>
    2a7c:      	mov	x27, x19
    2a80:      	cmp	x28, #0x3
    2a84:      	b.ne	0x2b60 <_stogir.vector.validate+0x568>
    2a88:      	cmp	x27, #0x0
    2a8c:      	b.ne	0x2b60 <_stogir.vector.validate+0x568>
    2a90:      	add	x16, sp, #0x40
    2a94:      	ldr	w0, [x16, #0x4]
    2a98:      	add	x16, sp, #0x40
    2a9c:      	ldr	w1, [x16, #0x8]
    2aa0:      	add	x16, sp, #0x40
    2aa4:      	ldr	w2, [x16, #0xc]
    2aa8:      	add	x8, sp, #0x150
    2aac:      	mov	w3, w1
    2ab0:      	mov	w1, w23
    2ab4:      	mov	w4, w2
    2ab8:      	mov	w2, w0
    2abc:      	mov	x0, x21
    2ac0:      	bl	0x2ac0 <_stogir.vector.validate+0x4c8>
		0000000000002ac0:  ARM64_RELOC_BRANCH26	_stogir.vector.store-inputs
    2ac4:      	add	x16, sp, #0x150
    2ac8:      	ldr	x0, [x16]
    2acc:      	add	x16, sp, #0x150
    2ad0:      	ldr	x19, [x16, #0x8]
    2ad4:      	add	x16, sp, #0x150
    2ad8:      	ldr	x25, [x16, #0x10]
    2adc:      	b	0x2b70 <_stogir.vector.validate+0x578>
    2ae0:      	str	x20, [sp, #0x1a8]
    2ae4:      	str	w19, [sp, #0x1a0]
    2ae8:      	mov	w19, w0
    2aec:      	mov	w20, w1
    2af0:      	str	w2, [sp, #0x1b0]
    2af4:      	str	w3, [sp, #0x1b8]
    2af8:      	b	0x2854 <_stogir.vector.validate+0x25c>
    2afc:      	mov	x0, #0x1                ; =1
    2b00:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002b00:  ARM64_RELOC_PAGE21	l_stogir.350
    2b04:      	ldr	x19, [x19]
		0000000000002b04:  ARM64_RELOC_PAGEOFF12	l_stogir.350
    2b08:      	mov	x25, #0x19              ; =25
    2b0c:      	b	0x2890 <_stogir.vector.validate+0x298>
    2b10:      	cmp	x28, #0x2
    2b14:      	b.ne	0x2afc <_stogir.vector.validate+0x504>
    2b18:      	add	x16, sp, #0x40
    2b1c:      	ldr	w0, [x16, #0x4]
    2b20:      	add	x16, sp, #0x40
    2b24:      	ldr	w1, [x16, #0x8]
    2b28:      	add	x8, sp, #0x130
    2b2c:      	mov	w2, w23
    2b30:      	mov	w3, w0
    2b34:      	mov	x0, x21
    2b38:      	mov	w4, w1
    2b3c:      	mov	w1, w20
    2b40:      	bl	0x2b40 <_stogir.vector.validate+0x548>
		0000000000002b40:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    2b44:      	add	x16, sp, #0x130
    2b48:      	ldr	x0, [x16]
    2b4c:      	add	x16, sp, #0x130
    2b50:      	ldr	x19, [x16, #0x8]
    2b54:      	add	x16, sp, #0x130
    2b58:      	ldr	x25, [x16, #0x10]
    2b5c:      	b	0x2b0c <_stogir.vector.validate+0x514>
    2b60:      	mov	x0, #0x1                ; =1
    2b64:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002b64:  ARM64_RELOC_PAGE21	l_stogir.351
    2b68:      	ldr	x19, [x19]
		0000000000002b68:  ARM64_RELOC_PAGEOFF12	l_stogir.351
    2b6c:      	mov	x25, #0x1a              ; =26
    2b70:      	b	0x2b0c <_stogir.vector.validate+0x514>
    2b74:      	cmp	x27, #0x5e
    2b78:      	b.eq	0x3000 <_stogir.vector.validate+0xa08>
    2b7c:      	cmp	x27, #0x43
    2b80:      	b.ne	0x2be8 <_stogir.vector.validate+0x5f0>
    2b84:      	cmp	x19, #0xf
    2b88:      	b.le	0x2efc <_stogir.vector.validate+0x904>
    2b8c:      	cmp	x19, #0x80
    2b90:      	b.ge	0x2efc <_stogir.vector.validate+0x904>
    2b94:      	and	w0, w1, #0xf
    2b98:      	ubfx	x0, x0, #0, #32
    2b9c:      	cmp	x0, #0x1
    2ba0:      	b.lt	0x2efc <_stogir.vector.validate+0x904>
    2ba4:      	cmp	x0, #0xd
    2ba8:      	b.gt	0x2efc <_stogir.vector.validate+0x904>
    2bac:      	mov	w0, w20
    2bb0:      	mov	w1, w23
    2bb4:      	bl	0x2bb4 <_stogir.vector.validate+0x5bc>
		0000000000002bb4:  ARM64_RELOC_BRANCH26	_stogir.types.size
    2bb8:      	sxtw	x0, w0
    2bbc:      	cmp	x0, #0x0
    2bc0:      	b.le	0x2efc <_stogir.vector.validate+0x904>
    2bc4:      	cmp	x28, #0x3
    2bc8:      	b.lt	0x2efc <_stogir.vector.validate+0x904>
    2bcc:      	mov	x27, x19
    2bd0:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002bd0:  ARM64_RELOC_PAGE21	l_stogir.352
    2bd4:      	ldr	x19, [x19]
		0000000000002bd4:  ARM64_RELOC_PAGEOFF12	l_stogir.352
    2bd8:      	movz	x25, #0x0, lsl #48
    2bdc:      	b	0x2f0c <_stogir.vector.validate+0x914>
    2be0:      	mov	x0, #0x1                ; =1
    2be4:      	b	0x2b70 <_stogir.vector.validate+0x578>
    2be8:      	mov	x0, #0x1                ; =1
    2bec:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002bec:  ARM64_RELOC_PAGE21	l_stogir.353
    2bf0:      	ldr	x19, [x19]
		0000000000002bf0:  ARM64_RELOC_PAGEOFF12	l_stogir.353
    2bf4:      	mov	x25, #0x28              ; =40
    2bf8:      	b	0x2be4 <_stogir.vector.validate+0x5ec>
    2bfc:      	add	x16, sp, #0x40
    2c00:      	ldr	w0, [x16, #0x4]
    2c04:      	sxtw	x0, w0
    2c08:      	ldr	x1, [x21, #0x78]
    2c0c:      	add	x0, x1, x0, lsl #2
    2c10:      	ldr	w0, [x0]
    2c14:      	add	w0, w0, #0x1
    2c18:      	sxtw	x0, w0
    2c1c:      	cmp	x28, x0
    2c20:      	cset	w0, eq
    2c24:      	uxtb	w16, w0
    2c28:      	cmp	w16, wzr
    2c2c:      	cset	x0, eq
    2c30:      	cmp	x0, #0x0
    2c34:      	b.eq	0x2c44 <_stogir.vector.validate+0x64c>
    2c38:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002c38:  ARM64_RELOC_PAGE21	l_stogir.354
    2c3c:      	ldr	x19, [x19]
		0000000000002c3c:  ARM64_RELOC_PAGEOFF12	l_stogir.354
    2c40:      	mov	x25, #0x19              ; =25
    2c44:      	add	x0, x21, #0x78
    2c48:      	add	x1, x21, #0x28
    2c4c:      	add	x2, x21, #0x50
    2c50:      	add	x3, x21, #0x78
    2c54:      	mov	x4, #0x2                ; =2
    2c58:      	b	0x2cd4 <_stogir.vector.validate+0x6dc>
    2c5c:      	ubfx	x5, x5, #0, #32
    2c60:      	ubfx	x5, x5, #8, #8
    2c64:      	cmp	x5, x27
    2c68:      	b.eq	0x2c78 <_stogir.vector.validate+0x680>
    2c6c:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002c6c:  ARM64_RELOC_PAGE21	l_stogir.355
    2c70:      	ldr	x19, [x19]
		0000000000002c70:  ARM64_RELOC_PAGEOFF12	l_stogir.355
    2c74:      	mov	x25, #0x1e              ; =30
    2c78:      	b	0x2ccc <_stogir.vector.validate+0x6d4>
    2c7c:      	movz	w6, #0x0, lsl #16
    2c80:      	movz	w5, #0x0, lsl #16
    2c84:      	b	0x2c90 <_stogir.vector.validate+0x698>
    2c88:      	movz	w6, #0x0, lsl #16
    2c8c:      	movz	w5, #0x0, lsl #16
    2c90:      	ubfx	x6, x6, #0, #32
    2c94:      	lsr	x16, x6, #0
    2c98:      	cmp	x16, #0x1
    2c9c:      	b.eq	0x2cb8 <_stogir.vector.validate+0x6c0>
    2ca0:      	b.lo	0x2ca8 <_stogir.vector.validate+0x6b0>
    2ca4:      	b	0x2cbc <_stogir.vector.validate+0x6c4>
    2ca8:      	cmp	x16, #0x0
    2cac:      	b.eq	0x2cb4 <_stogir.vector.validate+0x6bc>
    2cb0:      	b	0x2cbc <_stogir.vector.validate+0x6c4>
    2cb4:      	b	0x2cc0 <_stogir.vector.validate+0x6c8>
    2cb8:      	b	0x2d28 <_stogir.vector.validate+0x730>
    2cbc:      	b	0x2fc0 <_stogir.vector.validate+0x9c8>
    2cc0:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002cc0:  ARM64_RELOC_PAGE21	l_stogir.356
    2cc4:      	ldr	x19, [x19]
		0000000000002cc4:  ARM64_RELOC_PAGEOFF12	l_stogir.356
    2cc8:      	mov	x25, #0x18              ; =24
    2ccc:      	add	x4, x4, #0x1
    2cd0:      	sxtw	x4, w4
    2cd4:      	cmp	x25, #0x0
    2cd8:      	b.ne	0x2e48 <_stogir.vector.validate+0x850>
    2cdc:      	cmp	x4, x28
    2ce0:      	b.gt	0x2e48 <_stogir.vector.validate+0x850>
    2ce4:      	uxtb	w16, w24
    2ce8:      	cmp	w16, wzr
    2cec:      	b.ne	0x2c88 <_stogir.vector.validate+0x690>
    2cf0:      	ldr	x5, [x21, #0x8]
    2cf4:      	cmp	x22, x5
    2cf8:      	b.ge	0x2d8c <_stogir.vector.validate+0x794>
    2cfc:      	ldr	x5, [x3, #0x8]
    2d00:      	cmp	x22, x5
    2d04:      	b.ge	0x2d84 <_stogir.vector.validate+0x78c>
    2d08:      	ldr	x5, [x21, #0x78]
    2d0c:      	add	x5, x26, x5
    2d10:      	ldr	w5, [x5]
    2d14:      	sxtw	x5, w5
    2d18:      	cmp	x5, #0x0
    2d1c:      	cset	w5, ge
    2d20:      	ubfx	x5, x5, #0, #8
    2d24:      	b	0x2d88 <_stogir.vector.validate+0x790>
    2d28:      	sxtw	x5, w5
    2d2c:      	cmp	x5, #0x0
    2d30:      	cset	w6, gt
    2d34:      	movz	x16, #0x0, lsl #48
    2d38:      	sub	x7, x16, x5
    2d3c:      	sub	x8, x7, #0x1
    2d40:      	uxtb	w16, w6
    2d44:      	cmp	w16, wzr
    2d48:      	b.eq	0x2e08 <_stogir.vector.validate+0x810>
    2d4c:      	ldr	x7, [x21, #0x8]
    2d50:      	cmp	x5, x7
    2d54:      	b.ge	0x2e70 <_stogir.vector.validate+0x878>
    2d58:      	ldr	x7, [x0, #0x8]
    2d5c:      	cmp	x5, x7
    2d60:      	b.ge	0x2f70 <_stogir.vector.validate+0x978>
    2d64:      	ldr	x7, [x21, #0x78]
    2d68:      	add	x7, x7, x5, lsl #2
    2d6c:      	ldr	w7, [x7]
    2d70:      	sxtw	x7, w7
    2d74:      	cmp	x7, #0x0
    2d78:      	cset	w7, ge
    2d7c:      	ubfx	x7, x7, #0, #8
    2d80:      	b	0x2f74 <_stogir.vector.validate+0x97c>
    2d84:      	movz	x5, #0x0, lsl #48
    2d88:      	b	0x2d90 <_stogir.vector.validate+0x798>
    2d8c:      	movz	x5, #0x0, lsl #48
    2d90:      	cmp	x5, #0x0
    2d94:      	b.eq	0x2c88 <_stogir.vector.validate+0x690>
    2d98:      	orr	w5, w4, wzr
    2d9c:      	sxtw	x5, w5
    2da0:      	cmp	x5, #0x1
    2da4:      	b.lt	0x2c7c <_stogir.vector.validate+0x684>
    2da8:      	ldr	x6, [x21, #0x78]
    2dac:      	add	x6, x26, x6
    2db0:      	ldr	w6, [x6]
    2db4:      	sxtw	x6, w6
    2db8:      	cmp	x5, x6
    2dbc:      	b.gt	0x2c7c <_stogir.vector.validate+0x684>
    2dc0:      	ldr	x6, [x21]
    2dc4:      	asr	x16, x5, #63
    2dc8:      	lsr	x16, x16, #62
    2dcc:      	add	x7, x5, x16
    2dd0:      	asr	x7, x7, #2
    2dd4:      	asr	x16, x5, #63
    2dd8:      	lsr	x16, x16, #62
    2ddc:      	add	x5, x5, x16
    2de0:      	and	x5, x5, #0x3
    2de4:      	sub	x5, x5, x16
    2de8:      	add	x7, x7, x22
    2dec:      	add	x6, x6, x7, lsl #4
    2df0:      	add	x5, x6, x5, lsl #2
    2df4:      	ldr	w5, [x5]
    2df8:      	movn	w17, #0x0, lsl #16
    2dfc:      	and	w5, w5, w17
    2e00:      	mov	w6, #0x1                ; =1
    2e04:      	b	0x2c84 <_stogir.vector.validate+0x68c>
    2e08:      	cmp	x5, #0x0
    2e0c:      	b.ge	0x2e78 <_stogir.vector.validate+0x880>
    2e10:      	ldr	x9, [x1, #0x8]
    2e14:      	ldr	x10, [x2, #0x8]
    2e18:      	cmp	x9, x10
    2e1c:      	b.ne	0x2f68 <_stogir.vector.validate+0x970>
    2e20:      	cmp	x7, x9
    2e24:      	b.gt	0x2f9c <_stogir.vector.validate+0x9a4>
    2e28:      	ldr	x7, [x21, #0x50]
    2e2c:      	add	x7, x7, x8, lsl #2
    2e30:      	ldr	w7, [x7]
    2e34:      	sxtw	x7, w7
    2e38:      	cmp	x7, #0x0
    2e3c:      	cset	w7, gt
    2e40:      	ubfx	x7, x7, #0, #8
    2e44:      	b	0x2fa0 <_stogir.vector.validate+0x9a8>
    2e48:      	cmp	x25, #0x0
    2e4c:      	b.ne	0x2be0 <_stogir.vector.validate+0x5e8>
    2e50:      	mov	w0, w20
    2e54:      	mov	w1, w23
    2e58:      	bl	0x2e58 <_stogir.vector.validate+0x860>
		0000000000002e58:  ARM64_RELOC_BRANCH26	_stogir.types.size
    2e5c:      	sxtw	x0, w0
    2e60:      	and	x19, x0, #0xffffffff
    2e64:      	movz	x0, #0x0, lsl #48
    2e68:      	movz	x25, #0x0, lsl #48
    2e6c:      	b	0x2be4 <_stogir.vector.validate+0x5ec>
    2e70:      	movz	x7, #0x0, lsl #48
    2e74:      	b	0x2e7c <_stogir.vector.validate+0x884>
    2e78:      	movz	x7, #0x0, lsl #48
    2e7c:      	cmp	x7, #0x0
    2e80:      	b.eq	0x2eb4 <_stogir.vector.validate+0x8bc>
    2e84:      	uxtb	w16, w6
    2e88:      	cmp	w16, wzr
    2e8c:      	b.eq	0x2ea0 <_stogir.vector.validate+0x8a8>
    2e90:      	ldr	x6, [x21]
    2e94:      	add	x5, x6, x5, lsl #4
    2e98:      	ldr	x5, [x5]
    2e9c:      	b	0x2eac <_stogir.vector.validate+0x8b4>
    2ea0:      	ldr	x5, [x21, #0x28]
    2ea4:      	add	x5, x5, x8, lsl #4
    2ea8:      	ldr	x5, [x5]
    2eac:      	mov	w6, #0x1                ; =1
    2eb0:      	b	0x2ebc <_stogir.vector.validate+0x8c4>
    2eb4:      	movz	w6, #0x0, lsl #16
    2eb8:      	movz	x5, #0x0, lsl #48
    2ebc:      	ubfx	x6, x6, #0, #32
    2ec0:      	lsr	x16, x6, #0
    2ec4:      	cmp	x16, #0x1
    2ec8:      	b.eq	0x2ee4 <_stogir.vector.validate+0x8ec>
    2ecc:      	b.lo	0x2ed4 <_stogir.vector.validate+0x8dc>
    2ed0:      	b	0x2ee8 <_stogir.vector.validate+0x8f0>
    2ed4:      	cmp	x16, #0x0
    2ed8:      	b.eq	0x2ee0 <_stogir.vector.validate+0x8e8>
    2edc:      	b	0x2ee8 <_stogir.vector.validate+0x8f0>
    2ee0:      	b	0x2eec <_stogir.vector.validate+0x8f4>
    2ee4:      	b	0x2c5c <_stogir.vector.validate+0x664>
    2ee8:      	b	0x2fc8 <_stogir.vector.validate+0x9d0>
    2eec:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002eec:  ARM64_RELOC_PAGE21	l_stogir.356
    2ef0:      	ldr	x19, [x19]
		0000000000002ef0:  ARM64_RELOC_PAGEOFF12	l_stogir.356
    2ef4:      	mov	x25, #0x18              ; =24
    2ef8:      	b	0x2c78 <_stogir.vector.validate+0x680>
    2efc:      	mov	x27, x19
    2f00:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002f00:  ARM64_RELOC_PAGE21	l_stogir.357
    2f04:      	ldr	x19, [x19]
		0000000000002f04:  ARM64_RELOC_PAGEOFF12	l_stogir.357
    2f08:      	mov	x25, #0x20              ; =32
    2f0c:      	add	x16, sp, #0x40
    2f10:      	ldr	w0, [x16, #0x4]
    2f14:      	add	x8, sp, #0x170
    2f18:      	mov	w1, w0
    2f1c:      	mov	x0, x21
    2f20:      	bl	0x2f20 <_stogir.vector.validate+0x928>
		0000000000002f20:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    2f24:      	add	x16, sp, #0x170
    2f28:      	ldr	w0, [x16]
    2f2c:      	lsr	x16, x0, #0
    2f30:      	cmp	x16, #0x1
    2f34:      	b.eq	0x2f50 <_stogir.vector.validate+0x958>
    2f38:      	b.lo	0x2f40 <_stogir.vector.validate+0x948>
    2f3c:      	b	0x2f54 <_stogir.vector.validate+0x95c>
    2f40:      	cmp	x16, #0x0
    2f44:      	b.eq	0x2f4c <_stogir.vector.validate+0x954>
    2f48:      	b	0x2f54 <_stogir.vector.validate+0x95c>
    2f4c:      	b	0x2f58 <_stogir.vector.validate+0x960>
    2f50:      	b	0x2f78 <_stogir.vector.validate+0x980>
    2f54:      	b	0x2fd0 <_stogir.vector.validate+0x9d8>
    2f58:      	adrp	x19, 0x2000 <_stogir.graph.borrow-node+0xc8>
		0000000000002f58:  ARM64_RELOC_PAGE21	l_stogir.358
    2f5c:      	ldr	x19, [x19]
		0000000000002f5c:  ARM64_RELOC_PAGEOFF12	l_stogir.358
    2f60:      	mov	x25, #0x19              ; =25
    2f64:      	b	0x2c44 <_stogir.vector.validate+0x64c>
    2f68:      	movz	x7, #0x0, lsl #48
    2f6c:      	b	0x2e7c <_stogir.vector.validate+0x884>
    2f70:      	movz	x7, #0x0, lsl #48
    2f74:      	b	0x2e74 <_stogir.vector.validate+0x87c>
    2f78:      	add	x16, sp, #0x170
    2f7c:      	ldr	x0, [x16, #0x8]
    2f80:      	add	x16, sp, #0x40
    2f84:      	ldr	w1, [x16, #0x4]
    2f88:      	sxtw	x1, w1
    2f8c:      	cmp	x1, #0x0
    2f90:      	b.gt	0x2fa4 <_stogir.vector.validate+0x9ac>
    2f94:      	mov	x0, #0x1                ; =1
    2f98:      	b	0x2c30 <_stogir.vector.validate+0x638>
    2f9c:      	movz	x7, #0x0, lsl #48
    2fa0:      	b	0x2f6c <_stogir.vector.validate+0x974>
    2fa4:      	uxtb	w0, w0
    2fa8:      	cmp	x0, #0x70
    2fac:      	b.eq	0x2bfc <_stogir.vector.validate+0x604>
    2fb0:      	cmp	x0, #0x71
    2fb4:      	b.eq	0x2bfc <_stogir.vector.validate+0x604>
    2fb8:      	mov	x0, #0x1                ; =1
    2fbc:      	b	0x2c30 <_stogir.vector.validate+0x638>
    2fc0:      	brk	#0
    2fc4:      	b	0x2fc0 <_stogir.vector.validate+0x9c8>
    2fc8:      	brk	#0
    2fcc:      	b	0x2fc8 <_stogir.vector.validate+0x9d0>
    2fd0:      	brk	#0
    2fd4:      	b	0x2fd0 <_stogir.vector.validate+0x9d8>
    2fd8:      	str	x20, [sp, #0x1a8]
    2fdc:      	str	w19, [sp, #0x1a0]
    2fe0:      	b	0x2798 <_stogir.vector.validate+0x1a0>
    2fe4:      	str	x20, [sp, #0x1a8]
    2fe8:      	str	w19, [sp, #0x1a0]
    2fec:      	mov	w19, w0
    2ff0:      	mov	w20, w1
    2ff4:      	str	w2, [sp, #0x1b0]
    2ff8:      	str	w3, [sp, #0x1b8]
    2ffc:      	b	0x2854 <_stogir.vector.validate+0x25c>
    3000:      	mov	x27, x19
    3004:      	b	0x2a80 <_stogir.vector.validate+0x488>

0000000000003008 <_stogir.copy.validate>:
    3008:      	sub	sp, sp, #0x10
    300c:      	sxtw	x1, w1
    3010:      	lsl	x2, x1, #2
    3014:      	cmp	x1, #0x0
    3018:      	cset	w3, gt
    301c:      	movz	x16, #0x0, lsl #48
    3020:      	sub	x4, x16, x1
    3024:      	sub	x5, x4, #0x1
    3028:      	uxtb	w16, w3
    302c:      	cmp	w16, wzr
    3030:      	b.eq	0x3070 <_stogir.copy.validate+0x68>
    3034:      	ldr	x4, [x0, #0x8]
    3038:      	cmp	x1, x4
    303c:      	b.ge	0x30d4 <_stogir.copy.validate+0xcc>
    3040:      	add	x4, x0, #0x78
    3044:      	ldr	x4, [x4, #0x8]
    3048:      	cmp	x1, x4
    304c:      	b.ge	0x3268 <_stogir.copy.validate+0x260>
    3050:      	ldr	x4, [x0, #0x78]
    3054:      	add	x4, x2, x4
    3058:      	ldr	w4, [x4]
    305c:      	sxtw	x4, w4
    3060:      	cmp	x4, #0x0
    3064:      	cset	w4, ge
    3068:      	ubfx	x4, x4, #0, #8
    306c:      	b	0x326c <_stogir.copy.validate+0x264>
    3070:      	cmp	x1, #0x0
    3074:      	b.ge	0x30dc <_stogir.copy.validate+0xd4>
    3078:      	add	x6, x0, #0x28
    307c:      	add	x7, x0, #0x50
    3080:      	ldr	x6, [x6, #0x8]
    3084:      	ldr	x7, [x7, #0x8]
    3088:      	cmp	x6, x7
    308c:      	b.ne	0x30b8 <_stogir.copy.validate+0xb0>
    3090:      	cmp	x4, x6
    3094:      	b.gt	0x3270 <_stogir.copy.validate+0x268>
    3098:      	ldr	x4, [x0, #0x50]
    309c:      	add	x4, x4, x5, lsl #2
    30a0:      	ldr	w4, [x4]
    30a4:      	sxtw	x4, w4
    30a8:      	cmp	x4, #0x0
    30ac:      	cset	w4, gt
    30b0:      	ubfx	x4, x4, #0, #8
    30b4:      	b	0x3274 <_stogir.copy.validate+0x26c>
    30b8:      	movz	x4, #0x0, lsl #48
    30bc:      	b	0x30e0 <_stogir.copy.validate+0xd8>
    30c0:      	mov	x1, #0x1                ; =1
    30c4:      	adrp	x0, 0x3000 <_stogir.vector.validate+0xa08>
		00000000000030c4:  ARM64_RELOC_PAGE21	l_stogir.359
    30c8:      	ldr	x0, [x0]
		00000000000030c8:  ARM64_RELOC_PAGEOFF12	l_stogir.359
    30cc:      	mov	x2, #0x21               ; =33
    30d0:      	b	0x316c <_stogir.copy.validate+0x164>
    30d4:      	movz	x4, #0x0, lsl #48
    30d8:      	b	0x30e0 <_stogir.copy.validate+0xd8>
    30dc:      	movz	x4, #0x0, lsl #48
    30e0:      	cmp	x4, #0x0
    30e4:      	b.eq	0x3120 <_stogir.copy.validate+0x118>
    30e8:      	uxtb	w16, w3
    30ec:      	cmp	w16, wzr
    30f0:      	b.eq	0x3108 <_stogir.copy.validate+0x100>
    30f4:      	ldr	x3, [x0]
    30f8:      	add	x3, x3, x1, lsl #4
    30fc:      	ldr	x4, [x3]
    3100:      	ldr	x3, [x3, #0x8]
    3104:      	b	0x3118 <_stogir.copy.validate+0x110>
    3108:      	ldr	x3, [x0, #0x28]
    310c:      	add	x3, x3, x5, lsl #4
    3110:      	ldr	x4, [x3]
    3114:      	ldr	x3, [x3, #0x8]
    3118:      	mov	w5, #0x1                ; =1
    311c:      	b	0x312c <_stogir.copy.validate+0x124>
    3120:      	movz	w5, #0x0, lsl #16
    3124:      	movz	x4, #0x0, lsl #48
    3128:      	movz	x3, #0x0, lsl #48
    312c:      	ubfx	x5, x5, #0, #32
    3130:      	lsr	x16, x5, #0
    3134:      	cmp	x16, #0x1
    3138:      	b.eq	0x3154 <_stogir.copy.validate+0x14c>
    313c:      	b.lo	0x3144 <_stogir.copy.validate+0x13c>
    3140:      	b	0x3158 <_stogir.copy.validate+0x150>
    3144:      	cmp	x16, #0x0
    3148:      	b.eq	0x3150 <_stogir.copy.validate+0x148>
    314c:      	b	0x3158 <_stogir.copy.validate+0x150>
    3150:      	b	0x315c <_stogir.copy.validate+0x154>
    3154:      	b	0x3180 <_stogir.copy.validate+0x178>
    3158:      	b	0x3278 <_stogir.copy.validate+0x270>
    315c:      	mov	x1, #0x1                ; =1
    3160:      	adrp	x0, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003160:  ARM64_RELOC_PAGE21	l_stogir.360
    3164:      	ldr	x0, [x0]
		0000000000003164:  ARM64_RELOC_PAGEOFF12	l_stogir.360
    3168:      	mov	x2, #0x18               ; =24
    316c:      	str	x1, [x8]
    3170:      	str	x0, [x8, #0x8]
    3174:      	str	x2, [x8, #0x10]
    3178:      	add	sp, sp, #0x10
    317c:      	ret
    3180:      	mov	x16, sp
    3184:      	str	x4, [x16]
    3188:      	mov	x16, sp
    318c:      	str	x3, [x16, #0x8]
    3190:      	cmp	x1, #0x0
    3194:      	b.le	0x30c0 <_stogir.copy.validate+0xb8>
    3198:      	uxtb	w1, w4
    319c:      	cmp	x1, #0x44
    31a0:      	b.ne	0x30c0 <_stogir.copy.validate+0xb8>
    31a4:      	ldr	x1, [x0, #0x78]
    31a8:      	add	x1, x2, x1
    31ac:      	ldr	w1, [x1]
    31b0:      	sxtw	x1, w1
    31b4:      	cmp	x1, #0x2
    31b8:      	b.ne	0x30c0 <_stogir.copy.validate+0xb8>
    31bc:      	ubfx	x4, x4, #0, #32
    31c0:      	ubfx	x1, x4, #8, #8
    31c4:      	orr	x2, x1, xzr
    31c8:      	cmp	x2, #0x0
    31cc:      	b.eq	0x30c0 <_stogir.copy.validate+0xb8>
    31d0:      	cmp	x2, #0xd
    31d4:      	b.le	0x3200 <_stogir.copy.validate+0x1f8>
    31d8:      	cmp	x2, #0xf
    31dc:      	b.le	0x30c0 <_stogir.copy.validate+0xb8>
    31e0:      	cmp	x2, #0x80
    31e4:      	b.ge	0x30c0 <_stogir.copy.validate+0xb8>
    31e8:      	and	w1, w1, #0xf
    31ec:      	ubfx	x1, x1, #0, #32
    31f0:      	cmp	x1, #0x1
    31f4:      	b.lt	0x30c0 <_stogir.copy.validate+0xb8>
    31f8:      	cmp	x1, #0xd
    31fc:      	b.gt	0x30c0 <_stogir.copy.validate+0xb8>
    3200:      	mov	x16, sp
    3204:      	ldr	w1, [x16, #0x4]
    3208:      	sxtw	x1, w1
    320c:      	cmp	x1, #0x0
    3210:      	cset	w3, gt
    3214:      	movz	x16, #0x0, lsl #48
    3218:      	sub	x4, x16, x1
    321c:      	sub	x5, x4, #0x1
    3220:      	uxtb	w16, w3
    3224:      	cmp	w16, wzr
    3228:      	b.eq	0x3294 <_stogir.copy.validate+0x28c>
    322c:      	ldr	x4, [x0, #0x8]
    3230:      	cmp	x1, x4
    3234:      	b.ge	0x32dc <_stogir.copy.validate+0x2d4>
    3238:      	add	x4, x0, #0x78
    323c:      	ldr	x4, [x4, #0x8]
    3240:      	cmp	x1, x4
    3244:      	b.ge	0x33a0 <_stogir.copy.validate+0x398>
    3248:      	ldr	x4, [x0, #0x78]
    324c:      	add	x4, x4, x1, lsl #2
    3250:      	ldr	w4, [x4]
    3254:      	sxtw	x4, w4
    3258:      	cmp	x4, #0x0
    325c:      	cset	w4, ge
    3260:      	ubfx	x4, x4, #0, #8
    3264:      	b	0x33a4 <_stogir.copy.validate+0x39c>
    3268:      	movz	x4, #0x0, lsl #48
    326c:      	b	0x30d8 <_stogir.copy.validate+0xd0>
    3270:      	movz	x4, #0x0, lsl #48
    3274:      	b	0x30bc <_stogir.copy.validate+0xb4>
    3278:      	brk	#0
    327c:      	b	0x3278 <_stogir.copy.validate+0x270>
    3280:      	mov	x1, #0x1                ; =1
    3284:      	adrp	x0, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003284:  ARM64_RELOC_PAGE21	l_stogir.361
    3288:      	ldr	x0, [x0]
		0000000000003288:  ARM64_RELOC_PAGEOFF12	l_stogir.361
    328c:      	mov	x2, #0x20               ; =32
    3290:      	b	0x30d0 <_stogir.copy.validate+0xc8>
    3294:      	cmp	x1, #0x0
    3298:      	b.ge	0x32e4 <_stogir.copy.validate+0x2dc>
    329c:      	add	x6, x0, #0x28
    32a0:      	add	x7, x0, #0x50
    32a4:      	ldr	x6, [x6, #0x8]
    32a8:      	ldr	x7, [x7, #0x8]
    32ac:      	cmp	x6, x7
    32b0:      	b.ne	0x3398 <_stogir.copy.validate+0x390>
    32b4:      	cmp	x4, x6
    32b8:      	b.gt	0x33a8 <_stogir.copy.validate+0x3a0>
    32bc:      	ldr	x4, [x0, #0x50]
    32c0:      	add	x4, x4, x5, lsl #2
    32c4:      	ldr	w4, [x4]
    32c8:      	sxtw	x4, w4
    32cc:      	cmp	x4, #0x0
    32d0:      	cset	w4, gt
    32d4:      	ubfx	x4, x4, #0, #8
    32d8:      	b	0x33ac <_stogir.copy.validate+0x3a4>
    32dc:      	movz	x4, #0x0, lsl #48
    32e0:      	b	0x32e8 <_stogir.copy.validate+0x2e0>
    32e4:      	movz	x4, #0x0, lsl #48
    32e8:      	cmp	x4, #0x0
    32ec:      	b.eq	0x3320 <_stogir.copy.validate+0x318>
    32f0:      	uxtb	w16, w3
    32f4:      	cmp	w16, wzr
    32f8:      	b.eq	0x330c <_stogir.copy.validate+0x304>
    32fc:      	ldr	x0, [x0]
    3300:      	add	x0, x0, x1, lsl #4
    3304:      	ldr	x0, [x0]
    3308:      	b	0x3318 <_stogir.copy.validate+0x310>
    330c:      	ldr	x0, [x0, #0x28]
    3310:      	add	x0, x0, x5, lsl #4
    3314:      	ldr	x0, [x0]
    3318:      	mov	w1, #0x1                ; =1
    331c:      	b	0x3328 <_stogir.copy.validate+0x320>
    3320:      	movz	w1, #0x0, lsl #16
    3324:      	movz	x0, #0x0, lsl #48
    3328:      	ubfx	x1, x1, #0, #32
    332c:      	lsr	x16, x1, #0
    3330:      	cmp	x16, #0x1
    3334:      	b.eq	0x3350 <_stogir.copy.validate+0x348>
    3338:      	b.lo	0x3340 <_stogir.copy.validate+0x338>
    333c:      	b	0x3354 <_stogir.copy.validate+0x34c>
    3340:      	cmp	x16, #0x0
    3344:      	b.eq	0x334c <_stogir.copy.validate+0x344>
    3348:      	b	0x3354 <_stogir.copy.validate+0x34c>
    334c:      	b	0x3358 <_stogir.copy.validate+0x350>
    3350:      	b	0x336c <_stogir.copy.validate+0x364>
    3354:      	b	0x33b0 <_stogir.copy.validate+0x3a8>
    3358:      	mov	x1, #0x1                ; =1
    335c:      	adrp	x0, 0x3000 <_stogir.vector.validate+0xa08>
		000000000000335c:  ARM64_RELOC_PAGE21	l_stogir.362
    3360:      	ldr	x0, [x0]
		0000000000003360:  ARM64_RELOC_PAGEOFF12	l_stogir.362
    3364:      	mov	x2, #0x13               ; =19
    3368:      	b	0x3290 <_stogir.copy.validate+0x288>
    336c:      	mov	x16, sp
    3370:      	ldr	w1, [x16]
    3374:      	ubfx	x0, x0, #0, #32
    3378:      	ubfx	x0, x0, #8, #8
    337c:      	ubfx	x1, x1, #8, #8
    3380:      	cmp	x0, x1
    3384:      	b.ne	0x3280 <_stogir.copy.validate+0x278>
    3388:      	and	x0, x2, #0xffffffff
    338c:      	movz	x1, #0x0, lsl #48
    3390:      	movz	x2, #0x0, lsl #48
    3394:      	b	0x3290 <_stogir.copy.validate+0x288>
    3398:      	movz	x4, #0x0, lsl #48
    339c:      	b	0x32e8 <_stogir.copy.validate+0x2e0>
    33a0:      	movz	x4, #0x0, lsl #48
    33a4:      	b	0x32e0 <_stogir.copy.validate+0x2d8>
    33a8:      	movz	x4, #0x0, lsl #48
    33ac:      	b	0x339c <_stogir.copy.validate+0x394>
    33b0:      	brk	#0
    33b4:      	b	0x33b0 <_stogir.copy.validate+0x3a8>

00000000000033b8 <_stogir.graph.lookup>:
    33b8:      	sxtw	x1, w1
    33bc:      	cmp	x1, #0x0
    33c0:      	cset	w2, gt
    33c4:      	movz	x16, #0x0, lsl #48
    33c8:      	sub	x3, x16, x1
    33cc:      	sub	x4, x3, #0x1
    33d0:      	uxtb	w16, w2
    33d4:      	cmp	w16, wzr
    33d8:      	b.eq	0x3418 <_stogir.graph.lookup+0x60>
    33dc:      	ldr	x3, [x0, #0x8]
    33e0:      	cmp	x1, x3
    33e4:      	b.ge	0x3468 <_stogir.graph.lookup+0xb0>
    33e8:      	add	x3, x0, #0x78
    33ec:      	ldr	x3, [x3, #0x8]
    33f0:      	cmp	x1, x3
    33f4:      	b.ge	0x34e0 <_stogir.graph.lookup+0x128>
    33f8:      	ldr	x3, [x0, #0x78]
    33fc:      	add	x3, x3, x1, lsl #2
    3400:      	ldr	w3, [x3]
    3404:      	sxtw	x3, w3
    3408:      	cmp	x3, #0x0
    340c:      	cset	w3, ge
    3410:      	ubfx	x3, x3, #0, #8
    3414:      	b	0x34e4 <_stogir.graph.lookup+0x12c>
    3418:      	cmp	x1, #0x0
    341c:      	b.ge	0x3470 <_stogir.graph.lookup+0xb8>
    3420:      	add	x5, x0, #0x28
    3424:      	add	x6, x0, #0x50
    3428:      	ldr	x5, [x5, #0x8]
    342c:      	ldr	x6, [x6, #0x8]
    3430:      	cmp	x5, x6
    3434:      	b.ne	0x3460 <_stogir.graph.lookup+0xa8>
    3438:      	cmp	x3, x5
    343c:      	b.gt	0x34e8 <_stogir.graph.lookup+0x130>
    3440:      	ldr	x3, [x0, #0x50]
    3444:      	add	x3, x3, x4, lsl #2
    3448:      	ldr	w3, [x3]
    344c:      	sxtw	x3, w3
    3450:      	cmp	x3, #0x0
    3454:      	cset	w3, gt
    3458:      	ubfx	x3, x3, #0, #8
    345c:      	b	0x34ec <_stogir.graph.lookup+0x134>
    3460:      	movz	x3, #0x0, lsl #48
    3464:      	b	0x3474 <_stogir.graph.lookup+0xbc>
    3468:      	movz	x3, #0x0, lsl #48
    346c:      	b	0x3474 <_stogir.graph.lookup+0xbc>
    3470:      	movz	x3, #0x0, lsl #48
    3474:      	cmp	x3, #0x0
    3478:      	b.eq	0x34b4 <_stogir.graph.lookup+0xfc>
    347c:      	uxtb	w16, w2
    3480:      	cmp	w16, wzr
    3484:      	b.eq	0x349c <_stogir.graph.lookup+0xe4>
    3488:      	ldr	x0, [x0]
    348c:      	add	x0, x0, x1, lsl #4
    3490:      	ldr	x1, [x0]
    3494:      	ldr	x0, [x0, #0x8]
    3498:      	b	0x34ac <_stogir.graph.lookup+0xf4>
    349c:      	ldr	x0, [x0, #0x28]
    34a0:      	add	x0, x0, x4, lsl #4
    34a4:      	ldr	x1, [x0]
    34a8:      	ldr	x0, [x0, #0x8]
    34ac:      	mov	x2, #0x1                ; =1
    34b0:      	b	0x34c0 <_stogir.graph.lookup+0x108>
    34b4:      	movz	x2, #0x0, lsl #48
    34b8:      	movz	x1, #0x0, lsl #48
    34bc:      	movz	x0, #0x0, lsl #48
    34c0:      	str	x2, [x8]
    34c4:      	str	x1, [x8, #0x8]
    34c8:      	str	x0, [x8, #0x10]
    34cc:      	movz	x17, #0x0, lsl #48
    34d0:      	str	x17, [x8, #0x18]
    34d4:      	movz	x17, #0x0, lsl #48
    34d8:      	str	x17, [x8, #0x20]
    34dc:      	ret
    34e0:      	movz	x3, #0x0, lsl #48
    34e4:      	b	0x346c <_stogir.graph.lookup+0xb4>
    34e8:      	movz	x3, #0x0, lsl #48
    34ec:      	b	0x3464 <_stogir.graph.lookup+0xac>

00000000000034f0 <_stogir.checked.validate-projection>:
    34f0:      	sub	sp, sp, #0x40
    34f4:      	str	x29, [sp]
    34f8:      	str	x30, [sp, #0x8]
    34fc:      	mov	x29, sp
    3500:      	str	x19, [sp, #0x30]
    3504:      	sxtw	x1, w1
    3508:      	lsl	x2, x1, #2
    350c:      	cmp	x1, #0x0
    3510:      	cset	w3, gt
    3514:      	movz	x16, #0x0, lsl #48
    3518:      	sub	x4, x16, x1
    351c:      	sub	x5, x4, #0x1
    3520:      	uxtb	w16, w3
    3524:      	cmp	w16, wzr
    3528:      	b.eq	0x3568 <_stogir.checked.validate-projection+0x78>
    352c:      	ldr	x4, [x0, #0x8]
    3530:      	cmp	x1, x4
    3534:      	b.ge	0x35b8 <_stogir.checked.validate-projection+0xc8>
    3538:      	add	x4, x0, #0x78
    353c:      	ldr	x4, [x4, #0x8]
    3540:      	cmp	x1, x4
    3544:      	b.ge	0x3688 <_stogir.checked.validate-projection+0x198>
    3548:      	ldr	x4, [x0, #0x78]
    354c:      	add	x4, x2, x4
    3550:      	ldr	w4, [x4]
    3554:      	sxtw	x4, w4
    3558:      	cmp	x4, #0x0
    355c:      	cset	w4, ge
    3560:      	ubfx	x4, x4, #0, #8
    3564:      	b	0x368c <_stogir.checked.validate-projection+0x19c>
    3568:      	cmp	x1, #0x0
    356c:      	b.ge	0x35c0 <_stogir.checked.validate-projection+0xd0>
    3570:      	add	x6, x0, #0x28
    3574:      	add	x7, x0, #0x50
    3578:      	ldr	x6, [x6, #0x8]
    357c:      	ldr	x7, [x7, #0x8]
    3580:      	cmp	x6, x7
    3584:      	b.ne	0x35b0 <_stogir.checked.validate-projection+0xc0>
    3588:      	cmp	x4, x6
    358c:      	b.gt	0x36f4 <_stogir.checked.validate-projection+0x204>
    3590:      	ldr	x4, [x0, #0x50]
    3594:      	add	x4, x4, x5, lsl #2
    3598:      	ldr	w4, [x4]
    359c:      	sxtw	x4, w4
    35a0:      	cmp	x4, #0x0
    35a4:      	cset	w4, gt
    35a8:      	ubfx	x4, x4, #0, #8
    35ac:      	b	0x36f8 <_stogir.checked.validate-projection+0x208>
    35b0:      	movz	x4, #0x0, lsl #48
    35b4:      	b	0x35c4 <_stogir.checked.validate-projection+0xd4>
    35b8:      	movz	x4, #0x0, lsl #48
    35bc:      	b	0x35c4 <_stogir.checked.validate-projection+0xd4>
    35c0:      	movz	x4, #0x0, lsl #48
    35c4:      	cmp	x4, #0x0
    35c8:      	b.eq	0x35fc <_stogir.checked.validate-projection+0x10c>
    35cc:      	uxtb	w16, w3
    35d0:      	cmp	w16, wzr
    35d4:      	b.eq	0x35e8 <_stogir.checked.validate-projection+0xf8>
    35d8:      	ldr	x3, [x0]
    35dc:      	add	x3, x3, x1, lsl #4
    35e0:      	ldr	x3, [x3]
    35e4:      	b	0x35f4 <_stogir.checked.validate-projection+0x104>
    35e8:      	ldr	x3, [x0, #0x28]
    35ec:      	add	x3, x3, x5, lsl #4
    35f0:      	ldr	x3, [x3]
    35f4:      	mov	w4, #0x1                ; =1
    35f8:      	b	0x3604 <_stogir.checked.validate-projection+0x114>
    35fc:      	movz	w4, #0x0, lsl #16
    3600:      	movz	x3, #0x0, lsl #48
    3604:      	ubfx	x4, x4, #0, #32
    3608:      	lsr	x16, x4, #0
    360c:      	cmp	x16, #0x1
    3610:      	b.eq	0x362c <_stogir.checked.validate-projection+0x13c>
    3614:      	b.lo	0x361c <_stogir.checked.validate-projection+0x12c>
    3618:      	b	0x3630 <_stogir.checked.validate-projection+0x140>
    361c:      	cmp	x16, #0x0
    3620:      	b.eq	0x3628 <_stogir.checked.validate-projection+0x138>
    3624:      	b	0x3630 <_stogir.checked.validate-projection+0x140>
    3628:      	b	0x3634 <_stogir.checked.validate-projection+0x144>
    362c:      	b	0x364c <_stogir.checked.validate-projection+0x15c>
    3630:      	b	0x36fc <_stogir.checked.validate-projection+0x20c>
    3634:      	mov	x19, x8
    3638:      	mov	x0, #0x1                ; =1
    363c:      	adrp	x1, 0x3000 <_stogir.vector.validate+0xa08>
		000000000000363c:  ARM64_RELOC_PAGE21	l_stogir.363
    3640:      	ldr	x1, [x1]
		0000000000003640:  ARM64_RELOC_PAGEOFF12	l_stogir.363
    3644:      	mov	x2, #0x10               ; =16
    3648:      	b	0x3668 <_stogir.checked.validate-projection+0x178>
    364c:      	cmp	x1, #0x0
    3650:      	b.gt	0x3690 <_stogir.checked.validate-projection+0x1a0>
    3654:      	mov	x19, x8
    3658:      	mov	x0, #0x1                ; =1
    365c:      	adrp	x1, 0x3000 <_stogir.vector.validate+0xa08>
		000000000000365c:  ARM64_RELOC_PAGE21	l_stogir.364
    3660:      	ldr	x1, [x1]
		0000000000003660:  ARM64_RELOC_PAGEOFF12	l_stogir.364
    3664:      	mov	x2, #0x1c               ; =28
    3668:      	str	x0, [x19]
    366c:      	str	x1, [x19, #0x8]
    3670:      	str	x2, [x19, #0x10]
    3674:      	ldr	x19, [sp, #0x30]
    3678:      	ldr	x29, [sp]
    367c:      	ldr	x30, [sp, #0x8]
    3680:      	add	sp, sp, #0x40
    3684:      	ret
    3688:      	movz	x4, #0x0, lsl #48
    368c:      	b	0x35bc <_stogir.checked.validate-projection+0xcc>
    3690:      	uxtb	w1, w3
    3694:      	cmp	x1, #0x2c
    3698:      	b.ne	0x3704 <_stogir.checked.validate-projection+0x214>
    369c:      	orr	w1, w3, wzr
    36a0:      	ubfx	x1, x1, #0, #32
    36a4:      	ubfx	x1, x1, #8, #8
    36a8:      	cmp	x1, #0x1
    36ac:      	b.ne	0x370c <_stogir.checked.validate-projection+0x21c>
    36b0:      	ldr	x1, [x0, #0x78]
    36b4:      	add	x1, x2, x1
    36b8:      	ldr	w1, [x1]
    36bc:      	sxtw	x1, w1
    36c0:      	cmp	x1, #0x1
    36c4:      	b.ne	0x3714 <_stogir.checked.validate-projection+0x224>
    36c8:      	lsr	x1, x3, #32
    36cc:      	mov	x19, x8
    36d0:      	add	x8, sp, #0x10
    36d4:      	bl	0x36d4 <_stogir.checked.validate-projection+0x1e4>
		00000000000036d4:  ARM64_RELOC_BRANCH26	_stogir.checked.projection
    36d8:      	add	x16, sp, #0x10
    36dc:      	ldr	x0, [x16]
    36e0:      	add	x16, sp, #0x10
    36e4:      	ldr	x1, [x16, #0x8]
    36e8:      	add	x16, sp, #0x10
    36ec:      	ldr	x2, [x16, #0x10]
    36f0:      	b	0x3668 <_stogir.checked.validate-projection+0x178>
    36f4:      	movz	x4, #0x0, lsl #48
    36f8:      	b	0x35b4 <_stogir.checked.validate-projection+0xc4>
    36fc:      	brk	#0
    3700:      	b	0x36fc <_stogir.checked.validate-projection+0x20c>
    3704:      	mov	x19, x8
    3708:      	b	0x3658 <_stogir.checked.validate-projection+0x168>
    370c:      	mov	x19, x8
    3710:      	b	0x3658 <_stogir.checked.validate-projection+0x168>
    3714:      	mov	x19, x8
    3718:      	b	0x3658 <_stogir.checked.validate-projection+0x168>

000000000000371c <_stogir.checked.validate>:
    371c:      	sub	sp, sp, #0x20
    3720:      	str	x29, [sp]
    3724:      	str	x30, [sp, #0x8]
    3728:      	mov	x29, sp
    372c:      	str	x19, [sp, #0x10]
    3730:      	sxtw	x1, w1
    3734:      	lsl	x2, x1, #2
    3738:      	cmp	x1, #0x0
    373c:      	cset	w3, gt
    3740:      	movz	x16, #0x0, lsl #48
    3744:      	sub	x4, x16, x1
    3748:      	sub	x5, x4, #0x1
    374c:      	uxtb	w16, w3
    3750:      	cmp	w16, wzr
    3754:      	b.eq	0x3794 <_stogir.checked.validate+0x78>
    3758:      	ldr	x4, [x0, #0x8]
    375c:      	cmp	x1, x4
    3760:      	b.ge	0x37e4 <_stogir.checked.validate+0xc8>
    3764:      	add	x4, x0, #0x78
    3768:      	ldr	x4, [x4, #0x8]
    376c:      	cmp	x1, x4
    3770:      	b.ge	0x3930 <_stogir.checked.validate+0x214>
    3774:      	ldr	x4, [x0, #0x78]
    3778:      	add	x4, x2, x4
    377c:      	ldr	w4, [x4]
    3780:      	sxtw	x4, w4
    3784:      	cmp	x4, #0x0
    3788:      	cset	w4, ge
    378c:      	ubfx	x4, x4, #0, #8
    3790:      	b	0x3934 <_stogir.checked.validate+0x218>
    3794:      	cmp	x1, #0x0
    3798:      	b.ge	0x37ec <_stogir.checked.validate+0xd0>
    379c:      	add	x6, x0, #0x28
    37a0:      	add	x7, x0, #0x50
    37a4:      	ldr	x6, [x6, #0x8]
    37a8:      	ldr	x7, [x7, #0x8]
    37ac:      	cmp	x6, x7
    37b0:      	b.ne	0x37dc <_stogir.checked.validate+0xc0>
    37b4:      	cmp	x4, x6
    37b8:      	b.gt	0x3938 <_stogir.checked.validate+0x21c>
    37bc:      	ldr	x4, [x0, #0x50]
    37c0:      	add	x4, x4, x5, lsl #2
    37c4:      	ldr	w4, [x4]
    37c8:      	sxtw	x4, w4
    37cc:      	cmp	x4, #0x0
    37d0:      	cset	w4, gt
    37d4:      	ubfx	x4, x4, #0, #8
    37d8:      	b	0x393c <_stogir.checked.validate+0x220>
    37dc:      	movz	x4, #0x0, lsl #48
    37e0:      	b	0x37f0 <_stogir.checked.validate+0xd4>
    37e4:      	movz	x4, #0x0, lsl #48
    37e8:      	b	0x37f0 <_stogir.checked.validate+0xd4>
    37ec:      	movz	x4, #0x0, lsl #48
    37f0:      	cmp	x4, #0x0
    37f4:      	b.eq	0x3830 <_stogir.checked.validate+0x114>
    37f8:      	uxtb	w16, w3
    37fc:      	cmp	w16, wzr
    3800:      	b.eq	0x3818 <_stogir.checked.validate+0xfc>
    3804:      	ldr	x3, [x0]
    3808:      	add	x3, x3, x1, lsl #4
    380c:      	ldr	x4, [x3]
    3810:      	ldr	x3, [x3, #0x8]
    3814:      	b	0x3828 <_stogir.checked.validate+0x10c>
    3818:      	ldr	x3, [x0, #0x28]
    381c:      	add	x3, x3, x5, lsl #4
    3820:      	ldr	x4, [x3]
    3824:      	ldr	x3, [x3, #0x8]
    3828:      	mov	w5, #0x1                ; =1
    382c:      	b	0x383c <_stogir.checked.validate+0x120>
    3830:      	movz	w5, #0x0, lsl #16
    3834:      	movz	x4, #0x0, lsl #48
    3838:      	movz	x3, #0x0, lsl #48
    383c:      	ubfx	x5, x5, #0, #32
    3840:      	lsr	x16, x5, #0
    3844:      	cmp	x16, #0x1
    3848:      	b.eq	0x3864 <_stogir.checked.validate+0x148>
    384c:      	b.lo	0x3854 <_stogir.checked.validate+0x138>
    3850:      	b	0x3868 <_stogir.checked.validate+0x14c>
    3854:      	cmp	x16, #0x0
    3858:      	b.eq	0x3860 <_stogir.checked.validate+0x144>
    385c:      	b	0x3868 <_stogir.checked.validate+0x14c>
    3860:      	b	0x386c <_stogir.checked.validate+0x150>
    3864:      	b	0x38b4 <_stogir.checked.validate+0x198>
    3868:      	b	0x3b50 <_stogir.checked.validate+0x434>
    386c:      	mov	x0, #0x1                ; =1
    3870:      	adrp	x7, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003870:  ARM64_RELOC_PAGE21	l_stogir.365
    3874:      	ldr	x7, [x7]
		0000000000003874:  ARM64_RELOC_PAGEOFF12	l_stogir.365
    3878:      	mov	x9, #0x1a               ; =26
    387c:      	b	0x3890 <_stogir.checked.validate+0x174>
    3880:      	mov	x0, #0x1                ; =1
    3884:      	adrp	x7, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003884:  ARM64_RELOC_PAGE21	l_stogir.366
    3888:      	ldr	x7, [x7]
		0000000000003888:  ARM64_RELOC_PAGEOFF12	l_stogir.366
    388c:      	mov	x9, #0x26               ; =38
    3890:      	str	x0, [x8]
    3894:      	str	x7, [x8, #0x8]
    3898:      	str	x9, [x8, #0x10]
    389c:      	sub	sp, x29, #0x0
    38a0:      	ldr	x19, [sp, #0x10]
    38a4:      	ldr	x29, [sp]
    38a8:      	ldr	x30, [sp, #0x8]
    38ac:      	add	sp, sp, #0x20
    38b0:      	ret
    38b4:      	cmp	x1, #0x0
    38b8:      	b.le	0x3880 <_stogir.checked.validate+0x164>
    38bc:      	uxtb	w1, w4
    38c0:      	cmp	x1, #0x29
    38c4:      	b.lt	0x3880 <_stogir.checked.validate+0x164>
    38c8:      	cmp	x1, #0x2b
    38cc:      	b.gt	0x3880 <_stogir.checked.validate+0x164>
    38d0:      	ldr	x1, [x0, #0x78]
    38d4:      	add	x1, x2, x1
    38d8:      	ldr	w1, [x1]
    38dc:      	sxtw	x1, w1
    38e0:      	cmp	x1, #0x2
    38e4:      	b.ne	0x3880 <_stogir.checked.validate+0x164>
    38e8:      	orr	w1, w4, wzr
    38ec:      	mov	x2, sp
    38f0:      	ubfx	x1, x1, #0, #32
    38f4:      	sub	sp, sp, #0x10
    38f8:      	mov	x5, sp
    38fc:      	sub	sp, sp, #0x10
    3900:      	mov	x6, sp
    3904:      	ubfx	x1, x1, #8, #8
    3908:      	cmp	x1, #0x1
    390c:      	b.lt	0x3b08 <_stogir.checked.validate+0x3ec>
    3910:      	cmp	x1, #0xb
    3914:      	b.gt	0x3b08 <_stogir.checked.validate+0x3ec>
    3918:      	cmp	x1, #0x1
    391c:      	b.eq	0x3b08 <_stogir.checked.validate+0x3ec>
    3920:      	adrp	x7, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003920:  ARM64_RELOC_PAGE21	l_stogir.367
    3924:      	ldr	x7, [x7]
		0000000000003924:  ARM64_RELOC_PAGEOFF12	l_stogir.367
    3928:      	movz	x9, #0x0, lsl #48
    392c:      	b	0x3b14 <_stogir.checked.validate+0x3f8>
    3930:      	movz	x4, #0x0, lsl #48
    3934:      	b	0x37e8 <_stogir.checked.validate+0xcc>
    3938:      	movz	x4, #0x0, lsl #48
    393c:      	b	0x37e0 <_stogir.checked.validate+0xc4>
    3940:      	mov	x0, #0x1                ; =1
    3944:      	mov	sp, x2
    3948:      	b	0x3890 <_stogir.checked.validate+0x174>
    394c:      	movz	w5, #0x0, lsl #16
    3950:      	movz	x4, #0x0, lsl #48
    3954:      	ubfx	x5, x5, #0, #32
    3958:      	lsr	x16, x5, #0
    395c:      	cmp	x16, #0x1
    3960:      	b.eq	0x397c <_stogir.checked.validate+0x260>
    3964:      	b.lo	0x396c <_stogir.checked.validate+0x250>
    3968:      	b	0x3980 <_stogir.checked.validate+0x264>
    396c:      	cmp	x16, #0x0
    3970:      	b.eq	0x3978 <_stogir.checked.validate+0x25c>
    3974:      	b	0x3980 <_stogir.checked.validate+0x264>
    3978:      	b	0x3984 <_stogir.checked.validate+0x268>
    397c:      	b	0x3ae8 <_stogir.checked.validate+0x3cc>
    3980:      	b	0x3b68 <_stogir.checked.validate+0x44c>
    3984:      	adrp	x7, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003984:  ARM64_RELOC_PAGE21	l_stogir.368
    3988:      	ldr	x7, [x7]
		0000000000003988:  ARM64_RELOC_PAGEOFF12	l_stogir.368
    398c:      	mov	x9, #0x22               ; =34
    3990:      	cmp	x3, #0x2
    3994:      	b.ge	0x39b8 <_stogir.checked.validate+0x29c>
    3998:      	add	x4, x3, #0x1
    399c:      	add	x3, x10, x3, lsl #2
    39a0:      	ldr	w3, [x3]
    39a4:      	movn	w17, #0x0, lsl #16
    39a8:      	and	w5, w3, w17
    39ac:      	mov	x3, x4
    39b0:      	mov	w4, #0x1                ; =1
    39b4:      	b	0x39c0 <_stogir.checked.validate+0x2a4>
    39b8:      	movz	w4, #0x0, lsl #16
    39bc:      	movz	w5, #0x0, lsl #16
    39c0:      	ubfx	x4, x4, #0, #32
    39c4:      	lsr	x16, x4, #0
    39c8:      	cmp	x16, #0x1
    39cc:      	b.eq	0x39e8 <_stogir.checked.validate+0x2cc>
    39d0:      	b.lo	0x39d8 <_stogir.checked.validate+0x2bc>
    39d4:      	b	0x39ec <_stogir.checked.validate+0x2d0>
    39d8:      	cmp	x16, #0x0
    39dc:      	b.eq	0x39e4 <_stogir.checked.validate+0x2c8>
    39e0:      	b	0x39ec <_stogir.checked.validate+0x2d0>
    39e4:      	b	0x3a4c <_stogir.checked.validate+0x330>
    39e8:      	b	0x39f0 <_stogir.checked.validate+0x2d4>
    39ec:      	b	0x3b60 <_stogir.checked.validate+0x444>
    39f0:      	sxtw	x5, w5
    39f4:      	cmp	x5, #0x0
    39f8:      	cset	w4, gt
    39fc:      	movz	x16, #0x0, lsl #48
    3a00:      	sub	x6, x16, x5
    3a04:      	sub	x14, x6, #0x1
    3a08:      	uxtb	w16, w4
    3a0c:      	cmp	w16, wzr
    3a10:      	b.eq	0x3aa8 <_stogir.checked.validate+0x38c>
    3a14:      	ldr	x6, [x0, #0x8]
    3a18:      	cmp	x5, x6
    3a1c:      	b.ge	0x3aa0 <_stogir.checked.validate+0x384>
    3a20:      	ldr	x6, [x11, #0x8]
    3a24:      	cmp	x5, x6
    3a28:      	b.ge	0x3b48 <_stogir.checked.validate+0x42c>
    3a2c:      	ldr	x6, [x0, #0x78]
    3a30:      	add	x6, x6, x5, lsl #2
    3a34:      	ldr	w6, [x6]
    3a38:      	sxtw	x6, w6
    3a3c:      	cmp	x6, #0x0
    3a40:      	cset	w6, ge
    3a44:      	ubfx	x6, x6, #0, #8
    3a48:      	b	0x3b4c <_stogir.checked.validate+0x430>
    3a4c:      	cmp	x9, #0x0
    3a50:      	b.ne	0x3940 <_stogir.checked.validate+0x224>
    3a54:      	and	x7, x1, #0xffffffff
    3a58:      	movz	x0, #0x0, lsl #48
    3a5c:      	movz	x9, #0x0, lsl #48
    3a60:      	b	0x3944 <_stogir.checked.validate+0x228>
    3a64:      	ldr	x4, [x0, #0x28]
    3a68:      	add	x4, x4, x14, lsl #4
    3a6c:      	ldr	x4, [x4]
    3a70:      	mov	w5, #0x1                ; =1
    3a74:      	b	0x3954 <_stogir.checked.validate+0x238>
    3a78:      	movz	x6, #0x0, lsl #48
    3a7c:      	cmp	x6, #0x0
    3a80:      	b.eq	0x394c <_stogir.checked.validate+0x230>
    3a84:      	uxtb	w16, w4
    3a88:      	cmp	w16, wzr
    3a8c:      	b.eq	0x3a64 <_stogir.checked.validate+0x348>
    3a90:      	ldr	x4, [x0]
    3a94:      	add	x4, x4, x5, lsl #4
    3a98:      	ldr	x4, [x4]
    3a9c:      	b	0x3a70 <_stogir.checked.validate+0x354>
    3aa0:      	movz	x6, #0x0, lsl #48
    3aa4:      	b	0x3a7c <_stogir.checked.validate+0x360>
    3aa8:      	cmp	x5, #0x0
    3aac:      	b.ge	0x3a78 <_stogir.checked.validate+0x35c>
    3ab0:      	ldr	x15, [x12, #0x8]
    3ab4:      	ldr	x19, [x13, #0x8]
    3ab8:      	cmp	x15, x19
    3abc:      	b.ne	0x3b40 <_stogir.checked.validate+0x424>
    3ac0:      	cmp	x6, x15
    3ac4:      	b.gt	0x3b58 <_stogir.checked.validate+0x43c>
    3ac8:      	ldr	x6, [x0, #0x50]
    3acc:      	add	x6, x6, x14, lsl #2
    3ad0:      	ldr	w6, [x6]
    3ad4:      	sxtw	x6, w6
    3ad8:      	cmp	x6, #0x0
    3adc:      	cset	w6, gt
    3ae0:      	ubfx	x6, x6, #0, #8
    3ae4:      	b	0x3b5c <_stogir.checked.validate+0x440>
    3ae8:      	ubfx	x4, x4, #0, #32
    3aec:      	ubfx	x4, x4, #8, #8
    3af0:      	cmp	x4, x1
    3af4:      	b.eq	0x3b04 <_stogir.checked.validate+0x3e8>
    3af8:      	adrp	x7, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003af8:  ARM64_RELOC_PAGE21	l_stogir.369
    3afc:      	ldr	x7, [x7]
		0000000000003afc:  ARM64_RELOC_PAGEOFF12	l_stogir.369
    3b00:      	mov	x9, #0x28               ; =40
    3b04:      	b	0x3990 <_stogir.checked.validate+0x274>
    3b08:      	adrp	x7, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003b08:  ARM64_RELOC_PAGE21	l_stogir.370
    3b0c:      	ldr	x7, [x7]
		0000000000003b0c:  ARM64_RELOC_PAGEOFF12	l_stogir.370
    3b10:      	mov	x9, #0x36               ; =54
    3b14:      	orr	x10, x6, xzr
    3b18:      	add	x11, x0, #0x78
    3b1c:      	add	x12, x0, #0x28
    3b20:      	add	x13, x0, #0x50
    3b24:      	lsr	x4, x4, #32
    3b28:      	str	w4, [x5]
    3b2c:      	str	w3, [x5, #0x4]
    3b30:      	ldr	x3, [x5]
    3b34:      	str	x3, [x6]
    3b38:      	movz	x3, #0x0, lsl #48
    3b3c:      	b	0x3990 <_stogir.checked.validate+0x274>
    3b40:      	movz	x6, #0x0, lsl #48
    3b44:      	b	0x3a7c <_stogir.checked.validate+0x360>
    3b48:      	movz	x6, #0x0, lsl #48
    3b4c:      	b	0x3aa4 <_stogir.checked.validate+0x388>
    3b50:      	brk	#0
    3b54:      	b	0x3b50 <_stogir.checked.validate+0x434>
    3b58:      	movz	x6, #0x0, lsl #48
    3b5c:      	b	0x3b44 <_stogir.checked.validate+0x428>
    3b60:      	brk	#0
    3b64:      	b	0x3b60 <_stogir.checked.validate+0x444>
    3b68:      	brk	#0
    3b6c:      	b	0x3b68 <_stogir.checked.validate+0x44c>

0000000000003b70 <_stogir.atomic.validate>:
    3b70:      	sub	sp, sp, #0xf0
    3b74:      	str	x29, [sp, #0x10]
    3b78:      	str	x30, [sp, #0x18]
    3b7c:      	add	x29, sp, #0x10
    3b80:      	str	x19, [sp, #0xa0]
    3b84:      	str	x20, [sp, #0xa8]
    3b88:      	str	x21, [sp, #0xb0]
    3b8c:      	str	x22, [sp, #0xb8]
    3b90:      	str	x23, [sp, #0xc0]
    3b94:      	str	x24, [sp, #0xc8]
    3b98:      	str	x25, [sp, #0xd0]
    3b9c:      	str	x26, [sp, #0xd8]
    3ba0:      	str	x27, [sp, #0xe0]
    3ba4:      	sxtw	x2, w1
    3ba8:      	lsl	x3, x2, #2
    3bac:      	cmp	x2, #0x0
    3bb0:      	cset	w4, gt
    3bb4:      	movz	x16, #0x0, lsl #48
    3bb8:      	sub	x5, x16, x2
    3bbc:      	sub	x6, x5, #0x1
    3bc0:      	uxtb	w16, w4
    3bc4:      	cmp	w16, wzr
    3bc8:      	b.eq	0x3c08 <_stogir.atomic.validate+0x98>
    3bcc:      	ldr	x5, [x0, #0x8]
    3bd0:      	cmp	x2, x5
    3bd4:      	b.ge	0x3c58 <_stogir.atomic.validate+0xe8>
    3bd8:      	add	x5, x0, #0x78
    3bdc:      	ldr	x5, [x5, #0x8]
    3be0:      	cmp	x2, x5
    3be4:      	b.ge	0x3d90 <_stogir.atomic.validate+0x220>
    3be8:      	ldr	x5, [x0, #0x78]
    3bec:      	add	x5, x3, x5
    3bf0:      	ldr	w5, [x5]
    3bf4:      	sxtw	x5, w5
    3bf8:      	cmp	x5, #0x0
    3bfc:      	cset	w5, ge
    3c00:      	ubfx	x5, x5, #0, #8
    3c04:      	b	0x3d94 <_stogir.atomic.validate+0x224>
    3c08:      	cmp	x2, #0x0
    3c0c:      	b.ge	0x3c60 <_stogir.atomic.validate+0xf0>
    3c10:      	add	x7, x0, #0x28
    3c14:      	add	x9, x0, #0x50
    3c18:      	ldr	x7, [x7, #0x8]
    3c1c:      	ldr	x9, [x9, #0x8]
    3c20:      	cmp	x7, x9
    3c24:      	b.ne	0x3c50 <_stogir.atomic.validate+0xe0>
    3c28:      	cmp	x5, x7
    3c2c:      	b.gt	0x3e10 <_stogir.atomic.validate+0x2a0>
    3c30:      	ldr	x5, [x0, #0x50]
    3c34:      	add	x5, x5, x6, lsl #2
    3c38:      	ldr	w5, [x5]
    3c3c:      	sxtw	x5, w5
    3c40:      	cmp	x5, #0x0
    3c44:      	cset	w5, gt
    3c48:      	ubfx	x5, x5, #0, #8
    3c4c:      	b	0x3e14 <_stogir.atomic.validate+0x2a4>
    3c50:      	movz	x5, #0x0, lsl #48
    3c54:      	b	0x3c64 <_stogir.atomic.validate+0xf4>
    3c58:      	movz	x5, #0x0, lsl #48
    3c5c:      	b	0x3c64 <_stogir.atomic.validate+0xf4>
    3c60:      	movz	x5, #0x0, lsl #48
    3c64:      	cmp	x5, #0x0
    3c68:      	b.eq	0x3ca4 <_stogir.atomic.validate+0x134>
    3c6c:      	uxtb	w16, w4
    3c70:      	cmp	w16, wzr
    3c74:      	b.eq	0x3c8c <_stogir.atomic.validate+0x11c>
    3c78:      	ldr	x4, [x0]
    3c7c:      	add	x4, x4, x2, lsl #4
    3c80:      	ldr	x19, [x4]
    3c84:      	ldr	x4, [x4, #0x8]
    3c88:      	b	0x3c9c <_stogir.atomic.validate+0x12c>
    3c8c:      	ldr	x4, [x0, #0x28]
    3c90:      	add	x4, x4, x6, lsl #4
    3c94:      	ldr	x19, [x4]
    3c98:      	ldr	x4, [x4, #0x8]
    3c9c:      	mov	w5, #0x1                ; =1
    3ca0:      	b	0x3cb0 <_stogir.atomic.validate+0x140>
    3ca4:      	movz	w5, #0x0, lsl #16
    3ca8:      	movz	x19, #0x0, lsl #48
    3cac:      	movz	x4, #0x0, lsl #48
    3cb0:      	ubfx	x5, x5, #0, #32
    3cb4:      	lsr	x16, x5, #0
    3cb8:      	cmp	x16, #0x1
    3cbc:      	b.eq	0x3cd8 <_stogir.atomic.validate+0x168>
    3cc0:      	b.lo	0x3cc8 <_stogir.atomic.validate+0x158>
    3cc4:      	b	0x3cdc <_stogir.atomic.validate+0x16c>
    3cc8:      	cmp	x16, #0x0
    3ccc:      	b.eq	0x3cd4 <_stogir.atomic.validate+0x164>
    3cd0:      	b	0x3cdc <_stogir.atomic.validate+0x16c>
    3cd4:      	b	0x3ce0 <_stogir.atomic.validate+0x170>
    3cd8:      	b	0x3d34 <_stogir.atomic.validate+0x1c4>
    3cdc:      	b	0x427c <_stogir.atomic.validate+0x70c>
    3ce0:      	mov	x23, x8
    3ce4:      	mov	x0, #0x1                ; =1
    3ce8:      	adrp	x21, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003ce8:  ARM64_RELOC_PAGE21	l_stogir.371
    3cec:      	ldr	x21, [x21]
		0000000000003cec:  ARM64_RELOC_PAGEOFF12	l_stogir.371
    3cf0:      	mov	x22, #0x1a              ; =26
    3cf4:      	str	x0, [x23]
    3cf8:      	str	x21, [x23, #0x8]
    3cfc:      	str	x22, [x23, #0x10]
    3d00:      	ldr	x19, [sp, #0xa0]
    3d04:      	ldr	x20, [sp, #0xa8]
    3d08:      	ldr	x21, [sp, #0xb0]
    3d0c:      	ldr	x22, [sp, #0xb8]
    3d10:      	ldr	x23, [sp, #0xc0]
    3d14:      	ldr	x24, [sp, #0xc8]
    3d18:      	ldr	x25, [sp, #0xd0]
    3d1c:      	ldr	x26, [sp, #0xd8]
    3d20:      	ldr	x27, [sp, #0xe0]
    3d24:      	ldr	x29, [sp, #0x10]
    3d28:      	ldr	x30, [sp, #0x18]
    3d2c:      	add	sp, sp, #0xf0
    3d30:      	ret
    3d34:      	uxtb	w5, w19
    3d38:      	add	x16, sp, #0x20
    3d3c:      	str	x19, [x16]
    3d40:      	orr	x20, x5, xzr
    3d44:      	add	x16, sp, #0x20
    3d48:      	str	x4, [x16, #0x8]
    3d4c:      	cmp	x2, #0x0
    3d50:      	b.le	0x3da0 <_stogir.atomic.validate+0x230>
    3d54:      	cmp	x20, #0x7e
    3d58:      	b.lt	0x3da0 <_stogir.atomic.validate+0x230>
    3d5c:      	cmp	x20, #0x82
    3d60:      	b.gt	0x3da0 <_stogir.atomic.validate+0x230>
    3d64:      	ldr	x2, [x0, #0x78]
    3d68:      	add	x2, x3, x2
    3d6c:      	ldr	w2, [x2]
    3d70:      	cmp	x20, #0x83
    3d74:      	b.ge	0x41b4 <_stogir.atomic.validate+0x644>
    3d78:      	adrp	x17, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003d78:  ARM64_RELOC_PAGE21	l_stogir.372
    3d7c:      	ldr	x17, [x17]
		0000000000003d7c:  ARM64_RELOC_PAGEOFF12	l_stogir.372
    3d80:      	add	x3, x20, x17
    3d84:      	ldrsb	w3, [x3]
    3d88:      	sxtb	w3, w3
    3d8c:      	b	0x41b8 <_stogir.atomic.validate+0x648>
    3d90:      	movz	x5, #0x0, lsl #48
    3d94:      	b	0x3c5c <_stogir.atomic.validate+0xec>
    3d98:      	mov	x0, #0x1                ; =1
    3d9c:      	b	0x3cf4 <_stogir.atomic.validate+0x184>
    3da0:      	adrp	x21, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003da0:  ARM64_RELOC_PAGE21	l_stogir.373
    3da4:      	ldr	x21, [x21]
		0000000000003da4:  ARM64_RELOC_PAGEOFF12	l_stogir.373
    3da8:      	mov	x22, #0x20              ; =32
    3dac:      	add	x16, sp, #0x20
    3db0:      	ldr	w2, [x16, #0x4]
    3db4:      	mov	x23, x8
    3db8:      	add	x8, sp, #0x30
    3dbc:      	mov	x24, x0
    3dc0:      	mov	w25, w1
    3dc4:      	mov	w1, w2
    3dc8:      	bl	0x3dc8 <_stogir.atomic.validate+0x258>
		0000000000003dc8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    3dcc:      	add	x16, sp, #0x30
    3dd0:      	ldr	w0, [x16]
    3dd4:      	lsr	x16, x0, #0
    3dd8:      	cmp	x16, #0x1
    3ddc:      	b.eq	0x3df8 <_stogir.atomic.validate+0x288>
    3de0:      	b.lo	0x3de8 <_stogir.atomic.validate+0x278>
    3de4:      	b	0x3dfc <_stogir.atomic.validate+0x28c>
    3de8:      	cmp	x16, #0x0
    3dec:      	b.eq	0x3df4 <_stogir.atomic.validate+0x284>
    3df0:      	b	0x3dfc <_stogir.atomic.validate+0x28c>
    3df4:      	b	0x3e00 <_stogir.atomic.validate+0x290>
    3df8:      	b	0x3eb8 <_stogir.atomic.validate+0x348>
    3dfc:      	b	0x4284 <_stogir.atomic.validate+0x714>
    3e00:      	adrp	x21, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003e00:  ARM64_RELOC_PAGE21	l_stogir.374
    3e04:      	ldr	x21, [x21]
		0000000000003e04:  ARM64_RELOC_PAGEOFF12	l_stogir.374
    3e08:      	mov	x22, #0x16              ; =22
    3e0c:      	b	0x3e30 <_stogir.atomic.validate+0x2c0>
    3e10:      	movz	x5, #0x0, lsl #48
    3e14:      	b	0x3c54 <_stogir.atomic.validate+0xe4>
    3e18:      	mov	x0, #0x1                ; =1
    3e1c:      	cmp	x0, #0x0
    3e20:      	b.eq	0x3e30 <_stogir.atomic.validate+0x2c0>
    3e24:      	adrp	x21, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003e24:  ARM64_RELOC_PAGE21	l_stogir.375
    3e28:      	ldr	x21, [x21]
		0000000000003e28:  ARM64_RELOC_PAGEOFF12	l_stogir.375
    3e2c:      	mov	x22, #0x16              ; =22
    3e30:      	cmp	x20, #0x82
    3e34:      	cset	w26, eq
    3e38:      	ubfx	x19, x19, #0, #32
    3e3c:      	ubfx	x0, x19, #8, #8
    3e40:      	orr	x19, x0, xzr
    3e44:      	cmp	x19, #0x0
    3e48:      	cset	w27, eq
    3e4c:      	uxtb	w16, w26
    3e50:      	cmp	w16, wzr
    3e54:      	b.eq	0x3e70 <_stogir.atomic.validate+0x300>
    3e58:      	uxtb	w16, w27
    3e5c:      	cmp	w16, wzr
    3e60:      	b.ne	0x3e70 <_stogir.atomic.validate+0x300>
    3e64:      	adrp	x21, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003e64:  ARM64_RELOC_PAGE21	l_stogir.376
    3e68:      	ldr	x21, [x21]
		0000000000003e68:  ARM64_RELOC_PAGEOFF12	l_stogir.376
    3e6c:      	mov	x22, #0x19              ; =25
    3e70:      	uxtb	w16, w26
    3e74:      	cmp	w16, wzr
    3e78:      	b.eq	0x3e84 <_stogir.atomic.validate+0x314>
    3e7c:      	movz	x0, #0x0, lsl #48
    3e80:      	b	0x3e88 <_stogir.atomic.validate+0x318>
    3e84:      	mov	x0, #0x1                ; =1
    3e88:      	cmp	x0, #0x0
    3e8c:      	b.eq	0x3ef4 <_stogir.atomic.validate+0x384>
    3e90:      	add	x16, sp, #0x20
    3e94:      	ldr	w0, [x16, #0x8]
    3e98:      	mov	w1, w0
    3e9c:      	mov	x0, x24
    3ea0:      	mov	x2, #0x6                ; =6
    3ea4:      	bl	0x3ea4 <_stogir.atomic.validate+0x334>
		0000000000003ea4:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    3ea8:      	cmp	x0, #0x0
    3eac:      	b.eq	0x3fa4 <_stogir.atomic.validate+0x434>
    3eb0:      	movz	x0, #0x0, lsl #48
    3eb4:      	b	0x3fa8 <_stogir.atomic.validate+0x438>
    3eb8:      	add	x16, sp, #0x30
    3ebc:      	ldr	x0, [x16, #0x8]
    3ec0:      	add	x16, sp, #0x20
    3ec4:      	ldr	w1, [x16, #0x4]
    3ec8:      	sxtw	x1, w1
    3ecc:      	cmp	x1, #0x0
    3ed0:      	b.gt	0x4038 <_stogir.atomic.validate+0x4c8>
    3ed4:      	mov	x0, #0x1                ; =1
    3ed8:      	b	0x3e1c <_stogir.atomic.validate+0x2ac>
    3edc:      	movz	x0, #0x0, lsl #48
    3ee0:      	cmp	x0, #0x0
    3ee4:      	b.eq	0x3ef4 <_stogir.atomic.validate+0x384>
    3ee8:      	adrp	x21, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003ee8:  ARM64_RELOC_PAGE21	l_stogir.377
    3eec:      	ldr	x21, [x21]
		0000000000003eec:  ARM64_RELOC_PAGEOFF12	l_stogir.377
    3ef0:      	mov	x22, #0x22              ; =34
    3ef4:      	cmp	x20, #0x80
    3ef8:      	cset	w27, eq
    3efc:      	uxtb	w16, w27
    3f00:      	cmp	w16, wzr
    3f04:      	b.eq	0x3f10 <_stogir.atomic.validate+0x3a0>
    3f08:      	mov	x0, #0x1                ; =1
    3f0c:      	b	0x3f1c <_stogir.atomic.validate+0x3ac>
    3f10:      	cmp	x20, #0x81
    3f14:      	cset	w0, eq
    3f18:      	ubfx	x0, x0, #0, #8
    3f1c:      	cmp	x0, #0x0
    3f20:      	b.eq	0x3f70 <_stogir.atomic.validate+0x400>
    3f24:      	mov	x0, x24
    3f28:      	mov	w1, w25
    3f2c:      	mov	x2, #0x4                ; =4
    3f30:      	bl	0x3f30 <_stogir.atomic.validate+0x3c0>
		0000000000003f30:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    3f34:      	ubfx	x0, x0, #0, #32
    3f38:      	lsr	x16, x0, #0
    3f3c:      	cmp	x16, #0x1
    3f40:      	b.eq	0x3f5c <_stogir.atomic.validate+0x3ec>
    3f44:      	b.lo	0x3f4c <_stogir.atomic.validate+0x3dc>
    3f48:      	b	0x3f60 <_stogir.atomic.validate+0x3f0>
    3f4c:      	cmp	x16, #0x0
    3f50:      	b.eq	0x3f58 <_stogir.atomic.validate+0x3e8>
    3f54:      	b	0x3f60 <_stogir.atomic.validate+0x3f0>
    3f58:      	b	0x3f64 <_stogir.atomic.validate+0x3f4>
    3f5c:      	b	0x4108 <_stogir.atomic.validate+0x598>
    3f60:      	b	0x4294 <_stogir.atomic.validate+0x724>
    3f64:      	adrp	x21, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003f64:  ARM64_RELOC_PAGE21	l_stogir.378
    3f68:      	ldr	x21, [x21]
		0000000000003f68:  ARM64_RELOC_PAGEOFF12	l_stogir.378
    3f6c:      	mov	x22, #0x1d              ; =29
    3f70:      	cmp	x22, #0x0
    3f74:      	b.ne	0x3d98 <_stogir.atomic.validate+0x228>
    3f78:      	uxtb	w16, w26
    3f7c:      	cmp	w16, wzr
    3f80:      	b.eq	0x40f4 <_stogir.atomic.validate+0x584>
    3f84:      	movz	x0, #0x0, lsl #48
    3f88:      	b	0x3f94 <_stogir.atomic.validate+0x424>
    3f8c:      	mov	w0, #0x1                ; =1
    3f90:      	sxtw	x0, w0
    3f94:      	and	x21, x0, #0xffffffff
    3f98:      	movz	x0, #0x0, lsl #48
    3f9c:      	movz	x22, #0x0, lsl #48
    3fa0:      	b	0x3d9c <_stogir.atomic.validate+0x22c>
    3fa4:      	mov	x0, #0x1                ; =1
    3fa8:      	cmp	x0, #0x0
    3fac:      	b.eq	0x3fbc <_stogir.atomic.validate+0x44c>
    3fb0:      	adrp	x21, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003fb0:  ARM64_RELOC_PAGE21	l_stogir.379
    3fb4:      	ldr	x21, [x21]
		0000000000003fb4:  ARM64_RELOC_PAGEOFF12	l_stogir.379
    3fb8:      	mov	x22, #0x1b              ; =27
    3fbc:      	cmp	x20, #0x7f
    3fc0:      	b.ne	0x4078 <_stogir.atomic.validate+0x508>
    3fc4:      	uxtb	w16, w27
    3fc8:      	cmp	w16, wzr
    3fcc:      	b.ne	0x3fdc <_stogir.atomic.validate+0x46c>
    3fd0:      	adrp	x21, 0x3000 <_stogir.vector.validate+0xa08>
		0000000000003fd0:  ARM64_RELOC_PAGE21	l_stogir.380
    3fd4:      	ldr	x21, [x21]
		0000000000003fd4:  ARM64_RELOC_PAGEOFF12	l_stogir.380
    3fd8:      	mov	x22, #0x19              ; =25
    3fdc:      	add	x16, sp, #0x20
    3fe0:      	ldr	w0, [x16, #0xc]
    3fe4:      	add	x8, sp, #0x60
    3fe8:      	mov	w1, w0
    3fec:      	mov	x0, x24
    3ff0:      	bl	0x3ff0 <_stogir.atomic.validate+0x480>
		0000000000003ff0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    3ff4:      	add	x16, sp, #0x60
    3ff8:      	ldr	w0, [x16]
    3ffc:      	lsr	x16, x0, #0
    4000:      	cmp	x16, #0x1
    4004:      	b.eq	0x4020 <_stogir.atomic.validate+0x4b0>
    4008:      	b.lo	0x4010 <_stogir.atomic.validate+0x4a0>
    400c:      	b	0x4024 <_stogir.atomic.validate+0x4b4>
    4010:      	cmp	x16, #0x0
    4014:      	b.eq	0x401c <_stogir.atomic.validate+0x4ac>
    4018:      	b	0x4024 <_stogir.atomic.validate+0x4b4>
    401c:      	b	0x4028 <_stogir.atomic.validate+0x4b8>
    4020:      	b	0x4064 <_stogir.atomic.validate+0x4f4>
    4024:      	b	0x429c <_stogir.atomic.validate+0x72c>
    4028:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x490>
		0000000000004028:  ARM64_RELOC_PAGE21	l_stogir.381
    402c:      	ldr	x21, [x21]
		000000000000402c:  ARM64_RELOC_PAGEOFF12	l_stogir.381
    4030:      	mov	x22, #0x1a              ; =26
    4034:      	b	0x4078 <_stogir.atomic.validate+0x508>
    4038:      	uxtb	w0, w0
    403c:      	cmp	x0, #0x83
    4040:      	cset	w1, lt
    4044:      	uxtb	w16, w1
    4048:      	cmp	w16, wzr
    404c:      	b.eq	0x4178 <_stogir.atomic.validate+0x608>
    4050:      	adrp	x17, 0x4000 <_stogir.atomic.validate+0x490>
		0000000000004050:  ARM64_RELOC_PAGE21	l_stogir.382
    4054:      	ldr	x17, [x17]
		0000000000004054:  ARM64_RELOC_PAGEOFF12	l_stogir.382
    4058:      	add	x2, x0, x17
    405c:      	ldrb	w2, [x2]
    4060:      	b	0x417c <_stogir.atomic.validate+0x60c>
    4064:      	add	x16, sp, #0x60
    4068:      	ldr	x0, [x16, #0x8]
    406c:      	ubfx	x0, x0, #0, #32
    4070:      	ubfx	x0, x0, #8, #8
    4074:      	orr	x19, x0, xzr
    4078:      	cmp	x19, #0x2
    407c:      	b.ge	0x40c4 <_stogir.atomic.validate+0x554>
    4080:      	mov	x0, #0x1                ; =1
    4084:      	b	0x40d0 <_stogir.atomic.validate+0x560>
    4088:      	mov	x0, #0x1                ; =1
    408c:      	b	0x3ee0 <_stogir.atomic.validate+0x370>
    4090:      	mov	x0, #0x1                ; =1
    4094:      	cmp	x0, #0x0
    4098:      	b.eq	0x3edc <_stogir.atomic.validate+0x36c>
    409c:      	orr	w0, w19, wzr
    40a0:      	add	x16, sp, #0x20
    40a4:      	ldr	w1, [x16, #0xc]
    40a8:      	mov	w2, w0
    40ac:      	mov	x0, x24
    40b0:      	bl	0x40b0 <_stogir.atomic.validate+0x540>
		00000000000040b0:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    40b4:      	cmp	x0, #0x0
    40b8:      	b.eq	0x4088 <_stogir.atomic.validate+0x518>
    40bc:      	movz	x0, #0x0, lsl #48
    40c0:      	b	0x408c <_stogir.atomic.validate+0x51c>
    40c4:      	cmp	x19, #0x5
    40c8:      	cset	w0, gt
    40cc:      	ubfx	x0, x0, #0, #8
    40d0:      	cmp	x0, #0x0
    40d4:      	b.eq	0x40e4 <_stogir.atomic.validate+0x574>
    40d8:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x490>
		00000000000040d8:  ARM64_RELOC_PAGE21	l_stogir.383
    40dc:      	ldr	x21, [x21]
		00000000000040dc:  ARM64_RELOC_PAGEOFF12	l_stogir.383
    40e0:      	mov	x22, #0x25              ; =37
    40e4:      	cmp	x20, #0x7e
    40e8:      	b.ne	0x4090 <_stogir.atomic.validate+0x520>
    40ec:      	movz	x0, #0x0, lsl #48
    40f0:      	b	0x4094 <_stogir.atomic.validate+0x524>
    40f4:      	sxtw	x19, w19
    40f8:      	cmp	x19, #0x0
    40fc:      	b.ne	0x41d8 <_stogir.atomic.validate+0x668>
    4100:      	movz	w0, #0x0, lsl #16
    4104:      	b	0x3f90 <_stogir.atomic.validate+0x420>
    4108:      	uxtb	w16, w27
    410c:      	cmp	w16, wzr
    4110:      	b.eq	0x4128 <_stogir.atomic.validate+0x5b8>
    4114:      	sxtw	x1, w1
    4118:      	cmp	x1, #0x0
    411c:      	b.ge	0x4258 <_stogir.atomic.validate+0x6e8>
    4120:      	mov	x0, #0x1                ; =1
    4124:      	b	0x4264 <_stogir.atomic.validate+0x6f4>
    4128:      	mov	x0, x24
    412c:      	mov	w2, w19
    4130:      	bl	0x4130 <_stogir.atomic.validate+0x5c0>
		0000000000004130:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    4134:      	cmp	x0, #0x0
    4138:      	b.ne	0x4148 <_stogir.atomic.validate+0x5d8>
    413c:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x490>
		000000000000413c:  ARM64_RELOC_PAGE21	l_stogir.384
    4140:      	ldr	x21, [x21]
		0000000000004140:  ARM64_RELOC_PAGEOFF12	l_stogir.384
    4144:      	mov	x22, #0x24              ; =36
    4148:      	b	0x3f70 <_stogir.atomic.validate+0x400>
    414c:      	movz	w0, #0x0, lsl #16
    4150:      	uxtb	w16, w0
    4154:      	and	w0, w16, #0x4
    4158:      	uxtb	w0, w0
    415c:      	ubfx	x0, x0, #0, #8
    4160:      	cmp	x0, #0x0
    4164:      	cset	w0, eq
    4168:      	uxtb	w16, w0
    416c:      	cmp	w16, wzr
    4170:      	cset	x0, eq
    4174:      	b	0x3e1c <_stogir.atomic.validate+0x2ac>
    4178:      	movz	w2, #0x0, lsl #16
    417c:      	uxtb	w16, w2
    4180:      	and	w2, w16, #0x1
    4184:      	uxtb	w2, w2
    4188:      	ubfx	x2, x2, #0, #8
    418c:      	cmp	x2, #0x0
    4190:      	b.eq	0x3e18 <_stogir.atomic.validate+0x2a8>
    4194:      	uxtb	w16, w1
    4198:      	cmp	w16, wzr
    419c:      	b.eq	0x414c <_stogir.atomic.validate+0x5dc>
    41a0:      	adrp	x17, 0x4000 <_stogir.atomic.validate+0x490>
		00000000000041a0:  ARM64_RELOC_PAGE21	l_stogir.382
    41a4:      	ldr	x17, [x17]
		00000000000041a4:  ARM64_RELOC_PAGEOFF12	l_stogir.382
    41a8:      	add	x0, x0, x17
    41ac:      	ldrb	w0, [x0]
    41b0:      	b	0x4150 <_stogir.atomic.validate+0x5e0>
    41b4:      	mov	w3, #-0x2               ; =-2
    41b8:      	sxtw	x2, w2
    41bc:      	sxtw	x3, w3
    41c0:      	cmp	x2, x3
    41c4:      	b.ne	0x3da0 <_stogir.atomic.validate+0x230>
    41c8:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x490>
		00000000000041c8:  ARM64_RELOC_PAGE21	l_stogir.385
    41cc:      	ldr	x21, [x21]
		00000000000041cc:  ARM64_RELOC_PAGEOFF12	l_stogir.385
    41d0:      	movz	x22, #0x0, lsl #48
    41d4:      	b	0x3dac <_stogir.atomic.validate+0x23c>
    41d8:      	cmp	x19, #0x1
    41dc:      	b.eq	0x3f8c <_stogir.atomic.validate+0x41c>
    41e0:      	cmp	x19, #0x2
    41e4:      	b.eq	0x3f8c <_stogir.atomic.validate+0x41c>
    41e8:      	cmp	x19, #0x7
    41ec:      	b.eq	0x3f8c <_stogir.atomic.validate+0x41c>
    41f0:      	cmp	x19, #0x8
    41f4:      	b.eq	0x3f8c <_stogir.atomic.validate+0x41c>
    41f8:      	cmp	x19, #0x3
    41fc:      	b.eq	0x428c <_stogir.atomic.validate+0x71c>
    4200:      	cmp	x19, #0x9
    4204:      	b.eq	0x428c <_stogir.atomic.validate+0x71c>
    4208:      	cmp	x19, #0x4
    420c:      	b.eq	0x42a4 <_stogir.atomic.validate+0x734>
    4210:      	cmp	x19, #0xa
    4214:      	b.eq	0x42a4 <_stogir.atomic.validate+0x734>
    4218:      	cmp	x19, #0xd
    421c:      	b.eq	0x42a4 <_stogir.atomic.validate+0x734>
    4220:      	cmp	x19, #0x5
    4224:      	b.eq	0x42ac <_stogir.atomic.validate+0x73c>
    4228:      	cmp	x19, #0xb
    422c:      	b.eq	0x42ac <_stogir.atomic.validate+0x73c>
    4230:      	cmp	x19, #0xc
    4234:      	b.eq	0x42ac <_stogir.atomic.validate+0x73c>
    4238:      	cmp	x19, #0x6
    423c:      	cset	w0, eq
    4240:      	uxtb	w16, w0
    4244:      	cmp	w16, wzr
    4248:      	mov	w16, #0x8               ; =8
    424c:      	movn	w17, #0x0, lsl #16
    4250:      	csel	w0, w16, w17, ne
    4254:      	b	0x42b0 <_stogir.atomic.validate+0x740>
    4258:      	cmp	x1, #0x9
    425c:      	cset	w0, gt
    4260:      	ubfx	x0, x0, #0, #8
    4264:      	cmp	x0, #0x0
    4268:      	b.eq	0x4278 <_stogir.atomic.validate+0x708>
    426c:      	adrp	x21, 0x4000 <_stogir.atomic.validate+0x490>
		000000000000426c:  ARM64_RELOC_PAGE21	l_stogir.386
    4270:      	ldr	x21, [x21]
		0000000000004270:  ARM64_RELOC_PAGEOFF12	l_stogir.386
    4274:      	mov	x22, #0x1c              ; =28
    4278:      	b	0x4148 <_stogir.atomic.validate+0x5d8>
    427c:      	brk	#0
    4280:      	b	0x427c <_stogir.atomic.validate+0x70c>
    4284:      	brk	#0
    4288:      	b	0x4284 <_stogir.atomic.validate+0x714>
    428c:      	mov	w0, #0x2                ; =2
    4290:      	b	0x3f90 <_stogir.atomic.validate+0x420>
    4294:      	brk	#0
    4298:      	b	0x4294 <_stogir.atomic.validate+0x724>
    429c:      	brk	#0
    42a0:      	b	0x429c <_stogir.atomic.validate+0x72c>
    42a4:      	mov	w0, #0x4                ; =4
    42a8:      	b	0x4290 <_stogir.atomic.validate+0x720>
    42ac:      	mov	w0, #0x8                ; =8
    42b0:      	b	0x42a8 <_stogir.atomic.validate+0x738>

00000000000042b4 <_stogir.terminal.validate>:
    42b4:      	sub	sp, sp, #0x50
    42b8:      	str	x29, [sp]
    42bc:      	str	x30, [sp, #0x8]
    42c0:      	mov	x29, sp
    42c4:      	str	x19, [sp, #0x40]
    42c8:      	sxtw	x1, w1
    42cc:      	lsl	x2, x1, #2
    42d0:      	cmp	x1, #0x0
    42d4:      	cset	w3, gt
    42d8:      	movz	x16, #0x0, lsl #48
    42dc:      	sub	x4, x16, x1
    42e0:      	sub	x5, x4, #0x1
    42e4:      	uxtb	w16, w3
    42e8:      	cmp	w16, wzr
    42ec:      	b.eq	0x432c <_stogir.terminal.validate+0x78>
    42f0:      	ldr	x4, [x0, #0x8]
    42f4:      	cmp	x1, x4
    42f8:      	b.ge	0x437c <_stogir.terminal.validate+0xc8>
    42fc:      	add	x4, x0, #0x78
    4300:      	ldr	x4, [x4, #0x8]
    4304:      	cmp	x1, x4
    4308:      	b.ge	0x4468 <_stogir.terminal.validate+0x1b4>
    430c:      	ldr	x4, [x0, #0x78]
    4310:      	add	x4, x2, x4
    4314:      	ldr	w4, [x4]
    4318:      	sxtw	x4, w4
    431c:      	cmp	x4, #0x0
    4320:      	cset	w4, ge
    4324:      	ubfx	x4, x4, #0, #8
    4328:      	b	0x446c <_stogir.terminal.validate+0x1b8>
    432c:      	cmp	x1, #0x0
    4330:      	b.ge	0x4384 <_stogir.terminal.validate+0xd0>
    4334:      	add	x6, x0, #0x28
    4338:      	add	x7, x0, #0x50
    433c:      	ldr	x6, [x6, #0x8]
    4340:      	ldr	x7, [x7, #0x8]
    4344:      	cmp	x6, x7
    4348:      	b.ne	0x4374 <_stogir.terminal.validate+0xc0>
    434c:      	cmp	x4, x6
    4350:      	b.gt	0x44a8 <_stogir.terminal.validate+0x1f4>
    4354:      	ldr	x4, [x0, #0x50]
    4358:      	add	x4, x4, x5, lsl #2
    435c:      	ldr	w4, [x4]
    4360:      	sxtw	x4, w4
    4364:      	cmp	x4, #0x0
    4368:      	cset	w4, gt
    436c:      	ubfx	x4, x4, #0, #8
    4370:      	b	0x44ac <_stogir.terminal.validate+0x1f8>
    4374:      	movz	x4, #0x0, lsl #48
    4378:      	b	0x4388 <_stogir.terminal.validate+0xd4>
    437c:      	movz	x4, #0x0, lsl #48
    4380:      	b	0x4388 <_stogir.terminal.validate+0xd4>
    4384:      	movz	x4, #0x0, lsl #48
    4388:      	cmp	x4, #0x0
    438c:      	b.eq	0x43c8 <_stogir.terminal.validate+0x114>
    4390:      	uxtb	w16, w3
    4394:      	cmp	w16, wzr
    4398:      	b.eq	0x43b0 <_stogir.terminal.validate+0xfc>
    439c:      	ldr	x3, [x0]
    43a0:      	add	x3, x3, x1, lsl #4
    43a4:      	ldr	x4, [x3]
    43a8:      	ldr	x3, [x3, #0x8]
    43ac:      	b	0x43c0 <_stogir.terminal.validate+0x10c>
    43b0:      	ldr	x3, [x0, #0x28]
    43b4:      	add	x3, x3, x5, lsl #4
    43b8:      	ldr	x4, [x3]
    43bc:      	ldr	x3, [x3, #0x8]
    43c0:      	mov	w5, #0x1                ; =1
    43c4:      	b	0x43d4 <_stogir.terminal.validate+0x120>
    43c8:      	movz	w5, #0x0, lsl #16
    43cc:      	movz	x4, #0x0, lsl #48
    43d0:      	movz	x3, #0x0, lsl #48
    43d4:      	ubfx	x5, x5, #0, #32
    43d8:      	lsr	x16, x5, #0
    43dc:      	cmp	x16, #0x1
    43e0:      	b.eq	0x43fc <_stogir.terminal.validate+0x148>
    43e4:      	b.lo	0x43ec <_stogir.terminal.validate+0x138>
    43e8:      	b	0x4400 <_stogir.terminal.validate+0x14c>
    43ec:      	cmp	x16, #0x0
    43f0:      	b.eq	0x43f8 <_stogir.terminal.validate+0x144>
    43f4:      	b	0x4400 <_stogir.terminal.validate+0x14c>
    43f8:      	b	0x4404 <_stogir.terminal.validate+0x150>
    43fc:      	b	0x441c <_stogir.terminal.validate+0x168>
    4400:      	b	0x4570 <_stogir.terminal.validate+0x2bc>
    4404:      	mov	x19, x8
    4408:      	mov	x0, #0x1                ; =1
    440c:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		000000000000440c:  ARM64_RELOC_PAGE21	l_stogir.387
    4410:      	ldr	x1, [x1]
		0000000000004410:  ARM64_RELOC_PAGEOFF12	l_stogir.387
    4414:      	mov	x2, #0x21               ; =33
    4418:      	b	0x4448 <_stogir.terminal.validate+0x194>
    441c:      	add	x16, sp, #0x10
    4420:      	str	x4, [x16]
    4424:      	add	x16, sp, #0x10
    4428:      	str	x3, [x16, #0x8]
    442c:      	cmp	x1, #0x0
    4430:      	b.gt	0x4470 <_stogir.terminal.validate+0x1bc>
    4434:      	mov	x19, x8
    4438:      	mov	x0, #0x1                ; =1
    443c:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		000000000000443c:  ARM64_RELOC_PAGE21	l_stogir.388
    4440:      	ldr	x1, [x1]
		0000000000004440:  ARM64_RELOC_PAGEOFF12	l_stogir.388
    4444:      	mov	x2, #0x1b               ; =27
    4448:      	str	x0, [x19]
    444c:      	str	x1, [x19, #0x8]
    4450:      	str	x2, [x19, #0x10]
    4454:      	ldr	x19, [sp, #0x40]
    4458:      	ldr	x29, [sp]
    445c:      	ldr	x30, [sp, #0x8]
    4460:      	add	sp, sp, #0x50
    4464:      	ret
    4468:      	movz	x4, #0x0, lsl #48
    446c:      	b	0x4380 <_stogir.terminal.validate+0xcc>
    4470:      	uxtb	w4, w4
    4474:      	orr	x1, x4, xzr
    4478:      	cmp	x1, #0x60
    447c:      	cset	w3, eq
    4480:      	cmp	x1, #0x79
    4484:      	cset	w1, eq
    4488:      	uxtb	w16, w3
    448c:      	cmp	w16, wzr
    4490:      	b.ne	0x44b0 <_stogir.terminal.validate+0x1fc>
    4494:      	uxtb	w16, w1
    4498:      	cmp	w16, wzr
    449c:      	b.ne	0x44b0 <_stogir.terminal.validate+0x1fc>
    44a0:      	mov	x19, x8
    44a4:      	b	0x4438 <_stogir.terminal.validate+0x184>
    44a8:      	movz	x4, #0x0, lsl #48
    44ac:      	b	0x4378 <_stogir.terminal.validate+0xc4>
    44b0:      	add	x16, sp, #0x10
    44b4:      	ldr	w5, [x16]
    44b8:      	ubfx	x5, x5, #8, #8
    44bc:      	cmp	x5, #0x0
    44c0:      	b.ne	0x4578 <_stogir.terminal.validate+0x2c4>
    44c4:      	uxtb	w16, w3
    44c8:      	cmp	w16, wzr
    44cc:      	mov	w16, #0x1               ; =1
    44d0:      	mov	w17, #0x3               ; =3
    44d4:      	csel	w3, w16, w17, ne
    44d8:      	sxtw	x3, w3
    44dc:      	ldr	x5, [x0, #0x78]
    44e0:      	add	x2, x2, x5
    44e4:      	ldr	w2, [x2]
    44e8:      	sxtw	x2, w2
    44ec:      	cmp	x2, x3
    44f0:      	b.ne	0x4580 <_stogir.terminal.validate+0x2cc>
    44f4:      	uxtb	w16, w1
    44f8:      	cmp	w16, wzr
    44fc:      	b.eq	0x4550 <_stogir.terminal.validate+0x29c>
    4500:      	add	x16, sp, #0x10
    4504:      	ldr	w2, [x16, #0x8]
    4508:      	sxtw	x2, w2
    450c:      	cmp	x2, #0x0
    4510:      	b.eq	0x4550 <_stogir.terminal.validate+0x29c>
    4514:      	mov	x19, x8
    4518:      	b	0x4438 <_stogir.terminal.validate+0x184>
    451c:      	movz	w1, #0x0, lsl #16
    4520:      	mov	w3, w1
    4524:      	mov	w1, w4
    4528:      	mov	x19, x8
    452c:      	add	x8, sp, #0x20
    4530:      	bl	0x4530 <_stogir.terminal.validate+0x27c>
		0000000000004530:  ARM64_RELOC_BRANCH26	_stogir.terminal.inputs
    4534:      	add	x16, sp, #0x20
    4538:      	ldr	x0, [x16]
    453c:      	add	x16, sp, #0x20
    4540:      	ldr	x1, [x16, #0x8]
    4544:      	add	x16, sp, #0x20
    4548:      	ldr	x2, [x16, #0x10]
    454c:      	b	0x4448 <_stogir.terminal.validate+0x194>
    4550:      	add	x16, sp, #0x10
    4554:      	ldr	w2, [x16, #0x4]
    4558:      	uxtb	w16, w1
    455c:      	cmp	w16, wzr
    4560:      	b.eq	0x451c <_stogir.terminal.validate+0x268>
    4564:      	add	x16, sp, #0x10
    4568:      	ldr	w1, [x16, #0xc]
    456c:      	b	0x4520 <_stogir.terminal.validate+0x26c>
    4570:      	brk	#0
    4574:      	b	0x4570 <_stogir.terminal.validate+0x2bc>
    4578:      	mov	x19, x8
    457c:      	b	0x4438 <_stogir.terminal.validate+0x184>
    4580:      	mov	x19, x8
    4584:      	b	0x4438 <_stogir.terminal.validate+0x184>

0000000000004588 <_stogir.switch.validate>:
    4588:      	sub	sp, sp, #0x70
    458c:      	str	x29, [sp]
    4590:      	str	x30, [sp, #0x8]
    4594:      	mov	x29, sp
    4598:      	str	x19, [sp, #0x60]
    459c:      	sxtw	x1, w1
    45a0:      	lsl	x2, x1, #2
    45a4:      	cmp	x1, #0x0
    45a8:      	cset	w3, gt
    45ac:      	movz	x16, #0x0, lsl #48
    45b0:      	sub	x4, x16, x1
    45b4:      	sub	x5, x4, #0x1
    45b8:      	uxtb	w16, w3
    45bc:      	cmp	w16, wzr
    45c0:      	b.eq	0x4600 <_stogir.switch.validate+0x78>
    45c4:      	ldr	x4, [x0, #0x8]
    45c8:      	cmp	x1, x4
    45cc:      	b.ge	0x4650 <_stogir.switch.validate+0xc8>
    45d0:      	add	x4, x0, #0x78
    45d4:      	ldr	x4, [x4, #0x8]
    45d8:      	cmp	x1, x4
    45dc:      	b.ge	0x473c <_stogir.switch.validate+0x1b4>
    45e0:      	ldr	x4, [x0, #0x78]
    45e4:      	add	x4, x2, x4
    45e8:      	ldr	w4, [x4]
    45ec:      	sxtw	x4, w4
    45f0:      	cmp	x4, #0x0
    45f4:      	cset	w4, ge
    45f8:      	ubfx	x4, x4, #0, #8
    45fc:      	b	0x4740 <_stogir.switch.validate+0x1b8>
    4600:      	cmp	x1, #0x0
    4604:      	b.ge	0x4658 <_stogir.switch.validate+0xd0>
    4608:      	add	x6, x0, #0x28
    460c:      	add	x7, x0, #0x50
    4610:      	ldr	x6, [x6, #0x8]
    4614:      	ldr	x7, [x7, #0x8]
    4618:      	cmp	x6, x7
    461c:      	b.ne	0x4648 <_stogir.switch.validate+0xc0>
    4620:      	cmp	x4, x6
    4624:      	b.gt	0x4778 <_stogir.switch.validate+0x1f0>
    4628:      	ldr	x4, [x0, #0x50]
    462c:      	add	x4, x4, x5, lsl #2
    4630:      	ldr	w4, [x4]
    4634:      	sxtw	x4, w4
    4638:      	cmp	x4, #0x0
    463c:      	cset	w4, gt
    4640:      	ubfx	x4, x4, #0, #8
    4644:      	b	0x477c <_stogir.switch.validate+0x1f4>
    4648:      	movz	x4, #0x0, lsl #48
    464c:      	b	0x465c <_stogir.switch.validate+0xd4>
    4650:      	movz	x4, #0x0, lsl #48
    4654:      	b	0x465c <_stogir.switch.validate+0xd4>
    4658:      	movz	x4, #0x0, lsl #48
    465c:      	cmp	x4, #0x0
    4660:      	b.eq	0x469c <_stogir.switch.validate+0x114>
    4664:      	uxtb	w16, w3
    4668:      	cmp	w16, wzr
    466c:      	b.eq	0x4684 <_stogir.switch.validate+0xfc>
    4670:      	ldr	x3, [x0]
    4674:      	add	x3, x3, x1, lsl #4
    4678:      	ldr	x4, [x3]
    467c:      	ldr	x3, [x3, #0x8]
    4680:      	b	0x4694 <_stogir.switch.validate+0x10c>
    4684:      	ldr	x3, [x0, #0x28]
    4688:      	add	x3, x3, x5, lsl #4
    468c:      	ldr	x4, [x3]
    4690:      	ldr	x3, [x3, #0x8]
    4694:      	mov	w5, #0x1                ; =1
    4698:      	b	0x46a8 <_stogir.switch.validate+0x120>
    469c:      	movz	w5, #0x0, lsl #16
    46a0:      	movz	x4, #0x0, lsl #48
    46a4:      	movz	x3, #0x0, lsl #48
    46a8:      	ubfx	x5, x5, #0, #32
    46ac:      	lsr	x16, x5, #0
    46b0:      	cmp	x16, #0x1
    46b4:      	b.eq	0x46d0 <_stogir.switch.validate+0x148>
    46b8:      	b.lo	0x46c0 <_stogir.switch.validate+0x138>
    46bc:      	b	0x46d4 <_stogir.switch.validate+0x14c>
    46c0:      	cmp	x16, #0x0
    46c4:      	b.eq	0x46cc <_stogir.switch.validate+0x144>
    46c8:      	b	0x46d4 <_stogir.switch.validate+0x14c>
    46cc:      	b	0x46d8 <_stogir.switch.validate+0x150>
    46d0:      	b	0x46f0 <_stogir.switch.validate+0x168>
    46d4:      	b	0x4860 <_stogir.switch.validate+0x2d8>
    46d8:      	mov	x19, x8
    46dc:      	mov	x0, #0x1                ; =1
    46e0:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		00000000000046e0:  ARM64_RELOC_PAGE21	l_stogir.389
    46e4:      	ldr	x1, [x1]
		00000000000046e4:  ARM64_RELOC_PAGEOFF12	l_stogir.389
    46e8:      	mov	x2, #0x1a               ; =26
    46ec:      	b	0x471c <_stogir.switch.validate+0x194>
    46f0:      	add	x16, sp, #0x10
    46f4:      	str	x4, [x16]
    46f8:      	add	x16, sp, #0x10
    46fc:      	str	x3, [x16, #0x8]
    4700:      	cmp	x1, #0x0
    4704:      	b.gt	0x4744 <_stogir.switch.validate+0x1bc>
    4708:      	mov	x19, x8
    470c:      	mov	x0, #0x1                ; =1
    4710:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		0000000000004710:  ARM64_RELOC_PAGE21	l_stogir.390
    4714:      	ldr	x1, [x1]
		0000000000004714:  ARM64_RELOC_PAGEOFF12	l_stogir.390
    4718:      	mov	x2, #0x20               ; =32
    471c:      	str	x0, [x19]
    4720:      	str	x1, [x19, #0x8]
    4724:      	str	x2, [x19, #0x10]
    4728:      	ldr	x19, [sp, #0x60]
    472c:      	ldr	x29, [sp]
    4730:      	ldr	x30, [sp, #0x8]
    4734:      	add	sp, sp, #0x70
    4738:      	ret
    473c:      	movz	x4, #0x0, lsl #48
    4740:      	b	0x4654 <_stogir.switch.validate+0xcc>
    4744:      	uxtb	w4, w4
    4748:      	orr	x1, x4, xzr
    474c:      	cmp	x1, #0x75
    4750:      	cset	w3, eq
    4754:      	uxtb	w16, w3
    4758:      	cmp	w16, wzr
    475c:      	b.ne	0x4780 <_stogir.switch.validate+0x1f8>
    4760:      	cmp	x1, #0x6d
    4764:      	b.lt	0x4868 <_stogir.switch.validate+0x2e0>
    4768:      	cmp	x1, #0x6f
    476c:      	b.le	0x4780 <_stogir.switch.validate+0x1f8>
    4770:      	mov	x19, x8
    4774:      	b	0x470c <_stogir.switch.validate+0x184>
    4778:      	movz	x4, #0x0, lsl #48
    477c:      	b	0x464c <_stogir.switch.validate+0xc4>
    4780:      	add	x16, sp, #0x10
    4784:      	ldr	w5, [x16]
    4788:      	ubfx	x5, x5, #8, #8
    478c:      	cmp	x5, #0x0
    4790:      	b.ne	0x4870 <_stogir.switch.validate+0x2e8>
    4794:      	ldr	x5, [x0, #0x78]
    4798:      	add	x2, x2, x5
    479c:      	ldr	w2, [x2]
    47a0:      	cmp	x1, #0x6d
    47a4:      	b.eq	0x4808 <_stogir.switch.validate+0x280>
    47a8:      	cmp	x1, #0x6e
    47ac:      	b.eq	0x4808 <_stogir.switch.validate+0x280>
    47b0:      	mov	w1, #0x2                ; =2
    47b4:      	b	0x480c <_stogir.switch.validate+0x284>
    47b8:      	add	x16, sp, #0x10
    47bc:      	ldr	w1, [x16, #0x4]
    47c0:      	add	x16, sp, #0x10
    47c4:      	ldr	w2, [x16, #0x8]
    47c8:      	add	x16, sp, #0x10
    47cc:      	ldr	w3, [x16, #0xc]
    47d0:      	add	x8, sp, #0x40
    47d4:      	fmov	s31, w1
    47d8:      	mov	w1, w4
    47dc:      	mov	w4, w3
    47e0:      	mov	w3, w2
    47e4:      	fmov	w2, s31
    47e8:      	bl	0x47e8 <_stogir.switch.validate+0x260>
		00000000000047e8:  ARM64_RELOC_BRANCH26	_stogir.switch.case-inputs
    47ec:      	add	x16, sp, #0x40
    47f0:      	ldr	x0, [x16]
    47f4:      	add	x16, sp, #0x40
    47f8:      	ldr	x1, [x16, #0x8]
    47fc:      	add	x16, sp, #0x40
    4800:      	ldr	x2, [x16, #0x10]
    4804:      	b	0x471c <_stogir.switch.validate+0x194>
    4808:      	mov	w1, #0x3                ; =3
    480c:      	sxtw	x2, w2
    4810:      	sxtw	x1, w1
    4814:      	cmp	x2, x1
    4818:      	b.ne	0x4878 <_stogir.switch.validate+0x2f0>
    481c:      	uxtb	w16, w3
    4820:      	cmp	w16, wzr
    4824:      	b.eq	0x4880 <_stogir.switch.validate+0x2f8>
    4828:      	add	x16, sp, #0x10
    482c:      	ldr	w1, [x16, #0x4]
    4830:      	add	x16, sp, #0x10
    4834:      	ldr	w2, [x16, #0x8]
    4838:      	mov	x19, x8
    483c:      	add	x8, sp, #0x20
    4840:      	bl	0x4840 <_stogir.switch.validate+0x2b8>
		0000000000004840:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    4844:      	add	x16, sp, #0x20
    4848:      	ldr	x0, [x16]
    484c:      	add	x16, sp, #0x20
    4850:      	ldr	x1, [x16, #0x8]
    4854:      	add	x16, sp, #0x20
    4858:      	ldr	x2, [x16, #0x10]
    485c:      	b	0x4804 <_stogir.switch.validate+0x27c>
    4860:      	brk	#0
    4864:      	b	0x4860 <_stogir.switch.validate+0x2d8>
    4868:      	mov	x19, x8
    486c:      	b	0x470c <_stogir.switch.validate+0x184>
    4870:      	mov	x19, x8
    4874:      	b	0x470c <_stogir.switch.validate+0x184>
    4878:      	mov	x19, x8
    487c:      	b	0x470c <_stogir.switch.validate+0x184>
    4880:      	mov	x19, x8
    4884:      	b	0x47b8 <_stogir.switch.validate+0x230>

0000000000004888 <_stogir.stack.validate>:
    4888:      	sub	sp, sp, #0x90
    488c:      	str	x29, [sp]
    4890:      	str	x30, [sp, #0x8]
    4894:      	mov	x29, sp
    4898:      	str	x19, [sp, #0x60]
    489c:      	str	x20, [sp, #0x68]
    48a0:      	str	x21, [sp, #0x70]
    48a4:      	str	x22, [sp, #0x78]
    48a8:      	str	x23, [sp, #0x80]
    48ac:      	sxtw	x1, w1
    48b0:      	lsl	x2, x1, #2
    48b4:      	cmp	x1, #0x0
    48b8:      	cset	w3, gt
    48bc:      	movz	x16, #0x0, lsl #48
    48c0:      	sub	x4, x16, x1
    48c4:      	cmp	x1, #0x0
    48c8:      	cset	w5, lt
    48cc:      	sub	x6, x4, #0x1
    48d0:      	lsl	x7, x6, #2
    48d4:      	uxtb	w16, w3
    48d8:      	cmp	w16, wzr
    48dc:      	b.eq	0x491c <_stogir.stack.validate+0x94>
    48e0:      	ldr	x9, [x0, #0x8]
    48e4:      	cmp	x1, x9
    48e8:      	b.ge	0x4994 <_stogir.stack.validate+0x10c>
    48ec:      	add	x9, x0, #0x78
    48f0:      	ldr	x9, [x9, #0x8]
    48f4:      	cmp	x1, x9
    48f8:      	b.ge	0x4ad8 <_stogir.stack.validate+0x250>
    48fc:      	ldr	x9, [x0, #0x78]
    4900:      	add	x9, x2, x9
    4904:      	ldr	w9, [x9]
    4908:      	sxtw	x9, w9
    490c:      	cmp	x9, #0x0
    4910:      	cset	w9, ge
    4914:      	ubfx	x9, x9, #0, #8
    4918:      	b	0x4adc <_stogir.stack.validate+0x254>
    491c:      	uxtb	w16, w5
    4920:      	cmp	w16, wzr
    4924:      	b.eq	0x499c <_stogir.stack.validate+0x114>
    4928:      	add	x9, x0, #0x28
    492c:      	add	x10, x0, #0x50
    4930:      	ldr	x9, [x9, #0x8]
    4934:      	ldr	x10, [x10, #0x8]
    4938:      	cmp	x9, x10
    493c:      	b.ne	0x4968 <_stogir.stack.validate+0xe0>
    4940:      	cmp	x4, x9
    4944:      	b.gt	0x4ae0 <_stogir.stack.validate+0x258>
    4948:      	ldr	x9, [x0, #0x50]
    494c:      	add	x9, x7, x9
    4950:      	ldr	w9, [x9]
    4954:      	sxtw	x9, w9
    4958:      	cmp	x9, #0x0
    495c:      	cset	w9, gt
    4960:      	ubfx	x9, x9, #0, #8
    4964:      	b	0x4ae4 <_stogir.stack.validate+0x25c>
    4968:      	movz	x9, #0x0, lsl #48
    496c:      	b	0x49a0 <_stogir.stack.validate+0x118>
    4970:      	uxtb	w16, w12
    4974:      	cmp	w16, wzr
    4978:      	b.eq	0x4b00 <_stogir.stack.validate+0x278>
    497c:      	mov	x22, x8
    4980:      	mov	x0, #0x1                ; =1
    4984:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		0000000000004984:  ARM64_RELOC_PAGE21	l_stogir.391
    4988:      	ldr	x1, [x1]
		0000000000004988:  ARM64_RELOC_PAGEOFF12	l_stogir.391
    498c:      	mov	x2, #0x19               ; =25
    4990:      	b	0x4a38 <_stogir.stack.validate+0x1b0>
    4994:      	movz	x9, #0x0, lsl #48
    4998:      	b	0x49a0 <_stogir.stack.validate+0x118>
    499c:      	movz	x9, #0x0, lsl #48
    49a0:      	lsl	x10, x1, #4
    49a4:      	lsl	x6, x6, #4
    49a8:      	cmp	x9, #0x0
    49ac:      	b.eq	0x49e8 <_stogir.stack.validate+0x160>
    49b0:      	uxtb	w16, w3
    49b4:      	cmp	w16, wzr
    49b8:      	b.eq	0x49d0 <_stogir.stack.validate+0x148>
    49bc:      	ldr	x9, [x0]
    49c0:      	add	x9, x10, x9
    49c4:      	ldr	x11, [x9]
    49c8:      	ldr	x9, [x9, #0x8]
    49cc:      	b	0x49e0 <_stogir.stack.validate+0x158>
    49d0:      	ldr	x9, [x0, #0x28]
    49d4:      	add	x9, x6, x9
    49d8:      	ldr	x11, [x9]
    49dc:      	ldr	x9, [x9, #0x8]
    49e0:      	mov	w12, #0x1               ; =1
    49e4:      	b	0x49f4 <_stogir.stack.validate+0x16c>
    49e8:      	movz	w12, #0x0, lsl #16
    49ec:      	movz	x11, #0x0, lsl #48
    49f0:      	movz	x9, #0x0, lsl #48
    49f4:      	ubfx	x12, x12, #0, #32
    49f8:      	lsr	x16, x12, #0
    49fc:      	cmp	x16, #0x1
    4a00:      	b.eq	0x4a1c <_stogir.stack.validate+0x194>
    4a04:      	b.lo	0x4a0c <_stogir.stack.validate+0x184>
    4a08:      	b	0x4a20 <_stogir.stack.validate+0x198>
    4a0c:      	cmp	x16, #0x0
    4a10:      	b.eq	0x4a18 <_stogir.stack.validate+0x190>
    4a14:      	b	0x4a20 <_stogir.stack.validate+0x198>
    4a18:      	b	0x4a24 <_stogir.stack.validate+0x19c>
    4a1c:      	b	0x4a68 <_stogir.stack.validate+0x1e0>
    4a20:      	b	0x4e20 <_stogir.stack.validate+0x598>
    4a24:      	mov	x22, x8
    4a28:      	mov	x0, #0x1                ; =1
    4a2c:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		0000000000004a2c:  ARM64_RELOC_PAGE21	l_stogir.392
    4a30:      	ldr	x1, [x1]
		0000000000004a30:  ARM64_RELOC_PAGEOFF12	l_stogir.392
    4a34:      	mov	x2, #0x19               ; =25
    4a38:      	str	x0, [x22]
    4a3c:      	str	x1, [x22, #0x8]
    4a40:      	str	x2, [x22, #0x10]
    4a44:      	ldr	x19, [sp, #0x60]
    4a48:      	ldr	x20, [sp, #0x68]
    4a4c:      	ldr	x21, [sp, #0x70]
    4a50:      	ldr	x22, [sp, #0x78]
    4a54:      	ldr	x23, [sp, #0x80]
    4a58:      	ldr	x29, [sp]
    4a5c:      	ldr	x30, [sp, #0x8]
    4a60:      	add	sp, sp, #0x90
    4a64:      	ret
    4a68:      	cmp	x1, #0x0
    4a6c:      	cset	w12, le
    4a70:      	uxtb	w19, w11
    4a74:      	add	x16, sp, #0x10
    4a78:      	str	x11, [x16]
    4a7c:      	orr	x11, x19, xzr
    4a80:      	add	x16, sp, #0x10
    4a84:      	str	x9, [x16, #0x8]
    4a88:      	cmp	x11, #0x42
    4a8c:      	b.ne	0x4970 <_stogir.stack.validate+0xe8>
    4a90:      	uxtb	w16, w3
    4a94:      	cmp	w16, wzr
    4a98:      	b.eq	0x4b4c <_stogir.stack.validate+0x2c4>
    4a9c:      	ldr	x4, [x0, #0x8]
    4aa0:      	cmp	x1, x4
    4aa4:      	b.ge	0x4b98 <_stogir.stack.validate+0x310>
    4aa8:      	add	x4, x0, #0x78
    4aac:      	ldr	x4, [x4, #0x8]
    4ab0:      	cmp	x1, x4
    4ab4:      	b.ge	0x4c80 <_stogir.stack.validate+0x3f8>
    4ab8:      	ldr	x1, [x0, #0x78]
    4abc:      	add	x1, x2, x1
    4ac0:      	ldr	w1, [x1]
    4ac4:      	sxtw	x1, w1
    4ac8:      	cmp	x1, #0x0
    4acc:      	cset	w1, ge
    4ad0:      	ubfx	x1, x1, #0, #8
    4ad4:      	b	0x4c84 <_stogir.stack.validate+0x3fc>
    4ad8:      	movz	x9, #0x0, lsl #48
    4adc:      	b	0x4998 <_stogir.stack.validate+0x110>
    4ae0:      	movz	x9, #0x0, lsl #48
    4ae4:      	b	0x496c <_stogir.stack.validate+0xe4>
    4ae8:      	mov	x0, #0x1                ; =1
    4aec:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		0000000000004aec:  ARM64_RELOC_PAGE21	l_stogir.393
    4af0:      	ldr	x1, [x1]
		0000000000004af0:  ARM64_RELOC_PAGEOFF12	l_stogir.393
    4af4:      	mov	x2, #0x1e               ; =30
    4af8:      	mov	x22, x8
    4afc:      	b	0x4990 <_stogir.stack.validate+0x108>
    4b00:      	cmp	x11, #0x51
    4b04:      	cset	w1, eq
    4b08:      	cmp	x11, #0x53
    4b0c:      	cset	w20, eq
    4b10:      	cmp	x11, #0x54
    4b14:      	cset	w21, eq
    4b18:      	uxtb	w16, w1
    4b1c:      	cmp	w16, wzr
    4b20:      	b.ne	0x4c88 <_stogir.stack.validate+0x400>
    4b24:      	cmp	x11, #0x52
    4b28:      	b.eq	0x4c88 <_stogir.stack.validate+0x400>
    4b2c:      	uxtb	w16, w20
    4b30:      	cmp	w16, wzr
    4b34:      	b.ne	0x4c88 <_stogir.stack.validate+0x400>
    4b38:      	uxtb	w16, w21
    4b3c:      	cmp	w16, wzr
    4b40:      	b.ne	0x4c88 <_stogir.stack.validate+0x400>
    4b44:      	mov	x22, x8
    4b48:      	b	0x4980 <_stogir.stack.validate+0xf8>
    4b4c:      	uxtb	w16, w5
    4b50:      	cmp	w16, wzr
    4b54:      	b.eq	0x4ba0 <_stogir.stack.validate+0x318>
    4b58:      	add	x1, x0, #0x28
    4b5c:      	add	x5, x0, #0x50
    4b60:      	ldr	x1, [x1, #0x8]
    4b64:      	ldr	x5, [x5, #0x8]
    4b68:      	cmp	x1, x5
    4b6c:      	b.ne	0x4c78 <_stogir.stack.validate+0x3f0>
    4b70:      	cmp	x4, x1
    4b74:      	b.gt	0x4dc8 <_stogir.stack.validate+0x540>
    4b78:      	ldr	x1, [x0, #0x50]
    4b7c:      	add	x1, x7, x1
    4b80:      	ldr	w1, [x1]
    4b84:      	sxtw	x1, w1
    4b88:      	cmp	x1, #0x0
    4b8c:      	cset	w1, gt
    4b90:      	ubfx	x1, x1, #0, #8
    4b94:      	b	0x4dcc <_stogir.stack.validate+0x544>
    4b98:      	movz	x1, #0x0, lsl #48
    4b9c:      	b	0x4ba4 <_stogir.stack.validate+0x31c>
    4ba0:      	movz	x1, #0x0, lsl #48
    4ba4:      	cmp	x1, #0x0
    4ba8:      	b.eq	0x4bdc <_stogir.stack.validate+0x354>
    4bac:      	uxtb	w16, w3
    4bb0:      	cmp	w16, wzr
    4bb4:      	b.eq	0x4bc8 <_stogir.stack.validate+0x340>
    4bb8:      	ldr	x1, [x0]
    4bbc:      	add	x1, x10, x1
    4bc0:      	ldr	x1, [x1]
    4bc4:      	b	0x4bd4 <_stogir.stack.validate+0x34c>
    4bc8:      	ldr	x1, [x0, #0x28]
    4bcc:      	add	x1, x6, x1
    4bd0:      	ldr	x1, [x1]
    4bd4:      	mov	w3, #0x1                ; =1
    4bd8:      	b	0x4be4 <_stogir.stack.validate+0x35c>
    4bdc:      	movz	w3, #0x0, lsl #16
    4be0:      	movz	x1, #0x0, lsl #48
    4be4:      	ubfx	x3, x3, #0, #32
    4be8:      	lsr	x16, x3, #0
    4bec:      	cmp	x16, #0x1
    4bf0:      	b.eq	0x4c0c <_stogir.stack.validate+0x384>
    4bf4:      	b.lo	0x4bfc <_stogir.stack.validate+0x374>
    4bf8:      	b	0x4c10 <_stogir.stack.validate+0x388>
    4bfc:      	cmp	x16, #0x0
    4c00:      	b.eq	0x4c08 <_stogir.stack.validate+0x380>
    4c04:      	b	0x4c10 <_stogir.stack.validate+0x388>
    4c08:      	b	0x4c14 <_stogir.stack.validate+0x38c>
    4c0c:      	b	0x4c28 <_stogir.stack.validate+0x3a0>
    4c10:      	b	0x4e28 <_stogir.stack.validate+0x5a0>
    4c14:      	mov	x0, #0x1                ; =1
    4c18:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		0000000000004c18:  ARM64_RELOC_PAGE21	l_stogir.394
    4c1c:      	ldr	x1, [x1]
		0000000000004c1c:  ARM64_RELOC_PAGEOFF12	l_stogir.394
    4c20:      	mov	x2, #0x21               ; =33
    4c24:      	b	0x4af8 <_stogir.stack.validate+0x270>
    4c28:      	uxtb	w16, w12
    4c2c:      	cmp	w16, wzr
    4c30:      	b.ne	0x4ae8 <_stogir.stack.validate+0x260>
    4c34:      	uxtb	w3, w1
    4c38:      	cmp	x3, #0x42
    4c3c:      	b.ne	0x4ae8 <_stogir.stack.validate+0x260>
    4c40:      	ubfx	x1, x1, #0, #32
    4c44:      	ubfx	x1, x1, #8, #8
    4c48:      	cmp	x1, #0x6
    4c4c:      	b.ne	0x4ae8 <_stogir.stack.validate+0x260>
    4c50:      	ldr	x0, [x0, #0x78]
    4c54:      	add	x0, x2, x0
    4c58:      	ldr	w0, [x0]
    4c5c:      	sxtw	x0, w0
    4c60:      	cmp	x0, #0x0
    4c64:      	b.ne	0x4ae8 <_stogir.stack.validate+0x260>
    4c68:      	movz	x0, #0x0, lsl #48
    4c6c:      	mov	x1, #0x8                ; =8
    4c70:      	movz	x2, #0x0, lsl #48
    4c74:      	b	0x4af8 <_stogir.stack.validate+0x270>
    4c78:      	movz	x1, #0x0, lsl #48
    4c7c:      	b	0x4ba4 <_stogir.stack.validate+0x31c>
    4c80:      	movz	x1, #0x0, lsl #48
    4c84:      	b	0x4b9c <_stogir.stack.validate+0x314>
    4c88:      	ldr	x3, [x0, #0x78]
    4c8c:      	add	x2, x2, x3
    4c90:      	ldr	w2, [x2]
    4c94:      	uxtb	w16, w1
    4c98:      	cmp	w16, wzr
    4c9c:      	b.eq	0x4cfc <_stogir.stack.validate+0x474>
    4ca0:      	mov	w1, #0x3                ; =3
    4ca4:      	b	0x4d10 <_stogir.stack.validate+0x488>
    4ca8:      	add	x16, sp, #0x10
    4cac:      	ldr	w0, [x16]
    4cb0:      	add	x16, sp, #0x10
    4cb4:      	ldr	w1, [x16, #0x4]
    4cb8:      	add	x16, sp, #0x10
    4cbc:      	ldr	w2, [x16, #0x8]
    4cc0:      	ubfx	x0, x0, #8, #8
    4cc4:      	add	x8, sp, #0x20
    4cc8:      	mov	w3, w1
    4ccc:      	mov	w1, w19
    4cd0:      	mov	w4, w2
    4cd4:      	mov	w2, w0
    4cd8:      	mov	x0, x23
    4cdc:      	bl	0x4cdc <_stogir.stack.validate+0x454>
		0000000000004cdc:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-scope-inputs
    4ce0:      	add	x16, sp, #0x20
    4ce4:      	ldr	x0, [x16]
    4ce8:      	add	x16, sp, #0x20
    4cec:      	ldr	x1, [x16, #0x8]
    4cf0:      	add	x16, sp, #0x20
    4cf4:      	ldr	x2, [x16, #0x10]
    4cf8:      	b	0x4990 <_stogir.stack.validate+0x108>
    4cfc:      	uxtb	w16, w20
    4d00:      	cmp	w16, wzr
    4d04:      	mov	w16, #0x1               ; =1
    4d08:      	mov	w17, #0x2               ; =2
    4d0c:      	csel	w1, w16, w17, ne
    4d10:      	sxtw	x2, w2
    4d14:      	sxtw	x1, w1
    4d18:      	cmp	x2, x1
    4d1c:      	b.ne	0x4e30 <_stogir.stack.validate+0x5a8>
    4d20:      	add	x16, sp, #0x10
    4d24:      	ldr	w1, [x16]
    4d28:      	orr	x2, x1, xzr
    4d2c:      	ubfx	x2, x2, #16, #16
    4d30:      	uxth	w16, w2
    4d34:      	and	w2, w16, #0x8000
    4d38:      	uxth	w2, w2
    4d3c:      	ubfx	x2, x2, #0, #16
    4d40:      	cmp	x2, #0x0
    4d44:      	b.ne	0x4dd0 <_stogir.stack.validate+0x548>
    4d48:      	mov	x22, x8
    4d4c:      	mov	x23, x0
    4d50:      	uxtb	w16, w20
    4d54:      	cmp	w16, wzr
    4d58:      	b.ne	0x4ca8 <_stogir.stack.validate+0x420>
    4d5c:      	uxtb	w16, w21
    4d60:      	cmp	w16, wzr
    4d64:      	b.ne	0x4ca8 <_stogir.stack.validate+0x420>
    4d68:      	add	x16, sp, #0x10
    4d6c:      	ldr	w0, [x16]
    4d70:      	add	x16, sp, #0x10
    4d74:      	ldr	w1, [x16, #0x4]
    4d78:      	add	x16, sp, #0x10
    4d7c:      	ldr	w2, [x16, #0x8]
    4d80:      	ubfx	x0, x0, #8, #8
    4d84:      	add	x16, sp, #0x10
    4d88:      	ldr	w3, [x16, #0xc]
    4d8c:      	add	x8, sp, #0x40
    4d90:      	mov	w4, w2
    4d94:      	mov	w2, w0
    4d98:      	mov	x0, x23
    4d9c:      	mov	w5, w3
    4da0:      	mov	w3, w1
    4da4:      	mov	w1, w19
    4da8:      	bl	0x4da8 <_stogir.stack.validate+0x520>
		0000000000004da8:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-inputs
    4dac:      	add	x16, sp, #0x40
    4db0:      	ldr	x0, [x16]
    4db4:      	add	x16, sp, #0x40
    4db8:      	ldr	x1, [x16, #0x8]
    4dbc:      	add	x16, sp, #0x40
    4dc0:      	ldr	x2, [x16, #0x10]
    4dc4:      	b	0x4cf8 <_stogir.stack.validate+0x470>
    4dc8:      	movz	x1, #0x0, lsl #48
    4dcc:      	b	0x4c7c <_stogir.stack.validate+0x3f4>
    4dd0:      	uxtb	w2, w1
    4dd4:      	cmp	x2, #0x51
    4dd8:      	b.ne	0x4e38 <_stogir.stack.validate+0x5b0>
    4ddc:      	ubfx	x1, x1, #16, #16
    4de0:      	cmp	x1, #0x8, lsl #12       ; =0x8000
    4de4:      	b.ne	0x4e40 <_stogir.stack.validate+0x5b8>
    4de8:      	add	x16, sp, #0x10
    4dec:      	ldr	w1, [x16, #0x4]
    4df0:      	add	x16, sp, #0x10
    4df4:      	ldr	w2, [x16, #0x8]
    4df8:      	mov	x22, x8
    4dfc:      	mov	x23, x0
    4e00:      	bl	0x4e00 <_stogir.stack.validate+0x578>
		0000000000004e00:  ARM64_RELOC_BRANCH26	_stogir.stack.valid-frame-object-inputs?
    4e04:      	cmp	x0, #0x0
    4e08:      	b.ne	0x4d50 <_stogir.stack.validate+0x4c8>
    4e0c:      	mov	x0, #0x1                ; =1
    4e10:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		0000000000004e10:  ARM64_RELOC_PAGE21	l_stogir.395
    4e14:      	ldr	x1, [x1]
		0000000000004e14:  ARM64_RELOC_PAGEOFF12	l_stogir.395
    4e18:      	mov	x2, #0x26               ; =38
    4e1c:      	b	0x4cf8 <_stogir.stack.validate+0x470>
    4e20:      	brk	#0
    4e24:      	b	0x4e20 <_stogir.stack.validate+0x598>
    4e28:      	brk	#0
    4e2c:      	b	0x4e28 <_stogir.stack.validate+0x5a0>
    4e30:      	mov	x22, x8
    4e34:      	b	0x4980 <_stogir.stack.validate+0xf8>
    4e38:      	mov	x22, x8
    4e3c:      	b	0x4e0c <_stogir.stack.validate+0x584>
    4e40:      	mov	x22, x8
    4e44:      	b	0x4e0c <_stogir.stack.validate+0x584>

0000000000004e48 <_stogir.locals.validate>:
    4e48:      	sub	sp, sp, #0xb0
    4e4c:      	str	x29, [sp]
    4e50:      	str	x30, [sp, #0x8]
    4e54:      	mov	x29, sp
    4e58:      	str	x19, [sp, #0x70]
    4e5c:      	str	x20, [sp, #0x78]
    4e60:      	str	x21, [sp, #0x80]
    4e64:      	str	x22, [sp, #0x88]
    4e68:      	str	x23, [sp, #0x90]
    4e6c:      	str	x24, [sp, #0x98]
    4e70:      	str	x25, [sp, #0xa0]
    4e74:      	sxtw	x1, w1
    4e78:      	lsl	x3, x1, #2
    4e7c:      	cmp	x1, #0x0
    4e80:      	cset	w4, gt
    4e84:      	movz	x16, #0x0, lsl #48
    4e88:      	sub	x5, x16, x1
    4e8c:      	sub	x6, x5, #0x1
    4e90:      	uxtb	w16, w4
    4e94:      	cmp	w16, wzr
    4e98:      	b.eq	0x4ed8 <_stogir.locals.validate+0x90>
    4e9c:      	ldr	x5, [x0, #0x8]
    4ea0:      	cmp	x1, x5
    4ea4:      	b.ge	0x4f64 <_stogir.locals.validate+0x11c>
    4ea8:      	add	x5, x0, #0x78
    4eac:      	ldr	x5, [x5, #0x8]
    4eb0:      	cmp	x1, x5
    4eb4:      	b.ge	0x505c <_stogir.locals.validate+0x214>
    4eb8:      	ldr	x5, [x0, #0x78]
    4ebc:      	add	x5, x3, x5
    4ec0:      	ldr	w5, [x5]
    4ec4:      	sxtw	x5, w5
    4ec8:      	cmp	x5, #0x0
    4ecc:      	cset	w5, ge
    4ed0:      	ubfx	x5, x5, #0, #8
    4ed4:      	b	0x5060 <_stogir.locals.validate+0x218>
    4ed8:      	cmp	x1, #0x0
    4edc:      	b.ge	0x4f6c <_stogir.locals.validate+0x124>
    4ee0:      	add	x7, x0, #0x28
    4ee4:      	add	x9, x0, #0x50
    4ee8:      	ldr	x7, [x7, #0x8]
    4eec:      	ldr	x9, [x9, #0x8]
    4ef0:      	cmp	x7, x9
    4ef4:      	b.ne	0x4f20 <_stogir.locals.validate+0xd8>
    4ef8:      	cmp	x5, x7
    4efc:      	b.gt	0x50e0 <_stogir.locals.validate+0x298>
    4f00:      	ldr	x5, [x0, #0x50]
    4f04:      	add	x5, x5, x6, lsl #2
    4f08:      	ldr	w5, [x5]
    4f0c:      	sxtw	x5, w5
    4f10:      	cmp	x5, #0x0
    4f14:      	cset	w5, gt
    4f18:      	ubfx	x5, x5, #0, #8
    4f1c:      	b	0x50e4 <_stogir.locals.validate+0x29c>
    4f20:      	movz	x5, #0x0, lsl #48
    4f24:      	b	0x4f70 <_stogir.locals.validate+0x128>
    4f28:      	cmp	x4, #0x0
    4f2c:      	cset	w4, ne
    4f30:      	uxtb	w16, w4
    4f34:      	cmp	w16, wzr
    4f38:      	mov	w16, #0x2               ; =2
    4f3c:      	mov	w17, #0x3               ; =3
    4f40:      	csel	w4, w16, w17, ne
    4f44:      	cmp	x1, #0x0
    4f48:      	b.gt	0x5064 <_stogir.locals.validate+0x21c>
    4f4c:      	mov	x23, x8
    4f50:      	mov	x2, #0x1                ; =1
    4f54:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		0000000000004f54:  ARM64_RELOC_PAGE21	l_stogir.396
    4f58:      	ldr	x1, [x1]
		0000000000004f58:  ARM64_RELOC_PAGEOFF12	l_stogir.396
    4f5c:      	mov	x0, #0x17               ; =23
    4f60:      	b	0x5000 <_stogir.locals.validate+0x1b8>
    4f64:      	movz	x5, #0x0, lsl #48
    4f68:      	b	0x4f70 <_stogir.locals.validate+0x128>
    4f6c:      	movz	x5, #0x0, lsl #48
    4f70:      	cmp	x5, #0x0
    4f74:      	b.eq	0x4fb0 <_stogir.locals.validate+0x168>
    4f78:      	uxtb	w16, w4
    4f7c:      	cmp	w16, wzr
    4f80:      	b.eq	0x4f98 <_stogir.locals.validate+0x150>
    4f84:      	ldr	x4, [x0]
    4f88:      	add	x4, x4, x1, lsl #4
    4f8c:      	ldr	x5, [x4]
    4f90:      	ldr	x4, [x4, #0x8]
    4f94:      	b	0x4fa8 <_stogir.locals.validate+0x160>
    4f98:      	ldr	x4, [x0, #0x28]
    4f9c:      	add	x4, x4, x6, lsl #4
    4fa0:      	ldr	x5, [x4]
    4fa4:      	ldr	x4, [x4, #0x8]
    4fa8:      	mov	w6, #0x1                ; =1
    4fac:      	b	0x4fbc <_stogir.locals.validate+0x174>
    4fb0:      	movz	w6, #0x0, lsl #16
    4fb4:      	movz	x5, #0x0, lsl #48
    4fb8:      	movz	x4, #0x0, lsl #48
    4fbc:      	ubfx	x6, x6, #0, #32
    4fc0:      	lsr	x16, x6, #0
    4fc4:      	cmp	x16, #0x1
    4fc8:      	b.eq	0x4fe4 <_stogir.locals.validate+0x19c>
    4fcc:      	b.lo	0x4fd4 <_stogir.locals.validate+0x18c>
    4fd0:      	b	0x4fe8 <_stogir.locals.validate+0x1a0>
    4fd4:      	cmp	x16, #0x0
    4fd8:      	b.eq	0x4fe0 <_stogir.locals.validate+0x198>
    4fdc:      	b	0x4fe8 <_stogir.locals.validate+0x1a0>
    4fe0:      	b	0x4fec <_stogir.locals.validate+0x1a4>
    4fe4:      	b	0x5038 <_stogir.locals.validate+0x1f0>
    4fe8:      	b	0x5208 <_stogir.locals.validate+0x3c0>
    4fec:      	mov	x23, x8
    4ff0:      	mov	x2, #0x1                ; =1
    4ff4:      	adrp	x1, 0x4000 <_stogir.atomic.validate+0x490>
		0000000000004ff4:  ARM64_RELOC_PAGE21	l_stogir.397
    4ff8:      	ldr	x1, [x1]
		0000000000004ff8:  ARM64_RELOC_PAGEOFF12	l_stogir.397
    4ffc:      	mov	x0, #0x17               ; =23
    5000:      	str	x2, [x23]
    5004:      	str	x1, [x23, #0x8]
    5008:      	str	x0, [x23, #0x10]
    500c:      	ldr	x19, [sp, #0x70]
    5010:      	ldr	x20, [sp, #0x78]
    5014:      	ldr	x21, [sp, #0x80]
    5018:      	ldr	x22, [sp, #0x88]
    501c:      	ldr	x23, [sp, #0x90]
    5020:      	ldr	x24, [sp, #0x98]
    5024:      	ldr	x25, [sp, #0xa0]
    5028:      	ldr	x29, [sp]
    502c:      	ldr	x30, [sp, #0x8]
    5030:      	add	sp, sp, #0xb0
    5034:      	ret
    5038:      	uxtb	w6, w5
    503c:      	add	x16, sp, #0x10
    5040:      	str	x5, [x16]
    5044:      	add	x16, sp, #0x10
    5048:      	str	x4, [x16, #0x8]
    504c:      	cmp	x6, #0x55
    5050:      	b.ne	0x50c4 <_stogir.locals.validate+0x27c>
    5054:      	mov	x4, #0x1                ; =1
    5058:      	b	0x50d0 <_stogir.locals.validate+0x288>
    505c:      	movz	x5, #0x0, lsl #48
    5060:      	b	0x4f68 <_stogir.locals.validate+0x120>
    5064:      	cmp	x6, #0x48
    5068:      	cset	w21, eq
    506c:      	uxtb	w16, w20
    5070:      	cmp	w16, wzr
    5074:      	b.ne	0x50e8 <_stogir.locals.validate+0x2a0>
    5078:      	uxtb	w16, w21
    507c:      	cmp	w16, wzr
    5080:      	b.ne	0x50e8 <_stogir.locals.validate+0x2a0>
    5084:      	cmp	x6, #0x55
    5088:      	b.lt	0x554c <_stogir.locals.validate+0x704>
    508c:      	cmp	x6, #0x58
    5090:      	b.le	0x50e8 <_stogir.locals.validate+0x2a0>
    5094:      	mov	x23, x8
    5098:      	b	0x4f50 <_stogir.locals.validate+0x108>
    509c:      	cmp	x6, #0x58
    50a0:      	cset	w5, eq
    50a4:      	ubfx	x19, x5, #0, #8
    50a8:      	cmp	x6, #0x41
    50ac:      	cset	w20, eq
    50b0:      	uxtb	w16, w20
    50b4:      	cmp	w16, wzr
    50b8:      	b.eq	0x4f28 <_stogir.locals.validate+0xe0>
    50bc:      	mov	w4, #0x1                ; =1
    50c0:      	b	0x4f44 <_stogir.locals.validate+0xfc>
    50c4:      	cmp	x6, #0x56
    50c8:      	cset	w4, eq
    50cc:      	ubfx	x4, x4, #0, #8
    50d0:      	cmp	x6, #0x57
    50d4:      	b.ne	0x509c <_stogir.locals.validate+0x254>
    50d8:      	mov	x19, #0x1               ; =1
    50dc:      	b	0x50a8 <_stogir.locals.validate+0x260>
    50e0:      	movz	x5, #0x0, lsl #48
    50e4:      	b	0x4f24 <_stogir.locals.validate+0xdc>
    50e8:      	sxtw	x4, w4
    50ec:      	ldr	x5, [x0, #0x78]
    50f0:      	add	x3, x3, x5
    50f4:      	ldr	w3, [x3]
    50f8:      	sxtw	x3, w3
    50fc:      	cmp	x3, x4
    5100:      	b.ne	0x5554 <_stogir.locals.validate+0x70c>
    5104:      	uxtb	w16, w20
    5108:      	cmp	w16, wzr
    510c:      	b.ne	0x512c <_stogir.locals.validate+0x2e4>
    5110:      	uxtb	w16, w21
    5114:      	cmp	w16, wzr
    5118:      	b.ne	0x512c <_stogir.locals.validate+0x2e4>
    511c:      	add	x16, sp, #0x10
    5120:      	ldr	w1, [x16, #0x8]
    5124:      	sxtw	x1, w1
    5128:      	b	0x5144 <_stogir.locals.validate+0x2fc>
    512c:      	uxtb	w16, w21
    5130:      	cmp	w16, wzr
    5134:      	b.ne	0x5144 <_stogir.locals.validate+0x2fc>
    5138:      	add	x16, sp, #0x10
    513c:      	ldr	w1, [x16, #0x4]
    5140:      	sxtw	x1, w1
    5144:      	add	x16, sp, #0x20
    5148:      	orr	x22, x16, xzr
    514c:      	mov	x23, x8
    5150:      	add	x8, sp, #0x20
    5154:      	mov	x24, x0
    5158:      	mov	w25, w2
    515c:      	bl	0x515c <_stogir.locals.validate+0x314>
		000000000000515c:  ARM64_RELOC_BRANCH26	_stogir.locals.shape
    5160:      	add	x16, sp, #0x20
    5164:      	ldr	w0, [x16]
    5168:      	lsr	x16, x0, #0
    516c:      	cmp	x16, #0x1
    5170:      	b.eq	0x518c <_stogir.locals.validate+0x344>
    5174:      	b.lo	0x517c <_stogir.locals.validate+0x334>
    5178:      	b	0x5190 <_stogir.locals.validate+0x348>
    517c:      	cmp	x16, #0x0
    5180:      	b.eq	0x5188 <_stogir.locals.validate+0x340>
    5184:      	b	0x5190 <_stogir.locals.validate+0x348>
    5188:      	b	0x51ac <_stogir.locals.validate+0x364>
    518c:      	b	0x5194 <_stogir.locals.validate+0x34c>
    5190:      	b	0x53d0 <_stogir.locals.validate+0x588>
    5194:      	add	x0, x22, #0x8
    5198:      	add	x16, sp, #0x20
    519c:      	ldr	x1, [x16, #0x8]
    51a0:      	ldr	x0, [x0, #0x8]
    51a4:      	mov	x2, #0x1                ; =1
    51a8:      	b	0x4f60 <_stogir.locals.validate+0x118>
    51ac:      	add	x16, sp, #0x20
    51b0:      	ldr	x22, [x16, #0x8]
    51b4:      	uxtb	w16, w21
    51b8:      	cmp	w16, wzr
    51bc:      	b.eq	0x51d4 <_stogir.locals.validate+0x38c>
    51c0:      	sxtw	x22, w22
    51c4:      	and	x1, x22, #0xffffffff
    51c8:      	movz	x2, #0x0, lsl #48
    51cc:      	movz	x0, #0x0, lsl #48
    51d0:      	b	0x51a8 <_stogir.locals.validate+0x360>
    51d4:      	uxtb	w16, w20
    51d8:      	cmp	w16, wzr
    51dc:      	b.eq	0x5224 <_stogir.locals.validate+0x3dc>
    51e0:      	add	x16, sp, #0x10
    51e4:      	ldr	w0, [x16]
    51e8:      	ubfx	x0, x0, #8, #8
    51ec:      	cmp	x0, #0x6
    51f0:      	b.ne	0x5210 <_stogir.locals.validate+0x3c8>
    51f4:      	sxtw	x25, w25
    51f8:      	and	x1, x25, #0xffffffff
    51fc:      	movz	x2, #0x0, lsl #48
    5200:      	movz	x0, #0x0, lsl #48
    5204:      	b	0x5220 <_stogir.locals.validate+0x3d8>
    5208:      	brk	#0
    520c:      	b	0x5208 <_stogir.locals.validate+0x3c0>
    5210:      	mov	x2, #0x1                ; =1
    5214:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005214:  ARM64_RELOC_PAGE21	l_stogir.398
    5218:      	ldr	x1, [x1]
		0000000000005218:  ARM64_RELOC_PAGEOFF12	l_stogir.398
    521c:      	mov	x0, #0x21               ; =33
    5220:      	b	0x51d0 <_stogir.locals.validate+0x388>
    5224:      	add	x16, sp, #0x10
    5228:      	ldr	w0, [x16, #0x4]
    522c:      	sxtw	x0, w0
    5230:      	cmp	x0, #0x0
    5234:      	cset	w1, gt
    5238:      	movz	x16, #0x0, lsl #48
    523c:      	sub	x2, x16, x0
    5240:      	sub	x3, x2, #0x1
    5244:      	uxtb	w16, w1
    5248:      	cmp	w16, wzr
    524c:      	b.eq	0x531c <_stogir.locals.validate+0x4d4>
    5250:      	ldr	x2, [x24, #0x8]
    5254:      	cmp	x0, x2
    5258:      	b.ge	0x5314 <_stogir.locals.validate+0x4cc>
    525c:      	add	x2, x24, #0x78
    5260:      	ldr	x2, [x2, #0x8]
    5264:      	cmp	x0, x2
    5268:      	b.ge	0x53c0 <_stogir.locals.validate+0x578>
    526c:      	ldr	x2, [x24, #0x78]
    5270:      	add	x2, x2, x0, lsl #2
    5274:      	ldr	w2, [x2]
    5278:      	sxtw	x2, w2
    527c:      	cmp	x2, #0x0
    5280:      	cset	w2, ge
    5284:      	ubfx	x2, x2, #0, #8
    5288:      	b	0x53c4 <_stogir.locals.validate+0x57c>
    528c:      	movz	w1, #0x0, lsl #16
    5290:      	movz	x0, #0x0, lsl #48
    5294:      	ubfx	x1, x1, #0, #32
    5298:      	lsr	x16, x1, #0
    529c:      	cmp	x16, #0x1
    52a0:      	b.eq	0x52bc <_stogir.locals.validate+0x474>
    52a4:      	b.lo	0x52ac <_stogir.locals.validate+0x464>
    52a8:      	b	0x52c0 <_stogir.locals.validate+0x478>
    52ac:      	cmp	x16, #0x0
    52b0:      	b.eq	0x52b8 <_stogir.locals.validate+0x470>
    52b4:      	b	0x52c0 <_stogir.locals.validate+0x478>
    52b8:      	b	0x52c4 <_stogir.locals.validate+0x47c>
    52bc:      	b	0x5364 <_stogir.locals.validate+0x51c>
    52c0:      	b	0x5520 <_stogir.locals.validate+0x6d8>
    52c4:      	mov	x2, #0x1                ; =1
    52c8:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		00000000000052c8:  ARM64_RELOC_PAGE21	l_stogir.399
    52cc:      	ldr	x1, [x1]
		00000000000052cc:  ARM64_RELOC_PAGEOFF12	l_stogir.399
    52d0:      	mov	x0, #0x1c               ; =28
    52d4:      	b	0x5220 <_stogir.locals.validate+0x3d8>
    52d8:      	ldr	x0, [x24, #0x28]
    52dc:      	add	x0, x0, x3, lsl #4
    52e0:      	ldr	x0, [x0]
    52e4:      	mov	w1, #0x1                ; =1
    52e8:      	b	0x5294 <_stogir.locals.validate+0x44c>
    52ec:      	movz	x2, #0x0, lsl #48
    52f0:      	cmp	x2, #0x0
    52f4:      	b.eq	0x528c <_stogir.locals.validate+0x444>
    52f8:      	uxtb	w16, w1
    52fc:      	cmp	w16, wzr
    5300:      	b.eq	0x52d8 <_stogir.locals.validate+0x490>
    5304:      	ldr	x1, [x24]
    5308:      	add	x0, x1, x0, lsl #4
    530c:      	ldr	x0, [x0]
    5310:      	b	0x52e4 <_stogir.locals.validate+0x49c>
    5314:      	movz	x2, #0x0, lsl #48
    5318:      	b	0x52f0 <_stogir.locals.validate+0x4a8>
    531c:      	cmp	x0, #0x0
    5320:      	b.ge	0x52ec <_stogir.locals.validate+0x4a4>
    5324:      	add	x4, x24, #0x28
    5328:      	add	x5, x24, #0x50
    532c:      	ldr	x4, [x4, #0x8]
    5330:      	ldr	x5, [x5, #0x8]
    5334:      	cmp	x4, x5
    5338:      	b.ne	0x53b8 <_stogir.locals.validate+0x570>
    533c:      	cmp	x2, x4
    5340:      	b.gt	0x53c8 <_stogir.locals.validate+0x580>
    5344:      	ldr	x2, [x24, #0x50]
    5348:      	add	x2, x2, x3, lsl #2
    534c:      	ldr	w2, [x2]
    5350:      	sxtw	x2, w2
    5354:      	cmp	x2, #0x0
    5358:      	cset	w2, gt
    535c:      	ubfx	x2, x2, #0, #8
    5360:      	b	0x53cc <_stogir.locals.validate+0x584>
    5364:      	add	x16, sp, #0x10
    5368:      	ldr	w1, [x16, #0x4]
    536c:      	sxtw	x1, w1
    5370:      	cmp	x1, #0x0
    5374:      	b.le	0x53a4 <_stogir.locals.validate+0x55c>
    5378:      	uxtb	w0, w0
    537c:      	cmp	x0, #0x83
    5380:      	cset	w1, lt
    5384:      	uxtb	w16, w1
    5388:      	cmp	w16, wzr
    538c:      	b.eq	0x53d8 <_stogir.locals.validate+0x590>
    5390:      	adrp	x17, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005390:  ARM64_RELOC_PAGE21	l_stogir.400
    5394:      	ldr	x17, [x17]
		0000000000005394:  ARM64_RELOC_PAGEOFF12	l_stogir.400
    5398:      	add	x2, x0, x17
    539c:      	ldrb	w2, [x2]
    53a0:      	b	0x53dc <_stogir.locals.validate+0x594>
    53a4:      	mov	x2, #0x1                ; =1
    53a8:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		00000000000053a8:  ARM64_RELOC_PAGE21	l_stogir.401
    53ac:      	ldr	x1, [x1]
		00000000000053ac:  ARM64_RELOC_PAGEOFF12	l_stogir.401
    53b0:      	mov	x0, #0x1c               ; =28
    53b4:      	b	0x52d4 <_stogir.locals.validate+0x48c>
    53b8:      	movz	x2, #0x0, lsl #48
    53bc:      	b	0x52f0 <_stogir.locals.validate+0x4a8>
    53c0:      	movz	x2, #0x0, lsl #48
    53c4:      	b	0x5318 <_stogir.locals.validate+0x4d0>
    53c8:      	movz	x2, #0x0, lsl #48
    53cc:      	b	0x53bc <_stogir.locals.validate+0x574>
    53d0:      	brk	#0
    53d4:      	b	0x53d0 <_stogir.locals.validate+0x588>
    53d8:      	movz	w2, #0x0, lsl #16
    53dc:      	uxtb	w16, w2
    53e0:      	and	w2, w16, #0x1
    53e4:      	uxtb	w2, w2
    53e8:      	ubfx	x2, x2, #0, #8
    53ec:      	cmp	x2, #0x0
    53f0:      	b.eq	0x53a4 <_stogir.locals.validate+0x55c>
    53f4:      	uxtb	w16, w1
    53f8:      	cmp	w16, wzr
    53fc:      	b.eq	0x5414 <_stogir.locals.validate+0x5cc>
    5400:      	adrp	x17, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005400:  ARM64_RELOC_PAGE21	l_stogir.400
    5404:      	ldr	x17, [x17]
		0000000000005404:  ARM64_RELOC_PAGEOFF12	l_stogir.400
    5408:      	add	x0, x0, x17
    540c:      	ldrb	w0, [x0]
    5410:      	b	0x5418 <_stogir.locals.validate+0x5d0>
    5414:      	movz	w0, #0x0, lsl #16
    5418:      	uxtb	w16, w0
    541c:      	and	w0, w16, #0x4
    5420:      	uxtb	w0, w0
    5424:      	ubfx	x0, x0, #0, #8
    5428:      	cmp	x0, #0x0
    542c:      	cset	w0, eq
    5430:      	uxtb	w16, w0
    5434:      	cmp	w16, wzr
    5438:      	cset	x0, eq
    543c:      	cmp	x0, #0x0
    5440:      	b.ne	0x53a4 <_stogir.locals.validate+0x55c>
    5444:      	cmp	x19, #0x0
    5448:      	b.eq	0x54d0 <_stogir.locals.validate+0x688>
    544c:      	add	x16, sp, #0x10
    5450:      	ldr	w0, [x16, #0xc]
    5454:      	add	x8, sp, #0x40
    5458:      	mov	w1, w0
    545c:      	mov	x0, x24
    5460:      	bl	0x5460 <_stogir.locals.validate+0x618>
		0000000000005460:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    5464:      	add	x16, sp, #0x40
    5468:      	ldr	x0, [x16]
    546c:      	add	x16, sp, #0x40
    5470:      	ldr	x20, [x16, #0x8]
    5474:      	b	0x54dc <_stogir.locals.validate+0x694>
    5478:      	orr	w0, w20, wzr
    547c:      	ubfx	x0, x0, #0, #32
    5480:      	ubfx	x0, x0, #8, #8
    5484:      	mov	w1, w25
    5488:      	bl	0x5488 <_stogir.locals.validate+0x640>
		0000000000005488:  ARM64_RELOC_BRANCH26	_stogir.types.size
    548c:      	sxtw	x0, w0
    5490:      	cmp	x0, #0x0
    5494:      	b.le	0x54bc <_stogir.locals.validate+0x674>
    5498:      	cmp	x0, x22
    549c:      	b.gt	0x54bc <_stogir.locals.validate+0x674>
    54a0:      	cmp	x19, #0x0
    54a4:      	b.eq	0x5528 <_stogir.locals.validate+0x6e0>
    54a8:      	add	x16, sp, #0x10
    54ac:      	ldr	w1, [x16]
    54b0:      	ubfx	x1, x1, #8, #8
    54b4:      	cmp	x1, #0x0
    54b8:      	b.eq	0x5528 <_stogir.locals.validate+0x6e0>
    54bc:      	mov	x2, #0x1                ; =1
    54c0:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		00000000000054c0:  ARM64_RELOC_PAGE21	l_stogir.402
    54c4:      	ldr	x1, [x1]
		00000000000054c4:  ARM64_RELOC_PAGEOFF12	l_stogir.402
    54c8:      	mov	x0, #0x23               ; =35
    54cc:      	b	0x53b4 <_stogir.locals.validate+0x56c>
    54d0:      	add	x16, sp, #0x10
    54d4:      	ldr	x20, [x16]
    54d8:      	mov	x0, #0x1                ; =1
    54dc:      	ubfx	x0, x0, #0, #32
    54e0:      	lsr	x16, x0, #0
    54e4:      	cmp	x16, #0x1
    54e8:      	b.eq	0x5504 <_stogir.locals.validate+0x6bc>
    54ec:      	b.lo	0x54f4 <_stogir.locals.validate+0x6ac>
    54f0:      	b	0x5508 <_stogir.locals.validate+0x6c0>
    54f4:      	cmp	x16, #0x0
    54f8:      	b.eq	0x5500 <_stogir.locals.validate+0x6b8>
    54fc:      	b	0x5508 <_stogir.locals.validate+0x6c0>
    5500:      	b	0x550c <_stogir.locals.validate+0x6c4>
    5504:      	b	0x5478 <_stogir.locals.validate+0x630>
    5508:      	b	0x5544 <_stogir.locals.validate+0x6fc>
    550c:      	mov	x2, #0x1                ; =1
    5510:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005510:  ARM64_RELOC_PAGE21	l_stogir.403
    5514:      	ldr	x1, [x1]
		0000000000005514:  ARM64_RELOC_PAGEOFF12	l_stogir.403
    5518:      	mov	x0, #0x19               ; =25
    551c:      	b	0x54cc <_stogir.locals.validate+0x684>
    5520:      	brk	#0
    5524:      	b	0x5520 <_stogir.locals.validate+0x6d8>
    5528:      	uxtb	w20, w20
    552c:      	cmp	x20, #0x48
    5530:      	b.eq	0x54bc <_stogir.locals.validate+0x674>
    5534:      	and	x1, x0, #0xffffffff
    5538:      	movz	x2, #0x0, lsl #48
    553c:      	movz	x0, #0x0, lsl #48
    5540:      	b	0x54cc <_stogir.locals.validate+0x684>
    5544:      	brk	#0
    5548:      	b	0x5544 <_stogir.locals.validate+0x6fc>
    554c:      	mov	x23, x8
    5550:      	b	0x4f50 <_stogir.locals.validate+0x108>
    5554:      	mov	x23, x8
    5558:      	b	0x4f50 <_stogir.locals.validate+0x108>

000000000000555c <_stogir.conversion.validate>:
    555c:      	sub	sp, sp, #0x40
    5560:      	str	x29, [sp]
    5564:      	str	x30, [sp, #0x8]
    5568:      	mov	x29, sp
    556c:      	str	x19, [sp, #0x30]
    5570:      	sxtw	x1, w1
    5574:      	lsl	x3, x1, #2
    5578:      	cmp	x1, #0x0
    557c:      	cset	w4, gt
    5580:      	movz	x16, #0x0, lsl #48
    5584:      	sub	x5, x16, x1
    5588:      	sub	x6, x5, #0x1
    558c:      	uxtb	w16, w4
    5590:      	cmp	w16, wzr
    5594:      	b.eq	0x55d4 <_stogir.conversion.validate+0x78>
    5598:      	ldr	x5, [x0, #0x8]
    559c:      	cmp	x1, x5
    55a0:      	b.ge	0x5624 <_stogir.conversion.validate+0xc8>
    55a4:      	add	x5, x0, #0x78
    55a8:      	ldr	x5, [x5, #0x8]
    55ac:      	cmp	x1, x5
    55b0:      	b.ge	0x56f4 <_stogir.conversion.validate+0x198>
    55b4:      	ldr	x5, [x0, #0x78]
    55b8:      	add	x5, x3, x5
    55bc:      	ldr	w5, [x5]
    55c0:      	sxtw	x5, w5
    55c4:      	cmp	x5, #0x0
    55c8:      	cset	w5, ge
    55cc:      	ubfx	x5, x5, #0, #8
    55d0:      	b	0x56f8 <_stogir.conversion.validate+0x19c>
    55d4:      	cmp	x1, #0x0
    55d8:      	b.ge	0x562c <_stogir.conversion.validate+0xd0>
    55dc:      	add	x7, x0, #0x28
    55e0:      	add	x9, x0, #0x50
    55e4:      	ldr	x7, [x7, #0x8]
    55e8:      	ldr	x9, [x9, #0x8]
    55ec:      	cmp	x7, x9
    55f0:      	b.ne	0x561c <_stogir.conversion.validate+0xc0>
    55f4:      	cmp	x5, x7
    55f8:      	b.gt	0x5788 <_stogir.conversion.validate+0x22c>
    55fc:      	ldr	x5, [x0, #0x50]
    5600:      	add	x5, x5, x6, lsl #2
    5604:      	ldr	w5, [x5]
    5608:      	sxtw	x5, w5
    560c:      	cmp	x5, #0x0
    5610:      	cset	w5, gt
    5614:      	ubfx	x5, x5, #0, #8
    5618:      	b	0x578c <_stogir.conversion.validate+0x230>
    561c:      	movz	x5, #0x0, lsl #48
    5620:      	b	0x5630 <_stogir.conversion.validate+0xd4>
    5624:      	movz	x5, #0x0, lsl #48
    5628:      	b	0x5630 <_stogir.conversion.validate+0xd4>
    562c:      	movz	x5, #0x0, lsl #48
    5630:      	cmp	x5, #0x0
    5634:      	b.eq	0x5668 <_stogir.conversion.validate+0x10c>
    5638:      	uxtb	w16, w4
    563c:      	cmp	w16, wzr
    5640:      	b.eq	0x5654 <_stogir.conversion.validate+0xf8>
    5644:      	ldr	x4, [x0]
    5648:      	add	x4, x4, x1, lsl #4
    564c:      	ldr	x4, [x4]
    5650:      	b	0x5660 <_stogir.conversion.validate+0x104>
    5654:      	ldr	x4, [x0, #0x28]
    5658:      	add	x4, x4, x6, lsl #4
    565c:      	ldr	x4, [x4]
    5660:      	mov	w5, #0x1                ; =1
    5664:      	b	0x5670 <_stogir.conversion.validate+0x114>
    5668:      	movz	w5, #0x0, lsl #16
    566c:      	movz	x4, #0x0, lsl #48
    5670:      	ubfx	x5, x5, #0, #32
    5674:      	lsr	x16, x5, #0
    5678:      	cmp	x16, #0x1
    567c:      	b.eq	0x5698 <_stogir.conversion.validate+0x13c>
    5680:      	b.lo	0x5688 <_stogir.conversion.validate+0x12c>
    5684:      	b	0x569c <_stogir.conversion.validate+0x140>
    5688:      	cmp	x16, #0x0
    568c:      	b.eq	0x5694 <_stogir.conversion.validate+0x138>
    5690:      	b	0x569c <_stogir.conversion.validate+0x140>
    5694:      	b	0x56a0 <_stogir.conversion.validate+0x144>
    5698:      	b	0x56d4 <_stogir.conversion.validate+0x178>
    569c:      	b	0x57fc <_stogir.conversion.validate+0x2a0>
    56a0:      	mov	x19, x8
    56a4:      	mov	x0, #0x1                ; =1
    56a8:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		00000000000056a8:  ARM64_RELOC_PAGE21	l_stogir.404
    56ac:      	ldr	x1, [x1]
		00000000000056ac:  ARM64_RELOC_PAGEOFF12	l_stogir.404
    56b0:      	mov	x2, #0x12               ; =18
    56b4:      	str	x0, [x19]
    56b8:      	str	x1, [x19, #0x8]
    56bc:      	str	x2, [x19, #0x10]
    56c0:      	ldr	x19, [sp, #0x30]
    56c4:      	ldr	x29, [sp]
    56c8:      	ldr	x30, [sp, #0x8]
    56cc:      	add	sp, sp, #0x40
    56d0:      	ret
    56d4:      	cmp	x1, #0x0
    56d8:      	b.gt	0x56fc <_stogir.conversion.validate+0x1a0>
    56dc:      	mov	x19, x8
    56e0:      	mov	x0, #0x1                ; =1
    56e4:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		00000000000056e4:  ARM64_RELOC_PAGE21	l_stogir.405
    56e8:      	ldr	x1, [x1]
		00000000000056e8:  ARM64_RELOC_PAGEOFF12	l_stogir.405
    56ec:      	mov	x2, #0x1e               ; =30
    56f0:      	b	0x56b4 <_stogir.conversion.validate+0x158>
    56f4:      	movz	x5, #0x0, lsl #48
    56f8:      	b	0x5628 <_stogir.conversion.validate+0xcc>
    56fc:      	uxtb	w1, w4
    5700:      	orr	x5, x1, xzr
    5704:      	cmp	x5, #0x21
    5708:      	b.lt	0x5910 <_stogir.conversion.validate+0x3b4>
    570c:      	cmp	x5, #0x27
    5710:      	b.gt	0x5918 <_stogir.conversion.validate+0x3bc>
    5714:      	ldr	x5, [x0, #0x78]
    5718:      	add	x3, x3, x5
    571c:      	ldr	w3, [x3]
    5720:      	sxtw	x3, w3
    5724:      	cmp	x3, #0x1
    5728:      	b.ne	0x5920 <_stogir.conversion.validate+0x3c4>
    572c:      	asr	x3, x4, #32
    5730:      	cmp	x3, #0x0
    5734:      	cset	w6, gt
    5738:      	movz	x16, #0x0, lsl #48
    573c:      	sub	x7, x16, x3
    5740:      	sub	x9, x7, #0x1
    5744:      	uxtb	w16, w6
    5748:      	cmp	w16, wzr
    574c:      	b.eq	0x57b4 <_stogir.conversion.validate+0x258>
    5750:      	ldr	x7, [x0, #0x8]
    5754:      	cmp	x3, x7
    5758:      	b.ge	0x5804 <_stogir.conversion.validate+0x2a8>
    575c:      	add	x7, x0, #0x78
    5760:      	ldr	x7, [x7, #0x8]
    5764:      	cmp	x3, x7
    5768:      	b.ge	0x58a0 <_stogir.conversion.validate+0x344>
    576c:      	add	x5, x5, x3, lsl #2
    5770:      	ldr	w5, [x5]
    5774:      	sxtw	x5, w5
    5778:      	cmp	x5, #0x0
    577c:      	cset	w5, ge
    5780:      	ubfx	x5, x5, #0, #8
    5784:      	b	0x58a4 <_stogir.conversion.validate+0x348>
    5788:      	movz	x5, #0x0, lsl #48
    578c:      	b	0x5620 <_stogir.conversion.validate+0xc4>
    5790:      	uxtb	w3, w0
    5794:      	cmp	x3, #0x48
    5798:      	b.ne	0x58a8 <_stogir.conversion.validate+0x34c>
    579c:      	mov	x19, x8
    57a0:      	mov	x0, #0x1                ; =1
    57a4:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		00000000000057a4:  ARM64_RELOC_PAGE21	l_stogir.406
    57a8:      	ldr	x1, [x1]
		00000000000057a8:  ARM64_RELOC_PAGEOFF12	l_stogir.406
    57ac:      	mov	x2, #0x25               ; =37
    57b0:      	b	0x56f0 <_stogir.conversion.validate+0x194>
    57b4:      	cmp	x3, #0x0
    57b8:      	b.ge	0x580c <_stogir.conversion.validate+0x2b0>
    57bc:      	add	x5, x0, #0x28
    57c0:      	add	x10, x0, #0x50
    57c4:      	ldr	x5, [x5, #0x8]
    57c8:      	ldr	x10, [x10, #0x8]
    57cc:      	cmp	x5, x10
    57d0:      	b.ne	0x5898 <_stogir.conversion.validate+0x33c>
    57d4:      	cmp	x7, x5
    57d8:      	b.gt	0x5900 <_stogir.conversion.validate+0x3a4>
    57dc:      	ldr	x5, [x0, #0x50]
    57e0:      	add	x5, x5, x9, lsl #2
    57e4:      	ldr	w5, [x5]
    57e8:      	sxtw	x5, w5
    57ec:      	cmp	x5, #0x0
    57f0:      	cset	w5, gt
    57f4:      	ubfx	x5, x5, #0, #8
    57f8:      	b	0x5904 <_stogir.conversion.validate+0x3a8>
    57fc:      	brk	#0
    5800:      	b	0x57fc <_stogir.conversion.validate+0x2a0>
    5804:      	movz	x5, #0x0, lsl #48
    5808:      	b	0x5810 <_stogir.conversion.validate+0x2b4>
    580c:      	movz	x5, #0x0, lsl #48
    5810:      	cmp	x5, #0x0
    5814:      	b.eq	0x5848 <_stogir.conversion.validate+0x2ec>
    5818:      	uxtb	w16, w6
    581c:      	cmp	w16, wzr
    5820:      	b.eq	0x5834 <_stogir.conversion.validate+0x2d8>
    5824:      	ldr	x0, [x0]
    5828:      	add	x0, x0, x3, lsl #4
    582c:      	ldr	x0, [x0]
    5830:      	b	0x5840 <_stogir.conversion.validate+0x2e4>
    5834:      	ldr	x0, [x0, #0x28]
    5838:      	add	x0, x0, x9, lsl #4
    583c:      	ldr	x0, [x0]
    5840:      	mov	w3, #0x1                ; =1
    5844:      	b	0x5850 <_stogir.conversion.validate+0x2f4>
    5848:      	movz	w3, #0x0, lsl #16
    584c:      	movz	x0, #0x0, lsl #48
    5850:      	ubfx	x3, x3, #0, #32
    5854:      	lsr	x16, x3, #0
    5858:      	cmp	x16, #0x1
    585c:      	b.eq	0x5878 <_stogir.conversion.validate+0x31c>
    5860:      	b.lo	0x5868 <_stogir.conversion.validate+0x30c>
    5864:      	b	0x587c <_stogir.conversion.validate+0x320>
    5868:      	cmp	x16, #0x0
    586c:      	b.eq	0x5874 <_stogir.conversion.validate+0x318>
    5870:      	b	0x587c <_stogir.conversion.validate+0x320>
    5874:      	b	0x5880 <_stogir.conversion.validate+0x324>
    5878:      	b	0x5790 <_stogir.conversion.validate+0x234>
    587c:      	b	0x5908 <_stogir.conversion.validate+0x3ac>
    5880:      	mov	x19, x8
    5884:      	mov	x0, #0x1                ; =1
    5888:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005888:  ARM64_RELOC_PAGE21	l_stogir.407
    588c:      	ldr	x1, [x1]
		000000000000588c:  ARM64_RELOC_PAGEOFF12	l_stogir.407
    5890:      	mov	x2, #0x19               ; =25
    5894:      	b	0x57b0 <_stogir.conversion.validate+0x254>
    5898:      	movz	x5, #0x0, lsl #48
    589c:      	b	0x5810 <_stogir.conversion.validate+0x2b4>
    58a0:      	movz	x5, #0x0, lsl #48
    58a4:      	b	0x5808 <_stogir.conversion.validate+0x2ac>
    58a8:      	cmp	x3, #0x46
    58ac:      	b.eq	0x5928 <_stogir.conversion.validate+0x3cc>
    58b0:      	ubfx	x4, x4, #0, #32
    58b4:      	ubfx	x0, x0, #0, #32
    58b8:      	ubfx	x3, x4, #8, #8
    58bc:      	ubfx	x0, x0, #8, #8
    58c0:      	mov	x19, x8
    58c4:      	add	x8, sp, #0x10
    58c8:      	fmov	s31, w0
    58cc:      	mov	w0, w1
    58d0:      	fmov	w1, s31
    58d4:      	fmov	s31, w2
    58d8:      	mov	w2, w3
    58dc:      	fmov	w3, s31
    58e0:      	bl	0x58e0 <_stogir.conversion.validate+0x384>
		00000000000058e0:  ARM64_RELOC_BRANCH26	_stogir.conversion.policy
    58e4:      	add	x16, sp, #0x10
    58e8:      	ldr	x0, [x16]
    58ec:      	add	x16, sp, #0x10
    58f0:      	ldr	x1, [x16, #0x8]
    58f4:      	add	x16, sp, #0x10
    58f8:      	ldr	x2, [x16, #0x10]
    58fc:      	b	0x57b0 <_stogir.conversion.validate+0x254>
    5900:      	movz	x5, #0x0, lsl #48
    5904:      	b	0x589c <_stogir.conversion.validate+0x340>
    5908:      	brk	#0
    590c:      	b	0x5908 <_stogir.conversion.validate+0x3ac>
    5910:      	mov	x19, x8
    5914:      	b	0x56e0 <_stogir.conversion.validate+0x184>
    5918:      	mov	x19, x8
    591c:      	b	0x56e0 <_stogir.conversion.validate+0x184>
    5920:      	mov	x19, x8
    5924:      	b	0x56e0 <_stogir.conversion.validate+0x184>
    5928:      	mov	x19, x8
    592c:      	b	0x57a0 <_stogir.conversion.validate+0x244>

0000000000005930 <_stogir.conditional.validate>:
    5930:      	sub	sp, sp, #0x40
    5934:      	str	x29, [sp]
    5938:      	str	x30, [sp, #0x8]
    593c:      	mov	x29, sp
    5940:      	str	x19, [sp, #0x30]
    5944:      	sxtw	x1, w1
    5948:      	lsl	x2, x1, #2
    594c:      	cmp	x1, #0x0
    5950:      	cset	w3, gt
    5954:      	movz	x16, #0x0, lsl #48
    5958:      	sub	x4, x16, x1
    595c:      	sub	x5, x4, #0x1
    5960:      	uxtb	w16, w3
    5964:      	cmp	w16, wzr
    5968:      	b.eq	0x59a8 <_stogir.conditional.validate+0x78>
    596c:      	ldr	x4, [x0, #0x8]
    5970:      	cmp	x1, x4
    5974:      	b.ge	0x59f8 <_stogir.conditional.validate+0xc8>
    5978:      	add	x4, x0, #0x78
    597c:      	ldr	x4, [x4, #0x8]
    5980:      	cmp	x1, x4
    5984:      	b.ge	0x5ad4 <_stogir.conditional.validate+0x1a4>
    5988:      	ldr	x4, [x0, #0x78]
    598c:      	add	x4, x2, x4
    5990:      	ldr	w4, [x4]
    5994:      	sxtw	x4, w4
    5998:      	cmp	x4, #0x0
    599c:      	cset	w4, ge
    59a0:      	ubfx	x4, x4, #0, #8
    59a4:      	b	0x5ad8 <_stogir.conditional.validate+0x1a8>
    59a8:      	cmp	x1, #0x0
    59ac:      	b.ge	0x5a00 <_stogir.conditional.validate+0xd0>
    59b0:      	add	x6, x0, #0x28
    59b4:      	add	x7, x0, #0x50
    59b8:      	ldr	x6, [x6, #0x8]
    59bc:      	ldr	x7, [x7, #0x8]
    59c0:      	cmp	x6, x7
    59c4:      	b.ne	0x59f0 <_stogir.conditional.validate+0xc0>
    59c8:      	cmp	x4, x6
    59cc:      	b.gt	0x5b54 <_stogir.conditional.validate+0x224>
    59d0:      	ldr	x4, [x0, #0x50]
    59d4:      	add	x4, x4, x5, lsl #2
    59d8:      	ldr	w4, [x4]
    59dc:      	sxtw	x4, w4
    59e0:      	cmp	x4, #0x0
    59e4:      	cset	w4, gt
    59e8:      	ubfx	x4, x4, #0, #8
    59ec:      	b	0x5b58 <_stogir.conditional.validate+0x228>
    59f0:      	movz	x4, #0x0, lsl #48
    59f4:      	b	0x5a04 <_stogir.conditional.validate+0xd4>
    59f8:      	movz	x4, #0x0, lsl #48
    59fc:      	b	0x5a04 <_stogir.conditional.validate+0xd4>
    5a00:      	movz	x4, #0x0, lsl #48
    5a04:      	cmp	x4, #0x0
    5a08:      	b.eq	0x5a44 <_stogir.conditional.validate+0x114>
    5a0c:      	uxtb	w16, w3
    5a10:      	cmp	w16, wzr
    5a14:      	b.eq	0x5a2c <_stogir.conditional.validate+0xfc>
    5a18:      	ldr	x3, [x0]
    5a1c:      	add	x3, x3, x1, lsl #4
    5a20:      	ldr	x4, [x3]
    5a24:      	ldr	x3, [x3, #0x8]
    5a28:      	b	0x5a3c <_stogir.conditional.validate+0x10c>
    5a2c:      	ldr	x3, [x0, #0x28]
    5a30:      	add	x3, x3, x5, lsl #4
    5a34:      	ldr	x4, [x3]
    5a38:      	ldr	x3, [x3, #0x8]
    5a3c:      	mov	w5, #0x1                ; =1
    5a40:      	b	0x5a50 <_stogir.conditional.validate+0x120>
    5a44:      	movz	w5, #0x0, lsl #16
    5a48:      	movz	x4, #0x0, lsl #48
    5a4c:      	movz	x3, #0x0, lsl #48
    5a50:      	ubfx	x5, x5, #0, #32
    5a54:      	lsr	x16, x5, #0
    5a58:      	cmp	x16, #0x1
    5a5c:      	b.eq	0x5a78 <_stogir.conditional.validate+0x148>
    5a60:      	b.lo	0x5a68 <_stogir.conditional.validate+0x138>
    5a64:      	b	0x5a7c <_stogir.conditional.validate+0x14c>
    5a68:      	cmp	x16, #0x0
    5a6c:      	b.eq	0x5a74 <_stogir.conditional.validate+0x144>
    5a70:      	b	0x5a7c <_stogir.conditional.validate+0x14c>
    5a74:      	b	0x5a80 <_stogir.conditional.validate+0x150>
    5a78:      	b	0x5a98 <_stogir.conditional.validate+0x168>
    5a7c:      	b	0x5b5c <_stogir.conditional.validate+0x22c>
    5a80:      	mov	x19, x8
    5a84:      	mov	x0, #0x1                ; =1
    5a88:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005a88:  ARM64_RELOC_PAGE21	l_stogir.408
    5a8c:      	ldr	x1, [x1]
		0000000000005a8c:  ARM64_RELOC_PAGEOFF12	l_stogir.408
    5a90:      	mov	x2, #0x18               ; =24
    5a94:      	b	0x5ab4 <_stogir.conditional.validate+0x184>
    5a98:      	cmp	x1, #0x0
    5a9c:      	b.gt	0x5adc <_stogir.conditional.validate+0x1ac>
    5aa0:      	mov	x19, x8
    5aa4:      	mov	x0, #0x1                ; =1
    5aa8:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005aa8:  ARM64_RELOC_PAGE21	l_stogir.409
    5aac:      	ldr	x1, [x1]
		0000000000005aac:  ARM64_RELOC_PAGEOFF12	l_stogir.409
    5ab0:      	mov	x2, #0x18               ; =24
    5ab4:      	str	x0, [x19]
    5ab8:      	str	x1, [x19, #0x8]
    5abc:      	str	x2, [x19, #0x10]
    5ac0:      	ldr	x19, [sp, #0x30]
    5ac4:      	ldr	x29, [sp]
    5ac8:      	ldr	x30, [sp, #0x8]
    5acc:      	add	sp, sp, #0x40
    5ad0:      	ret
    5ad4:      	movz	x4, #0x0, lsl #48
    5ad8:      	b	0x59fc <_stogir.conditional.validate+0xcc>
    5adc:      	uxtb	w1, w4
    5ae0:      	cmp	x1, #0x3c
    5ae4:      	b.ne	0x5b64 <_stogir.conditional.validate+0x234>
    5ae8:      	ldr	x1, [x0, #0x78]
    5aec:      	add	x1, x2, x1
    5af0:      	ldr	w1, [x1]
    5af4:      	sxtw	x1, w1
    5af8:      	cmp	x1, #0x3
    5afc:      	b.ne	0x5b6c <_stogir.conditional.validate+0x23c>
    5b00:      	orr	w1, w3, wzr
    5b04:      	orr	w2, w4, wzr
    5b08:      	lsr	x4, x4, #32
    5b0c:      	lsr	x3, x3, #32
    5b10:      	ubfx	x2, x2, #0, #32
    5b14:      	ubfx	x2, x2, #8, #8
    5b18:      	mov	x19, x8
    5b1c:      	add	x8, sp, #0x10
    5b20:      	fmov	s31, w1
    5b24:      	mov	w1, w2
    5b28:      	mov	w2, w4
    5b2c:      	mov	w4, w3
    5b30:      	fmov	w3, s31
    5b34:      	bl	0x5b34 <_stogir.conditional.validate+0x204>
		0000000000005b34:  ARM64_RELOC_BRANCH26	_stogir.conditional.operands
    5b38:      	add	x16, sp, #0x10
    5b3c:      	ldr	x0, [x16]
    5b40:      	add	x16, sp, #0x10
    5b44:      	ldr	x1, [x16, #0x8]
    5b48:      	add	x16, sp, #0x10
    5b4c:      	ldr	x2, [x16, #0x10]
    5b50:      	b	0x5ab4 <_stogir.conditional.validate+0x184>
    5b54:      	movz	x4, #0x0, lsl #48
    5b58:      	b	0x59f4 <_stogir.conditional.validate+0xc4>
    5b5c:      	brk	#0
    5b60:      	b	0x5b5c <_stogir.conditional.validate+0x22c>
    5b64:      	mov	x19, x8
    5b68:      	b	0x5aa4 <_stogir.conditional.validate+0x174>
    5b6c:      	mov	x19, x8
    5b70:      	b	0x5aa4 <_stogir.conditional.validate+0x174>

0000000000005b74 <_stogir.floating.validate>:
    5b74:      	sub	sp, sp, #0x50
    5b78:      	str	x29, [sp]
    5b7c:      	str	x30, [sp, #0x8]
    5b80:      	mov	x29, sp
    5b84:      	str	x19, [sp, #0x40]
    5b88:      	sxtw	x1, w1
    5b8c:      	lsl	x2, x1, #2
    5b90:      	cmp	x1, #0x0
    5b94:      	cset	w3, gt
    5b98:      	movz	x16, #0x0, lsl #48
    5b9c:      	sub	x4, x16, x1
    5ba0:      	sub	x5, x4, #0x1
    5ba4:      	uxtb	w16, w3
    5ba8:      	cmp	w16, wzr
    5bac:      	b.eq	0x5bec <_stogir.floating.validate+0x78>
    5bb0:      	ldr	x4, [x0, #0x8]
    5bb4:      	cmp	x1, x4
    5bb8:      	b.ge	0x5c3c <_stogir.floating.validate+0xc8>
    5bbc:      	add	x4, x0, #0x78
    5bc0:      	ldr	x4, [x4, #0x8]
    5bc4:      	cmp	x1, x4
    5bc8:      	b.ge	0x5d28 <_stogir.floating.validate+0x1b4>
    5bcc:      	ldr	x4, [x0, #0x78]
    5bd0:      	add	x4, x2, x4
    5bd4:      	ldr	w4, [x4]
    5bd8:      	sxtw	x4, w4
    5bdc:      	cmp	x4, #0x0
    5be0:      	cset	w4, ge
    5be4:      	ubfx	x4, x4, #0, #8
    5be8:      	b	0x5d2c <_stogir.floating.validate+0x1b8>
    5bec:      	cmp	x1, #0x0
    5bf0:      	b.ge	0x5c44 <_stogir.floating.validate+0xd0>
    5bf4:      	add	x6, x0, #0x28
    5bf8:      	add	x7, x0, #0x50
    5bfc:      	ldr	x6, [x6, #0x8]
    5c00:      	ldr	x7, [x7, #0x8]
    5c04:      	cmp	x6, x7
    5c08:      	b.ne	0x5c34 <_stogir.floating.validate+0xc0>
    5c0c:      	cmp	x4, x6
    5c10:      	b.gt	0x5db4 <_stogir.floating.validate+0x240>
    5c14:      	ldr	x4, [x0, #0x50]
    5c18:      	add	x4, x4, x5, lsl #2
    5c1c:      	ldr	w4, [x4]
    5c20:      	sxtw	x4, w4
    5c24:      	cmp	x4, #0x0
    5c28:      	cset	w4, gt
    5c2c:      	ubfx	x4, x4, #0, #8
    5c30:      	b	0x5db8 <_stogir.floating.validate+0x244>
    5c34:      	movz	x4, #0x0, lsl #48
    5c38:      	b	0x5c48 <_stogir.floating.validate+0xd4>
    5c3c:      	movz	x4, #0x0, lsl #48
    5c40:      	b	0x5c48 <_stogir.floating.validate+0xd4>
    5c44:      	movz	x4, #0x0, lsl #48
    5c48:      	cmp	x4, #0x0
    5c4c:      	b.eq	0x5c88 <_stogir.floating.validate+0x114>
    5c50:      	uxtb	w16, w3
    5c54:      	cmp	w16, wzr
    5c58:      	b.eq	0x5c70 <_stogir.floating.validate+0xfc>
    5c5c:      	ldr	x3, [x0]
    5c60:      	add	x3, x3, x1, lsl #4
    5c64:      	ldr	x4, [x3]
    5c68:      	ldr	x3, [x3, #0x8]
    5c6c:      	b	0x5c80 <_stogir.floating.validate+0x10c>
    5c70:      	ldr	x3, [x0, #0x28]
    5c74:      	add	x3, x3, x5, lsl #4
    5c78:      	ldr	x4, [x3]
    5c7c:      	ldr	x3, [x3, #0x8]
    5c80:      	mov	w5, #0x1                ; =1
    5c84:      	b	0x5c94 <_stogir.floating.validate+0x120>
    5c88:      	movz	w5, #0x0, lsl #16
    5c8c:      	movz	x4, #0x0, lsl #48
    5c90:      	movz	x3, #0x0, lsl #48
    5c94:      	ubfx	x5, x5, #0, #32
    5c98:      	lsr	x16, x5, #0
    5c9c:      	cmp	x16, #0x1
    5ca0:      	b.eq	0x5cbc <_stogir.floating.validate+0x148>
    5ca4:      	b.lo	0x5cac <_stogir.floating.validate+0x138>
    5ca8:      	b	0x5cc0 <_stogir.floating.validate+0x14c>
    5cac:      	cmp	x16, #0x0
    5cb0:      	b.eq	0x5cb8 <_stogir.floating.validate+0x144>
    5cb4:      	b	0x5cc0 <_stogir.floating.validate+0x14c>
    5cb8:      	b	0x5cc4 <_stogir.floating.validate+0x150>
    5cbc:      	b	0x5cf8 <_stogir.floating.validate+0x184>
    5cc0:      	b	0x6028 <_stogir.floating.validate+0x4b4>
    5cc4:      	mov	x19, x8
    5cc8:      	mov	x0, #0x1                ; =1
    5ccc:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005ccc:  ARM64_RELOC_PAGE21	l_stogir.410
    5cd0:      	ldr	x1, [x1]
		0000000000005cd0:  ARM64_RELOC_PAGEOFF12	l_stogir.410
    5cd4:      	mov	x2, #0x1c               ; =28
    5cd8:      	str	x0, [x19]
    5cdc:      	str	x1, [x19, #0x8]
    5ce0:      	str	x2, [x19, #0x10]
    5ce4:      	ldr	x19, [sp, #0x40]
    5ce8:      	ldr	x29, [sp]
    5cec:      	ldr	x30, [sp, #0x8]
    5cf0:      	add	sp, sp, #0x50
    5cf4:      	ret
    5cf8:      	add	x16, sp, #0x10
    5cfc:      	str	x4, [x16]
    5d00:      	add	x16, sp, #0x10
    5d04:      	str	x3, [x16, #0x8]
    5d08:      	cmp	x1, #0x0
    5d0c:      	b.gt	0x5d30 <_stogir.floating.validate+0x1bc>
    5d10:      	mov	x19, x8
    5d14:      	mov	x0, #0x1                ; =1
    5d18:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005d18:  ARM64_RELOC_PAGE21	l_stogir.411
    5d1c:      	ldr	x1, [x1]
		0000000000005d1c:  ARM64_RELOC_PAGEOFF12	l_stogir.411
    5d20:      	mov	x2, #0x1c               ; =28
    5d24:      	b	0x5cd8 <_stogir.floating.validate+0x164>
    5d28:      	movz	x4, #0x0, lsl #48
    5d2c:      	b	0x5c40 <_stogir.floating.validate+0xcc>
    5d30:      	uxtb	w4, w4
    5d34:      	orr	x1, x4, xzr
    5d38:      	cmp	x1, #0xe
    5d3c:      	cset	w3, ge
    5d40:      	cmp	x1, #0x19
    5d44:      	cset	w5, le
    5d48:      	cmp	x1, #0x1f
    5d4c:      	cset	w6, eq
    5d50:      	cmp	x1, #0x20
    5d54:      	cset	w7, eq
    5d58:      	uxtb	w16, w3
    5d5c:      	cmp	w16, wzr
    5d60:      	b.eq	0x5dbc <_stogir.floating.validate+0x248>
    5d64:      	uxtb	w16, w5
    5d68:      	cmp	w16, wzr
    5d6c:      	b.eq	0x5dbc <_stogir.floating.validate+0x248>
    5d70:      	cmp	x1, #0x1d
    5d74:      	cset	w1, eq
    5d78:      	ldr	x9, [x0, #0x78]
    5d7c:      	add	x2, x2, x9
    5d80:      	ldr	w2, [x2]
    5d84:      	uxtb	w16, w6
    5d88:      	cmp	w16, wzr
    5d8c:      	b.ne	0x5dfc <_stogir.floating.validate+0x288>
    5d90:      	uxtb	w16, w7
    5d94:      	cmp	w16, wzr
    5d98:      	b.ne	0x5dfc <_stogir.floating.validate+0x288>
    5d9c:      	uxtb	w16, w1
    5da0:      	cmp	w16, wzr
    5da4:      	mov	w16, #0x3               ; =3
    5da8:      	mov	w17, #0x2               ; =2
    5dac:      	csel	w6, w16, w17, ne
    5db0:      	b	0x5e00 <_stogir.floating.validate+0x28c>
    5db4:      	movz	x4, #0x0, lsl #48
    5db8:      	b	0x5c38 <_stogir.floating.validate+0xc4>
    5dbc:      	uxtb	w16, w6
    5dc0:      	cmp	w16, wzr
    5dc4:      	b.ne	0x5d70 <_stogir.floating.validate+0x1fc>
    5dc8:      	uxtb	w16, w7
    5dcc:      	cmp	w16, wzr
    5dd0:      	b.ne	0x5d70 <_stogir.floating.validate+0x1fc>
    5dd4:      	cmp	x1, #0x1a
    5dd8:      	b.lt	0x5de4 <_stogir.floating.validate+0x270>
    5ddc:      	cmp	x1, #0x1d
    5de0:      	b.le	0x5d70 <_stogir.floating.validate+0x1fc>
    5de4:      	cmp	x1, #0x3a
    5de8:      	b.eq	0x5d70 <_stogir.floating.validate+0x1fc>
    5dec:      	cmp	x1, #0x3b
    5df0:      	b.eq	0x5d70 <_stogir.floating.validate+0x1fc>
    5df4:      	mov	x19, x8
    5df8:      	b	0x5d14 <_stogir.floating.validate+0x1a0>
    5dfc:      	mov	w6, #0x1                ; =1
    5e00:      	sxtw	x2, w2
    5e04:      	sxtw	x6, w6
    5e08:      	cmp	x2, x6
    5e0c:      	b.ne	0x6038 <_stogir.floating.validate+0x4c4>
    5e10:      	add	x16, sp, #0x10
    5e14:      	ldr	w2, [x16, #0x4]
    5e18:      	sxtw	x2, w2
    5e1c:      	cmp	x2, #0x0
    5e20:      	cset	w6, gt
    5e24:      	movz	x16, #0x0, lsl #48
    5e28:      	sub	x7, x16, x2
    5e2c:      	sub	x9, x7, #0x1
    5e30:      	uxtb	w16, w6
    5e34:      	cmp	w16, wzr
    5e38:      	b.eq	0x5e8c <_stogir.floating.validate+0x318>
    5e3c:      	ldr	x7, [x0, #0x8]
    5e40:      	cmp	x2, x7
    5e44:      	b.ge	0x5ed4 <_stogir.floating.validate+0x360>
    5e48:      	add	x7, x0, #0x78
    5e4c:      	ldr	x7, [x7, #0x8]
    5e50:      	cmp	x2, x7
    5e54:      	b.ge	0x5fa0 <_stogir.floating.validate+0x42c>
    5e58:      	ldr	x7, [x0, #0x78]
    5e5c:      	add	x7, x7, x2, lsl #2
    5e60:      	ldr	w7, [x7]
    5e64:      	sxtw	x7, w7
    5e68:      	cmp	x7, #0x0
    5e6c:      	cset	w7, ge
    5e70:      	ubfx	x7, x7, #0, #8
    5e74:      	b	0x5fa4 <_stogir.floating.validate+0x430>
    5e78:      	mov	x0, #0x1                ; =1
    5e7c:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005e7c:  ARM64_RELOC_PAGE21	l_stogir.412
    5e80:      	ldr	x1, [x1]
		0000000000005e80:  ARM64_RELOC_PAGEOFF12	l_stogir.412
    5e84:      	mov	x2, #0x1d               ; =29
    5e88:      	b	0x5d24 <_stogir.floating.validate+0x1b0>
    5e8c:      	cmp	x2, #0x0
    5e90:      	b.ge	0x5edc <_stogir.floating.validate+0x368>
    5e94:      	add	x10, x0, #0x28
    5e98:      	add	x11, x0, #0x50
    5e9c:      	ldr	x10, [x10, #0x8]
    5ea0:      	ldr	x11, [x11, #0x8]
    5ea4:      	cmp	x10, x11
    5ea8:      	b.ne	0x5f98 <_stogir.floating.validate+0x424>
    5eac:      	cmp	x7, x10
    5eb0:      	b.gt	0x6020 <_stogir.floating.validate+0x4ac>
    5eb4:      	ldr	x7, [x0, #0x50]
    5eb8:      	add	x7, x7, x9, lsl #2
    5ebc:      	ldr	w7, [x7]
    5ec0:      	sxtw	x7, w7
    5ec4:      	cmp	x7, #0x0
    5ec8:      	cset	w7, gt
    5ecc:      	ubfx	x7, x7, #0, #8
    5ed0:      	b	0x6024 <_stogir.floating.validate+0x4b0>
    5ed4:      	movz	x7, #0x0, lsl #48
    5ed8:      	b	0x5ee0 <_stogir.floating.validate+0x36c>
    5edc:      	movz	x7, #0x0, lsl #48
    5ee0:      	cmp	x7, #0x0
    5ee4:      	b.eq	0x5f18 <_stogir.floating.validate+0x3a4>
    5ee8:      	uxtb	w16, w6
    5eec:      	cmp	w16, wzr
    5ef0:      	b.eq	0x5f04 <_stogir.floating.validate+0x390>
    5ef4:      	ldr	x6, [x0]
    5ef8:      	add	x2, x6, x2, lsl #4
    5efc:      	ldr	x2, [x2]
    5f00:      	b	0x5f10 <_stogir.floating.validate+0x39c>
    5f04:      	ldr	x2, [x0, #0x28]
    5f08:      	add	x2, x2, x9, lsl #4
    5f0c:      	ldr	x2, [x2]
    5f10:      	mov	w6, #0x1                ; =1
    5f14:      	b	0x5f20 <_stogir.floating.validate+0x3ac>
    5f18:      	movz	w6, #0x0, lsl #16
    5f1c:      	movz	x2, #0x0, lsl #48
    5f20:      	ubfx	x6, x6, #0, #32
    5f24:      	lsr	x16, x6, #0
    5f28:      	cmp	x16, #0x1
    5f2c:      	b.eq	0x5f48 <_stogir.floating.validate+0x3d4>
    5f30:      	b.lo	0x5f38 <_stogir.floating.validate+0x3c4>
    5f34:      	b	0x5f4c <_stogir.floating.validate+0x3d8>
    5f38:      	cmp	x16, #0x0
    5f3c:      	b.eq	0x5f44 <_stogir.floating.validate+0x3d0>
    5f40:      	b	0x5f4c <_stogir.floating.validate+0x3d8>
    5f44:      	b	0x5f50 <_stogir.floating.validate+0x3dc>
    5f48:      	b	0x5f68 <_stogir.floating.validate+0x3f4>
    5f4c:      	b	0x6030 <_stogir.floating.validate+0x4bc>
    5f50:      	mov	x19, x8
    5f54:      	mov	x0, #0x1                ; =1
    5f58:      	adrp	x1, 0x5000 <_stogir.locals.validate+0x1b8>
		0000000000005f58:  ARM64_RELOC_PAGE21	l_stogir.413
    5f5c:      	ldr	x1, [x1]
		0000000000005f5c:  ARM64_RELOC_PAGEOFF12	l_stogir.413
    5f60:      	mov	x2, #0x18               ; =24
    5f64:      	b	0x5e88 <_stogir.floating.validate+0x314>
    5f68:      	add	x16, sp, #0x10
    5f6c:      	ldr	w6, [x16]
    5f70:      	ubfx	x2, x2, #0, #32
    5f74:      	ubfx	x2, x2, #8, #8
    5f78:      	uxtb	w16, w3
    5f7c:      	cmp	w16, wzr
    5f80:      	b.eq	0x5fe4 <_stogir.floating.validate+0x470>
    5f84:      	uxtb	w16, w5
    5f88:      	cmp	w16, wzr
    5f8c:      	b.eq	0x5fe4 <_stogir.floating.validate+0x470>
    5f90:      	mov	w3, #0x1                ; =1
    5f94:      	b	0x5fe8 <_stogir.floating.validate+0x474>
    5f98:      	movz	x7, #0x0, lsl #48
    5f9c:      	b	0x5ee0 <_stogir.floating.validate+0x36c>
    5fa0:      	movz	x7, #0x0, lsl #48
    5fa4:      	b	0x5ed8 <_stogir.floating.validate+0x364>
    5fa8:      	movz	w1, #0x0, lsl #16
    5fac:      	mov	x19, x8
    5fb0:      	add	x8, sp, #0x20
    5fb4:      	fmov	s31, w1
    5fb8:      	mov	w1, w4
    5fbc:      	mov	w4, w5
    5fc0:      	fmov	w5, s31
    5fc4:      	bl	0x5fc4 <_stogir.floating.validate+0x450>
		0000000000005fc4:  ARM64_RELOC_BRANCH26	_stogir.floating.operands
    5fc8:      	add	x16, sp, #0x20
    5fcc:      	ldr	x0, [x16]
    5fd0:      	add	x16, sp, #0x20
    5fd4:      	ldr	x1, [x16, #0x8]
    5fd8:      	add	x16, sp, #0x20
    5fdc:      	ldr	x2, [x16, #0x10]
    5fe0:      	b	0x5e88 <_stogir.floating.validate+0x314>
    5fe4:      	orr	x3, x2, xzr
    5fe8:      	sxtw	x3, w3
    5fec:      	ubfx	x5, x6, #8, #8
    5ff0:      	cmp	x5, x3
    5ff4:      	b.ne	0x6040 <_stogir.floating.validate+0x4cc>
    5ff8:      	add	x16, sp, #0x10
    5ffc:      	ldr	w3, [x16, #0x4]
    6000:      	add	x16, sp, #0x10
    6004:      	ldr	w5, [x16, #0x8]
    6008:      	uxtb	w16, w1
    600c:      	cmp	w16, wzr
    6010:      	b.eq	0x5fa8 <_stogir.floating.validate+0x434>
    6014:      	add	x16, sp, #0x10
    6018:      	ldr	w1, [x16, #0xc]
    601c:      	b	0x5fac <_stogir.floating.validate+0x438>
    6020:      	movz	x7, #0x0, lsl #48
    6024:      	b	0x5f9c <_stogir.floating.validate+0x428>
    6028:      	brk	#0
    602c:      	b	0x6028 <_stogir.floating.validate+0x4b4>
    6030:      	brk	#0
    6034:      	b	0x6030 <_stogir.floating.validate+0x4bc>
    6038:      	mov	x19, x8
    603c:      	b	0x5d14 <_stogir.floating.validate+0x1a0>
    6040:      	mov	x19, x8
    6044:      	b	0x5e78 <_stogir.floating.validate+0x304>

0000000000006048 <_stogir.integer-unary.valid-type?>:
    6048:      	sxtw	x0, w0
    604c:      	cmp	x0, #0x2d
    6050:      	cset	w2, eq
    6054:      	cmp	x0, #0x1f
    6058:      	cset	w3, eq
    605c:      	cmp	x0, #0x20
    6060:      	cset	w4, eq
    6064:      	cmp	x0, #0x36
    6068:      	cset	w5, eq
    606c:      	uxtb	w16, w3
    6070:      	cmp	w16, wzr
    6074:      	b.ne	0x60bc <_stogir.integer-unary.valid-type?+0x74>
    6078:      	uxtb	w16, w4
    607c:      	cmp	w16, wzr
    6080:      	b.ne	0x60bc <_stogir.integer-unary.valid-type?+0x74>
    6084:      	uxtb	w16, w2
    6088:      	cmp	w16, wzr
    608c:      	b.ne	0x60bc <_stogir.integer-unary.valid-type?+0x74>
    6090:      	uxtb	w16, w5
    6094:      	cmp	w16, wzr
    6098:      	b.ne	0x60bc <_stogir.integer-unary.valid-type?+0x74>
    609c:      	cmp	x0, #0x37
    60a0:      	b.eq	0x60bc <_stogir.integer-unary.valid-type?+0x74>
    60a4:      	cmp	x0, #0x38
    60a8:      	b.eq	0x60bc <_stogir.integer-unary.valid-type?+0x74>
    60ac:      	cmp	x0, #0x39
    60b0:      	b.eq	0x60bc <_stogir.integer-unary.valid-type?+0x74>
    60b4:      	movz	x0, #0x0, lsl #48
    60b8:      	b	0x60f4 <_stogir.integer-unary.valid-type?+0xac>
    60bc:      	sxtw	x1, w1
    60c0:      	cmp	x1, #0x1
    60c4:      	b.lt	0x60f0 <_stogir.integer-unary.valid-type?+0xa8>
    60c8:      	cmp	x1, #0xb
    60cc:      	cset	w0, le
    60d0:      	uxtb	w16, w0
    60d4:      	cmp	w16, wzr
    60d8:      	b.eq	0x60f0 <_stogir.integer-unary.valid-type?+0xa8>
    60dc:      	uxtb	w16, w2
    60e0:      	cmp	w16, wzr
    60e4:      	b.eq	0x6100 <_stogir.integer-unary.valid-type?+0xb8>
    60e8:      	mov	x0, #0x1                ; =1
    60ec:      	b	0x60fc <_stogir.integer-unary.valid-type?+0xb4>
    60f0:      	movz	x0, #0x0, lsl #48
    60f4:      	ret
    60f8:      	mov	x0, #0x1                ; =1
    60fc:      	b	0x60f4 <_stogir.integer-unary.valid-type?+0xac>
    6100:      	cmp	x1, #0x1
    6104:      	b.ne	0x6110 <_stogir.integer-unary.valid-type?+0xc8>
    6108:      	movz	x0, #0x0, lsl #48
    610c:      	b	0x60fc <_stogir.integer-unary.valid-type?+0xb4>
    6110:      	cmp	x1, #0x6
    6114:      	cset	w2, eq
    6118:      	uxtb	w16, w3
    611c:      	cmp	w16, wzr
    6120:      	b.eq	0x6134 <_stogir.integer-unary.valid-type?+0xec>
    6124:      	uxtb	w16, w2
    6128:      	cmp	w16, wzr
    612c:      	cset	x0, eq
    6130:      	b	0x60fc <_stogir.integer-unary.valid-type?+0xb4>
    6134:      	uxtb	w16, w4
    6138:      	cmp	w16, wzr
    613c:      	b.eq	0x6158 <_stogir.integer-unary.valid-type?+0x110>
    6140:      	cmp	x1, #0x7
    6144:      	b.lt	0x6150 <_stogir.integer-unary.valid-type?+0x108>
    6148:      	ubfx	x0, x0, #0, #8
    614c:      	b	0x6154 <_stogir.integer-unary.valid-type?+0x10c>
    6150:      	movz	x0, #0x0, lsl #48
    6154:      	b	0x60fc <_stogir.integer-unary.valid-type?+0xb4>
    6158:      	uxtb	w16, w5
    615c:      	cmp	w16, wzr
    6160:      	b.eq	0x60f8 <_stogir.integer-unary.valid-type?+0xb0>
    6164:      	cmp	x1, #0x3
    6168:      	b.ne	0x6184 <_stogir.integer-unary.valid-type?+0x13c>
    616c:      	mov	x0, #0x1                ; =1
    6170:      	b	0x6180 <_stogir.integer-unary.valid-type?+0x138>
    6174:      	cmp	x1, #0xb
    6178:      	cset	w0, eq
    617c:      	ubfx	x0, x0, #0, #8
    6180:      	b	0x60fc <_stogir.integer-unary.valid-type?+0xb4>
    6184:      	cmp	x1, #0x4
    6188:      	b.ne	0x6194 <_stogir.integer-unary.valid-type?+0x14c>
    618c:      	mov	x0, #0x1                ; =1
    6190:      	b	0x6180 <_stogir.integer-unary.valid-type?+0x138>
    6194:      	cmp	x1, #0x5
    6198:      	b.ne	0x61a4 <_stogir.integer-unary.valid-type?+0x15c>
    619c:      	mov	x0, #0x1                ; =1
    61a0:      	b	0x6180 <_stogir.integer-unary.valid-type?+0x138>
    61a4:      	uxtb	w16, w2
    61a8:      	cmp	w16, wzr
    61ac:      	b.eq	0x61b8 <_stogir.integer-unary.valid-type?+0x170>
    61b0:      	mov	x0, #0x1                ; =1
    61b4:      	b	0x6180 <_stogir.integer-unary.valid-type?+0x138>
    61b8:      	cmp	x1, #0x9
    61bc:      	b.ne	0x61c8 <_stogir.integer-unary.valid-type?+0x180>
    61c0:      	mov	x0, #0x1                ; =1
    61c4:      	b	0x6180 <_stogir.integer-unary.valid-type?+0x138>
    61c8:      	cmp	x1, #0xa
    61cc:      	b.ne	0x6174 <_stogir.integer-unary.valid-type?+0x12c>
    61d0:      	mov	x0, #0x1                ; =1
    61d4:      	b	0x6180 <_stogir.integer-unary.valid-type?+0x138>

00000000000061d8 <_stogir.types.vector?>:
    61d8:      	sxtw	x1, w0
    61dc:      	cmp	x1, #0xf
    61e0:      	b.le	0x620c <_stogir.types.vector?+0x34>
    61e4:      	cmp	x1, #0x80
    61e8:      	b.ge	0x621c <_stogir.types.vector?+0x44>
    61ec:      	and	w0, w0, #0xf
    61f0:      	ubfx	x0, x0, #0, #32
    61f4:      	cmp	x0, #0x1
    61f8:      	b.lt	0x6214 <_stogir.types.vector?+0x3c>
    61fc:      	cmp	x0, #0xd
    6200:      	cset	w0, le
    6204:      	ubfx	x0, x0, #0, #8
    6208:      	b	0x6218 <_stogir.types.vector?+0x40>
    620c:      	movz	x0, #0x0, lsl #48
    6210:      	b	0x6218 <_stogir.types.vector?+0x40>
    6214:      	movz	x0, #0x0, lsl #48
    6218:      	ret
    621c:      	movz	x0, #0x0, lsl #48
    6220:      	b	0x6218 <_stogir.types.vector?+0x40>

0000000000006224 <_stogir.floating.operation?>:
    6224:      	sxtw	x0, w0
    6228:      	cmp	x0, #0xe
    622c:      	b.lt	0x6240 <_stogir.floating.operation?+0x1c>
    6230:      	cmp	x0, #0x19
    6234:      	b.gt	0x6240 <_stogir.floating.operation?+0x1c>
    6238:      	mov	x0, #0x1                ; =1
    623c:      	b	0x626c <_stogir.floating.operation?+0x48>
    6240:      	cmp	x0, #0x1f
    6244:      	b.eq	0x6268 <_stogir.floating.operation?+0x44>
    6248:      	cmp	x0, #0x20
    624c:      	b.eq	0x6268 <_stogir.floating.operation?+0x44>
    6250:      	cmp	x0, #0x1a
    6254:      	b.lt	0x6280 <_stogir.floating.operation?+0x5c>
    6258:      	cmp	x0, #0x1d
    625c:      	b.gt	0x6280 <_stogir.floating.operation?+0x5c>
    6260:      	mov	x0, #0x1                ; =1
    6264:      	b	0x627c <_stogir.floating.operation?+0x58>
    6268:      	mov	x0, #0x1                ; =1
    626c:      	ret
    6270:      	cmp	x0, #0x3b
    6274:      	cset	w0, eq
    6278:      	ubfx	x0, x0, #0, #8
    627c:      	b	0x626c <_stogir.floating.operation?+0x48>
    6280:      	cmp	x0, #0x3a
    6284:      	b.ne	0x6270 <_stogir.floating.operation?+0x4c>
    6288:      	mov	x0, #0x1                ; =1
    628c:      	b	0x627c <_stogir.floating.operation?+0x58>

0000000000006290 <_stogir.vector-lanes.validate>:
    6290:      	sub	sp, sp, #0x50
    6294:      	str	x29, [sp]
    6298:      	str	x30, [sp, #0x8]
    629c:      	mov	x29, sp
    62a0:      	str	x19, [sp, #0x40]
    62a4:      	sxtw	x1, w1
    62a8:      	lsl	x3, x1, #2
    62ac:      	cmp	x1, #0x0
    62b0:      	cset	w4, gt
    62b4:      	movz	x16, #0x0, lsl #48
    62b8:      	sub	x5, x16, x1
    62bc:      	sub	x6, x5, #0x1
    62c0:      	uxtb	w16, w4
    62c4:      	cmp	w16, wzr
    62c8:      	b.eq	0x6308 <_stogir.vector-lanes.validate+0x78>
    62cc:      	ldr	x5, [x0, #0x8]
    62d0:      	cmp	x1, x5
    62d4:      	b.ge	0x6358 <_stogir.vector-lanes.validate+0xc8>
    62d8:      	add	x5, x0, #0x78
    62dc:      	ldr	x5, [x5, #0x8]
    62e0:      	cmp	x1, x5
    62e4:      	b.ge	0x6444 <_stogir.vector-lanes.validate+0x1b4>
    62e8:      	ldr	x5, [x0, #0x78]
    62ec:      	add	x5, x3, x5
    62f0:      	ldr	w5, [x5]
    62f4:      	sxtw	x5, w5
    62f8:      	cmp	x5, #0x0
    62fc:      	cset	w5, ge
    6300:      	ubfx	x5, x5, #0, #8
    6304:      	b	0x6448 <_stogir.vector-lanes.validate+0x1b8>
    6308:      	cmp	x1, #0x0
    630c:      	b.ge	0x6360 <_stogir.vector-lanes.validate+0xd0>
    6310:      	add	x7, x0, #0x28
    6314:      	add	x9, x0, #0x50
    6318:      	ldr	x7, [x7, #0x8]
    631c:      	ldr	x9, [x9, #0x8]
    6320:      	cmp	x7, x9
    6324:      	b.ne	0x6350 <_stogir.vector-lanes.validate+0xc0>
    6328:      	cmp	x5, x7
    632c:      	b.gt	0x6488 <_stogir.vector-lanes.validate+0x1f8>
    6330:      	ldr	x5, [x0, #0x50]
    6334:      	add	x5, x5, x6, lsl #2
    6338:      	ldr	w5, [x5]
    633c:      	sxtw	x5, w5
    6340:      	cmp	x5, #0x0
    6344:      	cset	w5, gt
    6348:      	ubfx	x5, x5, #0, #8
    634c:      	b	0x648c <_stogir.vector-lanes.validate+0x1fc>
    6350:      	movz	x5, #0x0, lsl #48
    6354:      	b	0x6364 <_stogir.vector-lanes.validate+0xd4>
    6358:      	movz	x5, #0x0, lsl #48
    635c:      	b	0x6364 <_stogir.vector-lanes.validate+0xd4>
    6360:      	movz	x5, #0x0, lsl #48
    6364:      	cmp	x5, #0x0
    6368:      	b.eq	0x63a4 <_stogir.vector-lanes.validate+0x114>
    636c:      	uxtb	w16, w4
    6370:      	cmp	w16, wzr
    6374:      	b.eq	0x638c <_stogir.vector-lanes.validate+0xfc>
    6378:      	ldr	x4, [x0]
    637c:      	add	x4, x4, x1, lsl #4
    6380:      	ldr	x5, [x4]
    6384:      	ldr	x4, [x4, #0x8]
    6388:      	b	0x639c <_stogir.vector-lanes.validate+0x10c>
    638c:      	ldr	x4, [x0, #0x28]
    6390:      	add	x4, x4, x6, lsl #4
    6394:      	ldr	x5, [x4]
    6398:      	ldr	x4, [x4, #0x8]
    639c:      	mov	w6, #0x1                ; =1
    63a0:      	b	0x63b0 <_stogir.vector-lanes.validate+0x120>
    63a4:      	movz	w6, #0x0, lsl #16
    63a8:      	movz	x5, #0x0, lsl #48
    63ac:      	movz	x4, #0x0, lsl #48
    63b0:      	ubfx	x6, x6, #0, #32
    63b4:      	lsr	x16, x6, #0
    63b8:      	cmp	x16, #0x1
    63bc:      	b.eq	0x63d8 <_stogir.vector-lanes.validate+0x148>
    63c0:      	b.lo	0x63c8 <_stogir.vector-lanes.validate+0x138>
    63c4:      	b	0x63dc <_stogir.vector-lanes.validate+0x14c>
    63c8:      	cmp	x16, #0x0
    63cc:      	b.eq	0x63d4 <_stogir.vector-lanes.validate+0x144>
    63d0:      	b	0x63dc <_stogir.vector-lanes.validate+0x14c>
    63d4:      	b	0x63e0 <_stogir.vector-lanes.validate+0x150>
    63d8:      	b	0x63f8 <_stogir.vector-lanes.validate+0x168>
    63dc:      	b	0x6548 <_stogir.vector-lanes.validate+0x2b8>
    63e0:      	mov	x19, x8
    63e4:      	mov	x0, #0x1                ; =1
    63e8:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x48c>
		00000000000063e8:  ARM64_RELOC_PAGE21	l_stogir.414
    63ec:      	ldr	x1, [x1]
		00000000000063ec:  ARM64_RELOC_PAGEOFF12	l_stogir.414
    63f0:      	mov	x2, #0x1f               ; =31
    63f4:      	b	0x6424 <_stogir.vector-lanes.validate+0x194>
    63f8:      	add	x16, sp, #0x10
    63fc:      	str	x5, [x16]
    6400:      	add	x16, sp, #0x10
    6404:      	str	x4, [x16, #0x8]
    6408:      	cmp	x1, #0x0
    640c:      	b.gt	0x644c <_stogir.vector-lanes.validate+0x1bc>
    6410:      	mov	x19, x8
    6414:      	mov	x0, #0x1                ; =1
    6418:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x48c>
		0000000000006418:  ARM64_RELOC_PAGE21	l_stogir.415
    641c:      	ldr	x1, [x1]
		000000000000641c:  ARM64_RELOC_PAGEOFF12	l_stogir.415
    6420:      	mov	x2, #0x25               ; =37
    6424:      	str	x0, [x19]
    6428:      	str	x1, [x19, #0x8]
    642c:      	str	x2, [x19, #0x10]
    6430:      	ldr	x19, [sp, #0x40]
    6434:      	ldr	x29, [sp]
    6438:      	ldr	x30, [sp, #0x8]
    643c:      	add	sp, sp, #0x50
    6440:      	ret
    6444:      	movz	x5, #0x0, lsl #48
    6448:      	b	0x635c <_stogir.vector-lanes.validate+0xcc>
    644c:      	uxtb	w5, w5
    6450:      	orr	x1, x5, xzr
    6454:      	cmp	x1, #0x3d
    6458:      	b.lt	0x6550 <_stogir.vector-lanes.validate+0x2c0>
    645c:      	cmp	x1, #0x3f
    6460:      	b.gt	0x6558 <_stogir.vector-lanes.validate+0x2c8>
    6464:      	cmp	x1, #0x3e
    6468:      	cset	w4, eq
    646c:      	ldr	x6, [x0, #0x78]
    6470:      	add	x3, x3, x6
    6474:      	ldr	w3, [x3]
    6478:      	cmp	x1, #0x3d
    647c:      	b.ne	0x64e4 <_stogir.vector-lanes.validate+0x254>
    6480:      	mov	w6, #0x2                ; =2
    6484:      	b	0x64f8 <_stogir.vector-lanes.validate+0x268>
    6488:      	movz	x5, #0x0, lsl #48
    648c:      	b	0x6354 <_stogir.vector-lanes.validate+0xc4>
    6490:      	movz	w4, #0x0, lsl #16
    6494:      	ubfx	x3, x3, #8, #8
    6498:      	mov	x19, x8
    649c:      	add	x8, sp, #0x20
    64a0:      	fmov	s31, w1
    64a4:      	mov	w1, w5
    64a8:      	fmov	w5, s31
    64ac:      	fmov	s31, w2
    64b0:      	mov	w2, w3
    64b4:      	fmov	w3, s31
    64b8:      	fmov	s31, w4
    64bc:      	mov	w4, w6
    64c0:      	fmov	w6, s31
    64c4:      	bl	0x64c4 <_stogir.vector-lanes.validate+0x234>
		00000000000064c4:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operands
    64c8:      	add	x16, sp, #0x20
    64cc:      	ldr	x0, [x16]
    64d0:      	add	x16, sp, #0x20
    64d4:      	ldr	x1, [x16, #0x8]
    64d8:      	add	x16, sp, #0x20
    64dc:      	ldr	x2, [x16, #0x10]
    64e0:      	b	0x6424 <_stogir.vector-lanes.validate+0x194>
    64e4:      	uxtb	w16, w4
    64e8:      	cmp	w16, wzr
    64ec:      	mov	w16, #0x3               ; =3
    64f0:      	mov	w17, #0x1               ; =1
    64f4:      	csel	w6, w16, w17, ne
    64f8:      	sxtw	x3, w3
    64fc:      	sxtw	x6, w6
    6500:      	cmp	x3, x6
    6504:      	b.ne	0x6560 <_stogir.vector-lanes.validate+0x2d0>
    6508:      	add	x16, sp, #0x10
    650c:      	ldr	w3, [x16]
    6510:      	add	x16, sp, #0x10
    6514:      	ldr	w6, [x16, #0x4]
    6518:      	cmp	x1, #0x3f
    651c:      	b.ne	0x6528 <_stogir.vector-lanes.validate+0x298>
    6520:      	movz	w1, #0x0, lsl #16
    6524:      	b	0x6530 <_stogir.vector-lanes.validate+0x2a0>
    6528:      	add	x16, sp, #0x10
    652c:      	ldr	w1, [x16, #0x8]
    6530:      	uxtb	w16, w4
    6534:      	cmp	w16, wzr
    6538:      	b.eq	0x6490 <_stogir.vector-lanes.validate+0x200>
    653c:      	add	x16, sp, #0x10
    6540:      	ldr	w4, [x16, #0xc]
    6544:      	b	0x6494 <_stogir.vector-lanes.validate+0x204>
    6548:      	brk	#0
    654c:      	b	0x6548 <_stogir.vector-lanes.validate+0x2b8>
    6550:      	mov	x19, x8
    6554:      	b	0x6414 <_stogir.vector-lanes.validate+0x184>
    6558:      	mov	x19, x8
    655c:      	b	0x6414 <_stogir.vector-lanes.validate+0x184>
    6560:      	mov	x19, x8
    6564:      	b	0x6414 <_stogir.vector-lanes.validate+0x184>

0000000000006568 <_stogir.vector-comparison.node?>:
    6568:      	sxtw	x1, w1
    656c:      	cmp	x1, #0x0
    6570:      	cset	w2, gt
    6574:      	movz	x16, #0x0, lsl #48
    6578:      	sub	x3, x16, x1
    657c:      	sub	x4, x3, #0x1
    6580:      	uxtb	w16, w2
    6584:      	cmp	w16, wzr
    6588:      	b.eq	0x65c8 <_stogir.vector-comparison.node?+0x60>
    658c:      	ldr	x3, [x0, #0x8]
    6590:      	cmp	x1, x3
    6594:      	b.ge	0x6618 <_stogir.vector-comparison.node?+0xb0>
    6598:      	add	x3, x0, #0x78
    659c:      	ldr	x3, [x3, #0x8]
    65a0:      	cmp	x1, x3
    65a4:      	b.ge	0x66f4 <_stogir.vector-comparison.node?+0x18c>
    65a8:      	ldr	x3, [x0, #0x78]
    65ac:      	add	x3, x3, x1, lsl #2
    65b0:      	ldr	w3, [x3]
    65b4:      	sxtw	x3, w3
    65b8:      	cmp	x3, #0x0
    65bc:      	cset	w3, ge
    65c0:      	ubfx	x3, x3, #0, #8
    65c4:      	b	0x66f8 <_stogir.vector-comparison.node?+0x190>
    65c8:      	cmp	x1, #0x0
    65cc:      	b.ge	0x6620 <_stogir.vector-comparison.node?+0xb8>
    65d0:      	add	x5, x0, #0x28
    65d4:      	add	x6, x0, #0x50
    65d8:      	ldr	x5, [x5, #0x8]
    65dc:      	ldr	x6, [x6, #0x8]
    65e0:      	cmp	x5, x6
    65e4:      	b.ne	0x6610 <_stogir.vector-comparison.node?+0xa8>
    65e8:      	cmp	x3, x5
    65ec:      	b.gt	0x66fc <_stogir.vector-comparison.node?+0x194>
    65f0:      	ldr	x3, [x0, #0x50]
    65f4:      	add	x3, x3, x4, lsl #2
    65f8:      	ldr	w3, [x3]
    65fc:      	sxtw	x3, w3
    6600:      	cmp	x3, #0x0
    6604:      	cset	w3, gt
    6608:      	ubfx	x3, x3, #0, #8
    660c:      	b	0x6700 <_stogir.vector-comparison.node?+0x198>
    6610:      	movz	x3, #0x0, lsl #48
    6614:      	b	0x6624 <_stogir.vector-comparison.node?+0xbc>
    6618:      	movz	x3, #0x0, lsl #48
    661c:      	b	0x6624 <_stogir.vector-comparison.node?+0xbc>
    6620:      	movz	x3, #0x0, lsl #48
    6624:      	cmp	x3, #0x0
    6628:      	b.eq	0x665c <_stogir.vector-comparison.node?+0xf4>
    662c:      	uxtb	w16, w2
    6630:      	cmp	w16, wzr
    6634:      	b.eq	0x6648 <_stogir.vector-comparison.node?+0xe0>
    6638:      	ldr	x0, [x0]
    663c:      	add	x0, x0, x1, lsl #4
    6640:      	ldr	x0, [x0]
    6644:      	b	0x6654 <_stogir.vector-comparison.node?+0xec>
    6648:      	ldr	x0, [x0, #0x28]
    664c:      	add	x0, x0, x4, lsl #4
    6650:      	ldr	x0, [x0]
    6654:      	mov	w1, #0x1                ; =1
    6658:      	b	0x6664 <_stogir.vector-comparison.node?+0xfc>
    665c:      	movz	w1, #0x0, lsl #16
    6660:      	movz	x0, #0x0, lsl #48
    6664:      	ubfx	x1, x1, #0, #32
    6668:      	lsr	x16, x1, #0
    666c:      	cmp	x16, #0x1
    6670:      	b.eq	0x668c <_stogir.vector-comparison.node?+0x124>
    6674:      	b.lo	0x667c <_stogir.vector-comparison.node?+0x114>
    6678:      	b	0x6690 <_stogir.vector-comparison.node?+0x128>
    667c:      	cmp	x16, #0x0
    6680:      	b.eq	0x6688 <_stogir.vector-comparison.node?+0x120>
    6684:      	b	0x6690 <_stogir.vector-comparison.node?+0x128>
    6688:      	b	0x6694 <_stogir.vector-comparison.node?+0x12c>
    668c:      	b	0x66a4 <_stogir.vector-comparison.node?+0x13c>
    6690:      	b	0x671c <_stogir.vector-comparison.node?+0x1b4>
    6694:      	movz	x0, #0x0, lsl #48
    6698:      	b	0x66a0 <_stogir.vector-comparison.node?+0x138>
    669c:      	movz	x0, #0x0, lsl #48
    66a0:      	ret
    66a4:      	uxtb	w1, w0
    66a8:      	cmp	x1, #0xe
    66ac:      	b.lt	0x669c <_stogir.vector-comparison.node?+0x134>
    66b0:      	cmp	x1, #0x19
    66b4:      	b.gt	0x669c <_stogir.vector-comparison.node?+0x134>
    66b8:      	ubfx	x0, x0, #0, #32
    66bc:      	ubfx	x0, x0, #8, #8
    66c0:      	orr	x1, x0, xzr
    66c4:      	cmp	x1, #0xf
    66c8:      	b.le	0x6704 <_stogir.vector-comparison.node?+0x19c>
    66cc:      	cmp	x1, #0x80
    66d0:      	b.ge	0x670c <_stogir.vector-comparison.node?+0x1a4>
    66d4:      	and	w0, w0, #0xf
    66d8:      	ubfx	x0, x0, #0, #32
    66dc:      	cmp	x0, #0x1
    66e0:      	b.lt	0x6714 <_stogir.vector-comparison.node?+0x1ac>
    66e4:      	cmp	x0, #0xd
    66e8:      	cset	w0, le
    66ec:      	ubfx	x0, x0, #0, #8
    66f0:      	b	0x6718 <_stogir.vector-comparison.node?+0x1b0>
    66f4:      	movz	x3, #0x0, lsl #48
    66f8:      	b	0x661c <_stogir.vector-comparison.node?+0xb4>
    66fc:      	movz	x3, #0x0, lsl #48
    6700:      	b	0x6614 <_stogir.vector-comparison.node?+0xac>
    6704:      	movz	x0, #0x0, lsl #48
    6708:      	b	0x66a0 <_stogir.vector-comparison.node?+0x138>
    670c:      	movz	x0, #0x0, lsl #48
    6710:      	b	0x6708 <_stogir.vector-comparison.node?+0x1a0>
    6714:      	movz	x0, #0x0, lsl #48
    6718:      	b	0x6710 <_stogir.vector-comparison.node?+0x1a8>
    671c:      	brk	#0
    6720:      	b	0x671c <_stogir.vector-comparison.node?+0x1b4>

0000000000006724 <_stogir.vector-comparison.validate>:
    6724:      	sub	sp, sp, #0x50
    6728:      	str	x29, [sp]
    672c:      	str	x30, [sp, #0x8]
    6730:      	mov	x29, sp
    6734:      	str	x19, [sp, #0x40]
    6738:      	sxtw	x1, w1
    673c:      	lsl	x3, x1, #2
    6740:      	cmp	x1, #0x0
    6744:      	cset	w4, gt
    6748:      	movz	x16, #0x0, lsl #48
    674c:      	sub	x5, x16, x1
    6750:      	sub	x6, x5, #0x1
    6754:      	uxtb	w16, w4
    6758:      	cmp	w16, wzr
    675c:      	b.eq	0x679c <_stogir.vector-comparison.validate+0x78>
    6760:      	ldr	x5, [x0, #0x8]
    6764:      	cmp	x1, x5
    6768:      	b.ge	0x67ec <_stogir.vector-comparison.validate+0xc8>
    676c:      	add	x5, x0, #0x78
    6770:      	ldr	x5, [x5, #0x8]
    6774:      	cmp	x1, x5
    6778:      	b.ge	0x68dc <_stogir.vector-comparison.validate+0x1b8>
    677c:      	ldr	x5, [x0, #0x78]
    6780:      	add	x5, x3, x5
    6784:      	ldr	w5, [x5]
    6788:      	sxtw	x5, w5
    678c:      	cmp	x5, #0x0
    6790:      	cset	w5, ge
    6794:      	ubfx	x5, x5, #0, #8
    6798:      	b	0x68e0 <_stogir.vector-comparison.validate+0x1bc>
    679c:      	cmp	x1, #0x0
    67a0:      	b.ge	0x67f4 <_stogir.vector-comparison.validate+0xd0>
    67a4:      	add	x7, x0, #0x28
    67a8:      	add	x9, x0, #0x50
    67ac:      	ldr	x7, [x7, #0x8]
    67b0:      	ldr	x9, [x9, #0x8]
    67b4:      	cmp	x7, x9
    67b8:      	b.ne	0x67e4 <_stogir.vector-comparison.validate+0xc0>
    67bc:      	cmp	x5, x7
    67c0:      	b.gt	0x692c <_stogir.vector-comparison.validate+0x208>
    67c4:      	ldr	x5, [x0, #0x50]
    67c8:      	add	x5, x5, x6, lsl #2
    67cc:      	ldr	w5, [x5]
    67d0:      	sxtw	x5, w5
    67d4:      	cmp	x5, #0x0
    67d8:      	cset	w5, gt
    67dc:      	ubfx	x5, x5, #0, #8
    67e0:      	b	0x6930 <_stogir.vector-comparison.validate+0x20c>
    67e4:      	movz	x5, #0x0, lsl #48
    67e8:      	b	0x67f8 <_stogir.vector-comparison.validate+0xd4>
    67ec:      	movz	x5, #0x0, lsl #48
    67f0:      	b	0x67f8 <_stogir.vector-comparison.validate+0xd4>
    67f4:      	movz	x5, #0x0, lsl #48
    67f8:      	lsl	x7, x1, #4
    67fc:      	cmp	x5, #0x0
    6800:      	b.eq	0x683c <_stogir.vector-comparison.validate+0x118>
    6804:      	uxtb	w16, w4
    6808:      	cmp	w16, wzr
    680c:      	b.eq	0x6824 <_stogir.vector-comparison.validate+0x100>
    6810:      	ldr	x4, [x0]
    6814:      	add	x4, x7, x4
    6818:      	ldr	x5, [x4]
    681c:      	ldr	x4, [x4, #0x8]
    6820:      	b	0x6834 <_stogir.vector-comparison.validate+0x110>
    6824:      	ldr	x4, [x0, #0x28]
    6828:      	add	x4, x4, x6, lsl #4
    682c:      	ldr	x5, [x4]
    6830:      	ldr	x4, [x4, #0x8]
    6834:      	mov	w6, #0x1                ; =1
    6838:      	b	0x6848 <_stogir.vector-comparison.validate+0x124>
    683c:      	movz	w6, #0x0, lsl #16
    6840:      	movz	x5, #0x0, lsl #48
    6844:      	movz	x4, #0x0, lsl #48
    6848:      	ubfx	x6, x6, #0, #32
    684c:      	lsr	x16, x6, #0
    6850:      	cmp	x16, #0x1
    6854:      	b.eq	0x6870 <_stogir.vector-comparison.validate+0x14c>
    6858:      	b.lo	0x6860 <_stogir.vector-comparison.validate+0x13c>
    685c:      	b	0x6874 <_stogir.vector-comparison.validate+0x150>
    6860:      	cmp	x16, #0x0
    6864:      	b.eq	0x686c <_stogir.vector-comparison.validate+0x148>
    6868:      	b	0x6874 <_stogir.vector-comparison.validate+0x150>
    686c:      	b	0x6878 <_stogir.vector-comparison.validate+0x154>
    6870:      	b	0x68ac <_stogir.vector-comparison.validate+0x188>
    6874:      	b	0x6a2c <_stogir.vector-comparison.validate+0x308>
    6878:      	mov	x19, x8
    687c:      	mov	x0, #0x1                ; =1
    6880:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x48c>
		0000000000006880:  ARM64_RELOC_PAGE21	l_stogir.416
    6884:      	ldr	x1, [x1]
		0000000000006884:  ARM64_RELOC_PAGEOFF12	l_stogir.416
    6888:      	mov	x2, #0x25               ; =37
    688c:      	str	x0, [x19]
    6890:      	str	x1, [x19, #0x8]
    6894:      	str	x2, [x19, #0x10]
    6898:      	ldr	x19, [sp, #0x40]
    689c:      	ldr	x29, [sp]
    68a0:      	ldr	x30, [sp, #0x8]
    68a4:      	add	sp, sp, #0x50
    68a8:      	ret
    68ac:      	add	x16, sp, #0x10
    68b0:      	str	x5, [x16]
    68b4:      	add	x16, sp, #0x10
    68b8:      	str	x4, [x16, #0x8]
    68bc:      	cmp	x1, #0x0
    68c0:      	b.gt	0x68e4 <_stogir.vector-comparison.validate+0x1c0>
    68c4:      	mov	x19, x8
    68c8:      	mov	x0, #0x1                ; =1
    68cc:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x48c>
		00000000000068cc:  ARM64_RELOC_PAGE21	l_stogir.417
    68d0:      	ldr	x1, [x1]
		00000000000068d0:  ARM64_RELOC_PAGEOFF12	l_stogir.417
    68d4:      	mov	x2, #0x2b               ; =43
    68d8:      	b	0x688c <_stogir.vector-comparison.validate+0x168>
    68dc:      	movz	x5, #0x0, lsl #48
    68e0:      	b	0x67f0 <_stogir.vector-comparison.validate+0xcc>
    68e4:      	ldr	x4, [x0, #0x8]
    68e8:      	cmp	x1, x4
    68ec:      	b.ge	0x6934 <_stogir.vector-comparison.validate+0x210>
    68f0:      	add	x4, x0, #0x78
    68f4:      	ldr	x4, [x4, #0x8]
    68f8:      	cmp	x1, x4
    68fc:      	b.ge	0x6934 <_stogir.vector-comparison.validate+0x210>
    6900:      	ldr	x1, [x0, #0x78]
    6904:      	add	x1, x3, x1
    6908:      	ldr	w1, [x1]
    690c:      	sxtw	x1, w1
    6910:      	cmp	x1, #0x0
    6914:      	b.lt	0x6934 <_stogir.vector-comparison.validate+0x210>
    6918:      	ldr	x1, [x0]
    691c:      	add	x1, x7, x1
    6920:      	ldr	x1, [x1]
    6924:      	mov	w4, #0x1                ; =1
    6928:      	b	0x693c <_stogir.vector-comparison.validate+0x218>
    692c:      	movz	x5, #0x0, lsl #48
    6930:      	b	0x67e8 <_stogir.vector-comparison.validate+0xc4>
    6934:      	movz	w4, #0x0, lsl #16
    6938:      	movz	x1, #0x0, lsl #48
    693c:      	ubfx	x4, x4, #0, #32
    6940:      	lsr	x16, x4, #0
    6944:      	cmp	x16, #0x1
    6948:      	b.eq	0x6964 <_stogir.vector-comparison.validate+0x240>
    694c:      	b.lo	0x6954 <_stogir.vector-comparison.validate+0x230>
    6950:      	b	0x6968 <_stogir.vector-comparison.validate+0x244>
    6954:      	cmp	x16, #0x0
    6958:      	b.eq	0x6960 <_stogir.vector-comparison.validate+0x23c>
    695c:      	b	0x6968 <_stogir.vector-comparison.validate+0x244>
    6960:      	b	0x696c <_stogir.vector-comparison.validate+0x248>
    6964:      	b	0x6974 <_stogir.vector-comparison.validate+0x250>
    6968:      	b	0x6a34 <_stogir.vector-comparison.validate+0x310>
    696c:      	mov	x19, x8
    6970:      	b	0x68c8 <_stogir.vector-comparison.validate+0x1a4>
    6974:      	uxtb	w4, w1
    6978:      	cmp	x4, #0xe
    697c:      	b.lt	0x6a3c <_stogir.vector-comparison.validate+0x318>
    6980:      	cmp	x4, #0x19
    6984:      	b.gt	0x6a44 <_stogir.vector-comparison.validate+0x320>
    6988:      	ubfx	x1, x1, #0, #32
    698c:      	ubfx	x1, x1, #8, #8
    6990:      	orr	x4, x1, xzr
    6994:      	cmp	x4, #0xf
    6998:      	b.le	0x6a4c <_stogir.vector-comparison.validate+0x328>
    699c:      	cmp	x4, #0x80
    69a0:      	b.ge	0x6a54 <_stogir.vector-comparison.validate+0x330>
    69a4:      	and	w1, w1, #0xf
    69a8:      	ubfx	x1, x1, #0, #32
    69ac:      	cmp	x1, #0x1
    69b0:      	b.lt	0x6a5c <_stogir.vector-comparison.validate+0x338>
    69b4:      	cmp	x1, #0xd
    69b8:      	b.gt	0x6a64 <_stogir.vector-comparison.validate+0x340>
    69bc:      	ldr	x1, [x0, #0x78]
    69c0:      	add	x1, x3, x1
    69c4:      	ldr	w1, [x1]
    69c8:      	sxtw	x1, w1
    69cc:      	cmp	x1, #0x2
    69d0:      	b.ne	0x6a6c <_stogir.vector-comparison.validate+0x348>
    69d4:      	add	x16, sp, #0x10
    69d8:      	ldr	w1, [x16]
    69dc:      	uxtb	w3, w1
    69e0:      	add	x16, sp, #0x10
    69e4:      	ldr	w4, [x16, #0x4]
    69e8:      	ubfx	x1, x1, #8, #8
    69ec:      	add	x16, sp, #0x10
    69f0:      	ldr	w5, [x16, #0x8]
    69f4:      	mov	x19, x8
    69f8:      	add	x8, sp, #0x20
    69fc:      	fmov	s31, w1
    6a00:      	mov	w1, w3
    6a04:      	mov	w3, w2
    6a08:      	fmov	w2, s31
    6a0c:      	bl	0x6a0c <_stogir.vector-comparison.validate+0x2e8>
		0000000000006a0c:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.operands
    6a10:      	add	x16, sp, #0x20
    6a14:      	ldr	x0, [x16]
    6a18:      	add	x16, sp, #0x20
    6a1c:      	ldr	x1, [x16, #0x8]
    6a20:      	add	x16, sp, #0x20
    6a24:      	ldr	x2, [x16, #0x10]
    6a28:      	b	0x68d8 <_stogir.vector-comparison.validate+0x1b4>
    6a2c:      	brk	#0
    6a30:      	b	0x6a2c <_stogir.vector-comparison.validate+0x308>
    6a34:      	brk	#0
    6a38:      	b	0x6a34 <_stogir.vector-comparison.validate+0x310>
    6a3c:      	mov	x19, x8
    6a40:      	b	0x68c8 <_stogir.vector-comparison.validate+0x1a4>
    6a44:      	mov	x19, x8
    6a48:      	b	0x68c8 <_stogir.vector-comparison.validate+0x1a4>
    6a4c:      	mov	x19, x8
    6a50:      	b	0x68c8 <_stogir.vector-comparison.validate+0x1a4>
    6a54:      	mov	x19, x8
    6a58:      	b	0x68c8 <_stogir.vector-comparison.validate+0x1a4>
    6a5c:      	mov	x19, x8
    6a60:      	b	0x68c8 <_stogir.vector-comparison.validate+0x1a4>
    6a64:      	mov	x19, x8
    6a68:      	b	0x68c8 <_stogir.vector-comparison.validate+0x1a4>
    6a6c:      	mov	x19, x8
    6a70:      	b	0x68c8 <_stogir.vector-comparison.validate+0x1a4>

0000000000006a74 <_stogir.vector-arithmetic.node?>:
    6a74:      	sxtw	x1, w1
    6a78:      	cmp	x1, #0x0
    6a7c:      	cset	w2, gt
    6a80:      	movz	x16, #0x0, lsl #48
    6a84:      	sub	x3, x16, x1
    6a88:      	sub	x4, x3, #0x1
    6a8c:      	uxtb	w16, w2
    6a90:      	cmp	w16, wzr
    6a94:      	b.eq	0x6ad4 <_stogir.vector-arithmetic.node?+0x60>
    6a98:      	ldr	x3, [x0, #0x8]
    6a9c:      	cmp	x1, x3
    6aa0:      	b.ge	0x6b24 <_stogir.vector-arithmetic.node?+0xb0>
    6aa4:      	add	x3, x0, #0x78
    6aa8:      	ldr	x3, [x3, #0x8]
    6aac:      	cmp	x1, x3
    6ab0:      	b.ge	0x6c48 <_stogir.vector-arithmetic.node?+0x1d4>
    6ab4:      	ldr	x3, [x0, #0x78]
    6ab8:      	add	x3, x3, x1, lsl #2
    6abc:      	ldr	w3, [x3]
    6ac0:      	sxtw	x3, w3
    6ac4:      	cmp	x3, #0x0
    6ac8:      	cset	w3, ge
    6acc:      	ubfx	x3, x3, #0, #8
    6ad0:      	b	0x6c4c <_stogir.vector-arithmetic.node?+0x1d8>
    6ad4:      	cmp	x1, #0x0
    6ad8:      	b.ge	0x6b2c <_stogir.vector-arithmetic.node?+0xb8>
    6adc:      	add	x5, x0, #0x28
    6ae0:      	add	x6, x0, #0x50
    6ae4:      	ldr	x5, [x5, #0x8]
    6ae8:      	ldr	x6, [x6, #0x8]
    6aec:      	cmp	x5, x6
    6af0:      	b.ne	0x6b1c <_stogir.vector-arithmetic.node?+0xa8>
    6af4:      	cmp	x3, x5
    6af8:      	b.gt	0x6c58 <_stogir.vector-arithmetic.node?+0x1e4>
    6afc:      	ldr	x3, [x0, #0x50]
    6b00:      	add	x3, x3, x4, lsl #2
    6b04:      	ldr	w3, [x3]
    6b08:      	sxtw	x3, w3
    6b0c:      	cmp	x3, #0x0
    6b10:      	cset	w3, gt
    6b14:      	ubfx	x3, x3, #0, #8
    6b18:      	b	0x6c5c <_stogir.vector-arithmetic.node?+0x1e8>
    6b1c:      	movz	x3, #0x0, lsl #48
    6b20:      	b	0x6b30 <_stogir.vector-arithmetic.node?+0xbc>
    6b24:      	movz	x3, #0x0, lsl #48
    6b28:      	b	0x6b30 <_stogir.vector-arithmetic.node?+0xbc>
    6b2c:      	movz	x3, #0x0, lsl #48
    6b30:      	cmp	x3, #0x0
    6b34:      	b.eq	0x6b68 <_stogir.vector-arithmetic.node?+0xf4>
    6b38:      	uxtb	w16, w2
    6b3c:      	cmp	w16, wzr
    6b40:      	b.eq	0x6b54 <_stogir.vector-arithmetic.node?+0xe0>
    6b44:      	ldr	x0, [x0]
    6b48:      	add	x0, x0, x1, lsl #4
    6b4c:      	ldr	x0, [x0]
    6b50:      	b	0x6b60 <_stogir.vector-arithmetic.node?+0xec>
    6b54:      	ldr	x0, [x0, #0x28]
    6b58:      	add	x0, x0, x4, lsl #4
    6b5c:      	ldr	x0, [x0]
    6b60:      	mov	w1, #0x1                ; =1
    6b64:      	b	0x6b70 <_stogir.vector-arithmetic.node?+0xfc>
    6b68:      	movz	w1, #0x0, lsl #16
    6b6c:      	movz	x0, #0x0, lsl #48
    6b70:      	ubfx	x1, x1, #0, #32
    6b74:      	lsr	x16, x1, #0
    6b78:      	cmp	x16, #0x1
    6b7c:      	b.eq	0x6b98 <_stogir.vector-arithmetic.node?+0x124>
    6b80:      	b.lo	0x6b88 <_stogir.vector-arithmetic.node?+0x114>
    6b84:      	b	0x6b9c <_stogir.vector-arithmetic.node?+0x128>
    6b88:      	cmp	x16, #0x0
    6b8c:      	b.eq	0x6b94 <_stogir.vector-arithmetic.node?+0x120>
    6b90:      	b	0x6b9c <_stogir.vector-arithmetic.node?+0x128>
    6b94:      	b	0x6ba0 <_stogir.vector-arithmetic.node?+0x12c>
    6b98:      	b	0x6bb0 <_stogir.vector-arithmetic.node?+0x13c>
    6b9c:      	b	0x6c68 <_stogir.vector-arithmetic.node?+0x1f4>
    6ba0:      	movz	x0, #0x0, lsl #48
    6ba4:      	b	0x6bac <_stogir.vector-arithmetic.node?+0x138>
    6ba8:      	movz	x0, #0x0, lsl #48
    6bac:      	ret
    6bb0:      	uxtb	w1, w0
    6bb4:      	cmp	x1, #0x1f
    6bb8:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6bbc:      	cmp	x1, #0x20
    6bc0:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6bc4:      	cmp	x1, #0x2d
    6bc8:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6bcc:      	cmp	x1, #0x36
    6bd0:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6bd4:      	cmp	x1, #0x37
    6bd8:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6bdc:      	cmp	x1, #0x38
    6be0:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6be4:      	cmp	x1, #0x39
    6be8:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6bec:      	cmp	x1, #0x3a
    6bf0:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6bf4:      	cmp	x1, #0x3b
    6bf8:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6bfc:      	cmp	x1, #0x31
    6c00:      	b.lt	0x6c70 <_stogir.vector-arithmetic.node?+0x1fc>
    6c04:      	cmp	x1, #0x35
    6c08:      	b.gt	0x6c70 <_stogir.vector-arithmetic.node?+0x1fc>
    6c0c:      	ubfx	x0, x0, #0, #32
    6c10:      	ubfx	x0, x0, #8, #8
    6c14:      	orr	x1, x0, xzr
    6c18:      	cmp	x1, #0xf
    6c1c:      	b.le	0x6ba8 <_stogir.vector-arithmetic.node?+0x134>
    6c20:      	cmp	x1, #0x80
    6c24:      	b.ge	0x6c50 <_stogir.vector-arithmetic.node?+0x1dc>
    6c28:      	and	w0, w0, #0xf
    6c2c:      	ubfx	x0, x0, #0, #32
    6c30:      	cmp	x0, #0x1
    6c34:      	b.lt	0x6c60 <_stogir.vector-arithmetic.node?+0x1ec>
    6c38:      	cmp	x0, #0xd
    6c3c:      	cset	w0, le
    6c40:      	ubfx	x0, x0, #0, #8
    6c44:      	b	0x6c64 <_stogir.vector-arithmetic.node?+0x1f0>
    6c48:      	movz	x3, #0x0, lsl #48
    6c4c:      	b	0x6b28 <_stogir.vector-arithmetic.node?+0xb4>
    6c50:      	movz	x0, #0x0, lsl #48
    6c54:      	b	0x6bac <_stogir.vector-arithmetic.node?+0x138>
    6c58:      	movz	x3, #0x0, lsl #48
    6c5c:      	b	0x6b20 <_stogir.vector-arithmetic.node?+0xac>
    6c60:      	movz	x0, #0x0, lsl #48
    6c64:      	b	0x6c54 <_stogir.vector-arithmetic.node?+0x1e0>
    6c68:      	brk	#0
    6c6c:      	b	0x6c68 <_stogir.vector-arithmetic.node?+0x1f4>
    6c70:      	cmp	x1, #0x1a
    6c74:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6c78:      	cmp	x1, #0x1b
    6c7c:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6c80:      	cmp	x1, #0x1c
    6c84:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6c88:      	cmp	x1, #0x1d
    6c8c:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6c90:      	cmp	x1, #0x1e
    6c94:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6c98:      	cmp	x1, #0x2e
    6c9c:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6ca0:      	cmp	x1, #0x2f
    6ca4:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6ca8:      	cmp	x1, #0x30
    6cac:      	b.eq	0x6c0c <_stogir.vector-arithmetic.node?+0x198>
    6cb0:      	movz	x0, #0x0, lsl #48
    6cb4:      	b	0x6bac <_stogir.vector-arithmetic.node?+0x138>

0000000000006cb8 <_stogir.vector-arithmetic.validate>:
    6cb8:      	sub	sp, sp, #0x60
    6cbc:      	str	x29, [sp]
    6cc0:      	str	x30, [sp, #0x8]
    6cc4:      	mov	x29, sp
    6cc8:      	str	x19, [sp, #0x40]
    6ccc:      	str	x20, [sp, #0x48]
    6cd0:      	str	x21, [sp, #0x50]
    6cd4:      	str	x22, [sp, #0x58]
    6cd8:      	sxtw	x2, w1
    6cdc:      	lsl	x19, x2, #2
    6ce0:      	cmp	x2, #0x0
    6ce4:      	cset	w3, gt
    6ce8:      	movz	x16, #0x0, lsl #48
    6cec:      	sub	x4, x16, x2
    6cf0:      	sub	x5, x4, #0x1
    6cf4:      	uxtb	w16, w3
    6cf8:      	cmp	w16, wzr
    6cfc:      	b.eq	0x6d3c <_stogir.vector-arithmetic.validate+0x84>
    6d00:      	ldr	x4, [x0, #0x8]
    6d04:      	cmp	x2, x4
    6d08:      	b.ge	0x6d8c <_stogir.vector-arithmetic.validate+0xd4>
    6d0c:      	add	x4, x0, #0x78
    6d10:      	ldr	x4, [x4, #0x8]
    6d14:      	cmp	x2, x4
    6d18:      	b.ge	0x6e84 <_stogir.vector-arithmetic.validate+0x1cc>
    6d1c:      	ldr	x4, [x0, #0x78]
    6d20:      	add	x4, x19, x4
    6d24:      	ldr	w4, [x4]
    6d28:      	sxtw	x4, w4
    6d2c:      	cmp	x4, #0x0
    6d30:      	cset	w4, ge
    6d34:      	ubfx	x4, x4, #0, #8
    6d38:      	b	0x6e88 <_stogir.vector-arithmetic.validate+0x1d0>
    6d3c:      	cmp	x2, #0x0
    6d40:      	b.ge	0x6d94 <_stogir.vector-arithmetic.validate+0xdc>
    6d44:      	add	x6, x0, #0x28
    6d48:      	add	x7, x0, #0x50
    6d4c:      	ldr	x6, [x6, #0x8]
    6d50:      	ldr	x7, [x7, #0x8]
    6d54:      	cmp	x6, x7
    6d58:      	b.ne	0x6d84 <_stogir.vector-arithmetic.validate+0xcc>
    6d5c:      	cmp	x4, x6
    6d60:      	b.gt	0x6f1c <_stogir.vector-arithmetic.validate+0x264>
    6d64:      	ldr	x4, [x0, #0x50]
    6d68:      	add	x4, x4, x5, lsl #2
    6d6c:      	ldr	w4, [x4]
    6d70:      	sxtw	x4, w4
    6d74:      	cmp	x4, #0x0
    6d78:      	cset	w4, gt
    6d7c:      	ubfx	x4, x4, #0, #8
    6d80:      	b	0x6f20 <_stogir.vector-arithmetic.validate+0x268>
    6d84:      	movz	x4, #0x0, lsl #48
    6d88:      	b	0x6d98 <_stogir.vector-arithmetic.validate+0xe0>
    6d8c:      	movz	x4, #0x0, lsl #48
    6d90:      	b	0x6d98 <_stogir.vector-arithmetic.validate+0xe0>
    6d94:      	movz	x4, #0x0, lsl #48
    6d98:      	cmp	x4, #0x0
    6d9c:      	b.eq	0x6dd8 <_stogir.vector-arithmetic.validate+0x120>
    6da0:      	uxtb	w16, w3
    6da4:      	cmp	w16, wzr
    6da8:      	b.eq	0x6dc0 <_stogir.vector-arithmetic.validate+0x108>
    6dac:      	ldr	x3, [x0]
    6db0:      	add	x3, x3, x2, lsl #4
    6db4:      	ldr	x20, [x3]
    6db8:      	ldr	x3, [x3, #0x8]
    6dbc:      	b	0x6dd0 <_stogir.vector-arithmetic.validate+0x118>
    6dc0:      	ldr	x3, [x0, #0x28]
    6dc4:      	add	x3, x3, x5, lsl #4
    6dc8:      	ldr	x20, [x3]
    6dcc:      	ldr	x3, [x3, #0x8]
    6dd0:      	mov	w4, #0x1                ; =1
    6dd4:      	b	0x6de4 <_stogir.vector-arithmetic.validate+0x12c>
    6dd8:      	movz	w4, #0x0, lsl #16
    6ddc:      	movz	x20, #0x0, lsl #48
    6de0:      	movz	x3, #0x0, lsl #48
    6de4:      	ubfx	x4, x4, #0, #32
    6de8:      	lsr	x16, x4, #0
    6dec:      	cmp	x16, #0x1
    6df0:      	b.eq	0x6e0c <_stogir.vector-arithmetic.validate+0x154>
    6df4:      	b.lo	0x6dfc <_stogir.vector-arithmetic.validate+0x144>
    6df8:      	b	0x6e10 <_stogir.vector-arithmetic.validate+0x158>
    6dfc:      	cmp	x16, #0x0
    6e00:      	b.eq	0x6e08 <_stogir.vector-arithmetic.validate+0x150>
    6e04:      	b	0x6e10 <_stogir.vector-arithmetic.validate+0x158>
    6e08:      	b	0x6e14 <_stogir.vector-arithmetic.validate+0x15c>
    6e0c:      	b	0x6e2c <_stogir.vector-arithmetic.validate+0x174>
    6e10:      	b	0x6fb4 <_stogir.vector-arithmetic.validate+0x2fc>
    6e14:      	mov	x21, x8
    6e18:      	mov	x0, #0x1                ; =1
    6e1c:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x48c>
		0000000000006e1c:  ARM64_RELOC_PAGE21	l_stogir.418
    6e20:      	ldr	x1, [x1]
		0000000000006e20:  ARM64_RELOC_PAGEOFF12	l_stogir.418
    6e24:      	mov	x2, #0x25               ; =37
    6e28:      	b	0x6e58 <_stogir.vector-arithmetic.validate+0x1a0>
    6e2c:      	add	x16, sp, #0x10
    6e30:      	str	x20, [x16]
    6e34:      	add	x16, sp, #0x10
    6e38:      	str	x3, [x16, #0x8]
    6e3c:      	cmp	x2, #0x0
    6e40:      	b.gt	0x6e8c <_stogir.vector-arithmetic.validate+0x1d4>
    6e44:      	mov	x21, x8
    6e48:      	mov	x0, #0x1                ; =1
    6e4c:      	adrp	x1, 0x6000 <_stogir.floating.validate+0x48c>
		0000000000006e4c:  ARM64_RELOC_PAGE21	l_stogir.419
    6e50:      	ldr	x1, [x1]
		0000000000006e50:  ARM64_RELOC_PAGEOFF12	l_stogir.419
    6e54:      	mov	x2, #0x2b               ; =43
    6e58:      	str	x0, [x21]
    6e5c:      	str	x1, [x21, #0x8]
    6e60:      	str	x2, [x21, #0x10]
    6e64:      	ldr	x19, [sp, #0x40]
    6e68:      	ldr	x20, [sp, #0x48]
    6e6c:      	ldr	x21, [sp, #0x50]
    6e70:      	ldr	x22, [sp, #0x58]
    6e74:      	ldr	x29, [sp]
    6e78:      	ldr	x30, [sp, #0x8]
    6e7c:      	add	sp, sp, #0x60
    6e80:      	ret
    6e84:      	movz	x4, #0x0, lsl #48
    6e88:      	b	0x6d90 <_stogir.vector-arithmetic.validate+0xd8>
    6e8c:      	mov	x21, x8
    6e90:      	mov	x22, x0
    6e94:      	bl	0x6e94 <_stogir.vector-arithmetic.validate+0x1dc>
		0000000000006e94:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    6e98:      	cmp	x0, #0x0
    6e9c:      	b.eq	0x6e48 <_stogir.vector-arithmetic.validate+0x190>
    6ea0:      	uxtb	w20, w20
    6ea4:      	orr	x0, x20, xzr
    6ea8:      	ldr	x1, [x22, #0x78]
    6eac:      	cmp	x0, #0x1d
    6eb0:      	cset	w2, eq
    6eb4:      	cmp	x0, #0x1e
    6eb8:      	cset	w3, eq
    6ebc:      	add	x1, x19, x1
    6ec0:      	ldr	w1, [x1]
    6ec4:      	cmp	x0, #0x1f
    6ec8:      	b.eq	0x6f68 <_stogir.vector-arithmetic.validate+0x2b0>
    6ecc:      	cmp	x0, #0x20
    6ed0:      	b.eq	0x6f68 <_stogir.vector-arithmetic.validate+0x2b0>
    6ed4:      	cmp	x0, #0x2d
    6ed8:      	b.eq	0x6f68 <_stogir.vector-arithmetic.validate+0x2b0>
    6edc:      	cmp	x0, #0x36
    6ee0:      	b.eq	0x6f68 <_stogir.vector-arithmetic.validate+0x2b0>
    6ee4:      	cmp	x0, #0x37
    6ee8:      	b.eq	0x6f68 <_stogir.vector-arithmetic.validate+0x2b0>
    6eec:      	cmp	x0, #0x38
    6ef0:      	b.eq	0x6f68 <_stogir.vector-arithmetic.validate+0x2b0>
    6ef4:      	cmp	x0, #0x39
    6ef8:      	b.eq	0x6f68 <_stogir.vector-arithmetic.validate+0x2b0>
    6efc:      	uxtb	w16, w2
    6f00:      	cmp	w16, wzr
    6f04:      	b.ne	0x6fbc <_stogir.vector-arithmetic.validate+0x304>
    6f08:      	uxtb	w16, w3
    6f0c:      	cmp	w16, wzr
    6f10:      	b.ne	0x6fbc <_stogir.vector-arithmetic.validate+0x304>
    6f14:      	mov	w0, #0x2                ; =2
    6f18:      	b	0x6fc0 <_stogir.vector-arithmetic.validate+0x308>
    6f1c:      	movz	x4, #0x0, lsl #48
    6f20:      	b	0x6d88 <_stogir.vector-arithmetic.validate+0xd0>
    6f24:      	add	x16, sp, #0x10
    6f28:      	ldr	w2, [x16, #0xc]
    6f2c:      	ubfx	x0, x0, #8, #8
    6f30:      	add	x8, sp, #0x20
    6f34:      	mov	w3, w1
    6f38:      	mov	w1, w20
    6f3c:      	mov	w5, w2
    6f40:      	mov	w2, w0
    6f44:      	mov	x0, x22
    6f48:      	bl	0x6f48 <_stogir.vector-arithmetic.validate+0x290>
		0000000000006f48:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.operands
    6f4c:      	add	x16, sp, #0x20
    6f50:      	ldr	x0, [x16]
    6f54:      	add	x16, sp, #0x20
    6f58:      	ldr	x1, [x16, #0x8]
    6f5c:      	add	x16, sp, #0x20
    6f60:      	ldr	x2, [x16, #0x10]
    6f64:      	b	0x6e58 <_stogir.vector-arithmetic.validate+0x1a0>
    6f68:      	mov	w0, #0x1                ; =1
    6f6c:      	sxtw	x1, w1
    6f70:      	sxtw	x0, w0
    6f74:      	cmp	x1, x0
    6f78:      	b.ne	0x6e48 <_stogir.vector-arithmetic.validate+0x190>
    6f7c:      	add	x16, sp, #0x10
    6f80:      	ldr	w0, [x16]
    6f84:      	add	x16, sp, #0x10
    6f88:      	ldr	w1, [x16, #0x4]
    6f8c:      	add	x16, sp, #0x10
    6f90:      	ldr	w4, [x16, #0x8]
    6f94:      	uxtb	w16, w2
    6f98:      	cmp	w16, wzr
    6f9c:      	b.ne	0x6f24 <_stogir.vector-arithmetic.validate+0x26c>
    6fa0:      	uxtb	w16, w3
    6fa4:      	cmp	w16, wzr
    6fa8:      	b.ne	0x6f24 <_stogir.vector-arithmetic.validate+0x26c>
    6fac:      	movz	w2, #0x0, lsl #16
    6fb0:      	b	0x6f2c <_stogir.vector-arithmetic.validate+0x274>
    6fb4:      	brk	#0
    6fb8:      	b	0x6fb4 <_stogir.vector-arithmetic.validate+0x2fc>
    6fbc:      	mov	w0, #0x3                ; =3
    6fc0:      	b	0x6f6c <_stogir.vector-arithmetic.validate+0x2b4>

0000000000006fc4 <_stogir.vector.memory-inputs>:
    6fc4:      	sub	sp, sp, #0x40
    6fc8:      	str	x29, [sp]
    6fcc:      	str	x30, [sp, #0x8]
    6fd0:      	mov	x29, sp
    6fd4:      	str	x19, [sp, #0x10]
    6fd8:      	str	x20, [sp, #0x18]
    6fdc:      	str	x21, [sp, #0x20]
    6fe0:      	str	x22, [sp, #0x28]
    6fe4:      	str	x23, [sp, #0x30]
    6fe8:      	str	x24, [sp, #0x38]
    6fec:      	sxtw	x5, w1
    6ff0:      	cmp	x5, #0xf
    6ff4:      	b.le	0x744c <_stogir.vector.memory-inputs+0x488>
    6ff8:      	cmp	x5, #0x80
    6ffc:      	b.ge	0x7454 <_stogir.vector.memory-inputs+0x490>
    7000:      	and	w5, w1, #0xf
    7004:      	ubfx	x5, x5, #0, #32
    7008:      	cmp	x5, #0x1
    700c:      	b.lt	0x745c <_stogir.vector.memory-inputs+0x498>
    7010:      	cmp	x5, #0xd
    7014:      	b.gt	0x7464 <_stogir.vector.memory-inputs+0x4a0>
    7018:      	mov	x19, x8
    701c:      	mov	x20, x0
    7020:      	mov	w0, w1
    7024:      	mov	w21, w1
    7028:      	mov	w1, w2
    702c:      	mov	w22, w2
    7030:      	mov	w23, w3
    7034:      	mov	w24, w4
    7038:      	bl	0x7038 <_stogir.vector.memory-inputs+0x74>
		0000000000007038:  ARM64_RELOC_BRANCH26	_stogir.types.size
    703c:      	sxtw	x0, w0
    7040:      	cmp	x0, #0x0
    7044:      	b.le	0x70a8 <_stogir.vector.memory-inputs+0xe4>
    7048:      	sxtw	x23, w23
    704c:      	cmp	x23, #0x0
    7050:      	cset	w0, gt
    7054:      	movz	x16, #0x0, lsl #48
    7058:      	sub	x1, x16, x23
    705c:      	sub	x2, x1, #0x1
    7060:      	uxtb	w16, w0
    7064:      	cmp	w16, wzr
    7068:      	b.eq	0x717c <_stogir.vector.memory-inputs+0x1b8>
    706c:      	ldr	x1, [x20, #0x8]
    7070:      	cmp	x23, x1
    7074:      	b.ge	0x7174 <_stogir.vector.memory-inputs+0x1b0>
    7078:      	add	x1, x20, #0x78
    707c:      	ldr	x1, [x1, #0x8]
    7080:      	cmp	x23, x1
    7084:      	b.ge	0x7214 <_stogir.vector.memory-inputs+0x250>
    7088:      	ldr	x1, [x20, #0x78]
    708c:      	add	x1, x1, x23, lsl #2
    7090:      	ldr	w1, [x1]
    7094:      	sxtw	x1, w1
    7098:      	cmp	x1, #0x0
    709c:      	cset	w1, ge
    70a0:      	ubfx	x1, x1, #0, #8
    70a4:      	b	0x7218 <_stogir.vector.memory-inputs+0x254>
    70a8:      	mov	x1, #0x1                ; =1
    70ac:      	adrp	x0, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		00000000000070ac:  ARM64_RELOC_PAGE21	l_stogir.420
    70b0:      	ldr	x0, [x0]
		00000000000070b0:  ARM64_RELOC_PAGEOFF12	l_stogir.420
    70b4:      	mov	x2, #0x32               ; =50
    70b8:      	str	x1, [x19]
    70bc:      	str	x0, [x19, #0x8]
    70c0:      	str	x2, [x19, #0x10]
    70c4:      	ldr	x19, [sp, #0x10]
    70c8:      	ldr	x20, [sp, #0x18]
    70cc:      	ldr	x21, [sp, #0x20]
    70d0:      	ldr	x22, [sp, #0x28]
    70d4:      	ldr	x23, [sp, #0x30]
    70d8:      	ldr	x24, [sp, #0x38]
    70dc:      	ldr	x29, [sp]
    70e0:      	ldr	x30, [sp, #0x8]
    70e4:      	add	sp, sp, #0x40
    70e8:      	ret
    70ec:      	movz	w1, #0x0, lsl #16
    70f0:      	movz	x0, #0x0, lsl #48
    70f4:      	ubfx	x1, x1, #0, #32
    70f8:      	lsr	x16, x1, #0
    70fc:      	cmp	x16, #0x1
    7100:      	b.eq	0x711c <_stogir.vector.memory-inputs+0x158>
    7104:      	b.lo	0x710c <_stogir.vector.memory-inputs+0x148>
    7108:      	b	0x7120 <_stogir.vector.memory-inputs+0x15c>
    710c:      	cmp	x16, #0x0
    7110:      	b.eq	0x7118 <_stogir.vector.memory-inputs+0x154>
    7114:      	b	0x7120 <_stogir.vector.memory-inputs+0x15c>
    7118:      	b	0x7124 <_stogir.vector.memory-inputs+0x160>
    711c:      	b	0x71c4 <_stogir.vector.memory-inputs+0x200>
    7120:      	b	0x7434 <_stogir.vector.memory-inputs+0x470>
    7124:      	mov	x1, #0x1                ; =1
    7128:      	adrp	x0, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		0000000000007128:  ARM64_RELOC_PAGE21	l_stogir.421
    712c:      	ldr	x0, [x0]
		000000000000712c:  ARM64_RELOC_PAGEOFF12	l_stogir.421
    7130:      	mov	x2, #0x1d               ; =29
    7134:      	b	0x70b8 <_stogir.vector.memory-inputs+0xf4>
    7138:      	ldr	x0, [x20, #0x28]
    713c:      	add	x0, x0, x2, lsl #4
    7140:      	ldr	x0, [x0]
    7144:      	mov	w1, #0x1                ; =1
    7148:      	b	0x70f4 <_stogir.vector.memory-inputs+0x130>
    714c:      	movz	x1, #0x0, lsl #48
    7150:      	cmp	x1, #0x0
    7154:      	b.eq	0x70ec <_stogir.vector.memory-inputs+0x128>
    7158:      	uxtb	w16, w0
    715c:      	cmp	w16, wzr
    7160:      	b.eq	0x7138 <_stogir.vector.memory-inputs+0x174>
    7164:      	ldr	x0, [x20]
    7168:      	add	x0, x0, x23, lsl #4
    716c:      	ldr	x0, [x0]
    7170:      	b	0x7144 <_stogir.vector.memory-inputs+0x180>
    7174:      	movz	x1, #0x0, lsl #48
    7178:      	b	0x7150 <_stogir.vector.memory-inputs+0x18c>
    717c:      	cmp	x23, #0x0
    7180:      	b.ge	0x714c <_stogir.vector.memory-inputs+0x188>
    7184:      	add	x3, x20, #0x28
    7188:      	add	x4, x20, #0x50
    718c:      	ldr	x3, [x3, #0x8]
    7190:      	ldr	x4, [x4, #0x8]
    7194:      	cmp	x3, x4
    7198:      	b.ne	0x720c <_stogir.vector.memory-inputs+0x248>
    719c:      	cmp	x1, x3
    71a0:      	b.gt	0x721c <_stogir.vector.memory-inputs+0x258>
    71a4:      	ldr	x1, [x20, #0x50]
    71a8:      	add	x1, x1, x2, lsl #2
    71ac:      	ldr	w1, [x1]
    71b0:      	sxtw	x1, w1
    71b4:      	cmp	x1, #0x0
    71b8:      	cset	w1, gt
    71bc:      	ubfx	x1, x1, #0, #8
    71c0:      	b	0x7220 <_stogir.vector.memory-inputs+0x25c>
    71c4:      	cmp	x23, #0x0
    71c8:      	b.le	0x71f8 <_stogir.vector.memory-inputs+0x234>
    71cc:      	uxtb	w0, w0
    71d0:      	cmp	x0, #0x83
    71d4:      	cset	w1, lt
    71d8:      	uxtb	w16, w1
    71dc:      	cmp	w16, wzr
    71e0:      	b.eq	0x7224 <_stogir.vector.memory-inputs+0x260>
    71e4:      	adrp	x17, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		00000000000071e4:  ARM64_RELOC_PAGE21	l_stogir.422
    71e8:      	ldr	x17, [x17]
		00000000000071e8:  ARM64_RELOC_PAGEOFF12	l_stogir.422
    71ec:      	add	x2, x0, x17
    71f0:      	ldrb	w2, [x2]
    71f4:      	b	0x7228 <_stogir.vector.memory-inputs+0x264>
    71f8:      	mov	x1, #0x1                ; =1
    71fc:      	adrp	x0, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		00000000000071fc:  ARM64_RELOC_PAGE21	l_stogir.423
    7200:      	ldr	x0, [x0]
		0000000000007200:  ARM64_RELOC_PAGEOFF12	l_stogir.423
    7204:      	mov	x2, #0x2c               ; =44
    7208:      	b	0x7134 <_stogir.vector.memory-inputs+0x170>
    720c:      	movz	x1, #0x0, lsl #48
    7210:      	b	0x7150 <_stogir.vector.memory-inputs+0x18c>
    7214:      	movz	x1, #0x0, lsl #48
    7218:      	b	0x7178 <_stogir.vector.memory-inputs+0x1b4>
    721c:      	movz	x1, #0x0, lsl #48
    7220:      	b	0x7210 <_stogir.vector.memory-inputs+0x24c>
    7224:      	movz	w2, #0x0, lsl #16
    7228:      	uxtb	w16, w2
    722c:      	and	w2, w16, #0x1
    7230:      	uxtb	w2, w2
    7234:      	ubfx	x2, x2, #0, #8
    7238:      	cmp	x2, #0x0
    723c:      	b.eq	0x71f8 <_stogir.vector.memory-inputs+0x234>
    7240:      	uxtb	w16, w1
    7244:      	cmp	w16, wzr
    7248:      	b.eq	0x7260 <_stogir.vector.memory-inputs+0x29c>
    724c:      	adrp	x17, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		000000000000724c:  ARM64_RELOC_PAGE21	l_stogir.422
    7250:      	ldr	x17, [x17]
		0000000000007250:  ARM64_RELOC_PAGEOFF12	l_stogir.422
    7254:      	add	x0, x0, x17
    7258:      	ldrb	w0, [x0]
    725c:      	b	0x7264 <_stogir.vector.memory-inputs+0x2a0>
    7260:      	movz	w0, #0x0, lsl #16
    7264:      	uxtb	w16, w0
    7268:      	and	w0, w16, #0x4
    726c:      	uxtb	w0, w0
    7270:      	ubfx	x0, x0, #0, #8
    7274:      	cmp	x0, #0x0
    7278:      	cset	w0, eq
    727c:      	uxtb	w16, w0
    7280:      	cmp	w16, wzr
    7284:      	cset	x0, eq
    7288:      	cmp	x0, #0x0
    728c:      	b.ne	0x71f8 <_stogir.vector.memory-inputs+0x234>
    7290:      	sxtw	x24, w24
    7294:      	cmp	x24, #0x0
    7298:      	cset	w0, gt
    729c:      	movz	x16, #0x0, lsl #48
    72a0:      	sub	x1, x16, x24
    72a4:      	sub	x2, x1, #0x1
    72a8:      	uxtb	w16, w0
    72ac:      	cmp	w16, wzr
    72b0:      	b.eq	0x7304 <_stogir.vector.memory-inputs+0x340>
    72b4:      	ldr	x1, [x20, #0x8]
    72b8:      	cmp	x24, x1
    72bc:      	b.ge	0x734c <_stogir.vector.memory-inputs+0x388>
    72c0:      	add	x1, x20, #0x78
    72c4:      	ldr	x1, [x1, #0x8]
    72c8:      	cmp	x24, x1
    72cc:      	b.ge	0x742c <_stogir.vector.memory-inputs+0x468>
    72d0:      	ldr	x1, [x20, #0x78]
    72d4:      	add	x1, x1, x24, lsl #2
    72d8:      	ldr	w1, [x1]
    72dc:      	sxtw	x1, w1
    72e0:      	cmp	x1, #0x0
    72e4:      	cset	w1, ge
    72e8:      	ubfx	x1, x1, #0, #8
    72ec:      	b	0x7430 <_stogir.vector.memory-inputs+0x46c>
    72f0:      	mov	x1, #0x1                ; =1
    72f4:      	adrp	x0, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		00000000000072f4:  ARM64_RELOC_PAGE21	l_stogir.424
    72f8:      	ldr	x0, [x0]
		00000000000072f8:  ARM64_RELOC_PAGEOFF12	l_stogir.424
    72fc:      	mov	x2, #0x2b               ; =43
    7300:      	b	0x7208 <_stogir.vector.memory-inputs+0x244>
    7304:      	cmp	x24, #0x0
    7308:      	b.ge	0x7354 <_stogir.vector.memory-inputs+0x390>
    730c:      	add	x3, x20, #0x28
    7310:      	add	x4, x20, #0x50
    7314:      	ldr	x3, [x3, #0x8]
    7318:      	ldr	x4, [x4, #0x8]
    731c:      	cmp	x3, x4
    7320:      	b.ne	0x7424 <_stogir.vector.memory-inputs+0x460>
    7324:      	cmp	x1, x3
    7328:      	b.gt	0x743c <_stogir.vector.memory-inputs+0x478>
    732c:      	ldr	x1, [x20, #0x50]
    7330:      	add	x1, x1, x2, lsl #2
    7334:      	ldr	w1, [x1]
    7338:      	sxtw	x1, w1
    733c:      	cmp	x1, #0x0
    7340:      	cset	w1, gt
    7344:      	ubfx	x1, x1, #0, #8
    7348:      	b	0x7440 <_stogir.vector.memory-inputs+0x47c>
    734c:      	movz	x1, #0x0, lsl #48
    7350:      	b	0x7358 <_stogir.vector.memory-inputs+0x394>
    7354:      	movz	x1, #0x0, lsl #48
    7358:      	cmp	x1, #0x0
    735c:      	b.eq	0x7390 <_stogir.vector.memory-inputs+0x3cc>
    7360:      	uxtb	w16, w0
    7364:      	cmp	w16, wzr
    7368:      	b.eq	0x737c <_stogir.vector.memory-inputs+0x3b8>
    736c:      	ldr	x0, [x20]
    7370:      	add	x0, x0, x24, lsl #4
    7374:      	ldr	x0, [x0]
    7378:      	b	0x7388 <_stogir.vector.memory-inputs+0x3c4>
    737c:      	ldr	x0, [x20, #0x28]
    7380:      	add	x0, x0, x2, lsl #4
    7384:      	ldr	x0, [x0]
    7388:      	mov	w1, #0x1                ; =1
    738c:      	b	0x7398 <_stogir.vector.memory-inputs+0x3d4>
    7390:      	movz	w1, #0x0, lsl #16
    7394:      	movz	x0, #0x0, lsl #48
    7398:      	ubfx	x1, x1, #0, #32
    739c:      	lsr	x16, x1, #0
    73a0:      	cmp	x16, #0x1
    73a4:      	b.eq	0x73c0 <_stogir.vector.memory-inputs+0x3fc>
    73a8:      	b.lo	0x73b0 <_stogir.vector.memory-inputs+0x3ec>
    73ac:      	b	0x73c4 <_stogir.vector.memory-inputs+0x400>
    73b0:      	cmp	x16, #0x0
    73b4:      	b.eq	0x73bc <_stogir.vector.memory-inputs+0x3f8>
    73b8:      	b	0x73c4 <_stogir.vector.memory-inputs+0x400>
    73bc:      	b	0x73c8 <_stogir.vector.memory-inputs+0x404>
    73c0:      	b	0x73dc <_stogir.vector.memory-inputs+0x418>
    73c4:      	b	0x7444 <_stogir.vector.memory-inputs+0x480>
    73c8:      	mov	x1, #0x1                ; =1
    73cc:      	adrp	x0, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		00000000000073cc:  ARM64_RELOC_PAGE21	l_stogir.425
    73d0:      	ldr	x0, [x0]
		00000000000073d0:  ARM64_RELOC_PAGEOFF12	l_stogir.425
    73d4:      	mov	x2, #0x1d               ; =29
    73d8:      	b	0x7300 <_stogir.vector.memory-inputs+0x33c>
    73dc:      	orr	w1, w0, wzr
    73e0:      	ubfx	x1, x1, #0, #32
    73e4:      	ubfx	x1, x1, #8, #8
    73e8:      	cmp	x1, #0x6
    73ec:      	b.ne	0x72f0 <_stogir.vector.memory-inputs+0x32c>
    73f0:      	uxtb	w0, w0
    73f4:      	cmp	x0, #0x48
    73f8:      	b.eq	0x72f0 <_stogir.vector.memory-inputs+0x32c>
    73fc:      	cmp	x0, #0x46
    7400:      	b.eq	0x72f0 <_stogir.vector.memory-inputs+0x32c>
    7404:      	mov	w0, w21
    7408:      	mov	w1, w22
    740c:      	bl	0x740c <_stogir.vector.memory-inputs+0x448>
		000000000000740c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    7410:      	sxtw	x0, w0
    7414:      	and	x0, x0, #0xffffffff
    7418:      	movz	x1, #0x0, lsl #48
    741c:      	movz	x2, #0x0, lsl #48
    7420:      	b	0x7300 <_stogir.vector.memory-inputs+0x33c>
    7424:      	movz	x1, #0x0, lsl #48
    7428:      	b	0x7358 <_stogir.vector.memory-inputs+0x394>
    742c:      	movz	x1, #0x0, lsl #48
    7430:      	b	0x7350 <_stogir.vector.memory-inputs+0x38c>
    7434:      	brk	#0
    7438:      	b	0x7434 <_stogir.vector.memory-inputs+0x470>
    743c:      	movz	x1, #0x0, lsl #48
    7440:      	b	0x7428 <_stogir.vector.memory-inputs+0x464>
    7444:      	brk	#0
    7448:      	b	0x7444 <_stogir.vector.memory-inputs+0x480>
    744c:      	mov	x19, x8
    7450:      	b	0x70a8 <_stogir.vector.memory-inputs+0xe4>
    7454:      	mov	x19, x8
    7458:      	b	0x70a8 <_stogir.vector.memory-inputs+0xe4>
    745c:      	mov	x19, x8
    7460:      	b	0x70a8 <_stogir.vector.memory-inputs+0xe4>
    7464:      	mov	x19, x8
    7468:      	b	0x70a8 <_stogir.vector.memory-inputs+0xe4>

000000000000746c <_stogir.vector.store-inputs>:
    746c:      	sub	sp, sp, #0x40
    7470:      	str	x29, [sp]
    7474:      	str	x30, [sp, #0x8]
    7478:      	mov	x29, sp
    747c:      	str	x19, [sp, #0x30]
    7480:      	sxtw	x4, w4
    7484:      	cmp	x4, #0x0
    7488:      	cset	w5, gt
    748c:      	movz	x16, #0x0, lsl #48
    7490:      	sub	x6, x16, x4
    7494:      	sub	x7, x6, #0x1
    7498:      	uxtb	w16, w5
    749c:      	cmp	w16, wzr
    74a0:      	b.eq	0x74e0 <_stogir.vector.store-inputs+0x74>
    74a4:      	ldr	x6, [x0, #0x8]
    74a8:      	cmp	x4, x6
    74ac:      	b.ge	0x7530 <_stogir.vector.store-inputs+0xc4>
    74b0:      	add	x6, x0, #0x78
    74b4:      	ldr	x6, [x6, #0x8]
    74b8:      	cmp	x4, x6
    74bc:      	b.ge	0x7624 <_stogir.vector.store-inputs+0x1b8>
    74c0:      	ldr	x6, [x0, #0x78]
    74c4:      	add	x6, x6, x4, lsl #2
    74c8:      	ldr	w6, [x6]
    74cc:      	sxtw	x6, w6
    74d0:      	cmp	x6, #0x0
    74d4:      	cset	w6, ge
    74d8:      	ubfx	x6, x6, #0, #8
    74dc:      	b	0x7628 <_stogir.vector.store-inputs+0x1bc>
    74e0:      	cmp	x4, #0x0
    74e4:      	b.ge	0x7538 <_stogir.vector.store-inputs+0xcc>
    74e8:      	add	x9, x0, #0x28
    74ec:      	add	x10, x0, #0x50
    74f0:      	ldr	x9, [x9, #0x8]
    74f4:      	ldr	x10, [x10, #0x8]
    74f8:      	cmp	x9, x10
    74fc:      	b.ne	0x7528 <_stogir.vector.store-inputs+0xbc>
    7500:      	cmp	x6, x9
    7504:      	b.gt	0x762c <_stogir.vector.store-inputs+0x1c0>
    7508:      	ldr	x6, [x0, #0x50]
    750c:      	add	x6, x6, x7, lsl #2
    7510:      	ldr	w6, [x6]
    7514:      	sxtw	x6, w6
    7518:      	cmp	x6, #0x0
    751c:      	cset	w6, gt
    7520:      	ubfx	x6, x6, #0, #8
    7524:      	b	0x7630 <_stogir.vector.store-inputs+0x1c4>
    7528:      	movz	x6, #0x0, lsl #48
    752c:      	b	0x753c <_stogir.vector.store-inputs+0xd0>
    7530:      	movz	x6, #0x0, lsl #48
    7534:      	b	0x753c <_stogir.vector.store-inputs+0xd0>
    7538:      	movz	x6, #0x0, lsl #48
    753c:      	cmp	x6, #0x0
    7540:      	b.eq	0x7574 <_stogir.vector.store-inputs+0x108>
    7544:      	uxtb	w16, w5
    7548:      	cmp	w16, wzr
    754c:      	b.eq	0x7560 <_stogir.vector.store-inputs+0xf4>
    7550:      	ldr	x5, [x0]
    7554:      	add	x4, x5, x4, lsl #4
    7558:      	ldr	x4, [x4]
    755c:      	b	0x756c <_stogir.vector.store-inputs+0x100>
    7560:      	ldr	x4, [x0, #0x28]
    7564:      	add	x4, x4, x7, lsl #4
    7568:      	ldr	x4, [x4]
    756c:      	mov	w5, #0x1                ; =1
    7570:      	b	0x757c <_stogir.vector.store-inputs+0x110>
    7574:      	movz	w5, #0x0, lsl #16
    7578:      	movz	x4, #0x0, lsl #48
    757c:      	ubfx	x5, x5, #0, #32
    7580:      	lsr	x16, x5, #0
    7584:      	cmp	x16, #0x1
    7588:      	b.eq	0x75a4 <_stogir.vector.store-inputs+0x138>
    758c:      	b.lo	0x7594 <_stogir.vector.store-inputs+0x128>
    7590:      	b	0x75a8 <_stogir.vector.store-inputs+0x13c>
    7594:      	cmp	x16, #0x0
    7598:      	b.eq	0x75a0 <_stogir.vector.store-inputs+0x134>
    759c:      	b	0x75a8 <_stogir.vector.store-inputs+0x13c>
    75a0:      	b	0x75ac <_stogir.vector.store-inputs+0x140>
    75a4:      	b	0x75c4 <_stogir.vector.store-inputs+0x158>
    75a8:      	b	0x7634 <_stogir.vector.store-inputs+0x1c8>
    75ac:      	mov	x19, x8
    75b0:      	mov	x0, #0x1                ; =1
    75b4:      	adrp	x1, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		00000000000075b4:  ARM64_RELOC_PAGE21	l_stogir.426
    75b8:      	ldr	x1, [x1]
		00000000000075b8:  ARM64_RELOC_PAGEOFF12	l_stogir.426
    75bc:      	mov	x2, #0x1a               ; =26
    75c0:      	b	0x7604 <_stogir.vector.store-inputs+0x198>
    75c4:      	ubfx	x4, x4, #0, #32
    75c8:      	ubfx	x4, x4, #8, #8
    75cc:      	mov	x19, x8
    75d0:      	add	x8, sp, #0x10
    75d4:      	fmov	s31, w1
    75d8:      	mov	w1, w4
    75dc:      	mov	w4, w3
    75e0:      	mov	w3, w2
    75e4:      	fmov	w2, s31
    75e8:      	bl	0x75e8 <_stogir.vector.store-inputs+0x17c>
		00000000000075e8:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    75ec:      	add	x16, sp, #0x10
    75f0:      	ldr	x0, [x16]
    75f4:      	add	x16, sp, #0x10
    75f8:      	ldr	x1, [x16, #0x8]
    75fc:      	add	x16, sp, #0x10
    7600:      	ldr	x2, [x16, #0x10]
    7604:      	str	x0, [x19]
    7608:      	str	x1, [x19, #0x8]
    760c:      	str	x2, [x19, #0x10]
    7610:      	ldr	x19, [sp, #0x30]
    7614:      	ldr	x29, [sp]
    7618:      	ldr	x30, [sp, #0x8]
    761c:      	add	sp, sp, #0x40
    7620:      	ret
    7624:      	movz	x6, #0x0, lsl #48
    7628:      	b	0x7534 <_stogir.vector.store-inputs+0xc8>
    762c:      	movz	x6, #0x0, lsl #48
    7630:      	b	0x752c <_stogir.vector.store-inputs+0xc0>
    7634:      	brk	#0
    7638:      	b	0x7634 <_stogir.vector.store-inputs+0x1c8>

000000000000763c <_stogir.types.size>:
    763c:      	sxtw	x2, w0
    7640:      	sxtw	x3, w1
    7644:      	cmp	x2, #0xf
    7648:      	cset	w4, gt
    764c:      	cmp	x2, #0x0
    7650:      	cset	w5, eq
    7654:      	cmp	x3, #0x4
    7658:      	cset	w6, eq
    765c:      	cmp	x3, #0x8
    7660:      	cset	w7, eq
    7664:      	uxtb	w16, w4
    7668:      	cmp	w16, wzr
    766c:      	b.eq	0x7730 <_stogir.types.size+0xf4>
    7670:      	cmp	x2, #0x80
    7674:      	cset	w8, lt
    7678:      	uxtb	w16, w8
    767c:      	cmp	w16, wzr
    7680:      	b.eq	0x7730 <_stogir.types.size+0xf4>
    7684:      	and	w0, w0, #0xf
    7688:      	ubfx	x9, x0, #0, #32
    768c:      	cmp	x9, #0x1
    7690:      	cset	w10, ge
    7694:      	uxtb	w16, w10
    7698:      	cmp	w16, wzr
    769c:      	b.eq	0x7730 <_stogir.types.size+0xf4>
    76a0:      	cmp	x9, #0xd
    76a4:      	cset	w9, le
    76a8:      	uxtb	w16, w9
    76ac:      	cmp	w16, wzr
    76b0:      	b.eq	0x7730 <_stogir.types.size+0xf4>
    76b4:      	cmp	x2, #0x0
    76b8:      	cset	w3, ge
    76bc:      	cmp	x2, #0xd
    76c0:      	cset	w11, le
    76c4:      	uxtb	w16, w3
    76c8:      	cmp	w16, wzr
    76cc:      	b.eq	0x76dc <_stogir.types.size+0xa0>
    76d0:      	uxtb	w16, w11
    76d4:      	cmp	w16, wzr
    76d8:      	b.ne	0x7710 <_stogir.types.size+0xd4>
    76dc:      	uxtb	w16, w4
    76e0:      	cmp	w16, wzr
    76e4:      	b.eq	0x770c <_stogir.types.size+0xd0>
    76e8:      	uxtb	w16, w8
    76ec:      	cmp	w16, wzr
    76f0:      	b.eq	0x770c <_stogir.types.size+0xd0>
    76f4:      	uxtb	w16, w10
    76f8:      	cmp	w16, wzr
    76fc:      	b.eq	0x770c <_stogir.types.size+0xd0>
    7700:      	uxtb	w16, w9
    7704:      	cmp	w16, wzr
    7708:      	b.ne	0x7710 <_stogir.types.size+0xd4>
    770c:      	movn	w0, #0x0, lsl #16
    7710:      	uxtb	w16, w6
    7714:      	cmp	w16, wzr
    7718:      	b.ne	0x7850 <_stogir.types.size+0x214>
    771c:      	uxtb	w16, w7
    7720:      	cmp	w16, wzr
    7724:      	b.ne	0x7850 <_stogir.types.size+0x214>
    7728:      	movn	w1, #0x0, lsl #16
    772c:      	b	0x77e4 <_stogir.types.size+0x1a8>
    7730:      	uxtb	w16, w6
    7734:      	cmp	w16, wzr
    7738:      	b.ne	0x7750 <_stogir.types.size+0x114>
    773c:      	uxtb	w16, w7
    7740:      	cmp	w16, wzr
    7744:      	b.ne	0x7750 <_stogir.types.size+0x114>
    7748:      	movn	x3, #0x0, lsl #48
    774c:      	b	0x7768 <_stogir.types.size+0x12c>
    7750:      	uxtb	w16, w5
    7754:      	cmp	w16, wzr
    7758:      	b.eq	0x7770 <_stogir.types.size+0x134>
    775c:      	movz	x3, #0x0, lsl #48
    7760:      	b	0x7768 <_stogir.types.size+0x12c>
    7764:      	mov	x3, #0x1                ; =1
    7768:      	mov	x0, x3
    776c:      	ret
    7770:      	cmp	x2, #0x1
    7774:      	b.eq	0x7764 <_stogir.types.size+0x128>
    7778:      	cmp	x2, #0x2
    777c:      	b.eq	0x7764 <_stogir.types.size+0x128>
    7780:      	cmp	x2, #0x7
    7784:      	b.eq	0x7764 <_stogir.types.size+0x128>
    7788:      	cmp	x2, #0x8
    778c:      	b.eq	0x7764 <_stogir.types.size+0x128>
    7790:      	cmp	x2, #0x3
    7794:      	b.eq	0x78d4 <_stogir.types.size+0x298>
    7798:      	cmp	x2, #0x9
    779c:      	b.eq	0x78d4 <_stogir.types.size+0x298>
    77a0:      	cmp	x2, #0x4
    77a4:      	b.eq	0x7904 <_stogir.types.size+0x2c8>
    77a8:      	cmp	x2, #0xa
    77ac:      	b.eq	0x7904 <_stogir.types.size+0x2c8>
    77b0:      	cmp	x2, #0xd
    77b4:      	b.eq	0x7904 <_stogir.types.size+0x2c8>
    77b8:      	cmp	x2, #0x5
    77bc:      	b.eq	0x7914 <_stogir.types.size+0x2d8>
    77c0:      	cmp	x2, #0xb
    77c4:      	b.eq	0x7914 <_stogir.types.size+0x2d8>
    77c8:      	cmp	x2, #0xc
    77cc:      	b.eq	0x7914 <_stogir.types.size+0x2d8>
    77d0:      	cmp	x2, #0x6
    77d4:      	b.eq	0x77dc <_stogir.types.size+0x1a0>
    77d8:      	movn	x3, #0x0, lsl #48
    77dc:      	b	0x7918 <_stogir.types.size+0x2dc>
    77e0:      	mov	w1, #0x1                ; =1
    77e4:      	sxtw	x0, w1
    77e8:      	cmp	x0, #0x0
    77ec:      	b.ge	0x77f8 <_stogir.types.size+0x1bc>
    77f0:      	movn	x3, #0x0, lsl #48
    77f4:      	b	0x7768 <_stogir.types.size+0x12c>
    77f8:      	uxtb	w16, w4
    77fc:      	cmp	w16, wzr
    7800:      	b.eq	0x78dc <_stogir.types.size+0x2a0>
    7804:      	uxtb	w16, w8
    7808:      	cmp	w16, wzr
    780c:      	b.eq	0x78dc <_stogir.types.size+0x2a0>
    7810:      	uxtb	w16, w10
    7814:      	cmp	w16, wzr
    7818:      	b.eq	0x78dc <_stogir.types.size+0x2a0>
    781c:      	uxtb	w16, w9
    7820:      	cmp	w16, wzr
    7824:      	b.eq	0x78dc <_stogir.types.size+0x2a0>
    7828:      	ubfx	x0, x2, #4, #32
    782c:      	sub	w0, w0, #0x1
    7830:      	sxtw	x0, w0
    7834:      	mov	x16, #0x1               ; =1
    7838:      	lsl	x0, x16, x0
    783c:      	b	0x7844 <_stogir.types.size+0x208>
    7840:      	movn	w0, #0x0, lsl #16
    7844:      	mul	w0, w0, w1
    7848:      	sxtw	x3, w0
    784c:      	b	0x77f4 <_stogir.types.size+0x1b8>
    7850:      	sxtw	x0, w0
    7854:      	cmp	x0, #0x0
    7858:      	b.ne	0x7864 <_stogir.types.size+0x228>
    785c:      	movz	w1, #0x0, lsl #16
    7860:      	b	0x77e4 <_stogir.types.size+0x1a8>
    7864:      	cmp	x0, #0x1
    7868:      	b.eq	0x77e0 <_stogir.types.size+0x1a4>
    786c:      	cmp	x0, #0x2
    7870:      	b.eq	0x77e0 <_stogir.types.size+0x1a4>
    7874:      	cmp	x0, #0x7
    7878:      	b.eq	0x77e0 <_stogir.types.size+0x1a4>
    787c:      	cmp	x0, #0x8
    7880:      	b.eq	0x77e0 <_stogir.types.size+0x1a4>
    7884:      	cmp	x0, #0x3
    7888:      	b.eq	0x790c <_stogir.types.size+0x2d0>
    788c:      	cmp	x0, #0x9
    7890:      	b.eq	0x790c <_stogir.types.size+0x2d0>
    7894:      	cmp	x0, #0x4
    7898:      	b.eq	0x791c <_stogir.types.size+0x2e0>
    789c:      	cmp	x0, #0xa
    78a0:      	b.eq	0x791c <_stogir.types.size+0x2e0>
    78a4:      	cmp	x0, #0xd
    78a8:      	b.eq	0x791c <_stogir.types.size+0x2e0>
    78ac:      	cmp	x0, #0x5
    78b0:      	b.eq	0x7924 <_stogir.types.size+0x2e8>
    78b4:      	cmp	x0, #0xb
    78b8:      	b.eq	0x7924 <_stogir.types.size+0x2e8>
    78bc:      	cmp	x0, #0xc
    78c0:      	b.eq	0x7924 <_stogir.types.size+0x2e8>
    78c4:      	cmp	x0, #0x6
    78c8:      	b.eq	0x78d0 <_stogir.types.size+0x294>
    78cc:      	movn	w1, #0x0, lsl #16
    78d0:      	b	0x7928 <_stogir.types.size+0x2ec>
    78d4:      	mov	x3, #0x2                ; =2
    78d8:      	b	0x7768 <_stogir.types.size+0x12c>
    78dc:      	uxtb	w16, w3
    78e0:      	cmp	w16, wzr
    78e4:      	b.eq	0x7840 <_stogir.types.size+0x204>
    78e8:      	uxtb	w16, w11
    78ec:      	cmp	w16, wzr
    78f0:      	b.eq	0x7840 <_stogir.types.size+0x204>
    78f4:      	uxtb	w16, w5
    78f8:      	cmp	w16, wzr
    78fc:      	cset	w0, eq
    7900:      	b	0x7844 <_stogir.types.size+0x208>
    7904:      	mov	x3, #0x4                ; =4
    7908:      	b	0x78d8 <_stogir.types.size+0x29c>
    790c:      	mov	w1, #0x2                ; =2
    7910:      	b	0x77e4 <_stogir.types.size+0x1a8>
    7914:      	mov	x3, #0x8                ; =8
    7918:      	b	0x7908 <_stogir.types.size+0x2cc>
    791c:      	mov	w1, #0x4                ; =4
    7920:      	b	0x7910 <_stogir.types.size+0x2d4>
    7924:      	mov	w1, #0x8                ; =8
    7928:      	b	0x7920 <_stogir.types.size+0x2e4>

000000000000792c <_stogir.checked.projection>:
    792c:      	sub	sp, sp, #0x40
    7930:      	str	x29, [sp]
    7934:      	str	x30, [sp, #0x8]
    7938:      	mov	x29, sp
    793c:      	str	x19, [sp, #0x30]
    7940:      	sxtw	x2, w1
    7944:      	cmp	x2, #0x0
    7948:      	cset	w3, gt
    794c:      	movz	x16, #0x0, lsl #48
    7950:      	sub	x4, x16, x2
    7954:      	sub	x5, x4, #0x1
    7958:      	uxtb	w16, w3
    795c:      	cmp	w16, wzr
    7960:      	b.eq	0x79a0 <_stogir.checked.projection+0x74>
    7964:      	ldr	x4, [x0, #0x8]
    7968:      	cmp	x2, x4
    796c:      	b.ge	0x79f0 <_stogir.checked.projection+0xc4>
    7970:      	add	x4, x0, #0x78
    7974:      	ldr	x4, [x4, #0x8]
    7978:      	cmp	x2, x4
    797c:      	b.ge	0x7af0 <_stogir.checked.projection+0x1c4>
    7980:      	ldr	x4, [x0, #0x78]
    7984:      	add	x4, x4, x2, lsl #2
    7988:      	ldr	w4, [x4]
    798c:      	sxtw	x4, w4
    7990:      	cmp	x4, #0x0
    7994:      	cset	w4, ge
    7998:      	ubfx	x4, x4, #0, #8
    799c:      	b	0x7af4 <_stogir.checked.projection+0x1c8>
    79a0:      	cmp	x2, #0x0
    79a4:      	b.ge	0x79f8 <_stogir.checked.projection+0xcc>
    79a8:      	add	x6, x0, #0x28
    79ac:      	add	x7, x0, #0x50
    79b0:      	ldr	x6, [x6, #0x8]
    79b4:      	ldr	x7, [x7, #0x8]
    79b8:      	cmp	x6, x7
    79bc:      	b.ne	0x79e8 <_stogir.checked.projection+0xbc>
    79c0:      	cmp	x4, x6
    79c4:      	b.gt	0x7b20 <_stogir.checked.projection+0x1f4>
    79c8:      	ldr	x4, [x0, #0x50]
    79cc:      	add	x4, x4, x5, lsl #2
    79d0:      	ldr	w4, [x4]
    79d4:      	sxtw	x4, w4
    79d8:      	cmp	x4, #0x0
    79dc:      	cset	w4, gt
    79e0:      	ubfx	x4, x4, #0, #8
    79e4:      	b	0x7b24 <_stogir.checked.projection+0x1f8>
    79e8:      	movz	x4, #0x0, lsl #48
    79ec:      	b	0x79fc <_stogir.checked.projection+0xd0>
    79f0:      	movz	x4, #0x0, lsl #48
    79f4:      	b	0x79fc <_stogir.checked.projection+0xd0>
    79f8:      	movz	x4, #0x0, lsl #48
    79fc:      	cmp	x4, #0x0
    7a00:      	b.eq	0x7a34 <_stogir.checked.projection+0x108>
    7a04:      	uxtb	w16, w3
    7a08:      	cmp	w16, wzr
    7a0c:      	b.eq	0x7a20 <_stogir.checked.projection+0xf4>
    7a10:      	ldr	x3, [x0]
    7a14:      	add	x2, x3, x2, lsl #4
    7a18:      	ldr	x2, [x2]
    7a1c:      	b	0x7a2c <_stogir.checked.projection+0x100>
    7a20:      	ldr	x2, [x0, #0x28]
    7a24:      	add	x2, x2, x5, lsl #4
    7a28:      	ldr	x2, [x2]
    7a2c:      	mov	w3, #0x1                ; =1
    7a30:      	b	0x7a3c <_stogir.checked.projection+0x110>
    7a34:      	movz	w3, #0x0, lsl #16
    7a38:      	movz	x2, #0x0, lsl #48
    7a3c:      	ubfx	x3, x3, #0, #32
    7a40:      	lsr	x16, x3, #0
    7a44:      	cmp	x16, #0x1
    7a48:      	b.eq	0x7a64 <_stogir.checked.projection+0x138>
    7a4c:      	b.lo	0x7a54 <_stogir.checked.projection+0x128>
    7a50:      	b	0x7a68 <_stogir.checked.projection+0x13c>
    7a54:      	cmp	x16, #0x0
    7a58:      	b.eq	0x7a60 <_stogir.checked.projection+0x134>
    7a5c:      	b	0x7a68 <_stogir.checked.projection+0x13c>
    7a60:      	b	0x7a6c <_stogir.checked.projection+0x140>
    7a64:      	b	0x7ab4 <_stogir.checked.projection+0x188>
    7a68:      	b	0x7b28 <_stogir.checked.projection+0x1fc>
    7a6c:      	mov	x19, x8
    7a70:      	mov	x0, #0x1                ; =1
    7a74:      	adrp	x1, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		0000000000007a74:  ARM64_RELOC_PAGE21	l_stogir.427
    7a78:      	ldr	x1, [x1]
		0000000000007a78:  ARM64_RELOC_PAGEOFF12	l_stogir.427
    7a7c:      	mov	x2, #0x17               ; =23
    7a80:      	b	0x7a94 <_stogir.checked.projection+0x168>
    7a84:      	mov	x0, #0x1                ; =1
    7a88:      	adrp	x1, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		0000000000007a88:  ARM64_RELOC_PAGE21	l_stogir.428
    7a8c:      	ldr	x1, [x1]
		0000000000007a8c:  ARM64_RELOC_PAGEOFF12	l_stogir.428
    7a90:      	mov	x2, #0x20               ; =32
    7a94:      	str	x0, [x19]
    7a98:      	str	x1, [x19, #0x8]
    7a9c:      	str	x2, [x19, #0x10]
    7aa0:      	ldr	x19, [sp, #0x30]
    7aa4:      	ldr	x29, [sp]
    7aa8:      	ldr	x30, [sp, #0x8]
    7aac:      	add	sp, sp, #0x40
    7ab0:      	ret
    7ab4:      	uxtb	w3, w2
    7ab8:      	cmp	x3, #0x29
    7abc:      	b.lt	0x7b30 <_stogir.checked.projection+0x204>
    7ac0:      	cmp	x3, #0x2b
    7ac4:      	b.gt	0x7b38 <_stogir.checked.projection+0x20c>
    7ac8:      	mov	x19, x8
    7acc:      	add	x8, sp, #0x10
    7ad0:      	bl	0x7ad0 <_stogir.checked.projection+0x1a4>
		0000000000007ad0:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    7ad4:      	add	x16, sp, #0x10
    7ad8:      	ldr	x0, [x16]
    7adc:      	add	x16, sp, #0x10
    7ae0:      	ldr	x1, [x16, #0x8]
    7ae4:      	add	x16, sp, #0x10
    7ae8:      	ldr	x2, [x16, #0x10]
    7aec:      	b	0x7a94 <_stogir.checked.projection+0x168>
    7af0:      	movz	x4, #0x0, lsl #48
    7af4:      	b	0x79f4 <_stogir.checked.projection+0xc8>
    7af8:      	ubfx	x2, x2, #0, #32
    7afc:      	ubfx	x0, x2, #8, #8
    7b00:      	cmp	x0, #0x0
    7b04:      	b.eq	0x7a84 <_stogir.checked.projection+0x158>
    7b08:      	cmp	x0, #0xd
    7b0c:      	b.gt	0x7a84 <_stogir.checked.projection+0x158>
    7b10:      	movz	x0, #0x0, lsl #48
    7b14:      	movz	x1, #0x0, lsl #48
    7b18:      	movz	x2, #0x0, lsl #48
    7b1c:      	b	0x7a94 <_stogir.checked.projection+0x168>
    7b20:      	movz	x4, #0x0, lsl #48
    7b24:      	b	0x79ec <_stogir.checked.projection+0xc0>
    7b28:      	brk	#0
    7b2c:      	b	0x7b28 <_stogir.checked.projection+0x1fc>
    7b30:      	mov	x19, x8
    7b34:      	b	0x7af8 <_stogir.checked.projection+0x1cc>
    7b38:      	mov	x19, x8
    7b3c:      	b	0x7af8 <_stogir.checked.projection+0x1cc>

0000000000007b40 <_stogir.atomic.ordinary?>:
    7b40:      	sxtw	x1, w1
    7b44:      	cmp	x1, #0x0
    7b48:      	cset	w3, gt
    7b4c:      	movz	x16, #0x0, lsl #48
    7b50:      	sub	x4, x16, x1
    7b54:      	sub	x5, x4, #0x1
    7b58:      	uxtb	w16, w3
    7b5c:      	cmp	w16, wzr
    7b60:      	b.eq	0x7ba0 <_stogir.atomic.ordinary?+0x60>
    7b64:      	ldr	x4, [x0, #0x8]
    7b68:      	cmp	x1, x4
    7b6c:      	b.ge	0x7bf0 <_stogir.atomic.ordinary?+0xb0>
    7b70:      	add	x4, x0, #0x78
    7b74:      	ldr	x4, [x4, #0x8]
    7b78:      	cmp	x1, x4
    7b7c:      	b.ge	0x7ca8 <_stogir.atomic.ordinary?+0x168>
    7b80:      	ldr	x4, [x0, #0x78]
    7b84:      	add	x4, x4, x1, lsl #2
    7b88:      	ldr	w4, [x4]
    7b8c:      	sxtw	x4, w4
    7b90:      	cmp	x4, #0x0
    7b94:      	cset	w4, ge
    7b98:      	ubfx	x4, x4, #0, #8
    7b9c:      	b	0x7cac <_stogir.atomic.ordinary?+0x16c>
    7ba0:      	cmp	x1, #0x0
    7ba4:      	b.ge	0x7bf8 <_stogir.atomic.ordinary?+0xb8>
    7ba8:      	add	x6, x0, #0x28
    7bac:      	add	x7, x0, #0x50
    7bb0:      	ldr	x6, [x6, #0x8]
    7bb4:      	ldr	x7, [x7, #0x8]
    7bb8:      	cmp	x6, x7
    7bbc:      	b.ne	0x7be8 <_stogir.atomic.ordinary?+0xa8>
    7bc0:      	cmp	x4, x6
    7bc4:      	b.gt	0x7cc8 <_stogir.atomic.ordinary?+0x188>
    7bc8:      	ldr	x4, [x0, #0x50]
    7bcc:      	add	x4, x4, x5, lsl #2
    7bd0:      	ldr	w4, [x4]
    7bd4:      	sxtw	x4, w4
    7bd8:      	cmp	x4, #0x0
    7bdc:      	cset	w4, gt
    7be0:      	ubfx	x4, x4, #0, #8
    7be4:      	b	0x7ccc <_stogir.atomic.ordinary?+0x18c>
    7be8:      	movz	x4, #0x0, lsl #48
    7bec:      	b	0x7bfc <_stogir.atomic.ordinary?+0xbc>
    7bf0:      	movz	x4, #0x0, lsl #48
    7bf4:      	b	0x7bfc <_stogir.atomic.ordinary?+0xbc>
    7bf8:      	movz	x4, #0x0, lsl #48
    7bfc:      	cmp	x4, #0x0
    7c00:      	b.eq	0x7c34 <_stogir.atomic.ordinary?+0xf4>
    7c04:      	uxtb	w16, w3
    7c08:      	cmp	w16, wzr
    7c0c:      	b.eq	0x7c20 <_stogir.atomic.ordinary?+0xe0>
    7c10:      	ldr	x0, [x0]
    7c14:      	add	x0, x0, x1, lsl #4
    7c18:      	ldr	x0, [x0]
    7c1c:      	b	0x7c2c <_stogir.atomic.ordinary?+0xec>
    7c20:      	ldr	x0, [x0, #0x28]
    7c24:      	add	x0, x0, x5, lsl #4
    7c28:      	ldr	x0, [x0]
    7c2c:      	mov	w1, #0x1                ; =1
    7c30:      	b	0x7c3c <_stogir.atomic.ordinary?+0xfc>
    7c34:      	movz	w1, #0x0, lsl #16
    7c38:      	movz	x0, #0x0, lsl #48
    7c3c:      	ubfx	x1, x1, #0, #32
    7c40:      	lsr	x16, x1, #0
    7c44:      	cmp	x16, #0x1
    7c48:      	b.eq	0x7c64 <_stogir.atomic.ordinary?+0x124>
    7c4c:      	b.lo	0x7c54 <_stogir.atomic.ordinary?+0x114>
    7c50:      	b	0x7c68 <_stogir.atomic.ordinary?+0x128>
    7c54:      	cmp	x16, #0x0
    7c58:      	b.eq	0x7c60 <_stogir.atomic.ordinary?+0x120>
    7c5c:      	b	0x7c68 <_stogir.atomic.ordinary?+0x128>
    7c60:      	b	0x7c6c <_stogir.atomic.ordinary?+0x12c>
    7c64:      	b	0x7c7c <_stogir.atomic.ordinary?+0x13c>
    7c68:      	b	0x7cd0 <_stogir.atomic.ordinary?+0x190>
    7c6c:      	movz	x0, #0x0, lsl #48
    7c70:      	b	0x7c78 <_stogir.atomic.ordinary?+0x138>
    7c74:      	movz	x0, #0x0, lsl #48
    7c78:      	ret
    7c7c:      	sxtw	x2, w2
    7c80:      	orr	w1, w0, wzr
    7c84:      	ubfx	x1, x1, #0, #32
    7c88:      	ubfx	x1, x1, #8, #8
    7c8c:      	cmp	x1, x2
    7c90:      	b.ne	0x7c74 <_stogir.atomic.ordinary?+0x134>
    7c94:      	uxtb	w0, w0
    7c98:      	cmp	x0, #0x46
    7c9c:      	b.ne	0x7cb0 <_stogir.atomic.ordinary?+0x170>
    7ca0:      	movz	x0, #0x0, lsl #48
    7ca4:      	b	0x7cc4 <_stogir.atomic.ordinary?+0x184>
    7ca8:      	movz	x4, #0x0, lsl #48
    7cac:      	b	0x7bf4 <_stogir.atomic.ordinary?+0xb4>
    7cb0:      	cmp	x0, #0x48
    7cb4:      	cset	w0, eq
    7cb8:      	uxtb	w16, w0
    7cbc:      	cmp	w16, wzr
    7cc0:      	cset	x0, eq
    7cc4:      	b	0x7c78 <_stogir.atomic.ordinary?+0x138>
    7cc8:      	movz	x4, #0x0, lsl #48
    7ccc:      	b	0x7bec <_stogir.atomic.ordinary?+0xac>
    7cd0:      	brk	#0
    7cd4:      	b	0x7cd0 <_stogir.atomic.ordinary?+0x190>

0000000000007cd8 <_stogir.types.scalar-size>:
    7cd8:      	sxtw	x1, w1
    7cdc:      	cmp	x1, #0x4
    7ce0:      	b.eq	0x7cf4 <_stogir.types.scalar-size+0x1c>
    7ce4:      	cmp	x1, #0x8
    7ce8:      	b.eq	0x7cf4 <_stogir.types.scalar-size+0x1c>
    7cec:      	movn	x1, #0x0, lsl #48
    7cf0:      	b	0x7d0c <_stogir.types.scalar-size+0x34>
    7cf4:      	sxtw	x0, w0
    7cf8:      	cmp	x0, #0x0
    7cfc:      	b.ne	0x7d14 <_stogir.types.scalar-size+0x3c>
    7d00:      	movz	x1, #0x0, lsl #48
    7d04:      	b	0x7d0c <_stogir.types.scalar-size+0x34>
    7d08:      	mov	x1, #0x1                ; =1
    7d0c:      	mov	x0, x1
    7d10:      	ret
    7d14:      	cmp	x0, #0x1
    7d18:      	b.eq	0x7d08 <_stogir.types.scalar-size+0x30>
    7d1c:      	cmp	x0, #0x2
    7d20:      	b.eq	0x7d08 <_stogir.types.scalar-size+0x30>
    7d24:      	cmp	x0, #0x7
    7d28:      	b.eq	0x7d08 <_stogir.types.scalar-size+0x30>
    7d2c:      	cmp	x0, #0x8
    7d30:      	b.eq	0x7d08 <_stogir.types.scalar-size+0x30>
    7d34:      	cmp	x0, #0x3
    7d38:      	b.eq	0x7d84 <_stogir.types.scalar-size+0xac>
    7d3c:      	cmp	x0, #0x9
    7d40:      	b.eq	0x7d84 <_stogir.types.scalar-size+0xac>
    7d44:      	cmp	x0, #0x4
    7d48:      	b.eq	0x7d8c <_stogir.types.scalar-size+0xb4>
    7d4c:      	cmp	x0, #0xa
    7d50:      	b.eq	0x7d8c <_stogir.types.scalar-size+0xb4>
    7d54:      	cmp	x0, #0xd
    7d58:      	b.eq	0x7d8c <_stogir.types.scalar-size+0xb4>
    7d5c:      	cmp	x0, #0x5
    7d60:      	b.eq	0x7d94 <_stogir.types.scalar-size+0xbc>
    7d64:      	cmp	x0, #0xb
    7d68:      	b.eq	0x7d94 <_stogir.types.scalar-size+0xbc>
    7d6c:      	cmp	x0, #0xc
    7d70:      	b.eq	0x7d94 <_stogir.types.scalar-size+0xbc>
    7d74:      	cmp	x0, #0x6
    7d78:      	b.eq	0x7d80 <_stogir.types.scalar-size+0xa8>
    7d7c:      	movn	x1, #0x0, lsl #48
    7d80:      	b	0x7d98 <_stogir.types.scalar-size+0xc0>
    7d84:      	mov	x1, #0x2                ; =2
    7d88:      	b	0x7d0c <_stogir.types.scalar-size+0x34>
    7d8c:      	mov	x1, #0x4                ; =4
    7d90:      	b	0x7d88 <_stogir.types.scalar-size+0xb0>
    7d94:      	mov	x1, #0x8                ; =8
    7d98:      	b	0x7d90 <_stogir.types.scalar-size+0xb8>

0000000000007d9c <_stogir.terminal.inputs>:
    7d9c:      	sxtw	x1, w1
    7da0:      	cmp	x1, #0x60
    7da4:      	cset	w4, eq
    7da8:      	uxtb	w16, w4
    7dac:      	cmp	w16, wzr
    7db0:      	b.ne	0x7ddc <_stogir.terminal.inputs+0x40>
    7db4:      	cmp	x1, #0x79
    7db8:      	b.eq	0x7ddc <_stogir.terminal.inputs+0x40>
    7dbc:      	mov	x1, #0x1                ; =1
    7dc0:      	adrp	x0, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		0000000000007dc0:  ARM64_RELOC_PAGE21	l_stogir.429
    7dc4:      	ldr	x0, [x0]
		0000000000007dc4:  ARM64_RELOC_PAGEOFF12	l_stogir.429
    7dc8:      	mov	x2, #0x25               ; =37
    7dcc:      	str	x1, [x8]
    7dd0:      	str	x0, [x8, #0x8]
    7dd4:      	str	x2, [x8, #0x10]
    7dd8:      	ret
    7ddc:      	sxtw	x3, w3
    7de0:      	uxtb	w16, w4
    7de4:      	cmp	w16, wzr
    7de8:      	b.eq	0x7df4 <_stogir.terminal.inputs+0x58>
    7dec:      	cmp	x3, #0x0
    7df0:      	b.ne	0x7dbc <_stogir.terminal.inputs+0x20>
    7df4:      	sxtw	x2, w2
    7df8:      	cmp	x2, #0x0
    7dfc:      	cset	w1, gt
    7e00:      	movz	x16, #0x0, lsl #48
    7e04:      	sub	x4, x16, x2
    7e08:      	sub	x5, x4, #0x1
    7e0c:      	uxtb	w16, w1
    7e10:      	cmp	w16, wzr
    7e14:      	b.eq	0x7ee4 <_stogir.terminal.inputs+0x148>
    7e18:      	ldr	x4, [x0, #0x8]
    7e1c:      	cmp	x2, x4
    7e20:      	b.ge	0x7edc <_stogir.terminal.inputs+0x140>
    7e24:      	add	x4, x0, #0x78
    7e28:      	ldr	x4, [x4, #0x8]
    7e2c:      	cmp	x2, x4
    7e30:      	b.ge	0x7f7c <_stogir.terminal.inputs+0x1e0>
    7e34:      	ldr	x4, [x0, #0x78]
    7e38:      	add	x4, x4, x2, lsl #2
    7e3c:      	ldr	w4, [x4]
    7e40:      	sxtw	x4, w4
    7e44:      	cmp	x4, #0x0
    7e48:      	cset	w4, ge
    7e4c:      	ubfx	x4, x4, #0, #8
    7e50:      	b	0x7f80 <_stogir.terminal.inputs+0x1e4>
    7e54:      	movz	w4, #0x0, lsl #16
    7e58:      	movz	x1, #0x0, lsl #48
    7e5c:      	ubfx	x4, x4, #0, #32
    7e60:      	lsr	x16, x4, #0
    7e64:      	cmp	x16, #0x1
    7e68:      	b.eq	0x7e84 <_stogir.terminal.inputs+0xe8>
    7e6c:      	b.lo	0x7e74 <_stogir.terminal.inputs+0xd8>
    7e70:      	b	0x7e88 <_stogir.terminal.inputs+0xec>
    7e74:      	cmp	x16, #0x0
    7e78:      	b.eq	0x7e80 <_stogir.terminal.inputs+0xe4>
    7e7c:      	b	0x7e88 <_stogir.terminal.inputs+0xec>
    7e80:      	b	0x7e8c <_stogir.terminal.inputs+0xf0>
    7e84:      	b	0x7f2c <_stogir.terminal.inputs+0x190>
    7e88:      	b	0x80c8 <_stogir.terminal.inputs+0x32c>
    7e8c:      	mov	x1, #0x1                ; =1
    7e90:      	adrp	x0, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		0000000000007e90:  ARM64_RELOC_PAGE21	l_stogir.430
    7e94:      	ldr	x0, [x0]
		0000000000007e94:  ARM64_RELOC_PAGEOFF12	l_stogir.430
    7e98:      	mov	x2, #0x1d               ; =29
    7e9c:      	b	0x7dcc <_stogir.terminal.inputs+0x30>
    7ea0:      	ldr	x1, [x0, #0x28]
    7ea4:      	add	x1, x1, x5, lsl #4
    7ea8:      	ldr	x1, [x1]
    7eac:      	mov	w4, #0x1                ; =1
    7eb0:      	b	0x7e5c <_stogir.terminal.inputs+0xc0>
    7eb4:      	movz	x4, #0x0, lsl #48
    7eb8:      	cmp	x4, #0x0
    7ebc:      	b.eq	0x7e54 <_stogir.terminal.inputs+0xb8>
    7ec0:      	uxtb	w16, w1
    7ec4:      	cmp	w16, wzr
    7ec8:      	b.eq	0x7ea0 <_stogir.terminal.inputs+0x104>
    7ecc:      	ldr	x1, [x0]
    7ed0:      	add	x1, x1, x2, lsl #4
    7ed4:      	ldr	x1, [x1]
    7ed8:      	b	0x7eac <_stogir.terminal.inputs+0x110>
    7edc:      	movz	x4, #0x0, lsl #48
    7ee0:      	b	0x7eb8 <_stogir.terminal.inputs+0x11c>
    7ee4:      	cmp	x2, #0x0
    7ee8:      	b.ge	0x7eb4 <_stogir.terminal.inputs+0x118>
    7eec:      	add	x6, x0, #0x28
    7ef0:      	add	x7, x0, #0x50
    7ef4:      	ldr	x6, [x6, #0x8]
    7ef8:      	ldr	x7, [x7, #0x8]
    7efc:      	cmp	x6, x7
    7f00:      	b.ne	0x7f74 <_stogir.terminal.inputs+0x1d8>
    7f04:      	cmp	x4, x6
    7f08:      	b.gt	0x7f84 <_stogir.terminal.inputs+0x1e8>
    7f0c:      	ldr	x4, [x0, #0x50]
    7f10:      	add	x4, x4, x5, lsl #2
    7f14:      	ldr	w4, [x4]
    7f18:      	sxtw	x4, w4
    7f1c:      	cmp	x4, #0x0
    7f20:      	cset	w4, gt
    7f24:      	ubfx	x4, x4, #0, #8
    7f28:      	b	0x7f88 <_stogir.terminal.inputs+0x1ec>
    7f2c:      	cmp	x2, #0x0
    7f30:      	b.le	0x7f60 <_stogir.terminal.inputs+0x1c4>
    7f34:      	uxtb	w1, w1
    7f38:      	cmp	x1, #0x83
    7f3c:      	cset	w2, lt
    7f40:      	uxtb	w16, w2
    7f44:      	cmp	w16, wzr
    7f48:      	b.eq	0x7f8c <_stogir.terminal.inputs+0x1f0>
    7f4c:      	adrp	x17, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		0000000000007f4c:  ARM64_RELOC_PAGE21	l_stogir.431
    7f50:      	ldr	x17, [x17]
		0000000000007f50:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    7f54:      	add	x4, x1, x17
    7f58:      	ldrb	w4, [x4]
    7f5c:      	b	0x7f90 <_stogir.terminal.inputs+0x1f4>
    7f60:      	mov	x1, #0x1                ; =1
    7f64:      	adrp	x0, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		0000000000007f64:  ARM64_RELOC_PAGE21	l_stogir.432
    7f68:      	ldr	x0, [x0]
		0000000000007f68:  ARM64_RELOC_PAGEOFF12	l_stogir.432
    7f6c:      	mov	x2, #0x2c               ; =44
    7f70:      	b	0x7e9c <_stogir.terminal.inputs+0x100>
    7f74:      	movz	x4, #0x0, lsl #48
    7f78:      	b	0x7eb8 <_stogir.terminal.inputs+0x11c>
    7f7c:      	movz	x4, #0x0, lsl #48
    7f80:      	b	0x7ee0 <_stogir.terminal.inputs+0x144>
    7f84:      	movz	x4, #0x0, lsl #48
    7f88:      	b	0x7f78 <_stogir.terminal.inputs+0x1dc>
    7f8c:      	movz	w4, #0x0, lsl #16
    7f90:      	uxtb	w16, w4
    7f94:      	and	w4, w16, #0x1
    7f98:      	uxtb	w4, w4
    7f9c:      	ubfx	x4, x4, #0, #8
    7fa0:      	cmp	x4, #0x0
    7fa4:      	b.eq	0x7f60 <_stogir.terminal.inputs+0x1c4>
    7fa8:      	uxtb	w16, w2
    7fac:      	cmp	w16, wzr
    7fb0:      	b.eq	0x7fc8 <_stogir.terminal.inputs+0x22c>
    7fb4:      	adrp	x17, 0x7000 <_stogir.vector.memory-inputs+0x3c>
		0000000000007fb4:  ARM64_RELOC_PAGE21	l_stogir.431
    7fb8:      	ldr	x17, [x17]
		0000000000007fb8:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    7fbc:      	add	x1, x1, x17
    7fc0:      	ldrb	w1, [x1]
    7fc4:      	b	0x7fcc <_stogir.terminal.inputs+0x230>
    7fc8:      	movz	w1, #0x0, lsl #16
    7fcc:      	uxtb	w16, w1
    7fd0:      	and	w1, w16, #0x4
    7fd4:      	uxtb	w1, w1
    7fd8:      	ubfx	x1, x1, #0, #8
    7fdc:      	cmp	x1, #0x0
    7fe0:      	cset	w1, eq
    7fe4:      	uxtb	w16, w1
    7fe8:      	cmp	w16, wzr
    7fec:      	cset	x1, eq
    7ff0:      	cmp	x1, #0x0
    7ff4:      	b.ne	0x7f60 <_stogir.terminal.inputs+0x1c4>
    7ff8:      	cmp	x3, #0x0
    7ffc:      	b.ne	0x8010 <_stogir.terminal.inputs+0x274>
    8000:      	movz	x1, #0x0, lsl #48
    8004:      	movz	x0, #0x0, lsl #48
    8008:      	movz	x2, #0x0, lsl #48
    800c:      	b	0x7f70 <_stogir.terminal.inputs+0x1d4>
    8010:      	cmp	x3, #0x0
    8014:      	cset	w1, gt
    8018:      	movz	x16, #0x0, lsl #48
    801c:      	sub	x2, x16, x3
    8020:      	sub	x4, x2, #0x1
    8024:      	uxtb	w16, w1
    8028:      	cmp	w16, wzr
    802c:      	b.eq	0x8080 <_stogir.terminal.inputs+0x2e4>
    8030:      	ldr	x2, [x0, #0x8]
    8034:      	cmp	x3, x2
    8038:      	b.ge	0x80d0 <_stogir.terminal.inputs+0x334>
    803c:      	add	x2, x0, #0x78
    8040:      	ldr	x2, [x2, #0x8]
    8044:      	cmp	x3, x2
    8048:      	b.ge	0x8190 <_stogir.terminal.inputs+0x3f4>
    804c:      	ldr	x2, [x0, #0x78]
    8050:      	add	x2, x2, x3, lsl #2
    8054:      	ldr	w2, [x2]
    8058:      	sxtw	x2, w2
    805c:      	cmp	x2, #0x0
    8060:      	cset	w2, ge
    8064:      	ubfx	x2, x2, #0, #8
    8068:      	b	0x8194 <_stogir.terminal.inputs+0x3f8>
    806c:      	mov	x1, #0x1                ; =1
    8070:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008070:  ARM64_RELOC_PAGE21	l_stogir.433
    8074:      	ldr	x0, [x0]
		0000000000008074:  ARM64_RELOC_PAGEOFF12	l_stogir.433
    8078:      	mov	x2, #0x2e               ; =46
    807c:      	b	0x800c <_stogir.terminal.inputs+0x270>
    8080:      	cmp	x3, #0x0
    8084:      	b.ge	0x80d8 <_stogir.terminal.inputs+0x33c>
    8088:      	add	x5, x0, #0x28
    808c:      	add	x6, x0, #0x50
    8090:      	ldr	x5, [x5, #0x8]
    8094:      	ldr	x6, [x6, #0x8]
    8098:      	cmp	x5, x6
    809c:      	b.ne	0x8188 <_stogir.terminal.inputs+0x3ec>
    80a0:      	cmp	x2, x5
    80a4:      	b.gt	0x8198 <_stogir.terminal.inputs+0x3fc>
    80a8:      	ldr	x2, [x0, #0x50]
    80ac:      	add	x2, x2, x4, lsl #2
    80b0:      	ldr	w2, [x2]
    80b4:      	sxtw	x2, w2
    80b8:      	cmp	x2, #0x0
    80bc:      	cset	w2, gt
    80c0:      	ubfx	x2, x2, #0, #8
    80c4:      	b	0x819c <_stogir.terminal.inputs+0x400>
    80c8:      	brk	#0
    80cc:      	b	0x80c8 <_stogir.terminal.inputs+0x32c>
    80d0:      	movz	x2, #0x0, lsl #48
    80d4:      	b	0x80dc <_stogir.terminal.inputs+0x340>
    80d8:      	movz	x2, #0x0, lsl #48
    80dc:      	cmp	x2, #0x0
    80e0:      	b.eq	0x8114 <_stogir.terminal.inputs+0x378>
    80e4:      	uxtb	w16, w1
    80e8:      	cmp	w16, wzr
    80ec:      	b.eq	0x8100 <_stogir.terminal.inputs+0x364>
    80f0:      	ldr	x0, [x0]
    80f4:      	add	x0, x0, x3, lsl #4
    80f8:      	ldr	x0, [x0]
    80fc:      	b	0x810c <_stogir.terminal.inputs+0x370>
    8100:      	ldr	x0, [x0, #0x28]
    8104:      	add	x0, x0, x4, lsl #4
    8108:      	ldr	x0, [x0]
    810c:      	mov	w1, #0x1                ; =1
    8110:      	b	0x811c <_stogir.terminal.inputs+0x380>
    8114:      	movz	w1, #0x0, lsl #16
    8118:      	movz	x0, #0x0, lsl #48
    811c:      	ubfx	x1, x1, #0, #32
    8120:      	lsr	x16, x1, #0
    8124:      	cmp	x16, #0x1
    8128:      	b.eq	0x8144 <_stogir.terminal.inputs+0x3a8>
    812c:      	b.lo	0x8134 <_stogir.terminal.inputs+0x398>
    8130:      	b	0x8148 <_stogir.terminal.inputs+0x3ac>
    8134:      	cmp	x16, #0x0
    8138:      	b.eq	0x8140 <_stogir.terminal.inputs+0x3a4>
    813c:      	b	0x8148 <_stogir.terminal.inputs+0x3ac>
    8140:      	b	0x814c <_stogir.terminal.inputs+0x3b0>
    8144:      	b	0x8160 <_stogir.terminal.inputs+0x3c4>
    8148:      	b	0x81e0 <_stogir.terminal.inputs+0x444>
    814c:      	mov	x1, #0x1                ; =1
    8150:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008150:  ARM64_RELOC_PAGE21	l_stogir.434
    8154:      	ldr	x0, [x0]
		0000000000008154:  ARM64_RELOC_PAGEOFF12	l_stogir.434
    8158:      	mov	x2, #0x1d               ; =29
    815c:      	b	0x807c <_stogir.terminal.inputs+0x2e0>
    8160:      	cmp	x3, #0x0
    8164:      	b.le	0x806c <_stogir.terminal.inputs+0x2d0>
    8168:      	uxtb	w0, w0
    816c:      	cmp	x0, #0x83
    8170:      	b.ge	0x81a0 <_stogir.terminal.inputs+0x404>
    8174:      	adrp	x17, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008174:  ARM64_RELOC_PAGE21	l_stogir.431
    8178:      	ldr	x17, [x17]
		0000000000008178:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    817c:      	add	x0, x0, x17
    8180:      	ldrb	w0, [x0]
    8184:      	b	0x81a4 <_stogir.terminal.inputs+0x408>
    8188:      	movz	x2, #0x0, lsl #48
    818c:      	b	0x80dc <_stogir.terminal.inputs+0x340>
    8190:      	movz	x2, #0x0, lsl #48
    8194:      	b	0x80d4 <_stogir.terminal.inputs+0x338>
    8198:      	movz	x2, #0x0, lsl #48
    819c:      	b	0x818c <_stogir.terminal.inputs+0x3f0>
    81a0:      	movz	w0, #0x0, lsl #16
    81a4:      	uxtb	w16, w0
    81a8:      	and	w0, w16, #0x8
    81ac:      	uxtb	w0, w0
    81b0:      	ubfx	x0, x0, #0, #8
    81b4:      	cmp	x0, #0x0
    81b8:      	cset	w0, eq
    81bc:      	uxtb	w16, w0
    81c0:      	cmp	w16, wzr
    81c4:      	cset	x0, eq
    81c8:      	cmp	x0, #0x0
    81cc:      	b.eq	0x806c <_stogir.terminal.inputs+0x2d0>
    81d0:      	and	x0, x3, #0xffffffff
    81d4:      	movz	x1, #0x0, lsl #48
    81d8:      	movz	x2, #0x0, lsl #48
    81dc:      	b	0x807c <_stogir.terminal.inputs+0x2e0>
    81e0:      	brk	#0
    81e4:      	b	0x81e0 <_stogir.terminal.inputs+0x444>

00000000000081e8 <_stogir.switch.switch-inputs>:
    81e8:      	sxtw	x1, w1
    81ec:      	cmp	x1, #0x0
    81f0:      	cset	w3, gt
    81f4:      	movz	x16, #0x0, lsl #48
    81f8:      	sub	x4, x16, x1
    81fc:      	sub	x5, x4, #0x1
    8200:      	uxtb	w16, w3
    8204:      	cmp	w16, wzr
    8208:      	b.eq	0x8248 <_stogir.switch.switch-inputs+0x60>
    820c:      	ldr	x4, [x0, #0x8]
    8210:      	cmp	x1, x4
    8214:      	b.ge	0x82ac <_stogir.switch.switch-inputs+0xc4>
    8218:      	add	x4, x0, #0x78
    821c:      	ldr	x4, [x4, #0x8]
    8220:      	cmp	x1, x4
    8224:      	b.ge	0x837c <_stogir.switch.switch-inputs+0x194>
    8228:      	ldr	x4, [x0, #0x78]
    822c:      	add	x4, x4, x1, lsl #2
    8230:      	ldr	w4, [x4]
    8234:      	sxtw	x4, w4
    8238:      	cmp	x4, #0x0
    823c:      	cset	w4, ge
    8240:      	ubfx	x4, x4, #0, #8
    8244:      	b	0x8380 <_stogir.switch.switch-inputs+0x198>
    8248:      	cmp	x1, #0x0
    824c:      	b.ge	0x82b4 <_stogir.switch.switch-inputs+0xcc>
    8250:      	add	x6, x0, #0x28
    8254:      	add	x7, x0, #0x50
    8258:      	ldr	x6, [x6, #0x8]
    825c:      	ldr	x7, [x7, #0x8]
    8260:      	cmp	x6, x7
    8264:      	b.ne	0x8290 <_stogir.switch.switch-inputs+0xa8>
    8268:      	cmp	x4, x6
    826c:      	b.gt	0x8384 <_stogir.switch.switch-inputs+0x19c>
    8270:      	ldr	x4, [x0, #0x50]
    8274:      	add	x4, x4, x5, lsl #2
    8278:      	ldr	w4, [x4]
    827c:      	sxtw	x4, w4
    8280:      	cmp	x4, #0x0
    8284:      	cset	w4, gt
    8288:      	ubfx	x4, x4, #0, #8
    828c:      	b	0x8388 <_stogir.switch.switch-inputs+0x1a0>
    8290:      	movz	x4, #0x0, lsl #48
    8294:      	b	0x82b8 <_stogir.switch.switch-inputs+0xd0>
    8298:      	mov	x1, #0x1                ; =1
    829c:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x264>
		000000000000829c:  ARM64_RELOC_PAGE21	l_stogir.435
    82a0:      	ldr	x0, [x0]
		00000000000082a0:  ARM64_RELOC_PAGEOFF12	l_stogir.435
    82a4:      	mov	x2, #0x16               ; =22
    82a8:      	b	0x8338 <_stogir.switch.switch-inputs+0x150>
    82ac:      	movz	x4, #0x0, lsl #48
    82b0:      	b	0x82b8 <_stogir.switch.switch-inputs+0xd0>
    82b4:      	movz	x4, #0x0, lsl #48
    82b8:      	cmp	x4, #0x0
    82bc:      	b.eq	0x82f0 <_stogir.switch.switch-inputs+0x108>
    82c0:      	uxtb	w16, w3
    82c4:      	cmp	w16, wzr
    82c8:      	b.eq	0x82dc <_stogir.switch.switch-inputs+0xf4>
    82cc:      	ldr	x3, [x0]
    82d0:      	add	x3, x3, x1, lsl #4
    82d4:      	ldr	x3, [x3]
    82d8:      	b	0x82e8 <_stogir.switch.switch-inputs+0x100>
    82dc:      	ldr	x3, [x0, #0x28]
    82e0:      	add	x3, x3, x5, lsl #4
    82e4:      	ldr	x3, [x3]
    82e8:      	mov	w4, #0x1                ; =1
    82ec:      	b	0x82f8 <_stogir.switch.switch-inputs+0x110>
    82f0:      	movz	w4, #0x0, lsl #16
    82f4:      	movz	x3, #0x0, lsl #48
    82f8:      	ubfx	x4, x4, #0, #32
    82fc:      	lsr	x16, x4, #0
    8300:      	cmp	x16, #0x1
    8304:      	b.eq	0x8320 <_stogir.switch.switch-inputs+0x138>
    8308:      	b.lo	0x8310 <_stogir.switch.switch-inputs+0x128>
    830c:      	b	0x8324 <_stogir.switch.switch-inputs+0x13c>
    8310:      	cmp	x16, #0x0
    8314:      	b.eq	0x831c <_stogir.switch.switch-inputs+0x134>
    8318:      	b	0x8324 <_stogir.switch.switch-inputs+0x13c>
    831c:      	b	0x8328 <_stogir.switch.switch-inputs+0x140>
    8320:      	b	0x8348 <_stogir.switch.switch-inputs+0x160>
    8324:      	b	0x858c <_stogir.switch.switch-inputs+0x3a4>
    8328:      	mov	x1, #0x1                ; =1
    832c:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x264>
		000000000000832c:  ARM64_RELOC_PAGE21	l_stogir.436
    8330:      	ldr	x0, [x0]
		0000000000008330:  ARM64_RELOC_PAGEOFF12	l_stogir.436
    8334:      	mov	x2, #0x16               ; =22
    8338:      	str	x1, [x8]
    833c:      	str	x0, [x8, #0x8]
    8340:      	str	x2, [x8, #0x10]
    8344:      	ret
    8348:      	cmp	x1, #0x0
    834c:      	b.le	0x8298 <_stogir.switch.switch-inputs+0xb0>
    8350:      	uxtb	w3, w3
    8354:      	cmp	x3, #0x83
    8358:      	cset	w1, lt
    835c:      	uxtb	w16, w1
    8360:      	cmp	w16, wzr
    8364:      	b.eq	0x838c <_stogir.switch.switch-inputs+0x1a4>
    8368:      	adrp	x17, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008368:  ARM64_RELOC_PAGE21	l_stogir.437
    836c:      	ldr	x17, [x17]
		000000000000836c:  ARM64_RELOC_PAGEOFF12	l_stogir.437
    8370:      	add	x4, x3, x17
    8374:      	ldrb	w4, [x4]
    8378:      	b	0x8390 <_stogir.switch.switch-inputs+0x1a8>
    837c:      	movz	x4, #0x0, lsl #48
    8380:      	b	0x82b0 <_stogir.switch.switch-inputs+0xc8>
    8384:      	movz	x4, #0x0, lsl #48
    8388:      	b	0x8294 <_stogir.switch.switch-inputs+0xac>
    838c:      	movz	w4, #0x0, lsl #16
    8390:      	uxtb	w16, w4
    8394:      	and	w4, w16, #0x1
    8398:      	uxtb	w4, w4
    839c:      	ubfx	x4, x4, #0, #8
    83a0:      	cmp	x4, #0x0
    83a4:      	b.eq	0x8298 <_stogir.switch.switch-inputs+0xb0>
    83a8:      	uxtb	w16, w1
    83ac:      	cmp	w16, wzr
    83b0:      	b.eq	0x83c8 <_stogir.switch.switch-inputs+0x1e0>
    83b4:      	adrp	x17, 0x8000 <_stogir.terminal.inputs+0x264>
		00000000000083b4:  ARM64_RELOC_PAGE21	l_stogir.437
    83b8:      	ldr	x17, [x17]
		00000000000083b8:  ARM64_RELOC_PAGEOFF12	l_stogir.437
    83bc:      	add	x1, x3, x17
    83c0:      	ldrb	w1, [x1]
    83c4:      	b	0x83cc <_stogir.switch.switch-inputs+0x1e4>
    83c8:      	movz	w1, #0x0, lsl #16
    83cc:      	uxtb	w16, w1
    83d0:      	and	w1, w16, #0x4
    83d4:      	uxtb	w1, w1
    83d8:      	ubfx	x1, x1, #0, #8
    83dc:      	cmp	x1, #0x0
    83e0:      	cset	w1, eq
    83e4:      	uxtb	w16, w1
    83e8:      	cmp	w16, wzr
    83ec:      	cset	x1, eq
    83f0:      	cmp	x1, #0x0
    83f4:      	b.ne	0x8298 <_stogir.switch.switch-inputs+0xb0>
    83f8:      	sxtw	x2, w2
    83fc:      	cmp	x2, #0x0
    8400:      	cset	w1, gt
    8404:      	movz	x16, #0x0, lsl #48
    8408:      	sub	x3, x16, x2
    840c:      	sub	x4, x3, #0x1
    8410:      	uxtb	w16, w1
    8414:      	cmp	w16, wzr
    8418:      	b.eq	0x846c <_stogir.switch.switch-inputs+0x284>
    841c:      	ldr	x3, [x0, #0x8]
    8420:      	cmp	x2, x3
    8424:      	b.ge	0x84b4 <_stogir.switch.switch-inputs+0x2cc>
    8428:      	add	x3, x0, #0x78
    842c:      	ldr	x3, [x3, #0x8]
    8430:      	cmp	x2, x3
    8434:      	b.ge	0x8584 <_stogir.switch.switch-inputs+0x39c>
    8438:      	ldr	x3, [x0, #0x78]
    843c:      	add	x3, x3, x2, lsl #2
    8440:      	ldr	w3, [x3]
    8444:      	sxtw	x3, w3
    8448:      	cmp	x3, #0x0
    844c:      	cset	w3, ge
    8450:      	ubfx	x3, x3, #0, #8
    8454:      	b	0x8588 <_stogir.switch.switch-inputs+0x3a0>
    8458:      	mov	x1, #0x1                ; =1
    845c:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x264>
		000000000000845c:  ARM64_RELOC_PAGE21	l_stogir.438
    8460:      	ldr	x0, [x0]
		0000000000008460:  ARM64_RELOC_PAGEOFF12	l_stogir.438
    8464:      	mov	x2, #0x20               ; =32
    8468:      	b	0x82a8 <_stogir.switch.switch-inputs+0xc0>
    846c:      	cmp	x2, #0x0
    8470:      	b.ge	0x84bc <_stogir.switch.switch-inputs+0x2d4>
    8474:      	add	x5, x0, #0x28
    8478:      	add	x6, x0, #0x50
    847c:      	ldr	x5, [x5, #0x8]
    8480:      	ldr	x6, [x6, #0x8]
    8484:      	cmp	x5, x6
    8488:      	b.ne	0x857c <_stogir.switch.switch-inputs+0x394>
    848c:      	cmp	x3, x5
    8490:      	b.gt	0x8594 <_stogir.switch.switch-inputs+0x3ac>
    8494:      	ldr	x3, [x0, #0x50]
    8498:      	add	x3, x3, x4, lsl #2
    849c:      	ldr	w3, [x3]
    84a0:      	sxtw	x3, w3
    84a4:      	cmp	x3, #0x0
    84a8:      	cset	w3, gt
    84ac:      	ubfx	x3, x3, #0, #8
    84b0:      	b	0x8598 <_stogir.switch.switch-inputs+0x3b0>
    84b4:      	movz	x3, #0x0, lsl #48
    84b8:      	b	0x84c0 <_stogir.switch.switch-inputs+0x2d8>
    84bc:      	movz	x3, #0x0, lsl #48
    84c0:      	cmp	x3, #0x0
    84c4:      	b.eq	0x84f8 <_stogir.switch.switch-inputs+0x310>
    84c8:      	uxtb	w16, w1
    84cc:      	cmp	w16, wzr
    84d0:      	b.eq	0x84e4 <_stogir.switch.switch-inputs+0x2fc>
    84d4:      	ldr	x0, [x0]
    84d8:      	add	x0, x0, x2, lsl #4
    84dc:      	ldr	x0, [x0]
    84e0:      	b	0x84f0 <_stogir.switch.switch-inputs+0x308>
    84e4:      	ldr	x0, [x0, #0x28]
    84e8:      	add	x0, x0, x4, lsl #4
    84ec:      	ldr	x0, [x0]
    84f0:      	mov	w1, #0x1                ; =1
    84f4:      	b	0x8500 <_stogir.switch.switch-inputs+0x318>
    84f8:      	movz	w1, #0x0, lsl #16
    84fc:      	movz	x0, #0x0, lsl #48
    8500:      	ubfx	x1, x1, #0, #32
    8504:      	lsr	x16, x1, #0
    8508:      	cmp	x16, #0x1
    850c:      	b.eq	0x8528 <_stogir.switch.switch-inputs+0x340>
    8510:      	b.lo	0x8518 <_stogir.switch.switch-inputs+0x330>
    8514:      	b	0x852c <_stogir.switch.switch-inputs+0x344>
    8518:      	cmp	x16, #0x0
    851c:      	b.eq	0x8524 <_stogir.switch.switch-inputs+0x33c>
    8520:      	b	0x852c <_stogir.switch.switch-inputs+0x344>
    8524:      	b	0x8530 <_stogir.switch.switch-inputs+0x348>
    8528:      	b	0x8544 <_stogir.switch.switch-inputs+0x35c>
    852c:      	b	0x859c <_stogir.switch.switch-inputs+0x3b4>
    8530:      	mov	x1, #0x1                ; =1
    8534:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008534:  ARM64_RELOC_PAGE21	l_stogir.439
    8538:      	ldr	x0, [x0]
		0000000000008538:  ARM64_RELOC_PAGEOFF12	l_stogir.439
    853c:      	mov	x2, #0x17               ; =23
    8540:      	b	0x8468 <_stogir.switch.switch-inputs+0x280>
    8544:      	orr	w1, w0, wzr
    8548:      	ubfx	x1, x1, #0, #32
    854c:      	ubfx	x1, x1, #8, #8
    8550:      	cmp	x1, #0x1
    8554:      	b.lt	0x8458 <_stogir.switch.switch-inputs+0x270>
    8558:      	cmp	x1, #0xb
    855c:      	b.gt	0x8458 <_stogir.switch.switch-inputs+0x270>
    8560:      	uxtb	w0, w0
    8564:      	cmp	x0, #0x48
    8568:      	b.eq	0x8458 <_stogir.switch.switch-inputs+0x270>
    856c:      	and	x0, x1, #0xffffffff
    8570:      	movz	x1, #0x0, lsl #48
    8574:      	movz	x2, #0x0, lsl #48
    8578:      	b	0x8468 <_stogir.switch.switch-inputs+0x280>
    857c:      	movz	x3, #0x0, lsl #48
    8580:      	b	0x84c0 <_stogir.switch.switch-inputs+0x2d8>
    8584:      	movz	x3, #0x0, lsl #48
    8588:      	b	0x84b8 <_stogir.switch.switch-inputs+0x2d0>
    858c:      	brk	#0
    8590:      	b	0x858c <_stogir.switch.switch-inputs+0x3a4>
    8594:      	movz	x3, #0x0, lsl #48
    8598:      	b	0x8580 <_stogir.switch.switch-inputs+0x398>
    859c:      	brk	#0
    85a0:      	b	0x859c <_stogir.switch.switch-inputs+0x3b4>

00000000000085a4 <_stogir.switch.case-inputs>:
    85a4:      	sub	sp, sp, #0xb0
    85a8:      	str	x29, [sp]
    85ac:      	str	x30, [sp, #0x8]
    85b0:      	mov	x29, sp
    85b4:      	str	x19, [sp, #0x70]
    85b8:      	str	x20, [sp, #0x78]
    85bc:      	str	x21, [sp, #0x80]
    85c0:      	str	x22, [sp, #0x88]
    85c4:      	str	x23, [sp, #0x90]
    85c8:      	str	x24, [sp, #0x98]
    85cc:      	str	x25, [sp, #0xa0]
    85d0:      	str	x26, [sp, #0xa8]
    85d4:      	sxtw	x2, w2
    85d8:      	lsl	x5, x2, #2
    85dc:      	cmp	x2, #0x0
    85e0:      	cset	w6, gt
    85e4:      	movz	x16, #0x0, lsl #48
    85e8:      	sub	x7, x16, x2
    85ec:      	sub	x9, x7, #0x1
    85f0:      	uxtb	w16, w6
    85f4:      	cmp	w16, wzr
    85f8:      	b.eq	0x8638 <_stogir.switch.case-inputs+0x94>
    85fc:      	ldr	x7, [x0, #0x8]
    8600:      	cmp	x2, x7
    8604:      	b.ge	0x8688 <_stogir.switch.case-inputs+0xe4>
    8608:      	add	x7, x0, #0x78
    860c:      	ldr	x7, [x7, #0x8]
    8610:      	cmp	x2, x7
    8614:      	b.ge	0x8780 <_stogir.switch.case-inputs+0x1dc>
    8618:      	ldr	x7, [x0, #0x78]
    861c:      	add	x7, x5, x7
    8620:      	ldr	w7, [x7]
    8624:      	sxtw	x7, w7
    8628:      	cmp	x7, #0x0
    862c:      	cset	w7, ge
    8630:      	ubfx	x7, x7, #0, #8
    8634:      	b	0x8784 <_stogir.switch.case-inputs+0x1e0>
    8638:      	cmp	x2, #0x0
    863c:      	b.ge	0x8690 <_stogir.switch.case-inputs+0xec>
    8640:      	add	x10, x0, #0x28
    8644:      	add	x11, x0, #0x50
    8648:      	ldr	x10, [x10, #0x8]
    864c:      	ldr	x11, [x11, #0x8]
    8650:      	cmp	x10, x11
    8654:      	b.ne	0x8680 <_stogir.switch.case-inputs+0xdc>
    8658:      	cmp	x7, x10
    865c:      	b.gt	0x8848 <_stogir.switch.case-inputs+0x2a4>
    8660:      	ldr	x7, [x0, #0x50]
    8664:      	add	x7, x7, x9, lsl #2
    8668:      	ldr	w7, [x7]
    866c:      	sxtw	x7, w7
    8670:      	cmp	x7, #0x0
    8674:      	cset	w7, gt
    8678:      	ubfx	x7, x7, #0, #8
    867c:      	b	0x884c <_stogir.switch.case-inputs+0x2a8>
    8680:      	movz	x7, #0x0, lsl #48
    8684:      	b	0x8694 <_stogir.switch.case-inputs+0xf0>
    8688:      	movz	x7, #0x0, lsl #48
    868c:      	b	0x8694 <_stogir.switch.case-inputs+0xf0>
    8690:      	movz	x7, #0x0, lsl #48
    8694:      	cmp	x7, #0x0
    8698:      	b.eq	0x86d4 <_stogir.switch.case-inputs+0x130>
    869c:      	uxtb	w16, w6
    86a0:      	cmp	w16, wzr
    86a4:      	b.eq	0x86bc <_stogir.switch.case-inputs+0x118>
    86a8:      	ldr	x6, [x0]
    86ac:      	add	x6, x6, x2, lsl #4
    86b0:      	ldr	x7, [x6]
    86b4:      	ldr	x6, [x6, #0x8]
    86b8:      	b	0x86cc <_stogir.switch.case-inputs+0x128>
    86bc:      	ldr	x6, [x0, #0x28]
    86c0:      	add	x6, x6, x9, lsl #4
    86c4:      	ldr	x7, [x6]
    86c8:      	ldr	x6, [x6, #0x8]
    86cc:      	mov	w9, #0x1                ; =1
    86d0:      	b	0x86e0 <_stogir.switch.case-inputs+0x13c>
    86d4:      	movz	w9, #0x0, lsl #16
    86d8:      	movz	x7, #0x0, lsl #48
    86dc:      	movz	x6, #0x0, lsl #48
    86e0:      	ubfx	x9, x9, #0, #32
    86e4:      	lsr	x16, x9, #0
    86e8:      	cmp	x16, #0x1
    86ec:      	b.eq	0x8708 <_stogir.switch.case-inputs+0x164>
    86f0:      	b.lo	0x86f8 <_stogir.switch.case-inputs+0x154>
    86f4:      	b	0x870c <_stogir.switch.case-inputs+0x168>
    86f8:      	cmp	x16, #0x0
    86fc:      	b.eq	0x8704 <_stogir.switch.case-inputs+0x160>
    8700:      	b	0x870c <_stogir.switch.case-inputs+0x168>
    8704:      	b	0x8710 <_stogir.switch.case-inputs+0x16c>
    8708:      	b	0x8760 <_stogir.switch.case-inputs+0x1bc>
    870c:      	b	0x8850 <_stogir.switch.case-inputs+0x2ac>
    8710:      	mov	x21, x8
    8714:      	mov	x1, #0x1                ; =1
    8718:      	adrp	x20, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008718:  ARM64_RELOC_PAGE21	l_stogir.440
    871c:      	ldr	x20, [x20]
		000000000000871c:  ARM64_RELOC_PAGEOFF12	l_stogir.440
    8720:      	mov	x0, #0x1a               ; =26
    8724:      	str	x1, [x21]
    8728:      	str	x20, [x21, #0x8]
    872c:      	str	x0, [x21, #0x10]
    8730:      	ldr	x19, [sp, #0x70]
    8734:      	ldr	x20, [sp, #0x78]
    8738:      	ldr	x21, [sp, #0x80]
    873c:      	ldr	x22, [sp, #0x88]
    8740:      	ldr	x23, [sp, #0x90]
    8744:      	ldr	x24, [sp, #0x98]
    8748:      	ldr	x25, [sp, #0xa0]
    874c:      	ldr	x26, [sp, #0xa8]
    8750:      	ldr	x29, [sp]
    8754:      	ldr	x30, [sp, #0x8]
    8758:      	add	sp, sp, #0xb0
    875c:      	ret
    8760:      	cmp	x2, #0x0
    8764:      	b.gt	0x8788 <_stogir.switch.case-inputs+0x1e4>
    8768:      	mov	x21, x8
    876c:      	mov	x1, #0x1                ; =1
    8770:      	adrp	x20, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008770:  ARM64_RELOC_PAGE21	l_stogir.441
    8774:      	ldr	x20, [x20]
		0000000000008774:  ARM64_RELOC_PAGEOFF12	l_stogir.441
    8778:      	mov	x0, #0x1f               ; =31
    877c:      	b	0x8724 <_stogir.switch.case-inputs+0x180>
    8780:      	movz	x7, #0x0, lsl #48
    8784:      	b	0x868c <_stogir.switch.case-inputs+0xe8>
    8788:      	uxtb	w2, w7
    878c:      	cmp	x2, #0x75
    8790:      	b.ne	0x89a8 <_stogir.switch.case-inputs+0x404>
    8794:      	orr	w2, w7, wzr
    8798:      	ubfx	x2, x2, #0, #32
    879c:      	ubfx	x2, x2, #8, #8
    87a0:      	cmp	x2, #0x0
    87a4:      	b.ne	0x89b0 <_stogir.switch.case-inputs+0x40c>
    87a8:      	ldr	x2, [x0, #0x78]
    87ac:      	add	x2, x5, x2
    87b0:      	ldr	w2, [x2]
    87b4:      	sxtw	x2, w2
    87b8:      	cmp	x2, #0x2
    87bc:      	b.ne	0x89b8 <_stogir.switch.case-inputs+0x414>
    87c0:      	sxtw	x19, w1
    87c4:      	cmp	x19, #0x6d
    87c8:      	b.lt	0x89c0 <_stogir.switch.case-inputs+0x41c>
    87cc:      	cmp	x19, #0x6f
    87d0:      	b.gt	0x89c8 <_stogir.switch.case-inputs+0x424>
    87d4:      	add	x16, sp, #0x10
    87d8:      	orr	x20, x16, xzr
    87dc:      	lsr	x1, x7, #32
    87e0:      	mov	w2, w6
    87e4:      	mov	x21, x8
    87e8:      	add	x8, sp, #0x10
    87ec:      	mov	x22, x0
    87f0:      	mov	w23, w3
    87f4:      	mov	w24, w4
    87f8:      	bl	0x87f8 <_stogir.switch.case-inputs+0x254>
		00000000000087f8:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    87fc:      	add	x16, sp, #0x10
    8800:      	ldr	w0, [x16]
    8804:      	lsr	x16, x0, #0
    8808:      	cmp	x16, #0x1
    880c:      	b.eq	0x8828 <_stogir.switch.case-inputs+0x284>
    8810:      	b.lo	0x8818 <_stogir.switch.case-inputs+0x274>
    8814:      	b	0x882c <_stogir.switch.case-inputs+0x288>
    8818:      	cmp	x16, #0x0
    881c:      	b.eq	0x8824 <_stogir.switch.case-inputs+0x280>
    8820:      	b	0x882c <_stogir.switch.case-inputs+0x288>
    8824:      	b	0x8858 <_stogir.switch.case-inputs+0x2b4>
    8828:      	b	0x8830 <_stogir.switch.case-inputs+0x28c>
    882c:      	b	0x8990 <_stogir.switch.case-inputs+0x3ec>
    8830:      	add	x0, x20, #0x8
    8834:      	add	x16, sp, #0x10
    8838:      	ldr	x20, [x16, #0x8]
    883c:      	ldr	x0, [x0, #0x8]
    8840:      	mov	x1, #0x1                ; =1
    8844:      	b	0x877c <_stogir.switch.case-inputs+0x1d8>
    8848:      	movz	x7, #0x0, lsl #48
    884c:      	b	0x8684 <_stogir.switch.case-inputs+0xe0>
    8850:      	brk	#0
    8854:      	b	0x8850 <_stogir.switch.case-inputs+0x2ac>
    8858:      	add	x16, sp, #0x10
    885c:      	ldr	w25, [x16, #0x8]
    8860:      	sxtw	x0, w25
    8864:      	and	x20, x0, #0xffffffff
    8868:      	cmp	x19, #0x6f
    886c:      	b.ne	0x887c <_stogir.switch.case-inputs+0x2d8>
    8870:      	movz	x1, #0x0, lsl #48
    8874:      	movz	x0, #0x0, lsl #48
    8878:      	b	0x8844 <_stogir.switch.case-inputs+0x2a0>
    887c:      	add	x16, sp, #0x30
    8880:      	orr	x26, x16, xzr
    8884:      	add	x8, sp, #0x30
    8888:      	mov	x0, x22
    888c:      	mov	w1, w23
    8890:      	mov	w2, w25
    8894:      	bl	0x8894 <_stogir.switch.case-inputs+0x2f0>
		0000000000008894:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    8898:      	add	x16, sp, #0x30
    889c:      	ldr	w0, [x16]
    88a0:      	lsr	x16, x0, #0
    88a4:      	cmp	x16, #0x1
    88a8:      	b.eq	0x88c4 <_stogir.switch.case-inputs+0x320>
    88ac:      	b.lo	0x88b4 <_stogir.switch.case-inputs+0x310>
    88b0:      	b	0x88c8 <_stogir.switch.case-inputs+0x324>
    88b4:      	cmp	x16, #0x0
    88b8:      	b.eq	0x88c0 <_stogir.switch.case-inputs+0x31c>
    88bc:      	b	0x88c8 <_stogir.switch.case-inputs+0x324>
    88c0:      	b	0x88e4 <_stogir.switch.case-inputs+0x340>
    88c4:      	b	0x88cc <_stogir.switch.case-inputs+0x328>
    88c8:      	b	0x8998 <_stogir.switch.case-inputs+0x3f4>
    88cc:      	add	x0, x26, #0x8
    88d0:      	add	x16, sp, #0x30
    88d4:      	ldr	x20, [x16, #0x8]
    88d8:      	ldr	x0, [x0, #0x8]
    88dc:      	mov	x1, #0x1                ; =1
    88e0:      	b	0x8878 <_stogir.switch.case-inputs+0x2d4>
    88e4:      	add	x16, sp, #0x30
    88e8:      	ldr	x26, [x16, #0x8]
    88ec:      	cmp	x19, #0x6d
    88f0:      	b.eq	0x88f8 <_stogir.switch.case-inputs+0x354>
    88f4:      	orr	w23, w24, wzr
    88f8:      	add	x16, sp, #0x50
    88fc:      	orr	x19, x16, xzr
    8900:      	add	x8, sp, #0x50
    8904:      	mov	x0, x22
    8908:      	mov	w1, w23
    890c:      	mov	w2, w25
    8910:      	bl	0x8910 <_stogir.switch.case-inputs+0x36c>
		0000000000008910:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    8914:      	add	x16, sp, #0x50
    8918:      	ldr	w0, [x16]
    891c:      	lsr	x16, x0, #0
    8920:      	cmp	x16, #0x1
    8924:      	b.eq	0x8940 <_stogir.switch.case-inputs+0x39c>
    8928:      	b.lo	0x8930 <_stogir.switch.case-inputs+0x38c>
    892c:      	b	0x8944 <_stogir.switch.case-inputs+0x3a0>
    8930:      	cmp	x16, #0x0
    8934:      	b.eq	0x893c <_stogir.switch.case-inputs+0x398>
    8938:      	b	0x8944 <_stogir.switch.case-inputs+0x3a0>
    893c:      	b	0x896c <_stogir.switch.case-inputs+0x3c8>
    8940:      	b	0x8948 <_stogir.switch.case-inputs+0x3a4>
    8944:      	b	0x89a0 <_stogir.switch.case-inputs+0x3fc>
    8948:      	add	x0, x19, #0x8
    894c:      	add	x16, sp, #0x50
    8950:      	ldr	x20, [x16, #0x8]
    8954:      	ldr	x0, [x0, #0x8]
    8958:      	mov	x1, #0x1                ; =1
    895c:      	b	0x8968 <_stogir.switch.case-inputs+0x3c4>
    8960:      	movz	x1, #0x0, lsl #48
    8964:      	movz	x0, #0x0, lsl #48
    8968:      	b	0x88e0 <_stogir.switch.case-inputs+0x33c>
    896c:      	add	x16, sp, #0x50
    8970:      	ldr	x0, [x16, #0x8]
    8974:      	cmp	x26, x0
    8978:      	b.ls	0x8960 <_stogir.switch.case-inputs+0x3bc>
    897c:      	mov	x1, #0x1                ; =1
    8980:      	adrp	x20, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008980:  ARM64_RELOC_PAGE21	l_stogir.442
    8984:      	ldr	x20, [x20]
		0000000000008984:  ARM64_RELOC_PAGEOFF12	l_stogir.442
    8988:      	mov	x0, #0x1a               ; =26
    898c:      	b	0x8968 <_stogir.switch.case-inputs+0x3c4>
    8990:      	brk	#0
    8994:      	b	0x8990 <_stogir.switch.case-inputs+0x3ec>
    8998:      	brk	#0
    899c:      	b	0x8998 <_stogir.switch.case-inputs+0x3f4>
    89a0:      	brk	#0
    89a4:      	b	0x89a0 <_stogir.switch.case-inputs+0x3fc>
    89a8:      	mov	x21, x8
    89ac:      	b	0x876c <_stogir.switch.case-inputs+0x1c8>
    89b0:      	mov	x21, x8
    89b4:      	b	0x876c <_stogir.switch.case-inputs+0x1c8>
    89b8:      	mov	x21, x8
    89bc:      	b	0x876c <_stogir.switch.case-inputs+0x1c8>
    89c0:      	mov	x21, x8
    89c4:      	b	0x876c <_stogir.switch.case-inputs+0x1c8>
    89c8:      	mov	x21, x8
    89cc:      	b	0x876c <_stogir.switch.case-inputs+0x1c8>

00000000000089d0 <_stogir.stack.valid-frame-object-inputs?>:
    89d0:      	sub	sp, sp, #0x20
    89d4:      	str	x29, [sp]
    89d8:      	str	x30, [sp, #0x8]
    89dc:      	mov	x29, sp
    89e0:      	str	x19, [sp, #0x10]
    89e4:      	str	x20, [sp, #0x18]
    89e8:      	mov	x19, x0
    89ec:      	mov	w20, w2
    89f0:      	bl	0x89f0 <_stogir.stack.valid-frame-object-inputs?+0x20>
		00000000000089f0:  ARM64_RELOC_BRANCH26	_stogir.stack.entry-allocation?
    89f4:      	cmp	x0, #0x0
    89f8:      	b.eq	0x8a74 <_stogir.stack.valid-frame-object-inputs?+0xa4>
    89fc:      	sxtw	x20, w20
    8a00:      	cmp	x20, #0x0
    8a04:      	b.ge	0x8a94 <_stogir.stack.valid-frame-object-inputs?+0xc4>
    8a08:      	cmp	x20, #0x0
    8a0c:      	cset	w0, gt
    8a10:      	movz	x16, #0x0, lsl #48
    8a14:      	sub	x1, x16, x20
    8a18:      	mov	x2, sp
    8a1c:      	sub	x3, x1, #0x1
    8a20:      	mov	x4, sp
    8a24:      	sub	sp, sp, #0x10
    8a28:      	mov	x5, sp
    8a2c:      	uxtb	w16, w0
    8a30:      	cmp	w16, wzr
    8a34:      	b.eq	0x8a9c <_stogir.stack.valid-frame-object-inputs?+0xcc>
    8a38:      	ldr	x1, [x19, #0x8]
    8a3c:      	cmp	x20, x1
    8a40:      	b.ge	0x8af4 <_stogir.stack.valid-frame-object-inputs?+0x124>
    8a44:      	add	x1, x19, #0x78
    8a48:      	ldr	x1, [x1, #0x8]
    8a4c:      	cmp	x20, x1
    8a50:      	b.ge	0x8c48 <_stogir.stack.valid-frame-object-inputs?+0x278>
    8a54:      	ldr	x1, [x19, #0x78]
    8a58:      	add	x1, x1, x20, lsl #2
    8a5c:      	ldr	w1, [x1]
    8a60:      	sxtw	x1, w1
    8a64:      	cmp	x1, #0x0
    8a68:      	cset	w1, ge
    8a6c:      	ubfx	x1, x1, #0, #8
    8a70:      	b	0x8c4c <_stogir.stack.valid-frame-object-inputs?+0x27c>
    8a74:      	movz	x0, #0x0, lsl #48
    8a78:      	sub	sp, x29, #0x0
    8a7c:      	ldr	x19, [sp, #0x10]
    8a80:      	ldr	x20, [sp, #0x18]
    8a84:      	ldr	x29, [sp]
    8a88:      	ldr	x30, [sp, #0x8]
    8a8c:      	add	sp, sp, #0x20
    8a90:      	ret
    8a94:      	movz	x0, #0x0, lsl #48
    8a98:      	b	0x8a78 <_stogir.stack.valid-frame-object-inputs?+0xa8>
    8a9c:      	add	x6, x19, #0x28
    8aa0:      	add	x7, x19, #0x50
    8aa4:      	ldr	x6, [x6, #0x8]
    8aa8:      	ldr	x7, [x7, #0x8]
    8aac:      	cmp	x6, x7
    8ab0:      	b.ne	0x8afc <_stogir.stack.valid-frame-object-inputs?+0x12c>
    8ab4:      	cmp	x1, x6
    8ab8:      	b.gt	0x8aec <_stogir.stack.valid-frame-object-inputs?+0x11c>
    8abc:      	ldr	x1, [x19, #0x50]
    8ac0:      	add	x1, x1, x3, lsl #2
    8ac4:      	ldr	w1, [x1]
    8ac8:      	sxtw	x1, w1
    8acc:      	cmp	x1, #0x0
    8ad0:      	cset	w1, gt
    8ad4:      	ubfx	x1, x1, #0, #8
    8ad8:      	b	0x8af0 <_stogir.stack.valid-frame-object-inputs?+0x120>
    8adc:      	cmp	x0, #0x0
    8ae0:      	cset	w0, gt
    8ae4:      	ubfx	x0, x0, #0, #8
    8ae8:      	b	0x8a98 <_stogir.stack.valid-frame-object-inputs?+0xc8>
    8aec:      	movz	x1, #0x0, lsl #48
    8af0:      	b	0x8b00 <_stogir.stack.valid-frame-object-inputs?+0x130>
    8af4:      	movz	x1, #0x0, lsl #48
    8af8:      	b	0x8b00 <_stogir.stack.valid-frame-object-inputs?+0x130>
    8afc:      	movz	x1, #0x0, lsl #48
    8b00:      	cmp	x1, #0x0
    8b04:      	b.eq	0x8b40 <_stogir.stack.valid-frame-object-inputs?+0x170>
    8b08:      	uxtb	w16, w0
    8b0c:      	cmp	w16, wzr
    8b10:      	b.eq	0x8b28 <_stogir.stack.valid-frame-object-inputs?+0x158>
    8b14:      	ldr	x0, [x19]
    8b18:      	add	x0, x0, x20, lsl #4
    8b1c:      	ldr	x1, [x0]
    8b20:      	ldr	x0, [x0, #0x8]
    8b24:      	b	0x8b38 <_stogir.stack.valid-frame-object-inputs?+0x168>
    8b28:      	ldr	x0, [x19, #0x28]
    8b2c:      	add	x0, x0, x3, lsl #4
    8b30:      	ldr	x1, [x0]
    8b34:      	ldr	x0, [x0, #0x8]
    8b38:      	mov	w3, #0x1                ; =1
    8b3c:      	b	0x8b4c <_stogir.stack.valid-frame-object-inputs?+0x17c>
    8b40:      	movz	w3, #0x0, lsl #16
    8b44:      	movz	x1, #0x0, lsl #48
    8b48:      	movz	x0, #0x0, lsl #48
    8b4c:      	ubfx	x3, x3, #0, #32
    8b50:      	lsr	x16, x3, #0
    8b54:      	cmp	x16, #0x1
    8b58:      	b.eq	0x8b74 <_stogir.stack.valid-frame-object-inputs?+0x1a4>
    8b5c:      	b.lo	0x8b64 <_stogir.stack.valid-frame-object-inputs?+0x194>
    8b60:      	b	0x8b78 <_stogir.stack.valid-frame-object-inputs?+0x1a8>
    8b64:      	cmp	x16, #0x0
    8b68:      	b.eq	0x8b70 <_stogir.stack.valid-frame-object-inputs?+0x1a0>
    8b6c:      	b	0x8b78 <_stogir.stack.valid-frame-object-inputs?+0x1a8>
    8b70:      	b	0x8b7c <_stogir.stack.valid-frame-object-inputs?+0x1ac>
    8b74:      	b	0x8c24 <_stogir.stack.valid-frame-object-inputs?+0x254>
    8b78:      	b	0x8d60 <_stogir.stack.valid-frame-object-inputs?+0x390>
    8b7c:      	mov	w1, #0x1                ; =1
    8b80:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008b80:  ARM64_RELOC_PAGE21	l_stogir.443
    8b84:      	ldr	x0, [x0]
		0000000000008b84:  ARM64_RELOC_PAGEOFF12	l_stogir.443
    8b88:      	b	0x8be4 <_stogir.stack.valid-frame-object-inputs?+0x214>
    8b8c:      	mov	w1, #0x1                ; =1
    8b90:      	ldr	w3, [x5, #0x8]
    8b94:      	ldr	w6, [x5, #0xc]
    8b98:      	cmp	x20, #0x0
    8b9c:      	b.ge	0x8bd8 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8ba0:      	cmp	x0, #0x1
    8ba4:      	b.lt	0x8bd8 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8ba8:      	cmp	x0, #0xb
    8bac:      	cset	w7, le
    8bb0:      	uxtb	w16, w7
    8bb4:      	cmp	w16, wzr
    8bb8:      	b.eq	0x8bd8 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8bbc:      	ldr	w5, [x5]
    8bc0:      	uxtb	w8, w5
    8bc4:      	ubfx	x5, x5, #8, #8
    8bc8:      	cmp	x8, x5
    8bcc:      	b.eq	0x8cd0 <_stogir.stack.valid-frame-object-inputs?+0x300>
    8bd0:      	cmp	x8, #0x49
    8bd4:      	b.eq	0x8cd0 <_stogir.stack.valid-frame-object-inputs?+0x300>
    8bd8:      	mov	w1, #0x1                ; =1
    8bdc:      	adrp	x0, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008bdc:  ARM64_RELOC_PAGE21	l_stogir.444
    8be0:      	ldr	x0, [x0]
		0000000000008be0:  ARM64_RELOC_PAGEOFF12	l_stogir.444
    8be4:      	mov	sp, x4
    8be8:      	ubfx	x1, x1, #0, #32
    8bec:      	mov	sp, x2
    8bf0:      	lsr	x16, x1, #0
    8bf4:      	cmp	x16, #0x1
    8bf8:      	b.eq	0x8c14 <_stogir.stack.valid-frame-object-inputs?+0x244>
    8bfc:      	b.lo	0x8c04 <_stogir.stack.valid-frame-object-inputs?+0x234>
    8c00:      	b	0x8c18 <_stogir.stack.valid-frame-object-inputs?+0x248>
    8c04:      	cmp	x16, #0x0
    8c08:      	b.eq	0x8c10 <_stogir.stack.valid-frame-object-inputs?+0x240>
    8c0c:      	b	0x8c18 <_stogir.stack.valid-frame-object-inputs?+0x248>
    8c10:      	b	0x8adc <_stogir.stack.valid-frame-object-inputs?+0x10c>
    8c14:      	b	0x8c1c <_stogir.stack.valid-frame-object-inputs?+0x24c>
    8c18:      	b	0x8d68 <_stogir.stack.valid-frame-object-inputs?+0x398>
    8c1c:      	movz	x0, #0x0, lsl #48
    8c20:      	b	0x8ae8 <_stogir.stack.valid-frame-object-inputs?+0x118>
    8c24:      	orr	w3, w1, wzr
    8c28:      	str	x1, [x5]
    8c2c:      	ubfx	x3, x3, #0, #32
    8c30:      	str	x0, [x5, #0x8]
    8c34:      	ubfx	x0, x3, #8, #8
    8c38:      	cmp	x0, #0x0
    8c3c:      	b.ne	0x8c50 <_stogir.stack.valid-frame-object-inputs?+0x280>
    8c40:      	movz	w1, #0x0, lsl #16
    8c44:      	b	0x8b90 <_stogir.stack.valid-frame-object-inputs?+0x1c0>
    8c48:      	movz	x1, #0x0, lsl #48
    8c4c:      	b	0x8af8 <_stogir.stack.valid-frame-object-inputs?+0x128>
    8c50:      	cmp	x0, #0x1
    8c54:      	b.eq	0x8b8c <_stogir.stack.valid-frame-object-inputs?+0x1bc>
    8c58:      	cmp	x0, #0x2
    8c5c:      	b.eq	0x8b8c <_stogir.stack.valid-frame-object-inputs?+0x1bc>
    8c60:      	cmp	x0, #0x7
    8c64:      	b.eq	0x8b8c <_stogir.stack.valid-frame-object-inputs?+0x1bc>
    8c68:      	cmp	x0, #0x8
    8c6c:      	b.eq	0x8b8c <_stogir.stack.valid-frame-object-inputs?+0x1bc>
    8c70:      	cmp	x0, #0x3
    8c74:      	b.eq	0x8d58 <_stogir.stack.valid-frame-object-inputs?+0x388>
    8c78:      	cmp	x0, #0x9
    8c7c:      	b.eq	0x8d58 <_stogir.stack.valid-frame-object-inputs?+0x388>
    8c80:      	cmp	x0, #0x4
    8c84:      	b.eq	0x8d70 <_stogir.stack.valid-frame-object-inputs?+0x3a0>
    8c88:      	cmp	x0, #0xa
    8c8c:      	b.eq	0x8d70 <_stogir.stack.valid-frame-object-inputs?+0x3a0>
    8c90:      	cmp	x0, #0xd
    8c94:      	b.eq	0x8d70 <_stogir.stack.valid-frame-object-inputs?+0x3a0>
    8c98:      	cmp	x0, #0x5
    8c9c:      	b.eq	0x8d78 <_stogir.stack.valid-frame-object-inputs?+0x3a8>
    8ca0:      	cmp	x0, #0xb
    8ca4:      	b.eq	0x8d78 <_stogir.stack.valid-frame-object-inputs?+0x3a8>
    8ca8:      	cmp	x0, #0xc
    8cac:      	b.eq	0x8d78 <_stogir.stack.valid-frame-object-inputs?+0x3a8>
    8cb0:      	cmp	x0, #0x6
    8cb4:      	cset	w1, eq
    8cb8:      	uxtb	w16, w1
    8cbc:      	cmp	w16, wzr
    8cc0:      	mov	w16, #0x8               ; =8
    8cc4:      	movn	w17, #0x0, lsl #16
    8cc8:      	csel	w1, w16, w17, ne
    8ccc:      	b	0x8d7c <_stogir.stack.valid-frame-object-inputs?+0x3ac>
    8cd0:      	sxtw	x5, w1
    8cd4:      	cmp	x5, #0x0
    8cd8:      	b.le	0x8bd8 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8cdc:      	lsl	w1, w1, #3
    8ce0:      	ubfx	x3, x3, #0, #32
    8ce4:      	ubfx	x6, x6, #0, #32
    8ce8:      	lsl	x6, x6, #32
    8cec:      	orr	x3, x6, x3
    8cf0:      	cmp	x5, #0x8
    8cf4:      	b.ge	0x8d08 <_stogir.stack.valid-frame-object-inputs?+0x338>
    8cf8:      	sxtw	x5, w1
    8cfc:      	lsr	x5, x3, x5
    8d00:      	cmp	x5, #0x0
    8d04:      	b.ne	0x8bd8 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8d08:      	cmp	x0, #0x7
    8d0c:      	b.lt	0x8d38 <_stogir.stack.valid-frame-object-inputs?+0x368>
    8d10:      	uxtb	w16, w7
    8d14:      	cmp	w16, wzr
    8d18:      	b.eq	0x8d38 <_stogir.stack.valid-frame-object-inputs?+0x368>
    8d1c:      	sub	w0, w1, #0x1
    8d20:      	sxtw	x0, w0
    8d24:      	mov	x16, #0x1               ; =1
    8d28:      	lsl	x0, x16, x0
    8d2c:      	and	x0, x0, x3
    8d30:      	cmp	x0, #0x0
    8d34:      	b.ne	0x8bd8 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8d38:      	mov	x17, #-0x10             ; =-16
    8d3c:      	movk	x17, #0x7fff, lsl #48
    8d40:      	cmp	x3, x17
    8d44:      	b.hi	0x8bd8 <_stogir.stack.valid-frame-object-inputs?+0x208>
    8d48:      	add	x0, x3, #0xf
    8d4c:      	and	x0, x0, #0xfffffffffffffff0
    8d50:      	movz	w1, #0x0, lsl #16
    8d54:      	b	0x8be4 <_stogir.stack.valid-frame-object-inputs?+0x214>
    8d58:      	mov	w1, #0x2                ; =2
    8d5c:      	b	0x8b90 <_stogir.stack.valid-frame-object-inputs?+0x1c0>
    8d60:      	brk	#0
    8d64:      	b	0x8d60 <_stogir.stack.valid-frame-object-inputs?+0x390>
    8d68:      	brk	#0
    8d6c:      	b	0x8d68 <_stogir.stack.valid-frame-object-inputs?+0x398>
    8d70:      	mov	w1, #0x4                ; =4
    8d74:      	b	0x8d5c <_stogir.stack.valid-frame-object-inputs?+0x38c>
    8d78:      	mov	w1, #0x8                ; =8
    8d7c:      	b	0x8d74 <_stogir.stack.valid-frame-object-inputs?+0x3a4>

0000000000008d80 <_stogir.stack.validate-scope-inputs>:
    8d80:      	sxtw	x1, w1
    8d84:      	cmp	x1, #0x53
    8d88:      	cset	w5, eq
    8d8c:      	uxtb	w16, w5
    8d90:      	cmp	w16, wzr
    8d94:      	b.ne	0x8dc0 <_stogir.stack.validate-scope-inputs+0x40>
    8d98:      	cmp	x1, #0x54
    8d9c:      	b.eq	0x8dc0 <_stogir.stack.validate-scope-inputs+0x40>
    8da0:      	mov	x0, #0x1                ; =1
    8da4:      	adrp	x1, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008da4:  ARM64_RELOC_PAGE21	l_stogir.445
    8da8:      	ldr	x1, [x1]
		0000000000008da8:  ARM64_RELOC_PAGEOFF12	l_stogir.445
    8dac:      	mov	x2, #0x22               ; =34
    8db0:      	str	x0, [x8]
    8db4:      	str	x1, [x8, #0x8]
    8db8:      	str	x2, [x8, #0x10]
    8dbc:      	ret
    8dc0:      	uxtb	w16, w5
    8dc4:      	cmp	w16, wzr
    8dc8:      	mov	w16, #0x6               ; =6
    8dcc:      	movz	w17, #0x0, lsl #16
    8dd0:      	csel	w1, w16, w17, ne
    8dd4:      	sxtw	x2, w2
    8dd8:      	sxtw	x1, w1
    8ddc:      	cmp	x2, x1
    8de0:      	b.ne	0x8da0 <_stogir.stack.validate-scope-inputs+0x20>
    8de4:      	sxtw	x3, w3
    8de8:      	cmp	x3, #0x0
    8dec:      	cset	w1, gt
    8df0:      	movz	x16, #0x0, lsl #48
    8df4:      	sub	x2, x16, x3
    8df8:      	sub	x6, x2, #0x1
    8dfc:      	uxtb	w16, w1
    8e00:      	cmp	w16, wzr
    8e04:      	b.eq	0x8ed4 <_stogir.stack.validate-scope-inputs+0x154>
    8e08:      	ldr	x2, [x0, #0x8]
    8e0c:      	cmp	x3, x2
    8e10:      	b.ge	0x8ecc <_stogir.stack.validate-scope-inputs+0x14c>
    8e14:      	add	x2, x0, #0x78
    8e18:      	ldr	x2, [x2, #0x8]
    8e1c:      	cmp	x3, x2
    8e20:      	b.ge	0x8f6c <_stogir.stack.validate-scope-inputs+0x1ec>
    8e24:      	ldr	x2, [x0, #0x78]
    8e28:      	add	x2, x2, x3, lsl #2
    8e2c:      	ldr	w2, [x2]
    8e30:      	sxtw	x2, w2
    8e34:      	cmp	x2, #0x0
    8e38:      	cset	w2, ge
    8e3c:      	ubfx	x2, x2, #0, #8
    8e40:      	b	0x8f70 <_stogir.stack.validate-scope-inputs+0x1f0>
    8e44:      	movz	w2, #0x0, lsl #16
    8e48:      	movz	x1, #0x0, lsl #48
    8e4c:      	ubfx	x2, x2, #0, #32
    8e50:      	lsr	x16, x2, #0
    8e54:      	cmp	x16, #0x1
    8e58:      	b.eq	0x8e74 <_stogir.stack.validate-scope-inputs+0xf4>
    8e5c:      	b.lo	0x8e64 <_stogir.stack.validate-scope-inputs+0xe4>
    8e60:      	b	0x8e78 <_stogir.stack.validate-scope-inputs+0xf8>
    8e64:      	cmp	x16, #0x0
    8e68:      	b.eq	0x8e70 <_stogir.stack.validate-scope-inputs+0xf0>
    8e6c:      	b	0x8e78 <_stogir.stack.validate-scope-inputs+0xf8>
    8e70:      	b	0x8e7c <_stogir.stack.validate-scope-inputs+0xfc>
    8e74:      	b	0x8f1c <_stogir.stack.validate-scope-inputs+0x19c>
    8e78:      	b	0x913c <_stogir.stack.validate-scope-inputs+0x3bc>
    8e7c:      	mov	x0, #0x1                ; =1
    8e80:      	adrp	x1, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008e80:  ARM64_RELOC_PAGE21	l_stogir.446
    8e84:      	ldr	x1, [x1]
		0000000000008e84:  ARM64_RELOC_PAGEOFF12	l_stogir.446
    8e88:      	mov	x2, #0x1b               ; =27
    8e8c:      	b	0x8db0 <_stogir.stack.validate-scope-inputs+0x30>
    8e90:      	ldr	x1, [x0, #0x28]
    8e94:      	add	x1, x1, x6, lsl #4
    8e98:      	ldr	x1, [x1]
    8e9c:      	mov	w2, #0x1                ; =1
    8ea0:      	b	0x8e4c <_stogir.stack.validate-scope-inputs+0xcc>
    8ea4:      	movz	x2, #0x0, lsl #48
    8ea8:      	cmp	x2, #0x0
    8eac:      	b.eq	0x8e44 <_stogir.stack.validate-scope-inputs+0xc4>
    8eb0:      	uxtb	w16, w1
    8eb4:      	cmp	w16, wzr
    8eb8:      	b.eq	0x8e90 <_stogir.stack.validate-scope-inputs+0x110>
    8ebc:      	ldr	x1, [x0]
    8ec0:      	add	x1, x1, x3, lsl #4
    8ec4:      	ldr	x1, [x1]
    8ec8:      	b	0x8e9c <_stogir.stack.validate-scope-inputs+0x11c>
    8ecc:      	movz	x2, #0x0, lsl #48
    8ed0:      	b	0x8ea8 <_stogir.stack.validate-scope-inputs+0x128>
    8ed4:      	cmp	x3, #0x0
    8ed8:      	b.ge	0x8ea4 <_stogir.stack.validate-scope-inputs+0x124>
    8edc:      	add	x7, x0, #0x28
    8ee0:      	add	x9, x0, #0x50
    8ee4:      	ldr	x7, [x7, #0x8]
    8ee8:      	ldr	x9, [x9, #0x8]
    8eec:      	cmp	x7, x9
    8ef0:      	b.ne	0x8f64 <_stogir.stack.validate-scope-inputs+0x1e4>
    8ef4:      	cmp	x2, x7
    8ef8:      	b.gt	0x8f74 <_stogir.stack.validate-scope-inputs+0x1f4>
    8efc:      	ldr	x2, [x0, #0x50]
    8f00:      	add	x2, x2, x6, lsl #2
    8f04:      	ldr	w2, [x2]
    8f08:      	sxtw	x2, w2
    8f0c:      	cmp	x2, #0x0
    8f10:      	cset	w2, gt
    8f14:      	ubfx	x2, x2, #0, #8
    8f18:      	b	0x8f78 <_stogir.stack.validate-scope-inputs+0x1f8>
    8f1c:      	cmp	x3, #0x0
    8f20:      	b.le	0x8f50 <_stogir.stack.validate-scope-inputs+0x1d0>
    8f24:      	uxtb	w1, w1
    8f28:      	cmp	x1, #0x83
    8f2c:      	cset	w2, lt
    8f30:      	uxtb	w16, w2
    8f34:      	cmp	w16, wzr
    8f38:      	b.eq	0x8f7c <_stogir.stack.validate-scope-inputs+0x1fc>
    8f3c:      	adrp	x17, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008f3c:  ARM64_RELOC_PAGE21	l_stogir.447
    8f40:      	ldr	x17, [x17]
		0000000000008f40:  ARM64_RELOC_PAGEOFF12	l_stogir.447
    8f44:      	add	x3, x1, x17
    8f48:      	ldrb	w3, [x3]
    8f4c:      	b	0x8f80 <_stogir.stack.validate-scope-inputs+0x200>
    8f50:      	mov	x0, #0x1                ; =1
    8f54:      	adrp	x1, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008f54:  ARM64_RELOC_PAGE21	l_stogir.448
    8f58:      	ldr	x1, [x1]
		0000000000008f58:  ARM64_RELOC_PAGEOFF12	l_stogir.448
    8f5c:      	mov	x2, #0x1b               ; =27
    8f60:      	b	0x8e8c <_stogir.stack.validate-scope-inputs+0x10c>
    8f64:      	movz	x2, #0x0, lsl #48
    8f68:      	b	0x8ea8 <_stogir.stack.validate-scope-inputs+0x128>
    8f6c:      	movz	x2, #0x0, lsl #48
    8f70:      	b	0x8ed0 <_stogir.stack.validate-scope-inputs+0x150>
    8f74:      	movz	x2, #0x0, lsl #48
    8f78:      	b	0x8f68 <_stogir.stack.validate-scope-inputs+0x1e8>
    8f7c:      	movz	w3, #0x0, lsl #16
    8f80:      	uxtb	w16, w3
    8f84:      	and	w3, w16, #0x1
    8f88:      	uxtb	w3, w3
    8f8c:      	ubfx	x3, x3, #0, #8
    8f90:      	cmp	x3, #0x0
    8f94:      	b.eq	0x8f50 <_stogir.stack.validate-scope-inputs+0x1d0>
    8f98:      	uxtb	w16, w2
    8f9c:      	cmp	w16, wzr
    8fa0:      	b.eq	0x8fb8 <_stogir.stack.validate-scope-inputs+0x238>
    8fa4:      	adrp	x17, 0x8000 <_stogir.terminal.inputs+0x264>
		0000000000008fa4:  ARM64_RELOC_PAGE21	l_stogir.447
    8fa8:      	ldr	x17, [x17]
		0000000000008fa8:  ARM64_RELOC_PAGEOFF12	l_stogir.447
    8fac:      	add	x1, x1, x17
    8fb0:      	ldrb	w1, [x1]
    8fb4:      	b	0x8fbc <_stogir.stack.validate-scope-inputs+0x23c>
    8fb8:      	movz	w1, #0x0, lsl #16
    8fbc:      	uxtb	w16, w1
    8fc0:      	and	w1, w16, #0x4
    8fc4:      	uxtb	w1, w1
    8fc8:      	ubfx	x1, x1, #0, #8
    8fcc:      	cmp	x1, #0x0
    8fd0:      	cset	w1, eq
    8fd4:      	uxtb	w16, w1
    8fd8:      	cmp	w16, wzr
    8fdc:      	cset	x1, eq
    8fe0:      	cmp	x1, #0x0
    8fe4:      	b.ne	0x8f50 <_stogir.stack.validate-scope-inputs+0x1d0>
    8fe8:      	uxtb	w16, w5
    8fec:      	cmp	w16, wzr
    8ff0:      	b.eq	0x9004 <_stogir.stack.validate-scope-inputs+0x284>
    8ff4:      	movz	x0, #0x0, lsl #48
    8ff8:      	mov	x1, #0x8                ; =8
    8ffc:      	movz	x2, #0x0, lsl #48
    9000:      	b	0x8f60 <_stogir.stack.validate-scope-inputs+0x1e0>
    9004:      	sxtw	x4, w4
    9008:      	cmp	x4, #0x0
    900c:      	cset	w1, gt
    9010:      	movz	x16, #0x0, lsl #48
    9014:      	sub	x2, x16, x4
    9018:      	sub	x3, x2, #0x1
    901c:      	uxtb	w16, w1
    9020:      	cmp	w16, wzr
    9024:      	b.eq	0x90f4 <_stogir.stack.validate-scope-inputs+0x374>
    9028:      	ldr	x2, [x0, #0x8]
    902c:      	cmp	x4, x2
    9030:      	b.ge	0x90ec <_stogir.stack.validate-scope-inputs+0x36c>
    9034:      	add	x2, x0, #0x78
    9038:      	ldr	x2, [x2, #0x8]
    903c:      	cmp	x4, x2
    9040:      	b.ge	0x9190 <_stogir.stack.validate-scope-inputs+0x410>
    9044:      	ldr	x2, [x0, #0x78]
    9048:      	add	x2, x2, x4, lsl #2
    904c:      	ldr	w2, [x2]
    9050:      	sxtw	x2, w2
    9054:      	cmp	x2, #0x0
    9058:      	cset	w2, ge
    905c:      	ubfx	x2, x2, #0, #8
    9060:      	b	0x9194 <_stogir.stack.validate-scope-inputs+0x414>
    9064:      	movz	w1, #0x0, lsl #16
    9068:      	movz	x0, #0x0, lsl #48
    906c:      	ubfx	x1, x1, #0, #32
    9070:      	lsr	x16, x1, #0
    9074:      	cmp	x16, #0x1
    9078:      	b.eq	0x9094 <_stogir.stack.validate-scope-inputs+0x314>
    907c:      	b.lo	0x9084 <_stogir.stack.validate-scope-inputs+0x304>
    9080:      	b	0x9098 <_stogir.stack.validate-scope-inputs+0x318>
    9084:      	cmp	x16, #0x0
    9088:      	b.eq	0x9090 <_stogir.stack.validate-scope-inputs+0x310>
    908c:      	b	0x9098 <_stogir.stack.validate-scope-inputs+0x318>
    9090:      	b	0x909c <_stogir.stack.validate-scope-inputs+0x31c>
    9094:      	b	0x9144 <_stogir.stack.validate-scope-inputs+0x3c4>
    9098:      	b	0x91a0 <_stogir.stack.validate-scope-inputs+0x420>
    909c:      	mov	x0, #0x1                ; =1
    90a0:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		00000000000090a0:  ARM64_RELOC_PAGE21	l_stogir.449
    90a4:      	ldr	x1, [x1]
		00000000000090a4:  ARM64_RELOC_PAGEOFF12	l_stogir.449
    90a8:      	mov	x2, #0x1b               ; =27
    90ac:      	b	0x9000 <_stogir.stack.validate-scope-inputs+0x280>
    90b0:      	ldr	x0, [x0, #0x28]
    90b4:      	add	x0, x0, x3, lsl #4
    90b8:      	ldr	x0, [x0]
    90bc:      	mov	w1, #0x1                ; =1
    90c0:      	b	0x906c <_stogir.stack.validate-scope-inputs+0x2ec>
    90c4:      	movz	x2, #0x0, lsl #48
    90c8:      	cmp	x2, #0x0
    90cc:      	b.eq	0x9064 <_stogir.stack.validate-scope-inputs+0x2e4>
    90d0:      	uxtb	w16, w1
    90d4:      	cmp	w16, wzr
    90d8:      	b.eq	0x90b0 <_stogir.stack.validate-scope-inputs+0x330>
    90dc:      	ldr	x0, [x0]
    90e0:      	add	x0, x0, x4, lsl #4
    90e4:      	ldr	x0, [x0]
    90e8:      	b	0x90bc <_stogir.stack.validate-scope-inputs+0x33c>
    90ec:      	movz	x2, #0x0, lsl #48
    90f0:      	b	0x90c8 <_stogir.stack.validate-scope-inputs+0x348>
    90f4:      	cmp	x4, #0x0
    90f8:      	b.ge	0x90c4 <_stogir.stack.validate-scope-inputs+0x344>
    90fc:      	add	x5, x0, #0x28
    9100:      	add	x6, x0, #0x50
    9104:      	ldr	x5, [x5, #0x8]
    9108:      	ldr	x6, [x6, #0x8]
    910c:      	cmp	x5, x6
    9110:      	b.ne	0x9188 <_stogir.stack.validate-scope-inputs+0x408>
    9114:      	cmp	x2, x5
    9118:      	b.gt	0x9198 <_stogir.stack.validate-scope-inputs+0x418>
    911c:      	ldr	x2, [x0, #0x50]
    9120:      	add	x2, x2, x3, lsl #2
    9124:      	ldr	w2, [x2]
    9128:      	sxtw	x2, w2
    912c:      	cmp	x2, #0x0
    9130:      	cset	w2, gt
    9134:      	ubfx	x2, x2, #0, #8
    9138:      	b	0x919c <_stogir.stack.validate-scope-inputs+0x41c>
    913c:      	brk	#0
    9140:      	b	0x913c <_stogir.stack.validate-scope-inputs+0x3bc>
    9144:      	orr	w1, w0, wzr
    9148:      	ubfx	x1, x1, #0, #32
    914c:      	ubfx	x1, x1, #8, #8
    9150:      	cmp	x1, #0x6
    9154:      	b.ne	0x9174 <_stogir.stack.validate-scope-inputs+0x3f4>
    9158:      	uxtb	w0, w0
    915c:      	cmp	x0, #0x48
    9160:      	b.eq	0x9174 <_stogir.stack.validate-scope-inputs+0x3f4>
    9164:      	movz	x0, #0x0, lsl #48
    9168:      	mov	x1, #0x8                ; =8
    916c:      	movz	x2, #0x0, lsl #48
    9170:      	b	0x9184 <_stogir.stack.validate-scope-inputs+0x404>
    9174:      	mov	x0, #0x1                ; =1
    9178:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009178:  ARM64_RELOC_PAGE21	l_stogir.450
    917c:      	ldr	x1, [x1]
		000000000000917c:  ARM64_RELOC_PAGEOFF12	l_stogir.450
    9180:      	mov	x2, #0x29               ; =41
    9184:      	b	0x90ac <_stogir.stack.validate-scope-inputs+0x32c>
    9188:      	movz	x2, #0x0, lsl #48
    918c:      	b	0x90c8 <_stogir.stack.validate-scope-inputs+0x348>
    9190:      	movz	x2, #0x0, lsl #48
    9194:      	b	0x90f0 <_stogir.stack.validate-scope-inputs+0x370>
    9198:      	movz	x2, #0x0, lsl #48
    919c:      	b	0x918c <_stogir.stack.validate-scope-inputs+0x40c>
    91a0:      	brk	#0
    91a4:      	b	0x91a0 <_stogir.stack.validate-scope-inputs+0x420>

00000000000091a8 <_stogir.stack.validate-inputs>:
    91a8:      	sub	sp, sp, #0x110
    91ac:      	str	x29, [sp]
    91b0:      	str	x30, [sp, #0x8]
    91b4:      	mov	x29, sp
    91b8:      	str	x19, [sp, #0xb8]
    91bc:      	str	x20, [sp, #0xc0]
    91c0:      	str	x21, [sp, #0xc8]
    91c4:      	str	x22, [sp, #0xd0]
    91c8:      	str	x23, [sp, #0xd8]
    91cc:      	str	x24, [sp, #0xe0]
    91d0:      	str	x25, [sp, #0xe8]
    91d4:      	str	x26, [sp, #0xf0]
    91d8:      	str	x27, [sp, #0xf8]
    91dc:      	str	x28, [sp, #0x100]
    91e0:      	sxtw	x1, w1
    91e4:      	cmp	x1, #0x51
    91e8:      	cset	w19, eq
    91ec:      	uxtb	w16, w19
    91f0:      	cmp	w16, wzr
    91f4:      	b.ne	0x925c <_stogir.stack.validate-inputs+0xb4>
    91f8:      	cmp	x1, #0x52
    91fc:      	b.eq	0x925c <_stogir.stack.validate-inputs+0xb4>
    9200:      	str	x8, [sp, #0x90]
    9204:      	mov	x2, #0x1                ; =1
    9208:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009208:  ARM64_RELOC_PAGE21	l_stogir.451
    920c:      	ldr	x1, [x1]
		000000000000920c:  ARM64_RELOC_PAGEOFF12	l_stogir.451
    9210:      	mov	x0, #0x29               ; =41
    9214:      	ldr	x3, [sp, #0x90]
    9218:      	str	x2, [x3]
    921c:      	str	x1, [x3, #0x8]
    9220:      	str	x0, [x3, #0x10]
    9224:      	ldr	x19, [sp, #0xb8]
    9228:      	ldr	x20, [sp, #0xc0]
    922c:      	ldr	x21, [sp, #0xc8]
    9230:      	ldr	x22, [sp, #0xd0]
    9234:      	ldr	x23, [sp, #0xd8]
    9238:      	ldr	x24, [sp, #0xe0]
    923c:      	ldr	x25, [sp, #0xe8]
    9240:      	ldr	x26, [sp, #0xf0]
    9244:      	ldr	x27, [sp, #0xf8]
    9248:      	ldr	x28, [sp, #0x100]
    924c:      	ldr	x29, [sp]
    9250:      	ldr	x30, [sp, #0x8]
    9254:      	add	sp, sp, #0x110
    9258:      	ret
    925c:      	uxtb	w16, w19
    9260:      	cmp	w16, wzr
    9264:      	mov	w16, #0x6               ; =6
    9268:      	movz	w17, #0x0, lsl #16
    926c:      	csel	w1, w16, w17, ne
    9270:      	sxtw	x2, w2
    9274:      	sxtw	x1, w1
    9278:      	cmp	x2, x1
    927c:      	b.ne	0x97a0 <_stogir.stack.validate-inputs+0x5f8>
    9280:      	sxtw	x20, w5
    9284:      	uxtb	w16, w19
    9288:      	cmp	w16, wzr
    928c:      	b.eq	0x92b0 <_stogir.stack.validate-inputs+0x108>
    9290:      	cmp	x20, #0x0
    9294:      	b.eq	0x92b0 <_stogir.stack.validate-inputs+0x108>
    9298:      	cmp	x20, #0x0
    929c:      	b.le	0x9344 <_stogir.stack.validate-inputs+0x19c>
    92a0:      	sub	x1, x20, #0x1
    92a4:      	and	x1, x1, x20
    92a8:      	cmp	x1, #0x0
    92ac:      	b.ne	0x9344 <_stogir.stack.validate-inputs+0x19c>
    92b0:      	mov	w1, w3
    92b4:      	mov	x21, x8
    92b8:      	add	x8, sp, #0x10
    92bc:      	mov	x22, x0
    92c0:      	mov	w23, w3
    92c4:      	mov	w24, w4
    92c8:      	bl	0x92c8 <_stogir.stack.validate-inputs+0x120>
		00000000000092c8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    92cc:      	add	x16, sp, #0x10
    92d0:      	ldr	w0, [x16]
    92d4:      	lsr	x16, x0, #0
    92d8:      	cmp	x16, #0x1
    92dc:      	b.eq	0x92f8 <_stogir.stack.validate-inputs+0x150>
    92e0:      	b.lo	0x92e8 <_stogir.stack.validate-inputs+0x140>
    92e4:      	b	0x92fc <_stogir.stack.validate-inputs+0x154>
    92e8:      	cmp	x16, #0x0
    92ec:      	b.eq	0x92f4 <_stogir.stack.validate-inputs+0x14c>
    92f0:      	b	0x92fc <_stogir.stack.validate-inputs+0x154>
    92f4:      	b	0x9300 <_stogir.stack.validate-inputs+0x158>
    92f8:      	b	0x9318 <_stogir.stack.validate-inputs+0x170>
    92fc:      	b	0x95bc <_stogir.stack.validate-inputs+0x414>
    9300:      	str	x21, [sp, #0x90]
    9304:      	mov	x2, #0x1                ; =1
    9308:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009308:  ARM64_RELOC_PAGE21	l_stogir.452
    930c:      	ldr	x1, [x1]
		000000000000930c:  ARM64_RELOC_PAGEOFF12	l_stogir.452
    9310:      	mov	x0, #0x1f               ; =31
    9314:      	b	0x9214 <_stogir.stack.validate-inputs+0x6c>
    9318:      	sxtw	x23, w23
    931c:      	add	x16, sp, #0x10
    9320:      	ldr	x0, [x16, #0x8]
    9324:      	cmp	x23, #0x0
    9328:      	b.gt	0x934c <_stogir.stack.validate-inputs+0x1a4>
    932c:      	str	x21, [sp, #0x90]
    9330:      	mov	x2, #0x1                ; =1
    9334:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009334:  ARM64_RELOC_PAGE21	l_stogir.453
    9338:      	ldr	x1, [x1]
		0000000000009338:  ARM64_RELOC_PAGEOFF12	l_stogir.453
    933c:      	mov	x0, #0x1f               ; =31
    9340:      	b	0x9314 <_stogir.stack.validate-inputs+0x16c>
    9344:      	str	x8, [sp, #0x90]
    9348:      	b	0x9204 <_stogir.stack.validate-inputs+0x5c>
    934c:      	uxtb	w0, w0
    9350:      	cmp	x0, #0x83
    9354:      	cset	w1, lt
    9358:      	uxtb	w16, w1
    935c:      	cmp	w16, wzr
    9360:      	b.eq	0x9378 <_stogir.stack.validate-inputs+0x1d0>
    9364:      	adrp	x17, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009364:  ARM64_RELOC_PAGE21	l_stogir.454
    9368:      	ldr	x17, [x17]
		0000000000009368:  ARM64_RELOC_PAGEOFF12	l_stogir.454
    936c:      	add	x2, x0, x17
    9370:      	ldrb	w2, [x2]
    9374:      	b	0x937c <_stogir.stack.validate-inputs+0x1d4>
    9378:      	movz	w2, #0x0, lsl #16
    937c:      	uxtb	w16, w2
    9380:      	and	w2, w16, #0x1
    9384:      	uxtb	w2, w2
    9388:      	ubfx	x2, x2, #0, #8
    938c:      	cmp	x2, #0x0
    9390:      	b.eq	0x97a8 <_stogir.stack.validate-inputs+0x600>
    9394:      	uxtb	w16, w1
    9398:      	cmp	w16, wzr
    939c:      	b.eq	0x93b4 <_stogir.stack.validate-inputs+0x20c>
    93a0:      	adrp	x17, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		00000000000093a0:  ARM64_RELOC_PAGE21	l_stogir.454
    93a4:      	ldr	x17, [x17]
		00000000000093a4:  ARM64_RELOC_PAGEOFF12	l_stogir.454
    93a8:      	add	x0, x0, x17
    93ac:      	ldrb	w0, [x0]
    93b0:      	b	0x93b8 <_stogir.stack.validate-inputs+0x210>
    93b4:      	movz	w0, #0x0, lsl #16
    93b8:      	uxtb	w16, w0
    93bc:      	and	w0, w16, #0x4
    93c0:      	uxtb	w0, w0
    93c4:      	ubfx	x0, x0, #0, #8
    93c8:      	cmp	x0, #0x0
    93cc:      	cset	w0, eq
    93d0:      	uxtb	w16, w0
    93d4:      	cmp	w16, wzr
    93d8:      	cset	x0, eq
    93dc:      	cmp	x0, #0x0
    93e0:      	b.ne	0x97b0 <_stogir.stack.validate-inputs+0x608>
    93e4:      	add	x8, sp, #0x40
    93e8:      	mov	x0, x22
    93ec:      	mov	w1, w24
    93f0:      	bl	0x93f0 <_stogir.stack.validate-inputs+0x248>
		00000000000093f0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    93f4:      	add	x16, sp, #0x40
    93f8:      	ldr	w0, [x16]
    93fc:      	lsr	x16, x0, #0
    9400:      	cmp	x16, #0x1
    9404:      	b.eq	0x9420 <_stogir.stack.validate-inputs+0x278>
    9408:      	b.lo	0x9410 <_stogir.stack.validate-inputs+0x268>
    940c:      	b	0x9424 <_stogir.stack.validate-inputs+0x27c>
    9410:      	cmp	x16, #0x0
    9414:      	b.eq	0x941c <_stogir.stack.validate-inputs+0x274>
    9418:      	b	0x9424 <_stogir.stack.validate-inputs+0x27c>
    941c:      	b	0x9428 <_stogir.stack.validate-inputs+0x280>
    9420:      	b	0x9440 <_stogir.stack.validate-inputs+0x298>
    9424:      	b	0x96a8 <_stogir.stack.validate-inputs+0x500>
    9428:      	str	x21, [sp, #0x90]
    942c:      	mov	x2, #0x1                ; =1
    9430:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009430:  ARM64_RELOC_PAGE21	l_stogir.455
    9434:      	ldr	x1, [x1]
		0000000000009434:  ARM64_RELOC_PAGEOFF12	l_stogir.455
    9438:      	mov	x0, #0x18               ; =24
    943c:      	b	0x9340 <_stogir.stack.validate-inputs+0x198>
    9440:      	add	x16, sp, #0x40
    9444:      	ldr	x0, [x16, #0x8]
    9448:      	orr	w1, w0, wzr
    944c:      	ubfx	x1, x1, #0, #32
    9450:      	ubfx	x1, x1, #8, #8
    9454:      	cmp	x1, #0x1
    9458:      	b.lt	0x97b8 <_stogir.stack.validate-inputs+0x610>
    945c:      	cmp	x1, #0xb
    9460:      	b.gt	0x97c0 <_stogir.stack.validate-inputs+0x618>
    9464:      	uxtb	w0, w0
    9468:      	cmp	x0, #0x48
    946c:      	b.eq	0x97c8 <_stogir.stack.validate-inputs+0x620>
    9470:      	sxtw	x0, w24
    9474:      	cmp	x1, #0x0
    9478:      	cset	w23, eq
    947c:      	cmp	x1, #0x1
    9480:      	cset	w25, eq
    9484:      	cmp	x1, #0x2
    9488:      	cset	w26, eq
    948c:      	cmp	x1, #0x7
    9490:      	cset	w27, eq
    9494:      	cmp	x1, #0x8
    9498:      	cset	w28, eq
    949c:      	cmp	x1, #0x3
    94a0:      	cset	w2, eq
    94a4:      	cmp	x1, #0x9
    94a8:      	cset	w3, eq
    94ac:      	cmp	x1, #0x4
    94b0:      	cset	w4, eq
    94b4:      	cmp	x1, #0xa
    94b8:      	cset	w5, eq
    94bc:      	cmp	x1, #0xd
    94c0:      	cset	w6, eq
    94c4:      	cmp	x1, #0x5
    94c8:      	cset	w7, eq
    94cc:      	cmp	x1, #0xb
    94d0:      	cset	w8, eq
    94d4:      	cmp	x1, #0xc
    94d8:      	cset	w9, eq
    94dc:      	cmp	x1, #0x6
    94e0:      	cset	w1, eq
    94e4:      	uxtb	w16, w1
    94e8:      	cmp	w16, wzr
    94ec:      	mov	w16, #0x8               ; =8
    94f0:      	movn	w17, #0x0, lsl #16
    94f4:      	csel	w1, w16, w17, ne
    94f8:      	cmp	x0, #0x0
    94fc:      	b.ge	0x97d0 <_stogir.stack.validate-inputs+0x628>
    9500:      	uxtb	w16, w19
    9504:      	cmp	w16, wzr
    9508:      	b.eq	0x9514 <_stogir.stack.validate-inputs+0x36c>
    950c:      	cmp	x20, #0x10
    9510:      	b.gt	0x9518 <_stogir.stack.validate-inputs+0x370>
    9514:      	mov	x20, #0x10              ; =16
    9518:      	mov	x0, x22
    951c:      	mov	w19, w2
    9520:      	mov	x2, x20
    9524:      	mov	w20, w3
    9528:      	mov	w22, w4
    952c:      	str	w7, [sp, #0x98]
    9530:      	str	w8, [sp, #0xa0]
    9534:      	add	x8, sp, #0x70
    9538:      	str	w9, [sp, #0xa8]
    953c:      	str	w1, [sp, #0xb0]
    9540:      	mov	w1, w24
    9544:      	mov	w24, w5
    9548:      	str	x21, [sp, #0x90]
    954c:      	mov	w21, w6
    9550:      	bl	0x9550 <_stogir.stack.validate-inputs+0x3a8>
		0000000000009550:  ARM64_RELOC_BRANCH26	_stogir.stack.constant-size-aligned
    9554:      	add	x16, sp, #0x70
    9558:      	ldr	w0, [x16]
    955c:      	lsr	x16, x0, #0
    9560:      	cmp	x16, #0x1
    9564:      	b.eq	0x9580 <_stogir.stack.validate-inputs+0x3d8>
    9568:      	b.lo	0x9570 <_stogir.stack.validate-inputs+0x3c8>
    956c:      	b	0x9584 <_stogir.stack.validate-inputs+0x3dc>
    9570:      	cmp	x16, #0x0
    9574:      	b.eq	0x957c <_stogir.stack.validate-inputs+0x3d4>
    9578:      	b	0x9584 <_stogir.stack.validate-inputs+0x3dc>
    957c:      	b	0x96b0 <_stogir.stack.validate-inputs+0x508>
    9580:      	b	0x9588 <_stogir.stack.validate-inputs+0x3e0>
    9584:      	b	0x9784 <_stogir.stack.validate-inputs+0x5dc>
    9588:      	add	x16, sp, #0x70
    958c:      	orr	x0, x16, xzr
    9590:      	add	x0, x0, #0x8
    9594:      	add	x16, sp, #0x70
    9598:      	ldr	x1, [x16, #0x8]
    959c:      	ldr	x0, [x0, #0x8]
    95a0:      	mov	x2, #0x1                ; =1
    95a4:      	b	0x960c <_stogir.stack.validate-inputs+0x464>
    95a8:      	mov	x2, #0x1                ; =1
    95ac:      	adrp	x1, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		00000000000095ac:  ARM64_RELOC_PAGE21	l_stogir.456
    95b0:      	ldr	x1, [x1]
		00000000000095b0:  ARM64_RELOC_PAGEOFF12	l_stogir.456
    95b4:      	mov	x0, #0x29               ; =41
    95b8:      	b	0x943c <_stogir.stack.validate-inputs+0x294>
    95bc:      	brk	#0
    95c0:      	b	0x95bc <_stogir.stack.validate-inputs+0x414>
    95c4:      	mov	w3, #0x1                ; =1
    95c8:      	sxtw	x3, w3
    95cc:      	and	x1, x3, #0xffffffff
    95d0:      	movz	x2, #0x0, lsl #48
    95d4:      	movz	x0, #0x0, lsl #48
    95d8:      	b	0x95b8 <_stogir.stack.validate-inputs+0x410>
    95dc:      	uxtb	w16, w23
    95e0:      	cmp	w16, wzr
    95e4:      	b.eq	0x9610 <_stogir.stack.validate-inputs+0x468>
    95e8:      	movz	w3, #0x0, lsl #16
    95ec:      	b	0x95c8 <_stogir.stack.validate-inputs+0x420>
    95f0:      	mov	w16, #0x1               ; =1
    95f4:      	str	w16, [sp, #0xb0]
    95f8:      	ldr	w3, [sp, #0xb0]
    95fc:      	sxtw	x3, w3
    9600:      	and	x1, x3, #0xffffffff
    9604:      	movz	x2, #0x0, lsl #48
    9608:      	movz	x0, #0x0, lsl #48
    960c:      	b	0x95d8 <_stogir.stack.validate-inputs+0x430>
    9610:      	uxtb	w16, w25
    9614:      	cmp	w16, wzr
    9618:      	b.ne	0x95c4 <_stogir.stack.validate-inputs+0x41c>
    961c:      	uxtb	w16, w26
    9620:      	cmp	w16, wzr
    9624:      	b.ne	0x95c4 <_stogir.stack.validate-inputs+0x41c>
    9628:      	uxtb	w16, w27
    962c:      	cmp	w16, wzr
    9630:      	b.ne	0x95c4 <_stogir.stack.validate-inputs+0x41c>
    9634:      	uxtb	w16, w28
    9638:      	cmp	w16, wzr
    963c:      	b.ne	0x95c4 <_stogir.stack.validate-inputs+0x41c>
    9640:      	uxtb	w16, w19
    9644:      	cmp	w16, wzr
    9648:      	b.ne	0x9770 <_stogir.stack.validate-inputs+0x5c8>
    964c:      	uxtb	w16, w20
    9650:      	cmp	w16, wzr
    9654:      	b.ne	0x9770 <_stogir.stack.validate-inputs+0x5c8>
    9658:      	uxtb	w16, w22
    965c:      	cmp	w16, wzr
    9660:      	b.ne	0x978c <_stogir.stack.validate-inputs+0x5e4>
    9664:      	uxtb	w16, w24
    9668:      	cmp	w16, wzr
    966c:      	b.ne	0x978c <_stogir.stack.validate-inputs+0x5e4>
    9670:      	uxtb	w16, w21
    9674:      	cmp	w16, wzr
    9678:      	b.ne	0x978c <_stogir.stack.validate-inputs+0x5e4>
    967c:      	uxtb	w16, w0
    9680:      	cmp	w16, wzr
    9684:      	b.ne	0x96a0 <_stogir.stack.validate-inputs+0x4f8>
    9688:      	uxtb	w16, w1
    968c:      	cmp	w16, wzr
    9690:      	b.ne	0x96a0 <_stogir.stack.validate-inputs+0x4f8>
    9694:      	uxtb	w16, w2
    9698:      	cmp	w16, wzr
    969c:      	b.eq	0x96a4 <_stogir.stack.validate-inputs+0x4fc>
    96a0:      	mov	w3, #0x8                ; =8
    96a4:      	b	0x9790 <_stogir.stack.validate-inputs+0x5e8>
    96a8:      	brk	#0
    96ac:      	b	0x96a8 <_stogir.stack.validate-inputs+0x500>
    96b0:      	uxtb	w16, w23
    96b4:      	cmp	w16, wzr
    96b8:      	b.eq	0x96c8 <_stogir.stack.validate-inputs+0x520>
    96bc:      	movz	w16, #0x0, lsl #16
    96c0:      	str	w16, [sp, #0xb0]
    96c4:      	b	0x95f8 <_stogir.stack.validate-inputs+0x450>
    96c8:      	uxtb	w16, w25
    96cc:      	cmp	w16, wzr
    96d0:      	b.ne	0x95f0 <_stogir.stack.validate-inputs+0x448>
    96d4:      	uxtb	w16, w26
    96d8:      	cmp	w16, wzr
    96dc:      	b.ne	0x95f0 <_stogir.stack.validate-inputs+0x448>
    96e0:      	uxtb	w16, w27
    96e4:      	cmp	w16, wzr
    96e8:      	b.ne	0x95f0 <_stogir.stack.validate-inputs+0x448>
    96ec:      	uxtb	w16, w28
    96f0:      	cmp	w16, wzr
    96f4:      	b.ne	0x95f0 <_stogir.stack.validate-inputs+0x448>
    96f8:      	uxtb	w16, w19
    96fc:      	cmp	w16, wzr
    9700:      	b.ne	0x9778 <_stogir.stack.validate-inputs+0x5d0>
    9704:      	uxtb	w16, w20
    9708:      	cmp	w16, wzr
    970c:      	b.ne	0x9778 <_stogir.stack.validate-inputs+0x5d0>
    9710:      	uxtb	w16, w22
    9714:      	cmp	w16, wzr
    9718:      	b.ne	0x9794 <_stogir.stack.validate-inputs+0x5ec>
    971c:      	uxtb	w16, w24
    9720:      	cmp	w16, wzr
    9724:      	b.ne	0x9794 <_stogir.stack.validate-inputs+0x5ec>
    9728:      	uxtb	w16, w21
    972c:      	cmp	w16, wzr
    9730:      	b.ne	0x9794 <_stogir.stack.validate-inputs+0x5ec>
    9734:      	ldr	w0, [sp, #0x98]
    9738:      	uxtb	w16, w0
    973c:      	cmp	w16, wzr
    9740:      	b.ne	0x9764 <_stogir.stack.validate-inputs+0x5bc>
    9744:      	ldr	w1, [sp, #0xa0]
    9748:      	uxtb	w16, w1
    974c:      	cmp	w16, wzr
    9750:      	b.ne	0x9764 <_stogir.stack.validate-inputs+0x5bc>
    9754:      	ldr	w2, [sp, #0xa8]
    9758:      	uxtb	w16, w2
    975c:      	cmp	w16, wzr
    9760:      	b.eq	0x976c <_stogir.stack.validate-inputs+0x5c4>
    9764:      	mov	w16, #0x8               ; =8
    9768:      	str	w16, [sp, #0xb0]
    976c:      	b	0x979c <_stogir.stack.validate-inputs+0x5f4>
    9770:      	mov	w3, #0x2                ; =2
    9774:      	b	0x95c8 <_stogir.stack.validate-inputs+0x420>
    9778:      	mov	w16, #0x2               ; =2
    977c:      	str	w16, [sp, #0xb0]
    9780:      	b	0x95f8 <_stogir.stack.validate-inputs+0x450>
    9784:      	brk	#0
    9788:      	b	0x9784 <_stogir.stack.validate-inputs+0x5dc>
    978c:      	mov	w3, #0x4                ; =4
    9790:      	b	0x9774 <_stogir.stack.validate-inputs+0x5cc>
    9794:      	mov	w16, #0x4               ; =4
    9798:      	str	w16, [sp, #0xb0]
    979c:      	b	0x9780 <_stogir.stack.validate-inputs+0x5d8>
    97a0:      	str	x8, [sp, #0x90]
    97a4:      	b	0x9204 <_stogir.stack.validate-inputs+0x5c>
    97a8:      	str	x21, [sp, #0x90]
    97ac:      	b	0x9330 <_stogir.stack.validate-inputs+0x188>
    97b0:      	str	x21, [sp, #0x90]
    97b4:      	b	0x9330 <_stogir.stack.validate-inputs+0x188>
    97b8:      	str	x21, [sp, #0x90]
    97bc:      	b	0x95a8 <_stogir.stack.validate-inputs+0x400>
    97c0:      	str	x21, [sp, #0x90]
    97c4:      	b	0x95a8 <_stogir.stack.validate-inputs+0x400>
    97c8:      	str	x21, [sp, #0x90]
    97cc:      	b	0x95a8 <_stogir.stack.validate-inputs+0x400>
    97d0:      	str	x21, [sp, #0x90]
    97d4:      	mov	w19, w2
    97d8:      	mov	w20, w3
    97dc:      	mov	w3, w1
    97e0:      	mov	w22, w4
    97e4:      	mov	w24, w5
    97e8:      	mov	w21, w6
    97ec:      	mov	w0, w7
    97f0:      	mov	w1, w8
    97f4:      	mov	w2, w9
    97f8:      	b	0x95dc <_stogir.stack.validate-inputs+0x434>

00000000000097fc <_stogir.locals.shape>:
    97fc:      	sub	sp, sp, #0x50
    9800:      	str	x29, [sp]
    9804:      	str	x30, [sp, #0x8]
    9808:      	mov	x29, sp
    980c:      	str	x19, [sp, #0x20]
    9810:      	str	x20, [sp, #0x28]
    9814:      	str	x21, [sp, #0x30]
    9818:      	str	x22, [sp, #0x38]
    981c:      	str	x23, [sp, #0x40]
    9820:      	sxtw	x19, w1
    9824:      	lsl	x20, x19, #2
    9828:      	cmp	x19, #0x0
    982c:      	cset	w1, gt
    9830:      	movz	x16, #0x0, lsl #48
    9834:      	sub	x3, x16, x19
    9838:      	sub	x4, x3, #0x1
    983c:      	uxtb	w16, w1
    9840:      	cmp	w16, wzr
    9844:      	b.eq	0x9884 <_stogir.locals.shape+0x88>
    9848:      	ldr	x3, [x0, #0x8]
    984c:      	cmp	x19, x3
    9850:      	b.ge	0x98e8 <_stogir.locals.shape+0xec>
    9854:      	add	x3, x0, #0x78
    9858:      	ldr	x3, [x3, #0x8]
    985c:      	cmp	x19, x3
    9860:      	b.ge	0x9a78 <_stogir.locals.shape+0x27c>
    9864:      	ldr	x3, [x0, #0x78]
    9868:      	add	x3, x20, x3
    986c:      	ldr	w3, [x3]
    9870:      	sxtw	x3, w3
    9874:      	cmp	x3, #0x0
    9878:      	cset	w3, ge
    987c:      	ubfx	x3, x3, #0, #8
    9880:      	b	0x9a7c <_stogir.locals.shape+0x280>
    9884:      	cmp	x19, #0x0
    9888:      	b.ge	0x98f0 <_stogir.locals.shape+0xf4>
    988c:      	add	x5, x0, #0x28
    9890:      	add	x6, x0, #0x50
    9894:      	ldr	x5, [x5, #0x8]
    9898:      	ldr	x6, [x6, #0x8]
    989c:      	cmp	x5, x6
    98a0:      	b.ne	0x98cc <_stogir.locals.shape+0xd0>
    98a4:      	cmp	x3, x5
    98a8:      	b.gt	0x9b7c <_stogir.locals.shape+0x380>
    98ac:      	ldr	x3, [x0, #0x50]
    98b0:      	add	x3, x3, x4, lsl #2
    98b4:      	ldr	w3, [x3]
    98b8:      	sxtw	x3, w3
    98bc:      	cmp	x3, #0x0
    98c0:      	cset	w3, gt
    98c4:      	ubfx	x3, x3, #0, #8
    98c8:      	b	0x9b80 <_stogir.locals.shape+0x384>
    98cc:      	movz	x3, #0x0, lsl #48
    98d0:      	b	0x98f4 <_stogir.locals.shape+0xf8>
    98d4:      	mov	x1, #0x1                ; =1
    98d8:      	adrp	x0, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		00000000000098d8:  ARM64_RELOC_PAGE21	l_stogir.457
    98dc:      	ldr	x0, [x0]
		00000000000098dc:  ARM64_RELOC_PAGEOFF12	l_stogir.457
    98e0:      	mov	x21, #0x1c              ; =28
    98e4:      	b	0x9984 <_stogir.locals.shape+0x188>
    98e8:      	movz	x3, #0x0, lsl #48
    98ec:      	b	0x98f4 <_stogir.locals.shape+0xf8>
    98f0:      	movz	x3, #0x0, lsl #48
    98f4:      	cmp	x3, #0x0
    98f8:      	b.eq	0x9934 <_stogir.locals.shape+0x138>
    98fc:      	uxtb	w16, w1
    9900:      	cmp	w16, wzr
    9904:      	b.eq	0x991c <_stogir.locals.shape+0x120>
    9908:      	ldr	x1, [x0]
    990c:      	add	x1, x1, x19, lsl #4
    9910:      	ldr	x3, [x1]
    9914:      	ldr	x1, [x1, #0x8]
    9918:      	b	0x992c <_stogir.locals.shape+0x130>
    991c:      	ldr	x1, [x0, #0x28]
    9920:      	add	x1, x1, x4, lsl #4
    9924:      	ldr	x3, [x1]
    9928:      	ldr	x1, [x1, #0x8]
    992c:      	mov	w4, #0x1                ; =1
    9930:      	b	0x9940 <_stogir.locals.shape+0x144>
    9934:      	movz	w4, #0x0, lsl #16
    9938:      	movz	x3, #0x0, lsl #48
    993c:      	movz	x1, #0x0, lsl #48
    9940:      	ubfx	x4, x4, #0, #32
    9944:      	lsr	x16, x4, #0
    9948:      	cmp	x16, #0x1
    994c:      	b.eq	0x9968 <_stogir.locals.shape+0x16c>
    9950:      	b.lo	0x9958 <_stogir.locals.shape+0x15c>
    9954:      	b	0x996c <_stogir.locals.shape+0x170>
    9958:      	cmp	x16, #0x0
    995c:      	b.eq	0x9964 <_stogir.locals.shape+0x168>
    9960:      	b	0x996c <_stogir.locals.shape+0x170>
    9964:      	b	0x9970 <_stogir.locals.shape+0x174>
    9968:      	b	0x99b4 <_stogir.locals.shape+0x1b8>
    996c:      	b	0x9b8c <_stogir.locals.shape+0x390>
    9970:      	mov	x22, x8
    9974:      	mov	x1, #0x1                ; =1
    9978:      	adrp	x0, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009978:  ARM64_RELOC_PAGE21	l_stogir.458
    997c:      	ldr	x0, [x0]
		000000000000997c:  ARM64_RELOC_PAGEOFF12	l_stogir.458
    9980:      	mov	x21, #0x16              ; =22
    9984:      	str	x1, [x22]
    9988:      	str	x0, [x22, #0x8]
    998c:      	str	x21, [x22, #0x10]
    9990:      	ldr	x19, [sp, #0x20]
    9994:      	ldr	x20, [sp, #0x28]
    9998:      	ldr	x21, [sp, #0x30]
    999c:      	ldr	x22, [sp, #0x38]
    99a0:      	ldr	x23, [sp, #0x40]
    99a4:      	ldr	x29, [sp]
    99a8:      	ldr	x30, [sp, #0x8]
    99ac:      	add	sp, sp, #0x50
    99b0:      	ret
    99b4:      	asr	x21, x1, #32
    99b8:      	orr	w4, w3, wzr
    99bc:      	add	x16, sp, #0x10
    99c0:      	str	x3, [x16]
    99c4:      	ubfx	x4, x4, #0, #32
    99c8:      	add	x16, sp, #0x10
    99cc:      	str	x1, [x16, #0x8]
    99d0:      	ubfx	x1, x4, #8, #8
    99d4:      	mov	x22, x8
    99d8:      	mov	x23, x0
    99dc:      	mov	w0, w1
    99e0:      	mov	w1, w2
    99e4:      	bl	0x99e4 <_stogir.locals.shape+0x1e8>
		00000000000099e4:  ARM64_RELOC_BRANCH26	_stogir.types.size
    99e8:      	sxtw	x0, w0
    99ec:      	cmp	x21, #0x0
    99f0:      	b.ne	0x99f8 <_stogir.locals.shape+0x1fc>
    99f4:      	mov	x21, x0
    99f8:      	add	x16, sp, #0x10
    99fc:      	ldr	w1, [x16, #0x8]
    9a00:      	sxtw	x1, w1
    9a04:      	cmp	x1, #0x0
    9a08:      	cset	w2, eq
    9a0c:      	ubfx	x2, x2, #0, #8
    9a10:      	cmp	x1, #0x0
    9a14:      	b.le	0x9ab8 <_stogir.locals.shape+0x2bc>
    9a18:      	add	x3, x23, #0x110
    9a1c:      	add	x4, x3, #0x28
    9a20:      	ldr	x4, [x4, #0x8]
    9a24:      	cmp	x1, x4
    9a28:      	b.gt	0x9a80 <_stogir.locals.shape+0x284>
    9a2c:      	sub	x1, x1, #0x1
    9a30:      	mov	x17, #0x18              ; =24
    9a34:      	mul	x1, x1, x17
    9a38:      	ldr	x4, [x3, #0x28]
    9a3c:      	add	x1, x1, x4
    9a40:      	ldr	x4, [x1]
    9a44:      	ldr	x1, [x1, #0x8]
    9a48:      	ldr	x3, [x3, #0x8]
    9a4c:      	cmp	x4, #0x0
    9a50:      	b.lt	0x9b84 <_stogir.locals.shape+0x388>
    9a54:      	cmp	x4, x3
    9a58:      	b.gt	0x9b84 <_stogir.locals.shape+0x388>
    9a5c:      	cmp	x1, #0x0
    9a60:      	b.lt	0x9b84 <_stogir.locals.shape+0x388>
    9a64:      	sub	x3, x3, x4
    9a68:      	cmp	x1, x3
    9a6c:      	b.gt	0x9b84 <_stogir.locals.shape+0x388>
    9a70:      	mov	w1, #0x1                ; =1
    9a74:      	b	0x9b88 <_stogir.locals.shape+0x38c>
    9a78:      	movz	x3, #0x0, lsl #48
    9a7c:      	b	0x98ec <_stogir.locals.shape+0xf0>
    9a80:      	movz	w1, #0x0, lsl #16
    9a84:      	ubfx	x1, x1, #0, #32
    9a88:      	lsr	x16, x1, #0
    9a8c:      	cmp	x16, #0x1
    9a90:      	b.eq	0x9aac <_stogir.locals.shape+0x2b0>
    9a94:      	b.lo	0x9a9c <_stogir.locals.shape+0x2a0>
    9a98:      	b	0x9ab0 <_stogir.locals.shape+0x2b4>
    9a9c:      	cmp	x16, #0x0
    9aa0:      	b.eq	0x9aa8 <_stogir.locals.shape+0x2ac>
    9aa4:      	b	0x9ab0 <_stogir.locals.shape+0x2b4>
    9aa8:      	b	0x9ab8 <_stogir.locals.shape+0x2bc>
    9aac:      	b	0x9ab4 <_stogir.locals.shape+0x2b8>
    9ab0:      	b	0x9b94 <_stogir.locals.shape+0x398>
    9ab4:      	mov	x2, #0x1                ; =1
    9ab8:      	cmp	x19, #0x0
    9abc:      	b.le	0x98d4 <_stogir.locals.shape+0xd8>
    9ac0:      	add	x16, sp, #0x10
    9ac4:      	ldr	w1, [x16]
    9ac8:      	uxtb	w1, w1
    9acc:      	cmp	x1, #0x48
    9ad0:      	b.ne	0x98d4 <_stogir.locals.shape+0xd8>
    9ad4:      	ldr	x1, [x23, #0x78]
    9ad8:      	add	x1, x20, x1
    9adc:      	ldr	w1, [x1]
    9ae0:      	sxtw	x1, w1
    9ae4:      	cmp	x1, #0x3
    9ae8:      	b.ne	0x98d4 <_stogir.locals.shape+0xd8>
    9aec:      	cmp	x0, #0x0
    9af0:      	b.le	0x98d4 <_stogir.locals.shape+0xd8>
    9af4:      	cmp	x2, #0x0
    9af8:      	b.eq	0x98d4 <_stogir.locals.shape+0xd8>
    9afc:      	cmp	x21, #0x0
    9b00:      	b.le	0x98d4 <_stogir.locals.shape+0xd8>
    9b04:      	sub	x1, x21, #0x1
    9b08:      	and	x1, x1, x21
    9b0c:      	cmp	x1, #0x0
    9b10:      	b.ne	0x98d4 <_stogir.locals.shape+0xd8>
    9b14:      	add	x16, sp, #0x10
    9b18:      	ldr	w1, [x16, #0x4]
    9b1c:      	sxtw	x1, w1
    9b20:      	cmp	x1, #0x0
    9b24:      	cset	w2, gt
    9b28:      	movz	x16, #0x0, lsl #48
    9b2c:      	sub	x3, x16, x1
    9b30:      	sub	x4, x3, #0x1
    9b34:      	uxtb	w16, w2
    9b38:      	cmp	w16, wzr
    9b3c:      	b.eq	0x9bb0 <_stogir.locals.shape+0x3b4>
    9b40:      	ldr	x3, [x23, #0x8]
    9b44:      	cmp	x1, x3
    9b48:      	b.ge	0x9bf8 <_stogir.locals.shape+0x3fc>
    9b4c:      	add	x3, x23, #0x78
    9b50:      	ldr	x3, [x3, #0x8]
    9b54:      	cmp	x1, x3
    9b58:      	b.ge	0x9cc4 <_stogir.locals.shape+0x4c8>
    9b5c:      	ldr	x3, [x23, #0x78]
    9b60:      	add	x3, x3, x1, lsl #2
    9b64:      	ldr	w3, [x3]
    9b68:      	sxtw	x3, w3
    9b6c:      	cmp	x3, #0x0
    9b70:      	cset	w3, ge
    9b74:      	ubfx	x3, x3, #0, #8
    9b78:      	b	0x9cc8 <_stogir.locals.shape+0x4cc>
    9b7c:      	movz	x3, #0x0, lsl #48
    9b80:      	b	0x98d0 <_stogir.locals.shape+0xd4>
    9b84:      	movz	w1, #0x0, lsl #16
    9b88:      	b	0x9a84 <_stogir.locals.shape+0x288>
    9b8c:      	brk	#0
    9b90:      	b	0x9b8c <_stogir.locals.shape+0x390>
    9b94:      	brk	#0
    9b98:      	b	0x9b94 <_stogir.locals.shape+0x398>
    9b9c:      	mov	x1, #0x1                ; =1
    9ba0:      	adrp	x0, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009ba0:  ARM64_RELOC_PAGE21	l_stogir.459
    9ba4:      	ldr	x0, [x0]
		0000000000009ba4:  ARM64_RELOC_PAGEOFF12	l_stogir.459
    9ba8:      	mov	x21, #0x2c              ; =44
    9bac:      	b	0x98e4 <_stogir.locals.shape+0xe8>
    9bb0:      	cmp	x1, #0x0
    9bb4:      	b.ge	0x9c00 <_stogir.locals.shape+0x404>
    9bb8:      	add	x5, x23, #0x28
    9bbc:      	add	x6, x23, #0x50
    9bc0:      	ldr	x5, [x5, #0x8]
    9bc4:      	ldr	x6, [x6, #0x8]
    9bc8:      	cmp	x5, x6
    9bcc:      	b.ne	0x9cbc <_stogir.locals.shape+0x4c0>
    9bd0:      	cmp	x3, x5
    9bd4:      	b.gt	0x9ccc <_stogir.locals.shape+0x4d0>
    9bd8:      	ldr	x3, [x23, #0x50]
    9bdc:      	add	x3, x3, x4, lsl #2
    9be0:      	ldr	w3, [x3]
    9be4:      	sxtw	x3, w3
    9be8:      	cmp	x3, #0x0
    9bec:      	cset	w3, gt
    9bf0:      	ubfx	x3, x3, #0, #8
    9bf4:      	b	0x9cd0 <_stogir.locals.shape+0x4d4>
    9bf8:      	movz	x3, #0x0, lsl #48
    9bfc:      	b	0x9c04 <_stogir.locals.shape+0x408>
    9c00:      	movz	x3, #0x0, lsl #48
    9c04:      	cmp	x3, #0x0
    9c08:      	b.eq	0x9c3c <_stogir.locals.shape+0x440>
    9c0c:      	uxtb	w16, w2
    9c10:      	cmp	w16, wzr
    9c14:      	b.eq	0x9c28 <_stogir.locals.shape+0x42c>
    9c18:      	ldr	x2, [x23]
    9c1c:      	add	x1, x2, x1, lsl #4
    9c20:      	ldr	x1, [x1]
    9c24:      	b	0x9c34 <_stogir.locals.shape+0x438>
    9c28:      	ldr	x1, [x23, #0x28]
    9c2c:      	add	x1, x1, x4, lsl #4
    9c30:      	ldr	x1, [x1]
    9c34:      	mov	w2, #0x1                ; =1
    9c38:      	b	0x9c44 <_stogir.locals.shape+0x448>
    9c3c:      	movz	w2, #0x0, lsl #16
    9c40:      	movz	x1, #0x0, lsl #48
    9c44:      	ubfx	x2, x2, #0, #32
    9c48:      	lsr	x16, x2, #0
    9c4c:      	cmp	x16, #0x1
    9c50:      	b.eq	0x9c6c <_stogir.locals.shape+0x470>
    9c54:      	b.lo	0x9c5c <_stogir.locals.shape+0x460>
    9c58:      	b	0x9c70 <_stogir.locals.shape+0x474>
    9c5c:      	cmp	x16, #0x0
    9c60:      	b.eq	0x9c68 <_stogir.locals.shape+0x46c>
    9c64:      	b	0x9c70 <_stogir.locals.shape+0x474>
    9c68:      	b	0x9c74 <_stogir.locals.shape+0x478>
    9c6c:      	b	0x9c88 <_stogir.locals.shape+0x48c>
    9c70:      	b	0x9d0c <_stogir.locals.shape+0x510>
    9c74:      	mov	x1, #0x1                ; =1
    9c78:      	adrp	x0, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009c78:  ARM64_RELOC_PAGE21	l_stogir.460
    9c7c:      	ldr	x0, [x0]
		0000000000009c7c:  ARM64_RELOC_PAGEOFF12	l_stogir.460
    9c80:      	mov	x21, #0x1d              ; =29
    9c84:      	b	0x9bac <_stogir.locals.shape+0x3b0>
    9c88:      	add	x16, sp, #0x10
    9c8c:      	ldr	w2, [x16, #0x4]
    9c90:      	sxtw	x2, w2
    9c94:      	cmp	x2, #0x0
    9c98:      	b.le	0x9b9c <_stogir.locals.shape+0x3a0>
    9c9c:      	uxtb	w1, w1
    9ca0:      	cmp	x1, #0x83
    9ca4:      	b.ge	0x9cd4 <_stogir.locals.shape+0x4d8>
    9ca8:      	adrp	x17, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009ca8:  ARM64_RELOC_PAGE21	l_stogir.461
    9cac:      	ldr	x17, [x17]
		0000000000009cac:  ARM64_RELOC_PAGEOFF12	l_stogir.461
    9cb0:      	add	x1, x1, x17
    9cb4:      	ldrb	w1, [x1]
    9cb8:      	b	0x9cd8 <_stogir.locals.shape+0x4dc>
    9cbc:      	movz	x3, #0x0, lsl #48
    9cc0:      	b	0x9c04 <_stogir.locals.shape+0x408>
    9cc4:      	movz	x3, #0x0, lsl #48
    9cc8:      	b	0x9bfc <_stogir.locals.shape+0x400>
    9ccc:      	movz	x3, #0x0, lsl #48
    9cd0:      	b	0x9cc0 <_stogir.locals.shape+0x4c4>
    9cd4:      	movz	w1, #0x0, lsl #16
    9cd8:      	uxtb	w16, w1
    9cdc:      	and	w1, w16, #0x2
    9ce0:      	uxtb	w1, w1
    9ce4:      	ubfx	x1, x1, #0, #8
    9ce8:      	cmp	x1, #0x0
    9cec:      	cset	w1, eq
    9cf0:      	uxtb	w16, w1
    9cf4:      	cmp	w16, wzr
    9cf8:      	cset	x1, eq
    9cfc:      	cmp	x1, #0x0
    9d00:      	b.eq	0x9b9c <_stogir.locals.shape+0x3a0>
    9d04:      	movz	x1, #0x0, lsl #48
    9d08:      	b	0x9bac <_stogir.locals.shape+0x3b0>
    9d0c:      	brk	#0
    9d10:      	b	0x9d0c <_stogir.locals.shape+0x510>

0000000000009d14 <_stogir.conversion.policy>:
    9d14:      	sub	sp, sp, #0x70
    9d18:      	str	x29, [sp]
    9d1c:      	str	x30, [sp, #0x8]
    9d20:      	mov	x29, sp
    9d24:      	str	x19, [sp, #0x18]
    9d28:      	str	x20, [sp, #0x20]
    9d2c:      	str	x21, [sp, #0x28]
    9d30:      	str	x22, [sp, #0x30]
    9d34:      	str	x23, [sp, #0x38]
    9d38:      	str	x24, [sp, #0x40]
    9d3c:      	str	x25, [sp, #0x48]
    9d40:      	str	x26, [sp, #0x50]
    9d44:      	str	x27, [sp, #0x58]
    9d48:      	str	x28, [sp, #0x60]
    9d4c:      	sxtw	x19, w0
    9d50:      	sxtw	x20, w1
    9d54:      	sxtw	x21, w2
    9d58:      	cmp	x19, #0x24
    9d5c:      	b.ne	0x9d98 <_stogir.conversion.policy+0x84>
    9d60:      	cmp	x20, #0xf
    9d64:      	b.le	0x9f80 <_stogir.conversion.policy+0x26c>
    9d68:      	cmp	x20, #0x80
    9d6c:      	b.ge	0x9f80 <_stogir.conversion.policy+0x26c>
    9d70:      	and	w0, w1, #0xf
    9d74:      	ubfx	x0, x0, #0, #32
    9d78:      	cmp	x0, #0x1
    9d7c:      	b.lt	0x9f80 <_stogir.conversion.policy+0x26c>
    9d80:      	cmp	x0, #0xd
    9d84:      	b.gt	0x9f80 <_stogir.conversion.policy+0x26c>
    9d88:      	mov	x22, #0x1               ; =1
    9d8c:      	b	0x9d94 <_stogir.conversion.policy+0x80>
    9d90:      	movz	x22, #0x0, lsl #48
    9d94:      	b	0x9d9c <_stogir.conversion.policy+0x88>
    9d98:      	movz	x22, #0x0, lsl #48
    9d9c:      	sxtw	x0, w3
    9da0:      	cmp	x20, #0xd
    9da4:      	cset	w23, eq
    9da8:      	cmp	x20, #0xc
    9dac:      	cset	w24, eq
    9db0:      	cmp	x0, #0x4
    9db4:      	cset	w25, eq
    9db8:      	cmp	x0, #0x8
    9dbc:      	cset	w26, eq
    9dc0:      	cmp	x22, #0x0
    9dc4:      	b.eq	0xa244 <_stogir.conversion.policy+0x530>
    9dc8:      	orr	w0, w3, wzr
    9dcc:      	str	x8, [sp, #0x10]
    9dd0:      	mov	w28, w2
    9dd4:      	mov	w27, w3
    9dd8:      	fmov	s31, w0
    9ddc:      	mov	w0, w1
    9de0:      	fmov	w1, s31
    9de4:      	bl	0x9de4 <_stogir.conversion.policy+0xd0>
		0000000000009de4:  ARM64_RELOC_BRANCH26	_stogir.types.size
    9de8:      	b	0x9df0 <_stogir.conversion.policy+0xdc>
    9dec:      	mov	w0, #0x1                ; =1
    9df0:      	cmp	x21, #0xd
    9df4:      	cset	w1, eq
    9df8:      	cmp	x21, #0xc
    9dfc:      	cset	w2, eq
    9e00:      	cmp	x22, #0x0
    9e04:      	b.eq	0xa254 <_stogir.conversion.policy+0x540>
    9e08:      	mov	w22, w0
    9e0c:      	mov	w0, w28
    9e10:      	mov	w28, w1
    9e14:      	mov	w1, w27
    9e18:      	mov	w25, w2
    9e1c:      	bl	0x9e1c <_stogir.conversion.policy+0x108>
		0000000000009e1c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    9e20:      	orr	w27, w0, wzr
    9e24:      	mov	w0, w25
    9e28:      	b	0x9e30 <_stogir.conversion.policy+0x11c>
    9e2c:      	mov	w27, #0x1               ; =1
    9e30:      	cmp	x19, #0x21
    9e34:      	b.lt	0x9f08 <_stogir.conversion.policy+0x1f4>
    9e38:      	cmp	x19, #0x27
    9e3c:      	b.gt	0x9f08 <_stogir.conversion.policy+0x1f4>
    9e40:      	lsl	w1, w22, #3
    9e44:      	sxtw	x1, w1
    9e48:      	cmp	x1, #0x0
    9e4c:      	b.le	0x9f08 <_stogir.conversion.policy+0x1f4>
    9e50:      	lsl	w2, w27, #3
    9e54:      	sxtw	x2, w2
    9e58:      	cmp	x2, #0x0
    9e5c:      	b.le	0x9f08 <_stogir.conversion.policy+0x1f4>
    9e60:      	cmp	x19, #0x26
    9e64:      	cset	w3, eq
    9e68:      	cmp	x20, #0x1
    9e6c:      	cset	w4, ge
    9e70:      	cmp	x20, #0xb
    9e74:      	cset	w5, le
    9e78:      	cmp	x21, #0x1
    9e7c:      	cset	w6, ge
    9e80:      	cmp	x21, #0xb
    9e84:      	cset	w7, le
    9e88:      	cmp	x19, #0x25
    9e8c:      	b.lt	0xa100 <_stogir.conversion.policy+0x3ec>
    9e90:      	ubfx	x8, x28, #0, #8
    9e94:      	cmp	x19, #0x25
    9e98:      	b.ne	0xa170 <_stogir.conversion.policy+0x45c>
    9e9c:      	uxtb	w16, w4
    9ea0:      	cmp	w16, wzr
    9ea4:      	b.eq	0xa168 <_stogir.conversion.policy+0x454>
    9ea8:      	uxtb	w16, w5
    9eac:      	cmp	w16, wzr
    9eb0:      	b.eq	0xa168 <_stogir.conversion.policy+0x454>
    9eb4:      	uxtb	w16, w0
    9eb8:      	cmp	w16, wzr
    9ebc:      	b.eq	0x9ec4 <_stogir.conversion.policy+0x1b0>
    9ec0:      	mov	x8, #0x1                ; =1
    9ec4:      	b	0xa16c <_stogir.conversion.policy+0x458>
    9ec8:      	uxtb	w16, w25
    9ecc:      	cmp	w16, wzr
    9ed0:      	b.ne	0x9f60 <_stogir.conversion.policy+0x24c>
    9ed4:      	uxtb	w16, w26
    9ed8:      	cmp	w16, wzr
    9edc:      	b.ne	0x9f60 <_stogir.conversion.policy+0x24c>
    9ee0:      	movn	w27, #0x0, lsl #16
    9ee4:      	b	0x9e30 <_stogir.conversion.policy+0x11c>
    9ee8:      	uxtb	w16, w25
    9eec:      	cmp	w16, wzr
    9ef0:      	b.ne	0x9f70 <_stogir.conversion.policy+0x25c>
    9ef4:      	uxtb	w16, w26
    9ef8:      	cmp	w16, wzr
    9efc:      	b.ne	0x9f70 <_stogir.conversion.policy+0x25c>
    9f00:      	movn	w0, #0x0, lsl #16
    9f04:      	b	0x9df0 <_stogir.conversion.policy+0xdc>
    9f08:      	mov	x1, #0x1                ; =1
    9f0c:      	adrp	x0, 0x9000 <_stogir.stack.validate-scope-inputs+0x280>
		0000000000009f0c:  ARM64_RELOC_PAGE21	l_stogir.462
    9f10:      	ldr	x0, [x0]
		0000000000009f10:  ARM64_RELOC_PAGEOFF12	l_stogir.462
    9f14:      	mov	x2, #0x22               ; =34
    9f18:      	ldr	x3, [sp, #0x10]
    9f1c:      	str	x1, [x3]
    9f20:      	str	x0, [x3, #0x8]
    9f24:      	str	x2, [x3, #0x10]
    9f28:      	ldr	x19, [sp, #0x18]
    9f2c:      	ldr	x20, [sp, #0x20]
    9f30:      	ldr	x21, [sp, #0x28]
    9f34:      	ldr	x22, [sp, #0x30]
    9f38:      	ldr	x23, [sp, #0x38]
    9f3c:      	ldr	x24, [sp, #0x40]
    9f40:      	ldr	x25, [sp, #0x48]
    9f44:      	ldr	x26, [sp, #0x50]
    9f48:      	ldr	x27, [sp, #0x58]
    9f4c:      	ldr	x28, [sp, #0x60]
    9f50:      	ldr	x29, [sp]
    9f54:      	ldr	x30, [sp, #0x8]
    9f58:      	add	sp, sp, #0x70
    9f5c:      	ret
    9f60:      	cmp	x21, #0x0
    9f64:      	b.ne	0x9fb8 <_stogir.conversion.policy+0x2a4>
    9f68:      	movz	w27, #0x0, lsl #16
    9f6c:      	b	0x9e30 <_stogir.conversion.policy+0x11c>
    9f70:      	cmp	x20, #0x0
    9f74:      	b.ne	0xa030 <_stogir.conversion.policy+0x31c>
    9f78:      	movz	w0, #0x0, lsl #16
    9f7c:      	b	0x9df0 <_stogir.conversion.policy+0xdc>
    9f80:      	cmp	x21, #0xf
    9f84:      	b.le	0x9d90 <_stogir.conversion.policy+0x7c>
    9f88:      	cmp	x21, #0x80
    9f8c:      	b.ge	0x9fb0 <_stogir.conversion.policy+0x29c>
    9f90:      	and	w0, w2, #0xf
    9f94:      	ubfx	x0, x0, #0, #32
    9f98:      	cmp	x0, #0x1
    9f9c:      	b.lt	0xa0a8 <_stogir.conversion.policy+0x394>
    9fa0:      	cmp	x0, #0xd
    9fa4:      	cset	w0, le
    9fa8:      	ubfx	x22, x0, #0, #8
    9fac:      	b	0xa0ac <_stogir.conversion.policy+0x398>
    9fb0:      	movz	x22, #0x0, lsl #48
    9fb4:      	b	0x9d94 <_stogir.conversion.policy+0x80>
    9fb8:      	cmp	x21, #0x1
    9fbc:      	b.eq	0x9e2c <_stogir.conversion.policy+0x118>
    9fc0:      	cmp	x21, #0x2
    9fc4:      	b.eq	0x9e2c <_stogir.conversion.policy+0x118>
    9fc8:      	cmp	x21, #0x7
    9fcc:      	b.eq	0x9e2c <_stogir.conversion.policy+0x118>
    9fd0:      	cmp	x21, #0x8
    9fd4:      	b.eq	0x9e2c <_stogir.conversion.policy+0x118>
    9fd8:      	cmp	x21, #0x3
    9fdc:      	b.eq	0xa19c <_stogir.conversion.policy+0x488>
    9fe0:      	cmp	x21, #0x9
    9fe4:      	b.eq	0xa19c <_stogir.conversion.policy+0x488>
    9fe8:      	cmp	x21, #0x4
    9fec:      	b.eq	0xa20c <_stogir.conversion.policy+0x4f8>
    9ff0:      	cmp	x21, #0xa
    9ff4:      	b.eq	0xa20c <_stogir.conversion.policy+0x4f8>
    9ff8:      	uxtb	w16, w28
    9ffc:      	cmp	w16, wzr
    a000:      	b.ne	0xa20c <_stogir.conversion.policy+0x4f8>
    a004:      	cmp	x21, #0x5
    a008:      	b.eq	0xa22c <_stogir.conversion.policy+0x518>
    a00c:      	cmp	x21, #0xb
    a010:      	b.eq	0xa22c <_stogir.conversion.policy+0x518>
    a014:      	uxtb	w16, w0
    a018:      	cmp	w16, wzr
    a01c:      	b.ne	0xa22c <_stogir.conversion.policy+0x518>
    a020:      	cmp	x21, #0x6
    a024:      	b.eq	0xa02c <_stogir.conversion.policy+0x318>
    a028:      	movn	w27, #0x0, lsl #16
    a02c:      	b	0xa230 <_stogir.conversion.policy+0x51c>
    a030:      	cmp	x20, #0x1
    a034:      	b.eq	0x9dec <_stogir.conversion.policy+0xd8>
    a038:      	cmp	x20, #0x2
    a03c:      	b.eq	0x9dec <_stogir.conversion.policy+0xd8>
    a040:      	cmp	x20, #0x7
    a044:      	b.eq	0x9dec <_stogir.conversion.policy+0xd8>
    a048:      	cmp	x20, #0x8
    a04c:      	b.eq	0x9dec <_stogir.conversion.policy+0xd8>
    a050:      	cmp	x20, #0x3
    a054:      	b.eq	0xa1a4 <_stogir.conversion.policy+0x490>
    a058:      	cmp	x20, #0x9
    a05c:      	b.eq	0xa1a4 <_stogir.conversion.policy+0x490>
    a060:      	cmp	x20, #0x4
    a064:      	b.eq	0xa214 <_stogir.conversion.policy+0x500>
    a068:      	cmp	x20, #0xa
    a06c:      	b.eq	0xa214 <_stogir.conversion.policy+0x500>
    a070:      	uxtb	w16, w23
    a074:      	cmp	w16, wzr
    a078:      	b.ne	0xa214 <_stogir.conversion.policy+0x500>
    a07c:      	cmp	x20, #0x5
    a080:      	b.eq	0xa234 <_stogir.conversion.policy+0x520>
    a084:      	cmp	x20, #0xb
    a088:      	b.eq	0xa234 <_stogir.conversion.policy+0x520>
    a08c:      	uxtb	w16, w24
    a090:      	cmp	w16, wzr
    a094:      	b.ne	0xa234 <_stogir.conversion.policy+0x520>
    a098:      	cmp	x20, #0x6
    a09c:      	b.ne	0xa23c <_stogir.conversion.policy+0x528>
    a0a0:      	mov	w0, w27
    a0a4:      	b	0xa240 <_stogir.conversion.policy+0x52c>
    a0a8:      	movz	x22, #0x0, lsl #48
    a0ac:      	b	0x9fb4 <_stogir.conversion.policy+0x2a0>
    a0b0:      	mov	x0, #0x1                ; =1
    a0b4:      	cmp	x0, #0x0
    a0b8:      	b.ne	0x9f08 <_stogir.conversion.policy+0x1f4>
    a0bc:      	cmp	x19, #0x23
    a0c0:      	b.eq	0xa0d0 <_stogir.conversion.policy+0x3bc>
    a0c4:      	uxtb	w16, w3
    a0c8:      	cmp	w16, wzr
    a0cc:      	b.eq	0xa0d4 <_stogir.conversion.policy+0x3c0>
    a0d0:      	mov	x1, x2
    a0d4:      	and	x0, x1, #0xffffffff
    a0d8:      	movz	x1, #0x0, lsl #48
    a0dc:      	movz	x2, #0x0, lsl #48
    a0e0:      	b	0x9f18 <_stogir.conversion.policy+0x204>
    a0e4:      	movz	x8, #0x0, lsl #48
    a0e8:      	cmp	x8, #0x0
    a0ec:      	cset	w0, ne
    a0f0:      	uxtb	w16, w0
    a0f4:      	cmp	w16, wzr
    a0f8:      	cset	x0, eq
    a0fc:      	b	0xa0b4 <_stogir.conversion.policy+0x3a0>
    a100:      	cmp	x19, #0x24
    a104:      	b.ne	0xa120 <_stogir.conversion.policy+0x40c>
    a108:      	cmp	x1, x2
    a10c:      	cset	w0, eq
    a110:      	uxtb	w16, w0
    a114:      	cmp	w16, wzr
    a118:      	cset	x0, eq
    a11c:      	b	0xa0b4 <_stogir.conversion.policy+0x3a0>
    a120:      	uxtb	w16, w4
    a124:      	cmp	w16, wzr
    a128:      	b.eq	0xa0b0 <_stogir.conversion.policy+0x39c>
    a12c:      	uxtb	w16, w5
    a130:      	cmp	w16, wzr
    a134:      	b.eq	0xa0b0 <_stogir.conversion.policy+0x39c>
    a138:      	uxtb	w16, w6
    a13c:      	cmp	w16, wzr
    a140:      	b.eq	0xa1dc <_stogir.conversion.policy+0x4c8>
    a144:      	uxtb	w16, w7
    a148:      	cmp	w16, wzr
    a14c:      	b.eq	0xa1dc <_stogir.conversion.policy+0x4c8>
    a150:      	cmp	x19, #0x23
    a154:      	b.ne	0xa21c <_stogir.conversion.policy+0x508>
    a158:      	cmp	x2, x1
    a15c:      	cset	w0, ge
    a160:      	ubfx	x0, x0, #0, #8
    a164:      	b	0xa228 <_stogir.conversion.policy+0x514>
    a168:      	movz	x8, #0x0, lsl #48
    a16c:      	b	0xa0e8 <_stogir.conversion.policy+0x3d4>
    a170:      	uxtb	w16, w3
    a174:      	cmp	w16, wzr
    a178:      	b.eq	0xa1b4 <_stogir.conversion.policy+0x4a0>
    a17c:      	uxtb	w16, w24
    a180:      	cmp	w16, wzr
    a184:      	b.ne	0xa1f8 <_stogir.conversion.policy+0x4e4>
    a188:      	uxtb	w16, w23
    a18c:      	cmp	w16, wzr
    a190:      	b.ne	0xa1f8 <_stogir.conversion.policy+0x4e4>
    a194:      	movz	x8, #0x0, lsl #48
    a198:      	b	0xa1b0 <_stogir.conversion.policy+0x49c>
    a19c:      	mov	w27, #0x2               ; =2
    a1a0:      	b	0x9e30 <_stogir.conversion.policy+0x11c>
    a1a4:      	mov	w0, #0x2                ; =2
    a1a8:      	b	0x9df0 <_stogir.conversion.policy+0xdc>
    a1ac:      	movz	x8, #0x0, lsl #48
    a1b0:      	b	0xa0e8 <_stogir.conversion.policy+0x3d4>
    a1b4:      	cmp	x19, #0x27
    a1b8:      	b.ne	0xa0e4 <_stogir.conversion.policy+0x3d0>
    a1bc:      	uxtb	w16, w24
    a1c0:      	cmp	w16, wzr
    a1c4:      	b.ne	0xa1e4 <_stogir.conversion.policy+0x4d0>
    a1c8:      	uxtb	w16, w23
    a1cc:      	cmp	w16, wzr
    a1d0:      	b.ne	0xa1e4 <_stogir.conversion.policy+0x4d0>
    a1d4:      	movz	x8, #0x0, lsl #48
    a1d8:      	b	0xa1f4 <_stogir.conversion.policy+0x4e0>
    a1dc:      	mov	x0, #0x1                ; =1
    a1e0:      	b	0xa0b4 <_stogir.conversion.policy+0x3a0>
    a1e4:      	uxtb	w16, w0
    a1e8:      	cmp	w16, wzr
    a1ec:      	b.eq	0xa1f4 <_stogir.conversion.policy+0x4e0>
    a1f0:      	mov	x8, #0x1                ; =1
    a1f4:      	b	0xa0e8 <_stogir.conversion.policy+0x3d4>
    a1f8:      	uxtb	w16, w6
    a1fc:      	cmp	w16, wzr
    a200:      	b.eq	0xa1ac <_stogir.conversion.policy+0x498>
    a204:      	ubfx	x8, x7, #0, #8
    a208:      	b	0xa1b0 <_stogir.conversion.policy+0x49c>
    a20c:      	mov	w27, #0x4               ; =4
    a210:      	b	0xa1a0 <_stogir.conversion.policy+0x48c>
    a214:      	mov	w0, #0x4                ; =4
    a218:      	b	0xa1a8 <_stogir.conversion.policy+0x494>
    a21c:      	cmp	x2, x1
    a220:      	cset	w0, le
    a224:      	ubfx	x0, x0, #0, #8
    a228:      	b	0xa1e0 <_stogir.conversion.policy+0x4cc>
    a22c:      	mov	w27, #0x8               ; =8
    a230:      	b	0xa210 <_stogir.conversion.policy+0x4fc>
    a234:      	mov	w0, #0x8                ; =8
    a238:      	b	0xa218 <_stogir.conversion.policy+0x504>
    a23c:      	movn	w0, #0x0, lsl #16
    a240:      	b	0xa238 <_stogir.conversion.policy+0x524>
    a244:      	str	x8, [sp, #0x10]
    a248:      	mov	w28, w2
    a24c:      	mov	w27, w3
    a250:      	b	0x9ee8 <_stogir.conversion.policy+0x1d4>
    a254:      	mov	w22, w0
    a258:      	mov	w28, w1
    a25c:      	mov	w0, w2
    a260:      	b	0x9ec8 <_stogir.conversion.policy+0x1b4>

000000000000a264 <_stogir.conditional.operands>:
    a264:      	sub	sp, sp, #0x20
    a268:      	sxtw	x5, w1
    a26c:      	cmp	x5, #0x0
    a270:      	b.eq	0xa2bc <_stogir.conditional.operands+0x58>
    a274:      	cmp	x5, #0x0
    a278:      	b.lt	0xa294 <_stogir.conditional.operands+0x30>
    a27c:      	cmp	x5, #0xd
    a280:      	b.gt	0xa294 <_stogir.conditional.operands+0x30>
    a284:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a284:  ARM64_RELOC_PAGE21	l_stogir.463
    a288:      	ldr	x1, [x1]
		000000000000a288:  ARM64_RELOC_PAGEOFF12	l_stogir.463
    a28c:      	movz	x6, #0x0, lsl #48
    a290:      	b	0xa2c8 <_stogir.conditional.operands+0x64>
    a294:      	cmp	x5, #0xf
    a298:      	b.le	0xa2bc <_stogir.conditional.operands+0x58>
    a29c:      	cmp	x5, #0x80
    a2a0:      	b.ge	0xa2bc <_stogir.conditional.operands+0x58>
    a2a4:      	and	w1, w1, #0xf
    a2a8:      	ubfx	x1, x1, #0, #32
    a2ac:      	cmp	x1, #0x1
    a2b0:      	b.lt	0xa2bc <_stogir.conditional.operands+0x58>
    a2b4:      	cmp	x1, #0xd
    a2b8:      	b.le	0xa284 <_stogir.conditional.operands+0x20>
    a2bc:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a2bc:  ARM64_RELOC_PAGE21	l_stogir.464
    a2c0:      	ldr	x1, [x1]
		000000000000a2c0:  ARM64_RELOC_PAGEOFF12	l_stogir.464
    a2c4:      	mov	x6, #0x2b               ; =43
    a2c8:      	sxtw	x2, w2
    a2cc:      	cmp	x2, #0x0
    a2d0:      	cset	w7, gt
    a2d4:      	movz	x16, #0x0, lsl #48
    a2d8:      	sub	x9, x16, x2
    a2dc:      	sub	x10, x9, #0x1
    a2e0:      	uxtb	w16, w7
    a2e4:      	cmp	w16, wzr
    a2e8:      	b.eq	0xa328 <_stogir.conditional.operands+0xc4>
    a2ec:      	ldr	x9, [x0, #0x8]
    a2f0:      	cmp	x2, x9
    a2f4:      	b.ge	0xa380 <_stogir.conditional.operands+0x11c>
    a2f8:      	add	x9, x0, #0x78
    a2fc:      	ldr	x9, [x9, #0x8]
    a300:      	cmp	x2, x9
    a304:      	b.ge	0xa680 <_stogir.conditional.operands+0x41c>
    a308:      	ldr	x9, [x0, #0x78]
    a30c:      	add	x9, x9, x2, lsl #2
    a310:      	ldr	w9, [x9]
    a314:      	sxtw	x9, w9
    a318:      	cmp	x9, #0x0
    a31c:      	cset	w9, ge
    a320:      	ubfx	x9, x9, #0, #8
    a324:      	b	0xa684 <_stogir.conditional.operands+0x420>
    a328:      	cmp	x2, #0x0
    a32c:      	b.ge	0xa388 <_stogir.conditional.operands+0x124>
    a330:      	add	x11, x0, #0x28
    a334:      	add	x12, x0, #0x50
    a338:      	ldr	x11, [x11, #0x8]
    a33c:      	ldr	x12, [x12, #0x8]
    a340:      	cmp	x11, x12
    a344:      	b.ne	0xa370 <_stogir.conditional.operands+0x10c>
    a348:      	cmp	x9, x11
    a34c:      	b.gt	0xa688 <_stogir.conditional.operands+0x424>
    a350:      	ldr	x9, [x0, #0x50]
    a354:      	add	x9, x9, x10, lsl #2
    a358:      	ldr	w9, [x9]
    a35c:      	sxtw	x9, w9
    a360:      	cmp	x9, #0x0
    a364:      	cset	w9, gt
    a368:      	ubfx	x9, x9, #0, #8
    a36c:      	b	0xa68c <_stogir.conditional.operands+0x428>
    a370:      	movz	x9, #0x0, lsl #48
    a374:      	b	0xa38c <_stogir.conditional.operands+0x128>
    a378:      	movz	x12, #0x0, lsl #48
    a37c:      	b	0xa418 <_stogir.conditional.operands+0x1b4>
    a380:      	movz	x9, #0x0, lsl #48
    a384:      	b	0xa38c <_stogir.conditional.operands+0x128>
    a388:      	movz	x9, #0x0, lsl #48
    a38c:      	cmp	x9, #0x0
    a390:      	b.eq	0xa3c4 <_stogir.conditional.operands+0x160>
    a394:      	uxtb	w16, w7
    a398:      	cmp	w16, wzr
    a39c:      	b.eq	0xa3b0 <_stogir.conditional.operands+0x14c>
    a3a0:      	ldr	x7, [x0]
    a3a4:      	add	x2, x7, x2, lsl #4
    a3a8:      	ldr	x2, [x2]
    a3ac:      	b	0xa3bc <_stogir.conditional.operands+0x158>
    a3b0:      	ldr	x2, [x0, #0x28]
    a3b4:      	add	x2, x2, x10, lsl #4
    a3b8:      	ldr	x2, [x2]
    a3bc:      	mov	w7, #0x1                ; =1
    a3c0:      	b	0xa3cc <_stogir.conditional.operands+0x168>
    a3c4:      	movz	w7, #0x0, lsl #16
    a3c8:      	movz	x2, #0x0, lsl #48
    a3cc:      	ubfx	x7, x7, #0, #32
    a3d0:      	lsr	x16, x7, #0
    a3d4:      	cmp	x16, #0x1
    a3d8:      	b.eq	0xa3f4 <_stogir.conditional.operands+0x190>
    a3dc:      	b.lo	0xa3e4 <_stogir.conditional.operands+0x180>
    a3e0:      	b	0xa3f8 <_stogir.conditional.operands+0x194>
    a3e4:      	cmp	x16, #0x0
    a3e8:      	b.eq	0xa3f0 <_stogir.conditional.operands+0x18c>
    a3ec:      	b	0xa3f8 <_stogir.conditional.operands+0x194>
    a3f0:      	b	0xa3fc <_stogir.conditional.operands+0x198>
    a3f4:      	b	0xa41c <_stogir.conditional.operands+0x1b8>
    a3f8:      	b	0xa6a0 <_stogir.conditional.operands+0x43c>
    a3fc:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a3fc:  ARM64_RELOC_PAGE21	l_stogir.465
    a400:      	ldr	x1, [x1]
		000000000000a400:  ARM64_RELOC_PAGEOFF12	l_stogir.465
    a404:      	mov	x6, #0x16               ; =22
    a408:      	b	0xa45c <_stogir.conditional.operands+0x1f8>
    a40c:      	movz	x12, #0x0, lsl #48
    a410:      	b	0xa49c <_stogir.conditional.operands+0x238>
    a414:      	movz	x12, #0x0, lsl #48
    a418:      	b	0xa4a4 <_stogir.conditional.operands+0x240>
    a41c:      	uxtb	w7, w2
    a420:      	cmp	x7, #0x48
    a424:      	b.eq	0xa450 <_stogir.conditional.operands+0x1ec>
    a428:      	cmp	x7, #0x46
    a42c:      	b.eq	0xa450 <_stogir.conditional.operands+0x1ec>
    a430:      	ubfx	x7, x2, #0, #32
    a434:      	ubfx	x7, x7, #8, #8
    a438:      	cmp	x7, #0x0
    a43c:      	b.eq	0xa450 <_stogir.conditional.operands+0x1ec>
    a440:      	ubfx	x2, x2, #0, #32
    a444:      	ubfx	x2, x2, #8, #8
    a448:      	cmp	x2, #0xd
    a44c:      	b.le	0xa45c <_stogir.conditional.operands+0x1f8>
    a450:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a450:  ARM64_RELOC_PAGE21	l_stogir.466
    a454:      	ldr	x1, [x1]
		000000000000a454:  ARM64_RELOC_PAGEOFF12	l_stogir.466
    a458:      	mov	x6, #0x2a               ; =42
    a45c:      	add	x16, sp, #0x10
    a460:      	orr	x2, x16, xzr
    a464:      	add	x7, x0, #0x78
    a468:      	add	x9, x0, #0x28
    a46c:      	add	x10, x0, #0x50
    a470:      	mov	x16, sp
    a474:      	str	w3, [x16]
    a478:      	mov	x16, sp
    a47c:      	str	w4, [x16, #0x4]
    a480:      	mov	x16, sp
    a484:      	ldr	x3, [x16]
    a488:      	add	x16, sp, #0x10
    a48c:      	str	x3, [x16]
    a490:      	movz	x3, #0x0, lsl #48
    a494:      	b	0xa554 <_stogir.conditional.operands+0x2f0>
    a498:      	movz	x12, #0x0, lsl #48
    a49c:      	b	0xa4a4 <_stogir.conditional.operands+0x240>
    a4a0:      	movz	x12, #0x0, lsl #48
    a4a4:      	cmp	x12, #0x0
    a4a8:      	b.eq	0xa4dc <_stogir.conditional.operands+0x278>
    a4ac:      	uxtb	w16, w4
    a4b0:      	cmp	w16, wzr
    a4b4:      	b.eq	0xa4c8 <_stogir.conditional.operands+0x264>
    a4b8:      	ldr	x4, [x0]
    a4bc:      	add	x4, x4, x11, lsl #4
    a4c0:      	ldr	x4, [x4]
    a4c4:      	b	0xa4d4 <_stogir.conditional.operands+0x270>
    a4c8:      	ldr	x4, [x0, #0x28]
    a4cc:      	add	x4, x4, x13, lsl #4
    a4d0:      	ldr	x4, [x4]
    a4d4:      	mov	w11, #0x1               ; =1
    a4d8:      	b	0xa4e4 <_stogir.conditional.operands+0x280>
    a4dc:      	movz	w11, #0x0, lsl #16
    a4e0:      	movz	x4, #0x0, lsl #48
    a4e4:      	ubfx	x11, x11, #0, #32
    a4e8:      	lsr	x16, x11, #0
    a4ec:      	cmp	x16, #0x1
    a4f0:      	b.eq	0xa50c <_stogir.conditional.operands+0x2a8>
    a4f4:      	b.lo	0xa4fc <_stogir.conditional.operands+0x298>
    a4f8:      	b	0xa510 <_stogir.conditional.operands+0x2ac>
    a4fc:      	cmp	x16, #0x0
    a500:      	b.eq	0xa508 <_stogir.conditional.operands+0x2a4>
    a504:      	b	0xa510 <_stogir.conditional.operands+0x2ac>
    a508:      	b	0xa514 <_stogir.conditional.operands+0x2b0>
    a50c:      	b	0xa524 <_stogir.conditional.operands+0x2c0>
    a510:      	b	0xa698 <_stogir.conditional.operands+0x434>
    a514:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a514:  ARM64_RELOC_PAGE21	l_stogir.467
    a518:      	ldr	x1, [x1]
		000000000000a518:  ARM64_RELOC_PAGEOFF12	l_stogir.467
    a51c:      	mov	x6, #0x10               ; =16
    a520:      	b	0xa554 <_stogir.conditional.operands+0x2f0>
    a524:      	uxtb	w11, w4
    a528:      	cmp	x11, #0x48
    a52c:      	b.eq	0xa548 <_stogir.conditional.operands+0x2e4>
    a530:      	cmp	x11, #0x46
    a534:      	b.eq	0xa548 <_stogir.conditional.operands+0x2e4>
    a538:      	ubfx	x4, x4, #0, #32
    a53c:      	ubfx	x4, x4, #8, #8
    a540:      	cmp	x4, x5
    a544:      	b.eq	0xa554 <_stogir.conditional.operands+0x2f0>
    a548:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a548:  ARM64_RELOC_PAGE21	l_stogir.468
    a54c:      	ldr	x1, [x1]
		000000000000a54c:  ARM64_RELOC_PAGEOFF12	l_stogir.468
    a550:      	mov	x6, #0x21               ; =33
    a554:      	cmp	x3, #0x2
    a558:      	b.ge	0xa57c <_stogir.conditional.operands+0x318>
    a55c:      	add	x4, x3, #0x1
    a560:      	add	x3, x2, x3, lsl #2
    a564:      	ldr	w3, [x3]
    a568:      	movn	w17, #0x0, lsl #16
    a56c:      	and	w11, w3, w17
    a570:      	mov	x3, x4
    a574:      	mov	w4, #0x1                ; =1
    a578:      	b	0xa584 <_stogir.conditional.operands+0x320>
    a57c:      	movz	w4, #0x0, lsl #16
    a580:      	movz	w11, #0x0, lsl #16
    a584:      	ubfx	x4, x4, #0, #32
    a588:      	lsr	x16, x4, #0
    a58c:      	cmp	x16, #0x1
    a590:      	b.eq	0xa5ac <_stogir.conditional.operands+0x348>
    a594:      	b.lo	0xa59c <_stogir.conditional.operands+0x338>
    a598:      	b	0xa5b0 <_stogir.conditional.operands+0x34c>
    a59c:      	cmp	x16, #0x0
    a5a0:      	b.eq	0xa5a8 <_stogir.conditional.operands+0x344>
    a5a4:      	b	0xa5b0 <_stogir.conditional.operands+0x34c>
    a5a8:      	b	0xa610 <_stogir.conditional.operands+0x3ac>
    a5ac:      	b	0xa5b4 <_stogir.conditional.operands+0x350>
    a5b0:      	b	0xa690 <_stogir.conditional.operands+0x42c>
    a5b4:      	sxtw	x11, w11
    a5b8:      	cmp	x11, #0x0
    a5bc:      	cset	w4, gt
    a5c0:      	movz	x16, #0x0, lsl #48
    a5c4:      	sub	x12, x16, x11
    a5c8:      	sub	x13, x12, #0x1
    a5cc:      	uxtb	w16, w4
    a5d0:      	cmp	w16, wzr
    a5d4:      	b.eq	0xa640 <_stogir.conditional.operands+0x3dc>
    a5d8:      	ldr	x12, [x0, #0x8]
    a5dc:      	cmp	x11, x12
    a5e0:      	b.ge	0xa498 <_stogir.conditional.operands+0x234>
    a5e4:      	ldr	x12, [x7, #0x8]
    a5e8:      	cmp	x11, x12
    a5ec:      	b.ge	0xa40c <_stogir.conditional.operands+0x1a8>
    a5f0:      	ldr	x12, [x0, #0x78]
    a5f4:      	add	x12, x12, x11, lsl #2
    a5f8:      	ldr	w12, [x12]
    a5fc:      	sxtw	x12, w12
    a600:      	cmp	x12, #0x0
    a604:      	cset	w12, ge
    a608:      	ubfx	x12, x12, #0, #8
    a60c:      	b	0xa410 <_stogir.conditional.operands+0x1ac>
    a610:      	cmp	x6, #0x0
    a614:      	b.ne	0xa628 <_stogir.conditional.operands+0x3c4>
    a618:      	and	x1, x5, #0xffffffff
    a61c:      	movz	x0, #0x0, lsl #48
    a620:      	movz	x6, #0x0, lsl #48
    a624:      	b	0xa62c <_stogir.conditional.operands+0x3c8>
    a628:      	mov	x0, #0x1                ; =1
    a62c:      	str	x0, [x8]
    a630:      	str	x1, [x8, #0x8]
    a634:      	str	x6, [x8, #0x10]
    a638:      	add	sp, sp, #0x20
    a63c:      	ret
    a640:      	cmp	x11, #0x0
    a644:      	b.ge	0xa4a0 <_stogir.conditional.operands+0x23c>
    a648:      	ldr	x14, [x9, #0x8]
    a64c:      	ldr	x15, [x10, #0x8]
    a650:      	cmp	x14, x15
    a654:      	b.ne	0xa414 <_stogir.conditional.operands+0x1b0>
    a658:      	cmp	x12, x14
    a65c:      	b.gt	0xa378 <_stogir.conditional.operands+0x114>
    a660:      	ldr	x12, [x0, #0x50]
    a664:      	add	x12, x12, x13, lsl #2
    a668:      	ldr	w12, [x12]
    a66c:      	sxtw	x12, w12
    a670:      	cmp	x12, #0x0
    a674:      	cset	w12, gt
    a678:      	ubfx	x12, x12, #0, #8
    a67c:      	b	0xa37c <_stogir.conditional.operands+0x118>
    a680:      	movz	x9, #0x0, lsl #48
    a684:      	b	0xa384 <_stogir.conditional.operands+0x120>
    a688:      	movz	x9, #0x0, lsl #48
    a68c:      	b	0xa374 <_stogir.conditional.operands+0x110>
    a690:      	brk	#0
    a694:      	b	0xa690 <_stogir.conditional.operands+0x42c>
    a698:      	brk	#0
    a69c:      	b	0xa698 <_stogir.conditional.operands+0x434>
    a6a0:      	brk	#0
    a6a4:      	b	0xa6a0 <_stogir.conditional.operands+0x43c>

000000000000a6a8 <_stogir.floating.operands>:
    a6a8:      	sub	sp, sp, #0x90
    a6ac:      	str	x29, [sp]
    a6b0:      	str	x30, [sp, #0x8]
    a6b4:      	mov	x29, sp
    a6b8:      	str	x19, [sp, #0x60]
    a6bc:      	str	x20, [sp, #0x68]
    a6c0:      	str	x21, [sp, #0x70]
    a6c4:      	str	x22, [sp, #0x78]
    a6c8:      	str	x23, [sp, #0x80]
    a6cc:      	sxtw	x1, w1
    a6d0:      	sxtw	x19, w2
    a6d4:      	cmp	x1, #0x1f
    a6d8:      	cset	w2, eq
    a6dc:      	cmp	x1, #0x20
    a6e0:      	cset	w6, eq
    a6e4:      	cmp	x1, #0xe
    a6e8:      	b.lt	0xa714 <_stogir.floating.operands+0x6c>
    a6ec:      	cmp	x1, #0x19
    a6f0:      	b.gt	0xa714 <_stogir.floating.operands+0x6c>
    a6f4:      	cmp	x19, #0xc
    a6f8:      	b.eq	0xa7b0 <_stogir.floating.operands+0x108>
    a6fc:      	cmp	x19, #0xd
    a700:      	b.eq	0xa7b0 <_stogir.floating.operands+0x108>
    a704:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a704:  ARM64_RELOC_PAGE21	l_stogir.469
    a708:      	ldr	x20, [x20]
		000000000000a708:  ARM64_RELOC_PAGEOFF12	l_stogir.469
    a70c:      	mov	x21, #0x22              ; =34
    a710:      	b	0xa7bc <_stogir.floating.operands+0x114>
    a714:      	uxtb	w16, w2
    a718:      	cmp	w16, wzr
    a71c:      	b.ne	0xa6f4 <_stogir.floating.operands+0x4c>
    a720:      	uxtb	w16, w6
    a724:      	cmp	w16, wzr
    a728:      	b.ne	0xa6f4 <_stogir.floating.operands+0x4c>
    a72c:      	cmp	x1, #0x1a
    a730:      	b.lt	0xa73c <_stogir.floating.operands+0x94>
    a734:      	cmp	x1, #0x1d
    a738:      	b.le	0xa6f4 <_stogir.floating.operands+0x4c>
    a73c:      	cmp	x1, #0x3a
    a740:      	b.eq	0xa6f4 <_stogir.floating.operands+0x4c>
    a744:      	cmp	x1, #0x3b
    a748:      	b.eq	0xa6f4 <_stogir.floating.operands+0x4c>
    a74c:      	b	0xa704 <_stogir.floating.operands+0x5c>
    a750:      	movz	w1, #0x0, lsl #16
    a754:      	uxtb	w16, w1
    a758:      	and	w1, w16, #0x2
    a75c:      	uxtb	w1, w1
    a760:      	ubfx	x1, x1, #0, #8
    a764:      	cmp	x1, #0x0
    a768:      	cset	w1, eq
    a76c:      	uxtb	w16, w1
    a770:      	cmp	w16, wzr
    a774:      	cset	x1, eq
    a778:      	cmp	x1, #0x0
    a77c:      	b.ne	0xa79c <_stogir.floating.operands+0xf4>
    a780:      	cmp	x0, #0x65
    a784:      	b.eq	0xa79c <_stogir.floating.operands+0xf4>
    a788:      	cmp	x0, #0x66
    a78c:      	b.eq	0xa79c <_stogir.floating.operands+0xf4>
    a790:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a790:  ARM64_RELOC_PAGE21	l_stogir.470
    a794:      	ldr	x20, [x20]
		000000000000a794:  ARM64_RELOC_PAGEOFF12	l_stogir.470
    a798:      	mov	x21, #0x2d              ; =45
    a79c:      	b	0xa8ac <_stogir.floating.operands+0x204>
    a7a0:      	movz	x11, #0x0, lsl #48
    a7a4:      	b	0xa818 <_stogir.floating.operands+0x170>
    a7a8:      	movz	x11, #0x0, lsl #48
    a7ac:      	b	0xa820 <_stogir.floating.operands+0x178>
    a7b0:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a7b0:  ARM64_RELOC_PAGE21	l_stogir.471
    a7b4:      	ldr	x20, [x20]
		000000000000a7b4:  ARM64_RELOC_PAGEOFF12	l_stogir.471
    a7b8:      	movz	x21, #0x0, lsl #48
    a7bc:      	add	x16, sp, #0x10
    a7c0:      	str	w3, [x16]
    a7c4:      	uxtb	w16, w2
    a7c8:      	cmp	w16, wzr
    a7cc:      	b.ne	0xa7e0 <_stogir.floating.operands+0x138>
    a7d0:      	uxtb	w16, w6
    a7d4:      	cmp	w16, wzr
    a7d8:      	b.ne	0xa7e0 <_stogir.floating.operands+0x138>
    a7dc:      	orr	w3, w4, wzr
    a7e0:      	add	x16, sp, #0x20
    a7e4:      	orr	x2, x16, xzr
    a7e8:      	add	x4, x0, #0x78
    a7ec:      	add	x6, x0, #0x28
    a7f0:      	add	x7, x0, #0x50
    a7f4:      	add	x16, sp, #0x10
    a7f8:      	str	w3, [x16, #0x4]
    a7fc:      	add	x16, sp, #0x10
    a800:      	ldr	x3, [x16]
    a804:      	add	x16, sp, #0x20
    a808:      	str	x3, [x16]
    a80c:      	movz	x3, #0x0, lsl #48
    a810:      	b	0xa8cc <_stogir.floating.operands+0x224>
    a814:      	movz	x11, #0x0, lsl #48
    a818:      	b	0xa820 <_stogir.floating.operands+0x178>
    a81c:      	movz	x11, #0x0, lsl #48
    a820:      	cmp	x11, #0x0
    a824:      	b.eq	0xa858 <_stogir.floating.operands+0x1b0>
    a828:      	uxtb	w16, w9
    a82c:      	cmp	w16, wzr
    a830:      	b.eq	0xa844 <_stogir.floating.operands+0x19c>
    a834:      	ldr	x9, [x0]
    a838:      	add	x9, x9, x10, lsl #4
    a83c:      	ldr	x9, [x9]
    a840:      	b	0xa850 <_stogir.floating.operands+0x1a8>
    a844:      	ldr	x9, [x0, #0x28]
    a848:      	add	x9, x9, x12, lsl #4
    a84c:      	ldr	x9, [x9]
    a850:      	mov	w10, #0x1               ; =1
    a854:      	b	0xa860 <_stogir.floating.operands+0x1b8>
    a858:      	movz	w10, #0x0, lsl #16
    a85c:      	movz	x9, #0x0, lsl #48
    a860:      	ubfx	x10, x10, #0, #32
    a864:      	lsr	x16, x10, #0
    a868:      	cmp	x16, #0x1
    a86c:      	b.eq	0xa888 <_stogir.floating.operands+0x1e0>
    a870:      	b.lo	0xa878 <_stogir.floating.operands+0x1d0>
    a874:      	b	0xa88c <_stogir.floating.operands+0x1e4>
    a878:      	cmp	x16, #0x0
    a87c:      	b.eq	0xa884 <_stogir.floating.operands+0x1dc>
    a880:      	b	0xa88c <_stogir.floating.operands+0x1e4>
    a884:      	b	0xa890 <_stogir.floating.operands+0x1e8>
    a888:      	b	0xa8b0 <_stogir.floating.operands+0x208>
    a88c:      	b	0xaac0 <_stogir.floating.operands+0x418>
    a890:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a890:  ARM64_RELOC_PAGE21	l_stogir.472
    a894:      	ldr	x20, [x20]
		000000000000a894:  ARM64_RELOC_PAGEOFF12	l_stogir.472
    a898:      	mov	x21, #0x18              ; =24
    a89c:      	b	0xa8cc <_stogir.floating.operands+0x224>
    a8a0:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a8a0:  ARM64_RELOC_PAGE21	l_stogir.473
    a8a4:      	ldr	x20, [x20]
		000000000000a8a4:  ARM64_RELOC_PAGEOFF12	l_stogir.473
    a8a8:      	mov	x21, #0x21              ; =33
    a8ac:      	b	0xa998 <_stogir.floating.operands+0x2f0>
    a8b0:      	ubfx	x9, x9, #0, #32
    a8b4:      	ubfx	x9, x9, #8, #8
    a8b8:      	cmp	x9, x19
    a8bc:      	b.eq	0xa8cc <_stogir.floating.operands+0x224>
    a8c0:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a8c0:  ARM64_RELOC_PAGE21	l_stogir.474
    a8c4:      	ldr	x20, [x20]
		000000000000a8c4:  ARM64_RELOC_PAGEOFF12	l_stogir.474
    a8c8:      	mov	x21, #0x1e              ; =30
    a8cc:      	cmp	x3, #0x2
    a8d0:      	b.ge	0xa8f4 <_stogir.floating.operands+0x24c>
    a8d4:      	add	x9, x3, #0x1
    a8d8:      	add	x3, x2, x3, lsl #2
    a8dc:      	ldr	w3, [x3]
    a8e0:      	movn	w17, #0x0, lsl #16
    a8e4:      	and	w10, w3, w17
    a8e8:      	mov	x3, x9
    a8ec:      	mov	w9, #0x1                ; =1
    a8f0:      	b	0xa8fc <_stogir.floating.operands+0x254>
    a8f4:      	movz	w9, #0x0, lsl #16
    a8f8:      	movz	w10, #0x0, lsl #16
    a8fc:      	ubfx	x9, x9, #0, #32
    a900:      	lsr	x16, x9, #0
    a904:      	cmp	x16, #0x1
    a908:      	b.eq	0xa924 <_stogir.floating.operands+0x27c>
    a90c:      	b.lo	0xa914 <_stogir.floating.operands+0x26c>
    a910:      	b	0xa928 <_stogir.floating.operands+0x280>
    a914:      	cmp	x16, #0x0
    a918:      	b.eq	0xa920 <_stogir.floating.operands+0x278>
    a91c:      	b	0xa928 <_stogir.floating.operands+0x280>
    a920:      	b	0xa988 <_stogir.floating.operands+0x2e0>
    a924:      	b	0xa92c <_stogir.floating.operands+0x284>
    a928:      	b	0xaab8 <_stogir.floating.operands+0x410>
    a92c:      	sxtw	x10, w10
    a930:      	cmp	x10, #0x0
    a934:      	cset	w9, gt
    a938:      	movz	x16, #0x0, lsl #48
    a93c:      	sub	x11, x16, x10
    a940:      	sub	x12, x11, #0x1
    a944:      	uxtb	w16, w9
    a948:      	cmp	w16, wzr
    a94c:      	b.eq	0xaa0c <_stogir.floating.operands+0x364>
    a950:      	ldr	x11, [x0, #0x8]
    a954:      	cmp	x10, x11
    a958:      	b.ge	0xa814 <_stogir.floating.operands+0x16c>
    a95c:      	ldr	x11, [x4, #0x8]
    a960:      	cmp	x10, x11
    a964:      	b.ge	0xa7a0 <_stogir.floating.operands+0xf8>
    a968:      	ldr	x11, [x0, #0x78]
    a96c:      	add	x11, x11, x10, lsl #2
    a970:      	ldr	w11, [x11]
    a974:      	sxtw	x11, w11
    a978:      	cmp	x11, #0x0
    a97c:      	cset	w11, ge
    a980:      	ubfx	x11, x11, #0, #8
    a984:      	b	0xa7a4 <_stogir.floating.operands+0xfc>
    a988:      	sxtw	x22, w5
    a98c:      	cmp	x22, #0x0
    a990:      	b.ne	0xa9b0 <_stogir.floating.operands+0x308>
    a994:      	mov	x23, x8
    a998:      	cmp	x21, #0x0
    a99c:      	b.ne	0xaa4c <_stogir.floating.operands+0x3a4>
    a9a0:      	and	x20, x19, #0xffffffff
    a9a4:      	movz	x0, #0x0, lsl #48
    a9a8:      	movz	x21, #0x0, lsl #48
    a9ac:      	b	0xaa50 <_stogir.floating.operands+0x3a8>
    a9b0:      	cmp	x1, #0x1d
    a9b4:      	b.ne	0xaad0 <_stogir.floating.operands+0x428>
    a9b8:      	mov	w1, w5
    a9bc:      	mov	x23, x8
    a9c0:      	add	x8, sp, #0x30
    a9c4:      	bl	0xa9c4 <_stogir.floating.operands+0x31c>
		000000000000a9c4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    a9c8:      	add	x16, sp, #0x30
    a9cc:      	ldr	w0, [x16]
    a9d0:      	lsr	x16, x0, #0
    a9d4:      	cmp	x16, #0x1
    a9d8:      	b.eq	0xa9f4 <_stogir.floating.operands+0x34c>
    a9dc:      	b.lo	0xa9e4 <_stogir.floating.operands+0x33c>
    a9e0:      	b	0xa9f8 <_stogir.floating.operands+0x350>
    a9e4:      	cmp	x16, #0x0
    a9e8:      	b.eq	0xa9f0 <_stogir.floating.operands+0x348>
    a9ec:      	b	0xa9f8 <_stogir.floating.operands+0x350>
    a9f0:      	b	0xa9fc <_stogir.floating.operands+0x354>
    a9f4:      	b	0xaa88 <_stogir.floating.operands+0x3e0>
    a9f8:      	b	0xaac8 <_stogir.floating.operands+0x420>
    a9fc:      	adrp	x20, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000a9fc:  ARM64_RELOC_PAGE21	l_stogir.475
    aa00:      	ldr	x20, [x20]
		000000000000aa00:  ARM64_RELOC_PAGEOFF12	l_stogir.475
    aa04:      	mov	x21, #0x16              ; =22
    aa08:      	b	0xa79c <_stogir.floating.operands+0xf4>
    aa0c:      	cmp	x10, #0x0
    aa10:      	b.ge	0xa81c <_stogir.floating.operands+0x174>
    aa14:      	ldr	x13, [x6, #0x8]
    aa18:      	ldr	x14, [x7, #0x8]
    aa1c:      	cmp	x13, x14
    aa20:      	b.ne	0xa7a8 <_stogir.floating.operands+0x100>
    aa24:      	cmp	x11, x13
    aa28:      	b.gt	0xaa80 <_stogir.floating.operands+0x3d8>
    aa2c:      	ldr	x11, [x0, #0x50]
    aa30:      	add	x11, x11, x12, lsl #2
    aa34:      	ldr	w11, [x11]
    aa38:      	sxtw	x11, w11
    aa3c:      	cmp	x11, #0x0
    aa40:      	cset	w11, gt
    aa44:      	ubfx	x11, x11, #0, #8
    aa48:      	b	0xaa84 <_stogir.floating.operands+0x3dc>
    aa4c:      	mov	x0, #0x1                ; =1
    aa50:      	str	x0, [x23]
    aa54:      	str	x20, [x23, #0x8]
    aa58:      	str	x21, [x23, #0x10]
    aa5c:      	ldr	x19, [sp, #0x60]
    aa60:      	ldr	x20, [sp, #0x68]
    aa64:      	ldr	x21, [sp, #0x70]
    aa68:      	ldr	x22, [sp, #0x78]
    aa6c:      	ldr	x23, [sp, #0x80]
    aa70:      	ldr	x29, [sp]
    aa74:      	ldr	x30, [sp, #0x8]
    aa78:      	add	sp, sp, #0x90
    aa7c:      	ret
    aa80:      	movz	x11, #0x0, lsl #48
    aa84:      	b	0xa7ac <_stogir.floating.operands+0x104>
    aa88:      	add	x16, sp, #0x30
    aa8c:      	ldr	x0, [x16, #0x8]
    aa90:      	cmp	x22, #0x0
    aa94:      	b.lt	0xa790 <_stogir.floating.operands+0xe8>
    aa98:      	uxtb	w0, w0
    aa9c:      	cmp	x0, #0x83
    aaa0:      	b.ge	0xa750 <_stogir.floating.operands+0xa8>
    aaa4:      	adrp	x17, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000aaa4:  ARM64_RELOC_PAGE21	l_stogir.476
    aaa8:      	ldr	x17, [x17]
		000000000000aaa8:  ARM64_RELOC_PAGEOFF12	l_stogir.476
    aaac:      	add	x1, x0, x17
    aab0:      	ldrb	w1, [x1]
    aab4:      	b	0xa754 <_stogir.floating.operands+0xac>
    aab8:      	brk	#0
    aabc:      	b	0xaab8 <_stogir.floating.operands+0x410>
    aac0:      	brk	#0
    aac4:      	b	0xaac0 <_stogir.floating.operands+0x418>
    aac8:      	brk	#0
    aacc:      	b	0xaac8 <_stogir.floating.operands+0x420>
    aad0:      	mov	x23, x8
    aad4:      	b	0xa8a0 <_stogir.floating.operands+0x1f8>

000000000000aad8 <_stogir.vector-lanes.operands>:
    aad8:      	sub	sp, sp, #0x110
    aadc:      	str	x29, [sp]
    aae0:      	str	x30, [sp, #0x8]
    aae4:      	mov	x29, sp
    aae8:      	str	x19, [sp, #0xc0]
    aaec:      	str	x20, [sp, #0xc8]
    aaf0:      	str	x21, [sp, #0xd0]
    aaf4:      	str	x22, [sp, #0xd8]
    aaf8:      	str	x23, [sp, #0xe0]
    aafc:      	str	x24, [sp, #0xe8]
    ab00:      	str	x25, [sp, #0xf0]
    ab04:      	str	x26, [sp, #0xf8]
    ab08:      	str	x27, [sp, #0x100]
    ab0c:      	str	x28, [sp, #0x108]
    ab10:      	sxtw	x4, w4
    ab14:      	cmp	x4, #0x0
    ab18:      	cset	w7, gt
    ab1c:      	movz	x16, #0x0, lsl #48
    ab20:      	sub	x9, x16, x4
    ab24:      	sub	x10, x9, #0x1
    ab28:      	uxtb	w16, w7
    ab2c:      	cmp	w16, wzr
    ab30:      	b.eq	0xab70 <_stogir.vector-lanes.operands+0x98>
    ab34:      	ldr	x9, [x0, #0x8]
    ab38:      	cmp	x4, x9
    ab3c:      	b.ge	0xabc8 <_stogir.vector-lanes.operands+0xf0>
    ab40:      	add	x9, x0, #0x78
    ab44:      	ldr	x9, [x9, #0x8]
    ab48:      	cmp	x4, x9
    ab4c:      	b.ge	0xacc8 <_stogir.vector-lanes.operands+0x1f0>
    ab50:      	ldr	x9, [x0, #0x78]
    ab54:      	add	x9, x9, x4, lsl #2
    ab58:      	ldr	w9, [x9]
    ab5c:      	sxtw	x9, w9
    ab60:      	cmp	x9, #0x0
    ab64:      	cset	w9, ge
    ab68:      	ubfx	x9, x9, #0, #8
    ab6c:      	b	0xaccc <_stogir.vector-lanes.operands+0x1f4>
    ab70:      	cmp	x4, #0x0
    ab74:      	b.ge	0xabd0 <_stogir.vector-lanes.operands+0xf8>
    ab78:      	add	x11, x0, #0x28
    ab7c:      	add	x12, x0, #0x50
    ab80:      	ldr	x11, [x11, #0x8]
    ab84:      	ldr	x12, [x12, #0x8]
    ab88:      	cmp	x11, x12
    ab8c:      	b.ne	0xabb8 <_stogir.vector-lanes.operands+0xe0>
    ab90:      	cmp	x9, x11
    ab94:      	b.gt	0xae7c <_stogir.vector-lanes.operands+0x3a4>
    ab98:      	ldr	x9, [x0, #0x50]
    ab9c:      	add	x9, x9, x10, lsl #2
    aba0:      	ldr	w9, [x9]
    aba4:      	sxtw	x9, w9
    aba8:      	cmp	x9, #0x0
    abac:      	cset	w9, gt
    abb0:      	ubfx	x9, x9, #0, #8
    abb4:      	b	0xae80 <_stogir.vector-lanes.operands+0x3a8>
    abb8:      	movz	x9, #0x0, lsl #48
    abbc:      	b	0xabd4 <_stogir.vector-lanes.operands+0xfc>
    abc0:      	mov	x2, #0x1                ; =1
    abc4:      	b	0xac58 <_stogir.vector-lanes.operands+0x180>
    abc8:      	movz	x9, #0x0, lsl #48
    abcc:      	b	0xabd4 <_stogir.vector-lanes.operands+0xfc>
    abd0:      	movz	x9, #0x0, lsl #48
    abd4:      	cmp	x9, #0x0
    abd8:      	b.eq	0xac0c <_stogir.vector-lanes.operands+0x134>
    abdc:      	uxtb	w16, w7
    abe0:      	cmp	w16, wzr
    abe4:      	b.eq	0xabf8 <_stogir.vector-lanes.operands+0x120>
    abe8:      	ldr	x7, [x0]
    abec:      	add	x4, x7, x4, lsl #4
    abf0:      	ldr	x4, [x4]
    abf4:      	b	0xac04 <_stogir.vector-lanes.operands+0x12c>
    abf8:      	ldr	x4, [x0, #0x28]
    abfc:      	add	x4, x4, x10, lsl #4
    ac00:      	ldr	x4, [x4]
    ac04:      	mov	w7, #0x1                ; =1
    ac08:      	b	0xac14 <_stogir.vector-lanes.operands+0x13c>
    ac0c:      	movz	w7, #0x0, lsl #16
    ac10:      	movz	x4, #0x0, lsl #48
    ac14:      	ubfx	x7, x7, #0, #32
    ac18:      	lsr	x16, x7, #0
    ac1c:      	cmp	x16, #0x1
    ac20:      	b.eq	0xac3c <_stogir.vector-lanes.operands+0x164>
    ac24:      	b.lo	0xac2c <_stogir.vector-lanes.operands+0x154>
    ac28:      	b	0xac40 <_stogir.vector-lanes.operands+0x168>
    ac2c:      	cmp	x16, #0x0
    ac30:      	b.eq	0xac38 <_stogir.vector-lanes.operands+0x160>
    ac34:      	b	0xac40 <_stogir.vector-lanes.operands+0x168>
    ac38:      	b	0xac44 <_stogir.vector-lanes.operands+0x16c>
    ac3c:      	b	0xaca0 <_stogir.vector-lanes.operands+0x1c8>
    ac40:      	b	0xb150 <_stogir.vector-lanes.operands+0x678>
    ac44:      	str	x8, [sp, #0xa0]
    ac48:      	mov	x2, #0x1                ; =1
    ac4c:      	adrp	x1, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000ac4c:  ARM64_RELOC_PAGE21	l_stogir.477
    ac50:      	ldr	x1, [x1]
		000000000000ac50:  ARM64_RELOC_PAGEOFF12	l_stogir.477
    ac54:      	mov	x0, #0x1b               ; =27
    ac58:      	ldr	x3, [sp, #0xa0]
    ac5c:      	str	x2, [x3]
    ac60:      	str	x1, [x3, #0x8]
    ac64:      	str	x0, [x3, #0x10]
    ac68:      	ldr	x19, [sp, #0xc0]
    ac6c:      	ldr	x20, [sp, #0xc8]
    ac70:      	ldr	x21, [sp, #0xd0]
    ac74:      	ldr	x22, [sp, #0xd8]
    ac78:      	ldr	x23, [sp, #0xe0]
    ac7c:      	ldr	x24, [sp, #0xe8]
    ac80:      	ldr	x25, [sp, #0xf0]
    ac84:      	ldr	x26, [sp, #0xf8]
    ac88:      	ldr	x27, [sp, #0x100]
    ac8c:      	ldr	x28, [sp, #0x108]
    ac90:      	ldr	x29, [sp]
    ac94:      	ldr	x30, [sp, #0x8]
    ac98:      	add	sp, sp, #0x110
    ac9c:      	ret
    aca0:      	sxtw	x19, w1
    aca4:      	sxtw	x1, w2
    aca8:      	orr	w7, w4, wzr
    acac:      	ubfx	x7, x7, #0, #32
    acb0:      	ubfx	x7, x7, #8, #8
    acb4:      	orr	x20, x7, xzr
    acb8:      	cmp	x19, #0x3d
    acbc:      	b.ne	0xacd0 <_stogir.vector-lanes.operands+0x1f8>
    acc0:      	mov	x21, x20
    acc4:      	b	0xacd4 <_stogir.vector-lanes.operands+0x1fc>
    acc8:      	movz	x9, #0x0, lsl #48
    accc:      	b	0xabcc <_stogir.vector-lanes.operands+0xf4>
    acd0:      	mov	x21, x1
    acd4:      	cmp	x19, #0x3d
    acd8:      	b.eq	0xace0 <_stogir.vector-lanes.operands+0x208>
    acdc:      	mov	x1, x20
    ace0:      	orr	w22, w21, wzr
    ace4:      	sxtw	x23, w22
    ace8:      	cmp	x23, #0xf
    acec:      	cset	w24, gt
    acf0:      	cmp	x23, #0x80
    acf4:      	cset	w25, lt
    acf8:      	and	w7, w22, #0xf
    acfc:      	ubfx	x7, x7, #0, #32
    ad00:      	cmp	x7, #0x1
    ad04:      	cset	w26, ge
    ad08:      	cmp	x7, #0xd
    ad0c:      	cset	w27, le
    ad10:      	cmp	x19, #0x3d
    ad14:      	b.lt	0xad64 <_stogir.vector-lanes.operands+0x28c>
    ad18:      	cmp	x19, #0x3f
    ad1c:      	b.gt	0xad64 <_stogir.vector-lanes.operands+0x28c>
    ad20:      	uxtb	w16, w24
    ad24:      	cmp	w16, wzr
    ad28:      	b.eq	0xad64 <_stogir.vector-lanes.operands+0x28c>
    ad2c:      	uxtb	w16, w25
    ad30:      	cmp	w16, wzr
    ad34:      	b.eq	0xad64 <_stogir.vector-lanes.operands+0x28c>
    ad38:      	uxtb	w16, w26
    ad3c:      	cmp	w16, wzr
    ad40:      	b.eq	0xad64 <_stogir.vector-lanes.operands+0x28c>
    ad44:      	uxtb	w16, w27
    ad48:      	cmp	w16, wzr
    ad4c:      	b.eq	0xad64 <_stogir.vector-lanes.operands+0x28c>
    ad50:      	sxtw	x7, w3
    ad54:      	cmp	x7, #0x4
    ad58:      	b.eq	0xb180 <_stogir.vector-lanes.operands+0x6a8>
    ad5c:      	cmp	x7, #0x8
    ad60:      	b.eq	0xb180 <_stogir.vector-lanes.operands+0x6a8>
    ad64:      	adrp	x28, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000ad64:  ARM64_RELOC_PAGE21	l_stogir.478
    ad68:      	ldr	x28, [x28]
		000000000000ad68:  ARM64_RELOC_PAGEOFF12	l_stogir.478
    ad6c:      	mov	x4, #0x36               ; =54
    ad70:      	sxtw	x7, w5
    ad74:      	sxtw	x9, w6
    ad78:      	cmp	x9, #0x0
    ad7c:      	cset	w9, eq
    ad80:      	cmp	x19, #0x3f
    ad84:      	b.ne	0xb1b4 <_stogir.vector-lanes.operands+0x6dc>
    ad88:      	mov	w0, w22
    ad8c:      	mov	w2, w3
    ad90:      	mov	x19, x8
    ad94:      	mov	x20, x4
    ad98:      	mov	x22, x7
    ad9c:      	mov	w23, w9
    ada0:      	bl	0xada0 <_stogir.vector-lanes.operands+0x2c8>
		000000000000ada0:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    ada4:      	cmp	x0, #0x0
    ada8:      	b.eq	0xaf88 <_stogir.vector-lanes.operands+0x4b0>
    adac:      	movz	x0, #0x0, lsl #48
    adb0:      	b	0xaf8c <_stogir.vector-lanes.operands+0x4b4>
    adb4:      	cmp	x19, #0x3d
    adb8:      	b.ne	0xb1c0 <_stogir.vector-lanes.operands+0x6e8>
    adbc:      	str	x0, [sp, #0x80]
    adc0:      	mov	w0, w22
    adc4:      	str	w3, [sp, #0xb0]
    adc8:      	str	x1, [sp, #0xa0]
    adcc:      	mov	w1, w2
    add0:      	mov	w2, w3
    add4:      	str	x4, [sp, #0xa8]
    add8:      	str	w8, [sp, #0xb8]
    addc:      	str	w22, [sp, #0x88]
    ade0:      	mov	x22, x7
    ade4:      	str	x28, [sp, #0x90]
    ade8:      	mov	w28, w5
    adec:      	str	x21, [sp, #0x98]
    adf0:      	mov	w21, w6
    adf4:      	bl	0xadf4 <_stogir.vector-lanes.operands+0x31c>
		000000000000adf4:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    adf8:      	cmp	x0, #0x0
    adfc:      	b.ne	0xae14 <_stogir.vector-lanes.operands+0x33c>
    ae00:      	adrp	x16, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000ae00:  ARM64_RELOC_PAGE21	l_stogir.479
    ae04:      	ldr	x16, [x16]
		000000000000ae04:  ARM64_RELOC_PAGEOFF12	l_stogir.479
    ae08:      	str	x16, [sp, #0x90]
    ae0c:      	mov	x16, #0x26              ; =38
    ae10:      	str	x16, [sp, #0xa8]
    ae14:      	cmp	x19, #0x3e
    ae18:      	b.ne	0xaeac <_stogir.vector-lanes.operands+0x3d4>
    ae1c:      	cmp	x20, x23
    ae20:      	cset	w0, eq
    ae24:      	uxtb	w16, w0
    ae28:      	cmp	w16, wzr
    ae2c:      	cset	x0, eq
    ae30:      	b	0xaeb0 <_stogir.vector-lanes.operands+0x3d8>
    ae34:      	mov	x0, #0x1                ; =1
    ae38:      	cmp	x0, #0x0
    ae3c:      	b.eq	0xae4c <_stogir.vector-lanes.operands+0x374>
    ae40:      	adrp	x28, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000ae40:  ARM64_RELOC_PAGE21	l_stogir.480
    ae44:      	ldr	x28, [x28]
		000000000000ae44:  ARM64_RELOC_PAGEOFF12	l_stogir.480
    ae48:      	mov	x20, #0x24              ; =36
    ae4c:      	str	x21, [sp, #0x98]
    ae50:      	str	x19, [sp, #0xa0]
    ae54:      	str	x28, [sp, #0x90]
    ae58:      	str	x20, [sp, #0xa8]
    ae5c:      	ldr	x0, [sp, #0xa8]
    ae60:      	cmp	x0, #0x0
    ae64:      	b.ne	0xb1f0 <_stogir.vector-lanes.operands+0x718>
    ae68:      	ldr	x0, [sp, #0x98]
    ae6c:      	and	x1, x0, #0xffffffff
    ae70:      	movz	x2, #0x0, lsl #48
    ae74:      	movz	x0, #0x0, lsl #48
    ae78:      	b	0xabc4 <_stogir.vector-lanes.operands+0xec>
    ae7c:      	movz	x9, #0x0, lsl #48
    ae80:      	b	0xabbc <_stogir.vector-lanes.operands+0xe4>
    ae84:      	ldr	w0, [sp, #0xb8]
    ae88:      	uxtb	w16, w0
    ae8c:      	cmp	w16, wzr
    ae90:      	b.ne	0xaea8 <_stogir.vector-lanes.operands+0x3d0>
    ae94:      	adrp	x16, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000ae94:  ARM64_RELOC_PAGE21	l_stogir.481
    ae98:      	ldr	x16, [x16]
		000000000000ae98:  ARM64_RELOC_PAGEOFF12	l_stogir.481
    ae9c:      	str	x16, [sp, #0x90]
    aea0:      	mov	x16, #0x20              ; =32
    aea4:      	str	x16, [sp, #0xa8]
    aea8:      	b	0xae5c <_stogir.vector-lanes.operands+0x384>
    aeac:      	movz	x0, #0x0, lsl #48
    aeb0:      	cmp	x0, #0x0
    aeb4:      	b.eq	0xaecc <_stogir.vector-lanes.operands+0x3f4>
    aeb8:      	adrp	x16, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000aeb8:  ARM64_RELOC_PAGE21	l_stogir.482
    aebc:      	ldr	x16, [x16]
		000000000000aebc:  ARM64_RELOC_PAGEOFF12	l_stogir.482
    aec0:      	str	x16, [sp, #0x90]
    aec4:      	mov	x16, #0x27              ; =39
    aec8:      	str	x16, [sp, #0xa8]
    aecc:      	add	x8, sp, #0x10
    aed0:      	ldr	x0, [sp, #0x80]
    aed4:      	mov	w1, w28
    aed8:      	bl	0xaed8 <_stogir.vector-lanes.operands+0x400>
		000000000000aed8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    aedc:      	add	x16, sp, #0x10
    aee0:      	ldr	w0, [x16]
    aee4:      	lsr	x16, x0, #0
    aee8:      	cmp	x16, #0x1
    aeec:      	b.eq	0xaf08 <_stogir.vector-lanes.operands+0x430>
    aef0:      	b.lo	0xaef8 <_stogir.vector-lanes.operands+0x420>
    aef4:      	b	0xaf0c <_stogir.vector-lanes.operands+0x434>
    aef8:      	cmp	x16, #0x0
    aefc:      	b.eq	0xaf04 <_stogir.vector-lanes.operands+0x42c>
    af00:      	b	0xaf0c <_stogir.vector-lanes.operands+0x434>
    af04:      	b	0xaf10 <_stogir.vector-lanes.operands+0x438>
    af08:      	b	0xafb4 <_stogir.vector-lanes.operands+0x4dc>
    af0c:      	b	0xb1a4 <_stogir.vector-lanes.operands+0x6cc>
    af10:      	adrp	x16, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000af10:  ARM64_RELOC_PAGE21	l_stogir.483
    af14:      	ldr	x16, [x16]
		000000000000af14:  ARM64_RELOC_PAGEOFF12	l_stogir.483
    af18:      	str	x16, [sp, #0x90]
    af1c:      	mov	x16, #0x19              ; =25
    af20:      	str	x16, [sp, #0xa8]
    af24:      	cmp	x19, #0x3e
    af28:      	b.ne	0xae84 <_stogir.vector-lanes.operands+0x3ac>
    af2c:      	add	x8, sp, #0x50
    af30:      	ldr	x0, [sp, #0x80]
    af34:      	mov	w1, w21
    af38:      	bl	0xaf38 <_stogir.vector-lanes.operands+0x460>
		000000000000af38:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    af3c:      	add	x16, sp, #0x50
    af40:      	ldr	w0, [x16]
    af44:      	lsr	x16, x0, #0
    af48:      	cmp	x16, #0x1
    af4c:      	b.eq	0xaf68 <_stogir.vector-lanes.operands+0x490>
    af50:      	b.lo	0xaf58 <_stogir.vector-lanes.operands+0x480>
    af54:      	b	0xaf6c <_stogir.vector-lanes.operands+0x494>
    af58:      	cmp	x16, #0x0
    af5c:      	b.eq	0xaf64 <_stogir.vector-lanes.operands+0x48c>
    af60:      	b	0xaf6c <_stogir.vector-lanes.operands+0x494>
    af64:      	b	0xaf70 <_stogir.vector-lanes.operands+0x498>
    af68:      	b	0xb0a0 <_stogir.vector-lanes.operands+0x5c8>
    af6c:      	b	0xb1ac <_stogir.vector-lanes.operands+0x6d4>
    af70:      	adrp	x16, 0xa000 <_stogir.conversion.policy+0x2ec>
		000000000000af70:  ARM64_RELOC_PAGE21	l_stogir.484
    af74:      	ldr	x16, [x16]
		000000000000af74:  ARM64_RELOC_PAGEOFF12	l_stogir.484
    af78:      	str	x16, [sp, #0x90]
    af7c:      	mov	x16, #0x20              ; =32
    af80:      	str	x16, [sp, #0xa8]
    af84:      	b	0xaea8 <_stogir.vector-lanes.operands+0x3d0>
    af88:      	mov	x0, #0x1                ; =1
    af8c:      	cmp	x0, #0x0
    af90:      	b.eq	0xaf9c <_stogir.vector-lanes.operands+0x4c4>
    af94:      	mov	x0, #0x1                ; =1
    af98:      	b	0xae38 <_stogir.vector-lanes.operands+0x360>
    af9c:      	cmp	x22, #0x0
    afa0:      	b.ne	0xae34 <_stogir.vector-lanes.operands+0x35c>
    afa4:      	uxtb	w16, w23
    afa8:      	cmp	w16, wzr
    afac:      	cset	x0, eq
    afb0:      	b	0xae38 <_stogir.vector-lanes.operands+0x360>
    afb4:      	add	x16, sp, #0x10
    afb8:      	orr	x0, x16, xzr
    afbc:      	add	x0, x0, #0x8
    afc0:      	add	x16, sp, #0x10
    afc4:      	ldr	x1, [x16, #0x8]
    afc8:      	add	x16, sp, #0x40
    afcc:      	str	x1, [x16]
    afd0:      	ldr	x0, [x0, #0x8]
    afd4:      	ubfx	x1, x1, #0, #32
    afd8:      	add	x16, sp, #0x40
    afdc:      	str	x0, [x16, #0x8]
    afe0:      	ubfx	x0, x1, #8, #8
    afe4:      	cmp	x0, #0x1
    afe8:      	b.lt	0xb010 <_stogir.vector-lanes.operands+0x538>
    afec:      	cmp	x0, #0xb
    aff0:      	b.gt	0xb010 <_stogir.vector-lanes.operands+0x538>
    aff4:      	add	x16, sp, #0x40
    aff8:      	ldr	w0, [x16]
    affc:      	uxtb	w0, w0
    b000:      	cmp	x0, #0x48
    b004:      	b.eq	0xb010 <_stogir.vector-lanes.operands+0x538>
    b008:      	cmp	x0, #0x46
    b00c:      	b.ne	0xb024 <_stogir.vector-lanes.operands+0x54c>
    b010:      	adrp	x16, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b010:  ARM64_RELOC_PAGE21	l_stogir.485
    b014:      	ldr	x16, [x16]
		000000000000b014:  ARM64_RELOC_PAGEOFF12	l_stogir.485
    b018:      	str	x16, [sp, #0x90]
    b01c:      	mov	x16, #0x2b              ; =43
    b020:      	str	x16, [sp, #0xa8]
    b024:      	cmp	x22, #0x0
    b028:      	b.ge	0xb054 <_stogir.vector-lanes.operands+0x57c>
    b02c:      	add	x16, sp, #0x40
    b030:      	ldr	w0, [x16]
    b034:      	uxtb	w1, w0
    b038:      	ubfx	x0, x0, #8, #8
    b03c:      	cmp	x1, x0
    b040:      	b.eq	0xb0f8 <_stogir.vector-lanes.operands+0x620>
    b044:      	cmp	x1, #0x49
    b048:      	b.eq	0xb0f8 <_stogir.vector-lanes.operands+0x620>
    b04c:      	movz	x0, #0x0, lsl #48
    b050:      	b	0xb09c <_stogir.vector-lanes.operands+0x5c4>
    b054:      	movz	x0, #0x0, lsl #48
    b058:      	cmp	x0, #0x0
    b05c:      	b.eq	0xb074 <_stogir.vector-lanes.operands+0x59c>
    b060:      	adrp	x16, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b060:  ARM64_RELOC_PAGE21	l_stogir.486
    b064:      	ldr	x16, [x16]
		000000000000b064:  ARM64_RELOC_PAGEOFF12	l_stogir.486
    b068:      	str	x16, [sp, #0x90]
    b06c:      	mov	x16, #0x28              ; =40
    b070:      	str	x16, [sp, #0xa8]
    b074:      	b	0xaf24 <_stogir.vector-lanes.operands+0x44c>
    b078:      	movn	w2, #0x0, lsl #16
    b07c:      	ubfx	x0, x0, #0, #32
    b080:      	ubfx	x1, x1, #0, #32
    b084:      	lsl	x1, x1, #32
    b088:      	orr	x0, x1, x0
    b08c:      	sxtw	x2, w2
    b090:      	cmp	x0, x2
    b094:      	cset	w0, hs
    b098:      	ubfx	x0, x0, #0, #8
    b09c:      	b	0xb058 <_stogir.vector-lanes.operands+0x580>
    b0a0:      	add	x16, sp, #0x50
    b0a4:      	ldr	x0, [x16, #0x8]
    b0a8:      	uxtb	w1, w0
    b0ac:      	cmp	x1, #0x48
    b0b0:      	b.eq	0xb0e0 <_stogir.vector-lanes.operands+0x608>
    b0b4:      	cmp	x1, #0x46
    b0b8:      	b.eq	0xb0e0 <_stogir.vector-lanes.operands+0x608>
    b0bc:      	ldr	w1, [sp, #0xb0]
    b0c0:      	ubfx	x0, x0, #0, #32
    b0c4:      	ubfx	x0, x0, #8, #8
    b0c8:      	mov	w2, w1
    b0cc:      	mov	w1, w0
    b0d0:      	ldr	w0, [sp, #0x88]
    b0d4:      	bl	0xb0d4 <_stogir.vector-lanes.operands+0x5fc>
		000000000000b0d4:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    b0d8:      	cmp	x0, #0x0
    b0dc:      	b.ne	0xb0f4 <_stogir.vector-lanes.operands+0x61c>
    b0e0:      	adrp	x16, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b0e0:  ARM64_RELOC_PAGE21	l_stogir.487
    b0e4:      	ldr	x16, [x16]
		000000000000b0e4:  ARM64_RELOC_PAGEOFF12	l_stogir.487
    b0e8:      	str	x16, [sp, #0x90]
    b0ec:      	mov	x16, #0x27              ; =39
    b0f0:      	str	x16, [sp, #0xa8]
    b0f4:      	b	0xaf84 <_stogir.vector-lanes.operands+0x4ac>
    b0f8:      	add	x16, sp, #0x40
    b0fc:      	ldr	w0, [x16, #0x8]
    b100:      	add	x16, sp, #0x40
    b104:      	ldr	w1, [x16, #0xc]
    b108:      	uxtb	w16, w24
    b10c:      	cmp	w16, wzr
    b110:      	b.eq	0xb158 <_stogir.vector-lanes.operands+0x680>
    b114:      	uxtb	w16, w25
    b118:      	cmp	w16, wzr
    b11c:      	b.eq	0xb158 <_stogir.vector-lanes.operands+0x680>
    b120:      	uxtb	w16, w26
    b124:      	cmp	w16, wzr
    b128:      	b.eq	0xb158 <_stogir.vector-lanes.operands+0x680>
    b12c:      	uxtb	w16, w27
    b130:      	cmp	w16, wzr
    b134:      	b.eq	0xb158 <_stogir.vector-lanes.operands+0x680>
    b138:      	ubfx	x2, x23, #4, #32
    b13c:      	sub	w2, w2, #0x1
    b140:      	sxtw	x2, w2
    b144:      	mov	x16, #0x1               ; =1
    b148:      	lsl	x2, x16, x2
    b14c:      	b	0xb07c <_stogir.vector-lanes.operands+0x5a4>
    b150:      	brk	#0
    b154:      	b	0xb150 <_stogir.vector-lanes.operands+0x678>
    b158:      	cmp	x23, #0x0
    b15c:      	b.lt	0xb078 <_stogir.vector-lanes.operands+0x5a0>
    b160:      	cmp	x23, #0xd
    b164:      	b.gt	0xb078 <_stogir.vector-lanes.operands+0x5a0>
    b168:      	cmp	x23, #0x0
    b16c:      	cset	w2, eq
    b170:      	uxtb	w16, w2
    b174:      	cmp	w16, wzr
    b178:      	cset	w2, eq
    b17c:      	b	0xb07c <_stogir.vector-lanes.operands+0x5a4>
    b180:      	uxtb	w4, w4
    b184:      	cmp	x4, #0x48
    b188:      	b.eq	0xad64 <_stogir.vector-lanes.operands+0x28c>
    b18c:      	cmp	x4, #0x46
    b190:      	b.eq	0xad64 <_stogir.vector-lanes.operands+0x28c>
    b194:      	adrp	x28, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b194:  ARM64_RELOC_PAGE21	l_stogir.488
    b198:      	ldr	x28, [x28]
		000000000000b198:  ARM64_RELOC_PAGEOFF12	l_stogir.488
    b19c:      	movz	x4, #0x0, lsl #48
    b1a0:      	b	0xad70 <_stogir.vector-lanes.operands+0x298>
    b1a4:      	brk	#0
    b1a8:      	b	0xb1a4 <_stogir.vector-lanes.operands+0x6cc>
    b1ac:      	brk	#0
    b1b0:      	b	0xb1ac <_stogir.vector-lanes.operands+0x6d4>
    b1b4:      	mov	x1, x8
    b1b8:      	mov	w8, w9
    b1bc:      	b	0xadb4 <_stogir.vector-lanes.operands+0x2dc>
    b1c0:      	str	x21, [sp, #0x98]
    b1c4:      	str	x1, [sp, #0xa0]
    b1c8:      	str	x0, [sp, #0x80]
    b1cc:      	str	w3, [sp, #0xb0]
    b1d0:      	mov	w21, w6
    b1d4:      	str	w22, [sp, #0x88]
    b1d8:      	mov	x22, x7
    b1dc:      	str	w8, [sp, #0xb8]
    b1e0:      	str	x28, [sp, #0x90]
    b1e4:      	mov	w28, w5
    b1e8:      	str	x4, [sp, #0xa8]
    b1ec:      	b	0xae14 <_stogir.vector-lanes.operands+0x33c>
    b1f0:      	ldr	x1, [sp, #0x90]
    b1f4:      	b	0xabc0 <_stogir.vector-lanes.operands+0xe8>

000000000000b1f8 <_stogir.vector-comparison.operands>:
    b1f8:      	sub	sp, sp, #0xc0
    b1fc:      	str	x29, [sp]
    b200:      	str	x30, [sp, #0x8]
    b204:      	mov	x29, sp
    b208:      	str	x19, [sp, #0x70]
    b20c:      	str	x20, [sp, #0x78]
    b210:      	str	x21, [sp, #0x80]
    b214:      	str	x22, [sp, #0x88]
    b218:      	str	x23, [sp, #0x90]
    b21c:      	str	x24, [sp, #0x98]
    b220:      	str	x25, [sp, #0xa0]
    b224:      	str	x26, [sp, #0xa8]
    b228:      	str	x27, [sp, #0xb0]
    b22c:      	mov	x19, x8
    b230:      	add	x8, sp, #0x10
    b234:      	mov	x20, x0
    b238:      	mov	w21, w1
    b23c:      	mov	w1, w4
    b240:      	mov	w22, w2
    b244:      	mov	w23, w3
    b248:      	mov	w24, w5
    b24c:      	bl	0xb24c <_stogir.vector-comparison.operands+0x54>
		000000000000b24c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b250:      	add	x16, sp, #0x10
    b254:      	ldr	w0, [x16]
    b258:      	lsr	x16, x0, #0
    b25c:      	cmp	x16, #0x1
    b260:      	b.eq	0xb27c <_stogir.vector-comparison.operands+0x84>
    b264:      	b.lo	0xb26c <_stogir.vector-comparison.operands+0x74>
    b268:      	b	0xb280 <_stogir.vector-comparison.operands+0x88>
    b26c:      	cmp	x16, #0x0
    b270:      	b.eq	0xb278 <_stogir.vector-comparison.operands+0x80>
    b274:      	b	0xb280 <_stogir.vector-comparison.operands+0x88>
    b278:      	b	0xb284 <_stogir.vector-comparison.operands+0x8c>
    b27c:      	b	0xb2d4 <_stogir.vector-comparison.operands+0xdc>
    b280:      	b	0xb450 <_stogir.vector-comparison.operands+0x258>
    b284:      	mov	x1, #0x1                ; =1
    b288:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b288:  ARM64_RELOC_PAGE21	l_stogir.489
    b28c:      	ldr	x0, [x0]
		000000000000b28c:  ARM64_RELOC_PAGEOFF12	l_stogir.489
    b290:      	mov	x2, #0x21               ; =33
    b294:      	str	x1, [x19]
    b298:      	str	x0, [x19, #0x8]
    b29c:      	str	x2, [x19, #0x10]
    b2a0:      	ldr	x19, [sp, #0x70]
    b2a4:      	ldr	x20, [sp, #0x78]
    b2a8:      	ldr	x21, [sp, #0x80]
    b2ac:      	ldr	x22, [sp, #0x88]
    b2b0:      	ldr	x23, [sp, #0x90]
    b2b4:      	ldr	x24, [sp, #0x98]
    b2b8:      	ldr	x25, [sp, #0xa0]
    b2bc:      	ldr	x26, [sp, #0xa8]
    b2c0:      	ldr	x27, [sp, #0xb0]
    b2c4:      	ldr	x29, [sp]
    b2c8:      	ldr	x30, [sp, #0x8]
    b2cc:      	add	sp, sp, #0xc0
    b2d0:      	ret
    b2d4:      	add	x16, sp, #0x10
    b2d8:      	ldr	x25, [x16, #0x8]
    b2dc:      	add	x8, sp, #0x40
    b2e0:      	mov	x0, x20
    b2e4:      	mov	w1, w24
    b2e8:      	bl	0xb2e8 <_stogir.vector-comparison.operands+0xf0>
		000000000000b2e8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b2ec:      	add	x16, sp, #0x40
    b2f0:      	ldr	w0, [x16]
    b2f4:      	lsr	x16, x0, #0
    b2f8:      	cmp	x16, #0x1
    b2fc:      	b.eq	0xb318 <_stogir.vector-comparison.operands+0x120>
    b300:      	b.lo	0xb308 <_stogir.vector-comparison.operands+0x110>
    b304:      	b	0xb31c <_stogir.vector-comparison.operands+0x124>
    b308:      	cmp	x16, #0x0
    b30c:      	b.eq	0xb314 <_stogir.vector-comparison.operands+0x11c>
    b310:      	b	0xb31c <_stogir.vector-comparison.operands+0x124>
    b314:      	b	0xb320 <_stogir.vector-comparison.operands+0x128>
    b318:      	b	0xb334 <_stogir.vector-comparison.operands+0x13c>
    b31c:      	b	0xb458 <_stogir.vector-comparison.operands+0x260>
    b320:      	mov	x1, #0x1                ; =1
    b324:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b324:  ARM64_RELOC_PAGE21	l_stogir.489
    b328:      	ldr	x0, [x0]
		000000000000b328:  ARM64_RELOC_PAGEOFF12	l_stogir.489
    b32c:      	mov	x2, #0x21               ; =33
    b330:      	b	0xb294 <_stogir.vector-comparison.operands+0x9c>
    b334:      	sxtw	x0, w23
    b338:      	add	x16, sp, #0x40
    b33c:      	ldr	x20, [x16, #0x8]
    b340:      	cmp	x0, #0x4
    b344:      	b.eq	0xb364 <_stogir.vector-comparison.operands+0x16c>
    b348:      	cmp	x0, #0x8
    b34c:      	b.eq	0xb364 <_stogir.vector-comparison.operands+0x16c>
    b350:      	mov	x1, #0x1                ; =1
    b354:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b354:  ARM64_RELOC_PAGE21	l_stogir.490
    b358:      	ldr	x0, [x0]
		000000000000b358:  ARM64_RELOC_PAGEOFF12	l_stogir.490
    b35c:      	mov	x2, #0x33               ; =51
    b360:      	b	0xb330 <_stogir.vector-comparison.operands+0x138>
    b364:      	orr	w0, w25, wzr
    b368:      	ubfx	x0, x0, #0, #32
    b36c:      	ubfx	x24, x0, #8, #8
    b370:      	orr	x26, x24, xzr
    b374:      	mov	w0, w21
    b378:      	mov	w1, w26
    b37c:      	bl	0xb37c <_stogir.vector-comparison.operands+0x184>
		000000000000b37c:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.valid-type?
    b380:      	cmp	x0, #0x0
    b384:      	b.eq	0xb350 <_stogir.vector-comparison.operands+0x158>
    b388:      	orr	w0, w20, wzr
    b38c:      	ubfx	x0, x0, #0, #32
    b390:      	ubfx	x0, x0, #8, #8
    b394:      	cmp	x24, x0
    b398:      	b.ne	0xb350 <_stogir.vector-comparison.operands+0x158>
    b39c:      	uxtb	w25, w25
    b3a0:      	cmp	x25, #0x48
    b3a4:      	b.eq	0xb350 <_stogir.vector-comparison.operands+0x158>
    b3a8:      	cmp	x25, #0x46
    b3ac:      	b.eq	0xb350 <_stogir.vector-comparison.operands+0x158>
    b3b0:      	uxtb	w20, w20
    b3b4:      	cmp	x20, #0x48
    b3b8:      	b.eq	0xb350 <_stogir.vector-comparison.operands+0x158>
    b3bc:      	cmp	x20, #0x46
    b3c0:      	b.eq	0xb350 <_stogir.vector-comparison.operands+0x158>
    b3c4:      	sxtw	x0, w22
    b3c8:      	cmp	x0, #0xf
    b3cc:      	cset	w1, gt
    b3d0:      	uxtb	w16, w1
    b3d4:      	cmp	w16, wzr
    b3d8:      	b.eq	0xb350 <_stogir.vector-comparison.operands+0x158>
    b3dc:      	cmp	x0, #0x80
    b3e0:      	cset	w2, lt
    b3e4:      	uxtb	w16, w2
    b3e8:      	cmp	w16, wzr
    b3ec:      	b.eq	0xb350 <_stogir.vector-comparison.operands+0x158>
    b3f0:      	and	w3, w22, #0xf
    b3f4:      	ubfx	x4, x3, #0, #32
    b3f8:      	cmp	x4, #0x1
    b3fc:      	cset	w5, ge
    b400:      	uxtb	w16, w5
    b404:      	cmp	w16, wzr
    b408:      	b.eq	0xb350 <_stogir.vector-comparison.operands+0x158>
    b40c:      	cmp	x4, #0xd
    b410:      	cset	w4, le
    b414:      	uxtb	w16, w4
    b418:      	cmp	w16, wzr
    b41c:      	b.eq	0xb350 <_stogir.vector-comparison.operands+0x158>
    b420:      	cmp	x0, #0x0
    b424:      	cset	w6, ge
    b428:      	cmp	x0, #0xd
    b42c:      	cset	w7, le
    b430:      	uxtb	w16, w6
    b434:      	cmp	w16, wzr
    b438:      	b.eq	0xb460 <_stogir.vector-comparison.operands+0x268>
    b43c:      	uxtb	w16, w7
    b440:      	cmp	w16, wzr
    b444:      	b.eq	0xb460 <_stogir.vector-comparison.operands+0x268>
    b448:      	mov	w8, w3
    b44c:      	b	0xb494 <_stogir.vector-comparison.operands+0x29c>
    b450:      	brk	#0
    b454:      	b	0xb450 <_stogir.vector-comparison.operands+0x258>
    b458:      	brk	#0
    b45c:      	b	0xb458 <_stogir.vector-comparison.operands+0x260>
    b460:      	uxtb	w16, w1
    b464:      	cmp	w16, wzr
    b468:      	b.eq	0xb490 <_stogir.vector-comparison.operands+0x298>
    b46c:      	uxtb	w16, w2
    b470:      	cmp	w16, wzr
    b474:      	b.eq	0xb490 <_stogir.vector-comparison.operands+0x298>
    b478:      	uxtb	w16, w5
    b47c:      	cmp	w16, wzr
    b480:      	b.eq	0xb490 <_stogir.vector-comparison.operands+0x298>
    b484:      	uxtb	w16, w4
    b488:      	cmp	w16, wzr
    b48c:      	b.ne	0xb448 <_stogir.vector-comparison.operands+0x250>
    b490:      	movn	w8, #0x0, lsl #16
    b494:      	sxtw	x8, w8
    b498:      	cmp	x8, #0x1
    b49c:      	b.lt	0xb350 <_stogir.vector-comparison.operands+0x158>
    b4a0:      	cmp	x8, #0xb
    b4a4:      	b.gt	0xb350 <_stogir.vector-comparison.operands+0x158>
    b4a8:      	uxtb	w16, w1
    b4ac:      	cmp	w16, wzr
    b4b0:      	b.eq	0xb4f0 <_stogir.vector-comparison.operands+0x2f8>
    b4b4:      	uxtb	w16, w2
    b4b8:      	cmp	w16, wzr
    b4bc:      	b.eq	0xb4f0 <_stogir.vector-comparison.operands+0x2f8>
    b4c0:      	uxtb	w16, w5
    b4c4:      	cmp	w16, wzr
    b4c8:      	b.eq	0xb4f0 <_stogir.vector-comparison.operands+0x2f8>
    b4cc:      	uxtb	w16, w4
    b4d0:      	cmp	w16, wzr
    b4d4:      	b.eq	0xb4f0 <_stogir.vector-comparison.operands+0x2f8>
    b4d8:      	ubfx	x0, x0, #4, #32
    b4dc:      	sub	w0, w0, #0x1
    b4e0:      	sxtw	x0, w0
    b4e4:      	mov	x16, #0x1               ; =1
    b4e8:      	lsl	x0, x16, x0
    b4ec:      	b	0xb5fc <_stogir.vector-comparison.operands+0x404>
    b4f0:      	uxtb	w16, w6
    b4f4:      	cmp	w16, wzr
    b4f8:      	b.eq	0xb5f8 <_stogir.vector-comparison.operands+0x400>
    b4fc:      	uxtb	w16, w7
    b500:      	cmp	w16, wzr
    b504:      	b.eq	0xb5f8 <_stogir.vector-comparison.operands+0x400>
    b508:      	cmp	x0, #0x0
    b50c:      	cset	w0, eq
    b510:      	uxtb	w16, w0
    b514:      	cmp	w16, wzr
    b518:      	cset	w0, eq
    b51c:      	b	0xb5fc <_stogir.vector-comparison.operands+0x404>
    b520:      	movn	w8, #0x0, lsl #16
    b524:      	sxtw	x0, w0
    b528:      	sxtw	x8, w8
    b52c:      	cmp	x0, x8
    b530:      	b.ne	0xb350 <_stogir.vector-comparison.operands+0x158>
    b534:      	uxtb	w16, w6
    b538:      	cmp	w16, wzr
    b53c:      	b.eq	0xb54c <_stogir.vector-comparison.operands+0x354>
    b540:      	uxtb	w16, w7
    b544:      	cmp	w16, wzr
    b548:      	b.ne	0xb580 <_stogir.vector-comparison.operands+0x388>
    b54c:      	uxtb	w16, w1
    b550:      	cmp	w16, wzr
    b554:      	b.eq	0xb57c <_stogir.vector-comparison.operands+0x384>
    b558:      	uxtb	w16, w2
    b55c:      	cmp	w16, wzr
    b560:      	b.eq	0xb57c <_stogir.vector-comparison.operands+0x384>
    b564:      	uxtb	w16, w5
    b568:      	cmp	w16, wzr
    b56c:      	b.eq	0xb57c <_stogir.vector-comparison.operands+0x384>
    b570:      	uxtb	w16, w4
    b574:      	cmp	w16, wzr
    b578:      	b.ne	0xb580 <_stogir.vector-comparison.operands+0x388>
    b57c:      	movn	w3, #0x0, lsl #16
    b580:      	mov	w0, w3
    b584:      	mov	w1, w23
    b588:      	bl	0xb588 <_stogir.vector-comparison.operands+0x390>
		000000000000b588:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    b58c:      	uxtb	w16, w21
    b590:      	cmp	w16, wzr
    b594:      	b.ne	0xb5cc <_stogir.vector-comparison.operands+0x3d4>
    b598:      	uxtb	w16, w22
    b59c:      	cmp	w16, wzr
    b5a0:      	b.eq	0xb5c8 <_stogir.vector-comparison.operands+0x3d0>
    b5a4:      	uxtb	w16, w25
    b5a8:      	cmp	w16, wzr
    b5ac:      	b.eq	0xb5c8 <_stogir.vector-comparison.operands+0x3d0>
    b5b0:      	uxtb	w16, w26
    b5b4:      	cmp	w16, wzr
    b5b8:      	b.eq	0xb5c8 <_stogir.vector-comparison.operands+0x3d0>
    b5bc:      	uxtb	w16, w27
    b5c0:      	cmp	w16, wzr
    b5c4:      	b.ne	0xb5cc <_stogir.vector-comparison.operands+0x3d4>
    b5c8:      	movn	w20, #0x0, lsl #16
    b5cc:      	sxtw	x21, w0
    b5d0:      	mov	w0, w20
    b5d4:      	mov	w1, w23
    b5d8:      	bl	0xb5d8 <_stogir.vector-comparison.operands+0x3e0>
		000000000000b5d8:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    b5dc:      	sxtw	x0, w0
    b5e0:      	cmp	x21, x0
    b5e4:      	b.ne	0xb350 <_stogir.vector-comparison.operands+0x158>
    b5e8:      	and	x0, x24, #0xffffffff
    b5ec:      	movz	x1, #0x0, lsl #48
    b5f0:      	movz	x2, #0x0, lsl #48
    b5f4:      	b	0xb360 <_stogir.vector-comparison.operands+0x168>
    b5f8:      	movn	w0, #0x0, lsl #16
    b5fc:      	and	w20, w26, #0xf
    b600:      	cmp	x24, #0xd
    b604:      	cset	w21, le
    b608:      	cmp	x24, #0xf
    b60c:      	cset	w22, gt
    b610:      	cmp	x24, #0x80
    b614:      	cset	w25, lt
    b618:      	ubfx	x8, x20, #0, #32
    b61c:      	cmp	x8, #0x1
    b620:      	cset	w26, ge
    b624:      	cmp	x8, #0xd
    b628:      	cset	w27, le
    b62c:      	uxtb	w16, w22
    b630:      	cmp	w16, wzr
    b634:      	b.eq	0xb674 <_stogir.vector-comparison.operands+0x47c>
    b638:      	uxtb	w16, w25
    b63c:      	cmp	w16, wzr
    b640:      	b.eq	0xb674 <_stogir.vector-comparison.operands+0x47c>
    b644:      	uxtb	w16, w26
    b648:      	cmp	w16, wzr
    b64c:      	b.eq	0xb674 <_stogir.vector-comparison.operands+0x47c>
    b650:      	uxtb	w16, w27
    b654:      	cmp	w16, wzr
    b658:      	b.eq	0xb674 <_stogir.vector-comparison.operands+0x47c>
    b65c:      	ubfx	x8, x24, #4, #32
    b660:      	sub	w8, w8, #0x1
    b664:      	sxtw	x8, w8
    b668:      	mov	x16, #0x1               ; =1
    b66c:      	lsl	x8, x16, x8
    b670:      	b	0xb524 <_stogir.vector-comparison.operands+0x32c>
    b674:      	uxtb	w16, w21
    b678:      	cmp	w16, wzr
    b67c:      	b.eq	0xb520 <_stogir.vector-comparison.operands+0x328>
    b680:      	cmp	x24, #0x0
    b684:      	cset	w8, eq
    b688:      	uxtb	w16, w8
    b68c:      	cmp	w16, wzr
    b690:      	cset	w8, eq
    b694:      	b	0xb524 <_stogir.vector-comparison.operands+0x32c>

000000000000b698 <_stogir.vector-arithmetic.operands>:
    b698:      	sub	sp, sp, #0x70
    b69c:      	str	x29, [sp]
    b6a0:      	str	x30, [sp, #0x8]
    b6a4:      	mov	x29, sp
    b6a8:      	str	x19, [sp, #0x20]
    b6ac:      	str	x20, [sp, #0x28]
    b6b0:      	str	x21, [sp, #0x30]
    b6b4:      	str	x22, [sp, #0x38]
    b6b8:      	str	x23, [sp, #0x40]
    b6bc:      	str	x24, [sp, #0x48]
    b6c0:      	str	x25, [sp, #0x50]
    b6c4:      	str	x26, [sp, #0x58]
    b6c8:      	str	x27, [sp, #0x60]
    b6cc:      	str	x28, [sp, #0x68]
    b6d0:      	mov	x19, x8
    b6d4:      	mov	x20, x0
    b6d8:      	mov	w0, w1
    b6dc:      	mov	w21, w1
    b6e0:      	mov	w1, w2
    b6e4:      	mov	w22, w2
    b6e8:      	mov	w23, w3
    b6ec:      	mov	w24, w4
    b6f0:      	mov	w25, w5
    b6f4:      	bl	0xb6f4 <_stogir.vector-arithmetic.operands+0x5c>
		000000000000b6f4:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.valid-type?
    b6f8:      	cmp	x0, #0x0
    b6fc:      	b.eq	0xb710 <_stogir.vector-arithmetic.operands+0x78>
    b700:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b700:  ARM64_RELOC_PAGE21	l_stogir.491
    b704:      	ldr	x0, [x0]
		000000000000b704:  ARM64_RELOC_PAGEOFF12	l_stogir.491
    b708:      	movz	x1, #0x0, lsl #48
    b70c:      	b	0xb71c <_stogir.vector-arithmetic.operands+0x84>
    b710:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b710:  ARM64_RELOC_PAGE21	l_stogir.492
    b714:      	ldr	x0, [x0]
		000000000000b714:  ARM64_RELOC_PAGEOFF12	l_stogir.492
    b718:      	mov	x1, #0x37               ; =55
    b71c:      	sxtw	x21, w21
    b720:      	sxtw	x22, w22
    b724:      	add	x2, x20, #0x78
    b728:      	add	x3, x20, #0x28
    b72c:      	add	x4, x20, #0x50
    b730:      	cmp	x21, #0x31
    b734:      	cset	w5, ge
    b738:      	cmp	x21, #0x35
    b73c:      	cset	w6, le
    b740:      	cmp	x21, #0x1f
    b744:      	cset	w7, eq
    b748:      	cmp	x21, #0x20
    b74c:      	cset	w8, eq
    b750:      	cmp	x21, #0x2d
    b754:      	cset	w9, eq
    b758:      	cmp	x21, #0x36
    b75c:      	cset	w10, eq
    b760:      	cmp	x21, #0x37
    b764:      	cset	w11, eq
    b768:      	cmp	x21, #0x38
    b76c:      	cset	w12, eq
    b770:      	cmp	x21, #0x39
    b774:      	cset	w13, eq
    b778:      	movz	x14, #0x0, lsl #48
    b77c:      	b	0xb8a0 <_stogir.vector-arithmetic.operands+0x208>
    b780:      	movz	x27, #0x0, lsl #48
    b784:      	b	0xb794 <_stogir.vector-arithmetic.operands+0xfc>
    b788:      	movz	x27, #0x0, lsl #48
    b78c:      	b	0xb79c <_stogir.vector-arithmetic.operands+0x104>
    b790:      	movz	x27, #0x0, lsl #48
    b794:      	b	0xb7ac <_stogir.vector-arithmetic.operands+0x114>
    b798:      	movz	x27, #0x0, lsl #48
    b79c:      	str	x2, [sp, #0x10]
    b7a0:      	str	x3, [sp, #0x18]
    b7a4:      	b	0xb7ac <_stogir.vector-arithmetic.operands+0x114>
    b7a8:      	movz	x27, #0x0, lsl #48
    b7ac:      	cmp	x27, #0x0
    b7b0:      	b.eq	0xb7e4 <_stogir.vector-arithmetic.operands+0x14c>
    b7b4:      	uxtb	w16, w26
    b7b8:      	cmp	w16, wzr
    b7bc:      	b.eq	0xb7d0 <_stogir.vector-arithmetic.operands+0x138>
    b7c0:      	ldr	x2, [x20]
    b7c4:      	add	x2, x2, x15, lsl #4
    b7c8:      	ldr	x2, [x2]
    b7cc:      	b	0xb7dc <_stogir.vector-arithmetic.operands+0x144>
    b7d0:      	ldr	x2, [x20, #0x28]
    b7d4:      	add	x2, x2, x28, lsl #4
    b7d8:      	ldr	x2, [x2]
    b7dc:      	mov	w3, #0x1                ; =1
    b7e0:      	b	0xb7ec <_stogir.vector-arithmetic.operands+0x154>
    b7e4:      	movz	w3, #0x0, lsl #16
    b7e8:      	movz	x2, #0x0, lsl #48
    b7ec:      	ubfx	x3, x3, #0, #32
    b7f0:      	lsr	x16, x3, #0
    b7f4:      	cmp	x16, #0x1
    b7f8:      	b.eq	0xb814 <_stogir.vector-arithmetic.operands+0x17c>
    b7fc:      	b.lo	0xb804 <_stogir.vector-arithmetic.operands+0x16c>
    b800:      	b	0xb818 <_stogir.vector-arithmetic.operands+0x180>
    b804:      	cmp	x16, #0x0
    b808:      	b.eq	0xb810 <_stogir.vector-arithmetic.operands+0x178>
    b80c:      	b	0xb818 <_stogir.vector-arithmetic.operands+0x180>
    b810:      	b	0xb81c <_stogir.vector-arithmetic.operands+0x184>
    b814:      	b	0xb82c <_stogir.vector-arithmetic.operands+0x194>
    b818:      	b	0xbb78 <_stogir.vector-arithmetic.operands+0x4e0>
    b81c:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b81c:  ARM64_RELOC_PAGE21	l_stogir.493
    b820:      	ldr	x0, [x0]
		000000000000b820:  ARM64_RELOC_PAGEOFF12	l_stogir.493
    b824:      	mov	x1, #0x21               ; =33
    b828:      	b	0xb890 <_stogir.vector-arithmetic.operands+0x1f8>
    b82c:      	orr	w3, w2, wzr
    b830:      	ubfx	x3, x3, #0, #32
    b834:      	ubfx	x3, x3, #8, #8
    b838:      	cmp	x3, x22
    b83c:      	b.eq	0xb870 <_stogir.vector-arithmetic.operands+0x1d8>
    b840:      	cmp	x14, #0x1
    b844:      	b.ne	0xb884 <_stogir.vector-arithmetic.operands+0x1ec>
    b848:      	uxtb	w16, w5
    b84c:      	cmp	w16, wzr
    b850:      	b.eq	0xb884 <_stogir.vector-arithmetic.operands+0x1ec>
    b854:      	uxtb	w16, w6
    b858:      	cmp	w16, wzr
    b85c:      	b.eq	0xb884 <_stogir.vector-arithmetic.operands+0x1ec>
    b860:      	cmp	x3, #0x1
    b864:      	b.lt	0xb884 <_stogir.vector-arithmetic.operands+0x1ec>
    b868:      	cmp	x3, #0xb
    b86c:      	b.gt	0xb884 <_stogir.vector-arithmetic.operands+0x1ec>
    b870:      	uxtb	w2, w2
    b874:      	cmp	x2, #0x48
    b878:      	b.eq	0xb884 <_stogir.vector-arithmetic.operands+0x1ec>
    b87c:      	cmp	x2, #0x46
    b880:      	b.ne	0xb890 <_stogir.vector-arithmetic.operands+0x1f8>
    b884:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b884:  ARM64_RELOC_PAGE21	l_stogir.494
    b888:      	ldr	x0, [x0]
		000000000000b888:  ARM64_RELOC_PAGEOFF12	l_stogir.494
    b88c:      	mov	x1, #0x32               ; =50
    b890:      	add	x2, x14, #0x1
    b894:      	sxtw	x14, w2
    b898:      	ldr	x2, [sp, #0x10]
    b89c:      	ldr	x3, [sp, #0x18]
    b8a0:      	uxtb	w16, w7
    b8a4:      	cmp	w16, wzr
    b8a8:      	b.ne	0xb8fc <_stogir.vector-arithmetic.operands+0x264>
    b8ac:      	uxtb	w16, w8
    b8b0:      	cmp	w16, wzr
    b8b4:      	b.ne	0xb8fc <_stogir.vector-arithmetic.operands+0x264>
    b8b8:      	uxtb	w16, w9
    b8bc:      	cmp	w16, wzr
    b8c0:      	b.ne	0xb8fc <_stogir.vector-arithmetic.operands+0x264>
    b8c4:      	uxtb	w16, w10
    b8c8:      	cmp	w16, wzr
    b8cc:      	b.ne	0xb8fc <_stogir.vector-arithmetic.operands+0x264>
    b8d0:      	uxtb	w16, w11
    b8d4:      	cmp	w16, wzr
    b8d8:      	b.ne	0xb8fc <_stogir.vector-arithmetic.operands+0x264>
    b8dc:      	uxtb	w16, w12
    b8e0:      	cmp	w16, wzr
    b8e4:      	b.ne	0xb8fc <_stogir.vector-arithmetic.operands+0x264>
    b8e8:      	uxtb	w16, w13
    b8ec:      	cmp	w16, wzr
    b8f0:      	b.ne	0xb8fc <_stogir.vector-arithmetic.operands+0x264>
    b8f4:      	mov	x15, #0x2               ; =2
    b8f8:      	b	0xb900 <_stogir.vector-arithmetic.operands+0x268>
    b8fc:      	mov	x15, #0x1               ; =1
    b900:      	cmp	x14, x15
    b904:      	b.ge	0xb9c0 <_stogir.vector-arithmetic.operands+0x328>
    b908:      	cmp	x14, #0x0
    b90c:      	b.ne	0xb918 <_stogir.vector-arithmetic.operands+0x280>
    b910:      	mov	w15, w23
    b914:      	b	0xb91c <_stogir.vector-arithmetic.operands+0x284>
    b918:      	mov	w15, w24
    b91c:      	sxtw	x15, w15
    b920:      	cmp	x15, #0x0
    b924:      	cset	w26, gt
    b928:      	movz	x16, #0x0, lsl #48
    b92c:      	sub	x27, x16, x15
    b930:      	sub	x28, x27, #0x1
    b934:      	uxtb	w16, w26
    b938:      	cmp	w16, wzr
    b93c:      	b.eq	0xb978 <_stogir.vector-arithmetic.operands+0x2e0>
    b940:      	ldr	x27, [x20, #0x8]
    b944:      	cmp	x15, x27
    b948:      	b.ge	0xb798 <_stogir.vector-arithmetic.operands+0x100>
    b94c:      	ldr	x27, [x2, #0x8]
    b950:      	cmp	x15, x27
    b954:      	b.ge	0xb788 <_stogir.vector-arithmetic.operands+0xf0>
    b958:      	ldr	x27, [x20, #0x78]
    b95c:      	add	x27, x27, x15, lsl #2
    b960:      	ldr	w27, [x27]
    b964:      	sxtw	x27, w27
    b968:      	cmp	x27, #0x0
    b96c:      	cset	w27, ge
    b970:      	ubfx	x27, x27, #0, #8
    b974:      	b	0xb78c <_stogir.vector-arithmetic.operands+0xf4>
    b978:      	cmp	x15, #0x0
    b97c:      	b.ge	0xbc54 <_stogir.vector-arithmetic.operands+0x5bc>
    b980:      	str	x2, [sp, #0x10]
    b984:      	ldr	x2, [x3, #0x8]
    b988:      	str	x3, [sp, #0x18]
    b98c:      	ldr	x3, [x4, #0x8]
    b990:      	cmp	x2, x3
    b994:      	b.ne	0xb790 <_stogir.vector-arithmetic.operands+0xf8>
    b998:      	cmp	x27, x2
    b99c:      	b.gt	0xb780 <_stogir.vector-arithmetic.operands+0xe8>
    b9a0:      	ldr	x2, [x20, #0x50]
    b9a4:      	add	x2, x2, x28, lsl #2
    b9a8:      	ldr	w2, [x2]
    b9ac:      	sxtw	x2, w2
    b9b0:      	cmp	x2, #0x0
    b9b4:      	cset	w2, gt
    b9b8:      	ubfx	x27, x2, #0, #8
    b9bc:      	b	0xb784 <_stogir.vector-arithmetic.operands+0xec>
    b9c0:      	sxtw	x25, w25
    b9c4:      	cmp	x25, #0x0
    b9c8:      	b.ne	0xb9d4 <_stogir.vector-arithmetic.operands+0x33c>
    b9cc:      	movz	x2, #0x0, lsl #48
    b9d0:      	b	0xb9d8 <_stogir.vector-arithmetic.operands+0x340>
    b9d4:      	mov	x2, #0x1                ; =1
    b9d8:      	cmp	x2, #0x0
    b9dc:      	b.eq	0xba08 <_stogir.vector-arithmetic.operands+0x370>
    b9e0:      	cmp	x21, #0x1d
    b9e4:      	b.ne	0xbac4 <_stogir.vector-arithmetic.operands+0x42c>
    b9e8:      	mov	x2, #0x1                ; =1
    b9ec:      	b	0xbad0 <_stogir.vector-arithmetic.operands+0x438>
    b9f0:      	mov	x2, #0x1                ; =1
    b9f4:      	cmp	x2, #0x0
    b9f8:      	b.eq	0xba68 <_stogir.vector-arithmetic.operands+0x3d0>
    b9fc:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000b9fc:  ARM64_RELOC_PAGE21	l_stogir.495
    ba00:      	ldr	x0, [x0]
		000000000000ba00:  ARM64_RELOC_PAGEOFF12	l_stogir.495
    ba04:      	mov	x1, #0x23               ; =35
    ba08:      	cmp	x1, #0x0
    ba0c:      	b.ne	0xba20 <_stogir.vector-arithmetic.operands+0x388>
    ba10:      	and	x0, x22, #0xffffffff
    ba14:      	movz	x2, #0x0, lsl #48
    ba18:      	movz	x1, #0x0, lsl #48
    ba1c:      	b	0xba24 <_stogir.vector-arithmetic.operands+0x38c>
    ba20:      	mov	x2, #0x1                ; =1
    ba24:      	str	x2, [x19]
    ba28:      	str	x0, [x19, #0x8]
    ba2c:      	str	x1, [x19, #0x10]
    ba30:      	ldr	x19, [sp, #0x20]
    ba34:      	ldr	x20, [sp, #0x28]
    ba38:      	ldr	x21, [sp, #0x30]
    ba3c:      	ldr	x22, [sp, #0x38]
    ba40:      	ldr	x23, [sp, #0x40]
    ba44:      	ldr	x24, [sp, #0x48]
    ba48:      	ldr	x25, [sp, #0x50]
    ba4c:      	ldr	x26, [sp, #0x58]
    ba50:      	ldr	x27, [sp, #0x60]
    ba54:      	ldr	x28, [sp, #0x68]
    ba58:      	ldr	x29, [sp]
    ba5c:      	ldr	x30, [sp, #0x8]
    ba60:      	add	sp, sp, #0x70
    ba64:      	ret
    ba68:      	cmp	x25, #0x0
    ba6c:      	cset	w2, gt
    ba70:      	movz	x16, #0x0, lsl #48
    ba74:      	sub	x3, x16, x25
    ba78:      	sub	x4, x3, #0x1
    ba7c:      	uxtb	w16, w2
    ba80:      	cmp	w16, wzr
    ba84:      	b.eq	0xbb30 <_stogir.vector-arithmetic.operands+0x498>
    ba88:      	ldr	x3, [x20, #0x8]
    ba8c:      	cmp	x25, x3
    ba90:      	b.ge	0xbb80 <_stogir.vector-arithmetic.operands+0x4e8>
    ba94:      	add	x3, x20, #0x78
    ba98:      	ldr	x3, [x3, #0x8]
    ba9c:      	cmp	x25, x3
    baa0:      	b.ge	0xbc3c <_stogir.vector-arithmetic.operands+0x5a4>
    baa4:      	ldr	x3, [x20, #0x78]
    baa8:      	add	x3, x3, x25, lsl #2
    baac:      	ldr	w3, [x3]
    bab0:      	sxtw	x3, w3
    bab4:      	cmp	x3, #0x0
    bab8:      	cset	w3, ge
    babc:      	ubfx	x3, x3, #0, #8
    bac0:      	b	0xbc40 <_stogir.vector-arithmetic.operands+0x5a8>
    bac4:      	cmp	x21, #0x1e
    bac8:      	cset	w2, eq
    bacc:      	ubfx	x2, x2, #0, #8
    bad0:      	cmp	x2, #0x0
    bad4:      	b.eq	0xb9f0 <_stogir.vector-arithmetic.operands+0x358>
    bad8:      	movz	x2, #0x0, lsl #48
    badc:      	b	0xb9f4 <_stogir.vector-arithmetic.operands+0x35c>
    bae0:      	movz	w3, #0x0, lsl #16
    bae4:      	uxtb	w16, w3
    bae8:      	and	w3, w16, #0x2
    baec:      	uxtb	w3, w3
    baf0:      	ubfx	x3, x3, #0, #8
    baf4:      	cmp	x3, #0x0
    baf8:      	cset	w3, eq
    bafc:      	uxtb	w16, w3
    bb00:      	cmp	w16, wzr
    bb04:      	cset	x3, eq
    bb08:      	cmp	x3, #0x0
    bb0c:      	b.ne	0xbb2c <_stogir.vector-arithmetic.operands+0x494>
    bb10:      	cmp	x2, #0x65
    bb14:      	b.eq	0xbb2c <_stogir.vector-arithmetic.operands+0x494>
    bb18:      	cmp	x2, #0x66
    bb1c:      	b.eq	0xbb2c <_stogir.vector-arithmetic.operands+0x494>
    bb20:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000bb20:  ARM64_RELOC_PAGE21	l_stogir.496
    bb24:      	ldr	x0, [x0]
		000000000000bb24:  ARM64_RELOC_PAGEOFF12	l_stogir.496
    bb28:      	mov	x1, #0x34               ; =52
    bb2c:      	b	0xba08 <_stogir.vector-arithmetic.operands+0x370>
    bb30:      	cmp	x25, #0x0
    bb34:      	b.ge	0xbb88 <_stogir.vector-arithmetic.operands+0x4f0>
    bb38:      	add	x5, x20, #0x28
    bb3c:      	add	x6, x20, #0x50
    bb40:      	ldr	x5, [x5, #0x8]
    bb44:      	ldr	x6, [x6, #0x8]
    bb48:      	cmp	x5, x6
    bb4c:      	b.ne	0xbc34 <_stogir.vector-arithmetic.operands+0x59c>
    bb50:      	cmp	x3, x5
    bb54:      	b.gt	0xbc44 <_stogir.vector-arithmetic.operands+0x5ac>
    bb58:      	ldr	x3, [x20, #0x50]
    bb5c:      	add	x3, x3, x4, lsl #2
    bb60:      	ldr	w3, [x3]
    bb64:      	sxtw	x3, w3
    bb68:      	cmp	x3, #0x0
    bb6c:      	cset	w3, gt
    bb70:      	ubfx	x3, x3, #0, #8
    bb74:      	b	0xbc48 <_stogir.vector-arithmetic.operands+0x5b0>
    bb78:      	brk	#0
    bb7c:      	b	0xbb78 <_stogir.vector-arithmetic.operands+0x4e0>
    bb80:      	movz	x3, #0x0, lsl #48
    bb84:      	b	0xbb8c <_stogir.vector-arithmetic.operands+0x4f4>
    bb88:      	movz	x3, #0x0, lsl #48
    bb8c:      	cmp	x3, #0x0
    bb90:      	b.eq	0xbbc4 <_stogir.vector-arithmetic.operands+0x52c>
    bb94:      	uxtb	w16, w2
    bb98:      	cmp	w16, wzr
    bb9c:      	b.eq	0xbbb0 <_stogir.vector-arithmetic.operands+0x518>
    bba0:      	ldr	x2, [x20]
    bba4:      	add	x2, x2, x25, lsl #4
    bba8:      	ldr	x2, [x2]
    bbac:      	b	0xbbbc <_stogir.vector-arithmetic.operands+0x524>
    bbb0:      	ldr	x2, [x20, #0x28]
    bbb4:      	add	x2, x2, x4, lsl #4
    bbb8:      	ldr	x2, [x2]
    bbbc:      	mov	w3, #0x1                ; =1
    bbc0:      	b	0xbbcc <_stogir.vector-arithmetic.operands+0x534>
    bbc4:      	movz	w3, #0x0, lsl #16
    bbc8:      	movz	x2, #0x0, lsl #48
    bbcc:      	ubfx	x3, x3, #0, #32
    bbd0:      	lsr	x16, x3, #0
    bbd4:      	cmp	x16, #0x1
    bbd8:      	b.eq	0xbbf4 <_stogir.vector-arithmetic.operands+0x55c>
    bbdc:      	b.lo	0xbbe4 <_stogir.vector-arithmetic.operands+0x54c>
    bbe0:      	b	0xbbf8 <_stogir.vector-arithmetic.operands+0x560>
    bbe4:      	cmp	x16, #0x0
    bbe8:      	b.eq	0xbbf0 <_stogir.vector-arithmetic.operands+0x558>
    bbec:      	b	0xbbf8 <_stogir.vector-arithmetic.operands+0x560>
    bbf0:      	b	0xbbfc <_stogir.vector-arithmetic.operands+0x564>
    bbf4:      	b	0xbc0c <_stogir.vector-arithmetic.operands+0x574>
    bbf8:      	b	0xbc4c <_stogir.vector-arithmetic.operands+0x5b4>
    bbfc:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000bbfc:  ARM64_RELOC_PAGE21	l_stogir.497
    bc00:      	ldr	x0, [x0]
		000000000000bc00:  ARM64_RELOC_PAGEOFF12	l_stogir.497
    bc04:      	mov	x1, #0x1d               ; =29
    bc08:      	b	0xbb2c <_stogir.vector-arithmetic.operands+0x494>
    bc0c:      	cmp	x25, #0x0
    bc10:      	b.le	0xbb20 <_stogir.vector-arithmetic.operands+0x488>
    bc14:      	uxtb	w2, w2
    bc18:      	cmp	x2, #0x83
    bc1c:      	b.ge	0xbae0 <_stogir.vector-arithmetic.operands+0x448>
    bc20:      	adrp	x17, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000bc20:  ARM64_RELOC_PAGE21	l_stogir.498
    bc24:      	ldr	x17, [x17]
		000000000000bc24:  ARM64_RELOC_PAGEOFF12	l_stogir.498
    bc28:      	add	x3, x2, x17
    bc2c:      	ldrb	w3, [x3]
    bc30:      	b	0xbae4 <_stogir.vector-arithmetic.operands+0x44c>
    bc34:      	movz	x3, #0x0, lsl #48
    bc38:      	b	0xbb8c <_stogir.vector-arithmetic.operands+0x4f4>
    bc3c:      	movz	x3, #0x0, lsl #48
    bc40:      	b	0xbb84 <_stogir.vector-arithmetic.operands+0x4ec>
    bc44:      	movz	x3, #0x0, lsl #48
    bc48:      	b	0xbc38 <_stogir.vector-arithmetic.operands+0x5a0>
    bc4c:      	brk	#0
    bc50:      	b	0xbc4c <_stogir.vector-arithmetic.operands+0x5b4>
    bc54:      	str	x2, [sp, #0x10]
    bc58:      	str	x3, [sp, #0x18]
    bc5c:      	b	0xb7a8 <_stogir.vector-arithmetic.operands+0x110>

000000000000bc60 <_stogir.switch.key>:
    bc60:      	sub	sp, sp, #0x30
    bc64:      	str	x19, [sp]
    bc68:      	str	x20, [sp, #0x8]
    bc6c:      	str	x21, [sp, #0x10]
    bc70:      	str	x22, [sp, #0x18]
    bc74:      	str	x23, [sp, #0x20]
    bc78:      	sxtw	x2, w2
    bc7c:      	cmp	x2, #0x1
    bc80:      	b.lt	0xbcf8 <_stogir.switch.key+0x98>
    bc84:      	cmp	x2, #0xb
    bc88:      	cset	w3, le
    bc8c:      	uxtb	w16, w3
    bc90:      	cmp	w16, wzr
    bc94:      	b.eq	0xbcf8 <_stogir.switch.key+0x98>
    bc98:      	sxtw	x1, w1
    bc9c:      	cmp	x1, #0x0
    bca0:      	cset	w4, gt
    bca4:      	movz	x16, #0x0, lsl #48
    bca8:      	sub	x5, x16, x1
    bcac:      	sub	x6, x5, #0x1
    bcb0:      	uxtb	w16, w4
    bcb4:      	cmp	w16, wzr
    bcb8:      	b.eq	0xbd70 <_stogir.switch.key+0x110>
    bcbc:      	ldr	x5, [x0, #0x8]
    bcc0:      	cmp	x1, x5
    bcc4:      	b.ge	0xbdb8 <_stogir.switch.key+0x158>
    bcc8:      	add	x5, x0, #0x78
    bccc:      	ldr	x5, [x5, #0x8]
    bcd0:      	cmp	x1, x5
    bcd4:      	b.ge	0xbef4 <_stogir.switch.key+0x294>
    bcd8:      	ldr	x5, [x0, #0x78]
    bcdc:      	add	x5, x5, x1, lsl #2
    bce0:      	ldr	w5, [x5]
    bce4:      	sxtw	x5, w5
    bce8:      	cmp	x5, #0x0
    bcec:      	cset	w5, ge
    bcf0:      	ubfx	x5, x5, #0, #8
    bcf4:      	b	0xbef8 <_stogir.switch.key+0x298>
    bcf8:      	mov	x1, #0x1                ; =1
    bcfc:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000bcfc:  ARM64_RELOC_PAGE21	l_stogir.499
    bd00:      	ldr	x0, [x0]
		000000000000bd00:  ARM64_RELOC_PAGEOFF12	l_stogir.499
    bd04:      	mov	x2, #0x24               ; =36
    bd08:      	str	x1, [x8]
    bd0c:      	str	x0, [x8, #0x8]
    bd10:      	str	x2, [x8, #0x10]
    bd14:      	ldr	x19, [sp]
    bd18:      	ldr	x20, [sp, #0x8]
    bd1c:      	ldr	x21, [sp, #0x10]
    bd20:      	ldr	x22, [sp, #0x18]
    bd24:      	ldr	x23, [sp, #0x20]
    bd28:      	add	sp, sp, #0x30
    bd2c:      	ret
    bd30:      	mov	w23, #0x1               ; =1
    bd34:      	cmp	x1, #0x0
    bd38:      	b.ge	0xbd5c <_stogir.switch.key+0xfc>
    bd3c:      	orr	w1, w4, wzr
    bd40:      	uxtb	w4, w4
    bd44:      	ubfx	x1, x1, #0, #32
    bd48:      	ubfx	x1, x1, #8, #8
    bd4c:      	cmp	x4, x1
    bd50:      	b.eq	0xbf9c <_stogir.switch.key+0x33c>
    bd54:      	cmp	x4, #0x49
    bd58:      	b.eq	0xbf9c <_stogir.switch.key+0x33c>
    bd5c:      	mov	x1, #0x1                ; =1
    bd60:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000bd60:  ARM64_RELOC_PAGE21	l_stogir.500
    bd64:      	ldr	x0, [x0]
		000000000000bd64:  ARM64_RELOC_PAGEOFF12	l_stogir.500
    bd68:      	mov	x2, #0x30               ; =48
    bd6c:      	b	0xbd08 <_stogir.switch.key+0xa8>
    bd70:      	cmp	x1, #0x0
    bd74:      	b.ge	0xbdc0 <_stogir.switch.key+0x160>
    bd78:      	add	x7, x0, #0x28
    bd7c:      	add	x9, x0, #0x50
    bd80:      	ldr	x7, [x7, #0x8]
    bd84:      	ldr	x9, [x9, #0x8]
    bd88:      	cmp	x7, x9
    bd8c:      	b.ne	0xbeec <_stogir.switch.key+0x28c>
    bd90:      	cmp	x5, x7
    bd94:      	b.gt	0xbf94 <_stogir.switch.key+0x334>
    bd98:      	ldr	x5, [x0, #0x50]
    bd9c:      	add	x5, x5, x6, lsl #2
    bda0:      	ldr	w5, [x5]
    bda4:      	sxtw	x5, w5
    bda8:      	cmp	x5, #0x0
    bdac:      	cset	w5, gt
    bdb0:      	ubfx	x5, x5, #0, #8
    bdb4:      	b	0xbf98 <_stogir.switch.key+0x338>
    bdb8:      	movz	x5, #0x0, lsl #48
    bdbc:      	b	0xbdc4 <_stogir.switch.key+0x164>
    bdc0:      	movz	x5, #0x0, lsl #48
    bdc4:      	cmp	x5, #0x0
    bdc8:      	b.eq	0xbe04 <_stogir.switch.key+0x1a4>
    bdcc:      	uxtb	w16, w4
    bdd0:      	cmp	w16, wzr
    bdd4:      	b.eq	0xbdec <_stogir.switch.key+0x18c>
    bdd8:      	ldr	x0, [x0]
    bddc:      	add	x0, x0, x1, lsl #4
    bde0:      	ldr	x4, [x0]
    bde4:      	ldr	x0, [x0, #0x8]
    bde8:      	b	0xbdfc <_stogir.switch.key+0x19c>
    bdec:      	ldr	x0, [x0, #0x28]
    bdf0:      	add	x0, x0, x6, lsl #4
    bdf4:      	ldr	x4, [x0]
    bdf8:      	ldr	x0, [x0, #0x8]
    bdfc:      	mov	w5, #0x1                ; =1
    be00:      	b	0xbe10 <_stogir.switch.key+0x1b0>
    be04:      	movz	w5, #0x0, lsl #16
    be08:      	movz	x4, #0x0, lsl #48
    be0c:      	movz	x0, #0x0, lsl #48
    be10:      	ubfx	x5, x5, #0, #32
    be14:      	lsr	x16, x5, #0
    be18:      	cmp	x16, #0x1
    be1c:      	b.eq	0xbe38 <_stogir.switch.key+0x1d8>
    be20:      	b.lo	0xbe28 <_stogir.switch.key+0x1c8>
    be24:      	b	0xbe3c <_stogir.switch.key+0x1dc>
    be28:      	cmp	x16, #0x0
    be2c:      	b.eq	0xbe34 <_stogir.switch.key+0x1d4>
    be30:      	b	0xbe3c <_stogir.switch.key+0x1dc>
    be34:      	b	0xbe40 <_stogir.switch.key+0x1e0>
    be38:      	b	0xbe54 <_stogir.switch.key+0x1f4>
    be3c:      	b	0xc030 <_stogir.switch.key+0x3d0>
    be40:      	mov	x1, #0x1                ; =1
    be44:      	adrp	x0, 0xb000 <_stogir.vector-lanes.operands+0x528>
		000000000000be44:  ARM64_RELOC_PAGE21	l_stogir.501
    be48:      	ldr	x0, [x0]
		000000000000be48:  ARM64_RELOC_PAGEOFF12	l_stogir.501
    be4c:      	mov	x2, #0x1c               ; =28
    be50:      	b	0xbd6c <_stogir.switch.key+0x10c>
    be54:      	cmp	x2, #0x1
    be58:      	cset	w5, eq
    be5c:      	cmp	x2, #0x0
    be60:      	cset	w6, eq
    be64:      	cmp	x2, #0x2
    be68:      	cset	w7, eq
    be6c:      	cmp	x2, #0x7
    be70:      	cset	w9, eq
    be74:      	cmp	x2, #0x8
    be78:      	cset	w10, eq
    be7c:      	cmp	x2, #0x3
    be80:      	cset	w11, eq
    be84:      	cmp	x2, #0x9
    be88:      	cset	w12, eq
    be8c:      	cmp	x2, #0x4
    be90:      	cset	w13, eq
    be94:      	cmp	x2, #0xa
    be98:      	cset	w14, eq
    be9c:      	cmp	x2, #0xd
    bea0:      	cset	w15, eq
    bea4:      	cmp	x2, #0x5
    bea8:      	cset	w19, eq
    beac:      	cmp	x2, #0xb
    beb0:      	cset	w20, eq
    beb4:      	cmp	x2, #0xc
    beb8:      	cset	w21, eq
    bebc:      	cmp	x2, #0x6
    bec0:      	cset	w22, eq
    bec4:      	uxtb	w16, w22
    bec8:      	cmp	w16, wzr
    becc:      	mov	w16, #0x8               ; =8
    bed0:      	movn	w17, #0x0, lsl #16
    bed4:      	csel	w22, w16, w17, ne
    bed8:      	uxtb	w16, w6
    bedc:      	cmp	w16, wzr
    bee0:      	b.eq	0xbefc <_stogir.switch.key+0x29c>
    bee4:      	movz	w23, #0x0, lsl #16
    bee8:      	b	0xbd34 <_stogir.switch.key+0xd4>
    beec:      	movz	x5, #0x0, lsl #48
    bef0:      	b	0xbdc4 <_stogir.switch.key+0x164>
    bef4:      	movz	x5, #0x0, lsl #48
    bef8:      	b	0xbdbc <_stogir.switch.key+0x15c>
    befc:      	uxtb	w16, w5
    bf00:      	cmp	w16, wzr
    bf04:      	b.ne	0xbd30 <_stogir.switch.key+0xd0>
    bf08:      	uxtb	w16, w7
    bf0c:      	cmp	w16, wzr
    bf10:      	b.ne	0xbd30 <_stogir.switch.key+0xd0>
    bf14:      	uxtb	w16, w9
    bf18:      	cmp	w16, wzr
    bf1c:      	b.ne	0xbd30 <_stogir.switch.key+0xd0>
    bf20:      	uxtb	w16, w10
    bf24:      	cmp	w16, wzr
    bf28:      	b.ne	0xbd30 <_stogir.switch.key+0xd0>
    bf2c:      	uxtb	w16, w11
    bf30:      	cmp	w16, wzr
    bf34:      	b.ne	0xc028 <_stogir.switch.key+0x3c8>
    bf38:      	uxtb	w16, w12
    bf3c:      	cmp	w16, wzr
    bf40:      	b.ne	0xc028 <_stogir.switch.key+0x3c8>
    bf44:      	uxtb	w16, w13
    bf48:      	cmp	w16, wzr
    bf4c:      	b.ne	0xc0ec <_stogir.switch.key+0x48c>
    bf50:      	uxtb	w16, w14
    bf54:      	cmp	w16, wzr
    bf58:      	b.ne	0xc0ec <_stogir.switch.key+0x48c>
    bf5c:      	uxtb	w16, w15
    bf60:      	cmp	w16, wzr
    bf64:      	b.ne	0xc0ec <_stogir.switch.key+0x48c>
    bf68:      	uxtb	w16, w19
    bf6c:      	cmp	w16, wzr
    bf70:      	b.ne	0xc0f4 <_stogir.switch.key+0x494>
    bf74:      	uxtb	w16, w20
    bf78:      	cmp	w16, wzr
    bf7c:      	b.ne	0xc0f4 <_stogir.switch.key+0x494>
    bf80:      	uxtb	w16, w21
    bf84:      	cmp	w16, wzr
    bf88:      	b.ne	0xc0f4 <_stogir.switch.key+0x494>
    bf8c:      	mov	w23, w22
    bf90:      	b	0xc0f8 <_stogir.switch.key+0x498>
    bf94:      	movz	x5, #0x0, lsl #48
    bf98:      	b	0xbef0 <_stogir.switch.key+0x290>
    bf9c:      	cmp	x1, x2
    bfa0:      	b.ne	0xbd5c <_stogir.switch.key+0xfc>
    bfa4:      	lsl	w1, w23, #3
    bfa8:      	orr	w4, w0, wzr
    bfac:      	sxtw	x1, w1
    bfb0:      	ubfx	x4, x4, #0, #32
    bfb4:      	lsr	x0, x0, #32
    bfb8:      	ubfx	x0, x0, #0, #32
    bfbc:      	lsl	x0, x0, #32
    bfc0:      	orr	x0, x0, x4
    bfc4:      	cmp	x1, #0x40
    bfc8:      	b.ge	0xbfd8 <_stogir.switch.key+0x378>
    bfcc:      	lsr	x1, x0, x1
    bfd0:      	cmp	x1, #0x0
    bfd4:      	b.ne	0xbd5c <_stogir.switch.key+0xfc>
    bfd8:      	uxtb	w16, w5
    bfdc:      	cmp	w16, wzr
    bfe0:      	b.eq	0xbfec <_stogir.switch.key+0x38c>
    bfe4:      	cmp	x0, #0x1
    bfe8:      	b.hi	0xbd5c <_stogir.switch.key+0xfc>
    bfec:      	cmp	x2, #0x7
    bff0:      	b.lt	0xc014 <_stogir.switch.key+0x3b4>
    bff4:      	uxtb	w16, w3
    bff8:      	cmp	w16, wzr
    bffc:      	b.eq	0xc014 <_stogir.switch.key+0x3b4>
    c000:      	uxtb	w16, w6
    c004:      	cmp	w16, wzr
    c008:      	b.eq	0xc054 <_stogir.switch.key+0x3f4>
    c00c:      	movz	w22, #0x0, lsl #16
    c010:      	b	0xc03c <_stogir.switch.key+0x3dc>
    c014:      	movz	x1, #0x0, lsl #48
    c018:      	eor	x0, x1, x0
    c01c:      	movz	x1, #0x0, lsl #48
    c020:      	movz	x2, #0x0, lsl #48
    c024:      	b	0xbd6c <_stogir.switch.key+0x10c>
    c028:      	mov	w23, #0x2               ; =2
    c02c:      	b	0xbd34 <_stogir.switch.key+0xd4>
    c030:      	brk	#0
    c034:      	b	0xc030 <_stogir.switch.key+0x3d0>
    c038:      	mov	w22, #0x1               ; =1
    c03c:      	lsl	w1, w22, #3
    c040:      	sub	w1, w1, #0x1
    c044:      	sxtw	x1, w1
    c048:      	mov	x16, #0x1               ; =1
    c04c:      	lsl	x1, x16, x1
    c050:      	b	0xc018 <_stogir.switch.key+0x3b8>
    c054:      	uxtb	w16, w5
    c058:      	cmp	w16, wzr
    c05c:      	b.ne	0xc038 <_stogir.switch.key+0x3d8>
    c060:      	uxtb	w16, w7
    c064:      	cmp	w16, wzr
    c068:      	b.ne	0xc038 <_stogir.switch.key+0x3d8>
    c06c:      	uxtb	w16, w9
    c070:      	cmp	w16, wzr
    c074:      	b.ne	0xc038 <_stogir.switch.key+0x3d8>
    c078:      	uxtb	w16, w10
    c07c:      	cmp	w16, wzr
    c080:      	b.ne	0xc038 <_stogir.switch.key+0x3d8>
    c084:      	uxtb	w16, w11
    c088:      	cmp	w16, wzr
    c08c:      	b.ne	0xc0fc <_stogir.switch.key+0x49c>
    c090:      	uxtb	w16, w12
    c094:      	cmp	w16, wzr
    c098:      	b.ne	0xc0fc <_stogir.switch.key+0x49c>
    c09c:      	uxtb	w16, w13
    c0a0:      	cmp	w16, wzr
    c0a4:      	b.ne	0xc104 <_stogir.switch.key+0x4a4>
    c0a8:      	uxtb	w16, w14
    c0ac:      	cmp	w16, wzr
    c0b0:      	b.ne	0xc104 <_stogir.switch.key+0x4a4>
    c0b4:      	uxtb	w16, w15
    c0b8:      	cmp	w16, wzr
    c0bc:      	b.ne	0xc104 <_stogir.switch.key+0x4a4>
    c0c0:      	uxtb	w16, w19
    c0c4:      	cmp	w16, wzr
    c0c8:      	b.ne	0xc0e4 <_stogir.switch.key+0x484>
    c0cc:      	uxtb	w16, w20
    c0d0:      	cmp	w16, wzr
    c0d4:      	b.ne	0xc0e4 <_stogir.switch.key+0x484>
    c0d8:      	uxtb	w16, w21
    c0dc:      	cmp	w16, wzr
    c0e0:      	b.eq	0xc0e8 <_stogir.switch.key+0x488>
    c0e4:      	mov	w22, #0x8               ; =8
    c0e8:      	b	0xc108 <_stogir.switch.key+0x4a8>
    c0ec:      	mov	w23, #0x4               ; =4
    c0f0:      	b	0xc02c <_stogir.switch.key+0x3cc>
    c0f4:      	mov	w23, #0x8               ; =8
    c0f8:      	b	0xc0f0 <_stogir.switch.key+0x490>
    c0fc:      	mov	w22, #0x2               ; =2
    c100:      	b	0xc03c <_stogir.switch.key+0x3dc>
    c104:      	mov	w22, #0x4               ; =4
    c108:      	b	0xc100 <_stogir.switch.key+0x4a0>

000000000000c10c <_stogir.stack.entry-allocation?>:
    c10c:      	sub	sp, sp, #0x10
    c110:      	add	x2, x0, #0x78
    c114:      	add	x3, x0, #0x28
    c118:      	add	x4, x0, #0x50
    c11c:      	add	x5, x0, #0x78
    c120:      	add	x6, x0, #0x28
    c124:      	add	x7, x0, #0x50
    c128:      	sxtw	x1, w1
    c12c:      	mov	x8, #0x1                ; =1
    c130:      	movz	x9, #0x0, lsl #48
    c134:      	b	0xc238 <_stogir.stack.entry-allocation?+0x12c>
    c138:      	movz	x12, #0x0, lsl #48
    c13c:      	b	0xc1a8 <_stogir.stack.entry-allocation?+0x9c>
    c140:      	movz	w11, #0x0, lsl #16
    c144:      	movz	x10, #0x0, lsl #48
    c148:      	ubfx	x11, x11, #0, #32
    c14c:      	lsr	x16, x11, #0
    c150:      	cmp	x16, #0x1
    c154:      	b.eq	0xc170 <_stogir.stack.entry-allocation?+0x64>
    c158:      	b.lo	0xc160 <_stogir.stack.entry-allocation?+0x54>
    c15c:      	b	0xc174 <_stogir.stack.entry-allocation?+0x68>
    c160:      	cmp	x16, #0x0
    c164:      	b.eq	0xc16c <_stogir.stack.entry-allocation?+0x60>
    c168:      	b	0xc174 <_stogir.stack.entry-allocation?+0x68>
    c16c:      	b	0xc194 <_stogir.stack.entry-allocation?+0x88>
    c170:      	b	0xc178 <_stogir.stack.entry-allocation?+0x6c>
    c174:      	b	0xc45c <_stogir.stack.entry-allocation?+0x350>
    c178:      	uxtb	w11, w10
    c17c:      	ubfx	x10, x10, #0, #32
    c180:      	ubfx	x10, x10, #8, #8
    c184:      	cmp	x11, x10
    c188:      	b.eq	0xc44c <_stogir.stack.entry-allocation?+0x340>
    c18c:      	cmp	x11, #0x49
    c190:      	b.eq	0xc44c <_stogir.stack.entry-allocation?+0x340>
    c194:      	movz	x8, #0x0, lsl #48
    c198:      	b	0xc318 <_stogir.stack.entry-allocation?+0x20c>
    c19c:      	movz	x12, #0x0, lsl #48
    c1a0:      	b	0xc1b0 <_stogir.stack.entry-allocation?+0xa4>
    c1a4:      	movz	x12, #0x0, lsl #48
    c1a8:      	b	0xc1b8 <_stogir.stack.entry-allocation?+0xac>
    c1ac:      	movz	x12, #0x0, lsl #48
    c1b0:      	b	0xc1b8 <_stogir.stack.entry-allocation?+0xac>
    c1b4:      	movz	x12, #0x0, lsl #48
    c1b8:      	cmp	x12, #0x0
    c1bc:      	b.eq	0xc1f8 <_stogir.stack.entry-allocation?+0xec>
    c1c0:      	uxtb	w16, w11
    c1c4:      	cmp	w16, wzr
    c1c8:      	b.eq	0xc1e0 <_stogir.stack.entry-allocation?+0xd4>
    c1cc:      	ldr	x11, [x0]
    c1d0:      	add	x10, x11, x10, lsl #4
    c1d4:      	ldr	x11, [x10]
    c1d8:      	ldr	x10, [x10, #0x8]
    c1dc:      	b	0xc1f0 <_stogir.stack.entry-allocation?+0xe4>
    c1e0:      	ldr	x10, [x0, #0x28]
    c1e4:      	add	x10, x10, x13, lsl #4
    c1e8:      	ldr	x11, [x10]
    c1ec:      	ldr	x10, [x10, #0x8]
    c1f0:      	mov	w12, #0x1               ; =1
    c1f4:      	b	0xc204 <_stogir.stack.entry-allocation?+0xf8>
    c1f8:      	movz	w12, #0x0, lsl #16
    c1fc:      	movz	x11, #0x0, lsl #48
    c200:      	movz	x10, #0x0, lsl #48
    c204:      	ubfx	x12, x12, #0, #32
    c208:      	lsr	x16, x12, #0
    c20c:      	cmp	x16, #0x1
    c210:      	b.eq	0xc22c <_stogir.stack.entry-allocation?+0x120>
    c214:      	b.lo	0xc21c <_stogir.stack.entry-allocation?+0x110>
    c218:      	b	0xc230 <_stogir.stack.entry-allocation?+0x124>
    c21c:      	cmp	x16, #0x0
    c220:      	b.eq	0xc228 <_stogir.stack.entry-allocation?+0x11c>
    c224:      	b	0xc230 <_stogir.stack.entry-allocation?+0x124>
    c228:      	b	0xc234 <_stogir.stack.entry-allocation?+0x128>
    c22c:      	b	0xc2e8 <_stogir.stack.entry-allocation?+0x1dc>
    c230:      	b	0xc3b8 <_stogir.stack.entry-allocation?+0x2ac>
    c234:      	movz	x8, #0x0, lsl #48
    c238:      	cmp	x8, #0x0
    c23c:      	b.eq	0xc3a0 <_stogir.stack.entry-allocation?+0x294>
    c240:      	cmp	x9, #0x0
    c244:      	b.ne	0xc3a0 <_stogir.stack.entry-allocation?+0x294>
    c248:      	orr	w10, w1, wzr
    c24c:      	sxtw	x10, w10
    c250:      	cmp	x10, #0x0
    c254:      	cset	w11, gt
    c258:      	movz	x16, #0x0, lsl #48
    c25c:      	sub	x12, x16, x10
    c260:      	sub	x13, x12, #0x1
    c264:      	uxtb	w16, w11
    c268:      	cmp	w16, wzr
    c26c:      	b.eq	0xc2a8 <_stogir.stack.entry-allocation?+0x19c>
    c270:      	ldr	x12, [x0, #0x8]
    c274:      	cmp	x10, x12
    c278:      	b.ge	0xc1ac <_stogir.stack.entry-allocation?+0xa0>
    c27c:      	ldr	x12, [x2, #0x8]
    c280:      	cmp	x10, x12
    c284:      	b.ge	0xc19c <_stogir.stack.entry-allocation?+0x90>
    c288:      	ldr	x12, [x0, #0x78]
    c28c:      	add	x12, x12, x10, lsl #2
    c290:      	ldr	w12, [x12]
    c294:      	sxtw	x12, w12
    c298:      	cmp	x12, #0x0
    c29c:      	cset	w12, ge
    c2a0:      	ubfx	x12, x12, #0, #8
    c2a4:      	b	0xc1a0 <_stogir.stack.entry-allocation?+0x94>
    c2a8:      	cmp	x10, #0x0
    c2ac:      	b.ge	0xc1b4 <_stogir.stack.entry-allocation?+0xa8>
    c2b0:      	ldr	x14, [x3, #0x8]
    c2b4:      	ldr	x15, [x4, #0x8]
    c2b8:      	cmp	x14, x15
    c2bc:      	b.ne	0xc1a4 <_stogir.stack.entry-allocation?+0x98>
    c2c0:      	cmp	x12, x14
    c2c4:      	b.gt	0xc138 <_stogir.stack.entry-allocation?+0x2c>
    c2c8:      	ldr	x12, [x0, #0x50]
    c2cc:      	add	x12, x12, x13, lsl #2
    c2d0:      	ldr	w12, [x12]
    c2d4:      	sxtw	x12, w12
    c2d8:      	cmp	x12, #0x0
    c2dc:      	cset	w12, gt
    c2e0:      	ubfx	x12, x12, #0, #8
    c2e4:      	b	0xc13c <_stogir.stack.entry-allocation?+0x30>
    c2e8:      	uxtb	w12, w11
    c2ec:      	asr	x13, x11, #32
    c2f0:      	mov	x16, sp
    c2f4:      	str	x11, [x16]
    c2f8:      	mov	x16, sp
    c2fc:      	str	x10, [x16, #0x8]
    c300:      	cmp	x12, #0x68
    c304:      	b.ne	0xc31c <_stogir.stack.entry-allocation?+0x210>
    c308:      	cmp	x13, #0x0
    c30c:      	cset	w8, eq
    c310:      	ubfx	x8, x8, #0, #8
    c314:      	mov	x9, #0x1                ; =1
    c318:      	b	0xc238 <_stogir.stack.entry-allocation?+0x12c>
    c31c:      	cmp	x1, #0x0
    c320:      	b.le	0xc194 <_stogir.stack.entry-allocation?+0x88>
    c324:      	cmp	x12, #0x51
    c328:      	b.ne	0xc194 <_stogir.stack.entry-allocation?+0x88>
    c32c:      	cmp	x13, #0x0
    c330:      	b.le	0xc194 <_stogir.stack.entry-allocation?+0x88>
    c334:      	cmp	x13, x1
    c338:      	b.ge	0xc194 <_stogir.stack.entry-allocation?+0x88>
    c33c:      	sxtw	x10, w10
    c340:      	cmp	x10, #0x0
    c344:      	b.ge	0xc194 <_stogir.stack.entry-allocation?+0x88>
    c348:      	cmp	x10, #0x0
    c34c:      	cset	w11, gt
    c350:      	movz	x16, #0x0, lsl #48
    c354:      	sub	x12, x16, x10
    c358:      	sub	x13, x12, #0x1
    c35c:      	uxtb	w16, w11
    c360:      	cmp	w16, wzr
    c364:      	b.eq	0xc404 <_stogir.stack.entry-allocation?+0x2f8>
    c368:      	ldr	x12, [x0, #0x8]
    c36c:      	cmp	x10, x12
    c370:      	b.ge	0xc3fc <_stogir.stack.entry-allocation?+0x2f0>
    c374:      	ldr	x12, [x5, #0x8]
    c378:      	cmp	x10, x12
    c37c:      	b.ge	0xc444 <_stogir.stack.entry-allocation?+0x338>
    c380:      	ldr	x12, [x0, #0x78]
    c384:      	add	x12, x12, x10, lsl #2
    c388:      	ldr	w12, [x12]
    c38c:      	sxtw	x12, w12
    c390:      	cmp	x12, #0x0
    c394:      	cset	w12, ge
    c398:      	ubfx	x12, x12, #0, #8
    c39c:      	b	0xc448 <_stogir.stack.entry-allocation?+0x33c>
    c3a0:      	cmp	x8, #0x0
    c3a4:      	b.ne	0xc3ac <_stogir.stack.entry-allocation?+0x2a0>
    c3a8:      	movz	x9, #0x0, lsl #48
    c3ac:      	mov	x0, x9
    c3b0:      	add	sp, sp, #0x10
    c3b4:      	ret
    c3b8:      	brk	#0
    c3bc:      	b	0xc3b8 <_stogir.stack.entry-allocation?+0x2ac>
    c3c0:      	ldr	x10, [x0, #0x28]
    c3c4:      	add	x10, x10, x13, lsl #4
    c3c8:      	ldr	x10, [x10]
    c3cc:      	mov	w11, #0x1               ; =1
    c3d0:      	b	0xc148 <_stogir.stack.entry-allocation?+0x3c>
    c3d4:      	movz	x12, #0x0, lsl #48
    c3d8:      	cmp	x12, #0x0
    c3dc:      	b.eq	0xc140 <_stogir.stack.entry-allocation?+0x34>
    c3e0:      	uxtb	w16, w11
    c3e4:      	cmp	w16, wzr
    c3e8:      	b.eq	0xc3c0 <_stogir.stack.entry-allocation?+0x2b4>
    c3ec:      	ldr	x11, [x0]
    c3f0:      	add	x10, x11, x10, lsl #4
    c3f4:      	ldr	x10, [x10]
    c3f8:      	b	0xc3cc <_stogir.stack.entry-allocation?+0x2c0>
    c3fc:      	movz	x12, #0x0, lsl #48
    c400:      	b	0xc3d8 <_stogir.stack.entry-allocation?+0x2cc>
    c404:      	ldr	x14, [x6, #0x8]
    c408:      	ldr	x15, [x7, #0x8]
    c40c:      	cmp	x14, x15
    c410:      	b.ne	0xc3d4 <_stogir.stack.entry-allocation?+0x2c8>
    c414:      	cmp	x12, x14
    c418:      	b.gt	0xc43c <_stogir.stack.entry-allocation?+0x330>
    c41c:      	ldr	x12, [x0, #0x50]
    c420:      	add	x12, x12, x13, lsl #2
    c424:      	ldr	w12, [x12]
    c428:      	sxtw	x12, w12
    c42c:      	cmp	x12, #0x0
    c430:      	cset	w12, gt
    c434:      	ubfx	x12, x12, #0, #8
    c438:      	b	0xc440 <_stogir.stack.entry-allocation?+0x334>
    c43c:      	movz	x12, #0x0, lsl #48
    c440:      	b	0xc3d8 <_stogir.stack.entry-allocation?+0x2cc>
    c444:      	movz	x12, #0x0, lsl #48
    c448:      	b	0xc400 <_stogir.stack.entry-allocation?+0x2f4>
    c44c:      	mov	x16, sp
    c450:      	ldr	w1, [x16, #0x4]
    c454:      	sxtw	x1, w1
    c458:      	b	0xc198 <_stogir.stack.entry-allocation?+0x8c>
    c45c:      	brk	#0
    c460:      	b	0xc45c <_stogir.stack.entry-allocation?+0x350>

000000000000c464 <_stogir.stack.constant-size-aligned>:
    c464:      	sub	sp, sp, #0x10
    c468:      	cmp	x2, #0x10
    c46c:      	b.lt	0xc4e8 <_stogir.stack.constant-size-aligned+0x84>
    c470:      	cmp	x2, #0x0
    c474:      	b.le	0xc4e8 <_stogir.stack.constant-size-aligned+0x84>
    c478:      	sub	x3, x2, #0x1
    c47c:      	and	x3, x3, x2
    c480:      	cmp	x3, #0x0
    c484:      	b.ne	0xc4e8 <_stogir.stack.constant-size-aligned+0x84>
    c488:      	sxtw	x1, w1
    c48c:      	cmp	x1, #0x0
    c490:      	cset	w3, gt
    c494:      	movz	x16, #0x0, lsl #48
    c498:      	sub	x4, x16, x1
    c49c:      	sub	x5, x4, #0x1
    c4a0:      	uxtb	w16, w3
    c4a4:      	cmp	w16, wzr
    c4a8:      	b.eq	0xc578 <_stogir.stack.constant-size-aligned+0x114>
    c4ac:      	ldr	x4, [x0, #0x8]
    c4b0:      	cmp	x1, x4
    c4b4:      	b.ge	0xc5c0 <_stogir.stack.constant-size-aligned+0x15c>
    c4b8:      	add	x4, x0, #0x78
    c4bc:      	ldr	x4, [x4, #0x8]
    c4c0:      	cmp	x1, x4
    c4c4:      	b.ge	0xc690 <_stogir.stack.constant-size-aligned+0x22c>
    c4c8:      	ldr	x4, [x0, #0x78]
    c4cc:      	add	x4, x4, x1, lsl #2
    c4d0:      	ldr	w4, [x4]
    c4d4:      	sxtw	x4, w4
    c4d8:      	cmp	x4, #0x0
    c4dc:      	cset	w4, ge
    c4e0:      	ubfx	x4, x4, #0, #8
    c4e4:      	b	0xc694 <_stogir.stack.constant-size-aligned+0x230>
    c4e8:      	mov	x1, #0x1                ; =1
    c4ec:      	adrp	x0, 0xc000 <_stogir.switch.key+0x3a0>
		000000000000c4ec:  ARM64_RELOC_PAGE21	l_stogir.502
    c4f0:      	ldr	x0, [x0]
		000000000000c4f0:  ARM64_RELOC_PAGEOFF12	l_stogir.502
    c4f4:      	mov	x2, #0x20               ; =32
    c4f8:      	str	x1, [x8]
    c4fc:      	str	x0, [x8, #0x8]
    c500:      	str	x2, [x8, #0x10]
    c504:      	add	sp, sp, #0x10
    c508:      	ret
    c50c:      	mov	w3, #0x1                ; =1
    c510:      	mov	x16, sp
    c514:      	ldr	w4, [x16, #0x8]
    c518:      	mov	x16, sp
    c51c:      	ldr	w5, [x16, #0xc]
    c520:      	cmp	x1, #0x0
    c524:      	b.ge	0xc564 <_stogir.stack.constant-size-aligned+0x100>
    c528:      	cmp	x0, #0x1
    c52c:      	b.lt	0xc564 <_stogir.stack.constant-size-aligned+0x100>
    c530:      	cmp	x0, #0xb
    c534:      	cset	w1, le
    c538:      	uxtb	w16, w1
    c53c:      	cmp	w16, wzr
    c540:      	b.eq	0xc564 <_stogir.stack.constant-size-aligned+0x100>
    c544:      	mov	x16, sp
    c548:      	ldr	w6, [x16]
    c54c:      	uxtb	w7, w6
    c550:      	ubfx	x6, x6, #8, #8
    c554:      	cmp	x7, x6
    c558:      	b.eq	0xc720 <_stogir.stack.constant-size-aligned+0x2bc>
    c55c:      	cmp	x7, #0x49
    c560:      	b.eq	0xc720 <_stogir.stack.constant-size-aligned+0x2bc>
    c564:      	mov	x1, #0x1                ; =1
    c568:      	adrp	x0, 0xc000 <_stogir.switch.key+0x3a0>
		000000000000c568:  ARM64_RELOC_PAGE21	l_stogir.503
    c56c:      	ldr	x0, [x0]
		000000000000c56c:  ARM64_RELOC_PAGEOFF12	l_stogir.503
    c570:      	mov	x2, #0x30               ; =48
    c574:      	b	0xc4f8 <_stogir.stack.constant-size-aligned+0x94>
    c578:      	cmp	x1, #0x0
    c57c:      	b.ge	0xc5c8 <_stogir.stack.constant-size-aligned+0x164>
    c580:      	add	x6, x0, #0x28
    c584:      	add	x7, x0, #0x50
    c588:      	ldr	x6, [x6, #0x8]
    c58c:      	ldr	x7, [x7, #0x8]
    c590:      	cmp	x6, x7
    c594:      	b.ne	0xc688 <_stogir.stack.constant-size-aligned+0x224>
    c598:      	cmp	x4, x6
    c59c:      	b.gt	0xc718 <_stogir.stack.constant-size-aligned+0x2b4>
    c5a0:      	ldr	x4, [x0, #0x50]
    c5a4:      	add	x4, x4, x5, lsl #2
    c5a8:      	ldr	w4, [x4]
    c5ac:      	sxtw	x4, w4
    c5b0:      	cmp	x4, #0x0
    c5b4:      	cset	w4, gt
    c5b8:      	ubfx	x4, x4, #0, #8
    c5bc:      	b	0xc71c <_stogir.stack.constant-size-aligned+0x2b8>
    c5c0:      	movz	x4, #0x0, lsl #48
    c5c4:      	b	0xc5cc <_stogir.stack.constant-size-aligned+0x168>
    c5c8:      	movz	x4, #0x0, lsl #48
    c5cc:      	cmp	x4, #0x0
    c5d0:      	b.eq	0xc60c <_stogir.stack.constant-size-aligned+0x1a8>
    c5d4:      	uxtb	w16, w3
    c5d8:      	cmp	w16, wzr
    c5dc:      	b.eq	0xc5f4 <_stogir.stack.constant-size-aligned+0x190>
    c5e0:      	ldr	x0, [x0]
    c5e4:      	add	x0, x0, x1, lsl #4
    c5e8:      	ldr	x3, [x0]
    c5ec:      	ldr	x0, [x0, #0x8]
    c5f0:      	b	0xc604 <_stogir.stack.constant-size-aligned+0x1a0>
    c5f4:      	ldr	x0, [x0, #0x28]
    c5f8:      	add	x0, x0, x5, lsl #4
    c5fc:      	ldr	x3, [x0]
    c600:      	ldr	x0, [x0, #0x8]
    c604:      	mov	w4, #0x1                ; =1
    c608:      	b	0xc618 <_stogir.stack.constant-size-aligned+0x1b4>
    c60c:      	movz	w4, #0x0, lsl #16
    c610:      	movz	x3, #0x0, lsl #48
    c614:      	movz	x0, #0x0, lsl #48
    c618:      	ubfx	x4, x4, #0, #32
    c61c:      	lsr	x16, x4, #0
    c620:      	cmp	x16, #0x1
    c624:      	b.eq	0xc640 <_stogir.stack.constant-size-aligned+0x1dc>
    c628:      	b.lo	0xc630 <_stogir.stack.constant-size-aligned+0x1cc>
    c62c:      	b	0xc644 <_stogir.stack.constant-size-aligned+0x1e0>
    c630:      	cmp	x16, #0x0
    c634:      	b.eq	0xc63c <_stogir.stack.constant-size-aligned+0x1d8>
    c638:      	b	0xc644 <_stogir.stack.constant-size-aligned+0x1e0>
    c63c:      	b	0xc648 <_stogir.stack.constant-size-aligned+0x1e4>
    c640:      	b	0xc65c <_stogir.stack.constant-size-aligned+0x1f8>
    c644:      	b	0xc7c4 <_stogir.stack.constant-size-aligned+0x360>
    c648:      	mov	x1, #0x1                ; =1
    c64c:      	adrp	x0, 0xc000 <_stogir.switch.key+0x3a0>
		000000000000c64c:  ARM64_RELOC_PAGE21	l_stogir.504
    c650:      	ldr	x0, [x0]
		000000000000c650:  ARM64_RELOC_PAGEOFF12	l_stogir.504
    c654:      	mov	x2, #0x18               ; =24
    c658:      	b	0xc574 <_stogir.stack.constant-size-aligned+0x110>
    c65c:      	orr	w4, w3, wzr
    c660:      	mov	x16, sp
    c664:      	str	x3, [x16]
    c668:      	ubfx	x4, x4, #0, #32
    c66c:      	mov	x16, sp
    c670:      	str	x0, [x16, #0x8]
    c674:      	ubfx	x0, x4, #8, #8
    c678:      	cmp	x0, #0x0
    c67c:      	b.ne	0xc698 <_stogir.stack.constant-size-aligned+0x234>
    c680:      	movz	w3, #0x0, lsl #16
    c684:      	b	0xc510 <_stogir.stack.constant-size-aligned+0xac>
    c688:      	movz	x4, #0x0, lsl #48
    c68c:      	b	0xc5cc <_stogir.stack.constant-size-aligned+0x168>
    c690:      	movz	x4, #0x0, lsl #48
    c694:      	b	0xc5c4 <_stogir.stack.constant-size-aligned+0x160>
    c698:      	cmp	x0, #0x1
    c69c:      	b.eq	0xc50c <_stogir.stack.constant-size-aligned+0xa8>
    c6a0:      	cmp	x0, #0x2
    c6a4:      	b.eq	0xc50c <_stogir.stack.constant-size-aligned+0xa8>
    c6a8:      	cmp	x0, #0x7
    c6ac:      	b.eq	0xc50c <_stogir.stack.constant-size-aligned+0xa8>
    c6b0:      	cmp	x0, #0x8
    c6b4:      	b.eq	0xc50c <_stogir.stack.constant-size-aligned+0xa8>
    c6b8:      	cmp	x0, #0x3
    c6bc:      	b.eq	0xc7bc <_stogir.stack.constant-size-aligned+0x358>
    c6c0:      	cmp	x0, #0x9
    c6c4:      	b.eq	0xc7bc <_stogir.stack.constant-size-aligned+0x358>
    c6c8:      	cmp	x0, #0x4
    c6cc:      	b.eq	0xc7cc <_stogir.stack.constant-size-aligned+0x368>
    c6d0:      	cmp	x0, #0xa
    c6d4:      	b.eq	0xc7cc <_stogir.stack.constant-size-aligned+0x368>
    c6d8:      	cmp	x0, #0xd
    c6dc:      	b.eq	0xc7cc <_stogir.stack.constant-size-aligned+0x368>
    c6e0:      	cmp	x0, #0x5
    c6e4:      	b.eq	0xc7d4 <_stogir.stack.constant-size-aligned+0x370>
    c6e8:      	cmp	x0, #0xb
    c6ec:      	b.eq	0xc7d4 <_stogir.stack.constant-size-aligned+0x370>
    c6f0:      	cmp	x0, #0xc
    c6f4:      	b.eq	0xc7d4 <_stogir.stack.constant-size-aligned+0x370>
    c6f8:      	cmp	x0, #0x6
    c6fc:      	cset	w3, eq
    c700:      	uxtb	w16, w3
    c704:      	cmp	w16, wzr
    c708:      	mov	w16, #0x8               ; =8
    c70c:      	movn	w17, #0x0, lsl #16
    c710:      	csel	w3, w16, w17, ne
    c714:      	b	0xc7d8 <_stogir.stack.constant-size-aligned+0x374>
    c718:      	movz	x4, #0x0, lsl #48
    c71c:      	b	0xc68c <_stogir.stack.constant-size-aligned+0x228>
    c720:      	sxtw	x6, w3
    c724:      	cmp	x6, #0x0
    c728:      	b.le	0xc564 <_stogir.stack.constant-size-aligned+0x100>
    c72c:      	lsl	w3, w3, #3
    c730:      	ubfx	x4, x4, #0, #32
    c734:      	ubfx	x5, x5, #0, #32
    c738:      	lsl	x5, x5, #32
    c73c:      	orr	x4, x5, x4
    c740:      	cmp	x6, #0x8
    c744:      	b.ge	0xc758 <_stogir.stack.constant-size-aligned+0x2f4>
    c748:      	sxtw	x5, w3
    c74c:      	lsr	x5, x4, x5
    c750:      	cmp	x5, #0x0
    c754:      	b.ne	0xc564 <_stogir.stack.constant-size-aligned+0x100>
    c758:      	cmp	x0, #0x7
    c75c:      	b.lt	0xc788 <_stogir.stack.constant-size-aligned+0x324>
    c760:      	uxtb	w16, w1
    c764:      	cmp	w16, wzr
    c768:      	b.eq	0xc788 <_stogir.stack.constant-size-aligned+0x324>
    c76c:      	sub	w0, w3, #0x1
    c770:      	sxtw	x0, w0
    c774:      	mov	x16, #0x1               ; =1
    c778:      	lsl	x0, x16, x0
    c77c:      	and	x0, x0, x4
    c780:      	cmp	x0, #0x0
    c784:      	b.ne	0xc564 <_stogir.stack.constant-size-aligned+0x100>
    c788:      	sub	x0, x2, #0x1
    c78c:      	mov	x16, #0x7fffffffffffffff ; =9223372036854775807
    c790:      	sub	x0, x16, x0
    c794:      	cmp	x4, x0
    c798:      	b.hi	0xc564 <_stogir.stack.constant-size-aligned+0x100>
    c79c:      	sub	x0, x2, #0x1
    c7a0:      	movz	x16, #0x0, lsl #48
    c7a4:      	sub	x1, x16, x2
    c7a8:      	add	x0, x0, x4
    c7ac:      	and	x0, x1, x0
    c7b0:      	movz	x1, #0x0, lsl #48
    c7b4:      	movz	x2, #0x0, lsl #48
    c7b8:      	b	0xc574 <_stogir.stack.constant-size-aligned+0x110>
    c7bc:      	mov	w3, #0x2                ; =2
    c7c0:      	b	0xc510 <_stogir.stack.constant-size-aligned+0xac>
    c7c4:      	brk	#0
    c7c8:      	b	0xc7c4 <_stogir.stack.constant-size-aligned+0x360>
    c7cc:      	mov	w3, #0x4                ; =4
    c7d0:      	b	0xc7c0 <_stogir.stack.constant-size-aligned+0x35c>
    c7d4:      	mov	w3, #0x8                ; =8
    c7d8:      	b	0xc7d0 <_stogir.stack.constant-size-aligned+0x36c>

000000000000c7dc <_stogir.vector-lanes.compatible?>:
    c7dc:      	and	w3, w0, #0xf
    c7e0:      	sxtw	x0, w0
    c7e4:      	ubfx	x4, x3, #0, #32
    c7e8:      	cmp	x0, #0xf
    c7ec:      	cset	w5, gt
    c7f0:      	cmp	x0, #0x80
    c7f4:      	cset	w6, lt
    c7f8:      	cmp	x4, #0x1
    c7fc:      	cset	w7, ge
    c800:      	cmp	x4, #0xd
    c804:      	cset	w4, le
    c808:      	cmp	x0, #0x0
    c80c:      	b.lt	0xc818 <_stogir.vector-lanes.compatible?+0x3c>
    c810:      	cmp	x0, #0xd
    c814:      	b.le	0xc84c <_stogir.vector-lanes.compatible?+0x70>
    c818:      	uxtb	w16, w5
    c81c:      	cmp	w16, wzr
    c820:      	b.eq	0xc848 <_stogir.vector-lanes.compatible?+0x6c>
    c824:      	uxtb	w16, w6
    c828:      	cmp	w16, wzr
    c82c:      	b.eq	0xc848 <_stogir.vector-lanes.compatible?+0x6c>
    c830:      	uxtb	w16, w7
    c834:      	cmp	w16, wzr
    c838:      	b.eq	0xc848 <_stogir.vector-lanes.compatible?+0x6c>
    c83c:      	uxtb	w16, w4
    c840:      	cmp	w16, wzr
    c844:      	b.ne	0xc84c <_stogir.vector-lanes.compatible?+0x70>
    c848:      	movn	w3, #0x0, lsl #16
    c84c:      	uxtb	w16, w5
    c850:      	cmp	w16, wzr
    c854:      	b.eq	0xc8b0 <_stogir.vector-lanes.compatible?+0xd4>
    c858:      	uxtb	w16, w6
    c85c:      	cmp	w16, wzr
    c860:      	b.eq	0xc8b0 <_stogir.vector-lanes.compatible?+0xd4>
    c864:      	uxtb	w16, w7
    c868:      	cmp	w16, wzr
    c86c:      	b.eq	0xc8b0 <_stogir.vector-lanes.compatible?+0xd4>
    c870:      	uxtb	w16, w4
    c874:      	cmp	w16, wzr
    c878:      	b.eq	0xc8b0 <_stogir.vector-lanes.compatible?+0xd4>
    c87c:      	sxtw	x0, w2
    c880:      	cmp	x0, #0x4
    c884:      	cset	w4, eq
    c888:      	cmp	x0, #0x8
    c88c:      	cset	w0, eq
    c890:      	uxtb	w16, w4
    c894:      	cmp	w16, wzr
    c898:      	b.ne	0xc8c0 <_stogir.vector-lanes.compatible?+0xe4>
    c89c:      	uxtb	w16, w0
    c8a0:      	cmp	w16, wzr
    c8a4:      	b.ne	0xc8c0 <_stogir.vector-lanes.compatible?+0xe4>
    c8a8:      	movz	x0, #0x0, lsl #48
    c8ac:      	b	0xc8bc <_stogir.vector-lanes.compatible?+0xe0>
    c8b0:      	movz	x0, #0x0, lsl #48
    c8b4:      	ret
    c8b8:      	movz	x0, #0x0, lsl #48
    c8bc:      	b	0xc8b4 <_stogir.vector-lanes.compatible?+0xd8>
    c8c0:      	sxtw	x1, w1
    c8c4:      	cmp	x1, #0x0
    c8c8:      	b.lt	0xc8b8 <_stogir.vector-lanes.compatible?+0xdc>
    c8cc:      	cmp	x1, #0xd
    c8d0:      	b.gt	0xc8b8 <_stogir.vector-lanes.compatible?+0xdc>
    c8d4:      	cmp	x1, #0x0
    c8d8:      	b.le	0xc8f0 <_stogir.vector-lanes.compatible?+0x114>
    c8dc:      	sxtw	x3, w3
    c8e0:      	cmp	x3, x1
    c8e4:      	b.ne	0xc8f8 <_stogir.vector-lanes.compatible?+0x11c>
    c8e8:      	mov	x0, #0x1                ; =1
    c8ec:      	b	0xc8f4 <_stogir.vector-lanes.compatible?+0x118>
    c8f0:      	movz	x0, #0x0, lsl #48
    c8f4:      	b	0xc8bc <_stogir.vector-lanes.compatible?+0xe0>
    c8f8:      	cmp	x3, #0x1
    c8fc:      	b.lt	0xc938 <_stogir.vector-lanes.compatible?+0x15c>
    c900:      	cmp	x3, #0xb
    c904:      	b.gt	0xc938 <_stogir.vector-lanes.compatible?+0x15c>
    c908:      	cmp	x1, #0x1
    c90c:      	b.lt	0xc940 <_stogir.vector-lanes.compatible?+0x164>
    c910:      	cmp	x1, #0xb
    c914:      	b.gt	0xc940 <_stogir.vector-lanes.compatible?+0x164>
    c918:      	uxtb	w16, w4
    c91c:      	cmp	w16, wzr
    c920:      	b.ne	0xc964 <_stogir.vector-lanes.compatible?+0x188>
    c924:      	uxtb	w16, w0
    c928:      	cmp	w16, wzr
    c92c:      	b.ne	0xc964 <_stogir.vector-lanes.compatible?+0x188>
    c930:      	movn	w3, #0x0, lsl #16
    c934:      	b	0xc978 <_stogir.vector-lanes.compatible?+0x19c>
    c938:      	movz	x0, #0x0, lsl #48
    c93c:      	b	0xc8ec <_stogir.vector-lanes.compatible?+0x110>
    c940:      	movz	x0, #0x0, lsl #48
    c944:      	b	0xc93c <_stogir.vector-lanes.compatible?+0x160>
    c948:      	mov	w2, #0x1                ; =1
    c94c:      	sxtw	x3, w3
    c950:      	sxtw	x2, w2
    c954:      	cmp	x3, x2
    c958:      	cset	w0, eq
    c95c:      	ubfx	x0, x0, #0, #8
    c960:      	b	0xc944 <_stogir.vector-lanes.compatible?+0x168>
    c964:      	cmp	x3, #0x0
    c968:      	b.ne	0xca18 <_stogir.vector-lanes.compatible?+0x23c>
    c96c:      	movz	w3, #0x0, lsl #16
    c970:      	b	0xc978 <_stogir.vector-lanes.compatible?+0x19c>
    c974:      	mov	w3, #0x1                ; =1
    c978:      	uxtb	w16, w4
    c97c:      	cmp	w16, wzr
    c980:      	b.ne	0xc998 <_stogir.vector-lanes.compatible?+0x1bc>
    c984:      	uxtb	w16, w0
    c988:      	cmp	w16, wzr
    c98c:      	b.ne	0xc998 <_stogir.vector-lanes.compatible?+0x1bc>
    c990:      	movn	w2, #0x0, lsl #16
    c994:      	b	0xc94c <_stogir.vector-lanes.compatible?+0x170>
    c998:      	cmp	x1, #0x0
    c99c:      	b.ne	0xc9a8 <_stogir.vector-lanes.compatible?+0x1cc>
    c9a0:      	movz	w2, #0x0, lsl #16
    c9a4:      	b	0xc94c <_stogir.vector-lanes.compatible?+0x170>
    c9a8:      	cmp	x1, #0x1
    c9ac:      	b.eq	0xc948 <_stogir.vector-lanes.compatible?+0x16c>
    c9b0:      	cmp	x1, #0x2
    c9b4:      	b.eq	0xc948 <_stogir.vector-lanes.compatible?+0x16c>
    c9b8:      	cmp	x1, #0x7
    c9bc:      	b.eq	0xc948 <_stogir.vector-lanes.compatible?+0x16c>
    c9c0:      	cmp	x1, #0x8
    c9c4:      	b.eq	0xc948 <_stogir.vector-lanes.compatible?+0x16c>
    c9c8:      	cmp	x1, #0x3
    c9cc:      	b.eq	0xca88 <_stogir.vector-lanes.compatible?+0x2ac>
    c9d0:      	cmp	x1, #0x9
    c9d4:      	b.eq	0xca88 <_stogir.vector-lanes.compatible?+0x2ac>
    c9d8:      	cmp	x1, #0x4
    c9dc:      	b.eq	0xca98 <_stogir.vector-lanes.compatible?+0x2bc>
    c9e0:      	cmp	x1, #0xa
    c9e4:      	b.eq	0xca98 <_stogir.vector-lanes.compatible?+0x2bc>
    c9e8:      	cmp	x1, #0xd
    c9ec:      	b.eq	0xca98 <_stogir.vector-lanes.compatible?+0x2bc>
    c9f0:      	cmp	x1, #0x5
    c9f4:      	b.eq	0xcaa8 <_stogir.vector-lanes.compatible?+0x2cc>
    c9f8:      	cmp	x1, #0xb
    c9fc:      	b.eq	0xcaa8 <_stogir.vector-lanes.compatible?+0x2cc>
    ca00:      	cmp	x1, #0xc
    ca04:      	b.eq	0xcaa8 <_stogir.vector-lanes.compatible?+0x2cc>
    ca08:      	cmp	x1, #0x6
    ca0c:      	b.eq	0xca14 <_stogir.vector-lanes.compatible?+0x238>
    ca10:      	movn	w2, #0x0, lsl #16
    ca14:      	b	0xcaac <_stogir.vector-lanes.compatible?+0x2d0>
    ca18:      	cmp	x3, #0x1
    ca1c:      	b.eq	0xc974 <_stogir.vector-lanes.compatible?+0x198>
    ca20:      	cmp	x3, #0x2
    ca24:      	b.eq	0xc974 <_stogir.vector-lanes.compatible?+0x198>
    ca28:      	cmp	x3, #0x7
    ca2c:      	b.eq	0xc974 <_stogir.vector-lanes.compatible?+0x198>
    ca30:      	cmp	x3, #0x8
    ca34:      	b.eq	0xc974 <_stogir.vector-lanes.compatible?+0x198>
    ca38:      	cmp	x3, #0x3
    ca3c:      	b.eq	0xca90 <_stogir.vector-lanes.compatible?+0x2b4>
    ca40:      	cmp	x3, #0x9
    ca44:      	b.eq	0xca90 <_stogir.vector-lanes.compatible?+0x2b4>
    ca48:      	cmp	x3, #0x4
    ca4c:      	b.eq	0xcaa0 <_stogir.vector-lanes.compatible?+0x2c4>
    ca50:      	cmp	x3, #0xa
    ca54:      	b.eq	0xcaa0 <_stogir.vector-lanes.compatible?+0x2c4>
    ca58:      	cmp	x3, #0xd
    ca5c:      	b.eq	0xcaa0 <_stogir.vector-lanes.compatible?+0x2c4>
    ca60:      	cmp	x3, #0x5
    ca64:      	b.eq	0xcab0 <_stogir.vector-lanes.compatible?+0x2d4>
    ca68:      	cmp	x3, #0xb
    ca6c:      	b.eq	0xcab0 <_stogir.vector-lanes.compatible?+0x2d4>
    ca70:      	cmp	x3, #0xc
    ca74:      	b.eq	0xcab0 <_stogir.vector-lanes.compatible?+0x2d4>
    ca78:      	cmp	x3, #0x6
    ca7c:      	b.ne	0xcab8 <_stogir.vector-lanes.compatible?+0x2dc>
    ca80:      	mov	w3, w2
    ca84:      	b	0xcabc <_stogir.vector-lanes.compatible?+0x2e0>
    ca88:      	mov	w2, #0x2                ; =2
    ca8c:      	b	0xc94c <_stogir.vector-lanes.compatible?+0x170>
    ca90:      	mov	w3, #0x2                ; =2
    ca94:      	b	0xc978 <_stogir.vector-lanes.compatible?+0x19c>
    ca98:      	mov	w2, #0x4                ; =4
    ca9c:      	b	0xca8c <_stogir.vector-lanes.compatible?+0x2b0>
    caa0:      	mov	w3, #0x4                ; =4
    caa4:      	b	0xca94 <_stogir.vector-lanes.compatible?+0x2b8>
    caa8:      	mov	w2, #0x8                ; =8
    caac:      	b	0xca9c <_stogir.vector-lanes.compatible?+0x2c0>
    cab0:      	mov	w3, #0x8                ; =8
    cab4:      	b	0xcaa4 <_stogir.vector-lanes.compatible?+0x2c8>
    cab8:      	movn	w3, #0x0, lsl #16
    cabc:      	b	0xcab4 <_stogir.vector-lanes.compatible?+0x2d8>

000000000000cac0 <_stogir.vector-comparison.valid-type?>:
    cac0:      	sxtw	x0, w0
    cac4:      	cmp	x0, #0xe
    cac8:      	b.lt	0xcb60 <_stogir.vector-comparison.valid-type?+0xa0>
    cacc:      	cmp	x0, #0x19
    cad0:      	b.gt	0xcb60 <_stogir.vector-comparison.valid-type?+0xa0>
    cad4:      	sxtw	x2, w1
    cad8:      	cmp	x2, #0xf
    cadc:      	cset	w3, gt
    cae0:      	uxtb	w16, w3
    cae4:      	cmp	w16, wzr
    cae8:      	b.eq	0xcb68 <_stogir.vector-comparison.valid-type?+0xa8>
    caec:      	cmp	x2, #0x80
    caf0:      	cset	w4, lt
    caf4:      	uxtb	w16, w4
    caf8:      	cmp	w16, wzr
    cafc:      	b.eq	0xcb68 <_stogir.vector-comparison.valid-type?+0xa8>
    cb00:      	and	w1, w1, #0xf
    cb04:      	ubfx	x5, x1, #0, #32
    cb08:      	cmp	x5, #0x1
    cb0c:      	cset	w6, ge
    cb10:      	uxtb	w16, w6
    cb14:      	cmp	w16, wzr
    cb18:      	b.eq	0xcb68 <_stogir.vector-comparison.valid-type?+0xa8>
    cb1c:      	cmp	x5, #0xd
    cb20:      	cset	w5, le
    cb24:      	uxtb	w16, w5
    cb28:      	cmp	w16, wzr
    cb2c:      	b.eq	0xcb68 <_stogir.vector-comparison.valid-type?+0xa8>
    cb30:      	cmp	x2, #0x0
    cb34:      	cset	w7, ge
    cb38:      	cmp	x2, #0xd
    cb3c:      	cset	w2, le
    cb40:      	uxtb	w16, w7
    cb44:      	cmp	w16, wzr
    cb48:      	b.eq	0xcb78 <_stogir.vector-comparison.valid-type?+0xb8>
    cb4c:      	uxtb	w16, w2
    cb50:      	cmp	w16, wzr
    cb54:      	b.eq	0xcb78 <_stogir.vector-comparison.valid-type?+0xb8>
    cb58:      	mov	w8, w1
    cb5c:      	b	0xcbac <_stogir.vector-comparison.valid-type?+0xec>
    cb60:      	movz	x0, #0x0, lsl #48
    cb64:      	ret
    cb68:      	movz	x0, #0x0, lsl #48
    cb6c:      	b	0xcb64 <_stogir.vector-comparison.valid-type?+0xa4>
    cb70:      	mov	x0, #0x1                ; =1
    cb74:      	b	0xcb6c <_stogir.vector-comparison.valid-type?+0xac>
    cb78:      	uxtb	w16, w3
    cb7c:      	cmp	w16, wzr
    cb80:      	b.eq	0xcba8 <_stogir.vector-comparison.valid-type?+0xe8>
    cb84:      	uxtb	w16, w4
    cb88:      	cmp	w16, wzr
    cb8c:      	b.eq	0xcba8 <_stogir.vector-comparison.valid-type?+0xe8>
    cb90:      	uxtb	w16, w6
    cb94:      	cmp	w16, wzr
    cb98:      	b.eq	0xcba8 <_stogir.vector-comparison.valid-type?+0xe8>
    cb9c:      	uxtb	w16, w5
    cba0:      	cmp	w16, wzr
    cba4:      	b.ne	0xcb58 <_stogir.vector-comparison.valid-type?+0x98>
    cba8:      	movn	w8, #0x0, lsl #16
    cbac:      	sxtw	x8, w8
    cbb0:      	cmp	x8, #0xc
    cbb4:      	b.eq	0xcb70 <_stogir.vector-comparison.valid-type?+0xb0>
    cbb8:      	cmp	x8, #0xd
    cbbc:      	b.eq	0xcb70 <_stogir.vector-comparison.valid-type?+0xb0>
    cbc0:      	uxtb	w16, w7
    cbc4:      	cmp	w16, wzr
    cbc8:      	b.eq	0xcbd8 <_stogir.vector-comparison.valid-type?+0x118>
    cbcc:      	uxtb	w16, w2
    cbd0:      	cmp	w16, wzr
    cbd4:      	b.ne	0xcc0c <_stogir.vector-comparison.valid-type?+0x14c>
    cbd8:      	uxtb	w16, w3
    cbdc:      	cmp	w16, wzr
    cbe0:      	b.eq	0xcc08 <_stogir.vector-comparison.valid-type?+0x148>
    cbe4:      	uxtb	w16, w4
    cbe8:      	cmp	w16, wzr
    cbec:      	b.eq	0xcc08 <_stogir.vector-comparison.valid-type?+0x148>
    cbf0:      	uxtb	w16, w6
    cbf4:      	cmp	w16, wzr
    cbf8:      	b.eq	0xcc08 <_stogir.vector-comparison.valid-type?+0x148>
    cbfc:      	uxtb	w16, w5
    cc00:      	cmp	w16, wzr
    cc04:      	b.ne	0xcc0c <_stogir.vector-comparison.valid-type?+0x14c>
    cc08:      	movn	w1, #0x0, lsl #16
    cc0c:      	sxtw	x1, w1
    cc10:      	cmp	x1, #0x1
    cc14:      	b.lt	0xcc30 <_stogir.vector-comparison.valid-type?+0x170>
    cc18:      	cmp	x1, #0xb
    cc1c:      	b.gt	0xcc30 <_stogir.vector-comparison.valid-type?+0x170>
    cc20:      	cmp	x0, #0x17
    cc24:      	cset	w0, le
    cc28:      	ubfx	x0, x0, #0, #8
    cc2c:      	b	0xcc34 <_stogir.vector-comparison.valid-type?+0x174>
    cc30:      	movz	x0, #0x0, lsl #48
    cc34:      	b	0xcb74 <_stogir.vector-comparison.valid-type?+0xb4>

000000000000cc38 <_stogir.vector-arithmetic.valid-type?>:
    cc38:      	sub	sp, sp, #0x30
    cc3c:      	str	x29, [sp]
    cc40:      	str	x30, [sp, #0x8]
    cc44:      	mov	x29, sp
    cc48:      	str	x19, [sp, #0x10]
    cc4c:      	str	x20, [sp, #0x18]
    cc50:      	str	x21, [sp, #0x20]
    cc54:      	str	x22, [sp, #0x28]
    cc58:      	sxtw	x2, w1
    cc5c:      	and	w1, w1, #0xf
    cc60:      	cmp	x2, #0xf
    cc64:      	cset	w3, gt
    cc68:      	cmp	x2, #0x80
    cc6c:      	cset	w4, lt
    cc70:      	ubfx	x5, x1, #0, #32
    cc74:      	cmp	x5, #0x1
    cc78:      	cset	w6, ge
    cc7c:      	cmp	x5, #0xd
    cc80:      	cset	w5, le
    cc84:      	cmp	x2, #0x0
    cc88:      	b.lt	0xcc94 <_stogir.vector-arithmetic.valid-type?+0x5c>
    cc8c:      	cmp	x2, #0xd
    cc90:      	b.le	0xccc8 <_stogir.vector-arithmetic.valid-type?+0x90>
    cc94:      	uxtb	w16, w3
    cc98:      	cmp	w16, wzr
    cc9c:      	b.eq	0xccc4 <_stogir.vector-arithmetic.valid-type?+0x8c>
    cca0:      	uxtb	w16, w4
    cca4:      	cmp	w16, wzr
    cca8:      	b.eq	0xccc4 <_stogir.vector-arithmetic.valid-type?+0x8c>
    ccac:      	uxtb	w16, w6
    ccb0:      	cmp	w16, wzr
    ccb4:      	b.eq	0xccc4 <_stogir.vector-arithmetic.valid-type?+0x8c>
    ccb8:      	uxtb	w16, w5
    ccbc:      	cmp	w16, wzr
    ccc0:      	b.ne	0xccc8 <_stogir.vector-arithmetic.valid-type?+0x90>
    ccc4:      	movn	w1, #0x0, lsl #16
    ccc8:      	uxtb	w16, w3
    cccc:      	cmp	w16, wzr
    ccd0:      	b.eq	0xceb8 <_stogir.vector-arithmetic.valid-type?+0x280>
    ccd4:      	uxtb	w16, w4
    ccd8:      	cmp	w16, wzr
    ccdc:      	b.eq	0xceb8 <_stogir.vector-arithmetic.valid-type?+0x280>
    cce0:      	uxtb	w16, w6
    cce4:      	cmp	w16, wzr
    cce8:      	b.eq	0xceb8 <_stogir.vector-arithmetic.valid-type?+0x280>
    ccec:      	uxtb	w16, w5
    ccf0:      	cmp	w16, wzr
    ccf4:      	b.eq	0xceb8 <_stogir.vector-arithmetic.valid-type?+0x280>
    ccf8:      	sxtw	x2, w0
    ccfc:      	cmp	x2, #0x1f
    cd00:      	cset	w19, eq
    cd04:      	cmp	x2, #0x20
    cd08:      	cset	w20, eq
    cd0c:      	cmp	x2, #0x2e
    cd10:      	cset	w3, eq
    cd14:      	cmp	x2, #0x2f
    cd18:      	cset	w4, eq
    cd1c:      	cmp	x2, #0x30
    cd20:      	cset	w5, eq
    cd24:      	cmp	x2, #0x1e
    cd28:      	cset	w6, eq
    cd2c:      	cmp	x2, #0x31
    cd30:      	cset	w7, ge
    cd34:      	cmp	x2, #0x35
    cd38:      	cset	w8, le
    cd3c:      	cmp	x2, #0x3a
    cd40:      	cset	w9, eq
    cd44:      	cmp	x2, #0x3b
    cd48:      	cset	w10, eq
    cd4c:      	cmp	x2, #0x2d
    cd50:      	cset	w11, eq
    cd54:      	cmp	x2, #0x36
    cd58:      	cset	w12, eq
    cd5c:      	cmp	x2, #0x37
    cd60:      	cset	w13, eq
    cd64:      	cmp	x2, #0x38
    cd68:      	cset	w14, eq
    cd6c:      	cmp	x2, #0x39
    cd70:      	cset	w15, eq
    cd74:      	uxtb	w16, w19
    cd78:      	cmp	w16, wzr
    cd7c:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cd80:      	uxtb	w16, w20
    cd84:      	cmp	w16, wzr
    cd88:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cd8c:      	uxtb	w16, w11
    cd90:      	cmp	w16, wzr
    cd94:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cd98:      	uxtb	w16, w12
    cd9c:      	cmp	w16, wzr
    cda0:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cda4:      	uxtb	w16, w13
    cda8:      	cmp	w16, wzr
    cdac:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cdb0:      	uxtb	w16, w14
    cdb4:      	cmp	w16, wzr
    cdb8:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cdbc:      	uxtb	w16, w15
    cdc0:      	cmp	w16, wzr
    cdc4:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cdc8:      	uxtb	w16, w9
    cdcc:      	cmp	w16, wzr
    cdd0:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cdd4:      	uxtb	w16, w10
    cdd8:      	cmp	w16, wzr
    cddc:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cde0:      	uxtb	w16, w7
    cde4:      	cmp	w16, wzr
    cde8:      	b.eq	0xcfc4 <_stogir.vector-arithmetic.valid-type?+0x38c>
    cdec:      	uxtb	w16, w8
    cdf0:      	cmp	w16, wzr
    cdf4:      	b.eq	0xcfc4 <_stogir.vector-arithmetic.valid-type?+0x38c>
    cdf8:      	sxtw	x2, w1
    cdfc:      	cmp	x2, #0xc
    ce00:      	cset	w21, eq
    ce04:      	cmp	x2, #0xd
    ce08:      	cset	w22, eq
    ce0c:      	uxtb	w16, w19
    ce10:      	cmp	w16, wzr
    ce14:      	b.ne	0xcee4 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    ce18:      	uxtb	w16, w20
    ce1c:      	cmp	w16, wzr
    ce20:      	b.ne	0xcee4 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    ce24:      	uxtb	w16, w11
    ce28:      	cmp	w16, wzr
    ce2c:      	b.ne	0xcee4 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    ce30:      	uxtb	w16, w12
    ce34:      	cmp	w16, wzr
    ce38:      	b.ne	0xcee4 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    ce3c:      	uxtb	w16, w13
    ce40:      	cmp	w16, wzr
    ce44:      	b.ne	0xcee4 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    ce48:      	uxtb	w16, w14
    ce4c:      	cmp	w16, wzr
    ce50:      	b.ne	0xcee4 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    ce54:      	uxtb	w16, w15
    ce58:      	cmp	w16, wzr
    ce5c:      	b.ne	0xcee4 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    ce60:      	cmp	x2, #0x1
    ce64:      	cset	w0, eq
    ce68:      	cmp	x2, #0x1
    ce6c:      	cset	w1, ge
    ce70:      	cmp	x2, #0xb
    ce74:      	cset	w2, le
    ce78:      	uxtb	w16, w7
    ce7c:      	cmp	w16, wzr
    ce80:      	b.eq	0xcf34 <_stogir.vector-arithmetic.valid-type?+0x2fc>
    ce84:      	uxtb	w16, w8
    ce88:      	cmp	w16, wzr
    ce8c:      	b.eq	0xcf34 <_stogir.vector-arithmetic.valid-type?+0x2fc>
    ce90:      	uxtb	w16, w1
    ce94:      	cmp	w16, wzr
    ce98:      	b.eq	0xcfbc <_stogir.vector-arithmetic.valid-type?+0x384>
    ce9c:      	uxtb	w16, w2
    cea0:      	cmp	w16, wzr
    cea4:      	b.eq	0xcfbc <_stogir.vector-arithmetic.valid-type?+0x384>
    cea8:      	uxtb	w16, w0
    ceac:      	cmp	w16, wzr
    ceb0:      	cset	x0, eq
    ceb4:      	b	0xcfc0 <_stogir.vector-arithmetic.valid-type?+0x388>
    ceb8:      	movz	x0, #0x0, lsl #48
    cebc:      	ldr	x19, [sp, #0x10]
    cec0:      	ldr	x20, [sp, #0x18]
    cec4:      	ldr	x21, [sp, #0x20]
    cec8:      	ldr	x22, [sp, #0x28]
    cecc:      	ldr	x29, [sp]
    ced0:      	ldr	x30, [sp, #0x8]
    ced4:      	add	sp, sp, #0x30
    ced8:      	ret
    cedc:      	ubfx	x0, x20, #0, #8
    cee0:      	b	0xcebc <_stogir.vector-arithmetic.valid-type?+0x284>
    cee4:      	bl	0xcee4 <_stogir.vector-arithmetic.valid-type?+0x2ac>
		000000000000cee4:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    cee8:      	cmp	x0, #0x0
    ceec:      	b.eq	0xcef8 <_stogir.vector-arithmetic.valid-type?+0x2c0>
    cef0:      	mov	x0, #0x1                ; =1
    cef4:      	b	0xcee0 <_stogir.vector-arithmetic.valid-type?+0x2a8>
    cef8:      	uxtb	w16, w21
    cefc:      	cmp	w16, wzr
    cf00:      	b.ne	0xcf18 <_stogir.vector-arithmetic.valid-type?+0x2e0>
    cf04:      	uxtb	w16, w22
    cf08:      	cmp	w16, wzr
    cf0c:      	b.ne	0xcf18 <_stogir.vector-arithmetic.valid-type?+0x2e0>
    cf10:      	movz	x0, #0x0, lsl #48
    cf14:      	b	0xcee0 <_stogir.vector-arithmetic.valid-type?+0x2a8>
    cf18:      	uxtb	w16, w19
    cf1c:      	cmp	w16, wzr
    cf20:      	b.eq	0xcedc <_stogir.vector-arithmetic.valid-type?+0x2a4>
    cf24:      	mov	x0, #0x1                ; =1
    cf28:      	b	0xcee0 <_stogir.vector-arithmetic.valid-type?+0x2a8>
    cf2c:      	movz	x0, #0x0, lsl #48
    cf30:      	b	0xcee0 <_stogir.vector-arithmetic.valid-type?+0x2a8>
    cf34:      	uxtb	w16, w3
    cf38:      	cmp	w16, wzr
    cf3c:      	b.ne	0xcfa8 <_stogir.vector-arithmetic.valid-type?+0x370>
    cf40:      	uxtb	w16, w4
    cf44:      	cmp	w16, wzr
    cf48:      	b.ne	0xcfa8 <_stogir.vector-arithmetic.valid-type?+0x370>
    cf4c:      	uxtb	w16, w5
    cf50:      	cmp	w16, wzr
    cf54:      	b.ne	0xcfa8 <_stogir.vector-arithmetic.valid-type?+0x370>
    cf58:      	uxtb	w16, w21
    cf5c:      	cmp	w16, wzr
    cf60:      	b.ne	0xd01c <_stogir.vector-arithmetic.valid-type?+0x3e4>
    cf64:      	uxtb	w16, w22
    cf68:      	cmp	w16, wzr
    cf6c:      	b.ne	0xd01c <_stogir.vector-arithmetic.valid-type?+0x3e4>
    cf70:      	uxtb	w16, w1
    cf74:      	cmp	w16, wzr
    cf78:      	b.eq	0xd02c <_stogir.vector-arithmetic.valid-type?+0x3f4>
    cf7c:      	uxtb	w16, w2
    cf80:      	cmp	w16, wzr
    cf84:      	b.eq	0xd02c <_stogir.vector-arithmetic.valid-type?+0x3f4>
    cf88:      	uxtb	w16, w0
    cf8c:      	cmp	w16, wzr
    cf90:      	b.eq	0xd034 <_stogir.vector-arithmetic.valid-type?+0x3fc>
    cf94:      	uxtb	w16, w9
    cf98:      	cmp	w16, wzr
    cf9c:      	b.eq	0xd03c <_stogir.vector-arithmetic.valid-type?+0x404>
    cfa0:      	mov	x0, #0x1                ; =1
    cfa4:      	b	0xd040 <_stogir.vector-arithmetic.valid-type?+0x408>
    cfa8:      	uxtb	w16, w1
    cfac:      	cmp	w16, wzr
    cfb0:      	b.eq	0xcf2c <_stogir.vector-arithmetic.valid-type?+0x2f4>
    cfb4:      	ubfx	x0, x2, #0, #8
    cfb8:      	b	0xcf30 <_stogir.vector-arithmetic.valid-type?+0x2f8>
    cfbc:      	movz	x0, #0x0, lsl #48
    cfc0:      	b	0xcf30 <_stogir.vector-arithmetic.valid-type?+0x2f8>
    cfc4:      	cmp	x2, #0x1a
    cfc8:      	b.eq	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cfcc:      	cmp	x2, #0x1b
    cfd0:      	b.eq	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cfd4:      	cmp	x2, #0x1c
    cfd8:      	b.eq	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cfdc:      	cmp	x2, #0x1d
    cfe0:      	b.eq	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cfe4:      	uxtb	w16, w6
    cfe8:      	cmp	w16, wzr
    cfec:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cff0:      	uxtb	w16, w3
    cff4:      	cmp	w16, wzr
    cff8:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    cffc:      	uxtb	w16, w4
    d000:      	cmp	w16, wzr
    d004:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d008:      	uxtb	w16, w5
    d00c:      	cmp	w16, wzr
    d010:      	b.ne	0xcdf8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d014:      	movz	x0, #0x0, lsl #48
    d018:      	b	0xcee0 <_stogir.vector-arithmetic.valid-type?+0x2a8>
    d01c:      	uxtb	w16, w6
    d020:      	cmp	w16, wzr
    d024:      	cset	x0, eq
    d028:      	b	0xcf30 <_stogir.vector-arithmetic.valid-type?+0x2f8>
    d02c:      	movz	x0, #0x0, lsl #48
    d030:      	b	0xd028 <_stogir.vector-arithmetic.valid-type?+0x3f0>
    d034:      	mov	x0, #0x1                ; =1
    d038:      	b	0xd030 <_stogir.vector-arithmetic.valid-type?+0x3f8>
    d03c:      	ubfx	x0, x10, #0, #8
    d040:      	b	0xd038 <_stogir.vector-arithmetic.valid-type?+0x400>
