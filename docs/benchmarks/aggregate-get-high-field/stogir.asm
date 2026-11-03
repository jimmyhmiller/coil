00000001000005a0 <_gap_aggregate_get>:
1000005a0:     	lsl	x1, x1, #4
1000005a4:     	ldr	x0, [x0]
1000005a8:     	add	x0, x1, x0
1000005ac:     	ldr	x1, [x0]
1000005b0:     	asr	x1, x1, #32
1000005b4:     	ldr	x0, [x0, #0x8]
1000005b8:     	lsr	w2, w0, #0
1000005bc:     	asr	x0, x0, #32
1000005c0:     	sxtw	x2, w2
1000005c4:     	add	x1, x2, x1
1000005c8:     	add	x0, x0, x1
1000005cc:     	ret
