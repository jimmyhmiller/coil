0000000100000afc <_stogir.opcode.input-count>:
100000afc:     	sxtw	x0, w0
100000b00:     	movz	x17, #0x0, lsl #48
100000b04:     	cmp	x0, x17
100000b08:     	b.ne	0x100000b14 <_stogir.opcode.input-count+0x18>
100000b0c:     	movz	x0, #0x0, lsl #48
100000b10:     	ret
100000b14:     	mov	x17, #0x1               ; =1
100000b18:     	cmp	x0, x17
100000b1c:     	b.ne	0x100000b28 <_stogir.opcode.input-count+0x2c>
100000b20:     	movz	x0, #0x0, lsl #48
100000b24:     	b	0x100000b10 <_stogir.opcode.input-count+0x14>
100000b28:     	mov	x17, #0x2               ; =2
100000b2c:     	cmp	x0, x17
100000b30:     	b.ne	0x100000b3c <_stogir.opcode.input-count+0x40>
100000b34:     	movz	x0, #0x0, lsl #48
100000b38:     	b	0x100000b24 <_stogir.opcode.input-count+0x28>
100000b3c:     	mov	x17, #0x3               ; =3
100000b40:     	cmp	x0, x17
100000b44:     	b.ne	0x100000b50 <_stogir.opcode.input-count+0x54>
100000b48:     	movz	x0, #0x0, lsl #48
100000b4c:     	b	0x100000b38 <_stogir.opcode.input-count+0x3c>
100000b50:     	mov	x17, #0x4               ; =4
100000b54:     	cmp	x0, x17
100000b58:     	b.ne	0x100000b64 <_stogir.opcode.input-count+0x68>
100000b5c:     	movz	x0, #0x0, lsl #48
100000b60:     	b	0x100000b4c <_stogir.opcode.input-count+0x50>
100000b64:     	mov	x17, #0x5               ; =5
100000b68:     	cmp	x0, x17
100000b6c:     	b.ne	0x100000b78 <_stogir.opcode.input-count+0x7c>
100000b70:     	movz	x0, #0x0, lsl #48
100000b74:     	b	0x100000b60 <_stogir.opcode.input-count+0x64>
100000b78:     	mov	x17, #0x6               ; =6
100000b7c:     	cmp	x0, x17
100000b80:     	b.ne	0x100000b8c <_stogir.opcode.input-count+0x90>
100000b84:     	movz	x0, #0x0, lsl #48
100000b88:     	b	0x100000b74 <_stogir.opcode.input-count+0x78>
100000b8c:     	mov	x17, #0x7               ; =7
100000b90:     	cmp	x0, x17
100000b94:     	b.ne	0x100000ba0 <_stogir.opcode.input-count+0xa4>
100000b98:     	movz	x0, #0x0, lsl #48
100000b9c:     	b	0x100000b88 <_stogir.opcode.input-count+0x8c>
100000ba0:     	mov	x17, #0x8               ; =8
100000ba4:     	cmp	x0, x17
100000ba8:     	b.ne	0x100000bb4 <_stogir.opcode.input-count+0xb8>
100000bac:     	movz	x0, #0x0, lsl #48
100000bb0:     	b	0x100000b9c <_stogir.opcode.input-count+0xa0>
100000bb4:     	mov	x17, #0x9               ; =9
100000bb8:     	cmp	x0, x17
100000bbc:     	b.ne	0x100000bc8 <_stogir.opcode.input-count+0xcc>
100000bc0:     	movz	x0, #0x0, lsl #48
100000bc4:     	b	0x100000bb0 <_stogir.opcode.input-count+0xb4>
100000bc8:     	mov	x17, #0xa               ; =10
100000bcc:     	cmp	x0, x17
100000bd0:     	b.ne	0x100000bdc <_stogir.opcode.input-count+0xe0>
100000bd4:     	movz	x0, #0x0, lsl #48
100000bd8:     	b	0x100000bc4 <_stogir.opcode.input-count+0xc8>
100000bdc:     	mov	x17, #0xb               ; =11
100000be0:     	cmp	x0, x17
100000be4:     	b.ne	0x100000bf0 <_stogir.opcode.input-count+0xf4>
100000be8:     	movz	x0, #0x0, lsl #48
100000bec:     	b	0x100000bd8 <_stogir.opcode.input-count+0xdc>
100000bf0:     	mov	x17, #0xc               ; =12
100000bf4:     	cmp	x0, x17
100000bf8:     	b.ne	0x100000c04 <_stogir.opcode.input-count+0x108>
100000bfc:     	movz	x0, #0x0, lsl #48
100000c00:     	b	0x100000bec <_stogir.opcode.input-count+0xf0>
100000c04:     	mov	x17, #0xd               ; =13
100000c08:     	cmp	x0, x17
100000c0c:     	b.ne	0x100000c18 <_stogir.opcode.input-count+0x11c>
100000c10:     	movz	x0, #0x0, lsl #48
100000c14:     	b	0x100000c00 <_stogir.opcode.input-count+0x104>
100000c18:     	mov	x17, #0xe               ; =14
100000c1c:     	cmp	x0, x17
100000c20:     	b.ne	0x100000c2c <_stogir.opcode.input-count+0x130>
100000c24:     	mov	x0, #0x2                ; =2
100000c28:     	b	0x100000c14 <_stogir.opcode.input-count+0x118>
100000c2c:     	mov	x17, #0xf               ; =15
100000c30:     	cmp	x0, x17
100000c34:     	b.ne	0x100000c40 <_stogir.opcode.input-count+0x144>
100000c38:     	mov	x0, #0x2                ; =2
100000c3c:     	b	0x100000c28 <_stogir.opcode.input-count+0x12c>
100000c40:     	mov	x17, #0x10              ; =16
100000c44:     	cmp	x0, x17
100000c48:     	b.ne	0x100000c54 <_stogir.opcode.input-count+0x158>
100000c4c:     	mov	x0, #0x2                ; =2
100000c50:     	b	0x100000c3c <_stogir.opcode.input-count+0x140>
100000c54:     	mov	x17, #0x11              ; =17
100000c58:     	cmp	x0, x17
100000c5c:     	b.ne	0x100000c68 <_stogir.opcode.input-count+0x16c>
100000c60:     	mov	x0, #0x2                ; =2
100000c64:     	b	0x100000c50 <_stogir.opcode.input-count+0x154>
100000c68:     	mov	x17, #0x12              ; =18
100000c6c:     	cmp	x0, x17
100000c70:     	b.ne	0x100000c7c <_stogir.opcode.input-count+0x180>
100000c74:     	mov	x0, #0x2                ; =2
100000c78:     	b	0x100000c64 <_stogir.opcode.input-count+0x168>
100000c7c:     	mov	x17, #0x13              ; =19
100000c80:     	cmp	x0, x17
100000c84:     	b.ne	0x100000c90 <_stogir.opcode.input-count+0x194>
100000c88:     	mov	x0, #0x2                ; =2
100000c8c:     	b	0x100000c78 <_stogir.opcode.input-count+0x17c>
100000c90:     	mov	x17, #0x14              ; =20
100000c94:     	cmp	x0, x17
100000c98:     	b.ne	0x100000ca4 <_stogir.opcode.input-count+0x1a8>
100000c9c:     	mov	x0, #0x2                ; =2
100000ca0:     	b	0x100000c8c <_stogir.opcode.input-count+0x190>
100000ca4:     	mov	x17, #0x15              ; =21
100000ca8:     	cmp	x0, x17
100000cac:     	b.ne	0x100000cb8 <_stogir.opcode.input-count+0x1bc>
100000cb0:     	mov	x0, #0x2                ; =2
100000cb4:     	b	0x100000ca0 <_stogir.opcode.input-count+0x1a4>
100000cb8:     	mov	x17, #0x16              ; =22
100000cbc:     	cmp	x0, x17
100000cc0:     	b.ne	0x100000ccc <_stogir.opcode.input-count+0x1d0>
100000cc4:     	mov	x0, #0x2                ; =2
100000cc8:     	b	0x100000cb4 <_stogir.opcode.input-count+0x1b8>
100000ccc:     	mov	x17, #0x17              ; =23
100000cd0:     	cmp	x0, x17
100000cd4:     	b.ne	0x100000ce0 <_stogir.opcode.input-count+0x1e4>
100000cd8:     	mov	x0, #0x2                ; =2
100000cdc:     	b	0x100000cc8 <_stogir.opcode.input-count+0x1cc>
100000ce0:     	mov	x17, #0x18              ; =24
100000ce4:     	cmp	x0, x17
100000ce8:     	b.ne	0x100000cf4 <_stogir.opcode.input-count+0x1f8>
100000cec:     	mov	x0, #0x2                ; =2
100000cf0:     	b	0x100000cdc <_stogir.opcode.input-count+0x1e0>
100000cf4:     	mov	x17, #0x19              ; =25
100000cf8:     	cmp	x0, x17
100000cfc:     	b.ne	0x100000d08 <_stogir.opcode.input-count+0x20c>
100000d00:     	mov	x0, #0x2                ; =2
100000d04:     	b	0x100000cf0 <_stogir.opcode.input-count+0x1f4>
100000d08:     	mov	x17, #0x1a              ; =26
100000d0c:     	cmp	x0, x17
100000d10:     	b.ne	0x100000d1c <_stogir.opcode.input-count+0x220>
100000d14:     	mov	x0, #0x2                ; =2
100000d18:     	b	0x100000d04 <_stogir.opcode.input-count+0x208>
100000d1c:     	mov	x17, #0x1b              ; =27
100000d20:     	cmp	x0, x17
100000d24:     	b.ne	0x100000d30 <_stogir.opcode.input-count+0x234>
100000d28:     	mov	x0, #0x2                ; =2
100000d2c:     	b	0x100000d18 <_stogir.opcode.input-count+0x21c>
100000d30:     	mov	x17, #0x1c              ; =28
100000d34:     	cmp	x0, x17
100000d38:     	b.ne	0x100000d44 <_stogir.opcode.input-count+0x248>
100000d3c:     	mov	x0, #0x2                ; =2
100000d40:     	b	0x100000d2c <_stogir.opcode.input-count+0x230>
100000d44:     	mov	x17, #0x1d              ; =29
100000d48:     	cmp	x0, x17
100000d4c:     	b.ne	0x100000d58 <_stogir.opcode.input-count+0x25c>
100000d50:     	mov	x0, #0x3                ; =3
100000d54:     	b	0x100000d40 <_stogir.opcode.input-count+0x244>
100000d58:     	mov	x17, #0x1e              ; =30
100000d5c:     	cmp	x0, x17
100000d60:     	b.ne	0x100000d6c <_stogir.opcode.input-count+0x270>
100000d64:     	mov	x0, #0x3                ; =3
100000d68:     	b	0x100000d54 <_stogir.opcode.input-count+0x258>
100000d6c:     	mov	x17, #0x1f              ; =31
100000d70:     	cmp	x0, x17
100000d74:     	b.ne	0x100000d80 <_stogir.opcode.input-count+0x284>
100000d78:     	mov	x0, #0x1                ; =1
100000d7c:     	b	0x100000d68 <_stogir.opcode.input-count+0x26c>
100000d80:     	mov	x17, #0x20              ; =32
100000d84:     	cmp	x0, x17
100000d88:     	b.ne	0x100000d94 <_stogir.opcode.input-count+0x298>
100000d8c:     	mov	x0, #0x1                ; =1
100000d90:     	b	0x100000d7c <_stogir.opcode.input-count+0x280>
100000d94:     	mov	x17, #0x21              ; =33
100000d98:     	cmp	x0, x17
100000d9c:     	b.ne	0x100000da8 <_stogir.opcode.input-count+0x2ac>
100000da0:     	mov	x0, #0x1                ; =1
100000da4:     	b	0x100000d90 <_stogir.opcode.input-count+0x294>
100000da8:     	mov	x17, #0x22              ; =34
100000dac:     	cmp	x0, x17
100000db0:     	b.ne	0x100000dbc <_stogir.opcode.input-count+0x2c0>
100000db4:     	mov	x0, #0x1                ; =1
100000db8:     	b	0x100000da4 <_stogir.opcode.input-count+0x2a8>
100000dbc:     	mov	x17, #0x23              ; =35
100000dc0:     	cmp	x0, x17
100000dc4:     	b.ne	0x100000dd0 <_stogir.opcode.input-count+0x2d4>
100000dc8:     	mov	x0, #0x1                ; =1
100000dcc:     	b	0x100000db8 <_stogir.opcode.input-count+0x2bc>
100000dd0:     	mov	x17, #0x24              ; =36
100000dd4:     	cmp	x0, x17
100000dd8:     	b.ne	0x100000de4 <_stogir.opcode.input-count+0x2e8>
100000ddc:     	mov	x0, #0x1                ; =1
100000de0:     	b	0x100000dcc <_stogir.opcode.input-count+0x2d0>
100000de4:     	mov	x17, #0x25              ; =37
100000de8:     	cmp	x0, x17
100000dec:     	b.ne	0x100000df8 <_stogir.opcode.input-count+0x2fc>
100000df0:     	mov	x0, #0x1                ; =1
100000df4:     	b	0x100000de0 <_stogir.opcode.input-count+0x2e4>
100000df8:     	mov	x17, #0x26              ; =38
100000dfc:     	cmp	x0, x17
100000e00:     	b.ne	0x100000e0c <_stogir.opcode.input-count+0x310>
100000e04:     	mov	x0, #0x1                ; =1
100000e08:     	b	0x100000df4 <_stogir.opcode.input-count+0x2f8>
100000e0c:     	mov	x17, #0x27              ; =39
100000e10:     	cmp	x0, x17
100000e14:     	b.ne	0x100000e20 <_stogir.opcode.input-count+0x324>
100000e18:     	mov	x0, #0x1                ; =1
100000e1c:     	b	0x100000e08 <_stogir.opcode.input-count+0x30c>
100000e20:     	mov	x17, #0x28              ; =40
100000e24:     	cmp	x0, x17
100000e28:     	b.ne	0x100000e34 <_stogir.opcode.input-count+0x338>
100000e2c:     	mov	x0, #0x1                ; =1
100000e30:     	b	0x100000e1c <_stogir.opcode.input-count+0x320>
100000e34:     	mov	x17, #0x29              ; =41
100000e38:     	cmp	x0, x17
100000e3c:     	b.ne	0x100000e48 <_stogir.opcode.input-count+0x34c>
100000e40:     	mov	x0, #0x2                ; =2
100000e44:     	b	0x100000e30 <_stogir.opcode.input-count+0x334>
100000e48:     	mov	x17, #0x2a              ; =42
100000e4c:     	cmp	x0, x17
100000e50:     	b.ne	0x100000e5c <_stogir.opcode.input-count+0x360>
100000e54:     	mov	x0, #0x2                ; =2
100000e58:     	b	0x100000e44 <_stogir.opcode.input-count+0x348>
100000e5c:     	mov	x17, #0x2b              ; =43
100000e60:     	cmp	x0, x17
100000e64:     	b.ne	0x100000e70 <_stogir.opcode.input-count+0x374>
100000e68:     	mov	x0, #0x2                ; =2
100000e6c:     	b	0x100000e58 <_stogir.opcode.input-count+0x35c>
100000e70:     	mov	x17, #0x2c              ; =44
100000e74:     	cmp	x0, x17
100000e78:     	b.ne	0x100000e84 <_stogir.opcode.input-count+0x388>
100000e7c:     	mov	x0, #0x1                ; =1
100000e80:     	b	0x100000e6c <_stogir.opcode.input-count+0x370>
100000e84:     	mov	x17, #0x2d              ; =45
100000e88:     	cmp	x0, x17
100000e8c:     	b.ne	0x100000e98 <_stogir.opcode.input-count+0x39c>
100000e90:     	mov	x0, #0x1                ; =1
100000e94:     	b	0x100000e80 <_stogir.opcode.input-count+0x384>
100000e98:     	mov	x17, #0x2e              ; =46
100000e9c:     	cmp	x0, x17
100000ea0:     	b.ne	0x100000eac <_stogir.opcode.input-count+0x3b0>
100000ea4:     	mov	x0, #0x2                ; =2
100000ea8:     	b	0x100000e94 <_stogir.opcode.input-count+0x398>
100000eac:     	mov	x17, #0x2f              ; =47
100000eb0:     	cmp	x0, x17
100000eb4:     	b.ne	0x100000ec0 <_stogir.opcode.input-count+0x3c4>
100000eb8:     	mov	x0, #0x2                ; =2
100000ebc:     	b	0x100000ea8 <_stogir.opcode.input-count+0x3ac>
100000ec0:     	mov	x17, #0x30              ; =48
100000ec4:     	cmp	x0, x17
100000ec8:     	b.ne	0x100000ed4 <_stogir.opcode.input-count+0x3d8>
100000ecc:     	mov	x0, #0x2                ; =2
100000ed0:     	b	0x100000ebc <_stogir.opcode.input-count+0x3c0>
100000ed4:     	mov	x17, #0x31              ; =49
100000ed8:     	cmp	x0, x17
100000edc:     	b.ne	0x100000ee8 <_stogir.opcode.input-count+0x3ec>
100000ee0:     	mov	x0, #0x2                ; =2
100000ee4:     	b	0x100000ed0 <_stogir.opcode.input-count+0x3d4>
100000ee8:     	mov	x17, #0x32              ; =50
100000eec:     	cmp	x0, x17
100000ef0:     	b.ne	0x100000efc <_stogir.opcode.input-count+0x400>
100000ef4:     	mov	x0, #0x2                ; =2
100000ef8:     	b	0x100000ee4 <_stogir.opcode.input-count+0x3e8>
100000efc:     	mov	x17, #0x33              ; =51
100000f00:     	cmp	x0, x17
100000f04:     	b.ne	0x100000f10 <_stogir.opcode.input-count+0x414>
100000f08:     	mov	x0, #0x2                ; =2
100000f0c:     	b	0x100000ef8 <_stogir.opcode.input-count+0x3fc>
100000f10:     	mov	x17, #0x34              ; =52
100000f14:     	cmp	x0, x17
100000f18:     	b.ne	0x100000f24 <_stogir.opcode.input-count+0x428>
100000f1c:     	mov	x0, #0x2                ; =2
100000f20:     	b	0x100000f0c <_stogir.opcode.input-count+0x410>
100000f24:     	mov	x17, #0x35              ; =53
100000f28:     	cmp	x0, x17
100000f2c:     	b.ne	0x100000f38 <_stogir.opcode.input-count+0x43c>
100000f30:     	mov	x0, #0x2                ; =2
100000f34:     	b	0x100000f20 <_stogir.opcode.input-count+0x424>
100000f38:     	mov	x17, #0x36              ; =54
100000f3c:     	cmp	x0, x17
100000f40:     	b.ne	0x100000f4c <_stogir.opcode.input-count+0x450>
100000f44:     	mov	x0, #0x1                ; =1
100000f48:     	b	0x100000f34 <_stogir.opcode.input-count+0x438>
100000f4c:     	mov	x17, #0x37              ; =55
100000f50:     	cmp	x0, x17
100000f54:     	b.ne	0x100000f60 <_stogir.opcode.input-count+0x464>
100000f58:     	mov	x0, #0x1                ; =1
100000f5c:     	b	0x100000f48 <_stogir.opcode.input-count+0x44c>
100000f60:     	mov	x17, #0x38              ; =56
100000f64:     	cmp	x0, x17
100000f68:     	b.ne	0x100000f74 <_stogir.opcode.input-count+0x478>
100000f6c:     	mov	x0, #0x1                ; =1
100000f70:     	b	0x100000f5c <_stogir.opcode.input-count+0x460>
100000f74:     	mov	x17, #0x39              ; =57
100000f78:     	cmp	x0, x17
100000f7c:     	b.ne	0x100000f88 <_stogir.opcode.input-count+0x48c>
100000f80:     	mov	x0, #0x1                ; =1
100000f84:     	b	0x100000f70 <_stogir.opcode.input-count+0x474>
100000f88:     	mov	x17, #0x3a              ; =58
100000f8c:     	cmp	x0, x17
100000f90:     	b.ne	0x100000f9c <_stogir.opcode.input-count+0x4a0>
100000f94:     	mov	x0, #0x2                ; =2
100000f98:     	b	0x100000f84 <_stogir.opcode.input-count+0x488>
100000f9c:     	mov	x17, #0x3b              ; =59
100000fa0:     	cmp	x0, x17
100000fa4:     	b.ne	0x100000fb0 <_stogir.opcode.input-count+0x4b4>
100000fa8:     	mov	x0, #0x2                ; =2
100000fac:     	b	0x100000f98 <_stogir.opcode.input-count+0x49c>
100000fb0:     	mov	x17, #0x3c              ; =60
100000fb4:     	cmp	x0, x17
100000fb8:     	b.ne	0x100000fc4 <_stogir.opcode.input-count+0x4c8>
100000fbc:     	mov	x0, #0x3                ; =3
100000fc0:     	b	0x100000fac <_stogir.opcode.input-count+0x4b0>
100000fc4:     	mov	x17, #0x3d              ; =61
100000fc8:     	cmp	x0, x17
100000fcc:     	b.ne	0x100000fd8 <_stogir.opcode.input-count+0x4dc>
100000fd0:     	mov	x0, #0x2                ; =2
100000fd4:     	b	0x100000fc0 <_stogir.opcode.input-count+0x4c4>
100000fd8:     	mov	x17, #0x3e              ; =62
100000fdc:     	cmp	x0, x17
100000fe0:     	b.ne	0x100000fec <_stogir.opcode.input-count+0x4f0>
100000fe4:     	mov	x0, #0x3                ; =3
100000fe8:     	b	0x100000fd4 <_stogir.opcode.input-count+0x4d8>
100000fec:     	mov	x17, #0x3f              ; =63
100000ff0:     	cmp	x0, x17
100000ff4:     	b.ne	0x100001000 <_stogir.opcode.input-count+0x504>
100000ff8:     	mov	x0, #0x1                ; =1
100000ffc:     	b	0x100000fe8 <_stogir.opcode.input-count+0x4ec>
100001000:     	mov	x17, #0x40              ; =64
100001004:     	cmp	x0, x17
100001008:     	b.ne	0x100001014 <_stogir.opcode.input-count+0x518>
10000100c:     	mov	x0, #0x3                ; =3
100001010:     	b	0x100000ffc <_stogir.opcode.input-count+0x500>
100001014:     	mov	x17, #0x41              ; =65
100001018:     	cmp	x0, x17
10000101c:     	b.ne	0x100001028 <_stogir.opcode.input-count+0x52c>
100001020:     	mov	x0, #0x1                ; =1
100001024:     	b	0x100001010 <_stogir.opcode.input-count+0x514>
100001028:     	mov	x17, #0x42              ; =66
10000102c:     	cmp	x0, x17
100001030:     	b.ne	0x10000103c <_stogir.opcode.input-count+0x540>
100001034:     	movz	x0, #0x0, lsl #48
100001038:     	b	0x100001024 <_stogir.opcode.input-count+0x528>
10000103c:     	mov	x17, #0x43              ; =67
100001040:     	cmp	x0, x17
100001044:     	b.ne	0x100001050 <_stogir.opcode.input-count+0x554>
100001048:     	movn	x0, #0x0, lsl #48
10000104c:     	b	0x100001038 <_stogir.opcode.input-count+0x53c>
100001050:     	mov	x17, #0x44              ; =68
100001054:     	cmp	x0, x17
100001058:     	b.ne	0x100001064 <_stogir.opcode.input-count+0x568>
10000105c:     	mov	x0, #0x1                ; =1
100001060:     	b	0x10000104c <_stogir.opcode.input-count+0x550>
100001064:     	mov	x17, #0x45              ; =69
100001068:     	cmp	x0, x17
10000106c:     	b.ne	0x100001078 <_stogir.opcode.input-count+0x57c>
100001070:     	mov	x0, #0x2                ; =2
100001074:     	b	0x100001060 <_stogir.opcode.input-count+0x564>
100001078:     	mov	x17, #0x46              ; =70
10000107c:     	cmp	x0, x17
100001080:     	b.ne	0x10000108c <_stogir.opcode.input-count+0x590>
100001084:     	mov	x0, #0x1                ; =1
100001088:     	b	0x100001074 <_stogir.opcode.input-count+0x578>
10000108c:     	mov	x17, #0x47              ; =71
100001090:     	cmp	x0, x17
100001094:     	b.ne	0x1000010a0 <_stogir.opcode.input-count+0x5a4>
100001098:     	mov	x0, #0x1                ; =1
10000109c:     	b	0x100001088 <_stogir.opcode.input-count+0x58c>
1000010a0:     	mov	x17, #0x48              ; =72
1000010a4:     	cmp	x0, x17
1000010a8:     	b.ne	0x1000010b4 <_stogir.opcode.input-count+0x5b8>
1000010ac:     	mov	x0, #0x1                ; =1
1000010b0:     	b	0x10000109c <_stogir.opcode.input-count+0x5a0>
1000010b4:     	mov	x17, #0x49              ; =73
1000010b8:     	cmp	x0, x17
1000010bc:     	b.ne	0x1000010c8 <_stogir.opcode.input-count+0x5cc>
1000010c0:     	movz	x0, #0x0, lsl #48
1000010c4:     	b	0x1000010b0 <_stogir.opcode.input-count+0x5b4>
1000010c8:     	mov	x17, #0x4a              ; =74
1000010cc:     	cmp	x0, x17
1000010d0:     	b.ne	0x1000010dc <_stogir.opcode.input-count+0x5e0>
1000010d4:     	movz	x0, #0x0, lsl #48
1000010d8:     	b	0x1000010c4 <_stogir.opcode.input-count+0x5c8>
1000010dc:     	mov	x17, #0x4b              ; =75
1000010e0:     	cmp	x0, x17
1000010e4:     	b.ne	0x1000010f0 <_stogir.opcode.input-count+0x5f4>
1000010e8:     	movz	x0, #0x0, lsl #48
1000010ec:     	b	0x1000010d8 <_stogir.opcode.input-count+0x5dc>
1000010f0:     	mov	x17, #0x4c              ; =76
1000010f4:     	cmp	x0, x17
1000010f8:     	b.ne	0x100001104 <_stogir.opcode.input-count+0x608>
1000010fc:     	movz	x0, #0x0, lsl #48
100001100:     	b	0x1000010ec <_stogir.opcode.input-count+0x5f0>
100001104:     	mov	x17, #0x4d              ; =77
100001108:     	cmp	x0, x17
10000110c:     	b.ne	0x100001118 <_stogir.opcode.input-count+0x61c>
100001110:     	movz	x0, #0x0, lsl #48
100001114:     	b	0x100001100 <_stogir.opcode.input-count+0x604>
100001118:     	mov	x17, #0x4e              ; =78
10000111c:     	cmp	x0, x17
100001120:     	b.ne	0x10000112c <_stogir.opcode.input-count+0x630>
100001124:     	movz	x0, #0x0, lsl #48
100001128:     	b	0x100001114 <_stogir.opcode.input-count+0x618>
10000112c:     	mov	x17, #0x4f              ; =79
100001130:     	cmp	x0, x17
100001134:     	b.ne	0x100001140 <_stogir.opcode.input-count+0x644>
100001138:     	movn	x0, #0x0, lsl #48
10000113c:     	b	0x100001128 <_stogir.opcode.input-count+0x62c>
100001140:     	mov	x17, #0x50              ; =80
100001144:     	cmp	x0, x17
100001148:     	b.ne	0x100001154 <_stogir.opcode.input-count+0x658>
10000114c:     	movn	x0, #0x0, lsl #48
100001150:     	b	0x10000113c <_stogir.opcode.input-count+0x640>
100001154:     	mov	x17, #0x51              ; =81
100001158:     	cmp	x0, x17
10000115c:     	b.ne	0x100001168 <_stogir.opcode.input-count+0x66c>
100001160:     	mov	x0, #0x2                ; =2
100001164:     	b	0x100001150 <_stogir.opcode.input-count+0x654>
100001168:     	mov	x17, #0x52              ; =82
10000116c:     	cmp	x0, x17
100001170:     	b.ne	0x10000117c <_stogir.opcode.input-count+0x680>
100001174:     	mov	x0, #0x2                ; =2
100001178:     	b	0x100001164 <_stogir.opcode.input-count+0x668>
10000117c:     	mov	x17, #0x53              ; =83
100001180:     	cmp	x0, x17
100001184:     	b.ne	0x100001190 <_stogir.opcode.input-count+0x694>
100001188:     	mov	x0, #0x1                ; =1
10000118c:     	b	0x100001178 <_stogir.opcode.input-count+0x67c>
100001190:     	mov	x17, #0x54              ; =84
100001194:     	cmp	x0, x17
100001198:     	b.ne	0x1000011a4 <_stogir.opcode.input-count+0x6a8>
10000119c:     	mov	x0, #0x2                ; =2
1000011a0:     	b	0x10000118c <_stogir.opcode.input-count+0x690>
1000011a4:     	mov	x17, #0x55              ; =85
1000011a8:     	cmp	x0, x17
1000011ac:     	b.ne	0x1000011b8 <_stogir.opcode.input-count+0x6bc>
1000011b0:     	mov	x0, #0x2                ; =2
1000011b4:     	b	0x1000011a0 <_stogir.opcode.input-count+0x6a4>
1000011b8:     	mov	x17, #0x56              ; =86
1000011bc:     	cmp	x0, x17
1000011c0:     	b.ne	0x1000011cc <_stogir.opcode.input-count+0x6d0>
1000011c4:     	mov	x0, #0x2                ; =2
1000011c8:     	b	0x1000011b4 <_stogir.opcode.input-count+0x6b8>
1000011cc:     	mov	x17, #0x57              ; =87
1000011d0:     	cmp	x0, x17
1000011d4:     	b.ne	0x1000011e0 <_stogir.opcode.input-count+0x6e4>
1000011d8:     	mov	x0, #0x3                ; =3
1000011dc:     	b	0x1000011c8 <_stogir.opcode.input-count+0x6cc>
1000011e0:     	mov	x17, #0x58              ; =88
1000011e4:     	cmp	x0, x17
1000011e8:     	b.ne	0x1000011f4 <_stogir.opcode.input-count+0x6f8>
1000011ec:     	mov	x0, #0x3                ; =3
1000011f0:     	b	0x1000011dc <_stogir.opcode.input-count+0x6e0>
1000011f4:     	mov	x17, #0x59              ; =89
1000011f8:     	cmp	x0, x17
1000011fc:     	b.ne	0x100001208 <_stogir.opcode.input-count+0x70c>
100001200:     	mov	x0, #0x1                ; =1
100001204:     	b	0x1000011f0 <_stogir.opcode.input-count+0x6f4>
100001208:     	mov	x17, #0x5a              ; =90
10000120c:     	cmp	x0, x17
100001210:     	b.ne	0x10000121c <_stogir.opcode.input-count+0x720>
100001214:     	mov	x0, #0x2                ; =2
100001218:     	b	0x100001204 <_stogir.opcode.input-count+0x708>
10000121c:     	mov	x17, #0x5b              ; =91
100001220:     	cmp	x0, x17
100001224:     	b.ne	0x100001230 <_stogir.opcode.input-count+0x734>
100001228:     	mov	x0, #0x2                ; =2
10000122c:     	b	0x100001218 <_stogir.opcode.input-count+0x71c>
100001230:     	mov	x17, #0x5c              ; =92
100001234:     	cmp	x0, x17
100001238:     	b.ne	0x100001244 <_stogir.opcode.input-count+0x748>
10000123c:     	mov	x0, #0x2                ; =2
100001240:     	b	0x10000122c <_stogir.opcode.input-count+0x730>
100001244:     	mov	x17, #0x5d              ; =93
100001248:     	cmp	x0, x17
10000124c:     	b.ne	0x100001258 <_stogir.opcode.input-count+0x75c>
100001250:     	mov	x0, #0x3                ; =3
100001254:     	b	0x100001240 <_stogir.opcode.input-count+0x744>
100001258:     	mov	x17, #0x5e              ; =94
10000125c:     	cmp	x0, x17
100001260:     	b.ne	0x10000126c <_stogir.opcode.input-count+0x770>
100001264:     	mov	x0, #0x3                ; =3
100001268:     	b	0x100001254 <_stogir.opcode.input-count+0x758>
10000126c:     	mov	x17, #0x5f              ; =95
100001270:     	cmp	x0, x17
100001274:     	b.ne	0x100001280 <_stogir.opcode.input-count+0x784>
100001278:     	mov	x0, #0x1                ; =1
10000127c:     	b	0x100001268 <_stogir.opcode.input-count+0x76c>
100001280:     	mov	x17, #0x60              ; =96
100001284:     	cmp	x0, x17
100001288:     	b.ne	0x100001294 <_stogir.opcode.input-count+0x798>
10000128c:     	mov	x0, #0x1                ; =1
100001290:     	b	0x10000127c <_stogir.opcode.input-count+0x780>
100001294:     	mov	x17, #0x61              ; =97
100001298:     	cmp	x0, x17
10000129c:     	b.ne	0x1000012a8 <_stogir.opcode.input-count+0x7ac>
1000012a0:     	mov	x0, #0x2                ; =2
1000012a4:     	b	0x100001290 <_stogir.opcode.input-count+0x794>
1000012a8:     	mov	x17, #0x62              ; =98
1000012ac:     	cmp	x0, x17
1000012b0:     	b.ne	0x1000012bc <_stogir.opcode.input-count+0x7c0>
1000012b4:     	mov	x0, #0x2                ; =2
1000012b8:     	b	0x1000012a4 <_stogir.opcode.input-count+0x7a8>
1000012bc:     	mov	x17, #0x63              ; =99
1000012c0:     	cmp	x0, x17
1000012c4:     	b.ne	0x1000012d0 <_stogir.opcode.input-count+0x7d4>
1000012c8:     	mov	x0, #0x3                ; =3
1000012cc:     	b	0x1000012b8 <_stogir.opcode.input-count+0x7bc>
1000012d0:     	mov	x17, #0x64              ; =100
1000012d4:     	cmp	x0, x17
1000012d8:     	b.ne	0x1000012e4 <_stogir.opcode.input-count+0x7e8>
1000012dc:     	mov	x0, #0x2                ; =2
1000012e0:     	b	0x1000012cc <_stogir.opcode.input-count+0x7d0>
1000012e4:     	mov	x17, #0x65              ; =101
1000012e8:     	cmp	x0, x17
1000012ec:     	b.ne	0x1000012f8 <_stogir.opcode.input-count+0x7fc>
1000012f0:     	mov	x0, #0x3                ; =3
1000012f4:     	b	0x1000012e0 <_stogir.opcode.input-count+0x7e4>
1000012f8:     	mov	x17, #0x66              ; =102
1000012fc:     	cmp	x0, x17
100001300:     	b.ne	0x10000130c <_stogir.opcode.input-count+0x810>
100001304:     	mov	x0, #0x3                ; =3
100001308:     	b	0x1000012f4 <_stogir.opcode.input-count+0x7f8>
10000130c:     	mov	x17, #0x67              ; =103
100001310:     	cmp	x0, x17
100001314:     	b.ne	0x100001320 <_stogir.opcode.input-count+0x824>
100001318:     	movn	x0, #0x0, lsl #48
10000131c:     	b	0x100001308 <_stogir.opcode.input-count+0x80c>
100001320:     	mov	x17, #0x68              ; =104
100001324:     	cmp	x0, x17
100001328:     	b.ne	0x100001334 <_stogir.opcode.input-count+0x838>
10000132c:     	movz	x0, #0x0, lsl #48
100001330:     	b	0x10000131c <_stogir.opcode.input-count+0x820>
100001334:     	mov	x17, #0x69              ; =105
100001338:     	cmp	x0, x17
10000133c:     	b.ne	0x100001348 <_stogir.opcode.input-count+0x84c>
100001340:     	mov	x0, #0x1                ; =1
100001344:     	b	0x100001330 <_stogir.opcode.input-count+0x834>
100001348:     	mov	x17, #0x6a              ; =106
10000134c:     	cmp	x0, x17
100001350:     	b.ne	0x10000135c <_stogir.opcode.input-count+0x860>
100001354:     	mov	x0, #0x1                ; =1
100001358:     	b	0x100001344 <_stogir.opcode.input-count+0x848>
10000135c:     	mov	x17, #0x6b              ; =107
100001360:     	cmp	x0, x17
100001364:     	b.ne	0x100001370 <_stogir.opcode.input-count+0x874>
100001368:     	mov	x0, #0x1                ; =1
10000136c:     	b	0x100001358 <_stogir.opcode.input-count+0x85c>
100001370:     	mov	x17, #0x6c              ; =108
100001374:     	cmp	x0, x17
100001378:     	b.ne	0x100001384 <_stogir.opcode.input-count+0x888>
10000137c:     	mov	x0, #0x1                ; =1
100001380:     	b	0x10000136c <_stogir.opcode.input-count+0x870>
100001384:     	mov	x17, #0x6d              ; =109
100001388:     	cmp	x0, x17
10000138c:     	b.ne	0x100001398 <_stogir.opcode.input-count+0x89c>
100001390:     	mov	x0, #0x2                ; =2
100001394:     	b	0x100001380 <_stogir.opcode.input-count+0x884>
100001398:     	mov	x17, #0x6e              ; =110
10000139c:     	cmp	x0, x17
1000013a0:     	b.ne	0x1000013ac <_stogir.opcode.input-count+0x8b0>
1000013a4:     	mov	x0, #0x3                ; =3
1000013a8:     	b	0x100001394 <_stogir.opcode.input-count+0x898>
1000013ac:     	mov	x17, #0x6f              ; =111
1000013b0:     	cmp	x0, x17
1000013b4:     	b.ne	0x1000013c0 <_stogir.opcode.input-count+0x8c4>
1000013b8:     	mov	x0, #0x1                ; =1
1000013bc:     	b	0x1000013a8 <_stogir.opcode.input-count+0x8ac>
1000013c0:     	mov	x17, #0x70              ; =112
1000013c4:     	cmp	x0, x17
1000013c8:     	b.ne	0x1000013d4 <_stogir.opcode.input-count+0x8d8>
1000013cc:     	movn	x0, #0x0, lsl #48
1000013d0:     	b	0x1000013bc <_stogir.opcode.input-count+0x8c0>
1000013d4:     	mov	x17, #0x71              ; =113
1000013d8:     	cmp	x0, x17
1000013dc:     	b.ne	0x1000013e8 <_stogir.opcode.input-count+0x8ec>
1000013e0:     	movn	x0, #0x0, lsl #48
1000013e4:     	b	0x1000013d0 <_stogir.opcode.input-count+0x8d4>
1000013e8:     	mov	x17, #0x72              ; =114
1000013ec:     	cmp	x0, x17
1000013f0:     	b.ne	0x1000013fc <_stogir.opcode.input-count+0x900>
1000013f4:     	mov	x0, #0x1                ; =1
1000013f8:     	b	0x1000013e4 <_stogir.opcode.input-count+0x8e8>
1000013fc:     	mov	x17, #0x73              ; =115
100001400:     	cmp	x0, x17
100001404:     	b.ne	0x100001410 <_stogir.opcode.input-count+0x914>
100001408:     	mov	x0, #0x1                ; =1
10000140c:     	b	0x1000013f8 <_stogir.opcode.input-count+0x8fc>
100001410:     	mov	x17, #0x74              ; =116
100001414:     	cmp	x0, x17
100001418:     	b.ne	0x100001424 <_stogir.opcode.input-count+0x928>
10000141c:     	mov	x0, #0x2                ; =2
100001420:     	b	0x10000140c <_stogir.opcode.input-count+0x910>
100001424:     	mov	x17, #0x75              ; =117
100001428:     	cmp	x0, x17
10000142c:     	b.ne	0x100001438 <_stogir.opcode.input-count+0x93c>
100001430:     	mov	x0, #0x2                ; =2
100001434:     	b	0x100001420 <_stogir.opcode.input-count+0x924>
100001438:     	mov	x17, #0x76              ; =118
10000143c:     	cmp	x0, x17
100001440:     	b.ne	0x10000144c <_stogir.opcode.input-count+0x950>
100001444:     	mov	x0, #0x2                ; =2
100001448:     	b	0x100001434 <_stogir.opcode.input-count+0x938>
10000144c:     	mov	x17, #0x77              ; =119
100001450:     	cmp	x0, x17
100001454:     	b.ne	0x100001460 <_stogir.opcode.input-count+0x964>
100001458:     	mov	x0, #0x2                ; =2
10000145c:     	b	0x100001448 <_stogir.opcode.input-count+0x94c>
100001460:     	mov	x17, #0x78              ; =120
100001464:     	cmp	x0, x17
100001468:     	b.ne	0x100001474 <_stogir.opcode.input-count+0x978>
10000146c:     	mov	x0, #0x2                ; =2
100001470:     	b	0x10000145c <_stogir.opcode.input-count+0x960>
100001474:     	mov	x17, #0x79              ; =121
100001478:     	cmp	x0, x17
10000147c:     	b.ne	0x100001488 <_stogir.opcode.input-count+0x98c>
100001480:     	mov	x0, #0x1                ; =1
100001484:     	b	0x100001470 <_stogir.opcode.input-count+0x974>
100001488:     	mov	x17, #0x7a              ; =122
10000148c:     	cmp	x0, x17
100001490:     	b.ne	0x10000149c <_stogir.opcode.input-count+0x9a0>
100001494:     	movn	x0, #0x0, lsl #48
100001498:     	b	0x100001484 <_stogir.opcode.input-count+0x988>
10000149c:     	mov	x17, #0x7b              ; =123
1000014a0:     	cmp	x0, x17
1000014a4:     	b.ne	0x1000014b0 <_stogir.opcode.input-count+0x9b4>
1000014a8:     	mov	x0, #0x1                ; =1
1000014ac:     	b	0x100001498 <_stogir.opcode.input-count+0x99c>
1000014b0:     	mov	x17, #0x7c              ; =124
1000014b4:     	cmp	x0, x17
1000014b8:     	b.ne	0x1000014c4 <_stogir.opcode.input-count+0x9c8>
1000014bc:     	mov	x0, #0x1                ; =1
1000014c0:     	b	0x1000014ac <_stogir.opcode.input-count+0x9b0>
1000014c4:     	mov	x17, #0x7d              ; =125
1000014c8:     	cmp	x0, x17
1000014cc:     	b.ne	0x1000014d8 <_stogir.opcode.input-count+0x9dc>
1000014d0:     	mov	x0, #0x2                ; =2
1000014d4:     	b	0x1000014c0 <_stogir.opcode.input-count+0x9c4>
1000014d8:     	mov	x17, #0x7e              ; =126
1000014dc:     	cmp	x0, x17
1000014e0:     	b.ne	0x1000014ec <_stogir.opcode.input-count+0x9f0>
1000014e4:     	mov	x0, #0x2                ; =2
1000014e8:     	b	0x1000014d4 <_stogir.opcode.input-count+0x9d8>
1000014ec:     	mov	x17, #0x7f              ; =127
1000014f0:     	cmp	x0, x17
1000014f4:     	b.ne	0x100001500 <_stogir.opcode.input-count+0xa04>
1000014f8:     	mov	x0, #0x3                ; =3
1000014fc:     	b	0x1000014e8 <_stogir.opcode.input-count+0x9ec>
100001500:     	mov	x17, #0x80              ; =128
100001504:     	cmp	x0, x17
100001508:     	b.ne	0x100001514 <_stogir.opcode.input-count+0xa18>
10000150c:     	mov	x0, #0x3                ; =3
100001510:     	b	0x1000014fc <_stogir.opcode.input-count+0xa00>
100001514:     	mov	x17, #0x81              ; =129
100001518:     	cmp	x0, x17
10000151c:     	b.ne	0x100001528 <_stogir.opcode.input-count+0xa2c>
100001520:     	mov	x0, #0x4                ; =4
100001524:     	b	0x100001510 <_stogir.opcode.input-count+0xa14>
100001528:     	mov	x17, #0x82              ; =130
10000152c:     	cmp	x0, x17
100001530:     	b.ne	0x10000153c <_stogir.opcode.input-count+0xa40>
100001534:     	mov	x0, #0x1                ; =1
100001538:     	b	0x100001524 <_stogir.opcode.input-count+0xa28>
10000153c:     	mov	x0, #-0x2               ; =-2
100001540:     	b	0x100001538 <_stogir.opcode.input-count+0xa3c>
