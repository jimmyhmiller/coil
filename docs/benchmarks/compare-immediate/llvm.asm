<_gap_avec_get>:
     d04:      	stp	x29, x30, [sp, #-0x10]!
     d08:      	mov	x29, sp
     d0c:      	ldr	x8, [x0, #0x10]
     d10:      	tbnz	x1, #0x3f, 0xd88 <_gap_avec_get+0x84>
     d14:      	cmp	x1, x8
     d18:      	b.ge	0xd88 <_gap_avec_get+0x84>
     d1c:      	sub	x9, x8, #0x1
     d20:      	cmp	x8, #0x20
     d24:      	and	x9, x9, #0xffffffffffffffe0
     d28:      	csel	x8, xzr, x9, lt
     d2c:      	cmp	x1, x8
     d30:      	b.ge	0xd60 <_gap_avec_get+0x5c>
     d34:      	ldr	x9, [x0, #0x18]
     d38:      	ldr	x8, [x0]
     d3c:      	cmp	x9, #0x1
     d40:      	b.lt	0xd64 <_gap_avec_get+0x60>
     d44:      	lsr	x10, x1, x9
     d48:      	ldr	x8, [x8, #0x20]
     d4c:      	subs	x9, x9, #0x5
     d50:      	and	x10, x10, #0x1f
     d54:      	ldr	x8, [x8, x10, lsl #3]
     d58:      	b.hi	0xd44 <_gap_avec_get+0x40>
     d5c:      	b	0xd64 <_gap_avec_get+0x60>
     d60:      	ldr	x8, [x0, #0x8]
     d64:      	ldr	x8, [x8, #0x18]
     d68:      	and	x9, x1, #0x1f
     d6c:      	add	x8, x8, x9, lsl #4
     d70:      	ldpsw	x9, x10, [x8, #0x4]
     d74:      	ldrsw	x8, [x8, #0xc]
     d78:      	add	x9, x10, x9
     d7c:      	add	x0, x9, x8
     d80:      	ldp	x29, x30, [sp], #0x10
     d84:      	ret
     d88:      	mov	x0, x1
     d8c:      	mov	x1, x8
     d90:      	bl	0xd90 <_gap_avec_get+0x8c>
