
build/bin/coil-normal-stogir-s3:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010001bef0 <_coil.compiler.parser.i64->str>:
10001bef0:     	sub	sp, sp, #0xa0
10001bef4:     	str	x29, [sp, #0x10]
10001bef8:     	str	x30, [sp, #0x18]
10001befc:     	add	x29, sp, #0x10
10001bf00:     	add	x2, x29, #0x10
10001bf04:     	sub	sp, sp, #0x20
10001bf08:     	add	x3, sp, #0x10
10001bf0c:     	movz	x17, #0x0, lsl #48
10001bf10:     	cmp	x1, x17
10001bf14:     	cset	w4, lt
10001bf18:     	sub	sp, sp, #0x20
10001bf1c:     	add	x5, sp, #0x10
10001bf20:     	sub	sp, sp, #0x10
10001bf24:     	add	x6, sp, #0x10
10001bf28:     	sub	sp, sp, #0x10
10001bf2c:     	add	x7, sp, #0x10
10001bf30:     	uxtb	w16, w4
10001bf34:     	cmp	w16, wzr
10001bf38:     	b.eq	0x10001bf44 <_coil.compiler.parser.i64->str+0x54>
10001bf3c:     	movz	x16, #0x0, lsl #48
10001bf40:     	sub	x1, x16, x1
10001bf44:     	mov	x8, x1
10001bf48:     	mov	x1, #0x14               ; =20
10001bf4c:     	sub	x1, x1, #0x1
10001bf50:     	mov	x17, #0xa               ; =10
10001bf54:     	udiv	x16, x8, x17
10001bf58:     	msub	x9, x16, x17, x8
10001bf5c:     	mov	x17, #0xa               ; =10
10001bf60:     	udiv	x8, x8, x17
10001bf64:     	add	x10, x1, x3
10001bf68:     	add	x9, x9, #0x30
10001bf6c:     	uxtb	w9, w9
10001bf70:     	strb	w9, [x10]
10001bf74:     	movz	x17, #0x0, lsl #48
10001bf78:     	cmp	x8, x17
10001bf7c:     	b.ne	0x10001bf4c <_coil.compiler.parser.i64->str+0x5c>
10001bf80:     	uxtb	w16, w4
10001bf84:     	cmp	w16, wzr
10001bf88:     	b.eq	0x10001c014 <_coil.compiler.parser.i64->str+0x124>
10001bf8c:     	mov	x8, #0x1                ; =1
10001bf90:     	mov	x16, #0x14              ; =20
10001bf94:     	sub	x9, x16, x1
10001bf98:     	orr	x10, x5, xzr
10001bf9c:     	add	x9, x9, x8
10001bfa0:     	str	x2, [x29, #0x20]
10001bfa4:     	str	w4, [x29, #0x28]
10001bfa8:     	str	x6, [x29, #0x30]
10001bfac:     	str	x7, [x29, #0x38]
10001bfb0:     	str	x3, [x29, #0x40]
10001bfb4:     	str	x1, [x29, #0x48]
10001bfb8:     	str	x8, [x29, #0x50]
10001bfbc:     	str	x5, [x29, #0x58]
10001bfc0:     	str	x10, [x29, #0x60]
10001bfc4:     	str	x9, [x29, #0x68]
10001bfc8:     	mov	x8, x10
10001bfcc:     	mov	x1, x9
10001bfd0:     	mov	x2, #0x1                ; =1
10001bfd4:     	bl	0x1000714d4 <_coil.alloc.alloc-bytes>
10001bfd8:     	ldr	x0, [x29, #0x60]
10001bfdc:     	ldr	w0, [x0]
10001bfe0:     	lsr	x16, x0, #0
10001bfe4:     	cmp	x16, #0x1
10001bfe8:     	b.eq	0x10001c004 <_coil.compiler.parser.i64->str+0x114>
10001bfec:     	b.lo	0x10001bff4 <_coil.compiler.parser.i64->str+0x104>
10001bff0:     	b	0x10001c008 <_coil.compiler.parser.i64->str+0x118>
10001bff4:     	cmp	x16, #0x0
10001bff8:     	b.eq	0x10001c000 <_coil.compiler.parser.i64->str+0x110>
10001bffc:     	b	0x10001c008 <_coil.compiler.parser.i64->str+0x118>
10001c000:     	b	0x10001c154 <_coil.compiler.parser.i64->str+0x264>
10001c004:     	b	0x10001c01c <_coil.compiler.parser.i64->str+0x12c>
10001c008:     	b	0x10001c00c <_coil.compiler.parser.i64->str+0x11c>
10001c00c:     	brk	#0
10001c010:     	b	0x10001c00c <_coil.compiler.parser.i64->str+0x11c>
10001c014:     	movz	x8, #0x0, lsl #48
10001c018:     	b	0x10001bf90 <_coil.compiler.parser.i64->str+0xa0>
10001c01c:     	ldr	x0, [x29, #0x30]
10001c020:     	ldr	x1, [x29, #0x58]
10001c024:     	add	x1, x1, #0x8
10001c028:     	orr	x2, x0, xzr
10001c02c:     	ldr	x3, [x1]
10001c030:     	str	x3, [x2]
10001c034:     	ldr	x1, [x1, #0x8]
10001c038:     	str	x1, [x2, #0x8]
10001c03c:     	orr	x1, x0, xzr
10001c040:     	add	x0, x0, #0x8
10001c044:     	ldr	x1, [x1]
10001c048:     	ldr	x0, [x0]
10001c04c:     	fmov	d31, x0
10001c050:     	mov	x0, x1
10001c054:     	fmov	x1, d31
10001c058:     	bl	0x10000dfe0 <_inherent$slice$data__u8>
10001c05c:     	ldr	w1, [x29, #0x28]
10001c060:     	uxtb	w16, w1
10001c064:     	cmp	w16, wzr
10001c068:     	b.eq	0x10001c078 <_coil.compiler.parser.i64->str+0x188>
10001c06c:     	orr	x1, x0, xzr
10001c070:     	mov	w17, #0x2d              ; =45
10001c074:     	strb	w17, [x1]
10001c078:     	ldr	x1, [x29, #0x48]
10001c07c:     	mov	x16, #0x14              ; =20
10001c080:     	sub	x2, x16, x1
10001c084:     	movn	x3, #0x0, lsl #48
10001c088:     	b	0x10001c0c0 <_coil.compiler.parser.i64->str+0x1d0>
10001c08c:     	nop
10001c090:     	ldr	x4, [x29, #0x50]
10001c094:     	add	x5, x3, x4
10001c098:     	add	x6, x3, x1
10001c09c:     	lsr	x5, x5, #0
10001c0a0:     	lsr	x6, x6, #0
10001c0a4:     	add	x5, x5, x0
10001c0a8:     	ldr	x7, [x29, #0x40]
10001c0ac:     	add	x6, x6, x7
10001c0b0:     	ldrb	w6, [x6]
10001c0b4:     	strb	w6, [x5]
10001c0b8:     	str	x4, [x29, #0x50]
10001c0bc:     	str	x7, [x29, #0x40]
10001c0c0:     	add	x3, x3, #0x1
10001c0c4:     	cmp	x3, x2
10001c0c8:     	b.lt	0x10001c090 <_coil.compiler.parser.i64->str+0x1a0>
10001c0cc:     	ldr	x1, [x29, #0x38]
10001c0d0:     	sub	sp, sp, #0x10
10001c0d4:     	add	x2, sp, #0x10
10001c0d8:     	orr	x3, x1, xzr
10001c0dc:     	add	x1, x1, #0x8
10001c0e0:     	str	x2, [x29, #0x70]
10001c0e4:     	str	x3, [x29, #0x78]
10001c0e8:     	str	x1, [x29, #0x80]
10001c0ec:     	mov	x16, x2
10001c0f0:     	str	x16, [sp]
10001c0f4:     	ldr	x1, [x29, #0x68]
10001c0f8:     	bl	0x10000579c <_inherent$slice$new__u8>
10001c0fc:     	ldr	x16, [sp]
10001c100:     	str	x0, [x16]
10001c104:     	str	x1, [x16, #0x8]
10001c108:     	ldr	x0, [x29, #0x80]
10001c10c:     	ldr	x1, [x29, #0x70]
10001c110:     	ldr	x2, [x1]
10001c114:     	ldr	x1, [x1, #0x8]
10001c118:     	ldr	x3, [x29, #0x78]
10001c11c:     	str	x2, [x3]
10001c120:     	str	x1, [x0]
10001c124:     	ldr	x1, [x3]
10001c128:     	ldr	x0, [x0]
10001c12c:     	ldr	x2, [x29, #0x20]
10001c130:     	str	x1, [x2]
10001c134:     	str	x0, [x2, #0x8]
10001c138:     	ldr	x0, [x29, #0x10]
10001c13c:     	ldr	x1, [x29, #0x18]
10001c140:     	sub	sp, x29, #0x10
10001c144:     	ldr	x29, [sp, #0x10]
10001c148:     	ldr	x30, [sp, #0x18]
10001c14c:     	add	sp, sp, #0xa0
10001c150:     	ret
10001c154:     	adrp	x16, 0x100c7a000 <_write+0x100c7a000>
10001c158:     	ldr	x16, [x16, #0x3b0]
10001c15c:     	orr	x0, x16, xzr
10001c160:     	ldr	x1, [x29, #0x68]
10001c164:     	bl	0x10000df34 <_coil.alloc.oom-at>
10001c168:     	b	0x10001c168 <_coil.compiler.parser.i64->str+0x278>
