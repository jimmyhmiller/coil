
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-predicate-notifications/build/operand-predicate-notifications/notify-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_operand_control>:
       0:      	sxtw	x1, w1
       4:      	cmp	x1, #0x0
       8:      	b.le	0x4c <_gap_operand_control+0x4c>
       c:      	lsl	x3, x1, #2
      10:      	ldr	x4, [x0, #0x8]
      14:      	cmp	x1, x4
      18:      	b.ge	0xb0 <_gap_operand_control+0xb0>
      1c:      	add	x4, x0, #0x78
      20:      	ldr	x4, [x4, #0x8]
      24:      	cmp	x1, x4
      28:      	b.ge	0xa8 <_gap_operand_control+0xa8>
      2c:      	ldr	x4, [x0, #0x78]
      30:      	add	x4, x3, x4
      34:      	ldr	w4, [x4]
      38:      	sxtw	x4, w4
      3c:      	cmp	x4, #0x0
      40:      	cset	w4, ge
      44:      	ubfx	x4, x4, #0, #8
      48:      	b	0xac <_gap_operand_control+0xac>
      4c:      	movz	x0, #0x0, lsl #48
      50:      	movz	x1, #0x0, lsl #48
      54:      	lsr	w0, w0, #0
      58:      	lsr	x16, x0, #0
      5c:      	cmp	x16, #0x1
      60:      	b.eq	0x7c <_gap_operand_control+0x7c>
      64:      	b.lo	0x6c <_gap_operand_control+0x6c>
      68:      	b	0x80 <_gap_operand_control+0x80>
      6c:      	cmp	x16, #0x0
      70:      	b.eq	0x78 <_gap_operand_control+0x78>
      74:      	b	0x80 <_gap_operand_control+0x80>
      78:      	b	0x94 <_gap_operand_control+0x94>
      7c:      	b	0x84 <_gap_operand_control+0x84>
      80:      	b	0x134 <_gap_operand_control+0x134>
      84:      	lsr	w1, w1, #0
      88:      	sxtw	x1, w1
      8c:      	mov	x0, x1
      90:      	b	0x98 <_gap_operand_control+0x98>
      94:      	mov	x0, #-0x8000000000000000 ; =-9223372036854775808
      98:      	ret
      9c:      	movz	x0, #0x0, lsl #48
      a0:      	movz	x1, #0x0, lsl #48
      a4:      	b	0x54 <_gap_operand_control+0x54>
      a8:      	movz	x4, #0x0, lsl #48
      ac:      	b	0xb4 <_gap_operand_control+0xb4>
      b0:      	movz	x4, #0x0, lsl #48
      b4:      	cmp	x4, #0x0
      b8:      	b.eq	0x4c <_gap_operand_control+0x4c>
      bc:      	sxtw	x2, w2
      c0:      	cmp	x2, #0x1
      c4:      	b.lt	0x9c <_gap_operand_control+0x9c>
      c8:      	ldr	x4, [x0, #0x78]
      cc:      	add	x3, x3, x4
      d0:      	ldr	w3, [x3]
      d4:      	sxtw	x3, w3
      d8:      	cmp	x2, x3
      dc:      	b.gt	0x9c <_gap_operand_control+0x9c>
      e0:      	asr	x16, x2, #63
      e4:      	lsr	x16, x16, #62
      e8:      	add	x3, x2, x16
      ec:      	asr	x3, x3, #2
      f0:      	asr	x16, x2, #63
      f4:      	lsr	x16, x16, #62
      f8:      	add	x2, x2, x16
      fc:      	and	x2, x2, #0x3
     100:      	sub	x2, x2, x16
     104:      	ldr	x0, [x0]
     108:      	add	x1, x3, x1
     10c:      	lsl	x2, x2, #2
     110:      	lsl	x1, x1, #4
     114:      	add	x0, x1, x0
     118:      	add	x0, x2, x0
     11c:      	ldr	w0, [x0]
     120:      	sxtw	x0, w0
     124:      	and	x0, x0, #0xffffffff
     128:      	mov	x1, x0
     12c:      	mov	x0, #0x1                ; =1
     130:      	b	0xa4 <_gap_operand_control+0xa4>
     134:      	brk	#0
     138:      	b	0x134 <_gap_operand_control+0x134>

000000000000013c <_stogir.graph.operand>:
     13c:      	sub	sp, sp, #0x10
     140:      	mov	x3, sp
     144:      	sxtw	x1, w1
     148:      	cmp	x1, #0x0
     14c:      	b.le	0x190 <_stogir.graph.operand+0x54>
     150:      	lsl	x4, x1, #2
     154:      	ldr	x5, [x0, #0x8]
     158:      	cmp	x1, x5
     15c:      	b.ge	0x1c4 <_stogir.graph.operand+0x88>
     160:      	add	x5, x0, #0x78
     164:      	ldr	x5, [x5, #0x8]
     168:      	cmp	x1, x5
     16c:      	b.ge	0x1bc <_stogir.graph.operand+0x80>
     170:      	ldr	x5, [x0, #0x78]
     174:      	add	x5, x4, x5
     178:      	ldr	w5, [x5]
     17c:      	sxtw	x5, w5
     180:      	cmp	x5, #0x0
     184:      	cset	w5, ge
     188:      	ubfx	x5, x5, #0, #8
     18c:      	b	0x1c0 <_stogir.graph.operand+0x84>
     190:      	movz	x0, #0x0, lsl #48
     194:      	movz	x1, #0x0, lsl #48
     198:      	str	x0, [x3]
     19c:      	str	x1, [x3, #0x8]
     1a0:      	ldr	x0, [sp]
     1a4:      	ldr	x1, [sp, #0x8]
     1a8:      	add	sp, sp, #0x10
     1ac:      	ret
     1b0:      	movz	x0, #0x0, lsl #48
     1b4:      	movz	x1, #0x0, lsl #48
     1b8:      	b	0x198 <_stogir.graph.operand+0x5c>
     1bc:      	movz	x5, #0x0, lsl #48
     1c0:      	b	0x1c8 <_stogir.graph.operand+0x8c>
     1c4:      	movz	x5, #0x0, lsl #48
     1c8:      	cmp	x5, #0x0
     1cc:      	b.eq	0x190 <_stogir.graph.operand+0x54>
     1d0:      	sxtw	x2, w2
     1d4:      	cmp	x2, #0x1
     1d8:      	b.lt	0x1b0 <_stogir.graph.operand+0x74>
     1dc:      	ldr	x5, [x0, #0x78]
     1e0:      	add	x4, x4, x5
     1e4:      	ldr	w4, [x4]
     1e8:      	sxtw	x4, w4
     1ec:      	cmp	x2, x4
     1f0:      	b.gt	0x1b0 <_stogir.graph.operand+0x74>
     1f4:      	asr	x16, x2, #63
     1f8:      	lsr	x16, x16, #62
     1fc:      	add	x4, x2, x16
     200:      	asr	x4, x4, #2
     204:      	asr	x16, x2, #63
     208:      	lsr	x16, x16, #62
     20c:      	add	x2, x2, x16
     210:      	and	x2, x2, #0x3
     214:      	sub	x2, x2, x16
     218:      	ldr	x0, [x0]
     21c:      	add	x1, x4, x1
     220:      	lsl	x2, x2, #2
     224:      	lsl	x1, x1, #4
     228:      	add	x0, x1, x0
     22c:      	add	x0, x2, x0
     230:      	ldr	w0, [x0]
     234:      	sxtw	x0, w0
     238:      	and	x0, x0, #0xffffffff
     23c:      	mov	x1, x0
     240:      	mov	x0, #0x1                ; =1
     244:      	b	0x1b8 <_stogir.graph.operand+0x7c>

0000000000000248 <_stogir.graph.contains?>:
     248:      	sxtw	x1, w1
     24c:      	cmp	x1, #0x0
     250:      	b.le	0x294 <_stogir.graph.contains?+0x4c>
     254:      	ldr	x2, [x0, #0x8]
     258:      	cmp	x1, x2
     25c:      	b.ge	0x2f4 <_stogir.graph.contains?+0xac>
     260:      	add	x2, x0, #0x78
     264:      	ldr	x2, [x2, #0x8]
     268:      	cmp	x1, x2
     26c:      	b.ge	0x304 <_stogir.graph.contains?+0xbc>
     270:      	lsl	x1, x1, #2
     274:      	ldr	x0, [x0, #0x78]
     278:      	add	x0, x1, x0
     27c:      	ldr	w0, [x0]
     280:      	sxtw	x0, w0
     284:      	cmp	x0, #0x0
     288:      	cset	w0, ge
     28c:      	ubfx	x0, x0, #0, #8
     290:      	b	0x308 <_stogir.graph.contains?+0xc0>
     294:      	cmp	x1, #0x0
     298:      	b.ge	0x2fc <_stogir.graph.contains?+0xb4>
     29c:      	add	x2, x0, #0x28
     2a0:      	add	x3, x0, #0x50
     2a4:      	ldr	x2, [x2, #0x8]
     2a8:      	ldr	x3, [x3, #0x8]
     2ac:      	cmp	x2, x3
     2b0:      	b.ne	0x314 <_stogir.graph.contains?+0xcc>
     2b4:      	movz	x16, #0x0, lsl #48
     2b8:      	sub	x3, x16, x1
     2bc:      	cmp	x3, x2
     2c0:      	b.gt	0x30c <_stogir.graph.contains?+0xc4>
     2c4:      	movz	x16, #0x0, lsl #48
     2c8:      	sub	x1, x16, x1
     2cc:      	sub	x1, x1, #0x1
     2d0:      	lsl	x1, x1, #2
     2d4:      	ldr	x0, [x0, #0x50]
     2d8:      	add	x0, x1, x0
     2dc:      	ldr	w0, [x0]
     2e0:      	sxtw	x0, w0
     2e4:      	cmp	x0, #0x0
     2e8:      	cset	w0, gt
     2ec:      	ubfx	x0, x0, #0, #8
     2f0:      	b	0x310 <_stogir.graph.contains?+0xc8>
     2f4:      	movz	x0, #0x0, lsl #48
     2f8:      	b	0x308 <_stogir.graph.contains?+0xc0>
     2fc:      	movz	x0, #0x0, lsl #48
     300:      	b	0x310 <_stogir.graph.contains?+0xc8>
     304:      	movz	x0, #0x0, lsl #48
     308:      	b	0x310 <_stogir.graph.contains?+0xc8>
     30c:      	movz	x0, #0x0, lsl #48
     310:      	ret
     314:      	movz	x0, #0x0, lsl #48
     318:      	b	0x310 <_stogir.graph.contains?+0xc8>

000000000000031c <_inherent$coil.arraylist.ArrayList$at__stogir.node.Node>:
     31c:      	lsl	x1, x1, #4
     320:      	ldr	x0, [x0]
     324:      	add	x0, x1, x0
     328:      	ret

000000000000032c <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node>:
     32c:      	ldr	x0, [x0, #0x8]
     330:      	ret

0000000000000334 <_coil.core.Len$coil.arraylist.ArrayList$len__i32>:
     334:      	ldr	x0, [x0, #0x8]
     338:      	ret

000000000000033c <_inherent$coil.arraylist.ArrayList$slice__stogir.node.Node>:
     33c:      	sub	sp, sp, #0x10
     340:      	mov	x1, sp
     344:      	ldr	x2, [x0]
     348:      	ldr	x0, [x0, #0x8]
     34c:      	str	x2, [x1]
     350:      	str	x0, [x1, #0x8]
     354:      	ldr	x0, [sp]
     358:      	ldr	x1, [sp, #0x8]
     35c:      	add	sp, sp, #0x10
     360:      	ret

0000000000000364 <_inherent$slice$at__stogir.node.Node>:
     364:      	lsl	x1, x2, #4
     368:      	add	x0, x1, x0
     36c:      	ret

0000000000000370 <_inherent$slice$new__stogir.node.Node>:
     370:      	sub	sp, sp, #0x10
     374:      	mov	x2, sp
     378:      	str	x0, [x2]
     37c:      	str	x1, [x2, #0x8]
     380:      	ldr	x0, [sp]
     384:      	ldr	x1, [sp, #0x8]
     388:      	add	sp, sp, #0x10
     38c:      	ret

0000000000000390 <_inherent$slice$data__stogir.node.Node>:
     390:      	ret

0000000000000394 <_coil.slice.element-ref__stogir.node.Node>:
     394:      	ret
