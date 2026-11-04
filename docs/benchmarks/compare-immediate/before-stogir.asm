<_gap_avec_get>:
       0:      	sub	sp, sp, #0x10
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	movz	x17, #0x0, lsl #48
      14:      	cmp	x1, x17
      18:      	b.lt	0x40 <_gap_avec_get+0x40>
      1c:      	ldr	x2, [x0, #0x10]
      20:      	cmp	x1, x2
      24:      	b.ge	0x40 <_gap_avec_get+0x40>
      28:      	ldr	x2, [x0, #0x10]
      2c:      	mov	x17, #0x20              ; =32
      30:      	cmp	x2, x17
      34:      	b.ge	0x58 <_gap_avec_get+0x58>
      38:      	movz	x2, #0x0, lsl #48
      3c:      	b	0x68 <_gap_avec_get+0x68>
      40:      	ldr	x0, [x0, #0x10]
      44:      	fmov	d31, x0
      48:      	mov	x0, x1
      4c:      	fmov	x1, d31
      50:      	bl	0x50 <_gap_avec_get+0x50>
      54:      	b	0x54 <_gap_avec_get+0x54>
      58:      	ldr	x2, [x0, #0x10]
      5c:      	sub	x2, x2, #0x1
      60:      	asr	x2, x2, #5
      64:      	lsl	x2, x2, #5
      68:      	cmp	x1, x2
      6c:      	b.lt	0x78 <_gap_avec_get+0x78>
      70:      	ldr	x0, [x0, #0x8]
      74:      	b	0xb4 <_gap_avec_get+0xb4>
      78:      	ldr	x2, [x0]
      7c:      	ldr	x0, [x0, #0x18]
      80:      	b	0xa4 <_gap_avec_get+0xa4>
      84:      	nop
      88:      	asr	x3, x1, x0
      8c:      	sub	x0, x0, #0x5
      90:      	and	x3, x3, #0x1f
      94:      	ldr	x2, [x2, #0x20]
      98:      	lsl	x3, x3, #3
      9c:      	add	x2, x3, x2
      a0:      	ldr	x2, [x2]
      a4:      	movz	x17, #0x0, lsl #48
      a8:      	cmp	x0, x17
      ac:      	b.gt	0x88 <_gap_avec_get+0x88>
      b0:      	mov	x0, x2
      b4:      	and	x1, x1, #0x1f
      b8:      	lsl	x1, x1, #4
      bc:      	ldr	x0, [x0, #0x18]
      c0:      	add	x0, x1, x0
      c4:      	ldr	x1, [x0]
      c8:      	asr	x1, x1, #32
      cc:      	ldr	x0, [x0, #0x8]
      d0:      	lsr	w2, w0, #0
      d4:      	asr	x0, x0, #32
      d8:      	sxtw	x2, w2
      dc:      	add	x1, x2, x1
      e0:      	add	x0, x0, x1
      e4:      	ldr	x29, [sp]
      e8:      	ldr	x30, [sp, #0x8]
      ec:      	add	sp, sp, #0x10
      f0:      	ret
      f4:      	udf	#0x0
