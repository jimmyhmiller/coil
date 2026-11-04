
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-word-address/build/word-address-avec/llvm.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <ltmp0>:
       0:      	stp	x24, x23, [sp, #-0x40]!
       4:      	stp	x22, x21, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	stp	x29, x30, [sp, #0x30]
      10:      	add	x29, sp, #0x30
      14:      	sub	sp, sp, #0x50
      18:      	adrp	x8, 0x0 <ltmp0>
      1c:      	ldrb	w9, [x8]
      20:      	cbz	w9, 0x38 <ltmp0+0x38>
      24:      	adrp	x0, 0x0 <ltmp0>
      28:      	add	x0, x0, #0x0
      2c:      	mov	w1, #0x29               ; =41
      30:      	bl	0x30 <ltmp0+0x30>
      34:      	bl	0x34 <ltmp0+0x34>
      38:      	mov	x19, x1
      3c:      	mov	x21, x0
      40:      	mov	w9, #0x1                ; =1
      44:      	adrp	x1, 0x0 <ltmp0>
      48:      	add	x1, x1, #0x0
      4c:      	mov	w0, #0x2                ; =2
      50:      	mov	w2, #0x7                ; =7
      54:      	strb	w9, [x8]
      58:      	bl	0x58 <ltmp0+0x58>
      5c:      	mov	x23, sp
      60:      	sub	x20, x23, #0x50
      64:      	mov	sp, x20
      68:      	movi.2d	v0, #0000000000000000
      6c:      	adrp	x22, 0x0 <ltmp0>
      70:      	add	x22, x22, #0x0
      74:      	mov	w8, #0x20               ; =32
      78:      	adrp	x2, 0x0 <ltmp0>
      7c:      	add	x2, x2, #0x0
      80:      	sub	x0, x29, #0x78
      84:      	mov	x1, x22
      88:      	mov	w3, #0xc                ; =12
      8c:      	stur	x22, [x23, #-0x50]
      90:      	stur	q0, [x23, #-0x48]
      94:      	stur	q0, [x23, #-0x18]
      98:      	stur	q0, [x23, #-0x28]
      9c:      	stur	q0, [x23, #-0x38]
      a0:      	movi.2d	v0, #0xffffffffffffffff
      a4:      	stur	xzr, [x23, #-0x40]
      a8:      	sturb	wzr, [x29, #-0x48]
      ac:      	stur	w8, [x23, #-0x28]
      b0:      	stur	q0, [x23, #-0x38]
      b4:      	stur	xzr, [x23, #-0x24]
      b8:      	stur	wzr, [x23, #-0x1c]
      bc:      	sturb	wzr, [x23, #-0x18]
      c0:      	stur	xzr, [x23, #-0x17]
      c4:      	bl	0xc4 <ltmp0+0xc4>
      c8:      	cmp	x21, #0x0
      cc:      	lsr	x1, x21, #63
      d0:      	sub	x0, x23, #0x50
      d4:      	cneg	x8, x21, mi
      d8:      	sub	x2, x29, #0x48
      dc:      	sturb	wzr, [x23, #-0x48]
      e0:      	stur	wzr, [x29, #-0x48]
      e4:      	stur	x8, [x29, #-0x40]
      e8:      	bl	0xe8 <ltmp0+0xe8>
      ec:      	adrp	x2, 0x0 <ltmp0>
      f0:      	add	x2, x2, #0x0
      f4:      	sub	x0, x29, #0x60
      f8:      	mov	x1, x22
      fc:      	mov	w3, #0x10               ; =16
     100:      	bl	0x100 <ltmp0+0x100>
     104:      	cmp	x19, #0x0
     108:      	lsr	x1, x19, #63
     10c:      	sub	x2, x29, #0x48
     110:      	cneg	x8, x19, mi
     114:      	mov	x0, x20
     118:      	sturb	wzr, [x23, #-0x48]
     11c:      	stur	wzr, [x29, #-0x48]
     120:      	stur	x8, [x29, #-0x40]
     124:      	bl	0x124 <ltmp0+0x124>
     128:      	bl	0x128 <ltmp0+0x128>

000000000000012c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>:
     12c:      	sub	sp, sp, #0x60
     130:      	stp	x29, x30, [sp, #0x50]
     134:      	add	x29, sp, #0x50
     138:      	ldr	w8, [x0]
     13c:      	cmp	w8, #0x2
     140:      	b.eq	0x168 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x3c>
     144:      	cmp	w8, #0x1
     148:      	b.ne	0x180 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x54>
     14c:      	ldr	x2, [x0, #0x8]
     150:      	cbz	x2, 0x19c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x70>
     154:      	add	x0, sp, #0x18
     158:      	bl	0x158 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x2c>
     15c:      	ldp	x29, x30, [sp, #0x50]
     160:      	add	sp, sp, #0x60
     164:      	ret
     168:      	ldp	x2, x3, [x0, #0x8]
     16c:      	sub	x0, x29, #0x20
     170:      	bl	0x170 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x44>
     174:      	ldp	x29, x30, [sp, #0x50]
     178:      	add	sp, sp, #0x60
     17c:      	ret
     180:      	ldr	x2, [x0, #0x8]
     184:      	cbz	x2, 0x1a8 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x7c>
     188:      	mov	x0, sp
     18c:      	bl	0x18c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x60>
     190:      	ldp	x29, x30, [sp, #0x50]
     194:      	add	sp, sp, #0x60
     198:      	ret
     19c:      	mov	w8, #0x30               ; =48
     1a0:      	add	x0, sp, #0x18
     1a4:      	b	0x1b0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x84>
     1a8:      	mov	w8, #0x30               ; =48
     1ac:      	mov	x0, sp
     1b0:      	sturb	w8, [x29, #-0x1]
     1b4:      	sub	x2, x29, #0x1
     1b8:      	mov	w3, #0x1                ; =1
     1bc:      	bl	0x1bc <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x90>
     1c0:      	ldp	x29, x30, [sp, #0x50]
     1c4:      	add	sp, sp, #0x60
     1c8:      	ret

00000000000001cc <_coil.fmt.count--write>:
     1cc:      	ldr	x9, [x0]
     1d0:      	add	x9, x9, x2
     1d4:      	str	x9, [x0]
     1d8:      	str	wzr, [x8]
     1dc:      	str	x2, [x8, #0x8]
     1e0:      	ret

00000000000001e4 <_coil.fmt.fmt--number__coil.fmt.IntDigits>:
     1e4:      	stp	x28, x27, [sp, #-0x60]!
     1e8:      	stp	x26, x25, [sp, #0x10]
     1ec:      	stp	x24, x23, [sp, #0x20]
     1f0:      	stp	x22, x21, [sp, #0x30]
     1f4:      	stp	x20, x19, [sp, #0x40]
     1f8:      	stp	x29, x30, [sp, #0x50]
     1fc:      	add	x29, sp, #0x50
     200:      	sub	sp, sp, #0x130
     204:      	mov	x19, sp
     208:      	ldrb	w8, [x0, #0x40]
     20c:      	ldr	x20, [x0]
     210:      	mov	x21, x2
     214:      	mov	w22, w1
     218:      	adrp	x9, 0x0 <ltmp0>
     21c:      	add	x9, x9, #0x0
     220:      	adrp	x28, 0x0 <ltmp0>
     224:      	add	x28, x28, #0x0
     228:      	tbz	w8, #0x0, 0x340 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x15c>
     22c:      	ldrb	w11, [x0, #0x38]
     230:      	adrp	x8, 0x0 <ltmp0>
     234:      	add	x8, x8, #0x0
     238:      	ldr	x25, [x0, #0x18]
     23c:      	ldr	w24, [x0, #0x28]
     240:      	ldr	w10, [x0, #0x30]
     244:      	tst	w11, #0x1
     248:      	sub	x1, sp, #0x10
     24c:      	strb	wzr, [x0, #0x40]
     250:      	csel	x8, x8, x9, ne
     254:      	and	x9, x11, #0x1
     258:      	cmp	w22, #0x0
     25c:      	csel	x2, x28, x8, ne
     260:      	csinc	x3, x9, xzr, eq
     264:      	mov	sp, x1
     268:      	sub	x23, sp, #0x10
     26c:      	mov	sp, x23
     270:      	tbnz	x25, #0x3f, 0x34c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x168>
     274:      	ldr	x8, [x21, #0x10]
     278:      	ldr	q0, [x21]
     27c:      	add	x27, x19, #0xa0
     280:      	ldrb	w26, [x0, #0x39]
     284:      	add	x0, x19, #0x50
     288:      	str	w10, [x19, #0xc]
     28c:      	str	x8, [x19, #0x60]
     290:      	adrp	x8, 0x0 <ltmp0>
     294:      	add	x8, x8, #0x0
     298:      	str	xzr, [x23]
     29c:      	str	q0, [x19, #0x50]
     2a0:      	stp	x8, x23, [x1]
     2a4:      	str	x11, [x19, #0x10]
     2a8:      	bl	0x2a8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0xc4>
     2ac:      	ldr	x10, [x19, #0x10]
     2b0:      	ldr	x9, [x23]
     2b4:      	orr	w8, w22, w10
     2b8:      	and	x3, x8, #0x1
     2bc:      	add	x23, x9, x3
     2c0:      	tbz	w26, #0x0, 0x394 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1b0>
     2c4:      	tst	w10, #0x1
     2c8:      	adrp	x8, 0x0 <ltmp0>
     2cc:      	add	x8, x8, #0x0
     2d0:      	adrp	x9, 0x0 <ltmp0>
     2d4:      	add	x9, x9, #0x0
     2d8:      	add	x0, x19, #0x70
     2dc:      	csel	x8, x9, x8, ne
     2e0:      	cmp	w22, #0x0
     2e4:      	mov	x1, x20
     2e8:      	csel	x2, x28, x8, ne
     2ec:      	bl	0x2ec <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x108>
     2f0:      	sub	x22, x25, x23
     2f4:      	cmp	x22, #0x1
     2f8:      	b.lt	0x328 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x144>
     2fc:      	mov	x23, xzr
     300:      	mov	w24, #0x30              ; =48
     304:      	add	x0, x19, #0x88
     308:      	sub	x2, x29, #0x80
     30c:      	mov	x1, x20
     310:      	mov	w3, #0x1                ; =1
     314:      	sturb	w24, [x29, #-0x80]
     318:      	bl	0x318 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x134>
     31c:      	add	x23, x23, #0x1
     320:      	cmp	x23, x22
     324:      	b.lt	0x304 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x120>
     328:      	ldr	q0, [x21]
     32c:      	ldr	x8, [x21, #0x10]
     330:      	add	x0, x19, #0xa0
     334:      	str	q0, [x27]
     338:      	str	x8, [x19, #0xb0]
     33c:      	b	0x36c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x188>
     340:      	cmp	w22, #0x0
     344:      	mov	w3, w22
     348:      	csel	x2, x28, x9, ne
     34c:      	add	x0, x19, #0x18
     350:      	mov	x1, x20
     354:      	bl	0x354 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x170>
     358:      	ldr	q0, [x21]
     35c:      	ldr	x8, [x21, #0x10]
     360:      	add	x0, x19, #0x30
     364:      	str	q0, [x19, #0x30]
     368:      	str	x8, [x19, #0x40]
     36c:      	mov	x1, x20
     370:      	bl	0x370 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x18c>
     374:      	sub	sp, x29, #0x50
     378:      	ldp	x29, x30, [sp, #0x50]
     37c:      	ldp	x20, x19, [sp, #0x40]
     380:      	ldp	x22, x21, [sp, #0x30]
     384:      	ldp	x24, x23, [sp, #0x20]
     388:      	ldp	x26, x25, [sp, #0x10]
     38c:      	ldp	x28, x27, [sp], #0x60
     390:      	ret
     394:      	sub	x26, x25, x23
     398:      	cmp	x26, #0x1
     39c:      	b.lt	0x440 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x25c>
     3a0:      	ldr	w8, [x19, #0xc]
     3a4:      	cmp	w8, #0x1
     3a8:      	b.gt	0x484 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2a0>
     3ac:      	cbnz	w8, 0x51c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x338>
     3b0:      	lsr	w28, w24, #8
     3b4:      	str	x3, [x19]
     3b8:      	cbz	w28, 0x61c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x438>
     3bc:      	lsr	w23, w24, #16
     3c0:      	lsr	w27, w24, #24
     3c4:      	mov	x25, x26
     3c8:      	b	0x3d4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1f0>
     3cc:      	subs	x25, x25, #0x1
     3d0:      	b.eq	0x668 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x484>
     3d4:      	sub	x0, x29, #0x98
     3d8:      	sub	x2, x29, #0x61
     3dc:      	mov	x1, x20
     3e0:      	mov	w3, #0x1                ; =1
     3e4:      	sturb	w24, [x29, #-0x61]
     3e8:      	bl	0x3e8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x204>
     3ec:      	sub	x0, x29, #0x80
     3f0:      	sub	x2, x29, #0x61
     3f4:      	mov	x1, x20
     3f8:      	mov	w3, #0x1                ; =1
     3fc:      	sturb	w28, [x29, #-0x61]
     400:      	bl	0x400 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x21c>
     404:      	cbz	w23, 0x3cc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1e8>
     408:      	sub	x0, x29, #0x80
     40c:      	sub	x2, x29, #0x61
     410:      	mov	x1, x20
     414:      	mov	w3, #0x1                ; =1
     418:      	sturb	w23, [x29, #-0x61]
     41c:      	bl	0x41c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x238>
     420:      	cbz	w27, 0x3cc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1e8>
     424:      	sub	x0, x29, #0x80
     428:      	sub	x2, x29, #0x61
     42c:      	mov	x1, x20
     430:      	mov	w3, #0x1                ; =1
     434:      	sturb	w27, [x29, #-0x61]
     438:      	bl	0x438 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x254>
     43c:      	b	0x3cc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1e8>
     440:      	tst	w10, #0x1
     444:      	adrp	x8, 0x0 <ltmp0>
     448:      	add	x8, x8, #0x0
     44c:      	adrp	x9, 0x0 <ltmp0>
     450:      	add	x9, x9, #0x0
     454:      	add	x0, x19, #0xb8
     458:      	csel	x8, x9, x8, ne
     45c:      	cmp	w22, #0x0
     460:      	mov	x1, x20
     464:      	csel	x2, x28, x8, ne
     468:      	bl	0x468 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x284>
     46c:      	ldr	q0, [x21]
     470:      	ldr	x8, [x21, #0x10]
     474:      	sub	x0, x29, #0xb0
     478:      	str	q0, [x27, #0x30]
     47c:      	stur	x8, [x29, #-0xa0]
     480:      	b	0x36c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x188>
     484:      	cmp	w8, #0x2
     488:      	str	x3, [x19]
     48c:      	b.ne	0x568 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x384>
     490:      	lsr	w27, w24, #8
     494:      	cbz	w27, 0x644 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x460>
     498:      	lsr	w28, w24, #16
     49c:      	lsr	w23, w24, #24
     4a0:      	mov	x25, x26
     4a4:      	b	0x4b0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2cc>
     4a8:      	subs	x25, x25, #0x1
     4ac:      	b.eq	0x668 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x484>
     4b0:      	sub	x0, x29, #0x98
     4b4:      	sub	x2, x29, #0x61
     4b8:      	mov	x1, x20
     4bc:      	mov	w3, #0x1                ; =1
     4c0:      	sturb	w24, [x29, #-0x61]
     4c4:      	bl	0x4c4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2e0>
     4c8:      	sub	x0, x29, #0x80
     4cc:      	sub	x2, x29, #0x61
     4d0:      	mov	x1, x20
     4d4:      	mov	w3, #0x1                ; =1
     4d8:      	sturb	w27, [x29, #-0x61]
     4dc:      	bl	0x4dc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2f8>
     4e0:      	cbz	w28, 0x4a8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2c4>
     4e4:      	sub	x0, x29, #0x80
     4e8:      	sub	x2, x29, #0x61
     4ec:      	mov	x1, x20
     4f0:      	mov	w3, #0x1                ; =1
     4f4:      	sturb	w28, [x29, #-0x61]
     4f8:      	bl	0x4f8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x314>
     4fc:      	cbz	w23, 0x4a8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2c4>
     500:      	sub	x0, x29, #0x80
     504:      	sub	x2, x29, #0x61
     508:      	mov	x1, x20
     50c:      	mov	w3, #0x1                ; =1
     510:      	sturb	w23, [x29, #-0x61]
     514:      	bl	0x514 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x330>
     518:      	b	0x4a8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2c4>
     51c:      	tst	w10, #0x1
     520:      	adrp	x8, 0x0 <ltmp0>
     524:      	add	x8, x8, #0x0
     528:      	adrp	x9, 0x0 <ltmp0>
     52c:      	add	x9, x9, #0x0
     530:      	add	x0, x19, #0xb8
     534:      	csel	x8, x9, x8, ne
     538:      	cmp	w22, #0x0
     53c:      	mov	x1, x20
     540:      	csel	x2, x28, x8, ne
     544:      	bl	0x544 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x360>
     548:      	ldr	q0, [x21]
     54c:      	ldr	x8, [x21, #0x10]
     550:      	sub	x0, x29, #0xb0
     554:      	mov	x1, x20
     558:      	str	q0, [x27, #0x30]
     55c:      	stur	x8, [x29, #-0xa0]
     560:      	bl	0x560 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x37c>
     564:      	b	0x6d4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x4f0>
     568:      	lsr	x28, x26, #1
     56c:      	cbz	x28, 0x668 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x484>
     570:      	lsr	w25, w24, #8
     574:      	cbz	w25, 0x5f8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x414>
     578:      	lsr	w23, w24, #16
     57c:      	lsr	w27, w24, #24
     580:      	b	0x58c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3a8>
     584:      	subs	x28, x28, #0x1
     588:      	b.eq	0x668 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x484>
     58c:      	sub	x0, x29, #0x98
     590:      	sub	x2, x29, #0x61
     594:      	mov	x1, x20
     598:      	mov	w3, #0x1                ; =1
     59c:      	sturb	w24, [x29, #-0x61]
     5a0:      	bl	0x5a0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3bc>
     5a4:      	sub	x0, x29, #0x80
     5a8:      	sub	x2, x29, #0x61
     5ac:      	mov	x1, x20
     5b0:      	mov	w3, #0x1                ; =1
     5b4:      	sturb	w25, [x29, #-0x61]
     5b8:      	bl	0x5b8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3d4>
     5bc:      	cbz	w23, 0x584 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3a0>
     5c0:      	sub	x0, x29, #0x80
     5c4:      	sub	x2, x29, #0x61
     5c8:      	mov	x1, x20
     5cc:      	mov	w3, #0x1                ; =1
     5d0:      	sturb	w23, [x29, #-0x61]
     5d4:      	bl	0x5d4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3f0>
     5d8:      	cbz	w27, 0x584 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3a0>
     5dc:      	sub	x0, x29, #0x80
     5e0:      	sub	x2, x29, #0x61
     5e4:      	mov	x1, x20
     5e8:      	mov	w3, #0x1                ; =1
     5ec:      	sturb	w27, [x29, #-0x61]
     5f0:      	bl	0x5f0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x40c>
     5f4:      	b	0x584 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3a0>
     5f8:      	sub	x0, x29, #0x98
     5fc:      	sub	x2, x29, #0x61
     600:      	mov	x1, x20
     604:      	mov	w3, #0x1                ; =1
     608:      	sturb	w24, [x29, #-0x61]
     60c:      	bl	0x60c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x428>
     610:      	subs	x28, x28, #0x1
     614:      	b.ne	0x5f8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x414>
     618:      	b	0x668 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x484>
     61c:      	mov	x23, x26
     620:      	sub	x0, x29, #0x98
     624:      	sub	x2, x29, #0x61
     628:      	mov	x1, x20
     62c:      	mov	w3, #0x1                ; =1
     630:      	sturb	w24, [x29, #-0x61]
     634:      	bl	0x634 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x450>
     638:      	subs	x23, x23, #0x1
     63c:      	b.ne	0x620 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x43c>
     640:      	b	0x668 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x484>
     644:      	mov	x23, x26
     648:      	sub	x0, x29, #0x98
     64c:      	sub	x2, x29, #0x61
     650:      	mov	x1, x20
     654:      	mov	w3, #0x1                ; =1
     658:      	sturb	w24, [x29, #-0x61]
     65c:      	bl	0x65c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x478>
     660:      	subs	x23, x23, #0x1
     664:      	b.ne	0x648 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x464>
     668:      	ldr	x8, [x19, #0x10]
     66c:      	adrp	x9, 0x0 <ltmp0>
     670:      	add	x9, x9, #0x0
     674:      	ldr	x3, [x19]
     678:      	add	x0, x19, #0xb8
     67c:      	mov	x1, x20
     680:      	tst	w8, #0x1
     684:      	adrp	x8, 0x0 <ltmp0>
     688:      	add	x8, x8, #0x0
     68c:      	csel	x8, x9, x8, ne
     690:      	cmp	w22, #0x0
     694:      	adrp	x9, 0x0 <ltmp0>
     698:      	add	x9, x9, #0x0
     69c:      	csel	x2, x9, x8, ne
     6a0:      	bl	0x6a0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x4bc>
     6a4:      	ldr	q0, [x21]
     6a8:      	ldr	x8, [x21, #0x10]
     6ac:      	add	x9, x19, #0xa0
     6b0:      	sub	x0, x29, #0xb0
     6b4:      	mov	x1, x20
     6b8:      	str	q0, [x9, #0x30]
     6bc:      	stur	x8, [x29, #-0xa0]
     6c0:      	bl	0x6c0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x4dc>
     6c4:      	ldr	w8, [x19, #0xc]
     6c8:      	cmp	w8, #0x1
     6cc:      	b.gt	0x75c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x578>
     6d0:      	cbz	w8, 0x374 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x190>
     6d4:      	lsr	w21, w24, #8
     6d8:      	lsr	w22, w24, #16
     6dc:      	lsr	w23, w24, #24
     6e0:      	b	0x6ec <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x508>
     6e4:      	subs	x26, x26, #0x1
     6e8:      	b.eq	0x374 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x190>
     6ec:      	sub	x0, x29, #0x98
     6f0:      	sub	x2, x29, #0x61
     6f4:      	mov	x1, x20
     6f8:      	mov	w3, #0x1                ; =1
     6fc:      	sturb	w24, [x29, #-0x61]
     700:      	bl	0x700 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x51c>
     704:      	cbz	w21, 0x6e4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x500>
     708:      	sub	x0, x29, #0x80
     70c:      	sub	x2, x29, #0x61
     710:      	mov	x1, x20
     714:      	mov	w3, #0x1                ; =1
     718:      	sturb	w21, [x29, #-0x61]
     71c:      	bl	0x71c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x538>
     720:      	cbz	w22, 0x6e4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x500>
     724:      	sub	x0, x29, #0x80
     728:      	sub	x2, x29, #0x61
     72c:      	mov	x1, x20
     730:      	mov	w3, #0x1                ; =1
     734:      	sturb	w22, [x29, #-0x61]
     738:      	bl	0x738 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x554>
     73c:      	cbz	w23, 0x6e4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x500>
     740:      	sub	x0, x29, #0x80
     744:      	sub	x2, x29, #0x61
     748:      	mov	x1, x20
     74c:      	mov	w3, #0x1                ; =1
     750:      	sturb	w23, [x29, #-0x61]
     754:      	bl	0x754 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x570>
     758:      	b	0x6e4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x500>
     75c:      	cmp	w8, #0x2
     760:      	b.eq	0x374 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x190>
     764:      	sub	x21, x26, x26, lsr #1
     768:      	cmp	x21, #0x1
     76c:      	b.lt	0x374 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x190>
     770:      	lsr	w22, w24, #8
     774:      	cbz	w22, 0x7f8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x614>
     778:      	lsr	w23, w24, #16
     77c:      	lsr	w25, w24, #24
     780:      	b	0x78c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x5a8>
     784:      	subs	x21, x21, #0x1
     788:      	b.eq	0x374 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x190>
     78c:      	sub	x0, x29, #0x98
     790:      	sub	x2, x29, #0x61
     794:      	mov	x1, x20
     798:      	mov	w3, #0x1                ; =1
     79c:      	sturb	w24, [x29, #-0x61]
     7a0:      	bl	0x7a0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x5bc>
     7a4:      	sub	x0, x29, #0x80
     7a8:      	sub	x2, x29, #0x61
     7ac:      	mov	x1, x20
     7b0:      	mov	w3, #0x1                ; =1
     7b4:      	sturb	w22, [x29, #-0x61]
     7b8:      	bl	0x7b8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x5d4>
     7bc:      	cbz	w23, 0x784 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x5a0>
     7c0:      	sub	x0, x29, #0x80
     7c4:      	sub	x2, x29, #0x61
     7c8:      	mov	x1, x20
     7cc:      	mov	w3, #0x1                ; =1
     7d0:      	sturb	w23, [x29, #-0x61]
     7d4:      	bl	0x7d4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x5f0>
     7d8:      	cbz	w25, 0x784 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x5a0>
     7dc:      	sub	x0, x29, #0x80
     7e0:      	sub	x2, x29, #0x61
     7e4:      	mov	x1, x20
     7e8:      	mov	w3, #0x1                ; =1
     7ec:      	sturb	w25, [x29, #-0x61]
     7f0:      	bl	0x7f0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x60c>
     7f4:      	b	0x784 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x5a0>
     7f8:      	sub	x0, x29, #0x98
     7fc:      	sub	x2, x29, #0x61
     800:      	mov	x1, x20
     804:      	mov	w3, #0x1                ; =1
     808:      	sturb	w24, [x29, #-0x61]
     80c:      	bl	0x80c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x628>
     810:      	subs	x21, x21, #0x1
     814:      	b.ne	0x7f8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x614>
     818:      	b	0x374 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x190>

000000000000081c <_coil.fmt.udec-digits>:
     81c:      	sub	sp, sp, #0x50
     820:      	stp	x22, x21, [sp, #0x20]
     824:      	stp	x20, x19, [sp, #0x30]
     828:      	stp	x29, x30, [sp, #0x40]
     82c:      	add	x29, sp, #0x40
     830:      	mov	x19, x0
     834:      	cbz	x2, 0x888 <_coil.fmt.udec-digits+0x6c>
     838:      	mov	x8, #-0x3333333333333334 ; =-3689348814741910324
     83c:      	mov	x20, x2
     840:      	mov	x0, sp
     844:      	movk	x8, #0xcccd
     848:      	mov	x21, x1
     84c:      	umulh	x8, x2, x8
     850:      	lsr	x22, x8, #3
     854:      	mov	x2, x22
     858:      	bl	0x81c <_coil.fmt.udec-digits>
     85c:      	ldr	w8, [sp]
     860:      	cmp	w8, #0x1
     864:      	b.ne	0x8a4 <_coil.fmt.udec-digits+0x88>
     868:      	ldur	q0, [sp, #0x8]
     86c:      	str	w8, [x19]
     870:      	stur	q0, [x19, #0x8]
     874:      	ldp	x29, x30, [sp, #0x40]
     878:      	ldp	x20, x19, [sp, #0x30]
     87c:      	ldp	x22, x21, [sp, #0x20]
     880:      	add	sp, sp, #0x50
     884:      	ret
     888:      	str	wzr, [x19]
     88c:      	str	xzr, [x19, #0x8]
     890:      	ldp	x29, x30, [sp, #0x40]
     894:      	ldp	x20, x19, [sp, #0x30]
     898:      	ldp	x22, x21, [sp, #0x20]
     89c:      	add	sp, sp, #0x50
     8a0:      	ret
     8a4:      	mov	w8, #0xa                ; =10
     8a8:      	add	x2, sp, #0x1f
     8ac:      	mov	x0, x19
     8b0:      	msub	w8, w22, w8, w20
     8b4:      	mov	x1, x21
     8b8:      	mov	w3, #0x1                ; =1
     8bc:      	orr	w8, w8, #0x30
     8c0:      	strb	w8, [sp, #0x1f]
     8c4:      	bl	0x8c4 <_coil.fmt.udec-digits+0xa8>
     8c8:      	ldp	x29, x30, [sp, #0x40]
     8cc:      	ldp	x20, x19, [sp, #0x30]
     8d0:      	ldp	x22, x21, [sp, #0x20]
     8d4:      	add	sp, sp, #0x50
     8d8:      	ret

00000000000008dc <_coil.fmt.uhex-digits>:
     8dc:      	sub	sp, sp, #0x50
     8e0:      	stp	x22, x21, [sp, #0x20]
     8e4:      	stp	x20, x19, [sp, #0x30]
     8e8:      	stp	x29, x30, [sp, #0x40]
     8ec:      	add	x29, sp, #0x40
     8f0:      	mov	x19, x0
     8f4:      	cbz	x2, 0x938 <_coil.fmt.uhex-digits+0x5c>
     8f8:      	mov	x21, x2
     8fc:      	lsr	x2, x2, #4
     900:      	mov	x0, sp
     904:      	mov	x20, x1
     908:      	bl	0x8dc <_coil.fmt.uhex-digits>
     90c:      	ldr	w8, [sp]
     910:      	cmp	w8, #0x1
     914:      	b.ne	0x954 <_coil.fmt.uhex-digits+0x78>
     918:      	ldur	q0, [sp, #0x8]
     91c:      	str	w8, [x19]
     920:      	stur	q0, [x19, #0x8]
     924:      	ldp	x29, x30, [sp, #0x40]
     928:      	ldp	x20, x19, [sp, #0x30]
     92c:      	ldp	x22, x21, [sp, #0x20]
     930:      	add	sp, sp, #0x50
     934:      	ret
     938:      	str	wzr, [x19]
     93c:      	str	xzr, [x19, #0x8]
     940:      	ldp	x29, x30, [sp, #0x40]
     944:      	ldp	x20, x19, [sp, #0x30]
     948:      	ldp	x22, x21, [sp, #0x20]
     94c:      	add	sp, sp, #0x50
     950:      	ret
     954:      	and	x8, x21, #0xf
     958:      	add	x2, sp, #0x1f
     95c:      	mov	x0, x19
     960:      	orr	w9, w8, #0x30
     964:      	add	w10, w8, #0x57
     968:      	cmp	x8, #0xa
     96c:      	csel	x8, x9, x10, lo
     970:      	mov	x1, x20
     974:      	mov	w3, #0x1                ; =1
     978:      	strb	w8, [sp, #0x1f]
     97c:      	bl	0x97c <_coil.fmt.uhex-digits+0xa0>
     980:      	ldp	x29, x30, [sp, #0x40]
     984:      	ldp	x20, x19, [sp, #0x30]
     988:      	ldp	x22, x21, [sp, #0x20]
     98c:      	add	sp, sp, #0x50
     990:      	ret

0000000000000994 <_coil.io.write-all>:
     994:      	sub	sp, sp, #0x70
     998:      	stp	x24, x23, [sp, #0x30]
     99c:      	stp	x22, x21, [sp, #0x40]
     9a0:      	stp	x20, x19, [sp, #0x50]
     9a4:      	stp	x29, x30, [sp, #0x60]
     9a8:      	add	x29, sp, #0x60
     9ac:      	cmp	x3, #0x1
     9b0:      	mov	x19, x0
     9b4:      	b.lt	0x9f0 <_coil.io.write-all+0x5c>
     9b8:      	ldp	x9, x0, [x1]
     9bc:      	mov	x20, x2
     9c0:      	mov	x22, x1
     9c4:      	mov	x8, sp
     9c8:      	mov	x1, x2
     9cc:      	mov	x2, x3
     9d0:      	mov	x21, x3
     9d4:      	mov	x23, sp
     9d8:      	blr	x9
     9dc:      	ldr	w8, [sp]
     9e0:      	cmp	w8, #0x1
     9e4:      	b.ne	0xa10 <_coil.io.write-all+0x7c>
     9e8:      	ldur	q0, [x23, #0x8]
     9ec:      	b	0xa44 <_coil.io.write-all+0xb0>
     9f0:      	str	wzr, [x19]
     9f4:      	str	xzr, [x19, #0x8]
     9f8:      	ldp	x29, x30, [sp, #0x60]
     9fc:      	ldp	x20, x19, [sp, #0x50]
     a00:      	ldp	x22, x21, [sp, #0x40]
     a04:      	ldp	x24, x23, [sp, #0x30]
     a08:      	add	sp, sp, #0x70
     a0c:      	ret
     a10:      	ldr	x23, [sp, #0x8]
     a14:      	cmp	x23, #0x0
     a18:      	b.le	0xa64 <_coil.io.write-all+0xd0>
     a1c:      	sub	x3, x21, x23
     a20:      	add	x0, sp, #0x18
     a24:      	add	x2, x20, x23
     a28:      	mov	x1, x22
     a2c:      	add	x20, sp, #0x18
     a30:      	bl	0x994 <_coil.io.write-all>
     a34:      	ldr	w8, [sp, #0x18]
     a38:      	cmp	w8, #0x1
     a3c:      	b.ne	0xa8c <_coil.io.write-all+0xf8>
     a40:      	ldur	q0, [x20, #0x8]
     a44:      	str	w8, [x19]
     a48:      	stur	q0, [x19, #0x8]
     a4c:      	ldp	x29, x30, [sp, #0x60]
     a50:      	ldp	x20, x19, [sp, #0x50]
     a54:      	ldp	x22, x21, [sp, #0x40]
     a58:      	ldp	x24, x23, [sp, #0x30]
     a5c:      	add	sp, sp, #0x70
     a60:      	ret
     a64:      	mov	w8, #0x1                ; =1
     a68:      	mov	w9, #0x5                ; =5
     a6c:      	str	w8, [x19]
     a70:      	str	w9, [x19, #0x8]
     a74:      	ldp	x29, x30, [sp, #0x60]
     a78:      	ldp	x20, x19, [sp, #0x50]
     a7c:      	ldp	x22, x21, [sp, #0x40]
     a80:      	ldp	x24, x23, [sp, #0x30]
     a84:      	add	sp, sp, #0x70
     a88:      	ret
     a8c:      	ldr	x8, [sp, #0x20]
     a90:      	str	wzr, [x19]
     a94:      	add	x8, x8, x23
     a98:      	str	x8, [x19, #0x8]
     a9c:      	ldp	x29, x30, [sp, #0x60]
     aa0:      	ldp	x20, x19, [sp, #0x50]
     aa4:      	ldp	x22, x21, [sp, #0x40]
     aa8:      	ldp	x24, x23, [sp, #0x30]
     aac:      	add	sp, sp, #0x70
     ab0:      	ret

0000000000000ab4 <_coil.io.write-fd>:
     ab4:      	sub	sp, sp, #0xa0
     ab8:      	stp	x28, x27, [sp, #0x40]
     abc:      	stp	x26, x25, [sp, #0x50]
     ac0:      	stp	x24, x23, [sp, #0x60]
     ac4:      	stp	x22, x21, [sp, #0x70]
     ac8:      	stp	x20, x19, [sp, #0x80]
     acc:      	stp	x29, x30, [sp, #0x90]
     ad0:      	add	x29, sp, #0x90
     ad4:      	mov	x20, x2
     ad8:      	mov	x21, x1
     adc:      	mov	x22, x0
     ae0:      	mov	x19, x8
     ae4:      	bl	0xae4 <_coil.io.write-fd+0x30>
     ae8:      	tbnz	x0, #0x3f, 0xb28 <_coil.io.write-fd+0x74>
     aec:      	str	wzr, [sp, #0x8]
     af0:      	add	x8, sp, #0x8
     af4:      	str	x0, [sp, #0x10]
     af8:      	ldr	q0, [x8]
     afc:      	ldr	x8, [x8, #0x10]
     b00:      	ldp	x29, x30, [sp, #0x90]
     b04:      	str	q0, [x19]
     b08:      	ldp	x22, x21, [sp, #0x70]
     b0c:      	str	x8, [x19, #0x10]
     b10:      	ldp	x20, x19, [sp, #0x80]
     b14:      	ldp	x24, x23, [sp, #0x60]
     b18:      	ldp	x26, x25, [sp, #0x50]
     b1c:      	ldp	x28, x27, [sp, #0x40]
     b20:      	add	sp, sp, #0xa0
     b24:      	ret
     b28:      	adrp	x25, 0x0 <ltmp0>
     b2c:      	add	x25, x25, #0x0
     b30:      	adrp	x23, 0x0 <ltmp0>
     b34:      	add	x23, x23, #0x0
     b38:      	adrp	x26, 0x0 <ltmp0>
     b3c:      	add	x26, x26, #0x0
     b40:      	adrp	x24, 0x0 <ltmp0>
     b44:      	add	x24, x24, #0x0
     b48:      	mov	w27, #0x4               ; =4
     b4c:      	b	0xb74 <_coil.io.write-fd+0xc0>
     b50:      	blr	x0
     b54:      	ldr	w8, [x0]
     b58:      	cmp	w8, #0x4
     b5c:      	b.ne	0xc14 <_coil.io.write-fd+0x160>
     b60:      	mov	w0, w22
     b64:      	mov	x1, x21
     b68:      	mov	x2, x20
     b6c:      	bl	0xb6c <_coil.io.write-fd+0xb8>
     b70:      	tbz	x0, #0x3f, 0xaec <_coil.io.write-fd+0x38>
     b74:      	ldar	x0, [x25]
     b78:      	cbz	x0, 0xb90 <_coil.io.write-fd+0xdc>
     b7c:      	blr	x0
     b80:      	ldr	w28, [x0]
     b84:      	cmp	w28, #0x4
     b88:      	b.ne	0xbb0 <_coil.io.write-fd+0xfc>
     b8c:      	b	0xb60 <_coil.io.write-fd+0xac>
     b90:      	mov	x0, #-0x2               ; =-2
     b94:      	mov	x1, x23
     b98:      	bl	0xb98 <_coil.io.write-fd+0xe4>
     b9c:      	stlr	x0, [x25]
     ba0:      	blr	x0
     ba4:      	ldr	w28, [x0]
     ba8:      	cmp	w28, #0x4
     bac:      	b.eq	0xb60 <_coil.io.write-fd+0xac>
     bb0:      	cmp	w28, #0x23
     bb4:      	b.ne	0xc14 <_coil.io.write-fd+0x160>
     bb8:      	ldar	x8, [x26]
     bbc:      	cbz	x8, 0xbc8 <_coil.io.write-fd+0x114>
     bc0:      	stp	w22, w27, [sp, #0x38]
     bc4:      	b	0xbe4 <_coil.io.write-fd+0x130>
     bc8:      	mov	x0, #-0x2               ; =-2
     bcc:      	mov	x1, x24
     bd0:      	bl	0xbd0 <_coil.io.write-fd+0x11c>
     bd4:      	mov	x8, x0
     bd8:      	stlr	x0, [x26]
     bdc:      	stp	w22, w27, [sp, #0x38]
     be0:      	cbz	x0, 0xc1c <_coil.io.write-fd+0x168>
     be4:      	add	x0, sp, #0x38
     be8:      	mov	w1, #0x1                ; =1
     bec:      	mov	w2, #-0x1               ; =-1
     bf0:      	blr	x8
     bf4:      	tbz	w0, #0x1f, 0xb60 <_coil.io.write-fd+0xac>
     bf8:      	ldar	x0, [x25]
     bfc:      	cbnz	x0, 0xb50 <_coil.io.write-fd+0x9c>
     c00:      	mov	x0, #-0x2               ; =-2
     c04:      	mov	x1, x23
     c08:      	bl	0xc08 <_coil.io.write-fd+0x154>
     c0c:      	stlr	x0, [x25]
     c10:      	b	0xb50 <_coil.io.write-fd+0x9c>
     c14:      	sxtw	x9, w28
     c18:      	b	0xc20 <_coil.io.write-fd+0x16c>
     c1c:      	mov	w9, #0x23               ; =35
     c20:      	mov	w8, #0x1                ; =1
     c24:      	str	x9, [sp, #0x30]
     c28:      	str	w8, [sp, #0x20]
     c2c:      	str	w8, [sp, #0x28]
     c30:      	add	x8, sp, #0x20
     c34:      	b	0xaf8 <_coil.io.write-fd+0x44>

0000000000000c38 <_coil.panic.finish-stderr!>:
     c38:      	stp	x29, x30, [sp, #-0x10]!
     c3c:      	mov	x29, sp
     c40:      	adrp	x1, 0x0 <ltmp0>
     c44:      	add	x1, x1, #0x0
     c48:      	mov	w0, #0x2                ; =2
     c4c:      	mov	w2, #0x1                ; =1
     c50:      	bl	0xc50 <_coil.panic.finish-stderr!+0x18>
     c54:      	adrp	x1, 0x0 <ltmp0>
     c58:      	add	x1, x1, #0x0
     c5c:      	mov	w0, #0x2                ; =2
     c60:      	mov	w2, #0x5                ; =5
     c64:      	bl	0xc64 <_coil.panic.finish-stderr!+0x2c>
     c68:      	adrp	x1, 0x0 <ltmp0>
     c6c:      	add	x1, x1, #0x0
     c70:      	mov	w0, #0x2                ; =2
     c74:      	mov	w2, #0x19               ; =25
     c78:      	bl	0xc78 <_coil.panic.finish-stderr!+0x40>
     c7c:      	adrp	x1, 0x0 <ltmp0>
     c80:      	add	x1, x1, #0x0
     c84:      	mov	w0, #0x2                ; =2
     c88:      	mov	w2, #0x1                ; =1
     c8c:      	bl	0xc8c <_coil.panic.finish-stderr!+0x54>
     c90:      	bl	0xc90 <_coil.panic.finish-stderr!+0x58>
     c94:      	bl	0xc94 <_coil.panic.finish-stderr!+0x5c>

0000000000000c98 <_coil.panic.put!>:
     c98:      	mov	x2, x1
     c9c:      	mov	x1, x0
     ca0:      	mov	w0, #0x2                ; =2
     ca4:      	b	0xca4 <_coil.panic.put!+0xc>

0000000000000ca8 <_coil.panic.put-trace!>:
     ca8:      	stp	x20, x19, [sp, #-0x20]!
     cac:      	stp	x29, x30, [sp, #0x10]
     cb0:      	add	x29, sp, #0x10
     cb4:      	sub	sp, sp, #0x200
     cb8:      	mov	x0, sp
     cbc:      	mov	w1, #0x40               ; =64
     cc0:      	bl	0xcc0 <_coil.panic.put-trace!+0x18>
     cc4:      	cmp	w0, #0x1
     cc8:      	b.lt	0xcf4 <_coil.panic.put-trace!+0x4c>
     ccc:      	mov	w19, w0
     cd0:      	adrp	x1, 0x0 <ltmp0>
     cd4:      	add	x1, x1, #0x0
     cd8:      	mov	w0, #0x2                ; =2
     cdc:      	mov	w2, #0xd                ; =13
     ce0:      	bl	0xce0 <_coil.panic.put-trace!+0x38>
     ce4:      	mov	x0, sp
     ce8:      	mov	w1, w19
     cec:      	mov	w2, #0x2                ; =2
     cf0:      	bl	0xcf0 <_coil.panic.put-trace!+0x48>
     cf4:      	add	sp, sp, #0x200
     cf8:      	ldp	x29, x30, [sp, #0x10]
     cfc:      	ldp	x20, x19, [sp], #0x20
     d00:      	ret

0000000000000d04 <_gap_avec_get>:
     d04:      	stp	x29, x30, [sp, #-0x10]!
     d08:      	mov	x29, sp
     d0c:      	ldr	x8, [x0, #0x10]
     d10:      	tbnz	x1, #0x3f, 0xd88 <_gap_avec_get+0x84>
     d14:      	cmp	x1, x8
     d18:      	b.ge	0xd88 <_gap_avec_get+0x84>
     d1c:      	sub	x9, x8, #0x1
     d20:      	cmp	x8, #0x20
     d24:      	and	x9, x9, #0xffffffffffffffe0
     d28:      	csel	x8, xzr, x9, lt
     d2c:      	cmp	x1, x8
     d30:      	b.ge	0xd60 <_gap_avec_get+0x5c>
     d34:      	ldr	x9, [x0, #0x18]
     d38:      	ldr	x8, [x0]
     d3c:      	cmp	x9, #0x1
     d40:      	b.lt	0xd64 <_gap_avec_get+0x60>
     d44:      	lsr	x10, x1, x9
     d48:      	ldr	x8, [x8, #0x20]
     d4c:      	subs	x9, x9, #0x5
     d50:      	and	x10, x10, #0x1f
     d54:      	ldr	x8, [x8, x10, lsl #3]
     d58:      	b.hi	0xd44 <_gap_avec_get+0x40>
     d5c:      	b	0xd64 <_gap_avec_get+0x60>
     d60:      	ldr	x8, [x0, #0x8]
     d64:      	ldr	x8, [x8, #0x18]
     d68:      	and	x9, x1, #0x1f
     d6c:      	add	x8, x8, x9, lsl #4
     d70:      	ldpsw	x9, x10, [x8, #0x4]
     d74:      	ldrsw	x8, [x8, #0xc]
     d78:      	add	x9, x10, x9
     d7c:      	add	x0, x9, x8
     d80:      	ldp	x29, x30, [sp], #0x10
     d84:      	ret
     d88:      	mov	x0, x1
     d8c:      	mov	x1, x8
     d90:      	bl	0xd90 <_gap_avec_get+0x8c>
