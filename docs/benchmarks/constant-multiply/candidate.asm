
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/wide-record-promotion/build/wide-record-scan/candidate.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_wide_record_scan>:
       0:      	mov	x3, x2
       4:      	movn	x2, #0x0, lsl #48
       8:      	b	0x48 <_gap_wide_record_scan+0x48>
       c:      	nop
      10:      	lsl	x4, x2, #5
      14:      	add	x4, x3, x3, lsl #5
      18:      	lsr	x3, x3, #7
      1c:      	ldr	x5, [x0]
      20:      	add	x5, x5, x2, lsl #5
      24:      	ldr	x6, [x5]
      28:      	ldr	x7, [x5, #0x8]
      2c:      	ldr	x5, [x5, #0x10]
      30:      	lsr	w7, w7, #0
      34:      	sxtw	x7, w7
      38:      	add	x6, x7, x6, asr #32
      3c:      	add	x5, x5, x6
      40:      	add	x4, x4, x5
      44:      	eor	x3, x3, x4
      48:      	add	x2, x2, #0x1
      4c:      	cmp	x2, x1
      50:      	b.lt	0x10 <_gap_wide_record_scan+0x10>
      54:      	mov	x0, x3
      58:      	ret
