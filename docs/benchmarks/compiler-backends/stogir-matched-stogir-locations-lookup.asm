
build/bin/coil-normal-stogir-s3:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001009c2da8 <_stogir.locations.lookup>:
1009c2da8:     	sub	sp, sp, #0xf0
1009c2dac:     	str	x29, [sp, #0x10]
1009c2db0:     	str	x30, [sp, #0x18]
1009c2db4:     	add	x29, sp, #0x10
1009c2db8:     	adrp	x16, 0x100c95000 <_write+0x100c95000>
1009c2dbc:     	ldr	x16, [x16, #0xb18]
1009c2dc0:     	orr	x3, x16, xzr
1009c2dc4:     	adrp	x16, 0x100c95000 <_write+0x100c95000>
1009c2dc8:     	ldr	x16, [x16, #0xb20]
1009c2dcc:     	orr	x4, x16, xzr
1009c2dd0:     	sub	sp, sp, #0x10
1009c2dd4:     	add	x5, sp, #0x10
1009c2dd8:     	sxtw	x1, w1
1009c2ddc:     	sub	sp, sp, #0x10
1009c2de0:     	add	x6, sp, #0x10
1009c2de4:     	orr	x7, x5, xzr
1009c2de8:     	orr	x9, x5, xzr
1009c2dec:     	sub	sp, sp, #0x10
1009c2df0:     	add	x10, sp, #0x10
1009c2df4:     	orr	x11, x6, xzr
1009c2df8:     	add	x6, x6, #0x8
1009c2dfc:     	sub	sp, sp, #0x10
1009c2e00:     	add	x12, sp, #0x10
1009c2e04:     	sub	sp, sp, #0x10
1009c2e08:     	add	x13, sp, #0x10
1009c2e0c:     	sub	sp, sp, #0x10
1009c2e10:     	add	x14, sp, #0x10
1009c2e14:     	orr	x15, x13, xzr
1009c2e18:     	str	x0, [x29, #0x10]
1009c2e1c:     	orr	x0, x13, xzr
1009c2e20:     	str	x0, [x29, #0x18]
1009c2e24:     	sub	sp, sp, #0x10
1009c2e28:     	add	x0, sp, #0x10
1009c2e2c:     	str	x1, [x29, #0x20]
1009c2e30:     	orr	x1, x14, xzr
1009c2e34:     	add	x14, x14, #0x8
1009c2e38:     	str	x2, [x29, #0x28]
1009c2e3c:     	sub	sp, sp, #0x10
1009c2e40:     	add	x2, sp, #0x10
1009c2e44:     	str	x4, [x29, #0x30]
1009c2e48:     	orr	x4, x0, xzr
1009c2e4c:     	add	x0, x0, #0x8
1009c2e50:     	str	x4, [x29, #0x38]
1009c2e54:     	sub	sp, sp, #0x10
1009c2e58:     	add	x4, sp, #0x10
1009c2e5c:     	str	x0, [x29, #0x40]
1009c2e60:     	orr	x0, x2, xzr
1009c2e64:     	add	x2, x2, #0x8
1009c2e68:     	str	x0, [x29, #0x48]
1009c2e6c:     	sub	sp, sp, #0x20
1009c2e70:     	add	x0, sp, #0x10
1009c2e74:     	str	x0, [x29, #0x50]
1009c2e78:     	sub	sp, sp, #0x10
1009c2e7c:     	add	x0, sp, #0x10
1009c2e80:     	str	x0, [x29, #0x58]
1009c2e84:     	sub	sp, sp, #0x20
1009c2e88:     	add	x0, sp, #0x10
1009c2e8c:     	str	x0, [x29, #0x60]
1009c2e90:     	sub	sp, sp, #0x10
1009c2e94:     	add	x0, sp, #0x10
1009c2e98:     	str	x0, [x29, #0x68]
1009c2e9c:     	sub	sp, sp, #0x20
1009c2ea0:     	add	x0, sp, #0x10
1009c2ea4:     	str	x0, [x29, #0x70]
1009c2ea8:     	sub	sp, sp, #0x10
1009c2eac:     	add	x0, sp, #0x10
1009c2eb0:     	movz	x17, #0x0, lsl #48
1009c2eb4:     	str	x17, [x10]
1009c2eb8:     	movz	x17, #0x0, lsl #48
1009c2ebc:     	str	x17, [x10, #0x8]
1009c2ec0:     	str	x0, [x29, #0x78]
1009c2ec4:     	ldr	x0, [x10]
1009c2ec8:     	str	x0, [x11]
1009c2ecc:     	ldr	x0, [x10, #0x8]
1009c2ed0:     	str	x0, [x11, #0x8]
1009c2ed4:     	mov	w17, #0x1               ; =1
1009c2ed8:     	str	w17, [x11]
1009c2edc:     	movn	x17, #0x0, lsl #48
1009c2ee0:     	str	x17, [x6]
1009c2ee4:     	ldr	x0, [x11]
1009c2ee8:     	str	x0, [x12]
1009c2eec:     	ldr	x0, [x11, #0x8]
1009c2ef0:     	str	x0, [x12, #0x8]
1009c2ef4:     	ldr	x0, [x12]
1009c2ef8:     	str	x0, [x7]
1009c2efc:     	ldr	x0, [x12, #0x8]
1009c2f00:     	str	x0, [x7, #0x8]
1009c2f04:     	str	x3, [x1]
1009c2f08:     	movz	x17, #0x0, lsl #48
1009c2f0c:     	str	x17, [x14]
1009c2f10:     	ldr	x0, [x1]
1009c2f14:     	str	x0, [x15]
1009c2f18:     	ldr	x0, [x1, #0x8]
1009c2f1c:     	str	x0, [x15, #0x8]
1009c2f20:     	movz	x0, #0x0, lsl #48
1009c2f24:     	movz	x1, #0x0, lsl #48
1009c2f28:     	b	0x1009c2fb0 <_stogir.locations.lookup+0x208>
1009c2f2c:     	movz	x0, #0x0, lsl #48
1009c2f30:     	b	0x1009c301c <_stogir.locations.lookup+0x274>
1009c2f34:     	nop
1009c2f38:     	ldr	x1, [x29, #0x30]
1009c2f3c:     	ldr	x2, [x29, #0x38]
1009c2f40:     	str	x1, [x2]
1009c2f44:     	ldr	x3, [x29, #0x40]
1009c2f48:     	mov	x17, #0x1a              ; =26
1009c2f4c:     	str	x17, [x3]
1009c2f50:     	ldr	x4, [x2]
1009c2f54:     	ldr	x5, [x29, #0x18]
1009c2f58:     	str	x4, [x5]
1009c2f5c:     	ldr	x4, [x2, #0x8]
1009c2f60:     	str	x4, [x5, #0x8]
1009c2f64:     	str	x1, [x29, #0x30]
1009c2f68:     	str	x2, [x29, #0x38]
1009c2f6c:     	str	x3, [x29, #0x40]
1009c2f70:     	str	x5, [x29, #0x18]
1009c2f74:     	ldr	x2, [x29, #0x48]
1009c2f78:     	ldr	x1, [x29, #0xb0]
1009c2f7c:     	ldr	x3, [x29, #0x98]
1009c2f80:     	ldr	x4, [x29, #0xb8]
1009c2f84:     	add	x4, x4, #0x1
1009c2f88:     	ldr	x8, [x29, #0x80]
1009c2f8c:     	ldr	x5, [x29, #0x90]
1009c2f90:     	ldr	x13, [x29, #0xa0]
1009c2f94:     	str	x2, [x29, #0x48]
1009c2f98:     	mov	x2, x1
1009c2f9c:     	mov	x9, x3
1009c2fa0:     	ldr	x3, [x29, #0x88]
1009c2fa4:     	mov	x1, x0
1009c2fa8:     	mov	x0, x4
1009c2fac:     	ldr	x4, [x29, #0xa8]
1009c2fb0:     	str	x8, [x29, #0x80]
1009c2fb4:     	str	x3, [x29, #0x88]
1009c2fb8:     	str	x5, [x29, #0x90]
1009c2fbc:     	str	x9, [x29, #0x98]
1009c2fc0:     	str	x13, [x29, #0xa0]
1009c2fc4:     	str	x4, [x29, #0xa8]
1009c2fc8:     	str	x2, [x29, #0xb0]
1009c2fcc:     	str	x0, [x29, #0xb8]
1009c2fd0:     	str	x1, [x29, #0xc0]
1009c2fd4:     	ldr	x0, [x29, #0x10]
1009c2fd8:     	bl	0x100899bc0 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.allocation.Part>
1009c2fdc:     	ldr	x1, [x29, #0xb8]
1009c2fe0:     	cmp	x1, x0
1009c2fe4:     	b.ge	0x1009c3250 <_stogir.locations.lookup+0x4a8>
1009c2fe8:     	str	x1, [x29, #0xb8]
1009c2fec:     	ldr	x0, [x29, #0x10]
1009c2ff0:     	bl	0x100939514 <_inherent$coil.arraylist.ArrayList$at__stogir.allocation.Part>
1009c2ff4:     	add	x1, x0, #0x50
1009c2ff8:     	ldr	w1, [x1]
1009c2ffc:     	sxtw	x1, w1
1009c3000:     	ldr	x2, [x29, #0x20]
1009c3004:     	cmp	x1, x2
1009c3008:     	b.ne	0x1009c3258 <_stogir.locations.lookup+0x4b0>
1009c300c:     	str	x0, [x29, #0xc8]
1009c3010:     	str	x2, [x29, #0x20]
1009c3014:     	ldr	x1, [x29, #0x28]
1009c3018:     	bl	0x1009395b0 <_stogir.interval.covers?>
1009c301c:     	movz	x17, #0x0, lsl #48
1009c3020:     	cmp	x0, x17
1009c3024:     	b.eq	0x1009c3264 <_stogir.locations.lookup+0x4bc>
1009c3028:     	ldr	x0, [x29, #0xc0]
1009c302c:     	movz	x17, #0x0, lsl #48
1009c3030:     	cmp	x0, x17
1009c3034:     	b.ne	0x1009c2f38 <_stogir.locations.lookup+0x190>
1009c3038:     	ldr	x1, [x29, #0x30]
1009c303c:     	ldr	x2, [x29, #0x38]
1009c3040:     	ldr	x3, [x29, #0x40]
1009c3044:     	ldr	x5, [x29, #0x18]
1009c3048:     	sub	sp, sp, #0x10
1009c304c:     	add	x0, sp, #0x10
1009c3050:     	str	x1, [x29, #0x30]
1009c3054:     	str	x2, [x29, #0x38]
1009c3058:     	str	x3, [x29, #0x40]
1009c305c:     	str	x5, [x29, #0x18]
1009c3060:     	str	x0, [x29, #0xd0]
1009c3064:     	mov	x16, x0
1009c3068:     	str	x16, [sp]
1009c306c:     	ldr	x0, [x29, #0xc8]
1009c3070:     	bl	0x1009bbb60 <_stogir.locations.of-part>
1009c3074:     	ldr	x16, [sp]
1009c3078:     	str	x0, [x16]
1009c307c:     	str	x1, [x16, #0x8]
1009c3080:     	ldr	x0, [x29, #0xd0]
1009c3084:     	ldr	x1, [x0]
1009c3088:     	ldr	x0, [x0, #0x8]
1009c308c:     	ldr	x2, [x29, #0x48]
1009c3090:     	str	x1, [x2]
1009c3094:     	ldr	x1, [x29, #0xb0]
1009c3098:     	str	x0, [x1]
1009c309c:     	ldr	x0, [x2]
1009c30a0:     	ldr	x3, [x29, #0x98]
1009c30a4:     	str	x0, [x3]
1009c30a8:     	ldr	x0, [x2, #0x8]
1009c30ac:     	str	x0, [x3, #0x8]
1009c30b0:     	mov	x0, #0x1                ; =1
1009c30b4:     	b	0x1009c2f80 <_stogir.locations.lookup+0x1d8>
1009c30b8:     	ldr	x1, [x29, #0xa8]
1009c30bc:     	orr	x2, x1, xzr
1009c30c0:     	add	x3, x1, #0x8
1009c30c4:     	ldr	x4, [x29, #0x88]
1009c30c8:     	str	x4, [x2]
1009c30cc:     	orr	x2, x3, xzr
1009c30d0:     	movz	x17, #0x0, lsl #48
1009c30d4:     	str	x17, [x2]
1009c30d8:     	str	x0, [x29, #0xc0]
1009c30dc:     	ldr	x0, [x29, #0xa0]
1009c30e0:     	bl	0x10008abc0 <_coil.core.!=__slice_u8>
1009c30e4:     	movz	x17, #0x0, lsl #48
1009c30e8:     	cmp	x0, x17
1009c30ec:     	b.eq	0x1009c3160 <_stogir.locations.lookup+0x3b8>
1009c30f0:     	ldr	x0, [x29, #0x50]
1009c30f4:     	ldr	x1, [x29, #0x58]
1009c30f8:     	ldr	x2, [x29, #0xa0]
1009c30fc:     	orr	x3, x0, xzr
1009c3100:     	add	x4, x0, #0x8
1009c3104:     	mov	w17, #0x1               ; =1
1009c3108:     	str	w17, [x3]
1009c310c:     	orr	x3, x4, xzr
1009c3110:     	ldr	x4, [x2]
1009c3114:     	str	x4, [x1]
1009c3118:     	ldr	x2, [x2, #0x8]
1009c311c:     	str	x2, [x1, #0x8]
1009c3120:     	ldr	x2, [x1]
1009c3124:     	str	x2, [x3]
1009c3128:     	ldr	x1, [x1, #0x8]
1009c312c:     	str	x1, [x3, #0x8]
1009c3130:     	ldr	x1, [x29, #0x80]
1009c3134:     	ldr	x2, [x0]
1009c3138:     	str	x2, [x1]
1009c313c:     	ldr	x2, [x0, #0x8]
1009c3140:     	str	x2, [x1, #0x8]
1009c3144:     	ldr	x0, [x0, #0x10]
1009c3148:     	str	x0, [x1, #0x10]
1009c314c:     	sub	sp, x29, #0x10
1009c3150:     	ldr	x29, [sp, #0x10]
1009c3154:     	ldr	x30, [sp, #0x18]
1009c3158:     	add	sp, sp, #0xf0
1009c315c:     	ret
1009c3160:     	ldr	x0, [x29, #0xc0]
1009c3164:     	movz	x17, #0x0, lsl #48
1009c3168:     	cmp	x0, x17
1009c316c:     	b.eq	0x1009c3248 <_stogir.locations.lookup+0x4a0>
1009c3170:     	movz	x0, #0x0, lsl #48
1009c3174:     	movz	x17, #0x0, lsl #48
1009c3178:     	cmp	x0, x17
1009c317c:     	b.eq	0x1009c3228 <_stogir.locations.lookup+0x480>
1009c3180:     	ldr	x0, [x29, #0x90]
1009c3184:     	mov	x1, #0x1                ; =1
1009c3188:     	movz	x17, #0x0, lsl #48
1009c318c:     	cmp	x1, x17
1009c3190:     	b.eq	0x1009c31e4 <_stogir.locations.lookup+0x43c>
1009c3194:     	ldr	x0, [x29, #0x60]
1009c3198:     	ldr	x1, [x29, #0x68]
1009c319c:     	adrp	x16, 0x100c95000 <_write+0x100c95000>
1009c31a0:     	ldr	x16, [x16, #0xb28]
1009c31a4:     	orr	x2, x16, xzr
1009c31a8:     	orr	x3, x0, xzr
1009c31ac:     	add	x4, x0, #0x8
1009c31b0:     	orr	x5, x1, xzr
1009c31b4:     	add	x1, x1, #0x8
1009c31b8:     	mov	w17, #0x1               ; =1
1009c31bc:     	str	w17, [x3]
1009c31c0:     	orr	x3, x4, xzr
1009c31c4:     	str	x2, [x5]
1009c31c8:     	mov	x17, #0x21              ; =33
1009c31cc:     	str	x17, [x1]
1009c31d0:     	ldr	x1, [x5]
1009c31d4:     	str	x1, [x3]
1009c31d8:     	ldr	x1, [x5, #0x8]
1009c31dc:     	str	x1, [x3, #0x8]
1009c31e0:     	b	0x1009c3130 <_stogir.locations.lookup+0x388>
1009c31e4:     	ldr	x1, [x29, #0x70]
1009c31e8:     	ldr	x2, [x29, #0x78]
1009c31ec:     	orr	x3, x1, xzr
1009c31f0:     	add	x4, x1, #0x8
1009c31f4:     	movz	w17, #0x0, lsl #16
1009c31f8:     	str	w17, [x3]
1009c31fc:     	orr	x3, x4, xzr
1009c3200:     	ldr	x4, [x0]
1009c3204:     	str	x4, [x2]
1009c3208:     	ldr	x0, [x0, #0x8]
1009c320c:     	str	x0, [x2, #0x8]
1009c3210:     	ldr	x0, [x2]
1009c3214:     	str	x0, [x3]
1009c3218:     	ldr	x0, [x2, #0x8]
1009c321c:     	str	x0, [x3, #0x8]
1009c3220:     	mov	x0, x1
1009c3224:     	b	0x1009c31e0 <_stogir.locations.lookup+0x438>
1009c3228:     	ldr	x0, [x29, #0x90]
1009c322c:     	add	x1, x0, #0x8
1009c3230:     	ldr	x1, [x1]
1009c3234:     	movz	x17, #0x0, lsl #48
1009c3238:     	cmp	x1, x17
1009c323c:     	cset	w1, lt
1009c3240:     	ubfx	x1, x1, #0, #8
1009c3244:     	b	0x1009c3188 <_stogir.locations.lookup+0x3e0>
1009c3248:     	mov	x0, #0x1                ; =1
1009c324c:     	b	0x1009c3174 <_stogir.locations.lookup+0x3cc>
1009c3250:     	ldr	x0, [x29, #0xc0]
1009c3254:     	b	0x1009c30b8 <_stogir.locations.lookup+0x310>
1009c3258:     	str	x2, [x29, #0x20]
1009c325c:     	str	x0, [x29, #0xc8]
1009c3260:     	b	0x1009c2f2c <_stogir.locations.lookup+0x184>
1009c3264:     	ldr	x0, [x29, #0xc0]
1009c3268:     	ldr	x2, [x29, #0x48]
1009c326c:     	ldr	x1, [x29, #0xb0]
1009c3270:     	ldr	x3, [x29, #0x98]
1009c3274:     	b	0x1009c2f80 <_stogir.locations.lookup+0x1d8>
