
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/build/compiler-small-gaps/scalar-wrapper-llvm:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100001020 <_gap_scalar_wrapper>:
100001020:     	mov	w8, #0x64               ; =100
100001024:     	lsl	w9, w0, #3
100001028:     	subs	x8, x8, #0x1
10000102c:     	sub	w9, w9, w0
100001030:     	add	w9, w9, #0x3
100001034:     	and	x0, x9, #0xffff
100001038:     	b.ne	0x100001024 <_gap_scalar_wrapper+0x4>
10000103c:     	ret
