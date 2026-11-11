
build/wide-record-scan/retirement.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_wide_record_scan>:
       0:      	mov	x3, x2
       4:      	movn	x2, #0x0, lsl #48
       8:      	b	0x44 <_gap_wide_record_scan+0x44>
       c:      	nop
      10:      	add	x4, x3, x3, lsl #5
      14:      	lsr	x3, x3, #7
      18:      	ldr	x5, [x0]
      1c:      	add	x5, x5, x2, lsl #5
      20:      	ldr	x6, [x5]
      24:      	ldr	x7, [x5, #0x8]
      28:      	ldr	x5, [x5, #0x10]
      2c:      	lsr	w7, w7, #0
      30:      	sxtw	x7, w7
      34:      	add	x6, x7, x6, asr #32
      38:      	add	x5, x5, x6
      3c:      	add	x4, x4, x5
      40:      	eor	x3, x3, x4
      44:      	add	x2, x2, #0x1
      48:      	cmp	x2, x1
      4c:      	b.lt	0x10 <_gap_wide_record_scan+0x10>
      50:      	mov	x0, x3
      54:      	ret
