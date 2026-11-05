
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-contained-load-promotion/build/verifier-contained-promotion/contained-stogir.o:	file format mach-o arm64

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
      54:      	b	0xa8 <_gap_verify_graph+0xa8>
      58:      	movn	x0, #0x0, lsl #48
      5c:      	b	0x94 <_gap_verify_graph+0x94>
      60:      	movz	x0, #0x0, lsl #48
      64:      	b	0x84 <_gap_verify_graph+0x84>
      68:      	add	x1, x0, #0x8
      6c:      	add	x16, sp, #0x30
      70:      	add	x2, x16, x0
      74:      	add	x0, x19, x0
      78:      	ldr	x0, [x0]
      7c:      	str	x0, [x2]
      80:      	mov	x0, x1
      84:      	cmp	x0, #0x1a0
      88:      	b.lo	0x68 <_gap_verify_graph+0x68>
      8c:      	add	x16, sp, #0x30
      90:      	ldr	x0, [x16, #0x8]
      94:      	ldr	x19, [sp, #0x1d0]
      98:      	ldr	x29, [sp]
      9c:      	ldr	x30, [sp, #0x8]
      a0:      	add	sp, sp, #0x1e0
      a4:      	ret
      a8:      	brk	#0
      ac:      	b	0xa8 <_gap_verify_graph+0xa8>

00000000000000b0 <_stogir.verify.integer-operations-target>:
      b0:      	sub	sp, sp, #0x70
      b4:      	str	x29, [sp]
      b8:      	str	x30, [sp, #0x8]
      bc:      	mov	x29, sp
      c0:      	str	x19, [sp, #0x50]
      c4:      	str	x20, [sp, #0x58]
      c8:      	str	x21, [sp, #0x60]
      cc:      	mov	x19, x8
      d0:      	add	x8, sp, #0x10
      d4:      	mov	x20, x0
      d8:      	mov	w21, w1
      dc:      	bl	0xdc <_stogir.verify.integer-operations-target+0x2c>
		00000000000000dc:  ARM64_RELOC_BRANCH26	_stogir.verify.structure
      e0:      	add	x16, sp, #0x10
      e4:      	ldr	w0, [x16]
      e8:      	lsr	x16, x0, #0
      ec:      	cmp	x16, #0x1
      f0:      	b.eq	0x10c <_stogir.verify.integer-operations-target+0x5c>
      f4:      	b.lo	0xfc <_stogir.verify.integer-operations-target+0x4c>
      f8:      	b	0x110 <_stogir.verify.integer-operations-target+0x60>
      fc:      	cmp	x16, #0x0
     100:      	b.eq	0x108 <_stogir.verify.integer-operations-target+0x58>
     104:      	b	0x110 <_stogir.verify.integer-operations-target+0x60>
     108:      	b	0x138 <_stogir.verify.integer-operations-target+0x88>
     10c:      	b	0x114 <_stogir.verify.integer-operations-target+0x64>
     110:      	b	0x18c <_stogir.verify.integer-operations-target+0xdc>
     114:      	add	x16, sp, #0x10
     118:      	orr	x0, x16, xzr
     11c:      	add	x0, x0, #0x8
     120:      	add	x16, sp, #0x10
     124:      	ldr	x1, [x16, #0x8]
     128:      	ldr	x0, [x0, #0x8]
     12c:      	mov	x2, x0
     130:      	mov	x0, #0x1                ; =1
     134:      	b	0x164 <_stogir.verify.integer-operations-target+0xb4>
     138:      	lsr	w21, w21, #0
     13c:      	add	x8, sp, #0x30
     140:      	mov	x0, x20
     144:      	mov	w1, w21
     148:      	bl	0x148 <_stogir.verify.integer-operations-target+0x98>
		0000000000000148:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target-structured
     14c:      	add	x16, sp, #0x30
     150:      	ldr	x0, [x16]
     154:      	add	x16, sp, #0x30
     158:      	ldr	x1, [x16, #0x8]
     15c:      	add	x16, sp, #0x30
     160:      	ldr	x2, [x16, #0x10]
     164:      	str	x0, [x19]
     168:      	str	x1, [x19, #0x8]
     16c:      	str	x2, [x19, #0x10]
     170:      	ldr	x19, [sp, #0x50]
     174:      	ldr	x20, [sp, #0x58]
     178:      	ldr	x21, [sp, #0x60]
     17c:      	ldr	x29, [sp]
     180:      	ldr	x30, [sp, #0x8]
     184:      	add	sp, sp, #0x70
     188:      	ret
     18c:      	brk	#0
     190:      	b	0x18c <_stogir.verify.integer-operations-target+0xdc>

0000000000000194 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node>:
     194:      	ldr	x0, [x0, #0x8]
     198:      	ret
     19c:      	udf	#0x0

00000000000001a0 <_stogir.verify.structure>:
     1a0:      	sub	sp, sp, #0x180
     1a4:      	str	x29, [sp, #0x10]
     1a8:      	str	x30, [sp, #0x18]
     1ac:      	add	x29, sp, #0x10
     1b0:      	str	x19, [sp, #0x130]
     1b4:      	str	x20, [sp, #0x138]
     1b8:      	str	x21, [sp, #0x140]
     1bc:      	str	x22, [sp, #0x148]
     1c0:      	str	x23, [sp, #0x150]
     1c4:      	str	x24, [sp, #0x158]
     1c8:      	str	x25, [sp, #0x160]
     1cc:      	str	x26, [sp, #0x168]
     1d0:      	str	x27, [sp, #0x170]
     1d4:      	str	x28, [sp, #0x178]
     1d8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000001d8:  ARM64_RELOC_PAGE21	l_stogir.299
     1dc:      	ldr	x16, [x16]
		00000000000001dc:  ARM64_RELOC_PAGEOFF12	l_stogir.299
     1e0:      	orr	x19, x16, xzr
     1e4:      	add	x1, x0, #0x78
     1e8:      	ldr	x20, [x0, #0x8]
     1ec:      	mov	x21, x8
     1f0:      	mov	x22, x0
     1f4:      	mov	x0, x1
     1f8:      	bl	0x1f8 <_stogir.verify.structure+0x58>
		00000000000001f8:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__i32
     1fc:      	cmp	x20, x0
     200:      	b.ne	0x55c <_stogir.verify.structure+0x3bc>
     204:      	mov	x0, x19
     208:      	movz	x1, #0x0, lsl #48
     20c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000020c:  ARM64_RELOC_PAGE21	l_stogir.300
     210:      	ldr	x16, [x16]
		0000000000000210:  ARM64_RELOC_PAGEOFF12	l_stogir.300
     214:      	orr	x20, x16, xzr
     218:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000218:  ARM64_RELOC_PAGE21	l_stogir.301
     21c:      	ldr	x16, [x16]
		000000000000021c:  ARM64_RELOC_PAGEOFF12	l_stogir.301
     220:      	orr	x23, x16, xzr
     224:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000224:  ARM64_RELOC_PAGE21	l_stogir.302
     228:      	ldr	x16, [x16]
		0000000000000228:  ARM64_RELOC_PAGEOFF12	l_stogir.302
     22c:      	orr	x24, x16, xzr
     230:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000230:  ARM64_RELOC_PAGE21	l_stogir.303
     234:      	ldr	x16, [x16]
		0000000000000234:  ARM64_RELOC_PAGEOFF12	l_stogir.303
     238:      	orr	x25, x16, xzr
     23c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000023c:  ARM64_RELOC_PAGE21	l_stogir.304
     240:      	ldr	x16, [x16]
		0000000000000240:  ARM64_RELOC_PAGEOFF12	l_stogir.304
     244:      	orr	x26, x16, xzr
     248:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000248:  ARM64_RELOC_PAGE21	l_stogir.305
     24c:      	ldr	x16, [x16]
		000000000000024c:  ARM64_RELOC_PAGEOFF12	l_stogir.305
     250:      	orr	x27, x16, xzr
     254:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000254:  ARM64_RELOC_PAGE21	l_stogir.306
     258:      	ldr	x16, [x16]
		0000000000000258:  ARM64_RELOC_PAGEOFF12	l_stogir.306
     25c:      	orr	x28, x16, xzr
     260:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000260:  ARM64_RELOC_PAGE21	l_stogir.307
     264:      	ldr	x16, [x16]
		0000000000000264:  ARM64_RELOC_PAGEOFF12	l_stogir.307
     268:      	orr	x2, x16, xzr
     26c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000026c:  ARM64_RELOC_PAGE21	l_stogir.308
     270:      	ldr	x16, [x16]
		0000000000000270:  ARM64_RELOC_PAGEOFF12	l_stogir.308
     274:      	orr	x3, x16, xzr
     278:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000278:  ARM64_RELOC_PAGE21	l_stogir.309
     27c:      	ldr	x16, [x16]
		000000000000027c:  ARM64_RELOC_PAGEOFF12	l_stogir.309
     280:      	orr	x4, x16, xzr
     284:      	add	x5, x22, #0x110
     288:      	add	x6, x22, #0x78
     28c:      	add	x7, x22, #0x28
     290:      	add	x8, x22, #0x50
     294:      	add	x9, x22, #0x78
     298:      	add	x10, x22, #0x28
     29c:      	add	x11, x22, #0x50
     2a0:      	add	x12, x5, #0x28
     2a4:      	mov	x13, x0
     2a8:      	mov	x14, x1
     2ac:      	mov	x0, #0x1                ; =1
     2b0:      	movz	x1, #0x0, lsl #48
     2b4:      	b	0x348 <_stogir.verify.structure+0x1a8>
     2b8:      	mov	x1, x19
     2bc:      	ldr	x2, [sp, #0x58]
     2c0:      	mov	x3, #0x16               ; =22
     2c4:      	b	0x2f0 <_stogir.verify.structure+0x150>
     2c8:      	mov	x0, x21
     2cc:      	str	x19, [sp, #0xc8]
     2d0:      	ldr	x19, [sp, #0x90]
     2d4:      	str	x28, [sp, #0xd0]
     2d8:      	mov	x21, x20
     2dc:      	str	x23, [sp, #0xb0]
     2e0:      	str	x24, [sp, #0xa8]
     2e4:      	mov	x1, x19
     2e8:      	ldr	x2, [sp, #0x50]
     2ec:      	mov	x3, #0x23               ; =35
     2f0:      	ldr	x19, [sp, #0x48]
     2f4:      	ldr	x20, [sp, #0x50]
     2f8:      	ldr	x23, [sp, #0x58]
     2fc:      	ldr	x24, [sp, #0x60]
     300:      	ldr	x28, [sp, #0x80]
     304:      	ldr	x4, [sp, #0x40]
     308:      	ldr	x5, [sp, #0xc8]
     30c:      	ldr	x12, [sp, #0xd0]
     310:      	mov	x6, x21
     314:      	ldr	x21, [sp, #0x88]
     318:      	ldr	x7, [sp, #0xb0]
     31c:      	ldr	x8, [sp, #0xa8]
     320:      	mov	x9, x25
     324:      	ldr	x25, [sp, #0x68]
     328:      	mov	x10, x26
     32c:      	ldr	x26, [sp, #0x70]
     330:      	mov	x11, x27
     334:      	ldr	x27, [sp, #0x78]
     338:      	mov	x13, x2
     33c:      	ldr	x2, [sp, #0x30]
     340:      	mov	x14, x3
     344:      	ldr	x3, [sp, #0x38]
     348:      	str	x2, [sp, #0x30]
     34c:      	mov	x2, x19
     350:      	str	x3, [sp, #0x38]
     354:      	str	x4, [sp, #0x40]
     358:      	str	x1, [sp, #0x90]
     35c:      	mov	x1, x14
     360:      	str	x13, [sp, #0x98]
     364:      	str	x14, [sp, #0xa0]
     368:      	str	x19, [sp, #0x48]
     36c:      	mov	x19, x5
     370:      	str	x20, [sp, #0x50]
     374:      	mov	x20, x6
     378:      	str	x23, [sp, #0x58]
     37c:      	mov	x23, x7
     380:      	str	x24, [sp, #0x60]
     384:      	mov	x24, x8
     388:      	str	x25, [sp, #0x68]
     38c:      	mov	x25, x9
     390:      	str	x26, [sp, #0x70]
     394:      	mov	x26, x10
     398:      	str	x27, [sp, #0x78]
     39c:      	mov	x27, x11
     3a0:      	str	x28, [sp, #0x80]
     3a4:      	mov	x28, x12
     3a8:      	str	x21, [sp, #0x88]
     3ac:      	mov	x21, x0
     3b0:      	mov	x0, x13
     3b4:      	movz	x3, #0x0, lsl #48
     3b8:      	bl	0x3b8 <_stogir.verify.structure+0x218>
		00000000000003b8:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     3bc:      	cmp	x0, #0x0
     3c0:      	b.eq	0xd58 <_stogir.verify.structure+0xbb8>
     3c4:      	ldr	x0, [x22, #0x8]
     3c8:      	cmp	x21, x0
     3cc:      	b.ge	0xd60 <_stogir.verify.structure+0xbc0>
     3d0:      	lsl	x0, x21, #4
     3d4:      	lsl	x1, x21, #2
     3d8:      	ldr	x2, [x22]
     3dc:      	add	x0, x0, x2
     3e0:      	ldr	x0, [x0]
     3e4:      	ldr	x2, [x22, #0x78]
     3e8:      	add	x1, x1, x2
     3ec:      	ldr	w1, [x1]
     3f0:      	sxtw	x1, w1
     3f4:      	cmp	x1, #0x0
     3f8:      	b.lt	0x2c8 <_stogir.verify.structure+0x128>
     3fc:      	mov	x17, #0xffff            ; =65535
     400:      	cmp	x1, x17
     404:      	b.gt	0xd68 <_stogir.verify.structure+0xbc8>
     408:      	uxtb	w2, w0
     40c:      	orr	x3, x2, xzr
     410:      	lsr	w3, w3, #0
     414:      	str	w3, [sp, #0xc0]
     418:      	str	x24, [sp, #0xa8]
     41c:      	mov	x24, x0
     420:      	mov	w0, w3
     424:      	str	x23, [sp, #0xb0]
     428:      	mov	x23, x1
     42c:      	str	x20, [sp, #0xb8]
     430:      	mov	w20, w2
     434:      	bl	0x434 <_stogir.verify.structure+0x294>
		0000000000000434:  ARM64_RELOC_BRANCH26	_stogir.opcode.valid?
     438:      	cmp	x0, #0x0
     43c:      	b.eq	0xd88 <_stogir.verify.structure+0xbe8>
     440:      	lsr	w24, w24, #0
     444:      	ubfx	x0, x24, #8, #8
     448:      	orr	x1, x0, xzr
     44c:      	lsr	w1, w1, #0
     450:      	str	x19, [sp, #0xc8]
     454:      	mov	w19, w0
     458:      	mov	w0, w1
     45c:      	bl	0x45c <_stogir.verify.structure+0x2bc>
		000000000000045c:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
     460:      	cmp	x0, #0x0
     464:      	b.eq	0xda0 <_stogir.verify.structure+0xc00>
     468:      	ldr	w0, [sp, #0xc0]
     46c:      	bl	0x46c <_stogir.verify.structure+0x2cc>
		000000000000046c:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
     470:      	lsr	w0, w0, #0
     474:      	sxtw	x0, w0
     478:      	cmp	x0, #0x0
     47c:      	b.lt	0xb0c <_stogir.verify.structure+0x96c>
     480:      	ldr	w0, [sp, #0xc0]
     484:      	bl	0x484 <_stogir.verify.structure+0x2e4>
		0000000000000484:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-slots
     488:      	lsr	w0, w0, #0
     48c:      	sxtw	x0, w0
     490:      	cmp	x23, x0
     494:      	b.eq	0xb0c <_stogir.verify.structure+0x96c>
     498:      	str	x28, [sp, #0xd0]
     49c:      	mov	x0, x21
     4a0:      	ldr	x21, [sp, #0xb8]
     4a4:      	ldr	x1, [sp, #0x90]
     4a8:      	ldr	x2, [sp, #0x60]
     4ac:      	mov	x3, #0x23               ; =35
     4b0:      	b	0x558 <_stogir.verify.structure+0x3b8>
     4b4:      	ldr	x0, [sp, #0x98]
     4b8:      	ldr	x1, [sp, #0xa0]
     4bc:      	ldr	x2, [sp, #0x48]
     4c0:      	movz	x3, #0x0, lsl #48
     4c4:      	bl	0x4c4 <_stogir.verify.structure+0x324>
		00000000000004c4:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     4c8:      	cmp	x0, #0x0
     4cc:      	b.eq	0x4e4 <_stogir.verify.structure+0x344>
     4d0:      	and	x0, x19, #0xffffffff
     4d4:      	mov	x1, x0
     4d8:      	movz	x0, #0x0, lsl #48
     4dc:      	movz	x2, #0x0, lsl #48
     4e0:      	b	0x4f0 <_stogir.verify.structure+0x350>
     4e4:      	ldr	x1, [sp, #0x98]
     4e8:      	ldr	x2, [sp, #0xa0]
     4ec:      	mov	x0, #0x1                ; =1
     4f0:      	ldr	x3, [sp, #0x88]
     4f4:      	str	x0, [x3]
     4f8:      	str	x1, [x3, #0x8]
     4fc:      	str	x2, [x3, #0x10]
     500:      	ldr	x19, [sp, #0x130]
     504:      	ldr	x20, [sp, #0x138]
     508:      	ldr	x21, [sp, #0x140]
     50c:      	ldr	x22, [sp, #0x148]
     510:      	ldr	x23, [sp, #0x150]
     514:      	ldr	x24, [sp, #0x158]
     518:      	ldr	x25, [sp, #0x160]
     51c:      	ldr	x26, [sp, #0x168]
     520:      	ldr	x27, [sp, #0x170]
     524:      	ldr	x28, [sp, #0x178]
     528:      	ldr	x29, [sp, #0x10]
     52c:      	ldr	x30, [sp, #0x18]
     530:      	add	sp, sp, #0x180
     534:      	ret
     538:      	ldr	x0, [sp, #0x118]
     53c:      	add	x0, x24, x0
     540:      	ldr	x19, [sp, #0x90]
     544:      	add	x1, x19, #0x1
     548:      	lsr	w1, w1, #0
     54c:      	sxtw	x1, w1
     550:      	ldr	x2, [sp, #0x100]
     554:      	ldr	x3, [sp, #0x108]
     558:      	b	0x2c4 <_stogir.verify.structure+0x124>
     55c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000055c:  ARM64_RELOC_PAGE21	l_stogir.310
     560:      	ldr	x16, [x16]
		0000000000000560:  ARM64_RELOC_PAGEOFF12	l_stogir.310
     564:      	orr	x0, x16, xzr
     568:      	mov	x1, #0x2c               ; =44
     56c:      	b	0x20c <_stogir.verify.structure+0x6c>
     570:      	mov	x11, x9
     574:      	movz	x9, #0x0, lsl #48
     578:      	cmp	x9, #0x0
     57c:      	b.eq	0xdb4 <_stogir.verify.structure+0xc14>
     580:      	cmp	x0, #0x0
     584:      	b.eq	0xbe8 <_stogir.verify.structure+0xa48>
     588:      	ldr	x21, [sp, #0xb8]
     58c:      	ldr	x0, [sp, #0xb0]
     590:      	ldr	x4, [sp, #0xa8]
     594:      	mov	x3, x7
     598:      	mov	x5, x11
     59c:      	b	0xb74 <_stogir.verify.structure+0x9d4>
     5a0:      	mov	x0, x1
     5a4:      	ldr	x1, [sp, #0x120]
     5a8:      	b	0x5b4 <_stogir.verify.structure+0x414>
     5ac:      	mov	x0, x11
     5b0:      	ldr	x1, [sp, #0x120]
     5b4:      	b	0x6c4 <_stogir.verify.structure+0x524>
     5b8:      	lsr	x3, x2, #0
     5bc:      	str	x1, [sp, #0xf0]
     5c0:      	str	x2, [sp, #0xf8]
     5c4:      	mov	x2, x3
     5c8:      	str	w28, [sp, #0xe8]
     5cc:      	mov	x28, x0
     5d0:      	mov	x0, x1
     5d4:      	ldr	x1, [sp, #0x48]
     5d8:      	bl	0x5d8 <_stogir.verify.structure+0x438>
		00000000000005d8:  ARM64_RELOC_BRANCH26	_memcmp
     5dc:      	lsr	w0, w0, #0
     5e0:      	sxtw	x0, w0
     5e4:      	cmp	x0, #0x0
     5e8:      	cset	w0, eq
     5ec:      	ubfx	x0, x0, #0, #8
     5f0:      	ldr	x1, [sp, #0xf0]
     5f4:      	ldr	x2, [sp, #0xf8]
     5f8:      	b	0x608 <_stogir.verify.structure+0x468>
     5fc:      	ldr	x1, [sp, #0xf0]
     600:      	ldr	x2, [sp, #0xf8]
     604:      	movz	x0, #0x0, lsl #48
     608:      	cmp	x0, #0x0
     60c:      	b.eq	0x620 <_stogir.verify.structure+0x480>
     610:      	cmp	x28, x23
     614:      	cset	w0, le
     618:      	ubfx	x0, x0, #0, #8
     61c:      	b	0x624 <_stogir.verify.structure+0x484>
     620:      	movz	x0, #0x0, lsl #48
     624:      	cmp	x0, #0x0
     628:      	b.eq	0xdc8 <_stogir.verify.structure+0xc28>
     62c:      	lsr	w0, w28, #0
     630:      	str	x1, [sp, #0x100]
     634:      	mov	w1, w0
     638:      	str	x2, [sp, #0x108]
     63c:      	str	x23, [sp, #0x110]
     640:      	mov	w23, w0
     644:      	ldr	w0, [sp, #0xc0]
     648:      	bl	0x648 <_stogir.verify.structure+0x4a8>
		0000000000000648:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
     64c:      	add	x16, sp, #0x20
     650:      	str	x16, [sp]
     654:      	ldr	w1, [sp, #0xe8]
     658:      	mov	w2, w23
     65c:      	str	x21, [sp, #0x118]
     660:      	mov	x21, x0
     664:      	mov	x0, x22
     668:      	bl	0x668 <_stogir.verify.structure+0x4c8>
		0000000000000668:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     66c:      	ldr	x16, [sp]
     670:      	str	x0, [x16]
     674:      	str	x1, [x16, #0x8]
     678:      	add	x16, sp, #0x20
     67c:      	ldr	x0, [x16]
     680:      	add	x16, sp, #0x20
     684:      	ldr	x1, [x16, #0x8]
     688:      	lsr	w0, w0, #0
     68c:      	lsr	x16, x0, #0
     690:      	cmp	x16, #0x1
     694:      	b.eq	0x6b0 <_stogir.verify.structure+0x510>
     698:      	b.lo	0x6a0 <_stogir.verify.structure+0x500>
     69c:      	b	0x6b4 <_stogir.verify.structure+0x514>
     6a0:      	cmp	x16, #0x0
     6a4:      	b.eq	0x6ac <_stogir.verify.structure+0x50c>
     6a8:      	b	0x6b4 <_stogir.verify.structure+0x514>
     6ac:      	b	0x6b8 <_stogir.verify.structure+0x518>
     6b0:      	b	0x718 <_stogir.verify.structure+0x578>
     6b4:      	b	0xcf0 <_stogir.verify.structure+0xb50>
     6b8:      	ldr	x21, [sp, #0xb8]
     6bc:      	ldr	x0, [sp, #0x80]
     6c0:      	mov	x1, #0x17               ; =23
     6c4:      	add	x2, x28, #0x1
     6c8:      	lsr	w2, w2, #0
     6cc:      	sxtw	x2, w2
     6d0:      	ldr	x23, [sp, #0x110]
     6d4:      	ldr	w28, [sp, #0xe8]
     6d8:      	str	x21, [sp, #0xb8]
     6dc:      	ldr	x21, [sp, #0x118]
     6e0:      	fmov	d31, x0
     6e4:      	mov	x0, x2
     6e8:      	mov	x2, x1
     6ec:      	fmov	x1, d31
     6f0:      	cmp	x2, #0x0
     6f4:      	b.ne	0xddc <_stogir.verify.structure+0xc3c>
     6f8:      	cmp	x2, #0x0
     6fc:      	b.ne	0x5b8 <_stogir.verify.structure+0x418>
     700:      	str	w28, [sp, #0xe8]
     704:      	mov	x28, x0
     708:      	str	x1, [sp, #0xf0]
     70c:      	str	x2, [sp, #0xf8]
     710:      	mov	x0, #0x1                ; =1
     714:      	b	0x5f0 <_stogir.verify.structure+0x450>
     718:      	lsr	w21, w21, #0
     71c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000071c:  ARM64_RELOC_PAGE21	l_stogir.311
     720:      	ldr	x16, [x16]
		0000000000000720:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     724:      	ldr	w0, [x16]
     728:      	orr	x2, x21, xzr
     72c:      	cmp	x2, x0
     730:      	b.ne	0x73c <_stogir.verify.structure+0x59c>
     734:      	mov	x0, #0x1                ; =1
     738:      	b	0x754 <_stogir.verify.structure+0x5b4>
     73c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000073c:  ARM64_RELOC_PAGE21	l_stogir.312
     740:      	ldr	x16, [x16]
		0000000000000740:  ARM64_RELOC_PAGEOFF12	l_stogir.312
     744:      	ldr	w0, [x16]
     748:      	cmp	x2, x0
     74c:      	cset	w0, eq
     750:      	ubfx	x0, x0, #0, #8
     754:      	lsr	w1, w1, #0
     758:      	sxtw	x1, w1
     75c:      	cmp	x1, #0x0
     760:      	cset	w3, gt
     764:      	lsl	x4, x1, #2
     768:      	cmp	x1, #0x0
     76c:      	cset	w5, lt
     770:      	movz	x16, #0x0, lsl #48
     774:      	sub	x6, x16, x1
     778:      	sub	x7, x6, #0x1
     77c:      	lsl	x8, x7, #2
     780:      	cmp	x0, #0x0
     784:      	b.eq	0x7cc <_stogir.verify.structure+0x62c>
     788:      	uxtb	w16, w3
     78c:      	cmp	w16, wzr
     790:      	b.eq	0xa4c <_stogir.verify.structure+0x8ac>
     794:      	ldr	x9, [x22, #0x8]
     798:      	cmp	x1, x9
     79c:      	b.ge	0xa90 <_stogir.verify.structure+0x8f0>
     7a0:      	ldr	x9, [x25, #0x8]
     7a4:      	cmp	x1, x9
     7a8:      	b.ge	0xc4c <_stogir.verify.structure+0xaac>
     7ac:      	ldr	x9, [x22, #0x78]
     7b0:      	add	x9, x4, x9
     7b4:      	ldr	w9, [x9]
     7b8:      	sxtw	x9, w9
     7bc:      	cmp	x9, #0x0
     7c0:      	cset	w9, ge
     7c4:      	ubfx	x9, x9, #0, #8
     7c8:      	b	0xc50 <_stogir.verify.structure+0xab0>
     7cc:      	ldr	x9, [sp, #0x100]
     7d0:      	ldr	x10, [sp, #0x108]
     7d4:      	movz	x7, #0x0, lsl #48
     7d8:      	b	0x7f0 <_stogir.verify.structure+0x650>
     7dc:      	ldr	x7, [sp, #0x100]
     7e0:      	ldr	x10, [sp, #0x108]
     7e4:      	fmov	d31, x7
     7e8:      	mov	x7, x9
     7ec:      	fmov	x9, d31
     7f0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000007f0:  ARM64_RELOC_PAGE21	l_stogir.313
     7f4:      	ldr	x16, [x16]
		00000000000007f4:  ARM64_RELOC_PAGEOFF12	l_stogir.313
     7f8:      	ldr	w11, [x16]
     7fc:      	cmp	x2, x11
     800:      	b.ne	0xdf0 <_stogir.verify.structure+0xc50>
     804:      	cmp	x1, #0x0
     808:      	b.gt	0x9ec <_stogir.verify.structure+0x84c>
     80c:      	ldr	x12, [sp, #0xc8]
     810:      	ldr	x2, [sp, #0xd0]
     814:      	mov	x11, x9
     818:      	movz	x9, #0x0, lsl #48
     81c:      	lsr	w9, w9, #0
     820:      	lsr	x16, x9, #0
     824:      	cmp	x16, #0x1
     828:      	b.eq	0x844 <_stogir.verify.structure+0x6a4>
     82c:      	b.lo	0x834 <_stogir.verify.structure+0x694>
     830:      	b	0x848 <_stogir.verify.structure+0x6a8>
     834:      	cmp	x16, #0x0
     838:      	b.eq	0x840 <_stogir.verify.structure+0x6a0>
     83c:      	b	0x848 <_stogir.verify.structure+0x6a8>
     840:      	b	0x84c <_stogir.verify.structure+0x6ac>
     844:      	b	0x858 <_stogir.verify.structure+0x6b8>
     848:      	b	0xd50 <_stogir.verify.structure+0xbb0>
     84c:      	ldr	x9, [sp, #0x38]
     850:      	mov	x10, #0x21              ; =33
     854:      	b	0x85c <_stogir.verify.structure+0x6bc>
     858:      	mov	x9, x11
     85c:      	cmp	x21, #0xf
     860:      	b.hs	0x570 <_stogir.verify.structure+0x3d0>
     864:      	mov	x16, #0x1               ; =1
     868:      	lsl	x11, x16, x21
     86c:      	lsr	w11, w11, #0
     870:      	mov	x17, #0x5e1c            ; =24092
     874:      	and	x11, x11, x17
     878:      	lsr	w11, w11, #0
     87c:      	cmp	x11, #0x0
     880:      	cset	w11, eq
     884:      	uxtb	w16, w11
     888:      	cmp	w16, wzr
     88c:      	cset	x11, eq
     890:      	fmov	d31, x9
     894:      	mov	x9, x11
     898:      	fmov	x11, d31
     89c:      	b	0x578 <_stogir.verify.structure+0x3d8>
     8a0:      	lsr	w0, w21, #0
     8a4:      	lsr	w28, w0, #0
     8a8:      	cmp	x20, #0x78
     8ac:      	cset	w20, eq
     8b0:      	cmp	x19, #0x0
     8b4:      	cset	w19, eq
     8b8:      	mov	x2, x1
     8bc:      	ldr	x1, [sp, #0xd8]
     8c0:      	mov	x0, #0x1                ; =1
     8c4:      	b	0x6f0 <_stogir.verify.structure+0x550>
     8c8:      	ldr	x0, [sp, #0x78]
     8cc:      	mov	x1, #0x1b               ; =27
     8d0:      	b	0x964 <_stogir.verify.structure+0x7c4>
     8d4:      	lsr	x3, x2, #0
     8d8:      	str	x1, [sp, #0xd8]
     8dc:      	str	x2, [sp, #0xe0]
     8e0:      	mov	x2, x3
     8e4:      	str	x28, [sp, #0xd0]
     8e8:      	mov	x28, x0
     8ec:      	mov	x0, x1
     8f0:      	ldr	x1, [sp, #0x48]
     8f4:      	bl	0x8f4 <_stogir.verify.structure+0x754>
		00000000000008f4:  ARM64_RELOC_BRANCH26	_memcmp
     8f8:      	lsr	w0, w0, #0
     8fc:      	sxtw	x0, w0
     900:      	cmp	x0, #0x0
     904:      	cset	w0, eq
     908:      	ubfx	x0, x0, #0, #8
     90c:      	ldr	x1, [sp, #0xe0]
     910:      	b	0x91c <_stogir.verify.structure+0x77c>
     914:      	ldr	x1, [sp, #0xe0]
     918:      	movz	x0, #0x0, lsl #48
     91c:      	cmp	x0, #0x0
     920:      	b.eq	0x934 <_stogir.verify.structure+0x794>
     924:      	cmp	x28, x24
     928:      	cset	w0, lt
     92c:      	ubfx	x0, x0, #0, #8
     930:      	b	0x938 <_stogir.verify.structure+0x798>
     934:      	movz	x0, #0x0, lsl #48
     938:      	cmp	x0, #0x0
     93c:      	b.eq	0x8a0 <_stogir.verify.structure+0x700>
     940:      	add	x0, x28, x21
     944:      	ldr	x2, [x22, #0x78]
     948:      	lsl	x0, x0, #2
     94c:      	add	x0, x0, x2
     950:      	ldr	w0, [x0]
     954:      	sxtw	x0, w0
     958:      	cmn	x0, #0x1
     95c:      	b.ne	0x8c8 <_stogir.verify.structure+0x728>
     960:      	ldr	x0, [sp, #0xd8]
     964:      	add	x2, x28, #0x1
     968:      	ldr	x28, [sp, #0xd0]
     96c:      	fmov	d31, x0
     970:      	mov	x0, x2
     974:      	mov	x2, x1
     978:      	fmov	x1, d31
     97c:      	cmp	x2, #0x0
     980:      	b.ne	0xdfc <_stogir.verify.structure+0xc5c>
     984:      	cmp	x2, #0x0
     988:      	b.ne	0x8d4 <_stogir.verify.structure+0x734>
     98c:      	str	x28, [sp, #0xd0]
     990:      	mov	x28, x0
     994:      	str	x1, [sp, #0xd8]
     998:      	str	x2, [sp, #0xe0]
     99c:      	mov	x0, #0x1                ; =1
     9a0:      	b	0x90c <_stogir.verify.structure+0x76c>
     9a4:      	ldr	x0, [sp, #0x98]
     9a8:      	ldr	x1, [sp, #0xa0]
     9ac:      	add	x2, x23, #0x4
     9b0:      	ldr	x3, [x22, #0x8]
     9b4:      	asr	x16, x2, #63
     9b8:      	lsr	x16, x16, #62
     9bc:      	add	x2, x2, x16
     9c0:      	asr	x2, x2, #2
     9c4:      	orr	x24, x2, xzr
     9c8:      	add	x2, x24, x21
     9cc:      	cmp	x2, x3
     9d0:      	b.le	0x9dc <_stogir.verify.structure+0x83c>
     9d4:      	ldr	x0, [sp, #0x70]
     9d8:      	mov	x1, #0x15               ; =21
     9dc:      	mov	x2, x1
     9e0:      	mov	x1, x0
     9e4:      	mov	x0, #0x1                ; =1
     9e8:      	b	0x97c <_stogir.verify.structure+0x7dc>
     9ec:      	ldr	x2, [sp, #0xd0]
     9f0:      	ldr	x11, [x2, #0x8]
     9f4:      	cmp	x1, x11
     9f8:      	b.gt	0xe10 <_stogir.verify.structure+0xc70>
     9fc:      	sub	x11, x1, #0x1
     a00:      	ldr	x12, [sp, #0xc8]
     a04:      	ldr	x13, [x12, #0x28]
     a08:      	mov	x17, #0x18              ; =24
     a0c:      	mul	x11, x11, x17
     a10:      	add	x11, x11, x13
     a14:      	ldr	x13, [x11]
     a18:      	ldr	x11, [x11, #0x8]
     a1c:      	ldr	x14, [x12, #0x8]
     a20:      	cmp	x13, #0x0
     a24:      	b.lt	0xc30 <_stogir.verify.structure+0xa90>
     a28:      	cmp	x13, x14
     a2c:      	b.gt	0xc30 <_stogir.verify.structure+0xa90>
     a30:      	cmp	x11, #0x0
     a34:      	b.lt	0xc30 <_stogir.verify.structure+0xa90>
     a38:      	sub	x13, x14, x13
     a3c:      	cmp	x11, x13
     a40:      	b.gt	0xc30 <_stogir.verify.structure+0xa90>
     a44:      	mov	x11, #0x1               ; =1
     a48:      	b	0xc34 <_stogir.verify.structure+0xa94>
     a4c:      	uxtb	w16, w5
     a50:      	cmp	w16, wzr
     a54:      	b.eq	0xa98 <_stogir.verify.structure+0x8f8>
     a58:      	ldr	x9, [x26, #0x8]
     a5c:      	ldr	x10, [x27, #0x8]
     a60:      	cmp	x9, x10
     a64:      	b.ne	0xc44 <_stogir.verify.structure+0xaa4>
     a68:      	cmp	x6, x9
     a6c:      	b.gt	0xcbc <_stogir.verify.structure+0xb1c>
     a70:      	ldr	x9, [x22, #0x50]
     a74:      	add	x9, x8, x9
     a78:      	ldr	w9, [x9]
     a7c:      	sxtw	x9, w9
     a80:      	cmp	x9, #0x0
     a84:      	cset	w9, gt
     a88:      	ubfx	x9, x9, #0, #8
     a8c:      	b	0xcc0 <_stogir.verify.structure+0xb20>
     a90:      	movz	x9, #0x0, lsl #48
     a94:      	b	0xa9c <_stogir.verify.structure+0x8fc>
     a98:      	movz	x9, #0x0, lsl #48
     a9c:      	cmp	x9, #0x0
     aa0:      	b.eq	0xad0 <_stogir.verify.structure+0x930>
     aa4:      	uxtb	w16, w3
     aa8:      	cmp	w16, wzr
     aac:      	b.eq	0xac0 <_stogir.verify.structure+0x920>
     ab0:      	lsl	x7, x1, #4
     ab4:      	ldr	x9, [x22]
     ab8:      	add	x7, x7, x9
     abc:      	b	0xacc <_stogir.verify.structure+0x92c>
     ac0:      	lsl	x7, x7, #4
     ac4:      	ldr	x9, [x22, #0x28]
     ac8:      	add	x7, x7, x9
     acc:      	b	0xad4 <_stogir.verify.structure+0x934>
     ad0:      	movz	x7, #0x0, lsl #48
     ad4:      	cmp	x7, #0x0
     ad8:      	cset	w9, eq
     adc:      	uxtb	w16, w9
     ae0:      	cmp	w16, wzr
     ae4:      	cset	x9, eq
     ae8:      	cmp	x9, #0x0
     aec:      	b.eq	0x7dc <_stogir.verify.structure+0x63c>
     af0:      	ldr	w7, [x7]
     af4:      	uxtb	w7, w7
     af8:      	cmp	x7, #0x48
     afc:      	b.ne	0x7dc <_stogir.verify.structure+0x63c>
     b00:      	ldr	x7, [sp, #0x30]
     b04:      	mov	x10, #0x25              ; =37
     b08:      	b	0x7e4 <_stogir.verify.structure+0x644>
     b0c:      	ldr	w0, [sp, #0xc0]
     b10:      	bl	0xb10 <_stogir.verify.structure+0x970>
		0000000000000b10:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
     b14:      	lsr	w0, w0, #0
     b18:      	sxtw	x0, w0
     b1c:      	cmn	x0, #0x1
     b20:      	b.ne	0x9a4 <_stogir.verify.structure+0x804>
     b24:      	ubfx	x0, x24, #16, #16
     b28:      	cmp	x23, x0
     b2c:      	b.eq	0x9a4 <_stogir.verify.structure+0x804>
     b30:      	ldr	x0, [sp, #0x68]
     b34:      	mov	x1, #0x24               ; =36
     b38:      	b	0x9ac <_stogir.verify.structure+0x80c>
     b3c:      	mov	x0, #0x1                ; =1
     b40:      	cmp	x0, #0x0
     b44:      	b.eq	0x5a0 <_stogir.verify.structure+0x400>
     b48:      	ldr	x0, [sp, #0x40]
     b4c:      	mov	x1, #0x1a               ; =26
     b50:      	b	0x5a8 <_stogir.verify.structure+0x408>
     b54:      	movz	x0, #0x0, lsl #48
     b58:      	ldr	x1, [sp, #0x128]
     b5c:      	cmp	x0, #0x0
     b60:      	b.eq	0xb3c <_stogir.verify.structure+0x99c>
     b64:      	movz	x0, #0x0, lsl #48
     b68:      	b	0xb40 <_stogir.verify.structure+0x9a0>
     b6c:      	movz	x3, #0x0, lsl #48
     b70:      	mov	x5, x11
     b74:      	cmp	x3, #0x0
     b78:      	b.eq	0xb9c <_stogir.verify.structure+0x9fc>
     b7c:      	str	x12, [sp, #0xc8]
     b80:      	str	x2, [sp, #0xd0]
     b84:      	str	x0, [sp, #0xb0]
     b88:      	str	x4, [sp, #0xa8]
     b8c:      	str	x10, [sp, #0x120]
     b90:      	mov	x1, x5
     b94:      	mov	x0, #0x1                ; =1
     b98:      	b	0xb5c <_stogir.verify.structure+0x9bc>
     b9c:      	cmp	x1, #0x0
     ba0:      	b.ne	0xe18 <_stogir.verify.structure+0xc78>
     ba4:      	mov	w1, w23
     ba8:      	str	x2, [sp, #0xd0]
     bac:      	str	x12, [sp, #0xc8]
     bb0:      	str	x10, [sp, #0x120]
     bb4:      	str	x0, [sp, #0xb0]
     bb8:      	ldr	w0, [sp, #0xc0]
     bbc:      	str	x4, [sp, #0xa8]
     bc0:      	str	x5, [sp, #0x128]
     bc4:      	bl	0xbc4 <_stogir.verify.structure+0xa24>
		0000000000000bc4:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
     bc8:      	lsr	w0, w0, #0
     bcc:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000bcc:  ARM64_RELOC_PAGE21	l_stogir.314
     bd0:      	ldr	x16, [x16]
		0000000000000bd0:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     bd4:      	ldr	w1, [x16]
     bd8:      	cmp	x0, x1
     bdc:      	b.ne	0xcc4 <_stogir.verify.structure+0xb24>
     be0:      	mov	x0, #0x1                ; =1
     be4:      	b	0xc58 <_stogir.verify.structure+0xab8>
     be8:      	uxtb	w16, w3
     bec:      	cmp	w16, wzr
     bf0:      	b.eq	0xe34 <_stogir.verify.structure+0xc94>
     bf4:      	ldr	x0, [x22, #0x8]
     bf8:      	cmp	x1, x0
     bfc:      	b.ge	0xe3c <_stogir.verify.structure+0xc9c>
     c00:      	ldr	x21, [sp, #0xb8]
     c04:      	ldr	x0, [x21, #0x8]
     c08:      	cmp	x1, x0
     c0c:      	b.ge	0xce8 <_stogir.verify.structure+0xb48>
     c10:      	ldr	x0, [x22, #0x78]
     c14:      	add	x0, x4, x0
     c18:      	ldr	w0, [x0]
     c1c:      	sxtw	x0, w0
     c20:      	cmp	x0, #0x0
     c24:      	cset	w0, ge
     c28:      	ubfx	x0, x0, #0, #8
     c2c:      	b	0xcec <_stogir.verify.structure+0xb4c>
     c30:      	movz	x11, #0x0, lsl #48
     c34:      	fmov	d31, x9
     c38:      	mov	x9, x11
     c3c:      	fmov	x11, d31
     c40:      	b	0x81c <_stogir.verify.structure+0x67c>
     c44:      	movz	x9, #0x0, lsl #48
     c48:      	b	0xa9c <_stogir.verify.structure+0x8fc>
     c4c:      	movz	x9, #0x0, lsl #48
     c50:      	b	0xa94 <_stogir.verify.structure+0x8f4>
     c54:      	movz	x0, #0x0, lsl #48
     c58:      	b	0xb58 <_stogir.verify.structure+0x9b8>
     c5c:      	movz	x0, #0x0, lsl #48
     c60:      	ldr	x4, [sp, #0xa8]
     c64:      	mov	x3, x0
     c68:      	ldr	x0, [sp, #0xb0]
     c6c:      	b	0xb70 <_stogir.verify.structure+0x9d0>
     c70:      	uxtb	w16, w5
     c74:      	cmp	w16, wzr
     c78:      	b.eq	0xe44 <_stogir.verify.structure+0xca4>
     c7c:      	ldr	x0, [sp, #0xb0]
     c80:      	ldr	x3, [x0, #0x8]
     c84:      	ldr	x4, [sp, #0xa8]
     c88:      	ldr	x5, [x4, #0x8]
     c8c:      	cmp	x3, x5
     c90:      	b.ne	0xce0 <_stogir.verify.structure+0xb40>
     c94:      	cmp	x6, x3
     c98:      	b.gt	0xd14 <_stogir.verify.structure+0xb74>
     c9c:      	ldr	x3, [x22, #0x50]
     ca0:      	add	x3, x8, x3
     ca4:      	ldr	w3, [x3]
     ca8:      	sxtw	x3, w3
     cac:      	cmp	x3, #0x0
     cb0:      	cset	w3, gt
     cb4:      	ubfx	x3, x3, #0, #8
     cb8:      	b	0xd18 <_stogir.verify.structure+0xb78>
     cbc:      	movz	x9, #0x0, lsl #48
     cc0:      	b	0xc48 <_stogir.verify.structure+0xaa8>
     cc4:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000cc4:  ARM64_RELOC_PAGE21	l_stogir.315
     cc8:      	ldr	x16, [x16]
		0000000000000cc8:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     ccc:      	ldr	w1, [x16]
     cd0:      	cmp	x0, x1
     cd4:      	b.ne	0xcf8 <_stogir.verify.structure+0xb58>
     cd8:      	mov	x0, #0x1                ; =1
     cdc:      	b	0xc58 <_stogir.verify.structure+0xab8>
     ce0:      	movz	x3, #0x0, lsl #48
     ce4:      	b	0xb70 <_stogir.verify.structure+0x9d0>
     ce8:      	movz	x0, #0x0, lsl #48
     cec:      	b	0xc60 <_stogir.verify.structure+0xac0>
     cf0:      	brk	#0
     cf4:      	b	0xcf0 <_stogir.verify.structure+0xb50>
     cf8:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000cf8:  ARM64_RELOC_PAGE21	l_stogir.316
     cfc:      	ldr	x16, [x16]
		0000000000000cfc:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     d00:      	ldr	w1, [x16]
     d04:      	cmp	x0, x1
     d08:      	b.ne	0xd1c <_stogir.verify.structure+0xb7c>
     d0c:      	mov	x0, #0x1                ; =1
     d10:      	b	0xc58 <_stogir.verify.structure+0xab8>
     d14:      	movz	x3, #0x0, lsl #48
     d18:      	b	0xce4 <_stogir.verify.structure+0xb44>
     d1c:      	uxtb	w16, w20
     d20:      	cmp	w16, wzr
     d24:      	b.eq	0xc54 <_stogir.verify.structure+0xab4>
     d28:      	uxtb	w16, w19
     d2c:      	cmp	w16, wzr
     d30:      	b.eq	0xd48 <_stogir.verify.structure+0xba8>
     d34:      	sxtw	x23, w23
     d38:      	cmp	x23, #0x2
     d3c:      	cset	w0, eq
     d40:      	ubfx	x0, x0, #0, #8
     d44:      	b	0xd4c <_stogir.verify.structure+0xbac>
     d48:      	movz	x0, #0x0, lsl #48
     d4c:      	b	0xc58 <_stogir.verify.structure+0xab8>
     d50:      	brk	#0
     d54:      	b	0xd50 <_stogir.verify.structure+0xbb0>
     d58:      	ldr	x19, [sp, #0x90]
     d5c:      	b	0x4b4 <_stogir.verify.structure+0x314>
     d60:      	ldr	x19, [sp, #0x90]
     d64:      	b	0x4b4 <_stogir.verify.structure+0x314>
     d68:      	mov	x0, x21
     d6c:      	str	x19, [sp, #0xc8]
     d70:      	ldr	x19, [sp, #0x90]
     d74:      	str	x28, [sp, #0xd0]
     d78:      	mov	x21, x20
     d7c:      	str	x23, [sp, #0xb0]
     d80:      	str	x24, [sp, #0xa8]
     d84:      	b	0x2e4 <_stogir.verify.structure+0x144>
     d88:      	mov	x0, x21
     d8c:      	str	x19, [sp, #0xc8]
     d90:      	ldr	x19, [sp, #0x90]
     d94:      	str	x28, [sp, #0xd0]
     d98:      	ldr	x21, [sp, #0xb8]
     d9c:      	b	0x2b8 <_stogir.verify.structure+0x118>
     da0:      	mov	x0, x21
     da4:      	ldr	x19, [sp, #0x90]
     da8:      	str	x28, [sp, #0xd0]
     dac:      	ldr	x21, [sp, #0xb8]
     db0:      	b	0x2b8 <_stogir.verify.structure+0x118>
     db4:      	str	x12, [sp, #0xc8]
     db8:      	str	x2, [sp, #0xd0]
     dbc:      	ldr	x21, [sp, #0xb8]
     dc0:      	str	x10, [sp, #0x120]
     dc4:      	b	0x5ac <_stogir.verify.structure+0x40c>
     dc8:      	str	x21, [sp, #0x118]
     dcc:      	ldr	x21, [sp, #0xb8]
     dd0:      	str	x1, [sp, #0x100]
     dd4:      	str	x2, [sp, #0x108]
     dd8:      	b	0x538 <_stogir.verify.structure+0x398>
     ddc:      	str	w28, [sp, #0xe8]
     de0:      	mov	x28, x0
     de4:      	str	x1, [sp, #0xf0]
     de8:      	str	x2, [sp, #0xf8]
     dec:      	b	0x5fc <_stogir.verify.structure+0x45c>
     df0:      	ldr	x12, [sp, #0xc8]
     df4:      	ldr	x2, [sp, #0xd0]
     df8:      	b	0x85c <_stogir.verify.structure+0x6bc>
     dfc:      	str	x28, [sp, #0xd0]
     e00:      	mov	x28, x0
     e04:      	str	x1, [sp, #0xd8]
     e08:      	str	x2, [sp, #0xe0]
     e0c:      	b	0x914 <_stogir.verify.structure+0x774>
     e10:      	ldr	x12, [sp, #0xc8]
     e14:      	b	0x814 <_stogir.verify.structure+0x674>
     e18:      	str	x12, [sp, #0xc8]
     e1c:      	str	x2, [sp, #0xd0]
     e20:      	str	x0, [sp, #0xb0]
     e24:      	str	x4, [sp, #0xa8]
     e28:      	str	x5, [sp, #0x128]
     e2c:      	str	x10, [sp, #0x120]
     e30:      	b	0xb54 <_stogir.verify.structure+0x9b4>
     e34:      	ldr	x21, [sp, #0xb8]
     e38:      	b	0xc70 <_stogir.verify.structure+0xad0>
     e3c:      	ldr	x21, [sp, #0xb8]
     e40:      	b	0xc5c <_stogir.verify.structure+0xabc>
     e44:      	ldr	x0, [sp, #0xb0]
     e48:      	ldr	x4, [sp, #0xa8]
     e4c:      	b	0xb6c <_stogir.verify.structure+0x9cc>

0000000000000e50 <_stogir.verify.integer-operations-target-structured>:
     e50:      	sub	sp, sp, #0x470
     e54:      	str	x29, [sp, #0x10]
     e58:      	str	x30, [sp, #0x18]
     e5c:      	add	x29, sp, #0x10
     e60:      	str	x19, [sp, #0x420]
     e64:      	str	x20, [sp, #0x428]
     e68:      	str	x21, [sp, #0x430]
     e6c:      	str	x22, [sp, #0x438]
     e70:      	str	x23, [sp, #0x440]
     e74:      	str	x24, [sp, #0x448]
     e78:      	str	x25, [sp, #0x450]
     e7c:      	str	x26, [sp, #0x458]
     e80:      	str	x27, [sp, #0x460]
     e84:      	str	x28, [sp, #0x468]
     e88:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000e88:  ARM64_RELOC_PAGE21	l_stogir.317
     e8c:      	ldr	x16, [x16]
		0000000000000e8c:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     e90:      	orr	x2, x16, xzr
     e94:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000e94:  ARM64_RELOC_PAGE21	l_stogir.318
     e98:      	ldr	x16, [x16]
		0000000000000e98:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     e9c:      	orr	x19, x16, xzr
     ea0:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ea0:  ARM64_RELOC_PAGE21	l_stogir.319
     ea4:      	ldr	x16, [x16]
		0000000000000ea4:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     ea8:      	orr	x20, x16, xzr
     eac:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000eac:  ARM64_RELOC_PAGE21	l_stogir.320
     eb0:      	ldr	x16, [x16]
		0000000000000eb0:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     eb4:      	orr	x21, x16, xzr
     eb8:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000eb8:  ARM64_RELOC_PAGE21	l_stogir.321
     ebc:      	ldr	x16, [x16]
		0000000000000ebc:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     ec0:      	orr	x22, x16, xzr
     ec4:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ec4:  ARM64_RELOC_PAGE21	l_stogir.322
     ec8:      	ldr	x16, [x16]
		0000000000000ec8:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     ecc:      	orr	x23, x16, xzr
     ed0:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ed0:  ARM64_RELOC_PAGE21	l_stogir.323
     ed4:      	ldr	x16, [x16]
		0000000000000ed4:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     ed8:      	orr	x24, x16, xzr
     edc:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000edc:  ARM64_RELOC_PAGE21	l_stogir.324
     ee0:      	ldr	x16, [x16]
		0000000000000ee0:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     ee4:      	orr	x25, x16, xzr
     ee8:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ee8:  ARM64_RELOC_PAGE21	l_stogir.325
     eec:      	ldr	x16, [x16]
		0000000000000eec:  ARM64_RELOC_PAGEOFF12	l_stogir.325
     ef0:      	orr	x26, x16, xzr
     ef4:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000ef4:  ARM64_RELOC_PAGE21	l_stogir.326
     ef8:      	ldr	x16, [x16]
		0000000000000ef8:  ARM64_RELOC_PAGEOFF12	l_stogir.326
     efc:      	orr	x27, x16, xzr
     f00:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000f00:  ARM64_RELOC_PAGE21	l_stogir.327
     f04:      	ldr	x16, [x16]
		0000000000000f04:  ARM64_RELOC_PAGEOFF12	l_stogir.327
     f08:      	orr	x28, x16, xzr
     f0c:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000f0c:  ARM64_RELOC_PAGE21	l_stogir.328
     f10:      	ldr	x16, [x16]
		0000000000000f10:  ARM64_RELOC_PAGEOFF12	l_stogir.328
     f14:      	orr	x3, x16, xzr
     f18:      	lsr	w4, w1, #0
     f1c:      	lsr	w5, w1, #0
     f20:      	lsr	w1, w1, #0
     f24:      	add	x16, sp, #0x20
     f28:      	orr	x6, x16, xzr
     f2c:      	add	x16, sp, #0x30
     f30:      	orr	x7, x16, xzr
     f34:      	add	x7, x7, #0x8
     f38:      	add	x16, sp, #0x50
     f3c:      	orr	x9, x16, xzr
     f40:      	add	x9, x9, #0x8
     f44:      	add	x16, sp, #0xe0
     f48:      	orr	x10, x16, xzr
     f4c:      	add	x10, x10, #0x8
     f50:      	add	x16, sp, #0x100
     f54:      	orr	x11, x16, xzr
     f58:      	add	x11, x11, #0x8
     f5c:      	add	x16, sp, #0x120
     f60:      	orr	x12, x16, xzr
     f64:      	add	x12, x12, #0x8
     f68:      	add	x16, sp, #0x140
     f6c:      	orr	x13, x16, xzr
     f70:      	add	x13, x13, #0x8
     f74:      	add	x16, sp, #0x160
     f78:      	orr	x14, x16, xzr
     f7c:      	add	x14, x14, #0x8
     f80:      	add	x16, sp, #0x180
     f84:      	orr	x15, x16, xzr
     f88:      	add	x15, x15, #0x8
     f8c:      	str	w1, [sp, #0x230]
     f90:      	add	x16, sp, #0x1a0
     f94:      	orr	x1, x16, xzr
     f98:      	add	x1, x1, #0x8
     f9c:      	str	x1, [sp, #0x238]
     fa0:      	add	x16, sp, #0x1f0
     fa4:      	orr	x1, x16, xzr
     fa8:      	add	x1, x1, #0x8
     fac:      	str	x19, [sp, #0x240]
     fb0:      	str	x20, [sp, #0x250]
     fb4:      	str	x2, [sp, #0x248]
     fb8:      	mov	x2, #0x1                ; =1
     fbc:      	movz	x19, #0x0, lsl #48
     fc0:      	movz	x20, #0x0, lsl #48
     fc4:      	str	x1, [sp, #0x258]
     fc8:      	cmp	x20, #0x0
     fcc:      	cset	w1, eq
     fd0:      	uxtb	w16, w1
     fd4:      	cmp	w16, wzr
     fd8:      	b.eq	0x2440 <_stogir.verify.integer-operations-target-structured+0x15f0>
     fdc:      	str	x3, [sp, #0x260]
     fe0:      	ldr	x3, [x0, #0x8]
     fe4:      	cmp	x2, x3
     fe8:      	b.ge	0x244c <_stogir.verify.integer-operations-target-structured+0x15fc>
     fec:      	lsl	x1, x2, #4
     ff0:      	lsl	x3, x2, #2
     ff4:      	str	w4, [sp, #0x268]
     ff8:      	ldr	x4, [x0]
     ffc:      	add	x1, x1, x4
    1000:      	ldr	x4, [x1]
    1004:      	str	x20, [sp, #0x270]
    1008:      	uxtb	w20, w4
    100c:      	ldr	x1, [x1, #0x8]
    1010:      	str	x21, [sp, #0x278]
    1014:      	orr	x21, x20, xzr
    1018:      	add	x16, sp, #0x20
    101c:      	str	x4, [x16]
    1020:      	add	x16, sp, #0x20
    1024:      	str	x1, [x16, #0x8]
    1028:      	ldr	x1, [x0, #0x78]
    102c:      	add	x1, x3, x1
    1030:      	ldr	w1, [x1]
    1034:      	cmp	x21, #0xe
    1038:      	b.lt	0x1a24 <_stogir.verify.integer-operations-target-structured+0xbd4>
    103c:      	cmp	x21, #0x17
    1040:      	cset	w3, le
    1044:      	ubfx	x3, x3, #0, #8
    1048:      	cmp	x21, #0x1a
    104c:      	b.lt	0x1a2c <_stogir.verify.integer-operations-target-structured+0xbdc>
    1050:      	cmp	x21, #0x1e
    1054:      	b.gt	0x1a2c <_stogir.verify.integer-operations-target-structured+0xbdc>
    1058:      	mov	x4, #0x1                ; =1
    105c:      	cmp	x21, #0x1f
    1060:      	b.ne	0x1a64 <_stogir.verify.integer-operations-target-structured+0xc14>
    1064:      	str	x0, [sp, #0x280]
    1068:      	mov	x0, #0x1                ; =1
    106c:      	str	x0, [sp, #0x288]
    1070:      	lsr	w0, w2, #0
    1074:      	lsr	w1, w1, #0
    1078:      	lsr	w0, w0, #0
    107c:      	str	x8, [sp, #0x2d8]
    1080:      	str	w5, [sp, #0x2a0]
    1084:      	str	x6, [sp, #0x2a8]
    1088:      	str	x15, [sp, #0x2e8]
    108c:      	str	x2, [sp, #0x2f0]
    1090:      	mov	x2, x6
    1094:      	str	w1, [sp, #0x2f8]
    1098:      	str	x3, [sp, #0x300]
    109c:      	mov	w3, w1
    10a0:      	mov	w1, w0
    10a4:      	str	x4, [sp, #0x308]
    10a8:      	str	w0, [sp, #0x310]
    10ac:      	ldr	x0, [sp, #0x280]
    10b0:      	str	x22, [sp, #0x290]
    10b4:      	mov	x22, x13
    10b8:      	str	x23, [sp, #0x298]
    10bc:      	ldr	x23, [sp, #0x260]
    10c0:      	str	x24, [sp, #0x2b0]
    10c4:      	mov	x24, x7
    10c8:      	str	x25, [sp, #0x2b8]
    10cc:      	mov	x25, x9
    10d0:      	str	x26, [sp, #0x2c0]
    10d4:      	mov	x26, x10
    10d8:      	str	x27, [sp, #0x2c8]
    10dc:      	mov	x27, x11
    10e0:      	str	x28, [sp, #0x2d0]
    10e4:      	mov	x28, x12
    10e8:      	str	w20, [sp, #0x2e0]
    10ec:      	mov	x20, x14
    10f0:      	bl	0x10f0 <_stogir.verify.integer-operations-target-structured+0x2a0>
		00000000000010f0:  ARM64_RELOC_BRANCH26	_stogir.verify.classifications
    10f4:      	uxtb	w1, w0
    10f8:      	cmp	x1, #0x0
    10fc:      	cset	w1, ne
    1100:      	cmp	x21, #0x3d
    1104:      	b.lt	0x1adc <_stogir.verify.integer-operations-target-structured+0xc8c>
    1108:      	cmp	x21, #0x3f
    110c:      	b.gt	0x1adc <_stogir.verify.integer-operations-target-structured+0xc8c>
    1110:      	add	x8, sp, #0x30
    1114:      	ldr	w2, [sp, #0x268]
    1118:      	str	x0, [sp, #0x318]
    111c:      	ldr	x0, [sp, #0x280]
    1120:      	str	x20, [sp, #0x320]
    1124:      	mov	w20, w1
    1128:      	ldr	w1, [sp, #0x310]
    112c:      	bl	0x112c <_stogir.verify.integer-operations-target-structured+0x2dc>
		000000000000112c:  ARM64_RELOC_BRANCH26	_stogir.vector.validate
    1130:      	add	x16, sp, #0x30
    1134:      	ldr	w0, [x16]
    1138:      	lsr	x16, x0, #0
    113c:      	cmp	x16, #0x1
    1140:      	b.eq	0x115c <_stogir.verify.integer-operations-target-structured+0x30c>
    1144:      	b.lo	0x114c <_stogir.verify.integer-operations-target-structured+0x2fc>
    1148:      	b	0x1160 <_stogir.verify.integer-operations-target-structured+0x310>
    114c:      	cmp	x16, #0x0
    1150:      	b.eq	0x1158 <_stogir.verify.integer-operations-target-structured+0x308>
    1154:      	b	0x1160 <_stogir.verify.integer-operations-target-structured+0x310>
    1158:      	b	0x1b00 <_stogir.verify.integer-operations-target-structured+0xcb0>
    115c:      	b	0x1164 <_stogir.verify.integer-operations-target-structured+0x314>
    1160:      	b	0x23c4 <_stogir.verify.integer-operations-target-structured+0x1574>
    1164:      	add	x16, sp, #0x30
    1168:      	ldr	x0, [x16, #0x8]
    116c:      	ldr	x1, [x24, #0x8]
    1170:      	mov	x2, x1
    1174:      	mov	x1, x0
    1178:      	mov	x0, x19
    117c:      	mov	x19, x0
    1180:      	mov	x0, x1
    1184:      	mov	x1, x2
    1188:      	cmp	x21, #0x44
    118c:      	b.ne	0x1b28 <_stogir.verify.integer-operations-target-structured+0xcd8>
    1190:      	uxtb	w16, w20
    1194:      	cmp	w16, wzr
    1198:      	b.eq	0x1b18 <_stogir.verify.integer-operations-target-structured+0xcc8>
    119c:      	mov	x2, x1
    11a0:      	mov	x1, x0
    11a4:      	movz	x0, #0x0, lsl #48
    11a8:      	cmp	x0, #0x0
    11ac:      	b.eq	0x2458 <_stogir.verify.integer-operations-target-structured+0x1608>
    11b0:      	add	x8, sp, #0x50
    11b4:      	ldr	x0, [sp, #0x280]
    11b8:      	str	x1, [sp, #0x328]
    11bc:      	ldr	w1, [sp, #0x310]
    11c0:      	str	x2, [sp, #0x330]
    11c4:      	bl	0x11c4 <_stogir.verify.integer-operations-target-structured+0x374>
		00000000000011c4:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    11c8:      	add	x16, sp, #0x50
    11cc:      	ldr	w0, [x16]
    11d0:      	lsr	x16, x0, #0
    11d4:      	cmp	x16, #0x1
    11d8:      	b.eq	0x11f4 <_stogir.verify.integer-operations-target-structured+0x3a4>
    11dc:      	b.lo	0x11e4 <_stogir.verify.integer-operations-target-structured+0x394>
    11e0:      	b	0x11f8 <_stogir.verify.integer-operations-target-structured+0x3a8>
    11e4:      	cmp	x16, #0x0
    11e8:      	b.eq	0x11f0 <_stogir.verify.integer-operations-target-structured+0x3a0>
    11ec:      	b	0x11f8 <_stogir.verify.integer-operations-target-structured+0x3a8>
    11f0:      	b	0x1b38 <_stogir.verify.integer-operations-target-structured+0xce8>
    11f4:      	b	0x11fc <_stogir.verify.integer-operations-target-structured+0x3ac>
    11f8:      	b	0x1b50 <_stogir.verify.integer-operations-target-structured+0xd00>
    11fc:      	add	x16, sp, #0x50
    1200:      	ldr	x0, [x16, #0x8]
    1204:      	ldr	x1, [x25, #0x8]
    1208:      	mov	x2, x1
    120c:      	mov	x1, x0
    1210:      	mov	x0, x19
    1214:      	mov	x19, x0
    1218:      	mov	x0, x1
    121c:      	mov	x1, x2
    1220:      	cmp	x21, #0x1d
    1224:      	b.ne	0x1b64 <_stogir.verify.integer-operations-target-structured+0xd14>
    1228:      	mov	x2, x1
    122c:      	mov	x1, x0
    1230:      	mov	x0, #0x1                ; =1
    1234:      	cmp	x0, #0x0
    1238:      	b.eq	0x1b8c <_stogir.verify.integer-operations-target-structured+0xd3c>
    123c:      	add	x16, sp, #0x20
    1240:      	ldr	w0, [x16, #0xc]
    1244:      	sxtw	x0, w0
    1248:      	cmp	x0, #0x0
    124c:      	b.ne	0x1b84 <_stogir.verify.integer-operations-target-structured+0xd34>
    1250:      	movz	x0, #0x0, lsl #48
    1254:      	cmp	x0, #0x0
    1258:      	b.eq	0x2464 <_stogir.verify.integer-operations-target-structured+0x1614>
    125c:      	add	x16, sp, #0x20
    1260:      	ldr	w0, [x16, #0xc]
    1264:      	lsr	w0, w0, #0
    1268:      	add	x8, sp, #0x70
    126c:      	str	x1, [sp, #0x338]
    1270:      	mov	w1, w0
    1274:      	ldr	x0, [sp, #0x280]
    1278:      	str	x2, [sp, #0x340]
    127c:      	bl	0x127c <_stogir.verify.integer-operations-target-structured+0x42c>
		000000000000127c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    1280:      	add	x16, sp, #0x70
    1284:      	ldr	w0, [x16]
    1288:      	lsr	x16, x0, #0
    128c:      	cmp	x16, #0x1
    1290:      	b.eq	0x12ac <_stogir.verify.integer-operations-target-structured+0x45c>
    1294:      	b.lo	0x129c <_stogir.verify.integer-operations-target-structured+0x44c>
    1298:      	b	0x12b0 <_stogir.verify.integer-operations-target-structured+0x460>
    129c:      	cmp	x16, #0x0
    12a0:      	b.eq	0x12a8 <_stogir.verify.integer-operations-target-structured+0x458>
    12a4:      	b	0x12b0 <_stogir.verify.integer-operations-target-structured+0x460>
    12a8:      	b	0x12b4 <_stogir.verify.integer-operations-target-structured+0x464>
    12ac:      	b	0x1b94 <_stogir.verify.integer-operations-target-structured+0xd44>
    12b0:      	b	0x1c48 <_stogir.verify.integer-operations-target-structured+0xdf8>
    12b4:      	ldr	x0, [sp, #0x240]
    12b8:      	mov	x1, #0x16               ; =22
    12bc:      	cmp	x21, #0x29
    12c0:      	b.lt	0x1c5c <_stogir.verify.integer-operations-target-structured+0xe0c>
    12c4:      	cmp	x21, #0x2b
    12c8:      	cset	w2, le
    12cc:      	ubfx	x2, x2, #0, #8
    12d0:      	fmov	d31, x0
    12d4:      	mov	x0, x2
    12d8:      	mov	x2, x1
    12dc:      	fmov	x1, d31
    12e0:      	cmp	x21, #0x2c
    12e4:      	cset	w3, eq
    12e8:      	cmp	x0, #0x0
    12ec:      	b.eq	0x1c6c <_stogir.verify.integer-operations-target-structured+0xe1c>
    12f0:      	mov	x0, #0x1                ; =1
    12f4:      	cmp	x0, #0x0
    12f8:      	b.eq	0x2470 <_stogir.verify.integer-operations-target-structured+0x1620>
    12fc:      	uxtb	w16, w3
    1300:      	cmp	w16, wzr
    1304:      	b.eq	0x247c <_stogir.verify.integer-operations-target-structured+0x162c>
    1308:      	add	x8, sp, #0xa0
    130c:      	ldr	x0, [sp, #0x280]
    1310:      	str	x1, [sp, #0x348]
    1314:      	ldr	w1, [sp, #0x310]
    1318:      	str	x2, [sp, #0x350]
    131c:      	bl	0x131c <_stogir.verify.integer-operations-target-structured+0x4cc>
		000000000000131c:  ARM64_RELOC_BRANCH26	_stogir.checked.validate-projection
    1320:      	add	x16, sp, #0xa0
    1324:      	ldr	x0, [x16]
    1328:      	add	x16, sp, #0xa0
    132c:      	ldr	x1, [x16, #0x8]
    1330:      	add	x16, sp, #0xa0
    1334:      	ldr	x2, [x16, #0x10]
    1338:      	mov	x3, x1
    133c:      	ldr	x1, [sp, #0x350]
    1340:      	mov	x4, x2
    1344:      	mov	x2, x0
    1348:      	ldr	x0, [sp, #0x348]
    134c:      	lsr	w2, w2, #0
    1350:      	lsr	x16, x2, #0
    1354:      	cmp	x16, #0x1
    1358:      	b.eq	0x1374 <_stogir.verify.integer-operations-target-structured+0x524>
    135c:      	b.lo	0x1364 <_stogir.verify.integer-operations-target-structured+0x514>
    1360:      	b	0x1378 <_stogir.verify.integer-operations-target-structured+0x528>
    1364:      	cmp	x16, #0x0
    1368:      	b.eq	0x1370 <_stogir.verify.integer-operations-target-structured+0x520>
    136c:      	b	0x1378 <_stogir.verify.integer-operations-target-structured+0x528>
    1370:      	b	0x1cb4 <_stogir.verify.integer-operations-target-structured+0xe64>
    1374:      	b	0x137c <_stogir.verify.integer-operations-target-structured+0x52c>
    1378:      	b	0x1cd4 <_stogir.verify.integer-operations-target-structured+0xe84>
    137c:      	mov	x0, x19
    1380:      	mov	x1, x3
    1384:      	mov	x2, x4
    1388:      	mov	x19, x0
    138c:      	mov	x0, x1
    1390:      	mov	x1, x2
    1394:      	cmp	x21, #0x7e
    1398:      	b.lt	0x1ce8 <_stogir.verify.integer-operations-target-structured+0xe98>
    139c:      	cmp	x21, #0x82
    13a0:      	cset	w2, le
    13a4:      	ubfx	x2, x2, #0, #8
    13a8:      	fmov	d31, x0
    13ac:      	mov	x0, x2
    13b0:      	mov	x2, x1
    13b4:      	fmov	x1, d31
    13b8:      	cmp	x0, #0x0
    13bc:      	b.eq	0x2488 <_stogir.verify.integer-operations-target-structured+0x1638>
    13c0:      	add	x8, sp, #0xe0
    13c4:      	ldr	x0, [sp, #0x280]
    13c8:      	str	x1, [sp, #0x358]
    13cc:      	ldr	w1, [sp, #0x310]
    13d0:      	str	x2, [sp, #0x360]
    13d4:      	bl	0x13d4 <_stogir.verify.integer-operations-target-structured+0x584>
		00000000000013d4:  ARM64_RELOC_BRANCH26	_stogir.atomic.validate
    13d8:      	add	x16, sp, #0xe0
    13dc:      	ldr	w0, [x16]
    13e0:      	lsr	x16, x0, #0
    13e4:      	cmp	x16, #0x1
    13e8:      	b.eq	0x1404 <_stogir.verify.integer-operations-target-structured+0x5b4>
    13ec:      	b.lo	0x13f4 <_stogir.verify.integer-operations-target-structured+0x5a4>
    13f0:      	b	0x1408 <_stogir.verify.integer-operations-target-structured+0x5b8>
    13f4:      	cmp	x16, #0x0
    13f8:      	b.eq	0x1400 <_stogir.verify.integer-operations-target-structured+0x5b0>
    13fc:      	b	0x1408 <_stogir.verify.integer-operations-target-structured+0x5b8>
    1400:      	b	0x1cf8 <_stogir.verify.integer-operations-target-structured+0xea8>
    1404:      	b	0x140c <_stogir.verify.integer-operations-target-structured+0x5bc>
    1408:      	b	0x1d10 <_stogir.verify.integer-operations-target-structured+0xec0>
    140c:      	add	x16, sp, #0xe0
    1410:      	ldr	x0, [x16, #0x8]
    1414:      	ldr	x1, [x26, #0x8]
    1418:      	mov	x2, x1
    141c:      	mov	x1, x0
    1420:      	mov	x0, x19
    1424:      	mov	x19, x0
    1428:      	mov	x0, x1
    142c:      	mov	x1, x2
    1430:      	cmp	x21, #0x60
    1434:      	b.ne	0x1d24 <_stogir.verify.integer-operations-target-structured+0xed4>
    1438:      	mov	x2, x1
    143c:      	mov	x1, x0
    1440:      	mov	x0, #0x1                ; =1
    1444:      	cmp	x0, #0x0
    1448:      	b.eq	0x2494 <_stogir.verify.integer-operations-target-structured+0x1644>
    144c:      	add	x8, sp, #0x100
    1450:      	ldr	x0, [sp, #0x280]
    1454:      	str	x1, [sp, #0x368]
    1458:      	ldr	w1, [sp, #0x310]
    145c:      	str	x2, [sp, #0x370]
    1460:      	bl	0x1460 <_stogir.verify.integer-operations-target-structured+0x610>
		0000000000001460:  ARM64_RELOC_BRANCH26	_stogir.terminal.validate
    1464:      	add	x16, sp, #0x100
    1468:      	ldr	w0, [x16]
    146c:      	lsr	x16, x0, #0
    1470:      	cmp	x16, #0x1
    1474:      	b.eq	0x1490 <_stogir.verify.integer-operations-target-structured+0x640>
    1478:      	b.lo	0x1480 <_stogir.verify.integer-operations-target-structured+0x630>
    147c:      	b	0x1494 <_stogir.verify.integer-operations-target-structured+0x644>
    1480:      	cmp	x16, #0x0
    1484:      	b.eq	0x148c <_stogir.verify.integer-operations-target-structured+0x63c>
    1488:      	b	0x1494 <_stogir.verify.integer-operations-target-structured+0x644>
    148c:      	b	0x1d44 <_stogir.verify.integer-operations-target-structured+0xef4>
    1490:      	b	0x1498 <_stogir.verify.integer-operations-target-structured+0x648>
    1494:      	b	0x1d5c <_stogir.verify.integer-operations-target-structured+0xf0c>
    1498:      	add	x16, sp, #0x100
    149c:      	ldr	x0, [x16, #0x8]
    14a0:      	ldr	x1, [x27, #0x8]
    14a4:      	mov	x2, x1
    14a8:      	mov	x1, x0
    14ac:      	mov	x0, x19
    14b0:      	mov	x19, x0
    14b4:      	mov	x0, x1
    14b8:      	mov	x1, x2
    14bc:      	cmp	x21, #0x75
    14c0:      	b.ne	0x1d70 <_stogir.verify.integer-operations-target-structured+0xf20>
    14c4:      	mov	x2, x1
    14c8:      	mov	x1, x0
    14cc:      	mov	x0, #0x1                ; =1
    14d0:      	cmp	x0, #0x0
    14d4:      	b.eq	0x24a0 <_stogir.verify.integer-operations-target-structured+0x1650>
    14d8:      	add	x8, sp, #0x120
    14dc:      	ldr	x0, [sp, #0x280]
    14e0:      	str	x1, [sp, #0x378]
    14e4:      	ldr	w1, [sp, #0x310]
    14e8:      	str	x2, [sp, #0x380]
    14ec:      	bl	0x14ec <_stogir.verify.integer-operations-target-structured+0x69c>
		00000000000014ec:  ARM64_RELOC_BRANCH26	_stogir.switch.validate
    14f0:      	add	x16, sp, #0x120
    14f4:      	ldr	w0, [x16]
    14f8:      	lsr	x16, x0, #0
    14fc:      	cmp	x16, #0x1
    1500:      	b.eq	0x151c <_stogir.verify.integer-operations-target-structured+0x6cc>
    1504:      	b.lo	0x150c <_stogir.verify.integer-operations-target-structured+0x6bc>
    1508:      	b	0x1520 <_stogir.verify.integer-operations-target-structured+0x6d0>
    150c:      	cmp	x16, #0x0
    1510:      	b.eq	0x1518 <_stogir.verify.integer-operations-target-structured+0x6c8>
    1514:      	b	0x1520 <_stogir.verify.integer-operations-target-structured+0x6d0>
    1518:      	b	0x1da0 <_stogir.verify.integer-operations-target-structured+0xf50>
    151c:      	b	0x1524 <_stogir.verify.integer-operations-target-structured+0x6d4>
    1520:      	b	0x1db8 <_stogir.verify.integer-operations-target-structured+0xf68>
    1524:      	add	x16, sp, #0x120
    1528:      	ldr	x0, [x16, #0x8]
    152c:      	ldr	x1, [x28, #0x8]
    1530:      	mov	x2, x1
    1534:      	mov	x1, x0
    1538:      	mov	x0, x19
    153c:      	mov	x19, x0
    1540:      	mov	x0, x1
    1544:      	mov	x1, x2
    1548:      	cmp	x21, #0x42
    154c:      	b.ne	0x1dcc <_stogir.verify.integer-operations-target-structured+0xf7c>
    1550:      	mov	x2, x1
    1554:      	mov	x1, x0
    1558:      	mov	x0, #0x1                ; =1
    155c:      	cmp	x0, #0x0
    1560:      	b.eq	0x24ac <_stogir.verify.integer-operations-target-structured+0x165c>
    1564:      	add	x8, sp, #0x140
    1568:      	ldr	x0, [sp, #0x280]
    156c:      	str	x1, [sp, #0x388]
    1570:      	ldr	w1, [sp, #0x310]
    1574:      	str	x2, [sp, #0x390]
    1578:      	bl	0x1578 <_stogir.verify.integer-operations-target-structured+0x728>
		0000000000001578:  ARM64_RELOC_BRANCH26	_stogir.stack.validate
    157c:      	add	x16, sp, #0x140
    1580:      	ldr	w0, [x16]
    1584:      	lsr	x16, x0, #0
    1588:      	cmp	x16, #0x1
    158c:      	b.eq	0x15a8 <_stogir.verify.integer-operations-target-structured+0x758>
    1590:      	b.lo	0x1598 <_stogir.verify.integer-operations-target-structured+0x748>
    1594:      	b	0x15ac <_stogir.verify.integer-operations-target-structured+0x75c>
    1598:      	cmp	x16, #0x0
    159c:      	b.eq	0x15a4 <_stogir.verify.integer-operations-target-structured+0x754>
    15a0:      	b	0x15ac <_stogir.verify.integer-operations-target-structured+0x75c>
    15a4:      	b	0x1e1c <_stogir.verify.integer-operations-target-structured+0xfcc>
    15a8:      	b	0x15b0 <_stogir.verify.integer-operations-target-structured+0x760>
    15ac:      	b	0x1e34 <_stogir.verify.integer-operations-target-structured+0xfe4>
    15b0:      	add	x16, sp, #0x140
    15b4:      	ldr	x0, [x16, #0x8]
    15b8:      	ldr	x1, [x22, #0x8]
    15bc:      	mov	x2, x1
    15c0:      	mov	x1, x0
    15c4:      	mov	x0, x19
    15c8:      	mov	x19, x0
    15cc:      	mov	x0, x1
    15d0:      	mov	x1, x2
    15d4:      	cmp	x21, #0x41
    15d8:      	b.ne	0x1e48 <_stogir.verify.integer-operations-target-structured+0xff8>
    15dc:      	mov	x2, x1
    15e0:      	mov	x1, x0
    15e4:      	mov	x0, #0x1                ; =1
    15e8:      	cmp	x0, #0x0
    15ec:      	b.eq	0x24b8 <_stogir.verify.integer-operations-target-structured+0x1668>
    15f0:      	add	x8, sp, #0x160
    15f4:      	ldr	x0, [sp, #0x280]
    15f8:      	str	x1, [sp, #0x398]
    15fc:      	ldr	w1, [sp, #0x310]
    1600:      	str	x2, [sp, #0x3a0]
    1604:      	ldr	w2, [sp, #0x2a0]
    1608:      	bl	0x1608 <_stogir.verify.integer-operations-target-structured+0x7b8>
		0000000000001608:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    160c:      	add	x16, sp, #0x160
    1610:      	ldr	w0, [x16]
    1614:      	lsr	x16, x0, #0
    1618:      	cmp	x16, #0x1
    161c:      	b.eq	0x163c <_stogir.verify.integer-operations-target-structured+0x7ec>
    1620:      	b.lo	0x1628 <_stogir.verify.integer-operations-target-structured+0x7d8>
    1624:      	b	0x1640 <_stogir.verify.integer-operations-target-structured+0x7f0>
    1628:      	cmp	x16, #0x0
    162c:      	b.eq	0x1634 <_stogir.verify.integer-operations-target-structured+0x7e4>
    1630:      	b	0x1640 <_stogir.verify.integer-operations-target-structured+0x7f0>
    1634:      	ldr	x1, [sp, #0x320]
    1638:      	b	0x1e88 <_stogir.verify.integer-operations-target-structured+0x1038>
    163c:      	b	0x1644 <_stogir.verify.integer-operations-target-structured+0x7f4>
    1640:      	b	0x1ea0 <_stogir.verify.integer-operations-target-structured+0x1050>
    1644:      	add	x16, sp, #0x160
    1648:      	ldr	x0, [x16, #0x8]
    164c:      	ldr	x1, [sp, #0x320]
    1650:      	ldr	x2, [x1, #0x8]
    1654:      	mov	x3, x2
    1658:      	mov	x2, x0
    165c:      	mov	x0, x19
    1660:      	mov	x19, x0
    1664:      	mov	x0, x2
    1668:      	mov	x2, x3
    166c:      	cmp	x21, #0x21
    1670:      	b.lt	0x1eb4 <_stogir.verify.integer-operations-target-structured+0x1064>
    1674:      	cmp	x21, #0x27
    1678:      	cset	w3, le
    167c:      	ubfx	x3, x3, #0, #8
    1680:      	fmov	d31, x0
    1684:      	mov	x0, x3
    1688:      	mov	x3, x2
    168c:      	fmov	x2, d31
    1690:      	cmp	x0, #0x0
    1694:      	b.eq	0x24c8 <_stogir.verify.integer-operations-target-structured+0x1678>
    1698:      	add	x8, sp, #0x180
    169c:      	ldr	x0, [sp, #0x280]
    16a0:      	str	x1, [sp, #0x320]
    16a4:      	ldr	w1, [sp, #0x310]
    16a8:      	str	x2, [sp, #0x3a8]
    16ac:      	ldr	w2, [sp, #0x230]
    16b0:      	str	x3, [sp, #0x3b0]
    16b4:      	bl	0x16b4 <_stogir.verify.integer-operations-target-structured+0x864>
		00000000000016b4:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    16b8:      	add	x16, sp, #0x180
    16bc:      	ldr	w0, [x16]
    16c0:      	lsr	x16, x0, #0
    16c4:      	cmp	x16, #0x1
    16c8:      	b.eq	0x16e8 <_stogir.verify.integer-operations-target-structured+0x898>
    16cc:      	b.lo	0x16d4 <_stogir.verify.integer-operations-target-structured+0x884>
    16d0:      	b	0x16ec <_stogir.verify.integer-operations-target-structured+0x89c>
    16d4:      	cmp	x16, #0x0
    16d8:      	b.eq	0x16e0 <_stogir.verify.integer-operations-target-structured+0x890>
    16dc:      	b	0x16ec <_stogir.verify.integer-operations-target-structured+0x89c>
    16e0:      	ldr	x1, [sp, #0x2e8]
    16e4:      	b	0x1ec4 <_stogir.verify.integer-operations-target-structured+0x1074>
    16e8:      	b	0x16f0 <_stogir.verify.integer-operations-target-structured+0x8a0>
    16ec:      	b	0x1edc <_stogir.verify.integer-operations-target-structured+0x108c>
    16f0:      	add	x16, sp, #0x180
    16f4:      	ldr	x0, [x16, #0x8]
    16f8:      	ldr	x1, [sp, #0x2e8]
    16fc:      	ldr	x2, [x1, #0x8]
    1700:      	mov	x3, x2
    1704:      	mov	x2, x0
    1708:      	mov	x0, x19
    170c:      	mov	x19, x0
    1710:      	mov	x0, x2
    1714:      	mov	x2, x3
    1718:      	cmp	x21, #0x3c
    171c:      	b.ne	0x24dc <_stogir.verify.integer-operations-target-structured+0x168c>
    1720:      	add	x8, sp, #0x1a0
    1724:      	str	x1, [sp, #0x2e8]
    1728:      	ldr	w1, [sp, #0x310]
    172c:      	str	x0, [sp, #0x3b8]
    1730:      	ldr	x0, [sp, #0x280]
    1734:      	str	x2, [sp, #0x3c0]
    1738:      	bl	0x1738 <_stogir.verify.integer-operations-target-structured+0x8e8>
		0000000000001738:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    173c:      	add	x16, sp, #0x1a0
    1740:      	ldr	w0, [x16]
    1744:      	lsr	x16, x0, #0
    1748:      	cmp	x16, #0x1
    174c:      	b.eq	0x176c <_stogir.verify.integer-operations-target-structured+0x91c>
    1750:      	b.lo	0x1758 <_stogir.verify.integer-operations-target-structured+0x908>
    1754:      	b	0x1770 <_stogir.verify.integer-operations-target-structured+0x920>
    1758:      	cmp	x16, #0x0
    175c:      	b.eq	0x1764 <_stogir.verify.integer-operations-target-structured+0x914>
    1760:      	b	0x1770 <_stogir.verify.integer-operations-target-structured+0x920>
    1764:      	ldr	x1, [sp, #0x238]
    1768:      	b	0x1ef0 <_stogir.verify.integer-operations-target-structured+0x10a0>
    176c:      	b	0x1774 <_stogir.verify.integer-operations-target-structured+0x924>
    1770:      	b	0x1f08 <_stogir.verify.integer-operations-target-structured+0x10b8>
    1774:      	add	x16, sp, #0x1a0
    1778:      	ldr	x0, [x16, #0x8]
    177c:      	ldr	x1, [sp, #0x238]
    1780:      	ldr	x2, [x1, #0x8]
    1784:      	mov	x3, x2
    1788:      	mov	x2, x0
    178c:      	mov	x0, x19
    1790:      	mov	x19, x0
    1794:      	mov	x0, x2
    1798:      	mov	x2, x3
    179c:      	cmp	x21, #0x78
    17a0:      	b.ne	0x24f0 <_stogir.verify.integer-operations-target-structured+0x16a0>
    17a4:      	add	x16, sp, #0x20
    17a8:      	ldr	w3, [x16]
    17ac:      	ubfx	x3, x3, #8, #8
    17b0:      	cmp	x3, #0x0
    17b4:      	b.ne	0x1f38 <_stogir.verify.integer-operations-target-structured+0x10e8>
    17b8:      	add	x16, sp, #0x20
    17bc:      	ldr	w3, [x16, #0x8]
    17c0:      	sxtw	x3, w3
    17c4:      	cmp	x3, #0x0
    17c8:      	b.ne	0x1f1c <_stogir.verify.integer-operations-target-structured+0x10cc>
    17cc:      	mov	x3, x2
    17d0:      	mov	x2, x0
    17d4:      	movz	x0, #0x0, lsl #48
    17d8:      	cmp	x0, #0x0
    17dc:      	b.eq	0x1f2c <_stogir.verify.integer-operations-target-structured+0x10dc>
    17e0:      	ldr	x0, [sp, #0x278]
    17e4:      	mov	x2, #0x1f               ; =31
    17e8:      	str	x1, [sp, #0x238]
    17ec:      	mov	x1, x2
    17f0:      	add	x2, x19, #0x1
    17f4:      	lsr	w2, w2, #0
    17f8:      	sxtw	x2, w2
    17fc:      	mov	x19, x2
    1800:      	ldr	x2, [sp, #0x318]
    1804:      	uxth	w2, w2
    1808:      	mov	w17, #0x8               ; =8
    180c:      	uxth	w16, w2
    1810:      	ubfx	w17, w17, #0, #4
    1814:      	lsr	w2, w16, w17
    1818:      	uxth	w2, w2
    181c:      	uxtb	w2, w2
    1820:      	cmp	x2, #0x0
    1824:      	b.eq	0x2500 <_stogir.verify.integer-operations-target-structured+0x16b0>
    1828:      	add	x8, sp, #0x1f0
    182c:      	str	x0, [sp, #0x3d8]
    1830:      	ldr	x0, [sp, #0x280]
    1834:      	str	x1, [sp, #0x3e0]
    1838:      	ldr	w1, [sp, #0x310]
    183c:      	str	x22, [sp, #0x3e8]
    1840:      	mov	x22, x2
    1844:      	bl	0x1844 <_stogir.verify.integer-operations-target-structured+0x9f4>
		0000000000001844:  ARM64_RELOC_BRANCH26	_stogir.floating.validate
    1848:      	add	x16, sp, #0x1f0
    184c:      	ldr	w0, [x16]
    1850:      	lsr	x16, x0, #0
    1854:      	cmp	x16, #0x1
    1858:      	b.eq	0x1878 <_stogir.verify.integer-operations-target-structured+0xa28>
    185c:      	b.lo	0x1864 <_stogir.verify.integer-operations-target-structured+0xa14>
    1860:      	b	0x187c <_stogir.verify.integer-operations-target-structured+0xa2c>
    1864:      	cmp	x16, #0x0
    1868:      	b.eq	0x1870 <_stogir.verify.integer-operations-target-structured+0xa20>
    186c:      	b	0x187c <_stogir.verify.integer-operations-target-structured+0xa2c>
    1870:      	ldr	x1, [sp, #0x258]
    1874:      	b	0x1ff0 <_stogir.verify.integer-operations-target-structured+0x11a0>
    1878:      	b	0x1880 <_stogir.verify.integer-operations-target-structured+0xa30>
    187c:      	b	0x2008 <_stogir.verify.integer-operations-target-structured+0x11b8>
    1880:      	add	x16, sp, #0x1f0
    1884:      	ldr	x0, [x16, #0x8]
    1888:      	ldr	x1, [sp, #0x258]
    188c:      	ldr	x2, [x1, #0x8]
    1890:      	mov	x3, x2
    1894:      	mov	x2, x0
    1898:      	mov	x0, x19
    189c:      	mov	x19, x0
    18a0:      	mov	x0, x2
    18a4:      	mov	x2, x3
    18a8:      	uxtb	w16, w20
    18ac:      	cmp	w16, wzr
    18b0:      	b.eq	0x201c <_stogir.verify.integer-operations-target-structured+0x11cc>
    18b4:      	mov	x3, x2
    18b8:      	mov	x2, x0
    18bc:      	movz	x0, #0x0, lsl #48
    18c0:      	cmp	x0, #0x0
    18c4:      	b.eq	0x2518 <_stogir.verify.integer-operations-target-structured+0x16c8>
    18c8:      	cmp	x22, #0x0
    18cc:      	b.eq	0x202c <_stogir.verify.integer-operations-target-structured+0x11dc>
    18d0:      	movz	x0, #0x0, lsl #48
    18d4:      	cmp	x0, #0x0
    18d8:      	b.eq	0x2524 <_stogir.verify.integer-operations-target-structured+0x16d4>
    18dc:      	ldr	x20, [sp, #0x300]
    18e0:      	cmp	x20, #0x0
    18e4:      	b.eq	0x2034 <_stogir.verify.integer-operations-target-structured+0x11e4>
    18e8:      	ldr	x22, [sp, #0x308]
    18ec:      	mov	x0, #0x1                ; =1
    18f0:      	cmp	x0, #0x0
    18f4:      	b.eq	0x2530 <_stogir.verify.integer-operations-target-structured+0x16e0>
    18f8:      	add	x16, sp, #0x210
    18fc:      	str	x16, [sp]
    1900:      	ldr	x0, [sp, #0x280]
    1904:      	str	x1, [sp, #0x258]
    1908:      	ldr	w1, [sp, #0x310]
    190c:      	str	x2, [sp, #0x3f0]
    1910:      	str	x3, [sp, #0x3f8]
    1914:      	mov	x2, #0x1                ; =1
    1918:      	bl	0x1918 <_stogir.verify.integer-operations-target-structured+0xac8>
		0000000000001918:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    191c:      	ldr	x16, [sp]
    1920:      	str	x0, [x16]
    1924:      	str	x1, [x16, #0x8]
    1928:      	add	x16, sp, #0x210
    192c:      	ldr	x0, [x16]
    1930:      	add	x16, sp, #0x210
    1934:      	ldr	x1, [x16, #0x8]
    1938:      	lsr	w0, w0, #0
    193c:      	lsr	x16, x0, #0
    1940:      	cmp	x16, #0x1
    1944:      	b.eq	0x1960 <_stogir.verify.integer-operations-target-structured+0xb10>
    1948:      	b.lo	0x1950 <_stogir.verify.integer-operations-target-structured+0xb00>
    194c:      	b	0x1964 <_stogir.verify.integer-operations-target-structured+0xb14>
    1950:      	cmp	x16, #0x0
    1954:      	b.eq	0x195c <_stogir.verify.integer-operations-target-structured+0xb0c>
    1958:      	b	0x1964 <_stogir.verify.integer-operations-target-structured+0xb14>
    195c:      	b	0x1968 <_stogir.verify.integer-operations-target-structured+0xb18>
    1960:      	b	0x2060 <_stogir.verify.integer-operations-target-structured+0x1210>
    1964:      	b	0x23ac <_stogir.verify.integer-operations-target-structured+0x155c>
    1968:      	str	x23, [sp, #0x260]
    196c:      	ldr	x0, [sp, #0x2b0]
    1970:      	mov	x1, #0x17               ; =23
    1974:      	add	x2, x19, #0x1
    1978:      	lsr	w2, w2, #0
    197c:      	sxtw	x2, w2
    1980:      	fmov	d31, x0
    1984:      	mov	x0, x2
    1988:      	mov	x2, x1
    198c:      	fmov	x1, d31
    1990:      	ldr	w3, [sp, #0x2f8]
    1994:      	sxtw	x3, w3
    1998:      	add	x3, x3, #0x4
    199c:      	asr	x16, x3, #63
    19a0:      	lsr	x16, x16, #62
    19a4:      	add	x3, x3, x16
    19a8:      	asr	x3, x3, #2
    19ac:      	ldr	x4, [sp, #0x2f0]
    19b0:      	add	x3, x3, x4
    19b4:      	ldr	x8, [sp, #0x2d8]
    19b8:      	ldr	x6, [sp, #0x2a8]
    19bc:      	ldr	x21, [sp, #0x278]
    19c0:      	ldr	x22, [sp, #0x290]
    19c4:      	ldr	x23, [sp, #0x298]
    19c8:      	ldr	w4, [sp, #0x268]
    19cc:      	mov	x7, x24
    19d0:      	ldr	x24, [sp, #0x2b0]
    19d4:      	mov	x9, x25
    19d8:      	ldr	x25, [sp, #0x2b8]
    19dc:      	mov	x10, x26
    19e0:      	ldr	x26, [sp, #0x2c0]
    19e4:      	mov	x11, x27
    19e8:      	ldr	x27, [sp, #0x2c8]
    19ec:      	mov	x12, x28
    19f0:      	ldr	x28, [sp, #0x2d0]
    19f4:      	ldr	x13, [sp, #0x3e8]
    19f8:      	ldr	w5, [sp, #0x2a0]
    19fc:      	ldr	x14, [sp, #0x320]
    1a00:      	ldr	x15, [sp, #0x2e8]
    1a04:      	mov	x19, x0
    1a08:      	ldr	x0, [sp, #0x280]
    1a0c:      	str	x1, [sp, #0x248]
    1a10:      	ldr	x1, [sp, #0x258]
    1a14:      	mov	x20, x2
    1a18:      	mov	x2, x3
    1a1c:      	ldr	x3, [sp, #0x260]
    1a20:      	b	0xfc4 <_stogir.verify.integer-operations-target-structured+0x174>
    1a24:      	movz	x3, #0x0, lsl #48
    1a28:      	b	0x1048 <_stogir.verify.integer-operations-target-structured+0x1f8>
    1a2c:      	cmp	x21, #0x2e
    1a30:      	b.lt	0x1a44 <_stogir.verify.integer-operations-target-structured+0xbf4>
    1a34:      	cmp	x21, #0x35
    1a38:      	b.gt	0x1a44 <_stogir.verify.integer-operations-target-structured+0xbf4>
    1a3c:      	mov	x4, #0x1                ; =1
    1a40:      	b	0x105c <_stogir.verify.integer-operations-target-structured+0x20c>
    1a44:      	cmp	x21, #0x3a
    1a48:      	b.ne	0x1a54 <_stogir.verify.integer-operations-target-structured+0xc04>
    1a4c:      	mov	x4, #0x1                ; =1
    1a50:      	b	0x1a40 <_stogir.verify.integer-operations-target-structured+0xbf0>
    1a54:      	cmp	x21, #0x3b
    1a58:      	cset	w4, eq
    1a5c:      	ubfx	x4, x4, #0, #8
    1a60:      	b	0x1a50 <_stogir.verify.integer-operations-target-structured+0xc00>
    1a64:      	cmp	x21, #0x20
    1a68:      	b.ne	0x1a78 <_stogir.verify.integer-operations-target-structured+0xc28>
    1a6c:      	str	x0, [sp, #0x280]
    1a70:      	mov	x0, #0x1                ; =1
    1a74:      	b	0x106c <_stogir.verify.integer-operations-target-structured+0x21c>
    1a78:      	cmp	x21, #0x2d
    1a7c:      	b.ne	0x1a8c <_stogir.verify.integer-operations-target-structured+0xc3c>
    1a80:      	str	x0, [sp, #0x280]
    1a84:      	mov	x0, #0x1                ; =1
    1a88:      	b	0x1a74 <_stogir.verify.integer-operations-target-structured+0xc24>
    1a8c:      	cmp	x21, #0x36
    1a90:      	b.ne	0x1aa0 <_stogir.verify.integer-operations-target-structured+0xc50>
    1a94:      	str	x0, [sp, #0x280]
    1a98:      	mov	x0, #0x1                ; =1
    1a9c:      	b	0x1a88 <_stogir.verify.integer-operations-target-structured+0xc38>
    1aa0:      	cmp	x21, #0x37
    1aa4:      	b.ne	0x1ab4 <_stogir.verify.integer-operations-target-structured+0xc64>
    1aa8:      	str	x0, [sp, #0x280]
    1aac:      	mov	x0, #0x1                ; =1
    1ab0:      	b	0x1a9c <_stogir.verify.integer-operations-target-structured+0xc4c>
    1ab4:      	cmp	x21, #0x38
    1ab8:      	b.ne	0x1ac8 <_stogir.verify.integer-operations-target-structured+0xc78>
    1abc:      	str	x0, [sp, #0x280]
    1ac0:      	mov	x0, #0x1                ; =1
    1ac4:      	b	0x1ab0 <_stogir.verify.integer-operations-target-structured+0xc60>
    1ac8:      	str	x0, [sp, #0x280]
    1acc:      	cmp	x21, #0x39
    1ad0:      	cset	w0, eq
    1ad4:      	ubfx	x0, x0, #0, #8
    1ad8:      	b	0x1ac4 <_stogir.verify.integer-operations-target-structured+0xc74>
    1adc:      	uxtb	w16, w1
    1ae0:      	cmp	w16, wzr
    1ae4:      	b.ne	0x1110 <_stogir.verify.integer-operations-target-structured+0x2c0>
    1ae8:      	str	x0, [sp, #0x318]
    1aec:      	str	x20, [sp, #0x320]
    1af0:      	mov	w20, w1
    1af4:      	ldr	x0, [sp, #0x248]
    1af8:      	ldr	x1, [sp, #0x270]
    1afc:      	b	0x1188 <_stogir.verify.integer-operations-target-structured+0x338>
    1b00:      	add	x0, x19, #0x1
    1b04:      	lsr	w0, w0, #0
    1b08:      	sxtw	x0, w0
    1b0c:      	ldr	x1, [sp, #0x248]
    1b10:      	ldr	x2, [sp, #0x270]
    1b14:      	b	0x117c <_stogir.verify.integer-operations-target-structured+0x32c>
    1b18:      	mov	x2, x1
    1b1c:      	mov	x1, x0
    1b20:      	mov	x0, #0x1                ; =1
    1b24:      	b	0x11a8 <_stogir.verify.integer-operations-target-structured+0x358>
    1b28:      	mov	x2, x1
    1b2c:      	mov	x1, x0
    1b30:      	movz	x0, #0x0, lsl #48
    1b34:      	b	0x11a8 <_stogir.verify.integer-operations-target-structured+0x358>
    1b38:      	add	x0, x19, #0x1
    1b3c:      	lsr	w0, w0, #0
    1b40:      	sxtw	x0, w0
    1b44:      	ldr	x1, [sp, #0x328]
    1b48:      	ldr	x2, [sp, #0x330]
    1b4c:      	b	0x1214 <_stogir.verify.integer-operations-target-structured+0x3c4>
    1b50:      	brk	#0
    1b54:      	b	0x1b50 <_stogir.verify.integer-operations-target-structured+0xd00>
    1b58:      	ldr	x0, [sp, #0x328]
    1b5c:      	ldr	x1, [sp, #0x330]
    1b60:      	b	0x1220 <_stogir.verify.integer-operations-target-structured+0x3d0>
    1b64:      	cmp	x21, #0x1e
    1b68:      	cset	w2, eq
    1b6c:      	ubfx	x2, x2, #0, #8
    1b70:      	fmov	d31, x0
    1b74:      	mov	x0, x2
    1b78:      	mov	x2, x1
    1b7c:      	fmov	x1, d31
    1b80:      	b	0x1234 <_stogir.verify.integer-operations-target-structured+0x3e4>
    1b84:      	mov	x0, #0x1                ; =1
    1b88:      	b	0x1254 <_stogir.verify.integer-operations-target-structured+0x404>
    1b8c:      	movz	x0, #0x0, lsl #48
    1b90:      	b	0x1254 <_stogir.verify.integer-operations-target-structured+0x404>
    1b94:      	add	x16, sp, #0x70
    1b98:      	ldr	x0, [x16, #0x8]
    1b9c:      	add	x16, sp, #0x20
    1ba0:      	ldr	w1, [x16, #0xc]
    1ba4:      	sxtw	x1, w1
    1ba8:      	cmp	x1, #0x0
    1bac:      	b.ge	0x1bd0 <_stogir.verify.integer-operations-target-structured+0xd80>
    1bb0:      	ldr	x1, [sp, #0x338]
    1bb4:      	ldr	x2, [sp, #0x340]
    1bb8:      	mov	x0, #0x1                ; =1
    1bbc:      	cmp	x0, #0x0
    1bc0:      	b.eq	0x1c3c <_stogir.verify.integer-operations-target-structured+0xdec>
    1bc4:      	ldr	x0, [sp, #0x250]
    1bc8:      	mov	x1, #0x2d               ; =45
    1bcc:      	b	0x12bc <_stogir.verify.integer-operations-target-structured+0x46c>
    1bd0:      	uxtb	w0, w0
    1bd4:      	cmp	x0, #0x83
    1bd8:      	b.ge	0x1c2c <_stogir.verify.integer-operations-target-structured+0xddc>
    1bdc:      	add	x1, x0, x23
    1be0:      	ldrb	w1, [x1]
    1be4:      	uxtb	w1, w1
    1be8:      	and	x1, x1, #0x2
    1bec:      	uxtb	w1, w1
    1bf0:      	cmp	x1, #0x0
    1bf4:      	cset	w1, eq
    1bf8:      	uxtb	w16, w1
    1bfc:      	cmp	w16, wzr
    1c00:      	cset	x1, eq
    1c04:      	cmp	x1, #0x0
    1c08:      	b.ne	0x1c34 <_stogir.verify.integer-operations-target-structured+0xde4>
    1c0c:      	cmp	x0, #0x65
    1c10:      	b.eq	0x1c34 <_stogir.verify.integer-operations-target-structured+0xde4>
    1c14:      	cmp	x0, #0x66
    1c18:      	b.eq	0x1c34 <_stogir.verify.integer-operations-target-structured+0xde4>
    1c1c:      	mov	x0, #0x1                ; =1
    1c20:      	ldr	x1, [sp, #0x338]
    1c24:      	ldr	x2, [sp, #0x340]
    1c28:      	b	0x1bbc <_stogir.verify.integer-operations-target-structured+0xd6c>
    1c2c:      	movz	x1, #0x0, lsl #48
    1c30:      	b	0x1be4 <_stogir.verify.integer-operations-target-structured+0xd94>
    1c34:      	movz	x0, #0x0, lsl #48
    1c38:      	b	0x1c20 <_stogir.verify.integer-operations-target-structured+0xdd0>
    1c3c:      	mov	x0, x1
    1c40:      	mov	x1, x2
    1c44:      	b	0x1bcc <_stogir.verify.integer-operations-target-structured+0xd7c>
    1c48:      	brk	#0
    1c4c:      	b	0x1c48 <_stogir.verify.integer-operations-target-structured+0xdf8>
    1c50:      	ldr	x0, [sp, #0x338]
    1c54:      	ldr	x1, [sp, #0x340]
    1c58:      	b	0x12bc <_stogir.verify.integer-operations-target-structured+0x46c>
    1c5c:      	mov	x2, x1
    1c60:      	mov	x1, x0
    1c64:      	movz	x0, #0x0, lsl #48
    1c68:      	b	0x12e0 <_stogir.verify.integer-operations-target-structured+0x490>
    1c6c:      	ubfx	x0, x3, #0, #8
    1c70:      	b	0x12f4 <_stogir.verify.integer-operations-target-structured+0x4a4>
    1c74:      	add	x8, sp, #0xc0
    1c78:      	ldr	x0, [sp, #0x280]
    1c7c:      	ldr	w1, [sp, #0x310]
    1c80:      	bl	0x1c80 <_stogir.verify.integer-operations-target-structured+0xe30>
		0000000000001c80:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    1c84:      	add	x16, sp, #0xc0
    1c88:      	ldr	x0, [x16]
    1c8c:      	add	x16, sp, #0xc0
    1c90:      	ldr	x1, [x16, #0x8]
    1c94:      	add	x16, sp, #0xc0
    1c98:      	ldr	x2, [x16, #0x10]
    1c9c:      	mov	x3, x1
    1ca0:      	ldr	x1, [sp, #0x350]
    1ca4:      	mov	x4, x2
    1ca8:      	mov	x2, x0
    1cac:      	ldr	x0, [sp, #0x348]
    1cb0:      	b	0x134c <_stogir.verify.integer-operations-target-structured+0x4fc>
    1cb4:      	add	x2, x19, #0x1
    1cb8:      	lsr	w2, w2, #0
    1cbc:      	sxtw	x2, w2
    1cc0:      	fmov	d31, x0
    1cc4:      	mov	x0, x2
    1cc8:      	mov	x2, x1
    1ccc:      	fmov	x1, d31
    1cd0:      	b	0x1388 <_stogir.verify.integer-operations-target-structured+0x538>
    1cd4:      	brk	#0
    1cd8:      	b	0x1cd4 <_stogir.verify.integer-operations-target-structured+0xe84>
    1cdc:      	ldr	x0, [sp, #0x348]
    1ce0:      	ldr	x1, [sp, #0x350]
    1ce4:      	b	0x1394 <_stogir.verify.integer-operations-target-structured+0x544>
    1ce8:      	mov	x2, x1
    1cec:      	mov	x1, x0
    1cf0:      	movz	x0, #0x0, lsl #48
    1cf4:      	b	0x13b8 <_stogir.verify.integer-operations-target-structured+0x568>
    1cf8:      	add	x0, x19, #0x1
    1cfc:      	lsr	w0, w0, #0
    1d00:      	sxtw	x0, w0
    1d04:      	ldr	x1, [sp, #0x358]
    1d08:      	ldr	x2, [sp, #0x360]
    1d0c:      	b	0x1424 <_stogir.verify.integer-operations-target-structured+0x5d4>
    1d10:      	brk	#0
    1d14:      	b	0x1d10 <_stogir.verify.integer-operations-target-structured+0xec0>
    1d18:      	ldr	x0, [sp, #0x358]
    1d1c:      	ldr	x1, [sp, #0x360]
    1d20:      	b	0x1430 <_stogir.verify.integer-operations-target-structured+0x5e0>
    1d24:      	cmp	x21, #0x79
    1d28:      	cset	w2, eq
    1d2c:      	ubfx	x2, x2, #0, #8
    1d30:      	fmov	d31, x0
    1d34:      	mov	x0, x2
    1d38:      	mov	x2, x1
    1d3c:      	fmov	x1, d31
    1d40:      	b	0x1444 <_stogir.verify.integer-operations-target-structured+0x5f4>
    1d44:      	add	x0, x19, #0x1
    1d48:      	lsr	w0, w0, #0
    1d4c:      	sxtw	x0, w0
    1d50:      	ldr	x1, [sp, #0x368]
    1d54:      	ldr	x2, [sp, #0x370]
    1d58:      	b	0x14b0 <_stogir.verify.integer-operations-target-structured+0x660>
    1d5c:      	brk	#0
    1d60:      	b	0x1d5c <_stogir.verify.integer-operations-target-structured+0xf0c>
    1d64:      	ldr	x0, [sp, #0x368]
    1d68:      	ldr	x1, [sp, #0x370]
    1d6c:      	b	0x14bc <_stogir.verify.integer-operations-target-structured+0x66c>
    1d70:      	cmp	x21, #0x6d
    1d74:      	b.lt	0x1d98 <_stogir.verify.integer-operations-target-structured+0xf48>
    1d78:      	cmp	x21, #0x6f
    1d7c:      	cset	w2, le
    1d80:      	ubfx	x2, x2, #0, #8
    1d84:      	fmov	d31, x0
    1d88:      	mov	x0, x2
    1d8c:      	mov	x2, x1
    1d90:      	fmov	x1, d31
    1d94:      	b	0x14d0 <_stogir.verify.integer-operations-target-structured+0x680>
    1d98:      	movz	x2, #0x0, lsl #48
    1d9c:      	b	0x1d84 <_stogir.verify.integer-operations-target-structured+0xf34>
    1da0:      	add	x0, x19, #0x1
    1da4:      	lsr	w0, w0, #0
    1da8:      	sxtw	x0, w0
    1dac:      	ldr	x1, [sp, #0x378]
    1db0:      	ldr	x2, [sp, #0x380]
    1db4:      	b	0x153c <_stogir.verify.integer-operations-target-structured+0x6ec>
    1db8:      	brk	#0
    1dbc:      	b	0x1db8 <_stogir.verify.integer-operations-target-structured+0xf68>
    1dc0:      	ldr	x0, [sp, #0x378]
    1dc4:      	ldr	x1, [sp, #0x380]
    1dc8:      	b	0x1548 <_stogir.verify.integer-operations-target-structured+0x6f8>
    1dcc:      	cmp	x21, #0x51
    1dd0:      	b.ne	0x1dec <_stogir.verify.integer-operations-target-structured+0xf9c>
    1dd4:      	mov	x2, #0x1                ; =1
    1dd8:      	fmov	d31, x0
    1ddc:      	mov	x0, x2
    1de0:      	mov	x2, x1
    1de4:      	fmov	x1, d31
    1de8:      	b	0x155c <_stogir.verify.integer-operations-target-structured+0x70c>
    1dec:      	cmp	x21, #0x52
    1df0:      	b.ne	0x1dfc <_stogir.verify.integer-operations-target-structured+0xfac>
    1df4:      	mov	x2, #0x1                ; =1
    1df8:      	b	0x1dd8 <_stogir.verify.integer-operations-target-structured+0xf88>
    1dfc:      	cmp	x21, #0x53
    1e00:      	b.ne	0x1e0c <_stogir.verify.integer-operations-target-structured+0xfbc>
    1e04:      	mov	x2, #0x1                ; =1
    1e08:      	b	0x1df8 <_stogir.verify.integer-operations-target-structured+0xfa8>
    1e0c:      	cmp	x21, #0x54
    1e10:      	cset	w2, eq
    1e14:      	ubfx	x2, x2, #0, #8
    1e18:      	b	0x1e08 <_stogir.verify.integer-operations-target-structured+0xfb8>
    1e1c:      	add	x0, x19, #0x1
    1e20:      	lsr	w0, w0, #0
    1e24:      	sxtw	x0, w0
    1e28:      	ldr	x1, [sp, #0x388]
    1e2c:      	ldr	x2, [sp, #0x390]
    1e30:      	b	0x15c8 <_stogir.verify.integer-operations-target-structured+0x778>
    1e34:      	brk	#0
    1e38:      	b	0x1e34 <_stogir.verify.integer-operations-target-structured+0xfe4>
    1e3c:      	ldr	x0, [sp, #0x388]
    1e40:      	ldr	x1, [sp, #0x390]
    1e44:      	b	0x15d4 <_stogir.verify.integer-operations-target-structured+0x784>
    1e48:      	cmp	x21, #0x48
    1e4c:      	b.ne	0x1e68 <_stogir.verify.integer-operations-target-structured+0x1018>
    1e50:      	mov	x2, #0x1                ; =1
    1e54:      	fmov	d31, x0
    1e58:      	mov	x0, x2
    1e5c:      	mov	x2, x1
    1e60:      	fmov	x1, d31
    1e64:      	b	0x15e8 <_stogir.verify.integer-operations-target-structured+0x798>
    1e68:      	cmp	x21, #0x55
    1e6c:      	b.lt	0x1e80 <_stogir.verify.integer-operations-target-structured+0x1030>
    1e70:      	cmp	x21, #0x58
    1e74:      	cset	w2, le
    1e78:      	ubfx	x2, x2, #0, #8
    1e7c:      	b	0x1e54 <_stogir.verify.integer-operations-target-structured+0x1004>
    1e80:      	movz	x2, #0x0, lsl #48
    1e84:      	b	0x1e7c <_stogir.verify.integer-operations-target-structured+0x102c>
    1e88:      	add	x0, x19, #0x1
    1e8c:      	lsr	w0, w0, #0
    1e90:      	sxtw	x0, w0
    1e94:      	ldr	x2, [sp, #0x398]
    1e98:      	ldr	x3, [sp, #0x3a0]
    1e9c:      	b	0x1660 <_stogir.verify.integer-operations-target-structured+0x810>
    1ea0:      	brk	#0
    1ea4:      	b	0x1ea0 <_stogir.verify.integer-operations-target-structured+0x1050>
    1ea8:      	ldr	x0, [sp, #0x398]
    1eac:      	ldr	x2, [sp, #0x3a0]
    1eb0:      	b	0x166c <_stogir.verify.integer-operations-target-structured+0x81c>
    1eb4:      	mov	x3, x2
    1eb8:      	mov	x2, x0
    1ebc:      	movz	x0, #0x0, lsl #48
    1ec0:      	b	0x1690 <_stogir.verify.integer-operations-target-structured+0x840>
    1ec4:      	add	x0, x19, #0x1
    1ec8:      	lsr	w0, w0, #0
    1ecc:      	sxtw	x0, w0
    1ed0:      	ldr	x2, [sp, #0x3a8]
    1ed4:      	ldr	x3, [sp, #0x3b0]
    1ed8:      	b	0x170c <_stogir.verify.integer-operations-target-structured+0x8bc>
    1edc:      	brk	#0
    1ee0:      	b	0x1edc <_stogir.verify.integer-operations-target-structured+0x108c>
    1ee4:      	ldr	x0, [sp, #0x3a8]
    1ee8:      	ldr	x2, [sp, #0x3b0]
    1eec:      	b	0x1718 <_stogir.verify.integer-operations-target-structured+0x8c8>
    1ef0:      	add	x0, x19, #0x1
    1ef4:      	lsr	w0, w0, #0
    1ef8:      	sxtw	x0, w0
    1efc:      	ldr	x2, [sp, #0x3b8]
    1f00:      	ldr	x3, [sp, #0x3c0]
    1f04:      	b	0x1790 <_stogir.verify.integer-operations-target-structured+0x940>
    1f08:      	brk	#0
    1f0c:      	b	0x1f08 <_stogir.verify.integer-operations-target-structured+0x10b8>
    1f10:      	ldr	x0, [sp, #0x3b8]
    1f14:      	ldr	x2, [sp, #0x3c0]
    1f18:      	b	0x179c <_stogir.verify.integer-operations-target-structured+0x94c>
    1f1c:      	mov	x3, x2
    1f20:      	mov	x2, x0
    1f24:      	mov	x0, #0x1                ; =1
    1f28:      	b	0x17d8 <_stogir.verify.integer-operations-target-structured+0x988>
    1f2c:      	mov	x0, x2
    1f30:      	mov	x2, x3
    1f34:      	b	0x17e8 <_stogir.verify.integer-operations-target-structured+0x998>
    1f38:      	add	x16, sp, #0x20
    1f3c:      	ldr	w3, [x16, #0x8]
    1f40:      	lsr	w3, w3, #0
    1f44:      	add	x8, sp, #0x1c0
    1f48:      	str	x1, [sp, #0x238]
    1f4c:      	mov	w1, w3
    1f50:      	str	x0, [sp, #0x3c8]
    1f54:      	ldr	x0, [sp, #0x280]
    1f58:      	str	x2, [sp, #0x3d0]
    1f5c:      	bl	0x1f5c <_stogir.verify.integer-operations-target-structured+0x110c>
		0000000000001f5c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    1f60:      	add	x16, sp, #0x1c0
    1f64:      	ldr	w0, [x16]
    1f68:      	lsr	x16, x0, #0
    1f6c:      	cmp	x16, #0x1
    1f70:      	b.eq	0x1f8c <_stogir.verify.integer-operations-target-structured+0x113c>
    1f74:      	b.lo	0x1f7c <_stogir.verify.integer-operations-target-structured+0x112c>
    1f78:      	b	0x1f90 <_stogir.verify.integer-operations-target-structured+0x1140>
    1f7c:      	cmp	x16, #0x0
    1f80:      	b.eq	0x1f88 <_stogir.verify.integer-operations-target-structured+0x1138>
    1f84:      	b	0x1f90 <_stogir.verify.integer-operations-target-structured+0x1140>
    1f88:      	b	0x1f94 <_stogir.verify.integer-operations-target-structured+0x1144>
    1f8c:      	b	0x1fa0 <_stogir.verify.integer-operations-target-structured+0x1150>
    1f90:      	b	0x1fdc <_stogir.verify.integer-operations-target-structured+0x118c>
    1f94:      	ldr	x0, [sp, #0x290]
    1f98:      	mov	x1, #0x14               ; =20
    1f9c:      	b	0x17f0 <_stogir.verify.integer-operations-target-structured+0x9a0>
    1fa0:      	add	x16, sp, #0x1c0
    1fa4:      	ldr	x0, [x16, #0x8]
    1fa8:      	add	x16, sp, #0x20
    1fac:      	ldr	w1, [x16]
    1fb0:      	lsr	w0, w0, #0
    1fb4:      	ubfx	x1, x1, #8, #8
    1fb8:      	ubfx	x0, x0, #8, #8
    1fbc:      	cmp	x0, x1
    1fc0:      	b.ne	0x1fd0 <_stogir.verify.integer-operations-target-structured+0x1180>
    1fc4:      	ldr	x0, [sp, #0x3c8]
    1fc8:      	ldr	x1, [sp, #0x3d0]
    1fcc:      	b	0x1f9c <_stogir.verify.integer-operations-target-structured+0x114c>
    1fd0:      	ldr	x0, [sp, #0x298]
    1fd4:      	mov	x1, #0x1a               ; =26
    1fd8:      	b	0x1fcc <_stogir.verify.integer-operations-target-structured+0x117c>
    1fdc:      	brk	#0
    1fe0:      	b	0x1fdc <_stogir.verify.integer-operations-target-structured+0x118c>
    1fe4:      	ldr	x0, [sp, #0x3c8]
    1fe8:      	ldr	x1, [sp, #0x3d0]
    1fec:      	b	0x1800 <_stogir.verify.integer-operations-target-structured+0x9b0>
    1ff0:      	add	x0, x19, #0x1
    1ff4:      	lsr	w0, w0, #0
    1ff8:      	sxtw	x0, w0
    1ffc:      	ldr	x2, [sp, #0x3d8]
    2000:      	ldr	x3, [sp, #0x3e0]
    2004:      	b	0x189c <_stogir.verify.integer-operations-target-structured+0xa4c>
    2008:      	brk	#0
    200c:      	b	0x2008 <_stogir.verify.integer-operations-target-structured+0x11b8>
    2010:      	ldr	x0, [sp, #0x3d8]
    2014:      	ldr	x2, [sp, #0x3e0]
    2018:      	b	0x18a8 <_stogir.verify.integer-operations-target-structured+0xa58>
    201c:      	mov	x3, x2
    2020:      	mov	x2, x0
    2024:      	mov	x0, #0x1                ; =1
    2028:      	b	0x18c0 <_stogir.verify.integer-operations-target-structured+0xa70>
    202c:      	mov	x0, #0x1                ; =1
    2030:      	b	0x18d4 <_stogir.verify.integer-operations-target-structured+0xa84>
    2034:      	ldr	x22, [sp, #0x308]
    2038:      	cmp	x22, #0x0
    203c:      	b.eq	0x2048 <_stogir.verify.integer-operations-target-structured+0x11f8>
    2040:      	mov	x0, #0x1                ; =1
    2044:      	b	0x18f0 <_stogir.verify.integer-operations-target-structured+0xaa0>
    2048:      	ldr	x0, [sp, #0x288]
    204c:      	b	0x2044 <_stogir.verify.integer-operations-target-structured+0x11f4>
    2050:      	movz	x0, #0x0, lsl #48
    2054:      	b	0x18f0 <_stogir.verify.integer-operations-target-structured+0xaa0>
    2058:      	movz	x0, #0x0, lsl #48
    205c:      	b	0x18f0 <_stogir.verify.integer-operations-target-structured+0xaa0>
    2060:      	lsr	w1, w1, #0
    2064:      	lsr	w1, w1, #0
    2068:      	ldr	x0, [sp, #0x280]
    206c:      	bl	0x206c <_stogir.verify.integer-operations-target-structured+0x121c>
		000000000000206c:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    2070:      	cmp	x0, #0x0
    2074:      	b.ne	0x2088 <_stogir.verify.integer-operations-target-structured+0x1238>
    2078:      	str	x23, [sp, #0x260]
    207c:      	ldr	x0, [sp, #0x2b0]
    2080:      	mov	x1, #0x17               ; =23
    2084:      	b	0x1974 <_stogir.verify.integer-operations-target-structured+0xb24>
    2088:      	ldr	w0, [x0]
    208c:      	add	x16, sp, #0x20
    2090:      	ldr	w1, [x16]
    2094:      	ubfx	x0, x0, #8, #8
    2098:      	orr	x2, x0, xzr
    209c:      	ubfx	x1, x1, #8, #8
    20a0:      	cmp	x1, #0x6
    20a4:      	b.ne	0x2210 <_stogir.verify.integer-operations-target-structured+0x13c0>
    20a8:      	cmp	x2, #0x6
    20ac:      	b.ne	0x2200 <_stogir.verify.integer-operations-target-structured+0x13b0>
    20b0:      	cmp	x21, #0x1a
    20b4:      	b.ne	0x21e8 <_stogir.verify.integer-operations-target-structured+0x1398>
    20b8:      	ldr	x3, [sp, #0x3f0]
    20bc:      	ldr	x4, [sp, #0x3f8]
    20c0:      	mov	x1, #0x1                ; =1
    20c4:      	mov	x21, x1
    20c8:      	mov	x1, x3
    20cc:      	mov	x3, x4
    20d0:      	cmp	x2, #0x1
    20d4:      	b.lt	0x2220 <_stogir.verify.integer-operations-target-structured+0x13d0>
    20d8:      	cmp	x2, #0xb
    20dc:      	cset	w4, le
    20e0:      	ubfx	x4, x4, #0, #8
    20e4:      	fmov	d31, x1
    20e8:      	mov	x1, x4
    20ec:      	mov	x4, x3
    20f0:      	fmov	x3, d31
    20f4:      	cmp	x1, #0x0
    20f8:      	b.eq	0x2230 <_stogir.verify.integer-operations-target-structured+0x13e0>
    20fc:      	movz	x1, #0x0, lsl #48
    2100:      	cmp	x1, #0x0
    2104:      	b.eq	0x2238 <_stogir.verify.integer-operations-target-structured+0x13e8>
    2108:      	str	x23, [sp, #0x260]
    210c:      	mov	x23, x2
    2110:      	mov	x1, x3
    2114:      	mov	x2, x4
    2118:      	mov	x0, #0x1                ; =1
    211c:      	cmp	x0, #0x0
    2120:      	b.eq	0x22c4 <_stogir.verify.integer-operations-target-structured+0x1474>
    2124:      	ldr	x0, [sp, #0x2b8]
    2128:      	mov	x1, #0x1c               ; =28
    212c:      	add	x16, sp, #0x20
    2130:      	ldr	w2, [x16]
    2134:      	cmp	x20, #0x0
    2138:      	b.eq	0x22d0 <_stogir.verify.integer-operations-target-structured+0x1480>
    213c:      	mov	x3, x0
    2140:      	mov	x0, #0x1                ; =1
    2144:      	lsr	w0, w0, #0
    2148:      	ubfx	x2, x2, #8, #8
    214c:      	sxtw	x0, w0
    2150:      	cmp	x2, x0
    2154:      	b.ne	0x22dc <_stogir.verify.integer-operations-target-structured+0x148c>
    2158:      	mov	x0, x3
    215c:      	cmp	x20, #0x0
    2160:      	b.eq	0x22e8 <_stogir.verify.integer-operations-target-structured+0x1498>
    2164:      	mov	x20, x0
    2168:      	mov	x0, #0x1                ; =1
    216c:      	cmp	x0, #0x0
    2170:      	b.eq	0x2544 <_stogir.verify.integer-operations-target-structured+0x16f4>
    2174:      	add	x16, sp, #0x220
    2178:      	str	x16, [sp]
    217c:      	ldr	x0, [sp, #0x280]
    2180:      	mov	x22, x1
    2184:      	ldr	w1, [sp, #0x310]
    2188:      	mov	x2, #0x2                ; =2
    218c:      	bl	0x218c <_stogir.verify.integer-operations-target-structured+0x133c>
		000000000000218c:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    2190:      	ldr	x16, [sp]
    2194:      	str	x0, [x16]
    2198:      	str	x1, [x16, #0x8]
    219c:      	add	x16, sp, #0x220
    21a0:      	ldr	x0, [x16]
    21a4:      	add	x16, sp, #0x220
    21a8:      	ldr	x1, [x16, #0x8]
    21ac:      	lsr	w0, w0, #0
    21b0:      	lsr	x16, x0, #0
    21b4:      	cmp	x16, #0x1
    21b8:      	b.eq	0x21d4 <_stogir.verify.integer-operations-target-structured+0x1384>
    21bc:      	b.lo	0x21c4 <_stogir.verify.integer-operations-target-structured+0x1374>
    21c0:      	b	0x21d8 <_stogir.verify.integer-operations-target-structured+0x1388>
    21c4:      	cmp	x16, #0x0
    21c8:      	b.eq	0x21d0 <_stogir.verify.integer-operations-target-structured+0x1380>
    21cc:      	b	0x21d8 <_stogir.verify.integer-operations-target-structured+0x1388>
    21d0:      	b	0x21dc <_stogir.verify.integer-operations-target-structured+0x138c>
    21d4:      	b	0x22f4 <_stogir.verify.integer-operations-target-structured+0x14a4>
    21d8:      	b	0x2398 <_stogir.verify.integer-operations-target-structured+0x1548>
    21dc:      	ldr	x0, [sp, #0x2c8]
    21e0:      	mov	x1, #0x1d               ; =29
    21e4:      	b	0x2084 <_stogir.verify.integer-operations-target-structured+0x1234>
    21e8:      	cmp	x21, #0x1b
    21ec:      	cset	w1, eq
    21f0:      	ubfx	x1, x1, #0, #8
    21f4:      	ldr	x3, [sp, #0x3f0]
    21f8:      	ldr	x4, [sp, #0x3f8]
    21fc:      	b	0x20c4 <_stogir.verify.integer-operations-target-structured+0x1274>
    2200:      	ldr	x3, [sp, #0x3f0]
    2204:      	ldr	x4, [sp, #0x3f8]
    2208:      	movz	x1, #0x0, lsl #48
    220c:      	b	0x20c4 <_stogir.verify.integer-operations-target-structured+0x1274>
    2210:      	ldr	x1, [sp, #0x3f0]
    2214:      	ldr	x3, [sp, #0x3f8]
    2218:      	movz	x21, #0x0, lsl #48
    221c:      	b	0x20d0 <_stogir.verify.integer-operations-target-structured+0x1280>
    2220:      	mov	x4, x3
    2224:      	mov	x3, x1
    2228:      	movz	x1, #0x0, lsl #48
    222c:      	b	0x20f4 <_stogir.verify.integer-operations-target-structured+0x12a4>
    2230:      	mov	x1, #0x1                ; =1
    2234:      	b	0x2100 <_stogir.verify.integer-operations-target-structured+0x12b0>
    2238:      	ldr	w1, [sp, #0x2e0]
    223c:      	lsr	w1, w1, #0
    2240:      	lsr	w0, w0, #0
    2244:      	ldr	x5, [sp, #0x288]
    2248:      	cmp	x5, #0x0
    224c:      	b.eq	0x254c <_stogir.verify.integer-operations-target-structured+0x16fc>
    2250:      	str	x3, [sp, #0x400]
    2254:      	str	x4, [sp, #0x408]
    2258:      	str	w1, [sp, #0x410]
    225c:      	str	w0, [sp, #0x418]
    2260:      	str	x23, [sp, #0x260]
    2264:      	mov	x23, x2
    2268:      	fmov	s31, w0
    226c:      	mov	w0, w1
    2270:      	fmov	w1, s31
    2274:      	bl	0x2274 <_stogir.verify.integer-operations-target-structured+0x1424>
		0000000000002274:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    2278:      	cmp	x0, #0x0
    227c:      	b.ne	0x2290 <_stogir.verify.integer-operations-target-structured+0x1440>
    2280:      	mov	x0, #0x1                ; =1
    2284:      	ldr	x1, [sp, #0x400]
    2288:      	ldr	x2, [sp, #0x408]
    228c:      	b	0x211c <_stogir.verify.integer-operations-target-structured+0x12cc>
    2290:      	cmp	x22, #0x0
    2294:      	b.eq	0x22bc <_stogir.verify.integer-operations-target-structured+0x146c>
    2298:      	ldr	w0, [sp, #0x410]
    229c:      	ldr	w1, [sp, #0x418]
    22a0:      	bl	0x22a0 <_stogir.verify.integer-operations-target-structured+0x1450>
		00000000000022a0:  ARM64_RELOC_BRANCH26	_stogir.integer-binary.valid-type?
    22a4:      	cmp	x0, #0x0
    22a8:      	cset	w0, ne
    22ac:      	uxtb	w16, w0
    22b0:      	cmp	w16, wzr
    22b4:      	cset	x0, eq
    22b8:      	b	0x2284 <_stogir.verify.integer-operations-target-structured+0x1434>
    22bc:      	movz	x0, #0x0, lsl #48
    22c0:      	b	0x22b8 <_stogir.verify.integer-operations-target-structured+0x1468>
    22c4:      	mov	x0, x1
    22c8:      	mov	x1, x2
    22cc:      	b	0x212c <_stogir.verify.integer-operations-target-structured+0x12dc>
    22d0:      	mov	x3, x0
    22d4:      	mov	x0, x23
    22d8:      	b	0x2144 <_stogir.verify.integer-operations-target-structured+0x12f4>
    22dc:      	ldr	x0, [sp, #0x2c0]
    22e0:      	mov	x1, #0x26               ; =38
    22e4:      	b	0x215c <_stogir.verify.integer-operations-target-structured+0x130c>
    22e8:      	mov	x20, x0
    22ec:      	mov	x0, x22
    22f0:      	b	0x216c <_stogir.verify.integer-operations-target-structured+0x131c>
    22f4:      	lsr	w1, w1, #0
    22f8:      	lsr	w1, w1, #0
    22fc:      	ldr	x0, [sp, #0x280]
    2300:      	bl	0x2300 <_stogir.verify.integer-operations-target-structured+0x14b0>
		0000000000002300:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    2304:      	cmp	x0, #0x0
    2308:      	b.ne	0x2318 <_stogir.verify.integer-operations-target-structured+0x14c8>
    230c:      	ldr	x0, [sp, #0x2c8]
    2310:      	mov	x1, #0x1d               ; =29
    2314:      	b	0x21e4 <_stogir.verify.integer-operations-target-structured+0x1394>
    2318:      	ldr	w0, [x0]
    231c:      	ubfx	x0, x0, #8, #8
    2320:      	cmp	x23, x0
    2324:      	b.ne	0x2350 <_stogir.verify.integer-operations-target-structured+0x1500>
    2328:      	mov	x1, x20
    232c:      	mov	x0, #0x1                ; =1
    2330:      	cmp	x0, #0x0
    2334:      	b.eq	0x2384 <_stogir.verify.integer-operations-target-structured+0x1534>
    2338:      	movz	x0, #0x0, lsl #48
    233c:      	cmp	x0, #0x0
    2340:      	b.eq	0x238c <_stogir.verify.integer-operations-target-structured+0x153c>
    2344:      	ldr	x0, [sp, #0x2d0]
    2348:      	mov	x1, #0x1d               ; =29
    234c:      	b	0x2314 <_stogir.verify.integer-operations-target-structured+0x14c4>
    2350:      	cmp	x21, #0x0
    2354:      	b.eq	0x237c <_stogir.verify.integer-operations-target-structured+0x152c>
    2358:      	cmp	x0, #0x5
    235c:      	b.ne	0x236c <_stogir.verify.integer-operations-target-structured+0x151c>
    2360:      	mov	x0, #0x1                ; =1
    2364:      	mov	x1, x20
    2368:      	b	0x2330 <_stogir.verify.integer-operations-target-structured+0x14e0>
    236c:      	cmp	x0, #0xb
    2370:      	cset	w0, eq
    2374:      	ubfx	x0, x0, #0, #8
    2378:      	b	0x2364 <_stogir.verify.integer-operations-target-structured+0x1514>
    237c:      	movz	x0, #0x0, lsl #48
    2380:      	b	0x2364 <_stogir.verify.integer-operations-target-structured+0x1514>
    2384:      	mov	x0, #0x1                ; =1
    2388:      	b	0x233c <_stogir.verify.integer-operations-target-structured+0x14ec>
    238c:      	mov	x0, x1
    2390:      	mov	x1, x22
    2394:      	b	0x234c <_stogir.verify.integer-operations-target-structured+0x14fc>
    2398:      	brk	#0
    239c:      	b	0x2398 <_stogir.verify.integer-operations-target-structured+0x1548>
    23a0:      	mov	x0, x20
    23a4:      	mov	x1, x22
    23a8:      	b	0x21e4 <_stogir.verify.integer-operations-target-structured+0x1394>
    23ac:      	brk	#0
    23b0:      	b	0x23ac <_stogir.verify.integer-operations-target-structured+0x155c>
    23b4:      	mov	x0, x19
    23b8:      	ldr	x1, [sp, #0x3f0]
    23bc:      	ldr	x2, [sp, #0x3f8]
    23c0:      	b	0x1990 <_stogir.verify.integer-operations-target-structured+0xb40>
    23c4:      	brk	#0
    23c8:      	b	0x23c4 <_stogir.verify.integer-operations-target-structured+0x1574>
    23cc:      	uxtb	w16, w1
    23d0:      	cmp	w16, wzr
    23d4:      	b.eq	0x2430 <_stogir.verify.integer-operations-target-structured+0x15e0>
    23d8:      	and	x0, x19, #0xffffffff
    23dc:      	mov	x1, x0
    23e0:      	movz	x0, #0x0, lsl #48
    23e4:      	movz	x2, #0x0, lsl #48
    23e8:      	ldr	x3, [sp, #0x2d8]
    23ec:      	str	x0, [x3]
    23f0:      	str	x1, [x3, #0x8]
    23f4:      	str	x2, [x3, #0x10]
    23f8:      	ldr	x19, [sp, #0x420]
    23fc:      	ldr	x20, [sp, #0x428]
    2400:      	ldr	x21, [sp, #0x430]
    2404:      	ldr	x22, [sp, #0x438]
    2408:      	ldr	x23, [sp, #0x440]
    240c:      	ldr	x24, [sp, #0x448]
    2410:      	ldr	x25, [sp, #0x450]
    2414:      	ldr	x26, [sp, #0x458]
    2418:      	ldr	x27, [sp, #0x460]
    241c:      	ldr	x28, [sp, #0x468]
    2420:      	ldr	x29, [sp, #0x10]
    2424:      	ldr	x30, [sp, #0x18]
    2428:      	add	sp, sp, #0x470
    242c:      	ret
    2430:      	ldr	x1, [sp, #0x248]
    2434:      	ldr	x2, [sp, #0x270]
    2438:      	mov	x0, #0x1                ; =1
    243c:      	b	0x23e8 <_stogir.verify.integer-operations-target-structured+0x1598>
    2440:      	str	x8, [sp, #0x2d8]
    2444:      	str	x20, [sp, #0x270]
    2448:      	b	0x23cc <_stogir.verify.integer-operations-target-structured+0x157c>
    244c:      	str	x8, [sp, #0x2d8]
    2450:      	str	x20, [sp, #0x270]
    2454:      	b	0x23cc <_stogir.verify.integer-operations-target-structured+0x157c>
    2458:      	str	x1, [sp, #0x328]
    245c:      	str	x2, [sp, #0x330]
    2460:      	b	0x1b58 <_stogir.verify.integer-operations-target-structured+0xd08>
    2464:      	str	x1, [sp, #0x338]
    2468:      	str	x2, [sp, #0x340]
    246c:      	b	0x1c50 <_stogir.verify.integer-operations-target-structured+0xe00>
    2470:      	str	x1, [sp, #0x348]
    2474:      	str	x2, [sp, #0x350]
    2478:      	b	0x1cdc <_stogir.verify.integer-operations-target-structured+0xe8c>
    247c:      	str	x1, [sp, #0x348]
    2480:      	str	x2, [sp, #0x350]
    2484:      	b	0x1c74 <_stogir.verify.integer-operations-target-structured+0xe24>
    2488:      	str	x1, [sp, #0x358]
    248c:      	str	x2, [sp, #0x360]
    2490:      	b	0x1d18 <_stogir.verify.integer-operations-target-structured+0xec8>
    2494:      	str	x1, [sp, #0x368]
    2498:      	str	x2, [sp, #0x370]
    249c:      	b	0x1d64 <_stogir.verify.integer-operations-target-structured+0xf14>
    24a0:      	str	x1, [sp, #0x378]
    24a4:      	str	x2, [sp, #0x380]
    24a8:      	b	0x1dc0 <_stogir.verify.integer-operations-target-structured+0xf70>
    24ac:      	str	x1, [sp, #0x388]
    24b0:      	str	x2, [sp, #0x390]
    24b4:      	b	0x1e3c <_stogir.verify.integer-operations-target-structured+0xfec>
    24b8:      	str	x1, [sp, #0x398]
    24bc:      	ldr	x1, [sp, #0x320]
    24c0:      	str	x2, [sp, #0x3a0]
    24c4:      	b	0x1ea8 <_stogir.verify.integer-operations-target-structured+0x1058>
    24c8:      	str	x1, [sp, #0x320]
    24cc:      	ldr	x1, [sp, #0x2e8]
    24d0:      	str	x2, [sp, #0x3a8]
    24d4:      	str	x3, [sp, #0x3b0]
    24d8:      	b	0x1ee4 <_stogir.verify.integer-operations-target-structured+0x1094>
    24dc:      	str	x1, [sp, #0x2e8]
    24e0:      	ldr	x1, [sp, #0x238]
    24e4:      	str	x0, [sp, #0x3b8]
    24e8:      	str	x2, [sp, #0x3c0]
    24ec:      	b	0x1f10 <_stogir.verify.integer-operations-target-structured+0x10c0>
    24f0:      	str	x1, [sp, #0x238]
    24f4:      	str	x0, [sp, #0x3c8]
    24f8:      	str	x2, [sp, #0x3d0]
    24fc:      	b	0x1fe4 <_stogir.verify.integer-operations-target-structured+0x1194>
    2500:      	str	x22, [sp, #0x3e8]
    2504:      	mov	x22, x2
    2508:      	str	x0, [sp, #0x3d8]
    250c:      	str	x1, [sp, #0x3e0]
    2510:      	ldr	x1, [sp, #0x258]
    2514:      	b	0x2010 <_stogir.verify.integer-operations-target-structured+0x11c0>
    2518:      	ldr	x20, [sp, #0x300]
    251c:      	ldr	x22, [sp, #0x308]
    2520:      	b	0x2058 <_stogir.verify.integer-operations-target-structured+0x1208>
    2524:      	ldr	x20, [sp, #0x300]
    2528:      	ldr	x22, [sp, #0x308]
    252c:      	b	0x2050 <_stogir.verify.integer-operations-target-structured+0x1200>
    2530:      	str	x1, [sp, #0x258]
    2534:      	str	x23, [sp, #0x260]
    2538:      	str	x2, [sp, #0x3f0]
    253c:      	str	x3, [sp, #0x3f8]
    2540:      	b	0x23b4 <_stogir.verify.integer-operations-target-structured+0x1564>
    2544:      	mov	x22, x1
    2548:      	b	0x23a0 <_stogir.verify.integer-operations-target-structured+0x1550>
    254c:      	str	w1, [sp, #0x410]
    2550:      	str	w0, [sp, #0x418]
    2554:      	str	x23, [sp, #0x260]
    2558:      	mov	x23, x2
    255c:      	str	x3, [sp, #0x400]
    2560:      	str	x4, [sp, #0x408]
    2564:      	b	0x2290 <_stogir.verify.integer-operations-target-structured+0x1440>

0000000000002568 <_coil.core.Len$coil.arraylist.ArrayList$len__i32>:
    2568:      	ldr	x0, [x0, #0x8]
    256c:      	ret

0000000000002570 <_coil.core.Eq$slice<u8>$=>:
    2570:      	sub	sp, sp, #0x10
    2574:      	str	x29, [sp]
    2578:      	str	x30, [sp, #0x8]
    257c:      	mov	x29, sp
    2580:      	cmp	x1, x3
    2584:      	b.ne	0x25c4 <_coil.core.Eq$slice<u8>$=+0x54>
    2588:      	cmp	x1, #0x0
    258c:      	b.ne	0x2598 <_coil.core.Eq$slice<u8>$=+0x28>
    2590:      	mov	x0, #0x1                ; =1
    2594:      	b	0x25c0 <_coil.core.Eq$slice<u8>$=+0x50>
    2598:      	lsr	x1, x1, #0
    259c:      	fmov	d31, x1
    25a0:      	mov	x1, x2
    25a4:      	fmov	x2, d31
    25a8:      	bl	0x25a8 <_coil.core.Eq$slice<u8>$=+0x38>
		00000000000025a8:  ARM64_RELOC_BRANCH26	_memcmp
    25ac:      	lsr	w0, w0, #0
    25b0:      	sxtw	x0, w0
    25b4:      	cmp	x0, #0x0
    25b8:      	cset	w0, eq
    25bc:      	ubfx	x0, x0, #0, #8
    25c0:      	b	0x25c8 <_coil.core.Eq$slice<u8>$=+0x58>
    25c4:      	movz	x0, #0x0, lsl #48
    25c8:      	ldr	x29, [sp]
    25cc:      	ldr	x30, [sp, #0x8]
    25d0:      	add	sp, sp, #0x10
    25d4:      	ret

00000000000025d8 <_stogir.node.opcode>:
    25d8:      	ldr	w0, [x0]
    25dc:      	uxtb	w0, w0
    25e0:      	ret

00000000000025e4 <_stogir.opcode.valid?>:
    25e4:      	sxtw	x0, w0
    25e8:      	cmp	x0, #0x0
    25ec:      	b.lt	0x2600 <_stogir.opcode.valid?+0x1c>
    25f0:      	cmp	x0, #0x83
    25f4:      	cset	w0, lt
    25f8:      	ubfx	x0, x0, #0, #8
    25fc:      	b	0x2604 <_stogir.opcode.valid?+0x20>
    2600:      	movz	x0, #0x0, lsl #48
    2604:      	ret

0000000000002608 <_stogir.node.type-id>:
    2608:      	ldr	w0, [x0]
    260c:      	ubfx	x0, x0, #8, #8
    2610:      	ret

0000000000002614 <_stogir.types.valid?>:
    2614:      	sxtw	x0, w0
    2618:      	cmp	x0, #0x0
    261c:      	b.lt	0x2630 <_stogir.types.valid?+0x1c>
    2620:      	cmp	x0, #0xd
    2624:      	b.gt	0x2630 <_stogir.types.valid?+0x1c>
    2628:      	mov	x0, #0x1                ; =1
    262c:      	ret
    2630:      	cmp	x0, #0xf
    2634:      	b.le	0x266c <_stogir.types.valid?+0x58>
    2638:      	cmp	x0, #0x80
    263c:      	b.ge	0x2664 <_stogir.types.valid?+0x50>
    2640:      	and	x0, x0, #0xf
    2644:      	lsr	w0, w0, #0
    2648:      	sxtw	x0, w0
    264c:      	cmp	x0, #0x1
    2650:      	b.lt	0x2674 <_stogir.types.valid?+0x60>
    2654:      	cmp	x0, #0xd
    2658:      	cset	w0, le
    265c:      	ubfx	x0, x0, #0, #8
    2660:      	b	0x2678 <_stogir.types.valid?+0x64>
    2664:      	movz	x0, #0x0, lsl #48
    2668:      	b	0x2670 <_stogir.types.valid?+0x5c>
    266c:      	movz	x0, #0x0, lsl #48
    2670:      	ret
    2674:      	movz	x0, #0x0, lsl #48
    2678:      	b	0x2668 <_stogir.types.valid?+0x54>

000000000000267c <_stogir.opcode.operand-slots>:
    267c:      	sxtw	x0, w0
    2680:      	cmp	x0, #0x0
    2684:      	b.lt	0x26b0 <_stogir.opcode.operand-slots+0x34>
    2688:      	cmp	x0, #0x83
    268c:      	b.ge	0x26b0 <_stogir.opcode.operand-slots+0x34>
    2690:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x11b0>
		0000000000002690:  ARM64_RELOC_PAGE21	l_stogir.329
    2694:      	ldr	x16, [x16]
		0000000000002694:  ARM64_RELOC_PAGEOFF12	l_stogir.329
    2698:      	orr	x1, x16, xzr
    269c:      	lsr	x0, x0, #0
    26a0:      	add	x0, x0, x1
    26a4:      	ldrsb	w0, [x0]
    26a8:      	sxtb	x0, w0
    26ac:      	b	0x26b4 <_stogir.opcode.operand-slots+0x38>
    26b0:      	mov	x0, #-0x2               ; =-2
    26b4:      	ret

00000000000026b8 <_stogir.opcode.input-count>:
    26b8:      	sxtw	x0, w0
    26bc:      	cmp	x0, #0x0
    26c0:      	b.lt	0x26ec <_stogir.opcode.input-count+0x34>
    26c4:      	cmp	x0, #0x83
    26c8:      	b.ge	0x26ec <_stogir.opcode.input-count+0x34>
    26cc:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x11b0>
		00000000000026cc:  ARM64_RELOC_PAGE21	l_stogir.330
    26d0:      	ldr	x16, [x16]
		00000000000026d0:  ARM64_RELOC_PAGEOFF12	l_stogir.330
    26d4:      	orr	x1, x16, xzr
    26d8:      	lsr	x0, x0, #0
    26dc:      	add	x0, x0, x1
    26e0:      	ldrsb	w0, [x0]
    26e4:      	sxtb	x0, w0
    26e8:      	b	0x26f0 <_stogir.opcode.input-count+0x38>
    26ec:      	mov	x0, #-0x2               ; =-2
    26f0:      	ret

00000000000026f4 <_stogir.node.auxiliary>:
    26f4:      	ldr	w0, [x0]
    26f8:      	ubfx	x0, x0, #16, #16
    26fc:      	ret

0000000000002700 <_stogir.opcode.operand-code>:
    2700:      	sxtw	x0, w0
    2704:      	cmp	x0, #0x0
    2708:      	b.lt	0x2748 <_stogir.opcode.operand-code+0x48>
    270c:      	cmp	x0, #0x83
    2710:      	b.ge	0x2748 <_stogir.opcode.operand-code+0x48>
    2714:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x11b0>
		0000000000002714:  ARM64_RELOC_PAGE21	l_stogir.331
    2718:      	ldr	x16, [x16]
		0000000000002718:  ARM64_RELOC_PAGEOFF12	l_stogir.331
    271c:      	orr	x2, x16, xzr
    2720:      	lsl	x0, x0, #2
    2724:      	sxtw	x1, w1
    2728:      	add	x0, x0, x2
    272c:      	ldr	w0, [x0]
    2730:      	cmp	x1, #0x0
    2734:      	b.le	0x277c <_stogir.opcode.operand-code+0x7c>
    2738:      	cmp	x1, #0x4
    273c:      	b.le	0x2750 <_stogir.opcode.operand-code+0x50>
    2740:      	mov	x1, #0x4                ; =4
    2744:      	b	0x275c <_stogir.opcode.operand-code+0x5c>
    2748:      	movz	x0, #0x0, lsl #48
    274c:      	ret
    2750:      	sub	x1, x1, #0x1
    2754:      	lsr	w1, w1, #0
    2758:      	sxtw	x1, w1
    275c:      	lsl	x1, x1, #2
    2760:      	lsr	w1, w1, #0
    2764:      	ubfx	x1, x1, #0, #32
    2768:      	lsr	x0, x0, x1
    276c:      	lsr	w0, w0, #0
    2770:      	and	x0, x0, #0xf
    2774:      	lsr	w0, w0, #0
    2778:      	b	0x2780 <_stogir.opcode.operand-code+0x80>
    277c:      	movz	x0, #0x0, lsl #48
    2780:      	ret

0000000000002784 <_stogir.graph.operand>:
    2784:      	sub	sp, sp, #0x10
    2788:      	mov	x3, sp
    278c:      	sxtw	x1, w1
    2790:      	cmp	x1, #0x0
    2794:      	b.le	0x27e0 <_stogir.graph.operand+0x5c>
    2798:      	lsl	x4, x1, #2
    279c:      	cmp	x1, #0x0
    27a0:      	b.le	0x280c <_stogir.graph.operand+0x88>
    27a4:      	ldr	x5, [x0, #0x8]
    27a8:      	cmp	x1, x5
    27ac:      	b.ge	0x2864 <_stogir.graph.operand+0xe0>
    27b0:      	add	x5, x0, #0x78
    27b4:      	ldr	x5, [x5, #0x8]
    27b8:      	cmp	x1, x5
    27bc:      	b.ge	0x28f8 <_stogir.graph.operand+0x174>
    27c0:      	ldr	x5, [x0, #0x78]
    27c4:      	add	x5, x4, x5
    27c8:      	ldr	w5, [x5]
    27cc:      	sxtw	x5, w5
    27d0:      	cmp	x5, #0x0
    27d4:      	cset	w5, ge
    27d8:      	ubfx	x5, x5, #0, #8
    27dc:      	b	0x28fc <_stogir.graph.operand+0x178>
    27e0:      	movz	x0, #0x0, lsl #48
    27e4:      	movz	x1, #0x0, lsl #48
    27e8:      	str	x0, [x3]
    27ec:      	str	x1, [x3, #0x8]
    27f0:      	ldr	x0, [sp]
    27f4:      	ldr	x1, [sp, #0x8]
    27f8:      	add	sp, sp, #0x10
    27fc:      	ret
    2800:      	movz	x0, #0x0, lsl #48
    2804:      	movz	x1, #0x0, lsl #48
    2808:      	b	0x27e8 <_stogir.graph.operand+0x64>
    280c:      	cmp	x1, #0x0
    2810:      	b.ge	0x286c <_stogir.graph.operand+0xe8>
    2814:      	add	x5, x0, #0x28
    2818:      	add	x6, x0, #0x50
    281c:      	ldr	x5, [x5, #0x8]
    2820:      	ldr	x6, [x6, #0x8]
    2824:      	cmp	x5, x6
    2828:      	b.ne	0x28f0 <_stogir.graph.operand+0x16c>
    282c:      	movz	x16, #0x0, lsl #48
    2830:      	sub	x6, x16, x1
    2834:      	cmp	x6, x5
    2838:      	b.gt	0x2900 <_stogir.graph.operand+0x17c>
    283c:      	sub	x5, x6, #0x1
    2840:      	lsl	x5, x5, #2
    2844:      	ldr	x6, [x0, #0x50]
    2848:      	add	x5, x5, x6
    284c:      	ldr	w5, [x5]
    2850:      	sxtw	x5, w5
    2854:      	cmp	x5, #0x0
    2858:      	cset	w5, gt
    285c:      	ubfx	x5, x5, #0, #8
    2860:      	b	0x2904 <_stogir.graph.operand+0x180>
    2864:      	movz	x5, #0x0, lsl #48
    2868:      	b	0x2870 <_stogir.graph.operand+0xec>
    286c:      	movz	x5, #0x0, lsl #48
    2870:      	cmp	x5, #0x0
    2874:      	b.eq	0x27e0 <_stogir.graph.operand+0x5c>
    2878:      	sxtw	x2, w2
    287c:      	cmp	x2, #0x1
    2880:      	b.lt	0x2800 <_stogir.graph.operand+0x7c>
    2884:      	ldr	x5, [x0, #0x78]
    2888:      	add	x4, x4, x5
    288c:      	ldr	w4, [x4]
    2890:      	sxtw	x4, w4
    2894:      	cmp	x2, x4
    2898:      	b.gt	0x2800 <_stogir.graph.operand+0x7c>
    289c:      	asr	x16, x2, #63
    28a0:      	lsr	x16, x16, #62
    28a4:      	add	x4, x2, x16
    28a8:      	asr	x4, x4, #2
    28ac:      	asr	x16, x2, #63
    28b0:      	lsr	x16, x16, #62
    28b4:      	add	x2, x2, x16
    28b8:      	and	x2, x2, #0x3
    28bc:      	sub	x2, x2, x16
    28c0:      	ldr	x0, [x0]
    28c4:      	add	x1, x4, x1
    28c8:      	lsl	x2, x2, #2
    28cc:      	lsl	x1, x1, #4
    28d0:      	add	x0, x1, x0
    28d4:      	add	x0, x2, x0
    28d8:      	ldr	w0, [x0]
    28dc:      	sxtw	x0, w0
    28e0:      	and	x0, x0, #0xffffffff
    28e4:      	mov	x1, x0
    28e8:      	mov	x0, #0x1                ; =1
    28ec:      	b	0x2808 <_stogir.graph.operand+0x84>
    28f0:      	movz	x5, #0x0, lsl #48
    28f4:      	b	0x2870 <_stogir.graph.operand+0xec>
    28f8:      	movz	x5, #0x0, lsl #48
    28fc:      	b	0x2868 <_stogir.graph.operand+0xe4>
    2900:      	movz	x5, #0x0, lsl #48
    2904:      	b	0x28f4 <_stogir.graph.operand+0x170>

0000000000002908 <_stogir.graph.borrow-node>:
    2908:      	sxtw	x1, w1
    290c:      	cmp	x1, #0x0
    2910:      	cset	w2, gt
    2914:      	movz	x16, #0x0, lsl #48
    2918:      	sub	x3, x16, x1
    291c:      	sub	x4, x3, #0x1
    2920:      	uxtb	w16, w2
    2924:      	cmp	w16, wzr
    2928:      	b.eq	0x296c <_stogir.graph.borrow-node+0x64>
    292c:      	ldr	x3, [x0, #0x8]
    2930:      	cmp	x1, x3
    2934:      	b.ge	0x29c0 <_stogir.graph.borrow-node+0xb8>
    2938:      	add	x3, x0, #0x78
    293c:      	ldr	x3, [x3, #0x8]
    2940:      	cmp	x1, x3
    2944:      	b.ge	0x2a08 <_stogir.graph.borrow-node+0x100>
    2948:      	lsl	x3, x1, #2
    294c:      	ldr	x5, [x0, #0x78]
    2950:      	add	x3, x3, x5
    2954:      	ldr	w3, [x3]
    2958:      	sxtw	x3, w3
    295c:      	cmp	x3, #0x0
    2960:      	cset	w3, ge
    2964:      	ubfx	x3, x3, #0, #8
    2968:      	b	0x2a0c <_stogir.graph.borrow-node+0x104>
    296c:      	cmp	x1, #0x0
    2970:      	b.ge	0x29c8 <_stogir.graph.borrow-node+0xc0>
    2974:      	add	x5, x0, #0x28
    2978:      	add	x6, x0, #0x50
    297c:      	ldr	x5, [x5, #0x8]
    2980:      	ldr	x6, [x6, #0x8]
    2984:      	cmp	x5, x6
    2988:      	b.ne	0x29b8 <_stogir.graph.borrow-node+0xb0>
    298c:      	cmp	x3, x5
    2990:      	b.gt	0x2a10 <_stogir.graph.borrow-node+0x108>
    2994:      	lsl	x3, x4, #2
    2998:      	ldr	x5, [x0, #0x50]
    299c:      	add	x3, x3, x5
    29a0:      	ldr	w3, [x3]
    29a4:      	sxtw	x3, w3
    29a8:      	cmp	x3, #0x0
    29ac:      	cset	w3, gt
    29b0:      	ubfx	x3, x3, #0, #8
    29b4:      	b	0x2a14 <_stogir.graph.borrow-node+0x10c>
    29b8:      	movz	x3, #0x0, lsl #48
    29bc:      	b	0x29cc <_stogir.graph.borrow-node+0xc4>
    29c0:      	movz	x3, #0x0, lsl #48
    29c4:      	b	0x29cc <_stogir.graph.borrow-node+0xc4>
    29c8:      	movz	x3, #0x0, lsl #48
    29cc:      	cmp	x3, #0x0
    29d0:      	b.eq	0x2a00 <_stogir.graph.borrow-node+0xf8>
    29d4:      	uxtb	w16, w2
    29d8:      	cmp	w16, wzr
    29dc:      	b.eq	0x29f0 <_stogir.graph.borrow-node+0xe8>
    29e0:      	lsl	x1, x1, #4
    29e4:      	ldr	x0, [x0]
    29e8:      	add	x0, x1, x0
    29ec:      	b	0x29fc <_stogir.graph.borrow-node+0xf4>
    29f0:      	lsl	x1, x4, #4
    29f4:      	ldr	x0, [x0, #0x28]
    29f8:      	add	x0, x1, x0
    29fc:      	b	0x2a04 <_stogir.graph.borrow-node+0xfc>
    2a00:      	movz	x0, #0x0, lsl #48
    2a04:      	ret
    2a08:      	movz	x3, #0x0, lsl #48
    2a0c:      	b	0x29c4 <_stogir.graph.borrow-node+0xbc>
    2a10:      	movz	x3, #0x0, lsl #48
    2a14:      	b	0x29bc <_stogir.graph.borrow-node+0xb4>

0000000000002a18 <_stogir.strings.lookup>:
    2a18:      	sxtw	x1, w1
    2a1c:      	cmp	x1, #0x0
    2a20:      	b.le	0x2a9c <_stogir.strings.lookup+0x84>
    2a24:      	add	x2, x0, #0x28
    2a28:      	ldr	x2, [x2, #0x8]
    2a2c:      	cmp	x1, x2
    2a30:      	b.gt	0x2a9c <_stogir.strings.lookup+0x84>
    2a34:      	sub	x1, x1, #0x1
    2a38:      	mov	x17, #0x18              ; =24
    2a3c:      	mul	x1, x1, x17
    2a40:      	ldr	x2, [x0, #0x28]
    2a44:      	add	x1, x1, x2
    2a48:      	ldr	x2, [x1]
    2a4c:      	ldr	x1, [x1, #0x8]
    2a50:      	ldr	x3, [x0, #0x8]
    2a54:      	cmp	x2, #0x0
    2a58:      	b.lt	0x2ab8 <_stogir.strings.lookup+0xa0>
    2a5c:      	cmp	x2, x3
    2a60:      	b.gt	0x2ab8 <_stogir.strings.lookup+0xa0>
    2a64:      	cmp	x1, #0x0
    2a68:      	b.lt	0x2ab8 <_stogir.strings.lookup+0xa0>
    2a6c:      	sub	x3, x3, x2
    2a70:      	cmp	x1, x3
    2a74:      	b.gt	0x2ab8 <_stogir.strings.lookup+0xa0>
    2a78:      	add	x1, x1, x2
    2a7c:      	lsr	x3, x2, #0
    2a80:      	sub	x1, x1, x2
    2a84:      	ldr	x0, [x0]
    2a88:      	add	x0, x3, x0
    2a8c:      	mov	x2, x1
    2a90:      	mov	x1, x0
    2a94:      	mov	x0, #0x1                ; =1
    2a98:      	b	0x2ac4 <_stogir.strings.lookup+0xac>
    2a9c:      	movz	x0, #0x0, lsl #48
    2aa0:      	movz	x1, #0x0, lsl #48
    2aa4:      	movz	x2, #0x0, lsl #48
    2aa8:      	str	x0, [x8]
    2aac:      	str	x1, [x8, #0x8]
    2ab0:      	str	x2, [x8, #0x10]
    2ab4:      	ret
    2ab8:      	movz	x0, #0x0, lsl #48
    2abc:      	movz	x1, #0x0, lsl #48
    2ac0:      	movz	x2, #0x0, lsl #48
    2ac4:      	b	0x2aa8 <_stogir.strings.lookup+0x90>

0000000000002ac8 <_stogir.uses.edge-code?>:
    2ac8:      	ubfx	x0, x0, #0, #32
    2acc:      	cmp	x0, #0xf
    2ad0:      	b.hs	0x2b04 <_stogir.uses.edge-code?+0x3c>
    2ad4:      	mov	x16, #0x1               ; =1
    2ad8:      	lsl	x0, x16, x0
    2adc:      	lsr	w0, w0, #0
    2ae0:      	mov	x17, #0x5e1c            ; =24092
    2ae4:      	and	x0, x0, x17
    2ae8:      	lsr	w0, w0, #0
    2aec:      	cmp	x0, #0x0
    2af0:      	cset	w0, eq
    2af4:      	uxtb	w16, w0
    2af8:      	cmp	w16, wzr
    2afc:      	cset	x0, eq
    2b00:      	b	0x2b08 <_stogir.uses.edge-code?+0x40>
    2b04:      	movz	x0, #0x0, lsl #48
    2b08:      	ret

0000000000002b0c <_stogir.graph.contains?>:
    2b0c:      	sxtw	x1, w1
    2b10:      	cmp	x1, #0x0
    2b14:      	b.le	0x2b58 <_stogir.graph.contains?+0x4c>
    2b18:      	ldr	x2, [x0, #0x8]
    2b1c:      	cmp	x1, x2
    2b20:      	b.ge	0x2bb8 <_stogir.graph.contains?+0xac>
    2b24:      	add	x2, x0, #0x78
    2b28:      	ldr	x2, [x2, #0x8]
    2b2c:      	cmp	x1, x2
    2b30:      	b.ge	0x2bc8 <_stogir.graph.contains?+0xbc>
    2b34:      	lsl	x1, x1, #2
    2b38:      	ldr	x0, [x0, #0x78]
    2b3c:      	add	x0, x1, x0
    2b40:      	ldr	w0, [x0]
    2b44:      	sxtw	x0, w0
    2b48:      	cmp	x0, #0x0
    2b4c:      	cset	w0, ge
    2b50:      	ubfx	x0, x0, #0, #8
    2b54:      	b	0x2bcc <_stogir.graph.contains?+0xc0>
    2b58:      	cmp	x1, #0x0
    2b5c:      	b.ge	0x2bc0 <_stogir.graph.contains?+0xb4>
    2b60:      	add	x2, x0, #0x28
    2b64:      	add	x3, x0, #0x50
    2b68:      	ldr	x2, [x2, #0x8]
    2b6c:      	ldr	x3, [x3, #0x8]
    2b70:      	cmp	x2, x3
    2b74:      	b.ne	0x2bd8 <_stogir.graph.contains?+0xcc>
    2b78:      	movz	x16, #0x0, lsl #48
    2b7c:      	sub	x3, x16, x1
    2b80:      	cmp	x3, x2
    2b84:      	b.gt	0x2bd0 <_stogir.graph.contains?+0xc4>
    2b88:      	movz	x16, #0x0, lsl #48
    2b8c:      	sub	x1, x16, x1
    2b90:      	sub	x1, x1, #0x1
    2b94:      	lsl	x1, x1, #2
    2b98:      	ldr	x0, [x0, #0x50]
    2b9c:      	add	x0, x1, x0
    2ba0:      	ldr	w0, [x0]
    2ba4:      	sxtw	x0, w0
    2ba8:      	cmp	x0, #0x0
    2bac:      	cset	w0, gt
    2bb0:      	ubfx	x0, x0, #0, #8
    2bb4:      	b	0x2bd4 <_stogir.graph.contains?+0xc8>
    2bb8:      	movz	x0, #0x0, lsl #48
    2bbc:      	b	0x2bcc <_stogir.graph.contains?+0xc0>
    2bc0:      	movz	x0, #0x0, lsl #48
    2bc4:      	b	0x2bd4 <_stogir.graph.contains?+0xc8>
    2bc8:      	movz	x0, #0x0, lsl #48
    2bcc:      	b	0x2bd4 <_stogir.graph.contains?+0xc8>
    2bd0:      	movz	x0, #0x0, lsl #48
    2bd4:      	ret
    2bd8:      	movz	x0, #0x0, lsl #48
    2bdc:      	b	0x2bd4 <_stogir.graph.contains?+0xc8>

0000000000002be0 <_stogir.opcode.optional-reference?>:
    2be0:      	sub	sp, sp, #0x30
    2be4:      	str	x29, [sp]
    2be8:      	str	x30, [sp, #0x8]
    2bec:      	mov	x29, sp
    2bf0:      	str	x19, [sp, #0x10]
    2bf4:      	str	x20, [sp, #0x18]
    2bf8:      	str	x21, [sp, #0x20]
    2bfc:      	lsr	w0, w0, #0
    2c00:      	lsr	w2, w2, #0
    2c04:      	mov	w19, w0
    2c08:      	mov	w20, w1
    2c0c:      	mov	w1, w2
    2c10:      	mov	w21, w2
    2c14:      	bl	0x2c14 <_stogir.opcode.optional-reference?+0x34>
		0000000000002c14:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
    2c18:      	lsr	w0, w0, #0
    2c1c:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x11b0>
		0000000000002c1c:  ARM64_RELOC_PAGE21	l_stogir.332
    2c20:      	ldr	x16, [x16]
		0000000000002c20:  ARM64_RELOC_PAGEOFF12	l_stogir.332
    2c24:      	ldr	w1, [x16]
    2c28:      	cmp	x0, x1
    2c2c:      	b.ne	0x2c58 <_stogir.opcode.optional-reference?+0x78>
    2c30:      	mov	x0, #0x1                ; =1
    2c34:      	b	0x2c3c <_stogir.opcode.optional-reference?+0x5c>
    2c38:      	movz	x0, #0x0, lsl #48
    2c3c:      	ldr	x19, [sp, #0x10]
    2c40:      	ldr	x20, [sp, #0x18]
    2c44:      	ldr	x21, [sp, #0x20]
    2c48:      	ldr	x29, [sp]
    2c4c:      	ldr	x30, [sp, #0x8]
    2c50:      	add	sp, sp, #0x30
    2c54:      	ret
    2c58:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x11b0>
		0000000000002c58:  ARM64_RELOC_PAGE21	l_stogir.333
    2c5c:      	ldr	x16, [x16]
		0000000000002c5c:  ARM64_RELOC_PAGEOFF12	l_stogir.333
    2c60:      	ldr	w1, [x16]
    2c64:      	cmp	x0, x1
    2c68:      	b.ne	0x2c74 <_stogir.opcode.optional-reference?+0x94>
    2c6c:      	mov	x0, #0x1                ; =1
    2c70:      	b	0x2c3c <_stogir.opcode.optional-reference?+0x5c>
    2c74:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x11b0>
		0000000000002c74:  ARM64_RELOC_PAGE21	l_stogir.334
    2c78:      	ldr	x16, [x16]
		0000000000002c78:  ARM64_RELOC_PAGEOFF12	l_stogir.334
    2c7c:      	ldr	w1, [x16]
    2c80:      	cmp	x0, x1
    2c84:      	b.ne	0x2c90 <_stogir.opcode.optional-reference?+0xb0>
    2c88:      	mov	x0, #0x1                ; =1
    2c8c:      	b	0x2c3c <_stogir.opcode.optional-reference?+0x5c>
    2c90:      	sxtw	x19, w19
    2c94:      	cmp	x19, #0x78
    2c98:      	b.ne	0x2cbc <_stogir.opcode.optional-reference?+0xdc>
    2c9c:      	sxtw	x20, w20
    2ca0:      	cmp	x20, #0x0
    2ca4:      	b.ne	0x2c38 <_stogir.opcode.optional-reference?+0x58>
    2ca8:      	sxtw	x21, w21
    2cac:      	cmp	x21, #0x2
    2cb0:      	cset	w0, eq
    2cb4:      	ubfx	x0, x0, #0, #8
    2cb8:      	b	0x2c3c <_stogir.opcode.optional-reference?+0x5c>
    2cbc:      	movz	x0, #0x0, lsl #48
    2cc0:      	b	0x2c3c <_stogir.opcode.optional-reference?+0x5c>

0000000000002cc4 <_stogir.integer-binary.operation?>:
    2cc4:      	sxtw	x0, w0
    2cc8:      	cmp	x0, #0x1a
    2ccc:      	b.lt	0x2ce0 <_stogir.integer-binary.operation?+0x1c>
    2cd0:      	cmp	x0, #0x1e
    2cd4:      	b.gt	0x2ce0 <_stogir.integer-binary.operation?+0x1c>
    2cd8:      	mov	x0, #0x1                ; =1
    2cdc:      	b	0x2d14 <_stogir.integer-binary.operation?+0x50>
    2ce0:      	cmp	x0, #0x2e
    2ce4:      	b.lt	0x2cf8 <_stogir.integer-binary.operation?+0x34>
    2ce8:      	cmp	x0, #0x35
    2cec:      	b.gt	0x2cf8 <_stogir.integer-binary.operation?+0x34>
    2cf0:      	mov	x0, #0x1                ; =1
    2cf4:      	b	0x2d14 <_stogir.integer-binary.operation?+0x50>
    2cf8:      	cmp	x0, #0x3a
    2cfc:      	b.ne	0x2d08 <_stogir.integer-binary.operation?+0x44>
    2d00:      	mov	x0, #0x1                ; =1
    2d04:      	b	0x2d14 <_stogir.integer-binary.operation?+0x50>
    2d08:      	cmp	x0, #0x3b
    2d0c:      	cset	w0, eq
    2d10:      	ubfx	x0, x0, #0, #8
    2d14:      	ret

0000000000002d18 <_stogir.integer-unary.operation?>:
    2d18:      	sxtw	x0, w0
    2d1c:      	cmp	x0, #0x1f
    2d20:      	b.ne	0x2d3c <_stogir.integer-unary.operation?+0x24>
    2d24:      	mov	x0, #0x1                ; =1
    2d28:      	b	0x2d38 <_stogir.integer-unary.operation?+0x20>
    2d2c:      	cmp	x0, #0x39
    2d30:      	cset	w0, eq
    2d34:      	ubfx	x0, x0, #0, #8
    2d38:      	ret
    2d3c:      	cmp	x0, #0x20
    2d40:      	b.ne	0x2d4c <_stogir.integer-unary.operation?+0x34>
    2d44:      	mov	x0, #0x1                ; =1
    2d48:      	b	0x2d38 <_stogir.integer-unary.operation?+0x20>
    2d4c:      	cmp	x0, #0x2d
    2d50:      	b.ne	0x2d5c <_stogir.integer-unary.operation?+0x44>
    2d54:      	mov	x0, #0x1                ; =1
    2d58:      	b	0x2d38 <_stogir.integer-unary.operation?+0x20>
    2d5c:      	cmp	x0, #0x36
    2d60:      	b.ne	0x2d6c <_stogir.integer-unary.operation?+0x54>
    2d64:      	mov	x0, #0x1                ; =1
    2d68:      	b	0x2d38 <_stogir.integer-unary.operation?+0x20>
    2d6c:      	cmp	x0, #0x37
    2d70:      	b.ne	0x2d7c <_stogir.integer-unary.operation?+0x64>
    2d74:      	mov	x0, #0x1                ; =1
    2d78:      	b	0x2d38 <_stogir.integer-unary.operation?+0x20>
    2d7c:      	cmp	x0, #0x38
    2d80:      	b.ne	0x2d2c <_stogir.integer-unary.operation?+0x14>
    2d84:      	mov	x0, #0x1                ; =1
    2d88:      	b	0x2d38 <_stogir.integer-unary.operation?+0x20>

0000000000002d8c <_stogir.verify.classifications>:
    2d8c:      	sub	sp, sp, #0xf0
    2d90:      	str	x29, [sp]
    2d94:      	str	x30, [sp, #0x8]
    2d98:      	mov	x29, sp
    2d9c:      	str	x19, [sp, #0xa0]
    2da0:      	str	x20, [sp, #0xa8]
    2da4:      	str	x21, [sp, #0xb0]
    2da8:      	str	x22, [sp, #0xb8]
    2dac:      	str	x23, [sp, #0xc0]
    2db0:      	str	x24, [sp, #0xc8]
    2db4:      	str	x25, [sp, #0xd0]
    2db8:      	str	x26, [sp, #0xd8]
    2dbc:      	str	x27, [sp, #0xe0]
    2dc0:      	str	x28, [sp, #0xe8]
    2dc4:      	ldr	w4, [x2]
    2dc8:      	orr	x5, x4, xzr
    2dcc:      	ubfx	x5, x5, #8, #8
    2dd0:      	orr	x19, x5, xzr
    2dd4:      	cmp	x19, #0xf
    2dd8:      	b.le	0x2e14 <_stogir.verify.classifications+0x88>
    2ddc:      	cmp	x19, #0x80
    2de0:      	b.ge	0x2e08 <_stogir.verify.classifications+0x7c>
    2de4:      	and	x5, x19, #0xf
    2de8:      	lsr	w5, w5, #0
    2dec:      	sxtw	x5, w5
    2df0:      	cmp	x5, #0x1
    2df4:      	b.lt	0x3468 <_stogir.verify.classifications+0x6dc>
    2df8:      	cmp	x5, #0xd
    2dfc:      	cset	w5, le
    2e00:      	ubfx	x5, x5, #0, #8
    2e04:      	b	0x346c <_stogir.verify.classifications+0x6e0>
    2e08:      	movz	x5, #0x0, lsl #48
    2e0c:      	mov	x20, x5
    2e10:      	b	0x2e18 <_stogir.verify.classifications+0x8c>
    2e14:      	movz	x20, #0x0, lsl #48
    2e18:      	uxtb	w21, w4
    2e1c:      	orr	x4, x21, xzr
    2e20:      	lsr	w22, w4, #0
    2e24:      	mov	x23, x0
    2e28:      	mov	w0, w22
    2e2c:      	mov	w24, w1
    2e30:      	mov	x25, x2
    2e34:      	mov	w26, w3
    2e38:      	bl	0x2e38 <_stogir.verify.classifications+0xac>
		0000000000002e38:  ARM64_RELOC_BRANCH26	_stogir.floating.operation?
    2e3c:      	cmp	x0, #0x0
    2e40:      	b.eq	0x2e60 <_stogir.verify.classifications+0xd4>
    2e44:      	cmp	x20, #0x0
    2e48:      	cset	w0, ne
    2e4c:      	uxtb	w16, w0
    2e50:      	cmp	w16, wzr
    2e54:      	cset	x0, eq
    2e58:      	mov	x27, x0
    2e5c:      	b	0x2e64 <_stogir.verify.classifications+0xd8>
    2e60:      	movz	x27, #0x0, lsl #48
    2e64:      	cmp	x27, #0x0
    2e68:      	cset	w28, ne
    2e6c:      	uxtb	w16, w28
    2e70:      	cmp	w16, wzr
    2e74:      	b.eq	0x2ea8 <_stogir.verify.classifications+0x11c>
    2e78:      	ldr	w0, [x25, #0x4]
    2e7c:      	lsr	w0, w0, #0
    2e80:      	mov	w1, w0
    2e84:      	mov	x0, x23
    2e88:      	bl	0x2e88 <_stogir.verify.classifications+0xfc>
		0000000000002e88:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    2e8c:      	cmp	x0, #0x0
    2e90:      	b.ne	0x2e9c <_stogir.verify.classifications+0x110>
    2e94:      	movn	x0, #0x0, lsl #48
    2e98:      	b	0x2ea4 <_stogir.verify.classifications+0x118>
    2e9c:      	ldr	w0, [x0]
    2ea0:      	ubfx	x0, x0, #8, #8
    2ea4:      	b	0x2eac <_stogir.verify.classifications+0x120>
    2ea8:      	movn	x0, #0x0, lsl #48
    2eac:      	lsr	w0, w0, #0
    2eb0:      	sxtw	x0, w0
    2eb4:      	cmp	x0, #0xf
    2eb8:      	cset	w1, gt
    2ebc:      	cmp	x0, #0x80
    2ec0:      	cset	w2, lt
    2ec4:      	and	x3, x0, #0xf
    2ec8:      	lsr	w3, w3, #0
    2ecc:      	sxtw	x3, w3
    2ed0:      	cmp	x3, #0x1
    2ed4:      	cset	w4, ge
    2ed8:      	cmp	x3, #0xd
    2edc:      	cset	w3, le
    2ee0:      	cmp	x27, #0x0
    2ee4:      	b.eq	0x2f3c <_stogir.verify.classifications+0x1b0>
    2ee8:      	uxtb	w16, w1
    2eec:      	cmp	w16, wzr
    2ef0:      	b.eq	0x3470 <_stogir.verify.classifications+0x6e4>
    2ef4:      	uxtb	w16, w2
    2ef8:      	cmp	w16, wzr
    2efc:      	b.eq	0x3470 <_stogir.verify.classifications+0x6e4>
    2f00:      	uxtb	w16, w4
    2f04:      	cmp	w16, wzr
    2f08:      	b.eq	0x3470 <_stogir.verify.classifications+0x6e4>
    2f0c:      	uxtb	w16, w3
    2f10:      	cmp	w16, wzr
    2f14:      	b.eq	0x3470 <_stogir.verify.classifications+0x6e4>
    2f18:      	movz	x0, #0x0, lsl #48
    2f1c:      	b	0x2f24 <_stogir.verify.classifications+0x198>
    2f20:      	mov	x0, #0x1                ; =1
    2f24:      	mov	x19, x0
    2f28:      	b	0x2f40 <_stogir.verify.classifications+0x1b4>
    2f2c:      	movz	x9, #0x0, lsl #48
    2f30:      	b	0x2fa4 <_stogir.verify.classifications+0x218>
    2f34:      	movz	x0, #0x0, lsl #48
    2f38:      	b	0x2fac <_stogir.verify.classifications+0x220>
    2f3c:      	movz	x19, #0x0, lsl #48
    2f40:      	sxtw	x26, w26
    2f44:      	ubfx	x21, x3, #0, #8
    2f48:      	add	x27, x23, #0x78
    2f4c:      	add	x0, x23, #0x28
    2f50:      	add	x3, x23, #0x50
    2f54:      	sxtw	x24, w24
    2f58:      	add	x5, x23, #0x78
    2f5c:      	add	x6, x23, #0x28
    2f60:      	add	x7, x23, #0x50
    2f64:      	cmp	x24, #0x0
    2f68:      	cset	w8, le
    2f6c:      	lsl	x9, x24, #2
    2f70:      	cmp	x24, #0x0
    2f74:      	cset	w10, gt
    2f78:      	cmp	x24, #0x0
    2f7c:      	cset	w11, lt
    2f80:      	movz	x16, #0x0, lsl #48
    2f84:      	sub	x12, x16, x24
    2f88:      	sub	x13, x12, #0x1
    2f8c:      	lsl	x13, x13, #2
    2f90:      	mov	x14, #0x1               ; =1
    2f94:      	b	0x30d0 <_stogir.verify.classifications+0x344>
    2f98:      	movz	x9, #0x0, lsl #48
    2f9c:      	b	0x2fe0 <_stogir.verify.classifications+0x254>
    2fa0:      	movz	x9, #0x0, lsl #48
    2fa4:      	b	0x2ff0 <_stogir.verify.classifications+0x264>
    2fa8:      	movz	x0, #0x0, lsl #48
    2fac:      	ldr	x11, [sp, #0x58]
    2fb0:      	ldr	x12, [sp, #0x50]
    2fb4:      	ldr	x14, [sp, #0x48]
    2fb8:      	ldr	x2, [sp, #0x70]
    2fbc:      	ldr	w1, [sp, #0x78]
    2fc0:      	ldr	x3, [sp, #0x68]
    2fc4:      	ldr	x5, [sp, #0x60]
    2fc8:      	ldr	x6, [sp, #0x80]
    2fcc:      	ldr	x7, [sp, #0x88]
    2fd0:      	mov	x4, x0
    2fd4:      	ldr	x0, [sp, #0x90]
    2fd8:      	b	0x3070 <_stogir.verify.classifications+0x2e4>
    2fdc:      	movz	x9, #0x0, lsl #48
    2fe0:      	ldr	x12, [sp, #0x50]
    2fe4:      	ldr	x14, [sp, #0x48]
    2fe8:      	b	0x2ff0 <_stogir.verify.classifications+0x264>
    2fec:      	movz	x9, #0x0, lsl #48
    2ff0:      	cmp	x9, #0x0
    2ff4:      	b.eq	0x3024 <_stogir.verify.classifications+0x298>
    2ff8:      	uxtb	w16, w8
    2ffc:      	cmp	w16, wzr
    3000:      	b.eq	0x3014 <_stogir.verify.classifications+0x288>
    3004:      	lsl	x4, x4, #4
    3008:      	ldr	x8, [x23]
    300c:      	add	x4, x4, x8
    3010:      	b	0x3020 <_stogir.verify.classifications+0x294>
    3014:      	lsl	x4, x10, #4
    3018:      	ldr	x8, [x23, #0x28]
    301c:      	add	x4, x4, x8
    3020:      	b	0x3028 <_stogir.verify.classifications+0x29c>
    3024:      	movz	x4, #0x0, lsl #48
    3028:      	cmp	x4, #0x0
    302c:      	b.eq	0x306c <_stogir.verify.classifications+0x2e0>
    3030:      	ldr	w4, [x4]
    3034:      	ubfx	x4, x4, #8, #8
    3038:      	cmp	x4, #0xf
    303c:      	b.le	0x306c <_stogir.verify.classifications+0x2e0>
    3040:      	cmp	x4, #0x80
    3044:      	b.ge	0x306c <_stogir.verify.classifications+0x2e0>
    3048:      	and	x4, x4, #0xf
    304c:      	lsr	w4, w4, #0
    3050:      	sxtw	x4, w4
    3054:      	cmp	x4, #0x1
    3058:      	b.lt	0x306c <_stogir.verify.classifications+0x2e0>
    305c:      	cmp	x4, #0xd
    3060:      	b.gt	0x306c <_stogir.verify.classifications+0x2e0>
    3064:      	mov	x4, #0x1                ; =1
    3068:      	b	0x3070 <_stogir.verify.classifications+0x2e4>
    306c:      	ldr	x4, [sp, #0x40]
    3070:      	add	x8, x20, #0x1
    3074:      	lsr	w8, w8, #0
    3078:      	sxtw	x8, w8
    307c:      	mov	x9, x2
    3080:      	mov	w2, w22
    3084:      	ldr	w22, [sp, #0x28]
    3088:      	mov	w10, w19
    308c:      	ldr	x19, [sp, #0x38]
    3090:      	mov	x13, x7
    3094:      	mov	x7, x5
    3098:      	mov	x5, x0
    309c:      	mov	x0, x12
    30a0:      	mov	x12, x6
    30a4:      	mov	x6, x3
    30a8:      	mov	x3, x14
    30ac:      	mov	x20, x4
    30b0:      	mov	w4, w26
    30b4:      	ldr	x26, [sp, #0x30]
    30b8:      	mov	x14, x8
    30bc:      	mov	w8, w27
    30c0:      	mov	x27, x11
    30c4:      	mov	w11, w1
    30c8:      	mov	w1, w21
    30cc:      	ldr	x21, [sp, #0x20]
    30d0:      	cmp	x20, #0x0
    30d4:      	b.ne	0x35ec <_stogir.verify.classifications+0x860>
    30d8:      	cmp	x14, x26
    30dc:      	b.gt	0x35f8 <_stogir.verify.classifications+0x86c>
    30e0:      	lsr	w15, w14, #0
    30e4:      	str	x0, [sp, #0x50]
    30e8:      	mov	w0, w22
    30ec:      	str	x3, [sp, #0x48]
    30f0:      	str	x5, [sp, #0x90]
    30f4:      	str	x6, [sp, #0x68]
    30f8:      	str	x7, [sp, #0x60]
    30fc:      	str	x9, [sp, #0x70]
    3100:      	str	w11, [sp, #0x78]
    3104:      	str	x12, [sp, #0x80]
    3108:      	str	x13, [sp, #0x88]
    310c:      	str	w15, [sp, #0x98]
    3110:      	str	x21, [sp, #0x20]
    3114:      	mov	w21, w1
    3118:      	mov	w1, w15
    311c:      	str	w22, [sp, #0x28]
    3120:      	mov	w22, w2
    3124:      	str	x26, [sp, #0x30]
    3128:      	mov	w26, w4
    312c:      	str	x19, [sp, #0x38]
    3130:      	mov	w19, w10
    3134:      	str	x20, [sp, #0x40]
    3138:      	mov	x20, x14
    313c:      	str	x27, [sp, #0x58]
    3140:      	mov	w27, w8
    3144:      	bl	0x3144 <_stogir.verify.classifications+0x3b8>
		0000000000003144:  ARM64_RELOC_BRANCH26	_stogir.opcode.operand-code
    3148:      	lsr	w0, w0, #0
    314c:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x274>
		000000000000314c:  ARM64_RELOC_PAGE21	l_stogir.335
    3150:      	ldr	x16, [x16]
		0000000000003150:  ARM64_RELOC_PAGEOFF12	l_stogir.335
    3154:      	ldr	w1, [x16]
    3158:      	cmp	x0, x1
    315c:      	b.eq	0x31a4 <_stogir.verify.classifications+0x418>
    3160:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x274>
		0000000000003160:  ARM64_RELOC_PAGE21	l_stogir.336
    3164:      	ldr	x16, [x16]
		0000000000003164:  ARM64_RELOC_PAGEOFF12	l_stogir.336
    3168:      	ldr	w1, [x16]
    316c:      	cmp	x0, x1
    3170:      	b.eq	0x31a4 <_stogir.verify.classifications+0x418>
    3174:      	ldr	x11, [sp, #0x58]
    3178:      	ldr	x12, [sp, #0x50]
    317c:      	ldr	x14, [sp, #0x48]
    3180:      	ldr	x2, [sp, #0x70]
    3184:      	ldr	x0, [sp, #0x90]
    3188:      	ldr	w1, [sp, #0x78]
    318c:      	ldr	x3, [sp, #0x68]
    3190:      	ldr	x5, [sp, #0x60]
    3194:      	ldr	x6, [sp, #0x80]
    3198:      	ldr	x7, [sp, #0x88]
    319c:      	ldr	x4, [sp, #0x40]
    31a0:      	b	0x3070 <_stogir.verify.classifications+0x2e4>
    31a4:      	cmp	x20, #0x1
    31a8:      	b.ne	0x31e4 <_stogir.verify.classifications+0x458>
    31ac:      	uxtb	w16, w28
    31b0:      	cmp	w16, wzr
    31b4:      	b.eq	0x31e4 <_stogir.verify.classifications+0x458>
    31b8:      	uxtb	w16, w21
    31bc:      	cmp	w16, wzr
    31c0:      	b.eq	0x2fa8 <_stogir.verify.classifications+0x21c>
    31c4:      	uxtb	w16, w22
    31c8:      	cmp	w16, wzr
    31cc:      	b.eq	0x2f34 <_stogir.verify.classifications+0x1a8>
    31d0:      	uxtb	w16, w26
    31d4:      	cmp	w16, wzr
    31d8:      	b.eq	0x3404 <_stogir.verify.classifications+0x678>
    31dc:      	ldr	x0, [sp, #0x20]
    31e0:      	b	0x3408 <_stogir.verify.classifications+0x67c>
    31e4:      	cmp	x20, #0x1
    31e8:      	b.ne	0x327c <_stogir.verify.classifications+0x4f0>
    31ec:      	ldr	w0, [x25, #0x4]
    31f0:      	sxtw	x0, w0
    31f4:      	ldr	x2, [sp, #0x70]
    31f8:      	ldr	w1, [sp, #0x78]
    31fc:      	ldr	x3, [sp, #0x68]
    3200:      	ldr	x5, [sp, #0x60]
    3204:      	ldr	x6, [sp, #0x80]
    3208:      	ldr	x7, [sp, #0x88]
    320c:      	mov	x4, x0
    3210:      	ldr	x0, [sp, #0x90]
    3214:      	lsr	w4, w4, #0
    3218:      	sxtw	x4, w4
    321c:      	cmp	x4, #0x0
    3220:      	cset	w8, gt
    3224:      	movz	x16, #0x0, lsl #48
    3228:      	sub	x9, x16, x4
    322c:      	sub	x10, x9, #0x1
    3230:      	uxtb	w16, w8
    3234:      	cmp	w16, wzr
    3238:      	b.eq	0x3604 <_stogir.verify.classifications+0x878>
    323c:      	ldr	x9, [x23, #0x8]
    3240:      	cmp	x4, x9
    3244:      	b.ge	0x360c <_stogir.verify.classifications+0x880>
    3248:      	ldr	x11, [sp, #0x58]
    324c:      	ldr	x9, [x11, #0x8]
    3250:      	cmp	x4, x9
    3254:      	b.ge	0x2f98 <_stogir.verify.classifications+0x20c>
    3258:      	lsl	x9, x4, #2
    325c:      	ldr	x12, [x23, #0x78]
    3260:      	add	x9, x9, x12
    3264:      	ldr	w9, [x9]
    3268:      	sxtw	x9, w9
    326c:      	cmp	x9, #0x0
    3270:      	cset	w9, ge
    3274:      	ubfx	x9, x9, #0, #8
    3278:      	b	0x2f9c <_stogir.verify.classifications+0x210>
    327c:      	cmp	x20, #0x2
    3280:      	b.ne	0x32fc <_stogir.verify.classifications+0x570>
    3284:      	ldr	w0, [x25, #0x8]
    3288:      	sxtw	x0, w0
    328c:      	ldr	x2, [sp, #0x70]
    3290:      	ldr	w1, [sp, #0x78]
    3294:      	ldr	x3, [sp, #0x68]
    3298:      	ldr	x5, [sp, #0x60]
    329c:      	ldr	x6, [sp, #0x80]
    32a0:      	ldr	x7, [sp, #0x88]
    32a4:      	mov	x4, x0
    32a8:      	ldr	x0, [sp, #0x90]
    32ac:      	b	0x3214 <_stogir.verify.classifications+0x488>
    32b0:      	cmp	x4, #0x0
    32b4:      	b.ge	0x3614 <_stogir.verify.classifications+0x888>
    32b8:      	ldr	x12, [sp, #0x50]
    32bc:      	ldr	x13, [x12, #0x8]
    32c0:      	ldr	x14, [sp, #0x48]
    32c4:      	ldr	x15, [x14, #0x8]
    32c8:      	cmp	x13, x15
    32cc:      	b.ne	0x2fa0 <_stogir.verify.classifications+0x214>
    32d0:      	cmp	x9, x13
    32d4:      	b.gt	0x2f2c <_stogir.verify.classifications+0x1a0>
    32d8:      	lsl	x9, x10, #2
    32dc:      	ldr	x13, [x23, #0x50]
    32e0:      	add	x9, x9, x13
    32e4:      	ldr	w9, [x9]
    32e8:      	sxtw	x9, w9
    32ec:      	cmp	x9, #0x0
    32f0:      	cset	w9, gt
    32f4:      	ubfx	x9, x9, #0, #8
    32f8:      	b	0x2f30 <_stogir.verify.classifications+0x1a4>
    32fc:      	cmp	x20, #0x3
    3300:      	b.ne	0x339c <_stogir.verify.classifications+0x610>
    3304:      	ldr	w0, [x25, #0xc]
    3308:      	sxtw	x0, w0
    330c:      	ldr	x2, [sp, #0x70]
    3310:      	ldr	w1, [sp, #0x78]
    3314:      	ldr	x3, [sp, #0x68]
    3318:      	ldr	x5, [sp, #0x60]
    331c:      	ldr	x6, [sp, #0x80]
    3320:      	ldr	x7, [sp, #0x88]
    3324:      	mov	x4, x0
    3328:      	ldr	x0, [sp, #0x90]
    332c:      	b	0x32ac <_stogir.verify.classifications+0x520>
    3330:      	ldr	x0, [sp, #0x40]
    3334:      	uxtb	w0, w0
    3338:      	ldr	x1, [sp, #0x38]
    333c:      	uxtb	w1, w1
    3340:      	add	x16, sp, #0x10
    3344:      	movz	w17, #0x0, lsl #16
    3348:      	strh	w17, [x16]
    334c:      	add	x16, sp, #0x10
    3350:      	strb	w0, [x16]
    3354:      	add	x16, sp, #0x10
    3358:      	strb	w1, [x16, #0x1]
    335c:      	add	x16, sp, #0x10
    3360:      	ldrh	w0, [x16]
    3364:      	ldr	x19, [sp, #0xa0]
    3368:      	ldr	x20, [sp, #0xa8]
    336c:      	ldr	x21, [sp, #0xb0]
    3370:      	ldr	x22, [sp, #0xb8]
    3374:      	ldr	x23, [sp, #0xc0]
    3378:      	ldr	x24, [sp, #0xc8]
    337c:      	ldr	x25, [sp, #0xd0]
    3380:      	ldr	x26, [sp, #0xd8]
    3384:      	ldr	x27, [sp, #0xe0]
    3388:      	ldr	x28, [sp, #0xe8]
    338c:      	ldr	x29, [sp]
    3390:      	ldr	x30, [sp, #0x8]
    3394:      	add	sp, sp, #0xf0
    3398:      	ret
    339c:      	uxtb	w16, w27
    33a0:      	cmp	w16, wzr
    33a4:      	b.eq	0x341c <_stogir.verify.classifications+0x690>
    33a8:      	ldr	x2, [sp, #0x70]
    33ac:      	ldr	x0, [sp, #0x90]
    33b0:      	ldr	w1, [sp, #0x78]
    33b4:      	ldr	x3, [sp, #0x68]
    33b8:      	ldr	x5, [sp, #0x60]
    33bc:      	ldr	x6, [sp, #0x80]
    33c0:      	ldr	x7, [sp, #0x88]
    33c4:      	movz	x4, #0x0, lsl #48
    33c8:      	movz	x8, #0x0, lsl #48
    33cc:      	lsr	w4, w4, #0
    33d0:      	lsr	x16, x4, #0
    33d4:      	cmp	x16, #0x1
    33d8:      	b.eq	0x33f4 <_stogir.verify.classifications+0x668>
    33dc:      	b.lo	0x33e4 <_stogir.verify.classifications+0x658>
    33e0:      	b	0x33f8 <_stogir.verify.classifications+0x66c>
    33e4:      	cmp	x16, #0x0
    33e8:      	b.eq	0x33f0 <_stogir.verify.classifications+0x664>
    33ec:      	b	0x33f8 <_stogir.verify.classifications+0x66c>
    33f0:      	b	0x33fc <_stogir.verify.classifications+0x670>
    33f4:      	b	0x340c <_stogir.verify.classifications+0x680>
    33f8:      	b	0x35e4 <_stogir.verify.classifications+0x858>
    33fc:      	movz	x4, #0x0, lsl #48
    3400:      	b	0x3418 <_stogir.verify.classifications+0x68c>
    3404:      	movz	x0, #0x0, lsl #48
    3408:      	b	0x2f38 <_stogir.verify.classifications+0x1ac>
    340c:      	lsr	w8, w8, #0
    3410:      	sxtw	x8, w8
    3414:      	mov	x4, x8
    3418:      	b	0x332c <_stogir.verify.classifications+0x5a0>
    341c:      	uxtb	w16, w19
    3420:      	cmp	w16, wzr
    3424:      	b.eq	0x3620 <_stogir.verify.classifications+0x894>
    3428:      	ldr	x0, [x23, #0x8]
    342c:      	cmp	x24, x0
    3430:      	b.ge	0x362c <_stogir.verify.classifications+0x8a0>
    3434:      	ldr	x0, [sp, #0x90]
    3438:      	ldr	x1, [x0, #0x8]
    343c:      	cmp	x24, x1
    3440:      	b.ge	0x3638 <_stogir.verify.classifications+0x8ac>
    3444:      	ldr	x1, [x23, #0x78]
    3448:      	ldr	x2, [sp, #0x70]
    344c:      	add	x1, x2, x1
    3450:      	ldr	w1, [x1]
    3454:      	sxtw	x1, w1
    3458:      	cmp	x1, #0x0
    345c:      	cset	w1, ge
    3460:      	ubfx	x1, x1, #0, #8
    3464:      	b	0x35c8 <_stogir.verify.classifications+0x83c>
    3468:      	movz	x5, #0x0, lsl #48
    346c:      	b	0x2e0c <_stogir.verify.classifications+0x80>
    3470:      	cmp	x21, #0x18
    3474:      	b.ne	0x3480 <_stogir.verify.classifications+0x6f4>
    3478:      	mov	x0, #0x1                ; =1
    347c:      	b	0x2f24 <_stogir.verify.classifications+0x198>
    3480:      	cmp	x21, #0x19
    3484:      	b.ne	0x359c <_stogir.verify.classifications+0x810>
    3488:      	mov	x0, #0x1                ; =1
    348c:      	b	0x2f24 <_stogir.verify.classifications+0x198>
    3490:      	movz	x4, #0x0, lsl #48
    3494:      	movz	x8, #0x0, lsl #48
    3498:      	b	0x33cc <_stogir.verify.classifications+0x640>
    349c:      	ldr	w1, [sp, #0x78]
    34a0:      	uxtb	w16, w1
    34a4:      	cmp	w16, wzr
    34a8:      	b.eq	0x3640 <_stogir.verify.classifications+0x8b4>
    34ac:      	ldr	x3, [sp, #0x68]
    34b0:      	ldr	x4, [x3, #0x8]
    34b4:      	ldr	x5, [sp, #0x60]
    34b8:      	ldr	x6, [x5, #0x8]
    34bc:      	cmp	x4, x6
    34c0:      	b.ne	0x3654 <_stogir.verify.classifications+0x8c8>
    34c4:      	ldr	x6, [sp, #0x80]
    34c8:      	cmp	x6, x4
    34cc:      	b.gt	0x3660 <_stogir.verify.classifications+0x8d4>
    34d0:      	ldr	x4, [x23, #0x50]
    34d4:      	ldr	x7, [sp, #0x88]
    34d8:      	add	x4, x7, x4
    34dc:      	ldr	w4, [x4]
    34e0:      	sxtw	x4, w4
    34e4:      	cmp	x4, #0x0
    34e8:      	cset	w4, gt
    34ec:      	ubfx	x4, x4, #0, #8
    34f0:      	b	0x35d0 <_stogir.verify.classifications+0x844>
    34f4:      	movz	x1, #0x0, lsl #48
    34f8:      	ldr	x3, [sp, #0x68]
    34fc:      	ldr	x5, [sp, #0x60]
    3500:      	ldr	x6, [sp, #0x80]
    3504:      	ldr	x7, [sp, #0x88]
    3508:      	mov	x4, x1
    350c:      	ldr	w1, [sp, #0x78]
    3510:      	b	0x3518 <_stogir.verify.classifications+0x78c>
    3514:      	movz	x4, #0x0, lsl #48
    3518:      	cmp	x4, #0x0
    351c:      	b.eq	0x33c4 <_stogir.verify.classifications+0x638>
    3520:      	ldr	w4, [sp, #0x98]
    3524:      	sxtw	x4, w4
    3528:      	cmp	x4, #0x1
    352c:      	b.lt	0x3490 <_stogir.verify.classifications+0x704>
    3530:      	ldr	x8, [x23, #0x78]
    3534:      	add	x8, x2, x8
    3538:      	ldr	w8, [x8]
    353c:      	sxtw	x8, w8
    3540:      	cmp	x4, x8
    3544:      	b.gt	0x3490 <_stogir.verify.classifications+0x704>
    3548:      	ldr	x8, [x23]
    354c:      	asr	x16, x4, #63
    3550:      	lsr	x16, x16, #62
    3554:      	add	x9, x4, x16
    3558:      	asr	x9, x9, #2
    355c:      	asr	x16, x4, #63
    3560:      	lsr	x16, x16, #62
    3564:      	add	x4, x4, x16
    3568:      	and	x4, x4, #0x3
    356c:      	sub	x4, x4, x16
    3570:      	add	x9, x9, x24
    3574:      	lsl	x4, x4, #2
    3578:      	lsl	x9, x9, #4
    357c:      	add	x8, x9, x8
    3580:      	add	x4, x4, x8
    3584:      	ldr	w4, [x4]
    3588:      	sxtw	x4, w4
    358c:      	and	x4, x4, #0xffffffff
    3590:      	mov	x8, x4
    3594:      	mov	x4, #0x1                ; =1
    3598:      	b	0x3498 <_stogir.verify.classifications+0x70c>
    359c:      	cmp	x19, #0xc
    35a0:      	b.eq	0x2f20 <_stogir.verify.classifications+0x194>
    35a4:      	cmp	x19, #0xd
    35a8:      	b.eq	0x2f20 <_stogir.verify.classifications+0x194>
    35ac:      	cmp	x0, #0xc
    35b0:      	b.ne	0x35d4 <_stogir.verify.classifications+0x848>
    35b4:      	mov	x0, #0x1                ; =1
    35b8:      	b	0x35e0 <_stogir.verify.classifications+0x854>
    35bc:      	movz	x4, #0x0, lsl #48
    35c0:      	b	0x3518 <_stogir.verify.classifications+0x78c>
    35c4:      	movz	x1, #0x0, lsl #48
    35c8:      	b	0x34f8 <_stogir.verify.classifications+0x76c>
    35cc:      	movz	x4, #0x0, lsl #48
    35d0:      	b	0x35c0 <_stogir.verify.classifications+0x834>
    35d4:      	cmp	x0, #0xd
    35d8:      	cset	w0, eq
    35dc:      	ubfx	x0, x0, #0, #8
    35e0:      	b	0x2f24 <_stogir.verify.classifications+0x198>
    35e4:      	brk	#0
    35e8:      	b	0x35e4 <_stogir.verify.classifications+0x858>
    35ec:      	str	x19, [sp, #0x38]
    35f0:      	str	x20, [sp, #0x40]
    35f4:      	b	0x3330 <_stogir.verify.classifications+0x5a4>
    35f8:      	str	x19, [sp, #0x38]
    35fc:      	str	x20, [sp, #0x40]
    3600:      	b	0x3330 <_stogir.verify.classifications+0x5a4>
    3604:      	ldr	x11, [sp, #0x58]
    3608:      	b	0x32b0 <_stogir.verify.classifications+0x524>
    360c:      	ldr	x11, [sp, #0x58]
    3610:      	b	0x2fdc <_stogir.verify.classifications+0x250>
    3614:      	ldr	x12, [sp, #0x50]
    3618:      	ldr	x14, [sp, #0x48]
    361c:      	b	0x2fec <_stogir.verify.classifications+0x260>
    3620:      	ldr	x2, [sp, #0x70]
    3624:      	ldr	x0, [sp, #0x90]
    3628:      	b	0x349c <_stogir.verify.classifications+0x710>
    362c:      	ldr	x2, [sp, #0x70]
    3630:      	ldr	x0, [sp, #0x90]
    3634:      	b	0x34f4 <_stogir.verify.classifications+0x768>
    3638:      	ldr	x2, [sp, #0x70]
    363c:      	b	0x35c4 <_stogir.verify.classifications+0x838>
    3640:      	ldr	x3, [sp, #0x68]
    3644:      	ldr	x5, [sp, #0x60]
    3648:      	ldr	x6, [sp, #0x80]
    364c:      	ldr	x7, [sp, #0x88]
    3650:      	b	0x3514 <_stogir.verify.classifications+0x788>
    3654:      	ldr	x6, [sp, #0x80]
    3658:      	ldr	x7, [sp, #0x88]
    365c:      	b	0x35bc <_stogir.verify.classifications+0x830>
    3660:      	ldr	x7, [sp, #0x88]
    3664:      	b	0x35cc <_stogir.verify.classifications+0x840>

0000000000003668 <_stogir.vector-lanes.operation?>:
    3668:      	sxtw	x0, w0
    366c:      	cmp	x0, #0x3d
    3670:      	b.lt	0x3684 <_stogir.vector-lanes.operation?+0x1c>
    3674:      	cmp	x0, #0x3f
    3678:      	cset	w0, le
    367c:      	ubfx	x0, x0, #0, #8
    3680:      	b	0x3688 <_stogir.vector-lanes.operation?+0x20>
    3684:      	movz	x0, #0x0, lsl #48
    3688:      	ret
    368c:      	udf	#0x0

0000000000003690 <_stogir.vector.validate>:
    3690:      	sub	sp, sp, #0x230
    3694:      	str	x29, [sp]
    3698:      	str	x30, [sp, #0x8]
    369c:      	mov	x29, sp
    36a0:      	str	x19, [sp, #0x1d8]
    36a4:      	str	x20, [sp, #0x1e0]
    36a8:      	str	x21, [sp, #0x1e8]
    36ac:      	str	x22, [sp, #0x1f0]
    36b0:      	str	x23, [sp, #0x1f8]
    36b4:      	str	x24, [sp, #0x200]
    36b8:      	str	x25, [sp, #0x208]
    36bc:      	str	x26, [sp, #0x210]
    36c0:      	str	x27, [sp, #0x218]
    36c4:      	str	x28, [sp, #0x220]
    36c8:      	lsr	w19, w1, #0
    36cc:      	mov	x20, x8
    36d0:      	add	x8, sp, #0x10
    36d4:      	mov	x21, x0
    36d8:      	mov	w22, w1
    36dc:      	mov	w1, w19
    36e0:      	mov	w23, w2
    36e4:      	bl	0x36e4 <_stogir.vector.validate+0x54>
		00000000000036e4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    36e8:      	add	x16, sp, #0x10
    36ec:      	ldr	w0, [x16]
    36f0:      	lsr	x16, x0, #0
    36f4:      	cmp	x16, #0x1
    36f8:      	b.eq	0x3714 <_stogir.vector.validate+0x84>
    36fc:      	b.lo	0x3704 <_stogir.vector.validate+0x74>
    3700:      	b	0x3718 <_stogir.vector.validate+0x88>
    3704:      	cmp	x16, #0x0
    3708:      	b.eq	0x3710 <_stogir.vector.validate+0x80>
    370c:      	b	0x3718 <_stogir.vector.validate+0x88>
    3710:      	b	0x371c <_stogir.vector.validate+0x8c>
    3714:      	b	0x37b4 <_stogir.vector.validate+0x124>
    3718:      	b	0x39dc <_stogir.vector.validate+0x34c>
    371c:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x274>
		000000000000371c:  ARM64_RELOC_PAGE21	l_stogir.337
    3720:      	ldr	x16, [x16]
		0000000000003720:  ARM64_RELOC_PAGEOFF12	l_stogir.337
    3724:      	orr	x0, x16, xzr
    3728:      	str	x20, [sp, #0x1a8]
    372c:      	mov	x1, x0
    3730:      	mov	x0, #0x1                ; =1
    3734:      	mov	x2, #0x1a               ; =26
    3738:      	b	0x376c <_stogir.vector.validate+0xdc>
    373c:      	lsr	w23, w23, #0
    3740:      	add	x8, sp, #0x70
    3744:      	mov	x0, x21
    3748:      	ldr	w1, [sp, #0x1a0]
    374c:      	mov	w2, w23
    3750:      	bl	0x3750 <_stogir.vector.validate+0xc0>
		0000000000003750:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    3754:      	add	x16, sp, #0x70
    3758:      	ldr	x0, [x16]
    375c:      	add	x16, sp, #0x70
    3760:      	ldr	x1, [x16, #0x8]
    3764:      	add	x16, sp, #0x70
    3768:      	ldr	x2, [x16, #0x10]
    376c:      	ldr	x3, [sp, #0x1a8]
    3770:      	str	x0, [x3]
    3774:      	str	x1, [x3, #0x8]
    3778:      	str	x2, [x3, #0x10]
    377c:      	ldr	x19, [sp, #0x1d8]
    3780:      	ldr	x20, [sp, #0x1e0]
    3784:      	ldr	x21, [sp, #0x1e8]
    3788:      	ldr	x22, [sp, #0x1f0]
    378c:      	ldr	x23, [sp, #0x1f8]
    3790:      	ldr	x24, [sp, #0x200]
    3794:      	ldr	x25, [sp, #0x208]
    3798:      	ldr	x26, [sp, #0x210]
    379c:      	ldr	x27, [sp, #0x218]
    37a0:      	ldr	x28, [sp, #0x220]
    37a4:      	ldr	x29, [sp]
    37a8:      	ldr	x30, [sp, #0x8]
    37ac:      	add	sp, sp, #0x230
    37b0:      	ret
    37b4:      	sxtw	x22, w22
    37b8:      	add	x16, sp, #0x10
    37bc:      	orr	x0, x16, xzr
    37c0:      	cmp	x22, #0x0
    37c4:      	cset	w24, le
    37c8:      	add	x0, x0, #0x8
    37cc:      	add	x16, sp, #0x10
    37d0:      	ldr	x1, [x16, #0x8]
    37d4:      	add	x16, sp, #0x40
    37d8:      	str	x1, [x16]
    37dc:      	ldr	x0, [x0, #0x8]
    37e0:      	add	x16, sp, #0x40
    37e4:      	str	x0, [x16, #0x8]
    37e8:      	uxtb	w16, w24
    37ec:      	cmp	w16, wzr
    37f0:      	b.eq	0x3814 <_stogir.vector.validate+0x184>
    37f4:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x274>
		00000000000037f4:  ARM64_RELOC_PAGE21	l_stogir.338
    37f8:      	ldr	x16, [x16]
		00000000000037f8:  ARM64_RELOC_PAGEOFF12	l_stogir.338
    37fc:      	orr	x0, x16, xzr
    3800:      	str	x20, [sp, #0x1a8]
    3804:      	mov	x1, x0
    3808:      	mov	x0, #0x1                ; =1
    380c:      	mov	x2, #0x3b               ; =59
    3810:      	b	0x376c <_stogir.vector.validate+0xdc>
    3814:      	lsl	x25, x22, #2
    3818:      	add	x16, sp, #0x40
    381c:      	ldr	w26, [x16]
    3820:      	uxtb	w0, w26
    3824:      	ldr	x1, [x21, #0x78]
    3828:      	orr	x27, x0, xzr
    382c:      	cmp	x27, #0x44
    3830:      	cset	w0, eq
    3834:      	add	x1, x25, x1
    3838:      	ldr	w28, [x1]
    383c:      	cmp	x27, #0x24
    3840:      	b.ne	0x3884 <_stogir.vector.validate+0x1f4>
    3844:      	str	x20, [sp, #0x1a8]
    3848:      	str	w19, [sp, #0x1a0]
    384c:      	uxtb	w16, w0
    3850:      	cmp	w16, wzr
    3854:      	b.eq	0x373c <_stogir.vector.validate+0xac>
    3858:      	add	x8, sp, #0x50
    385c:      	mov	x0, x21
    3860:      	ldr	w1, [sp, #0x1a0]
    3864:      	bl	0x3864 <_stogir.vector.validate+0x1d4>
		0000000000003864:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    3868:      	add	x16, sp, #0x50
    386c:      	ldr	x0, [x16]
    3870:      	add	x16, sp, #0x50
    3874:      	ldr	x1, [x16, #0x8]
    3878:      	add	x16, sp, #0x50
    387c:      	ldr	x2, [x16, #0x10]
    3880:      	b	0x376c <_stogir.vector.validate+0xdc>
    3884:      	uxtb	w16, w0
    3888:      	cmp	w16, wzr
    388c:      	b.ne	0x420c <_stogir.vector.validate+0xb7c>
    3890:      	cmp	x27, #0x3c
    3894:      	b.ne	0x3948 <_stogir.vector.validate+0x2b8>
    3898:      	add	x8, sp, #0x90
    389c:      	mov	x0, x21
    38a0:      	mov	w1, w19
    38a4:      	bl	0x38a4 <_stogir.vector.validate+0x214>
		00000000000038a4:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    38a8:      	add	x16, sp, #0x90
    38ac:      	ldr	x0, [x16]
    38b0:      	add	x16, sp, #0x90
    38b4:      	ldr	x1, [x16, #0x8]
    38b8:      	add	x16, sp, #0x90
    38bc:      	ldr	x2, [x16, #0x10]
    38c0:      	str	x20, [sp, #0x1a8]
    38c4:      	b	0x3944 <_stogir.vector.validate+0x2b4>
    38c8:      	cmp	x27, #0x41
    38cc:      	cset	w0, eq
    38d0:      	cmp	x27, #0x48
    38d4:      	cset	w1, eq
    38d8:      	cmp	x27, #0x55
    38dc:      	cset	w2, ge
    38e0:      	cmp	x27, #0x58
    38e4:      	cset	w3, le
    38e8:      	cmp	x27, #0x47
    38ec:      	b.ne	0x39e4 <_stogir.vector.validate+0x354>
    38f0:      	str	x20, [sp, #0x1a8]
    38f4:      	str	w19, [sp, #0x1a0]
    38f8:      	mov	w19, w0
    38fc:      	mov	w20, w1
    3900:      	str	w2, [sp, #0x1b0]
    3904:      	str	w3, [sp, #0x1b8]
    3908:      	mov	x0, x21
    390c:      	ldr	w1, [sp, #0x1a0]
    3910:      	bl	0x3910 <_stogir.vector.validate+0x280>
		0000000000003910:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    3914:      	cmp	x0, #0x0
    3918:      	b.eq	0x3a08 <_stogir.vector.validate+0x378>
    391c:      	add	x8, sp, #0xf0
    3920:      	mov	x0, x21
    3924:      	ldr	w1, [sp, #0x1a0]
    3928:      	bl	0x3928 <_stogir.vector.validate+0x298>
		0000000000003928:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.validate
    392c:      	add	x16, sp, #0xf0
    3930:      	ldr	x0, [x16]
    3934:      	add	x16, sp, #0xf0
    3938:      	ldr	x1, [x16, #0x8]
    393c:      	add	x16, sp, #0xf0
    3940:      	ldr	x2, [x16, #0x10]
    3944:      	b	0x376c <_stogir.vector.validate+0xdc>
    3948:      	cmp	x27, #0x3d
    394c:      	b.lt	0x3990 <_stogir.vector.validate+0x300>
    3950:      	cmp	x27, #0x3f
    3954:      	b.gt	0x3990 <_stogir.vector.validate+0x300>
    3958:      	lsr	w23, w23, #0
    395c:      	add	x8, sp, #0xb0
    3960:      	mov	x0, x21
    3964:      	mov	w1, w19
    3968:      	mov	w2, w23
    396c:      	bl	0x396c <_stogir.vector.validate+0x2dc>
		000000000000396c:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.validate
    3970:      	add	x16, sp, #0xb0
    3974:      	ldr	x0, [x16]
    3978:      	add	x16, sp, #0xb0
    397c:      	ldr	x1, [x16, #0x8]
    3980:      	add	x16, sp, #0xb0
    3984:      	ldr	x2, [x16, #0x10]
    3988:      	str	x20, [sp, #0x1a8]
    398c:      	b	0x3944 <_stogir.vector.validate+0x2b4>
    3990:      	mov	x0, x21
    3994:      	mov	w1, w19
    3998:      	bl	0x3998 <_stogir.vector.validate+0x308>
		0000000000003998:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.node?
    399c:      	cmp	x0, #0x0
    39a0:      	b.eq	0x38c8 <_stogir.vector.validate+0x238>
    39a4:      	lsr	w23, w23, #0
    39a8:      	add	x8, sp, #0xd0
    39ac:      	mov	x0, x21
    39b0:      	mov	w1, w19
    39b4:      	mov	w2, w23
    39b8:      	bl	0x39b8 <_stogir.vector.validate+0x328>
		00000000000039b8:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.validate
    39bc:      	add	x16, sp, #0xd0
    39c0:      	ldr	x0, [x16]
    39c4:      	add	x16, sp, #0xd0
    39c8:      	ldr	x1, [x16, #0x8]
    39cc:      	add	x16, sp, #0xd0
    39d0:      	ldr	x2, [x16, #0x10]
    39d4:      	str	x20, [sp, #0x1a8]
    39d8:      	b	0x3944 <_stogir.vector.validate+0x2b4>
    39dc:      	brk	#0
    39e0:      	b	0x39dc <_stogir.vector.validate+0x34c>
    39e4:      	cmp	x27, #0x4f
    39e8:      	b.ne	0x3a84 <_stogir.vector.validate+0x3f4>
    39ec:      	str	x20, [sp, #0x1a8]
    39f0:      	str	w19, [sp, #0x1a0]
    39f4:      	mov	w19, w0
    39f8:      	mov	w20, w1
    39fc:      	str	w2, [sp, #0x1b0]
    3a00:      	str	w3, [sp, #0x1b8]
    3a04:      	b	0x3908 <_stogir.vector.validate+0x278>
    3a08:      	uxtb	w16, w19
    3a0c:      	cmp	w16, wzr
    3a10:      	b.ne	0x3a50 <_stogir.vector.validate+0x3c0>
    3a14:      	uxtb	w16, w20
    3a18:      	cmp	w16, wzr
    3a1c:      	b.ne	0x3a50 <_stogir.vector.validate+0x3c0>
    3a20:      	ldr	w0, [sp, #0x1b0]
    3a24:      	uxtb	w16, w0
    3a28:      	cmp	w16, wzr
    3a2c:      	b.eq	0x3a40 <_stogir.vector.validate+0x3b0>
    3a30:      	ldr	w0, [sp, #0x1b8]
    3a34:      	uxtb	w16, w0
    3a38:      	cmp	w16, wzr
    3a3c:      	b.ne	0x3a50 <_stogir.vector.validate+0x3c0>
    3a40:      	movz	x0, #0x0, lsl #48
    3a44:      	movz	x1, #0x0, lsl #48
    3a48:      	movz	x2, #0x0, lsl #48
    3a4c:      	b	0x3a80 <_stogir.vector.validate+0x3f0>
    3a50:      	lsr	w23, w23, #0
    3a54:      	add	x8, sp, #0x110
    3a58:      	mov	x0, x21
    3a5c:      	ldr	w1, [sp, #0x1a0]
    3a60:      	mov	w2, w23
    3a64:      	bl	0x3a64 <_stogir.vector.validate+0x3d4>
		0000000000003a64:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    3a68:      	add	x16, sp, #0x110
    3a6c:      	ldr	x0, [x16]
    3a70:      	add	x16, sp, #0x110
    3a74:      	ldr	x1, [x16, #0x8]
    3a78:      	add	x16, sp, #0x110
    3a7c:      	ldr	x2, [x16, #0x10]
    3a80:      	b	0x3944 <_stogir.vector.validate+0x2b4>
    3a84:      	cmp	x27, #0x50
    3a88:      	b.eq	0x4218 <_stogir.vector.validate+0xb88>
    3a8c:      	cmp	x27, #0x78
    3a90:      	b.ne	0x3ab0 <_stogir.vector.validate+0x420>
    3a94:      	str	x20, [sp, #0x1a8]
    3a98:      	str	w19, [sp, #0x1a0]
    3a9c:      	mov	w19, w0
    3aa0:      	mov	w20, w1
    3aa4:      	str	w2, [sp, #0x1b0]
    3aa8:      	str	w3, [sp, #0x1b8]
    3aac:      	b	0x3908 <_stogir.vector.validate+0x278>
    3ab0:      	uxtb	w16, w0
    3ab4:      	cmp	w16, wzr
    3ab8:      	b.ne	0x3b98 <_stogir.vector.validate+0x508>
    3abc:      	uxtb	w16, w1
    3ac0:      	cmp	w16, wzr
    3ac4:      	b.ne	0x3b98 <_stogir.vector.validate+0x508>
    3ac8:      	uxtb	w16, w2
    3acc:      	cmp	w16, wzr
    3ad0:      	b.eq	0x3ae0 <_stogir.vector.validate+0x450>
    3ad4:      	uxtb	w16, w3
    3ad8:      	cmp	w16, wzr
    3adc:      	b.ne	0x3b98 <_stogir.vector.validate+0x508>
    3ae0:      	str	w2, [sp, #0x1b0]
    3ae4:      	str	w3, [sp, #0x1b8]
    3ae8:      	str	w19, [sp, #0x1a0]
    3aec:      	str	x20, [sp, #0x1a8]
    3af0:      	mov	w20, w1
    3af4:      	mov	w1, w19
    3af8:      	mov	w19, w0
    3afc:      	mov	x0, x21
    3b00:      	bl	0x3b00 <_stogir.vector.validate+0x470>
		0000000000003b00:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    3b04:      	cmp	x0, #0x0
    3b08:      	b.ne	0x3908 <_stogir.vector.validate+0x278>
    3b0c:      	sxtw	x28, w28
    3b10:      	ubfx	x0, x26, #8, #8
    3b14:      	orr	x1, x0, xzr
    3b18:      	lsr	w19, w1, #0
    3b1c:      	cmp	x27, #0x5b
    3b20:      	b.eq	0x3bd0 <_stogir.vector.validate+0x540>
    3b24:      	cmp	x27, #0x5c
    3b28:      	b.eq	0x3bd0 <_stogir.vector.validate+0x540>
    3b2c:      	orr	x20, x0, xzr
    3b30:      	cmp	x27, #0x5d
    3b34:      	b.eq	0x3c48 <_stogir.vector.validate+0x5b8>
    3b38:      	cmp	x27, #0x5e
    3b3c:      	b.eq	0x3c48 <_stogir.vector.validate+0x5b8>
    3b40:      	cmp	x27, #0x43
    3b44:      	b.ne	0x3cc8 <_stogir.vector.validate+0x638>
    3b48:      	mov	w0, w19
    3b4c:      	bl	0x3b4c <_stogir.vector.validate+0x4bc>
		0000000000003b4c:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    3b50:      	cmp	x0, #0x0
    3b54:      	b.eq	0x40b8 <_stogir.vector.validate+0xa28>
    3b58:      	lsr	w23, w23, #0
    3b5c:      	mov	w0, w19
    3b60:      	mov	w1, w23
    3b64:      	bl	0x3b64 <_stogir.vector.validate+0x4d4>
		0000000000003b64:  ARM64_RELOC_BRANCH26	_stogir.types.size
    3b68:      	lsr	w0, w0, #0
    3b6c:      	sxtw	x0, w0
    3b70:      	cmp	x0, #0x0
    3b74:      	b.le	0x40b8 <_stogir.vector.validate+0xa28>
    3b78:      	cmp	x28, #0x3
    3b7c:      	b.lt	0x40b8 <_stogir.vector.validate+0xa28>
    3b80:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x274>
		0000000000003b80:  ARM64_RELOC_PAGE21	l_stogir.339
    3b84:      	ldr	x16, [x16]
		0000000000003b84:  ARM64_RELOC_PAGEOFF12	l_stogir.339
    3b88:      	orr	x0, x16, xzr
    3b8c:      	mov	x26, x0
    3b90:      	movz	x27, #0x0, lsl #48
    3b94:      	b	0x40cc <_stogir.vector.validate+0xa3c>
    3b98:      	str	x20, [sp, #0x1a8]
    3b9c:      	str	w19, [sp, #0x1a0]
    3ba0:      	mov	w19, w0
    3ba4:      	mov	w20, w1
    3ba8:      	str	w2, [sp, #0x1b0]
    3bac:      	str	w3, [sp, #0x1b8]
    3bb0:      	b	0x3908 <_stogir.vector.validate+0x278>
    3bb4:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x274>
		0000000000003bb4:  ARM64_RELOC_PAGE21	l_stogir.340
    3bb8:      	ldr	x16, [x16]
		0000000000003bb8:  ARM64_RELOC_PAGEOFF12	l_stogir.340
    3bbc:      	orr	x0, x16, xzr
    3bc0:      	mov	x1, x0
    3bc4:      	mov	x0, #0x1                ; =1
    3bc8:      	mov	x2, #0x19               ; =25
    3bcc:      	b	0x3944 <_stogir.vector.validate+0x2b4>
    3bd0:      	cmp	x28, #0x2
    3bd4:      	b.ne	0x3bb4 <_stogir.vector.validate+0x524>
    3bd8:      	lsr	w23, w23, #0
    3bdc:      	add	x16, sp, #0x40
    3be0:      	ldr	w0, [x16, #0x4]
    3be4:      	add	x16, sp, #0x40
    3be8:      	ldr	w1, [x16, #0x8]
    3bec:      	lsr	w0, w0, #0
    3bf0:      	lsr	w1, w1, #0
    3bf4:      	add	x8, sp, #0x130
    3bf8:      	mov	w2, w23
    3bfc:      	mov	w3, w0
    3c00:      	mov	x0, x21
    3c04:      	mov	w4, w1
    3c08:      	mov	w1, w19
    3c0c:      	bl	0x3c0c <_stogir.vector.validate+0x57c>
		0000000000003c0c:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    3c10:      	add	x16, sp, #0x130
    3c14:      	ldr	x0, [x16]
    3c18:      	add	x16, sp, #0x130
    3c1c:      	ldr	x1, [x16, #0x8]
    3c20:      	add	x16, sp, #0x130
    3c24:      	ldr	x2, [x16, #0x10]
    3c28:      	b	0x3bcc <_stogir.vector.validate+0x53c>
    3c2c:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x274>
		0000000000003c2c:  ARM64_RELOC_PAGE21	l_stogir.341
    3c30:      	ldr	x16, [x16]
		0000000000003c30:  ARM64_RELOC_PAGEOFF12	l_stogir.341
    3c34:      	orr	x0, x16, xzr
    3c38:      	mov	x1, x0
    3c3c:      	mov	x0, #0x1                ; =1
    3c40:      	mov	x2, #0x1a               ; =26
    3c44:      	b	0x3bcc <_stogir.vector.validate+0x53c>
    3c48:      	cmp	x28, #0x3
    3c4c:      	b.ne	0x3c2c <_stogir.vector.validate+0x59c>
    3c50:      	cmp	x20, #0x0
    3c54:      	b.ne	0x3c2c <_stogir.vector.validate+0x59c>
    3c58:      	lsr	w23, w23, #0
    3c5c:      	add	x16, sp, #0x40
    3c60:      	ldr	w0, [x16, #0x4]
    3c64:      	add	x16, sp, #0x40
    3c68:      	ldr	w1, [x16, #0x8]
    3c6c:      	lsr	w0, w0, #0
    3c70:      	add	x16, sp, #0x40
    3c74:      	ldr	w2, [x16, #0xc]
    3c78:      	lsr	w1, w1, #0
    3c7c:      	lsr	w2, w2, #0
    3c80:      	add	x8, sp, #0x150
    3c84:      	mov	w3, w1
    3c88:      	mov	w1, w23
    3c8c:      	mov	w4, w2
    3c90:      	mov	w2, w0
    3c94:      	mov	x0, x21
    3c98:      	bl	0x3c98 <_stogir.vector.validate+0x608>
		0000000000003c98:  ARM64_RELOC_BRANCH26	_stogir.vector.store-inputs
    3c9c:      	add	x16, sp, #0x150
    3ca0:      	ldr	x0, [x16]
    3ca4:      	add	x16, sp, #0x150
    3ca8:      	ldr	x1, [x16, #0x8]
    3cac:      	add	x16, sp, #0x150
    3cb0:      	ldr	x2, [x16, #0x10]
    3cb4:      	b	0x3c44 <_stogir.vector.validate+0x5b4>
    3cb8:      	ldr	x1, [sp, #0x1c0]
    3cbc:      	mov	x2, x14
    3cc0:      	mov	x0, #0x1                ; =1
    3cc4:      	b	0x3c44 <_stogir.vector.validate+0x5b4>
    3cc8:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x274>
		0000000000003cc8:  ARM64_RELOC_PAGE21	l_stogir.342
    3ccc:      	ldr	x16, [x16]
		0000000000003ccc:  ARM64_RELOC_PAGEOFF12	l_stogir.342
    3cd0:      	orr	x0, x16, xzr
    3cd4:      	mov	x1, x0
    3cd8:      	mov	x0, #0x1                ; =1
    3cdc:      	mov	x2, #0x28               ; =40
    3ce0:      	b	0x3cc4 <_stogir.vector.validate+0x634>
    3ce4:      	mov	x0, x1
    3ce8:      	mov	x1, x27
    3cec:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x274>
		0000000000003cec:  ARM64_RELOC_PAGE21	l_stogir.343
    3cf0:      	ldr	x16, [x16]
		0000000000003cf0:  ARM64_RELOC_PAGEOFF12	l_stogir.343
    3cf4:      	orr	x2, x16, xzr
    3cf8:      	adrp	x16, 0x3000 <_stogir.verify.classifications+0x274>
		0000000000003cf8:  ARM64_RELOC_PAGE21	l_stogir.344
    3cfc:      	ldr	x16, [x16]
		0000000000003cfc:  ARM64_RELOC_PAGEOFF12	l_stogir.344
    3d00:      	orr	x3, x16, xzr
    3d04:      	add	x4, x21, #0x78
    3d08:      	add	x5, x21, #0x28
    3d0c:      	add	x6, x21, #0x50
    3d10:      	cmp	x22, #0x0
    3d14:      	cset	w7, gt
    3d18:      	add	x8, x21, #0x78
    3d1c:      	cmp	x22, #0x0
    3d20:      	cset	w9, lt
    3d24:      	add	x10, x21, #0x28
    3d28:      	add	x11, x21, #0x50
    3d2c:      	movz	x16, #0x0, lsl #48
    3d30:      	sub	x12, x16, x22
    3d34:      	sub	x13, x12, #0x1
    3d38:      	lsl	x13, x13, #2
    3d3c:      	mov	x14, x1
    3d40:      	mov	x1, x0
    3d44:      	mov	x0, #0x2                ; =2
    3d48:      	b	0x3e68 <_stogir.vector.validate+0x7d8>
    3d4c:      	movz	x15, #0x0, lsl #48
    3d50:      	b	0x3d6c <_stogir.vector.validate+0x6dc>
    3d54:      	movz	x15, #0x0, lsl #48
    3d58:      	b	0x3d74 <_stogir.vector.validate+0x6e4>
    3d5c:      	ldr	x1, [sp, #0x1d0]
    3d60:      	mov	x2, #0x1e               ; =30
    3d64:      	b	0x3e50 <_stogir.vector.validate+0x7c0>
    3d68:      	movz	x15, #0x0, lsl #48
    3d6c:      	b	0x3d74 <_stogir.vector.validate+0x6e4>
    3d70:      	movz	x15, #0x0, lsl #48
    3d74:      	cmp	x15, #0x0
    3d78:      	b.eq	0x3e08 <_stogir.vector.validate+0x778>
    3d7c:      	lsr	w15, w0, #0
    3d80:      	sxtw	x15, w15
    3d84:      	cmp	x15, #0x1
    3d88:      	b.lt	0x3df8 <_stogir.vector.validate+0x768>
    3d8c:      	ldr	x26, [x21, #0x78]
    3d90:      	add	x26, x25, x26
    3d94:      	ldr	w26, [x26]
    3d98:      	sxtw	x26, w26
    3d9c:      	cmp	x15, x26
    3da0:      	b.gt	0x3df8 <_stogir.vector.validate+0x768>
    3da4:      	ldr	x26, [x21]
    3da8:      	asr	x16, x15, #63
    3dac:      	lsr	x16, x16, #62
    3db0:      	add	x27, x15, x16
    3db4:      	asr	x27, x27, #2
    3db8:      	asr	x16, x15, #63
    3dbc:      	lsr	x16, x16, #62
    3dc0:      	add	x15, x15, x16
    3dc4:      	and	x15, x15, #0x3
    3dc8:      	sub	x15, x15, x16
    3dcc:      	add	x27, x27, x22
    3dd0:      	lsl	x15, x15, #2
    3dd4:      	lsl	x27, x27, #4
    3dd8:      	add	x26, x27, x26
    3ddc:      	add	x15, x15, x26
    3de0:      	ldr	w15, [x15]
    3de4:      	sxtw	x15, w15
    3de8:      	and	x15, x15, #0xffffffff
    3dec:      	mov	x26, x15
    3df0:      	mov	x15, #0x1               ; =1
    3df4:      	b	0x3e00 <_stogir.vector.validate+0x770>
    3df8:      	movz	x15, #0x0, lsl #48
    3dfc:      	movz	x26, #0x0, lsl #48
    3e00:      	b	0x3e10 <_stogir.vector.validate+0x780>
    3e04:      	nop
    3e08:      	movz	x15, #0x0, lsl #48
    3e0c:      	movz	x26, #0x0, lsl #48
    3e10:      	lsr	w15, w15, #0
    3e14:      	lsr	x16, x15, #0
    3e18:      	cmp	x16, #0x1
    3e1c:      	b.eq	0x3e38 <_stogir.vector.validate+0x7a8>
    3e20:      	b.lo	0x3e28 <_stogir.vector.validate+0x798>
    3e24:      	b	0x3e3c <_stogir.vector.validate+0x7ac>
    3e28:      	cmp	x16, #0x0
    3e2c:      	b.eq	0x3e34 <_stogir.vector.validate+0x7a4>
    3e30:      	b	0x3e3c <_stogir.vector.validate+0x7ac>
    3e34:      	b	0x3e40 <_stogir.vector.validate+0x7b0>
    3e38:      	b	0x3ed4 <_stogir.vector.validate+0x844>
    3e3c:      	b	0x41f4 <_stogir.vector.validate+0xb64>
    3e40:      	str	x2, [sp, #0x1c8]
    3e44:      	str	x3, [sp, #0x1d0]
    3e48:      	mov	x1, x2
    3e4c:      	mov	x2, #0x18               ; =24
    3e50:      	add	x0, x0, #0x1
    3e54:      	lsr	w0, w0, #0
    3e58:      	sxtw	x0, w0
    3e5c:      	ldr	x3, [sp, #0x1d0]
    3e60:      	mov	x14, x2
    3e64:      	ldr	x2, [sp, #0x1c8]
    3e68:      	cmp	x14, #0x0
    3e6c:      	cset	w15, eq
    3e70:      	uxtb	w16, w15
    3e74:      	cmp	w16, wzr
    3e78:      	b.eq	0x4234 <_stogir.vector.validate+0xba4>
    3e7c:      	cmp	x0, x28
    3e80:      	b.gt	0x423c <_stogir.vector.validate+0xbac>
    3e84:      	uxtb	w16, w24
    3e88:      	cmp	w16, wzr
    3e8c:      	b.ne	0x3e08 <_stogir.vector.validate+0x778>
    3e90:      	uxtb	w16, w7
    3e94:      	cmp	w16, wzr
    3e98:      	b.eq	0x3f40 <_stogir.vector.validate+0x8b0>
    3e9c:      	ldr	x15, [x21, #0x8]
    3ea0:      	cmp	x22, x15
    3ea4:      	b.ge	0x3d68 <_stogir.vector.validate+0x6d8>
    3ea8:      	ldr	x15, [x8, #0x8]
    3eac:      	cmp	x22, x15
    3eb0:      	b.ge	0x3d4c <_stogir.vector.validate+0x6bc>
    3eb4:      	ldr	x15, [x21, #0x78]
    3eb8:      	add	x15, x25, x15
    3ebc:      	ldr	w15, [x15]
    3ec0:      	sxtw	x15, w15
    3ec4:      	cmp	x15, #0x0
    3ec8:      	cset	w15, ge
    3ecc:      	ubfx	x15, x15, #0, #8
    3ed0:      	b	0x3d50 <_stogir.vector.validate+0x6c0>
    3ed4:      	lsr	w26, w26, #0
    3ed8:      	sxtw	x26, w26
    3edc:      	cmp	x26, #0x0
    3ee0:      	cset	w15, gt
    3ee4:      	movz	x16, #0x0, lsl #48
    3ee8:      	sub	x27, x16, x26
    3eec:      	str	x1, [sp, #0x1c0]
    3ef0:      	sub	x1, x27, #0x1
    3ef4:      	uxtb	w16, w15
    3ef8:      	cmp	w16, wzr
    3efc:      	b.eq	0x4244 <_stogir.vector.validate+0xbb4>
    3f00:      	ldr	x27, [x21, #0x8]
    3f04:      	cmp	x26, x27
    3f08:      	b.ge	0x424c <_stogir.vector.validate+0xbbc>
    3f0c:      	ldr	x27, [x4, #0x8]
    3f10:      	cmp	x26, x27
    3f14:      	b.ge	0x4254 <_stogir.vector.validate+0xbc4>
    3f18:      	lsl	x27, x26, #2
    3f1c:      	str	x2, [sp, #0x1c8]
    3f20:      	ldr	x2, [x21, #0x78]
    3f24:      	add	x2, x27, x2
    3f28:      	ldr	w2, [x2]
    3f2c:      	sxtw	x2, w2
    3f30:      	cmp	x2, #0x0
    3f34:      	cset	w2, ge
    3f38:      	ubfx	x2, x2, #0, #8
    3f3c:      	b	0x413c <_stogir.vector.validate+0xaac>
    3f40:      	uxtb	w16, w9
    3f44:      	cmp	w16, wzr
    3f48:      	b.eq	0x3d70 <_stogir.vector.validate+0x6e0>
    3f4c:      	ldr	x15, [x10, #0x8]
    3f50:      	ldr	x26, [x11, #0x8]
    3f54:      	cmp	x15, x26
    3f58:      	b.ne	0x3d54 <_stogir.vector.validate+0x6c4>
    3f5c:      	cmp	x12, x15
    3f60:      	b.gt	0x4140 <_stogir.vector.validate+0xab0>
    3f64:      	ldr	x15, [x21, #0x50]
    3f68:      	add	x15, x13, x15
    3f6c:      	ldr	w15, [x15]
    3f70:      	sxtw	x15, w15
    3f74:      	cmp	x15, #0x0
    3f78:      	cset	w15, gt
    3f7c:      	ubfx	x15, x15, #0, #8
    3f80:      	b	0x4144 <_stogir.vector.validate+0xab4>
    3f84:      	cmp	x26, #0x0
    3f88:      	b.ge	0x425c <_stogir.vector.validate+0xbcc>
    3f8c:      	ldr	x2, [x5, #0x8]
    3f90:      	str	x3, [sp, #0x1d0]
    3f94:      	ldr	x3, [x6, #0x8]
    3f98:      	cmp	x2, x3
    3f9c:      	b.ne	0x4130 <_stogir.vector.validate+0xaa0>
    3fa0:      	cmp	x27, x2
    3fa4:      	b.gt	0x4170 <_stogir.vector.validate+0xae0>
    3fa8:      	lsl	x2, x1, #2
    3fac:      	ldr	x3, [x21, #0x50]
    3fb0:      	add	x2, x2, x3
    3fb4:      	ldr	w2, [x2]
    3fb8:      	sxtw	x2, w2
    3fbc:      	cmp	x2, #0x0
    3fc0:      	cset	w2, gt
    3fc4:      	ubfx	x2, x2, #0, #8
    3fc8:      	b	0x4174 <_stogir.vector.validate+0xae4>
    3fcc:      	uxtb	w16, w15
    3fd0:      	cmp	w16, wzr
    3fd4:      	b.eq	0x3cb8 <_stogir.vector.validate+0x628>
    3fd8:      	lsr	w23, w23, #0
    3fdc:      	mov	w0, w19
    3fe0:      	mov	w1, w23
    3fe4:      	bl	0x3fe4 <_stogir.vector.validate+0x954>
		0000000000003fe4:  ARM64_RELOC_BRANCH26	_stogir.types.size
    3fe8:      	lsr	w0, w0, #0
    3fec:      	sxtw	x0, w0
    3ff0:      	and	x0, x0, #0xffffffff
    3ff4:      	mov	x1, x0
    3ff8:      	movz	x0, #0x0, lsl #48
    3ffc:      	movz	x2, #0x0, lsl #48
    4000:      	b	0x3cc4 <_stogir.vector.validate+0x634>
    4004:      	movz	x2, #0x0, lsl #48
    4008:      	str	x3, [sp, #0x1d0]
    400c:      	b	0x4014 <_stogir.vector.validate+0x984>
    4010:      	movz	x2, #0x0, lsl #48
    4014:      	cmp	x2, #0x0
    4018:      	b.eq	0x4058 <_stogir.vector.validate+0x9c8>
    401c:      	uxtb	w16, w15
    4020:      	cmp	w16, wzr
    4024:      	b.eq	0x403c <_stogir.vector.validate+0x9ac>
    4028:      	lsl	x1, x26, #4
    402c:      	ldr	x2, [x21]
    4030:      	add	x1, x1, x2
    4034:      	ldr	x1, [x1]
    4038:      	b	0x404c <_stogir.vector.validate+0x9bc>
    403c:      	lsl	x1, x1, #4
    4040:      	ldr	x2, [x21, #0x28]
    4044:      	add	x1, x1, x2
    4048:      	ldr	x1, [x1]
    404c:      	mov	x2, x1
    4050:      	mov	x1, #0x1                ; =1
    4054:      	b	0x4060 <_stogir.vector.validate+0x9d0>
    4058:      	movz	x1, #0x0, lsl #48
    405c:      	movz	x2, #0x0, lsl #48
    4060:      	lsr	w1, w1, #0
    4064:      	lsr	x16, x1, #0
    4068:      	cmp	x16, #0x1
    406c:      	b.eq	0x4088 <_stogir.vector.validate+0x9f8>
    4070:      	b.lo	0x4078 <_stogir.vector.validate+0x9e8>
    4074:      	b	0x408c <_stogir.vector.validate+0x9fc>
    4078:      	cmp	x16, #0x0
    407c:      	b.eq	0x4084 <_stogir.vector.validate+0x9f4>
    4080:      	b	0x408c <_stogir.vector.validate+0x9fc>
    4084:      	b	0x4090 <_stogir.vector.validate+0xa00>
    4088:      	b	0x409c <_stogir.vector.validate+0xa0c>
    408c:      	b	0x41fc <_stogir.vector.validate+0xb6c>
    4090:      	ldr	x1, [sp, #0x1c8]
    4094:      	mov	x2, #0x18               ; =24
    4098:      	b	0x3d64 <_stogir.vector.validate+0x6d4>
    409c:      	lsr	w2, w2, #0
    40a0:      	ubfx	x1, x2, #8, #8
    40a4:      	cmp	x1, x20
    40a8:      	b.ne	0x3d5c <_stogir.vector.validate+0x6cc>
    40ac:      	ldr	x1, [sp, #0x1c0]
    40b0:      	mov	x2, x14
    40b4:      	b	0x3d64 <_stogir.vector.validate+0x6d4>
    40b8:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		00000000000040b8:  ARM64_RELOC_PAGE21	l_stogir.345
    40bc:      	ldr	x16, [x16]
		00000000000040bc:  ARM64_RELOC_PAGEOFF12	l_stogir.345
    40c0:      	orr	x0, x16, xzr
    40c4:      	mov	x26, x0
    40c8:      	mov	x27, #0x20              ; =32
    40cc:      	add	x16, sp, #0x40
    40d0:      	ldr	w0, [x16, #0x4]
    40d4:      	lsr	w0, w0, #0
    40d8:      	add	x8, sp, #0x170
    40dc:      	mov	w1, w0
    40e0:      	mov	x0, x21
    40e4:      	bl	0x40e4 <_stogir.vector.validate+0xa54>
		00000000000040e4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    40e8:      	add	x16, sp, #0x170
    40ec:      	ldr	w0, [x16]
    40f0:      	lsr	x16, x0, #0
    40f4:      	cmp	x16, #0x1
    40f8:      	b.eq	0x4114 <_stogir.vector.validate+0xa84>
    40fc:      	b.lo	0x4104 <_stogir.vector.validate+0xa74>
    4100:      	b	0x4118 <_stogir.vector.validate+0xa88>
    4104:      	cmp	x16, #0x0
    4108:      	b.eq	0x4110 <_stogir.vector.validate+0xa80>
    410c:      	b	0x4118 <_stogir.vector.validate+0xa88>
    4110:      	b	0x411c <_stogir.vector.validate+0xa8c>
    4114:      	b	0x4148 <_stogir.vector.validate+0xab8>
    4118:      	b	0x4204 <_stogir.vector.validate+0xb74>
    411c:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		000000000000411c:  ARM64_RELOC_PAGE21	l_stogir.346
    4120:      	ldr	x16, [x16]
		0000000000004120:  ARM64_RELOC_PAGEOFF12	l_stogir.346
    4124:      	orr	x0, x16, xzr
    4128:      	mov	x1, #0x19               ; =25
    412c:      	b	0x3cec <_stogir.vector.validate+0x65c>
    4130:      	movz	x2, #0x0, lsl #48
    4134:      	b	0x4014 <_stogir.vector.validate+0x984>
    4138:      	movz	x2, #0x0, lsl #48
    413c:      	b	0x4008 <_stogir.vector.validate+0x978>
    4140:      	movz	x15, #0x0, lsl #48
    4144:      	b	0x3d58 <_stogir.vector.validate+0x6c8>
    4148:      	add	x16, sp, #0x170
    414c:      	ldr	x0, [x16, #0x8]
    4150:      	add	x16, sp, #0x40
    4154:      	ldr	w1, [x16, #0x4]
    4158:      	sxtw	x1, w1
    415c:      	cmp	x1, #0x0
    4160:      	b.gt	0x41d8 <_stogir.vector.validate+0xb48>
    4164:      	mov	x1, x26
    4168:      	mov	x0, #0x1                ; =1
    416c:      	b	0x41bc <_stogir.vector.validate+0xb2c>
    4170:      	movz	x2, #0x0, lsl #48
    4174:      	b	0x4134 <_stogir.vector.validate+0xaa4>
    4178:      	add	x16, sp, #0x40
    417c:      	ldr	w0, [x16, #0x4]
    4180:      	sxtw	x0, w0
    4184:      	ldr	x1, [x21, #0x78]
    4188:      	lsl	x0, x0, #2
    418c:      	add	x0, x0, x1
    4190:      	ldr	w0, [x0]
    4194:      	sxtw	x0, w0
    4198:      	add	x0, x0, #0x1
    419c:      	lsr	w0, w0, #0
    41a0:      	sxtw	x0, w0
    41a4:      	cmp	x28, x0
    41a8:      	cset	w0, eq
    41ac:      	uxtb	w16, w0
    41b0:      	cmp	w16, wzr
    41b4:      	cset	x0, eq
    41b8:      	mov	x1, x26
    41bc:      	cmp	x0, #0x0
    41c0:      	b.eq	0x3ce4 <_stogir.vector.validate+0x654>
    41c4:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		00000000000041c4:  ARM64_RELOC_PAGE21	l_stogir.347
    41c8:      	ldr	x16, [x16]
		00000000000041c8:  ARM64_RELOC_PAGEOFF12	l_stogir.347
    41cc:      	orr	x0, x16, xzr
    41d0:      	mov	x1, #0x19               ; =25
    41d4:      	b	0x3cec <_stogir.vector.validate+0x65c>
    41d8:      	uxtb	w0, w0
    41dc:      	cmp	x0, #0x70
    41e0:      	b.eq	0x4178 <_stogir.vector.validate+0xae8>
    41e4:      	cmp	x0, #0x71
    41e8:      	b.eq	0x4178 <_stogir.vector.validate+0xae8>
    41ec:      	mov	x0, #0x1                ; =1
    41f0:      	b	0x41b8 <_stogir.vector.validate+0xb28>
    41f4:      	brk	#0
    41f8:      	b	0x41f4 <_stogir.vector.validate+0xb64>
    41fc:      	brk	#0
    4200:      	b	0x41fc <_stogir.vector.validate+0xb6c>
    4204:      	brk	#0
    4208:      	b	0x4204 <_stogir.vector.validate+0xb74>
    420c:      	str	x20, [sp, #0x1a8]
    4210:      	str	w19, [sp, #0x1a0]
    4214:      	b	0x384c <_stogir.vector.validate+0x1bc>
    4218:      	str	x20, [sp, #0x1a8]
    421c:      	str	w19, [sp, #0x1a0]
    4220:      	mov	w19, w0
    4224:      	mov	w20, w1
    4228:      	str	w2, [sp, #0x1b0]
    422c:      	str	w3, [sp, #0x1b8]
    4230:      	b	0x3908 <_stogir.vector.validate+0x278>
    4234:      	str	x1, [sp, #0x1c0]
    4238:      	b	0x3fcc <_stogir.vector.validate+0x93c>
    423c:      	str	x1, [sp, #0x1c0]
    4240:      	b	0x3fcc <_stogir.vector.validate+0x93c>
    4244:      	str	x2, [sp, #0x1c8]
    4248:      	b	0x3f84 <_stogir.vector.validate+0x8f4>
    424c:      	str	x2, [sp, #0x1c8]
    4250:      	b	0x4004 <_stogir.vector.validate+0x974>
    4254:      	str	x2, [sp, #0x1c8]
    4258:      	b	0x4138 <_stogir.vector.validate+0xaa8>
    425c:      	str	x3, [sp, #0x1d0]
    4260:      	b	0x4010 <_stogir.vector.validate+0x980>

0000000000004264 <_stogir.copy.validate>:
    4264:      	sub	sp, sp, #0x40
    4268:      	str	x29, [sp]
    426c:      	str	x30, [sp, #0x8]
    4270:      	mov	x29, sp
    4274:      	str	x19, [sp, #0x20]
    4278:      	str	x20, [sp, #0x28]
    427c:      	str	x21, [sp, #0x30]
    4280:      	sxtw	x1, w1
    4284:      	lsl	x2, x1, #2
    4288:      	cmp	x1, #0x0
    428c:      	cset	w3, gt
    4290:      	movz	x16, #0x0, lsl #48
    4294:      	sub	x4, x16, x1
    4298:      	sub	x5, x4, #0x1
    429c:      	uxtb	w16, w3
    42a0:      	cmp	w16, wzr
    42a4:      	b.eq	0x42e4 <_stogir.copy.validate+0x80>
    42a8:      	ldr	x4, [x0, #0x8]
    42ac:      	cmp	x1, x4
    42b0:      	b.ge	0x4338 <_stogir.copy.validate+0xd4>
    42b4:      	add	x4, x0, #0x78
    42b8:      	ldr	x4, [x4, #0x8]
    42bc:      	cmp	x1, x4
    42c0:      	b.ge	0x4464 <_stogir.copy.validate+0x200>
    42c4:      	ldr	x4, [x0, #0x78]
    42c8:      	add	x4, x2, x4
    42cc:      	ldr	w4, [x4]
    42d0:      	sxtw	x4, w4
    42d4:      	cmp	x4, #0x0
    42d8:      	cset	w4, ge
    42dc:      	ubfx	x4, x4, #0, #8
    42e0:      	b	0x4468 <_stogir.copy.validate+0x204>
    42e4:      	cmp	x1, #0x0
    42e8:      	b.ge	0x4340 <_stogir.copy.validate+0xdc>
    42ec:      	add	x6, x0, #0x28
    42f0:      	add	x7, x0, #0x50
    42f4:      	ldr	x6, [x6, #0x8]
    42f8:      	ldr	x7, [x7, #0x8]
    42fc:      	cmp	x6, x7
    4300:      	b.ne	0x4330 <_stogir.copy.validate+0xcc>
    4304:      	cmp	x4, x6
    4308:      	b.gt	0x44ac <_stogir.copy.validate+0x248>
    430c:      	lsl	x4, x5, #2
    4310:      	ldr	x6, [x0, #0x50]
    4314:      	add	x4, x4, x6
    4318:      	ldr	w4, [x4]
    431c:      	sxtw	x4, w4
    4320:      	cmp	x4, #0x0
    4324:      	cset	w4, gt
    4328:      	ubfx	x4, x4, #0, #8
    432c:      	b	0x44b0 <_stogir.copy.validate+0x24c>
    4330:      	movz	x4, #0x0, lsl #48
    4334:      	b	0x4344 <_stogir.copy.validate+0xe0>
    4338:      	movz	x4, #0x0, lsl #48
    433c:      	b	0x4344 <_stogir.copy.validate+0xe0>
    4340:      	movz	x4, #0x0, lsl #48
    4344:      	cmp	x4, #0x0
    4348:      	b.eq	0x43ac <_stogir.copy.validate+0x148>
    434c:      	uxtb	w16, w3
    4350:      	cmp	w16, wzr
    4354:      	b.eq	0x437c <_stogir.copy.validate+0x118>
    4358:      	lsl	x3, x1, #4
    435c:      	ldr	x4, [x0]
    4360:      	add	x3, x3, x4
    4364:      	ldr	x4, [x3]
    4368:      	ldr	x3, [x3, #0x8]
    436c:      	fmov	d31, x3
    4370:      	mov	x3, x4
    4374:      	fmov	x4, d31
    4378:      	b	0x439c <_stogir.copy.validate+0x138>
    437c:      	lsl	x3, x5, #4
    4380:      	ldr	x4, [x0, #0x28]
    4384:      	add	x3, x3, x4
    4388:      	ldr	x4, [x3]
    438c:      	ldr	x3, [x3, #0x8]
    4390:      	fmov	d31, x3
    4394:      	mov	x3, x4
    4398:      	fmov	x4, d31
    439c:      	mov	x5, x4
    43a0:      	mov	x4, x3
    43a4:      	mov	x3, #0x1                ; =1
    43a8:      	b	0x43b8 <_stogir.copy.validate+0x154>
    43ac:      	movz	x3, #0x0, lsl #48
    43b0:      	movz	x4, #0x0, lsl #48
    43b4:      	movz	x5, #0x0, lsl #48
    43b8:      	lsr	w3, w3, #0
    43bc:      	lsr	x16, x3, #0
    43c0:      	cmp	x16, #0x1
    43c4:      	b.eq	0x43e0 <_stogir.copy.validate+0x17c>
    43c8:      	b.lo	0x43d0 <_stogir.copy.validate+0x16c>
    43cc:      	b	0x43e4 <_stogir.copy.validate+0x180>
    43d0:      	cmp	x16, #0x0
    43d4:      	b.eq	0x43dc <_stogir.copy.validate+0x178>
    43d8:      	b	0x43e4 <_stogir.copy.validate+0x180>
    43dc:      	b	0x43e8 <_stogir.copy.validate+0x184>
    43e0:      	b	0x442c <_stogir.copy.validate+0x1c8>
    43e4:      	b	0x453c <_stogir.copy.validate+0x2d8>
    43e8:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		00000000000043e8:  ARM64_RELOC_PAGE21	l_stogir.348
    43ec:      	ldr	x16, [x16]
		00000000000043ec:  ARM64_RELOC_PAGEOFF12	l_stogir.348
    43f0:      	orr	x0, x16, xzr
    43f4:      	mov	x20, x8
    43f8:      	mov	x1, x0
    43fc:      	mov	x0, #0x1                ; =1
    4400:      	mov	x2, #0x18               ; =24
    4404:      	str	x0, [x20]
    4408:      	str	x1, [x20, #0x8]
    440c:      	str	x2, [x20, #0x10]
    4410:      	ldr	x19, [sp, #0x20]
    4414:      	ldr	x20, [sp, #0x28]
    4418:      	ldr	x21, [sp, #0x30]
    441c:      	ldr	x29, [sp]
    4420:      	ldr	x30, [sp, #0x8]
    4424:      	add	sp, sp, #0x40
    4428:      	ret
    442c:      	add	x16, sp, #0x10
    4430:      	str	x4, [x16]
    4434:      	add	x16, sp, #0x10
    4438:      	str	x5, [x16, #0x8]
    443c:      	cmp	x1, #0x0
    4440:      	b.gt	0x446c <_stogir.copy.validate+0x208>
    4444:      	mov	x20, x8
    4448:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		0000000000004448:  ARM64_RELOC_PAGE21	l_stogir.349
    444c:      	ldr	x16, [x16]
		000000000000444c:  ARM64_RELOC_PAGEOFF12	l_stogir.349
    4450:      	orr	x0, x16, xzr
    4454:      	mov	x1, x0
    4458:      	mov	x0, #0x1                ; =1
    445c:      	mov	x2, #0x21               ; =33
    4460:      	b	0x4404 <_stogir.copy.validate+0x1a0>
    4464:      	movz	x4, #0x0, lsl #48
    4468:      	b	0x433c <_stogir.copy.validate+0xd8>
    446c:      	uxtb	w1, w4
    4470:      	cmp	x1, #0x44
    4474:      	b.ne	0x46a0 <_stogir.copy.validate+0x43c>
    4478:      	ldr	x1, [x0, #0x78]
    447c:      	add	x1, x2, x1
    4480:      	ldr	w1, [x1]
    4484:      	sxtw	x1, w1
    4488:      	cmp	x1, #0x2
    448c:      	b.ne	0x46a8 <_stogir.copy.validate+0x444>
    4490:      	lsr	w4, w4, #0
    4494:      	ubfx	x1, x4, #8, #8
    4498:      	orr	x19, x1, xzr
    449c:      	cmp	x19, #0x0
    44a0:      	b.ne	0x44b4 <_stogir.copy.validate+0x250>
    44a4:      	mov	x20, x8
    44a8:      	b	0x4448 <_stogir.copy.validate+0x1e4>
    44ac:      	movz	x4, #0x0, lsl #48
    44b0:      	b	0x4334 <_stogir.copy.validate+0xd0>
    44b4:      	lsr	w1, w1, #0
    44b8:      	mov	x20, x8
    44bc:      	mov	x21, x0
    44c0:      	mov	w0, w1
    44c4:      	bl	0x44c4 <_stogir.copy.validate+0x260>
		00000000000044c4:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    44c8:      	cmp	x0, #0x0
    44cc:      	b.eq	0x4448 <_stogir.copy.validate+0x1e4>
    44d0:      	add	x16, sp, #0x10
    44d4:      	ldr	w0, [x16, #0x4]
    44d8:      	sxtw	x0, w0
    44dc:      	cmp	x0, #0x0
    44e0:      	cset	w1, gt
    44e4:      	movz	x16, #0x0, lsl #48
    44e8:      	sub	x2, x16, x0
    44ec:      	sub	x3, x2, #0x1
    44f0:      	uxtb	w16, w1
    44f4:      	cmp	w16, wzr
    44f8:      	b.eq	0x4560 <_stogir.copy.validate+0x2fc>
    44fc:      	ldr	x2, [x21, #0x8]
    4500:      	cmp	x0, x2
    4504:      	b.ge	0x45ac <_stogir.copy.validate+0x348>
    4508:      	add	x2, x21, #0x78
    450c:      	ldr	x2, [x2, #0x8]
    4510:      	cmp	x0, x2
    4514:      	b.ge	0x4688 <_stogir.copy.validate+0x424>
    4518:      	lsl	x2, x0, #2
    451c:      	ldr	x4, [x21, #0x78]
    4520:      	add	x2, x2, x4
    4524:      	ldr	w2, [x2]
    4528:      	sxtw	x2, w2
    452c:      	cmp	x2, #0x0
    4530:      	cset	w2, ge
    4534:      	ubfx	x2, x2, #0, #8
    4538:      	b	0x468c <_stogir.copy.validate+0x428>
    453c:      	brk	#0
    4540:      	b	0x453c <_stogir.copy.validate+0x2d8>
    4544:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		0000000000004544:  ARM64_RELOC_PAGE21	l_stogir.350
    4548:      	ldr	x16, [x16]
		0000000000004548:  ARM64_RELOC_PAGEOFF12	l_stogir.350
    454c:      	orr	x0, x16, xzr
    4550:      	mov	x1, x0
    4554:      	mov	x0, #0x1                ; =1
    4558:      	mov	x2, #0x20               ; =32
    455c:      	b	0x4460 <_stogir.copy.validate+0x1fc>
    4560:      	cmp	x0, #0x0
    4564:      	b.ge	0x45b4 <_stogir.copy.validate+0x350>
    4568:      	add	x4, x21, #0x28
    456c:      	add	x5, x21, #0x50
    4570:      	ldr	x4, [x4, #0x8]
    4574:      	ldr	x5, [x5, #0x8]
    4578:      	cmp	x4, x5
    457c:      	b.ne	0x4680 <_stogir.copy.validate+0x41c>
    4580:      	cmp	x2, x4
    4584:      	b.gt	0x4690 <_stogir.copy.validate+0x42c>
    4588:      	lsl	x2, x3, #2
    458c:      	ldr	x4, [x21, #0x50]
    4590:      	add	x2, x2, x4
    4594:      	ldr	w2, [x2]
    4598:      	sxtw	x2, w2
    459c:      	cmp	x2, #0x0
    45a0:      	cset	w2, gt
    45a4:      	ubfx	x2, x2, #0, #8
    45a8:      	b	0x4694 <_stogir.copy.validate+0x430>
    45ac:      	movz	x2, #0x0, lsl #48
    45b0:      	b	0x45b8 <_stogir.copy.validate+0x354>
    45b4:      	movz	x2, #0x0, lsl #48
    45b8:      	cmp	x2, #0x0
    45bc:      	b.eq	0x45fc <_stogir.copy.validate+0x398>
    45c0:      	uxtb	w16, w1
    45c4:      	cmp	w16, wzr
    45c8:      	b.eq	0x45e0 <_stogir.copy.validate+0x37c>
    45cc:      	lsl	x0, x0, #4
    45d0:      	ldr	x1, [x21]
    45d4:      	add	x0, x0, x1
    45d8:      	ldr	x0, [x0]
    45dc:      	b	0x45f0 <_stogir.copy.validate+0x38c>
    45e0:      	lsl	x0, x3, #4
    45e4:      	ldr	x1, [x21, #0x28]
    45e8:      	add	x0, x0, x1
    45ec:      	ldr	x0, [x0]
    45f0:      	mov	x1, x0
    45f4:      	mov	x0, #0x1                ; =1
    45f8:      	b	0x4604 <_stogir.copy.validate+0x3a0>
    45fc:      	movz	x0, #0x0, lsl #48
    4600:      	movz	x1, #0x0, lsl #48
    4604:      	lsr	w0, w0, #0
    4608:      	lsr	x16, x0, #0
    460c:      	cmp	x16, #0x1
    4610:      	b.eq	0x462c <_stogir.copy.validate+0x3c8>
    4614:      	b.lo	0x461c <_stogir.copy.validate+0x3b8>
    4618:      	b	0x4630 <_stogir.copy.validate+0x3cc>
    461c:      	cmp	x16, #0x0
    4620:      	b.eq	0x4628 <_stogir.copy.validate+0x3c4>
    4624:      	b	0x4630 <_stogir.copy.validate+0x3cc>
    4628:      	b	0x4634 <_stogir.copy.validate+0x3d0>
    462c:      	b	0x4650 <_stogir.copy.validate+0x3ec>
    4630:      	b	0x4698 <_stogir.copy.validate+0x434>
    4634:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		0000000000004634:  ARM64_RELOC_PAGE21	l_stogir.351
    4638:      	ldr	x16, [x16]
		0000000000004638:  ARM64_RELOC_PAGEOFF12	l_stogir.351
    463c:      	orr	x0, x16, xzr
    4640:      	mov	x1, x0
    4644:      	mov	x0, #0x1                ; =1
    4648:      	mov	x2, #0x13               ; =19
    464c:      	b	0x455c <_stogir.copy.validate+0x2f8>
    4650:      	lsr	w1, w1, #0
    4654:      	add	x16, sp, #0x10
    4658:      	ldr	w0, [x16]
    465c:      	ubfx	x1, x1, #8, #8
    4660:      	ubfx	x0, x0, #8, #8
    4664:      	cmp	x1, x0
    4668:      	b.ne	0x4544 <_stogir.copy.validate+0x2e0>
    466c:      	and	x0, x19, #0xffffffff
    4670:      	mov	x1, x0
    4674:      	movz	x0, #0x0, lsl #48
    4678:      	movz	x2, #0x0, lsl #48
    467c:      	b	0x455c <_stogir.copy.validate+0x2f8>
    4680:      	movz	x2, #0x0, lsl #48
    4684:      	b	0x45b8 <_stogir.copy.validate+0x354>
    4688:      	movz	x2, #0x0, lsl #48
    468c:      	b	0x45b0 <_stogir.copy.validate+0x34c>
    4690:      	movz	x2, #0x0, lsl #48
    4694:      	b	0x4684 <_stogir.copy.validate+0x420>
    4698:      	brk	#0
    469c:      	b	0x4698 <_stogir.copy.validate+0x434>
    46a0:      	mov	x20, x8
    46a4:      	b	0x4448 <_stogir.copy.validate+0x1e4>
    46a8:      	mov	x20, x8
    46ac:      	b	0x4448 <_stogir.copy.validate+0x1e4>

00000000000046b0 <_stogir.graph.lookup>:
    46b0:      	sxtw	x1, w1
    46b4:      	cmp	x1, #0x0
    46b8:      	cset	w2, gt
    46bc:      	movz	x16, #0x0, lsl #48
    46c0:      	sub	x3, x16, x1
    46c4:      	sub	x4, x3, #0x1
    46c8:      	uxtb	w16, w2
    46cc:      	cmp	w16, wzr
    46d0:      	b.eq	0x4714 <_stogir.graph.lookup+0x64>
    46d4:      	ldr	x3, [x0, #0x8]
    46d8:      	cmp	x1, x3
    46dc:      	b.ge	0x4768 <_stogir.graph.lookup+0xb8>
    46e0:      	add	x3, x0, #0x78
    46e4:      	ldr	x3, [x3, #0x8]
    46e8:      	cmp	x1, x3
    46ec:      	b.ge	0x4808 <_stogir.graph.lookup+0x158>
    46f0:      	lsl	x3, x1, #2
    46f4:      	ldr	x5, [x0, #0x78]
    46f8:      	add	x3, x3, x5
    46fc:      	ldr	w3, [x3]
    4700:      	sxtw	x3, w3
    4704:      	cmp	x3, #0x0
    4708:      	cset	w3, ge
    470c:      	ubfx	x3, x3, #0, #8
    4710:      	b	0x480c <_stogir.graph.lookup+0x15c>
    4714:      	cmp	x1, #0x0
    4718:      	b.ge	0x4770 <_stogir.graph.lookup+0xc0>
    471c:      	add	x5, x0, #0x28
    4720:      	add	x6, x0, #0x50
    4724:      	ldr	x5, [x5, #0x8]
    4728:      	ldr	x6, [x6, #0x8]
    472c:      	cmp	x5, x6
    4730:      	b.ne	0x4760 <_stogir.graph.lookup+0xb0>
    4734:      	cmp	x3, x5
    4738:      	b.gt	0x4810 <_stogir.graph.lookup+0x160>
    473c:      	lsl	x3, x4, #2
    4740:      	ldr	x5, [x0, #0x50]
    4744:      	add	x3, x3, x5
    4748:      	ldr	w3, [x3]
    474c:      	sxtw	x3, w3
    4750:      	cmp	x3, #0x0
    4754:      	cset	w3, gt
    4758:      	ubfx	x3, x3, #0, #8
    475c:      	b	0x4814 <_stogir.graph.lookup+0x164>
    4760:      	movz	x3, #0x0, lsl #48
    4764:      	b	0x4774 <_stogir.graph.lookup+0xc4>
    4768:      	movz	x3, #0x0, lsl #48
    476c:      	b	0x4774 <_stogir.graph.lookup+0xc4>
    4770:      	movz	x3, #0x0, lsl #48
    4774:      	cmp	x3, #0x0
    4778:      	b.eq	0x47dc <_stogir.graph.lookup+0x12c>
    477c:      	uxtb	w16, w2
    4780:      	cmp	w16, wzr
    4784:      	b.eq	0x47ac <_stogir.graph.lookup+0xfc>
    4788:      	lsl	x1, x1, #4
    478c:      	ldr	x0, [x0]
    4790:      	add	x0, x1, x0
    4794:      	ldr	x1, [x0]
    4798:      	ldr	x0, [x0, #0x8]
    479c:      	fmov	d31, x0
    47a0:      	mov	x0, x1
    47a4:      	fmov	x1, d31
    47a8:      	b	0x47cc <_stogir.graph.lookup+0x11c>
    47ac:      	lsl	x1, x4, #4
    47b0:      	ldr	x0, [x0, #0x28]
    47b4:      	add	x0, x1, x0
    47b8:      	ldr	x1, [x0]
    47bc:      	ldr	x0, [x0, #0x8]
    47c0:      	fmov	d31, x0
    47c4:      	mov	x0, x1
    47c8:      	fmov	x1, d31
    47cc:      	mov	x2, x1
    47d0:      	mov	x1, x0
    47d4:      	mov	x0, #0x1                ; =1
    47d8:      	b	0x47e8 <_stogir.graph.lookup+0x138>
    47dc:      	movz	x0, #0x0, lsl #48
    47e0:      	movz	x1, #0x0, lsl #48
    47e4:      	movz	x2, #0x0, lsl #48
    47e8:      	str	x0, [x8]
    47ec:      	str	x1, [x8, #0x8]
    47f0:      	str	x2, [x8, #0x10]
    47f4:      	movz	x17, #0x0, lsl #48
    47f8:      	str	x17, [x8, #0x18]
    47fc:      	movz	x17, #0x0, lsl #48
    4800:      	str	x17, [x8, #0x20]
    4804:      	ret
    4808:      	movz	x3, #0x0, lsl #48
    480c:      	b	0x476c <_stogir.graph.lookup+0xbc>
    4810:      	movz	x3, #0x0, lsl #48
    4814:      	b	0x4764 <_stogir.graph.lookup+0xb4>

0000000000004818 <_stogir.opcode.block-start?>:
    4818:      	sxtw	x0, w0
    481c:      	cmp	x0, #0x0
    4820:      	b.lt	0x4848 <_stogir.opcode.block-start?+0x30>
    4824:      	cmp	x0, #0x83
    4828:      	b.ge	0x4848 <_stogir.opcode.block-start?+0x30>
    482c:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		000000000000482c:  ARM64_RELOC_PAGE21	l_stogir.352
    4830:      	ldr	x16, [x16]
		0000000000004830:  ARM64_RELOC_PAGEOFF12	l_stogir.352
    4834:      	orr	x1, x16, xzr
    4838:      	lsr	x0, x0, #0
    483c:      	add	x0, x0, x1
    4840:      	ldrb	w0, [x0]
    4844:      	b	0x484c <_stogir.opcode.block-start?+0x34>
    4848:      	movz	x0, #0x0, lsl #48
    484c:      	uxtb	w0, w0
    4850:      	and	x0, x0, #0x2
    4854:      	uxtb	w0, w0
    4858:      	cmp	x0, #0x0
    485c:      	cset	w0, eq
    4860:      	uxtb	w16, w0
    4864:      	cmp	w16, wzr
    4868:      	cset	x0, eq
    486c:      	ret

0000000000004870 <_stogir.checked.operation?>:
    4870:      	sxtw	x0, w0
    4874:      	cmp	x0, #0x29
    4878:      	b.lt	0x488c <_stogir.checked.operation?+0x1c>
    487c:      	cmp	x0, #0x2b
    4880:      	cset	w0, le
    4884:      	ubfx	x0, x0, #0, #8
    4888:      	b	0x4890 <_stogir.checked.operation?+0x20>
    488c:      	movz	x0, #0x0, lsl #48
    4890:      	ret

0000000000004894 <_stogir.checked.validate-projection>:
    4894:      	sub	sp, sp, #0x40
    4898:      	str	x29, [sp]
    489c:      	str	x30, [sp, #0x8]
    48a0:      	mov	x29, sp
    48a4:      	str	x19, [sp, #0x30]
    48a8:      	sxtw	x1, w1
    48ac:      	lsl	x2, x1, #2
    48b0:      	cmp	x1, #0x0
    48b4:      	cset	w3, gt
    48b8:      	movz	x16, #0x0, lsl #48
    48bc:      	sub	x4, x16, x1
    48c0:      	sub	x5, x4, #0x1
    48c4:      	uxtb	w16, w3
    48c8:      	cmp	w16, wzr
    48cc:      	b.eq	0x490c <_stogir.checked.validate-projection+0x78>
    48d0:      	ldr	x4, [x0, #0x8]
    48d4:      	cmp	x1, x4
    48d8:      	b.ge	0x4960 <_stogir.checked.validate-projection+0xcc>
    48dc:      	add	x4, x0, #0x78
    48e0:      	ldr	x4, [x4, #0x8]
    48e4:      	cmp	x1, x4
    48e8:      	b.ge	0x4a4c <_stogir.checked.validate-projection+0x1b8>
    48ec:      	ldr	x4, [x0, #0x78]
    48f0:      	add	x4, x2, x4
    48f4:      	ldr	w4, [x4]
    48f8:      	sxtw	x4, w4
    48fc:      	cmp	x4, #0x0
    4900:      	cset	w4, ge
    4904:      	ubfx	x4, x4, #0, #8
    4908:      	b	0x4a50 <_stogir.checked.validate-projection+0x1bc>
    490c:      	cmp	x1, #0x0
    4910:      	b.ge	0x4968 <_stogir.checked.validate-projection+0xd4>
    4914:      	add	x6, x0, #0x28
    4918:      	add	x7, x0, #0x50
    491c:      	ldr	x6, [x6, #0x8]
    4920:      	ldr	x7, [x7, #0x8]
    4924:      	cmp	x6, x7
    4928:      	b.ne	0x4958 <_stogir.checked.validate-projection+0xc4>
    492c:      	cmp	x4, x6
    4930:      	b.gt	0x4ab8 <_stogir.checked.validate-projection+0x224>
    4934:      	lsl	x4, x5, #2
    4938:      	ldr	x6, [x0, #0x50]
    493c:      	add	x4, x4, x6
    4940:      	ldr	w4, [x4]
    4944:      	sxtw	x4, w4
    4948:      	cmp	x4, #0x0
    494c:      	cset	w4, gt
    4950:      	ubfx	x4, x4, #0, #8
    4954:      	b	0x4abc <_stogir.checked.validate-projection+0x228>
    4958:      	movz	x4, #0x0, lsl #48
    495c:      	b	0x496c <_stogir.checked.validate-projection+0xd8>
    4960:      	movz	x4, #0x0, lsl #48
    4964:      	b	0x496c <_stogir.checked.validate-projection+0xd8>
    4968:      	movz	x4, #0x0, lsl #48
    496c:      	cmp	x4, #0x0
    4970:      	b.eq	0x49b0 <_stogir.checked.validate-projection+0x11c>
    4974:      	uxtb	w16, w3
    4978:      	cmp	w16, wzr
    497c:      	b.eq	0x4994 <_stogir.checked.validate-projection+0x100>
    4980:      	lsl	x3, x1, #4
    4984:      	ldr	x4, [x0]
    4988:      	add	x3, x3, x4
    498c:      	ldr	x3, [x3]
    4990:      	b	0x49a4 <_stogir.checked.validate-projection+0x110>
    4994:      	lsl	x3, x5, #4
    4998:      	ldr	x4, [x0, #0x28]
    499c:      	add	x3, x3, x4
    49a0:      	ldr	x3, [x3]
    49a4:      	mov	x4, x3
    49a8:      	mov	x3, #0x1                ; =1
    49ac:      	b	0x49b8 <_stogir.checked.validate-projection+0x124>
    49b0:      	movz	x3, #0x0, lsl #48
    49b4:      	movz	x4, #0x0, lsl #48
    49b8:      	lsr	w3, w3, #0
    49bc:      	lsr	x16, x3, #0
    49c0:      	cmp	x16, #0x1
    49c4:      	b.eq	0x49e0 <_stogir.checked.validate-projection+0x14c>
    49c8:      	b.lo	0x49d0 <_stogir.checked.validate-projection+0x13c>
    49cc:      	b	0x49e4 <_stogir.checked.validate-projection+0x150>
    49d0:      	cmp	x16, #0x0
    49d4:      	b.eq	0x49dc <_stogir.checked.validate-projection+0x148>
    49d8:      	b	0x49e4 <_stogir.checked.validate-projection+0x150>
    49dc:      	b	0x49e8 <_stogir.checked.validate-projection+0x154>
    49e0:      	b	0x4a08 <_stogir.checked.validate-projection+0x174>
    49e4:      	b	0x4ac0 <_stogir.checked.validate-projection+0x22c>
    49e8:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		00000000000049e8:  ARM64_RELOC_PAGE21	l_stogir.353
    49ec:      	ldr	x16, [x16]
		00000000000049ec:  ARM64_RELOC_PAGEOFF12	l_stogir.353
    49f0:      	orr	x0, x16, xzr
    49f4:      	mov	x19, x8
    49f8:      	mov	x1, x0
    49fc:      	mov	x0, #0x1                ; =1
    4a00:      	mov	x2, #0x10               ; =16
    4a04:      	b	0x4a2c <_stogir.checked.validate-projection+0x198>
    4a08:      	cmp	x1, #0x0
    4a0c:      	b.gt	0x4a54 <_stogir.checked.validate-projection+0x1c0>
    4a10:      	mov	x19, x8
    4a14:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		0000000000004a14:  ARM64_RELOC_PAGE21	l_stogir.354
    4a18:      	ldr	x16, [x16]
		0000000000004a18:  ARM64_RELOC_PAGEOFF12	l_stogir.354
    4a1c:      	orr	x0, x16, xzr
    4a20:      	mov	x1, x0
    4a24:      	mov	x0, #0x1                ; =1
    4a28:      	mov	x2, #0x1c               ; =28
    4a2c:      	str	x0, [x19]
    4a30:      	str	x1, [x19, #0x8]
    4a34:      	str	x2, [x19, #0x10]
    4a38:      	ldr	x19, [sp, #0x30]
    4a3c:      	ldr	x29, [sp]
    4a40:      	ldr	x30, [sp, #0x8]
    4a44:      	add	sp, sp, #0x40
    4a48:      	ret
    4a4c:      	movz	x4, #0x0, lsl #48
    4a50:      	b	0x4964 <_stogir.checked.validate-projection+0xd0>
    4a54:      	uxtb	w1, w4
    4a58:      	cmp	x1, #0x2c
    4a5c:      	b.ne	0x4ac8 <_stogir.checked.validate-projection+0x234>
    4a60:      	lsr	w1, w4, #0
    4a64:      	ubfx	x1, x1, #8, #8
    4a68:      	cmp	x1, #0x1
    4a6c:      	b.ne	0x4ad0 <_stogir.checked.validate-projection+0x23c>
    4a70:      	ldr	x1, [x0, #0x78]
    4a74:      	add	x1, x2, x1
    4a78:      	ldr	w1, [x1]
    4a7c:      	sxtw	x1, w1
    4a80:      	cmp	x1, #0x1
    4a84:      	b.ne	0x4ad8 <_stogir.checked.validate-projection+0x244>
    4a88:      	lsr	x1, x4, #32
    4a8c:      	lsr	w1, w1, #0
    4a90:      	mov	x19, x8
    4a94:      	add	x8, sp, #0x10
    4a98:      	bl	0x4a98 <_stogir.checked.validate-projection+0x204>
		0000000000004a98:  ARM64_RELOC_BRANCH26	_stogir.checked.projection
    4a9c:      	add	x16, sp, #0x10
    4aa0:      	ldr	x0, [x16]
    4aa4:      	add	x16, sp, #0x10
    4aa8:      	ldr	x1, [x16, #0x8]
    4aac:      	add	x16, sp, #0x10
    4ab0:      	ldr	x2, [x16, #0x10]
    4ab4:      	b	0x4a2c <_stogir.checked.validate-projection+0x198>
    4ab8:      	movz	x4, #0x0, lsl #48
    4abc:      	b	0x495c <_stogir.checked.validate-projection+0xc8>
    4ac0:      	brk	#0
    4ac4:      	b	0x4ac0 <_stogir.checked.validate-projection+0x22c>
    4ac8:      	mov	x19, x8
    4acc:      	b	0x4a14 <_stogir.checked.validate-projection+0x180>
    4ad0:      	mov	x19, x8
    4ad4:      	b	0x4a14 <_stogir.checked.validate-projection+0x180>
    4ad8:      	mov	x19, x8
    4adc:      	b	0x4a14 <_stogir.checked.validate-projection+0x180>

0000000000004ae0 <_stogir.checked.validate>:
    4ae0:      	sub	sp, sp, #0x40
    4ae4:      	str	x29, [sp]
    4ae8:      	str	x30, [sp, #0x8]
    4aec:      	mov	x29, sp
    4af0:      	str	x19, [sp, #0x10]
    4af4:      	str	x20, [sp, #0x18]
    4af8:      	str	x21, [sp, #0x20]
    4afc:      	str	x22, [sp, #0x28]
    4b00:      	str	x23, [sp, #0x30]
    4b04:      	sxtw	x1, w1
    4b08:      	lsl	x2, x1, #2
    4b0c:      	cmp	x1, #0x0
    4b10:      	cset	w3, gt
    4b14:      	movz	x16, #0x0, lsl #48
    4b18:      	sub	x4, x16, x1
    4b1c:      	sub	x5, x4, #0x1
    4b20:      	uxtb	w16, w3
    4b24:      	cmp	w16, wzr
    4b28:      	b.eq	0x4b68 <_stogir.checked.validate+0x88>
    4b2c:      	ldr	x4, [x0, #0x8]
    4b30:      	cmp	x1, x4
    4b34:      	b.ge	0x4bbc <_stogir.checked.validate+0xdc>
    4b38:      	add	x4, x0, #0x78
    4b3c:      	ldr	x4, [x4, #0x8]
    4b40:      	cmp	x1, x4
    4b44:      	b.ge	0x4ce4 <_stogir.checked.validate+0x204>
    4b48:      	ldr	x4, [x0, #0x78]
    4b4c:      	add	x4, x2, x4
    4b50:      	ldr	w4, [x4]
    4b54:      	sxtw	x4, w4
    4b58:      	cmp	x4, #0x0
    4b5c:      	cset	w4, ge
    4b60:      	ubfx	x4, x4, #0, #8
    4b64:      	b	0x4ce8 <_stogir.checked.validate+0x208>
    4b68:      	cmp	x1, #0x0
    4b6c:      	b.ge	0x4bc4 <_stogir.checked.validate+0xe4>
    4b70:      	add	x6, x0, #0x28
    4b74:      	add	x7, x0, #0x50
    4b78:      	ldr	x6, [x6, #0x8]
    4b7c:      	ldr	x7, [x7, #0x8]
    4b80:      	cmp	x6, x7
    4b84:      	b.ne	0x4bb4 <_stogir.checked.validate+0xd4>
    4b88:      	cmp	x4, x6
    4b8c:      	b.gt	0x4d98 <_stogir.checked.validate+0x2b8>
    4b90:      	lsl	x4, x5, #2
    4b94:      	ldr	x6, [x0, #0x50]
    4b98:      	add	x4, x4, x6
    4b9c:      	ldr	w4, [x4]
    4ba0:      	sxtw	x4, w4
    4ba4:      	cmp	x4, #0x0
    4ba8:      	cset	w4, gt
    4bac:      	ubfx	x4, x4, #0, #8
    4bb0:      	b	0x4d9c <_stogir.checked.validate+0x2bc>
    4bb4:      	movz	x4, #0x0, lsl #48
    4bb8:      	b	0x4bc8 <_stogir.checked.validate+0xe8>
    4bbc:      	movz	x4, #0x0, lsl #48
    4bc0:      	b	0x4bc8 <_stogir.checked.validate+0xe8>
    4bc4:      	movz	x4, #0x0, lsl #48
    4bc8:      	cmp	x4, #0x0
    4bcc:      	b.eq	0x4c30 <_stogir.checked.validate+0x150>
    4bd0:      	uxtb	w16, w3
    4bd4:      	cmp	w16, wzr
    4bd8:      	b.eq	0x4c00 <_stogir.checked.validate+0x120>
    4bdc:      	lsl	x3, x1, #4
    4be0:      	ldr	x4, [x0]
    4be4:      	add	x3, x3, x4
    4be8:      	ldr	x4, [x3]
    4bec:      	ldr	x3, [x3, #0x8]
    4bf0:      	fmov	d31, x3
    4bf4:      	mov	x3, x4
    4bf8:      	fmov	x4, d31
    4bfc:      	b	0x4c20 <_stogir.checked.validate+0x140>
    4c00:      	lsl	x3, x5, #4
    4c04:      	ldr	x4, [x0, #0x28]
    4c08:      	add	x3, x3, x4
    4c0c:      	ldr	x4, [x3]
    4c10:      	ldr	x3, [x3, #0x8]
    4c14:      	fmov	d31, x3
    4c18:      	mov	x3, x4
    4c1c:      	fmov	x4, d31
    4c20:      	mov	x5, x4
    4c24:      	mov	x4, x3
    4c28:      	mov	x3, #0x1                ; =1
    4c2c:      	b	0x4c3c <_stogir.checked.validate+0x15c>
    4c30:      	movz	x3, #0x0, lsl #48
    4c34:      	movz	x4, #0x0, lsl #48
    4c38:      	movz	x5, #0x0, lsl #48
    4c3c:      	lsr	w3, w3, #0
    4c40:      	lsr	x16, x3, #0
    4c44:      	cmp	x16, #0x1
    4c48:      	b.eq	0x4c64 <_stogir.checked.validate+0x184>
    4c4c:      	b.lo	0x4c54 <_stogir.checked.validate+0x174>
    4c50:      	b	0x4c68 <_stogir.checked.validate+0x188>
    4c54:      	cmp	x16, #0x0
    4c58:      	b.eq	0x4c60 <_stogir.checked.validate+0x180>
    4c5c:      	b	0x4c68 <_stogir.checked.validate+0x188>
    4c60:      	b	0x4c6c <_stogir.checked.validate+0x18c>
    4c64:      	b	0x4c8c <_stogir.checked.validate+0x1ac>
    4c68:      	b	0x5054 <_stogir.checked.validate+0x574>
    4c6c:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		0000000000004c6c:  ARM64_RELOC_PAGE21	l_stogir.355
    4c70:      	ldr	x16, [x16]
		0000000000004c70:  ARM64_RELOC_PAGEOFF12	l_stogir.355
    4c74:      	orr	x0, x16, xzr
    4c78:      	mov	x23, x8
    4c7c:      	mov	x1, x0
    4c80:      	mov	x0, #0x1                ; =1
    4c84:      	mov	x2, #0x1a               ; =26
    4c88:      	b	0x4cb0 <_stogir.checked.validate+0x1d0>
    4c8c:      	cmp	x1, #0x0
    4c90:      	b.gt	0x4cec <_stogir.checked.validate+0x20c>
    4c94:      	mov	x23, x8
    4c98:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		0000000000004c98:  ARM64_RELOC_PAGE21	l_stogir.356
    4c9c:      	ldr	x16, [x16]
		0000000000004c9c:  ARM64_RELOC_PAGEOFF12	l_stogir.356
    4ca0:      	orr	x0, x16, xzr
    4ca4:      	mov	x1, x0
    4ca8:      	mov	x0, #0x1                ; =1
    4cac:      	mov	x2, #0x26               ; =38
    4cb0:      	str	x0, [x23]
    4cb4:      	str	x1, [x23, #0x8]
    4cb8:      	str	x2, [x23, #0x10]
    4cbc:      	sub	sp, x29, #0x0
    4cc0:      	ldr	x19, [sp, #0x10]
    4cc4:      	ldr	x20, [sp, #0x18]
    4cc8:      	ldr	x21, [sp, #0x20]
    4ccc:      	ldr	x22, [sp, #0x28]
    4cd0:      	ldr	x23, [sp, #0x30]
    4cd4:      	ldr	x29, [sp]
    4cd8:      	ldr	x30, [sp, #0x8]
    4cdc:      	add	sp, sp, #0x40
    4ce0:      	ret
    4ce4:      	movz	x4, #0x0, lsl #48
    4ce8:      	b	0x4bc0 <_stogir.checked.validate+0xe0>
    4cec:      	uxtb	w1, w4
    4cf0:      	cmp	x1, #0x29
    4cf4:      	cset	w3, ge
    4cf8:      	uxtb	w16, w3
    4cfc:      	cmp	w16, wzr
    4d00:      	b.eq	0x5074 <_stogir.checked.validate+0x594>
    4d04:      	cmp	x1, #0x2b
    4d08:      	cset	w1, le
    4d0c:      	uxtb	w16, w1
    4d10:      	cmp	w16, wzr
    4d14:      	b.eq	0x507c <_stogir.checked.validate+0x59c>
    4d18:      	ldr	x6, [x0, #0x78]
    4d1c:      	add	x2, x2, x6
    4d20:      	ldr	w2, [x2]
    4d24:      	sxtw	x2, w2
    4d28:      	cmp	x2, #0x2
    4d2c:      	b.ne	0x5084 <_stogir.checked.validate+0x5a4>
    4d30:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		0000000000004d30:  ARM64_RELOC_PAGE21	l_stogir.357
    4d34:      	ldr	x16, [x16]
		0000000000004d34:  ARM64_RELOC_PAGEOFF12	l_stogir.357
    4d38:      	orr	x2, x16, xzr
    4d3c:      	lsr	w6, w4, #0
    4d40:      	mov	x19, sp
    4d44:      	sub	sp, sp, #0x10
    4d48:      	mov	x7, sp
    4d4c:      	sub	sp, sp, #0x10
    4d50:      	mov	x9, sp
    4d54:      	ubfx	x6, x6, #8, #8
    4d58:      	orr	x20, x6, xzr
    4d5c:      	uxtb	w16, w3
    4d60:      	cmp	w16, wzr
    4d64:      	b.eq	0x4fdc <_stogir.checked.validate+0x4fc>
    4d68:      	uxtb	w16, w1
    4d6c:      	cmp	w16, wzr
    4d70:      	b.eq	0x4fdc <_stogir.checked.validate+0x4fc>
    4d74:      	cmp	x20, #0x1
    4d78:      	b.lt	0x4fdc <_stogir.checked.validate+0x4fc>
    4d7c:      	cmp	x20, #0xb
    4d80:      	b.gt	0x4fdc <_stogir.checked.validate+0x4fc>
    4d84:      	cmp	x20, #0x1
    4d88:      	b.eq	0x4fdc <_stogir.checked.validate+0x4fc>
    4d8c:      	mov	x1, x2
    4d90:      	movz	x3, #0x0, lsl #48
    4d94:      	b	0x4fec <_stogir.checked.validate+0x50c>
    4d98:      	movz	x4, #0x0, lsl #48
    4d9c:      	b	0x4bb8 <_stogir.checked.validate+0xd8>
    4da0:      	lsr	x0, x22, #0
    4da4:      	mov	x1, x2
    4da8:      	mov	x2, x0
    4dac:      	mov	x0, x21
    4db0:      	mov	x23, x8
    4db4:      	bl	0x4db4 <_stogir.checked.validate+0x2d4>
		0000000000004db4:  ARM64_RELOC_BRANCH26	_memcmp
    4db8:      	lsr	w0, w0, #0
    4dbc:      	sxtw	x0, w0
    4dc0:      	cmp	x0, #0x0
    4dc4:      	b.eq	0x4ed4 <_stogir.checked.validate+0x3f4>
    4dc8:      	mov	x1, x21
    4dcc:      	mov	x2, x22
    4dd0:      	mov	x0, #0x1                ; =1
    4dd4:      	mov	sp, x19
    4dd8:      	b	0x4cb0 <_stogir.checked.validate+0x1d0>
    4ddc:      	mov	x1, x11
    4de0:      	mov	x3, #0x28               ; =40
    4de4:      	mov	x21, x1
    4de8:      	mov	x22, x3
    4dec:      	mov	x1, x4
    4df0:      	cmp	x1, #0x2
    4df4:      	b.ge	0x4e20 <_stogir.checked.validate+0x340>
    4df8:      	add	x3, x1, #0x1
    4dfc:      	lsl	x1, x1, #2
    4e00:      	add	x1, x1, x6
    4e04:      	ldr	w1, [x1]
    4e08:      	sxtw	x1, w1
    4e0c:      	and	x1, x1, #0xffffffff
    4e10:      	mov	x4, x3
    4e14:      	mov	x3, x1
    4e18:      	mov	x1, #0x1                ; =1
    4e1c:      	b	0x4e2c <_stogir.checked.validate+0x34c>
    4e20:      	mov	x4, x1
    4e24:      	movz	x1, #0x0, lsl #48
    4e28:      	movz	x3, #0x0, lsl #48
    4e2c:      	lsr	w1, w1, #0
    4e30:      	lsr	x16, x1, #0
    4e34:      	cmp	x16, #0x1
    4e38:      	b.eq	0x4e54 <_stogir.checked.validate+0x374>
    4e3c:      	b.lo	0x4e44 <_stogir.checked.validate+0x364>
    4e40:      	b	0x4e58 <_stogir.checked.validate+0x378>
    4e44:      	cmp	x16, #0x0
    4e48:      	b.eq	0x4e50 <_stogir.checked.validate+0x370>
    4e4c:      	b	0x4e58 <_stogir.checked.validate+0x378>
    4e50:      	b	0x4ec0 <_stogir.checked.validate+0x3e0>
    4e54:      	b	0x4e5c <_stogir.checked.validate+0x37c>
    4e58:      	b	0x5064 <_stogir.checked.validate+0x584>
    4e5c:      	lsr	w3, w3, #0
    4e60:      	sxtw	x3, w3
    4e64:      	cmp	x3, #0x0
    4e68:      	cset	w1, gt
    4e6c:      	movz	x16, #0x0, lsl #48
    4e70:      	sub	x5, x16, x3
    4e74:      	sub	x7, x5, #0x1
    4e78:      	uxtb	w16, w1
    4e7c:      	cmp	w16, wzr
    4e80:      	b.eq	0x4ee8 <_stogir.checked.validate+0x408>
    4e84:      	ldr	x5, [x0, #0x8]
    4e88:      	cmp	x3, x5
    4e8c:      	b.ge	0x4f2c <_stogir.checked.validate+0x44c>
    4e90:      	ldr	x5, [x12, #0x8]
    4e94:      	cmp	x3, x5
    4e98:      	b.ge	0x504c <_stogir.checked.validate+0x56c>
    4e9c:      	lsl	x5, x3, #2
    4ea0:      	ldr	x9, [x0, #0x78]
    4ea4:      	add	x5, x5, x9
    4ea8:      	ldr	w5, [x5]
    4eac:      	sxtw	x5, w5
    4eb0:      	cmp	x5, #0x0
    4eb4:      	cset	w5, ge
    4eb8:      	ubfx	x5, x5, #0, #8
    4ebc:      	b	0x5050 <_stogir.checked.validate+0x570>
    4ec0:      	cmp	x22, #0x0
    4ec4:      	b.ne	0x508c <_stogir.checked.validate+0x5ac>
    4ec8:      	cmp	x22, #0x0
    4ecc:      	b.ne	0x4da0 <_stogir.checked.validate+0x2c0>
    4ed0:      	mov	x23, x8
    4ed4:      	and	x0, x20, #0xffffffff
    4ed8:      	mov	x1, x0
    4edc:      	movz	x0, #0x0, lsl #48
    4ee0:      	movz	x2, #0x0, lsl #48
    4ee4:      	b	0x4dd4 <_stogir.checked.validate+0x2f4>
    4ee8:      	cmp	x3, #0x0
    4eec:      	b.ge	0x4f34 <_stogir.checked.validate+0x454>
    4ef0:      	ldr	x9, [x13, #0x8]
    4ef4:      	ldr	x15, [x14, #0x8]
    4ef8:      	cmp	x9, x15
    4efc:      	b.ne	0x5044 <_stogir.checked.validate+0x564>
    4f00:      	cmp	x5, x9
    4f04:      	b.gt	0x505c <_stogir.checked.validate+0x57c>
    4f08:      	lsl	x5, x7, #2
    4f0c:      	ldr	x9, [x0, #0x50]
    4f10:      	add	x5, x5, x9
    4f14:      	ldr	w5, [x5]
    4f18:      	sxtw	x5, w5
    4f1c:      	cmp	x5, #0x0
    4f20:      	cset	w5, gt
    4f24:      	ubfx	x5, x5, #0, #8
    4f28:      	b	0x5060 <_stogir.checked.validate+0x580>
    4f2c:      	movz	x5, #0x0, lsl #48
    4f30:      	b	0x4f38 <_stogir.checked.validate+0x458>
    4f34:      	movz	x5, #0x0, lsl #48
    4f38:      	cmp	x5, #0x0
    4f3c:      	b.eq	0x4f7c <_stogir.checked.validate+0x49c>
    4f40:      	uxtb	w16, w1
    4f44:      	cmp	w16, wzr
    4f48:      	b.eq	0x4f60 <_stogir.checked.validate+0x480>
    4f4c:      	lsl	x1, x3, #4
    4f50:      	ldr	x3, [x0]
    4f54:      	add	x1, x1, x3
    4f58:      	ldr	x1, [x1]
    4f5c:      	b	0x4f70 <_stogir.checked.validate+0x490>
    4f60:      	lsl	x1, x7, #4
    4f64:      	ldr	x3, [x0, #0x28]
    4f68:      	add	x1, x1, x3
    4f6c:      	ldr	x1, [x1]
    4f70:      	mov	x3, x1
    4f74:      	mov	x1, #0x1                ; =1
    4f78:      	b	0x4f84 <_stogir.checked.validate+0x4a4>
    4f7c:      	movz	x1, #0x0, lsl #48
    4f80:      	movz	x3, #0x0, lsl #48
    4f84:      	lsr	w1, w1, #0
    4f88:      	lsr	x16, x1, #0
    4f8c:      	cmp	x16, #0x1
    4f90:      	b.eq	0x4fac <_stogir.checked.validate+0x4cc>
    4f94:      	b.lo	0x4f9c <_stogir.checked.validate+0x4bc>
    4f98:      	b	0x4fb0 <_stogir.checked.validate+0x4d0>
    4f9c:      	cmp	x16, #0x0
    4fa0:      	b.eq	0x4fa8 <_stogir.checked.validate+0x4c8>
    4fa4:      	b	0x4fb0 <_stogir.checked.validate+0x4d0>
    4fa8:      	b	0x4fb4 <_stogir.checked.validate+0x4d4>
    4fac:      	b	0x4fc0 <_stogir.checked.validate+0x4e0>
    4fb0:      	b	0x506c <_stogir.checked.validate+0x58c>
    4fb4:      	mov	x1, x10
    4fb8:      	mov	x3, #0x22               ; =34
    4fbc:      	b	0x4de4 <_stogir.checked.validate+0x304>
    4fc0:      	lsr	w3, w3, #0
    4fc4:      	ubfx	x1, x3, #8, #8
    4fc8:      	cmp	x1, x20
    4fcc:      	b.ne	0x4ddc <_stogir.checked.validate+0x2fc>
    4fd0:      	mov	x1, x21
    4fd4:      	mov	x3, x22
    4fd8:      	b	0x4de4 <_stogir.checked.validate+0x304>
    4fdc:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		0000000000004fdc:  ARM64_RELOC_PAGE21	l_stogir.358
    4fe0:      	ldr	x16, [x16]
		0000000000004fe0:  ARM64_RELOC_PAGEOFF12	l_stogir.358
    4fe4:      	orr	x1, x16, xzr
    4fe8:      	mov	x3, #0x36               ; =54
    4fec:      	orr	x6, x9, xzr
    4ff0:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		0000000000004ff0:  ARM64_RELOC_PAGE21	l_stogir.359
    4ff4:      	ldr	x16, [x16]
		0000000000004ff4:  ARM64_RELOC_PAGEOFF12	l_stogir.359
    4ff8:      	orr	x10, x16, xzr
    4ffc:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x970>
		0000000000004ffc:  ARM64_RELOC_PAGE21	l_stogir.360
    5000:      	ldr	x16, [x16]
		0000000000005000:  ARM64_RELOC_PAGEOFF12	l_stogir.360
    5004:      	orr	x11, x16, xzr
    5008:      	add	x12, x0, #0x78
    500c:      	add	x13, x0, #0x28
    5010:      	add	x14, x0, #0x50
    5014:      	lsr	w5, w5, #0
    5018:      	lsr	x4, x4, #32
    501c:      	lsr	w5, w5, #0
    5020:      	lsr	w4, w4, #0
    5024:      	str	w4, [x7]
    5028:      	str	w5, [x7, #0x4]
    502c:      	ldr	x4, [x7]
    5030:      	str	x4, [x9]
    5034:      	mov	x21, x1
    5038:      	mov	x22, x3
    503c:      	movz	x1, #0x0, lsl #48
    5040:      	b	0x4df0 <_stogir.checked.validate+0x310>
    5044:      	movz	x5, #0x0, lsl #48
    5048:      	b	0x4f38 <_stogir.checked.validate+0x458>
    504c:      	movz	x5, #0x0, lsl #48
    5050:      	b	0x4f30 <_stogir.checked.validate+0x450>
    5054:      	brk	#0
    5058:      	b	0x5054 <_stogir.checked.validate+0x574>
    505c:      	movz	x5, #0x0, lsl #48
    5060:      	b	0x5048 <_stogir.checked.validate+0x568>
    5064:      	brk	#0
    5068:      	b	0x5064 <_stogir.checked.validate+0x584>
    506c:      	brk	#0
    5070:      	b	0x506c <_stogir.checked.validate+0x58c>
    5074:      	mov	x23, x8
    5078:      	b	0x4c98 <_stogir.checked.validate+0x1b8>
    507c:      	mov	x23, x8
    5080:      	b	0x4c98 <_stogir.checked.validate+0x1b8>
    5084:      	mov	x23, x8
    5088:      	b	0x4c98 <_stogir.checked.validate+0x1b8>
    508c:      	mov	x23, x8
    5090:      	b	0x4dc8 <_stogir.checked.validate+0x2e8>

0000000000005094 <_stogir.atomic.operation?>:
    5094:      	sxtw	x0, w0
    5098:      	cmp	x0, #0x7e
    509c:      	b.lt	0x50b0 <_stogir.atomic.operation?+0x1c>
    50a0:      	cmp	x0, #0x82
    50a4:      	cset	w0, le
    50a8:      	ubfx	x0, x0, #0, #8
    50ac:      	b	0x50b4 <_stogir.atomic.operation?+0x20>
    50b0:      	movz	x0, #0x0, lsl #48
    50b4:      	ret

00000000000050b8 <_stogir.atomic.validate>:
    50b8:      	sub	sp, sp, #0xf0
    50bc:      	str	x29, [sp, #0x10]
    50c0:      	str	x30, [sp, #0x18]
    50c4:      	add	x29, sp, #0x10
    50c8:      	str	x19, [sp, #0xa0]
    50cc:      	str	x20, [sp, #0xa8]
    50d0:      	str	x21, [sp, #0xb0]
    50d4:      	str	x22, [sp, #0xb8]
    50d8:      	str	x23, [sp, #0xc0]
    50dc:      	str	x24, [sp, #0xc8]
    50e0:      	str	x25, [sp, #0xd0]
    50e4:      	str	x26, [sp, #0xd8]
    50e8:      	str	x27, [sp, #0xe0]
    50ec:      	str	x28, [sp, #0xe8]
    50f0:      	sxtw	x2, w1
    50f4:      	lsl	x3, x2, #2
    50f8:      	cmp	x2, #0x0
    50fc:      	cset	w4, gt
    5100:      	movz	x16, #0x0, lsl #48
    5104:      	sub	x5, x16, x2
    5108:      	sub	x6, x5, #0x1
    510c:      	uxtb	w16, w4
    5110:      	cmp	w16, wzr
    5114:      	b.eq	0x5154 <_stogir.atomic.validate+0x9c>
    5118:      	ldr	x5, [x0, #0x8]
    511c:      	cmp	x2, x5
    5120:      	b.ge	0x51a8 <_stogir.atomic.validate+0xf0>
    5124:      	add	x5, x0, #0x78
    5128:      	ldr	x5, [x5, #0x8]
    512c:      	cmp	x2, x5
    5130:      	b.ge	0x5320 <_stogir.atomic.validate+0x268>
    5134:      	ldr	x5, [x0, #0x78]
    5138:      	add	x5, x3, x5
    513c:      	ldr	w5, [x5]
    5140:      	sxtw	x5, w5
    5144:      	cmp	x5, #0x0
    5148:      	cset	w5, ge
    514c:      	ubfx	x5, x5, #0, #8
    5150:      	b	0x5324 <_stogir.atomic.validate+0x26c>
    5154:      	cmp	x2, #0x0
    5158:      	b.ge	0x51b0 <_stogir.atomic.validate+0xf8>
    515c:      	add	x7, x0, #0x28
    5160:      	add	x9, x0, #0x50
    5164:      	ldr	x7, [x7, #0x8]
    5168:      	ldr	x9, [x9, #0x8]
    516c:      	cmp	x7, x9
    5170:      	b.ne	0x51a0 <_stogir.atomic.validate+0xe8>
    5174:      	cmp	x5, x7
    5178:      	b.gt	0x53f4 <_stogir.atomic.validate+0x33c>
    517c:      	lsl	x5, x6, #2
    5180:      	ldr	x7, [x0, #0x50]
    5184:      	add	x5, x5, x7
    5188:      	ldr	w5, [x5]
    518c:      	sxtw	x5, w5
    5190:      	cmp	x5, #0x0
    5194:      	cset	w5, gt
    5198:      	ubfx	x5, x5, #0, #8
    519c:      	b	0x53f8 <_stogir.atomic.validate+0x340>
    51a0:      	movz	x5, #0x0, lsl #48
    51a4:      	b	0x51b4 <_stogir.atomic.validate+0xfc>
    51a8:      	movz	x5, #0x0, lsl #48
    51ac:      	b	0x51b4 <_stogir.atomic.validate+0xfc>
    51b0:      	movz	x5, #0x0, lsl #48
    51b4:      	cmp	x5, #0x0
    51b8:      	b.eq	0x5218 <_stogir.atomic.validate+0x160>
    51bc:      	uxtb	w16, w4
    51c0:      	cmp	w16, wzr
    51c4:      	b.eq	0x51ec <_stogir.atomic.validate+0x134>
    51c8:      	lsl	x4, x2, #4
    51cc:      	ldr	x5, [x0]
    51d0:      	add	x4, x4, x5
    51d4:      	ldr	x5, [x4]
    51d8:      	ldr	x4, [x4, #0x8]
    51dc:      	fmov	d31, x4
    51e0:      	mov	x4, x5
    51e4:      	fmov	x5, d31
    51e8:      	b	0x520c <_stogir.atomic.validate+0x154>
    51ec:      	lsl	x4, x6, #4
    51f0:      	ldr	x5, [x0, #0x28]
    51f4:      	add	x4, x4, x5
    51f8:      	ldr	x5, [x4]
    51fc:      	ldr	x4, [x4, #0x8]
    5200:      	fmov	d31, x4
    5204:      	mov	x4, x5
    5208:      	fmov	x5, d31
    520c:      	mov	x19, x4
    5210:      	mov	x4, #0x1                ; =1
    5214:      	b	0x5224 <_stogir.atomic.validate+0x16c>
    5218:      	movz	x4, #0x0, lsl #48
    521c:      	movz	x19, #0x0, lsl #48
    5220:      	movz	x5, #0x0, lsl #48
    5224:      	lsr	w4, w4, #0
    5228:      	lsr	x16, x4, #0
    522c:      	cmp	x16, #0x1
    5230:      	b.eq	0x524c <_stogir.atomic.validate+0x194>
    5234:      	b.lo	0x523c <_stogir.atomic.validate+0x184>
    5238:      	b	0x5250 <_stogir.atomic.validate+0x198>
    523c:      	cmp	x16, #0x0
    5240:      	b.eq	0x5248 <_stogir.atomic.validate+0x190>
    5244:      	b	0x5250 <_stogir.atomic.validate+0x198>
    5248:      	b	0x5254 <_stogir.atomic.validate+0x19c>
    524c:      	b	0x52b4 <_stogir.atomic.validate+0x1fc>
    5250:      	b	0x5a28 <_stogir.atomic.validate+0x970>
    5254:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005254:  ARM64_RELOC_PAGE21	l_stogir.361
    5258:      	ldr	x16, [x16]
		0000000000005258:  ARM64_RELOC_PAGEOFF12	l_stogir.361
    525c:      	orr	x0, x16, xzr
    5260:      	mov	x24, x8
    5264:      	mov	x1, x0
    5268:      	mov	x0, #0x1                ; =1
    526c:      	mov	x2, #0x1a               ; =26
    5270:      	str	x0, [x24]
    5274:      	str	x1, [x24, #0x8]
    5278:      	str	x2, [x24, #0x10]
    527c:      	ldr	x19, [sp, #0xa0]
    5280:      	ldr	x20, [sp, #0xa8]
    5284:      	ldr	x21, [sp, #0xb0]
    5288:      	ldr	x22, [sp, #0xb8]
    528c:      	ldr	x23, [sp, #0xc0]
    5290:      	ldr	x24, [sp, #0xc8]
    5294:      	ldr	x25, [sp, #0xd0]
    5298:      	ldr	x26, [sp, #0xd8]
    529c:      	ldr	x27, [sp, #0xe0]
    52a0:      	ldr	x28, [sp, #0xe8]
    52a4:      	ldr	x29, [sp, #0x10]
    52a8:      	ldr	x30, [sp, #0x18]
    52ac:      	add	sp, sp, #0xf0
    52b0:      	ret
    52b4:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		00000000000052b4:  ARM64_RELOC_PAGE21	l_stogir.362
    52b8:      	ldr	x16, [x16]
		00000000000052b8:  ARM64_RELOC_PAGEOFF12	l_stogir.362
    52bc:      	orr	x20, x16, xzr
    52c0:      	uxtb	w4, w19
    52c4:      	add	x16, sp, #0x20
    52c8:      	str	x19, [x16]
    52cc:      	orr	x21, x4, xzr
    52d0:      	add	x16, sp, #0x20
    52d4:      	str	x5, [x16, #0x8]
    52d8:      	cmp	x2, #0x0
    52dc:      	b.le	0x5374 <_stogir.atomic.validate+0x2bc>
    52e0:      	cmp	x21, #0x7e
    52e4:      	b.lt	0x5374 <_stogir.atomic.validate+0x2bc>
    52e8:      	cmp	x21, #0x82
    52ec:      	b.gt	0x5374 <_stogir.atomic.validate+0x2bc>
    52f0:      	ldr	x2, [x0, #0x78]
    52f4:      	add	x2, x3, x2
    52f8:      	ldr	w2, [x2]
    52fc:      	cmp	x21, #0x83
    5300:      	b.ge	0x5954 <_stogir.atomic.validate+0x89c>
    5304:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005304:  ARM64_RELOC_PAGE21	l_stogir.363
    5308:      	ldr	x16, [x16]
		0000000000005308:  ARM64_RELOC_PAGEOFF12	l_stogir.363
    530c:      	orr	x3, x16, xzr
    5310:      	add	x3, x21, x3
    5314:      	ldrsb	w3, [x3]
    5318:      	sxtb	x3, w3
    531c:      	b	0x5958 <_stogir.atomic.validate+0x8a0>
    5320:      	movz	x5, #0x0, lsl #48
    5324:      	b	0x51ac <_stogir.atomic.validate+0xf4>
    5328:      	mov	x19, x21
    532c:      	mov	x21, x23
    5330:      	cmp	x21, #0x0
    5334:      	b.ne	0x5364 <_stogir.atomic.validate+0x2ac>
    5338:      	cmp	x21, #0x0
    533c:      	b.eq	0x57fc <_stogir.atomic.validate+0x744>
    5340:      	lsr	x0, x21, #0
    5344:      	mov	x1, x20
    5348:      	mov	x2, x0
    534c:      	mov	x0, x19
    5350:      	bl	0x5350 <_stogir.atomic.validate+0x298>
		0000000000005350:  ARM64_RELOC_BRANCH26	_memcmp
    5354:      	lsr	w0, w0, #0
    5358:      	sxtw	x0, w0
    535c:      	cmp	x0, #0x0
    5360:      	b.eq	0x57fc <_stogir.atomic.validate+0x744>
    5364:      	mov	x1, x19
    5368:      	mov	x2, x21
    536c:      	mov	x0, #0x1                ; =1
    5370:      	b	0x5270 <_stogir.atomic.validate+0x1b8>
    5374:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005374:  ARM64_RELOC_PAGE21	l_stogir.364
    5378:      	ldr	x16, [x16]
		0000000000005378:  ARM64_RELOC_PAGEOFF12	l_stogir.364
    537c:      	orr	x2, x16, xzr
    5380:      	mov	x22, x2
    5384:      	mov	x23, #0x20              ; =32
    5388:      	add	x16, sp, #0x20
    538c:      	ldr	w2, [x16, #0x4]
    5390:      	lsr	w2, w2, #0
    5394:      	mov	x24, x8
    5398:      	add	x8, sp, #0x30
    539c:      	mov	x25, x0
    53a0:      	mov	w26, w1
    53a4:      	mov	w1, w2
    53a8:      	bl	0x53a8 <_stogir.atomic.validate+0x2f0>
		00000000000053a8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    53ac:      	add	x16, sp, #0x30
    53b0:      	ldr	w0, [x16]
    53b4:      	lsr	x16, x0, #0
    53b8:      	cmp	x16, #0x1
    53bc:      	b.eq	0x53d8 <_stogir.atomic.validate+0x320>
    53c0:      	b.lo	0x53c8 <_stogir.atomic.validate+0x310>
    53c4:      	b	0x53dc <_stogir.atomic.validate+0x324>
    53c8:      	cmp	x16, #0x0
    53cc:      	b.eq	0x53d4 <_stogir.atomic.validate+0x31c>
    53d0:      	b	0x53dc <_stogir.atomic.validate+0x324>
    53d4:      	b	0x53e0 <_stogir.atomic.validate+0x328>
    53d8:      	b	0x54dc <_stogir.atomic.validate+0x424>
    53dc:      	b	0x5a60 <_stogir.atomic.validate+0x9a8>
    53e0:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		00000000000053e0:  ARM64_RELOC_PAGE21	l_stogir.365
    53e4:      	ldr	x16, [x16]
		00000000000053e4:  ARM64_RELOC_PAGEOFF12	l_stogir.365
    53e8:      	orr	x0, x16, xzr
    53ec:      	mov	x1, #0x16               ; =22
    53f0:      	b	0x5404 <_stogir.atomic.validate+0x34c>
    53f4:      	movz	x5, #0x0, lsl #48
    53f8:      	b	0x51a4 <_stogir.atomic.validate+0xec>
    53fc:      	mov	x0, x1
    5400:      	mov	x1, x2
    5404:      	cmp	x21, #0x82
    5408:      	cset	w22, eq
    540c:      	lsr	w19, w19, #0
    5410:      	ubfx	x2, x19, #8, #8
    5414:      	orr	x19, x2, xzr
    5418:      	cmp	x19, #0x0
    541c:      	cset	w23, eq
    5420:      	uxtb	w16, w22
    5424:      	cmp	w16, wzr
    5428:      	b.eq	0x5450 <_stogir.atomic.validate+0x398>
    542c:      	uxtb	w16, w23
    5430:      	cmp	w16, wzr
    5434:      	b.eq	0x5648 <_stogir.atomic.validate+0x590>
    5438:      	mov	x2, x0
    543c:      	movz	x0, #0x0, lsl #48
    5440:      	b	0x5650 <_stogir.atomic.validate+0x598>
    5444:      	mov	x0, x2
    5448:      	mov	x27, x1
    544c:      	b	0x5454 <_stogir.atomic.validate+0x39c>
    5450:      	mov	x27, x1
    5454:      	uxtb	w16, w22
    5458:      	cmp	w16, wzr
    545c:      	b.eq	0x546c <_stogir.atomic.validate+0x3b4>
    5460:      	mov	x28, x0
    5464:      	movz	x0, #0x0, lsl #48
    5468:      	b	0x5474 <_stogir.atomic.validate+0x3bc>
    546c:      	mov	x28, x0
    5470:      	mov	x0, #0x1                ; =1
    5474:      	cmp	x0, #0x0
    5478:      	b.eq	0x54ac <_stogir.atomic.validate+0x3f4>
    547c:      	add	x16, sp, #0x20
    5480:      	ldr	w0, [x16, #0x8]
    5484:      	lsr	w0, w0, #0
    5488:      	mov	w1, w0
    548c:      	mov	x0, x25
    5490:      	mov	x2, #0x6                ; =6
    5494:      	bl	0x5494 <_stogir.atomic.validate+0x3dc>
		0000000000005494:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    5498:      	cmp	x0, #0x0
    549c:      	b.eq	0x55fc <_stogir.atomic.validate+0x544>
    54a0:      	mov	x1, x28
    54a4:      	movz	x0, #0x0, lsl #48
    54a8:      	b	0x5604 <_stogir.atomic.validate+0x54c>
    54ac:      	mov	x0, x19
    54b0:      	mov	x1, x28
    54b4:      	mov	x2, x27
    54b8:      	cmp	x21, #0x80
    54bc:      	cset	w19, eq
    54c0:      	uxtb	w16, w19
    54c4:      	cmp	w16, wzr
    54c8:      	b.eq	0x5508 <_stogir.atomic.validate+0x450>
    54cc:      	mov	x21, x1
    54d0:      	mov	x23, x2
    54d4:      	mov	x1, #0x1                ; =1
    54d8:      	b	0x5520 <_stogir.atomic.validate+0x468>
    54dc:      	add	x16, sp, #0x30
    54e0:      	ldr	x0, [x16, #0x8]
    54e4:      	add	x16, sp, #0x20
    54e8:      	ldr	w1, [x16, #0x4]
    54ec:      	sxtw	x1, w1
    54f0:      	cmp	x1, #0x0
    54f4:      	b.gt	0x56b4 <_stogir.atomic.validate+0x5fc>
    54f8:      	mov	x1, x22
    54fc:      	mov	x2, x23
    5500:      	mov	x0, #0x1                ; =1
    5504:      	b	0x5698 <_stogir.atomic.validate+0x5e0>
    5508:      	cmp	x21, #0x81
    550c:      	cset	w3, eq
    5510:      	ubfx	x3, x3, #0, #8
    5514:      	mov	x21, x1
    5518:      	mov	x1, x3
    551c:      	mov	x23, x2
    5520:      	lsr	w27, w0, #0
    5524:      	cmp	x1, #0x0
    5528:      	b.eq	0x5328 <_stogir.atomic.validate+0x270>
    552c:      	lsr	w26, w26, #0
    5530:      	add	x16, sp, #0x90
    5534:      	str	x16, [sp]
    5538:      	mov	x0, x25
    553c:      	mov	w1, w26
    5540:      	mov	x2, #0x4                ; =4
    5544:      	bl	0x5544 <_stogir.atomic.validate+0x48c>
		0000000000005544:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    5548:      	ldr	x16, [sp]
    554c:      	str	x0, [x16]
    5550:      	str	x1, [x16, #0x8]
    5554:      	add	x16, sp, #0x90
    5558:      	ldr	x0, [x16]
    555c:      	add	x16, sp, #0x90
    5560:      	ldr	x1, [x16, #0x8]
    5564:      	lsr	w0, w0, #0
    5568:      	lsr	x16, x0, #0
    556c:      	cmp	x16, #0x1
    5570:      	b.eq	0x558c <_stogir.atomic.validate+0x4d4>
    5574:      	b.lo	0x557c <_stogir.atomic.validate+0x4c4>
    5578:      	b	0x5590 <_stogir.atomic.validate+0x4d8>
    557c:      	cmp	x16, #0x0
    5580:      	b.eq	0x5588 <_stogir.atomic.validate+0x4d0>
    5584:      	b	0x5590 <_stogir.atomic.validate+0x4d8>
    5588:      	b	0x5594 <_stogir.atomic.validate+0x4dc>
    558c:      	b	0x5810 <_stogir.atomic.validate+0x758>
    5590:      	b	0x5a70 <_stogir.atomic.validate+0x9b8>
    5594:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005594:  ARM64_RELOC_PAGE21	l_stogir.366
    5598:      	ldr	x16, [x16]
		0000000000005598:  ARM64_RELOC_PAGEOFF12	l_stogir.366
    559c:      	orr	x0, x16, xzr
    55a0:      	mov	x1, #0x1d               ; =29
    55a4:      	b	0x55d0 <_stogir.atomic.validate+0x518>
    55a8:      	mov	x0, x1
    55ac:      	mov	x1, x2
    55b0:      	mov	x2, x1
    55b4:      	mov	x1, x0
    55b8:      	mov	x0, x19
    55bc:      	b	0x54b8 <_stogir.atomic.validate+0x400>
    55c0:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		00000000000055c0:  ARM64_RELOC_PAGE21	l_stogir.367
    55c4:      	ldr	x16, [x16]
		00000000000055c4:  ARM64_RELOC_PAGEOFF12	l_stogir.367
    55c8:      	orr	x0, x16, xzr
    55cc:      	mov	x1, #0x24               ; =36
    55d0:      	mov	x19, x0
    55d4:      	mov	x21, x1
    55d8:      	b	0x5330 <_stogir.atomic.validate+0x278>
    55dc:      	mov	x0, #0x1                ; =1
    55e0:      	lsr	w0, w0, #0
    55e4:      	sxtw	x0, w0
    55e8:      	and	x0, x0, #0xffffffff
    55ec:      	mov	x1, x0
    55f0:      	movz	x0, #0x0, lsl #48
    55f4:      	movz	x2, #0x0, lsl #48
    55f8:      	b	0x5370 <_stogir.atomic.validate+0x2b8>
    55fc:      	mov	x1, x28
    5600:      	mov	x0, #0x1                ; =1
    5604:      	cmp	x0, #0x0
    5608:      	b.eq	0x5620 <_stogir.atomic.validate+0x568>
    560c:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		000000000000560c:  ARM64_RELOC_PAGE21	l_stogir.368
    5610:      	ldr	x16, [x16]
		0000000000005610:  ARM64_RELOC_PAGEOFF12	l_stogir.368
    5614:      	orr	x0, x16, xzr
    5618:      	mov	x1, #0x1b               ; =27
    561c:      	b	0x5628 <_stogir.atomic.validate+0x570>
    5620:      	mov	x0, x1
    5624:      	mov	x1, x27
    5628:      	cmp	x21, #0x7f
    562c:      	b.ne	0x5718 <_stogir.atomic.validate+0x660>
    5630:      	uxtb	w16, w23
    5634:      	cmp	w16, wzr
    5638:      	b.eq	0x5850 <_stogir.atomic.validate+0x798>
    563c:      	mov	x2, x0
    5640:      	movz	x0, #0x0, lsl #48
    5644:      	b	0x5858 <_stogir.atomic.validate+0x7a0>
    5648:      	mov	x2, x0
    564c:      	mov	x0, #0x1                ; =1
    5650:      	cmp	x0, #0x0
    5654:      	b.eq	0x5444 <_stogir.atomic.validate+0x38c>
    5658:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005658:  ARM64_RELOC_PAGE21	l_stogir.369
    565c:      	ldr	x16, [x16]
		000000000000565c:  ARM64_RELOC_PAGEOFF12	l_stogir.369
    5660:      	orr	x0, x16, xzr
    5664:      	mov	x1, #0x19               ; =25
    5668:      	b	0x5448 <_stogir.atomic.validate+0x390>
    566c:      	mov	x1, x3
    5670:      	movz	x0, #0x0, lsl #48
    5674:      	uxtb	w0, w0
    5678:      	and	x0, x0, #0x4
    567c:      	uxtb	w0, w0
    5680:      	cmp	x0, #0x0
    5684:      	cset	w0, eq
    5688:      	uxtb	w16, w0
    568c:      	cmp	w16, wzr
    5690:      	cset	x0, eq
    5694:      	mov	x2, x23
    5698:      	cmp	x0, #0x0
    569c:      	b.eq	0x53fc <_stogir.atomic.validate+0x344>
    56a0:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		00000000000056a0:  ARM64_RELOC_PAGE21	l_stogir.370
    56a4:      	ldr	x16, [x16]
		00000000000056a4:  ARM64_RELOC_PAGEOFF12	l_stogir.370
    56a8:      	orr	x0, x16, xzr
    56ac:      	mov	x1, #0x16               ; =22
    56b0:      	b	0x5404 <_stogir.atomic.validate+0x34c>
    56b4:      	uxtb	w0, w0
    56b8:      	cmp	x0, #0x83
    56bc:      	cset	w1, lt
    56c0:      	ubfx	x1, x1, #0, #8
    56c4:      	cmp	x1, #0x0
    56c8:      	cset	w1, ne
    56cc:      	uxtb	w16, w1
    56d0:      	cmp	w16, wzr
    56d4:      	b.eq	0x5930 <_stogir.atomic.validate+0x878>
    56d8:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		00000000000056d8:  ARM64_RELOC_PAGE21	l_stogir.371
    56dc:      	ldr	x16, [x16]
		00000000000056dc:  ARM64_RELOC_PAGEOFF12	l_stogir.371
    56e0:      	orr	x2, x16, xzr
    56e4:      	add	x2, x0, x2
    56e8:      	ldrb	w2, [x2]
    56ec:      	mov	x3, x22
    56f0:      	b	0x5938 <_stogir.atomic.validate+0x880>
    56f4:      	add	x16, sp, #0x60
    56f8:      	ldr	x0, [x16, #0x8]
    56fc:      	lsr	w0, w0, #0
    5700:      	ubfx	x0, x0, #8, #8
    5704:      	mov	x1, x23
    5708:      	mov	x2, x27
    570c:      	mov	x19, x0
    5710:      	mov	x0, x1
    5714:      	mov	x1, x2
    5718:      	cmp	x19, #0x2
    571c:      	b.ge	0x57c4 <_stogir.atomic.validate+0x70c>
    5720:      	mov	x2, x1
    5724:      	mov	x1, x0
    5728:      	mov	x0, #0x1                ; =1
    572c:      	b	0x57e0 <_stogir.atomic.validate+0x728>
    5730:      	mov	x1, x27
    5734:      	mov	x2, x23
    5738:      	movz	x0, #0x0, lsl #48
    573c:      	cmp	x0, #0x0
    5740:      	b.eq	0x55a8 <_stogir.atomic.validate+0x4f0>
    5744:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005744:  ARM64_RELOC_PAGE21	l_stogir.372
    5748:      	ldr	x16, [x16]
		0000000000005748:  ARM64_RELOC_PAGEOFF12	l_stogir.372
    574c:      	orr	x0, x16, xzr
    5750:      	mov	x1, #0x22               ; =34
    5754:      	b	0x55b0 <_stogir.atomic.validate+0x4f8>
    5758:      	mov	x1, x27
    575c:      	mov	x0, #0x1                ; =1
    5760:      	mov	x2, x23
    5764:      	b	0x573c <_stogir.atomic.validate+0x684>
    5768:      	mov	x27, x0
    576c:      	mov	x0, #0x1                ; =1
    5770:      	cmp	x0, #0x0
    5774:      	b.eq	0x5730 <_stogir.atomic.validate+0x678>
    5778:      	lsr	w0, w19, #0
    577c:      	add	x16, sp, #0x20
    5780:      	ldr	w1, [x16, #0xc]
    5784:      	lsr	w1, w1, #0
    5788:      	mov	w2, w0
    578c:      	mov	x0, x25
    5790:      	bl	0x5790 <_stogir.atomic.validate+0x6d8>
		0000000000005790:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    5794:      	cmp	x0, #0x0
    5798:      	b.eq	0x5758 <_stogir.atomic.validate+0x6a0>
    579c:      	mov	x1, x27
    57a0:      	movz	x0, #0x0, lsl #48
    57a4:      	b	0x5760 <_stogir.atomic.validate+0x6a8>
    57a8:      	mov	x0, x1
    57ac:      	mov	x23, x2
    57b0:      	cmp	x21, #0x7e
    57b4:      	b.ne	0x5768 <_stogir.atomic.validate+0x6b0>
    57b8:      	mov	x27, x0
    57bc:      	movz	x0, #0x0, lsl #48
    57c0:      	b	0x5770 <_stogir.atomic.validate+0x6b8>
    57c4:      	cmp	x19, #0x5
    57c8:      	cset	w2, gt
    57cc:      	ubfx	x2, x2, #0, #8
    57d0:      	fmov	d31, x0
    57d4:      	mov	x0, x2
    57d8:      	mov	x2, x1
    57dc:      	fmov	x1, d31
    57e0:      	cmp	x0, #0x0
    57e4:      	b.eq	0x57a8 <_stogir.atomic.validate+0x6f0>
    57e8:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		00000000000057e8:  ARM64_RELOC_PAGE21	l_stogir.373
    57ec:      	ldr	x16, [x16]
		00000000000057ec:  ARM64_RELOC_PAGEOFF12	l_stogir.373
    57f0:      	orr	x0, x16, xzr
    57f4:      	mov	x23, #0x25              ; =37
    57f8:      	b	0x57b0 <_stogir.atomic.validate+0x6f8>
    57fc:      	uxtb	w16, w22
    5800:      	cmp	w16, wzr
    5804:      	b.eq	0x583c <_stogir.atomic.validate+0x784>
    5808:      	movz	x0, #0x0, lsl #48
    580c:      	b	0x55e8 <_stogir.atomic.validate+0x530>
    5810:      	lsr	w1, w1, #0
    5814:      	uxtb	w16, w19
    5818:      	cmp	w16, wzr
    581c:      	b.eq	0x5984 <_stogir.atomic.validate+0x8cc>
    5820:      	sxtw	x1, w1
    5824:      	cmp	x1, #0x0
    5828:      	b.ge	0x5a30 <_stogir.atomic.validate+0x978>
    582c:      	mov	x1, x21
    5830:      	mov	x2, x23
    5834:      	mov	x0, #0x1                ; =1
    5838:      	b	0x5a44 <_stogir.atomic.validate+0x98c>
    583c:      	sxtw	x27, w27
    5840:      	cmp	x27, #0x0
    5844:      	b.ne	0x59a8 <_stogir.atomic.validate+0x8f0>
    5848:      	movz	x0, #0x0, lsl #48
    584c:      	b	0x55e0 <_stogir.atomic.validate+0x528>
    5850:      	mov	x2, x0
    5854:      	mov	x0, #0x1                ; =1
    5858:      	cmp	x0, #0x0
    585c:      	b.eq	0x5878 <_stogir.atomic.validate+0x7c0>
    5860:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005860:  ARM64_RELOC_PAGE21	l_stogir.374
    5864:      	ldr	x16, [x16]
		0000000000005864:  ARM64_RELOC_PAGEOFF12	l_stogir.374
    5868:      	orr	x0, x16, xzr
    586c:      	mov	x23, x0
    5870:      	mov	x27, #0x19              ; =25
    5874:      	b	0x5880 <_stogir.atomic.validate+0x7c8>
    5878:      	mov	x23, x2
    587c:      	mov	x27, x1
    5880:      	add	x16, sp, #0x20
    5884:      	ldr	w0, [x16, #0xc]
    5888:      	lsr	w0, w0, #0
    588c:      	add	x8, sp, #0x60
    5890:      	mov	w1, w0
    5894:      	mov	x0, x25
    5898:      	bl	0x5898 <_stogir.atomic.validate+0x7e0>
		0000000000005898:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    589c:      	add	x16, sp, #0x60
    58a0:      	ldr	w0, [x16]
    58a4:      	lsr	x16, x0, #0
    58a8:      	cmp	x16, #0x1
    58ac:      	b.eq	0x58c8 <_stogir.atomic.validate+0x810>
    58b0:      	b.lo	0x58b8 <_stogir.atomic.validate+0x800>
    58b4:      	b	0x58cc <_stogir.atomic.validate+0x814>
    58b8:      	cmp	x16, #0x0
    58bc:      	b.eq	0x58c4 <_stogir.atomic.validate+0x80c>
    58c0:      	b	0x58cc <_stogir.atomic.validate+0x814>
    58c4:      	b	0x58d0 <_stogir.atomic.validate+0x818>
    58c8:      	b	0x56f4 <_stogir.atomic.validate+0x63c>
    58cc:      	b	0x5a78 <_stogir.atomic.validate+0x9c0>
    58d0:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		00000000000058d0:  ARM64_RELOC_PAGE21	l_stogir.375
    58d4:      	ldr	x16, [x16]
		00000000000058d4:  ARM64_RELOC_PAGEOFF12	l_stogir.375
    58d8:      	orr	x0, x16, xzr
    58dc:      	mov	x1, x0
    58e0:      	mov	x0, x19
    58e4:      	mov	x2, #0x1a               ; =26
    58e8:      	b	0x570c <_stogir.atomic.validate+0x654>
    58ec:      	mov	x2, #0x1                ; =1
    58f0:      	cmp	x2, #0x0
    58f4:      	b.eq	0x5908 <_stogir.atomic.validate+0x850>
    58f8:      	mov	x1, x3
    58fc:      	mov	x2, x23
    5900:      	mov	x0, #0x1                ; =1
    5904:      	b	0x5698 <_stogir.atomic.validate+0x5e0>
    5908:      	uxtb	w16, w1
    590c:      	cmp	w16, wzr
    5910:      	b.eq	0x566c <_stogir.atomic.validate+0x5b4>
    5914:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005914:  ARM64_RELOC_PAGE21	l_stogir.371
    5918:      	ldr	x16, [x16]
		0000000000005918:  ARM64_RELOC_PAGEOFF12	l_stogir.371
    591c:      	orr	x1, x16, xzr
    5920:      	add	x0, x0, x1
    5924:      	ldrb	w0, [x0]
    5928:      	mov	x1, x3
    592c:      	b	0x5674 <_stogir.atomic.validate+0x5bc>
    5930:      	mov	x3, x22
    5934:      	movz	x2, #0x0, lsl #48
    5938:      	uxtb	w2, w2
    593c:      	and	x2, x2, #0x1
    5940:      	uxtb	w2, w2
    5944:      	cmp	x2, #0x0
    5948:      	b.eq	0x58ec <_stogir.atomic.validate+0x834>
    594c:      	movz	x2, #0x0, lsl #48
    5950:      	b	0x58f0 <_stogir.atomic.validate+0x838>
    5954:      	mov	x3, #-0x2               ; =-2
    5958:      	sxtw	x2, w2
    595c:      	lsr	w3, w3, #0
    5960:      	sxtw	x3, w3
    5964:      	cmp	x2, x3
    5968:      	b.ne	0x5374 <_stogir.atomic.validate+0x2bc>
    596c:      	mov	x22, x20
    5970:      	movz	x23, #0x0, lsl #48
    5974:      	b	0x5388 <_stogir.atomic.validate+0x2d0>
    5978:      	mov	x0, x1
    597c:      	mov	x1, x2
    5980:      	b	0x55d0 <_stogir.atomic.validate+0x518>
    5984:      	lsr	w1, w1, #0
    5988:      	mov	x0, x25
    598c:      	mov	w2, w27
    5990:      	bl	0x5990 <_stogir.atomic.validate+0x8d8>
		0000000000005990:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    5994:      	cmp	x0, #0x0
    5998:      	b.eq	0x55c0 <_stogir.atomic.validate+0x508>
    599c:      	mov	x0, x21
    59a0:      	mov	x1, x23
    59a4:      	b	0x55d0 <_stogir.atomic.validate+0x518>
    59a8:      	cmp	x27, #0x1
    59ac:      	b.eq	0x55dc <_stogir.atomic.validate+0x524>
    59b0:      	cmp	x27, #0x2
    59b4:      	b.eq	0x55dc <_stogir.atomic.validate+0x524>
    59b8:      	cmp	x27, #0x7
    59bc:      	b.eq	0x55dc <_stogir.atomic.validate+0x524>
    59c0:      	cmp	x27, #0x8
    59c4:      	b.eq	0x55dc <_stogir.atomic.validate+0x524>
    59c8:      	cmp	x27, #0x3
    59cc:      	b.eq	0x5a68 <_stogir.atomic.validate+0x9b0>
    59d0:      	cmp	x27, #0x9
    59d4:      	b.eq	0x5a68 <_stogir.atomic.validate+0x9b0>
    59d8:      	cmp	x27, #0x4
    59dc:      	b.eq	0x5a80 <_stogir.atomic.validate+0x9c8>
    59e0:      	cmp	x27, #0xa
    59e4:      	b.eq	0x5a80 <_stogir.atomic.validate+0x9c8>
    59e8:      	cmp	x27, #0xd
    59ec:      	b.eq	0x5a80 <_stogir.atomic.validate+0x9c8>
    59f0:      	cmp	x27, #0x5
    59f4:      	b.eq	0x5a88 <_stogir.atomic.validate+0x9d0>
    59f8:      	cmp	x27, #0xb
    59fc:      	b.eq	0x5a88 <_stogir.atomic.validate+0x9d0>
    5a00:      	cmp	x27, #0xc
    5a04:      	b.eq	0x5a88 <_stogir.atomic.validate+0x9d0>
    5a08:      	cmp	x27, #0x6
    5a0c:      	cset	w0, eq
    5a10:      	uxtb	w16, w0
    5a14:      	cmp	w16, wzr
    5a18:      	mov	x16, #0x8               ; =8
    5a1c:      	movn	x17, #0x0, lsl #48
    5a20:      	csel	x0, x16, x17, ne
    5a24:      	b	0x5a8c <_stogir.atomic.validate+0x9d4>
    5a28:      	brk	#0
    5a2c:      	b	0x5a28 <_stogir.atomic.validate+0x970>
    5a30:      	cmp	x1, #0x9
    5a34:      	cset	w0, gt
    5a38:      	ubfx	x0, x0, #0, #8
    5a3c:      	mov	x1, x21
    5a40:      	mov	x2, x23
    5a44:      	cmp	x0, #0x0
    5a48:      	b.eq	0x5978 <_stogir.atomic.validate+0x8c0>
    5a4c:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005a4c:  ARM64_RELOC_PAGE21	l_stogir.376
    5a50:      	ldr	x16, [x16]
		0000000000005a50:  ARM64_RELOC_PAGEOFF12	l_stogir.376
    5a54:      	orr	x0, x16, xzr
    5a58:      	mov	x1, #0x1c               ; =28
    5a5c:      	b	0x5980 <_stogir.atomic.validate+0x8c8>
    5a60:      	brk	#0
    5a64:      	b	0x5a60 <_stogir.atomic.validate+0x9a8>
    5a68:      	mov	x0, #0x2                ; =2
    5a6c:      	b	0x55e0 <_stogir.atomic.validate+0x528>
    5a70:      	brk	#0
    5a74:      	b	0x5a70 <_stogir.atomic.validate+0x9b8>
    5a78:      	brk	#0
    5a7c:      	b	0x5a78 <_stogir.atomic.validate+0x9c0>
    5a80:      	mov	x0, #0x4                ; =4
    5a84:      	b	0x5a6c <_stogir.atomic.validate+0x9b4>
    5a88:      	mov	x0, #0x8                ; =8
    5a8c:      	b	0x5a84 <_stogir.atomic.validate+0x9cc>

0000000000005a90 <_stogir.terminal.operation?>:
    5a90:      	sxtw	x0, w0
    5a94:      	cmp	x0, #0x60
    5a98:      	b.ne	0x5aa4 <_stogir.terminal.operation?+0x14>
    5a9c:      	mov	x0, #0x1                ; =1
    5aa0:      	b	0x5ab0 <_stogir.terminal.operation?+0x20>
    5aa4:      	cmp	x0, #0x79
    5aa8:      	cset	w0, eq
    5aac:      	ubfx	x0, x0, #0, #8
    5ab0:      	ret

0000000000005ab4 <_stogir.terminal.validate>:
    5ab4:      	sub	sp, sp, #0x50
    5ab8:      	str	x29, [sp]
    5abc:      	str	x30, [sp, #0x8]
    5ac0:      	mov	x29, sp
    5ac4:      	str	x19, [sp, #0x40]
    5ac8:      	sxtw	x1, w1
    5acc:      	lsl	x2, x1, #2
    5ad0:      	cmp	x1, #0x0
    5ad4:      	cset	w3, gt
    5ad8:      	movz	x16, #0x0, lsl #48
    5adc:      	sub	x4, x16, x1
    5ae0:      	sub	x5, x4, #0x1
    5ae4:      	uxtb	w16, w3
    5ae8:      	cmp	w16, wzr
    5aec:      	b.eq	0x5b2c <_stogir.terminal.validate+0x78>
    5af0:      	ldr	x4, [x0, #0x8]
    5af4:      	cmp	x1, x4
    5af8:      	b.ge	0x5b80 <_stogir.terminal.validate+0xcc>
    5afc:      	add	x4, x0, #0x78
    5b00:      	ldr	x4, [x4, #0x8]
    5b04:      	cmp	x1, x4
    5b08:      	b.ge	0x5ca4 <_stogir.terminal.validate+0x1f0>
    5b0c:      	ldr	x4, [x0, #0x78]
    5b10:      	add	x4, x2, x4
    5b14:      	ldr	w4, [x4]
    5b18:      	sxtw	x4, w4
    5b1c:      	cmp	x4, #0x0
    5b20:      	cset	w4, ge
    5b24:      	ubfx	x4, x4, #0, #8
    5b28:      	b	0x5ca8 <_stogir.terminal.validate+0x1f4>
    5b2c:      	cmp	x1, #0x0
    5b30:      	b.ge	0x5b88 <_stogir.terminal.validate+0xd4>
    5b34:      	add	x6, x0, #0x28
    5b38:      	add	x7, x0, #0x50
    5b3c:      	ldr	x6, [x6, #0x8]
    5b40:      	ldr	x7, [x7, #0x8]
    5b44:      	cmp	x6, x7
    5b48:      	b.ne	0x5b78 <_stogir.terminal.validate+0xc4>
    5b4c:      	cmp	x4, x6
    5b50:      	b.gt	0x5ce4 <_stogir.terminal.validate+0x230>
    5b54:      	lsl	x4, x5, #2
    5b58:      	ldr	x6, [x0, #0x50]
    5b5c:      	add	x4, x4, x6
    5b60:      	ldr	w4, [x4]
    5b64:      	sxtw	x4, w4
    5b68:      	cmp	x4, #0x0
    5b6c:      	cset	w4, gt
    5b70:      	ubfx	x4, x4, #0, #8
    5b74:      	b	0x5ce8 <_stogir.terminal.validate+0x234>
    5b78:      	movz	x4, #0x0, lsl #48
    5b7c:      	b	0x5b8c <_stogir.terminal.validate+0xd8>
    5b80:      	movz	x4, #0x0, lsl #48
    5b84:      	b	0x5b8c <_stogir.terminal.validate+0xd8>
    5b88:      	movz	x4, #0x0, lsl #48
    5b8c:      	cmp	x4, #0x0
    5b90:      	b.eq	0x5bf4 <_stogir.terminal.validate+0x140>
    5b94:      	uxtb	w16, w3
    5b98:      	cmp	w16, wzr
    5b9c:      	b.eq	0x5bc4 <_stogir.terminal.validate+0x110>
    5ba0:      	lsl	x3, x1, #4
    5ba4:      	ldr	x4, [x0]
    5ba8:      	add	x3, x3, x4
    5bac:      	ldr	x4, [x3]
    5bb0:      	ldr	x3, [x3, #0x8]
    5bb4:      	fmov	d31, x3
    5bb8:      	mov	x3, x4
    5bbc:      	fmov	x4, d31
    5bc0:      	b	0x5be4 <_stogir.terminal.validate+0x130>
    5bc4:      	lsl	x3, x5, #4
    5bc8:      	ldr	x4, [x0, #0x28]
    5bcc:      	add	x3, x3, x4
    5bd0:      	ldr	x4, [x3]
    5bd4:      	ldr	x3, [x3, #0x8]
    5bd8:      	fmov	d31, x3
    5bdc:      	mov	x3, x4
    5be0:      	fmov	x4, d31
    5be4:      	mov	x5, x4
    5be8:      	mov	x4, x3
    5bec:      	mov	x3, #0x1                ; =1
    5bf0:      	b	0x5c00 <_stogir.terminal.validate+0x14c>
    5bf4:      	movz	x3, #0x0, lsl #48
    5bf8:      	movz	x4, #0x0, lsl #48
    5bfc:      	movz	x5, #0x0, lsl #48
    5c00:      	lsr	w3, w3, #0
    5c04:      	lsr	x16, x3, #0
    5c08:      	cmp	x16, #0x1
    5c0c:      	b.eq	0x5c28 <_stogir.terminal.validate+0x174>
    5c10:      	b.lo	0x5c18 <_stogir.terminal.validate+0x164>
    5c14:      	b	0x5c2c <_stogir.terminal.validate+0x178>
    5c18:      	cmp	x16, #0x0
    5c1c:      	b.eq	0x5c24 <_stogir.terminal.validate+0x170>
    5c20:      	b	0x5c2c <_stogir.terminal.validate+0x178>
    5c24:      	b	0x5c30 <_stogir.terminal.validate+0x17c>
    5c28:      	b	0x5c50 <_stogir.terminal.validate+0x19c>
    5c2c:      	b	0x5dc0 <_stogir.terminal.validate+0x30c>
    5c30:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005c30:  ARM64_RELOC_PAGE21	l_stogir.377
    5c34:      	ldr	x16, [x16]
		0000000000005c34:  ARM64_RELOC_PAGEOFF12	l_stogir.377
    5c38:      	orr	x0, x16, xzr
    5c3c:      	mov	x19, x8
    5c40:      	mov	x1, x0
    5c44:      	mov	x0, #0x1                ; =1
    5c48:      	mov	x2, #0x21               ; =33
    5c4c:      	b	0x5c84 <_stogir.terminal.validate+0x1d0>
    5c50:      	add	x16, sp, #0x10
    5c54:      	str	x4, [x16]
    5c58:      	add	x16, sp, #0x10
    5c5c:      	str	x5, [x16, #0x8]
    5c60:      	cmp	x1, #0x0
    5c64:      	b.gt	0x5cac <_stogir.terminal.validate+0x1f8>
    5c68:      	mov	x19, x8
    5c6c:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005c6c:  ARM64_RELOC_PAGE21	l_stogir.378
    5c70:      	ldr	x16, [x16]
		0000000000005c70:  ARM64_RELOC_PAGEOFF12	l_stogir.378
    5c74:      	orr	x0, x16, xzr
    5c78:      	mov	x1, x0
    5c7c:      	mov	x0, #0x1                ; =1
    5c80:      	mov	x2, #0x1b               ; =27
    5c84:      	str	x0, [x19]
    5c88:      	str	x1, [x19, #0x8]
    5c8c:      	str	x2, [x19, #0x10]
    5c90:      	ldr	x19, [sp, #0x40]
    5c94:      	ldr	x29, [sp]
    5c98:      	ldr	x30, [sp, #0x8]
    5c9c:      	add	sp, sp, #0x50
    5ca0:      	ret
    5ca4:      	movz	x4, #0x0, lsl #48
    5ca8:      	b	0x5b84 <_stogir.terminal.validate+0xd0>
    5cac:      	uxtb	w4, w4
    5cb0:      	orr	x1, x4, xzr
    5cb4:      	cmp	x1, #0x60
    5cb8:      	cset	w3, eq
    5cbc:      	cmp	x1, #0x79
    5cc0:      	cset	w1, eq
    5cc4:      	uxtb	w16, w3
    5cc8:      	cmp	w16, wzr
    5ccc:      	b.ne	0x5cec <_stogir.terminal.validate+0x238>
    5cd0:      	uxtb	w16, w1
    5cd4:      	cmp	w16, wzr
    5cd8:      	b.ne	0x5cec <_stogir.terminal.validate+0x238>
    5cdc:      	mov	x19, x8
    5ce0:      	b	0x5c6c <_stogir.terminal.validate+0x1b8>
    5ce4:      	movz	x4, #0x0, lsl #48
    5ce8:      	b	0x5b7c <_stogir.terminal.validate+0xc8>
    5cec:      	add	x16, sp, #0x10
    5cf0:      	ldr	w5, [x16]
    5cf4:      	ubfx	x5, x5, #8, #8
    5cf8:      	cmp	x5, #0x0
    5cfc:      	b.ne	0x5dc8 <_stogir.terminal.validate+0x314>
    5d00:      	uxtb	w16, w3
    5d04:      	cmp	w16, wzr
    5d08:      	mov	x16, #0x1               ; =1
    5d0c:      	mov	x17, #0x3               ; =3
    5d10:      	csel	x3, x16, x17, ne
    5d14:      	lsr	w3, w3, #0
    5d18:      	sxtw	x3, w3
    5d1c:      	ldr	x5, [x0, #0x78]
    5d20:      	add	x2, x2, x5
    5d24:      	ldr	w2, [x2]
    5d28:      	sxtw	x2, w2
    5d2c:      	cmp	x2, x3
    5d30:      	b.ne	0x5dd0 <_stogir.terminal.validate+0x31c>
    5d34:      	uxtb	w16, w1
    5d38:      	cmp	w16, wzr
    5d3c:      	b.eq	0x5d9c <_stogir.terminal.validate+0x2e8>
    5d40:      	add	x16, sp, #0x10
    5d44:      	ldr	w2, [x16, #0x8]
    5d48:      	sxtw	x2, w2
    5d4c:      	cmp	x2, #0x0
    5d50:      	b.eq	0x5d9c <_stogir.terminal.validate+0x2e8>
    5d54:      	mov	x19, x8
    5d58:      	b	0x5c6c <_stogir.terminal.validate+0x1b8>
    5d5c:      	movz	x1, #0x0, lsl #48
    5d60:      	lsr	w2, w2, #0
    5d64:      	lsr	w4, w4, #0
    5d68:      	lsr	w1, w1, #0
    5d6c:      	mov	w3, w1
    5d70:      	mov	w1, w4
    5d74:      	mov	x19, x8
    5d78:      	add	x8, sp, #0x20
    5d7c:      	bl	0x5d7c <_stogir.terminal.validate+0x2c8>
		0000000000005d7c:  ARM64_RELOC_BRANCH26	_stogir.terminal.inputs
    5d80:      	add	x16, sp, #0x20
    5d84:      	ldr	x0, [x16]
    5d88:      	add	x16, sp, #0x20
    5d8c:      	ldr	x1, [x16, #0x8]
    5d90:      	add	x16, sp, #0x20
    5d94:      	ldr	x2, [x16, #0x10]
    5d98:      	b	0x5c84 <_stogir.terminal.validate+0x1d0>
    5d9c:      	add	x16, sp, #0x10
    5da0:      	ldr	w2, [x16, #0x4]
    5da4:      	uxtb	w16, w1
    5da8:      	cmp	w16, wzr
    5dac:      	b.eq	0x5d5c <_stogir.terminal.validate+0x2a8>
    5db0:      	add	x16, sp, #0x10
    5db4:      	ldr	w1, [x16, #0xc]
    5db8:      	sxtw	x1, w1
    5dbc:      	b	0x5d60 <_stogir.terminal.validate+0x2ac>
    5dc0:      	brk	#0
    5dc4:      	b	0x5dc0 <_stogir.terminal.validate+0x30c>
    5dc8:      	mov	x19, x8
    5dcc:      	b	0x5c6c <_stogir.terminal.validate+0x1b8>
    5dd0:      	mov	x19, x8
    5dd4:      	b	0x5c6c <_stogir.terminal.validate+0x1b8>

0000000000005dd8 <_stogir.switch.operation?>:
    5dd8:      	sxtw	x0, w0
    5ddc:      	cmp	x0, #0x75
    5de0:      	b.ne	0x5df4 <_stogir.switch.operation?+0x1c>
    5de4:      	mov	x0, #0x1                ; =1
    5de8:      	b	0x5df0 <_stogir.switch.operation?+0x18>
    5dec:      	movz	x0, #0x0, lsl #48
    5df0:      	ret
    5df4:      	cmp	x0, #0x6d
    5df8:      	b.lt	0x5dec <_stogir.switch.operation?+0x14>
    5dfc:      	cmp	x0, #0x6f
    5e00:      	cset	w0, le
    5e04:      	ubfx	x0, x0, #0, #8
    5e08:      	b	0x5df0 <_stogir.switch.operation?+0x18>

0000000000005e0c <_stogir.switch.validate>:
    5e0c:      	sub	sp, sp, #0x70
    5e10:      	str	x29, [sp]
    5e14:      	str	x30, [sp, #0x8]
    5e18:      	mov	x29, sp
    5e1c:      	str	x19, [sp, #0x60]
    5e20:      	sxtw	x1, w1
    5e24:      	lsl	x2, x1, #2
    5e28:      	cmp	x1, #0x0
    5e2c:      	cset	w3, gt
    5e30:      	movz	x16, #0x0, lsl #48
    5e34:      	sub	x4, x16, x1
    5e38:      	sub	x5, x4, #0x1
    5e3c:      	uxtb	w16, w3
    5e40:      	cmp	w16, wzr
    5e44:      	b.eq	0x5e84 <_stogir.switch.validate+0x78>
    5e48:      	ldr	x4, [x0, #0x8]
    5e4c:      	cmp	x1, x4
    5e50:      	b.ge	0x5ed8 <_stogir.switch.validate+0xcc>
    5e54:      	add	x4, x0, #0x78
    5e58:      	ldr	x4, [x4, #0x8]
    5e5c:      	cmp	x1, x4
    5e60:      	b.ge	0x5ffc <_stogir.switch.validate+0x1f0>
    5e64:      	ldr	x4, [x0, #0x78]
    5e68:      	add	x4, x2, x4
    5e6c:      	ldr	w4, [x4]
    5e70:      	sxtw	x4, w4
    5e74:      	cmp	x4, #0x0
    5e78:      	cset	w4, ge
    5e7c:      	ubfx	x4, x4, #0, #8
    5e80:      	b	0x6000 <_stogir.switch.validate+0x1f4>
    5e84:      	cmp	x1, #0x0
    5e88:      	b.ge	0x5ee0 <_stogir.switch.validate+0xd4>
    5e8c:      	add	x6, x0, #0x28
    5e90:      	add	x7, x0, #0x50
    5e94:      	ldr	x6, [x6, #0x8]
    5e98:      	ldr	x7, [x7, #0x8]
    5e9c:      	cmp	x6, x7
    5ea0:      	b.ne	0x5ed0 <_stogir.switch.validate+0xc4>
    5ea4:      	cmp	x4, x6
    5ea8:      	b.gt	0x6038 <_stogir.switch.validate+0x22c>
    5eac:      	lsl	x4, x5, #2
    5eb0:      	ldr	x6, [x0, #0x50]
    5eb4:      	add	x4, x4, x6
    5eb8:      	ldr	w4, [x4]
    5ebc:      	sxtw	x4, w4
    5ec0:      	cmp	x4, #0x0
    5ec4:      	cset	w4, gt
    5ec8:      	ubfx	x4, x4, #0, #8
    5ecc:      	b	0x603c <_stogir.switch.validate+0x230>
    5ed0:      	movz	x4, #0x0, lsl #48
    5ed4:      	b	0x5ee4 <_stogir.switch.validate+0xd8>
    5ed8:      	movz	x4, #0x0, lsl #48
    5edc:      	b	0x5ee4 <_stogir.switch.validate+0xd8>
    5ee0:      	movz	x4, #0x0, lsl #48
    5ee4:      	cmp	x4, #0x0
    5ee8:      	b.eq	0x5f4c <_stogir.switch.validate+0x140>
    5eec:      	uxtb	w16, w3
    5ef0:      	cmp	w16, wzr
    5ef4:      	b.eq	0x5f1c <_stogir.switch.validate+0x110>
    5ef8:      	lsl	x3, x1, #4
    5efc:      	ldr	x4, [x0]
    5f00:      	add	x3, x3, x4
    5f04:      	ldr	x4, [x3]
    5f08:      	ldr	x3, [x3, #0x8]
    5f0c:      	fmov	d31, x3
    5f10:      	mov	x3, x4
    5f14:      	fmov	x4, d31
    5f18:      	b	0x5f3c <_stogir.switch.validate+0x130>
    5f1c:      	lsl	x3, x5, #4
    5f20:      	ldr	x4, [x0, #0x28]
    5f24:      	add	x3, x3, x4
    5f28:      	ldr	x4, [x3]
    5f2c:      	ldr	x3, [x3, #0x8]
    5f30:      	fmov	d31, x3
    5f34:      	mov	x3, x4
    5f38:      	fmov	x4, d31
    5f3c:      	mov	x5, x4
    5f40:      	mov	x4, x3
    5f44:      	mov	x3, #0x1                ; =1
    5f48:      	b	0x5f58 <_stogir.switch.validate+0x14c>
    5f4c:      	movz	x3, #0x0, lsl #48
    5f50:      	movz	x4, #0x0, lsl #48
    5f54:      	movz	x5, #0x0, lsl #48
    5f58:      	lsr	w3, w3, #0
    5f5c:      	lsr	x16, x3, #0
    5f60:      	cmp	x16, #0x1
    5f64:      	b.eq	0x5f80 <_stogir.switch.validate+0x174>
    5f68:      	b.lo	0x5f70 <_stogir.switch.validate+0x164>
    5f6c:      	b	0x5f84 <_stogir.switch.validate+0x178>
    5f70:      	cmp	x16, #0x0
    5f74:      	b.eq	0x5f7c <_stogir.switch.validate+0x170>
    5f78:      	b	0x5f84 <_stogir.switch.validate+0x178>
    5f7c:      	b	0x5f88 <_stogir.switch.validate+0x17c>
    5f80:      	b	0x5fa8 <_stogir.switch.validate+0x19c>
    5f84:      	b	0x613c <_stogir.switch.validate+0x330>
    5f88:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005f88:  ARM64_RELOC_PAGE21	l_stogir.379
    5f8c:      	ldr	x16, [x16]
		0000000000005f8c:  ARM64_RELOC_PAGEOFF12	l_stogir.379
    5f90:      	orr	x0, x16, xzr
    5f94:      	mov	x19, x8
    5f98:      	mov	x1, x0
    5f9c:      	mov	x0, #0x1                ; =1
    5fa0:      	mov	x2, #0x1a               ; =26
    5fa4:      	b	0x5fdc <_stogir.switch.validate+0x1d0>
    5fa8:      	add	x16, sp, #0x10
    5fac:      	str	x4, [x16]
    5fb0:      	add	x16, sp, #0x10
    5fb4:      	str	x5, [x16, #0x8]
    5fb8:      	cmp	x1, #0x0
    5fbc:      	b.gt	0x6004 <_stogir.switch.validate+0x1f8>
    5fc0:      	mov	x19, x8
    5fc4:      	adrp	x16, 0x5000 <_stogir.checked.validate+0x520>
		0000000000005fc4:  ARM64_RELOC_PAGE21	l_stogir.380
    5fc8:      	ldr	x16, [x16]
		0000000000005fc8:  ARM64_RELOC_PAGEOFF12	l_stogir.380
    5fcc:      	orr	x0, x16, xzr
    5fd0:      	mov	x1, x0
    5fd4:      	mov	x0, #0x1                ; =1
    5fd8:      	mov	x2, #0x20               ; =32
    5fdc:      	str	x0, [x19]
    5fe0:      	str	x1, [x19, #0x8]
    5fe4:      	str	x2, [x19, #0x10]
    5fe8:      	ldr	x19, [sp, #0x60]
    5fec:      	ldr	x29, [sp]
    5ff0:      	ldr	x30, [sp, #0x8]
    5ff4:      	add	sp, sp, #0x70
    5ff8:      	ret
    5ffc:      	movz	x4, #0x0, lsl #48
    6000:      	b	0x5edc <_stogir.switch.validate+0xd0>
    6004:      	uxtb	w4, w4
    6008:      	orr	x1, x4, xzr
    600c:      	cmp	x1, #0x75
    6010:      	cset	w3, eq
    6014:      	uxtb	w16, w3
    6018:      	cmp	w16, wzr
    601c:      	b.ne	0x6040 <_stogir.switch.validate+0x234>
    6020:      	cmp	x1, #0x6d
    6024:      	b.lt	0x6144 <_stogir.switch.validate+0x338>
    6028:      	cmp	x1, #0x6f
    602c:      	b.le	0x6040 <_stogir.switch.validate+0x234>
    6030:      	mov	x19, x8
    6034:      	b	0x5fc4 <_stogir.switch.validate+0x1b8>
    6038:      	movz	x4, #0x0, lsl #48
    603c:      	b	0x5ed4 <_stogir.switch.validate+0xc8>
    6040:      	add	x16, sp, #0x10
    6044:      	ldr	w5, [x16]
    6048:      	ubfx	x5, x5, #8, #8
    604c:      	cmp	x5, #0x0
    6050:      	b.ne	0x614c <_stogir.switch.validate+0x340>
    6054:      	ldr	x5, [x0, #0x78]
    6058:      	add	x2, x2, x5
    605c:      	ldr	w2, [x2]
    6060:      	cmp	x1, #0x6d
    6064:      	b.eq	0x60d8 <_stogir.switch.validate+0x2cc>
    6068:      	cmp	x1, #0x6e
    606c:      	b.eq	0x60d8 <_stogir.switch.validate+0x2cc>
    6070:      	mov	x1, #0x2                ; =2
    6074:      	b	0x60dc <_stogir.switch.validate+0x2d0>
    6078:      	lsr	w4, w4, #0
    607c:      	add	x16, sp, #0x10
    6080:      	ldr	w1, [x16, #0x4]
    6084:      	add	x16, sp, #0x10
    6088:      	ldr	w2, [x16, #0x8]
    608c:      	lsr	w1, w1, #0
    6090:      	add	x16, sp, #0x10
    6094:      	ldr	w3, [x16, #0xc]
    6098:      	lsr	w2, w2, #0
    609c:      	lsr	w3, w3, #0
    60a0:      	add	x8, sp, #0x40
    60a4:      	fmov	s31, w1
    60a8:      	mov	w1, w4
    60ac:      	mov	w4, w3
    60b0:      	mov	w3, w2
    60b4:      	fmov	w2, s31
    60b8:      	bl	0x60b8 <_stogir.switch.validate+0x2ac>
		00000000000060b8:  ARM64_RELOC_BRANCH26	_stogir.switch.case-inputs
    60bc:      	add	x16, sp, #0x40
    60c0:      	ldr	x0, [x16]
    60c4:      	add	x16, sp, #0x40
    60c8:      	ldr	x1, [x16, #0x8]
    60cc:      	add	x16, sp, #0x40
    60d0:      	ldr	x2, [x16, #0x10]
    60d4:      	b	0x5fdc <_stogir.switch.validate+0x1d0>
    60d8:      	mov	x1, #0x3                ; =3
    60dc:      	sxtw	x2, w2
    60e0:      	lsr	w1, w1, #0
    60e4:      	sxtw	x1, w1
    60e8:      	cmp	x2, x1
    60ec:      	b.ne	0x6154 <_stogir.switch.validate+0x348>
    60f0:      	uxtb	w16, w3
    60f4:      	cmp	w16, wzr
    60f8:      	b.eq	0x615c <_stogir.switch.validate+0x350>
    60fc:      	add	x16, sp, #0x10
    6100:      	ldr	w1, [x16, #0x4]
    6104:      	add	x16, sp, #0x10
    6108:      	ldr	w2, [x16, #0x8]
    610c:      	lsr	w1, w1, #0
    6110:      	lsr	w2, w2, #0
    6114:      	mov	x19, x8
    6118:      	add	x8, sp, #0x20
    611c:      	bl	0x611c <_stogir.switch.validate+0x310>
		000000000000611c:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    6120:      	add	x16, sp, #0x20
    6124:      	ldr	x0, [x16]
    6128:      	add	x16, sp, #0x20
    612c:      	ldr	x1, [x16, #0x8]
    6130:      	add	x16, sp, #0x20
    6134:      	ldr	x2, [x16, #0x10]
    6138:      	b	0x60d4 <_stogir.switch.validate+0x2c8>
    613c:      	brk	#0
    6140:      	b	0x613c <_stogir.switch.validate+0x330>
    6144:      	mov	x19, x8
    6148:      	b	0x5fc4 <_stogir.switch.validate+0x1b8>
    614c:      	mov	x19, x8
    6150:      	b	0x5fc4 <_stogir.switch.validate+0x1b8>
    6154:      	mov	x19, x8
    6158:      	b	0x5fc4 <_stogir.switch.validate+0x1b8>
    615c:      	mov	x19, x8
    6160:      	b	0x6078 <_stogir.switch.validate+0x26c>

0000000000006164 <_stogir.stack.operation?>:
    6164:      	sxtw	x0, w0
    6168:      	cmp	x0, #0x42
    616c:      	b.ne	0x6188 <_stogir.stack.operation?+0x24>
    6170:      	mov	x0, #0x1                ; =1
    6174:      	b	0x6184 <_stogir.stack.operation?+0x20>
    6178:      	cmp	x0, #0x54
    617c:      	cset	w0, eq
    6180:      	ubfx	x0, x0, #0, #8
    6184:      	ret
    6188:      	cmp	x0, #0x51
    618c:      	b.ne	0x6198 <_stogir.stack.operation?+0x34>
    6190:      	mov	x0, #0x1                ; =1
    6194:      	b	0x6184 <_stogir.stack.operation?+0x20>
    6198:      	cmp	x0, #0x52
    619c:      	b.ne	0x61a8 <_stogir.stack.operation?+0x44>
    61a0:      	mov	x0, #0x1                ; =1
    61a4:      	b	0x6184 <_stogir.stack.operation?+0x20>
    61a8:      	cmp	x0, #0x53
    61ac:      	b.ne	0x6178 <_stogir.stack.operation?+0x14>
    61b0:      	mov	x0, #0x1                ; =1
    61b4:      	b	0x6184 <_stogir.stack.operation?+0x20>

00000000000061b8 <_stogir.stack.validate>:
    61b8:      	sub	sp, sp, #0x70
    61bc:      	str	x29, [sp]
    61c0:      	str	x30, [sp, #0x8]
    61c4:      	mov	x29, sp
    61c8:      	str	x19, [sp, #0x60]
    61cc:      	sxtw	x1, w1
    61d0:      	lsl	x2, x1, #2
    61d4:      	cmp	x1, #0x0
    61d8:      	cset	w3, gt
    61dc:      	movz	x16, #0x0, lsl #48
    61e0:      	sub	x4, x16, x1
    61e4:      	cmp	x1, #0x0
    61e8:      	cset	w5, lt
    61ec:      	sub	x6, x4, #0x1
    61f0:      	lsl	x7, x6, #2
    61f4:      	uxtb	w16, w3
    61f8:      	cmp	w16, wzr
    61fc:      	b.eq	0x623c <_stogir.stack.validate+0x84>
    6200:      	ldr	x9, [x0, #0x8]
    6204:      	cmp	x1, x9
    6208:      	b.ge	0x62bc <_stogir.stack.validate+0x104>
    620c:      	add	x9, x0, #0x78
    6210:      	ldr	x9, [x9, #0x8]
    6214:      	cmp	x1, x9
    6218:      	b.ge	0x6418 <_stogir.stack.validate+0x260>
    621c:      	ldr	x9, [x0, #0x78]
    6220:      	add	x9, x2, x9
    6224:      	ldr	w9, [x9]
    6228:      	sxtw	x9, w9
    622c:      	cmp	x9, #0x0
    6230:      	cset	w9, ge
    6234:      	ubfx	x9, x9, #0, #8
    6238:      	b	0x641c <_stogir.stack.validate+0x264>
    623c:      	uxtb	w16, w5
    6240:      	cmp	w16, wzr
    6244:      	b.eq	0x62c4 <_stogir.stack.validate+0x10c>
    6248:      	add	x9, x0, #0x28
    624c:      	add	x10, x0, #0x50
    6250:      	ldr	x9, [x9, #0x8]
    6254:      	ldr	x10, [x10, #0x8]
    6258:      	cmp	x9, x10
    625c:      	b.ne	0x6288 <_stogir.stack.validate+0xd0>
    6260:      	cmp	x4, x9
    6264:      	b.gt	0x6420 <_stogir.stack.validate+0x268>
    6268:      	ldr	x9, [x0, #0x50]
    626c:      	add	x9, x7, x9
    6270:      	ldr	w9, [x9]
    6274:      	sxtw	x9, w9
    6278:      	cmp	x9, #0x0
    627c:      	cset	w9, gt
    6280:      	ubfx	x9, x9, #0, #8
    6284:      	b	0x6424 <_stogir.stack.validate+0x26c>
    6288:      	movz	x9, #0x0, lsl #48
    628c:      	b	0x62c8 <_stogir.stack.validate+0x110>
    6290:      	uxtb	w16, w9
    6294:      	cmp	w16, wzr
    6298:      	b.eq	0x6448 <_stogir.stack.validate+0x290>
    629c:      	mov	x19, x8
    62a0:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		00000000000062a0:  ARM64_RELOC_PAGE21	l_stogir.381
    62a4:      	ldr	x16, [x16]
		00000000000062a4:  ARM64_RELOC_PAGEOFF12	l_stogir.381
    62a8:      	orr	x0, x16, xzr
    62ac:      	mov	x1, x0
    62b0:      	mov	x0, #0x1                ; =1
    62b4:      	mov	x2, #0x19               ; =25
    62b8:      	b	0x6388 <_stogir.stack.validate+0x1d0>
    62bc:      	movz	x9, #0x0, lsl #48
    62c0:      	b	0x62c8 <_stogir.stack.validate+0x110>
    62c4:      	movz	x9, #0x0, lsl #48
    62c8:      	lsl	x10, x1, #4
    62cc:      	lsl	x6, x6, #4
    62d0:      	cmp	x9, #0x0
    62d4:      	b.eq	0x6330 <_stogir.stack.validate+0x178>
    62d8:      	uxtb	w16, w3
    62dc:      	cmp	w16, wzr
    62e0:      	b.eq	0x6304 <_stogir.stack.validate+0x14c>
    62e4:      	ldr	x9, [x0]
    62e8:      	add	x9, x10, x9
    62ec:      	ldr	x11, [x9]
    62f0:      	ldr	x9, [x9, #0x8]
    62f4:      	fmov	d31, x9
    62f8:      	mov	x9, x11
    62fc:      	fmov	x11, d31
    6300:      	b	0x6320 <_stogir.stack.validate+0x168>
    6304:      	ldr	x9, [x0, #0x28]
    6308:      	add	x9, x6, x9
    630c:      	ldr	x11, [x9]
    6310:      	ldr	x9, [x9, #0x8]
    6314:      	fmov	d31, x9
    6318:      	mov	x9, x11
    631c:      	fmov	x11, d31
    6320:      	mov	x12, x11
    6324:      	mov	x11, x9
    6328:      	mov	x9, #0x1                ; =1
    632c:      	b	0x633c <_stogir.stack.validate+0x184>
    6330:      	movz	x9, #0x0, lsl #48
    6334:      	movz	x11, #0x0, lsl #48
    6338:      	movz	x12, #0x0, lsl #48
    633c:      	lsr	w9, w9, #0
    6340:      	lsr	x16, x9, #0
    6344:      	cmp	x16, #0x1
    6348:      	b.eq	0x6364 <_stogir.stack.validate+0x1ac>
    634c:      	b.lo	0x6354 <_stogir.stack.validate+0x19c>
    6350:      	b	0x6368 <_stogir.stack.validate+0x1b0>
    6354:      	cmp	x16, #0x0
    6358:      	b.eq	0x6360 <_stogir.stack.validate+0x1a8>
    635c:      	b	0x6368 <_stogir.stack.validate+0x1b0>
    6360:      	b	0x636c <_stogir.stack.validate+0x1b4>
    6364:      	b	0x63a8 <_stogir.stack.validate+0x1f0>
    6368:      	b	0x6718 <_stogir.stack.validate+0x560>
    636c:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		000000000000636c:  ARM64_RELOC_PAGE21	l_stogir.382
    6370:      	ldr	x16, [x16]
		0000000000006370:  ARM64_RELOC_PAGEOFF12	l_stogir.382
    6374:      	orr	x0, x16, xzr
    6378:      	mov	x19, x8
    637c:      	mov	x1, x0
    6380:      	mov	x0, #0x1                ; =1
    6384:      	mov	x2, #0x19               ; =25
    6388:      	str	x0, [x19]
    638c:      	str	x1, [x19, #0x8]
    6390:      	str	x2, [x19, #0x10]
    6394:      	ldr	x19, [sp, #0x60]
    6398:      	ldr	x29, [sp]
    639c:      	ldr	x30, [sp, #0x8]
    63a0:      	add	sp, sp, #0x70
    63a4:      	ret
    63a8:      	cmp	x1, #0x0
    63ac:      	cset	w9, le
    63b0:      	uxtb	w13, w11
    63b4:      	add	x16, sp, #0x10
    63b8:      	str	x11, [x16]
    63bc:      	orr	x11, x13, xzr
    63c0:      	add	x16, sp, #0x10
    63c4:      	str	x12, [x16, #0x8]
    63c8:      	cmp	x11, #0x42
    63cc:      	b.ne	0x6290 <_stogir.stack.validate+0xd8>
    63d0:      	uxtb	w16, w3
    63d4:      	cmp	w16, wzr
    63d8:      	b.eq	0x6494 <_stogir.stack.validate+0x2dc>
    63dc:      	ldr	x4, [x0, #0x8]
    63e0:      	cmp	x1, x4
    63e4:      	b.ge	0x64e0 <_stogir.stack.validate+0x328>
    63e8:      	add	x4, x0, #0x78
    63ec:      	ldr	x4, [x4, #0x8]
    63f0:      	cmp	x1, x4
    63f4:      	b.ge	0x65d4 <_stogir.stack.validate+0x41c>
    63f8:      	ldr	x1, [x0, #0x78]
    63fc:      	add	x1, x2, x1
    6400:      	ldr	w1, [x1]
    6404:      	sxtw	x1, w1
    6408:      	cmp	x1, #0x0
    640c:      	cset	w1, ge
    6410:      	ubfx	x1, x1, #0, #8
    6414:      	b	0x65d8 <_stogir.stack.validate+0x420>
    6418:      	movz	x9, #0x0, lsl #48
    641c:      	b	0x62c0 <_stogir.stack.validate+0x108>
    6420:      	movz	x9, #0x0, lsl #48
    6424:      	b	0x628c <_stogir.stack.validate+0xd4>
    6428:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		0000000000006428:  ARM64_RELOC_PAGE21	l_stogir.383
    642c:      	ldr	x16, [x16]
		000000000000642c:  ARM64_RELOC_PAGEOFF12	l_stogir.383
    6430:      	orr	x0, x16, xzr
    6434:      	mov	x1, x0
    6438:      	mov	x0, #0x1                ; =1
    643c:      	mov	x2, #0x1e               ; =30
    6440:      	mov	x19, x8
    6444:      	b	0x62b8 <_stogir.stack.validate+0x100>
    6448:      	cmp	x11, #0x51
    644c:      	cset	w1, eq
    6450:      	cmp	x11, #0x53
    6454:      	cset	w3, eq
    6458:      	cmp	x11, #0x54
    645c:      	cset	w4, eq
    6460:      	uxtb	w16, w1
    6464:      	cmp	w16, wzr
    6468:      	b.ne	0x65dc <_stogir.stack.validate+0x424>
    646c:      	cmp	x11, #0x52
    6470:      	b.eq	0x65dc <_stogir.stack.validate+0x424>
    6474:      	uxtb	w16, w3
    6478:      	cmp	w16, wzr
    647c:      	b.ne	0x65dc <_stogir.stack.validate+0x424>
    6480:      	uxtb	w16, w4
    6484:      	cmp	w16, wzr
    6488:      	b.ne	0x65dc <_stogir.stack.validate+0x424>
    648c:      	mov	x19, x8
    6490:      	b	0x62a0 <_stogir.stack.validate+0xe8>
    6494:      	uxtb	w16, w5
    6498:      	cmp	w16, wzr
    649c:      	b.eq	0x64e8 <_stogir.stack.validate+0x330>
    64a0:      	add	x1, x0, #0x28
    64a4:      	add	x5, x0, #0x50
    64a8:      	ldr	x1, [x1, #0x8]
    64ac:      	ldr	x5, [x5, #0x8]
    64b0:      	cmp	x1, x5
    64b4:      	b.ne	0x65cc <_stogir.stack.validate+0x414>
    64b8:      	cmp	x4, x1
    64bc:      	b.gt	0x6694 <_stogir.stack.validate+0x4dc>
    64c0:      	ldr	x1, [x0, #0x50]
    64c4:      	add	x1, x7, x1
    64c8:      	ldr	w1, [x1]
    64cc:      	sxtw	x1, w1
    64d0:      	cmp	x1, #0x0
    64d4:      	cset	w1, gt
    64d8:      	ubfx	x1, x1, #0, #8
    64dc:      	b	0x6698 <_stogir.stack.validate+0x4e0>
    64e0:      	movz	x1, #0x0, lsl #48
    64e4:      	b	0x64ec <_stogir.stack.validate+0x334>
    64e8:      	movz	x1, #0x0, lsl #48
    64ec:      	cmp	x1, #0x0
    64f0:      	b.eq	0x6528 <_stogir.stack.validate+0x370>
    64f4:      	uxtb	w16, w3
    64f8:      	cmp	w16, wzr
    64fc:      	b.eq	0x6510 <_stogir.stack.validate+0x358>
    6500:      	ldr	x1, [x0]
    6504:      	add	x1, x10, x1
    6508:      	ldr	x1, [x1]
    650c:      	b	0x651c <_stogir.stack.validate+0x364>
    6510:      	ldr	x1, [x0, #0x28]
    6514:      	add	x1, x6, x1
    6518:      	ldr	x1, [x1]
    651c:      	mov	x3, x1
    6520:      	mov	x1, #0x1                ; =1
    6524:      	b	0x6530 <_stogir.stack.validate+0x378>
    6528:      	movz	x1, #0x0, lsl #48
    652c:      	movz	x3, #0x0, lsl #48
    6530:      	lsr	w1, w1, #0
    6534:      	lsr	x16, x1, #0
    6538:      	cmp	x16, #0x1
    653c:      	b.eq	0x6558 <_stogir.stack.validate+0x3a0>
    6540:      	b.lo	0x6548 <_stogir.stack.validate+0x390>
    6544:      	b	0x655c <_stogir.stack.validate+0x3a4>
    6548:      	cmp	x16, #0x0
    654c:      	b.eq	0x6554 <_stogir.stack.validate+0x39c>
    6550:      	b	0x655c <_stogir.stack.validate+0x3a4>
    6554:      	b	0x6560 <_stogir.stack.validate+0x3a8>
    6558:      	b	0x657c <_stogir.stack.validate+0x3c4>
    655c:      	b	0x6720 <_stogir.stack.validate+0x568>
    6560:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		0000000000006560:  ARM64_RELOC_PAGE21	l_stogir.384
    6564:      	ldr	x16, [x16]
		0000000000006564:  ARM64_RELOC_PAGEOFF12	l_stogir.384
    6568:      	orr	x0, x16, xzr
    656c:      	mov	x1, x0
    6570:      	mov	x0, #0x1                ; =1
    6574:      	mov	x2, #0x21               ; =33
    6578:      	b	0x6440 <_stogir.stack.validate+0x288>
    657c:      	uxtb	w16, w9
    6580:      	cmp	w16, wzr
    6584:      	b.ne	0x6428 <_stogir.stack.validate+0x270>
    6588:      	uxtb	w1, w3
    658c:      	cmp	x1, #0x42
    6590:      	b.ne	0x6428 <_stogir.stack.validate+0x270>
    6594:      	lsr	w3, w3, #0
    6598:      	ubfx	x1, x3, #8, #8
    659c:      	cmp	x1, #0x6
    65a0:      	b.ne	0x6428 <_stogir.stack.validate+0x270>
    65a4:      	ldr	x0, [x0, #0x78]
    65a8:      	add	x0, x2, x0
    65ac:      	ldr	w0, [x0]
    65b0:      	sxtw	x0, w0
    65b4:      	cmp	x0, #0x0
    65b8:      	b.ne	0x6428 <_stogir.stack.validate+0x270>
    65bc:      	movz	x0, #0x0, lsl #48
    65c0:      	mov	x1, #0x8                ; =8
    65c4:      	movz	x2, #0x0, lsl #48
    65c8:      	b	0x6440 <_stogir.stack.validate+0x288>
    65cc:      	movz	x1, #0x0, lsl #48
    65d0:      	b	0x64ec <_stogir.stack.validate+0x334>
    65d4:      	movz	x1, #0x0, lsl #48
    65d8:      	b	0x64e4 <_stogir.stack.validate+0x32c>
    65dc:      	ldr	x5, [x0, #0x78]
    65e0:      	add	x2, x2, x5
    65e4:      	ldr	w2, [x2]
    65e8:      	uxtb	w16, w1
    65ec:      	cmp	w16, wzr
    65f0:      	b.eq	0x65fc <_stogir.stack.validate+0x444>
    65f4:      	mov	x1, #0x3                ; =3
    65f8:      	b	0x6610 <_stogir.stack.validate+0x458>
    65fc:      	uxtb	w16, w3
    6600:      	cmp	w16, wzr
    6604:      	mov	x16, #0x1               ; =1
    6608:      	mov	x17, #0x2               ; =2
    660c:      	csel	x1, x16, x17, ne
    6610:      	sxtw	x2, w2
    6614:      	lsr	w1, w1, #0
    6618:      	sxtw	x1, w1
    661c:      	cmp	x2, x1
    6620:      	b.ne	0x6728 <_stogir.stack.validate+0x570>
    6624:      	lsr	w13, w13, #0
    6628:      	uxtb	w16, w3
    662c:      	cmp	w16, wzr
    6630:      	b.eq	0x669c <_stogir.stack.validate+0x4e4>
    6634:      	mov	x19, x8
    6638:      	add	x16, sp, #0x10
    663c:      	ldr	w1, [x16]
    6640:      	add	x16, sp, #0x10
    6644:      	ldr	w2, [x16, #0x4]
    6648:      	add	x16, sp, #0x10
    664c:      	ldr	w3, [x16, #0x8]
    6650:      	lsr	w2, w2, #0
    6654:      	ubfx	x1, x1, #8, #8
    6658:      	lsr	w3, w3, #0
    665c:      	lsr	w1, w1, #0
    6660:      	add	x8, sp, #0x20
    6664:      	mov	w4, w3
    6668:      	mov	w3, w2
    666c:      	mov	w2, w1
    6670:      	mov	w1, w13
    6674:      	bl	0x6674 <_stogir.stack.validate+0x4bc>
		0000000000006674:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-scope-inputs
    6678:      	add	x16, sp, #0x20
    667c:      	ldr	x0, [x16]
    6680:      	add	x16, sp, #0x20
    6684:      	ldr	x1, [x16, #0x8]
    6688:      	add	x16, sp, #0x20
    668c:      	ldr	x2, [x16, #0x10]
    6690:      	b	0x62b8 <_stogir.stack.validate+0x100>
    6694:      	movz	x1, #0x0, lsl #48
    6698:      	b	0x65d0 <_stogir.stack.validate+0x418>
    669c:      	uxtb	w16, w4
    66a0:      	cmp	w16, wzr
    66a4:      	b.ne	0x6730 <_stogir.stack.validate+0x578>
    66a8:      	add	x16, sp, #0x10
    66ac:      	ldr	w1, [x16]
    66b0:      	add	x16, sp, #0x10
    66b4:      	ldr	w2, [x16, #0x4]
    66b8:      	add	x16, sp, #0x10
    66bc:      	ldr	w3, [x16, #0x8]
    66c0:      	lsr	w2, w2, #0
    66c4:      	ubfx	x1, x1, #8, #8
    66c8:      	add	x16, sp, #0x10
    66cc:      	ldr	w4, [x16, #0xc]
    66d0:      	lsr	w3, w3, #0
    66d4:      	lsr	w4, w4, #0
    66d8:      	lsr	w1, w1, #0
    66dc:      	mov	w5, w4
    66e0:      	mov	w4, w3
    66e4:      	mov	w3, w2
    66e8:      	mov	w2, w1
    66ec:      	mov	w1, w13
    66f0:      	mov	x19, x8
    66f4:      	add	x8, sp, #0x40
    66f8:      	bl	0x66f8 <_stogir.stack.validate+0x540>
		00000000000066f8:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-inputs
    66fc:      	add	x16, sp, #0x40
    6700:      	ldr	x0, [x16]
    6704:      	add	x16, sp, #0x40
    6708:      	ldr	x1, [x16, #0x8]
    670c:      	add	x16, sp, #0x40
    6710:      	ldr	x2, [x16, #0x10]
    6714:      	b	0x6690 <_stogir.stack.validate+0x4d8>
    6718:      	brk	#0
    671c:      	b	0x6718 <_stogir.stack.validate+0x560>
    6720:      	brk	#0
    6724:      	b	0x6720 <_stogir.stack.validate+0x568>
    6728:      	mov	x19, x8
    672c:      	b	0x62a0 <_stogir.stack.validate+0xe8>
    6730:      	mov	x19, x8
    6734:      	b	0x6638 <_stogir.stack.validate+0x480>

0000000000006738 <_stogir.locals.operation?>:
    6738:      	sxtw	x0, w0
    673c:      	cmp	x0, #0x41
    6740:      	b.ne	0x6754 <_stogir.locals.operation?+0x1c>
    6744:      	mov	x0, #0x1                ; =1
    6748:      	b	0x6750 <_stogir.locals.operation?+0x18>
    674c:      	movz	x0, #0x0, lsl #48
    6750:      	ret
    6754:      	cmp	x0, #0x48
    6758:      	b.ne	0x6764 <_stogir.locals.operation?+0x2c>
    675c:      	mov	x0, #0x1                ; =1
    6760:      	b	0x6750 <_stogir.locals.operation?+0x18>
    6764:      	cmp	x0, #0x55
    6768:      	b.lt	0x674c <_stogir.locals.operation?+0x14>
    676c:      	cmp	x0, #0x58
    6770:      	cset	w0, le
    6774:      	ubfx	x0, x0, #0, #8
    6778:      	b	0x6750 <_stogir.locals.operation?+0x18>

000000000000677c <_stogir.locals.validate>:
    677c:      	sub	sp, sp, #0xb0
    6780:      	str	x29, [sp]
    6784:      	str	x30, [sp, #0x8]
    6788:      	mov	x29, sp
    678c:      	str	x19, [sp, #0x70]
    6790:      	str	x20, [sp, #0x78]
    6794:      	str	x21, [sp, #0x80]
    6798:      	str	x22, [sp, #0x88]
    679c:      	str	x23, [sp, #0x90]
    67a0:      	str	x24, [sp, #0x98]
    67a4:      	str	x25, [sp, #0xa0]
    67a8:      	sxtw	x1, w1
    67ac:      	lsl	x3, x1, #2
    67b0:      	cmp	x1, #0x0
    67b4:      	cset	w4, gt
    67b8:      	movz	x16, #0x0, lsl #48
    67bc:      	sub	x5, x16, x1
    67c0:      	sub	x6, x5, #0x1
    67c4:      	uxtb	w16, w4
    67c8:      	cmp	w16, wzr
    67cc:      	b.eq	0x680c <_stogir.locals.validate+0x90>
    67d0:      	ldr	x5, [x0, #0x8]
    67d4:      	cmp	x1, x5
    67d8:      	b.ge	0x68ac <_stogir.locals.validate+0x130>
    67dc:      	add	x5, x0, #0x78
    67e0:      	ldr	x5, [x5, #0x8]
    67e4:      	cmp	x1, x5
    67e8:      	b.ge	0x69d4 <_stogir.locals.validate+0x258>
    67ec:      	ldr	x5, [x0, #0x78]
    67f0:      	add	x5, x3, x5
    67f4:      	ldr	w5, [x5]
    67f8:      	sxtw	x5, w5
    67fc:      	cmp	x5, #0x0
    6800:      	cset	w5, ge
    6804:      	ubfx	x5, x5, #0, #8
    6808:      	b	0x69d8 <_stogir.locals.validate+0x25c>
    680c:      	cmp	x1, #0x0
    6810:      	b.ge	0x68b4 <_stogir.locals.validate+0x138>
    6814:      	add	x7, x0, #0x28
    6818:      	add	x9, x0, #0x50
    681c:      	ldr	x7, [x7, #0x8]
    6820:      	ldr	x9, [x9, #0x8]
    6824:      	cmp	x7, x9
    6828:      	b.ne	0x6858 <_stogir.locals.validate+0xdc>
    682c:      	cmp	x5, x7
    6830:      	b.gt	0x6a5c <_stogir.locals.validate+0x2e0>
    6834:      	lsl	x5, x6, #2
    6838:      	ldr	x7, [x0, #0x50]
    683c:      	add	x5, x5, x7
    6840:      	ldr	w5, [x5]
    6844:      	sxtw	x5, w5
    6848:      	cmp	x5, #0x0
    684c:      	cset	w5, gt
    6850:      	ubfx	x5, x5, #0, #8
    6854:      	b	0x6a60 <_stogir.locals.validate+0x2e4>
    6858:      	movz	x5, #0x0, lsl #48
    685c:      	b	0x68b8 <_stogir.locals.validate+0x13c>
    6860:      	cmp	x5, #0x0
    6864:      	cset	w5, ne
    6868:      	uxtb	w16, w5
    686c:      	cmp	w16, wzr
    6870:      	mov	x16, #0x2               ; =2
    6874:      	mov	x17, #0x3               ; =3
    6878:      	csel	x5, x16, x17, ne
    687c:      	lsr	w5, w5, #0
    6880:      	sxtw	x5, w5
    6884:      	cmp	x1, #0x0
    6888:      	b.gt	0x69dc <_stogir.locals.validate+0x260>
    688c:      	mov	x23, x8
    6890:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		0000000000006890:  ARM64_RELOC_PAGE21	l_stogir.385
    6894:      	ldr	x16, [x16]
		0000000000006894:  ARM64_RELOC_PAGEOFF12	l_stogir.385
    6898:      	orr	x0, x16, xzr
    689c:      	mov	x1, x0
    68a0:      	mov	x0, #0x1                ; =1
    68a4:      	mov	x2, #0x17               ; =23
    68a8:      	b	0x6978 <_stogir.locals.validate+0x1fc>
    68ac:      	movz	x5, #0x0, lsl #48
    68b0:      	b	0x68b8 <_stogir.locals.validate+0x13c>
    68b4:      	movz	x5, #0x0, lsl #48
    68b8:      	cmp	x5, #0x0
    68bc:      	b.eq	0x6920 <_stogir.locals.validate+0x1a4>
    68c0:      	uxtb	w16, w4
    68c4:      	cmp	w16, wzr
    68c8:      	b.eq	0x68f0 <_stogir.locals.validate+0x174>
    68cc:      	lsl	x4, x1, #4
    68d0:      	ldr	x5, [x0]
    68d4:      	add	x4, x4, x5
    68d8:      	ldr	x5, [x4]
    68dc:      	ldr	x4, [x4, #0x8]
    68e0:      	fmov	d31, x4
    68e4:      	mov	x4, x5
    68e8:      	fmov	x5, d31
    68ec:      	b	0x6910 <_stogir.locals.validate+0x194>
    68f0:      	lsl	x4, x6, #4
    68f4:      	ldr	x5, [x0, #0x28]
    68f8:      	add	x4, x4, x5
    68fc:      	ldr	x5, [x4]
    6900:      	ldr	x4, [x4, #0x8]
    6904:      	fmov	d31, x4
    6908:      	mov	x4, x5
    690c:      	fmov	x5, d31
    6910:      	mov	x6, x5
    6914:      	mov	x5, x4
    6918:      	mov	x4, #0x1                ; =1
    691c:      	b	0x692c <_stogir.locals.validate+0x1b0>
    6920:      	movz	x4, #0x0, lsl #48
    6924:      	movz	x5, #0x0, lsl #48
    6928:      	movz	x6, #0x0, lsl #48
    692c:      	lsr	w4, w4, #0
    6930:      	lsr	x16, x4, #0
    6934:      	cmp	x16, #0x1
    6938:      	b.eq	0x6954 <_stogir.locals.validate+0x1d8>
    693c:      	b.lo	0x6944 <_stogir.locals.validate+0x1c8>
    6940:      	b	0x6958 <_stogir.locals.validate+0x1dc>
    6944:      	cmp	x16, #0x0
    6948:      	b.eq	0x6950 <_stogir.locals.validate+0x1d4>
    694c:      	b	0x6958 <_stogir.locals.validate+0x1dc>
    6950:      	b	0x695c <_stogir.locals.validate+0x1e0>
    6954:      	b	0x69b0 <_stogir.locals.validate+0x234>
    6958:      	b	0x6ba0 <_stogir.locals.validate+0x424>
    695c:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		000000000000695c:  ARM64_RELOC_PAGE21	l_stogir.386
    6960:      	ldr	x16, [x16]
		0000000000006960:  ARM64_RELOC_PAGEOFF12	l_stogir.386
    6964:      	orr	x0, x16, xzr
    6968:      	mov	x23, x8
    696c:      	mov	x1, x0
    6970:      	mov	x0, #0x1                ; =1
    6974:      	mov	x2, #0x17               ; =23
    6978:      	str	x0, [x23]
    697c:      	str	x1, [x23, #0x8]
    6980:      	str	x2, [x23, #0x10]
    6984:      	ldr	x19, [sp, #0x70]
    6988:      	ldr	x20, [sp, #0x78]
    698c:      	ldr	x21, [sp, #0x80]
    6990:      	ldr	x22, [sp, #0x88]
    6994:      	ldr	x23, [sp, #0x90]
    6998:      	ldr	x24, [sp, #0x98]
    699c:      	ldr	x25, [sp, #0xa0]
    69a0:      	ldr	x29, [sp]
    69a4:      	ldr	x30, [sp, #0x8]
    69a8:      	add	sp, sp, #0xb0
    69ac:      	ret
    69b0:      	uxtb	w4, w5
    69b4:      	add	x16, sp, #0x10
    69b8:      	str	x5, [x16]
    69bc:      	add	x16, sp, #0x10
    69c0:      	str	x6, [x16, #0x8]
    69c4:      	cmp	x4, #0x55
    69c8:      	b.ne	0x6a40 <_stogir.locals.validate+0x2c4>
    69cc:      	mov	x5, #0x1                ; =1
    69d0:      	b	0x6a4c <_stogir.locals.validate+0x2d0>
    69d4:      	movz	x5, #0x0, lsl #48
    69d8:      	b	0x68b0 <_stogir.locals.validate+0x134>
    69dc:      	cmp	x4, #0x48
    69e0:      	cset	w21, eq
    69e4:      	uxtb	w16, w20
    69e8:      	cmp	w16, wzr
    69ec:      	b.ne	0x6a64 <_stogir.locals.validate+0x2e8>
    69f0:      	uxtb	w16, w21
    69f4:      	cmp	w16, wzr
    69f8:      	b.ne	0x6a64 <_stogir.locals.validate+0x2e8>
    69fc:      	cmp	x4, #0x55
    6a00:      	b.lt	0x6f14 <_stogir.locals.validate+0x798>
    6a04:      	cmp	x4, #0x58
    6a08:      	b.le	0x6a64 <_stogir.locals.validate+0x2e8>
    6a0c:      	mov	x23, x8
    6a10:      	b	0x6890 <_stogir.locals.validate+0x114>
    6a14:      	cmp	x4, #0x58
    6a18:      	cset	w6, eq
    6a1c:      	ubfx	x6, x6, #0, #8
    6a20:      	mov	x19, x6
    6a24:      	cmp	x4, #0x41
    6a28:      	cset	w20, eq
    6a2c:      	uxtb	w16, w20
    6a30:      	cmp	w16, wzr
    6a34:      	b.eq	0x6860 <_stogir.locals.validate+0xe4>
    6a38:      	mov	x5, #0x1                ; =1
    6a3c:      	b	0x6884 <_stogir.locals.validate+0x108>
    6a40:      	cmp	x4, #0x56
    6a44:      	cset	w5, eq
    6a48:      	ubfx	x5, x5, #0, #8
    6a4c:      	cmp	x4, #0x57
    6a50:      	b.ne	0x6a14 <_stogir.locals.validate+0x298>
    6a54:      	mov	x19, #0x1               ; =1
    6a58:      	b	0x6a24 <_stogir.locals.validate+0x2a8>
    6a5c:      	movz	x5, #0x0, lsl #48
    6a60:      	b	0x685c <_stogir.locals.validate+0xe0>
    6a64:      	lsr	w5, w5, #0
    6a68:      	sxtw	x5, w5
    6a6c:      	ldr	x4, [x0, #0x78]
    6a70:      	add	x3, x3, x4
    6a74:      	ldr	w3, [x3]
    6a78:      	sxtw	x3, w3
    6a7c:      	cmp	x3, x5
    6a80:      	b.ne	0x6f1c <_stogir.locals.validate+0x7a0>
    6a84:      	uxtb	w16, w20
    6a88:      	cmp	w16, wzr
    6a8c:      	b.ne	0x6aac <_stogir.locals.validate+0x330>
    6a90:      	uxtb	w16, w21
    6a94:      	cmp	w16, wzr
    6a98:      	b.ne	0x6aac <_stogir.locals.validate+0x330>
    6a9c:      	add	x16, sp, #0x10
    6aa0:      	ldr	w1, [x16, #0x8]
    6aa4:      	sxtw	x1, w1
    6aa8:      	b	0x6ac4 <_stogir.locals.validate+0x348>
    6aac:      	uxtb	w16, w21
    6ab0:      	cmp	w16, wzr
    6ab4:      	b.ne	0x6ac4 <_stogir.locals.validate+0x348>
    6ab8:      	add	x16, sp, #0x10
    6abc:      	ldr	w1, [x16, #0x4]
    6ac0:      	sxtw	x1, w1
    6ac4:      	add	x16, sp, #0x20
    6ac8:      	orr	x22, x16, xzr
    6acc:      	lsr	w2, w2, #0
    6ad0:      	lsr	w1, w1, #0
    6ad4:      	mov	x23, x8
    6ad8:      	add	x8, sp, #0x20
    6adc:      	mov	x24, x0
    6ae0:      	mov	w25, w2
    6ae4:      	bl	0x6ae4 <_stogir.locals.validate+0x368>
		0000000000006ae4:  ARM64_RELOC_BRANCH26	_stogir.locals.shape
    6ae8:      	add	x16, sp, #0x20
    6aec:      	ldr	w0, [x16]
    6af0:      	lsr	x16, x0, #0
    6af4:      	cmp	x16, #0x1
    6af8:      	b.eq	0x6b14 <_stogir.locals.validate+0x398>
    6afc:      	b.lo	0x6b04 <_stogir.locals.validate+0x388>
    6b00:      	b	0x6b18 <_stogir.locals.validate+0x39c>
    6b04:      	cmp	x16, #0x0
    6b08:      	b.eq	0x6b10 <_stogir.locals.validate+0x394>
    6b0c:      	b	0x6b18 <_stogir.locals.validate+0x39c>
    6b10:      	b	0x6b38 <_stogir.locals.validate+0x3bc>
    6b14:      	b	0x6b1c <_stogir.locals.validate+0x3a0>
    6b18:      	b	0x6d98 <_stogir.locals.validate+0x61c>
    6b1c:      	add	x0, x22, #0x8
    6b20:      	add	x16, sp, #0x20
    6b24:      	ldr	x1, [x16, #0x8]
    6b28:      	ldr	x0, [x0, #0x8]
    6b2c:      	mov	x2, x0
    6b30:      	mov	x0, #0x1                ; =1
    6b34:      	b	0x68a8 <_stogir.locals.validate+0x12c>
    6b38:      	add	x16, sp, #0x20
    6b3c:      	ldr	x22, [x16, #0x8]
    6b40:      	uxtb	w16, w21
    6b44:      	cmp	w16, wzr
    6b48:      	b.eq	0x6b68 <_stogir.locals.validate+0x3ec>
    6b4c:      	lsr	w22, w22, #0
    6b50:      	sxtw	x22, w22
    6b54:      	and	x0, x22, #0xffffffff
    6b58:      	mov	x1, x0
    6b5c:      	movz	x0, #0x0, lsl #48
    6b60:      	movz	x2, #0x0, lsl #48
    6b64:      	b	0x6b34 <_stogir.locals.validate+0x3b8>
    6b68:      	uxtb	w16, w20
    6b6c:      	cmp	w16, wzr
    6b70:      	b.eq	0x6bc4 <_stogir.locals.validate+0x448>
    6b74:      	add	x16, sp, #0x10
    6b78:      	ldr	w0, [x16]
    6b7c:      	ubfx	x0, x0, #8, #8
    6b80:      	cmp	x0, #0x6
    6b84:      	b.ne	0x6ba8 <_stogir.locals.validate+0x42c>
    6b88:      	sxtw	x25, w25
    6b8c:      	and	x0, x25, #0xffffffff
    6b90:      	mov	x1, x0
    6b94:      	movz	x0, #0x0, lsl #48
    6b98:      	movz	x2, #0x0, lsl #48
    6b9c:      	b	0x6bc0 <_stogir.locals.validate+0x444>
    6ba0:      	brk	#0
    6ba4:      	b	0x6ba0 <_stogir.locals.validate+0x424>
    6ba8:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		0000000000006ba8:  ARM64_RELOC_PAGE21	l_stogir.387
    6bac:      	ldr	x16, [x16]
		0000000000006bac:  ARM64_RELOC_PAGEOFF12	l_stogir.387
    6bb0:      	orr	x0, x16, xzr
    6bb4:      	mov	x1, x0
    6bb8:      	mov	x0, #0x1                ; =1
    6bbc:      	mov	x2, #0x21               ; =33
    6bc0:      	b	0x6b64 <_stogir.locals.validate+0x3e8>
    6bc4:      	add	x16, sp, #0x10
    6bc8:      	ldr	w0, [x16, #0x4]
    6bcc:      	sxtw	x0, w0
    6bd0:      	cmp	x0, #0x0
    6bd4:      	cset	w1, gt
    6bd8:      	movz	x16, #0x0, lsl #48
    6bdc:      	sub	x2, x16, x0
    6be0:      	sub	x3, x2, #0x1
    6be4:      	uxtb	w16, w1
    6be8:      	cmp	w16, wzr
    6bec:      	b.eq	0x6cd4 <_stogir.locals.validate+0x558>
    6bf0:      	ldr	x2, [x24, #0x8]
    6bf4:      	cmp	x0, x2
    6bf8:      	b.ge	0x6ccc <_stogir.locals.validate+0x550>
    6bfc:      	add	x2, x24, #0x78
    6c00:      	ldr	x2, [x2, #0x8]
    6c04:      	cmp	x0, x2
    6c08:      	b.ge	0x6d88 <_stogir.locals.validate+0x60c>
    6c0c:      	lsl	x2, x0, #2
    6c10:      	ldr	x4, [x24, #0x78]
    6c14:      	add	x2, x2, x4
    6c18:      	ldr	w2, [x2]
    6c1c:      	sxtw	x2, w2
    6c20:      	cmp	x2, #0x0
    6c24:      	cset	w2, ge
    6c28:      	ubfx	x2, x2, #0, #8
    6c2c:      	b	0x6d8c <_stogir.locals.validate+0x610>
    6c30:      	movz	x0, #0x0, lsl #48
    6c34:      	movz	x1, #0x0, lsl #48
    6c38:      	lsr	w0, w0, #0
    6c3c:      	lsr	x16, x0, #0
    6c40:      	cmp	x16, #0x1
    6c44:      	b.eq	0x6c60 <_stogir.locals.validate+0x4e4>
    6c48:      	b.lo	0x6c50 <_stogir.locals.validate+0x4d4>
    6c4c:      	b	0x6c64 <_stogir.locals.validate+0x4e8>
    6c50:      	cmp	x16, #0x0
    6c54:      	b.eq	0x6c5c <_stogir.locals.validate+0x4e0>
    6c58:      	b	0x6c64 <_stogir.locals.validate+0x4e8>
    6c5c:      	b	0x6c68 <_stogir.locals.validate+0x4ec>
    6c60:      	b	0x6d20 <_stogir.locals.validate+0x5a4>
    6c64:      	b	0x6ee4 <_stogir.locals.validate+0x768>
    6c68:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		0000000000006c68:  ARM64_RELOC_PAGE21	l_stogir.388
    6c6c:      	ldr	x16, [x16]
		0000000000006c6c:  ARM64_RELOC_PAGEOFF12	l_stogir.388
    6c70:      	orr	x0, x16, xzr
    6c74:      	mov	x1, x0
    6c78:      	mov	x0, #0x1                ; =1
    6c7c:      	mov	x2, #0x1c               ; =28
    6c80:      	b	0x6bc0 <_stogir.locals.validate+0x444>
    6c84:      	lsl	x0, x3, #4
    6c88:      	ldr	x1, [x24, #0x28]
    6c8c:      	add	x0, x0, x1
    6c90:      	ldr	x0, [x0]
    6c94:      	mov	x1, x0
    6c98:      	mov	x0, #0x1                ; =1
    6c9c:      	b	0x6c38 <_stogir.locals.validate+0x4bc>
    6ca0:      	movz	x2, #0x0, lsl #48
    6ca4:      	cmp	x2, #0x0
    6ca8:      	b.eq	0x6c30 <_stogir.locals.validate+0x4b4>
    6cac:      	uxtb	w16, w1
    6cb0:      	cmp	w16, wzr
    6cb4:      	b.eq	0x6c84 <_stogir.locals.validate+0x508>
    6cb8:      	lsl	x0, x0, #4
    6cbc:      	ldr	x1, [x24]
    6cc0:      	add	x0, x0, x1
    6cc4:      	ldr	x0, [x0]
    6cc8:      	b	0x6c94 <_stogir.locals.validate+0x518>
    6ccc:      	movz	x2, #0x0, lsl #48
    6cd0:      	b	0x6ca4 <_stogir.locals.validate+0x528>
    6cd4:      	cmp	x0, #0x0
    6cd8:      	b.ge	0x6ca0 <_stogir.locals.validate+0x524>
    6cdc:      	add	x4, x24, #0x28
    6ce0:      	add	x5, x24, #0x50
    6ce4:      	ldr	x4, [x4, #0x8]
    6ce8:      	ldr	x5, [x5, #0x8]
    6cec:      	cmp	x4, x5
    6cf0:      	b.ne	0x6d80 <_stogir.locals.validate+0x604>
    6cf4:      	cmp	x2, x4
    6cf8:      	b.gt	0x6d90 <_stogir.locals.validate+0x614>
    6cfc:      	lsl	x2, x3, #2
    6d00:      	ldr	x4, [x24, #0x50]
    6d04:      	add	x2, x2, x4
    6d08:      	ldr	w2, [x2]
    6d0c:      	sxtw	x2, w2
    6d10:      	cmp	x2, #0x0
    6d14:      	cset	w2, gt
    6d18:      	ubfx	x2, x2, #0, #8
    6d1c:      	b	0x6d94 <_stogir.locals.validate+0x618>
    6d20:      	add	x16, sp, #0x10
    6d24:      	ldr	w0, [x16, #0x4]
    6d28:      	sxtw	x0, w0
    6d2c:      	cmp	x0, #0x0
    6d30:      	b.le	0x6d64 <_stogir.locals.validate+0x5e8>
    6d34:      	uxtb	w1, w1
    6d38:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		0000000000006d38:  ARM64_RELOC_PAGE21	l_stogir.389
    6d3c:      	ldr	x16, [x16]
		0000000000006d3c:  ARM64_RELOC_PAGEOFF12	l_stogir.389
    6d40:      	orr	x0, x16, xzr
    6d44:      	cmp	x1, #0x83
    6d48:      	cset	w2, lt
    6d4c:      	add	x0, x1, x0
    6d50:      	uxtb	w16, w2
    6d54:      	cmp	w16, wzr
    6d58:      	b.eq	0x6da0 <_stogir.locals.validate+0x624>
    6d5c:      	ldrb	w1, [x0]
    6d60:      	b	0x6da4 <_stogir.locals.validate+0x628>
    6d64:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		0000000000006d64:  ARM64_RELOC_PAGE21	l_stogir.390
    6d68:      	ldr	x16, [x16]
		0000000000006d68:  ARM64_RELOC_PAGEOFF12	l_stogir.390
    6d6c:      	orr	x0, x16, xzr
    6d70:      	mov	x1, x0
    6d74:      	mov	x0, #0x1                ; =1
    6d78:      	mov	x2, #0x1c               ; =28
    6d7c:      	b	0x6c80 <_stogir.locals.validate+0x504>
    6d80:      	movz	x2, #0x0, lsl #48
    6d84:      	b	0x6ca4 <_stogir.locals.validate+0x528>
    6d88:      	movz	x2, #0x0, lsl #48
    6d8c:      	b	0x6cd0 <_stogir.locals.validate+0x554>
    6d90:      	movz	x2, #0x0, lsl #48
    6d94:      	b	0x6d84 <_stogir.locals.validate+0x608>
    6d98:      	brk	#0
    6d9c:      	b	0x6d98 <_stogir.locals.validate+0x61c>
    6da0:      	movz	x1, #0x0, lsl #48
    6da4:      	uxtb	w1, w1
    6da8:      	and	x1, x1, #0x1
    6dac:      	uxtb	w1, w1
    6db0:      	cmp	x1, #0x0
    6db4:      	b.eq	0x6d64 <_stogir.locals.validate+0x5e8>
    6db8:      	uxtb	w16, w2
    6dbc:      	cmp	w16, wzr
    6dc0:      	b.eq	0x6dcc <_stogir.locals.validate+0x650>
    6dc4:      	ldrb	w0, [x0]
    6dc8:      	b	0x6dd0 <_stogir.locals.validate+0x654>
    6dcc:      	movz	x0, #0x0, lsl #48
    6dd0:      	uxtb	w0, w0
    6dd4:      	and	x0, x0, #0x4
    6dd8:      	uxtb	w0, w0
    6ddc:      	cmp	x0, #0x0
    6de0:      	b.ne	0x6d64 <_stogir.locals.validate+0x5e8>
    6de4:      	cmp	x19, #0x0
    6de8:      	b.eq	0x6e88 <_stogir.locals.validate+0x70c>
    6dec:      	add	x16, sp, #0x10
    6df0:      	ldr	w0, [x16, #0xc]
    6df4:      	lsr	w0, w0, #0
    6df8:      	add	x8, sp, #0x40
    6dfc:      	mov	w1, w0
    6e00:      	mov	x0, x24
    6e04:      	bl	0x6e04 <_stogir.locals.validate+0x688>
		0000000000006e04:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    6e08:      	add	x16, sp, #0x40
    6e0c:      	ldr	x0, [x16]
    6e10:      	add	x16, sp, #0x40
    6e14:      	ldr	x1, [x16, #0x8]
    6e18:      	mov	x20, x1
    6e1c:      	b	0x6e98 <_stogir.locals.validate+0x71c>
    6e20:      	lsr	w25, w25, #0
    6e24:      	lsr	w0, w20, #0
    6e28:      	ubfx	x0, x0, #8, #8
    6e2c:      	lsr	w0, w0, #0
    6e30:      	mov	w1, w25
    6e34:      	bl	0x6e34 <_stogir.locals.validate+0x6b8>
		0000000000006e34:  ARM64_RELOC_BRANCH26	_stogir.types.size
    6e38:      	lsr	w0, w0, #0
    6e3c:      	sxtw	x0, w0
    6e40:      	cmp	x0, #0x0
    6e44:      	b.le	0x6e6c <_stogir.locals.validate+0x6f0>
    6e48:      	cmp	x0, x22
    6e4c:      	b.gt	0x6e6c <_stogir.locals.validate+0x6f0>
    6e50:      	cmp	x19, #0x0
    6e54:      	b.eq	0x6eec <_stogir.locals.validate+0x770>
    6e58:      	add	x16, sp, #0x10
    6e5c:      	ldr	w1, [x16]
    6e60:      	ubfx	x1, x1, #8, #8
    6e64:      	cmp	x1, #0x0
    6e68:      	b.eq	0x6eec <_stogir.locals.validate+0x770>
    6e6c:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		0000000000006e6c:  ARM64_RELOC_PAGE21	l_stogir.391
    6e70:      	ldr	x16, [x16]
		0000000000006e70:  ARM64_RELOC_PAGEOFF12	l_stogir.391
    6e74:      	orr	x0, x16, xzr
    6e78:      	mov	x1, x0
    6e7c:      	mov	x0, #0x1                ; =1
    6e80:      	mov	x2, #0x23               ; =35
    6e84:      	b	0x6d7c <_stogir.locals.validate+0x600>
    6e88:      	add	x16, sp, #0x10
    6e8c:      	ldr	x0, [x16]
    6e90:      	mov	x20, x0
    6e94:      	mov	x0, #0x1                ; =1
    6e98:      	lsr	w0, w0, #0
    6e9c:      	lsr	x16, x0, #0
    6ea0:      	cmp	x16, #0x1
    6ea4:      	b.eq	0x6ec0 <_stogir.locals.validate+0x744>
    6ea8:      	b.lo	0x6eb0 <_stogir.locals.validate+0x734>
    6eac:      	b	0x6ec4 <_stogir.locals.validate+0x748>
    6eb0:      	cmp	x16, #0x0
    6eb4:      	b.eq	0x6ebc <_stogir.locals.validate+0x740>
    6eb8:      	b	0x6ec4 <_stogir.locals.validate+0x748>
    6ebc:      	b	0x6ec8 <_stogir.locals.validate+0x74c>
    6ec0:      	b	0x6e20 <_stogir.locals.validate+0x6a4>
    6ec4:      	b	0x6f0c <_stogir.locals.validate+0x790>
    6ec8:      	adrp	x16, 0x6000 <_stogir.switch.validate+0x1f4>
		0000000000006ec8:  ARM64_RELOC_PAGE21	l_stogir.392
    6ecc:      	ldr	x16, [x16]
		0000000000006ecc:  ARM64_RELOC_PAGEOFF12	l_stogir.392
    6ed0:      	orr	x0, x16, xzr
    6ed4:      	mov	x1, x0
    6ed8:      	mov	x0, #0x1                ; =1
    6edc:      	mov	x2, #0x19               ; =25
    6ee0:      	b	0x6e84 <_stogir.locals.validate+0x708>
    6ee4:      	brk	#0
    6ee8:      	b	0x6ee4 <_stogir.locals.validate+0x768>
    6eec:      	uxtb	w20, w20
    6ef0:      	cmp	x20, #0x48
    6ef4:      	b.eq	0x6e6c <_stogir.locals.validate+0x6f0>
    6ef8:      	and	x0, x0, #0xffffffff
    6efc:      	mov	x1, x0
    6f00:      	movz	x0, #0x0, lsl #48
    6f04:      	movz	x2, #0x0, lsl #48
    6f08:      	b	0x6e84 <_stogir.locals.validate+0x708>
    6f0c:      	brk	#0
    6f10:      	b	0x6f0c <_stogir.locals.validate+0x790>
    6f14:      	mov	x23, x8
    6f18:      	b	0x6890 <_stogir.locals.validate+0x114>
    6f1c:      	mov	x23, x8
    6f20:      	b	0x6890 <_stogir.locals.validate+0x114>

0000000000006f24 <_stogir.conversion.operation?>:
    6f24:      	sxtw	x0, w0
    6f28:      	cmp	x0, #0x21
    6f2c:      	b.lt	0x6f40 <_stogir.conversion.operation?+0x1c>
    6f30:      	cmp	x0, #0x27
    6f34:      	cset	w0, le
    6f38:      	ubfx	x0, x0, #0, #8
    6f3c:      	b	0x6f44 <_stogir.conversion.operation?+0x20>
    6f40:      	movz	x0, #0x0, lsl #48
    6f44:      	ret

0000000000006f48 <_stogir.conversion.validate>:
    6f48:      	sub	sp, sp, #0x40
    6f4c:      	str	x29, [sp]
    6f50:      	str	x30, [sp, #0x8]
    6f54:      	mov	x29, sp
    6f58:      	str	x19, [sp, #0x30]
    6f5c:      	sxtw	x1, w1
    6f60:      	lsl	x3, x1, #2
    6f64:      	cmp	x1, #0x0
    6f68:      	cset	w4, gt
    6f6c:      	movz	x16, #0x0, lsl #48
    6f70:      	sub	x5, x16, x1
    6f74:      	sub	x6, x5, #0x1
    6f78:      	uxtb	w16, w4
    6f7c:      	cmp	w16, wzr
    6f80:      	b.eq	0x6fc0 <_stogir.conversion.validate+0x78>
    6f84:      	ldr	x5, [x0, #0x8]
    6f88:      	cmp	x1, x5
    6f8c:      	b.ge	0x7014 <_stogir.conversion.validate+0xcc>
    6f90:      	add	x5, x0, #0x78
    6f94:      	ldr	x5, [x5, #0x8]
    6f98:      	cmp	x1, x5
    6f9c:      	b.ge	0x7100 <_stogir.conversion.validate+0x1b8>
    6fa0:      	ldr	x5, [x0, #0x78]
    6fa4:      	add	x5, x3, x5
    6fa8:      	ldr	w5, [x5]
    6fac:      	sxtw	x5, w5
    6fb0:      	cmp	x5, #0x0
    6fb4:      	cset	w5, ge
    6fb8:      	ubfx	x5, x5, #0, #8
    6fbc:      	b	0x7104 <_stogir.conversion.validate+0x1bc>
    6fc0:      	cmp	x1, #0x0
    6fc4:      	b.ge	0x701c <_stogir.conversion.validate+0xd4>
    6fc8:      	add	x7, x0, #0x28
    6fcc:      	add	x9, x0, #0x50
    6fd0:      	ldr	x7, [x7, #0x8]
    6fd4:      	ldr	x9, [x9, #0x8]
    6fd8:      	cmp	x7, x9
    6fdc:      	b.ne	0x700c <_stogir.conversion.validate+0xc4>
    6fe0:      	cmp	x5, x7
    6fe4:      	b.gt	0x7198 <_stogir.conversion.validate+0x250>
    6fe8:      	lsl	x5, x6, #2
    6fec:      	ldr	x7, [x0, #0x50]
    6ff0:      	add	x5, x5, x7
    6ff4:      	ldr	w5, [x5]
    6ff8:      	sxtw	x5, w5
    6ffc:      	cmp	x5, #0x0
    7000:      	cset	w5, gt
    7004:      	ubfx	x5, x5, #0, #8
    7008:      	b	0x719c <_stogir.conversion.validate+0x254>
    700c:      	movz	x5, #0x0, lsl #48
    7010:      	b	0x7020 <_stogir.conversion.validate+0xd8>
    7014:      	movz	x5, #0x0, lsl #48
    7018:      	b	0x7020 <_stogir.conversion.validate+0xd8>
    701c:      	movz	x5, #0x0, lsl #48
    7020:      	cmp	x5, #0x0
    7024:      	b.eq	0x7064 <_stogir.conversion.validate+0x11c>
    7028:      	uxtb	w16, w4
    702c:      	cmp	w16, wzr
    7030:      	b.eq	0x7048 <_stogir.conversion.validate+0x100>
    7034:      	lsl	x4, x1, #4
    7038:      	ldr	x5, [x0]
    703c:      	add	x4, x4, x5
    7040:      	ldr	x4, [x4]
    7044:      	b	0x7058 <_stogir.conversion.validate+0x110>
    7048:      	lsl	x4, x6, #4
    704c:      	ldr	x5, [x0, #0x28]
    7050:      	add	x4, x4, x5
    7054:      	ldr	x4, [x4]
    7058:      	mov	x5, x4
    705c:      	mov	x4, #0x1                ; =1
    7060:      	b	0x706c <_stogir.conversion.validate+0x124>
    7064:      	movz	x4, #0x0, lsl #48
    7068:      	movz	x5, #0x0, lsl #48
    706c:      	lsr	w4, w4, #0
    7070:      	lsr	x16, x4, #0
    7074:      	cmp	x16, #0x1
    7078:      	b.eq	0x7094 <_stogir.conversion.validate+0x14c>
    707c:      	b.lo	0x7084 <_stogir.conversion.validate+0x13c>
    7080:      	b	0x7098 <_stogir.conversion.validate+0x150>
    7084:      	cmp	x16, #0x0
    7088:      	b.eq	0x7090 <_stogir.conversion.validate+0x148>
    708c:      	b	0x7098 <_stogir.conversion.validate+0x150>
    7090:      	b	0x709c <_stogir.conversion.validate+0x154>
    7094:      	b	0x70d8 <_stogir.conversion.validate+0x190>
    7098:      	b	0x7218 <_stogir.conversion.validate+0x2d0>
    709c:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		000000000000709c:  ARM64_RELOC_PAGE21	l_stogir.393
    70a0:      	ldr	x16, [x16]
		00000000000070a0:  ARM64_RELOC_PAGEOFF12	l_stogir.393
    70a4:      	orr	x0, x16, xzr
    70a8:      	mov	x19, x8
    70ac:      	mov	x1, x0
    70b0:      	mov	x0, #0x1                ; =1
    70b4:      	mov	x2, #0x12               ; =18
    70b8:      	str	x0, [x19]
    70bc:      	str	x1, [x19, #0x8]
    70c0:      	str	x2, [x19, #0x10]
    70c4:      	ldr	x19, [sp, #0x30]
    70c8:      	ldr	x29, [sp]
    70cc:      	ldr	x30, [sp, #0x8]
    70d0:      	add	sp, sp, #0x40
    70d4:      	ret
    70d8:      	cmp	x1, #0x0
    70dc:      	b.gt	0x7108 <_stogir.conversion.validate+0x1c0>
    70e0:      	mov	x19, x8
    70e4:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		00000000000070e4:  ARM64_RELOC_PAGE21	l_stogir.394
    70e8:      	ldr	x16, [x16]
		00000000000070e8:  ARM64_RELOC_PAGEOFF12	l_stogir.394
    70ec:      	orr	x0, x16, xzr
    70f0:      	mov	x1, x0
    70f4:      	mov	x0, #0x1                ; =1
    70f8:      	mov	x2, #0x1e               ; =30
    70fc:      	b	0x70b8 <_stogir.conversion.validate+0x170>
    7100:      	movz	x5, #0x0, lsl #48
    7104:      	b	0x7018 <_stogir.conversion.validate+0xd0>
    7108:      	uxtb	w1, w5
    710c:      	orr	x4, x1, xzr
    7110:      	cmp	x4, #0x21
    7114:      	b.lt	0x734c <_stogir.conversion.validate+0x404>
    7118:      	cmp	x4, #0x27
    711c:      	b.gt	0x7354 <_stogir.conversion.validate+0x40c>
    7120:      	ldr	x4, [x0, #0x78]
    7124:      	add	x3, x3, x4
    7128:      	ldr	w3, [x3]
    712c:      	sxtw	x3, w3
    7130:      	cmp	x3, #0x1
    7134:      	b.ne	0x735c <_stogir.conversion.validate+0x414>
    7138:      	asr	x3, x5, #32
    713c:      	cmp	x3, #0x0
    7140:      	cset	w6, gt
    7144:      	movz	x16, #0x0, lsl #48
    7148:      	sub	x7, x16, x3
    714c:      	sub	x9, x7, #0x1
    7150:      	uxtb	w16, w6
    7154:      	cmp	w16, wzr
    7158:      	b.eq	0x71cc <_stogir.conversion.validate+0x284>
    715c:      	ldr	x7, [x0, #0x8]
    7160:      	cmp	x3, x7
    7164:      	b.ge	0x7220 <_stogir.conversion.validate+0x2d8>
    7168:      	add	x7, x0, #0x78
    716c:      	ldr	x7, [x7, #0x8]
    7170:      	cmp	x3, x7
    7174:      	b.ge	0x72d0 <_stogir.conversion.validate+0x388>
    7178:      	lsl	x7, x3, #2
    717c:      	add	x4, x7, x4
    7180:      	ldr	w4, [x4]
    7184:      	sxtw	x4, w4
    7188:      	cmp	x4, #0x0
    718c:      	cset	w4, ge
    7190:      	ubfx	x4, x4, #0, #8
    7194:      	b	0x72d4 <_stogir.conversion.validate+0x38c>
    7198:      	movz	x5, #0x0, lsl #48
    719c:      	b	0x7010 <_stogir.conversion.validate+0xc8>
    71a0:      	uxtb	w0, w3
    71a4:      	cmp	x0, #0x48
    71a8:      	b.ne	0x72d8 <_stogir.conversion.validate+0x390>
    71ac:      	mov	x19, x8
    71b0:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		00000000000071b0:  ARM64_RELOC_PAGE21	l_stogir.395
    71b4:      	ldr	x16, [x16]
		00000000000071b4:  ARM64_RELOC_PAGEOFF12	l_stogir.395
    71b8:      	orr	x0, x16, xzr
    71bc:      	mov	x1, x0
    71c0:      	mov	x0, #0x1                ; =1
    71c4:      	mov	x2, #0x25               ; =37
    71c8:      	b	0x70fc <_stogir.conversion.validate+0x1b4>
    71cc:      	cmp	x3, #0x0
    71d0:      	b.ge	0x7228 <_stogir.conversion.validate+0x2e0>
    71d4:      	add	x4, x0, #0x28
    71d8:      	add	x10, x0, #0x50
    71dc:      	ldr	x4, [x4, #0x8]
    71e0:      	ldr	x10, [x10, #0x8]
    71e4:      	cmp	x4, x10
    71e8:      	b.ne	0x72c8 <_stogir.conversion.validate+0x380>
    71ec:      	cmp	x7, x4
    71f0:      	b.gt	0x733c <_stogir.conversion.validate+0x3f4>
    71f4:      	lsl	x4, x9, #2
    71f8:      	ldr	x7, [x0, #0x50]
    71fc:      	add	x4, x4, x7
    7200:      	ldr	w4, [x4]
    7204:      	sxtw	x4, w4
    7208:      	cmp	x4, #0x0
    720c:      	cset	w4, gt
    7210:      	ubfx	x4, x4, #0, #8
    7214:      	b	0x7340 <_stogir.conversion.validate+0x3f8>
    7218:      	brk	#0
    721c:      	b	0x7218 <_stogir.conversion.validate+0x2d0>
    7220:      	movz	x4, #0x0, lsl #48
    7224:      	b	0x722c <_stogir.conversion.validate+0x2e4>
    7228:      	movz	x4, #0x0, lsl #48
    722c:      	cmp	x4, #0x0
    7230:      	b.eq	0x7270 <_stogir.conversion.validate+0x328>
    7234:      	uxtb	w16, w6
    7238:      	cmp	w16, wzr
    723c:      	b.eq	0x7254 <_stogir.conversion.validate+0x30c>
    7240:      	lsl	x3, x3, #4
    7244:      	ldr	x0, [x0]
    7248:      	add	x0, x3, x0
    724c:      	ldr	x0, [x0]
    7250:      	b	0x7264 <_stogir.conversion.validate+0x31c>
    7254:      	lsl	x3, x9, #4
    7258:      	ldr	x0, [x0, #0x28]
    725c:      	add	x0, x3, x0
    7260:      	ldr	x0, [x0]
    7264:      	mov	x3, x0
    7268:      	mov	x0, #0x1                ; =1
    726c:      	b	0x7278 <_stogir.conversion.validate+0x330>
    7270:      	movz	x0, #0x0, lsl #48
    7274:      	movz	x3, #0x0, lsl #48
    7278:      	lsr	w0, w0, #0
    727c:      	lsr	x16, x0, #0
    7280:      	cmp	x16, #0x1
    7284:      	b.eq	0x72a0 <_stogir.conversion.validate+0x358>
    7288:      	b.lo	0x7290 <_stogir.conversion.validate+0x348>
    728c:      	b	0x72a4 <_stogir.conversion.validate+0x35c>
    7290:      	cmp	x16, #0x0
    7294:      	b.eq	0x729c <_stogir.conversion.validate+0x354>
    7298:      	b	0x72a4 <_stogir.conversion.validate+0x35c>
    729c:      	b	0x72a8 <_stogir.conversion.validate+0x360>
    72a0:      	b	0x71a0 <_stogir.conversion.validate+0x258>
    72a4:      	b	0x7344 <_stogir.conversion.validate+0x3fc>
    72a8:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		00000000000072a8:  ARM64_RELOC_PAGE21	l_stogir.396
    72ac:      	ldr	x16, [x16]
		00000000000072ac:  ARM64_RELOC_PAGEOFF12	l_stogir.396
    72b0:      	orr	x0, x16, xzr
    72b4:      	mov	x19, x8
    72b8:      	mov	x1, x0
    72bc:      	mov	x0, #0x1                ; =1
    72c0:      	mov	x2, #0x19               ; =25
    72c4:      	b	0x71c8 <_stogir.conversion.validate+0x280>
    72c8:      	movz	x4, #0x0, lsl #48
    72cc:      	b	0x722c <_stogir.conversion.validate+0x2e4>
    72d0:      	movz	x4, #0x0, lsl #48
    72d4:      	b	0x7224 <_stogir.conversion.validate+0x2dc>
    72d8:      	cmp	x0, #0x46
    72dc:      	b.eq	0x7364 <_stogir.conversion.validate+0x41c>
    72e0:      	lsr	w2, w2, #0
    72e4:      	lsr	w5, w5, #0
    72e8:      	lsr	w3, w3, #0
    72ec:      	lsr	w1, w1, #0
    72f0:      	ubfx	x0, x5, #8, #8
    72f4:      	ubfx	x3, x3, #8, #8
    72f8:      	lsr	w0, w0, #0
    72fc:      	lsr	w3, w3, #0
    7300:      	mov	x19, x8
    7304:      	add	x8, sp, #0x10
    7308:      	fmov	s31, w0
    730c:      	mov	w0, w1
    7310:      	mov	w1, w3
    7314:      	mov	w3, w2
    7318:      	fmov	w2, s31
    731c:      	bl	0x731c <_stogir.conversion.validate+0x3d4>
		000000000000731c:  ARM64_RELOC_BRANCH26	_stogir.conversion.policy
    7320:      	add	x16, sp, #0x10
    7324:      	ldr	x0, [x16]
    7328:      	add	x16, sp, #0x10
    732c:      	ldr	x1, [x16, #0x8]
    7330:      	add	x16, sp, #0x10
    7334:      	ldr	x2, [x16, #0x10]
    7338:      	b	0x71c8 <_stogir.conversion.validate+0x280>
    733c:      	movz	x4, #0x0, lsl #48
    7340:      	b	0x72cc <_stogir.conversion.validate+0x384>
    7344:      	brk	#0
    7348:      	b	0x7344 <_stogir.conversion.validate+0x3fc>
    734c:      	mov	x19, x8
    7350:      	b	0x70e4 <_stogir.conversion.validate+0x19c>
    7354:      	mov	x19, x8
    7358:      	b	0x70e4 <_stogir.conversion.validate+0x19c>
    735c:      	mov	x19, x8
    7360:      	b	0x70e4 <_stogir.conversion.validate+0x19c>
    7364:      	mov	x19, x8
    7368:      	b	0x71b0 <_stogir.conversion.validate+0x268>

000000000000736c <_stogir.conditional.validate>:
    736c:      	sub	sp, sp, #0x40
    7370:      	str	x29, [sp]
    7374:      	str	x30, [sp, #0x8]
    7378:      	mov	x29, sp
    737c:      	str	x19, [sp, #0x30]
    7380:      	sxtw	x1, w1
    7384:      	lsl	x2, x1, #2
    7388:      	cmp	x1, #0x0
    738c:      	cset	w3, gt
    7390:      	movz	x16, #0x0, lsl #48
    7394:      	sub	x4, x16, x1
    7398:      	sub	x5, x4, #0x1
    739c:      	uxtb	w16, w3
    73a0:      	cmp	w16, wzr
    73a4:      	b.eq	0x73e4 <_stogir.conditional.validate+0x78>
    73a8:      	ldr	x4, [x0, #0x8]
    73ac:      	cmp	x1, x4
    73b0:      	b.ge	0x7438 <_stogir.conditional.validate+0xcc>
    73b4:      	add	x4, x0, #0x78
    73b8:      	ldr	x4, [x4, #0x8]
    73bc:      	cmp	x1, x4
    73c0:      	b.ge	0x754c <_stogir.conditional.validate+0x1e0>
    73c4:      	ldr	x4, [x0, #0x78]
    73c8:      	add	x4, x2, x4
    73cc:      	ldr	w4, [x4]
    73d0:      	sxtw	x4, w4
    73d4:      	cmp	x4, #0x0
    73d8:      	cset	w4, ge
    73dc:      	ubfx	x4, x4, #0, #8
    73e0:      	b	0x7550 <_stogir.conditional.validate+0x1e4>
    73e4:      	cmp	x1, #0x0
    73e8:      	b.ge	0x7440 <_stogir.conditional.validate+0xd4>
    73ec:      	add	x6, x0, #0x28
    73f0:      	add	x7, x0, #0x50
    73f4:      	ldr	x6, [x6, #0x8]
    73f8:      	ldr	x7, [x7, #0x8]
    73fc:      	cmp	x6, x7
    7400:      	b.ne	0x7430 <_stogir.conditional.validate+0xc4>
    7404:      	cmp	x4, x6
    7408:      	b.gt	0x75d4 <_stogir.conditional.validate+0x268>
    740c:      	lsl	x4, x5, #2
    7410:      	ldr	x6, [x0, #0x50]
    7414:      	add	x4, x4, x6
    7418:      	ldr	w4, [x4]
    741c:      	sxtw	x4, w4
    7420:      	cmp	x4, #0x0
    7424:      	cset	w4, gt
    7428:      	ubfx	x4, x4, #0, #8
    742c:      	b	0x75d8 <_stogir.conditional.validate+0x26c>
    7430:      	movz	x4, #0x0, lsl #48
    7434:      	b	0x7444 <_stogir.conditional.validate+0xd8>
    7438:      	movz	x4, #0x0, lsl #48
    743c:      	b	0x7444 <_stogir.conditional.validate+0xd8>
    7440:      	movz	x4, #0x0, lsl #48
    7444:      	cmp	x4, #0x0
    7448:      	b.eq	0x74ac <_stogir.conditional.validate+0x140>
    744c:      	uxtb	w16, w3
    7450:      	cmp	w16, wzr
    7454:      	b.eq	0x747c <_stogir.conditional.validate+0x110>
    7458:      	lsl	x3, x1, #4
    745c:      	ldr	x4, [x0]
    7460:      	add	x3, x3, x4
    7464:      	ldr	x4, [x3]
    7468:      	ldr	x3, [x3, #0x8]
    746c:      	fmov	d31, x3
    7470:      	mov	x3, x4
    7474:      	fmov	x4, d31
    7478:      	b	0x749c <_stogir.conditional.validate+0x130>
    747c:      	lsl	x3, x5, #4
    7480:      	ldr	x4, [x0, #0x28]
    7484:      	add	x3, x3, x4
    7488:      	ldr	x4, [x3]
    748c:      	ldr	x3, [x3, #0x8]
    7490:      	fmov	d31, x3
    7494:      	mov	x3, x4
    7498:      	fmov	x4, d31
    749c:      	mov	x5, x4
    74a0:      	mov	x4, x3
    74a4:      	mov	x3, #0x1                ; =1
    74a8:      	b	0x74b8 <_stogir.conditional.validate+0x14c>
    74ac:      	movz	x3, #0x0, lsl #48
    74b0:      	movz	x4, #0x0, lsl #48
    74b4:      	movz	x5, #0x0, lsl #48
    74b8:      	lsr	w3, w3, #0
    74bc:      	lsr	x16, x3, #0
    74c0:      	cmp	x16, #0x1
    74c4:      	b.eq	0x74e0 <_stogir.conditional.validate+0x174>
    74c8:      	b.lo	0x74d0 <_stogir.conditional.validate+0x164>
    74cc:      	b	0x74e4 <_stogir.conditional.validate+0x178>
    74d0:      	cmp	x16, #0x0
    74d4:      	b.eq	0x74dc <_stogir.conditional.validate+0x170>
    74d8:      	b	0x74e4 <_stogir.conditional.validate+0x178>
    74dc:      	b	0x74e8 <_stogir.conditional.validate+0x17c>
    74e0:      	b	0x7508 <_stogir.conditional.validate+0x19c>
    74e4:      	b	0x75dc <_stogir.conditional.validate+0x270>
    74e8:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		00000000000074e8:  ARM64_RELOC_PAGE21	l_stogir.397
    74ec:      	ldr	x16, [x16]
		00000000000074ec:  ARM64_RELOC_PAGEOFF12	l_stogir.397
    74f0:      	orr	x0, x16, xzr
    74f4:      	mov	x19, x8
    74f8:      	mov	x1, x0
    74fc:      	mov	x0, #0x1                ; =1
    7500:      	mov	x2, #0x18               ; =24
    7504:      	b	0x752c <_stogir.conditional.validate+0x1c0>
    7508:      	cmp	x1, #0x0
    750c:      	b.gt	0x7554 <_stogir.conditional.validate+0x1e8>
    7510:      	mov	x19, x8
    7514:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		0000000000007514:  ARM64_RELOC_PAGE21	l_stogir.398
    7518:      	ldr	x16, [x16]
		0000000000007518:  ARM64_RELOC_PAGEOFF12	l_stogir.398
    751c:      	orr	x0, x16, xzr
    7520:      	mov	x1, x0
    7524:      	mov	x0, #0x1                ; =1
    7528:      	mov	x2, #0x18               ; =24
    752c:      	str	x0, [x19]
    7530:      	str	x1, [x19, #0x8]
    7534:      	str	x2, [x19, #0x10]
    7538:      	ldr	x19, [sp, #0x30]
    753c:      	ldr	x29, [sp]
    7540:      	ldr	x30, [sp, #0x8]
    7544:      	add	sp, sp, #0x40
    7548:      	ret
    754c:      	movz	x4, #0x0, lsl #48
    7550:      	b	0x743c <_stogir.conditional.validate+0xd0>
    7554:      	uxtb	w1, w4
    7558:      	cmp	x1, #0x3c
    755c:      	b.ne	0x75e4 <_stogir.conditional.validate+0x278>
    7560:      	ldr	x1, [x0, #0x78]
    7564:      	add	x1, x2, x1
    7568:      	ldr	w1, [x1]
    756c:      	sxtw	x1, w1
    7570:      	cmp	x1, #0x3
    7574:      	b.ne	0x75ec <_stogir.conditional.validate+0x280>
    7578:      	lsr	w1, w5, #0
    757c:      	lsr	w2, w4, #0
    7580:      	lsr	x3, x4, #32
    7584:      	lsr	w1, w1, #0
    7588:      	lsr	x4, x5, #32
    758c:      	lsr	w3, w3, #0
    7590:      	lsr	w4, w4, #0
    7594:      	ubfx	x2, x2, #8, #8
    7598:      	lsr	w2, w2, #0
    759c:      	mov	x19, x8
    75a0:      	add	x8, sp, #0x10
    75a4:      	fmov	s31, w1
    75a8:      	mov	w1, w2
    75ac:      	mov	w2, w3
    75b0:      	fmov	w3, s31
    75b4:      	bl	0x75b4 <_stogir.conditional.validate+0x248>
		00000000000075b4:  ARM64_RELOC_BRANCH26	_stogir.conditional.operands
    75b8:      	add	x16, sp, #0x10
    75bc:      	ldr	x0, [x16]
    75c0:      	add	x16, sp, #0x10
    75c4:      	ldr	x1, [x16, #0x8]
    75c8:      	add	x16, sp, #0x10
    75cc:      	ldr	x2, [x16, #0x10]
    75d0:      	b	0x752c <_stogir.conditional.validate+0x1c0>
    75d4:      	movz	x4, #0x0, lsl #48
    75d8:      	b	0x7434 <_stogir.conditional.validate+0xc8>
    75dc:      	brk	#0
    75e0:      	b	0x75dc <_stogir.conditional.validate+0x270>
    75e4:      	mov	x19, x8
    75e8:      	b	0x7514 <_stogir.conditional.validate+0x1a8>
    75ec:      	mov	x19, x8
    75f0:      	b	0x7514 <_stogir.conditional.validate+0x1a8>

00000000000075f4 <_stogir.floating.validate>:
    75f4:      	sub	sp, sp, #0x50
    75f8:      	str	x29, [sp]
    75fc:      	str	x30, [sp, #0x8]
    7600:      	mov	x29, sp
    7604:      	str	x19, [sp, #0x40]
    7608:      	sxtw	x1, w1
    760c:      	lsl	x2, x1, #2
    7610:      	cmp	x1, #0x0
    7614:      	cset	w3, gt
    7618:      	movz	x16, #0x0, lsl #48
    761c:      	sub	x4, x16, x1
    7620:      	sub	x5, x4, #0x1
    7624:      	uxtb	w16, w3
    7628:      	cmp	w16, wzr
    762c:      	b.eq	0x766c <_stogir.floating.validate+0x78>
    7630:      	ldr	x4, [x0, #0x8]
    7634:      	cmp	x1, x4
    7638:      	b.ge	0x76c0 <_stogir.floating.validate+0xcc>
    763c:      	add	x4, x0, #0x78
    7640:      	ldr	x4, [x4, #0x8]
    7644:      	cmp	x1, x4
    7648:      	b.ge	0x77e4 <_stogir.floating.validate+0x1f0>
    764c:      	ldr	x4, [x0, #0x78]
    7650:      	add	x4, x2, x4
    7654:      	ldr	w4, [x4]
    7658:      	sxtw	x4, w4
    765c:      	cmp	x4, #0x0
    7660:      	cset	w4, ge
    7664:      	ubfx	x4, x4, #0, #8
    7668:      	b	0x77e8 <_stogir.floating.validate+0x1f4>
    766c:      	cmp	x1, #0x0
    7670:      	b.ge	0x76c8 <_stogir.floating.validate+0xd4>
    7674:      	add	x6, x0, #0x28
    7678:      	add	x7, x0, #0x50
    767c:      	ldr	x6, [x6, #0x8]
    7680:      	ldr	x7, [x7, #0x8]
    7684:      	cmp	x6, x7
    7688:      	b.ne	0x76b8 <_stogir.floating.validate+0xc4>
    768c:      	cmp	x4, x6
    7690:      	b.gt	0x7870 <_stogir.floating.validate+0x27c>
    7694:      	lsl	x4, x5, #2
    7698:      	ldr	x6, [x0, #0x50]
    769c:      	add	x4, x4, x6
    76a0:      	ldr	w4, [x4]
    76a4:      	sxtw	x4, w4
    76a8:      	cmp	x4, #0x0
    76ac:      	cset	w4, gt
    76b0:      	ubfx	x4, x4, #0, #8
    76b4:      	b	0x7874 <_stogir.floating.validate+0x280>
    76b8:      	movz	x4, #0x0, lsl #48
    76bc:      	b	0x76cc <_stogir.floating.validate+0xd8>
    76c0:      	movz	x4, #0x0, lsl #48
    76c4:      	b	0x76cc <_stogir.floating.validate+0xd8>
    76c8:      	movz	x4, #0x0, lsl #48
    76cc:      	cmp	x4, #0x0
    76d0:      	b.eq	0x7734 <_stogir.floating.validate+0x140>
    76d4:      	uxtb	w16, w3
    76d8:      	cmp	w16, wzr
    76dc:      	b.eq	0x7704 <_stogir.floating.validate+0x110>
    76e0:      	lsl	x3, x1, #4
    76e4:      	ldr	x4, [x0]
    76e8:      	add	x3, x3, x4
    76ec:      	ldr	x4, [x3]
    76f0:      	ldr	x3, [x3, #0x8]
    76f4:      	fmov	d31, x3
    76f8:      	mov	x3, x4
    76fc:      	fmov	x4, d31
    7700:      	b	0x7724 <_stogir.floating.validate+0x130>
    7704:      	lsl	x3, x5, #4
    7708:      	ldr	x4, [x0, #0x28]
    770c:      	add	x3, x3, x4
    7710:      	ldr	x4, [x3]
    7714:      	ldr	x3, [x3, #0x8]
    7718:      	fmov	d31, x3
    771c:      	mov	x3, x4
    7720:      	fmov	x4, d31
    7724:      	mov	x5, x4
    7728:      	mov	x4, x3
    772c:      	mov	x3, #0x1                ; =1
    7730:      	b	0x7740 <_stogir.floating.validate+0x14c>
    7734:      	movz	x3, #0x0, lsl #48
    7738:      	movz	x4, #0x0, lsl #48
    773c:      	movz	x5, #0x0, lsl #48
    7740:      	lsr	w3, w3, #0
    7744:      	lsr	x16, x3, #0
    7748:      	cmp	x16, #0x1
    774c:      	b.eq	0x7768 <_stogir.floating.validate+0x174>
    7750:      	b.lo	0x7758 <_stogir.floating.validate+0x164>
    7754:      	b	0x776c <_stogir.floating.validate+0x178>
    7758:      	cmp	x16, #0x0
    775c:      	b.eq	0x7764 <_stogir.floating.validate+0x170>
    7760:      	b	0x776c <_stogir.floating.validate+0x178>
    7764:      	b	0x7770 <_stogir.floating.validate+0x17c>
    7768:      	b	0x77ac <_stogir.floating.validate+0x1b8>
    776c:      	b	0x7b2c <_stogir.floating.validate+0x538>
    7770:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		0000000000007770:  ARM64_RELOC_PAGE21	l_stogir.399
    7774:      	ldr	x16, [x16]
		0000000000007774:  ARM64_RELOC_PAGEOFF12	l_stogir.399
    7778:      	orr	x0, x16, xzr
    777c:      	mov	x19, x8
    7780:      	mov	x1, x0
    7784:      	mov	x0, #0x1                ; =1
    7788:      	mov	x2, #0x1c               ; =28
    778c:      	str	x0, [x19]
    7790:      	str	x1, [x19, #0x8]
    7794:      	str	x2, [x19, #0x10]
    7798:      	ldr	x19, [sp, #0x40]
    779c:      	ldr	x29, [sp]
    77a0:      	ldr	x30, [sp, #0x8]
    77a4:      	add	sp, sp, #0x50
    77a8:      	ret
    77ac:      	add	x16, sp, #0x10
    77b0:      	str	x4, [x16]
    77b4:      	add	x16, sp, #0x10
    77b8:      	str	x5, [x16, #0x8]
    77bc:      	cmp	x1, #0x0
    77c0:      	b.gt	0x77ec <_stogir.floating.validate+0x1f8>
    77c4:      	mov	x19, x8
    77c8:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		00000000000077c8:  ARM64_RELOC_PAGE21	l_stogir.400
    77cc:      	ldr	x16, [x16]
		00000000000077cc:  ARM64_RELOC_PAGEOFF12	l_stogir.400
    77d0:      	orr	x0, x16, xzr
    77d4:      	mov	x1, x0
    77d8:      	mov	x0, #0x1                ; =1
    77dc:      	mov	x2, #0x1c               ; =28
    77e0:      	b	0x778c <_stogir.floating.validate+0x198>
    77e4:      	movz	x4, #0x0, lsl #48
    77e8:      	b	0x76c4 <_stogir.floating.validate+0xd0>
    77ec:      	uxtb	w4, w4
    77f0:      	orr	x1, x4, xzr
    77f4:      	cmp	x1, #0xe
    77f8:      	cset	w3, ge
    77fc:      	cmp	x1, #0x19
    7800:      	cset	w5, le
    7804:      	cmp	x1, #0x1f
    7808:      	cset	w6, eq
    780c:      	cmp	x1, #0x20
    7810:      	cset	w7, eq
    7814:      	uxtb	w16, w3
    7818:      	cmp	w16, wzr
    781c:      	b.eq	0x7878 <_stogir.floating.validate+0x284>
    7820:      	uxtb	w16, w5
    7824:      	cmp	w16, wzr
    7828:      	b.eq	0x7878 <_stogir.floating.validate+0x284>
    782c:      	cmp	x1, #0x1d
    7830:      	cset	w1, eq
    7834:      	ldr	x9, [x0, #0x78]
    7838:      	add	x2, x2, x9
    783c:      	ldr	w2, [x2]
    7840:      	uxtb	w16, w6
    7844:      	cmp	w16, wzr
    7848:      	b.ne	0x78b8 <_stogir.floating.validate+0x2c4>
    784c:      	uxtb	w16, w7
    7850:      	cmp	w16, wzr
    7854:      	b.ne	0x78b8 <_stogir.floating.validate+0x2c4>
    7858:      	uxtb	w16, w1
    785c:      	cmp	w16, wzr
    7860:      	mov	x16, #0x3               ; =3
    7864:      	mov	x17, #0x2               ; =2
    7868:      	csel	x6, x16, x17, ne
    786c:      	b	0x78bc <_stogir.floating.validate+0x2c8>
    7870:      	movz	x4, #0x0, lsl #48
    7874:      	b	0x76bc <_stogir.floating.validate+0xc8>
    7878:      	uxtb	w16, w6
    787c:      	cmp	w16, wzr
    7880:      	b.ne	0x782c <_stogir.floating.validate+0x238>
    7884:      	uxtb	w16, w7
    7888:      	cmp	w16, wzr
    788c:      	b.ne	0x782c <_stogir.floating.validate+0x238>
    7890:      	cmp	x1, #0x1a
    7894:      	b.lt	0x78a0 <_stogir.floating.validate+0x2ac>
    7898:      	cmp	x1, #0x1d
    789c:      	b.le	0x782c <_stogir.floating.validate+0x238>
    78a0:      	cmp	x1, #0x3a
    78a4:      	b.eq	0x782c <_stogir.floating.validate+0x238>
    78a8:      	cmp	x1, #0x3b
    78ac:      	b.eq	0x782c <_stogir.floating.validate+0x238>
    78b0:      	mov	x19, x8
    78b4:      	b	0x77c8 <_stogir.floating.validate+0x1d4>
    78b8:      	mov	x6, #0x1                ; =1
    78bc:      	sxtw	x2, w2
    78c0:      	lsr	w6, w6, #0
    78c4:      	sxtw	x6, w6
    78c8:      	cmp	x2, x6
    78cc:      	b.ne	0x7b3c <_stogir.floating.validate+0x548>
    78d0:      	add	x16, sp, #0x10
    78d4:      	ldr	w2, [x16, #0x4]
    78d8:      	sxtw	x2, w2
    78dc:      	cmp	x2, #0x0
    78e0:      	cset	w6, gt
    78e4:      	movz	x16, #0x0, lsl #48
    78e8:      	sub	x7, x16, x2
    78ec:      	sub	x9, x7, #0x1
    78f0:      	uxtb	w16, w6
    78f4:      	cmp	w16, wzr
    78f8:      	b.eq	0x7958 <_stogir.floating.validate+0x364>
    78fc:      	ldr	x7, [x0, #0x8]
    7900:      	cmp	x2, x7
    7904:      	b.ge	0x79a4 <_stogir.floating.validate+0x3b0>
    7908:      	add	x7, x0, #0x78
    790c:      	ldr	x7, [x7, #0x8]
    7910:      	cmp	x2, x7
    7914:      	b.ge	0x7a84 <_stogir.floating.validate+0x490>
    7918:      	lsl	x7, x2, #2
    791c:      	ldr	x10, [x0, #0x78]
    7920:      	add	x7, x7, x10
    7924:      	ldr	w7, [x7]
    7928:      	sxtw	x7, w7
    792c:      	cmp	x7, #0x0
    7930:      	cset	w7, ge
    7934:      	ubfx	x7, x7, #0, #8
    7938:      	b	0x7a88 <_stogir.floating.validate+0x494>
    793c:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		000000000000793c:  ARM64_RELOC_PAGE21	l_stogir.401
    7940:      	ldr	x16, [x16]
		0000000000007940:  ARM64_RELOC_PAGEOFF12	l_stogir.401
    7944:      	orr	x0, x16, xzr
    7948:      	mov	x1, x0
    794c:      	mov	x0, #0x1                ; =1
    7950:      	mov	x2, #0x1d               ; =29
    7954:      	b	0x77e0 <_stogir.floating.validate+0x1ec>
    7958:      	cmp	x2, #0x0
    795c:      	b.ge	0x79ac <_stogir.floating.validate+0x3b8>
    7960:      	add	x10, x0, #0x28
    7964:      	add	x11, x0, #0x50
    7968:      	ldr	x10, [x10, #0x8]
    796c:      	ldr	x11, [x11, #0x8]
    7970:      	cmp	x10, x11
    7974:      	b.ne	0x7a7c <_stogir.floating.validate+0x488>
    7978:      	cmp	x7, x10
    797c:      	b.gt	0x7b24 <_stogir.floating.validate+0x530>
    7980:      	lsl	x7, x9, #2
    7984:      	ldr	x10, [x0, #0x50]
    7988:      	add	x7, x7, x10
    798c:      	ldr	w7, [x7]
    7990:      	sxtw	x7, w7
    7994:      	cmp	x7, #0x0
    7998:      	cset	w7, gt
    799c:      	ubfx	x7, x7, #0, #8
    79a0:      	b	0x7b28 <_stogir.floating.validate+0x534>
    79a4:      	movz	x7, #0x0, lsl #48
    79a8:      	b	0x79b0 <_stogir.floating.validate+0x3bc>
    79ac:      	movz	x7, #0x0, lsl #48
    79b0:      	cmp	x7, #0x0
    79b4:      	b.eq	0x79f4 <_stogir.floating.validate+0x400>
    79b8:      	uxtb	w16, w6
    79bc:      	cmp	w16, wzr
    79c0:      	b.eq	0x79d8 <_stogir.floating.validate+0x3e4>
    79c4:      	lsl	x2, x2, #4
    79c8:      	ldr	x6, [x0]
    79cc:      	add	x2, x2, x6
    79d0:      	ldr	x2, [x2]
    79d4:      	b	0x79e8 <_stogir.floating.validate+0x3f4>
    79d8:      	lsl	x2, x9, #4
    79dc:      	ldr	x6, [x0, #0x28]
    79e0:      	add	x2, x2, x6
    79e4:      	ldr	x2, [x2]
    79e8:      	mov	x6, x2
    79ec:      	mov	x2, #0x1                ; =1
    79f0:      	b	0x79fc <_stogir.floating.validate+0x408>
    79f4:      	movz	x2, #0x0, lsl #48
    79f8:      	movz	x6, #0x0, lsl #48
    79fc:      	lsr	w2, w2, #0
    7a00:      	lsr	x16, x2, #0
    7a04:      	cmp	x16, #0x1
    7a08:      	b.eq	0x7a24 <_stogir.floating.validate+0x430>
    7a0c:      	b.lo	0x7a14 <_stogir.floating.validate+0x420>
    7a10:      	b	0x7a28 <_stogir.floating.validate+0x434>
    7a14:      	cmp	x16, #0x0
    7a18:      	b.eq	0x7a20 <_stogir.floating.validate+0x42c>
    7a1c:      	b	0x7a28 <_stogir.floating.validate+0x434>
    7a20:      	b	0x7a2c <_stogir.floating.validate+0x438>
    7a24:      	b	0x7a4c <_stogir.floating.validate+0x458>
    7a28:      	b	0x7b34 <_stogir.floating.validate+0x540>
    7a2c:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		0000000000007a2c:  ARM64_RELOC_PAGE21	l_stogir.402
    7a30:      	ldr	x16, [x16]
		0000000000007a30:  ARM64_RELOC_PAGEOFF12	l_stogir.402
    7a34:      	orr	x0, x16, xzr
    7a38:      	mov	x19, x8
    7a3c:      	mov	x1, x0
    7a40:      	mov	x0, #0x1                ; =1
    7a44:      	mov	x2, #0x18               ; =24
    7a48:      	b	0x7954 <_stogir.floating.validate+0x360>
    7a4c:      	lsr	w6, w6, #0
    7a50:      	add	x16, sp, #0x10
    7a54:      	ldr	w2, [x16]
    7a58:      	ubfx	x6, x6, #8, #8
    7a5c:      	uxtb	w16, w3
    7a60:      	cmp	w16, wzr
    7a64:      	b.eq	0x7ae0 <_stogir.floating.validate+0x4ec>
    7a68:      	uxtb	w16, w5
    7a6c:      	cmp	w16, wzr
    7a70:      	b.eq	0x7ae0 <_stogir.floating.validate+0x4ec>
    7a74:      	mov	x3, #0x1                ; =1
    7a78:      	b	0x7ae4 <_stogir.floating.validate+0x4f0>
    7a7c:      	movz	x7, #0x0, lsl #48
    7a80:      	b	0x79b0 <_stogir.floating.validate+0x3bc>
    7a84:      	movz	x7, #0x0, lsl #48
    7a88:      	b	0x79a8 <_stogir.floating.validate+0x3b4>
    7a8c:      	movz	x1, #0x0, lsl #48
    7a90:      	lsr	w2, w2, #0
    7a94:      	lsr	w3, w3, #0
    7a98:      	lsr	w4, w4, #0
    7a9c:      	lsr	w6, w6, #0
    7aa0:      	lsr	w1, w1, #0
    7aa4:      	mov	w5, w1
    7aa8:      	mov	w1, w4
    7aac:      	mov	w4, w3
    7ab0:      	mov	w3, w2
    7ab4:      	mov	w2, w6
    7ab8:      	mov	x19, x8
    7abc:      	add	x8, sp, #0x20
    7ac0:      	bl	0x7ac0 <_stogir.floating.validate+0x4cc>
		0000000000007ac0:  ARM64_RELOC_BRANCH26	_stogir.floating.operands
    7ac4:      	add	x16, sp, #0x20
    7ac8:      	ldr	x0, [x16]
    7acc:      	add	x16, sp, #0x20
    7ad0:      	ldr	x1, [x16, #0x8]
    7ad4:      	add	x16, sp, #0x20
    7ad8:      	ldr	x2, [x16, #0x10]
    7adc:      	b	0x7954 <_stogir.floating.validate+0x360>
    7ae0:      	orr	x3, x6, xzr
    7ae4:      	lsr	w3, w3, #0
    7ae8:      	ubfx	x2, x2, #8, #8
    7aec:      	sxtw	x3, w3
    7af0:      	cmp	x2, x3
    7af4:      	b.ne	0x7b44 <_stogir.floating.validate+0x550>
    7af8:      	add	x16, sp, #0x10
    7afc:      	ldr	w2, [x16, #0x4]
    7b00:      	add	x16, sp, #0x10
    7b04:      	ldr	w3, [x16, #0x8]
    7b08:      	uxtb	w16, w1
    7b0c:      	cmp	w16, wzr
    7b10:      	b.eq	0x7a8c <_stogir.floating.validate+0x498>
    7b14:      	add	x16, sp, #0x10
    7b18:      	ldr	w1, [x16, #0xc]
    7b1c:      	sxtw	x1, w1
    7b20:      	b	0x7a90 <_stogir.floating.validate+0x49c>
    7b24:      	movz	x7, #0x0, lsl #48
    7b28:      	b	0x7a80 <_stogir.floating.validate+0x48c>
    7b2c:      	brk	#0
    7b30:      	b	0x7b2c <_stogir.floating.validate+0x538>
    7b34:      	brk	#0
    7b38:      	b	0x7b34 <_stogir.floating.validate+0x540>
    7b3c:      	mov	x19, x8
    7b40:      	b	0x77c8 <_stogir.floating.validate+0x1d4>
    7b44:      	mov	x19, x8
    7b48:      	b	0x793c <_stogir.floating.validate+0x348>

0000000000007b4c <_stogir.types.integer?>:
    7b4c:      	sxtw	x0, w0
    7b50:      	cmp	x0, #0x1
    7b54:      	b.lt	0x7b68 <_stogir.types.integer?+0x1c>
    7b58:      	cmp	x0, #0xb
    7b5c:      	cset	w0, le
    7b60:      	ubfx	x0, x0, #0, #8
    7b64:      	b	0x7b6c <_stogir.types.integer?+0x20>
    7b68:      	movz	x0, #0x0, lsl #48
    7b6c:      	ret

0000000000007b70 <_stogir.integer-unary.valid-type?>:
    7b70:      	sxtw	x0, w0
    7b74:      	cmp	x0, #0x2d
    7b78:      	cset	w2, eq
    7b7c:      	cmp	x0, #0x1f
    7b80:      	cset	w3, eq
    7b84:      	cmp	x0, #0x20
    7b88:      	cset	w4, eq
    7b8c:      	cmp	x0, #0x36
    7b90:      	cset	w5, eq
    7b94:      	uxtb	w16, w3
    7b98:      	cmp	w16, wzr
    7b9c:      	b.ne	0x7be4 <_stogir.integer-unary.valid-type?+0x74>
    7ba0:      	uxtb	w16, w4
    7ba4:      	cmp	w16, wzr
    7ba8:      	b.ne	0x7be4 <_stogir.integer-unary.valid-type?+0x74>
    7bac:      	uxtb	w16, w2
    7bb0:      	cmp	w16, wzr
    7bb4:      	b.ne	0x7be4 <_stogir.integer-unary.valid-type?+0x74>
    7bb8:      	uxtb	w16, w5
    7bbc:      	cmp	w16, wzr
    7bc0:      	b.ne	0x7be4 <_stogir.integer-unary.valid-type?+0x74>
    7bc4:      	cmp	x0, #0x37
    7bc8:      	b.eq	0x7be4 <_stogir.integer-unary.valid-type?+0x74>
    7bcc:      	cmp	x0, #0x38
    7bd0:      	b.eq	0x7be4 <_stogir.integer-unary.valid-type?+0x74>
    7bd4:      	cmp	x0, #0x39
    7bd8:      	b.eq	0x7be4 <_stogir.integer-unary.valid-type?+0x74>
    7bdc:      	movz	x0, #0x0, lsl #48
    7be0:      	b	0x7c1c <_stogir.integer-unary.valid-type?+0xac>
    7be4:      	sxtw	x1, w1
    7be8:      	cmp	x1, #0x1
    7bec:      	b.lt	0x7c18 <_stogir.integer-unary.valid-type?+0xa8>
    7bf0:      	cmp	x1, #0xb
    7bf4:      	cset	w0, le
    7bf8:      	uxtb	w16, w0
    7bfc:      	cmp	w16, wzr
    7c00:      	b.eq	0x7c18 <_stogir.integer-unary.valid-type?+0xa8>
    7c04:      	uxtb	w16, w2
    7c08:      	cmp	w16, wzr
    7c0c:      	b.eq	0x7c28 <_stogir.integer-unary.valid-type?+0xb8>
    7c10:      	mov	x0, #0x1                ; =1
    7c14:      	b	0x7c24 <_stogir.integer-unary.valid-type?+0xb4>
    7c18:      	movz	x0, #0x0, lsl #48
    7c1c:      	ret
    7c20:      	mov	x0, #0x1                ; =1
    7c24:      	b	0x7c1c <_stogir.integer-unary.valid-type?+0xac>
    7c28:      	cmp	x1, #0x1
    7c2c:      	b.ne	0x7c38 <_stogir.integer-unary.valid-type?+0xc8>
    7c30:      	movz	x0, #0x0, lsl #48
    7c34:      	b	0x7c24 <_stogir.integer-unary.valid-type?+0xb4>
    7c38:      	cmp	x1, #0x6
    7c3c:      	cset	w2, eq
    7c40:      	uxtb	w16, w3
    7c44:      	cmp	w16, wzr
    7c48:      	b.eq	0x7c5c <_stogir.integer-unary.valid-type?+0xec>
    7c4c:      	uxtb	w16, w2
    7c50:      	cmp	w16, wzr
    7c54:      	cset	x0, eq
    7c58:      	b	0x7c24 <_stogir.integer-unary.valid-type?+0xb4>
    7c5c:      	uxtb	w16, w4
    7c60:      	cmp	w16, wzr
    7c64:      	b.eq	0x7c80 <_stogir.integer-unary.valid-type?+0x110>
    7c68:      	cmp	x1, #0x7
    7c6c:      	b.lt	0x7c78 <_stogir.integer-unary.valid-type?+0x108>
    7c70:      	ubfx	x0, x0, #0, #8
    7c74:      	b	0x7c7c <_stogir.integer-unary.valid-type?+0x10c>
    7c78:      	movz	x0, #0x0, lsl #48
    7c7c:      	b	0x7c24 <_stogir.integer-unary.valid-type?+0xb4>
    7c80:      	uxtb	w16, w5
    7c84:      	cmp	w16, wzr
    7c88:      	b.eq	0x7c20 <_stogir.integer-unary.valid-type?+0xb0>
    7c8c:      	cmp	x1, #0x3
    7c90:      	b.ne	0x7cac <_stogir.integer-unary.valid-type?+0x13c>
    7c94:      	mov	x0, #0x1                ; =1
    7c98:      	b	0x7ca8 <_stogir.integer-unary.valid-type?+0x138>
    7c9c:      	cmp	x1, #0xb
    7ca0:      	cset	w0, eq
    7ca4:      	ubfx	x0, x0, #0, #8
    7ca8:      	b	0x7c24 <_stogir.integer-unary.valid-type?+0xb4>
    7cac:      	cmp	x1, #0x4
    7cb0:      	b.ne	0x7cbc <_stogir.integer-unary.valid-type?+0x14c>
    7cb4:      	mov	x0, #0x1                ; =1
    7cb8:      	b	0x7ca8 <_stogir.integer-unary.valid-type?+0x138>
    7cbc:      	cmp	x1, #0x5
    7cc0:      	b.ne	0x7ccc <_stogir.integer-unary.valid-type?+0x15c>
    7cc4:      	mov	x0, #0x1                ; =1
    7cc8:      	b	0x7ca8 <_stogir.integer-unary.valid-type?+0x138>
    7ccc:      	uxtb	w16, w2
    7cd0:      	cmp	w16, wzr
    7cd4:      	b.eq	0x7ce0 <_stogir.integer-unary.valid-type?+0x170>
    7cd8:      	mov	x0, #0x1                ; =1
    7cdc:      	b	0x7ca8 <_stogir.integer-unary.valid-type?+0x138>
    7ce0:      	cmp	x1, #0x9
    7ce4:      	b.ne	0x7cf0 <_stogir.integer-unary.valid-type?+0x180>
    7ce8:      	mov	x0, #0x1                ; =1
    7cec:      	b	0x7ca8 <_stogir.integer-unary.valid-type?+0x138>
    7cf0:      	cmp	x1, #0xa
    7cf4:      	b.ne	0x7c9c <_stogir.integer-unary.valid-type?+0x12c>
    7cf8:      	mov	x0, #0x1                ; =1
    7cfc:      	b	0x7ca8 <_stogir.integer-unary.valid-type?+0x138>

0000000000007d00 <_stogir.integer-binary.valid-type?>:
    7d00:      	sxtw	x0, w0
    7d04:      	cmp	x0, #0x3a
    7d08:      	cset	w2, eq
    7d0c:      	cmp	x0, #0x3b
    7d10:      	cset	w3, eq
    7d14:      	cmp	x0, #0x1a
    7d18:      	b.lt	0x7d6c <_stogir.integer-binary.valid-type?+0x6c>
    7d1c:      	cmp	x0, #0x1e
    7d20:      	b.gt	0x7d6c <_stogir.integer-binary.valid-type?+0x6c>
    7d24:      	sxtw	x1, w1
    7d28:      	cmp	x1, #0x1
    7d2c:      	b.lt	0x7d9c <_stogir.integer-binary.valid-type?+0x9c>
    7d30:      	cmp	x1, #0xb
    7d34:      	b.gt	0x7d9c <_stogir.integer-binary.valid-type?+0x9c>
    7d38:      	cmp	x1, #0x1
    7d3c:      	b.ne	0x7da4 <_stogir.integer-binary.valid-type?+0xa4>
    7d40:      	cmp	x0, #0x2e
    7d44:      	b.eq	0x7dac <_stogir.integer-binary.valid-type?+0xac>
    7d48:      	cmp	x0, #0x2f
    7d4c:      	b.eq	0x7dac <_stogir.integer-binary.valid-type?+0xac>
    7d50:      	cmp	x0, #0x30
    7d54:      	b.eq	0x7dac <_stogir.integer-binary.valid-type?+0xac>
    7d58:      	uxtb	w16, w2
    7d5c:      	cmp	w16, wzr
    7d60:      	b.eq	0x7db4 <_stogir.integer-binary.valid-type?+0xb4>
    7d64:      	mov	x0, #0x1                ; =1
    7d68:      	b	0x7dbc <_stogir.integer-binary.valid-type?+0xbc>
    7d6c:      	cmp	x0, #0x2e
    7d70:      	b.lt	0x7d7c <_stogir.integer-binary.valid-type?+0x7c>
    7d74:      	cmp	x0, #0x35
    7d78:      	b.le	0x7d24 <_stogir.integer-binary.valid-type?+0x24>
    7d7c:      	uxtb	w16, w2
    7d80:      	cmp	w16, wzr
    7d84:      	b.ne	0x7d24 <_stogir.integer-binary.valid-type?+0x24>
    7d88:      	uxtb	w16, w3
    7d8c:      	cmp	w16, wzr
    7d90:      	b.ne	0x7d24 <_stogir.integer-binary.valid-type?+0x24>
    7d94:      	movz	x0, #0x0, lsl #48
    7d98:      	b	0x7da0 <_stogir.integer-binary.valid-type?+0xa0>
    7d9c:      	movz	x0, #0x0, lsl #48
    7da0:      	ret
    7da4:      	mov	x0, #0x1                ; =1
    7da8:      	b	0x7da0 <_stogir.integer-binary.valid-type?+0xa0>
    7dac:      	mov	x0, #0x1                ; =1
    7db0:      	b	0x7da8 <_stogir.integer-binary.valid-type?+0xa8>
    7db4:      	ubfx	x3, x3, #0, #8
    7db8:      	mov	x0, x3
    7dbc:      	b	0x7db0 <_stogir.integer-binary.valid-type?+0xb0>

0000000000007dc0 <_coil.core.Len$slice$len__u8>:
    7dc0:      	mov	x0, x1
    7dc4:      	ret

0000000000007dc8 <_inherent$slice$data__u8>:
    7dc8:      	ret

0000000000007dcc <_coil.mem.eql__u8>:
    7dcc:      	sub	sp, sp, #0x10
    7dd0:      	str	x29, [sp]
    7dd4:      	str	x30, [sp, #0x8]
    7dd8:      	mov	x29, sp
    7ddc:      	cmp	x2, #0x0
    7de0:      	b.ne	0x7dec <_coil.mem.eql__u8+0x20>
    7de4:      	mov	x0, #0x1                ; =1
    7de8:      	b	0x7e08 <_coil.mem.eql__u8+0x3c>
    7dec:      	lsr	x2, x2, #0
    7df0:      	bl	0x7df0 <_coil.mem.eql__u8+0x24>
		0000000000007df0:  ARM64_RELOC_BRANCH26	_memcmp
    7df4:      	lsr	w0, w0, #0
    7df8:      	sxtw	x0, w0
    7dfc:      	cmp	x0, #0x0
    7e00:      	cset	w0, eq
    7e04:      	ubfx	x0, x0, #0, #8
    7e08:      	ldr	x29, [sp]
    7e0c:      	ldr	x30, [sp, #0x8]
    7e10:      	add	sp, sp, #0x10
    7e14:      	ret

0000000000007e18 <_stogir.opcode.count>:
    7e18:      	mov	x0, #0x83               ; =131
    7e1c:      	ret

0000000000007e20 <_stogir.types.valid-scalar?>:
    7e20:      	sxtw	x0, w0
    7e24:      	cmp	x0, #0x0
    7e28:      	b.lt	0x7e3c <_stogir.types.valid-scalar?+0x1c>
    7e2c:      	cmp	x0, #0xd
    7e30:      	cset	w0, le
    7e34:      	ubfx	x0, x0, #0, #8
    7e38:      	b	0x7e40 <_stogir.types.valid-scalar?+0x20>
    7e3c:      	movz	x0, #0x0, lsl #48
    7e40:      	ret

0000000000007e44 <_stogir.types.vector?>:
    7e44:      	sxtw	x0, w0
    7e48:      	cmp	x0, #0xf
    7e4c:      	b.le	0x7e88 <_stogir.types.vector?+0x44>
    7e50:      	cmp	x0, #0x80
    7e54:      	b.ge	0x7e98 <_stogir.types.vector?+0x54>
    7e58:      	and	x1, x0, #0xf
    7e5c:      	lsr	w1, w1, #0
    7e60:      	sxtw	x1, w1
    7e64:      	cmp	x1, #0x1
    7e68:      	b.lt	0x7e90 <_stogir.types.vector?+0x4c>
    7e6c:      	and	x0, x0, #0xf
    7e70:      	lsr	w0, w0, #0
    7e74:      	sxtw	x0, w0
    7e78:      	cmp	x0, #0xd
    7e7c:      	cset	w0, le
    7e80:      	ubfx	x0, x0, #0, #8
    7e84:      	b	0x7e94 <_stogir.types.vector?+0x50>
    7e88:      	movz	x0, #0x0, lsl #48
    7e8c:      	b	0x7e94 <_stogir.types.vector?+0x50>
    7e90:      	movz	x0, #0x0, lsl #48
    7e94:      	ret
    7e98:      	movz	x0, #0x0, lsl #48
    7e9c:      	b	0x7e94 <_stogir.types.vector?+0x50>

0000000000007ea0 <_coil.core.Get$slice$get__i8>:
    7ea0:      	lsr	x1, x2, #0
    7ea4:      	add	x0, x1, x0
    7ea8:      	ldrsb	w0, [x0]
    7eac:      	sxtb	x0, w0
    7eb0:      	ret

0000000000007eb4 <_stogir.opcode.metadata>:
    7eb4:      	sub	sp, sp, #0x10
    7eb8:      	mov	x0, sp
    7ebc:      	adrp	x16, 0x7000 <_stogir.conversion.validate+0xb8>
		0000000000007ebc:  ARM64_RELOC_PAGE21	l_stogir.403
    7ec0:      	ldr	x16, [x16]
		0000000000007ec0:  ARM64_RELOC_PAGEOFF12	l_stogir.403
    7ec4:      	orr	x1, x16, xzr
    7ec8:      	str	x1, [x0]
    7ecc:      	mov	x17, #0x83              ; =131
    7ed0:      	str	x17, [x0, #0x8]
    7ed4:      	ldr	x0, [sp]
    7ed8:      	ldr	x1, [sp, #0x8]
    7edc:      	add	sp, sp, #0x10
    7ee0:      	ret

0000000000007ee4 <_coil.core.Get$slice$get__u32>:
    7ee4:      	lsl	x1, x2, #2
    7ee8:      	add	x0, x1, x0
    7eec:      	ldr	w0, [x0]
    7ef0:      	ret

0000000000007ef4 <_stogir.opcode.operand-code-word>:
    7ef4:      	sxtw	x1, w1
    7ef8:      	cmp	x1, #0x0
    7efc:      	b.le	0x7f10 <_stogir.opcode.operand-code-word+0x1c>
    7f00:      	cmp	x1, #0x4
    7f04:      	b.le	0x7f18 <_stogir.opcode.operand-code-word+0x24>
    7f08:      	mov	x1, #0x4                ; =4
    7f0c:      	b	0x7f24 <_stogir.opcode.operand-code-word+0x30>
    7f10:      	movz	x0, #0x0, lsl #48
    7f14:      	b	0x7f44 <_stogir.opcode.operand-code-word+0x50>
    7f18:      	sub	x1, x1, #0x1
    7f1c:      	lsr	w1, w1, #0
    7f20:      	sxtw	x1, w1
    7f24:      	ubfx	x0, x0, #0, #32
    7f28:      	lsl	x1, x1, #2
    7f2c:      	lsr	w1, w1, #0
    7f30:      	ubfx	x1, x1, #0, #32
    7f34:      	lsr	x0, x0, x1
    7f38:      	lsr	w0, w0, #0
    7f3c:      	and	x0, x0, #0xf
    7f40:      	lsr	w0, w0, #0
    7f44:      	ret

0000000000007f48 <_inherent$coil.arraylist.ArrayList$at__stogir.node.Node>:
    7f48:      	lsl	x1, x1, #4
    7f4c:      	ldr	x0, [x0]
    7f50:      	add	x0, x1, x0
    7f54:      	ret

0000000000007f58 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.strings.Entry>:
    7f58:      	ldr	x0, [x0, #0x8]
    7f5c:      	ret

0000000000007f60 <_coil.core.Len$coil.arraylist.ArrayList$len__u8>:
    7f60:      	ldr	x0, [x0, #0x8]
    7f64:      	ret

0000000000007f68 <_inherent$coil.arraylist.ArrayList$slice__u8>:
    7f68:      	sub	sp, sp, #0x10
    7f6c:      	mov	x1, sp
    7f70:      	ldr	x2, [x0]
    7f74:      	ldr	x0, [x0, #0x8]
    7f78:      	str	x2, [x1]
    7f7c:      	str	x0, [x1, #0x8]
    7f80:      	ldr	x0, [sp]
    7f84:      	ldr	x1, [sp, #0x8]
    7f88:      	add	sp, sp, #0x10
    7f8c:      	ret

0000000000007f90 <_coil.slice.subslice__u8>:
    7f90:      	sub	sp, sp, #0x10
    7f94:      	mov	x1, sp
    7f98:      	lsr	x4, x2, #0
    7f9c:      	sub	x2, x3, x2
    7fa0:      	add	x0, x4, x0
    7fa4:      	str	x0, [x1]
    7fa8:      	str	x2, [x1, #0x8]
    7fac:      	ldr	x0, [sp]
    7fb0:      	ldr	x1, [sp, #0x8]
    7fb4:      	add	sp, sp, #0x10
    7fb8:      	ret

0000000000007fbc <_stogir.floating.operation?>:
    7fbc:      	sxtw	x0, w0
    7fc0:      	cmp	x0, #0xe
    7fc4:      	b.lt	0x7fd8 <_stogir.floating.operation?+0x1c>
    7fc8:      	cmp	x0, #0x19
    7fcc:      	b.gt	0x7fd8 <_stogir.floating.operation?+0x1c>
    7fd0:      	mov	x0, #0x1                ; =1
    7fd4:      	b	0x8004 <_stogir.floating.operation?+0x48>
    7fd8:      	cmp	x0, #0x1f
    7fdc:      	b.eq	0x8000 <_stogir.floating.operation?+0x44>
    7fe0:      	cmp	x0, #0x20
    7fe4:      	b.eq	0x8000 <_stogir.floating.operation?+0x44>
    7fe8:      	cmp	x0, #0x1a
    7fec:      	b.lt	0x8018 <_stogir.floating.operation?+0x5c>
    7ff0:      	cmp	x0, #0x1d
    7ff4:      	b.gt	0x8018 <_stogir.floating.operation?+0x5c>
    7ff8:      	mov	x0, #0x1                ; =1
    7ffc:      	b	0x8014 <_stogir.floating.operation?+0x58>
    8000:      	mov	x0, #0x1                ; =1
    8004:      	ret
    8008:      	cmp	x0, #0x3b
    800c:      	cset	w0, eq
    8010:      	ubfx	x0, x0, #0, #8
    8014:      	b	0x8004 <_stogir.floating.operation?+0x48>
    8018:      	cmp	x0, #0x3a
    801c:      	b.ne	0x8008 <_stogir.floating.operation?+0x4c>
    8020:      	mov	x0, #0x1                ; =1
    8024:      	b	0x8014 <_stogir.floating.operation?+0x58>

0000000000008028 <_stogir.types.floating?>:
    8028:      	sxtw	x0, w0
    802c:      	cmp	x0, #0xc
    8030:      	b.ne	0x803c <_stogir.types.floating?+0x14>
    8034:      	mov	x0, #0x1                ; =1
    8038:      	b	0x8048 <_stogir.types.floating?+0x20>
    803c:      	cmp	x0, #0xd
    8040:      	cset	w0, eq
    8044:      	ubfx	x0, x0, #0, #8
    8048:      	ret

000000000000804c <_stogir.vector-lanes.validate>:
    804c:      	sub	sp, sp, #0x50
    8050:      	str	x29, [sp]
    8054:      	str	x30, [sp, #0x8]
    8058:      	mov	x29, sp
    805c:      	str	x19, [sp, #0x40]
    8060:      	sxtw	x1, w1
    8064:      	lsl	x3, x1, #2
    8068:      	cmp	x1, #0x0
    806c:      	cset	w4, gt
    8070:      	movz	x16, #0x0, lsl #48
    8074:      	sub	x5, x16, x1
    8078:      	sub	x6, x5, #0x1
    807c:      	uxtb	w16, w4
    8080:      	cmp	w16, wzr
    8084:      	b.eq	0x80c4 <_stogir.vector-lanes.validate+0x78>
    8088:      	ldr	x5, [x0, #0x8]
    808c:      	cmp	x1, x5
    8090:      	b.ge	0x8118 <_stogir.vector-lanes.validate+0xcc>
    8094:      	add	x5, x0, #0x78
    8098:      	ldr	x5, [x5, #0x8]
    809c:      	cmp	x1, x5
    80a0:      	b.ge	0x823c <_stogir.vector-lanes.validate+0x1f0>
    80a4:      	ldr	x5, [x0, #0x78]
    80a8:      	add	x5, x3, x5
    80ac:      	ldr	w5, [x5]
    80b0:      	sxtw	x5, w5
    80b4:      	cmp	x5, #0x0
    80b8:      	cset	w5, ge
    80bc:      	ubfx	x5, x5, #0, #8
    80c0:      	b	0x8240 <_stogir.vector-lanes.validate+0x1f4>
    80c4:      	cmp	x1, #0x0
    80c8:      	b.ge	0x8120 <_stogir.vector-lanes.validate+0xd4>
    80cc:      	add	x7, x0, #0x28
    80d0:      	add	x9, x0, #0x50
    80d4:      	ldr	x7, [x7, #0x8]
    80d8:      	ldr	x9, [x9, #0x8]
    80dc:      	cmp	x7, x9
    80e0:      	b.ne	0x8110 <_stogir.vector-lanes.validate+0xc4>
    80e4:      	cmp	x5, x7
    80e8:      	b.gt	0x8280 <_stogir.vector-lanes.validate+0x234>
    80ec:      	lsl	x5, x6, #2
    80f0:      	ldr	x7, [x0, #0x50]
    80f4:      	add	x5, x5, x7
    80f8:      	ldr	w5, [x5]
    80fc:      	sxtw	x5, w5
    8100:      	cmp	x5, #0x0
    8104:      	cset	w5, gt
    8108:      	ubfx	x5, x5, #0, #8
    810c:      	b	0x8284 <_stogir.vector-lanes.validate+0x238>
    8110:      	movz	x5, #0x0, lsl #48
    8114:      	b	0x8124 <_stogir.vector-lanes.validate+0xd8>
    8118:      	movz	x5, #0x0, lsl #48
    811c:      	b	0x8124 <_stogir.vector-lanes.validate+0xd8>
    8120:      	movz	x5, #0x0, lsl #48
    8124:      	cmp	x5, #0x0
    8128:      	b.eq	0x818c <_stogir.vector-lanes.validate+0x140>
    812c:      	uxtb	w16, w4
    8130:      	cmp	w16, wzr
    8134:      	b.eq	0x815c <_stogir.vector-lanes.validate+0x110>
    8138:      	lsl	x4, x1, #4
    813c:      	ldr	x5, [x0]
    8140:      	add	x4, x4, x5
    8144:      	ldr	x5, [x4]
    8148:      	ldr	x4, [x4, #0x8]
    814c:      	fmov	d31, x4
    8150:      	mov	x4, x5
    8154:      	fmov	x5, d31
    8158:      	b	0x817c <_stogir.vector-lanes.validate+0x130>
    815c:      	lsl	x4, x6, #4
    8160:      	ldr	x5, [x0, #0x28]
    8164:      	add	x4, x4, x5
    8168:      	ldr	x5, [x4]
    816c:      	ldr	x4, [x4, #0x8]
    8170:      	fmov	d31, x4
    8174:      	mov	x4, x5
    8178:      	fmov	x5, d31
    817c:      	mov	x6, x5
    8180:      	mov	x5, x4
    8184:      	mov	x4, #0x1                ; =1
    8188:      	b	0x8198 <_stogir.vector-lanes.validate+0x14c>
    818c:      	movz	x4, #0x0, lsl #48
    8190:      	movz	x5, #0x0, lsl #48
    8194:      	movz	x6, #0x0, lsl #48
    8198:      	lsr	w4, w4, #0
    819c:      	lsr	x16, x4, #0
    81a0:      	cmp	x16, #0x1
    81a4:      	b.eq	0x81c0 <_stogir.vector-lanes.validate+0x174>
    81a8:      	b.lo	0x81b0 <_stogir.vector-lanes.validate+0x164>
    81ac:      	b	0x81c4 <_stogir.vector-lanes.validate+0x178>
    81b0:      	cmp	x16, #0x0
    81b4:      	b.eq	0x81bc <_stogir.vector-lanes.validate+0x170>
    81b8:      	b	0x81c4 <_stogir.vector-lanes.validate+0x178>
    81bc:      	b	0x81c8 <_stogir.vector-lanes.validate+0x17c>
    81c0:      	b	0x81e8 <_stogir.vector-lanes.validate+0x19c>
    81c4:      	b	0x8364 <_stogir.vector-lanes.validate+0x318>
    81c8:      	adrp	x16, 0x8000 <_stogir.floating.operation?+0x44>
		00000000000081c8:  ARM64_RELOC_PAGE21	l_stogir.404
    81cc:      	ldr	x16, [x16]
		00000000000081cc:  ARM64_RELOC_PAGEOFF12	l_stogir.404
    81d0:      	orr	x0, x16, xzr
    81d4:      	mov	x19, x8
    81d8:      	mov	x1, x0
    81dc:      	mov	x0, #0x1                ; =1
    81e0:      	mov	x2, #0x1f               ; =31
    81e4:      	b	0x821c <_stogir.vector-lanes.validate+0x1d0>
    81e8:      	add	x16, sp, #0x10
    81ec:      	str	x5, [x16]
    81f0:      	add	x16, sp, #0x10
    81f4:      	str	x6, [x16, #0x8]
    81f8:      	cmp	x1, #0x0
    81fc:      	b.gt	0x8244 <_stogir.vector-lanes.validate+0x1f8>
    8200:      	mov	x19, x8
    8204:      	adrp	x16, 0x8000 <_stogir.floating.operation?+0x44>
		0000000000008204:  ARM64_RELOC_PAGE21	l_stogir.405
    8208:      	ldr	x16, [x16]
		0000000000008208:  ARM64_RELOC_PAGEOFF12	l_stogir.405
    820c:      	orr	x0, x16, xzr
    8210:      	mov	x1, x0
    8214:      	mov	x0, #0x1                ; =1
    8218:      	mov	x2, #0x25               ; =37
    821c:      	str	x0, [x19]
    8220:      	str	x1, [x19, #0x8]
    8224:      	str	x2, [x19, #0x10]
    8228:      	ldr	x19, [sp, #0x40]
    822c:      	ldr	x29, [sp]
    8230:      	ldr	x30, [sp, #0x8]
    8234:      	add	sp, sp, #0x50
    8238:      	ret
    823c:      	movz	x5, #0x0, lsl #48
    8240:      	b	0x811c <_stogir.vector-lanes.validate+0xd0>
    8244:      	uxtb	w5, w5
    8248:      	orr	x1, x5, xzr
    824c:      	cmp	x1, #0x3d
    8250:      	b.lt	0x836c <_stogir.vector-lanes.validate+0x320>
    8254:      	cmp	x1, #0x3f
    8258:      	b.gt	0x8374 <_stogir.vector-lanes.validate+0x328>
    825c:      	cmp	x1, #0x3e
    8260:      	cset	w4, eq
    8264:      	ldr	x6, [x0, #0x78]
    8268:      	add	x3, x3, x6
    826c:      	ldr	w3, [x3]
    8270:      	cmp	x1, #0x3d
    8274:      	b.ne	0x82f4 <_stogir.vector-lanes.validate+0x2a8>
    8278:      	mov	x6, #0x2                ; =2
    827c:      	b	0x8308 <_stogir.vector-lanes.validate+0x2bc>
    8280:      	movz	x5, #0x0, lsl #48
    8284:      	b	0x8114 <_stogir.vector-lanes.validate+0xc8>
    8288:      	movz	x4, #0x0, lsl #48
    828c:      	lsr	w2, w2, #0
    8290:      	lsr	w6, w6, #0
    8294:      	lsr	w1, w1, #0
    8298:      	lsr	w5, w5, #0
    829c:      	lsr	w4, w4, #0
    82a0:      	ubfx	x3, x3, #8, #8
    82a4:      	lsr	w3, w3, #0
    82a8:      	mov	x19, x8
    82ac:      	add	x8, sp, #0x20
    82b0:      	fmov	s31, w1
    82b4:      	mov	w1, w5
    82b8:      	fmov	w5, s31
    82bc:      	fmov	s31, w2
    82c0:      	mov	w2, w3
    82c4:      	fmov	w3, s31
    82c8:      	fmov	s31, w4
    82cc:      	mov	w4, w6
    82d0:      	fmov	w6, s31
    82d4:      	bl	0x82d4 <_stogir.vector-lanes.validate+0x288>
		00000000000082d4:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operands
    82d8:      	add	x16, sp, #0x20
    82dc:      	ldr	x0, [x16]
    82e0:      	add	x16, sp, #0x20
    82e4:      	ldr	x1, [x16, #0x8]
    82e8:      	add	x16, sp, #0x20
    82ec:      	ldr	x2, [x16, #0x10]
    82f0:      	b	0x821c <_stogir.vector-lanes.validate+0x1d0>
    82f4:      	uxtb	w16, w4
    82f8:      	cmp	w16, wzr
    82fc:      	mov	x16, #0x3               ; =3
    8300:      	mov	x17, #0x1               ; =1
    8304:      	csel	x6, x16, x17, ne
    8308:      	sxtw	x3, w3
    830c:      	lsr	w6, w6, #0
    8310:      	sxtw	x6, w6
    8314:      	cmp	x3, x6
    8318:      	b.ne	0x837c <_stogir.vector-lanes.validate+0x330>
    831c:      	add	x16, sp, #0x10
    8320:      	ldr	w3, [x16]
    8324:      	add	x16, sp, #0x10
    8328:      	ldr	w6, [x16, #0x4]
    832c:      	cmp	x1, #0x3f
    8330:      	b.ne	0x833c <_stogir.vector-lanes.validate+0x2f0>
    8334:      	movz	x1, #0x0, lsl #48
    8338:      	b	0x8348 <_stogir.vector-lanes.validate+0x2fc>
    833c:      	add	x16, sp, #0x10
    8340:      	ldr	w1, [x16, #0x8]
    8344:      	sxtw	x1, w1
    8348:      	uxtb	w16, w4
    834c:      	cmp	w16, wzr
    8350:      	b.eq	0x8288 <_stogir.vector-lanes.validate+0x23c>
    8354:      	add	x16, sp, #0x10
    8358:      	ldr	w4, [x16, #0xc]
    835c:      	sxtw	x4, w4
    8360:      	b	0x828c <_stogir.vector-lanes.validate+0x240>
    8364:      	brk	#0
    8368:      	b	0x8364 <_stogir.vector-lanes.validate+0x318>
    836c:      	mov	x19, x8
    8370:      	b	0x8204 <_stogir.vector-lanes.validate+0x1b8>
    8374:      	mov	x19, x8
    8378:      	b	0x8204 <_stogir.vector-lanes.validate+0x1b8>
    837c:      	mov	x19, x8
    8380:      	b	0x8204 <_stogir.vector-lanes.validate+0x1b8>

0000000000008384 <_stogir.vector-comparison.node?>:
    8384:      	sxtw	x1, w1
    8388:      	cmp	x1, #0x0
    838c:      	cset	w2, gt
    8390:      	movz	x16, #0x0, lsl #48
    8394:      	sub	x3, x16, x1
    8398:      	sub	x4, x3, #0x1
    839c:      	uxtb	w16, w2
    83a0:      	cmp	w16, wzr
    83a4:      	b.eq	0x83e8 <_stogir.vector-comparison.node?+0x64>
    83a8:      	ldr	x3, [x0, #0x8]
    83ac:      	cmp	x1, x3
    83b0:      	b.ge	0x843c <_stogir.vector-comparison.node?+0xb8>
    83b4:      	add	x3, x0, #0x78
    83b8:      	ldr	x3, [x3, #0x8]
    83bc:      	cmp	x1, x3
    83c0:      	b.ge	0x8524 <_stogir.vector-comparison.node?+0x1a0>
    83c4:      	lsl	x3, x1, #2
    83c8:      	ldr	x5, [x0, #0x78]
    83cc:      	add	x3, x3, x5
    83d0:      	ldr	w3, [x3]
    83d4:      	sxtw	x3, w3
    83d8:      	cmp	x3, #0x0
    83dc:      	cset	w3, ge
    83e0:      	ubfx	x3, x3, #0, #8
    83e4:      	b	0x8528 <_stogir.vector-comparison.node?+0x1a4>
    83e8:      	cmp	x1, #0x0
    83ec:      	b.ge	0x8444 <_stogir.vector-comparison.node?+0xc0>
    83f0:      	add	x5, x0, #0x28
    83f4:      	add	x6, x0, #0x50
    83f8:      	ldr	x5, [x5, #0x8]
    83fc:      	ldr	x6, [x6, #0x8]
    8400:      	cmp	x5, x6
    8404:      	b.ne	0x8434 <_stogir.vector-comparison.node?+0xb0>
    8408:      	cmp	x3, x5
    840c:      	b.gt	0x852c <_stogir.vector-comparison.node?+0x1a8>
    8410:      	lsl	x3, x4, #2
    8414:      	ldr	x5, [x0, #0x50]
    8418:      	add	x3, x3, x5
    841c:      	ldr	w3, [x3]
    8420:      	sxtw	x3, w3
    8424:      	cmp	x3, #0x0
    8428:      	cset	w3, gt
    842c:      	ubfx	x3, x3, #0, #8
    8430:      	b	0x8530 <_stogir.vector-comparison.node?+0x1ac>
    8434:      	movz	x3, #0x0, lsl #48
    8438:      	b	0x8448 <_stogir.vector-comparison.node?+0xc4>
    843c:      	movz	x3, #0x0, lsl #48
    8440:      	b	0x8448 <_stogir.vector-comparison.node?+0xc4>
    8444:      	movz	x3, #0x0, lsl #48
    8448:      	cmp	x3, #0x0
    844c:      	b.eq	0x848c <_stogir.vector-comparison.node?+0x108>
    8450:      	uxtb	w16, w2
    8454:      	cmp	w16, wzr
    8458:      	b.eq	0x8470 <_stogir.vector-comparison.node?+0xec>
    845c:      	lsl	x1, x1, #4
    8460:      	ldr	x0, [x0]
    8464:      	add	x0, x1, x0
    8468:      	ldr	x0, [x0]
    846c:      	b	0x8480 <_stogir.vector-comparison.node?+0xfc>
    8470:      	lsl	x1, x4, #4
    8474:      	ldr	x0, [x0, #0x28]
    8478:      	add	x0, x1, x0
    847c:      	ldr	x0, [x0]
    8480:      	mov	x1, x0
    8484:      	mov	x0, #0x1                ; =1
    8488:      	b	0x8494 <_stogir.vector-comparison.node?+0x110>
    848c:      	movz	x0, #0x0, lsl #48
    8490:      	movz	x1, #0x0, lsl #48
    8494:      	lsr	w0, w0, #0
    8498:      	lsr	x16, x0, #0
    849c:      	cmp	x16, #0x1
    84a0:      	b.eq	0x84bc <_stogir.vector-comparison.node?+0x138>
    84a4:      	b.lo	0x84ac <_stogir.vector-comparison.node?+0x128>
    84a8:      	b	0x84c0 <_stogir.vector-comparison.node?+0x13c>
    84ac:      	cmp	x16, #0x0
    84b0:      	b.eq	0x84b8 <_stogir.vector-comparison.node?+0x134>
    84b4:      	b	0x84c0 <_stogir.vector-comparison.node?+0x13c>
    84b8:      	b	0x84c4 <_stogir.vector-comparison.node?+0x140>
    84bc:      	b	0x84d4 <_stogir.vector-comparison.node?+0x150>
    84c0:      	b	0x854c <_stogir.vector-comparison.node?+0x1c8>
    84c4:      	movz	x0, #0x0, lsl #48
    84c8:      	b	0x84d0 <_stogir.vector-comparison.node?+0x14c>
    84cc:      	movz	x0, #0x0, lsl #48
    84d0:      	ret
    84d4:      	uxtb	w0, w1
    84d8:      	cmp	x0, #0xe
    84dc:      	b.lt	0x84cc <_stogir.vector-comparison.node?+0x148>
    84e0:      	cmp	x0, #0x19
    84e4:      	b.gt	0x84cc <_stogir.vector-comparison.node?+0x148>
    84e8:      	lsr	w1, w1, #0
    84ec:      	ubfx	x0, x1, #8, #8
    84f0:      	cmp	x0, #0xf
    84f4:      	b.le	0x8534 <_stogir.vector-comparison.node?+0x1b0>
    84f8:      	cmp	x0, #0x80
    84fc:      	b.ge	0x853c <_stogir.vector-comparison.node?+0x1b8>
    8500:      	and	x0, x0, #0xf
    8504:      	lsr	w0, w0, #0
    8508:      	sxtw	x0, w0
    850c:      	cmp	x0, #0x1
    8510:      	b.lt	0x8544 <_stogir.vector-comparison.node?+0x1c0>
    8514:      	cmp	x0, #0xd
    8518:      	cset	w0, le
    851c:      	ubfx	x0, x0, #0, #8
    8520:      	b	0x8548 <_stogir.vector-comparison.node?+0x1c4>
    8524:      	movz	x3, #0x0, lsl #48
    8528:      	b	0x8440 <_stogir.vector-comparison.node?+0xbc>
    852c:      	movz	x3, #0x0, lsl #48
    8530:      	b	0x8438 <_stogir.vector-comparison.node?+0xb4>
    8534:      	movz	x0, #0x0, lsl #48
    8538:      	b	0x84d0 <_stogir.vector-comparison.node?+0x14c>
    853c:      	movz	x0, #0x0, lsl #48
    8540:      	b	0x8538 <_stogir.vector-comparison.node?+0x1b4>
    8544:      	movz	x0, #0x0, lsl #48
    8548:      	b	0x8540 <_stogir.vector-comparison.node?+0x1bc>
    854c:      	brk	#0
    8550:      	b	0x854c <_stogir.vector-comparison.node?+0x1c8>

0000000000008554 <_stogir.vector-comparison.validate>:
    8554:      	sub	sp, sp, #0x50
    8558:      	str	x29, [sp]
    855c:      	str	x30, [sp, #0x8]
    8560:      	mov	x29, sp
    8564:      	str	x19, [sp, #0x40]
    8568:      	sxtw	x1, w1
    856c:      	lsl	x3, x1, #2
    8570:      	cmp	x1, #0x0
    8574:      	cset	w4, gt
    8578:      	movz	x16, #0x0, lsl #48
    857c:      	sub	x5, x16, x1
    8580:      	cmp	x1, #0x0
    8584:      	cset	w6, lt
    8588:      	sub	x7, x5, #0x1
    858c:      	lsl	x9, x7, #2
    8590:      	uxtb	w16, w4
    8594:      	cmp	w16, wzr
    8598:      	b.eq	0x85d8 <_stogir.vector-comparison.validate+0x84>
    859c:      	ldr	x10, [x0, #0x8]
    85a0:      	cmp	x1, x10
    85a4:      	b.ge	0x862c <_stogir.vector-comparison.validate+0xd8>
    85a8:      	add	x10, x0, #0x78
    85ac:      	ldr	x10, [x10, #0x8]
    85b0:      	cmp	x1, x10
    85b4:      	b.ge	0x8750 <_stogir.vector-comparison.validate+0x1fc>
    85b8:      	ldr	x10, [x0, #0x78]
    85bc:      	add	x10, x3, x10
    85c0:      	ldr	w10, [x10]
    85c4:      	sxtw	x10, w10
    85c8:      	cmp	x10, #0x0
    85cc:      	cset	w10, ge
    85d0:      	ubfx	x10, x10, #0, #8
    85d4:      	b	0x8754 <_stogir.vector-comparison.validate+0x200>
    85d8:      	uxtb	w16, w6
    85dc:      	cmp	w16, wzr
    85e0:      	b.eq	0x8634 <_stogir.vector-comparison.validate+0xe0>
    85e4:      	add	x10, x0, #0x28
    85e8:      	add	x11, x0, #0x50
    85ec:      	ldr	x10, [x10, #0x8]
    85f0:      	ldr	x11, [x11, #0x8]
    85f4:      	cmp	x10, x11
    85f8:      	b.ne	0x8624 <_stogir.vector-comparison.validate+0xd0>
    85fc:      	cmp	x5, x10
    8600:      	b.gt	0x87a0 <_stogir.vector-comparison.validate+0x24c>
    8604:      	ldr	x10, [x0, #0x50]
    8608:      	add	x10, x9, x10
    860c:      	ldr	w10, [x10]
    8610:      	sxtw	x10, w10
    8614:      	cmp	x10, #0x0
    8618:      	cset	w10, gt
    861c:      	ubfx	x10, x10, #0, #8
    8620:      	b	0x87a4 <_stogir.vector-comparison.validate+0x250>
    8624:      	movz	x10, #0x0, lsl #48
    8628:      	b	0x8638 <_stogir.vector-comparison.validate+0xe4>
    862c:      	movz	x10, #0x0, lsl #48
    8630:      	b	0x8638 <_stogir.vector-comparison.validate+0xe4>
    8634:      	movz	x10, #0x0, lsl #48
    8638:      	lsl	x11, x1, #4
    863c:      	lsl	x7, x7, #4
    8640:      	cmp	x10, #0x0
    8644:      	b.eq	0x86a0 <_stogir.vector-comparison.validate+0x14c>
    8648:      	uxtb	w16, w4
    864c:      	cmp	w16, wzr
    8650:      	b.eq	0x8674 <_stogir.vector-comparison.validate+0x120>
    8654:      	ldr	x10, [x0]
    8658:      	add	x10, x11, x10
    865c:      	ldr	x12, [x10]
    8660:      	ldr	x10, [x10, #0x8]
    8664:      	fmov	d31, x10
    8668:      	mov	x10, x12
    866c:      	fmov	x12, d31
    8670:      	b	0x8690 <_stogir.vector-comparison.validate+0x13c>
    8674:      	ldr	x10, [x0, #0x28]
    8678:      	add	x10, x7, x10
    867c:      	ldr	x12, [x10]
    8680:      	ldr	x10, [x10, #0x8]
    8684:      	fmov	d31, x10
    8688:      	mov	x10, x12
    868c:      	fmov	x12, d31
    8690:      	mov	x13, x12
    8694:      	mov	x12, x10
    8698:      	mov	x10, #0x1               ; =1
    869c:      	b	0x86ac <_stogir.vector-comparison.validate+0x158>
    86a0:      	movz	x10, #0x0, lsl #48
    86a4:      	movz	x12, #0x0, lsl #48
    86a8:      	movz	x13, #0x0, lsl #48
    86ac:      	lsr	w10, w10, #0
    86b0:      	lsr	x16, x10, #0
    86b4:      	cmp	x16, #0x1
    86b8:      	b.eq	0x86d4 <_stogir.vector-comparison.validate+0x180>
    86bc:      	b.lo	0x86c4 <_stogir.vector-comparison.validate+0x170>
    86c0:      	b	0x86d8 <_stogir.vector-comparison.validate+0x184>
    86c4:      	cmp	x16, #0x0
    86c8:      	b.eq	0x86d0 <_stogir.vector-comparison.validate+0x17c>
    86cc:      	b	0x86d8 <_stogir.vector-comparison.validate+0x184>
    86d0:      	b	0x86dc <_stogir.vector-comparison.validate+0x188>
    86d4:      	b	0x8718 <_stogir.vector-comparison.validate+0x1c4>
    86d8:      	b	0x8960 <_stogir.vector-comparison.validate+0x40c>
    86dc:      	adrp	x16, 0x8000 <_stogir.floating.operation?+0x44>
		00000000000086dc:  ARM64_RELOC_PAGE21	l_stogir.406
    86e0:      	ldr	x16, [x16]
		00000000000086e0:  ARM64_RELOC_PAGEOFF12	l_stogir.406
    86e4:      	orr	x0, x16, xzr
    86e8:      	mov	x19, x8
    86ec:      	mov	x1, x0
    86f0:      	mov	x0, #0x1                ; =1
    86f4:      	mov	x2, #0x25               ; =37
    86f8:      	str	x0, [x19]
    86fc:      	str	x1, [x19, #0x8]
    8700:      	str	x2, [x19, #0x10]
    8704:      	ldr	x19, [sp, #0x40]
    8708:      	ldr	x29, [sp]
    870c:      	ldr	x30, [sp, #0x8]
    8710:      	add	sp, sp, #0x50
    8714:      	ret
    8718:      	add	x16, sp, #0x10
    871c:      	str	x12, [x16]
    8720:      	add	x16, sp, #0x10
    8724:      	str	x13, [x16, #0x8]
    8728:      	cmp	x1, #0x0
    872c:      	b.gt	0x8758 <_stogir.vector-comparison.validate+0x204>
    8730:      	mov	x19, x8
    8734:      	adrp	x16, 0x8000 <_stogir.floating.operation?+0x44>
		0000000000008734:  ARM64_RELOC_PAGE21	l_stogir.407
    8738:      	ldr	x16, [x16]
		0000000000008738:  ARM64_RELOC_PAGEOFF12	l_stogir.407
    873c:      	orr	x0, x16, xzr
    8740:      	mov	x1, x0
    8744:      	mov	x0, #0x1                ; =1
    8748:      	mov	x2, #0x2b               ; =43
    874c:      	b	0x86f8 <_stogir.vector-comparison.validate+0x1a4>
    8750:      	movz	x10, #0x0, lsl #48
    8754:      	b	0x8630 <_stogir.vector-comparison.validate+0xdc>
    8758:      	uxtb	w16, w4
    875c:      	cmp	w16, wzr
    8760:      	b.eq	0x87a8 <_stogir.vector-comparison.validate+0x254>
    8764:      	ldr	x5, [x0, #0x8]
    8768:      	cmp	x1, x5
    876c:      	b.ge	0x87f4 <_stogir.vector-comparison.validate+0x2a0>
    8770:      	add	x5, x0, #0x78
    8774:      	ldr	x5, [x5, #0x8]
    8778:      	cmp	x1, x5
    877c:      	b.ge	0x8950 <_stogir.vector-comparison.validate+0x3fc>
    8780:      	ldr	x1, [x0, #0x78]
    8784:      	add	x1, x3, x1
    8788:      	ldr	w1, [x1]
    878c:      	sxtw	x1, w1
    8790:      	cmp	x1, #0x0
    8794:      	cset	w1, ge
    8798:      	ubfx	x1, x1, #0, #8
    879c:      	b	0x8954 <_stogir.vector-comparison.validate+0x400>
    87a0:      	movz	x10, #0x0, lsl #48
    87a4:      	b	0x8628 <_stogir.vector-comparison.validate+0xd4>
    87a8:      	uxtb	w16, w6
    87ac:      	cmp	w16, wzr
    87b0:      	b.eq	0x87fc <_stogir.vector-comparison.validate+0x2a8>
    87b4:      	add	x1, x0, #0x28
    87b8:      	add	x6, x0, #0x50
    87bc:      	ldr	x1, [x1, #0x8]
    87c0:      	ldr	x6, [x6, #0x8]
    87c4:      	cmp	x1, x6
    87c8:      	b.ne	0x8948 <_stogir.vector-comparison.validate+0x3f4>
    87cc:      	cmp	x5, x1
    87d0:      	b.gt	0x8958 <_stogir.vector-comparison.validate+0x404>
    87d4:      	ldr	x1, [x0, #0x50]
    87d8:      	add	x1, x9, x1
    87dc:      	ldr	w1, [x1]
    87e0:      	sxtw	x1, w1
    87e4:      	cmp	x1, #0x0
    87e8:      	cset	w1, gt
    87ec:      	ubfx	x1, x1, #0, #8
    87f0:      	b	0x895c <_stogir.vector-comparison.validate+0x408>
    87f4:      	movz	x1, #0x0, lsl #48
    87f8:      	b	0x8800 <_stogir.vector-comparison.validate+0x2ac>
    87fc:      	movz	x1, #0x0, lsl #48
    8800:      	cmp	x1, #0x0
    8804:      	b.eq	0x883c <_stogir.vector-comparison.validate+0x2e8>
    8808:      	uxtb	w16, w4
    880c:      	cmp	w16, wzr
    8810:      	b.eq	0x8824 <_stogir.vector-comparison.validate+0x2d0>
    8814:      	ldr	x1, [x0]
    8818:      	add	x1, x11, x1
    881c:      	ldr	x1, [x1]
    8820:      	b	0x8830 <_stogir.vector-comparison.validate+0x2dc>
    8824:      	ldr	x1, [x0, #0x28]
    8828:      	add	x1, x7, x1
    882c:      	ldr	x1, [x1]
    8830:      	mov	x4, x1
    8834:      	mov	x1, #0x1                ; =1
    8838:      	b	0x8844 <_stogir.vector-comparison.validate+0x2f0>
    883c:      	movz	x1, #0x0, lsl #48
    8840:      	movz	x4, #0x0, lsl #48
    8844:      	lsr	w1, w1, #0
    8848:      	lsr	x16, x1, #0
    884c:      	cmp	x16, #0x1
    8850:      	b.eq	0x886c <_stogir.vector-comparison.validate+0x318>
    8854:      	b.lo	0x885c <_stogir.vector-comparison.validate+0x308>
    8858:      	b	0x8870 <_stogir.vector-comparison.validate+0x31c>
    885c:      	cmp	x16, #0x0
    8860:      	b.eq	0x8868 <_stogir.vector-comparison.validate+0x314>
    8864:      	b	0x8870 <_stogir.vector-comparison.validate+0x31c>
    8868:      	b	0x8874 <_stogir.vector-comparison.validate+0x320>
    886c:      	b	0x887c <_stogir.vector-comparison.validate+0x328>
    8870:      	b	0x8968 <_stogir.vector-comparison.validate+0x414>
    8874:      	mov	x19, x8
    8878:      	b	0x8734 <_stogir.vector-comparison.validate+0x1e0>
    887c:      	uxtb	w1, w4
    8880:      	cmp	x1, #0xe
    8884:      	b.lt	0x8970 <_stogir.vector-comparison.validate+0x41c>
    8888:      	cmp	x1, #0x19
    888c:      	b.gt	0x8978 <_stogir.vector-comparison.validate+0x424>
    8890:      	lsr	w4, w4, #0
    8894:      	ubfx	x1, x4, #8, #8
    8898:      	cmp	x1, #0xf
    889c:      	b.le	0x8980 <_stogir.vector-comparison.validate+0x42c>
    88a0:      	cmp	x1, #0x80
    88a4:      	b.ge	0x8988 <_stogir.vector-comparison.validate+0x434>
    88a8:      	and	x1, x1, #0xf
    88ac:      	lsr	w1, w1, #0
    88b0:      	sxtw	x1, w1
    88b4:      	cmp	x1, #0x1
    88b8:      	b.lt	0x8990 <_stogir.vector-comparison.validate+0x43c>
    88bc:      	cmp	x1, #0xd
    88c0:      	b.gt	0x8998 <_stogir.vector-comparison.validate+0x444>
    88c4:      	ldr	x1, [x0, #0x78]
    88c8:      	add	x1, x3, x1
    88cc:      	ldr	w1, [x1]
    88d0:      	sxtw	x1, w1
    88d4:      	cmp	x1, #0x2
    88d8:      	b.ne	0x89a0 <_stogir.vector-comparison.validate+0x44c>
    88dc:      	lsr	w2, w2, #0
    88e0:      	add	x16, sp, #0x10
    88e4:      	ldr	w1, [x16]
    88e8:      	uxtb	w3, w1
    88ec:      	add	x16, sp, #0x10
    88f0:      	ldr	w4, [x16, #0x4]
    88f4:      	lsr	w3, w3, #0
    88f8:      	ubfx	x1, x1, #8, #8
    88fc:      	add	x16, sp, #0x10
    8900:      	ldr	w5, [x16, #0x8]
    8904:      	lsr	w4, w4, #0
    8908:      	lsr	w5, w5, #0
    890c:      	lsr	w1, w1, #0
    8910:      	mov	x19, x8
    8914:      	add	x8, sp, #0x20
    8918:      	fmov	s31, w1
    891c:      	mov	w1, w3
    8920:      	mov	w3, w2
    8924:      	fmov	w2, s31
    8928:      	bl	0x8928 <_stogir.vector-comparison.validate+0x3d4>
		0000000000008928:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.operands
    892c:      	add	x16, sp, #0x20
    8930:      	ldr	x0, [x16]
    8934:      	add	x16, sp, #0x20
    8938:      	ldr	x1, [x16, #0x8]
    893c:      	add	x16, sp, #0x20
    8940:      	ldr	x2, [x16, #0x10]
    8944:      	b	0x874c <_stogir.vector-comparison.validate+0x1f8>
    8948:      	movz	x1, #0x0, lsl #48
    894c:      	b	0x8800 <_stogir.vector-comparison.validate+0x2ac>
    8950:      	movz	x1, #0x0, lsl #48
    8954:      	b	0x87f8 <_stogir.vector-comparison.validate+0x2a4>
    8958:      	movz	x1, #0x0, lsl #48
    895c:      	b	0x894c <_stogir.vector-comparison.validate+0x3f8>
    8960:      	brk	#0
    8964:      	b	0x8960 <_stogir.vector-comparison.validate+0x40c>
    8968:      	brk	#0
    896c:      	b	0x8968 <_stogir.vector-comparison.validate+0x414>
    8970:      	mov	x19, x8
    8974:      	b	0x8734 <_stogir.vector-comparison.validate+0x1e0>
    8978:      	mov	x19, x8
    897c:      	b	0x8734 <_stogir.vector-comparison.validate+0x1e0>
    8980:      	mov	x19, x8
    8984:      	b	0x8734 <_stogir.vector-comparison.validate+0x1e0>
    8988:      	mov	x19, x8
    898c:      	b	0x8734 <_stogir.vector-comparison.validate+0x1e0>
    8990:      	mov	x19, x8
    8994:      	b	0x8734 <_stogir.vector-comparison.validate+0x1e0>
    8998:      	mov	x19, x8
    899c:      	b	0x8734 <_stogir.vector-comparison.validate+0x1e0>
    89a0:      	mov	x19, x8
    89a4:      	b	0x8734 <_stogir.vector-comparison.validate+0x1e0>

00000000000089a8 <_stogir.vector-arithmetic.node?>:
    89a8:      	sxtw	x1, w1
    89ac:      	cmp	x1, #0x0
    89b0:      	cset	w2, gt
    89b4:      	movz	x16, #0x0, lsl #48
    89b8:      	sub	x3, x16, x1
    89bc:      	sub	x4, x3, #0x1
    89c0:      	uxtb	w16, w2
    89c4:      	cmp	w16, wzr
    89c8:      	b.eq	0x8a0c <_stogir.vector-arithmetic.node?+0x64>
    89cc:      	ldr	x3, [x0, #0x8]
    89d0:      	cmp	x1, x3
    89d4:      	b.ge	0x8a60 <_stogir.vector-arithmetic.node?+0xb8>
    89d8:      	add	x3, x0, #0x78
    89dc:      	ldr	x3, [x3, #0x8]
    89e0:      	cmp	x1, x3
    89e4:      	b.ge	0x8b90 <_stogir.vector-arithmetic.node?+0x1e8>
    89e8:      	lsl	x3, x1, #2
    89ec:      	ldr	x5, [x0, #0x78]
    89f0:      	add	x3, x3, x5
    89f4:      	ldr	w3, [x3]
    89f8:      	sxtw	x3, w3
    89fc:      	cmp	x3, #0x0
    8a00:      	cset	w3, ge
    8a04:      	ubfx	x3, x3, #0, #8
    8a08:      	b	0x8b94 <_stogir.vector-arithmetic.node?+0x1ec>
    8a0c:      	cmp	x1, #0x0
    8a10:      	b.ge	0x8a68 <_stogir.vector-arithmetic.node?+0xc0>
    8a14:      	add	x5, x0, #0x28
    8a18:      	add	x6, x0, #0x50
    8a1c:      	ldr	x5, [x5, #0x8]
    8a20:      	ldr	x6, [x6, #0x8]
    8a24:      	cmp	x5, x6
    8a28:      	b.ne	0x8a58 <_stogir.vector-arithmetic.node?+0xb0>
    8a2c:      	cmp	x3, x5
    8a30:      	b.gt	0x8ba0 <_stogir.vector-arithmetic.node?+0x1f8>
    8a34:      	lsl	x3, x4, #2
    8a38:      	ldr	x5, [x0, #0x50]
    8a3c:      	add	x3, x3, x5
    8a40:      	ldr	w3, [x3]
    8a44:      	sxtw	x3, w3
    8a48:      	cmp	x3, #0x0
    8a4c:      	cset	w3, gt
    8a50:      	ubfx	x3, x3, #0, #8
    8a54:      	b	0x8ba4 <_stogir.vector-arithmetic.node?+0x1fc>
    8a58:      	movz	x3, #0x0, lsl #48
    8a5c:      	b	0x8a6c <_stogir.vector-arithmetic.node?+0xc4>
    8a60:      	movz	x3, #0x0, lsl #48
    8a64:      	b	0x8a6c <_stogir.vector-arithmetic.node?+0xc4>
    8a68:      	movz	x3, #0x0, lsl #48
    8a6c:      	cmp	x3, #0x0
    8a70:      	b.eq	0x8ab0 <_stogir.vector-arithmetic.node?+0x108>
    8a74:      	uxtb	w16, w2
    8a78:      	cmp	w16, wzr
    8a7c:      	b.eq	0x8a94 <_stogir.vector-arithmetic.node?+0xec>
    8a80:      	lsl	x1, x1, #4
    8a84:      	ldr	x0, [x0]
    8a88:      	add	x0, x1, x0
    8a8c:      	ldr	x0, [x0]
    8a90:      	b	0x8aa4 <_stogir.vector-arithmetic.node?+0xfc>
    8a94:      	lsl	x1, x4, #4
    8a98:      	ldr	x0, [x0, #0x28]
    8a9c:      	add	x0, x1, x0
    8aa0:      	ldr	x0, [x0]
    8aa4:      	mov	x1, x0
    8aa8:      	mov	x0, #0x1                ; =1
    8aac:      	b	0x8ab8 <_stogir.vector-arithmetic.node?+0x110>
    8ab0:      	movz	x0, #0x0, lsl #48
    8ab4:      	movz	x1, #0x0, lsl #48
    8ab8:      	lsr	w0, w0, #0
    8abc:      	lsr	x16, x0, #0
    8ac0:      	cmp	x16, #0x1
    8ac4:      	b.eq	0x8ae0 <_stogir.vector-arithmetic.node?+0x138>
    8ac8:      	b.lo	0x8ad0 <_stogir.vector-arithmetic.node?+0x128>
    8acc:      	b	0x8ae4 <_stogir.vector-arithmetic.node?+0x13c>
    8ad0:      	cmp	x16, #0x0
    8ad4:      	b.eq	0x8adc <_stogir.vector-arithmetic.node?+0x134>
    8ad8:      	b	0x8ae4 <_stogir.vector-arithmetic.node?+0x13c>
    8adc:      	b	0x8ae8 <_stogir.vector-arithmetic.node?+0x140>
    8ae0:      	b	0x8af8 <_stogir.vector-arithmetic.node?+0x150>
    8ae4:      	b	0x8bb0 <_stogir.vector-arithmetic.node?+0x208>
    8ae8:      	movz	x0, #0x0, lsl #48
    8aec:      	b	0x8af4 <_stogir.vector-arithmetic.node?+0x14c>
    8af0:      	movz	x0, #0x0, lsl #48
    8af4:      	ret
    8af8:      	uxtb	w0, w1
    8afc:      	cmp	x0, #0x1f
    8b00:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8b04:      	cmp	x0, #0x20
    8b08:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8b0c:      	cmp	x0, #0x2d
    8b10:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8b14:      	cmp	x0, #0x36
    8b18:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8b1c:      	cmp	x0, #0x37
    8b20:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8b24:      	cmp	x0, #0x38
    8b28:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8b2c:      	cmp	x0, #0x39
    8b30:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8b34:      	cmp	x0, #0x3a
    8b38:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8b3c:      	cmp	x0, #0x3b
    8b40:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8b44:      	cmp	x0, #0x31
    8b48:      	b.lt	0x8bb8 <_stogir.vector-arithmetic.node?+0x210>
    8b4c:      	cmp	x0, #0x35
    8b50:      	b.gt	0x8bb8 <_stogir.vector-arithmetic.node?+0x210>
    8b54:      	lsr	w1, w1, #0
    8b58:      	ubfx	x0, x1, #8, #8
    8b5c:      	cmp	x0, #0xf
    8b60:      	b.le	0x8af0 <_stogir.vector-arithmetic.node?+0x148>
    8b64:      	cmp	x0, #0x80
    8b68:      	b.ge	0x8b98 <_stogir.vector-arithmetic.node?+0x1f0>
    8b6c:      	and	x0, x0, #0xf
    8b70:      	lsr	w0, w0, #0
    8b74:      	sxtw	x0, w0
    8b78:      	cmp	x0, #0x1
    8b7c:      	b.lt	0x8ba8 <_stogir.vector-arithmetic.node?+0x200>
    8b80:      	cmp	x0, #0xd
    8b84:      	cset	w0, le
    8b88:      	ubfx	x0, x0, #0, #8
    8b8c:      	b	0x8bac <_stogir.vector-arithmetic.node?+0x204>
    8b90:      	movz	x3, #0x0, lsl #48
    8b94:      	b	0x8a64 <_stogir.vector-arithmetic.node?+0xbc>
    8b98:      	movz	x0, #0x0, lsl #48
    8b9c:      	b	0x8af4 <_stogir.vector-arithmetic.node?+0x14c>
    8ba0:      	movz	x3, #0x0, lsl #48
    8ba4:      	b	0x8a5c <_stogir.vector-arithmetic.node?+0xb4>
    8ba8:      	movz	x0, #0x0, lsl #48
    8bac:      	b	0x8b9c <_stogir.vector-arithmetic.node?+0x1f4>
    8bb0:      	brk	#0
    8bb4:      	b	0x8bb0 <_stogir.vector-arithmetic.node?+0x208>
    8bb8:      	cmp	x0, #0x1a
    8bbc:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8bc0:      	cmp	x0, #0x1b
    8bc4:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8bc8:      	cmp	x0, #0x1c
    8bcc:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8bd0:      	cmp	x0, #0x1d
    8bd4:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8bd8:      	cmp	x0, #0x1e
    8bdc:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8be0:      	cmp	x0, #0x2e
    8be4:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8be8:      	cmp	x0, #0x2f
    8bec:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8bf0:      	cmp	x0, #0x30
    8bf4:      	b.eq	0x8b54 <_stogir.vector-arithmetic.node?+0x1ac>
    8bf8:      	movz	x0, #0x0, lsl #48
    8bfc:      	b	0x8af4 <_stogir.vector-arithmetic.node?+0x14c>

0000000000008c00 <_stogir.vector-arithmetic.validate>:
    8c00:      	sub	sp, sp, #0x60
    8c04:      	str	x29, [sp]
    8c08:      	str	x30, [sp, #0x8]
    8c0c:      	mov	x29, sp
    8c10:      	str	x19, [sp, #0x40]
    8c14:      	str	x20, [sp, #0x48]
    8c18:      	str	x21, [sp, #0x50]
    8c1c:      	str	x22, [sp, #0x58]
    8c20:      	sxtw	x2, w1
    8c24:      	lsl	x19, x2, #2
    8c28:      	cmp	x2, #0x0
    8c2c:      	cset	w3, gt
    8c30:      	movz	x16, #0x0, lsl #48
    8c34:      	sub	x4, x16, x2
    8c38:      	sub	x5, x4, #0x1
    8c3c:      	uxtb	w16, w3
    8c40:      	cmp	w16, wzr
    8c44:      	b.eq	0x8c84 <_stogir.vector-arithmetic.validate+0x84>
    8c48:      	ldr	x4, [x0, #0x8]
    8c4c:      	cmp	x2, x4
    8c50:      	b.ge	0x8cd8 <_stogir.vector-arithmetic.validate+0xd8>
    8c54:      	add	x4, x0, #0x78
    8c58:      	ldr	x4, [x4, #0x8]
    8c5c:      	cmp	x2, x4
    8c60:      	b.ge	0x8e04 <_stogir.vector-arithmetic.validate+0x204>
    8c64:      	ldr	x4, [x0, #0x78]
    8c68:      	add	x4, x19, x4
    8c6c:      	ldr	w4, [x4]
    8c70:      	sxtw	x4, w4
    8c74:      	cmp	x4, #0x0
    8c78:      	cset	w4, ge
    8c7c:      	ubfx	x4, x4, #0, #8
    8c80:      	b	0x8e08 <_stogir.vector-arithmetic.validate+0x208>
    8c84:      	cmp	x2, #0x0
    8c88:      	b.ge	0x8ce0 <_stogir.vector-arithmetic.validate+0xe0>
    8c8c:      	add	x6, x0, #0x28
    8c90:      	add	x7, x0, #0x50
    8c94:      	ldr	x6, [x6, #0x8]
    8c98:      	ldr	x7, [x7, #0x8]
    8c9c:      	cmp	x6, x7
    8ca0:      	b.ne	0x8cd0 <_stogir.vector-arithmetic.validate+0xd0>
    8ca4:      	cmp	x4, x6
    8ca8:      	b.gt	0x8ea0 <_stogir.vector-arithmetic.validate+0x2a0>
    8cac:      	lsl	x4, x5, #2
    8cb0:      	ldr	x6, [x0, #0x50]
    8cb4:      	add	x4, x4, x6
    8cb8:      	ldr	w4, [x4]
    8cbc:      	sxtw	x4, w4
    8cc0:      	cmp	x4, #0x0
    8cc4:      	cset	w4, gt
    8cc8:      	ubfx	x4, x4, #0, #8
    8ccc:      	b	0x8ea4 <_stogir.vector-arithmetic.validate+0x2a4>
    8cd0:      	movz	x4, #0x0, lsl #48
    8cd4:      	b	0x8ce4 <_stogir.vector-arithmetic.validate+0xe4>
    8cd8:      	movz	x4, #0x0, lsl #48
    8cdc:      	b	0x8ce4 <_stogir.vector-arithmetic.validate+0xe4>
    8ce0:      	movz	x4, #0x0, lsl #48
    8ce4:      	cmp	x4, #0x0
    8ce8:      	b.eq	0x8d48 <_stogir.vector-arithmetic.validate+0x148>
    8cec:      	uxtb	w16, w3
    8cf0:      	cmp	w16, wzr
    8cf4:      	b.eq	0x8d1c <_stogir.vector-arithmetic.validate+0x11c>
    8cf8:      	lsl	x3, x2, #4
    8cfc:      	ldr	x4, [x0]
    8d00:      	add	x3, x3, x4
    8d04:      	ldr	x4, [x3]
    8d08:      	ldr	x3, [x3, #0x8]
    8d0c:      	fmov	d31, x3
    8d10:      	mov	x3, x4
    8d14:      	fmov	x4, d31
    8d18:      	b	0x8d3c <_stogir.vector-arithmetic.validate+0x13c>
    8d1c:      	lsl	x3, x5, #4
    8d20:      	ldr	x4, [x0, #0x28]
    8d24:      	add	x3, x3, x4
    8d28:      	ldr	x4, [x3]
    8d2c:      	ldr	x3, [x3, #0x8]
    8d30:      	fmov	d31, x3
    8d34:      	mov	x3, x4
    8d38:      	fmov	x4, d31
    8d3c:      	mov	x20, x3
    8d40:      	mov	x3, #0x1                ; =1
    8d44:      	b	0x8d54 <_stogir.vector-arithmetic.validate+0x154>
    8d48:      	movz	x3, #0x0, lsl #48
    8d4c:      	movz	x20, #0x0, lsl #48
    8d50:      	movz	x4, #0x0, lsl #48
    8d54:      	lsr	w3, w3, #0
    8d58:      	lsr	x16, x3, #0
    8d5c:      	cmp	x16, #0x1
    8d60:      	b.eq	0x8d7c <_stogir.vector-arithmetic.validate+0x17c>
    8d64:      	b.lo	0x8d6c <_stogir.vector-arithmetic.validate+0x16c>
    8d68:      	b	0x8d80 <_stogir.vector-arithmetic.validate+0x180>
    8d6c:      	cmp	x16, #0x0
    8d70:      	b.eq	0x8d78 <_stogir.vector-arithmetic.validate+0x178>
    8d74:      	b	0x8d80 <_stogir.vector-arithmetic.validate+0x180>
    8d78:      	b	0x8d84 <_stogir.vector-arithmetic.validate+0x184>
    8d7c:      	b	0x8da4 <_stogir.vector-arithmetic.validate+0x1a4>
    8d80:      	b	0x8f54 <_stogir.vector-arithmetic.validate+0x354>
    8d84:      	adrp	x16, 0x8000 <_stogir.floating.operation?+0x44>
		0000000000008d84:  ARM64_RELOC_PAGE21	l_stogir.408
    8d88:      	ldr	x16, [x16]
		0000000000008d88:  ARM64_RELOC_PAGEOFF12	l_stogir.408
    8d8c:      	orr	x0, x16, xzr
    8d90:      	mov	x21, x8
    8d94:      	mov	x1, x0
    8d98:      	mov	x0, #0x1                ; =1
    8d9c:      	mov	x2, #0x25               ; =37
    8da0:      	b	0x8dd8 <_stogir.vector-arithmetic.validate+0x1d8>
    8da4:      	add	x16, sp, #0x10
    8da8:      	str	x20, [x16]
    8dac:      	add	x16, sp, #0x10
    8db0:      	str	x4, [x16, #0x8]
    8db4:      	cmp	x2, #0x0
    8db8:      	b.gt	0x8e0c <_stogir.vector-arithmetic.validate+0x20c>
    8dbc:      	mov	x21, x8
    8dc0:      	adrp	x16, 0x8000 <_stogir.floating.operation?+0x44>
		0000000000008dc0:  ARM64_RELOC_PAGE21	l_stogir.409
    8dc4:      	ldr	x16, [x16]
		0000000000008dc4:  ARM64_RELOC_PAGEOFF12	l_stogir.409
    8dc8:      	orr	x0, x16, xzr
    8dcc:      	mov	x1, x0
    8dd0:      	mov	x0, #0x1                ; =1
    8dd4:      	mov	x2, #0x2b               ; =43
    8dd8:      	str	x0, [x21]
    8ddc:      	str	x1, [x21, #0x8]
    8de0:      	str	x2, [x21, #0x10]
    8de4:      	ldr	x19, [sp, #0x40]
    8de8:      	ldr	x20, [sp, #0x48]
    8dec:      	ldr	x21, [sp, #0x50]
    8df0:      	ldr	x22, [sp, #0x58]
    8df4:      	ldr	x29, [sp]
    8df8:      	ldr	x30, [sp, #0x8]
    8dfc:      	add	sp, sp, #0x60
    8e00:      	ret
    8e04:      	movz	x4, #0x0, lsl #48
    8e08:      	b	0x8cdc <_stogir.vector-arithmetic.validate+0xdc>
    8e0c:      	lsr	w1, w1, #0
    8e10:      	mov	x21, x8
    8e14:      	mov	x22, x0
    8e18:      	bl	0x8e18 <_stogir.vector-arithmetic.validate+0x218>
		0000000000008e18:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    8e1c:      	cmp	x0, #0x0
    8e20:      	b.eq	0x8dc0 <_stogir.vector-arithmetic.validate+0x1c0>
    8e24:      	uxtb	w20, w20
    8e28:      	orr	x0, x20, xzr
    8e2c:      	ldr	x1, [x22, #0x78]
    8e30:      	cmp	x0, #0x1d
    8e34:      	cset	w2, eq
    8e38:      	cmp	x0, #0x1e
    8e3c:      	cset	w3, eq
    8e40:      	add	x1, x19, x1
    8e44:      	ldr	w1, [x1]
    8e48:      	cmp	x0, #0x1f
    8e4c:      	b.eq	0x8f04 <_stogir.vector-arithmetic.validate+0x304>
    8e50:      	cmp	x0, #0x20
    8e54:      	b.eq	0x8f04 <_stogir.vector-arithmetic.validate+0x304>
    8e58:      	cmp	x0, #0x2d
    8e5c:      	b.eq	0x8f04 <_stogir.vector-arithmetic.validate+0x304>
    8e60:      	cmp	x0, #0x36
    8e64:      	b.eq	0x8f04 <_stogir.vector-arithmetic.validate+0x304>
    8e68:      	cmp	x0, #0x37
    8e6c:      	b.eq	0x8f04 <_stogir.vector-arithmetic.validate+0x304>
    8e70:      	cmp	x0, #0x38
    8e74:      	b.eq	0x8f04 <_stogir.vector-arithmetic.validate+0x304>
    8e78:      	cmp	x0, #0x39
    8e7c:      	b.eq	0x8f04 <_stogir.vector-arithmetic.validate+0x304>
    8e80:      	uxtb	w16, w2
    8e84:      	cmp	w16, wzr
    8e88:      	b.ne	0x8f5c <_stogir.vector-arithmetic.validate+0x35c>
    8e8c:      	uxtb	w16, w3
    8e90:      	cmp	w16, wzr
    8e94:      	b.ne	0x8f5c <_stogir.vector-arithmetic.validate+0x35c>
    8e98:      	mov	x0, #0x2                ; =2
    8e9c:      	b	0x8f60 <_stogir.vector-arithmetic.validate+0x360>
    8ea0:      	movz	x4, #0x0, lsl #48
    8ea4:      	b	0x8cd4 <_stogir.vector-arithmetic.validate+0xd4>
    8ea8:      	add	x16, sp, #0x10
    8eac:      	ldr	w2, [x16, #0xc]
    8eb0:      	sxtw	x2, w2
    8eb4:      	lsr	w1, w1, #0
    8eb8:      	lsr	w4, w4, #0
    8ebc:      	lsr	w20, w20, #0
    8ec0:      	lsr	w2, w2, #0
    8ec4:      	ubfx	x0, x0, #8, #8
    8ec8:      	lsr	w0, w0, #0
    8ecc:      	add	x8, sp, #0x20
    8ed0:      	mov	w3, w1
    8ed4:      	mov	w1, w20
    8ed8:      	mov	w5, w2
    8edc:      	mov	w2, w0
    8ee0:      	mov	x0, x22
    8ee4:      	bl	0x8ee4 <_stogir.vector-arithmetic.validate+0x2e4>
		0000000000008ee4:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.operands
    8ee8:      	add	x16, sp, #0x20
    8eec:      	ldr	x0, [x16]
    8ef0:      	add	x16, sp, #0x20
    8ef4:      	ldr	x1, [x16, #0x8]
    8ef8:      	add	x16, sp, #0x20
    8efc:      	ldr	x2, [x16, #0x10]
    8f00:      	b	0x8dd8 <_stogir.vector-arithmetic.validate+0x1d8>
    8f04:      	mov	x0, #0x1                ; =1
    8f08:      	sxtw	x1, w1
    8f0c:      	lsr	w0, w0, #0
    8f10:      	sxtw	x0, w0
    8f14:      	cmp	x1, x0
    8f18:      	b.ne	0x8dc0 <_stogir.vector-arithmetic.validate+0x1c0>
    8f1c:      	add	x16, sp, #0x10
    8f20:      	ldr	w0, [x16]
    8f24:      	add	x16, sp, #0x10
    8f28:      	ldr	w1, [x16, #0x4]
    8f2c:      	add	x16, sp, #0x10
    8f30:      	ldr	w4, [x16, #0x8]
    8f34:      	uxtb	w16, w2
    8f38:      	cmp	w16, wzr
    8f3c:      	b.ne	0x8ea8 <_stogir.vector-arithmetic.validate+0x2a8>
    8f40:      	uxtb	w16, w3
    8f44:      	cmp	w16, wzr
    8f48:      	b.ne	0x8ea8 <_stogir.vector-arithmetic.validate+0x2a8>
    8f4c:      	movz	x2, #0x0, lsl #48
    8f50:      	b	0x8eb4 <_stogir.vector-arithmetic.validate+0x2b4>
    8f54:      	brk	#0
    8f58:      	b	0x8f54 <_stogir.vector-arithmetic.validate+0x354>
    8f5c:      	mov	x0, #0x3                ; =3
    8f60:      	b	0x8f08 <_stogir.vector-arithmetic.validate+0x308>

0000000000008f64 <_stogir.vector.memory-inputs>:
    8f64:      	sub	sp, sp, #0x40
    8f68:      	str	x29, [sp]
    8f6c:      	str	x30, [sp, #0x8]
    8f70:      	mov	x29, sp
    8f74:      	str	x19, [sp, #0x10]
    8f78:      	str	x20, [sp, #0x18]
    8f7c:      	str	x21, [sp, #0x20]
    8f80:      	str	x22, [sp, #0x28]
    8f84:      	str	x23, [sp, #0x30]
    8f88:      	str	x24, [sp, #0x38]
    8f8c:      	sxtw	x5, w1
    8f90:      	cmp	x5, #0xf
    8f94:      	b.le	0x9450 <_stogir.vector.memory-inputs+0x4ec>
    8f98:      	cmp	x5, #0x80
    8f9c:      	b.ge	0x9458 <_stogir.vector.memory-inputs+0x4f4>
    8fa0:      	and	x6, x5, #0xf
    8fa4:      	lsr	w6, w6, #0
    8fa8:      	sxtw	x6, w6
    8fac:      	cmp	x6, #0x1
    8fb0:      	b.lt	0x9460 <_stogir.vector.memory-inputs+0x4fc>
    8fb4:      	and	x5, x5, #0xf
    8fb8:      	lsr	w5, w5, #0
    8fbc:      	sxtw	x5, w5
    8fc0:      	cmp	x5, #0xd
    8fc4:      	b.gt	0x9468 <_stogir.vector.memory-inputs+0x504>
    8fc8:      	lsr	w1, w1, #0
    8fcc:      	lsr	w2, w2, #0
    8fd0:      	mov	x19, x8
    8fd4:      	mov	x20, x0
    8fd8:      	mov	w0, w1
    8fdc:      	mov	w21, w1
    8fe0:      	mov	w1, w2
    8fe4:      	mov	w22, w2
    8fe8:      	mov	w23, w3
    8fec:      	mov	w24, w4
    8ff0:      	bl	0x8ff0 <_stogir.vector.memory-inputs+0x8c>
		0000000000008ff0:  ARM64_RELOC_BRANCH26	_stogir.types.size
    8ff4:      	lsr	w0, w0, #0
    8ff8:      	sxtw	x0, w0
    8ffc:      	cmp	x0, #0x0
    9000:      	b.le	0x9068 <_stogir.vector.memory-inputs+0x104>
    9004:      	sxtw	x23, w23
    9008:      	cmp	x23, #0x0
    900c:      	cset	w0, gt
    9010:      	movz	x16, #0x0, lsl #48
    9014:      	sub	x1, x16, x23
    9018:      	sub	x2, x1, #0x1
    901c:      	uxtb	w16, w0
    9020:      	cmp	w16, wzr
    9024:      	b.eq	0x9158 <_stogir.vector.memory-inputs+0x1f4>
    9028:      	ldr	x1, [x20, #0x8]
    902c:      	cmp	x23, x1
    9030:      	b.ge	0x9150 <_stogir.vector.memory-inputs+0x1ec>
    9034:      	add	x1, x20, #0x78
    9038:      	ldr	x1, [x1, #0x8]
    903c:      	cmp	x23, x1
    9040:      	b.ge	0x9200 <_stogir.vector.memory-inputs+0x29c>
    9044:      	lsl	x1, x23, #2
    9048:      	ldr	x3, [x20, #0x78]
    904c:      	add	x1, x1, x3
    9050:      	ldr	w1, [x1]
    9054:      	sxtw	x1, w1
    9058:      	cmp	x1, #0x0
    905c:      	cset	w1, ge
    9060:      	ubfx	x1, x1, #0, #8
    9064:      	b	0x9204 <_stogir.vector.memory-inputs+0x2a0>
    9068:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		0000000000009068:  ARM64_RELOC_PAGE21	l_stogir.410
    906c:      	ldr	x16, [x16]
		000000000000906c:  ARM64_RELOC_PAGEOFF12	l_stogir.410
    9070:      	orr	x0, x16, xzr
    9074:      	mov	x1, x0
    9078:      	mov	x0, #0x1                ; =1
    907c:      	mov	x2, #0x32               ; =50
    9080:      	str	x0, [x19]
    9084:      	str	x1, [x19, #0x8]
    9088:      	str	x2, [x19, #0x10]
    908c:      	ldr	x19, [sp, #0x10]
    9090:      	ldr	x20, [sp, #0x18]
    9094:      	ldr	x21, [sp, #0x20]
    9098:      	ldr	x22, [sp, #0x28]
    909c:      	ldr	x23, [sp, #0x30]
    90a0:      	ldr	x24, [sp, #0x38]
    90a4:      	ldr	x29, [sp]
    90a8:      	ldr	x30, [sp, #0x8]
    90ac:      	add	sp, sp, #0x40
    90b0:      	ret
    90b4:      	movz	x0, #0x0, lsl #48
    90b8:      	movz	x1, #0x0, lsl #48
    90bc:      	lsr	w0, w0, #0
    90c0:      	lsr	x16, x0, #0
    90c4:      	cmp	x16, #0x1
    90c8:      	b.eq	0x90e4 <_stogir.vector.memory-inputs+0x180>
    90cc:      	b.lo	0x90d4 <_stogir.vector.memory-inputs+0x170>
    90d0:      	b	0x90e8 <_stogir.vector.memory-inputs+0x184>
    90d4:      	cmp	x16, #0x0
    90d8:      	b.eq	0x90e0 <_stogir.vector.memory-inputs+0x17c>
    90dc:      	b	0x90e8 <_stogir.vector.memory-inputs+0x184>
    90e0:      	b	0x90ec <_stogir.vector.memory-inputs+0x188>
    90e4:      	b	0x91a4 <_stogir.vector.memory-inputs+0x240>
    90e8:      	b	0x9438 <_stogir.vector.memory-inputs+0x4d4>
    90ec:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		00000000000090ec:  ARM64_RELOC_PAGE21	l_stogir.411
    90f0:      	ldr	x16, [x16]
		00000000000090f0:  ARM64_RELOC_PAGEOFF12	l_stogir.411
    90f4:      	orr	x0, x16, xzr
    90f8:      	mov	x1, x0
    90fc:      	mov	x0, #0x1                ; =1
    9100:      	mov	x2, #0x1d               ; =29
    9104:      	b	0x9080 <_stogir.vector.memory-inputs+0x11c>
    9108:      	lsl	x0, x2, #4
    910c:      	ldr	x1, [x20, #0x28]
    9110:      	add	x0, x0, x1
    9114:      	ldr	x0, [x0]
    9118:      	mov	x1, x0
    911c:      	mov	x0, #0x1                ; =1
    9120:      	b	0x90bc <_stogir.vector.memory-inputs+0x158>
    9124:      	movz	x1, #0x0, lsl #48
    9128:      	cmp	x1, #0x0
    912c:      	b.eq	0x90b4 <_stogir.vector.memory-inputs+0x150>
    9130:      	uxtb	w16, w0
    9134:      	cmp	w16, wzr
    9138:      	b.eq	0x9108 <_stogir.vector.memory-inputs+0x1a4>
    913c:      	lsl	x0, x23, #4
    9140:      	ldr	x1, [x20]
    9144:      	add	x0, x0, x1
    9148:      	ldr	x0, [x0]
    914c:      	b	0x9118 <_stogir.vector.memory-inputs+0x1b4>
    9150:      	movz	x1, #0x0, lsl #48
    9154:      	b	0x9128 <_stogir.vector.memory-inputs+0x1c4>
    9158:      	cmp	x23, #0x0
    915c:      	b.ge	0x9124 <_stogir.vector.memory-inputs+0x1c0>
    9160:      	add	x3, x20, #0x28
    9164:      	add	x4, x20, #0x50
    9168:      	ldr	x3, [x3, #0x8]
    916c:      	ldr	x4, [x4, #0x8]
    9170:      	cmp	x3, x4
    9174:      	b.ne	0x91f8 <_stogir.vector.memory-inputs+0x294>
    9178:      	cmp	x1, x3
    917c:      	b.gt	0x9208 <_stogir.vector.memory-inputs+0x2a4>
    9180:      	lsl	x1, x2, #2
    9184:      	ldr	x3, [x20, #0x50]
    9188:      	add	x1, x1, x3
    918c:      	ldr	w1, [x1]
    9190:      	sxtw	x1, w1
    9194:      	cmp	x1, #0x0
    9198:      	cset	w1, gt
    919c:      	ubfx	x1, x1, #0, #8
    91a0:      	b	0x920c <_stogir.vector.memory-inputs+0x2a8>
    91a4:      	cmp	x23, #0x0
    91a8:      	b.le	0x91dc <_stogir.vector.memory-inputs+0x278>
    91ac:      	uxtb	w1, w1
    91b0:      	cmp	x1, #0x83
    91b4:      	cset	w0, lt
    91b8:      	uxtb	w16, w0
    91bc:      	cmp	w16, wzr
    91c0:      	b.eq	0x9210 <_stogir.vector.memory-inputs+0x2ac>
    91c4:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		00000000000091c4:  ARM64_RELOC_PAGE21	l_stogir.412
    91c8:      	ldr	x16, [x16]
		00000000000091c8:  ARM64_RELOC_PAGEOFF12	l_stogir.412
    91cc:      	orr	x2, x16, xzr
    91d0:      	add	x2, x1, x2
    91d4:      	ldrb	w2, [x2]
    91d8:      	b	0x9214 <_stogir.vector.memory-inputs+0x2b0>
    91dc:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		00000000000091dc:  ARM64_RELOC_PAGE21	l_stogir.413
    91e0:      	ldr	x16, [x16]
		00000000000091e0:  ARM64_RELOC_PAGEOFF12	l_stogir.413
    91e4:      	orr	x0, x16, xzr
    91e8:      	mov	x1, x0
    91ec:      	mov	x0, #0x1                ; =1
    91f0:      	mov	x2, #0x2c               ; =44
    91f4:      	b	0x9104 <_stogir.vector.memory-inputs+0x1a0>
    91f8:      	movz	x1, #0x0, lsl #48
    91fc:      	b	0x9128 <_stogir.vector.memory-inputs+0x1c4>
    9200:      	movz	x1, #0x0, lsl #48
    9204:      	b	0x9154 <_stogir.vector.memory-inputs+0x1f0>
    9208:      	movz	x1, #0x0, lsl #48
    920c:      	b	0x91fc <_stogir.vector.memory-inputs+0x298>
    9210:      	movz	x2, #0x0, lsl #48
    9214:      	uxtb	w2, w2
    9218:      	and	x2, x2, #0x1
    921c:      	uxtb	w2, w2
    9220:      	cmp	x2, #0x0
    9224:      	b.eq	0x91dc <_stogir.vector.memory-inputs+0x278>
    9228:      	uxtb	w16, w0
    922c:      	cmp	w16, wzr
    9230:      	b.eq	0x924c <_stogir.vector.memory-inputs+0x2e8>
    9234:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		0000000000009234:  ARM64_RELOC_PAGE21	l_stogir.412
    9238:      	ldr	x16, [x16]
		0000000000009238:  ARM64_RELOC_PAGEOFF12	l_stogir.412
    923c:      	orr	x0, x16, xzr
    9240:      	add	x0, x1, x0
    9244:      	ldrb	w0, [x0]
    9248:      	b	0x9250 <_stogir.vector.memory-inputs+0x2ec>
    924c:      	movz	x0, #0x0, lsl #48
    9250:      	uxtb	w0, w0
    9254:      	and	x0, x0, #0x4
    9258:      	uxtb	w0, w0
    925c:      	cmp	x0, #0x0
    9260:      	b.ne	0x91dc <_stogir.vector.memory-inputs+0x278>
    9264:      	sxtw	x24, w24
    9268:      	cmp	x24, #0x0
    926c:      	cset	w0, gt
    9270:      	movz	x16, #0x0, lsl #48
    9274:      	sub	x1, x16, x24
    9278:      	sub	x2, x1, #0x1
    927c:      	uxtb	w16, w0
    9280:      	cmp	w16, wzr
    9284:      	b.eq	0x92e4 <_stogir.vector.memory-inputs+0x380>
    9288:      	ldr	x1, [x20, #0x8]
    928c:      	cmp	x24, x1
    9290:      	b.ge	0x9330 <_stogir.vector.memory-inputs+0x3cc>
    9294:      	add	x1, x20, #0x78
    9298:      	ldr	x1, [x1, #0x8]
    929c:      	cmp	x24, x1
    92a0:      	b.ge	0x9430 <_stogir.vector.memory-inputs+0x4cc>
    92a4:      	lsl	x1, x24, #2
    92a8:      	ldr	x3, [x20, #0x78]
    92ac:      	add	x1, x1, x3
    92b0:      	ldr	w1, [x1]
    92b4:      	sxtw	x1, w1
    92b8:      	cmp	x1, #0x0
    92bc:      	cset	w1, ge
    92c0:      	ubfx	x1, x1, #0, #8
    92c4:      	b	0x9434 <_stogir.vector.memory-inputs+0x4d0>
    92c8:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		00000000000092c8:  ARM64_RELOC_PAGE21	l_stogir.414
    92cc:      	ldr	x16, [x16]
		00000000000092cc:  ARM64_RELOC_PAGEOFF12	l_stogir.414
    92d0:      	orr	x0, x16, xzr
    92d4:      	mov	x1, x0
    92d8:      	mov	x0, #0x1                ; =1
    92dc:      	mov	x2, #0x2b               ; =43
    92e0:      	b	0x91f4 <_stogir.vector.memory-inputs+0x290>
    92e4:      	cmp	x24, #0x0
    92e8:      	b.ge	0x9338 <_stogir.vector.memory-inputs+0x3d4>
    92ec:      	add	x3, x20, #0x28
    92f0:      	add	x4, x20, #0x50
    92f4:      	ldr	x3, [x3, #0x8]
    92f8:      	ldr	x4, [x4, #0x8]
    92fc:      	cmp	x3, x4
    9300:      	b.ne	0x9428 <_stogir.vector.memory-inputs+0x4c4>
    9304:      	cmp	x1, x3
    9308:      	b.gt	0x9440 <_stogir.vector.memory-inputs+0x4dc>
    930c:      	lsl	x1, x2, #2
    9310:      	ldr	x3, [x20, #0x50]
    9314:      	add	x1, x1, x3
    9318:      	ldr	w1, [x1]
    931c:      	sxtw	x1, w1
    9320:      	cmp	x1, #0x0
    9324:      	cset	w1, gt
    9328:      	ubfx	x1, x1, #0, #8
    932c:      	b	0x9444 <_stogir.vector.memory-inputs+0x4e0>
    9330:      	movz	x1, #0x0, lsl #48
    9334:      	b	0x933c <_stogir.vector.memory-inputs+0x3d8>
    9338:      	movz	x1, #0x0, lsl #48
    933c:      	cmp	x1, #0x0
    9340:      	b.eq	0x9380 <_stogir.vector.memory-inputs+0x41c>
    9344:      	uxtb	w16, w0
    9348:      	cmp	w16, wzr
    934c:      	b.eq	0x9364 <_stogir.vector.memory-inputs+0x400>
    9350:      	lsl	x0, x24, #4
    9354:      	ldr	x1, [x20]
    9358:      	add	x0, x0, x1
    935c:      	ldr	x0, [x0]
    9360:      	b	0x9374 <_stogir.vector.memory-inputs+0x410>
    9364:      	lsl	x0, x2, #4
    9368:      	ldr	x1, [x20, #0x28]
    936c:      	add	x0, x0, x1
    9370:      	ldr	x0, [x0]
    9374:      	mov	x1, x0
    9378:      	mov	x0, #0x1                ; =1
    937c:      	b	0x9388 <_stogir.vector.memory-inputs+0x424>
    9380:      	movz	x0, #0x0, lsl #48
    9384:      	movz	x1, #0x0, lsl #48
    9388:      	lsr	w0, w0, #0
    938c:      	lsr	x16, x0, #0
    9390:      	cmp	x16, #0x1
    9394:      	b.eq	0x93b0 <_stogir.vector.memory-inputs+0x44c>
    9398:      	b.lo	0x93a0 <_stogir.vector.memory-inputs+0x43c>
    939c:      	b	0x93b4 <_stogir.vector.memory-inputs+0x450>
    93a0:      	cmp	x16, #0x0
    93a4:      	b.eq	0x93ac <_stogir.vector.memory-inputs+0x448>
    93a8:      	b	0x93b4 <_stogir.vector.memory-inputs+0x450>
    93ac:      	b	0x93b8 <_stogir.vector.memory-inputs+0x454>
    93b0:      	b	0x93d4 <_stogir.vector.memory-inputs+0x470>
    93b4:      	b	0x9448 <_stogir.vector.memory-inputs+0x4e4>
    93b8:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		00000000000093b8:  ARM64_RELOC_PAGE21	l_stogir.415
    93bc:      	ldr	x16, [x16]
		00000000000093bc:  ARM64_RELOC_PAGEOFF12	l_stogir.415
    93c0:      	orr	x0, x16, xzr
    93c4:      	mov	x1, x0
    93c8:      	mov	x0, #0x1                ; =1
    93cc:      	mov	x2, #0x1d               ; =29
    93d0:      	b	0x92e0 <_stogir.vector.memory-inputs+0x37c>
    93d4:      	lsr	w0, w1, #0
    93d8:      	ubfx	x0, x0, #8, #8
    93dc:      	cmp	x0, #0x6
    93e0:      	b.ne	0x92c8 <_stogir.vector.memory-inputs+0x364>
    93e4:      	uxtb	w1, w1
    93e8:      	cmp	x1, #0x48
    93ec:      	b.eq	0x92c8 <_stogir.vector.memory-inputs+0x364>
    93f0:      	cmp	x1, #0x46
    93f4:      	b.eq	0x92c8 <_stogir.vector.memory-inputs+0x364>
    93f8:      	lsr	w21, w21, #0
    93fc:      	lsr	w22, w22, #0
    9400:      	mov	w0, w21
    9404:      	mov	w1, w22
    9408:      	bl	0x9408 <_stogir.vector.memory-inputs+0x4a4>
		0000000000009408:  ARM64_RELOC_BRANCH26	_stogir.types.size
    940c:      	lsr	w0, w0, #0
    9410:      	sxtw	x0, w0
    9414:      	and	x0, x0, #0xffffffff
    9418:      	mov	x1, x0
    941c:      	movz	x0, #0x0, lsl #48
    9420:      	movz	x2, #0x0, lsl #48
    9424:      	b	0x92e0 <_stogir.vector.memory-inputs+0x37c>
    9428:      	movz	x1, #0x0, lsl #48
    942c:      	b	0x933c <_stogir.vector.memory-inputs+0x3d8>
    9430:      	movz	x1, #0x0, lsl #48
    9434:      	b	0x9334 <_stogir.vector.memory-inputs+0x3d0>
    9438:      	brk	#0
    943c:      	b	0x9438 <_stogir.vector.memory-inputs+0x4d4>
    9440:      	movz	x1, #0x0, lsl #48
    9444:      	b	0x942c <_stogir.vector.memory-inputs+0x4c8>
    9448:      	brk	#0
    944c:      	b	0x9448 <_stogir.vector.memory-inputs+0x4e4>
    9450:      	mov	x19, x8
    9454:      	b	0x9068 <_stogir.vector.memory-inputs+0x104>
    9458:      	mov	x19, x8
    945c:      	b	0x9068 <_stogir.vector.memory-inputs+0x104>
    9460:      	mov	x19, x8
    9464:      	b	0x9068 <_stogir.vector.memory-inputs+0x104>
    9468:      	mov	x19, x8
    946c:      	b	0x9068 <_stogir.vector.memory-inputs+0x104>

0000000000009470 <_stogir.vector.store-inputs>:
    9470:      	sub	sp, sp, #0x40
    9474:      	str	x29, [sp]
    9478:      	str	x30, [sp, #0x8]
    947c:      	mov	x29, sp
    9480:      	str	x19, [sp, #0x30]
    9484:      	sxtw	x4, w4
    9488:      	cmp	x4, #0x0
    948c:      	cset	w5, gt
    9490:      	movz	x16, #0x0, lsl #48
    9494:      	sub	x6, x16, x4
    9498:      	sub	x7, x6, #0x1
    949c:      	uxtb	w16, w5
    94a0:      	cmp	w16, wzr
    94a4:      	b.eq	0x94e8 <_stogir.vector.store-inputs+0x78>
    94a8:      	ldr	x6, [x0, #0x8]
    94ac:      	cmp	x4, x6
    94b0:      	b.ge	0x953c <_stogir.vector.store-inputs+0xcc>
    94b4:      	add	x6, x0, #0x78
    94b8:      	ldr	x6, [x6, #0x8]
    94bc:      	cmp	x4, x6
    94c0:      	b.ge	0x9654 <_stogir.vector.store-inputs+0x1e4>
    94c4:      	lsl	x6, x4, #2
    94c8:      	ldr	x9, [x0, #0x78]
    94cc:      	add	x6, x6, x9
    94d0:      	ldr	w6, [x6]
    94d4:      	sxtw	x6, w6
    94d8:      	cmp	x6, #0x0
    94dc:      	cset	w6, ge
    94e0:      	ubfx	x6, x6, #0, #8
    94e4:      	b	0x9658 <_stogir.vector.store-inputs+0x1e8>
    94e8:      	cmp	x4, #0x0
    94ec:      	b.ge	0x9544 <_stogir.vector.store-inputs+0xd4>
    94f0:      	add	x9, x0, #0x28
    94f4:      	add	x10, x0, #0x50
    94f8:      	ldr	x9, [x9, #0x8]
    94fc:      	ldr	x10, [x10, #0x8]
    9500:      	cmp	x9, x10
    9504:      	b.ne	0x9534 <_stogir.vector.store-inputs+0xc4>
    9508:      	cmp	x6, x9
    950c:      	b.gt	0x965c <_stogir.vector.store-inputs+0x1ec>
    9510:      	lsl	x6, x7, #2
    9514:      	ldr	x9, [x0, #0x50]
    9518:      	add	x6, x6, x9
    951c:      	ldr	w6, [x6]
    9520:      	sxtw	x6, w6
    9524:      	cmp	x6, #0x0
    9528:      	cset	w6, gt
    952c:      	ubfx	x6, x6, #0, #8
    9530:      	b	0x9660 <_stogir.vector.store-inputs+0x1f0>
    9534:      	movz	x6, #0x0, lsl #48
    9538:      	b	0x9548 <_stogir.vector.store-inputs+0xd8>
    953c:      	movz	x6, #0x0, lsl #48
    9540:      	b	0x9548 <_stogir.vector.store-inputs+0xd8>
    9544:      	movz	x6, #0x0, lsl #48
    9548:      	cmp	x6, #0x0
    954c:      	b.eq	0x958c <_stogir.vector.store-inputs+0x11c>
    9550:      	uxtb	w16, w5
    9554:      	cmp	w16, wzr
    9558:      	b.eq	0x9570 <_stogir.vector.store-inputs+0x100>
    955c:      	lsl	x4, x4, #4
    9560:      	ldr	x5, [x0]
    9564:      	add	x4, x4, x5
    9568:      	ldr	x4, [x4]
    956c:      	b	0x9580 <_stogir.vector.store-inputs+0x110>
    9570:      	lsl	x4, x7, #4
    9574:      	ldr	x5, [x0, #0x28]
    9578:      	add	x4, x4, x5
    957c:      	ldr	x4, [x4]
    9580:      	mov	x5, x4
    9584:      	mov	x4, #0x1                ; =1
    9588:      	b	0x9594 <_stogir.vector.store-inputs+0x124>
    958c:      	movz	x4, #0x0, lsl #48
    9590:      	movz	x5, #0x0, lsl #48
    9594:      	lsr	w4, w4, #0
    9598:      	lsr	x16, x4, #0
    959c:      	cmp	x16, #0x1
    95a0:      	b.eq	0x95bc <_stogir.vector.store-inputs+0x14c>
    95a4:      	b.lo	0x95ac <_stogir.vector.store-inputs+0x13c>
    95a8:      	b	0x95c0 <_stogir.vector.store-inputs+0x150>
    95ac:      	cmp	x16, #0x0
    95b0:      	b.eq	0x95b8 <_stogir.vector.store-inputs+0x148>
    95b4:      	b	0x95c0 <_stogir.vector.store-inputs+0x150>
    95b8:      	b	0x95c4 <_stogir.vector.store-inputs+0x154>
    95bc:      	b	0x95e4 <_stogir.vector.store-inputs+0x174>
    95c0:      	b	0x9664 <_stogir.vector.store-inputs+0x1f4>
    95c4:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		00000000000095c4:  ARM64_RELOC_PAGE21	l_stogir.416
    95c8:      	ldr	x16, [x16]
		00000000000095c8:  ARM64_RELOC_PAGEOFF12	l_stogir.416
    95cc:      	orr	x0, x16, xzr
    95d0:      	mov	x19, x8
    95d4:      	mov	x1, x0
    95d8:      	mov	x0, #0x1                ; =1
    95dc:      	mov	x2, #0x1a               ; =26
    95e0:      	b	0x9634 <_stogir.vector.store-inputs+0x1c4>
    95e4:      	lsr	w1, w1, #0
    95e8:      	lsr	w2, w2, #0
    95ec:      	lsr	w3, w3, #0
    95f0:      	lsr	w5, w5, #0
    95f4:      	ubfx	x4, x5, #8, #8
    95f8:      	lsr	w4, w4, #0
    95fc:      	mov	x19, x8
    9600:      	add	x8, sp, #0x10
    9604:      	fmov	s31, w1
    9608:      	mov	w1, w4
    960c:      	mov	w4, w3
    9610:      	mov	w3, w2
    9614:      	fmov	w2, s31
    9618:      	bl	0x9618 <_stogir.vector.store-inputs+0x1a8>
		0000000000009618:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    961c:      	add	x16, sp, #0x10
    9620:      	ldr	x0, [x16]
    9624:      	add	x16, sp, #0x10
    9628:      	ldr	x1, [x16, #0x8]
    962c:      	add	x16, sp, #0x10
    9630:      	ldr	x2, [x16, #0x10]
    9634:      	str	x0, [x19]
    9638:      	str	x1, [x19, #0x8]
    963c:      	str	x2, [x19, #0x10]
    9640:      	ldr	x19, [sp, #0x30]
    9644:      	ldr	x29, [sp]
    9648:      	ldr	x30, [sp, #0x8]
    964c:      	add	sp, sp, #0x40
    9650:      	ret
    9654:      	movz	x6, #0x0, lsl #48
    9658:      	b	0x9540 <_stogir.vector.store-inputs+0xd0>
    965c:      	movz	x6, #0x0, lsl #48
    9660:      	b	0x9538 <_stogir.vector.store-inputs+0xc8>
    9664:      	brk	#0
    9668:      	b	0x9664 <_stogir.vector.store-inputs+0x1f4>

000000000000966c <_stogir.types.size>:
    966c:      	sub	sp, sp, #0x60
    9670:      	str	x29, [sp]
    9674:      	str	x30, [sp, #0x8]
    9678:      	mov	x29, sp
    967c:      	str	x19, [sp, #0x10]
    9680:      	str	x20, [sp, #0x18]
    9684:      	str	x21, [sp, #0x20]
    9688:      	str	x22, [sp, #0x28]
    968c:      	str	x23, [sp, #0x30]
    9690:      	str	x24, [sp, #0x38]
    9694:      	str	x25, [sp, #0x40]
    9698:      	str	x26, [sp, #0x48]
    969c:      	str	x27, [sp, #0x50]
    96a0:      	str	x28, [sp, #0x58]
    96a4:      	sxtw	x19, w0
    96a8:      	sxtw	x20, w1
    96ac:      	cmp	x19, #0xf
    96b0:      	cset	w21, gt
    96b4:      	cmp	x19, #0x0
    96b8:      	cset	w22, eq
    96bc:      	cmp	x20, #0x4
    96c0:      	cset	w23, eq
    96c4:      	cmp	x20, #0x8
    96c8:      	cset	w24, eq
    96cc:      	uxtb	w16, w21
    96d0:      	cmp	w16, wzr
    96d4:      	b.eq	0x9738 <_stogir.types.size+0xcc>
    96d8:      	cmp	x19, #0x80
    96dc:      	cset	w25, lt
    96e0:      	uxtb	w16, w25
    96e4:      	cmp	w16, wzr
    96e8:      	b.eq	0x9738 <_stogir.types.size+0xcc>
    96ec:      	and	x1, x19, #0xf
    96f0:      	lsr	w1, w1, #0
    96f4:      	sxtw	x26, w1
    96f8:      	cmp	x26, #0x1
    96fc:      	cset	w27, ge
    9700:      	uxtb	w16, w27
    9704:      	cmp	w16, wzr
    9708:      	b.eq	0x9738 <_stogir.types.size+0xcc>
    970c:      	cmp	x26, #0xd
    9710:      	cset	w28, le
    9714:      	uxtb	w16, w28
    9718:      	cmp	w16, wzr
    971c:      	b.eq	0x9738 <_stogir.types.size+0xcc>
    9720:      	lsr	w0, w0, #0
    9724:      	bl	0x9724 <_stogir.types.size+0xb8>
		0000000000009724:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    9728:      	cmp	x0, #0x0
    972c:      	b.eq	0x9818 <_stogir.types.size+0x1ac>
    9730:      	mov	x0, x26
    9734:      	b	0x981c <_stogir.types.size+0x1b0>
    9738:      	uxtb	w16, w23
    973c:      	cmp	w16, wzr
    9740:      	b.ne	0x9758 <_stogir.types.size+0xec>
    9744:      	uxtb	w16, w24
    9748:      	cmp	w16, wzr
    974c:      	b.ne	0x9758 <_stogir.types.size+0xec>
    9750:      	movn	x0, #0x0, lsl #48
    9754:      	b	0x9770 <_stogir.types.size+0x104>
    9758:      	uxtb	w16, w22
    975c:      	cmp	w16, wzr
    9760:      	b.eq	0x97a8 <_stogir.types.size+0x13c>
    9764:      	movz	x0, #0x0, lsl #48
    9768:      	b	0x9770 <_stogir.types.size+0x104>
    976c:      	mov	x0, #0x1                ; =1
    9770:      	ldr	x19, [sp, #0x10]
    9774:      	ldr	x20, [sp, #0x18]
    9778:      	ldr	x21, [sp, #0x20]
    977c:      	ldr	x22, [sp, #0x28]
    9780:      	ldr	x23, [sp, #0x30]
    9784:      	ldr	x24, [sp, #0x38]
    9788:      	ldr	x25, [sp, #0x40]
    978c:      	ldr	x26, [sp, #0x48]
    9790:      	ldr	x27, [sp, #0x50]
    9794:      	ldr	x28, [sp, #0x58]
    9798:      	ldr	x29, [sp]
    979c:      	ldr	x30, [sp, #0x8]
    97a0:      	add	sp, sp, #0x60
    97a4:      	ret
    97a8:      	cmp	x19, #0x1
    97ac:      	b.eq	0x976c <_stogir.types.size+0x100>
    97b0:      	cmp	x19, #0x2
    97b4:      	b.eq	0x976c <_stogir.types.size+0x100>
    97b8:      	cmp	x19, #0x7
    97bc:      	b.eq	0x976c <_stogir.types.size+0x100>
    97c0:      	cmp	x19, #0x8
    97c4:      	b.eq	0x976c <_stogir.types.size+0x100>
    97c8:      	cmp	x19, #0x3
    97cc:      	b.eq	0x9988 <_stogir.types.size+0x31c>
    97d0:      	cmp	x19, #0x9
    97d4:      	b.eq	0x9988 <_stogir.types.size+0x31c>
    97d8:      	cmp	x19, #0x4
    97dc:      	b.eq	0x99b0 <_stogir.types.size+0x344>
    97e0:      	cmp	x19, #0xa
    97e4:      	b.eq	0x99b0 <_stogir.types.size+0x344>
    97e8:      	cmp	x19, #0xd
    97ec:      	b.eq	0x99b0 <_stogir.types.size+0x344>
    97f0:      	cmp	x19, #0x5
    97f4:      	b.eq	0x99c0 <_stogir.types.size+0x354>
    97f8:      	cmp	x19, #0xb
    97fc:      	b.eq	0x99c0 <_stogir.types.size+0x354>
    9800:      	cmp	x19, #0xc
    9804:      	b.eq	0x99c0 <_stogir.types.size+0x354>
    9808:      	cmp	x19, #0x6
    980c:      	b.ne	0x99d0 <_stogir.types.size+0x364>
    9810:      	mov	x0, x20
    9814:      	b	0x99d4 <_stogir.types.size+0x368>
    9818:      	movn	x0, #0x0, lsl #48
    981c:      	uxtb	w16, w23
    9820:      	cmp	w16, wzr
    9824:      	b.ne	0x983c <_stogir.types.size+0x1d0>
    9828:      	uxtb	w16, w24
    982c:      	cmp	w16, wzr
    9830:      	b.ne	0x983c <_stogir.types.size+0x1d0>
    9834:      	movn	x0, #0x0, lsl #48
    9838:      	b	0x9858 <_stogir.types.size+0x1ec>
    983c:      	lsr	w0, w0, #0
    9840:      	sxtw	x0, w0
    9844:      	cmp	x0, #0x0
    9848:      	b.ne	0x9918 <_stogir.types.size+0x2ac>
    984c:      	movz	x0, #0x0, lsl #48
    9850:      	b	0x9858 <_stogir.types.size+0x1ec>
    9854:      	mov	x0, #0x1                ; =1
    9858:      	lsr	w0, w0, #0
    985c:      	sxtw	x0, w0
    9860:      	cmp	x0, #0x0
    9864:      	b.ge	0x98c0 <_stogir.types.size+0x254>
    9868:      	movn	x0, #0x0, lsl #48
    986c:      	b	0x9888 <_stogir.types.size+0x21c>
    9870:      	movn	x1, #0x0, lsl #48
    9874:      	lsr	w1, w1, #0
    9878:      	sxtw	x1, w1
    987c:      	mul	x0, x1, x0
    9880:      	lsr	w0, w0, #0
    9884:      	sxtw	x0, w0
    9888:      	ldr	x19, [sp, #0x10]
    988c:      	ldr	x20, [sp, #0x18]
    9890:      	ldr	x21, [sp, #0x20]
    9894:      	ldr	x22, [sp, #0x28]
    9898:      	ldr	x23, [sp, #0x30]
    989c:      	ldr	x24, [sp, #0x38]
    98a0:      	ldr	x25, [sp, #0x40]
    98a4:      	ldr	x26, [sp, #0x48]
    98a8:      	ldr	x27, [sp, #0x50]
    98ac:      	ldr	x28, [sp, #0x58]
    98b0:      	ldr	x29, [sp]
    98b4:      	ldr	x30, [sp, #0x8]
    98b8:      	add	sp, sp, #0x60
    98bc:      	ret
    98c0:      	uxtb	w16, w21
    98c4:      	cmp	w16, wzr
    98c8:      	b.eq	0x9990 <_stogir.types.size+0x324>
    98cc:      	uxtb	w16, w25
    98d0:      	cmp	w16, wzr
    98d4:      	b.eq	0x9990 <_stogir.types.size+0x324>
    98d8:      	uxtb	w16, w27
    98dc:      	cmp	w16, wzr
    98e0:      	b.eq	0x9990 <_stogir.types.size+0x324>
    98e4:      	uxtb	w16, w28
    98e8:      	cmp	w16, wzr
    98ec:      	b.eq	0x9990 <_stogir.types.size+0x324>
    98f0:      	ubfx	x1, x19, #4, #32
    98f4:      	sxtw	x1, w1
    98f8:      	sub	x1, x1, #0x1
    98fc:      	lsr	w1, w1, #0
    9900:      	sxtw	x1, w1
    9904:      	mov	x16, #0x1               ; =1
    9908:      	lsl	x1, x16, x1
    990c:      	lsr	w1, w1, #0
    9910:      	sxtw	x1, w1
    9914:      	b	0x9874 <_stogir.types.size+0x208>
    9918:      	cmp	x0, #0x1
    991c:      	b.eq	0x9854 <_stogir.types.size+0x1e8>
    9920:      	cmp	x0, #0x2
    9924:      	b.eq	0x9854 <_stogir.types.size+0x1e8>
    9928:      	cmp	x0, #0x7
    992c:      	b.eq	0x9854 <_stogir.types.size+0x1e8>
    9930:      	cmp	x0, #0x8
    9934:      	b.eq	0x9854 <_stogir.types.size+0x1e8>
    9938:      	cmp	x0, #0x3
    993c:      	b.eq	0x99b8 <_stogir.types.size+0x34c>
    9940:      	cmp	x0, #0x9
    9944:      	b.eq	0x99b8 <_stogir.types.size+0x34c>
    9948:      	cmp	x0, #0x4
    994c:      	b.eq	0x99c8 <_stogir.types.size+0x35c>
    9950:      	cmp	x0, #0xa
    9954:      	b.eq	0x99c8 <_stogir.types.size+0x35c>
    9958:      	cmp	x0, #0xd
    995c:      	b.eq	0x99c8 <_stogir.types.size+0x35c>
    9960:      	cmp	x0, #0x5
    9964:      	b.eq	0x99d8 <_stogir.types.size+0x36c>
    9968:      	cmp	x0, #0xb
    996c:      	b.eq	0x99d8 <_stogir.types.size+0x36c>
    9970:      	cmp	x0, #0xc
    9974:      	b.eq	0x99d8 <_stogir.types.size+0x36c>
    9978:      	cmp	x0, #0x6
    997c:      	b.ne	0x99e0 <_stogir.types.size+0x374>
    9980:      	mov	x0, x20
    9984:      	b	0x99e4 <_stogir.types.size+0x378>
    9988:      	mov	x0, #0x2                ; =2
    998c:      	b	0x9770 <_stogir.types.size+0x104>
    9990:      	cmp	x19, #0x0
    9994:      	b.lt	0x9870 <_stogir.types.size+0x204>
    9998:      	cmp	x19, #0xd
    999c:      	b.gt	0x9870 <_stogir.types.size+0x204>
    99a0:      	uxtb	w16, w22
    99a4:      	cmp	w16, wzr
    99a8:      	cset	x1, eq
    99ac:      	b	0x9874 <_stogir.types.size+0x208>
    99b0:      	mov	x0, #0x4                ; =4
    99b4:      	b	0x998c <_stogir.types.size+0x320>
    99b8:      	mov	x0, #0x2                ; =2
    99bc:      	b	0x9858 <_stogir.types.size+0x1ec>
    99c0:      	mov	x0, #0x8                ; =8
    99c4:      	b	0x99b4 <_stogir.types.size+0x348>
    99c8:      	mov	x0, #0x4                ; =4
    99cc:      	b	0x99bc <_stogir.types.size+0x350>
    99d0:      	movn	x0, #0x0, lsl #48
    99d4:      	b	0x99c4 <_stogir.types.size+0x358>
    99d8:      	mov	x0, #0x8                ; =8
    99dc:      	b	0x99cc <_stogir.types.size+0x360>
    99e0:      	movn	x0, #0x0, lsl #48
    99e4:      	b	0x99dc <_stogir.types.size+0x370>

00000000000099e8 <_stogir.opcode.properties>:
    99e8:      	sxtw	x0, w0
    99ec:      	cmp	x0, #0x0
    99f0:      	b.lt	0x9a18 <_stogir.opcode.properties+0x30>
    99f4:      	cmp	x0, #0x83
    99f8:      	b.ge	0x9a18 <_stogir.opcode.properties+0x30>
    99fc:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		00000000000099fc:  ARM64_RELOC_PAGE21	l_stogir.417
    9a00:      	ldr	x16, [x16]
		0000000000009a00:  ARM64_RELOC_PAGEOFF12	l_stogir.417
    9a04:      	orr	x1, x16, xzr
    9a08:      	lsr	x0, x0, #0
    9a0c:      	add	x0, x0, x1
    9a10:      	ldrb	w0, [x0]
    9a14:      	b	0x9a1c <_stogir.opcode.properties+0x34>
    9a18:      	movz	x0, #0x0, lsl #48
    9a1c:      	ret

0000000000009a20 <_stogir.checked.projection>:
    9a20:      	sub	sp, sp, #0x40
    9a24:      	str	x29, [sp]
    9a28:      	str	x30, [sp, #0x8]
    9a2c:      	mov	x29, sp
    9a30:      	str	x19, [sp, #0x30]
    9a34:      	sxtw	x2, w1
    9a38:      	cmp	x2, #0x0
    9a3c:      	cset	w3, gt
    9a40:      	movz	x16, #0x0, lsl #48
    9a44:      	sub	x4, x16, x2
    9a48:      	sub	x5, x4, #0x1
    9a4c:      	uxtb	w16, w3
    9a50:      	cmp	w16, wzr
    9a54:      	b.eq	0x9a98 <_stogir.checked.projection+0x78>
    9a58:      	ldr	x4, [x0, #0x8]
    9a5c:      	cmp	x2, x4
    9a60:      	b.ge	0x9aec <_stogir.checked.projection+0xcc>
    9a64:      	add	x4, x0, #0x78
    9a68:      	ldr	x4, [x4, #0x8]
    9a6c:      	cmp	x2, x4
    9a70:      	b.ge	0x9c0c <_stogir.checked.projection+0x1ec>
    9a74:      	lsl	x4, x2, #2
    9a78:      	ldr	x6, [x0, #0x78]
    9a7c:      	add	x4, x4, x6
    9a80:      	ldr	w4, [x4]
    9a84:      	sxtw	x4, w4
    9a88:      	cmp	x4, #0x0
    9a8c:      	cset	w4, ge
    9a90:      	ubfx	x4, x4, #0, #8
    9a94:      	b	0x9c10 <_stogir.checked.projection+0x1f0>
    9a98:      	cmp	x2, #0x0
    9a9c:      	b.ge	0x9af4 <_stogir.checked.projection+0xd4>
    9aa0:      	add	x6, x0, #0x28
    9aa4:      	add	x7, x0, #0x50
    9aa8:      	ldr	x6, [x6, #0x8]
    9aac:      	ldr	x7, [x7, #0x8]
    9ab0:      	cmp	x6, x7
    9ab4:      	b.ne	0x9ae4 <_stogir.checked.projection+0xc4>
    9ab8:      	cmp	x4, x6
    9abc:      	b.gt	0x9c3c <_stogir.checked.projection+0x21c>
    9ac0:      	lsl	x4, x5, #2
    9ac4:      	ldr	x6, [x0, #0x50]
    9ac8:      	add	x4, x4, x6
    9acc:      	ldr	w4, [x4]
    9ad0:      	sxtw	x4, w4
    9ad4:      	cmp	x4, #0x0
    9ad8:      	cset	w4, gt
    9adc:      	ubfx	x4, x4, #0, #8
    9ae0:      	b	0x9c40 <_stogir.checked.projection+0x220>
    9ae4:      	movz	x4, #0x0, lsl #48
    9ae8:      	b	0x9af8 <_stogir.checked.projection+0xd8>
    9aec:      	movz	x4, #0x0, lsl #48
    9af0:      	b	0x9af8 <_stogir.checked.projection+0xd8>
    9af4:      	movz	x4, #0x0, lsl #48
    9af8:      	cmp	x4, #0x0
    9afc:      	b.eq	0x9b3c <_stogir.checked.projection+0x11c>
    9b00:      	uxtb	w16, w3
    9b04:      	cmp	w16, wzr
    9b08:      	b.eq	0x9b20 <_stogir.checked.projection+0x100>
    9b0c:      	lsl	x2, x2, #4
    9b10:      	ldr	x3, [x0]
    9b14:      	add	x2, x2, x3
    9b18:      	ldr	x2, [x2]
    9b1c:      	b	0x9b30 <_stogir.checked.projection+0x110>
    9b20:      	lsl	x2, x5, #4
    9b24:      	ldr	x3, [x0, #0x28]
    9b28:      	add	x2, x2, x3
    9b2c:      	ldr	x2, [x2]
    9b30:      	mov	x3, x2
    9b34:      	mov	x2, #0x1                ; =1
    9b38:      	b	0x9b44 <_stogir.checked.projection+0x124>
    9b3c:      	movz	x2, #0x0, lsl #48
    9b40:      	movz	x3, #0x0, lsl #48
    9b44:      	lsr	w2, w2, #0
    9b48:      	lsr	x16, x2, #0
    9b4c:      	cmp	x16, #0x1
    9b50:      	b.eq	0x9b6c <_stogir.checked.projection+0x14c>
    9b54:      	b.lo	0x9b5c <_stogir.checked.projection+0x13c>
    9b58:      	b	0x9b70 <_stogir.checked.projection+0x150>
    9b5c:      	cmp	x16, #0x0
    9b60:      	b.eq	0x9b68 <_stogir.checked.projection+0x148>
    9b64:      	b	0x9b70 <_stogir.checked.projection+0x150>
    9b68:      	b	0x9b74 <_stogir.checked.projection+0x154>
    9b6c:      	b	0x9bcc <_stogir.checked.projection+0x1ac>
    9b70:      	b	0x9c44 <_stogir.checked.projection+0x224>
    9b74:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		0000000000009b74:  ARM64_RELOC_PAGE21	l_stogir.418
    9b78:      	ldr	x16, [x16]
		0000000000009b78:  ARM64_RELOC_PAGEOFF12	l_stogir.418
    9b7c:      	orr	x0, x16, xzr
    9b80:      	mov	x19, x8
    9b84:      	mov	x1, x0
    9b88:      	mov	x0, #0x1                ; =1
    9b8c:      	mov	x2, #0x17               ; =23
    9b90:      	b	0x9bac <_stogir.checked.projection+0x18c>
    9b94:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		0000000000009b94:  ARM64_RELOC_PAGE21	l_stogir.419
    9b98:      	ldr	x16, [x16]
		0000000000009b98:  ARM64_RELOC_PAGEOFF12	l_stogir.419
    9b9c:      	orr	x0, x16, xzr
    9ba0:      	mov	x1, x0
    9ba4:      	mov	x0, #0x1                ; =1
    9ba8:      	mov	x2, #0x20               ; =32
    9bac:      	str	x0, [x19]
    9bb0:      	str	x1, [x19, #0x8]
    9bb4:      	str	x2, [x19, #0x10]
    9bb8:      	ldr	x19, [sp, #0x30]
    9bbc:      	ldr	x29, [sp]
    9bc0:      	ldr	x30, [sp, #0x8]
    9bc4:      	add	sp, sp, #0x40
    9bc8:      	ret
    9bcc:      	uxtb	w2, w3
    9bd0:      	cmp	x2, #0x29
    9bd4:      	b.lt	0x9c4c <_stogir.checked.projection+0x22c>
    9bd8:      	cmp	x2, #0x2b
    9bdc:      	b.gt	0x9c54 <_stogir.checked.projection+0x234>
    9be0:      	lsr	w1, w1, #0
    9be4:      	mov	x19, x8
    9be8:      	add	x8, sp, #0x10
    9bec:      	bl	0x9bec <_stogir.checked.projection+0x1cc>
		0000000000009bec:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    9bf0:      	add	x16, sp, #0x10
    9bf4:      	ldr	x0, [x16]
    9bf8:      	add	x16, sp, #0x10
    9bfc:      	ldr	x1, [x16, #0x8]
    9c00:      	add	x16, sp, #0x10
    9c04:      	ldr	x2, [x16, #0x10]
    9c08:      	b	0x9bac <_stogir.checked.projection+0x18c>
    9c0c:      	movz	x4, #0x0, lsl #48
    9c10:      	b	0x9af0 <_stogir.checked.projection+0xd0>
    9c14:      	lsr	w3, w3, #0
    9c18:      	ubfx	x0, x3, #8, #8
    9c1c:      	cmp	x0, #0x0
    9c20:      	b.eq	0x9b94 <_stogir.checked.projection+0x174>
    9c24:      	cmp	x0, #0xd
    9c28:      	b.gt	0x9b94 <_stogir.checked.projection+0x174>
    9c2c:      	movz	x0, #0x0, lsl #48
    9c30:      	movz	x1, #0x0, lsl #48
    9c34:      	movz	x2, #0x0, lsl #48
    9c38:      	b	0x9bac <_stogir.checked.projection+0x18c>
    9c3c:      	movz	x4, #0x0, lsl #48
    9c40:      	b	0x9ae8 <_stogir.checked.projection+0xc8>
    9c44:      	brk	#0
    9c48:      	b	0x9c44 <_stogir.checked.projection+0x224>
    9c4c:      	mov	x19, x8
    9c50:      	b	0x9c14 <_stogir.checked.projection+0x1f4>
    9c54:      	mov	x19, x8
    9c58:      	b	0x9c14 <_stogir.checked.projection+0x1f4>

0000000000009c5c <_stogir.checked.operands>:
    9c5c:      	sub	sp, sp, #0x50
    9c60:      	str	x29, [sp]
    9c64:      	str	x30, [sp, #0x8]
    9c68:      	mov	x29, sp
    9c6c:      	str	x19, [sp, #0x30]
    9c70:      	str	x20, [sp, #0x38]
    9c74:      	str	x21, [sp, #0x40]
    9c78:      	str	x22, [sp, #0x48]
    9c7c:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		0000000000009c7c:  ARM64_RELOC_PAGE21	l_stogir.420
    9c80:      	ldr	x16, [x16]
		0000000000009c80:  ARM64_RELOC_PAGEOFF12	l_stogir.420
    9c84:      	orr	x5, x16, xzr
    9c88:      	sxtw	x1, w1
    9c8c:      	sxtw	x19, w2
    9c90:      	cmp	x1, #0x29
    9c94:      	b.lt	0x9cd4 <_stogir.checked.operands+0x78>
    9c98:      	cmp	x1, #0x2b
    9c9c:      	b.gt	0x9cd4 <_stogir.checked.operands+0x78>
    9ca0:      	cmp	x19, #0x1
    9ca4:      	b.lt	0x9cd4 <_stogir.checked.operands+0x78>
    9ca8:      	cmp	x19, #0xb
    9cac:      	b.gt	0x9cd4 <_stogir.checked.operands+0x78>
    9cb0:      	cmp	x19, #0x1
    9cb4:      	b.eq	0x9cd4 <_stogir.checked.operands+0x78>
    9cb8:      	mov	x1, x5
    9cbc:      	movz	x2, #0x0, lsl #48
    9cc0:      	b	0x9ce4 <_stogir.checked.operands+0x88>
    9cc4:      	movz	x4, #0x0, lsl #48
    9cc8:      	b	0x9d4c <_stogir.checked.operands+0xf0>
    9ccc:      	movz	x4, #0x0, lsl #48
    9cd0:      	b	0x9d60 <_stogir.checked.operands+0x104>
    9cd4:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		0000000000009cd4:  ARM64_RELOC_PAGE21	l_stogir.421
    9cd8:      	ldr	x16, [x16]
		0000000000009cd8:  ARM64_RELOC_PAGEOFF12	l_stogir.421
    9cdc:      	orr	x1, x16, xzr
    9ce0:      	mov	x2, #0x36               ; =54
    9ce4:      	add	x16, sp, #0x20
    9ce8:      	orr	x6, x16, xzr
    9cec:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		0000000000009cec:  ARM64_RELOC_PAGE21	l_stogir.422
    9cf0:      	ldr	x16, [x16]
		0000000000009cf0:  ARM64_RELOC_PAGEOFF12	l_stogir.422
    9cf4:      	orr	x7, x16, xzr
    9cf8:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		0000000000009cf8:  ARM64_RELOC_PAGE21	l_stogir.423
    9cfc:      	ldr	x16, [x16]
		0000000000009cfc:  ARM64_RELOC_PAGEOFF12	l_stogir.423
    9d00:      	orr	x9, x16, xzr
    9d04:      	lsr	w3, w3, #0
    9d08:      	lsr	w4, w4, #0
    9d0c:      	add	x10, x0, #0x78
    9d10:      	add	x11, x0, #0x28
    9d14:      	add	x12, x0, #0x50
    9d18:      	add	x16, sp, #0x10
    9d1c:      	str	w3, [x16]
    9d20:      	add	x16, sp, #0x10
    9d24:      	str	w4, [x16, #0x4]
    9d28:      	add	x16, sp, #0x10
    9d2c:      	ldr	x3, [x16]
    9d30:      	add	x16, sp, #0x20
    9d34:      	str	x3, [x16]
    9d38:      	mov	x20, x1
    9d3c:      	mov	x21, x2
    9d40:      	movz	x1, #0x0, lsl #48
    9d44:      	b	0x9e08 <_stogir.checked.operands+0x1ac>
    9d48:      	movz	x4, #0x0, lsl #48
    9d4c:      	fmov	d31, x3
    9d50:      	mov	x3, x4
    9d54:      	fmov	x4, d31
    9d58:      	b	0x9d6c <_stogir.checked.operands+0x110>
    9d5c:      	movz	x4, #0x0, lsl #48
    9d60:      	fmov	d31, x3
    9d64:      	mov	x3, x4
    9d68:      	fmov	x4, d31
    9d6c:      	cmp	x3, #0x0
    9d70:      	b.eq	0x9db0 <_stogir.checked.operands+0x154>
    9d74:      	uxtb	w16, w1
    9d78:      	cmp	w16, wzr
    9d7c:      	b.eq	0x9d94 <_stogir.checked.operands+0x138>
    9d80:      	lsl	x1, x2, #4
    9d84:      	ldr	x2, [x0]
    9d88:      	add	x1, x1, x2
    9d8c:      	ldr	x1, [x1]
    9d90:      	b	0x9da4 <_stogir.checked.operands+0x148>
    9d94:      	lsl	x1, x13, #4
    9d98:      	ldr	x2, [x0, #0x28]
    9d9c:      	add	x1, x1, x2
    9da0:      	ldr	x1, [x1]
    9da4:      	mov	x2, x1
    9da8:      	mov	x1, #0x1                ; =1
    9dac:      	b	0x9db8 <_stogir.checked.operands+0x15c>
    9db0:      	movz	x1, #0x0, lsl #48
    9db4:      	movz	x2, #0x0, lsl #48
    9db8:      	lsr	w1, w1, #0
    9dbc:      	lsr	x16, x1, #0
    9dc0:      	cmp	x16, #0x1
    9dc4:      	b.eq	0x9de0 <_stogir.checked.operands+0x184>
    9dc8:      	b.lo	0x9dd0 <_stogir.checked.operands+0x174>
    9dcc:      	b	0x9de4 <_stogir.checked.operands+0x188>
    9dd0:      	cmp	x16, #0x0
    9dd4:      	b.eq	0x9ddc <_stogir.checked.operands+0x180>
    9dd8:      	b	0x9de4 <_stogir.checked.operands+0x188>
    9ddc:      	b	0x9de8 <_stogir.checked.operands+0x18c>
    9de0:      	b	0x9fa4 <_stogir.checked.operands+0x348>
    9de4:      	b	0x9fd0 <_stogir.checked.operands+0x374>
    9de8:      	mov	x1, x7
    9dec:      	mov	x2, #0x22               ; =34
    9df0:      	b	0x9dfc <_stogir.checked.operands+0x1a0>
    9df4:      	mov	x1, x9
    9df8:      	mov	x2, #0x28               ; =40
    9dfc:      	mov	x20, x1
    9e00:      	mov	x21, x2
    9e04:      	mov	x1, x4
    9e08:      	cmp	x1, #0x2
    9e0c:      	b.ge	0x9e38 <_stogir.checked.operands+0x1dc>
    9e10:      	add	x2, x1, #0x1
    9e14:      	lsl	x1, x1, #2
    9e18:      	add	x1, x1, x6
    9e1c:      	ldr	w1, [x1]
    9e20:      	sxtw	x1, w1
    9e24:      	and	x1, x1, #0xffffffff
    9e28:      	mov	x3, x2
    9e2c:      	mov	x2, x1
    9e30:      	mov	x1, #0x1                ; =1
    9e34:      	b	0x9e44 <_stogir.checked.operands+0x1e8>
    9e38:      	mov	x3, x1
    9e3c:      	movz	x1, #0x0, lsl #48
    9e40:      	movz	x2, #0x0, lsl #48
    9e44:      	lsr	w1, w1, #0
    9e48:      	lsr	x16, x1, #0
    9e4c:      	cmp	x16, #0x1
    9e50:      	b.eq	0x9e6c <_stogir.checked.operands+0x210>
    9e54:      	b.lo	0x9e5c <_stogir.checked.operands+0x200>
    9e58:      	b	0x9e70 <_stogir.checked.operands+0x214>
    9e5c:      	cmp	x16, #0x0
    9e60:      	b.eq	0x9e68 <_stogir.checked.operands+0x20c>
    9e64:      	b	0x9e70 <_stogir.checked.operands+0x214>
    9e68:      	b	0x9ed8 <_stogir.checked.operands+0x27c>
    9e6c:      	b	0x9e74 <_stogir.checked.operands+0x218>
    9e70:      	b	0x9fc8 <_stogir.checked.operands+0x36c>
    9e74:      	lsr	w2, w2, #0
    9e78:      	sxtw	x2, w2
    9e7c:      	cmp	x2, #0x0
    9e80:      	cset	w1, gt
    9e84:      	movz	x16, #0x0, lsl #48
    9e88:      	sub	x4, x16, x2
    9e8c:      	sub	x13, x4, #0x1
    9e90:      	uxtb	w16, w1
    9e94:      	cmp	w16, wzr
    9e98:      	b.eq	0x9f00 <_stogir.checked.operands+0x2a4>
    9e9c:      	ldr	x4, [x0, #0x8]
    9ea0:      	cmp	x2, x4
    9ea4:      	b.ge	0x9d48 <_stogir.checked.operands+0xec>
    9ea8:      	ldr	x4, [x10, #0x8]
    9eac:      	cmp	x2, x4
    9eb0:      	b.ge	0x9cc4 <_stogir.checked.operands+0x68>
    9eb4:      	lsl	x4, x2, #2
    9eb8:      	ldr	x14, [x0, #0x78]
    9ebc:      	add	x4, x4, x14
    9ec0:      	ldr	w4, [x4]
    9ec4:      	sxtw	x4, w4
    9ec8:      	cmp	x4, #0x0
    9ecc:      	cset	w4, ge
    9ed0:      	ubfx	x4, x4, #0, #8
    9ed4:      	b	0x9cc8 <_stogir.checked.operands+0x6c>
    9ed8:      	cmp	x21, #0x0
    9edc:      	b.ne	0x9fd8 <_stogir.checked.operands+0x37c>
    9ee0:      	cmp	x21, #0x0
    9ee4:      	b.ne	0x9f44 <_stogir.checked.operands+0x2e8>
    9ee8:      	mov	x22, x8
    9eec:      	and	x0, x19, #0xffffffff
    9ef0:      	mov	x1, x0
    9ef4:      	movz	x0, #0x0, lsl #48
    9ef8:      	movz	x2, #0x0, lsl #48
    9efc:      	b	0x9f78 <_stogir.checked.operands+0x31c>
    9f00:      	cmp	x2, #0x0
    9f04:      	b.ge	0x9d5c <_stogir.checked.operands+0x100>
    9f08:      	ldr	x14, [x11, #0x8]
    9f0c:      	ldr	x15, [x12, #0x8]
    9f10:      	cmp	x14, x15
    9f14:      	b.ne	0x9ccc <_stogir.checked.operands+0x70>
    9f18:      	cmp	x4, x14
    9f1c:      	b.gt	0x9fc0 <_stogir.checked.operands+0x364>
    9f20:      	lsl	x4, x13, #2
    9f24:      	ldr	x14, [x0, #0x50]
    9f28:      	add	x4, x4, x14
    9f2c:      	ldr	w4, [x4]
    9f30:      	sxtw	x4, w4
    9f34:      	cmp	x4, #0x0
    9f38:      	cset	w4, gt
    9f3c:      	ubfx	x4, x4, #0, #8
    9f40:      	b	0x9fc4 <_stogir.checked.operands+0x368>
    9f44:      	lsr	x0, x21, #0
    9f48:      	mov	x1, x5
    9f4c:      	mov	x2, x0
    9f50:      	mov	x0, x20
    9f54:      	mov	x22, x8
    9f58:      	bl	0x9f58 <_stogir.checked.operands+0x2fc>
		0000000000009f58:  ARM64_RELOC_BRANCH26	_memcmp
    9f5c:      	lsr	w0, w0, #0
    9f60:      	sxtw	x0, w0
    9f64:      	cmp	x0, #0x0
    9f68:      	b.eq	0x9eec <_stogir.checked.operands+0x290>
    9f6c:      	mov	x1, x20
    9f70:      	mov	x2, x21
    9f74:      	mov	x0, #0x1                ; =1
    9f78:      	str	x0, [x22]
    9f7c:      	str	x1, [x22, #0x8]
    9f80:      	str	x2, [x22, #0x10]
    9f84:      	ldr	x19, [sp, #0x30]
    9f88:      	ldr	x20, [sp, #0x38]
    9f8c:      	ldr	x21, [sp, #0x40]
    9f90:      	ldr	x22, [sp, #0x48]
    9f94:      	ldr	x29, [sp]
    9f98:      	ldr	x30, [sp, #0x8]
    9f9c:      	add	sp, sp, #0x50
    9fa0:      	ret
    9fa4:      	lsr	w2, w2, #0
    9fa8:      	ubfx	x1, x2, #8, #8
    9fac:      	cmp	x1, x19
    9fb0:      	b.ne	0x9df4 <_stogir.checked.operands+0x198>
    9fb4:      	mov	x1, x20
    9fb8:      	mov	x2, x21
    9fbc:      	b	0x9dfc <_stogir.checked.operands+0x1a0>
    9fc0:      	movz	x4, #0x0, lsl #48
    9fc4:      	b	0x9cd0 <_stogir.checked.operands+0x74>
    9fc8:      	brk	#0
    9fcc:      	b	0x9fc8 <_stogir.checked.operands+0x36c>
    9fd0:      	brk	#0
    9fd4:      	b	0x9fd0 <_stogir.checked.operands+0x374>
    9fd8:      	mov	x22, x8
    9fdc:      	b	0x9f6c <_stogir.checked.operands+0x310>

0000000000009fe0 <_stogir.opcode.control?>:
    9fe0:      	sxtw	x0, w0
    9fe4:      	cmp	x0, #0x0
    9fe8:      	b.lt	0xa010 <_stogir.opcode.control?+0x30>
    9fec:      	cmp	x0, #0x83
    9ff0:      	b.ge	0xa010 <_stogir.opcode.control?+0x30>
    9ff4:      	adrp	x16, 0x9000 <_stogir.vector.memory-inputs+0x9c>
		0000000000009ff4:  ARM64_RELOC_PAGE21	l_stogir.424
    9ff8:      	ldr	x16, [x16]
		0000000000009ff8:  ARM64_RELOC_PAGEOFF12	l_stogir.424
    9ffc:      	orr	x1, x16, xzr
    a000:      	lsr	x0, x0, #0
    a004:      	add	x0, x0, x1
    a008:      	ldrb	w0, [x0]
    a00c:      	b	0xa014 <_stogir.opcode.control?+0x34>
    a010:      	movz	x0, #0x0, lsl #48
    a014:      	uxtb	w0, w0
    a018:      	and	x0, x0, #0x1
    a01c:      	uxtb	w0, w0
    a020:      	ret

000000000000a024 <_stogir.opcode.block-end?>:
    a024:      	sxtw	x0, w0
    a028:      	cmp	x0, #0x0
    a02c:      	b.lt	0xa054 <_stogir.opcode.block-end?+0x30>
    a030:      	cmp	x0, #0x83
    a034:      	b.ge	0xa054 <_stogir.opcode.block-end?+0x30>
    a038:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a038:  ARM64_RELOC_PAGE21	l_stogir.425
    a03c:      	ldr	x16, [x16]
		000000000000a03c:  ARM64_RELOC_PAGEOFF12	l_stogir.425
    a040:      	orr	x1, x16, xzr
    a044:      	lsr	x0, x0, #0
    a048:      	add	x0, x0, x1
    a04c:      	ldrb	w0, [x0]
    a050:      	b	0xa058 <_stogir.opcode.block-end?+0x34>
    a054:      	movz	x0, #0x0, lsl #48
    a058:      	uxtb	w0, w0
    a05c:      	and	x0, x0, #0x4
    a060:      	uxtb	w0, w0
    a064:      	cmp	x0, #0x0
    a068:      	cset	w0, eq
    a06c:      	uxtb	w16, w0
    a070:      	cmp	w16, wzr
    a074:      	cset	x0, eq
    a078:      	ret

000000000000a07c <_stogir.atomic.ordinary?>:
    a07c:      	sxtw	x1, w1
    a080:      	cmp	x1, #0x0
    a084:      	cset	w3, gt
    a088:      	movz	x16, #0x0, lsl #48
    a08c:      	sub	x4, x16, x1
    a090:      	sub	x5, x4, #0x1
    a094:      	uxtb	w16, w3
    a098:      	cmp	w16, wzr
    a09c:      	b.eq	0xa0e0 <_stogir.atomic.ordinary?+0x64>
    a0a0:      	ldr	x4, [x0, #0x8]
    a0a4:      	cmp	x1, x4
    a0a8:      	b.ge	0xa134 <_stogir.atomic.ordinary?+0xb8>
    a0ac:      	add	x4, x0, #0x78
    a0b0:      	ldr	x4, [x4, #0x8]
    a0b4:      	cmp	x1, x4
    a0b8:      	b.ge	0xa1f4 <_stogir.atomic.ordinary?+0x178>
    a0bc:      	lsl	x4, x1, #2
    a0c0:      	ldr	x6, [x0, #0x78]
    a0c4:      	add	x4, x4, x6
    a0c8:      	ldr	w4, [x4]
    a0cc:      	sxtw	x4, w4
    a0d0:      	cmp	x4, #0x0
    a0d4:      	cset	w4, ge
    a0d8:      	ubfx	x4, x4, #0, #8
    a0dc:      	b	0xa1f8 <_stogir.atomic.ordinary?+0x17c>
    a0e0:      	cmp	x1, #0x0
    a0e4:      	b.ge	0xa13c <_stogir.atomic.ordinary?+0xc0>
    a0e8:      	add	x6, x0, #0x28
    a0ec:      	add	x7, x0, #0x50
    a0f0:      	ldr	x6, [x6, #0x8]
    a0f4:      	ldr	x7, [x7, #0x8]
    a0f8:      	cmp	x6, x7
    a0fc:      	b.ne	0xa12c <_stogir.atomic.ordinary?+0xb0>
    a100:      	cmp	x4, x6
    a104:      	b.gt	0xa214 <_stogir.atomic.ordinary?+0x198>
    a108:      	lsl	x4, x5, #2
    a10c:      	ldr	x6, [x0, #0x50]
    a110:      	add	x4, x4, x6
    a114:      	ldr	w4, [x4]
    a118:      	sxtw	x4, w4
    a11c:      	cmp	x4, #0x0
    a120:      	cset	w4, gt
    a124:      	ubfx	x4, x4, #0, #8
    a128:      	b	0xa218 <_stogir.atomic.ordinary?+0x19c>
    a12c:      	movz	x4, #0x0, lsl #48
    a130:      	b	0xa140 <_stogir.atomic.ordinary?+0xc4>
    a134:      	movz	x4, #0x0, lsl #48
    a138:      	b	0xa140 <_stogir.atomic.ordinary?+0xc4>
    a13c:      	movz	x4, #0x0, lsl #48
    a140:      	cmp	x4, #0x0
    a144:      	b.eq	0xa184 <_stogir.atomic.ordinary?+0x108>
    a148:      	uxtb	w16, w3
    a14c:      	cmp	w16, wzr
    a150:      	b.eq	0xa168 <_stogir.atomic.ordinary?+0xec>
    a154:      	lsl	x1, x1, #4
    a158:      	ldr	x0, [x0]
    a15c:      	add	x0, x1, x0
    a160:      	ldr	x0, [x0]
    a164:      	b	0xa178 <_stogir.atomic.ordinary?+0xfc>
    a168:      	lsl	x1, x5, #4
    a16c:      	ldr	x0, [x0, #0x28]
    a170:      	add	x0, x1, x0
    a174:      	ldr	x0, [x0]
    a178:      	mov	x1, x0
    a17c:      	mov	x0, #0x1                ; =1
    a180:      	b	0xa18c <_stogir.atomic.ordinary?+0x110>
    a184:      	movz	x0, #0x0, lsl #48
    a188:      	movz	x1, #0x0, lsl #48
    a18c:      	lsr	w0, w0, #0
    a190:      	lsr	x16, x0, #0
    a194:      	cmp	x16, #0x1
    a198:      	b.eq	0xa1b4 <_stogir.atomic.ordinary?+0x138>
    a19c:      	b.lo	0xa1a4 <_stogir.atomic.ordinary?+0x128>
    a1a0:      	b	0xa1b8 <_stogir.atomic.ordinary?+0x13c>
    a1a4:      	cmp	x16, #0x0
    a1a8:      	b.eq	0xa1b0 <_stogir.atomic.ordinary?+0x134>
    a1ac:      	b	0xa1b8 <_stogir.atomic.ordinary?+0x13c>
    a1b0:      	b	0xa1bc <_stogir.atomic.ordinary?+0x140>
    a1b4:      	b	0xa1cc <_stogir.atomic.ordinary?+0x150>
    a1b8:      	b	0xa21c <_stogir.atomic.ordinary?+0x1a0>
    a1bc:      	movz	x0, #0x0, lsl #48
    a1c0:      	b	0xa1c8 <_stogir.atomic.ordinary?+0x14c>
    a1c4:      	movz	x0, #0x0, lsl #48
    a1c8:      	ret
    a1cc:      	sxtw	x2, w2
    a1d0:      	lsr	w0, w1, #0
    a1d4:      	ubfx	x0, x0, #8, #8
    a1d8:      	cmp	x0, x2
    a1dc:      	b.ne	0xa1c4 <_stogir.atomic.ordinary?+0x148>
    a1e0:      	uxtb	w1, w1
    a1e4:      	cmp	x1, #0x46
    a1e8:      	b.ne	0xa1fc <_stogir.atomic.ordinary?+0x180>
    a1ec:      	movz	x0, #0x0, lsl #48
    a1f0:      	b	0xa210 <_stogir.atomic.ordinary?+0x194>
    a1f4:      	movz	x4, #0x0, lsl #48
    a1f8:      	b	0xa138 <_stogir.atomic.ordinary?+0xbc>
    a1fc:      	cmp	x1, #0x48
    a200:      	cset	w0, eq
    a204:      	uxtb	w16, w0
    a208:      	cmp	w16, wzr
    a20c:      	cset	x0, eq
    a210:      	b	0xa1c8 <_stogir.atomic.ordinary?+0x14c>
    a214:      	movz	x4, #0x0, lsl #48
    a218:      	b	0xa130 <_stogir.atomic.ordinary?+0xb4>
    a21c:      	brk	#0
    a220:      	b	0xa21c <_stogir.atomic.ordinary?+0x1a0>

000000000000a224 <_stogir.types.scalar-size>:
    a224:      	sxtw	x1, w1
    a228:      	cmp	x1, #0x4
    a22c:      	b.eq	0xa240 <_stogir.types.scalar-size+0x1c>
    a230:      	cmp	x1, #0x8
    a234:      	b.eq	0xa240 <_stogir.types.scalar-size+0x1c>
    a238:      	movn	x0, #0x0, lsl #48
    a23c:      	b	0xa258 <_stogir.types.scalar-size+0x34>
    a240:      	sxtw	x0, w0
    a244:      	cmp	x0, #0x0
    a248:      	b.ne	0xa25c <_stogir.types.scalar-size+0x38>
    a24c:      	movz	x0, #0x0, lsl #48
    a250:      	b	0xa258 <_stogir.types.scalar-size+0x34>
    a254:      	mov	x0, #0x1                ; =1
    a258:      	ret
    a25c:      	cmp	x0, #0x1
    a260:      	b.eq	0xa254 <_stogir.types.scalar-size+0x30>
    a264:      	cmp	x0, #0x2
    a268:      	b.eq	0xa254 <_stogir.types.scalar-size+0x30>
    a26c:      	cmp	x0, #0x7
    a270:      	b.eq	0xa254 <_stogir.types.scalar-size+0x30>
    a274:      	cmp	x0, #0x8
    a278:      	b.eq	0xa254 <_stogir.types.scalar-size+0x30>
    a27c:      	cmp	x0, #0x3
    a280:      	b.eq	0xa2cc <_stogir.types.scalar-size+0xa8>
    a284:      	cmp	x0, #0x9
    a288:      	b.eq	0xa2cc <_stogir.types.scalar-size+0xa8>
    a28c:      	cmp	x0, #0x4
    a290:      	b.eq	0xa2d4 <_stogir.types.scalar-size+0xb0>
    a294:      	cmp	x0, #0xa
    a298:      	b.eq	0xa2d4 <_stogir.types.scalar-size+0xb0>
    a29c:      	cmp	x0, #0xd
    a2a0:      	b.eq	0xa2d4 <_stogir.types.scalar-size+0xb0>
    a2a4:      	cmp	x0, #0x5
    a2a8:      	b.eq	0xa2dc <_stogir.types.scalar-size+0xb8>
    a2ac:      	cmp	x0, #0xb
    a2b0:      	b.eq	0xa2dc <_stogir.types.scalar-size+0xb8>
    a2b4:      	cmp	x0, #0xc
    a2b8:      	b.eq	0xa2dc <_stogir.types.scalar-size+0xb8>
    a2bc:      	cmp	x0, #0x6
    a2c0:      	b.ne	0xa2e4 <_stogir.types.scalar-size+0xc0>
    a2c4:      	mov	x0, x1
    a2c8:      	b	0xa2e8 <_stogir.types.scalar-size+0xc4>
    a2cc:      	mov	x0, #0x2                ; =2
    a2d0:      	b	0xa258 <_stogir.types.scalar-size+0x34>
    a2d4:      	mov	x0, #0x4                ; =4
    a2d8:      	b	0xa2d0 <_stogir.types.scalar-size+0xac>
    a2dc:      	mov	x0, #0x8                ; =8
    a2e0:      	b	0xa2d8 <_stogir.types.scalar-size+0xb4>
    a2e4:      	movn	x0, #0x0, lsl #48
    a2e8:      	b	0xa2e0 <_stogir.types.scalar-size+0xbc>

000000000000a2ec <_stogir.terminal.inputs>:
    a2ec:      	sxtw	x1, w1
    a2f0:      	cmp	x1, #0x60
    a2f4:      	cset	w4, eq
    a2f8:      	uxtb	w16, w4
    a2fc:      	cmp	w16, wzr
    a300:      	b.ne	0xa334 <_stogir.terminal.inputs+0x48>
    a304:      	cmp	x1, #0x79
    a308:      	b.eq	0xa334 <_stogir.terminal.inputs+0x48>
    a30c:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a30c:  ARM64_RELOC_PAGE21	l_stogir.426
    a310:      	ldr	x16, [x16]
		000000000000a310:  ARM64_RELOC_PAGEOFF12	l_stogir.426
    a314:      	orr	x0, x16, xzr
    a318:      	mov	x1, x0
    a31c:      	mov	x0, #0x1                ; =1
    a320:      	mov	x2, #0x25               ; =37
    a324:      	str	x0, [x8]
    a328:      	str	x1, [x8, #0x8]
    a32c:      	str	x2, [x8, #0x10]
    a330:      	ret
    a334:      	sxtw	x3, w3
    a338:      	uxtb	w16, w4
    a33c:      	cmp	w16, wzr
    a340:      	b.eq	0xa34c <_stogir.terminal.inputs+0x60>
    a344:      	cmp	x3, #0x0
    a348:      	b.ne	0xa30c <_stogir.terminal.inputs+0x20>
    a34c:      	sxtw	x2, w2
    a350:      	cmp	x2, #0x0
    a354:      	cset	w1, gt
    a358:      	movz	x16, #0x0, lsl #48
    a35c:      	sub	x4, x16, x2
    a360:      	sub	x5, x4, #0x1
    a364:      	uxtb	w16, w1
    a368:      	cmp	w16, wzr
    a36c:      	b.eq	0xa454 <_stogir.terminal.inputs+0x168>
    a370:      	ldr	x4, [x0, #0x8]
    a374:      	cmp	x2, x4
    a378:      	b.ge	0xa44c <_stogir.terminal.inputs+0x160>
    a37c:      	add	x4, x0, #0x78
    a380:      	ldr	x4, [x4, #0x8]
    a384:      	cmp	x2, x4
    a388:      	b.ge	0xa4fc <_stogir.terminal.inputs+0x210>
    a38c:      	lsl	x4, x2, #2
    a390:      	ldr	x6, [x0, #0x78]
    a394:      	add	x4, x4, x6
    a398:      	ldr	w4, [x4]
    a39c:      	sxtw	x4, w4
    a3a0:      	cmp	x4, #0x0
    a3a4:      	cset	w4, ge
    a3a8:      	ubfx	x4, x4, #0, #8
    a3ac:      	b	0xa500 <_stogir.terminal.inputs+0x214>
    a3b0:      	movz	x1, #0x0, lsl #48
    a3b4:      	movz	x4, #0x0, lsl #48
    a3b8:      	lsr	w1, w1, #0
    a3bc:      	lsr	x16, x1, #0
    a3c0:      	cmp	x16, #0x1
    a3c4:      	b.eq	0xa3e0 <_stogir.terminal.inputs+0xf4>
    a3c8:      	b.lo	0xa3d0 <_stogir.terminal.inputs+0xe4>
    a3cc:      	b	0xa3e4 <_stogir.terminal.inputs+0xf8>
    a3d0:      	cmp	x16, #0x0
    a3d4:      	b.eq	0xa3dc <_stogir.terminal.inputs+0xf0>
    a3d8:      	b	0xa3e4 <_stogir.terminal.inputs+0xf8>
    a3dc:      	b	0xa3e8 <_stogir.terminal.inputs+0xfc>
    a3e0:      	b	0xa4a0 <_stogir.terminal.inputs+0x1b4>
    a3e4:      	b	0xa654 <_stogir.terminal.inputs+0x368>
    a3e8:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a3e8:  ARM64_RELOC_PAGE21	l_stogir.427
    a3ec:      	ldr	x16, [x16]
		000000000000a3ec:  ARM64_RELOC_PAGEOFF12	l_stogir.427
    a3f0:      	orr	x0, x16, xzr
    a3f4:      	mov	x1, x0
    a3f8:      	mov	x0, #0x1                ; =1
    a3fc:      	mov	x2, #0x1d               ; =29
    a400:      	b	0xa324 <_stogir.terminal.inputs+0x38>
    a404:      	lsl	x1, x5, #4
    a408:      	ldr	x4, [x0, #0x28]
    a40c:      	add	x1, x1, x4
    a410:      	ldr	x1, [x1]
    a414:      	mov	x4, x1
    a418:      	mov	x1, #0x1                ; =1
    a41c:      	b	0xa3b8 <_stogir.terminal.inputs+0xcc>
    a420:      	movz	x4, #0x0, lsl #48
    a424:      	cmp	x4, #0x0
    a428:      	b.eq	0xa3b0 <_stogir.terminal.inputs+0xc4>
    a42c:      	uxtb	w16, w1
    a430:      	cmp	w16, wzr
    a434:      	b.eq	0xa404 <_stogir.terminal.inputs+0x118>
    a438:      	lsl	x1, x2, #4
    a43c:      	ldr	x4, [x0]
    a440:      	add	x1, x1, x4
    a444:      	ldr	x1, [x1]
    a448:      	b	0xa414 <_stogir.terminal.inputs+0x128>
    a44c:      	movz	x4, #0x0, lsl #48
    a450:      	b	0xa424 <_stogir.terminal.inputs+0x138>
    a454:      	cmp	x2, #0x0
    a458:      	b.ge	0xa420 <_stogir.terminal.inputs+0x134>
    a45c:      	add	x6, x0, #0x28
    a460:      	add	x7, x0, #0x50
    a464:      	ldr	x6, [x6, #0x8]
    a468:      	ldr	x7, [x7, #0x8]
    a46c:      	cmp	x6, x7
    a470:      	b.ne	0xa4f4 <_stogir.terminal.inputs+0x208>
    a474:      	cmp	x4, x6
    a478:      	b.gt	0xa504 <_stogir.terminal.inputs+0x218>
    a47c:      	lsl	x4, x5, #2
    a480:      	ldr	x6, [x0, #0x50]
    a484:      	add	x4, x4, x6
    a488:      	ldr	w4, [x4]
    a48c:      	sxtw	x4, w4
    a490:      	cmp	x4, #0x0
    a494:      	cset	w4, gt
    a498:      	ubfx	x4, x4, #0, #8
    a49c:      	b	0xa508 <_stogir.terminal.inputs+0x21c>
    a4a0:      	cmp	x2, #0x0
    a4a4:      	b.le	0xa4d8 <_stogir.terminal.inputs+0x1ec>
    a4a8:      	uxtb	w4, w4
    a4ac:      	cmp	x4, #0x83
    a4b0:      	cset	w1, lt
    a4b4:      	uxtb	w16, w1
    a4b8:      	cmp	w16, wzr
    a4bc:      	b.eq	0xa50c <_stogir.terminal.inputs+0x220>
    a4c0:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a4c0:  ARM64_RELOC_PAGE21	l_stogir.428
    a4c4:      	ldr	x16, [x16]
		000000000000a4c4:  ARM64_RELOC_PAGEOFF12	l_stogir.428
    a4c8:      	orr	x2, x16, xzr
    a4cc:      	add	x2, x4, x2
    a4d0:      	ldrb	w2, [x2]
    a4d4:      	b	0xa510 <_stogir.terminal.inputs+0x224>
    a4d8:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a4d8:  ARM64_RELOC_PAGE21	l_stogir.429
    a4dc:      	ldr	x16, [x16]
		000000000000a4dc:  ARM64_RELOC_PAGEOFF12	l_stogir.429
    a4e0:      	orr	x0, x16, xzr
    a4e4:      	mov	x1, x0
    a4e8:      	mov	x0, #0x1                ; =1
    a4ec:      	mov	x2, #0x2c               ; =44
    a4f0:      	b	0xa400 <_stogir.terminal.inputs+0x114>
    a4f4:      	movz	x4, #0x0, lsl #48
    a4f8:      	b	0xa424 <_stogir.terminal.inputs+0x138>
    a4fc:      	movz	x4, #0x0, lsl #48
    a500:      	b	0xa450 <_stogir.terminal.inputs+0x164>
    a504:      	movz	x4, #0x0, lsl #48
    a508:      	b	0xa4f8 <_stogir.terminal.inputs+0x20c>
    a50c:      	movz	x2, #0x0, lsl #48
    a510:      	uxtb	w2, w2
    a514:      	and	x2, x2, #0x1
    a518:      	uxtb	w2, w2
    a51c:      	cmp	x2, #0x0
    a520:      	b.eq	0xa4d8 <_stogir.terminal.inputs+0x1ec>
    a524:      	uxtb	w16, w1
    a528:      	cmp	w16, wzr
    a52c:      	b.eq	0xa548 <_stogir.terminal.inputs+0x25c>
    a530:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a530:  ARM64_RELOC_PAGE21	l_stogir.428
    a534:      	ldr	x16, [x16]
		000000000000a534:  ARM64_RELOC_PAGEOFF12	l_stogir.428
    a538:      	orr	x1, x16, xzr
    a53c:      	add	x1, x4, x1
    a540:      	ldrb	w1, [x1]
    a544:      	b	0xa54c <_stogir.terminal.inputs+0x260>
    a548:      	movz	x1, #0x0, lsl #48
    a54c:      	uxtb	w1, w1
    a550:      	and	x1, x1, #0x4
    a554:      	uxtb	w1, w1
    a558:      	cmp	x1, #0x0
    a55c:      	cset	w1, eq
    a560:      	uxtb	w16, w1
    a564:      	cmp	w16, wzr
    a568:      	cset	x1, eq
    a56c:      	cmp	x1, #0x0
    a570:      	b.ne	0xa4d8 <_stogir.terminal.inputs+0x1ec>
    a574:      	cmp	x3, #0x0
    a578:      	b.ne	0xa58c <_stogir.terminal.inputs+0x2a0>
    a57c:      	movz	x0, #0x0, lsl #48
    a580:      	movz	x1, #0x0, lsl #48
    a584:      	movz	x2, #0x0, lsl #48
    a588:      	b	0xa4f0 <_stogir.terminal.inputs+0x204>
    a58c:      	cmp	x3, #0x0
    a590:      	cset	w1, gt
    a594:      	movz	x16, #0x0, lsl #48
    a598:      	sub	x2, x16, x3
    a59c:      	sub	x4, x2, #0x1
    a5a0:      	uxtb	w16, w1
    a5a4:      	cmp	w16, wzr
    a5a8:      	b.eq	0xa608 <_stogir.terminal.inputs+0x31c>
    a5ac:      	ldr	x2, [x0, #0x8]
    a5b0:      	cmp	x3, x2
    a5b4:      	b.ge	0xa65c <_stogir.terminal.inputs+0x370>
    a5b8:      	add	x2, x0, #0x78
    a5bc:      	ldr	x2, [x2, #0x8]
    a5c0:      	cmp	x3, x2
    a5c4:      	b.ge	0xa734 <_stogir.terminal.inputs+0x448>
    a5c8:      	lsl	x2, x3, #2
    a5cc:      	ldr	x5, [x0, #0x78]
    a5d0:      	add	x2, x2, x5
    a5d4:      	ldr	w2, [x2]
    a5d8:      	sxtw	x2, w2
    a5dc:      	cmp	x2, #0x0
    a5e0:      	cset	w2, ge
    a5e4:      	ubfx	x2, x2, #0, #8
    a5e8:      	b	0xa738 <_stogir.terminal.inputs+0x44c>
    a5ec:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a5ec:  ARM64_RELOC_PAGE21	l_stogir.430
    a5f0:      	ldr	x16, [x16]
		000000000000a5f0:  ARM64_RELOC_PAGEOFF12	l_stogir.430
    a5f4:      	orr	x0, x16, xzr
    a5f8:      	mov	x1, x0
    a5fc:      	mov	x0, #0x1                ; =1
    a600:      	mov	x2, #0x2e               ; =46
    a604:      	b	0xa588 <_stogir.terminal.inputs+0x29c>
    a608:      	cmp	x3, #0x0
    a60c:      	b.ge	0xa664 <_stogir.terminal.inputs+0x378>
    a610:      	add	x5, x0, #0x28
    a614:      	add	x6, x0, #0x50
    a618:      	ldr	x5, [x5, #0x8]
    a61c:      	ldr	x6, [x6, #0x8]
    a620:      	cmp	x5, x6
    a624:      	b.ne	0xa72c <_stogir.terminal.inputs+0x440>
    a628:      	cmp	x2, x5
    a62c:      	b.gt	0xa73c <_stogir.terminal.inputs+0x450>
    a630:      	lsl	x2, x4, #2
    a634:      	ldr	x5, [x0, #0x50]
    a638:      	add	x2, x2, x5
    a63c:      	ldr	w2, [x2]
    a640:      	sxtw	x2, w2
    a644:      	cmp	x2, #0x0
    a648:      	cset	w2, gt
    a64c:      	ubfx	x2, x2, #0, #8
    a650:      	b	0xa740 <_stogir.terminal.inputs+0x454>
    a654:      	brk	#0
    a658:      	b	0xa654 <_stogir.terminal.inputs+0x368>
    a65c:      	movz	x2, #0x0, lsl #48
    a660:      	b	0xa668 <_stogir.terminal.inputs+0x37c>
    a664:      	movz	x2, #0x0, lsl #48
    a668:      	cmp	x2, #0x0
    a66c:      	b.eq	0xa6ac <_stogir.terminal.inputs+0x3c0>
    a670:      	uxtb	w16, w1
    a674:      	cmp	w16, wzr
    a678:      	b.eq	0xa690 <_stogir.terminal.inputs+0x3a4>
    a67c:      	lsl	x1, x3, #4
    a680:      	ldr	x0, [x0]
    a684:      	add	x0, x1, x0
    a688:      	ldr	x0, [x0]
    a68c:      	b	0xa6a0 <_stogir.terminal.inputs+0x3b4>
    a690:      	lsl	x1, x4, #4
    a694:      	ldr	x0, [x0, #0x28]
    a698:      	add	x0, x1, x0
    a69c:      	ldr	x0, [x0]
    a6a0:      	mov	x1, x0
    a6a4:      	mov	x0, #0x1                ; =1
    a6a8:      	b	0xa6b4 <_stogir.terminal.inputs+0x3c8>
    a6ac:      	movz	x0, #0x0, lsl #48
    a6b0:      	movz	x1, #0x0, lsl #48
    a6b4:      	lsr	w0, w0, #0
    a6b8:      	lsr	x16, x0, #0
    a6bc:      	cmp	x16, #0x1
    a6c0:      	b.eq	0xa6dc <_stogir.terminal.inputs+0x3f0>
    a6c4:      	b.lo	0xa6cc <_stogir.terminal.inputs+0x3e0>
    a6c8:      	b	0xa6e0 <_stogir.terminal.inputs+0x3f4>
    a6cc:      	cmp	x16, #0x0
    a6d0:      	b.eq	0xa6d8 <_stogir.terminal.inputs+0x3ec>
    a6d4:      	b	0xa6e0 <_stogir.terminal.inputs+0x3f4>
    a6d8:      	b	0xa6e4 <_stogir.terminal.inputs+0x3f8>
    a6dc:      	b	0xa700 <_stogir.terminal.inputs+0x414>
    a6e0:      	b	0xa784 <_stogir.terminal.inputs+0x498>
    a6e4:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a6e4:  ARM64_RELOC_PAGE21	l_stogir.431
    a6e8:      	ldr	x16, [x16]
		000000000000a6e8:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    a6ec:      	orr	x0, x16, xzr
    a6f0:      	mov	x1, x0
    a6f4:      	mov	x0, #0x1                ; =1
    a6f8:      	mov	x2, #0x1d               ; =29
    a6fc:      	b	0xa604 <_stogir.terminal.inputs+0x318>
    a700:      	cmp	x3, #0x0
    a704:      	b.le	0xa5ec <_stogir.terminal.inputs+0x300>
    a708:      	uxtb	w1, w1
    a70c:      	cmp	x1, #0x83
    a710:      	b.ge	0xa744 <_stogir.terminal.inputs+0x458>
    a714:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a714:  ARM64_RELOC_PAGE21	l_stogir.428
    a718:      	ldr	x16, [x16]
		000000000000a718:  ARM64_RELOC_PAGEOFF12	l_stogir.428
    a71c:      	orr	x0, x16, xzr
    a720:      	add	x0, x1, x0
    a724:      	ldrb	w0, [x0]
    a728:      	b	0xa748 <_stogir.terminal.inputs+0x45c>
    a72c:      	movz	x2, #0x0, lsl #48
    a730:      	b	0xa668 <_stogir.terminal.inputs+0x37c>
    a734:      	movz	x2, #0x0, lsl #48
    a738:      	b	0xa660 <_stogir.terminal.inputs+0x374>
    a73c:      	movz	x2, #0x0, lsl #48
    a740:      	b	0xa730 <_stogir.terminal.inputs+0x444>
    a744:      	movz	x0, #0x0, lsl #48
    a748:      	uxtb	w0, w0
    a74c:      	and	x0, x0, #0x8
    a750:      	uxtb	w0, w0
    a754:      	cmp	x0, #0x0
    a758:      	cset	w0, eq
    a75c:      	uxtb	w16, w0
    a760:      	cmp	w16, wzr
    a764:      	cset	x0, eq
    a768:      	cmp	x0, #0x0
    a76c:      	b.eq	0xa5ec <_stogir.terminal.inputs+0x300>
    a770:      	and	x0, x3, #0xffffffff
    a774:      	mov	x1, x0
    a778:      	movz	x0, #0x0, lsl #48
    a77c:      	movz	x2, #0x0, lsl #48
    a780:      	b	0xa604 <_stogir.terminal.inputs+0x318>
    a784:      	brk	#0
    a788:      	b	0xa784 <_stogir.terminal.inputs+0x498>

000000000000a78c <_stogir.switch.switch-inputs>:
    a78c:      	sxtw	x1, w1
    a790:      	cmp	x1, #0x0
    a794:      	cset	w3, gt
    a798:      	movz	x16, #0x0, lsl #48
    a79c:      	sub	x4, x16, x1
    a7a0:      	sub	x5, x4, #0x1
    a7a4:      	uxtb	w16, w3
    a7a8:      	cmp	w16, wzr
    a7ac:      	b.eq	0xa7f0 <_stogir.switch.switch-inputs+0x64>
    a7b0:      	ldr	x4, [x0, #0x8]
    a7b4:      	cmp	x1, x4
    a7b8:      	b.ge	0xa860 <_stogir.switch.switch-inputs+0xd4>
    a7bc:      	add	x4, x0, #0x78
    a7c0:      	ldr	x4, [x4, #0x8]
    a7c4:      	cmp	x1, x4
    a7c8:      	b.ge	0xa948 <_stogir.switch.switch-inputs+0x1bc>
    a7cc:      	lsl	x4, x1, #2
    a7d0:      	ldr	x6, [x0, #0x78]
    a7d4:      	add	x4, x4, x6
    a7d8:      	ldr	w4, [x4]
    a7dc:      	sxtw	x4, w4
    a7e0:      	cmp	x4, #0x0
    a7e4:      	cset	w4, ge
    a7e8:      	ubfx	x4, x4, #0, #8
    a7ec:      	b	0xa94c <_stogir.switch.switch-inputs+0x1c0>
    a7f0:      	cmp	x1, #0x0
    a7f4:      	b.ge	0xa868 <_stogir.switch.switch-inputs+0xdc>
    a7f8:      	add	x6, x0, #0x28
    a7fc:      	add	x7, x0, #0x50
    a800:      	ldr	x6, [x6, #0x8]
    a804:      	ldr	x7, [x7, #0x8]
    a808:      	cmp	x6, x7
    a80c:      	b.ne	0xa83c <_stogir.switch.switch-inputs+0xb0>
    a810:      	cmp	x4, x6
    a814:      	b.gt	0xa950 <_stogir.switch.switch-inputs+0x1c4>
    a818:      	lsl	x4, x5, #2
    a81c:      	ldr	x6, [x0, #0x50]
    a820:      	add	x4, x4, x6
    a824:      	ldr	w4, [x4]
    a828:      	sxtw	x4, w4
    a82c:      	cmp	x4, #0x0
    a830:      	cset	w4, gt
    a834:      	ubfx	x4, x4, #0, #8
    a838:      	b	0xa954 <_stogir.switch.switch-inputs+0x1c8>
    a83c:      	movz	x4, #0x0, lsl #48
    a840:      	b	0xa86c <_stogir.switch.switch-inputs+0xe0>
    a844:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a844:  ARM64_RELOC_PAGE21	l_stogir.432
    a848:      	ldr	x16, [x16]
		000000000000a848:  ARM64_RELOC_PAGEOFF12	l_stogir.432
    a84c:      	orr	x0, x16, xzr
    a850:      	mov	x1, x0
    a854:      	mov	x0, #0x1                ; =1
    a858:      	mov	x2, #0x16               ; =22
    a85c:      	b	0xa900 <_stogir.switch.switch-inputs+0x174>
    a860:      	movz	x4, #0x0, lsl #48
    a864:      	b	0xa86c <_stogir.switch.switch-inputs+0xe0>
    a868:      	movz	x4, #0x0, lsl #48
    a86c:      	cmp	x4, #0x0
    a870:      	b.eq	0xa8b0 <_stogir.switch.switch-inputs+0x124>
    a874:      	uxtb	w16, w3
    a878:      	cmp	w16, wzr
    a87c:      	b.eq	0xa894 <_stogir.switch.switch-inputs+0x108>
    a880:      	lsl	x3, x1, #4
    a884:      	ldr	x4, [x0]
    a888:      	add	x3, x3, x4
    a88c:      	ldr	x3, [x3]
    a890:      	b	0xa8a4 <_stogir.switch.switch-inputs+0x118>
    a894:      	lsl	x3, x5, #4
    a898:      	ldr	x4, [x0, #0x28]
    a89c:      	add	x3, x3, x4
    a8a0:      	ldr	x3, [x3]
    a8a4:      	mov	x4, x3
    a8a8:      	mov	x3, #0x1                ; =1
    a8ac:      	b	0xa8b8 <_stogir.switch.switch-inputs+0x12c>
    a8b0:      	movz	x3, #0x0, lsl #48
    a8b4:      	movz	x4, #0x0, lsl #48
    a8b8:      	lsr	w3, w3, #0
    a8bc:      	lsr	x16, x3, #0
    a8c0:      	cmp	x16, #0x1
    a8c4:      	b.eq	0xa8e0 <_stogir.switch.switch-inputs+0x154>
    a8c8:      	b.lo	0xa8d0 <_stogir.switch.switch-inputs+0x144>
    a8cc:      	b	0xa8e4 <_stogir.switch.switch-inputs+0x158>
    a8d0:      	cmp	x16, #0x0
    a8d4:      	b.eq	0xa8dc <_stogir.switch.switch-inputs+0x150>
    a8d8:      	b	0xa8e4 <_stogir.switch.switch-inputs+0x158>
    a8dc:      	b	0xa8e8 <_stogir.switch.switch-inputs+0x15c>
    a8e0:      	b	0xa910 <_stogir.switch.switch-inputs+0x184>
    a8e4:      	b	0xab78 <_stogir.switch.switch-inputs+0x3ec>
    a8e8:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a8e8:  ARM64_RELOC_PAGE21	l_stogir.433
    a8ec:      	ldr	x16, [x16]
		000000000000a8ec:  ARM64_RELOC_PAGEOFF12	l_stogir.433
    a8f0:      	orr	x0, x16, xzr
    a8f4:      	mov	x1, x0
    a8f8:      	mov	x0, #0x1                ; =1
    a8fc:      	mov	x2, #0x16               ; =22
    a900:      	str	x0, [x8]
    a904:      	str	x1, [x8, #0x8]
    a908:      	str	x2, [x8, #0x10]
    a90c:      	ret
    a910:      	cmp	x1, #0x0
    a914:      	b.le	0xa844 <_stogir.switch.switch-inputs+0xb8>
    a918:      	uxtb	w4, w4
    a91c:      	cmp	x4, #0x83
    a920:      	cset	w1, lt
    a924:      	uxtb	w16, w1
    a928:      	cmp	w16, wzr
    a92c:      	b.eq	0xa958 <_stogir.switch.switch-inputs+0x1cc>
    a930:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a930:  ARM64_RELOC_PAGE21	l_stogir.434
    a934:      	ldr	x16, [x16]
		000000000000a934:  ARM64_RELOC_PAGEOFF12	l_stogir.434
    a938:      	orr	x3, x16, xzr
    a93c:      	add	x3, x4, x3
    a940:      	ldrb	w3, [x3]
    a944:      	b	0xa95c <_stogir.switch.switch-inputs+0x1d0>
    a948:      	movz	x4, #0x0, lsl #48
    a94c:      	b	0xa864 <_stogir.switch.switch-inputs+0xd8>
    a950:      	movz	x4, #0x0, lsl #48
    a954:      	b	0xa840 <_stogir.switch.switch-inputs+0xb4>
    a958:      	movz	x3, #0x0, lsl #48
    a95c:      	uxtb	w3, w3
    a960:      	and	x3, x3, #0x1
    a964:      	uxtb	w3, w3
    a968:      	cmp	x3, #0x0
    a96c:      	b.eq	0xa844 <_stogir.switch.switch-inputs+0xb8>
    a970:      	uxtb	w16, w1
    a974:      	cmp	w16, wzr
    a978:      	b.eq	0xa994 <_stogir.switch.switch-inputs+0x208>
    a97c:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000a97c:  ARM64_RELOC_PAGE21	l_stogir.434
    a980:      	ldr	x16, [x16]
		000000000000a980:  ARM64_RELOC_PAGEOFF12	l_stogir.434
    a984:      	orr	x1, x16, xzr
    a988:      	add	x1, x4, x1
    a98c:      	ldrb	w1, [x1]
    a990:      	b	0xa998 <_stogir.switch.switch-inputs+0x20c>
    a994:      	movz	x1, #0x0, lsl #48
    a998:      	uxtb	w1, w1
    a99c:      	and	x1, x1, #0x4
    a9a0:      	uxtb	w1, w1
    a9a4:      	cmp	x1, #0x0
    a9a8:      	cset	w1, eq
    a9ac:      	uxtb	w16, w1
    a9b0:      	cmp	w16, wzr
    a9b4:      	cset	x1, eq
    a9b8:      	cmp	x1, #0x0
    a9bc:      	b.ne	0xa844 <_stogir.switch.switch-inputs+0xb8>
    a9c0:      	sxtw	x2, w2
    a9c4:      	cmp	x2, #0x0
    a9c8:      	cset	w1, gt
    a9cc:      	movz	x16, #0x0, lsl #48
    a9d0:      	sub	x3, x16, x2
    a9d4:      	sub	x4, x3, #0x1
    a9d8:      	uxtb	w16, w1
    a9dc:      	cmp	w16, wzr
    a9e0:      	b.eq	0xaa40 <_stogir.switch.switch-inputs+0x2b4>
    a9e4:      	ldr	x3, [x0, #0x8]
    a9e8:      	cmp	x2, x3
    a9ec:      	b.ge	0xaa8c <_stogir.switch.switch-inputs+0x300>
    a9f0:      	add	x3, x0, #0x78
    a9f4:      	ldr	x3, [x3, #0x8]
    a9f8:      	cmp	x2, x3
    a9fc:      	b.ge	0xab70 <_stogir.switch.switch-inputs+0x3e4>
    aa00:      	lsl	x3, x2, #2
    aa04:      	ldr	x5, [x0, #0x78]
    aa08:      	add	x3, x3, x5
    aa0c:      	ldr	w3, [x3]
    aa10:      	sxtw	x3, w3
    aa14:      	cmp	x3, #0x0
    aa18:      	cset	w3, ge
    aa1c:      	ubfx	x3, x3, #0, #8
    aa20:      	b	0xab74 <_stogir.switch.switch-inputs+0x3e8>
    aa24:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000aa24:  ARM64_RELOC_PAGE21	l_stogir.435
    aa28:      	ldr	x16, [x16]
		000000000000aa28:  ARM64_RELOC_PAGEOFF12	l_stogir.435
    aa2c:      	orr	x0, x16, xzr
    aa30:      	mov	x1, x0
    aa34:      	mov	x0, #0x1                ; =1
    aa38:      	mov	x2, #0x20               ; =32
    aa3c:      	b	0xa85c <_stogir.switch.switch-inputs+0xd0>
    aa40:      	cmp	x2, #0x0
    aa44:      	b.ge	0xaa94 <_stogir.switch.switch-inputs+0x308>
    aa48:      	add	x5, x0, #0x28
    aa4c:      	add	x6, x0, #0x50
    aa50:      	ldr	x5, [x5, #0x8]
    aa54:      	ldr	x6, [x6, #0x8]
    aa58:      	cmp	x5, x6
    aa5c:      	b.ne	0xab68 <_stogir.switch.switch-inputs+0x3dc>
    aa60:      	cmp	x3, x5
    aa64:      	b.gt	0xab80 <_stogir.switch.switch-inputs+0x3f4>
    aa68:      	lsl	x3, x4, #2
    aa6c:      	ldr	x5, [x0, #0x50]
    aa70:      	add	x3, x3, x5
    aa74:      	ldr	w3, [x3]
    aa78:      	sxtw	x3, w3
    aa7c:      	cmp	x3, #0x0
    aa80:      	cset	w3, gt
    aa84:      	ubfx	x3, x3, #0, #8
    aa88:      	b	0xab84 <_stogir.switch.switch-inputs+0x3f8>
    aa8c:      	movz	x3, #0x0, lsl #48
    aa90:      	b	0xaa98 <_stogir.switch.switch-inputs+0x30c>
    aa94:      	movz	x3, #0x0, lsl #48
    aa98:      	cmp	x3, #0x0
    aa9c:      	b.eq	0xaadc <_stogir.switch.switch-inputs+0x350>
    aaa0:      	uxtb	w16, w1
    aaa4:      	cmp	w16, wzr
    aaa8:      	b.eq	0xaac0 <_stogir.switch.switch-inputs+0x334>
    aaac:      	lsl	x1, x2, #4
    aab0:      	ldr	x0, [x0]
    aab4:      	add	x0, x1, x0
    aab8:      	ldr	x0, [x0]
    aabc:      	b	0xaad0 <_stogir.switch.switch-inputs+0x344>
    aac0:      	lsl	x1, x4, #4
    aac4:      	ldr	x0, [x0, #0x28]
    aac8:      	add	x0, x1, x0
    aacc:      	ldr	x0, [x0]
    aad0:      	mov	x1, x0
    aad4:      	mov	x0, #0x1                ; =1
    aad8:      	b	0xaae4 <_stogir.switch.switch-inputs+0x358>
    aadc:      	movz	x0, #0x0, lsl #48
    aae0:      	movz	x1, #0x0, lsl #48
    aae4:      	lsr	w0, w0, #0
    aae8:      	lsr	x16, x0, #0
    aaec:      	cmp	x16, #0x1
    aaf0:      	b.eq	0xab0c <_stogir.switch.switch-inputs+0x380>
    aaf4:      	b.lo	0xaafc <_stogir.switch.switch-inputs+0x370>
    aaf8:      	b	0xab10 <_stogir.switch.switch-inputs+0x384>
    aafc:      	cmp	x16, #0x0
    ab00:      	b.eq	0xab08 <_stogir.switch.switch-inputs+0x37c>
    ab04:      	b	0xab10 <_stogir.switch.switch-inputs+0x384>
    ab08:      	b	0xab14 <_stogir.switch.switch-inputs+0x388>
    ab0c:      	b	0xab30 <_stogir.switch.switch-inputs+0x3a4>
    ab10:      	b	0xab88 <_stogir.switch.switch-inputs+0x3fc>
    ab14:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000ab14:  ARM64_RELOC_PAGE21	l_stogir.436
    ab18:      	ldr	x16, [x16]
		000000000000ab18:  ARM64_RELOC_PAGEOFF12	l_stogir.436
    ab1c:      	orr	x0, x16, xzr
    ab20:      	mov	x1, x0
    ab24:      	mov	x0, #0x1                ; =1
    ab28:      	mov	x2, #0x17               ; =23
    ab2c:      	b	0xaa3c <_stogir.switch.switch-inputs+0x2b0>
    ab30:      	lsr	w0, w1, #0
    ab34:      	ubfx	x0, x0, #8, #8
    ab38:      	cmp	x0, #0x1
    ab3c:      	b.lt	0xaa24 <_stogir.switch.switch-inputs+0x298>
    ab40:      	cmp	x0, #0xb
    ab44:      	b.gt	0xaa24 <_stogir.switch.switch-inputs+0x298>
    ab48:      	uxtb	w1, w1
    ab4c:      	cmp	x1, #0x48
    ab50:      	b.eq	0xaa24 <_stogir.switch.switch-inputs+0x298>
    ab54:      	and	x0, x0, #0xffffffff
    ab58:      	mov	x1, x0
    ab5c:      	movz	x0, #0x0, lsl #48
    ab60:      	movz	x2, #0x0, lsl #48
    ab64:      	b	0xaa3c <_stogir.switch.switch-inputs+0x2b0>
    ab68:      	movz	x3, #0x0, lsl #48
    ab6c:      	b	0xaa98 <_stogir.switch.switch-inputs+0x30c>
    ab70:      	movz	x3, #0x0, lsl #48
    ab74:      	b	0xaa90 <_stogir.switch.switch-inputs+0x304>
    ab78:      	brk	#0
    ab7c:      	b	0xab78 <_stogir.switch.switch-inputs+0x3ec>
    ab80:      	movz	x3, #0x0, lsl #48
    ab84:      	b	0xab6c <_stogir.switch.switch-inputs+0x3e0>
    ab88:      	brk	#0
    ab8c:      	b	0xab88 <_stogir.switch.switch-inputs+0x3fc>

000000000000ab90 <_stogir.switch.case-inputs>:
    ab90:      	sub	sp, sp, #0xc0
    ab94:      	str	x29, [sp]
    ab98:      	str	x30, [sp, #0x8]
    ab9c:      	mov	x29, sp
    aba0:      	str	x19, [sp, #0x80]
    aba4:      	str	x20, [sp, #0x88]
    aba8:      	str	x21, [sp, #0x90]
    abac:      	str	x22, [sp, #0x98]
    abb0:      	str	x23, [sp, #0xa0]
    abb4:      	str	x24, [sp, #0xa8]
    abb8:      	str	x25, [sp, #0xb0]
    abbc:      	str	x26, [sp, #0xb8]
    abc0:      	sxtw	x2, w2
    abc4:      	lsl	x5, x2, #2
    abc8:      	cmp	x2, #0x0
    abcc:      	cset	w6, gt
    abd0:      	movz	x16, #0x0, lsl #48
    abd4:      	sub	x7, x16, x2
    abd8:      	sub	x9, x7, #0x1
    abdc:      	uxtb	w16, w6
    abe0:      	cmp	w16, wzr
    abe4:      	b.eq	0xac24 <_stogir.switch.case-inputs+0x94>
    abe8:      	ldr	x7, [x0, #0x8]
    abec:      	cmp	x2, x7
    abf0:      	b.ge	0xac78 <_stogir.switch.case-inputs+0xe8>
    abf4:      	add	x7, x0, #0x78
    abf8:      	ldr	x7, [x7, #0x8]
    abfc:      	cmp	x2, x7
    ac00:      	b.ge	0xadb8 <_stogir.switch.case-inputs+0x228>
    ac04:      	ldr	x7, [x0, #0x78]
    ac08:      	add	x7, x5, x7
    ac0c:      	ldr	w7, [x7]
    ac10:      	sxtw	x7, w7
    ac14:      	cmp	x7, #0x0
    ac18:      	cset	w7, ge
    ac1c:      	ubfx	x7, x7, #0, #8
    ac20:      	b	0xadbc <_stogir.switch.case-inputs+0x22c>
    ac24:      	cmp	x2, #0x0
    ac28:      	b.ge	0xac80 <_stogir.switch.case-inputs+0xf0>
    ac2c:      	add	x10, x0, #0x28
    ac30:      	add	x11, x0, #0x50
    ac34:      	ldr	x10, [x10, #0x8]
    ac38:      	ldr	x11, [x11, #0x8]
    ac3c:      	cmp	x10, x11
    ac40:      	b.ne	0xac70 <_stogir.switch.case-inputs+0xe0>
    ac44:      	cmp	x7, x10
    ac48:      	b.gt	0xae94 <_stogir.switch.case-inputs+0x304>
    ac4c:      	lsl	x7, x9, #2
    ac50:      	ldr	x10, [x0, #0x50]
    ac54:      	add	x7, x7, x10
    ac58:      	ldr	w7, [x7]
    ac5c:      	sxtw	x7, w7
    ac60:      	cmp	x7, #0x0
    ac64:      	cset	w7, gt
    ac68:      	ubfx	x7, x7, #0, #8
    ac6c:      	b	0xae98 <_stogir.switch.case-inputs+0x308>
    ac70:      	movz	x7, #0x0, lsl #48
    ac74:      	b	0xac84 <_stogir.switch.case-inputs+0xf4>
    ac78:      	movz	x7, #0x0, lsl #48
    ac7c:      	b	0xac84 <_stogir.switch.case-inputs+0xf4>
    ac80:      	movz	x7, #0x0, lsl #48
    ac84:      	cmp	x7, #0x0
    ac88:      	b.eq	0xacec <_stogir.switch.case-inputs+0x15c>
    ac8c:      	uxtb	w16, w6
    ac90:      	cmp	w16, wzr
    ac94:      	b.eq	0xacbc <_stogir.switch.case-inputs+0x12c>
    ac98:      	lsl	x6, x2, #4
    ac9c:      	ldr	x7, [x0]
    aca0:      	add	x6, x6, x7
    aca4:      	ldr	x7, [x6]
    aca8:      	ldr	x6, [x6, #0x8]
    acac:      	fmov	d31, x6
    acb0:      	mov	x6, x7
    acb4:      	fmov	x7, d31
    acb8:      	b	0xacdc <_stogir.switch.case-inputs+0x14c>
    acbc:      	lsl	x6, x9, #4
    acc0:      	ldr	x7, [x0, #0x28]
    acc4:      	add	x6, x6, x7
    acc8:      	ldr	x7, [x6]
    accc:      	ldr	x6, [x6, #0x8]
    acd0:      	fmov	d31, x6
    acd4:      	mov	x6, x7
    acd8:      	fmov	x7, d31
    acdc:      	mov	x9, x7
    ace0:      	mov	x7, x6
    ace4:      	mov	x6, #0x1                ; =1
    ace8:      	b	0xacf8 <_stogir.switch.case-inputs+0x168>
    acec:      	movz	x6, #0x0, lsl #48
    acf0:      	movz	x7, #0x0, lsl #48
    acf4:      	movz	x9, #0x0, lsl #48
    acf8:      	lsr	w6, w6, #0
    acfc:      	lsr	x16, x6, #0
    ad00:      	cmp	x16, #0x1
    ad04:      	b.eq	0xad20 <_stogir.switch.case-inputs+0x190>
    ad08:      	b.lo	0xad10 <_stogir.switch.case-inputs+0x180>
    ad0c:      	b	0xad24 <_stogir.switch.case-inputs+0x194>
    ad10:      	cmp	x16, #0x0
    ad14:      	b.eq	0xad1c <_stogir.switch.case-inputs+0x18c>
    ad18:      	b	0xad24 <_stogir.switch.case-inputs+0x194>
    ad1c:      	b	0xad28 <_stogir.switch.case-inputs+0x198>
    ad20:      	b	0xad80 <_stogir.switch.case-inputs+0x1f0>
    ad24:      	b	0xae9c <_stogir.switch.case-inputs+0x30c>
    ad28:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000ad28:  ARM64_RELOC_PAGE21	l_stogir.437
    ad2c:      	ldr	x16, [x16]
		000000000000ad2c:  ARM64_RELOC_PAGEOFF12	l_stogir.437
    ad30:      	orr	x0, x16, xzr
    ad34:      	mov	x21, x8
    ad38:      	mov	x1, x0
    ad3c:      	mov	x0, #0x1                ; =1
    ad40:      	mov	x2, #0x1a               ; =26
    ad44:      	str	x0, [x21]
    ad48:      	str	x1, [x21, #0x8]
    ad4c:      	str	x2, [x21, #0x10]
    ad50:      	ldr	x19, [sp, #0x80]
    ad54:      	ldr	x20, [sp, #0x88]
    ad58:      	ldr	x21, [sp, #0x90]
    ad5c:      	ldr	x22, [sp, #0x98]
    ad60:      	ldr	x23, [sp, #0xa0]
    ad64:      	ldr	x24, [sp, #0xa8]
    ad68:      	ldr	x25, [sp, #0xb0]
    ad6c:      	ldr	x26, [sp, #0xb8]
    ad70:      	ldr	x29, [sp]
    ad74:      	ldr	x30, [sp, #0x8]
    ad78:      	add	sp, sp, #0xc0
    ad7c:      	ret
    ad80:      	add	x16, sp, #0x10
    ad84:      	str	x7, [x16]
    ad88:      	add	x16, sp, #0x10
    ad8c:      	str	x9, [x16, #0x8]
    ad90:      	cmp	x2, #0x0
    ad94:      	b.gt	0xadc0 <_stogir.switch.case-inputs+0x230>
    ad98:      	mov	x21, x8
    ad9c:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000ad9c:  ARM64_RELOC_PAGE21	l_stogir.438
    ada0:      	ldr	x16, [x16]
		000000000000ada0:  ARM64_RELOC_PAGEOFF12	l_stogir.438
    ada4:      	orr	x0, x16, xzr
    ada8:      	mov	x1, x0
    adac:      	mov	x0, #0x1                ; =1
    adb0:      	mov	x2, #0x1f               ; =31
    adb4:      	b	0xad44 <_stogir.switch.case-inputs+0x1b4>
    adb8:      	movz	x7, #0x0, lsl #48
    adbc:      	b	0xac7c <_stogir.switch.case-inputs+0xec>
    adc0:      	add	x16, sp, #0x10
    adc4:      	ldr	w2, [x16]
    adc8:      	uxtb	w6, w2
    adcc:      	cmp	x6, #0x75
    add0:      	b.ne	0xb02c <_stogir.switch.case-inputs+0x49c>
    add4:      	ubfx	x2, x2, #8, #8
    add8:      	cmp	x2, #0x0
    addc:      	b.ne	0xb034 <_stogir.switch.case-inputs+0x4a4>
    ade0:      	ldr	x2, [x0, #0x78]
    ade4:      	add	x2, x5, x2
    ade8:      	ldr	w2, [x2]
    adec:      	sxtw	x2, w2
    adf0:      	cmp	x2, #0x2
    adf4:      	b.ne	0xb03c <_stogir.switch.case-inputs+0x4ac>
    adf8:      	sxtw	x19, w1
    adfc:      	cmp	x19, #0x6d
    ae00:      	b.lt	0xb044 <_stogir.switch.case-inputs+0x4b4>
    ae04:      	cmp	x19, #0x6f
    ae08:      	b.gt	0xb04c <_stogir.switch.case-inputs+0x4bc>
    ae0c:      	add	x16, sp, #0x20
    ae10:      	orr	x20, x16, xzr
    ae14:      	add	x16, sp, #0x10
    ae18:      	ldr	w1, [x16, #0x4]
    ae1c:      	add	x16, sp, #0x10
    ae20:      	ldr	w2, [x16, #0x8]
    ae24:      	lsr	w1, w1, #0
    ae28:      	lsr	w2, w2, #0
    ae2c:      	mov	x21, x8
    ae30:      	add	x8, sp, #0x20
    ae34:      	mov	x22, x0
    ae38:      	mov	w23, w3
    ae3c:      	mov	w24, w4
    ae40:      	bl	0xae40 <_stogir.switch.case-inputs+0x2b0>
		000000000000ae40:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    ae44:      	add	x16, sp, #0x20
    ae48:      	ldr	w0, [x16]
    ae4c:      	lsr	x16, x0, #0
    ae50:      	cmp	x16, #0x1
    ae54:      	b.eq	0xae70 <_stogir.switch.case-inputs+0x2e0>
    ae58:      	b.lo	0xae60 <_stogir.switch.case-inputs+0x2d0>
    ae5c:      	b	0xae74 <_stogir.switch.case-inputs+0x2e4>
    ae60:      	cmp	x16, #0x0
    ae64:      	b.eq	0xae6c <_stogir.switch.case-inputs+0x2dc>
    ae68:      	b	0xae74 <_stogir.switch.case-inputs+0x2e4>
    ae6c:      	b	0xaea4 <_stogir.switch.case-inputs+0x314>
    ae70:      	b	0xae78 <_stogir.switch.case-inputs+0x2e8>
    ae74:      	b	0xb014 <_stogir.switch.case-inputs+0x484>
    ae78:      	add	x0, x20, #0x8
    ae7c:      	add	x16, sp, #0x20
    ae80:      	ldr	x1, [x16, #0x8]
    ae84:      	ldr	x0, [x0, #0x8]
    ae88:      	mov	x2, x0
    ae8c:      	mov	x0, #0x1                ; =1
    ae90:      	b	0xadb4 <_stogir.switch.case-inputs+0x224>
    ae94:      	movz	x7, #0x0, lsl #48
    ae98:      	b	0xac74 <_stogir.switch.case-inputs+0xe4>
    ae9c:      	brk	#0
    aea0:      	b	0xae9c <_stogir.switch.case-inputs+0x30c>
    aea4:      	add	x16, sp, #0x20
    aea8:      	ldr	w20, [x16, #0x8]
    aeac:      	sxtw	x0, w20
    aeb0:      	and	x25, x0, #0xffffffff
    aeb4:      	cmp	x19, #0x6f
    aeb8:      	b.ne	0xaecc <_stogir.switch.case-inputs+0x33c>
    aebc:      	mov	x1, x25
    aec0:      	movz	x0, #0x0, lsl #48
    aec4:      	movz	x2, #0x0, lsl #48
    aec8:      	b	0xae90 <_stogir.switch.case-inputs+0x300>
    aecc:      	add	x16, sp, #0x40
    aed0:      	orr	x26, x16, xzr
    aed4:      	lsr	w23, w23, #0
    aed8:      	lsr	w20, w20, #0
    aedc:      	add	x8, sp, #0x40
    aee0:      	mov	x0, x22
    aee4:      	mov	w1, w23
    aee8:      	mov	w2, w20
    aeec:      	bl	0xaeec <_stogir.switch.case-inputs+0x35c>
		000000000000aeec:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    aef0:      	add	x16, sp, #0x40
    aef4:      	ldr	w0, [x16]
    aef8:      	lsr	x16, x0, #0
    aefc:      	cmp	x16, #0x1
    af00:      	b.eq	0xaf1c <_stogir.switch.case-inputs+0x38c>
    af04:      	b.lo	0xaf0c <_stogir.switch.case-inputs+0x37c>
    af08:      	b	0xaf20 <_stogir.switch.case-inputs+0x390>
    af0c:      	cmp	x16, #0x0
    af10:      	b.eq	0xaf18 <_stogir.switch.case-inputs+0x388>
    af14:      	b	0xaf20 <_stogir.switch.case-inputs+0x390>
    af18:      	b	0xaf40 <_stogir.switch.case-inputs+0x3b0>
    af1c:      	b	0xaf24 <_stogir.switch.case-inputs+0x394>
    af20:      	b	0xb01c <_stogir.switch.case-inputs+0x48c>
    af24:      	add	x0, x26, #0x8
    af28:      	add	x16, sp, #0x40
    af2c:      	ldr	x1, [x16, #0x8]
    af30:      	ldr	x0, [x0, #0x8]
    af34:      	mov	x2, x0
    af38:      	mov	x0, #0x1                ; =1
    af3c:      	b	0xaec8 <_stogir.switch.case-inputs+0x338>
    af40:      	add	x16, sp, #0x40
    af44:      	ldr	x26, [x16, #0x8]
    af48:      	cmp	x19, #0x6d
    af4c:      	b.ne	0xaf6c <_stogir.switch.case-inputs+0x3dc>
    af50:      	sxtw	x23, w23
    af54:      	mov	x0, x23
    af58:      	b	0xaf74 <_stogir.switch.case-inputs+0x3e4>
    af5c:      	mov	x1, x25
    af60:      	movz	x0, #0x0, lsl #48
    af64:      	movz	x2, #0x0, lsl #48
    af68:      	b	0xaf3c <_stogir.switch.case-inputs+0x3ac>
    af6c:      	sxtw	x24, w24
    af70:      	mov	x0, x24
    af74:      	add	x16, sp, #0x60
    af78:      	orr	x19, x16, xzr
    af7c:      	lsr	w20, w20, #0
    af80:      	lsr	w0, w0, #0
    af84:      	add	x8, sp, #0x60
    af88:      	mov	w1, w0
    af8c:      	mov	x0, x22
    af90:      	mov	w2, w20
    af94:      	bl	0xaf94 <_stogir.switch.case-inputs+0x404>
		000000000000af94:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    af98:      	add	x16, sp, #0x60
    af9c:      	ldr	w0, [x16]
    afa0:      	lsr	x16, x0, #0
    afa4:      	cmp	x16, #0x1
    afa8:      	b.eq	0xafc4 <_stogir.switch.case-inputs+0x434>
    afac:      	b.lo	0xafb4 <_stogir.switch.case-inputs+0x424>
    afb0:      	b	0xafc8 <_stogir.switch.case-inputs+0x438>
    afb4:      	cmp	x16, #0x0
    afb8:      	b.eq	0xafc0 <_stogir.switch.case-inputs+0x430>
    afbc:      	b	0xafc8 <_stogir.switch.case-inputs+0x438>
    afc0:      	b	0xafe8 <_stogir.switch.case-inputs+0x458>
    afc4:      	b	0xafcc <_stogir.switch.case-inputs+0x43c>
    afc8:      	b	0xb024 <_stogir.switch.case-inputs+0x494>
    afcc:      	add	x0, x19, #0x8
    afd0:      	add	x16, sp, #0x60
    afd4:      	ldr	x1, [x16, #0x8]
    afd8:      	ldr	x0, [x0, #0x8]
    afdc:      	mov	x2, x0
    afe0:      	mov	x0, #0x1                ; =1
    afe4:      	b	0xaf68 <_stogir.switch.case-inputs+0x3d8>
    afe8:      	add	x16, sp, #0x60
    afec:      	ldr	x0, [x16, #0x8]
    aff0:      	cmp	x26, x0
    aff4:      	b.ls	0xaf5c <_stogir.switch.case-inputs+0x3cc>
    aff8:      	adrp	x16, 0xa000 <_stogir.opcode.control?+0x20>
		000000000000aff8:  ARM64_RELOC_PAGE21	l_stogir.439
    affc:      	ldr	x16, [x16]
		000000000000affc:  ARM64_RELOC_PAGEOFF12	l_stogir.439
    b000:      	orr	x0, x16, xzr
    b004:      	mov	x1, x0
    b008:      	mov	x0, #0x1                ; =1
    b00c:      	mov	x2, #0x1a               ; =26
    b010:      	b	0xaf68 <_stogir.switch.case-inputs+0x3d8>
    b014:      	brk	#0
    b018:      	b	0xb014 <_stogir.switch.case-inputs+0x484>
    b01c:      	brk	#0
    b020:      	b	0xb01c <_stogir.switch.case-inputs+0x48c>
    b024:      	brk	#0
    b028:      	b	0xb024 <_stogir.switch.case-inputs+0x494>
    b02c:      	mov	x21, x8
    b030:      	b	0xad9c <_stogir.switch.case-inputs+0x20c>
    b034:      	mov	x21, x8
    b038:      	b	0xad9c <_stogir.switch.case-inputs+0x20c>
    b03c:      	mov	x21, x8
    b040:      	b	0xad9c <_stogir.switch.case-inputs+0x20c>
    b044:      	mov	x21, x8
    b048:      	b	0xad9c <_stogir.switch.case-inputs+0x20c>
    b04c:      	mov	x21, x8
    b050:      	b	0xad9c <_stogir.switch.case-inputs+0x20c>

000000000000b054 <_stogir.stack.validate-frame-address>:
    b054:      	sxtw	x1, w1
    b058:      	lsl	x2, x1, #2
    b05c:      	cmp	x1, #0x0
    b060:      	cset	w3, gt
    b064:      	movz	x16, #0x0, lsl #48
    b068:      	sub	x4, x16, x1
    b06c:      	sub	x5, x4, #0x1
    b070:      	uxtb	w16, w3
    b074:      	cmp	w16, wzr
    b078:      	b.eq	0xb0b8 <_stogir.stack.validate-frame-address+0x64>
    b07c:      	ldr	x4, [x0, #0x8]
    b080:      	cmp	x1, x4
    b084:      	b.ge	0xb10c <_stogir.stack.validate-frame-address+0xb8>
    b088:      	add	x4, x0, #0x78
    b08c:      	ldr	x4, [x4, #0x8]
    b090:      	cmp	x1, x4
    b094:      	b.ge	0xb224 <_stogir.stack.validate-frame-address+0x1d0>
    b098:      	ldr	x4, [x0, #0x78]
    b09c:      	add	x4, x2, x4
    b0a0:      	ldr	w4, [x4]
    b0a4:      	sxtw	x4, w4
    b0a8:      	cmp	x4, #0x0
    b0ac:      	cset	w4, ge
    b0b0:      	ubfx	x4, x4, #0, #8
    b0b4:      	b	0xb228 <_stogir.stack.validate-frame-address+0x1d4>
    b0b8:      	cmp	x1, #0x0
    b0bc:      	b.ge	0xb114 <_stogir.stack.validate-frame-address+0xc0>
    b0c0:      	add	x6, x0, #0x28
    b0c4:      	add	x7, x0, #0x50
    b0c8:      	ldr	x6, [x6, #0x8]
    b0cc:      	ldr	x7, [x7, #0x8]
    b0d0:      	cmp	x6, x7
    b0d4:      	b.ne	0xb104 <_stogir.stack.validate-frame-address+0xb0>
    b0d8:      	cmp	x4, x6
    b0dc:      	b.gt	0xb22c <_stogir.stack.validate-frame-address+0x1d8>
    b0e0:      	lsl	x4, x5, #2
    b0e4:      	ldr	x6, [x0, #0x50]
    b0e8:      	add	x4, x4, x6
    b0ec:      	ldr	w4, [x4]
    b0f0:      	sxtw	x4, w4
    b0f4:      	cmp	x4, #0x0
    b0f8:      	cset	w4, gt
    b0fc:      	ubfx	x4, x4, #0, #8
    b100:      	b	0xb230 <_stogir.stack.validate-frame-address+0x1dc>
    b104:      	movz	x4, #0x0, lsl #48
    b108:      	b	0xb118 <_stogir.stack.validate-frame-address+0xc4>
    b10c:      	movz	x4, #0x0, lsl #48
    b110:      	b	0xb118 <_stogir.stack.validate-frame-address+0xc4>
    b114:      	movz	x4, #0x0, lsl #48
    b118:      	cmp	x4, #0x0
    b11c:      	b.eq	0xb15c <_stogir.stack.validate-frame-address+0x108>
    b120:      	uxtb	w16, w3
    b124:      	cmp	w16, wzr
    b128:      	b.eq	0xb140 <_stogir.stack.validate-frame-address+0xec>
    b12c:      	lsl	x3, x1, #4
    b130:      	ldr	x4, [x0]
    b134:      	add	x3, x3, x4
    b138:      	ldr	x3, [x3]
    b13c:      	b	0xb150 <_stogir.stack.validate-frame-address+0xfc>
    b140:      	lsl	x3, x5, #4
    b144:      	ldr	x4, [x0, #0x28]
    b148:      	add	x3, x3, x4
    b14c:      	ldr	x3, [x3]
    b150:      	mov	x4, x3
    b154:      	mov	x3, #0x1                ; =1
    b158:      	b	0xb164 <_stogir.stack.validate-frame-address+0x110>
    b15c:      	movz	x3, #0x0, lsl #48
    b160:      	movz	x4, #0x0, lsl #48
    b164:      	lsr	w3, w3, #0
    b168:      	lsr	x16, x3, #0
    b16c:      	cmp	x16, #0x1
    b170:      	b.eq	0xb18c <_stogir.stack.validate-frame-address+0x138>
    b174:      	b.lo	0xb17c <_stogir.stack.validate-frame-address+0x128>
    b178:      	b	0xb190 <_stogir.stack.validate-frame-address+0x13c>
    b17c:      	cmp	x16, #0x0
    b180:      	b.eq	0xb188 <_stogir.stack.validate-frame-address+0x134>
    b184:      	b	0xb190 <_stogir.stack.validate-frame-address+0x13c>
    b188:      	b	0xb194 <_stogir.stack.validate-frame-address+0x140>
    b18c:      	b	0xb1d8 <_stogir.stack.validate-frame-address+0x184>
    b190:      	b	0xb234 <_stogir.stack.validate-frame-address+0x1e0>
    b194:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b194:  ARM64_RELOC_PAGE21	l_stogir.440
    b198:      	ldr	x16, [x16]
		000000000000b198:  ARM64_RELOC_PAGEOFF12	l_stogir.440
    b19c:      	orr	x0, x16, xzr
    b1a0:      	mov	x1, x0
    b1a4:      	mov	x0, #0x1                ; =1
    b1a8:      	mov	x2, #0x21               ; =33
    b1ac:      	b	0xb1c8 <_stogir.stack.validate-frame-address+0x174>
    b1b0:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b1b0:  ARM64_RELOC_PAGE21	l_stogir.441
    b1b4:      	ldr	x16, [x16]
		000000000000b1b4:  ARM64_RELOC_PAGEOFF12	l_stogir.441
    b1b8:      	orr	x0, x16, xzr
    b1bc:      	mov	x1, x0
    b1c0:      	mov	x0, #0x1                ; =1
    b1c4:      	mov	x2, #0x1e               ; =30
    b1c8:      	str	x0, [x8]
    b1cc:      	str	x1, [x8, #0x8]
    b1d0:      	str	x2, [x8, #0x10]
    b1d4:      	ret
    b1d8:      	cmp	x1, #0x0
    b1dc:      	b.le	0xb1b0 <_stogir.stack.validate-frame-address+0x15c>
    b1e0:      	uxtb	w1, w4
    b1e4:      	cmp	x1, #0x42
    b1e8:      	b.ne	0xb1b0 <_stogir.stack.validate-frame-address+0x15c>
    b1ec:      	lsr	w4, w4, #0
    b1f0:      	ubfx	x1, x4, #8, #8
    b1f4:      	cmp	x1, #0x6
    b1f8:      	b.ne	0xb1b0 <_stogir.stack.validate-frame-address+0x15c>
    b1fc:      	ldr	x0, [x0, #0x78]
    b200:      	add	x0, x2, x0
    b204:      	ldr	w0, [x0]
    b208:      	sxtw	x0, w0
    b20c:      	cmp	x0, #0x0
    b210:      	b.ne	0xb1b0 <_stogir.stack.validate-frame-address+0x15c>
    b214:      	movz	x0, #0x0, lsl #48
    b218:      	mov	x1, #0x8                ; =8
    b21c:      	movz	x2, #0x0, lsl #48
    b220:      	b	0xb1c8 <_stogir.stack.validate-frame-address+0x174>
    b224:      	movz	x4, #0x0, lsl #48
    b228:      	b	0xb110 <_stogir.stack.validate-frame-address+0xbc>
    b22c:      	movz	x4, #0x0, lsl #48
    b230:      	b	0xb108 <_stogir.stack.validate-frame-address+0xb4>
    b234:      	brk	#0
    b238:      	b	0xb234 <_stogir.stack.validate-frame-address+0x1e0>

000000000000b23c <_stogir.stack.validate-scope-inputs>:
    b23c:      	sxtw	x1, w1
    b240:      	cmp	x1, #0x53
    b244:      	cset	w5, eq
    b248:      	uxtb	w16, w5
    b24c:      	cmp	w16, wzr
    b250:      	b.ne	0xb284 <_stogir.stack.validate-scope-inputs+0x48>
    b254:      	cmp	x1, #0x54
    b258:      	b.eq	0xb284 <_stogir.stack.validate-scope-inputs+0x48>
    b25c:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b25c:  ARM64_RELOC_PAGE21	l_stogir.442
    b260:      	ldr	x16, [x16]
		000000000000b260:  ARM64_RELOC_PAGEOFF12	l_stogir.442
    b264:      	orr	x0, x16, xzr
    b268:      	mov	x1, x0
    b26c:      	mov	x0, #0x1                ; =1
    b270:      	mov	x2, #0x22               ; =34
    b274:      	str	x0, [x8]
    b278:      	str	x1, [x8, #0x8]
    b27c:      	str	x2, [x8, #0x10]
    b280:      	ret
    b284:      	uxtb	w16, w5
    b288:      	cmp	w16, wzr
    b28c:      	mov	x16, #0x6               ; =6
    b290:      	movz	x17, #0x0, lsl #48
    b294:      	csel	x1, x16, x17, ne
    b298:      	sxtw	x2, w2
    b29c:      	lsr	w1, w1, #0
    b2a0:      	sxtw	x1, w1
    b2a4:      	cmp	x2, x1
    b2a8:      	b.ne	0xb25c <_stogir.stack.validate-scope-inputs+0x20>
    b2ac:      	sxtw	x3, w3
    b2b0:      	cmp	x3, #0x0
    b2b4:      	cset	w1, gt
    b2b8:      	movz	x16, #0x0, lsl #48
    b2bc:      	sub	x2, x16, x3
    b2c0:      	sub	x6, x2, #0x1
    b2c4:      	uxtb	w16, w1
    b2c8:      	cmp	w16, wzr
    b2cc:      	b.eq	0xb3b4 <_stogir.stack.validate-scope-inputs+0x178>
    b2d0:      	ldr	x2, [x0, #0x8]
    b2d4:      	cmp	x3, x2
    b2d8:      	b.ge	0xb3ac <_stogir.stack.validate-scope-inputs+0x170>
    b2dc:      	add	x2, x0, #0x78
    b2e0:      	ldr	x2, [x2, #0x8]
    b2e4:      	cmp	x3, x2
    b2e8:      	b.ge	0xb45c <_stogir.stack.validate-scope-inputs+0x220>
    b2ec:      	lsl	x2, x3, #2
    b2f0:      	ldr	x7, [x0, #0x78]
    b2f4:      	add	x2, x2, x7
    b2f8:      	ldr	w2, [x2]
    b2fc:      	sxtw	x2, w2
    b300:      	cmp	x2, #0x0
    b304:      	cset	w2, ge
    b308:      	ubfx	x2, x2, #0, #8
    b30c:      	b	0xb460 <_stogir.stack.validate-scope-inputs+0x224>
    b310:      	movz	x1, #0x0, lsl #48
    b314:      	movz	x2, #0x0, lsl #48
    b318:      	lsr	w1, w1, #0
    b31c:      	lsr	x16, x1, #0
    b320:      	cmp	x16, #0x1
    b324:      	b.eq	0xb340 <_stogir.stack.validate-scope-inputs+0x104>
    b328:      	b.lo	0xb330 <_stogir.stack.validate-scope-inputs+0xf4>
    b32c:      	b	0xb344 <_stogir.stack.validate-scope-inputs+0x108>
    b330:      	cmp	x16, #0x0
    b334:      	b.eq	0xb33c <_stogir.stack.validate-scope-inputs+0x100>
    b338:      	b	0xb344 <_stogir.stack.validate-scope-inputs+0x108>
    b33c:      	b	0xb348 <_stogir.stack.validate-scope-inputs+0x10c>
    b340:      	b	0xb400 <_stogir.stack.validate-scope-inputs+0x1c4>
    b344:      	b	0xb630 <_stogir.stack.validate-scope-inputs+0x3f4>
    b348:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b348:  ARM64_RELOC_PAGE21	l_stogir.443
    b34c:      	ldr	x16, [x16]
		000000000000b34c:  ARM64_RELOC_PAGEOFF12	l_stogir.443
    b350:      	orr	x0, x16, xzr
    b354:      	mov	x1, x0
    b358:      	mov	x0, #0x1                ; =1
    b35c:      	mov	x2, #0x1b               ; =27
    b360:      	b	0xb274 <_stogir.stack.validate-scope-inputs+0x38>
    b364:      	lsl	x1, x6, #4
    b368:      	ldr	x2, [x0, #0x28]
    b36c:      	add	x1, x1, x2
    b370:      	ldr	x1, [x1]
    b374:      	mov	x2, x1
    b378:      	mov	x1, #0x1                ; =1
    b37c:      	b	0xb318 <_stogir.stack.validate-scope-inputs+0xdc>
    b380:      	movz	x2, #0x0, lsl #48
    b384:      	cmp	x2, #0x0
    b388:      	b.eq	0xb310 <_stogir.stack.validate-scope-inputs+0xd4>
    b38c:      	uxtb	w16, w1
    b390:      	cmp	w16, wzr
    b394:      	b.eq	0xb364 <_stogir.stack.validate-scope-inputs+0x128>
    b398:      	lsl	x1, x3, #4
    b39c:      	ldr	x2, [x0]
    b3a0:      	add	x1, x1, x2
    b3a4:      	ldr	x1, [x1]
    b3a8:      	b	0xb374 <_stogir.stack.validate-scope-inputs+0x138>
    b3ac:      	movz	x2, #0x0, lsl #48
    b3b0:      	b	0xb384 <_stogir.stack.validate-scope-inputs+0x148>
    b3b4:      	cmp	x3, #0x0
    b3b8:      	b.ge	0xb380 <_stogir.stack.validate-scope-inputs+0x144>
    b3bc:      	add	x7, x0, #0x28
    b3c0:      	add	x9, x0, #0x50
    b3c4:      	ldr	x7, [x7, #0x8]
    b3c8:      	ldr	x9, [x9, #0x8]
    b3cc:      	cmp	x7, x9
    b3d0:      	b.ne	0xb454 <_stogir.stack.validate-scope-inputs+0x218>
    b3d4:      	cmp	x2, x7
    b3d8:      	b.gt	0xb464 <_stogir.stack.validate-scope-inputs+0x228>
    b3dc:      	lsl	x2, x6, #2
    b3e0:      	ldr	x7, [x0, #0x50]
    b3e4:      	add	x2, x2, x7
    b3e8:      	ldr	w2, [x2]
    b3ec:      	sxtw	x2, w2
    b3f0:      	cmp	x2, #0x0
    b3f4:      	cset	w2, gt
    b3f8:      	ubfx	x2, x2, #0, #8
    b3fc:      	b	0xb468 <_stogir.stack.validate-scope-inputs+0x22c>
    b400:      	cmp	x3, #0x0
    b404:      	b.le	0xb438 <_stogir.stack.validate-scope-inputs+0x1fc>
    b408:      	uxtb	w2, w2
    b40c:      	cmp	x2, #0x83
    b410:      	cset	w1, lt
    b414:      	uxtb	w16, w1
    b418:      	cmp	w16, wzr
    b41c:      	b.eq	0xb46c <_stogir.stack.validate-scope-inputs+0x230>
    b420:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b420:  ARM64_RELOC_PAGE21	l_stogir.444
    b424:      	ldr	x16, [x16]
		000000000000b424:  ARM64_RELOC_PAGEOFF12	l_stogir.444
    b428:      	orr	x3, x16, xzr
    b42c:      	add	x3, x2, x3
    b430:      	ldrb	w3, [x3]
    b434:      	b	0xb470 <_stogir.stack.validate-scope-inputs+0x234>
    b438:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b438:  ARM64_RELOC_PAGE21	l_stogir.445
    b43c:      	ldr	x16, [x16]
		000000000000b43c:  ARM64_RELOC_PAGEOFF12	l_stogir.445
    b440:      	orr	x0, x16, xzr
    b444:      	mov	x1, x0
    b448:      	mov	x0, #0x1                ; =1
    b44c:      	mov	x2, #0x1b               ; =27
    b450:      	b	0xb360 <_stogir.stack.validate-scope-inputs+0x124>
    b454:      	movz	x2, #0x0, lsl #48
    b458:      	b	0xb384 <_stogir.stack.validate-scope-inputs+0x148>
    b45c:      	movz	x2, #0x0, lsl #48
    b460:      	b	0xb3b0 <_stogir.stack.validate-scope-inputs+0x174>
    b464:      	movz	x2, #0x0, lsl #48
    b468:      	b	0xb458 <_stogir.stack.validate-scope-inputs+0x21c>
    b46c:      	movz	x3, #0x0, lsl #48
    b470:      	uxtb	w3, w3
    b474:      	and	x3, x3, #0x1
    b478:      	uxtb	w3, w3
    b47c:      	cmp	x3, #0x0
    b480:      	b.eq	0xb438 <_stogir.stack.validate-scope-inputs+0x1fc>
    b484:      	uxtb	w16, w1
    b488:      	cmp	w16, wzr
    b48c:      	b.eq	0xb4a8 <_stogir.stack.validate-scope-inputs+0x26c>
    b490:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b490:  ARM64_RELOC_PAGE21	l_stogir.444
    b494:      	ldr	x16, [x16]
		000000000000b494:  ARM64_RELOC_PAGEOFF12	l_stogir.444
    b498:      	orr	x1, x16, xzr
    b49c:      	add	x1, x2, x1
    b4a0:      	ldrb	w1, [x1]
    b4a4:      	b	0xb4ac <_stogir.stack.validate-scope-inputs+0x270>
    b4a8:      	movz	x1, #0x0, lsl #48
    b4ac:      	uxtb	w1, w1
    b4b0:      	and	x1, x1, #0x4
    b4b4:      	uxtb	w1, w1
    b4b8:      	cmp	x1, #0x0
    b4bc:      	b.ne	0xb438 <_stogir.stack.validate-scope-inputs+0x1fc>
    b4c0:      	uxtb	w16, w5
    b4c4:      	cmp	w16, wzr
    b4c8:      	b.eq	0xb4dc <_stogir.stack.validate-scope-inputs+0x2a0>
    b4cc:      	movz	x0, #0x0, lsl #48
    b4d0:      	mov	x1, #0x8                ; =8
    b4d4:      	movz	x2, #0x0, lsl #48
    b4d8:      	b	0xb450 <_stogir.stack.validate-scope-inputs+0x214>
    b4dc:      	sxtw	x4, w4
    b4e0:      	cmp	x4, #0x0
    b4e4:      	cset	w1, gt
    b4e8:      	movz	x16, #0x0, lsl #48
    b4ec:      	sub	x2, x16, x4
    b4f0:      	sub	x3, x2, #0x1
    b4f4:      	uxtb	w16, w1
    b4f8:      	cmp	w16, wzr
    b4fc:      	b.eq	0xb5e4 <_stogir.stack.validate-scope-inputs+0x3a8>
    b500:      	ldr	x2, [x0, #0x8]
    b504:      	cmp	x4, x2
    b508:      	b.ge	0xb5dc <_stogir.stack.validate-scope-inputs+0x3a0>
    b50c:      	add	x2, x0, #0x78
    b510:      	ldr	x2, [x2, #0x8]
    b514:      	cmp	x4, x2
    b518:      	b.ge	0xb688 <_stogir.stack.validate-scope-inputs+0x44c>
    b51c:      	lsl	x2, x4, #2
    b520:      	ldr	x5, [x0, #0x78]
    b524:      	add	x2, x2, x5
    b528:      	ldr	w2, [x2]
    b52c:      	sxtw	x2, w2
    b530:      	cmp	x2, #0x0
    b534:      	cset	w2, ge
    b538:      	ubfx	x2, x2, #0, #8
    b53c:      	b	0xb68c <_stogir.stack.validate-scope-inputs+0x450>
    b540:      	movz	x0, #0x0, lsl #48
    b544:      	movz	x1, #0x0, lsl #48
    b548:      	lsr	w0, w0, #0
    b54c:      	lsr	x16, x0, #0
    b550:      	cmp	x16, #0x1
    b554:      	b.eq	0xb570 <_stogir.stack.validate-scope-inputs+0x334>
    b558:      	b.lo	0xb560 <_stogir.stack.validate-scope-inputs+0x324>
    b55c:      	b	0xb574 <_stogir.stack.validate-scope-inputs+0x338>
    b560:      	cmp	x16, #0x0
    b564:      	b.eq	0xb56c <_stogir.stack.validate-scope-inputs+0x330>
    b568:      	b	0xb574 <_stogir.stack.validate-scope-inputs+0x338>
    b56c:      	b	0xb578 <_stogir.stack.validate-scope-inputs+0x33c>
    b570:      	b	0xb638 <_stogir.stack.validate-scope-inputs+0x3fc>
    b574:      	b	0xb698 <_stogir.stack.validate-scope-inputs+0x45c>
    b578:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b578:  ARM64_RELOC_PAGE21	l_stogir.446
    b57c:      	ldr	x16, [x16]
		000000000000b57c:  ARM64_RELOC_PAGEOFF12	l_stogir.446
    b580:      	orr	x0, x16, xzr
    b584:      	mov	x1, x0
    b588:      	mov	x0, #0x1                ; =1
    b58c:      	mov	x2, #0x1b               ; =27
    b590:      	b	0xb4d8 <_stogir.stack.validate-scope-inputs+0x29c>
    b594:      	lsl	x1, x3, #4
    b598:      	ldr	x0, [x0, #0x28]
    b59c:      	add	x0, x1, x0
    b5a0:      	ldr	x0, [x0]
    b5a4:      	mov	x1, x0
    b5a8:      	mov	x0, #0x1                ; =1
    b5ac:      	b	0xb548 <_stogir.stack.validate-scope-inputs+0x30c>
    b5b0:      	movz	x2, #0x0, lsl #48
    b5b4:      	cmp	x2, #0x0
    b5b8:      	b.eq	0xb540 <_stogir.stack.validate-scope-inputs+0x304>
    b5bc:      	uxtb	w16, w1
    b5c0:      	cmp	w16, wzr
    b5c4:      	b.eq	0xb594 <_stogir.stack.validate-scope-inputs+0x358>
    b5c8:      	lsl	x1, x4, #4
    b5cc:      	ldr	x0, [x0]
    b5d0:      	add	x0, x1, x0
    b5d4:      	ldr	x0, [x0]
    b5d8:      	b	0xb5a4 <_stogir.stack.validate-scope-inputs+0x368>
    b5dc:      	movz	x2, #0x0, lsl #48
    b5e0:      	b	0xb5b4 <_stogir.stack.validate-scope-inputs+0x378>
    b5e4:      	cmp	x4, #0x0
    b5e8:      	b.ge	0xb5b0 <_stogir.stack.validate-scope-inputs+0x374>
    b5ec:      	add	x5, x0, #0x28
    b5f0:      	add	x6, x0, #0x50
    b5f4:      	ldr	x5, [x5, #0x8]
    b5f8:      	ldr	x6, [x6, #0x8]
    b5fc:      	cmp	x5, x6
    b600:      	b.ne	0xb680 <_stogir.stack.validate-scope-inputs+0x444>
    b604:      	cmp	x2, x5
    b608:      	b.gt	0xb690 <_stogir.stack.validate-scope-inputs+0x454>
    b60c:      	lsl	x2, x3, #2
    b610:      	ldr	x5, [x0, #0x50]
    b614:      	add	x2, x2, x5
    b618:      	ldr	w2, [x2]
    b61c:      	sxtw	x2, w2
    b620:      	cmp	x2, #0x0
    b624:      	cset	w2, gt
    b628:      	ubfx	x2, x2, #0, #8
    b62c:      	b	0xb694 <_stogir.stack.validate-scope-inputs+0x458>
    b630:      	brk	#0
    b634:      	b	0xb630 <_stogir.stack.validate-scope-inputs+0x3f4>
    b638:      	lsr	w0, w1, #0
    b63c:      	ubfx	x0, x0, #8, #8
    b640:      	cmp	x0, #0x6
    b644:      	b.ne	0xb664 <_stogir.stack.validate-scope-inputs+0x428>
    b648:      	uxtb	w1, w1
    b64c:      	cmp	x1, #0x48
    b650:      	b.eq	0xb664 <_stogir.stack.validate-scope-inputs+0x428>
    b654:      	movz	x0, #0x0, lsl #48
    b658:      	mov	x1, #0x8                ; =8
    b65c:      	movz	x2, #0x0, lsl #48
    b660:      	b	0xb67c <_stogir.stack.validate-scope-inputs+0x440>
    b664:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b664:  ARM64_RELOC_PAGE21	l_stogir.447
    b668:      	ldr	x16, [x16]
		000000000000b668:  ARM64_RELOC_PAGEOFF12	l_stogir.447
    b66c:      	orr	x0, x16, xzr
    b670:      	mov	x1, x0
    b674:      	mov	x0, #0x1                ; =1
    b678:      	mov	x2, #0x29               ; =41
    b67c:      	b	0xb590 <_stogir.stack.validate-scope-inputs+0x354>
    b680:      	movz	x2, #0x0, lsl #48
    b684:      	b	0xb5b4 <_stogir.stack.validate-scope-inputs+0x378>
    b688:      	movz	x2, #0x0, lsl #48
    b68c:      	b	0xb5e0 <_stogir.stack.validate-scope-inputs+0x3a4>
    b690:      	movz	x2, #0x0, lsl #48
    b694:      	b	0xb684 <_stogir.stack.validate-scope-inputs+0x448>
    b698:      	brk	#0
    b69c:      	b	0xb698 <_stogir.stack.validate-scope-inputs+0x45c>

000000000000b6a0 <_stogir.stack.validate-inputs>:
    b6a0:      	sub	sp, sp, #0x110
    b6a4:      	str	x29, [sp]
    b6a8:      	str	x30, [sp, #0x8]
    b6ac:      	mov	x29, sp
    b6b0:      	str	x19, [sp, #0xb8]
    b6b4:      	str	x20, [sp, #0xc0]
    b6b8:      	str	x21, [sp, #0xc8]
    b6bc:      	str	x22, [sp, #0xd0]
    b6c0:      	str	x23, [sp, #0xd8]
    b6c4:      	str	x24, [sp, #0xe0]
    b6c8:      	str	x25, [sp, #0xe8]
    b6cc:      	str	x26, [sp, #0xf0]
    b6d0:      	str	x27, [sp, #0xf8]
    b6d4:      	str	x28, [sp, #0x100]
    b6d8:      	sxtw	x1, w1
    b6dc:      	cmp	x1, #0x51
    b6e0:      	cset	w19, eq
    b6e4:      	uxtb	w16, w19
    b6e8:      	cmp	w16, wzr
    b6ec:      	b.ne	0xb75c <_stogir.stack.validate-inputs+0xbc>
    b6f0:      	cmp	x1, #0x52
    b6f4:      	b.eq	0xb75c <_stogir.stack.validate-inputs+0xbc>
    b6f8:      	str	x8, [sp, #0x90]
    b6fc:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b6fc:  ARM64_RELOC_PAGE21	l_stogir.448
    b700:      	ldr	x16, [x16]
		000000000000b700:  ARM64_RELOC_PAGEOFF12	l_stogir.448
    b704:      	orr	x0, x16, xzr
    b708:      	mov	x1, x0
    b70c:      	mov	x0, #0x1                ; =1
    b710:      	mov	x2, #0x29               ; =41
    b714:      	ldr	x3, [sp, #0x90]
    b718:      	str	x0, [x3]
    b71c:      	str	x1, [x3, #0x8]
    b720:      	str	x2, [x3, #0x10]
    b724:      	ldr	x19, [sp, #0xb8]
    b728:      	ldr	x20, [sp, #0xc0]
    b72c:      	ldr	x21, [sp, #0xc8]
    b730:      	ldr	x22, [sp, #0xd0]
    b734:      	ldr	x23, [sp, #0xd8]
    b738:      	ldr	x24, [sp, #0xe0]
    b73c:      	ldr	x25, [sp, #0xe8]
    b740:      	ldr	x26, [sp, #0xf0]
    b744:      	ldr	x27, [sp, #0xf8]
    b748:      	ldr	x28, [sp, #0x100]
    b74c:      	ldr	x29, [sp]
    b750:      	ldr	x30, [sp, #0x8]
    b754:      	add	sp, sp, #0x110
    b758:      	ret
    b75c:      	uxtb	w16, w19
    b760:      	cmp	w16, wzr
    b764:      	mov	x16, #0x6               ; =6
    b768:      	movz	x17, #0x0, lsl #48
    b76c:      	csel	x1, x16, x17, ne
    b770:      	sxtw	x2, w2
    b774:      	lsr	w1, w1, #0
    b778:      	sxtw	x1, w1
    b77c:      	cmp	x2, x1
    b780:      	b.ne	0xbce0 <_stogir.stack.validate-inputs+0x640>
    b784:      	sxtw	x20, w5
    b788:      	uxtb	w16, w19
    b78c:      	cmp	w16, wzr
    b790:      	b.eq	0xb7bc <_stogir.stack.validate-inputs+0x11c>
    b794:      	cmp	x20, #0x0
    b798:      	b.eq	0xb7bc <_stogir.stack.validate-inputs+0x11c>
    b79c:      	cmp	x20, #0x0
    b7a0:      	b.le	0xb894 <_stogir.stack.validate-inputs+0x1f4>
    b7a4:      	sub	x1, x20, #0x1
    b7a8:      	and	x1, x1, x20
    b7ac:      	cmp	x1, #0x0
    b7b0:      	cset	w1, eq
    b7b4:      	ubfx	x1, x1, #0, #8
    b7b8:      	b	0xb898 <_stogir.stack.validate-inputs+0x1f8>
    b7bc:      	lsr	w3, w3, #0
    b7c0:      	mov	w1, w3
    b7c4:      	mov	x21, x8
    b7c8:      	add	x8, sp, #0x10
    b7cc:      	mov	x22, x0
    b7d0:      	mov	w23, w3
    b7d4:      	mov	w24, w4
    b7d8:      	bl	0xb7d8 <_stogir.stack.validate-inputs+0x138>
		000000000000b7d8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b7dc:      	add	x16, sp, #0x10
    b7e0:      	ldr	w0, [x16]
    b7e4:      	lsr	x16, x0, #0
    b7e8:      	cmp	x16, #0x1
    b7ec:      	b.eq	0xb808 <_stogir.stack.validate-inputs+0x168>
    b7f0:      	b.lo	0xb7f8 <_stogir.stack.validate-inputs+0x158>
    b7f4:      	b	0xb80c <_stogir.stack.validate-inputs+0x16c>
    b7f8:      	cmp	x16, #0x0
    b7fc:      	b.eq	0xb804 <_stogir.stack.validate-inputs+0x164>
    b800:      	b	0xb80c <_stogir.stack.validate-inputs+0x16c>
    b804:      	b	0xb810 <_stogir.stack.validate-inputs+0x170>
    b808:      	b	0xb830 <_stogir.stack.validate-inputs+0x190>
    b80c:      	b	0xba58 <_stogir.stack.validate-inputs+0x3b8>
    b810:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b810:  ARM64_RELOC_PAGE21	l_stogir.449
    b814:      	ldr	x16, [x16]
		000000000000b814:  ARM64_RELOC_PAGEOFF12	l_stogir.449
    b818:      	orr	x0, x16, xzr
    b81c:      	str	x21, [sp, #0x90]
    b820:      	mov	x1, x0
    b824:      	mov	x0, #0x1                ; =1
    b828:      	mov	x2, #0x1f               ; =31
    b82c:      	b	0xb714 <_stogir.stack.validate-inputs+0x74>
    b830:      	sxtw	x23, w23
    b834:      	add	x16, sp, #0x10
    b838:      	ldr	x0, [x16, #0x8]
    b83c:      	cmp	x23, #0x0
    b840:      	b.gt	0xb864 <_stogir.stack.validate-inputs+0x1c4>
    b844:      	str	x21, [sp, #0x90]
    b848:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b848:  ARM64_RELOC_PAGE21	l_stogir.450
    b84c:      	ldr	x16, [x16]
		000000000000b84c:  ARM64_RELOC_PAGEOFF12	l_stogir.450
    b850:      	orr	x0, x16, xzr
    b854:      	mov	x1, x0
    b858:      	mov	x0, #0x1                ; =1
    b85c:      	mov	x2, #0x1f               ; =31
    b860:      	b	0xb82c <_stogir.stack.validate-inputs+0x18c>
    b864:      	uxtb	w0, w0
    b868:      	cmp	x0, #0x83
    b86c:      	cset	w1, lt
    b870:      	uxtb	w16, w1
    b874:      	cmp	w16, wzr
    b878:      	b.eq	0xb8a8 <_stogir.stack.validate-inputs+0x208>
    b87c:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b87c:  ARM64_RELOC_PAGE21	l_stogir.451
    b880:      	ldr	x16, [x16]
		000000000000b880:  ARM64_RELOC_PAGEOFF12	l_stogir.451
    b884:      	orr	x2, x16, xzr
    b888:      	add	x2, x0, x2
    b88c:      	ldrb	w2, [x2]
    b890:      	b	0xb8ac <_stogir.stack.validate-inputs+0x20c>
    b894:      	movz	x1, #0x0, lsl #48
    b898:      	cmp	x1, #0x0
    b89c:      	b.ne	0xb7bc <_stogir.stack.validate-inputs+0x11c>
    b8a0:      	str	x8, [sp, #0x90]
    b8a4:      	b	0xb6fc <_stogir.stack.validate-inputs+0x5c>
    b8a8:      	movz	x2, #0x0, lsl #48
    b8ac:      	uxtb	w2, w2
    b8b0:      	and	x2, x2, #0x1
    b8b4:      	uxtb	w2, w2
    b8b8:      	cmp	x2, #0x0
    b8bc:      	b.eq	0xbce8 <_stogir.stack.validate-inputs+0x648>
    b8c0:      	uxtb	w16, w1
    b8c4:      	cmp	w16, wzr
    b8c8:      	b.eq	0xb8e4 <_stogir.stack.validate-inputs+0x244>
    b8cc:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b8cc:  ARM64_RELOC_PAGE21	l_stogir.451
    b8d0:      	ldr	x16, [x16]
		000000000000b8d0:  ARM64_RELOC_PAGEOFF12	l_stogir.451
    b8d4:      	orr	x1, x16, xzr
    b8d8:      	add	x0, x0, x1
    b8dc:      	ldrb	w0, [x0]
    b8e0:      	b	0xb8e8 <_stogir.stack.validate-inputs+0x248>
    b8e4:      	movz	x0, #0x0, lsl #48
    b8e8:      	uxtb	w0, w0
    b8ec:      	and	x0, x0, #0x4
    b8f0:      	uxtb	w0, w0
    b8f4:      	cmp	x0, #0x0
    b8f8:      	b.ne	0xbcf0 <_stogir.stack.validate-inputs+0x650>
    b8fc:      	lsr	w24, w24, #0
    b900:      	add	x8, sp, #0x40
    b904:      	mov	x0, x22
    b908:      	mov	w1, w24
    b90c:      	bl	0xb90c <_stogir.stack.validate-inputs+0x26c>
		000000000000b90c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b910:      	add	x16, sp, #0x40
    b914:      	ldr	w0, [x16]
    b918:      	lsr	x16, x0, #0
    b91c:      	cmp	x16, #0x1
    b920:      	b.eq	0xb93c <_stogir.stack.validate-inputs+0x29c>
    b924:      	b.lo	0xb92c <_stogir.stack.validate-inputs+0x28c>
    b928:      	b	0xb940 <_stogir.stack.validate-inputs+0x2a0>
    b92c:      	cmp	x16, #0x0
    b930:      	b.eq	0xb938 <_stogir.stack.validate-inputs+0x298>
    b934:      	b	0xb940 <_stogir.stack.validate-inputs+0x2a0>
    b938:      	b	0xb944 <_stogir.stack.validate-inputs+0x2a4>
    b93c:      	b	0xb964 <_stogir.stack.validate-inputs+0x2c4>
    b940:      	b	0xbbe8 <_stogir.stack.validate-inputs+0x548>
    b944:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000b944:  ARM64_RELOC_PAGE21	l_stogir.452
    b948:      	ldr	x16, [x16]
		000000000000b948:  ARM64_RELOC_PAGEOFF12	l_stogir.452
    b94c:      	orr	x0, x16, xzr
    b950:      	str	x21, [sp, #0x90]
    b954:      	mov	x1, x0
    b958:      	mov	x0, #0x1                ; =1
    b95c:      	mov	x2, #0x18               ; =24
    b960:      	b	0xb860 <_stogir.stack.validate-inputs+0x1c0>
    b964:      	add	x16, sp, #0x40
    b968:      	ldr	x0, [x16, #0x8]
    b96c:      	lsr	w1, w0, #0
    b970:      	ubfx	x1, x1, #8, #8
    b974:      	cmp	x1, #0x1
    b978:      	b.lt	0xbcf8 <_stogir.stack.validate-inputs+0x658>
    b97c:      	cmp	x1, #0xb
    b980:      	b.gt	0xbd00 <_stogir.stack.validate-inputs+0x660>
    b984:      	uxtb	w0, w0
    b988:      	cmp	x0, #0x48
    b98c:      	b.eq	0xbd08 <_stogir.stack.validate-inputs+0x668>
    b990:      	sxtw	x0, w24
    b994:      	cmp	x1, #0x0
    b998:      	cset	w23, eq
    b99c:      	cmp	x1, #0x1
    b9a0:      	cset	w25, eq
    b9a4:      	cmp	x1, #0x2
    b9a8:      	cset	w26, eq
    b9ac:      	cmp	x1, #0x7
    b9b0:      	cset	w27, eq
    b9b4:      	cmp	x1, #0x8
    b9b8:      	cset	w28, eq
    b9bc:      	cmp	x1, #0x3
    b9c0:      	cset	w2, eq
    b9c4:      	cmp	x1, #0x9
    b9c8:      	cset	w3, eq
    b9cc:      	cmp	x1, #0x4
    b9d0:      	cset	w4, eq
    b9d4:      	cmp	x1, #0xa
    b9d8:      	cset	w5, eq
    b9dc:      	cmp	x1, #0xd
    b9e0:      	cset	w6, eq
    b9e4:      	cmp	x1, #0x5
    b9e8:      	cset	w7, eq
    b9ec:      	cmp	x1, #0xb
    b9f0:      	cset	w8, eq
    b9f4:      	cmp	x1, #0xc
    b9f8:      	cset	w9, eq
    b9fc:      	cmp	x1, #0x6
    ba00:      	cset	w1, eq
    ba04:      	uxtb	w16, w1
    ba08:      	cmp	w16, wzr
    ba0c:      	mov	x16, #0x8               ; =8
    ba10:      	movn	x17, #0x0, lsl #48
    ba14:      	csel	x1, x16, x17, ne
    ba18:      	cmp	x0, #0x0
    ba1c:      	b.ge	0xbd10 <_stogir.stack.validate-inputs+0x670>
    ba20:      	uxtb	w16, w19
    ba24:      	cmp	w16, wzr
    ba28:      	b.eq	0xbb4c <_stogir.stack.validate-inputs+0x4ac>
    ba2c:      	cmp	x20, #0x10
    ba30:      	b.le	0xbb4c <_stogir.stack.validate-inputs+0x4ac>
    ba34:      	mov	x0, x20
    ba38:      	b	0xbb50 <_stogir.stack.validate-inputs+0x4b0>
    ba3c:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000ba3c:  ARM64_RELOC_PAGE21	l_stogir.453
    ba40:      	ldr	x16, [x16]
		000000000000ba40:  ARM64_RELOC_PAGEOFF12	l_stogir.453
    ba44:      	orr	x0, x16, xzr
    ba48:      	mov	x1, x0
    ba4c:      	mov	x0, #0x1                ; =1
    ba50:      	mov	x2, #0x29               ; =41
    ba54:      	b	0xb960 <_stogir.stack.validate-inputs+0x2c0>
    ba58:      	brk	#0
    ba5c:      	b	0xba58 <_stogir.stack.validate-inputs+0x3b8>
    ba60:      	mov	x0, #0x1                ; =1
    ba64:      	lsr	w0, w0, #0
    ba68:      	sxtw	x0, w0
    ba6c:      	and	x0, x0, #0xffffffff
    ba70:      	mov	x1, x0
    ba74:      	movz	x0, #0x0, lsl #48
    ba78:      	movz	x2, #0x0, lsl #48
    ba7c:      	b	0xba54 <_stogir.stack.validate-inputs+0x3b4>
    ba80:      	uxtb	w16, w23
    ba84:      	cmp	w16, wzr
    ba88:      	b.eq	0xbab4 <_stogir.stack.validate-inputs+0x414>
    ba8c:      	movz	x0, #0x0, lsl #48
    ba90:      	b	0xba64 <_stogir.stack.validate-inputs+0x3c4>
    ba94:      	mov	x0, #0x1                ; =1
    ba98:      	lsr	w0, w0, #0
    ba9c:      	sxtw	x0, w0
    baa0:      	and	x0, x0, #0xffffffff
    baa4:      	mov	x1, x0
    baa8:      	movz	x0, #0x0, lsl #48
    baac:      	movz	x2, #0x0, lsl #48
    bab0:      	b	0xba7c <_stogir.stack.validate-inputs+0x3dc>
    bab4:      	uxtb	w16, w25
    bab8:      	cmp	w16, wzr
    babc:      	b.ne	0xba60 <_stogir.stack.validate-inputs+0x3c0>
    bac0:      	uxtb	w16, w26
    bac4:      	cmp	w16, wzr
    bac8:      	b.ne	0xba60 <_stogir.stack.validate-inputs+0x3c0>
    bacc:      	uxtb	w16, w27
    bad0:      	cmp	w16, wzr
    bad4:      	b.ne	0xba60 <_stogir.stack.validate-inputs+0x3c0>
    bad8:      	uxtb	w16, w28
    badc:      	cmp	w16, wzr
    bae0:      	b.ne	0xba60 <_stogir.stack.validate-inputs+0x3c0>
    bae4:      	uxtb	w16, w19
    bae8:      	cmp	w16, wzr
    baec:      	b.ne	0xbca8 <_stogir.stack.validate-inputs+0x608>
    baf0:      	uxtb	w16, w20
    baf4:      	cmp	w16, wzr
    baf8:      	b.ne	0xbca8 <_stogir.stack.validate-inputs+0x608>
    bafc:      	uxtb	w16, w22
    bb00:      	cmp	w16, wzr
    bb04:      	b.ne	0xbcc0 <_stogir.stack.validate-inputs+0x620>
    bb08:      	uxtb	w16, w24
    bb0c:      	cmp	w16, wzr
    bb10:      	b.ne	0xbcc0 <_stogir.stack.validate-inputs+0x620>
    bb14:      	uxtb	w16, w21
    bb18:      	cmp	w16, wzr
    bb1c:      	b.ne	0xbcc0 <_stogir.stack.validate-inputs+0x620>
    bb20:      	uxtb	w16, w0
    bb24:      	cmp	w16, wzr
    bb28:      	b.ne	0xbcd0 <_stogir.stack.validate-inputs+0x630>
    bb2c:      	uxtb	w16, w1
    bb30:      	cmp	w16, wzr
    bb34:      	b.ne	0xbcd0 <_stogir.stack.validate-inputs+0x630>
    bb38:      	uxtb	w16, w2
    bb3c:      	cmp	w16, wzr
    bb40:      	b.ne	0xbcd0 <_stogir.stack.validate-inputs+0x630>
    bb44:      	ldr	x0, [sp, #0xb0]
    bb48:      	b	0xbcd4 <_stogir.stack.validate-inputs+0x634>
    bb4c:      	mov	x0, #0x10               ; =16
    bb50:      	lsr	w24, w24, #0
    bb54:      	mov	w19, w2
    bb58:      	mov	x2, x0
    bb5c:      	mov	x0, x22
    bb60:      	mov	w20, w3
    bb64:      	mov	w22, w4
    bb68:      	str	w7, [sp, #0x98]
    bb6c:      	str	w8, [sp, #0xa0]
    bb70:      	add	x8, sp, #0x70
    bb74:      	str	w9, [sp, #0xa8]
    bb78:      	str	x1, [sp, #0xb0]
    bb7c:      	mov	w1, w24
    bb80:      	mov	w24, w5
    bb84:      	str	x21, [sp, #0x90]
    bb88:      	mov	w21, w6
    bb8c:      	bl	0xbb8c <_stogir.stack.validate-inputs+0x4ec>
		000000000000bb8c:  ARM64_RELOC_BRANCH26	_stogir.stack.constant-size-aligned
    bb90:      	add	x16, sp, #0x70
    bb94:      	ldr	w0, [x16]
    bb98:      	lsr	x16, x0, #0
    bb9c:      	cmp	x16, #0x1
    bba0:      	b.eq	0xbbbc <_stogir.stack.validate-inputs+0x51c>
    bba4:      	b.lo	0xbbac <_stogir.stack.validate-inputs+0x50c>
    bba8:      	b	0xbbc0 <_stogir.stack.validate-inputs+0x520>
    bbac:      	cmp	x16, #0x0
    bbb0:      	b.eq	0xbbb8 <_stogir.stack.validate-inputs+0x518>
    bbb4:      	b	0xbbc0 <_stogir.stack.validate-inputs+0x520>
    bbb8:      	b	0xbbf0 <_stogir.stack.validate-inputs+0x550>
    bbbc:      	b	0xbbc4 <_stogir.stack.validate-inputs+0x524>
    bbc0:      	b	0xbcb8 <_stogir.stack.validate-inputs+0x618>
    bbc4:      	add	x16, sp, #0x70
    bbc8:      	orr	x0, x16, xzr
    bbcc:      	add	x0, x0, #0x8
    bbd0:      	add	x16, sp, #0x70
    bbd4:      	ldr	x1, [x16, #0x8]
    bbd8:      	ldr	x0, [x0, #0x8]
    bbdc:      	mov	x2, x0
    bbe0:      	mov	x0, #0x1                ; =1
    bbe4:      	b	0xbab0 <_stogir.stack.validate-inputs+0x410>
    bbe8:      	brk	#0
    bbec:      	b	0xbbe8 <_stogir.stack.validate-inputs+0x548>
    bbf0:      	uxtb	w16, w23
    bbf4:      	cmp	w16, wzr
    bbf8:      	b.eq	0xbc04 <_stogir.stack.validate-inputs+0x564>
    bbfc:      	movz	x0, #0x0, lsl #48
    bc00:      	b	0xba98 <_stogir.stack.validate-inputs+0x3f8>
    bc04:      	uxtb	w16, w25
    bc08:      	cmp	w16, wzr
    bc0c:      	b.ne	0xba94 <_stogir.stack.validate-inputs+0x3f4>
    bc10:      	uxtb	w16, w26
    bc14:      	cmp	w16, wzr
    bc18:      	b.ne	0xba94 <_stogir.stack.validate-inputs+0x3f4>
    bc1c:      	uxtb	w16, w27
    bc20:      	cmp	w16, wzr
    bc24:      	b.ne	0xba94 <_stogir.stack.validate-inputs+0x3f4>
    bc28:      	uxtb	w16, w28
    bc2c:      	cmp	w16, wzr
    bc30:      	b.ne	0xba94 <_stogir.stack.validate-inputs+0x3f4>
    bc34:      	uxtb	w16, w19
    bc38:      	cmp	w16, wzr
    bc3c:      	b.ne	0xbcb0 <_stogir.stack.validate-inputs+0x610>
    bc40:      	uxtb	w16, w20
    bc44:      	cmp	w16, wzr
    bc48:      	b.ne	0xbcb0 <_stogir.stack.validate-inputs+0x610>
    bc4c:      	uxtb	w16, w22
    bc50:      	cmp	w16, wzr
    bc54:      	b.ne	0xbcc8 <_stogir.stack.validate-inputs+0x628>
    bc58:      	uxtb	w16, w24
    bc5c:      	cmp	w16, wzr
    bc60:      	b.ne	0xbcc8 <_stogir.stack.validate-inputs+0x628>
    bc64:      	uxtb	w16, w21
    bc68:      	cmp	w16, wzr
    bc6c:      	b.ne	0xbcc8 <_stogir.stack.validate-inputs+0x628>
    bc70:      	ldr	w0, [sp, #0x98]
    bc74:      	uxtb	w16, w0
    bc78:      	cmp	w16, wzr
    bc7c:      	b.ne	0xbcd8 <_stogir.stack.validate-inputs+0x638>
    bc80:      	ldr	w1, [sp, #0xa0]
    bc84:      	uxtb	w16, w1
    bc88:      	cmp	w16, wzr
    bc8c:      	b.ne	0xbcd8 <_stogir.stack.validate-inputs+0x638>
    bc90:      	ldr	w2, [sp, #0xa8]
    bc94:      	uxtb	w16, w2
    bc98:      	cmp	w16, wzr
    bc9c:      	b.ne	0xbcd8 <_stogir.stack.validate-inputs+0x638>
    bca0:      	ldr	x0, [sp, #0xb0]
    bca4:      	b	0xbcdc <_stogir.stack.validate-inputs+0x63c>
    bca8:      	mov	x0, #0x2                ; =2
    bcac:      	b	0xba64 <_stogir.stack.validate-inputs+0x3c4>
    bcb0:      	mov	x0, #0x2                ; =2
    bcb4:      	b	0xba98 <_stogir.stack.validate-inputs+0x3f8>
    bcb8:      	brk	#0
    bcbc:      	b	0xbcb8 <_stogir.stack.validate-inputs+0x618>
    bcc0:      	mov	x0, #0x4                ; =4
    bcc4:      	b	0xbcac <_stogir.stack.validate-inputs+0x60c>
    bcc8:      	mov	x0, #0x4                ; =4
    bccc:      	b	0xbcb4 <_stogir.stack.validate-inputs+0x614>
    bcd0:      	mov	x0, #0x8                ; =8
    bcd4:      	b	0xbcc4 <_stogir.stack.validate-inputs+0x624>
    bcd8:      	mov	x0, #0x8                ; =8
    bcdc:      	b	0xbccc <_stogir.stack.validate-inputs+0x62c>
    bce0:      	str	x8, [sp, #0x90]
    bce4:      	b	0xb6fc <_stogir.stack.validate-inputs+0x5c>
    bce8:      	str	x21, [sp, #0x90]
    bcec:      	b	0xb848 <_stogir.stack.validate-inputs+0x1a8>
    bcf0:      	str	x21, [sp, #0x90]
    bcf4:      	b	0xb848 <_stogir.stack.validate-inputs+0x1a8>
    bcf8:      	str	x21, [sp, #0x90]
    bcfc:      	b	0xba3c <_stogir.stack.validate-inputs+0x39c>
    bd00:      	str	x21, [sp, #0x90]
    bd04:      	b	0xba3c <_stogir.stack.validate-inputs+0x39c>
    bd08:      	str	x21, [sp, #0x90]
    bd0c:      	b	0xba3c <_stogir.stack.validate-inputs+0x39c>
    bd10:      	str	x21, [sp, #0x90]
    bd14:      	str	x1, [sp, #0xb0]
    bd18:      	mov	w19, w2
    bd1c:      	mov	w20, w3
    bd20:      	mov	w22, w4
    bd24:      	mov	w24, w5
    bd28:      	mov	w21, w6
    bd2c:      	mov	w0, w7
    bd30:      	mov	w1, w8
    bd34:      	mov	w2, w9
    bd38:      	b	0xba80 <_stogir.stack.validate-inputs+0x3e0>

000000000000bd3c <_stogir.locals.shape>:
    bd3c:      	sub	sp, sp, #0x40
    bd40:      	str	x29, [sp]
    bd44:      	str	x30, [sp, #0x8]
    bd48:      	mov	x29, sp
    bd4c:      	str	x19, [sp, #0x20]
    bd50:      	str	x20, [sp, #0x28]
    bd54:      	str	x21, [sp, #0x30]
    bd58:      	str	x22, [sp, #0x38]
    bd5c:      	sxtw	x19, w1
    bd60:      	lsl	x20, x19, #2
    bd64:      	cmp	x19, #0x0
    bd68:      	cset	w1, gt
    bd6c:      	movz	x16, #0x0, lsl #48
    bd70:      	sub	x3, x16, x19
    bd74:      	sub	x4, x3, #0x1
    bd78:      	uxtb	w16, w1
    bd7c:      	cmp	w16, wzr
    bd80:      	b.eq	0xbdc0 <_stogir.locals.shape+0x84>
    bd84:      	ldr	x3, [x0, #0x8]
    bd88:      	cmp	x19, x3
    bd8c:      	b.ge	0xbe30 <_stogir.locals.shape+0xf4>
    bd90:      	add	x3, x0, #0x78
    bd94:      	ldr	x3, [x3, #0x8]
    bd98:      	cmp	x19, x3
    bd9c:      	b.ge	0xc004 <_stogir.locals.shape+0x2c8>
    bda0:      	ldr	x3, [x0, #0x78]
    bda4:      	add	x3, x20, x3
    bda8:      	ldr	w3, [x3]
    bdac:      	sxtw	x3, w3
    bdb0:      	cmp	x3, #0x0
    bdb4:      	cset	w3, ge
    bdb8:      	ubfx	x3, x3, #0, #8
    bdbc:      	b	0xc008 <_stogir.locals.shape+0x2cc>
    bdc0:      	cmp	x19, #0x0
    bdc4:      	b.ge	0xbe38 <_stogir.locals.shape+0xfc>
    bdc8:      	add	x5, x0, #0x28
    bdcc:      	add	x6, x0, #0x50
    bdd0:      	ldr	x5, [x5, #0x8]
    bdd4:      	ldr	x6, [x6, #0x8]
    bdd8:      	cmp	x5, x6
    bddc:      	b.ne	0xbe0c <_stogir.locals.shape+0xd0>
    bde0:      	cmp	x3, x5
    bde4:      	b.gt	0xc074 <_stogir.locals.shape+0x338>
    bde8:      	lsl	x3, x4, #2
    bdec:      	ldr	x5, [x0, #0x50]
    bdf0:      	add	x3, x3, x5
    bdf4:      	ldr	w3, [x3]
    bdf8:      	sxtw	x3, w3
    bdfc:      	cmp	x3, #0x0
    be00:      	cset	w3, gt
    be04:      	ubfx	x3, x3, #0, #8
    be08:      	b	0xc078 <_stogir.locals.shape+0x33c>
    be0c:      	movz	x3, #0x0, lsl #48
    be10:      	b	0xbe3c <_stogir.locals.shape+0x100>
    be14:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000be14:  ARM64_RELOC_PAGE21	l_stogir.454
    be18:      	ldr	x16, [x16]
		000000000000be18:  ARM64_RELOC_PAGEOFF12	l_stogir.454
    be1c:      	orr	x0, x16, xzr
    be20:      	mov	x1, x0
    be24:      	mov	x0, #0x1                ; =1
    be28:      	mov	x2, #0x1c               ; =28
    be2c:      	b	0xbefc <_stogir.locals.shape+0x1c0>
    be30:      	movz	x3, #0x0, lsl #48
    be34:      	b	0xbe3c <_stogir.locals.shape+0x100>
    be38:      	movz	x3, #0x0, lsl #48
    be3c:      	cmp	x3, #0x0
    be40:      	b.eq	0xbea4 <_stogir.locals.shape+0x168>
    be44:      	uxtb	w16, w1
    be48:      	cmp	w16, wzr
    be4c:      	b.eq	0xbe74 <_stogir.locals.shape+0x138>
    be50:      	lsl	x1, x19, #4
    be54:      	ldr	x3, [x0]
    be58:      	add	x1, x1, x3
    be5c:      	ldr	x3, [x1]
    be60:      	ldr	x1, [x1, #0x8]
    be64:      	fmov	d31, x1
    be68:      	mov	x1, x3
    be6c:      	fmov	x3, d31
    be70:      	b	0xbe94 <_stogir.locals.shape+0x158>
    be74:      	lsl	x1, x4, #4
    be78:      	ldr	x3, [x0, #0x28]
    be7c:      	add	x1, x1, x3
    be80:      	ldr	x3, [x1]
    be84:      	ldr	x1, [x1, #0x8]
    be88:      	fmov	d31, x1
    be8c:      	mov	x1, x3
    be90:      	fmov	x3, d31
    be94:      	mov	x4, x3
    be98:      	mov	x3, x1
    be9c:      	mov	x1, #0x1                ; =1
    bea0:      	b	0xbeb0 <_stogir.locals.shape+0x174>
    bea4:      	movz	x1, #0x0, lsl #48
    bea8:      	movz	x3, #0x0, lsl #48
    beac:      	movz	x4, #0x0, lsl #48
    beb0:      	lsr	w1, w1, #0
    beb4:      	lsr	x16, x1, #0
    beb8:      	cmp	x16, #0x1
    bebc:      	b.eq	0xbed8 <_stogir.locals.shape+0x19c>
    bec0:      	b.lo	0xbec8 <_stogir.locals.shape+0x18c>
    bec4:      	b	0xbedc <_stogir.locals.shape+0x1a0>
    bec8:      	cmp	x16, #0x0
    becc:      	b.eq	0xbed4 <_stogir.locals.shape+0x198>
    bed0:      	b	0xbedc <_stogir.locals.shape+0x1a0>
    bed4:      	b	0xbee0 <_stogir.locals.shape+0x1a4>
    bed8:      	b	0xbf28 <_stogir.locals.shape+0x1ec>
    bedc:      	b	0xc0c8 <_stogir.locals.shape+0x38c>
    bee0:      	adrp	x16, 0xb000 <_stogir.switch.case-inputs+0x470>
		000000000000bee0:  ARM64_RELOC_PAGE21	l_stogir.455
    bee4:      	ldr	x16, [x16]
		000000000000bee4:  ARM64_RELOC_PAGEOFF12	l_stogir.455
    bee8:      	orr	x0, x16, xzr
    beec:      	mov	x21, x8
    bef0:      	mov	x1, x0
    bef4:      	mov	x0, #0x1                ; =1
    bef8:      	mov	x2, #0x16               ; =22
    befc:      	str	x0, [x21]
    bf00:      	str	x1, [x21, #0x8]
    bf04:      	str	x2, [x21, #0x10]
    bf08:      	ldr	x19, [sp, #0x20]
    bf0c:      	ldr	x20, [sp, #0x28]
    bf10:      	ldr	x21, [sp, #0x30]
    bf14:      	ldr	x22, [sp, #0x38]
    bf18:      	ldr	x29, [sp]
    bf1c:      	ldr	x30, [sp, #0x8]
    bf20:      	add	sp, sp, #0x40
    bf24:      	ret
    bf28:      	lsr	w2, w2, #0
    bf2c:      	lsr	w1, w3, #0
    bf30:      	add	x16, sp, #0x10
    bf34:      	str	x3, [x16]
    bf38:      	add	x16, sp, #0x10
    bf3c:      	str	x4, [x16, #0x8]
    bf40:      	ubfx	x1, x1, #8, #8
    bf44:      	lsr	w1, w1, #0
    bf48:      	mov	x21, x8
    bf4c:      	mov	x22, x0
    bf50:      	mov	w0, w1
    bf54:      	mov	w1, w2
    bf58:      	bl	0xbf58 <_stogir.locals.shape+0x21c>
		000000000000bf58:  ARM64_RELOC_BRANCH26	_stogir.types.size
    bf5c:      	lsr	w0, w0, #0
    bf60:      	add	x16, sp, #0x10
    bf64:      	ldr	w1, [x16, #0xc]
    bf68:      	sxtw	x0, w0
    bf6c:      	sxtw	x1, w1
    bf70:      	cmp	x1, #0x0
    bf74:      	b.ne	0xbf7c <_stogir.locals.shape+0x240>
    bf78:      	mov	x1, x0
    bf7c:      	add	x16, sp, #0x10
    bf80:      	ldr	w2, [x16, #0x8]
    bf84:      	sxtw	x2, w2
    bf88:      	cmp	x2, #0x0
    bf8c:      	cset	w3, eq
    bf90:      	ubfx	x3, x3, #0, #8
    bf94:      	cmp	x2, #0x0
    bf98:      	b.le	0xc00c <_stogir.locals.shape+0x2d0>
    bf9c:      	cmp	x2, #0x0
    bfa0:      	b.le	0xc084 <_stogir.locals.shape+0x348>
    bfa4:      	add	x4, x22, #0x110
    bfa8:      	add	x5, x4, #0x28
    bfac:      	ldr	x5, [x5, #0x8]
    bfb0:      	cmp	x2, x5
    bfb4:      	b.gt	0xc084 <_stogir.locals.shape+0x348>
    bfb8:      	sub	x2, x2, #0x1
    bfbc:      	mov	x17, #0x18              ; =24
    bfc0:      	mul	x2, x2, x17
    bfc4:      	ldr	x5, [x4, #0x28]
    bfc8:      	add	x2, x2, x5
    bfcc:      	ldr	x5, [x2]
    bfd0:      	ldr	x2, [x2, #0x8]
    bfd4:      	ldr	x4, [x4, #0x8]
    bfd8:      	cmp	x5, #0x0
    bfdc:      	b.lt	0xc0c0 <_stogir.locals.shape+0x384>
    bfe0:      	cmp	x5, x4
    bfe4:      	b.gt	0xc0c0 <_stogir.locals.shape+0x384>
    bfe8:      	cmp	x2, #0x0
    bfec:      	b.lt	0xc0c0 <_stogir.locals.shape+0x384>
    bff0:      	sub	x4, x4, x5
    bff4:      	cmp	x2, x4
    bff8:      	b.gt	0xc0c0 <_stogir.locals.shape+0x384>
    bffc:      	mov	x2, #0x1                ; =1
    c000:      	b	0xc0c4 <_stogir.locals.shape+0x388>
    c004:      	movz	x3, #0x0, lsl #48
    c008:      	b	0xbe34 <_stogir.locals.shape+0xf8>
    c00c:      	mov	x2, x3
    c010:      	cmp	x19, #0x0
    c014:      	b.le	0xbe14 <_stogir.locals.shape+0xd8>
    c018:      	add	x16, sp, #0x10
    c01c:      	ldr	w3, [x16]
    c020:      	uxtb	w3, w3
    c024:      	cmp	x3, #0x48
    c028:      	b.ne	0xbe14 <_stogir.locals.shape+0xd8>
    c02c:      	ldr	x3, [x22, #0x78]
    c030:      	add	x3, x20, x3
    c034:      	ldr	w3, [x3]
    c038:      	sxtw	x3, w3
    c03c:      	cmp	x3, #0x3
    c040:      	b.ne	0xbe14 <_stogir.locals.shape+0xd8>
    c044:      	cmp	x0, #0x0
    c048:      	b.le	0xbe14 <_stogir.locals.shape+0xd8>
    c04c:      	cmp	x2, #0x0
    c050:      	b.eq	0xbe14 <_stogir.locals.shape+0xd8>
    c054:      	cmp	x1, #0x0
    c058:      	b.le	0xc0d0 <_stogir.locals.shape+0x394>
    c05c:      	sub	x2, x1, #0x1
    c060:      	and	x2, x2, x1
    c064:      	cmp	x2, #0x0
    c068:      	cset	w2, eq
    c06c:      	ubfx	x2, x2, #0, #8
    c070:      	b	0xc0d4 <_stogir.locals.shape+0x398>
    c074:      	movz	x3, #0x0, lsl #48
    c078:      	b	0xbe10 <_stogir.locals.shape+0xd4>
    c07c:      	mov	x2, #0x1                ; =1
    c080:      	b	0xc010 <_stogir.locals.shape+0x2d4>
    c084:      	movz	x2, #0x0, lsl #48
    c088:      	lsr	w2, w2, #0
    c08c:      	lsr	x16, x2, #0
    c090:      	cmp	x16, #0x1
    c094:      	b.eq	0xc0b0 <_stogir.locals.shape+0x374>
    c098:      	b.lo	0xc0a0 <_stogir.locals.shape+0x364>
    c09c:      	b	0xc0b4 <_stogir.locals.shape+0x378>
    c0a0:      	cmp	x16, #0x0
    c0a4:      	b.eq	0xc0ac <_stogir.locals.shape+0x370>
    c0a8:      	b	0xc0b4 <_stogir.locals.shape+0x378>
    c0ac:      	b	0xc0b8 <_stogir.locals.shape+0x37c>
    c0b0:      	b	0xc07c <_stogir.locals.shape+0x340>
    c0b4:      	b	0xc1b0 <_stogir.locals.shape+0x474>
    c0b8:      	mov	x2, x3
    c0bc:      	b	0xc080 <_stogir.locals.shape+0x344>
    c0c0:      	movz	x2, #0x0, lsl #48
    c0c4:      	b	0xc088 <_stogir.locals.shape+0x34c>
    c0c8:      	brk	#0
    c0cc:      	b	0xc0c8 <_stogir.locals.shape+0x38c>
    c0d0:      	movz	x2, #0x0, lsl #48
    c0d4:      	cmp	x2, #0x0
    c0d8:      	b.eq	0xbe14 <_stogir.locals.shape+0xd8>
    c0dc:      	add	x16, sp, #0x10
    c0e0:      	ldr	w2, [x16, #0x4]
    c0e4:      	sxtw	x2, w2
    c0e8:      	cmp	x2, #0x0
    c0ec:      	cset	w3, gt
    c0f0:      	movz	x16, #0x0, lsl #48
    c0f4:      	sub	x4, x16, x2
    c0f8:      	sub	x5, x4, #0x1
    c0fc:      	uxtb	w16, w3
    c100:      	cmp	w16, wzr
    c104:      	b.eq	0xc164 <_stogir.locals.shape+0x428>
    c108:      	ldr	x4, [x22, #0x8]
    c10c:      	cmp	x2, x4
    c110:      	b.ge	0xc1b8 <_stogir.locals.shape+0x47c>
    c114:      	add	x4, x22, #0x78
    c118:      	ldr	x4, [x4, #0x8]
    c11c:      	cmp	x2, x4
    c120:      	b.ge	0xc29c <_stogir.locals.shape+0x560>
    c124:      	lsl	x4, x2, #2
    c128:      	ldr	x6, [x22, #0x78]
    c12c:      	add	x4, x4, x6
    c130:      	ldr	w4, [x4]
    c134:      	sxtw	x4, w4
    c138:      	cmp	x4, #0x0
    c13c:      	cset	w4, ge
    c140:      	ubfx	x4, x4, #0, #8
    c144:      	b	0xc2a0 <_stogir.locals.shape+0x564>
    c148:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000c148:  ARM64_RELOC_PAGE21	l_stogir.456
    c14c:      	ldr	x16, [x16]
		000000000000c14c:  ARM64_RELOC_PAGEOFF12	l_stogir.456
    c150:      	orr	x0, x16, xzr
    c154:      	mov	x1, x0
    c158:      	mov	x0, #0x1                ; =1
    c15c:      	mov	x2, #0x2c               ; =44
    c160:      	b	0xbe2c <_stogir.locals.shape+0xf0>
    c164:      	cmp	x2, #0x0
    c168:      	b.ge	0xc1c0 <_stogir.locals.shape+0x484>
    c16c:      	add	x6, x22, #0x28
    c170:      	add	x7, x22, #0x50
    c174:      	ldr	x6, [x6, #0x8]
    c178:      	ldr	x7, [x7, #0x8]
    c17c:      	cmp	x6, x7
    c180:      	b.ne	0xc294 <_stogir.locals.shape+0x558>
    c184:      	cmp	x4, x6
    c188:      	b.gt	0xc2a4 <_stogir.locals.shape+0x568>
    c18c:      	lsl	x4, x5, #2
    c190:      	ldr	x6, [x22, #0x50]
    c194:      	add	x4, x4, x6
    c198:      	ldr	w4, [x4]
    c19c:      	sxtw	x4, w4
    c1a0:      	cmp	x4, #0x0
    c1a4:      	cset	w4, gt
    c1a8:      	ubfx	x4, x4, #0, #8
    c1ac:      	b	0xc2a8 <_stogir.locals.shape+0x56c>
    c1b0:      	brk	#0
    c1b4:      	b	0xc1b0 <_stogir.locals.shape+0x474>
    c1b8:      	movz	x4, #0x0, lsl #48
    c1bc:      	b	0xc1c4 <_stogir.locals.shape+0x488>
    c1c0:      	movz	x4, #0x0, lsl #48
    c1c4:      	cmp	x4, #0x0
    c1c8:      	b.eq	0xc208 <_stogir.locals.shape+0x4cc>
    c1cc:      	uxtb	w16, w3
    c1d0:      	cmp	w16, wzr
    c1d4:      	b.eq	0xc1ec <_stogir.locals.shape+0x4b0>
    c1d8:      	lsl	x2, x2, #4
    c1dc:      	ldr	x3, [x22]
    c1e0:      	add	x2, x2, x3
    c1e4:      	ldr	x2, [x2]
    c1e8:      	b	0xc1fc <_stogir.locals.shape+0x4c0>
    c1ec:      	lsl	x2, x5, #4
    c1f0:      	ldr	x3, [x22, #0x28]
    c1f4:      	add	x2, x2, x3
    c1f8:      	ldr	x2, [x2]
    c1fc:      	mov	x3, x2
    c200:      	mov	x2, #0x1                ; =1
    c204:      	b	0xc210 <_stogir.locals.shape+0x4d4>
    c208:      	movz	x2, #0x0, lsl #48
    c20c:      	movz	x3, #0x0, lsl #48
    c210:      	lsr	w2, w2, #0
    c214:      	lsr	x16, x2, #0
    c218:      	cmp	x16, #0x1
    c21c:      	b.eq	0xc238 <_stogir.locals.shape+0x4fc>
    c220:      	b.lo	0xc228 <_stogir.locals.shape+0x4ec>
    c224:      	b	0xc23c <_stogir.locals.shape+0x500>
    c228:      	cmp	x16, #0x0
    c22c:      	b.eq	0xc234 <_stogir.locals.shape+0x4f8>
    c230:      	b	0xc23c <_stogir.locals.shape+0x500>
    c234:      	b	0xc240 <_stogir.locals.shape+0x504>
    c238:      	b	0xc25c <_stogir.locals.shape+0x520>
    c23c:      	b	0xc2d4 <_stogir.locals.shape+0x598>
    c240:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000c240:  ARM64_RELOC_PAGE21	l_stogir.457
    c244:      	ldr	x16, [x16]
		000000000000c244:  ARM64_RELOC_PAGEOFF12	l_stogir.457
    c248:      	orr	x0, x16, xzr
    c24c:      	mov	x1, x0
    c250:      	mov	x0, #0x1                ; =1
    c254:      	mov	x2, #0x1d               ; =29
    c258:      	b	0xc160 <_stogir.locals.shape+0x424>
    c25c:      	add	x16, sp, #0x10
    c260:      	ldr	w2, [x16, #0x4]
    c264:      	sxtw	x2, w2
    c268:      	cmp	x2, #0x0
    c26c:      	b.le	0xc148 <_stogir.locals.shape+0x40c>
    c270:      	uxtb	w3, w3
    c274:      	cmp	x3, #0x83
    c278:      	b.ge	0xc2ac <_stogir.locals.shape+0x570>
    c27c:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000c27c:  ARM64_RELOC_PAGE21	l_stogir.458
    c280:      	ldr	x16, [x16]
		000000000000c280:  ARM64_RELOC_PAGEOFF12	l_stogir.458
    c284:      	orr	x2, x16, xzr
    c288:      	add	x2, x3, x2
    c28c:      	ldrb	w2, [x2]
    c290:      	b	0xc2b0 <_stogir.locals.shape+0x574>
    c294:      	movz	x4, #0x0, lsl #48
    c298:      	b	0xc1c4 <_stogir.locals.shape+0x488>
    c29c:      	movz	x4, #0x0, lsl #48
    c2a0:      	b	0xc1bc <_stogir.locals.shape+0x480>
    c2a4:      	movz	x4, #0x0, lsl #48
    c2a8:      	b	0xc298 <_stogir.locals.shape+0x55c>
    c2ac:      	movz	x2, #0x0, lsl #48
    c2b0:      	uxtb	w2, w2
    c2b4:      	and	x2, x2, #0x2
    c2b8:      	uxtb	w2, w2
    c2bc:      	cmp	x2, #0x0
    c2c0:      	b.eq	0xc148 <_stogir.locals.shape+0x40c>
    c2c4:      	mov	x2, x1
    c2c8:      	mov	x1, x0
    c2cc:      	movz	x0, #0x0, lsl #48
    c2d0:      	b	0xc160 <_stogir.locals.shape+0x424>
    c2d4:      	brk	#0
    c2d8:      	b	0xc2d4 <_stogir.locals.shape+0x598>

000000000000c2dc <_stogir.conversion.policy>:
    c2dc:      	sub	sp, sp, #0x70
    c2e0:      	str	x29, [sp]
    c2e4:      	str	x30, [sp, #0x8]
    c2e8:      	mov	x29, sp
    c2ec:      	str	x19, [sp, #0x20]
    c2f0:      	str	x20, [sp, #0x28]
    c2f4:      	str	x21, [sp, #0x30]
    c2f8:      	str	x22, [sp, #0x38]
    c2fc:      	str	x23, [sp, #0x40]
    c300:      	str	x24, [sp, #0x48]
    c304:      	str	x25, [sp, #0x50]
    c308:      	str	x26, [sp, #0x58]
    c30c:      	str	x27, [sp, #0x60]
    c310:      	str	x28, [sp, #0x68]
    c314:      	sxtw	x19, w0
    c318:      	sxtw	x20, w1
    c31c:      	sxtw	x21, w2
    c320:      	cmp	x19, #0x24
    c324:      	b.ne	0xc374 <_stogir.conversion.policy+0x98>
    c328:      	cmp	x20, #0xf
    c32c:      	b.le	0xc5a8 <_stogir.conversion.policy+0x2cc>
    c330:      	cmp	x20, #0x80
    c334:      	b.ge	0xc5a8 <_stogir.conversion.policy+0x2cc>
    c338:      	and	x0, x20, #0xf
    c33c:      	lsr	w0, w0, #0
    c340:      	sxtw	x0, w0
    c344:      	cmp	x0, #0x1
    c348:      	b.lt	0xc5a8 <_stogir.conversion.policy+0x2cc>
    c34c:      	and	x0, x20, #0xf
    c350:      	lsr	w0, w0, #0
    c354:      	sxtw	x0, w0
    c358:      	cmp	x0, #0xd
    c35c:      	b.gt	0xc5a8 <_stogir.conversion.policy+0x2cc>
    c360:      	mov	x0, #0x1                ; =1
    c364:      	b	0xc36c <_stogir.conversion.policy+0x90>
    c368:      	movz	x0, #0x0, lsl #48
    c36c:      	mov	x22, x0
    c370:      	b	0xc378 <_stogir.conversion.policy+0x9c>
    c374:      	movz	x22, #0x0, lsl #48
    c378:      	sxtw	x23, w3
    c37c:      	cmp	x20, #0xd
    c380:      	cset	w24, eq
    c384:      	cmp	x20, #0xc
    c388:      	cset	w25, eq
    c38c:      	cmp	x23, #0x4
    c390:      	cset	w26, eq
    c394:      	cmp	x23, #0x8
    c398:      	cset	w27, eq
    c39c:      	cmp	x22, #0x0
    c3a0:      	b.eq	0xc89c <_stogir.conversion.policy+0x5c0>
    c3a4:      	lsr	w1, w1, #0
    c3a8:      	lsr	w3, w3, #0
    c3ac:      	mov	w0, w1
    c3b0:      	mov	w1, w3
    c3b4:      	str	x8, [sp, #0x18]
    c3b8:      	mov	w28, w3
    c3bc:      	str	x23, [sp, #0x10]
    c3c0:      	mov	w23, w2
    c3c4:      	bl	0xc3c4 <_stogir.conversion.policy+0xe8>
		000000000000c3c4:  ARM64_RELOC_BRANCH26	_stogir.types.size
    c3c8:      	lsr	w0, w0, #0
    c3cc:      	sxtw	x0, w0
    c3d0:      	b	0xc3e0 <_stogir.conversion.policy+0x104>
    c3d4:      	mov	x0, #0x1                ; =1
    c3d8:      	lsr	w0, w0, #0
    c3dc:      	sxtw	x0, w0
    c3e0:      	cmp	x21, #0xd
    c3e4:      	cset	w1, eq
    c3e8:      	cmp	x21, #0xc
    c3ec:      	cset	w2, eq
    c3f0:      	cmp	x22, #0x0
    c3f4:      	b.eq	0xc8b0 <_stogir.conversion.policy+0x5d4>
    c3f8:      	lsr	w23, w23, #0
    c3fc:      	lsr	w28, w28, #0
    c400:      	mov	x22, x0
    c404:      	mov	w0, w23
    c408:      	mov	w23, w1
    c40c:      	mov	w1, w28
    c410:      	mov	w28, w2
    c414:      	bl	0xc414 <_stogir.conversion.policy+0x138>
		000000000000c414:  ARM64_RELOC_BRANCH26	_stogir.types.size
    c418:      	lsr	w0, w0, #0
    c41c:      	sxtw	x0, w0
    c420:      	b	0xc430 <_stogir.conversion.policy+0x154>
    c424:      	mov	x0, #0x1                ; =1
    c428:      	lsr	w0, w0, #0
    c42c:      	sxtw	x0, w0
    c430:      	cmp	x19, #0x21
    c434:      	b.lt	0xc528 <_stogir.conversion.policy+0x24c>
    c438:      	cmp	x19, #0x27
    c43c:      	cset	w1, le
    c440:      	uxtb	w16, w1
    c444:      	cmp	w16, wzr
    c448:      	b.eq	0xc528 <_stogir.conversion.policy+0x24c>
    c44c:      	lsl	x2, x22, #3
    c450:      	lsr	w2, w2, #0
    c454:      	sxtw	x2, w2
    c458:      	cmp	x2, #0x0
    c45c:      	b.le	0xc528 <_stogir.conversion.policy+0x24c>
    c460:      	lsl	x0, x0, #3
    c464:      	lsr	w0, w0, #0
    c468:      	sxtw	x0, w0
    c46c:      	cmp	x0, #0x0
    c470:      	b.le	0xc528 <_stogir.conversion.policy+0x24c>
    c474:      	cmp	x19, #0x26
    c478:      	cset	w3, eq
    c47c:      	cmp	x20, #0x1
    c480:      	cset	w4, ge
    c484:      	cmp	x20, #0xb
    c488:      	cset	w5, le
    c48c:      	cmp	x21, #0x1
    c490:      	cset	w6, ge
    c494:      	cmp	x21, #0xb
    c498:      	cset	w7, le
    c49c:      	cmp	x19, #0x25
    c4a0:      	b.lt	0xc720 <_stogir.conversion.policy+0x444>
    c4a4:      	uxtb	w16, w1
    c4a8:      	cmp	w16, wzr
    c4ac:      	b.eq	0xc720 <_stogir.conversion.policy+0x444>
    c4b0:      	ubfx	x23, x23, #0, #8
    c4b4:      	cmp	x19, #0x25
    c4b8:      	b.ne	0xc7bc <_stogir.conversion.policy+0x4e0>
    c4bc:      	uxtb	w16, w4
    c4c0:      	cmp	w16, wzr
    c4c4:      	b.eq	0xc7b4 <_stogir.conversion.policy+0x4d8>
    c4c8:      	uxtb	w16, w5
    c4cc:      	cmp	w16, wzr
    c4d0:      	b.eq	0xc7b4 <_stogir.conversion.policy+0x4d8>
    c4d4:      	uxtb	w16, w28
    c4d8:      	cmp	w16, wzr
    c4dc:      	b.eq	0xc830 <_stogir.conversion.policy+0x554>
    c4e0:      	mov	x1, #0x1                ; =1
    c4e4:      	b	0xc834 <_stogir.conversion.policy+0x558>
    c4e8:      	uxtb	w16, w26
    c4ec:      	cmp	w16, wzr
    c4f0:      	b.ne	0xc588 <_stogir.conversion.policy+0x2ac>
    c4f4:      	uxtb	w16, w27
    c4f8:      	cmp	w16, wzr
    c4fc:      	b.ne	0xc588 <_stogir.conversion.policy+0x2ac>
    c500:      	movn	x0, #0x0, lsl #48
    c504:      	b	0xc428 <_stogir.conversion.policy+0x14c>
    c508:      	uxtb	w16, w26
    c50c:      	cmp	w16, wzr
    c510:      	b.ne	0xc598 <_stogir.conversion.policy+0x2bc>
    c514:      	uxtb	w16, w27
    c518:      	cmp	w16, wzr
    c51c:      	b.ne	0xc598 <_stogir.conversion.policy+0x2bc>
    c520:      	movn	x0, #0x0, lsl #48
    c524:      	b	0xc3d8 <_stogir.conversion.policy+0xfc>
    c528:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000c528:  ARM64_RELOC_PAGE21	l_stogir.459
    c52c:      	ldr	x16, [x16]
		000000000000c52c:  ARM64_RELOC_PAGEOFF12	l_stogir.459
    c530:      	orr	x0, x16, xzr
    c534:      	mov	x1, x0
    c538:      	mov	x0, #0x1                ; =1
    c53c:      	mov	x2, #0x22               ; =34
    c540:      	ldr	x3, [sp, #0x18]
    c544:      	str	x0, [x3]
    c548:      	str	x1, [x3, #0x8]
    c54c:      	str	x2, [x3, #0x10]
    c550:      	ldr	x19, [sp, #0x20]
    c554:      	ldr	x20, [sp, #0x28]
    c558:      	ldr	x21, [sp, #0x30]
    c55c:      	ldr	x22, [sp, #0x38]
    c560:      	ldr	x23, [sp, #0x40]
    c564:      	ldr	x24, [sp, #0x48]
    c568:      	ldr	x25, [sp, #0x50]
    c56c:      	ldr	x26, [sp, #0x58]
    c570:      	ldr	x27, [sp, #0x60]
    c574:      	ldr	x28, [sp, #0x68]
    c578:      	ldr	x29, [sp]
    c57c:      	ldr	x30, [sp, #0x8]
    c580:      	add	sp, sp, #0x70
    c584:      	ret
    c588:      	cmp	x21, #0x0
    c58c:      	b.ne	0xc5f0 <_stogir.conversion.policy+0x314>
    c590:      	movz	x0, #0x0, lsl #48
    c594:      	b	0xc428 <_stogir.conversion.policy+0x14c>
    c598:      	cmp	x20, #0x0
    c59c:      	b.ne	0xc668 <_stogir.conversion.policy+0x38c>
    c5a0:      	movz	x0, #0x0, lsl #48
    c5a4:      	b	0xc3d8 <_stogir.conversion.policy+0xfc>
    c5a8:      	cmp	x21, #0xf
    c5ac:      	b.le	0xc368 <_stogir.conversion.policy+0x8c>
    c5b0:      	cmp	x21, #0x80
    c5b4:      	b.ge	0xc5e8 <_stogir.conversion.policy+0x30c>
    c5b8:      	and	x0, x21, #0xf
    c5bc:      	lsr	w0, w0, #0
    c5c0:      	sxtw	x0, w0
    c5c4:      	cmp	x0, #0x1
    c5c8:      	b.lt	0xc6e0 <_stogir.conversion.policy+0x404>
    c5cc:      	and	x0, x21, #0xf
    c5d0:      	lsr	w0, w0, #0
    c5d4:      	sxtw	x0, w0
    c5d8:      	cmp	x0, #0xd
    c5dc:      	cset	w0, le
    c5e0:      	ubfx	x0, x0, #0, #8
    c5e4:      	b	0xc6e4 <_stogir.conversion.policy+0x408>
    c5e8:      	movz	x0, #0x0, lsl #48
    c5ec:      	b	0xc36c <_stogir.conversion.policy+0x90>
    c5f0:      	cmp	x21, #0x1
    c5f4:      	b.eq	0xc424 <_stogir.conversion.policy+0x148>
    c5f8:      	cmp	x21, #0x2
    c5fc:      	b.eq	0xc424 <_stogir.conversion.policy+0x148>
    c600:      	cmp	x21, #0x7
    c604:      	b.eq	0xc424 <_stogir.conversion.policy+0x148>
    c608:      	cmp	x21, #0x8
    c60c:      	b.eq	0xc424 <_stogir.conversion.policy+0x148>
    c610:      	cmp	x21, #0x3
    c614:      	b.eq	0xc7a4 <_stogir.conversion.policy+0x4c8>
    c618:      	cmp	x21, #0x9
    c61c:      	b.eq	0xc7a4 <_stogir.conversion.policy+0x4c8>
    c620:      	cmp	x21, #0x4
    c624:      	b.eq	0xc820 <_stogir.conversion.policy+0x544>
    c628:      	cmp	x21, #0xa
    c62c:      	b.eq	0xc820 <_stogir.conversion.policy+0x544>
    c630:      	uxtb	w16, w23
    c634:      	cmp	w16, wzr
    c638:      	b.ne	0xc820 <_stogir.conversion.policy+0x544>
    c63c:      	cmp	x21, #0x5
    c640:      	b.eq	0xc87c <_stogir.conversion.policy+0x5a0>
    c644:      	cmp	x21, #0xb
    c648:      	b.eq	0xc87c <_stogir.conversion.policy+0x5a0>
    c64c:      	uxtb	w16, w28
    c650:      	cmp	w16, wzr
    c654:      	b.ne	0xc87c <_stogir.conversion.policy+0x5a0>
    c658:      	cmp	x21, #0x6
    c65c:      	b.ne	0xc88c <_stogir.conversion.policy+0x5b0>
    c660:      	ldr	x0, [sp, #0x10]
    c664:      	b	0xc890 <_stogir.conversion.policy+0x5b4>
    c668:      	cmp	x20, #0x1
    c66c:      	b.eq	0xc3d4 <_stogir.conversion.policy+0xf8>
    c670:      	cmp	x20, #0x2
    c674:      	b.eq	0xc3d4 <_stogir.conversion.policy+0xf8>
    c678:      	cmp	x20, #0x7
    c67c:      	b.eq	0xc3d4 <_stogir.conversion.policy+0xf8>
    c680:      	cmp	x20, #0x8
    c684:      	b.eq	0xc3d4 <_stogir.conversion.policy+0xf8>
    c688:      	cmp	x20, #0x3
    c68c:      	b.eq	0xc7ac <_stogir.conversion.policy+0x4d0>
    c690:      	cmp	x20, #0x9
    c694:      	b.eq	0xc7ac <_stogir.conversion.policy+0x4d0>
    c698:      	cmp	x20, #0x4
    c69c:      	b.eq	0xc828 <_stogir.conversion.policy+0x54c>
    c6a0:      	cmp	x20, #0xa
    c6a4:      	b.eq	0xc828 <_stogir.conversion.policy+0x54c>
    c6a8:      	uxtb	w16, w24
    c6ac:      	cmp	w16, wzr
    c6b0:      	b.ne	0xc828 <_stogir.conversion.policy+0x54c>
    c6b4:      	cmp	x20, #0x5
    c6b8:      	b.eq	0xc884 <_stogir.conversion.policy+0x5a8>
    c6bc:      	cmp	x20, #0xb
    c6c0:      	b.eq	0xc884 <_stogir.conversion.policy+0x5a8>
    c6c4:      	uxtb	w16, w25
    c6c8:      	cmp	w16, wzr
    c6cc:      	b.ne	0xc884 <_stogir.conversion.policy+0x5a8>
    c6d0:      	cmp	x20, #0x6
    c6d4:      	b.ne	0xc894 <_stogir.conversion.policy+0x5b8>
    c6d8:      	ldr	x0, [sp, #0x10]
    c6dc:      	b	0xc898 <_stogir.conversion.policy+0x5bc>
    c6e0:      	movz	x0, #0x0, lsl #48
    c6e4:      	b	0xc5ec <_stogir.conversion.policy+0x310>
    c6e8:      	mov	x1, #0x1                ; =1
    c6ec:      	cmp	x1, #0x0
    c6f0:      	b.ne	0xc528 <_stogir.conversion.policy+0x24c>
    c6f4:      	cmp	x19, #0x23
    c6f8:      	b.eq	0xc70c <_stogir.conversion.policy+0x430>
    c6fc:      	uxtb	w16, w3
    c700:      	cmp	w16, wzr
    c704:      	b.ne	0xc70c <_stogir.conversion.policy+0x430>
    c708:      	mov	x0, x2
    c70c:      	and	x0, x0, #0xffffffff
    c710:      	mov	x1, x0
    c714:      	movz	x0, #0x0, lsl #48
    c718:      	movz	x2, #0x0, lsl #48
    c71c:      	b	0xc540 <_stogir.conversion.policy+0x264>
    c720:      	cmp	x19, #0x24
    c724:      	b.ne	0xc740 <_stogir.conversion.policy+0x464>
    c728:      	cmp	x2, x0
    c72c:      	cset	w1, eq
    c730:      	uxtb	w16, w1
    c734:      	cmp	w16, wzr
    c738:      	cset	x1, eq
    c73c:      	b	0xc6ec <_stogir.conversion.policy+0x410>
    c740:      	uxtb	w16, w4
    c744:      	cmp	w16, wzr
    c748:      	b.eq	0xc6e8 <_stogir.conversion.policy+0x40c>
    c74c:      	uxtb	w16, w5
    c750:      	cmp	w16, wzr
    c754:      	b.eq	0xc6e8 <_stogir.conversion.policy+0x40c>
    c758:      	uxtb	w16, w6
    c75c:      	cmp	w16, wzr
    c760:      	b.eq	0xc7e8 <_stogir.conversion.policy+0x50c>
    c764:      	uxtb	w16, w7
    c768:      	cmp	w16, wzr
    c76c:      	b.eq	0xc7e8 <_stogir.conversion.policy+0x50c>
    c770:      	cmp	x19, #0x23
    c774:      	b.ne	0xc858 <_stogir.conversion.policy+0x57c>
    c778:      	cmp	x0, x2
    c77c:      	cset	w1, ge
    c780:      	ubfx	x1, x1, #0, #8
    c784:      	b	0xc864 <_stogir.conversion.policy+0x588>
    c788:      	movz	x1, #0x0, lsl #48
    c78c:      	cmp	x1, #0x0
    c790:      	cset	w1, ne
    c794:      	uxtb	w16, w1
    c798:      	cmp	w16, wzr
    c79c:      	cset	x1, eq
    c7a0:      	b	0xc6ec <_stogir.conversion.policy+0x410>
    c7a4:      	mov	x0, #0x2                ; =2
    c7a8:      	b	0xc428 <_stogir.conversion.policy+0x14c>
    c7ac:      	mov	x0, #0x2                ; =2
    c7b0:      	b	0xc3d8 <_stogir.conversion.policy+0xfc>
    c7b4:      	movz	x1, #0x0, lsl #48
    c7b8:      	b	0xc78c <_stogir.conversion.policy+0x4b0>
    c7bc:      	uxtb	w16, w3
    c7c0:      	cmp	w16, wzr
    c7c4:      	b.eq	0xc7f8 <_stogir.conversion.policy+0x51c>
    c7c8:      	uxtb	w16, w25
    c7cc:      	cmp	w16, wzr
    c7d0:      	b.ne	0xc840 <_stogir.conversion.policy+0x564>
    c7d4:      	uxtb	w16, w24
    c7d8:      	cmp	w16, wzr
    c7dc:      	b.ne	0xc840 <_stogir.conversion.policy+0x564>
    c7e0:      	movz	x1, #0x0, lsl #48
    c7e4:      	b	0xc7f4 <_stogir.conversion.policy+0x518>
    c7e8:      	mov	x1, #0x1                ; =1
    c7ec:      	b	0xc6ec <_stogir.conversion.policy+0x410>
    c7f0:      	movz	x1, #0x0, lsl #48
    c7f4:      	b	0xc78c <_stogir.conversion.policy+0x4b0>
    c7f8:      	cmp	x19, #0x27
    c7fc:      	b.ne	0xc788 <_stogir.conversion.policy+0x4ac>
    c800:      	uxtb	w16, w25
    c804:      	cmp	w16, wzr
    c808:      	b.ne	0xc868 <_stogir.conversion.policy+0x58c>
    c80c:      	uxtb	w16, w24
    c810:      	cmp	w16, wzr
    c814:      	b.ne	0xc868 <_stogir.conversion.policy+0x58c>
    c818:      	movz	x1, #0x0, lsl #48
    c81c:      	b	0xc83c <_stogir.conversion.policy+0x560>
    c820:      	mov	x0, #0x4                ; =4
    c824:      	b	0xc7a8 <_stogir.conversion.policy+0x4cc>
    c828:      	mov	x0, #0x4                ; =4
    c82c:      	b	0xc7b0 <_stogir.conversion.policy+0x4d4>
    c830:      	mov	x1, x23
    c834:      	b	0xc7b8 <_stogir.conversion.policy+0x4dc>
    c838:      	mov	x1, x23
    c83c:      	b	0xc78c <_stogir.conversion.policy+0x4b0>
    c840:      	uxtb	w16, w6
    c844:      	cmp	w16, wzr
    c848:      	b.eq	0xc7f0 <_stogir.conversion.policy+0x514>
    c84c:      	ubfx	x7, x7, #0, #8
    c850:      	mov	x1, x7
    c854:      	b	0xc7f4 <_stogir.conversion.policy+0x518>
    c858:      	cmp	x0, x2
    c85c:      	cset	w1, le
    c860:      	ubfx	x1, x1, #0, #8
    c864:      	b	0xc7ec <_stogir.conversion.policy+0x510>
    c868:      	uxtb	w16, w28
    c86c:      	cmp	w16, wzr
    c870:      	b.eq	0xc838 <_stogir.conversion.policy+0x55c>
    c874:      	mov	x1, #0x1                ; =1
    c878:      	b	0xc83c <_stogir.conversion.policy+0x560>
    c87c:      	mov	x0, #0x8                ; =8
    c880:      	b	0xc824 <_stogir.conversion.policy+0x548>
    c884:      	mov	x0, #0x8                ; =8
    c888:      	b	0xc82c <_stogir.conversion.policy+0x550>
    c88c:      	movn	x0, #0x0, lsl #48
    c890:      	b	0xc880 <_stogir.conversion.policy+0x5a4>
    c894:      	movn	x0, #0x0, lsl #48
    c898:      	b	0xc888 <_stogir.conversion.policy+0x5ac>
    c89c:      	str	x8, [sp, #0x18]
    c8a0:      	mov	w28, w3
    c8a4:      	str	x23, [sp, #0x10]
    c8a8:      	mov	w23, w2
    c8ac:      	b	0xc508 <_stogir.conversion.policy+0x22c>
    c8b0:      	mov	x22, x0
    c8b4:      	mov	w23, w1
    c8b8:      	mov	w28, w2
    c8bc:      	b	0xc4e8 <_stogir.conversion.policy+0x20c>

000000000000c8c0 <_stogir.conditional.operands>:
    c8c0:      	sub	sp, sp, #0x70
    c8c4:      	str	x29, [sp]
    c8c8:      	str	x30, [sp, #0x8]
    c8cc:      	mov	x29, sp
    c8d0:      	str	x19, [sp, #0x30]
    c8d4:      	str	x20, [sp, #0x38]
    c8d8:      	str	x21, [sp, #0x40]
    c8dc:      	str	x22, [sp, #0x48]
    c8e0:      	str	x23, [sp, #0x50]
    c8e4:      	str	x24, [sp, #0x58]
    c8e8:      	str	x25, [sp, #0x60]
    c8ec:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000c8ec:  ARM64_RELOC_PAGE21	l_stogir.460
    c8f0:      	ldr	x16, [x16]
		000000000000c8f0:  ARM64_RELOC_PAGEOFF12	l_stogir.460
    c8f4:      	orr	x19, x16, xzr
    c8f8:      	sxtw	x20, w1
    c8fc:      	cmp	x20, #0x0
    c900:      	b.ne	0xc9e4 <_stogir.conditional.operands+0x124>
    c904:      	mov	x21, x8
    c908:      	mov	x22, x0
    c90c:      	mov	w23, w2
    c910:      	mov	w24, w3
    c914:      	mov	w25, w4
    c918:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000c918:  ARM64_RELOC_PAGE21	l_stogir.461
    c91c:      	ldr	x16, [x16]
		000000000000c91c:  ARM64_RELOC_PAGEOFF12	l_stogir.461
    c920:      	orr	x0, x16, xzr
    c924:      	mov	x1, #0x2b               ; =43
    c928:      	sxtw	x23, w23
    c92c:      	cmp	x23, #0x0
    c930:      	cset	w2, gt
    c934:      	movz	x16, #0x0, lsl #48
    c938:      	sub	x3, x16, x23
    c93c:      	sub	x4, x3, #0x1
    c940:      	uxtb	w16, w2
    c944:      	cmp	w16, wzr
    c948:      	b.eq	0xc998 <_stogir.conditional.operands+0xd8>
    c94c:      	ldr	x3, [x22, #0x8]
    c950:      	cmp	x23, x3
    c954:      	b.ge	0xca28 <_stogir.conditional.operands+0x168>
    c958:      	add	x3, x22, #0x78
    c95c:      	ldr	x3, [x3, #0x8]
    c960:      	cmp	x23, x3
    c964:      	b.ge	0xce30 <_stogir.conditional.operands+0x570>
    c968:      	lsl	x3, x23, #2
    c96c:      	ldr	x5, [x22, #0x78]
    c970:      	add	x3, x3, x5
    c974:      	ldr	w3, [x3]
    c978:      	sxtw	x3, w3
    c97c:      	cmp	x3, #0x0
    c980:      	cset	w3, ge
    c984:      	ubfx	x3, x3, #0, #8
    c988:      	fmov	d31, x0
    c98c:      	mov	x0, x3
    c990:      	fmov	x3, d31
    c994:      	b	0xce38 <_stogir.conditional.operands+0x578>
    c998:      	cmp	x23, #0x0
    c99c:      	b.ge	0xca38 <_stogir.conditional.operands+0x178>
    c9a0:      	add	x5, x22, #0x28
    c9a4:      	add	x6, x22, #0x50
    c9a8:      	ldr	x5, [x5, #0x8]
    c9ac:      	ldr	x6, [x6, #0x8]
    c9b0:      	cmp	x5, x6
    c9b4:      	b.ne	0xca18 <_stogir.conditional.operands+0x158>
    c9b8:      	cmp	x3, x5
    c9bc:      	b.gt	0xce90 <_stogir.conditional.operands+0x5d0>
    c9c0:      	lsl	x3, x4, #2
    c9c4:      	ldr	x5, [x22, #0x50]
    c9c8:      	add	x3, x3, x5
    c9cc:      	ldr	w3, [x3]
    c9d0:      	sxtw	x3, w3
    c9d4:      	cmp	x3, #0x0
    c9d8:      	cset	w3, gt
    c9dc:      	ubfx	x3, x3, #0, #8
    c9e0:      	b	0xce94 <_stogir.conditional.operands+0x5d4>
    c9e4:      	lsr	w1, w1, #0
    c9e8:      	mov	x21, x8
    c9ec:      	mov	x22, x0
    c9f0:      	mov	w0, w1
    c9f4:      	mov	w23, w2
    c9f8:      	mov	w24, w3
    c9fc:      	mov	w25, w4
    ca00:      	bl	0xca00 <_stogir.conditional.operands+0x140>
		000000000000ca00:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    ca04:      	cmp	x0, #0x0
    ca08:      	b.eq	0xc918 <_stogir.conditional.operands+0x58>
    ca0c:      	mov	x0, x19
    ca10:      	movz	x1, #0x0, lsl #48
    ca14:      	b	0xc928 <_stogir.conditional.operands+0x68>
    ca18:      	movz	x3, #0x0, lsl #48
    ca1c:      	b	0xca3c <_stogir.conditional.operands+0x17c>
    ca20:      	movz	x9, #0x0, lsl #48
    ca24:      	b	0xcafc <_stogir.conditional.operands+0x23c>
    ca28:      	mov	x3, x1
    ca2c:      	mov	x1, x0
    ca30:      	movz	x0, #0x0, lsl #48
    ca34:      	b	0xca4c <_stogir.conditional.operands+0x18c>
    ca38:      	movz	x3, #0x0, lsl #48
    ca3c:      	fmov	d31, x0
    ca40:      	mov	x0, x3
    ca44:      	mov	x3, x1
    ca48:      	fmov	x1, d31
    ca4c:      	cmp	x0, #0x0
    ca50:      	b.eq	0xca94 <_stogir.conditional.operands+0x1d4>
    ca54:      	uxtb	w16, w2
    ca58:      	cmp	w16, wzr
    ca5c:      	b.eq	0xca74 <_stogir.conditional.operands+0x1b4>
    ca60:      	lsl	x0, x23, #4
    ca64:      	ldr	x2, [x22]
    ca68:      	add	x0, x0, x2
    ca6c:      	ldr	x0, [x0]
    ca70:      	b	0xca84 <_stogir.conditional.operands+0x1c4>
    ca74:      	lsl	x0, x4, #4
    ca78:      	ldr	x2, [x22, #0x28]
    ca7c:      	add	x0, x0, x2
    ca80:      	ldr	x0, [x0]
    ca84:      	mov	x2, x1
    ca88:      	mov	x1, x0
    ca8c:      	mov	x0, #0x1                ; =1
    ca90:      	b	0xcaa0 <_stogir.conditional.operands+0x1e0>
    ca94:      	mov	x2, x1
    ca98:      	movz	x0, #0x0, lsl #48
    ca9c:      	movz	x1, #0x0, lsl #48
    caa0:      	lsr	w0, w0, #0
    caa4:      	lsr	x16, x0, #0
    caa8:      	cmp	x16, #0x1
    caac:      	b.eq	0xcac8 <_stogir.conditional.operands+0x208>
    cab0:      	b.lo	0xcab8 <_stogir.conditional.operands+0x1f8>
    cab4:      	b	0xcacc <_stogir.conditional.operands+0x20c>
    cab8:      	cmp	x16, #0x0
    cabc:      	b.eq	0xcac4 <_stogir.conditional.operands+0x204>
    cac0:      	b	0xcacc <_stogir.conditional.operands+0x20c>
    cac4:      	b	0xcad0 <_stogir.conditional.operands+0x210>
    cac8:      	b	0xce14 <_stogir.conditional.operands+0x554>
    cacc:      	b	0xcec0 <_stogir.conditional.operands+0x600>
    cad0:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000cad0:  ARM64_RELOC_PAGE21	l_stogir.462
    cad4:      	ldr	x16, [x16]
		000000000000cad4:  ARM64_RELOC_PAGEOFF12	l_stogir.462
    cad8:      	orr	x0, x16, xzr
    cadc:      	mov	x1, #0x16               ; =22
    cae0:      	b	0xcb08 <_stogir.conditional.operands+0x248>
    cae4:      	movz	x9, #0x0, lsl #48
    cae8:      	fmov	d31, x8
    caec:      	mov	x8, x9
    caf0:      	fmov	x9, d31
    caf4:      	b	0xcb74 <_stogir.conditional.operands+0x2b4>
    caf8:      	movz	x9, #0x0, lsl #48
    cafc:      	b	0xcb7c <_stogir.conditional.operands+0x2bc>
    cb00:      	mov	x0, x1
    cb04:      	mov	x1, x2
    cb08:      	add	x16, sp, #0x20
    cb0c:      	orr	x2, x16, xzr
    cb10:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000cb10:  ARM64_RELOC_PAGE21	l_stogir.463
    cb14:      	ldr	x16, [x16]
		000000000000cb14:  ARM64_RELOC_PAGEOFF12	l_stogir.463
    cb18:      	orr	x3, x16, xzr
    cb1c:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000cb1c:  ARM64_RELOC_PAGE21	l_stogir.464
    cb20:      	ldr	x16, [x16]
		000000000000cb20:  ARM64_RELOC_PAGEOFF12	l_stogir.464
    cb24:      	orr	x4, x16, xzr
    cb28:      	lsr	w24, w24, #0
    cb2c:      	lsr	w25, w25, #0
    cb30:      	add	x5, x22, #0x78
    cb34:      	add	x6, x22, #0x28
    cb38:      	add	x7, x22, #0x50
    cb3c:      	add	x16, sp, #0x10
    cb40:      	str	w24, [x16]
    cb44:      	add	x16, sp, #0x10
    cb48:      	str	w25, [x16, #0x4]
    cb4c:      	add	x16, sp, #0x10
    cb50:      	ldr	x8, [x16]
    cb54:      	add	x16, sp, #0x20
    cb58:      	str	x8, [x16]
    cb5c:      	mov	x8, x1
    cb60:      	mov	x1, x0
    cb64:      	movz	x0, #0x0, lsl #48
    cb68:      	b	0xcc48 <_stogir.conditional.operands+0x388>
    cb6c:      	mov	x9, x8
    cb70:      	movz	x8, #0x0, lsl #48
    cb74:      	b	0xcb88 <_stogir.conditional.operands+0x2c8>
    cb78:      	movz	x9, #0x0, lsl #48
    cb7c:      	fmov	d31, x8
    cb80:      	mov	x8, x9
    cb84:      	fmov	x9, d31
    cb88:      	cmp	x8, #0x0
    cb8c:      	b.eq	0xcbd0 <_stogir.conditional.operands+0x310>
    cb90:      	uxtb	w16, w0
    cb94:      	cmp	w16, wzr
    cb98:      	b.eq	0xcbb0 <_stogir.conditional.operands+0x2f0>
    cb9c:      	lsl	x0, x1, #4
    cba0:      	ldr	x1, [x22]
    cba4:      	add	x0, x0, x1
    cba8:      	ldr	x0, [x0]
    cbac:      	b	0xcbc0 <_stogir.conditional.operands+0x300>
    cbb0:      	lsl	x0, x10, #4
    cbb4:      	ldr	x1, [x22, #0x28]
    cbb8:      	add	x0, x0, x1
    cbbc:      	ldr	x0, [x0]
    cbc0:      	mov	x1, x0
    cbc4:      	mov	x8, x9
    cbc8:      	mov	x0, #0x1                ; =1
    cbcc:      	b	0xcbdc <_stogir.conditional.operands+0x31c>
    cbd0:      	mov	x8, x9
    cbd4:      	movz	x0, #0x0, lsl #48
    cbd8:      	movz	x1, #0x0, lsl #48
    cbdc:      	lsr	w0, w0, #0
    cbe0:      	lsr	x16, x0, #0
    cbe4:      	cmp	x16, #0x1
    cbe8:      	b.eq	0xcc04 <_stogir.conditional.operands+0x344>
    cbec:      	b.lo	0xcbf4 <_stogir.conditional.operands+0x334>
    cbf0:      	b	0xcc08 <_stogir.conditional.operands+0x348>
    cbf4:      	cmp	x16, #0x0
    cbf8:      	b.eq	0xcc00 <_stogir.conditional.operands+0x340>
    cbfc:      	b	0xcc08 <_stogir.conditional.operands+0x348>
    cc00:      	b	0xcc0c <_stogir.conditional.operands+0x34c>
    cc04:      	b	0xcde4 <_stogir.conditional.operands+0x524>
    cc08:      	b	0xceb8 <_stogir.conditional.operands+0x5f8>
    cc0c:      	mov	x0, x8
    cc10:      	mov	x1, x3
    cc14:      	mov	x8, #0x10               ; =16
    cc18:      	b	0xcc48 <_stogir.conditional.operands+0x388>
    cc1c:      	and	x0, x20, #0xffffffff
    cc20:      	mov	x1, x0
    cc24:      	movz	x0, #0x0, lsl #48
    cc28:      	movz	x2, #0x0, lsl #48
    cc2c:      	b	0xcd68 <_stogir.conditional.operands+0x4a8>
    cc30:      	mov	x0, x4
    cc34:      	mov	x1, #0x21               ; =33
    cc38:      	fmov	d31, x0
    cc3c:      	mov	x0, x8
    cc40:      	mov	x8, x1
    cc44:      	fmov	x1, d31
    cc48:      	cmp	x0, #0x2
    cc4c:      	b.ge	0xcc80 <_stogir.conditional.operands+0x3c0>
    cc50:      	add	x9, x0, #0x1
    cc54:      	lsl	x0, x0, #2
    cc58:      	add	x0, x0, x2
    cc5c:      	ldr	w0, [x0]
    cc60:      	sxtw	x0, w0
    cc64:      	and	x0, x0, #0xffffffff
    cc68:      	mov	x23, x1
    cc6c:      	mov	x1, x0
    cc70:      	mov	x24, x8
    cc74:      	mov	x8, x9
    cc78:      	mov	x0, #0x1                ; =1
    cc7c:      	b	0xcc94 <_stogir.conditional.operands+0x3d4>
    cc80:      	mov	x23, x1
    cc84:      	mov	x24, x8
    cc88:      	mov	x8, x0
    cc8c:      	movz	x0, #0x0, lsl #48
    cc90:      	movz	x1, #0x0, lsl #48
    cc94:      	lsr	w0, w0, #0
    cc98:      	lsr	x16, x0, #0
    cc9c:      	cmp	x16, #0x1
    cca0:      	b.eq	0xccbc <_stogir.conditional.operands+0x3fc>
    cca4:      	b.lo	0xccac <_stogir.conditional.operands+0x3ec>
    cca8:      	b	0xccc0 <_stogir.conditional.operands+0x400>
    ccac:      	cmp	x16, #0x0
    ccb0:      	b.eq	0xccb8 <_stogir.conditional.operands+0x3f8>
    ccb4:      	b	0xccc0 <_stogir.conditional.operands+0x400>
    ccb8:      	b	0xcd28 <_stogir.conditional.operands+0x468>
    ccbc:      	b	0xccc4 <_stogir.conditional.operands+0x404>
    ccc0:      	b	0xceb0 <_stogir.conditional.operands+0x5f0>
    ccc4:      	lsr	w1, w1, #0
    ccc8:      	sxtw	x1, w1
    cccc:      	cmp	x1, #0x0
    ccd0:      	cset	w0, gt
    ccd4:      	movz	x16, #0x0, lsl #48
    ccd8:      	sub	x9, x16, x1
    ccdc:      	sub	x10, x9, #0x1
    cce0:      	uxtb	w16, w0
    cce4:      	cmp	w16, wzr
    cce8:      	b.eq	0xcda0 <_stogir.conditional.operands+0x4e0>
    ccec:      	ldr	x9, [x22, #0x8]
    ccf0:      	cmp	x1, x9
    ccf4:      	b.ge	0xcb6c <_stogir.conditional.operands+0x2ac>
    ccf8:      	ldr	x9, [x5, #0x8]
    ccfc:      	cmp	x1, x9
    cd00:      	b.ge	0xcae4 <_stogir.conditional.operands+0x224>
    cd04:      	lsl	x9, x1, #2
    cd08:      	ldr	x11, [x22, #0x78]
    cd0c:      	add	x9, x9, x11
    cd10:      	ldr	w9, [x9]
    cd14:      	sxtw	x9, w9
    cd18:      	cmp	x9, #0x0
    cd1c:      	cset	w9, ge
    cd20:      	ubfx	x9, x9, #0, #8
    cd24:      	b	0xcae8 <_stogir.conditional.operands+0x228>
    cd28:      	cmp	x24, #0x0
    cd2c:      	b.ne	0xcd5c <_stogir.conditional.operands+0x49c>
    cd30:      	cmp	x24, #0x0
    cd34:      	b.eq	0xcc1c <_stogir.conditional.operands+0x35c>
    cd38:      	lsr	x0, x24, #0
    cd3c:      	mov	x1, x19
    cd40:      	mov	x2, x0
    cd44:      	mov	x0, x23
    cd48:      	bl	0xcd48 <_stogir.conditional.operands+0x488>
		000000000000cd48:  ARM64_RELOC_BRANCH26	_memcmp
    cd4c:      	lsr	w0, w0, #0
    cd50:      	sxtw	x0, w0
    cd54:      	cmp	x0, #0x0
    cd58:      	b.eq	0xcc1c <_stogir.conditional.operands+0x35c>
    cd5c:      	mov	x1, x23
    cd60:      	mov	x2, x24
    cd64:      	mov	x0, #0x1                ; =1
    cd68:      	str	x0, [x21]
    cd6c:      	str	x1, [x21, #0x8]
    cd70:      	str	x2, [x21, #0x10]
    cd74:      	ldr	x19, [sp, #0x30]
    cd78:      	ldr	x20, [sp, #0x38]
    cd7c:      	ldr	x21, [sp, #0x40]
    cd80:      	ldr	x22, [sp, #0x48]
    cd84:      	ldr	x23, [sp, #0x50]
    cd88:      	ldr	x24, [sp, #0x58]
    cd8c:      	ldr	x25, [sp, #0x60]
    cd90:      	ldr	x29, [sp]
    cd94:      	ldr	x30, [sp, #0x8]
    cd98:      	add	sp, sp, #0x70
    cd9c:      	ret
    cda0:      	cmp	x1, #0x0
    cda4:      	b.ge	0xcb78 <_stogir.conditional.operands+0x2b8>
    cda8:      	ldr	x11, [x6, #0x8]
    cdac:      	ldr	x12, [x7, #0x8]
    cdb0:      	cmp	x11, x12
    cdb4:      	b.ne	0xcaf8 <_stogir.conditional.operands+0x238>
    cdb8:      	cmp	x9, x11
    cdbc:      	b.gt	0xca20 <_stogir.conditional.operands+0x160>
    cdc0:      	lsl	x9, x10, #2
    cdc4:      	ldr	x11, [x22, #0x50]
    cdc8:      	add	x9, x9, x11
    cdcc:      	ldr	w9, [x9]
    cdd0:      	sxtw	x9, w9
    cdd4:      	cmp	x9, #0x0
    cdd8:      	cset	w9, gt
    cddc:      	ubfx	x9, x9, #0, #8
    cde0:      	b	0xca24 <_stogir.conditional.operands+0x164>
    cde4:      	uxtb	w0, w1
    cde8:      	cmp	x0, #0x48
    cdec:      	b.eq	0xcc30 <_stogir.conditional.operands+0x370>
    cdf0:      	cmp	x0, #0x46
    cdf4:      	b.eq	0xcc30 <_stogir.conditional.operands+0x370>
    cdf8:      	lsr	w1, w1, #0
    cdfc:      	ubfx	x0, x1, #8, #8
    ce00:      	cmp	x0, x20
    ce04:      	b.ne	0xcc30 <_stogir.conditional.operands+0x370>
    ce08:      	mov	x0, x23
    ce0c:      	mov	x1, x24
    ce10:      	b	0xcc38 <_stogir.conditional.operands+0x378>
    ce14:      	uxtb	w0, w1
    ce18:      	cmp	x0, #0x48
    ce1c:      	b.ne	0xce80 <_stogir.conditional.operands+0x5c0>
    ce20:      	mov	x1, x2
    ce24:      	mov	x2, x3
    ce28:      	mov	x0, #0x1                ; =1
    ce2c:      	b	0xce64 <_stogir.conditional.operands+0x5a4>
    ce30:      	mov	x3, x0
    ce34:      	movz	x0, #0x0, lsl #48
    ce38:      	fmov	d31, x1
    ce3c:      	mov	x1, x3
    ce40:      	fmov	x3, d31
    ce44:      	b	0xca34 <_stogir.conditional.operands+0x174>
    ce48:      	cmp	x0, #0xd
    ce4c:      	cset	w0, le
    ce50:      	uxtb	w16, w0
    ce54:      	cmp	w16, wzr
    ce58:      	cset	x0, eq
    ce5c:      	mov	x1, x2
    ce60:      	mov	x2, x3
    ce64:      	cmp	x0, #0x0
    ce68:      	b.eq	0xcb00 <_stogir.conditional.operands+0x240>
    ce6c:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000ce6c:  ARM64_RELOC_PAGE21	l_stogir.465
    ce70:      	ldr	x16, [x16]
		000000000000ce70:  ARM64_RELOC_PAGEOFF12	l_stogir.465
    ce74:      	orr	x0, x16, xzr
    ce78:      	mov	x1, #0x2a               ; =42
    ce7c:      	b	0xcb08 <_stogir.conditional.operands+0x248>
    ce80:      	cmp	x0, #0x46
    ce84:      	b.ne	0xce98 <_stogir.conditional.operands+0x5d8>
    ce88:      	mov	x0, #0x1                ; =1
    ce8c:      	b	0xce5c <_stogir.conditional.operands+0x59c>
    ce90:      	movz	x3, #0x0, lsl #48
    ce94:      	b	0xca1c <_stogir.conditional.operands+0x15c>
    ce98:      	lsr	w1, w1, #0
    ce9c:      	ubfx	x0, x1, #8, #8
    cea0:      	cmp	x0, #0x0
    cea4:      	b.ne	0xce48 <_stogir.conditional.operands+0x588>
    cea8:      	mov	x0, #0x1                ; =1
    ceac:      	b	0xce5c <_stogir.conditional.operands+0x59c>
    ceb0:      	brk	#0
    ceb4:      	b	0xceb0 <_stogir.conditional.operands+0x5f0>
    ceb8:      	brk	#0
    cebc:      	b	0xceb8 <_stogir.conditional.operands+0x5f8>
    cec0:      	brk	#0
    cec4:      	b	0xcec0 <_stogir.conditional.operands+0x600>

000000000000cec8 <_stogir.floating.unary?>:
    cec8:      	sxtw	x0, w0
    cecc:      	cmp	x0, #0x1f
    ced0:      	b.ne	0xcedc <_stogir.floating.unary?+0x14>
    ced4:      	mov	x0, #0x1                ; =1
    ced8:      	b	0xcee8 <_stogir.floating.unary?+0x20>
    cedc:      	cmp	x0, #0x20
    cee0:      	cset	w0, eq
    cee4:      	ubfx	x0, x0, #0, #8
    cee8:      	ret

000000000000ceec <_stogir.floating.comparison?>:
    ceec:      	sxtw	x0, w0
    cef0:      	cmp	x0, #0xe
    cef4:      	b.lt	0xcf08 <_stogir.floating.comparison?+0x1c>
    cef8:      	cmp	x0, #0x19
    cefc:      	cset	w0, le
    cf00:      	ubfx	x0, x0, #0, #8
    cf04:      	b	0xcf0c <_stogir.floating.comparison?+0x20>
    cf08:      	movz	x0, #0x0, lsl #48
    cf0c:      	ret

000000000000cf10 <_stogir.floating.operands>:
    cf10:      	sub	sp, sp, #0x90
    cf14:      	str	x29, [sp]
    cf18:      	str	x30, [sp, #0x8]
    cf1c:      	mov	x29, sp
    cf20:      	str	x19, [sp, #0x60]
    cf24:      	str	x20, [sp, #0x68]
    cf28:      	str	x21, [sp, #0x70]
    cf2c:      	str	x22, [sp, #0x78]
    cf30:      	str	x23, [sp, #0x80]
    cf34:      	str	x24, [sp, #0x88]
    cf38:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000cf38:  ARM64_RELOC_PAGE21	l_stogir.466
    cf3c:      	ldr	x16, [x16]
		000000000000cf3c:  ARM64_RELOC_PAGEOFF12	l_stogir.466
    cf40:      	orr	x19, x16, xzr
    cf44:      	sxtw	x1, w1
    cf48:      	sxtw	x20, w2
    cf4c:      	cmp	x1, #0x1f
    cf50:      	cset	w2, eq
    cf54:      	cmp	x1, #0x20
    cf58:      	cset	w6, eq
    cf5c:      	cmp	x1, #0xe
    cf60:      	b.lt	0xcf9c <_stogir.floating.operands+0x8c>
    cf64:      	cmp	x1, #0x19
    cf68:      	b.gt	0xcf9c <_stogir.floating.operands+0x8c>
    cf6c:      	cmp	x20, #0xc
    cf70:      	b.ne	0xcf7c <_stogir.floating.operands+0x6c>
    cf74:      	mov	x7, #0x1                ; =1
    cf78:      	b	0xcf88 <_stogir.floating.operands+0x78>
    cf7c:      	cmp	x20, #0xd
    cf80:      	cset	w7, eq
    cf84:      	ubfx	x7, x7, #0, #8
    cf88:      	cmp	x7, #0x0
    cf8c:      	b.eq	0xcfd4 <_stogir.floating.operands+0xc4>
    cf90:      	mov	x7, x19
    cf94:      	movz	x9, #0x0, lsl #48
    cf98:      	b	0xcfe4 <_stogir.floating.operands+0xd4>
    cf9c:      	uxtb	w16, w2
    cfa0:      	cmp	w16, wzr
    cfa4:      	b.ne	0xcf6c <_stogir.floating.operands+0x5c>
    cfa8:      	uxtb	w16, w6
    cfac:      	cmp	w16, wzr
    cfb0:      	b.ne	0xcf6c <_stogir.floating.operands+0x5c>
    cfb4:      	cmp	x1, #0x1a
    cfb8:      	b.lt	0xcfc4 <_stogir.floating.operands+0xb4>
    cfbc:      	cmp	x1, #0x1d
    cfc0:      	b.le	0xcf6c <_stogir.floating.operands+0x5c>
    cfc4:      	cmp	x1, #0x3a
    cfc8:      	b.eq	0xcf6c <_stogir.floating.operands+0x5c>
    cfcc:      	cmp	x1, #0x3b
    cfd0:      	b.eq	0xcf6c <_stogir.floating.operands+0x5c>
    cfd4:      	adrp	x16, 0xc000 <_stogir.locals.shape+0x2c4>
		000000000000cfd4:  ARM64_RELOC_PAGE21	l_stogir.467
    cfd8:      	ldr	x16, [x16]
		000000000000cfd8:  ARM64_RELOC_PAGEOFF12	l_stogir.467
    cfdc:      	orr	x7, x16, xzr
    cfe0:      	mov	x9, #0x22               ; =34
    cfe4:      	lsr	w3, w3, #0
    cfe8:      	add	x16, sp, #0x10
    cfec:      	str	w3, [x16]
    cff0:      	uxtb	w16, w2
    cff4:      	cmp	w16, wzr
    cff8:      	b.eq	0xd008 <_stogir.floating.operands+0xf8>
    cffc:      	mov	x6, x7
    d000:      	mov	x2, #0x1                ; =1
    d004:      	b	0xd014 <_stogir.floating.operands+0x104>
    d008:      	ubfx	x6, x6, #0, #8
    d00c:      	mov	x2, x6
    d010:      	mov	x6, x7
    d014:      	cmp	x2, #0x0
    d018:      	b.eq	0xd054 <_stogir.floating.operands+0x144>
    d01c:      	sxtw	x3, w3
    d020:      	mov	x2, x3
    d024:      	mov	x3, x6
    d028:      	b	0xd060 <_stogir.floating.operands+0x150>
    d02c:      	mov	x0, x1
    d030:      	mov	x1, x2
    d034:      	b	0xd19c <_stogir.floating.operands+0x28c>
    d038:      	movz	x15, #0x0, lsl #48
    d03c:      	fmov	d31, x9
    d040:      	mov	x9, x15
    d044:      	fmov	x15, d31
    d048:      	b	0xd0b8 <_stogir.floating.operands+0x1a8>
    d04c:      	movz	x15, #0x0, lsl #48
    d050:      	b	0xd0c0 <_stogir.floating.operands+0x1b0>
    d054:      	sxtw	x4, w4
    d058:      	mov	x2, x4
    d05c:      	mov	x3, x6
    d060:      	add	x16, sp, #0x20
    d064:      	orr	x4, x16, xzr
    d068:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d068:  ARM64_RELOC_PAGE21	l_stogir.468
    d06c:      	ldr	x16, [x16]
		000000000000d06c:  ARM64_RELOC_PAGEOFF12	l_stogir.468
    d070:      	orr	x6, x16, xzr
    d074:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d074:  ARM64_RELOC_PAGE21	l_stogir.469
    d078:      	ldr	x16, [x16]
		000000000000d078:  ARM64_RELOC_PAGEOFF12	l_stogir.469
    d07c:      	orr	x7, x16, xzr
    d080:      	add	x10, x0, #0x78
    d084:      	add	x11, x0, #0x28
    d088:      	add	x12, x0, #0x50
    d08c:      	lsr	w2, w2, #0
    d090:      	add	x16, sp, #0x10
    d094:      	str	w2, [x16, #0x4]
    d098:      	add	x16, sp, #0x10
    d09c:      	ldr	x2, [x16]
    d0a0:      	add	x16, sp, #0x20
    d0a4:      	str	x2, [x16]
    d0a8:      	movz	x2, #0x0, lsl #48
    d0ac:      	b	0xd1c0 <_stogir.floating.operands+0x2b0>
    d0b0:      	mov	x15, x9
    d0b4:      	movz	x9, #0x0, lsl #48
    d0b8:      	b	0xd0cc <_stogir.floating.operands+0x1bc>
    d0bc:      	movz	x15, #0x0, lsl #48
    d0c0:      	fmov	d31, x9
    d0c4:      	mov	x9, x15
    d0c8:      	fmov	x15, d31
    d0cc:      	cmp	x9, #0x0
    d0d0:      	b.eq	0xd114 <_stogir.floating.operands+0x204>
    d0d4:      	uxtb	w16, w2
    d0d8:      	cmp	w16, wzr
    d0dc:      	b.eq	0xd0f4 <_stogir.floating.operands+0x1e4>
    d0e0:      	lsl	x2, x3, #4
    d0e4:      	ldr	x3, [x0]
    d0e8:      	add	x2, x2, x3
    d0ec:      	ldr	x2, [x2]
    d0f0:      	b	0xd104 <_stogir.floating.operands+0x1f4>
    d0f4:      	lsl	x2, x21, #4
    d0f8:      	ldr	x3, [x0, #0x28]
    d0fc:      	add	x2, x2, x3
    d100:      	ldr	x2, [x2]
    d104:      	mov	x3, x2
    d108:      	mov	x9, x15
    d10c:      	mov	x2, #0x1                ; =1
    d110:      	b	0xd120 <_stogir.floating.operands+0x210>
    d114:      	mov	x9, x15
    d118:      	movz	x2, #0x0, lsl #48
    d11c:      	movz	x3, #0x0, lsl #48
    d120:      	lsr	w2, w2, #0
    d124:      	lsr	x16, x2, #0
    d128:      	cmp	x16, #0x1
    d12c:      	b.eq	0xd148 <_stogir.floating.operands+0x238>
    d130:      	b.lo	0xd138 <_stogir.floating.operands+0x228>
    d134:      	b	0xd14c <_stogir.floating.operands+0x23c>
    d138:      	cmp	x16, #0x0
    d13c:      	b.eq	0xd144 <_stogir.floating.operands+0x234>
    d140:      	b	0xd14c <_stogir.floating.operands+0x23c>
    d144:      	b	0xd150 <_stogir.floating.operands+0x240>
    d148:      	b	0xd3a8 <_stogir.floating.operands+0x498>
    d14c:      	b	0xd4e0 <_stogir.floating.operands+0x5d0>
    d150:      	mov	x2, x9
    d154:      	mov	x3, x6
    d158:      	mov	x9, #0x18               ; =24
    d15c:      	b	0xd1c0 <_stogir.floating.operands+0x2b0>
    d160:      	and	x0, x20, #0xffffffff
    d164:      	mov	x1, x0
    d168:      	movz	x0, #0x0, lsl #48
    d16c:      	movz	x2, #0x0, lsl #48
    d170:      	b	0xd330 <_stogir.floating.operands+0x420>
    d174:      	mov	x22, x3
    d178:      	mov	x23, x4
    d17c:      	mov	x1, #0x1                ; =1
    d180:      	cmp	x1, #0x0
    d184:      	b.eq	0xd3c4 <_stogir.floating.operands+0x4b4>
    d188:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d188:  ARM64_RELOC_PAGE21	l_stogir.470
    d18c:      	ldr	x16, [x16]
		000000000000d18c:  ARM64_RELOC_PAGEOFF12	l_stogir.470
    d190:      	orr	x0, x16, xzr
    d194:      	mov	x24, x8
    d198:      	mov	x1, #0x21               ; =33
    d19c:      	mov	x21, x0
    d1a0:      	mov	x22, x1
    d1a4:      	b	0xd2f0 <_stogir.floating.operands+0x3e0>
    d1a8:      	mov	x2, x7
    d1ac:      	mov	x3, #0x1e               ; =30
    d1b0:      	fmov	d31, x2
    d1b4:      	mov	x2, x9
    d1b8:      	mov	x9, x3
    d1bc:      	fmov	x3, d31
    d1c0:      	cmp	x2, #0x2
    d1c4:      	b.ge	0xd1f8 <_stogir.floating.operands+0x2e8>
    d1c8:      	add	x13, x2, #0x1
    d1cc:      	lsl	x2, x2, #2
    d1d0:      	add	x2, x2, x4
    d1d4:      	ldr	w2, [x2]
    d1d8:      	sxtw	x2, w2
    d1dc:      	and	x2, x2, #0xffffffff
    d1e0:      	mov	x14, x9
    d1e4:      	mov	x9, x13
    d1e8:      	mov	x13, x3
    d1ec:      	mov	x3, x2
    d1f0:      	mov	x2, #0x1                ; =1
    d1f4:      	b	0xd20c <_stogir.floating.operands+0x2fc>
    d1f8:      	mov	x13, x3
    d1fc:      	mov	x14, x9
    d200:      	mov	x9, x2
    d204:      	movz	x2, #0x0, lsl #48
    d208:      	movz	x3, #0x0, lsl #48
    d20c:      	lsr	w2, w2, #0
    d210:      	lsr	x16, x2, #0
    d214:      	cmp	x16, #0x1
    d218:      	b.eq	0xd234 <_stogir.floating.operands+0x324>
    d21c:      	b.lo	0xd224 <_stogir.floating.operands+0x314>
    d220:      	b	0xd238 <_stogir.floating.operands+0x328>
    d224:      	cmp	x16, #0x0
    d228:      	b.eq	0xd230 <_stogir.floating.operands+0x320>
    d22c:      	b	0xd238 <_stogir.floating.operands+0x328>
    d230:      	b	0xd2a0 <_stogir.floating.operands+0x390>
    d234:      	b	0xd23c <_stogir.floating.operands+0x32c>
    d238:      	b	0xd494 <_stogir.floating.operands+0x584>
    d23c:      	lsr	w3, w3, #0
    d240:      	sxtw	x3, w3
    d244:      	cmp	x3, #0x0
    d248:      	cset	w2, gt
    d24c:      	movz	x16, #0x0, lsl #48
    d250:      	sub	x15, x16, x3
    d254:      	sub	x21, x15, #0x1
    d258:      	uxtb	w16, w2
    d25c:      	cmp	w16, wzr
    d260:      	b.eq	0xd364 <_stogir.floating.operands+0x454>
    d264:      	ldr	x15, [x0, #0x8]
    d268:      	cmp	x3, x15
    d26c:      	b.ge	0xd0b0 <_stogir.floating.operands+0x1a0>
    d270:      	ldr	x15, [x10, #0x8]
    d274:      	cmp	x3, x15
    d278:      	b.ge	0xd038 <_stogir.floating.operands+0x128>
    d27c:      	lsl	x15, x3, #2
    d280:      	ldr	x22, [x0, #0x78]
    d284:      	add	x15, x15, x22
    d288:      	ldr	w15, [x15]
    d28c:      	sxtw	x15, w15
    d290:      	cmp	x15, #0x0
    d294:      	cset	w15, ge
    d298:      	ubfx	x15, x15, #0, #8
    d29c:      	b	0xd03c <_stogir.floating.operands+0x12c>
    d2a0:      	sxtw	x21, w5
    d2a4:      	cmp	x21, #0x0
    d2a8:      	b.ne	0xd2bc <_stogir.floating.operands+0x3ac>
    d2ac:      	mov	x3, x13
    d2b0:      	mov	x4, x14
    d2b4:      	movz	x2, #0x0, lsl #48
    d2b8:      	b	0xd2c8 <_stogir.floating.operands+0x3b8>
    d2bc:      	mov	x3, x13
    d2c0:      	mov	x4, x14
    d2c4:      	mov	x2, #0x1                ; =1
    d2c8:      	cmp	x2, #0x0
    d2cc:      	b.eq	0xd4f0 <_stogir.floating.operands+0x5e0>
    d2d0:      	cmp	x1, #0x1d
    d2d4:      	b.ne	0xd174 <_stogir.floating.operands+0x264>
    d2d8:      	mov	x22, x3
    d2dc:      	mov	x23, x4
    d2e0:      	movz	x1, #0x0, lsl #48
    d2e4:      	b	0xd180 <_stogir.floating.operands+0x270>
    d2e8:      	mov	x21, x3
    d2ec:      	mov	x22, x4
    d2f0:      	cmp	x22, #0x0
    d2f4:      	b.ne	0xd324 <_stogir.floating.operands+0x414>
    d2f8:      	cmp	x22, #0x0
    d2fc:      	b.eq	0xd160 <_stogir.floating.operands+0x250>
    d300:      	lsr	x0, x22, #0
    d304:      	mov	x1, x19
    d308:      	mov	x2, x0
    d30c:      	mov	x0, x21
    d310:      	bl	0xd310 <_stogir.floating.operands+0x400>
		000000000000d310:  ARM64_RELOC_BRANCH26	_memcmp
    d314:      	lsr	w0, w0, #0
    d318:      	sxtw	x0, w0
    d31c:      	cmp	x0, #0x0
    d320:      	b.eq	0xd160 <_stogir.floating.operands+0x250>
    d324:      	mov	x1, x21
    d328:      	mov	x2, x22
    d32c:      	mov	x0, #0x1                ; =1
    d330:      	str	x0, [x24]
    d334:      	str	x1, [x24, #0x8]
    d338:      	str	x2, [x24, #0x10]
    d33c:      	ldr	x19, [sp, #0x60]
    d340:      	ldr	x20, [sp, #0x68]
    d344:      	ldr	x21, [sp, #0x70]
    d348:      	ldr	x22, [sp, #0x78]
    d34c:      	ldr	x23, [sp, #0x80]
    d350:      	ldr	x24, [sp, #0x88]
    d354:      	ldr	x29, [sp]
    d358:      	ldr	x30, [sp, #0x8]
    d35c:      	add	sp, sp, #0x90
    d360:      	ret
    d364:      	cmp	x3, #0x0
    d368:      	b.ge	0xd0bc <_stogir.floating.operands+0x1ac>
    d36c:      	ldr	x22, [x11, #0x8]
    d370:      	ldr	x23, [x12, #0x8]
    d374:      	cmp	x22, x23
    d378:      	b.ne	0xd04c <_stogir.floating.operands+0x13c>
    d37c:      	cmp	x15, x22
    d380:      	b.gt	0xd420 <_stogir.floating.operands+0x510>
    d384:      	lsl	x15, x21, #2
    d388:      	ldr	x22, [x0, #0x50]
    d38c:      	add	x15, x15, x22
    d390:      	ldr	w15, [x15]
    d394:      	sxtw	x15, w15
    d398:      	cmp	x15, #0x0
    d39c:      	cset	w15, gt
    d3a0:      	ubfx	x15, x15, #0, #8
    d3a4:      	b	0xd424 <_stogir.floating.operands+0x514>
    d3a8:      	lsr	w3, w3, #0
    d3ac:      	ubfx	x2, x3, #8, #8
    d3b0:      	cmp	x2, x20
    d3b4:      	b.ne	0xd1a8 <_stogir.floating.operands+0x298>
    d3b8:      	mov	x2, x13
    d3bc:      	mov	x3, x14
    d3c0:      	b	0xd1b0 <_stogir.floating.operands+0x2a0>
    d3c4:      	lsr	w5, w5, #0
    d3c8:      	mov	w1, w5
    d3cc:      	mov	x24, x8
    d3d0:      	add	x8, sp, #0x30
    d3d4:      	bl	0xd3d4 <_stogir.floating.operands+0x4c4>
		000000000000d3d4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    d3d8:      	add	x16, sp, #0x30
    d3dc:      	ldr	w0, [x16]
    d3e0:      	lsr	x16, x0, #0
    d3e4:      	cmp	x16, #0x1
    d3e8:      	b.eq	0xd404 <_stogir.floating.operands+0x4f4>
    d3ec:      	b.lo	0xd3f4 <_stogir.floating.operands+0x4e4>
    d3f0:      	b	0xd408 <_stogir.floating.operands+0x4f8>
    d3f4:      	cmp	x16, #0x0
    d3f8:      	b.eq	0xd400 <_stogir.floating.operands+0x4f0>
    d3fc:      	b	0xd408 <_stogir.floating.operands+0x4f8>
    d400:      	b	0xd40c <_stogir.floating.operands+0x4fc>
    d404:      	b	0xd428 <_stogir.floating.operands+0x518>
    d408:      	b	0xd4e8 <_stogir.floating.operands+0x5d8>
    d40c:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d40c:  ARM64_RELOC_PAGE21	l_stogir.471
    d410:      	ldr	x16, [x16]
		000000000000d410:  ARM64_RELOC_PAGEOFF12	l_stogir.471
    d414:      	orr	x0, x16, xzr
    d418:      	mov	x1, #0x16               ; =22
    d41c:      	b	0xd034 <_stogir.floating.operands+0x124>
    d420:      	movz	x15, #0x0, lsl #48
    d424:      	b	0xd050 <_stogir.floating.operands+0x140>
    d428:      	add	x16, sp, #0x30
    d42c:      	ldr	x0, [x16, #0x8]
    d430:      	cmp	x21, #0x0
    d434:      	b.ge	0xd470 <_stogir.floating.operands+0x560>
    d438:      	mov	x1, x22
    d43c:      	mov	x2, x23
    d440:      	mov	x0, #0x1                ; =1
    d444:      	b	0xd454 <_stogir.floating.operands+0x544>
    d448:      	movz	x0, #0x0, lsl #48
    d44c:      	mov	x1, x22
    d450:      	mov	x2, x23
    d454:      	cmp	x0, #0x0
    d458:      	b.eq	0xd02c <_stogir.floating.operands+0x11c>
    d45c:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d45c:  ARM64_RELOC_PAGE21	l_stogir.472
    d460:      	ldr	x16, [x16]
		000000000000d460:  ARM64_RELOC_PAGEOFF12	l_stogir.472
    d464:      	orr	x0, x16, xzr
    d468:      	mov	x1, #0x2d               ; =45
    d46c:      	b	0xd034 <_stogir.floating.operands+0x124>
    d470:      	uxtb	w0, w0
    d474:      	cmp	x0, #0x83
    d478:      	b.ge	0xd49c <_stogir.floating.operands+0x58c>
    d47c:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d47c:  ARM64_RELOC_PAGE21	l_stogir.473
    d480:      	ldr	x16, [x16]
		000000000000d480:  ARM64_RELOC_PAGEOFF12	l_stogir.473
    d484:      	orr	x1, x16, xzr
    d488:      	add	x1, x0, x1
    d48c:      	ldrb	w1, [x1]
    d490:      	b	0xd4a0 <_stogir.floating.operands+0x590>
    d494:      	brk	#0
    d498:      	b	0xd494 <_stogir.floating.operands+0x584>
    d49c:      	movz	x1, #0x0, lsl #48
    d4a0:      	uxtb	w1, w1
    d4a4:      	and	x1, x1, #0x2
    d4a8:      	uxtb	w1, w1
    d4ac:      	cmp	x1, #0x0
    d4b0:      	cset	w1, eq
    d4b4:      	uxtb	w16, w1
    d4b8:      	cmp	w16, wzr
    d4bc:      	cset	x1, eq
    d4c0:      	cmp	x1, #0x0
    d4c4:      	b.ne	0xd448 <_stogir.floating.operands+0x538>
    d4c8:      	cmp	x0, #0x65
    d4cc:      	b.eq	0xd448 <_stogir.floating.operands+0x538>
    d4d0:      	cmp	x0, #0x66
    d4d4:      	b.eq	0xd448 <_stogir.floating.operands+0x538>
    d4d8:      	mov	x0, #0x1                ; =1
    d4dc:      	b	0xd44c <_stogir.floating.operands+0x53c>
    d4e0:      	brk	#0
    d4e4:      	b	0xd4e0 <_stogir.floating.operands+0x5d0>
    d4e8:      	brk	#0
    d4ec:      	b	0xd4e8 <_stogir.floating.operands+0x5d8>
    d4f0:      	mov	x24, x8
    d4f4:      	b	0xd2e8 <_stogir.floating.operands+0x3d8>

000000000000d4f8 <_stogir.types.signed?>:
    d4f8:      	sxtw	x0, w0
    d4fc:      	cmp	x0, #0x7
    d500:      	b.lt	0xd514 <_stogir.types.signed?+0x1c>
    d504:      	cmp	x0, #0xb
    d508:      	cset	w0, le
    d50c:      	ubfx	x0, x0, #0, #8
    d510:      	b	0xd518 <_stogir.types.signed?+0x20>
    d514:      	movz	x0, #0x0, lsl #48
    d518:      	ret

000000000000d51c <_stogir.integer-binary.logical?>:
    d51c:      	sxtw	x0, w0
    d520:      	cmp	x0, #0x2e
    d524:      	b.ne	0xd540 <_stogir.integer-binary.logical?+0x24>
    d528:      	mov	x0, #0x1                ; =1
    d52c:      	b	0xd53c <_stogir.integer-binary.logical?+0x20>
    d530:      	cmp	x0, #0x30
    d534:      	cset	w0, eq
    d538:      	ubfx	x0, x0, #0, #8
    d53c:      	ret
    d540:      	cmp	x0, #0x2f
    d544:      	b.ne	0xd530 <_stogir.integer-binary.logical?+0x14>
    d548:      	mov	x0, #0x1                ; =1
    d54c:      	b	0xd53c <_stogir.integer-binary.logical?+0x20>

000000000000d550 <_inherent$slice$data__i8>:
    d550:      	ret

000000000000d554 <_inherent$slice$data__u32>:
    d554:      	ret

000000000000d558 <_inherent$coil.arraylist.ArrayList$slice__stogir.node.Node>:
    d558:      	sub	sp, sp, #0x10
    d55c:      	mov	x1, sp
    d560:      	ldr	x2, [x0]
    d564:      	ldr	x0, [x0, #0x8]
    d568:      	str	x2, [x1]
    d56c:      	str	x0, [x1, #0x8]
    d570:      	ldr	x0, [sp]
    d574:      	ldr	x1, [sp, #0x8]
    d578:      	add	sp, sp, #0x10
    d57c:      	ret

000000000000d580 <_inherent$slice$at__stogir.node.Node>:
    d580:      	lsl	x1, x2, #4
    d584:      	add	x0, x1, x0
    d588:      	ret

000000000000d58c <_inherent$slice$new__u8>:
    d58c:      	sub	sp, sp, #0x10
    d590:      	mov	x2, sp
    d594:      	str	x0, [x2]
    d598:      	str	x1, [x2, #0x8]
    d59c:      	ldr	x0, [sp]
    d5a0:      	ldr	x1, [sp, #0x8]
    d5a4:      	add	sp, sp, #0x10
    d5a8:      	ret

000000000000d5ac <_stogir.vector-lanes.operands>:
    d5ac:      	sub	sp, sp, #0x120
    d5b0:      	str	x29, [sp]
    d5b4:      	str	x30, [sp, #0x8]
    d5b8:      	mov	x29, sp
    d5bc:      	str	x19, [sp, #0xc8]
    d5c0:      	str	x20, [sp, #0xd0]
    d5c4:      	str	x21, [sp, #0xd8]
    d5c8:      	str	x22, [sp, #0xe0]
    d5cc:      	str	x23, [sp, #0xe8]
    d5d0:      	str	x24, [sp, #0xf0]
    d5d4:      	str	x25, [sp, #0xf8]
    d5d8:      	str	x26, [sp, #0x100]
    d5dc:      	str	x27, [sp, #0x108]
    d5e0:      	str	x28, [sp, #0x110]
    d5e4:      	sxtw	x4, w4
    d5e8:      	cmp	x4, #0x0
    d5ec:      	cset	w7, gt
    d5f0:      	movz	x16, #0x0, lsl #48
    d5f4:      	sub	x9, x16, x4
    d5f8:      	sub	x10, x9, #0x1
    d5fc:      	uxtb	w16, w7
    d600:      	cmp	w16, wzr
    d604:      	b.eq	0xd648 <_stogir.vector-lanes.operands+0x9c>
    d608:      	ldr	x9, [x0, #0x8]
    d60c:      	cmp	x4, x9
    d610:      	b.ge	0xd6fc <_stogir.vector-lanes.operands+0x150>
    d614:      	add	x9, x0, #0x78
    d618:      	ldr	x9, [x9, #0x8]
    d61c:      	cmp	x4, x9
    d620:      	b.ge	0xd80c <_stogir.vector-lanes.operands+0x260>
    d624:      	lsl	x9, x4, #2
    d628:      	ldr	x11, [x0, #0x78]
    d62c:      	add	x9, x9, x11
    d630:      	ldr	w9, [x9]
    d634:      	sxtw	x9, w9
    d638:      	cmp	x9, #0x0
    d63c:      	cset	w9, ge
    d640:      	ubfx	x9, x9, #0, #8
    d644:      	b	0xd810 <_stogir.vector-lanes.operands+0x264>
    d648:      	cmp	x4, #0x0
    d64c:      	b.ge	0xd704 <_stogir.vector-lanes.operands+0x158>
    d650:      	add	x11, x0, #0x28
    d654:      	add	x12, x0, #0x50
    d658:      	ldr	x11, [x11, #0x8]
    d65c:      	ldr	x12, [x12, #0x8]
    d660:      	cmp	x11, x12
    d664:      	b.ne	0xd694 <_stogir.vector-lanes.operands+0xe8>
    d668:      	cmp	x9, x11
    d66c:      	b.gt	0xd988 <_stogir.vector-lanes.operands+0x3dc>
    d670:      	lsl	x9, x10, #2
    d674:      	ldr	x11, [x0, #0x50]
    d678:      	add	x9, x9, x11
    d67c:      	ldr	w9, [x9]
    d680:      	sxtw	x9, w9
    d684:      	cmp	x9, #0x0
    d688:      	cset	w9, gt
    d68c:      	ubfx	x9, x9, #0, #8
    d690:      	b	0xd98c <_stogir.vector-lanes.operands+0x3e0>
    d694:      	movz	x9, #0x0, lsl #48
    d698:      	b	0xd708 <_stogir.vector-lanes.operands+0x15c>
    d69c:      	mov	x0, x1
    d6a0:      	mov	x1, x23
    d6a4:      	str	x21, [sp, #0x98]
    d6a8:      	str	x19, [sp, #0xa0]
    d6ac:      	str	x22, [sp, #0x88]
    d6b0:      	mov	x19, x0
    d6b4:      	mov	x20, x1
    d6b8:      	cmp	x20, #0x0
    d6bc:      	b.ne	0xd6ec <_stogir.vector-lanes.operands+0x140>
    d6c0:      	cmp	x20, #0x0
    d6c4:      	b.eq	0xd990 <_stogir.vector-lanes.operands+0x3e4>
    d6c8:      	lsr	x0, x20, #0
    d6cc:      	ldr	x1, [sp, #0x88]
    d6d0:      	mov	x2, x0
    d6d4:      	mov	x0, x19
    d6d8:      	bl	0xd6d8 <_stogir.vector-lanes.operands+0x12c>
		000000000000d6d8:  ARM64_RELOC_BRANCH26	_memcmp
    d6dc:      	lsr	w0, w0, #0
    d6e0:      	sxtw	x0, w0
    d6e4:      	cmp	x0, #0x0
    d6e8:      	b.eq	0xd990 <_stogir.vector-lanes.operands+0x3e4>
    d6ec:      	mov	x1, x19
    d6f0:      	mov	x2, x20
    d6f4:      	mov	x0, #0x1                ; =1
    d6f8:      	b	0xd7a0 <_stogir.vector-lanes.operands+0x1f4>
    d6fc:      	movz	x9, #0x0, lsl #48
    d700:      	b	0xd708 <_stogir.vector-lanes.operands+0x15c>
    d704:      	movz	x9, #0x0, lsl #48
    d708:      	cmp	x9, #0x0
    d70c:      	b.eq	0xd74c <_stogir.vector-lanes.operands+0x1a0>
    d710:      	uxtb	w16, w7
    d714:      	cmp	w16, wzr
    d718:      	b.eq	0xd730 <_stogir.vector-lanes.operands+0x184>
    d71c:      	lsl	x4, x4, #4
    d720:      	ldr	x7, [x0]
    d724:      	add	x4, x4, x7
    d728:      	ldr	x4, [x4]
    d72c:      	b	0xd740 <_stogir.vector-lanes.operands+0x194>
    d730:      	lsl	x4, x10, #4
    d734:      	ldr	x7, [x0, #0x28]
    d738:      	add	x4, x4, x7
    d73c:      	ldr	x4, [x4]
    d740:      	mov	x7, x4
    d744:      	mov	x4, #0x1                ; =1
    d748:      	b	0xd754 <_stogir.vector-lanes.operands+0x1a8>
    d74c:      	movz	x4, #0x0, lsl #48
    d750:      	movz	x7, #0x0, lsl #48
    d754:      	lsr	w4, w4, #0
    d758:      	lsr	x16, x4, #0
    d75c:      	cmp	x16, #0x1
    d760:      	b.eq	0xd77c <_stogir.vector-lanes.operands+0x1d0>
    d764:      	b.lo	0xd76c <_stogir.vector-lanes.operands+0x1c0>
    d768:      	b	0xd780 <_stogir.vector-lanes.operands+0x1d4>
    d76c:      	cmp	x16, #0x0
    d770:      	b.eq	0xd778 <_stogir.vector-lanes.operands+0x1cc>
    d774:      	b	0xd780 <_stogir.vector-lanes.operands+0x1d4>
    d778:      	b	0xd784 <_stogir.vector-lanes.operands+0x1d8>
    d77c:      	b	0xd7e8 <_stogir.vector-lanes.operands+0x23c>
    d780:      	b	0xddb4 <_stogir.vector-lanes.operands+0x808>
    d784:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d784:  ARM64_RELOC_PAGE21	l_stogir.474
    d788:      	ldr	x16, [x16]
		000000000000d788:  ARM64_RELOC_PAGEOFF12	l_stogir.474
    d78c:      	orr	x0, x16, xzr
    d790:      	str	x8, [sp, #0xa0]
    d794:      	mov	x1, x0
    d798:      	mov	x0, #0x1                ; =1
    d79c:      	mov	x2, #0x1b               ; =27
    d7a0:      	ldr	x3, [sp, #0xa0]
    d7a4:      	str	x0, [x3]
    d7a8:      	str	x1, [x3, #0x8]
    d7ac:      	str	x2, [x3, #0x10]
    d7b0:      	ldr	x19, [sp, #0xc8]
    d7b4:      	ldr	x20, [sp, #0xd0]
    d7b8:      	ldr	x21, [sp, #0xd8]
    d7bc:      	ldr	x22, [sp, #0xe0]
    d7c0:      	ldr	x23, [sp, #0xe8]
    d7c4:      	ldr	x24, [sp, #0xf0]
    d7c8:      	ldr	x25, [sp, #0xf8]
    d7cc:      	ldr	x26, [sp, #0x100]
    d7d0:      	ldr	x27, [sp, #0x108]
    d7d4:      	ldr	x28, [sp, #0x110]
    d7d8:      	ldr	x29, [sp]
    d7dc:      	ldr	x30, [sp, #0x8]
    d7e0:      	add	sp, sp, #0x120
    d7e4:      	ret
    d7e8:      	sxtw	x19, w1
    d7ec:      	sxtw	x1, w2
    d7f0:      	lsr	w4, w7, #0
    d7f4:      	ubfx	x4, x4, #8, #8
    d7f8:      	orr	x20, x4, xzr
    d7fc:      	cmp	x19, #0x3d
    d800:      	b.ne	0xd814 <_stogir.vector-lanes.operands+0x268>
    d804:      	mov	x21, x20
    d808:      	b	0xd818 <_stogir.vector-lanes.operands+0x26c>
    d80c:      	movz	x9, #0x0, lsl #48
    d810:      	b	0xd700 <_stogir.vector-lanes.operands+0x154>
    d814:      	mov	x21, x1
    d818:      	cmp	x19, #0x3d
    d81c:      	b.eq	0xd824 <_stogir.vector-lanes.operands+0x278>
    d820:      	mov	x1, x20
    d824:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d824:  ARM64_RELOC_PAGE21	l_stogir.475
    d828:      	ldr	x16, [x16]
		000000000000d828:  ARM64_RELOC_PAGEOFF12	l_stogir.475
    d82c:      	orr	x22, x16, xzr
    d830:      	lsr	w23, w21, #0
    d834:      	sxtw	x24, w23
    d838:      	cmp	x24, #0xf
    d83c:      	cset	w25, gt
    d840:      	cmp	x24, #0x80
    d844:      	cset	w26, lt
    d848:      	and	x4, x24, #0xf
    d84c:      	lsr	w4, w4, #0
    d850:      	sxtw	x4, w4
    d854:      	cmp	x4, #0x1
    d858:      	cset	w27, ge
    d85c:      	cmp	x4, #0xd
    d860:      	cset	w28, le
    d864:      	cmp	x19, #0x3d
    d868:      	b.lt	0xd8b8 <_stogir.vector-lanes.operands+0x30c>
    d86c:      	cmp	x19, #0x3f
    d870:      	b.gt	0xd8b8 <_stogir.vector-lanes.operands+0x30c>
    d874:      	uxtb	w16, w25
    d878:      	cmp	w16, wzr
    d87c:      	b.eq	0xd8b8 <_stogir.vector-lanes.operands+0x30c>
    d880:      	uxtb	w16, w26
    d884:      	cmp	w16, wzr
    d888:      	b.eq	0xd8b8 <_stogir.vector-lanes.operands+0x30c>
    d88c:      	uxtb	w16, w27
    d890:      	cmp	w16, wzr
    d894:      	b.eq	0xd8b8 <_stogir.vector-lanes.operands+0x30c>
    d898:      	uxtb	w16, w28
    d89c:      	cmp	w16, wzr
    d8a0:      	b.eq	0xd8b8 <_stogir.vector-lanes.operands+0x30c>
    d8a4:      	sxtw	x4, w3
    d8a8:      	cmp	x4, #0x4
    d8ac:      	b.eq	0xdeb4 <_stogir.vector-lanes.operands+0x908>
    d8b0:      	cmp	x4, #0x8
    d8b4:      	b.eq	0xdeb4 <_stogir.vector-lanes.operands+0x908>
    d8b8:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d8b8:  ARM64_RELOC_PAGE21	l_stogir.476
    d8bc:      	ldr	x16, [x16]
		000000000000d8bc:  ARM64_RELOC_PAGEOFF12	l_stogir.476
    d8c0:      	orr	x4, x16, xzr
    d8c4:      	mov	x7, #0x36               ; =54
    d8c8:      	sxtw	x9, w5
    d8cc:      	sxtw	x10, w6
    d8d0:      	cmp	x10, #0x0
    d8d4:      	cset	w10, eq
    d8d8:      	cmp	x19, #0x3f
    d8dc:      	b.ne	0xdf00 <_stogir.vector-lanes.operands+0x954>
    d8e0:      	lsr	w1, w1, #0
    d8e4:      	lsr	w3, w3, #0
    d8e8:      	mov	w0, w23
    d8ec:      	mov	w2, w3
    d8f0:      	mov	x19, x8
    d8f4:      	mov	x20, x4
    d8f8:      	mov	x23, x7
    d8fc:      	mov	x24, x9
    d900:      	mov	w25, w10
    d904:      	bl	0xd904 <_stogir.vector-lanes.operands+0x358>
		000000000000d904:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    d908:      	cmp	x0, #0x0
    d90c:      	b.eq	0xd9fc <_stogir.vector-lanes.operands+0x450>
    d910:      	mov	x1, x20
    d914:      	movz	x0, #0x0, lsl #48
    d918:      	b	0xda04 <_stogir.vector-lanes.operands+0x458>
    d91c:      	cmp	x19, #0x3d
    d920:      	b.ne	0xdf10 <_stogir.vector-lanes.operands+0x964>
    d924:      	lsr	w2, w2, #0
    d928:      	lsr	w3, w3, #0
    d92c:      	str	x0, [sp, #0x80]
    d930:      	mov	w0, w23
    d934:      	str	w3, [sp, #0xb8]
    d938:      	str	x1, [sp, #0xa0]
    d93c:      	mov	w1, w2
    d940:      	mov	w2, w3
    d944:      	str	x4, [sp, #0xa8]
    d948:      	str	x7, [sp, #0xb0]
    d94c:      	str	w9, [sp, #0xc0]
    d950:      	str	x22, [sp, #0x88]
    d954:      	mov	x22, x8
    d958:      	str	w23, [sp, #0x90]
    d95c:      	mov	w23, w5
    d960:      	str	x21, [sp, #0x98]
    d964:      	mov	w21, w6
    d968:      	bl	0xd968 <_stogir.vector-lanes.operands+0x3bc>
		000000000000d968:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    d96c:      	cmp	x0, #0x0
    d970:      	b.ne	0xda14 <_stogir.vector-lanes.operands+0x468>
    d974:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d974:  ARM64_RELOC_PAGE21	l_stogir.477
    d978:      	ldr	x16, [x16]
		000000000000d978:  ARM64_RELOC_PAGEOFF12	l_stogir.477
    d97c:      	orr	x0, x16, xzr
    d980:      	mov	x1, #0x26               ; =38
    d984:      	b	0xda1c <_stogir.vector-lanes.operands+0x470>
    d988:      	movz	x9, #0x0, lsl #48
    d98c:      	b	0xd698 <_stogir.vector-lanes.operands+0xec>
    d990:      	ldr	x0, [sp, #0x98]
    d994:      	and	x0, x0, #0xffffffff
    d998:      	mov	x1, x0
    d99c:      	movz	x0, #0x0, lsl #48
    d9a0:      	movz	x2, #0x0, lsl #48
    d9a4:      	b	0xd6f8 <_stogir.vector-lanes.operands+0x14c>
    d9a8:      	ldr	w0, [sp, #0xc0]
    d9ac:      	uxtb	w16, w0
    d9b0:      	cmp	w16, wzr
    d9b4:      	b.eq	0xdcb8 <_stogir.vector-lanes.operands+0x70c>
    d9b8:      	mov	x0, x20
    d9bc:      	mov	x1, x22
    d9c0:      	mov	x19, x0
    d9c4:      	mov	x20, x1
    d9c8:      	b	0xd6b8 <_stogir.vector-lanes.operands+0x10c>
    d9cc:      	cmp	x24, #0x0
    d9d0:      	b.ne	0xdba8 <_stogir.vector-lanes.operands+0x5fc>
    d9d4:      	uxtb	w16, w25
    d9d8:      	cmp	w16, wzr
    d9dc:      	cset	x0, eq
    d9e0:      	cmp	x0, #0x0
    d9e4:      	b.eq	0xd69c <_stogir.vector-lanes.operands+0xf0>
    d9e8:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000d9e8:  ARM64_RELOC_PAGE21	l_stogir.478
    d9ec:      	ldr	x16, [x16]
		000000000000d9ec:  ARM64_RELOC_PAGEOFF12	l_stogir.478
    d9f0:      	orr	x0, x16, xzr
    d9f4:      	mov	x1, #0x24               ; =36
    d9f8:      	b	0xd6a4 <_stogir.vector-lanes.operands+0xf8>
    d9fc:      	mov	x1, x20
    da00:      	mov	x0, #0x1                ; =1
    da04:      	cmp	x0, #0x0
    da08:      	b.eq	0xd9cc <_stogir.vector-lanes.operands+0x420>
    da0c:      	mov	x0, #0x1                ; =1
    da10:      	b	0xd9e0 <_stogir.vector-lanes.operands+0x434>
    da14:      	ldr	x0, [sp, #0xa8]
    da18:      	ldr	x1, [sp, #0xb0]
    da1c:      	cmp	x19, #0x3e
    da20:      	b.ne	0xda50 <_stogir.vector-lanes.operands+0x4a4>
    da24:      	cmp	x20, x24
    da28:      	b.ne	0xda38 <_stogir.vector-lanes.operands+0x48c>
    da2c:      	mov	x2, x0
    da30:      	movz	x0, #0x0, lsl #48
    da34:      	b	0xda40 <_stogir.vector-lanes.operands+0x494>
    da38:      	mov	x2, x0
    da3c:      	mov	x0, #0x1                ; =1
    da40:      	fmov	d31, x1
    da44:      	mov	x1, x2
    da48:      	fmov	x2, d31
    da4c:      	b	0xda5c <_stogir.vector-lanes.operands+0x4b0>
    da50:      	mov	x2, x1
    da54:      	mov	x1, x0
    da58:      	movz	x0, #0x0, lsl #48
    da5c:      	cmp	x0, #0x0
    da60:      	b.eq	0xda7c <_stogir.vector-lanes.operands+0x4d0>
    da64:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000da64:  ARM64_RELOC_PAGE21	l_stogir.479
    da68:      	ldr	x16, [x16]
		000000000000da68:  ARM64_RELOC_PAGEOFF12	l_stogir.479
    da6c:      	orr	x0, x16, xzr
    da70:      	mov	x20, x0
    da74:      	mov	x0, #0x27               ; =39
    da78:      	b	0xda84 <_stogir.vector-lanes.operands+0x4d8>
    da7c:      	mov	x20, x1
    da80:      	mov	x0, x2
    da84:      	lsr	w23, w23, #0
    da88:      	add	x8, sp, #0x10
    da8c:      	mov	w1, w23
    da90:      	mov	x23, x0
    da94:      	ldr	x0, [sp, #0x80]
    da98:      	bl	0xda98 <_stogir.vector-lanes.operands+0x4ec>
		000000000000da98:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    da9c:      	add	x16, sp, #0x10
    daa0:      	ldr	w0, [x16]
    daa4:      	lsr	x16, x0, #0
    daa8:      	cmp	x16, #0x1
    daac:      	b.eq	0xdac8 <_stogir.vector-lanes.operands+0x51c>
    dab0:      	b.lo	0xdab8 <_stogir.vector-lanes.operands+0x50c>
    dab4:      	b	0xdacc <_stogir.vector-lanes.operands+0x520>
    dab8:      	cmp	x16, #0x0
    dabc:      	b.eq	0xdac4 <_stogir.vector-lanes.operands+0x518>
    dac0:      	b	0xdacc <_stogir.vector-lanes.operands+0x520>
    dac4:      	b	0xdad0 <_stogir.vector-lanes.operands+0x524>
    dac8:      	b	0xdb48 <_stogir.vector-lanes.operands+0x59c>
    dacc:      	b	0xdef0 <_stogir.vector-lanes.operands+0x944>
    dad0:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000dad0:  ARM64_RELOC_PAGE21	l_stogir.480
    dad4:      	ldr	x16, [x16]
		000000000000dad4:  ARM64_RELOC_PAGEOFF12	l_stogir.480
    dad8:      	orr	x0, x16, xzr
    dadc:      	mov	x20, x0
    dae0:      	mov	x22, #0x19              ; =25
    dae4:      	cmp	x19, #0x3e
    dae8:      	b.ne	0xd9a8 <_stogir.vector-lanes.operands+0x3fc>
    daec:      	lsr	w21, w21, #0
    daf0:      	add	x8, sp, #0x50
    daf4:      	ldr	x0, [sp, #0x80]
    daf8:      	mov	w1, w21
    dafc:      	bl	0xdafc <_stogir.vector-lanes.operands+0x550>
		000000000000dafc:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    db00:      	add	x16, sp, #0x50
    db04:      	ldr	w0, [x16]
    db08:      	lsr	x16, x0, #0
    db0c:      	cmp	x16, #0x1
    db10:      	b.eq	0xdb2c <_stogir.vector-lanes.operands+0x580>
    db14:      	b.lo	0xdb1c <_stogir.vector-lanes.operands+0x570>
    db18:      	b	0xdb30 <_stogir.vector-lanes.operands+0x584>
    db1c:      	cmp	x16, #0x0
    db20:      	b.eq	0xdb28 <_stogir.vector-lanes.operands+0x57c>
    db24:      	b	0xdb30 <_stogir.vector-lanes.operands+0x584>
    db28:      	b	0xdb34 <_stogir.vector-lanes.operands+0x588>
    db2c:      	b	0xdccc <_stogir.vector-lanes.operands+0x720>
    db30:      	b	0xdef8 <_stogir.vector-lanes.operands+0x94c>
    db34:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000db34:  ARM64_RELOC_PAGE21	l_stogir.481
    db38:      	ldr	x16, [x16]
		000000000000db38:  ARM64_RELOC_PAGEOFF12	l_stogir.481
    db3c:      	orr	x0, x16, xzr
    db40:      	mov	x1, #0x20               ; =32
    db44:      	b	0xdbb8 <_stogir.vector-lanes.operands+0x60c>
    db48:      	add	x16, sp, #0x10
    db4c:      	orr	x0, x16, xzr
    db50:      	add	x0, x0, #0x8
    db54:      	add	x16, sp, #0x10
    db58:      	ldr	x1, [x16, #0x8]
    db5c:      	add	x16, sp, #0x40
    db60:      	str	x1, [x16]
    db64:      	lsr	w1, w1, #0
    db68:      	ldr	x0, [x0, #0x8]
    db6c:      	add	x16, sp, #0x40
    db70:      	str	x0, [x16, #0x8]
    db74:      	ubfx	x0, x1, #8, #8
    db78:      	cmp	x0, #0x1
    db7c:      	b.lt	0xdbbc <_stogir.vector-lanes.operands+0x610>
    db80:      	cmp	x0, #0xb
    db84:      	cset	w0, le
    db88:      	ubfx	x0, x0, #0, #8
    db8c:      	mov	x1, x20
    db90:      	b	0xdbc4 <_stogir.vector-lanes.operands+0x618>
    db94:      	mov	x0, x1
    db98:      	mov	x1, x2
    db9c:      	mov	x20, x0
    dba0:      	mov	x22, x1
    dba4:      	b	0xdae4 <_stogir.vector-lanes.operands+0x538>
    dba8:      	mov	x0, #0x1                ; =1
    dbac:      	b	0xd9e0 <_stogir.vector-lanes.operands+0x434>
    dbb0:      	mov	x0, x1
    dbb4:      	mov	x1, x22
    dbb8:      	b	0xd9c0 <_stogir.vector-lanes.operands+0x414>
    dbbc:      	mov	x1, x20
    dbc0:      	movz	x0, #0x0, lsl #48
    dbc4:      	cmp	x0, #0x0
    dbc8:      	b.eq	0xdbd4 <_stogir.vector-lanes.operands+0x628>
    dbcc:      	movz	x0, #0x0, lsl #48
    dbd0:      	b	0xdbd8 <_stogir.vector-lanes.operands+0x62c>
    dbd4:      	mov	x0, #0x1                ; =1
    dbd8:      	cmp	x0, #0x0
    dbdc:      	b.eq	0xdc88 <_stogir.vector-lanes.operands+0x6dc>
    dbe0:      	mov	x0, #0x1                ; =1
    dbe4:      	b	0xdc10 <_stogir.vector-lanes.operands+0x664>
    dbe8:      	cmp	x0, #0x46
    dbec:      	cset	w0, eq
    dbf0:      	uxtb	w16, w0
    dbf4:      	cmp	w16, wzr
    dbf8:      	cset	x0, eq
    dbfc:      	cmp	x0, #0x0
    dc00:      	cset	w0, ne
    dc04:      	uxtb	w16, w0
    dc08:      	cmp	w16, wzr
    dc0c:      	cset	x0, eq
    dc10:      	cmp	x0, #0x0
    dc14:      	b.eq	0xdc2c <_stogir.vector-lanes.operands+0x680>
    dc18:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000dc18:  ARM64_RELOC_PAGE21	l_stogir.482
    dc1c:      	ldr	x16, [x16]
		000000000000dc1c:  ARM64_RELOC_PAGEOFF12	l_stogir.482
    dc20:      	orr	x0, x16, xzr
    dc24:      	mov	x1, #0x2b               ; =43
    dc28:      	b	0xdc34 <_stogir.vector-lanes.operands+0x688>
    dc2c:      	mov	x0, x1
    dc30:      	mov	x1, x23
    dc34:      	cmp	x22, #0x0
    dc38:      	b.ge	0xdc60 <_stogir.vector-lanes.operands+0x6b4>
    dc3c:      	add	x16, sp, #0x40
    dc40:      	ldr	w2, [x16]
    dc44:      	uxtb	w3, w2
    dc48:      	ubfx	x2, x2, #8, #8
    dc4c:      	cmp	x3, x2
    dc50:      	b.ne	0xdcec <_stogir.vector-lanes.operands+0x740>
    dc54:      	mov	x2, x0
    dc58:      	mov	x0, #0x1                ; =1
    dc5c:      	b	0xdd04 <_stogir.vector-lanes.operands+0x758>
    dc60:      	mov	x2, x1
    dc64:      	mov	x1, x0
    dc68:      	movz	x0, #0x0, lsl #48
    dc6c:      	cmp	x0, #0x0
    dc70:      	b.eq	0xdb94 <_stogir.vector-lanes.operands+0x5e8>
    dc74:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000dc74:  ARM64_RELOC_PAGE21	l_stogir.483
    dc78:      	ldr	x16, [x16]
		000000000000dc78:  ARM64_RELOC_PAGEOFF12	l_stogir.483
    dc7c:      	orr	x0, x16, xzr
    dc80:      	mov	x1, #0x28               ; =40
    dc84:      	b	0xdb9c <_stogir.vector-lanes.operands+0x5f0>
    dc88:      	add	x16, sp, #0x40
    dc8c:      	ldr	w0, [x16]
    dc90:      	uxtb	w0, w0
    dc94:      	cmp	x0, #0x48
    dc98:      	b.ne	0xdbe8 <_stogir.vector-lanes.operands+0x63c>
    dc9c:      	movz	x0, #0x0, lsl #48
    dca0:      	b	0xdbfc <_stogir.vector-lanes.operands+0x650>
    dca4:      	fmov	d31, x1
    dca8:      	mov	x1, x2
    dcac:      	fmov	x2, d31
    dcb0:      	movz	x0, #0x0, lsl #48
    dcb4:      	b	0xdc6c <_stogir.vector-lanes.operands+0x6c0>
    dcb8:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000dcb8:  ARM64_RELOC_PAGE21	l_stogir.484
    dcbc:      	ldr	x16, [x16]
		000000000000dcbc:  ARM64_RELOC_PAGEOFF12	l_stogir.484
    dcc0:      	orr	x0, x16, xzr
    dcc4:      	mov	x1, #0x20               ; =32
    dcc8:      	b	0xd9c0 <_stogir.vector-lanes.operands+0x414>
    dccc:      	add	x16, sp, #0x50
    dcd0:      	ldr	x0, [x16, #0x8]
    dcd4:      	uxtb	w1, w0
    dcd8:      	cmp	x1, #0x48
    dcdc:      	b.ne	0xde30 <_stogir.vector-lanes.operands+0x884>
    dce0:      	mov	x2, x20
    dce4:      	movz	x1, #0x0, lsl #48
    dce8:      	b	0xde48 <_stogir.vector-lanes.operands+0x89c>
    dcec:      	cmp	x3, #0x49
    dcf0:      	cset	w2, eq
    dcf4:      	ubfx	x2, x2, #0, #8
    dcf8:      	fmov	d31, x0
    dcfc:      	mov	x0, x2
    dd00:      	fmov	x2, d31
    dd04:      	cmp	x0, #0x0
    dd08:      	b.eq	0xdca4 <_stogir.vector-lanes.operands+0x6f8>
    dd0c:      	add	x16, sp, #0x40
    dd10:      	ldr	w0, [x16, #0x8]
    dd14:      	add	x16, sp, #0x40
    dd18:      	ldr	w3, [x16, #0xc]
    dd1c:      	uxtb	w16, w25
    dd20:      	cmp	w16, wzr
    dd24:      	b.eq	0xdd50 <_stogir.vector-lanes.operands+0x7a4>
    dd28:      	uxtb	w16, w26
    dd2c:      	cmp	w16, wzr
    dd30:      	b.eq	0xde84 <_stogir.vector-lanes.operands+0x8d8>
    dd34:      	uxtb	w16, w27
    dd38:      	cmp	w16, wzr
    dd3c:      	b.eq	0xde98 <_stogir.vector-lanes.operands+0x8ec>
    dd40:      	ubfx	x28, x28, #0, #8
    dd44:      	mov	x4, x2
    dd48:      	mov	x2, x28
    dd4c:      	b	0xdea0 <_stogir.vector-lanes.operands+0x8f4>
    dd50:      	mov	x4, x1
    dd54:      	movz	x1, #0x0, lsl #48
    dd58:      	cmp	x1, #0x0
    dd5c:      	b.eq	0xde5c <_stogir.vector-lanes.operands+0x8b0>
    dd60:      	ubfx	x1, x24, #4, #32
    dd64:      	sxtw	x1, w1
    dd68:      	sub	x1, x1, #0x1
    dd6c:      	lsr	w1, w1, #0
    dd70:      	sxtw	x1, w1
    dd74:      	mov	x16, #0x1               ; =1
    dd78:      	lsl	x1, x16, x1
    dd7c:      	lsr	w1, w1, #0
    dd80:      	sxtw	x1, w1
    dd84:      	ubfx	x0, x0, #0, #32
    dd88:      	ubfx	x3, x3, #0, #32
    dd8c:      	lsl	x3, x3, #32
    dd90:      	orr	x0, x3, x0
    dd94:      	lsr	w1, w1, #0
    dd98:      	sxtw	x1, w1
    dd9c:      	cmp	x0, x1
    dda0:      	cset	w0, hs
    dda4:      	ubfx	x0, x0, #0, #8
    dda8:      	mov	x1, x2
    ddac:      	mov	x2, x4
    ddb0:      	b	0xdcb4 <_stogir.vector-lanes.operands+0x708>
    ddb4:      	brk	#0
    ddb8:      	b	0xddb4 <_stogir.vector-lanes.operands+0x808>
    ddbc:      	ldr	w1, [sp, #0xb8]
    ddc0:      	lsr	w1, w1, #0
    ddc4:      	lsr	w0, w0, #0
    ddc8:      	ubfx	x0, x0, #8, #8
    ddcc:      	lsr	w0, w0, #0
    ddd0:      	mov	w2, w1
    ddd4:      	mov	w1, w0
    ddd8:      	ldr	w0, [sp, #0x90]
    dddc:      	bl	0xdddc <_stogir.vector-lanes.operands+0x830>
		000000000000dddc:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    dde0:      	cmp	x0, #0x0
    dde4:      	cset	w0, ne
    dde8:      	uxtb	w16, w0
    ddec:      	cmp	w16, wzr
    ddf0:      	cset	x0, eq
    ddf4:      	mov	x1, x19
    ddf8:      	cmp	x0, #0x0
    ddfc:      	b.eq	0xdbb0 <_stogir.vector-lanes.operands+0x604>
    de00:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000de00:  ARM64_RELOC_PAGE21	l_stogir.485
    de04:      	ldr	x16, [x16]
		000000000000de04:  ARM64_RELOC_PAGEOFF12	l_stogir.485
    de08:      	orr	x0, x16, xzr
    de0c:      	mov	x1, #0x27               ; =39
    de10:      	b	0xdbb8 <_stogir.vector-lanes.operands+0x60c>
    de14:      	mov	x19, x2
    de18:      	mov	x1, #0x1                ; =1
    de1c:      	cmp	x1, #0x0
    de20:      	b.eq	0xddbc <_stogir.vector-lanes.operands+0x810>
    de24:      	mov	x1, x19
    de28:      	mov	x0, #0x1                ; =1
    de2c:      	b	0xddf8 <_stogir.vector-lanes.operands+0x84c>
    de30:      	cmp	x1, #0x46
    de34:      	cset	w1, eq
    de38:      	uxtb	w16, w1
    de3c:      	cmp	w16, wzr
    de40:      	cset	x1, eq
    de44:      	mov	x2, x20
    de48:      	cmp	x1, #0x0
    de4c:      	b.eq	0xde14 <_stogir.vector-lanes.operands+0x868>
    de50:      	mov	x19, x2
    de54:      	movz	x1, #0x0, lsl #48
    de58:      	b	0xde1c <_stogir.vector-lanes.operands+0x870>
    de5c:      	cmp	x24, #0x0
    de60:      	b.lt	0xde90 <_stogir.vector-lanes.operands+0x8e4>
    de64:      	cmp	x24, #0xd
    de68:      	b.gt	0xde90 <_stogir.vector-lanes.operands+0x8e4>
    de6c:      	cmp	x24, #0x0
    de70:      	cset	w1, eq
    de74:      	uxtb	w16, w1
    de78:      	cmp	w16, wzr
    de7c:      	cset	x1, eq
    de80:      	b	0xde94 <_stogir.vector-lanes.operands+0x8e8>
    de84:      	mov	x4, x1
    de88:      	movz	x1, #0x0, lsl #48
    de8c:      	b	0xdd58 <_stogir.vector-lanes.operands+0x7ac>
    de90:      	movn	x1, #0x0, lsl #48
    de94:      	b	0xdd84 <_stogir.vector-lanes.operands+0x7d8>
    de98:      	mov	x4, x2
    de9c:      	movz	x2, #0x0, lsl #48
    dea0:      	fmov	d31, x1
    dea4:      	mov	x1, x2
    dea8:      	mov	x2, x4
    deac:      	fmov	x4, d31
    deb0:      	b	0xde8c <_stogir.vector-lanes.operands+0x8e0>
    deb4:      	uxtb	w7, w7
    deb8:      	cmp	x7, #0x48
    debc:      	b.ne	0xdec8 <_stogir.vector-lanes.operands+0x91c>
    dec0:      	movz	x4, #0x0, lsl #48
    dec4:      	b	0xdedc <_stogir.vector-lanes.operands+0x930>
    dec8:      	cmp	x7, #0x46
    decc:      	cset	w4, eq
    ded0:      	uxtb	w16, w4
    ded4:      	cmp	w16, wzr
    ded8:      	cset	x4, eq
    dedc:      	cmp	x4, #0x0
    dee0:      	b.eq	0xd8b8 <_stogir.vector-lanes.operands+0x30c>
    dee4:      	mov	x4, x22
    dee8:      	movz	x7, #0x0, lsl #48
    deec:      	b	0xd8c8 <_stogir.vector-lanes.operands+0x31c>
    def0:      	brk	#0
    def4:      	b	0xdef0 <_stogir.vector-lanes.operands+0x944>
    def8:      	brk	#0
    defc:      	b	0xdef8 <_stogir.vector-lanes.operands+0x94c>
    df00:      	mov	x1, x8
    df04:      	mov	x8, x9
    df08:      	mov	w9, w10
    df0c:      	b	0xd91c <_stogir.vector-lanes.operands+0x370>
    df10:      	str	x21, [sp, #0x98]
    df14:      	str	x1, [sp, #0xa0]
    df18:      	str	x0, [sp, #0x80]
    df1c:      	str	w3, [sp, #0xb8]
    df20:      	mov	w21, w6
    df24:      	str	x22, [sp, #0x88]
    df28:      	mov	x22, x8
    df2c:      	str	w23, [sp, #0x90]
    df30:      	mov	w23, w5
    df34:      	str	w9, [sp, #0xc0]
    df38:      	str	x4, [sp, #0xa8]
    df3c:      	str	x7, [sp, #0xb0]
    df40:      	b	0xda14 <_stogir.vector-lanes.operands+0x468>

000000000000df44 <_stogir.vector-comparison.operation?>:
    df44:      	sxtw	x0, w0
    df48:      	cmp	x0, #0xe
    df4c:      	b.lt	0xdf60 <_stogir.vector-comparison.operation?+0x1c>
    df50:      	cmp	x0, #0x19
    df54:      	cset	w0, le
    df58:      	ubfx	x0, x0, #0, #8
    df5c:      	b	0xdf64 <_stogir.vector-comparison.operation?+0x20>
    df60:      	movz	x0, #0x0, lsl #48
    df64:      	ret

000000000000df68 <_stogir.vector-comparison.operands>:
    df68:      	sub	sp, sp, #0xe0
    df6c:      	str	x29, [sp]
    df70:      	str	x30, [sp, #0x8]
    df74:      	mov	x29, sp
    df78:      	str	x19, [sp, #0x90]
    df7c:      	str	x20, [sp, #0x98]
    df80:      	str	x21, [sp, #0xa0]
    df84:      	str	x22, [sp, #0xa8]
    df88:      	str	x23, [sp, #0xb0]
    df8c:      	str	x24, [sp, #0xb8]
    df90:      	str	x25, [sp, #0xc0]
    df94:      	str	x26, [sp, #0xc8]
    df98:      	str	x27, [sp, #0xd0]
    df9c:      	str	x28, [sp, #0xd8]
    dfa0:      	adrp	x16, 0xd000 <_stogir.floating.operands+0xf0>
		000000000000dfa0:  ARM64_RELOC_PAGE21	l_stogir.486
    dfa4:      	ldr	x16, [x16]
		000000000000dfa4:  ARM64_RELOC_PAGEOFF12	l_stogir.486
    dfa8:      	orr	x19, x16, xzr
    dfac:      	lsr	w4, w4, #0
    dfb0:      	mov	x20, x8
    dfb4:      	add	x8, sp, #0x10
    dfb8:      	mov	x21, x0
    dfbc:      	mov	w22, w1
    dfc0:      	mov	w1, w4
    dfc4:      	mov	w23, w2
    dfc8:      	mov	w24, w3
    dfcc:      	mov	w25, w5
    dfd0:      	bl	0xdfd0 <_stogir.vector-comparison.operands+0x68>
		000000000000dfd0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    dfd4:      	add	x16, sp, #0x10
    dfd8:      	ldr	w0, [x16]
    dfdc:      	lsr	x16, x0, #0
    dfe0:      	cmp	x16, #0x1
    dfe4:      	b.eq	0xe000 <_stogir.vector-comparison.operands+0x98>
    dfe8:      	b.lo	0xdff0 <_stogir.vector-comparison.operands+0x88>
    dfec:      	b	0xe004 <_stogir.vector-comparison.operands+0x9c>
    dff0:      	cmp	x16, #0x0
    dff4:      	b.eq	0xdffc <_stogir.vector-comparison.operands+0x94>
    dff8:      	b	0xe004 <_stogir.vector-comparison.operands+0x9c>
    dffc:      	b	0xe008 <_stogir.vector-comparison.operands+0xa0>
    e000:      	b	0xe058 <_stogir.vector-comparison.operands+0xf0>
    e004:      	b	0xe208 <_stogir.vector-comparison.operands+0x2a0>
    e008:      	mov	x1, x19
    e00c:      	mov	x0, #0x1                ; =1
    e010:      	mov	x2, #0x21               ; =33
    e014:      	str	x0, [x20]
    e018:      	str	x1, [x20, #0x8]
    e01c:      	str	x2, [x20, #0x10]
    e020:      	ldr	x19, [sp, #0x90]
    e024:      	ldr	x20, [sp, #0x98]
    e028:      	ldr	x21, [sp, #0xa0]
    e02c:      	ldr	x22, [sp, #0xa8]
    e030:      	ldr	x23, [sp, #0xb0]
    e034:      	ldr	x24, [sp, #0xb8]
    e038:      	ldr	x25, [sp, #0xc0]
    e03c:      	ldr	x26, [sp, #0xc8]
    e040:      	ldr	x27, [sp, #0xd0]
    e044:      	ldr	x28, [sp, #0xd8]
    e048:      	ldr	x29, [sp]
    e04c:      	ldr	x30, [sp, #0x8]
    e050:      	add	sp, sp, #0xe0
    e054:      	ret
    e058:      	lsr	w25, w25, #0
    e05c:      	add	x16, sp, #0x10
    e060:      	ldr	x26, [x16, #0x8]
    e064:      	add	x8, sp, #0x40
    e068:      	mov	x0, x21
    e06c:      	mov	w1, w25
    e070:      	bl	0xe070 <_stogir.vector-comparison.operands+0x108>
		000000000000e070:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    e074:      	add	x16, sp, #0x40
    e078:      	ldr	w0, [x16]
    e07c:      	lsr	x16, x0, #0
    e080:      	cmp	x16, #0x1
    e084:      	b.eq	0xe0a0 <_stogir.vector-comparison.operands+0x138>
    e088:      	b.lo	0xe090 <_stogir.vector-comparison.operands+0x128>
    e08c:      	b	0xe0a4 <_stogir.vector-comparison.operands+0x13c>
    e090:      	cmp	x16, #0x0
    e094:      	b.eq	0xe09c <_stogir.vector-comparison.operands+0x134>
    e098:      	b	0xe0a4 <_stogir.vector-comparison.operands+0x13c>
    e09c:      	b	0xe0a8 <_stogir.vector-comparison.operands+0x140>
    e0a0:      	b	0xe0b8 <_stogir.vector-comparison.operands+0x150>
    e0a4:      	b	0xe210 <_stogir.vector-comparison.operands+0x2a8>
    e0a8:      	mov	x1, x19
    e0ac:      	mov	x0, #0x1                ; =1
    e0b0:      	mov	x2, #0x21               ; =33
    e0b4:      	b	0xe014 <_stogir.vector-comparison.operands+0xac>
    e0b8:      	sxtw	x19, w24
    e0bc:      	cmp	x19, #0x4
    e0c0:      	cset	w21, eq
    e0c4:      	cmp	x19, #0x8
    e0c8:      	cset	w25, eq
    e0cc:      	add	x16, sp, #0x40
    e0d0:      	ldr	x27, [x16, #0x8]
    e0d4:      	uxtb	w16, w21
    e0d8:      	cmp	w16, wzr
    e0dc:      	b.ne	0xe108 <_stogir.vector-comparison.operands+0x1a0>
    e0e0:      	uxtb	w16, w25
    e0e4:      	cmp	w16, wzr
    e0e8:      	b.ne	0xe108 <_stogir.vector-comparison.operands+0x1a0>
    e0ec:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000e0ec:  ARM64_RELOC_PAGE21	l_stogir.487
    e0f0:      	ldr	x16, [x16]
		000000000000e0f0:  ARM64_RELOC_PAGEOFF12	l_stogir.487
    e0f4:      	orr	x0, x16, xzr
    e0f8:      	mov	x1, x0
    e0fc:      	mov	x0, #0x1                ; =1
    e100:      	mov	x2, #0x33               ; =51
    e104:      	b	0xe0b4 <_stogir.vector-comparison.operands+0x14c>
    e108:      	lsr	w22, w22, #0
    e10c:      	lsr	w0, w26, #0
    e110:      	ubfx	x28, x0, #8, #8
    e114:      	orr	x0, x28, xzr
    e118:      	lsr	w0, w0, #0
    e11c:      	mov	w1, w0
    e120:      	fmov	s31, w0
    e124:      	mov	w0, w22
    e128:      	fmov	w22, s31
    e12c:      	bl	0xe12c <_stogir.vector-comparison.operands+0x1c4>
		000000000000e12c:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.valid-type?
    e130:      	cmp	x0, #0x0
    e134:      	b.eq	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e138:      	lsr	w0, w27, #0
    e13c:      	ubfx	x0, x0, #8, #8
    e140:      	cmp	x28, x0
    e144:      	b.ne	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e148:      	uxtb	w26, w26
    e14c:      	cmp	x26, #0x48
    e150:      	b.eq	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e154:      	cmp	x26, #0x46
    e158:      	b.eq	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e15c:      	uxtb	w27, w27
    e160:      	cmp	x27, #0x48
    e164:      	b.eq	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e168:      	cmp	x27, #0x46
    e16c:      	b.eq	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e170:      	sxtw	x26, w23
    e174:      	cmp	x26, #0xf
    e178:      	cset	w27, gt
    e17c:      	uxtb	w16, w27
    e180:      	cmp	w16, wzr
    e184:      	b.eq	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e188:      	cmp	x26, #0x80
    e18c:      	cset	w0, lt
    e190:      	uxtb	w16, w0
    e194:      	cmp	w16, wzr
    e198:      	b.eq	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e19c:      	and	x1, x26, #0xf
    e1a0:      	lsr	w1, w1, #0
    e1a4:      	sxtw	x1, w1
    e1a8:      	cmp	x1, #0x1
    e1ac:      	cset	w2, ge
    e1b0:      	uxtb	w16, w2
    e1b4:      	cmp	w16, wzr
    e1b8:      	b.eq	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e1bc:      	cmp	x1, #0xd
    e1c0:      	cset	w3, le
    e1c4:      	uxtb	w16, w3
    e1c8:      	cmp	w16, wzr
    e1cc:      	b.eq	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e1d0:      	lsr	w23, w23, #0
    e1d4:      	str	x1, [sp, #0x78]
    e1d8:      	str	x19, [sp, #0x70]
    e1dc:      	mov	w19, w0
    e1e0:      	mov	w0, w23
    e1e4:      	str	w22, [sp, #0x80]
    e1e8:      	mov	w22, w2
    e1ec:      	str	w23, [sp, #0x88]
    e1f0:      	mov	w23, w3
    e1f4:      	bl	0xe1f4 <_stogir.vector-comparison.operands+0x28c>
		000000000000e1f4:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    e1f8:      	cmp	x0, #0x0
    e1fc:      	b.eq	0xe218 <_stogir.vector-comparison.operands+0x2b0>
    e200:      	ldr	x0, [sp, #0x78]
    e204:      	b	0xe21c <_stogir.vector-comparison.operands+0x2b4>
    e208:      	brk	#0
    e20c:      	b	0xe208 <_stogir.vector-comparison.operands+0x2a0>
    e210:      	brk	#0
    e214:      	b	0xe210 <_stogir.vector-comparison.operands+0x2a8>
    e218:      	movn	x0, #0x0, lsl #48
    e21c:      	lsr	w0, w0, #0
    e220:      	sxtw	x0, w0
    e224:      	cmp	x0, #0x1
    e228:      	b.lt	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e22c:      	cmp	x0, #0xb
    e230:      	b.gt	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e234:      	uxtb	w16, w27
    e238:      	cmp	w16, wzr
    e23c:      	b.eq	0xe2c0 <_stogir.vector-comparison.operands+0x358>
    e240:      	uxtb	w16, w19
    e244:      	cmp	w16, wzr
    e248:      	b.eq	0xe2c0 <_stogir.vector-comparison.operands+0x358>
    e24c:      	uxtb	w16, w22
    e250:      	cmp	w16, wzr
    e254:      	b.eq	0xe2c0 <_stogir.vector-comparison.operands+0x358>
    e258:      	uxtb	w16, w23
    e25c:      	cmp	w16, wzr
    e260:      	b.eq	0xe2c0 <_stogir.vector-comparison.operands+0x358>
    e264:      	ubfx	x0, x26, #4, #32
    e268:      	sxtw	x0, w0
    e26c:      	sub	x0, x0, #0x1
    e270:      	lsr	w0, w0, #0
    e274:      	sxtw	x0, w0
    e278:      	mov	x16, #0x1               ; =1
    e27c:      	lsl	x0, x16, x0
    e280:      	lsr	w0, w0, #0
    e284:      	sxtw	x0, w0
    e288:      	b	0xe2ec <_stogir.vector-comparison.operands+0x384>
    e28c:      	movn	x1, #0x0, lsl #48
    e290:      	lsr	w0, w0, #0
    e294:      	sxtw	x0, w0
    e298:      	lsr	w1, w1, #0
    e29c:      	sxtw	x1, w1
    e2a0:      	cmp	x0, x1
    e2a4:      	b.ne	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e2a8:      	ldr	w0, [sp, #0x88]
    e2ac:      	bl	0xe2ac <_stogir.vector-comparison.operands+0x344>
		000000000000e2ac:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    e2b0:      	cmp	x0, #0x0
    e2b4:      	b.eq	0xe3a4 <_stogir.vector-comparison.operands+0x43c>
    e2b8:      	ldr	x0, [sp, #0x78]
    e2bc:      	b	0xe3a8 <_stogir.vector-comparison.operands+0x440>
    e2c0:      	cmp	x26, #0x0
    e2c4:      	b.lt	0xe2e8 <_stogir.vector-comparison.operands+0x380>
    e2c8:      	cmp	x26, #0xd
    e2cc:      	b.gt	0xe2e8 <_stogir.vector-comparison.operands+0x380>
    e2d0:      	cmp	x26, #0x0
    e2d4:      	cset	w0, eq
    e2d8:      	uxtb	w16, w0
    e2dc:      	cmp	w16, wzr
    e2e0:      	cset	x0, eq
    e2e4:      	b	0xe2ec <_stogir.vector-comparison.operands+0x384>
    e2e8:      	movn	x0, #0x0, lsl #48
    e2ec:      	and	x1, x28, #0xf
    e2f0:      	lsr	w1, w1, #0
    e2f4:      	sxtw	x19, w1
    e2f8:      	cmp	x28, #0xf
    e2fc:      	b.le	0xe340 <_stogir.vector-comparison.operands+0x3d8>
    e300:      	cmp	x28, #0x80
    e304:      	b.ge	0xe340 <_stogir.vector-comparison.operands+0x3d8>
    e308:      	cmp	x19, #0x1
    e30c:      	b.lt	0xe340 <_stogir.vector-comparison.operands+0x3d8>
    e310:      	cmp	x19, #0xd
    e314:      	b.gt	0xe340 <_stogir.vector-comparison.operands+0x3d8>
    e318:      	ubfx	x1, x28, #4, #32
    e31c:      	sxtw	x1, w1
    e320:      	sub	x1, x1, #0x1
    e324:      	lsr	w1, w1, #0
    e328:      	sxtw	x1, w1
    e32c:      	mov	x16, #0x1               ; =1
    e330:      	lsl	x1, x16, x1
    e334:      	lsr	w1, w1, #0
    e338:      	sxtw	x1, w1
    e33c:      	b	0xe290 <_stogir.vector-comparison.operands+0x328>
    e340:      	cmp	x28, #0xd
    e344:      	b.gt	0xe28c <_stogir.vector-comparison.operands+0x324>
    e348:      	cmp	x28, #0x0
    e34c:      	cset	w1, eq
    e350:      	uxtb	w16, w1
    e354:      	cmp	w16, wzr
    e358:      	cset	x1, eq
    e35c:      	b	0xe290 <_stogir.vector-comparison.operands+0x328>
    e360:      	movn	x0, #0x0, lsl #48
    e364:      	lsr	w24, w24, #0
    e368:      	lsr	w21, w21, #0
    e36c:      	sxtw	x21, w21
    e370:      	lsr	w0, w0, #0
    e374:      	lsr	w0, w0, #0
    e378:      	mov	w1, w24
    e37c:      	bl	0xe37c <_stogir.vector-comparison.operands+0x414>
		000000000000e37c:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    e380:      	lsr	w0, w0, #0
    e384:      	sxtw	x0, w0
    e388:      	cmp	x21, x0
    e38c:      	b.ne	0xe0ec <_stogir.vector-comparison.operands+0x184>
    e390:      	and	x0, x28, #0xffffffff
    e394:      	mov	x1, x0
    e398:      	movz	x0, #0x0, lsl #48
    e39c:      	movz	x2, #0x0, lsl #48
    e3a0:      	b	0xe104 <_stogir.vector-comparison.operands+0x19c>
    e3a4:      	movn	x0, #0x0, lsl #48
    e3a8:      	uxtb	w16, w21
    e3ac:      	cmp	w16, wzr
    e3b0:      	b.ne	0xe3e8 <_stogir.vector-comparison.operands+0x480>
    e3b4:      	uxtb	w16, w25
    e3b8:      	cmp	w16, wzr
    e3bc:      	b.ne	0xe3e8 <_stogir.vector-comparison.operands+0x480>
    e3c0:      	movn	x21, #0x0, lsl #48
    e3c4:      	b	0xe3d0 <_stogir.vector-comparison.operands+0x468>
    e3c8:      	mov	x0, #0x1                ; =1
    e3cc:      	mov	x21, x0
    e3d0:      	ldr	w0, [sp, #0x80]
    e3d4:      	bl	0xe3d4 <_stogir.vector-comparison.operands+0x46c>
		000000000000e3d4:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    e3d8:      	cmp	x0, #0x0
    e3dc:      	b.eq	0xe360 <_stogir.vector-comparison.operands+0x3f8>
    e3e0:      	mov	x0, x19
    e3e4:      	b	0xe364 <_stogir.vector-comparison.operands+0x3fc>
    e3e8:      	lsr	w0, w0, #0
    e3ec:      	sxtw	x0, w0
    e3f0:      	cmp	x0, #0x0
    e3f4:      	b.ne	0xe400 <_stogir.vector-comparison.operands+0x498>
    e3f8:      	movz	x0, #0x0, lsl #48
    e3fc:      	b	0xe3cc <_stogir.vector-comparison.operands+0x464>
    e400:      	cmp	x0, #0x1
    e404:      	b.eq	0xe3c8 <_stogir.vector-comparison.operands+0x460>
    e408:      	cmp	x0, #0x2
    e40c:      	b.eq	0xe3c8 <_stogir.vector-comparison.operands+0x460>
    e410:      	cmp	x0, #0x7
    e414:      	b.eq	0xe3c8 <_stogir.vector-comparison.operands+0x460>
    e418:      	cmp	x0, #0x8
    e41c:      	b.eq	0xe3c8 <_stogir.vector-comparison.operands+0x460>
    e420:      	cmp	x0, #0x3
    e424:      	b.eq	0xe470 <_stogir.vector-comparison.operands+0x508>
    e428:      	cmp	x0, #0x9
    e42c:      	b.eq	0xe470 <_stogir.vector-comparison.operands+0x508>
    e430:      	cmp	x0, #0x4
    e434:      	b.eq	0xe478 <_stogir.vector-comparison.operands+0x510>
    e438:      	cmp	x0, #0xa
    e43c:      	b.eq	0xe478 <_stogir.vector-comparison.operands+0x510>
    e440:      	cmp	x0, #0xd
    e444:      	b.eq	0xe478 <_stogir.vector-comparison.operands+0x510>
    e448:      	cmp	x0, #0x5
    e44c:      	b.eq	0xe480 <_stogir.vector-comparison.operands+0x518>
    e450:      	cmp	x0, #0xb
    e454:      	b.eq	0xe480 <_stogir.vector-comparison.operands+0x518>
    e458:      	cmp	x0, #0xc
    e45c:      	b.eq	0xe480 <_stogir.vector-comparison.operands+0x518>
    e460:      	cmp	x0, #0x6
    e464:      	b.ne	0xe488 <_stogir.vector-comparison.operands+0x520>
    e468:      	ldr	x0, [sp, #0x70]
    e46c:      	b	0xe48c <_stogir.vector-comparison.operands+0x524>
    e470:      	mov	x0, #0x2                ; =2
    e474:      	b	0xe3cc <_stogir.vector-comparison.operands+0x464>
    e478:      	mov	x0, #0x4                ; =4
    e47c:      	b	0xe474 <_stogir.vector-comparison.operands+0x50c>
    e480:      	mov	x0, #0x8                ; =8
    e484:      	b	0xe47c <_stogir.vector-comparison.operands+0x514>
    e488:      	movn	x0, #0x0, lsl #48
    e48c:      	b	0xe484 <_stogir.vector-comparison.operands+0x51c>

000000000000e490 <_stogir.vector-arithmetic.operation?>:
    e490:      	sxtw	x0, w0
    e494:      	cmp	x0, #0x1f
    e498:      	b.eq	0xe4f4 <_stogir.vector-arithmetic.operation?+0x64>
    e49c:      	cmp	x0, #0x20
    e4a0:      	b.eq	0xe4f4 <_stogir.vector-arithmetic.operation?+0x64>
    e4a4:      	cmp	x0, #0x2d
    e4a8:      	b.eq	0xe4f4 <_stogir.vector-arithmetic.operation?+0x64>
    e4ac:      	cmp	x0, #0x36
    e4b0:      	b.eq	0xe4f4 <_stogir.vector-arithmetic.operation?+0x64>
    e4b4:      	cmp	x0, #0x37
    e4b8:      	b.eq	0xe4f4 <_stogir.vector-arithmetic.operation?+0x64>
    e4bc:      	cmp	x0, #0x38
    e4c0:      	b.eq	0xe4f4 <_stogir.vector-arithmetic.operation?+0x64>
    e4c4:      	cmp	x0, #0x39
    e4c8:      	b.eq	0xe4f4 <_stogir.vector-arithmetic.operation?+0x64>
    e4cc:      	cmp	x0, #0x3a
    e4d0:      	b.eq	0xe4fc <_stogir.vector-arithmetic.operation?+0x6c>
    e4d4:      	cmp	x0, #0x3b
    e4d8:      	b.eq	0xe4fc <_stogir.vector-arithmetic.operation?+0x6c>
    e4dc:      	cmp	x0, #0x31
    e4e0:      	b.lt	0xe514 <_stogir.vector-arithmetic.operation?+0x84>
    e4e4:      	cmp	x0, #0x35
    e4e8:      	b.gt	0xe514 <_stogir.vector-arithmetic.operation?+0x84>
    e4ec:      	mov	x0, #0x1                ; =1
    e4f0:      	b	0xe510 <_stogir.vector-arithmetic.operation?+0x80>
    e4f4:      	mov	x0, #0x1                ; =1
    e4f8:      	ret
    e4fc:      	mov	x0, #0x1                ; =1
    e500:      	b	0xe4f8 <_stogir.vector-arithmetic.operation?+0x68>
    e504:      	cmp	x0, #0x30
    e508:      	cset	w0, eq
    e50c:      	ubfx	x0, x0, #0, #8
    e510:      	b	0xe500 <_stogir.vector-arithmetic.operation?+0x70>
    e514:      	cmp	x0, #0x1a
    e518:      	b.ne	0xe524 <_stogir.vector-arithmetic.operation?+0x94>
    e51c:      	mov	x0, #0x1                ; =1
    e520:      	b	0xe510 <_stogir.vector-arithmetic.operation?+0x80>
    e524:      	cmp	x0, #0x1b
    e528:      	b.ne	0xe534 <_stogir.vector-arithmetic.operation?+0xa4>
    e52c:      	mov	x0, #0x1                ; =1
    e530:      	b	0xe510 <_stogir.vector-arithmetic.operation?+0x80>
    e534:      	cmp	x0, #0x1c
    e538:      	b.ne	0xe544 <_stogir.vector-arithmetic.operation?+0xb4>
    e53c:      	mov	x0, #0x1                ; =1
    e540:      	b	0xe510 <_stogir.vector-arithmetic.operation?+0x80>
    e544:      	cmp	x0, #0x1d
    e548:      	b.ne	0xe554 <_stogir.vector-arithmetic.operation?+0xc4>
    e54c:      	mov	x0, #0x1                ; =1
    e550:      	b	0xe510 <_stogir.vector-arithmetic.operation?+0x80>
    e554:      	cmp	x0, #0x1e
    e558:      	b.ne	0xe564 <_stogir.vector-arithmetic.operation?+0xd4>
    e55c:      	mov	x0, #0x1                ; =1
    e560:      	b	0xe510 <_stogir.vector-arithmetic.operation?+0x80>
    e564:      	cmp	x0, #0x2e
    e568:      	b.ne	0xe574 <_stogir.vector-arithmetic.operation?+0xe4>
    e56c:      	mov	x0, #0x1                ; =1
    e570:      	b	0xe510 <_stogir.vector-arithmetic.operation?+0x80>
    e574:      	cmp	x0, #0x2f
    e578:      	b.ne	0xe504 <_stogir.vector-arithmetic.operation?+0x74>
    e57c:      	mov	x0, #0x1                ; =1
    e580:      	b	0xe510 <_stogir.vector-arithmetic.operation?+0x80>

000000000000e584 <_stogir.vector-arithmetic.unary?>:
    e584:      	sxtw	x0, w0
    e588:      	cmp	x0, #0x1f
    e58c:      	b.ne	0xe5a8 <_stogir.vector-arithmetic.unary?+0x24>
    e590:      	mov	x0, #0x1                ; =1
    e594:      	b	0xe5a4 <_stogir.vector-arithmetic.unary?+0x20>
    e598:      	cmp	x0, #0x39
    e59c:      	cset	w0, eq
    e5a0:      	ubfx	x0, x0, #0, #8
    e5a4:      	ret
    e5a8:      	cmp	x0, #0x20
    e5ac:      	b.ne	0xe5b8 <_stogir.vector-arithmetic.unary?+0x34>
    e5b0:      	mov	x0, #0x1                ; =1
    e5b4:      	b	0xe5a4 <_stogir.vector-arithmetic.unary?+0x20>
    e5b8:      	cmp	x0, #0x2d
    e5bc:      	b.ne	0xe5c8 <_stogir.vector-arithmetic.unary?+0x44>
    e5c0:      	mov	x0, #0x1                ; =1
    e5c4:      	b	0xe5a4 <_stogir.vector-arithmetic.unary?+0x20>
    e5c8:      	cmp	x0, #0x36
    e5cc:      	b.ne	0xe5d8 <_stogir.vector-arithmetic.unary?+0x54>
    e5d0:      	mov	x0, #0x1                ; =1
    e5d4:      	b	0xe5a4 <_stogir.vector-arithmetic.unary?+0x20>
    e5d8:      	cmp	x0, #0x37
    e5dc:      	b.ne	0xe5e8 <_stogir.vector-arithmetic.unary?+0x64>
    e5e0:      	mov	x0, #0x1                ; =1
    e5e4:      	b	0xe5a4 <_stogir.vector-arithmetic.unary?+0x20>
    e5e8:      	cmp	x0, #0x38
    e5ec:      	b.ne	0xe598 <_stogir.vector-arithmetic.unary?+0x14>
    e5f0:      	mov	x0, #0x1                ; =1
    e5f4:      	b	0xe5a4 <_stogir.vector-arithmetic.unary?+0x20>

000000000000e5f8 <_stogir.vector-arithmetic.operands>:
    e5f8:      	sub	sp, sp, #0xc0
    e5fc:      	str	x29, [sp]
    e600:      	str	x30, [sp, #0x8]
    e604:      	mov	x29, sp
    e608:      	str	x19, [sp, #0x68]
    e60c:      	str	x20, [sp, #0x70]
    e610:      	str	x21, [sp, #0x78]
    e614:      	str	x22, [sp, #0x80]
    e618:      	str	x23, [sp, #0x88]
    e61c:      	str	x24, [sp, #0x90]
    e620:      	str	x25, [sp, #0x98]
    e624:      	str	x26, [sp, #0xa0]
    e628:      	str	x27, [sp, #0xa8]
    e62c:      	str	x28, [sp, #0xb0]
    e630:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000e630:  ARM64_RELOC_PAGE21	l_stogir.488
    e634:      	ldr	x16, [x16]
		000000000000e634:  ARM64_RELOC_PAGEOFF12	l_stogir.488
    e638:      	orr	x19, x16, xzr
    e63c:      	lsr	w1, w1, #0
    e640:      	lsr	w2, w2, #0
    e644:      	mov	x20, x8
    e648:      	mov	x21, x0
    e64c:      	mov	w0, w1
    e650:      	mov	w22, w1
    e654:      	mov	w1, w2
    e658:      	mov	w23, w2
    e65c:      	mov	w24, w3
    e660:      	mov	w25, w4
    e664:      	mov	w26, w5
    e668:      	bl	0xe668 <_stogir.vector-arithmetic.operands+0x70>
		000000000000e668:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.valid-type?
    e66c:      	cmp	x0, #0x0
    e670:      	b.eq	0xe680 <_stogir.vector-arithmetic.operands+0x88>
    e674:      	mov	x0, x19
    e678:      	movz	x1, #0x0, lsl #48
    e67c:      	b	0xe690 <_stogir.vector-arithmetic.operands+0x98>
    e680:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000e680:  ARM64_RELOC_PAGE21	l_stogir.489
    e684:      	ldr	x16, [x16]
		000000000000e684:  ARM64_RELOC_PAGEOFF12	l_stogir.489
    e688:      	orr	x0, x16, xzr
    e68c:      	mov	x1, #0x37               ; =55
    e690:      	sxtw	x22, w22
    e694:      	sxtw	x23, w23
    e698:      	sxtw	x24, w24
    e69c:      	sxtw	x25, w25
    e6a0:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000e6a0:  ARM64_RELOC_PAGE21	l_stogir.490
    e6a4:      	ldr	x16, [x16]
		000000000000e6a4:  ARM64_RELOC_PAGEOFF12	l_stogir.490
    e6a8:      	orr	x2, x16, xzr
    e6ac:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000e6ac:  ARM64_RELOC_PAGE21	l_stogir.491
    e6b0:      	ldr	x16, [x16]
		000000000000e6b0:  ARM64_RELOC_PAGEOFF12	l_stogir.491
    e6b4:      	orr	x3, x16, xzr
    e6b8:      	add	x4, x21, #0x78
    e6bc:      	add	x5, x21, #0x28
    e6c0:      	add	x6, x21, #0x50
    e6c4:      	cmp	x22, #0x31
    e6c8:      	cset	w7, ge
    e6cc:      	cmp	x22, #0x35
    e6d0:      	cset	w8, le
    e6d4:      	cmp	x22, #0x1f
    e6d8:      	cset	w9, eq
    e6dc:      	cmp	x22, #0x20
    e6e0:      	cset	w10, eq
    e6e4:      	cmp	x22, #0x2d
    e6e8:      	cset	w11, eq
    e6ec:      	cmp	x22, #0x36
    e6f0:      	cset	w12, eq
    e6f4:      	cmp	x22, #0x37
    e6f8:      	cset	w13, eq
    e6fc:      	cmp	x22, #0x38
    e700:      	cset	w14, eq
    e704:      	cmp	x22, #0x39
    e708:      	cset	w15, eq
    e70c:      	ubfx	x15, x15, #0, #8
    e710:      	mov	x27, x1
    e714:      	mov	x1, x0
    e718:      	movz	x0, #0x0, lsl #48
    e71c:      	b	0xe7fc <_stogir.vector-arithmetic.operands+0x204>
    e720:      	movz	x3, #0x0, lsl #48
    e724:      	b	0xe734 <_stogir.vector-arithmetic.operands+0x13c>
    e728:      	movz	x3, #0x0, lsl #48
    e72c:      	b	0xe73c <_stogir.vector-arithmetic.operands+0x144>
    e730:      	movz	x3, #0x0, lsl #48
    e734:      	b	0xe748 <_stogir.vector-arithmetic.operands+0x150>
    e738:      	movz	x3, #0x0, lsl #48
    e73c:      	str	x5, [sp, #0x60]
    e740:      	b	0xe748 <_stogir.vector-arithmetic.operands+0x150>
    e744:      	movz	x3, #0x0, lsl #48
    e748:      	cmp	x3, #0x0
    e74c:      	b.eq	0xe78c <_stogir.vector-arithmetic.operands+0x194>
    e750:      	uxtb	w16, w2
    e754:      	cmp	w16, wzr
    e758:      	b.eq	0xe770 <_stogir.vector-arithmetic.operands+0x178>
    e75c:      	lsl	x1, x1, #4
    e760:      	ldr	x2, [x21]
    e764:      	add	x1, x1, x2
    e768:      	ldr	x1, [x1]
    e76c:      	b	0xe780 <_stogir.vector-arithmetic.operands+0x188>
    e770:      	lsl	x1, x9, #4
    e774:      	ldr	x2, [x21, #0x28]
    e778:      	add	x1, x1, x2
    e77c:      	ldr	x1, [x1]
    e780:      	mov	x2, x1
    e784:      	mov	x1, #0x1                ; =1
    e788:      	b	0xe794 <_stogir.vector-arithmetic.operands+0x19c>
    e78c:      	movz	x1, #0x0, lsl #48
    e790:      	movz	x2, #0x0, lsl #48
    e794:      	lsr	w1, w1, #0
    e798:      	lsr	x16, x1, #0
    e79c:      	cmp	x16, #0x1
    e7a0:      	b.eq	0xe7bc <_stogir.vector-arithmetic.operands+0x1c4>
    e7a4:      	b.lo	0xe7ac <_stogir.vector-arithmetic.operands+0x1b4>
    e7a8:      	b	0xe7c0 <_stogir.vector-arithmetic.operands+0x1c8>
    e7ac:      	cmp	x16, #0x0
    e7b0:      	b.eq	0xe7b8 <_stogir.vector-arithmetic.operands+0x1c0>
    e7b4:      	b	0xe7c0 <_stogir.vector-arithmetic.operands+0x1c8>
    e7b8:      	b	0xe7c4 <_stogir.vector-arithmetic.operands+0x1cc>
    e7bc:      	b	0xe92c <_stogir.vector-arithmetic.operands+0x334>
    e7c0:      	b	0xeb78 <_stogir.vector-arithmetic.operands+0x580>
    e7c4:      	ldr	x1, [sp, #0x40]
    e7c8:      	mov	x2, #0x21               ; =33
    e7cc:      	b	0xe7d8 <_stogir.vector-arithmetic.operands+0x1e0>
    e7d0:      	ldr	x1, [sp, #0x48]
    e7d4:      	mov	x2, #0x32               ; =50
    e7d8:      	add	x0, x0, #0x1
    e7dc:      	lsr	w0, w0, #0
    e7e0:      	sxtw	x0, w0
    e7e4:      	ldr	x3, [sp, #0x48]
    e7e8:      	ldr	w9, [sp, #0x50]
    e7ec:      	ldr	x4, [sp, #0x58]
    e7f0:      	ldr	x5, [sp, #0x60]
    e7f4:      	mov	x27, x2
    e7f8:      	ldr	x2, [sp, #0x40]
    e7fc:      	uxtb	w16, w9
    e800:      	cmp	w16, wzr
    e804:      	b.eq	0xe858 <_stogir.vector-arithmetic.operands+0x260>
    e808:      	mov	x28, x27
    e80c:      	mov	x27, x1
    e810:      	mov	x1, #0x1                ; =1
    e814:      	b	0xe82c <_stogir.vector-arithmetic.operands+0x234>
    e818:      	mov	x28, x15
    e81c:      	fmov	d31, x1
    e820:      	mov	x1, x28
    e824:      	mov	x28, x27
    e828:      	fmov	x27, d31
    e82c:      	cmp	x1, #0x0
    e830:      	b.eq	0xe83c <_stogir.vector-arithmetic.operands+0x244>
    e834:      	mov	x1, #0x1                ; =1
    e838:      	b	0xe840 <_stogir.vector-arithmetic.operands+0x248>
    e83c:      	mov	x1, #0x2                ; =2
    e840:      	cmp	x0, x1
    e844:      	b.ge	0xe9b4 <_stogir.vector-arithmetic.operands+0x3bc>
    e848:      	cmp	x0, #0x0
    e84c:      	b.ne	0xe86c <_stogir.vector-arithmetic.operands+0x274>
    e850:      	mov	x1, x24
    e854:      	b	0xe870 <_stogir.vector-arithmetic.operands+0x278>
    e858:      	uxtb	w16, w10
    e85c:      	cmp	w16, wzr
    e860:      	b.eq	0xe98c <_stogir.vector-arithmetic.operands+0x394>
    e864:      	mov	x28, #0x1               ; =1
    e868:      	b	0xe81c <_stogir.vector-arithmetic.operands+0x224>
    e86c:      	mov	x1, x25
    e870:      	lsr	w1, w1, #0
    e874:      	sxtw	x1, w1
    e878:      	str	x2, [sp, #0x40]
    e87c:      	cmp	x1, #0x0
    e880:      	cset	w2, gt
    e884:      	str	x3, [sp, #0x48]
    e888:      	movz	x16, #0x0, lsl #48
    e88c:      	sub	x3, x16, x1
    e890:      	str	w9, [sp, #0x50]
    e894:      	sub	x9, x3, #0x1
    e898:      	uxtb	w16, w2
    e89c:      	cmp	w16, wzr
    e8a0:      	b.eq	0xec38 <_stogir.vector-arithmetic.operands+0x640>
    e8a4:      	ldr	x3, [x21, #0x8]
    e8a8:      	cmp	x1, x3
    e8ac:      	b.ge	0xec40 <_stogir.vector-arithmetic.operands+0x648>
    e8b0:      	ldr	x3, [x4, #0x8]
    e8b4:      	cmp	x1, x3
    e8b8:      	b.ge	0xec48 <_stogir.vector-arithmetic.operands+0x650>
    e8bc:      	lsl	x3, x1, #2
    e8c0:      	str	x4, [sp, #0x58]
    e8c4:      	ldr	x4, [x21, #0x78]
    e8c8:      	add	x3, x3, x4
    e8cc:      	ldr	w3, [x3]
    e8d0:      	sxtw	x3, w3
    e8d4:      	cmp	x3, #0x0
    e8d8:      	cset	w3, ge
    e8dc:      	ubfx	x3, x3, #0, #8
    e8e0:      	b	0xe72c <_stogir.vector-arithmetic.operands+0x134>
    e8e4:      	cmp	x1, #0x0
    e8e8:      	b.ge	0xec50 <_stogir.vector-arithmetic.operands+0x658>
    e8ec:      	ldr	x4, [x5, #0x8]
    e8f0:      	str	x5, [sp, #0x60]
    e8f4:      	ldr	x5, [x6, #0x8]
    e8f8:      	cmp	x4, x5
    e8fc:      	b.ne	0xe730 <_stogir.vector-arithmetic.operands+0x138>
    e900:      	cmp	x3, x4
    e904:      	b.gt	0xe720 <_stogir.vector-arithmetic.operands+0x128>
    e908:      	lsl	x3, x9, #2
    e90c:      	ldr	x4, [x21, #0x50]
    e910:      	add	x3, x3, x4
    e914:      	ldr	w3, [x3]
    e918:      	sxtw	x3, w3
    e91c:      	cmp	x3, #0x0
    e920:      	cset	w3, gt
    e924:      	ubfx	x3, x3, #0, #8
    e928:      	b	0xe724 <_stogir.vector-arithmetic.operands+0x12c>
    e92c:      	lsr	w1, w2, #0
    e930:      	ubfx	x1, x1, #8, #8
    e934:      	cmp	x1, x23
    e938:      	b.eq	0xe96c <_stogir.vector-arithmetic.operands+0x374>
    e93c:      	cmp	x0, #0x1
    e940:      	b.ne	0xe7d0 <_stogir.vector-arithmetic.operands+0x1d8>
    e944:      	uxtb	w16, w7
    e948:      	cmp	w16, wzr
    e94c:      	b.eq	0xe7d0 <_stogir.vector-arithmetic.operands+0x1d8>
    e950:      	uxtb	w16, w8
    e954:      	cmp	w16, wzr
    e958:      	b.eq	0xe7d0 <_stogir.vector-arithmetic.operands+0x1d8>
    e95c:      	cmp	x1, #0x1
    e960:      	b.lt	0xe7d0 <_stogir.vector-arithmetic.operands+0x1d8>
    e964:      	cmp	x1, #0xb
    e968:      	b.gt	0xe7d0 <_stogir.vector-arithmetic.operands+0x1d8>
    e96c:      	uxtb	w2, w2
    e970:      	cmp	x2, #0x48
    e974:      	b.eq	0xe7d0 <_stogir.vector-arithmetic.operands+0x1d8>
    e978:      	cmp	x2, #0x46
    e97c:      	b.eq	0xe7d0 <_stogir.vector-arithmetic.operands+0x1d8>
    e980:      	mov	x1, x27
    e984:      	mov	x2, x28
    e988:      	b	0xe7d8 <_stogir.vector-arithmetic.operands+0x1e0>
    e98c:      	uxtb	w16, w11
    e990:      	cmp	w16, wzr
    e994:      	b.eq	0xe9a0 <_stogir.vector-arithmetic.operands+0x3a8>
    e998:      	mov	x28, #0x1               ; =1
    e99c:      	b	0xe81c <_stogir.vector-arithmetic.operands+0x224>
    e9a0:      	uxtb	w16, w12
    e9a4:      	cmp	w16, wzr
    e9a8:      	b.eq	0xe9d0 <_stogir.vector-arithmetic.operands+0x3d8>
    e9ac:      	mov	x28, #0x1               ; =1
    e9b0:      	b	0xe81c <_stogir.vector-arithmetic.operands+0x224>
    e9b4:      	sxtw	x24, w26
    e9b8:      	cmp	x24, #0x0
    e9bc:      	b.ne	0xe9e4 <_stogir.vector-arithmetic.operands+0x3ec>
    e9c0:      	mov	x1, x27
    e9c4:      	mov	x2, x28
    e9c8:      	movz	x0, #0x0, lsl #48
    e9cc:      	b	0xe9f0 <_stogir.vector-arithmetic.operands+0x3f8>
    e9d0:      	uxtb	w16, w13
    e9d4:      	cmp	w16, wzr
    e9d8:      	b.eq	0xead8 <_stogir.vector-arithmetic.operands+0x4e0>
    e9dc:      	mov	x28, #0x1               ; =1
    e9e0:      	b	0xe81c <_stogir.vector-arithmetic.operands+0x224>
    e9e4:      	mov	x1, x27
    e9e8:      	mov	x2, x28
    e9ec:      	mov	x0, #0x1                ; =1
    e9f0:      	cmp	x0, #0x0
    e9f4:      	b.eq	0xea08 <_stogir.vector-arithmetic.operands+0x410>
    e9f8:      	cmp	x22, #0x1d
    e9fc:      	b.ne	0xeb48 <_stogir.vector-arithmetic.operands+0x550>
    ea00:      	mov	x0, #0x1                ; =1
    ea04:      	b	0xeb54 <_stogir.vector-arithmetic.operands+0x55c>
    ea08:      	mov	x21, x1
    ea0c:      	mov	x22, x2
    ea10:      	cmp	x22, #0x0
    ea14:      	b.ne	0xea44 <_stogir.vector-arithmetic.operands+0x44c>
    ea18:      	cmp	x22, #0x0
    ea1c:      	b.eq	0xeac4 <_stogir.vector-arithmetic.operands+0x4cc>
    ea20:      	lsr	x0, x22, #0
    ea24:      	mov	x1, x19
    ea28:      	mov	x2, x0
    ea2c:      	mov	x0, x21
    ea30:      	bl	0xea30 <_stogir.vector-arithmetic.operands+0x438>
		000000000000ea30:  ARM64_RELOC_BRANCH26	_memcmp
    ea34:      	lsr	w0, w0, #0
    ea38:      	sxtw	x0, w0
    ea3c:      	cmp	x0, #0x0
    ea40:      	b.eq	0xeac4 <_stogir.vector-arithmetic.operands+0x4cc>
    ea44:      	mov	x1, x21
    ea48:      	mov	x2, x22
    ea4c:      	mov	x0, #0x1                ; =1
    ea50:      	str	x0, [x20]
    ea54:      	str	x1, [x20, #0x8]
    ea58:      	str	x2, [x20, #0x10]
    ea5c:      	ldr	x19, [sp, #0x68]
    ea60:      	ldr	x20, [sp, #0x70]
    ea64:      	ldr	x21, [sp, #0x78]
    ea68:      	ldr	x22, [sp, #0x80]
    ea6c:      	ldr	x23, [sp, #0x88]
    ea70:      	ldr	x24, [sp, #0x90]
    ea74:      	ldr	x25, [sp, #0x98]
    ea78:      	ldr	x26, [sp, #0xa0]
    ea7c:      	ldr	x27, [sp, #0xa8]
    ea80:      	ldr	x28, [sp, #0xb0]
    ea84:      	ldr	x29, [sp]
    ea88:      	ldr	x30, [sp, #0x8]
    ea8c:      	add	sp, sp, #0xc0
    ea90:      	ret
    ea94:      	mov	x22, x1
    ea98:      	mov	x25, x2
    ea9c:      	mov	x0, #0x1                ; =1
    eaa0:      	cmp	x0, #0x0
    eaa4:      	b.eq	0xeaec <_stogir.vector-arithmetic.operands+0x4f4>
    eaa8:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000eaa8:  ARM64_RELOC_PAGE21	l_stogir.492
    eaac:      	ldr	x16, [x16]
		000000000000eaac:  ARM64_RELOC_PAGEOFF12	l_stogir.492
    eab0:      	orr	x0, x16, xzr
    eab4:      	mov	x1, #0x23               ; =35
    eab8:      	mov	x21, x0
    eabc:      	mov	x22, x1
    eac0:      	b	0xea10 <_stogir.vector-arithmetic.operands+0x418>
    eac4:      	and	x0, x23, #0xffffffff
    eac8:      	mov	x1, x0
    eacc:      	movz	x0, #0x0, lsl #48
    ead0:      	movz	x2, #0x0, lsl #48
    ead4:      	b	0xea50 <_stogir.vector-arithmetic.operands+0x458>
    ead8:      	uxtb	w16, w14
    eadc:      	cmp	w16, wzr
    eae0:      	b.eq	0xe818 <_stogir.vector-arithmetic.operands+0x220>
    eae4:      	mov	x28, #0x1               ; =1
    eae8:      	b	0xe81c <_stogir.vector-arithmetic.operands+0x224>
    eaec:      	lsr	w26, w26, #0
    eaf0:      	add	x8, sp, #0x10
    eaf4:      	mov	x0, x21
    eaf8:      	mov	w1, w26
    eafc:      	bl	0xeafc <_stogir.vector-arithmetic.operands+0x504>
		000000000000eafc:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    eb00:      	add	x16, sp, #0x10
    eb04:      	ldr	w0, [x16]
    eb08:      	lsr	x16, x0, #0
    eb0c:      	cmp	x16, #0x1
    eb10:      	b.eq	0xeb2c <_stogir.vector-arithmetic.operands+0x534>
    eb14:      	b.lo	0xeb1c <_stogir.vector-arithmetic.operands+0x524>
    eb18:      	b	0xeb30 <_stogir.vector-arithmetic.operands+0x538>
    eb1c:      	cmp	x16, #0x0
    eb20:      	b.eq	0xeb28 <_stogir.vector-arithmetic.operands+0x530>
    eb24:      	b	0xeb30 <_stogir.vector-arithmetic.operands+0x538>
    eb28:      	b	0xeb34 <_stogir.vector-arithmetic.operands+0x53c>
    eb2c:      	b	0xeb80 <_stogir.vector-arithmetic.operands+0x588>
    eb30:      	b	0xec30 <_stogir.vector-arithmetic.operands+0x638>
    eb34:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000eb34:  ARM64_RELOC_PAGE21	l_stogir.493
    eb38:      	ldr	x16, [x16]
		000000000000eb38:  ARM64_RELOC_PAGEOFF12	l_stogir.493
    eb3c:      	orr	x0, x16, xzr
    eb40:      	mov	x1, #0x1d               ; =29
    eb44:      	b	0xeb74 <_stogir.vector-arithmetic.operands+0x57c>
    eb48:      	cmp	x22, #0x1e
    eb4c:      	cset	w0, eq
    eb50:      	ubfx	x0, x0, #0, #8
    eb54:      	cmp	x0, #0x0
    eb58:      	b.eq	0xea94 <_stogir.vector-arithmetic.operands+0x49c>
    eb5c:      	mov	x22, x1
    eb60:      	mov	x25, x2
    eb64:      	movz	x0, #0x0, lsl #48
    eb68:      	b	0xeaa0 <_stogir.vector-arithmetic.operands+0x4a8>
    eb6c:      	mov	x0, x1
    eb70:      	mov	x1, x2
    eb74:      	b	0xeab8 <_stogir.vector-arithmetic.operands+0x4c0>
    eb78:      	brk	#0
    eb7c:      	b	0xeb78 <_stogir.vector-arithmetic.operands+0x580>
    eb80:      	add	x16, sp, #0x10
    eb84:      	ldr	x0, [x16, #0x8]
    eb88:      	cmp	x24, #0x0
    eb8c:      	b.gt	0xebc8 <_stogir.vector-arithmetic.operands+0x5d0>
    eb90:      	mov	x1, x22
    eb94:      	mov	x2, x25
    eb98:      	mov	x0, #0x1                ; =1
    eb9c:      	b	0xebac <_stogir.vector-arithmetic.operands+0x5b4>
    eba0:      	movz	x0, #0x0, lsl #48
    eba4:      	mov	x1, x22
    eba8:      	mov	x2, x25
    ebac:      	cmp	x0, #0x0
    ebb0:      	b.eq	0xeb6c <_stogir.vector-arithmetic.operands+0x574>
    ebb4:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000ebb4:  ARM64_RELOC_PAGE21	l_stogir.494
    ebb8:      	ldr	x16, [x16]
		000000000000ebb8:  ARM64_RELOC_PAGEOFF12	l_stogir.494
    ebbc:      	orr	x0, x16, xzr
    ebc0:      	mov	x1, #0x34               ; =52
    ebc4:      	b	0xeb74 <_stogir.vector-arithmetic.operands+0x57c>
    ebc8:      	uxtb	w0, w0
    ebcc:      	cmp	x0, #0x83
    ebd0:      	b.ge	0xebec <_stogir.vector-arithmetic.operands+0x5f4>
    ebd4:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000ebd4:  ARM64_RELOC_PAGE21	l_stogir.495
    ebd8:      	ldr	x16, [x16]
		000000000000ebd8:  ARM64_RELOC_PAGEOFF12	l_stogir.495
    ebdc:      	orr	x1, x16, xzr
    ebe0:      	add	x1, x0, x1
    ebe4:      	ldrb	w1, [x1]
    ebe8:      	b	0xebf0 <_stogir.vector-arithmetic.operands+0x5f8>
    ebec:      	movz	x1, #0x0, lsl #48
    ebf0:      	uxtb	w1, w1
    ebf4:      	and	x1, x1, #0x2
    ebf8:      	uxtb	w1, w1
    ebfc:      	cmp	x1, #0x0
    ec00:      	cset	w1, eq
    ec04:      	uxtb	w16, w1
    ec08:      	cmp	w16, wzr
    ec0c:      	cset	x1, eq
    ec10:      	cmp	x1, #0x0
    ec14:      	b.ne	0xeba0 <_stogir.vector-arithmetic.operands+0x5a8>
    ec18:      	cmp	x0, #0x65
    ec1c:      	b.eq	0xeba0 <_stogir.vector-arithmetic.operands+0x5a8>
    ec20:      	cmp	x0, #0x66
    ec24:      	b.eq	0xeba0 <_stogir.vector-arithmetic.operands+0x5a8>
    ec28:      	mov	x0, #0x1                ; =1
    ec2c:      	b	0xeba4 <_stogir.vector-arithmetic.operands+0x5ac>
    ec30:      	brk	#0
    ec34:      	b	0xec30 <_stogir.vector-arithmetic.operands+0x638>
    ec38:      	str	x4, [sp, #0x58]
    ec3c:      	b	0xe8e4 <_stogir.vector-arithmetic.operands+0x2ec>
    ec40:      	str	x4, [sp, #0x58]
    ec44:      	b	0xe738 <_stogir.vector-arithmetic.operands+0x140>
    ec48:      	str	x4, [sp, #0x58]
    ec4c:      	b	0xe728 <_stogir.vector-arithmetic.operands+0x130>
    ec50:      	str	x5, [sp, #0x60]
    ec54:      	b	0xe744 <_stogir.vector-arithmetic.operands+0x14c>

000000000000ec58 <_stogir.types.base-type>:
    ec58:      	sub	sp, sp, #0x20
    ec5c:      	str	x29, [sp]
    ec60:      	str	x30, [sp, #0x8]
    ec64:      	mov	x29, sp
    ec68:      	str	x19, [sp, #0x10]
    ec6c:      	lsr	w0, w0, #0
    ec70:      	mov	w19, w0
    ec74:      	bl	0xec74 <_stogir.types.base-type+0x1c>
		000000000000ec74:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    ec78:      	cmp	x0, #0x0
    ec7c:      	b.eq	0xec94 <_stogir.types.base-type+0x3c>
    ec80:      	sxtw	x19, w19
    ec84:      	and	x0, x19, #0xf
    ec88:      	lsr	w0, w0, #0
    ec8c:      	sxtw	x0, w0
    ec90:      	b	0xec98 <_stogir.types.base-type+0x40>
    ec94:      	movn	x0, #0x0, lsl #48
    ec98:      	ldr	x19, [sp, #0x10]
    ec9c:      	ldr	x29, [sp]
    eca0:      	ldr	x30, [sp, #0x8]
    eca4:      	add	sp, sp, #0x20
    eca8:      	ret

000000000000ecac <_stogir.types.lanes>:
    ecac:      	sxtw	x0, w0
    ecb0:      	cmp	x0, #0xf
    ecb4:      	b.le	0xed04 <_stogir.types.lanes+0x58>
    ecb8:      	cmp	x0, #0x80
    ecbc:      	b.ge	0xed04 <_stogir.types.lanes+0x58>
    ecc0:      	and	x1, x0, #0xf
    ecc4:      	lsr	w1, w1, #0
    ecc8:      	sxtw	x1, w1
    eccc:      	cmp	x1, #0x1
    ecd0:      	b.lt	0xed04 <_stogir.types.lanes+0x58>
    ecd4:      	cmp	x1, #0xd
    ecd8:      	b.gt	0xed04 <_stogir.types.lanes+0x58>
    ecdc:      	ubfx	x0, x0, #4, #32
    ece0:      	sxtw	x0, w0
    ece4:      	sub	x0, x0, #0x1
    ece8:      	lsr	w0, w0, #0
    ecec:      	sxtw	x0, w0
    ecf0:      	mov	x16, #0x1               ; =1
    ecf4:      	lsl	x0, x16, x0
    ecf8:      	lsr	w0, w0, #0
    ecfc:      	sxtw	x0, w0
    ed00:      	b	0xed30 <_stogir.types.lanes+0x84>
    ed04:      	cmp	x0, #0x0
    ed08:      	b.lt	0xed2c <_stogir.types.lanes+0x80>
    ed0c:      	cmp	x0, #0xd
    ed10:      	b.gt	0xed2c <_stogir.types.lanes+0x80>
    ed14:      	cmp	x0, #0x0
    ed18:      	cset	w0, eq
    ed1c:      	uxtb	w16, w0
    ed20:      	cmp	w16, wzr
    ed24:      	cset	x0, eq
    ed28:      	b	0xed30 <_stogir.types.lanes+0x84>
    ed2c:      	movn	x0, #0x0, lsl #48
    ed30:      	ret

000000000000ed34 <_coil.core.Get$slice$get__u8>:
    ed34:      	lsr	x1, x2, #0
    ed38:      	add	x0, x1, x0
    ed3c:      	ldrb	w0, [x0]
    ed40:      	ret

000000000000ed44 <_stogir.checked.valid-type?>:
    ed44:      	sxtw	x0, w0
    ed48:      	cmp	x0, #0x1
    ed4c:      	b.lt	0xed70 <_stogir.checked.valid-type?+0x2c>
    ed50:      	cmp	x0, #0xb
    ed54:      	b.gt	0xed70 <_stogir.checked.valid-type?+0x2c>
    ed58:      	cmp	x0, #0x1
    ed5c:      	cset	w0, eq
    ed60:      	uxtb	w16, w0
    ed64:      	cmp	w16, wzr
    ed68:      	cset	x0, eq
    ed6c:      	b	0xed74 <_stogir.checked.valid-type?+0x30>
    ed70:      	movz	x0, #0x0, lsl #48
    ed74:      	ret

000000000000ed78 <_coil.core.Iterable$slice$iter__i32>:
    ed78:      	str	x0, [x8]
    ed7c:      	str	x1, [x8, #0x8]
    ed80:      	movz	x17, #0x0, lsl #48
    ed84:      	str	x17, [x8, #0x10]
    ed88:      	ret

000000000000ed8c <_coil.core.Iterator$coil.slice.SliceIter$next__i32>:
    ed8c:      	sub	sp, sp, #0x10
    ed90:      	mov	x1, sp
    ed94:      	ldr	x2, [x0, #0x10]
    ed98:      	ldr	x3, [x0]
    ed9c:      	ldr	x4, [x0, #0x8]
    eda0:      	cmp	x2, x4
    eda4:      	b.ge	0xedd0 <_coil.core.Iterator$coil.slice.SliceIter$next__i32+0x44>
    eda8:      	add	x4, x2, #0x1
    edac:      	lsl	x2, x2, #2
    edb0:      	add	x2, x2, x3
    edb4:      	str	x4, [x0, #0x10]
    edb8:      	ldr	w0, [x2]
    edbc:      	sxtw	x0, w0
    edc0:      	and	x0, x0, #0xffffffff
    edc4:      	mov	x2, x0
    edc8:      	mov	x0, #0x1                ; =1
    edcc:      	b	0xedd8 <_coil.core.Iterator$coil.slice.SliceIter$next__i32+0x4c>
    edd0:      	movz	x0, #0x0, lsl #48
    edd4:      	movz	x2, #0x0, lsl #48
    edd8:      	str	x0, [x1]
    eddc:      	str	x2, [x1, #0x8]
    ede0:      	ldr	x0, [sp]
    ede4:      	ldr	x1, [sp, #0x8]
    ede8:      	add	sp, sp, #0x10
    edec:      	ret

000000000000edf0 <_stogir.terminal.previous-input>:
    edf0:      	sxtw	x1, w1
    edf4:      	cmp	x1, #0x0
    edf8:      	b.ne	0xee18 <_stogir.terminal.previous-input+0x28>
    edfc:      	movz	x0, #0x0, lsl #48
    ee00:      	movz	x1, #0x0, lsl #48
    ee04:      	movz	x2, #0x0, lsl #48
    ee08:      	str	x0, [x8]
    ee0c:      	str	x1, [x8, #0x8]
    ee10:      	str	x2, [x8, #0x10]
    ee14:      	ret
    ee18:      	cmp	x1, #0x0
    ee1c:      	cset	w2, gt
    ee20:      	movz	x16, #0x0, lsl #48
    ee24:      	sub	x3, x16, x1
    ee28:      	sub	x4, x3, #0x1
    ee2c:      	uxtb	w16, w2
    ee30:      	cmp	w16, wzr
    ee34:      	b.eq	0xee94 <_stogir.terminal.previous-input+0xa4>
    ee38:      	ldr	x3, [x0, #0x8]
    ee3c:      	cmp	x1, x3
    ee40:      	b.ge	0xeee0 <_stogir.terminal.previous-input+0xf0>
    ee44:      	add	x3, x0, #0x78
    ee48:      	ldr	x3, [x3, #0x8]
    ee4c:      	cmp	x1, x3
    ee50:      	b.ge	0xefb8 <_stogir.terminal.previous-input+0x1c8>
    ee54:      	lsl	x3, x1, #2
    ee58:      	ldr	x5, [x0, #0x78]
    ee5c:      	add	x3, x3, x5
    ee60:      	ldr	w3, [x3]
    ee64:      	sxtw	x3, w3
    ee68:      	cmp	x3, #0x0
    ee6c:      	cset	w3, ge
    ee70:      	ubfx	x3, x3, #0, #8
    ee74:      	b	0xefbc <_stogir.terminal.previous-input+0x1cc>
    ee78:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000ee78:  ARM64_RELOC_PAGE21	l_stogir.496
    ee7c:      	ldr	x16, [x16]
		000000000000ee7c:  ARM64_RELOC_PAGEOFF12	l_stogir.496
    ee80:      	orr	x0, x16, xzr
    ee84:      	mov	x1, x0
    ee88:      	mov	x0, #0x1                ; =1
    ee8c:      	mov	x2, #0x2e               ; =46
    ee90:      	b	0xee08 <_stogir.terminal.previous-input+0x18>
    ee94:      	cmp	x1, #0x0
    ee98:      	b.ge	0xeee8 <_stogir.terminal.previous-input+0xf8>
    ee9c:      	add	x5, x0, #0x28
    eea0:      	add	x6, x0, #0x50
    eea4:      	ldr	x5, [x5, #0x8]
    eea8:      	ldr	x6, [x6, #0x8]
    eeac:      	cmp	x5, x6
    eeb0:      	b.ne	0xefb0 <_stogir.terminal.previous-input+0x1c0>
    eeb4:      	cmp	x3, x5
    eeb8:      	b.gt	0xefc0 <_stogir.terminal.previous-input+0x1d0>
    eebc:      	lsl	x3, x4, #2
    eec0:      	ldr	x5, [x0, #0x50]
    eec4:      	add	x3, x3, x5
    eec8:      	ldr	w3, [x3]
    eecc:      	sxtw	x3, w3
    eed0:      	cmp	x3, #0x0
    eed4:      	cset	w3, gt
    eed8:      	ubfx	x3, x3, #0, #8
    eedc:      	b	0xefc4 <_stogir.terminal.previous-input+0x1d4>
    eee0:      	movz	x3, #0x0, lsl #48
    eee4:      	b	0xeeec <_stogir.terminal.previous-input+0xfc>
    eee8:      	movz	x3, #0x0, lsl #48
    eeec:      	cmp	x3, #0x0
    eef0:      	b.eq	0xef30 <_stogir.terminal.previous-input+0x140>
    eef4:      	uxtb	w16, w2
    eef8:      	cmp	w16, wzr
    eefc:      	b.eq	0xef14 <_stogir.terminal.previous-input+0x124>
    ef00:      	lsl	x2, x1, #4
    ef04:      	ldr	x0, [x0]
    ef08:      	add	x0, x2, x0
    ef0c:      	ldr	x0, [x0]
    ef10:      	b	0xef24 <_stogir.terminal.previous-input+0x134>
    ef14:      	lsl	x2, x4, #4
    ef18:      	ldr	x0, [x0, #0x28]
    ef1c:      	add	x0, x2, x0
    ef20:      	ldr	x0, [x0]
    ef24:      	mov	x2, x0
    ef28:      	mov	x0, #0x1                ; =1
    ef2c:      	b	0xef38 <_stogir.terminal.previous-input+0x148>
    ef30:      	movz	x0, #0x0, lsl #48
    ef34:      	movz	x2, #0x0, lsl #48
    ef38:      	lsr	w0, w0, #0
    ef3c:      	lsr	x16, x0, #0
    ef40:      	cmp	x16, #0x1
    ef44:      	b.eq	0xef60 <_stogir.terminal.previous-input+0x170>
    ef48:      	b.lo	0xef50 <_stogir.terminal.previous-input+0x160>
    ef4c:      	b	0xef64 <_stogir.terminal.previous-input+0x174>
    ef50:      	cmp	x16, #0x0
    ef54:      	b.eq	0xef5c <_stogir.terminal.previous-input+0x16c>
    ef58:      	b	0xef64 <_stogir.terminal.previous-input+0x174>
    ef5c:      	b	0xef68 <_stogir.terminal.previous-input+0x178>
    ef60:      	b	0xef84 <_stogir.terminal.previous-input+0x194>
    ef64:      	b	0xf008 <_stogir.terminal.previous-input+0x218>
    ef68:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000ef68:  ARM64_RELOC_PAGE21	l_stogir.497
    ef6c:      	ldr	x16, [x16]
		000000000000ef6c:  ARM64_RELOC_PAGEOFF12	l_stogir.497
    ef70:      	orr	x0, x16, xzr
    ef74:      	mov	x1, x0
    ef78:      	mov	x0, #0x1                ; =1
    ef7c:      	mov	x2, #0x1d               ; =29
    ef80:      	b	0xee90 <_stogir.terminal.previous-input+0xa0>
    ef84:      	cmp	x1, #0x0
    ef88:      	b.le	0xee78 <_stogir.terminal.previous-input+0x88>
    ef8c:      	uxtb	w2, w2
    ef90:      	cmp	x2, #0x83
    ef94:      	b.ge	0xefc8 <_stogir.terminal.previous-input+0x1d8>
    ef98:      	adrp	x16, 0xe000 <_stogir.vector-comparison.operands+0x98>
		000000000000ef98:  ARM64_RELOC_PAGE21	l_stogir.498
    ef9c:      	ldr	x16, [x16]
		000000000000ef9c:  ARM64_RELOC_PAGEOFF12	l_stogir.498
    efa0:      	orr	x0, x16, xzr
    efa4:      	add	x0, x2, x0
    efa8:      	ldrb	w0, [x0]
    efac:      	b	0xefcc <_stogir.terminal.previous-input+0x1dc>
    efb0:      	movz	x3, #0x0, lsl #48
    efb4:      	b	0xeeec <_stogir.terminal.previous-input+0xfc>
    efb8:      	movz	x3, #0x0, lsl #48
    efbc:      	b	0xeee4 <_stogir.terminal.previous-input+0xf4>
    efc0:      	movz	x3, #0x0, lsl #48
    efc4:      	b	0xefb4 <_stogir.terminal.previous-input+0x1c4>
    efc8:      	movz	x0, #0x0, lsl #48
    efcc:      	uxtb	w0, w0
    efd0:      	and	x0, x0, #0x8
    efd4:      	uxtb	w0, w0
    efd8:      	cmp	x0, #0x0
    efdc:      	cset	w0, eq
    efe0:      	uxtb	w16, w0
    efe4:      	cmp	w16, wzr
    efe8:      	cset	x0, eq
    efec:      	cmp	x0, #0x0
    eff0:      	b.eq	0xee78 <_stogir.terminal.previous-input+0x88>
    eff4:      	and	x0, x1, #0xffffffff
    eff8:      	mov	x1, x0
    effc:      	movz	x0, #0x0, lsl #48
    f000:      	movz	x2, #0x0, lsl #48
    f004:      	b	0xee90 <_stogir.terminal.previous-input+0xa0>
    f008:      	brk	#0
    f00c:      	b	0xf008 <_stogir.terminal.previous-input+0x218>

000000000000f010 <_stogir.switch.selector-type>:
    f010:      	sxtw	x1, w1
    f014:      	cmp	x1, #0x0
    f018:      	cset	w2, gt
    f01c:      	movz	x16, #0x0, lsl #48
    f020:      	sub	x3, x16, x1
    f024:      	sub	x4, x3, #0x1
    f028:      	uxtb	w16, w2
    f02c:      	cmp	w16, wzr
    f030:      	b.eq	0xf074 <_stogir.switch.selector-type+0x64>
    f034:      	ldr	x3, [x0, #0x8]
    f038:      	cmp	x1, x3
    f03c:      	b.ge	0xf0c8 <_stogir.switch.selector-type+0xb8>
    f040:      	add	x3, x0, #0x78
    f044:      	ldr	x3, [x3, #0x8]
    f048:      	cmp	x1, x3
    f04c:      	b.ge	0xf1cc <_stogir.switch.selector-type+0x1bc>
    f050:      	lsl	x3, x1, #2
    f054:      	ldr	x5, [x0, #0x78]
    f058:      	add	x3, x3, x5
    f05c:      	ldr	w3, [x3]
    f060:      	sxtw	x3, w3
    f064:      	cmp	x3, #0x0
    f068:      	cset	w3, ge
    f06c:      	ubfx	x3, x3, #0, #8
    f070:      	b	0xf1d0 <_stogir.switch.selector-type+0x1c0>
    f074:      	cmp	x1, #0x0
    f078:      	b.ge	0xf0d0 <_stogir.switch.selector-type+0xc0>
    f07c:      	add	x5, x0, #0x28
    f080:      	add	x6, x0, #0x50
    f084:      	ldr	x5, [x5, #0x8]
    f088:      	ldr	x6, [x6, #0x8]
    f08c:      	cmp	x5, x6
    f090:      	b.ne	0xf0c0 <_stogir.switch.selector-type+0xb0>
    f094:      	cmp	x3, x5
    f098:      	b.gt	0xf1d4 <_stogir.switch.selector-type+0x1c4>
    f09c:      	lsl	x3, x4, #2
    f0a0:      	ldr	x5, [x0, #0x50]
    f0a4:      	add	x3, x3, x5
    f0a8:      	ldr	w3, [x3]
    f0ac:      	sxtw	x3, w3
    f0b0:      	cmp	x3, #0x0
    f0b4:      	cset	w3, gt
    f0b8:      	ubfx	x3, x3, #0, #8
    f0bc:      	b	0xf1d8 <_stogir.switch.selector-type+0x1c8>
    f0c0:      	movz	x3, #0x0, lsl #48
    f0c4:      	b	0xf0d4 <_stogir.switch.selector-type+0xc4>
    f0c8:      	movz	x3, #0x0, lsl #48
    f0cc:      	b	0xf0d4 <_stogir.switch.selector-type+0xc4>
    f0d0:      	movz	x3, #0x0, lsl #48
    f0d4:      	cmp	x3, #0x0
    f0d8:      	b.eq	0xf118 <_stogir.switch.selector-type+0x108>
    f0dc:      	uxtb	w16, w2
    f0e0:      	cmp	w16, wzr
    f0e4:      	b.eq	0xf0fc <_stogir.switch.selector-type+0xec>
    f0e8:      	lsl	x1, x1, #4
    f0ec:      	ldr	x0, [x0]
    f0f0:      	add	x0, x1, x0
    f0f4:      	ldr	x0, [x0]
    f0f8:      	b	0xf10c <_stogir.switch.selector-type+0xfc>
    f0fc:      	lsl	x1, x4, #4
    f100:      	ldr	x0, [x0, #0x28]
    f104:      	add	x0, x1, x0
    f108:      	ldr	x0, [x0]
    f10c:      	mov	x1, x0
    f110:      	mov	x0, #0x1                ; =1
    f114:      	b	0xf120 <_stogir.switch.selector-type+0x110>
    f118:      	movz	x0, #0x0, lsl #48
    f11c:      	movz	x1, #0x0, lsl #48
    f120:      	lsr	w0, w0, #0
    f124:      	lsr	x16, x0, #0
    f128:      	cmp	x16, #0x1
    f12c:      	b.eq	0xf148 <_stogir.switch.selector-type+0x138>
    f130:      	b.lo	0xf138 <_stogir.switch.selector-type+0x128>
    f134:      	b	0xf14c <_stogir.switch.selector-type+0x13c>
    f138:      	cmp	x16, #0x0
    f13c:      	b.eq	0xf144 <_stogir.switch.selector-type+0x134>
    f140:      	b	0xf14c <_stogir.switch.selector-type+0x13c>
    f144:      	b	0xf150 <_stogir.switch.selector-type+0x140>
    f148:      	b	0xf194 <_stogir.switch.selector-type+0x184>
    f14c:      	b	0xf1dc <_stogir.switch.selector-type+0x1cc>
    f150:      	adrp	x16, 0xf000 <_stogir.terminal.previous-input+0x210>
		000000000000f150:  ARM64_RELOC_PAGE21	l_stogir.499
    f154:      	ldr	x16, [x16]
		000000000000f154:  ARM64_RELOC_PAGEOFF12	l_stogir.499
    f158:      	orr	x0, x16, xzr
    f15c:      	mov	x1, x0
    f160:      	mov	x0, #0x1                ; =1
    f164:      	mov	x2, #0x17               ; =23
    f168:      	b	0xf184 <_stogir.switch.selector-type+0x174>
    f16c:      	adrp	x16, 0xf000 <_stogir.terminal.previous-input+0x210>
		000000000000f16c:  ARM64_RELOC_PAGE21	l_stogir.500
    f170:      	ldr	x16, [x16]
		000000000000f170:  ARM64_RELOC_PAGEOFF12	l_stogir.500
    f174:      	orr	x0, x16, xzr
    f178:      	mov	x1, x0
    f17c:      	mov	x0, #0x1                ; =1
    f180:      	mov	x2, #0x20               ; =32
    f184:      	str	x0, [x8]
    f188:      	str	x1, [x8, #0x8]
    f18c:      	str	x2, [x8, #0x10]
    f190:      	ret
    f194:      	lsr	w0, w1, #0
    f198:      	ubfx	x0, x0, #8, #8
    f19c:      	cmp	x0, #0x1
    f1a0:      	b.lt	0xf16c <_stogir.switch.selector-type+0x15c>
    f1a4:      	cmp	x0, #0xb
    f1a8:      	b.gt	0xf16c <_stogir.switch.selector-type+0x15c>
    f1ac:      	uxtb	w1, w1
    f1b0:      	cmp	x1, #0x48
    f1b4:      	b.eq	0xf16c <_stogir.switch.selector-type+0x15c>
    f1b8:      	and	x0, x0, #0xffffffff
    f1bc:      	mov	x1, x0
    f1c0:      	movz	x0, #0x0, lsl #48
    f1c4:      	movz	x2, #0x0, lsl #48
    f1c8:      	b	0xf184 <_stogir.switch.selector-type+0x174>
    f1cc:      	movz	x3, #0x0, lsl #48
    f1d0:      	b	0xf0cc <_stogir.switch.selector-type+0xbc>
    f1d4:      	movz	x3, #0x0, lsl #48
    f1d8:      	b	0xf0c4 <_stogir.switch.selector-type+0xb4>
    f1dc:      	brk	#0
    f1e0:      	b	0xf1dc <_stogir.switch.selector-type+0x1cc>

000000000000f1e4 <_stogir.switch.key>:
    f1e4:      	sub	sp, sp, #0x30
    f1e8:      	str	x19, [sp]
    f1ec:      	str	x20, [sp, #0x8]
    f1f0:      	str	x21, [sp, #0x10]
    f1f4:      	str	x22, [sp, #0x18]
    f1f8:      	str	x23, [sp, #0x20]
    f1fc:      	sxtw	x2, w2
    f200:      	cmp	x2, #0x1
    f204:      	b.lt	0xf280 <_stogir.switch.key+0x9c>
    f208:      	cmp	x2, #0xb
    f20c:      	cset	w3, le
    f210:      	uxtb	w16, w3
    f214:      	cmp	w16, wzr
    f218:      	b.eq	0xf280 <_stogir.switch.key+0x9c>
    f21c:      	sxtw	x1, w1
    f220:      	cmp	x1, #0x0
    f224:      	cset	w4, gt
    f228:      	movz	x16, #0x0, lsl #48
    f22c:      	sub	x5, x16, x1
    f230:      	sub	x6, x5, #0x1
    f234:      	uxtb	w16, w4
    f238:      	cmp	w16, wzr
    f23c:      	b.eq	0xf304 <_stogir.switch.key+0x120>
    f240:      	ldr	x5, [x0, #0x8]
    f244:      	cmp	x1, x5
    f248:      	b.ge	0xf350 <_stogir.switch.key+0x16c>
    f24c:      	add	x5, x0, #0x78
    f250:      	ldr	x5, [x5, #0x8]
    f254:      	cmp	x1, x5
    f258:      	b.ge	0xf4bc <_stogir.switch.key+0x2d8>
    f25c:      	lsl	x5, x1, #2
    f260:      	ldr	x7, [x0, #0x78]
    f264:      	add	x5, x5, x7
    f268:      	ldr	w5, [x5]
    f26c:      	sxtw	x5, w5
    f270:      	cmp	x5, #0x0
    f274:      	cset	w5, ge
    f278:      	ubfx	x5, x5, #0, #8
    f27c:      	b	0xf4c0 <_stogir.switch.key+0x2dc>
    f280:      	adrp	x16, 0xf000 <_stogir.terminal.previous-input+0x210>
		000000000000f280:  ARM64_RELOC_PAGE21	l_stogir.501
    f284:      	ldr	x16, [x16]
		000000000000f284:  ARM64_RELOC_PAGEOFF12	l_stogir.501
    f288:      	orr	x0, x16, xzr
    f28c:      	mov	x1, x0
    f290:      	mov	x0, #0x1                ; =1
    f294:      	mov	x2, #0x24               ; =36
    f298:      	str	x0, [x8]
    f29c:      	str	x1, [x8, #0x8]
    f2a0:      	str	x2, [x8, #0x10]
    f2a4:      	ldr	x19, [sp]
    f2a8:      	ldr	x20, [sp, #0x8]
    f2ac:      	ldr	x21, [sp, #0x10]
    f2b0:      	ldr	x22, [sp, #0x18]
    f2b4:      	ldr	x23, [sp, #0x20]
    f2b8:      	add	sp, sp, #0x30
    f2bc:      	ret
    f2c0:      	mov	x23, #0x1               ; =1
    f2c4:      	cmp	x1, #0x0
    f2c8:      	b.ge	0xf2e8 <_stogir.switch.key+0x104>
    f2cc:      	lsr	w1, w4, #0
    f2d0:      	uxtb	w4, w4
    f2d4:      	ubfx	x1, x1, #8, #8
    f2d8:      	cmp	x4, x1
    f2dc:      	b.eq	0xf564 <_stogir.switch.key+0x380>
    f2e0:      	cmp	x4, #0x49
    f2e4:      	b.eq	0xf564 <_stogir.switch.key+0x380>
    f2e8:      	adrp	x16, 0xf000 <_stogir.terminal.previous-input+0x210>
		000000000000f2e8:  ARM64_RELOC_PAGE21	l_stogir.502
    f2ec:      	ldr	x16, [x16]
		000000000000f2ec:  ARM64_RELOC_PAGEOFF12	l_stogir.502
    f2f0:      	orr	x0, x16, xzr
    f2f4:      	mov	x1, x0
    f2f8:      	mov	x0, #0x1                ; =1
    f2fc:      	mov	x2, #0x30               ; =48
    f300:      	b	0xf298 <_stogir.switch.key+0xb4>
    f304:      	cmp	x1, #0x0
    f308:      	b.ge	0xf358 <_stogir.switch.key+0x174>
    f30c:      	add	x7, x0, #0x28
    f310:      	add	x9, x0, #0x50
    f314:      	ldr	x7, [x7, #0x8]
    f318:      	ldr	x9, [x9, #0x8]
    f31c:      	cmp	x7, x9
    f320:      	b.ne	0xf4b4 <_stogir.switch.key+0x2d0>
    f324:      	cmp	x5, x7
    f328:      	b.gt	0xf55c <_stogir.switch.key+0x378>
    f32c:      	lsl	x5, x6, #2
    f330:      	ldr	x7, [x0, #0x50]
    f334:      	add	x5, x5, x7
    f338:      	ldr	w5, [x5]
    f33c:      	sxtw	x5, w5
    f340:      	cmp	x5, #0x0
    f344:      	cset	w5, gt
    f348:      	ubfx	x5, x5, #0, #8
    f34c:      	b	0xf560 <_stogir.switch.key+0x37c>
    f350:      	movz	x5, #0x0, lsl #48
    f354:      	b	0xf35c <_stogir.switch.key+0x178>
    f358:      	movz	x5, #0x0, lsl #48
    f35c:      	cmp	x5, #0x0
    f360:      	b.eq	0xf3c4 <_stogir.switch.key+0x1e0>
    f364:      	uxtb	w16, w4
    f368:      	cmp	w16, wzr
    f36c:      	b.eq	0xf394 <_stogir.switch.key+0x1b0>
    f370:      	lsl	x4, x1, #4
    f374:      	ldr	x0, [x0]
    f378:      	add	x0, x4, x0
    f37c:      	ldr	x4, [x0]
    f380:      	ldr	x0, [x0, #0x8]
    f384:      	fmov	d31, x0
    f388:      	mov	x0, x4
    f38c:      	fmov	x4, d31
    f390:      	b	0xf3b4 <_stogir.switch.key+0x1d0>
    f394:      	lsl	x4, x6, #4
    f398:      	ldr	x0, [x0, #0x28]
    f39c:      	add	x0, x4, x0
    f3a0:      	ldr	x4, [x0]
    f3a4:      	ldr	x0, [x0, #0x8]
    f3a8:      	fmov	d31, x0
    f3ac:      	mov	x0, x4
    f3b0:      	fmov	x4, d31
    f3b4:      	mov	x5, x4
    f3b8:      	mov	x4, x0
    f3bc:      	mov	x0, #0x1                ; =1
    f3c0:      	b	0xf3d0 <_stogir.switch.key+0x1ec>
    f3c4:      	movz	x0, #0x0, lsl #48
    f3c8:      	movz	x4, #0x0, lsl #48
    f3cc:      	movz	x5, #0x0, lsl #48
    f3d0:      	lsr	w0, w0, #0
    f3d4:      	lsr	x16, x0, #0
    f3d8:      	cmp	x16, #0x1
    f3dc:      	b.eq	0xf3f8 <_stogir.switch.key+0x214>
    f3e0:      	b.lo	0xf3e8 <_stogir.switch.key+0x204>
    f3e4:      	b	0xf3fc <_stogir.switch.key+0x218>
    f3e8:      	cmp	x16, #0x0
    f3ec:      	b.eq	0xf3f4 <_stogir.switch.key+0x210>
    f3f0:      	b	0xf3fc <_stogir.switch.key+0x218>
    f3f4:      	b	0xf400 <_stogir.switch.key+0x21c>
    f3f8:      	b	0xf41c <_stogir.switch.key+0x238>
    f3fc:      	b	0xf608 <_stogir.switch.key+0x424>
    f400:      	adrp	x16, 0xf000 <_stogir.terminal.previous-input+0x210>
		000000000000f400:  ARM64_RELOC_PAGE21	l_stogir.503
    f404:      	ldr	x16, [x16]
		000000000000f404:  ARM64_RELOC_PAGEOFF12	l_stogir.503
    f408:      	orr	x0, x16, xzr
    f40c:      	mov	x1, x0
    f410:      	mov	x0, #0x1                ; =1
    f414:      	mov	x2, #0x1c               ; =28
    f418:      	b	0xf300 <_stogir.switch.key+0x11c>
    f41c:      	cmp	x2, #0x1
    f420:      	cset	w0, eq
    f424:      	cmp	x2, #0x0
    f428:      	cset	w6, eq
    f42c:      	cmp	x2, #0x2
    f430:      	cset	w7, eq
    f434:      	cmp	x2, #0x7
    f438:      	cset	w9, eq
    f43c:      	cmp	x2, #0x8
    f440:      	cset	w10, eq
    f444:      	cmp	x2, #0x3
    f448:      	cset	w11, eq
    f44c:      	cmp	x2, #0x9
    f450:      	cset	w12, eq
    f454:      	cmp	x2, #0x4
    f458:      	cset	w13, eq
    f45c:      	cmp	x2, #0xa
    f460:      	cset	w14, eq
    f464:      	cmp	x2, #0xd
    f468:      	cset	w15, eq
    f46c:      	cmp	x2, #0x5
    f470:      	cset	w19, eq
    f474:      	cmp	x2, #0xb
    f478:      	cset	w20, eq
    f47c:      	cmp	x2, #0xc
    f480:      	cset	w21, eq
    f484:      	cmp	x2, #0x6
    f488:      	cset	w22, eq
    f48c:      	uxtb	w16, w22
    f490:      	cmp	w16, wzr
    f494:      	mov	x16, #0x8               ; =8
    f498:      	movn	x17, #0x0, lsl #48
    f49c:      	csel	x22, x16, x17, ne
    f4a0:      	uxtb	w16, w6
    f4a4:      	cmp	w16, wzr
    f4a8:      	b.eq	0xf4c4 <_stogir.switch.key+0x2e0>
    f4ac:      	movz	x23, #0x0, lsl #48
    f4b0:      	b	0xf2c4 <_stogir.switch.key+0xe0>
    f4b4:      	movz	x5, #0x0, lsl #48
    f4b8:      	b	0xf35c <_stogir.switch.key+0x178>
    f4bc:      	movz	x5, #0x0, lsl #48
    f4c0:      	b	0xf354 <_stogir.switch.key+0x170>
    f4c4:      	uxtb	w16, w0
    f4c8:      	cmp	w16, wzr
    f4cc:      	b.ne	0xf2c0 <_stogir.switch.key+0xdc>
    f4d0:      	uxtb	w16, w7
    f4d4:      	cmp	w16, wzr
    f4d8:      	b.ne	0xf2c0 <_stogir.switch.key+0xdc>
    f4dc:      	uxtb	w16, w9
    f4e0:      	cmp	w16, wzr
    f4e4:      	b.ne	0xf2c0 <_stogir.switch.key+0xdc>
    f4e8:      	uxtb	w16, w10
    f4ec:      	cmp	w16, wzr
    f4f0:      	b.ne	0xf2c0 <_stogir.switch.key+0xdc>
    f4f4:      	uxtb	w16, w11
    f4f8:      	cmp	w16, wzr
    f4fc:      	b.ne	0xf600 <_stogir.switch.key+0x41c>
    f500:      	uxtb	w16, w12
    f504:      	cmp	w16, wzr
    f508:      	b.ne	0xf600 <_stogir.switch.key+0x41c>
    f50c:      	uxtb	w16, w13
    f510:      	cmp	w16, wzr
    f514:      	b.ne	0xf6d8 <_stogir.switch.key+0x4f4>
    f518:      	uxtb	w16, w14
    f51c:      	cmp	w16, wzr
    f520:      	b.ne	0xf6d8 <_stogir.switch.key+0x4f4>
    f524:      	uxtb	w16, w15
    f528:      	cmp	w16, wzr
    f52c:      	b.ne	0xf6d8 <_stogir.switch.key+0x4f4>
    f530:      	uxtb	w16, w19
    f534:      	cmp	w16, wzr
    f538:      	b.ne	0xf6e0 <_stogir.switch.key+0x4fc>
    f53c:      	uxtb	w16, w20
    f540:      	cmp	w16, wzr
    f544:      	b.ne	0xf6e0 <_stogir.switch.key+0x4fc>
    f548:      	uxtb	w16, w21
    f54c:      	cmp	w16, wzr
    f550:      	b.ne	0xf6e0 <_stogir.switch.key+0x4fc>
    f554:      	mov	x23, x22
    f558:      	b	0xf6e4 <_stogir.switch.key+0x500>
    f55c:      	movz	x5, #0x0, lsl #48
    f560:      	b	0xf4b8 <_stogir.switch.key+0x2d4>
    f564:      	cmp	x1, x2
    f568:      	b.ne	0xf2e8 <_stogir.switch.key+0x104>
    f56c:      	lsr	w23, w23, #0
    f570:      	lsr	w1, w5, #0
    f574:      	sxtw	x23, w23
    f578:      	ubfx	x1, x1, #0, #32
    f57c:      	lsr	x4, x5, #32
    f580:      	lsl	x5, x23, #3
    f584:      	ubfx	x4, x4, #0, #32
    f588:      	lsr	w5, w5, #0
    f58c:      	lsl	x4, x4, #32
    f590:      	sxtw	x5, w5
    f594:      	orr	x1, x4, x1
    f598:      	cmp	x5, #0x40
    f59c:      	b.ge	0xf5ac <_stogir.switch.key+0x3c8>
    f5a0:      	lsr	x4, x1, x5
    f5a4:      	cmp	x4, #0x0
    f5a8:      	b.ne	0xf2e8 <_stogir.switch.key+0x104>
    f5ac:      	uxtb	w16, w0
    f5b0:      	cmp	w16, wzr
    f5b4:      	b.eq	0xf5c0 <_stogir.switch.key+0x3dc>
    f5b8:      	cmp	x1, #0x1
    f5bc:      	b.hi	0xf2e8 <_stogir.switch.key+0x104>
    f5c0:      	cmp	x2, #0x7
    f5c4:      	b.lt	0xf5e8 <_stogir.switch.key+0x404>
    f5c8:      	uxtb	w16, w3
    f5cc:      	cmp	w16, wzr
    f5d0:      	b.eq	0xf5e8 <_stogir.switch.key+0x404>
    f5d4:      	uxtb	w16, w6
    f5d8:      	cmp	w16, wzr
    f5dc:      	b.eq	0xf640 <_stogir.switch.key+0x45c>
    f5e0:      	movz	x0, #0x0, lsl #48
    f5e4:      	b	0xf614 <_stogir.switch.key+0x430>
    f5e8:      	movz	x0, #0x0, lsl #48
    f5ec:      	eor	x0, x0, x1
    f5f0:      	mov	x1, x0
    f5f4:      	movz	x0, #0x0, lsl #48
    f5f8:      	movz	x2, #0x0, lsl #48
    f5fc:      	b	0xf300 <_stogir.switch.key+0x11c>
    f600:      	mov	x23, #0x2               ; =2
    f604:      	b	0xf2c4 <_stogir.switch.key+0xe0>
    f608:      	brk	#0
    f60c:      	b	0xf608 <_stogir.switch.key+0x424>
    f610:      	mov	x0, #0x1                ; =1
    f614:      	lsr	w0, w0, #0
    f618:      	sxtw	x0, w0
    f61c:      	lsl	x0, x0, #3
    f620:      	lsr	w0, w0, #0
    f624:      	sxtw	x0, w0
    f628:      	sub	x0, x0, #0x1
    f62c:      	lsr	w0, w0, #0
    f630:      	sxtw	x0, w0
    f634:      	mov	x16, #0x1               ; =1
    f638:      	lsl	x0, x16, x0
    f63c:      	b	0xf5ec <_stogir.switch.key+0x408>
    f640:      	uxtb	w16, w0
    f644:      	cmp	w16, wzr
    f648:      	b.ne	0xf610 <_stogir.switch.key+0x42c>
    f64c:      	uxtb	w16, w7
    f650:      	cmp	w16, wzr
    f654:      	b.ne	0xf610 <_stogir.switch.key+0x42c>
    f658:      	uxtb	w16, w9
    f65c:      	cmp	w16, wzr
    f660:      	b.ne	0xf610 <_stogir.switch.key+0x42c>
    f664:      	uxtb	w16, w10
    f668:      	cmp	w16, wzr
    f66c:      	b.ne	0xf610 <_stogir.switch.key+0x42c>
    f670:      	uxtb	w16, w11
    f674:      	cmp	w16, wzr
    f678:      	b.ne	0xf6e8 <_stogir.switch.key+0x504>
    f67c:      	uxtb	w16, w12
    f680:      	cmp	w16, wzr
    f684:      	b.ne	0xf6e8 <_stogir.switch.key+0x504>
    f688:      	uxtb	w16, w13
    f68c:      	cmp	w16, wzr
    f690:      	b.ne	0xf6f0 <_stogir.switch.key+0x50c>
    f694:      	uxtb	w16, w14
    f698:      	cmp	w16, wzr
    f69c:      	b.ne	0xf6f0 <_stogir.switch.key+0x50c>
    f6a0:      	uxtb	w16, w15
    f6a4:      	cmp	w16, wzr
    f6a8:      	b.ne	0xf6f0 <_stogir.switch.key+0x50c>
    f6ac:      	uxtb	w16, w19
    f6b0:      	cmp	w16, wzr
    f6b4:      	b.ne	0xf6f8 <_stogir.switch.key+0x514>
    f6b8:      	uxtb	w16, w20
    f6bc:      	cmp	w16, wzr
    f6c0:      	b.ne	0xf6f8 <_stogir.switch.key+0x514>
    f6c4:      	uxtb	w16, w21
    f6c8:      	cmp	w16, wzr
    f6cc:      	b.ne	0xf6f8 <_stogir.switch.key+0x514>
    f6d0:      	mov	x0, x22
    f6d4:      	b	0xf6fc <_stogir.switch.key+0x518>
    f6d8:      	mov	x23, #0x4               ; =4
    f6dc:      	b	0xf604 <_stogir.switch.key+0x420>
    f6e0:      	mov	x23, #0x8               ; =8
    f6e4:      	b	0xf6dc <_stogir.switch.key+0x4f8>
    f6e8:      	mov	x0, #0x2                ; =2
    f6ec:      	b	0xf614 <_stogir.switch.key+0x430>
    f6f0:      	mov	x0, #0x4                ; =4
    f6f4:      	b	0xf6ec <_stogir.switch.key+0x508>
    f6f8:      	mov	x0, #0x8                ; =8
    f6fc:      	b	0xf6f4 <_stogir.switch.key+0x510>

000000000000f700 <_stogir.frame.valid-alignment?>:
    f700:      	cmp	x0, #0x0
    f704:      	b.le	0xf720 <_stogir.frame.valid-alignment?+0x20>
    f708:      	sub	x1, x0, #0x1
    f70c:      	and	x0, x1, x0
    f710:      	cmp	x0, #0x0
    f714:      	cset	w0, eq
    f718:      	ubfx	x0, x0, #0, #8
    f71c:      	b	0xf724 <_stogir.frame.valid-alignment?+0x24>
    f720:      	movz	x0, #0x0, lsl #48
    f724:      	ret

000000000000f728 <_stogir.stack.constant-size-aligned>:
    f728:      	sub	sp, sp, #0x10
    f72c:      	cmp	x2, #0x10
    f730:      	b.lt	0xf7b0 <_stogir.stack.constant-size-aligned+0x88>
    f734:      	cmp	x2, #0x0
    f738:      	b.le	0xf7b0 <_stogir.stack.constant-size-aligned+0x88>
    f73c:      	sub	x3, x2, #0x1
    f740:      	and	x3, x3, x2
    f744:      	cmp	x3, #0x0
    f748:      	b.ne	0xf7b0 <_stogir.stack.constant-size-aligned+0x88>
    f74c:      	sxtw	x1, w1
    f750:      	cmp	x1, #0x0
    f754:      	cset	w3, gt
    f758:      	movz	x16, #0x0, lsl #48
    f75c:      	sub	x4, x16, x1
    f760:      	sub	x5, x4, #0x1
    f764:      	uxtb	w16, w3
    f768:      	cmp	w16, wzr
    f76c:      	b.eq	0xf850 <_stogir.stack.constant-size-aligned+0x128>
    f770:      	ldr	x4, [x0, #0x8]
    f774:      	cmp	x1, x4
    f778:      	b.ge	0xf89c <_stogir.stack.constant-size-aligned+0x174>
    f77c:      	add	x4, x0, #0x78
    f780:      	ldr	x4, [x4, #0x8]
    f784:      	cmp	x1, x4
    f788:      	b.ge	0xf998 <_stogir.stack.constant-size-aligned+0x270>
    f78c:      	lsl	x4, x1, #2
    f790:      	ldr	x6, [x0, #0x78]
    f794:      	add	x4, x4, x6
    f798:      	ldr	w4, [x4]
    f79c:      	sxtw	x4, w4
    f7a0:      	cmp	x4, #0x0
    f7a4:      	cset	w4, ge
    f7a8:      	ubfx	x4, x4, #0, #8
    f7ac:      	b	0xf99c <_stogir.stack.constant-size-aligned+0x274>
    f7b0:      	adrp	x16, 0xf000 <_stogir.terminal.previous-input+0x210>
		000000000000f7b0:  ARM64_RELOC_PAGE21	l_stogir.504
    f7b4:      	ldr	x16, [x16]
		000000000000f7b4:  ARM64_RELOC_PAGEOFF12	l_stogir.504
    f7b8:      	orr	x0, x16, xzr
    f7bc:      	mov	x1, x0
    f7c0:      	mov	x0, #0x1                ; =1
    f7c4:      	mov	x2, #0x20               ; =32
    f7c8:      	str	x0, [x8]
    f7cc:      	str	x1, [x8, #0x8]
    f7d0:      	str	x2, [x8, #0x10]
    f7d4:      	add	sp, sp, #0x10
    f7d8:      	ret
    f7dc:      	mov	x3, #0x1                ; =1
    f7e0:      	mov	x16, sp
    f7e4:      	ldr	w4, [x16, #0x8]
    f7e8:      	mov	x16, sp
    f7ec:      	ldr	w5, [x16, #0xc]
    f7f0:      	cmp	x1, #0x0
    f7f4:      	b.ge	0xf834 <_stogir.stack.constant-size-aligned+0x10c>
    f7f8:      	cmp	x0, #0x1
    f7fc:      	b.lt	0xf834 <_stogir.stack.constant-size-aligned+0x10c>
    f800:      	cmp	x0, #0xb
    f804:      	cset	w1, le
    f808:      	uxtb	w16, w1
    f80c:      	cmp	w16, wzr
    f810:      	b.eq	0xf834 <_stogir.stack.constant-size-aligned+0x10c>
    f814:      	mov	x16, sp
    f818:      	ldr	w6, [x16]
    f81c:      	uxtb	w7, w6
    f820:      	ubfx	x6, x6, #8, #8
    f824:      	cmp	x7, x6
    f828:      	b.eq	0xfa28 <_stogir.stack.constant-size-aligned+0x300>
    f82c:      	cmp	x7, #0x49
    f830:      	b.eq	0xfa28 <_stogir.stack.constant-size-aligned+0x300>
    f834:      	adrp	x16, 0xf000 <_stogir.terminal.previous-input+0x210>
		000000000000f834:  ARM64_RELOC_PAGE21	l_stogir.505
    f838:      	ldr	x16, [x16]
		000000000000f838:  ARM64_RELOC_PAGEOFF12	l_stogir.505
    f83c:      	orr	x0, x16, xzr
    f840:      	mov	x1, x0
    f844:      	mov	x0, #0x1                ; =1
    f848:      	mov	x2, #0x30               ; =48
    f84c:      	b	0xf7c8 <_stogir.stack.constant-size-aligned+0xa0>
    f850:      	cmp	x1, #0x0
    f854:      	b.ge	0xf8a4 <_stogir.stack.constant-size-aligned+0x17c>
    f858:      	add	x6, x0, #0x28
    f85c:      	add	x7, x0, #0x50
    f860:      	ldr	x6, [x6, #0x8]
    f864:      	ldr	x7, [x7, #0x8]
    f868:      	cmp	x6, x7
    f86c:      	b.ne	0xf990 <_stogir.stack.constant-size-aligned+0x268>
    f870:      	cmp	x4, x6
    f874:      	b.gt	0xfa20 <_stogir.stack.constant-size-aligned+0x2f8>
    f878:      	lsl	x4, x5, #2
    f87c:      	ldr	x6, [x0, #0x50]
    f880:      	add	x4, x4, x6
    f884:      	ldr	w4, [x4]
    f888:      	sxtw	x4, w4
    f88c:      	cmp	x4, #0x0
    f890:      	cset	w4, gt
    f894:      	ubfx	x4, x4, #0, #8
    f898:      	b	0xfa24 <_stogir.stack.constant-size-aligned+0x2fc>
    f89c:      	movz	x4, #0x0, lsl #48
    f8a0:      	b	0xf8a8 <_stogir.stack.constant-size-aligned+0x180>
    f8a4:      	movz	x4, #0x0, lsl #48
    f8a8:      	cmp	x4, #0x0
    f8ac:      	b.eq	0xf910 <_stogir.stack.constant-size-aligned+0x1e8>
    f8b0:      	uxtb	w16, w3
    f8b4:      	cmp	w16, wzr
    f8b8:      	b.eq	0xf8e0 <_stogir.stack.constant-size-aligned+0x1b8>
    f8bc:      	lsl	x3, x1, #4
    f8c0:      	ldr	x0, [x0]
    f8c4:      	add	x0, x3, x0
    f8c8:      	ldr	x3, [x0]
    f8cc:      	ldr	x0, [x0, #0x8]
    f8d0:      	fmov	d31, x0
    f8d4:      	mov	x0, x3
    f8d8:      	fmov	x3, d31
    f8dc:      	b	0xf900 <_stogir.stack.constant-size-aligned+0x1d8>
    f8e0:      	lsl	x3, x5, #4
    f8e4:      	ldr	x0, [x0, #0x28]
    f8e8:      	add	x0, x3, x0
    f8ec:      	ldr	x3, [x0]
    f8f0:      	ldr	x0, [x0, #0x8]
    f8f4:      	fmov	d31, x0
    f8f8:      	mov	x0, x3
    f8fc:      	fmov	x3, d31
    f900:      	mov	x4, x3
    f904:      	mov	x3, x0
    f908:      	mov	x0, #0x1                ; =1
    f90c:      	b	0xf91c <_stogir.stack.constant-size-aligned+0x1f4>
    f910:      	movz	x0, #0x0, lsl #48
    f914:      	movz	x3, #0x0, lsl #48
    f918:      	movz	x4, #0x0, lsl #48
    f91c:      	lsr	w0, w0, #0
    f920:      	lsr	x16, x0, #0
    f924:      	cmp	x16, #0x1
    f928:      	b.eq	0xf944 <_stogir.stack.constant-size-aligned+0x21c>
    f92c:      	b.lo	0xf934 <_stogir.stack.constant-size-aligned+0x20c>
    f930:      	b	0xf948 <_stogir.stack.constant-size-aligned+0x220>
    f934:      	cmp	x16, #0x0
    f938:      	b.eq	0xf940 <_stogir.stack.constant-size-aligned+0x218>
    f93c:      	b	0xf948 <_stogir.stack.constant-size-aligned+0x220>
    f940:      	b	0xf94c <_stogir.stack.constant-size-aligned+0x224>
    f944:      	b	0xf968 <_stogir.stack.constant-size-aligned+0x240>
    f948:      	b	0xfae8 <_stogir.stack.constant-size-aligned+0x3c0>
    f94c:      	adrp	x16, 0xf000 <_stogir.terminal.previous-input+0x210>
		000000000000f94c:  ARM64_RELOC_PAGE21	l_stogir.506
    f950:      	ldr	x16, [x16]
		000000000000f950:  ARM64_RELOC_PAGEOFF12	l_stogir.506
    f954:      	orr	x0, x16, xzr
    f958:      	mov	x1, x0
    f95c:      	mov	x0, #0x1                ; =1
    f960:      	mov	x2, #0x18               ; =24
    f964:      	b	0xf84c <_stogir.stack.constant-size-aligned+0x124>
    f968:      	lsr	w0, w3, #0
    f96c:      	mov	x16, sp
    f970:      	str	x3, [x16]
    f974:      	mov	x16, sp
    f978:      	str	x4, [x16, #0x8]
    f97c:      	ubfx	x0, x0, #8, #8
    f980:      	cmp	x0, #0x0
    f984:      	b.ne	0xf9a0 <_stogir.stack.constant-size-aligned+0x278>
    f988:      	movz	x3, #0x0, lsl #48
    f98c:      	b	0xf7e0 <_stogir.stack.constant-size-aligned+0xb8>
    f990:      	movz	x4, #0x0, lsl #48
    f994:      	b	0xf8a8 <_stogir.stack.constant-size-aligned+0x180>
    f998:      	movz	x4, #0x0, lsl #48
    f99c:      	b	0xf8a0 <_stogir.stack.constant-size-aligned+0x178>
    f9a0:      	cmp	x0, #0x1
    f9a4:      	b.eq	0xf7dc <_stogir.stack.constant-size-aligned+0xb4>
    f9a8:      	cmp	x0, #0x2
    f9ac:      	b.eq	0xf7dc <_stogir.stack.constant-size-aligned+0xb4>
    f9b0:      	cmp	x0, #0x7
    f9b4:      	b.eq	0xf7dc <_stogir.stack.constant-size-aligned+0xb4>
    f9b8:      	cmp	x0, #0x8
    f9bc:      	b.eq	0xf7dc <_stogir.stack.constant-size-aligned+0xb4>
    f9c0:      	cmp	x0, #0x3
    f9c4:      	b.eq	0xfae0 <_stogir.stack.constant-size-aligned+0x3b8>
    f9c8:      	cmp	x0, #0x9
    f9cc:      	b.eq	0xfae0 <_stogir.stack.constant-size-aligned+0x3b8>
    f9d0:      	cmp	x0, #0x4
    f9d4:      	b.eq	0xfaf0 <_stogir.stack.constant-size-aligned+0x3c8>
    f9d8:      	cmp	x0, #0xa
    f9dc:      	b.eq	0xfaf0 <_stogir.stack.constant-size-aligned+0x3c8>
    f9e0:      	cmp	x0, #0xd
    f9e4:      	b.eq	0xfaf0 <_stogir.stack.constant-size-aligned+0x3c8>
    f9e8:      	cmp	x0, #0x5
    f9ec:      	b.eq	0xfaf8 <_stogir.stack.constant-size-aligned+0x3d0>
    f9f0:      	cmp	x0, #0xb
    f9f4:      	b.eq	0xfaf8 <_stogir.stack.constant-size-aligned+0x3d0>
    f9f8:      	cmp	x0, #0xc
    f9fc:      	b.eq	0xfaf8 <_stogir.stack.constant-size-aligned+0x3d0>
    fa00:      	cmp	x0, #0x6
    fa04:      	cset	w3, eq
    fa08:      	uxtb	w16, w3
    fa0c:      	cmp	w16, wzr
    fa10:      	mov	x16, #0x8               ; =8
    fa14:      	movn	x17, #0x0, lsl #48
    fa18:      	csel	x3, x16, x17, ne
    fa1c:      	b	0xfafc <_stogir.stack.constant-size-aligned+0x3d4>
    fa20:      	movz	x4, #0x0, lsl #48
    fa24:      	b	0xf994 <_stogir.stack.constant-size-aligned+0x26c>
    fa28:      	lsr	w3, w3, #0
    fa2c:      	sxtw	x3, w3
    fa30:      	cmp	x3, #0x0
    fa34:      	b.le	0xf834 <_stogir.stack.constant-size-aligned+0x10c>
    fa38:      	ubfx	x4, x4, #0, #32
    fa3c:      	ubfx	x5, x5, #0, #32
    fa40:      	lsl	x5, x5, #32
    fa44:      	orr	x4, x5, x4
    fa48:      	cmp	x3, #0x8
    fa4c:      	b.ge	0xfa68 <_stogir.stack.constant-size-aligned+0x340>
    fa50:      	lsl	x5, x3, #3
    fa54:      	lsr	w5, w5, #0
    fa58:      	sxtw	x5, w5
    fa5c:      	lsr	x5, x4, x5
    fa60:      	cmp	x5, #0x0
    fa64:      	b.ne	0xf834 <_stogir.stack.constant-size-aligned+0x10c>
    fa68:      	cmp	x0, #0x7
    fa6c:      	b.lt	0xfaa8 <_stogir.stack.constant-size-aligned+0x380>
    fa70:      	uxtb	w16, w1
    fa74:      	cmp	w16, wzr
    fa78:      	b.eq	0xfaa8 <_stogir.stack.constant-size-aligned+0x380>
    fa7c:      	lsl	x0, x3, #3
    fa80:      	lsr	w0, w0, #0
    fa84:      	sxtw	x0, w0
    fa88:      	sub	x0, x0, #0x1
    fa8c:      	lsr	w0, w0, #0
    fa90:      	sxtw	x0, w0
    fa94:      	mov	x16, #0x1               ; =1
    fa98:      	lsl	x0, x16, x0
    fa9c:      	and	x0, x0, x4
    faa0:      	cmp	x0, #0x0
    faa4:      	b.ne	0xf834 <_stogir.stack.constant-size-aligned+0x10c>
    faa8:      	sub	x0, x2, #0x1
    faac:      	mov	x16, #0x7fffffffffffffff ; =9223372036854775807
    fab0:      	sub	x0, x16, x0
    fab4:      	cmp	x4, x0
    fab8:      	b.hi	0xf834 <_stogir.stack.constant-size-aligned+0x10c>
    fabc:      	sub	x0, x2, #0x1
    fac0:      	movz	x16, #0x0, lsl #48
    fac4:      	sub	x1, x16, x2
    fac8:      	add	x0, x0, x4
    facc:      	and	x0, x1, x0
    fad0:      	mov	x1, x0
    fad4:      	movz	x0, #0x0, lsl #48
    fad8:      	movz	x2, #0x0, lsl #48
    fadc:      	b	0xf84c <_stogir.stack.constant-size-aligned+0x124>
    fae0:      	mov	x3, #0x2                ; =2
    fae4:      	b	0xf7e0 <_stogir.stack.constant-size-aligned+0xb8>
    fae8:      	brk	#0
    faec:      	b	0xfae8 <_stogir.stack.constant-size-aligned+0x3c0>
    faf0:      	mov	x3, #0x4                ; =4
    faf4:      	b	0xfae4 <_stogir.stack.constant-size-aligned+0x3bc>
    faf8:      	mov	x3, #0x8                ; =8
    fafc:      	b	0xfaf4 <_stogir.stack.constant-size-aligned+0x3cc>

000000000000fb00 <_stogir.numeric-conversion.operation?>:
    fb00:      	sxtw	x0, w0
    fb04:      	cmp	x0, #0x25
    fb08:      	b.lt	0xfb1c <_stogir.numeric-conversion.operation?+0x1c>
    fb0c:      	cmp	x0, #0x27
    fb10:      	cset	w0, le
    fb14:      	ubfx	x0, x0, #0, #8
    fb18:      	b	0xfb20 <_stogir.numeric-conversion.operation?+0x20>
    fb1c:      	movz	x0, #0x0, lsl #48
    fb20:      	ret

000000000000fb24 <_stogir.numeric-conversion.valid-types?>:
    fb24:      	sxtw	x0, w0
    fb28:      	sxtw	x1, w1
    fb2c:      	sxtw	x2, w2
    fb30:      	cmp	x2, #0xc
    fb34:      	cset	w3, eq
    fb38:      	cmp	x2, #0xd
    fb3c:      	cset	w4, eq
    fb40:      	ubfx	x4, x4, #0, #8
    fb44:      	cmp	x0, #0x25
    fb48:      	b.ne	0xfb70 <_stogir.numeric-conversion.valid-types?+0x4c>
    fb4c:      	cmp	x1, #0x1
    fb50:      	b.lt	0xfbd8 <_stogir.numeric-conversion.valid-types?+0xb4>
    fb54:      	cmp	x1, #0xb
    fb58:      	b.gt	0xfbd8 <_stogir.numeric-conversion.valid-types?+0xb4>
    fb5c:      	uxtb	w16, w3
    fb60:      	cmp	w16, wzr
    fb64:      	b.eq	0xfbe8 <_stogir.numeric-conversion.valid-types?+0xc4>
    fb68:      	mov	x0, #0x1                ; =1
    fb6c:      	b	0xfbec <_stogir.numeric-conversion.valid-types?+0xc8>
    fb70:      	cmp	x1, #0xc
    fb74:      	cset	w5, eq
    fb78:      	cmp	x1, #0xd
    fb7c:      	cset	w1, eq
    fb80:      	cmp	x0, #0x26
    fb84:      	b.ne	0xfba8 <_stogir.numeric-conversion.valid-types?+0x84>
    fb88:      	uxtb	w16, w5
    fb8c:      	cmp	w16, wzr
    fb90:      	b.ne	0xfbf8 <_stogir.numeric-conversion.valid-types?+0xd4>
    fb94:      	uxtb	w16, w1
    fb98:      	cmp	w16, wzr
    fb9c:      	b.ne	0xfbf8 <_stogir.numeric-conversion.valid-types?+0xd4>
    fba0:      	movz	x0, #0x0, lsl #48
    fba4:      	b	0xfbd4 <_stogir.numeric-conversion.valid-types?+0xb0>
    fba8:      	cmp	x0, #0x27
    fbac:      	b.ne	0xfbe0 <_stogir.numeric-conversion.valid-types?+0xbc>
    fbb0:      	uxtb	w16, w5
    fbb4:      	cmp	w16, wzr
    fbb8:      	b.ne	0xfc10 <_stogir.numeric-conversion.valid-types?+0xec>
    fbbc:      	uxtb	w16, w1
    fbc0:      	cmp	w16, wzr
    fbc4:      	b.ne	0xfc10 <_stogir.numeric-conversion.valid-types?+0xec>
    fbc8:      	movz	x0, #0x0, lsl #48
    fbcc:      	b	0xfbf4 <_stogir.numeric-conversion.valid-types?+0xd0>
    fbd0:      	movz	x0, #0x0, lsl #48
    fbd4:      	b	0xfbe4 <_stogir.numeric-conversion.valid-types?+0xc0>
    fbd8:      	movz	x0, #0x0, lsl #48
    fbdc:      	b	0xfbe4 <_stogir.numeric-conversion.valid-types?+0xc0>
    fbe0:      	movz	x0, #0x0, lsl #48
    fbe4:      	ret
    fbe8:      	mov	x0, x4
    fbec:      	b	0xfbdc <_stogir.numeric-conversion.valid-types?+0xb8>
    fbf0:      	mov	x0, x4
    fbf4:      	b	0xfbe4 <_stogir.numeric-conversion.valid-types?+0xc0>
    fbf8:      	cmp	x2, #0x1
    fbfc:      	b.lt	0xfbd0 <_stogir.numeric-conversion.valid-types?+0xac>
    fc00:      	cmp	x2, #0xb
    fc04:      	cset	w0, le
    fc08:      	ubfx	x0, x0, #0, #8
    fc0c:      	b	0xfbd4 <_stogir.numeric-conversion.valid-types?+0xb0>
    fc10:      	uxtb	w16, w3
    fc14:      	cmp	w16, wzr
    fc18:      	b.eq	0xfbf0 <_stogir.numeric-conversion.valid-types?+0xcc>
    fc1c:      	mov	x0, #0x1                ; =1
    fc20:      	b	0xfbf4 <_stogir.numeric-conversion.valid-types?+0xd0>

000000000000fc24 <_inherent$slice$new__stogir.node.Node>:
    fc24:      	sub	sp, sp, #0x10
    fc28:      	mov	x2, sp
    fc2c:      	str	x0, [x2]
    fc30:      	str	x1, [x2, #0x8]
    fc34:      	ldr	x0, [sp]
    fc38:      	ldr	x1, [sp, #0x8]
    fc3c:      	add	sp, sp, #0x10
    fc40:      	ret

000000000000fc44 <_inherent$slice$data__stogir.node.Node>:
    fc44:      	ret

000000000000fc48 <_coil.slice.element-ref__stogir.node.Node>:
    fc48:      	ret

000000000000fc4c <_stogir.vector-lanes.ordinary?>:
    fc4c:      	ldr	w0, [x0]
    fc50:      	uxtb	w0, w0
    fc54:      	cmp	x0, #0x48
    fc58:      	b.ne	0xfc64 <_stogir.vector-lanes.ordinary?+0x18>
    fc5c:      	movz	x0, #0x0, lsl #48
    fc60:      	b	0xfc78 <_stogir.vector-lanes.ordinary?+0x2c>
    fc64:      	cmp	x0, #0x46
    fc68:      	cset	w0, eq
    fc6c:      	uxtb	w16, w0
    fc70:      	cmp	w16, wzr
    fc74:      	cset	x0, eq
    fc78:      	ret

000000000000fc7c <_stogir.vector-lanes.compatible?>:
    fc7c:      	sub	sp, sp, #0x30
    fc80:      	str	x29, [sp]
    fc84:      	str	x30, [sp, #0x8]
    fc88:      	mov	x29, sp
    fc8c:      	str	x19, [sp, #0x10]
    fc90:      	str	x20, [sp, #0x18]
    fc94:      	str	x21, [sp, #0x20]
    fc98:      	lsr	w3, w0, #0
    fc9c:      	sxtw	x19, w0
    fca0:      	mov	w0, w3
    fca4:      	mov	w20, w1
    fca8:      	mov	w21, w2
    fcac:      	bl	0xfcac <_stogir.vector-lanes.compatible?+0x30>
		000000000000fcac:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    fcb0:      	and	x1, x19, #0xf
    fcb4:      	lsr	w1, w1, #0
    fcb8:      	sxtw	x1, w1
    fcbc:      	cmp	x0, #0x0
    fcc0:      	b.eq	0xfccc <_stogir.vector-lanes.compatible?+0x50>
    fcc4:      	mov	x0, x1
    fcc8:      	b	0xfcd0 <_stogir.vector-lanes.compatible?+0x54>
    fccc:      	movn	x0, #0x0, lsl #48
    fcd0:      	cmp	x19, #0xf
    fcd4:      	b.le	0xfd24 <_stogir.vector-lanes.compatible?+0xa8>
    fcd8:      	cmp	x19, #0x80
    fcdc:      	b.ge	0xfd24 <_stogir.vector-lanes.compatible?+0xa8>
    fce0:      	cmp	x1, #0x1
    fce4:      	b.lt	0xfd24 <_stogir.vector-lanes.compatible?+0xa8>
    fce8:      	cmp	x1, #0xd
    fcec:      	b.gt	0xfd24 <_stogir.vector-lanes.compatible?+0xa8>
    fcf0:      	sxtw	x21, w21
    fcf4:      	cmp	x21, #0x4
    fcf8:      	cset	w1, eq
    fcfc:      	cmp	x21, #0x8
    fd00:      	cset	w2, eq
    fd04:      	uxtb	w16, w1
    fd08:      	cmp	w16, wzr
    fd0c:      	b.ne	0xfd4c <_stogir.vector-lanes.compatible?+0xd0>
    fd10:      	uxtb	w16, w2
    fd14:      	cmp	w16, wzr
    fd18:      	b.ne	0xfd4c <_stogir.vector-lanes.compatible?+0xd0>
    fd1c:      	movz	x0, #0x0, lsl #48
    fd20:      	b	0xfd48 <_stogir.vector-lanes.compatible?+0xcc>
    fd24:      	movz	x0, #0x0, lsl #48
    fd28:      	ldr	x19, [sp, #0x10]
    fd2c:      	ldr	x20, [sp, #0x18]
    fd30:      	ldr	x21, [sp, #0x20]
    fd34:      	ldr	x29, [sp]
    fd38:      	ldr	x30, [sp, #0x8]
    fd3c:      	add	sp, sp, #0x30
    fd40:      	ret
    fd44:      	movz	x0, #0x0, lsl #48
    fd48:      	b	0xfd28 <_stogir.vector-lanes.compatible?+0xac>
    fd4c:      	sxtw	x20, w20
    fd50:      	cmp	x20, #0x0
    fd54:      	b.lt	0xfd44 <_stogir.vector-lanes.compatible?+0xc8>
    fd58:      	cmp	x20, #0xd
    fd5c:      	b.gt	0xfd44 <_stogir.vector-lanes.compatible?+0xc8>
    fd60:      	cmp	x20, #0x0
    fd64:      	b.le	0xfd80 <_stogir.vector-lanes.compatible?+0x104>
    fd68:      	lsr	w0, w0, #0
    fd6c:      	sxtw	x0, w0
    fd70:      	cmp	x0, x20
    fd74:      	b.ne	0xfd88 <_stogir.vector-lanes.compatible?+0x10c>
    fd78:      	mov	x0, #0x1                ; =1
    fd7c:      	b	0xfd84 <_stogir.vector-lanes.compatible?+0x108>
    fd80:      	movz	x0, #0x0, lsl #48
    fd84:      	b	0xfd48 <_stogir.vector-lanes.compatible?+0xcc>
    fd88:      	cmp	x0, #0x1
    fd8c:      	b.lt	0xfdc8 <_stogir.vector-lanes.compatible?+0x14c>
    fd90:      	cmp	x0, #0xb
    fd94:      	b.gt	0xfdc8 <_stogir.vector-lanes.compatible?+0x14c>
    fd98:      	cmp	x20, #0x1
    fd9c:      	b.lt	0xfdd0 <_stogir.vector-lanes.compatible?+0x154>
    fda0:      	cmp	x20, #0xb
    fda4:      	b.gt	0xfdd0 <_stogir.vector-lanes.compatible?+0x154>
    fda8:      	uxtb	w16, w1
    fdac:      	cmp	w16, wzr
    fdb0:      	b.ne	0xfdfc <_stogir.vector-lanes.compatible?+0x180>
    fdb4:      	uxtb	w16, w2
    fdb8:      	cmp	w16, wzr
    fdbc:      	b.ne	0xfdfc <_stogir.vector-lanes.compatible?+0x180>
    fdc0:      	movn	x0, #0x0, lsl #48
    fdc4:      	b	0xfe10 <_stogir.vector-lanes.compatible?+0x194>
    fdc8:      	movz	x0, #0x0, lsl #48
    fdcc:      	b	0xfd7c <_stogir.vector-lanes.compatible?+0x100>
    fdd0:      	movz	x0, #0x0, lsl #48
    fdd4:      	b	0xfdcc <_stogir.vector-lanes.compatible?+0x150>
    fdd8:      	mov	x1, #0x1                ; =1
    fddc:      	lsr	w0, w0, #0
    fde0:      	sxtw	x0, w0
    fde4:      	lsr	w1, w1, #0
    fde8:      	sxtw	x1, w1
    fdec:      	cmp	x0, x1
    fdf0:      	cset	w0, eq
    fdf4:      	ubfx	x0, x0, #0, #8
    fdf8:      	b	0xfdd4 <_stogir.vector-lanes.compatible?+0x158>
    fdfc:      	cmp	x0, #0x0
    fe00:      	b.ne	0xfeb0 <_stogir.vector-lanes.compatible?+0x234>
    fe04:      	movz	x0, #0x0, lsl #48
    fe08:      	b	0xfe10 <_stogir.vector-lanes.compatible?+0x194>
    fe0c:      	mov	x0, #0x1                ; =1
    fe10:      	uxtb	w16, w1
    fe14:      	cmp	w16, wzr
    fe18:      	b.ne	0xfe30 <_stogir.vector-lanes.compatible?+0x1b4>
    fe1c:      	uxtb	w16, w2
    fe20:      	cmp	w16, wzr
    fe24:      	b.ne	0xfe30 <_stogir.vector-lanes.compatible?+0x1b4>
    fe28:      	movn	x1, #0x0, lsl #48
    fe2c:      	b	0xfddc <_stogir.vector-lanes.compatible?+0x160>
    fe30:      	cmp	x20, #0x0
    fe34:      	b.ne	0xfe40 <_stogir.vector-lanes.compatible?+0x1c4>
    fe38:      	movz	x1, #0x0, lsl #48
    fe3c:      	b	0xfddc <_stogir.vector-lanes.compatible?+0x160>
    fe40:      	cmp	x20, #0x1
    fe44:      	b.eq	0xfdd8 <_stogir.vector-lanes.compatible?+0x15c>
    fe48:      	cmp	x20, #0x2
    fe4c:      	b.eq	0xfdd8 <_stogir.vector-lanes.compatible?+0x15c>
    fe50:      	cmp	x20, #0x7
    fe54:      	b.eq	0xfdd8 <_stogir.vector-lanes.compatible?+0x15c>
    fe58:      	cmp	x20, #0x8
    fe5c:      	b.eq	0xfdd8 <_stogir.vector-lanes.compatible?+0x15c>
    fe60:      	cmp	x20, #0x3
    fe64:      	b.eq	0xff20 <_stogir.vector-lanes.compatible?+0x2a4>
    fe68:      	cmp	x20, #0x9
    fe6c:      	b.eq	0xff20 <_stogir.vector-lanes.compatible?+0x2a4>
    fe70:      	cmp	x20, #0x4
    fe74:      	b.eq	0xff30 <_stogir.vector-lanes.compatible?+0x2b4>
    fe78:      	cmp	x20, #0xa
    fe7c:      	b.eq	0xff30 <_stogir.vector-lanes.compatible?+0x2b4>
    fe80:      	cmp	x20, #0xd
    fe84:      	b.eq	0xff30 <_stogir.vector-lanes.compatible?+0x2b4>
    fe88:      	cmp	x20, #0x5
    fe8c:      	b.eq	0xff40 <_stogir.vector-lanes.compatible?+0x2c4>
    fe90:      	cmp	x20, #0xb
    fe94:      	b.eq	0xff40 <_stogir.vector-lanes.compatible?+0x2c4>
    fe98:      	cmp	x20, #0xc
    fe9c:      	b.eq	0xff40 <_stogir.vector-lanes.compatible?+0x2c4>
    fea0:      	cmp	x20, #0x6
    fea4:      	b.ne	0xff50 <_stogir.vector-lanes.compatible?+0x2d4>
    fea8:      	mov	x1, x21
    feac:      	b	0xff54 <_stogir.vector-lanes.compatible?+0x2d8>
    feb0:      	cmp	x0, #0x1
    feb4:      	b.eq	0xfe0c <_stogir.vector-lanes.compatible?+0x190>
    feb8:      	cmp	x0, #0x2
    febc:      	b.eq	0xfe0c <_stogir.vector-lanes.compatible?+0x190>
    fec0:      	cmp	x0, #0x7
    fec4:      	b.eq	0xfe0c <_stogir.vector-lanes.compatible?+0x190>
    fec8:      	cmp	x0, #0x8
    fecc:      	b.eq	0xfe0c <_stogir.vector-lanes.compatible?+0x190>
    fed0:      	cmp	x0, #0x3
    fed4:      	b.eq	0xff28 <_stogir.vector-lanes.compatible?+0x2ac>
    fed8:      	cmp	x0, #0x9
    fedc:      	b.eq	0xff28 <_stogir.vector-lanes.compatible?+0x2ac>
    fee0:      	cmp	x0, #0x4
    fee4:      	b.eq	0xff38 <_stogir.vector-lanes.compatible?+0x2bc>
    fee8:      	cmp	x0, #0xa
    feec:      	b.eq	0xff38 <_stogir.vector-lanes.compatible?+0x2bc>
    fef0:      	cmp	x0, #0xd
    fef4:      	b.eq	0xff38 <_stogir.vector-lanes.compatible?+0x2bc>
    fef8:      	cmp	x0, #0x5
    fefc:      	b.eq	0xff48 <_stogir.vector-lanes.compatible?+0x2cc>
    ff00:      	cmp	x0, #0xb
    ff04:      	b.eq	0xff48 <_stogir.vector-lanes.compatible?+0x2cc>
    ff08:      	cmp	x0, #0xc
    ff0c:      	b.eq	0xff48 <_stogir.vector-lanes.compatible?+0x2cc>
    ff10:      	cmp	x0, #0x6
    ff14:      	b.ne	0xff58 <_stogir.vector-lanes.compatible?+0x2dc>
    ff18:      	mov	x0, x21
    ff1c:      	b	0xff5c <_stogir.vector-lanes.compatible?+0x2e0>
    ff20:      	mov	x1, #0x2                ; =2
    ff24:      	b	0xfddc <_stogir.vector-lanes.compatible?+0x160>
    ff28:      	mov	x0, #0x2                ; =2
    ff2c:      	b	0xfe10 <_stogir.vector-lanes.compatible?+0x194>
    ff30:      	mov	x1, #0x4                ; =4
    ff34:      	b	0xff24 <_stogir.vector-lanes.compatible?+0x2a8>
    ff38:      	mov	x0, #0x4                ; =4
    ff3c:      	b	0xff2c <_stogir.vector-lanes.compatible?+0x2b0>
    ff40:      	mov	x1, #0x8                ; =8
    ff44:      	b	0xff34 <_stogir.vector-lanes.compatible?+0x2b8>
    ff48:      	mov	x0, #0x8                ; =8
    ff4c:      	b	0xff3c <_stogir.vector-lanes.compatible?+0x2c0>
    ff50:      	movn	x1, #0x0, lsl #48
    ff54:      	b	0xff44 <_stogir.vector-lanes.compatible?+0x2c8>
    ff58:      	movn	x0, #0x0, lsl #48
    ff5c:      	b	0xff4c <_stogir.vector-lanes.compatible?+0x2d0>

000000000000ff60 <_stogir.symbols.numeric?>:
    ff60:      	ldr	w0, [x0]
    ff64:      	uxtb	w1, w0
    ff68:      	ubfx	x0, x0, #8, #8
    ff6c:      	cmp	x1, x0
    ff70:      	b.ne	0xff7c <_stogir.symbols.numeric?+0x1c>
    ff74:      	mov	x0, #0x1                ; =1
    ff78:      	b	0xff88 <_stogir.symbols.numeric?+0x28>
    ff7c:      	cmp	x1, #0x49
    ff80:      	cset	w0, eq
    ff84:      	ubfx	x0, x0, #0, #8
    ff88:      	ret

000000000000ff8c <_stogir.node.constant-bits>:
    ff8c:      	ldr	w1, [x0, #0x8]
    ff90:      	ubfx	x1, x1, #0, #32
    ff94:      	ldr	w0, [x0, #0xc]
    ff98:      	ubfx	x0, x0, #0, #32
    ff9c:      	lsl	x0, x0, #32
    ffa0:      	orr	x0, x0, x1
    ffa4:      	ret

000000000000ffa8 <_stogir.vector-comparison.valid-type?>:
    ffa8:      	sub	sp, sp, #0x30
    ffac:      	str	x29, [sp]
    ffb0:      	str	x30, [sp, #0x8]
    ffb4:      	mov	x29, sp
    ffb8:      	str	x19, [sp, #0x10]
    ffbc:      	str	x20, [sp, #0x18]
    ffc0:      	str	x21, [sp, #0x20]
    ffc4:      	sxtw	x19, w0
    ffc8:      	cmp	x19, #0xe
    ffcc:      	b.lt	0x10024 <_stogir.vector-comparison.valid-type?+0x7c>
    ffd0:      	cmp	x19, #0x19
    ffd4:      	b.gt	0x10024 <_stogir.vector-comparison.valid-type?+0x7c>
    ffd8:      	sxtw	x0, w1
    ffdc:      	cmp	x0, #0xf
    ffe0:      	b.le	0x10044 <_stogir.vector-comparison.valid-type?+0x9c>
    ffe4:      	cmp	x0, #0x80
    ffe8:      	b.ge	0x10044 <_stogir.vector-comparison.valid-type?+0x9c>
    ffec:      	and	x0, x0, #0xf
    fff0:      	lsr	w0, w0, #0
    fff4:      	sxtw	x20, w0
    fff8:      	cmp	x20, #0x1
    fffc:      	b.lt	0x10044 <_stogir.vector-comparison.valid-type?+0x9c>
   10000:      	cmp	x20, #0xd
   10004:      	b.gt	0x10044 <_stogir.vector-comparison.valid-type?+0x9c>
   10008:      	lsr	w21, w1, #0
   1000c:      	mov	w0, w21
   10010:      	bl	0x10010 <_stogir.vector-comparison.valid-type?+0x68>
		0000000000010010:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   10014:      	cmp	x0, #0x0
   10018:      	b.eq	0x10054 <_stogir.vector-comparison.valid-type?+0xac>
   1001c:      	mov	x0, x20
   10020:      	b	0x10058 <_stogir.vector-comparison.valid-type?+0xb0>
   10024:      	movz	x0, #0x0, lsl #48
   10028:      	ldr	x19, [sp, #0x10]
   1002c:      	ldr	x20, [sp, #0x18]
   10030:      	ldr	x21, [sp, #0x20]
   10034:      	ldr	x29, [sp]
   10038:      	ldr	x30, [sp, #0x8]
   1003c:      	add	sp, sp, #0x30
   10040:      	ret
   10044:      	movz	x0, #0x0, lsl #48
   10048:      	b	0x10028 <_stogir.vector-comparison.valid-type?+0x80>
   1004c:      	mov	x0, #0x1                ; =1
   10050:      	b	0x10048 <_stogir.vector-comparison.valid-type?+0xa0>
   10054:      	movn	x0, #0x0, lsl #48
   10058:      	lsr	w0, w0, #0
   1005c:      	sxtw	x0, w0
   10060:      	cmp	x0, #0xc
   10064:      	b.eq	0x1004c <_stogir.vector-comparison.valid-type?+0xa4>
   10068:      	cmp	x0, #0xd
   1006c:      	b.eq	0x1004c <_stogir.vector-comparison.valid-type?+0xa4>
   10070:      	mov	w0, w21
   10074:      	bl	0x10074 <_stogir.vector-comparison.valid-type?+0xcc>
		0000000000010074:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   10078:      	cmp	x0, #0x0
   1007c:      	b.eq	0x10090 <_stogir.vector-comparison.valid-type?+0xe8>
   10080:      	mov	x0, x20
   10084:      	b	0x10094 <_stogir.vector-comparison.valid-type?+0xec>
   10088:      	movz	x0, #0x0, lsl #48
   1008c:      	b	0x10050 <_stogir.vector-comparison.valid-type?+0xa8>
   10090:      	movn	x0, #0x0, lsl #48
   10094:      	lsr	w0, w0, #0
   10098:      	sxtw	x0, w0
   1009c:      	cmp	x0, #0x1
   100a0:      	b.lt	0x10088 <_stogir.vector-comparison.valid-type?+0xe0>
   100a4:      	cmp	x0, #0xb
   100a8:      	b.gt	0x10088 <_stogir.vector-comparison.valid-type?+0xe0>
   100ac:      	cmp	x19, #0x17
   100b0:      	cset	w0, le
   100b4:      	ubfx	x0, x0, #0, #8
   100b8:      	b	0x1008c <_stogir.vector-comparison.valid-type?+0xe4>

00000000000100bc <_stogir.vector-arithmetic.extrema?>:
   100bc:      	sxtw	x0, w0
   100c0:      	cmp	x0, #0x3a
   100c4:      	b.ne	0x100d0 <_stogir.vector-arithmetic.extrema?+0x14>
   100c8:      	mov	x0, #0x1                ; =1
   100cc:      	b	0x100dc <_stogir.vector-arithmetic.extrema?+0x20>
   100d0:      	cmp	x0, #0x3b
   100d4:      	cset	w0, eq
   100d8:      	ubfx	x0, x0, #0, #8
   100dc:      	ret

00000000000100e0 <_stogir.vector-arithmetic.shift?>:
   100e0:      	sxtw	x0, w0
   100e4:      	cmp	x0, #0x31
   100e8:      	b.lt	0x100fc <_stogir.vector-arithmetic.shift?+0x1c>
   100ec:      	cmp	x0, #0x35
   100f0:      	cset	w0, le
   100f4:      	ubfx	x0, x0, #0, #8
   100f8:      	b	0x10100 <_stogir.vector-arithmetic.shift?+0x20>
   100fc:      	movz	x0, #0x0, lsl #48
   10100:      	ret

0000000000010104 <_stogir.vector-arithmetic.valid-type?>:
   10104:      	sub	sp, sp, #0x40
   10108:      	str	x29, [sp]
   1010c:      	str	x30, [sp, #0x8]
   10110:      	mov	x29, sp
   10114:      	str	x19, [sp, #0x10]
   10118:      	str	x20, [sp, #0x18]
   1011c:      	str	x21, [sp, #0x20]
   10120:      	str	x22, [sp, #0x28]
   10124:      	str	x23, [sp, #0x30]
   10128:      	lsr	w2, w1, #0
   1012c:      	sxtw	x19, w1
   10130:      	mov	w20, w0
   10134:      	mov	w0, w2
   10138:      	bl	0x10138 <_stogir.vector-arithmetic.valid-type?+0x34>
		0000000000010138:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   1013c:      	and	x1, x19, #0xf
   10140:      	lsr	w1, w1, #0
   10144:      	sxtw	x1, w1
   10148:      	cmp	x0, #0x0
   1014c:      	b.eq	0x10158 <_stogir.vector-arithmetic.valid-type?+0x54>
   10150:      	mov	x0, x1
   10154:      	b	0x1015c <_stogir.vector-arithmetic.valid-type?+0x58>
   10158:      	movn	x0, #0x0, lsl #48
   1015c:      	cmp	x19, #0xf
   10160:      	b.le	0x10340 <_stogir.vector-arithmetic.valid-type?+0x23c>
   10164:      	cmp	x19, #0x80
   10168:      	b.ge	0x10340 <_stogir.vector-arithmetic.valid-type?+0x23c>
   1016c:      	cmp	x1, #0x1
   10170:      	b.lt	0x10340 <_stogir.vector-arithmetic.valid-type?+0x23c>
   10174:      	cmp	x1, #0xd
   10178:      	b.gt	0x10340 <_stogir.vector-arithmetic.valid-type?+0x23c>
   1017c:      	sxtw	x1, w20
   10180:      	cmp	x1, #0x1f
   10184:      	cset	w19, eq
   10188:      	cmp	x1, #0x20
   1018c:      	cset	w21, eq
   10190:      	cmp	x1, #0x2e
   10194:      	cset	w2, eq
   10198:      	cmp	x1, #0x2f
   1019c:      	cset	w3, eq
   101a0:      	cmp	x1, #0x30
   101a4:      	cset	w4, eq
   101a8:      	cmp	x1, #0x1e
   101ac:      	cset	w5, eq
   101b0:      	cmp	x1, #0x31
   101b4:      	cset	w6, ge
   101b8:      	cmp	x1, #0x35
   101bc:      	cset	w7, le
   101c0:      	cmp	x1, #0x3a
   101c4:      	cset	w8, eq
   101c8:      	cmp	x1, #0x3b
   101cc:      	cset	w9, eq
   101d0:      	cmp	x1, #0x2d
   101d4:      	cset	w10, eq
   101d8:      	cmp	x1, #0x36
   101dc:      	cset	w11, eq
   101e0:      	cmp	x1, #0x37
   101e4:      	cset	w12, eq
   101e8:      	cmp	x1, #0x38
   101ec:      	cset	w13, eq
   101f0:      	cmp	x1, #0x39
   101f4:      	cset	w14, eq
   101f8:      	uxtb	w16, w19
   101fc:      	cmp	w16, wzr
   10200:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10204:      	uxtb	w16, w21
   10208:      	cmp	w16, wzr
   1020c:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10210:      	uxtb	w16, w10
   10214:      	cmp	w16, wzr
   10218:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   1021c:      	uxtb	w16, w11
   10220:      	cmp	w16, wzr
   10224:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10228:      	uxtb	w16, w12
   1022c:      	cmp	w16, wzr
   10230:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10234:      	uxtb	w16, w13
   10238:      	cmp	w16, wzr
   1023c:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10240:      	uxtb	w16, w14
   10244:      	cmp	w16, wzr
   10248:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   1024c:      	uxtb	w16, w8
   10250:      	cmp	w16, wzr
   10254:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10258:      	uxtb	w16, w9
   1025c:      	cmp	w16, wzr
   10260:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10264:      	uxtb	w16, w6
   10268:      	cmp	w16, wzr
   1026c:      	b.eq	0x10468 <_stogir.vector-arithmetic.valid-type?+0x364>
   10270:      	uxtb	w16, w7
   10274:      	cmp	w16, wzr
   10278:      	b.eq	0x10468 <_stogir.vector-arithmetic.valid-type?+0x364>
   1027c:      	lsr	w0, w0, #0
   10280:      	sxtw	x1, w0
   10284:      	cmp	x1, #0xc
   10288:      	cset	w22, eq
   1028c:      	cmp	x1, #0xd
   10290:      	cset	w23, eq
   10294:      	uxtb	w16, w19
   10298:      	cmp	w16, wzr
   1029c:      	b.ne	0x10374 <_stogir.vector-arithmetic.valid-type?+0x270>
   102a0:      	uxtb	w16, w21
   102a4:      	cmp	w16, wzr
   102a8:      	b.ne	0x10374 <_stogir.vector-arithmetic.valid-type?+0x270>
   102ac:      	uxtb	w16, w10
   102b0:      	cmp	w16, wzr
   102b4:      	b.ne	0x10374 <_stogir.vector-arithmetic.valid-type?+0x270>
   102b8:      	uxtb	w16, w11
   102bc:      	cmp	w16, wzr
   102c0:      	b.ne	0x10374 <_stogir.vector-arithmetic.valid-type?+0x270>
   102c4:      	uxtb	w16, w12
   102c8:      	cmp	w16, wzr
   102cc:      	b.ne	0x10374 <_stogir.vector-arithmetic.valid-type?+0x270>
   102d0:      	uxtb	w16, w13
   102d4:      	cmp	w16, wzr
   102d8:      	b.ne	0x10374 <_stogir.vector-arithmetic.valid-type?+0x270>
   102dc:      	uxtb	w16, w14
   102e0:      	cmp	w16, wzr
   102e4:      	b.ne	0x10374 <_stogir.vector-arithmetic.valid-type?+0x270>
   102e8:      	cmp	x1, #0x1
   102ec:      	cset	w0, eq
   102f0:      	cmp	x1, #0x1
   102f4:      	cset	w10, ge
   102f8:      	cmp	x1, #0xb
   102fc:      	cset	w1, le
   10300:      	uxtb	w16, w6
   10304:      	cmp	w16, wzr
   10308:      	b.eq	0x103d4 <_stogir.vector-arithmetic.valid-type?+0x2d0>
   1030c:      	uxtb	w16, w7
   10310:      	cmp	w16, wzr
   10314:      	b.eq	0x103d4 <_stogir.vector-arithmetic.valid-type?+0x2d0>
   10318:      	uxtb	w16, w10
   1031c:      	cmp	w16, wzr
   10320:      	b.eq	0x10460 <_stogir.vector-arithmetic.valid-type?+0x35c>
   10324:      	uxtb	w16, w1
   10328:      	cmp	w16, wzr
   1032c:      	b.eq	0x10460 <_stogir.vector-arithmetic.valid-type?+0x35c>
   10330:      	uxtb	w16, w0
   10334:      	cmp	w16, wzr
   10338:      	cset	x0, eq
   1033c:      	b	0x10464 <_stogir.vector-arithmetic.valid-type?+0x360>
   10340:      	movz	x0, #0x0, lsl #48
   10344:      	ldr	x19, [sp, #0x10]
   10348:      	ldr	x20, [sp, #0x18]
   1034c:      	ldr	x21, [sp, #0x20]
   10350:      	ldr	x22, [sp, #0x28]
   10354:      	ldr	x23, [sp, #0x30]
   10358:      	ldr	x29, [sp]
   1035c:      	ldr	x30, [sp, #0x8]
   10360:      	add	sp, sp, #0x40
   10364:      	ret
   10368:      	ubfx	x21, x21, #0, #8
   1036c:      	mov	x0, x21
   10370:      	b	0x10344 <_stogir.vector-arithmetic.valid-type?+0x240>
   10374:      	lsr	w20, w20, #0
   10378:      	lsr	w0, w0, #0
   1037c:      	mov	w1, w0
   10380:      	mov	w0, w20
   10384:      	bl	0x10384 <_stogir.vector-arithmetic.valid-type?+0x280>
		0000000000010384:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
   10388:      	cmp	x0, #0x0
   1038c:      	b.eq	0x10398 <_stogir.vector-arithmetic.valid-type?+0x294>
   10390:      	mov	x0, #0x1                ; =1
   10394:      	b	0x10370 <_stogir.vector-arithmetic.valid-type?+0x26c>
   10398:      	uxtb	w16, w22
   1039c:      	cmp	w16, wzr
   103a0:      	b.ne	0x103b8 <_stogir.vector-arithmetic.valid-type?+0x2b4>
   103a4:      	uxtb	w16, w23
   103a8:      	cmp	w16, wzr
   103ac:      	b.ne	0x103b8 <_stogir.vector-arithmetic.valid-type?+0x2b4>
   103b0:      	movz	x0, #0x0, lsl #48
   103b4:      	b	0x10370 <_stogir.vector-arithmetic.valid-type?+0x26c>
   103b8:      	uxtb	w16, w19
   103bc:      	cmp	w16, wzr
   103c0:      	b.eq	0x10368 <_stogir.vector-arithmetic.valid-type?+0x264>
   103c4:      	mov	x0, #0x1                ; =1
   103c8:      	b	0x10370 <_stogir.vector-arithmetic.valid-type?+0x26c>
   103cc:      	movz	x0, #0x0, lsl #48
   103d0:      	b	0x10370 <_stogir.vector-arithmetic.valid-type?+0x26c>
   103d4:      	uxtb	w16, w2
   103d8:      	cmp	w16, wzr
   103dc:      	b.ne	0x10448 <_stogir.vector-arithmetic.valid-type?+0x344>
   103e0:      	uxtb	w16, w3
   103e4:      	cmp	w16, wzr
   103e8:      	b.ne	0x10448 <_stogir.vector-arithmetic.valid-type?+0x344>
   103ec:      	uxtb	w16, w4
   103f0:      	cmp	w16, wzr
   103f4:      	b.ne	0x10448 <_stogir.vector-arithmetic.valid-type?+0x344>
   103f8:      	uxtb	w16, w22
   103fc:      	cmp	w16, wzr
   10400:      	b.ne	0x104c0 <_stogir.vector-arithmetic.valid-type?+0x3bc>
   10404:      	uxtb	w16, w23
   10408:      	cmp	w16, wzr
   1040c:      	b.ne	0x104c0 <_stogir.vector-arithmetic.valid-type?+0x3bc>
   10410:      	uxtb	w16, w10
   10414:      	cmp	w16, wzr
   10418:      	b.eq	0x104d0 <_stogir.vector-arithmetic.valid-type?+0x3cc>
   1041c:      	uxtb	w16, w1
   10420:      	cmp	w16, wzr
   10424:      	b.eq	0x104d0 <_stogir.vector-arithmetic.valid-type?+0x3cc>
   10428:      	uxtb	w16, w0
   1042c:      	cmp	w16, wzr
   10430:      	b.eq	0x104d8 <_stogir.vector-arithmetic.valid-type?+0x3d4>
   10434:      	uxtb	w16, w8
   10438:      	cmp	w16, wzr
   1043c:      	b.eq	0x104e0 <_stogir.vector-arithmetic.valid-type?+0x3dc>
   10440:      	mov	x0, #0x1                ; =1
   10444:      	b	0x104e8 <_stogir.vector-arithmetic.valid-type?+0x3e4>
   10448:      	uxtb	w16, w10
   1044c:      	cmp	w16, wzr
   10450:      	b.eq	0x103cc <_stogir.vector-arithmetic.valid-type?+0x2c8>
   10454:      	ubfx	x1, x1, #0, #8
   10458:      	mov	x0, x1
   1045c:      	b	0x103d0 <_stogir.vector-arithmetic.valid-type?+0x2cc>
   10460:      	movz	x0, #0x0, lsl #48
   10464:      	b	0x103d0 <_stogir.vector-arithmetic.valid-type?+0x2cc>
   10468:      	cmp	x1, #0x1a
   1046c:      	b.eq	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10470:      	cmp	x1, #0x1b
   10474:      	b.eq	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10478:      	cmp	x1, #0x1c
   1047c:      	b.eq	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10480:      	cmp	x1, #0x1d
   10484:      	b.eq	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10488:      	uxtb	w16, w5
   1048c:      	cmp	w16, wzr
   10490:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   10494:      	uxtb	w16, w2
   10498:      	cmp	w16, wzr
   1049c:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   104a0:      	uxtb	w16, w3
   104a4:      	cmp	w16, wzr
   104a8:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   104ac:      	uxtb	w16, w4
   104b0:      	cmp	w16, wzr
   104b4:      	b.ne	0x1027c <_stogir.vector-arithmetic.valid-type?+0x178>
   104b8:      	movz	x0, #0x0, lsl #48
   104bc:      	b	0x10370 <_stogir.vector-arithmetic.valid-type?+0x26c>
   104c0:      	uxtb	w16, w5
   104c4:      	cmp	w16, wzr
   104c8:      	cset	x0, eq
   104cc:      	b	0x103d0 <_stogir.vector-arithmetic.valid-type?+0x2cc>
   104d0:      	movz	x0, #0x0, lsl #48
   104d4:      	b	0x104cc <_stogir.vector-arithmetic.valid-type?+0x3c8>
   104d8:      	mov	x0, #0x1                ; =1
   104dc:      	b	0x104d4 <_stogir.vector-arithmetic.valid-type?+0x3d0>
   104e0:      	ubfx	x9, x9, #0, #8
   104e4:      	mov	x0, x9
   104e8:      	b	0x104dc <_stogir.vector-arithmetic.valid-type?+0x3d8>

00000000000104ec <_coil.core.Len$slice$len__i32>:
   104ec:      	mov	x0, x1
   104f0:      	ret

00000000000104f4 <_inherent$slice$data__i32>:
   104f4:      	ret

00000000000104f8 <_stogir.opcode.terminator?>:
   104f8:      	sxtw	x0, w0
   104fc:      	cmp	x0, #0x0
   10500:      	b.lt	0x10528 <_stogir.opcode.terminator?+0x30>
   10504:      	cmp	x0, #0x83
   10508:      	b.ge	0x10528 <_stogir.opcode.terminator?+0x30>
   1050c:      	adrp	x16, 0x10000 <_stogir.vector-comparison.valid-type?+0x58>
		000000000001050c:  ARM64_RELOC_PAGE21	l_stogir.507
   10510:      	ldr	x16, [x16]
		0000000000010510:  ARM64_RELOC_PAGEOFF12	l_stogir.507
   10514:      	orr	x1, x16, xzr
   10518:      	lsr	x0, x0, #0
   1051c:      	add	x0, x0, x1
   10520:      	ldrb	w0, [x0]
   10524:      	b	0x1052c <_stogir.opcode.terminator?+0x34>
   10528:      	movz	x0, #0x0, lsl #48
   1052c:      	uxtb	w0, w0
   10530:      	and	x0, x0, #0x8
   10534:      	uxtb	w0, w0
   10538:      	cmp	x0, #0x0
   1053c:      	cset	w0, eq
   10540:      	uxtb	w16, w0
   10544:      	cmp	w16, wzr
   10548:      	cset	x0, eq
   1054c:      	ret

0000000000010550 <_stogir.switch.sign-mask>:
   10550:      	sxtw	x0, w0
   10554:      	cmp	x0, #0x7
   10558:      	b.lt	0x10574 <_stogir.switch.sign-mask+0x24>
   1055c:      	cmp	x0, #0xb
   10560:      	b.gt	0x10574 <_stogir.switch.sign-mask+0x24>
   10564:      	cmp	x0, #0x0
   10568:      	b.ne	0x105ac <_stogir.switch.sign-mask+0x5c>
   1056c:      	movz	x0, #0x0, lsl #48
   10570:      	b	0x10580 <_stogir.switch.sign-mask+0x30>
   10574:      	movz	x0, #0x0, lsl #48
   10578:      	ret
   1057c:      	mov	x0, #0x1                ; =1
   10580:      	lsr	w0, w0, #0
   10584:      	sxtw	x0, w0
   10588:      	lsl	x0, x0, #3
   1058c:      	lsr	w0, w0, #0
   10590:      	sxtw	x0, w0
   10594:      	sub	x0, x0, #0x1
   10598:      	lsr	w0, w0, #0
   1059c:      	sxtw	x0, w0
   105a0:      	mov	x16, #0x1               ; =1
   105a4:      	lsl	x0, x16, x0
   105a8:      	b	0x10578 <_stogir.switch.sign-mask+0x28>
   105ac:      	cmp	x0, #0x1
   105b0:      	b.eq	0x1057c <_stogir.switch.sign-mask+0x2c>
   105b4:      	cmp	x0, #0x2
   105b8:      	b.eq	0x1057c <_stogir.switch.sign-mask+0x2c>
   105bc:      	cmp	x0, #0x7
   105c0:      	b.eq	0x1057c <_stogir.switch.sign-mask+0x2c>
   105c4:      	cmp	x0, #0x8
   105c8:      	b.eq	0x1057c <_stogir.switch.sign-mask+0x2c>
   105cc:      	cmp	x0, #0x3
   105d0:      	b.eq	0x1062c <_stogir.switch.sign-mask+0xdc>
   105d4:      	cmp	x0, #0x9
   105d8:      	b.eq	0x1062c <_stogir.switch.sign-mask+0xdc>
   105dc:      	cmp	x0, #0x4
   105e0:      	b.eq	0x10634 <_stogir.switch.sign-mask+0xe4>
   105e4:      	cmp	x0, #0xa
   105e8:      	b.eq	0x10634 <_stogir.switch.sign-mask+0xe4>
   105ec:      	cmp	x0, #0xd
   105f0:      	b.eq	0x10634 <_stogir.switch.sign-mask+0xe4>
   105f4:      	cmp	x0, #0x5
   105f8:      	b.eq	0x1063c <_stogir.switch.sign-mask+0xec>
   105fc:      	cmp	x0, #0xb
   10600:      	b.eq	0x1063c <_stogir.switch.sign-mask+0xec>
   10604:      	cmp	x0, #0xc
   10608:      	b.eq	0x1063c <_stogir.switch.sign-mask+0xec>
   1060c:      	cmp	x0, #0x6
   10610:      	cset	w0, eq
   10614:      	uxtb	w16, w0
   10618:      	cmp	w16, wzr
   1061c:      	mov	x16, #0x8               ; =8
   10620:      	movn	x17, #0x0, lsl #48
   10624:      	csel	x0, x16, x17, ne
   10628:      	b	0x10640 <_stogir.switch.sign-mask+0xf0>
   1062c:      	mov	x0, #0x2                ; =2
   10630:      	b	0x10580 <_stogir.switch.sign-mask+0x30>
   10634:      	mov	x0, #0x4                ; =4
   10638:      	b	0x10630 <_stogir.switch.sign-mask+0xe0>
   1063c:      	mov	x0, #0x8                ; =8
   10640:      	b	0x10638 <_stogir.switch.sign-mask+0xe8>
