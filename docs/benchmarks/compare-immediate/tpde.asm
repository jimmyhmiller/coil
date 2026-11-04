<_gap_avec_get>:
       0:      	stp	x29, x30, [sp, #-0xc0]!
       4:      	mov	x29, sp
       8:      	bl	0x8 <_gap_avec_get+0x8>
       c:      	ldr	q0, [x0]
      10:      	str	q0, [x29, #0xb0]
      14:      	ldr	q0, [x29, #0xb0]
      18:      	str	q0, [x29, #0xa0]
      1c:      	ldrsw	x0, [x29, #0xa4]
      20:      	ldrsw	x1, [x29, #0xa8]
      24:      	add	x0, x0, x1
      28:      	ldrsw	x1, [x29, #0xac]
      2c:      	add	x0, x0, x1
      30:      	ldp	x29, x30, [sp], #0xc0
      34:      	ret
