<_gap_avec_get>:
       0:      	sub	sp, sp, #0x10
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	cmp	x1, #0x0
      14:      	b.lt	0x38 <_gap_avec_get+0x38>
      18:      	ldr	x2, [x0, #0x10]
      1c:      	cmp	x1, x2
      20:      	b.ge	0x38 <_gap_avec_get+0x38>
      24:      	ldr	x2, [x0, #0x10]
      28:      	cmp	x2, #0x20
      2c:      	b.ge	0x50 <_gap_avec_get+0x50>
      30:      	movz	x2, #0x0, lsl #48
      34:      	b	0x60 <_gap_avec_get+0x60>
      38:      	ldr	x0, [x0, #0x10]
      3c:      	fmov	d31, x0
      40:      	mov	x0, x1
      44:      	fmov	x1, d31
      48:      	bl	0x48 <_gap_avec_get+0x48>
      4c:      	b	0x4c <_gap_avec_get+0x4c>
      50:      	ldr	x2, [x0, #0x10]
      54:      	sub	x2, x2, #0x1
      58:      	asr	x2, x2, #5
      5c:      	lsl	x2, x2, #5
      60:      	cmp	x1, x2
      64:      	b.lt	0x70 <_gap_avec_get+0x70>
      68:      	ldr	x0, [x0, #0x8]
      6c:      	b	0xa8 <_gap_avec_get+0xa8>
      70:      	ldr	x2, [x0]
      74:      	ldr	x0, [x0, #0x18]
      78:      	b	0x9c <_gap_avec_get+0x9c>
      7c:      	nop
      80:      	asr	x3, x1, x0
      84:      	sub	x0, x0, #0x5
      88:      	and	x3, x3, #0x1f
      8c:      	ldr	x2, [x2, #0x20]
      90:      	lsl	x3, x3, #3
      94:      	add	x2, x3, x2
      98:      	ldr	x2, [x2]
      9c:      	cmp	x0, #0x0
      a0:      	b.gt	0x80 <_gap_avec_get+0x80>
      a4:      	mov	x0, x2
      a8:      	and	x1, x1, #0x1f
      ac:      	lsl	x1, x1, #4
      b0:      	ldr	x0, [x0, #0x18]
      b4:      	add	x0, x1, x0
      b8:      	ldr	x1, [x0]
      bc:      	asr	x1, x1, #32
      c0:      	ldr	x0, [x0, #0x8]
      c4:      	lsr	w2, w0, #0
      c8:      	asr	x0, x0, #32
      cc:      	sxtw	x2, w2
      d0:      	add	x1, x2, x1
      d4:      	add	x0, x0, x1
      d8:      	ldr	x29, [sp]
      dc:      	ldr	x30, [sp, #0x8]
      e0:      	add	sp, sp, #0x10
      e4:      	ret
