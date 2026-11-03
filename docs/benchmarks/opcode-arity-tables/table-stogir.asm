0000000100000afc <_stogir.opcode.input-count>:
100000afc:     	sub	sp, sp, #0x20
100000b00:     	str	x29, [sp]
100000b04:     	str	x30, [sp, #0x8]
100000b08:     	mov	x29, sp
100000b0c:     	str	x19, [sp, #0x10]
100000b10:     	lsr	w1, w0, #0
100000b14:     	mov	w19, w0
100000b18:     	mov	w0, w1
100000b1c:     	bl	0x1000013a8 <_stogir.opcode.valid?>
100000b20:     	movz	x17, #0x0, lsl #48
100000b24:     	cmp	x0, x17
100000b28:     	b.eq	0x100000b6c <_stogir.opcode.input-count+0x70>
100000b2c:     	sxtw	x0, w19
100000b30:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000b34:     	ldr	x16, [x16, #0x20]
100000b38:     	orr	x1, x16, xzr
100000b3c:     	mov	x2, x0
100000b40:     	mov	x0, x1
100000b44:     	mov	x1, #0x83               ; =131
100000b48:     	bl	0x100001400 <_coil.core.Get$slice$get__i8>
100000b4c:     	uxtb	w0, w0
100000b50:     	sxtb	w0, w0
100000b54:     	sxtw	x0, w0
100000b58:     	ldr	x19, [sp, #0x10]
100000b5c:     	ldr	x29, [sp]
100000b60:     	ldr	x30, [sp, #0x8]
100000b64:     	add	sp, sp, #0x20
100000b68:     	ret
100000b6c:     	mov	x0, #-0x2               ; =-2
100000b70:     	b	0x100000b58 <_stogir.opcode.input-count+0x5c>
