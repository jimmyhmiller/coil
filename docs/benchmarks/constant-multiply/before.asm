
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/wide-record-promotion/build/wide-record-scan/before.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_wide_record_scan>:
       0:      	mov	x3, x2
       4:      	movn	x2, #0x0, lsl #48
       8:      	b	0x4c <_gap_wide_record_scan+0x4c>
       c:      	nop
      10:      	lsl	x4, x2, #5
      14:      	mov	x17, #0x21              ; =33
      18:      	mul	x4, x3, x17
      1c:      	lsr	x3, x3, #7
      20:      	ldr	x5, [x0]
      24:      	add	x5, x5, x2, lsl #5
      28:      	ldr	x6, [x5]
      2c:      	ldr	x7, [x5, #0x8]
      30:      	ldr	x5, [x5, #0x10]
      34:      	lsr	w7, w7, #0
      38:      	sxtw	x7, w7
      3c:      	add	x6, x7, x6, asr #32
      40:      	add	x5, x5, x6
      44:      	add	x4, x4, x5
      48:      	eor	x3, x3, x4
      4c:      	add	x2, x2, #0x1
      50:      	cmp	x2, x1
      54:      	b.lt	0x10 <_gap_wide_record_scan+0x10>
      58:      	mov	x0, x3
      5c:      	ret
