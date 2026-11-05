
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-contained-load-promotion/build/operand-contained-promotion/core-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_operand_control>:
       0:      	sub	sp, sp, #0x10
       4:      	sxtw	x1, w1
       8:      	cmp	x1, #0x0
       c:      	b.le	0x58 <_gap_operand_control+0x58>
      10:      	lsl	x3, x1, #2
      14:      	cmp	x1, #0x0
      18:      	b.le	0xc8 <_gap_operand_control+0xc8>
      1c:      	ldr	x4, [x0, #0x8]
      20:      	cmp	x1, x4
      24:      	b.ge	0x120 <_gap_operand_control+0x120>
      28:      	add	x4, x0, #0x78
      2c:      	ldr	x4, [x4, #0x8]
      30:      	cmp	x1, x4
      34:      	b.ge	0x1b4 <_gap_operand_control+0x1b4>
      38:      	ldr	x4, [x0, #0x78]
      3c:      	add	x4, x3, x4
      40:      	ldr	w4, [x4]
      44:      	sxtw	x4, w4
      48:      	cmp	x4, #0x0
      4c:      	cset	w4, ge
      50:      	ubfx	x4, x4, #0, #8
      54:      	b	0x1b8 <_gap_operand_control+0x1b8>
      58:      	movz	x0, #0x0, lsl #48
      5c:      	movz	x1, #0x0, lsl #48
      60:      	mov	x16, sp
      64:      	str	x0, [x16]
      68:      	lsr	w0, w0, #0
      6c:      	mov	x16, sp
      70:      	str	x1, [x16, #0x8]
      74:      	lsr	x16, x0, #0
      78:      	cmp	x16, #0x1
      7c:      	b.eq	0x98 <_gap_operand_control+0x98>
      80:      	b.lo	0x88 <_gap_operand_control+0x88>
      84:      	b	0x9c <_gap_operand_control+0x9c>
      88:      	cmp	x16, #0x0
      8c:      	b.eq	0x94 <_gap_operand_control+0x94>
      90:      	b	0x9c <_gap_operand_control+0x9c>
      94:      	b	0xb0 <_gap_operand_control+0xb0>
      98:      	b	0xa0 <_gap_operand_control+0xa0>
      9c:      	b	0x1c4 <_gap_operand_control+0x1c4>
      a0:      	mov	x16, sp
      a4:      	ldr	w0, [x16, #0x8]
      a8:      	sxtw	x0, w0
      ac:      	b	0xb4 <_gap_operand_control+0xb4>
      b0:      	mov	x0, #-0x8000000000000000 ; =-9223372036854775808
      b4:      	add	sp, sp, #0x10
      b8:      	ret
      bc:      	movz	x0, #0x0, lsl #48
      c0:      	movz	x1, #0x0, lsl #48
      c4:      	b	0x60 <_gap_operand_control+0x60>
      c8:      	cmp	x1, #0x0
      cc:      	b.ge	0x128 <_gap_operand_control+0x128>
      d0:      	add	x4, x0, #0x28
      d4:      	add	x5, x0, #0x50
      d8:      	ldr	x4, [x4, #0x8]
      dc:      	ldr	x5, [x5, #0x8]
      e0:      	cmp	x4, x5
      e4:      	b.ne	0x1ac <_gap_operand_control+0x1ac>
      e8:      	movz	x16, #0x0, lsl #48
      ec:      	sub	x5, x16, x1
      f0:      	cmp	x5, x4
      f4:      	b.gt	0x1bc <_gap_operand_control+0x1bc>
      f8:      	sub	x4, x5, #0x1
      fc:      	lsl	x4, x4, #2
     100:      	ldr	x5, [x0, #0x50]
     104:      	add	x4, x4, x5
     108:      	ldr	w4, [x4]
     10c:      	sxtw	x4, w4
     110:      	cmp	x4, #0x0
     114:      	cset	w4, gt
     118:      	ubfx	x4, x4, #0, #8
     11c:      	b	0x1c0 <_gap_operand_control+0x1c0>
     120:      	movz	x4, #0x0, lsl #48
     124:      	b	0x12c <_gap_operand_control+0x12c>
     128:      	movz	x4, #0x0, lsl #48
     12c:      	cmp	x4, #0x0
     130:      	b.eq	0x58 <_gap_operand_control+0x58>
     134:      	sxtw	x2, w2
     138:      	cmp	x2, #0x1
     13c:      	b.lt	0xbc <_gap_operand_control+0xbc>
     140:      	ldr	x4, [x0, #0x78]
     144:      	add	x3, x3, x4
     148:      	ldr	w3, [x3]
     14c:      	sxtw	x3, w3
     150:      	cmp	x2, x3
     154:      	b.gt	0xbc <_gap_operand_control+0xbc>
     158:      	asr	x16, x2, #63
     15c:      	lsr	x16, x16, #62
     160:      	add	x3, x2, x16
     164:      	asr	x3, x3, #2
     168:      	asr	x16, x2, #63
     16c:      	lsr	x16, x16, #62
     170:      	add	x2, x2, x16
     174:      	and	x2, x2, #0x3
     178:      	sub	x2, x2, x16
     17c:      	ldr	x0, [x0]
     180:      	add	x1, x3, x1
     184:      	lsl	x2, x2, #2
     188:      	lsl	x1, x1, #4
     18c:      	add	x0, x1, x0
     190:      	add	x0, x2, x0
     194:      	ldr	w0, [x0]
     198:      	sxtw	x0, w0
     19c:      	and	x0, x0, #0xffffffff
     1a0:      	mov	x1, x0
     1a4:      	mov	x0, #0x1                ; =1
     1a8:      	b	0xc4 <_gap_operand_control+0xc4>
     1ac:      	movz	x4, #0x0, lsl #48
     1b0:      	b	0x12c <_gap_operand_control+0x12c>
     1b4:      	movz	x4, #0x0, lsl #48
     1b8:      	b	0x124 <_gap_operand_control+0x124>
     1bc:      	movz	x4, #0x0, lsl #48
     1c0:      	b	0x1b0 <_gap_operand_control+0x1b0>
     1c4:      	brk	#0
     1c8:      	b	0x1c4 <_gap_operand_control+0x1c4>

00000000000001cc <_stogir.graph.operand>:
     1cc:      	sub	sp, sp, #0x10
     1d0:      	mov	x3, sp
     1d4:      	sxtw	x1, w1
     1d8:      	cmp	x1, #0x0
     1dc:      	b.le	0x228 <_stogir.graph.operand+0x5c>
     1e0:      	lsl	x4, x1, #2
     1e4:      	cmp	x1, #0x0
     1e8:      	b.le	0x254 <_stogir.graph.operand+0x88>
     1ec:      	ldr	x5, [x0, #0x8]
     1f0:      	cmp	x1, x5
     1f4:      	b.ge	0x2ac <_stogir.graph.operand+0xe0>
     1f8:      	add	x5, x0, #0x78
     1fc:      	ldr	x5, [x5, #0x8]
     200:      	cmp	x1, x5
     204:      	b.ge	0x340 <_stogir.graph.operand+0x174>
     208:      	ldr	x5, [x0, #0x78]
     20c:      	add	x5, x4, x5
     210:      	ldr	w5, [x5]
     214:      	sxtw	x5, w5
     218:      	cmp	x5, #0x0
     21c:      	cset	w5, ge
     220:      	ubfx	x5, x5, #0, #8
     224:      	b	0x344 <_stogir.graph.operand+0x178>
     228:      	movz	x0, #0x0, lsl #48
     22c:      	movz	x1, #0x0, lsl #48
     230:      	str	x0, [x3]
     234:      	str	x1, [x3, #0x8]
     238:      	ldr	x0, [sp]
     23c:      	ldr	x1, [sp, #0x8]
     240:      	add	sp, sp, #0x10
     244:      	ret
     248:      	movz	x0, #0x0, lsl #48
     24c:      	movz	x1, #0x0, lsl #48
     250:      	b	0x230 <_stogir.graph.operand+0x64>
     254:      	cmp	x1, #0x0
     258:      	b.ge	0x2b4 <_stogir.graph.operand+0xe8>
     25c:      	add	x5, x0, #0x28
     260:      	add	x6, x0, #0x50
     264:      	ldr	x5, [x5, #0x8]
     268:      	ldr	x6, [x6, #0x8]
     26c:      	cmp	x5, x6
     270:      	b.ne	0x338 <_stogir.graph.operand+0x16c>
     274:      	movz	x16, #0x0, lsl #48
     278:      	sub	x6, x16, x1
     27c:      	cmp	x6, x5
     280:      	b.gt	0x348 <_stogir.graph.operand+0x17c>
     284:      	sub	x5, x6, #0x1
     288:      	lsl	x5, x5, #2
     28c:      	ldr	x6, [x0, #0x50]
     290:      	add	x5, x5, x6
     294:      	ldr	w5, [x5]
     298:      	sxtw	x5, w5
     29c:      	cmp	x5, #0x0
     2a0:      	cset	w5, gt
     2a4:      	ubfx	x5, x5, #0, #8
     2a8:      	b	0x34c <_stogir.graph.operand+0x180>
     2ac:      	movz	x5, #0x0, lsl #48
     2b0:      	b	0x2b8 <_stogir.graph.operand+0xec>
     2b4:      	movz	x5, #0x0, lsl #48
     2b8:      	cmp	x5, #0x0
     2bc:      	b.eq	0x228 <_stogir.graph.operand+0x5c>
     2c0:      	sxtw	x2, w2
     2c4:      	cmp	x2, #0x1
     2c8:      	b.lt	0x248 <_stogir.graph.operand+0x7c>
     2cc:      	ldr	x5, [x0, #0x78]
     2d0:      	add	x4, x4, x5
     2d4:      	ldr	w4, [x4]
     2d8:      	sxtw	x4, w4
     2dc:      	cmp	x2, x4
     2e0:      	b.gt	0x248 <_stogir.graph.operand+0x7c>
     2e4:      	asr	x16, x2, #63
     2e8:      	lsr	x16, x16, #62
     2ec:      	add	x4, x2, x16
     2f0:      	asr	x4, x4, #2
     2f4:      	asr	x16, x2, #63
     2f8:      	lsr	x16, x16, #62
     2fc:      	add	x2, x2, x16
     300:      	and	x2, x2, #0x3
     304:      	sub	x2, x2, x16
     308:      	ldr	x0, [x0]
     30c:      	add	x1, x4, x1
     310:      	lsl	x2, x2, #2
     314:      	lsl	x1, x1, #4
     318:      	add	x0, x1, x0
     31c:      	add	x0, x2, x0
     320:      	ldr	w0, [x0]
     324:      	sxtw	x0, w0
     328:      	and	x0, x0, #0xffffffff
     32c:      	mov	x1, x0
     330:      	mov	x0, #0x1                ; =1
     334:      	b	0x250 <_stogir.graph.operand+0x84>
     338:      	movz	x5, #0x0, lsl #48
     33c:      	b	0x2b8 <_stogir.graph.operand+0xec>
     340:      	movz	x5, #0x0, lsl #48
     344:      	b	0x2b0 <_stogir.graph.operand+0xe4>
     348:      	movz	x5, #0x0, lsl #48
     34c:      	b	0x33c <_stogir.graph.operand+0x170>

0000000000000350 <_stogir.graph.contains?>:
     350:      	sxtw	x1, w1
     354:      	cmp	x1, #0x0
     358:      	b.le	0x39c <_stogir.graph.contains?+0x4c>
     35c:      	ldr	x2, [x0, #0x8]
     360:      	cmp	x1, x2
     364:      	b.ge	0x3fc <_stogir.graph.contains?+0xac>
     368:      	add	x2, x0, #0x78
     36c:      	ldr	x2, [x2, #0x8]
     370:      	cmp	x1, x2
     374:      	b.ge	0x40c <_stogir.graph.contains?+0xbc>
     378:      	lsl	x1, x1, #2
     37c:      	ldr	x0, [x0, #0x78]
     380:      	add	x0, x1, x0
     384:      	ldr	w0, [x0]
     388:      	sxtw	x0, w0
     38c:      	cmp	x0, #0x0
     390:      	cset	w0, ge
     394:      	ubfx	x0, x0, #0, #8
     398:      	b	0x410 <_stogir.graph.contains?+0xc0>
     39c:      	cmp	x1, #0x0
     3a0:      	b.ge	0x404 <_stogir.graph.contains?+0xb4>
     3a4:      	add	x2, x0, #0x28
     3a8:      	add	x3, x0, #0x50
     3ac:      	ldr	x2, [x2, #0x8]
     3b0:      	ldr	x3, [x3, #0x8]
     3b4:      	cmp	x2, x3
     3b8:      	b.ne	0x41c <_stogir.graph.contains?+0xcc>
     3bc:      	movz	x16, #0x0, lsl #48
     3c0:      	sub	x3, x16, x1
     3c4:      	cmp	x3, x2
     3c8:      	b.gt	0x414 <_stogir.graph.contains?+0xc4>
     3cc:      	movz	x16, #0x0, lsl #48
     3d0:      	sub	x1, x16, x1
     3d4:      	sub	x1, x1, #0x1
     3d8:      	lsl	x1, x1, #2
     3dc:      	ldr	x0, [x0, #0x50]
     3e0:      	add	x0, x1, x0
     3e4:      	ldr	w0, [x0]
     3e8:      	sxtw	x0, w0
     3ec:      	cmp	x0, #0x0
     3f0:      	cset	w0, gt
     3f4:      	ubfx	x0, x0, #0, #8
     3f8:      	b	0x418 <_stogir.graph.contains?+0xc8>
     3fc:      	movz	x0, #0x0, lsl #48
     400:      	b	0x410 <_stogir.graph.contains?+0xc0>
     404:      	movz	x0, #0x0, lsl #48
     408:      	b	0x418 <_stogir.graph.contains?+0xc8>
     40c:      	movz	x0, #0x0, lsl #48
     410:      	b	0x418 <_stogir.graph.contains?+0xc8>
     414:      	movz	x0, #0x0, lsl #48
     418:      	ret
     41c:      	movz	x0, #0x0, lsl #48
     420:      	b	0x418 <_stogir.graph.contains?+0xc8>

0000000000000424 <_inherent$coil.arraylist.ArrayList$at__stogir.node.Node>:
     424:      	lsl	x1, x1, #4
     428:      	ldr	x0, [x0]
     42c:      	add	x0, x1, x0
     430:      	ret

0000000000000434 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node>:
     434:      	ldr	x0, [x0, #0x8]
     438:      	ret

000000000000043c <_coil.core.Len$coil.arraylist.ArrayList$len__i32>:
     43c:      	ldr	x0, [x0, #0x8]
     440:      	ret

0000000000000444 <_inherent$coil.arraylist.ArrayList$slice__stogir.node.Node>:
     444:      	sub	sp, sp, #0x10
     448:      	mov	x1, sp
     44c:      	ldr	x2, [x0]
     450:      	ldr	x0, [x0, #0x8]
     454:      	str	x2, [x1]
     458:      	str	x0, [x1, #0x8]
     45c:      	ldr	x0, [sp]
     460:      	ldr	x1, [sp, #0x8]
     464:      	add	sp, sp, #0x10
     468:      	ret

000000000000046c <_inherent$slice$at__stogir.node.Node>:
     46c:      	lsl	x1, x2, #4
     470:      	add	x0, x1, x0
     474:      	ret

0000000000000478 <_inherent$slice$new__stogir.node.Node>:
     478:      	sub	sp, sp, #0x10
     47c:      	mov	x2, sp
     480:      	str	x0, [x2]
     484:      	str	x1, [x2, #0x8]
     488:      	ldr	x0, [sp]
     48c:      	ldr	x1, [sp, #0x8]
     490:      	add	sp, sp, #0x10
     494:      	ret

0000000000000498 <_inherent$slice$data__stogir.node.Node>:
     498:      	ret

000000000000049c <_coil.slice.element-ref__stogir.node.Node>:
     49c:      	ret
