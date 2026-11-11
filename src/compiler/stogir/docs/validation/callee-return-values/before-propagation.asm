
/tmp/inspect-operand-before.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_inspect_operand>:
       0:      	sxtw	x1, w1
       4:      	cmp	x1, #0x0
       8:      	b.le	0x4c <_inspect_operand+0x4c>
       c:      	lsl	x3, x1, #2
      10:      	add	x4, x0, #0x78
      14:      	ldr	x5, [x0, #0x8]
      18:      	cmp	x1, x5
      1c:      	b.ge	0x78 <_inspect_operand+0x78>
      20:      	ldr	x4, [x4, #0x8]
      24:      	cmp	x1, x4
      28:      	b.ge	0x70 <_inspect_operand+0x70>
      2c:      	ldr	x4, [x0, #0x78]
      30:      	add	x4, x3, x4
      34:      	ldr	w4, [x4]
      38:      	sxtw	x4, w4
      3c:      	cmp	x4, #0x0
      40:      	cset	w4, ge
      44:      	ubfx	x4, x4, #0, #8
      48:      	b	0x74 <_inspect_operand+0x74>
      4c:      	movz	x1, #0x0, lsl #48
      50:      	movz	x0, #0x0, lsl #48
      54:      	fmov	d31, x0
      58:      	mov	x0, x1
      5c:      	fmov	x1, d31
      60:      	ret
      64:      	movz	x1, #0x0, lsl #48
      68:      	movz	x0, #0x0, lsl #48
      6c:      	b	0x54 <_inspect_operand+0x54>
      70:      	movz	x4, #0x0, lsl #48
      74:      	b	0x7c <_inspect_operand+0x7c>
      78:      	movz	x4, #0x0, lsl #48
      7c:      	cmp	x4, #0x0
      80:      	b.eq	0x4c <_inspect_operand+0x4c>
      84:      	sxtw	x2, w2
      88:      	cmp	x2, #0x1
      8c:      	b.lt	0x64 <_inspect_operand+0x64>
      90:      	ldr	x4, [x0, #0x78]
      94:      	add	x3, x3, x4
      98:      	ldr	w3, [x3]
      9c:      	sxtw	x3, w3
      a0:      	cmp	x2, x3
      a4:      	b.gt	0x64 <_inspect_operand+0x64>
      a8:      	ldr	x0, [x0]
      ac:      	asr	x16, x2, #63
      b0:      	lsr	x16, x16, #62
      b4:      	add	x3, x2, x16
      b8:      	asr	x3, x3, #2
      bc:      	asr	x16, x2, #63
      c0:      	lsr	x16, x16, #62
      c4:      	add	x2, x2, x16
      c8:      	and	x2, x2, #0x3
      cc:      	sub	x2, x2, x16
      d0:      	add	x1, x3, x1
      d4:      	add	x0, x0, x1, lsl #4
      d8:      	add	x0, x0, x2, lsl #2
      dc:      	ldr	w0, [x0]
      e0:      	sxtw	x0, w0
      e4:      	and	x0, x0, #0xffffffff
      e8:      	mov	x1, #0x1                ; =1
      ec:      	b	0x6c <_inspect_operand+0x6c>
