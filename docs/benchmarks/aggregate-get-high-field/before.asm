00000001000005a0 <_gap_aggregate_get>:
1000005a0:     	lsl	x1, x1, #4
1000005a4:     	ldr	x0, [x0]
1000005a8:     	add	x0, x1, x0
1000005ac:     	ldr	x1, [x0]
1000005b0:     	lsr	x1, x1, #32
1000005b4:     	ldr	x0, [x0, #0x8]
1000005b8:     	lsr	w1, w1, #0
1000005bc:     	lsr	w2, w0, #0
1000005c0:     	lsr	x0, x0, #32
1000005c4:     	sxtw	x1, w1
1000005c8:     	sxtw	x2, w2
1000005cc:     	lsr	w0, w0, #0
1000005d0:     	add	x1, x2, x1
1000005d4:     	sxtw	x0, w0
1000005d8:     	add	x0, x0, x1
1000005dc:     	ret
