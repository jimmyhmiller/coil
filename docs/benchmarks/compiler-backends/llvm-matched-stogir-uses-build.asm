
build/bin/coil-normal-llvm-s3:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001002c9d70 <_stogir.uses.build>:
1002c9d70:     	sub	sp, sp, #0x150
1002c9d74:     	stp	x28, x27, [sp, #0xf0]
1002c9d78:     	stp	x26, x25, [sp, #0x100]
1002c9d7c:     	stp	x24, x23, [sp, #0x110]
1002c9d80:     	stp	x22, x21, [sp, #0x120]
1002c9d84:     	stp	x20, x19, [sp, #0x130]
1002c9d88:     	stp	x29, x30, [sp, #0x140]
1002c9d8c:     	add	x29, sp, #0x140
1002c9d90:     	ldr	q0, [x2]
1002c9d94:     	add	x8, sp, #0x90
1002c9d98:     	str	xzr, [sp, #0xa0]
1002c9d9c:     	stp	xzr, xzr, [sp, #0x90]
1002c9da0:     	mov	x20, x1
1002c9da4:     	stur	q0, [x8, #0x18]
1002c9da8:     	ldr	q1, [sp, #0x90]
1002c9dac:     	stur	q0, [x8, #0x40]
1002c9db0:     	ldr	q2, [x8, #0x10]
1002c9db4:     	ldr	x9, [sp, #0xb0]
1002c9db8:     	stp	xzr, xzr, [x29, #-0x80]
1002c9dbc:     	ldur	x8, [x29, #-0x68]
1002c9dc0:     	ldur	q0, [x29, #-0x78]
1002c9dc4:     	stur	xzr, [x29, #-0x88]
1002c9dc8:     	str	x8, [sp, #0x88]
1002c9dcc:     	ldr	x8, [x1, #0x8]
1002c9dd0:     	stp	q1, q2, [sp, #0x40]
1002c9dd4:     	ldur	q1, [x29, #-0x88]
1002c9dd8:     	stur	q0, [sp, #0x78]
1002c9ddc:     	ldr	q0, [x2]
1002c9de0:     	cmp	x8, #0x1
1002c9de4:     	str	x0, [sp, #0x8]
1002c9de8:     	str	x9, [sp, #0x60]
1002c9dec:     	stur	q1, [sp, #0x68]
1002c9df0:     	stp	xzr, xzr, [sp, #0x18]
1002c9df4:     	str	xzr, [sp, #0x28]
1002c9df8:     	stur	q0, [sp, #0x30]
1002c9dfc:     	b.lt	0x1002c9e30 <_stogir.uses.build+0xc0>
1002c9e00:     	mov	x19, xzr
1002c9e04:     	add	x0, sp, #0x40
1002c9e08:     	mov	x1, xzr
1002c9e0c:     	mov	x2, xzr
1002c9e10:     	bl	0x100010ad4 <_coil.core.Push$coil.arraylist.ArrayList$push!__stogir.uses.Range>
1002c9e14:     	add	x0, sp, #0x18
1002c9e18:     	mov	x1, xzr
1002c9e1c:     	bl	0x10000d4ec <_coil.core.Push$coil.arraylist.ArrayList$push!__i64>
1002c9e20:     	ldr	x8, [x20, #0x8]
1002c9e24:     	add	x19, x19, #0x1
1002c9e28:     	cmp	x19, x8
1002c9e2c:     	b.lt	0x1002c9e04 <_stogir.uses.build+0x94>
1002c9e30:     	adrp	x23, 0x10048b000 <_static.cstr.1531+0x10>
1002c9e34:     	adrp	x25, 0x100582000 <_coil_def.coil.compiler.api_renames.API-RENAMES+0xb4f0>
1002c9e38:     	mov	w9, wzr
1002c9e3c:     	add	x23, x23, #0x504
1002c9e40:     	add	x25, x25, #0x310
1002c9e44:     	add	x1, sp, #0x40
1002c9e48:     	mov	w8, #0x1                ; =1
1002c9e4c:     	mov	w22, #0x82              ; =130
1002c9e50:     	mov	w24, #0x5               ; =5
1002c9e54:     	mov	w26, #0x6564            ; =25956
1002c9e58:     	mov	w27, #0x6572            ; =25970
1002c9e5c:     	mov	w28, #0x6176            ; =24950
1002c9e60:     	mov	w19, #0x7273            ; =29299
1002c9e64:     	b	0x1002c9e78 <_stogir.uses.build+0x108>
1002c9e68:     	ldr	w10, [sp, #0x14]
1002c9e6c:     	mov	w8, wzr
1002c9e70:     	mov	w9, #0x1                ; =1
1002c9e74:     	tbnz	w10, #0x0, 0x1002ca12c <_stogir.uses.build+0x3bc>
1002c9e78:     	ldr	x11, [x20, #0x8]
1002c9e7c:     	str	w9, [sp, #0x14]
1002c9e80:     	cmp	x11, #0x2
1002c9e84:     	b.lt	0x1002ca0b0 <_stogir.uses.build+0x340>
1002c9e88:     	mov	w9, #0x1                ; =1
1002c9e8c:     	b	0x1002c9eac <_stogir.uses.build+0x13c>
1002c9e90:     	ldr	x11, [x20, #0x8]
1002c9e94:     	adds	x12, x10, #0x4
1002c9e98:     	add	x10, x10, #0x7
1002c9e9c:     	csel	x10, x10, x12, mi
1002c9ea0:     	add	x9, x9, x10, asr #2
1002c9ea4:     	cmp	x9, x11
1002c9ea8:     	b.ge	0x1002ca0b0 <_stogir.uses.build+0x340>
1002c9eac:     	ldr	x10, [x20, #0x78]
1002c9eb0:     	ldrsw	x10, [x10, x9, lsl #2]
1002c9eb4:     	cmp	w10, #0x1
1002c9eb8:     	b.lt	0x1002c9e94 <_stogir.uses.build+0x124>
1002c9ebc:     	ldr	x11, [x20]
1002c9ec0:     	lsl	x12, x9, #4
1002c9ec4:     	mov	w13, w9
1002c9ec8:     	mov	w14, #0x1               ; =1
1002c9ecc:     	ldrb	w11, [x11, x12]
1002c9ed0:     	and	x12, x9, #0x7fffffff
1002c9ed4:     	b	0x1002c9f04 <_stogir.uses.build+0x194>
1002c9ed8:     	ldr	x16, [sp, #0x18]
1002c9edc:     	ldr	x17, [sp, #0x68]
1002c9ee0:     	orr	x0, x13, x14, lsl #32
1002c9ee4:     	ldr	x16, [x16, x15, lsl #3]
1002c9ee8:     	str	x0, [x17, x16, lsl #3]
1002c9eec:     	add	x16, x16, #0x1
1002c9ef0:     	ldr	x17, [sp, #0x18]
1002c9ef4:     	str	x16, [x17, x15, lsl #3]
1002c9ef8:     	add	w14, w14, #0x1
1002c9efc:     	cmp	w14, w10
1002c9f00:     	b.gt	0x1002c9e90 <_stogir.uses.build+0x120>
1002c9f04:     	cmp	w14, #0x1
1002c9f08:     	ccmp	x11, x22, #0x2, ge
1002c9f0c:     	b.hi	0x1002c9f40 <_stogir.uses.build+0x1d0>
1002c9f10:     	cmp	w14, #0x5
1002c9f14:     	ldr	w16, [x23, x11, lsl #2]
1002c9f18:     	csel	w15, w14, w24, lo
1002c9f1c:     	lsl	w15, w15, #2
1002c9f20:     	sub	w15, w15, #0x4
1002c9f24:     	lsr	w15, w16, w15
1002c9f28:     	and	w15, w15, #0xf
1002c9f2c:     	add	x15, x25, x15, lsl #4
1002c9f30:     	ldr	x16, [x15, #0x8]
1002c9f34:     	cmp	x16, #0x3
1002c9f38:     	b.ne	0x1002c9ef8 <_stogir.uses.build+0x188>
1002c9f3c:     	b	0x1002c9f50 <_stogir.uses.build+0x1e0>
1002c9f40:     	add	x15, x25, xzr, lsl #4
1002c9f44:     	ldr	x16, [x15, #0x8]
1002c9f48:     	cmp	x16, #0x3
1002c9f4c:     	b.ne	0x1002c9ef8 <_stogir.uses.build+0x188>
1002c9f50:     	ldr	x15, [x15]
1002c9f54:     	ldrb	w16, [x15, #0x2]
1002c9f58:     	ldrh	w17, [x15]
1002c9f5c:     	cmp	w16, #0x66
1002c9f60:     	ccmp	w17, w26, #0x0, eq
1002c9f64:     	b.eq	0x1002c9ffc <_stogir.uses.build+0x28c>
1002c9f68:     	ldrb	w16, [x15, #0x2]
1002c9f6c:     	ldrh	w17, [x15]
1002c9f70:     	cmp	w16, #0x66
1002c9f74:     	ccmp	w17, w27, #0x0, eq
1002c9f78:     	b.eq	0x1002c9ffc <_stogir.uses.build+0x28c>
1002c9f7c:     	ldrb	w16, [x15, #0x2]
1002c9f80:     	ldrh	w17, [x15]
1002c9f84:     	cmp	w16, #0x72
1002c9f88:     	ccmp	w17, w28, #0x0, eq
1002c9f8c:     	b.eq	0x1002c9ffc <_stogir.uses.build+0x28c>
1002c9f90:     	ldrb	w16, [x15, #0x2]
1002c9f94:     	ldrh	w17, [x15]
1002c9f98:     	cmp	w16, #0x63
1002c9f9c:     	ccmp	w17, w19, #0x0, eq
1002c9fa0:     	b.eq	0x1002c9ffc <_stogir.uses.build+0x28c>
1002c9fa4:     	ldrb	w16, [x15, #0x2]
1002c9fa8:     	ldrh	w17, [x15]
1002c9fac:     	cmp	w16, #0x67
1002c9fb0:     	ccmp	w17, w27, #0x0, eq
1002c9fb4:     	b.eq	0x1002c9ffc <_stogir.uses.build+0x28c>
1002c9fb8:     	ldrb	w16, [x15, #0x2]
1002c9fbc:     	ldrh	w17, [x15]
1002c9fc0:     	cmp	w16, #0x64
1002c9fc4:     	mov	w16, #0x7267            ; =29287
1002c9fc8:     	ccmp	w17, w16, #0x0, eq
1002c9fcc:     	b.eq	0x1002c9ffc <_stogir.uses.build+0x28c>
1002c9fd0:     	ldrb	w16, [x15, #0x2]
1002c9fd4:     	ldrh	w17, [x15]
1002c9fd8:     	cmp	w16, #0x74
1002c9fdc:     	ccmp	w17, w27, #0x0, eq
1002c9fe0:     	b.eq	0x1002c9ffc <_stogir.uses.build+0x28c>
1002c9fe4:     	ldrb	w16, [x15, #0x2]
1002c9fe8:     	ldrh	w15, [x15]
1002c9fec:     	cmp	w16, #0x6c
1002c9ff0:     	mov	w16, #0x626c            ; =25196
1002c9ff4:     	ccmp	w15, w16, #0x0, eq
1002c9ff8:     	b.ne	0x1002c9ef8 <_stogir.uses.build+0x188>
1002c9ffc:     	cmp	w9, #0x1
1002ca000:     	b.lt	0x1002ca028 <_stogir.uses.build+0x2b8>
1002ca004:     	ldr	x15, [x20, #0x8]
1002ca008:     	cmp	x15, x12
1002ca00c:     	b.le	0x1002ca028 <_stogir.uses.build+0x2b8>
1002ca010:     	ldr	x15, [x20, #0x78]
1002ca014:     	ldr	w15, [x15, x12, lsl #2]
1002ca018:     	cmp	w14, w15
1002ca01c:     	ccmp	w15, #0x0, #0x8, ls
1002ca020:     	ccmp	w14, #0x1, #0x8, pl
1002ca024:     	b.ge	0x1002ca05c <_stogir.uses.build+0x2ec>
1002ca028:     	mov	x16, xzr
1002ca02c:     	cmp	w16, #0x1
1002ca030:     	b.ne	0x1002c9ef8 <_stogir.uses.build+0x188>
1002ca034:     	cmp	w15, #0x1
1002ca038:     	b.lt	0x1002c9ef8 <_stogir.uses.build+0x188>
1002ca03c:     	and	x15, x15, #0x7fffffff
1002ca040:     	tbz	w8, #0x0, 0x1002c9ed8 <_stogir.uses.build+0x168>
1002ca044:     	ldr	x16, [sp, #0x40]
1002ca048:     	add	x15, x16, x15, lsl #4
1002ca04c:     	ldr	x16, [x15, #0x8]
1002ca050:     	add	x16, x16, #0x1
1002ca054:     	str	x16, [x15, #0x8]
1002ca058:     	b	0x1002c9ef8 <_stogir.uses.build+0x188>
1002ca05c:     	add	w16, w9, w14, lsr #2
1002ca060:     	ldr	x17, [x20]
1002ca064:     	and	w15, w14, #0x3
1002ca068:     	cmp	w15, #0x1
1002ca06c:     	add	x16, x17, w16, uxtw #4
1002ca070:     	b.gt	0x1002ca090 <_stogir.uses.build+0x320>
1002ca074:     	ldr	x16, [x16]
1002ca078:     	cbz	w15, 0x1002ca09c <_stogir.uses.build+0x32c>
1002ca07c:     	lsr	x15, x16, #32
1002ca080:     	mov	w16, #0x1               ; =1
1002ca084:     	cmp	w16, #0x1
1002ca088:     	b.ne	0x1002c9ef8 <_stogir.uses.build+0x188>
1002ca08c:     	b	0x1002ca034 <_stogir.uses.build+0x2c4>
1002ca090:     	ldr	x16, [x16, #0x8]
1002ca094:     	cmp	w15, #0x2
1002ca098:     	b.ne	0x1002ca07c <_stogir.uses.build+0x30c>
1002ca09c:     	mov	w15, w16
1002ca0a0:     	mov	w16, #0x1               ; =1
1002ca0a4:     	cmp	w16, #0x1
1002ca0a8:     	b.ne	0x1002c9ef8 <_stogir.uses.build+0x188>
1002ca0ac:     	b	0x1002ca034 <_stogir.uses.build+0x2c4>
1002ca0b0:     	ldr	x9, [sp, #0x48]
1002ca0b4:     	cmp	x9, #0x0
1002ca0b8:     	cset	w9, gt
1002ca0bc:     	tst	w8, w9
1002ca0c0:     	b.eq	0x1002c9e68 <_stogir.uses.build+0xf8>
1002ca0c4:     	mov	x8, xzr
1002ca0c8:     	mov	x9, xzr
1002ca0cc:     	mov	x12, xzr
1002ca0d0:     	ldr	x11, [sp, #0x40]
1002ca0d4:     	mov	x10, x12
1002ca0d8:     	add	x11, x11, x8
1002ca0dc:     	add	x8, x8, #0x10
1002ca0e0:     	str	x12, [x11]
1002ca0e4:     	ldr	x11, [x11, #0x8]
1002ca0e8:     	ldr	x12, [sp, #0x18]
1002ca0ec:     	str	x10, [x12, x9, lsl #3]
1002ca0f0:     	add	x9, x9, #0x1
1002ca0f4:     	ldr	x12, [sp, #0x48]
1002ca0f8:     	cmp	x9, x12
1002ca0fc:     	add	x12, x11, x10
1002ca100:     	b.lt	0x1002ca0d0 <_stogir.uses.build+0x360>
1002ca104:     	cmp	x12, #0x1
1002ca108:     	b.lt	0x1002c9e68 <_stogir.uses.build+0xf8>
1002ca10c:     	add	x21, x10, x11
1002ca110:     	add	x0, x1, #0x28
1002ca114:     	mov	x1, xzr
1002ca118:     	bl	0x100010b98 <_coil.core.Push$coil.arraylist.ArrayList$push!__stogir.uses.Use>
1002ca11c:     	add	x1, sp, #0x40
1002ca120:     	subs	x21, x21, #0x1
1002ca124:     	b.ne	0x1002ca110 <_stogir.uses.build+0x3a0>
1002ca128:     	b	0x1002c9e68 <_stogir.uses.build+0xf8>
1002ca12c:     	add	x0, sp, #0x18
1002ca130:     	bl	0x10001a5f0 <_inherent$coil.arraylist.ArrayList$free!__i64>
1002ca134:     	ldp	q1, q2, [sp, #0x40]
1002ca138:     	ldr	x8, [sp, #0x8]
1002ca13c:     	ldr	q3, [sp, #0x80]
1002ca140:     	ldp	x29, x30, [sp, #0x140]
1002ca144:     	ldp	x20, x19, [sp, #0x130]
1002ca148:     	stp	q1, q2, [x8]
1002ca14c:     	ldp	q0, q1, [sp, #0x60]
1002ca150:     	ldp	x22, x21, [sp, #0x120]
1002ca154:     	ldp	x24, x23, [sp, #0x110]
1002ca158:     	str	q0, [x8, #0x20]
1002ca15c:     	ldp	x26, x25, [sp, #0x100]
1002ca160:     	stp	q1, q3, [x8, #0x30]
1002ca164:     	ldp	x28, x27, [sp, #0xf0]
1002ca168:     	add	sp, sp, #0x150
1002ca16c:     	ret
