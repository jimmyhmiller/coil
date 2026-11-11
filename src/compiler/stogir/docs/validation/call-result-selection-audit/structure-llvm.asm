
build/return-allocation-bootstrap/llvm-0.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000496d40 <_stogir.verify.structure>:
  496d40:      	sub	sp, sp, #0x70
  496d44:      	ldr	x8, [x1, #0x8]
  496d48:      	ldr	x9, [x1, #0x80]
  496d4c:      	stp	x28, x27, [sp, #0x10]
  496d50:      	stp	x26, x25, [sp, #0x20]
  496d54:      	cmp	x8, x9
  496d58:      	stp	x24, x23, [sp, #0x30]
  496d5c:      	stp	x22, x21, [sp, #0x40]
  496d60:      	stp	x20, x19, [sp, #0x50]
  496d64:      	stp	x29, x30, [sp, #0x60]
  496d68:      	b.ne	0x4971cc <_stogir.verify.structure+0x48c>
  496d6c:      	mov	w9, wzr
  496d70:      	adrp	x19, 0x496000 <_stogir.verify.integer-operations-target-structured+0xe34>
		0000000000496d70:  ARM64_RELOC_PAGE21	l_str.21340
  496d74:      	add	x19, x19, #0x0
		0000000000496d74:  ARM64_RELOC_PAGEOFF12	l_str.21340
  496d78:      	mov	w16, #0x1               ; =1
  496d7c:      	adrp	x6, 0x496000 <_stogir.verify.integer-operations-target-structured+0xe34>
		0000000000496d7c:  ARM64_RELOC_PAGE21	l_str.21349
  496d80:      	add	x6, x6, #0x0
		0000000000496d80:  ARM64_RELOC_PAGEOFF12	l_str.21349
  496d84:      	adrp	x20, 0x496000 <_stogir.verify.integer-operations-target-structured+0xe34>
		0000000000496d84:  ARM64_RELOC_PAGE21	l_str.21353
  496d88:      	add	x20, x20, #0x0
		0000000000496d88:  ARM64_RELOC_PAGEOFF12	l_str.21353
  496d8c:      	mov	w24, #0x5e1c            ; =24092
  496d90:      	adrp	x26, 0x496000 <_stogir.verify.integer-operations-target-structured+0xe34>
		0000000000496d90:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
  496d94:      	add	x26, x26, #0x0
		0000000000496d94:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
  496d98:      	mov	w27, #0x5               ; =5
  496d9c:      	mov	w22, #0x818             ; =2072
  496da0:      	mov	w30, #0x1               ; =1
  496da4:      	b	0x496dbc <_stogir.verify.structure+0x7c>
  496da8:      	add	w9, w9, #0x1
  496dac:      	mov	x30, x10
  496db0:      	mov	x3, x17
  496db4:      	mov	x4, x19
  496db8:      	cbnz	x17, 0x497234 <_stogir.verify.structure+0x4f4>
  496dbc:      	cmp	x30, x8
  496dc0:      	b.ge	0x49720c <_stogir.verify.structure+0x4cc>
  496dc4:      	ldr	x11, [x1, #0x78]
  496dc8:      	ldr	w13, [x11, x30, lsl #2]
  496dcc:      	lsr	w10, w13, #16
  496dd0:      	cbnz	w10, 0x497218 <_stogir.verify.structure+0x4d8>
  496dd4:      	ldr	x5, [x1]
  496dd8:      	lsl	x10, x30, #4
  496ddc:      	ldr	x10, [x5, x10]
  496de0:      	and	w14, w10, #0xff
  496de4:      	cmp	w14, #0x82
  496de8:      	b.hi	0x4971fc <_stogir.verify.structure+0x4bc>
  496dec:      	ubfx	w15, w10, #8, #8
  496df0:      	cmp	w15, #0xe
  496df4:      	b.lo	0x496e20 <_stogir.verify.structure+0xe0>
  496df8:      	sub	w12, w15, #0x80
  496dfc:      	cmn	w12, #0x70
  496e00:      	b.lo	0x4971fc <_stogir.verify.structure+0x4bc>
  496e04:      	ubfx	w12, w10, #8, #4
  496e08:      	mov	w3, #0x16               ; =22
  496e0c:      	adrp	x4, 0x496000 <_stogir.verify.integer-operations-target-structured+0xe34>
		0000000000496e0c:  ARM64_RELOC_PAGE21	l_str.21344
  496e10:      	add	x4, x4, #0x0
		0000000000496e10:  ARM64_RELOC_PAGEOFF12	l_str.21344
  496e14:      	sub	w12, w12, #0xe
  496e18:      	cmn	w12, #0xd
  496e1c:      	b.lo	0x497234 <_stogir.verify.structure+0x4f4>
  496e20:      	and	x7, x10, #0xff
  496e24:      	adrp	x12, 0x496000 <_stogir.verify.integer-operations-target-structured+0xe34>
		0000000000496e24:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-SLOTS
  496e28:      	add	x12, x12, #0x0
		0000000000496e28:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-SLOTS
  496e2c:      	ldrsb	w12, [x12, x7]
  496e30:      	tbnz	w12, #0x1f, 0x496e3c <_stogir.verify.structure+0xfc>
  496e34:      	cmp	w13, w12
  496e38:      	b.ne	0x497228 <_stogir.verify.structure+0x4e8>
  496e3c:      	adrp	x12, 0x496000 <_stogir.verify.integer-operations-target-structured+0xe34>
		0000000000496e3c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.INPUT-COUNTS
  496e40:      	add	x12, x12, #0x0
		0000000000496e40:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.INPUT-COUNTS
  496e44:      	add	x17, x13, #0x4
  496e48:      	ldrb	w12, [x12, x7]
  496e4c:      	lsr	w10, w10, #16
  496e50:      	lsr	x2, x17, #2
  496e54:      	adrp	x17, 0x496000 <_stogir.verify.integer-operations-target-structured+0xe34>
		0000000000496e54:  ARM64_RELOC_PAGE21	l_str.21346
  496e58:      	add	x17, x17, #0x0
		0000000000496e58:  ARM64_RELOC_PAGEOFF12	l_str.21346
  496e5c:      	cmp	w12, #0xff
  496e60:      	mov	w12, #0x24              ; =36
  496e64:      	ccmp	w13, w10, #0x4, eq
  496e68:      	add	x10, x30, x2
  496e6c:      	csel	x12, x12, xzr, ne
  496e70:      	csel	x3, x17, x19, ne
  496e74:      	cmp	x10, x8
  496e78:      	mov	w17, #0x15              ; =21
  496e7c:      	csel	x17, x17, x12, gt
  496e80:      	adrp	x12, 0x496000 <_stogir.verify.integer-operations-target-structured+0xe34>
		0000000000496e80:  ARM64_RELOC_PAGE21	l_str.21347
  496e84:      	add	x12, x12, #0x0
		0000000000496e84:  ARM64_RELOC_PAGEOFF12	l_str.21347
  496e88:      	csel	x19, x12, x3, gt
  496e8c:      	cbnz	x17, 0x496ecc <_stogir.verify.structure+0x18c>
  496e90:      	cmp	w13, #0x4
  496e94:      	b.lo	0x496ecc <_stogir.verify.structure+0x18c>
  496e98:      	add	x12, x11, x30, lsl #2
  496e9c:      	mov	w3, #0x2                ; =2
  496ea0:      	add	x17, x12, #0x4
  496ea4:      	ldr	w4, [x17], #0x4
  496ea8:      	cmn	w4, #0x1
  496eac:      	csel	x19, x19, x6, eq
  496eb0:      	b.ne	0x496ec0 <_stogir.verify.structure+0x180>
  496eb4:      	cmp	x3, x2
  496eb8:      	add	x3, x3, #0x1
  496ebc:      	b.lo	0x496ea4 <_stogir.verify.structure+0x164>
  496ec0:      	cmn	w4, #0x1
  496ec4:      	mov	w12, #0x1b              ; =27
  496ec8:      	csel	x17, xzr, x12, eq
  496ecc:      	cbnz	x17, 0x496da8 <_stogir.verify.structure+0x68>
  496ed0:      	cbz	w13, 0x496da8 <_stogir.verify.structure+0x68>
  496ed4:      	cmp	w14, #0x78
  496ed8:      	and	x21, x30, #0x7fffffff
  496edc:      	mov	w25, #0x2               ; =2
  496ee0:      	ccmp	w15, #0x0, #0x0, eq
  496ee4:      	cset	w12, ne
  496ee8:      	cmp	w30, #0x1
  496eec:      	ccmp	x8, x21, #0x4, ge
  496ef0:      	str	w12, [sp, #0xc]
  496ef4:      	cset	w23, le
  496ef8:      	sub	w15, w25, #0x1
  496efc:      	cmp	w15, #0x1
  496f00:      	b.lt	0x496f28 <_stogir.verify.structure+0x1e8>
  496f04:      	cmp	w15, #0x5
  496f08:      	ldr	w14, [x26, x7, lsl #2]
  496f0c:      	csel	w12, w15, w27, lo
  496f10:      	lsl	w12, w12, #2
  496f14:      	sub	w12, w12, #0x4
  496f18:      	lsr	w12, w14, w12
  496f1c:      	and	w3, w12, #0xf
  496f20:      	tbz	w23, #0x0, 0x496f30 <_stogir.verify.structure+0x1f0>
  496f24:      	b	0x496f44 <_stogir.verify.structure+0x204>
  496f28:      	mov	w3, wzr
  496f2c:      	tbnz	w23, #0x0, 0x496f44 <_stogir.verify.structure+0x204>
  496f30:      	ldr	w12, [x11, x21, lsl #2]
  496f34:      	cmp	w15, w12
  496f38:      	ccmp	w15, #0x1, #0x8, ls
  496f3c:      	ccmp	w12, #0x0, #0x8, ge
  496f40:      	b.pl	0x496f50 <_stogir.verify.structure+0x210>
  496f44:      	mov	x14, xzr
  496f48:      	cbnz	w14, 0x496f68 <_stogir.verify.structure+0x228>
  496f4c:      	b	0x4971dc <_stogir.verify.structure+0x49c>
  496f50:      	add	w12, w30, w15, lsr #2
  496f54:      	and	w14, w15, #0x3
  496f58:      	add	x12, x5, w12, uxtw #4
  496f5c:      	ldr	w2, [x12, w14, uxtw #2]
  496f60:      	mov	w14, #0x1               ; =1
  496f64:      	cbz	w14, 0x4971dc <_stogir.verify.structure+0x49c>
  496f68:      	cmp	w3, #0x2
  496f6c:      	b.eq	0x496f78 <_stogir.verify.structure+0x238>
  496f70:      	cmp	w3, #0x9
  496f74:      	b.ne	0x496fcc <_stogir.verify.structure+0x28c>
  496f78:      	cmp	w2, #0x1
  496f7c:      	b.lt	0x496fe4 <_stogir.verify.structure+0x2a4>
  496f80:      	and	x14, x2, #0x7fffffff
  496f84:      	cmp	x8, x14
  496f88:      	b.le	0x497040 <_stogir.verify.structure+0x300>
  496f8c:      	ldr	w12, [x11, x14, lsl #2]
  496f90:      	tbnz	w12, #0x1f, 0x497040 <_stogir.verify.structure+0x300>
  496f94:      	add	x14, x5, x14, lsl #4
  496f98:      	cbz	x14, 0x497040 <_stogir.verify.structure+0x300>
  496f9c:      	ldrb	w12, [x14]
  496fa0:      	mov	w14, #0x1               ; =1
  496fa4:      	mov	w4, #0x1                ; =1
  496fa8:      	cmp	w12, #0x48
  496fac:      	mov	w12, #0x25              ; =37
  496fb0:      	csel	x17, x12, xzr, eq
  496fb4:      	adrp	x12, 0x496000 <_stogir.verify.integer-operations-target-structured+0xe34>
		0000000000496fb4:  ARM64_RELOC_PAGE21	l_str.21352
  496fb8:      	add	x12, x12, #0x0
		0000000000496fb8:  ARM64_RELOC_PAGEOFF12	l_str.21352
  496fbc:      	csel	x19, x12, x19, eq
  496fc0:      	cmp	w3, #0x8
  496fc4:      	b.eq	0x497054 <_stogir.verify.structure+0x314>
  496fc8:      	b	0x497074 <_stogir.verify.structure+0x334>
  496fcc:      	mov	w14, wzr
  496fd0:      	mov	w4, wzr
  496fd4:      	mov	x17, xzr
  496fd8:      	cmp	w3, #0x8
  496fdc:      	b.eq	0x497054 <_stogir.verify.structure+0x314>
  496fe0:      	b	0x497074 <_stogir.verify.structure+0x334>
  496fe4:      	tbnz	w2, #0x1f, 0x496ffc <_stogir.verify.structure+0x2bc>
  496fe8:      	cmp	w3, #0x8
  496fec:      	b.ne	0x497124 <_stogir.verify.structure+0x3e4>
  496ff0:      	mov	w4, wzr
  496ff4:      	mov	w14, #0x1               ; =1
  496ff8:      	b	0x49706c <_stogir.verify.structure+0x32c>
  496ffc:      	ldr	x14, [x1, #0x30]
  497000:      	ldr	x12, [x1, #0x58]
  497004:      	cmp	x14, x12
  497008:      	b.ne	0x497040 <_stogir.verify.structure+0x300>
  49700c:      	sxtw	x17, w2
  497010:      	cmn	x14, x17
  497014:      	b.lt	0x497040 <_stogir.verify.structure+0x300>
  497018:      	ldr	x12, [x1, #0x50]
  49701c:      	mvn	x14, x17
  497020:      	ldr	w12, [x12, x14, lsl #2]
  497024:      	cmp	w12, #0x0
  497028:      	b.le	0x497040 <_stogir.verify.structure+0x300>
  49702c:      	ldr	x12, [x1, #0x28]
  497030:      	mvn	w14, w2
  497034:      	and	x14, x14, #0x7fffffff
  497038:      	add	x14, x12, x14, lsl #4
  49703c:      	cbnz	x14, 0x496f9c <_stogir.verify.structure+0x25c>
  497040:      	mov	w4, wzr
  497044:      	mov	x17, xzr
  497048:      	mov	w14, #0x1               ; =1
  49704c:      	cmp	w3, #0x8
  497050:      	b.ne	0x497074 <_stogir.verify.structure+0x334>
  497054:      	cmp	w2, #0x1
  497058:      	b.lt	0x49706c <_stogir.verify.structure+0x32c>
  49705c:      	ldr	x28, [x1, #0x140]
  497060:      	and	x12, x2, #0x7fffffff
  497064:      	cmp	x28, x12
  497068:      	b.ge	0x4970b4 <_stogir.verify.structure+0x374>
  49706c:      	mov	w17, #0x21              ; =33
  497070:      	mov	x19, x20
  497074:      	cmp	w3, #0xf
  497078:      	b.eq	0x4971b8 <_stogir.verify.structure+0x478>
  49707c:      	lsl	w12, w16, w3
  497080:      	and	w12, w12, w24
  497084:      	cbz	w12, 0x4971b8 <_stogir.verify.structure+0x478>
  497088:      	tbz	w14, #0x0, 0x497094 <_stogir.verify.structure+0x354>
  49708c:      	tbz	w4, #0x0, 0x497130 <_stogir.verify.structure+0x3f0>
  497090:      	b	0x4971b8 <_stogir.verify.structure+0x478>
  497094:      	cmp	w2, #0x1
  497098:      	b.lt	0x497114 <_stogir.verify.structure+0x3d4>
  49709c:      	and	x12, x2, #0x7fffffff
  4970a0:      	cmp	x8, x12
  4970a4:      	b.le	0x4971ec <_stogir.verify.structure+0x4ac>
  4970a8:      	ldr	w12, [x11, x12, lsl #2]
  4970ac:      	tbz	w12, #0x1f, 0x4971b8 <_stogir.verify.structure+0x478>
  4970b0:      	b	0x4971ec <_stogir.verify.structure+0x4ac>
  4970b4:      	mov	w16, #0x18              ; =24
  4970b8:      	ldr	x28, [x1, #0x138]
  4970bc:      	umaddl	x12, w12, w16, x28
  4970c0:      	mov	x16, x20
  4970c4:      	ldr	x20, [x1, #0x118]
  4970c8:      	ldp	x28, x12, [x12, #-0x18]
  4970cc:      	cmp	x28, #0x0
  4970d0:      	cset	w22, mi
  4970d4:      	subs	x20, x20, x28
  4970d8:      	csinc	w22, w22, wzr, ge
  4970dc:      	cmp	x12, #0x0
  4970e0:      	csinc	w22, w22, wzr, pl
  4970e4:      	cmp	x12, x20
  4970e8:      	mov	x20, x16
  4970ec:      	csinc	w12, w22, wzr, le
  4970f0:      	mov	w16, #0x1               ; =1
  4970f4:      	mov	w22, #0x818             ; =2072
  4970f8:      	cmp	w12, #0x0
  4970fc:      	mov	w12, #0x21              ; =33
  497100:      	csel	x17, x12, x17, ne
  497104:      	csel	x19, x20, x19, ne
  497108:      	cmp	w3, #0xf
  49710c:      	b.ne	0x49707c <_stogir.verify.structure+0x33c>
  497110:      	b	0x4971b8 <_stogir.verify.structure+0x478>
  497114:      	tbnz	w2, #0x1f, 0x497188 <_stogir.verify.structure+0x448>
  497118:      	cmp	w15, #0x1
  49711c:      	b.ge	0x497148 <_stogir.verify.structure+0x408>
  497120:      	b	0x4971ec <_stogir.verify.structure+0x4ac>
  497124:      	lsr	w12, w24, w3
  497128:      	mov	x17, xzr
  49712c:      	tbz	w12, #0x0, 0x4971b8 <_stogir.verify.structure+0x478>
  497130:      	cmp	w15, #0x1
  497134:      	b.lt	0x4971ec <_stogir.verify.structure+0x4ac>
  497138:      	mov	w3, #0x1a               ; =26
  49713c:      	adrp	x4, 0x497000 <_stogir.verify.structure+0x2c0>
		000000000049713c:  ARM64_RELOC_PAGE21	l_str.21354
  497140:      	add	x4, x4, #0x0
		0000000000497140:  ARM64_RELOC_PAGEOFF12	l_str.21354
  497144:      	cbnz	w2, 0x497234 <_stogir.verify.structure+0x4f4>
  497148:      	cmp	w15, #0x5
  49714c:      	ldr	w14, [x26, x7, lsl #2]
  497150:      	csel	w12, w15, w27, lo
  497154:      	lsl	w12, w12, #2
  497158:      	sub	w12, w12, #0x4
  49715c:      	lsr	w12, w14, w12
  497160:      	and	w12, w12, #0xf
  497164:      	cmp	w12, #0xb
  497168:      	b.hi	0x497174 <_stogir.verify.structure+0x434>
  49716c:      	lsr	w12, w22, w12
  497170:      	tbnz	w12, #0x0, 0x4971b8 <_stogir.verify.structure+0x478>
  497174:      	ldr	w12, [sp, #0xc]
  497178:      	cmp	w25, #0x3
  49717c:      	csinc	w12, w12, wzr, eq
  497180:      	tbz	w12, #0x0, 0x4971b8 <_stogir.verify.structure+0x478>
  497184:      	b	0x4971ec <_stogir.verify.structure+0x4ac>
  497188:      	ldr	x12, [x1, #0x30]
  49718c:      	ldr	x14, [x1, #0x58]
  497190:      	cmp	x12, x14
  497194:      	b.ne	0x4971ec <_stogir.verify.structure+0x4ac>
  497198:      	sxtw	x14, w2
  49719c:      	cmn	x12, x14
  4971a0:      	b.lt	0x4971ec <_stogir.verify.structure+0x4ac>
  4971a4:      	ldr	x12, [x1, #0x50]
  4971a8:      	mvn	x14, x14
  4971ac:      	ldr	w12, [x12, x14, lsl #2]
  4971b0:      	cmp	w12, #0x0
  4971b4:      	b.le	0x4971ec <_stogir.verify.structure+0x4ac>
  4971b8:      	cbnz	x17, 0x496da8 <_stogir.verify.structure+0x68>
  4971bc:      	cmp	w25, w13
  4971c0:      	add	w25, w25, #0x1
  4971c4:      	b.le	0x496ef8 <_stogir.verify.structure+0x1b8>
  4971c8:      	b	0x496da8 <_stogir.verify.structure+0x68>
  4971cc:      	adrp	x4, 0x497000 <_stogir.verify.structure+0x2c0>
		00000000004971cc:  ARM64_RELOC_PAGE21	l_str.21341
  4971d0:      	add	x4, x4, #0x0
		00000000004971d0:  ARM64_RELOC_PAGEOFF12	l_str.21341
  4971d4:      	mov	w3, #0x2c               ; =44
  4971d8:      	b	0x497234 <_stogir.verify.structure+0x4f4>
  4971dc:      	mov	w3, #0x17               ; =23
  4971e0:      	adrp	x4, 0x497000 <_stogir.verify.structure+0x2c0>
		00000000004971e0:  ARM64_RELOC_PAGE21	l_str.21351
  4971e4:      	add	x4, x4, #0x0
		00000000004971e4:  ARM64_RELOC_PAGEOFF12	l_str.21351
  4971e8:      	b	0x497234 <_stogir.verify.structure+0x4f4>
  4971ec:      	mov	w3, #0x1a               ; =26
  4971f0:      	adrp	x4, 0x497000 <_stogir.verify.structure+0x2c0>
		00000000004971f0:  ARM64_RELOC_PAGE21	l_str.21354
  4971f4:      	add	x4, x4, #0x0
		00000000004971f4:  ARM64_RELOC_PAGEOFF12	l_str.21354
  4971f8:      	b	0x497234 <_stogir.verify.structure+0x4f4>
  4971fc:      	mov	w3, #0x16               ; =22
  497200:      	adrp	x4, 0x497000 <_stogir.verify.structure+0x2c0>
		0000000000497200:  ARM64_RELOC_PAGE21	l_str.21344
  497204:      	add	x4, x4, #0x0
		0000000000497204:  ARM64_RELOC_PAGEOFF12	l_str.21344
  497208:      	b	0x497234 <_stogir.verify.structure+0x4f4>
  49720c:      	str	wzr, [x0]
  497210:      	str	w9, [x0, #0x8]
  497214:      	b	0x497240 <_stogir.verify.structure+0x500>
  497218:      	mov	w3, #0x23               ; =35
  49721c:      	adrp	x4, 0x497000 <_stogir.verify.structure+0x2c0>
		000000000049721c:  ARM64_RELOC_PAGE21	l_str.21343
  497220:      	add	x4, x4, #0x0
		0000000000497220:  ARM64_RELOC_PAGEOFF12	l_str.21343
  497224:      	b	0x497234 <_stogir.verify.structure+0x4f4>
  497228:      	mov	w3, #0x23               ; =35
  49722c:      	adrp	x4, 0x497000 <_stogir.verify.structure+0x2c0>
		000000000049722c:  ARM64_RELOC_PAGE21	l_str.21345
  497230:      	add	x4, x4, #0x0
		0000000000497230:  ARM64_RELOC_PAGEOFF12	l_str.21345
  497234:      	mov	w8, #0x1                ; =1
  497238:      	stp	x4, x3, [x0, #0x8]
  49723c:      	str	w8, [x0]
  497240:      	ldp	x29, x30, [sp, #0x60]
  497244:      	ldp	x20, x19, [sp, #0x50]
  497248:      	ldp	x22, x21, [sp, #0x40]
  49724c:      	ldp	x24, x23, [sp, #0x30]
  497250:      	ldp	x26, x25, [sp, #0x20]
  497254:      	ldp	x28, x27, [sp, #0x10]
  497258:      	add	sp, sp, #0x70
  49725c:      	ret
