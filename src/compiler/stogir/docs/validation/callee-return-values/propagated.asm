
/tmp/inspect-operand.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_inspect_operand>:
       0:      	sxtw	x1, w1
       4:      	cmp	x1, #0x0
       8:      	b.le	0x4c <_inspect_operand+0x4c>
       c:      	lsl	x3, x1, #2
      10:      	add	x4, x0, #0x78
      14:      	ldr	x5, [x0, #0x8]
      18:      	cmp	x1, x5
      1c:      	b.ge	0x6c <_inspect_operand+0x6c>
      20:      	ldr	x4, [x4, #0x8]
      24:      	cmp	x1, x4
      28:      	b.ge	0x64 <_inspect_operand+0x64>
      2c:      	ldr	x4, [x0, #0x78]
      30:      	add	x4, x3, x4
      34:      	ldr	w4, [x4]
      38:      	sxtw	x4, w4
      3c:      	cmp	x4, #0x0
      40:      	cset	w4, ge
      44:      	ubfx	x4, x4, #0, #8
      48:      	b	0x68 <_inspect_operand+0x68>
      4c:      	movz	x0, #0x0, lsl #48
      50:      	movz	x1, #0x0, lsl #48
      54:      	ret
      58:      	movz	x0, #0x0, lsl #48
      5c:      	movz	x1, #0x0, lsl #48
      60:      	b	0x54 <_inspect_operand+0x54>
      64:      	movz	x4, #0x0, lsl #48
      68:      	b	0x70 <_inspect_operand+0x70>
      6c:      	movz	x4, #0x0, lsl #48
      70:      	cmp	x4, #0x0
      74:      	b.eq	0x4c <_inspect_operand+0x4c>
      78:      	sxtw	x2, w2
      7c:      	cmp	x2, #0x1
      80:      	b.lt	0x58 <_inspect_operand+0x58>
      84:      	ldr	x4, [x0, #0x78]
      88:      	add	x3, x3, x4
      8c:      	ldr	w3, [x3]
      90:      	sxtw	x3, w3
      94:      	cmp	x2, x3
      98:      	b.gt	0x58 <_inspect_operand+0x58>
      9c:      	ldr	x0, [x0]
      a0:      	asr	x16, x2, #63
      a4:      	lsr	x16, x16, #62
      a8:      	add	x3, x2, x16
      ac:      	asr	x3, x3, #2
      b0:      	asr	x16, x2, #63
      b4:      	lsr	x16, x16, #62
      b8:      	add	x2, x2, x16
      bc:      	and	x2, x2, #0x3
      c0:      	sub	x2, x2, x16
      c4:      	add	x1, x3, x1
      c8:      	add	x0, x0, x1, lsl #4
      cc:      	add	x0, x0, x2, lsl #2
      d0:      	ldr	w0, [x0]
      d4:      	sxtw	x0, w0
      d8:      	and	x1, x0, #0xffffffff
      dc:      	mov	x0, #0x1                ; =1
      e0:      	b	0x60 <_inspect_operand+0x60>
